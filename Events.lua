local addonName, internal = ...;
local Z = internal.Z
local DBG = internal.DBG
local LTC = LibStub('LibTableCache-1.0')
local LUC = LibStub('LibUnitCache-1.0')

------------------------------------------------------------------------------------------------------------------------
-- Events
------------------------------------------------------------------------------------------------------------------------

function Z:GENERIC_EVENT_UPDATE_HANDLER(eventName, ...)
    -- Notify the profile
    if self.currentProfile then
        local handler = rawget(self.currentProfile, eventName)
        if handler then
            handler(self.currentProfile, eventName, ...)
        end
    end
    self:QueueUpdate()
end

function Z:UNIT_HEALTH(eventName, unitID)
    -- Only check if it's our own health changing
    if unitID == 'player' then
        -- Only trigger incoming damage if in combat
        local combatStart = self.combatStart
        if combatStart > 0 then
            local lastHP, currHP = (self.lastHP or UnitHealthMax('player')), (UnitHealth('player') or 0)
            if currHP < lastHP then
                self.lastIncomingDamage = GetTime()
                self.lastHP = currHP
            end
        end
        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID)
    end
end

function Z:PLAYER_ENTERING_WORLD(eventName)
    -- Deactivate the current profile
    self:DeactivateProfile()
    -- Activate the new profile if present
    self:ActivateProfile()
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function Z:PLAYER_LEVEL_UP(eventName)
    -- Deactivate the current profile
    self:DeactivateProfile()
    -- Activate the new profile if present
    self:ActivateProfile()
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function Z:SPELLS_CHANGED(eventName)
    -- Deactivate the current profile
    self:DeactivateProfile()
    -- Activate the new profile if present
    self:ActivateProfile()
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function Z:UNIT_POWER(eventName, unitID, powerType)
    if unitID == 'player' then
        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID, powerType)
    end
end

function Z:PLAYER_SPECIALIZATION_CHANGED(eventName, unitID)
    if unitID == 'player' then
        -- Deactivate the current profile
        self:DeactivateProfile()
        -- Activate the new profile if present
        self:ActivateProfile()
        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID)
    end
end

function Z:PLAYER_TALENT_UPDATE(eventName)
    if unitID == 'player' then
        -- Deactivate the current profile
        self:DeactivateProfile()
        -- Activate the new profile if present
        self:ActivateProfile()
        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
    end
end

function Z:UNIT_SPELLCAST_SUCCEEDED(eventName, unitID, spell, rank, lineID, spellID)
    if unitID == 'player' then
        -- Keep track of the last cast made
        Z.lastCastTime[spellID] = GetTime()
        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID, spell, rank, lineID, spellID)
    end
end

function Z:PLAYER_REGEN_ENABLED(eventName)
    -- Reset combat
    self.combatStart = 0
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function Z:PLAYER_REGEN_DISABLED(eventName)
    -- Start combat
    self.combatStart = GetTime()
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function Z:PLAYER_TARGET_CHANGED(eventName)
    -- Force a target cache update
    forceUpdateTarget = true
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function Z:COMBAT_LOG_EVENT_UNFILTERED(eventName, timeStamp, combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, arg12, arg13, arg14, arg15)
    -- Check if the player has received any damage, and update the last incoming damage time
    if destGUID == playerGUID then
        if arg15 and type(arg15) == 'number' and arg15 > 0 and combatEvent:find("_DAMAGE") then
            local timestamp = GetTime()
            self.lastIncomingDamage = timestamp
            self.damageTable[timestamp] = (self.damageTable[timestamp] or 0) + arg15
        end
    end

    -- We only want to know if it's a spell, and it concerns either the player or the current target
    if (destGUID == playerGUID or destGUID == targetGUID) and combatEvent:find('SPELL_') == 1 then
        -- Check if we've had an aura applied or removed
        if combatEvent == 'SPELL_AURA_APPLIED' or combatEvent == 'SPELL_AURA_REFRESH' or combatEvent == 'SPELL_AURA_REMOVED' then
            -- Update the cache for the relevant unit
            if destGUID == playerGUID then
                forceUpdatePlayer = true
            elseif destGUID == targetGUID then
                forceUpdateTarget = true
            end
            self:QueueUpdate()
        elseif combatEvent == 'SPELL_CAST_SUCCESS' then
            if sourceGUID == playerGUID then
                --[[
                -- Save the last cast
                lastCastTime = GetTime()
                lastCastSpellID = arg12
                ]]
                self:QueueUpdate()
            end
        end

        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName, timeStamp, combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, arg12, arg13, arg14, arg15)
    end
end