local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')
local UnitCache = TJ:GetModule('UnitCache')

local BOOKTYPE_PET = BOOKTYPE_PET
local BOOKTYPE_SPELL = BOOKTYPE_SPELL
local getmetatable = getmetatable
local GetSpellInfo = GetSpellInfo
local GetTalentInfoByID = GetTalentInfoByID
local IsSpellInRange = IsSpellInRange
local mfloor = math.floor
local mmax = math.max
local mmin = math.min
local pairs = pairs
local rawget = rawget
local select = select
local type = type

Core:Safety()

Core:RegisterFallbackTable('talent', {
    talent_enabled = function(spell, env)
        return select(10, GetTalentInfoByID(spell.TalentID)) and true or false
    end,
})

Core:RegisterFallbackTable('aura', {
    aura_remains = function(spell, env) return mmax(0, spell.expirationTime - env.currentTime) end,
    aura_up = function(spell, env) return (spell.aura_remains > 0) and true or false end,
    aura_down = function(spell, env) return (not spell.aura_up) and true or false end,
    aura_ticking = function(spell, env) return spell.aura_up and true or false end,
    aura_react = function(spell, env) return spell.aura_up and true or false end,
    aura_stack = function(spell, env) return spell.auraCount or 0 end,
})

Core:RegisterFallbackTable('action_cooldown', {
    CooldownTime = function(action, env) return (action.IsCooldownAffectedByHaste and env.playerHasteMultiplier or 1) * action.FullCooldownSecs end,

    spell_cooldown = function(spell, env) return spell.CooldownTime end,
    spell_recharge_time = function(spell, env) return spell.CooldownTime end,
    cooldown_remains = function(spell, env) return (spell.blacklisted and 999) or mmax(0, spell.cooldownStart + spell.cooldownDuration - env.currentTime) end,
    cooldown_ready = function(spell, env) return (spell.cooldown_remains == 0) and true or false end,
    cooldown_up = function(spell, env) return spell.cooldown_ready and true or false end,
    cooldown_down = function(spell, env) return (not spell.cooldown_ready) and true or false end,
    cooldown_react = function(spell, env) return spell.cooldown_ready and true or false end,
    spell_charges = function(spell, env) return spell.cooldown_ready and 1 or 0 end,
})

Core:RegisterFallbackTable('action_charges', {
    RechargeTime = function(action, env) return (action.IsRechargeAffectedByHaste and env.playerHasteMultiplier or 1) * action.FullRechargeSecs end,

    spell_max_charges = function(action, env) return action.UsesSpellCountForCharges and 999 or action.rechargeMax end,
    spell_charges_fractional = function(spell, env)
        if spell.UsesSpellCountForCharges then
            return (spell.blacklisted and 0) or (spell.rechargeSampled - spell.rechargeSpent)
        end

        local f = (spell.rechargeSampled == spell.rechargeMax)
            and spell.rechargeMax - spell.rechargeSpent
            or spell.rechargeSampled + (env.currentTime - spell.rechargeStartTime) / spell.rechargeDuration - spell.rechargeSpent
        return (spell.blacklisted and 0) or mmin(f, spell.rechargeMax)
    end,

    spell_charges = function(spell, env) return mfloor(spell.spell_charges_fractional + 0.001) end,
    spell_recharge_time = function(spell, env)
        local remains = (spell.blacklisted and 999) or (spell.rechargeStartTime + spell.rechargeDuration - env.currentTime)
        return (spell.spell_charges > 0) and 0 or remains
    end,

    cooldown_remains = function(spell, env) return mmax(0, spell.spell_recharge_time) end,
    cooldown_ready = function(spell, env) return (spell.cooldown_remains == 0) and true or false end,
    cooldown_up = function(spell, env) return spell.cooldown_ready and true or false end,
    cooldown_down = function(spell, env) return (not spell.cooldown_ready) and true or false end,
    cooldown_react = function(spell, env) return spell.cooldown_ready and true or false end,
    cooldown_charges_fractional = function(spell, env) return spell.spell_charges_fractional end,
    cooldown_charges = function(spell, env) return spell.spell_charges end,
})

Core:RegisterFallbackTable('castable', {
    last_cast = function(action, env)
        local state = getmetatable(action).__state
        local latest = 0
        if action:HasKey('SpellIDs') then
            for _,spellID in pairs(action.SpellIDs) do
                local cast = state.lastCastTimes[spellID]
                if cast and cast > latest then latest = cast end
            end
        end
        return latest
    end,
    time_since_last_cast = function(spell, env)
        return env.currentTime - spell.last_cast
    end,

    base_cast_time = function(action, env)
        if not action:HasKey('AbilityID') then return 0 end
        local castTime = select(4, GetSpellInfo(action.AbilityID))
        if castTime and castTime > 0 then
            return select(4, GetSpellInfo(action.AbilityID)) / 1000.0
        end
        local gcd = TJ.currentGCD * env.playerHasteMultiplier
        return (gcd > 1) and gcd or 1
    end,
})

Core:RegisterFallbackTable('action_final_fallback', {
    Name = function(action, env) return action:HasKey('OverallSpellID') and select(1, GetSpellInfo(action.OverallSpellID)) or nil end,
    Icon = function(action, env) return action:HasKey('OverallSpellID') and select(3, GetSpellInfo(action.OverallSpellID)) or nil end,
    OverlayTitle = function(action, env) return Config:GetSpecOverlay(action.ActionName) or '' end,
    OverallSpellID = function(action, env)
        local spellIDs = action:HasKey('SpellIDs') and action.SpellIDs
        local auraIDs = action:HasKey('AuraID') and action.AuraID
        local talentID = action:HasKey('TalentID') and action.TalentID
        local spellID = spellIDs and (type(spellIDs) == "table" and rawget(spellIDs, 1) or spellIDs)
            or auraIDs and (type(auraIDs) == "table" and rawget(auraIDs, 1) or auraIDs)
            or talentID and select(6, GetTalentInfoByID(talentID))
            or nil
        return spellID
    end,

    blacklisted = function(action, env)
        return Config:GetSpecBlacklist(action.ActionName) and true or false
    end,

    in_spellbook = function(action, env) return action:HasKey('SpellBookItem') and true or false end,
    in_range = function(action, env)
        if not action.in_spellbook then return false end
        local r = IsSpellInRange(action.SpellBookItem, action.SpellBookCaster == "pet" and BOOKTYPE_PET or BOOKTYPE_SPELL, 'target')
        r = (not r or r ~= 1) and true or false
        return (not r)
    end,

    time_since_last_cast = 99999,
    spell_can_cast = false,

    base_cast_time = function(action, env)
        local gcd = TJ.currentGCD * env.playerHasteMultiplier
        return (gcd > 1) and gcd or 1
    end,
    spell_cast_time = function(action, env) return action.base_cast_time end,
    spell_execute_time = function(action, env) return action.spell_cast_time end, -- TODO: Is this right?
})
