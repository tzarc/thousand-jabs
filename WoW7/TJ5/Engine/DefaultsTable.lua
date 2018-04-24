local addonName = ...

local getmetatable = getmetatable
local pairs = pairs
local select = select
local setmetatable = setmetatable
local type = type
local wipe = wipe

LibStub('LibSandbox-5.0'):UseSandbox('TJ5')

local registeredFallbackTables = {}
function Engine:RegisterFallbackTable(name, ...)
    local tbl = self:CreateStateEnvTable(name, ...)
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

local function defaultsTablePrototype_HasKey(self, key)
    if type(rawget(self, key)) ~= 'nil' then return true end
    if type(rawget(getmetatable(self).defaults, key)) ~= 'nil' then return true end
    if type(rawget(getmetatable(self).functions, key)) ~= 'nil' then return true end
    return false
end

local function defaultsTablePrototype_Name(self)
    return getmetatable(self).name
end

local function defaultsTablePrototype_DisplayName(self)
    return getmetatable(self).displayName
end

local function defaultsTablePrototype_UpdateDisplayName(self, prefix)
    local mt = getmetatable(self)
    local newName = prefix and (prefix .. '.' .. self:Name()) or self:Name()
    mt.displayName = newName

    -- If any of the children are tables, and they have a DisplayName function... update theirs too...
    for k,v in pairs(self) do
        if type(v) == 'table' and type(v.UpdateDisplayName) == 'function' then
            v:UpdateDisplayName(newName)
        end
    end
    -- Same for defaults table
    for k,v in pairs(mt.defaults) do
        if type(v) == 'table' and type(v.UpdateDisplayName) == 'function' then
            v:UpdateDisplayName(newName)
        end
    end

end

local function defaultsTablePrototype_Reset(self, st)
    -- Create a previously-seen table if unspecified
    local seenTables = st
    local allocatedSeen = false
    if not seenTables then
        allocatedSeen = true
        seenTables = CT()
    end

    -- Drop out early if we've already processed this table
    if seenTables[self] then return end
    seenTables[self] = true

    -- Clear out any present entries
    wipe(self)

    -- If any of the defaults are tables, and they have a Reset function... execute that too...
    local mt = getmetatable(self)
    for k,v in pairs(mt.defaults) do
        if type(v) == 'table' and type(v.Reset) == 'function' then
            v:Reset(seenTables)
        end
    end

    -- Release the seen table
    if allocatedSeen then
        wipe(seenTables)
        RT(seenTables)
    end
end

local function defaultsTablePrototype_SetEnv(self, env)
    -- Update the env table
    local mt = getmetatable(self)
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
    -- Update the state table
    local mt = getmetatable(self)
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
    override = override and true or false

    local mt = getmetatable(self)
    if override or type(mt.functions[funcName]) == 'nil' then
        mt.functions[funcName] = func
    end
end

local function defaultsTablePrototype_SetDefaults(self, defaults, override)
    local mt = getmetatable(self)
    local t = getDefaultsTable(defaults)
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

local function defaultsTablePrototype_Evaluate(self)
    -- WARNING: Do not do this on the critical code path - it does NOT use table caching. Use for debugging only.

    -- Function to wrap  safe evaluation of the table entries
    local function evaluator()
        local output = {}
        output.__name = self:Name()
        output.__displayName = self:DisplayName()

        -- Evaluate any of the values directly in the table
        for k,v in pairs(self) do
            if type(v) == 'table' then
                if type(v.Evaluate) == 'function' then
                    output[k] = v:Evaluate()
                else
                    output[k] = { __unevaluated_no_Evaluate_function = true }
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
                        output[k] = self[k]:Evaluate()
                    else
                        output[k] = { __unevaluated_no_Evaluate_function = true }
                    end
                else
                    output[k] = self[k]
                end
            end
        end

        return output
    end

    -- Set the environment that the table is evaluated under
    setfenv(evaluator, getmetatable(self).env)

    -- Invoke the evaluation function
    local ok, output = pcall(evaluator)

    if not ok then error(output) end
    return output
end

function Engine:CreateDefaultsTable(name, ...)
    local tbl = setmetatable({}, {
        __index = defaultsTablePrototype__index,
        name = name,
        displayName = name,
        functions = {
            Name = defaultsTablePrototype_Name,
            DisplayName = defaultsTablePrototype_DisplayName,
            UpdateDisplayName = defaultsTablePrototype_UpdateDisplayName,
            HasKey = defaultsTablePrototype_HasKey,
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

    return tbl
end

function Engine:CreateStateEnvTable(name, ...)
    local tbl = self:CreateDefaultsTable(name, ...)
    tbl:SetFunction('SetEnv', defaultsTablePrototype_SetEnv)
    tbl:SetFunction('SetState', defaultsTablePrototype_SetState)
    return tbl
end
