--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(2, UnitClass('player')) ~= 'WARLOCK' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('8.0.0', '8.0.9') then return end

local mmin = math.min

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Destruction

-- When exporting Warlock, summon each pet then re-run /tj _esd
-- Do this for both with and without both Grimoire of Supremacy/Grimoire of Service.
-- Only bother copy/pasting here once all pet abilities have been collected.

-- exported with /tj _esd
local destruction_abilities_exported = {
    backdraft = { SpellIDs = { 196406 }, },
    banish = { SpellIDs = { 710 }, },
    berserking = { SpellIDs = { 26297 }, },
    blood_pact = { SpellIDs = { 6307 }, },
    burning_rush = { SpellIDs = { 111400 }, TalentID = 19285, },
    cataclysm = { SpellIDs = { 152108 }, TalentID = 23143, },
    channel_demonfire = { SpellIDs = { 196447 }, TalentID = 23144, },
    chaos_bolt = { SpellIDs = { 116858 }, },
    conflagrate = { SpellIDs = { 17962 }, },
    consuming_shadows = { SpellIDs = { 3716 }, },
    create_healthstone = { SpellIDs = { 6201 }, },
    create_soulwell = { SpellIDs = { 29893 }, },
    dark_pact = { SpellIDs = { 108416 }, TalentID = 19286, },
    dark_soul_instability = { SpellIDs = { 113858 }, TalentID = 23092, },
    darkfury = { TalentID = 22047, },
    demon_skin = { TalentID = 19280, },
    demonic_circle = { SpellIDs = { 48018 }, TalentID = 19288, },
    demonic_circle_teleport = { SpellIDs = { 48020 }, },
    demonic_gateway = { SpellIDs = { 111771 }, },
    devour_magic = { SpellIDs = { 19505 }, },
    drain_life = { SpellIDs = { 234153 }, },
    enslave_demon = { SpellIDs = { 1098 }, },
    eradication = { TalentID = 22090, },
    eye_of_kilrogg = { SpellIDs = { 126 }, },
    fear = { SpellIDs = { 5782 }, },
    fire_and_brimstone = { TalentID = 22043, },
    firebolt = { SpellIDs = { 3110 }, },
    flashover = { TalentID = 22038, },
    flee = { SpellIDs = { 89792 }, },
    grimoire_of_sacrifice = { SpellIDs = { 108503 }, TalentID = 19295, },
    grimoire_of_supremacy = { TalentID = 23156, },
    havoc = { SpellIDs = { 80240 }, },
    health_funnel = { SpellIDs = { 755 }, },
    immolate = { SpellIDs = { 348 }, },
    incinerate = { SpellIDs = { 29722 }, },
    inferno = { TalentID = 22480, },
    internal_combustion = { TalentID = 21695, },
    lash_of_pain = { SpellIDs = { 7814 }, },
    lesser_invisibility = { SpellIDs = { 7870 }, },
    mortal_coil = { SpellIDs = { 6789 }, TalentID = 19291, },
    rain_of_fire = { SpellIDs = { 5740 }, },
    reverse_entropy = { TalentID = 23148, },
    ritual_of_summoning = { SpellIDs = { 698 }, },
    roaring_blaze = { TalentID = 23155, },
    seduction = { SpellIDs = { 6358, 119909 }, },
    shadow_bite = { SpellIDs = { 54049 }, },
    shadow_bulwark = { SpellIDs = { 17767 }, },
    shadow_shield = { SpellIDs = { 264993 }, },
    shadowburn = { SpellIDs = { 17877 }, TalentID = 23157, },
    shadowfury = { SpellIDs = { 30283 }, },
    singe_magic = { SpellIDs = { 89808 }, },
    soul_conduit = { TalentID = 19284, },
    soul_fire = { SpellIDs = { 6353 }, TalentID = 22040, },
    soul_leech = { SpellIDs = { 108370 }, },
    soul_shards = { SpellIDs = { 246985 }, },
    soulstone = { SpellIDs = { 20707 }, },
    spell_lock = { SpellIDs = { 19647 }, },
    suffering = { SpellIDs = { 17735 }, },
    summon_felhunter = { SpellIDs = { 691 }, },
    summon_imp = { SpellIDs = { 688 }, },
    summon_infernal = { SpellIDs = { 1122 }, },
    summon_succubus = { SpellIDs = { 712 }, },
    summon_voidwalker = { SpellIDs = { 697 }, },
    threatening_presence = { SpellIDs = { 112042 }, },
    unending_breath = { SpellIDs = { 5697 }, },
    unending_resolve = { SpellIDs = { 104773 }, },
    whiplash = { SpellIDs = { 6360 }, },
}

local destruction_base_overrides = {
    pet = {
        doomguard_active = function(spell, env)
            return env.doom_bolt.in_spellbook
        end,
        infernal_active = function(spell, env)
            return env.summon_infernal.time_since_last_cast < 30 and true or false
        end,
    },
    immolate = {
        AuraID = { 157736, },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplyLength = 18,
        spell_tick_time = 2, --TODO
        aura_duration = function(spell, env) return spell.aura_remains and spell.AuraApplyLength or 0 end,
        spell_refreshable = function(spell, env)
            if spell.aura_down then return true end
            if spell.aura_remains <= spell.aura_duration * 0.3 then return true end
            return false
        end,
        PerformCast = function(spell, env)
            -- We need to handle Pandemic manually
            if spell.aura_remains == 0 then
                spell.expirationTime = env.currentTime + 18
            else
                spell.expirationTime = spell.expirationTime + 18
            end
            if (spell.expirationTime - env.currentTime) > 24 then
                spell.expirationTime = env.currentTime + 24
            end
        end,
    },
    conflagrate = {
        PerformCast = function(spell,env)
            env.soul_shards.gained = env.soul_shards.gained + 1
            if env.backdraft.talent_enabled then
                env.backdraft.expirationTime = env.currentTime + 5
            end
            if env.roaring_blaze.talent_enabled then
                local target = UnitGUID('target')
                if env.roaring_blaze.roaringBlazeStacks[target] then
                    env.roaring_blaze.roaringBlazeStacks[target] = env.roaring_blaze.roaringBlazeStacks[target] + 1
                end
            end
        end,
    },
    life_tap = {
        aura_duration = function(spell, env)
            return env.empowered_life_tap.talent_enabled and 20 or 0
        end,
        CanCast = function(spell, env)
            return (env.health.percent > 10) and true or false
        end,
        PerformCast = function(spell, env)
            env.mana.gained = env.mana.gained + (env.mana.max * 0.3)
            if env.empowered_life_tap.talent_enabled then
                env.empowered_life_tap.expirationTime = env.currentTime + 20
            end
        end,
    },
    backdraft = {
        AuraID = { 117828, },
        AuraUnit = 'player',
        AuraMine = true,
    },
    demonic_power = {
        AuraID = { 196099, },
        AuraUnit = 'player',
        AuraMine = true,
    },
    lord_of_flames = {
        AuraID = { 224103, },
        AuraUnit = 'player',
        AuraMine = true,
        artifact_selected = function(spell,env) return Config:GetSpec("lord_of_flames_selected") end,
        artifact_rank = function(spell, env) return spell.artifact_selected and 1 or 0 end,
    },
    conflagration_of_chaos = {
        AuraID = { 196546, },
        AuraUnit = 'player',
        AuraMine = true,
        artifact_selected = function(spell,env) return Config:GetSpec("conflagration_of_chaos_selected") end,
        artifact_rank = function(spell, env) return spell.artifact_selected and 1 or 0 end,
    },
    service_pet = {
        SpellIDs = { 111859, 111895, 111896, 111897 },
        Icon = function() return select(3, GetSpellInfo(108501)) end,
    },
    havoc = {
        expirationTime = 0,
        aura_duration = 10,
        aura_remains = function(spell, env)
            return math.max(0, spell.expirationTime - env.currentTime)
        end,
        CanCast = function(spell, env)
            return env.active_enemies > 1 and true or false
        end,
        PerformCast = function(spell, env)
            spell.expirationTime = env.currentTime + spell.aura_duration
        end,
    },
    embrace_chaos = { -- T19 2P bonus
        AuraID = { 212019, },
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local destruction_talent_overrides = {
    roaring_blaze = {
        aura_remains = function(spell, env)
            if not env.roaring_blaze.talent_enabled then return 0 end
            return (spell.aura_stack > 0)
                and env.immolate.aura_remains
                or 0
        end,
        aura_stack = function(spell,env)
            if not env.roaring_blaze.talent_enabled then return 0 end
            local target = UnitGUID('target')
            local stacks = env.roaring_blaze.roaringBlazeStacks[target]
            return env.immolate.aura_remains
                and stacks
                or 0
        end,
    },
    empowered_life_tap = {
        AuraID = 235156,
        AuraUnit = 'player',
        AuraMine = true
    },
    channel_demonfire = {
        spell_cast_time = function(spell, env)
            return 3 * env.playerHasteMultiplier
        end
    },
    grimoire_of_sacrifice = {
        CanCast = function(spell, env)
            return env.demonic_power.aura_down
        end,
    },
}

local destruction_legendaries = {
    lessons_of_spacetime = {
        AuraID = { 236174, },
        AuraUnit = 'player',
        AuraMine = true,
    },
    sindorei_spite_icd = {
        cooldown_remains_override = function(spell, env)
            return 99999 -- TODO
        end,
    },
}

local havocTarget = {
    timeApplied = 0,
    targetGUID = "",
}
local roaringBlazeStacks = {}

local destruction_events = {
    COMBAT_LOG_EVENT_UNFILTERED = function(profile, eventName, timeStamp, combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, arg12, arg13, arg14, arg15)
        if combatEvent == "UNIT_DIED" then
            -- Check if the current havoc target died, if so, wipe out the data tracking it
            if havocTarget.targetGUID == destGUID then
                havocTarget.targetGUID = ""
                havocTarget.timeApplied = 0
            end

            -- Wipe out any data tracking Immolate targets w.r.t. Roaring Blaze
            roaringBlazeStacks[destGUID] = nil
        elseif sourceGUID == UnitGUID('player') and (combatEvent == "SPELL_AURA_APPLIED" or combatEvent == "SPELL_AURA_REFRESH") and arg12 == 80240 then -- Havoc applied by player
            havocTarget.targetGUID = destGUID
            havocTarget.timeApplied = GetTime() - 2 -- subtract 2 seconds as it likes to timeout midway thru Chaos Bolt
        elseif sourceGUID == UnitGUID('player') and arg12 == 157736 then -- Immolate/Roaring Blaze stack handling
            if combatEvent == "SPELL_AURA_APPLIED" or combatEvent == "SPELL_AURA_REFRESH" then
                roaringBlazeStacks[destGUID] = 0
        elseif combatEvent == "SPELL_AURA_REMOVED" then
            roaringBlazeStacks[destGUID] = nil
        end
        elseif sourceGUID == UnitGUID('player') and combatEvent == "SPELL_CAST_SUCCESS" and arg12 == 17962 then -- We casted conflag on a unit
            if roaringBlazeStacks[destGUID] then
                roaringBlazeStacks[destGUID] = roaringBlazeStacks[destGUID] + 1
        end
        end
    end,
}

local destruction_hooks = {
    hooks = {
        OnStateInit = function(env)
            env.havoc.expirationTime = (havocTarget.timeApplied > 0)
                and havocTarget.timeApplied + 10
                or 0

            env.roaring_blaze.roaringBlazeStacks = {}
            for k,v in pairs(roaringBlazeStacks) do
                env.roaring_blaze.roaringBlazeStacks[k] = roaringBlazeStacks[k]
            end
        end,
    },
}

TJ:RegisterPlayerClass({
    name = 'Destruction',
    class_id = 9,
    spec_id = 3,
    default_action_profile = 'simc::warlock::destruction',
    resources = { 'mana', 'mana_per_time_no_base', 'soul_shards' },
    events = destruction_events,
    actions = {
        destruction_abilities_exported,
        destruction_base_overrides,
        destruction_talent_overrides,
        destruction_legendaries,
        destruction_hooks,
    },
    blacklisted = {
        'summon_pet',
        'summon_doomguard',
        'summon_felhunter',
        'summon_imp',
        'summon_infernal',
        'summon_succubus',
        'summon_voidwalker',
        'doom_bolt', -- uses energy, not set up to retrieve anything for pets at this stage
    },
    config_checkboxes = {
        lord_of_flames_selected = false,
        conflagration_of_chaos_selected = false,
    },
    conditional_substitutions_post = {
        { "active_havoc", "havoc" },
        { "soul_shard", "soul_shards" },
        { "soul_shardss", "soul_shards" },
    }
})

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Demonology

-- When exporting Warlock, summon each pet then re-run /tj _esd
-- Do this for both with and without both Grimoire of Supremacy/Grimoire of Service.
-- Only bother copy/pasting here once all pet abilities have been collected.

-- exported with /tj _esd
local demonology_abilities_exported = {
    ancient_history = { SpellIDs = { 255663 }, },
    arcane_pulse = { SpellIDs = { 260364 }, },
    banish = { SpellIDs = { 710 }, },
    bilescourge_bombers = { SpellIDs = { 267211 }, TalentID = 23138, },
    burning_rush = { SpellIDs = { 111400 }, TalentID = 19285, },
    call_dreadstalkers = { SpellIDs = { 104316 }, },
    cantrips = { SpellIDs = { 255661 }, },
    create_healthstone = { SpellIDs = { 6201 }, },
    create_soulwell = { SpellIDs = { 29893 }, },
    dark_pact = { SpellIDs = { 108416 }, TalentID = 19286, },
    darkfury = { TalentID = 22047, },
    demon_skin = { TalentID = 19280, },
    demonbolt = { SpellIDs = { 264178 }, },
    demonic_calling = { TalentID = 22045, },
    demonic_circle = { SpellIDs = { 48018 }, TalentID = 19288, },
    demonic_circle_teleport = { SpellIDs = { 48020 }, },
    demonic_consumption = { TalentID = 22479, },
    demonic_core = { SpellIDs = { 267102 }, },
    demonic_gateway = { SpellIDs = { 111771 }, },
    demonic_strength = { SpellIDs = { 267171 }, TalentID = 22048, },
    doom = { SpellIDs = { 265412 }, TalentID = 23158, },
    drain_life = { SpellIDs = { 234153 }, },
    dreadlash = { TalentID = 19290, },
    enslave_demon = { SpellIDs = { 1098 }, },
    eye_of_kilrogg = { SpellIDs = { 126 }, },
    fear = { SpellIDs = { 5782 }, },
    from_the_shadows = { TalentID = 22477, },
    grimoire_felguard = { SpellIDs = { 111898 }, TalentID = 21717, },
    hand_of_guldan = { SpellIDs = { 105174 }, },
    health_funnel = { SpellIDs = { 755 }, },
    implosion = { SpellIDs = { 196277 }, },
    inner_demons = { TalentID = 23146, },
    magical_affinity = { SpellIDs = { 255665 }, },
    mastery_master_demonologist = { SpellIDs = { 77219 }, },
    mortal_coil = { SpellIDs = { 6789 }, TalentID = 19291, },
    nether_portal = { SpellIDs = { 267217 }, TalentID = 23091, },
    power_siphon = { SpellIDs = { 264130 }, TalentID = 21694, },
    ritual_of_summoning = { SpellIDs = { 698 }, },
    sacrificed_souls = { TalentID = 23161, },
    shadow_bolt = { SpellIDs = { 686 }, },
    shadowfury = { SpellIDs = { 30283 }, },
    soul_conduit = { TalentID = 23147, },
    soul_leech = { SpellIDs = { 108370 }, },
    soul_link = { SpellIDs = { 108415 }, },
    soul_shards = { SpellIDs = { 246985 }, },
    soul_strike = { SpellIDs = { 264057 }, TalentID = 22042, },
    soulstone = { SpellIDs = { 20707 }, },
    summon_demonic_tyrant = { SpellIDs = { 265187 }, },
    summon_felguard = { SpellIDs = { 30146 }, },
    summon_felhunter = { SpellIDs = { 691 }, },
    summon_imp = { SpellIDs = { 688 }, },
    summon_succubus = { SpellIDs = { 712 }, },
    summon_vilefiend = { SpellIDs = { 264119 }, TalentID = 23160, },
    summon_voidwalker = { SpellIDs = { 697 }, },
    unending_breath = { SpellIDs = { 5697 }, },
    unending_resolve = { SpellIDs = { 104773 }, },
}

local wild_imp_spawn_times = {}
local wild_imp_despawn_times = {}

local demonology_abilities_common = {
    shadow_bolt = {
        PerformCast = function(spell, env)
            env.soul_shards.gained = env.soul_shards.gained + mmin(1, env.soul_shards.deficit)
        end,
    },
    demonbolt = {
        PerformCast = function(spell, env)
            env.in_combat = true
            env.soul_shards.gained = env.soul_shards.gained + mmin(2, env.soul_shards.deficit)
            if env.demonic_core.aura_stack > 0 then
                env.demonic_core.aura_stack = env.demonic_core.aura_stack - 1
            end
            if env.demonic_core.aura_stack == 0 then
                env.demonic_core.expirationTime = 0
            end
        end,
    },
    hand_of_guldan = {
        cost_type = 'soul_shards',
        soul_shards_cost = function(spell, env)
            return max(1, min(3, env.soul_shards.curr))
        end,
    },
    dreadstalkers = {
        aura_remains = function(spell, env)
            return (env.call_dreadstalkers.time_since_last_cast + 12) - env.currentTime
        end,
        aura_up = function(spell, env) return (spell.aura_remains > 0) and true or false end,
        aura_down = function(spell, env) return (not spell.aura_up) and true or false end,
        aura_ticking = function(spell, env) return spell.aura_up and true or false end,
        aura_react = function(spell, env) return spell.aura_up and true or false end,
    },
    wild_imps = {
        AuraID = 279910,
        AuraUnit = 'player',
        AuraMine = true,
        spawn_times = {},
        despawn_times = {},
        wild_imp_default_lifetime = 20,
        aura_stack = function(spell, env)
            local totalCount = 0
            local lastSpawn = 0

            -- Clear out any despawned imps
            for guid,time in pairs(spell.despawn_times) do
                if time < env.currentTime then
                    spell.spawn_times[guid] = nil
                    spell.despawn_times[guid] = nil
                else
                    totalCount = totalCount + 1
                end
            end

            -- Work out the last spawn time
            for guid,time in pairs(spell.spawn_times) do
                if lastSpawn < time then lastSpawn = time end
            end

            if env.inner_demons.talent_enabled and lastSpawn + env.inner_demons.auto_spawn_frequency < env.currentTime then
                spell.spawn_times['dummy'] = lastSpawn + env.inner_demons.auto_spawn_frequency
                spell.despawn_times['dummy'] = lastSpawn + env.inner_demons.auto_spawn_frequency + spell.wild_imp_default_lifetime
                totalCount = totalCount + 1
            end
            return totalCount
        end
    },
    vilefiend = {
    },
    doom = {
        AuraID = 264173,
        AuraUnit = 'target',
        AuraMine = true,
        aura_duration = 30,
    },
    demonic_core = {
        AuraID = 264173,
        AuraUnit = 'player',
        AuraMine = true,
    },
    summon_demonic_tyrant = {
        AuraApplied = 'demonic_power',
        AuraApplyLength = 15,
        demon_lifetime_extension = 15,
        PerformCast = function(spell, env)
            local dt = env.wild_imps.despawn_times
            for guid,time in pairs(dt) do
                dt[guid] = time + spell.demon_lifetime_extension
            end
        end,
    },
    inner_demons = {
        auto_spawn_frequency = 12,
    },
    demonic_power = {
        AuraID = 265273,
        AuraUnit = 'player',
        AuraMine = true,
    },
}

local demonology_events = {
    COMBAT_LOG_EVENT_UNFILTERED = function(classModule, eventName)
        local now = GetTime()
        local timeStamp, combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24 = CombatLogGetCurrentEventInfo()
        if combatEvent == 'SPELL_SUMMON' and arg12 == classModule.actions.wild_imps.AuraID then
            wild_imp_spawn_times[destGUID] = now
            wild_imp_despawn_times[destGUID] = now + classModule.actions.wild_imps.wild_imp_default_lifetime
        end
        if combatEvent == 'SPELL_CAST_SUCCESS' and arg12 == classModule.actions.summon_demonic_tyrant.SpellIDs[1] then
            for guid,time in pairs(wild_imp_despawn_times) do
                wild_imp_despawn_times[guid] = time + classModule.actions.summon_demonic_tyrant.demon_lifetime_extension
            end
        end
    end
}

local demonology_hooks = {
    hooks = {
        OnStateInit = function(env)
            local now = GetTime()

            -- Handle Wild Imp despawning
            wipe(env.wild_imps.spawn_times)
            wipe(env.wild_imps.despawn_times)
            for guid,time in pairs(wild_imp_spawn_times) do
                env.wild_imps.spawn_times[guid] = time
            end
            for guid,time in pairs(wild_imp_despawn_times) do
                if time <= now then
                    -- Handle Wild Imp despawns
                    wild_imp_spawn_times[guid] = nil
                    wild_imp_despawn_times[guid] = nil
                else
                    -- Copy across Wild Imps to the current state
                    env.wild_imps.despawn_times[guid] = time
                end
            end
        end,
        OnPredictActionAtOffset = function(env)
            Core:Debug("Current imp count: %d", env.wild_imps.aura_stack)
            Core:Debug(env.wild_imps.spawn_times)
            Core:Debug(env.wild_imps.despawn_times)
        end,
    },
}

TJ:RegisterPlayerClass({
    name = 'Demonology',
    class_id = 9,
    spec_id = 2,
    default_action_profile = 'simc::warlock::demonology',
    resources = { 'mana', 'mana_per_time_no_base', 'soul_shards' },
    events = demonology_events,
    actions = {
        demonology_hooks,
        demonology_abilities_exported,
        demonology_abilities_common,
    },
    blacklisted = {
        'summon_pet',
        'summon_doomguard',
        'summon_felhunter',
        'summon_imp',
        'summon_infernal',
        'summon_succubus',
        'summon_voidwalker',
        'doom_bolt', -- uses energy, not set up to retrieve anything for pets at this stage
    },
})
