if select(3, UnitClass('player')) ~= 7 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')

TJ:RegisterActionProfileList('simc::shaman::elemental', 'Simulationcraft Shaman Profile: Elemental', 7, 1, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/totem_mastery
actions.precombat+=/stormkeeper
actions=bloodlust,if=target.health.pct<25|time>0.500
actions+=/potion,if=cooldown.fire_elemental.remains>280|target.time_to_die<=60
actions+=/wind_shear
actions+=/totem_mastery,if=buff.resonance_totem.remains<2
actions+=/fire_elemental
actions+=/storm_elemental
actions+=/elemental_mastery
actions+=/use_items
actions+=/use_item,name=gnawed_thumb_ring,if=equipped.gnawed_thumb_ring&(talent.ascendance.enabled&!buff.ascendance.up|!talent.ascendance.enabled)
actions+=/blood_fury,if=!talent.ascendance.enabled|buff.ascendance.up|cooldown.ascendance.remains>50
actions+=/berserking,if=!talent.ascendance.enabled|buff.ascendance.up
actions+=/run_action_list,name=aoe,if=active_enemies>2&(spell_targets.chain_lightning>2|spell_targets.lava_beam>2)
actions+=/run_action_list,name=single_asc,if=talent.ascendance.enabled
actions+=/run_action_list,name=single_if,if=talent.icefury.enabled
actions+=/run_action_list,name=single_lr,if=talent.lightning_rod.enabled
actions.aoe=stormkeeper
actions.aoe+=/ascendance
actions.aoe+=/liquid_magma_totem
actions.aoe+=/flame_shock,if=spell_targets.chain_lightning<4&maelstrom>=20,target_if=refreshable
actions.aoe+=/earthquake
actions.aoe+=/lava_burst,if=dot.flame_shock.remains>cast_time&buff.lava_surge.up&!talent.lightning_rod.enabled&spell_targets.chain_lightning<4
actions.aoe+=/elemental_blast,if=!talent.lightning_rod.enabled&spell_targets.chain_lightning<5|talent.lightning_rod.enabled&spell_targets.chain_lightning<4
actions.aoe+=/lava_beam
actions.aoe+=/chain_lightning,target_if=debuff.lightning_rod.down
actions.aoe+=/chain_lightning
actions.aoe+=/lava_burst,moving=1
actions.aoe+=/flame_shock,moving=1,target_if=refreshable
actions.single_asc=ascendance,if=dot.flame_shock.remains>buff.ascendance.duration&(time>=60|buff.bloodlust.up)&cooldown.lava_burst.remains>0&!buff.stormkeeper.up
actions.single_asc+=/flame_shock,if=!ticking|dot.flame_shock.remains<=gcd
actions.single_asc+=/flame_shock,if=maelstrom>=20&remains<=buff.ascendance.duration&cooldown.ascendance.remains+buff.ascendance.duration<=duration
actions.single_asc+=/elemental_blast
actions.single_asc+=/earthquake,if=buff.echoes_of_the_great_sundering.up&!buff.ascendance.up&maelstrom>=86
actions.single_asc+=/earth_shock,if=maelstrom>=117|!artifact.swelling_maelstrom.enabled&maelstrom>=92
actions.single_asc+=/stormkeeper,if=raid_event.adds.count<3|raid_event.adds.in>50
actions.single_asc+=/liquid_magma_totem,if=raid_event.adds.count<3|raid_event.adds.in>50
actions.single_asc+=/lightning_bolt,if=buff.power_of_the_maelstrom.up&buff.stormkeeper.up&spell_targets.chain_lightning<3
actions.single_asc+=/lava_burst,if=dot.flame_shock.remains>cast_time&(cooldown_react|buff.ascendance.up)
actions.single_asc+=/flame_shock,if=maelstrom>=20&buff.elemental_focus.up,target_if=refreshable
actions.single_asc+=/earth_shock,if=maelstrom>=111|!artifact.swelling_maelstrom.enabled&maelstrom>=86
actions.single_asc+=/totem_mastery,if=buff.resonance_totem.remains<10|(buff.resonance_totem.remains<(buff.ascendance.duration+cooldown.ascendance.remains)&cooldown.ascendance.remains<15)
actions.single_asc+=/earthquake,if=buff.echoes_of_the_great_sundering.up|artifact.seismic_storm.enabled&((active_enemies>1&spell_targets.chain_lightning>1)|spell_haste<=0.66&!(buff.bloodlust.up&buff.bloodlust.remains<5))
actions.single_asc+=/lava_beam,if=active_enemies>1&spell_targets.lava_beam>1
actions.single_asc+=/lightning_bolt,if=buff.power_of_the_maelstrom.up&spell_targets.chain_lightning<3
actions.single_asc+=/chain_lightning,if=active_enemies>1&spell_targets.chain_lightning>1
actions.single_asc+=/lightning_bolt
actions.single_asc+=/flame_shock,moving=1,target_if=refreshable
actions.single_asc+=/earth_shock,moving=1
actions.single_asc+=/flame_shock,moving=1,if=movement.distance>6
actions.single_if=flame_shock,if=!ticking|dot.flame_shock.remains<=gcd
actions.single_if+=/earthquake,if=buff.echoes_of_the_great_sundering.up&maelstrom>=86
actions.single_if+=/frost_shock,if=buff.icefury.up&maelstrom>=111
actions.single_if+=/elemental_blast
actions.single_if+=/earth_shock,if=maelstrom>=117|!artifact.swelling_maelstrom.enabled&maelstrom>=92
actions.single_if+=/stormkeeper,if=raid_event.adds.count<3|raid_event.adds.in>50
actions.single_if+=/icefury,if=raid_event.movement.in<5|maelstrom<=101
actions.single_if+=/liquid_magma_totem,if=raid_event.adds.count<3|raid_event.adds.in>50
actions.single_if+=/lightning_bolt,if=buff.power_of_the_maelstrom.up&buff.stormkeeper.up&spell_targets.chain_lightning<3
actions.single_if+=/lava_burst,if=dot.flame_shock.remains>cast_time&cooldown_react
actions.single_if+=/frost_shock,if=buff.icefury.up&((maelstrom>=20&raid_event.movement.in>buff.icefury.remains)|buff.icefury.remains<(1.5*spell_haste*buff.icefury.stack+1))
actions.single_if+=/flame_shock,if=maelstrom>=20&buff.elemental_focus.up,target_if=refreshable
actions.single_if+=/frost_shock,moving=1,if=buff.icefury.up
actions.single_if+=/earth_shock,if=maelstrom>=111|!artifact.swelling_maelstrom.enabled&maelstrom>=86
actions.single_if+=/totem_mastery,if=buff.resonance_totem.remains<10
actions.single_if+=/earthquake,if=buff.echoes_of_the_great_sundering.up|artifact.seismic_storm.enabled&((active_enemies>1&spell_targets.chain_lightning>1)|spell_haste<=0.66&!(buff.bloodlust.up&buff.bloodlust.remains<5))
actions.single_if+=/lightning_bolt,if=buff.power_of_the_maelstrom.up&spell_targets.chain_lightning<3
actions.single_if+=/chain_lightning,if=active_enemies>1&spell_targets.chain_lightning>1
actions.single_if+=/lightning_bolt
actions.single_if+=/flame_shock,moving=1,target_if=refreshable
actions.single_if+=/earth_shock,moving=1
actions.single_if+=/flame_shock,moving=1,if=movement.distance>6
actions.single_lr=flame_shock,if=!ticking|dot.flame_shock.remains<=gcd
actions.single_lr+=/earthquake,if=buff.echoes_of_the_great_sundering.up&maelstrom>=86
actions.single_lr+=/elemental_blast
actions.single_lr+=/earth_shock,if=maelstrom>=117|!artifact.swelling_maelstrom.enabled&maelstrom>=92
actions.single_lr+=/stormkeeper,if=raid_event.adds.count<3|raid_event.adds.in>50
actions.single_lr+=/liquid_magma_totem,if=raid_event.adds.count<3|raid_event.adds.in>50
actions.single_lr+=/lava_burst,if=dot.flame_shock.remains>cast_time&cooldown_react
actions.single_lr+=/flame_shock,if=maelstrom>=20&buff.elemental_focus.up,target_if=refreshable
actions.single_lr+=/earth_shock,if=maelstrom>=111|!artifact.swelling_maelstrom.enabled&maelstrom>=86
actions.single_lr+=/totem_mastery,if=buff.resonance_totem.remains<10|(buff.resonance_totem.remains<(buff.ascendance.duration+cooldown.ascendance.remains)&cooldown.ascendance.remains<15)
actions.single_lr+=/earthquake,if=buff.echoes_of_the_great_sundering.up|artifact.seismic_storm.enabled&((active_enemies>1&spell_targets.chain_lightning>1)|spell_haste<=0.66&!(buff.bloodlust.up&buff.bloodlust.remains<5))
actions.single_lr+=/lightning_bolt,if=buff.power_of_the_maelstrom.up&spell_targets.chain_lightning<3,target_if=debuff.lightning_rod.down
actions.single_lr+=/lightning_bolt,if=buff.power_of_the_maelstrom.up&spell_targets.chain_lightning<3
actions.single_lr+=/chain_lightning,if=active_enemies>1&spell_targets.chain_lightning>1,target_if=debuff.lightning_rod.down
actions.single_lr+=/chain_lightning,if=active_enemies>1&spell_targets.chain_lightning>1
actions.single_lr+=/lightning_bolt,target_if=debuff.lightning_rod.down
actions.single_lr+=/lightning_bolt
actions.single_lr+=/flame_shock,moving=1,target_if=refreshable
actions.single_lr+=/earth_shock,moving=1
actions.single_lr+=/flame_shock,moving=1,if=movement.distance>6
actions+=/run_action_list,name=single_lr,if=level<100
]])

TJ:RegisterActionProfileList('simc::shaman::enhancement', 'Simulationcraft Shaman Profile: Enhancement', 7, 2, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/lightning_shield
actions=wind_shear
actions+=/bloodlust,if=target.health.pct<25|time>0.500
actions+=/auto_attack
actions+=/feral_spirit,if=!artifact.alpha_wolf.rank|(maelstrom>=20&cooldown.crash_lightning.remains<=gcd)
actions+=/crash_lightning,if=artifact.alpha_wolf.rank&prev_gcd.1.feral_spirit
actions+=/use_items
actions+=/berserking,if=buff.ascendance.up|(feral_spirit.remains>5)|level<100
actions+=/blood_fury,if=buff.ascendance.up|(feral_spirit.remains>5)|level<100
actions+=/potion,if=feral_spirit.remains>5|target.time_to_die<=60
actions+=/boulderfist,if=buff.boulderfist.remains<gcd|(maelstrom<=50&active_enemies>=3)
actions+=/boulderfist,if=buff.boulderfist.remains<gcd|(charges_fractional>1.75&maelstrom<=100&active_enemies<=2)
actions+=/rockbiter,if=talent.landslide.enabled&buff.landslide.remains<gcd
actions+=/fury_of_air,if=!ticking&maelstrom>22
actions+=/frostbrand,if=talent.hailstorm.enabled&buff.frostbrand.remains<gcd&((!talent.fury_of_air.enabled)|(talent.fury_of_air.enabled&maelstrom>25))
actions+=/flametongue,if=buff.flametongue.remains<gcd|(cooldown.doom_winds.remains<6&buff.flametongue.remains<4)
actions+=/doom_winds
actions+=/crash_lightning,if=talent.crashing_storm.enabled&active_enemies>=3&(!talent.hailstorm.enabled|buff.frostbrand.remains>gcd)
actions+=/earthen_spike
actions+=/lightning_bolt,if=(talent.overcharge.enabled&maelstrom>=40&!talent.fury_of_air.enabled)|(talent.overcharge.enabled&talent.fury_of_air.enabled&maelstrom>46)
actions+=/crash_lightning,if=buff.crash_lightning.remains<gcd&active_enemies>=2
actions+=/windsong
actions+=/ascendance,if=buff.stormbringer.react
actions+=/windstrike,if=buff.stormbringer.react&((talent.fury_of_air.enabled&maelstrom>=26)|(!talent.fury_of_air.enabled))
actions+=/stormstrike,if=buff.stormbringer.react&((talent.fury_of_air.enabled&maelstrom>=26)|(!talent.fury_of_air.enabled))
actions+=/frostbrand,if=equipped.137084&talent.hot_hand.enabled&buff.hot_hand.react&!buff.frostbrand.up&((!talent.fury_of_air.enabled)|(talent.fury_of_air.enabled&maelstrom>25))
actions+=/lava_lash,if=talent.hot_hand.enabled&buff.hot_hand.react
actions+=/sundering,if=active_enemies>=3
actions+=/crash_lightning,if=active_enemies>=4
actions+=/windstrike,if=talent.overcharge.enabled&cooldown.lightning_bolt.remains<gcd&maelstrom>80
actions+=/windstrike,if=talent.fury_of_air.enabled&maelstrom>46&(cooldown.lightning_bolt.remains>gcd|!talent.overcharge.enabled)
actions+=/windstrike,if=!talent.overcharge.enabled&!talent.fury_of_air.enabled
actions+=/stormstrike,if=talent.overcharge.enabled&cooldown.lightning_bolt.remains<gcd&maelstrom>80
actions+=/stormstrike,if=talent.fury_of_air.enabled&maelstrom>46&(cooldown.lightning_bolt.remains>gcd|!talent.overcharge.enabled)
actions+=/stormstrike,if=!talent.overcharge.enabled&!talent.fury_of_air.enabled
actions+=/crash_lightning,if=((active_enemies>1|talent.crashing_storm.enabled|talent.boulderfist.enabled)&!set_bonus.tier19_4pc)|feral_spirit.remains>5
actions+=/crash_lightning,if=active_enemies>=3
actions+=/frostbrand,if=talent.hailstorm.enabled&buff.frostbrand.remains<4.8&((!talent.fury_of_air.enabled)|(talent.fury_of_air.enabled&maelstrom>25))
actions+=/frostbrand,if=equipped.137084&!buff.frostbrand.up&((!talent.fury_of_air.enabled)|(talent.fury_of_air.enabled&maelstrom>25))
actions+=/lava_lash,if=talent.fury_of_air.enabled&talent.overcharge.enabled&(set_bonus.tier19_4pc&maelstrom>=80)
actions+=/lava_lash,if=talent.fury_of_air.enabled&!talent.overcharge.enabled&(set_bonus.tier19_4pc&maelstrom>=53)
actions+=/lava_lash,if=(!set_bonus.tier19_4pc&maelstrom>=120)|(!talent.fury_of_air.enabled&set_bonus.tier19_4pc&maelstrom>=40)
actions+=/flametongue,if=buff.flametongue.remains<4.8
actions+=/rockbiter
actions+=/flametongue
actions+=/boulderfist
]])

