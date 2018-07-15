if GetBuildInfo and select(4,GetBuildInfo()) < 80000 then return end

if select(3, UnitClass('player')) ~= 2 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs8')

TJ:RegisterActionProfileList('simc::paladin::protection', 'Simulationcraft Paladin Profile: Protection', 2, 2, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions=auto_attack
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/lights_judgment
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/lights_judgment
actions+=/call_action_list,name=prot
actions.max_dps=auto_attack
actions.max_dps+=/blood_fury
actions.max_dps+=/berserking
actions.max_dps+=/arcane_torrent
actions.max_dps+=/lights_judgment
actions.max_survival=auto_attack
actions.max_survival+=/blood_fury
actions.max_survival+=/berserking
actions.max_survival+=/arcane_torrent
actions.max_survival+=/lights_judgment
actions.prot=shield_of_the_righteous,if=!talent.seraphim.enabled&(action.shield_of_the_righteous.charges>2)&!(buff.aegis_of_light.up&buff.ardent_defender.up&buff.guardian_of_ancient_kings.up&buff.divine_shield.up&buff.potion.up)
actions.prot+=/bastion_of_light,if=!talent.seraphim.enabled&talent.bastion_of_light.enabled&action.shield_of_the_righteous.charges<1
actions.prot+=/light_of_the_protector,if=(health.pct<40)
actions.prot+=/hand_of_the_protector,if=(health.pct<40)
actions.prot+=/light_of_the_protector,if=(incoming_damage_10000ms<health.max*1.25)&health.pct<55&talent.righteous_protector.enabled
actions.prot+=/light_of_the_protector,if=(incoming_damage_13000ms<health.max*1.6)&health.pct<55
actions.prot+=/hand_of_the_protector,if=(incoming_damage_6000ms<health.max*0.7)&health.pct<65&talent.righteous_protector.enabled
actions.prot+=/hand_of_the_protector,if=(incoming_damage_9000ms<health.max*1.2)&health.pct<55
actions.prot+=/aegis_of_light,if=!talent.seraphim.enabled&incoming_damage_2500ms>health.max*0.4&!(buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/guardian_of_ancient_kings,if=!talent.seraphim.enabled&incoming_damage_2500ms>health.max*0.4&!(buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/divine_shield,if=!talent.seraphim.enabled&talent.final_stand.enabled&incoming_damage_2500ms>health.max*0.4&!(buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/ardent_defender,if=!talent.seraphim.enabled&incoming_damage_2500ms>health.max*0.4&!(buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/lay_on_hands,if=!talent.seraphim.enabled&health.pct<15
actions.prot+=/potion,name=old_war,if=buff.avenging_wrath.up&talent.seraphim.enabled&active_enemies<3
actions.prot+=/potion,name=prolonged_power,if=buff.avenging_wrath.up&talent.seraphim.enabled&active_enemies>=3
actions.prot+=/potion,name=unbending_potion,if=!talent.seraphim.enabled
actions.prot+=/stoneform,if=!talent.seraphim.enabled&incoming_damage_2500ms>health.max*0.4&!(buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/avenging_wrath,if=!talent.seraphim.enabled
actions.prot+=/judgment,if=!talent.seraphim.enabled
actions.prot+=/avengers_shield,if=!talent.seraphim.enabled&talent.crusaders_judgment.enabled
actions.prot+=/blessed_hammer,if=!talent.seraphim.enabled
actions.prot+=/avengers_shield,if=!talent.seraphim.enabled
actions.prot+=/consecration,if=!talent.seraphim.enabled
actions.prot+=/hammer_of_the_righteous,if=!talent.seraphim.enabled
actions.prot+=/seraphim,if=talent.seraphim.enabled&action.shield_of_the_righteous.charges>=2
actions.prot+=/avenging_wrath,if=talent.seraphim.enabled&(buff.seraphim.up|cooldown.seraphim.remains<4)
actions.prot+=/shield_of_the_righteous,if=talent.seraphim.enabled&(cooldown.consecration.remains>=0.1&(action.shield_of_the_righteous.charges>2.5&cooldown.seraphim.remains>3)|(buff.seraphim.up))
actions.prot+=/avengers_shield,if=talent.seraphim.enabled
actions.prot+=/judgment,if=talent.seraphim.enabled&(active_enemies<2|set_bonus.tier20_2pc)
actions.prot+=/consecration,if=talent.seraphim.enabled&(buff.seraphim.remains>6|buff.seraphim.down)
actions.prot+=/judgment,if=talent.seraphim.enabled
actions.prot+=/consecration,if=talent.seraphim.enabled
actions.prot+=/blessed_hammer,if=talent.seraphim.enabled
actions.prot+=/hammer_of_the_righteous,if=talent.seraphim.enabled
]])

TJ:RegisterActionProfileList('simc::paladin::retribution', 'Simulationcraft Paladin Profile: Retribution', 2, 3, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions=auto_attack
actions+=/rebuke
actions+=/call_action_list,name=opener
actions+=/call_action_list,name=cooldowns
actions+=/call_action_list,name=generators
actions.cooldowns=potion,if=(buff.bloodlust.react|buff.avenging_wrath.up|buff.crusade.up&buff.crusade.remains<25|target.time_to_die<=40)
actions.cooldowns+=/lights_judgment,if=spell_targets.lights_judgment>=2|(!raid_event.adds.exists|raid_event.adds.in>75)
actions.cooldowns+=/shield_of_vengeance
actions.cooldowns+=/avenging_wrath,if=buff.inquisition.up|!talent.inquisition.enabled
actions.cooldowns+=/crusade,if=holy_power>=4
actions.finishers=variable,name=ds_castable,value=spell_targets.divine_storm>=3|talent.divine_judgment.enabled&spell_targets.divine_storm>=2|azerite.divine_right.enabled&target.health.pct<=20&buff.divine_right.down
actions.finishers+=/inquisition,if=buff.inquisition.down|buff.inquisition.remains<5&holy_power>=3|talent.execution_sentence.enabled&cooldown.execution_sentence.remains<10&buff.inquisition.remains<15
actions.finishers+=/execution_sentence,if=spell_targets.divine_storm<=3&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)
actions.finishers+=/divine_storm,if=variable.ds_castable&buff.divine_purpose.react
actions.finishers+=/divine_storm,if=variable.ds_castable&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)
actions.finishers+=/templars_verdict,if=buff.divine_purpose.react&(!talent.execution_sentence.enabled|cooldown.execution_sentence.remains>gcd)
actions.finishers+=/templars_verdict,if=(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)&(!talent.execution_sentence.enabled|buff.crusade.up&buff.crusade.stack<10|cooldown.execution_sentence.remains>gcd*2)
actions.generators=variable,name=HoW,value=(!talent.hammer_of_wrath.enabled|target.health.pct>=20&(buff.avenging_wrath.down|buff.crusade.down))
actions.generators+=/call_action_list,name=finishers,if=holy_power>=5
actions.generators+=/wake_of_ashes,if=(!raid_event.adds.exists|raid_event.adds.in>20)&(holy_power<=0|holy_power=1&cooldown.blade_of_justice.remains>gcd)
actions.generators+=/blade_of_justice,if=holy_power<=2|(holy_power=3&(cooldown.hammer_of_wrath.remains>gcd*2|variable.HoW))
actions.generators+=/judgment,if=holy_power<=2|(holy_power<=4&(cooldown.blade_of_justice.remains>gcd*2|variable.HoW))
actions.generators+=/hammer_of_wrath,if=holy_power<=4
actions.generators+=/consecration,if=holy_power<=2|holy_power<=3&cooldown.blade_of_justice.remains>gcd*2|holy_power=4&cooldown.blade_of_justice.remains>gcd*2&cooldown.judgment.remains>gcd*2
actions.generators+=/call_action_list,name=finishers,if=talent.hammer_of_wrath.enabled&(target.health.pct<=20|buff.avenging_wrath.up|buff.crusade.up)&(buff.divine_purpose.up|buff.crusade.stack<10)
actions.generators+=/crusader_strike,if=cooldown.crusader_strike.charges_fractional>=1.75&(holy_power<=2|holy_power<=3&cooldown.blade_of_justice.remains>gcd*2|holy_power=4&cooldown.blade_of_justice.remains>gcd*2&cooldown.judgment.remains>gcd*2&cooldown.consecration.remains>gcd*2)
actions.generators+=/call_action_list,name=finishers
actions.generators+=/crusader_strike,if=holy_power<=4
actions.generators+=/arcane_torrent,if=(debuff.execution_sentence.up|(talent.hammer_of_wrath.enabled&(target.health.pct>=20|buff.avenging_wrath.down|buff.crusade.down))|!talent.execution_sentence.enabled|!talent.hammer_of_wrath.enabled)&holy_power<=4
actions.opener=sequence,if=talent.wake_of_ashes.enabled&talent.crusade.enabled&talent.execution_sentence.enabled&!talent.hammer_of_wrath.enabled,name=wake_opener_ES_CS:shield_of_vengeance:blade_of_justice:judgment:crusade:templars_verdict:wake_of_ashes:templars_verdict:crusader_strike:execution_sentence
actions.opener+=/sequence,if=talent.wake_of_ashes.enabled&talent.crusade.enabled&!talent.execution_sentence.enabled&!talent.hammer_of_wrath.enabled,name=wake_opener_CS:shield_of_vengeance:blade_of_justice:judgment:crusade:templars_verdict:wake_of_ashes:templars_verdict:crusader_strike:templars_verdict
actions.opener+=/sequence,if=talent.wake_of_ashes.enabled&talent.crusade.enabled&talent.execution_sentence.enabled&talent.hammer_of_wrath.enabled,name=wake_opener_ES_HoW:shield_of_vengeance:blade_of_justice:judgment:crusade:templars_verdict:wake_of_ashes:templars_verdict:hammer_of_wrath:execution_sentence
actions.opener+=/sequence,if=talent.wake_of_ashes.enabled&talent.crusade.enabled&!talent.execution_sentence.enabled&talent.hammer_of_wrath.enabled,name=wake_opener_HoW:shield_of_vengeance:blade_of_justice:judgment:crusade:templars_verdict:wake_of_ashes:templars_verdict:hammer_of_wrath:templars_verdict
]])

