local _, internal = ...
internal.apls = internal.apls or {}
internal.actions = internal.actions or {}

internal.apls["legion-dev::mage::arcane"] = [[
actions.precombat=flask,type=flask_of_the_whispered_pact
actions.precombat+=/food,type=the_hungry_magister
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/summon_arcane_familiar
actions.precombat+=/snapshot_stats
actions.precombat+=/mirror_image
actions.precombat+=/potion,name=deadly_grace
actions.precombat+=/arcane_blast
actions=counterspell,if=target.debuff.casting.react
actions+=/time_warp,if=(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)
actions+=/mirror_image,if=buff.arcane_power.down
actions+=/stop_burn_phase,if=prev_gcd.evocation&burn_phase_duration>gcd.max
actions+=/mark_of_aluneth,if=cooldown.arcane_power.remains>20
actions+=/call_action_list,name=build,if=buff.arcane_charge.stack<4
actions+=/call_action_list,name=init_burn,if=buff.arcane_power.down&buff.arcane_charge.stack=4&(cooldown.mark_of_aluneth.remains=0|cooldown.mark_of_aluneth.remains>20)&(!talent.rune_of_power.enabled|(cooldown.arcane_power.remains<=action.rune_of_power.cast_time|action.rune_of_power.recharge_time<cooldown.arcane_power.remains))|target.time_to_die<45
actions+=/call_action_list,name=burn,if=burn_phase
actions+=/call_action_list,name=rop_phase,if=buff.rune_of_power.up&!burn_phase
actions+=/call_action_list,name=conserve
actions.build=charged_up,if=buff.arcane_charge.stack<=1
actions.build+=/arcane_missiles,if=buff.arcane_missiles.react=3
actions.build+=/arcane_orb
actions.build+=/arcane_explosion,if=active_enemies>1
actions.build+=/arcane_blast
actions.burn=call_action_list,name=cooldowns
actions.burn+=/arcane_missiles,if=buff.arcane_missiles.react=3
actions.burn+=/arcane_explosion,if=buff.quickening.remains<action.arcane_blast.cast_time&talent.quickening.enabled
actions.burn+=/presence_of_mind,if=buff.arcane_power.remains>2*gcd
actions.burn+=/nether_tempest,if=dot.nether_tempest.remains<=2|!ticking
actions.burn+=/arcane_blast,if=active_enemies<=1&mana.pct%10*execute_time>target.time_to_die
actions.burn+=/arcane_explosion,if=active_enemies>1&mana.pct%10*execute_time>target.time_to_die
actions.burn+=/arcane_missiles,if=buff.arcane_missiles.react>1
actions.burn+=/arcane_explosion,if=active_enemies>1&buff.arcane_power.remains>cast_time
actions.burn+=/arcane_blast,if=buff.presence_of_mind.up|buff.arcane_power.remains>cast_time
actions.burn+=/supernova,if=mana.pct<100
actions.burn+=/arcane_missiles,if=mana.pct>10&(talent.overpowered.enabled|buff.arcane_power.down)
actions.burn+=/arcane_explosion,if=active_enemies>1
actions.burn+=/arcane_blast
actions.burn+=/evocation,interrupt_if=mana.pct>99
actions.conserve=arcane_missiles,if=buff.arcane_missiles.react=3
actions.conserve+=/arcane_explosion,if=buff.quickening.remains<action.arcane_blast.cast_time&talent.quickening.enabled
actions.conserve+=/arcane_blast,if=mana.pct>99
actions.conserve+=/nether_tempest,if=(refreshable|!ticking)
actions.conserve+=/arcane_blast,if=buff.rhonins_assaulting_armwraps.up&equipped.132413
actions.conserve+=/arcane_missiles
actions.conserve+=/supernova,if=mana.pct<100
actions.conserve+=/frost_nova,if=equipped.132452
actions.conserve+=/arcane_explosion,if=mana.pct>=82&equipped.132451&active_enemies>1
actions.conserve+=/arcane_blast,if=mana.pct>=82&equipped.132451
actions.conserve+=/arcane_barrage,if=mana.pct<100&cooldown.arcane_power.remains>5
actions.conserve+=/arcane_explosion,if=active_enemies>1
actions.conserve+=/arcane_blast
actions.cooldowns=rune_of_power,if=mana.pct>45&buff.arcane_power.down
actions.cooldowns+=/arcane_power
actions.cooldowns+=/blood_fury
actions.cooldowns+=/berserking
actions.cooldowns+=/arcane_torrent
actions.cooldowns+=/potion,name=deadly_grace,if=buff.arcane_power.up&(buff.berserking.up|buff.blood_fury.up)
actions.init_burn=mark_of_aluneth
actions.init_burn+=/frost_nova,if=equipped.132452
actions.init_burn+=/nether_tempest,if=dot.nether_tempest.remains<10&(prev_gcd.mark_of_aluneth|(talent.rune_of_power.enabled&cooldown.rune_of_power.remains<gcd.max))
actions.init_burn+=/rune_of_power
actions.init_burn+=/start_burn_phase,if=((cooldown.evocation.remains-(2*burn_phase_duration))%2<burn_phase_duration)|cooldown.arcane_power.remains=0|target.time_to_die<55
actions.rop_phase=arcane_missiles,if=buff.arcane_missiles.react=3
actions.rop_phase+=/arcane_explosion,if=buff.quickening.remains<action.arcane_blast.cast_time&talent.quickening.enabled
actions.rop_phase+=/nether_tempest,if=dot.nether_tempest.remains<=2|!ticking
actions.rop_phase+=/arcane_missiles,if=buff.arcane_charge.stack=4
actions.rop_phase+=/arcane_explosion,if=active_enemies>1
actions.rop_phase+=/arcane_blast,if=mana.pct>45
actions.rop_phase+=/arcane_barrage
]]

-- keywords: legion-dev::mage::arcane
---- active_enemies
---- arcane_blast.spell_cast_time
---- arcane_charge.spell_stack
---- arcane_explosion.spell_cast_time
---- arcane_missiles.spell_remains
---- arcane_power.cooldown_remains
---- arcane_power.spell_remains
---- berserking.spell_remains
---- blood_fury.spell_remains
---- bloodlust.spell_remains
---- burn_phase
---- burn_phase_duration
---- casting.spell_remains
---- equipped
---- execute_time
---- gcd
---- gcd.max
---- mana.percent
---- mark_of_aluneth.cooldown_remains
---- nether_tempest.spell_remains
---- nether_tempest.spell_ticking
---- overpowered.talent_enabled
---- presence_of_mind.spell_remains
---- prev_gcd.evocation
---- quickening.spell_remains
---- quickening.talent_enabled
---- refreshable
---- rhonins_assaulting_armwraps.spell_remains
---- rune_of_power.spell_cast_time
---- rune_of_power.spell_recharge_time
---- rune_of_power.spell_remains
---- rune_of_power.talent_enabled
---- target.time_to_die
---- time

internal.actions['legion-dev::mage::arcane'] = {
    build = {
        {
            action = 'charged_up',
            condition = 'buff.arcane_charge.stack<=1',
            condition_converted = '((arcane_charge.spell_stack_as_number) <= (1))',
            condition_keywords = {
                'arcane_charge.spell_stack',
            },
            simc_line = 'actions.build=charged_up,if=buff.arcane_charge.stack<=1',
        },
        {
            action = 'arcane_missiles',
            condition = 'buff.arcane_missiles.react=3',
            condition_converted = '(((arcane_missiles.spell_remains_as_number > 0)) == (3))',
            condition_keywords = {
                'arcane_missiles.spell_remains',
            },
            simc_line = 'actions.build+=/arcane_missiles,if=buff.arcane_missiles.react=3',
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
    },
    burn = {
        {
            action = 'call_action_list',
            name = 'cooldowns',
            simc_line = 'actions.burn=call_action_list,name=cooldowns',
        },
        {
            action = 'arcane_missiles',
            condition = 'buff.arcane_missiles.react=3',
            condition_converted = '(((arcane_missiles.spell_remains_as_number > 0)) == (3))',
            condition_keywords = {
                'arcane_missiles.spell_remains',
            },
            simc_line = 'actions.burn+=/arcane_missiles,if=buff.arcane_missiles.react=3',
        },
        {
            action = 'arcane_explosion',
            condition = 'buff.quickening.remains<action.arcane_blast.cast_time&talent.quickening.enabled',
            condition_converted = '((((quickening.spell_remains_as_number) < (arcane_blast.spell_cast_time_as_number))) and (quickening.talent_enabled))',
            condition_keywords = {
                'arcane_blast.spell_cast_time',
                'quickening.spell_remains',
                'quickening.talent_enabled',
            },
            simc_line = 'actions.burn+=/arcane_explosion,if=buff.quickening.remains<action.arcane_blast.cast_time&talent.quickening.enabled',
        },
        {
            action = 'presence_of_mind',
            condition = 'buff.arcane_power.remains>2*gcd',
            condition_converted = '((arcane_power.spell_remains_as_number) > ((2 * gcd_as_number)))',
            condition_keywords = {
                'arcane_power.spell_remains',
                'gcd',
            },
            simc_line = 'actions.burn+=/presence_of_mind,if=buff.arcane_power.remains>2*gcd',
        },
        {
            action = 'nether_tempest',
            condition = 'dot.nether_tempest.remains<=2|!ticking',
            condition_converted = '((((nether_tempest.spell_remains_as_number) <= (2))) or ((nether_tempest.spell_remains == 0)))',
            condition_keywords = {
                'nether_tempest.spell_remains',
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
            condition_converted = '(((arcane_missiles.spell_remains_as_number > 0)) > (1))',
            condition_keywords = {
                'arcane_missiles.spell_remains',
            },
            simc_line = 'actions.burn+=/arcane_missiles,if=buff.arcane_missiles.react>1',
        },
        {
            action = 'arcane_explosion',
            condition = 'active_enemies>1&buff.arcane_power.remains>cast_time',
            condition_converted = '((((active_enemies_as_number) > (1))) and (((arcane_power.spell_remains_as_number) > (arcane_explosion.spell_cast_time_as_number))))',
            condition_keywords = {
                'active_enemies',
                'arcane_explosion.spell_cast_time',
                'arcane_power.spell_remains',
            },
            simc_line = 'actions.burn+=/arcane_explosion,if=active_enemies>1&buff.arcane_power.remains>cast_time',
        },
        {
            action = 'arcane_blast',
            condition = 'buff.presence_of_mind.up|buff.arcane_power.remains>cast_time',
            condition_converted = '(((presence_of_mind.spell_remains_as_number > 0)) or (((arcane_power.spell_remains_as_number) > (arcane_blast.spell_cast_time_as_number))))',
            condition_keywords = {
                'arcane_blast.spell_cast_time',
                'arcane_power.spell_remains',
                'presence_of_mind.spell_remains',
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
            condition_converted = '((((mana.percent_as_number) > (10))) and ((((overpowered.talent_enabled) or ((arcane_power.spell_remains == 0))))))',
            condition_keywords = {
                'arcane_power.spell_remains',
                'mana.percent',
                'overpowered.talent_enabled',
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
            action = 'evocation',
            interrupt_if = 'mana.pct>99',
            simc_line = 'actions.burn+=/evocation,interrupt_if=mana.pct>99',
        },
    },
    conserve = {
        {
            action = 'arcane_missiles',
            condition = 'buff.arcane_missiles.react=3',
            condition_converted = '(((arcane_missiles.spell_remains_as_number > 0)) == (3))',
            condition_keywords = {
                'arcane_missiles.spell_remains',
            },
            simc_line = 'actions.conserve=arcane_missiles,if=buff.arcane_missiles.react=3',
        },
        {
            action = 'arcane_explosion',
            condition = 'buff.quickening.remains<action.arcane_blast.cast_time&talent.quickening.enabled',
            condition_converted = '((((quickening.spell_remains_as_number) < (arcane_blast.spell_cast_time_as_number))) and (quickening.talent_enabled))',
            condition_keywords = {
                'arcane_blast.spell_cast_time',
                'quickening.spell_remains',
                'quickening.talent_enabled',
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
            condition_converted = '(((refreshable) or ((nether_tempest.spell_remains == 0))))',
            condition_keywords = {
                'nether_tempest.spell_remains',
                'refreshable',
            },
            simc_line = 'actions.conserve+=/nether_tempest,if=(refreshable|!ticking)',
        },
        {
            action = 'arcane_blast',
            condition = 'buff.rhonins_assaulting_armwraps.up&equipped.132413',
            condition_converted = '(((rhonins_assaulting_armwraps.spell_remains_as_number > 0)) and (equipped[132413]))',
            condition_keywords = {
                'equipped',
                'rhonins_assaulting_armwraps.spell_remains',
            },
            simc_line = 'actions.conserve+=/arcane_blast,if=buff.rhonins_assaulting_armwraps.up&equipped.132413',
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
    },
    cooldowns = {
        {
            action = 'rune_of_power',
            condition = 'mana.pct>45&buff.arcane_power.down',
            condition_converted = '((((mana.percent_as_number) > (45))) and ((arcane_power.spell_remains == 0)))',
            condition_keywords = {
                'arcane_power.spell_remains',
                'mana.percent',
            },
            simc_line = 'actions.cooldowns=rune_of_power,if=mana.pct>45&buff.arcane_power.down',
        },
        {
            action = 'potion',
            condition = 'buff.arcane_power.up&(buff.berserking.up|buff.blood_fury.up)',
            condition_converted = '(((arcane_power.spell_remains_as_number > 0)) and (((((berserking.spell_remains_as_number > 0)) or ((blood_fury.spell_remains_as_number > 0))))))',
            condition_keywords = {
                'arcane_power.spell_remains',
                'berserking.spell_remains',
                'blood_fury.spell_remains',
            },
            name = 'deadly_grace',
            simc_line = 'actions.cooldowns+=/potion,name=deadly_grace,if=buff.arcane_power.up&(buff.berserking.up|buff.blood_fury.up)',
        },
    },
    default = {
        {
            action = 'counterspell',
            condition = 'target.debuff.casting.react',
            condition_converted = '(casting.spell_remains_as_number > 0)',
            condition_keywords = {
                'casting.spell_remains',
            },
            simc_line = 'actions=counterspell,if=target.debuff.casting.react',
        },
        {
            action = 'time_warp',
            condition = '(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
            condition_converted = '(((((((time) == (0))) and ((bloodlust.spell_remains == 0))))) or (((((bloodlust.spell_remains == 0)) and (equipped[132410])))))',
            condition_keywords = {
                'bloodlust.spell_remains',
                'equipped',
                'time',
            },
            simc_line = 'actions+=/time_warp,if=(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
        },
        {
            action = 'mirror_image',
            condition = 'buff.arcane_power.down',
            condition_converted = '(arcane_power.spell_remains == 0)',
            condition_keywords = {
                'arcane_power.spell_remains',
            },
            simc_line = 'actions+=/mirror_image,if=buff.arcane_power.down',
        },
        {
            action = 'stop_burn_phase',
            condition = 'prev_gcd.evocation&burn_phase_duration>gcd.max',
            condition_converted = '((prev_gcd.evocation) and (((burn_phase_duration_as_number) > (gcd.max_as_number))))',
            condition_keywords = {
                'burn_phase_duration',
                'gcd.max',
                'prev_gcd.evocation',
            },
            simc_line = 'actions+=/stop_burn_phase,if=prev_gcd.evocation&burn_phase_duration>gcd.max',
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
            condition_converted = '((arcane_charge.spell_stack_as_number) < (4))',
            condition_keywords = {
                'arcane_charge.spell_stack',
            },
            name = 'build',
            simc_line = 'actions+=/call_action_list,name=build,if=buff.arcane_charge.stack<4',
        },
        {
            action = 'call_action_list',
            condition = 'buff.arcane_power.down&buff.arcane_charge.stack=4&(cooldown.mark_of_aluneth.remains=0|cooldown.mark_of_aluneth.remains>20)&(!talent.rune_of_power.enabled|(cooldown.arcane_power.remains<=action.rune_of_power.cast_time|action.rune_of_power.recharge_time<cooldown.arcane_power.remains))|target.time_to_die<45',
            condition_converted = '(((((arcane_power.spell_remains == 0)) and (((((arcane_charge.spell_stack) == (4))) and ((((((((mark_of_aluneth.cooldown_remains) == (0))) or (((mark_of_aluneth.cooldown_remains_as_number) > (20)))))) and (((((not rune_of_power.talent_enabled)) or ((((((arcane_power.cooldown_remains_as_number) <= (rune_of_power.spell_cast_time_as_number))) or (((rune_of_power.spell_recharge_time_as_number) < (arcane_power.cooldown_remains_as_number))))))))))))))) or (((target.time_to_die_as_number) < (45))))',
            condition_keywords = {
                'arcane_charge.spell_stack',
                'arcane_power.cooldown_remains',
                'arcane_power.spell_remains',
                'mark_of_aluneth.cooldown_remains',
                'rune_of_power.spell_cast_time',
                'rune_of_power.spell_recharge_time',
                'rune_of_power.talent_enabled',
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
            condition_converted = '(((rune_of_power.spell_remains_as_number > 0)) and ((not (burn_phase))))',
            condition_keywords = {
                'burn_phase',
                'rune_of_power.spell_remains',
            },
            name = 'rop_phase',
            simc_line = 'actions+=/call_action_list,name=rop_phase,if=buff.rune_of_power.up&!burn_phase',
        },
        {
            action = 'call_action_list',
            name = 'conserve',
            simc_line = 'actions+=/call_action_list,name=conserve',
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
            simc_line = 'actions.precombat+=/food,type=the_hungry_magister',
            type = 'the_hungry_magister',
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


internal.apls["legion-dev::mage::fire"] = [[
actions.precombat=flask,type=flask_of_the_whispered_pact
actions.precombat+=/food,type=the_hungry_magister
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/snapshot_stats
actions.precombat+=/mirror_image
actions.precombat+=/potion,name=deadly_grace
actions.precombat+=/pyroblast
actions=counterspell,if=target.debuff.casting.react
actions+=/time_warp,if=(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)
actions+=/mirror_image,if=buff.combustion.down
actions+=/rune_of_power,if=cooldown.combustion.remains>40&buff.combustion.down&(cooldown.flame_on.remains<5|cooldown.flame_on.remains>30)&!talent.kindling.enabled|target.time_to_die.remains<11|talent.kindling.enabled&(charges_fractional>1.8|time<40)&cooldown.combustion.remains>40
actions+=/call_action_list,name=combustion_phase,if=cooldown.combustion.remains<=action.rune_of_power.cast_time+(!talent.kindling.enabled*gcd)|buff.combustion.up
actions+=/call_action_list,name=rop_phase,if=buff.rune_of_power.up&buff.combustion.down
actions+=/call_action_list,name=single_target
actions.active_talents=flame_on,if=action.fire_blast.charges=0&(cooldown.combustion.remains>40+(talent.kindling.enabled*25)|target.time_to_die.remains<cooldown.combustion.remains)
actions.active_talents+=/blast_wave,if=(buff.combustion.down)|(buff.combustion.up&action.fire_blast.charges<1&action.phoenixs_flames.charges<1)
actions.active_talents+=/meteor,if=cooldown.combustion.remains>30|(cooldown.combustion.remains>target.time_to_die)|buff.rune_of_power.up
actions.active_talents+=/cinderstorm,if=cooldown.combustion.remains<cast_time&(buff.rune_of_power.up|!talent.rune_on_power.enabled)|cooldown.combustion.remains>10*spell_haste&!buff.combustion.up
actions.active_talents+=/dragons_breath,if=equipped.132863
actions.active_talents+=/living_bomb,if=active_enemies>1&buff.combustion.down
actions.combustion_phase=rune_of_power,if=buff.combustion.down
actions.combustion_phase+=/call_action_list,name=active_talents
actions.combustion_phase+=/combustion
actions.combustion_phase+=/potion,name=deadly_grace
actions.combustion_phase+=/blood_fury
actions.combustion_phase+=/berserking
actions.combustion_phase+=/arcane_torrent
actions.combustion_phase+=/pyroblast,if=buff.hot_streak.up
actions.combustion_phase+=/fire_blast,if=buff.heating_up.up
actions.combustion_phase+=/phoenixs_flames
actions.combustion_phase+=/scorch,if=buff.combustion.remains>cast_time
actions.combustion_phase+=/scorch,if=target.health.pct<=25&equipped.132454
actions.rop_phase=rune_of_power
actions.rop_phase+=/pyroblast,if=buff.hot_streak.up
actions.rop_phase+=/call_action_list,name=active_talents
actions.rop_phase+=/pyroblast,if=buff.kaelthas_ultimate_ability.react
actions.rop_phase+=/fire_blast,if=!prev_off_gcd.fire_blast
actions.rop_phase+=/phoenixs_flames,if=!prev_gcd.phoenixs_flames
actions.rop_phase+=/scorch,if=target.health.pct<=25&equipped.132454
actions.rop_phase+=/fireball
actions.single_target=pyroblast,if=buff.hot_streak.up&buff.hot_streak.remains<action.fireball.execute_time
actions.single_target+=/phoenixs_flames,if=charges_fractional>2.7&active_enemies>2
actions.single_target+=/flamestrike,if=talent.flame_patch.enabled&active_enemies>2&buff.hot_streak.react
actions.single_target+=/pyroblast,if=buff.hot_streak.up&!prev_gcd.pyroblast
actions.single_target+=/pyroblast,if=buff.hot_streak.react&target.health.pct<=25&equipped.132454
actions.single_target+=/pyroblast,if=buff.kaelthas_ultimate_ability.react
actions.single_target+=/call_action_list,name=active_talents
actions.single_target+=/fire_blast,if=!talent.kindling.enabled&buff.heating_up.up&(!talent.rune_of_power.enabled|charges_fractional>1.4|cooldown.combustion.remains<40)&(3-charges_fractional)*(12*spell_haste)<cooldown.combustion.remains+3|target.time_to_die.remains<4
actions.single_target+=/fire_blast,if=talent.kindling.enabled&buff.heating_up.up&(!talent.rune_of_power.enabled|charges_fractional>1.5|cooldown.combustion.remains<40)&(3-charges_fractional)*(18*spell_haste)<cooldown.combustion.remains+3|target.time_to_die.remains<4
actions.single_target+=/phoenixs_flames,if=(buff.combustion.up|buff.rune_of_power.up|buff.incanters_flow.stack>3|talent.mirror_image.enabled)&artifact.phoenix_reborn.enabled&(4-charges_fractional)*13<cooldown.combustion.remains+5|target.time_to_die.remains<10
actions.single_target+=/phoenixs_flames,if=(buff.combustion.up|buff.rune_of_power.up)&(4-charges_fractional)*30<cooldown.combustion.remains+5
actions.single_target+=/scorch,if=target.health.pct<=25&equipped.132454
actions.single_target+=/fireball
]]

-- keywords: legion-dev::mage::fire
---- bloodlust.spell_remains
---- casting.spell_remains
---- combustion.cooldown_remains
---- combustion.spell_remains
---- equipped
---- flame_on.cooldown_remains
---- gcd
---- kindling.talent_enabled
---- rune_of_power.spell_cast_time
---- rune_of_power.spell_charges_fractional
---- rune_of_power.spell_remains
---- time
---- time_to_die.target_remains

internal.actions['legion-dev::mage::fire'] = {
    default = {
        {
            action = 'counterspell',
            condition = 'target.debuff.casting.react',
            condition_converted = '(casting.spell_remains_as_number > 0)',
            condition_keywords = {
                'casting.spell_remains',
            },
            simc_line = 'actions=counterspell,if=target.debuff.casting.react',
        },
        {
            action = 'time_warp',
            condition = '(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
            condition_converted = '(((((((time) == (0))) and ((bloodlust.spell_remains == 0))))) or (((((bloodlust.spell_remains == 0)) and (equipped[132410])))))',
            condition_keywords = {
                'bloodlust.spell_remains',
                'equipped',
                'time',
            },
            simc_line = 'actions+=/time_warp,if=(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
        },
        {
            action = 'mirror_image',
            condition = 'buff.combustion.down',
            condition_converted = '(combustion.spell_remains == 0)',
            condition_keywords = {
                'combustion.spell_remains',
            },
            simc_line = 'actions+=/mirror_image,if=buff.combustion.down',
        },
        {
            action = 'rune_of_power',
            condition = 'cooldown.combustion.remains>40&buff.combustion.down&(cooldown.flame_on.remains<5|cooldown.flame_on.remains>30)&!talent.kindling.enabled|target.time_to_die.remains<11|talent.kindling.enabled&(charges_fractional>1.8|time<40)&cooldown.combustion.remains>40',
            condition_converted = '((((((combustion.cooldown_remains_as_number) > (40))) and ((((combustion.spell_remains == 0)) and ((((((((flame_on.cooldown_remains_as_number) < (5))) or (((flame_on.cooldown_remains_as_number) > (30)))))) and ((not kindling.talent_enabled)))))))) or (((((time_to_die.target_remains_as_number) < (11))) or (((kindling.talent_enabled) and ((((((((rune_of_power.spell_charges_fractional_as_number) > (1.8))) or (((time_as_number) < (40)))))) and (((combustion.cooldown_remains_as_number) > (40))))))))))',
            condition_keywords = {
                'combustion.cooldown_remains',
                'combustion.spell_remains',
                'flame_on.cooldown_remains',
                'kindling.talent_enabled',
                'rune_of_power.spell_charges_fractional',
                'time',
                'time_to_die.target_remains',
            },
            simc_line = 'actions+=/rune_of_power,if=cooldown.combustion.remains>40&buff.combustion.down&(cooldown.flame_on.remains<5|cooldown.flame_on.remains>30)&!talent.kindling.enabled|target.time_to_die.remains<11|talent.kindling.enabled&(charges_fractional>1.8|time<40)&cooldown.combustion.remains>40',
        },
        {
            action = 'call_action_list',
            condition = 'cooldown.combustion.remains<=action.rune_of_power.cast_time+(!talent.kindling.enabled*gcd)|buff.combustion.up',
            condition_converted = '((((combustion.cooldown_remains_as_number) <= ((rune_of_power.spell_cast_time_as_number + ((not ((kindling.talent_enabled_as_number * gcd_as_number)))))))) or ((combustion.spell_remains_as_number > 0)))',
            condition_keywords = {
                'combustion.cooldown_remains',
                'combustion.spell_remains',
                'gcd',
                'kindling.talent_enabled',
                'rune_of_power.spell_cast_time',
            },
            name = 'combustion_phase',
            simc_line = 'actions+=/call_action_list,name=combustion_phase,if=cooldown.combustion.remains<=action.rune_of_power.cast_time+(!talent.kindling.enabled*gcd)|buff.combustion.up',
        },
        {
            action = 'call_action_list',
            condition = 'buff.rune_of_power.up&buff.combustion.down',
            condition_converted = '(((rune_of_power.spell_remains_as_number > 0)) and ((combustion.spell_remains == 0)))',
            condition_keywords = {
                'combustion.spell_remains',
                'rune_of_power.spell_remains',
            },
            name = 'rop_phase',
            simc_line = 'actions+=/call_action_list,name=rop_phase,if=buff.rune_of_power.up&buff.combustion.down',
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
            simc_line = 'actions.precombat=flask,type=flask_of_the_whispered_pact',
            type = 'flask_of_the_whispered_pact',
        },
        {
            action = 'food',
            simc_line = 'actions.precombat+=/food,type=the_hungry_magister',
            type = 'the_hungry_magister',
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


internal.apls["legion-dev::mage::frost"] = [[
actions.precombat=flask,type=flask_of_the_whispered_pact
actions.precombat+=/food,type=azshari_salad
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/water_elemental
actions.precombat+=/snapshot_stats
actions.precombat+=/mirror_image
actions.precombat+=/potion,name=deadly_grace
actions.precombat+=/frostbolt
actions=counterspell,if=target.debuff.casting.react
actions+=/ice_lance,if=buff.fingers_of_frost.react=0&prev_gcd.flurry
actions+=/time_warp,if=(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)
actions+=/call_action_list,name=cooldowns
actions+=/ice_nova,if=debuff.winters_chill.up
actions+=/frostbolt,if=prev_off_gcd.water_jet
actions+=/water_jet,if=prev_gcd.frostbolt&buff.fingers_of_frost.stack<(2+artifact.icy_hand.enabled)&buff.brain_freeze.react=0
actions+=/ray_of_frost,if=buff.icy_veins.up|(cooldown.icy_veins.remains>action.ray_of_frost.cooldown&buff.rune_of_power.down)
actions+=/flurry,if=buff.brain_freeze.react&buff.fingers_of_frost.react=0&prev_gcd.frostbolt
actions+=/frozen_touch,if=buff.fingers_of_frost.stack<=(0+artifact.icy_hand.enabled)&((cooldown.icy_veins.remains>30&talent.thermal_void.enabled)|!talent.thermal_void.enabled)
actions+=/frost_bomb,if=debuff.frost_bomb.remains<action.ice_lance.travel_time&buff.fingers_of_frost.react>0
actions+=/ice_lance,if=buff.fingers_of_frost.react>0&cooldown.icy_veins.remains>10|buff.fingers_of_frost.react>2
actions+=/frozen_orb
actions+=/ice_nova
actions+=/comet_storm
actions+=/blizzard,if=talent.arctic_gale.enabled|active_enemies>1|((buff.zannesu_journey.stack>4|buff.zannesu_journey.remains<cast_time+1)&equipped.133970)
actions+=/ebonbolt,if=buff.fingers_of_frost.stack<=(0+artifact.icy_hand.enabled)
actions+=/glacial_spike
actions+=/frostbolt
actions.cooldowns=rune_of_power,if=cooldown.icy_veins.remains<cast_time|charges_fractional>1.9&cooldown.icy_veins.remains>10|buff.icy_veins.up|target.time_to_die.remains+5<charges_fractional*10
actions.cooldowns+=/icy_veins,if=buff.icy_veins.down
actions.cooldowns+=/mirror_image
actions.cooldowns+=/blood_fury
actions.cooldowns+=/berserking
actions.cooldowns+=/arcane_torrent
actions.cooldowns+=/potion,name=potion_of_prolonged_power,if=cooldown.icy_veins.remains<1
]]

-- keywords: legion-dev::mage::frost
---- active_enemies
---- arctic_gale.talent_enabled
---- blizzard.spell_cast_time
---- bloodlust.spell_remains
---- brain_freeze.spell_remains
---- casting.spell_remains
---- equipped
---- fingers_of_frost.spell_remains
---- fingers_of_frost.spell_stack
---- frost_bomb.spell_remains
---- ice_lance.spell_travel_time
---- icy_hand.artifact_enabled
---- icy_veins.cooldown_remains
---- icy_veins.spell_remains
---- prev_gcd.flurry
---- prev_gcd.frostbolt
---- prev_off_gcd.water_jet
---- ray_of_frost.spell_cooldown
---- rune_of_power.spell_cast_time
---- rune_of_power.spell_charges_fractional
---- rune_of_power.spell_remains
---- thermal_void.talent_enabled
---- time
---- time_to_die.target_remains
---- winters_chill.spell_remains
---- zannesu_journey.spell_remains
---- zannesu_journey.spell_stack

internal.actions['legion-dev::mage::frost'] = {
    cooldowns = {
        {
            action = 'rune_of_power',
            condition = 'cooldown.icy_veins.remains<cast_time|charges_fractional>1.9&cooldown.icy_veins.remains>10|buff.icy_veins.up|target.time_to_die.remains+5<charges_fractional*10',
            condition_converted = '((((icy_veins.cooldown_remains_as_number) < (rune_of_power.spell_cast_time_as_number))) or (((((((rune_of_power.spell_charges_fractional_as_number) > (1.9))) and (((icy_veins.cooldown_remains_as_number) > (10))))) or ((((icy_veins.spell_remains_as_number > 0)) or ((((time_to_die.target_remains_as_number + 5)) < ((rune_of_power.spell_charges_fractional_as_number * 10)))))))))',
            condition_keywords = {
                'icy_veins.cooldown_remains',
                'icy_veins.spell_remains',
                'rune_of_power.spell_cast_time',
                'rune_of_power.spell_charges_fractional',
                'time_to_die.target_remains',
            },
            simc_line = 'actions.cooldowns=rune_of_power,if=cooldown.icy_veins.remains<cast_time|charges_fractional>1.9&cooldown.icy_veins.remains>10|buff.icy_veins.up|target.time_to_die.remains+5<charges_fractional*10',
        },
        {
            action = 'icy_veins',
            condition = 'buff.icy_veins.down',
            condition_converted = '(icy_veins.spell_remains == 0)',
            condition_keywords = {
                'icy_veins.spell_remains',
            },
            simc_line = 'actions.cooldowns+=/icy_veins,if=buff.icy_veins.down',
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
            condition_converted = '(casting.spell_remains_as_number > 0)',
            condition_keywords = {
                'casting.spell_remains',
            },
            simc_line = 'actions=counterspell,if=target.debuff.casting.react',
        },
        {
            action = 'ice_lance',
            condition = 'buff.fingers_of_frost.react=0&prev_gcd.flurry',
            condition_converted = '(((((fingers_of_frost.spell_remains_as_number > 0)) == (0))) and (prev_gcd.flurry))',
            condition_keywords = {
                'fingers_of_frost.spell_remains',
                'prev_gcd.flurry',
            },
            simc_line = 'actions+=/ice_lance,if=buff.fingers_of_frost.react=0&prev_gcd.flurry',
        },
        {
            action = 'time_warp',
            condition = '(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
            condition_converted = '(((((((time) == (0))) and ((bloodlust.spell_remains == 0))))) or (((((bloodlust.spell_remains == 0)) and (equipped[132410])))))',
            condition_keywords = {
                'bloodlust.spell_remains',
                'equipped',
                'time',
            },
            simc_line = 'actions+=/time_warp,if=(time=0&buff.bloodlust.down)|(buff.bloodlust.down&equipped.132410)',
        },
        {
            action = 'call_action_list',
            name = 'cooldowns',
            simc_line = 'actions+=/call_action_list,name=cooldowns',
        },
        {
            action = 'ice_nova',
            condition = 'debuff.winters_chill.up',
            condition_converted = '(winters_chill.spell_remains_as_number > 0)',
            condition_keywords = {
                'winters_chill.spell_remains',
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
            condition_converted = '((prev_gcd.frostbolt) and (((((fingers_of_frost.spell_stack_as_number) < ((2 + icy_hand.artifact_enabled_as_number)))) and ((((brain_freeze.spell_remains_as_number > 0)) == (0))))))',
            condition_keywords = {
                'brain_freeze.spell_remains',
                'fingers_of_frost.spell_stack',
                'icy_hand.artifact_enabled',
                'prev_gcd.frostbolt',
            },
            simc_line = 'actions+=/water_jet,if=prev_gcd.frostbolt&buff.fingers_of_frost.stack<(2+artifact.icy_hand.enabled)&buff.brain_freeze.react=0',
        },
        {
            action = 'ray_of_frost',
            condition = 'buff.icy_veins.up|(cooldown.icy_veins.remains>action.ray_of_frost.cooldown&buff.rune_of_power.down)',
            condition_converted = '(((icy_veins.spell_remains_as_number > 0)) or ((((((icy_veins.cooldown_remains_as_number) > (ray_of_frost.spell_cooldown_as_number))) and ((rune_of_power.spell_remains == 0))))))',
            condition_keywords = {
                'icy_veins.cooldown_remains',
                'icy_veins.spell_remains',
                'ray_of_frost.spell_cooldown',
                'rune_of_power.spell_remains',
            },
            simc_line = 'actions+=/ray_of_frost,if=buff.icy_veins.up|(cooldown.icy_veins.remains>action.ray_of_frost.cooldown&buff.rune_of_power.down)',
        },
        {
            action = 'flurry',
            condition = 'buff.brain_freeze.react&buff.fingers_of_frost.react=0&prev_gcd.frostbolt',
            condition_converted = '(((brain_freeze.spell_remains_as_number > 0)) and ((((((fingers_of_frost.spell_remains_as_number > 0)) == (0))) and (prev_gcd.frostbolt))))',
            condition_keywords = {
                'brain_freeze.spell_remains',
                'fingers_of_frost.spell_remains',
                'prev_gcd.frostbolt',
            },
            simc_line = 'actions+=/flurry,if=buff.brain_freeze.react&buff.fingers_of_frost.react=0&prev_gcd.frostbolt',
        },
        {
            action = 'frozen_touch',
            condition = 'buff.fingers_of_frost.stack<=(0+artifact.icy_hand.enabled)&((cooldown.icy_veins.remains>30&talent.thermal_void.enabled)|!talent.thermal_void.enabled)',
            condition_converted = '((((fingers_of_frost.spell_stack_as_number) <= ((0 + icy_hand.artifact_enabled_as_number)))) and (((((((((icy_veins.cooldown_remains_as_number) > (30))) and (thermal_void.talent_enabled)))) or ((not thermal_void.talent_enabled))))))',
            condition_keywords = {
                'fingers_of_frost.spell_stack',
                'icy_hand.artifact_enabled',
                'icy_veins.cooldown_remains',
                'thermal_void.talent_enabled',
            },
            simc_line = 'actions+=/frozen_touch,if=buff.fingers_of_frost.stack<=(0+artifact.icy_hand.enabled)&((cooldown.icy_veins.remains>30&talent.thermal_void.enabled)|!talent.thermal_void.enabled)',
        },
        {
            action = 'frost_bomb',
            condition = 'debuff.frost_bomb.remains<action.ice_lance.travel_time&buff.fingers_of_frost.react>0',
            condition_converted = '((((frost_bomb.spell_remains_as_number) < (ice_lance.spell_travel_time_as_number))) and ((((fingers_of_frost.spell_remains_as_number > 0)) > (0))))',
            condition_keywords = {
                'fingers_of_frost.spell_remains',
                'frost_bomb.spell_remains',
                'ice_lance.spell_travel_time',
            },
            simc_line = 'actions+=/frost_bomb,if=debuff.frost_bomb.remains<action.ice_lance.travel_time&buff.fingers_of_frost.react>0',
        },
        {
            action = 'ice_lance',
            condition = 'buff.fingers_of_frost.react>0&cooldown.icy_veins.remains>10|buff.fingers_of_frost.react>2',
            condition_converted = '(((((((fingers_of_frost.spell_remains_as_number > 0)) > (0))) and (((icy_veins.cooldown_remains_as_number) > (10))))) or ((((fingers_of_frost.spell_remains_as_number > 0)) > (2))))',
            condition_keywords = {
                'fingers_of_frost.spell_remains',
                'icy_veins.cooldown_remains',
            },
            simc_line = 'actions+=/ice_lance,if=buff.fingers_of_frost.react>0&cooldown.icy_veins.remains>10|buff.fingers_of_frost.react>2',
        },
        {
            action = 'blizzard',
            condition = 'talent.arctic_gale.enabled|active_enemies>1|((buff.zannesu_journey.stack>4|buff.zannesu_journey.remains<cast_time+1)&equipped.133970)',
            condition_converted = '((arctic_gale.talent_enabled) or (((((active_enemies_as_number) > (1))) or (((((((((zannesu_journey.spell_stack_as_number) > (4))) or (((zannesu_journey.spell_remains_as_number) < ((blizzard.spell_cast_time_as_number + 1))))))) and (equipped[133970])))))))',
            condition_keywords = {
                'active_enemies',
                'arctic_gale.talent_enabled',
                'blizzard.spell_cast_time',
                'equipped',
                'zannesu_journey.spell_remains',
                'zannesu_journey.spell_stack',
            },
            simc_line = 'actions+=/blizzard,if=talent.arctic_gale.enabled|active_enemies>1|((buff.zannesu_journey.stack>4|buff.zannesu_journey.remains<cast_time+1)&equipped.133970)',
        },
        {
            action = 'ebonbolt',
            condition = 'buff.fingers_of_frost.stack<=(0+artifact.icy_hand.enabled)',
            condition_converted = '((fingers_of_frost.spell_stack_as_number) <= ((0 + icy_hand.artifact_enabled_as_number)))',
            condition_keywords = {
                'fingers_of_frost.spell_stack',
                'icy_hand.artifact_enabled',
            },
            simc_line = 'actions+=/ebonbolt,if=buff.fingers_of_frost.stack<=(0+artifact.icy_hand.enabled)',
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


