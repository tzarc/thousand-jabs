local _, internal = ...
internal.actions = internal.actions or {}

-- keywords: legion-dev::mage::arcane
---- active_enemies
---- arcane_blast.spell_cast_time
---- arcane_charge.aura_stack
---- arcane_explosion.spell_cast_time
---- arcane_missiles.aura_up
---- arcane_power.aura_down
---- arcane_power.aura_remains
---- arcane_power.aura_up
---- arcane_power.cooldown_remains
---- berserking.aura_up
---- blood_fury.aura_up
---- bloodlust.aura_down
---- burn_phase
---- burn_phase_duration
---- casting.aura_up
---- equipped
---- execute_time
---- gcd
---- gcd_max
---- mana.percent
---- mark_of_aluneth.cooldown_remains
---- nether_tempest.aura_remains
---- nether_tempest.aura_up
---- overpowered.talent_selected
---- presence_of_mind.aura_up
---- prev_gcd.evocation
---- quickening.aura_remains
---- quickening.talent_selected
---- refreshable
---- rhonins_assaulting_armwraps.aura_up
---- rune_of_power.aura_up
---- rune_of_power.spell_cast_time
---- rune_of_power.spell_recharge_time
---- rune_of_power.talent_selected
---- target.time_to_die
---- time_since_combat_start

internal.actions['legion-dev::mage::arcane'] = {
    build = {
        {
            action = 'charged_up',
            condition = 'buff.arcane_charge.stack<=1',
            condition_converted = '((arcane_charge.aura_stack_as_number) <= (1))',
            condition_keywords = {
                'arcane_charge.aura_stack',
            },
            simc_line = 'actions.build=charged_up,if=buff.arcane_charge.stack<=1',
        },
        {
            action = 'arcane_missiles',
            condition = 'buff.arcane_missiles.react=3',
            condition_converted = '((arcane_missiles.aura_up) == (3))',
            condition_keywords = {
                'arcane_missiles.aura_up',
            },
            simc_line = 'actions.build+=/arcane_missiles,if=buff.arcane_missiles.react=3',
        },
        {
            action = 'arcane_orb',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.build+=/arcane_orb',
        },
        {
            action = 'arcane_explosion',
            condition = 'active_enemies>1',
            condition_converted = '((active_enemies_as_number) > (1))',
            condition_keywords = {
                'active_enemies',
            },
            simc_line = 'actions.build+=/arcane_explosion,if=active_enemies>1',
        },
        {
            action = 'arcane_blast',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.build+=/arcane_blast',
        },
    },
    burn = {
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'cooldowns',
            simc_line = 'actions.burn=call_action_list,name=cooldowns',
        },
        {
            action = 'arcane_missiles',
            condition = 'buff.arcane_missiles.react=3',
            condition_converted = '((arcane_missiles.aura_up) == (3))',
            condition_keywords = {
                'arcane_missiles.aura_up',
            },
            simc_line = 'actions.burn+=/arcane_missiles,if=buff.arcane_missiles.react=3',
        },
        {
            action = 'arcane_explosion',
            condition = 'buff.quickening.remains<action.arcane_blast.cast_time&talent.quickening.enabled',
            condition_converted = '((((quickening.aura_remains_as_number) < (arcane_blast.spell_cast_time_as_number))) and (quickening.talent_selected))',
            condition_keywords = {
                'arcane_blast.spell_cast_time',
                'quickening.aura_remains',
                'quickening.talent_selected',
            },
            simc_line = 'actions.burn+=/arcane_explosion,if=buff.quickening.remains<action.arcane_blast.cast_time&talent.quickening.enabled',
        },
        {
            action = 'presence_of_mind',
            condition = 'buff.arcane_power.remains>2*gcd',
            condition_converted = '((arcane_power.aura_remains_as_number) > ((2 * gcd_as_number)))',
            condition_keywords = {
                'arcane_power.aura_remains',
                'gcd',
            },
            simc_line = 'actions.burn+=/presence_of_mind,if=buff.arcane_power.remains>2*gcd',
        },
        {
            action = 'nether_tempest',
            condition = 'dot.nether_tempest.remains<=2|!ticking',
            condition_converted = '((((nether_tempest.aura_remains_as_number) <= (2))) or ((not (nether_tempest.aura_up))))',
            condition_keywords = {
                'nether_tempest.aura_remains',
                'nether_tempest.aura_up',
            },
            simc_line = 'actions.burn+=/nether_tempest,if=dot.nether_tempest.remains<=2|!ticking',
        },
        {
            action = 'arcane_blast',
            condition = 'active_enemies<=1&mana.pct%10*execute_time>target.time_to_die',
            condition_converted = '((((active_enemies_as_number) <= (1))) and ((((mana.percent_as_number / 10 * execute_time_as_number)) > (target.time_to_die_as_number))))',
            condition_keywords = {
                'active_enemies',
                'execute_time',
                'mana.percent',
                'target.time_to_die',
            },
            simc_line = 'actions.burn+=/arcane_blast,if=active_enemies<=1&mana.pct%10*execute_time>target.time_to_die',
        },
        {
            action = 'arcane_explosion',
            condition = 'active_enemies>1&mana.pct%10*execute_time>target.time_to_die',
            condition_converted = '((((active_enemies_as_number) > (1))) and ((((mana.percent_as_number / 10 * execute_time_as_number)) > (target.time_to_die_as_number))))',
            condition_keywords = {
                'active_enemies',
                'execute_time',
                'mana.percent',
                'target.time_to_die',
            },
            simc_line = 'actions.burn+=/arcane_explosion,if=active_enemies>1&mana.pct%10*execute_time>target.time_to_die',
        },
        {
            action = 'arcane_missiles',
            condition = 'buff.arcane_missiles.react>1',
            condition_converted = '((arcane_missiles.aura_up_as_number) > (1))',
            condition_keywords = {
                'arcane_missiles.aura_up',
            },
            simc_line = 'actions.burn+=/arcane_missiles,if=buff.arcane_missiles.react>1',
        },
        {
            action = 'arcane_explosion',
            condition = 'active_enemies>1&buff.arcane_power.remains>cast_time',
            condition_converted = '((((active_enemies_as_number) > (1))) and (((arcane_power.aura_remains_as_number) > (arcane_explosion.spell_cast_time_as_number))))',
            condition_keywords = {
                'active_enemies',
                'arcane_explosion.spell_cast_time',
                'arcane_power.aura_remains',
            },
            simc_line = 'actions.burn+=/arcane_explosion,if=active_enemies>1&buff.arcane_power.remains>cast_time',
        },
        {
            action = 'arcane_blast',
            condition = 'buff.presence_of_mind.up|buff.arcane_power.remains>cast_time',
            condition_converted = '((presence_of_mind.aura_up) or (((arcane_power.aura_remains_as_number) > (arcane_blast.spell_cast_time_as_number))))',
            condition_keywords = {
                'arcane_blast.spell_cast_time',
                'arcane_power.aura_remains',
                'presence_of_mind.aura_up',
            },
            simc_line = 'actions.burn+=/arcane_blast,if=buff.presence_of_mind.up|buff.arcane_power.remains>cast_time',
        },
        {
            action = 'supernova',
            condition = 'mana.pct<100',
            condition_converted = '((mana.percent_as_number) < (100))',
            condition_keywords = {
                'mana.percent',
            },
            simc_line = 'actions.burn+=/supernova,if=mana.pct<100',
        },
        {
            action = 'arcane_missiles',
            condition = 'mana.pct>10&(talent.overpowered.enabled|buff.arcane_power.down)',
            condition_converted = '((((mana.percent_as_number) > (10))) and ((((overpowered.talent_selected) or (arcane_power.aura_down)))))',
            condition_keywords = {
                'arcane_power.aura_down',
                'mana.percent',
                'overpowered.talent_selected',
            },
            simc_line = 'actions.burn+=/arcane_missiles,if=mana.pct>10&(talent.overpowered.enabled|buff.arcane_power.down)',
        },
        {
            action = 'arcane_explosion',
            condition = 'active_enemies>1',
            condition_converted = '((active_enemies_as_number) > (1))',
            condition_keywords = {
                'active_enemies',
            },
            simc_line = 'actions.burn+=/arcane_explosion,if=active_enemies>1',
        },
        {
            action = 'arcane_blast',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.burn+=/arcane_blast',
        },
        {
            action = 'evocation',
            condition = 'true',
            condition_converted = 'true',
            interrupt_if = 'mana.pct>99',
            simc_line = 'actions.burn+=/evocation,interrupt_if=mana.pct>99',
        },
    },
    conserve = {
        {
            action = 'arcane_missiles',
            condition = 'buff.arcane_missiles.react=3',
            condition_converted = '((arcane_missiles.aura_up) == (3))',
            condition_keywords = {
                'arcane_missiles.aura_up',
            },
            simc_line = 'actions.conserve=arcane_missiles,if=buff.arcane_missiles.react=3',
        },
        {
            action = 'arcane_explosion',
            condition = 'buff.quickening.remains<action.arcane_blast.cast_time&talent.quickening.enabled',
            condition_converted = '((((quickening.aura_remains_as_number) < (arcane_blast.spell_cast_time_as_number))) and (quickening.talent_selected))',
            condition_keywords = {
                'arcane_blast.spell_cast_time',
                'quickening.aura_remains',
                'quickening.talent_selected',
            },
            simc_line = 'actions.conserve+=/arcane_explosion,if=buff.quickening.remains<action.arcane_blast.cast_time&talent.quickening.enabled',
        },
        {
            action = 'arcane_blast',
            condition = 'mana.pct>99',
            condition_converted = '((mana.percent_as_number) > (99))',
            condition_keywords = {
                'mana.percent',
            },
            simc_line = 'actions.conserve+=/arcane_blast,if=mana.pct>99',
        },
        {
            action = 'nether_tempest',
            condition = '(refreshable|!ticking)',
            condition_converted = '(((refreshable) or ((not (nether_tempest.aura_up)))))',
            condition_keywords = {
                'nether_tempest.aura_up',
                'refreshable',
            },
            simc_line = 'actions.conserve+=/nether_tempest,if=(refreshable|!ticking)',
        },
        {
            action = 'arcane_blast',
            condition = 'buff.rhonins_assaulting_armwraps.up&equipped.132413',
            condition_converted = '((rhonins_assaulting_armwraps.aura_up) and (equipped[132413]))',
            condition_keywords = {
                'equipped',
                'rhonins_assaulting_armwraps.aura_up',
            },
            simc_line = 'actions.conserve+=/arcane_blast,if=buff.rhonins_assaulting_armwraps.up&equipped.132413',
        },
        {
            action = 'arcane_missiles',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.conserve+=/arcane_missiles',
        },
        {
            action = 'supernova',
            condition = 'mana.pct<100',
            condition_converted = '((mana.percent_as_number) < (100))',
            condition_keywords = {
                'mana.percent',
            },
            simc_line = 'actions.conserve+=/supernova,if=mana.pct<100',
        },
        {
            action = 'frost_nova',
            condition = 'equipped.132452',
            condition_converted = 'equipped[132452]',
            condition_keywords = {
                'equipped',
            },
            simc_line = 'actions.conserve+=/frost_nova,if=equipped.132452',
        },
        {
            action = 'arcane_explosion',
            condition = 'mana.pct>=82&equipped.132451&active_enemies>1',
            condition_converted = '((((mana.percent_as_number) >= (82))) and (((equipped[132451]) and (((active_enemies_as_number) > (1))))))',
            condition_keywords = {
                'active_enemies',
                'equipped',
                'mana.percent',
            },
            simc_line = 'actions.conserve+=/arcane_explosion,if=mana.pct>=82&equipped.132451&active_enemies>1',
        },
        {
            action = 'arcane_blast',
            condition = 'mana.pct>=82&equipped.132451',
            condition_converted = '((((mana.percent_as_number) >= (82))) and (equipped[132451]))',
            condition_keywords = {
                'equipped',
                'mana.percent',
            },
            simc_line = 'actions.conserve+=/arcane_blast,if=mana.pct>=82&equipped.132451',
        },
        {
            action = 'arcane_barrage',
            condition = 'mana.pct<100&cooldown.arcane_power.remains>5',
            condition_converted = '((((mana.percent_as_number) < (100))) and (((arcane_power.cooldown_remains_as_number) > (5))))',
            condition_keywords = {
                'arcane_power.cooldown_remains',
                'mana.percent',
            },
            simc_line = 'actions.conserve+=/arcane_barrage,if=mana.pct<100&cooldown.arcane_power.remains>5',
        },
        {
            action = 'arcane_explosion',
            condition = 'active_enemies>1',
            condition_converted = '((active_enemies_as_number) > (1))',
            condition_keywords = {
                'active_enemies',
            },
            simc_line = 'actions.conserve+=/arcane_explosion,if=active_enemies>1',
        },
        {
            action = 'arcane_blast',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.conserve+=/arcane_blast',
        },
    },
    cooldowns = {
        {
            action = 'rune_of_power',
            condition = 'mana.pct>45&buff.arcane_power.down',
            condition_converted = '((((mana.percent_as_number) > (45))) and (arcane_power.aura_down))',
            condition_keywords = {
                'arcane_power.aura_down',
                'mana.percent',
            },
            simc_line = 'actions.cooldowns=rune_of_power,if=mana.pct>45&buff.arcane_power.down',
        },
        {
            action = 'arcane_power',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cooldowns+=/arcane_power',
        },
        {
            action = 'blood_fury',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cooldowns+=/blood_fury',
        },
        {
            action = 'berserking',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cooldowns+=/berserking',
        },
        {
            action = 'arcane_torrent',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cooldowns+=/arcane_torrent',
        },
        {
            action = 'potion',
            condition = 'buff.arcane_power.up&(buff.berserking.up|buff.blood_fury.up)',
            condition_converted = '((arcane_power.aura_up) and ((((berserking.aura_up) or (blood_fury.aura_up)))))',
            condition_keywords = {
                'arcane_power.aura_up',
                'berserking.aura_up',
                'blood_fury.aura_up',
            },
            name = 'deadly_grace',
            simc_line = 'actions.cooldowns+=/potion,name=deadly_grace,if=buff.arcane_power.up&(buff.berserking.up|buff.blood_fury.up)',
        },
    },
    default = {
        {
            action = 'counterspell',
            condition = 'target.debuff.casting.react',
            condition_converted = 'casting.aura_up',
            condition_keywords = {
                'casting.aura_up',
            },
            simc_line = 'actions=counterspell,if=target.debuff.casting.react',
        },
        {
            action = 'time_warp',
            condition = '(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
            condition_converted = '(((((((time_since_combat_start) == (0))) and (bloodlust.aura_down)))) or ((((bloodlust.aura_down) and (equipped[132410])))))',
            condition_keywords = {
                'bloodlust.aura_down',
                'equipped',
                'time_since_combat_start',
            },
            simc_line = 'actions+=/time_warp,if=(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
        },
        {
            action = 'mirror_image',
            condition = 'buff.arcane_power.down',
            condition_converted = 'arcane_power.aura_down',
            condition_keywords = {
                'arcane_power.aura_down',
            },
            simc_line = 'actions+=/mirror_image,if=buff.arcane_power.down',
        },
        {
            action = 'stop_burn_phase',
            condition = 'prev_gcd.evocation&burn_phase_duration>gcd_max',
            condition_converted = '((prev_gcd.evocation) and (((burn_phase_duration_as_number) > (gcd_max_as_number))))',
            condition_keywords = {
                'burn_phase_duration',
                'gcd_max',
                'prev_gcd.evocation',
            },
            simc_line = 'actions+=/stop_burn_phase,if=prev_gcd.evocation&burn_phase_duration>gcd_max',
        },
        {
            action = 'mark_of_aluneth',
            condition = 'cooldown.arcane_power.remains>20',
            condition_converted = '((arcane_power.cooldown_remains_as_number) > (20))',
            condition_keywords = {
                'arcane_power.cooldown_remains',
            },
            simc_line = 'actions+=/mark_of_aluneth,if=cooldown.arcane_power.remains>20',
        },
        {
            action = 'call_action_list',
            condition = 'buff.arcane_charge.stack<4',
            condition_converted = '((arcane_charge.aura_stack_as_number) < (4))',
            condition_keywords = {
                'arcane_charge.aura_stack',
            },
            name = 'build',
            simc_line = 'actions+=/call_action_list,name=build,if=buff.arcane_charge.stack<4',
        },
        {
            action = 'call_action_list',
            condition = 'buff.arcane_power.down&buff.arcane_charge.stack=4&(cooldown.mark_of_aluneth.remains=0|cooldown.mark_of_aluneth.remains>20)&(!talent.rune_of_power.enabled|(cooldown.arcane_power.remains<=action.rune_of_power.cast_time|action.rune_of_power.recharge_time<cooldown.arcane_power.remains))|target.time_to_die<45',
            condition_converted = '((((arcane_power.aura_down) and (((((arcane_charge.aura_stack) == (4))) and ((((((((mark_of_aluneth.cooldown_remains) == (0))) or (((mark_of_aluneth.cooldown_remains_as_number) > (20)))))) and (((((not (rune_of_power.talent_selected))) or ((((((arcane_power.cooldown_remains_as_number) <= (rune_of_power.spell_cast_time_as_number))) or (((rune_of_power.spell_recharge_time_as_number) < (arcane_power.cooldown_remains_as_number))))))))))))))) or (((target.time_to_die_as_number) < (45))))',
            condition_keywords = {
                'arcane_charge.aura_stack',
                'arcane_power.aura_down',
                'arcane_power.cooldown_remains',
                'mark_of_aluneth.cooldown_remains',
                'rune_of_power.spell_cast_time',
                'rune_of_power.spell_recharge_time',
                'rune_of_power.talent_selected',
                'target.time_to_die',
            },
            name = 'init_burn',
            simc_line = 'actions+=/call_action_list,name=init_burn,if=buff.arcane_power.down&buff.arcane_charge.stack=4&(cooldown.mark_of_aluneth.remains=0|cooldown.mark_of_aluneth.remains>20)&(!talent.rune_of_power.enabled|(cooldown.arcane_power.remains<=action.rune_of_power.cast_time|action.rune_of_power.recharge_time<cooldown.arcane_power.remains))|target.time_to_die<45',
        },
        {
            action = 'call_action_list',
            condition = 'burn_phase',
            condition_converted = 'burn_phase',
            condition_keywords = {
                'burn_phase',
            },
            name = 'burn',
            simc_line = 'actions+=/call_action_list,name=burn,if=burn_phase',
        },
        {
            action = 'call_action_list',
            condition = 'buff.rune_of_power.up&!burn_phase',
            condition_converted = '((rune_of_power.aura_up) and ((not (burn_phase))))',
            condition_keywords = {
                'burn_phase',
                'rune_of_power.aura_up',
            },
            name = 'rop_phase',
            simc_line = 'actions+=/call_action_list,name=rop_phase,if=buff.rune_of_power.up&!burn_phase',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'conserve',
            simc_line = 'actions+=/call_action_list,name=conserve',
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
            action = 'summon_arcane_familiar',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/summon_arcane_familiar',
        },
        {
            action = 'snapshot_stats',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/snapshot_stats',
        },
        {
            action = 'mirror_image',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/mirror_image',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'deadly_grace',
            simc_line = 'actions.precombat+=/potion,name=deadly_grace',
        },
        {
            action = 'arcane_blast',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/arcane_blast',
        },
    },
}


-- keywords: legion-dev::mage::fire
---- bloodlust.aura_down
---- casting.aura_up
---- combustion.aura_down
---- combustion.aura_up
---- combustion.cooldown_remains
---- equipped
---- flame_on.cooldown_remains
---- gcd
---- kindling.talent_selected
---- rune_of_power.aura_up
---- rune_of_power.spell_cast_time
---- rune_of_power.spell_charges_fractional
---- time_since_combat_start
---- time_to_die.target_remains

internal.actions['legion-dev::mage::fire'] = {
    default = {
        {
            action = 'counterspell',
            condition = 'target.debuff.casting.react',
            condition_converted = 'casting.aura_up',
            condition_keywords = {
                'casting.aura_up',
            },
            simc_line = 'actions=counterspell,if=target.debuff.casting.react',
        },
        {
            action = 'time_warp',
            condition = '(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
            condition_converted = '(((((((time_since_combat_start) == (0))) and (bloodlust.aura_down)))) or ((((bloodlust.aura_down) and (equipped[132410])))))',
            condition_keywords = {
                'bloodlust.aura_down',
                'equipped',
                'time_since_combat_start',
            },
            simc_line = 'actions+=/time_warp,if=(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
        },
        {
            action = 'mirror_image',
            condition = 'buff.combustion.down',
            condition_converted = 'combustion.aura_down',
            condition_keywords = {
                'combustion.aura_down',
            },
            simc_line = 'actions+=/mirror_image,if=buff.combustion.down',
        },
        {
            action = 'rune_of_power',
            condition = 'cooldown.combustion.remains>40&buff.combustion.down&(cooldown.flame_on.remains<5|cooldown.flame_on.remains>30)&!talent.kindling.enabled|target.time_to_die.remains<11|talent.kindling.enabled&(charges_fractional>1.8|time<40)&cooldown.combustion.remains>40',
            condition_converted = '((((((combustion.cooldown_remains_as_number) > (40))) and (((combustion.aura_down) and ((((((((flame_on.cooldown_remains_as_number) < (5))) or (((flame_on.cooldown_remains_as_number) > (30)))))) and ((not (kindling.talent_selected))))))))) or (((((time_to_die.target_remains_as_number) < (11))) or (((kindling.talent_selected) and ((((((((rune_of_power.spell_charges_fractional_as_number) > (1.8))) or (((time_since_combat_start_as_number) < (40)))))) and (((combustion.cooldown_remains_as_number) > (40))))))))))',
            condition_keywords = {
                'combustion.aura_down',
                'combustion.cooldown_remains',
                'flame_on.cooldown_remains',
                'kindling.talent_selected',
                'rune_of_power.spell_charges_fractional',
                'time_since_combat_start',
                'time_to_die.target_remains',
            },
            simc_line = 'actions+=/rune_of_power,if=cooldown.combustion.remains>40&buff.combustion.down&(cooldown.flame_on.remains<5|cooldown.flame_on.remains>30)&!talent.kindling.enabled|target.time_to_die.remains<11|talent.kindling.enabled&(charges_fractional>1.8|time<40)&cooldown.combustion.remains>40',
        },
        {
            action = 'call_action_list',
            condition = 'cooldown.combustion.remains<=action.rune_of_power.cast_time+(!talent.kindling.enabled*gcd)|buff.combustion.up',
            condition_converted = '((((combustion.cooldown_remains_as_number) <= ((rune_of_power.spell_cast_time_as_number + ((not ((kindling.talent_selected_as_number * gcd_as_number)))))))) or (combustion.aura_up))',
            condition_keywords = {
                'combustion.aura_up',
                'combustion.cooldown_remains',
                'gcd',
                'kindling.talent_selected',
                'rune_of_power.spell_cast_time',
            },
            name = 'combustion_phase',
            simc_line = 'actions+=/call_action_list,name=combustion_phase,if=cooldown.combustion.remains<=action.rune_of_power.cast_time+(!talent.kindling.enabled*gcd)|buff.combustion.up',
        },
        {
            action = 'call_action_list',
            condition = 'buff.rune_of_power.up&buff.combustion.down',
            condition_converted = '((rune_of_power.aura_up) and (combustion.aura_down))',
            condition_keywords = {
                'combustion.aura_down',
                'rune_of_power.aura_up',
            },
            name = 'rop_phase',
            simc_line = 'actions+=/call_action_list,name=rop_phase,if=buff.rune_of_power.up&buff.combustion.down',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'single_target',
            simc_line = 'actions+=/call_action_list,name=single_target',
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
            action = 'mirror_image',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/mirror_image',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'deadly_grace',
            simc_line = 'actions.precombat+=/potion,name=deadly_grace',
        },
        {
            action = 'pyroblast',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/pyroblast',
        },
    },
}


-- keywords: legion-dev::mage::frost
---- active_enemies
---- arctic_gale.talent_selected
---- blizzard.spell_cast_time
---- bloodlust.aura_down
---- brain_freeze.aura_up
---- casting.aura_up
---- equipped
---- fingers_of_frost.aura_stack
---- fingers_of_frost.aura_up
---- frost_bomb.aura_remains
---- ice_lance.spell_travel_time
---- icy_hand.artifact_selected
---- icy_veins.aura_down
---- icy_veins.aura_up
---- icy_veins.cooldown_remains
---- prev_gcd.flurry
---- prev_gcd.frostbolt
---- prev_off_gcd.water_jet
---- ray_of_frost.spell_cooldown
---- rune_of_power.aura_down
---- rune_of_power.spell_cast_time
---- rune_of_power.spell_charges_fractional
---- thermal_void.talent_selected
---- time_since_combat_start
---- time_to_die.target_remains
---- winters_chill.aura_up
---- zannesu_journey.aura_remains
---- zannesu_journey.aura_stack

internal.actions['legion-dev::mage::frost'] = {
    cooldowns = {
        {
            action = 'rune_of_power',
            condition = 'cooldown.icy_veins.remains<cast_time|charges_fractional>1.9&cooldown.icy_veins.remains>10|buff.icy_veins.up|target.time_to_die.remains+5<charges_fractional*10',
            condition_converted = '((((icy_veins.cooldown_remains_as_number) < (rune_of_power.spell_cast_time_as_number))) or (((((((rune_of_power.spell_charges_fractional_as_number) > (1.9))) and (((icy_veins.cooldown_remains_as_number) > (10))))) or (((icy_veins.aura_up) or ((((time_to_die.target_remains_as_number + 5)) < ((rune_of_power.spell_charges_fractional_as_number * 10)))))))))',
            condition_keywords = {
                'icy_veins.aura_up',
                'icy_veins.cooldown_remains',
                'rune_of_power.spell_cast_time',
                'rune_of_power.spell_charges_fractional',
                'time_to_die.target_remains',
            },
            simc_line = 'actions.cooldowns=rune_of_power,if=cooldown.icy_veins.remains<cast_time|charges_fractional>1.9&cooldown.icy_veins.remains>10|buff.icy_veins.up|target.time_to_die.remains+5<charges_fractional*10',
        },
        {
            action = 'icy_veins',
            condition = 'buff.icy_veins.down',
            condition_converted = 'icy_veins.aura_down',
            condition_keywords = {
                'icy_veins.aura_down',
            },
            simc_line = 'actions.cooldowns+=/icy_veins,if=buff.icy_veins.down',
        },
        {
            action = 'mirror_image',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cooldowns+=/mirror_image',
        },
        {
            action = 'blood_fury',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cooldowns+=/blood_fury',
        },
        {
            action = 'berserking',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cooldowns+=/berserking',
        },
        {
            action = 'arcane_torrent',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cooldowns+=/arcane_torrent',
        },
        {
            action = 'potion',
            condition = 'cooldown.icy_veins.remains<1',
            condition_converted = '((icy_veins.cooldown_remains_as_number) < (1))',
            condition_keywords = {
                'icy_veins.cooldown_remains',
            },
            name = 'potion_of_prolonged_power',
            simc_line = 'actions.cooldowns+=/potion,name=potion_of_prolonged_power,if=cooldown.icy_veins.remains<1',
        },
    },
    default = {
        {
            action = 'counterspell',
            condition = 'target.debuff.casting.react',
            condition_converted = 'casting.aura_up',
            condition_keywords = {
                'casting.aura_up',
            },
            simc_line = 'actions=counterspell,if=target.debuff.casting.react',
        },
        {
            action = 'ice_lance',
            condition = 'buff.fingers_of_frost.react=0&prev_gcd.flurry',
            condition_converted = '((((fingers_of_frost.aura_up) == (0))) and (prev_gcd.flurry))',
            condition_keywords = {
                'fingers_of_frost.aura_up',
                'prev_gcd.flurry',
            },
            simc_line = 'actions+=/ice_lance,if=buff.fingers_of_frost.react=0&prev_gcd.flurry',
        },
        {
            action = 'time_warp',
            condition = '(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
            condition_converted = '(((((((time_since_combat_start) == (0))) and (bloodlust.aura_down)))) or ((((bloodlust.aura_down) and (equipped[132410])))))',
            condition_keywords = {
                'bloodlust.aura_down',
                'equipped',
                'time_since_combat_start',
            },
            simc_line = 'actions+=/time_warp,if=(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'cooldowns',
            simc_line = 'actions+=/call_action_list,name=cooldowns',
        },
        {
            action = 'ice_nova',
            condition = 'debuff.winters_chill.up',
            condition_converted = 'winters_chill.aura_up',
            condition_keywords = {
                'winters_chill.aura_up',
            },
            simc_line = 'actions+=/ice_nova,if=debuff.winters_chill.up',
        },
        {
            action = 'frostbolt',
            condition = 'prev_off_gcd.water_jet',
            condition_converted = 'prev_off_gcd.water_jet',
            condition_keywords = {
                'prev_off_gcd.water_jet',
            },
            simc_line = 'actions+=/frostbolt,if=prev_off_gcd.water_jet',
        },
        {
            action = 'water_jet',
            condition = 'prev_gcd.frostbolt&buff.fingers_of_frost.stack<(2+artifact.icy_hand.enabled)&buff.brain_freeze.react=0',
            condition_converted = '((prev_gcd.frostbolt) and (((((fingers_of_frost.aura_stack_as_number) < ((2 + icy_hand.artifact_selected_as_number)))) and (((brain_freeze.aura_up) == (0))))))',
            condition_keywords = {
                'brain_freeze.aura_up',
                'fingers_of_frost.aura_stack',
                'icy_hand.artifact_selected',
                'prev_gcd.frostbolt',
            },
            simc_line = 'actions+=/water_jet,if=prev_gcd.frostbolt&buff.fingers_of_frost.stack<(2+artifact.icy_hand.enabled)&buff.brain_freeze.react=0',
        },
        {
            action = 'ray_of_frost',
            condition = 'buff.icy_veins.up|(cooldown.icy_veins.remains>action.ray_of_frost.cooldown&buff.rune_of_power.down)',
            condition_converted = '((icy_veins.aura_up) or ((((((icy_veins.cooldown_remains_as_number) > (ray_of_frost.spell_cooldown_as_number))) and (rune_of_power.aura_down)))))',
            condition_keywords = {
                'icy_veins.aura_up',
                'icy_veins.cooldown_remains',
                'ray_of_frost.spell_cooldown',
                'rune_of_power.aura_down',
            },
            simc_line = 'actions+=/ray_of_frost,if=buff.icy_veins.up|(cooldown.icy_veins.remains>action.ray_of_frost.cooldown&buff.rune_of_power.down)',
        },
        {
            action = 'flurry',
            condition = 'buff.brain_freeze.react&buff.fingers_of_frost.react=0&prev_gcd.frostbolt',
            condition_converted = '((brain_freeze.aura_up) and (((((fingers_of_frost.aura_up) == (0))) and (prev_gcd.frostbolt))))',
            condition_keywords = {
                'brain_freeze.aura_up',
                'fingers_of_frost.aura_up',
                'prev_gcd.frostbolt',
            },
            simc_line = 'actions+=/flurry,if=buff.brain_freeze.react&buff.fingers_of_frost.react=0&prev_gcd.frostbolt',
        },
        {
            action = 'frozen_touch',
            condition = 'buff.fingers_of_frost.stack<=(0+artifact.icy_hand.enabled)&((cooldown.icy_veins.remains>30&talent.thermal_void.enabled)|!talent.thermal_void.enabled)',
            condition_converted = '((((fingers_of_frost.aura_stack_as_number) <= ((0 + icy_hand.artifact_selected_as_number)))) and (((((((((icy_veins.cooldown_remains_as_number) > (30))) and (thermal_void.talent_selected)))) or ((not (thermal_void.talent_selected)))))))',
            condition_keywords = {
                'fingers_of_frost.aura_stack',
                'icy_hand.artifact_selected',
                'icy_veins.cooldown_remains',
                'thermal_void.talent_selected',
            },
            simc_line = 'actions+=/frozen_touch,if=buff.fingers_of_frost.stack<=(0+artifact.icy_hand.enabled)&((cooldown.icy_veins.remains>30&talent.thermal_void.enabled)|!talent.thermal_void.enabled)',
        },
        {
            action = 'frost_bomb',
            condition = 'debuff.frost_bomb.remains<action.ice_lance.travel_time&buff.fingers_of_frost.react>0',
            condition_converted = '((((frost_bomb.aura_remains_as_number) < (ice_lance.spell_travel_time_as_number))) and (((fingers_of_frost.aura_up_as_number) > (0))))',
            condition_keywords = {
                'fingers_of_frost.aura_up',
                'frost_bomb.aura_remains',
                'ice_lance.spell_travel_time',
            },
            simc_line = 'actions+=/frost_bomb,if=debuff.frost_bomb.remains<action.ice_lance.travel_time&buff.fingers_of_frost.react>0',
        },
        {
            action = 'ice_lance',
            condition = 'buff.fingers_of_frost.react>0&cooldown.icy_veins.remains>10|buff.fingers_of_frost.react>2',
            condition_converted = '((((((fingers_of_frost.aura_up_as_number) > (0))) and (((icy_veins.cooldown_remains_as_number) > (10))))) or (((fingers_of_frost.aura_up_as_number) > (2))))',
            condition_keywords = {
                'fingers_of_frost.aura_up',
                'icy_veins.cooldown_remains',
            },
            simc_line = 'actions+=/ice_lance,if=buff.fingers_of_frost.react>0&cooldown.icy_veins.remains>10|buff.fingers_of_frost.react>2',
        },
        {
            action = 'frozen_orb',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/frozen_orb',
        },
        {
            action = 'ice_nova',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/ice_nova',
        },
        {
            action = 'comet_storm',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/comet_storm',
        },
        {
            action = 'blizzard',
            condition = 'talent.arctic_gale.enabled|active_enemies>1|((buff.zannesu_journey.stack>4|buff.zannesu_journey.remains<cast_time+1)&equipped.133970)',
            condition_converted = '((arctic_gale.talent_selected) or (((((active_enemies_as_number) > (1))) or (((((((((zannesu_journey.aura_stack_as_number) > (4))) or (((zannesu_journey.aura_remains_as_number) < ((blizzard.spell_cast_time_as_number + 1))))))) and (equipped[133970])))))))',
            condition_keywords = {
                'active_enemies',
                'arctic_gale.talent_selected',
                'blizzard.spell_cast_time',
                'equipped',
                'zannesu_journey.aura_remains',
                'zannesu_journey.aura_stack',
            },
            simc_line = 'actions+=/blizzard,if=talent.arctic_gale.enabled|active_enemies>1|((buff.zannesu_journey.stack>4|buff.zannesu_journey.remains<cast_time+1)&equipped.133970)',
        },
        {
            action = 'ebonbolt',
            condition = 'buff.fingers_of_frost.stack<=(0+artifact.icy_hand.enabled)',
            condition_converted = '((fingers_of_frost.aura_stack_as_number) <= ((0 + icy_hand.artifact_selected_as_number)))',
            condition_keywords = {
                'fingers_of_frost.aura_stack',
                'icy_hand.artifact_selected',
            },
            simc_line = 'actions+=/ebonbolt,if=buff.fingers_of_frost.stack<=(0+artifact.icy_hand.enabled)',
        },
        {
            action = 'glacial_spike',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/glacial_spike',
        },
        {
            action = 'frostbolt',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/frostbolt',
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
            action = 'water_elemental',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/water_elemental',
        },
        {
            action = 'snapshot_stats',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/snapshot_stats',
        },
        {
            action = 'mirror_image',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/mirror_image',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'deadly_grace',
            simc_line = 'actions.precombat+=/potion,name=deadly_grace',
        },
        {
            action = 'frostbolt',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/frostbolt',
        },
    },
}


