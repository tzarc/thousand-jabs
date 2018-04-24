LibStub('LibSandbox-5.0'):UseSandbox('TJ5')

local function statePrototype_ResetState(self, numTargets)
    local env = self.Env

    self:Reset()
    env:SetState(self)
    env:SetEnv(env)

    env.PredictionOffset = 0
end

function Engine:CreateState(...)
    local state = Engine:CreateStateEnvTable('state', {
        Env = Engine:CreateStateEnvTable('env', ...)
    })

    state:SetFunction('ResetState', statePrototype_ResetState)
    return state
end
