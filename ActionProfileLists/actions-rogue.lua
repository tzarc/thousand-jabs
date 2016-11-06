local _, internal = ...
internal.actions = internal.actions or {}

-- keywords: legion-dev::rogue::assassination
---- active_dot.rupture
---- adds.raid_event_in
---- agonizing_poison.aura_remains
---- agonizing_poison.spell_duration
---- agonizing_poison.talent_selected
---- bloodlust.aura_up
---- combo_points
---- combo_points.deficit
---- cp_max_spend
---- deadly_poison_dot.spell_refreshable
---- elaborate_planning.aura_remains
---- elaborate_planning.talent_selected
---- energy.deficit
---- exsanguinate.cooldown_remains
---- exsanguinate.talent_selected
---- exsanguinated
---- garrote.aura_remains
---- garrote.spell_refreshable
---- nightstalker.talent_selected
---- prev_gcd.rupture
---- refreshable
---- rupture.aura_remains
---- rupture.aura_up
---- rupture.spell_exsanguinated
---- rupture.spell_refreshable
---- spell_targets
---- stealthed
---- subterfuge.talent_selected
---- target.time_to_die
---- the_dreadlords_deceit.aura_stack
---- time_since_combat_start
---- urge_to_kill.artifact_selected
---- vendetta.aura_up
---- vendetta.cooldown_remains

internal.actions['legion-dev::rogue::assassination'] = {
    cds = {
        {
            action = 'potion',
            condition = 'buff.bloodlust.react|target.time_to_die<=25|debuff.vendetta.up',
            condition_converted = '((bloodlust.aura_up) or (((((target.time_to_die_as_number) <= (25))) or (vendetta.aura_up))))',
            condition_keywords = {
                'bloodlust.aura_up',
                'target.time_to_die',
                'vendetta.aura_up',
            },
            name = 'old_war',
            simc_line = 'actions.cds=potion,name=old_war,if=buff.bloodlust.react|target.time_to_die<=25|debuff.vendetta.up',
        },
        {
            action = 'blood_fury',
            condition = 'debuff.vendetta.up',
            condition_converted = 'vendetta.aura_up',
            condition_keywords = {
                'vendetta.aura_up',
            },
            simc_line = 'actions.cds+=/blood_fury,if=debuff.vendetta.up',
        },
        {
            action = 'berserking',
            condition = 'debuff.vendetta.up',
            condition_converted = 'vendetta.aura_up',
            condition_keywords = {
                'vendetta.aura_up',
            },
            simc_line = 'actions.cds+=/berserking,if=debuff.vendetta.up',
        },
        {
            action = 'arcane_torrent',
            condition = 'debuff.vendetta.up&energy.deficit>50',
            condition_converted = '((vendetta.aura_up) and (((energy.deficit_as_number) > (50))))',
            condition_keywords = {
                'energy.deficit',
                'vendetta.aura_up',
            },
            simc_line = 'actions.cds+=/arcane_torrent,if=debuff.vendetta.up&energy.deficit>50',
        },
        {
            action = 'marked_for_death',
            condition = 'target.time_to_die<combo_points.deficit|combo_points.deficit>=5',
            condition_converted = '((((target.time_to_die_as_number) < (combo_points.deficit_as_number))) or (((combo_points.deficit_as_number) >= (5))))',
            condition_keywords = {
                'combo_points.deficit',
                'target.time_to_die',
            },
            simc_line = 'actions.cds+=/marked_for_death,target_if=min:target.time_to_die,if=target.time_to_die<combo_points.deficit|combo_points.deficit>=5',
            target_if = 'min:target.time_to_die',
        },
        {
            action = 'vendetta',
            condition = 'talent.exsanguinate.enabled&cooldown.exsanguinate.remains<5&dot.rupture.ticking',
            condition_converted = '((exsanguinate.talent_selected) and (((((exsanguinate.cooldown_remains_as_number) < (5))) and (rupture.aura_up))))',
            condition_keywords = {
                'exsanguinate.cooldown_remains',
                'exsanguinate.talent_selected',
                'rupture.aura_up',
            },
            simc_line = 'actions.cds+=/vendetta,if=talent.exsanguinate.enabled&cooldown.exsanguinate.remains<5&dot.rupture.ticking',
        },
        {
            action = 'vendetta',
            condition = '!talent.exsanguinate.enabled&(!artifact.urge_to_kill.enabled|energy.deficit>=70)',
            condition_converted = '(((not (exsanguinate.talent_selected))) and (((((not (urge_to_kill.artifact_selected))) or (((energy.deficit_as_number) >= (70)))))))',
            condition_keywords = {
                'energy.deficit',
                'exsanguinate.talent_selected',
                'urge_to_kill.artifact_selected',
            },
            simc_line = 'actions.cds+=/vendetta,if=!talent.exsanguinate.enabled&(!artifact.urge_to_kill.enabled|energy.deficit>=70)',
        },
        {
            action = 'vanish',
            condition = 'talent.exsanguinate.enabled&talent.nightstalker.enabled&combo_points>=cp_max_spend&cooldown.exsanguinate.remains<1',
            condition_converted = '((exsanguinate.talent_selected) and (((nightstalker.talent_selected) and (((((combo_points_as_number) >= (cp_max_spend_as_number))) and (((exsanguinate.cooldown_remains_as_number) < (1))))))))',
            condition_keywords = {
                'combo_points',
                'cp_max_spend',
                'exsanguinate.cooldown_remains',
                'exsanguinate.talent_selected',
                'nightstalker.talent_selected',
            },
            simc_line = 'actions.cds+=/vanish,if=talent.exsanguinate.enabled&talent.nightstalker.enabled&combo_points>=cp_max_spend&cooldown.exsanguinate.remains<1',
        },
        {
            action = 'vanish',
            condition = '(!talent.exsanguinate.enabled&talent.nightstalker.enabled&combo_points>=cp_max_spend&dot.rupture.refreshable)|(talent.subterfuge.enabled&dot.garrote.refreshable)',
            condition_converted = '((((((not (exsanguinate.talent_selected))) and (((nightstalker.talent_selected) and (((((combo_points_as_number) >= (cp_max_spend_as_number))) and (rupture.spell_refreshable)))))))) or ((((subterfuge.talent_selected) and (garrote.spell_refreshable)))))',
            condition_keywords = {
                'combo_points',
                'cp_max_spend',
                'exsanguinate.talent_selected',
                'garrote.spell_refreshable',
                'nightstalker.talent_selected',
                'rupture.spell_refreshable',
                'subterfuge.talent_selected',
            },
            simc_line = 'actions.cds+=/vanish,if=(!talent.exsanguinate.enabled&talent.nightstalker.enabled&combo_points>=cp_max_spend&dot.rupture.refreshable)|(talent.subterfuge.enabled&dot.garrote.refreshable)',
        },
    },
    default = {
        {
            action = 'exsanguinate',
            condition = 'prev_gcd.rupture&dot.rupture.remains>4+4*cp_max_spend',
            condition_converted = '((prev_gcd.rupture) and (((rupture.aura_remains_as_number) > ((4 + (4 * cp_max_spend_as_number))))))',
            condition_keywords = {
                'cp_max_spend',
                'prev_gcd.rupture',
                'rupture.aura_remains',
            },
            simc_line = 'actions=exsanguinate,if=prev_gcd.rupture&dot.rupture.remains>4+4*cp_max_spend',
        },
        {
            action = 'rupture',
            condition = 'talent.nightstalker.enabled&stealthed',
            condition_converted = '((nightstalker.talent_selected) and (stealthed))',
            condition_keywords = {
                'nightstalker.talent_selected',
                'stealthed',
            },
            simc_line = 'actions+=/rupture,if=talent.nightstalker.enabled&stealthed',
        },
        {
            action = 'garrote',
            condition = 'talent.subterfuge.enabled&stealthed',
            condition_converted = '((subterfuge.talent_selected) and (stealthed))',
            condition_keywords = {
                'stealthed',
                'subterfuge.talent_selected',
            },
            simc_line = 'actions+=/garrote,if=talent.subterfuge.enabled&stealthed',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'cds',
            simc_line = 'actions+=/call_action_list,name=cds',
        },
        {
            action = 'rupture',
            condition = 'talent.exsanguinate.enabled&combo_points>=cp_max_spend&cooldown.exsanguinate.remains<1',
            condition_converted = '((exsanguinate.talent_selected) and (((((combo_points_as_number) >= (cp_max_spend_as_number))) and (((exsanguinate.cooldown_remains_as_number) < (1))))))',
            condition_keywords = {
                'combo_points',
                'cp_max_spend',
                'exsanguinate.cooldown_remains',
                'exsanguinate.talent_selected',
            },
            simc_line = 'actions+=/rupture,if=talent.exsanguinate.enabled&combo_points>=cp_max_spend&cooldown.exsanguinate.remains<1',
        },
        {
            action = 'rupture',
            condition = 'combo_points>=cp_max_spend-talent.exsanguinate.enabled&refreshable&(!exsanguinated|remains<=1.5)&target.time_to_die-remains>4',
            condition_converted = '((((combo_points_as_number) >= ((cp_max_spend_as_number - exsanguinate.talent_selected_as_number)))) and (((refreshable) and (((((((not (exsanguinated))) or (((rupture.aura_remains_as_number) <= (1.5)))))) and ((((target.time_to_die_as_number - rupture.aura_remains_as_number)) > (4))))))))',
            condition_keywords = {
                'combo_points',
                'cp_max_spend',
                'exsanguinate.talent_selected',
                'exsanguinated',
                'refreshable',
                'rupture.aura_remains',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/rupture,cycle_targets=1,if=combo_points>=cp_max_spend-talent.exsanguinate.enabled&refreshable&(!exsanguinated|remains<=1.5)&target.time_to_die-remains>4',
        },
        {
            action = 'kingsbane',
            condition = 'talent.exsanguinate.enabled&dot.rupture.exsanguinated',
            condition_converted = '((exsanguinate.talent_selected) and (rupture.spell_exsanguinated))',
            condition_keywords = {
                'exsanguinate.talent_selected',
                'rupture.spell_exsanguinated',
            },
            simc_line = 'actions+=/kingsbane,if=talent.exsanguinate.enabled&dot.rupture.exsanguinated',
        },
        {
            action = 'pool_resource',
            condition = 'true',
            condition_converted = 'true',
            for_next = '1',
            simc_line = 'actions+=/pool_resource,for_next=1',
        },
        {
            action = 'garrote',
            condition = 'refreshable&(!exsanguinated|remains<=1.5)&target.time_to_die-remains>4',
            condition_converted = '((refreshable) and (((((((not (exsanguinated))) or (((garrote.aura_remains_as_number) <= (1.5)))))) and ((((target.time_to_die_as_number - garrote.aura_remains_as_number)) > (4))))))',
            condition_keywords = {
                'exsanguinated',
                'garrote.aura_remains',
                'refreshable',
                'target.time_to_die',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/garrote,cycle_targets=1,if=refreshable&(!exsanguinated|remains<=1.5)&target.time_to_die-remains>4',
        },
        {
            action = 'envenom',
            condition = '(!talent.exsanguinate.enabled|cooldown.exsanguinate.remains>2)&!dot.rupture.refreshable&active_dot.rupture>=spell_targets.fan_of_knives&((!talent.elaborate_planning.enabled&combo_points>=cp_max_spend)|(talent.elaborate_planning.enabled&combo_points>=3+!talent.exsanguinate.enabled&buff.elaborate_planning.remains<2))',
            condition_converted = '((((((not (exsanguinate.talent_selected))) or (((exsanguinate.cooldown_remains_as_number) > (2)))))) and ((((not (rupture.spell_refreshable))) and (((((active_dot.rupture_as_number) >= (spell_targets_as_number))) and ((((((((not (elaborate_planning.talent_selected))) and (((combo_points_as_number) >= (cp_max_spend_as_number)))))) or ((((elaborate_planning.talent_selected) and (((((combo_points_as_number) >= ((3 + (not (exsanguinate.talent_selected)))))) and (((elaborate_planning.aura_remains_as_number) < (2))))))))))))))))',
            condition_keywords = {
                'active_dot.rupture',
                'combo_points',
                'cp_max_spend',
                'elaborate_planning.aura_remains',
                'elaborate_planning.talent_selected',
                'exsanguinate.cooldown_remains',
                'exsanguinate.talent_selected',
                'rupture.spell_refreshable',
                'spell_targets',
            },
            simc_line = 'actions+=/envenom,if=(!talent.exsanguinate.enabled|cooldown.exsanguinate.remains>2)&!dot.rupture.refreshable&active_dot.rupture>=spell_targets.fan_of_knives&((!talent.elaborate_planning.enabled&combo_points>=cp_max_spend)|(talent.elaborate_planning.enabled&combo_points>=3+!talent.exsanguinate.enabled&buff.elaborate_planning.remains<2))',
        },
        {
            action = 'rupture',
            condition = 'talent.exsanguinate.enabled&!ticking&(time>10|combo_points>=2+artifact.urge_to_kill.enabled*2)',
            condition_converted = '((exsanguinate.talent_selected) and ((((not (rupture.aura_up))) and ((((((time_since_combat_start_as_number) > (10))) or (((combo_points_as_number) >= ((2 + (urge_to_kill.artifact_selected_as_number * 2)))))))))))',
            condition_keywords = {
                'combo_points',
                'exsanguinate.talent_selected',
                'rupture.aura_up',
                'time_since_combat_start',
                'urge_to_kill.artifact_selected',
            },
            simc_line = 'actions+=/rupture,if=talent.exsanguinate.enabled&!ticking&(time>10|combo_points>=2+artifact.urge_to_kill.enabled*2)',
        },
        {
            action = 'hemorrhage',
            condition = 'refreshable',
            condition_converted = 'refreshable',
            condition_keywords = {
                'refreshable',
            },
            simc_line = 'actions+=/hemorrhage,if=refreshable',
        },
        {
            action = 'hemorrhage',
            condition = 'refreshable&dot.rupture.ticking&spell_targets.fan_of_knives<=3',
            condition_converted = '((refreshable) and (((rupture.aura_up) and (((spell_targets_as_number) <= (3))))))',
            condition_keywords = {
                'refreshable',
                'rupture.aura_up',
                'spell_targets',
            },
            simc_line = 'actions+=/hemorrhage,target_if=max:dot.rupture.duration,if=refreshable&dot.rupture.ticking&spell_targets.fan_of_knives<=3',
            target_if = 'max:dot.rupture.duration',
        },
        {
            action = 'kingsbane',
            condition = '!talent.exsanguinate.enabled&(debuff.vendetta.up|cooldown.vendetta.remains>10)',
            condition_converted = '(((not (exsanguinate.talent_selected))) and ((((vendetta.aura_up) or (((vendetta.cooldown_remains_as_number) > (10)))))))',
            condition_keywords = {
                'exsanguinate.talent_selected',
                'vendetta.aura_up',
                'vendetta.cooldown_remains',
            },
            simc_line = 'actions+=/kingsbane,if=!talent.exsanguinate.enabled&(debuff.vendetta.up|cooldown.vendetta.remains>10)',
        },
        {
            action = 'fan_of_knives',
            condition = 'spell_targets>=3|buff.the_dreadlords_deceit.stack>=29',
            condition_converted = '((((spell_targets_as_number) >= (3))) or (((the_dreadlords_deceit.aura_stack_as_number) >= (29))))',
            condition_keywords = {
                'spell_targets',
                'the_dreadlords_deceit.aura_stack',
            },
            simc_line = 'actions+=/fan_of_knives,if=spell_targets>=3|buff.the_dreadlords_deceit.stack>=29',
        },
        {
            action = 'mutilate',
            condition = '(!talent.agonizing_poison.enabled&dot.deadly_poison_dot.refreshable)|(talent.agonizing_poison.enabled&debuff.agonizing_poison.remains<debuff.agonizing_poison.duration*0.3)',
            condition_converted = '((((((not (agonizing_poison.talent_selected))) and (deadly_poison_dot.spell_refreshable)))) or ((((agonizing_poison.talent_selected) and (((agonizing_poison.aura_remains_as_number) < ((agonizing_poison.spell_duration_as_number * 0.3))))))))',
            condition_keywords = {
                'agonizing_poison.aura_remains',
                'agonizing_poison.spell_duration',
                'agonizing_poison.talent_selected',
                'deadly_poison_dot.spell_refreshable',
            },
            cycle_targets = '1',
            simc_line = 'actions+=/mutilate,cycle_targets=1,if=(!talent.agonizing_poison.enabled&dot.deadly_poison_dot.refreshable)|(talent.agonizing_poison.enabled&debuff.agonizing_poison.remains<debuff.agonizing_poison.duration*0.3)',
        },
        {
            action = 'mutilate',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/mutilate',
        },
    },
    precombat = {
        {
            action = 'flask',
            condition = 'true',
            condition_converted = 'true',
            name = 'flask_of_the_seventh_demon',
            simc_line = 'actions.precombat=flask,name=flask_of_the_seventh_demon',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            name = 'defiled',
            simc_line = 'actions.precombat+=/augmentation,name=defiled',
        },
        {
            action = 'food',
            condition = 'true',
            condition_converted = 'true',
            name = 'seedbattered_fish_plate',
            simc_line = 'actions.precombat+=/food,name=seedbattered_fish_plate',
        },
        {
            action = 'snapshot_stats',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/snapshot_stats',
        },
        {
            action = 'apply_poison',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/apply_poison',
        },
        {
            action = 'stealth',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/stealth',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
        {
            action = 'marked_for_death',
            condition = 'raid_event.adds.in>40',
            condition_converted = '((adds.raid_event_in_as_number) > (40))',
            condition_keywords = {
                'adds.raid_event_in',
            },
            simc_line = 'actions.precombat+=/marked_for_death,if=raid_event.adds.in>40',
        },
    },
}


-- keywords: legion-dev::rogue::outlaw
---- adds.raid_event_in
---- adrenaline_rush.aura_up
---- alacrity.aura_stack
---- alacrity.talent_selected
---- anticipation.talent_selected
---- blade_flurry.aura_up
---- blade_flurry.cooldown_up
---- bloodlust.aura_up
---- blunderbuss.aura_up
---- broadsides.aura_up
---- combo_points
---- combo_points.deficit
---- curse_of_the_dreadblades.aura_up
---- curse_of_the_dreadblades.cooldown_remains
---- death_from_above.cooldown_remains
---- death_from_above.talent_selected
---- deeper_stratagem.talent_selected
---- deeper_strategem.talent_selected
---- dirty_tricks.talent_selected
---- energy.curr
---- energy.deficit
---- energy.time_to_max
---- equipped.greenskins_waterlogged_wristcuffs
---- equipped.shivarran_symmetry
---- equipped.thraxis_tricksy_treads
---- ghostly_strike.aura_remains
---- ghostly_strike.aura_up
---- ghostly_strike.spell_duration
---- ghostly_strike.talent_selected
---- greenskins_waterlogged_wristcuffs.aura_up
---- hidden_blade.aura_up
---- jolly_roger.aura_up
---- opportunity.aura_up
---- quick_draw.talent_selected
---- roll_the_bones.aura_remains
---- rtb_buffs
---- rtb_list.any
---- shadowmeld.cooldown_up
---- slice_and_dice.aura_remains
---- slice_and_dice.talent_selected
---- spell_targets
---- stealthed
---- target.time_to_die
---- time_since_combat_start
---- true_bearing.aura_remains
---- vanish.cooldown_up
---- variable.rtb_reroll
---- variable.ss_useable
---- variable.ss_useable_noreroll
---- variable.stealth_condition

internal.actions['legion-dev::rogue::outlaw'] = {
    bf = {
        {
            action = 'cancel_buff',
            condition = 'equipped.shivarran_symmetry&cooldown.blade_flurry.up&buff.blade_flurry.up&spell_targets.blade_flurry>=2|spell_targets.blade_flurry<2&buff.blade_flurry.up',
            condition_converted = '((((equipped.shivarran_symmetry) and (((blade_flurry.cooldown_up) and (((blade_flurry.aura_up) and (((spell_targets_as_number) >= (2))))))))) or (((((spell_targets_as_number) < (2))) and (blade_flurry.aura_up))))',
            condition_keywords = {
                'blade_flurry.aura_up',
                'blade_flurry.cooldown_up',
                'equipped.shivarran_symmetry',
                'spell_targets',
            },
            name = 'blade_flurry',
            simc_line = 'actions.bf=cancel_buff,name=blade_flurry,if=equipped.shivarran_symmetry&cooldown.blade_flurry.up&buff.blade_flurry.up&spell_targets.blade_flurry>=2|spell_targets.blade_flurry<2&buff.blade_flurry.up',
        },
        {
            action = 'blade_flurry',
            condition = 'spell_targets.blade_flurry>=2&!buff.blade_flurry.up',
            condition_converted = '((((spell_targets_as_number) >= (2))) and ((not (blade_flurry.aura_up))))',
            condition_keywords = {
                'blade_flurry.aura_up',
                'spell_targets',
            },
            simc_line = 'actions.bf+=/blade_flurry,if=spell_targets.blade_flurry>=2&!buff.blade_flurry.up',
        },
    },
    build = {
        {
            action = 'ghostly_strike',
            condition = 'combo_points.deficit>=1+buff.broadsides.up&!buff.curse_of_the_dreadblades.up&(debuff.ghostly_strike.remains<debuff.ghostly_strike.duration*0.3|(cooldown.curse_of_the_dreadblades.remains<3&debuff.ghostly_strike.remains<14))&(combo_points>=3|(variable.rtb_reroll&time>=10))',
            condition_converted = '((((combo_points.deficit_as_number) >= ((1 + broadsides.aura_up_as_number)))) and ((((not (curse_of_the_dreadblades.aura_up))) and ((((((((ghostly_strike.aura_remains_as_number) < ((ghostly_strike.spell_duration_as_number * 0.3)))) or ((((((curse_of_the_dreadblades.cooldown_remains_as_number) < (3))) and (((ghostly_strike.aura_remains_as_number) < (14))))))))) and ((((((combo_points_as_number) >= (3))) or ((((variable.rtb_reroll) and (((time_since_combat_start_as_number) >= (10))))))))))))))',
            condition_keywords = {
                'broadsides.aura_up',
                'combo_points',
                'combo_points.deficit',
                'curse_of_the_dreadblades.aura_up',
                'curse_of_the_dreadblades.cooldown_remains',
                'ghostly_strike.aura_remains',
                'ghostly_strike.spell_duration',
                'time_since_combat_start',
                'variable.rtb_reroll',
            },
            simc_line = 'actions.build=ghostly_strike,if=combo_points.deficit>=1+buff.broadsides.up&!buff.curse_of_the_dreadblades.up&(debuff.ghostly_strike.remains<debuff.ghostly_strike.duration*0.3|(cooldown.curse_of_the_dreadblades.remains<3&debuff.ghostly_strike.remains<14))&(combo_points>=3|(variable.rtb_reroll&time>=10))',
        },
        {
            action = 'pistol_shot',
            condition = 'combo_points.deficit>=1+buff.broadsides.up&buff.opportunity.up&(energy.time_to_max>2-talent.quick_draw.enabled|(buff.blunderbuss.up&buff.greenskins_waterlogged_wristcuffs.up))',
            condition_converted = '((((combo_points.deficit_as_number) >= ((1 + broadsides.aura_up_as_number)))) and (((opportunity.aura_up) and ((((((energy.time_to_max_as_number) > ((2 - quick_draw.talent_selected_as_number)))) or ((((blunderbuss.aura_up) and (greenskins_waterlogged_wristcuffs.aura_up))))))))))',
            condition_keywords = {
                'blunderbuss.aura_up',
                'broadsides.aura_up',
                'combo_points.deficit',
                'energy.time_to_max',
                'greenskins_waterlogged_wristcuffs.aura_up',
                'opportunity.aura_up',
                'quick_draw.talent_selected',
            },
            simc_line = 'actions.build+=/pistol_shot,if=combo_points.deficit>=1+buff.broadsides.up&buff.opportunity.up&(energy.time_to_max>2-talent.quick_draw.enabled|(buff.blunderbuss.up&buff.greenskins_waterlogged_wristcuffs.up))',
        },
        {
            action = 'saber_slash',
            condition = 'variable.ss_useable',
            condition_converted = 'variable.ss_useable',
            condition_keywords = {
                'variable.ss_useable',
            },
            simc_line = 'actions.build+=/saber_slash,if=variable.ss_useable',
        },
    },
    cds = {
        {
            action = 'potion',
            condition = 'buff.bloodlust.react|target.time_to_die<=25|buff.adrenaline_rush.up',
            condition_converted = '((bloodlust.aura_up) or (((((target.time_to_die_as_number) <= (25))) or (adrenaline_rush.aura_up))))',
            condition_keywords = {
                'adrenaline_rush.aura_up',
                'bloodlust.aura_up',
                'target.time_to_die',
            },
            name = 'old_war',
            simc_line = 'actions.cds=potion,name=old_war,if=buff.bloodlust.react|target.time_to_die<=25|buff.adrenaline_rush.up',
        },
        {
            action = 'blood_fury',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cds+=/blood_fury',
        },
        {
            action = 'berserking',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cds+=/berserking',
        },
        {
            action = 'arcane_torrent',
            condition = 'energy.deficit>40',
            condition_converted = '((energy.deficit_as_number) > (40))',
            condition_keywords = {
                'energy.deficit',
            },
            simc_line = 'actions.cds+=/arcane_torrent,if=energy.deficit>40',
        },
        {
            action = 'cannonball_barrage',
            condition = 'spell_targets.cannonball_barrage>=1',
            condition_converted = '((spell_targets_as_number) >= (1))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.cds+=/cannonball_barrage,if=spell_targets.cannonball_barrage>=1',
        },
        {
            action = 'adrenaline_rush',
            condition = '!buff.adrenaline_rush.up&energy.deficit>0',
            condition_converted = '(((not (adrenaline_rush.aura_up))) and (((energy.deficit_as_number) > (0))))',
            condition_keywords = {
                'adrenaline_rush.aura_up',
                'energy.deficit',
            },
            simc_line = 'actions.cds+=/adrenaline_rush,if=!buff.adrenaline_rush.up&energy.deficit>0',
        },
        {
            action = 'marked_for_death',
            condition = 'target.time_to_die<combo_points.deficit|((raid_event.adds.in>40|buff.true_bearing.remains>15)&combo_points.deficit>=4+talent.deeper_strategem.enabled+talent.anticipation.enabled)',
            condition_converted = '((((target.time_to_die_as_number) < (combo_points.deficit_as_number))) or (((((((((adds.raid_event_in_as_number) > (40))) or (((true_bearing.aura_remains_as_number) > (15)))))) and (((combo_points.deficit_as_number) >= ((4 + deeper_strategem.talent_selected_as_number + anticipation.talent_selected_as_number))))))))',
            condition_keywords = {
                'adds.raid_event_in',
                'anticipation.talent_selected',
                'combo_points.deficit',
                'deeper_strategem.talent_selected',
                'target.time_to_die',
                'true_bearing.aura_remains',
            },
            simc_line = 'actions.cds+=/marked_for_death,target_if=min:target.time_to_die,if=target.time_to_die<combo_points.deficit|((raid_event.adds.in>40|buff.true_bearing.remains>15)&combo_points.deficit>=4+talent.deeper_strategem.enabled+talent.anticipation.enabled)',
            target_if = 'min:target.time_to_die',
        },
        {
            action = 'sprint',
            condition = 'equipped.thraxis_tricksy_treads&!variable.ss_useable',
            condition_converted = '((equipped.thraxis_tricksy_treads) and ((not (variable.ss_useable))))',
            condition_keywords = {
                'equipped.thraxis_tricksy_treads',
                'variable.ss_useable',
            },
            simc_line = 'actions.cds+=/sprint,if=equipped.thraxis_tricksy_treads&!variable.ss_useable',
        },
        {
            action = 'curse_of_the_dreadblades',
            condition = 'combo_points.deficit>=4&(!talent.ghostly_strike.enabled|debuff.ghostly_strike.up)',
            condition_converted = '((((combo_points.deficit_as_number) >= (4))) and (((((not (ghostly_strike.talent_selected))) or (ghostly_strike.aura_up)))))',
            condition_keywords = {
                'combo_points.deficit',
                'ghostly_strike.aura_up',
                'ghostly_strike.talent_selected',
            },
            simc_line = 'actions.cds+=/curse_of_the_dreadblades,if=combo_points.deficit>=4&(!talent.ghostly_strike.enabled|debuff.ghostly_strike.up)',
        },
    },
    default = {
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'rtb_reroll',
            simc_line = 'actions=variable,name=rtb_reroll,value=!talent.slice_and_dice.enabled&(rtb_buffs<=1&!rtb_list.any.6&((!buff.curse_of_the_dreadblades.up&!buff.adrenaline_rush.up)|!rtb_list.any.5))',
            value = '!talent.slice_and_dice.enabled&(rtb_buffs<=1&!rtb_list.any.6&((!buff.curse_of_the_dreadblades.up&!buff.adrenaline_rush.up)|!rtb_list.any.5))',
            value_converted = '(((not (slice_and_dice.talent_selected))) and ((((((rtb_buffs_as_number) <= (1))) and ((((not (rtb_list.any[6]))) and ((((((((not (curse_of_the_dreadblades.aura_up))) and ((not (adrenaline_rush.aura_up)))))) or ((not (rtb_list.any[5]))))))))))))',
            value_keywords = {
                'adrenaline_rush.aura_up',
                'curse_of_the_dreadblades.aura_up',
                'rtb_buffs',
                'rtb_list.any',
                'slice_and_dice.talent_selected',
            },
        },
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'ss_useable_noreroll',
            simc_line = 'actions+=/variable,name=ss_useable_noreroll,value=(combo_points<5+talent.deeper_stratagem.enabled-(buff.broadsides.up|buff.jolly_roger.up)-(talent.alacrity.enabled&buff.alacrity.stack<=4))',
            value = '(combo_points<5+talent.deeper_stratagem.enabled-(buff.broadsides.up|buff.jolly_roger.up)-(talent.alacrity.enabled&buff.alacrity.stack<=4))',
            value_converted = '(((combo_points_as_number) < ((5 + deeper_stratagem.talent_selected_as_number - (((broadsides.aura_up) or (jolly_roger.aura_up))) - (((alacrity.talent_selected) and (((alacrity.aura_stack_as_number) <= (4)))))))))',
            value_keywords = {
                'alacrity.aura_stack',
                'alacrity.talent_selected',
                'broadsides.aura_up',
                'combo_points',
                'deeper_stratagem.talent_selected',
                'jolly_roger.aura_up',
            },
        },
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'ss_useable',
            simc_line = 'actions+=/variable,name=ss_useable,value=(talent.anticipation.enabled&combo_points<4)|(!talent.anticipation.enabled&((variable.rtb_reroll&combo_points<4+talent.deeper_stratagem.enabled)|(!variable.rtb_reroll&variable.ss_useable_noreroll)))',
            value = '(talent.anticipation.enabled&combo_points<4)|(!talent.anticipation.enabled&((variable.rtb_reroll&combo_points<4+talent.deeper_stratagem.enabled)|(!variable.rtb_reroll&variable.ss_useable_noreroll)))',
            value_converted = '(((((anticipation.talent_selected) and (((combo_points_as_number) < (4)))))) or (((((not (anticipation.talent_selected))) and (((((((variable.rtb_reroll) and (((combo_points_as_number) < ((4 + deeper_stratagem.talent_selected_as_number))))))) or (((((not (variable.rtb_reroll))) and (variable.ss_useable_noreroll)))))))))))',
            value_keywords = {
                'anticipation.talent_selected',
                'combo_points',
                'deeper_stratagem.talent_selected',
                'variable.rtb_reroll',
                'variable.ss_useable_noreroll',
            },
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'bf',
            simc_line = 'actions+=/call_action_list,name=bf',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'cds',
            simc_line = 'actions+=/call_action_list,name=cds',
        },
        {
            action = 'call_action_list',
            condition = 'stealthed|cooldown.vanish.up|cooldown.shadowmeld.up',
            condition_converted = '((stealthed) or (((vanish.cooldown_up) or (shadowmeld.cooldown_up))))',
            condition_keywords = {
                'shadowmeld.cooldown_up',
                'stealthed',
                'vanish.cooldown_up',
            },
            name = 'stealth',
            simc_line = 'actions+=/call_action_list,name=stealth,if=stealthed|cooldown.vanish.up|cooldown.shadowmeld.up',
        },
        {
            action = 'death_from_above',
            condition = 'energy.time_to_max>2&!variable.ss_useable_noreroll',
            condition_converted = '((((energy.time_to_max_as_number) > (2))) and ((not (variable.ss_useable_noreroll))))',
            condition_keywords = {
                'energy.time_to_max',
                'variable.ss_useable_noreroll',
            },
            simc_line = 'actions+=/death_from_above,if=energy.time_to_max>2&!variable.ss_useable_noreroll',
        },
        {
            action = 'slice_and_dice',
            condition = '!variable.ss_useable&buff.slice_and_dice.remains<target.time_to_die&buff.slice_and_dice.remains<(1+combo_points)*1.8',
            condition_converted = '(((not (variable.ss_useable))) and (((((slice_and_dice.aura_remains_as_number) < (target.time_to_die_as_number))) and (((slice_and_dice.aura_remains_as_number) < (((1 + combo_points_as_number) * 1.8)))))))',
            condition_keywords = {
                'combo_points',
                'slice_and_dice.aura_remains',
                'target.time_to_die',
                'variable.ss_useable',
            },
            simc_line = 'actions+=/slice_and_dice,if=!variable.ss_useable&buff.slice_and_dice.remains<target.time_to_die&buff.slice_and_dice.remains<(1+combo_points)*1.8',
        },
        {
            action = 'roll_the_bones',
            condition = '!variable.ss_useable&buff.roll_the_bones.remains<target.time_to_die&(buff.roll_the_bones.remains<=3|variable.rtb_reroll)',
            condition_converted = '(((not (variable.ss_useable))) and (((((roll_the_bones.aura_remains_as_number) < (target.time_to_die_as_number))) and ((((((roll_the_bones.aura_remains_as_number) <= (3))) or (variable.rtb_reroll)))))))',
            condition_keywords = {
                'roll_the_bones.aura_remains',
                'target.time_to_die',
                'variable.rtb_reroll',
                'variable.ss_useable',
            },
            simc_line = 'actions+=/roll_the_bones,if=!variable.ss_useable&buff.roll_the_bones.remains<target.time_to_die&(buff.roll_the_bones.remains<=3|variable.rtb_reroll)',
        },
        {
            action = 'killing_spree',
            condition = 'energy.time_to_max>5|energy<15',
            condition_converted = '((((energy.time_to_max_as_number) > (5))) or (((energy.curr_as_number) < (15))))',
            condition_keywords = {
                'energy.curr',
                'energy.time_to_max',
            },
            simc_line = 'actions+=/killing_spree,if=energy.time_to_max>5|energy<15',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'build',
            simc_line = 'actions+=/call_action_list,name=build',
        },
        {
            action = 'call_action_list',
            condition = '!variable.ss_useable',
            condition_converted = '(not (variable.ss_useable))',
            condition_keywords = {
                'variable.ss_useable',
            },
            name = 'finish',
            simc_line = 'actions+=/call_action_list,name=finish,if=!variable.ss_useable',
        },
        {
            action = 'gouge',
            condition = 'talent.dirty_tricks.enabled&combo_points.deficit>=1',
            condition_converted = '((dirty_tricks.talent_selected) and (((combo_points.deficit_as_number) >= (1))))',
            condition_keywords = {
                'combo_points.deficit',
                'dirty_tricks.talent_selected',
            },
            simc_line = 'actions+=/gouge,if=talent.dirty_tricks.enabled&combo_points.deficit>=1',
        },
    },
    finish = {
        {
            action = 'between_the_eyes',
            condition = 'equipped.greenskins_waterlogged_wristcuffs&!buff.greenskins_waterlogged_wristcuffs.up',
            condition_converted = '((equipped.greenskins_waterlogged_wristcuffs) and ((not (greenskins_waterlogged_wristcuffs.aura_up))))',
            condition_keywords = {
                'equipped.greenskins_waterlogged_wristcuffs',
                'greenskins_waterlogged_wristcuffs.aura_up',
            },
            simc_line = 'actions.finish=between_the_eyes,if=equipped.greenskins_waterlogged_wristcuffs&!buff.greenskins_waterlogged_wristcuffs.up',
        },
        {
            action = 'run_through',
            condition = '!talent.death_from_above.enabled|energy.time_to_max<cooldown.death_from_above.remains+3.5',
            condition_converted = '(((not (death_from_above.talent_selected))) or (((energy.time_to_max_as_number) < ((death_from_above.cooldown_remains_as_number + 3.5)))))',
            condition_keywords = {
                'death_from_above.cooldown_remains',
                'death_from_above.talent_selected',
                'energy.time_to_max',
            },
            simc_line = 'actions.finish+=/run_through,if=!talent.death_from_above.enabled|energy.time_to_max<cooldown.death_from_above.remains+3.5',
        },
    },
    precombat = {
        {
            action = 'flask',
            condition = 'true',
            condition_converted = 'true',
            name = 'flask_of_the_seventh_demon',
            simc_line = 'actions.precombat=flask,name=flask_of_the_seventh_demon',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            name = 'defiled',
            simc_line = 'actions.precombat+=/augmentation,name=defiled',
        },
        {
            action = 'food',
            condition = 'true',
            condition_converted = 'true',
            name = 'seedbattered_fish_plate',
            simc_line = 'actions.precombat+=/food,name=seedbattered_fish_plate',
        },
        {
            action = 'snapshot_stats',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/snapshot_stats',
        },
        {
            action = 'stealth',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/stealth',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
        {
            action = 'marked_for_death',
            condition = 'raid_event.adds.in>40',
            condition_converted = '((adds.raid_event_in_as_number) > (40))',
            condition_keywords = {
                'adds.raid_event_in',
            },
            simc_line = 'actions.precombat+=/marked_for_death,if=raid_event.adds.in>40',
        },
        {
            action = 'roll_the_bones',
            condition = '!talent.slice_and_dice.enabled',
            condition_converted = '(not (slice_and_dice.talent_selected))',
            condition_keywords = {
                'slice_and_dice.talent_selected',
            },
            simc_line = 'actions.precombat+=/roll_the_bones,if=!talent.slice_and_dice.enabled',
        },
    },
    stealth = {
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'stealth_condition',
            simc_line = 'actions.stealth=variable,name=stealth_condition,value=(combo_points.deficit>=2+2*(talent.ghostly_strike.enabled&!debuff.ghostly_strike.up)+buff.broadsides.up&energy>60&!buff.jolly_roger.up&!buff.hidden_blade.up&!buff.curse_of_the_dreadblades.up)',
            value = '(combo_points.deficit>=2+2*(talent.ghostly_strike.enabled&!debuff.ghostly_strike.up)+buff.broadsides.up&energy>60&!buff.jolly_roger.up&!buff.hidden_blade.up&!buff.curse_of_the_dreadblades.up)',
            value_converted = '(((((combo_points.deficit_as_number) >= ((2 + (2 * (((ghostly_strike.talent_selected) and ((not (ghostly_strike.aura_up)))))) + broadsides.aura_up_as_number)))) and (((((energy.curr_as_number) > (60))) and ((((not (jolly_roger.aura_up))) and ((((not (hidden_blade.aura_up))) and ((not (curse_of_the_dreadblades.aura_up)))))))))))',
            value_keywords = {
                'broadsides.aura_up',
                'combo_points.deficit',
                'curse_of_the_dreadblades.aura_up',
                'energy.curr',
                'ghostly_strike.aura_up',
                'ghostly_strike.talent_selected',
                'hidden_blade.aura_up',
                'jolly_roger.aura_up',
            },
        },
        {
            action = 'ambush',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.stealth+=/ambush',
        },
        {
            action = 'vanish',
            condition = 'variable.stealth_condition',
            condition_converted = 'variable.stealth_condition',
            condition_keywords = {
                'variable.stealth_condition',
            },
            simc_line = 'actions.stealth+=/vanish,if=variable.stealth_condition',
        },
        {
            action = 'shadowmeld',
            condition = 'variable.stealth_condition',
            condition_converted = 'variable.stealth_condition',
            condition_keywords = {
                'variable.stealth_condition',
            },
            simc_line = 'actions.stealth+=/shadowmeld,if=variable.stealth_condition',
        },
    },
}


-- keywords: legion-dev::rogue::subtlety
---- adds.raid_event_in
---- anticipation.talent_selected
---- bloodlust.aura_up
---- combo_points
---- combo_points.deficit
---- deeper_strategem.talent_selected
---- energy.deficit
---- energy.time_to_max
---- enveloping_shadows.aura_remains
---- equipped.shadow_satyrs_walk
---- finality
---- finality_nightblade.aura_up
---- floor
---- master_of_shadows.talent_selected
---- math.floor
---- nightblade.aura_remains
---- nightblade.spell_tick_time
---- premeditation.talent_selected
---- refreshable
---- shadow_blades.aura_up
---- shadow_dance.aura_up
---- shadow_dance.cooldown_charges
---- shadowmeld.aura_down
---- shadowmeld.aura_up
---- shadowmeld.cooldown_up
---- spell_targets
---- stealthed
---- symbols_of_death.aura_remains
---- symbols_of_death.spell_duration
---- target.distance
---- target.time_to_die
---- the_dreadlords_deceit.aura_stack
---- time_since_combat_start
---- vanish.cooldown_up
---- variable.ed_threshold
---- variable.ssw_er
---- vigor.talent_selected

internal.actions['legion-dev::rogue::subtlety'] = {
    build = {
        {
            action = 'shuriken_storm',
            condition = 'spell_targets.shuriken_storm>=2',
            condition_converted = '((spell_targets_as_number) >= (2))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.build=shuriken_storm,if=spell_targets.shuriken_storm>=2',
        },
        {
            action = 'gloomblade',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.build+=/gloomblade',
        },
        {
            action = 'backstab',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.build+=/backstab',
        },
    },
    cds = {
        {
            action = 'potion',
            condition = 'buff.bloodlust.react|target.time_to_die<=25|buff.shadow_blades.up',
            condition_converted = '((bloodlust.aura_up) or (((((target.time_to_die_as_number) <= (25))) or (shadow_blades.aura_up))))',
            condition_keywords = {
                'bloodlust.aura_up',
                'shadow_blades.aura_up',
                'target.time_to_die',
            },
            name = 'old_war',
            simc_line = 'actions.cds=potion,name=old_war,if=buff.bloodlust.react|target.time_to_die<=25|buff.shadow_blades.up',
        },
        {
            action = 'blood_fury',
            condition = 'stealthed',
            condition_converted = 'stealthed',
            condition_keywords = {
                'stealthed',
            },
            simc_line = 'actions.cds+=/blood_fury,if=stealthed',
        },
        {
            action = 'berserking',
            condition = 'stealthed',
            condition_converted = 'stealthed',
            condition_keywords = {
                'stealthed',
            },
            simc_line = 'actions.cds+=/berserking,if=stealthed',
        },
        {
            action = 'arcane_torrent',
            condition = 'stealthed&energy.deficit>70',
            condition_converted = '((stealthed) and (((energy.deficit_as_number) > (70))))',
            condition_keywords = {
                'energy.deficit',
                'stealthed',
            },
            simc_line = 'actions.cds+=/arcane_torrent,if=stealthed&energy.deficit>70',
        },
        {
            action = 'shadow_blades',
            condition = '!(stealthed|buff.shadowmeld.up)',
            condition_converted = '(not ((((stealthed) or (shadowmeld.aura_up)))))',
            condition_keywords = {
                'shadowmeld.aura_up',
                'stealthed',
            },
            simc_line = 'actions.cds+=/shadow_blades,if=!(stealthed|buff.shadowmeld.up)',
        },
        {
            action = 'goremaws_bite',
            condition = '!buff.shadow_dance.up&((combo_points.deficit>=4-(time<10)*2&energy.deficit>50+talent.vigor.enabled*25-(time>=10)*15)|target.time_to_die<8)',
            condition_converted = '(((not (shadow_dance.aura_up))) and (((((((((combo_points.deficit_as_number) >= ((4 - ((((time_since_combat_start_as_number) < (10))) * 2))))) and (((energy.deficit_as_number) > ((50 + (vigor.talent_selected_as_number * 25) - ((((time_since_combat_start_as_number) >= (10))) * 15)))))))) or (((target.time_to_die_as_number) < (8)))))))',
            condition_keywords = {
                'combo_points.deficit',
                'energy.deficit',
                'shadow_dance.aura_up',
                'target.time_to_die',
                'time_since_combat_start',
                'vigor.talent_selected',
            },
            simc_line = 'actions.cds+=/goremaws_bite,if=!buff.shadow_dance.up&((combo_points.deficit>=4-(time<10)*2&energy.deficit>50+talent.vigor.enabled*25-(time>=10)*15)|target.time_to_die<8)',
        },
        {
            action = 'marked_for_death',
            condition = 'target.time_to_die<combo_points.deficit|(raid_event.adds.in>40&combo_points.deficit>=4+talent.deeper_strategem.enabled+talent.anticipation.enabled)',
            condition_converted = '((((target.time_to_die_as_number) < (combo_points.deficit_as_number))) or ((((((adds.raid_event_in_as_number) > (40))) and (((combo_points.deficit_as_number) >= ((4 + deeper_strategem.talent_selected_as_number + anticipation.talent_selected_as_number))))))))',
            condition_keywords = {
                'adds.raid_event_in',
                'anticipation.talent_selected',
                'combo_points.deficit',
                'deeper_strategem.talent_selected',
                'target.time_to_die',
            },
            simc_line = 'actions.cds+=/marked_for_death,target_if=min:target.time_to_die,if=target.time_to_die<combo_points.deficit|(raid_event.adds.in>40&combo_points.deficit>=4+talent.deeper_strategem.enabled+talent.anticipation.enabled)',
            target_if = 'min:target.time_to_die',
        },
    },
    default = {
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'ssw_er',
            simc_line = 'actions=variable,name=ssw_er,value=equipped.shadow_satyrs_walk*(10+floor(target.distance*0.5))',
            value = 'equipped.shadow_satyrs_walk*(10+floor(target.distance*0.5))',
            value_converted = '(equipped.shadow_satyrs_walk_as_number * ((10 + (math.floor((target.distance_as_number * 0.5))))))',
            value_keywords = {
                'equipped.shadow_satyrs_walk',
                'math.floor',
                'target.distance',
            },
        },
        {
            action = 'variable',
            condition = 'true',
            condition_converted = 'true',
            name = 'ed_threshold',
            simc_line = 'actions+=/variable,name=ed_threshold,value=energy.deficit<=(20+talent.vigor.enabled*35+talent.master_of_shadows.enabled*25+variable.ssw_er)',
            value = 'energy.deficit<=(20+talent.vigor.enabled*35+talent.master_of_shadows.enabled*25+variable.ssw_er)',
            value_converted = '((energy.deficit_as_number) <= (((20 + (vigor.talent_selected_as_number * 35) + (master_of_shadows.talent_selected_as_number * 25) + variable.ssw_er_as_number))))',
            value_keywords = {
                'energy.deficit',
                'master_of_shadows.talent_selected',
                'variable.ssw_er',
                'vigor.talent_selected',
            },
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'cds',
            simc_line = 'actions+=/call_action_list,name=cds',
        },
        {
            action = 'run_action_list',
            condition = 'stealthed|buff.shadowmeld.up',
            condition_converted = '((stealthed) or (shadowmeld.aura_up))',
            condition_keywords = {
                'shadowmeld.aura_up',
                'stealthed',
            },
            name = 'stealthed',
            simc_line = 'actions+=/run_action_list,name=stealthed,if=stealthed|buff.shadowmeld.up',
        },
        {
            action = 'call_action_list',
            condition = 'combo_points>=5|(combo_points>=4&spell_targets.shuriken_storm>=3&spell_targets.shuriken_storm<=4)',
            condition_converted = '((((combo_points_as_number) >= (5))) or ((((((combo_points_as_number) >= (4))) and (((((spell_targets_as_number) >= (3))) and (((spell_targets_as_number) <= (4)))))))))',
            condition_keywords = {
                'combo_points',
                'spell_targets',
            },
            name = 'finish',
            simc_line = 'actions+=/call_action_list,name=finish,if=combo_points>=5|(combo_points>=4&spell_targets.shuriken_storm>=3&spell_targets.shuriken_storm<=4)',
        },
        {
            action = 'call_action_list',
            condition = 'combo_points.deficit>=2+talent.premeditation.enabled&(variable.ed_threshold|(cooldown.shadowmeld.up&!cooldown.vanish.up&cooldown.shadow_dance.charges<=1)|target.time_to_die<12)',
            condition_converted = '((((combo_points.deficit_as_number) >= ((2 + premeditation.talent_selected_as_number)))) and ((((variable.ed_threshold) or ((((((shadowmeld.cooldown_up) and ((((not (vanish.cooldown_up))) and (((shadow_dance.cooldown_charges_as_number) <= (1)))))))) or (((target.time_to_die_as_number) < (12)))))))))',
            condition_keywords = {
                'combo_points.deficit',
                'premeditation.talent_selected',
                'shadow_dance.cooldown_charges',
                'shadowmeld.cooldown_up',
                'target.time_to_die',
                'vanish.cooldown_up',
                'variable.ed_threshold',
            },
            name = 'stealth_cds',
            simc_line = 'actions+=/call_action_list,name=stealth_cds,if=combo_points.deficit>=2+talent.premeditation.enabled&(variable.ed_threshold|(cooldown.shadowmeld.up&!cooldown.vanish.up&cooldown.shadow_dance.charges<=1)|target.time_to_die<12)',
        },
        {
            action = 'call_action_list',
            condition = 'variable.ed_threshold',
            condition_converted = 'variable.ed_threshold',
            condition_keywords = {
                'variable.ed_threshold',
            },
            name = 'build',
            simc_line = 'actions+=/call_action_list,name=build,if=variable.ed_threshold',
        },
    },
    finish = {
        {
            action = 'enveloping_shadows',
            condition = 'buff.enveloping_shadows.remains<target.time_to_die&buff.enveloping_shadows.remains<=combo_points*1.8',
            condition_converted = '((((enveloping_shadows.aura_remains_as_number) < (target.time_to_die_as_number))) and (((enveloping_shadows.aura_remains_as_number) <= ((combo_points_as_number * 1.8)))))',
            condition_keywords = {
                'combo_points',
                'enveloping_shadows.aura_remains',
                'target.time_to_die',
            },
            simc_line = 'actions.finish=enveloping_shadows,if=buff.enveloping_shadows.remains<target.time_to_die&buff.enveloping_shadows.remains<=combo_points*1.8',
        },
        {
            action = 'death_from_above',
            condition = 'spell_targets.death_from_above>=6',
            condition_converted = '((spell_targets_as_number) >= (6))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.finish+=/death_from_above,if=spell_targets.death_from_above>=6',
        },
        {
            action = 'nightblade',
            condition = 'target.time_to_die>8&((refreshable&(!finality|buff.finality_nightblade.up))|remains<tick_time)',
            condition_converted = '((((target.time_to_die_as_number) > (8))) and (((((((refreshable) and (((((not (finality))) or (finality_nightblade.aura_up))))))) or (((nightblade.aura_remains_as_number) < (nightblade.spell_tick_time_as_number)))))))',
            condition_keywords = {
                'finality',
                'finality_nightblade.aura_up',
                'nightblade.aura_remains',
                'nightblade.spell_tick_time',
                'refreshable',
                'target.time_to_die',
            },
            simc_line = 'actions.finish+=/nightblade,target_if=max:target.time_to_die,if=target.time_to_die>8&((refreshable&(!finality|buff.finality_nightblade.up))|remains<tick_time)',
            target_if = 'max:target.time_to_die',
        },
        {
            action = 'death_from_above',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.finish+=/death_from_above',
        },
        {
            action = 'eviscerate',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.finish+=/eviscerate',
        },
    },
    precombat = {
        {
            action = 'flask',
            condition = 'true',
            condition_converted = 'true',
            name = 'flask_of_the_seventh_demon',
            simc_line = 'actions.precombat=flask,name=flask_of_the_seventh_demon',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            name = 'defiled',
            simc_line = 'actions.precombat+=/augmentation,name=defiled',
        },
        {
            action = 'food',
            condition = 'true',
            condition_converted = 'true',
            name = 'seedbattered_fish_plate',
            simc_line = 'actions.precombat+=/food,name=seedbattered_fish_plate',
        },
        {
            action = 'snapshot_stats',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/snapshot_stats',
        },
        {
            action = 'stealth',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/stealth',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
        {
            action = 'marked_for_death',
            condition = 'raid_event.adds.in>40',
            condition_converted = '((adds.raid_event_in_as_number) > (40))',
            condition_keywords = {
                'adds.raid_event_in',
            },
            simc_line = 'actions.precombat+=/marked_for_death,if=raid_event.adds.in>40',
        },
        {
            action = 'symbols_of_death',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/symbols_of_death',
        },
    },
    stealthed = {
        {
            action = 'symbols_of_death',
            condition = 'buff.shadowmeld.down&((buff.symbols_of_death.remains<target.time_to_die-4&buff.symbols_of_death.remains<=buff.symbols_of_death.duration*0.3)|(equipped.shadow_satyrs_walk&energy.time_to_max<0.25))',
            condition_converted = '((shadowmeld.aura_down) and (((((((((symbols_of_death.aura_remains_as_number) < ((target.time_to_die_as_number - 4)))) and (((symbols_of_death.aura_remains_as_number) <= ((symbols_of_death.spell_duration_as_number * 0.3))))))) or ((((equipped.shadow_satyrs_walk) and (((energy.time_to_max_as_number) < (0.25))))))))))',
            condition_keywords = {
                'energy.time_to_max',
                'equipped.shadow_satyrs_walk',
                'shadowmeld.aura_down',
                'symbols_of_death.aura_remains',
                'symbols_of_death.spell_duration',
                'target.time_to_die',
            },
            simc_line = 'actions.stealthed=symbols_of_death,if=buff.shadowmeld.down&((buff.symbols_of_death.remains<target.time_to_die-4&buff.symbols_of_death.remains<=buff.symbols_of_death.duration*0.3)|(equipped.shadow_satyrs_walk&energy.time_to_max<0.25))',
        },
        {
            action = 'call_action_list',
            condition = 'combo_points>=5',
            condition_converted = '((combo_points_as_number) >= (5))',
            condition_keywords = {
                'combo_points',
            },
            name = 'finish',
            simc_line = 'actions.stealthed+=/call_action_list,name=finish,if=combo_points>=5',
        },
        {
            action = 'shuriken_storm',
            condition = 'buff.shadowmeld.down&((combo_points.deficit>=3&spell_targets.shuriken_storm>=2+talent.premeditation.enabled+equipped.shadow_satyrs_walk)|buff.the_dreadlords_deceit.stack>=29)',
            condition_converted = '((shadowmeld.aura_down) and (((((((((combo_points.deficit_as_number) >= (3))) and (((spell_targets_as_number) >= ((2 + premeditation.talent_selected_as_number + equipped.shadow_satyrs_walk_as_number))))))) or (((the_dreadlords_deceit.aura_stack_as_number) >= (29)))))))',
            condition_keywords = {
                'combo_points.deficit',
                'equipped.shadow_satyrs_walk',
                'premeditation.talent_selected',
                'shadowmeld.aura_down',
                'spell_targets',
                'the_dreadlords_deceit.aura_stack',
            },
            simc_line = 'actions.stealthed+=/shuriken_storm,if=buff.shadowmeld.down&((combo_points.deficit>=3&spell_targets.shuriken_storm>=2+talent.premeditation.enabled+equipped.shadow_satyrs_walk)|buff.the_dreadlords_deceit.stack>=29)',
        },
        {
            action = 'shadowstrike',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.stealthed+=/shadowstrike',
        },
    },
}


