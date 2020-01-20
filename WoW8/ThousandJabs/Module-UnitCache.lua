------------------------------------------------------------------------------------------------------------------------
-- BfA only.
------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and (select(4, GetBuildInfo()) < 80000 or select(4, GetBuildInfo()) >= 90000) then
    return
end

------------------------------------------------------------------------------------------------------------------------
local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local TableCache = TJ:GetModule('TableCache')
local Profiling = TJ:GetModule('Profiling')
local UnitCache = TJ:GetModule('UnitCache')

local ct = function() return TableCache:Acquire() end
local rt = function(tbl) TableCache:Release(tbl) end

local CheckInteractDistance = CheckInteractDistance
local CombatLogGetCurrentEventInfo = CombatLogGetCurrentEventInfo
local CreateFrame = CreateFrame
local GetTime = GetTime
local IsItemInRange = IsItemInRange
local mabs = math.abs
local pairs = pairs
local type = type
local UnitAura = UnitAura
local UnitExists = UnitExists
local UnitGUID = UnitGUID
local UnitHealth = UnitHealth

Core:Safety()

local updateFrame
local forceUpdate = false
local purgeTime = 10 -- in seconds
local nextUpdateTime = 0
local updateThrottle = 2.5 -- in seconds
local playerGUID, targetGUID
local unitCache = {}
UnitCache.unitCache = unitCache

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

local function GetAuraValues(unit, idx, filter)
    local _
    local v = ct()
    v.name, v.icon, v.count, v.dispelType, v.duration, v.expires, v.caster, v.isStealable, v.nameplateShowPersonal, v.spellID, v.canApplyAura, v.isBossDebuff, _, v.nameplateShowAll, v.timeMod, v.value1, v.value2, v.value3 = UnitAura(unit, idx, filter, filter)
    v.unit = unit
    v.unitGUID = UnitGUID(unit)
    v.unitCasterGUID = v.caster and UnitGUID(v.caster) or nil
    v.mine = (v.caster and v.caster == 'player') and true or false
    if v.spellID then return v end
    rt(v)
end

local function RetrieveActiveAuras(unitID)
    if not UnitExists(unitID) then
        return
    end

    local auras = ct()
    local blankDone, helpDone, harmDone = false, false, false
    for i=1,40 do
        if blankDone == false then
            local v = GetAuraValues(unitID, i)
            if v and v.spellID then
                v.harm = false
                auras[1+#auras] = v
            else
                blankDone = true
            end
        end
        if helpDone == false then
            local v = GetAuraValues(unitID, i, 'HELPFUL')
            if v and v.spellID then
                v.harm = false
                auras[1+#auras] = v
            else
                helpDone = true
            end
        end
        if harmDone == false then
            local v = GetAuraValues(unitID, i, 'HARMFUL')
            if v and v.spellID then
                v.harm = true
                auras[1+#auras] = v
            else
                harmDone = true
            end
        end
    end
    return auras
end

function UnitCache:GetAura(unitID, spellID, mine)
    if type(spellID) == "table" then
        for i=1,#spellID do
            local aura = self:GetAura(unitID, spellID[i], mine)
            if aura then return aura end
        end
    elseif type(spellID) == "number" then
        mine = mine and true or false
        local theGUID = UnitGUID(unitID)
        if unitCache[theGUID] then
            local auras = unitCache[theGUID].auras
            for i=1,#auras do
                local aura = auras[i]
                if aura.spellID == spellID and (not mine or aura.mine) then
                    return aura
                end
            end
        end
    end
end
--Profiling:ProfileFunction(UnitCache, 'GetAura', 'unitcache:GetAura')

function UnitCache:UpdateUnitCache(unitID, forceUpdate)
    if UnitExists(unitID) then
        local theGUID = UnitGUID(unitID)
        if forceUpdate or not unitCache[theGUID] then
            unitCache[theGUID] = unitCache[theGUID] or ct()
            if unitCache[theGUID].auras then rt(unitCache[theGUID].auras) end
            unitCache[theGUID].auras = RetrieveActiveAuras(unitID)
            unitCache[theGUID].lastSeen = GetTime()
        end
        unitCache[theGUID].range = RangeToUnit(unitID)
        self:UpdateTimeToDie(unitID)
        return theGUID
    end
    return nil
end
--Profiling:ProfileFunction(UnitCache, 'UpdateUnitCache', 'unitcache:UpdateUnitCache')

function UnitCache:PurgeExpiredUnitCaches()
    local now = GetTime()
    for k, v in pairs(unitCache) do
        if v.lastSeen and (v.lastSeen + purgeTime) <= now then
            rt(unitCache[k])
            unitCache[k] = nil
        end
    end
end
--Profiling:ProfileFunction(UnitCache, 'PurgeExpiredUnitCaches', 'unitcache:PurgeExpiredUnitCaches')

function UnitCache:UpdateTimeToDie(unitID)
    local theGUID = UnitGUID(unitID)
    if not theGUID then return end

    local thisUnit = unitCache[theGUID]
    if not thisUnit then return end

    local now = GetTime()
    local ttdData = unitCache[theGUID].ttdData or ct()
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
--Profiling:ProfileFunction(UnitCache, 'UpdateTimeToDie', 'unitcache:UpdateTimeToDie')

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

if updateFrame then
    updateFrame:UnregisterAllEvents()
    updateFrame:SetScript("OnEvent", nil)
    updateFrame:SetScript("OnUpdate", nil)
else
    updateFrame = CreateFrame("Frame")
end
updateFrame:Show()

function UnitCache:UNIT_AURA(eventName, unit)
    if unit == 'player' or unit == 'target' or unit == 'pet' then
        self:UpdateUnitCache(unit, true)
    end
end

function UnitCache:PLAYER_ENTERING_WORLD(eventName)
    self:UpdateUnitCache('player', true)
end

function UnitCache:PLAYER_TARGET_CHANGED(eventName)
    self:UpdateUnitCache('target', true)
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
        if UnitExists('player') then UnitCache:UpdateUnitCache('player', true) end
        targetGUID = UnitExists('target') and UnitGUID('target') or nil
        if UnitExists('target') then UnitCache:UpdateUnitCache('target', true) end
        UnitCache:PurgeExpiredUnitCaches()
    end
end
--Profiling:ProfileFunction(UnitCache, 'COMBAT_LOG_EVENT_UNFILTERED', 'unitcache:COMBAT_LOG_EVENT_UNFILTERED')

updateFrame:SetScript("OnEvent", function(self, eventName, ...) UnitCache[eventName](UnitCache, eventName, ...) end)
updateFrame:RegisterEvent('UNIT_AURA')
updateFrame:RegisterEvent('PLAYER_ENTERING_WORLD')
updateFrame:RegisterEvent('PLAYER_TARGET_CHANGED')
updateFrame:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
