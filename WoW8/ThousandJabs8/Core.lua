--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BfA only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) < 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Addon definition.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local addonName, TJ, _ = ...
local LibStub = LibStub

-- Dev mode flag
local devMode = false
TJ.devMode = devMode

-- Modules
local ThousandJabsGlobal = {}
local Config = {}
local UI = {}
local UnitCache = {}
local SpellBook = {}
TJ.ThousandJabsGlobal = ThousandJabsGlobal
TJ.Config = Config
TJ.UI = UI
TJ.UnitCache = UnitCache
TJ.SpellBook = SpellBook

-- Debug log helper
local DBG = function(...) TJ:AddDebugLog(...) end
TJ.DBG = DBG

_G[addonName] = ThousandJabsGlobal
if devMode then _G['TJ'] = TJ end

-- Command
local SLASH_TJ1 = '/tj'
_G['SLASH_TJ1'] = SLASH_TJ1

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local CreateFrame = CreateFrame
local debugprofilestop = debugprofilestop
local debugstack = debugstack
local GetAddOnCPUUsage = GetAddOnCPUUsage
local GetAddOnMemoryUsage = GetAddOnMemoryUsage
local GetTime = GetTime
local InCombatLockdown = InCombatLockdown
local mceil = math.ceil
local mmax = math.max
local mmin = math.min
local NewTicker = C_Timer.NewTicker
local pairs = pairs
local pcall = pcall
local print = print
local select = select
local SlashCmdList = SlashCmdList
local tconcat = table.concat
local tContains = tContains
local tinsert = table.insert
local tonumber = tonumber
local tostring = tostring
local tremove = table.remove
local tsort = table.sort
local type = type
local UIParent = UIParent
local UISpecialFrames = UISpecialFrames
local unpack = unpack
local UpdateAddOnCPUUsage = UpdateAddOnCPUUsage
local UpdateAddOnMemoryUsage = UpdateAddOnMemoryUsage
local wipe = wipe

local CBH = LibStub('CallbackHandler-1.0')
local LSD = LibStub('LibTJSerpentDump-8.0')
local LSM = LibStub('LibSharedMedia-3.0')
local PRF = LibStub('LibTJProfiling-8.0')
local Sandbox = LibStub('LibTJSandbox-8.0')
local TableCache = LibStub('LibTJTableCache-8.0')

-- Table cache helpers
local CT = TableCache.Acquire
local RT = TableCache.Release
TJ.CT = CT
TJ.RT = RT

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TJ sandboxing
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Sandbox:New(addonName)
Sandbox:Use(addonName)
Sandbox:AllowPassthrough(addonName, 'ThousandJabsDB', addonName..'InfoFrameDialogBG', addonName..'InfoFrameTitleBG')

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Event/Callback notifications:
--
--   TJ:RegisterEvent('PLAYER_ENTERING_WORLD') ---> Invokes TJ:PLAYER_ENTERING_WORLD() when event PLAYER_ENTERING_WORLD received
--   TJ.RegisterEvent(Module, 'PLAYER_ENTERING_WORLD') ---> Invokes Module:PLAYER_ENTERING_WORLD() when event PLAYER_ENTERING_WORLD received
--
--   TJ:RegisterCallback('CALLBACK_NAME') ---> Invokes TJ:CALLBACK_NAME()
--   TJ.RegisterCallback('myFuncToken', 'CALLBACK_NAME', myFunc) ---> Invokes myFunc()
--   TJ.RegisterCallback(Module, 'CALLBACK_NAME') ---> Invokes Module:CALLBACK_NAME()
--
-- Available internal callbacks:
--   VARIABLES_LOADED -- Fired when the normal WoW VARIABLES_LOADED event is received
--   CONFIG_CHANGED -- Fired whenever one of the config values changed (or after variables loaded), allows other components to update their local copies
--   LOGIN_COMPLETED -- When VARIABLES_LOADED and PLAYER_ENTERING_WORLD have both fired
--   TIME_SLICE -- Run every 0.05 seconds or so, the standard ThousandJabs execution throttling time.
--
-- Available external callbacks:
--   LOGIN_COMPLETED -- When VARIABLES_LOADED and PLAYER_ENTERING_WORLD have both fired, and all of the internal ThousandJabs LOGIN_COMPLETED callbacks have fired
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    local mixins = { 'RegisterCallback', 'UnregisterCallback', 'RegisterEvent', 'UnregisterEvent', 'InvokeCallbacks', 'InvokeExternalCallbacks' }
    local function attachMixins(src, ...)
        local tbls = {...}
        for _,tbl in pairs(tbls) do
            for _,e in pairs(mixins) do
                if src[e] then
                    tbl[e] = src[e]
                end
            end
        end
    end

    local externalCallbacks = {}
    local externalCallbackRegistry = CBH:New(externalCallbacks, 'RegisterCallback', 'UnregisterCallback', false)
    attachMixins(externalCallbacks, ThousandJabsGlobal)

    local callbacks = {}
    local callbackRegistry = CBH:New(callbacks, 'RegisterCallback', 'UnregisterCallback', false)
    callbacks.InvokeCallbacks = callbackRegistry.Fire
    callbacks.InvokeExternalCallbacks = externalCallbackRegistry.Fire
    attachMixins(callbacks, TJ, Config, UI, UnitCache, SpellBook)

    local events = {}
    local eventRegistry = CBH:New(events, 'RegisterEvent', 'UnregisterEvent', false)
    local eventFrame = CreateFrame('Frame', addonName..'_EventFrame')
    attachMixins(events, TJ, Config, UI, UnitCache, SpellBook)

    eventFrame:SetScript('OnEvent', function(_, eventName, ...)
        --TJ:DevPrint('%s -- %d args', eventName, select('#', ...))
        eventRegistry:Fire(eventName, ...)
    end)
    eventFrame:Show()

    function eventRegistry:OnUsed(_, eventName)
        eventFrame:RegisterEvent(eventName)
    end

    function eventRegistry:OnUnused(_, eventName)
        eventFrame:UnregisterEvent(eventName)
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Config values
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local doDebug = false
local doProfiling = false

TJ.RegisterCallback('CoreConfigUpdate', 'CONFIG_CHANGED', function()
    TJ:DevPrint('CONFIG_CHANGED(CoreConfigUpdate)')

    doDebug = Config:Get('doDebug')
    if doDebug then
        TJ:ShowDebugLog()
    else
        TJ:HideDebugLog()
    end

    doProfiling = Config:Get('doProfiling')
    PRF:EnableProfiling(doProfiling)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Main pulse loop
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    -- Time slice execution
    local quickestUpdateTime = 0.05
    local timeSlice

    TJ.RegisterCallback('TimerStart', 'LOGIN_COMPLETED', function()
        TJ:DevPrint('LOGIN_COMPLETED(TimerStart)')

        timeSlice = NewTicker(quickestUpdateTime, function()
            TJ:InvokeCallbacks('TIME_SLICE')
        end)
    end)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Unknown field sandbox getter/setter observers
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    local otherErrors = {}
    local globalReadNames = {}
    local globalReads = {}
    local globalWrites = {}

    local function trim(s) return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)' end

    local function globalReadObserver(key)
        local stack = trim(debugstack(3))
        local file, line = stack:match('(.-):(.-):')
        local tableKey = ('%s:%s:%d'):format(tostring(key), file, line)

        -- Keep track of the stacks of every global read we haven't made a local copy for
        if not globalReads[tableKey] then
            globalReads[tableKey] = { stack = stack, line = tonumber(line), key = tostring(key), keyType = type(key) }
        end

        -- Keep track of just the names, so we can export them and copy/paste into the specific file
        globalReadNames[file] = globalReadNames[file] or {}
        globalReadNames[file][key] = true
    end

    local function globalWriteObserver(key, val)
        local stack = trim(debugstack(3))
        local file, line = stack:match('(.-):(.-):')
        local tableKey = ('%s:%s:%d'):format(tostring(key), file, line)

        -- Keep track of the stacks of every global write we haven't made a local copy for
        if not globalWrites[tableKey] then
            globalWrites[tableKey] = { stack = stack, line = tonumber(line), key = tostring(key), keyType = type(key), value = tostring(val), valueType = type(val) }
        end
    end

    Sandbox:AttachObservers(addonName, globalReadObserver, globalWriteObserver)

    TJ.errors = TJ.errors or {}
    TJ.errors.otherErrors, TJ.errors.globalReadNames, TJ.errors.globalReads, TJ.errors.globalWrites = otherErrors, globalReadNames, globalReads, globalWrites
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function TJ:Format(f, ...)
    return ((select('#', ...) > 0) and f:format(...) or (type(f) == 'string' and f) or tostring(f) or '')
end


do
    local printPrefix = '|cFF00FFFFT|cFF00EFFFh|cFF00DFFFo|cFF00CFFFu|cFF00BFFFs|cFF00AFFFa|cFF009FFFn|cFF008FFFd|cFF007FFFJ|cFF006FFFa|cFF005FFFb|cFF004FFFs|r'
    local debugPrefix = function() return ('%.3f:'):format(debugprofilestop()) end
    function TJ:Print(...)
        print(printPrefix, self:Format(...))
    end

    function TJ:DevPrint(...)
        if devMode then
            print(printPrefix, debugPrefix(), self:Format(...))
        end
    end

    local printedOnce = {}

    function TJ:PrintOnce(...)
        local text = self:Format(...)
        if not printedOnce[text] then
            printedOnce[text] = true
            print(printPrefix, text)
        end
    end

    function TJ:DevPrintOnce(...)
        if devMode then
            local text = self:Format(...)
            if not printedOnce[text] then
                printedOnce[text] = true
                print(printPrefix, debugPrefix, text)
            end
        end
    end
end

do
    local function orderedPairsDispatch(state)
        state.idx = state.idx + 1
        local k = state.keys[state.idx]
        if k == nil then
            state.tbl = nil
            state.td(state)
            return nil
        else
            return k, state.tbl[k]
        end
    end

    local function unspecifiedTableCreator() return {} end
    local function unspecifiedTableDestroyer() end

    function TJ:OrderedPairs(tbl, f, initialTableCreatedByCreator, tableCreator, tableDestroyer)
        local tc = tableCreator or unspecifiedTableCreator
        local state = initialTableCreatedByCreator or tc()
        wipe(state)
        state.idx = 0
        state.tbl = tbl
        state.keys = tc()
        state.td = tableDestroyer or unspecifiedTableDestroyer
        for n in pairs(tbl) do tinsert(state.keys, n) end
        tsort(state.keys, f)
        return orderedPairsDispatch, state
    end

    function TJ:OrderedPairsTC(tbl, tmpTableCreatedByCT, f) -- internally uses the TableCache system, requires a TableCache-created table to be supplied as the state table, so that it can be released externally
        return self:OrderedPairs(tbl, f, tmpTableCreatedByCT, CT, RT)
    end
end

function TJ:LoadFunctionString(funcStr, name)
    local loader, errStr = loadstring('return (' .. funcStr .. ')', name)
    if errStr then
        self:PrintOnce('Error loading function for %s:\n%s', name, errStr)
    else
        local success, retval = pcall(assert(loader))
        if success then
            return retval
        else
            self:PrintOnce('Error creating function for %s:\n%s', name, tostring(retval))
        end
    end
end

function TJ:MatchesBuild(tripletFrom, tripletTo)
    tripletTo = tripletTo or tripletFrom
    local f1, f2, f3 = tripletFrom:match('(%d+)%.(%d+)%.(%d+)')
    local f = tonumber(f1)*10000000000 + tonumber(f2)*100000000 + tonumber(f3)*1000000
    local t1, t2, t3 = tripletTo:match('(%d+)%.(%d+)%.(%d+)')
    local t = tonumber(t1)*10000000000 + tonumber(t2)*100000000 + tonumber(t3)*1000000
    local c1, c2, c3 = GetBuildInfo():match('(%d+)%.(%d+)%.(%d+)')
    local c = tonumber(c1)*10000000000 + tonumber(c2)*100000000 + tonumber(c3)*1000000
    return (f <= c and c <= t) and true or false
end

function TJ:MergeTables(...)
    local target = {}
    for i=1,select('#', ...) do
        local t = select(i, ...)
        if t then
            for k,v in pairs(t) do
                if type(target[k]) == 'table' and type(v) == 'table' then
                    target[k] = self:MergeTables(target[k], v)
                elseif not target[k] then
                    target[k] = v
                end
            end
        end
    end
    return target
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Error handling
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    local errorThrown = false
    local otherErrors = TJ.errors.otherErrors

    function TJ:Error(fulltxt)
        if not tContains(otherErrors, fulltxt) then
            otherErrors[1+#otherErrors] = fulltxt
            if not errorThrown then
                self:Print('|cFFFF0000Well, this is problematic. It seems Thousand Jabs has encountered an error:|r')
                self:Print('|cFFFF9900Please raise a ticket on the project page on curseforge, and paste the output from the command: |cFFFFFF00/tj ticket|r')
            end
            errorThrown = true
        end
    end

    Sandbox:AttachObservers(addonName, devMode and function() TJ:Error('Error with global read.') end or nil, function() TJ:Error('Error with global write.') end)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Command handler
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    local slashHandlers = {}
    local slashHelpText = {}
    local slashCmdArgs = {}
    function SlashCmdList.TJ(msg, editbox)
        local args = {}
        for w in msg:gmatch('%S+') do args[1+#args] = w end
        local first = args[1] or ''
        tremove(args, 1)
        local handler = slashHandlers[first]
        if handler then
            handler(unpack(args))
        else
            TJ:Print('Unknown command: "%s"', tostring(first))
        end
    end

    function TJ:RegisterCommandHandler(command, helptxt, handler, args)
        if type(command) ~= 'string' then
            self:Error(self:Format('Command "%s" is not a string type', tostring(command)))
        end
        if type(helptxt) ~= 'string' then
            self:Error(self:Format('Help text for command "%s" is not a string type', tostring(command)))
        end
        if type(handler) ~= 'function' then
            self:Error(self:Format('Handler for command "%s" is not a function type', tostring(command)))
        end
        slashHelpText[command] = helptxt
        slashHandlers[command] = handler
        slashCmdArgs[command] = args or ''
    end

    function TJ:ShowHelp()
        self:Print('|cFFFF9900Chat commands:|r')
        for cmd, help in self:OrderedPairsTC(slashHelpText) do
            if cmd ~= '' and cmd:sub(1, 1) ~= '_' then
                self:Print('     |cFFFFCC00%s %s %s|r - %s', SLASH_TJ1, cmd, slashCmdArgs[cmd], help)
            end
        end
        if devMode then
            self:Print('|cFFFF9900Debugging commands:|r')
            for cmd, help in self:OrderedPairsTC(slashHelpText) do
                if cmd:sub(1, 1) == '_' then
                    self:Print('     |cFFFFCC00%s %s %s|r - %s', SLASH_TJ1, cmd, slashCmdArgs[cmd], help)
                end
            end
        end
    end

    TJ:RegisterCommandHandler('', 'Shows command help.', function() TJ:ShowHelp() end)
    TJ:RegisterCommandHandler('help', 'Shows command help.', function() TJ:ShowHelp() end)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Logged table, logs errors when accessing fields which don't exist
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    local function targetFieldName(tableName, key)
        return type(key) == 'number' and ('%s[%d]'):format(tableName, tostring(key)) or ('%s.%s'):format(tableName, tostring(key))
    end

    local tableNames = {}
    local missingFieldMetatable = {
        __index = function(tbl, key)
            local tableName = (type(tableNames[tbl]) == 'string' and tableNames[tbl] or 'UNKNOWN_TABLE')
            local header
            local stack = debugstack(2)
            if type(key) == 'nil' then
                header = TJ:Format('Attempted to index table "%s" with nil key.', tableName)
            elseif type(key) == 'table' then
                header = TJ:Format('Attempted to index table "%s" with key of type table.', tableName)
            else
                header = TJ:Format('Missing field: "%s"', targetFieldName(tableName, key))
            end
            if header then
                local errtxt = TJ:Format('%s\n%s', header, stack)
                TJ:Error(errtxt)
            end
        end
    }

    function TJ:MissingFieldTable(tableName, tbl)
        tableNames[tbl] = tableName
        setmetatable(tbl, { __index = missingFieldMetatable.__index, __name = tableName })
        for k, v in pairs(tbl) do
            if type(v) == 'table' then
                tbl[k] = self:MissingFieldTable(targetFieldName(tableName, k), v)
            end
        end
        return tbl
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Login handler
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    local variablesLoaded = false
    local enteredWorld = false

    local function tryPerformLoginHandler()
        if variablesLoaded and enteredWorld then
            TJ:InvokeCallbacks('LOGIN_COMPLETED')
            TJ:InvokeExternalCallbacks('LOGIN_COMPLETED')
        end
    end

    TJ.RegisterEvent('LoginVariables', 'VARIABLES_LOADED', function()
        if not variablesLoaded then
            variablesLoaded = true
            TJ:InvokeCallbacks('VARIABLES_LOADED')
            tryPerformLoginHandler()
        end
    end)

    TJ.RegisterEvent('LoginEnteringWorld', 'PLAYER_ENTERING_WORLD', function()
        if not enteredWorld then
            enteredWorld = true
            tryPerformLoginHandler()
        end
    end)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Information Export Dialog Frame
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    LSM:Register('font', 'Iosevka Tzarc', ([[Interface\AddOns\%s\Assets\iosevka-tzarc\iosevka-tzarc-regular.ttf]]):format(addonName))

    local infoFrame

    local function createInfoFrame()
        local infoFont = LSM:Fetch('font', 'Iosevka Tzarc')
        local infoFrameName = addonName..'InfoFrame'
        local infoFrame = CreateFrame('Frame', infoFrameName, UIParent, 'UIPanelDialogTemplate')
        local infoFrameBG = _G[infoFrameName..'TitleBG']
        local infoFrameChildBG = _G[infoFrameName..'DialogBG']
        infoFrame:SetSize(mmax(300, UIParent:GetWidth()/3), mmax(200, UIParent:GetHeight()/3))
        infoFrame:SetPoint('CENTER')
        infoFrame:Hide()
        infoFrame:SetAlpha(0.8)
        infoFrame:SetFrameStrata('DIALOG')

        infoFrame.Title = infoFrame:CreateFontString(infoFrameName..'TitleOverlay', 'OVERLAY', 'GameFontHighlight')
        infoFrame.Title:SetJustifyH('LEFT')
        infoFrame.Title:SetJustifyV('CENTER')
        infoFrame.Title:SetPoint('TOPLEFT', infoFrameBG, 8, 0)
        infoFrame.Title:SetPoint('BOTTOMRIGHT', infoFrameBG, -8, 0)
        infoFrame.Title:SetTextColor(0.7, 0.7, 0.7, 1.0)
        infoFrame.Title:SetFont(infoFont, 9, 'OUTLINE')

        local scrollFrameInset = 14
        infoFrame.ScrollFrame = CreateFrame('ScrollFrame', infoFrameName..'ScrollFrame', infoFrame, 'InputScrollFrameTemplate')
        infoFrame.ScrollFrame.CharCount:Hide()
        infoFrame.ScrollFrame:SetPoint('TOPLEFT', infoFrameChildBG, scrollFrameInset, -scrollFrameInset-4)
        infoFrame.ScrollFrame:SetPoint('BOTTOMRIGHT', infoFrameChildBG, -scrollFrameInset, scrollFrameInset)

        infoFrame.EditBox = infoFrame.ScrollFrame.EditBox
        infoFrame.EditBox:SetFontObject('ChatFontNormal')
        infoFrame.EditBox:SetAllPoints(true)
        infoFrame.EditBox:SetWidth(infoFrame.ScrollFrame:GetWidth())
        infoFrame.EditBox:SetFont(infoFont, 9, 'SHADOW')

        infoFrame.EditBox:SetScript('OnEscapePressed', function() infoFrame.EditBox:ClearFocus() infoFrame.EditBox:HighlightText(0, 0) end) -- on <ESC> in editbox, clear focus+selection
        tinsert(UISpecialFrames, infoFrameName) -- on <ESC> without editbox focus, close window automatically

        return infoFrame
    end

    function TJ:ShowInfoDialog(title, str, preselect)
        infoFrame = infoFrame or createInfoFrame()
        infoFrame.Title:SetText(addonName .. ' -- ' .. title)
        infoFrame.EditBox:SetText(str)
        infoFrame:Show()
        self:DeferExecution(0.1, function() infoFrame.ScrollFrame:SetVerticalScroll(0) end) -- scroll to top, apparently a screen update is required before the scrolling actually kicks in
        if preselect then
            infoFrame.EditBox:HighlightText()
            infoFrame.EditBox:SetFocus(true)
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Debugging
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
do
    TJ:RegisterCommandHandler('_dbg', 'Enables debugging overlay.', function()
        local newValue = not doDebug
        Config:Set(newValue, 'doDebug')
    end)

    TJ:RegisterCommandHandler('_prof', 'Toggles profiling.', function()
        local newValue = not doProfiling
        Config:Set(newValue, 'doProfiling')
    end)

    TJ:RegisterCommandHandler('_db', 'Dumps SavedVariables.', function()
        TJ:ShowInfoDialog('SavedVariables Export', LSD(ThousandJabsDB))
    end)

    TJ:RegisterCommandHandler('_duc', 'Dumps UnitCache.', function()
        TJ:ShowInfoDialog('UnitCache Export', LSD(UnitCache.unitCache))
    end)

    TJ:RegisterCommandHandler('_err', 'Dumps errors.', function()
        TJ:ShowInfoDialog('Errors', LSD({errors=TJ.errors}))
    end)

    TJ:RegisterCommandHandler('_dtc', 'Dumps table cache metrics.', function()
        local metrics = TableCache.GetMetrics()
        TJ:Print('Table cache -- Allocated: %d, Acquired: %d, Released: %d', metrics.TotalAllocated, metrics.TotalAcquired, metrics.TotalReleased)
    end)

    local logFont = LSM:Fetch('font', 'Iosevka Tzarc')
    local logFrame = CreateFrame('Frame', addonName..'Log', UIParent)
    logFrame:ClearAllPoints()
    logFrame:SetPoint('TOPLEFT', UIParent, 'TOPLEFT', 550, -20)
    logFrame:SetPoint('BOTTOMRIGHT', UIParent, 'BOTTOMRIGHT', -20, 20)

    local logFrameText = logFrame:CreateFontString(addonName..'LogText', 'OVERLAY', 'GameFontHighlightSmall')
    logFrameText:SetJustifyH('LEFT')
    logFrameText:SetJustifyV('TOP')
    logFrameText:SetPoint('TOPLEFT', 8, -8)
    logFrameText:SetPoint('BOTTOMRIGHT', -8, 8)
    logFrameText:SetTextColor(0.7, 0.7, 0.7, 1.0)
    logFrameText:SetFont(logFont, 9, 'OUTLINE')

    logFrame:Hide()

    local logData = {}

    function TJ:AddDebugLog(...)
        if doDebug and logFrame:IsVisible() then
            if #logData == 0 then logData[1] = self:Format('|cFFFFFFFF%s Debug log|r (|cFF00FFFFhide with %s _dbg|r):', addonName, SLASH_TJ1) end
            local a = ...
            if type(a) == 'table' and select('#', ...) == 1 then
                logData[1+#logData] = self:Format('|cFFFFFF99%s|r', LSD(a))
            else
                logData[1+#logData] = self:Format(...)
            end
        end
    end

    function TJ:ClearDebugLog()
        wipe(logData)
    end

    function TJ:ShowDebugLog()
        self:DevPrint('Showing debug log')
        logFrame:Show()
    end

    function TJ:HideDebugLog()
        self:DevPrint('Hiding debug log')
        logFrame:Hide()
    end

    function TJ:UpdateDebugLog()
        if doDebug and logFrame:IsVisible() then
            logFrameText:SetText(tconcat(logData, '\n'))
        end
    end
end
