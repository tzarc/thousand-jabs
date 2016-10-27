local MAJOR, MINOR = "LibUnitCache-1.0", 33
local lib, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

local LTC = LibStub('LibTableCache-1.0')

local updateFrame
local forceUpdate = false
local purgeTime = 10 -- in seconds
local nextUpdateTime = 0
local updateThrottle = 2.5 -- in seconds
local playerGUID, targetGUID
local unitCache = {}
lib.unitCache = unitCache

local function GetAuraValues(unit, idx, filter)
    local _
    local v = LTC:Acquire()
    v.name, v.rank, v.icon, v.count, v.dispelType, v.duration, v.expires, v.caster, v.isStealable, v.nameplateShowPersonal, v.spellID, v.canApplyAura, v.isBossDebuff, _, v.nameplateShowAll, v.timeMod, v.value1, v.value2, v.value3 = UnitAura(unit, idx, filter, filter)
    v.unit = unit
    v.unitGUID = UnitGUID(unit)
    v.unitCasterGUID = v.caster and UnitGUID(v.caster) or nil
    v.mine = (v.caster and v.caster == 'player') and true or false
    if v.spellID then return v end
    LTC:Release(v)
end

local function RetrieveActiveAuras(unitID)
    if not UnitExists(unitID) then
        return
    end

    local auras = LTC:Acquire()
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

function lib:GetAura(unitID, spellID, mine)
    if type(spellID) == "table" then
        for i=1,#spellID do
            local aura = lib:GetAura(unitID, spellID[i], mine)
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

function lib:UpdateUnitCache(unitID, forceUpdate)
    if UnitExists(unitID) then
        local theGUID = UnitGUID(unitID)
        if forceUpdate or not unitCache[theGUID] then
            unitCache[theGUID] = unitCache[theGUID] or LTC:Acquire()
            if unitCache[theGUID].auras then LTC:Release(unitCache[theGUID].auras) end
            unitCache[theGUID].auras = RetrieveActiveAuras(unitID)
            unitCache[theGUID].lastSeen = GetTime()
        end
        lib:UpdateTimeToDie(unitID)
        return theGUID
    end
    return nil
end

function lib:PurgeExpiredUnitCaches()
    for k, v in pairs(unitCache) do
        if v.lastSeen and (v.lastSeen + purgeTime) <= GetTime() then
            LTC:Release(unitCache[k])
            unitCache[k] = nil
        end
    end
end

function lib:UpdateTimeToDie(unitID)
    local theGUID = UnitGUID(unitID)
    if not theGUID then return end
    if not unitCache[theGUID] then return end
    unitCache[theGUID].ttdData = unitCache[theGUID].ttdData or LTC:Acquire()
    local currHealth, currTime = UnitHealth(unitID), GetTime()
    local ttdData = unitCache[theGUID].ttdData

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
    ttdData.ttd = (deltaHealth == 0) and 99999 or abs(currHealth * (ttdData.initTime - ttdData.midTime) / deltaHealth)
end

function lib:UnitTimeToDie(unitID)
    local theGUID = UnitGUID(unitID)
    if not unitCache[theGUID] then return 99999 end
    return unitCache[theGUID].ttdData.ttd
end

if updateFrame then
    updateFrame:UnregisterAllEvents()
    updateFrame:SetScript("OnEvent", nil)
    updateFrame:SetScript("OnUpdate", nil)
else
    updateFrame = CreateFrame("Frame", MAJOR .. "_Frame")
end
updateFrame:Show()

updateFrame:SetScript("OnEvent", function(self, eventName, ...) lib[eventName](lib, eventName, ...) end)
updateFrame:RegisterEvent('PLAYER_ENTERING_WORLD')
updateFrame:RegisterEvent('PLAYER_TARGET_CHANGED')
updateFrame:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')

function lib:PLAYER_ENTERING_WORLD(eventName)
    lib:UpdateUnitCache('player', true)
end

function lib:PLAYER_TARGET_CHANGED(eventName)
    lib:UpdateUnitCache('target', true)
end

function lib:COMBAT_LOG_EVENT_UNFILTERED(eventName, timeStamp, combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, arg12, arg13, arg14, arg15)
    if (destGUID == playerGUID or destGUID == targetGUID) and combatEvent:find('SPELL_') == 1 then
        if combatEvent == 'SPELL_AURA_APPLIED' or combatEvent == 'SPELL_AURA_REFRESH' or combatEvent == 'SPELL_AURA_REMOVED' then
            forceUpdate = true
        end
    end
end

updateFrame:SetScript("OnUpdate", function()
    local now = GetTime()
    if forceUpdate or nextUpdateTime < now then
        forceUpdate = false
        nextUpdateTime = now + updateThrottle
        playerGUID = UnitExists('player') and UnitGUID('player') or nil
        if UnitExists('player') then lib:UpdateUnitCache('player', true) end
        targetGUID = UnitExists('target') and UnitGUID('target') or nil
        if UnitExists('target') then lib:UpdateUnitCache('target', true) end
        lib:PurgeExpiredUnitCaches()
    end
end)
