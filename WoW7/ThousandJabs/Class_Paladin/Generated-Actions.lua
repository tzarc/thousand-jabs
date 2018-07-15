if GetBuildInfo and select(4,GetBuildInfo()) >= 80000 then return end

if select(3, UnitClass('player')) ~= 2 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')

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
actions.prot=shield_of_the_righteous,if=!talent.seraphim.enabled&(action.shield_of_the_righteous.charges>2)&!(debuff.eye_of_tyr.up&buff.aegis_of_light.up&buff.ardent_defender.up&buff.guardian_of_ancient_kings.up&buff.divine_shield.up&buff.potion.up)
actions.prot+=/bastion_of_light,if=!talent.seraphim.enabled&talent.bastion_of_light.enabled&action.shield_of_the_righteous.charges<1
actions.prot+=/light_of_the_protector,if=(health.pct<40)
actions.prot+=/hand_of_the_protector,if=(health.pct<40)
actions.prot+=/light_of_the_protector,if=(incoming_damage_10000ms<health.max*1.25)&health.pct<55&talent.righteous_protector.enabled
actions.prot+=/light_of_the_protector,if=(incoming_damage_13000ms<health.max*1.6)&health.pct<55
actions.prot+=/hand_of_the_protector,if=(incoming_damage_6000ms<health.max*0.7)&health.pct<65&talent.righteous_protector.enabled
actions.prot+=/hand_of_the_protector,if=(incoming_damage_9000ms<health.max*1.2)&health.pct<55
actions.prot+=/divine_steed,if=!talent.seraphim.enabled&talent.knight_templar.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/eye_of_tyr,if=!talent.seraphim.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/aegis_of_light,if=!talent.seraphim.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/guardian_of_ancient_kings,if=!talent.seraphim.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/divine_shield,if=!talent.seraphim.enabled&talent.final_stand.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/ardent_defender,if=!talent.seraphim.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/lay_on_hands,if=!talent.seraphim.enabled&health.pct<15
actions.prot+=/potion,name=old_war,if=buff.avenging_wrath.up&talent.seraphim.enabled&active_enemies<3
actions.prot+=/potion,name=prolonged_power,if=buff.avenging_wrath.up&talent.seraphim.enabled&active_enemies>=3
actions.prot+=/potion,name=unbending_potion,if=!talent.seraphim.enabled
actions.prot+=/stoneform,if=!talent.seraphim.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/avenging_wrath,if=!talent.seraphim.enabled
actions.prot+=/judgment,if=!talent.seraphim.enabled
actions.prot+=/avengers_shield,if=!talent.seraphim.enabled&talent.crusaders_judgment.enabled&buff.grand_crusader.up
actions.prot+=/blessed_hammer,if=!talent.seraphim.enabled
actions.prot+=/avengers_shield,if=!talent.seraphim.enabled
actions.prot+=/consecration,if=!talent.seraphim.enabled
actions.prot+=/hammer_of_the_righteous,if=!talent.seraphim.enabled
actions.prot+=/seraphim,if=talent.seraphim.enabled&action.shield_of_the_righteous.charges>=2
actions.prot+=/avenging_wrath,if=talent.seraphim.enabled&(buff.seraphim.up|cooldown.seraphim.remains<4)
actions.prot+=/ardent_defender,if=talent.seraphim.enabled&buff.seraphim.up
actions.prot+=/shield_of_the_righteous,if=talent.seraphim.enabled&(cooldown.consecration.remains>=0.1&(action.shield_of_the_righteous.charges>2.5&cooldown.seraphim.remains>3)|(buff.seraphim.up))
actions.prot+=/eye_of_tyr,if=talent.seraphim.enabled&equipped.151812&buff.seraphim.up
actions.prot+=/avengers_shield,if=talent.seraphim.enabled
actions.prot+=/judgment,if=talent.seraphim.enabled&(active_enemies<2|set_bonus.tier20_2pc)
actions.prot+=/consecration,if=talent.seraphim.enabled&(buff.seraphim.remains>6|buff.seraphim.down)
actions.prot+=/judgment,if=talent.seraphim.enabled
actions.prot+=/consecration,if=talent.seraphim.enabled
actions.prot+=/eye_of_tyr,if=talent.seraphim.enabled&!equipped.151812
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
actions+=/call_action_list,name=opener,if=time<2
actions+=/call_action_list,name=cooldowns
actions+=/call_action_list,name=generators
actions.cooldowns=potion,if=(buff.bloodlust.react|buff.avenging_wrath.up|buff.crusade.up&buff.crusade.remains<25|target.time_to_die<=40)
actions.cooldowns+=/blood_fury
actions.cooldowns+=/berserking
actions.cooldowns+=/arcane_torrent,if=(buff.crusade.up|buff.avenging_wrath.up)&holy_power=2&(cooldown.blade_of_justice.remains>gcd|cooldown.divine_hammer.remains>gcd)
actions.cooldowns+=/lights_judgment,if=spell_targets.lights_judgment>=2|(!raid_event.adds.exists|raid_event.adds.in>15)&cooldown.judgment.remains>gcd&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd)&(buff.avenging_wrath.up|buff.crusade.stack>=15)
actions.cooldowns+=/holy_wrath
actions.cooldowns+=/shield_of_vengeance
actions.cooldowns+=/avenging_wrath
actions.cooldowns+=/crusade,if=holy_power>=3|((equipped.137048|race.blood_elf)&holy_power>=2)
actions.finishers=execution_sentence,if=spell_targets.divine_storm<=3&(cooldown.judgment.remains<gcd*4.25|debuff.judgment.remains>gcd*4.25)
actions.finishers+=/divine_storm,if=debuff.judgment.up&variable.ds_castable&buff.divine_purpose.react
actions.finishers+=/divine_storm,if=debuff.judgment.up&variable.ds_castable&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)
actions.finishers+=/justicars_vengeance,if=debuff.judgment.up&buff.divine_purpose.react&!equipped.137020&!talent.final_verdict.enabled
actions.finishers+=/templars_verdict,if=debuff.judgment.up&buff.divine_purpose.react
actions.finishers+=/templars_verdict,if=debuff.judgment.up&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)&(!talent.execution_sentence.enabled|cooldown.execution_sentence.remains>gcd)
actions.generators=variable,name=ds_castable,value=spell_targets.divine_storm>=2|(buff.scarlet_inquisitors_expurgation.stack>=29&(equipped.144358&(dot.wake_of_ashes.ticking&time>10|dot.wake_of_ashes.remains<gcd))|(buff.scarlet_inquisitors_expurgation.stack>=29&(buff.avenging_wrath.up|buff.crusade.up&buff.crusade.stack>=15|cooldown.crusade.remains>15&!buff.crusade.up)|cooldown.avenging_wrath.remains>15)&!equipped.144358)
actions.generators+=/judgment,if=set_bonus.tier21_4pc
actions.generators+=/call_action_list,name=finishers,if=(buff.crusade.up&buff.crusade.stack<15|buff.liadrins_fury_unleashed.up)|(talent.wake_of_ashes.enabled&cooldown.wake_of_ashes.remains<gcd*2)
actions.generators+=/call_action_list,name=finishers,if=talent.execution_sentence.enabled&(cooldown.judgment.remains<gcd*4.25|debuff.judgment.remains>gcd*4.25)&cooldown.execution_sentence.up|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd*1.5
actions.generators+=/judgment,if=dot.execution_sentence.ticking&dot.execution_sentence.remains<gcd*2&debuff.judgment.remains<gcd*2
actions.generators+=/blade_of_justice,if=holy_power<=2&(set_bonus.tier20_2pc|set_bonus.tier20_4pc)
actions.generators+=/divine_hammer,if=holy_power<=2&(set_bonus.tier20_2pc|set_bonus.tier20_4pc)
actions.generators+=/wake_of_ashes,if=(!raid_event.adds.exists|raid_event.adds.in>15)&(holy_power<=0|holy_power=1&(cooldown.blade_of_justice.remains>gcd|cooldown.divine_hammer.remains>gcd)|holy_power=2&((cooldown.zeal.charges_fractional<=0.65|cooldown.crusader_strike.charges_fractional<=0.65)))
actions.generators+=/blade_of_justice,if=holy_power<=3&!set_bonus.tier20_4pc
actions.generators+=/divine_hammer,if=holy_power<=3&!set_bonus.tier20_4pc
actions.generators+=/judgment
actions.generators+=/call_action_list,name=finishers,if=buff.divine_purpose.up
actions.generators+=/zeal,if=cooldown.zeal.charges_fractional>=1.65&holy_power<=4&(cooldown.blade_of_justice.remains>gcd*2|cooldown.divine_hammer.remains>gcd*2)&debuff.judgment.remains>gcd
actions.generators+=/crusader_strike,if=cooldown.crusader_strike.charges_fractional>=1.65&holy_power<=4&(cooldown.blade_of_justice.remains>gcd*2|cooldown.divine_hammer.remains>gcd*2)&debuff.judgment.remains>gcd&(talent.greater_judgment.enabled|!set_bonus.tier20_4pc&talent.the_fires_of_justice.enabled)
actions.generators+=/consecration
actions.generators+=/hammer_of_justice,if=equipped.137065&target.health.pct>=75&holy_power<=4
actions.generators+=/call_action_list,name=finishers
actions.generators+=/zeal
actions.generators+=/crusader_strike
actions.opener=blood_fury
actions.opener+=/berserking
actions.opener+=/arcane_torrent,if=!set_bonus.tier20_2pc
actions.opener+=/judgment
actions.opener+=/blade_of_justice,if=equipped.137048|race.blood_elf|!cooldown.wake_of_ashes.up
actions.opener+=/divine_hammer,if=equipped.137048|race.blood_elf|!cooldown.wake_of_ashes.up
actions.opener+=/wake_of_ashes
]])

