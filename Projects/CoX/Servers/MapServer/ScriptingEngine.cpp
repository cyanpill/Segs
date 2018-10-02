/*
 * SEGS - Super Entity Game Server
 * http://www.segs.io/
 * Copyright (c) 2006 - 2018 SEGS Team (see AUTHORS.md)
 * This software is licensed under the terms of the 3-clause BSD License. See LICENSE.md for details.
 */

/*!
 * @addtogroup MapServer Projects/CoX/Servers/MapServer
 * @{
 */

#include "Character.h"
#include "CharacterHelpers.h"
#include "Contact.h"
#include "DataHelpers.h"
#include "ScriptingEngine.h"
#include "MapClientSession.h"
#include "MapSceneGraph.h"
#include "Entity.h"

#include "Events/Browser.h"
#include "Events/ChatMessage.h"
#include "Events/StandardDialogCmd.h"
#include "Events/InfoMessageCmd.h"
#include "Common/NetStructures/Entity.h"
#include "Common/NetStructures/Contact.h"
#define SOL_CHECK_ARGUMENTS 1
#include <lua/lua.hpp>
#include <sol2/sol.hpp>

#include <QtCore/QDebug>

using namespace SEGSEvents;

int luaopen_package(lua_State *)
{
    assert(false && "functionality removed");
    return 0;
}

int luaopen_io(lua_State *)
{
    assert(false && "functionality removed");
    return 0;
}

int luaopen_os(lua_State *)
{
    assert(false && "functionality removed");
    return 0;
}

struct ScriptingEngine::ScriptingEnginePrivate
{
    ScriptingEnginePrivate()
    {
        m_lua.open_libraries(sol::lib::base, sol::lib::coroutine, sol::lib::table, sol::lib::string, sol::lib::math,
                             sol::lib::utf8, sol::lib::debug);

    }
    sol::state m_lua;
};

ScriptingEngine::ScriptingEngine() : m_private(new ScriptingEnginePrivate)
{
}

ScriptingEngine::~ScriptingEngine()
{
}

template<class T>
static void destruction_is_an_error(T &/*v*/)
{
    assert(false);
}
void ScriptingEngine::registerTypes()
{
    m_private->m_lua.new_usertype<glm::vec3>( "vec3",
        sol::constructors<glm::vec3(), glm::vec3(float,float,float)>(),
        "x", &glm::vec3::x,
        "y", &glm::vec3::y,
        "z", &glm::vec3::z
    );
    m_private->m_lua.new_usertype<Contact>( "Contact",
        // 3 constructors
        sol::constructors<Contact()>(),
        // gets or set the value using member variable syntax
        "name", sol::property(&Contact::getName, &Contact::setName),
        "display_name", &Contact::m_display_name
    );
    m_private->m_lua.new_usertype<MapClientSession>( "MapClientSession",

        "new", sol::no_constructor, // The client links are not constructible from the script side.
        "m_ent",  sol::readonly( &MapClientSession::m_ent ),
        "admin_chat_message", sendChatMessage,
        "simple_dialog", [](MapClientSession *cl,const char *dlgtext) {
            auto n = new StandardDialogCmd(dlgtext);
            cl->addCommandToSendNextUpdate(std::unique_ptr<StandardDialogCmd>(n));
        },
        "browser", [](MapClientSession *cl, const char *content){
            cl->addCommand<Browser>(content);
        },
        "contact_dialog",[](MapClientSession *cl, const char *message, sol::as_table_t<std::map<std::string, sol::as_table_t<std::vector<std::string>>>> buttons){
            std::vector<ContactEntry> active_contacts;
            const auto& listMap = buttons.source;

            for (const auto& kvp : listMap) {
                const std::vector<std::string>& strings = kvp.second.source;
                int count = 0;
                ContactEntry con;
                for (const auto& s: strings){
                    if(count == 0){
                        con.m_response_text = QString::fromStdString(s);
                    }else{
                         con.m_link = contactLinkHash.find(QString::fromStdString(s)).value();
                    }
                    //sendInfoMessage(MessageChannel::ADMIN, QString::fromStdString(s) ,*cl);

                    count++;
                }
                active_contacts.push_back(con);
            }

            cl->addCommand<ContactDialog>(message, active_contacts);
        },
        "close_dialog", [](MapClientSession *cl){
            cl->addCommand<ContactDialogClose>();
        },
        "sendFloatingInfo",[](MapClientSession *cl, int messageType){
            FloatingInfoMsgKey fInfoMessage = static_cast<FloatingInfoMsgKey>(messageType);
            QString message = FloatingInfoMsg.find(fInfoMessage).value();
            cl->addCommand<FloatingInfo>(cl->m_ent->m_idx, message, FloatingInfo_Attention , 4.0);
        }
        );

    m_private->m_lua.new_usertype<Character>("Character",


    "giveDebt", [](MapClientSession *cl, int debt){
        uint32_t currentDebt = getDebt(*cl->m_ent->m_char);
        uint32_t debtToGive = currentDebt + debt;
        setDebt(*cl->m_ent->m_char, debtToGive);
        QString msg = "Setting Debt to " + QString::number(debtToGive);
        qCDebug(logSlashCommand) << msg;
        sendInfoMessage(MessageChannel::DEBUG_INFO, msg, *cl);
    },
    "giveEnhancement",[](MapClientSession *cl, sol::as_table_t<std::vector<std::string>> enhancement){

        CharacterData &cd = cl->m_ent->m_char->m_char_data;
        QString name;
        uint32_t level;
        QString msg = "You do not have room for any more enhancements!";

        const auto& strings = enhancement.source;
        int count = 0;
        for (const auto& s : strings) {
            if(count == 0){
                name = QString::fromStdString(s);
            }else{
                level = QString::fromStdString(s).toInt();
            }
            count++;
        }

        if(getNumberEnhancements(cd) < 10)
        {
            msg = "Awarding Enhancement '" + name + "' to " + cl->m_ent->name();

            addEnhancementByName(cd, name, level);
            cd.m_powers_updated = true;

            QString floating_msg = FloatingInfoMsg.find(FloatingMsg_FoundEnhancement).value();
            sendFloatingInfo(*cl, floating_msg, FloatingInfoStyle::FloatingInfo_Attention, 4.0);
        }

        qCDebug(logSlashCommand).noquote() << msg;
        sendInfoMessage(MessageChannel::DEBUG_INFO, msg, *cl);
    },
    "giveEnd", [](MapClientSession *cl, float end){
        float currentEnd = getEnd(*cl->m_ent->m_char);
        float endToSet = currentEnd + end;
        setEnd(*cl->m_ent->m_char, endToSet);
        QString msg = QString("Setting Endurance to: %1").arg(endToSet);
        qCDebug(logSlashCommand) << msg;
        sendInfoMessage(MessageChannel::DEBUG_INFO, msg, *cl);
    },

    "giveHp", [](MapClientSession *cl, float hp){
        float currentHp = getHP(*cl->m_ent->m_char);
        float hpToSet = currentHp + hp;
        setHP(*cl->m_ent->m_char, hpToSet);
        QString msg = QString("Setting HP to: %1").arg(hpToSet);
        qCDebug(logSlashCommand) << msg;
        sendInfoMessage(MessageChannel::DEBUG_INFO, msg, *cl);
    },
    "giveInf", [](MapClientSession *cl, int inf){
        uint32_t currentInf = getInf(*cl->m_ent->m_char);
        uint32_t infToSet = currentInf + inf;
        setInf(*cl->m_ent->m_char, infToSet);
        sendInfoMessage(MessageChannel::DEBUG_INFO, QString("Setting inf to %1").arg(infToSet), *cl);
    },
    "giveInsp", [](MapClientSession *cl, const char *value){

        CharacterData &cd = cl->m_ent->m_char->m_char_data;
        QString val = QString::fromUtf8(value);
        QString msg = "You do not have room for any more inspirations!";

        if(getNumberInspirations(cd) < getMaxNumberInspirations(cd))
        {
            msg = "Awarding Inspiration '" + val + "' to " + cl->m_ent->name();

            addInspirationByName(cd, val);
            cd.m_powers_updated = true;

            // NOTE: floating message shows no message here, but plays the awarding insp sound!
            QString floating_msg = FloatingInfoMsg.find(FloatingMsg_FoundInspiration).value();
            sendFloatingInfo(*cl, floating_msg, FloatingInfoStyle::FloatingInfo_Attention, 4.0);
        }

        qCDebug(logSlashCommand).noquote() << msg;
        sendInfoMessage(MessageChannel::DEBUG_INFO, msg, *cl);
    },
    "giveXp", [](MapClientSession *cl, int xp){
        uint32_t lvl = getLevel(*cl->m_ent->m_char);
        uint32_t currentXp = getXP(*cl->m_ent->m_char);

        // Calculate XP - Debt difference by server settings?

        uint32_t currentDebt = getDebt(*cl->m_ent->m_char);
        if(currentDebt > 0){
            uint32_t debtToPay = 0;
            uint32_t halfXp = xp / 2;
            if(currentDebt > halfXp){
                debtToPay = halfXp; //Half to debt
                xp = halfXp;

            }else{
                debtToPay = currentDebt;
                xp = xp - currentDebt;
            }
            uint32_t newDebt = currentDebt - debtToPay;
            setDebt(*cl->m_ent->m_char, newDebt);
            sendInfoMessage(MessageChannel::DEBUG_INFO, QString("You paid %1 to your debt").arg(debtToPay), *cl);
        }
        uint32_t xpToGive = currentXp + xp;
        setXP(*cl->m_ent->m_char, xpToGive);
        sendInfoMessage(MessageChannel::DEBUG_INFO, QString("You were awarded %1 XP").arg(xp), *cl);
        QString msg = "Setting XP to " + QString::number(xpToGive);
        uint32_t newlvl = getLevel(*cl->m_ent->m_char);
        sendInfoMessage(MessageChannel::DEBUG_INFO, QString("You were lvl %1 now %2").arg(lvl).arg(newlvl), *cl);

        //This check doesn't show level change

        if(newlvl != lvl){
            cl->addCommand<FloatingInfo>(cl->m_ent->m_idx, FloatingInfoMsg.find(FloatingMsg_Leveled).value(), FloatingInfo_Attention , 4.0);
            msg += " and LVL to " + QString::number(newlvl);
        }
        qCDebug(logSlashCommand) << msg;
        sendInfoMessage(MessageChannel::DEBUG_INFO, msg, *cl);
    }

    );

    m_private->m_lua.new_usertype<Entity>( "Entity",
        "new",    sol::no_constructor, // not constructible from the script side.
        sol::meta_function::garbage_collect, sol::destructor( destruction_is_an_error<Entity> ),
        "abort_logout",  abortLogout,
        "begin_logout",  &Entity::beginLogout
    );
    m_private->m_lua.new_usertype<MapSceneGraph>( "MapSceneGraph",
        "new", sol::no_constructor, // The client links are not constructible from the script side.
        "set_default_spawn_point", &MapSceneGraph::set_default_spawn_point
    );
    m_private->m_lua.script("function ErrorHandler(msg) return \"Lua call error:\"..msg end");
    m_private->m_lua["contactTable"] = m_private->m_lua.create_named_table("contactTable");
}

int ScriptingEngine::loadAndRunFile(const QString &filename)
{
    sol::load_result load_res=m_private->m_lua.load_file(filename.toStdString());
    if(!load_res.valid())
    {
        sol::error err = load_res;
        qCritical() << err.what();
        return -1;
    }
    sol::protected_function_result script_result = load_res();
    if(!script_result.valid())
    {
        sol::error err = script_result;
        qCritical() << err.what();
        return -1;
    }
    return 0;
}

std::string ScriptingEngine::callFuncWithClientContext(MapClientSession *client, const char *name, int arg1)
{
    m_private->m_lua["client"] = client;
    m_private->m_lua["heroName"] = qPrintable(client->m_name);
    return callFunc(name,arg1);
}

std::string ScriptingEngine::callFunc(const char *name, int arg1)
{
    sol::protected_function funcwrap = m_private->m_lua[name];
    funcwrap.error_handler = m_private->m_lua["ErrorHandler"];
    if(!funcwrap.valid())
    {
        qCritical() << "Failed to retrieve script func:"<<name;
        return "";
    }
    auto result = funcwrap(arg1);
    if(!result.valid())
    {
        sol::error err = result;
        qCritical() << "Failed to run script func:"<<name<<err.what();
        return "";
    }
    return result.get<std::string>();
}

int ScriptingEngine::runScript(MapClientSession * client, const QString &script_contents, const char *script_name)
{
    m_private->m_lua["client"] = client;
    m_private->m_lua["heroName"] = qPrintable(client->m_name);
    sol::load_result load_res=m_private->m_lua.load(script_contents.toStdString(),script_name);
    if(!load_res.valid())
    {
        sol::error err = load_res;
        sendInfoMessage(MessageChannel::ADMIN,err.what(),*client);
        return -1;
    }
    sol::protected_function_result script_result = load_res();
    if(!script_result.valid())
    {
        sol::error err = script_result;
        sendInfoMessage(MessageChannel::ADMIN,err.what(),*client);
        return -1;
    }
    return 0;
}

int ScriptingEngine::runScript(const QString &script_contents, const char *script_name)
{
    sol::load_result load_res = m_private->m_lua.load(script_contents.toStdString(), script_name);
    if (!load_res.valid())
    {
        sol::error err = load_res;
        // TODO: report error here.
        return -1;
    }
    sol::protected_function_result script_result = load_res();
    if (!script_result.valid())
    {
        sol::error err = script_result;
        // TODO: report error here.
        return -1;
    }
    return 0;
}

//! @}
