local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Config = TJ:GetModule('Config')

-- exported with /tj _esd
local destruction_abilities_exported = {
    auto_attack = { SpellIDs = { 6603 }, },
    backdraft = { TalentIDs = { 1, 1 }, },
    banish = { SpellIDs = { 710 }, },
    berserking = { SpellIDs = { 26297 }, },
    burning_rush = { SpellIDs = { 111400 }, TalentIDs = { 5, 2 }, },
    cataclysm = { TalentIDs = { 2, 2 }, },
    channel_demonfire = { TalentIDs = { 7, 2 }, },
    chaos_bolt = { SpellIDs = { 116858 }, },
    conflagrate = { SpellIDs = { 17962 }, },
    create_healthstone = { SpellIDs = { 6201 }, },
    create_soulwell = { SpellIDs = { 29893 }, },
    dark_pact = { TalentIDs = { 5, 3 }, },
    demon_skin = { TalentIDs = { 5, 1 }, },
    demonic_circle = { SpellIDs = { 48018 }, TalentIDs = { 3, 1 }, },
    demonic_gateway = { SpellIDs = { 111771 }, },
    dimensional_rift = { SpellIDs = { 196586 }, },
    drain_life = { SpellIDs = { 234153 }, },
    enslave_demon = { SpellIDs = { 1098 }, },
    eradication = { TalentIDs = { 4, 1 }, },
    eye_of_kilrogg = { SpellIDs = { 126 }, },
    fear = { SpellIDs = { 5782 }, },
    fire_and_brimstone = { TalentIDs = { 4, 2 }, },
    grimoire_of_sacrifice = { TalentIDs = { 6, 3 }, },
    grimoire_of_service = { TalentIDs = { 6, 2 }, },
    grimoire_of_supremacy = { TalentIDs = { 6, 1 }, },
    havoc = { SpellIDs = { 80240 }, },
    health_funnel = { SpellIDs = { 755 }, },
    immolate = { SpellIDs = { 348 }, },
    incinerate = { SpellIDs = { 29722 }, },
    life_tap = { SpellIDs = { 1454 }, },
    mana_tap = { TalentIDs = { 2, 3 }, },
    mobile_banking = { SpellIDs = { 83958 }, },
    mortal_coil = { TalentIDs = { 3, 2 }, },
    rain_of_fire = { SpellIDs = { 5740 }, },
    reverse_entropy = { TalentIDs = { 2, 1 }, },
    ritual_of_summoning = { SpellIDs = { 698 }, },
    roaring_blaze = { TalentIDs = { 1, 2 }, },
    shadowburn = { TalentIDs = { 1, 3 }, },
    shadowfury = { TalentIDs = { 3, 3 }, },
    shoot = { SpellIDs = { 5019 }, },
    soul_conduit = { TalentIDs = { 7, 3 }, },
    soul_harvest = { TalentIDs = { 4, 3 }, },
    soulstone = { SpellIDs = { 20707 }, },
    spell_lock = { SpellIDs = { 119910 }, },
    summon_doomguard = { SpellIDs = { 157757 }, },
    summon_felhunter = { SpellIDs = { 691 }, },
    summon_imp = { SpellIDs = { 688 }, },
    summon_infernal = { SpellIDs = { 157898 }, },
    summon_succubus = { SpellIDs = { 712 }, },
    summon_voidwalker = { SpellIDs = { 697 }, },
    unending_breath = { SpellIDs = { 5697 }, },
    unending_resolve = { SpellIDs = { 104773 }, },
    wreak_havoc = { TalentIDs = { 7, 1 }, },
}

local destruction_base_overrides = {
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
        CanCast = function(spell, env)
            return (env.health.percent > 10) and true or false
        end,
        PerformCast = function(spell, env)
            env.mana.gained = env.mana.gained + (env.mana.max * 0.3)
        end,
    },
    backdraft = {
        AuraID = { 117828, },
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
        Icon = function(spell, env) return select(3, GetSpellInfo(108501)) end,
    },
    havoc = {
        expirationTime = 0,
        aura_remains = function(spell, env)
            return math.max(0, spell.expirationTime - env.currentTime)
        end,
        PerformCast = function(spell, env)
            spell.expirationTime = env.currentTime + (env.wreak_havoc.talent_enabled and 20 or 8)
        end,
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
        elseif sourceGUID == UnitGUID('player') and combatEvent == "SPELL_AURA_APPLIED" and arg12 == 80240 then -- Havoc applied by player
            havocTarget.targetGUID = destGUID
            havocTarget.timeApplied = GetTime()
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
    betaProfile = true,
    name = 'Destruction',
    class_id = 9,
    spec_id = 3,
    action_profile = 'legion-dev::warlock::destruction',
    resources = { 'mana', 'soul_shards' },
    events = destruction_events,
    actions = {
        destruction_abilities_exported,
        destruction_base_overrides,
        destruction_talent_overrides,
        destruction_hooks,
    },
    blacklisted = {},
    config_checkboxes = {
        lord_of_flames_selected = true,
        conflagration_of_chaos_selected = true,
    },
    conditional_substitutions = {
        { "soul_shard", "soul_shards" },
        { "soul_shardss", "soul_shards" },
    }
})
