local addonName, internal = ...;
local TJ = internal.TJ
local Debug = internal.Debug
local fmt = internal.fmt

local pairs = pairs
local rawget = rawget
local tostring = tostring
local wipe = wipe
local GetActionInfo = GetActionInfo
local GetMacroSpell = GetMacroSpell
local GetSpellInfo = GetSpellInfo
local GetTime = GetTime
local UnitExists = UnitExists
local UnitGUID = UnitGUID
local UnitHealth = UnitHealth

internal.Safety()

------------------------------------------------------------------------------------------------------------------------
-- Locals
------------------------------------------------------------------------------------------------------------------------

local playerGUID, targetGUID = nil, nil

------------------------------------------------------------------------------------------------------------------------
-- Events
------------------------------------------------------------------------------------------------------------------------

function TJ:GENERIC_EVENT_UPDATE_HANDLER(eventName, ...)
    -- Notify the profile
    if self.currentProfile then
        local handler = rawget(self.currentProfile, eventName)
        if handler then
            handler(self.currentProfile, eventName, ...)
        end
    end
    self:QueueUpdate()
end

function TJ:ACTIONBAR_SLOT_CHANGED(eventName, slot, ...)
    self:GENERIC_RELOAD_PROFILE_HANDLER(eventName, slot, ...)
    --[[
    if slot ~= 0 then
    local _, spellID
    local actionType, actionID = GetActionInfo(slot)
    if actionType == "macro" then
    _, _, spellID = GetMacroSpell(actionID)
    elseif actionType == "spell" then
    spellID = actionID
    end
    self:DevPrint('ActionBar slot %s changed to spell %s: %s', tostring(slot), tostring(spellID), tostring(GetSpellInfo(spellID) or 'unknown'))
    end
    ]]
end

function TJ:GENERIC_RELOAD_PROFILE_HANDLER(eventName, ...)
    -- Save the player GUID
    playerGUID = UnitExists('player') and UnitGUID('player') or nil
    -- Queue up a profile reload
    self:QueueProfileReload()
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName, ...)
end

function TJ:UNIT_POWER(eventName, unitID, powerType)
    if unitID == 'player' then
        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID, powerType)
    end
end

function TJ:UNIT_SPELLCAST_SUCCEEDED(eventName, unitID, spell, rank, lineID, spellID)
    if unitID == 'player' then
        local now = GetTime()
        -- Keep track of the last cast made
        self.lastCastTime[spellID] = now
        local ability = self.currentProfile:FindActionForSpellID(spellID)
        if ability then
            self.abilitiesUsed[now] = ability
        end
        -- Update the GCD amount if possible
        self:TryDetectUpdateGlobalCooldown(spellID)
        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID, spell, rank, lineID, spellID)
    end
end

function TJ:PLAYER_REGEN_ENABLED(eventName)
    -- Reset the last autoattacks
    self.lastMainhandAttack = 0
    self.lastOffhandAttack = 0
    -- Reset combat
    self.combatStart = 0
    wipe(self.seenTargets)
    -- Reset last casts
    wipe(self.lastCastTime)
    wipe(self.abilitiesUsed)
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function TJ:PLAYER_REGEN_DISABLED(eventName)
    -- Reset the last autoattack
    self.lastMainhandAttack = GetTime()
    self.lastOffhandAttack = GetTime()
    -- Start combat
    self.combatStart = GetTime()
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function TJ:PLAYER_TARGET_CHANGED(eventName)
    -- Save the target GUID
    targetGUID = UnitExists('target') and UnitGUID('target') or nil
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function TJ:COMBAT_LOG_EVENT_UNFILTERED(eventName, timeStamp, ...)
    local now = GetTime()
    local combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24 = ...

    -- Any HP drops are treated as damage taken
    local currHP = UnitHealth('player')
    self.lastHP = self.lastHP or currHP
    local deltaHP = currHP - self.lastHP
    if deltaHP < 0 then
        self.lastIncomingDamage = now
        self.damageTable[now] = (self.damageTable[now] or 0) - deltaHP
    end
    self.lastHP = currHP

    -- We only want to know if it's a spell, and it concerns either the player or the current target
    if (sourceGUID == playerGUID or sourceGUID == targetGUID or destGUID == playerGUID or destGUID == targetGUID) and combatEvent:find('SPELL_') == 1 then
        -- Check if the player had a successful spellcast
        if sourceGUID == playerGUID and combatEvent == 'SPELL_CAST_SUCCESS' then
            local spellID = arg12
            -- Keep track of the last cast made
            self.lastCastTime[spellID] = now
            local ability = self.currentProfile:FindActionForSpellID(spellID)
            if ability then
                self.abilitiesUsed[now] = ability
            end
            -- Update the GCD amount if possible
            self:TryDetectUpdateGlobalCooldown(spellID)
            -- Queue a screen update
            self:QueueUpdate()
        end

        -- Check if this event concerns the player
        if sourceGUID == playerGUID or destGUID == playerGUID then
            local targetedGUID, targetedName
            if sourceGUID ~= playerGUID then targetedGUID = sourceGUID; targetedName = sourceName end
            if destGUID ~= playerGUID then targetedGUID = destGUID; targetedName = destName end
            if targetedGUID and targetedGUID ~= "" then
                self.seenTargets[targetedGUID] = now
            end
        end
    end

    -- Remove the seen target if it exists
    if combatEvent == 'UNIT_DIED' or combatEvent == 'UNIT_DESTROYED' then
        self.seenTargets[destGUID] = nil
    end

    -- Notify the profile
    if self.currentProfile then
        local handler = rawget(self.currentProfile, eventName)
        if handler then
            handler(self.currentProfile, eventName, timeStamp, ...)
        end
    end

    if sourceGUID == playerGUID and combatEvent:sub(1,5) == 'SWING' then
        local wasOffhand = arg21 and true or false
        if combatEvent == 'SWING_MISSED' then wasOffhand = true end

        if wasOffhand then
            self.lastOffhandAttack = now
        else
            self.lastMainhandAttack = now
        end
    end
end
