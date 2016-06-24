local _, private = ...;
local TJ = private.TJ
local DBG = private.DBG
local tcache = private.tcache
local db = private.db

-- Disabled for Legion - nothing tested for monks!
local IsLegion = select(4, GetBuildInfo()) >= 70000
if IsLegion then return end

------------------------------------------------------------------------------------------------------------------------
-- Local variables
------------------------------------------------------------------------------------------------------------------------
local chiFrameSize = 35
local padding = 4

------------------------------------------------------------------------------------------------------------------------
-- Helper functions
------------------------------------------------------------------------------------------------------------------------
local function IsWindwalker()
    return GetSpecialization() == 3 and true or false
end

------------------------------------------------------------------------------------------------------------------------
-- Monk energy/chi
------------------------------------------------------------------------------------------------------------------------
local monk_power = private:LogMissingAccess("monk_power",{
    energy = {
        sampled = function(power,env) return (UnitPower('player', SPELL_POWER_ENERGY) or 0) end,
        regen = function(power, env) return GetPowerRegen() end,
        spent = 0,
        curr = function(power,env) return power.sampled - power.spent + power.regen * env.predictionOffset end,
        max = function(power,env) return (UnitPowerMax('player', SPELL_POWER_ENERGY) or 0) end,
        time_to_max = function(power,env) return (power.max - power.curr) /power.regen end,
    },
    chi = {
        sampled = function(power,env) return (UnitPower('player', SPELL_POWER_CHI) or 0) end,
        gained = 0,
        spent = 0,
        curr = function(power,env) return power.sampled + power.gained - power.spent end,
        max = function(power,env) return (UnitPowerMax('player', SPELL_POWER_CHI) or 0) end,
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Monk common functions
------------------------------------------------------------------------------------------------------------------------
local monk_functions = private:LogMissingAccess("monk_functions",{
    Activate = function(self)
        -- Show the chi frames
        self.frames.background:Show()
        -- Update the chi amount
        self:UpdateChiFrames()
    end,
    Deactivate = function(self)
        -- Hide the chi frames
        self.frames.background:Hide()
    end,
    PerformUpdate = function(self)
        -- Chi
        self:UpdateChiFrames()

        -- Power Strikes
        if self.power_strikes:talent_selected() then
            self.frames.powerStrikesIcon:Show()
            if private:GetAura('player', self.power_strikes.auraID, true) then
                self.frames.powerStrikesIcon.tex:SetDesaturated(false)
            else
                self.frames.powerStrikesIcon.tex:SetDesaturated(true)
            end
        else
            self.frames.powerStrikesIcon:Hide()
        end

        -- Chi Brew
        if self.chi_brew:talent_selected() then
            self.frames.chiBrewIcon:Show()
            local currentCharges, maxCharges, cooldownStart, cooldownDuration = GetSpellCharges(self.chi_brew.abilityID)
            if currentCharges > 0 then
                self.frames.chiBrewIcon.tex:SetDesaturated(false)
            else
                self.frames.chiBrewIcon.tex:SetDesaturated(true)
            end
            if currentCharges == 0 then
                self.frames.chiBrewCooldown:SetCooldown(cooldownStart,cooldownDuration)
            end
        else
            self.frames.chiBrewIcon:Hide()
        end
    end,
    UpdateChiFrames = function(self)
        local chiCurr, chiMax = UnitPower('player', SPELL_POWER_CHI) or 0, UnitPowerMax('player', SPELL_POWER_CHI) or 0

        -- Chi
        local baseChiFrames, activeChiFrames = self.frames.base, self.frames.active
        for i=1,chiCurr do
            baseChiFrames[i]:Show()
            activeChiFrames[i]:Show()
        end
        for i=chiCurr+1,chiMax do
            baseChiFrames[i]:Show()
            activeChiFrames[i]:Hide()
        end
        for i=chiMax+1,6 do
            baseChiFrames[i]:Hide()
            activeChiFrames[i]:Hide()
        end
    end,
    CreateFrames = function(self, parent)
        if self.frames then return end

        local frames = { base = {}, active = {} }
        local baseFrame = CreateFrame('Frame', self.profileName..'_ChiBackground', parent)
        baseFrame:ClearAllPoints()
        baseFrame:SetBackdrop({
            bgFile = 'Interface\\Tooltips\\UI-Tooltip-Background',
            edgeFile = nil,
            tile = true,
            tileSize = 4,
            edgeSize = 0,
        })
        baseFrame:SetBackdropColor(0, 0, 0, 0.3)
        baseFrame:SetPoint('TOP', parent, 'BOTTOM')
        baseFrame:SetWidth(parent:GetWidth())
        baseFrame:SetHeight(padding+chiFrameSize+padding)
        baseFrame:Show()
        frames.background = baseFrame

        -- Create the chi frames
        local positions = {}
        local xPos = (0.5*baseFrame:GetWidth()) - (3*chiFrameSize) - padding - padding - padding*0.5
        for i=1,6 do
            positions[#positions+1] = xPos
            local chiBaseFrame, chiActiveFrame = self:CreateSingleChiFrame(baseFrame, i, xPos)
            frames.base[#frames.base+1] = chiBaseFrame
            frames.active[#frames.active+1] = chiActiveFrame
            chiBaseFrame:Show()
            chiActiveFrame:Show()
            xPos = xPos + chiFrameSize + padding
        end

        -- Create the power strikes icon
        local powerStrikesIcon = private:CreateSingleIconFrame(self.profileName.."_PowerStrikes", baseFrame, chiFrameSize, positions[6], padding, 'BOTTOMLEFT')
        powerStrikesIcon.tex:SetTexture(self.power_strikes.icon)
        frames.powerStrikesIcon = powerStrikesIcon
        frames.powerStrikesIcon:Hide()

        -- Create the chi brew icon
        local chiBrewIcon = private:CreateSingleIconFrame(self.profileName.."_ChiBrew", baseFrame, chiFrameSize, positions[6], padding, 'BOTTOMLEFT')
        chiBrewIcon.tex:SetTexture(self.chi_brew.icon)
        frames.chiBrewIcon = chiBrewIcon
        frames.chiBrewIcon:Hide()

        frames.chiBrewCooldown = CreateFrame('Cooldown', self.profileName..'_ChiBrewCooldown', frames.chiBrewIcon, 'CooldownFrameTemplate')
        frames.chiBrewCooldown:SetAllPoints()

        self.frames = frames
    end,
    CreateSingleChiFrame = function(self, parent, chiIndex, xOffset)
        -- Create the background for the chi (i.e. when chi < this)
        local chiBaseFrame = CreateFrame('Frame', self.profileName..'_ChiInactive'..chiIndex, parent)
        chiBaseFrame:SetWidth(chiFrameSize)
        chiBaseFrame:SetHeight(chiFrameSize)
        chiBaseFrame:ClearAllPoints()
        chiBaseFrame:SetPoint('BOTTOMLEFT', parent, 'BOTTOMLEFT', xOffset, padding)
        local tex = chiBaseFrame:CreateTexture(nil, 'OVERLAY')
        tex:SetTexture('Interface\\GuildFrame\\GuildLogoMask_l')
        tex:SetVertexColor(0,0,0,0.7)
        tex:SetWidth(chiFrameSize)
        tex:SetHeight(chiFrameSize)
        tex:SetAllPoints()
        chiBaseFrame.tex = tex

        -- Create the foreground for the chi (i.e. when chi >= this)
        local chiActiveSize = chiFrameSize - padding - padding
        local chiActiveFrame = CreateFrame('Frame', self.profileName..'_ChiActive'..chiIndex, chiBaseFrame)
        chiActiveFrame:SetWidth(chiActiveSize)
        chiActiveFrame:SetHeight(chiActiveSize)
        chiActiveFrame:ClearAllPoints()
        chiActiveFrame:SetPoint('CENTER', chiBaseFrame, 'CENTER', 0, 0)
        local tex = chiActiveFrame:CreateTexture(nil, 'OVERLAY')
        tex:SetTexture('Interface\\GuildFrame\\GuildLogoMask_l')
        tex:SetVertexColor(2.0-((chiIndex-1)*0.4),((chiIndex-1)*0.4),0,1.0)
        tex:SetWidth(chiActiveSize)
        tex:SetHeight(chiActiveSize)
        tex:SetAllPoints()
        chiActiveFrame.tex = tex

        return chiBaseFrame, chiActiveFrame
    end,
})

------------------------------------------------------------------------------------------------------------------------
-- Monk event handler functions
------------------------------------------------------------------------------------------------------------------------
local monk_event_handlers = private:LogMissingAccess("monk_event_handlers",{
    UNIT_POWER = function(self, eventName, unitID, powerType)
        if unitID == 'player' then
            -- Update the chi frames if required
            if powerType == 'CHI' then
                self:UpdateChiFrames()
            end
        end
    end,
    UNIT_POWER_FREQUENT = function(self, eventName, unitID, powerType)
        self:UNIT_POWER(eventName, unitID, powerType)
    end,
})

------------------------------------------------------------------------------------------------------------------------
-- Common monk abilities
------------------------------------------------------------------------------------------------------------------------
local monk_common_abilities = private:LogMissingAccess("monk_common_abilities",{
    tiger_power = {
        auraID = 125359,
        auraUnit = 'player',
        auraMine = true,
    },
    expel_harm = {
        abilityID = 115072,
        energyCost = 40,
        cooldownTime = 15,
        chiGain = function(spell,env) return 1 end,

        PerformCast = function(spell, env)
            env.energy.spent = env.energy.spent + spell.energyCost
            env.chi.gained = env.chi.gained + spell.chiGain
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (spell.cooldown_remains == 0 and env.energy.curr >= spell.energyCost) end,
    },
    spinning_crane_kick = {
        abilityID = 101546,
        energyCost = 40,
        chiGain = 1,

        PerformCast = function(spell, env)
            env.energy.spent = env.energy.spent + spell.energyCost
            env.chi.gained = env.chi.gained + spell.chiGain
        end,

        spell_cast_time = function(spell, env) return env.playerHasteMultiplier * 2.0 end,
        spell_can_cast = function(spell, env) return (env.energy.curr >= spell.energyCost) end,
    },
    touch_of_death = {
        abilityID = 115080,
        chiCost = function(spell, env) return spell.glyph_selected and 0 or 3 end,
        cooldownTime = function(spell, env) return spell.glyph_selected and 210 or 90 end,

        PerformCast = function(spell, env)
            env.chi.spent = env.chi.spent + spell.chiCost
            if env.serenity.talent_selected and env.serenity.aura_remains > 0 then
                env.chi.gained = env.chi.gained + spell.chiCost
            end
        end,

        glyph_selected = function(spell, env)
            for i=1,6 do if select(4, GetGlyphSocketInfo(i)) == 123391 then return true end end
            return false
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (env.health.target_percent > 0 and env.target.exists and spell.cooldown_remains == 0 and env.chi.curr >= spell.chiCost) end,
    },
    fortifying_brew = {
        abilityID = 115203,
        auraID = 120954,
        auraUnit = 'player',
        auraMine = true,
        cooldownTime = 180,

        PerformCast = function(spell, env)
            spell.expirationTime = env.currentTime + 15
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env)
            if env.dampen_harm.talent_selected and env.dampen_harm.aura_remains > 0 then return false end
            if env.diffuse_magic.talent_selected and env.diffuse_magic.aura_remains > 0 then return false end
            return (spell.cooldown_remains == 0)
        end,
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Monk talents
------------------------------------------------------------------------------------------------------------------------
local monk_talents = private:LogMissingAccess("monk_talents",{
    chi_wave = {
        talentIDs = { 2, 1 },
        abilityID = 115098,
        cooldownTime = 15,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
    zen_sphere = {
        talentIDs = { 2, 2 },
        abilityID = 124081,
        auraID = 124081,
        auraUnit = 'player',
        auraMine = true,
        cooldownTime = 10,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = function(spell, env) return env.playerHasteMultiplier * 1.0 end,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
    chi_burst = {
        talentIDs = { 2, 3 },
        abilityID = 123986,
        cooldownTime = 30,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = function(spell, env) return env.playerHasteMultiplier * 1.0 end,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
    power_strikes = {
        talentIDs = { 3, 1 },
        auraID = 129914,
        auraUnit = 'player',
        auraMine = true,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
    },
    chi_brew = {
        talentIDs = { 3, 3 },
        abilityID = 115399,
        rechargeTime = 60,
        chiGain = 2,

        PerformCast = function(spell, env)
            env.chi.gained = env.chi.gained + spell.chiGain
            spell.rechargeSpent = spell.rechargeSpent + 1
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 0,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.spell_charges > 0) and true or false) end,
    },
    rushing_jade_wind = {
        talentIDs = { 6, 1 },
        abilityID = 116847,
        energyCost = 40,
        chiGain = 1,
        cooldownTime = function(spell, env) return env.playerHasteMultiplier * 6.0 end,

        PerformCast = function(spell, env)
            env.energy.spent = env.energy.spent + spell.energyCost
            env.chi.gained = env.chi.gained + spell.chiGain
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
    chi_torpedo = {
        talentIDs = { 6, 3 },
        abilityID = 115008,
        rechargeTime = 20,

        PerformCast = function(spell, env)
            spell.rechargeSpent = spell.rechargeSpent + 1
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 0,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.spell_charges > 0) and true or false) end,
    },
    dampen_harm = {
        talentIDs = { 5, 2 },
        abilityID = 122278,
        auraID = 122278,
        auraUnit = 'player',
        auraMine = true,
        cooldownTime = 90,

        PerformCast = function(spell, env)
            spell.expirationTime = env.currentTime + 45
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0 and env.fortifying_brew.aura_remains == 0) and true or false) end,
    },
    diffuse_magic = {
        talentIDs = { 5, 3 },
        abilityID = 122783,
        auraID = 122783,
        auraUnit = 'player',
        auraMine = true,
        cooldownTime = 90,

        PerformCast = function(spell, env)
            spell.expirationTime = env.currentTime + 6
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0 and env.fortifying_brew.aura_remains == 0) and true or false) end,
    },
    invoke_xuen = {
        talentIDs = { 6, 2 },
        abilityID = 123904,
        cooldownTime = 180,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 0,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
    hurricane_strike = {
        talentIDs = { 7, 1 },
        abilityID = 152175,
        chiCost = 3,
        cooldownTime = 45,

        PerformCast = function(spell, env)
            env.chi.spent = env.chi.spent + spell.chiCost
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0 and env.chi.curr >= spell.chiCost) and true or false) end,
    },
    chi_explosion = {
        talentIDs = { 7, 2 },
        abilityID = 152174,
        chiCost = function(spell,env)
            local spent = env.chi.curr
            if spent < 1 then spent = 1 end
            if spent > 4 then spent = 4 end
            return spent
        end,

        PerformCast = function(spell, env)
            env.chi.spent = env.chi.spent + spell.chiCost
            if (IsWindwalker() and env.combo_breaker_ce.expirationTime > 0) then
                env.chi.gained = env.chi.gained + 2
                env.combo_breaker_ce.expirationTime = 0
            end
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and env.chi.curr >= spell.chiCost) and true or false) end,
    },
    serenity = {
        talentIDs = { 7, 3 },
        abilityID = 152173,
        auraID = 152173,
        auraUnit = 'player',
        auraMine = true,
        cooldownTime = 90,

        PerformCast = function(spell, env)
            spell.expirationTime = env.currentTime + 5
        end,

        talent_selected = function(spell, env) return select(4, GetTalentInfo(spell.talentIDs[1], spell.talentIDs[2], GetActiveSpecGroup())) or false end,
        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return ((spell.talent_selected and spell.cooldown_remains == 0) and true or false) end,
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Windwalker-specific abilties
------------------------------------------------------------------------------------------------------------------------
local monk_windwalker_abilities = private:LogMissingAccess("monk_windwalker_abilities",{
    jab = {
        abilityID = 115698,
        icon = "Interface\\Icons\\ability_monk_jab",
        energyCost = 45,
        chiGain = 2,

        PerformCast = function(spell, env)
            env.energy.spent = env.energy.spent + spell.energyCost
            env.chi.gained = env.chi.gained + spell.chiGain
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (env.energy.curr >= spell.energyCost) end,
    },
    fists_of_fury = {
        abilityID = 113656,
        chiCost = 3,
        cooldownTime = 8,

        PerformCast = function(spell, env)
            env.chi.spent = env.chi.spent + spell.chiCost
            if env.serenity.talent_selected and env.serenity.aura_remains > 0 then
                env.chi.gained = env.chi.gained + spell.chiCost
            end
        end,

        spell_cast_time = function(spell, env) return env.playerHasteMultiplier * 4.0 end,
        spell_can_cast = function(spell, env) return (spell.cooldown_remains == 0 and env.chi.curr >= spell.chiCost) end,
    },
    tiger_palm = {
        abilityID = 100787,
        chiCost = function(spell, env) return ((env.combo_breaker_tp.expirationTime == 0) and 1 or 0) end,

        PerformCast = function(spell, env)
            env.chi.spent = env.chi.spent + spell.chiCost
            env.tiger_power.expirationTime = env.currentTime + 20
            if env.serenity.talent_selected and env.serenity.aura_remains > 0 then
                env.chi.gained = env.chi.gained + spell.chiCost
            end
            env.combo_breaker_tp.expirationTime = 0
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (env.chi.curr >= spell.chiCost) end,
    },
    rising_sun_kick = {
        abilityID = 107428,
        auraID = 130320,
        auraUnit = 'target',
        auraMine = true,
        chiCost = 2,
        cooldownTime = 8,

        PerformCast = function(spell, env)
            env.chi.spent = env.chi.spent + spell.chiCost
            spell.expirationTime = env.currentTime + 15
            if env.serenity.talent_selected and env.serenity.aura_remains > 0 then
                env.chi.gained = env.chi.gained + spell.chiCost
            end
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (spell.cooldown_remains == 0 and env.chi.curr >= spell.chiCost) end,
    },
    blackout_kick = {
        abilityID = 100784,
        chiCost = function(spell, env) return ((env.combo_breaker_bok.expirationTime > 0) and 0 or 2) end,

        PerformCast = function(spell, env)
            env.chi.spent = env.chi.spent + spell.chiCost
            if env.serenity.talent_selected and env.serenity.aura_remains > 0 then
                env.chi.gained = env.chi.gained + spell.chiCost
            end
            env.combo_breaker_bok.expirationTime = 0
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (not env.chi_explosion.talent_selected and env.chi.curr >= spell.chiCost) end,
    },
    energizing_brew = {
        abilityID = 115288,
        cooldownTime = 60,

        PerformCast = function(spell, env)
            -- NOT YET MODELED! (regen)
        end,

        spell_cast_time = 0,
        spell_can_cast = function(spell, env) return (spell.cooldown_remains == 0) end,
    },
    tigereye_brew = {
        abilityID = 116740,
        auraID = 125195,
        auraUnit = 'player',
        auraMine = true,
        applyAuraSpell = "tigereye_brew_use",
        applyAuraLength = 15,
        cooldownTime = 5,

        PerformCast = function(spell, env)
            local used = (spell.aura_stack > 10) and 10 or spell.aura_stack
            spell.aura_stack = spell.aura_stack - used
            env.tigereye_brew_use.expirationTime = env.currentTime + 15
        end,

        spell_cast_time = 0,
        spell_can_cast = function(spell, env) return (spell.aura_stack > 0 and spell.cooldown_remains == 0) and true or false end,
    },
    tigereye_brew_use = {
        auraID = 116740,
        auraUnit = 'player',
        auraMine = true,
    },
    combo_breaker_tp = {
        auraID = 118864,
        auraUnit = 'player',
        auraMine = true,
    },
    combo_breaker_bok = {
        auraID = 116768,
        auraUnit = 'player',
        auraMine = true,
    },
    combo_breaker_ce = {
        auraID = 159407,
        auraUnit = 'player',
        auraMine = true,
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Brewmaster-specific abilties
------------------------------------------------------------------------------------------------------------------------
local monk_brewmaster_abilities = private:LogMissingAccess("monk_brewmaster_abilities",{
    jab = {
        abilityID = 115698,
        icon = "Interface\\Icons\\ability_monk_jab",
        energyCost = 40,
        chiGain = 1,

        PerformCast = function(spell, env)
            env.energy.spent = env.energy.spent + spell.energyCost
            env.chi.gained = env.chi.gained + spell.chiGain
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (env.energy.curr >= spell.energyCost) end,
    },
    tiger_palm = {
        abilityID = 100787,

        PerformCast = function(spell, env)
            env.tiger_power.expirationTime = env.currentTime + 20
        end,

        spell_cast_time = 1,
        spell_can_cast = true,
    },
    blackout_kick = {
        abilityID = 100784,
        chiCost = 2,

        PerformCast = function(spell, env)
            env.chi.spent = env.chi.spent + spell.chiCost
            if env.serenity.talent_selected and env.serenity.aura_remains > 0 then
                env.chi.gained = env.chi.gained + spell.chiCost
            end
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (not env.chi_explosion.talent_selected and env.chi.curr >= spell.chiCost) end,
    },
    keg_smash = {
        abilityID = 121253,
        energyCost = 40,
        chiGain = 2,
        cooldownTime = 8,

        PerformCast = function(spell, env)
            env.energy.spent = env.energy.spent + spell.energyCost
            env.chi.gained = env.chi.gained + spell.chiGain
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (env.energy.curr >= spell.energyCost and spell.cooldown_remains == 0) end,
    },
    breath_of_fire = {
        abilityID = 115181,
        auraID = 123725,
        auraUnit = 'target',
        auraMine = true,
        chiCost = 2,

        PerformCast = function(spell, env)
            env.chi.spent = env.chi.spent + spell.chiCost
            spell.expirationTime = env.currentTime + 8
            if env.serenity.talent_selected and env.serenity.aura_remains > 0 then
                env.chi.gained = env.chi.gained + spell.chiCost
            end
        end,

        spell_cast_time = 1,
        spell_can_cast = function(spell, env) return (env.chi.curr >= spell.chiCost) end,
    },
    shuffle = {
        auraID = 115307,
        auraUnit = 'player',
        auraMine = true,
    },
    elusive_brew = {
        abilityID = 115308,
        auraID = 128939,
        auraUnit = 'player',
        auraMine = true,
        cooldownTime = 6,

        PerformCast = function(spell, env)
            env.elusive_brew_activated.expirationTime = env.currentTime + spell.aura_stack
            spell.aura_stack = 0
        end,

        spell_cast_time = 0,
        spell_can_cast = function(spell, env) return (spell.aura_stack > 0 and spell.cooldown_remains == 0) and true or false end,
    },
    elusive_brew_stacks = {
        auraID = 128939,
        auraUnit = 'player',
        auraMine = true,
    },
    elusive_brew_activated = {
        auraID = 115308,
        auraUnit = 'player',
        auraMine = true,
    },
    stagger = {
        any = function(spell, env) return spell.light or spell.moderate or spell.heavy or false end,
        light = function(spell, env) return (env.stagger_light.aura_remains > 0) and true or false end,
        moderate = function(spell, env) return (env.stagger_moderate.aura_remains > 0) and true or false end,
        heavy = function(spell, env) return (env.stagger_heavy.aura_remains > 0) and true or false end,
    },
    stagger_light = {
        auraID = 124275,
        auraUnit = 'player',
        auraMine = true,
    },
    stagger_moderate = {
        auraID = 124274,
        auraUnit = 'player',
        auraMine = true,
    },
    stagger_heavy = {
        auraID = 124273,
        auraUnit = 'player',
        auraMine = true,
    },
    purifying_brew = {
        abilityID = 119582,
        chiCost = 1,

        PerformCast = function(spell, env)
            env.chi.spent = env.chi.spent + spell.chiCost
            if env.serenity.talent_selected and env.serenity.aura_remains > 0 then
                env.chi.gained = env.chi.gained + spell.chiCost
            end
            env.stagger_light.expirationTime = 0
            env.stagger_moderate.expirationTime = 0
            env.stagger_heavy.expirationTime = 0
        end,

        spell_cast_time = 0,
        spell_can_cast = function(spell, env) return (env.chi.curr >= spell.chiCost) and (env.stagger.any == true) end,
    },
    dizzying_haze = {
        auraID = 116330,
        auraUnit = 'target',
        auraMine = true,
    },
    guard = {
        abilityID = 115295,
        auraID = 115295,
        auraUnit = 'player',
        auraMine = true,
        rechargeTime = 30,
        chiCost = 2,

        PerformCast = function(spell, env)
            env.chi.spent = env.chi.spent + spell.chiCost
            if env.serenity.talent_selected and env.serenity.aura_remains > 0 then
                env.chi.gained = env.chi.gained + spell.chiCost
            end
            spell.expirationTime = env.currentTime + 30
            spell.rechargeSpent = spell.rechargeSpent + 1
        end,

        spell_cast_time = 0,
        spell_can_cast = function(spell, env) return (spell.aura_remains == 0 and spell.spell_charges > 0 and env.chi.curr >= spell.chiCost) end,
    },
})

------------------------------------------------------------------------------------------------------------------------
-- Windwalker profile definition
------------------------------------------------------------------------------------------------------------------------
private:RegisterProfile("Windwalker", 10, 3, private:MergeTables(monk_functions, monk_event_handlers, monk_power, monk_talents, monk_common_abilities, monk_windwalker_abilities, {
    gcdAbility = 115698, -- Jab
    blacklistedActions = {
        "storm_earth_and_fire",
        "chi_sphere",
        "gift_of_the_ox",
    },
    actionList = private.apls["master::Tier17H::Monk_Windwalker_1h_T17H"],
}))

------------------------------------------------------------------------------------------------------------------------
-- Brewmaster profile definition
------------------------------------------------------------------------------------------------------------------------
private:RegisterProfile("Brewmaster", 10, 1, private:MergeTables(monk_functions, monk_event_handlers, monk_power, monk_talents, monk_common_abilities, monk_brewmaster_abilities, {
    gcdAbility = 115698, -- Jab
    blacklistedActions = {
        "chi_sphere",
        "gift_of_the_ox",
    },
    actionList = private.apls["master::Tier17H::Monk_Brewmaster_2h_CE_T17H"],
}))