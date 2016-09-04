local _, internal = ...;
local Z = internal.Z
local DBG = internal.DBG
local fmt = internal.fmt

------------------------------------------------------------------------------------------------------------------------
-- Helpers
------------------------------------------------------------------------------------------------------------------------

local function splitnewlines(str)
    local t = {}
    local function helper(line) table.insert(t, line) return "" end
    helper(str:gsub("(.-)\r?\n", helper))
    return t
end

------------------------------------------------------------------------------------------------------------------------
-- APL substitutions
------------------------------------------------------------------------------------------------------------------------

local conditionalSubstitutions = {
    { "debuff.casting.up", "target.is_casting" },
    { "debuff.casting.down", " ( not target.is_casting ) " },
    { "target.debuff.casting.up", "target.is_casting" },
    { "target.debuff.casting.down", " ( not target.is_casting ) " },
    { "buff.casting.up", "player.is_casting" },
    { "buff.casting.down", " ( not player.is_casting ) " },

    { "!([%a%._]+)%.remains", " ( %1.remains=0 ) " }, -- Handle "!buff.blah.remains" -> "buff.blah.remains==0"
    { "!([%a%._]+)%.enabled", " ( not %1.selected ) " }, -- Handle "!talent.blah.enabled" -> "talent.blah.selected==false"
    { "([%a%._]+)%.enabled", " ( %1.selected ) " }, -- Handle "talent.blah.enabled" -> "talent.blah.selected==true"
    { "!([%a%._]+)%.ticking", " ( %1.remains=0 ) " }, -- Handle "!dot.blah.ticking" -> "dot.blah.remains==0"
    { "([%a%._]+)%.ticking", " ( %1.remains>0 ) " }, -- Handle "dot.blah.ticking" -> "dot.blah.remains>0"

    { "!([%a%._]+)%.up", " ( %1.remains=0 ) " }, -- Handle "!buff.blah.up" -> "buff.blah.remains==0"
    { "!([%a%._]+)%.down", " ( %1.remains>0 ) " }, -- Handle "!buff.blah.down" -> "buff.blah.remains>0"

    { "([%a%._]+)%.react", " ( %1.stack>0 ) " }, -- Handle "buff.blah.react>z" -> "buff.blah.stack>0"

    { "!", " not " },
    { "<", " < " },
    { ">", " > " },
    { "=", " = " },
    { "<%s+=", " <= " },
    { ">%s+=", " >= " },
    { " = ", " == " },
    { "+", " + " },
    { "-", " - " },
    { "*", " * " },
    { "&", " ) and ( " },
    { "|", " ) or ( " },
    { "%(", " ( " },
    { "%)", " ) " },
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
    { " charges ", " spell.THIS_SPELL.charges " },
    { " max_charges ", " spell.THIS_SPELL.max_charges " },
    { " recharge_time ", " spell.THIS_SPELL.recharge_time " },
    { " stagger%.(%a+) ", " ( stagger.%1 == true ) " },

    -- Static incoming damage checks
    { "%( incoming_damage_([%d]+)s %)",
      function(a)
        return format(" ( incoming_damage_over_%d > 0 ) ", tonumber(a)*1000)
      end
    },
    { "%( incoming_damage_([%d]+)ms %)",
      function(a)
        return format(" ( incoming_damage_over_%d > 0 ) ", tonumber(a))
      end
    },
    -- Comparison incoming damage checks
    { " incoming_damage_([%d]+)s ",
      function(a)
        return format(" incoming_damage_over_%d ", tonumber(a)*1000)
      end
    },
    { " incoming_damage_([%d]+)ms ",
      function(a)
        return format(" incoming_damage_over_%d ", tonumber(a))
      end
    },

    { " cooldown%.([%a%._]+)%.ready ", " ( cooldown.%1.remains == 0 ) " },
    { " cooldown%.([%a%._]+)%.up ", " ( cooldown.%1.remains == 0 ) " },
    { " cooldown%.([%a%._]+)%.down ", " ( cooldown.%1.remains > 0 ) " },

    { " aura%.([%a%._]+)%.react ", " aura.%1.react " },

    { " spell_targets%.([%a%._]+) ", " spell_targets " },

    -- Convert the XXXXX.spell.YYYYY -> spell.XXXXX_YYYYY
    { " ([%a_]+)%.([%a_]+)%.([%a_%.]+) ",
        function(a,b,c)
            return format(" %s.%s_%s ", b, a, c:gsub("%.","_"))
        end
    },

    { "_pct", "_percent" },
}

local arithmetic_operators = { ["+"] = "%+", ["-"] = "%-", ["*"] = "%*", ["/"] = "/" }

for o,p in pairs(arithmetic_operators) do
    conditionalSubstitutions[1+#conditionalSubstitutions] = {
        fmt(" ([%%a_]+)%%.([%%a_]+) %s ", p), -- handle things like "(mybuff.aura_up * 9)" -> "((mybuff.aura_up and 1 or 0) * 9)"
        function(a,b)
            return fmt(" ( %s.%s and 1 or 0 ) %s ", a, b, o)
        end
    }
    conditionalSubstitutions[1+#conditionalSubstitutions] = {
        fmt(" %s ([%%a_]+)%%.([%%a_]+) ", p), -- handle things like "(mybuff.aura_up * 9)" -> "((mybuff.aura_up and 1 or 0) * 9)"
        function(a,b)
            return fmt(" %s ( %s.%s and 1 or 0 ) ", o, a, b)
        end
    }
    conditionalSubstitutions[1+#conditionalSubstitutions] = {
        fmt(" %%( ([%%a_]+)%%.([%%a_]+) %%) %s ", p), -- handle things like "((mybuff.aura_up) * 9)" -> "((mybuff.aura_up and 1 or 0) * 9)"
        function(a,b)
            return fmt(" ( %s.%s and 1 or 0 ) %s ", a, b, o)
        end
    }
    conditionalSubstitutions[1+#conditionalSubstitutions] = {
        fmt(" %s %%( ([%%a_]+)%%.([%%a_]+) %%) ", p), -- handle things like "(9 * (mybuff.aura_up))" -> "(9 * (mybuff.aura_up and 1 or 0))"
        function(a,b)
            return fmt(" %s ( %s.%s and 1 or 0 ) ", o, a, b)
        end
    }
end

------------------------------------------------------------------------------------------------------------------------
-- APL parsing
------------------------------------------------------------------------------------------------------------------------

function Z:ParseActionProfileList(aplString, extraParserSubstitutions)
    local emptyEnvironment = setmetatable({}, { __index = function() return nil end })
    local profileLines = splitnewlines(aplString or "")
    local profileErrors = {}
    local actionCounts = {}
    local parsedActions = {}

    for i,line in pairs(profileLines) do
        -- Only continue if the line contains "action" at the start
        if line:find("action") == 1 then
            if line:find("%a%s*%(") then -- ensure we don't have any attempted function calls
                profileErrors[#profileErrors+1] = format("Malformed line: '%s'", line)
            else
                local entry = {}

                -- Determine action, and if it's for a specific action list, use "default" list if not specified
                local actionList, actionName = line:match('^actions%.?([%a_]*)[^%a]+([^,]+)')
                if not actionList or actionList == "" then actionList = "default" end
                entry.name = actionName

                local key = format("%s:%s", actionList, actionName)
                -- Determine parameters
                local paramName = line:match('name=([^,]*),?') or ""
                local paramType = line:match('type=([^,]*),?') or ""
                local paramChoose = line:match('choose=([^,]*),?') or ""
                local paramSync = line:match('sync=([^,]*),?') or ""
                local paramIf = line:match('if=([^,]*),?') or "true"
                local paramDbg = line:match('dbg=([^,]*),?') or nil
                local P = function(...) if paramDbg then DBG(...) end end

                -- Count how many times we've seen this ability during this action list, for logging purposes
                actionCounts[key] = (actionCounts[key] or 0) + 1

                -- Set the key of this action
                entry.key = format("%s[%d]", key, actionCounts[key])

                P("     line: %s", line)
                P("      key: %s", entry.key)
                P("   action: %s", actionName)
                P("     name: %s", paramName)
                P("     type: %s", paramType)
                P("   choose: %s", paramChoose)
                P("     sync: %s", paramSync)
                P("       if: %s", paramIf)

                -- Work out the base condition string in the APL, as well as a cast validation check
                local condition = paramIf
                if actionName ~= "call_action_list" and actionName ~= "run_action_list" then
                    condition = format("(spell.%s.can_cast)&(%s)", actionName, condition)
                else
                    entry.list = paramName
                end
                condition = format("(%s)", condition)
                P("")
                P(" initcond: %s", condition)

                if paramSync ~= "" then
                    condition = fmt("(%s.spell_can_cast|cooldown.%s.up|buff.%s.up)&%s", paramSync, paramSync, paramSync, condition)
                end

                if condition ~= "(true)" then
                    local function applySubstitutions(substitutionsTable)
                        for k,s in pairs(substitutionsTable) do
                            -- Run the substitution
                            local prev = condition
                            condition = condition:gsub(s[1], s[2])

                            -- Remove any double-spaces
                            while condition:find("  ") do
                                condition = condition:gsub("  "," ")
                            end

                            if condition ~= prev then
                                P("")
                                P("    apply: '%s' => '%s'", tostring(s[1]), tostring(s[2]))
                                P("     cond: %s", condition)
                            end
                        end
                    end

                    applySubstitutions(conditionalSubstitutions)
                    if extraParserSubstitutions then
                        applySubstitutions(extraParserSubstitutions)
                    end

                    -- Replace 'THIS_SPELL' with the actual action name
                    local prev = condition
                    condition = condition:gsub("THIS_SPELL", actionName)
                    if condition ~= prev then
                        P("")
                        P("    apply: '%s' => '%s'", 'THIS_SPELL', actionName)
                        P("     cond: %s", condition)
                    end
                end

                -- Collapse parentheses now
                condition = condition:gsub('%( ','('):gsub(' %)',')')
                P("")
                P("finalcond: %s", condition)

                -- Save the actual condition string
                entry.condition = condition

                -- Return the result of the conditional and compile
                local conditionFunctionSource = "return function() return (" .. condition .. ") end"
                local conditionFunctionLoader, errStr = loadstring(conditionFunctionSource, entry.key..':condition')
                if errStr then
                    profileErrors[#profileErrors+1] = format("Could not load condition: %s='%s'", entry.key, errStr)
                else
                    setfenv(conditionFunctionLoader, emptyEnvironment)
                    local success, conditionFunction = pcall(assert(conditionFunctionLoader))
                    -- Log an error during compilation if any
                    if not success or not conditionFunction then
                        profileErrors[#profileErrors+1] = format("Could not compile condition: %s='%s'", entry.key, condition)
                    else
                        -- Save the function/condition string
                        entry.check = conditionFunction

                        -- Save the parsed entry
                        parsedActions[actionList] = parsedActions[actionList] or {}
                        local t = parsedActions[actionList]
                        t[1+#t] = entry
                    end
                end
            end
        end
    end
    return parsedActions
end