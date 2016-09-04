local MAJOR, MINOR = "LibUnitCache-1.0", 15
local lib, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

local LTC = LibStub('LibTableCache-1.0')

lib.unitCache = {}

local purgeTime = 10 -- in seconds
local lastUpdateTime = 0
local updateThrottle = 2.5 -- in seconds
local playerGUID, targetGUID

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
    for i=1, 40 do
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
    mine = mine and true or false
    local theGUID = UnitGUID(unitID)
    if self.unitCache[theGUID] then
        local auras = self.unitCache[theGUID].auras
        for i=1,#auras do
            local aura = auras[i]
            if aura.spellID == spellID and (not mine or aura.mine) then
                return aura
            end
        end
    end
end

function lib:UpdateUnitCache(unitID, forceUpdate)
    if UnitExists(unitID) then
        local theGUID = UnitGUID(unitID)
        if forceUpdate or not self.unitCache[theGUID] then
            self.unitCache[theGUID] = self.unitCache[theGUID] or LTC:Acquire()
            if self.unitCache[theGUID].auras then LTC:Release(self.unitCache[theGUID].auras) end
            self.unitCache[theGUID].auras = RetrieveActiveAuras(unitID)
            self.unitCache[theGUID].lastSeen = GetTime()
        end
        self:UpdateTimeToDie(unitID)
        return theGUID
    end
    return nil
end

function lib:PurgeExpiredUnitCaches()
    for k, v in pairs(self.unitCache) do
        if v.lastSeen and (v.lastSeen + purgeTime) <= GetTime() then
            LTC:Release(self.unitCache[k])
            self.unitCache[k] = nil
        end
    end
end

function lib:UpdateTimeToDie(unitID)
    local theGUID = UnitGUID(unitID)
    if not theGUID then return end
    if not self.unitCache[theGUID] then return end
    self.unitCache[theGUID].ttdData = self.unitCache[theGUID].ttdData or LTC:Acquire()
    local currHealth, currTime = UnitHealth(unitID), GetTime()
    local ttdData = self.unitCache[theGUID].ttdData

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
    if not self.unitCache[theGUID] then return 99999 end
    return self.unitCache[theGUID].ttdData.ttd
end

if lib.frame then
    lib.frame:UnregisterAllEvents()
    lib.frame:SetScript("OnEvent", nil)
    lib.frame:SetScript("OnUpdate", nil)
else
    lib.frame = CreateFrame("Frame", MAJOR .. "_Frame")
end
lib.frame:Show()
lib.frame:SetScript("OnEvent", function(self, eventName, ...) lib[eventName](lib, eventName, ...) end)
lib.frame:RegisterEvent('PLAYER_ENTERING_WORLD')
lib.frame:RegisterEvent('PLAYER_TARGET_CHANGED')
lib.frame:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')

function lib:PLAYER_ENTERING_WORLD(eventName)
    lib:UpdateUnitCache('player', true)
end

function lib:PLAYER_TARGET_CHANGED(eventName)
    lib:UpdateUnitCache('target', true)
end

local forceUpdate = false
function lib:COMBAT_LOG_EVENT_UNFILTERED(eventName, timeStamp, combatEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, arg12, arg13, arg14, arg15)
    if (destGUID == playerGUID or destGUID == targetGUID) and combatEvent:find('SPELL_') == 1 then
        if combatEvent == 'SPELL_AURA_APPLIED' or combatEvent == 'SPELL_AURA_REFRESH' or combatEvent == 'SPELL_AURA_REMOVED' then
            forceUpdate = true
        end
    end
end

lib.frame:SetScript("OnUpdate", function(self)
    if forceUpdate or GetTime() > (lastUpdateTime + updateThrottle) then
        forceUpdate = false
        lastUpdateTime = GetTime()
        playerGUID = UnitExists('player') and UnitGUID('player') or nil
        if UnitExists('player') then lib:UpdateUnitCache('player', true) end
        targetGUID = UnitExists('target') and UnitGUID('target') or nil
        if UnitExists('target') then lib:UpdateUnitCache('target', true) end
        lib:PurgeExpiredUnitCaches()
    end
end)
