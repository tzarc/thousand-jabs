local _, internal = ...
internal.actions = internal.actions or {}

-- keywords: legion-dev::hunter::beast_mastery
---- active_enemies
---- beast_cleave.aura_down
---- beast_cleave.aura_remains
---- bestial_wrath.aura_up
---- bestial_wrath.cooldown_remains
---- bloodlust.aura_up
---- dire_beast.cooldown_remains
---- dire_beast.pet_active
---- focus.curr
---- focus.deficit
---- gcd.max
---- kill_command.cooldown_remains
---- killer_cobra.talent_selected
---- spell_targets
---- target.time_to_die

internal.actions['legion-dev::hunter::beast_mastery'] = {
    default = {
        {
            action = 'auto_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions=auto_shot',
        },
        {
            action = 'arcane_torrent',
            condition = 'focus.deficit>=30',
            condition_converted = '((focus.deficit_as_number) >= (30))',
            condition_keywords = {
                'focus.deficit',
            },
            simc_line = 'actions+=/arcane_torrent,if=focus.deficit>=30',
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
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'deadly_grace',
            simc_line = 'actions+=/potion,name=deadly_grace',
        },
        {
            action = 'a_murder_of_crows',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/a_murder_of_crows',
        },
        {
            action = 'stampede',
            condition = 'buff.bloodlust.up|buff.bestial_wrath.up|cooldown.bestial_wrath.remains<=2|target.time_to_die<=14',
            condition_converted = '((bloodlust.aura_up) or (((bestial_wrath.aura_up) or (((((bestial_wrath.cooldown_remains_as_number) <= (2))) or (((target.time_to_die_as_number) <= (14))))))))',
            condition_keywords = {
                'bestial_wrath.aura_up',
                'bestial_wrath.cooldown_remains',
                'bloodlust.aura_up',
                'target.time_to_die',
            },
            simc_line = 'actions+=/stampede,if=buff.bloodlust.up|buff.bestial_wrath.up|cooldown.bestial_wrath.remains<=2|target.time_to_die<=14',
        },
        {
            action = 'dire_beast',
            condition = 'cooldown.bestial_wrath.remains>2',
            condition_converted = '((bestial_wrath.cooldown_remains_as_number) > (2))',
            condition_keywords = {
                'bestial_wrath.cooldown_remains',
            },
            simc_line = 'actions+=/dire_beast,if=cooldown.bestial_wrath.remains>2',
        },
        {
            action = 'dire_frenzy',
            condition = 'cooldown.bestial_wrath.remains>2',
            condition_converted = '((bestial_wrath.cooldown_remains_as_number) > (2))',
            condition_keywords = {
                'bestial_wrath.cooldown_remains',
            },
            simc_line = 'actions+=/dire_frenzy,if=cooldown.bestial_wrath.remains>2',
        },
        {
            action = 'aspect_of_the_wild',
            condition = 'buff.bestial_wrath.up',
            condition_converted = 'bestial_wrath.aura_up',
            condition_keywords = {
                'bestial_wrath.aura_up',
            },
            simc_line = 'actions+=/aspect_of_the_wild,if=buff.bestial_wrath.up',
        },
        {
            action = 'barrage',
            condition = 'spell_targets.barrage>1|(spell_targets.barrage=1&focus>90)',
            condition_converted = '((((spell_targets_as_number) > (1))) or ((((((spell_targets) == (1))) and (((focus.curr_as_number) > (90)))))))',
            condition_keywords = {
                'focus.curr',
                'spell_targets',
            },
            simc_line = 'actions+=/barrage,if=spell_targets.barrage>1|(spell_targets.barrage=1&focus>90)',
        },
        {
            action = 'titans_thunder',
            condition = 'cooldown.dire_beast.remains>=3|buff.bestial_wrath.up&pet.dire_beast.active',
            condition_converted = '((((dire_beast.cooldown_remains_as_number) >= (3))) or (((bestial_wrath.aura_up) and (dire_beast.pet_active))))',
            condition_keywords = {
                'bestial_wrath.aura_up',
                'dire_beast.cooldown_remains',
                'dire_beast.pet_active',
            },
            simc_line = 'actions+=/titans_thunder,if=cooldown.dire_beast.remains>=3|buff.bestial_wrath.up&pet.dire_beast.active',
        },
        {
            action = 'bestial_wrath',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/bestial_wrath',
        },
        {
            action = 'multi_shot',
            condition = 'spell_targets.multi_shot>4&(pet.buff.beast_cleave.remains<gcd.max|pet.buff.beast_cleave.down)',
            condition_converted = '((((spell_targets_as_number) > (4))) and ((((((beast_cleave.aura_remains_as_number) < (gcd.max_as_number))) or (beast_cleave.aura_down)))))',
            condition_keywords = {
                'beast_cleave.aura_down',
                'beast_cleave.aura_remains',
                'gcd.max',
                'spell_targets',
            },
            simc_line = 'actions+=/multi_shot,if=spell_targets.multi_shot>4&(pet.buff.beast_cleave.remains<gcd.max|pet.buff.beast_cleave.down)',
        },
        {
            action = 'kill_command',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/kill_command',
        },
        {
            action = 'multi_shot',
            condition = 'spell_targets.multi_shot>1&(pet.buff.beast_cleave.remains<gcd.max*2|pet.buff.beast_cleave.down)',
            condition_converted = '((((spell_targets_as_number) > (1))) and ((((((beast_cleave.aura_remains_as_number) < ((gcd.max_as_number * 2)))) or (beast_cleave.aura_down)))))',
            condition_keywords = {
                'beast_cleave.aura_down',
                'beast_cleave.aura_remains',
                'gcd.max',
                'spell_targets',
            },
            simc_line = 'actions+=/multi_shot,if=spell_targets.multi_shot>1&(pet.buff.beast_cleave.remains<gcd.max*2|pet.buff.beast_cleave.down)',
        },
        {
            action = 'chimaera_shot',
            condition = 'focus<90',
            condition_converted = '((focus.curr_as_number) < (90))',
            condition_keywords = {
                'focus.curr',
            },
            simc_line = 'actions+=/chimaera_shot,if=focus<90',
        },
        {
            action = 'cobra_shot',
            condition = 'talent.killer_cobra.enabled&(cooldown.bestial_wrath.remains>=4&(buff.bestial_wrath.up&cooldown.kill_command.remains>=2)|focus>119)|!talent.killer_cobra.enabled&focus>90',
            condition_converted = '((((killer_cobra.talent_selected) and ((((((((bestial_wrath.cooldown_remains_as_number) >= (4))) and ((((bestial_wrath.aura_up) and (((kill_command.cooldown_remains_as_number) >= (2)))))))) or (((focus.curr_as_number) > (119)))))))) or ((((not (killer_cobra.talent_selected))) and (((focus.curr_as_number) > (90))))))',
            condition_keywords = {
                'bestial_wrath.aura_up',
                'bestial_wrath.cooldown_remains',
                'focus.curr',
                'kill_command.cooldown_remains',
                'killer_cobra.talent_selected',
            },
            simc_line = 'actions+=/cobra_shot,if=talent.killer_cobra.enabled&(cooldown.bestial_wrath.remains>=4&(buff.bestial_wrath.up&cooldown.kill_command.remains>=2)|focus>119)|!talent.killer_cobra.enabled&focus>90',
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
            simc_line = 'actions.precombat+=/food,type=fishbrul_special',
            type = 'fishbrul_special',
        },
        {
            action = 'summon_pet',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/summon_pet',
        },
        {
            action = 'snapshot_stats',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/snapshot_stats',
        },
        {
            action = 'potion',
            condition = 'active_enemies>2',
            condition_converted = '((active_enemies_as_number) > (2))',
            condition_keywords = {
                'active_enemies',
            },
            name = 'prolonged_power',
            simc_line = 'actions.precombat+=/potion,name=prolonged_power,if=active_enemies>2',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'deadly_grace',
            simc_line = 'actions.precombat+=/potion,name=deadly_grace',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
    },
}


-- keywords: legion-dev::hunter::marksmanship
---- a_murder_of_crows.cooldown_remains
---- a_murder_of_crows.spell_duration
---- active_enemies
---- bloodlust.aura_up
---- bullseye.aura_stack
---- bullseye.aura_up
---- call_action_list.cooldown_remains
---- call_action_list.spell_duration
---- execute_time
---- focus.curr
---- focus.deficit
---- focus.regen
---- health.target_percent
---- hunters_mark.aura_down
---- hunters_mark.aura_remains
---- lock_and_load.aura_up
---- marking_targets.aura_down
---- marking_targets.aura_up
---- patient_sniper.talent_selected
---- sidewinders.cooldown_charges
---- sidewinders.spell_charges_fractional
---- sidewinders.talent_selected
---- spell_targets
---- target.time_to_20pct
---- target.time_to_die
---- time_since_combat_start
---- trick_shot.talent_selected
---- trueshot.aura_down
---- trueshot.aura_remains
---- trueshot.aura_up
---- trueshot.cooldown_remains
---- trueshot.spell_duration
---- volley.talent_selected
---- vulnerability.aura_remains

internal.actions['legion-dev::hunter::marksmanship'] = {
    cooldowns = {
        {
            action = 'potion',
            condition = 'spell_targets.multishot>2&((buff.trueshot.react&buff.bloodlust.react)|buff.bullseye.react>=23|target.time_to_die<62)',
            condition_converted = '((((spell_targets_as_number) > (2))) and (((((((trueshot.aura_up) and (bloodlust.aura_up)))) or (((((bullseye.aura_up_as_number) >= (23))) or (((target.time_to_die_as_number) < (62)))))))))',
            condition_keywords = {
                'bloodlust.aura_up',
                'bullseye.aura_up',
                'spell_targets',
                'target.time_to_die',
                'trueshot.aura_up',
            },
            name = 'prolonged_power',
            simc_line = 'actions.cooldowns=potion,name=prolonged_power,if=spell_targets.multishot>2&((buff.trueshot.react&buff.bloodlust.react)|buff.bullseye.react>=23|target.time_to_die<62)',
        },
        {
            action = 'potion',
            condition = '(buff.trueshot.react&buff.bloodlust.react)|buff.bullseye.react>=23|target.time_to_die<31',
            condition_converted = '(((((trueshot.aura_up) and (bloodlust.aura_up)))) or (((((bullseye.aura_up_as_number) >= (23))) or (((target.time_to_die_as_number) < (31))))))',
            condition_keywords = {
                'bloodlust.aura_up',
                'bullseye.aura_up',
                'target.time_to_die',
                'trueshot.aura_up',
            },
            name = 'deadly_grace',
            simc_line = 'actions.cooldowns+=/potion,name=deadly_grace,if=(buff.trueshot.react&buff.bloodlust.react)|buff.bullseye.react>=23|target.time_to_die<31',
        },
        {
            action = 'trueshot',
            condition = 'time<5|buff.bloodlust.react|target.time_to_die>=(cooldown+duration)|buff.bullseye.react>25|target.time_to_die<16',
            condition_converted = '((((time_since_combat_start_as_number) < (5))) or (((bloodlust.aura_up) or (((((target.time_to_die_as_number) >= ((trueshot.cooldown_remains_as_number + trueshot.spell_duration_as_number)))) or (((((bullseye.aura_up_as_number) > (25))) or (((target.time_to_die_as_number) < (16))))))))))',
            condition_keywords = {
                'bloodlust.aura_up',
                'bullseye.aura_up',
                'target.time_to_die',
                'time_since_combat_start',
                'trueshot.cooldown_remains',
                'trueshot.spell_duration',
            },
            simc_line = 'actions.cooldowns+=/trueshot,if=time<5|buff.bloodlust.react|target.time_to_die>=(cooldown+duration)|buff.bullseye.react>25|target.time_to_die<16',
        },
    },
    default = {
        {
            action = 'auto_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions=auto_shot',
        },
        {
            action = 'arcane_torrent',
            condition = 'focus.deficit>=30&(!talent.sidewinders.enabled|cooldown.sidewinders.charges<2)',
            condition_converted = '((((focus.deficit_as_number) >= (30))) and (((((not (sidewinders.talent_selected))) or (((sidewinders.cooldown_charges_as_number) < (2)))))))',
            condition_keywords = {
                'focus.deficit',
                'sidewinders.cooldown_charges',
                'sidewinders.talent_selected',
            },
            simc_line = 'actions+=/arcane_torrent,if=focus.deficit>=30&(!talent.sidewinders.enabled|cooldown.sidewinders.charges<2)',
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
            action = 'auto_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/auto_shot',
        },
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'safe_to_build',
            simc_line = 'actions+=/variable,name=safe_to_build,value=debuff.hunters_mark.down|(buff.trueshot.down&buff.marking_targets.down)',
            value = 'debuff.hunters_mark.down|(buff.trueshot.down&buff.marking_targets.down)',
            value_converted = '((hunters_mark.aura_down) or ((((trueshot.aura_down) and (marking_targets.aura_down)))))',
            value_keywords = {
                'hunters_mark.aura_down',
                'marking_targets.aura_down',
                'trueshot.aura_down',
            },
        },
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'use_multishot',
            simc_line = 'actions+=/variable,name=use_multishot,value=((buff.marking_targets.up|buff.trueshot.up)&spell_targets.multishot>1)|(buff.marking_targets.down&buff.trueshot.down&spell_targets.multishot>2)',
            value = '((buff.marking_targets.up|buff.trueshot.up)&spell_targets.multishot>1)|(buff.marking_targets.down&buff.trueshot.down&spell_targets.multishot>2)',
            value_converted = '((((((((marking_targets.aura_up) or (trueshot.aura_up)))) and (((spell_targets_as_number) > (1)))))) or ((((marking_targets.aura_down) and (((trueshot.aura_down) and (((spell_targets_as_number) > (2)))))))))',
            value_keywords = {
                'marking_targets.aura_down',
                'marking_targets.aura_up',
                'spell_targets',
                'trueshot.aura_down',
                'trueshot.aura_up',
            },
        },
        {
            action = 'call_action_list',
            condition = 'active_enemies=1&time<=15',
            condition_converted = '((((active_enemies) == (1))) and (((time_since_combat_start_as_number) <= (15))))',
            condition_keywords = {
                'active_enemies',
                'time_since_combat_start',
            },
            name = 'open',
            simc_line = 'actions+=/call_action_list,name=open,if=active_enemies=1&time<=15',
        },
        {
            action = 'a_murder_of_crows',
            condition = '(target.time_to_die>=cooldown+duration|target.health.pct<20)&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=60&focus+(focus.regen*debuff.hunters_mark.remains)>=60))',
            condition_converted = '(((((((target.time_to_die_as_number) >= ((a_murder_of_crows.cooldown_remains_as_number + a_murder_of_crows.spell_duration_as_number)))) or (((health.target_percent_as_number) < (20)))))) and ((((hunters_mark.aura_down) or ((((((hunters_mark.aura_remains_as_number) > (execute_time_as_number))) and (((((vulnerability.aura_remains_as_number) > (execute_time_as_number))) and ((((((focus.curr_as_number + (focus.regen_as_number * vulnerability.aura_remains_as_number))) >= (60))) and ((((focus.curr_as_number + (focus.regen_as_number * hunters_mark.aura_remains_as_number))) >= (60))))))))))))))',
            condition_keywords = {
                'a_murder_of_crows.cooldown_remains',
                'a_murder_of_crows.spell_duration',
                'execute_time',
                'focus.curr',
                'focus.regen',
                'health.target_percent',
                'hunters_mark.aura_down',
                'hunters_mark.aura_remains',
                'target.time_to_die',
                'vulnerability.aura_remains',
            },
            simc_line = 'actions+=/a_murder_of_crows,if=(target.time_to_die>=cooldown+duration|target.health.pct<20)&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=60&focus+(focus.regen*debuff.hunters_mark.remains)>=60))',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'cooldowns',
            simc_line = 'actions+=/call_action_list,name=cooldowns',
        },
        {
            action = 'call_action_list',
            condition = '(target.time_to_die>=cooldown+duration|target.health.pct<20)&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=60&focus+(focus.regen*debuff.hunters_mark.remains)>=60))',
            condition_converted = '(((((((target.time_to_die_as_number) >= ((call_action_list.cooldown_remains_as_number + call_action_list.spell_duration_as_number)))) or (((health.target_percent_as_number) < (20)))))) and ((((hunters_mark.aura_down) or ((((((hunters_mark.aura_remains_as_number) > (execute_time_as_number))) and (((((vulnerability.aura_remains_as_number) > (execute_time_as_number))) and ((((((focus.curr_as_number + (focus.regen_as_number * vulnerability.aura_remains_as_number))) >= (60))) and ((((focus.curr_as_number + (focus.regen_as_number * hunters_mark.aura_remains_as_number))) >= (60))))))))))))))',
            condition_keywords = {
                'call_action_list.cooldown_remains',
                'call_action_list.spell_duration',
                'execute_time',
                'focus.curr',
                'focus.regen',
                'health.target_percent',
                'hunters_mark.aura_down',
                'hunters_mark.aura_remains',
                'target.time_to_die',
                'vulnerability.aura_remains',
            },
            name = 'trueshotaoe',
            simc_line = 'actions+=/call_action_list,name=trueshotaoe,if=(target.time_to_die>=cooldown+duration|target.health.pct<20)&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=60&focus+(focus.regen*debuff.hunters_mark.remains)>=60))',
        },
        {
            action = 'black_arrow',
            condition = 'debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=70&focus+(focus.regen*debuff.hunters_mark.remains)>=70)',
            condition_converted = '((hunters_mark.aura_down) or ((((((hunters_mark.aura_remains_as_number) > (execute_time_as_number))) and (((((vulnerability.aura_remains_as_number) > (execute_time_as_number))) and ((((((focus.curr_as_number + (focus.regen_as_number * vulnerability.aura_remains_as_number))) >= (70))) and ((((focus.curr_as_number + (focus.regen_as_number * hunters_mark.aura_remains_as_number))) >= (70)))))))))))',
            condition_keywords = {
                'execute_time',
                'focus.curr',
                'focus.regen',
                'hunters_mark.aura_down',
                'hunters_mark.aura_remains',
                'vulnerability.aura_remains',
            },
            simc_line = 'actions+=/black_arrow,if=debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=70&focus+(focus.regen*debuff.hunters_mark.remains)>=70)',
        },
        {
            action = 'barrage',
            condition = '(target.time_to_20pct>10|target.health.pct<=20|spell_targets>1)&((buff.trueshot.down|(target.health.pct<=20&buff.bullseye.stack<29)|spell_targets>1)&debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=90&focus+(focus.regen*debuff.hunters_mark.remains)>=90))',
            condition_converted = '(((((((target.time_to_20pct_as_number) > (10))) or (((((health.target_percent_as_number) <= (20))) or (((spell_targets_as_number) > (1)))))))) and (((((((((trueshot.aura_down) or ((((((((health.target_percent_as_number) <= (20))) and (((bullseye.aura_stack_as_number) < (29)))))) or (((spell_targets_as_number) > (1)))))))) and (hunters_mark.aura_down))) or ((((((hunters_mark.aura_remains_as_number) > (execute_time_as_number))) and (((((vulnerability.aura_remains_as_number) > (execute_time_as_number))) and ((((((focus.curr_as_number + (focus.regen_as_number * vulnerability.aura_remains_as_number))) >= (90))) and ((((focus.curr_as_number + (focus.regen_as_number * hunters_mark.aura_remains_as_number))) >= (90))))))))))))))',
            condition_keywords = {
                'bullseye.aura_stack',
                'execute_time',
                'focus.curr',
                'focus.regen',
                'health.target_percent',
                'hunters_mark.aura_down',
                'hunters_mark.aura_remains',
                'spell_targets',
                'target.time_to_20pct',
                'trueshot.aura_down',
                'vulnerability.aura_remains',
            },
            simc_line = 'actions+=/barrage,if=(target.time_to_20pct>10|target.health.pct<=20|spell_targets>1)&((buff.trueshot.down|(target.health.pct<=20&buff.bullseye.stack<29)|spell_targets>1)&debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=90&focus+(focus.regen*debuff.hunters_mark.remains)>=90))',
        },
        {
            action = 'call_action_list',
            condition = 'target.time_to_die<6&active_enemies=1',
            condition_converted = '((((target.time_to_die_as_number) < (6))) and (((active_enemies) == (1))))',
            condition_keywords = {
                'active_enemies',
                'target.time_to_die',
            },
            name = 'targetdie',
            simc_line = 'actions+=/call_action_list,name=targetdie,if=target.time_to_die<6&active_enemies=1',
        },
        {
            action = 'call_action_list',
            condition = 'talent.patient_sniper.enabled',
            condition_converted = 'patient_sniper.talent_selected',
            condition_keywords = {
                'patient_sniper.talent_selected',
            },
            name = 'patient_sniper',
            simc_line = 'actions+=/call_action_list,name=patient_sniper,if=talent.patient_sniper.enabled',
        },
        {
            action = 'call_action_list',
            condition = '!talent.patient_sniper.enabled',
            condition_converted = '(not (patient_sniper.talent_selected))',
            condition_keywords = {
                'patient_sniper.talent_selected',
            },
            name = 'non_patient_sniper',
            simc_line = 'actions+=/call_action_list,name=non_patient_sniper,if=!talent.patient_sniper.enabled',
        },
    },
    open = {
        {
            action = 'a_murder_of_crows',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.open=a_murder_of_crows',
        },
        {
            action = 'trueshot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.open+=/trueshot',
        },
        {
            action = 'piercing_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.open+=/piercing_shot',
        },
        {
            action = 'explosive_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.open+=/explosive_shot',
        },
        {
            action = 'barrage',
            condition = '!talent.patient_sniper.enabled',
            condition_converted = '(not (patient_sniper.talent_selected))',
            condition_keywords = {
                'patient_sniper.talent_selected',
            },
            simc_line = 'actions.open+=/barrage,if=!talent.patient_sniper.enabled',
        },
        {
            action = 'arcane_shot',
            condition = 'true',
            condition_converted = 'true',
            line_cd = '16&!talent.patient_sniper.enabled',
            simc_line = 'actions.open+=/arcane_shot,line_cd=16&!talent.patient_sniper.enabled',
        },
        {
            action = 'sidewinders',
            condition = '(buff.marking_targets.down&buff.trueshot.remains<2)|(charges_fractional>=1.9&focus<80)',
            condition_converted = '(((((marking_targets.aura_down) and (((trueshot.aura_remains_as_number) < (2)))))) or ((((((sidewinders.spell_charges_fractional_as_number) >= (1.9))) and (((focus.curr_as_number) < (80)))))))',
            condition_keywords = {
                'focus.curr',
                'marking_targets.aura_down',
                'sidewinders.spell_charges_fractional',
                'trueshot.aura_remains',
            },
            simc_line = 'actions.open+=/sidewinders,if=(buff.marking_targets.down&buff.trueshot.remains<2)|(charges_fractional>=1.9&focus<80)',
        },
        {
            action = 'marked_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.open+=/marked_shot',
        },
        {
            action = 'barrage',
            condition = 'buff.bloodlust.up',
            condition_converted = 'bloodlust.aura_up',
            condition_keywords = {
                'bloodlust.aura_up',
            },
            simc_line = 'actions.open+=/barrage,if=buff.bloodlust.up',
        },
        {
            action = 'aimed_shot',
            condition = '(buff.lock_and_load.up&execute_time<debuff.vulnerability.remains)|focus>90&!talent.patient_sniper.enabled&talent.trick_shot.enabled',
            condition_converted = '(((((lock_and_load.aura_up) and (((execute_time_as_number) < (vulnerability.aura_remains_as_number)))))) or (((((focus.curr_as_number) > (90))) and ((((not (patient_sniper.talent_selected))) and (trick_shot.talent_selected))))))',
            condition_keywords = {
                'execute_time',
                'focus.curr',
                'lock_and_load.aura_up',
                'patient_sniper.talent_selected',
                'trick_shot.talent_selected',
                'vulnerability.aura_remains',
            },
            simc_line = 'actions.open+=/aimed_shot,if=(buff.lock_and_load.up&execute_time<debuff.vulnerability.remains)|focus>90&!talent.patient_sniper.enabled&talent.trick_shot.enabled',
        },
        {
            action = 'aimed_shot',
            condition = 'buff.lock_and_load.up&execute_time<debuff.vulnerability.remains',
            condition_converted = '((lock_and_load.aura_up) and (((execute_time_as_number) < (vulnerability.aura_remains_as_number))))',
            condition_keywords = {
                'execute_time',
                'lock_and_load.aura_up',
                'vulnerability.aura_remains',
            },
            simc_line = 'actions.open+=/aimed_shot,if=buff.lock_and_load.up&execute_time<debuff.vulnerability.remains',
        },
        {
            action = 'black_arrow',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.open+=/black_arrow',
        },
        {
            action = 'barrage',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.open+=/barrage',
        },
        {
            action = 'arcane_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.open+=/arcane_shot',
        },
        {
            action = 'aimed_shot',
            condition = 'execute_time<debuff.vulnerability.remains',
            condition_converted = '((execute_time_as_number) < (vulnerability.aura_remains_as_number))',
            condition_keywords = {
                'execute_time',
                'vulnerability.aura_remains',
            },
            simc_line = 'actions.open+=/aimed_shot,if=execute_time<debuff.vulnerability.remains',
        },
        {
            action = 'sidewinders',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.open+=/sidewinders',
        },
        {
            action = 'aimed_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.open+=/aimed_shot',
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
            action = 'summon_pet',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/summon_pet',
        },
        {
            action = 'snapshot_stats',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/snapshot_stats',
        },
        {
            action = 'potion',
            condition = 'active_enemies>2',
            condition_converted = '((active_enemies_as_number) > (2))',
            condition_keywords = {
                'active_enemies',
            },
            name = 'prolonged_power',
            simc_line = 'actions.precombat+=/potion,name=prolonged_power,if=active_enemies>2',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'deadly_grace',
            simc_line = 'actions.precombat+=/potion,name=deadly_grace',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'volley',
            condition = 'talent.volley.enabled',
            condition_converted = 'volley.talent_selected',
            condition_keywords = {
                'volley.talent_selected',
            },
            simc_line = 'actions.precombat+=/volley,if=talent.volley.enabled',
        },
        {
            action = 'windburst',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/windburst',
        },
    },
    targetdie = {
        {
            action = 'marked_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.targetdie=marked_shot',
        },
        {
            action = 'windburst',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.targetdie+=/windburst',
        },
        {
            action = 'aimed_shot',
            condition = 'debuff.vulnerability.remains>execute_time&target.time_to_die>execute_time',
            condition_converted = '((((vulnerability.aura_remains_as_number) > (execute_time_as_number))) and (((target.time_to_die_as_number) > (execute_time_as_number))))',
            condition_keywords = {
                'execute_time',
                'target.time_to_die',
                'vulnerability.aura_remains',
            },
            simc_line = 'actions.targetdie+=/aimed_shot,if=debuff.vulnerability.remains>execute_time&target.time_to_die>execute_time',
        },
        {
            action = 'sidewinders',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.targetdie+=/sidewinders',
        },
        {
            action = 'aimed_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.targetdie+=/aimed_shot',
        },
        {
            action = 'arcane_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.targetdie+=/arcane_shot',
        },
    },
    trueshotaoe = {
        {
            action = 'marked_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.trueshotaoe=marked_shot',
        },
        {
            action = 'barrage',
            condition = '!talent.patient_sniper.enabled',
            condition_converted = '(not (patient_sniper.talent_selected))',
            condition_keywords = {
                'patient_sniper.talent_selected',
            },
            simc_line = 'actions.trueshotaoe+=/barrage,if=!talent.patient_sniper.enabled',
        },
        {
            action = 'piercing_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.trueshotaoe+=/piercing_shot',
        },
        {
            action = 'explosive_shot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.trueshotaoe+=/explosive_shot',
        },
        {
            action = 'aimed_shot',
            condition = '(!talent.patient_sniper.enabled|talent.trick_shot.enabled)&spell_targets.multishot=2&buff.lock_and_load.up&execute_time<debuff.vulnerability.remains',
            condition_converted = '((((((not (patient_sniper.talent_selected))) or (trick_shot.talent_selected)))) and (((((spell_targets) == (2))) and (((lock_and_load.aura_up) and (((execute_time_as_number) < (vulnerability.aura_remains_as_number))))))))',
            condition_keywords = {
                'execute_time',
                'lock_and_load.aura_up',
                'patient_sniper.talent_selected',
                'spell_targets',
                'trick_shot.talent_selected',
                'vulnerability.aura_remains',
            },
            simc_line = 'actions.trueshotaoe+=/aimed_shot,if=(!talent.patient_sniper.enabled|talent.trick_shot.enabled)&spell_targets.multishot=2&buff.lock_and_load.up&execute_time<debuff.vulnerability.remains',
        },
        {
            action = 'multishot',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.trueshotaoe+=/multishot',
        },
    },
}


-- keywords: legion-dev::hunter::survival
---- active_enemies
---- aspect_of_the_eagle.aura_remains
---- aspect_of_the_eagle.aura_up
---- execute_time
---- flanking_strike.cooldown_remains
---- focus.curr
---- focus.deficit
---- focus.regen
---- fury_of_the_eagle.cooldown_remains
---- gcd
---- gcd.max
---- lacerate.aura_remains
---- lacerate.aura_up
---- moknathal_tactics.aura_down
---- moknathal_tactics.aura_remains
---- mongoose_bite.cooldown_remains
---- mongoose_bite.spell_charges
---- mongoose_fury.aura_remains
---- mongoose_fury.aura_up
---- serpent_sting.aura_remains
---- serpent_sting.aura_up
---- serpent_sting.talent_selected
---- spell_targets
---- target.time_to_die
---- throwing_axes.talent_selected
---- way_of_the_moknathal.talent_selected

internal.actions['legion-dev::hunter::survival'] = {
    default = {
        {
            action = 'auto_attack',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions=auto_attack',
        },
        {
            action = 'arcane_torrent',
            condition = 'focus.deficit>=30',
            condition_converted = '((focus.deficit_as_number) >= (30))',
            condition_keywords = {
                'focus.deficit',
            },
            simc_line = 'actions+=/arcane_torrent,if=focus.deficit>=30',
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
            action = 'potion',
            condition = 'buff.aspect_of_the_eagle.remains',
            condition_converted = 'aspect_of_the_eagle.aura_remains',
            condition_keywords = {
                'aspect_of_the_eagle.aura_remains',
            },
            name = 'old_war',
            simc_line = 'actions+=/potion,name=old_war,if=buff.aspect_of_the_eagle.remains',
        },
        {
            action = 'steel_trap',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/steel_trap',
        },
        {
            action = 'explosive_trap',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/explosive_trap',
        },
        {
            action = 'raptor_strike',
            condition = 'talent.way_of_the_moknathal.enabled&buff.moknathal_tactics.remains&buff.moknathal_tactics.remains<gcd.max',
            condition_converted = '((way_of_the_moknathal.talent_selected) and (((moknathal_tactics.aura_remains) and (((moknathal_tactics.aura_remains_as_number) < (gcd.max_as_number))))))',
            condition_keywords = {
                'gcd.max',
                'moknathal_tactics.aura_remains',
                'way_of_the_moknathal.talent_selected',
            },
            simc_line = 'actions+=/raptor_strike,if=talent.way_of_the_moknathal.enabled&buff.moknathal_tactics.remains&buff.moknathal_tactics.remains<gcd.max',
        },
        {
            action = 'dragonsfire_grenade',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/dragonsfire_grenade',
        },
        {
            action = 'caltrops',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/caltrops',
        },
        {
            action = 'carve',
            condition = 'talent.serpent_sting.enabled&active_enemies>=3&(!dot.serpent_sting.ticking|dot.serpent_sting.remains<=gcd.max)',
            condition_converted = '((serpent_sting.talent_selected) and (((((active_enemies_as_number) >= (3))) and (((((not (serpent_sting.aura_up))) or (((serpent_sting.aura_remains_as_number) <= (gcd.max_as_number)))))))))',
            condition_keywords = {
                'active_enemies',
                'gcd.max',
                'serpent_sting.aura_remains',
                'serpent_sting.aura_up',
                'serpent_sting.talent_selected',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/carve,cycle_targets=1,if=talent.serpent_sting.enabled&active_enemies>=3&(!dot.serpent_sting.ticking|dot.serpent_sting.remains<=gcd.max)',
        },
        {
            action = 'raptor_strike',
            condition = 'talent.serpent_sting.enabled&active_enemies<=2&(!dot.serpent_sting.ticking|dot.serpent_sting.remains<=gcd.max)|talent.way_of_the_moknathal.enabled&buff.moknathal_tactics.down',
            condition_converted = '((((serpent_sting.talent_selected) and (((((active_enemies_as_number) <= (2))) and (((((not (serpent_sting.aura_up))) or (((serpent_sting.aura_remains_as_number) <= (gcd.max_as_number)))))))))) or (((way_of_the_moknathal.talent_selected) and (moknathal_tactics.aura_down))))',
            condition_keywords = {
                'active_enemies',
                'gcd.max',
                'moknathal_tactics.aura_down',
                'serpent_sting.aura_remains',
                'serpent_sting.aura_up',
                'serpent_sting.talent_selected',
                'way_of_the_moknathal.talent_selected',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/raptor_strike,cycle_targets=1,if=talent.serpent_sting.enabled&active_enemies<=2&(!dot.serpent_sting.ticking|dot.serpent_sting.remains<=gcd.max)|talent.way_of_the_moknathal.enabled&buff.moknathal_tactics.down',
        },
        {
            action = 'aspect_of_the_eagle',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/aspect_of_the_eagle',
        },
        {
            action = 'fury_of_the_eagle',
            condition = '(buff.mongoose_fury.up&buff.mongoose_fury.remains<=gcd)|target.time_to_die<=execute_time',
            condition_converted = '(((((mongoose_fury.aura_up) and (((mongoose_fury.aura_remains_as_number) <= (gcd_as_number)))))) or (((target.time_to_die_as_number) <= (execute_time_as_number))))',
            condition_keywords = {
                'execute_time',
                'gcd',
                'mongoose_fury.aura_remains',
                'mongoose_fury.aura_up',
                'target.time_to_die',
            },
            simc_line = 'actions+=/fury_of_the_eagle,if=(buff.mongoose_fury.up&buff.mongoose_fury.remains<=gcd)|target.time_to_die<=execute_time',
        },
        {
            action = 'mongoose_bite',
            condition = 'buff.aspect_of_the_eagle.up&(charges>=2|charges>=1&cooldown.mongoose_bite.remains<=2)|(buff.mongoose_fury.up|cooldown.fury_of_the_eagle.remains<5|charges=3)',
            condition_converted = '((((aspect_of_the_eagle.aura_up) and ((((((mongoose_bite.spell_charges_as_number) >= (2))) or (((((mongoose_bite.spell_charges_as_number) >= (1))) and (((mongoose_bite.cooldown_remains_as_number) <= (2)))))))))) or ((((mongoose_fury.aura_up) or (((((fury_of_the_eagle.cooldown_remains_as_number) < (5))) or (((mongoose_bite.spell_charges) == (3)))))))))',
            condition_keywords = {
                'aspect_of_the_eagle.aura_up',
                'fury_of_the_eagle.cooldown_remains',
                'mongoose_bite.cooldown_remains',
                'mongoose_bite.spell_charges',
                'mongoose_fury.aura_up',
            },
            simc_line = 'actions+=/mongoose_bite,if=buff.aspect_of_the_eagle.up&(charges>=2|charges>=1&cooldown.mongoose_bite.remains<=2)|(buff.mongoose_fury.up|cooldown.fury_of_the_eagle.remains<5|charges=3)',
        },
        {
            action = 'a_murder_of_crows',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/a_murder_of_crows',
        },
        {
            action = 'lacerate',
            condition = 'dot.lacerate.ticking&dot.lacerate.remains<=3|target.time_to_die>=5',
            condition_converted = '((((lacerate.aura_up) and (((lacerate.aura_remains_as_number) <= (3))))) or (((target.time_to_die_as_number) >= (5))))',
            condition_keywords = {
                'lacerate.aura_remains',
                'lacerate.aura_up',
                'target.time_to_die',
            },
            simc_line = 'actions+=/lacerate,if=dot.lacerate.ticking&dot.lacerate.remains<=3|target.time_to_die>=5',
        },
        {
            action = 'snake_hunter',
            condition = 'action.mongoose_bite.charges<=1&buff.mongoose_fury.remains>gcd.max*4|action.mongoose_bite.charges=0&buff.aspect_of_the_eagle.up',
            condition_converted = '((((((mongoose_bite.spell_charges_as_number) <= (1))) and (((mongoose_fury.aura_remains_as_number) > ((gcd.max_as_number * 4)))))) or (((((mongoose_bite.spell_charges) == (0))) and (aspect_of_the_eagle.aura_up))))',
            condition_keywords = {
                'aspect_of_the_eagle.aura_up',
                'gcd.max',
                'mongoose_bite.spell_charges',
                'mongoose_fury.aura_remains',
            },
            simc_line = 'actions+=/snake_hunter,if=action.mongoose_bite.charges<=1&buff.mongoose_fury.remains>gcd.max*4|action.mongoose_bite.charges=0&buff.aspect_of_the_eagle.up',
        },
        {
            action = 'flanking_strike',
            condition = 'talent.way_of_the_moknathal.enabled&(buff.moknathal_tactics.remains>=3)|!talent.way_of_the_moknathal.enabled',
            condition_converted = '((((way_of_the_moknathal.talent_selected) and ((((moknathal_tactics.aura_remains_as_number) >= (3)))))) or ((not (way_of_the_moknathal.talent_selected))))',
            condition_keywords = {
                'moknathal_tactics.aura_remains',
                'way_of_the_moknathal.talent_selected',
            },
            simc_line = 'actions+=/flanking_strike,if=talent.way_of_the_moknathal.enabled&(buff.moknathal_tactics.remains>=3)|!talent.way_of_the_moknathal.enabled',
        },
        {
            action = 'butchery',
            condition = 'spell_targets.butchery>=2',
            condition_converted = '((spell_targets_as_number) >= (2))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions+=/butchery,if=spell_targets.butchery>=2',
        },
        {
            action = 'carve',
            condition = 'spell_targets.carve>=4',
            condition_converted = '((spell_targets_as_number) >= (4))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions+=/carve,if=spell_targets.carve>=4',
        },
        {
            action = 'spitting_cobra',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/spitting_cobra',
        },
        {
            action = 'throwing_axes',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/throwing_axes',
        },
        {
            action = 'raptor_strike',
            condition = '!talent.throwing_axes.enabled&focus>75-cooldown.flanking_strike.remains*focus.regen',
            condition_converted = '(((not (throwing_axes.talent_selected))) and (((focus.curr_as_number) > ((75 - (flanking_strike.cooldown_remains_as_number * focus.regen_as_number))))))',
            condition_keywords = {
                'flanking_strike.cooldown_remains',
                'focus.curr',
                'focus.regen',
                'throwing_axes.talent_selected',
            },
            simc_line = 'actions+=/raptor_strike,if=!talent.throwing_axes.enabled&focus>75-cooldown.flanking_strike.remains*focus.regen',
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
            simc_line = 'actions.precombat+=/food,type=seedbattered_fish_plate',
            type = 'seedbattered_fish_plate',
        },
        {
            action = 'summon_pet',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/summon_pet',
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
            name = 'potion_of_the_old_war',
            simc_line = 'actions.precombat+=/potion,name=potion_of_the_old_war',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'harpoon',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/harpoon',
        },
    },
}


