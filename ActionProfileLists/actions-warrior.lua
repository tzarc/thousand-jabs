local _, internal = ...
internal.apls = internal.apls or {}
internal.actions = internal.actions or {}

internal.apls["legion-dev::warrior::arms"] = [[
actions.precombat=flask,type=countless_armies
actions.precombat+=/food,type=nightborne_delicacy_platter
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=old_war
actions=charge
actions+=/auto_attack
actions+=/potion,name=old_war,if=(target.health.pct<20&buff.battle_cry.up)|target.time_to_die<=26
actions+=/blood_fury,if=buff.battle_cry.up|target.time_to_die<=16
actions+=/berserking,if=buff.battle_cry.up|target.time_to_die<=11
actions+=/arcane_torrent,if=buff.battle_cry_deadly_calm.down&rage.deficit>40
actions+=/battle_cry,if=(buff.bloodlust.up|time>=1)&gcd.remains<0.5&(buff.shattered_defenses.up|(cooldown.colossus_smash.remains&cooldown.warbreaker.remains))|target.time_to_die<=10
actions+=/avatar,if=(buff.bloodlust.up|time>=1)
actions+=/heroic_leap,if=debuff.colossus_smash.up
actions+=/rend,if=remains<gcd
actions+=/focused_rage,if=buff.battle_cry_deadly_calm.remains>cooldown.focused_rage.remains&(buff.focused_rage.stack<3|!cooldown.mortal_strike.up)&((!buff.focused_rage.react&prev_gcd.mortal_strike)|!prev_gcd.mortal_strike)
actions+=/colossus_smash,if=debuff.colossus_smash.down
actions+=/warbreaker,if=debuff.colossus_smash.down
actions+=/ravager
actions+=/overpower,if=buff.overpower.react
actions+=/run_action_list,name=cleave,if=spell_targets.whirlwind>=2&talent.sweeping_strikes.enabled
actions+=/run_action_list,name=aoe,if=spell_targets.whirlwind>=5&!talent.sweeping_strikes.enabled
actions+=/run_action_list,name=execute,target_if=target.health.pct<=20&spell_targets.whirlwind<5
actions+=/run_action_list,name=single,if=target.health.pct>20
actions.aoe=mortal_strike
actions.aoe+=/execute,if=buff.stone_heart.react
actions.aoe+=/colossus_smash,if=buff.shattered_defenses.down&buff.precise_strikes.down
actions.aoe+=/warbreaker,if=buff.shattered_defenses.down
actions.aoe+=/whirlwind,if=talent.fervor_of_battle.enabled&(debuff.colossus_smash.up|rage.deficit<50)&(!talent.focused_rage.enabled|buff.battle_cry_deadly_calm.up|buff.cleave.up)
actions.aoe+=/rend,if=remains<=duration*0.3
actions.aoe+=/bladestorm
actions.aoe+=/cleave
actions.aoe+=/execute,if=rage>90
actions.aoe+=/whirlwind,if=rage>=40
actions.aoe+=/shockwave
actions.aoe+=/storm_bolt
actions.cleave=mortal_strike
actions.cleave+=/execute,if=buff.stone_heart.react
actions.cleave+=/colossus_smash,if=buff.shattered_defenses.down&buff.precise_strikes.down
actions.cleave+=/warbreaker,if=buff.shattered_defenses.down
actions.cleave+=/focused_rage,if=rage>100|buff.battle_cry_deadly_calm.up
actions.cleave+=/whirlwind,if=talent.fervor_of_battle.enabled&(debuff.colossus_smash.up|rage.deficit<50)&(!talent.focused_rage.enabled|buff.battle_cry_deadly_calm.up|buff.cleave.up)
actions.cleave+=/rend,if=remains<=duration*0.3
actions.cleave+=/bladestorm
actions.cleave+=/cleave
actions.cleave+=/whirlwind,if=rage>40|buff.cleave.up
actions.cleave+=/shockwave
actions.cleave+=/storm_bolt
actions.execute=mortal_strike,if=buff.battle_cry.up&buff.focused_rage.stack=3
actions.execute+=/execute,if=buff.battle_cry_deadly_calm.up
actions.execute+=/colossus_smash,if=buff.shattered_defenses.down
actions.execute+=/warbreaker,if=buff.shattered_defenses.down&rage<=30
actions.execute+=/execute,if=buff.shattered_defenses.up&rage>22
actions.execute+=/execute,if=buff.shattered_defenses.down&((equipped.archavons_heavy_hand&rage>40)|!equipped.archavons_heavy_hand)
actions.execute+=/mortal_strike,if=equipped.archavons_heavy_hand
actions.execute+=/execute,if=buff.shattered_defenses.down
actions.execute+=/bladestorm,interrupt=1,if=raid_event.adds.in>90|!raid_event.adds.exists|spell_targets.bladestorm_mh>desired_targets
actions.single=mortal_strike,if=buff.battle_cry.up&buff.focused_rage.stack>=1&buff.battle_cry.remains<gcd
actions.single+=/colossus_smash,if=buff.shattered_defenses.down
actions.single+=/warbreaker,if=buff.shattered_defenses.down&cooldown.mortal_strike.remains<gcd
actions.single+=/focused_rage,if=(((!buff.focused_rage.react&prev_gcd.mortal_strike)|!prev_gcd.mortal_strike)&buff.focused_rage.stack<3&(buff.shattered_defenses.up|cooldown.colossus_smash.remains))&rage>60
actions.single+=/mortal_strike
actions.single+=/execute,if=buff.stone_heart.react
actions.single+=/whirlwind,if=spell_targets.whirlwind>1
actions.single+=/slam,if=spell_targets.whirlwind=1
actions.single+=/execute,if=equipped.archavons_heavy_hand
actions.single+=/focused_rage,if=equipped.archavons_heavy_hand
actions.single+=/bladestorm,interrupt=1,if=raid_event.adds.in>90|!raid_event.adds.exists|spell_targets.bladestorm_mh>desired_targets
]]

-- keywords: legion-dev::warrior::arms
---- battle_cry.spell_remains
---- battle_cry_deadly_calm.spell_remains
---- bloodlust.spell_remains
---- cleave.spell_remains
---- colossus_smash.cooldown_remains
---- colossus_smash.spell_remains
---- desired_targets
---- equipped.archavons_heavy_hand
---- fervor_of_battle.talent_enabled
---- focused_rage.cooldown_remains
---- focused_rage.spell_remains
---- focused_rage.spell_stack
---- focused_rage.talent_enabled
---- gcd
---- gcd.remains
---- health.target_percent
---- mortal_strike.cooldown_remains
---- overpower.spell_remains
---- precise_strikes.spell_remains
---- prev_gcd.mortal_strike
---- rage.curr
---- rage.deficit
---- raid_event.adds.exists
---- raid_event.adds.in
---- rend.spell_duration
---- rend.spell_remains
---- shattered_defenses.spell_remains
---- spell_targets
---- stone_heart.spell_remains
---- sweeping_strikes.talent_enabled
---- target.time_to_die
---- time
---- warbreaker.cooldown_remains

internal.actions['legion-dev::warrior::arms'] = {
    aoe = {
        {
            action = 'execute',
            condition = 'buff.stone_heart.react',
            condition_converted = '(stone_heart.spell_remains_as_number > 0)',
            condition_keywords = {
                'stone_heart.spell_remains',
            },
            simc_line = 'actions.aoe+=/execute,if=buff.stone_heart.react',
        },
        {
            action = 'colossus_smash',
            condition = 'buff.shattered_defenses.down&buff.precise_strikes.down',
            condition_converted = '(((shattered_defenses.spell_remains == 0)) and ((precise_strikes.spell_remains == 0)))',
            condition_keywords = {
                'precise_strikes.spell_remains',
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.aoe+=/colossus_smash,if=buff.shattered_defenses.down&buff.precise_strikes.down',
        },
        {
            action = 'warbreaker',
            condition = 'buff.shattered_defenses.down',
            condition_converted = '(shattered_defenses.spell_remains == 0)',
            condition_keywords = {
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.aoe+=/warbreaker,if=buff.shattered_defenses.down',
        },
        {
            action = 'whirlwind',
            condition = 'talent.fervor_of_battle.enabled&(debuff.colossus_smash.up|rage.deficit<50)&(!talent.focused_rage.enabled|buff.battle_cry_deadly_calm.up|buff.cleave.up)',
            condition_converted = '((fervor_of_battle.talent_enabled) and (((((((colossus_smash.spell_remains_as_number > 0)) or (((rage.deficit_as_number) < (50)))))) and (((((not focused_rage.talent_enabled)) or ((((battle_cry_deadly_calm.spell_remains_as_number > 0)) or ((cleave.spell_remains_as_number > 0))))))))))',
            condition_keywords = {
                'battle_cry_deadly_calm.spell_remains',
                'cleave.spell_remains',
                'colossus_smash.spell_remains',
                'fervor_of_battle.talent_enabled',
                'focused_rage.talent_enabled',
                'rage.deficit',
            },
            simc_line = 'actions.aoe+=/whirlwind,if=talent.fervor_of_battle.enabled&(debuff.colossus_smash.up|rage.deficit<50)&(!talent.focused_rage.enabled|buff.battle_cry_deadly_calm.up|buff.cleave.up)',
        },
        {
            action = 'rend',
            condition = 'remains<=duration*0.3',
            condition_converted = '((rend.spell_remains_as_number) <= ((rend.spell_duration_as_number * 0.3)))',
            condition_keywords = {
                'rend.spell_duration',
                'rend.spell_remains',
            },
            simc_line = 'actions.aoe+=/rend,if=remains<=duration*0.3',
        },
        {
            action = 'execute',
            condition = 'rage>90',
            condition_converted = '((rage.curr_as_number) > (90))',
            condition_keywords = {
                'rage.curr',
            },
            simc_line = 'actions.aoe+=/execute,if=rage>90',
        },
        {
            action = 'whirlwind',
            condition = 'rage>=40',
            condition_converted = '((rage.curr_as_number) >= (40))',
            condition_keywords = {
                'rage.curr',
            },
            simc_line = 'actions.aoe+=/whirlwind,if=rage>=40',
        },
    },
    cleave = {
        {
            action = 'execute',
            condition = 'buff.stone_heart.react',
            condition_converted = '(stone_heart.spell_remains_as_number > 0)',
            condition_keywords = {
                'stone_heart.spell_remains',
            },
            simc_line = 'actions.cleave+=/execute,if=buff.stone_heart.react',
        },
        {
            action = 'colossus_smash',
            condition = 'buff.shattered_defenses.down&buff.precise_strikes.down',
            condition_converted = '(((shattered_defenses.spell_remains == 0)) and ((precise_strikes.spell_remains == 0)))',
            condition_keywords = {
                'precise_strikes.spell_remains',
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.cleave+=/colossus_smash,if=buff.shattered_defenses.down&buff.precise_strikes.down',
        },
        {
            action = 'warbreaker',
            condition = 'buff.shattered_defenses.down',
            condition_converted = '(shattered_defenses.spell_remains == 0)',
            condition_keywords = {
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.cleave+=/warbreaker,if=buff.shattered_defenses.down',
        },
        {
            action = 'focused_rage',
            condition = 'rage>100|buff.battle_cry_deadly_calm.up',
            condition_converted = '((((rage.curr_as_number) > (100))) or ((battle_cry_deadly_calm.spell_remains_as_number > 0)))',
            condition_keywords = {
                'battle_cry_deadly_calm.spell_remains',
                'rage.curr',
            },
            simc_line = 'actions.cleave+=/focused_rage,if=rage>100|buff.battle_cry_deadly_calm.up',
        },
        {
            action = 'whirlwind',
            condition = 'talent.fervor_of_battle.enabled&(debuff.colossus_smash.up|rage.deficit<50)&(!talent.focused_rage.enabled|buff.battle_cry_deadly_calm.up|buff.cleave.up)',
            condition_converted = '((fervor_of_battle.talent_enabled) and (((((((colossus_smash.spell_remains_as_number > 0)) or (((rage.deficit_as_number) < (50)))))) and (((((not focused_rage.talent_enabled)) or ((((battle_cry_deadly_calm.spell_remains_as_number > 0)) or ((cleave.spell_remains_as_number > 0))))))))))',
            condition_keywords = {
                'battle_cry_deadly_calm.spell_remains',
                'cleave.spell_remains',
                'colossus_smash.spell_remains',
                'fervor_of_battle.talent_enabled',
                'focused_rage.talent_enabled',
                'rage.deficit',
            },
            simc_line = 'actions.cleave+=/whirlwind,if=talent.fervor_of_battle.enabled&(debuff.colossus_smash.up|rage.deficit<50)&(!talent.focused_rage.enabled|buff.battle_cry_deadly_calm.up|buff.cleave.up)',
        },
        {
            action = 'rend',
            condition = 'remains<=duration*0.3',
            condition_converted = '((rend.spell_remains_as_number) <= ((rend.spell_duration_as_number * 0.3)))',
            condition_keywords = {
                'rend.spell_duration',
                'rend.spell_remains',
            },
            simc_line = 'actions.cleave+=/rend,if=remains<=duration*0.3',
        },
        {
            action = 'whirlwind',
            condition = 'rage>40|buff.cleave.up',
            condition_converted = '((((rage.curr_as_number) > (40))) or ((cleave.spell_remains_as_number > 0)))',
            condition_keywords = {
                'cleave.spell_remains',
                'rage.curr',
            },
            simc_line = 'actions.cleave+=/whirlwind,if=rage>40|buff.cleave.up',
        },
    },
    default = {
        {
            action = 'potion',
            condition = '(target.health.pct<20&buff.battle_cry.up)|target.time_to_die<=26',
            condition_converted = '(((((((health.target_percent_as_number) < (20))) and ((battle_cry.spell_remains_as_number > 0))))) or (((target.time_to_die_as_number) <= (26))))',
            condition_keywords = {
                'battle_cry.spell_remains',
                'health.target_percent',
                'target.time_to_die',
            },
            name = 'old_war',
            simc_line = 'actions+=/potion,name=old_war,if=(target.health.pct<20&buff.battle_cry.up)|target.time_to_die<=26',
        },
        {
            action = 'blood_fury',
            condition = 'buff.battle_cry.up|target.time_to_die<=16',
            condition_converted = '(((battle_cry.spell_remains_as_number > 0)) or (((target.time_to_die_as_number) <= (16))))',
            condition_keywords = {
                'battle_cry.spell_remains',
                'target.time_to_die',
            },
            simc_line = 'actions+=/blood_fury,if=buff.battle_cry.up|target.time_to_die<=16',
        },
        {
            action = 'berserking',
            condition = 'buff.battle_cry.up|target.time_to_die<=11',
            condition_converted = '(((battle_cry.spell_remains_as_number > 0)) or (((target.time_to_die_as_number) <= (11))))',
            condition_keywords = {
                'battle_cry.spell_remains',
                'target.time_to_die',
            },
            simc_line = 'actions+=/berserking,if=buff.battle_cry.up|target.time_to_die<=11',
        },
        {
            action = 'arcane_torrent',
            condition = 'buff.battle_cry_deadly_calm.down&rage.deficit>40',
            condition_converted = '(((battle_cry_deadly_calm.spell_remains == 0)) and (((rage.deficit_as_number) > (40))))',
            condition_keywords = {
                'battle_cry_deadly_calm.spell_remains',
                'rage.deficit',
            },
            simc_line = 'actions+=/arcane_torrent,if=buff.battle_cry_deadly_calm.down&rage.deficit>40',
        },
        {
            action = 'battle_cry',
            condition = '(buff.bloodlust.up|time>=1)&gcd.remains<0.5&(buff.shattered_defenses.up|(cooldown.colossus_smash.remains&cooldown.warbreaker.remains))|target.time_to_die<=10',
            condition_converted = '((((((((bloodlust.spell_remains_as_number > 0)) or (((time_as_number) >= (1)))))) and (((((gcd.remains_as_number) < (0.5))) and (((((shattered_defenses.spell_remains_as_number > 0)) or ((((colossus_smash.cooldown_remains) and (warbreaker.cooldown_remains))))))))))) or (((target.time_to_die_as_number) <= (10))))',
            condition_keywords = {
                'bloodlust.spell_remains',
                'colossus_smash.cooldown_remains',
                'gcd.remains',
                'shattered_defenses.spell_remains',
                'target.time_to_die',
                'time',
                'warbreaker.cooldown_remains',
            },
            simc_line = 'actions+=/battle_cry,if=(buff.bloodlust.up|time>=1)&gcd.remains<0.5&(buff.shattered_defenses.up|(cooldown.colossus_smash.remains&cooldown.warbreaker.remains))|target.time_to_die<=10',
        },
        {
            action = 'avatar',
            condition = '(buff.bloodlust.up|time>=1)',
            condition_converted = '((((bloodlust.spell_remains_as_number > 0)) or (((time_as_number) >= (1)))))',
            condition_keywords = {
                'bloodlust.spell_remains',
                'time',
            },
            simc_line = 'actions+=/avatar,if=(buff.bloodlust.up|time>=1)',
        },
        {
            action = 'heroic_leap',
            condition = 'debuff.colossus_smash.up',
            condition_converted = '(colossus_smash.spell_remains_as_number > 0)',
            condition_keywords = {
                'colossus_smash.spell_remains',
            },
            simc_line = 'actions+=/heroic_leap,if=debuff.colossus_smash.up',
        },
        {
            action = 'rend',
            condition = 'remains<gcd',
            condition_converted = '((rend.spell_remains_as_number) < (gcd_as_number))',
            condition_keywords = {
                'gcd',
                'rend.spell_remains',
            },
            simc_line = 'actions+=/rend,if=remains<gcd',
        },
        {
            action = 'focused_rage',
            condition = 'buff.battle_cry_deadly_calm.remains>cooldown.focused_rage.remains&(buff.focused_rage.stack<3|!cooldown.mortal_strike.up)&((!buff.focused_rage.react&prev_gcd.mortal_strike)|!prev_gcd.mortal_strike)',
            condition_converted = '((((battle_cry_deadly_calm.spell_remains_as_number) > (focused_rage.cooldown_remains_as_number))) and ((((((((focused_rage.spell_stack_as_number) < (3))) or ((not ((mortal_strike.cooldown_remains_as_number > 0))))))) and ((((((((not ((focused_rage.spell_remains_as_number > 0)))) and (prev_gcd.mortal_strike)))) or ((not (prev_gcd.mortal_strike)))))))))',
            condition_keywords = {
                'battle_cry_deadly_calm.spell_remains',
                'focused_rage.cooldown_remains',
                'focused_rage.spell_remains',
                'focused_rage.spell_stack',
                'mortal_strike.cooldown_remains',
                'prev_gcd.mortal_strike',
            },
            simc_line = 'actions+=/focused_rage,if=buff.battle_cry_deadly_calm.remains>cooldown.focused_rage.remains&(buff.focused_rage.stack<3|!cooldown.mortal_strike.up)&((!buff.focused_rage.react&prev_gcd.mortal_strike)|!prev_gcd.mortal_strike)',
        },
        {
            action = 'colossus_smash',
            condition = 'debuff.colossus_smash.down',
            condition_converted = '(colossus_smash.spell_remains == 0)',
            condition_keywords = {
                'colossus_smash.spell_remains',
            },
            simc_line = 'actions+=/colossus_smash,if=debuff.colossus_smash.down',
        },
        {
            action = 'warbreaker',
            condition = 'debuff.colossus_smash.down',
            condition_converted = '(colossus_smash.spell_remains == 0)',
            condition_keywords = {
                'colossus_smash.spell_remains',
            },
            simc_line = 'actions+=/warbreaker,if=debuff.colossus_smash.down',
        },
        {
            action = 'overpower',
            condition = 'buff.overpower.react',
            condition_converted = '(overpower.spell_remains_as_number > 0)',
            condition_keywords = {
                'overpower.spell_remains',
            },
            simc_line = 'actions+=/overpower,if=buff.overpower.react',
        },
        {
            action = 'run_action_list',
            condition = 'spell_targets.whirlwind>=2&talent.sweeping_strikes.enabled',
            condition_converted = '((((spell_targets_as_number) >= (2))) and (sweeping_strikes.talent_enabled))',
            condition_keywords = {
                'spell_targets',
                'sweeping_strikes.talent_enabled',
            },
            name = 'cleave',
            simc_line = 'actions+=/run_action_list,name=cleave,if=spell_targets.whirlwind>=2&talent.sweeping_strikes.enabled',
        },
        {
            action = 'run_action_list',
            condition = 'spell_targets.whirlwind>=5&!talent.sweeping_strikes.enabled',
            condition_converted = '((((spell_targets_as_number) >= (5))) and ((not sweeping_strikes.talent_enabled)))',
            condition_keywords = {
                'spell_targets',
                'sweeping_strikes.talent_enabled',
            },
            name = 'aoe',
            simc_line = 'actions+=/run_action_list,name=aoe,if=spell_targets.whirlwind>=5&!talent.sweeping_strikes.enabled',
        },
        {
            action = 'run_action_list',
            name = 'execute',
            simc_line = 'actions+=/run_action_list,name=execute,target_if=target.health.pct<=20&spell_targets.whirlwind<5',
            target_if = 'target.health.pct<=20&spell_targets.whirlwind<5',
        },
        {
            action = 'run_action_list',
            condition = 'target.health.pct>20',
            condition_converted = '((health.target_percent_as_number) > (20))',
            condition_keywords = {
                'health.target_percent',
            },
            name = 'single',
            simc_line = 'actions+=/run_action_list,name=single,if=target.health.pct>20',
        },
    },
    execute = {
        {
            action = 'mortal_strike',
            condition = 'buff.battle_cry.up&buff.focused_rage.stack=3',
            condition_converted = '(((battle_cry.spell_remains_as_number > 0)) and (((focused_rage.spell_stack) == (3))))',
            condition_keywords = {
                'battle_cry.spell_remains',
                'focused_rage.spell_stack',
            },
            simc_line = 'actions.execute=mortal_strike,if=buff.battle_cry.up&buff.focused_rage.stack=3',
        },
        {
            action = 'execute',
            condition = 'buff.battle_cry_deadly_calm.up',
            condition_converted = '(battle_cry_deadly_calm.spell_remains_as_number > 0)',
            condition_keywords = {
                'battle_cry_deadly_calm.spell_remains',
            },
            simc_line = 'actions.execute+=/execute,if=buff.battle_cry_deadly_calm.up',
        },
        {
            action = 'colossus_smash',
            condition = 'buff.shattered_defenses.down',
            condition_converted = '(shattered_defenses.spell_remains == 0)',
            condition_keywords = {
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.execute+=/colossus_smash,if=buff.shattered_defenses.down',
        },
        {
            action = 'warbreaker',
            condition = 'buff.shattered_defenses.down&rage<=30',
            condition_converted = '(((shattered_defenses.spell_remains == 0)) and (((rage.curr_as_number) <= (30))))',
            condition_keywords = {
                'rage.curr',
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.execute+=/warbreaker,if=buff.shattered_defenses.down&rage<=30',
        },
        {
            action = 'execute',
            condition = 'buff.shattered_defenses.up&rage>22',
            condition_converted = '(((shattered_defenses.spell_remains_as_number > 0)) and (((rage.curr_as_number) > (22))))',
            condition_keywords = {
                'rage.curr',
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.execute+=/execute,if=buff.shattered_defenses.up&rage>22',
        },
        {
            action = 'execute',
            condition = 'buff.shattered_defenses.down&((equipped.archavons_heavy_hand&rage>40)|!equipped.archavons_heavy_hand)',
            condition_converted = '(((shattered_defenses.spell_remains == 0)) and (((((((equipped.archavons_heavy_hand) and (((rage.curr_as_number) > (40)))))) or ((not (equipped.archavons_heavy_hand)))))))',
            condition_keywords = {
                'equipped.archavons_heavy_hand',
                'rage.curr',
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.execute+=/execute,if=buff.shattered_defenses.down&((equipped.archavons_heavy_hand&rage>40)|!equipped.archavons_heavy_hand)',
        },
        {
            action = 'mortal_strike',
            condition = 'equipped.archavons_heavy_hand',
            condition_converted = 'equipped.archavons_heavy_hand',
            condition_keywords = {
                'equipped.archavons_heavy_hand',
            },
            simc_line = 'actions.execute+=/mortal_strike,if=equipped.archavons_heavy_hand',
        },
        {
            action = 'execute',
            condition = 'buff.shattered_defenses.down',
            condition_converted = '(shattered_defenses.spell_remains == 0)',
            condition_keywords = {
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.execute+=/execute,if=buff.shattered_defenses.down',
        },
        {
            action = 'bladestorm',
            condition = 'raid_event.adds.in>90|!raid_event.adds.exists|spell_targets.bladestorm_mh>desired_targets',
            condition_converted = '((((raid_event.adds.in_as_number) > (90))) or ((((not (raid_event.adds.exists))) or (((spell_targets_as_number) > (desired_targets_as_number))))))',
            condition_keywords = {
                'desired_targets',
                'raid_event.adds.exists',
                'raid_event.adds.in',
                'spell_targets',
            },
            interrupt = '1',
            simc_line = 'actions.execute+=/bladestorm,interrupt=1,if=raid_event.adds.in>90|!raid_event.adds.exists|spell_targets.bladestorm_mh>desired_targets',
        },
    },
    precombat = {
        {
            action = 'flask',
            simc_line = 'actions.precombat=flask,type=countless_armies',
            type = 'countless_armies',
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
            action = 'potion',
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
    },
    single = {
        {
            action = 'mortal_strike',
            condition = 'buff.battle_cry.up&buff.focused_rage.stack>=1&buff.battle_cry.remains<gcd',
            condition_converted = '(((battle_cry.spell_remains_as_number > 0)) and (((((focused_rage.spell_stack_as_number) >= (1))) and (((battle_cry.spell_remains_as_number) < (gcd_as_number))))))',
            condition_keywords = {
                'battle_cry.spell_remains',
                'focused_rage.spell_stack',
                'gcd',
            },
            simc_line = 'actions.single=mortal_strike,if=buff.battle_cry.up&buff.focused_rage.stack>=1&buff.battle_cry.remains<gcd',
        },
        {
            action = 'colossus_smash',
            condition = 'buff.shattered_defenses.down',
            condition_converted = '(shattered_defenses.spell_remains == 0)',
            condition_keywords = {
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.single+=/colossus_smash,if=buff.shattered_defenses.down',
        },
        {
            action = 'warbreaker',
            condition = 'buff.shattered_defenses.down&cooldown.mortal_strike.remains<gcd',
            condition_converted = '(((shattered_defenses.spell_remains == 0)) and (((mortal_strike.cooldown_remains_as_number) < (gcd_as_number))))',
            condition_keywords = {
                'gcd',
                'mortal_strike.cooldown_remains',
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.single+=/warbreaker,if=buff.shattered_defenses.down&cooldown.mortal_strike.remains<gcd',
        },
        {
            action = 'focused_rage',
            condition = '(((!buff.focused_rage.react&prev_gcd.mortal_strike)|!prev_gcd.mortal_strike)&buff.focused_rage.stack<3&(buff.shattered_defenses.up|cooldown.colossus_smash.remains))&rage>60',
            condition_converted = '((((((((((((not ((focused_rage.spell_remains_as_number > 0)))) and (prev_gcd.mortal_strike)))) or ((not (prev_gcd.mortal_strike)))))) and (((((focused_rage.spell_stack_as_number) < (3))) and (((((shattered_defenses.spell_remains_as_number > 0)) or (colossus_smash.cooldown_remains))))))))) and (((rage.curr_as_number) > (60))))',
            condition_keywords = {
                'colossus_smash.cooldown_remains',
                'focused_rage.spell_remains',
                'focused_rage.spell_stack',
                'prev_gcd.mortal_strike',
                'rage.curr',
                'shattered_defenses.spell_remains',
            },
            simc_line = 'actions.single+=/focused_rage,if=(((!buff.focused_rage.react&prev_gcd.mortal_strike)|!prev_gcd.mortal_strike)&buff.focused_rage.stack<3&(buff.shattered_defenses.up|cooldown.colossus_smash.remains))&rage>60',
        },
        {
            action = 'execute',
            condition = 'buff.stone_heart.react',
            condition_converted = '(stone_heart.spell_remains_as_number > 0)',
            condition_keywords = {
                'stone_heart.spell_remains',
            },
            simc_line = 'actions.single+=/execute,if=buff.stone_heart.react',
        },
        {
            action = 'whirlwind',
            condition = 'spell_targets.whirlwind>1',
            condition_converted = '((spell_targets_as_number) > (1))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.single+=/whirlwind,if=spell_targets.whirlwind>1',
        },
        {
            action = 'slam',
            condition = 'spell_targets.whirlwind=1',
            condition_converted = '((spell_targets) == (1))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.single+=/slam,if=spell_targets.whirlwind=1',
        },
        {
            action = 'execute',
            condition = 'equipped.archavons_heavy_hand',
            condition_converted = 'equipped.archavons_heavy_hand',
            condition_keywords = {
                'equipped.archavons_heavy_hand',
            },
            simc_line = 'actions.single+=/execute,if=equipped.archavons_heavy_hand',
        },
        {
            action = 'focused_rage',
            condition = 'equipped.archavons_heavy_hand',
            condition_converted = 'equipped.archavons_heavy_hand',
            condition_keywords = {
                'equipped.archavons_heavy_hand',
            },
            simc_line = 'actions.single+=/focused_rage,if=equipped.archavons_heavy_hand',
        },
        {
            action = 'bladestorm',
            condition = 'raid_event.adds.in>90|!raid_event.adds.exists|spell_targets.bladestorm_mh>desired_targets',
            condition_converted = '((((raid_event.adds.in_as_number) > (90))) or ((((not (raid_event.adds.exists))) or (((spell_targets_as_number) > (desired_targets_as_number))))))',
            condition_keywords = {
                'desired_targets',
                'raid_event.adds.exists',
                'raid_event.adds.in',
                'spell_targets',
            },
            interrupt = '1',
            simc_line = 'actions.single+=/bladestorm,interrupt=1,if=raid_event.adds.in>90|!raid_event.adds.exists|spell_targets.bladestorm_mh>desired_targets',
        },
    },
}


internal.apls["legion-dev::warrior::fury"] = [[
actions.precombat=flask,type=countless_armies
actions.precombat+=/food,type=nightborne_delicacy_platter
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=old_war
actions=auto_attack
actions+=/charge
actions+=/run_action_list,name=movement,if=movement.distance>5
actions+=/heroic_leap,if=(raid_event.movement.distance>25&raid_event.movement.in>45)|!raid_event.movement.exists
actions+=/potion,name=old_war,if=(target.health.pct<20&buff.battle_cry.up)|target.time_to_die<30
actions+=/battle_cry,if=(cooldown.odyns_fury.remains=0&(cooldown.bloodthirst.remains=0|(buff.enrage.remains>cooldown.bloodthirst.remains)))
actions+=/avatar,if=buff.battle_cry.up|(target.time_to_die<(cooldown.battle_cry.remains+10))
actions+=/bloodbath,if=buff.dragon_roar.up|(!talent.dragon_roar.enabled&(buff.battle_cry.up|cooldown.battle_cry.remains>10))
actions+=/blood_fury,if=buff.battle_cry.up
actions+=/berserking,if=buff.battle_cry.up
actions+=/arcane_torrent,if=rage<rage.max-40
actions+=/call_action_list,name=two_targets,if=spell_targets.whirlwind=2|spell_targets.whirlwind=3
actions+=/call_action_list,name=aoe,if=spell_targets.whirlwind>3
actions+=/call_action_list,name=single_target
actions.aoe=bloodthirst,if=buff.enrage.down|rage<50
actions.aoe+=/call_action_list,name=bladestorm
actions.aoe+=/odyns_fury,if=buff.battle_cry.up&buff.enrage.up
actions.aoe+=/whirlwind,if=buff.enrage.up
actions.aoe+=/dragon_roar
actions.aoe+=/rampage,if=buff.meat_cleaver.up
actions.aoe+=/bloodthirst
actions.aoe+=/whirlwind
actions.bladestorm=bladestorm,if=buff.enrage.remains>2&(raid_event.adds.in>90|!raid_event.adds.exists|spell_targets.bladestorm_mh>desired_targets)
actions.movement=heroic_leap
actions.single_target=bloodthirst,if=buff.fujiedas_fury.up&buff.fujiedas_fury.remains<2
actions.single_target+=/execute,if=(artifact.juggernaut.enabled&(!buff.juggernaut.up|buff.juggernaut.remains<2|(buff.sense_death.react&buff.enrage.up)))|buff.stone_heart.react
actions.single_target+=/rampage,if=(rage=100&(target.health.pct>=20|(target.health.pct<20&!talent.massacre.enabled&!talent.frothing_berserker.enabled)))|(buff.massacre.react&buff.enrage.remains<1)
actions.single_target+=/berserker_rage,if=talent.outburst.enabled&cooldown.odyns_fury.remains=0&buff.enrage.down
actions.single_target+=/dragon_roar,if=cooldown.odyns_fury.remains>=10|cooldown.odyns_fury.remains<=3
actions.single_target+=/odyns_fury,if=buff.battle_cry.up&buff.enrage.up
actions.single_target+=/rampage,if=buff.juggernaut.down&((!talent.frothing_berserker.enabled&buff.enrage.down)|(talent.frothing_berserker.enabled&rage=100)|(talent.reckless_abandon.enabled&cooldown.battle_cry.remains<=gcd.max))
actions.single_target+=/furious_slash,if=talent.frenzy.enabled&(buff.frenzy.down|buff.frenzy.remains<=3)
actions.single_target+=/raging_blow,if=buff.juggernaut.down&buff.enrage.up
actions.single_target+=/whirlwind,if=buff.wrecking_ball.react&buff.enrage.up
actions.single_target+=/bloodthirst,if=(talent.frothing_berserker.enabled&buff.enrage.down)|(buff.enrage.remains<2&buff.battle_cry.up&buff.battle_cry.remains<=gcd.max)
actions.single_target+=/execute,if=((talent.inner_rage.enabled|!talent.inner_rage.enabled&rage>50)&(!talent.frothing_berserker.enabled|buff.frothing_berserker.up|(cooldown.battle_cry.remains<5&talent.reckless_abandon.enabled)))
actions.single_target+=/bloodthirst,if=buff.enrage.down
actions.single_target+=/raging_blow,if=buff.enrage.down
actions.single_target+=/execute,if=artifact.juggernaut.enabled&(!talent.frothing_berserker.enabled|rage=100)
actions.single_target+=/raging_blow
actions.single_target+=/bloodthirst
actions.single_target+=/furious_slash
actions.single_target+=/call_action_list,name=bladestorm
actions.single_target+=/bloodbath,if=buff.frothing_berserker.up|(rage>80&!talent.frothing_berserker.enabled)
actions.two_targets=whirlwind,if=buff.meat_cleaver.down
actions.two_targets+=/call_action_list,name=bladestorm
actions.two_targets+=/rampage,if=buff.enrage.down|(rage=100&buff.juggernaut.down)|buff.massacre.up
actions.two_targets+=/bloodthirst,if=buff.enrage.down
actions.two_targets+=/odyns_fury,if=buff.battle_cry.up&buff.enrage.up
actions.two_targets+=/raging_blow,if=talent.inner_rage.enabled&spell_targets.whirlwind=2
actions.two_targets+=/whirlwind,if=spell_targets.whirlwind>2
actions.two_targets+=/dragon_roar
actions.two_targets+=/bloodthirst
actions.two_targets+=/whirlwind
]]

-- keywords: legion-dev::warrior::fury
---- battle_cry.cooldown_remains
---- battle_cry.spell_remains
---- bloodthirst.cooldown_remains
---- desired_targets
---- dragon_roar.spell_remains
---- dragon_roar.talent_enabled
---- enrage.spell_remains
---- health.target_percent
---- meat_cleaver.spell_remains
---- movement.distance
---- odyns_fury.cooldown_remains
---- rage.curr
---- rage.max
---- raid_event.adds.exists
---- raid_event.adds.in
---- raid_event.movement.distance
---- raid_event.movement.exists
---- raid_event.movement.in
---- spell_targets
---- target.time_to_die

internal.actions['legion-dev::warrior::fury'] = {
    aoe = {
        {
            action = 'bloodthirst',
            condition = 'buff.enrage.down|rage<50',
            condition_converted = '(((enrage.spell_remains == 0)) or (((rage.curr_as_number) < (50))))',
            condition_keywords = {
                'enrage.spell_remains',
                'rage.curr',
            },
            simc_line = 'actions.aoe=bloodthirst,if=buff.enrage.down|rage<50',
        },
        {
            action = 'call_action_list',
            name = 'bladestorm',
            simc_line = 'actions.aoe+=/call_action_list,name=bladestorm',
        },
        {
            action = 'odyns_fury',
            condition = 'buff.battle_cry.up&buff.enrage.up',
            condition_converted = '(((battle_cry.spell_remains_as_number > 0)) and ((enrage.spell_remains_as_number > 0)))',
            condition_keywords = {
                'battle_cry.spell_remains',
                'enrage.spell_remains',
            },
            simc_line = 'actions.aoe+=/odyns_fury,if=buff.battle_cry.up&buff.enrage.up',
        },
        {
            action = 'whirlwind',
            condition = 'buff.enrage.up',
            condition_converted = '(enrage.spell_remains_as_number > 0)',
            condition_keywords = {
                'enrage.spell_remains',
            },
            simc_line = 'actions.aoe+=/whirlwind,if=buff.enrage.up',
        },
        {
            action = 'rampage',
            condition = 'buff.meat_cleaver.up',
            condition_converted = '(meat_cleaver.spell_remains_as_number > 0)',
            condition_keywords = {
                'meat_cleaver.spell_remains',
            },
            simc_line = 'actions.aoe+=/rampage,if=buff.meat_cleaver.up',
        },
    },
    bladestorm = {
        {
            action = 'bladestorm',
            condition = 'buff.enrage.remains>2&(raid_event.adds.in>90|!raid_event.adds.exists|spell_targets.bladestorm_mh>desired_targets)',
            condition_converted = '((((enrage.spell_remains_as_number) > (2))) and ((((((raid_event.adds.in_as_number) > (90))) or ((((not (raid_event.adds.exists))) or (((spell_targets_as_number) > (desired_targets_as_number)))))))))',
            condition_keywords = {
                'desired_targets',
                'enrage.spell_remains',
                'raid_event.adds.exists',
                'raid_event.adds.in',
                'spell_targets',
            },
            simc_line = 'actions.bladestorm=bladestorm,if=buff.enrage.remains>2&(raid_event.adds.in>90|!raid_event.adds.exists|spell_targets.bladestorm_mh>desired_targets)',
        },
    },
    default = {
        {
            action = 'run_action_list',
            condition = 'movement.distance>5',
            condition_converted = '((movement.distance_as_number) > (5))',
            condition_keywords = {
                'movement.distance',
            },
            name = 'movement',
            simc_line = 'actions+=/run_action_list,name=movement,if=movement.distance>5',
        },
        {
            action = 'heroic_leap',
            condition = '(raid_event.movement.distance>25&raid_event.movement.in>45)|!raid_event.movement.exists',
            condition_converted = '(((((((raid_event.movement.distance_as_number) > (25))) and (((raid_event.movement.in_as_number) > (45)))))) or ((not (raid_event.movement.exists))))',
            condition_keywords = {
                'raid_event.movement.distance',
                'raid_event.movement.exists',
                'raid_event.movement.in',
            },
            simc_line = 'actions+=/heroic_leap,if=(raid_event.movement.distance>25&raid_event.movement.in>45)|!raid_event.movement.exists',
        },
        {
            action = 'potion',
            condition = '(target.health.pct<20&buff.battle_cry.up)|target.time_to_die<30',
            condition_converted = '(((((((health.target_percent_as_number) < (20))) and ((battle_cry.spell_remains_as_number > 0))))) or (((target.time_to_die_as_number) < (30))))',
            condition_keywords = {
                'battle_cry.spell_remains',
                'health.target_percent',
                'target.time_to_die',
            },
            name = 'old_war',
            simc_line = 'actions+=/potion,name=old_war,if=(target.health.pct<20&buff.battle_cry.up)|target.time_to_die<30',
        },
        {
            action = 'battle_cry',
            condition = '(cooldown.odyns_fury.remains=0&(cooldown.bloodthirst.remains=0|(buff.enrage.remains>cooldown.bloodthirst.remains)))',
            condition_converted = '(((((odyns_fury.cooldown_remains) == (0))) and ((((((bloodthirst.cooldown_remains) == (0))) or ((((enrage.spell_remains_as_number) > (bloodthirst.cooldown_remains_as_number)))))))))',
            condition_keywords = {
                'bloodthirst.cooldown_remains',
                'enrage.spell_remains',
                'odyns_fury.cooldown_remains',
            },
            simc_line = 'actions+=/battle_cry,if=(cooldown.odyns_fury.remains=0&(cooldown.bloodthirst.remains=0|(buff.enrage.remains>cooldown.bloodthirst.remains)))',
        },
        {
            action = 'avatar',
            condition = 'buff.battle_cry.up|(target.time_to_die<(cooldown.battle_cry.remains+10))',
            condition_converted = '(((battle_cry.spell_remains_as_number > 0)) or ((((target.time_to_die_as_number) < ((battle_cry.cooldown_remains_as_number + 10))))))',
            condition_keywords = {
                'battle_cry.cooldown_remains',
                'battle_cry.spell_remains',
                'target.time_to_die',
            },
            simc_line = 'actions+=/avatar,if=buff.battle_cry.up|(target.time_to_die<(cooldown.battle_cry.remains+10))',
        },
        {
            action = 'bloodbath',
            condition = 'buff.dragon_roar.up|(!talent.dragon_roar.enabled&(buff.battle_cry.up|cooldown.battle_cry.remains>10))',
            condition_converted = '(((dragon_roar.spell_remains_as_number > 0)) or (((((not dragon_roar.talent_enabled)) and (((((battle_cry.spell_remains_as_number > 0)) or (((battle_cry.cooldown_remains_as_number) > (10))))))))))',
            condition_keywords = {
                'battle_cry.cooldown_remains',
                'battle_cry.spell_remains',
                'dragon_roar.spell_remains',
                'dragon_roar.talent_enabled',
            },
            simc_line = 'actions+=/bloodbath,if=buff.dragon_roar.up|(!talent.dragon_roar.enabled&(buff.battle_cry.up|cooldown.battle_cry.remains>10))',
        },
        {
            action = 'blood_fury',
            condition = 'buff.battle_cry.up',
            condition_converted = '(battle_cry.spell_remains_as_number > 0)',
            condition_keywords = {
                'battle_cry.spell_remains',
            },
            simc_line = 'actions+=/blood_fury,if=buff.battle_cry.up',
        },
        {
            action = 'berserking',
            condition = 'buff.battle_cry.up',
            condition_converted = '(battle_cry.spell_remains_as_number > 0)',
            condition_keywords = {
                'battle_cry.spell_remains',
            },
            simc_line = 'actions+=/berserking,if=buff.battle_cry.up',
        },
        {
            action = 'arcane_torrent',
            condition = 'rage<rage.max-40',
            condition_converted = '((rage.curr_as_number) < ((rage.max_as_number - 40)))',
            condition_keywords = {
                'rage.curr',
                'rage.max',
            },
            simc_line = 'actions+=/arcane_torrent,if=rage<rage.max-40',
        },
        {
            action = 'call_action_list',
            condition = 'spell_targets.whirlwind=2|spell_targets.whirlwind=3',
            condition_converted = '((((spell_targets) == (2))) or (((spell_targets) == (3))))',
            condition_keywords = {
                'spell_targets',
            },
            name = 'two_targets',
            simc_line = 'actions+=/call_action_list,name=two_targets,if=spell_targets.whirlwind=2|spell_targets.whirlwind=3',
        },
        {
            action = 'call_action_list',
            condition = 'spell_targets.whirlwind>3',
            condition_converted = '((spell_targets_as_number) > (3))',
            condition_keywords = {
                'spell_targets',
            },
            name = 'aoe',
            simc_line = 'actions+=/call_action_list,name=aoe,if=spell_targets.whirlwind>3',
        },
        {
            action = 'call_action_list',
            name = 'single_target',
            simc_line = 'actions+=/call_action_list,name=single_target',
        },
    },
    precombat = {
        {
            action = 'flask',
            simc_line = 'actions.precombat=flask,type=countless_armies',
            type = 'countless_armies',
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
            action = 'potion',
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
    },
}


internal.apls["legion-dev::warrior::protection"] = [[
actions.precombat=flask,type=countless_armies
actions.precombat+=/food,type=seedbattered_fish_plate
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=unbending_potion
actions=intercept
actions+=/auto_attack
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/call_action_list,name=prot
actions.prot=shield_block,if=!buff.neltharions_fury.up&((cooldown.shield_slam.remains<6&!buff.shield_block.up)|(cooldown.shield_slam.remains<6+buff.shield_block.remains&buff.shield_block.up))
actions.prot+=/ignore_pain,if=(rage>=60&!talent.vengeance.enabled)|(buff.vengeance_ignore_pain.up&buff.ultimatum.up)|(buff.vengeance_ignore_pain.up&rage>=39)|(talent.vengeance.enabled&!buff.ultimatum.up&!buff.vengeance_ignore_pain.up&!buff.vengeance_focused_rage.up&rage<30)
actions.prot+=/focused_rage,if=(buff.vengeance_focused_rage.up&!buff.vengeance_ignore_pain.up)|(buff.ultimatum.up&buff.vengeance_focused_rage.up&!buff.vengeance_ignore_pain.up)|(talent.vengeance.enabled&buff.ultimatum.up&!buff.vengeance_ignore_pain.up&!buff.vengeance_focused_rage.up)|(talent.vengeance.enabled&!buff.vengeance_ignore_pain.up&!buff.vengeance_focused_rage.up&rage>=30)|(buff.ultimatum.up&buff.vengeance_ignore_pain.up&cooldown.shield_slam.remains=0&rage<10)|(rage>=100)
actions.prot+=/demoralizing_shout,if=incoming_damage_2500ms>health.max*0.20
actions.prot+=/shield_wall,if=incoming_damage_2500ms>health.max*0.50
actions.prot+=/last_stand,if=incoming_damage_2500ms>health.max*0.50&!cooldown.shield_wall.remains=0
actions.prot+=/potion,name=unbending_potion,if=(incoming_damage_2500ms>health.max*0.15&!buff.potion.up)|target.time_to_die<=25
actions.prot+=/call_action_list,name=prot_aoe,if=spell_targets.neltharions_fury>=2
actions.prot+=/focused_rage,if=talent.ultimatum.enabled&buff.ultimatum.up&!talent.vengeance.enabled
actions.prot+=/battle_cry,if=(talent.vengeance.enabled&talent.ultimatum.enabled&cooldown.shield_slam.remains<=5-gcd.max-0.5)|!talent.vengeance.enabled
actions.prot+=/demoralizing_shout,if=talent.booming_voice.enabled&buff.battle_cry.up
actions.prot+=/ravager,if=talent.ravager.enabled&buff.battle_cry.up
actions.prot+=/neltharions_fury,if=incoming_damage_2500ms>health.max*0.20&!buff.shield_block.up
actions.prot+=/shield_slam,if=!(cooldown.shield_block.remains<=gcd.max*2&!buff.shield_block.up&talent.heavy_repercussions.enabled)
actions.prot+=/revenge,if=cooldown.shield_slam.remains<=gcd.max*2
actions.prot+=/devastate
actions.prot_aoe=focused_rage,if=talent.ultimatum.enabled&buff.ultimatum.up&!talent.vengeance.enabled
actions.prot_aoe+=/battle_cry,if=(talent.vengeance.enabled&talent.ultimatum.enabled&cooldown.shield_slam.remains<=5-gcd.max-0.5)|!talent.vengeance.enabled
actions.prot_aoe+=/demoralizing_shout,if=talent.booming_voice.enabled&buff.battle_cry.up
actions.prot_aoe+=/ravager,if=talent.ravager.enabled&buff.battle_cry.up
actions.prot_aoe+=/neltharions_fury,if=buff.battle_cry.up
actions.prot_aoe+=/shield_slam,if=!(cooldown.shield_block.remains<=gcd.max*2&!buff.shield_block.up&talent.heavy_repercussions.enabled)
actions.prot_aoe+=/revenge
actions.prot_aoe+=/thunder_clap,if=spell_targets.thunder_clap>=3
actions.prot_aoe+=/devastate
]]

-- keywords: legion-dev::warrior::protection
---- battle_cry.spell_remains
---- booming_voice.talent_enabled
---- gcd.max
---- health.max
---- heavy_repercussions.talent_enabled
---- incoming_damage_over_2500
---- neltharions_fury.spell_remains
---- potion.spell_remains
---- rage.curr
---- ravager.talent_enabled
---- shield_block.cooldown_remains
---- shield_block.spell_remains
---- shield_slam.cooldown_remains
---- shield_wall.cooldown_remains
---- spell_targets
---- target.time_to_die
---- ultimatum.spell_remains
---- ultimatum.talent_enabled
---- vengeance.talent_enabled
---- vengeance_focused_rage.spell_remains
---- vengeance_ignore_pain.spell_remains

internal.actions['legion-dev::warrior::protection'] = {
    default = {
        {
            action = 'call_action_list',
            name = 'prot',
            simc_line = 'actions+=/call_action_list,name=prot',
        },
    },
    precombat = {
        {
            action = 'flask',
            simc_line = 'actions.precombat=flask,type=countless_armies',
            type = 'countless_armies',
        },
        {
            action = 'food',
            simc_line = 'actions.precombat+=/food,type=seedbattered_fish_plate',
            type = 'seedbattered_fish_plate',
        },
        {
            action = 'augmentation',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'potion',
            name = 'unbending_potion',
            simc_line = 'actions.precombat+=/potion,name=unbending_potion',
        },
    },
    prot = {
        {
            action = 'shield_block',
            condition = '!buff.neltharions_fury.up&((cooldown.shield_slam.remains<6&!buff.shield_block.up)|(cooldown.shield_slam.remains<6+buff.shield_block.remains&buff.shield_block.up))',
            condition_converted = '(((not ((neltharions_fury.spell_remains_as_number > 0)))) and (((((((((shield_slam.cooldown_remains_as_number) < (6))) and ((not ((shield_block.spell_remains_as_number > 0))))))) or ((((((shield_slam.cooldown_remains_as_number) < ((6 + shield_block.spell_remains_as_number)))) and ((shield_block.spell_remains_as_number > 0)))))))))',
            condition_keywords = {
                'neltharions_fury.spell_remains',
                'shield_block.spell_remains',
                'shield_slam.cooldown_remains',
            },
            simc_line = 'actions.prot=shield_block,if=!buff.neltharions_fury.up&((cooldown.shield_slam.remains<6&!buff.shield_block.up)|(cooldown.shield_slam.remains<6+buff.shield_block.remains&buff.shield_block.up))',
        },
        {
            action = 'ignore_pain',
            condition = '(rage>=60&!talent.vengeance.enabled)|(buff.vengeance_ignore_pain.up&buff.ultimatum.up)|(buff.vengeance_ignore_pain.up&rage>=39)|(talent.vengeance.enabled&!buff.ultimatum.up&!buff.vengeance_ignore_pain.up&!buff.vengeance_focused_rage.up&rage<30)',
            condition_converted = '(((((((rage.curr_as_number) >= (60))) and ((not vengeance.talent_enabled))))) or (((((((vengeance_ignore_pain.spell_remains_as_number > 0)) and ((ultimatum.spell_remains_as_number > 0))))) or (((((((vengeance_ignore_pain.spell_remains_as_number > 0)) and (((rage.curr_as_number) >= (39)))))) or ((((vengeance.talent_enabled) and ((((not ((ultimatum.spell_remains_as_number > 0)))) and ((((not ((vengeance_ignore_pain.spell_remains_as_number > 0)))) and ((((not ((vengeance_focused_rage.spell_remains_as_number > 0)))) and (((rage.curr_as_number) < (30)))))))))))))))))',
            condition_keywords = {
                'rage.curr',
                'ultimatum.spell_remains',
                'vengeance.talent_enabled',
                'vengeance_focused_rage.spell_remains',
                'vengeance_ignore_pain.spell_remains',
            },
            simc_line = 'actions.prot+=/ignore_pain,if=(rage>=60&!talent.vengeance.enabled)|(buff.vengeance_ignore_pain.up&buff.ultimatum.up)|(buff.vengeance_ignore_pain.up&rage>=39)|(talent.vengeance.enabled&!buff.ultimatum.up&!buff.vengeance_ignore_pain.up&!buff.vengeance_focused_rage.up&rage<30)',
        },
        {
            action = 'focused_rage',
            condition = '(buff.vengeance_focused_rage.up&!buff.vengeance_ignore_pain.up)|(buff.ultimatum.up&buff.vengeance_focused_rage.up&!buff.vengeance_ignore_pain.up)|(talent.vengeance.enabled&buff.ultimatum.up&!buff.vengeance_ignore_pain.up&!buff.vengeance_focused_rage.up)|(talent.vengeance.enabled&!buff.vengeance_ignore_pain.up&!buff.vengeance_focused_rage.up&rage>=30)|(buff.ultimatum.up&buff.vengeance_ignore_pain.up&cooldown.shield_slam.remains=0&rage<10)|(rage>=100)',
            condition_converted = '((((((vengeance_focused_rage.spell_remains_as_number > 0)) and ((not ((vengeance_ignore_pain.spell_remains_as_number > 0))))))) or (((((((ultimatum.spell_remains_as_number > 0)) and ((((vengeance_focused_rage.spell_remains_as_number > 0)) and ((not ((vengeance_ignore_pain.spell_remains_as_number > 0))))))))) or ((((((vengeance.talent_enabled) and ((((ultimatum.spell_remains_as_number > 0)) and ((((not ((vengeance_ignore_pain.spell_remains_as_number > 0)))) and ((not ((vengeance_focused_rage.spell_remains_as_number > 0))))))))))) or ((((((vengeance.talent_enabled) and ((((not ((vengeance_ignore_pain.spell_remains_as_number > 0)))) and ((((not ((vengeance_focused_rage.spell_remains_as_number > 0)))) and (((rage.curr_as_number) >= (30)))))))))) or (((((((ultimatum.spell_remains_as_number > 0)) and ((((vengeance_ignore_pain.spell_remains_as_number > 0)) and (((((shield_slam.cooldown_remains) == (0))) and (((rage.curr_as_number) < (10)))))))))) or ((((rage.curr_as_number) >= (100)))))))))))))',
            condition_keywords = {
                'rage.curr',
                'shield_slam.cooldown_remains',
                'ultimatum.spell_remains',
                'vengeance.talent_enabled',
                'vengeance_focused_rage.spell_remains',
                'vengeance_ignore_pain.spell_remains',
            },
            simc_line = 'actions.prot+=/focused_rage,if=(buff.vengeance_focused_rage.up&!buff.vengeance_ignore_pain.up)|(buff.ultimatum.up&buff.vengeance_focused_rage.up&!buff.vengeance_ignore_pain.up)|(talent.vengeance.enabled&buff.ultimatum.up&!buff.vengeance_ignore_pain.up&!buff.vengeance_focused_rage.up)|(talent.vengeance.enabled&!buff.vengeance_ignore_pain.up&!buff.vengeance_focused_rage.up&rage>=30)|(buff.ultimatum.up&buff.vengeance_ignore_pain.up&cooldown.shield_slam.remains=0&rage<10)|(rage>=100)',
        },
        {
            action = 'demoralizing_shout',
            condition = 'incoming_damage_2500ms>health.max*0.20',
            condition_converted = '((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.20)))',
            condition_keywords = {
                'health.max',
                'incoming_damage_over_2500',
            },
            simc_line = 'actions.prot+=/demoralizing_shout,if=incoming_damage_2500ms>health.max*0.20',
        },
        {
            action = 'shield_wall',
            condition = 'incoming_damage_2500ms>health.max*0.50',
            condition_converted = '((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.50)))',
            condition_keywords = {
                'health.max',
                'incoming_damage_over_2500',
            },
            simc_line = 'actions.prot+=/shield_wall,if=incoming_damage_2500ms>health.max*0.50',
        },
        {
            action = 'last_stand',
            condition = 'incoming_damage_2500ms>health.max*0.50&!cooldown.shield_wall.remains=0',
            condition_converted = '((((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.50)))) and ((((shield_wall.cooldown_remains == 0)) == (0))))',
            condition_keywords = {
                'health.max',
                'incoming_damage_over_2500',
                'shield_wall.cooldown_remains',
            },
            simc_line = 'actions.prot+=/last_stand,if=incoming_damage_2500ms>health.max*0.50&!cooldown.shield_wall.remains=0',
        },
        {
            action = 'potion',
            condition = '(incoming_damage_2500ms>health.max*0.15&!buff.potion.up)|target.time_to_die<=25',
            condition_converted = '(((((((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.15)))) and ((not ((potion.spell_remains_as_number > 0))))))) or (((target.time_to_die_as_number) <= (25))))',
            condition_keywords = {
                'health.max',
                'incoming_damage_over_2500',
                'potion.spell_remains',
                'target.time_to_die',
            },
            name = 'unbending_potion',
            simc_line = 'actions.prot+=/potion,name=unbending_potion,if=(incoming_damage_2500ms>health.max*0.15&!buff.potion.up)|target.time_to_die<=25',
        },
        {
            action = 'call_action_list',
            condition = 'spell_targets.neltharions_fury>=2',
            condition_converted = '((spell_targets_as_number) >= (2))',
            condition_keywords = {
                'spell_targets',
            },
            name = 'prot_aoe',
            simc_line = 'actions.prot+=/call_action_list,name=prot_aoe,if=spell_targets.neltharions_fury>=2',
        },
        {
            action = 'focused_rage',
            condition = 'talent.ultimatum.enabled&buff.ultimatum.up&!talent.vengeance.enabled',
            condition_converted = '((ultimatum.talent_enabled) and ((((ultimatum.spell_remains_as_number > 0)) and ((not vengeance.talent_enabled)))))',
            condition_keywords = {
                'ultimatum.spell_remains',
                'ultimatum.talent_enabled',
                'vengeance.talent_enabled',
            },
            simc_line = 'actions.prot+=/focused_rage,if=talent.ultimatum.enabled&buff.ultimatum.up&!talent.vengeance.enabled',
        },
        {
            action = 'battle_cry',
            condition = '(talent.vengeance.enabled&talent.ultimatum.enabled&cooldown.shield_slam.remains<=5-gcd.max-0.5)|!talent.vengeance.enabled',
            condition_converted = '(((((vengeance.talent_enabled) and (((ultimatum.talent_enabled) and (((shield_slam.cooldown_remains_as_number) <= ((5 - gcd.max_as_number - 0.5))))))))) or ((not vengeance.talent_enabled)))',
            condition_keywords = {
                'gcd.max',
                'shield_slam.cooldown_remains',
                'ultimatum.talent_enabled',
                'vengeance.talent_enabled',
            },
            simc_line = 'actions.prot+=/battle_cry,if=(talent.vengeance.enabled&talent.ultimatum.enabled&cooldown.shield_slam.remains<=5-gcd.max-0.5)|!talent.vengeance.enabled',
        },
        {
            action = 'demoralizing_shout',
            condition = 'talent.booming_voice.enabled&buff.battle_cry.up',
            condition_converted = '((booming_voice.talent_enabled) and ((battle_cry.spell_remains_as_number > 0)))',
            condition_keywords = {
                'battle_cry.spell_remains',
                'booming_voice.talent_enabled',
            },
            simc_line = 'actions.prot+=/demoralizing_shout,if=talent.booming_voice.enabled&buff.battle_cry.up',
        },
        {
            action = 'ravager',
            condition = 'talent.ravager.enabled&buff.battle_cry.up',
            condition_converted = '((ravager.talent_enabled) and ((battle_cry.spell_remains_as_number > 0)))',
            condition_keywords = {
                'battle_cry.spell_remains',
                'ravager.talent_enabled',
            },
            simc_line = 'actions.prot+=/ravager,if=talent.ravager.enabled&buff.battle_cry.up',
        },
        {
            action = 'neltharions_fury',
            condition = 'incoming_damage_2500ms>health.max*0.20&!buff.shield_block.up',
            condition_converted = '((((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.20)))) and ((not ((shield_block.spell_remains_as_number > 0)))))',
            condition_keywords = {
                'health.max',
                'incoming_damage_over_2500',
                'shield_block.spell_remains',
            },
            simc_line = 'actions.prot+=/neltharions_fury,if=incoming_damage_2500ms>health.max*0.20&!buff.shield_block.up',
        },
        {
            action = 'shield_slam',
            condition = '!(cooldown.shield_block.remains<=gcd.max*2&!buff.shield_block.up&talent.heavy_repercussions.enabled)',
            condition_converted = '(not ((((((shield_block.cooldown_remains_as_number) <= ((gcd.max_as_number * 2)))) and ((((not ((shield_block.spell_remains_as_number > 0)))) and (heavy_repercussions.talent_enabled)))))))',
            condition_keywords = {
                'gcd.max',
                'heavy_repercussions.talent_enabled',
                'shield_block.cooldown_remains',
                'shield_block.spell_remains',
            },
            simc_line = 'actions.prot+=/shield_slam,if=!(cooldown.shield_block.remains<=gcd.max*2&!buff.shield_block.up&talent.heavy_repercussions.enabled)',
        },
        {
            action = 'revenge',
            condition = 'cooldown.shield_slam.remains<=gcd.max*2',
            condition_converted = '((shield_slam.cooldown_remains_as_number) <= ((gcd.max_as_number * 2)))',
            condition_keywords = {
                'gcd.max',
                'shield_slam.cooldown_remains',
            },
            simc_line = 'actions.prot+=/revenge,if=cooldown.shield_slam.remains<=gcd.max*2',
        },
    },
}


