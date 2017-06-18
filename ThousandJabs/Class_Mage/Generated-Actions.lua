if select(3, UnitClass('player')) ~= 8 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')

TJ:RegisterActionProfileList('simc::mage::arcane', 'Simulationcraft Mage Profile: Arcane', 8, 1, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/summon_arcane_familiar
actions.precombat+=/snapshot_stats
actions.precombat+=/mirror_image
actions.precombat+=/potion
actions.precombat+=/arcane_blast
actions=counterspell,if=target.debuff.casting.react
actions+=/time_warp,if=buff.bloodlust.down&(time=0|(buff.arcane_power.up&(buff.potion.up|!action.potion.usable))|target.time_to_die<=buff.bloodlust.duration)
actions+=/call_action_list,name=variables
actions+=/call_action_list,name=build,if=buff.arcane_charge.stack<buff.arcane_charge.max_stack&!burn_phase
actions+=/call_action_list,name=burn,if=variable.time_until_burn=0|burn_phase
actions+=/call_action_list,name=conserve
actions.build=arcane_orb
actions.build+=/charged_up
actions.build+=/arcane_missiles,if=variable.arcane_missiles_procs=buff.arcane_missiles.max_stack
actions.build+=/arcane_explosion,if=active_enemies>1
actions.build+=/arcane_blast
actions.burn=variable,name=total_burns,op=add,value=1,if=!burn_phase
actions.burn+=/start_burn_phase,if=!burn_phase
actions.burn+=/stop_burn_phase,if=prev_gcd.1.evocation&cooldown.evocation.charges=0&burn_phase_duration>0
actions.burn+=/arcane_barrage,if=buff.rune_of_power.remains>=travel_time&((cooldown.presence_of_mind.remains<=execute_time&set_bonus.tier20_2pc)|(talent.charged_up.enabled&cooldown.charged_up.remains<=execute_time))&buff.arcane_charge.stack=buff.arcane_charge.max_stack
actions.burn+=/nether_tempest,if=refreshable|!ticking
actions.burn+=/mark_of_aluneth
actions.burn+=/mirror_image
actions.burn+=/rune_of_power
actions.burn+=/arcane_power
actions.burn+=/blood_fury
actions.burn+=/berserking
actions.burn+=/arcane_torrent
actions.burn+=/potion,if=buff.arcane_power.up&(buff.berserking.up|buff.blood_fury.up|!(race.troll|race.orc))
actions.burn+=/use_item,name=tarnished_sentinel_medallion,if=equipped.147017&buff.arcane_power.up&(buff.bloodlust.up|!equipped.shard_of_the_exodar)
actions.burn+=/presence_of_mind,if=set_bonus.tier20_2pc|buff.rune_of_power.remains<=buff.presence_of_mind.max_stack*action.arcane_blast.execute_time|buff.arcane_power.remains<=buff.presence_of_mind.max_stack*action.arcane_blast.execute_time
actions.burn+=/arcane_orb
actions.burn+=/arcane_barrage,if=active_enemies>1&equipped.mantle_of_the_first_kirin_tor&buff.arcane_charge.stack=buff.arcane_charge.max_stack
actions.burn+=/arcane_missiles,if=variable.arcane_missiles_procs=buff.arcane_missiles.max_stack|dot.spectral_owl.ticking
actions.burn+=/arcane_blast,if=buff.presence_of_mind.up
actions.burn+=/supernova
actions.burn+=/arcane_explosion,if=active_enemies>1
actions.burn+=/arcane_missiles,if=variable.arcane_missiles_procs
actions.burn+=/arcane_barrage,if=buff.rune_of_power.remains<action.arcane_blast.cast_time&buff.rune_of_power.remains>=travel_time&cooldown.charged_up.remains<=execute_time
actions.burn+=/arcane_blast
actions.burn+=/variable,name=average_burn_length,op=set,value=(variable.average_burn_length*variable.total_burns-variable.average_burn_length+burn_phase_duration)%variable.total_burns
actions.burn+=/evocation,interrupt_if=ticks=2|mana.pct>=85,interrupt_immediate=1
actions.conserve=mark_of_aluneth,if=recharge_time<=variable.time_until_burn|variable.time_until_burn>=20|variable.time_until_burn>target.time_to_die
actions.conserve+=/mirror_image,if=variable.time_until_burn>recharge_time|variable.time_until_burn>target.time_to_die
actions.conserve+=/rune_of_power,if=full_recharge_time<=execute_time|(set_bonus.tier20_4pc&cooldown.presence_of_mind.remains<=execute_time&variable.time_until_burn>cooldown.presence_of_mind.recharge_time-variable.average_pom_cdr)|prev_gcd.1.mark_of_aluneth|target.time_to_die<recharge_time
actions.conserve+=/presence_of_mind,if=set_bonus.tier20_4pc&(variable.time_until_burn>=recharge_time-variable.average_pom_cdr|buff.rune_of_power.up)
actions.conserve+=/arcane_missiles,if=variable.arcane_missiles_procs=buff.arcane_missiles.max_stack
actions.conserve+=/supernova
actions.conserve+=/nether_tempest,if=refreshable|!ticking
actions.conserve+=/arcane_explosion,if=active_enemies>1&mana.pct>=90
actions.conserve+=/arcane_blast,if=mana.pct>=90|buff.rhonins_assaulting_armwraps.up
actions.conserve+=/arcane_missiles,if=variable.arcane_missiles_procs
actions.conserve+=/arcane_barrage
actions.conserve+=/arcane_blast
actions.pom_cdr_tracking_variables=variable,name=total_poms,op=add,value=1,if=prev_off_gcd.presence_of_mind
actions.pom_cdr_tracking_variables+=/variable,name=pom_cdr,op=add,value=4,if=prev_gcd.1.arcane_missiles&cooldown.presence_of_mind.remains
actions.pom_cdr_tracking_variables+=/variable,name=average_pom_cdr,op=set,value=(variable.average_pom_cdr*variable.total_poms-variable.average_pom_cdr+variable.pom_cdr)%variable.total_poms,if=prev_off_gcd.presence_of_mind
actions.pom_cdr_tracking_variables+=/variable,name=pom_cdr,op=reset,if=prev_off_gcd.presence_of_mind
actions.variables=variable,name=arcane_missiles_procs,op=set,value=buff.arcane_missiles.react
actions.variables+=/variable,name=time_until_burn,op=set,value=cooldown.arcane_power.remains
actions.variables+=/variable,name=time_until_burn,op=max,value=cooldown.evocation.remains-variable.average_burn_length
actions.variables+=/variable,name=time_until_burn,op=max,value=cooldown.presence_of_mind.remains-variable.average_pom_cdr,if=set_bonus.tier20_2pc
actions.variables+=/variable,name=time_until_burn,op=max,value=action.rune_of_power.usable_in,if=talent.rune_of_power.enabled
actions.variables+=/variable,name=time_until_burn,op=reset,if=target.time_to_die<variable.average_burn_length
actions.variables+=/call_action_list,name=pom_cdr_tracking_variables,if=set_bonus.tier20_4pc
]])

TJ:RegisterActionProfileList('simc::mage::fire', 'Simulationcraft Mage Profile: Fire', 8, 2, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/mirror_image
actions.precombat+=/potion
actions.precombat+=/pyroblast
actions=counterspell,if=target.debuff.casting.react
actions+=/time_warp,if=(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410&(cooldown.combustion.remains<1|target.time_to_die.remains<50))
actions+=/mirror_image,if=buff.combustion.down
actions+=/rune_of_power,if=firestarter.active&action.rune_of_power.charges=2|cooldown.combustion.remains>40&buff.combustion.down&!talent.kindling.enabled|target.time_to_die.remains<11|talent.kindling.enabled&(charges_fractional>1.8|time<40)&cooldown.combustion.remains>40
actions+=/rune_of_power,if=(buff.kaelthas_ultimate_ability.react&(cooldown.combustion.remains>40|action.rune_of_power.charges>1))|(buff.erupting_infernal_core.up&(cooldown.combustion.remains>40|action.rune_of_power.charges>1))
actions+=/call_action_list,name=combustion_phase,if=cooldown.combustion.remains<=action.rune_of_power.cast_time+(!talent.kindling.enabled*gcd)&(!talent.firestarter.enabled|!firestarter.active|active_enemies>=4|active_enemies>=2&talent.flame_patch.enabled)|buff.combustion.up
actions+=/call_action_list,name=rop_phase,if=buff.rune_of_power.up&buff.combustion.down
actions+=/call_action_list,name=standard_rotation
actions.active_talents=blast_wave,if=(buff.combustion.down)|(buff.combustion.up&action.fire_blast.charges<1&action.phoenixs_flames.charges<1)
actions.active_talents+=/meteor,if=cooldown.combustion.remains>40|(cooldown.combustion.remains>target.time_to_die)|buff.rune_of_power.up|firestarter.active
actions.active_talents+=/cinderstorm,if=cooldown.combustion.remains<cast_time&(buff.rune_of_power.up|!talent.rune_on_power.enabled)|cooldown.combustion.remains>10*spell_haste&!buff.combustion.up
actions.active_talents+=/dragons_breath,if=equipped.132863|(talent.alexstraszas_fury.enabled&buff.hot_streak.down)
actions.active_talents+=/living_bomb,if=active_enemies>1&buff.combustion.down
actions.combustion_phase=rune_of_power,if=buff.combustion.down
actions.combustion_phase+=/call_action_list,name=active_talents
actions.combustion_phase+=/combustion
actions.combustion_phase+=/potion
actions.combustion_phase+=/blood_fury
actions.combustion_phase+=/berserking
actions.combustion_phase+=/arcane_torrent
actions.combustion_phase+=/use_items
actions.combustion_phase+=/pyroblast,if=buff.kaelthas_ultimate_ability.react&buff.combustion.remains>execute_time
actions.combustion_phase+=/pyroblast,if=buff.hot_streak.up
actions.combustion_phase+=/fire_blast,if=buff.heating_up.up
actions.combustion_phase+=/phoenixs_flames
actions.combustion_phase+=/scorch,if=buff.combustion.remains>cast_time&target.health.pct<=30&equipped.132454
actions.combustion_phase+=/fireball,if=buff.combustion.remains>cast_time
actions.combustion_phase+=/scorch,if=buff.combustion.remains>cast_time
actions.combustion_phase+=/dragons_breath,if=buff.hot_streak.down&action.fire_blast.charges<1&action.phoenixs_flames.charges<1
actions.combustion_phase+=/scorch,if=target.health.pct<=30&equipped.132454
actions.rop_phase=rune_of_power
actions.rop_phase+=/flamestrike,if=((talent.flame_patch.enabled&active_enemies>1)|(active_enemies>3))&buff.hot_streak.up
actions.rop_phase+=/pyroblast,if=buff.hot_streak.up
actions.rop_phase+=/call_action_list,name=active_talents
actions.rop_phase+=/pyroblast,if=buff.kaelthas_ultimate_ability.react&execute_time<buff.kaelthas_ultimate_ability.remains
actions.rop_phase+=/fire_blast,if=!prev_off_gcd.fire_blast&buff.heating_up.up&firestarter.active&charges_fractional>1.7
actions.rop_phase+=/phoenixs_flames,if=!prev_gcd.1.phoenixs_flames&charges_fractional>2.7&firestarter.active
actions.rop_phase+=/fire_blast,if=!prev_off_gcd.fire_blast&!firestarter.active
actions.rop_phase+=/phoenixs_flames,if=!prev_gcd.1.phoenixs_flames
actions.rop_phase+=/scorch,if=target.health.pct<=30&equipped.132454
actions.rop_phase+=/dragons_breath,if=active_enemies>2
actions.rop_phase+=/flamestrike,if=(talent.flame_patch.enabled&active_enemies>2)|active_enemies>5
actions.rop_phase+=/fireball
actions.standard_rotation=flamestrike,if=((talent.flame_patch.enabled&active_enemies>1)|active_enemies>3)&buff.hot_streak.up
actions.standard_rotation+=/pyroblast,if=buff.hot_streak.up&buff.hot_streak.remains<action.fireball.execute_time
actions.standard_rotation+=/phoenixs_flames,if=charges_fractional>2.7&active_enemies>2
actions.standard_rotation+=/pyroblast,if=buff.hot_streak.up&!prev_gcd.1.pyroblast
actions.standard_rotation+=/pyroblast,if=buff.hot_streak.react&target.health.pct<=30&equipped.132454
actions.standard_rotation+=/pyroblast,if=buff.kaelthas_ultimate_ability.react&execute_time<buff.kaelthas_ultimate_ability.remains
actions.standard_rotation+=/call_action_list,name=active_talents
actions.standard_rotation+=/fire_blast,if=!talent.kindling.enabled&buff.heating_up.up&(!talent.rune_of_power.enabled|charges_fractional>1.4|cooldown.combustion.remains<40)&(3-charges_fractional)*(12*spell_haste)<cooldown.combustion.remains+3|target.time_to_die.remains<4
actions.standard_rotation+=/fire_blast,if=talent.kindling.enabled&buff.heating_up.up&(!talent.rune_of_power.enabled|charges_fractional>1.5|cooldown.combustion.remains<40)&(3-charges_fractional)*(18*spell_haste)<cooldown.combustion.remains+3|target.time_to_die.remains<4
actions.standard_rotation+=/phoenixs_flames,if=(buff.combustion.up|buff.rune_of_power.up|buff.incanters_flow.stack>3|talent.mirror_image.enabled)&artifact.phoenix_reborn.enabled&(4-charges_fractional)*13<cooldown.combustion.remains+5|target.time_to_die.remains<10
actions.standard_rotation+=/phoenixs_flames,if=(buff.combustion.up|buff.rune_of_power.up)&(4-charges_fractional)*30<cooldown.combustion.remains+5
actions.standard_rotation+=/phoenixs_flames,if=charges_fractional>2.5&cooldown.combustion.remains>23
actions.standard_rotation+=/flamestrike,if=(talent.flame_patch.enabled&active_enemies>1)|active_enemies>5
actions.standard_rotation+=/scorch,if=target.health.pct<=30&equipped.132454
actions.standard_rotation+=/fireball
]])

TJ:RegisterActionProfileList('simc::mage::frost', 'Simulationcraft Mage Profile: Frost', 8, 3, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/water_elemental
actions.precombat+=/snapshot_stats
actions.precombat+=/mirror_image
actions.precombat+=/potion
actions.precombat+=/frostbolt
actions=counterspell,if=target.debuff.casting.react
actions+=/variable,name=iv_start,value=time,if=prev_off_gcd.icy_veins
actions+=/variable,name=time_until_fof,value=10-(time-variable.iv_start-floor((time-variable.iv_start)%10)*10)
actions+=/variable,name=fof_react,value=buff.fingers_of_frost.react
actions+=/variable,name=fof_react,value=buff.fingers_of_frost.stack,if=equipped.lady_vashjs_grasp&buff.icy_veins.up&variable.time_until_fof>9|prev_off_gcd.freeze
actions+=/ice_lance,if=variable.fof_react=0&prev_gcd.1.flurry
actions+=/time_warp,if=buff.bloodlust.down&(buff.exhaustion.down|equipped.shard_of_the_exodar)&(time=0|cooldown.icy_veins.remains<1|target.time_to_die<50)
actions+=/call_action_list,name=movement
actions+=/call_action_list,name=cooldowns
actions+=/call_action_list,name=aoe,if=active_enemies>=4
actions+=/call_action_list,name=single
actions.aoe=frostbolt,if=prev_off_gcd.water_jet
actions.aoe+=/frozen_orb
actions.aoe+=/blizzard
actions.aoe+=/comet_storm
actions.aoe+=/ice_nova
actions.aoe+=/water_jet,if=prev_gcd.1.frostbolt&buff.fingers_of_frost.stack<(2+artifact.icy_hand.enabled)&buff.brain_freeze.react=0
actions.aoe+=/flurry,if=prev_gcd.1.ebonbolt|(prev_gcd.1.glacial_spike|prev_gcd.1.frostbolt)&buff.brain_freeze.react
actions.aoe+=/frost_bomb,if=debuff.frost_bomb.remains<action.ice_lance.travel_time&variable.fof_react>0
actions.aoe+=/ice_lance,if=variable.fof_react>0
actions.aoe+=/ebonbolt,if=buff.brain_freeze.react=0
actions.aoe+=/glacial_spike
actions.aoe+=/frostbolt
actions.aoe+=/ice_lance
actions.cooldowns=rune_of_power,if=cooldown.icy_veins.remains<cast_time|charges_fractional>1.9&cooldown.icy_veins.remains>10|buff.icy_veins.up|target.time_to_die.remains+5<charges_fractional*10
actions.cooldowns+=/potion,if=cooldown.icy_veins.remains<1
actions.cooldowns+=/icy_veins,if=buff.icy_veins.down
actions.cooldowns+=/mirror_image
actions.cooldowns+=/use_items
actions.cooldowns+=/blood_fury
actions.cooldowns+=/berserking
actions.cooldowns+=/arcane_torrent
actions.movement=blink,if=movement.distance>10
actions.movement+=/ice_floes,if=buff.ice_floes.down&movement.distance>0&variable.fof_react=0
actions.single=ice_nova,if=debuff.winters_chill.up
actions.single+=/frozen_orb,if=set_bonus.tier20_2pc
actions.single+=/frostbolt,if=prev_off_gcd.water_jet
actions.single+=/water_jet,if=prev_gcd.1.frostbolt&buff.fingers_of_frost.stack<(2+artifact.icy_hand.enabled)&buff.brain_freeze.react=0
actions.single+=/ray_of_frost,if=buff.icy_veins.up|(cooldown.icy_veins.remains>action.ray_of_frost.cooldown&buff.rune_of_power.down)
actions.single+=/flurry,if=prev_gcd.1.ebonbolt|buff.brain_freeze.react&(!talent.glacial_spike.enabled&prev_gcd.1.frostbolt|talent.glacial_spike.enabled&(prev_gcd.1.glacial_spike|prev_gcd.1.frostbolt&(buff.icicles.stack<=3|cooldown.frozen_orb.remains<=10&set_bonus.tier20_2pc)))
actions.single+=/blizzard,if=cast_time=0&active_enemies>1&variable.fof_react<3
actions.single+=/frost_bomb,if=debuff.frost_bomb.remains<action.ice_lance.travel_time&variable.fof_react>0
actions.single+=/ice_lance,if=variable.fof_react>0&cooldown.icy_veins.remains>10|variable.fof_react>2
actions.single+=/ebonbolt,if=buff.brain_freeze.react=0
actions.single+=/frozen_orb
actions.single+=/ice_nova
actions.single+=/comet_storm
actions.single+=/blizzard,if=active_enemies>2|active_enemies>1&!(talent.glacial_spike.enabled&talent.splitting_ice.enabled)|(buff.zannesu_journey.stack=5&buff.zannesu_journey.remains>cast_time)
actions.single+=/frostbolt,if=buff.frozen_mass.remains>execute_time+action.glacial_spike.execute_time+action.glacial_spike.travel_time&buff.brain_freeze.react=0&talent.glacial_spike.enabled
actions.single+=/glacial_spike,if=cooldown.frozen_orb.remains>10|!set_bonus.tier20_2pc
actions.single+=/frostbolt
actions.single+=/blizzard,if=cast_time=0
actions.single+=/ice_lance
]])

