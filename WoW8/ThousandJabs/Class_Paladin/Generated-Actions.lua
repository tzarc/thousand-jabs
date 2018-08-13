if GetBuildInfo and select(4,GetBuildInfo()) < 80000 then return end

if select(3, UnitClass('player')) ~= 2 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')

TJ:RegisterActionProfileList('simc::paladin::protection', 'Simulationcraft Paladin Profile: Protection', 2, 2, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions=auto_attack
actions+=/fireblood,if=buff.avenging_wrath.up
actions+=/seraphim,if=cooldown.shield_of_the_righteous.charges_fractional>=2
actions+=/avenging_wrath,if=buff.seraphim.up|cooldown.seraphim.remains<2|!talent.seraphim.enabled
actions+=/potion,if=buff.avenging_wrath.up
actions+=/shield_of_the_righteous,if=(buff.avengers_valor.up&cooldown.shield_of_the_righteous.charges_fractional>=2.5)&(cooldown.seraphim.remains>gcd|!talent.seraphim.enabled)
actions+=/shield_of_the_righteous,if=(cooldown.shield_of_the_righteous.charges_fractional=3&cooldown.avenger_shield.remains>(2*gcd))
actions+=/shield_of_the_righteous,if=(buff.avenging_wrath.up&!talent.seraphim.enabled)|buff.seraphim.up&buff.avengers_valor.up
actions+=/shield_of_the_righteous,if=(buff.avenging_wrath.up&buff.avenging_wrath.remains<4&!talent.seraphim.enabled)|(buff.seraphim.remains<4&buff.seraphim.up)
actions+=/use_items,if=buff.seraphim.up|!talent.seraphim.enabled
actions+=/lights_judgment,if=buff.seraphim.up&buff.seraphim.remains<3
actions+=/avengers_shield,if=((cooldown.shield_of_the_righteous.charges_fractional>2.5&!buff.avengers_valor.up)|active_enemies>=2)&cooldown_react
actions+=/judgment,if=(cooldown.judgment.remains<gcd&cooldown.judgment.charges_fractional>1&cooldown_react)|!talent.crusaders_judgment.enabled
actions+=/avengers_shield,,if=cooldown_react
actions+=/consecration,if=(cooldown.judgment.remains<=gcd&!talent.crusaders_judgment.enabled)|cooldown.avenger_shield.remains<=gcd&consecration.remains<gcd
actions+=/consecration,if=!talent.crusaders_judgment.enabled&consecration.remains<(cooldown.judgment.remains+cooldown.avengers_shield.remains)&consecration.remains<3*gcd
actions+=/judgment,if=cooldown_react|!talent.crusaders_judgment.enabled
actions+=/lights_judgment,if=!talent.seraphim.enabled|buff.seraphim.up
actions+=/blessed_hammer
actions+=/hammer_of_the_righteous
actions+=/consecration
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
actions.cooldowns+=/fireblood,if=buff.avenging_wrath.up|buff.crusade.up&buff.crusade.stack=10
actions.cooldowns+=/shield_of_vengeance
actions.cooldowns+=/avenging_wrath,if=buff.inquisition.up|!talent.inquisition.enabled
actions.cooldowns+=/crusade,if=holy_power>=4
actions.finishers=variable,name=ds_castable,value=spell_targets.divine_storm>=3|!talent.righteous_verdict.enabled&talent.divine_judgment.enabled&spell_targets.divine_storm>=2|azerite.divine_right.enabled&target.health.pct<=20&buff.divine_right.down
actions.finishers+=/inquisition,if=buff.inquisition.down|buff.inquisition.remains<5&holy_power>=3|talent.execution_sentence.enabled&cooldown.execution_sentence.remains<10&buff.inquisition.remains<15|cooldown.avenging_wrath.remains<15&buff.inquisition.remains<20&holy_power>=3
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
actions.opener+=/sequence,if=talent.wake_of_ashes.enabled&talent.inquisition.enabled,name=wake_opener_Inq:shield_of_vengeance:blade_of_justice:judgment:inquisition:avenging_wrath:wake_of_ashes
]])

