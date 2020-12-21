--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Shadowlands only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and (select(4, GetBuildInfo()) < 90000 or select(4, GetBuildInfo()) >= 100000) then return end

------------------------------------------------------------------------------------------------------------------------
local LibStub = LibStub
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

local LSD = LibStub('LibSerpentDump')
local SpellData = LibStub('LibSpellData')

local ct = function() return TableCache:Acquire() end
local rt = function(tbl) TableCache:Release(tbl) end

local BOOKTYPE_PET = BOOKTYPE_PET
local BOOKTYPE_SPELL = BOOKTYPE_SPELL
local GetSpecialization = GetSpecialization
local GetSpellInfo = GetSpellInfo
local GetSpellLevelLearned = GetSpellLevelLearned
local GetTalentInfoByID = GetTalentInfoByID
local IsSpellInRange = IsSpellInRange
local mfloor = math.floor
local mmax = math.max
local mmin = math.min
local pairs = pairs
local rawget = rawget
local select = select
local tonumber = tonumber
local tsort = table.sort
local type = type
local UnitClass = UnitClass
local UnitSpellHaste = UnitSpellHaste
local unpack = unpack
local wipe = wipe

Core:Safety()

local function expressionPrimaryModifier(keyword, profileSubstitutionsPre, profileSubstitutionsPost)
    if keyword:match('^([%d%.]+)$') then return keyword end

    local before = keyword

    -- Handle any profile-specific substitutions
    if profileSubstitutionsPre then
        for _,e in pairs(profileSubstitutionsPre) do
            keyword = keyword:gsub(e[1], e[2])
        end
    end

    -- Selectors starting with a digit...
    keyword = keyword:gsub('([^%d])%.([%d]+)$', '%1[%2]') -- any trailing digit selectors with no following field (i.e.  something.1) we change to array indexing
    keyword = keyword:gsub('([^%d])%.([%d]+)%.', '%1[%2].') -- any trailing digit selectors with following field (i.e.  something.1.field) we change to array indexing
    keyword = keyword:gsub('([^%d])%.(%d.+)', '%1[\"%2\"]') -- any digit selectors starting with a digit but having trailing text (i.e.  something.111name) we change to string indexing

    -- Min/max modifiers (function calls)
    keyword = keyword:gsub("math%.abs", "_mabs")
    keyword = keyword:gsub("math%.ceil", "_mceil")
    keyword = keyword:gsub("math%.floor", "_mfloor")
    keyword = keyword:gsub("math%.min", "_mmin")
    keyword = keyword:gsub("math%.max", "_mmax")

    -- Min/max modifiers (effectively ignored, resolves to true)
    keyword = keyword:gsub("^min:([%w_%.]+)", "true")
    keyword = keyword:gsub("^max:([%w_%.]+)", "true")

    -- Casting checks
    if keyword == "debuff.casting.up" then keyword = "target.is_casting" end
    if keyword == "debuff.casting.down" then keyword = "(not target.is_casting)" end
    if keyword == "target.debuff.casting.up" then keyword = "target.is_casting" end
    if keyword == "target.debuff.casting.react" then keyword = "target.is_casting" end
    if keyword == "target.debuff.casting.down" then keyword = "(not target.is_casting)" end
    if keyword == "buff.casting.up" then keyword = "player.is_casting" end
    if keyword == "buff.casting.down" then keyword = "(not player.is_casting)" end

    -- GCD values
    if keyword == "gcd.max" then keyword = "gcd_max" end
    if keyword == "gcd.remains" then keyword = "gcd_remains" end

    -- Single-word conversions
    if keyword == "health" then keyword = "health.curr" end
    if keyword == "target" then keyword = "target.curr" end
    if keyword == "time_to_die" then keyword = "target.time_to_die" end
    if keyword == "refreshable" then keyword = "spell.THIS_SPELL.refreshable" end
    if keyword == "time" then keyword = "time_since_combat_start" end
    if keyword == "cooldown" then keyword = "cooldown.THIS_SPELL.remains" end
    if keyword == "cooldown_react" then keyword = "cooldown.THIS_SPELL.react" end
    if keyword == "duration" then keyword = "aura.THIS_SPELL.duration" end
    if keyword == "ticking" then keyword = "aura.THIS_SPELL.ticking" end
    if keyword == "delay" then keyword = "spell.THIS_SPELL.delay" end
    if keyword == "remains" then keyword = "aura.THIS_SPELL.remains" end
    if keyword == "cast_time" then keyword = "spell.THIS_SPELL.cast_time" end
    if keyword == "tick_time" then keyword = "spell.THIS_SPELL.tick_time" end
    if keyword == "charges" then keyword = "spell.THIS_SPELL.charges" end
    if keyword == "charges_fractional" then keyword = "spell.THIS_SPELL.charges_fractional" end
    if keyword == "max_charges" then keyword = "spell.THIS_SPELL.max_charges" end
    if keyword == "full_recharge_time" then keyword = "spell.THIS_SPELL.recharge_time" end -- TODO -- Check this?
    if keyword == "recharge_time" then keyword = "spell.THIS_SPELL.recharge_time" end
    if keyword == "execute_time" then keyword = "spell.THIS_SPELL.execute_time" end
    if keyword == "level" then keyword = "level.curr" end
    if keyword == "mana" then keyword = "mana.curr" end
    if keyword == "energy" then keyword = "energy.curr" end
    if keyword == "rage" then keyword = "rage.curr" end
    if keyword == "chi" then keyword = "chi.curr" end
    if keyword == "pain" then keyword = "pain.curr" end
    if keyword == "fury" then keyword = "fury.curr" end
    if keyword == "rune" then keyword = "rune.curr" end
    if keyword == "runic_power" then keyword = "runic_power.curr" end
    if keyword == "soul_fragments" then keyword = "soul_fragments.curr" end
    keyword = keyword:gsub("^soul_shard", "soul_shards")
    keyword = keyword:gsub("^soul_shardss", "soul_shards")
    if keyword == "soul_shards" then keyword = "soul_shards.curr" end
    if keyword == "maelstrom" then keyword = "maelstrom.curr" end
    if keyword == "holy_power" then keyword = "holy_power.curr" end

    -- Aura consolidation
    keyword = keyword:gsub("^target%.dot%.", "aura.")
    keyword = keyword:gsub("^target%.buff%.", "aura.")
    keyword = keyword:gsub("^target%.debuff%.", "aura.")
    keyword = keyword:gsub("^dot%.", "aura.")
    keyword = keyword:gsub("^debuff%.", "aura.")
    keyword = keyword:gsub("^buff%.", "aura." )

    -- Convert spell_targets.????? to just spell_targets
    keyword = keyword:gsub('^spell_targets%..*', 'spell_targets')

    -- Convert (action.blah.zzz) => (spell.blah.zzz)
    keyword = keyword:gsub('^action%.(.*)', 'spell.%1')

    -- Equipped items
    keyword = keyword:gsub('^equipped%.(%d+)', 'equipped[%1]')
    keyword = keyword:gsub('^equipped%.([%w_]+)', 'equipped["%1"]')

    -- Incoming damage
    keyword = keyword:gsub('^incoming_damage_([%d]+)s', function(a) return Core:Format('incoming_damage_over_%d', tonumber(a)*1000) end)
    keyword = keyword:gsub('^incoming_damage_([%d]+)ms', function(a) return Core:Format('incoming_damage_over_%d', tonumber(a)) end)

    -- Convert XXXXX.YYYYY.ZZZZZ -> YYYYY.XXXXX_ZZZZZ (talent.blah.enabled -> blah.talent_enabled)
    keyword = keyword:gsub('([%w_]+)%.([%w_]+)%.([%w_%.]+)', function(a,b,c) return Core:Format("%s.%s_%s", b, a, c:gsub("%.","_")) end)

    -- Percentage consolidation
    keyword = keyword:gsub("_pct$", "_percent")
    keyword = keyword:gsub("%.pct$", ".percent")

    -- Fixup time_to_die
    keyword = keyword:gsub("time_to_die.target_remains", "target.time_to_die")

    -- Pet stuff
    keyword = keyword:gsub('^([%w_]+)%.pet_([%w_]+)$', 'pet.%1_%2')

    -- Handle any profile-specific substitutions
    if profileSubstitutionsPost then
        for _,e in pairs(profileSubstitutionsPost) do
            keyword = keyword:gsub(e[1], e[2])
        end
    end

    return keyword
end

local function fixMathFuncs(expr)
    -- Min/max modifiers (function calls)
    expr = expr:gsub("math%.abs%(", "_mabs(")
    expr = expr:gsub("math%.ceil%(", "_mceil(")
    expr = expr:gsub("math%.floor%(", "_mfloor(")
    expr = expr:gsub("math%.min%(", "_mmin(")
    expr = expr:gsub("math%.max%(", "_mmax(")
    return expr
end

local function addActionTalentFields(action)
    -- Add the 'talent_enabled' entry if there are talent IDs present
    if type(action) == 'table' then
        if rawget(action, 'TalentID') then
            action.talent_enabled = function(spell, env)
                return select(10, GetTalentInfoByID(spell.TalentID)) and true or false
            end
        end
    end
end

local function addActionCooldownFields(action, fullCooldownSecs, isCooldownAffectedByHaste)
    if type(action) == 'table' then
        action.FullCooldownSecs = fullCooldownSecs
        action.IsCooldownAffectedByHaste = isCooldownAffectedByHaste
        if fullCooldownSecs and fullCooldownSecs > 0 then
            if isCooldownAffectedByHaste then
                action.CooldownTime = function(spell,env) return env.playerHasteMultiplier * fullCooldownSecs end
            else
                action.CooldownTime = fullCooldownSecs
            end

            action.spell_cooldown = function(spell, env) return spell.CooldownTime end
            action.cooldown_duration = action.spell_cooldown -- TBD?
            action.spell_recharge_time = function(spell, env) return spell.CooldownTime end

            action.spell_can_cast_funcsrc = action.spell_can_cast_funcsrc .. ' and (spell.cooldown_remains == 0)'
            action.perform_cast_funcsrc = action.perform_cast_funcsrc .. '; spell.cooldownStart = env.currentTime; spell.cooldownDuration = spell.CooldownTime'

            local cooldown_remains_override = rawget(action, 'cooldown_remains_override')
            action.cooldown_remains =
                (type(cooldown_remains_override) ~= 'nil' and cooldown_remains_override)
                or function(spell, env) return (spell.blacklisted and 999) or mmax(0, spell.cooldownStart + spell.cooldownDuration - env.currentTime) end
            action.cooldown_ready = function(spell, env) return (spell.cooldown_remains == 0) and true or false end
            action.cooldown_up = function(spell, env) return spell.cooldown_ready and true or false end
            action.cooldown_down = function(spell, env) return (not spell.cooldown_ready) and true or false end
            action.cooldown_react = function(spell, env) return spell.cooldown_ready and true or false end
            action.spell_charges = function(spell, env) return spell.cooldown_ready and 1 or 0 end
            action.cooldown_full_recharge_time = function(spell, env) return spell.cooldown_remains and 1 or 0 end
        end
    end
end

local function addActionChargesFields(action, fullRechargeSecs, isRechargeAffectedByHaste, usesSpellCountForCharges)
    if type(action) == 'table' then
        action.FullRechargeSecs = fullRechargeSecs
        action.IsRechargeAffectedByHaste = isRechargeAffectedByHaste
        action.UsesSpellCountForCharges = usesSpellCountForCharges
        if fullRechargeSecs and fullRechargeSecs > 0 then
            if isRechargeAffectedByHaste then
                action.RechargeTime = function(spell,env) return env.playerHasteMultiplier * fullRechargeSecs end
            else
                action.RechargeTime = fullRechargeSecs
            end

            action.spell_can_cast_funcsrc = action.spell_can_cast_funcsrc .. ' and (spell.spell_charges > 0)'
            action.perform_cast_funcsrc = action.perform_cast_funcsrc .. '; spell.rechargeSpent = spell.rechargeSpent + 1'

            if usesSpellCountForCharges then
                action.spell_max_charges = 999
                action.spell_charges_fractional = function(spell, env)
                    return (spell.blacklisted and 0) or (spell.rechargeSampled - spell.rechargeSpent + spell.rechargeGained)
                end
            else
                action.spell_max_charges = function(spell, env) return spell.rechargeMax end
                action.spell_charges_fractional = function(spell, env)
                    local f = (spell.rechargeSampled == spell.rechargeMax)
                        and spell.rechargeMax - spell.rechargeSpent + spell.rechargeGained
                        or spell.rechargeSampled + (env.currentTime - spell.rechargeStartTime)/spell.rechargeDuration - spell.rechargeSpent + spell.rechargeGained
                    return (spell.blacklisted and 0) or mmin(f, spell.rechargeMax)
                end
            end

            action.spell_charges = function(spell, env) return mfloor(spell.spell_charges_fractional+0.001) end

            action.spell_recharge_time = function(spell, env)
                local remains = (spell.blacklisted and 999) or (spell.rechargeStartTime + spell.rechargeDuration - env.currentTime)
                return (spell.spell_charges > 0) and 0 or remains
            end

            action.cooldown_full_recharge_time = function(spell, env)
                return mmax(0, (spell.spell_max_charges - spell.spell_charges_fractional)*spell.rechargeDuration)
            end

            local cooldown_remains_override = rawget(action, 'cooldown_remains_override')
            action.cooldown_remains =
                (type(cooldown_remains_override) ~= 'nil' and cooldown_remains_override)
                or function(spell,env) return mmax(0, spell.spell_recharge_time) end
            action.cooldown_ready = function(spell, env) return (spell.cooldown_remains == 0) and true or false end
            action.cooldown_up = function(spell, env) return spell.cooldown_ready and true or false end
            action.cooldown_down = function(spell, env) return (not spell.cooldown_ready) and true or false end
            action.cooldown_react = function(spell, env) return spell.cooldown_ready and true or false end
            action.cooldown_charges_fractional = function(spell, env) return spell.spell_charges_fractional end
            action.cooldown_charges = function(spell, env) return spell.spell_charges end
        end
    end
end

local function addActionAuraFields(action)
    if type(action) == 'table' then
        if rawget(action, 'AuraID') then
            action.aura_remains = rawget(action, 'aura_remains') or function(spell, env)
                return mmax(0, spell.expirationTime - env.currentTime)
            end
            action.aura_up = rawget(action, 'aura_up') or function(spell, env) return (spell.aura_remains > 0) and true or false end
            action.aura_down = rawget(action, 'aura_down') or function(spell, env) return (not spell.aura_up) and true or false end
            action.aura_ticking = rawget(action, 'aura_ticking') or function(spell, env) return spell.aura_up and true or false end
            action.aura_react = rawget(action, 'aura_react') or function(spell, env) return spell.aura_up and true or false end
            action.aura_stack = rawget(action, 'aura_stack') or function(spell, env) return spell.auraCount or 0 end

            action.spell_tick_time = rawget(action, 'spell_tick_time') or function(spell, env) return (spell.aura_up) and 1 or 0 end -- TBD
            action.aura_tick_time_remains = rawget(action, 'aura_tick_time_remains') or function(spell, env) return (spell.aura_up) and spell.spell_tick_time or 0 end -- TBD

            action.ticking = action.aura_ticking
        end
    end
end

local function addMissingFields(action)
    if type(action) == 'table' then
        if not rawget(action, 'last_cast') then action.time_since_last_cast = 0 end
        if not rawget(action, 'time_since_last_cast') then action.time_since_last_cast = 99999 end

        if not rawget(action, 'spell_cast_time') then
            action.spell_cast_time = function(spell, env) return TJ.currentGCD end
        end
        if not rawget(action, 'spell_execute_time') then -- TODO: Is this right?
            action.spell_execute_time = function(spell, env) return action.spell_cast_time(spell, env) end
        end

        if not rawget(action, 'talent_enabled') then action.talent_enabled = false end

        if not rawget(action, 'spell_recharge_time') then action.spell_recharge_time = 99999 end
        if not rawget(action, 'spell_cooldown') then action.spell_cooldown = 99999 end

        if not rawget(action, 'cooldown_remains') then
            local cooldown_remains_override = rawget(action, 'cooldown_remains_override')
            action.cooldown_remains =
                (type(cooldown_remains_override) ~= 'nil' and cooldown_remains_override)
                or 999999
        end
        if not rawget(action, 'cooldown_ready') then action.cooldown_ready = false end
        if not rawget(action, 'cooldown_up') then action.cooldown_up = false end
        if not rawget(action, 'cooldown_down') then action.cooldown_down = false end
        if not rawget(action, 'cooldown_react') then action.cooldown_react = false end
        if not rawget(action, 'cooldown_charges') then action.cooldown_charges = 0 end
        if not rawget(action, 'cooldown_charges_fractional') then action.cooldown_charges_fractional = 0 end

        if not rawget(action, 'spell_charges') then action.spell_charges = 0 end
        if not rawget(action, 'spell_charges_fractional') then action.spell_charges_fractional = 0 end
        if not rawget(action, 'spell_max_charges') then action.spell_max_charges = 0 end
        if not rawget(action, 'spell_recharge_time') then action.spell_recharge_time = 0 end

        if not rawget(action, 'aura_remains') then action.aura_remains = 0 end
        if not rawget(action, 'aura_up') then action.aura_up = false end
        if not rawget(action, 'aura_down') then action.aura_down = true end
        if not rawget(action, 'aura_ticking') then action.aura_ticking = false end
        if not rawget(action, 'aura_react') then action.aura_react = false end
        if not rawget(action, 'aura_stack') then action.aura_stack = 0 end

        if not rawget(action, 'OverlayTitle') then
            action.OverlayTitle = Config:GetSpecOverlay(action.ActionName) or ''
        end

        if rawget(action, 'OverallSpellID') then
            local overallSpellID = action.OverallSpellID
            if not rawget(action, 'Name') then action.Name = select(1, GetSpellInfo(overallSpellID)) end
            if not rawget(action, 'Icon') then action.Icon = select(3, GetSpellInfo(overallSpellID)) end
        end
    end
end

function TJ:RegisterPlayerClass(config)

    local config = config
    local blacklisted = {}

    -- Copy out the resources requested for this class
    local resources = {}
    for k,v in pairs(config.resources) do resources[v] = Core.Environment.resources[v] end

    -- Set up the profile table
    local profile = {
        defaultActionProfile = config.default_action_profile,
        name = config.name,
        config = config,
        blacklisted = blacklisted,
        configCheckboxes = config.config_checkboxes or {},
        spellIDactionMapping = {},
    }

    -- Add it to the list of profiles so we can get access to it when swapping specs
    self.profiles = self.profiles or {}
    self.profiles[config.class_id] = self.profiles[config.class_id] or {}
    self.profiles[config.class_id][config.spec_id] = profile

    -- Set up any event handlers specified by the profile
    if config.events then
        for k,v in pairs(config.events) do
            profile[k] = v
        end
    end

    function profile:ResetActions()
        if self.parsedActions then rt(self.parsedActions) end
        self.parsedActions = nil
    end

    function profile:LoadActions()
        if Core.devMode or not self.parsedActions then
            local converted = ct()
            -- Parse the action profile
            local function primaryModifier(str)
                if converted[str] then return converted[str] end
                local res = expressionPrimaryModifier(str, config.conditional_substitutions_pre, config.conditional_substitutions_post)
                converted[str] = res
                return res
            end

            -- Update the parsed actions
            if not self.parsedActions then
                local aplID = Config:GetSpecGeneric("aplID") or self.defaultActionProfile
                local aplDef = TJ.profileDefinitions[aplID] or TJ.profileDefinitions[self.defaultActionProfile]
                if aplDef.classID == config.class_id and aplDef.specID == config.spec_id then
                    if self.parsedActions then rt(self.parsedActions) end
                    self.parsedActions = Core:ExpressionParser(aplDef.aplData, primaryModifier)
                else
                    Core:Error(Core:Format("Mismatching class/spec IDs: APL expects %s/%s, character is %s/%s.", aplDef.classID, aplDef.specID, config.class_id, config.spec_id))
                    TJ:DeactivateProfile()
                    rt(converted)
                    return
                end
            end

            -- Create the condition functions for each action
            local counts = ct()
            for listName,listTable in pairs(self.parsedActions) do
                counts[listName] = counts[listName] or ct()
                -- Loop through each entry in each named action list
                for _,entry in pairs(listTable) do
                    counts[listName][entry.action] = (counts[listName][entry.action] or 0) + 1
                    entry.key = (entry.action == "run_action_list" or entry.action == "call_action_list")
                        and Core:Format("%s:%s[%s]", listName, entry.action, entry.params.name)
                        or Core:Format("%s:%s[%s]", listName, entry.action, counts[listName][entry.action])

                    -- Create a default prcondition, based on whether the spell is castable
                    entry.precondition = (entry.action == "run_action_list" or entry.action == "call_action_list")
                        and "true"
                        or Core:Format("%s.spell_can_cast", entry.action)
                    if type(entry.params.sync) ~= "nil" then
                        entry.precondition = Core:Format("(%s) and (%s.spell_can_cast or %s.cooldown_up or %s.aura_remains > 0)", entry.precondition, entry.params.sync, entry.params.sync, entry.params.sync)
                    end

                    -- Create the condition function
                    if type(entry.condition_func) == "nil" then
                        if type(entry.params.condition_converted) ~= "nil" or type(entry.params.target_if_converted) ~= "nil" then
                            local cond_if = entry.params.condition_converted and entry.params.condition_converted.expression
                            local cond_target_if = entry.params.target_if_converted and entry.params.target_if_converted.expression
                            local cond = (cond_if and cond_target_if and Core:Format("((%s) and (%s))", cond_if, cond_target_if))
                                or cond_if
                                or cond_target_if
                                or 'false'
                            entry.fullconditionfuncsrc = Core:Format("((%s) and (%s))", entry.precondition, cond:gsub('THIS_SPELL', entry.action))
                        else
                            entry.fullconditionfuncsrc = entry.precondition
                        end
                        entry.condition_func = Core:LoadFunctionString(Core:Format("function() return ((%s) and true or false) end", fixMathFuncs(entry.fullconditionfuncsrc)), Core:Format("cond:%s", entry.key))
                    end

                    -- Create the variable result function
                    if type(entry.value_func) == "nil" and type(entry.params.value_converted) ~= "nil" then
                        entry.fullvaluefuncsrc = entry.params.value_converted.expression
                        entry.value_func = Core:LoadFunctionString(Core:Format("function() return (%s) end", fixMathFuncs(entry.fullvaluefuncsrc)), Core:Format("var:%s", entry.key))
                    end
                end
            end
            rt(counts)
            rt(converted)
        end
    end

    function profile:FindActionForSpellID(spellID)
        if self.spellIDactionMapping[spellID] then return self.spellIDactionMapping[spellID] end
        for k,v in pairs(profile.actions) do
            local spellIDs = rawget(v, 'SpellIDs')
            if spellIDs then
                for k2,v2 in pairs(spellIDs) do
                    if v2 == spellID then
                        self.spellIDactionMapping[spellID] = k
                        return k
                    end
                end
            end
        end
    end

    function profile:Activate()
        Core:DevPrint("Activating profile: %s", profile.name)

        -- Construct the total actions table, including resources and base actions
        profile.actions = Core:MergeTables(Core.Environment.common, resources, unpack(config.actions))
        local actions = profile.actions

        -- Load the actions table
        self:LoadActions()

        -- Merge the detected abilities from spellbook and the supplied ones from the class configuration
        profile.guessed = TJ:DetectAbilitiesFromSpellBook()
        local guessed = profile.guessed

        -- Loop through each of the guessed abilities, and attempt to match up the AbilityID or the TalentID
        for k1,v1 in pairs(guessed) do
            for k2,v2 in pairs(actions) do
                local match = false
                -- Match against ability
                local a1, a2 = v1.SpellIDs, rawget(v2, 'SpellIDs')
                if a1 and a2 then
                    for k3,v3 in pairs(a1) do
                        for k4,v4 in pairs(a2) do
                            if v3 == v4 then
                                match = true
                            end
                        end
                    end
                end
                -- Match against talents
                a1, a2 = v1.TalentID, rawget(v2, 'TalentID')
                if type(a1) == 'number' and type(a2) == 'number' and a1 == a2 then
                    match = true
                end
                -- We got a match, merge the tables
                if match then
                    actions[k2] = Core:MergeTables(v2, v1)
                    actions[k2].in_spellbook = v1.SpellBookSpellID and true or false
                    actions[k2].AbilityID = v1.SpellBookSpellID or nil
                end
            end
        end

        -- Set up the hooks table so that we don't log errors if they're not present in the profile
        if not actions.hooks then actions.hooks = {} end

        -- Show errors if we're missing anything...
        actions = Core:MissingFieldTable(profile.name, actions)

        -- Construct the blacklisted
        wipe(blacklisted)
        for k,v in pairs(Core.Environment.globalBlacklist) do
            blacklisted[1+#blacklisted] = v
        end
        if config.blacklisted then
            for k,v in pairs(config.blacklisted) do
                blacklisted[1+#blacklisted] = v
            end
        end

        -- We need to work out the non-hasted cast times, GetSpellBaseCooldown is iffy for some reason. Do it ourselves.
        local playerHasteMultiplier = ( 100 / ( 100 + UnitSpellHaste('player') ) )

        -- Update each of the actions with any detected/generated data
        for k,v in pairs(actions) do
            v.ActionName = k

            local spellIDs = rawget(v, 'SpellIDs')
            local auraIDs = rawget(v, 'AuraID')
            local talentID = rawget(v, 'TalentID')
            v.OverallSpellID = spellIDs and (type(spellIDs) == "table" and rawget(spellIDs, 1) or spellIDs)
                or auraIDs and (type(auraIDs) == "table" and rawget(auraIDs, 1) or auraIDs)
                or talentID and select(6, GetTalentInfoByID(talentID))

            addActionTalentFields(v)

            -- If there's no ability ID, then we can't cast it.
            if type(v) == 'table' and not rawget(v, 'AbilityID') then
                v.spell_can_cast = false
                v.in_range = rawget(v, 'in_range') or false
                v.cooldown_remains = rawget(v, 'cooldown_remains_override') or rawget(v, 'cooldown_remains') or 99999
            end

            -- Determine the ability-specific information, if we can cast the current action
            if type(v) == 'table' and rawget(v, 'AbilityID') then

                -- If we have an AbilityID specified, but in_spellbook isn't set, then make sure it's set to false (i.e. it's defined in the profile, but it's not in the current spellbook)
                if not rawget(v, 'in_spellbook') then
                    v.in_spellbook = false
                end

                -- Set up a function to check if the ability is in range
                if rawget(v, 'SpellBookItem') then
                    v.in_range = function(spell,env)
                        if not v.in_spellbook then return false end
                        local r = IsSpellInRange(spell.SpellBookItem, spell.SpellBookCaster == "pet" and BOOKTYPE_PET or BOOKTYPE_SPELL, 'target')
                        r = (not r or r ~= 1) and true or false
                        return (not r)
                    end
                end

                -- Set up function for last cast time
                v.last_cast = function(spell, env)
                    local latest = 0
                    if rawget(v, 'SpellIDs') then
                        for _,spellID in pairs(v.SpellIDs) do
                            local cast = env.lastCastTimes[spellID]
                            if cast and cast > latest then latest = cast end
                        end
                    end
                    return latest
                end
                v.time_since_last_cast = function(spell, env)
                    return env.currentTime - spell.last_cast
                end

                -- Set up a function to check to see if an ability is blacklisted
                v.blacklisted = function(spell, env)
                    return Config:GetSpecBlacklist(k) and true or false
                end

                -- Start constructing the spell_can_cast() and perform_cast() functions
                v.spell_can_cast_funcsrc = Core:Format('(not spell.blacklisted) and (env.player_level >= %d) and (spell.in_spellbook)', GetSpellLevelLearned(v.AbilityID))
                v.perform_cast_funcsrc = ''

                -- Work out the cast time based off the spell info, or the GCD
                local castTime = select(4, GetSpellInfo(v.AbilityID))
                if castTime and castTime > 0 then
                    v.base_cast_time = function(spell, env)
                        return select(4, GetSpellInfo(v.AbilityID)) / 1000.0
                    end
                else
                    v.base_cast_time = function(spell, env)
                        local gcd = TJ.currentGCD * env.playerHasteMultiplier
                        return (gcd > 1) and gcd or 1
                    end
                end
                if not rawget(v, 'spell_cast_time') then
                    v.spell_cast_time = function(spell, env)
                        return spell.base_cast_time
                    end
                end

                -- Get the resource cost
                local costType, costBase, costPerTime, cost3 = SpellData.GetSpellCost(v.AbilityID)

                -- If this action has an associated cost, add the correct value to the table and update the functions accordingly
                costType = costType or rawget(v, 'cost_type')
                if costType then
                    if not rawget(v, costType..'_cost') then
                        v[costType..'_cost'] = costBase
                    end
                    v.spell_can_cast_funcsrc = v.spell_can_cast_funcsrc .. Core:Format(' and (env.%s.can_spend(env.%s, env, \'%s\', \'%s\', spell.%s_cost))', costType, costType, k, costType, costType)
                    v.perform_cast_funcsrc = v.perform_cast_funcsrc .. Core:Format('; env.%s.perform_spend(env.%s, env, \'%s\', \'%s\', spell.%s_cost)', costType, costType, k, costType, costType)
                end

                -- Add any fields required for cooldowns
                local cooldownSecs, isCooldownAffectedByHaste = SpellData.GetSpellCooldown(v.AbilityID)
                v.cooldown_tt_secs = type(cooldownSecs) ~= 'nil' and cooldownSecs or 'nil'
                local fullCooldownSecs = (isCooldownAffectedByHaste or false) and cooldownSecs/playerHasteMultiplier or cooldownSecs or 0
                addActionCooldownFields(v, fullCooldownSecs, isCooldownAffectedByHaste)

                -- Get the recharge time
                local rechargeSecs, isRechargeAffectedByHaste = SpellData.GetSpellRechargeTime(v.AbilityID)
                v.recharge_tt_secs = type(rechargeSecs) ~= 'nil' and rechargeSecs or 'nil'
                local fullRechargeSecs = (isRechargeAffectedByHaste or false) and rechargeSecs/playerHasteMultiplier or rechargeSecs or 0
                -- Check if this has charges that use GetSpellCount()
                local usesSpellCountForCharges = rawget(v, 'ChargesUseSpellCount') and true or false
                if usesSpellCountForCharges then
                    fullRechargeSecs = 999
                    isRechargeAffectedByHaste = false
                end
                addActionChargesFields(v, fullRechargeSecs, isRechargeAffectedByHaste, usesSpellCountForCharges)

                -- Update the spell_can_cast function if talents are specified
                if rawget(v, 'TalentID') then
                    v.spell_can_cast_funcsrc = v.spell_can_cast_funcsrc .. ' and (spell.talent_enabled)'
                end

                -- Update the spell_can_cast function if there's a spell-specific function in the supplied table
                if rawget(v, 'CanCast') then
                    v.spell_can_cast_funcsrc = v.spell_can_cast_funcsrc .. ' and (spell.CanCast)'
                end

                -- Update the perform_cast function if an aura is supposed to be applied
                if rawget(v, 'AuraApplied') then
                    v.perform_cast_funcsrc = v.perform_cast_funcsrc .. Core:Format('; env.%s.expirationTime = env.currentTime + %d', v.AuraApplied, v.AuraApplyLength)
                end

                -- Update the perform_cast function if there's a spell-specific function in the supplied table
                if rawget(v, 'PerformCast') then
                    v.perform_cast_funcsrc = v.perform_cast_funcsrc .. '; local r = spell.PerformCast'
                end

                -- Load the spell_can_cast function
                v.spell_can_cast_funcsrc = Core:Format('function(spell, env) return ((%s) and true or false) end', v.spell_can_cast_funcsrc:gsub('^ and ', ''))
                v.spell_can_cast = Core:LoadFunctionString(fixMathFuncs(v.spell_can_cast_funcsrc), k..':spell_can_cast')

                -- Load the perform_cast function
                v.perform_cast_funcsrc = Core:Format('function(spell, env) %s end', v.perform_cast_funcsrc:gsub('^; ', ''))
                v.perform_cast = Core:LoadFunctionString(fixMathFuncs(v.perform_cast_funcsrc), k..':perform_cast')
            end

            -- Add aura-specific functions
            addActionAuraFields(v)

            -- Deal with anything missing
            addMissingFields(v)

        end

        -- Update the mapping from the detected actions from spellbook to match what simc APLs expect
        if config.simc_mapping then
            for k,v in pairs(config.simc_mapping) do
                if rawget(actions, v) then
                    actions[k] = actions[v]
                end
            end
        end
    end

    function profile:Deactivate()
    end

    -- If someone decides to load-on-demand their class module, then queue up a full profile reload.
    TJ:QueueProfileReload()
end

function TJ:RegisterActionProfileList(aplID, aplName, classID, specID, aplData)
    TJ.profileDefinitions[aplID] = {
        classID = classID,
        specID = specID,
        aplName = aplName,
        aplData = aplData
    }

    TJ.availableProfiles[classID] = TJ.availableProfiles[classID] or {}
    TJ.availableProfiles[classID][specID] = TJ.availableProfiles[classID][specID] or {}
    local t = TJ.availableProfiles[classID][specID]
    t[1+#t] = aplID
    tsort(t)
end

function TJ:GetAvailableProfilesForSpec(classID, specID)
    local classID = classID or select(3, UnitClass('player'))
    local specID = specID or GetSpecialization()
    local available = TJ.availableProfiles and TJ.availableProfiles[classID] and TJ.availableProfiles[classID][specID] or {}

    local defaultProfile = self.profiles
        and self.profiles[classID]
        and self.profiles[classID][specID]
        and self.profiles[classID][specID].defaultActionProfile

    return available, defaultProfile
end
