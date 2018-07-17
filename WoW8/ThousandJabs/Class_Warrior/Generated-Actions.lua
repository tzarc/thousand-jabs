if GetBuildInfo and select(4,GetBuildInfo()) < 80000 then return end

if select(3, UnitClass('player')) ~= 1 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')

TJ:RegisterActionProfileList('simc::warrior::arms', 'Simulationcraft Warrior Profile: Arms', 1, 1, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions=charge
actions+=/auto_attack
actions+=/potion
actions+=/blood_fury,if=debuff.colossus_smash.up
actions+=/berserking,if=debuff.colossus_smash.up
actions+=/arcane_torrent,if=debuff.colossus_smash.down&cooldown.mortal_strike.remains>1.5&rage<50
actions+=/lights_judgment,if=debuff.colossus_smash.down
actions+=/avatar,if=cooldown.colossus_smash.remains<8|(talent.warbreaker.enabled&cooldown.warbreaker.remains<8)
actions+=/sweeping_strikes,if=spell_targets.whirlwind>1
actions+=/run_action_list,name=five_target,if=spell_targets.whirlwind>4
actions+=/run_action_list,name=execute,if=(talent.massacre.enabled&target.health.pct<35)|target.health.pct<20
actions+=/run_action_list,name=single_target
actions.execute=rend,if=remains<=duration*0.3&debuff.colossus_smash.down
actions.execute+=/skullsplitter,if=rage<70&((cooldown.deadly_calm.remains>3&!buff.deadly_calm.up)|!talent.deadly_calm.enabled)
actions.execute+=/deadly_calm,if=cooldown.bladestorm.remains>6&((cooldown.colossus_smash.remains<2|(talent.warbreaker.enabled&cooldown.warbreaker.remains<2))|(equipped.weight_of_the_earth&cooldown.heroic_leap.remains<2))
actions.execute+=/colossus_smash,if=debuff.colossus_smash.down
actions.execute+=/warbreaker,if=debuff.colossus_smash.down
actions.execute+=/heroic_leap,if=equipped.weight_of_the_earth&debuff.colossus_smash.down&((cooldown.colossus_smash.remains>8&!prev_gcd.1.colossus_smash)|(talent.warbreaker.enabled&cooldown.warbreaker.remains>8&!prev_gcd.1.warbreaker))
actions.execute+=/bladestorm,if=debuff.colossus_smash.remains>4.5&rage<70&(!buff.deadly_calm.up|!talent.deadly_calm.enabled)
actions.execute+=/ravager,if=debuff.colossus_smash.up&(cooldown.deadly_calm.remains>6|!talent.deadly_calm.enabled)
actions.execute+=/mortal_strike,if=buff.overpower.stack=2&(talent.dreadnaught.enabled|equipped.archavons_heavy_hand)
actions.execute+=/overpower
actions.execute+=/execute,if=rage>=40|debuff.colossus_smash.up|buff.sudden_death.react|buff.stone_heart.react
actions.five_target=skullsplitter,if=rage<70&(cooldown.deadly_calm.remains>3|!talent.deadly_calm.enabled)
actions.five_target+=/deadly_calm,if=cooldown.bladestorm.remains>6&((cooldown.colossus_smash.remains<2|(talent.warbreaker.enabled&cooldown.warbreaker.remains<2))|(equipped.weight_of_the_earth&cooldown.heroic_leap.remains<2))
actions.five_target+=/colossus_smash,if=debuff.colossus_smash.down
actions.five_target+=/warbreaker,if=debuff.colossus_smash.down
actions.five_target+=/heroic_leap,if=equipped.weight_of_the_earth&debuff.colossus_smash.down&((cooldown.colossus_smash.remains>8&!prev_gcd.1.colossus_smash)|(talent.warbreaker.enabled&cooldown.warbreaker.remains>8&!prev_gcd.1.warbreaker))
actions.five_target+=/bladestorm,if=buff.sweeping_strikes.down&debuff.colossus_smash.remains>4.5&(prev_gcd.1.mortal_strike|spell_targets.whirlwind>1)&(!buff.deadly_calm.up|!talent.deadly_calm.enabled)
actions.five_target+=/ravager,if=debuff.colossus_smash.up&(cooldown.deadly_calm.remains>6|!talent.deadly_calm.enabled)
actions.five_target+=/execute,if=(!talent.cleave.enabled&dot.deep_wounds.remains<2)|(buff.sudden_death.react|buff.stone_heart.react)&(buff.sweeping_strikes.up|cooldown.sweeping_strikes.remains>8)
actions.five_target+=/mortal_strike,if=(!talent.cleave.enabled&dot.deep_wounds.remains<2)|buff.sweeping_strikes.up&buff.overpower.stack=2&(talent.dreadnaught.enabled|equipped.archavons_heavy_hand)
actions.five_target+=/whirlwind,if=debuff.colossus_smash.up
actions.five_target+=/overpower
actions.five_target+=/whirlwind
actions.single_target=rend,if=remains<=duration*0.3&debuff.colossus_smash.down
actions.single_target+=/skullsplitter,if=rage<70&(cooldown.deadly_calm.remains>3|!talent.deadly_calm.enabled)
actions.single_target+=/deadly_calm,if=cooldown.bladestorm.remains>6&((cooldown.colossus_smash.remains<2|(talent.warbreaker.enabled&cooldown.warbreaker.remains<2))|(equipped.weight_of_the_earth&cooldown.heroic_leap.remains<2))
actions.single_target+=/colossus_smash,if=debuff.colossus_smash.down
actions.single_target+=/warbreaker,if=debuff.colossus_smash.down
actions.single_target+=/heroic_leap,if=equipped.weight_of_the_earth&debuff.colossus_smash.down&((cooldown.colossus_smash.remains>8&!prev_gcd.1.colossus_smash)|(talent.warbreaker.enabled&cooldown.warbreaker.remains>8&!prev_gcd.1.warbreaker))
actions.single_target+=/execute,if=buff.sudden_death.react|buff.stone_heart.react
actions.single_target+=/bladestorm,if=buff.sweeping_strikes.down&debuff.colossus_smash.remains>4.5&(prev_gcd.1.mortal_strike|spell_targets.whirlwind>1)&(!buff.deadly_calm.up|!talent.deadly_calm.enabled)
actions.single_target+=/ravager,if=debuff.colossus_smash.up&(cooldown.deadly_calm.remains>6|!talent.deadly_calm.enabled)
actions.single_target+=/mortal_strike
actions.single_target+=/overpower
actions.single_target+=/whirlwind,if=talent.fervor_of_battle.enabled&(rage>=50|debuff.colossus_smash.up)
actions.single_target+=/slam,if=!talent.fervor_of_battle.enabled&(rage>=40|debuff.colossus_smash.up)
]])

TJ:RegisterActionProfileList('simc::warrior::fury', 'Simulationcraft Warrior Profile: Fury', 1, 2, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions=auto_attack
actions+=/charge
actions+=/run_action_list,name=movement,if=movement.distance>5
actions+=/heroic_leap,if=(raid_event.movement.distance>25&raid_event.movement.in>45)|!raid_event.movement.exists
actions+=/potion
actions+=/furious_slash,if=talent.furious_slash.enabled&(buff.furious_slash.stack<3|buff.furious_slash.remains<3|(cooldown.recklessness.remains<3&buff.furious_slash.remains<9))
actions+=/bloodthirst,if=equipped.kazzalax_fujiedas_fury&(buff.fujiedas_fury.down|remains<2)
actions+=/rampage,if=cooldown.recklessness.remains<3
actions+=/recklessness
actions+=/whirlwind,if=spell_targets.whirlwind>1&!buff.whirlwind.up
actions+=/blood_fury,if=buff.recklessness.up
actions+=/berserking,if=buff.recklessness.up
actions+=/arcane_torrent,if=rage<40&!buff.recklessness.up
actions+=/lights_judgment,if=cooldown.recklessness.remains<3
actions+=/run_action_list,name=single_target
actions.movement=heroic_leap
actions.single_target=siegebreaker,if=buff.recklessness.up|cooldown.recklessness.remains>28
actions.single_target+=/rampage,if=buff.recklessness.up|(talent.frothing_berserker.enabled|talent.carnage.enabled&(buff.enrage.remains<gcd|rage>90)|talent.massacre.enabled&(buff.enrage.remains<gcd|rage>90))
actions.single_target+=/execute,if=buff.enrage.up
actions.single_target+=/bloodthirst,if=buff.enrage.down
actions.single_target+=/raging_blow,if=charges=2
actions.single_target+=/bloodthirst
actions.single_target+=/bladestorm,if=prev_gcd.1.rampage&(buff.siegebreaker.up|!talent.siegebreaker.enabled)
actions.single_target+=/dragon_roar,if=buff.enrage.up&(buff.siegebreaker.up|!talent.siegebreaker.enabled)
actions.single_target+=/raging_blow,if=talent.carnage.enabled|(talent.massacre.enabled&rage<80)|(talent.frothing_berserker.enabled&rage<90)
actions.single_target+=/furious_slash,if=talent.furious_slash.enabled
actions.single_target+=/whirlwind
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

