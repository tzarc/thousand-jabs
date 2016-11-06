local _, internal = ...
internal.apls = internal.apls or {}
internal.actions = internal.actions or {}

internal.apls["legion-dev::hunter::beast_mastery"] = [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=fishbrul_special
actions.precombat+=/summon_pet
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=prolonged_power,if=active_enemies>2
actions.precombat+=/potion,name=deadly_grace
actions.precombat+=/augmentation,type=defiled
actions=auto_shot
actions+=/arcane_torrent,if=focus.deficit>=30
actions+=/blood_fury
actions+=/berserking
actions+=/potion,name=deadly_grace
actions+=/a_murder_of_crows
actions+=/stampede,if=buff.bloodlust.up|buff.bestial_wrath.up|cooldown.bestial_wrath.remains<=2|target.time_to_die<=14
actions+=/dire_beast,if=cooldown.bestial_wrath.remains>2
actions+=/dire_frenzy,if=cooldown.bestial_wrath.remains>2
actions+=/aspect_of_the_wild,if=buff.bestial_wrath.up
actions+=/barrage,if=spell_targets.barrage>1|(spell_targets.barrage=1&focus>90)
actions+=/titans_thunder,if=cooldown.dire_beast.remains>=3|buff.bestial_wrath.up&pet.dire_beast.active
actions+=/bestial_wrath
actions+=/multi_shot,if=spell_targets.multi_shot>4&(pet.buff.beast_cleave.remains<gcd.max|pet.buff.beast_cleave.down)
actions+=/kill_command
actions+=/multi_shot,if=spell_targets.multi_shot>1&(pet.buff.beast_cleave.remains<gcd.max*2|pet.buff.beast_cleave.down)
actions+=/chimaera_shot,if=focus<90
actions+=/cobra_shot,if=talent.killer_cobra.enabled&(cooldown.bestial_wrath.remains>=4&(buff.bestial_wrath.up&cooldown.kill_command.remains>=2)|focus>119)|!talent.killer_cobra.enabled&focus>90
]]

-- keywords: legion-dev::hunter::beast_mastery
---- active_enemies
---- beast_cleave.spell_remains
---- bestial_wrath.cooldown_remains
---- bestial_wrath.spell_remains
---- bloodlust.spell_remains
---- dire_beast.cooldown_remains
---- dire_beast.pet_active
---- focus.curr
---- focus.deficit
---- gcd.max
---- kill_command.cooldown_remains
---- killer_cobra.talent_enabled
---- spell_targets
---- target.time_to_die

internal.actions['legion-dev::hunter::beast_mastery'] = {
    default = {
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
            action = 'potion',
            name = 'deadly_grace',
            simc_line = 'actions+=/potion,name=deadly_grace',
        },
        {
            action = 'stampede',
            condition = 'buff.bloodlust.up|buff.bestial_wrath.up|cooldown.bestial_wrath.remains<=2|target.time_to_die<=14',
            condition_converted = '(((bloodlust.spell_remains_as_number > 0)) or ((((bestial_wrath.spell_remains_as_number > 0)) or (((((bestial_wrath.cooldown_remains_as_number) <= (2))) or (((target.time_to_die_as_number) <= (14))))))))',
            condition_keywords = {
                'bestial_wrath.cooldown_remains',
                'bestial_wrath.spell_remains',
                'bloodlust.spell_remains',
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
            condition_converted = '(bestial_wrath.spell_remains_as_number > 0)',
            condition_keywords = {
                'bestial_wrath.spell_remains',
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
            condition_converted = '((((dire_beast.cooldown_remains_as_number) >= (3))) or ((((bestial_wrath.spell_remains_as_number > 0)) and (dire_beast.pet_active))))',
            condition_keywords = {
                'bestial_wrath.spell_remains',
                'dire_beast.cooldown_remains',
                'dire_beast.pet_active',
            },
            simc_line = 'actions+=/titans_thunder,if=cooldown.dire_beast.remains>=3|buff.bestial_wrath.up&pet.dire_beast.active',
        },
        {
            action = 'multi_shot',
            condition = 'spell_targets.multi_shot>4&(pet.buff.beast_cleave.remains<gcd.max|pet.buff.beast_cleave.down)',
            condition_converted = '((((spell_targets_as_number) > (4))) and ((((((beast_cleave.spell_remains_as_number) < (gcd.max_as_number))) or ((beast_cleave.spell_remains == 0))))))',
            condition_keywords = {
                'beast_cleave.spell_remains',
                'gcd.max',
                'spell_targets',
            },
            simc_line = 'actions+=/multi_shot,if=spell_targets.multi_shot>4&(pet.buff.beast_cleave.remains<gcd.max|pet.buff.beast_cleave.down)',
        },
        {
            action = 'multi_shot',
            condition = 'spell_targets.multi_shot>1&(pet.buff.beast_cleave.remains<gcd.max*2|pet.buff.beast_cleave.down)',
            condition_converted = '((((spell_targets_as_number) > (1))) and ((((((beast_cleave.spell_remains_as_number) < ((gcd.max_as_number * 2)))) or ((beast_cleave.spell_remains == 0))))))',
            condition_keywords = {
                'beast_cleave.spell_remains',
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
            condition_converted = '((((killer_cobra.talent_enabled) and ((((((((bestial_wrath.cooldown_remains_as_number) >= (4))) and (((((bestial_wrath.spell_remains_as_number > 0)) and (((kill_command.cooldown_remains_as_number) >= (2)))))))) or (((focus.curr_as_number) > (119)))))))) or ((((not killer_cobra.talent_enabled)) and (((focus.curr_as_number) > (90))))))',
            condition_keywords = {
                'bestial_wrath.cooldown_remains',
                'bestial_wrath.spell_remains',
                'focus.curr',
                'kill_command.cooldown_remains',
                'killer_cobra.talent_enabled',
            },
            simc_line = 'actions+=/cobra_shot,if=talent.killer_cobra.enabled&(cooldown.bestial_wrath.remains>=4&(buff.bestial_wrath.up&cooldown.kill_command.remains>=2)|focus>119)|!talent.killer_cobra.enabled&focus>90',
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
            name = 'deadly_grace',
            simc_line = 'actions.precombat+=/potion,name=deadly_grace',
        },
        {
            action = 'augmentation',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
    },
}


internal.apls["legion-dev::hunter::marksmanship"] = [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=nightborne_delicacy_platter
actions.precombat+=/summon_pet
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=prolonged_power,if=active_enemies>2
actions.precombat+=/potion,name=deadly_grace
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/volley,if=talent.volley.enabled
actions=auto_shot
actions+=/arcane_torrent,if=focus.deficit>=30&(!talent.sidewinders.enabled|cooldown.sidewinders.charges<2)
actions+=/blood_fury
actions+=/berserking
actions+=/auto_shot
actions+=/variable,name=safe_to_build,value=debuff.hunters_mark.down|(buff.trueshot.down&buff.marking_targets.down)
actions+=/variable,name=use_multishot,value=((buff.marking_targets.up|buff.trueshot.up)&spell_targets.multishot>1)|(buff.marking_targets.down&buff.trueshot.down&spell_targets.multishot>2)
actions+=/call_action_list,name=open,if=active_enemies=1&time<=15
actions+=/a_murder_of_crows,if=(target.time_to_die>=cooldown+duration|target.health.pct<20)&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=60&focus+(focus.regen*debuff.hunters_mark.remains)>=60))
actions+=/call_action_list,name=cooldowns
actions+=/call_action_list,name=trueshotaoe,if=(target.time_to_die>=cooldown+duration|target.health.pct<20)&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=60&focus+(focus.regen*debuff.hunters_mark.remains)>=60))
actions+=/black_arrow,if=debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=70&focus+(focus.regen*debuff.hunters_mark.remains)>=70)
actions+=/barrage,if=(target.time_to_20pct>10|target.health.pct<=20|spell_targets>1)&((buff.trueshot.down|(target.health.pct<=20&buff.bullseye.stack<29)|spell_targets>1)&debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=90&focus+(focus.regen*debuff.hunters_mark.remains)>=90))
actions+=/call_action_list,name=targetdie,if=target.time_to_die<6&active_enemies=1
actions+=/call_action_list,name=patient_sniper,if=talent.patient_sniper.enabled
actions+=/call_action_list,name=non_patient_sniper,if=!talent.patient_sniper.enabled
actions.cooldowns=potion,name=prolonged_power,if=spell_targets.multishot>2&((buff.trueshot.react&buff.bloodlust.react)|buff.bullseye.react>=23|target.time_to_die<62)
actions.cooldowns+=/potion,name=deadly_grace,if=(buff.trueshot.react&buff.bloodlust.react)|buff.bullseye.react>=23|target.time_to_die<31
actions.cooldowns+=/trueshot,if=time<5|buff.bloodlust.react|target.time_to_die>=(cooldown+duration)|buff.bullseye.react>25|target.time_to_die<16
actions.non_patient_sniper=windburst
actions.non_patient_sniper+=/piercing_shot,if=focus>=100
actions.non_patient_sniper+=/sentinel,if=debuff.hunters_mark.down&focus>30&buff.trueshot.down
actions.non_patient_sniper+=/sidewinders,if=debuff.vulnerability.remains<gcd&time>6
actions.non_patient_sniper+=/aimed_shot,if=buff.lock_and_load.up&spell_targets.barrage<3
actions.non_patient_sniper+=/marked_shot
actions.non_patient_sniper+=/explosive_shot
actions.non_patient_sniper+=/sidewinders,if=((buff.marking_targets.up|buff.trueshot.up)&focus.deficit>70)|charges_fractional>=1.9
actions.non_patient_sniper+=/arcane_shot,if=!variable.use_multishot&(buff.marking_targets.up|(talent.steady_focus.enabled&(buff.steady_focus.down|buff.steady_focus.remains<2)))
actions.non_patient_sniper+=/multishot,if=variable.use_multishot&(buff.marking_targets.up|(talent.steady_focus.enabled&(buff.steady_focus.down|buff.steady_focus.remains<2)))
actions.non_patient_sniper+=/aimed_shot,if=!talent.piercing_shot.enabled|cooldown.piercing_shot.remains>3
actions.non_patient_sniper+=/arcane_shot,if=!variable.use_multishot
actions.non_patient_sniper+=/multishot,if=variable.use_multishot
actions.open=a_murder_of_crows
actions.open+=/trueshot
actions.open+=/piercing_shot
actions.open+=/explosive_shot
actions.open+=/barrage,if=!talent.patient_sniper.enabled
actions.open+=/arcane_shot,line_cd=16&!talent.patient_sniper.enabled
actions.open+=/sidewinders,if=(buff.marking_targets.down&buff.trueshot.remains<2)|(charges_fractional>=1.9&focus<80)
actions.open+=/marked_shot
actions.open+=/barrage,if=buff.bloodlust.up
actions.open+=/aimed_shot,if=(buff.lock_and_load.up&execute_time<debuff.vulnerability.remains)|focus>90&!talent.patient_sniper.enabled&talent.trick_shot.enabled
actions.open+=/aimed_shot,if=buff.lock_and_load.up&execute_time<debuff.vulnerability.remains
actions.open+=/black_arrow
actions.open+=/barrage
actions.open+=/arcane_shot
actions.open+=/aimed_shot,if=execute_time<debuff.vulnerability.remains
actions.open+=/sidewinders
actions.open+=/aimed_shot
actions.patient_sniper=marked_shot,cycle_targets=1,if=(talent.sidewinders.enabled&talent.barrage.enabled&spell_targets>2)|debuff.hunters_mark.remains<2|((debuff.vulnerability.up|talent.sidewinders.enabled)&debuff.vulnerability.remains<gcd)
actions.patient_sniper+=/windburst,if=talent.sidewinders.enabled&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&focus+(focus.regen*debuff.hunters_mark.remains)>=50))|buff.trueshot.up
actions.patient_sniper+=/sidewinders,if=buff.trueshot.up&((buff.marking_targets.down&buff.trueshot.remains<2)|(charges_fractional>=1.9&(focus.deficit>70|spell_targets>1)))
actions.patient_sniper+=/multishot,if=buff.marking_targets.up&debuff.hunters_mark.down&variable.use_multishot&focus.deficit>2*spell_targets+gcd*focus.regen
actions.patient_sniper+=/aimed_shot,if=buff.lock_and_load.up&buff.trueshot.up&debuff.vulnerability.remains>execute_time
actions.patient_sniper+=/marked_shot,if=buff.trueshot.up&!talent.sidewinders.enabled
actions.patient_sniper+=/arcane_shot,if=buff.trueshot.up
actions.patient_sniper+=/aimed_shot,if=debuff.hunters_mark.down&debuff.vulnerability.remains>execute_time
actions.patient_sniper+=/aimed_shot,if=talent.sidewinders.enabled&debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&(buff.lock_and_load.up|(focus+debuff.hunters_mark.remains*focus.regen>=80&focus+focus.regen*debuff.vulnerability.remains>=80))&(!talent.piercing_shot.enabled|cooldown.piercing_shot.remains>5|focus>120)
actions.patient_sniper+=/aimed_shot,if=!talent.sidewinders.enabled&debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&(buff.lock_and_load.up|(buff.trueshot.up&focus>=80)|(buff.trueshot.down&focus+debuff.hunters_mark.remains*focus.regen>=80&focus+focus.regen*debuff.vulnerability.remains>=80))&(!talent.piercing_shot.enabled|cooldown.piercing_shot.remains>5|focus>120)
actions.patient_sniper+=/windburst,if=!talent.sidewinders.enabled&focus>80&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&focus+(focus.regen*debuff.hunters_mark.remains)>=50))
actions.patient_sniper+=/marked_shot,if=(talent.sidewinders.enabled&spell_targets>1)|focus.deficit<50|buff.trueshot.up|(buff.marking_targets.up&(!talent.sidewinders.enabled|cooldown.sidewinders.charges_fractional>=1.2))
actions.patient_sniper+=/piercing_shot,if=focus>80
actions.patient_sniper+=/sidewinders,if=variable.safe_to_build&((buff.trueshot.up&focus.deficit>70)|charges_fractional>=1.9)
actions.patient_sniper+=/sidewinders,if=(buff.marking_targets.up&debuff.hunters_mark.down&buff.trueshot.down)|(cooldown.sidewinders.charges_fractional>1&target.time_to_die<11)
actions.patient_sniper+=/arcane_shot,if=variable.safe_to_build&!variable.use_multishot&focus.deficit>5+gcd*focus.regen
actions.patient_sniper+=/multishot,if=variable.safe_to_build&variable.use_multishot&focus.deficit>2*spell_targets+gcd*focus.regen
actions.patient_sniper+=/aimed_shot,if=debuff.vulnerability.down&focus>80&cooldown.windburst.remains>focus.time_to_max
actions.targetdie=marked_shot
actions.targetdie+=/windburst
actions.targetdie+=/aimed_shot,if=debuff.vulnerability.remains>execute_time&target.time_to_die>execute_time
actions.targetdie+=/sidewinders
actions.targetdie+=/aimed_shot
actions.targetdie+=/arcane_shot
actions.trueshotaoe=marked_shot
actions.trueshotaoe+=/barrage,if=!talent.patient_sniper.enabled
actions.trueshotaoe+=/piercing_shot
actions.trueshotaoe+=/explosive_shot
actions.trueshotaoe+=/aimed_shot,if=(!talent.patient_sniper.enabled|talent.trick_shot.enabled)&spell_targets.multishot=2&buff.lock_and_load.up&execute_time<debuff.vulnerability.remains
actions.trueshotaoe+=/multishot
]]

-- keywords: legion-dev::hunter::marksmanship
---- a_murder_of_crows.cooldown_remains
---- a_murder_of_crows.spell_duration
---- active_enemies
---- bloodlust.spell_remains
---- bullseye.spell_remains
---- bullseye.spell_stack
---- call_action_list.cooldown_remains
---- call_action_list.spell_duration
---- execute_time
---- focus.curr
---- focus.deficit
---- focus.regen
---- health.target_percent
---- hunters_mark.spell_remains
---- lock_and_load.spell_remains
---- marking_targets.spell_remains
---- patient_sniper.talent_enabled
---- sidewinders.cooldown_charges
---- sidewinders.spell_charges_fractional
---- sidewinders.talent_enabled
---- spell_targets
---- target.time_to_20pct
---- target.time_to_die
---- time
---- trick_shot.talent_enabled
---- trueshot.cooldown_remains
---- trueshot.spell_duration
---- trueshot.spell_remains
---- volley.talent_enabled
---- vulnerability.spell_remains

internal.actions['legion-dev::hunter::marksmanship'] = {
    cooldowns = {
        {
            action = 'potion',
            condition = 'spell_targets.multishot>2&((buff.trueshot.react&buff.bloodlust.react)|buff.bullseye.react>=23|target.time_to_die<62)',
            condition_converted = '((((spell_targets_as_number) > (2))) and ((((((((trueshot.spell_remains_as_number > 0)) and ((bloodlust.spell_remains_as_number > 0))))) or ((((((bullseye.spell_remains_as_number > 0)) >= (23))) or (((target.time_to_die_as_number) < (62)))))))))',
            condition_keywords = {
                'bloodlust.spell_remains',
                'bullseye.spell_remains',
                'spell_targets',
                'target.time_to_die',
                'trueshot.spell_remains',
            },
            name = 'prolonged_power',
            simc_line = 'actions.cooldowns=potion,name=prolonged_power,if=spell_targets.multishot>2&((buff.trueshot.react&buff.bloodlust.react)|buff.bullseye.react>=23|target.time_to_die<62)',
        },
        {
            action = 'potion',
            condition = '(buff.trueshot.react&buff.bloodlust.react)|buff.bullseye.react>=23|target.time_to_die<31',
            condition_converted = '((((((trueshot.spell_remains_as_number > 0)) and ((bloodlust.spell_remains_as_number > 0))))) or ((((((bullseye.spell_remains_as_number > 0)) >= (23))) or (((target.time_to_die_as_number) < (31))))))',
            condition_keywords = {
                'bloodlust.spell_remains',
                'bullseye.spell_remains',
                'target.time_to_die',
                'trueshot.spell_remains',
            },
            name = 'deadly_grace',
            simc_line = 'actions.cooldowns+=/potion,name=deadly_grace,if=(buff.trueshot.react&buff.bloodlust.react)|buff.bullseye.react>=23|target.time_to_die<31',
        },
        {
            action = 'trueshot',
            condition = 'time<5|buff.bloodlust.react|target.time_to_die>=(cooldown+duration)|buff.bullseye.react>25|target.time_to_die<16',
            condition_converted = '((((time_as_number) < (5))) or ((((bloodlust.spell_remains_as_number > 0)) or (((((target.time_to_die_as_number) >= ((trueshot.cooldown_remains_as_number + trueshot.spell_duration_as_number)))) or ((((((bullseye.spell_remains_as_number > 0)) > (25))) or (((target.time_to_die_as_number) < (16))))))))))',
            condition_keywords = {
                'bloodlust.spell_remains',
                'bullseye.spell_remains',
                'target.time_to_die',
                'time',
                'trueshot.cooldown_remains',
                'trueshot.spell_duration',
            },
            simc_line = 'actions.cooldowns+=/trueshot,if=time<5|buff.bloodlust.react|target.time_to_die>=(cooldown+duration)|buff.bullseye.react>25|target.time_to_die<16',
        },
    },
    default = {
        {
            action = 'arcane_torrent',
            condition = 'focus.deficit>=30&(!talent.sidewinders.enabled|cooldown.sidewinders.charges<2)',
            condition_converted = '((((focus.deficit_as_number) >= (30))) and (((((not sidewinders.talent_enabled)) or (((sidewinders.cooldown_charges_as_number) < (2)))))))',
            condition_keywords = {
                'focus.deficit',
                'sidewinders.cooldown_charges',
                'sidewinders.talent_enabled',
            },
            simc_line = 'actions+=/arcane_torrent,if=focus.deficit>=30&(!talent.sidewinders.enabled|cooldown.sidewinders.charges<2)',
        },
        {
            action = 'variable',
            name = 'safe_to_build',
            simc_line = 'actions+=/variable,name=safe_to_build,value=debuff.hunters_mark.down|(buff.trueshot.down&buff.marking_targets.down)',
            value = 'debuff.hunters_mark.down|(buff.trueshot.down&buff.marking_targets.down)',
            value_converted = '(((hunters_mark.spell_remains == 0)) or (((((trueshot.spell_remains == 0)) and ((marking_targets.spell_remains == 0))))))',
            value_keywords = {
                'hunters_mark.spell_remains',
                'marking_targets.spell_remains',
                'trueshot.spell_remains',
            },
        },
        {
            action = 'variable',
            name = 'use_multishot',
            simc_line = 'actions+=/variable,name=use_multishot,value=((buff.marking_targets.up|buff.trueshot.up)&spell_targets.multishot>1)|(buff.marking_targets.down&buff.trueshot.down&spell_targets.multishot>2)',
            value = '((buff.marking_targets.up|buff.trueshot.up)&spell_targets.multishot>1)|(buff.marking_targets.down&buff.trueshot.down&spell_targets.multishot>2)',
            value_converted = '(((((((((marking_targets.spell_remains_as_number > 0)) or ((trueshot.spell_remains_as_number > 0))))) and (((spell_targets_as_number) > (1)))))) or (((((marking_targets.spell_remains == 0)) and ((((trueshot.spell_remains == 0)) and (((spell_targets_as_number) > (2)))))))))',
            value_keywords = {
                'marking_targets.spell_remains',
                'spell_targets',
                'trueshot.spell_remains',
            },
        },
        {
            action = 'call_action_list',
            condition = 'active_enemies=1&time<=15',
            condition_converted = '((((active_enemies) == (1))) and (((time_as_number) <= (15))))',
            condition_keywords = {
                'active_enemies',
                'time',
            },
            name = 'open',
            simc_line = 'actions+=/call_action_list,name=open,if=active_enemies=1&time<=15',
        },
        {
            action = 'a_murder_of_crows',
            condition = '(target.time_to_die>=cooldown+duration|target.health.pct<20)&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=60&focus+(focus.regen*debuff.hunters_mark.remains)>=60))',
            condition_converted = '(((((((target.time_to_die_as_number) >= ((a_murder_of_crows.cooldown_remains_as_number + a_murder_of_crows.spell_duration_as_number)))) or (((health.target_percent_as_number) < (20)))))) and (((((hunters_mark.spell_remains == 0)) or ((((((hunters_mark.spell_remains_as_number) > (execute_time_as_number))) and (((((vulnerability.spell_remains_as_number) > (execute_time_as_number))) and ((((((focus.curr_as_number + (focus.regen_as_number * vulnerability.spell_remains_as_number))) >= (60))) and ((((focus.curr_as_number + (focus.regen_as_number * hunters_mark.spell_remains_as_number))) >= (60))))))))))))))',
            condition_keywords = {
                'a_murder_of_crows.cooldown_remains',
                'a_murder_of_crows.spell_duration',
                'execute_time',
                'focus.curr',
                'focus.regen',
                'health.target_percent',
                'hunters_mark.spell_remains',
                'target.time_to_die',
                'vulnerability.spell_remains',
            },
            simc_line = 'actions+=/a_murder_of_crows,if=(target.time_to_die>=cooldown+duration|target.health.pct<20)&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=60&focus+(focus.regen*debuff.hunters_mark.remains)>=60))',
        },
        {
            action = 'call_action_list',
            name = 'cooldowns',
            simc_line = 'actions+=/call_action_list,name=cooldowns',
        },
        {
            action = 'call_action_list',
            condition = '(target.time_to_die>=cooldown+duration|target.health.pct<20)&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=60&focus+(focus.regen*debuff.hunters_mark.remains)>=60))',
            condition_converted = '(((((((target.time_to_die_as_number) >= ((call_action_list.cooldown_remains_as_number + call_action_list.spell_duration_as_number)))) or (((health.target_percent_as_number) < (20)))))) and (((((hunters_mark.spell_remains == 0)) or ((((((hunters_mark.spell_remains_as_number) > (execute_time_as_number))) and (((((vulnerability.spell_remains_as_number) > (execute_time_as_number))) and ((((((focus.curr_as_number + (focus.regen_as_number * vulnerability.spell_remains_as_number))) >= (60))) and ((((focus.curr_as_number + (focus.regen_as_number * hunters_mark.spell_remains_as_number))) >= (60))))))))))))))',
            condition_keywords = {
                'call_action_list.cooldown_remains',
                'call_action_list.spell_duration',
                'execute_time',
                'focus.curr',
                'focus.regen',
                'health.target_percent',
                'hunters_mark.spell_remains',
                'target.time_to_die',
                'vulnerability.spell_remains',
            },
            name = 'trueshotaoe',
            simc_line = 'actions+=/call_action_list,name=trueshotaoe,if=(target.time_to_die>=cooldown+duration|target.health.pct<20)&(debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=60&focus+(focus.regen*debuff.hunters_mark.remains)>=60))',
        },
        {
            action = 'black_arrow',
            condition = 'debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=70&focus+(focus.regen*debuff.hunters_mark.remains)>=70)',
            condition_converted = '(((hunters_mark.spell_remains == 0)) or ((((((hunters_mark.spell_remains_as_number) > (execute_time_as_number))) and (((((vulnerability.spell_remains_as_number) > (execute_time_as_number))) and ((((((focus.curr_as_number + (focus.regen_as_number * vulnerability.spell_remains_as_number))) >= (70))) and ((((focus.curr_as_number + (focus.regen_as_number * hunters_mark.spell_remains_as_number))) >= (70)))))))))))',
            condition_keywords = {
                'execute_time',
                'focus.curr',
                'focus.regen',
                'hunters_mark.spell_remains',
                'vulnerability.spell_remains',
            },
            simc_line = 'actions+=/black_arrow,if=debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=70&focus+(focus.regen*debuff.hunters_mark.remains)>=70)',
        },
        {
            action = 'barrage',
            condition = '(target.time_to_20pct>10|target.health.pct<=20|spell_targets>1)&((buff.trueshot.down|(target.health.pct<=20&buff.bullseye.stack<29)|spell_targets>1)&debuff.hunters_mark.down|(debuff.hunters_mark.remains>execute_time&debuff.vulnerability.remains>execute_time&focus+(focus.regen*debuff.vulnerability.remains)>=90&focus+(focus.regen*debuff.hunters_mark.remains)>=90))',
            condition_converted = '(((((((target.time_to_20pct_as_number) > (10))) or (((((health.target_percent_as_number) <= (20))) or (((spell_targets_as_number) > (1)))))))) and ((((((((((trueshot.spell_remains == 0)) or ((((((((health.target_percent_as_number) <= (20))) and (((bullseye.spell_stack_as_number) < (29)))))) or (((spell_targets_as_number) > (1)))))))) and ((hunters_mark.spell_remains == 0)))) or ((((((hunters_mark.spell_remains_as_number) > (execute_time_as_number))) and (((((vulnerability.spell_remains_as_number) > (execute_time_as_number))) and ((((((focus.curr_as_number + (focus.regen_as_number * vulnerability.spell_remains_as_number))) >= (90))) and ((((focus.curr_as_number + (focus.regen_as_number * hunters_mark.spell_remains_as_number))) >= (90))))))))))))))',
            condition_keywords = {
                'bullseye.spell_stack',
                'execute_time',
                'focus.curr',
                'focus.regen',
                'health.target_percent',
                'hunters_mark.spell_remains',
                'spell_targets',
                'target.time_to_20pct',
                'trueshot.spell_remains',
                'vulnerability.spell_remains',
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
            condition_converted = 'patient_sniper.talent_enabled',
            condition_keywords = {
                'patient_sniper.talent_enabled',
            },
            name = 'patient_sniper',
            simc_line = 'actions+=/call_action_list,name=patient_sniper,if=talent.patient_sniper.enabled',
        },
        {
            action = 'call_action_list',
            condition = '!talent.patient_sniper.enabled',
            condition_converted = '(not patient_sniper.talent_enabled)',
            condition_keywords = {
                'patient_sniper.talent_enabled',
            },
            name = 'non_patient_sniper',
            simc_line = 'actions+=/call_action_list,name=non_patient_sniper,if=!talent.patient_sniper.enabled',
        },
    },
    open = {
        {
            action = 'barrage',
            condition = '!talent.patient_sniper.enabled',
            condition_converted = '(not patient_sniper.talent_enabled)',
            condition_keywords = {
                'patient_sniper.talent_enabled',
            },
            simc_line = 'actions.open+=/barrage,if=!talent.patient_sniper.enabled',
        },
        {
            action = 'arcane_shot',
            line_cd = '16&!talent.patient_sniper.enabled',
            simc_line = 'actions.open+=/arcane_shot,line_cd=16&!talent.patient_sniper.enabled',
        },
        {
            action = 'sidewinders',
            condition = '(buff.marking_targets.down&buff.trueshot.remains<2)|(charges_fractional>=1.9&focus<80)',
            condition_converted = '((((((marking_targets.spell_remains == 0)) and (((trueshot.spell_remains_as_number) < (2)))))) or ((((((sidewinders.spell_charges_fractional_as_number) >= (1.9))) and (((focus.curr_as_number) < (80)))))))',
            condition_keywords = {
                'focus.curr',
                'marking_targets.spell_remains',
                'sidewinders.spell_charges_fractional',
                'trueshot.spell_remains',
            },
            simc_line = 'actions.open+=/sidewinders,if=(buff.marking_targets.down&buff.trueshot.remains<2)|(charges_fractional>=1.9&focus<80)',
        },
        {
            action = 'barrage',
            condition = 'buff.bloodlust.up',
            condition_converted = '(bloodlust.spell_remains_as_number > 0)',
            condition_keywords = {
                'bloodlust.spell_remains',
            },
            simc_line = 'actions.open+=/barrage,if=buff.bloodlust.up',
        },
        {
            action = 'aimed_shot',
            condition = '(buff.lock_and_load.up&execute_time<debuff.vulnerability.remains)|focus>90&!talent.patient_sniper.enabled&talent.trick_shot.enabled',
            condition_converted = '((((((lock_and_load.spell_remains_as_number > 0)) and (((execute_time_as_number) < (vulnerability.spell_remains_as_number)))))) or (((((focus.curr_as_number) > (90))) and ((((not patient_sniper.talent_enabled)) and (trick_shot.talent_enabled))))))',
            condition_keywords = {
                'execute_time',
                'focus.curr',
                'lock_and_load.spell_remains',
                'patient_sniper.talent_enabled',
                'trick_shot.talent_enabled',
                'vulnerability.spell_remains',
            },
            simc_line = 'actions.open+=/aimed_shot,if=(buff.lock_and_load.up&execute_time<debuff.vulnerability.remains)|focus>90&!talent.patient_sniper.enabled&talent.trick_shot.enabled',
        },
        {
            action = 'aimed_shot',
            condition = 'buff.lock_and_load.up&execute_time<debuff.vulnerability.remains',
            condition_converted = '(((lock_and_load.spell_remains_as_number > 0)) and (((execute_time_as_number) < (vulnerability.spell_remains_as_number))))',
            condition_keywords = {
                'execute_time',
                'lock_and_load.spell_remains',
                'vulnerability.spell_remains',
            },
            simc_line = 'actions.open+=/aimed_shot,if=buff.lock_and_load.up&execute_time<debuff.vulnerability.remains',
        },
        {
            action = 'aimed_shot',
            condition = 'execute_time<debuff.vulnerability.remains',
            condition_converted = '((execute_time_as_number) < (vulnerability.spell_remains_as_number))',
            condition_keywords = {
                'execute_time',
                'vulnerability.spell_remains',
            },
            simc_line = 'actions.open+=/aimed_shot,if=execute_time<debuff.vulnerability.remains',
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
            name = 'deadly_grace',
            simc_line = 'actions.precombat+=/potion,name=deadly_grace',
        },
        {
            action = 'augmentation',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'volley',
            condition = 'talent.volley.enabled',
            condition_converted = 'volley.talent_enabled',
            condition_keywords = {
                'volley.talent_enabled',
            },
            simc_line = 'actions.precombat+=/volley,if=talent.volley.enabled',
        },
    },
    targetdie = {
        {
            action = 'aimed_shot',
            condition = 'debuff.vulnerability.remains>execute_time&target.time_to_die>execute_time',
            condition_converted = '((((vulnerability.spell_remains_as_number) > (execute_time_as_number))) and (((target.time_to_die_as_number) > (execute_time_as_number))))',
            condition_keywords = {
                'execute_time',
                'target.time_to_die',
                'vulnerability.spell_remains',
            },
            simc_line = 'actions.targetdie+=/aimed_shot,if=debuff.vulnerability.remains>execute_time&target.time_to_die>execute_time',
        },
    },
    trueshotaoe = {
        {
            action = 'barrage',
            condition = '!talent.patient_sniper.enabled',
            condition_converted = '(not patient_sniper.talent_enabled)',
            condition_keywords = {
                'patient_sniper.talent_enabled',
            },
            simc_line = 'actions.trueshotaoe+=/barrage,if=!talent.patient_sniper.enabled',
        },
        {
            action = 'aimed_shot',
            condition = '(!talent.patient_sniper.enabled|talent.trick_shot.enabled)&spell_targets.multishot=2&buff.lock_and_load.up&execute_time<debuff.vulnerability.remains',
            condition_converted = '((((((not patient_sniper.talent_enabled)) or (trick_shot.talent_enabled)))) and (((((spell_targets) == (2))) and ((((lock_and_load.spell_remains_as_number > 0)) and (((execute_time_as_number) < (vulnerability.spell_remains_as_number))))))))',
            condition_keywords = {
                'execute_time',
                'lock_and_load.spell_remains',
                'patient_sniper.talent_enabled',
                'spell_targets',
                'trick_shot.talent_enabled',
                'vulnerability.spell_remains',
            },
            simc_line = 'actions.trueshotaoe+=/aimed_shot,if=(!talent.patient_sniper.enabled|talent.trick_shot.enabled)&spell_targets.multishot=2&buff.lock_and_load.up&execute_time<debuff.vulnerability.remains',
        },
    },
}


internal.apls["legion-dev::hunter::survival"] = [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=seedbattered_fish_plate
actions.precombat+=/summon_pet
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=potion_of_the_old_war
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/harpoon
actions=auto_attack
actions+=/arcane_torrent,if=focus.deficit>=30
actions+=/blood_fury
actions+=/berserking
actions+=/potion,name=old_war,if=buff.aspect_of_the_eagle.remains
actions+=/steel_trap
actions+=/explosive_trap
actions+=/raptor_strike,if=talent.way_of_the_moknathal.enabled&buff.moknathal_tactics.remains&buff.moknathal_tactics.remains<gcd.max
actions+=/dragonsfire_grenade
actions+=/caltrops
actions+=/carve,cycle_targets=1,if=talent.serpent_sting.enabled&active_enemies>=3&(!dot.serpent_sting.ticking|dot.serpent_sting.remains<=gcd.max)
actions+=/raptor_strike,cycle_targets=1,if=talent.serpent_sting.enabled&active_enemies<=2&(!dot.serpent_sting.ticking|dot.serpent_sting.remains<=gcd.max)|talent.way_of_the_moknathal.enabled&buff.moknathal_tactics.down
actions+=/aspect_of_the_eagle
actions+=/fury_of_the_eagle,if=(buff.mongoose_fury.up&buff.mongoose_fury.remains<=gcd)|target.time_to_die<=execute_time
actions+=/mongoose_bite,if=buff.aspect_of_the_eagle.up&(charges>=2|charges>=1&cooldown.mongoose_bite.remains<=2)|(buff.mongoose_fury.up|cooldown.fury_of_the_eagle.remains<5|charges=3)
actions+=/a_murder_of_crows
actions+=/lacerate,if=dot.lacerate.ticking&dot.lacerate.remains<=3|target.time_to_die>=5
actions+=/snake_hunter,if=action.mongoose_bite.charges<=1&buff.mongoose_fury.remains>gcd.max*4|action.mongoose_bite.charges=0&buff.aspect_of_the_eagle.up
actions+=/flanking_strike,if=talent.way_of_the_moknathal.enabled&(buff.moknathal_tactics.remains>=3)|!talent.way_of_the_moknathal.enabled
actions+=/butchery,if=spell_targets.butchery>=2
actions+=/carve,if=spell_targets.carve>=4
actions+=/spitting_cobra
actions+=/throwing_axes
actions+=/raptor_strike,if=!talent.throwing_axes.enabled&focus>75-cooldown.flanking_strike.remains*focus.regen
]]

-- keywords: legion-dev::hunter::survival
---- active_enemies
---- aspect_of_the_eagle.spell_remains
---- execute_time
---- flanking_strike.cooldown_remains
---- focus.curr
---- focus.deficit
---- focus.regen
---- fury_of_the_eagle.cooldown_remains
---- gcd
---- gcd.max
---- lacerate.spell_remains
---- lacerate.spell_ticking
---- moknathal_tactics.spell_remains
---- mongoose_bite.cooldown_remains
---- mongoose_bite.spell_charges
---- mongoose_fury.spell_remains
---- serpent_sting.spell_remains
---- serpent_sting.spell_ticking
---- serpent_sting.talent_enabled
---- spell_targets
---- target.time_to_die
---- throwing_axes.talent_enabled
---- way_of_the_moknathal.talent_enabled

internal.actions['legion-dev::hunter::survival'] = {
    default = {
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
            action = 'potion',
            condition = 'buff.aspect_of_the_eagle.remains',
            condition_converted = 'aspect_of_the_eagle.spell_remains',
            condition_keywords = {
                'aspect_of_the_eagle.spell_remains',
            },
            name = 'old_war',
            simc_line = 'actions+=/potion,name=old_war,if=buff.aspect_of_the_eagle.remains',
        },
        {
            action = 'raptor_strike',
            condition = 'talent.way_of_the_moknathal.enabled&buff.moknathal_tactics.remains&buff.moknathal_tactics.remains<gcd.max',
            condition_converted = '((way_of_the_moknathal.talent_enabled) and (((moknathal_tactics.spell_remains) and (((moknathal_tactics.spell_remains_as_number) < (gcd.max_as_number))))))',
            condition_keywords = {
                'gcd.max',
                'moknathal_tactics.spell_remains',
                'way_of_the_moknathal.talent_enabled',
            },
            simc_line = 'actions+=/raptor_strike,if=talent.way_of_the_moknathal.enabled&buff.moknathal_tactics.remains&buff.moknathal_tactics.remains<gcd.max',
        },
        {
            action = 'carve',
            condition = 'talent.serpent_sting.enabled&active_enemies>=3&(!dot.serpent_sting.ticking|dot.serpent_sting.remains<=gcd.max)',
            condition_converted = '((serpent_sting.talent_enabled) and (((((active_enemies_as_number) >= (3))) and (((((serpent_sting.spell_remains == 0)) or (((serpent_sting.spell_remains_as_number) <= (gcd.max_as_number)))))))))',
            condition_keywords = {
                'active_enemies',
                'gcd.max',
                'serpent_sting.spell_remains',
                'serpent_sting.talent_enabled',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/carve,cycle_targets=1,if=talent.serpent_sting.enabled&active_enemies>=3&(!dot.serpent_sting.ticking|dot.serpent_sting.remains<=gcd.max)',
        },
        {
            action = 'raptor_strike',
            condition = 'talent.serpent_sting.enabled&active_enemies<=2&(!dot.serpent_sting.ticking|dot.serpent_sting.remains<=gcd.max)|talent.way_of_the_moknathal.enabled&buff.moknathal_tactics.down',
            condition_converted = '((((serpent_sting.talent_enabled) and (((((active_enemies_as_number) <= (2))) and (((((serpent_sting.spell_remains == 0)) or (((serpent_sting.spell_remains_as_number) <= (gcd.max_as_number)))))))))) or (((way_of_the_moknathal.talent_enabled) and ((moknathal_tactics.spell_remains == 0)))))',
            condition_keywords = {
                'active_enemies',
                'gcd.max',
                'moknathal_tactics.spell_remains',
                'serpent_sting.spell_remains',
                'serpent_sting.talent_enabled',
                'way_of_the_moknathal.talent_enabled',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/raptor_strike,cycle_targets=1,if=talent.serpent_sting.enabled&active_enemies<=2&(!dot.serpent_sting.ticking|dot.serpent_sting.remains<=gcd.max)|talent.way_of_the_moknathal.enabled&buff.moknathal_tactics.down',
        },
        {
            action = 'fury_of_the_eagle',
            condition = '(buff.mongoose_fury.up&buff.mongoose_fury.remains<=gcd)|target.time_to_die<=execute_time',
            condition_converted = '((((((mongoose_fury.spell_remains_as_number > 0)) and (((mongoose_fury.spell_remains_as_number) <= (gcd_as_number)))))) or (((target.time_to_die_as_number) <= (execute_time_as_number))))',
            condition_keywords = {
                'execute_time',
                'gcd',
                'mongoose_fury.spell_remains',
                'target.time_to_die',
            },
            simc_line = 'actions+=/fury_of_the_eagle,if=(buff.mongoose_fury.up&buff.mongoose_fury.remains<=gcd)|target.time_to_die<=execute_time',
        },
        {
            action = 'mongoose_bite',
            condition = 'buff.aspect_of_the_eagle.up&(charges>=2|charges>=1&cooldown.mongoose_bite.remains<=2)|(buff.mongoose_fury.up|cooldown.fury_of_the_eagle.remains<5|charges=3)',
            condition_converted = '(((((aspect_of_the_eagle.spell_remains_as_number > 0)) and ((((((mongoose_bite.spell_charges_as_number) >= (2))) or (((((mongoose_bite.spell_charges_as_number) >= (1))) and (((mongoose_bite.cooldown_remains_as_number) <= (2)))))))))) or (((((mongoose_fury.spell_remains_as_number > 0)) or (((((fury_of_the_eagle.cooldown_remains_as_number) < (5))) or (((mongoose_bite.spell_charges) == (3)))))))))',
            condition_keywords = {
                'aspect_of_the_eagle.spell_remains',
                'fury_of_the_eagle.cooldown_remains',
                'mongoose_bite.cooldown_remains',
                'mongoose_bite.spell_charges',
                'mongoose_fury.spell_remains',
            },
            simc_line = 'actions+=/mongoose_bite,if=buff.aspect_of_the_eagle.up&(charges>=2|charges>=1&cooldown.mongoose_bite.remains<=2)|(buff.mongoose_fury.up|cooldown.fury_of_the_eagle.remains<5|charges=3)',
        },
        {
            action = 'lacerate',
            condition = 'dot.lacerate.ticking&dot.lacerate.remains<=3|target.time_to_die>=5',
            condition_converted = '((((lacerate.spell_ticking) and (((lacerate.spell_remains_as_number) <= (3))))) or (((target.time_to_die_as_number) >= (5))))',
            condition_keywords = {
                'lacerate.spell_remains',
                'lacerate.spell_ticking',
                'target.time_to_die',
            },
            simc_line = 'actions+=/lacerate,if=dot.lacerate.ticking&dot.lacerate.remains<=3|target.time_to_die>=5',
        },
        {
            action = 'snake_hunter',
            condition = 'action.mongoose_bite.charges<=1&buff.mongoose_fury.remains>gcd.max*4|action.mongoose_bite.charges=0&buff.aspect_of_the_eagle.up',
            condition_converted = '((((((mongoose_bite.spell_charges_as_number) <= (1))) and (((mongoose_fury.spell_remains_as_number) > ((gcd.max_as_number * 4)))))) or (((((mongoose_bite.spell_charges) == (0))) and ((aspect_of_the_eagle.spell_remains_as_number > 0)))))',
            condition_keywords = {
                'aspect_of_the_eagle.spell_remains',
                'gcd.max',
                'mongoose_bite.spell_charges',
                'mongoose_fury.spell_remains',
            },
            simc_line = 'actions+=/snake_hunter,if=action.mongoose_bite.charges<=1&buff.mongoose_fury.remains>gcd.max*4|action.mongoose_bite.charges=0&buff.aspect_of_the_eagle.up',
        },
        {
            action = 'flanking_strike',
            condition = 'talent.way_of_the_moknathal.enabled&(buff.moknathal_tactics.remains>=3)|!talent.way_of_the_moknathal.enabled',
            condition_converted = '((((way_of_the_moknathal.talent_enabled) and ((((moknathal_tactics.spell_remains_as_number) >= (3)))))) or ((not way_of_the_moknathal.talent_enabled)))',
            condition_keywords = {
                'moknathal_tactics.spell_remains',
                'way_of_the_moknathal.talent_enabled',
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
            action = 'raptor_strike',
            condition = '!talent.throwing_axes.enabled&focus>75-cooldown.flanking_strike.remains*focus.regen',
            condition_converted = '(((not throwing_axes.talent_enabled)) and (((focus.curr_as_number) > ((75 - (flanking_strike.cooldown_remains_as_number * focus.regen_as_number))))))',
            condition_keywords = {
                'flanking_strike.cooldown_remains',
                'focus.curr',
                'focus.regen',
                'throwing_axes.talent_enabled',
            },
            simc_line = 'actions+=/raptor_strike,if=!talent.throwing_axes.enabled&focus>75-cooldown.flanking_strike.remains*focus.regen',
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
            simc_line = 'actions.precombat+=/food,type=seedbattered_fish_plate',
            type = 'seedbattered_fish_plate',
        },
        {
            action = 'potion',
            name = 'potion_of_the_old_war',
            simc_line = 'actions.precombat+=/potion,name=potion_of_the_old_war',
        },
        {
            action = 'augmentation',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
    },
}


