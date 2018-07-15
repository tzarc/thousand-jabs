--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs8')
local Core = TJ:GetModule('Core')

local bit_and = bit.band
local bit_or = bit.bor
local COMBATLOG_OBJECT_AFFILIATION_OUTSIDER = COMBATLOG_OBJECT_AFFILIATION_OUTSIDER
local COMBATLOG_OBJECT_REACTION_FRIENDLY = COMBATLOG_OBJECT_REACTION_FRIENDLY
local CombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo
local GetSpellCooldown = GetSpellCooldown
local GetTime = GetTime
local pairs = pairs
local rawget = rawget
local tContains = tContains
local tostring = tostring
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

local function UpdateGUIDs()
    -- Save the player/pet/target GUID
    playerGUID = UnitExists('player') and UnitGUID('player') or nil
    targetGUID = UnitExists('target') and UnitGUID('target') or nil
    petGUID = UnitExists('pet') and UnitGUID('pet') or nil
end

local UnitHostileActionEvents = {
    RANGE_DAMAGE = true,
    RANGE_MISSED = true,
    SPELL_AURA_APPLIED = true,
    SPELL_AURA_REFRESH = true,
    SPELL_DAMAGE = true,
    SPELL_MISSED = true,
    --SPELL_PERIODIC_DAMAGE = true,
    SWING_DAMAGE = true,
    SWING_MISSED = true,
}

local UnitDespawnEvents = {
    UNIT_DIED = true,
    UNIT_DESTROYED = true,
    UNIT_DISSIPATES = true,
}

local function UnitFlagsIsOutsider(flags)
    return (bit_and(flags, COMBATLOG_OBJECT_AFFILIATION_OUTSIDER) ~= 0) and true or false
end

local function UnitFlagsIsFriendly(flags)
    return (bit_and(flags, COMBATLOG_OBJECT_REACTION_FRIENDLY) ~= 0) and true or false
end

local function UnitFlagsIsUnfriendlyOutsider(flags)
    return UnitFlagsIsOutsider(flags) and not UnitFlagsIsFriendly(flags) and true or false
end

local function HandleUnitHostileActionEvent(combatEvent, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags)
    -- Returns:
    --  wasFirstSeen, hostileGUID, hostileName, hostileFlags, friendlyGUID, friendlyName, friendlyFlags
    if UnitFlagsIsUnfriendlyOutsider(sourceFlags) and UnitFlagsIsFriendly(destFlags) then
        -- Source = outsider, Dest = friendly
        local notYetSeen = (not TJ.seenTargets[sourceGUID]) and true or false
        TJ.seenTargets[sourceGUID] = GetTime()
        return notYetSeen, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags
    elseif UnitFlagsIsFriendly(sourceFlags) and UnitFlagsIsUnfriendlyOutsider(destFlags) then
        -- Source = friendly, Dest = outsider
        local notYetSeen = (not TJ.seenTargets[destGUID]) and true or false
        TJ.seenTargets[destGUID] = GetTime()
        return notYetSeen, destGUID, destName, destFlags, sourceGUID, sourceName, sourceFlags
    end
    return false
end

local function HandleUnitDespawnEvent(combatEvent, destGUID, destName, destFlags)
    -- Returns:
    --  wasRemoved, hostileGUID, hostileName, hostileFlags
    if TJ.seenTargets[destGUID] then
        TJ.seenTargets[destGUID] = nil
        return true, destGUID, destName, destFlags
    end
    return false
end

local lastSeenPurgeCheckTime = 1 -- second
local lastSeenExpirationTime = 10 -- seconds
local function HandleUnitExpiry()
    local now = GetTime()
    for k, v in pairs(TJ.seenTargets) do
        if v + lastSeenExpirationTime < now then
            TJ.seenTargets[k] = nil
        end
    end
end

TJ:SetupPeriodicCallback(lastSeenPurgeCheckTime, HandleUnitExpiry)

------------------------------------------------------------------------------------------------------------------------
-- Events
------------------------------------------------------------------------------------------------------------------------

function TJ:GENERIC_EVENT_UPDATE_HANDLER(eventName, ...)
    -- Update required info
    UpdateGUIDs()
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

function TJ:UNIT_POWER_UPDATE(eventName, unitID, powerType)
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

function TJ:UNIT_SPELLCAST_SUCCEEDED(eventName, unitID, lineID, spellID)
    if unitID == 'player' or unitID == 'pet' then
        local now = GetTime()
        TJ:SpellCastSuccess(spellID, unitID)
        -- Notify the profile
        self:GENERIC_EVENT_UPDATE_HANDLER(eventName, unitID, lineID, spellID)
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

function TJ:COMBAT_LOG_EVENT_UNFILTERED(eventName, timeStamp)
    local now = GetTime()
    local timeStamp, combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20, arg21, arg22, arg23, arg24 = CombatLogGetCurrentEventInfo()

    -- Any HP drops are treated as damage taken
    local currHP = UnitHealth('player')
    self.lastHP = self.lastHP or currHP
    local deltaHP = currHP - self.lastHP
    if deltaHP < 0 then
        self.lastIncomingDamage = now
        self.damageTable[now] = (self.damageTable[now] or 0) - deltaHP
    end
    self.lastHP = currHP

    -- If both source and destination are fully specified...
    if sourceName and sourceGUID and sourceName ~= '' and destName and destGUID and destName ~= '' then
        --Core:Print('%s -- source: %s (%s) [%08X], dest: %s (%s) [%08X]', combatEvent, sourceName, sourceGUID, sourceFlags, destName, destGUID, destFlags)

        -- Detect hostile and friendly units for the combat event
        if UnitHostileActionEvents[combatEvent] then
            local hostileAdded, hostileGUID, hostileName, hostileFlags = HandleUnitHostileActionEvent(combatEvent, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags)
            -- if hostileAdded then
            -- Core:Print('%s -- hostile added: %s (%s) [%X]', combatEvent, hostileName, hostileGUID, hostileFlags)
            -- Core:Print('%s -- source: %s (%s) [%08X], dest: %s (%s) [%X]', combatEvent, sourceName, sourceGUID, sourceFlags, destName, destGUID, destFlags)
            -- end

            -- If there was a hostile party involved, check if the player or the pet finished casting something
            if hostileGUID and hostileName and hostileFlags then
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

        -- Handle any unit despawn
        if UnitDespawnEvents[combatEvent] then
            local hostileRemoved, hostileGUID, hostileName, hostileFlags = HandleUnitDespawnEvent(combatEvent, destGUID, destName, destFlags)
            -- if hostileRemoved then
            -- Core:Print('%s -- hostile removed: %s (%s) [%X]', combatEvent, hostileName, hostileGUID, hostileFlags)
            -- Core:Print('%s -- source: %s (%s) [%08X], dest: %s (%s) [%X]', combatEvent, sourceName, sourceGUID, sourceFlags, destName, destGUID, destFlags)
            -- end
        end
    end

    -- Notify the profile
    if TJ.currentProfile then
        local handler = rawget(TJ.currentProfile, eventName)
        if handler then
            handler(TJ.currentProfile, eventName)
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
