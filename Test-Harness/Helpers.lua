local tconcat = table.concat
local tremove = table.remove
local tinsert = table.insert
local tsort = table.sort

function splitlines(str)
    local t = {}
    local function helper(line) tinsert(t, line) return "" end
    helper(str:gsub("(.-)\r?\n", helper))
    return t
end

function trim(s)
    return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)'
end

local orderedPairsDispatch = function(state)
    state.idx = state.idx + 1
    local k = state.keys[state.idx]
    if k == nil then
        return nil
    else
        return k, state.tbl[k]
    end
end

function orderedpairs(tbl, f)
    local state = {
        idx = 0,
        keys = {},
        tbl = tbl
    }
    for n in pairs(tbl) do tinsert(state.keys, n) end
    tsort(state.keys, f)
    return orderedPairsDispatch, state
end
