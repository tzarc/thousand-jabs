local _, internal = ...
internal.actions = internal.actions or {}

-- keywords: legion-dev::demonhunter::vengeance
---- demon_spikes.aura_down
---- demon_spikes.spell_charges
---- fiery_brand.aura_up
---- fiery_brand.cooldown_remains
---- fiery_demise.artifact_selected
---- frailty.aura_down
---- health.max
---- in_flight
---- incoming_damage_over_4000
---- incoming_damage_over_5000
---- infernal_strike.aura_remains
---- infernal_strike.spell_charges
---- infernal_strike.spell_charges_fractional
---- infernal_strike.spell_delay
---- infernal_strike.spell_duration
---- infernal_strike.spell_max_charges
---- infernal_strike.spell_recharge_time
---- metamorphosis.aura_down
---- pain.curr
---- sigil_of_flame.aura_remains
---- sigil_of_flame.cooldown_remains
---- sigil_of_flame.spell_delay
---- sigil_of_flame.spell_duration
---- sigil_placed
---- soul_fragments.curr
---- target.is_casting
---- travel_time

internal.actions['legion-dev::demonhunter::vengeance'] = {
    default = {
        {
            action = 'auto_attack',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions=auto_attack',
        },
        {
            action = 'fiery_brand',
            condition = 'buff.demon_spikes.down&buff.metamorphosis.down',
            condition_converted = '((demon_spikes.aura_down) and (metamorphosis.aura_down))',
            condition_keywords = {
                'demon_spikes.aura_down',
                'metamorphosis.aura_down',
            },
            simc_line = 'actions+=/fiery_brand,if=buff.demon_spikes.down&buff.metamorphosis.down',
        },
        {
            action = 'demon_spikes',
            condition = 'charges=2|buff.demon_spikes.down&!dot.fiery_brand.ticking&buff.metamorphosis.down',
            condition_converted = '((((demon_spikes.spell_charges) == (2))) or (((demon_spikes.aura_down) and ((((not (fiery_brand.aura_up))) and (metamorphosis.aura_down))))))',
            condition_keywords = {
                'demon_spikes.aura_down',
                'demon_spikes.spell_charges',
                'fiery_brand.aura_up',
                'metamorphosis.aura_down',
            },
            simc_line = 'actions+=/demon_spikes,if=charges=2|buff.demon_spikes.down&!dot.fiery_brand.ticking&buff.metamorphosis.down',
        },
        {
            action = 'empower_wards',
            condition = 'debuff.casting.up',
            condition_converted = 'target.is_casting',
            condition_keywords = {
                'target.is_casting',
            },
            simc_line = 'actions+=/empower_wards,if=debuff.casting.up',
        },
        {
            action = 'infernal_strike',
            condition = '!sigil_placed&!in_flight&remains-travel_time-delay<0.3*duration&artifact.fiery_demise.enabled&dot.fiery_brand.ticking',
            condition_converted = '(((not (sigil_placed))) and ((((not (in_flight))) and ((((((infernal_strike.aura_remains_as_number - travel_time_as_number - infernal_strike.spell_delay_as_number)) < ((0.3 * infernal_strike.spell_duration_as_number)))) and (((fiery_demise.artifact_selected) and (fiery_brand.aura_up))))))))',
            condition_keywords = {
                'fiery_brand.aura_up',
                'fiery_demise.artifact_selected',
                'in_flight',
                'infernal_strike.aura_remains',
                'infernal_strike.spell_delay',
                'infernal_strike.spell_duration',
                'sigil_placed',
                'travel_time',
            },
            simc_line = 'actions+=/infernal_strike,if=!sigil_placed&!in_flight&remains-travel_time-delay<0.3*duration&artifact.fiery_demise.enabled&dot.fiery_brand.ticking',
        },
        {
            action = 'infernal_strike',
            condition = '!sigil_placed&!in_flight&remains-travel_time-delay<0.3*duration&(!artifact.fiery_demise.enabled|(max_charges-charges_fractional)*recharge_time<cooldown.fiery_brand.remains+5)&(cooldown.sigil_of_flame.remains>7|charges=2)',
            condition_converted = '(((not (sigil_placed))) and ((((not (in_flight))) and ((((((infernal_strike.aura_remains_as_number - travel_time_as_number - infernal_strike.spell_delay_as_number)) < ((0.3 * infernal_strike.spell_duration_as_number)))) and (((((((not (fiery_demise.artifact_selected))) or (((((infernal_strike.spell_max_charges_as_number - infernal_strike.spell_charges_fractional_as_number) * infernal_strike.spell_recharge_time_as_number)) < ((fiery_brand.cooldown_remains_as_number + 5))))))) and ((((((sigil_of_flame.cooldown_remains_as_number) > (7))) or (((infernal_strike.spell_charges) == (2)))))))))))))',
            condition_keywords = {
                'fiery_brand.cooldown_remains',
                'fiery_demise.artifact_selected',
                'in_flight',
                'infernal_strike.aura_remains',
                'infernal_strike.spell_charges',
                'infernal_strike.spell_charges_fractional',
                'infernal_strike.spell_delay',
                'infernal_strike.spell_duration',
                'infernal_strike.spell_max_charges',
                'infernal_strike.spell_recharge_time',
                'sigil_of_flame.cooldown_remains',
                'sigil_placed',
                'travel_time',
            },
            simc_line = 'actions+=/infernal_strike,if=!sigil_placed&!in_flight&remains-travel_time-delay<0.3*duration&(!artifact.fiery_demise.enabled|(max_charges-charges_fractional)*recharge_time<cooldown.fiery_brand.remains+5)&(cooldown.sigil_of_flame.remains>7|charges=2)',
        },
        {
            action = 'spirit_bomb',
            condition = 'debuff.frailty.down',
            condition_converted = 'frailty.aura_down',
            condition_keywords = {
                'frailty.aura_down',
            },
            simc_line = 'actions+=/spirit_bomb,if=debuff.frailty.down',
        },
        {
            action = 'soul_carver',
            condition = 'dot.fiery_brand.ticking',
            condition_converted = 'fiery_brand.aura_up',
            condition_keywords = {
                'fiery_brand.aura_up',
            },
            simc_line = 'actions+=/soul_carver,if=dot.fiery_brand.ticking',
        },
        {
            action = 'immolation_aura',
            condition = 'pain<=80',
            condition_converted = '((pain.curr_as_number) <= (80))',
            condition_keywords = {
                'pain.curr',
            },
            simc_line = 'actions+=/immolation_aura,if=pain<=80',
        },
        {
            action = 'felblade',
            condition = 'pain<=70',
            condition_converted = '((pain.curr_as_number) <= (70))',
            condition_keywords = {
                'pain.curr',
            },
            simc_line = 'actions+=/felblade,if=pain<=70',
        },
        {
            action = 'soul_barrier',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/soul_barrier',
        },
        {
            action = 'soul_cleave',
            condition = 'soul_fragments=5',
            condition_converted = '((soul_fragments.curr) == (5))',
            condition_keywords = {
                'soul_fragments.curr',
            },
            simc_line = 'actions+=/soul_cleave,if=soul_fragments=5',
        },
        {
            action = 'metamorphosis',
            condition = 'buff.demon_spikes.down&!dot.fiery_brand.ticking&buff.metamorphosis.down&incoming_damage_5s>health.max*0.70',
            condition_converted = '((demon_spikes.aura_down) and ((((not (fiery_brand.aura_up))) and (((metamorphosis.aura_down) and (((incoming_damage_over_5000_as_number) > ((health.max_as_number * 0.70)))))))))',
            condition_keywords = {
                'demon_spikes.aura_down',
                'fiery_brand.aura_up',
                'health.max',
                'incoming_damage_over_5000',
                'metamorphosis.aura_down',
            },
            simc_line = 'actions+=/metamorphosis,if=buff.demon_spikes.down&!dot.fiery_brand.ticking&buff.metamorphosis.down&incoming_damage_5s>health.max*0.70',
        },
        {
            action = 'fel_devastation',
            condition = 'incoming_damage_5s>health.max*0.70',
            condition_converted = '((incoming_damage_over_5000_as_number) > ((health.max_as_number * 0.70)))',
            condition_keywords = {
                'health.max',
                'incoming_damage_over_5000',
            },
            simc_line = 'actions+=/fel_devastation,if=incoming_damage_5s>health.max*0.70',
        },
        {
            action = 'soul_cleave',
            condition = 'incoming_damage_5s>=health.max*0.70',
            condition_converted = '((incoming_damage_over_5000_as_number) >= ((health.max_as_number * 0.70)))',
            condition_keywords = {
                'health.max',
                'incoming_damage_over_5000',
            },
            simc_line = 'actions+=/soul_cleave,if=incoming_damage_5s>=health.max*0.70',
        },
        {
            action = 'fel_eruption',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/fel_eruption',
        },
        {
            action = 'sigil_of_flame',
            condition = 'remains-delay<=0.3*duration',
            condition_converted = '(((sigil_of_flame.aura_remains_as_number - sigil_of_flame.spell_delay_as_number)) <= ((0.3 * sigil_of_flame.spell_duration_as_number)))',
            condition_keywords = {
                'sigil_of_flame.aura_remains',
                'sigil_of_flame.spell_delay',
                'sigil_of_flame.spell_duration',
            },
            simc_line = 'actions+=/sigil_of_flame,if=remains-delay<=0.3*duration',
        },
        {
            action = 'fracture',
            condition = 'pain>=80&soul_fragments<4&incoming_damage_4s<=health.max*0.20',
            condition_converted = '((((pain.curr_as_number) >= (80))) and (((((soul_fragments.curr_as_number) < (4))) and (((incoming_damage_over_4000_as_number) <= ((health.max_as_number * 0.20)))))))',
            condition_keywords = {
                'health.max',
                'incoming_damage_over_4000',
                'pain.curr',
                'soul_fragments.curr',
            },
            simc_line = 'actions+=/fracture,if=pain>=80&soul_fragments<4&incoming_damage_4s<=health.max*0.20',
        },
        {
            action = 'soul_cleave',
            condition = 'pain>=80',
            condition_converted = '((pain.curr_as_number) >= (80))',
            condition_keywords = {
                'pain.curr',
            },
            simc_line = 'actions+=/soul_cleave,if=pain>=80',
        },
        {
            action = 'shear',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/shear',
        },
    },
    precombat = {
        {
            action = 'flask',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat=flask,type=flask_of_the_seventh_demon',
            type = 'flask_of_the_seventh_demon',
        },
        {
            action = 'food',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/food,type=the_hungry_magister',
            type = 'the_hungry_magister',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'snapshot_stats',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/snapshot_stats',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'unbending_potion',
            simc_line = 'actions.precombat+=/potion,name=unbending_potion',
        },
    },
}


-- keywords: legion-dev::demonhunter::havoc
---- active_enemies
---- adds.raid_event_exists
---- adds.raid_event_in
---- anguish_of_the_deceiver.artifact_selected
---- bloodlet.talent_selected
---- chaos_blades.cooldown_ready
---- chaos_blades.talent_selected
---- chaos_cleave.talent_selected
---- demon_blades.talent_selected
---- demon_speed.artifact_selected
---- demonic.talent_selected
---- demonic_appetite.talent_selected
---- desired_targets
---- eye_beam.cooldown_ready
---- eye_beam.cooldown_remains
---- fel_barrage.spell_charges
---- fel_mastery.talent_selected
---- fel_rush.cooldown_charges_fractional
---- fel_rush.spell_charges
---- first_blood.talent_selected
---- fury.curr
---- fury.deficit
---- fury_of_the_illidari.cooldown_ready
---- gcd
---- master_of_the_glaive.talent_selected
---- metamorphosis.aura_down
---- metamorphosis.aura_remains
---- metamorphosis.aura_up
---- metamorphosis.cooldown_ready
---- metamorphosis.cooldown_remains
---- momentum.aura_down
---- momentum.aura_remains
---- momentum.aura_up
---- momentum.talent_selected
---- movement.distance
---- movement.raid_event_in
---- nemesis.aura_down
---- nemesis.aura_up
---- nemesis.cooldown_ready
---- nemesis.talent_selected
---- out_of_range.aura_up
---- prepared.aura_down
---- prepared.aura_up
---- prepared.talent_selected
---- raid_movement.aura_up
---- spell_targets
---- target.time_to_die
---- throw_glaive.cooldown_remains
---- throw_glaive.spell_charges
---- throw_glaive.spell_recharge_time
---- time_since_combat_start
---- variable.blade_dance
---- variable.pooling_for_blade_dance
---- variable.pooling_for_meta
---- vengeful_retreat.cooldown_remains

internal.actions['legion-dev::demonhunter::havoc'] = {
    cooldown = {
        {
            action = 'nemesis',
            condition = 'raid_event.adds.exists&debuff.nemesis.down&(active_enemies>desired_targets|raid_event.adds.in>60)',
            condition_converted = '((adds.raid_event_exists) and (((nemesis.aura_down) and ((((((active_enemies_as_number) > (desired_targets_as_number))) or (((adds.raid_event_in_as_number) > (60)))))))))',
            condition_keywords = {
                'active_enemies',
                'adds.raid_event_exists',
                'adds.raid_event_in',
                'desired_targets',
                'nemesis.aura_down',
            },
            simc_line = 'actions.cooldown=nemesis,target_if=min:target.time_to_die,if=raid_event.adds.exists&debuff.nemesis.down&(active_enemies>desired_targets|raid_event.adds.in>60)',
            target_if = 'min:target.time_to_die',
        },
        {
            action = 'nemesis',
            condition = '!raid_event.adds.exists&(cooldown.metamorphosis.remains>100|target.time_to_die<70)',
            condition_converted = '(((not (adds.raid_event_exists))) and ((((((metamorphosis.cooldown_remains_as_number) > (100))) or (((target.time_to_die_as_number) < (70)))))))',
            condition_keywords = {
                'adds.raid_event_exists',
                'metamorphosis.cooldown_remains',
                'target.time_to_die',
            },
            simc_line = 'actions.cooldown+=/nemesis,if=!raid_event.adds.exists&(cooldown.metamorphosis.remains>100|target.time_to_die<70)',
        },
        {
            action = 'nemesis',
            condition = '!raid_event.adds.exists',
            condition_converted = '(not (adds.raid_event_exists))',
            condition_keywords = {
                'adds.raid_event_exists',
            },
            simc_line = 'actions.cooldown+=/nemesis,sync=metamorphosis,if=!raid_event.adds.exists',
            sync = 'metamorphosis',
        },
        {
            action = 'chaos_blades',
            condition = 'buff.metamorphosis.up|cooldown.metamorphosis.remains>100|target.time_to_die<20',
            condition_converted = '((metamorphosis.aura_up) or (((((metamorphosis.cooldown_remains_as_number) > (100))) or (((target.time_to_die_as_number) < (20))))))',
            condition_keywords = {
                'metamorphosis.aura_up',
                'metamorphosis.cooldown_remains',
                'target.time_to_die',
            },
            simc_line = 'actions.cooldown+=/chaos_blades,if=buff.metamorphosis.up|cooldown.metamorphosis.remains>100|target.time_to_die<20',
        },
        {
            action = 'metamorphosis',
            condition = 'variable.pooling_for_meta&fury.deficit<30&(talent.chaos_blades.enabled|!cooldown.fury_of_the_illidari.ready)',
            condition_converted = '((variable.pooling_for_meta) and (((((fury.deficit_as_number) < (30))) and ((((chaos_blades.talent_selected) or ((not (fury_of_the_illidari.cooldown_ready)))))))))',
            condition_keywords = {
                'chaos_blades.talent_selected',
                'fury.deficit',
                'fury_of_the_illidari.cooldown_ready',
                'variable.pooling_for_meta',
            },
            simc_line = 'actions.cooldown+=/metamorphosis,if=variable.pooling_for_meta&fury.deficit<30&(talent.chaos_blades.enabled|!cooldown.fury_of_the_illidari.ready)',
        },
        {
            action = 'potion',
            condition = 'buff.metamorphosis.remains>25|target.time_to_die<30',
            condition_converted = '((((metamorphosis.aura_remains_as_number) > (25))) or (((target.time_to_die_as_number) < (30))))',
            condition_keywords = {
                'metamorphosis.aura_remains',
                'target.time_to_die',
            },
            name = 'old_war',
            simc_line = 'actions.cooldown+=/potion,name=old_war,if=buff.metamorphosis.remains>25|target.time_to_die<30',
        },
    },
    default = {
        {
            action = 'auto_attack',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions=auto_attack',
        },
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'pooling_for_meta',
            simc_line = 'actions+=/variable,name=pooling_for_meta,value=cooldown.metamorphosis.ready&buff.metamorphosis.down&(!talent.demonic.enabled|!cooldown.eye_beam.ready)&(!talent.chaos_blades.enabled|cooldown.chaos_blades.ready)&(!talent.nemesis.enabled|debuff.nemesis.up|cooldown.nemesis.ready)',
            value = 'cooldown.metamorphosis.ready&buff.metamorphosis.down&(!talent.demonic.enabled|!cooldown.eye_beam.ready)&(!talent.chaos_blades.enabled|cooldown.chaos_blades.ready)&(!talent.nemesis.enabled|debuff.nemesis.up|cooldown.nemesis.ready)',
            value_converted = '((metamorphosis.cooldown_ready) and (((metamorphosis.aura_down) and (((((((not (demonic.talent_selected))) or ((not (eye_beam.cooldown_ready)))))) and (((((((not (chaos_blades.talent_selected))) or (chaos_blades.cooldown_ready)))) and (((((not (nemesis.talent_selected))) or (((nemesis.aura_up) or (nemesis.cooldown_ready)))))))))))))',
            value_keywords = {
                'chaos_blades.cooldown_ready',
                'chaos_blades.talent_selected',
                'demonic.talent_selected',
                'eye_beam.cooldown_ready',
                'metamorphosis.aura_down',
                'metamorphosis.cooldown_ready',
                'nemesis.aura_up',
                'nemesis.cooldown_ready',
                'nemesis.talent_selected',
            },
        },
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'blade_dance',
            simc_line = 'actions+=/variable,name=blade_dance,value=talent.first_blood.enabled|spell_targets.blade_dance1>=2+talent.chaos_cleave.enabled',
            value = 'talent.first_blood.enabled|spell_targets.blade_dance1>=2+talent.chaos_cleave.enabled',
            value_converted = '((first_blood.talent_selected) or (((spell_targets_as_number) >= ((2 + chaos_cleave.talent_selected_as_number)))))',
            value_keywords = {
                'chaos_cleave.talent_selected',
                'first_blood.talent_selected',
                'spell_targets',
            },
        },
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'pooling_for_blade_dance',
            simc_line = 'actions+=/variable,name=pooling_for_blade_dance,value=variable.blade_dance&fury-40<35-talent.first_blood.enabled*20&spell_targets.blade_dance1>=2',
            value = 'variable.blade_dance&fury-40<35-talent.first_blood.enabled*20&spell_targets.blade_dance1>=2',
            value_converted = '((variable.blade_dance) and ((((((fury.curr_as_number - 40)) < ((35 - (first_blood.talent_selected_as_number * 20))))) and (((spell_targets_as_number) >= (2))))))',
            value_keywords = {
                'first_blood.talent_selected',
                'fury.curr',
                'spell_targets',
                'variable.blade_dance',
            },
        },
        {
            action = 'blur',
            condition = 'artifact.demon_speed.enabled&cooldown.fel_rush.charges_fractional<0.5&cooldown.vengeful_retreat.remains-buff.momentum.remains>4',
            condition_converted = '((demon_speed.artifact_selected) and (((((fel_rush.cooldown_charges_fractional_as_number) < (0.5))) and ((((vengeful_retreat.cooldown_remains_as_number - momentum.aura_remains_as_number)) > (4))))))',
            condition_keywords = {
                'demon_speed.artifact_selected',
                'fel_rush.cooldown_charges_fractional',
                'momentum.aura_remains',
                'vengeful_retreat.cooldown_remains',
            },
            simc_line = 'actions+=/blur,if=artifact.demon_speed.enabled&cooldown.fel_rush.charges_fractional<0.5&cooldown.vengeful_retreat.remains-buff.momentum.remains>4',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'cooldown',
            simc_line = 'actions+=/call_action_list,name=cooldown',
        },
        {
            action = 'fel_rush',
            animation_cancel = '1',
            condition = 'time=0',
            condition_converted = '((time_since_combat_start) == (0))',
            condition_keywords = {
                'time_since_combat_start',
            },
            simc_line = 'actions+=/fel_rush,animation_cancel=1,if=time=0',
        },
        {
            action = 'pick_up_fragment',
            condition = 'talent.demonic_appetite.enabled&fury.deficit>=30',
            condition_converted = '((demonic_appetite.talent_selected) and (((fury.deficit_as_number) >= (30))))',
            condition_keywords = {
                'demonic_appetite.talent_selected',
                'fury.deficit',
            },
            simc_line = 'actions+=/pick_up_fragment,if=talent.demonic_appetite.enabled&fury.deficit>=30',
        },
        {
            action = 'consume_magic',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/consume_magic',
        },
        {
            action = 'vengeful_retreat',
            condition = '(talent.prepared.enabled|talent.momentum.enabled)&buff.prepared.down&buff.momentum.down',
            condition_converted = '(((((prepared.talent_selected) or (momentum.talent_selected)))) and (((prepared.aura_down) and (momentum.aura_down))))',
            condition_keywords = {
                'momentum.aura_down',
                'momentum.talent_selected',
                'prepared.aura_down',
                'prepared.talent_selected',
            },
            simc_line = 'actions+=/vengeful_retreat,if=(talent.prepared.enabled|talent.momentum.enabled)&buff.prepared.down&buff.momentum.down',
        },
        {
            action = 'fel_rush',
            animation_cancel = '1',
            condition = '(talent.momentum.enabled|talent.fel_mastery.enabled)&(!talent.momentum.enabled|(charges=2|cooldown.vengeful_retreat.remains>4)&buff.momentum.down)&(!talent.fel_mastery.enabled|fury.deficit>=25)&(charges=2|(raid_event.movement.in>10&raid_event.adds.in>10))',
            condition_converted = '(((((momentum.talent_selected) or (fel_mastery.talent_selected)))) and (((((((not (momentum.talent_selected))) or ((((((((fel_rush.spell_charges) == (2))) or (((vengeful_retreat.cooldown_remains_as_number) > (4)))))) and (momentum.aura_down)))))) and (((((((not (fel_mastery.talent_selected))) or (((fury.deficit_as_number) >= (25)))))) and ((((((fel_rush.spell_charges) == (2))) or ((((((movement.raid_event_in_as_number) > (10))) and (((adds.raid_event_in_as_number) > (10))))))))))))))',
            condition_keywords = {
                'adds.raid_event_in',
                'fel_mastery.talent_selected',
                'fel_rush.spell_charges',
                'fury.deficit',
                'momentum.aura_down',
                'momentum.talent_selected',
                'movement.raid_event_in',
                'vengeful_retreat.cooldown_remains',
            },
            simc_line = 'actions+=/fel_rush,animation_cancel=1,if=(talent.momentum.enabled|talent.fel_mastery.enabled)&(!talent.momentum.enabled|(charges=2|cooldown.vengeful_retreat.remains>4)&buff.momentum.down)&(!talent.fel_mastery.enabled|fury.deficit>=25)&(charges=2|(raid_event.movement.in>10&raid_event.adds.in>10))',
        },
        {
            action = 'fel_barrage',
            condition = 'charges>=5&(buff.momentum.up|!talent.momentum.enabled)&(active_enemies>desired_targets|raid_event.adds.in>30)',
            condition_converted = '((((fel_barrage.spell_charges_as_number) >= (5))) and ((((((momentum.aura_up) or ((not (momentum.talent_selected)))))) and ((((((active_enemies_as_number) > (desired_targets_as_number))) or (((adds.raid_event_in_as_number) > (30)))))))))',
            condition_keywords = {
                'active_enemies',
                'adds.raid_event_in',
                'desired_targets',
                'fel_barrage.spell_charges',
                'momentum.aura_up',
                'momentum.talent_selected',
            },
            simc_line = 'actions+=/fel_barrage,if=charges>=5&(buff.momentum.up|!talent.momentum.enabled)&(active_enemies>desired_targets|raid_event.adds.in>30)',
        },
        {
            action = 'throw_glaive',
            condition = 'talent.bloodlet.enabled&(!talent.momentum.enabled|buff.momentum.up)&charges=2',
            condition_converted = '((bloodlet.talent_selected) and (((((((not (momentum.talent_selected))) or (momentum.aura_up)))) and (((throw_glaive.spell_charges) == (2))))))',
            condition_keywords = {
                'bloodlet.talent_selected',
                'momentum.aura_up',
                'momentum.talent_selected',
                'throw_glaive.spell_charges',
            },
            simc_line = 'actions+=/throw_glaive,if=talent.bloodlet.enabled&(!talent.momentum.enabled|buff.momentum.up)&charges=2',
        },
        {
            action = 'fury_of_the_illidari',
            condition = 'active_enemies>desired_targets|raid_event.adds.in>55&(!talent.momentum.enabled|buff.momentum.up)',
            condition_converted = '((((active_enemies_as_number) > (desired_targets_as_number))) or (((((adds.raid_event_in_as_number) > (55))) and (((((not (momentum.talent_selected))) or (momentum.aura_up)))))))',
            condition_keywords = {
                'active_enemies',
                'adds.raid_event_in',
                'desired_targets',
                'momentum.aura_up',
                'momentum.talent_selected',
            },
            simc_line = 'actions+=/fury_of_the_illidari,if=active_enemies>desired_targets|raid_event.adds.in>55&(!talent.momentum.enabled|buff.momentum.up)',
        },
        {
            action = 'eye_beam',
            condition = 'talent.demonic.enabled&buff.metamorphosis.down&fury.deficit<30',
            condition_converted = '((demonic.talent_selected) and (((metamorphosis.aura_down) and (((fury.deficit_as_number) < (30))))))',
            condition_keywords = {
                'demonic.talent_selected',
                'fury.deficit',
                'metamorphosis.aura_down',
            },
            simc_line = 'actions+=/eye_beam,if=talent.demonic.enabled&buff.metamorphosis.down&fury.deficit<30',
        },
        {
            action = 'death_sweep',
            condition = 'variable.blade_dance',
            condition_converted = 'variable.blade_dance',
            condition_keywords = {
                'variable.blade_dance',
            },
            simc_line = 'actions+=/death_sweep,if=variable.blade_dance',
        },
        {
            action = 'blade_dance',
            condition = 'variable.blade_dance',
            condition_converted = 'variable.blade_dance',
            condition_keywords = {
                'variable.blade_dance',
            },
            simc_line = 'actions+=/blade_dance,if=variable.blade_dance',
        },
        {
            action = 'throw_glaive',
            condition = 'talent.bloodlet.enabled&spell_targets>=2+talent.chaos_cleave.enabled&(!talent.master_of_the_glaive.enabled|!talent.momentum.enabled|buff.momentum.up)&(spell_targets>=3|raid_event.adds.in>recharge_time+cooldown)',
            condition_converted = '((bloodlet.talent_selected) and (((((spell_targets_as_number) >= ((2 + chaos_cleave.talent_selected_as_number)))) and (((((((not (master_of_the_glaive.talent_selected))) or ((((not (momentum.talent_selected))) or (momentum.aura_up)))))) and ((((((spell_targets_as_number) >= (3))) or (((adds.raid_event_in_as_number) > ((throw_glaive.spell_recharge_time_as_number + throw_glaive.cooldown_remains_as_number))))))))))))',
            condition_keywords = {
                'adds.raid_event_in',
                'bloodlet.talent_selected',
                'chaos_cleave.talent_selected',
                'master_of_the_glaive.talent_selected',
                'momentum.aura_up',
                'momentum.talent_selected',
                'spell_targets',
                'throw_glaive.cooldown_remains',
                'throw_glaive.spell_recharge_time',
            },
            simc_line = 'actions+=/throw_glaive,if=talent.bloodlet.enabled&spell_targets>=2+talent.chaos_cleave.enabled&(!talent.master_of_the_glaive.enabled|!talent.momentum.enabled|buff.momentum.up)&(spell_targets>=3|raid_event.adds.in>recharge_time+cooldown)',
        },
        {
            action = 'fel_eruption',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/fel_eruption',
        },
        {
            action = 'felblade',
            condition = 'fury.deficit>=30+buff.prepared.up*8',
            condition_converted = '((fury.deficit_as_number) >= ((30 + (prepared.aura_up_as_number * 8))))',
            condition_keywords = {
                'fury.deficit',
                'prepared.aura_up',
            },
            simc_line = 'actions+=/felblade,if=fury.deficit>=30+buff.prepared.up*8',
        },
        {
            action = 'annihilation',
            condition = '(talent.demon_blades.enabled|!talent.momentum.enabled|buff.momentum.up|fury.deficit<30+buff.prepared.up*8|buff.metamorphosis.remains<5)&!variable.pooling_for_blade_dance',
            condition_converted = '(((((demon_blades.talent_selected) or ((((not (momentum.talent_selected))) or (((momentum.aura_up) or (((((fury.deficit_as_number) < ((30 + (prepared.aura_up_as_number * 8))))) or (((metamorphosis.aura_remains_as_number) < (5)))))))))))) and ((not (variable.pooling_for_blade_dance))))',
            condition_keywords = {
                'demon_blades.talent_selected',
                'fury.deficit',
                'metamorphosis.aura_remains',
                'momentum.aura_up',
                'momentum.talent_selected',
                'prepared.aura_up',
                'variable.pooling_for_blade_dance',
            },
            simc_line = 'actions+=/annihilation,if=(talent.demon_blades.enabled|!talent.momentum.enabled|buff.momentum.up|fury.deficit<30+buff.prepared.up*8|buff.metamorphosis.remains<5)&!variable.pooling_for_blade_dance',
        },
        {
            action = 'throw_glaive',
            condition = 'talent.bloodlet.enabled&(!talent.master_of_the_glaive.enabled|!talent.momentum.enabled|buff.momentum.up)&raid_event.adds.in>recharge_time+cooldown',
            condition_converted = '((bloodlet.talent_selected) and (((((((not (master_of_the_glaive.talent_selected))) or ((((not (momentum.talent_selected))) or (momentum.aura_up)))))) and (((adds.raid_event_in_as_number) > ((throw_glaive.spell_recharge_time_as_number + throw_glaive.cooldown_remains_as_number)))))))',
            condition_keywords = {
                'adds.raid_event_in',
                'bloodlet.talent_selected',
                'master_of_the_glaive.talent_selected',
                'momentum.aura_up',
                'momentum.talent_selected',
                'throw_glaive.cooldown_remains',
                'throw_glaive.spell_recharge_time',
            },
            simc_line = 'actions+=/throw_glaive,if=talent.bloodlet.enabled&(!talent.master_of_the_glaive.enabled|!talent.momentum.enabled|buff.momentum.up)&raid_event.adds.in>recharge_time+cooldown',
        },
        {
            action = 'eye_beam',
            condition = '!talent.demonic.enabled&((spell_targets.eye_beam_tick>desired_targets&active_enemies>1)|(raid_event.adds.in>45&!variable.pooling_for_meta&buff.metamorphosis.down&(artifact.anguish_of_the_deceiver.enabled|active_enemies>1)))',
            condition_converted = '(((not (demonic.talent_selected))) and (((((((((spell_targets_as_number) > (desired_targets_as_number))) and (((active_enemies_as_number) > (1)))))) or ((((((adds.raid_event_in_as_number) > (45))) and ((((not (variable.pooling_for_meta))) and (((metamorphosis.aura_down) and ((((anguish_of_the_deceiver.artifact_selected) or (((active_enemies_as_number) > (1)))))))))))))))))',
            condition_keywords = {
                'active_enemies',
                'adds.raid_event_in',
                'anguish_of_the_deceiver.artifact_selected',
                'demonic.talent_selected',
                'desired_targets',
                'metamorphosis.aura_down',
                'spell_targets',
                'variable.pooling_for_meta',
            },
            simc_line = 'actions+=/eye_beam,if=!talent.demonic.enabled&((spell_targets.eye_beam_tick>desired_targets&active_enemies>1)|(raid_event.adds.in>45&!variable.pooling_for_meta&buff.metamorphosis.down&(artifact.anguish_of_the_deceiver.enabled|active_enemies>1)))',
        },
        {
            action = 'demons_bite',
            condition = 'talent.demonic.enabled&buff.metamorphosis.down&cooldown.eye_beam.remains<gcd&fury.deficit>=20',
            condition_converted = '((demonic.talent_selected) and (((metamorphosis.aura_down) and (((((eye_beam.cooldown_remains_as_number) < (gcd_as_number))) and (((fury.deficit_as_number) >= (20))))))))',
            condition_keywords = {
                'demonic.talent_selected',
                'eye_beam.cooldown_remains',
                'fury.deficit',
                'gcd',
                'metamorphosis.aura_down',
            },
            simc_line = 'actions+=/demons_bite,if=talent.demonic.enabled&buff.metamorphosis.down&cooldown.eye_beam.remains<gcd&fury.deficit>=20',
        },
        {
            action = 'demons_bite',
            condition = 'talent.demonic.enabled&buff.metamorphosis.down&cooldown.eye_beam.remains<2*gcd&fury.deficit>=45',
            condition_converted = '((demonic.talent_selected) and (((metamorphosis.aura_down) and (((((eye_beam.cooldown_remains_as_number) < ((2 * gcd_as_number)))) and (((fury.deficit_as_number) >= (45))))))))',
            condition_keywords = {
                'demonic.talent_selected',
                'eye_beam.cooldown_remains',
                'fury.deficit',
                'gcd',
                'metamorphosis.aura_down',
            },
            simc_line = 'actions+=/demons_bite,if=talent.demonic.enabled&buff.metamorphosis.down&cooldown.eye_beam.remains<2*gcd&fury.deficit>=45',
        },
        {
            action = 'throw_glaive',
            condition = 'buff.metamorphosis.down&spell_targets>=2',
            condition_converted = '((metamorphosis.aura_down) and (((spell_targets_as_number) >= (2))))',
            condition_keywords = {
                'metamorphosis.aura_down',
                'spell_targets',
            },
            simc_line = 'actions+=/throw_glaive,if=buff.metamorphosis.down&spell_targets>=2',
        },
        {
            action = 'chaos_strike',
            condition = '(talent.demon_blades.enabled|!talent.momentum.enabled|buff.momentum.up|fury.deficit<30+buff.prepared.up*8)&!variable.pooling_for_meta&!variable.pooling_for_blade_dance&(!talent.demonic.enabled|!cooldown.eye_beam.ready)',
            condition_converted = '(((((demon_blades.talent_selected) or ((((not (momentum.talent_selected))) or (((momentum.aura_up) or (((fury.deficit_as_number) < ((30 + (prepared.aura_up_as_number * 8)))))))))))) and ((((not (variable.pooling_for_meta))) and ((((not (variable.pooling_for_blade_dance))) and (((((not (demonic.talent_selected))) or ((not (eye_beam.cooldown_ready)))))))))))',
            condition_keywords = {
                'demon_blades.talent_selected',
                'demonic.talent_selected',
                'eye_beam.cooldown_ready',
                'fury.deficit',
                'momentum.aura_up',
                'momentum.talent_selected',
                'prepared.aura_up',
                'variable.pooling_for_blade_dance',
                'variable.pooling_for_meta',
            },
            simc_line = 'actions+=/chaos_strike,if=(talent.demon_blades.enabled|!talent.momentum.enabled|buff.momentum.up|fury.deficit<30+buff.prepared.up*8)&!variable.pooling_for_meta&!variable.pooling_for_blade_dance&(!talent.demonic.enabled|!cooldown.eye_beam.ready)',
        },
        {
            action = 'fel_barrage',
            condition = 'charges=4&buff.metamorphosis.down&(buff.momentum.up|!talent.momentum.enabled)&(active_enemies>desired_targets|raid_event.adds.in>30)',
            condition_converted = '((((fel_barrage.spell_charges) == (4))) and (((metamorphosis.aura_down) and ((((((momentum.aura_up) or ((not (momentum.talent_selected)))))) and ((((((active_enemies_as_number) > (desired_targets_as_number))) or (((adds.raid_event_in_as_number) > (30)))))))))))',
            condition_keywords = {
                'active_enemies',
                'adds.raid_event_in',
                'desired_targets',
                'fel_barrage.spell_charges',
                'metamorphosis.aura_down',
                'momentum.aura_up',
                'momentum.talent_selected',
            },
            simc_line = 'actions+=/fel_barrage,if=charges=4&buff.metamorphosis.down&(buff.momentum.up|!talent.momentum.enabled)&(active_enemies>desired_targets|raid_event.adds.in>30)',
        },
        {
            action = 'fel_rush',
            animation_cancel = '1',
            condition = '!talent.momentum.enabled&raid_event.movement.in>charges*10',
            condition_converted = '(((not (momentum.talent_selected))) and (((movement.raid_event_in_as_number) > ((fel_rush.spell_charges_as_number * 10)))))',
            condition_keywords = {
                'fel_rush.spell_charges',
                'momentum.talent_selected',
                'movement.raid_event_in',
            },
            simc_line = 'actions+=/fel_rush,animation_cancel=1,if=!talent.momentum.enabled&raid_event.movement.in>charges*10',
        },
        {
            action = 'demons_bite',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/demons_bite',
        },
        {
            action = 'throw_glaive',
            condition = 'buff.out_of_range.up|buff.raid_movement.up',
            condition_converted = '((out_of_range.aura_up) or (raid_movement.aura_up))',
            condition_keywords = {
                'out_of_range.aura_up',
                'raid_movement.aura_up',
            },
            simc_line = 'actions+=/throw_glaive,if=buff.out_of_range.up|buff.raid_movement.up',
        },
        {
            action = 'felblade',
            condition = 'movement.distance|buff.out_of_range.up',
            condition_converted = '((movement.distance) or (out_of_range.aura_up))',
            condition_keywords = {
                'movement.distance',
                'out_of_range.aura_up',
            },
            simc_line = 'actions+=/felblade,if=movement.distance|buff.out_of_range.up',
        },
        {
            action = 'fel_rush',
            condition = 'movement.distance>15|(buff.out_of_range.up&!talent.momentum.enabled)',
            condition_converted = '((((movement.distance_as_number) > (15))) or ((((out_of_range.aura_up) and ((not (momentum.talent_selected)))))))',
            condition_keywords = {
                'momentum.talent_selected',
                'movement.distance',
                'out_of_range.aura_up',
            },
            simc_line = 'actions+=/fel_rush,if=movement.distance>15|(buff.out_of_range.up&!talent.momentum.enabled)',
        },
        {
            action = 'vengeful_retreat',
            condition = 'movement.distance>15',
            condition_converted = '((movement.distance_as_number) > (15))',
            condition_keywords = {
                'movement.distance',
            },
            simc_line = 'actions+=/vengeful_retreat,if=movement.distance>15',
        },
    },
    precombat = {
        {
            action = 'flask',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat=flask,type=flask_of_the_seventh_demon',
            type = 'flask_of_the_seventh_demon',
        },
        {
            action = 'food',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/food,type=the_hungry_magister',
            type = 'the_hungry_magister',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'snapshot_stats',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/snapshot_stats',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
        {
            action = 'metamorphosis',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/metamorphosis',
        },
    },
}


