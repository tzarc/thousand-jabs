local _, internal = ...;
local Z = internal.Z
local L = LibStub("AceLocale-3.0"):GetLocale("ThousandJabs")

local defaultConf = {
    scale = 1,
    inCombatAlpha = 1,
    outOfCombatAlpha = 1,
    x = 0,
    y = -80,
    anchor = "CENTER",
    do_debug = false,
}

function internal.GetConf(...)
    local function getconf(tbl, ...)
        local keys = {...}
        local p = tbl
        for i=1,#keys do
            if not p[keys[i]] then return nil end
            p = p[keys[i]]
        end
        return p
    end
    ThousandJabsDB = ThousandJabsDB or {}
    local res = getconf(ThousandJabsDB, ...)
    if not res then res = getconf(defaultConf, ...) end
    return res
end

function internal.SetConf(value, ...)
    local function setconf(value, tbl, ...)
        local keys = {...}
        local p = tbl
        for i=1,#keys-1 do
            if not p[keys[i]] then p[keys[i]] = {} end
            p = p[keys[i]]
        end
        p[keys[#keys]] = value
    end
    ThousandJabsDB = ThousandJabsDB or {}
    setconf(value, ThousandJabsDB, ...)
end

function internal.GetSpecConf(e)
    local classID, specID = select(3, UnitClass('player')), GetSpecialization()
    return internal.GetConf("class", classID, "spec", specID, "config", e) and true or false
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

    for i=1,GetNumSpecializations() do
        local _, _, classId = UnitClass("player")
        local specId, specName, _, specIcon = GetSpecializationInfo(i)
        local thisSpecOptions = {
            name = internal.fmt("\124T%s:0|t %s", specIcon, specName),
            type = "group",
            order = 1000+i,
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
                        return internal.GetConf("class", classId, "spec", i, "disabled") and true or false
                    end,
                    set = function(info, val)
                        internal.SetConf(val and true or false, "class", classId, "spec", i, "disabled")
                        Z:DeactivateProfile()
                        Z:ActivateProfile()
                    end
                },
            },
        }

        local profile = Z.profiles and Z.profiles[classId] and Z.profiles[classId][i] or nil

        if profile and profile.configCheckboxes then
            local order = 2000
            thisSpecOptions.args.specConfigHeader = {
                type = "header",
                name = L["Specialisation Configuration"],
                order = order,
            }

            for _, e in pairs(profile.configCheckboxes) do
                order = order + 1
                thisSpecOptions.args[e] = {
                    type = "toggle",
                    order = order,
                    name = e,
                    get = function(info)
                        return internal.GetConf("class", classId, "spec", i, "config", e) and true or false
                    end,
                    set = function(info, val)
                        internal.SetConf(val and true or false, "class", classId, "spec", i, "config", e)
                        Z:DeactivateProfile()
                        Z:ActivateProfile()
                        Z:QueueUpdate()
                    end
                }
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
                    local action = rawget(profile.actions, entry.name)
                    if action then
                        allActions[--[[action.Name or]] entry.name] = entry.name
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
                        return internal.GetConf("class", classId, "spec", i, "blacklist", k) and true or false
                    end,
                    set = function(info, val)
                        internal.SetConf(val and true or false, "class", classId, "spec", i, "blacklist", k)
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
