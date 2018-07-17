if GetBuildInfo and select(4,GetBuildInfo()) < 80000 then return end

if select(3, UnitClass('player')) ~= 12 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs8')

TJ:RegisterActionProfileList('simc::demonhunter::havoc', 'Simulationcraft Demon Hunter Profile: Havoc', 12, 1, [[
actions.precombat=flask
actions.precombat+=/augmentation
actions.precombat+=/food
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/metamorphosis
actions=auto_attack
actions+=/variable,name=blade_dance,value=talent.first_blood.enabled|set_bonus.tier20_4pc|spell_targets.blade_dance1>=(3-talent.trail_of_ruin.enabled)
actions+=/variable,name=waiting_for_nemesis,value=!(!talent.nemesis.enabled|cooldown.nemesis.ready|cooldown.nemesis.remains>target.time_to_die|cooldown.nemesis.remains>60)
actions+=/variable,name=pooling_for_meta,value=!talent.demonic.enabled&cooldown.metamorphosis.remains<6&fury.deficit>30&(!variable.waiting_for_nemesis|cooldown.nemesis.remains<10)
actions+=/variable,name=pooling_for_blade_dance,value=variable.blade_dance&(fury<75-talent.first_blood.enabled*20)
actions+=/variable,name=waiting_for_dark_slash,value=talent.dark_slash.enabled&!variable.pooling_for_blade_dance&!variable.pooling_for_meta&cooldown.dark_slash.up
actions+=/variable,name=waiting_for_momentum,value=talent.momentum.enabled&!buff.momentum.up
actions+=/disrupt
actions+=/call_action_list,name=cooldown,if=gcd.remains=0
actions+=/pick_up_fragment,if=fury.deficit>=35
actions+=/call_action_list,name=dark_slash,if=talent.dark_slash.enabled&(variable.waiting_for_dark_slash|debuff.dark_slash.up)
actions+=/run_action_list,name=demonic,if=talent.demonic.enabled
actions+=/run_action_list,name=normal
actions.cooldown=metamorphosis,if=!(talent.demonic.enabled|variable.pooling_for_meta|variable.waiting_for_nemesis)|target.time_to_die<25
actions.cooldown+=/metamorphosis,if=talent.demonic.enabled&buff.metamorphosis.up
actions.cooldown+=/nemesis,target_if=min:target.time_to_die,if=raid_event.adds.exists&debuff.nemesis.down&(active_enemies>desired_targets|raid_event.adds.in>60)
actions.cooldown+=/nemesis,if=!raid_event.adds.exists
actions.cooldown+=/potion,if=buff.metamorphosis.remains>25|target.time_to_die<60
actions.dark_slash=dark_slash,if=fury>=80&(!variable.blade_dance|!cooldown.blade_dance.ready)
actions.dark_slash+=/annihilation,if=debuff.dark_slash.up
actions.dark_slash+=/chaos_strike,if=debuff.dark_slash.up
actions.demonic=fel_barrage,if=active_enemies>desired_targets|raid_event.adds.in>30
actions.demonic+=/death_sweep,if=variable.blade_dance
actions.demonic+=/blade_dance,if=variable.blade_dance&cooldown.eye_beam.remains>5&!cooldown.metamorphosis.ready
actions.demonic+=/immolation_aura
actions.demonic+=/felblade,if=fury<40|(buff.metamorphosis.down&fury.deficit>=40)
actions.demonic+=/eye_beam,if=(!talent.blind_fury.enabled|fury.deficit>=70)&(!buff.metamorphosis.extended_by_demonic|(set_bonus.tier21_4pc&buff.metamorphosis.remains>16))
actions.demonic+=/annihilation,if=(talent.blind_fury.enabled|fury.deficit<30|buff.metamorphosis.remains<5)&!variable.pooling_for_blade_dance
actions.demonic+=/chaos_strike,if=(talent.blind_fury.enabled|fury.deficit<30)&!variable.pooling_for_meta&!variable.pooling_for_blade_dance
actions.demonic+=/fel_rush,if=talent.demon_blades.enabled&!cooldown.eye_beam.ready&(charges=2|(raid_event.movement.in>10&raid_event.adds.in>10))
actions.demonic+=/demons_bite
actions.demonic+=/throw_glaive,if=buff.out_of_range.up
actions.demonic+=/fel_rush,if=movement.distance>15|buff.out_of_range.up
actions.demonic+=/vengeful_retreat,if=movement.distance>15
actions.demonic+=/throw_glaive,if=talent.demon_blades.enabled
actions.normal=vengeful_retreat,if=talent.momentum.enabled&buff.prepared.down
actions.normal+=/fel_rush,if=(variable.waiting_for_momentum|talent.fel_mastery.enabled)&(charges=2|(raid_event.movement.in>10&raid_event.adds.in>10))
actions.normal+=/fel_barrage,if=!variable.waiting_for_momentum&(active_enemies>desired_targets|raid_event.adds.in>30)
actions.normal+=/immolation_aura
actions.normal+=/eye_beam,if=active_enemies>1&(!raid_event.adds.exists|raid_event.adds.up)&!variable.waiting_for_momentum
actions.normal+=/death_sweep,if=variable.blade_dance
actions.normal+=/blade_dance,if=variable.blade_dance
actions.normal+=/felblade,if=fury.deficit>=40
actions.normal+=/eye_beam,if=!talent.blind_fury.enabled&!variable.waiting_for_dark_slash&raid_event.adds.in>cooldown
actions.normal+=/annihilation,if=(talent.demon_blades.enabled|!variable.waiting_for_momentum|fury.deficit<30|buff.metamorphosis.remains<5)&!variable.pooling_for_blade_dance&!variable.waiting_for_dark_slash
actions.normal+=/chaos_strike,if=(talent.demon_blades.enabled|!variable.waiting_for_momentum|fury.deficit<30)&!variable.pooling_for_meta&!variable.pooling_for_blade_dance&!variable.waiting_for_dark_slash
actions.normal+=/eye_beam,if=talent.blind_fury.enabled&raid_event.adds.in>cooldown
actions.normal+=/demons_bite
actions.normal+=/fel_rush,if=!talent.momentum.enabled&raid_event.movement.in>charges*10&talent.demon_blades.enabled
actions.normal+=/felblade,if=movement.distance>15|buff.out_of_range.up
actions.normal+=/fel_rush,if=movement.distance>15|(buff.out_of_range.up&!talent.momentum.enabled)
actions.normal+=/vengeful_retreat,if=movement.distance>15
actions.normal+=/throw_glaive,if=talent.demon_blades.enabled
]])

TJ:RegisterActionProfileList('simc::demonhunter::vengeance', 'Simulationcraft Demon Hunter Profile: Vengeance', 12, 2, [[
actions.precombat=flask
actions.precombat+=/augmentation
actions.precombat+=/food
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions=auto_attack
actions+=/consume_magic
actions+=/metamorphosis
actions+=/fiery_brand
actions+=/demon_spikes
actions+=/infernal_strike
actions+=/immolation_aura
actions+=/felblade
actions+=/soul_barrier
actions+=/spirit_bomb
actions+=/fel_devastation
actions+=/soul_cleave
actions+=/sigil_of_flame
actions+=/fracture
actions+=/shear
]])

