local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')
local L = LibStub("AceLocale-3.0"):GetLocale("ThousandJabs")
local UI = TJ:GetModule("UI")

local AC = LibStub('AceConfig-3.0')
local ACD = LibStub('AceConfigDialog-3.0')

local tinsert = table.insert
local tsort = table.sort

function orderedpairs(t, f)
    local a = {}
    for n in pairs(t) do tinsert(a, n) end
    tsort(a, f)
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

AC:RegisterOptionsTable("Thousand Jabs", function()
    local options = {
        name = "Thousand Jabs",
        handler = TJ,
        type = "group",
        order = 1,
        args = {
            general = {
                name = L["General Settings"],
                type = "group",
                order = 1,
                args = {
                    generalHeader = {
                        type = "header",
                        name = L["General Settings"],
                        order = 100,
                    },
                    lockunlock = {
                        type = "execute",
                        order = 101,
                        name = L["Toggle Lock"],
                        func = function()
                            UI:ToggleMovement()
                        end
                    },
                    resetpos = {
                        type = "execute",
                        order = 102,
                        name = L["Reset Position"],
                        func = function()
                            UI:ResetPosition()
                            UI:UpdateAlpha()
                        end
                    },
                    outOfCombatHide = {
                        type = "toggle",
                        order = 103,
                        name = L["Hide out-of-combat"],
                        get = function(info)
                            return (Config:Get("outOfCombatAlpha") == 0) and true or false
                        end,
                        set = function(info, val)
                            Config:Set(val and 0 or 1, "outOfCombatAlpha")
                            UI:UpdateAlpha()
                        end
                    },
                    allowBetaProfiles = {
                        type = "toggle",
                        order = 104,
                        name = L["Allow Beta Profiles"],
                        get = function(info)
                            return Config:Get("allowBetaProfiles") and true or false
                        end,
                        set = function(info, val)
                            Config:Set(val and true or false, "allowBetaProfiles")
                            TJ:QueueProfileReload()
                            UI:UpdateAlpha()
                        end
                    },
                    displayModeHeader = {
                        type = "header",
                        name = L["Display Mode"],
                        order = 200,
                    },
                    displayMode = {
                        type = "select",
                        name = L["Display Mode"],
                        order = 201,
                        values = {
                            ["separate"] = L["Separate Columns"],
                            ["automatic"] = L["Automatic Target Counting"]
                        },
                        get = function(info)
                            return Config:Get("displayMode")
                        end,
                        set = function(info, val)
                            Config:Set(val, "displayMode")
                            TJ:QueueProfileReload()
                            UI:ReapplyLayout()
                            UI:UpdateAlpha()
                        end
                    },
                    showCleave = {
                        type = "toggle",
                        order = 203,
                        name = L["Show Cleave Abilties"],
                        hidden = function() return Config:Get("displayMode") == "automatic" and true or false end,
                        get = function(info)
                            return Config:Get("showCleave") and true or false
                        end,
                        set = function(info, val)
                            Config:Set(val and true or false, "showCleave")
                            UI:ReapplyLayout()
                            UI:UpdateAlpha()
                        end
                    },
                    showAoE = {
                        type = "toggle",
                        order = 204,
                        name = L["Show AoE Abilties"],
                        hidden = function() return Config:Get("displayMode") == "automatic" and true or false end,
                        get = function(info)
                            return Config:Get("showAoE") and true or false
                        end,
                        set = function(info, val)
                            Config:Set(val and true or false, "showAoE")
                            UI:ReapplyLayout()
                            UI:UpdateAlpha()
                        end
                    },
                    timingHeader = {
                        type = "header",
                        name = L["Timing"],
                        order = 300,
                    },
                    fastUpdateSpeed = {
                        type = "range",
                        order = 301,
                        name = L["Fast update speed"],
                        min = 0.05,
                        max = 0.5,
                        step = 0.05,
                        get = function(info)
                            return Config:Get("fastUpdateSpeed")
                        end,
                        set = function(info, val)
                            Config:Set(val, "fastUpdateSpeed")
                            TJ:QueueProfileReload()
                        end
                    },
                    slowUpdateSpeed = {
                        type = "range",
                        order = 302,
                        name = L["Slow update speed"],
                        min = 0.1,
                        max = 1.0,
                        step = 0.05,
                        get = function(info)
                            return Config:Get("slowUpdateSpeed")
                        end,
                        set = function(info, val)
                            Config:Set(val, "slowUpdateSpeed")
                            TJ:QueueProfileReload()
                        end
                    },
                    resetTiming = {
                        type = "execute",
                        order = 303,
                        name = L["Reset Timing"],
                        func = function()
                            Config:Set(nil, "fastUpdateSpeed")
                            Config:Set(nil, "slowUpdateSpeed")
                            TJ:QueueProfileReload()
                        end
                    },
                    fadingHeader = {
                        type = "header",
                        name = L["Fading"],
                        order = 600,
                    },
                    inCombatAlpha = {
                        type = "range",
                        order = 601,
                        name = L["In-combat alpha"],
                        min = 0,
                        max = 1,
                        step = 0.05,
                        get = function(info)
                            return Config:Get("inCombatAlpha")
                        end,
                        set = function(info, val)
                            Config:Set(val, "inCombatAlpha")
                            UI:UpdateAlpha()
                        end
                    },
                    outOfCombatAlpha = {
                        type = "range",
                        order = 602,
                        name = L["Out-of-combat alpha"],
                        min = 0,
                        max = 1,
                        step = 0.05,
                        get = function(info)
                            return Config:Get("outOfCombatAlpha")
                        end,
                        set = function(info, val)
                            Config:Set(val, "outOfCombatAlpha")
                            UI:UpdateAlpha()
                        end
                    },
                    backgroundOpacity = {
                        type = "range",
                        order = 603,
                        name = L["Background Opacity"],
                        min = 0.0,
                        max = 1.0,
                        step = 0.05,
                        get = function(info)
                            return Config:Get("backgroundOpacity")
                        end,
                        set = function(info, val)
                            Config:Set(val, "backgroundOpacity")
                            UI:ReapplyLayout()
                            UI:UpdateAlpha()
                        end
                    },
                    geometryHeader = {
                        type = "header",
                        name = L["Geometry"],
                        order = 800,
                    },
                    scale = {
                        type = "range",
                        order = 801,
                        name = L["Window Scale"],
                        min = 0.5,
                        max = 2.0,
                        step = 0.05,
                        get = function(info)
                            return Config:Get("geometry", "scale")
                        end,
                        set = function(info, val)
                            Config:Set(val, "geometry", "scale")
                            UI:ReapplyLayout()
                            UI:UpdateAlpha()
                        end
                    },
                    nextScale = {
                        type = "range",
                        order = 802,
                        name = L["Next Ability Scale"],
                        min = 0.1,
                        max = 1.0,
                        step = 0.01,
                        get = function(info)
                            return Config:Get("geometry", "sizeDecrease")
                        end,
                        set = function(info, val)
                            Config:Set(val, "geometry", "sizeDecrease")
                            UI:ReapplyLayout()
                            UI:UpdateAlpha()
                        end
                    },
                    padding = {
                        type = "range",
                        order = 803,
                        name = L["Padding"],
                        min = 0,
                        max = 20,
                        step = 1,
                        get = function(info)
                            return Config:Get("geometry", "padding")
                        end,
                        set = function(info, val)
                            Config:Set(val, "geometry", "padding")
                            UI:ReapplyLayout()
                            UI:UpdateAlpha()
                        end
                    },
                    singleTargetSize = {
                        type = "range",
                        order = 804,
                        name = L["Single-target Size"],
                        min = 20,
                        max = 300,
                        step = 1,
                        get = function(info)
                            return Config:Get("geometry", "singleTargetSize")
                        end,
                        set = function(info, val)
                            Config:Set(val, "geometry", "singleTargetSize")
                            UI:ReapplyLayout()
                            UI:UpdateAlpha()
                        end
                    },
                    cleaveSize = {
                        type = "range",
                        order = 805,
                        name = L["Cleave Size"],
                        hidden = function() return Config:Get("displayMode") == "automatic" and true or false end,
                        min = 20,
                        max = 300,
                        step = 1,
                        get = function(info)
                            return Config:Get("geometry", "cleaveSize")
                        end,
                        set = function(info, val)
                            Config:Set(val, "geometry", "cleaveSize")
                            UI:ReapplyLayout()
                            UI:UpdateAlpha()
                        end
                    },
                    aoeSize = {
                        type = "range",
                        order = 806,
                        name = L["AoE Size"],
                        hidden = function() return Config:Get("displayMode") == "automatic" and true or false end,
                        min = 20,
                        max = 300,
                        step = 1,
                        get = function(info)
                            return Config:Get("geometry", "aoeSize")
                        end,
                        set = function(info, val)
                            Config:Set(val, "geometry", "aoeSize")
                            UI:ReapplyLayout()
                            UI:UpdateAlpha()
                        end
                    },
                    resetGeometry = {
                        type = "execute",
                        order = 807,
                        name = L["Reset Geometry"],
                        func = function()
                            Config:Set(nil, "geometry")
                            UI:ReapplyLayout()
                            UI:UpdateAlpha()
                        end
                    },
                },
            },
        }
    }

    for specID=1,GetNumSpecializations() do
        local _, _, classID = UnitClass("player")
        local _, specName, _, specIcon = GetSpecializationInfo(specID)
        local thisSpecOptions = {
            name = ("\124T%s:0|t %s"):format(specIcon, specName),
            type = "group",
            order = 1000+specID,
            args = {
                specHeader = {
                    type = "header",
                    name = L["Specialisation Settings"],
                    order = 1000,
                },
                profileDisabled = {
                    type = "toggle",
                    order = 1001,
                    name = L["Disable Specialisation"],
                    get = function(info)
                        return Config:Get("class", classID, "spec", specID, "disabled") and true or false
                    end,
                    set = function(info, val)
                        Config:Set(val and true or false, "class", classID, "spec", specID, "disabled")
                        TJ:QueueProfileReload()
                        UI:UpdateAlpha()
                    end
                },
            },
        }

        local profile = TJ.profiles and TJ.profiles[classID] and TJ.profiles[classID][specID] or nil

        if profile and profile.configCheckboxes then
            local order = 2000
            thisSpecOptions.args.specConfigHeader = {
                type = "header",
                name = L["Specialisation Configuration"],
                order = order,
            }

            for e, v in pairs(profile.configCheckboxes) do
                order = order + 1
                if type(v) == "boolean" then
                    thisSpecOptions.args[e] = {
                        type = "toggle",
                        order = order,
                        name = e,
                        get = function(info)
                            local r = Config:Get("class", classID, "spec", specID, "config", e)
                            if type(r) == "nil" then return v end
                            return r and true or false
                        end,
                        set = function(info, val)
                            Config:Set(val and true or false, "class", classID, "spec", specID, "config", e)
                            TJ:QueueProfileReload()
                            UI:UpdateAlpha()
                        end
                    }
                elseif type(v) == "table" and #v == 2 and type(v[1]) == "number" and type(v[2]) == "number" then
                    thisSpecOptions.args[e] = {
                        type = "range",
                        order = order,
                        name = e,
                        min = v[1],
                        max = v[2],
                        get = function(info)
                            return Config:Get("class", classID, "spec", specID, "config", e)
                        end,
                        set = function(info, val)
                            Config:Set(val, "class", classID, "spec", specID, "config", e)
                            TJ:QueueProfileReload()
                            UI:UpdateAlpha()
                        end
                    }
                end
            end
        end

        if profile and profile.parsedActions then
            local order = 3000
            thisSpecOptions.args.abilityHeader = {
                type = "header",
                name = L["Ability Disabling"],
                order = order,
            }
            local allActions = {}

            for aplName,apl in pairs(profile.parsedActions) do
                for _, entry in pairs(apl) do
                    local action = rawget(profile.actions, entry.action)
                    if action then
                        allActions[--[[action.Name or]] entry.action] = entry.action
                    end
                end
            end

            for k,v in orderedpairs(allActions) do
                order = order + 1
                thisSpecOptions.args[k] = {
                    type = "toggle",
                    order = order,
                    name = k,
                    get = function(info)
                        return Config:Get("class", classID, "spec", specID, "blacklist", k) and true or false
                    end,
                    set = function(info, val)
                        Config:Set(val and true or false, "class", classID, "spec", specID, "blacklist", k)
                        TJ:QueueProfileReload()
                        UI:UpdateAlpha()
                    end
                }
            end
        end

        options.args[specName] = thisSpecOptions
    end

    return options
end)

ACD:AddToBlizOptions("Thousand Jabs", "Thousand Jabs")
