local addonName, addonTable = ...
local LibSandbox = LibStub('LibSandbox-5.0')

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Global -> Local copies
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local debugstack = debugstack

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Core module definition
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Core = LibSandbox:NewSandbox('Core')

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Unknown field sandbox getter/setter observers
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local attemptedGets = {}
Core.attemptedGetter = function(sandboxName, key)
    local tmpKey = ('%s:::%s:::%s'):format(sandboxName, key, debugstack(3))
    if not attemptedGets[tmpKey] then
        attemptedGets[tmpKey] = { sandboxName = sandboxName, key = key, stack = debugstack(3) }
    end
end

local attemptedSets = {}
Core.attemptedSetter = function(sandboxName, key, val)
    local tmpKey = ('%s:::%s:::%s'):format(sandboxName, key, debugstack(3))
    if not attemptedSets[tmpKey] then
        attemptedSets[tmpKey] = { sandboxName = sandboxName, key = key, value = val, stack = debugstack(3) }
    end
end

LibSandbox:AttachObservers('Core', Core.attemptedGetter, Core.attemptedSetter)
Core.attemptedGets, Core.attemptedSets = attemptedGets, attemptedSets

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Core:Format(f, ...)
    return ((select('#', ...) > 0) and f:format(...) or (type(f) == 'string' and f) or tostring(f) or '')
end

do
    local orderedPairsDispatch = function(state)
        state.idx = state.idx + 1
        local k = state.keys[state.idx]
        if k == nil then
            state.tbl = nil
            rt(state)
            return nil
        else
            return k, state.tbl[k]
        end
    end

    function Core:OrderedPairs(tbl, f)
        local state = ct()
        state.keys = ct()
        state.tbl = tbl
        state.idx = 0
        for n in pairs(tbl) do tinsert(state.keys, n) end
        tsort(state.keys, f)
        return orderedPairsDispatch, state
    end
end
