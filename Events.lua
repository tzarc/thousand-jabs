local addonName, internal = ...;
local TJ = internal.TJ
local Debug = internal.Debug
local fmt = internal.fmt

local pairs = pairs
local rawget = rawget
local wipe = wipe
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

function TJ:ZONE_CHANGED(eventName)
    -- Save the player GUID
    playerGUID = UnitExists('player') and UnitGUID('player') or nil
    -- Deactivate the current profile
    self:DeactivateProfile()
    -- Activate the new profile if present
    self:ActivateProfile()
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function TJ:PLAYER_LEVEL_UP(eventName)
    -- Deactivate the current profile
    self:DeactivateProfile()
    -- Activate the new profile if present
    self:ActivateProfile()
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function TJ:SPELLS_CHANGED(eventName)
    -- Deactivate the current profile
    self:DeactivateProfile()
    -- Activate the new profile if present
    self:ActivateProfile()
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function TJ:UNIT_POWER(eventName, unitID, powerType)
    if unitID == 'player' then
        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID, powerType)
    end
end

function TJ:PLAYER_SPECIALIZATION_CHANGED(eventName, unitID)
    if unitID == 'player' then
        -- Deactivate the current profile
        self:DeactivateProfile()
        -- Activate the new profile if present
        self:ActivateProfile()
        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID)
    end
end

function TJ:PLAYER_TALENT_UPDATE(eventName)
    -- Deactivate the current profile
    self:DeactivateProfile()
    -- Activate the new profile if present
    self:ActivateProfile()
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
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
    local combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24 = ...

    -- Any HP drops are treated as damage taken
    local currHP = UnitHealth('player')
    self.lastHP = self.lastHP or currHP
    local deltaHP = currHP - self.lastHP
    if deltaHP < 0 then
        local timestamp = GetTime()
        self.lastIncomingDamage = timestamp
        self.damageTable[timestamp] = (self.damageTable[timestamp] or 0) - deltaHP
    end
    self.lastHP = currHP

    -- We only want to know if it's a spell, and it concerns either the player or the current target
    if (sourceGUID == playerGUID or sourceGUID == targetGUID or destGUID == playerGUID or destGUID == targetGUID) and combatEvent:find('SPELL_') == 1 then
        -- Check if we've had a successful spellcast
        if combatEvent == 'SPELL_CAST_SUCCESS' then
            if sourceGUID == playerGUID then
                local spellID = arg12
                local now = GetTime()
                -- Keep track of the last cast made
                self.lastCastTime[spellID] = GetTime()
                local ability = self.currentProfile:FindActionForSpellID(spellID)
                if ability then
                    self.abilitiesUsed[now] = ability
                end
                -- Update the GCD amount if possible
                self:TryDetectUpdateGlobalCooldown(spellID)
                -- Queue a screen update
                self:QueueUpdate()
            end
        end
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
            self.lastOffhandAttack = GetTime()
        else
            self.lastMainhandAttack = GetTime()
        end

        -- We succeeded in an auto-attack, save the timestamp
        self.lastAutoAttack = GetTime()
    end
end
