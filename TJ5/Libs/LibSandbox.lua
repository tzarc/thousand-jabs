local LibSandbox = LibStub:NewLibrary('LibSandbox-5.0', 1)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
local error = error
local getfenv = getfenv
local getmetatable = getmetatable
local pairs = pairs
local rawset = rawset
local setfenv = setfenv
local setmetatable = setmetatable
local tostring = tostring
local type = type

local real_G = _G
local sandboxes = {}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sandbox getter
local sandboxEnv__index = function(tbl, key)
    local mt = getmetatable(tbl)

    -- If the key is always allowed, reroute it to real_G
    if tContains(mt.alwaysAllowed, key) then
        return real_G[key]
    end

    -- Run through the getter observers
    local getters = mt.getterObservers
    if getters then
        for _,getter in pairs(getters) do
            getter(key)
        end
    end

    -- If we're not passing through to _G, return nil
    if not mt.passThrough then return nil end

    -- Pass-through to _G
    return real_G[key]
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sandbox setter
local sandboxEnv__newindex = function(tbl, key, val)
    local mt = getmetatable(tbl)

    -- If the key is always allowed, reroute it to real_G
    if tContains(mt.alwaysAllowed, key) then
        real_G[key] = val
        return
    end

    -- Run through the setter observers
    local setters = mt.setterObservers
    if setters then
        for _,setter in pairs(setters) do
            setter(key, val)
        end
    end

    -- Assign to the table
    rawset(tbl, key, val)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sandbox creation, sets up the file executing the function to be wrapped in its own isolated "_G"
function LibSandbox:NewSandbox(sandboxName, passThrough)
    -- Validate input...
    if type(sandboxName) ~= 'string' then
        error(('Could not create sandbox "%s"'):format(tostring(sandboxName)))
    end

    -- Ensure we don't call this multiple times
    if sandboxes[sandboxName] then
        error(('Sandbox "%s" already exists.'):format(sandboxName))
    end

    -- Default to pass-through for _G if unspecified
    passThrough = type(passThrough) == 'nil' and true or passThrough

    -- Create a replacement for _G
    local sandbox = setmetatable({}, {
        __index = sandboxEnv__index,
        __newindex = sandboxEnv__newindex,
        name = sandboxName,
        passThrough = passThrough,
        getterObservers = {},
        setterObservers = {},
        alwaysAllowed = {},
    })

    -- Ensure any access to _G is rerouted through the sandbox
    rawset(sandbox, '_G', sandbox)

    -- Create and return the sandbox
    sandboxes[sandboxName] = sandbox
    return sandbox
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Gets a pre-existing sandbox
local function getSandboxName(sandbox)
    for k,v in pairs(sandboxes) do
        if v == sandbox then return k end
    end
    return tostring(sandbox)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Gets a pre-existing sandbox
function LibSandbox:GetSandbox(sandboxInput)
    -- Get the sandbox we're attempting to use
    local sandbox = type(sandboxInput) == 'table' and sandboxInput or sandboxes[sandboxInput]
    if not sandbox then
        error(('Sandbox "%s" does not exist.'):format(getSandboxName(sandboxInput)))
    end

    -- Ensure the sandbox has the correct environment
    local mt = getmetatable(sandbox)
    if not mt or not mt.getterObservers or not mt.setterObservers then
        error(('Sandbox "%s" has an invalid metatable.'):format(getSandboxName(sandbox)))
    end

    -- Validation success, return the sandbox
    return sandbox
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Gets a pre-existing sandbox, and attaches the current file to that environment, wrapping that file in the sandbox's equivalent of "_G"
function LibSandbox:UseSandbox(sandboxInput)
    -- Get the sandbox we're attempting to use
    local sandbox = self:GetSandbox(sandboxInput)

    -- Check that someone else hasn't already modified the environment
    local prevEnv = getfenv(2)
    if prevEnv ~= real_G then
        error(('Sandbox "%s" has another environment attached already.'):format(getSandboxName(sandbox)))
    end

    -- Attach the sandbox to the currently executing file as its "_G" replacement
    setfenv(2, sandbox)

    return sandbox
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Attaches observers to the getter/setter for unknown entries to the sandbox's "_G"
function LibSandbox:AttachObservers(sandboxInput, getterObserver, setterObserver)
    -- Ensure we have a sandbox by that name
    local sandbox = self:GetSandbox(sandboxInput)

    -- Add the observers to the lists
    local mt = getmetatable(sandbox)
    if getterObserver then mt.getterObservers[1+#mt.getterObservers] = getterObserver end
    if setterObserver then mt.setterObservers[1+#mt.setterObservers] = setterObserver end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Allows passthrough to the real _G for the specified keys, regardless of the passthrough status
function LibSandbox:AllowPassthrough(sandboxInput, ...)
    -- Ensure we have a sandbox by that name
    local sandbox = self:GetSandbox(sandboxInput)

    -- Add the observers to the lists
    local mt = getmetatable(sandbox)
    for i=1,select('#', ...) do
        mt.alwaysAllowed[1+#mt.alwaysAllowed] = select(i, ...)
    end
end
