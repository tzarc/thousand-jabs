-- Things to refer to:
-- compat.lua from lua 5.0.x source distribution
-- http://github.com/cogwheel/lua-wow

local posix = require('posix') -- needed for millisecond-precision timestamps

local tremove = table.remove
local tconcat = table.concat

_G.strmatch = string.match

-- Power Types (from FrameXML/Constants.lua)
_G.SPELL_POWER_MANA = 0;
_G.SPELL_POWER_RAGE = 1;
_G.SPELL_POWER_FOCUS = 2;
_G.SPELL_POWER_ENERGY = 3;
_G.SPELL_POWER_COMBO_POINTS = 4;
_G.SPELL_POWER_RUNES = 5;
_G.SPELL_POWER_RUNIC_POWER = 6;
_G.SPELL_POWER_SOUL_SHARDS = 7;
_G.SPELL_POWER_LUNAR_POWER = 8;
_G.SPELL_POWER_HOLY_POWER = 9;
_G.SPELL_POWER_ALTERNATE_POWER = 10;
_G.SPELL_POWER_MAELSTROM = 11;
_G.SPELL_POWER_CHI = 12;
_G.SPELL_POWER_INSANITY = 13;
_G.SPELL_POWER_OBSOLETE = 14;
_G.SPELL_POWER_OBSOLETE2 = 15;
_G.SPELL_POWER_ARCANE_CHARGES = 16;
_G.SPELL_POWER_FURY = 17;
_G.SPELL_POWER_PAIN = 18;

function GetBuildInfo()
    return ARGV[4]
end

function debugstack(count)
    local stack = debug.traceback()
    local stackLines = splitlines(stack)
    for i=1,(count or 0)+1 do tremove(stackLines,1) end
    for k,v in pairs(stackLines) do stackLines[k] = trim(v) end
    return tconcat(stackLines, '\n')
end

function tContains(table, item)
    local index = 1
    while table[index] do
        if item == table[index] then
            return 1
        end
        index = index + 1
    end
    return nil;
end

function wipe(tbl)
    for k,v in pairs(tbl) do
        tbl[k] = nil
    end
end

function debugprofilestop()
    local sec, nsec = posix.clock_gettime()

    -- Make the timestamp relative to 4am today
    local ct = os.date("*t", os.time())
    sec = sec - os.time({year=ct.year, month=ct.month, day=ct.day, hour=4, min=0, sec=0})

    return (sec*1000000) + (nsec/1000)
end

local frameTime = nil
function UpdateGetTime()
    frameTime = debugprofilestop() / 1000
end
UpdateGetTime()

function GetTime()
    return frameTime
end

function UnitClass(unitID)
    if unitID == 'player' then
        return ARGV[1], ARGV[1]:upper(), tonumber(ARGV[2])
    end
end

function GetSpecialization()
    return tonumber(ARGV[3])
end

function UnitHealth()
    return 100
end

function UnitHealthMax()
    return 100
end

function UnitPower()
    return 100
end

function UnitPowerMax()
    return 100
end

function GetPowerRegen()
    return 1
end

function CreateFrame()
    return {
        RegisterEvent = function() end,
        UnregisterEvent = function() end,
    }
end
