local _, internal = ...
internal.actions = internal.actions or {}

-- keywords: legion-dev::priest::shadow
---- active_enemies
---- auspicious_spirits.talent_selected
---- bloodlust.aura_up
---- current_insanity_drain
---- fortress_of_the_mind.talent_selected
---- gcd
---- gcd_max
---- insanity.curr
---- insanity_drain_stacks.aura_stack
---- legacy_of_the_void.talent_selected
---- mass_hysteria.artifact_rank
---- mind_blast.spell_usable_in
---- mind_spike.talent_selected
---- mindbender.talent_selected
---- nonexecute_actors_percent
---- power_infusion.aura_up
---- raw_haste_percent
---- reaper_of_souls.talent_selected
---- sanlayn.talent_selected
---- set_bonus.tier18_2pc
---- shadow_crash.talent_selected
---- shadow_word_death.cooldown_charges
---- shadow_word_death.cooldown_up
---- shadow_word_pain.aura_remains
---- shadow_word_pain.aura_up
---- shadowform.aura_up
---- shadowy_apparitions_in_flight
---- shadowy_insight.aura_up
---- shadowy_insight.talent_selected
---- sphere_of_insanity.artifact_rank
---- surrender_to_madness.aura_up
---- surrender_to_madness.talent_selected
---- target.time_to_die
---- time_since_combat_start
---- unleash_the_shadows.artifact_rank
---- vampiric_touch.aura_remains
---- vampiric_touch.aura_up
---- variable.actors_fight_time_mod
---- variable.s2mcheck
---- void_bolt.cooldown_up
---- void_bolt.spell_usable
---- void_bolt.spell_usable_in
---- void_torrent.cooldown_up
---- voidform.aura_stack
---- voidform.aura_up

internal.actions['legion-dev::priest::shadow'] = {
    default = {
        {
            action = 'potion',
            condition = 'buff.bloodlust.react|target.time_to_die<=40|(buff.voidform.stack>80&buff.power_infusion.up)',
            condition_converted = '((bloodlust.aura_up) or (((((target.time_to_die_as_number) <= (40))) or ((((((voidform.aura_stack_as_number) > (80))) and (power_infusion.aura_up)))))))',
            condition_keywords = {
                'bloodlust.aura_up',
                'power_infusion.aura_up',
                'target.time_to_die',
                'voidform.aura_stack',
            },
            name = 'deadly_grace',
            simc_line = 'actions=potion,name=deadly_grace,if=buff.bloodlust.react|target.time_to_die<=40|(buff.voidform.stack>80&buff.power_infusion.up)',
        },
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'actors_fight_time_mod',
            op = 'set',
            simc_line = 'actions+=/variable,op=set,name=actors_fight_time_mod,value=0',
            value = '0',
            value_converted = '0',
        },
        {
            action = 'variable',
            condition = 'time+target.time_to_die>450&time+target.time_to_die<600',
            condition_converted = '(((((time_since_combat_start_as_number + target.time_to_die_as_number)) > (450))) and ((((time_since_combat_start_as_number + target.time_to_die_as_number)) < (600))))',
            condition_keywords = {
                'target.time_to_die',
                'time_since_combat_start',
            },
            name = 'actors_fight_time_mod',
            op = 'set',
            simc_line = 'actions+=/variable,op=set,name=actors_fight_time_mod,value=-((-(450)+(time+target.time_to_die))%10),if=time+target.time_to_die>450&time+target.time_to_die<600',
            value = '-((-(450)+(time+target.time_to_die))%10)',
            value_converted = ' - (((( - (450) + (time_since_combat_start_as_number + target.time_to_die_as_number))) / 10))',
            value_keywords = {
                'target.time_to_die',
                'time_since_combat_start',
            },
        },
        {
            action = 'variable',
            condition = 'time+target.time_to_die<=450',
            condition_converted = '(((time_since_combat_start_as_number + target.time_to_die_as_number)) <= (450))',
            condition_keywords = {
                'target.time_to_die',
                'time_since_combat_start',
            },
            name = 'actors_fight_time_mod',
            op = 'set',
            simc_line = 'actions+=/variable,op=set,name=actors_fight_time_mod,value=((450-(time+target.time_to_die))%5),if=time+target.time_to_die<=450',
            value = '((450-(time+target.time_to_die))%5)',
            value_converted = '((((450 - (time_since_combat_start_as_number + target.time_to_die_as_number))) / 5))',
            value_keywords = {
                'target.time_to_die',
                'time_since_combat_start',
            },
        },
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 's2mcheck',
            op = 'set',
            simc_line = 'actions+=/variable,op=set,name=s2mcheck,value=0.8*(135+((raw_haste_pct*25)*(2+(1*talent.reaper_of_souls.enabled)+(2*artifact.mass_hysteria.rank)-(1*talent.sanlayn.enabled))))-(variable.actors_fight_time_mod*nonexecute_actors_pct)',
            value = '0.8*(135+((raw_haste_pct*25)*(2+(1*talent.reaper_of_souls.enabled)+(2*artifact.mass_hysteria.rank)-(1*talent.sanlayn.enabled))))-(variable.actors_fight_time_mod*nonexecute_actors_pct)',
            value_converted = '((0.8 * ((135 + (((raw_haste_percent_as_number * 25) * ((2 + (1 * reaper_of_souls.talent_selected_as_number) + (2 * mass_hysteria.artifact_rank_as_number) - (1 * sanlayn.talent_selected_as_number)))))))) - (variable.actors_fight_time_mod_as_number * nonexecute_actors_percent_as_number))',
            value_keywords = {
                'mass_hysteria.artifact_rank',
                'nonexecute_actors_percent',
                'raw_haste_percent',
                'reaper_of_souls.talent_selected',
                'sanlayn.talent_selected',
                'variable.actors_fight_time_mod',
            },
        },
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 's2mcheck',
            op = 'min',
            simc_line = 'actions+=/variable,op=min,name=s2mcheck,value=180',
            value = '180',
            value_converted = '180',
        },
        {
            action = 'call_action_list',
            condition = 'buff.voidform.up&buff.surrender_to_madness.up',
            condition_converted = '((voidform.aura_up) and (surrender_to_madness.aura_up))',
            condition_keywords = {
                'surrender_to_madness.aura_up',
                'voidform.aura_up',
            },
            name = 's2m',
            simc_line = 'actions+=/call_action_list,name=s2m,if=buff.voidform.up&buff.surrender_to_madness.up',
        },
        {
            action = 'call_action_list',
            condition = 'buff.voidform.up',
            condition_converted = 'voidform.aura_up',
            condition_keywords = {
                'voidform.aura_up',
            },
            name = 'vf',
            simc_line = 'actions+=/call_action_list,name=vf,if=buff.voidform.up',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'main',
            simc_line = 'actions+=/call_action_list,name=main',
        },
    },
    main = {
        {
            action = 'surrender_to_madness',
            condition = 'talent.surrender_to_madness.enabled&target.time_to_die<=variable.s2mcheck',
            condition_converted = '((surrender_to_madness.talent_selected) and (((target.time_to_die_as_number) <= (variable.s2mcheck_as_number))))',
            condition_keywords = {
                'surrender_to_madness.talent_selected',
                'target.time_to_die',
                'variable.s2mcheck',
            },
            simc_line = 'actions.main=surrender_to_madness,if=talent.surrender_to_madness.enabled&target.time_to_die<=variable.s2mcheck',
        },
        {
            action = 'mindbender',
            condition = 'talent.mindbender.enabled&!talent.surrender_to_madness.enabled',
            condition_converted = '((mindbender.talent_selected) and ((not (surrender_to_madness.talent_selected))))',
            condition_keywords = {
                'mindbender.talent_selected',
                'surrender_to_madness.talent_selected',
            },
            simc_line = 'actions.main+=/mindbender,if=talent.mindbender.enabled&!talent.surrender_to_madness.enabled',
        },
        {
            action = 'mindbender',
            condition = 'talent.mindbender.enabled&talent.surrender_to_madness.enabled&target.time_to_die>variable.s2mcheck+60',
            condition_converted = '((mindbender.talent_selected) and (((surrender_to_madness.talent_selected) and (((target.time_to_die_as_number) > ((variable.s2mcheck_as_number + 60)))))))',
            condition_keywords = {
                'mindbender.talent_selected',
                'surrender_to_madness.talent_selected',
                'target.time_to_die',
                'variable.s2mcheck',
            },
            simc_line = 'actions.main+=/mindbender,if=talent.mindbender.enabled&talent.surrender_to_madness.enabled&target.time_to_die>variable.s2mcheck+60',
        },
        {
            action = 'shadow_word_pain',
            condition = 'dot.shadow_word_pain.remains<(3+(4%3))*gcd',
            condition_converted = '((shadow_word_pain.aura_remains_as_number) < ((((3 + (4 / 3))) * gcd_as_number)))',
            condition_keywords = {
                'gcd',
                'shadow_word_pain.aura_remains',
            },
            simc_line = 'actions.main+=/shadow_word_pain,if=dot.shadow_word_pain.remains<(3+(4%3))*gcd',
        },
        {
            action = 'vampiric_touch',
            condition = 'dot.vampiric_touch.remains<(4+(4%3))*gcd',
            condition_converted = '((vampiric_touch.aura_remains_as_number) < ((((4 + (4 / 3))) * gcd_as_number)))',
            condition_keywords = {
                'gcd',
                'vampiric_touch.aura_remains',
            },
            simc_line = 'actions.main+=/vampiric_touch,if=dot.vampiric_touch.remains<(4+(4%3))*gcd',
        },
        {
            action = 'void_eruption',
            condition = 'insanity>=85|(talent.auspicious_spirits.enabled&insanity>=(80-shadowy_apparitions_in_flight*4))',
            condition_converted = '((((insanity.curr_as_number) >= (85))) or ((((auspicious_spirits.talent_selected) and (((insanity.curr_as_number) >= (((80 - (shadowy_apparitions_in_flight_as_number * 4))))))))))',
            condition_keywords = {
                'auspicious_spirits.talent_selected',
                'insanity.curr',
                'shadowy_apparitions_in_flight',
            },
            simc_line = 'actions.main+=/void_eruption,if=insanity>=85|(talent.auspicious_spirits.enabled&insanity>=(80-shadowy_apparitions_in_flight*4))',
        },
        {
            action = 'shadow_crash',
            condition = 'talent.shadow_crash.enabled',
            condition_converted = 'shadow_crash.talent_selected',
            condition_keywords = {
                'shadow_crash.talent_selected',
            },
            simc_line = 'actions.main+=/shadow_crash,if=talent.shadow_crash.enabled',
        },
        {
            action = 'mindbender',
            condition = 'talent.mindbender.enabled&set_bonus.tier18_2pc',
            condition_converted = '((mindbender.talent_selected) and (set_bonus.tier18_2pc))',
            condition_keywords = {
                'mindbender.talent_selected',
                'set_bonus.tier18_2pc',
            },
            simc_line = 'actions.main+=/mindbender,if=talent.mindbender.enabled&set_bonus.tier18_2pc',
        },
        {
            action = 'shadow_word_pain',
            condition = '!ticking&talent.legacy_of_the_void.enabled&insanity>=70',
            condition_converted = '(((not (shadow_word_pain.aura_up))) and (((legacy_of_the_void.talent_selected) and (((insanity.curr_as_number) >= (70))))))',
            condition_keywords = {
                'insanity.curr',
                'legacy_of_the_void.talent_selected',
                'shadow_word_pain.aura_up',
            },
            cycle_targets = '1',
            simc_line = 'actions.main+=/shadow_word_pain,if=!ticking&talent.legacy_of_the_void.enabled&insanity>=70,cycle_targets=1',
        },
        {
            action = 'vampiric_touch',
            condition = '!ticking&talent.legacy_of_the_void.enabled&insanity>=70',
            condition_converted = '(((not (vampiric_touch.aura_up))) and (((legacy_of_the_void.talent_selected) and (((insanity.curr_as_number) >= (70))))))',
            condition_keywords = {
                'insanity.curr',
                'legacy_of_the_void.talent_selected',
                'vampiric_touch.aura_up',
            },
            cycle_targets = '1',
            simc_line = 'actions.main+=/vampiric_touch,if=!ticking&talent.legacy_of_the_void.enabled&insanity>=70,cycle_targets=1',
        },
        {
            action = 'shadow_word_death',
            condition = '!talent.reaper_of_souls.enabled&cooldown.shadow_word_death.charges=2&insanity<=90',
            condition_converted = '(((not (reaper_of_souls.talent_selected))) and (((((shadow_word_death.cooldown_charges) == (2))) and (((insanity.curr_as_number) <= (90))))))',
            condition_keywords = {
                'insanity.curr',
                'reaper_of_souls.talent_selected',
                'shadow_word_death.cooldown_charges',
            },
            simc_line = 'actions.main+=/shadow_word_death,if=!talent.reaper_of_souls.enabled&cooldown.shadow_word_death.charges=2&insanity<=90',
        },
        {
            action = 'shadow_word_death',
            condition = 'talent.reaper_of_souls.enabled&cooldown.shadow_word_death.charges=2&insanity<=70',
            condition_converted = '((reaper_of_souls.talent_selected) and (((((shadow_word_death.cooldown_charges) == (2))) and (((insanity.curr_as_number) <= (70))))))',
            condition_keywords = {
                'insanity.curr',
                'reaper_of_souls.talent_selected',
                'shadow_word_death.cooldown_charges',
            },
            simc_line = 'actions.main+=/shadow_word_death,if=talent.reaper_of_souls.enabled&cooldown.shadow_word_death.charges=2&insanity<=70',
        },
        {
            action = 'mind_blast',
            condition = 'talent.legacy_of_the_void.enabled&(insanity<=81|(insanity<=75.2&talent.fortress_of_the_mind.enabled))',
            condition_converted = '((legacy_of_the_void.talent_selected) and ((((((insanity.curr_as_number) <= (81))) or ((((((insanity.curr_as_number) <= (75.2))) and (fortress_of_the_mind.talent_selected))))))))',
            condition_keywords = {
                'fortress_of_the_mind.talent_selected',
                'insanity.curr',
                'legacy_of_the_void.talent_selected',
            },
            simc_line = 'actions.main+=/mind_blast,if=talent.legacy_of_the_void.enabled&(insanity<=81|(insanity<=75.2&talent.fortress_of_the_mind.enabled))',
        },
        {
            action = 'mind_blast',
            condition = '!talent.legacy_of_the_void.enabled|(insanity<=96|(insanity<=95.2&talent.fortress_of_the_mind.enabled))',
            condition_converted = '(((not (legacy_of_the_void.talent_selected))) or ((((((insanity.curr_as_number) <= (96))) or ((((((insanity.curr_as_number) <= (95.2))) and (fortress_of_the_mind.talent_selected))))))))',
            condition_keywords = {
                'fortress_of_the_mind.talent_selected',
                'insanity.curr',
                'legacy_of_the_void.talent_selected',
            },
            simc_line = 'actions.main+=/mind_blast,if=!talent.legacy_of_the_void.enabled|(insanity<=96|(insanity<=95.2&talent.fortress_of_the_mind.enabled))',
        },
        {
            action = 'shadow_word_pain',
            condition = '!ticking&target.time_to_die>10&(active_enemies<5&(talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled))',
            condition_converted = '(((not (shadow_word_pain.aura_up))) and (((((target.time_to_die_as_number) > (10))) and ((((((active_enemies_as_number) < (5))) and ((((auspicious_spirits.talent_selected) or (shadowy_insight.talent_selected))))))))))',
            condition_keywords = {
                'active_enemies',
                'auspicious_spirits.talent_selected',
                'shadow_word_pain.aura_up',
                'shadowy_insight.talent_selected',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.main+=/shadow_word_pain,if=!ticking&target.time_to_die>10&(active_enemies<5&(talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled)),cycle_targets=1',
        },
        {
            action = 'vampiric_touch',
            condition = '!ticking&target.time_to_die>10&(active_enemies<4|talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank))',
            condition_converted = '(((not (vampiric_touch.aura_up))) and (((((target.time_to_die_as_number) > (10))) and ((((((active_enemies_as_number) < (4))) or (((sanlayn.talent_selected) or ((((auspicious_spirits.talent_selected) and (unleash_the_shadows.artifact_rank))))))))))))',
            condition_keywords = {
                'active_enemies',
                'auspicious_spirits.talent_selected',
                'sanlayn.talent_selected',
                'target.time_to_die',
                'unleash_the_shadows.artifact_rank',
                'vampiric_touch.aura_up',
            },
            cycle_targets = '1',
            simc_line = 'actions.main+=/vampiric_touch,if=!ticking&target.time_to_die>10&(active_enemies<4|talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank)),cycle_targets=1',
        },
        {
            action = 'shadow_word_pain',
            condition = '!ticking&target.time_to_die>10&(active_enemies<5&artifact.sphere_of_insanity.rank)',
            condition_converted = '(((not (shadow_word_pain.aura_up))) and (((((target.time_to_die_as_number) > (10))) and ((((((active_enemies_as_number) < (5))) and (sphere_of_insanity.artifact_rank)))))))',
            condition_keywords = {
                'active_enemies',
                'shadow_word_pain.aura_up',
                'sphere_of_insanity.artifact_rank',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.main+=/shadow_word_pain,if=!ticking&target.time_to_die>10&(active_enemies<5&artifact.sphere_of_insanity.rank),cycle_targets=1',
        },
        {
            action = 'shadow_word_void',
            condition = '(insanity<=70&talent.legacy_of_the_void.enabled)|(insanity<=85&!talent.legacy_of_the_void.enabled)',
            condition_converted = '(((((((insanity.curr_as_number) <= (70))) and (legacy_of_the_void.talent_selected)))) or ((((((insanity.curr_as_number) <= (85))) and ((not (legacy_of_the_void.talent_selected)))))))',
            condition_keywords = {
                'insanity.curr',
                'legacy_of_the_void.talent_selected',
            },
            simc_line = 'actions.main+=/shadow_word_void,if=(insanity<=70&talent.legacy_of_the_void.enabled)|(insanity<=85&!talent.legacy_of_the_void.enabled)',
        },
        {
            action = 'mind_flay',
            chain = '1',
            condition = '!talent.mind_spike.enabled&active_enemies>=2&active_enemies<4',
            condition_converted = '(((not (mind_spike.talent_selected))) and (((((active_enemies_as_number) >= (2))) and (((active_enemies_as_number) < (4))))))',
            condition_keywords = {
                'active_enemies',
                'mind_spike.talent_selected',
            },
            interrupt = '1',
            line_cd = '10',
            simc_line = 'actions.main+=/mind_flay,line_cd=10,if=!talent.mind_spike.enabled&active_enemies>=2&active_enemies<4,interrupt=1,chain=1',
        },
        {
            action = 'mind_sear',
            chain = '1',
            condition = 'active_enemies>=2',
            condition_converted = '((active_enemies_as_number) >= (2))',
            condition_keywords = {
                'active_enemies',
            },
            interrupt = '1',
            simc_line = 'actions.main+=/mind_sear,if=active_enemies>=2,interrupt=1,chain=1',
        },
        {
            action = 'mind_flay',
            chain = '1',
            condition = '!talent.mind_spike.enabled',
            condition_converted = '(not (mind_spike.talent_selected))',
            condition_keywords = {
                'mind_spike.talent_selected',
            },
            interrupt = '1',
            simc_line = 'actions.main+=/mind_flay,if=!talent.mind_spike.enabled,interrupt=1,chain=1',
        },
        {
            action = 'mind_spike',
            condition = 'talent.mind_spike.enabled',
            condition_converted = 'mind_spike.talent_selected',
            condition_keywords = {
                'mind_spike.talent_selected',
            },
            simc_line = 'actions.main+=/mind_spike,if=talent.mind_spike.enabled',
        },
        {
            action = 'shadow_word_pain',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.main+=/shadow_word_pain',
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
            action = 'shadowform',
            condition = '!buff.shadowform.up',
            condition_converted = '(not (shadowform.aura_up))',
            condition_keywords = {
                'shadowform.aura_up',
            },
            simc_line = 'actions.precombat+=/shadowform,if=!buff.shadowform.up',
        },
        {
            action = 'mind_blast',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/mind_blast',
        },
    },
    s2m = {
        {
            action = 'shadow_crash',
            condition = 'talent.shadow_crash.enabled',
            condition_converted = 'shadow_crash.talent_selected',
            condition_keywords = {
                'shadow_crash.talent_selected',
            },
            simc_line = 'actions.s2m=shadow_crash,if=talent.shadow_crash.enabled',
        },
        {
            action = 'mindbender',
            condition = 'talent.mindbender.enabled',
            condition_converted = 'mindbender.talent_selected',
            condition_keywords = {
                'mindbender.talent_selected',
            },
            simc_line = 'actions.s2m+=/mindbender,if=talent.mindbender.enabled',
        },
        {
            action = 'void_torrent',
            condition = 'dot.shadow_word_pain.remains>5.5&dot.vampiric_touch.remains>5.5',
            condition_converted = '((((shadow_word_pain.aura_remains_as_number) > (5.5))) and (((vampiric_touch.aura_remains_as_number) > (5.5))))',
            condition_keywords = {
                'shadow_word_pain.aura_remains',
                'vampiric_touch.aura_remains',
            },
            simc_line = 'actions.s2m+=/void_torrent,if=dot.shadow_word_pain.remains>5.5&dot.vampiric_touch.remains>5.5',
        },
        {
            action = 'berserking',
            condition = 'buff.voidform.stack>=80',
            condition_converted = '((voidform.aura_stack_as_number) >= (80))',
            condition_keywords = {
                'voidform.aura_stack',
            },
            simc_line = 'actions.s2m+=/berserking,if=buff.voidform.stack>=80',
        },
        {
            action = 'shadow_word_death',
            condition = '!talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+15)<100&!buff.power_infusion.up&buff.insanity_drain_stacks.stack<=77&cooldown.shadow_word_death.charges=2',
            condition_converted = '(((not (reaper_of_souls.talent_selected))) and ((((((current_insanity_drain_as_number * gcd_max_as_number)) > (insanity.curr_as_number))) and (((((((insanity.curr_as_number - (current_insanity_drain_as_number * gcd_max_as_number) + 15))) < (100))) and ((((not (power_infusion.aura_up))) and (((((insanity_drain_stacks.aura_stack_as_number) <= (77))) and (((shadow_word_death.cooldown_charges) == (2))))))))))))',
            condition_keywords = {
                'current_insanity_drain',
                'gcd_max',
                'insanity.curr',
                'insanity_drain_stacks.aura_stack',
                'power_infusion.aura_up',
                'reaper_of_souls.talent_selected',
                'shadow_word_death.cooldown_charges',
            },
            simc_line = 'actions.s2m+=/shadow_word_death,if=!talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+15)<100&!buff.power_infusion.up&buff.insanity_drain_stacks.stack<=77&cooldown.shadow_word_death.charges=2',
        },
        {
            action = 'shadow_word_death',
            condition = 'talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+65)<100&!buff.power_infusion.up&buff.insanity_drain_stacks.stack<=77&cooldown.shadow_word_death.charges=2',
            condition_converted = '((reaper_of_souls.talent_selected) and ((((((current_insanity_drain_as_number * gcd_max_as_number)) > (insanity.curr_as_number))) and (((((((insanity.curr_as_number - (current_insanity_drain_as_number * gcd_max_as_number) + 65))) < (100))) and ((((not (power_infusion.aura_up))) and (((((insanity_drain_stacks.aura_stack_as_number) <= (77))) and (((shadow_word_death.cooldown_charges) == (2))))))))))))',
            condition_keywords = {
                'current_insanity_drain',
                'gcd_max',
                'insanity.curr',
                'insanity_drain_stacks.aura_stack',
                'power_infusion.aura_up',
                'reaper_of_souls.talent_selected',
                'shadow_word_death.cooldown_charges',
            },
            simc_line = 'actions.s2m+=/shadow_word_death,if=talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+65)<100&!buff.power_infusion.up&buff.insanity_drain_stacks.stack<=77&cooldown.shadow_word_death.charges=2',
        },
        {
            action = 'void_bolt',
            condition = 'dot.shadow_word_pain.remains<3.5*gcd&dot.vampiric_touch.remains<3.5*gcd&target.time_to_die>10',
            condition_converted = '((((shadow_word_pain.aura_remains_as_number) < ((3.5 * gcd_as_number)))) and (((((vampiric_touch.aura_remains_as_number) < ((3.5 * gcd_as_number)))) and (((target.time_to_die_as_number) > (10))))))',
            condition_keywords = {
                'gcd',
                'shadow_word_pain.aura_remains',
                'target.time_to_die',
                'vampiric_touch.aura_remains',
            },
            cycle_targets = '1',
            simc_line = 'actions.s2m+=/void_bolt,if=dot.shadow_word_pain.remains<3.5*gcd&dot.vampiric_touch.remains<3.5*gcd&target.time_to_die>10,cycle_targets=1',
        },
        {
            action = 'void_bolt',
            condition = 'dot.shadow_word_pain.remains<3.5*gcd&(talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled)&target.time_to_die>10',
            condition_converted = '((((shadow_word_pain.aura_remains_as_number) < ((3.5 * gcd_as_number)))) and ((((((auspicious_spirits.talent_selected) or (shadowy_insight.talent_selected)))) and (((target.time_to_die_as_number) > (10))))))',
            condition_keywords = {
                'auspicious_spirits.talent_selected',
                'gcd',
                'shadow_word_pain.aura_remains',
                'shadowy_insight.talent_selected',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.s2m+=/void_bolt,if=dot.shadow_word_pain.remains<3.5*gcd&(talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled)&target.time_to_die>10,cycle_targets=1',
        },
        {
            action = 'void_bolt',
            condition = 'dot.vampiric_touch.remains<3.5*gcd&(talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank))&target.time_to_die>10',
            condition_converted = '((((vampiric_touch.aura_remains_as_number) < ((3.5 * gcd_as_number)))) and ((((((sanlayn.talent_selected) or ((((auspicious_spirits.talent_selected) and (unleash_the_shadows.artifact_rank))))))) and (((target.time_to_die_as_number) > (10))))))',
            condition_keywords = {
                'auspicious_spirits.talent_selected',
                'gcd',
                'sanlayn.talent_selected',
                'target.time_to_die',
                'unleash_the_shadows.artifact_rank',
                'vampiric_touch.aura_remains',
            },
            cycle_targets = '1',
            simc_line = 'actions.s2m+=/void_bolt,if=dot.vampiric_touch.remains<3.5*gcd&(talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank))&target.time_to_die>10,cycle_targets=1',
        },
        {
            action = 'void_bolt',
            condition = 'dot.shadow_word_pain.remains<3.5*gcd&artifact.sphere_of_insanity.rank&target.time_to_die>10',
            condition_converted = '((((shadow_word_pain.aura_remains_as_number) < ((3.5 * gcd_as_number)))) and (((sphere_of_insanity.artifact_rank) and (((target.time_to_die_as_number) > (10))))))',
            condition_keywords = {
                'gcd',
                'shadow_word_pain.aura_remains',
                'sphere_of_insanity.artifact_rank',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.s2m+=/void_bolt,if=dot.shadow_word_pain.remains<3.5*gcd&artifact.sphere_of_insanity.rank&target.time_to_die>10,cycle_targets=1',
        },
        {
            action = 'void_bolt',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.s2m+=/void_bolt',
        },
        {
            action = 'shadow_word_death',
            condition = '!talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+15)<100',
            condition_converted = '(((not (reaper_of_souls.talent_selected))) and ((((((current_insanity_drain_as_number * gcd_max_as_number)) > (insanity.curr_as_number))) and (((((insanity.curr_as_number - (current_insanity_drain_as_number * gcd_max_as_number) + 15))) < (100))))))',
            condition_keywords = {
                'current_insanity_drain',
                'gcd_max',
                'insanity.curr',
                'reaper_of_souls.talent_selected',
            },
            simc_line = 'actions.s2m+=/shadow_word_death,if=!talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+15)<100',
        },
        {
            action = 'shadow_word_death',
            condition = 'talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+65)<100',
            condition_converted = '((reaper_of_souls.talent_selected) and ((((((current_insanity_drain_as_number * gcd_max_as_number)) > (insanity.curr_as_number))) and (((((insanity.curr_as_number - (current_insanity_drain_as_number * gcd_max_as_number) + 65))) < (100))))))',
            condition_keywords = {
                'current_insanity_drain',
                'gcd_max',
                'insanity.curr',
                'reaper_of_souls.talent_selected',
            },
            simc_line = 'actions.s2m+=/shadow_word_death,if=talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+65)<100',
        },
        {
            action = 'power_infusion',
            condition = 'buff.insanity_drain_stacks.stack>=77',
            condition_converted = '((insanity_drain_stacks.aura_stack_as_number) >= (77))',
            condition_keywords = {
                'insanity_drain_stacks.aura_stack',
            },
            simc_line = 'actions.s2m+=/power_infusion,if=buff.insanity_drain_stacks.stack>=77',
        },
        {
            action = 'wait',
            condition = 'action.void_bolt.usable_in<gcd_max*0.28',
            condition_converted = '((void_bolt.spell_usable_in_as_number) < ((gcd_max_as_number * 0.28)))',
            condition_keywords = {
                'gcd_max',
                'void_bolt.spell_usable_in',
            },
            sec = 'action.void_bolt.usable_in',
            simc_line = 'actions.s2m+=/wait,sec=action.void_bolt.usable_in,if=action.void_bolt.usable_in<gcd_max*0.28',
        },
        {
            action = 'dispersion',
            condition = 'current_insanity_drain*gcd_max>insanity&!buff.power_infusion.up',
            condition_converted = '(((((current_insanity_drain_as_number * gcd_max_as_number)) > (insanity.curr_as_number))) and ((not (power_infusion.aura_up))))',
            condition_keywords = {
                'current_insanity_drain',
                'gcd_max',
                'insanity.curr',
                'power_infusion.aura_up',
            },
            simc_line = 'actions.s2m+=/dispersion,if=current_insanity_drain*gcd_max>insanity&!buff.power_infusion.up',
        },
        {
            action = 'mind_blast',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.s2m+=/mind_blast',
        },
        {
            action = 'wait',
            condition = 'action.mind_blast.usable_in<gcd_max*0.28',
            condition_converted = '((mind_blast.spell_usable_in_as_number) < ((gcd_max_as_number * 0.28)))',
            condition_keywords = {
                'gcd_max',
                'mind_blast.spell_usable_in',
            },
            sec = 'action.mind_blast.usable_in',
            simc_line = 'actions.s2m+=/wait,sec=action.mind_blast.usable_in,if=action.mind_blast.usable_in<gcd_max*0.28',
        },
        {
            action = 'shadow_word_death',
            condition = 'cooldown.shadow_word_death.charges=2',
            condition_converted = '((shadow_word_death.cooldown_charges) == (2))',
            condition_keywords = {
                'shadow_word_death.cooldown_charges',
            },
            simc_line = 'actions.s2m+=/shadow_word_death,if=cooldown.shadow_word_death.charges=2',
        },
        {
            action = 'shadowfiend',
            condition = 'buff.voidform.stack>15',
            condition_converted = '((voidform.aura_stack_as_number) > (15))',
            condition_keywords = {
                'voidform.aura_stack',
            },
            simc_line = 'actions.s2m+=/shadowfiend,if=!talent.mindbender.enabled,if=buff.voidform.stack>15',
        },
        {
            action = 'shadow_word_void',
            condition = '(insanity-(current_insanity_drain*gcd_max)+75)<100',
            condition_converted = '((((insanity.curr_as_number - (current_insanity_drain_as_number * gcd_max_as_number) + 75))) < (100))',
            condition_keywords = {
                'current_insanity_drain',
                'gcd_max',
                'insanity.curr',
            },
            simc_line = 'actions.s2m+=/shadow_word_void,if=(insanity-(current_insanity_drain*gcd_max)+75)<100',
        },
        {
            action = 'shadow_word_pain',
            condition = '!ticking&(active_enemies<5|talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled|artifact.sphere_of_insanity.rank)',
            condition_converted = '(((not (shadow_word_pain.aura_up))) and ((((((active_enemies_as_number) < (5))) or (((auspicious_spirits.talent_selected) or (((shadowy_insight.talent_selected) or (sphere_of_insanity.artifact_rank)))))))))',
            condition_keywords = {
                'active_enemies',
                'auspicious_spirits.talent_selected',
                'shadow_word_pain.aura_up',
                'shadowy_insight.talent_selected',
                'sphere_of_insanity.artifact_rank',
            },
            simc_line = 'actions.s2m+=/shadow_word_pain,if=!ticking&(active_enemies<5|talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled|artifact.sphere_of_insanity.rank)',
        },
        {
            action = 'vampiric_touch',
            condition = '!ticking&(active_enemies<4|talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank))',
            condition_converted = '(((not (vampiric_touch.aura_up))) and ((((((active_enemies_as_number) < (4))) or (((sanlayn.talent_selected) or ((((auspicious_spirits.talent_selected) and (unleash_the_shadows.artifact_rank))))))))))',
            condition_keywords = {
                'active_enemies',
                'auspicious_spirits.talent_selected',
                'sanlayn.talent_selected',
                'unleash_the_shadows.artifact_rank',
                'vampiric_touch.aura_up',
            },
            simc_line = 'actions.s2m+=/vampiric_touch,if=!ticking&(active_enemies<4|talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank))',
        },
        {
            action = 'shadow_word_pain',
            condition = '!ticking&target.time_to_die>10&(active_enemies<5&(talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled))',
            condition_converted = '(((not (shadow_word_pain.aura_up))) and (((((target.time_to_die_as_number) > (10))) and ((((((active_enemies_as_number) < (5))) and ((((auspicious_spirits.talent_selected) or (shadowy_insight.talent_selected))))))))))',
            condition_keywords = {
                'active_enemies',
                'auspicious_spirits.talent_selected',
                'shadow_word_pain.aura_up',
                'shadowy_insight.talent_selected',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.s2m+=/shadow_word_pain,if=!ticking&target.time_to_die>10&(active_enemies<5&(talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled)),cycle_targets=1',
        },
        {
            action = 'vampiric_touch',
            condition = '!ticking&target.time_to_die>10&(active_enemies<4|talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank))',
            condition_converted = '(((not (vampiric_touch.aura_up))) and (((((target.time_to_die_as_number) > (10))) and ((((((active_enemies_as_number) < (4))) or (((sanlayn.talent_selected) or ((((auspicious_spirits.talent_selected) and (unleash_the_shadows.artifact_rank))))))))))))',
            condition_keywords = {
                'active_enemies',
                'auspicious_spirits.talent_selected',
                'sanlayn.talent_selected',
                'target.time_to_die',
                'unleash_the_shadows.artifact_rank',
                'vampiric_touch.aura_up',
            },
            cycle_targets = '1',
            simc_line = 'actions.s2m+=/vampiric_touch,if=!ticking&target.time_to_die>10&(active_enemies<4|talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank)),cycle_targets=1',
        },
        {
            action = 'shadow_word_pain',
            condition = '!ticking&target.time_to_die>10&(active_enemies<5&artifact.sphere_of_insanity.rank)',
            condition_converted = '(((not (shadow_word_pain.aura_up))) and (((((target.time_to_die_as_number) > (10))) and ((((((active_enemies_as_number) < (5))) and (sphere_of_insanity.artifact_rank)))))))',
            condition_keywords = {
                'active_enemies',
                'shadow_word_pain.aura_up',
                'sphere_of_insanity.artifact_rank',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.s2m+=/shadow_word_pain,if=!ticking&target.time_to_die>10&(active_enemies<5&artifact.sphere_of_insanity.rank),cycle_targets=1',
        },
        {
            action = 'wait',
            condition = 'action.void_bolt.usable|action.void_bolt.usable_in<gcd_max*0.8',
            condition_converted = '((void_bolt.spell_usable) or (((void_bolt.spell_usable_in_as_number) < ((gcd_max_as_number * 0.8)))))',
            condition_keywords = {
                'gcd_max',
                'void_bolt.spell_usable',
                'void_bolt.spell_usable_in',
            },
            sec = 'action.void_bolt.usable_in',
            simc_line = 'actions.s2m+=/wait,sec=action.void_bolt.usable_in,if=action.void_bolt.usable|action.void_bolt.usable_in<gcd_max*0.8',
        },
        {
            action = 'mind_flay',
            chain = '1',
            condition = '!talent.mind_spike.enabled&active_enemies>=2&active_enemies<4',
            condition_converted = '(((not (mind_spike.talent_selected))) and (((((active_enemies_as_number) >= (2))) and (((active_enemies_as_number) < (4))))))',
            condition_keywords = {
                'active_enemies',
                'mind_spike.talent_selected',
            },
            interrupt_if = 'action.void_bolt.usable',
            interrupt_immediate = '1',
            line_cd = '10',
            simc_line = 'actions.s2m+=/mind_flay,line_cd=10,if=!talent.mind_spike.enabled&active_enemies>=2&active_enemies<4,chain=1,interrupt_immediate=1,interrupt_if=action.void_bolt.usable',
        },
        {
            action = 'mind_sear',
            condition = 'active_enemies>=2',
            condition_converted = '((active_enemies_as_number) >= (2))',
            condition_keywords = {
                'active_enemies',
            },
            interrupt = '1',
            simc_line = 'actions.s2m+=/mind_sear,if=active_enemies>=2,interrupt=1',
        },
        {
            action = 'mind_flay',
            chain = '1',
            condition = '!talent.mind_spike.enabled',
            condition_converted = '(not (mind_spike.talent_selected))',
            condition_keywords = {
                'mind_spike.talent_selected',
            },
            interrupt_if = 'action.void_bolt.usable',
            interrupt_immediate = '1',
            simc_line = 'actions.s2m+=/mind_flay,if=!talent.mind_spike.enabled,chain=1,interrupt_immediate=1,interrupt_if=action.void_bolt.usable',
        },
        {
            action = 'mind_spike',
            condition = 'talent.mind_spike.enabled',
            condition_converted = 'mind_spike.talent_selected',
            condition_keywords = {
                'mind_spike.talent_selected',
            },
            simc_line = 'actions.s2m+=/mind_spike,if=talent.mind_spike.enabled',
        },
    },
    vf = {
        {
            action = 'surrender_to_madness',
            condition = 'talent.surrender_to_madness.enabled&insanity>=25&(cooldown.void_bolt.up|cooldown.void_torrent.up|cooldown.shadow_word_death.up|buff.shadowy_insight.up)&target.time_to_die<=variable.s2mcheck-(buff.insanity_drain_stacks.stack)',
            condition_converted = '((surrender_to_madness.talent_selected) and (((((insanity.curr_as_number) >= (25))) and ((((((void_bolt.cooldown_up) or (((void_torrent.cooldown_up) or (((shadow_word_death.cooldown_up) or (shadowy_insight.aura_up)))))))) and (((target.time_to_die_as_number) <= ((variable.s2mcheck_as_number - (insanity_drain_stacks.aura_stack_as_number))))))))))',
            condition_keywords = {
                'insanity.curr',
                'insanity_drain_stacks.aura_stack',
                'shadow_word_death.cooldown_up',
                'shadowy_insight.aura_up',
                'surrender_to_madness.talent_selected',
                'target.time_to_die',
                'variable.s2mcheck',
                'void_bolt.cooldown_up',
                'void_torrent.cooldown_up',
            },
            simc_line = 'actions.vf=surrender_to_madness,if=talent.surrender_to_madness.enabled&insanity>=25&(cooldown.void_bolt.up|cooldown.void_torrent.up|cooldown.shadow_word_death.up|buff.shadowy_insight.up)&target.time_to_die<=variable.s2mcheck-(buff.insanity_drain_stacks.stack)',
        },
        {
            action = 'shadow_crash',
            condition = 'talent.shadow_crash.enabled',
            condition_converted = 'shadow_crash.talent_selected',
            condition_keywords = {
                'shadow_crash.talent_selected',
            },
            simc_line = 'actions.vf+=/shadow_crash,if=talent.shadow_crash.enabled',
        },
        {
            action = 'void_torrent',
            condition = 'dot.shadow_word_pain.remains>5.5&dot.vampiric_touch.remains>5.5&talent.surrender_to_madness.enabled&target.time_to_die>variable.s2mcheck-(buff.insanity_drain_stacks.stack)+60',
            condition_converted = '((((shadow_word_pain.aura_remains_as_number) > (5.5))) and (((((vampiric_touch.aura_remains_as_number) > (5.5))) and (((surrender_to_madness.talent_selected) and (((target.time_to_die_as_number) > ((variable.s2mcheck_as_number - (insanity_drain_stacks.aura_stack_as_number) + 60)))))))))',
            condition_keywords = {
                'insanity_drain_stacks.aura_stack',
                'shadow_word_pain.aura_remains',
                'surrender_to_madness.talent_selected',
                'target.time_to_die',
                'vampiric_touch.aura_remains',
                'variable.s2mcheck',
            },
            simc_line = 'actions.vf+=/void_torrent,if=dot.shadow_word_pain.remains>5.5&dot.vampiric_touch.remains>5.5&talent.surrender_to_madness.enabled&target.time_to_die>variable.s2mcheck-(buff.insanity_drain_stacks.stack)+60',
        },
        {
            action = 'void_torrent',
            condition = '!talent.surrender_to_madness.enabled',
            condition_converted = '(not (surrender_to_madness.talent_selected))',
            condition_keywords = {
                'surrender_to_madness.talent_selected',
            },
            simc_line = 'actions.vf+=/void_torrent,if=!talent.surrender_to_madness.enabled',
        },
        {
            action = 'mindbender',
            condition = 'talent.mindbender.enabled&!talent.surrender_to_madness.enabled',
            condition_converted = '((mindbender.talent_selected) and ((not (surrender_to_madness.talent_selected))))',
            condition_keywords = {
                'mindbender.talent_selected',
                'surrender_to_madness.talent_selected',
            },
            simc_line = 'actions.vf+=/mindbender,if=talent.mindbender.enabled&!talent.surrender_to_madness.enabled',
        },
        {
            action = 'mindbender',
            condition = 'talent.mindbender.enabled&talent.surrender_to_madness.enabled&target.time_to_die>variable.s2mcheck-(buff.insanity_drain_stacks.stack)+30',
            condition_converted = '((mindbender.talent_selected) and (((surrender_to_madness.talent_selected) and (((target.time_to_die_as_number) > ((variable.s2mcheck_as_number - (insanity_drain_stacks.aura_stack_as_number) + 30)))))))',
            condition_keywords = {
                'insanity_drain_stacks.aura_stack',
                'mindbender.talent_selected',
                'surrender_to_madness.talent_selected',
                'target.time_to_die',
                'variable.s2mcheck',
            },
            simc_line = 'actions.vf+=/mindbender,if=talent.mindbender.enabled&talent.surrender_to_madness.enabled&target.time_to_die>variable.s2mcheck-(buff.insanity_drain_stacks.stack)+30',
        },
        {
            action = 'power_infusion',
            condition = 'buff.voidform.stack>=10&buff.insanity_drain_stacks.stack<=30&!talent.surrender_to_madness.enabled',
            condition_converted = '((((voidform.aura_stack_as_number) >= (10))) and (((((insanity_drain_stacks.aura_stack_as_number) <= (30))) and ((not (surrender_to_madness.talent_selected))))))',
            condition_keywords = {
                'insanity_drain_stacks.aura_stack',
                'surrender_to_madness.talent_selected',
                'voidform.aura_stack',
            },
            simc_line = 'actions.vf+=/power_infusion,if=buff.voidform.stack>=10&buff.insanity_drain_stacks.stack<=30&!talent.surrender_to_madness.enabled',
        },
        {
            action = 'power_infusion',
            condition = 'buff.voidform.stack>=10&talent.surrender_to_madness.enabled&target.time_to_die>variable.s2mcheck-(buff.insanity_drain_stacks.stack)+25',
            condition_converted = '((((voidform.aura_stack_as_number) >= (10))) and (((surrender_to_madness.talent_selected) and (((target.time_to_die_as_number) > ((variable.s2mcheck_as_number - (insanity_drain_stacks.aura_stack_as_number) + 25)))))))',
            condition_keywords = {
                'insanity_drain_stacks.aura_stack',
                'surrender_to_madness.talent_selected',
                'target.time_to_die',
                'variable.s2mcheck',
                'voidform.aura_stack',
            },
            simc_line = 'actions.vf+=/power_infusion,if=buff.voidform.stack>=10&talent.surrender_to_madness.enabled&target.time_to_die>variable.s2mcheck-(buff.insanity_drain_stacks.stack)+25',
        },
        {
            action = 'berserking',
            condition = 'buff.voidform.stack>=10&buff.insanity_drain_stacks.stack<=20&!talent.surrender_to_madness.enabled',
            condition_converted = '((((voidform.aura_stack_as_number) >= (10))) and (((((insanity_drain_stacks.aura_stack_as_number) <= (20))) and ((not (surrender_to_madness.talent_selected))))))',
            condition_keywords = {
                'insanity_drain_stacks.aura_stack',
                'surrender_to_madness.talent_selected',
                'voidform.aura_stack',
            },
            simc_line = 'actions.vf+=/berserking,if=buff.voidform.stack>=10&buff.insanity_drain_stacks.stack<=20&!talent.surrender_to_madness.enabled',
        },
        {
            action = 'berserking',
            condition = 'buff.voidform.stack>=10&talent.surrender_to_madness.enabled&target.time_to_die>variable.s2mcheck-(buff.insanity_drain_stacks.stack)+60',
            condition_converted = '((((voidform.aura_stack_as_number) >= (10))) and (((surrender_to_madness.talent_selected) and (((target.time_to_die_as_number) > ((variable.s2mcheck_as_number - (insanity_drain_stacks.aura_stack_as_number) + 60)))))))',
            condition_keywords = {
                'insanity_drain_stacks.aura_stack',
                'surrender_to_madness.talent_selected',
                'target.time_to_die',
                'variable.s2mcheck',
                'voidform.aura_stack',
            },
            simc_line = 'actions.vf+=/berserking,if=buff.voidform.stack>=10&talent.surrender_to_madness.enabled&target.time_to_die>variable.s2mcheck-(buff.insanity_drain_stacks.stack)+60',
        },
        {
            action = 'void_bolt',
            condition = 'dot.shadow_word_pain.remains<3.5*gcd&dot.vampiric_touch.remains<3.5*gcd&target.time_to_die>10',
            condition_converted = '((((shadow_word_pain.aura_remains_as_number) < ((3.5 * gcd_as_number)))) and (((((vampiric_touch.aura_remains_as_number) < ((3.5 * gcd_as_number)))) and (((target.time_to_die_as_number) > (10))))))',
            condition_keywords = {
                'gcd',
                'shadow_word_pain.aura_remains',
                'target.time_to_die',
                'vampiric_touch.aura_remains',
            },
            cycle_targets = '1',
            simc_line = 'actions.vf+=/void_bolt,if=dot.shadow_word_pain.remains<3.5*gcd&dot.vampiric_touch.remains<3.5*gcd&target.time_to_die>10,cycle_targets=1',
        },
        {
            action = 'void_bolt',
            condition = 'dot.shadow_word_pain.remains<3.5*gcd&(talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled)&target.time_to_die>10',
            condition_converted = '((((shadow_word_pain.aura_remains_as_number) < ((3.5 * gcd_as_number)))) and ((((((auspicious_spirits.talent_selected) or (shadowy_insight.talent_selected)))) and (((target.time_to_die_as_number) > (10))))))',
            condition_keywords = {
                'auspicious_spirits.talent_selected',
                'gcd',
                'shadow_word_pain.aura_remains',
                'shadowy_insight.talent_selected',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.vf+=/void_bolt,if=dot.shadow_word_pain.remains<3.5*gcd&(talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled)&target.time_to_die>10,cycle_targets=1',
        },
        {
            action = 'void_bolt',
            condition = 'dot.vampiric_touch.remains<3.5*gcd&(talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank))&target.time_to_die>10',
            condition_converted = '((((vampiric_touch.aura_remains_as_number) < ((3.5 * gcd_as_number)))) and ((((((sanlayn.talent_selected) or ((((auspicious_spirits.talent_selected) and (unleash_the_shadows.artifact_rank))))))) and (((target.time_to_die_as_number) > (10))))))',
            condition_keywords = {
                'auspicious_spirits.talent_selected',
                'gcd',
                'sanlayn.talent_selected',
                'target.time_to_die',
                'unleash_the_shadows.artifact_rank',
                'vampiric_touch.aura_remains',
            },
            cycle_targets = '1',
            simc_line = 'actions.vf+=/void_bolt,if=dot.vampiric_touch.remains<3.5*gcd&(talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank))&target.time_to_die>10,cycle_targets=1',
        },
        {
            action = 'void_bolt',
            condition = 'dot.shadow_word_pain.remains<3.5*gcd&artifact.sphere_of_insanity.rank&target.time_to_die>10',
            condition_converted = '((((shadow_word_pain.aura_remains_as_number) < ((3.5 * gcd_as_number)))) and (((sphere_of_insanity.artifact_rank) and (((target.time_to_die_as_number) > (10))))))',
            condition_keywords = {
                'gcd',
                'shadow_word_pain.aura_remains',
                'sphere_of_insanity.artifact_rank',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.vf+=/void_bolt,if=dot.shadow_word_pain.remains<3.5*gcd&artifact.sphere_of_insanity.rank&target.time_to_die>10,cycle_targets=1',
        },
        {
            action = 'void_bolt',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.vf+=/void_bolt',
        },
        {
            action = 'shadow_word_death',
            condition = '!talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+10)<100',
            condition_converted = '(((not (reaper_of_souls.talent_selected))) and ((((((current_insanity_drain_as_number * gcd_max_as_number)) > (insanity.curr_as_number))) and (((((insanity.curr_as_number - (current_insanity_drain_as_number * gcd_max_as_number) + 10))) < (100))))))',
            condition_keywords = {
                'current_insanity_drain',
                'gcd_max',
                'insanity.curr',
                'reaper_of_souls.talent_selected',
            },
            simc_line = 'actions.vf+=/shadow_word_death,if=!talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+10)<100',
        },
        {
            action = 'shadow_word_death',
            condition = 'talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+30)<100',
            condition_converted = '((reaper_of_souls.talent_selected) and ((((((current_insanity_drain_as_number * gcd_max_as_number)) > (insanity.curr_as_number))) and (((((insanity.curr_as_number - (current_insanity_drain_as_number * gcd_max_as_number) + 30))) < (100))))))',
            condition_keywords = {
                'current_insanity_drain',
                'gcd_max',
                'insanity.curr',
                'reaper_of_souls.talent_selected',
            },
            simc_line = 'actions.vf+=/shadow_word_death,if=talent.reaper_of_souls.enabled&current_insanity_drain*gcd_max>insanity&(insanity-(current_insanity_drain*gcd_max)+30)<100',
        },
        {
            action = 'wait',
            condition = 'action.void_bolt.usable_in<gcd_max*0.28',
            condition_converted = '((void_bolt.spell_usable_in_as_number) < ((gcd_max_as_number * 0.28)))',
            condition_keywords = {
                'gcd_max',
                'void_bolt.spell_usable_in',
            },
            sec = 'action.void_bolt.usable_in',
            simc_line = 'actions.vf+=/wait,sec=action.void_bolt.usable_in,if=action.void_bolt.usable_in<gcd_max*0.28',
        },
        {
            action = 'mind_blast',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.vf+=/mind_blast',
        },
        {
            action = 'wait',
            condition = 'action.mind_blast.usable_in<gcd_max*0.28',
            condition_converted = '((mind_blast.spell_usable_in_as_number) < ((gcd_max_as_number * 0.28)))',
            condition_keywords = {
                'gcd_max',
                'mind_blast.spell_usable_in',
            },
            sec = 'action.mind_blast.usable_in',
            simc_line = 'actions.vf+=/wait,sec=action.mind_blast.usable_in,if=action.mind_blast.usable_in<gcd_max*0.28',
        },
        {
            action = 'shadow_word_death',
            condition = 'cooldown.shadow_word_death.charges=2',
            condition_converted = '((shadow_word_death.cooldown_charges) == (2))',
            condition_keywords = {
                'shadow_word_death.cooldown_charges',
            },
            simc_line = 'actions.vf+=/shadow_word_death,if=cooldown.shadow_word_death.charges=2',
        },
        {
            action = 'shadowfiend',
            condition = 'buff.voidform.stack>15',
            condition_converted = '((voidform.aura_stack_as_number) > (15))',
            condition_keywords = {
                'voidform.aura_stack',
            },
            simc_line = 'actions.vf+=/shadowfiend,if=!talent.mindbender.enabled,if=buff.voidform.stack>15',
        },
        {
            action = 'shadow_word_void',
            condition = '(insanity-(current_insanity_drain*gcd_max)+25)<100',
            condition_converted = '((((insanity.curr_as_number - (current_insanity_drain_as_number * gcd_max_as_number) + 25))) < (100))',
            condition_keywords = {
                'current_insanity_drain',
                'gcd_max',
                'insanity.curr',
            },
            simc_line = 'actions.vf+=/shadow_word_void,if=(insanity-(current_insanity_drain*gcd_max)+25)<100',
        },
        {
            action = 'shadow_word_pain',
            condition = '!ticking&(active_enemies<5|talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled|artifact.sphere_of_insanity.rank)',
            condition_converted = '(((not (shadow_word_pain.aura_up))) and ((((((active_enemies_as_number) < (5))) or (((auspicious_spirits.talent_selected) or (((shadowy_insight.talent_selected) or (sphere_of_insanity.artifact_rank)))))))))',
            condition_keywords = {
                'active_enemies',
                'auspicious_spirits.talent_selected',
                'shadow_word_pain.aura_up',
                'shadowy_insight.talent_selected',
                'sphere_of_insanity.artifact_rank',
            },
            simc_line = 'actions.vf+=/shadow_word_pain,if=!ticking&(active_enemies<5|talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled|artifact.sphere_of_insanity.rank)',
        },
        {
            action = 'vampiric_touch',
            condition = '!ticking&(active_enemies<4|talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank))',
            condition_converted = '(((not (vampiric_touch.aura_up))) and ((((((active_enemies_as_number) < (4))) or (((sanlayn.talent_selected) or ((((auspicious_spirits.talent_selected) and (unleash_the_shadows.artifact_rank))))))))))',
            condition_keywords = {
                'active_enemies',
                'auspicious_spirits.talent_selected',
                'sanlayn.talent_selected',
                'unleash_the_shadows.artifact_rank',
                'vampiric_touch.aura_up',
            },
            simc_line = 'actions.vf+=/vampiric_touch,if=!ticking&(active_enemies<4|talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank))',
        },
        {
            action = 'shadow_word_pain',
            condition = '!ticking&target.time_to_die>10&(active_enemies<5&(talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled))',
            condition_converted = '(((not (shadow_word_pain.aura_up))) and (((((target.time_to_die_as_number) > (10))) and ((((((active_enemies_as_number) < (5))) and ((((auspicious_spirits.talent_selected) or (shadowy_insight.talent_selected))))))))))',
            condition_keywords = {
                'active_enemies',
                'auspicious_spirits.talent_selected',
                'shadow_word_pain.aura_up',
                'shadowy_insight.talent_selected',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.vf+=/shadow_word_pain,if=!ticking&target.time_to_die>10&(active_enemies<5&(talent.auspicious_spirits.enabled|talent.shadowy_insight.enabled)),cycle_targets=1',
        },
        {
            action = 'vampiric_touch',
            condition = '!ticking&target.time_to_die>10&(active_enemies<4|talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank))',
            condition_converted = '(((not (vampiric_touch.aura_up))) and (((((target.time_to_die_as_number) > (10))) and ((((((active_enemies_as_number) < (4))) or (((sanlayn.talent_selected) or ((((auspicious_spirits.talent_selected) and (unleash_the_shadows.artifact_rank))))))))))))',
            condition_keywords = {
                'active_enemies',
                'auspicious_spirits.talent_selected',
                'sanlayn.talent_selected',
                'target.time_to_die',
                'unleash_the_shadows.artifact_rank',
                'vampiric_touch.aura_up',
            },
            cycle_targets = '1',
            simc_line = 'actions.vf+=/vampiric_touch,if=!ticking&target.time_to_die>10&(active_enemies<4|talent.sanlayn.enabled|(talent.auspicious_spirits.enabled&artifact.unleash_the_shadows.rank)),cycle_targets=1',
        },
        {
            action = 'shadow_word_pain',
            condition = '!ticking&target.time_to_die>10&(active_enemies<5&artifact.sphere_of_insanity.rank)',
            condition_converted = '(((not (shadow_word_pain.aura_up))) and (((((target.time_to_die_as_number) > (10))) and ((((((active_enemies_as_number) < (5))) and (sphere_of_insanity.artifact_rank)))))))',
            condition_keywords = {
                'active_enemies',
                'shadow_word_pain.aura_up',
                'sphere_of_insanity.artifact_rank',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions.vf+=/shadow_word_pain,if=!ticking&target.time_to_die>10&(active_enemies<5&artifact.sphere_of_insanity.rank),cycle_targets=1',
        },
        {
            action = 'wait',
            condition = 'action.void_bolt.usable|action.void_bolt.usable_in<gcd_max*0.8',
            condition_converted = '((void_bolt.spell_usable) or (((void_bolt.spell_usable_in_as_number) < ((gcd_max_as_number * 0.8)))))',
            condition_keywords = {
                'gcd_max',
                'void_bolt.spell_usable',
                'void_bolt.spell_usable_in',
            },
            sec = 'action.void_bolt.usable_in',
            simc_line = 'actions.vf+=/wait,sec=action.void_bolt.usable_in,if=action.void_bolt.usable|action.void_bolt.usable_in<gcd_max*0.8',
        },
        {
            action = 'mind_flay',
            chain = '1',
            condition = '!talent.mind_spike.enabled&active_enemies>=2&active_enemies<4',
            condition_converted = '(((not (mind_spike.talent_selected))) and (((((active_enemies_as_number) >= (2))) and (((active_enemies_as_number) < (4))))))',
            condition_keywords = {
                'active_enemies',
                'mind_spike.talent_selected',
            },
            interrupt_if = 'action.void_bolt.usable',
            interrupt_immediate = '1',
            line_cd = '10',
            simc_line = 'actions.vf+=/mind_flay,line_cd=10,if=!talent.mind_spike.enabled&active_enemies>=2&active_enemies<4,chain=1,interrupt_immediate=1,interrupt_if=action.void_bolt.usable',
        },
        {
            action = 'mind_sear',
            condition = 'active_enemies>=2',
            condition_converted = '((active_enemies_as_number) >= (2))',
            condition_keywords = {
                'active_enemies',
            },
            interrupt_if = 'action.void_bolt.usable',
            interrupt_immediate = '1',
            simc_line = 'actions.vf+=/mind_sear,if=active_enemies>=2,interrupt_immediate=1,interrupt_if=action.void_bolt.usable',
        },
        {
            action = 'mind_flay',
            chain = '1',
            condition = '!talent.mind_spike.enabled',
            condition_converted = '(not (mind_spike.talent_selected))',
            condition_keywords = {
                'mind_spike.talent_selected',
            },
            interrupt_if = 'action.void_bolt.usable',
            interrupt_immediate = '1',
            simc_line = 'actions.vf+=/mind_flay,if=!talent.mind_spike.enabled,chain=1,interrupt_immediate=1,interrupt_if=action.void_bolt.usable',
        },
        {
            action = 'mind_spike',
            condition = 'talent.mind_spike.enabled',
            condition_converted = 'mind_spike.talent_selected',
            condition_keywords = {
                'mind_spike.talent_selected',
            },
            simc_line = 'actions.vf+=/mind_spike,if=talent.mind_spike.enabled',
        },
        {
            action = 'shadow_word_pain',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.vf+=/shadow_word_pain',
        },
    },
}


