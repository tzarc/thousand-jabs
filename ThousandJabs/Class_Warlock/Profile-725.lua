if select(2, UnitClass('player')) ~= 'WARLOCK' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('7.2.5', '7.2.5') then return end

-- When exporting Warlock, summon each pet then re-run /tj _esd
-- Do this for both with and without Grimoire of Supremacy.
-- Only bother copy/pasting here once all pet abilities have been collected.

-- exported with /tj _esd
local destruction_abilities_exported = {
    backdraft = { TalentID = 22039, },
    banish = { SpellIDs = { 710 }, },
    berserking = { SpellIDs = { 26297 }, },
    burning_presence = { SpellIDs = { 171011 }, },
    burning_rush = { SpellIDs = { 111400 }, TalentID = 19291, },
    cataclysm = { SpellIDs = { 152108 }, TalentID = 22480, },
    cauterize_master = { SpellIDs = { 119899 }, },
    channel_demonfire = { SpellIDs = { 196447 }, TalentID = 22482, },
    chaos_bolt = { SpellIDs = { 116858 }, },
    conflagrate = { SpellIDs = { 17962 }, },
    consuming_shadows = { SpellIDs = { 3716 }, },
    create_healthstone = { SpellIDs = { 6201 }, },
    create_soulwell = { SpellIDs = { 29893 }, },
    cripple = { SpellIDs = { 170995 }, },
    dark_pact = { SpellIDs = { 108416 }, TalentID = 19288, },
    demon_skin = { TalentID = 22047, },
    demonic_circle = { SpellIDs = { 48018 }, TalentID = 19280, },
    demonic_gateway = { SpellIDs = { 111771 }, },
    devour_magic = { SpellIDs = { 19505 }, },
    dimensional_rift = { SpellIDs = { 196586 }, },
    doom_bolt = { SpellIDs = { 85692 }, },
    drain_life = { SpellIDs = { 234153 }, },
    empowered_life_tap = { TalentID = 22088, },
    enslave_demon = { SpellIDs = { 1098 }, },
    eradication = { TalentID = 21695, },
    eye_of_kilrogg = { SpellIDs = { 126 }, },
    fear = { SpellIDs = { 5782 }, },
    fire_and_brimstone = { TalentID = 22043, },
    firebolt = { SpellIDs = { 3110 }, },
    flee = { SpellIDs = { 89792 }, },
    grimoire_felhunter = { SpellIDs = { 111897 }, },
    grimoire_imp = { SpellIDs = { 111859 }, },
    grimoire_of_sacrifice = { SpellIDs = { 108503 }, TalentID = 19295, },
    grimoire_of_service = { TalentID = 19294, },
    grimoire_of_supremacy = { TalentID = 21182, },
    grimoire_succubus = { SpellIDs = { 111896 }, },
    grimoire_voidwalker = { SpellIDs = { 111895 }, },
    havoc = { SpellIDs = { 80240 }, },
    health_funnel = { SpellIDs = { 755 }, },
    immolate = { SpellIDs = { 348 }, },
    incinerate = { SpellIDs = { 29722 }, },
    lash_of_pain = { SpellIDs = { 7814 }, },
    lesser_invisibility = { SpellIDs = { 7870 }, },
    life_tap = { SpellIDs = { 1454 }, },
    meteor_strike = { SpellIDs = { 171017 }, },
    mortal_coil = { SpellIDs = { 6789 }, TalentID = 19285, },
    rain_of_fire = { SpellIDs = { 5740 }, },
    reverse_entropy = { TalentID = 21181, },
    ritual_of_summoning = { SpellIDs = { 698 }, },
    roaring_blaze = { TalentID = 22048, },
    seduction = { SpellIDs = { 6358 }, },
    seethe = { SpellIDs = { 171014 }, },
    shadow_bite = { SpellIDs = { 54049 }, },
    shadow_bulwark = { SpellIDs = { 17767 }, },
    shadow_lock = { SpellIDs = { 171138 }, },
    shadow_shield = { SpellIDs = { 115232 }, },
    shadowburn = { SpellIDs = { 17877 }, TalentID = 22052, },
    shadowfury = { SpellIDs = { 30283 }, TalentID = 19286, },
    singe_magic = { SpellIDs = { 89808 }, },
    soul_conduit = { TalentID = 19293, },
    soul_harvest = { SpellIDs = { 196098 }, TalentID = 22046, },
    soulstone = { SpellIDs = { 20707 }, },
    spell_lock = { SpellIDs = { 19647 }, },
    suffering = { SpellIDs = { 17735 }, },
    summon_doomguard = { SpellIDs = { 18540, 157757 }, },
    summon_felhunter = { SpellIDs = { 691 }, },
    summon_imp = { SpellIDs = { 688 }, },
    summon_infernal = { SpellIDs = { 1122, 157898 }, },
    summon_succubus = { SpellIDs = { 712 }, },
    summon_voidwalker = { SpellIDs = { 697 }, },
    threatening_presence = { SpellIDs = { 112042 }, },
    torch_magic = { SpellIDs = { 171021 }, },
    unending_breath = { SpellIDs = { 5697 }, },
    unending_resolve = { SpellIDs = { 104773 }, },
    whiplash = { SpellIDs = { 6360 }, },
    wreak_havoc = { TalentID = 22481, },
}

local destruction_base_overrides = {
    pet = {
        doomguard_active = function(spell, env)
            return env.doom_bolt.in_spellbook
        end,
    },
    immolate = {
        AuraID = { 157736, },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplyLength = 18,
        spell_tick_time = 2, --TODO
        aura_duration = function(spell, env) return spell.aura_remains and spell.AuraApplyLength or 0 end,
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
        aura_duration = function(spell, env)
            return env.wreak_havoc.talent_enabled and 20 or 8
        end,
        aura_remains = function(spell, env)
            return math.max(0, spell.expirationTime - env.currentTime)
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
}

local destruction_legendaries = {
    lessons_of_spacetime = {
        AuraID = { 236174, },
        AuraUnit = 'player',
        AuraMine = true,
    },
    sindorei_spite_icd = {
        cooldown_remains = function(spell, env)
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
            local havocLength = env.wreak_havoc.talent_enabled and 20 or 8
            env.havoc.expirationTime = (havocTarget.timeApplied > 0)
                and havocTarget.timeApplied + havocLength
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
    conditional_substitutions = {
        { "active_havoc", "havoc" },
        { "soul_shard", "soul_shards" },
        { "soul_shardss", "soul_shards" },
    }
})
