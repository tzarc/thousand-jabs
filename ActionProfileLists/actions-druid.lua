local _, internal = ...
internal.actions = internal.actions or {}

-- keywords: legion-dev::druid::balance
---- active_enemies
---- astral_power
---- astral_power.deficit
---- blessing_of_anshe.aura_down
---- blessing_of_elune.aura_down
---- blessing_of_the_ancients.talent_selected
---- celestial_alignment.aura_up
---- equipped.the_emerald_dreamcatcher
---- execute_time
---- full_moon.spell_charges
---- full_moon.spell_recharge_time
---- fury_of_elue.cooldown_remains
---- fury_of_elune.talent_selected
---- gcd.max
---- half_moon.spell_charges
---- half_moon.spell_recharge_time
---- incarnation.aura_up
---- lunar_empowerment.aura_stack
---- lunar_empowerment.aura_up
---- moonfire.aura_remains
---- natures_balance.talent_selected
---- new_moon.spell_charges
---- new_moon.spell_recharge_time
---- oneths_overconfidence.aura_up
---- solar_empowerment.aura_stack
---- solar_empowerment.aura_up
---- stellar_flare.aura_remains
---- sunfire.aura_remains
---- target.time_to_die
---- the_emerald_dreamcatcher.aura_remains
---- the_emerald_dreamcatcher.aura_up

internal.actions['legion-dev::druid::balance'] = {
    default = {
        {
            action = 'potion',
            condition = 'buff.celestial_alignment.up|buff.incarnation.up',
            condition_converted = '((celestial_alignment.aura_up) or (incarnation.aura_up))',
            condition_keywords = {
                'celestial_alignment.aura_up',
                'incarnation.aura_up',
            },
            name = 'deadly_grace',
            simc_line = 'actions=potion,name=deadly_grace,if=buff.celestial_alignment.up|buff.incarnation.up',
        },
        {
            action = 'blessing_of_elune',
            condition = 'active_enemies<=2&talent.blessing_of_the_ancients.enabled&buff.blessing_of_elune.down',
            condition_converted = '((((active_enemies_as_number) <= (2))) and (((blessing_of_the_ancients.talent_selected) and (blessing_of_elune.aura_down))))',
            condition_keywords = {
                'active_enemies',
                'blessing_of_elune.aura_down',
                'blessing_of_the_ancients.talent_selected',
            },
            simc_line = 'actions+=/blessing_of_elune,if=active_enemies<=2&talent.blessing_of_the_ancients.enabled&buff.blessing_of_elune.down',
        },
        {
            action = 'blessing_of_elune',
            condition = 'active_enemies>=3&talent.blessing_of_the_ancients.enabled&buff.blessing_of_anshe.down',
            condition_converted = '((((active_enemies_as_number) >= (3))) and (((blessing_of_the_ancients.talent_selected) and (blessing_of_anshe.aura_down))))',
            condition_keywords = {
                'active_enemies',
                'blessing_of_anshe.aura_down',
                'blessing_of_the_ancients.talent_selected',
            },
            simc_line = 'actions+=/blessing_of_elune,if=active_enemies>=3&talent.blessing_of_the_ancients.enabled&buff.blessing_of_anshe.down',
        },
        {
            action = 'blood_fury',
            condition = 'buff.celestial_alignment.up|buff.incarnation.up',
            condition_converted = '((celestial_alignment.aura_up) or (incarnation.aura_up))',
            condition_keywords = {
                'celestial_alignment.aura_up',
                'incarnation.aura_up',
            },
            simc_line = 'actions+=/blood_fury,if=buff.celestial_alignment.up|buff.incarnation.up',
        },
        {
            action = 'berserking',
            condition = 'buff.celestial_alignment.up|buff.incarnation.up',
            condition_converted = '((celestial_alignment.aura_up) or (incarnation.aura_up))',
            condition_keywords = {
                'celestial_alignment.aura_up',
                'incarnation.aura_up',
            },
            simc_line = 'actions+=/berserking,if=buff.celestial_alignment.up|buff.incarnation.up',
        },
        {
            action = 'arcane_torrent',
            condition = 'buff.celestial_alignment.up|buff.incarnation.up',
            condition_converted = '((celestial_alignment.aura_up) or (incarnation.aura_up))',
            condition_keywords = {
                'celestial_alignment.aura_up',
                'incarnation.aura_up',
            },
            simc_line = 'actions+=/arcane_torrent,if=buff.celestial_alignment.up|buff.incarnation.up',
        },
        {
            action = 'call_action_list',
            condition = 'talent.fury_of_elune.enabled&cooldown.fury_of_elue.remains<target.time_to_die',
            condition_converted = '((fury_of_elune.talent_selected) and (((fury_of_elue.cooldown_remains_as_number) < (target.time_to_die_as_number))))',
            condition_keywords = {
                'fury_of_elue.cooldown_remains',
                'fury_of_elune.talent_selected',
                'target.time_to_die',
            },
            name = 'fury_of_elune',
            simc_line = 'actions+=/call_action_list,name=fury_of_elune,if=talent.fury_of_elune.enabled&cooldown.fury_of_elue.remains<target.time_to_die',
        },
        {
            action = 'call_action_list',
            condition = 'equipped.the_emerald_dreamcatcher',
            condition_converted = 'equipped.the_emerald_dreamcatcher',
            condition_keywords = {
                'equipped.the_emerald_dreamcatcher',
            },
            name = 'ed',
            simc_line = 'actions+=/call_action_list,name=ed,if=equipped.the_emerald_dreamcatcher',
        },
        {
            action = 'new_moon',
            condition = '(charges=2&recharge_time<5)|charges=3',
            condition_converted = '(((((((new_moon.spell_charges) == (2))) and (((new_moon.spell_recharge_time_as_number) < (5)))))) or (((new_moon.spell_charges) == (3))))',
            condition_keywords = {
                'new_moon.spell_charges',
                'new_moon.spell_recharge_time',
            },
            simc_line = 'actions+=/new_moon,if=(charges=2&recharge_time<5)|charges=3',
        },
        {
            action = 'half_moon',
            condition = '(charges=2&recharge_time<5)|charges=3|(target.time_to_die<15&charges=2)',
            condition_converted = '(((((((half_moon.spell_charges) == (2))) and (((half_moon.spell_recharge_time_as_number) < (5)))))) or (((((half_moon.spell_charges) == (3))) or ((((((target.time_to_die_as_number) < (15))) and (((half_moon.spell_charges) == (2)))))))))',
            condition_keywords = {
                'half_moon.spell_charges',
                'half_moon.spell_recharge_time',
                'target.time_to_die',
            },
            simc_line = 'actions+=/half_moon,if=(charges=2&recharge_time<5)|charges=3|(target.time_to_die<15&charges=2)',
        },
        {
            action = 'full_moon',
            condition = '(charges=2&recharge_time<5)|charges=3|target.time_to_die<15',
            condition_converted = '(((((((full_moon.spell_charges) == (2))) and (((full_moon.spell_recharge_time_as_number) < (5)))))) or (((((full_moon.spell_charges) == (3))) or (((target.time_to_die_as_number) < (15))))))',
            condition_keywords = {
                'full_moon.spell_charges',
                'full_moon.spell_recharge_time',
                'target.time_to_die',
            },
            simc_line = 'actions+=/full_moon,if=(charges=2&recharge_time<5)|charges=3|target.time_to_die<15',
        },
        {
            action = 'stellar_flare',
            condition = 'active_enemies<4&remains<7.2&astral_power>=15',
            condition_converted = '((((active_enemies_as_number) < (4))) and (((((stellar_flare.aura_remains_as_number) < (7.2))) and (((astral_power_as_number) >= (15))))))',
            condition_keywords = {
                'active_enemies',
                'astral_power',
                'stellar_flare.aura_remains',
            },
            cycle_targets = '1',
            max_cycle_targets = '4',
            simc_line = 'actions+=/stellar_flare,cycle_targets=1,max_cycle_targets=4,if=active_enemies<4&remains<7.2&astral_power>=15',
        },
        {
            action = 'moonfire',
            condition = '(talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled)',
            condition_converted = '(((((natures_balance.talent_selected) and (((moonfire.aura_remains_as_number) < (3)))))) or ((((((moonfire.aura_remains_as_number) < (6.6))) and ((not (natures_balance.talent_selected)))))))',
            condition_keywords = {
                'moonfire.aura_remains',
                'natures_balance.talent_selected',
            },
            simc_line = 'actions+=/moonfire,if=(talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled)',
        },
        {
            action = 'sunfire',
            condition = '(talent.natures_balance.enabled&remains<3)|(remains<5.4&!talent.natures_balance.enabled)',
            condition_converted = '(((((natures_balance.talent_selected) and (((sunfire.aura_remains_as_number) < (3)))))) or ((((((sunfire.aura_remains_as_number) < (5.4))) and ((not (natures_balance.talent_selected)))))))',
            condition_keywords = {
                'natures_balance.talent_selected',
                'sunfire.aura_remains',
            },
            simc_line = 'actions+=/sunfire,if=(talent.natures_balance.enabled&remains<3)|(remains<5.4&!talent.natures_balance.enabled)',
        },
        {
            action = 'astral_communion',
            condition = 'astral_power.deficit>=75',
            condition_converted = '((astral_power.deficit_as_number) >= (75))',
            condition_keywords = {
                'astral_power.deficit',
            },
            simc_line = 'actions+=/astral_communion,if=astral_power.deficit>=75',
        },
        {
            action = 'incarnation',
            condition = 'astral_power>=40',
            condition_converted = '((astral_power_as_number) >= (40))',
            condition_keywords = {
                'astral_power',
            },
            simc_line = 'actions+=/incarnation,if=astral_power>=40',
        },
        {
            action = 'celestial_alignment',
            condition = 'astral_power>=40',
            condition_converted = '((astral_power_as_number) >= (40))',
            condition_keywords = {
                'astral_power',
            },
            simc_line = 'actions+=/celestial_alignment,if=astral_power>=40',
        },
        {
            action = 'starfall',
            condition = 'buff.oneths_overconfidence.up',
            condition_converted = 'oneths_overconfidence.aura_up',
            condition_keywords = {
                'oneths_overconfidence.aura_up',
            },
            simc_line = 'actions+=/starfall,if=buff.oneths_overconfidence.up',
        },
        {
            action = 'solar_wrath',
            condition = 'buff.solar_empowerment.stack=3',
            condition_converted = '((solar_empowerment.aura_stack) == (3))',
            condition_keywords = {
                'solar_empowerment.aura_stack',
            },
            simc_line = 'actions+=/solar_wrath,if=buff.solar_empowerment.stack=3',
        },
        {
            action = 'lunar_strike',
            condition = 'buff.lunar_empowerment.stack=3',
            condition_converted = '((lunar_empowerment.aura_stack) == (3))',
            condition_keywords = {
                'lunar_empowerment.aura_stack',
            },
            simc_line = 'actions+=/lunar_strike,if=buff.lunar_empowerment.stack=3',
        },
        {
            action = 'call_action_list',
            condition = 'buff.celestial_alignment.up|buff.incarnation.up',
            condition_converted = '((celestial_alignment.aura_up) or (incarnation.aura_up))',
            condition_keywords = {
                'celestial_alignment.aura_up',
                'incarnation.aura_up',
            },
            name = 'celestial_alignment_phase',
            simc_line = 'actions+=/call_action_list,name=celestial_alignment_phase,if=buff.celestial_alignment.up|buff.incarnation.up',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'single_target',
            simc_line = 'actions+=/call_action_list,name=single_target',
        },
    },
    ed = {
        {
            action = 'astral_communion',
            condition = 'astral_power.deficit>=75&buff.the_emerald_dreamcatcher.up',
            condition_converted = '((((astral_power.deficit_as_number) >= (75))) and (the_emerald_dreamcatcher.aura_up))',
            condition_keywords = {
                'astral_power.deficit',
                'the_emerald_dreamcatcher.aura_up',
            },
            simc_line = 'actions.ed=astral_communion,if=astral_power.deficit>=75&buff.the_emerald_dreamcatcher.up',
        },
        {
            action = 'incarnation',
            condition = 'astral_power>=85&!buff.the_emerald_dreamcatcher.up',
            condition_converted = '((((astral_power_as_number) >= (85))) and ((not (the_emerald_dreamcatcher.aura_up))))',
            condition_keywords = {
                'astral_power',
                'the_emerald_dreamcatcher.aura_up',
            },
            simc_line = 'actions.ed+=/incarnation,if=astral_power>=85&!buff.the_emerald_dreamcatcher.up',
        },
        {
            action = 'celestial_alignment',
            condition = 'astral_power>=85&!buff.the_emerald_dreamcatcher.up',
            condition_converted = '((((astral_power_as_number) >= (85))) and ((not (the_emerald_dreamcatcher.aura_up))))',
            condition_keywords = {
                'astral_power',
                'the_emerald_dreamcatcher.aura_up',
            },
            simc_line = 'actions.ed+=/celestial_alignment,if=astral_power>=85&!buff.the_emerald_dreamcatcher.up',
        },
        {
            action = 'starsurge',
            condition = '(buff.the_emerald_dreamcatcher.up&buff.the_emerald_dreamcatcher.remains<gcd.max)|astral_power>=90|((buff.celestial_alignment.up|buff.incarnation.up)&astral_power>=85)',
            condition_converted = '(((((the_emerald_dreamcatcher.aura_up) and (((the_emerald_dreamcatcher.aura_remains_as_number) < (gcd.max_as_number)))))) or (((((astral_power_as_number) >= (90))) or (((((((celestial_alignment.aura_up) or (incarnation.aura_up)))) and (((astral_power_as_number) >= (85)))))))))',
            condition_keywords = {
                'astral_power',
                'celestial_alignment.aura_up',
                'gcd.max',
                'incarnation.aura_up',
                'the_emerald_dreamcatcher.aura_remains',
                'the_emerald_dreamcatcher.aura_up',
            },
            simc_line = 'actions.ed+=/starsurge,if=(buff.the_emerald_dreamcatcher.up&buff.the_emerald_dreamcatcher.remains<gcd.max)|astral_power>=90|((buff.celestial_alignment.up|buff.incarnation.up)&astral_power>=85)',
        },
        {
            action = 'stellar_flare',
            condition = 'active_enemies<4&remains<7.2&astral_power>=15',
            condition_converted = '((((active_enemies_as_number) < (4))) and (((((stellar_flare.aura_remains_as_number) < (7.2))) and (((astral_power_as_number) >= (15))))))',
            condition_keywords = {
                'active_enemies',
                'astral_power',
                'stellar_flare.aura_remains',
            },
            cycle_targets = '1',
            max_cycle_targets = '4',
            simc_line = 'actions.ed+=/stellar_flare,cycle_targets=1,max_cycle_targets=4,if=active_enemies<4&remains<7.2&astral_power>=15',
        },
        {
            action = 'moonfire',
            condition = '(talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled)',
            condition_converted = '(((((natures_balance.talent_selected) and (((moonfire.aura_remains_as_number) < (3)))))) or ((((((moonfire.aura_remains_as_number) < (6.6))) and ((not (natures_balance.talent_selected)))))))',
            condition_keywords = {
                'moonfire.aura_remains',
                'natures_balance.talent_selected',
            },
            simc_line = 'actions.ed+=/moonfire,if=(talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled)',
        },
        {
            action = 'sunfire',
            condition = '(talent.natures_balance.enabled&remains<3)|(remains<5.4&!talent.natures_balance.enabled)',
            condition_converted = '(((((natures_balance.talent_selected) and (((sunfire.aura_remains_as_number) < (3)))))) or ((((((sunfire.aura_remains_as_number) < (5.4))) and ((not (natures_balance.talent_selected)))))))',
            condition_keywords = {
                'natures_balance.talent_selected',
                'sunfire.aura_remains',
            },
            simc_line = 'actions.ed+=/sunfire,if=(talent.natures_balance.enabled&remains<3)|(remains<5.4&!talent.natures_balance.enabled)',
        },
        {
            action = 'solar_wrath',
            condition = 'buff.solar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=12&dot.sunfire.remains<5.4&dot.moonfire.remains>6.6',
            condition_converted = '((solar_empowerment.aura_up) and (((((the_emerald_dreamcatcher.aura_remains_as_number) > (execute_time_as_number))) and (((((astral_power_as_number) >= (12))) and (((((sunfire.aura_remains_as_number) < (5.4))) and (((moonfire.aura_remains_as_number) > (6.6))))))))))',
            condition_keywords = {
                'astral_power',
                'execute_time',
                'moonfire.aura_remains',
                'solar_empowerment.aura_up',
                'sunfire.aura_remains',
                'the_emerald_dreamcatcher.aura_remains',
            },
            simc_line = 'actions.ed+=/solar_wrath,if=buff.solar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=12&dot.sunfire.remains<5.4&dot.moonfire.remains>6.6',
        },
        {
            action = 'lunar_strike',
            condition = 'buff.lunar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=8&(!(buff.celestial_alignment.up|buff.incarnation.up)|(buff.celestial_alignment.up|buff.incarnation.up)&astral_power<=77)',
            condition_converted = '((lunar_empowerment.aura_up) and (((((the_emerald_dreamcatcher.aura_remains_as_number) > (execute_time_as_number))) and (((((astral_power_as_number) >= (8))) and (((((not ((((celestial_alignment.aura_up) or (incarnation.aura_up)))))) or ((((((celestial_alignment.aura_up) or (incarnation.aura_up)))) and (((astral_power_as_number) <= (77)))))))))))))',
            condition_keywords = {
                'astral_power',
                'celestial_alignment.aura_up',
                'execute_time',
                'incarnation.aura_up',
                'lunar_empowerment.aura_up',
                'the_emerald_dreamcatcher.aura_remains',
            },
            simc_line = 'actions.ed+=/lunar_strike,if=buff.lunar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=8&(!(buff.celestial_alignment.up|buff.incarnation.up)|(buff.celestial_alignment.up|buff.incarnation.up)&astral_power<=77)',
        },
        {
            action = 'new_moon',
            condition = 'astral_power<=90',
            condition_converted = '((astral_power_as_number) <= (90))',
            condition_keywords = {
                'astral_power',
            },
            simc_line = 'actions.ed+=/new_moon,if=astral_power<=90',
        },
        {
            action = 'half_moon',
            condition = 'astral_power<=80',
            condition_converted = '((astral_power_as_number) <= (80))',
            condition_keywords = {
                'astral_power',
            },
            simc_line = 'actions.ed+=/half_moon,if=astral_power<=80',
        },
        {
            action = 'full_moon',
            condition = 'astral_power<=60',
            condition_converted = '((astral_power_as_number) <= (60))',
            condition_keywords = {
                'astral_power',
            },
            simc_line = 'actions.ed+=/full_moon,if=astral_power<=60',
        },
        {
            action = 'solar_wrath',
            condition = 'buff.solar_empowerment.up',
            condition_converted = 'solar_empowerment.aura_up',
            condition_keywords = {
                'solar_empowerment.aura_up',
            },
            simc_line = 'actions.ed+=/solar_wrath,if=buff.solar_empowerment.up',
        },
        {
            action = 'lunar_strike',
            condition = 'buff.lunar_empowerment.up',
            condition_converted = 'lunar_empowerment.aura_up',
            condition_keywords = {
                'lunar_empowerment.aura_up',
            },
            simc_line = 'actions.ed+=/lunar_strike,if=buff.lunar_empowerment.up',
        },
        {
            action = 'solar_wrath',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.ed+=/solar_wrath',
        },
    },
    precombat = {
        {
            action = 'flask',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat=flask,type=flask_of_the_whispered_pact',
            type = 'flask_of_the_whispered_pact',
        },
        {
            action = 'food',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/food,type=azshari_salad',
            type = 'azshari_salad',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'moonkin_form',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/moonkin_form',
        },
        {
            action = 'blessing_of_elune',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/blessing_of_elune',
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
            name = 'deadly_grace',
            simc_line = 'actions.precombat+=/potion,name=deadly_grace',
        },
        {
            action = 'new_moon',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/new_moon',
        },
    },
}


-- keywords: legion-dev::druid::feral
---- adds.raid_event_exists
---- adds.raid_event_in
---- ashamanes_frenzy.cooldown_remains
---- berserk.aura_remains
---- berserk.aura_up
---- bloodtalons.aura_down
---- bloodtalons.aura_up
---- bloodtalons.talent_selected
---- brutal_slash.spell_charges
---- brutal_slash.spell_charges_fractional
---- brutal_slash.spell_max_charges
---- brutal_slash.talent_selected
---- cat_form.aura_up
---- clearcasting.aura_up
---- combo_points
---- desired_targets
---- displacer_beast.aura_down
---- elunes_guidance.aura_down
---- elunes_guidance.aura_up
---- elunes_guidance.cooldown_remains
---- elunes_guidance.talent_selected
---- energy.curr
---- energy.deficit
---- energy.regen
---- energy.time_to_max
---- equipped.ailuro_pouncers
---- ferocious_bite.spell_cost
---- gcd
---- health.target_percent
---- incarnation.aura_remains
---- incarnation.aura_up
---- jagged_wounds.talent_selected
---- moment_of_clarity.talent_selected
---- moonfire_cat.aura_remains
---- moonfire_cat.spell_tick_time
---- movement.distance
---- persistent_multiplier
---- predatory_swiftness.aura_remains
---- predatory_swiftness.aura_stack
---- predatory_swiftness.aura_up
---- prowl.aura_up
---- rake.aura_remains
---- rake.aura_up
---- rake.spell_duration
---- rake.spell_pmultiplier
---- rake.spell_tick_time
---- rip.aura_remains
---- rip.aura_up
---- rip.spell_pmultiplier
---- rip.spell_tick_time
---- sabertooth.talent_selected
---- savage_roar.aura_remains
---- savage_roar.aura_up
---- savage_roar.talent_selected
---- set_bonus.tier18_4pc
---- soul_of_the_forest.talent_selected
---- spell_targets
---- t18_class_trinket
---- target.time_to_die
---- thrash_cat.aura_remains
---- thrash_cat.spell_duration
---- tigers_fury.aura_down
---- tigers_fury.aura_up
---- tigers_fury.cooldown_remains
---- time_since_combat_start
---- trinket.proc.all.react
---- wild_charge_movement.aura_down

internal.actions['legion-dev::druid::feral'] = {
    default = {
        {
            action = 'dash',
            condition = '!buff.cat_form.up',
            condition_converted = '(not (cat_form.aura_up))',
            condition_keywords = {
                'cat_form.aura_up',
            },
            simc_line = 'actions=dash,if=!buff.cat_form.up',
        },
        {
            action = 'cat_form',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/cat_form',
        },
        {
            action = 'wild_charge',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/wild_charge',
        },
        {
            action = 'displacer_beast',
            condition = 'movement.distance>10',
            condition_converted = '((movement.distance_as_number) > (10))',
            condition_keywords = {
                'movement.distance',
            },
            simc_line = 'actions+=/displacer_beast,if=movement.distance>10',
        },
        {
            action = 'dash',
            condition = 'movement.distance&buff.displacer_beast.down&buff.wild_charge_movement.down',
            condition_converted = '((movement.distance) and (((displacer_beast.aura_down) and (wild_charge_movement.aura_down))))',
            condition_keywords = {
                'displacer_beast.aura_down',
                'movement.distance',
                'wild_charge_movement.aura_down',
            },
            simc_line = 'actions+=/dash,if=movement.distance&buff.displacer_beast.down&buff.wild_charge_movement.down',
        },
        {
            action = 'rake',
            condition = 'buff.prowl.up',
            condition_converted = 'prowl.aura_up',
            condition_keywords = {
                'prowl.aura_up',
            },
            simc_line = 'actions+=/rake,if=buff.prowl.up',
        },
        {
            action = 'auto_attack',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/auto_attack',
        },
        {
            action = 'skull_bash',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/skull_bash',
        },
        {
            action = 'berserk',
            condition = 'buff.tigers_fury.up',
            condition_converted = 'tigers_fury.aura_up',
            condition_keywords = {
                'tigers_fury.aura_up',
            },
            simc_line = 'actions+=/berserk,if=buff.tigers_fury.up',
        },
        {
            action = 'incarnation',
            condition = 'cooldown.tigers_fury.remains<gcd',
            condition_converted = '((tigers_fury.cooldown_remains_as_number) < (gcd_as_number))',
            condition_keywords = {
                'gcd',
                'tigers_fury.cooldown_remains',
            },
            simc_line = 'actions+=/incarnation,if=cooldown.tigers_fury.remains<gcd',
        },
        {
            action = 'potion',
            condition = '((buff.berserk.remains>10|buff.incarnation.remains>20)&(target.time_to_die<180|(trinket.proc.all.react&target.health.pct<25)))|target.time_to_die<=40',
            condition_converted = '((((((((((berserk.aura_remains_as_number) > (10))) or (((incarnation.aura_remains_as_number) > (20)))))) and ((((((target.time_to_die_as_number) < (180))) or ((((trinket.proc.all.react) and (((health.target_percent_as_number) < (25)))))))))))) or (((target.time_to_die_as_number) <= (40))))',
            condition_keywords = {
                'berserk.aura_remains',
                'health.target_percent',
                'incarnation.aura_remains',
                'target.time_to_die',
                'trinket.proc.all.react',
            },
            name = 'old_war',
            simc_line = 'actions+=/potion,name=old_war,if=((buff.berserk.remains>10|buff.incarnation.remains>20)&(target.time_to_die<180|(trinket.proc.all.react&target.health.pct<25)))|target.time_to_die<=40',
        },
        {
            action = 'tigers_fury',
            condition = '(!buff.clearcasting.react&energy.deficit>=60)|energy.deficit>=80|(t18_class_trinket&buff.berserk.up&buff.tigers_fury.down)',
            condition_converted = '((((((not (clearcasting.aura_up))) and (((energy.deficit_as_number) >= (60)))))) or (((((energy.deficit_as_number) >= (80))) or ((((t18_class_trinket) and (((berserk.aura_up) and (tigers_fury.aura_down)))))))))',
            condition_keywords = {
                'berserk.aura_up',
                'clearcasting.aura_up',
                'energy.deficit',
                't18_class_trinket',
                'tigers_fury.aura_down',
            },
            simc_line = 'actions+=/tigers_fury,if=(!buff.clearcasting.react&energy.deficit>=60)|energy.deficit>=80|(t18_class_trinket&buff.berserk.up&buff.tigers_fury.down)',
        },
        {
            action = 'incarnation',
            condition = 'energy.time_to_max>1&energy>=35',
            condition_converted = '((((energy.time_to_max_as_number) > (1))) and (((energy.curr_as_number) >= (35))))',
            condition_keywords = {
                'energy.curr',
                'energy.time_to_max',
            },
            simc_line = 'actions+=/incarnation,if=energy.time_to_max>1&energy>=35',
        },
        {
            action = 'ferocious_bite',
            condition = 'dot.rip.ticking&dot.rip.remains<3&target.time_to_die>3&(target.health.pct<25|talent.sabertooth.enabled)',
            condition_converted = '((rip.aura_up) and (((((rip.aura_remains_as_number) < (3))) and (((((target.time_to_die_as_number) > (3))) and ((((((health.target_percent_as_number) < (25))) or (sabertooth.talent_selected)))))))))',
            condition_keywords = {
                'health.target_percent',
                'rip.aura_remains',
                'rip.aura_up',
                'sabertooth.talent_selected',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/ferocious_bite,cycle_targets=1,if=dot.rip.ticking&dot.rip.remains<3&target.time_to_die>3&(target.health.pct<25|talent.sabertooth.enabled)',
        },
        {
            action = 'regrowth',
            condition = 'talent.bloodtalons.enabled&buff.predatory_swiftness.up&(combo_points>=5|buff.predatory_swiftness.remains<1.5|(talent.bloodtalons.enabled&combo_points=2&buff.bloodtalons.down&cooldown.ashamanes_frenzy.remains<gcd)|(talent.elunes_guidance.enabled&((cooldown.elunes_guidance.remains<gcd&combo_points=0)|(buff.elunes_guidance.up&combo_points>=4))))',
            condition_converted = '((bloodtalons.talent_selected) and (((predatory_swiftness.aura_up) and ((((((combo_points_as_number) >= (5))) or (((((predatory_swiftness.aura_remains_as_number) < (1.5))) or ((((((bloodtalons.talent_selected) and (((((combo_points) == (2))) and (((bloodtalons.aura_down) and (((ashamanes_frenzy.cooldown_remains_as_number) < (gcd_as_number)))))))))) or ((((elunes_guidance.talent_selected) and (((((((((elunes_guidance.cooldown_remains_as_number) < (gcd_as_number))) and (((combo_points) == (0)))))) or ((((elunes_guidance.aura_up) and (((combo_points_as_number) >= (4))))))))))))))))))))))',
            condition_keywords = {
                'ashamanes_frenzy.cooldown_remains',
                'bloodtalons.aura_down',
                'bloodtalons.talent_selected',
                'combo_points',
                'elunes_guidance.aura_up',
                'elunes_guidance.cooldown_remains',
                'elunes_guidance.talent_selected',
                'gcd',
                'predatory_swiftness.aura_remains',
                'predatory_swiftness.aura_up',
            },
            simc_line = 'actions+=/regrowth,if=talent.bloodtalons.enabled&buff.predatory_swiftness.up&(combo_points>=5|buff.predatory_swiftness.remains<1.5|(talent.bloodtalons.enabled&combo_points=2&buff.bloodtalons.down&cooldown.ashamanes_frenzy.remains<gcd)|(talent.elunes_guidance.enabled&((cooldown.elunes_guidance.remains<gcd&combo_points=0)|(buff.elunes_guidance.up&combo_points>=4))))',
        },
        {
            action = 'call_action_list',
            condition = 'talent.sabertooth.enabled&time<20',
            condition_converted = '((sabertooth.talent_selected) and (((time_since_combat_start_as_number) < (20))))',
            condition_keywords = {
                'sabertooth.talent_selected',
                'time_since_combat_start',
            },
            name = 'sbt_opener',
            simc_line = 'actions+=/call_action_list,name=sbt_opener,if=talent.sabertooth.enabled&time<20',
        },
        {
            action = 'regrowth',
            condition = 'equipped.ailuro_pouncers&talent.bloodtalons.enabled&buff.predatory_swiftness.stack>1&buff.bloodtalons.down',
            condition_converted = '((equipped.ailuro_pouncers) and (((bloodtalons.talent_selected) and (((((predatory_swiftness.aura_stack_as_number) > (1))) and (bloodtalons.aura_down))))))',
            condition_keywords = {
                'bloodtalons.aura_down',
                'bloodtalons.talent_selected',
                'equipped.ailuro_pouncers',
                'predatory_swiftness.aura_stack',
            },
            simc_line = 'actions+=/regrowth,if=equipped.ailuro_pouncers&talent.bloodtalons.enabled&buff.predatory_swiftness.stack>1&buff.bloodtalons.down',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'finisher',
            simc_line = 'actions+=/call_action_list,name=finisher',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'generator',
            simc_line = 'actions+=/call_action_list,name=generator',
        },
    },
    finisher = {
        {
            action = 'pool_resource',
            condition = 'true',
            condition_converted = 'true',
            for_next = '1',
            simc_line = 'actions.finisher=pool_resource,for_next=1',
        },
        {
            action = 'savage_roar',
            condition = '!buff.savage_roar.up&(combo_points=5|(talent.brutal_slash.enabled&spell_targets.brutal_slash>desired_targets&action.brutal_slash.charges>0))',
            condition_converted = '(((not (savage_roar.aura_up))) and ((((((combo_points) == (5))) or ((((brutal_slash.talent_selected) and (((((spell_targets_as_number) > (desired_targets_as_number))) and (((brutal_slash.spell_charges_as_number) > (0))))))))))))',
            condition_keywords = {
                'brutal_slash.spell_charges',
                'brutal_slash.talent_selected',
                'combo_points',
                'desired_targets',
                'savage_roar.aura_up',
                'spell_targets',
            },
            simc_line = 'actions.finisher+=/savage_roar,if=!buff.savage_roar.up&(combo_points=5|(talent.brutal_slash.enabled&spell_targets.brutal_slash>desired_targets&action.brutal_slash.charges>0))',
        },
        {
            action = 'pool_resource',
            condition = 'true',
            condition_converted = 'true',
            for_next = '1',
            simc_line = 'actions.finisher+=/pool_resource,for_next=1',
        },
        {
            action = 'thrash_cat',
            condition = 'remains<=duration*0.3&spell_targets.thrash_cat>=5',
            condition_converted = '((((thrash_cat.aura_remains_as_number) <= ((thrash_cat.spell_duration_as_number * 0.3)))) and (((spell_targets_as_number) >= (5))))',
            condition_keywords = {
                'spell_targets',
                'thrash_cat.aura_remains',
                'thrash_cat.spell_duration',
            },
            cycle_targets = '1',
            simc_line = 'actions.finisher+=/thrash_cat,cycle_targets=1,if=remains<=duration*0.3&spell_targets.thrash_cat>=5',
        },
        {
            action = 'pool_resource',
            condition = 'true',
            condition_converted = 'true',
            for_next = '1',
            simc_line = 'actions.finisher+=/pool_resource,for_next=1',
        },
        {
            action = 'swipe_cat',
            condition = 'spell_targets.swipe_cat>=8',
            condition_converted = '((spell_targets_as_number) >= (8))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.finisher+=/swipe_cat,if=spell_targets.swipe_cat>=8',
        },
        {
            action = 'rip',
            condition = '(!ticking|(remains<8&target.health.pct>25&!talent.sabertooth.enabled)|persistent_multiplier>dot.rip.pmultiplier)&target.time_to_die-remains>tick_time*4&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|buff.clearcasting.react|talent.soul_of_the_forest.enabled|!dot.rip.ticking|(dot.rake.remains<1.5&spell_targets.swipe_cat<6))',
            condition_converted = '((((((not (rip.aura_up))) or ((((((((rip.aura_remains_as_number) < (8))) and (((((health.target_percent_as_number) > (25))) and ((not (sabertooth.talent_selected)))))))) or (((persistent_multiplier_as_number) > (rip.spell_pmultiplier_as_number)))))))) and ((((((target.time_to_die_as_number - rip.aura_remains_as_number)) > ((rip.spell_tick_time_as_number * 4)))) and (((((combo_points) == (5))) and ((((((energy.time_to_max_as_number) < (1))) or (((berserk.aura_up) or (((incarnation.aura_up) or (((elunes_guidance.aura_up) or (((((tigers_fury.cooldown_remains_as_number) < (3))) or (((set_bonus.tier18_4pc) or (((clearcasting.aura_up) or (((soul_of_the_forest.talent_selected) or ((((not (rip.aura_up))) or ((((((rake.aura_remains_as_number) < (1.5))) and (((spell_targets_as_number) < (6))))))))))))))))))))))))))))))',
            condition_keywords = {
                'berserk.aura_up',
                'clearcasting.aura_up',
                'combo_points',
                'elunes_guidance.aura_up',
                'energy.time_to_max',
                'health.target_percent',
                'incarnation.aura_up',
                'persistent_multiplier',
                'rake.aura_remains',
                'rip.aura_remains',
                'rip.aura_up',
                'rip.spell_pmultiplier',
                'rip.spell_tick_time',
                'sabertooth.talent_selected',
                'set_bonus.tier18_4pc',
                'soul_of_the_forest.talent_selected',
                'spell_targets',
                'target.time_to_die',
                'tigers_fury.cooldown_remains',
            },
            cycle_targets = '1',
            simc_line = 'actions.finisher+=/rip,cycle_targets=1,if=(!ticking|(remains<8&target.health.pct>25&!talent.sabertooth.enabled)|persistent_multiplier>dot.rip.pmultiplier)&target.time_to_die-remains>tick_time*4&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|buff.clearcasting.react|talent.soul_of_the_forest.enabled|!dot.rip.ticking|(dot.rake.remains<1.5&spell_targets.swipe_cat<6))',
        },
        {
            action = 'savage_roar',
            condition = '(buff.savage_roar.remains<=10.5|(buff.savage_roar.remains<=7.2&!talent.jagged_wounds.enabled))&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|buff.clearcasting.react|talent.soul_of_the_forest.enabled|!dot.rip.ticking|(dot.rake.remains<1.5&spell_targets.swipe_cat<6))',
            condition_converted = '(((((((savage_roar.aura_remains_as_number) <= (10.5))) or ((((((savage_roar.aura_remains_as_number) <= (7.2))) and ((not (jagged_wounds.talent_selected))))))))) and (((((combo_points) == (5))) and ((((((energy.time_to_max_as_number) < (1))) or (((berserk.aura_up) or (((incarnation.aura_up) or (((elunes_guidance.aura_up) or (((((tigers_fury.cooldown_remains_as_number) < (3))) or (((set_bonus.tier18_4pc) or (((clearcasting.aura_up) or (((soul_of_the_forest.talent_selected) or ((((not (rip.aura_up))) or ((((((rake.aura_remains_as_number) < (1.5))) and (((spell_targets_as_number) < (6))))))))))))))))))))))))))))',
            condition_keywords = {
                'berserk.aura_up',
                'clearcasting.aura_up',
                'combo_points',
                'elunes_guidance.aura_up',
                'energy.time_to_max',
                'incarnation.aura_up',
                'jagged_wounds.talent_selected',
                'rake.aura_remains',
                'rip.aura_up',
                'savage_roar.aura_remains',
                'set_bonus.tier18_4pc',
                'soul_of_the_forest.talent_selected',
                'spell_targets',
                'tigers_fury.cooldown_remains',
            },
            simc_line = 'actions.finisher+=/savage_roar,if=(buff.savage_roar.remains<=10.5|(buff.savage_roar.remains<=7.2&!talent.jagged_wounds.enabled))&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|buff.clearcasting.react|talent.soul_of_the_forest.enabled|!dot.rip.ticking|(dot.rake.remains<1.5&spell_targets.swipe_cat<6))',
        },
        {
            action = 'swipe_cat',
            condition = 'combo_points=5&(spell_targets.swipe_cat>=6|(spell_targets.swipe_cat>=3&!talent.bloodtalons.enabled))&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(talent.moment_of_clarity.enabled&buff.clearcasting.react))',
            condition_converted = '((((combo_points) == (5))) and ((((((((spell_targets_as_number) >= (6))) or ((((((spell_targets_as_number) >= (3))) and ((not (bloodtalons.talent_selected))))))))) and (((((combo_points) == (5))) and ((((((energy.time_to_max_as_number) < (1))) or (((berserk.aura_up) or (((incarnation.aura_up) or (((elunes_guidance.aura_up) or (((((tigers_fury.cooldown_remains_as_number) < (3))) or (((set_bonus.tier18_4pc) or ((((moment_of_clarity.talent_selected) and (clearcasting.aura_up))))))))))))))))))))))',
            condition_keywords = {
                'berserk.aura_up',
                'bloodtalons.talent_selected',
                'clearcasting.aura_up',
                'combo_points',
                'elunes_guidance.aura_up',
                'energy.time_to_max',
                'incarnation.aura_up',
                'moment_of_clarity.talent_selected',
                'set_bonus.tier18_4pc',
                'spell_targets',
                'tigers_fury.cooldown_remains',
            },
            simc_line = 'actions.finisher+=/swipe_cat,if=combo_points=5&(spell_targets.swipe_cat>=6|(spell_targets.swipe_cat>=3&!talent.bloodtalons.enabled))&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(talent.moment_of_clarity.enabled&buff.clearcasting.react))',
        },
        {
            action = 'ferocious_bite',
            condition = 'combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(talent.moment_of_clarity.enabled&buff.clearcasting.react))',
            condition_converted = '((((combo_points) == (5))) and ((((((energy.time_to_max_as_number) < (1))) or (((berserk.aura_up) or (((incarnation.aura_up) or (((elunes_guidance.aura_up) or (((((tigers_fury.cooldown_remains_as_number) < (3))) or (((set_bonus.tier18_4pc) or ((((moment_of_clarity.talent_selected) and (clearcasting.aura_up))))))))))))))))))',
            condition_keywords = {
                'berserk.aura_up',
                'clearcasting.aura_up',
                'combo_points',
                'elunes_guidance.aura_up',
                'energy.time_to_max',
                'incarnation.aura_up',
                'moment_of_clarity.talent_selected',
                'set_bonus.tier18_4pc',
                'tigers_fury.cooldown_remains',
            },
            cycle_targets = '1',
            max_energy = '1',
            simc_line = 'actions.finisher+=/ferocious_bite,max_energy=1,cycle_targets=1,if=combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(talent.moment_of_clarity.enabled&buff.clearcasting.react))',
        },
    },
    generator = {
        {
            action = 'brutal_slash',
            condition = 'spell_targets.brutal_slash>desired_targets&combo_points<5',
            condition_converted = '((((spell_targets_as_number) > (desired_targets_as_number))) and (((combo_points_as_number) < (5))))',
            condition_keywords = {
                'combo_points',
                'desired_targets',
                'spell_targets',
            },
            simc_line = 'actions.generator=brutal_slash,if=spell_targets.brutal_slash>desired_targets&combo_points<5',
        },
        {
            action = 'ashamanes_frenzy',
            condition = 'combo_points<=2&buff.elunes_guidance.down&(buff.bloodtalons.up|!talent.bloodtalons.enabled)&(buff.savage_roar.up|!talent.savage_roar.enabled)',
            condition_converted = '((((combo_points_as_number) <= (2))) and (((elunes_guidance.aura_down) and ((((((bloodtalons.aura_up) or ((not (bloodtalons.talent_selected)))))) and ((((savage_roar.aura_up) or ((not (savage_roar.talent_selected)))))))))))',
            condition_keywords = {
                'bloodtalons.aura_up',
                'bloodtalons.talent_selected',
                'combo_points',
                'elunes_guidance.aura_down',
                'savage_roar.aura_up',
                'savage_roar.talent_selected',
            },
            simc_line = 'actions.generator+=/ashamanes_frenzy,if=combo_points<=2&buff.elunes_guidance.down&(buff.bloodtalons.up|!talent.bloodtalons.enabled)&(buff.savage_roar.up|!talent.savage_roar.enabled)',
        },
        {
            action = 'pool_resource',
            condition = 'talent.elunes_guidance.enabled&combo_points=0&energy<action.ferocious_bite.cost+25-energy.regen*cooldown.elunes_guidance.remains',
            condition_converted = '((elunes_guidance.talent_selected) and (((((combo_points) == (0))) and (((energy.curr_as_number) < ((ferocious_bite.spell_cost_as_number + 25 - (energy.regen_as_number * elunes_guidance.cooldown_remains_as_number))))))))',
            condition_keywords = {
                'combo_points',
                'elunes_guidance.cooldown_remains',
                'elunes_guidance.talent_selected',
                'energy.curr',
                'energy.regen',
                'ferocious_bite.spell_cost',
            },
            simc_line = 'actions.generator+=/pool_resource,if=talent.elunes_guidance.enabled&combo_points=0&energy<action.ferocious_bite.cost+25-energy.regen*cooldown.elunes_guidance.remains',
        },
        {
            action = 'elunes_guidance',
            condition = 'talent.elunes_guidance.enabled&combo_points=0&energy>=action.ferocious_bite.cost+25',
            condition_converted = '((elunes_guidance.talent_selected) and (((((combo_points) == (0))) and (((energy.curr_as_number) >= ((ferocious_bite.spell_cost_as_number + 25)))))))',
            condition_keywords = {
                'combo_points',
                'elunes_guidance.talent_selected',
                'energy.curr',
                'ferocious_bite.spell_cost',
            },
            simc_line = 'actions.generator+=/elunes_guidance,if=talent.elunes_guidance.enabled&combo_points=0&energy>=action.ferocious_bite.cost+25',
        },
        {
            action = 'pool_resource',
            condition = 'true',
            condition_converted = 'true',
            for_next = '1',
            simc_line = 'actions.generator+=/pool_resource,for_next=1',
        },
        {
            action = 'thrash_cat',
            condition = 'talent.brutal_slash.enabled&spell_targets.thrash_cat>=9',
            condition_converted = '((brutal_slash.talent_selected) and (((spell_targets_as_number) >= (9))))',
            condition_keywords = {
                'brutal_slash.talent_selected',
                'spell_targets',
            },
            simc_line = 'actions.generator+=/thrash_cat,if=talent.brutal_slash.enabled&spell_targets.thrash_cat>=9',
        },
        {
            action = 'pool_resource',
            condition = 'true',
            condition_converted = 'true',
            for_next = '1',
            simc_line = 'actions.generator+=/pool_resource,for_next=1',
        },
        {
            action = 'swipe_cat',
            condition = 'spell_targets.swipe_cat>=6',
            condition_converted = '((spell_targets_as_number) >= (6))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.generator+=/swipe_cat,if=spell_targets.swipe_cat>=6',
        },
        {
            action = 'pool_resource',
            condition = 'true',
            condition_converted = 'true',
            for_next = '1',
            simc_line = 'actions.generator+=/pool_resource,for_next=1',
        },
        {
            action = 'rake',
            condition = 'combo_points<5&(!ticking|(!talent.bloodtalons.enabled&remains<duration*0.3)|(talent.bloodtalons.enabled&buff.bloodtalons.up&(!talent.soul_of_the_forest.enabled&remains<=7|remains<=5)&persistent_multiplier>dot.rake.pmultiplier*0.80))&target.time_to_die-remains>tick_time',
            condition_converted = '((((combo_points_as_number) < (5))) and (((((((not (rake.aura_up))) or (((((((not (bloodtalons.talent_selected))) and (((rake.aura_remains_as_number) < ((rake.spell_duration_as_number * 0.3))))))) or ((((bloodtalons.talent_selected) and (((bloodtalons.aura_up) and (((((((((not (soul_of_the_forest.talent_selected))) and (((rake.aura_remains_as_number) <= (7))))) or (((rake.aura_remains_as_number) <= (5)))))) and (((persistent_multiplier_as_number) > ((rake.spell_pmultiplier_as_number * 0.80)))))))))))))))) and ((((target.time_to_die_as_number - rake.aura_remains_as_number)) > (rake.spell_tick_time_as_number))))))',
            condition_keywords = {
                'bloodtalons.aura_up',
                'bloodtalons.talent_selected',
                'combo_points',
                'persistent_multiplier',
                'rake.aura_remains',
                'rake.aura_up',
                'rake.spell_duration',
                'rake.spell_pmultiplier',
                'rake.spell_tick_time',
                'soul_of_the_forest.talent_selected',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.generator+=/rake,cycle_targets=1,if=combo_points<5&(!ticking|(!talent.bloodtalons.enabled&remains<duration*0.3)|(talent.bloodtalons.enabled&buff.bloodtalons.up&(!talent.soul_of_the_forest.enabled&remains<=7|remains<=5)&persistent_multiplier>dot.rake.pmultiplier*0.80))&target.time_to_die-remains>tick_time',
        },
        {
            action = 'moonfire_cat',
            condition = 'combo_points<5&remains<=4.2&target.time_to_die-remains>tick_time*2',
            condition_converted = '((((combo_points_as_number) < (5))) and (((((moonfire_cat.aura_remains_as_number) <= (4.2))) and ((((target.time_to_die_as_number - moonfire_cat.aura_remains_as_number)) > ((moonfire_cat.spell_tick_time_as_number * 2)))))))',
            condition_keywords = {
                'combo_points',
                'moonfire_cat.aura_remains',
                'moonfire_cat.spell_tick_time',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.generator+=/moonfire_cat,cycle_targets=1,if=combo_points<5&remains<=4.2&target.time_to_die-remains>tick_time*2',
        },
        {
            action = 'pool_resource',
            condition = 'true',
            condition_converted = 'true',
            for_next = '1',
            simc_line = 'actions.generator+=/pool_resource,for_next=1',
        },
        {
            action = 'thrash_cat',
            condition = 'remains<=duration*0.3&spell_targets.swipe_cat>=2',
            condition_converted = '((((thrash_cat.aura_remains_as_number) <= ((thrash_cat.spell_duration_as_number * 0.3)))) and (((spell_targets_as_number) >= (2))))',
            condition_keywords = {
                'spell_targets',
                'thrash_cat.aura_remains',
                'thrash_cat.spell_duration',
            },
            cycle_targets = '1',
            simc_line = 'actions.generator+=/thrash_cat,cycle_targets=1,if=remains<=duration*0.3&spell_targets.swipe_cat>=2',
        },
        {
            action = 'brutal_slash',
            condition = 'combo_points<5&((raid_event.adds.exists&raid_event.adds.in>(1+max_charges-charges_fractional)*15)|(!raid_event.adds.exists&(charges_fractional>2.66&time>10)))',
            condition_converted = '((((combo_points_as_number) < (5))) and (((((((adds.raid_event_exists) and (((adds.raid_event_in_as_number) > (((1 + brutal_slash.spell_max_charges_as_number - brutal_slash.spell_charges_fractional_as_number) * 15))))))) or (((((not (adds.raid_event_exists))) and ((((((brutal_slash.spell_charges_fractional_as_number) > (2.66))) and (((time_since_combat_start_as_number) > (10)))))))))))))',
            condition_keywords = {
                'adds.raid_event_exists',
                'adds.raid_event_in',
                'brutal_slash.spell_charges_fractional',
                'brutal_slash.spell_max_charges',
                'combo_points',
                'time_since_combat_start',
            },
            simc_line = 'actions.generator+=/brutal_slash,if=combo_points<5&((raid_event.adds.exists&raid_event.adds.in>(1+max_charges-charges_fractional)*15)|(!raid_event.adds.exists&(charges_fractional>2.66&time>10)))',
        },
        {
            action = 'swipe_cat',
            condition = 'combo_points<5&spell_targets.swipe_cat>=3',
            condition_converted = '((((combo_points_as_number) < (5))) and (((spell_targets_as_number) >= (3))))',
            condition_keywords = {
                'combo_points',
                'spell_targets',
            },
            simc_line = 'actions.generator+=/swipe_cat,if=combo_points<5&spell_targets.swipe_cat>=3',
        },
        {
            action = 'shred',
            condition = 'combo_points<5&(spell_targets.swipe_cat<3|talent.brutal_slash.enabled)',
            condition_converted = '((((combo_points_as_number) < (5))) and ((((((spell_targets_as_number) < (3))) or (brutal_slash.talent_selected)))))',
            condition_keywords = {
                'brutal_slash.talent_selected',
                'combo_points',
                'spell_targets',
            },
            simc_line = 'actions.generator+=/shred,if=combo_points<5&(spell_targets.swipe_cat<3|talent.brutal_slash.enabled)',
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
            simc_line = 'actions.precombat+=/food,type=nightborne_delicacy_platter',
            type = 'nightborne_delicacy_platter',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'regrowth',
            condition = 'talent.bloodtalons.enabled',
            condition_converted = 'bloodtalons.talent_selected',
            condition_keywords = {
                'bloodtalons.talent_selected',
            },
            simc_line = 'actions.precombat+=/regrowth,if=talent.bloodtalons.enabled',
        },
        {
            action = 'cat_form',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/cat_form',
        },
        {
            action = 'prowl',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/prowl',
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
    },
}


-- keywords: legion-dev::druid::guardian
---- galactic_guardian.aura_up
---- gory_fur.aura_up
---- health
---- health.max
---- incarnation.aura_up
---- incoming_damage_over_5000
---- ironfur.aura_down
---- ironfur.aura_stack
---- ironfur.aura_up
---- moonfire.aura_remains
---- moonfire.aura_up
---- pulverize.aura_remains
---- pulverize.aura_up
---- rage.curr
---- thrash.aura_remains

internal.actions['legion-dev::druid::guardian'] = {
    default = {
        {
            action = 'auto_attack',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions=auto_attack',
        },
        {
            action = 'blood_fury',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/blood_fury',
        },
        {
            action = 'berserking',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/berserking',
        },
        {
            action = 'arcane_torrent',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/arcane_torrent',
        },
        {
            action = 'incarnation',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/incarnation',
        },
        {
            action = 'rage_of_the_sleeper',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/rage_of_the_sleeper',
        },
        {
            action = 'lunar_beam',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/lunar_beam',
        },
        {
            action = 'frenzied_regeneration',
            condition = 'incoming_damage_5s%health.max>=0.5|health<=health.max*0.4',
            condition_converted = '(((((incoming_damage_over_5000_as_number / health.max_as_number)) >= (0.5))) or (((health_as_number) <= ((health.max_as_number * 0.4)))))',
            condition_keywords = {
                'health',
                'health.max',
                'incoming_damage_over_5000',
            },
            simc_line = 'actions+=/frenzied_regeneration,if=incoming_damage_5s%health.max>=0.5|health<=health.max*0.4',
        },
        {
            action = 'bristling_fur',
            condition = 'buff.ironfur.stack=1|buff.ironfur.down',
            condition_converted = '((((ironfur.aura_stack) == (1))) or (ironfur.aura_down))',
            condition_keywords = {
                'ironfur.aura_down',
                'ironfur.aura_stack',
            },
            simc_line = 'actions+=/bristling_fur,if=buff.ironfur.stack=1|buff.ironfur.down',
        },
        {
            action = 'ironfur',
            condition = '(buff.ironfur.up=0)|(buff.gory_fur.up=1)|(rage>=80)',
            condition_converted = '(((((ironfur.aura_up) == (0)))) or ((((((gory_fur.aura_up) == (1)))) or ((((rage.curr_as_number) >= (80)))))))',
            condition_keywords = {
                'gory_fur.aura_up',
                'ironfur.aura_up',
                'rage.curr',
            },
            simc_line = 'actions+=/ironfur,if=(buff.ironfur.up=0)|(buff.gory_fur.up=1)|(rage>=80)',
        },
        {
            action = 'moonfire',
            condition = 'buff.incarnation.up=1&dot.moonfire.remains<=4.8',
            condition_converted = '((((incarnation.aura_up) == (1))) and (((moonfire.aura_remains_as_number) <= (4.8))))',
            condition_keywords = {
                'incarnation.aura_up',
                'moonfire.aura_remains',
            },
            simc_line = 'actions+=/moonfire,if=buff.incarnation.up=1&dot.moonfire.remains<=4.8',
        },
        {
            action = 'thrash_bear',
            condition = 'buff.incarnation.up=1&dot.thrash.remains<=4.5',
            condition_converted = '((((incarnation.aura_up) == (1))) and (((thrash.aura_remains_as_number) <= (4.5))))',
            condition_keywords = {
                'incarnation.aura_up',
                'thrash.aura_remains',
            },
            simc_line = 'actions+=/thrash_bear,if=buff.incarnation.up=1&dot.thrash.remains<=4.5',
        },
        {
            action = 'mangle',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/mangle',
        },
        {
            action = 'thrash_bear',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/thrash_bear',
        },
        {
            action = 'pulverize',
            condition = 'buff.pulverize.up=0|buff.pulverize.remains<=6',
            condition_converted = '((((pulverize.aura_up) == (0))) or (((pulverize.aura_remains_as_number) <= (6))))',
            condition_keywords = {
                'pulverize.aura_remains',
                'pulverize.aura_up',
            },
            simc_line = 'actions+=/pulverize,if=buff.pulverize.up=0|buff.pulverize.remains<=6',
        },
        {
            action = 'moonfire',
            condition = 'buff.galactic_guardian.up=1&(!ticking|dot.moonfire.remains<=4.8)',
            condition_converted = '((((galactic_guardian.aura_up) == (1))) and (((((not (moonfire.aura_up))) or (((moonfire.aura_remains_as_number) <= (4.8)))))))',
            condition_keywords = {
                'galactic_guardian.aura_up',
                'moonfire.aura_remains',
                'moonfire.aura_up',
            },
            simc_line = 'actions+=/moonfire,if=buff.galactic_guardian.up=1&(!ticking|dot.moonfire.remains<=4.8)',
        },
        {
            action = 'moonfire',
            condition = 'buff.galactic_guardian.up=1',
            condition_converted = '((galactic_guardian.aura_up) == (1))',
            condition_keywords = {
                'galactic_guardian.aura_up',
            },
            simc_line = 'actions+=/moonfire,if=buff.galactic_guardian.up=1',
        },
        {
            action = 'moonfire',
            condition = 'dot.moonfire.remains<=4.8',
            condition_converted = '((moonfire.aura_remains_as_number) <= (4.8))',
            condition_keywords = {
                'moonfire.aura_remains',
            },
            simc_line = 'actions+=/moonfire,if=dot.moonfire.remains<=4.8',
        },
        {
            action = 'swipe_bear',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/swipe_bear',
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
            simc_line = 'actions.precombat+=/food,type=azshari_salad',
            type = 'azshari_salad',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'bear_form',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/bear_form',
        },
        {
            action = 'snapshot_stats',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/snapshot_stats',
        },
    },
}


