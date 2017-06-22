local LibStub = LibStub
local MAJOR, MINOR = 'LibSandbox-5.0', 1
local LibSandbox = LibStub:NewLibrary(MAJOR, MINOR)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
local real_G = _G
local sandboxes = {}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sandbox getter
local sandboxEnv__index = function(tbl, key)
    local mt = getmetatable(tbl)

    -- Run through the getter observers
    local getters = mt.__getterObservers
    if getters then
        for _,getter in pairs(getters) do
            getter(mt.__name, key)
        end
    end

    -- If we're not passing through to _G, return nil
    if not mt.__passThrough then return nil end

    -- Pass-through to _G
    return real_G[key]
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sandbox setter
local sandboxEnv__newindex = function(tbl, key, val)
    local mt = getmetatable(tbl)

    -- Run through the setter observers
    local setters = mt.__setterObservers
    if setters then
        for _,setter in pairs(setters) do
            setter(mt.__name, key, val)
        end
    end

    -- Assign to the table
    rawset(tbl, key, val)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sandbox creation, sets up the file executing the function to be wrapped in its own isolated "_G"
function LibSandbox:NewSandbox(sandboxName, getterObserver, setterObserver, passThrough)
    -- Ensure we don't call this multiple times
    if sandboxes[sandboxName] then
        error(('Sandbox "%s" already exists.'):format(sandboxName))
    end

    local prevEnv = getfenv(2)
    if prevEnv ~= real_G then
        error(('Sandbox "%s" has another environment attached already.'):format(sandboxName))
    end

    -- Default to pass-through for _G if unspecified
    passThrough = type(passThrough) == 'nil' and true or passThrough

    -- Create a replacement for _G
    local sandboxEnv = setmetatable({}, {
        __name = sandboxName,
        __passThrough = passThrough,
        __index = sandboxEnv__index,
        __newindex = sandboxEnv__newindex,
        __getterObservers = {},
        __setterObservers = {},
    })

    -- Attach the sandbox to the currently executing file as its "_G" replacement
    setfenv(2, sandboxEnv)

    -- Create and return the sandbox
    local sandbox = setmetatable({}, { __env = sandboxEnv })
    sandboxes[sandboxName] = sandbox
    return sandbox
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Gets a pre-existing sandbox
function LibSandbox:GetSandbox(sandboxName)
    return sandboxes[sandboxName]
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Gets a pre-existing sandbox, and attaches the current file to that environment, wrapping that file in the sandbox's equivalent of "_G"
function LibSandbox:GetAndAttachToSandbox(sandboxName)
    -- Ensure we have a sandbox by that name
    local sandbox = self:GetSandbox(sandboxName)
    if not sandbox then
        error(('Sandbox "%s" does not exist.'):format(sandboxName))
    end

    -- Ensure the sandbox still has an environment
    local mt = getmetatable(sandbox)
    local sandboxEnv = mt.__env
    if not sandboxEnv then
        error(('Sandbox "%s" does not exist.'):format(sandboxName))
    end

    -- Attach the sandbox to the currently executing file as its "_G" replacement
    setfenv(2, sandboxEnv)

    return sandbox
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Attaches observers to the getter/setter for unknown entries to the sandbox's "_G"
function LibSandbox:AttachObservers(sandboxName, getterObserver, setterObserver)
    -- Ensure we have a sandbox by that name
    local sandbox = self:GetSandbox(sandboxName)
    if not sandbox then
        error(('Sandbox "%s" does not exist.'):format(sandboxName))
    end

    -- Ensure the sandbox still has an environment
    local mt = getmetatable(sandbox)
    local sandboxEnv = mt.__env
    if not sandboxEnv then
        error(('Sandbox "%s" does not exist.'):format(sandboxName))
    end

    -- Add the observers to the lists
    local sbmt = getmetatable(sandboxEnv)
    if getterObserver then sbmt.__getterObservers[1+#sbmt.__getterObservers] = getterObserver end
    if setterObserver then sbmt.__setterObservers[1+#sbmt.__setterObservers] = setterObserver end
end
