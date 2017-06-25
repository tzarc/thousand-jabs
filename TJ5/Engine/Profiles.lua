local addonName = ...

local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local UnitClass = UnitClass
local select = select

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

local function expressionPrimaryModifier(keyword, profileSubstitutions)
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
    keyword = keyword:gsub('^incoming_damage_([%d]+)s', function(a) return Core:Format('incoming_damage_over_%d', tonumber(a)*1000) end)
    keyword = keyword:gsub('^incoming_damage_([%d]+)ms', function(a) return Core:Format('incoming_damage_over_%d', tonumber(a)) end)

    -- Convert XXXXX.YYYYY.ZZZZZ -> YYYYY.XXXXX_ZZZZZ (talent.blah.enabled -> blah.talent_enabled)
    keyword = keyword:gsub('([%a_]+)%.([%a_]+)%.([%a_%.]+)', function(a,b,c) return Core:Format("%s.%s_%s", b, a, c:gsub("%.","_")) end)

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

local function profilePrototype_Activate(self)
end

local function profilePrototype_Deactivate(self)
end

function Engine:RegisterPlayerClass(config)
    -- config expects the following fields:
    ---- config.classID              | int, class ID from select(3, UnitClass('player'))
    ---- config.specID               | int, spec ID from GetSpecialization()
    ---- config.defaultActionProfile | string, maps to the name of the registered action profile list
    ---- config.resources            | array of strings, resource types to make available during execution

    -- config has the following optional fields:
    ---- config.blacklisted          | array of strings, actions to ignore whenever executing APL
    ---- config.settings             | key/value pairs, (key = name of setting entry), (value = true/false [checkbox]), or value = { default, minimum, maximum, step } [slider])
    ---- config.remap                | key/value pairs, (key = name of APL action name), (value = TJ-defined action name) -- when APLs use different terminology for the same thing

    local profile = {
        -- Functions
        Activate = profilePrototype_Activate,
        Deactivate = profilePrototype_Deactivate,
        -- Fields
        classID = config.classID,
        specID = config.specID,
        defaultActionProfile = config.defaultActionProfile,
    }

    Engine.allProfiles = Engine.allProfiles or {}
    Engine.allProfiles[config.classID] = Engine.allProfiles[config.classID] or {}
    Engine.allProfiles[config.classID][config.specID] = profile
end

----------------------------
-- Dummy
local frostMageConfig = {
    classID = 8,
    specID = 3,
    defaultActionProfile = 'simc::mage::frost',
    resources = { 'mana' },
}
Engine:RegisterPlayerClass(frostMageConfig)
