-- Save args, ARGV[1] = className, ARGV[2] = classID, ARGV[3] = specID
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
_G['MockData'] = {}
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
    local function globalReadObserver(key, passThroughValue)
        local stack = debugstack(3)
        local file, line = stack:match('(.-):(.-):')
        local tableKey = ('%s:%s:%d'):format(key, file, tonumber(line))
        if not globalReads[tableKey] then
            globalReads[tableKey] = { stack = stack, file = file, line = tonumber(line), key = tostring(key), keyType = type(key) }
        end
        globalReadNames[file] = globalReadNames[file] or {}
        globalReadNames[file][key] = true
    end

    local function globalWriteObserver(key, val)
        local stack = debugstack(3)
        local file, line = stack:match('(.-):(.-):')
        local tableKey = ('%s:%s:%d'):format(key, file, tonumber(line))
        globalWrites[file] = globalWrites[file] or {}
        if not globalWrites[file][tableKey] then
            globalWrites[file][tableKey] = { stack = stack, file = file, line = tonumber(line), key = tostring(key), keyType = type(key), value = tostring(val), valueType = type(val) }
        end
    end

    LibSandbox:AttachObservers('TJ5', globalReadObserver, globalWriteObserver)
end

-- Engine libs
require('TJ5/Engine/DefaultsTable')
require('TJ5/Engine/Engine')
require('TJ5/Engine/Profiles')
require('TJ5/Engine/ExpressionParser')

require('TJ5/Generated-EquippedItems')
require('TJ5/Generated-ItemSets')

do
    local found = false
    for k,v in pairs(globalReadNames) do found = true break end
    if found then
        print('----------------------------------------------------------------------------------------------')
        print('-- Global reads needing local caching:')
        for filename,list in orderedpairs(globalReadNames) do
            if list then
                print(('\n-- %s'):format(filename))
                for k,v in orderedpairs(list) do
                    print(("local %s = %s"):format(k, k))
                end
            end
        end
        print('')
    end
end

do
    local found = false
    for k,v in pairs(globalWrites) do found = true break end
    if found then
        print('----------------------------------------------------------------------------------------------')
        print('-- Global writes needing refactoring:')
        for filename,filedata in orderedpairs(globalWrites) do
            print(("File: %s"):format(filename))
            for _,v in orderedpairs(filedata) do
                print(("%15s: %s = %s"):format(('line %d'):format(v.line), tostring(v.key), tostring(v.value)))
            end
        end
    end
end

print(GetTime())
print(debugprofilestop())
print(GetTime())
