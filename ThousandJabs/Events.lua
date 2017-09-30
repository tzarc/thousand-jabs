local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')

local GetSpellCooldown = GetSpellCooldown
local GetTime = GetTime
local pairs = pairs
local rawget = rawget
local tContains = tContains
local UnitCastingInfo = UnitCastingInfo
local UnitChannelInfo = UnitChannelInfo
local UnitExists = UnitExists
local UnitGUID = UnitGUID
local UnitHealth = UnitHealth
local wipe = wipe

Core:Safety()

------------------------------------------------------------------------------------------------------------------------
-- Locals
------------------------------------------------------------------------------------------------------------------------

local playerGUID, targetGUID, petGUID = nil, nil, nil

------------------------------------------------------------------------------------------------------------------------
-- Helpers
------------------------------------------------------------------------------------------------------------------------

local function updateGUIDs()
    -- Save the player/pet/target GUID
    playerGUID = UnitExists('player') and UnitGUID('player') or nil
    targetGUID = UnitExists('target') and UnitGUID('target') or nil
    petGUID = UnitExists('pet') and UnitGUID('pet') or nil
end

------------------------------------------------------------------------------------------------------------------------
-- Events
------------------------------------------------------------------------------------------------------------------------

function TJ:GENERIC_EVENT_UPDATE_HANDLER(eventName, ...)
    -- Update required info
    updateGUIDs()
    TJ:UpdateCastsOffGCD()

    -- Notify the profile
    if TJ.currentProfile then
        local handler = rawget(TJ.currentProfile, eventName)
        if handler then
            handler(TJ.currentProfile, eventName, ...)
        end
    end
    TJ:QueueUpdate()
end

function TJ:UNIT_PET(eventName, unitID, ...)
    if unitID == 'player' then
        TJ:GENERIC_RELOAD_PROFILE_HANDLER(eventName, unitID, ...)
    end
end

function TJ:GENERIC_RELOAD_PROFILE_HANDLER(eventName, ...)
    --Core:DevPrint("Queueing a profile reload due to event %q", eventName)

    -- Queue up a profile reload
    TJ:QueueProfileReload()
    -- Notify the profile
    TJ:GENERIC_EVENT_UPDATE_HANDLER(eventName, ...)
end

function TJ:UNIT_POWER(eventName, unitID, powerType)
    if unitID == 'player' then
        -- Notify the profile
        TJ:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID, powerType)
    end
end

function TJ:UNIT_AURA(eventName, unitID, powerType)
    if unitID == 'player' then
        -- Notify the profile
        TJ:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID, powerType)
    end
end

function TJ:UNIT_SPELLCAST_SUCCEEDED(eventName, unitID, spell, rank, lineID, spellID)
    if unitID == 'player' or unitID == 'pet' then
        local now = GetTime()
        TJ:SpellCastSuccess(spellID, unitID)
        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID, spell, rank, lineID, spellID)
    end
end

function TJ:PLAYER_REGEN_ENABLED(eventName)
    -- Reset the last autoattacks
    self.lastMainhandAttack = 0
    self.lastOffhandAttack = 0
    -- Reset combat
    self.inCombat = false
    self.combatStart = 0
    wipe(self.seenTargets)
    -- Reset last casts
    wipe(self.lastCastTimes)
    wipe(self.abilitiesUsed)
    -- Notify the profile
    self:GENERIC_EVENT_UPDATE_HANDLER(eventName)
end

function TJ:PLAYER_REGEN_DISABLED(eventName)
    local now = GetTime()
    -- Reset the last autoattack
    self.lastMainhandAttack = now
    self.lastOffhandAttack = now
    -- Start combat
    self.inCombat = true
    self.combatStart = now
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

    -- Work out which of the source and dest units is attackable
    local sourceAttackable = (bit.band(sourceFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) ~= 0 or bit.band(sourceFlags, COMBATLOG_OBJECT_REACTION_NEUTRAL) ~= 0)
    local destAttackable = (bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) ~= 0 or bit.band(destFlags, COMBATLOG_OBJECT_REACTION_NEUTRAL) ~= 0)

    -- Keep track of friendly and attackable units
    local friendlyGUID, friendlyFlags, attackbleGUID, attackbleFlags

    -- We only want to know if it's a spell/swing
    if combatEvent:find('SPELL_') == 1 or combatEvent:find('SWING_') == 1 then
        -- Only attempt to determine guid/flags if either the source or destination is attackable, and the other unit is the player/pet
        if sourceAttackable or destAttackable then
            if combatEvent == 'SPELL_SUMMON' and sourceGUID == playerGUID then
            -- Do nothing - we just summoned a pet, for some reason they come up as neutral initially
            elseif sourceAttackable and (destGUID == playerGUID or destGUID == petGUID) then
                friendlyGUID = destGUID
                friendlyFlags = destFlags
                attackbleGUID = sourceGUID
                attackbleFlags = sourceFlags
            elseif destAttackable and (sourceGUID == playerGUID or sourceGUID == petGUID) then
                friendlyGUID = sourceGUID
                friendlyFlags = sourceFlags
                attackbleGUID = destGUID
                attackbleFlags = destFlags
            end
        end

        -- If we found an attackable unit, then...
        if attackbleGUID and attackbleFlags then
            -- ...keep track of the last-seen time of the attackable unit
            self.seenTargets[attackbleGUID] = now

            -- Check if the player had a successful outgoing spellcast
            if sourceGUID == playerGUID and combatEvent == 'SPELL_CAST_SUCCESS' then
                local spellID = arg12
                TJ:SpellCastSuccess(spellID, 'player')
            end

            -- If our pet cast something, then we count it as off-GCD as well
            if sourceGUID == petGUID and combatEvent == 'SPELL_CAST_SUCCESS' then
                local spellID = arg12
                TJ:SpellCastSuccess(spellID, 'pet')
            end
        end
    end

    -- Update the last-seen time if it's a target we already know about
    if attackbleGUID and self.seenTargets[attackbleGUID] then
        self.seenTargets[attackbleGUID] = now
    end

    -- Remove the seen target if it exists
    if combatEvent == 'UNIT_DIED' or combatEvent == 'UNIT_DESTROYED' then
        self.seenTargets[destGUID] = nil
    end

    -- Notify the profile
    if TJ.currentProfile then
        local handler = rawget(TJ.currentProfile, eventName)
        if handler then
            handler(TJ.currentProfile, eventName, timeStamp, ...)
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
