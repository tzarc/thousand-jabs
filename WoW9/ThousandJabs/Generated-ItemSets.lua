if GetBuildInfo and (select(4, GetBuildInfo()) < 90000 or select(4, GetBuildInfo()) >= 100000) then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
TJ.Generated = TJ.Generated or {}
TJ.Generated.ItemSets = TJ.Generated.ItemSets or {}

TJ.Generated.ItemSets.gift_of_the_loa = {
    165512, 165567,
}

TJ.Generated.ItemSets.journey_through_time = {
    137419, 137487,
}

TJ.Generated.ItemSets.keepsakes = {
    165566, 165604,
}

TJ.Generated.ItemSets.march_of_the_legion = {
    134529, 134533,
}

TJ.Generated.ItemSets.tier19p_cloth = {
    134424, 134432,
}

TJ.Generated.ItemSets.tier19p_leather = {
    137397, 137480,
}

TJ.Generated.ItemSets.tier19p_mail = {
    134480, 137405,
}

TJ.Generated.ItemSets.tier19p_plate = {
    134503, 134518,
}

TJ.Generated.ItemSets.titanic_empowerment = {
    174500, 174528,
}

TJ.Generated.ItemSets.waycrests_legacy = {
    158362, 159631,
}

