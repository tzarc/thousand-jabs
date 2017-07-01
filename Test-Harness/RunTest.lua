-- Save args, ARGV[1] = className, ARGV[2] = classID
ARGV=arg

-- Base libs
require('Test-Harness/Helpers')
require('Test-Harness/WoW-Mocks')
require('Temp/LibStub')
require('Temp/CallbackHandler')
require('TJ5/Libs/LibSandbox')

-- Globals
local debugstack = debugstack
local orderedpairs = orderedpairs
local pairs = pairs
local print = print
local require = require
local splitlines = splitlines
local tonumber = tonumber
local tostring = tostring
local trim = trim
local type = type
local UnitClass = UnitClass

-- Sandbox
local LibSandbox = LibStub('LibSandbox-5.0')
LibSandbox:NewSandbox('TJ5')
LibSandbox:UseSandbox('TJ5')

-- Globals
_G['Engine'] = {}
_G['TableCache'] = {}

-- Table cache helpers
require('TJ5/TableCache')
_G['CT'] = function() return TableCache:Acquire() end
_G['RT'] = function(tbl) TableCache:Release(tbl) end

-- Locals
local globalReadNames = {}
local globalReads = {}
local globalWrites = {}

-- Unknown field sandbox getter/setter observers
do
    local function globalReadObserver(key)
        local stack = debugstack(3)
        local file, line = stack:match('(.-):(.-):')
        local tableKey = ('%s:%s:%d'):format(key, file, tonumber(line))
        if not globalReads[tableKey] then
            globalReads[tableKey] = { stack = stack, key = tostring(key), keyType = type(key) }
        end
        globalReadNames[file] = globalReadNames[file] or {}
        globalReadNames[file][key] = true
    end

    local function globalWriteObserver(key, val)
        local stack = debugstack(3)
        local file, line = stack:match('(.-):(.-):')
        local tableKey = ('%s:%s:%d'):format(key, file, tonumber(line))
        if not globalWrites[tableKey] then
            globalWrites[tableKey] = { stack = stack, key = tostring(key), keyType = type(key), value = tostring(val), valueType = type(val) }
        end
    end

    LibSandbox:AttachObservers('TJ5', globalReadObserver, globalWriteObserver)
end

-- Engine libs
require('TJ5/Engine/DefaultsTable')
require('TJ5/Engine/Engine')
require('TJ5/Engine/Profiles')
require('TJ5/Engine/ExpressionParser')

-- Test runner
local LSD = require('TJ5/Libs/LibSerpentDump')

print(LSD({Engine=Engine,UnitClass={UnitClass('player')}}))
print(LSD({globalReads=globalReads,globalWrites=globalWrites,globalReadNames=globalReadNames}))

local function copiesExport()
    local s = ''
    for filename,list in orderedpairs(globalReadNames) do
        print(LSD({list=list}))
        if list then
            s = s .. ('\n-- %s\n'):format(filename)
            for k,v in orderedpairs(list) do
                s = s .. ("local %s = %s\n"):format(k, k)
            end
        end
    end
    return s:len() > 0 and (s..'\n') or s
end

print(LSD(copiesExport()))
