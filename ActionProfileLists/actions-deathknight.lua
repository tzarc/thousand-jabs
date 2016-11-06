local _, internal = ...
internal.actions = internal.actions or {}

-- keywords: legion-dev::deathknight::blood
---- breath_of_sindragosa.aura_up
---- breath_of_sindragosa.cooldown_remains
---- breath_of_sindragosa.talent_selected
---- pillar_of_frost.aura_up
---- runic_power.curr
---- runic_power.deficit
---- shattering_strikes.talent_selected

internal.actions['legion-dev::deathknight::blood'] = {
    bos = {
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'core',
            simc_line = 'actions.bos=call_action_list,name=core',
        },
        {
            action = 'empower_rune_weapon',
            condition = 'runic_power<=70',
            condition_converted = '((runic_power.curr_as_number) <= (70))',
            condition_keywords = {
                'runic_power.curr',
            },
            simc_line = 'actions.bos+=/empower_rune_weapon,if=runic_power<=70',
        },
    },
    default = {
        {
            action = 'auto_attack',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions=auto_attack',
        },
        {
            action = 'mind_freeze',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/mind_freeze',
        },
        {
            action = 'arcane_torrent',
            condition = 'runic_power.deficit>20',
            condition_converted = '((runic_power.deficit_as_number) > (20))',
            condition_keywords = {
                'runic_power.deficit',
            },
            simc_line = 'actions+=/arcane_torrent,if=runic_power.deficit>20',
        },
        {
            action = 'blood_fury',
            condition = '!talent.breath_of_sindragosa.enabled|dot.breath_of_sindragosa.ticking',
            condition_converted = '(((not (breath_of_sindragosa.talent_selected))) or (breath_of_sindragosa.aura_up))',
            condition_keywords = {
                'breath_of_sindragosa.aura_up',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions+=/blood_fury,if=!talent.breath_of_sindragosa.enabled|dot.breath_of_sindragosa.ticking',
        },
        {
            action = 'berserking',
            condition = 'buff.pillar_of_frost.up',
            condition_converted = 'pillar_of_frost.aura_up',
            condition_keywords = {
                'pillar_of_frost.aura_up',
            },
            simc_line = 'actions+=/berserking,if=buff.pillar_of_frost.up',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'old_war',
            simc_line = 'actions+=/potion,name=old_war',
        },
        {
            action = 'sindragosas_fury',
            condition = 'buff.pillar_of_frost.up',
            condition_converted = 'pillar_of_frost.aura_up',
            condition_keywords = {
                'pillar_of_frost.aura_up',
            },
            simc_line = 'actions+=/sindragosas_fury,if=buff.pillar_of_frost.up',
        },
        {
            action = 'run_action_list',
            condition = 'dot.breath_of_sindragosa.ticking',
            condition_converted = 'breath_of_sindragosa.aura_up',
            condition_keywords = {
                'breath_of_sindragosa.aura_up',
            },
            name = 'bos',
            simc_line = 'actions+=/run_action_list,name=bos,if=dot.breath_of_sindragosa.ticking',
        },
        {
            action = 'call_action_list',
            condition = 'talent.shattering_strikes.enabled',
            condition_converted = 'shattering_strikes.talent_selected',
            condition_keywords = {
                'shattering_strikes.talent_selected',
            },
            name = 'shatter',
            simc_line = 'actions+=/call_action_list,name=shatter,if=talent.shattering_strikes.enabled',
        },
        {
            action = 'call_action_list',
            condition = '!talent.shattering_strikes.enabled',
            condition_converted = '(not (shattering_strikes.talent_selected))',
            condition_keywords = {
                'shattering_strikes.talent_selected',
            },
            name = 'generic',
            simc_line = 'actions+=/call_action_list,name=generic,if=!talent.shattering_strikes.enabled',
        },
    },
    generic = {
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'core',
            simc_line = 'actions.generic=call_action_list,name=core',
        },
        {
            action = 'empower_rune_weapon',
            condition = 'talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
            condition_converted = '((breath_of_sindragosa.talent_selected) and (((breath_of_sindragosa.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'breath_of_sindragosa.cooldown_remains',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.generic+=/empower_rune_weapon,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
        },
        {
            action = 'empower_rune_weapon',
            condition = '!talent.breath_of_sindragosa.enabled',
            condition_converted = '(not (breath_of_sindragosa.talent_selected))',
            condition_keywords = {
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.generic+=/empower_rune_weapon,if=!talent.breath_of_sindragosa.enabled',
        },
    },
    precombat = {
        {
            action = 'flask',
            condition = 'true',
            condition_converted = 'true',
            name = 'countless_armies',
            simc_line = 'actions.precombat=flask,name=countless_armies',
        },
        {
            action = 'food',
            condition = 'true',
            condition_converted = 'true',
            name = 'fishbrul_special',
            simc_line = 'actions.precombat+=/food,name=fishbrul_special',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            name = 'defiled',
            simc_line = 'actions.precombat+=/augmentation,name=defiled',
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
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
    },
    shatter = {
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'core',
            simc_line = 'actions.shatter=call_action_list,name=core',
        },
        {
            action = 'empower_rune_weapon',
            condition = 'talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
            condition_converted = '((breath_of_sindragosa.talent_selected) and (((breath_of_sindragosa.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'breath_of_sindragosa.cooldown_remains',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.shatter+=/empower_rune_weapon,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
        },
        {
            action = 'empower_rune_weapon',
            condition = '!talent.breath_of_sindragosa.enabled',
            condition_converted = '(not (breath_of_sindragosa.talent_selected))',
            condition_keywords = {
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.shatter+=/empower_rune_weapon,if=!talent.breath_of_sindragosa.enabled',
        },
    },
}


-- keywords: legion-dev::deathknight::frost
---- breath_of_sindragosa.aura_up
---- breath_of_sindragosa.cooldown_remains
---- breath_of_sindragosa.talent_selected
---- frost_fever.aura_up
---- frostscythe.talent_selected
---- frozen_pulse.talent_selected
---- gathering_storm.talent_selected
---- killing_machine.aura_up
---- obliteration.aura_up
---- pillar_of_frost.aura_up
---- razorice.aura_stack
---- rime.aura_up
---- runic_power.curr
---- runic_power.deficit
---- shattering_strikes.talent_selected
---- spell_targets

internal.actions['legion-dev::deathknight::frost'] = {
    bos = {
        {
            action = 'howling_blast',
            condition = '!! target_if !!',
            condition_converted = '(not (frost_fever.aura_up))',
            condition_keywords = {
                'frost_fever.aura_up',
            },
            simc_line = 'actions.bos=howling_blast,target_if=!dot.frost_fever.ticking',
            target_if = '!dot.frost_fever.ticking',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'core',
            simc_line = 'actions.bos+=/call_action_list,name=core',
        },
        {
            action = 'horn_of_winter',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.bos+=/horn_of_winter',
        },
        {
            action = 'empower_rune_weapon',
            condition = 'runic_power<=70',
            condition_converted = '((runic_power.curr_as_number) <= (70))',
            condition_keywords = {
                'runic_power.curr',
            },
            simc_line = 'actions.bos+=/empower_rune_weapon,if=runic_power<=70',
        },
        {
            action = 'hungering_rune_weapon',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.bos+=/hungering_rune_weapon',
        },
        {
            action = 'howling_blast',
            condition = 'buff.rime.react',
            condition_converted = 'rime.aura_up',
            condition_keywords = {
                'rime.aura_up',
            },
            simc_line = 'actions.bos+=/howling_blast,if=buff.rime.react',
        },
    },
    core = {
        {
            action = 'frost_strike',
            condition = 'buff.obliteration.up&!buff.killing_machine.react',
            condition_converted = '((obliteration.aura_up) and ((not (killing_machine.aura_up))))',
            condition_keywords = {
                'killing_machine.aura_up',
                'obliteration.aura_up',
            },
            simc_line = 'actions.core=frost_strike,if=buff.obliteration.up&!buff.killing_machine.react',
        },
        {
            action = 'remorseless_winter',
            condition = '(spell_targets.remorseless_winter>=2|talent.gathering_storm.enabled)&!(talent.frostscythe.enabled&buff.killing_machine.react&spell_targets.frostscythe>=2)',
            condition_converted = '(((((((spell_targets_as_number) >= (2))) or (gathering_storm.talent_selected)))) and ((not ((((frostscythe.talent_selected) and (((killing_machine.aura_up) and (((spell_targets_as_number) >= (2)))))))))))',
            condition_keywords = {
                'frostscythe.talent_selected',
                'gathering_storm.talent_selected',
                'killing_machine.aura_up',
                'spell_targets',
            },
            simc_line = 'actions.core+=/remorseless_winter,if=(spell_targets.remorseless_winter>=2|talent.gathering_storm.enabled)&!(talent.frostscythe.enabled&buff.killing_machine.react&spell_targets.frostscythe>=2)',
        },
        {
            action = 'frostscythe',
            condition = '(buff.killing_machine.react&spell_targets.frostscythe>=2)',
            condition_converted = '(((killing_machine.aura_up) and (((spell_targets_as_number) >= (2)))))',
            condition_keywords = {
                'killing_machine.aura_up',
                'spell_targets',
            },
            simc_line = 'actions.core+=/frostscythe,if=(buff.killing_machine.react&spell_targets.frostscythe>=2)',
        },
        {
            action = 'glacial_advance',
            condition = 'spell_targets.glacial_advance>=2',
            condition_converted = '((spell_targets_as_number) >= (2))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.core+=/glacial_advance,if=spell_targets.glacial_advance>=2',
        },
        {
            action = 'frostscythe',
            condition = 'spell_targets.frostscythe>=3',
            condition_converted = '((spell_targets_as_number) >= (3))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.core+=/frostscythe,if=spell_targets.frostscythe>=3',
        },
        {
            action = 'obliterate',
            condition = 'buff.killing_machine.react',
            condition_converted = 'killing_machine.aura_up',
            condition_keywords = {
                'killing_machine.aura_up',
            },
            simc_line = 'actions.core+=/obliterate,if=buff.killing_machine.react',
        },
        {
            action = 'obliterate',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.core+=/obliterate',
        },
        {
            action = 'glacial_advance',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.core+=/glacial_advance',
        },
        {
            action = 'remorseless_winter',
            condition = 'talent.frozen_pulse.enabled',
            condition_converted = 'frozen_pulse.talent_selected',
            condition_keywords = {
                'frozen_pulse.talent_selected',
            },
            simc_line = 'actions.core+=/remorseless_winter,if=talent.frozen_pulse.enabled',
        },
    },
    default = {
        {
            action = 'auto_attack',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions=auto_attack',
        },
        {
            action = 'pillar_of_frost',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/pillar_of_frost',
        },
        {
            action = 'mind_freeze',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/mind_freeze',
        },
        {
            action = 'arcane_torrent',
            condition = 'runic_power.deficit>20',
            condition_converted = '((runic_power.deficit_as_number) > (20))',
            condition_keywords = {
                'runic_power.deficit',
            },
            simc_line = 'actions+=/arcane_torrent,if=runic_power.deficit>20',
        },
        {
            action = 'blood_fury',
            condition = '!talent.breath_of_sindragosa.enabled|dot.breath_of_sindragosa.ticking',
            condition_converted = '(((not (breath_of_sindragosa.talent_selected))) or (breath_of_sindragosa.aura_up))',
            condition_keywords = {
                'breath_of_sindragosa.aura_up',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions+=/blood_fury,if=!talent.breath_of_sindragosa.enabled|dot.breath_of_sindragosa.ticking',
        },
        {
            action = 'berserking',
            condition = 'buff.pillar_of_frost.up',
            condition_converted = 'pillar_of_frost.aura_up',
            condition_keywords = {
                'pillar_of_frost.aura_up',
            },
            simc_line = 'actions+=/berserking,if=buff.pillar_of_frost.up',
        },
        {
            action = 'potion',
            condition = 'true',
            condition_converted = 'true',
            name = 'old_war',
            simc_line = 'actions+=/potion,name=old_war',
        },
        {
            action = 'sindragosas_fury',
            condition = 'buff.pillar_of_frost.up',
            condition_converted = 'pillar_of_frost.aura_up',
            condition_keywords = {
                'pillar_of_frost.aura_up',
            },
            simc_line = 'actions+=/sindragosas_fury,if=buff.pillar_of_frost.up',
        },
        {
            action = 'obliteration',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions+=/obliteration',
        },
        {
            action = 'breath_of_sindragosa',
            condition = 'runic_power>=50',
            condition_converted = '((runic_power.curr_as_number) >= (50))',
            condition_keywords = {
                'runic_power.curr',
            },
            simc_line = 'actions+=/breath_of_sindragosa,if=runic_power>=50',
        },
        {
            action = 'run_action_list',
            condition = 'dot.breath_of_sindragosa.ticking',
            condition_converted = 'breath_of_sindragosa.aura_up',
            condition_keywords = {
                'breath_of_sindragosa.aura_up',
            },
            name = 'bos',
            simc_line = 'actions+=/run_action_list,name=bos,if=dot.breath_of_sindragosa.ticking',
        },
        {
            action = 'call_action_list',
            condition = 'talent.shattering_strikes.enabled',
            condition_converted = 'shattering_strikes.talent_selected',
            condition_keywords = {
                'shattering_strikes.talent_selected',
            },
            name = 'shatter',
            simc_line = 'actions+=/call_action_list,name=shatter,if=talent.shattering_strikes.enabled',
        },
        {
            action = 'call_action_list',
            condition = '!talent.shattering_strikes.enabled',
            condition_converted = '(not (shattering_strikes.talent_selected))',
            condition_keywords = {
                'shattering_strikes.talent_selected',
            },
            name = 'generic',
            simc_line = 'actions+=/call_action_list,name=generic,if=!talent.shattering_strikes.enabled',
        },
    },
    generic = {
        {
            action = 'howling_blast',
            condition = '!! target_if !!',
            condition_converted = '(not (frost_fever.aura_up))',
            condition_keywords = {
                'frost_fever.aura_up',
            },
            simc_line = 'actions.generic=howling_blast,target_if=!dot.frost_fever.ticking',
            target_if = '!dot.frost_fever.ticking',
        },
        {
            action = 'howling_blast',
            condition = 'buff.rime.react',
            condition_converted = 'rime.aura_up',
            condition_keywords = {
                'rime.aura_up',
            },
            simc_line = 'actions.generic+=/howling_blast,if=buff.rime.react',
        },
        {
            action = 'frost_strike',
            condition = 'runic_power>=80',
            condition_converted = '((runic_power.curr_as_number) >= (80))',
            condition_keywords = {
                'runic_power.curr',
            },
            simc_line = 'actions.generic+=/frost_strike,if=runic_power>=80',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'core',
            simc_line = 'actions.generic+=/call_action_list,name=core',
        },
        {
            action = 'horn_of_winter',
            condition = 'talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
            condition_converted = '((breath_of_sindragosa.talent_selected) and (((breath_of_sindragosa.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'breath_of_sindragosa.cooldown_remains',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.generic+=/horn_of_winter,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
        },
        {
            action = 'horn_of_winter',
            condition = '!talent.breath_of_sindragosa.enabled',
            condition_converted = '(not (breath_of_sindragosa.talent_selected))',
            condition_keywords = {
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.generic+=/horn_of_winter,if=!talent.breath_of_sindragosa.enabled',
        },
        {
            action = 'frost_strike',
            condition = 'talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
            condition_converted = '((breath_of_sindragosa.talent_selected) and (((breath_of_sindragosa.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'breath_of_sindragosa.cooldown_remains',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.generic+=/frost_strike,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
        },
        {
            action = 'frost_strike',
            condition = '!talent.breath_of_sindragosa.enabled',
            condition_converted = '(not (breath_of_sindragosa.talent_selected))',
            condition_keywords = {
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.generic+=/frost_strike,if=!talent.breath_of_sindragosa.enabled',
        },
        {
            action = 'empower_rune_weapon',
            condition = 'talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
            condition_converted = '((breath_of_sindragosa.talent_selected) and (((breath_of_sindragosa.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'breath_of_sindragosa.cooldown_remains',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.generic+=/empower_rune_weapon,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
        },
        {
            action = 'hungering_rune_weapon',
            condition = 'talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
            condition_converted = '((breath_of_sindragosa.talent_selected) and (((breath_of_sindragosa.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'breath_of_sindragosa.cooldown_remains',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.generic+=/hungering_rune_weapon,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
        },
        {
            action = 'empower_rune_weapon',
            condition = '!talent.breath_of_sindragosa.enabled',
            condition_converted = '(not (breath_of_sindragosa.talent_selected))',
            condition_keywords = {
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.generic+=/empower_rune_weapon,if=!talent.breath_of_sindragosa.enabled',
        },
        {
            action = 'hungering_rune_weapon',
            condition = '!talent.breath_of_sindragosa.enabled',
            condition_converted = '(not (breath_of_sindragosa.talent_selected))',
            condition_keywords = {
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.generic+=/hungering_rune_weapon,if=!talent.breath_of_sindragosa.enabled',
        },
    },
    precombat = {
        {
            action = 'flask',
            condition = 'true',
            condition_converted = 'true',
            name = 'countless_armies',
            simc_line = 'actions.precombat=flask,name=countless_armies',
        },
        {
            action = 'food',
            condition = 'true',
            condition_converted = 'true',
            name = 'fishbrul_special',
            simc_line = 'actions.precombat+=/food,name=fishbrul_special',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            name = 'defiled',
            simc_line = 'actions.precombat+=/augmentation,name=defiled',
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
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
    },
    shatter = {
        {
            action = 'frost_strike',
            condition = 'debuff.razorice.stack=5',
            condition_converted = '((razorice.aura_stack) == (5))',
            condition_keywords = {
                'razorice.aura_stack',
            },
            simc_line = 'actions.shatter=frost_strike,if=debuff.razorice.stack=5',
        },
        {
            action = 'howling_blast',
            condition = '!! target_if !!',
            condition_converted = '(not (frost_fever.aura_up))',
            condition_keywords = {
                'frost_fever.aura_up',
            },
            simc_line = 'actions.shatter+=/howling_blast,target_if=!dot.frost_fever.ticking',
            target_if = '!dot.frost_fever.ticking',
        },
        {
            action = 'howling_blast',
            condition = 'buff.rime.react',
            condition_converted = 'rime.aura_up',
            condition_keywords = {
                'rime.aura_up',
            },
            simc_line = 'actions.shatter+=/howling_blast,if=buff.rime.react',
        },
        {
            action = 'frost_strike',
            condition = 'runic_power>=80',
            condition_converted = '((runic_power.curr_as_number) >= (80))',
            condition_keywords = {
                'runic_power.curr',
            },
            simc_line = 'actions.shatter+=/frost_strike,if=runic_power>=80',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'core',
            simc_line = 'actions.shatter+=/call_action_list,name=core',
        },
        {
            action = 'horn_of_winter',
            condition = 'talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
            condition_converted = '((breath_of_sindragosa.talent_selected) and (((breath_of_sindragosa.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'breath_of_sindragosa.cooldown_remains',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.shatter+=/horn_of_winter,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
        },
        {
            action = 'horn_of_winter',
            condition = '!talent.breath_of_sindragosa.enabled',
            condition_converted = '(not (breath_of_sindragosa.talent_selected))',
            condition_keywords = {
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.shatter+=/horn_of_winter,if=!talent.breath_of_sindragosa.enabled',
        },
        {
            action = 'frost_strike',
            condition = 'talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
            condition_converted = '((breath_of_sindragosa.talent_selected) and (((breath_of_sindragosa.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'breath_of_sindragosa.cooldown_remains',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.shatter+=/frost_strike,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
        },
        {
            action = 'frost_strike',
            condition = '!talent.breath_of_sindragosa.enabled',
            condition_converted = '(not (breath_of_sindragosa.talent_selected))',
            condition_keywords = {
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.shatter+=/frost_strike,if=!talent.breath_of_sindragosa.enabled',
        },
        {
            action = 'empower_rune_weapon',
            condition = 'talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
            condition_converted = '((breath_of_sindragosa.talent_selected) and (((breath_of_sindragosa.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'breath_of_sindragosa.cooldown_remains',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.shatter+=/empower_rune_weapon,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
        },
        {
            action = 'hungering_rune_weapon',
            condition = 'talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
            condition_converted = '((breath_of_sindragosa.talent_selected) and (((breath_of_sindragosa.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'breath_of_sindragosa.cooldown_remains',
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.shatter+=/hungering_rune_weapon,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>15',
        },
        {
            action = 'empower_rune_weapon',
            condition = '!talent.breath_of_sindragosa.enabled',
            condition_converted = '(not (breath_of_sindragosa.talent_selected))',
            condition_keywords = {
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.shatter+=/empower_rune_weapon,if=!talent.breath_of_sindragosa.enabled',
        },
        {
            action = 'hungering_rune_weapon',
            condition = '!talent.breath_of_sindragosa.enabled',
            condition_converted = '(not (breath_of_sindragosa.talent_selected))',
            condition_keywords = {
                'breath_of_sindragosa.talent_selected',
            },
            simc_line = 'actions.shatter+=/hungering_rune_weapon,if=!talent.breath_of_sindragosa.enabled',
        },
    },
}


-- keywords: legion-dev::deathknight::unholy
---- active_enemies
---- apocalypse.cooldown_remains
---- castigator.talent_selected
---- dark_arbiter.cooldown_remains
---- dark_arbiter.talent_selected
---- dark_transformation.aura_up
---- dark_transformation.cooldown_remains
---- death_and_decay.aura_up
---- defile.aura_up
---- equipped
---- festering_wound.aura_stack
---- festering_wound.aura_up
---- necrosis.aura_up
---- necrosis.talent_selected
---- rune.curr
---- runic_power.deficit
---- shadow_infusion.talent_selected
---- soul_reaper.aura_up
---- spell_targets
---- sudden_doom.aura_up
---- summon_gargoyle.cooldown_remains
---- target.time_to_die
---- unholy_strength.aura_up
---- valkyr_battlemaiden.pet_active
---- virulent_plague.aura_up

internal.actions['legion-dev::deathknight::unholy'] = {
    aoe = {
        {
            action = 'death_and_decay',
            condition = 'spell_targets.death_and_decay>=2',
            condition_converted = '((spell_targets_as_number) >= (2))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.aoe=death_and_decay,if=spell_targets.death_and_decay>=2',
        },
        {
            action = 'epidemic',
            condition = 'spell_targets.epidemic>4',
            condition_converted = '((spell_targets_as_number) > (4))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.aoe+=/epidemic,if=spell_targets.epidemic>4',
        },
        {
            action = 'scourge_strike',
            condition = 'spell_targets.scourge_strike>=2&(dot.death_and_decay.ticking|dot.defile.ticking)',
            condition_converted = '((((spell_targets_as_number) >= (2))) and ((((death_and_decay.aura_up) or (defile.aura_up)))))',
            condition_keywords = {
                'death_and_decay.aura_up',
                'defile.aura_up',
                'spell_targets',
            },
            simc_line = 'actions.aoe+=/scourge_strike,if=spell_targets.scourge_strike>=2&(dot.death_and_decay.ticking|dot.defile.ticking)',
        },
        {
            action = 'clawing_shadows',
            condition = 'spell_targets.clawing_shadows>=2&(dot.death_and_decay.ticking|dot.defile.ticking)',
            condition_converted = '((((spell_targets_as_number) >= (2))) and ((((death_and_decay.aura_up) or (defile.aura_up)))))',
            condition_keywords = {
                'death_and_decay.aura_up',
                'defile.aura_up',
                'spell_targets',
            },
            simc_line = 'actions.aoe+=/clawing_shadows,if=spell_targets.clawing_shadows>=2&(dot.death_and_decay.ticking|dot.defile.ticking)',
        },
        {
            action = 'epidemic',
            condition = 'spell_targets.epidemic>2',
            condition_converted = '((spell_targets_as_number) > (2))',
            condition_keywords = {
                'spell_targets',
            },
            simc_line = 'actions.aoe+=/epidemic,if=spell_targets.epidemic>2',
        },
    },
    castigator = {
        {
            action = 'festering_strike',
            condition = 'debuff.festering_wound.stack<=4&runic_power.deficit>23',
            condition_converted = '((((festering_wound.aura_stack_as_number) <= (4))) and (((runic_power.deficit_as_number) > (23))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'runic_power.deficit',
            },
            simc_line = 'actions.castigator=festering_strike,if=debuff.festering_wound.stack<=4&runic_power.deficit>23',
        },
        {
            action = 'death_coil',
            condition = '!buff.necrosis.up&talent.necrosis.enabled&rune<=3',
            condition_converted = '(((not (necrosis.aura_up))) and (((necrosis.talent_selected) and (((rune.curr_as_number) <= (3))))))',
            condition_keywords = {
                'necrosis.aura_up',
                'necrosis.talent_selected',
                'rune.curr',
            },
            simc_line = 'actions.castigator+=/death_coil,if=!buff.necrosis.up&talent.necrosis.enabled&rune<=3',
        },
        {
            action = 'scourge_strike',
            condition = 'buff.necrosis.react&debuff.festering_wound.stack>=3&runic_power.deficit>23',
            condition_converted = '((necrosis.aura_up) and (((((festering_wound.aura_stack_as_number) >= (3))) and (((runic_power.deficit_as_number) > (23))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'necrosis.aura_up',
                'runic_power.deficit',
            },
            simc_line = 'actions.castigator+=/scourge_strike,if=buff.necrosis.react&debuff.festering_wound.stack>=3&runic_power.deficit>23',
        },
        {
            action = 'scourge_strike',
            condition = 'buff.unholy_strength.react&debuff.festering_wound.stack>=3&runic_power.deficit>23',
            condition_converted = '((unholy_strength.aura_up) and (((((festering_wound.aura_stack_as_number) >= (3))) and (((runic_power.deficit_as_number) > (23))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'runic_power.deficit',
                'unholy_strength.aura_up',
            },
            simc_line = 'actions.castigator+=/scourge_strike,if=buff.unholy_strength.react&debuff.festering_wound.stack>=3&runic_power.deficit>23',
        },
        {
            action = 'scourge_strike',
            condition = 'rune>=2&debuff.festering_wound.stack>=3&runic_power.deficit>23',
            condition_converted = '((((rune.curr_as_number) >= (2))) and (((((festering_wound.aura_stack_as_number) >= (3))) and (((runic_power.deficit_as_number) > (23))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'rune.curr',
                'runic_power.deficit',
            },
            simc_line = 'actions.castigator+=/scourge_strike,if=rune>=2&debuff.festering_wound.stack>=3&runic_power.deficit>23',
        },
        {
            action = 'death_coil',
            condition = 'talent.shadow_infusion.enabled&talent.dark_arbiter.enabled&!buff.dark_transformation.up&cooldown.dark_arbiter.remains>15',
            condition_converted = '((shadow_infusion.talent_selected) and (((dark_arbiter.talent_selected) and ((((not (dark_transformation.aura_up))) and (((dark_arbiter.cooldown_remains_as_number) > (15))))))))',
            condition_keywords = {
                'dark_arbiter.cooldown_remains',
                'dark_arbiter.talent_selected',
                'dark_transformation.aura_up',
                'shadow_infusion.talent_selected',
            },
            simc_line = 'actions.castigator+=/death_coil,if=talent.shadow_infusion.enabled&talent.dark_arbiter.enabled&!buff.dark_transformation.up&cooldown.dark_arbiter.remains>15',
        },
        {
            action = 'death_coil',
            condition = 'talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled&!buff.dark_transformation.up',
            condition_converted = '((shadow_infusion.talent_selected) and ((((not (dark_arbiter.talent_selected))) and ((not (dark_transformation.aura_up))))))',
            condition_keywords = {
                'dark_arbiter.talent_selected',
                'dark_transformation.aura_up',
                'shadow_infusion.talent_selected',
            },
            simc_line = 'actions.castigator+=/death_coil,if=talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled&!buff.dark_transformation.up',
        },
        {
            action = 'death_coil',
            condition = 'talent.dark_arbiter.enabled&cooldown.dark_arbiter.remains>15',
            condition_converted = '((dark_arbiter.talent_selected) and (((dark_arbiter.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'dark_arbiter.cooldown_remains',
                'dark_arbiter.talent_selected',
            },
            simc_line = 'actions.castigator+=/death_coil,if=talent.dark_arbiter.enabled&cooldown.dark_arbiter.remains>15',
        },
        {
            action = 'death_coil',
            condition = '!talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled',
            condition_converted = '(((not (shadow_infusion.talent_selected))) and ((not (dark_arbiter.talent_selected))))',
            condition_keywords = {
                'dark_arbiter.talent_selected',
                'shadow_infusion.talent_selected',
            },
            simc_line = 'actions.castigator+=/death_coil,if=!talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled',
        },
    },
    default = {
        {
            action = 'auto_attack',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions=auto_attack',
        },
        {
            action = 'arcane_torrent',
            condition = 'runic_power.deficit>20',
            condition_converted = '((runic_power.deficit_as_number) > (20))',
            condition_keywords = {
                'runic_power.deficit',
            },
            simc_line = 'actions+=/arcane_torrent,if=runic_power.deficit>20',
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
            condition = 'buff.unholy_strength.react',
            condition_converted = 'unholy_strength.aura_up',
            condition_keywords = {
                'unholy_strength.aura_up',
            },
            name = 'old_war',
            simc_line = 'actions+=/potion,name=old_war,if=buff.unholy_strength.react',
        },
        {
            action = 'outbreak',
            condition = '!! target_if !!',
            condition_converted = '(not (virulent_plague.aura_up))',
            condition_keywords = {
                'virulent_plague.aura_up',
            },
            simc_line = 'actions+=/outbreak,target_if=!dot.virulent_plague.ticking',
            target_if = '!dot.virulent_plague.ticking',
        },
        {
            action = 'dark_transformation',
            condition = 'equipped.137075&cooldown.dark_arbiter.remains>165',
            condition_converted = '((equipped[137075]) and (((dark_arbiter.cooldown_remains_as_number) > (165))))',
            condition_keywords = {
                'dark_arbiter.cooldown_remains',
                'equipped',
            },
            simc_line = 'actions+=/dark_transformation,if=equipped.137075&cooldown.dark_arbiter.remains>165',
        },
        {
            action = 'dark_transformation',
            condition = 'equipped.137075&!talent.shadow_infusion.enabled&cooldown.dark_arbiter.remains>55',
            condition_converted = '((equipped[137075]) and ((((not (shadow_infusion.talent_selected))) and (((dark_arbiter.cooldown_remains_as_number) > (55))))))',
            condition_keywords = {
                'dark_arbiter.cooldown_remains',
                'equipped',
                'shadow_infusion.talent_selected',
            },
            simc_line = 'actions+=/dark_transformation,if=equipped.137075&!talent.shadow_infusion.enabled&cooldown.dark_arbiter.remains>55',
        },
        {
            action = 'dark_transformation',
            condition = 'equipped.137075&talent.shadow_infusion.enabled&cooldown.dark_arbiter.remains>35',
            condition_converted = '((equipped[137075]) and (((shadow_infusion.talent_selected) and (((dark_arbiter.cooldown_remains_as_number) > (35))))))',
            condition_keywords = {
                'dark_arbiter.cooldown_remains',
                'equipped',
                'shadow_infusion.talent_selected',
            },
            simc_line = 'actions+=/dark_transformation,if=equipped.137075&talent.shadow_infusion.enabled&cooldown.dark_arbiter.remains>35',
        },
        {
            action = 'dark_transformation',
            condition = 'equipped.137075&target.time_to_die<cooldown.dark_arbiter.remains-8',
            condition_converted = '((equipped[137075]) and (((target.time_to_die_as_number) < ((dark_arbiter.cooldown_remains_as_number - 8)))))',
            condition_keywords = {
                'dark_arbiter.cooldown_remains',
                'equipped',
                'target.time_to_die',
            },
            simc_line = 'actions+=/dark_transformation,if=equipped.137075&target.time_to_die<cooldown.dark_arbiter.remains-8',
        },
        {
            action = 'dark_transformation',
            condition = 'equipped.137075&cooldown.summon_gargoyle.remains>160',
            condition_converted = '((equipped[137075]) and (((summon_gargoyle.cooldown_remains_as_number) > (160))))',
            condition_keywords = {
                'equipped',
                'summon_gargoyle.cooldown_remains',
            },
            simc_line = 'actions+=/dark_transformation,if=equipped.137075&cooldown.summon_gargoyle.remains>160',
        },
        {
            action = 'dark_transformation',
            condition = 'equipped.137075&!talent.shadow_infusion.enabled&cooldown.summon_gargoyle.remains>55',
            condition_converted = '((equipped[137075]) and ((((not (shadow_infusion.talent_selected))) and (((summon_gargoyle.cooldown_remains_as_number) > (55))))))',
            condition_keywords = {
                'equipped',
                'shadow_infusion.talent_selected',
                'summon_gargoyle.cooldown_remains',
            },
            simc_line = 'actions+=/dark_transformation,if=equipped.137075&!talent.shadow_infusion.enabled&cooldown.summon_gargoyle.remains>55',
        },
        {
            action = 'dark_transformation',
            condition = 'equipped.137075&talent.shadow_infusion.enabled&cooldown.summon_gargoyle.remains>35',
            condition_converted = '((equipped[137075]) and (((shadow_infusion.talent_selected) and (((summon_gargoyle.cooldown_remains_as_number) > (35))))))',
            condition_keywords = {
                'equipped',
                'shadow_infusion.talent_selected',
                'summon_gargoyle.cooldown_remains',
            },
            simc_line = 'actions+=/dark_transformation,if=equipped.137075&talent.shadow_infusion.enabled&cooldown.summon_gargoyle.remains>35',
        },
        {
            action = 'dark_transformation',
            condition = 'equipped.137075&target.time_to_die<cooldown.summon_gargoyle.remains-8',
            condition_converted = '((equipped[137075]) and (((target.time_to_die_as_number) < ((summon_gargoyle.cooldown_remains_as_number - 8)))))',
            condition_keywords = {
                'equipped',
                'summon_gargoyle.cooldown_remains',
                'target.time_to_die',
            },
            simc_line = 'actions+=/dark_transformation,if=equipped.137075&target.time_to_die<cooldown.summon_gargoyle.remains-8',
        },
        {
            action = 'dark_transformation',
            condition = '!equipped.137075&rune<=3',
            condition_converted = '(((not (equipped[137075]))) and (((rune.curr_as_number) <= (3))))',
            condition_keywords = {
                'equipped',
                'rune.curr',
            },
            simc_line = 'actions+=/dark_transformation,if=!equipped.137075&rune<=3',
        },
        {
            action = 'blighted_rune_weapon',
            condition = 'rune<=3',
            condition_converted = '((rune.curr_as_number) <= (3))',
            condition_keywords = {
                'rune.curr',
            },
            simc_line = 'actions+=/blighted_rune_weapon,if=rune<=3',
        },
        {
            action = 'run_action_list',
            condition = 'talent.dark_arbiter.enabled&pet.valkyr_battlemaiden.active',
            condition_converted = '((dark_arbiter.talent_selected) and (valkyr_battlemaiden.pet_active))',
            condition_keywords = {
                'dark_arbiter.talent_selected',
                'valkyr_battlemaiden.pet_active',
            },
            name = 'valkyr',
            simc_line = 'actions+=/run_action_list,name=valkyr,if=talent.dark_arbiter.enabled&pet.valkyr_battlemaiden.active',
        },
        {
            action = 'call_action_list',
            condition = 'true',
            condition_converted = 'true',
            name = 'generic',
            simc_line = 'actions+=/call_action_list,name=generic',
        },
    },
    generic = {
        {
            action = 'dark_arbiter',
            condition = '!equipped.137075&runic_power.deficit<30',
            condition_converted = '(((not (equipped[137075]))) and (((runic_power.deficit_as_number) < (30))))',
            condition_keywords = {
                'equipped',
                'runic_power.deficit',
            },
            simc_line = 'actions.generic=dark_arbiter,if=!equipped.137075&runic_power.deficit<30',
        },
        {
            action = 'dark_arbiter',
            condition = 'equipped.137075&runic_power.deficit<30&cooldown.dark_transformation.remains<2',
            condition_converted = '((equipped[137075]) and (((((runic_power.deficit_as_number) < (30))) and (((dark_transformation.cooldown_remains_as_number) < (2))))))',
            condition_keywords = {
                'dark_transformation.cooldown_remains',
                'equipped',
                'runic_power.deficit',
            },
            simc_line = 'actions.generic+=/dark_arbiter,if=equipped.137075&runic_power.deficit<30&cooldown.dark_transformation.remains<2',
        },
        {
            action = 'summon_gargoyle',
            condition = 'rune<=3',
            condition_converted = '((rune.curr_as_number) <= (3))',
            condition_keywords = {
                'rune.curr',
            },
            simc_line = 'actions.generic+=/summon_gargoyle,if=!equipped.137075,if=rune<=3',
        },
        {
            action = 'summon_gargoyle',
            condition = 'equipped.137075&cooldown.dark_transformation.remains<10&rune<=3',
            condition_converted = '((equipped[137075]) and (((((dark_transformation.cooldown_remains_as_number) < (10))) and (((rune.curr_as_number) <= (3))))))',
            condition_keywords = {
                'dark_transformation.cooldown_remains',
                'equipped',
                'rune.curr',
            },
            simc_line = 'actions.generic+=/summon_gargoyle,if=equipped.137075&cooldown.dark_transformation.remains<10&rune<=3',
        },
        {
            action = 'soul_reaper',
            condition = 'debuff.festering_wound.stack>=7&cooldown.apocalypse.remains<2',
            condition_converted = '((((festering_wound.aura_stack_as_number) >= (7))) and (((apocalypse.cooldown_remains_as_number) < (2))))',
            condition_keywords = {
                'apocalypse.cooldown_remains',
                'festering_wound.aura_stack',
            },
            simc_line = 'actions.generic+=/soul_reaper,if=debuff.festering_wound.stack>=7&cooldown.apocalypse.remains<2',
        },
        {
            action = 'apocalypse',
            condition = 'debuff.festering_wound.stack>=7',
            condition_converted = '((festering_wound.aura_stack_as_number) >= (7))',
            condition_keywords = {
                'festering_wound.aura_stack',
            },
            simc_line = 'actions.generic+=/apocalypse,if=debuff.festering_wound.stack>=7',
        },
        {
            action = 'death_coil',
            condition = 'runic_power.deficit<30',
            condition_converted = '((runic_power.deficit_as_number) < (30))',
            condition_keywords = {
                'runic_power.deficit',
            },
            simc_line = 'actions.generic+=/death_coil,if=runic_power.deficit<30',
        },
        {
            action = 'death_coil',
            condition = '!talent.dark_arbiter.enabled&buff.sudden_doom.up&!buff.necrosis.up&rune<=3',
            condition_converted = '(((not (dark_arbiter.talent_selected))) and (((sudden_doom.aura_up) and ((((not (necrosis.aura_up))) and (((rune.curr_as_number) <= (3))))))))',
            condition_keywords = {
                'dark_arbiter.talent_selected',
                'necrosis.aura_up',
                'rune.curr',
                'sudden_doom.aura_up',
            },
            simc_line = 'actions.generic+=/death_coil,if=!talent.dark_arbiter.enabled&buff.sudden_doom.up&!buff.necrosis.up&rune<=3',
        },
        {
            action = 'death_coil',
            condition = 'talent.dark_arbiter.enabled&buff.sudden_doom.up&cooldown.dark_arbiter.remains>5&rune<=3',
            condition_converted = '((dark_arbiter.talent_selected) and (((sudden_doom.aura_up) and (((((dark_arbiter.cooldown_remains_as_number) > (5))) and (((rune.curr_as_number) <= (3))))))))',
            condition_keywords = {
                'dark_arbiter.cooldown_remains',
                'dark_arbiter.talent_selected',
                'rune.curr',
                'sudden_doom.aura_up',
            },
            simc_line = 'actions.generic+=/death_coil,if=talent.dark_arbiter.enabled&buff.sudden_doom.up&cooldown.dark_arbiter.remains>5&rune<=3',
        },
        {
            action = 'festering_strike',
            condition = 'debuff.festering_wound.stack<7&cooldown.apocalypse.remains<5',
            condition_converted = '((((festering_wound.aura_stack_as_number) < (7))) and (((apocalypse.cooldown_remains_as_number) < (5))))',
            condition_keywords = {
                'apocalypse.cooldown_remains',
                'festering_wound.aura_stack',
            },
            simc_line = 'actions.generic+=/festering_strike,if=debuff.festering_wound.stack<7&cooldown.apocalypse.remains<5',
        },
        {
            action = 'wait',
            condition = 'cooldown.apocalypse.remains<=1&cooldown.apocalypse.remains',
            condition_converted = '((((apocalypse.cooldown_remains_as_number) <= (1))) and (apocalypse.cooldown_remains))',
            condition_keywords = {
                'apocalypse.cooldown_remains',
            },
            sec = 'cooldown.apocalypse.remains',
            simc_line = 'actions.generic+=/wait,sec=cooldown.apocalypse.remains,if=cooldown.apocalypse.remains<=1&cooldown.apocalypse.remains',
        },
        {
            action = 'soul_reaper',
            condition = 'debuff.festering_wound.stack>=3',
            condition_converted = '((festering_wound.aura_stack_as_number) >= (3))',
            condition_keywords = {
                'festering_wound.aura_stack',
            },
            simc_line = 'actions.generic+=/soul_reaper,if=debuff.festering_wound.stack>=3',
        },
        {
            action = 'festering_strike',
            condition = 'debuff.soul_reaper.up&!debuff.festering_wound.up',
            condition_converted = '((soul_reaper.aura_up) and ((not (festering_wound.aura_up))))',
            condition_keywords = {
                'festering_wound.aura_up',
                'soul_reaper.aura_up',
            },
            simc_line = 'actions.generic+=/festering_strike,if=debuff.soul_reaper.up&!debuff.festering_wound.up',
        },
        {
            action = 'scourge_strike',
            condition = 'debuff.soul_reaper.up&debuff.festering_wound.stack>=1',
            condition_converted = '((soul_reaper.aura_up) and (((festering_wound.aura_stack_as_number) >= (1))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'soul_reaper.aura_up',
            },
            simc_line = 'actions.generic+=/scourge_strike,if=debuff.soul_reaper.up&debuff.festering_wound.stack>=1',
        },
        {
            action = 'clawing_shadows',
            condition = 'debuff.soul_reaper.up&debuff.festering_wound.stack>=1',
            condition_converted = '((soul_reaper.aura_up) and (((festering_wound.aura_stack_as_number) >= (1))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'soul_reaper.aura_up',
            },
            simc_line = 'actions.generic+=/clawing_shadows,if=debuff.soul_reaper.up&debuff.festering_wound.stack>=1',
        },
        {
            action = 'defile',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.generic+=/defile',
        },
        {
            action = 'call_action_list',
            condition = 'active_enemies>=2',
            condition_converted = '((active_enemies_as_number) >= (2))',
            condition_keywords = {
                'active_enemies',
            },
            name = 'aoe',
            simc_line = 'actions.generic+=/call_action_list,name=aoe,if=active_enemies>=2',
        },
        {
            action = 'call_action_list',
            condition = 'equipped.132448',
            condition_converted = 'equipped[132448]',
            condition_keywords = {
                'equipped',
            },
            name = 'instructors',
            simc_line = 'actions.generic+=/call_action_list,name=instructors,if=equipped.132448',
        },
        {
            action = 'call_action_list',
            condition = '!talent.castigator.enabled&!equipped.132448',
            condition_converted = '(((not (castigator.talent_selected))) and ((not (equipped[132448]))))',
            condition_keywords = {
                'castigator.talent_selected',
                'equipped',
            },
            name = 'standard',
            simc_line = 'actions.generic+=/call_action_list,name=standard,if=!talent.castigator.enabled&!equipped.132448',
        },
        {
            action = 'call_action_list',
            condition = 'talent.castigator.enabled&!equipped.132448',
            condition_converted = '((castigator.talent_selected) and ((not (equipped[132448]))))',
            condition_keywords = {
                'castigator.talent_selected',
                'equipped',
            },
            name = 'castigator',
            simc_line = 'actions.generic+=/call_action_list,name=castigator,if=talent.castigator.enabled&!equipped.132448',
        },
    },
    instructors = {
        {
            action = 'festering_strike',
            condition = 'debuff.festering_wound.stack<=4&runic_power.deficit>23',
            condition_converted = '((((festering_wound.aura_stack_as_number) <= (4))) and (((runic_power.deficit_as_number) > (23))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'runic_power.deficit',
            },
            simc_line = 'actions.instructors=festering_strike,if=debuff.festering_wound.stack<=4&runic_power.deficit>23',
        },
        {
            action = 'death_coil',
            condition = '!buff.necrosis.up&talent.necrosis.enabled&rune<=3',
            condition_converted = '(((not (necrosis.aura_up))) and (((necrosis.talent_selected) and (((rune.curr_as_number) <= (3))))))',
            condition_keywords = {
                'necrosis.aura_up',
                'necrosis.talent_selected',
                'rune.curr',
            },
            simc_line = 'actions.instructors+=/death_coil,if=!buff.necrosis.up&talent.necrosis.enabled&rune<=3',
        },
        {
            action = 'scourge_strike',
            condition = 'buff.necrosis.react&debuff.festering_wound.stack>=5&runic_power.deficit>29',
            condition_converted = '((necrosis.aura_up) and (((((festering_wound.aura_stack_as_number) >= (5))) and (((runic_power.deficit_as_number) > (29))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'necrosis.aura_up',
                'runic_power.deficit',
            },
            simc_line = 'actions.instructors+=/scourge_strike,if=buff.necrosis.react&debuff.festering_wound.stack>=5&runic_power.deficit>29',
        },
        {
            action = 'clawing_shadows',
            condition = 'buff.necrosis.react&debuff.festering_wound.stack>=5&runic_power.deficit>29',
            condition_converted = '((necrosis.aura_up) and (((((festering_wound.aura_stack_as_number) >= (5))) and (((runic_power.deficit_as_number) > (29))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'necrosis.aura_up',
                'runic_power.deficit',
            },
            simc_line = 'actions.instructors+=/clawing_shadows,if=buff.necrosis.react&debuff.festering_wound.stack>=5&runic_power.deficit>29',
        },
        {
            action = 'scourge_strike',
            condition = 'buff.unholy_strength.react&debuff.festering_wound.stack>=5&runic_power.deficit>29',
            condition_converted = '((unholy_strength.aura_up) and (((((festering_wound.aura_stack_as_number) >= (5))) and (((runic_power.deficit_as_number) > (29))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'runic_power.deficit',
                'unholy_strength.aura_up',
            },
            simc_line = 'actions.instructors+=/scourge_strike,if=buff.unholy_strength.react&debuff.festering_wound.stack>=5&runic_power.deficit>29',
        },
        {
            action = 'clawing_shadows',
            condition = 'buff.unholy_strength.react&debuff.festering_wound.stack>=5&runic_power.deficit>29',
            condition_converted = '((unholy_strength.aura_up) and (((((festering_wound.aura_stack_as_number) >= (5))) and (((runic_power.deficit_as_number) > (29))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'runic_power.deficit',
                'unholy_strength.aura_up',
            },
            simc_line = 'actions.instructors+=/clawing_shadows,if=buff.unholy_strength.react&debuff.festering_wound.stack>=5&runic_power.deficit>29',
        },
        {
            action = 'scourge_strike',
            condition = 'rune>=2&debuff.festering_wound.stack>=5&runic_power.deficit>29',
            condition_converted = '((((rune.curr_as_number) >= (2))) and (((((festering_wound.aura_stack_as_number) >= (5))) and (((runic_power.deficit_as_number) > (29))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'rune.curr',
                'runic_power.deficit',
            },
            simc_line = 'actions.instructors+=/scourge_strike,if=rune>=2&debuff.festering_wound.stack>=5&runic_power.deficit>29',
        },
        {
            action = 'clawing_shadows',
            condition = 'rune>=2&debuff.festering_wound.stack>=5&runic_power.deficit>29',
            condition_converted = '((((rune.curr_as_number) >= (2))) and (((((festering_wound.aura_stack_as_number) >= (5))) and (((runic_power.deficit_as_number) > (29))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'rune.curr',
                'runic_power.deficit',
            },
            simc_line = 'actions.instructors+=/clawing_shadows,if=rune>=2&debuff.festering_wound.stack>=5&runic_power.deficit>29',
        },
        {
            action = 'death_coil',
            condition = 'talent.shadow_infusion.enabled&talent.dark_arbiter.enabled&!buff.dark_transformation.up&cooldown.dark_arbiter.remains>15',
            condition_converted = '((shadow_infusion.talent_selected) and (((dark_arbiter.talent_selected) and ((((not (dark_transformation.aura_up))) and (((dark_arbiter.cooldown_remains_as_number) > (15))))))))',
            condition_keywords = {
                'dark_arbiter.cooldown_remains',
                'dark_arbiter.talent_selected',
                'dark_transformation.aura_up',
                'shadow_infusion.talent_selected',
            },
            simc_line = 'actions.instructors+=/death_coil,if=talent.shadow_infusion.enabled&talent.dark_arbiter.enabled&!buff.dark_transformation.up&cooldown.dark_arbiter.remains>15',
        },
        {
            action = 'death_coil',
            condition = 'talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled&!buff.dark_transformation.up',
            condition_converted = '((shadow_infusion.talent_selected) and ((((not (dark_arbiter.talent_selected))) and ((not (dark_transformation.aura_up))))))',
            condition_keywords = {
                'dark_arbiter.talent_selected',
                'dark_transformation.aura_up',
                'shadow_infusion.talent_selected',
            },
            simc_line = 'actions.instructors+=/death_coil,if=talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled&!buff.dark_transformation.up',
        },
        {
            action = 'death_coil',
            condition = 'talent.dark_arbiter.enabled&cooldown.dark_arbiter.remains>15',
            condition_converted = '((dark_arbiter.talent_selected) and (((dark_arbiter.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'dark_arbiter.cooldown_remains',
                'dark_arbiter.talent_selected',
            },
            simc_line = 'actions.instructors+=/death_coil,if=talent.dark_arbiter.enabled&cooldown.dark_arbiter.remains>15',
        },
        {
            action = 'death_coil',
            condition = '!talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled',
            condition_converted = '(((not (shadow_infusion.talent_selected))) and ((not (dark_arbiter.talent_selected))))',
            condition_keywords = {
                'dark_arbiter.talent_selected',
                'shadow_infusion.talent_selected',
            },
            simc_line = 'actions.instructors+=/death_coil,if=!talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled',
        },
    },
    precombat = {
        {
            action = 'flask',
            condition = 'true',
            condition_converted = 'true',
            name = 'countless_armies',
            simc_line = 'actions.precombat=flask,name=countless_armies',
        },
        {
            action = 'food',
            condition = 'true',
            condition_converted = 'true',
            name = 'the_hungry_magister',
            simc_line = 'actions.precombat+=/food,name=the_hungry_magister',
        },
        {
            action = 'augmentation',
            condition = 'true',
            condition_converted = 'true',
            name = 'defiled',
            simc_line = 'actions.precombat+=/augmentation,name=defiled',
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
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
        {
            action = 'raise_dead',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/raise_dead',
        },
        {
            action = 'army_of_the_dead',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.precombat+=/army_of_the_dead',
        },
    },
    standard = {
        {
            action = 'festering_strike',
            condition = 'debuff.festering_wound.stack<=4&runic_power.deficit>23',
            condition_converted = '((((festering_wound.aura_stack_as_number) <= (4))) and (((runic_power.deficit_as_number) > (23))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'runic_power.deficit',
            },
            simc_line = 'actions.standard=festering_strike,if=debuff.festering_wound.stack<=4&runic_power.deficit>23',
        },
        {
            action = 'death_coil',
            condition = '!buff.necrosis.up&talent.necrosis.enabled&rune<=3',
            condition_converted = '(((not (necrosis.aura_up))) and (((necrosis.talent_selected) and (((rune.curr_as_number) <= (3))))))',
            condition_keywords = {
                'necrosis.aura_up',
                'necrosis.talent_selected',
                'rune.curr',
            },
            simc_line = 'actions.standard+=/death_coil,if=!buff.necrosis.up&talent.necrosis.enabled&rune<=3',
        },
        {
            action = 'scourge_strike',
            condition = 'buff.necrosis.react&debuff.festering_wound.stack>=1&runic_power.deficit>15',
            condition_converted = '((necrosis.aura_up) and (((((festering_wound.aura_stack_as_number) >= (1))) and (((runic_power.deficit_as_number) > (15))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'necrosis.aura_up',
                'runic_power.deficit',
            },
            simc_line = 'actions.standard+=/scourge_strike,if=buff.necrosis.react&debuff.festering_wound.stack>=1&runic_power.deficit>15',
        },
        {
            action = 'clawing_shadows',
            condition = 'buff.necrosis.react&debuff.festering_wound.stack>=1&runic_power.deficit>15',
            condition_converted = '((necrosis.aura_up) and (((((festering_wound.aura_stack_as_number) >= (1))) and (((runic_power.deficit_as_number) > (15))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'necrosis.aura_up',
                'runic_power.deficit',
            },
            simc_line = 'actions.standard+=/clawing_shadows,if=buff.necrosis.react&debuff.festering_wound.stack>=1&runic_power.deficit>15',
        },
        {
            action = 'scourge_strike',
            condition = 'buff.unholy_strength.react&debuff.festering_wound.stack>=1&runic_power.deficit>15',
            condition_converted = '((unholy_strength.aura_up) and (((((festering_wound.aura_stack_as_number) >= (1))) and (((runic_power.deficit_as_number) > (15))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'runic_power.deficit',
                'unholy_strength.aura_up',
            },
            simc_line = 'actions.standard+=/scourge_strike,if=buff.unholy_strength.react&debuff.festering_wound.stack>=1&runic_power.deficit>15',
        },
        {
            action = 'clawing_shadows',
            condition = 'buff.unholy_strength.react&debuff.festering_wound.stack>=1&runic_power.deficit>15',
            condition_converted = '((unholy_strength.aura_up) and (((((festering_wound.aura_stack_as_number) >= (1))) and (((runic_power.deficit_as_number) > (15))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'runic_power.deficit',
                'unholy_strength.aura_up',
            },
            simc_line = 'actions.standard+=/clawing_shadows,if=buff.unholy_strength.react&debuff.festering_wound.stack>=1&runic_power.deficit>15',
        },
        {
            action = 'scourge_strike',
            condition = 'rune>=2&debuff.festering_wound.stack>=1&runic_power.deficit>15',
            condition_converted = '((((rune.curr_as_number) >= (2))) and (((((festering_wound.aura_stack_as_number) >= (1))) and (((runic_power.deficit_as_number) > (15))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'rune.curr',
                'runic_power.deficit',
            },
            simc_line = 'actions.standard+=/scourge_strike,if=rune>=2&debuff.festering_wound.stack>=1&runic_power.deficit>15',
        },
        {
            action = 'clawing_shadows',
            condition = 'rune>=2&debuff.festering_wound.stack>=1&runic_power.deficit>15',
            condition_converted = '((((rune.curr_as_number) >= (2))) and (((((festering_wound.aura_stack_as_number) >= (1))) and (((runic_power.deficit_as_number) > (15))))))',
            condition_keywords = {
                'festering_wound.aura_stack',
                'rune.curr',
                'runic_power.deficit',
            },
            simc_line = 'actions.standard+=/clawing_shadows,if=rune>=2&debuff.festering_wound.stack>=1&runic_power.deficit>15',
        },
        {
            action = 'death_coil',
            condition = 'talent.shadow_infusion.enabled&talent.dark_arbiter.enabled&!buff.dark_transformation.up&cooldown.dark_arbiter.remains>15',
            condition_converted = '((shadow_infusion.talent_selected) and (((dark_arbiter.talent_selected) and ((((not (dark_transformation.aura_up))) and (((dark_arbiter.cooldown_remains_as_number) > (15))))))))',
            condition_keywords = {
                'dark_arbiter.cooldown_remains',
                'dark_arbiter.talent_selected',
                'dark_transformation.aura_up',
                'shadow_infusion.talent_selected',
            },
            simc_line = 'actions.standard+=/death_coil,if=talent.shadow_infusion.enabled&talent.dark_arbiter.enabled&!buff.dark_transformation.up&cooldown.dark_arbiter.remains>15',
        },
        {
            action = 'death_coil',
            condition = 'talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled&!buff.dark_transformation.up',
            condition_converted = '((shadow_infusion.talent_selected) and ((((not (dark_arbiter.talent_selected))) and ((not (dark_transformation.aura_up))))))',
            condition_keywords = {
                'dark_arbiter.talent_selected',
                'dark_transformation.aura_up',
                'shadow_infusion.talent_selected',
            },
            simc_line = 'actions.standard+=/death_coil,if=talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled&!buff.dark_transformation.up',
        },
        {
            action = 'death_coil',
            condition = 'talent.dark_arbiter.enabled&cooldown.dark_arbiter.remains>15',
            condition_converted = '((dark_arbiter.talent_selected) and (((dark_arbiter.cooldown_remains_as_number) > (15))))',
            condition_keywords = {
                'dark_arbiter.cooldown_remains',
                'dark_arbiter.talent_selected',
            },
            simc_line = 'actions.standard+=/death_coil,if=talent.dark_arbiter.enabled&cooldown.dark_arbiter.remains>15',
        },
        {
            action = 'death_coil',
            condition = '!talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled',
            condition_converted = '(((not (shadow_infusion.talent_selected))) and ((not (dark_arbiter.talent_selected))))',
            condition_keywords = {
                'dark_arbiter.talent_selected',
                'shadow_infusion.talent_selected',
            },
            simc_line = 'actions.standard+=/death_coil,if=!talent.shadow_infusion.enabled&!talent.dark_arbiter.enabled',
        },
    },
    valkyr = {
        {
            action = 'death_coil',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.valkyr=death_coil',
        },
        {
            action = 'apocalypse',
            condition = 'debuff.festering_wound.stack=8',
            condition_converted = '((festering_wound.aura_stack) == (8))',
            condition_keywords = {
                'festering_wound.aura_stack',
            },
            simc_line = 'actions.valkyr+=/apocalypse,if=debuff.festering_wound.stack=8',
        },
        {
            action = 'festering_strike',
            condition = 'debuff.festering_wound.stack<8&cooldown.apocalypse.remains<5',
            condition_converted = '((((festering_wound.aura_stack_as_number) < (8))) and (((apocalypse.cooldown_remains_as_number) < (5))))',
            condition_keywords = {
                'apocalypse.cooldown_remains',
                'festering_wound.aura_stack',
            },
            simc_line = 'actions.valkyr+=/festering_strike,if=debuff.festering_wound.stack<8&cooldown.apocalypse.remains<5',
        },
        {
            action = 'call_action_list',
            condition = 'active_enemies>=2',
            condition_converted = '((active_enemies_as_number) >= (2))',
            condition_keywords = {
                'active_enemies',
            },
            name = 'aoe',
            simc_line = 'actions.valkyr+=/call_action_list,name=aoe,if=active_enemies>=2',
        },
        {
            action = 'festering_strike',
            condition = 'debuff.festering_wound.stack<=3',
            condition_converted = '((festering_wound.aura_stack_as_number) <= (3))',
            condition_keywords = {
                'festering_wound.aura_stack',
            },
            simc_line = 'actions.valkyr+=/festering_strike,if=debuff.festering_wound.stack<=3',
        },
        {
            action = 'scourge_strike',
            condition = 'debuff.festering_wound.up',
            condition_converted = 'festering_wound.aura_up',
            condition_keywords = {
                'festering_wound.aura_up',
            },
            simc_line = 'actions.valkyr+=/scourge_strike,if=debuff.festering_wound.up',
        },
        {
            action = 'clawing_shadows',
            condition = 'debuff.festering_wound.up',
            condition_converted = 'festering_wound.aura_up',
            condition_keywords = {
                'festering_wound.aura_up',
            },
            simc_line = 'actions.valkyr+=/clawing_shadows,if=debuff.festering_wound.up',
        },
    },
}


-- keywords: placeholder::deathknight::blood
---- active_enemies
---- blood_plague.aura_down
---- bone_shield.aura_stack
---- crimson_scourge.aura_up
---- health.max
---- incoming_damage_over_3000
---- runic_power.curr

internal.actions['placeholder::deathknight::blood'] = {
    aoe = {
        {
            action = 'blood_boil',
            condition = 'debuff.blood_plague.down',
            condition_converted = 'blood_plague.aura_down',
            condition_keywords = {
                'blood_plague.aura_down',
            },
            simc_line = 'actions.aoe=blood_boil,if=debuff.blood_plague.down',
        },
        {
            action = 'death_strike',
            condition = 'runic_power>95',
            condition_converted = '((runic_power.curr_as_number) > (95))',
            condition_keywords = {
                'runic_power.curr',
            },
            simc_line = 'actions.aoe+=/death_strike,if=runic_power>95',
        },
        {
            action = 'death_and_decay',
            condition = 'buff.crimson_scourge.up',
            condition_converted = 'crimson_scourge.aura_up',
            condition_keywords = {
                'crimson_scourge.aura_up',
            },
            simc_line = 'actions.aoe+=/death_and_decay,if=buff.crimson_scourge.up',
        },
        {
            action = 'marrowrend',
            condition = 'buff.bone_shield.stack<1',
            condition_converted = '((bone_shield.aura_stack_as_number) < (1))',
            condition_keywords = {
                'bone_shield.aura_stack',
            },
            simc_line = 'actions.aoe+=/marrowrend,if=buff.bone_shield.stack<1',
        },
        {
            action = 'blood_boil',
            condition = 'buff.bone_shield.stack<1',
            condition_converted = '((bone_shield.aura_stack_as_number) < (1))',
            condition_keywords = {
                'bone_shield.aura_stack',
            },
            simc_line = 'actions.aoe+=/blood_boil,if=buff.bone_shield.stack<1',
        },
        {
            action = 'death_strike',
            condition = 'runic_power>80',
            condition_converted = '((runic_power.curr_as_number) > (80))',
            condition_keywords = {
                'runic_power.curr',
            },
            simc_line = 'actions.aoe+=/death_strike,if=runic_power>80',
        },
        {
            action = 'death_strike',
            condition = 'incoming_damage_3s>health.max*0.25',
            condition_converted = '((incoming_damage_over_3000_as_number) > ((health.max_as_number * 0.25)))',
            condition_keywords = {
                'health.max',
                'incoming_damage_over_3000',
            },
            simc_line = 'actions.aoe+=/death_strike,if=incoming_damage_3s>health.max*0.25',
        },
        {
            action = 'death_and_decay',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.aoe+=/death_and_decay',
        },
        {
            action = 'heart_strike',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.aoe+=/heart_strike',
        },
    },
    cleave = {
        {
            action = 'blood_boil',
            condition = 'debuff.blood_plague.down',
            condition_converted = 'blood_plague.aura_down',
            condition_keywords = {
                'blood_plague.aura_down',
            },
            simc_line = 'actions.cleave=blood_boil,if=debuff.blood_plague.down',
        },
        {
            action = 'death_strike',
            condition = 'runic_power>95',
            condition_converted = '((runic_power.curr_as_number) > (95))',
            condition_keywords = {
                'runic_power.curr',
            },
            simc_line = 'actions.cleave+=/death_strike,if=runic_power>95',
        },
        {
            action = 'death_and_decay',
            condition = 'buff.crimson_scourge.up',
            condition_converted = 'crimson_scourge.aura_up',
            condition_keywords = {
                'crimson_scourge.aura_up',
            },
            simc_line = 'actions.cleave+=/death_and_decay,if=buff.crimson_scourge.up',
        },
        {
            action = 'marrowrend',
            condition = 'buff.bone_shield.stack<5',
            condition_converted = '((bone_shield.aura_stack_as_number) < (5))',
            condition_keywords = {
                'bone_shield.aura_stack',
            },
            simc_line = 'actions.cleave+=/marrowrend,if=buff.bone_shield.stack<5',
        },
        {
            action = 'blood_boil',
            condition = 'buff.bone_shield.stack<5',
            condition_converted = '((bone_shield.aura_stack_as_number) < (5))',
            condition_keywords = {
                'bone_shield.aura_stack',
            },
            simc_line = 'actions.cleave+=/blood_boil,if=buff.bone_shield.stack<5',
        },
        {
            action = 'death_strike',
            condition = 'runic_power>80',
            condition_converted = '((runic_power.curr_as_number) > (80))',
            condition_keywords = {
                'runic_power.curr',
            },
            simc_line = 'actions.cleave+=/death_strike,if=runic_power>80',
        },
        {
            action = 'death_strike',
            condition = 'incoming_damage_3s>health.max*0.25',
            condition_converted = '((incoming_damage_over_3000_as_number) > ((health.max_as_number * 0.25)))',
            condition_keywords = {
                'health.max',
                'incoming_damage_over_3000',
            },
            simc_line = 'actions.cleave+=/death_strike,if=incoming_damage_3s>health.max*0.25',
        },
        {
            action = 'death_and_decay',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cleave+=/death_and_decay',
        },
        {
            action = 'heart_strike',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.cleave+=/heart_strike',
        },
    },
    default = {
        {
            action = 'auto_attack',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions=auto_attack',
        },
        {
            action = 'call_action_list',
            condition = 'active_enemies=1',
            condition_converted = '((active_enemies) == (1))',
            condition_keywords = {
                'active_enemies',
            },
            name = 'st',
            simc_line = 'actions+=/call_action_list,name=st,if=active_enemies=1',
        },
        {
            action = 'call_action_list',
            condition = 'active_enemies=2',
            condition_converted = '((active_enemies) == (2))',
            condition_keywords = {
                'active_enemies',
            },
            name = 'cleave',
            simc_line = 'actions+=/call_action_list,name=cleave,if=active_enemies=2',
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
            action = 'blood_boil',
            condition = 'debuff.blood_plague.down',
            condition_converted = 'blood_plague.aura_down',
            condition_keywords = {
                'blood_plague.aura_down',
            },
            simc_line = 'actions.st=blood_boil,if=debuff.blood_plague.down',
        },
        {
            action = 'death_strike',
            condition = 'runic_power>95',
            condition_converted = '((runic_power.curr_as_number) > (95))',
            condition_keywords = {
                'runic_power.curr',
            },
            simc_line = 'actions.st+=/death_strike,if=runic_power>95',
        },
        {
            action = 'death_and_decay',
            condition = 'buff.crimson_scourge.up',
            condition_converted = 'crimson_scourge.aura_up',
            condition_keywords = {
                'crimson_scourge.aura_up',
            },
            simc_line = 'actions.st+=/death_and_decay,if=buff.crimson_scourge.up',
        },
        {
            action = 'marrowrend',
            condition = 'buff.bone_shield.stack<5',
            condition_converted = '((bone_shield.aura_stack_as_number) < (5))',
            condition_keywords = {
                'bone_shield.aura_stack',
            },
            simc_line = 'actions.st+=/marrowrend,if=buff.bone_shield.stack<5',
        },
        {
            action = 'death_strike',
            condition = 'runic_power>80',
            condition_converted = '((runic_power.curr_as_number) > (80))',
            condition_keywords = {
                'runic_power.curr',
            },
            simc_line = 'actions.st+=/death_strike,if=runic_power>80',
        },
        {
            action = 'death_strike',
            condition = 'incoming_damage_3s>health.max*0.25',
            condition_converted = '((incoming_damage_over_3000_as_number) > ((health.max_as_number * 0.25)))',
            condition_keywords = {
                'health.max',
                'incoming_damage_over_3000',
            },
            simc_line = 'actions.st+=/death_strike,if=incoming_damage_3s>health.max*0.25',
        },
        {
            action = 'blood_boil',
            condition = 'buff.bone_shield.stack<5',
            condition_converted = '((bone_shield.aura_stack_as_number) < (5))',
            condition_keywords = {
                'bone_shield.aura_stack',
            },
            simc_line = 'actions.st+=/blood_boil,if=buff.bone_shield.stack<5',
        },
        {
            action = 'death_and_decay',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.st+=/death_and_decay',
        },
        {
            action = 'heart_strike',
            condition = 'true',
            condition_converted = 'true',
            simc_line = 'actions.st+=/heart_strike',
        },
    },
}


