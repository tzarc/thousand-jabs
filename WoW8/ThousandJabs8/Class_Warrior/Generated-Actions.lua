if GetBuildInfo and select(4,GetBuildInfo()) < 80000 then return end

if select(3, UnitClass('player')) ~= 1 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs8')

TJ:RegisterActionProfileList('simc::warrior::arms', 'Simulationcraft Warrior Profile: Arms', 1, 1, [[
]])

TJ:RegisterActionProfileList('simc::warrior::fury', 'Simulationcraft Warrior Profile: Fury', 1, 2, [[
]])

TJ:RegisterActionProfileList('simc::warrior::protection', 'Simulationcraft Warrior Profile: Protection', 1, 3, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions=auto_attack
actions+=/intercept
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/lights_judgment
actions+=/call_action_list,name=prot
actions.prot=potion,if=target.time_to_die<25
actions.prot+=/avatar
actions.prot+=/demoralizing_shout
actions.prot+=/ravager,if=talent.ravager.enabled
actions.prot+=/shield_block,if=cooldown.shield_slam.remains=0
actions.prot+=/ignore_pain,if=(!talent.vengeance.enabled&buff.renewed_fury.remains<1.5)|(!talent.vengeance.enabled&rage.deficit>=40)|(buff.vengeance_ignore_pain.up)|(talent.vengeance.enabled&!buff.vengeance_ignore_pain.up&!buff.vengeance_revenge.up&rage<30&!buff.revenge.react)
actions.prot+=/shield_slam
actions.prot+=/revenge,if=(!talent.vengeance.enabled)|(talent.vengeance.enabled&buff.revenge.react&!buff.vengeance_ignore_pain.up)|(buff.vengeance_revenge.up)|(talent.vengeance.enabled&!buff.vengeance_ignore_pain.up&!buff.vengeance_revenge.up&rage>=30)
actions.prot+=/thunder_clap
actions.prot+=/devastate
]])

