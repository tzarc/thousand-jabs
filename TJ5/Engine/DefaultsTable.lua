local addonName = ...

local getmetatable = getmetatable
local pairs = pairs
local select = select
local setmetatable = setmetatable
local type = type
local wipe = wipe

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

local registeredFallbackTables = {}
function Engine:RegisterFallbackTable(name, ...)
    local tbl = Engine:CreateStateEnvTable(name, ...)
    registeredFallbackTables[name] = tbl
    return tbl
end

local function getDefaultsTable(input)
    if type(input) == 'table' then
        return input
    elseif type(input) == 'string' then
        return registeredFallbackTables[input]
    end
end

local function defaultsTablePrototype__index(self, key)
    local mt = getmetatable(self)

    -- If there's a matching function, return that
    local f = mt.functions[key]
    if f then return f end

    -- Otherwise, check if the default has a function, in which case we execute the function and return the result
    local v = mt.defaults[key]
    if type(v) == 'function' then
        return v(self, mt.env, mt.state)
    end

    -- Fall back to just returning the value
    return v
end

local function defaultsTablePrototype_Reset(self)
    local mt = getmetatable(self)

    -- Clear out any present entries
    wipe(self)

    -- If any of the defaults are tables, and they have a Reset function... execute that too...
    for k,v in pairs(mt.defaults) do
        if type(v) == 'table' and type(v.Reset) == 'function' then
            v:Reset()
        end
    end
end

local function defaultsTablePrototype_SetEnv(self, env)
    local mt = getmetatable(self)

    -- Update the env table
    mt.env = env

    -- If any of the children are tables, and they have a SetEnv function... set it there too...
    for k,v in pairs(self) do
        if type(v) == 'table' and type(v.SetEnv) == 'function' then
            v:SetEnv(env)
        end
    end
    -- Same for defaults table
    for k,v in pairs(mt.defaults) do
        if type(v) == 'table' and type(v.SetEnv) == 'function' then
            v:SetEnv(env)
        end
    end
end

local function defaultsTablePrototype_SetState(self, state)
    local mt = getmetatable(self)

    -- Update the state table
    mt.state = state

    -- If any of the children are tables, and they have a SetState function... set it there too...
    for k,v in pairs(self) do
        if type(v) == 'table' and type(v.SetState) == 'function' then
            v:SetState(state)
        end
    end
    -- Same for defaults table
    for k,v in pairs(mt.defaults) do
        if type(v) == 'table' and type(v.SetState) == 'function' then
            v:SetState(state)
        end
    end
end

local function defaultsTablePrototype_SetFunction(self, funcName, func, override)
    local mt = getmetatable(self)
    override = override and true or false

    if override or type(mt.functions[funcName]) == 'nil' then
        mt.functions[funcName] = func
    end
end

local function defaultsTablePrototype_SetDefaults(self, defaults, override)
    local t = getDefaultsTable(defaults)
    local mt = getmetatable(self)
    override = override and true or false

    -- If we're dealing with a defaults table already, then use the defaults rather than any normal key/value pairs
    local t_mt = getmetatable(t)
    if t_mt and type(t_mt.defaults) == 'table' then
        for k,v in pairs(t_mt.defaults) do
            if override or type(mt.defaults[k]) == 'nil' then
                mt.defaults[k] = v
            end
        end
    else -- Otherwise copy across the normal key/value pairs instead
        for k,v in pairs(t) do
            if override or type(mt.defaults[k]) == 'nil' then
                mt.defaults[k] = v
            end
    end
    end
end

local unsuppliedTableFactory = function() return {} end
local function defaultsTablePrototype_Evaluate(self, tableFactory)
    local tf = tableFactory or unsuppliedTableFactory
    local output = tf()

    -- Evaluate any of the values directly in the table
    for k,v in pairs(self) do
        if type(v) == 'table' then
            if type(v.Evaluate) == 'function' then
                output[k] = v:Evaluate(tf)
            else
                output[k] = tf()
                output[k].__unevaluated = true
            end
        else
            output[k] = v
        end
    end

    -- Then iterate through the defaults, assuming that there was no entry previously evaluated
    for k,v in pairs(getmetatable(self).defaults) do
        if type(output[k]) == 'nil' then
            if type(v) == 'table' then
                if type(v.Evaluate) == 'function' then
                    output[k] = self[k]:Evaluate(tf)
                else
                    output[k] = tf()
                    output[k].__unevaluated = true
                end
            else
                output[k] = self[k]
            end
        end
    end

    return output
end

function Engine:CreateDefaultsTable(name, ...)
    local tbl = setmetatable({}, {
        __index = defaultsTablePrototype__index,
        name = name,
        functions = {
            Reset = defaultsTablePrototype_Reset,
            SetFunction = defaultsTablePrototype_SetFunction,
            SetDefaults = defaultsTablePrototype_SetDefaults,
            Evaluate = defaultsTablePrototype_Evaluate,
        },
        defaults = {},
    })

    for i=1,select('#', ...) do
        local defaults = getDefaultsTable(select(i, ...))
        if type(defaults) == 'table' then
            tbl:SetDefaults(defaults)
        end
    end

    tbl:Reset()

    return tbl
end

function Engine:CreateStateEnvTable(name, ...)
    local tbl = self:CreateDefaultsTable(name, ...)
    tbl:SetFunction('SetEnv', defaultsTablePrototype_SetEnv)
    tbl:SetFunction('SetState', defaultsTablePrototype_SetState)
    return tbl
end
