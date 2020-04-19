------------------------------------------------------------------------------------------------------------------------
-- BfA only.
------------------------------------------------------------------------------------------------------------------------
if GetBuildInfo and (select(4, GetBuildInfo()) < 80000 or select(4, GetBuildInfo()) >= 90000) then
    return
end

------------------------------------------------------------------------------------------------------------------------
if select(2, UnitClass('player')) ~= 'MAGE' then return end

local addonName, internal = ...
local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
local Config = TJ:GetModule('Config')

if not Core:MatchesBuild('8.3.0', '8.3.9') then return end

local mmin = math.min

------------------------------------------------------------------------------------------------------------------------
-- Frost profile definition
------------------------------------------------------------------------------------------------------------------------

-- exported with /tj _esd
local frost_abilities_exported = {
    }

TJ:RegisterPlayerClass({
    name = 'Frost',
    class_id = 8,
    spec_id = 3,
    default_action_profile = 'simc::mage::frost',
    resources = { 'mana' },
    actions = {
        frost_abilities_exported,
    },
    blacklisted = {
    },
})
