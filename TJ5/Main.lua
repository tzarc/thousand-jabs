local addonName = ...

local print = print
local type = type

LibStub('LibSandbox-5.0'):UseSandbox(addonName)

local TJ = TJ

TJ:Print(type(_G['TJ']))

afkjhasfkjashf = 523987429137
TJ:Print(TJ:Format('%s', afkjhasfkjashf))

function TJ:DX()
    DevTools_Dump{{TJ=TJ}}
end
