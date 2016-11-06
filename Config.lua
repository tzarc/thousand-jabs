local addonName, internal = ...;
internal.WrapGlobalAccess()
local Z = internal.Z
local L = LibStub("AceLocale-3.0"):GetLocale("ThousandJabs")

local defaultConf = {
    scale = 1,
    inCombatAlpha = 1,
    outOfCombatAlpha = 1,
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
    if not res then res = getconf(defaultConf, ...) end
    return res
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
    return internal.GetConf("class", classID, "spec", specID, "config", e) and true or false
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
                    lockunlock = {
                        type = "execute",
                        order = 11,
                        name = L["Toggle Lock"],
                        func = function()
                            Z:ToggleMovement()
                        end
                    },
                    resetpos = {
                        type = "execute",
                        order = 12,
                        name = L["Reset Position"],
                        func = function()
                            Z:ResetPosition()
                        end
                    },
                    scale = {
                        type = "range",
                        order = 13,
                        name = L["Window Scale"],
                        min = 0.5,
                        max = 2.0,
                        step = 0.05,
                        get = function(info)
                            return internal.GetConf("scale")
                        end,
                        set = function(info, val)
                            internal.SetConf(val, "scale")
                            Z.actionsFrame:SetScale(val)
                        end
                    },
                    outOfCombatHide = {
                        type = "toggle",
                        order = 14,
                        name = L["Hide out-of-combat"],
                        get = function(info)
                            return (internal.GetConf("outOfCombatAlpha") == 0) and true or false
                        end,
                        set = function(info, val)
                            internal.SetConf(val and 0 or 1, "outOfCombatAlpha")
                            Z:UpdateAlpha()
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
                            Z:UpdateAlpha()
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
                            Z:UpdateAlpha()
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
