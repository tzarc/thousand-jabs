local _, internal = ...
internal.actions = internal.actions or {}

-- keywords: legion-dev::monk::brewmaster
---- active_enemies

internal.actions['legion-dev::monk::brewmaster'] = {
    default = {
        {
            action = 'call_action_list',
            condition = 'active_enemies<3',
            condition_converted = '((active_enemies_as_number) < (3))',
            condition_keywords = {
                'active_enemies',
            },
            name = 'st',
            simc_line = 'actions+=/call_action_list,name=st,if=active_enemies<3',
        },
    },
    precombat = {
        {
            action = 'flask',
            simc_line = 'actions.precombat=flask,type=greater_draenic_agility_flask',
            type = 'greater_draenic_agility_flask',
        },
        {
            action = 'food',
            simc_line = 'actions.precombat+=/food,type=sleeper_sushi',
            type = 'sleeper_sushi',
        },
        {
            action = 'potion',
            name = 'draenic_agility',
            simc_line = 'actions.precombat+=/potion,name=draenic_agility',
        },
    },
}


-- keywords: legion-dev::monk::windwalker
---- active_enemies
---- bloodlust.spell_react
---- bok_proc.aura_up
---- casting.spell_react
---- chi.curr
---- chi.max
---- energy.curr
---- energy.max
---- energy.time_to_max
---- equipped
---- fists_of_fury.cooldown_remains
---- gale_burst.artifact_enabled
---- prev_gcd.blackout_kick
---- prev_gcd.rushing_jade_wind
---- prev_gcd.spinning_crane_kick
---- prev_gcd.tiger_palm
---- prev_gcd.touch_of_death
---- rising_sun_kick.cooldown_remains
---- serenity.aura_up
---- serenity.cooldown_remains
---- serenity.talent_selected
---- storm_earth_and_fire.aura_up
---- strike_of_the_windlord.artifact_enabled
---- strike_of_the_windlord.cooldown_remains
---- target.time_to_die
---- trinket.proc.agility.react

internal.actions['legion-dev::monk::windwalker'] = {
    cd = {
        {
            action = 'touch_of_death',
            condition = '!artifact.gale_burst.enabled&equipped.137057&!prev_gcd.touch_of_death',
            condition_converted = '(((not gale_burst.artifact_enabled)) and (((equipped[137057]) and ((not (prev_gcd.touch_of_death))))))',
            condition_keywords = {
                'equipped',
                'gale_burst.artifact_enabled',
                'prev_gcd.touch_of_death',
            },
            cycle_targets = '1',
            max_cycle_targets = '2',
            simc_line = 'actions.cd+=/touch_of_death,cycle_targets=1,max_cycle_targets=2,if=!artifact.gale_burst.enabled&equipped.137057&!prev_gcd.touch_of_death',
        },
        {
            action = 'touch_of_death',
            condition = '!artifact.gale_burst.enabled&!equipped.137057',
            condition_converted = '(((not gale_burst.artifact_enabled)) and ((not (equipped[137057]))))',
            condition_keywords = {
                'equipped',
                'gale_burst.artifact_enabled',
            },
            simc_line = 'actions.cd+=/touch_of_death,if=!artifact.gale_burst.enabled&!equipped.137057',
        },
        {
            action = 'touch_of_death',
            condition = 'artifact.gale_burst.enabled&equipped.137057&cooldown.strike_of_the_windlord.remains<8&cooldown.fists_of_fury.remains<=4&cooldown.rising_sun_kick.remains<7&!prev_gcd.touch_of_death',
            condition_converted = '((gale_burst.artifact_enabled) and (((equipped[137057]) and (((((strike_of_the_windlord.cooldown_remains_as_number) < (8))) and (((((fists_of_fury.cooldown_remains_as_number) <= (4))) and (((((rising_sun_kick.cooldown_remains_as_number) < (7))) and ((not (prev_gcd.touch_of_death))))))))))))',
            condition_keywords = {
                'equipped',
                'fists_of_fury.cooldown_remains',
                'gale_burst.artifact_enabled',
                'prev_gcd.touch_of_death',
                'rising_sun_kick.cooldown_remains',
                'strike_of_the_windlord.cooldown_remains',
            },
            cycle_targets = '1',
            max_cycle_targets = '2',
            simc_line = 'actions.cd+=/touch_of_death,cycle_targets=1,max_cycle_targets=2,if=artifact.gale_burst.enabled&equipped.137057&cooldown.strike_of_the_windlord.remains<8&cooldown.fists_of_fury.remains<=4&cooldown.rising_sun_kick.remains<7&!prev_gcd.touch_of_death',
        },
        {
            action = 'touch_of_death',
            condition = 'artifact.gale_burst.enabled&!equipped.137057&cooldown.strike_of_the_windlord.remains<8&cooldown.fists_of_fury.remains<=4&cooldown.rising_sun_kick.remains<7',
            condition_converted = '((gale_burst.artifact_enabled) and ((((not (equipped[137057]))) and (((((strike_of_the_windlord.cooldown_remains_as_number) < (8))) and (((((fists_of_fury.cooldown_remains_as_number) <= (4))) and (((rising_sun_kick.cooldown_remains_as_number) < (7))))))))))',
            condition_keywords = {
                'equipped',
                'fists_of_fury.cooldown_remains',
                'gale_burst.artifact_enabled',
                'rising_sun_kick.cooldown_remains',
                'strike_of_the_windlord.cooldown_remains',
            },
            simc_line = 'actions.cd+=/touch_of_death,if=artifact.gale_burst.enabled&!equipped.137057&cooldown.strike_of_the_windlord.remains<8&cooldown.fists_of_fury.remains<=4&cooldown.rising_sun_kick.remains<7',
        },
    },
    default = {
        {
            action = 'spear_hand_strike',
            condition = 'target.debuff.casting.react',
            condition_converted = 'casting.spell_react',
            condition_keywords = {
                'casting.spell_react',
            },
            simc_line = 'actions+=/spear_hand_strike,if=target.debuff.casting.react',
        },
        {
            action = 'potion',
            condition = 'buff.serenity.up|buff.storm_earth_and_fire.up|(!talent.serenity.enabled&trinket.proc.agility.react)|buff.bloodlust.react|target.time_to_die<=60',
            condition_converted = '((serenity.aura_up) or (((storm_earth_and_fire.aura_up) or (((((((not (serenity.talent_selected))) and (trinket.proc.agility.react)))) or (((bloodlust.spell_react) or (((target.time_to_die_as_number) <= (60))))))))))',
            condition_keywords = {
                'bloodlust.spell_react',
                'serenity.aura_up',
                'serenity.talent_selected',
                'storm_earth_and_fire.aura_up',
                'target.time_to_die',
                'trinket.proc.agility.react',
            },
            name = 'old_war',
            simc_line = 'actions+=/potion,name=old_war,if=buff.serenity.up|buff.storm_earth_and_fire.up|(!talent.serenity.enabled&trinket.proc.agility.react)|buff.bloodlust.react|target.time_to_die<=60',
        },
        {
            action = 'call_action_list',
            condition = '(talent.serenity.enabled&cooldown.serenity.remains<=0)&((artifact.strike_of_the_windlord.enabled&cooldown.strike_of_the_windlord.remains<=14&cooldown.rising_sun_kick.remains<=4)|buff.serenity.up)',
            condition_converted = '(((((serenity.talent_selected) and (((serenity.cooldown_remains_as_number) <= (0)))))) and (((((((strike_of_the_windlord.artifact_enabled) and (((((strike_of_the_windlord.cooldown_remains_as_number) <= (14))) and (((rising_sun_kick.cooldown_remains_as_number) <= (4)))))))) or (serenity.aura_up)))))',
            condition_keywords = {
                'rising_sun_kick.cooldown_remains',
                'serenity.aura_up',
                'serenity.cooldown_remains',
                'serenity.talent_selected',
                'strike_of_the_windlord.artifact_enabled',
                'strike_of_the_windlord.cooldown_remains',
            },
            name = 'serenity',
            simc_line = 'actions+=/call_action_list,name=serenity,if=(talent.serenity.enabled&cooldown.serenity.remains<=0)&((artifact.strike_of_the_windlord.enabled&cooldown.strike_of_the_windlord.remains<=14&cooldown.rising_sun_kick.remains<=4)|buff.serenity.up)',
        },
        {
            action = 'call_action_list',
            condition = '!talent.serenity.enabled&((artifact.strike_of_the_windlord.enabled&cooldown.strike_of_the_windlord.remains<=14&cooldown.fists_of_fury.remains<=6&cooldown.rising_sun_kick.remains<=6)|buff.storm_earth_and_fire.up)',
            condition_converted = '(((not (serenity.talent_selected))) and (((((((strike_of_the_windlord.artifact_enabled) and (((((strike_of_the_windlord.cooldown_remains_as_number) <= (14))) and (((((fists_of_fury.cooldown_remains_as_number) <= (6))) and (((rising_sun_kick.cooldown_remains_as_number) <= (6)))))))))) or (storm_earth_and_fire.aura_up)))))',
            condition_keywords = {
                'fists_of_fury.cooldown_remains',
                'rising_sun_kick.cooldown_remains',
                'serenity.talent_selected',
                'storm_earth_and_fire.aura_up',
                'strike_of_the_windlord.artifact_enabled',
                'strike_of_the_windlord.cooldown_remains',
            },
            name = 'sef',
            simc_line = 'actions+=/call_action_list,name=sef,if=!talent.serenity.enabled&((artifact.strike_of_the_windlord.enabled&cooldown.strike_of_the_windlord.remains<=14&cooldown.fists_of_fury.remains<=6&cooldown.rising_sun_kick.remains<=6)|buff.storm_earth_and_fire.up)',
        },
        {
            action = 'call_action_list',
            condition = '(talent.serenity.enabled&cooldown.serenity.remains<=0)&(!artifact.strike_of_the_windlord.enabled&cooldown.strike_of_the_windlord.remains<14&cooldown.fists_of_fury.remains<=15&cooldown.rising_sun_kick.remains<7)|buff.serenity.up',
            condition_converted = '(((((((serenity.talent_selected) and (((serenity.cooldown_remains_as_number) <= (0)))))) and (((((not strike_of_the_windlord.artifact_enabled)) and (((((strike_of_the_windlord.cooldown_remains_as_number) < (14))) and (((((fists_of_fury.cooldown_remains_as_number) <= (15))) and (((rising_sun_kick.cooldown_remains_as_number) < (7)))))))))))) or (serenity.aura_up))',
            condition_keywords = {
                'fists_of_fury.cooldown_remains',
                'rising_sun_kick.cooldown_remains',
                'serenity.aura_up',
                'serenity.cooldown_remains',
                'serenity.talent_selected',
                'strike_of_the_windlord.artifact_enabled',
                'strike_of_the_windlord.cooldown_remains',
            },
            name = 'serenity',
            simc_line = 'actions+=/call_action_list,name=serenity,if=(talent.serenity.enabled&cooldown.serenity.remains<=0)&(!artifact.strike_of_the_windlord.enabled&cooldown.strike_of_the_windlord.remains<14&cooldown.fists_of_fury.remains<=15&cooldown.rising_sun_kick.remains<7)|buff.serenity.up',
        },
        {
            action = 'call_action_list',
            condition = '!talent.serenity.enabled&((!artifact.strike_of_the_windlord.enabled&cooldown.fists_of_fury.remains<=9&cooldown.rising_sun_kick.remains<=5)|buff.storm_earth_and_fire.up)',
            condition_converted = '(((not (serenity.talent_selected))) and ((((((((not strike_of_the_windlord.artifact_enabled)) and (((((fists_of_fury.cooldown_remains_as_number) <= (9))) and (((rising_sun_kick.cooldown_remains_as_number) <= (5)))))))) or (storm_earth_and_fire.aura_up)))))',
            condition_keywords = {
                'fists_of_fury.cooldown_remains',
                'rising_sun_kick.cooldown_remains',
                'serenity.talent_selected',
                'storm_earth_and_fire.aura_up',
                'strike_of_the_windlord.artifact_enabled',
            },
            name = 'sef',
            simc_line = 'actions+=/call_action_list,name=sef,if=!talent.serenity.enabled&((!artifact.strike_of_the_windlord.enabled&cooldown.fists_of_fury.remains<=9&cooldown.rising_sun_kick.remains<=5)|buff.storm_earth_and_fire.up)',
        },
        {
            action = 'call_action_list',
            name = 'st',
            simc_line = 'actions+=/call_action_list,name=st',
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
            simc_line = 'actions.precombat+=/food,type=fishbrul_special',
            type = 'fishbrul_special',
        },
        {
            action = 'augmentation',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'potion',
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
    },
    sef = {
        {
            action = 'arcane_torrent',
            condition = 'chi.max-chi>=1&energy.time_to_max>=0.5',
            condition_converted = '(((((chi.max_as_number - chi.curr_as_number)) >= (1))) and (((energy.time_to_max_as_number) >= (0.5))))',
            condition_keywords = {
                'chi.curr',
                'chi.max',
                'energy.time_to_max',
            },
            simc_line = 'actions.sef+=/arcane_torrent,if=chi.max-chi>=1&energy.time_to_max>=0.5',
        },
        {
            action = 'call_action_list',
            name = 'cd',
            simc_line = 'actions.sef+=/call_action_list,name=cd',
        },
        {
            action = 'call_action_list',
            name = 'st',
            simc_line = 'actions.sef+=/call_action_list,name=st',
        },
    },
    serenity = {
        {
            action = 'call_action_list',
            name = 'cd',
            simc_line = 'actions.serenity+=/call_action_list,name=cd',
        },
        {
            action = 'rising_sun_kick',
            condition = 'active_enemies<3',
            condition_converted = '((active_enemies_as_number) < (3))',
            condition_keywords = {
                'active_enemies',
            },
            cycle_targets = '1',
            simc_line = 'actions.serenity+=/rising_sun_kick,cycle_targets=1,if=active_enemies<3',
        },
        {
            action = 'spinning_crane_kick',
            condition = 'active_enemies>=3&!prev_gcd.spinning_crane_kick',
            condition_converted = '((((active_enemies_as_number) >= (3))) and ((not (prev_gcd.spinning_crane_kick))))',
            condition_keywords = {
                'active_enemies',
                'prev_gcd.spinning_crane_kick',
            },
            simc_line = 'actions.serenity+=/spinning_crane_kick,if=active_enemies>=3&!prev_gcd.spinning_crane_kick',
        },
        {
            action = 'rising_sun_kick',
            condition = 'active_enemies>=3',
            condition_converted = '((active_enemies_as_number) >= (3))',
            condition_keywords = {
                'active_enemies',
            },
            cycle_targets = '1',
            simc_line = 'actions.serenity+=/rising_sun_kick,cycle_targets=1,if=active_enemies>=3',
        },
        {
            action = 'blackout_kick',
            condition = '!prev_gcd.blackout_kick',
            condition_converted = '(not (prev_gcd.blackout_kick))',
            condition_keywords = {
                'prev_gcd.blackout_kick',
            },
            cycle_targets = '1',
            simc_line = 'actions.serenity+=/blackout_kick,cycle_targets=1,if=!prev_gcd.blackout_kick',
        },
        {
            action = 'spinning_crane_kick',
            condition = '!prev_gcd.spinning_crane_kick',
            condition_converted = '(not (prev_gcd.spinning_crane_kick))',
            condition_keywords = {
                'prev_gcd.spinning_crane_kick',
            },
            simc_line = 'actions.serenity+=/spinning_crane_kick,if=!prev_gcd.spinning_crane_kick',
        },
        {
            action = 'rushing_jade_wind',
            condition = '!prev_gcd.rushing_jade_wind',
            condition_converted = '(not (prev_gcd.rushing_jade_wind))',
            condition_keywords = {
                'prev_gcd.rushing_jade_wind',
            },
            simc_line = 'actions.serenity+=/rushing_jade_wind,if=!prev_gcd.rushing_jade_wind',
        },
    },
    st = {
        {
            action = 'call_action_list',
            name = 'cd',
            simc_line = 'actions.st=call_action_list,name=cd',
        },
        {
            action = 'arcane_torrent',
            condition = 'chi.max-chi>=1&energy.time_to_max>=0.5',
            condition_converted = '(((((chi.max_as_number - chi.curr_as_number)) >= (1))) and (((energy.time_to_max_as_number) >= (0.5))))',
            condition_keywords = {
                'chi.curr',
                'chi.max',
                'energy.time_to_max',
            },
            simc_line = 'actions.st+=/arcane_torrent,if=chi.max-chi>=1&energy.time_to_max>=0.5',
        },
        {
            action = 'energizing_elixir',
            condition = 'energy<energy.max&chi<=1',
            condition_converted = '((((energy.curr_as_number) < (energy.max_as_number))) and (((chi.curr_as_number) <= (1))))',
            condition_keywords = {
                'chi.curr',
                'energy.curr',
                'energy.max',
            },
            simc_line = 'actions.st+=/energizing_elixir,if=energy<energy.max&chi<=1',
        },
        {
            action = 'strike_of_the_windlord',
            condition = 'talent.serenity.enabled|active_enemies<6',
            condition_converted = '((serenity.talent_selected) or (((active_enemies_as_number) < (6))))',
            condition_keywords = {
                'active_enemies',
                'serenity.talent_selected',
            },
            simc_line = 'actions.st+=/strike_of_the_windlord,if=talent.serenity.enabled|active_enemies<6',
        },
        {
            action = 'rising_sun_kick',
            cycle_targets = '1',
            simc_line = 'actions.st+=/rising_sun_kick,cycle_targets=1',
        },
        {
            action = 'spinning_crane_kick',
            condition = 'active_enemies>=3&!prev_gcd.spinning_crane_kick',
            condition_converted = '((((active_enemies_as_number) >= (3))) and ((not (prev_gcd.spinning_crane_kick))))',
            condition_keywords = {
                'active_enemies',
                'prev_gcd.spinning_crane_kick',
            },
            simc_line = 'actions.st+=/spinning_crane_kick,if=active_enemies>=3&!prev_gcd.spinning_crane_kick',
        },
        {
            action = 'rushing_jade_wind',
            condition = 'chi.max-chi>1&!prev_gcd.rushing_jade_wind',
            condition_converted = '(((((chi.max_as_number - chi.curr_as_number)) > (1))) and ((not (prev_gcd.rushing_jade_wind))))',
            condition_keywords = {
                'chi.curr',
                'chi.max',
                'prev_gcd.rushing_jade_wind',
            },
            simc_line = 'actions.st+=/rushing_jade_wind,if=chi.max-chi>1&!prev_gcd.rushing_jade_wind',
        },
        {
            action = 'blackout_kick',
            condition = '(chi>1|buff.bok_proc.up)&!prev_gcd.blackout_kick',
            condition_converted = '(((((((chi.curr_as_number) > (1))) or (bok_proc.aura_up)))) and ((not (prev_gcd.blackout_kick))))',
            condition_keywords = {
                'bok_proc.aura_up',
                'chi.curr',
                'prev_gcd.blackout_kick',
            },
            cycle_targets = '1',
            simc_line = 'actions.st+=/blackout_kick,cycle_targets=1,if=(chi>1|buff.bok_proc.up)&!prev_gcd.blackout_kick',
        },
        {
            action = 'chi_wave',
            condition = 'energy.time_to_max>=2.25',
            condition_converted = '((energy.time_to_max_as_number) >= (2.25))',
            condition_keywords = {
                'energy.time_to_max',
            },
            simc_line = 'actions.st+=/chi_wave,if=energy.time_to_max>=2.25',
        },
        {
            action = 'chi_burst',
            condition = 'energy.time_to_max>=2.25',
            condition_converted = '((energy.time_to_max_as_number) >= (2.25))',
            condition_keywords = {
                'energy.time_to_max',
            },
            simc_line = 'actions.st+=/chi_burst,if=energy.time_to_max>=2.25',
        },
        {
            action = 'tiger_palm',
            condition = '!prev_gcd.tiger_palm',
            condition_converted = '(not (prev_gcd.tiger_palm))',
            condition_keywords = {
                'prev_gcd.tiger_palm',
            },
            cycle_targets = '1',
            simc_line = 'actions.st+=/tiger_palm,cycle_targets=1,if=!prev_gcd.tiger_palm',
        },
    },
}


-- keywords: placeholder::monk::brewmaster
---- active_enemies
---- chi_burst.talent_selected
---- chi_wave.talent_selected
---- energy.curr
---- keg_smash.aura_up
---- rushing_jade_wind.talent_selected

internal.actions['placeholder::monk::brewmaster'] = {
    aoe = {
        {
            action = 'chi_burst',
            condition = 'talent.chi_burst.enabled',
            condition_converted = 'chi_burst.talent_selected',
            condition_keywords = {
                'chi_burst.talent_selected',
            },
            simc_line = 'actions.aoe+=/chi_burst,if=talent.chi_burst.enabled',
        },
        {
            action = 'breath_of_fire',
            condition = 'debuff.keg_smash.up',
            condition_converted = 'keg_smash.aura_up',
            condition_keywords = {
                'keg_smash.aura_up',
            },
            simc_line = 'actions.aoe+=/breath_of_fire,if=debuff.keg_smash.up',
        },
        {
            action = 'rushing_jade_wind',
            condition = 'talent.rushing_jade_wind.enabled',
            condition_converted = 'rushing_jade_wind.talent_selected',
            condition_keywords = {
                'rushing_jade_wind.talent_selected',
            },
            simc_line = 'actions.aoe+=/rushing_jade_wind,if=talent.rushing_jade_wind.enabled',
        },
        {
            action = 'tiger_palm',
            condition = 'energy>65',
            condition_converted = '((energy.curr_as_number) > (65))',
            condition_keywords = {
                'energy.curr',
            },
            simc_line = 'actions.aoe+=/tiger_palm,if=energy>65',
        },
        {
            action = 'chi_wave',
            condition = 'talent.chi_wave.enabled',
            condition_converted = 'chi_wave.talent_selected',
            condition_keywords = {
                'chi_wave.talent_selected',
            },
            simc_line = 'actions.aoe+=/chi_wave,if=talent.chi_wave.enabled',
        },
    },
    default = {
        {
            action = 'call_action_list',
            condition = 'active_enemies<3',
            condition_converted = '((active_enemies_as_number) < (3))',
            condition_keywords = {
                'active_enemies',
            },
            name = 'st',
            simc_line = 'actions+=/call_action_list,name=st,if=active_enemies<3',
        },
        {
            action = 'call_action_list',
            condition = 'active_enemies>=3',
            condition_converted = '((active_enemies_as_number) >= (3))',
            condition_keywords = {
                'active_enemies',
            },
            name = 'aoe',
            simc_line = 'actions+=/call_action_list,name=aoe,if=active_enemies>=3',
        },
    },
    st = {
        {
            action = 'tiger_palm',
            condition = 'energy>65',
            condition_converted = '((energy.curr_as_number) > (65))',
            condition_keywords = {
                'energy.curr',
            },
            simc_line = 'actions.st+=/tiger_palm,if=energy>65',
        },
        {
            action = 'rushing_jade_wind',
            condition = 'talent.rushing_jade_wind.enabled',
            condition_converted = 'rushing_jade_wind.talent_selected',
            condition_keywords = {
                'rushing_jade_wind.talent_selected',
            },
            simc_line = 'actions.st+=/rushing_jade_wind,if=talent.rushing_jade_wind.enabled',
        },
        {
            action = 'breath_of_fire',
            condition = 'debuff.keg_smash.up',
            condition_converted = 'keg_smash.aura_up',
            condition_keywords = {
                'keg_smash.aura_up',
            },
            simc_line = 'actions.st+=/breath_of_fire,if=debuff.keg_smash.up',
        },
        {
            action = 'chi_wave',
            condition = 'talent.chi_wave.enabled',
            condition_converted = 'chi_wave.talent_selected',
            condition_keywords = {
                'chi_wave.talent_selected',
            },
            simc_line = 'actions.st+=/chi_wave,if=talent.chi_wave.enabled',
        },
    },
}


