local _, internal = ...
internal.apls = internal.apls or {}

internal.apls["legion-dev::Tier19P::Demon_Hunter_Havoc_T19P"] = [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=the_hungry_magister
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_agility_potion
actions=auto_attack
actions+=/pick_up_fragment,if=talent.demonic_appetite.enabled&fury.deficit>=30
actions+=/consume_magic
actions+=/vengeful_retreat,if=(talent.prepared.enabled|talent.momentum.enabled)&buff.prepared.down&buff.momentum.down
actions+=/fel_rush,animation_cancel=1,if=(talent.momentum.enabled|talent.fel_mastery.enabled)&(!talent.momentum.enabled|(charges=2|cooldown.vengeful_retreat.remains>4)&buff.momentum.down)&(!talent.fel_mastery.enabled|fury.deficit>=25)&raid_event.movement.in>charges*10
actions+=/eye_beam,if=talent.demonic.enabled&buff.metamorphosis.down&(!talent.first_blood.enabled|fury>=80|fury.deficit<30)
actions+=/demons_bite,sync=metamorphosis,if=fury.deficit>=25
actions+=/call_action_list,name=cooldown
actions+=/fury_of_the_illidari,if=active_enemies>desired_targets|raid_event.adds.in>55
actions+=/death_sweep,if=death_sweep_worth_using
actions+=/demons_bite,if=buff.metamorphosis.remains>gcd&cooldown.blade_dance.remains<gcd&fury<70&death_sweep_worth_using
actions+=/blade_dance,if=blade_dance_worth_using
actions+=/fel_barrage,if=charges>=5&(buff.momentum.up|!talent.momentum.enabled)&(active_enemies>desired_targets|raid_event.adds.in>30)
actions+=/throw_glaive,if=talent.bloodlet.enabled&spell_targets>=2+talent.chaos_cleave.enabled&(!talent.master_of_the_glaive.enabled|!talent.momentum.enabled|buff.momentum.up)
actions+=/fel_eruption
actions+=/felblade,if=fury.deficit>=30+buff.prepared.up*8
actions+=/annihilation,if=!talent.momentum.enabled|buff.momentum.up|fury.deficit<=30+buff.prepared.up*8|buff.metamorphosis.remains<2
actions+=/throw_glaive,if=talent.bloodlet.enabled&(!talent.master_of_the_glaive.enabled|!talent.momentum.enabled|buff.momentum.up)
actions+=/eye_beam,if=!talent.demonic.enabled&(spell_targets.eye_beam_tick>desired_targets|(raid_event.adds.in>45&buff.metamorphosis.down&(artifact.anguish_of_the_deceiver.enabled|active_enemies>1|level=100)))
actions+=/demons_bite,if=buff.metamorphosis.down&cooldown.blade_dance.remains<gcd&fury<55&blade_dance_worth_using
actions+=/demons_bite,if=talent.demonic.enabled&buff.metamorphosis.down&cooldown.eye_beam.remains<gcd&fury.deficit>=20
actions+=/demons_bite,if=talent.demonic.enabled&buff.metamorphosis.down&cooldown.eye_beam.remains<2*gcd&fury.deficit>=45
actions+=/throw_glaive,if=buff.metamorphosis.down&spell_targets>=3
actions+=/chaos_strike,if=!talent.momentum.enabled|buff.momentum.up|fury.deficit<=30+buff.prepared.up*8
actions+=/fel_barrage,if=charges=4&buff.metamorphosis.down&(buff.momentum.up|!talent.momentum.enabled)&(active_enemies>desired_targets|raid_event.adds.in>30)
actions+=/fel_rush,animation_cancel=1,if=!talent.momentum.enabled&raid_event.movement.in>charges*10
actions+=/demons_bite
actions+=/throw_glaive
actions+=/fel_rush,if=movement.distance>15|(buff.out_of_range.up&!talent.momentum.enabled)
actions+=/vengeful_retreat,if=movement.distance>15
actions.cooldown=use_item,slot=trinket2,if=buff.chaos_blades.up|!talent.chaos_blades.enabled
actions.cooldown+=/nemesis,target_if=min:target.time_to_die,if=raid_event.adds.exists&debuff.nemesis.down&(active_enemies>desired_targets|raid_event.adds.in>60)
actions.cooldown+=/nemesis,if=!raid_event.adds.exists&(cooldown.metamorphosis.remains>100|target.time_to_die<70)
actions.cooldown+=/nemesis,sync=metamorphosis,if=!raid_event.adds.exists
actions.cooldown+=/chaos_blades,if=buff.metamorphosis.up|cooldown.metamorphosis.remains>100|target.time_to_die<20
actions.cooldown+=/metamorphosis,if=buff.metamorphosis.down&(!talent.demonic.enabled|!cooldown.eye_beam.ready)&(!talent.chaos_blades.enabled|cooldown.chaos_blades.ready)&(!talent.nemesis.enabled|debuff.nemesis.up|cooldown.nemesis.ready)
actions.cooldown+=/potion,name=draenic_agility_potion,if=buff.metamorphosis.remains>25
]]

internal.apls["legion-dev::Tier19P::Demon_Hunter_Vengeance_T19P"] = [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=the_hungry_magister
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_agility_potion
actions=auto_attack
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
]]

