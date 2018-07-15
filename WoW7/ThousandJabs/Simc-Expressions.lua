--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Legion only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and select(4, GetBuildInfo()) >= 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- Detect if we're running inside or outside of WoW
------------------------------------------------------------------------------------------------------------------------

local TJ, Core, Debug, fmt
local ct, rt -- create table, release table

local pairs = pairs
local setmetatable = setmetatable
local tContains = tContains
local tinsert = table.insert
local tsort = table.sort
local wipe = wipe

local IsLoadedByWoW = _G.GetSpellInfo and true or false
if IsLoadedByWoW then
    local LibStub = LibStub
    TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
    Core = TJ:GetModule('Core')
    Debug = function(...) Core:Debug(...) end
    fmt = function(...) Core:Format(...) end
    TableCache = TJ:GetModule('TableCache')
    ct = function() return TableCache:Acquire() end
    rt = function(tbl) TableCache:Release(tbl) end
    Core:Safety()
else
    TJ = { Core = {} }
    Core = TJ.Core
    Core.Format = function(self, f, ...) return ((select('#', ...) > 0) and f:format(...) or (type(f) == 'string' and f) or tostring(f) or '') end
    Core.Debug = function(self, ...) print(Core:Format(...)) end
    LSD = require('Libs/LibSerpentDump')
    function tContains(table, item)
        local index = 1
        while table[index] do
            if item == table[index] then
                return 1
            end
            index = index + 1
        end
        return nil;
    end
    ct = function() return {} end
    rt = function(tbl) end
    wipe = function(tbl)
        for k,v in pairs(tbl) do tbl[k] = nil end
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Expression lexer implementation
------------------------------------------------------------------------------------------------------------------------

local simcExpressionLexer
do
    local operators = {
        { 'ceil(', 'ceil' },
        { 'floor(', 'floor' },
        { 'min(', 'min' },
        { 'max(', 'max' },
        { '(', 'lparen' },
        { ')', 'rparen' },
        { '&&', 'and' },
        { '&', 'and' },
        { '||', 'or' },
        { '|', 'or' },
        { '>=', 'gte' },
        { '>', 'gt' },
        { '<=', 'lte' },
        { '<', 'lt' },
        { '==', 'equal' },
        { '=', 'equal' },
        { '!=', 'notequal' },
        { '!', 'not' },
        { '+', 'plus' },
        { '-', 'minus' },
        { '*', 'multiply' },
        { '%', 'divide' },
        { '@', 'abs' },
    }

    local function appendToken(tbl, op, str)
        local t = ct()
        t.operator, t.value = op, str
        tbl[1+#tbl] = t
    end

    local function appendPrimary(tbl, str)
        local s = str:gsub('%s+', '')
        if s:len() > 0 then
            appendToken(tbl, 'primary', s)
        end
    end

    function simcExpressionLexer(str)
        local tokens = ct()
        local idx = 1
        local arg = ""
        while idx <= str:len() do
            local operatorFound = false
            for _,v in pairs(operators) do
                local opLen = v[1]:len()
                local e = str:sub(idx,idx+opLen-1)
                if e == v[1] then
                    appendPrimary(tokens, arg)
                    arg = ''
                    appendToken(tokens, v[2], e)
                    operatorFound = true
                    idx = idx + opLen
                    break
                end
            end
            if not operatorFound then
                arg = arg .. str:sub(idx,idx)
                idx = idx + 1
            end
        end
        appendPrimary(tokens, arg)
        return tokens
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Expression parser implementation
------------------------------------------------------------------------------------------------------------------------

local simcExpressionParser
do
    local function simcExpressionParser__throwError(parser, reason)
        local tok = parser.tokens[parser.nextIndex-1]
        local s = ''
        for i,t in pairs(parser.tokens) do
            s = s..Core:Format("%s %5s: %9s = '%s'\n", (i==parser.nextIndex-1 and "==>" or "   "), Core:Format('#%d', i), t.operator, t.value)
        end
        error(Core:Format('Error parsing token index %d: %s. Got operator "%s", value "%s"\n%s', parser.nextIndex-1, reason, tok.operator, tok.value, s))
    end

    local function createPrimaryExpression(parser, token)
        local t = ct()
        t.token, t.value = "primary", token.value
        return t
    end

    local function createParenthesesExpression(parser, token)
        local inner = parser:ParseExpression(0)
        local rparen = parser:NextToken()
        if not rparen then
            return nil
        elseif rparen.operator ~= 'rparen' then
        end
        return inner
    end

    local function createInvokeExpression(parser, token)
        local inner = parser:ParseExpression(0)
        local rparen = parser:NextToken()
        if not rparen then
            return nil
        elseif rparen.operator ~= 'rparen' then
        end
        local t = ct()
        t.token, t.operator, t.inner = "invoke", token.operator, inner
        return t
    end

    local precedences = {
        ['lparen'] = 1000,
        ['rparen'] = 1000,
        ['min'] = 999,
        ['max'] = 999,
        ['ceil'] = 998,
        ['floor'] = 998,
        ['primary'] = 1,
    }

    local prefixParsers = {
        ['primary'] = createPrimaryExpression,
        ['lparen'] = createParenthesesExpression,
        ['rparen'] = nil, -- terminates the lparen ParseExpression() call
        ['min'] = createInvokeExpression,
        ['max'] = createInvokeExpression,
        ['ceil'] = createInvokeExpression,
        ['floor'] = createInvokeExpression,
    }

    local infixParsers = {}

    local function simcExpressionParser__parseExpression(parser, untilPrecedence)
        local token = parser:NextToken()
        local handler = prefixParsers[token.operator]
        if not handler then
            parser:ThrowError('Did not match a prefix token')
        end

        local lhs = handler(parser, token)
        token = parser:NextToken()
        while token and untilPrecedence < parser:GetOperatorPrecedence(token) do
            handler = infixParsers[token.operator]
            if not handler then
                parser:PrevToken()
                return lhs
            end

            lhs = handler(parser, lhs, token)
            token = parser:NextToken()
        end

        if token then
            parser:PrevToken()
        end

        return lhs
    end

    local function definePrefixExpression(token, precedence)

        local function createPrefixExpression(parser, token)
            local rhs = parser:ParseExpression(precedence)
            local t = ct()
            t.token, t.operator, t.rhs = "prefix", token.operator, rhs
            return t
        end

        prefixParsers[token] = createPrefixExpression
        precedences[token] = precedence
    end

    local function defineLeftAssocExpression(token, precedence)

        local function createLeftAssocExpression(parser, lhs, token)
            local rhs = parser:ParseExpression(precedence)
            local t = ct()
            t.token, t.operator, t.lhs, t.rhs = "infix", token.operator, lhs, rhs
            return t
        end

        infixParsers[token] = createLeftAssocExpression
        precedences[token] = precedence
    end

    local function defineRightAssocExpression(token, precedence)

        local function createRightAssocExpression(parser, lhs, token)
            local rhs = parser:ParseExpression(precedence - 1)
            local t = ct()
            t.token, t.operator, t.lhs, t.rhs = "infix", token.operator, lhs, rhs
            return t
        end

        infixParsers[token] = createRightAssocExpression
        precedences[token] = precedence
    end

    local function simcExpressionParser__NextToken(parser)
        local tok = parser.tokens[parser.nextIndex]
        parser.nextIndex = parser.nextIndex + 1
        return tok
    end

    local function simcExpressionParser__PrevToken(parser)
        parser.nextIndex = parser.nextIndex - 1
    end

    local function simcExpressionParser__GetOperatorPrecedence(parser, token)
        local prec = precedences[token.operator]
        if not prec then
            parser:ThrowError('No precedence specified')
        end
        return prec
    end

    local simcExpressionParser_mt = {
        ParseExpression = simcExpressionParser__parseExpression,
        NextToken = simcExpressionParser__NextToken,
        PrevToken = simcExpressionParser__PrevToken,
        GetOperatorPrecedence = simcExpressionParser__GetOperatorPrecedence,
        ThrowError = simcExpressionParser__throwError,
    }
    simcExpressionParser_mt.__index = simcExpressionParser_mt

    function simcExpressionParser(tokens)
        local t = ct()
        t.tokens, t.nextIndex = tokens, 1
        local parser = setmetatable(t, simcExpressionParser_mt)
        local result = parser:ParseExpression(0)
        if parser.nextIndex <= #parser.tokens then
            parser:ThrowError('Did not consume entire string')
        end
        result.parser = parser
        return result
    end

    definePrefixExpression("plus", 91)
    definePrefixExpression("minus", 91)
    definePrefixExpression("abs", 91)
    definePrefixExpression("not", 91)

    defineLeftAssocExpression("multiply", 80)
    defineLeftAssocExpression("divide", 80)
    defineLeftAssocExpression("plus", 70)
    defineLeftAssocExpression("minus", 70)

    defineRightAssocExpression("equal", 30)
    defineRightAssocExpression("notequal", 30)
    defineRightAssocExpression("gte", 30)
    defineRightAssocExpression("gt", 30)
    defineRightAssocExpression("lte", 30)
    defineRightAssocExpression("lt", 30)

    defineRightAssocExpression("and", 20)
    defineRightAssocExpression("or", 10)
end

------------------------------------------------------------------------------------------------------------------------
-- Expression renderer implementation
------------------------------------------------------------------------------------------------------------------------

local simcExpressionRenderer
do
    local equivalentLuaOperators = {
        ['abs'] = 'math.abs',
        ['ceil'] = 'math.ceil',
        ['floor'] = 'math.floor',
        ['min'] = 'math.min',
        ['max'] = 'math.max',
        ['and'] = 'and',
        ['or'] = 'or',
        ['not'] = 'not',
        ['gte'] = '>=',
        ['gt'] = '>',
        ['lte'] = '<=',
        ['lt'] = '<',
        ['equal'] = '==',
        ['notequal'] = '~=',
        ['plus'] = '+',
        ['minus'] = '-',
        ['multiply'] = '*',
        ['divide'] = '/',
    }

    local convertNumbers = {
        'gte', 'gt', 'lte', 'lt', 'plus', 'minus', 'multiply', 'divide'
    }

    local convertBoolean = {
        'not', 'and', 'or'
    }

    local convertPrefixArgToFunctionCall = {
        'abs'
    }

    local numConverter = 'N'
    local boolConverter = 'B'

    local function render(result, primaryModifier)
        if result.token == "primary" then
            return (primaryModifier and primaryModifier(result.value) or result.value)
        elseif result.token == "prefix" then
            if tContains(convertPrefixArgToFunctionCall, result.operator) then
                return Core:Format("%s(%s)", equivalentLuaOperators[result.operator], render(result.rhs, primaryModifier))
            elseif tContains(convertBoolean, result.operator) then
                return Core:Format("(%s %s(%s))", equivalentLuaOperators[result.operator], boolConverter, render(result.rhs, primaryModifier))
            else
                return Core:Format("(%s %s)", equivalentLuaOperators[result.operator], render(result.rhs, primaryModifier))
            end
        elseif result.token == "invoke" then
            return Core:Format("%s(%s)", equivalentLuaOperators[result.operator], render(result.inner, primaryModifier))
        elseif result.token == "infix" then
            local lhs = render(result.lhs, primaryModifier)
            local rhs = render(result.rhs, primaryModifier)
            if tContains(convertNumbers, result.operator) then
                if lhs:match("[^%d%.]") then lhs = Core:Format('%s(%s)', numConverter, lhs) end
                if rhs:match("[^%d%.]") then rhs = Core:Format('%s(%s)', numConverter, rhs) end
            elseif tContains(convertBoolean, result.operator) then
                if lhs:match("[^%d%.]") then lhs = Core:Format('%s(%s)', boolConverter, lhs) end
                if rhs:match("[^%d%.]") then rhs = Core:Format('%s(%s)', boolConverter, rhs) end
            end
            return Core:Format("(%s %s %s)", lhs, equivalentLuaOperators[result.operator], rhs)
        end
    end

    function simcExpressionRenderer(str, primaryModifier)
        local tokens = simcExpressionLexer(str)
        local parsed = simcExpressionParser(tokens)
        local keywords = ct()
        for _,v in pairs(tokens) do
            if v.operator == "primary" and not tContains(keywords, v.value) then
                if not v.value:match("^([%d%.]+)$") then -- skip numbers
                    keywords[1+#keywords] = (primaryModifier and primaryModifier(v.value) or v.value)
                end
            end
        end
        tsort(keywords)
        local t = ct()
        t.expression, t.keywords = render(parsed, primaryModifier), keywords
        rt(parsed)
        rt(tokens)
        return t
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Expression parser implementation
------------------------------------------------------------------------------------------------------------------------

local simcAplParser
do
    function simcAplParser(lines, primaryModifier, tbl)
        local allEntries = tbl or ct()
        for _,l in pairs(lines) do
            local list, action, params = l:match("^actions%.?([%w_]*)%+?=/?([^,]+),?(.*)")
            if list and action then
                list = list:len() == 0 and "default" or list
                local t = ct()
                t.line, t.action, t.params = l, action, ct()
                local paramName, paramValue, p = params:match("([^=]+)=([^,]+),?(.*)")
                while paramName do
                    if paramName == "if" then paramName = "condition" end
                    t.params[paramName] = paramValue
                    if (paramName == "condition") or (paramName == "target_if") or (t.action == "variable" and paramName == "value") then
                        t.params[paramName.."_converted"] = simcExpressionRenderer(paramValue, primaryModifier)
                    end
                    paramName, paramValue, p = p:match("([^=]+)=([^,]+),?(.*)")
                end
                allEntries[list] = allEntries[list] or ct()
                local thisList = allEntries[list]
                thisList[1+#thisList] = t
            end
        end
        return allEntries
    end
end

------------------------------------------------------------------------------------------------------------------------
-- Expression parser export
------------------------------------------------------------------------------------------------------------------------

if IsLoadedByWoW then
    local function splitnewlines(str, tbl)
        local t = tbl and wipe(tbl) or ct()
        local function helper(line) tinsert(t, line) return "" end
        helper(str:gsub("(.-)\r?\n", helper))
        return t
    end

    function Core:ExpressionParser(str, primaryModifier)
        local tmp = ct()
        local lines = splitnewlines(str, tmp)
        local ret = simcAplParser(lines, primaryModifier)
        rt(tmp)
        return ret
    end
else
    local function LoadFunctionString(funcStr)
        local loader, errStr = loadstring('return (' .. funcStr .. ')', name)
        if errStr then
            local err = Core:Format("Failed to load string:\n%s\n%s", funcStr, errStr)
            error(err)
        else
            local success, retVal = pcall(assert(loader))
            if success then
                return retVal
            end
            local err = Core:Format("Failed to load string:\n%s\n%s", funcStr, retVal)
            error(err)
        end
    end

    local lines = {}
    for line in io.lines() do
        if line:len() > 0 then
            lines[1+#lines] = line
        end
    end

    local result
    if #lines > 0 then
        result = simcAplParser(lines, function(str)
            str = str:gsub('%.in$', '["in"]') -- 'in' is a lua keyword, so we change it to array indexing
            str = str:gsub('([^%d])%.([%d]+)$', '%1[%2]') -- any trailing digit selectors with no following field (i.e.  something.1) we change to array indexing
            str = str:gsub('([^%d])%.([%d]+)%.', '%1[%2].') -- any trailing digit selectors with following field (i.e.  something.1.field) we change to array indexing
            str = str:gsub('([^%d])%.(%d.+)', '%1[\"%2\"]') -- any trailing digit selectors with following text (i.e.  something.1name) we change to string indexing
            return str
        end)

        -- Validate that each of the conditions is compilable
        for list, actions in pairs(result) do
            for _, action in pairs(actions) do
                if action.params.condition_converted then
                    local loadFunc = Core:Format("function() return (%s) and true or false end", action.params.condition_converted.expression)
                    if action.action ~= 'strict_sequence' then
                        local retFunc = LoadFunctionString(loadFunc)
                        local success, retVal = pcall(retFunc)
                    end
                end
                if action.params.value_converted then
                    local loadFunc = Core:Format("function() return (%s) and true or false end", action.params.value_converted.expression)
                    if action.action ~= 'strict_sequence' then
                        local retFunc = LoadFunctionString(loadFunc)
                        local success, retVal = pcall(retFunc)
                    end
                end
            end
        end
    else
        result = simcAplParser({'actions=blah,if=-@5|@-5|-+5|!5|6!=5'})
    end

    Core:Debug(LSD(result))

    return function(str, primaryModifier)
        local lines = splitnewlines(str)
        return simcAplParser(lines, primaryModifier)
    end
end
