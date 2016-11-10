local addonName, internal = ...;
internal.WrapGlobalAccess()
local Z = internal.Z
local L = LibStub("AceLocale-3.0"):GetLocale("ThousandJabs")

local defaultConf = {
    showCleave = true,
    showAoE = true,
    scale = 1,
    inCombatAlpha = 1,
    outOfCombatAlpha = 1,
    backgroundOpacity = 0.3,
    size = {
        singleTarget = 80,
        cleave = 40,
        aoe = 35,
        decrease = 0.7,
    },
    padding = 4,
    position = {
        offsetX = 0,
        offsetY = -180,
        tgtPoint = "CENTER",
    },
    do_debug = false,
}

local function getconf(tbl, key, ...)
    if select('#', ...) == 0 then return tbl[key] end
    local e = tbl[key]
    if not e then return nil end
    return getconf(e, ...)
end

function internal.GetConf(...)
    ThousandJabsDB = ThousandJabsDB or {}
    local res = getconf(ThousandJabsDB, ...)
    if type(res) == "nil" then res = getconf(defaultConf, ...) end
    return res
end

function TJ:GetConf(...)
    return internal.GetConf(...)
end

function TJ:SetConf(...)
    internal.SetConf(...)
end

local function setconf(value, tbl, ...)
    local keys = {...}
    local p = tbl
    for i=1,#keys-1 do
        if not p[keys[i]] then p[keys[i]] = {} end
        p = p[keys[i]]
    end
    p[keys[#keys]] = value
end

function internal.SetConf(value, ...)
    ThousandJabsDB = ThousandJabsDB or {}
    setconf(value, ThousandJabsDB, ...)
end

function internal.GetSpecConf(e)
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    return internal.GetConf("class", classID, "spec", specID, "config", e)
end

function TJ:GetSpecConf(e)
    return internal.GetSpecConf(e)
end

function internal.SetSpecConf(value, e)
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    internal.SetConf(value, "class", classID, "spec", specID, "config", e)
end

function internal.trim(s)
    return ((s or ""):gsub("^%s*(.-)%s*$", "%1"))
end

LibStub("AceConfig-3.0"):RegisterOptionsTable("ThousandJabs", function()
    local options = {
        name = "Thousand Jabs",
        handler = Z,
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
                        order = 10,
                    },
                    showCleave = {
                        type = "toggle",
                        order = 11,
                        name = L["Show Cleave Abilties"],
                        get = function(info)
                            return internal.GetConf("showCleave") and true or false
                        end,
                        set = function(info, val)
                            internal.SetConf(val and true or false, "showCleave")
                            Z:GetModule('UI'):ReapplyLayout()
                        end
                    },
                    showAoE = {
                        type = "toggle",
                        order = 12,
                        name = L["Show AoE Abilties"],
                        get = function(info)
                            return internal.GetConf("showAoE") and true or false
                        end,
                        set = function(info, val)
                            internal.SetConf(val and true or false, "showAoE")
                            Z:GetModule('UI'):ReapplyLayout()
                        end
                    },
                    lockunlock = {
                        type = "execute",
                        order = 13,
                        name = L["Toggle Lock"],
                        func = function()
                            Z:ToggleMovement()
                        end
                    },
                    resetpos = {
                        type = "execute",
                        order = 14,
                        name = L["Reset Position"],
                        func = function()
                            Z:ResetPosition()
                        end
                    },
                    scale = {
                        type = "range",
                        order = 15,
                        name = L["Window Scale"],
                        min = 0.5,
                        max = 2.0,
                        step = 0.05,
                        get = function(info)
                            return internal.GetConf("scale")
                        end,
                        set = function(info, val)
                            internal.SetConf(val, "scale")
                            Z:GetModule('UI'):ReapplyLayout()
                        end
                    },
                    backgroundOpacity = {
                        type = "range",
                        order = 16,
                        name = L["Background Opacity"],
                        min = 0.0,
                        max = 1.0,
                        step = 0.05,
                        get = function(info)
                            return internal.GetConf("backgroundOpacity")
                        end,
                        set = function(info, val)
                            internal.SetConf(val, "backgroundOpacity")
                            Z:GetModule('UI'):ReapplyLayout()
                        end
                    },
                    outOfCombatHide = {
                        type = "toggle",
                        order = 18,
                        name = L["Hide out-of-combat"],
                        get = function(info)
                            return (internal.GetConf("outOfCombatAlpha") == 0) and true or false
                        end,
                        set = function(info, val)
                            internal.SetConf(val and 0 or 1, "outOfCombatAlpha")
                            Z:GetModule('UI'):UpdateAlpha()
                        end
                    },
                    fadingHeader = {
                        type = "header",
                        name = L["Fading"],
                        order = 20,
                    },
                    inCombatAlpha = {
                        type = "range",
                        order = 21,
                        name = L["In-combat alpha"],
                        min = 0,
                        max = 1,
                        step = 0.05,
                        get = function(info)
                            return internal.GetConf("inCombatAlpha")
                        end,
                        set = function(info, val)
                            internal.SetConf(val, "inCombatAlpha")
                            Z:GetModule('UI'):UpdateAlpha()
                        end
                    },
                    outOfCombatAlpha = {
                        type = "range",
                        order = 22,
                        name = L["Out-of-combat alpha"],
                        min = 0,
                        max = 1,
                        step = 0.05,
                        get = function(info)
                            return internal.GetConf("outOfCombatAlpha")
                        end,
                        set = function(info, val)
                            internal.SetConf(val, "outOfCombatAlpha")
                            Z:GetModule('UI'):UpdateAlpha()
                        end
                    },
                    geometryHeader = {
                        type = "header",
                        name = L["Geometry"],
                        order = 30,
                    },
                    singleTargetSize = {
                        type = "range",
                        order = 31,
                        name = L["Single-target Size"],
                        min = 20,
                        max = 300,
                        step = 1,
                        get = function(info)
                            return internal.GetConf("size", "singleTarget")
                        end,
                        set = function(info, val)
                            internal.SetConf(val, "size", "singleTarget")
                            Z:GetModule('UI'):ReapplyLayout()
                        end
                    },
                    cleaveSize = {
                        type = "range",
                        order = 32,
                        name = L["Cleave Size"],
                        min = 20,
                        max = 300,
                        step = 1,
                        get = function(info)
                            return internal.GetConf("size", "cleave")
                        end,
                        set = function(info, val)
                            internal.SetConf(val, "size", "cleave")
                            Z:GetModule('UI'):ReapplyLayout()
                        end
                    },
                    aoeSize = {
                        type = "range",
                        order = 33,
                        name = L["AoE Size"],
                        min = 20,
                        max = 300,
                        step = 1,
                        get = function(info)
                            return internal.GetConf("size", "aoe")
                        end,
                        set = function(info, val)
                            internal.SetConf(val, "size", "aoe")
                            Z:GetModule('UI'):ReapplyLayout()
                        end
                    },
                    nextScale = {
                        type = "range",
                        order = 34,
                        name = L["Next Ability Scale"],
                        min = 0.1,
                        max = 1.0,
                        step = 0.01,
                        get = function(info)
                            return internal.GetConf("size", "decrease")
                        end,
                        set = function(info, val)
                            internal.SetConf(val, "size", "decrease")
                            Z:GetModule('UI'):ReapplyLayout()
                        end
                    },
                    padding = {
                        type = "range",
                        order = 35,
                        name = L["Padding"],
                        min = 0,
                        max = 20,
                        step = 1,
                        get = function(info)
                            return internal.GetConf("padding")
                        end,
                        set = function(info, val)
                            internal.SetConf(val, "padding")
                            Z:GetModule('UI'):ReapplyLayout()
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
            name = internal.fmt("\124T%s:0|t %s", specIcon, specName),
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
                        return internal.GetConf("class", classID, "spec", specID, "disabled") and true or false
                    end,
                    set = function(info, val)
                        internal.SetConf(val and true or false, "class", classID, "spec", specID, "disabled")
                        Z:DeactivateProfile()
                        Z:ActivateProfile()
                    end
                },
            },
        }

        local profile = Z.profiles and Z.profiles[classID] and Z.profiles[classID][specID] or nil

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
                            return internal.GetConf("class", classID, "spec", specID, "config", e) and true or false
                        end,
                        set = function(info, val)
                            internal.SetConf(val and true or false, "class", classID, "spec", specID, "config", e)
                            Z:DeactivateProfile()
                            Z:ActivateProfile()
                            Z:QueueUpdate()
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
                            return internal.GetConf("class", classID, "spec", specID, "config", e)
                        end,
                        set = function(info, val)
                            internal.SetConf(val, "class", classID, "spec", specID, "config", e)
                            Z:DeactivateProfile()
                            Z:ActivateProfile()
                            Z:QueueUpdate()
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

            for k,v in internal.orderedpairs(allActions) do
                order = order + 1
                thisSpecOptions.args[k] = {
                    type = "toggle",
                    order = order,
                    name = k,
                    get = function(info)
                        return internal.GetConf("class", classID, "spec", specID, "blacklist", k) and true or false
                    end,
                    set = function(info, val)
                        internal.SetConf(val and true or false, "class", classID, "spec", specID, "blacklist", k)
                        Z:DeactivateProfile()
                        Z:ActivateProfile()
                        Z:QueueUpdate()
                    end
                }
            end
        end

        options.args[specName] = thisSpecOptions
    end

    return options
end)
LibStub("AceConfigDialog-3.0"):AddToBlizOptions("ThousandJabs", "Thousand Jabs")
