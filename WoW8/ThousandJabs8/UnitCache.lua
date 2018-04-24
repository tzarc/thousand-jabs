--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Module init.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ, _ = ...
local LibStub, DBG, CT, RT, Config, UI, UnitCache, SpellBook = LibStub, TJ.DBG, CT, RT, TJ.Config, TJ.UI, TJ.UnitCache, TJ.SpellBook

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local CheckInteractDistance = CheckInteractDistance
local CombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo
local GetTime = GetTime
local IsItemInRange = IsItemInRange
local mabs = math.abs
local pairs = pairs
local print = print
local tostring = tostring
local UnitAura = UnitAura
local UnitBuff = UnitBuff
local UnitDebuff = UnitDebuff
local UnitExists = UnitExists
local UnitGUID = UnitGUID
local UnitHealth = UnitHealth

local PRF = LibStub('LibTJProfiling-8.0')

local forceUpdate = false
local purgeTime = 10 -- in seconds
local nextUpdateTime = 0
local updateThrottle = 2.5 -- in seconds
local playerGUID, targetGUID
local unitCache = {}
UnitCache.unitCache = unitCache

local LSD = LibStub('LibTJSerpentDump-8.0')

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sandbox
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
LibStub('LibTJSandbox-8.0'):Use(addonName)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local range_checks = {
    { range = 80, items = { 35278 } },
    { range = 60, items = { 35825, 34111, 34121 } },
    { range = 45, items = { 23836 } },
    { range = 40, items = { 44114, 44228, 90888, 90883 } },
    { range = 35, items = { 18904, 24501 } },
    { range = 30, items = { 21713, 85231, 9328 } },
    { range = 26, interact = { 1, 4 } },
    { range = 25, items = { 31463, 86567, 13289 } },
    { range = 20, items = { 10645, 21519 } },
    { range = 15, items = { 46722, 56184, 31129, 33069 } },
    { range = 12, items = { 32321, 21267 } },
    { range = 11, interact = { 2 }, items = { 33278 } },
    { range =  9, interact = { 3 } },
    { range =  8, items = { 56837, 36771 } },
    { range =  5, items = { 37727 } },
}

local function RangeToUnit(unitID)
    local minrange = 9999
    for _,v in pairs(range_checks) do
        if v.items then
            for _,i in pairs(v.items) do
                if IsItemInRange(i, unitID) then
                    minrange = v.range
                    break
                end
            end
        end
        if v.interact then
            for _,i in pairs(v.interact) do
                if CheckInteractDistance(unitID, i) then
                    minrange = v.range
                end
            end
        end
    end
    return minrange
end

do
    local auraFunctions = { UnitBuff, UnitDebuff, UnitAura }
    local auraFilters = { "NONE", "HELPFUL", "HARMFUL", "PLAYER", "RAID", "CANCELABLE", "NOT_CANCELABLE" }

    local function auraIndexDispatcher(state)
        local auraFunc = auraFunctions[state.functionIdx]
        local auraFilter = auraFilters[state.filterIdx]
        local auraIdx = state.auraIdx

        -- Retrieve the data
        local name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, nameplateShowPersonal, spellID, canApplyAura, isBossAura, casterIsPlayer, nameplateShowAll, timeMod, value1, value2, value3 = auraFunc(state.unit, auraIdx, auraFilter, auraFilter)
        if not name then return nil end

        state.auraIdx = state.auraIdx + 1

        -- If there was no caster, mark it as unknown
        unitCaster = unitCaster or 'unknown'
        -- Skip this entry if we've already collected its data
        state.seen[unitCaster] = state.seen[unitCaster] or state.tableFactory()
        if state.seen[unitCaster][spellID] then
            return auraIndexDispatcher(state)
        end

        -- Keep track of the seen state of these auras
        state.seen[unitCaster][spellID] = true

        -- Extra useful info
        local unitGUID = UnitGUID(state.unit)
        local unitCasterGUID = unitCaster and UnitGUID(unitCaster) or nil
        local mine = (unitCaster and unitCaster == 'player') and true or false

        -- Return the info for this aura
        return name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, nameplateShowPersonal, spellID, canApplyAura, isBossAura, casterIsPlayer, nameplateShowAll, timeMod, value1, value2, value3, unitGUID, unitCasterGUID, mine, state.unit, auraIdx, auraFilter
    end

    local function auraFilterDispatcher(state)
        local name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, nameplateShowPersonal, spellID, canApplyAura, isBossAura, casterIsPlayer, nameplateShowAll, timeMod, value1, value2, value3, unitGUID, unitCasterGUID, mine, unit, index, filter = auraIndexDispatcher(state)
        if not name then
            state.filterIdx = state.filterIdx + 1
            state.auraIdx = 1
            if state.filterIdx > #auraFilters then
                return nil
            end
            return auraFilterDispatcher(state)
        end
        return name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, nameplateShowPersonal, spellID, canApplyAura, isBossAura, casterIsPlayer, nameplateShowAll, timeMod, value1, value2, value3, unitGUID, unitCasterGUID, mine, unit, index, filter
    end

    local function auraFunctionDispatcher(state)
        local name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, nameplateShowPersonal, spellID, canApplyAura, isBossAura, casterIsPlayer, nameplateShowAll, timeMod, value1, value2, value3, unitGUID, unitCasterGUID, mine, unit, index, filter = auraFilterDispatcher(state)
        if not name then
            state.functionIdx = state.functionIdx + 1
            state.filterIdx = 1
            if state.functionIdx > #auraFunctions then
                state.tableDestroyer(state)
                return nil
            end
            return auraFunctionDispatcher(state)
        end
        return name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, nameplateShowPersonal, spellID, canApplyAura, isBossAura, casterIsPlayer, nameplateShowAll, timeMod, value1, value2, value3, unitGUID, unitCasterGUID, mine, unit, index, filter
    end

    function UnitCache:IterateAuras(unit, tbl, tableFactory, tableDestroyer)
        tableFactory = tableFactory or CT
        tableDestroyer = tableDestroyer or RT
        local state = tbl or tableFactory()
        state.tableFactory = tableFactory
        state.tableDestroyer = tableDestroyer
        state.seen = tableFactory()
        state.unit = unit
        state.functionIdx = 1
        state.filterIdx = 1
        state.auraIdx = 1
        return auraFunctionDispatcher, state
    end
end

local function RetrieveActiveAuras(unitID)
    if not UnitExists(unitID) then
        return
    end

    local auras = CT()
    for name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, nameplateShowPersonal, spellID, canApplyAura, isBossAura, casterIsPlayer, nameplateShowAll, timeMod, value1, value2, value3, unitGUID, unitCasterGUID, mine, unit, idx, filter in UnitCache:IterateAuras(unitID) do
        local aura = CT()
        aura.name, aura.icon, aura.count, aura.debuffType, aura.duration, aura.expirationTime, aura.unitCaster, aura.canStealOrPurge, aura.nameplateShowPersonal, aura.spellID, aura.canApplyAura, aura.isBossAura, aura.casterIsPlayer, aura.nameplateShowAll, aura.timeMod, aura.value1, aura.value2, aura.value3, aura.unitGUID, aura.unitCasterGUID, aura.mine, aura.unit
        = name, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, nameplateShowPersonal, spellID, canApplyAura, isBossAura, casterIsPlayer, nameplateShowAll, timeMod, value1, value2, value3, unitGUID, unitCasterGUID, mine, unit
        auras[1+#auras] = aura
    end
    return auras
end
RetrieveActiveAuras = PRF:ProfileFunction(RetrieveActiveAuras, 'unitcache:RetrieveActiveAuras')

function UnitCache:UpdateUnitCache(unitID, forceUpdate)
    if UnitExists(unitID) then
        local theGUID = UnitGUID(unitID)
        if forceUpdate or not unitCache[theGUID] then
            unitCache[theGUID] = unitCache[theGUID] or CT()
            if unitCache[theGUID].auras then RT(unitCache[theGUID].auras) end
            unitCache[theGUID].auras = RetrieveActiveAuras(unitID)
            unitCache[theGUID].lastSeen = GetTime()
        end
        unitCache[theGUID].range = RangeToUnit(unitID)
        self:UpdateTimeToDie(unitID)
        return theGUID
    end
    return nil
end
PRF:ProfileFunction(UnitCache, 'UpdateUnitCache', 'unitcache:UpdateUnitCache')

function UnitCache:PurgeExpiredUnitCaches()
    local now = GetTime()
    for k, v in pairs(unitCache) do
        if v.lastSeen and (v.lastSeen + purgeTime) <= now then
            RT(unitCache[k])
            unitCache[k] = nil
        end
    end
end
PRF:ProfileFunction(UnitCache, 'PurgeExpiredUnitCaches', 'unitcache:PurgeExpiredUnitCaches')

function UnitCache:UpdateTimeToDie(unitID)
    local theGUID = UnitGUID(unitID)
    if not theGUID then return end

    local thisUnit = unitCache[theGUID]
    if not thisUnit then return end

    local now = GetTime()
    local ttdData = unitCache[theGUID].ttdData or CT()
    unitCache[theGUID].ttdData = ttdData
    local lastUpdate = ttdData.lastUpdate or 0
    if lastUpdate > now-1.0 then return end
    ttdData.lastUpdate = now

    local currHealth, currTime = UnitHealth(unitID), now

    if not ttdData.initHealth then
        ttdData.initHealth, ttdData.initTime = currHealth, currTime
        ttdData.ttd = 99999
    end
    if not ttdData.midHealth then
        ttdData.midHealth, ttdData.midTime = currHealth, currTime
    else
        ttdData.midHealth, ttdData.midTime = ((ttdData.midHealth + currHealth) * 0.5), ((ttdData.midTime + currTime) * 0.5)
    end

    local deltaHealth = ttdData.midHealth - ttdData.initHealth
    ttdData.ttd = (deltaHealth == 0) and 99999 or mabs(currHealth * (ttdData.initTime - ttdData.midTime) / deltaHealth)
end
PRF:ProfileFunction(UnitCache, 'UpdateTimeToDie', 'unitcache:UpdateTimeToDie')

function UnitCache:UnitTimeToDie(unitID)
    local theGUID = UnitGUID(unitID)
    if not unitCache[theGUID] then return 99999 end
    return unitCache[theGUID].ttdData.ttd
end

function UnitCache:UnitRange(unitID)
    local theGUID = UnitGUID(unitID)
    if not unitCache[theGUID] then return 99999 end
    return unitCache[theGUID].range
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Event Handlers
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function UnitCache:UNIT_AURA(eventName, unit)
    --TJ:DevPrint('UNIT_AURA(UnitCache) -- %s', tostring(unit))
    if unit == 'player' or unit == 'target' or unit == 'pet' then
        self:UpdateUnitCache(unit, true)
    end
end

function UnitCache:PLAYER_ENTERING_WORLD(eventName)
    --TJ:DevPrint('PLAYER_ENTERING_WORLD(UnitCache)')
    self:UpdateUnitCache('player', true)
    TJ:QueueUpdate()
end

function UnitCache:PLAYER_TARGET_CHANGED(eventName, selected)
    --TJ:DevPrint('PLAYER_TARGET_CHANGED(UnitCache) -- %s', tostring(selected))
    self:UpdateUnitCache('target', true)
    TJ:QueueUpdate()
end

function UnitCache:COMBAT_LOG_EVENT_UNFILTERED()
    local timeStamp, combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 = CombatLogGetCurrentEventInfo()
    if (sourceGUID == playerGUID or sourceGUID == targetGUID or destGUID == playerGUID or destGUID == targetGUID) and combatEvent:sub(1,11) == 'SPELL_AURA_' then
        forceUpdate = true
    end

    local now = GetTime()
    if forceUpdate or nextUpdateTime < now then
        forceUpdate = false
        nextUpdateTime = now + updateThrottle
        playerGUID = UnitExists('player') and UnitGUID('player') or nil
        if UnitExists('player') then self:UpdateUnitCache('player', true) end
        targetGUID = UnitExists('target') and UnitGUID('target') or nil
        if UnitExists('target') then self:UpdateUnitCache('target', true) end
        self:PurgeExpiredUnitCaches()
    end
end

PRF:ProfileFunction(UnitCache, 'UNIT_AURA', 'unitCache:UNIT_AURA')
PRF:ProfileFunction(UnitCache, 'PLAYER_ENTERING_WORLD', 'unitCache:PLAYER_ENTERING_WORLD')
PRF:ProfileFunction(UnitCache, 'PLAYER_TARGET_CHANGED', 'unitCache:PLAYER_TARGET_CHANGED')
PRF:ProfileFunction(UnitCache, 'COMBAT_LOG_EVENT_UNFILTERED', 'unitCache:COMBAT_LOG_EVENT_UNFILTERED')

UnitCache:RegisterEvent('UNIT_AURA')
UnitCache:RegisterEvent('PLAYER_ENTERING_WORLD')
UnitCache:RegisterEvent('PLAYER_TARGET_CHANGED')
UnitCache:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
