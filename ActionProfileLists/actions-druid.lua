local _, internal = ...
internal.apls = internal.apls or {}
internal.actions = internal.actions or {}

internal.apls["legion-dev::druid::balance"] = [[
actions.precombat=flask,type=flask_of_the_whispered_pact
actions.precombat+=/food,type=azshari_salad
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/moonkin_form
actions.precombat+=/blessing_of_elune
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=deadly_grace
actions.precombat+=/new_moon
actions=potion,name=deadly_grace,if=buff.celestial_alignment.up|buff.incarnation.up
actions+=/blessing_of_elune,if=active_enemies<=2&talent.blessing_of_the_ancients.enabled&buff.blessing_of_elune.down
actions+=/blessing_of_elune,if=active_enemies>=3&talent.blessing_of_the_ancients.enabled&buff.blessing_of_anshe.down
actions+=/blood_fury,if=buff.celestial_alignment.up|buff.incarnation.up
actions+=/berserking,if=buff.celestial_alignment.up|buff.incarnation.up
actions+=/arcane_torrent,if=buff.celestial_alignment.up|buff.incarnation.up
actions+=/call_action_list,name=fury_of_elune,if=talent.fury_of_elune.enabled&cooldown.fury_of_elue.remains<target.time_to_die
actions+=/call_action_list,name=ed,if=equipped.the_emerald_dreamcatcher
actions+=/new_moon,if=(charges=2&recharge_time<5)|charges=3
actions+=/half_moon,if=(charges=2&recharge_time<5)|charges=3|(target.time_to_die<15&charges=2)
actions+=/full_moon,if=(charges=2&recharge_time<5)|charges=3|target.time_to_die<15
actions+=/stellar_flare,cycle_targets=1,max_cycle_targets=4,if=active_enemies<4&remains<7.2&astral_power>=15
actions+=/moonfire,if=(talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled)
actions+=/sunfire,if=(talent.natures_balance.enabled&remains<3)|(remains<5.4&!talent.natures_balance.enabled)
actions+=/astral_communion,if=astral_power.deficit>=75
actions+=/incarnation,if=astral_power>=40
actions+=/celestial_alignment,if=astral_power>=40
actions+=/starfall,if=buff.oneths_overconfidence.up
actions+=/solar_wrath,if=buff.solar_empowerment.stack=3
actions+=/lunar_strike,if=buff.lunar_empowerment.stack=3
actions+=/call_action_list,name=celestial_alignment_phase,if=buff.celestial_alignment.up|buff.incarnation.up
actions+=/call_action_list,name=single_target
actions.celestial_alignment_phase=starfall,if=(active_enemies>=2&talent.stellar_flare.enabled|active_enemies>=3)&((talent.fury_of_elune.enabled&cooldown.fury_of_elune.remains>12&buff.fury_of_elune_up.down)|!talent.fury_of_elune.enabled)
actions.celestial_alignment_phase+=/starsurge,if=active_enemies<=2
actions.celestial_alignment_phase+=/warrior_of_elune
actions.celestial_alignment_phase+=/lunar_strike,if=buff.warrior_of_elune.up
actions.celestial_alignment_phase+=/solar_wrath,if=buff.solar_empowerment.up
actions.celestial_alignment_phase+=/lunar_strike,if=buff.lunar_empowerment.up
actions.celestial_alignment_phase+=/solar_wrath,if=talent.natures_balance.enabled&dot.sunfire_dmg.remains<5&cast_time<dot.sunfire_dmg.remains
actions.celestial_alignment_phase+=/lunar_strike,if=(talent.natures_balance.enabled&dot.moonfire_dmg.remains<5&cast_time<dot.moonfire_dmg.remains)|active_enemies>=2
actions.celestial_alignment_phase+=/solar_wrath
actions.ed=astral_communion,if=astral_power.deficit>=75&buff.the_emerald_dreamcatcher.up
actions.ed+=/incarnation,if=astral_power>=85&!buff.the_emerald_dreamcatcher.up
actions.ed+=/celestial_alignment,if=astral_power>=85&!buff.the_emerald_dreamcatcher.up
actions.ed+=/starsurge,if=(buff.the_emerald_dreamcatcher.up&buff.the_emerald_dreamcatcher.remains<gcd.max)|astral_power>=90|((buff.celestial_alignment.up|buff.incarnation.up)&astral_power>=85)
actions.ed+=/stellar_flare,cycle_targets=1,max_cycle_targets=4,if=active_enemies<4&remains<7.2&astral_power>=15
actions.ed+=/moonfire,if=(talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled)
actions.ed+=/sunfire,if=(talent.natures_balance.enabled&remains<3)|(remains<5.4&!talent.natures_balance.enabled)
actions.ed+=/solar_wrath,if=buff.solar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=12&dot.sunfire.remains<5.4&dot.moonfire.remains>6.6
actions.ed+=/lunar_strike,if=buff.lunar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=8&(!(buff.celestial_alignment.up|buff.incarnation.up)|(buff.celestial_alignment.up|buff.incarnation.up)&astral_power<=77)
actions.ed+=/new_moon,if=astral_power<=90
actions.ed+=/half_moon,if=astral_power<=80
actions.ed+=/full_moon,if=astral_power<=60
actions.ed+=/solar_wrath,if=buff.solar_empowerment.up
actions.ed+=/lunar_strike,if=buff.lunar_empowerment.up
actions.ed+=/solar_wrath
actions.fury_of_elune=incarnation,if=astral_power>=95&cooldown.fury_of_elune.remains<=gcd
actions.fury_of_elune+=/fury_of_elune,if=astral_power>=95
actions.fury_of_elune+=/new_moon,if=((charges=2&recharge_time<5)|charges=3)&&(buff.fury_of_elune_up.up|(cooldown.fury_of_elune.remains>gcd*3&astral_power<=90))
actions.fury_of_elune+=/half_moon,if=((charges=2&recharge_time<5)|charges=3)&&(buff.fury_of_elune_up.up|(cooldown.fury_of_elune.remains>gcd*3&astral_power<=80))
actions.fury_of_elune+=/full_moon,if=((charges=2&recharge_time<5)|charges=3)&&(buff.fury_of_elune_up.up|(cooldown.fury_of_elune.remains>gcd*3&astral_power<=60))
actions.fury_of_elune+=/astral_communion,if=buff.fury_of_elune_up.up&astral_power<=25
actions.fury_of_elune+=/warrior_of_elune,if=buff.fury_of_elune_up.up|(cooldown.fury_of_elune.remains>=35&buff.lunar_empowerment.up)
actions.fury_of_elune+=/lunar_strike,if=buff.warrior_of_elune.up&(astral_power<=90|(astral_power<=85&buff.incarnation.up))
actions.fury_of_elune+=/new_moon,if=astral_power<=90&buff.fury_of_elune_up.up
actions.fury_of_elune+=/half_moon,if=astral_power<=80&buff.fury_of_elune_up.up&astral_power>cast_time*12
actions.fury_of_elune+=/full_moon,if=astral_power<=60&buff.fury_of_elune_up.up&astral_power>cast_time*12
actions.fury_of_elune+=/moonfire,if=buff.fury_of_elune_up.down&remains<=6.6
actions.fury_of_elune+=/sunfire,if=buff.fury_of_elune_up.down&remains<5.4
actions.fury_of_elune+=/stellar_flare,if=remains<7.2&active_enemies=1
actions.fury_of_elune+=/starfall,if=(active_enemies>=2&talent.stellar_flare.enabled|active_enemies>=3)&buff.fury_of_elune_up.down&cooldown.fury_of_elune.remains>10
actions.fury_of_elune+=/starsurge,if=active_enemies<=2&buff.fury_of_elune_up.down&cooldown.fury_of_elune.remains>7
actions.fury_of_elune+=/starsurge,if=buff.fury_of_elune_up.down&((astral_power>=92&cooldown.fury_of_elune.remains>gcd*3)|(cooldown.warrior_of_elune.remains<=5&cooldown.fury_of_elune.remains>=35&buff.lunar_empowerment.stack<2))
actions.fury_of_elune+=/solar_wrath,if=buff.solar_empowerment.up
actions.fury_of_elune+=/lunar_strike,if=buff.lunar_empowerment.stack=3|(buff.lunar_empowerment.remains<5&buff.lunar_empowerment.up)|active_enemies>=2
actions.fury_of_elune+=/solar_wrath
actions.single_target=new_moon,if=astral_power<=90
actions.single_target+=/half_moon,if=astral_power<=80
actions.single_target+=/full_moon,if=astral_power<=60
actions.single_target+=/starfall,if=(active_enemies>=2&talent.stellar_flare.enabled|active_enemies>=3)&((talent.fury_of_elune.enabled&cooldown.fury_of_elune.remains>12&buff.fury_of_elune_up.down)|!talent.fury_of_elune.enabled)
actions.single_target+=/starsurge,if=active_enemies<=2
actions.single_target+=/warrior_of_elune
actions.single_target+=/lunar_strike,if=buff.warrior_of_elune.up
actions.single_target+=/solar_wrath,if=buff.solar_empowerment.up
actions.single_target+=/lunar_strike,if=buff.lunar_empowerment.up
actions.single_target+=/solar_wrath,if=talent.natures_balance.enabled&dot.sunfire_dmg.remains<5&cast_time<dot.sunfire_dmg.remains
actions.single_target+=/lunar_strike,if=(talent.natures_balance.enabled&dot.moonfire_dmg.remains<5&cast_time<dot.moonfire_dmg.remains)|active_enemies>=2
actions.single_target+=/solar_wrath
]]

-- keywords: legion-dev::druid::balance
---- active_enemies
---- astral_power
---- astral_power.deficit
---- blessing_of_anshe.spell_remains
---- blessing_of_elune.spell_remains
---- blessing_of_the_ancients.talent_enabled
---- celestial_alignment.spell_remains
---- equipped.the_emerald_dreamcatcher
---- execute_time
---- full_moon.spell_charges
---- full_moon.spell_recharge_time
---- fury_of_elue.cooldown_remains
---- fury_of_elune.talent_enabled
---- gcd.max
---- half_moon.spell_charges
---- half_moon.spell_recharge_time
---- incarnation.spell_remains
---- lunar_empowerment.spell_remains
---- lunar_empowerment.spell_stack
---- moonfire.spell_remains
---- natures_balance.talent_enabled
---- new_moon.spell_charges
---- new_moon.spell_recharge_time
---- oneths_overconfidence.spell_remains
---- solar_empowerment.spell_remains
---- solar_empowerment.spell_stack
---- stellar_flare.spell_remains
---- sunfire.spell_remains
---- target.time_to_die
---- the_emerald_dreamcatcher.spell_remains

internal.actions['legion-dev::druid::balance'] = {
    default = {
        {
            action = 'potion',
            condition = 'buff.celestial_alignment.up|buff.incarnation.up',
            condition_converted = '(((celestial_alignment.spell_remains_as_number > 0)) or ((incarnation.spell_remains_as_number > 0)))',
            condition_keywords = {
                'celestial_alignment.spell_remains',
                'incarnation.spell_remains',
            },
            name = 'deadly_grace',
            simc_line = 'actions=potion,name=deadly_grace,if=buff.celestial_alignment.up|buff.incarnation.up',
        },
        {
            action = 'blessing_of_elune',
            condition = 'active_enemies<=2&talent.blessing_of_the_ancients.enabled&buff.blessing_of_elune.down',
            condition_converted = '((((active_enemies_as_number) <= (2))) and (((blessing_of_the_ancients.talent_enabled) and ((blessing_of_elune.spell_remains == 0)))))',
            condition_keywords = {
                'active_enemies',
                'blessing_of_elune.spell_remains',
                'blessing_of_the_ancients.talent_enabled',
            },
            simc_line = 'actions+=/blessing_of_elune,if=active_enemies<=2&talent.blessing_of_the_ancients.enabled&buff.blessing_of_elune.down',
        },
        {
            action = 'blessing_of_elune',
            condition = 'active_enemies>=3&talent.blessing_of_the_ancients.enabled&buff.blessing_of_anshe.down',
            condition_converted = '((((active_enemies_as_number) >= (3))) and (((blessing_of_the_ancients.talent_enabled) and ((blessing_of_anshe.spell_remains == 0)))))',
            condition_keywords = {
                'active_enemies',
                'blessing_of_anshe.spell_remains',
                'blessing_of_the_ancients.talent_enabled',
            },
            simc_line = 'actions+=/blessing_of_elune,if=active_enemies>=3&talent.blessing_of_the_ancients.enabled&buff.blessing_of_anshe.down',
        },
        {
            action = 'blood_fury',
            condition = 'buff.celestial_alignment.up|buff.incarnation.up',
            condition_converted = '(((celestial_alignment.spell_remains_as_number > 0)) or ((incarnation.spell_remains_as_number > 0)))',
            condition_keywords = {
                'celestial_alignment.spell_remains',
                'incarnation.spell_remains',
            },
            simc_line = 'actions+=/blood_fury,if=buff.celestial_alignment.up|buff.incarnation.up',
        },
        {
            action = 'berserking',
            condition = 'buff.celestial_alignment.up|buff.incarnation.up',
            condition_converted = '(((celestial_alignment.spell_remains_as_number > 0)) or ((incarnation.spell_remains_as_number > 0)))',
            condition_keywords = {
                'celestial_alignment.spell_remains',
                'incarnation.spell_remains',
            },
            simc_line = 'actions+=/berserking,if=buff.celestial_alignment.up|buff.incarnation.up',
        },
        {
            action = 'arcane_torrent',
            condition = 'buff.celestial_alignment.up|buff.incarnation.up',
            condition_converted = '(((celestial_alignment.spell_remains_as_number > 0)) or ((incarnation.spell_remains_as_number > 0)))',
            condition_keywords = {
                'celestial_alignment.spell_remains',
                'incarnation.spell_remains',
            },
            simc_line = 'actions+=/arcane_torrent,if=buff.celestial_alignment.up|buff.incarnation.up',
        },
        {
            action = 'call_action_list',
            condition = 'talent.fury_of_elune.enabled&cooldown.fury_of_elue.remains<target.time_to_die',
            condition_converted = '((fury_of_elune.talent_enabled) and (((fury_of_elue.cooldown_remains_as_number) < (target.time_to_die_as_number))))',
            condition_keywords = {
                'fury_of_elue.cooldown_remains',
                'fury_of_elune.talent_enabled',
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
            condition_converted = '((((active_enemies_as_number) < (4))) and (((((stellar_flare.spell_remains_as_number) < (7.2))) and (((astral_power_as_number) >= (15))))))',
            condition_keywords = {
                'active_enemies',
                'astral_power',
                'stellar_flare.spell_remains',
            },
            cycle_targets = '1',
            max_cycle_targets = '4',
            simc_line = 'actions+=/stellar_flare,cycle_targets=1,max_cycle_targets=4,if=active_enemies<4&remains<7.2&astral_power>=15',
        },
        {
            action = 'moonfire',
            condition = '(talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled)',
            condition_converted = '(((((natures_balance.talent_enabled) and (((moonfire.spell_remains_as_number) < (3)))))) or ((((((moonfire.spell_remains_as_number) < (6.6))) and ((not natures_balance.talent_enabled))))))',
            condition_keywords = {
                'moonfire.spell_remains',
                'natures_balance.talent_enabled',
            },
            simc_line = 'actions+=/moonfire,if=(talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled)',
        },
        {
            action = 'sunfire',
            condition = '(talent.natures_balance.enabled&remains<3)|(remains<5.4&!talent.natures_balance.enabled)',
            condition_converted = '(((((natures_balance.talent_enabled) and (((sunfire.spell_remains_as_number) < (3)))))) or ((((((sunfire.spell_remains_as_number) < (5.4))) and ((not natures_balance.talent_enabled))))))',
            condition_keywords = {
                'natures_balance.talent_enabled',
                'sunfire.spell_remains',
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
            condition_converted = '(oneths_overconfidence.spell_remains_as_number > 0)',
            condition_keywords = {
                'oneths_overconfidence.spell_remains',
            },
            simc_line = 'actions+=/starfall,if=buff.oneths_overconfidence.up',
        },
        {
            action = 'solar_wrath',
            condition = 'buff.solar_empowerment.stack=3',
            condition_converted = '((solar_empowerment.spell_stack) == (3))',
            condition_keywords = {
                'solar_empowerment.spell_stack',
            },
            simc_line = 'actions+=/solar_wrath,if=buff.solar_empowerment.stack=3',
        },
        {
            action = 'lunar_strike',
            condition = 'buff.lunar_empowerment.stack=3',
            condition_converted = '((lunar_empowerment.spell_stack) == (3))',
            condition_keywords = {
                'lunar_empowerment.spell_stack',
            },
            simc_line = 'actions+=/lunar_strike,if=buff.lunar_empowerment.stack=3',
        },
        {
            action = 'call_action_list',
            condition = 'buff.celestial_alignment.up|buff.incarnation.up',
            condition_converted = '(((celestial_alignment.spell_remains_as_number > 0)) or ((incarnation.spell_remains_as_number > 0)))',
            condition_keywords = {
                'celestial_alignment.spell_remains',
                'incarnation.spell_remains',
            },
            name = 'celestial_alignment_phase',
            simc_line = 'actions+=/call_action_list,name=celestial_alignment_phase,if=buff.celestial_alignment.up|buff.incarnation.up',
        },
        {
            action = 'call_action_list',
            name = 'single_target',
            simc_line = 'actions+=/call_action_list,name=single_target',
        },
    },
    ed = {
        {
            action = 'astral_communion',
            condition = 'astral_power.deficit>=75&buff.the_emerald_dreamcatcher.up',
            condition_converted = '((((astral_power.deficit_as_number) >= (75))) and ((the_emerald_dreamcatcher.spell_remains_as_number > 0)))',
            condition_keywords = {
                'astral_power.deficit',
                'the_emerald_dreamcatcher.spell_remains',
            },
            simc_line = 'actions.ed=astral_communion,if=astral_power.deficit>=75&buff.the_emerald_dreamcatcher.up',
        },
        {
            action = 'incarnation',
            condition = 'astral_power>=85&!buff.the_emerald_dreamcatcher.up',
            condition_converted = '((((astral_power_as_number) >= (85))) and ((not ((the_emerald_dreamcatcher.spell_remains_as_number > 0)))))',
            condition_keywords = {
                'astral_power',
                'the_emerald_dreamcatcher.spell_remains',
            },
            simc_line = 'actions.ed+=/incarnation,if=astral_power>=85&!buff.the_emerald_dreamcatcher.up',
        },
        {
            action = 'celestial_alignment',
            condition = 'astral_power>=85&!buff.the_emerald_dreamcatcher.up',
            condition_converted = '((((astral_power_as_number) >= (85))) and ((not ((the_emerald_dreamcatcher.spell_remains_as_number > 0)))))',
            condition_keywords = {
                'astral_power',
                'the_emerald_dreamcatcher.spell_remains',
            },
            simc_line = 'actions.ed+=/celestial_alignment,if=astral_power>=85&!buff.the_emerald_dreamcatcher.up',
        },
        {
            action = 'starsurge',
            condition = '(buff.the_emerald_dreamcatcher.up&buff.the_emerald_dreamcatcher.remains<gcd.max)|astral_power>=90|((buff.celestial_alignment.up|buff.incarnation.up)&astral_power>=85)',
            condition_converted = '((((((the_emerald_dreamcatcher.spell_remains_as_number > 0)) and (((the_emerald_dreamcatcher.spell_remains_as_number) < (gcd.max_as_number)))))) or (((((astral_power_as_number) >= (90))) or ((((((((celestial_alignment.spell_remains_as_number > 0)) or ((incarnation.spell_remains_as_number > 0))))) and (((astral_power_as_number) >= (85)))))))))',
            condition_keywords = {
                'astral_power',
                'celestial_alignment.spell_remains',
                'gcd.max',
                'incarnation.spell_remains',
                'the_emerald_dreamcatcher.spell_remains',
            },
            simc_line = 'actions.ed+=/starsurge,if=(buff.the_emerald_dreamcatcher.up&buff.the_emerald_dreamcatcher.remains<gcd.max)|astral_power>=90|((buff.celestial_alignment.up|buff.incarnation.up)&astral_power>=85)',
        },
        {
            action = 'stellar_flare',
            condition = 'active_enemies<4&remains<7.2&astral_power>=15',
            condition_converted = '((((active_enemies_as_number) < (4))) and (((((stellar_flare.spell_remains_as_number) < (7.2))) and (((astral_power_as_number) >= (15))))))',
            condition_keywords = {
                'active_enemies',
                'astral_power',
                'stellar_flare.spell_remains',
            },
            cycle_targets = '1',
            max_cycle_targets = '4',
            simc_line = 'actions.ed+=/stellar_flare,cycle_targets=1,max_cycle_targets=4,if=active_enemies<4&remains<7.2&astral_power>=15',
        },
        {
            action = 'moonfire',
            condition = '(talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled)',
            condition_converted = '(((((natures_balance.talent_enabled) and (((moonfire.spell_remains_as_number) < (3)))))) or ((((((moonfire.spell_remains_as_number) < (6.6))) and ((not natures_balance.talent_enabled))))))',
            condition_keywords = {
                'moonfire.spell_remains',
                'natures_balance.talent_enabled',
            },
            simc_line = 'actions.ed+=/moonfire,if=(talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled)',
        },
        {
            action = 'sunfire',
            condition = '(talent.natures_balance.enabled&remains<3)|(remains<5.4&!talent.natures_balance.enabled)',
            condition_converted = '(((((natures_balance.talent_enabled) and (((sunfire.spell_remains_as_number) < (3)))))) or ((((((sunfire.spell_remains_as_number) < (5.4))) and ((not natures_balance.talent_enabled))))))',
            condition_keywords = {
                'natures_balance.talent_enabled',
                'sunfire.spell_remains',
            },
            simc_line = 'actions.ed+=/sunfire,if=(talent.natures_balance.enabled&remains<3)|(remains<5.4&!talent.natures_balance.enabled)',
        },
        {
            action = 'solar_wrath',
            condition = 'buff.solar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=12&dot.sunfire.remains<5.4&dot.moonfire.remains>6.6',
            condition_converted = '(((solar_empowerment.spell_remains_as_number > 0)) and (((((the_emerald_dreamcatcher.spell_remains_as_number) > (execute_time_as_number))) and (((((astral_power_as_number) >= (12))) and (((((sunfire.spell_remains_as_number) < (5.4))) and (((moonfire.spell_remains_as_number) > (6.6))))))))))',
            condition_keywords = {
                'astral_power',
                'execute_time',
                'moonfire.spell_remains',
                'solar_empowerment.spell_remains',
                'sunfire.spell_remains',
                'the_emerald_dreamcatcher.spell_remains',
            },
            simc_line = 'actions.ed+=/solar_wrath,if=buff.solar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=12&dot.sunfire.remains<5.4&dot.moonfire.remains>6.6',
        },
        {
            action = 'lunar_strike',
            condition = 'buff.lunar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=8&(!(buff.celestial_alignment.up|buff.incarnation.up)|(buff.celestial_alignment.up|buff.incarnation.up)&astral_power<=77)',
            condition_converted = '(((lunar_empowerment.spell_remains_as_number > 0)) and (((((the_emerald_dreamcatcher.spell_remains_as_number) > (execute_time_as_number))) and (((((astral_power_as_number) >= (8))) and (((((not (((((celestial_alignment.spell_remains_as_number > 0)) or ((incarnation.spell_remains_as_number > 0))))))) or (((((((celestial_alignment.spell_remains_as_number > 0)) or ((incarnation.spell_remains_as_number > 0))))) and (((astral_power_as_number) <= (77)))))))))))))',
            condition_keywords = {
                'astral_power',
                'celestial_alignment.spell_remains',
                'execute_time',
                'incarnation.spell_remains',
                'lunar_empowerment.spell_remains',
                'the_emerald_dreamcatcher.spell_remains',
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
            condition_converted = '(solar_empowerment.spell_remains_as_number > 0)',
            condition_keywords = {
                'solar_empowerment.spell_remains',
            },
            simc_line = 'actions.ed+=/solar_wrath,if=buff.solar_empowerment.up',
        },
        {
            action = 'lunar_strike',
            condition = 'buff.lunar_empowerment.up',
            condition_converted = '(lunar_empowerment.spell_remains_as_number > 0)',
            condition_keywords = {
                'lunar_empowerment.spell_remains',
            },
            simc_line = 'actions.ed+=/lunar_strike,if=buff.lunar_empowerment.up',
        },
    },
    precombat = {
        {
            action = 'flask',
            simc_line = 'actions.precombat=flask,type=flask_of_the_whispered_pact',
            type = 'flask_of_the_whispered_pact',
        },
        {
            action = 'food',
            simc_line = 'actions.precombat+=/food,type=azshari_salad',
            type = 'azshari_salad',
        },
        {
            action = 'augmentation',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'potion',
            name = 'deadly_grace',
            simc_line = 'actions.precombat+=/potion,name=deadly_grace',
        },
    },
}


internal.apls["legion-dev::druid::feral"] = [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=nightborne_delicacy_platter
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/regrowth,if=talent.bloodtalons.enabled
actions.precombat+=/cat_form
actions.precombat+=/prowl
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=old_war
actions=dash,if=!buff.cat_form.up
actions+=/cat_form
actions+=/wild_charge
actions+=/displacer_beast,if=movement.distance>10
actions+=/dash,if=movement.distance&buff.displacer_beast.down&buff.wild_charge_movement.down
actions+=/rake,if=buff.prowl.up
actions+=/auto_attack
actions+=/skull_bash
actions+=/berserk,if=buff.tigers_fury.up
actions+=/incarnation,if=cooldown.tigers_fury.remains<gcd
actions+=/potion,name=old_war,if=((buff.berserk.remains>10|buff.incarnation.remains>20)&(target.time_to_die<180|(trinket.proc.all.react&target.health.pct<25)))|target.time_to_die<=40
actions+=/tigers_fury,if=(!buff.clearcasting.react&energy.deficit>=60)|energy.deficit>=80|(t18_class_trinket&buff.berserk.up&buff.tigers_fury.down)
actions+=/incarnation,if=energy.time_to_max>1&energy>=35
actions+=/ferocious_bite,cycle_targets=1,if=dot.rip.ticking&dot.rip.remains<3&target.time_to_die>3&(target.health.pct<25|talent.sabertooth.enabled)
actions+=/regrowth,if=talent.bloodtalons.enabled&buff.predatory_swiftness.up&(combo_points>=5|buff.predatory_swiftness.remains<1.5|(talent.bloodtalons.enabled&combo_points=2&buff.bloodtalons.down&cooldown.ashamanes_frenzy.remains<gcd)|(talent.elunes_guidance.enabled&((cooldown.elunes_guidance.remains<gcd&combo_points=0)|(buff.elunes_guidance.up&combo_points>=4))))
actions+=/call_action_list,name=sbt_opener,if=talent.sabertooth.enabled&time<20
actions+=/regrowth,if=equipped.ailuro_pouncers&talent.bloodtalons.enabled&buff.predatory_swiftness.stack>1&buff.bloodtalons.down
actions+=/call_action_list,name=finisher
actions+=/call_action_list,name=generator
actions.finisher=pool_resource,for_next=1
actions.finisher+=/savage_roar,if=!buff.savage_roar.up&(combo_points=5|(talent.brutal_slash.enabled&spell_targets.brutal_slash>desired_targets&action.brutal_slash.charges>0))
actions.finisher+=/pool_resource,for_next=1
actions.finisher+=/thrash_cat,cycle_targets=1,if=remains<=duration*0.3&spell_targets.thrash_cat>=5
actions.finisher+=/pool_resource,for_next=1
actions.finisher+=/swipe_cat,if=spell_targets.swipe_cat>=8
actions.finisher+=/rip,cycle_targets=1,if=(!ticking|(remains<8&target.health.pct>25&!talent.sabertooth.enabled)|persistent_multiplier>dot.rip.pmultiplier)&target.time_to_die-remains>tick_time*4&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|buff.clearcasting.react|talent.soul_of_the_forest.enabled|!dot.rip.ticking|(dot.rake.remains<1.5&spell_targets.swipe_cat<6))
actions.finisher+=/savage_roar,if=(buff.savage_roar.remains<=10.5|(buff.savage_roar.remains<=7.2&!talent.jagged_wounds.enabled))&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|buff.clearcasting.react|talent.soul_of_the_forest.enabled|!dot.rip.ticking|(dot.rake.remains<1.5&spell_targets.swipe_cat<6))
actions.finisher+=/swipe_cat,if=combo_points=5&(spell_targets.swipe_cat>=6|(spell_targets.swipe_cat>=3&!talent.bloodtalons.enabled))&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(talent.moment_of_clarity.enabled&buff.clearcasting.react))
actions.finisher+=/ferocious_bite,max_energy=1,cycle_targets=1,if=combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(talent.moment_of_clarity.enabled&buff.clearcasting.react))
actions.generator=brutal_slash,if=spell_targets.brutal_slash>desired_targets&combo_points<5
actions.generator+=/pool_resource,if=talent.elunes_guidance.enabled&combo_points=0&energy<action.ferocious_bite.cost+25-energy.regen*cooldown.elunes_guidance.remains
actions.generator+=/elunes_guidance,if=talent.elunes_guidance.enabled&combo_points=0&energy>=action.ferocious_bite.cost+25
actions.generator+=/pool_resource,for_next=1
actions.generator+=/thrash_cat,if=talent.brutal_slash.enabled&spell_targets.thrash_cat>=9
actions.generator+=/pool_resource,for_next=1
actions.generator+=/swipe_cat,if=spell_targets.swipe_cat>=6
actions.generator+=/pool_resource,for_next=1
actions.generator+=/rake,cycle_targets=1,if=combo_points<5&(!ticking|(!talent.bloodtalons.enabled&remains<duration*0.3)|(talent.bloodtalons.enabled&buff.bloodtalons.up&(!talent.soul_of_the_forest.enabled&remains<=7|remains<=5)&persistent_multiplier>dot.rake.pmultiplier*0.80))&target.time_to_die-remains>tick_time
actions.generator+=/moonfire_cat,cycle_targets=1,if=combo_points<5&remains<=4.2&target.time_to_die-remains>tick_time*2
actions.generator+=/pool_resource,for_next=1
actions.generator+=/thrash_cat,cycle_targets=1,if=remains<=duration*0.3&spell_targets.swipe_cat>=2
actions.generator+=/brutal_slash,if=combo_points<5&((raid_event.adds.exists&raid_event.adds.in>(1+max_charges-charges_fractional)*15)|(!raid_event.adds.exists&(charges_fractional>2.66&time>10)))
actions.generator+=/swipe_cat,if=combo_points<5&spell_targets.swipe_cat>=3
actions.generator+=/shred,if=combo_points<5&(spell_targets.swipe_cat<3|talent.brutal_slash.enabled)
actions.sbt_opener=regrowth,if=talent.bloodtalons.enabled&combo_points=5&!buff.bloodtalons.up&!dot.rip.ticking
actions.sbt_opener+=/tigers_fury,if=!dot.rip.ticking&combo_points=5
]]

-- keywords: legion-dev::druid::feral
---- ashamanes_frenzy.cooldown_remains
---- berserk.spell_remains
---- bloodtalons.spell_remains
---- bloodtalons.talent_enabled
---- brutal_slash.spell_charges
---- brutal_slash.spell_charges_fractional
---- brutal_slash.spell_max_charges
---- brutal_slash.talent_enabled
---- cat_form.spell_remains
---- clearcasting.spell_remains
---- combo_points
---- desired_targets
---- displacer_beast.spell_remains
---- elunes_guidance.cooldown_remains
---- elunes_guidance.spell_remains
---- elunes_guidance.talent_enabled
---- energy.curr
---- energy.deficit
---- energy.regen
---- energy.time_to_max
---- equipped.ailuro_pouncers
---- ferocious_bite.spell_cost
---- gcd
---- health.target_percent
---- incarnation.spell_remains
---- jagged_wounds.talent_enabled
---- moment_of_clarity.talent_enabled
---- moonfire_cat.spell_remains
---- moonfire_cat.spell_tick_time
---- movement.distance
---- persistent_multiplier
---- predatory_swiftness.spell_remains
---- predatory_swiftness.spell_stack
---- prowl.spell_remains
---- raid_event.adds.exists
---- raid_event.adds.in
---- rake.spell_duration
---- rake.spell_pmultiplier
---- rake.spell_remains
---- rake.spell_tick_time
---- rake.spell_ticking
---- rip.spell_pmultiplier
---- rip.spell_remains
---- rip.spell_tick_time
---- rip.spell_ticking
---- sabertooth.talent_enabled
---- savage_roar.spell_remains
---- set_bonus.tier18_4pc
---- soul_of_the_forest.talent_enabled
---- spell_targets
---- t18_class_trinket
---- target.time_to_die
---- thrash_cat.spell_duration
---- thrash_cat.spell_remains
---- tigers_fury.cooldown_remains
---- tigers_fury.spell_remains
---- time
---- trinket.proc.all.react
---- wild_charge_movement.spell_remains

internal.actions['legion-dev::druid::feral'] = {
    default = {
        {
            action = 'dash',
            condition = '!buff.cat_form.up',
            condition_converted = '(not ((cat_form.spell_remains_as_number > 0)))',
            condition_keywords = {
                'cat_form.spell_remains',
            },
            simc_line = 'actions=dash,if=!buff.cat_form.up',
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
            condition_converted = '((movement.distance) and ((((displacer_beast.spell_remains == 0)) and ((wild_charge_movement.spell_remains == 0)))))',
            condition_keywords = {
                'displacer_beast.spell_remains',
                'movement.distance',
                'wild_charge_movement.spell_remains',
            },
            simc_line = 'actions+=/dash,if=movement.distance&buff.displacer_beast.down&buff.wild_charge_movement.down',
        },
        {
            action = 'rake',
            condition = 'buff.prowl.up',
            condition_converted = '(prowl.spell_remains_as_number > 0)',
            condition_keywords = {
                'prowl.spell_remains',
            },
            simc_line = 'actions+=/rake,if=buff.prowl.up',
        },
        {
            action = 'berserk',
            condition = 'buff.tigers_fury.up',
            condition_converted = '(tigers_fury.spell_remains_as_number > 0)',
            condition_keywords = {
                'tigers_fury.spell_remains',
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
            condition_converted = '((((((((((berserk.spell_remains_as_number) > (10))) or (((incarnation.spell_remains_as_number) > (20)))))) and ((((((target.time_to_die_as_number) < (180))) or ((((trinket.proc.all.react) and (((health.target_percent_as_number) < (25)))))))))))) or (((target.time_to_die_as_number) <= (40))))',
            condition_keywords = {
                'berserk.spell_remains',
                'health.target_percent',
                'incarnation.spell_remains',
                'target.time_to_die',
                'trinket.proc.all.react',
            },
            name = 'old_war',
            simc_line = 'actions+=/potion,name=old_war,if=((buff.berserk.remains>10|buff.incarnation.remains>20)&(target.time_to_die<180|(trinket.proc.all.react&target.health.pct<25)))|target.time_to_die<=40',
        },
        {
            action = 'tigers_fury',
            condition = '(!buff.clearcasting.react&energy.deficit>=60)|energy.deficit>=80|(t18_class_trinket&buff.berserk.up&buff.tigers_fury.down)',
            condition_converted = '((((((not ((clearcasting.spell_remains_as_number > 0)))) and (((energy.deficit_as_number) >= (60)))))) or (((((energy.deficit_as_number) >= (80))) or ((((t18_class_trinket) and ((((berserk.spell_remains_as_number > 0)) and ((tigers_fury.spell_remains == 0))))))))))',
            condition_keywords = {
                'berserk.spell_remains',
                'clearcasting.spell_remains',
                'energy.deficit',
                't18_class_trinket',
                'tigers_fury.spell_remains',
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
            condition_converted = '((rip.spell_ticking) and (((((rip.spell_remains_as_number) < (3))) and (((((target.time_to_die_as_number) > (3))) and ((((((health.target_percent_as_number) < (25))) or (sabertooth.talent_enabled)))))))))',
            condition_keywords = {
                'health.target_percent',
                'rip.spell_remains',
                'rip.spell_ticking',
                'sabertooth.talent_enabled',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/ferocious_bite,cycle_targets=1,if=dot.rip.ticking&dot.rip.remains<3&target.time_to_die>3&(target.health.pct<25|talent.sabertooth.enabled)',
        },
        {
            action = 'regrowth',
            condition = 'talent.bloodtalons.enabled&buff.predatory_swiftness.up&(combo_points>=5|buff.predatory_swiftness.remains<1.5|(talent.bloodtalons.enabled&combo_points=2&buff.bloodtalons.down&cooldown.ashamanes_frenzy.remains<gcd)|(talent.elunes_guidance.enabled&((cooldown.elunes_guidance.remains<gcd&combo_points=0)|(buff.elunes_guidance.up&combo_points>=4))))',
            condition_converted = '((bloodtalons.talent_enabled) and ((((predatory_swiftness.spell_remains_as_number > 0)) and ((((((combo_points_as_number) >= (5))) or (((((predatory_swiftness.spell_remains_as_number) < (1.5))) or ((((((bloodtalons.talent_enabled) and (((((combo_points) == (2))) and ((((bloodtalons.spell_remains == 0)) and (((ashamanes_frenzy.cooldown_remains_as_number) < (gcd_as_number)))))))))) or ((((elunes_guidance.talent_enabled) and (((((((((elunes_guidance.cooldown_remains_as_number) < (gcd_as_number))) and (((combo_points) == (0)))))) or (((((elunes_guidance.spell_remains_as_number > 0)) and (((combo_points_as_number) >= (4))))))))))))))))))))))',
            condition_keywords = {
                'ashamanes_frenzy.cooldown_remains',
                'bloodtalons.spell_remains',
                'bloodtalons.talent_enabled',
                'combo_points',
                'elunes_guidance.cooldown_remains',
                'elunes_guidance.spell_remains',
                'elunes_guidance.talent_enabled',
                'gcd',
                'predatory_swiftness.spell_remains',
            },
            simc_line = 'actions+=/regrowth,if=talent.bloodtalons.enabled&buff.predatory_swiftness.up&(combo_points>=5|buff.predatory_swiftness.remains<1.5|(talent.bloodtalons.enabled&combo_points=2&buff.bloodtalons.down&cooldown.ashamanes_frenzy.remains<gcd)|(talent.elunes_guidance.enabled&((cooldown.elunes_guidance.remains<gcd&combo_points=0)|(buff.elunes_guidance.up&combo_points>=4))))',
        },
        {
            action = 'call_action_list',
            condition = 'talent.sabertooth.enabled&time<20',
            condition_converted = '((sabertooth.talent_enabled) and (((time_as_number) < (20))))',
            condition_keywords = {
                'sabertooth.talent_enabled',
                'time',
            },
            name = 'sbt_opener',
            simc_line = 'actions+=/call_action_list,name=sbt_opener,if=talent.sabertooth.enabled&time<20',
        },
        {
            action = 'regrowth',
            condition = 'equipped.ailuro_pouncers&talent.bloodtalons.enabled&buff.predatory_swiftness.stack>1&buff.bloodtalons.down',
            condition_converted = '((equipped.ailuro_pouncers) and (((bloodtalons.talent_enabled) and (((((predatory_swiftness.spell_stack_as_number) > (1))) and ((bloodtalons.spell_remains == 0)))))))',
            condition_keywords = {
                'bloodtalons.spell_remains',
                'bloodtalons.talent_enabled',
                'equipped.ailuro_pouncers',
                'predatory_swiftness.spell_stack',
            },
            simc_line = 'actions+=/regrowth,if=equipped.ailuro_pouncers&talent.bloodtalons.enabled&buff.predatory_swiftness.stack>1&buff.bloodtalons.down',
        },
        {
            action = 'call_action_list',
            name = 'finisher',
            simc_line = 'actions+=/call_action_list,name=finisher',
        },
        {
            action = 'call_action_list',
            name = 'generator',
            simc_line = 'actions+=/call_action_list,name=generator',
        },
    },
    finisher = {
        {
            action = 'pool_resource',
            for_next = '1',
            simc_line = 'actions.finisher=pool_resource,for_next=1',
        },
        {
            action = 'savage_roar',
            condition = '!buff.savage_roar.up&(combo_points=5|(talent.brutal_slash.enabled&spell_targets.brutal_slash>desired_targets&action.brutal_slash.charges>0))',
            condition_converted = '(((not ((savage_roar.spell_remains_as_number > 0)))) and ((((((combo_points) == (5))) or ((((brutal_slash.talent_enabled) and (((((spell_targets_as_number) > (desired_targets_as_number))) and (((brutal_slash.spell_charges_as_number) > (0))))))))))))',
            condition_keywords = {
                'brutal_slash.spell_charges',
                'brutal_slash.talent_enabled',
                'combo_points',
                'desired_targets',
                'savage_roar.spell_remains',
                'spell_targets',
            },
            simc_line = 'actions.finisher+=/savage_roar,if=!buff.savage_roar.up&(combo_points=5|(talent.brutal_slash.enabled&spell_targets.brutal_slash>desired_targets&action.brutal_slash.charges>0))',
        },
        {
            action = 'pool_resource',
            for_next = '1',
            simc_line = 'actions.finisher+=/pool_resource,for_next=1',
        },
        {
            action = 'thrash_cat',
            condition = 'remains<=duration*0.3&spell_targets.thrash_cat>=5',
            condition_converted = '((((thrash_cat.spell_remains_as_number) <= ((thrash_cat.spell_duration_as_number * 0.3)))) and (((spell_targets_as_number) >= (5))))',
            condition_keywords = {
                'spell_targets',
                'thrash_cat.spell_duration',
                'thrash_cat.spell_remains',
            },
            cycle_targets = '1',
            simc_line = 'actions.finisher+=/thrash_cat,cycle_targets=1,if=remains<=duration*0.3&spell_targets.thrash_cat>=5',
        },
        {
            action = 'pool_resource',
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
            condition_converted = '((((((rip.spell_remains == 0)) or ((((((((rip.spell_remains_as_number) < (8))) and (((((health.target_percent_as_number) > (25))) and ((not sabertooth.talent_enabled))))))) or (((persistent_multiplier_as_number) > (rip.spell_pmultiplier_as_number)))))))) and ((((((target.time_to_die_as_number - rip.spell_remains_as_number)) > ((rip.spell_tick_time_as_number * 4)))) and (((((combo_points) == (5))) and ((((((energy.time_to_max_as_number) < (1))) or ((((berserk.spell_remains_as_number > 0)) or ((((incarnation.spell_remains_as_number > 0)) or ((((elunes_guidance.spell_remains_as_number > 0)) or (((((tigers_fury.cooldown_remains_as_number) < (3))) or (((set_bonus.tier18_4pc) or ((((clearcasting.spell_remains_as_number > 0)) or (((soul_of_the_forest.talent_enabled) or ((((rip.spell_remains == 0)) or ((((((rake.spell_remains_as_number) < (1.5))) and (((spell_targets_as_number) < (6))))))))))))))))))))))))))))))',
            condition_keywords = {
                'berserk.spell_remains',
                'clearcasting.spell_remains',
                'combo_points',
                'elunes_guidance.spell_remains',
                'energy.time_to_max',
                'health.target_percent',
                'incarnation.spell_remains',
                'persistent_multiplier',
                'rake.spell_remains',
                'rip.spell_pmultiplier',
                'rip.spell_remains',
                'rip.spell_tick_time',
                'sabertooth.talent_enabled',
                'set_bonus.tier18_4pc',
                'soul_of_the_forest.talent_enabled',
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
            condition_converted = '(((((((savage_roar.spell_remains_as_number) <= (10.5))) or ((((((savage_roar.spell_remains_as_number) <= (7.2))) and ((not jagged_wounds.talent_enabled)))))))) and (((((combo_points) == (5))) and ((((((energy.time_to_max_as_number) < (1))) or ((((berserk.spell_remains_as_number > 0)) or ((((incarnation.spell_remains_as_number > 0)) or ((((elunes_guidance.spell_remains_as_number > 0)) or (((((tigers_fury.cooldown_remains_as_number) < (3))) or (((set_bonus.tier18_4pc) or ((((clearcasting.spell_remains_as_number > 0)) or (((soul_of_the_forest.talent_enabled) or ((((rip.spell_remains == 0)) or ((((((rake.spell_remains_as_number) < (1.5))) and (((spell_targets_as_number) < (6))))))))))))))))))))))))))))',
            condition_keywords = {
                'berserk.spell_remains',
                'clearcasting.spell_remains',
                'combo_points',
                'elunes_guidance.spell_remains',
                'energy.time_to_max',
                'incarnation.spell_remains',
                'jagged_wounds.talent_enabled',
                'rake.spell_remains',
                'rip.spell_remains',
                'savage_roar.spell_remains',
                'set_bonus.tier18_4pc',
                'soul_of_the_forest.talent_enabled',
                'spell_targets',
                'tigers_fury.cooldown_remains',
            },
            simc_line = 'actions.finisher+=/savage_roar,if=(buff.savage_roar.remains<=10.5|(buff.savage_roar.remains<=7.2&!talent.jagged_wounds.enabled))&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|buff.clearcasting.react|talent.soul_of_the_forest.enabled|!dot.rip.ticking|(dot.rake.remains<1.5&spell_targets.swipe_cat<6))',
        },
        {
            action = 'swipe_cat',
            condition = 'combo_points=5&(spell_targets.swipe_cat>=6|(spell_targets.swipe_cat>=3&!talent.bloodtalons.enabled))&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(talent.moment_of_clarity.enabled&buff.clearcasting.react))',
            condition_converted = '((((combo_points) == (5))) and ((((((((spell_targets_as_number) >= (6))) or ((((((spell_targets_as_number) >= (3))) and ((not bloodtalons.talent_enabled)))))))) and (((((combo_points) == (5))) and ((((((energy.time_to_max_as_number) < (1))) or ((((berserk.spell_remains_as_number > 0)) or ((((incarnation.spell_remains_as_number > 0)) or ((((elunes_guidance.spell_remains_as_number > 0)) or (((((tigers_fury.cooldown_remains_as_number) < (3))) or (((set_bonus.tier18_4pc) or ((((moment_of_clarity.talent_enabled) and ((clearcasting.spell_remains_as_number > 0)))))))))))))))))))))))',
            condition_keywords = {
                'berserk.spell_remains',
                'bloodtalons.talent_enabled',
                'clearcasting.spell_remains',
                'combo_points',
                'elunes_guidance.spell_remains',
                'energy.time_to_max',
                'incarnation.spell_remains',
                'moment_of_clarity.talent_enabled',
                'set_bonus.tier18_4pc',
                'spell_targets',
                'tigers_fury.cooldown_remains',
            },
            simc_line = 'actions.finisher+=/swipe_cat,if=combo_points=5&(spell_targets.swipe_cat>=6|(spell_targets.swipe_cat>=3&!talent.bloodtalons.enabled))&combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(talent.moment_of_clarity.enabled&buff.clearcasting.react))',
        },
        {
            action = 'ferocious_bite',
            condition = 'combo_points=5&(energy.time_to_max<1|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(talent.moment_of_clarity.enabled&buff.clearcasting.react))',
            condition_converted = '((((combo_points) == (5))) and ((((((energy.time_to_max_as_number) < (1))) or ((((berserk.spell_remains_as_number > 0)) or ((((incarnation.spell_remains_as_number > 0)) or ((((elunes_guidance.spell_remains_as_number > 0)) or (((((tigers_fury.cooldown_remains_as_number) < (3))) or (((set_bonus.tier18_4pc) or ((((moment_of_clarity.talent_enabled) and ((clearcasting.spell_remains_as_number > 0)))))))))))))))))))',
            condition_keywords = {
                'berserk.spell_remains',
                'clearcasting.spell_remains',
                'combo_points',
                'elunes_guidance.spell_remains',
                'energy.time_to_max',
                'incarnation.spell_remains',
                'moment_of_clarity.talent_enabled',
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
            action = 'pool_resource',
            condition = 'talent.elunes_guidance.enabled&combo_points=0&energy<action.ferocious_bite.cost+25-energy.regen*cooldown.elunes_guidance.remains',
            condition_converted = '((elunes_guidance.talent_enabled) and (((((combo_points) == (0))) and (((energy.curr_as_number) < ((ferocious_bite.spell_cost_as_number + 25 - (energy.regen_as_number * elunes_guidance.cooldown_remains_as_number))))))))',
            condition_keywords = {
                'combo_points',
                'elunes_guidance.cooldown_remains',
                'elunes_guidance.talent_enabled',
                'energy.curr',
                'energy.regen',
                'ferocious_bite.spell_cost',
            },
            simc_line = 'actions.generator+=/pool_resource,if=talent.elunes_guidance.enabled&combo_points=0&energy<action.ferocious_bite.cost+25-energy.regen*cooldown.elunes_guidance.remains',
        },
        {
            action = 'elunes_guidance',
            condition = 'talent.elunes_guidance.enabled&combo_points=0&energy>=action.ferocious_bite.cost+25',
            condition_converted = '((elunes_guidance.talent_enabled) and (((((combo_points) == (0))) and (((energy.curr_as_number) >= ((ferocious_bite.spell_cost_as_number + 25)))))))',
            condition_keywords = {
                'combo_points',
                'elunes_guidance.talent_enabled',
                'energy.curr',
                'ferocious_bite.spell_cost',
            },
            simc_line = 'actions.generator+=/elunes_guidance,if=talent.elunes_guidance.enabled&combo_points=0&energy>=action.ferocious_bite.cost+25',
        },
        {
            action = 'pool_resource',
            for_next = '1',
            simc_line = 'actions.generator+=/pool_resource,for_next=1',
        },
        {
            action = 'thrash_cat',
            condition = 'talent.brutal_slash.enabled&spell_targets.thrash_cat>=9',
            condition_converted = '((brutal_slash.talent_enabled) and (((spell_targets_as_number) >= (9))))',
            condition_keywords = {
                'brutal_slash.talent_enabled',
                'spell_targets',
            },
            simc_line = 'actions.generator+=/thrash_cat,if=talent.brutal_slash.enabled&spell_targets.thrash_cat>=9',
        },
        {
            action = 'pool_resource',
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
            for_next = '1',
            simc_line = 'actions.generator+=/pool_resource,for_next=1',
        },
        {
            action = 'rake',
            condition = 'combo_points<5&(!ticking|(!talent.bloodtalons.enabled&remains<duration*0.3)|(talent.bloodtalons.enabled&buff.bloodtalons.up&(!talent.soul_of_the_forest.enabled&remains<=7|remains<=5)&persistent_multiplier>dot.rake.pmultiplier*0.80))&target.time_to_die-remains>tick_time',
            condition_converted = '((((combo_points_as_number) < (5))) and (((((((rake.spell_remains == 0)) or (((((((not bloodtalons.talent_enabled)) and (((rake.spell_remains_as_number) < ((rake.spell_duration_as_number * 0.3))))))) or ((((bloodtalons.talent_enabled) and ((((bloodtalons.spell_remains_as_number > 0)) and (((((((((not soul_of_the_forest.talent_enabled)) and (((rake.spell_remains_as_number) <= (7))))) or (((rake.spell_remains_as_number) <= (5)))))) and (((persistent_multiplier_as_number) > ((rake.spell_pmultiplier_as_number * 0.80)))))))))))))))) and ((((target.time_to_die_as_number - rake.spell_remains_as_number)) > (rake.spell_tick_time_as_number))))))',
            condition_keywords = {
                'bloodtalons.spell_remains',
                'bloodtalons.talent_enabled',
                'combo_points',
                'persistent_multiplier',
                'rake.spell_duration',
                'rake.spell_pmultiplier',
                'rake.spell_remains',
                'rake.spell_tick_time',
                'soul_of_the_forest.talent_enabled',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.generator+=/rake,cycle_targets=1,if=combo_points<5&(!ticking|(!talent.bloodtalons.enabled&remains<duration*0.3)|(talent.bloodtalons.enabled&buff.bloodtalons.up&(!talent.soul_of_the_forest.enabled&remains<=7|remains<=5)&persistent_multiplier>dot.rake.pmultiplier*0.80))&target.time_to_die-remains>tick_time',
        },
        {
            action = 'moonfire_cat',
            condition = 'combo_points<5&remains<=4.2&target.time_to_die-remains>tick_time*2',
            condition_converted = '((((combo_points_as_number) < (5))) and (((((moonfire_cat.spell_remains_as_number) <= (4.2))) and ((((target.time_to_die_as_number - moonfire_cat.spell_remains_as_number)) > ((moonfire_cat.spell_tick_time_as_number * 2)))))))',
            condition_keywords = {
                'combo_points',
                'moonfire_cat.spell_remains',
                'moonfire_cat.spell_tick_time',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.generator+=/moonfire_cat,cycle_targets=1,if=combo_points<5&remains<=4.2&target.time_to_die-remains>tick_time*2',
        },
        {
            action = 'pool_resource',
            for_next = '1',
            simc_line = 'actions.generator+=/pool_resource,for_next=1',
        },
        {
            action = 'thrash_cat',
            condition = 'remains<=duration*0.3&spell_targets.swipe_cat>=2',
            condition_converted = '((((thrash_cat.spell_remains_as_number) <= ((thrash_cat.spell_duration_as_number * 0.3)))) and (((spell_targets_as_number) >= (2))))',
            condition_keywords = {
                'spell_targets',
                'thrash_cat.spell_duration',
                'thrash_cat.spell_remains',
            },
            cycle_targets = '1',
            simc_line = 'actions.generator+=/thrash_cat,cycle_targets=1,if=remains<=duration*0.3&spell_targets.swipe_cat>=2',
        },
        {
            action = 'brutal_slash',
            condition = 'combo_points<5&((raid_event.adds.exists&raid_event.adds.in>(1+max_charges-charges_fractional)*15)|(!raid_event.adds.exists&(charges_fractional>2.66&time>10)))',
            condition_converted = '((((combo_points_as_number) < (5))) and (((((((raid_event.adds.exists) and (((raid_event.adds.in_as_number) > (((1 + brutal_slash.spell_max_charges_as_number - brutal_slash.spell_charges_fractional_as_number) * 15))))))) or (((((not (raid_event.adds.exists))) and ((((((brutal_slash.spell_charges_fractional_as_number) > (2.66))) and (((time_as_number) > (10)))))))))))))',
            condition_keywords = {
                'brutal_slash.spell_charges_fractional',
                'brutal_slash.spell_max_charges',
                'combo_points',
                'raid_event.adds.exists',
                'raid_event.adds.in',
                'time',
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
            condition_converted = '((((combo_points_as_number) < (5))) and ((((((spell_targets_as_number) < (3))) or (brutal_slash.talent_enabled)))))',
            condition_keywords = {
                'brutal_slash.talent_enabled',
                'combo_points',
                'spell_targets',
            },
            simc_line = 'actions.generator+=/shred,if=combo_points<5&(spell_targets.swipe_cat<3|talent.brutal_slash.enabled)',
        },
    },
    precombat = {
        {
            action = 'flask',
            simc_line = 'actions.precombat=flask,type=flask_of_the_seventh_demon',
            type = 'flask_of_the_seventh_demon',
        },
        {
            action = 'food',
            simc_line = 'actions.precombat+=/food,type=nightborne_delicacy_platter',
            type = 'nightborne_delicacy_platter',
        },
        {
            action = 'augmentation',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'regrowth',
            condition = 'talent.bloodtalons.enabled',
            condition_converted = 'bloodtalons.talent_enabled',
            condition_keywords = {
                'bloodtalons.talent_enabled',
            },
            simc_line = 'actions.precombat+=/regrowth,if=talent.bloodtalons.enabled',
        },
        {
            action = 'potion',
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
    },
}


internal.apls["legion-dev::druid::guardian"] = [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=azshari_salad
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/bear_form
actions.precombat+=/snapshot_stats
actions=auto_attack
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/incarnation
actions+=/rage_of_the_sleeper
actions+=/lunar_beam
actions+=/frenzied_regeneration,if=incoming_damage_5s%health.max>=0.5|health<=health.max*0.4
actions+=/bristling_fur,if=buff.ironfur.stack=1|buff.ironfur.down
actions+=/ironfur,if=(buff.ironfur.up=0)|(buff.gory_fur.up=1)|(rage>=80)
actions+=/moonfire,if=buff.incarnation.up=1&dot.moonfire.remains<=4.8
actions+=/thrash_bear,if=buff.incarnation.up=1&dot.thrash.remains<=4.5
actions+=/mangle
actions+=/thrash_bear
actions+=/pulverize,if=buff.pulverize.up=0|buff.pulverize.remains<=6
actions+=/moonfire,if=buff.galactic_guardian.up=1&(!ticking|dot.moonfire.remains<=4.8)
actions+=/moonfire,if=buff.galactic_guardian.up=1
actions+=/moonfire,if=dot.moonfire.remains<=4.8
actions+=/swipe_bear
]]

-- keywords: legion-dev::druid::guardian
---- galactic_guardian.spell_remains
---- gory_fur.spell_remains
---- health
---- health.max
---- incarnation.spell_remains
---- incoming_damage_over_5000
---- ironfur.spell_remains
---- ironfur.spell_stack
---- moonfire.spell_remains
---- moonfire.spell_ticking
---- pulverize.spell_remains
---- rage.curr
---- thrash.spell_remains

internal.actions['legion-dev::druid::guardian'] = {
    default = {
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
            condition_converted = '((((ironfur.spell_stack) == (1))) or ((ironfur.spell_remains == 0)))',
            condition_keywords = {
                'ironfur.spell_remains',
                'ironfur.spell_stack',
            },
            simc_line = 'actions+=/bristling_fur,if=buff.ironfur.stack=1|buff.ironfur.down',
        },
        {
            action = 'ironfur',
            condition = '(buff.ironfur.up=0)|(buff.gory_fur.up=1)|(rage>=80)',
            condition_converted = '((((((ironfur.spell_remains_as_number > 0)) == (0)))) or (((((((gory_fur.spell_remains_as_number > 0)) == (1)))) or ((((rage.curr_as_number) >= (80)))))))',
            condition_keywords = {
                'gory_fur.spell_remains',
                'ironfur.spell_remains',
                'rage.curr',
            },
            simc_line = 'actions+=/ironfur,if=(buff.ironfur.up=0)|(buff.gory_fur.up=1)|(rage>=80)',
        },
        {
            action = 'moonfire',
            condition = 'buff.incarnation.up=1&dot.moonfire.remains<=4.8',
            condition_converted = '(((((incarnation.spell_remains_as_number > 0)) == (1))) and (((moonfire.spell_remains_as_number) <= (4.8))))',
            condition_keywords = {
                'incarnation.spell_remains',
                'moonfire.spell_remains',
            },
            simc_line = 'actions+=/moonfire,if=buff.incarnation.up=1&dot.moonfire.remains<=4.8',
        },
        {
            action = 'thrash_bear',
            condition = 'buff.incarnation.up=1&dot.thrash.remains<=4.5',
            condition_converted = '(((((incarnation.spell_remains_as_number > 0)) == (1))) and (((thrash.spell_remains_as_number) <= (4.5))))',
            condition_keywords = {
                'incarnation.spell_remains',
                'thrash.spell_remains',
            },
            simc_line = 'actions+=/thrash_bear,if=buff.incarnation.up=1&dot.thrash.remains<=4.5',
        },
        {
            action = 'pulverize',
            condition = 'buff.pulverize.up=0|buff.pulverize.remains<=6',
            condition_converted = '(((((pulverize.spell_remains_as_number > 0)) == (0))) or (((pulverize.spell_remains_as_number) <= (6))))',
            condition_keywords = {
                'pulverize.spell_remains',
            },
            simc_line = 'actions+=/pulverize,if=buff.pulverize.up=0|buff.pulverize.remains<=6',
        },
        {
            action = 'moonfire',
            condition = 'buff.galactic_guardian.up=1&(!ticking|dot.moonfire.remains<=4.8)',
            condition_converted = '(((((galactic_guardian.spell_remains_as_number > 0)) == (1))) and (((((moonfire.spell_remains == 0)) or (((moonfire.spell_remains_as_number) <= (4.8)))))))',
            condition_keywords = {
                'galactic_guardian.spell_remains',
                'moonfire.spell_remains',
            },
            simc_line = 'actions+=/moonfire,if=buff.galactic_guardian.up=1&(!ticking|dot.moonfire.remains<=4.8)',
        },
        {
            action = 'moonfire',
            condition = 'buff.galactic_guardian.up=1',
            condition_converted = '(((galactic_guardian.spell_remains_as_number > 0)) == (1))',
            condition_keywords = {
                'galactic_guardian.spell_remains',
            },
            simc_line = 'actions+=/moonfire,if=buff.galactic_guardian.up=1',
        },
        {
            action = 'moonfire',
            condition = 'dot.moonfire.remains<=4.8',
            condition_converted = '((moonfire.spell_remains_as_number) <= (4.8))',
            condition_keywords = {
                'moonfire.spell_remains',
            },
            simc_line = 'actions+=/moonfire,if=dot.moonfire.remains<=4.8',
        },
    },
    precombat = {
        {
            action = 'flask',
            simc_line = 'actions.precombat=flask,type=flask_of_the_seventh_demon',
            type = 'flask_of_the_seventh_demon',
        },
        {
            action = 'food',
            simc_line = 'actions.precombat+=/food,type=azshari_salad',
            type = 'azshari_salad',
        },
        {
            action = 'augmentation',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
    },
}


