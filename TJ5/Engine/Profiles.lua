local tsort = table.sort
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local UnitClass = UnitClass
local select = select
local pairs = pairs

LibStub('LibSandbox-5.0'):UseSandbox('TJ5')

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Keyword modification
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function expressionPrimaryModifier(keyword, profile)
    local profileSubstitutions = profile.Data.ProfileSubstitutions
    if keyword:match('^([%d%.]+)$') then return keyword end

    local before = keyword

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

    -- Min/max modifiers (ignored)
    keyword = keyword:gsub("^min:", "")
    keyword = keyword:gsub("^max:", "")

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
    keyword = keyword:gsub('^equipped%.([%a_]+)', 'equipped["%1"]')

    -- Incoming damage
    keyword = keyword:gsub('^incoming_damage_([%d]+)s', function(a) return ('incoming_damage_over_%d'):format(tonumber(a)*1000) end)
    keyword = keyword:gsub('^incoming_damage_([%d]+)ms', function(a) return ('incoming_damage_over_%d'):format(tonumber(a)) end)

    -- Convert XXXXX.YYYYY.ZZZZZ -> YYYYY.XXXXX_ZZZZZ (talent.blah.enabled -> blah.talent_enabled)
    keyword = keyword:gsub('([%a_]+)%.([%a_]+)%.([%a_%.]+)', function(a,b,c) return ("%s.%s_%s"):format(b, a, c:gsub("%.","_")) end)

    -- Percentage consolidation
    keyword = keyword:gsub("_pct$", "_percent")
    keyword = keyword:gsub("%.pct$", ".percent")

    -- Fixup time_to_die
    keyword = keyword:gsub("time_to_die.target_remains", "target.time_to_die")

    -- Pet stuff
    keyword = keyword:gsub('^([%a_]+)%.pet_([%a_]+)$', 'pet.%1_%2')

    -- Handle any profile-specific substitutions
    if profileSubstitutions then
        for _,e in pairs(profileSubstitutions) do
            keyword = keyword:gsub(e[1], e[2])
        end
    end

    return keyword
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Profile object functions
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function profilePrototype_Activate(self)
    self.State = self.State or Engine:CreateState(self.Data.Actions)
    self.State:UpdateDisplayName()
    self.State:Reset()

    if not self.Data.ParsedActions then
        self:ParseActions()
    end
end

local function profilePrototype_Deactivate(self)
    self.State:Reset()
    self:ResetParsedActions()
end

local function profilePrototype_AddActions(self, actions)
    self.Data = self.Data or {}
    self.Data.Actions = self.Data.Actions or {}

    for action,data in pairs(actions) do
        self.Data.Actions[data:Name()] = data
    end
end

local function profilePrototype_ParseActions(self, aplID)
    self:ResetParsedActions()
    self.Data = self.Data or {}

    -- If unspecified, use the default
    if not aplID then aplID = self.DefaultActionProfile end

    -- Get and validate the APL we're trying to use
    local aplDefinition = Engine.Data.ActionListDefinitions[aplID]
    if not aplDefinition or aplDefinition.ClassID ~= self.ClassID or aplDefinition.SpecID ~= self.SpecID then
        error('Invalid APL.')
    end

    -- Run the expression parser over the APLs
    self.Data.ParsedActions = Engine:ExpressionParser(aplDefinition.AplData, expressionPrimaryModifier, self)
end

local function profilePrototype_ResetParsedActions(self)
    if self.Data and self.Data.ParsedActions then
        local t = self.Data.ParsedActions
        self.Data.ParsedActions = nil
        RT(t)
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Class Registration
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Engine:RegisterClassProfile(config)
    -- config expects the following fields:
    ---- config.Name                 | string, name for the profile
    ---- config.ClassID              | int, class ID from select(3, UnitClass('player'))
    ---- config.SpecID               | int, spec ID from GetSpecialization()
    ---- config.DefaultActionProfile | string, maps to the name of the registered action profile list

    -- config has the following optional fields:
    ---- config.Blacklisted          | array of strings, actions to ignore whenever executing APL
    ---- config.Settings             | key/value pairs, (key = name of setting entry), (value = true/false [checkbox]), or value = { default, minimum, maximum, step } [slider])
    ---- config.Remap                | key/value pairs, (key = name of APL action name), (value = TJ-defined action name) -- when APLs use different terminology for the same thing

    local profile = Engine:CreateDefaultsTable(config.Name, {
        -- Fields
        ClassID = config.ClassID,
        SpecID = config.SpecID,
        DefaultActionProfile = config.DefaultActionProfile,
    })
    profile:SetFunction('Activate', profilePrototype_Activate)
    profile:SetFunction('Deactivate', profilePrototype_Deactivate)
    profile:SetFunction('AddActions', profilePrototype_AddActions)
    profile:SetFunction('ParseActions', profilePrototype_ParseActions)
    profile:SetFunction('ResetParsedActions', profilePrototype_ResetParsedActions)

    self.Data = self.Data or {}
    self.Data.AllProfiles = self.Data.AllProfiles or {}
    self.Data.AllProfiles[config.ClassID] = self.Data.AllProfiles[config.ClassID] or {}
    self.Data.AllProfiles[config.ClassID][config.SpecID] = profile

    return profile
end

function Engine:GetProfileForCurrentSpec()
    local classID = select(3, UnitClass('player'))
    local specID = GetSpecialization()
    return self.Data.AllProfiles and self.Data.AllProfiles[classID] and self.Data.AllProfiles[classID][specID]
end

function Engine:ActivateProfile()
    self:DeactivateProfile()

    local profile = self:GetProfileForCurrentSpec()
    if profile then
        self.Runtime = self.Runtime or {}
        self.Runtime.ActiveProfile = profile
        profile:Activate()
        Engine:Notify('ProfileActivated', profile.ClassID, profile.SpecID)
    end
end

function Engine:DeactivateProfile()
    local profile = self.Runtime and self.Runtime.ActiveProfile
    if profile then
        profile:Deactivate()
        self.Runtime.ActiveProfile = nil
        Engine:Notify('ProfileDeactivated', profile.ClassID, profile.SpecID)
    end
end

function Engine:RegisterActionList(aplID, aplName, classID, specID, aplData)
    self.Data = self.Data or {}
    self.Data.ActionListDefinitions = self.Data.ActionListDefinitions or {}
    self.Data.ActionListDefinitions[aplID] = {
        AplName = aplName,
        ClassID = classID,
        SpecID = specID,
        AplData = aplData
    }

    self.Data.AvailableActionLists = self.Data.AvailableActionLists or {}
    self.Data.AvailableActionLists[classID] = self.Data.AvailableActionLists[classID] or {}
    self.Data.AvailableActionLists[classID][specID] = self.Data.AvailableActionLists[classID][specID] or {}
    local t = self.Data.AvailableActionLists[classID][specID]
    t[1+#t] = aplID
    tsort(t)
end

local dummy = {}
function Engine:GetAvailableActionListsForSpec(classID, specID)
    local classID = classID or select(3, UnitClass('player'))
    local specID = specID or GetSpecialization()
    local available = self.Data
        and self.Data.AvailableActionLists
        and self.Data.AvailableActionLists[classID]
        and self.Data.AvailableActionLists[classID][specID]
        or wipe(dummy)

    local defaultProfile = self.Data
        and self.Data.AllProfiles
        and self.Data.AllProfiles[classID]
        and self.Data.AllProfiles[classID][specID]
        and self.Data.AllProfiles[classID][specID].DefaultActionProfile

    return available, defaultProfile
end
