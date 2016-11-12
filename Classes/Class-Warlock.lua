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
        AuraApplied = 'immolate',
        AuraApplyLength = 18,
        spell_tick_time = 2, --TODO
        spell_duration = 18, --TODO
    },
    conflagrate = {
        PerformCast = function(spell,env)
            if env.backdraft.talent_selected then
                env.backdraft.expirationTime = env.currentTime + 5
            end
            env.soul_shards.gained = env.soul_shards.gained + 1
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
    },
    havoc = {
        AuraID = { 80240 },
        AuraUnit = 'target',
        AuraMine = true,
        AuraApplied = 'havoc',
        AuraApplyLength = 20,
    },
}

-- [[

TJ:RegisterPlayerClass({
    betaProfile = true,
    name = 'Destruction',
    class_id = 9,
    spec_id = 3,
    action_profile = 'legion-dev::warlock::destruction',
    resources = { 'mana', 'soul_shards' },
    actions = {
        destruction_abilities_exported,
        destruction_base_overrides,
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

-- ]]
