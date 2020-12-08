if GetBuildInfo and (select(4, GetBuildInfo()) < 90000 or select(4, GetBuildInfo()) >= 100000) then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')
local Core = TJ:GetModule('Core')
TJ.Generated = TJ.Generated or {}
TJ.Generated.EquippedMapping = TJ.Generated.EquippedMapping or {}

