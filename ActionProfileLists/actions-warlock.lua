local _, internal = ...
internal.actions = internal.actions or {}

-- keywords: legion-dev::warlock::affliction
---- actions
---- active_enemies
---- agony.aura_remains
---- agony.spell_duration
---- agony.spell_tick_time
---- compounding_horror.spell_react
---- contagion.talent_selected
---- corruption.aura_remains
---- corruption.spell_duration
---- corruption.spell_tick_time
---- deadwind_harvester.aura_remains
---- demonic_power.aura_down
---- equipped
---- gcd
---- grimoire_of_sacrifice.talent_selected
---- grimoire_of_supremacy.talent_selected
---- health.target_percent
---- lord_of_flames.artifact_rank
---- mana.percent
---- mana_tap.aura_remains
---- mana_tap.spell_duration
---- mana_tap.talent_selected
---- reap_souls
---- sindorei_spite_icd.cooldown_remains
---- siphon_life.aura_remains
---- siphon_life.spell_duration
---- siphon_life.spell_tick_time
---- soul_effigy.pet_active
---- soul_harvest.aura_remains
---- soul_shard.curr
---- spell_targets
---- target.time_to_die
---- tormented_souls.spell_react
---- trinket.proc.any.react
---- trinket.proc.crit.react
---- trinket.proc.intellect.react
---- trinket.proc.mastery.react
---- trinket.proc.versatility.react
---- trinket.stacking_proc.mastery.react

internal.actions['legion-dev::warlock::affliction'] = {
    default = {
        {
            action = 'reap_souls',
            condition = '!buff.deadwind_harvester.remains&(buff.soul_harvest.remains|buff.tormented_souls.react>=8|target.time_to_die<=buff.tormented_souls.react*5|trinket.proc.any.react)',
            condition_converted = '(((deadwind_harvester.aura_remains == 0)) and ((((soul_harvest.aura_remains) or (((((tormented_souls.spell_react_as_number) >= (8))) or (((((target.time_to_die_as_number) <= ((tormented_souls.spell_react_as_number * 5)))) or (trinket.proc.any.react)))))))))',
            condition_keywords = {
                'deadwind_harvester.aura_remains',
                'soul_harvest.aura_remains',
                'target.time_to_die',
                'tormented_souls.spell_react',
                'trinket.proc.any.react',
            },
            simc_line = 'actions=reap_souls,if=actions=reap_souls,if=!buff.deadwind_harvester.remains&(buff.soul_harvest.remains|buff.tormented_souls.react>=8|target.time_to_die<=buff.tormented_souls.react*5|trinket.proc.any.react)',
        },
        {
            action = 'soul_effigy',
            condition = '!pet.soul_effigy.active',
            condition_converted = '(not (soul_effigy.pet_active))',
            condition_keywords = {
                'soul_effigy.pet_active',
            },
            simc_line = 'actions+=/soul_effigy,if=!pet.soul_effigy.active',
        },
        {
            action = 'agony',
            condition = 'remains<=tick_time+gcd',
            condition_converted = '((agony.aura_remains_as_number) <= ((agony.spell_tick_time_as_number + gcd_as_number)))',
            condition_keywords = {
                'agony.aura_remains',
                'agony.spell_tick_time',
                'gcd',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/agony,cycle_targets=1,if=remains<=tick_time+gcd',
        },
        {
            action = 'service_pet',
            condition = 'dot.corruption.remains&dot.agony.remains',
            condition_converted = '((corruption.aura_remains) and (agony.aura_remains))',
            condition_keywords = {
                'agony.aura_remains',
                'corruption.aura_remains',
            },
            simc_line = 'actions+=/service_pet,if=dot.corruption.remains&dot.agony.remains',
        },
        {
            action = 'summon_doomguard',
            condition = '!talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal<3&(target.time_to_die>180|target.health.pct<=20|target.time_to_die<30)',
            condition_converted = '(((not (grimoire_of_supremacy.talent_selected))) and (((((spell_targets_as_number) < (3))) and ((((((target.time_to_die_as_number) > (180))) or (((((health.target_percent_as_number) <= (20))) or (((target.time_to_die_as_number) < (30)))))))))))',
            condition_keywords = {
                'grimoire_of_supremacy.talent_selected',
                'health.target_percent',
                'spell_targets',
                'target.time_to_die',
            },
            simc_line = 'actions+=/summon_doomguard,if=!talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal<3&(target.time_to_die>180|target.health.pct<=20|target.time_to_die<30)',
        },
        {
            action = 'summon_infernal',
            condition = '!talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal>=3',
            condition_converted = '(((not (grimoire_of_supremacy.talent_selected))) and (((spell_targets_as_number) >= (3))))',
            condition_keywords = {
                'grimoire_of_supremacy.talent_selected',
                'spell_targets',
            },
            simc_line = 'actions+=/summon_infernal,if=!talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal>=3',
        },
        {
            action = 'summon_doomguard',
            condition = 'talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal<3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((((spell_targets_as_number) < (3))) and (((equipped[132379]) and ((sindorei_spite_icd.cooldown_remains == 0)))))))',
            condition_keywords = {
                'equipped',
                'grimoire_of_supremacy.talent_selected',
                'sindorei_spite_icd.cooldown_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/summon_doomguard,if=talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal<3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
        },
        {
            action = 'summon_infernal',
            condition = 'talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal>=3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((((spell_targets_as_number) >= (3))) and (((equipped[132379]) and ((sindorei_spite_icd.cooldown_remains == 0)))))))',
            condition_keywords = {
                'equipped',
                'grimoire_of_supremacy.talent_selected',
                'sindorei_spite_icd.cooldown_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal>=3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
        },
        {
            action = 'potion',
            condition = 'buff.soul_harvest.remains|trinket.proc.any.react|target.time_to_die<=45',
            condition_converted = '((soul_harvest.aura_remains) or (((trinket.proc.any.react) or (((target.time_to_die_as_number) <= (45))))))',
            condition_keywords = {
                'soul_harvest.aura_remains',
                'target.time_to_die',
                'trinket.proc.any.react',
            },
            name = 'deadly_grace',
            simc_line = 'actions+=/potion,name=deadly_grace,if=buff.soul_harvest.remains|trinket.proc.any.react|target.time_to_die<=45',
        },
        {
            action = 'corruption',
            condition = 'remains<=tick_time+gcd',
            condition_converted = '((corruption.aura_remains_as_number) <= ((corruption.spell_tick_time_as_number + gcd_as_number)))',
            condition_keywords = {
                'corruption.aura_remains',
                'corruption.spell_tick_time',
                'gcd',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/corruption,cycle_targets=1,if=remains<=tick_time+gcd',
        },
        {
            action = 'siphon_life',
            condition = 'remains<=tick_time+gcd',
            condition_converted = '((siphon_life.aura_remains_as_number) <= ((siphon_life.spell_tick_time_as_number + gcd_as_number)))',
            condition_keywords = {
                'gcd',
                'siphon_life.aura_remains',
                'siphon_life.spell_tick_time',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/siphon_life,cycle_targets=1,if=remains<=tick_time+gcd',
        },
        {
            action = 'mana_tap',
            condition = 'buff.mana_tap.remains<=buff.mana_tap.duration*0.3&(mana.pct<20|buff.mana_tap.remains<=gcd)&target.time_to_die>buff.mana_tap.duration*0.3',
            condition_converted = '((((mana_tap.aura_remains_as_number) <= ((mana_tap.spell_duration_as_number * 0.3)))) and ((((((((mana.percent_as_number) < (20))) or (((mana_tap.aura_remains_as_number) <= (gcd_as_number)))))) and (((target.time_to_die_as_number) > ((mana_tap.spell_duration_as_number * 0.3)))))))',
            condition_keywords = {
                'gcd',
                'mana.percent',
                'mana_tap.aura_remains',
                'mana_tap.spell_duration',
                'target.time_to_die',
            },
            simc_line = 'actions+=/mana_tap,if=buff.mana_tap.remains<=buff.mana_tap.duration*0.3&(mana.pct<20|buff.mana_tap.remains<=gcd)&target.time_to_die>buff.mana_tap.duration*0.3',
        },
        {
            action = 'unstable_affliction',
            condition = 'talent.contagion.enabled|(soul_shard>=4|trinket.proc.intellect.react|trinket.stacking_proc.mastery.react|trinket.proc.mastery.react|trinket.proc.crit.react|trinket.proc.versatility.react|buff.soul_harvest.remains|buff.deadwind_harvester.remains|buff.compounding_horror.react=5|target.time_to_die<=20)',
            condition_converted = '((contagion.talent_selected) or ((((((soul_shard.curr_as_number) >= (4))) or (((trinket.proc.intellect.react) or (((trinket.stacking_proc.mastery.react) or (((trinket.proc.mastery.react) or (((trinket.proc.crit.react) or (((trinket.proc.versatility.react) or (((soul_harvest.aura_remains) or (((deadwind_harvester.aura_remains) or (((((compounding_horror.spell_react) == (5))) or (((target.time_to_die_as_number) <= (20)))))))))))))))))))))))',
            condition_keywords = {
                'compounding_horror.spell_react',
                'contagion.talent_selected',
                'deadwind_harvester.aura_remains',
                'soul_harvest.aura_remains',
                'soul_shard.curr',
                'target.time_to_die',
                'trinket.proc.crit.react',
                'trinket.proc.intellect.react',
                'trinket.proc.mastery.react',
                'trinket.proc.versatility.react',
                'trinket.stacking_proc.mastery.react',
            },
            simc_line = 'actions+=/unstable_affliction,if=talent.contagion.enabled|(soul_shard>=4|trinket.proc.intellect.react|trinket.stacking_proc.mastery.react|trinket.proc.mastery.react|trinket.proc.crit.react|trinket.proc.versatility.react|buff.soul_harvest.remains|buff.deadwind_harvester.remains|buff.compounding_horror.react=5|target.time_to_die<=20)',
        },
        {
            action = 'agony',
            condition = 'remains<=duration*0.3&target.time_to_die>=remains',
            condition_converted = '((((agony.aura_remains_as_number) <= ((agony.spell_duration_as_number * 0.3)))) and (((target.time_to_die_as_number) >= (agony.aura_remains_as_number))))',
            condition_keywords = {
                'agony.aura_remains',
                'agony.spell_duration',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/agony,cycle_targets=1,if=remains<=duration*0.3&target.time_to_die>=remains',
        },
        {
            action = 'corruption',
            condition = 'remains<=duration*0.3&target.time_to_die>=remains',
            condition_converted = '((((corruption.aura_remains_as_number) <= ((corruption.spell_duration_as_number * 0.3)))) and (((target.time_to_die_as_number) >= (corruption.aura_remains_as_number))))',
            condition_keywords = {
                'corruption.aura_remains',
                'corruption.spell_duration',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/corruption,cycle_targets=1,if=remains<=duration*0.3&target.time_to_die>=remains',
        },
        {
            action = 'siphon_life',
            condition = 'remains<=duration*0.3&target.time_to_die>=remains',
            condition_converted = '((((siphon_life.aura_remains_as_number) <= ((siphon_life.spell_duration_as_number * 0.3)))) and (((target.time_to_die_as_number) >= (siphon_life.aura_remains_as_number))))',
            condition_keywords = {
                'siphon_life.aura_remains',
                'siphon_life.spell_duration',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/siphon_life,cycle_targets=1,if=remains<=duration*0.3&target.time_to_die>=remains',
        },
        {
            action = 'life_tap',
            condition = 'mana.pct<=10',
            condition_converted = '((mana.percent_as_number) <= (10))',
            condition_keywords = {
                'mana.percent',
            },
            simc_line = 'actions+=/life_tap,if=mana.pct<=10',
        },
        {
            action = 'drain_soul',
            chain = '1',
            interrupt = '1',
            simc_line = 'actions+=/drain_soul,chain=1,interrupt=1',
        },
        {
            action = 'drain_life',
            chain = '1',
            interrupt = '1',
            simc_line = 'actions+=/drain_life,chain=1,interrupt=1',
        },
    },
    precombat = {
        {
            action = 'flask',
            simc_line = 'actions.precombat=flask,type=whispered_pact',
            type = 'whispered_pact',
        },
        {
            action = 'food',
            simc_line = 'actions.precombat+=/food,type=nightborne_delicacy_platter',
            type = 'nightborne_delicacy_platter',
        },
        {
            action = 'summon_pet',
            condition = '!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)',
            condition_converted = '(((not (grimoire_of_supremacy.talent_selected))) and (((((not (grimoire_of_sacrifice.talent_selected))) or (demonic_power.aura_down)))))',
            condition_keywords = {
                'demonic_power.aura_down',
                'grimoire_of_sacrifice.talent_selected',
                'grimoire_of_supremacy.talent_selected',
            },
            simc_line = 'actions.precombat+=/summon_pet,if=!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)',
        },
        {
            action = 'summon_infernal',
            condition = 'talent.grimoire_of_supremacy.enabled&artifact.lord_of_flames.rank>0',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((lord_of_flames.artifact_rank_as_number) > (0))))',
            condition_keywords = {
                'grimoire_of_supremacy.talent_selected',
                'lord_of_flames.artifact_rank',
            },
            simc_line = 'actions.precombat+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&artifact.lord_of_flames.rank>0',
        },
        {
            action = 'summon_infernal',
            condition = 'talent.grimoire_of_supremacy.enabled&active_enemies>=3',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((active_enemies_as_number) >= (3))))',
            condition_keywords = {
                'active_enemies',
                'grimoire_of_supremacy.talent_selected',
            },
            simc_line = 'actions.precombat+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&active_enemies>=3',
        },
        {
            action = 'summon_doomguard',
            condition = 'talent.grimoire_of_supremacy.enabled&active_enemies<3&artifact.lord_of_flames.rank=0',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((((active_enemies_as_number) < (3))) and (((lord_of_flames.artifact_rank) == (0))))))',
            condition_keywords = {
                'active_enemies',
                'grimoire_of_supremacy.talent_selected',
                'lord_of_flames.artifact_rank',
            },
            simc_line = 'actions.precombat+=/summon_doomguard,if=talent.grimoire_of_supremacy.enabled&active_enemies<3&artifact.lord_of_flames.rank=0',
        },
        {
            action = 'augmentation',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'grimoire_of_sacrifice',
            condition = 'talent.grimoire_of_sacrifice.enabled',
            condition_converted = 'grimoire_of_sacrifice.talent_selected',
            condition_keywords = {
                'grimoire_of_sacrifice.talent_selected',
            },
            simc_line = 'actions.precombat+=/grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled',
        },
        {
            action = 'potion',
            name = 'deadly_grace',
            simc_line = 'actions.precombat+=/potion,name=deadly_grace',
        },
        {
            action = 'mana_tap',
            condition = 'talent.mana_tap.enabled&!buff.mana_tap.remains',
            condition_converted = '((mana_tap.talent_selected) and ((mana_tap.aura_remains == 0)))',
            condition_keywords = {
                'mana_tap.aura_remains',
                'mana_tap.talent_selected',
            },
            simc_line = 'actions.precombat+=/mana_tap,if=talent.mana_tap.enabled&!buff.mana_tap.remains',
        },
    },
}


-- keywords: legion-dev::warlock::demonology
---- active_enemies
---- call_dreadstalkers.cooldown_remains
---- call_dreadstalkers.spell_cast_time
---- darkglare_no_de
---- demonbolt.talent_selected
---- demonic_calling.spell_react
---- demonic_power.aura_down
---- demonic_synergy.aura_remains
---- doom.aura_remains
---- doom.spell_duration
---- doom.spell_ticking
---- doomguard_no_de
---- dreadstalker_no_de
---- dreadstalker_remaining_duration
---- equipped
---- execute_time
---- grimoire_of_sacrifice.talent_selected
---- grimoire_of_supremacy.talent_selected
---- hand_of_doom.talent_selected
---- hand_of_guldan.spell_cast_time
---- health.target_percent
---- implosion.talent_selected
---- infernal_no_de
---- lord_of_flames.artifact_rank
---- mana.percent
---- prev_gcd.call_dreadstalkers
---- prev_gcd.hand_of_guldan
---- prev_gcd.summon_darkglare
---- service_no_de
---- shadow_bolt.spell_cast_time
---- shadow_bolt.spell_execute_time
---- shadowflame.aura_remains
---- shadowflame.spell_charges
---- shadowflame.spell_stack
---- sindorei_spite_icd.cooldown_remains
---- soul_harvest.aura_remains
---- soul_shard.curr
---- spell_targets
---- summon_darkglare.cooldown_remains
---- summon_darkglare.spell_cast_time
---- summon_darkglare.talent_selected
---- target.time_to_die
---- travel_time
---- trinket.proc.any.react
---- wild_imp_count
---- wild_imp_no_de
---- wild_imp_remaining_duration

internal.actions['legion-dev::warlock::demonology'] = {
    default = {
        {
            action = 'implosion',
            condition = 'wild_imp_remaining_duration<=action.shadow_bolt.execute_time&buff.demonic_synergy.remains',
            condition_converted = '((((wild_imp_remaining_duration_as_number) <= (shadow_bolt.spell_execute_time_as_number))) and (demonic_synergy.aura_remains))',
            condition_keywords = {
                'demonic_synergy.aura_remains',
                'shadow_bolt.spell_execute_time',
                'wild_imp_remaining_duration',
            },
            simc_line = 'actions=implosion,if=wild_imp_remaining_duration<=action.shadow_bolt.execute_time&buff.demonic_synergy.remains',
        },
        {
            action = 'implosion',
            condition = 'prev_gcd.hand_of_guldan&wild_imp_remaining_duration<=3&buff.demonic_synergy.remains',
            condition_converted = '((prev_gcd.hand_of_guldan) and (((((wild_imp_remaining_duration_as_number) <= (3))) and (demonic_synergy.aura_remains))))',
            condition_keywords = {
                'demonic_synergy.aura_remains',
                'prev_gcd.hand_of_guldan',
                'wild_imp_remaining_duration',
            },
            simc_line = 'actions+=/implosion,if=prev_gcd.hand_of_guldan&wild_imp_remaining_duration<=3&buff.demonic_synergy.remains',
        },
        {
            action = 'implosion',
            condition = 'wild_imp_count<=4&wild_imp_remaining_duration<=action.shadow_bolt.execute_time&spell_targets.implosion>1',
            condition_converted = '((((wild_imp_count_as_number) <= (4))) and (((((wild_imp_remaining_duration_as_number) <= (shadow_bolt.spell_execute_time_as_number))) and (((spell_targets_as_number) > (1))))))',
            condition_keywords = {
                'shadow_bolt.spell_execute_time',
                'spell_targets',
                'wild_imp_count',
                'wild_imp_remaining_duration',
            },
            simc_line = 'actions+=/implosion,if=wild_imp_count<=4&wild_imp_remaining_duration<=action.shadow_bolt.execute_time&spell_targets.implosion>1',
        },
        {
            action = 'implosion',
            condition = 'prev_gcd.hand_of_guldan&wild_imp_remaining_duration<=4&spell_targets.implosion>2',
            condition_converted = '((prev_gcd.hand_of_guldan) and (((((wild_imp_remaining_duration_as_number) <= (4))) and (((spell_targets_as_number) > (2))))))',
            condition_keywords = {
                'prev_gcd.hand_of_guldan',
                'spell_targets',
                'wild_imp_remaining_duration',
            },
            simc_line = 'actions+=/implosion,if=prev_gcd.hand_of_guldan&wild_imp_remaining_duration<=4&spell_targets.implosion>2',
        },
        {
            action = 'shadowflame',
            condition = 'debuff.shadowflame.stack>0&remains<action.shadow_bolt.cast_time+travel_time',
            condition_converted = '((((shadowflame.spell_stack_as_number) > (0))) and (((shadowflame.aura_remains_as_number) < ((shadow_bolt.spell_cast_time_as_number + travel_time_as_number)))))',
            condition_keywords = {
                'shadow_bolt.spell_cast_time',
                'shadowflame.aura_remains',
                'shadowflame.spell_stack',
                'travel_time',
            },
            simc_line = 'actions+=/shadowflame,if=debuff.shadowflame.stack>0&remains<action.shadow_bolt.cast_time+travel_time',
        },
        {
            action = 'summon_doomguard',
            condition = '!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening<3&(target.time_to_die>180|target.health.pct<=20|target.time_to_die<30)',
            condition_converted = '(((not (grimoire_of_supremacy.talent_selected))) and (((((spell_targets_as_number) < (3))) and ((((((target.time_to_die_as_number) > (180))) or (((((health.target_percent_as_number) <= (20))) or (((target.time_to_die_as_number) < (30)))))))))))',
            condition_keywords = {
                'grimoire_of_supremacy.talent_selected',
                'health.target_percent',
                'spell_targets',
                'target.time_to_die',
            },
            simc_line = 'actions+=/summon_doomguard,if=!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening<3&(target.time_to_die>180|target.health.pct<=20|target.time_to_die<30)',
        },
        {
            action = 'summon_infernal',
            condition = '!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening>=3',
            condition_converted = '(((not (grimoire_of_supremacy.talent_selected))) and (((spell_targets_as_number) >= (3))))',
            condition_keywords = {
                'grimoire_of_supremacy.talent_selected',
                'spell_targets',
            },
            simc_line = 'actions+=/summon_infernal,if=!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening>=3',
        },
        {
            action = 'summon_doomguard',
            condition = 'talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal<3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((((spell_targets_as_number) < (3))) and (((equipped[132379]) and ((sindorei_spite_icd.cooldown_remains == 0)))))))',
            condition_keywords = {
                'equipped',
                'grimoire_of_supremacy.talent_selected',
                'sindorei_spite_icd.cooldown_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/summon_doomguard,if=talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal<3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
        },
        {
            action = 'summon_infernal',
            condition = 'talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal>=3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((((spell_targets_as_number) >= (3))) and (((equipped[132379]) and ((sindorei_spite_icd.cooldown_remains == 0)))))))',
            condition_keywords = {
                'equipped',
                'grimoire_of_supremacy.talent_selected',
                'sindorei_spite_icd.cooldown_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal>=3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
        },
        {
            action = 'call_dreadstalkers',
            condition = '!talent.summon_darkglare.enabled&(spell_targets.implosion<3|!talent.implosion.enabled)',
            condition_converted = '(((not (summon_darkglare.talent_selected))) and ((((((spell_targets_as_number) < (3))) or ((not (implosion.talent_selected)))))))',
            condition_keywords = {
                'implosion.talent_selected',
                'spell_targets',
                'summon_darkglare.talent_selected',
            },
            simc_line = 'actions+=/call_dreadstalkers,if=!talent.summon_darkglare.enabled&(spell_targets.implosion<3|!talent.implosion.enabled)',
        },
        {
            action = 'hand_of_guldan',
            condition = 'soul_shard>=4&!talent.summon_darkglare.enabled',
            condition_converted = '((((soul_shard.curr_as_number) >= (4))) and ((not (summon_darkglare.talent_selected))))',
            condition_keywords = {
                'soul_shard.curr',
                'summon_darkglare.talent_selected',
            },
            simc_line = 'actions+=/hand_of_guldan,if=soul_shard>=4&!talent.summon_darkglare.enabled',
        },
        {
            action = 'summon_darkglare',
            condition = 'prev_gcd.hand_of_guldan',
            condition_converted = 'prev_gcd.hand_of_guldan',
            condition_keywords = {
                'prev_gcd.hand_of_guldan',
            },
            simc_line = 'actions+=/summon_darkglare,if=prev_gcd.hand_of_guldan',
        },
        {
            action = 'summon_darkglare',
            condition = 'prev_gcd.call_dreadstalkers',
            condition_converted = 'prev_gcd.call_dreadstalkers',
            condition_keywords = {
                'prev_gcd.call_dreadstalkers',
            },
            simc_line = 'actions+=/summon_darkglare,if=prev_gcd.call_dreadstalkers',
        },
        {
            action = 'summon_darkglare',
            condition = 'cooldown.call_dreadstalkers.remains>5&soul_shard<3',
            condition_converted = '((((call_dreadstalkers.cooldown_remains_as_number) > (5))) and (((soul_shard.curr_as_number) < (3))))',
            condition_keywords = {
                'call_dreadstalkers.cooldown_remains',
                'soul_shard.curr',
            },
            simc_line = 'actions+=/summon_darkglare,if=cooldown.call_dreadstalkers.remains>5&soul_shard<3',
        },
        {
            action = 'summon_darkglare',
            condition = 'cooldown.call_dreadstalkers.remains<=action.summon_darkglare.cast_time&soul_shard>=3',
            condition_converted = '((((call_dreadstalkers.cooldown_remains_as_number) <= (summon_darkglare.spell_cast_time_as_number))) and (((soul_shard.curr_as_number) >= (3))))',
            condition_keywords = {
                'call_dreadstalkers.cooldown_remains',
                'soul_shard.curr',
                'summon_darkglare.spell_cast_time',
            },
            simc_line = 'actions+=/summon_darkglare,if=cooldown.call_dreadstalkers.remains<=action.summon_darkglare.cast_time&soul_shard>=3',
        },
        {
            action = 'summon_darkglare',
            condition = 'cooldown.call_dreadstalkers.remains<=action.summon_darkglare.cast_time&soul_shard>=1&buff.demonic_calling.react',
            condition_converted = '((((call_dreadstalkers.cooldown_remains_as_number) <= (summon_darkglare.spell_cast_time_as_number))) and (((((soul_shard.curr_as_number) >= (1))) and (demonic_calling.spell_react))))',
            condition_keywords = {
                'call_dreadstalkers.cooldown_remains',
                'demonic_calling.spell_react',
                'soul_shard.curr',
                'summon_darkglare.spell_cast_time',
            },
            simc_line = 'actions+=/summon_darkglare,if=cooldown.call_dreadstalkers.remains<=action.summon_darkglare.cast_time&soul_shard>=1&buff.demonic_calling.react',
        },
        {
            action = 'call_dreadstalkers',
            condition = 'talent.summon_darkglare.enabled&(spell_targets.implosion<3|!talent.implosion.enabled)&cooldown.summon_darkglare.remains>2',
            condition_converted = '((summon_darkglare.talent_selected) and ((((((((spell_targets_as_number) < (3))) or ((not (implosion.talent_selected)))))) and (((summon_darkglare.cooldown_remains_as_number) > (2))))))',
            condition_keywords = {
                'implosion.talent_selected',
                'spell_targets',
                'summon_darkglare.cooldown_remains',
                'summon_darkglare.talent_selected',
            },
            simc_line = 'actions+=/call_dreadstalkers,if=talent.summon_darkglare.enabled&(spell_targets.implosion<3|!talent.implosion.enabled)&cooldown.summon_darkglare.remains>2',
        },
        {
            action = 'call_dreadstalkers',
            condition = 'talent.summon_darkglare.enabled&(spell_targets.implosion<3|!talent.implosion.enabled)&prev_gcd.summon_darkglare',
            condition_converted = '((summon_darkglare.talent_selected) and ((((((((spell_targets_as_number) < (3))) or ((not (implosion.talent_selected)))))) and (prev_gcd.summon_darkglare))))',
            condition_keywords = {
                'implosion.talent_selected',
                'prev_gcd.summon_darkglare',
                'spell_targets',
                'summon_darkglare.talent_selected',
            },
            simc_line = 'actions+=/call_dreadstalkers,if=talent.summon_darkglare.enabled&(spell_targets.implosion<3|!talent.implosion.enabled)&prev_gcd.summon_darkglare',
        },
        {
            action = 'call_dreadstalkers',
            condition = 'talent.summon_darkglare.enabled&(spell_targets.implosion<3|!talent.implosion.enabled)&cooldown.summon_darkglare.remains<=action.call_dreadstalkers.cast_time&soul_shard>=3',
            condition_converted = '((summon_darkglare.talent_selected) and ((((((((spell_targets_as_number) < (3))) or ((not (implosion.talent_selected)))))) and (((((summon_darkglare.cooldown_remains_as_number) <= (call_dreadstalkers.spell_cast_time_as_number))) and (((soul_shard.curr_as_number) >= (3))))))))',
            condition_keywords = {
                'call_dreadstalkers.spell_cast_time',
                'implosion.talent_selected',
                'soul_shard.curr',
                'spell_targets',
                'summon_darkglare.cooldown_remains',
                'summon_darkglare.talent_selected',
            },
            simc_line = 'actions+=/call_dreadstalkers,if=talent.summon_darkglare.enabled&(spell_targets.implosion<3|!talent.implosion.enabled)&cooldown.summon_darkglare.remains<=action.call_dreadstalkers.cast_time&soul_shard>=3',
        },
        {
            action = 'call_dreadstalkers',
            condition = 'talent.summon_darkglare.enabled&(spell_targets.implosion<3|!talent.implosion.enabled)&cooldown.summon_darkglare.remains<=action.call_dreadstalkers.cast_time&soul_shard>=1&buff.demonic_calling.react',
            condition_converted = '((summon_darkglare.talent_selected) and ((((((((spell_targets_as_number) < (3))) or ((not (implosion.talent_selected)))))) and (((((summon_darkglare.cooldown_remains_as_number) <= (call_dreadstalkers.spell_cast_time_as_number))) and (((((soul_shard.curr_as_number) >= (1))) and (demonic_calling.spell_react))))))))',
            condition_keywords = {
                'call_dreadstalkers.spell_cast_time',
                'demonic_calling.spell_react',
                'implosion.talent_selected',
                'soul_shard.curr',
                'spell_targets',
                'summon_darkglare.cooldown_remains',
                'summon_darkglare.talent_selected',
            },
            simc_line = 'actions+=/call_dreadstalkers,if=talent.summon_darkglare.enabled&(spell_targets.implosion<3|!talent.implosion.enabled)&cooldown.summon_darkglare.remains<=action.call_dreadstalkers.cast_time&soul_shard>=1&buff.demonic_calling.react',
        },
        {
            action = 'hand_of_guldan',
            condition = 'soul_shard>=3&prev_gcd.call_dreadstalkers',
            condition_converted = '((((soul_shard.curr_as_number) >= (3))) and (prev_gcd.call_dreadstalkers))',
            condition_keywords = {
                'prev_gcd.call_dreadstalkers',
                'soul_shard.curr',
            },
            simc_line = 'actions+=/hand_of_guldan,if=soul_shard>=3&prev_gcd.call_dreadstalkers',
        },
        {
            action = 'hand_of_guldan',
            condition = 'soul_shard>=5&cooldown.summon_darkglare.remains<=action.hand_of_guldan.cast_time',
            condition_converted = '((((soul_shard.curr_as_number) >= (5))) and (((summon_darkglare.cooldown_remains_as_number) <= (hand_of_guldan.spell_cast_time_as_number))))',
            condition_keywords = {
                'hand_of_guldan.spell_cast_time',
                'soul_shard.curr',
                'summon_darkglare.cooldown_remains',
            },
            simc_line = 'actions+=/hand_of_guldan,if=soul_shard>=5&cooldown.summon_darkglare.remains<=action.hand_of_guldan.cast_time',
        },
        {
            action = 'hand_of_guldan',
            condition = 'soul_shard>=4&cooldown.summon_darkglare.remains>2',
            condition_converted = '((((soul_shard.curr_as_number) >= (4))) and (((summon_darkglare.cooldown_remains_as_number) > (2))))',
            condition_keywords = {
                'soul_shard.curr',
                'summon_darkglare.cooldown_remains',
            },
            simc_line = 'actions+=/hand_of_guldan,if=soul_shard>=4&cooldown.summon_darkglare.remains>2',
        },
        {
            action = 'demonic_empowerment',
            condition = 'wild_imp_no_de>3|prev_gcd.hand_of_guldan',
            condition_converted = '((((wild_imp_no_de_as_number) > (3))) or (prev_gcd.hand_of_guldan))',
            condition_keywords = {
                'prev_gcd.hand_of_guldan',
                'wild_imp_no_de',
            },
            simc_line = 'actions+=/demonic_empowerment,if=wild_imp_no_de>3|prev_gcd.hand_of_guldan',
        },
        {
            action = 'demonic_empowerment',
            condition = 'dreadstalker_no_de>0|darkglare_no_de>0|doomguard_no_de>0|infernal_no_de>0|service_no_de>0',
            condition_converted = '((((dreadstalker_no_de_as_number) > (0))) or (((((darkglare_no_de_as_number) > (0))) or (((((doomguard_no_de_as_number) > (0))) or (((((infernal_no_de_as_number) > (0))) or (((service_no_de_as_number) > (0))))))))))',
            condition_keywords = {
                'darkglare_no_de',
                'doomguard_no_de',
                'dreadstalker_no_de',
                'infernal_no_de',
                'service_no_de',
            },
            simc_line = 'actions+=/demonic_empowerment,if=dreadstalker_no_de>0|darkglare_no_de>0|doomguard_no_de>0|infernal_no_de>0|service_no_de>0',
        },
        {
            action = 'doom',
            condition = '!talent.hand_of_doom.enabled&target.time_to_die>duration&(!ticking|remains<duration*0.3)',
            condition_converted = '(((not (hand_of_doom.talent_selected))) and (((((target.time_to_die_as_number) > (doom.spell_duration_as_number))) and (((((doom.aura_remains == 0)) or (((doom.aura_remains_as_number) < ((doom.spell_duration_as_number * 0.3))))))))))',
            condition_keywords = {
                'doom.aura_remains',
                'doom.spell_duration',
                'hand_of_doom.talent_selected',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/doom,cycle_targets=1,if=!talent.hand_of_doom.enabled&target.time_to_die>duration&(!ticking|remains<duration*0.3)',
        },
        {
            action = 'potion',
            condition = 'buff.soul_harvest.remains|target.time_to_die<=45|trinket.proc.any.react',
            condition_converted = '((soul_harvest.aura_remains) or (((((target.time_to_die_as_number) <= (45))) or (trinket.proc.any.react))))',
            condition_keywords = {
                'soul_harvest.aura_remains',
                'target.time_to_die',
                'trinket.proc.any.react',
            },
            name = 'deadly_grace',
            simc_line = 'actions+=/potion,name=deadly_grace,if=buff.soul_harvest.remains|target.time_to_die<=45|trinket.proc.any.react',
        },
        {
            action = 'shadowflame',
            condition = 'charges=2',
            condition_converted = '((shadowflame.spell_charges) == (2))',
            condition_keywords = {
                'shadowflame.spell_charges',
            },
            simc_line = 'actions+=/shadowflame,if=charges=2',
        },
        {
            action = 'thalkiels_consumption',
            condition = '(dreadstalker_remaining_duration>execute_time|talent.implosion.enabled&spell_targets.implosion>=3)&wild_imp_count>3&wild_imp_remaining_duration>execute_time',
            condition_converted = '(((((((dreadstalker_remaining_duration_as_number) > (execute_time_as_number))) or (((implosion.talent_selected) and (((spell_targets_as_number) >= (3)))))))) and (((((wild_imp_count_as_number) > (3))) and (((wild_imp_remaining_duration_as_number) > (execute_time_as_number))))))',
            condition_keywords = {
                'dreadstalker_remaining_duration',
                'execute_time',
                'implosion.talent_selected',
                'spell_targets',
                'wild_imp_count',
                'wild_imp_remaining_duration',
            },
            simc_line = 'actions+=/thalkiels_consumption,if=(dreadstalker_remaining_duration>execute_time|talent.implosion.enabled&spell_targets.implosion>=3)&wild_imp_count>3&wild_imp_remaining_duration>execute_time',
        },
        {
            action = 'life_tap',
            condition = 'mana.pct<=30',
            condition_converted = '((mana.percent_as_number) <= (30))',
            condition_keywords = {
                'mana.percent',
            },
            simc_line = 'actions+=/life_tap,if=mana.pct<=30',
        },
        {
            action = 'demonwrath',
            chain = '1',
            condition = 'spell_targets.demonwrath>=3',
            condition_converted = '((spell_targets_as_number) >= (3))',
            condition_keywords = {
                'spell_targets',
            },
            interrupt = '1',
            simc_line = 'actions+=/demonwrath,chain=1,interrupt=1,if=spell_targets.demonwrath>=3',
        },
        {
            action = 'demonwrath',
            chain = '1',
            interrupt = '1',
            moving = '1',
            simc_line = 'actions+=/demonwrath,moving=1,chain=1,interrupt=1',
        },
    },
    precombat = {
        {
            action = 'flask',
            simc_line = 'actions.precombat=flask,type=whispered_pact',
            type = 'whispered_pact',
        },
        {
            action = 'food',
            simc_line = 'actions.precombat+=/food,type=azshari_salad',
            type = 'azshari_salad',
        },
        {
            action = 'summon_pet',
            condition = '!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)',
            condition_converted = '(((not (grimoire_of_supremacy.talent_selected))) and (((((not (grimoire_of_sacrifice.talent_selected))) or (demonic_power.aura_down)))))',
            condition_keywords = {
                'demonic_power.aura_down',
                'grimoire_of_sacrifice.talent_selected',
                'grimoire_of_supremacy.talent_selected',
            },
            simc_line = 'actions.precombat+=/summon_pet,if=!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)',
        },
        {
            action = 'summon_infernal',
            condition = 'talent.grimoire_of_supremacy.enabled&artifact.lord_of_flames.rank>0',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((lord_of_flames.artifact_rank_as_number) > (0))))',
            condition_keywords = {
                'grimoire_of_supremacy.talent_selected',
                'lord_of_flames.artifact_rank',
            },
            simc_line = 'actions.precombat+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&artifact.lord_of_flames.rank>0',
        },
        {
            action = 'summon_infernal',
            condition = 'talent.grimoire_of_supremacy.enabled&active_enemies>=3',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((active_enemies_as_number) >= (3))))',
            condition_keywords = {
                'active_enemies',
                'grimoire_of_supremacy.talent_selected',
            },
            simc_line = 'actions.precombat+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&active_enemies>=3',
        },
        {
            action = 'summon_doomguard',
            condition = 'talent.grimoire_of_supremacy.enabled&active_enemies<3&artifact.lord_of_flames.rank=0',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((((active_enemies_as_number) < (3))) and (((lord_of_flames.artifact_rank) == (0))))))',
            condition_keywords = {
                'active_enemies',
                'grimoire_of_supremacy.talent_selected',
                'lord_of_flames.artifact_rank',
            },
            simc_line = 'actions.precombat+=/summon_doomguard,if=talent.grimoire_of_supremacy.enabled&active_enemies<3&artifact.lord_of_flames.rank=0',
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
        {
            action = 'demonbolt',
            condition = 'talent.demonbolt.enabled',
            condition_converted = 'demonbolt.talent_selected',
            condition_keywords = {
                'demonbolt.talent_selected',
            },
            simc_line = 'actions.precombat+=/demonbolt,if=talent.demonbolt.enabled',
        },
        {
            action = 'shadow_bolt',
            condition = '!talent.demonbolt.enabled',
            condition_converted = '(not (demonbolt.talent_selected))',
            condition_keywords = {
                'demonbolt.talent_selected',
            },
            simc_line = 'actions.precombat+=/shadow_bolt,if=!talent.demonbolt.enabled',
        },
    },
}


-- keywords: legion-dev::warlock::destruction
---- active_enemies
---- backdraft.aura_remains
---- channel_demonfire.spell_cast_time
---- chaos_bolt.spell_cast_time
---- conflagrate.spell_charges
---- conflagrate.spell_recharge_time
---- conflagration_of_chaos.aura_remains
---- demonic_power.aura_down
---- dimensional_rift.spell_charges
---- doomguard.pet_active
---- equipped
---- gcd
---- grimoire_of_sacrifice.talent_selected
---- grimoire_of_supremacy.talent_selected
---- havoc.aura_remains
---- havoc.cooldown_remains
---- health.target_percent
---- immolate.aura_remains
---- immolate.spell_cast_time
---- immolate.spell_duration
---- immolate.spell_tick_time
---- lord_of_flames.artifact_rank
---- lord_of_flames.aura_remains
---- mana.percent
---- mana_tap.aura_remains
---- mana_tap.spell_duration
---- mana_tap.talent_selected
---- prev_gcd.incinerate
---- roaring_blaze.aura_remains
---- roaring_blaze.spell_stack
---- roaring_blaze.talent_selected
---- sindorei_spite_icd.cooldown_remains
---- soul_harvest.aura_remains
---- soul_shard.curr
---- spell_targets
---- target.time_to_die
---- trinket.proc.any.react
---- wreak_havoc.talent_selected

internal.actions['legion-dev::warlock::destruction'] = {
    default = {
        {
            action = 'havoc',
            condition = 'active_enemies>1&active_enemies<6&!debuff.havoc.remains',
            condition_converted = '((((active_enemies_as_number) > (1))) and (((((active_enemies_as_number) < (6))) and ((havoc.aura_remains == 0)))))',
            condition_keywords = {
                'active_enemies',
                'havoc.aura_remains',
            },
            simc_line = 'actions=havoc,target=2,if=active_enemies>1&active_enemies<6&!debuff.havoc.remains',
            target = '2',
        },
        {
            action = 'havoc',
            condition = 'active_enemies>1&!talent.wreak_havoc.enabled&talent.roaring_blaze.enabled&!debuff.roaring_blaze.remains',
            condition_converted = '((((active_enemies_as_number) > (1))) and ((((not (wreak_havoc.talent_selected))) and (((roaring_blaze.talent_selected) and ((roaring_blaze.aura_remains == 0)))))))',
            condition_keywords = {
                'active_enemies',
                'roaring_blaze.aura_remains',
                'roaring_blaze.talent_selected',
                'wreak_havoc.talent_selected',
            },
            simc_line = 'actions+=/havoc,target=2,if=active_enemies>1&!talent.wreak_havoc.enabled&talent.roaring_blaze.enabled&!debuff.roaring_blaze.remains',
            target = '2',
        },
        {
            action = 'dimensional_rift',
            condition = 'charges=3',
            condition_converted = '((dimensional_rift.spell_charges) == (3))',
            condition_keywords = {
                'dimensional_rift.spell_charges',
            },
            simc_line = 'actions+=/dimensional_rift,if=charges=3',
        },
        {
            action = 'immolate',
            condition = 'remains<=tick_time',
            condition_converted = '((immolate.aura_remains_as_number) <= (immolate.spell_tick_time_as_number))',
            condition_keywords = {
                'immolate.aura_remains',
                'immolate.spell_tick_time',
            },
            simc_line = 'actions+=/immolate,if=remains<=tick_time',
        },
        {
            action = 'immolate',
            condition = 'active_enemies>1&remains<=tick_time&!debuff.roaring_blaze.remains&action.conflagrate.charges<2',
            condition_converted = '((((active_enemies_as_number) > (1))) and (((((immolate.aura_remains_as_number) <= (immolate.spell_tick_time_as_number))) and ((((roaring_blaze.aura_remains == 0)) and (((conflagrate.spell_charges_as_number) < (2))))))))',
            condition_keywords = {
                'active_enemies',
                'conflagrate.spell_charges',
                'immolate.aura_remains',
                'immolate.spell_tick_time',
                'roaring_blaze.aura_remains',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/immolate,cycle_targets=1,if=active_enemies>1&remains<=tick_time&!debuff.roaring_blaze.remains&action.conflagrate.charges<2',
        },
        {
            action = 'immolate',
            condition = 'talent.roaring_blaze.enabled&remains<=duration&!debuff.roaring_blaze.remains&target.time_to_die>10&(action.conflagrate.charges=2|(action.conflagrate.charges>=1&action.conflagrate.recharge_time<cast_time+gcd)|target.time_to_die<24)',
            condition_converted = '((roaring_blaze.talent_selected) and (((((immolate.aura_remains_as_number) <= (immolate.spell_duration_as_number))) and ((((roaring_blaze.aura_remains == 0)) and (((((target.time_to_die_as_number) > (10))) and ((((((conflagrate.spell_charges) == (2))) or ((((((((conflagrate.spell_charges_as_number) >= (1))) and (((conflagrate.spell_recharge_time_as_number) < ((immolate.spell_cast_time_as_number + gcd_as_number))))))) or (((target.time_to_die_as_number) < (24)))))))))))))))',
            condition_keywords = {
                'conflagrate.spell_charges',
                'conflagrate.spell_recharge_time',
                'gcd',
                'immolate.aura_remains',
                'immolate.spell_cast_time',
                'immolate.spell_duration',
                'roaring_blaze.aura_remains',
                'roaring_blaze.talent_selected',
                'target.time_to_die',
            },
            simc_line = 'actions+=/immolate,if=talent.roaring_blaze.enabled&remains<=duration&!debuff.roaring_blaze.remains&target.time_to_die>10&(action.conflagrate.charges=2|(action.conflagrate.charges>=1&action.conflagrate.recharge_time<cast_time+gcd)|target.time_to_die<24)',
        },
        {
            action = 'potion',
            condition = '(buff.soul_harvest.remains|trinket.proc.any.react|target.time_to_die<=45)',
            condition_converted = '(((soul_harvest.aura_remains) or (((trinket.proc.any.react) or (((target.time_to_die_as_number) <= (45)))))))',
            condition_keywords = {
                'soul_harvest.aura_remains',
                'target.time_to_die',
                'trinket.proc.any.react',
            },
            name = 'deadly_grace',
            simc_line = 'actions+=/potion,name=deadly_grace,if=(buff.soul_harvest.remains|trinket.proc.any.react|target.time_to_die<=45)',
        },
        {
            action = 'conflagrate',
            condition = 'talent.roaring_blaze.enabled&(charges=2|(action.conflagrate.charges>=1&action.conflagrate.recharge_time<gcd)|target.time_to_die<24)',
            condition_converted = '((roaring_blaze.talent_selected) and ((((((conflagrate.spell_charges) == (2))) or ((((((((conflagrate.spell_charges_as_number) >= (1))) and (((conflagrate.spell_recharge_time_as_number) < (gcd_as_number)))))) or (((target.time_to_die_as_number) < (24)))))))))',
            condition_keywords = {
                'conflagrate.spell_charges',
                'conflagrate.spell_recharge_time',
                'gcd',
                'roaring_blaze.talent_selected',
                'target.time_to_die',
            },
            simc_line = 'actions+=/conflagrate,if=talent.roaring_blaze.enabled&(charges=2|(action.conflagrate.charges>=1&action.conflagrate.recharge_time<gcd)|target.time_to_die<24)',
        },
        {
            action = 'conflagrate',
            condition = 'talent.roaring_blaze.enabled&debuff.roaring_blaze.stack>0&dot.immolate.remains>dot.immolate.duration*0.3&(active_enemies=1|soul_shard<3)&soul_shard<5',
            condition_converted = '((roaring_blaze.talent_selected) and (((((roaring_blaze.spell_stack_as_number) > (0))) and (((((immolate.aura_remains_as_number) > ((immolate.spell_duration_as_number * 0.3)))) and ((((((((active_enemies) == (1))) or (((soul_shard.curr_as_number) < (3)))))) and (((soul_shard.curr_as_number) < (5))))))))))',
            condition_keywords = {
                'active_enemies',
                'immolate.aura_remains',
                'immolate.spell_duration',
                'roaring_blaze.spell_stack',
                'roaring_blaze.talent_selected',
                'soul_shard.curr',
            },
            simc_line = 'actions+=/conflagrate,if=talent.roaring_blaze.enabled&debuff.roaring_blaze.stack>0&dot.immolate.remains>dot.immolate.duration*0.3&(active_enemies=1|soul_shard<3)&soul_shard<5',
        },
        {
            action = 'conflagrate',
            condition = '!talent.roaring_blaze.enabled&!buff.backdraft.remains&buff.conflagration_of_chaos.remains<=action.chaos_bolt.cast_time',
            condition_converted = '(((not (roaring_blaze.talent_selected))) and ((((backdraft.aura_remains == 0)) and (((conflagration_of_chaos.aura_remains_as_number) <= (chaos_bolt.spell_cast_time_as_number))))))',
            condition_keywords = {
                'backdraft.aura_remains',
                'chaos_bolt.spell_cast_time',
                'conflagration_of_chaos.aura_remains',
                'roaring_blaze.talent_selected',
            },
            simc_line = 'actions+=/conflagrate,if=!talent.roaring_blaze.enabled&!buff.backdraft.remains&buff.conflagration_of_chaos.remains<=action.chaos_bolt.cast_time',
        },
        {
            action = 'conflagrate',
            condition = '!talent.roaring_blaze.enabled&!buff.backdraft.remains&(charges=1&recharge_time<action.chaos_bolt.cast_time|charges=2)&soul_shard<5',
            condition_converted = '(((not (roaring_blaze.talent_selected))) and ((((backdraft.aura_remains == 0)) and ((((((((((conflagrate.spell_charges) == (1))) and (((conflagrate.spell_recharge_time_as_number) < (chaos_bolt.spell_cast_time_as_number))))) or (((conflagrate.spell_charges) == (2)))))) and (((soul_shard.curr_as_number) < (5))))))))',
            condition_keywords = {
                'backdraft.aura_remains',
                'chaos_bolt.spell_cast_time',
                'conflagrate.spell_charges',
                'conflagrate.spell_recharge_time',
                'roaring_blaze.talent_selected',
                'soul_shard.curr',
            },
            simc_line = 'actions+=/conflagrate,if=!talent.roaring_blaze.enabled&!buff.backdraft.remains&(charges=1&recharge_time<action.chaos_bolt.cast_time|charges=2)&soul_shard<5',
        },
        {
            action = 'summon_infernal',
            condition = 'artifact.lord_of_flames.rank>0&!buff.lord_of_flames.remains',
            condition_converted = '((((lord_of_flames.artifact_rank_as_number) > (0))) and ((lord_of_flames.aura_remains == 0)))',
            condition_keywords = {
                'lord_of_flames.artifact_rank',
                'lord_of_flames.aura_remains',
            },
            simc_line = 'actions+=/summon_infernal,if=artifact.lord_of_flames.rank>0&!buff.lord_of_flames.remains',
        },
        {
            action = 'summon_doomguard',
            condition = '!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening<3&(target.time_to_die>180|target.health.pct<=20|target.time_to_die<30)',
            condition_converted = '(((not (grimoire_of_supremacy.talent_selected))) and (((((spell_targets_as_number) < (3))) and ((((((target.time_to_die_as_number) > (180))) or (((((health.target_percent_as_number) <= (20))) or (((target.time_to_die_as_number) < (30)))))))))))',
            condition_keywords = {
                'grimoire_of_supremacy.talent_selected',
                'health.target_percent',
                'spell_targets',
                'target.time_to_die',
            },
            simc_line = 'actions+=/summon_doomguard,if=!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening<3&(target.time_to_die>180|target.health.pct<=20|target.time_to_die<30)',
        },
        {
            action = 'summon_infernal',
            condition = '!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening>=3',
            condition_converted = '(((not (grimoire_of_supremacy.talent_selected))) and (((spell_targets_as_number) >= (3))))',
            condition_keywords = {
                'grimoire_of_supremacy.talent_selected',
                'spell_targets',
            },
            simc_line = 'actions+=/summon_infernal,if=!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening>=3',
        },
        {
            action = 'summon_doomguard',
            condition = 'talent.grimoire_of_supremacy.enabled&artifact.lord_of_flames.rank>0&buff.lord_of_flames.remains&!pet.doomguard.active',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((((lord_of_flames.artifact_rank_as_number) > (0))) and (((lord_of_flames.aura_remains) and ((not (doomguard.pet_active))))))))',
            condition_keywords = {
                'doomguard.pet_active',
                'grimoire_of_supremacy.talent_selected',
                'lord_of_flames.artifact_rank',
                'lord_of_flames.aura_remains',
            },
            simc_line = 'actions+=/summon_doomguard,if=talent.grimoire_of_supremacy.enabled&artifact.lord_of_flames.rank>0&buff.lord_of_flames.remains&!pet.doomguard.active',
        },
        {
            action = 'summon_doomguard',
            condition = 'talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal<3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((((spell_targets_as_number) < (3))) and (((equipped[132379]) and ((sindorei_spite_icd.cooldown_remains == 0)))))))',
            condition_keywords = {
                'equipped',
                'grimoire_of_supremacy.talent_selected',
                'sindorei_spite_icd.cooldown_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/summon_doomguard,if=talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal<3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
        },
        {
            action = 'summon_infernal',
            condition = 'talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal>=3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((((spell_targets_as_number) >= (3))) and (((equipped[132379]) and ((sindorei_spite_icd.cooldown_remains == 0)))))))',
            condition_keywords = {
                'equipped',
                'grimoire_of_supremacy.talent_selected',
                'sindorei_spite_icd.cooldown_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&spell_targets.summon_infernal>=3&equipped.132379&!cooldown.sindorei_spite_icd.remains',
        },
        {
            action = 'channel_demonfire',
            condition = 'dot.immolate.remains>cast_time',
            condition_converted = '((immolate.aura_remains_as_number) > (channel_demonfire.spell_cast_time_as_number))',
            condition_keywords = {
                'channel_demonfire.spell_cast_time',
                'immolate.aura_remains',
            },
            simc_line = 'actions+=/channel_demonfire,if=dot.immolate.remains>cast_time',
        },
        {
            action = 'chaos_bolt',
            condition = 'soul_shard>3|buff.backdraft.remains',
            condition_converted = '((((soul_shard.curr_as_number) > (3))) or (backdraft.aura_remains))',
            condition_keywords = {
                'backdraft.aura_remains',
                'soul_shard.curr',
            },
            simc_line = 'actions+=/chaos_bolt,if=soul_shard>3|buff.backdraft.remains',
        },
        {
            action = 'chaos_bolt',
            condition = 'buff.backdraft.remains&prev_gcd.incinerate',
            condition_converted = '((backdraft.aura_remains) and (prev_gcd.incinerate))',
            condition_keywords = {
                'backdraft.aura_remains',
                'prev_gcd.incinerate',
            },
            simc_line = 'actions+=/chaos_bolt,if=buff.backdraft.remains&prev_gcd.incinerate',
        },
        {
            action = 'incinerate',
            condition = 'buff.backdraft.remains',
            condition_converted = 'backdraft.aura_remains',
            condition_keywords = {
                'backdraft.aura_remains',
            },
            simc_line = 'actions+=/incinerate,if=buff.backdraft.remains',
        },
        {
            action = 'havoc',
            condition = 'active_enemies=1&talent.wreak_havoc.enabled&equipped.132375&!debuff.havoc.remains',
            condition_converted = '((((active_enemies) == (1))) and (((wreak_havoc.talent_selected) and (((equipped[132375]) and ((havoc.aura_remains == 0)))))))',
            condition_keywords = {
                'active_enemies',
                'equipped',
                'havoc.aura_remains',
                'wreak_havoc.talent_selected',
            },
            simc_line = 'actions+=/havoc,if=active_enemies=1&talent.wreak_havoc.enabled&equipped.132375&!debuff.havoc.remains',
        },
        {
            action = 'rain_of_fire',
            condition = 'active_enemies>=4&cooldown.havoc.remains<=12&!talent.wreak_havoc.enabled',
            condition_converted = '((((active_enemies_as_number) >= (4))) and (((((havoc.cooldown_remains_as_number) <= (12))) and ((not (wreak_havoc.talent_selected))))))',
            condition_keywords = {
                'active_enemies',
                'havoc.cooldown_remains',
                'wreak_havoc.talent_selected',
            },
            simc_line = 'actions+=/rain_of_fire,if=active_enemies>=4&cooldown.havoc.remains<=12&!talent.wreak_havoc.enabled',
        },
        {
            action = 'rain_of_fire',
            condition = 'active_enemies>=6&talent.wreak_havoc.enabled',
            condition_converted = '((((active_enemies_as_number) >= (6))) and (wreak_havoc.talent_selected))',
            condition_keywords = {
                'active_enemies',
                'wreak_havoc.talent_selected',
            },
            simc_line = 'actions+=/rain_of_fire,if=active_enemies>=6&talent.wreak_havoc.enabled',
        },
        {
            action = 'mana_tap',
            condition = 'buff.mana_tap.remains<=buff.mana_tap.duration*0.3&(mana.pct<20|buff.mana_tap.remains<=action.chaos_bolt.cast_time)&target.time_to_die>buff.mana_tap.duration*0.3',
            condition_converted = '((((mana_tap.aura_remains_as_number) <= ((mana_tap.spell_duration_as_number * 0.3)))) and ((((((((mana.percent_as_number) < (20))) or (((mana_tap.aura_remains_as_number) <= (chaos_bolt.spell_cast_time_as_number)))))) and (((target.time_to_die_as_number) > ((mana_tap.spell_duration_as_number * 0.3)))))))',
            condition_keywords = {
                'chaos_bolt.spell_cast_time',
                'mana.percent',
                'mana_tap.aura_remains',
                'mana_tap.spell_duration',
                'target.time_to_die',
            },
            simc_line = 'actions+=/mana_tap,if=buff.mana_tap.remains<=buff.mana_tap.duration*0.3&(mana.pct<20|buff.mana_tap.remains<=action.chaos_bolt.cast_time)&target.time_to_die>buff.mana_tap.duration*0.3',
        },
        {
            action = 'conflagrate',
            condition = '!talent.roaring_blaze.enabled&!buff.backdraft.remains',
            condition_converted = '(((not (roaring_blaze.talent_selected))) and ((backdraft.aura_remains == 0)))',
            condition_keywords = {
                'backdraft.aura_remains',
                'roaring_blaze.talent_selected',
            },
            simc_line = 'actions+=/conflagrate,if=!talent.roaring_blaze.enabled&!buff.backdraft.remains',
        },
        {
            action = 'immolate',
            condition = '!talent.roaring_blaze.enabled&remains<=duration*0.3',
            condition_converted = '(((not (roaring_blaze.talent_selected))) and (((immolate.aura_remains_as_number) <= ((immolate.spell_duration_as_number * 0.3)))))',
            condition_keywords = {
                'immolate.aura_remains',
                'immolate.spell_duration',
                'roaring_blaze.talent_selected',
            },
            simc_line = 'actions+=/immolate,if=!talent.roaring_blaze.enabled&remains<=duration*0.3',
        },
        {
            action = 'life_tap',
            condition = 'talent.mana_tap.enabled&mana.pct<=10',
            condition_converted = '((mana_tap.talent_selected) and (((mana.percent_as_number) <= (10))))',
            condition_keywords = {
                'mana.percent',
                'mana_tap.talent_selected',
            },
            simc_line = 'actions+=/life_tap,if=talent.mana_tap.enabled&mana.pct<=10',
        },
    },
    precombat = {
        {
            action = 'flask',
            simc_line = 'actions.precombat=flask,type=whispered_pact',
            type = 'whispered_pact',
        },
        {
            action = 'food',
            simc_line = 'actions.precombat+=/food,type=azshari_salad',
            type = 'azshari_salad',
        },
        {
            action = 'summon_pet',
            condition = '!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)',
            condition_converted = '(((not (grimoire_of_supremacy.talent_selected))) and (((((not (grimoire_of_sacrifice.talent_selected))) or (demonic_power.aura_down)))))',
            condition_keywords = {
                'demonic_power.aura_down',
                'grimoire_of_sacrifice.talent_selected',
                'grimoire_of_supremacy.talent_selected',
            },
            simc_line = 'actions.precombat+=/summon_pet,if=!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)',
        },
        {
            action = 'summon_infernal',
            condition = 'talent.grimoire_of_supremacy.enabled&artifact.lord_of_flames.rank>0',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((lord_of_flames.artifact_rank_as_number) > (0))))',
            condition_keywords = {
                'grimoire_of_supremacy.talent_selected',
                'lord_of_flames.artifact_rank',
            },
            simc_line = 'actions.precombat+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&artifact.lord_of_flames.rank>0',
        },
        {
            action = 'summon_infernal',
            condition = 'talent.grimoire_of_supremacy.enabled&active_enemies>=3',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((active_enemies_as_number) >= (3))))',
            condition_keywords = {
                'active_enemies',
                'grimoire_of_supremacy.talent_selected',
            },
            simc_line = 'actions.precombat+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&active_enemies>=3',
        },
        {
            action = 'summon_doomguard',
            condition = 'talent.grimoire_of_supremacy.enabled&active_enemies<3&artifact.lord_of_flames.rank=0',
            condition_converted = '((grimoire_of_supremacy.talent_selected) and (((((active_enemies_as_number) < (3))) and (((lord_of_flames.artifact_rank) == (0))))))',
            condition_keywords = {
                'active_enemies',
                'grimoire_of_supremacy.talent_selected',
                'lord_of_flames.artifact_rank',
            },
            simc_line = 'actions.precombat+=/summon_doomguard,if=talent.grimoire_of_supremacy.enabled&active_enemies<3&artifact.lord_of_flames.rank=0',
        },
        {
            action = 'augmentation',
            simc_line = 'actions.precombat+=/augmentation,type=defiled',
            type = 'defiled',
        },
        {
            action = 'grimoire_of_sacrifice',
            condition = 'talent.grimoire_of_sacrifice.enabled',
            condition_converted = 'grimoire_of_sacrifice.talent_selected',
            condition_keywords = {
                'grimoire_of_sacrifice.talent_selected',
            },
            simc_line = 'actions.precombat+=/grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled',
        },
        {
            action = 'potion',
            name = 'deadly_grace',
            simc_line = 'actions.precombat+=/potion,name=deadly_grace',
        },
        {
            action = 'mana_tap',
            condition = 'talent.mana_tap.enabled&!buff.mana_tap.remains',
            condition_converted = '((mana_tap.talent_selected) and ((mana_tap.aura_remains == 0)))',
            condition_keywords = {
                'mana_tap.aura_remains',
                'mana_tap.talent_selected',
            },
            simc_line = 'actions.precombat+=/mana_tap,if=talent.mana_tap.enabled&!buff.mana_tap.remains',
        },
    },
}


