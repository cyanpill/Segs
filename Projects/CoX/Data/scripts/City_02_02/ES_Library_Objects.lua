
--Skyway City

--These contain tables for relevant, spawnable NPCs
include_lua('./Spawndefs/Clockwork_Skyway.spawndef.lua')
include_lua('./Spawndefs/Rikti_Skyway.spawndef.lua')
include_lua('./Spawndefs/Trolls_Skyway.spawndef.lua')

ES_Library_Objects = {
    ["ES_Trolls_L11_13_Around_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4"},
        ["CanSpawnDefs"] = {ShadyDeal_Trolls_L11_13_V0, ShadyDeal_Trolls_L11_13_V1, ShadyDeal_Trolls_L11_13_V2, ShadyDeal_Trolls_L11_13_V3},
      },
      ["ES_Trolls_L14_17_Around_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4"},
        ["CanSpawnDefs"] = {ShadyDeal_Trolls_L14_17_V0, ShadyDeal_Trolls_L14_17_V1, ShadyDeal_Trolls_L14_17_V2, ShadyDeal_Trolls_L14_17_V3},
      },
      ["ES_Trolls_L18_20_Around_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4"},
        ["CanSpawnDefs"] = {ShadyDeal_Trolls_L18_20_V0, ShadyDeal_Trolls_L18_20_V1, ShadyDeal_Trolls_L18_20_V2, ShadyDeal_Trolls_L18_20_V3},
      },
      ["ES_Trolls_L12_15_Around_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4"},
        ["CanSpawnDefs"] = {FightClub_Trolls_L12_15_V0, FightClub_Trolls_L12_15_V1, FightClub_Trolls_L12_15_V2, FightClub_Trolls_L12_15_V3},
      },
      ["ES_Trolls_L16_19_Around_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4"},
        ["CanSpawnDefs"] = {FightClub_Trolls_L16_19_V0, FightClub_Trolls_L16_19_V1, FightClub_Trolls_L16_19_V2, FightClub_Trolls_L16_19_V3},
      },
      ["ES_Trolls_L11_13_AroundVandalism_City_02_02"] = {
        "Encounter_V_40", "Encounter_S_31", "Encounter_S_30",
        "Encounter_E_01", "Encounter_E_06", "Encounter_E_03",
        "Encounter_E_07", "Encounter_E_09", "Encounter_E_02", 
        "Encounter_E_05", "Encounter_E_04", "Encounter_E_08",
        ["EncounterSpawn"] = "AroundVandalism",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4"},
        ["CanSpawnDefs"] = {Vandalism_Trolls_L11_13_V0, Vandalism_Trolls_L11_13_V1, Vandalism_Trolls_L11_13_V2, Vandalism_Trolls_L11_13_V3},
      },
      ["ES_Trolls_L14_17_AroundVandalism_City_02_02"] = {
        "Encounter_V_40", "Encounter_S_31", "Encounter_S_30",
        "Encounter_E_01", "Encounter_E_06", "Encounter_E_03",
        "Encounter_E_07", "Encounter_E_09", "Encounter_E_02", 
        "Encounter_E_05", "Encounter_E_04", "Encounter_E_08",
        ["EncounterSpawn"] = "AroundVandalism",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4"},
        ["CanSpawnDefs"] = {Vandalism_Trolls_L14_17_V0, Vandalism_Trolls_L14_17_V1, Vandalism_Trolls_L14_17_V2, Vandalism_Trolls_L14_17_V3},
      },
      ["ES_Trolls_L18_20_AroundVandalism_City_02_02"] = {
        "Encounter_V_40", "Encounter_S_31", "Encounter_S_30",
        "Encounter_E_01", "Encounter_E_06", "Encounter_E_03",
        "Encounter_E_07", "Encounter_E_09", "Encounter_E_02", 
        "Encounter_E_05", "Encounter_E_04", "Encounter_E_08",        
        ["EncounterSpawn"] = "AroundVandalism",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4"},
        ["CanSpawnDefs"] = {Vandalism_Trolls_L18_20_V0, Vandalism_Trolls_L18_20_V1, Vandalism_Trolls_L18_20_V2, Vandalism_Trolls_L18_20_V3},
      },
      ["ES_Trolls_L11_13_AroundDoor_City_02_02"] = {
        "Encounter_V_40", "Encounter_S_30", "Encounter_S_31",
        "Encounter_E_07", "Encounter_E_03", "Encounter_E_06",
        "Encounter_E_01", "Encounter_E_09", "Encounter_E_02", 
        "Encounter_E_05", "Encounter_E_04", "Encounter_E_08",
        ["EncounterSpawn"] = "AroundDoor",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4","CanSpawn5",},
        ["CanSpawnDefs"] = {BreakingIn_Trolls_L11_13_V0, BreakingIn_Trolls_L11_13_V1,
                            BreakingIn_Trolls_L11_13_V2, BreakingIn_Trolls_L11_13_V3,  
                            BreakingIn_Trolls_L11_13_V4,},
      },
      ["ES_Trolls_L14_17_AroundDoor_City_02_02"] = {
        "Encounter_V_40", "Encounter_S_30", "Encounter_S_31",
        "Encounter_E_07", "Encounter_E_03", "Encounter_E_06",
        "Encounter_E_01", "Encounter_E_09", "Encounter_E_02", 
        "Encounter_E_05", "Encounter_E_04", "Encounter_E_08",
        ["EncounterSpawn"] = "AroundDoor",      
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4","CanSpawn5"},
        ["CanSpawnDefs"] = {BreakingIn_Trolls_L14_17_V0, BreakingIn_Trolls_L14_17_V1, 
                            BreakingIn_Trolls_L14_17_V2, BreakingIn_Trolls_L14_17_V3, 
                            BreakingIn_Trolls_L14_17_V4},
      },
      ["ES_Trolls_L18_20_AroundDoor_City_02_02"] = {
        "Encounter_V_40", "Encounter_S_30", "Encounter_S_31",
        "Encounter_E_07", "Encounter_E_03", "Encounter_E_06",
        "Encounter_E_01", "Encounter_E_09", "Encounter_E_02", 
        "Encounter_E_05", "Encounter_E_04", "Encounter_E_08",
        ["EncounterSpawn"] = "AroundDoor",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4","CanSpawn5"},
        ["CanSpawnDefs"] = {BreakingIn_Trolls_L18_20_V0, BreakingIn_Trolls_L18_20_V1, 
                            BreakingIn_Trolls_L18_20_V2, BreakingIn_Trolls_L18_20_V3, 
                            BreakingIn_Trolls_L18_20_V4},
      },
      ["ES_Trolls_L12_15_Peddle_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_41", "Encounter_E_05",
        "Encounter_S_31", "Encounter_S_30", "Encounter_E_03",
        ["EncounterSpawn"] = "Snatch",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3"},
        ["CanSpawnDefs"] = {Peddle_Trolls_L12_15_V0, Peddle_Trolls_L12_15_V1, 
                            Peddle_Trolls_L12_15_V2},
      },
      ["ES_Trolls_L16_19_Peddle_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_41", "Encounter_E_05",
        "Encounter_S_31", "Encounter_S_30", "Encounter_E_03",
        ["EncounterSpawn"] = "Snatch",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3"},
        ["CanSpawnDefs"] = {Peddle_Trolls_L16_19_V0, Peddle_Trolls_L16_19_V1, 
                            Peddle_Trolls_L16_19_V2},
      },
      ["ES_Clockwork_L11_13_Around_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4","CanSpawn5"},
        ["CanSpawnDefs"] = {Scavenge_Clockwork_L11_13_V0, Scavenge_Clockwork_L11_13_V1, 
                            Scavenge_Clockwork_L11_13_V2, Scavenge_Clockwork_L11_13_V3, 
                            Scavenge_Clockwork_L11_13_V4},
      },
      ["ES_Clockwork_L14_17_Around_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4","CanSpawn5"},
        ["CanSpawnDefs"] = {Scavenge_Clockwork_L14_17_V0, Scavenge_Clockwork_L14_17_V1, 
                            Scavenge_Clockwork_L14_17_V2, Scavenge_Clockwork_L14_17_V3, 
                            Scavenge_Clockwork_L14_17_V4},
      },
      ["ES_Clockwork_L18_20_Around_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4","CanSpawn5"},
        ["CanSpawnDefs"] = {Scavenge_Clockwork_L18_20_V0, Scavenge_Clockwork_L18_20_V1, 
                            Scavenge_Clockwork_L18_20_V2, Scavenge_Clockwork_L18_20_V3, 
                            Scavenge_Clockwork_L18_20_V4},
      },


      ["ES_Rikti_L14_17_Around_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4","CanSpawn5"},
        ["CanSpawnDefs"] = {Preaching_RiktiBeggars_L14_17_V0, Preaching_RiktiBeggars_L14_17_V1, 
                            Preaching_RiktiBeggars_L14_17_V2, Preaching_RiktiBeggars_L14_17_V3, 
                            Preaching_RiktiBeggars_L14_17_V4},
      },
      ["ES_Rikti_L18_20_Around_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4","CanSpawn5"},
        ["CanSpawnDefs"] = {Preaching_RiktiBeggars_L18_20_V0, Preaching_RiktiBeggars_L18_20_V1, 
                            Preaching_RiktiBeggars_L18_20_V2, Preaching_RiktiBeggars_L18_20_V3, 
                            Preaching_RiktiBeggars_L18_20_V4},
      },
      ["ES_Lost_D1_Around_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4","CanSpawn5"},
        ["CanSpawnDefs"] = {Loiter_Lost_D1_V0, Loiter_Lost_D1_V1, 
                            Loiter_Lost_D1_V2, Loiter_Lost_D1_V3, 
                            Loiter_Lost_D1_V4},
      },
      ["ES_Lost_D5_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4","CanSpawn5"},
        ["CanSpawnDefs"] = {Loiter_Lost_D5_V0, Loiter_Lost_D5_V1, 
                            Loiter_Lost_D5_V2, Loiter_Lost_D5_V3, 
                            Loiter_Lost_D5_V4},
      },
      ["ES_Lost_D10_City_02_02"] = {
        "Encounter_V_40", "Encounter_V_42", "Encounter_V_41",
        "Encounter_E_06", "Encounter_E_05", "Encounter_S_31",
        "Encounter_S_30", "Encounter_E_02", "Encounter_E_01",
        "Encounter_E_08", "Encounter_S_32", "Encounter_E_07",
        "Encounter_E_03", "Encounter_E_04",
        ["EncounterSpawn"] = "Around",
        ["CanSpawn"] = {"CanSpawn1","CanSpawn2","CanSpawn3","CanSpawn4","CanSpawn5"},
        ["CanSpawnDefs"] = {Loiter_Lost_D10_V0, Loiter_Lost_D10_V1, 
                            Loiter_Lost_D10_V2, Loiter_Lost_D10_V3, 
                            Loiter_Lost_D10_V4},
      },

}


--REQUIRED: This inserts universal into this map's OL
local UniOnce
if UniOnce == false or UniOnce == nil then
    InsertUniversals()
    UniOnce = true
end