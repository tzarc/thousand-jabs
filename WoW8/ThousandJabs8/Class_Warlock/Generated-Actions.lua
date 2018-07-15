if GetBuildInfo and select(4,GetBuildInfo()) < 80000 then return end

if select(3, UnitClass('player')) ~= 9 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs8')

TJ:RegisterActionProfileList('simc::warlock::affliction', 'Simulationcraft Warlock Profile: Affliction', 9, 1, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/summon_pet
actions.precombat+=/snapshot_stats
actions.precombat+=/grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled
actions.precombat+=/potion
actions=dark_soul,if=buff.active_uas.stack>0
actions+=/haunt
actions+=/agony,if=refreshable
actions+=/siphon_life,if=refreshable
actions+=/corruption,if=refreshable
actions+=/phantom_singularity
actions+=/vile_taint
actions+=/unstable_affliction,if=soul_shard=5
actions+=/unstable_affliction,if=(dot.unstable_affliction_1.ticking+dot.unstable_affliction_2.ticking+dot.unstable_affliction_3.ticking+dot.unstable_affliction_4.ticking+dot.unstable_affliction_5.ticking=0)|soul_shard>2
actions+=/summon_darkglare
actions+=/deathbolt
actions+=/drain_soul,chain=1,interrupt=1
actions+=/shadow_bolt
]])

TJ:RegisterActionProfileList('simc::warlock::demonology', 'Simulationcraft Warlock Profile: Demonology', 9, 2, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/summon_pet
actions.precombat+=/inner_demons,if=talent.inner_demons.enabled
actions.precombat+=/snapshot_stats
actions.precombat+=/demonbolt
actions.precombat+=/potion
actions=demonic_strength
actions+=/call_action_list,name=nether_portal,if=talent.nether_portal.enabled
actions+=/summon_vilefiend,if=cooldown.summon_demonic_tyrant.remains>30|(cooldown.summon_demonic_tyrant.remains<10&cooldown.call_dreadstalkers.remains<10)
actions+=/grimoire_felguard
actions+=/hand_of_guldan,if=soul_shard>=5
actions+=/hand_of_guldan,if=soul_shard>=3&cooldown.call_dreadstalkers.remains>4&(!talent.summon_vilefiend.enabled|cooldown.summon_vilefiend.remains>4)
actions+=/call_dreadstalkers
actions+=/bilescourge_bombers
actions+=/summon_demonic_tyrant,if=talent.summon_vilefiend.enabled&buff.dreadstalkers.remains>action.summon_demonic_tyrant.cast_time&buff.vilefiend.remains>action.summon_demonic_tyrant.cast_time
actions+=/summon_demonic_tyrant,if=!talent.summon_vilefiend.enabled&buff.dreadstalkers.remains>action.summon_demonic_tyrant.cast_time&soul_shard=0
actions+=/power_siphon,if=buff.wild_imps.stack>=2&buff.demonic_core.stack<=2&buff.demonic_power.down
actions+=/demonbolt,if=soul_shard<=3&buff.demonic_core.up
actions+=/doom,cycle_targets=1,if=(talent.doom.enabled&target.time_to_die>duration&(!ticking|remains<duration*0.3))
actions+=/call_action_list,name=build_a_shard
actions.build_a_shard=soul_strike
actions.build_a_shard+=/shadow_bolt
actions.nether_portal=call_action_list,name=nether_portal_building,if=cooldown.nether_portal.remains<20
actions.nether_portal+=/call_action_list,name=nether_portal_active,if=cooldown.nether_portal.remains>160
actions.nether_portal_active=call_dreadstalkers
actions.nether_portal_active+=/hand_of_guldan,if=prev_gcd.1.grimoire_felguard|prev_gcd.1.summon_vilefiend
actions.nether_portal_active+=/grimoire_felguard
actions.nether_portal_active+=/summon_vilefiend
actions.nether_portal_active+=/bilescourge_bombers
actions.nether_portal_active+=/call_action_list,name=build_a_shard,if=soul_shard=1&(cooldown.call_dreadstalkers.remains<action.shadow_bolt.cast_time|(talent.bilescourge_bombers.enabled&cooldown.bilescourge_bombers.remains<action.shadow_bolt.cast_time))
actions.nether_portal_active+=/hand_of_guldan,if=((cooldown.call_dreadstalkers.remains>action.demonbolt.cast_time)&(cooldown.call_dreadstalkers.remains>action.shadow_bolt.cast_time))&cooldown.nether_portal.remains>(160+action.hand_of_guldan.cast_time)
actions.nether_portal_active+=/summon_demonic_tyrant,if=buff.nether_portal.remains<10&soul_shard=0
actions.nether_portal_active+=/summon_demonic_tyrant,if=buff.nether_portal.remains<action.summon_demonic_tyrant.cast_time+5.5
actions.nether_portal_active+=/demonbolt,if=buff.demonic_core.up
actions.nether_portal_active+=/call_action_list,name=build_a_shard
actions.nether_portal_building=nether_portal,if=soul_shard>=5&(!talent.power_siphon.enabled|buff.demonic_core.up)
actions.nether_portal_building+=/call_dreadstalkers
actions.nether_portal_building+=/hand_of_guldan,if=cooldown.call_dreadstalkers.remains>18&soul_shard>=3
actions.nether_portal_building+=/power_siphon,if=buff.wild_imps.stack>=2&buff.demonic_core.stack<=2&buff.demonic_power.down&soul_shard>=3
actions.nether_portal_building+=/hand_of_guldan,if=soul_shard>=5
actions.nether_portal_building+=/call_action_list,name=build_a_shard
]])

TJ:RegisterActionProfileList('simc::warlock::destruction', 'Simulationcraft Warlock Profile: Destruction', 9, 3, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/summon_pet
actions.precombat+=/snapshot_stats
actions.precombat+=/grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled
actions.precombat+=/potion
actions=run_action_list,name=aoe,if=spell_targets.infernal_awakening>=3
actions+=/immolate,cycle_targets=1,if=refreshable
actions+=/havoc,cycle_targets=1,if=!(target=sim.target)
actions+=/summon_infernal
actions+=/dark_soul_instability
actions+=/soul_fire,cycle_targets=1,if=!debuff.havoc.remains
actions+=/channel_demonfire,cycle_targets=1,if=target=sim.target
actions+=/cataclysm,cycle_targets=1,if=target=sim.target
actions+=/chaos_bolt,cycle_targets=1,if=!debuff.havoc.remains&!talent.internal_combustion.enabled&soul_shard>=4|(talent.eradication.enabled&debuff.eradication.remains<=cast_time)|buff.dark_soul_instability.remains>cast_time|pet.infernal.active&talent.grimoire_of_supremacy.enabled
actions+=/chaos_bolt,cycle_targets=1,if=!debuff.havoc.remains&talent.internal_combustion.enabled&dot.immolate.remains>8|soul_shard=5
actions+=/conflagrate,cycle_targets=1,if=target=sim.target&(talent.flashover.enabled&buff.backdraft.stack<=2)|(!talent.flashover.enabled&buff.backdraft.stack<2)
actions+=/incinerate,cycle_targets=1,if=target=sim.target
actions.aoe=summon_infernal
actions.aoe+=/dark_soul_instability
actions.aoe+=/cataclysm
actions.aoe+=/rain_of_fire,if=soul_shard>=4.5
actions.aoe+=/immolate,if=!remains
actions.aoe+=/channel_demonfire
actions.aoe+=/immolate,cycle_targets=1,if=refreshable&(!talent.fire_and_brimstone.enabled|talent.cataclysm.enabled&cooldown.cataclysm.remains>=12|talent.inferno.enabled)
actions.aoe+=/rain_of_fire
actions.aoe+=/conflagrate,if=(talent.flashover.enabled&buff.backdraft.stack<=2)|(!talent.flashover.enabled&buff.backdraft.stack<2)
actions.aoe+=/shadowburn,if=!talent.fire_and_brimstone.enabled&(charges=2|!buff.backdraft.remains|buff.backdraft.remains>buff.backdraft.stack*action.incinerate.execute_time)
actions.aoe+=/incinerate
]])

