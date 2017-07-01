-- Things to refer to:
-- compat.lua from lua 5.0.x source distribution
-- http://github.com/cogwheel/lua-wow

_G.strmatch = string.match

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

function UnitClass(unitID)
    if unitID == 'player' then
        return ARGV[1], ARGV[1]:upper(), ARGV[2]
    end
end
