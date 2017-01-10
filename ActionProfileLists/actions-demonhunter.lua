local _, internal = ...
internal.apls = internal.apls or {}

internal.apls['legion-dev::demonhunter::vengeance'] = [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=nightborne_delicacy_platter
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=unbending_potion
actions=auto_attack
actions+=/consume_magic
actions+=/fiery_brand,if=buff.demon_spikes.down&buff.metamorphosis.down
actions+=/demon_spikes,if=charges=2|buff.demon_spikes.down&!dot.fiery_brand.ticking&buff.metamorphosis.down
actions+=/empower_wards,if=debuff.casting.up
actions+=/infernal_strike,if=!sigil_placed&!in_flight&remains-travel_time-delay<0.3*duration&artifact.fiery_demise.enabled&dot.fiery_brand.ticking
actions+=/infernal_strike,if=!sigil_placed&!in_flight&remains-travel_time-delay<0.3*duration&(!artifact.fiery_demise.enabled|(max_charges-charges_fractional)*recharge_time<cooldown.fiery_brand.remains+5)&(cooldown.sigil_of_flame.remains>7|charges=2)
actions+=/spirit_bomb,if=debuff.frailty.down
actions+=/soul_carver,if=dot.fiery_brand.ticking
actions+=/immolation_aura,if=pain<=80
actions+=/felblade,if=pain<=70
actions+=/soul_barrier
actions+=/soul_cleave,if=soul_fragments=5
actions+=/metamorphosis,if=buff.demon_spikes.down&!dot.fiery_brand.ticking&buff.metamorphosis.down&incoming_damage_5s>health.max*0.70
actions+=/fel_devastation,if=incoming_damage_5s>health.max*0.70
actions+=/soul_cleave,if=incoming_damage_5s>=health.max*0.70
actions+=/fel_eruption
actions+=/sigil_of_flame,if=remains-delay<=0.3*duration
actions+=/fracture,if=pain>=80&soul_fragments<4&incoming_damage_4s<=health.max*0.20
actions+=/soul_cleave,if=pain>=80
actions+=/shear
-- Manually added, as it's not in simulationcraft yet!
actions+=/sever
]]

internal.apls['legion-dev::demonhunter::havoc'] = [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=nightborne_delicacy_platter
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=old_war
actions.precombat+=/metamorphosis,if=!(talent.demon_reborn.enabled&talent.demonic.enabled)
actions=auto_attack
actions+=/variable,name=pooling_for_meta,value=cooldown.metamorphosis.ready&(!talent.demonic.enabled|!cooldown.eye_beam.ready)&(!talent.chaos_blades.enabled|cooldown.chaos_blades.ready)&(!talent.nemesis.enabled|debuff.nemesis.up|cooldown.nemesis.ready)
actions+=/variable,name=blade_dance,value=talent.first_blood.enabled|spell_targets.blade_dance1>=3+(talent.chaos_cleave.enabled*2)
actions+=/variable,name=pooling_for_blade_dance,value=variable.blade_dance&fury-40<35-talent.first_blood.enabled*20&(spell_targets.blade_dance1>=3+(talent.chaos_cleave.enabled*2))
actions+=/variable,name=pooling_for_chaos_strike,value=talent.chaos_cleave.enabled&fury.deficit>40&!raid_event.adds.up&raid_event.adds.in<2*gcd
actions+=/blur,if=artifact.demon_speed.enabled&cooldown.fel_rush.charges_fractional<0.5&cooldown.vengeful_retreat.remains-buff.momentum.remains>4
actions+=/call_action_list,name=cooldown
actions+=/fel_rush,animation_cancel=1,if=time=0
actions+=/pick_up_fragment,if=talent.demonic_appetite.enabled&fury.deficit>=35
actions+=/consume_magic
actions+=/vengeful_retreat,if=(talent.prepared.enabled|talent.momentum.enabled)&buff.prepared.down&buff.momentum.down
actions+=/fel_rush,if=(talent.momentum.enabled|talent.fel_mastery.enabled)&(!talent.momentum.enabled|(charges=2|cooldown.vengeful_retreat.remains>4)&buff.momentum.down)&(!talent.fel_mastery.enabled|fury.deficit>=25)&(charges=2|(raid_event.movement.in>10&raid_event.adds.in>10))
actions+=/fel_barrage,if=charges>=5&(buff.momentum.up|!talent.momentum.enabled)&((active_enemies>desired_targets&active_enemies>1)|raid_event.adds.in>30)
actions+=/throw_glaive,if=talent.bloodlet.enabled&(!talent.momentum.enabled|buff.momentum.up)&charges=2
actions+=/fel_eruption
actions+=/fury_of_the_illidari,if=(active_enemies>desired_targets&active_enemies>1)|raid_event.adds.in>55&(!talent.momentum.enabled|buff.momentum.up)
actions+=/eye_beam,if=talent.demonic.enabled&(talent.demon_blades.enabled|talent.blind_fury.enabled|(!talent.blind_fury.enabled&fury.deficit<30))&((active_enemies>desired_targets&active_enemies>1)|raid_event.adds.in>30)
actions+=/death_sweep,if=variable.blade_dance
actions+=/blade_dance,if=variable.blade_dance
actions+=/throw_glaive,if=talent.bloodlet.enabled&spell_targets>=2&(!talent.master_of_the_glaive.enabled|!talent.momentum.enabled|buff.momentum.up)&(spell_targets>=3|raid_event.adds.in>recharge_time+cooldown)
actions+=/felblade,if=fury.deficit>=30+buff.prepared.up*8
actions+=/eye_beam,if=talent.blind_fury.enabled&(spell_targets.eye_beam_tick>desired_targets|fury.deficit>=35)
actions+=/annihilation,if=(talent.demon_blades.enabled|!talent.momentum.enabled|buff.momentum.up|fury.deficit<30+buff.prepared.up*8|buff.metamorphosis.remains<5)&!variable.pooling_for_blade_dance
actions+=/throw_glaive,if=talent.bloodlet.enabled&(!talent.master_of_the_glaive.enabled|!talent.momentum.enabled|buff.momentum.up)&raid_event.adds.in>recharge_time+cooldown
actions+=/eye_beam,if=!talent.demonic.enabled&!talent.blind_fury.enabled&((spell_targets.eye_beam_tick>desired_targets&active_enemies>1)|(raid_event.adds.in>45&!variable.pooling_for_meta&buff.metamorphosis.down&(artifact.anguish_of_the_deceiver.enabled|active_enemies>1)&!talent.chaos_cleave.enabled))
actions+=/demons_bite,if=talent.demonic.enabled&!talent.blind_fury.enabled&buff.metamorphosis.down&cooldown.eye_beam.remains<gcd&fury.deficit>=20
actions+=/demons_bite,if=talent.demonic.enabled&!talent.blind_fury.enabled&buff.metamorphosis.down&cooldown.eye_beam.remains<2*gcd&fury.deficit>=45
actions+=/throw_glaive,if=buff.metamorphosis.down&spell_targets>=2
actions+=/chaos_strike,if=(talent.demon_blades.enabled|!talent.momentum.enabled|buff.momentum.up|fury.deficit<30+buff.prepared.up*8)&!variable.pooling_for_chaos_strike&!variable.pooling_for_meta&!variable.pooling_for_blade_dance&(!talent.demonic.enabled|!cooldown.eye_beam.ready|(talent.blind_fury.enabled&fury.deficit<35))
actions+=/fel_barrage,if=charges=4&buff.metamorphosis.down&(buff.momentum.up|!talent.momentum.enabled)&((active_enemies>desired_targets&active_enemies>1)|raid_event.adds.in>30)
actions+=/fel_rush,if=!talent.momentum.enabled&raid_event.movement.in>charges*10
actions+=/demons_bite
actions+=/throw_glaive,if=buff.out_of_range.up
actions+=/felblade,if=movement.distance|buff.out_of_range.up
actions+=/fel_rush,if=movement.distance>15|(buff.out_of_range.up&!talent.momentum.enabled)
actions+=/vengeful_retreat,if=movement.distance>15
actions+=/throw_glaive,if=!talent.bloodlet.enabled
actions.cooldown=nemesis,target_if=min:target.time_to_die,if=raid_event.adds.exists&debuff.nemesis.down&((active_enemies>desired_targets&active_enemies>1)|raid_event.adds.in>60)
actions.cooldown+=/nemesis,if=!raid_event.adds.exists&(cooldown.metamorphosis.remains>100|target.time_to_die<70)
actions.cooldown+=/nemesis,sync=metamorphosis,if=!raid_event.adds.exists
actions.cooldown+=/chaos_blades,if=buff.metamorphosis.up|cooldown.metamorphosis.remains>100|target.time_to_die<20
actions.cooldown+=/metamorphosis,if=variable.pooling_for_meta&fury.deficit<30
actions.cooldown+=/potion,name=old_war,if=buff.metamorphosis.remains>25|target.time_to_die<30
]]

