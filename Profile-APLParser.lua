local _, internal, Z, DBG, fmt
local IsLoadedByWoW = GetSpellInfo and true or false
if IsLoadedByWoW then
    _, internal = ...;
    Z = internal.Z
    DBG = internal.DBG
    fmt = internal.fmt
end

------------------------------------------------------------------------------------------------------------------------
-- Stuff only applicable if not running under WoW
------------------------------------------------------------------------------------------------------------------------

if not IsLoadedByWoW then
    dump_table = loadfile([[Libs//LibPrtrDump-1.0.lua]])()
    print_table = function(tbl) print(dump_table(tbl)) end

    function fmt(f, ...)
        return ((select('#', ...) > 0) and string.format(f, ...) or f or '')
    end

    function DBG(...) print(fmt(...)) end

    setfenv = setfenv or function(fn, env)
        local i = 1
        while true do
            local name = debug.getupvalue(fn, i)
            if name == "_ENV" then
                debug.upvaluejoin(fn, i, (function()
                    return env
                end), 1)
                break
            elseif not name then
                break
            end

            i = i + 1
        end

        return fn
    end

    function orderedpairs(t, f)
        local a = {}
        for n in pairs(t) do table.insert(a, n) end
        table.sort(a, f)
        local i = 0
        local iter = function ()
            i = i + 1
            local k = a[i]
            if k == nil then
                return nil
            else
                return k, t[k]
            end
        end
        return iter
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Helpers
------------------------------------------------------------------------------------------------------------------------

local function splitnewlines(str)
    local t = {}
    local function helper(line) table.insert(t, line) return "" end
    helper(str:gsub("(.-)\r?\n", helper))
    return t
end

local operators = {
    { '&&', ' and ' },
    { '&', ' and ' },
    { '||', ' or ' },
    { '|', ' or ' },
    { '+', ' + ' },
    { '-', ' - ' },
    { '*', ' * ' },
    { '%', ' / ' },
    { '<=', ' <= ' },
    { '<', ' < ' },
    { '>=', ' >= ' },
    { '>', ' > ' },
    { '=', ' == ' },
}
local function is_parsed_operator(str)
    for _,v in pairs(operators) do
        if str == v[2] then
            return true
        end
    end
end

local function tokenise_apl_line(str)
    local indent = indent or 0
    local sections = {}
    local idx = 1
    local arg = ""
    local appendtoken = function(tok) sections[1+#sections] = tok end
    local appendarg = function() if string.len(arg) > 0 then appendtoken(arg); arg = "" end end
    while idx <= string.len(str) do
        --DBG('O: ' .. str:sub(idx))
        local c = str:sub(idx,idx)
        if c == "(" then
            appendarg()
            local bracketcount = 1
            local origidx = idx
            idx = idx + 1
            while idx <= string.len(str) and bracketcount > 0 do
                --DBG('I: ' .. str:sub(idx))
                c = str:sub(idx,idx)
                if c == "(" then bracketcount = bracketcount + 1 end
                if c == ")" then bracketcount = bracketcount - 1 end
                idx = idx + 1
            end
            sections[1+#sections] = tokenise_apl_line(str:sub(origidx+1, idx-2))
        elseif c == ")" then
            error('should not get here')
        else
            local found = false
            for _,v in pairs(operators) do
                local e = str:sub(idx,idx+string.len(v[1])-1)
                if e == v[1] then
                    appendarg()
                    appendtoken(v[2])
                    found = true
                    idx = idx + string.len(v[1])
                    break
                end
            end
            if not found then
                arg = arg..c
                idx = idx + 1
            end
        end
    end
    appendarg()
    if not IsLoadedByWoW then
        print("-------------------------------------")
        print_table(sections)
        print("-------------------------------------")
    end
    return sections
end

local function formatsections(sections)
    --[[if #sections == 1 and type(sections[1]) == 'string' then
    if sections[1]:find("^[+-]?[%d.]+$") then return sections[1] end
    return '( ' .. sections[1] .. ' )'
    end]]
    local str = '( '
    for _,v in pairs(sections) do
        if type(v) == "string" then
            str = str .. ' ' .. v .. ' '
        end
        if type(v) == "table" then
            str = str .. formatsections(v)
        end
    end
    return str .. ' )'
end

------------------------------------------------------------------------------------------------------------------------
-- APL substitutions
------------------------------------------------------------------------------------------------------------------------

local conditionalSubstitutions = {
    { "  ", " " },
    { "debuff.casting.up", " target.is_casting " },
    { "debuff.casting.down", " (not target.is_casting) " },
    { "target.debuff.casting.up", " target.is_casting " },
    { "target.debuff.casting.down", " (not target.is_casting) " },
    { "buff.casting.up", " player.is_casting " },
    { "buff.casting.down", " (not player.is_casting) " },

    { "!([%a%._]+)%.remains", " ( %1.remains == 0 ) " }, -- Handle "!buff.blah.remains" -> "buff.blah.remains==0"
    { "!([%a%._]+)%.enabled", " ( not %1.selected ) " }, -- Handle "!talent.blah.enabled" -> "talent.blah.selected==false"
    { "([%a%._]+)%.enabled", " %1.selected " }, -- Handle "talent.blah.enabled" -> "talent.blah.selected==true"
    { "!([%a%._]+)%.ticking", " ( %1.remains == 0 ) " }, -- Handle "!dot.blah.ticking" -> "dot.blah.remains==0"
    { "([%a%._]+)%.ticking", " ( %1.remains > 0 ) " }, -- Handle "dot.blah.ticking" -> "dot.blah.remains>0"

    { "!([%a%._]+)%.up", " ( %1.remains == 0 ) " }, -- Handle "!buff.blah.up" -> "buff.blah.remains==0"
    { "!([%a%._]+)%.down", " ( %1.remains > 0 ) " }, -- Handle "!buff.blah.down" -> "buff.blah.remains>0"

    { "([%a%._]+)%.react", " ( %1.stack > 0 ) " }, -- Handle "buff.blah.react>z" -> "buff.blah.stack>0"

    { "!", " not " },
    { " target%.dot%.", " aura." },
    { " target%.buff%.", " aura." },
    { " target%.debuff%.", " aura." },
    { " level ", " level.curr " },
    { " dot%.", " aura." },
    { " buff%.", " aura." },
    { " debuff%.", " aura." },

    { " energy ", " energy.curr " },
    { " chi ", " chi.curr " },
    { " rage ", " rage.curr " },
    { " pain ", " pain.curr " },
    { " rune ", " rune.curr " },
    { " fury ", " fury.curr " },
    { " runic_power ", " runic_power.curr " },
    { " burning_ember ", " burning_ember.curr " },
    { " soul_fragments ", " soul_fragments.curr " },

    { " duration ", " spell.THIS_SPELL.duration " },
    { " delay ", " spell.THIS_SPELL.delay " },
    { " remains ", " spell.THIS_SPELL.remains " },
    { " cast_time ", " spell.THIS_SPELL.cast_time " },
    { " time ", " time_since_combat_start " },
    { " gcd ", " gcd " },
    { " gcd%.remains ", " gcd_remains " },
    { " charges ", " spell.THIS_SPELL.charges " },
    { " max_charges ", " spell.THIS_SPELL.max_charges " },
    { " recharge_time ", " spell.THIS_SPELL.recharge_time " },
    { " stagger%.(%a+) ", " ( stagger.%1 == true ) " },
    { " equipped%.(%d+) ", " ( equipped[%1] == true ) " },
    { " equipped%.([%a_]+) ", " ( equipped[\"%1\"] == true ) " },

    -- Static incoming damage checks
    { " incoming_damage_([%d]+)s ",
        function(a)
            return fmt(" incoming_damage_over_%d ", tonumber(a)*1000)
        end
    },
    { " incoming_damage_([%d]+)ms ",
        function(a)
            return fmt(" incoming_damage_over_%d ", tonumber(a))
        end
    },
    -- Comparison incoming damage checks
    { " incoming_damage_([%d]+)s ",
        function(a)
            return fmt(" incoming_damage_over_%d ", tonumber(a)*1000)
        end
    },
    { " incoming_damage_([%d]+)ms ",
        function(a)
            return fmt(" incoming_damage_over_%d ", tonumber(a))
        end
    },

    { " cooldown%.([%a%._]+)%.ready ", " ( cooldown.%1.remains == 0 ) " },
    { " cooldown%.([%a%._]+)%.up ", " ( cooldown.%1.remains == 0 ) " },
    { " cooldown%.([%a%._]+)%.down ", " ( cooldown.%1.remains > 0 ) " },

    { " aura%.([%a%._]+)%.react ", " aura.%1.react " },

    { " spell_targets%.([%a%._]+) ", " spell_targets " },

    -- Convert XXXXX.YYYYY.ZZZZZ -> YYYYY.XXXXX_ZZZZZ (talent.blah.enabled -> blah.talent_enabled)
    { " ([%a_]+)%.([%a_]+)%.([%a_%.]+) ",
        function(a,b,c)
            return fmt(" %s.%s_%s ", b, a, c:gsub("%.","_"))
        end
    },

    { "_pct", "_percent" },
}

local arithmetic_operators = { ["+"] = "%+", ["-"] = "%-", ["*"] = "%*", ["/"] = "%%" }
for o,p in pairs(arithmetic_operators) do
    conditionalSubstitutions[1+#conditionalSubstitutions] = {
        fmt("%%( ([%%a_]+)%%.([%%a_]+) %%) %s", p), -- handle things like "(mybuff.aura_up * 9)" -> "((mybuff.aura_up and 1 or 0) * 9)"
        function(a,b)
            return fmt(" ( %s.%s_as_number ) %s ", a, b, o)
        end
    }
    conditionalSubstitutions[1+#conditionalSubstitutions] = {
        fmt("%s %%( ([%%a_]+)%%.([%%a_]+) %%)", p), -- handle things like "(9 * mybuff.aura_up)" -> "(9 * (mybuff.aura_up and 1 or 0))"
        function(a,b)
            return fmt(" %s ( %s.%s_as_number ) ", o, a, b)
        end
    }
    conditionalSubstitutions[1+#conditionalSubstitutions] = {
        fmt(" ([%%a_]+)%%.([%%a_]+) %s", p), -- handle things like "(mybuff.aura_up * 9)" -> "((mybuff.aura_up and 1 or 0) * 9)"
        function(a,b)
            return fmt(" %s.%s_as_number %s ", a, b, o)
        end
    }
    conditionalSubstitutions[1+#conditionalSubstitutions] = {
        fmt("%s ([%%a_]+)%%.([%%a_]+) ", p), -- handle things like "(9 * mybuff.aura_up)" -> "(9 * (mybuff.aura_up and 1 or 0))"
        function(a,b)
            return fmt(" %s %s.%s_as_number ", o, a, b)
        end
    }
end

local function manipulate_apl_string(aplstr, thisSpellName, extraParserSubstitutions, paramDbg)
    if aplstr == 'true' then return aplstr end

    local P = function(...) if paramDbg then DBG(...) end end
    P("")
    P("--------------------------------------------------------------------------")
    P("    input: %s", aplstr)

    local parsedCondition = tokenise_apl_line(aplstr)
    local aplstr = (#parsedCondition > 0 and formatsections(parsedCondition) or "true")
    P("   parsed: %s", aplstr)

    local function applySubstitutions(substitutionsTable)
        -- Remove any double-spaces
        while aplstr:find("  ") do
            aplstr = aplstr:gsub("  "," ")
        end

        for k,s in pairs(substitutionsTable) do
            -- Run the substitution
            local prev = aplstr
            aplstr = aplstr:gsub(s[1], s[2])

            -- Remove any double-spaces
            while aplstr:find("  ") do
                aplstr = aplstr:gsub("  "," ")
            end

            if aplstr ~= prev then
                P("    apply: '%s' => '%s'", tostring(s[1]), tostring(s[2]))
                P("      res: %s", aplstr)
            end
        end
    end

    -- Apply global substitutions
    applySubstitutions(conditionalSubstitutions)
    -- Apply profile-specific substitutions
    if extraParserSubstitutions then
        applySubstitutions(extraParserSubstitutions)
    end

    -- Replace 'THIS_SPELL' with the actual action name
    if thisSpellName then
        local prev = aplstr
        aplstr = aplstr:gsub("THIS_SPELL", thisSpellName)
        if aplstr ~= prev then
            P("")
            P("    apply: '%s' => '%s'", 'THIS_SPELL', thisSpellName)
            P("     cond: %s", aplstr)
        end
    end

    -- Collapse parentheses
    aplstr = aplstr:gsub('%( ','('):gsub(' %)',')')
    P("    final: %s", aplstr)

    -- Throw up an error if we had a parsing error - two back-to-back parentheses shouldn't happen!
    if aplstr:find("%)%s*%(") then error(fmt("Invalid parentheses syntax: %s", aplstr)) end

    return aplstr
end

------------------------------------------------------------------------------------------------------------------------
-- Profile setup
------------------------------------------------------------------------------------------------------------------------

local function ParseActionProfileList(aplString, extraParserSubstitutions)
    local emptyEnvironment = setmetatable({ type = _G.type }, { __index = function() return nil end })
    local profileLines = splitnewlines(aplString or "")
    local profileErrors = {}
    local actionCounts = {}
    local parsedActions = {}

    for i,line in pairs(profileLines) do
        -- Only continue if the line contains "action" at the start
        if line:find("action") == 1 then
            if line:find("%a%s*%(") then -- ensure we don't have any attempted function calls
                profileErrors[#profileErrors+1] = fmt("Malformed line: '%s'", line)
            else
                local entry = {}

                -- Determine action, and if it's for a specific action list, use "default" list if not specified
                local actionList, actionName = line:match('^actions%.?([%a%d_]*)[^%a%d]+([^,]+)')
                if not actionList or actionList == "" then actionList = "default" end
                entry.name = actionName

                local key = fmt("%s:%s", actionList, actionName)
                -- Determine parameters
                local paramName = line:match(',name=([^,]*),?') or ""
                local paramType = line:match(',type=([^,]*),?') or ""
                local paramChoose = line:match(',choose=([^,]*),?') or ""
                local paramSync = line:match(',sync=([^,]*),?') or ""
                local paramIf = line:match(',if=([^,]*),?') or "true"
                local paramTargetIf = line:match(',target_if=([^,]*),?') or "true"
                local paramValue = line:match(',value=([^,]*),?') or "true"
                local paramDbg = line:match(',dbg=([^,]*),?') or nil
                local P = function(...) if paramDbg then DBG(...) end end

                -- Just override the if=... with target_if=...
                if paramIf == "true" and paramTargetIf ~= "true" then
                    paramIf = paramTargetIf
                end

                -- Count how many times we've seen this ability during this action list, for logging purposes
                actionCounts[key] = (actionCounts[key] or 0) + 1

                -- Set the key of this action
                entry.key = fmt("%s[%d]", key, actionCounts[key])

                P("     line: %s", line)
                P("      key: %s", entry.key)
                P("   action: %s", actionName)
                P("     name: %s", paramName)
                P("     type: %s", paramType)
                P("   choose: %s", paramChoose)
                P("     sync: %s", paramSync)
                P("       if: %s", paramIf)
                P("    value: %s", paramValue)

                -- Work out the base condition string in the APL, as well as a cast validation check
                local precondition = ""
                if actionName ~= "call_action_list" and actionName ~= "run_action_list" then
                    precondition = fmt("spell.%s.can_cast", actionName)
                else
                    entry.list = paramName
                end
                if paramSync ~= "" then
                    precondition = fmt("(%s.spell_can_cast|cooldown.%s.up|buff.%s.up)&(%s)", paramSync, paramSync, paramSync, precondition)
                end

                local x1 = manipulate_apl_string(precondition, actionName, extraParserSubstitutions, paramDbg or not IsLoadedByWoW)
                local x2 = manipulate_apl_string(paramIf, actionName, extraParserSubstitutions, paramDbg or not IsLoadedByWoW)
                local x3 = manipulate_apl_string(paramValue, nil, extraParserSubstitutions, paramDbg or not IsLoadedByWoW)
                local condition = fmt("(%s) and (%s)", x1, x2)

                -- Save the actual condition string
                entry.precondition = precondition
                entry.precondition_parsed = s1
                entry.condition = condition
                entry.condition_parsed = s2
                entry.param_if = paramIf
                entry.param_sync = paramSync
                entry.param_name = paramName
                entry.param_value = paramValue
                entry.param_value_parsed = x3 -- /dump tj.currentProfile.parsedActions.default[2]

                -- Return the result of the conditional and compile
                local conditionFunctionSource = "return function() return (" .. condition .. ") end"
                local conditionFunctionLoader, errStr = loadstring(conditionFunctionSource, entry.key..':condition')
                if errStr then
                    profileErrors[#profileErrors+1] = {
                        ['error'] = fmt("Could not load condition: %s='%s'", entry.key, errStr),
                        ['entry'] = entry
                    }
                else
                    setfenv(conditionFunctionLoader, emptyEnvironment)
                    local success, conditionFunction = pcall(assert(conditionFunctionLoader))
                    -- Log an error during compilation if any
                    if not success or not conditionFunction then
                        profileErrors[#profileErrors+1] = fmt("Could not compile condition: %s='%s'", entry.key, condition)
                    else
                        -- Save the function
                        entry.check = conditionFunction

                        -- Save the parsed entry
                        parsedActions[actionList] = parsedActions[actionList] or {}
                        local t = parsedActions[actionList]
                        t[1+#t] = entry
                    end
                end

                if entry.name == "variable" then
                    local valueFunctionSource = "return function() return (" .. x3 .. ") end"
                    local valueFunctionLoader, errStr = loadstring(valueFunctionSource, entry.key..':variable')
                    if errStr then
                        profileErrors[#profileErrors+1] = {
                            ['error'] = fmt("Could not load variable function: %s='%s'", entry.key, errStr),
                            ['entry'] = entry
                        }
                    else
                        setfenv(valueFunctionLoader, emptyEnvironment)
                        local success, valueFunction = pcall(assert(valueFunctionLoader))
                        -- Log an error during compilation if any
                        if not success or not valueFunction then
                            profileErrors[#profileErrors+1] = fmt("Could not compile variable function: %s='%s'", entry.key, x3)
                        else
                            -- Save the function
                            entry.value = valueFunction
                        end
                    end
                end
            end
        end
    end
    if #profileErrors > 0 and not IsLoadedByWoW then
        DBG('------------------------------------------------------------------------------------------------------------------------------')
        DBG('Parsing errors:')
        error(dump_table(profileErrors))
    end
    return parsedActions
end

if IsLoadedByWoW then
    -- Export the APL parser function to the rest of ThousandJabs
    function Z:ParseActionProfileList(aplString, extraParserSubstitutions)
        return ParseActionProfileList(aplString, extraParserSubstitutions)
    end
else
    -- Run the parser without being loaded by WoW
    local internal = {}

    local files = {
        [[ActionProfileLists/ActionProfileLists-Death_Knight.lua]],
        [[ActionProfileLists/ActionProfileLists-Demon_Hunter.lua]],
        -- [[ActionProfileLists/ActionProfileLists-Druid.lua]],
        -- [[ActionProfileLists/ActionProfileLists-Hunter.lua]],
        -- [[ActionProfileLists/ActionProfileLists-Mage.lua]],
        [[ActionProfileLists/ActionProfileLists-Monk.lua]],
        -- [[ActionProfileLists/ActionProfileLists-Paladin.lua]],
        -- [[ActionProfileLists/ActionProfileLists-Priest.lua]],
        -- [[ActionProfileLists/ActionProfileLists-Rogue.lua]],
        -- [[ActionProfileLists/ActionProfileLists-Shaman.lua]],
        -- [[ActionProfileLists/ActionProfileLists-Warlock.lua]],
        [[ActionProfileLists/ActionProfileLists-Warrior.lua]]
    }

    for _,v in ipairs(files) do
        loadfile(v)("x", internal)
    end

    for k,v in orderedpairs(internal.apls) do
        DBG('------------------------------------------------------------------------------------------------------------------------------')
        DBG(k)
        local parsed = ParseActionProfileList(v)
        print_table(parsed)
    end
end
