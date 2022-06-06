local rubick = {
    spellkey = Menu.AddKeyOption({"Hero Specific", "Rubick"}, "AI Rubick AUTO CAST Spell Key", Enum.ButtonCode.KEY_SPACE),
    time = 0,
    heath = 0,
    time2 = 0,
    heath2 = 0,
    spellsound = {},
    spellinfo = {},
    casttime = {},
    cooldown = {},
    spellrange = {},
    ignorespells = {},
    teammate = nil,
    throw_pos = nil,
    shrapnel_pos = nil,
    throw_allies = false
}

function rubick.OnGameEnd()
    rubick.time = 0
    rubick.heath = 0
    rubick.time2 = 0
    rubick.heath2 = 0
    rubick.spellsound = {}
    rubick.spellinfo = {}
    rubick.casttime = {}
    rubick.cooldown = {}
    rubick.spellrange = {}
    rubick.ignorespells = {}
    rubick.teammate = nil
    rubick.throw_pos = nil
    rubick.shrapnel_pos = nil
    rubick.throw_allies = false
end

function rubick.ignorespell(name)
    rubick.ignorespells[name] = true
end

rubick.ignorespell("ancient_apparition_chilling_touch")
rubick.ignorespell("axe_berserkers_call")
rubick.ignorespell("axe_culling_blade")
rubick.ignorespell("bane_nightmare")
rubick.ignorespell("batrider_sticky_napalm")
rubick.ignorespell("bloodseeker_bloodrage")
rubick.ignorespell("bounty_hunter_wind_walk")
rubick.ignorespell("beastmaster_call_of_the_wild")
rubick.ignorespell("beastmaster_call_of_the_wild_boar")
rubick.ignorespell("beastmaster_call_of_the_wild_hawk")
rubick.ignorespell("broodmother_spin_web")
rubick.ignorespell("centaur_double_edge")
rubick.ignorespell("centaur_return")
rubick.ignorespell("chaos_knight_reality_rift")
rubick.ignorespell("chen_holy_persuasion")
rubick.ignorespell("clinkz_wind_walk")
rubick.ignorespell("dazzle_shallow_grave")
rubick.ignorespell("doom_bringer_devour")
rubick.ignorespell("doom_bringer_infernal_blade")
rubick.ignorespell("drow_ranger_trueshot")
rubick.ignorespell("earth_spirit_boulder_smash")
rubick.ignorespell("earth_spirit_rolling_boulder")
rubick.ignorespell("earth_spirit_geomagnetic_grip")
rubick.ignorespell("enigma_demonic_conversion")
rubick.ignorespell("faceless_void_time_walk")
rubick.ignorespell("faceless_void_time_dilation")
rubick.ignorespell("faceless_void_chronosphere")
rubick.ignorespell("furion_sprout")
rubick.ignorespell("furion_teleportation")
rubick.ignorespell("furion_force_of_nature")
rubick.ignorespell("huskar_life_break")
rubick.ignorespell("invoker_ghost_walk")
rubick.ignorespell("invoker_invoke")
rubick.ignorespell("jakiro_liquid_fire")
rubick.ignorespell("kunkka_tidebringer")
rubick.ignorespell("kunkka_x_marks_the_spot")
rubick.ignorespell("legion_commander_duel")
rubick.ignorespell("lich_sinister_gaze")
rubick.ignorespell("lion_mana_drain")
rubick.ignorespell("lone_druid_spirit_bear")
rubick.ignorespell("lone_druid_spirit_link")
rubick.ignorespell("lone_druid_savage_roar")
rubick.ignorespell("lone_druid_true_form_battle_cry")
rubick.ignorespell("medusa_mana_shield")
rubick.ignorespell("meepo_poof")
rubick.ignorespell("magnataur_empower")
rubick.ignorespell("magnataur_skewer")
rubick.ignorespell("morphling_adaptive_strike_str")
rubick.ignorespell("morphling_morph_agi")
rubick.ignorespell("morphling_morph_str")
rubick.ignorespell("monkey_king_tree_dance")
rubick.ignorespell("nevermore_requiem")
rubick.ignorespell("pudge_rot")
rubick.ignorespell("phantom_assassin_stifling_dagger")
rubick.ignorespell("phantom_assassin_phantom_strike")
rubick.ignorespell("phantom_assassin_blur")
rubick.ignorespell("phantom_lancer_doppelwalk")
rubick.ignorespell("queenofpain_blink")
rubick.ignorespell("rattletrap_battery_assault")
rubick.ignorespell("rattletrap_power_cogs")
rubick.ignorespell("riki_blink_strike")
rubick.ignorespell("rubick_telekinesis")
rubick.ignorespell("rubick_fade_bolt")
rubick.ignorespell("sandking_sand_storm")
rubick.ignorespell("shredder_chakram_2")
rubick.ignorespell("sniper_take_aim")
rubick.ignorespell("spirit_breaker_charge_of_darkness")
rubick.ignorespell("spirit_breaker_empowering_haste")
rubick.ignorespell("spirit_breaker_nether_strike")
rubick.ignorespell("techies_land_mines")
rubick.ignorespell("techies_stasis_trap")
rubick.ignorespell("techies_suicide")
rubick.ignorespell("terrorblade_conjure_image")
rubick.ignorespell("tiny_craggy_exterior")
rubick.ignorespell("tiny_toss_tree")
rubick.ignorespell("treant_natures_guise")
rubick.ignorespell("troll_warlord_berserkers_rage")
rubick.ignorespell("troll_warlord_whirling_axes_ranged")
rubick.ignorespell("troll_warlord_battle_trance")
rubick.ignorespell("tusk_walrus_kick")
rubick.ignorespell("ursa_earthshock")
rubick.ignorespell("ursa_overpower")
rubick.ignorespell("weaver_shukuchi")
rubick.ignorespell("wisp_tether")
rubick.ignorespell("wisp_relocate")
rubick.ignorespell("witch_doctor_voodoo_restoration")
rubick.ignorespell("bristleback_viscous_nasal_goo")
rubick.ignorespell("bristleback_quill_spray")
rubick.ignorespell("storm_spirit_ball_lightning")
rubick.ignorespell("mars_arena_of_blood")
rubick.ignorespell("faceless_void_time_dilation")
rubick.ignorespell("vengefulspirit_nether_swap")
rubick.ignorespell("invoker_invoke")
rubick.ignorespell("naga_siren_song_of_the_siren")
rubick.ignorespell("naga_siren_song_of_the_siren_cancel")
rubick.ignorespell("puck_phase_shift")
rubick.ignorespell("alchemist_unstable_concoction")
rubick.ignorespell("alchemist_unstable_concoction_throw")
rubick.ignorespell("ancient_apparition_ice_blast_release")
rubick.ignorespell("venomancer_plague_ward")
rubick.ignorespell("clinkz_searing_arrows")
rubick.ignorespell("life_stealer_rage")
rubick.ignorespell("life_stealer_open_wounds")
rubick.ignorespell("life_stealer_infest")
rubick.ignorespell("tusk_tag_team")
rubick.ignorespell("tusk_walrus_kick")
rubick.ignorespell("phoenix_icarus_dive")
rubick.ignorespell("phoenix_fire_spirits")
rubick.ignorespell("phoenix_launch_fire_spirit")
rubick.ignorespell("antimage_blink")
rubick.ignorespell("abaddon_borrowed_time")
rubick.ignorespell("hoodwink_scurry")
rubick.ignorespell("templar_assassin_meld")
rubick.ignorespell("mars_bulwark")
rubick.ignorespell("skeleton_king_vampiric_aura")
rubick.ignorespell("zuus_static_field")
rubick.ignorespell("phantom_lancer_phantom_edge")
rubick.ignorespell("disruptor_glimpse")

function rubick.OnUpdate()
    local me = Heroes.GetLocal()
    if me and NPC.GetUnitName(me) ~= "npc_dota_hero_rubick" then return end

    local summontable = {}
    for i = 1, NPCs.Count() do
        local npc = NPCs.Get(i)
        if npc and npc ~= me and Entity.IsSameTeam(me, npc) and Entity.IsAlive(npc) and (Entity.GetOwner(me) == Entity.GetOwner(npc) or Entity.OwnedBy(npc, me)) then
            table.insert(summontable, npc)
        end
    end

    local telekinesis, fadebolt, spell, spell2, spellsteal = NPC.GetAbilityByIndex(me, 0), NPC.GetAbilityByIndex(me, 1), NPC.GetAbilityByIndex(me, 3), NPC.GetAbilityByIndex(me, 4), NPC.GetAbilityByIndex(me, 5)
    local sheep, eb, blink, lens, forward = NPC.GetItem(me, "item_sheepstick"), NPC.GetItem(me, "item_ethereal_blade"), NPC.GetItem(me, "item_blink") or NPC.GetItem(me, "item_arcane_blink"), NPC.GetItem(me, "item_aether_lens"), NPC.GetItem(me, "item_force_staff") or NPC.GetItem(me, "item_hurricane_pike")
    local enemies, throw = {}, false

    local bonuses_range = 0
    if NPC.GetAbility(me, "special_bonus_cast_range_125") and Ability.GetLevel(NPC.GetAbility(me, "special_bonus_cast_range_125")) > 0 then
        bonuses_range = bonuses_range + 125
    elseif lens then
        bonuses_range = bonuses_range + 250
    end
    if NPC.GetAbility(me, "special_bonus_unique_rubick") and Ability.GetLevel(NPC.GetAbility(me, "special_bonus_unique_rubick")) > 0 then
        throw_range = 837.5
    else
        throw_range = 537.5
    end
    if NPC.GetAbility(me, "special_bonus_unique_rubick_5") and Ability.GetLevel(NPC.GetAbility(me, "special_bonus_unique_rubick_5")) > 0 then
        amp = 1.5
    else
        amp = 1
    end

    local near_mouse = Input.GetNearestHeroToCursor(Entity.GetTeamNum(me), Enum.TeamType.TEAM_ENEMY), nil, nil, {}
    if not target and near_mouse and NPC.IsPositionInRange(near_mouse, Input.GetWorldCursorPos(), 330) then
        target = near_mouse
    elseif target and (not Entity.IsAlive(me) or not Entity.IsAlive(target) or Entity.IsDormant(target)) then
        target = nil
    end

    if spell then
        local distance = Ability.GetCastRange(spell)
        local stealrange = Ability.GetCastRange(spellsteal) + bonuses_range
        local isbad, isdisable, isevade, IsSupport, isblinking = false, false, false, false, false
        for key, lib in pairs(
            {
                {name = "ancient_apparition_ice_blast", radius = 99999},
                {name = "ancient_apparition_ice_blast_release", radius = 99999},
                {name = "antimage_blink", radius = 1700, type = "nervous"},
                {name = "antimage_counterspell", radius = 1000, type = "nervous"},
                {name = "arc_warden_tempest_double", radius = 1150},
                {name = "abyssal_underlord_pit_of_malice", type = "disable"},
                {name = "alchemist_unstable_concoction", type = "disable"},
                {name = "alchemist_unstable_concoction_throw", type = "disable"},
                {name = "alchemist_chemical_rage", radius = 1000, type = "evade"},
                {name = "alchemist_unstable_concoction", type = "disable"},
                {name = "ancient_apparition_cold_feet", type = "disable"},
                {name = "axe_berserkers_call", radius = 300, type = "bad"},
                {name = "axe_culling_blade", type = "bad"},
                {name = "bane_fiends_grip", type = "disable"},
                {name = "batrider_firefly", radius = 550},
                {name = "batrider_flaming_lasso", type = "disable"},
                {name = "beastmaster_primal_roar", type = "disable"},
                {name = "brewmaster_thunder_clap", radius = 400},
                {name = "brewmaster_drunken_brawler", radius = 550},
                {name = "brewmaster_primal_split", radius = 550},
                {name = "bristleback_quill_spray", radius = 650},
                {name = "bounty_hunter_wind_walk", radius = 2000},
                {name = "bloodseeker_bloodrage", radius = 99999},
                {name = "broodmother_insatiable_hunger", radius = 550},
                {name = "centaur_hoof_stomp", type = "disable", radius = 315},
                {name = "centaur_stampede", radius = 99999},
                {name = "chaos_knight_chaos_bolt", type = "disable"},
                {name = "chaos_knight_phantasm", radius = 550},
                {name = "chen_divine_favor", radius = 99999, type = "support"},
                {name = "chen_hand_of_god", radius = 99999, type = "support"},
                {name = "clinkz_strafe", radius = 550, type = "nervous"},
                {name = "clinkz_wind_walk", radius = 2000},
                {name = "crystal_maiden_freezing_field", radius = 600, blink = "use"},
                {name = "dazzle_shadow_wave", type = "support"},
                {name = "dark_willow_shadow_realm", radius = 1150, type = "nervous"},
                {name = "dark_willow_bedlam", radius = 300},
                {name = "death_prophet_exorcism", radius = 1000},
                {name = "doom_bringer_scorched_earth", radius = 600},
                {name = "dragon_knight_dragon_tail", type = "disable"},
                {name = "dragon_knight_elder_dragon_form", radius = 550},
                {name = "drow_ranger_trueshot", radius = 99999},
                {name = "drow_ranger_multishot", radius = 1000},
                {name = "ember_spirit_searing_chains", radius = 400},
                {name = "ember_spirit_flame_guard", radius = 400},
                {name = "earthshaker_fissure", type = "disable"},
                {name = "earthshaker_enchant_totem", radius = 550},
                {name = "earthshaker_echo_slam", radius = 600, blink = "use"},
                {name = "enchantress_natures_attendants", radius = 900, type = "support"},
                {name = "enigma_malefice", type = "disable"},
                {name = "enigma_black_hole", type = "disable", blink = "use"},
                {name = "faceless_void_chronosphere", radius = 425},
                {name = "furion_wrath_of_nature", radius = 99999},
                {name = "gyrocopter_rocket_barrage", radius = 400},
                {name = "gyrocopter_flak_cannon", radius = 1250},
                {name = "huskar_inner_fire", radius = 500},
                {name = "invoker_forge_spirit", radius = 1200},
                {name = "invoker_ice_wall", radius = 700}, -- unfinished?
                {name = "invoker_sun_strike", radius = 99999},
                {name = "juggernaut_blade_fury", radius = 250, type = "nervous"},
                {name = "juggernaut_healing_ward", radius = 99999, type = "support"},
                {name = "invoker_cold_snap", type = "disable"},
                {name = "invoker_tornado", type = "disable"},
                {name = "jakiro_ice_path", type = "disable"},
                {name = "keeper_of_the_light_will_o_wisp", type = "disable"},
                {name = "legion_commander_duel", type = "bad"},
                {name = "leshrac_split_earth", type = "disable"},
                {name = "leshrac_diabolic_edict", radius = 500},
                {name = "leshrac_pulse_nova", radius = 99999},
                {name = "lich_sinister_gaze", type = "disable"},
                {name = "life_stealer_rage", radius = 550, type = "nervous"},
                {name = "lina_light_strike_array", type = "disable"},
                {name = "lion_impale", type = "disable"},
                {name = "lion_voodoo", type = "disable"},
                {name = "lone_druid_spirit_bear", radius = 99999},
                {name = "lone_druid_spirit_link", radius = 550},
                {name = "lone_druid_savage_roar", radius = 325},
                {name = "lone_druid_true_form", radius = 550},
                {name = "luna_lucent_beam", type = "disable"},
                {name = "luna_eclipse", radius = 675},
                {name = "lycan_summon_wolves", radius = 1000},
                {name = "lycan_howl", radius = 3000},
                {name = "lycan_shapeshift", radius = 550},
                {name = "magnataur_reverse_polarity", radius = 410, type = "disable", blink = "use"},
                {name = "mars_spear", radius = 900, type = "disable"},
                {name = "mars_gods_rebuke", radius = 500},
                {name = "medusa_stone_gaze", radius = 1000},
                {name = "meepo_poof", radius = 375, type = "bad"},
                {name = "mirana_starfall", radius = 650},
                {name = "mirana_arrow", type = "disable"},
                {name = "mirana_invis", radius = 99999},
                {name = "monkey_king_boundless_strike", type = "disable"},
                {name = "monkey_king_mischief", radius = 550, type = "nervous"},
                {name = "naga_siren_mirror_image", radius = 550},
                {name = "nevermore_shadowraze1", radius = 450},
                {name = "nevermore_shadowraze2", radius = 700},
                {name = "nevermore_shadowraze3", radius = 950},
                {name = "naga_siren_song_of_the_siren", radius = 1400},
                {name = "necrolyte_death_pulse", radius = 475},
                {name = "necrolyte_sadist", radius = 750}, -- unfinished
                {name = "night_stalker_crippling_fear", radius = 375},
                {name = "nyx_assassin_impale", type = "disable"},
                {name = "nyx_assassin_spiked_carapace", radius = 550},
                {name = "nyx_assassin_vendetta", radius = 99999},
                {name = "obsidian_destroyer_equilibrium", radius = 550},
                {name = "ogre_magi_fireblast", type = "disable"},
                {name = "ogre_magi_unrefined_fireblast", type = "disable"},
                {name = "omniknight_purification", type = "support"},
                {name = "omniknight_guardian_angel", radius = 1200},
                {name = "pangolier_swashbuckle", radius = 2000},
                {name = "pangolier_shield_crash", radius = 500},
                {name = "pangolier_gyroshell", radius = 660},
                {name = "pangolier_gyroshell_stop", radius = 99999},
                {name = "phoenix_icarus_dive", radius = 1400},
                {name = "phoenix_supernova", radius = 1300,  type = "support"}, 
                {name = "puck_waning_rift", radius = 800},
                {name = "pugna_nether_ward", radius = 1600},
                {name = "pudge_rot", radius = 250, type = "bad"},
                {name = "puck_phase_shift", radius = 900, type = "nervous"}, 
                {name = "queenofpain_blink", radius = 1850},
                {name = "queenofpain_scream_of_pain", radius = 475},
                {name = "rattletrap_battery_assault", radius = 275},
                {name = "rattletrap_rocket_flare", radius = 99999},
                {name = "razor_plasma_field", radius = 700},
                {name = "razor_eye_of_the_storm", radius = 550},
                {name = "riki_tricks_of_the_trade", radius = 450},
                {name = "sandking_burrowstrike", type = "disable"},
                {name = "sandking_sand_storm", radius = 650},
                {name = "sandking_epicenter", radius = 550, blink = "use"}, 
                {name = "shadow_shaman_ether_shock", type = "disable"},
                {name = "shadow_shaman_voodoo", type = "disable"},
                {name = "shredder_whirling_death", radius = 300},
                {name = "shredder_return_chakram", radius = 99999},
                {name = "shredder_return_chakram_2", radius = 99999},
                {name = "silencer_global_silence", radius = 99999},
                {name = "skeleton_king_hellfire_blast", type = "disable"},
                {name = "slardar_slithereen_crush", radius = 350, type = "disable"},
                {name = "slardar_sprint", radius = 320},
                {name = "slark_dark_pact", radius = 325},
                {name = "slark_pounce", radius = 700},
                {name = "slark_shadow_dance", radius = 550},
                {name = "sniper_take_aim", radius = 99999},
                {name = "spectre_haunt", radius = 99999},
                {name = "spirit_breaker_bulldoze", radius = 1500},
                {name = "storm_spirit_static_remnant", radius = 275, type = "bad"},
                {name = "storm_spirit_electric_vortex", type = "disable"},
                {name = "sven_storm_bolt", type = "disable"},
                {name = "sven_warcry", radius = 550},
                {name = "sven_gods_strength", radius = 550},
                {name = "templar_assassin_refraction", radius = 550},
                {name = "templar_assassin_meld", radius = 550},
                {name = "terrorblade_reflection", radius = 900},
                {name = "terrorblade_conjure_image", radius = 550},
                {name = "terrorblade_metamorphosis", radius = 550},
                {name = "tidehunter_anchor_smash", radius = 375},
                {name = "tidehunter_ravage", radius = 1250, type = "disable", blink = "use"},
                {name = "tinker_heat_seeking_missile", radius = 2500},
                {name = "tinker_rearm", radius = 900, blink = "use"},
                {name = "tiny_avalanche", type = "disable"},
                {name = "treant_living_armor", radius = 99999, type = "support"},
                {name = "treant_overgrowth", radius = 800},
                {name = "troll_warlord_whirling_axes_melee", radius = 450},
                {name = "tusk_snowball", type = "disable"},
                {name = "tusk_tag_team", radius = 350},
                {name = "tusk_walrus_punch", radius = 550},
                {name = "undying_flesh_golem", radius = 700},
                {name = "ursa_earthshock", radius = 385},
                {name = "ursa_overpower", radius = 550},
                {name = "ursa_enrage", radius = 550},
                {name = "venomancer_poison_nova", radius = 830},
                {name = "vengefulspirit_magic_missile", type = "disable"},
                {name = "visage_summon_familiars", radius = 99999},
                {name = "weaver_time_lapse", radius = 1200, type = "support"},
                {name = "winter_wyvern_cold_embrace", type = "support"},
                {name = "windrunner_shackleshot", type = "disable"},
                {name = "windrunner_windrun", radius = 1000},
                {name = "wisp_spirits", radius = 700},
                {name = "wisp_overcharge", radius = 550},
                {name = "witch_doctor_paralyzing_cask", type = "disable"},
                {name = "zuus_cloud", radius = 99999},
                {name = "zuus_thundergods_wrath", radius = 99999},
                {name = "void_spirit_aether_remnant", radius = 1450, type = "disable"},
                {name = "void_spirit_resonant_pulse", radius = 485},
                {name = "void_spirit_dissimilate", radius = 750},
                {name = "void_spirit_astral_step", radius = 1100},
                {name = "snapfire_firesnap_cookie", radius = 1300, type = "disable"},
                {name = "snapfire_mortimer_kisses", radius = 3000},
                {name = "snapfire_gobble_up", radius = 3000, type = "disable"},
                {name = "dark_seer_ion_shell", type = "support"},
                {name = "hoodwink_bushwhack", type = "disable"},
                {name = "terrorblade_terror_wave", type = "disable", blink = "use"}
            }
        ) do
            if lib then
                if Ability.GetName(spell) == lib.name then
                    if lib.type == "bad" then isbad = true else isbad = false end
                    if lib.type == "evade" then end
                    if lib.type == "disable" then isdisable = true else isdisable = false end
                    if lib.radius ~= nil then distance = lib.radius - 60 end
                    if lib.blink == "use" then
                        if Ability.GetName(spell) ~= "sandking_epicenter" then
                            if blink and Ability.IsReady(blink) and Ability.IsReady(spell) then
                                isblinking = true
                            else
                                isblinking = false
                            end
                        else
                            if blink and Ability.IsReady(blink) then
                                if Ability.IsReady(spell) then
                                    distance = 1199
                                else
                                    distance = 550
                                end
                                if NPC.HasModifier(me, "modifier_sand_king_epicenter") then
                                    isblinking = true
                                else
                                    isblinking = false
                                end
                            end
                        end

                    end
                    if lib.type == "support" or Ability.GetName(spell) == "snapfire_firesnap_cookie" then
                        IsSupport = true
                        if not rubick.teammate then
                            for key, friend in ipairs(Entity.GetHeroesInRadius(me, 1000 ,Enum.TeamType.TEAM_FRIEND)) do
                                if friend and Entity.IsAlive(friend) then
                                    rubick.teammate = friend
                                end
                            end
                        else
                            rubick.teammate = nil
                        end
                    else
                        IsSupport = false
                    end
                end
                if not rubick.spellrange[lib.name] then
                    rubick.spellrange[lib.name] = lib.radius
                end
            end
        end

        if NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed") then
            if Ability.GetName(spell) == "sandking_burrowstrike" then
                distance = Ability.GetLevelSpecialValueFor(spell, "cast_range_scepter")
            elseif Ability.GetName(spell) == "wisp_spirits_in" then
                distance = 1025
            elseif Ability.GetName(spell) == "luna_eclipse" then
                distance = 2500
            end
            stealrange = stealrange + 390
        else
            if Ability.GetName(spell) == "wisp_spirits_in" then
                distance = 700
            end
        end

        if Ability.GetName(spell) == "wisp_spirits_in" or Ability.GetName(spell) == "shredder_return_chakram" or Ability.GetName(spell) == "pangolier_gyroshell_stop" or  Ability.GetCooldown(spell) > 0 or ((Ability.GetName(spell) == "slark_pounce" or Ability.GetName(spell) == "ember_spirit_fire_remnant" or Ability.GetName(spell) == "sniper_shrapnel" or Ability.GetName(spell) == "void_spirit_resonant_pulse" or Ability.GetName(spell) == "void_spirit_astral_step" or Ability.GetName(spell) == "hoodwink_scurry") and Ability.GetCurrentCharges(spell) == 0) then
            if Ability.GetName(spell) == "void_spirit_resonant_pulse"then
                if NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed") then rubick.cooldown[Ability.GetName(spell)] = 32 else rubick.cooldown[Ability.GetName(spell)] = 16 end
            elseif Ability.GetName(spell) == "void_spirit_astral_step" then
                if Ability.GetLevel(spell) == 1 then
                    rubick.cooldown[Ability.GetName(spell)] = 60
                elseif Ability.GetLevel(spell) == 2 then
                    rubick.cooldown[Ability.GetName(spell)] = 50
                elseif Ability.GetLevel(spell) == 3 then
                    rubick.cooldown[Ability.GetName(spell)] = 40
                end
            elseif Ability.GetName(spell) == "ember_spirit_fire_remnant" then
                if NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed") then
                    rubick.cooldown[Ability.GetName(spell)] = 190
                else
                    rubick.cooldown[Ability.GetName(spell)] = 114
                end
            elseif Ability.GetName(spell) == "sniper_shrapnel" then
                rubick.cooldown[Ability.GetName(spell)] = 175
            elseif Ability.GetName(spell) == "wisp_spirits_in" then
                rubick.cooldown[Ability.GetName(spell)] = 20
            elseif Ability.GetName(spell) == "pangolier_gyroshell_stop" then
                rubick.cooldown[Ability.GetName(spell)] = 70
            elseif Ability.GetName(spell) == "shredder_return_chakram" then
                rubick.cooldown["shredder_chakram"] = 8
            elseif Ability.GetName(spell) == "hoodwink_scurry" then
                rubick.cooldown[Ability.GetName(spell)] = 30
            elseif Ability.GetCooldownLength(spell) > 0 then
                rubick.cooldown[Ability.GetName(spell)] = Ability.GetCooldownLength(spell)
            end
            rubick.casttime[Ability.GetName(spell)] = GameRules.GetGameTime()
        end

        for enemyindex = 1, Heroes.Count() do
            local enemy = Heroes.Get(enemyindex)
            if enemy and not Entity.IsSameTeam(me, enemy) then
                for i = 0, 24 do
                    local enemyspell = NPC.GetAbilityByIndex(enemy, i)
                    if enemyspell and not Ability.IsAttributes(enemyspell) and (not Ability.IsPassive(enemyspell) or Ability.IsPassive(enemyspell) and Ability.IsActivated(enemyspell)) and Entity.IsAbility(enemyspell) then
                        if Ability.SecondsSinceLastUse(enemyspell) > 0 and Ability.SecondsSinceLastUse(enemyspell) < 0.1 or Ability.GetToggleState(enemyspell) or rubick.spellsound[NPC.GetUnitName(enemy)] and rubick.spellsound[NPC.GetUnitName(enemy)] ~= Ability.GetName(spell) and rubick.spellsound[NPC.GetUnitName(enemy)] == Ability.GetName(enemyspell) or Ability.GetName(enemyspell) == "ancient_apparition_ice_blast" and Ability.IsInAbilityPhase(enemyspell) then
                            rubick.spellinfo[enemy] = {spell = enemyspell, radius = rubick.spellrange[Ability.GetName(enemyspell)], time = rubick.cooldown[Ability.GetName(enemyspell)]}
                            --Console.Print(Ability.GetName(enemyspell))
                        end
                    end
                end
            end
        end

        for enemy, value in pairs(rubick.spellinfo) do
            if value then
                if enemy and not Entity.IsDormant(enemy) and Entity.IsAlive(enemy) and not rubick.ignorespells[Ability.GetName(value.spell)] then
                    if Entity.IsAlive(me) and not NPC.IsChannellingAbility(me) and spellsteal and Ability.IsReady(spellsteal) and NPC.IsEntityInRange(me, enemy, stealrange) and Ability.GetName(spell) ~= Ability.GetName(value.spell) and not NPC.HasState(me, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) and not NPC.HasModifier(me, "modifier_phoenix_sun_ray") and not NPC.HasModifier(me, "modifier_ember_spirit_fire_remnant_timer") then
                        if not rubick.casttime[Ability.GetName(value.spell)] or rubick.casttime[Ability.GetName(value.spell)] and value.time and ((GameRules.GetGameTime() - rubick.casttime[Ability.GetName(value.spell)])) > value.time then
                            if (value.radius == nil or value.radius and (value.radius > 530 or Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(enemy)):Length2D() < value.radius)) then
                                if NPC.GetAbility(me, "rubick_empty1") or Ability.GetCooldown(spell) > 0 or ((Ability.GetName(spell) == "windrunner_windrun" or Ability.GetName(spell) == "slark_pounce" or Ability.GetName(spell) == "ember_spirit_fire_remnant" or Ability.GetName(spell) == "sniper_shrapnel" or Ability.GetName(spell) == "brewmaster_primal_split" or Ability.GetName(spell) == "void_spirit_resonant_pulse" or Ability.GetName(spell) == "void_spirit_astral_step" or Ability.GetName(spell) == "hoodwink_scurry" or Ability.GetName(spell) == "dark_seer_ion_shell") and Ability.GetCurrentCharges(spell) == 0) then
                                    if Ability.GetName(spell) ~= "snapfire_mortimer_kisses" or Ability.GetName(spell) == "snapfire_mortimer_kisses" and Ability.SecondsSinceLastUse(spell) > 1 and not NPC.HasModifier(me, "modifier_snapfire_mortimer_kisses") then
                                        if Ability.GetName(spell) ~= "luna_eclipse" or Ability.GetName(spell) == "luna_eclipse" and Ability.SecondsSinceLastUse(spell) > 1 and not NPC.HasModifier(me, "modifier_luna_eclipse") then
                                            if not NPC.HasState(enemy, Enum.ModifierState.MODIFIER_STATE_INVULNERABLE) and not NPC.HasModifier(enemy, "modifier_dark_willow_shadow_realm_buff") then
                                                if ((Ability.GetName(value.spell) ~= "tinker_rearm" and Ability.IsUltimate(value.spell)) or (Ability.GetName(value.spell) == "tinker_rearm" and Ability.GetLevel(value.spell) == 3 and (sheep or eb))) 
                                                    or ((Ability.GetDispellableType(value.spell) == 1 and Ability.GetLevel(value.spell) > 1) or Ability.GetName(value.spell) == "invoker_cold_snap" or Ability.GetName(value.spell) == "snapfire_gobble_up" or Ability.GetName(value.spell) == "terrorblade_terror_wave")
                                                    or (Menu.IsKeyDown(rubick.spellkey) and (((Ability.GetName(value.spell) == "invoker_sun_strike" and Ability.GetLevel(telekinesis) > 2) or (Ability.GetDamageType(value.spell) == 2 and Ability.GetLevel(value.spell) == 4))
                                                    or Ability.GetName(value.spell) == "grimstroke_scepter" or Ability.GetName(value.spell) == "zuus_cloud" or Ability.GetName(value.spell) == "invoker_tornado" or Ability.GetName(value.spell) == "invoker_emp" or Ability.GetName(value.spell) == "invoker_chaos_meteor" or Ability.GetName(value.spell) == "invoker_deafening_blast" 
                                                    or ((Ability.GetLevel(value.spell) == 4 and Ability.GetDamageType(value.spell) ~= 0) or ((NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed")) and Ability.GetLevel(value.spell) == 4))))
                                                then
                                                    Ability.CastTarget(spellsteal, enemy)
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    if rubick.spellsound[NPC.GetUnitName(enemy)] then
                        rubick.spellsound[NPC.GetUnitName(enemy)] = nil
                    end
                    rubick.spellinfo[enemy] = nil
                end
            end
        end

        if target then
            local bufftime = 0
            for _, bufflist in pairs(
                {
                    "modifier_bashed",
                    "modifier_sheepstick_debuff",
                    "modifier_stunned",
                    "modifier_alchemist_unstable_concoction",
                    "modifier_ancientapparition_coldfeet_freeze",
                    "modifier_axe_berserkers_call",
                    "modifier_bane_fiends_grip",
                    "modifier_earthshaker_fissure_stun",
                    "modifier_earth_spirit_boulder_smash",
                    "modifier_enigma_black_hole_pull",
                    "modifier_faceless_void_chronosphere_freeze",
                    "modifier_jakiro_ice_path_stun",
                    "modifier_keeper_of_the_light_mana_leak_stun",
                    "modifier_kunkka_torrent",
                    "modifier_legion_commander_duel",
                    "modifier_lion_impale",
                    "modifier_lion_voodoo",
                    "modifier_magnataur_reverse_polarity",
                    "modifier_medusa_stone_gaze_stone",
                    "modifier_nyx_assassin_impale",
                    "modifier_pudge_dismember",
                    "modifier_rattletrap_hookshot",
                    "modifier_rubick_telekinesis",
                    "modifier_sandking_impale",
                    "modifier_shadow_shaman_voodoo",
                    "modifier_shadow_shaman_shackles",
                    "modifier_techies_stasis_trap_stunned",
                    "modifier_tidehunter_ravage",
                    "modifier_windrunner_shackle_shot",
                    "modifier_lone_druid_spirit_bear_entangle_effect",
                    "modifier_storm_spirit_electric_vortex_pull",
                    "modifier_visage_summon_familiars_stone_form_buff",
                    "modifier_void_spirit_aether_remnant_pull",
                    "modifier_hoodwink_bushwhack_trap",
                    "modifier_terrorblade_fear"
                }
            ) do
                local buff = NPC.GetModifier(target, bufflist)
                if buff then
                    bufftime = Modifier.GetDieTime(buff)
                end
            end

            if (Ability.GetBehavior(spell) & Enum.AbilityBehavior.DOTA_ABILITY_BEHAVIOR_OPTIONAL_UNIT_TARGET) ~= 0 then
                distance = distance + bonuses_range
            elseif Ability.GetName(spell) == "night_stalker_void" and (NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed")) then
                distance = 900
            end

            if Menu.IsKeyDown(rubick.spellkey) and (not NPC.HasModifier(me, "modifier_nyx_assassin_vendetta") or NPC.HasModifier(me, "modifier_nyx_assassin_vendetta") and NPC.IsAttacking(me)) and not NPC.HasState(me, Enum.ModifierState.MODIFIER_STATE_INVISIBLE) then
                if Entity.IsAlive(me) and distance > 0 and Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() < distance and Ability.IsReady(spell) and not NPC.IsChannellingAbility(me) and (eb and Ability.GetDamageType(spell) ~= 2 or not eb or eb and not Ability.IsReady(eb)) then
                    if not sheep or not isdisable or sheep and isdisable and Ability.SecondsSinceLastUse(sheep) > 1 or Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() > Ability.GetCastRange(sheep) then
                        if not isdisable or bufftime == 0 or bufftime > 0 and bufftime - GameRules.GetGameTime() <= 0.35 then
                            if (Ability.GetBehavior(spell) & Enum.AbilityBehavior.DOTA_ABILITY_BEHAVIOR_NO_TARGET) ~= 0 then
                                if Ability.GetName(spell) == "earthshaker_enchant_totem" and (NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed")) then
                                    if Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() < NPC.GetAttackRange(me) + 500 then
                                        Ability.CastTarget(spell, me)
                                    end
                                elseif Ability.GetName(spell) == "riki_tricks_of_the_trade" and (NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed")) then
                                    Ability.CastTarget(spell, me)
                                elseif Ability.GetName(spell) == "chaos_knight_phantasm" and (NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed")) then
                                    Ability.CastTarget(spell, me)
                                elseif Ability.GetName(spell) == "luna_eclipse" and (NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed")) then
                                    Ability.CastPosition(spell, Entity.GetAbsOrigin(target))
                                elseif Ability.GetName(spell) == "void_spirit_resonant_pulse" and (NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed")) then
                                    if Ability.GetCurrentCharges(spell) > 0 and not NPC.HasModifier(me, "modifier_void_spirit_resonant_pulse_physical_buff") then
                                        Ability.CastNoTarget(spell)
                                    end
                                elseif Ability.GetName(spell) == "nevermore_shadowraze1" or Ability.GetName(spell) == "nevermore_shadowraze2" or Ability.GetName(spell) == "nevermore_shadowraze3" or Ability.GetName(spell) == "slark_pounce" then
                                    if Ability.GetName(spell) == "nevermore_shadowraze1" and Entity.GetAbsOrigin(target):Distance(Entity.GetAbsOrigin(me) + Entity.GetRotation(me):GetForward():Normalized():Scaled(200)):Length2D() < 250 or 
                                        Ability.GetName(spell) == "nevermore_shadowraze2" and Entity.GetAbsOrigin(target):Distance(Entity.GetAbsOrigin(me) + Entity.GetRotation(me):GetForward():Normalized():Scaled(450)):Length2D() < 250 or
                                        Ability.GetName(spell) == "nevermore_shadowraze3" and Entity.GetAbsOrigin(target):Distance(Entity.GetAbsOrigin(me) + Entity.GetRotation(me):GetForward():Normalized():Scaled(700)):Length2D() < 250 or
                                        Ability.GetName(spell) == "slark_pounce" and Entity.GetAbsOrigin(target):Distance(Entity.GetAbsOrigin(me) + Entity.GetRotation(me):GetForward():Normalized():Scaled(600)):Length2D() < 250 
                                    then
                                        Player.PrepareUnitOrders(Players.GetLocal(), Enum.UnitOrder.DOTA_UNIT_ORDER_ATTACK_TARGET, target, Entity.GetAbsOrigin(target), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_PASSED_UNIT_ONLY, me)
                                        Ability.CastNoTarget(spell)
                                    end
                                elseif Ability.GetName(spell) == "ancient_apparition_ice_blast_release" then
                                    if GameRules.GetGameTime() - timer > traveltime then
                                        Ability.CastNoTarget(spell)
                                    end
                                elseif Ability.GetName(spell) == "tinker_rearm" then
                                    if GameRules.GetGameTime() > rubick.time  and (telekinesis and (Ability.GetName(telekinesis) == "rubick_telekinesis_land" and not NPC.HasModifier(target, "modifier_rubick_telekinesis") or Ability.GetCooldown(telekinesis) > 0)) and Ability.GetCooldown(fadebolt) > 0 and (not eb or eb and Ability.GetCooldown(eb) > 0) then
                                        Ability.CastNoTarget(spell)
                                        rubick.time = GameRules.GetGameTime() + 0.53
                                    end
                                elseif Ability.GetName(spell) == "leshrac_pulse_nova" then
                                    if NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed") then radius = 750 else radius = 450 end
                                    if not Ability.GetToggleState(spell) and Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() < radius then
                                        Ability.Toggle(spell)
                                    elseif Ability.GetToggleState(spell) and Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() > radius then
                                        Ability.Toggle(spell)
                                    end
                                elseif Ability.GetName(spell) == "phoenix_supernova" then
                                    if NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed") then
                                        if rubick.teammate and Entity.GetHealth(rubick.teammate) / Entity.GetMaxHealth(rubick.teammate) < 0.3 and Entity.GetHealth(me) / Entity.GetMaxHealth(me) < 0.5 then
                                            Ability.CastTarget(spell, rubick.teammate)
                                        elseif Entity.GetHealth(me) / Entity.GetMaxHealth(me) < 0.3 then
                                            Ability.CastTarget(spell, me)
                                        end
                                    else
                                        if Entity.GetHealth(me) / Entity.GetMaxHealth(me) < 0.3 then
                                            Ability.CastNoTarget(spell)
                                        end
                                    end
                                elseif Ability.GetName(spell) == "weaver_time_lapse" then
                                    if GameRules.GetGameTime() > rubick.time then
                                        rubick.heath = Entity.GetHealth(me)
                                        rubick.time = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 1
                                    end
                                    if rubick.teammate and GameRules.GetGameTime() > rubick.time2 then
                                        rubick.heath2 = Entity.GetHealth(rubick.teammate)
                                        rubick.time2 = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 1
                                    end
                                    if Entity.GetHealth(me) < rubick.heath - 300 then
                                        if NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed") then
                                            Ability.CastTarget(spell, me)
                                        else
                                            Ability.CastNoTarget(spell)
                                        end
                                        rubick.heath = 0
                                        rubick.time = 0
                                    end
                                    if rubick.teammate and Entity.GetHealth(rubick.teammate) < rubick.heath2 - 300 and (NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed")) then
                                        Ability.CastTarget(spell, rubick.teammate)
                                        rubick.heath2 = 0
                                        rubick.time2 = 0
                                    end
                                elseif Ability.GetName(spell) == "shredder_return_chakram" or Ability.GetName(spell) == "shredder_return_chakram_2" then
                                    if GameRules.GetGameTime() > rubick.time2 then
                                        if not NPC.HasModifier(target, "modifier_shredder_chakram_debuff") then
                                            Ability.CastNoTarget(spell)
                                            rubick.time2 = 0
                                        end
                                        Player.PrepareUnitOrders(Players.GetLocal(), 1, nil, Input.GetWorldCursorPos(), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me, false, true)
                                    end
                                elseif Ability.GetName(spell) == "earthshaker_echo_slam" then
                                    if #NPCs.InRadius(Entity.GetAbsOrigin(me), 600, Entity.GetTeamNum(me), Enum.TeamType.TEAM_ENEMY) > 2 then
                                        Ability.CastNoTarget(spell)
                                    end
                                elseif Ability.GetName(spell) == "alchemist_unstable_concoction" then
                                    Ability.CastNoTarget(spell)
                                    rubick.time = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + NetChannel.GetAvgLatency(Enum.Flow.FLOW_INCOMING) + 3
                                elseif Ability.GetName(spell) == "windrunner_windrun" then
                                    if NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed") then
                                        if not NPC.HasModifier(me, "modifier_windrunner_windrun") then
                                            Ability.CastNoTarget(spell)
                                        end
                                    else
                                        Ability.CastNoTarget(spell)
                                    end
                                elseif Ability.GetName(spell) == "tidehunter_ravage" then
                                    local count = Heroes.InRadius(Entity.GetAbsOrigin(me), distance, Entity.GetTeamNum(me), Enum.TeamType.TEAM_ENEMY)
                                    local enemies = Heroes.InRadius(Entity.GetAbsOrigin(target), distance, Entity.GetTeamNum(me), Enum.TeamType.TEAM_ENEMY)
                                    if #enemies == #count and #enemies > 1 then
                                    local pos = {}
                                    for i, v in ipairs(count) do
                                        if v then
                                            table.insert(pos, {x = Entity.GetAbsOrigin(v):GetX(), y = Entity.GetAbsOrigin(v):GetY()})
                                        end
                                    end
                                    local x, y, c = 0, 0, #pos
                                    for i = 1, c do
                                        x = x + pos[i].x
                                        y = y + pos[i].y
                                    end
                                        Ability.CastNoTarget(spell)
                                    end
                                elseif Ability.GetName(spell) == "wisp_spirits_in" then
                                    for i, v in pairs(Entity.GetUnitsInRadius(me, distance, Enum.TeamType.TEAM_FRIEND)) do
                                        if v and Entity.IsAlive(v) and NPC.GetUnitName(v) == "npc_dota_wisp_spirit" and GameRules.GetGameTime() > rubick.time then
                                            if Entity.GetAbsOrigin(v):Distance(Entity.GetAbsOrigin(target)):Length2D() > 90 then
                                                Ability.CastNoTarget(spell)
                                            end
                                            rubick.time = GameRules.GetGameTime() + 2
                                        end
                                    end
                                elseif Ability.GetName(spell) == "pangolier_gyroshell_stop" then
                                    if GameRules.GetGameTime() > rubick.time and NPC.HasModifier(me, "modifier_pangolier_gyroshell") then
                                        Player.PrepareUnitOrders(Players.GetLocal(), 1, nil, Input.GetWorldCursorPos(), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                                        rubick.time = GameRules.GetGameTime() + 1.3
                                    end
                                elseif Ability.GetName(spell) == "hoodwink_sharpshooter_release" then
                                    if GameRules.GetGameTime() > rubick.time then
                                        if not NPC.IsRunning(target) then
                                            Player.PrepareUnitOrders(Players.GetLocal(), 1, nil, Entity.GetAbsOrigin(target), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                                        else
                                            Player.PrepareUnitOrders(Players.GetLocal(), 1, nil, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(NPC.GetMoveSpeed(target)), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                                        end
                                        rubick.time = GameRules.GetGameTime() + 0.33
                                    end
                                else
                                    Ability.CastNoTarget(spell)
                                end
                            end
                            if (Ability.GetBehavior(spell) & Enum.AbilityBehavior.DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 and (Ability.GetTargetTeam(spell) & Enum.TargetTeam.DOTA_UNIT_TARGET_TEAM_FRIENDLY) ~= 0 and IsSupport then
                                if Ability.GetName(spell) == "chen_divine_favor" then
                                    for i, v in ipairs(Entity.GetHeroesInRadius(me, 99999 ,Enum.TeamType.TEAM_FRIEND)) do
                                        if v and Entity.IsAlive(v) and Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(v)):Length2D() > 1500 and Entity.GetHealth(v) / Entity.GetMaxHealth(v) > 0.7  then
                                            Ability.CastTarget(spell, v)
                                        end
                                    end
                                else
                                    if rubick.teammate and Entity.GetHealth(rubick.teammate) / Entity.GetMaxHealth(rubick.teammate) < 0.9 then
                                        Ability.CastTarget(spell, rubick.teammate)
                                    elseif Entity.GetHealth(me) / Entity.GetMaxHealth(me) < 0.8 then
                                        Ability.CastTarget(spell, me)
                                    end
                                end
                                if Ability.GetName(spell) == "snapfire_firesnap_cookie" then
                                    if rubick.teammate then
                                        if NPC.FindFacingNPC(rubick.teammate, nil, Enum.TeamType.TEAM_ENEMY, 600, 30) == target and Entity.GetAbsOrigin(rubick.teammate):Distance(Entity.GetAbsOrigin(target)):Length2D() > 250 then
                                            Ability.CastTarget(spell, rubick.teammate)
                                        end
                                    elseif not rubick.teammate then
                                        if NPC.FindFacingNPC(me, nil, Enum.TeamType.TEAM_ENEMY, 600, 30) == target and Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() > 250 then
                                            Ability.CastTarget(spell, me)
                                        end
                                    end
                                end
                                if Ability.GetName(spell) == "dark_seer_ion_shell" then
                                    if GameRules.GetGameTime() > rubick.time then
                                        if rubick.teammate then
                                            if Entity.GetAbsOrigin(rubick.teammate):Distance(Entity.GetAbsOrigin(target)):Length2D() < 412 and not NPC.HasModifier(rubick.teammate, "modifier_dark_seer_ion_shell") then
                                                Ability.CastTarget(spell, rubick.teammate)
                                            end
                                        elseif not rubick.teammate then
                                            if Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() < 412 and not NPC.HasModifier(me, "modifier_dark_seer_ion_shell") then
                                                Ability.CastTarget(spell, me)
                                            end
                                        end
                                        rubick.time = GameRules.GetGameTime() + 1
                                    end
                                end
                            end
                            if (Ability.GetBehavior(spell) & Enum.AbilityBehavior.DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 and not IsSupport then
                                if NPC.GetItem(me, "item_ultimate_scepter") or NPC.HasModifier(me, "modifier_item_ultimate_scepter_consumed") then
                                    if Ability.GetName(spell) == "bristleback_viscous_nasal_goo" or Ability.GetName(spell) == "storm_spirit_electric_vortex" or Ability.GetName(spell) == "night_stalker_void" then
                                        Ability.CastNoTarget(spell)
                                    end
                                    if Ability.GetName(spell) == "silencer_last_word" then
                                        rubick.aoe_cast(me, spell, target, "scepter_radius", distance)
                                    end
                                end
                                if (Ability.GetBehavior(spell) & Enum.AbilityBehavior.DOTA_ABILITY_BEHAVIOR_AOE) ~= 0 and Ability.GetName(spell) ~= "alchemist_unstable_concoction_throw" and Ability.GetName(spell) ~= "antimage_mana_void" then
                                    Ability.CastTarget(spell, target)
                                end
                                if Ability.GetName(spell) == "pugna_decrepify" then
                                    Ability.CastTarget(spell, target)
                                end
                                if Ability.GetName(spell) == "snapfire_gobble_up" then
                                    for i, v in ipairs(Entity.GetHeroesInRadius(me, 300 ,Enum.TeamType.TEAM_FRIEND)) do
                                        if v and Entity.IsAlive(v) and Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(v)):Length2D() < 300 and Entity.GetHealth(v) / Entity.GetMaxHealth(v) > 0.7  then
                                            Ability.CastTarget(spell, v)
                                        end
                                    end
                                end
                                if (Ability.GetTargetTeam(spell) & Enum.TargetTeam.DOTA_UNIT_TARGET_TEAM_ENEMY) ~= 0 and (Ability.GetBehavior(spell) & Enum.AbilityBehavior.DOTA_ABILITY_BEHAVIOR_POINT) == 0 then
                                    if not NPC.HasModifier(target, "modifier_antimage_counterspell") and not NPC.HasModifier(target, "modifier_item_lotus_orb_active") then
                                        if Ability.GetName(spell) == "windrunner_shackleshot" then
                                            local targetPos = Entity.GetAbsOrigin(target)
                                            local myPos = Entity.GetAbsOrigin(me)
                                            for key, tree in ipairs(Trees.InRadius(myPos, 1375, true)) do
                                                if tree and NPC.IsEntityInRange(target, tree, 575) then
                                                    local treepos = Entity.GetAbsOrigin(tree)
                                                    local X = (treepos:GetX() - targetPos:GetX()) / (myPos:GetX() - targetPos:GetX())
                                                    local Y = (treepos:GetY() - targetPos:GetY()) / (myPos:GetY() - targetPos:GetY())
                                                    if X < 0 and Y < 0 and math.abs(X - Y) < 0.19 then Ability.CastTarget(spell, target) end
                                                end
                                            end
                                            for key, enemy in ipairs(Entity.GetUnitsInRadius(me, 1375 ,Enum.TeamType.TEAM_ENEMY)) do
                                                if enemy and Entity.IsAlive(enemy) and NPC.IsEntityInRange(enemy, target, 575) then
                                                    local enemypos = Entity.GetAbsOrigin(enemy)
                                                    local X = (enemypos:GetX() - targetPos:GetX()) / (myPos:GetX() - targetPos:GetX())
                                                    local Y = (enemypos:GetY() - targetPos:GetY()) / (myPos:GetY() - targetPos:GetY())
                                                    if X < 0 and Y < 0 and math.abs(X - Y) < 0.19 then Ability.CastTarget(spell, target) end
                                                    local X2 = (enemypos:GetX() - targetPos:GetX()) / (targetPos:GetX() - myPos:GetX())
                                                    local Y2 = (enemypos:GetY() - targetPos:GetY()) / (targetPos:GetY() - myPos:GetY())
                                                    if X2 < 0 and Y2 < 0 and math.abs(X2 - Y2) < 0.19 then Ability.CastTarget(spell, enemy) end
                                                end
                                            end
                                        elseif Ability.GetName(spell) == "terrorblade_sunder" then
                                            if Entity.GetHealth(me) / Entity.GetMaxHealth(me) < 0.5 then
                                                for key, enemy in ipairs(Entity.GetHeroesInRadius(me, 475, Enum.TeamType.TEAM_ENEMY)) do
                                                    if enemy and Entity.IsAlive(enemy) then
                                                        if Entity.GetHealth(me) < Entity.GetHealth(enemy) then
                                                            Ability.CastTarget(spell, enemy)
                                                        end
                                                    end
                                                end
                                            end
                                        elseif Ability.GetName(spell) == "bounty_hunter_track" then
                                            for key, enemy in ipairs(Entity.GetHeroesInRadius(me, 1000, Enum.TeamType.TEAM_ENEMY)) do
                                                if enemy and Entity.IsAlive(enemy) and not NPC.HasModifier(enemy, "modifier_bounty_hunter_track") then
                                                    Ability.CastTarget(spell, enemy)
                                                end
                                            end
                                        elseif Ability.GetName(spell) == "alchemist_unstable_concoction_throw" then
                                            if GameRules.GetGameTime() > rubick.time then
                                                Ability.CastTarget(spell, target)
                                                rubick.time = 0
                                            end
                                        elseif Ability.GetName(spell) == "bloodseeker_rupture" then
                                            if not NPC.HasModifier(target, "modifier_bloodseeker_rupture") then
                                                Ability.CastTarget(spell, target)
                                            end
                                        elseif Ability.GetName(spell) == "antimage_mana_void" then
                                            if Entity.GetHealth(target) + NPC.GetHealthRegen(target) < (NPC.GetMaxMana(target) - NPC.GetMana(target) + NPC.GetManaRegen(target)) * (Ability.GetLevelSpecialValueFor(spell, "mana_void_damage_per_mana") + amp - NPC.GetMagicalArmorDamageMultiplier(target)) * NPC.GetMagicalArmorDamageMultiplier(target) then
                                                Ability.CastTarget(spell, target)
                                            end
                                        elseif Ability.GetName(spell) == "necrolyte_reapers_scythe" then
                                            if Entity.GetHealth(target) + NPC.GetHealthRegen(target) < (Entity.GetMaxHealth(target) - Entity.GetHealth(target)) * (1 + Ability.GetLevelSpecialValueFor(spell, "damage_per_health") + amp - NPC.GetMagicalArmorDamageMultiplier(target)) * NPC.GetMagicalArmorDamageMultiplier(target) then
                                                Ability.CastTarget(spell, target)
                                            end
                                        elseif Ability.GetName(spell) == "axe_culling_blade" then
                                            if Entity.GetHealth(target) + NPC.GetHealthRegen(target) < Ability.GetLevelSpecialValueFor(spell, "kill_threshold") then
                                                Ability.CastTarget(spell, target)
                                            end
                                        else
                                            Ability.CastTarget(spell, target)
                                        end
                                    end
                                else
                                    Ability.CastTarget(spell, me)
                                end
                            end
                            if (Ability.GetBehavior(spell) & Enum.AbilityBehavior.DOTA_ABILITY_BEHAVIOR_POINT) ~= 0 then
                                if Ability.GetName(spell) == "pugna_nether_ward" then
                                    Ability.CastPosition(spell, Entity.GetAbsOrigin(me))
                                elseif Ability.GetName(spell) == "pangolier_swashbuckle" then
                                    local dir = Entity.GetAbsOrigin(me) - Entity.GetAbsOrigin(target)
                                    dir:SetZ(0)
                                    dir:Normalize()
                                    dir:Scale(550)
                                    local pos = Entity.GetAbsOrigin(target) + dir
                                    if pos then
                                        Player.PrepareUnitOrders(Players.GetLocal(), 30, nil, pos, spell, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                                        Player.PrepareUnitOrders(Players.GetLocal(), 30, nil, Entity.GetAbsOrigin(target), spell, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                                        Ability.CastPosition(spell, pos)
                                    end
                                elseif Ability.GetName(spell) == "shredder_timber_chain" then
                                    local myPos = Entity.GetAbsOrigin(me)
                                    local targetPos = Entity.GetAbsOrigin(target)
                                    for key, tree in ipairs(Trees.InRadius(myPos, 1450, true)) do
                                        if tree then
                                            local treepos = Entity.GetAbsOrigin(tree)
                                            local X = (treepos:GetX() - targetPos:GetX()) / (myPos:GetX() - targetPos:GetX())
                                            local Y = (treepos:GetY()-targetPos:GetY()) / (myPos:GetY() - targetPos:GetY())
                                            if X < 0 and Y < 0 and math.abs(X-Y) < 0.3 then Ability.CastPosition(spell, Entity.GetAbsOrigin(tree)) end
                                        end
                                    end
                                elseif Ability.GetName(spell) == "juggernaut_healing_ward" then
                                    if rubick.teammate and Entity.GetHealth(rubick.teammate) / Entity.GetMaxHealth(rubick.teammate) < 0.9 then
                                        Ability.CastPosition(spell, Entity.GetAbsOrigin(rubick.teammate))
                                    elseif Entity.GetHealth(me) / Entity.GetMaxHealth(me) < 0.8 then
                                        Ability.CastPosition(spell, Entity.GetAbsOrigin(me))
                                    end
                                elseif Ability.GetName(spell) == "void_spirit_aether_remnant" then
                                    if GameRules.GetGameTime() > rubick.time then
                                        if not NPC.IsRunning(target) then
                                            Player.PrepareUnitOrders(Players.GetLocal(), 30, nil, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(NPC.GetMoveSpeed(target)), spell, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                                            Player.PrepareUnitOrders(Players.GetLocal(), 30, nil, Entity.GetAbsOrigin(target), spell, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                                            Player.PrepareUnitOrders(Players.GetLocal(), 5, nil, Entity.GetAbsOrigin(target) + (Entity.GetAbsOrigin(me) - Entity.GetAbsOrigin(target)):Normalized():Scaled(300), spell, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                                        else
                                            Player.PrepareUnitOrders(Players.GetLocal(), 30, nil, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(NPC.GetMoveSpeed(target) * 1.9), spell, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                                            Player.PrepareUnitOrders(Players.GetLocal(), 30, nil, Entity.GetAbsOrigin(target), spell, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                                            Player.PrepareUnitOrders(Players.GetLocal(), 5, nil, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(NPC.GetMoveSpeed(target) * 1.9), spell, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                                        end
                                        rubick.time = GameRules.GetGameTime() + 0.28
                                    end
                                elseif Ability.GetName(spell) == "void_spirit_astral_step" then
                                    if Ability.GetCurrentCharges(spell) > 0 and GameRules.GetGameTime() > rubick.time then
                                        Ability.CastPosition(spell, Entity.GetAbsOrigin(me) + ((Entity.GetAbsOrigin(target) - Entity.GetAbsOrigin(me)):Normalized():Scaled(1100)))
                                        rubick.time = GameRules.GetGameTime() + 0.9
                                    end
                                elseif Ability.GetName(spell) == "sniper_shrapnel" then
                                    if rubick.shrapnel_pos and Entity.GetAbsOrigin(target):Distance(rubick.shrapnel_pos):Length2D() > 450 then
                                        rubick.shrapnel_pos = nil
                                    end
                                    if Ability.GetCurrentCharges(spell) > 0 and GameRules.GetGameTime() > rubick.time then
                                        if not rubick.shrapnel_pos or rubick.shrapnel_pos and Entity.GetAbsOrigin(target):Distance(rubick.shrapnel_pos):Length2D() > 450 then
                                            if NPC.IsRunning(target) then
                                                Ability.CastPosition(spell, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(225 + NPC.GetMoveSpeed(target)))
                                                rubick.shrapnel_pos = Entity.GetAbsOrigin(target)
                                            else
                                                Ability.CastPosition(spell, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(225))
                                                rubick.shrapnel_pos = Entity.GetAbsOrigin(target)
                                            end
                                            rubick.time = GameRules.GetGameTime() + 1
                                        end
                                    end
                                elseif Ability.GetName(spell) == "antimage_blink" or Ability.GetName(spell) == "queenofpain_blink" then
                                    if NPC.GetMana(me) / NPC.GetMaxMana(me) < 0.3 or Entity.GetHealth(me) / Entity.GetMaxHealth(me) < Entity.GetHealth(target) / Entity.GetMaxHealth(target) then
                                        if Entity.GetTeamNum(me) == 2 then fountain_pos = Vector(-6700.0, -6700.03125, 512.0) else fountain_pos = Vector(6900.0, 6649.96875, 512.0) end
                                        if fountain_pos then
                                            if #Trees.InRadius(fountain_pos, 300, true) < 1 and NPC.FindFacingNPC(target, nil, Enum.TeamType.TEAM_ENEMY, 350, 15) == me and NPC.IsAttacking(target) then
                                                Ability.CastPosition(spell, Entity.GetAbsOrigin(target) + ((fountain_pos - Entity.GetAbsOrigin(target)):Normalized():Scaled(Entity.GetAbsOrigin(target):Distance(Entity.GetAbsOrigin(me)):Length2D() + distance - 550)))
                                            end
                                        end
                                    else
                                        if Entity.GetAbsOrigin(target):Distance(Entity.GetAbsOrigin(me)):Length2D() > 900 then
                                            Ability.CastPosition(spell, Entity.GetAbsOrigin(target) + ((Entity.GetAbsOrigin(me) - Entity.GetAbsOrigin(target)):Normalized():Scaled(390)))
                                        end
                                    end
                                elseif Ability.GetName(spell) == "hoodwink_bushwhack" then
                                    for _, tree in ipairs(Trees.InRadius(Entity.GetAbsOrigin(target), 412, true)) do
                                        if tree then
                                            Ability.CastPosition(spell, Entity.GetAbsOrigin(target) + ((Entity.GetAbsOrigin(tree) - Entity.GetAbsOrigin(target)):Normalized():Scaled(137)))
                                        end
                                    end
                                elseif Ability.GetName(spell) == "tusk_ice_shards" or Ability.GetName(spell) == "morphling_waveform" or Ability.GetName(spell) == "sandking_burrowstrike" then
                                    if NPC.IsRunning(target) then
                                        Ability.CastPosition(spell, Entity.GetAbsOrigin(target) + (Entity.GetAbsOrigin(target) - Entity.GetAbsOrigin(me)):Normalized():Scaled(300 + NPC.GetMoveSpeed(target)))
                                    else
                                        Ability.CastPosition(spell, Entity.GetAbsOrigin(target) + (Entity.GetAbsOrigin(target) - Entity.GetAbsOrigin(me)):Normalized():Scaled(300))
                                    end
                                elseif Ability.GetName(spell) == "skywrath_mage_mystic_flare" or Ability.GetName(spell) == "ember_spirit_fire_remnant" or Ability.GetName(spell) == "invoker_sun_strike" then
                                    if bufftime > 0 and bufftime - GameRules.GetGameTime() >= 0.3 then
                                        Ability.CastPosition(spell, Entity.GetAbsOrigin(target))
                                    end
                                elseif Ability.GetName(spell) == "hoodwink_sharpshooter" then
                                    if Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() < 2600 and Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() > 900 then
                                        Ability.CastPosition(spell, Entity.GetAbsOrigin(target))
                                    end
                                -- aoe cast
                                elseif Ability.GetName(spell) == "puck_dream_coil" then
                                    rubick.aoe_cast(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "coil_radius") * 1.5, distance)
                                elseif Ability.GetName(spell) == "warlock_rain_of_chaos" then
                                    rubick.aoe_cast(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "aoe") * 1.5, distance)
                                elseif Ability.GetName(spell) == "kunkka_ghostship" then
                                    rubick.aoe_cast(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "ghostship_width") * 1.5, distance)
                                elseif Ability.GetName(spell) == "invoker_emp" then
                                    rubick.aoe_cast(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "area_of_effect") * 1.5, distance)
                                elseif Ability.GetName(spell) == "silencer_last_word" then
                                    rubick.aoe_cast(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "scepter_radius") * 1.5, distance)
                                elseif Ability.GetName(spell) == "tiny_avalanche" or Ability.GetName(spell) == "enigma_black_hole" or Ability.GetName(spell) == "silencer_curse_of_the_silent" or Ability.GetName(spell) == "enigma_midnight_pulse" or Ability.GetName(spell) == "alchemist_acid_spray" or Ability.GetName(spell) == "disruptor_static_storm" or Ability.GetName(spell) == "ember_spirit_sleight_of_fist" or Ability.GetName(spell) == "obsidian_destroyer_sanity_eclipse" or Ability.GetName(spell) == "death_prophet_silence" or Ability.GetName(spell) == "pugna_nether_blast" or Ability.GetName(spell) == "gyrocopter_call_down" or Ability.GetName(spell) == "abyssal_underlord_firestorm" or Ability.GetName(spell) == "abyssal_underlord_pit_of_malice" or Ability.GetName(spell) == "undying_decay" or Ability.GetName(spell) == "riki_smoke_screen" then
                                    rubick.aoe_cast(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "radius") * 1.5, distance)
                                -- aoe cast2
                                elseif Ability.GetName(spell) == "earthshaker_fissure" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "fissure_radius") * 1.5, distance)
                                elseif Ability.GetName(spell) == "drow_ranger_wave_of_silence" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "wave_width") * 1.5, distance)
                                elseif Ability.GetName(spell) == "queenofpain_sonic_wave" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "final_aoe") * 1.5, distance)
                                elseif Ability.GetName(spell) == "vengefulspirit_wave_of_terror" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "wave_width") * 1.5, distance)
                                elseif Ability.GetName(spell) == "lina_dragon_slave" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "dragon_slave_width_initial") * 1.5, distance)
                                elseif Ability.GetName(spell) == "lina_light_strike_array" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "light_strike_array_aoe") * 1.5, distance)
                                elseif Ability.GetName(spell) == "death_prophet_carrion_swarm" or Ability.GetName(spell) == "dragon_knight_breathe_fire" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "end_radius") * 1.5, distance)
                                elseif Ability.GetName(spell) == "weaver_the_swarm" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "spawn_radius") * 1.5, distance)
                                elseif Ability.GetName(spell) == "invoker_tornado" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "area_of_effect") * 1.5, distance)
                                elseif Ability.GetName(spell) == "invoker_deafening_blast" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "radius_end") * 1.5, distance)
                                elseif Ability.GetName(spell) == "monkey_king_boundless_strike" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "strike_crit_mult") * 1.5, distance)
                                elseif Ability.GetName(spell) == "lion_impale" then
                                    rubick.aoe_cast2(me, spell, target, Ability.GetLevelSpecialValueFor(spell, "width") * 1.5, distance)
                                else
                                    local isblocked = false
                                    if Ability.GetName(spell) == "pudge_meat_hook" or Ability.GetName(spell) == "rattletrap_hookshot" or Ability.GetName(spell) == "mirana_arrow" then
                                        for i = 1, math.floor((Entity.GetAbsOrigin(me) - Entity.GetAbsOrigin(target)):Length2D() / 125) do
                                            for _, unit in ipairs(NPCs.InRadius(Entity.GetAbsOrigin(me) + (Entity.GetAbsOrigin(target) - Entity.GetAbsOrigin(me)):Normalized():Scaled(i * 125), 125, Entity.GetTeamNum(me),Enum.TeamType.TEAM_BOTH)
                                            ) do
                                                if
                                                    (Ability.GetName(spell) == "mirana_arrow" and 
                                                    not Entity.IsSameTeam(me, unit) or 
                                                    Ability.GetName(spell) ~= "mirana_arrow") and 
                                                    unit and Entity.IsNPC(unit) and unit ~= target and unit ~= me and 
                                                    Entity.IsAlive(unit) and 
                                                    not Entity.IsDormant(unit) and 
                                                    not NPC.IsStructure(unit) and 
                                                    not NPC.IsBarracks(unit) and 
                                                    not NPC.IsWaitingToSpawn(unit) and 
                                                    NPC.GetUnitName(unit) ~= "npc_dota_neutral_caster" and 
                                                    NPC.GetUnitName(unit) ~= nil 
                                                 then
                                                    isblocked = true
                                                end
                                            end
                                        end
                                    end
                                    if
                                        not isblocked and (Ability.GetName(spell) == "pudge_meat_hook" or Ability.GetName(spell) == "rattletrap_hookshot" or Ability.GetName(spell) == "mirana_arrow") and NPC.FindFacingNPC(me, nil, Enum.TeamType.TEAM_ENEMY, nil, 15) == target or
                                        Ability.GetName(spell) ~= "pudge_meat_hook" and Ability.GetName(spell) ~= "tiny_tree_channel" and Ability.GetName(spell) ~= "rattletrap_hookshot" and Ability.GetName(spell) ~= "mirana_arrow" and Ability.GetName(spell) ~= "ember_spirit_fire_remnant" and Ability.GetName(spell) ~= "death_prophet_spirit_siphon" and Ability.GetName(spell) ~= "shadow_demon_demonic_purge" or
                                        Ability.GetName(spell) == "tiny_tree_channel" and #Trees.InRadius(Entity.GetAbsOrigin(me), 525, true) > 2 or 
                                        (Ability.GetName(spell) == "ember_spirit_fire_remnant" or Ability.GetName(spell) == "death_prophet_spirit_siphon" or Ability.GetName(spell) == "shadow_demon_demonic_purge") and Ability.GetCurrentCharges(spell) > 0
                                     then
                                        if not NPC.IsRunning(target) then
                                            Ability.CastPosition(spell, Entity.GetAbsOrigin(target))
                                        else
                                            Ability.CastPosition(spell, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(NPC.GetMoveSpeed(target)))
                                        end
                                        rubick.time2 = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 1.6
                                    end
                                    if Ability.GetName(spell) == "ancient_apparition_ice_blast" and Ability.IsInAbilityPhase(spell) then
                                        timer = GameRules.GetGameTime()
                                        traveltime = Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() / 1500
                                    end
                                end
                            end
                        end
                    end
                end
                if isblinking then
                    if distance > 0 and Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() > distance then
                        if distance > 550 then
                            if Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() < 1199 + distance then
                                Ability.CastPosition(blink, Entity.GetAbsOrigin(me) + ((Entity.GetAbsOrigin(target) - Entity.GetAbsOrigin(me)):Normalized():Scaled(1199)))
                            end
                        else
                            if Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() < 1199 then
                                Ability.CastPosition(blink, Entity.GetAbsOrigin(target))
                            end
                        end
                    else
                        isblinking = false
                    end
                end
                if isdisable and Ability.IsReady(spell) and forward and Ability.IsReady(forward) and NPC.FindFacingNPC(me, nil, Enum.TeamType.TEAM_ENEMY, distance + 600, 25) == target and Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() > distance + 150 then
                    Ability.CastTarget(forward, me)
                end
                if not isblinking then
                    if (Ability.GetBehavior(spell) & Enum.AbilityBehavior.DOTA_ABILITY_BEHAVIOR_CHANNELLED) == 0 or
                        (Ability.GetBehavior(spell) & Enum.AbilityBehavior.DOTA_ABILITY_BEHAVIOR_CHANNELLED) ~= 0 and
                        Ability.SecondsSinceLastUse(spell) > 1 and not NPC.IsChannellingAbility(me) or
                        distance > 0 and Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() > distance or
                        Ability.GetName(spell) == "tinker_rearm" and not NPC.IsChannellingAbility(me)
                     then
                        if not NPC.HasModifier(me, "modifier_pangolier_gyroshell") and not NPC.HasModifier(me, "modifier_snapfire_mortimer_kisses") and not NPC.HasModifier(target, "modifier_antimage_counterspell") and not NPC.HasModifier(target, "modifier_item_lotus_orb_active") and (Ability.GetName(spell) ~= "snapfire_mortimer_kisses" or Ability.GetName(spell) == "snapfire_mortimer_kisses" and Ability.SecondsSinceLastUse(spell) > 1 and not NPC.HasModifier(me, "modifier_snapfire_mortimer_kisses")) then
                            if telekinesis and Ability.IsReady(telekinesis) then
                                if Ability.GetName(telekinesis) == "rubick_telekinesis" and NPC.IsEntityInRange(me, target, Ability.GetCastRange(telekinesis) + bonuses_range) then
                                    if not sheep or sheep and Ability.SecondsSinceLastUse(sheep) > 1 then
                                        if not isdisable or
                                            isdisable and Ability.SecondsSinceLastUse(spell) > 1 or
                                            isdisable and distance > 0 and Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() > distance
                                        then
                                            if bufftime == 0 or bufftime > 0 and bufftime - GameRules.GetGameTime() <= 0.75 then
                                                if Ability.GetName(spell) ~= "void_spirit_aether_remnant" or Ability.GetName(spell) == "void_spirit_aether_remnant" and Ability.SecondsSinceLastUse(spell) > 2 then
                                                    if NPC.HasModifier(me, "modifier_item_aghanims_shard") then
                                                        for i, v in ipairs(Entity.GetHeroesInRadius(me, Ability.GetCastRange(telekinesis), Enum.TeamType.TEAM_FRIEND)) do
                                                            if v and Entity.IsAlive(v) and NPC.IsHero(v) and Entity.GetAbsOrigin(v):Distance(Entity.GetAbsOrigin(target)):Length2D() > NPC.GetAttackRange(v) + 100 and NPC.FindFacingNPC(v, nil, Enum.TeamType.TEAM_ENEMY, 984, 110) == target then
                                                                Ability.CastTarget(telekinesis, v)
                                                                rubick.lift_duration = Ability.GetLevelSpecialValueFor(telekinesis, "lift_duration") / 2
                                                                rubick.throw_allies = true
                                                            end
                                                        end
                                                    end
                                                    if not rubick.throw_allies then
                                                        Ability.CastTarget(telekinesis, target)
                                                        rubick.lift_duration = Ability.GetLevelSpecialValueFor(telekinesis, "lift_duration") / 2
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                if Ability.GetName(telekinesis) == "rubick_telekinesis_land" then
                                    if not rubick.throw_allies then
                                        for i, v in ipairs(Entity.GetHeroesInRadius(me, 1075 ,Enum.TeamType.TEAM_ENEMY)) do
                                            if v and v ~= target then
                                                table.insert(enemies, v)
                                                if #enemies > 4 then
                                                    table.sort(enemies, function (a, b) return Entity.GetAbsOrigin(a) > Entity.GetAbsOrigin(b) end)
                                                end
                                                if enemies[1] and Entity.GetAbsOrigin(target):Distance(Entity.GetAbsOrigin(enemies[1])):Length2D() < throw_range then
                                                    if not rubick.throw_pos or rubick.throw_pos and Entity.GetAbsOrigin(enemies[1]):Distance(rubick.throw_pos):Length2D() > 90 then
                                                        if NPC.IsRunning(enemies[1]) then
                                                            Ability.CastPosition(telekinesis, Entity.GetAbsOrigin(enemies[1]) + Entity.GetRotation(enemies[1]):GetForward():Normalized():Scaled(NPC.GetMoveSpeed(enemies[1])))
                                                            rubick.throw_pos = Entity.GetAbsOrigin(enemies[1])
                                                        else
                                                            Ability.CastPosition(telekinesis, Entity.GetAbsOrigin(enemies[1]))
                                                            rubick.throw_pos = Entity.GetAbsOrigin(enemies[1])
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    else
                                        if NPC.IsRunning(target) then
                                            Ability.CastPosition(telekinesis, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(NPC.GetMoveSpeed(target)))
                                        else
                                            Ability.CastPosition(telekinesis, Entity.GetAbsOrigin(target))
                                        end
                                    end
                                end
                            else
                                rubick.throw_pos = nil
                                rubick.throw_allies = false
                            end
                            if fadebolt and Ability.IsReady(fadebolt) and NPC.IsEntityInRange(me, target, Ability.GetCastRange(fadebolt) + bonuses_range) and (not eb or eb and not Ability.IsReady(eb)) then
                                Ability.CastTarget(fadebolt, target)
                            end
                        end
                        if next(summontable) ~= nil then
                            for _, summon in ipairs(summontable) do
                                if summon then
                                    for i = 0, 5 do
                                        local summonspell = NPC.GetAbilityByIndex(summon, i)
                                        local summoitem = NPC.GetItemByIndex(summon, i)
                                        if summonspell ~= nil and Ability.IsReady(summonspell) then
                                            if Ability.GetName(summonspell) == "rubick_fade_bolt" and (not eb or eb and not Ability.IsReady(eb)) then
                                                Ability.CastTarget(summonspell, target)
                                            end
                                            if bufftime == 0 or bufftime > 0 and bufftime - GameRules.GetGameTime() <= 0.75 then
                                                if
                                                    Ability.GetName(summonspell) == "rubick_telekinesis" or
                                                    Ability.GetName(summonspell) == "brewmaster_earth_hurl_boulder"
                                                then
                                                    Ability.CastTarget(summonspell, target)
                                                end
                                                if
                                                    Ability.GetName(summonspell) == "visage_summon_familiars_stone_form" and GameRules.GetGameTime() > rubick.time and
                                                    Entity.GetAbsOrigin(summon):Distance(Entity.GetAbsOrigin(target)):Length2D() < 290
                                                then
                                                    Ability.CastNoTarget(summonspell)
                                                    rubick.time = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 1
                                                end
                                            end
                                        end
                                        if summoitem ~= nil and Ability.IsReady(summoitem) then
                                            if (Ability.GetBehavior(summoitem) & Enum.AbilityBehavior.DOTA_ABILITY_BEHAVIOR_UNIT_TARGET) ~= 0 then
                                                if Ability.GetName(summoitem) == "item_force_staff" or Ability.GetName(summoitem) == "item_hurricane_pike" then
                                                    if Entity.GetAbsOrigin(summon):Distance(Entity.GetAbsOrigin(target)):Length2D() > NPC.GetAttackRange(summon) and NPC.FindFacingNPC(summon, nil, Enum.TeamType.TEAM_ENEMY, 1125, 25) == target then
                                                        Ability.CastTarget(summoitem, summon)
                                                    end
                                                elseif Ability.GetName(summoitem) == "item_sheepstick" then
                                                    if bufftime > 0 and bufftime - GameRules.GetGameTime() <= 0.75 then
                                                        Ability.CastTarget(summoitem, target)
                                                    end
                                                else
                                                    Ability.CastTarget(summoitem, target)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if spell2 then
                        if Ability.GetName(spell2) == "ember_spirit_activate_fire_remnant" then
                            for key, remnant in ipairs(Entity.GetUnitsInRadius(me, 2000 ,Enum.TeamType.TEAM_FRIEND)) do
                                if remnant and NPC.GetUnitName(remnant) == "npc_dota_ember_spirit_remnant" and Entity.IsAlive(remnant) and
                                    Entity.GetAbsOrigin(remnant):Distance(Entity.GetAbsOrigin(target)):Length2D() < 300 then
                                    Ability.CastPosition(spell2, Entity.GetAbsOrigin(me))
                                end
                            end
                        elseif Ability.GetName(spell2) == "shredder_chakram_2" or Ability.GetName(spell2) == "shredder_chakram" then
                            if not NPC.IsRunning(target) then
                                Ability.CastPosition(spell2, Entity.GetAbsOrigin(target))
                            else
                                Ability.CastPosition(spell2, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(NPC.GetMoveSpeed(target)))
                            end
                        elseif Ability.GetName(spell2) == "shredder_return_chakram" or Ability.GetName(spell2) == "shredder_return_chakram_2" then
                            if GameRules.GetGameTime() > rubick.time2 and not NPC.HasModifier(target, "modifier_shredder_chakram_debuff") then
                                Ability.CastNoTarget(spell2)
                                rubick.time2 = 0
                            end
                        elseif Ability.GetName(spell2) == "templar_assassin_trap" then
                            for i, v in ipairs(Entity.GetUnitsInRadius(me, 2000 ,Enum.TeamType.TEAM_FRIEND)) do
                                if v and NPC.GetUnitName(v) == "npc_dota_templar_assassin_psionic_trap" and Entity.IsAlive(v) and
                                    Entity.GetAbsOrigin(v):Distance(Entity.GetAbsOrigin(target)):Length2D() < 300 then
                                    Ability.CastNoTarget(spell2)
                                end
                            end
                        elseif Ability.GetName(spell2) == "phoenix_sun_ray_toggle_move" then
                            if Entity.GetAbsOrigin(me):Distance(Entity.GetAbsOrigin(target)):Length2D() > 550 then
                                if GameRules.GetGameTime() > rubick.time2 then
                                    Ability.CastNoTarget(spell2)
                                    toggle = true
                                    rubick.time2 = GameRules.GetGameTime() + NetChannel.GetAvgLatency(Enum.Flow.FLOW_OUTGOING) + 1
                                end

                            else
                                if GameRules.GetGameTime() < rubick.time2 and toggle then
                                    Ability.CastNoTarget(spell2)
                                    toggle = false
                                    rubick.time2 = 0
                                end
                            end
                        elseif Ability.GetName(spell2) == "snapfire_spit_creep" or Ability.GetName(spell2) == "dragon_knight_fireball" and Ability.IsActivated(spell2) then
                            if not NPC.IsRunning(target) then
                                Ability.CastPosition(spell2, Entity.GetAbsOrigin(target))
                            else
                                Ability.CastPosition(spell2, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(NPC.GetMoveSpeed(target)))
                            end
                        end
                    end
                    if NPC.HasModifier(me, "modifier_snapfire_mortimer_kisses") or Ability.GetName(spell) == "void_spirit_dissimilate" and NPC.IsSilenced(me) then
                        if GameRules.GetGameTime() > rubick.time then
                            if not NPC.IsRunning(target) then
                                Player.PrepareUnitOrders(Players.GetLocal(), 1, nil, Entity.GetAbsOrigin(target), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                            else
                                Player.PrepareUnitOrders(Players.GetLocal(), 1, nil, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(NPC.GetMoveSpeed(target)), nil, Enum.PlayerOrderIssuer.DOTA_ORDER_ISSUER_HERO_ONLY, me)
                            end
                            rubick.time = GameRules.GetGameTime() + 0.33
                        end
                    end
                end
                for i = 1, NPCs.Count() do
                    local npc = NPCs.Get(i)
                    if npc and NPC.GetUnitName(npc) == "npc_dota_techies_remote_mine" and Entity.GetAbsOrigin(npc):Distance(Entity.GetAbsOrigin(target)):Length2D() < 400 then
                        local self_detonate = NPC.GetAbilityByIndex(npc, 0)
                        if self_detonate and Ability.IsReady(self_detonate) then
                            Ability.CastNoTarget(self_detonate)
                        end
                    end
                end

            else
                target = nil
            end
        end
    end
end

function rubick.aoe_cast(me, spell, target, radius, distance)
    if target and spell and Ability.IsReady(spell) then
        local count = Heroes.InRadius(Entity.GetAbsOrigin(me), distance, Entity.GetTeamNum(me), Enum.TeamType.TEAM_ENEMY)
        local enemies = Heroes.InRadius(Entity.GetAbsOrigin(target), radius, Entity.GetTeamNum(me), Enum.TeamType.TEAM_ENEMY)
        if #enemies == #count and #enemies > 1 then
            local pos = {}
            for i, v in ipairs(count) do
                if v then
                    table.insert(pos, {x = Entity.GetAbsOrigin(v):GetX(), y = Entity.GetAbsOrigin(v):GetY()})
                end
            end
            local x, y, c = 0, 0, #pos
            for i = 1, c do
                x = x + pos[i].x
                y = y + pos[i].y
            end
            return Ability.CastPosition(spell, Vector(x/c, y/c, 0))
        else
            if #enemies == 1 then
                return Ability.CastPosition(spell, Entity.GetAbsOrigin(target))
            end
        end
    end
    return nil
end

function rubick.aoe_cast2(me, spell, target, radius, distance)
    local smart_cast = false
    if target and spell and Ability.IsReady(spell) then
        for i = 1, math.floor((Entity.GetAbsOrigin(me) - Entity.GetAbsOrigin(target)):Length2D()) do
            for _, unit in ipairs(Heroes.InRadius(Entity.GetAbsOrigin(me) + (Entity.GetAbsOrigin(target) - Entity.GetAbsOrigin(me)):Normalized():Scaled(i * radius), radius, Entity.GetTeamNum(me),Enum.TeamType.TEAM_ENEMY)) do
                if unit and unit ~= target and Entity.IsAlive(unit) and not Entity.IsDormant(unit) then
                    smart_cast = true
                    return Ability.CastPosition(spell, Entity.GetAbsOrigin(unit) + (Entity.GetAbsOrigin(target) - Entity.GetAbsOrigin(unit)):Normalized():Scaled(Entity.GetAbsOrigin(unit):Distance(Entity.GetAbsOrigin(target)):Length2D() / 2))
                end
            end
        end
        if not smart_cast then
            if not NPC.IsRunning(target) then
                return Ability.CastPosition(spell, Entity.GetAbsOrigin(target))
            else
                return Ability.CastPosition(spell, Entity.GetAbsOrigin(target) + Entity.GetRotation(target):GetForward():Normalized():Scaled(NPC.GetMoveSpeed(target)))
            end
        end
    end
    return nil
end

function rubick.OnStartSound(sound)
    local me = Heroes.GetLocal()
    if me and sound.source and sound.source ~= me then
        if sound.name == "Hero_EmberSpirit.FireRemnant.Cast" then
            rubick.spellsound["npc_dota_hero_ember_spirit"]  = "ember_spirit_fire_remnant"
        elseif sound.name == "Hero_VoidSpirit.AetherRemnant.Cast" then
            rubick.spellsound["npc_dota_hero_void_spirit"] = "void_spirit_aether_remnant"
        elseif sound.name == "Hero_VoidSpirit.Pulse.Cast" then
            rubick.spellsound["npc_dota_hero_void_spirit"] = "void_spirit_resonant_pulse"
        elseif sound.name == "Hero_VoidSpirit.AstralStep.Start" then
            rubick.spellsound["npc_dota_hero_void_spirit"] = "void_spirit_astral_step"
        elseif sound.name == "Hero_Tinker.Rearm" then
            rubick.spellsound["npc_dota_hero_tinker"] = "tinker_rearm"
        elseif sound.name == "Hero_Phoenix.SuperNova.Explode" then
            rubick.spellsound["npc_dota_hero_phoenix"] = "phoenix_supernova"
        elseif sound.name == "Hero_Sniper.ShrapnelShatter" then
            rubick.spellsound["npc_dota_hero_sniper"] = "sniper_shrapnel"
        elseif sound.name == "Hero_NyxAssassin.Vendetta" then
            rubick.spellsound["npc_dota_hero_nyx_assassin"] = "nyx_assassin_vendetta"
        elseif sound.name == "Hero_Ancient_Apparition.IceBlast.Target" then
            rubick.spellsound["npc_dota_hero_ancient_apparition"] = "ancient_apparition_ice_blast"
        elseif sound.name == "Hero_StormSpirit.BallLightning" then
            rubick.spellsound["npc_dota_hero_storm_spirit"] = "storm_spirit_ball_lightning"
        elseif sound.name == "Hero_Wisp.Spirits.Cast" then
            rubick.spellsound["npc_dota_hero_wisp"] = "wisp_spirits_in"
        elseif sound.name == "Hero_Brewmaster.PrimalSplit.Spawn" then
            rubick.spellsound["npc_dota_hero_brewmaster"] = "brewmaster_primal_split"
        elseif sound.name == "Hero_Morphling.Waveform" then
            rubick.spellsound["npc_dota_hero_morphling"] = "morphling_waveform"
        elseif sound.name == "Hero_Hoodwink.AcornShot.Cast" then
            rubick.spellsound["npc_dota_hero_hoodwink"] = "hoodwink_acorn_shot"
        elseif sound.name == "Hero_Hoodwink.Scurry.Cast" then
            rubick.spellsound["npc_dota_hero_hoodwink"] = "hoodwink_scurry"
        elseif sound.name == "Hero_Phoenix.FireSpirits.Launch" then
            rubick.spellsound["npc_dota_hero_phoenix"] = "phoenix_launch_fire_spirit"
        else
            rubick.spellsound = {}
        end
    end
end

return rubick
