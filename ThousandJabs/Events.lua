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
local specialGUIDs = {}
local summonedGuardians = {}
local summonedGuardianExpiry = 5.0 -- Valid only for 5 seconds, if not seen

------------------------------------------------------------------------------------------------------------------------
-- Helpers
------------------------------------------------------------------------------------------------------------------------

local function updateGUIDs()
    -- Save the player/pet/target GUID
    playerGUID = UnitExists('player') and UnitGUID('player') or nil
    targetGUID = UnitExists('target') and UnitGUID('target') or nil
    petGUID = UnitExists('pet') and UnitGUID('pet') or nil

    -- Set up the special GUIDs table so that we can use tContains
    wipe(specialGUIDs)
    if playerGUID then specialGUIDs[1+#specialGUIDs] = playerGUID end
    if targetGUID then specialGUIDs[1+#specialGUIDs] = targetGUID end
    if petGUID then specialGUIDs[1+#specialGUIDs] = petGUID end

    -- Sort out any summoned guardians too
    local now = GetTime()
    for k,v in pairs(summonedGuardians) do
        -- Clear out any summoned guardians if they've been around for too long
        if (v + summonedGuardianExpiry) < now then
            summonedGuardians[k] = nil
        else
            specialGUIDs[1+#specialGUIDs] = k
        end
    end
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

    -- We only want to know if it's a spell, and it concerns either the player or the current target
    if tContains(specialGUIDs, sourceGUID) or tContains(specialGUIDs, destGUID) and combatEvent:find('SPELL_') == 1 then
        -- Check if this event concerns the player
        if sourceGUID == playerGUID or destGUID == playerGUID then
            local targetedGUID, targetedName
            if sourceGUID ~= playerGUID then targetedGUID = sourceGUID; targetedName = sourceName end
            if destGUID ~= playerGUID then targetedGUID = destGUID; targetedName = destName end
            if targetedGUID and targetedGUID ~= "" then
                self.seenTargets[targetedGUID] = now
            end
        end

        -- Check if the player had a successful spellcast
        if sourceGUID == playerGUID and combatEvent == 'SPELL_CAST_SUCCESS' then
            local spellID = arg12
            TJ:SpellCastSuccess(spellID, 'player')
        end

        -- If our pet cast something, then we count it as off-GCD as well
        if sourceGUID == petGUID and combatEvent == 'SPELL_CAST_SUCCESS' then
            local spellID = arg12
            TJ:SpellCastSuccess(spellID, 'pet')
        end

        -- If the player has summoned something friendly... like a guardian or secondary pet (Grim of Service, Dimensional Rift)
        if sourceGUID == playerGUID and combatEvent == 'SPELL_SUMMON' and bit.band(sourceFlags, COMBATLOG_FILTER_ME) == COMBATLOG_FILTER_ME then
            summonedGuardians[destGUID] = now
        end
    end

    -- Update the last-seen time for guardian units
    if summonedGuardians[sourceGUID] then
        summonedGuardians[sourceGUID] = now
        self.seenTargets[sourceGUID] = nil
    end
    if summonedGuardians[destGUID] then
        summonedGuardians[destGUID] = now
        self.seenTargets[destGUID] = nil
    end

    -- Clear out the player/pet guid's
    if playerGUID then self.seenTargets[playerGUID] = nil end
    if petGUID then self.seenTargets[petGUID] = nil end

    -- Remove the seen target if it exists
    if combatEvent == 'UNIT_DIED' or combatEvent == 'UNIT_DESTROYED' then
        summonedGuardians[destGUID] = nil
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
