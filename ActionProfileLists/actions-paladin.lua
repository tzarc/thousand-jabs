local _, internal = ...
internal.apls = internal.apls or {}
internal.actions = internal.actions or {}

internal.apls["legion-dev::paladin::protection"] = [[
actions.precombat=flask,type=flask_of_ten_thousand_scars
actions.precombat+=/flask,type=flask_of_the_countless_armies,if=role.attack|using_apl.max_dps
actions.precombat+=/food,type=seedbattered_fish_plate
actions.precombat+=/food,type=azshari_salad,if=role.attack|using_apl.max_dps
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=unbending_potion
actions=auto_attack
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/call_action_list,name=prot
actions.max_dps=auto_attack
actions.max_dps+=/blood_fury
actions.max_dps+=/berserking
actions.max_dps+=/arcane_torrent
actions.max_survival=auto_attack
actions.max_survival+=/blood_fury
actions.max_survival+=/berserking
actions.max_survival+=/arcane_torrent
actions.prot=seraphim,if=talent.seraphim.enabled&action.shield_of_the_righteous.charges>=1.99
actions.prot+=/shield_of_the_righteous,if=(!talent.seraphim.enabled|action.shield_of_the_righteous.charges>1.99)&!(debuff.eye_of_tyr.up&buff.aegis_of_light.up&buff.ardent_defender.up&buff.guardian_of_ancient_kings.up&buff.divine_shield.up&buff.potion.up)
actions.prot+=/shield_of_the_righteous,if=(talent.bastion_of_light.enabled&talent.seraphim.enabled&buff.seraphim.up&cooldown.bastion_of_light.up)&!(debuff.eye_of_tyr.up&buff.aegis_of_light.up&buff.ardent_defender.up&buff.guardian_of_ancient_kings.up&buff.divine_shield.up&buff.potion.up)
actions.prot+=/bastion_of_light,if=talent.bastion_of_light.enabled&action.shield_of_the_righteous.charges<1
actions.prot+=/light_of_the_protector,if=(health.pct<40)
actions.prot+=/hand_of_the_protector,if=(health.pct<40)
actions.prot+=/light_of_the_protector,if=(incoming_damage_10000ms<health.max*1.25)&health.pct<55&talent.righteous_protector.enabled
actions.prot+=/light_of_the_protector,if=(incoming_damage_13000ms<health.max*1.6)&health.pct<55
actions.prot+=/hand_of_the_protector,if=(incoming_damage_6000ms<health.max*0.7)&health.pct<65&talent.righteous_protector.enabled
actions.prot+=/hand_of_the_protector,if=(incoming_damage_9000ms<health.max*1.2)&health.pct<55
actions.prot+=/divine_steed,if=talent.knight_templar.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/eye_of_tyr,if=incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/aegis_of_light,if=incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/guardian_of_ancient_kings,if=incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/divine_shield,if=talent.final_stand.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/ardent_defender,if=incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/lay_on_hands,if=health.pct<15
actions.prot+=/potion,name=unbending_potion
actions.prot+=/potion,name=draenic_strength,if=incoming_damage_2500ms>health.max*0.4&&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)|target.time_to_die<=25
actions.prot+=/stoneform,if=incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)
actions.prot+=/avenging_wrath,if=!talent.seraphim.enabled
actions.prot+=/avenging_wrath,if=talent.seraphim.enabled&buff.seraphim.up
actions.prot+=/judgment
actions.prot+=/avengers_shield,if=talent.crusaders_judgment.enabled&buff.grand_crusader.up
actions.prot+=/blessed_hammer
actions.prot+=/avengers_shield
actions.prot+=/consecration
actions.prot+=/blinding_light
actions.prot+=/hammer_of_the_righteous
actions.prot_aoe=avengers_shield
actions.prot_aoe+=/blessed_hammer
actions.prot_aoe+=/judgment
actions.prot_aoe+=/consecration
actions.prot_aoe+=/hammer_of_the_righteous
]]

-- keywords: legion-dev::paladin::protection
---- aegis_of_light.spell_remains
---- ardent_defender.spell_remains
---- bastion_of_light.cooldown_remains
---- bastion_of_light.talent_enabled
---- crusaders_judgment.talent_enabled
---- divine_shield.spell_remains
---- eye_of_tyr.spell_remains
---- final_stand.talent_enabled
---- grand_crusader.spell_remains
---- guardian_of_ancient_kings.spell_remains
---- health.max
---- health.percent
---- incoming_damage_over_10000
---- incoming_damage_over_13000
---- incoming_damage_over_2500
---- incoming_damage_over_6000
---- incoming_damage_over_9000
---- knight_templar.talent_enabled
---- potion.spell_remains
---- righteous_protector.talent_enabled
---- role.attack
---- seraphim.spell_remains
---- seraphim.talent_enabled
---- shield_of_the_righteous.spell_charges
---- target.time_to_die
---- using_apl.max_dps

internal.actions['legion-dev::paladin::protection'] = {
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
            simc_line = 'actions.precombat=flask,type=flask_of_ten_thousand_scars',
            type = 'flask_of_ten_thousand_scars',
        },
        {
            action = 'flask',
            condition = 'role.attack|using_apl.max_dps',
            condition_converted = '((role.attack) or (using_apl.max_dps))',
            condition_keywords = {
                'role.attack',
                'using_apl.max_dps',
            },
            simc_line = 'actions.precombat+=/flask,type=flask_of_the_countless_armies,if=role.attack|using_apl.max_dps',
            type = 'flask_of_the_countless_armies',
        },
        {
            action = 'food',
            simc_line = 'actions.precombat+=/food,type=seedbattered_fish_plate',
            type = 'seedbattered_fish_plate',
        },
        {
            action = 'food',
            condition = 'role.attack|using_apl.max_dps',
            condition_converted = '((role.attack) or (using_apl.max_dps))',
            condition_keywords = {
                'role.attack',
                'using_apl.max_dps',
            },
            simc_line = 'actions.precombat+=/food,type=azshari_salad,if=role.attack|using_apl.max_dps',
            type = 'azshari_salad',
        },
        {
            action = 'potion',
            name = 'unbending_potion',
            simc_line = 'actions.precombat+=/potion,name=unbending_potion',
        },
    },
    prot = {
        {
            action = 'seraphim',
            condition = 'talent.seraphim.enabled&action.shield_of_the_righteous.charges>=1.99',
            condition_converted = '((seraphim.talent_enabled) and (((shield_of_the_righteous.spell_charges_as_number) >= (1.99))))',
            condition_keywords = {
                'seraphim.talent_enabled',
                'shield_of_the_righteous.spell_charges',
            },
            simc_line = 'actions.prot=seraphim,if=talent.seraphim.enabled&action.shield_of_the_righteous.charges>=1.99',
        },
        {
            action = 'shield_of_the_righteous',
            condition = '(!talent.seraphim.enabled|action.shield_of_the_righteous.charges>1.99)&!(debuff.eye_of_tyr.up&buff.aegis_of_light.up&buff.ardent_defender.up&buff.guardian_of_ancient_kings.up&buff.divine_shield.up&buff.potion.up)',
            condition_converted = '((((((not seraphim.talent_enabled)) or (((shield_of_the_righteous.spell_charges_as_number) > (1.99)))))) and ((not (((((eye_of_tyr.spell_remains_as_number > 0)) and ((((aegis_of_light.spell_remains_as_number > 0)) and ((((ardent_defender.spell_remains_as_number > 0)) and ((((guardian_of_ancient_kings.spell_remains_as_number > 0)) and ((((divine_shield.spell_remains_as_number > 0)) and ((potion.spell_remains_as_number > 0))))))))))))))))',
            condition_keywords = {
                'aegis_of_light.spell_remains',
                'ardent_defender.spell_remains',
                'divine_shield.spell_remains',
                'eye_of_tyr.spell_remains',
                'guardian_of_ancient_kings.spell_remains',
                'potion.spell_remains',
                'seraphim.talent_enabled',
                'shield_of_the_righteous.spell_charges',
            },
            simc_line = 'actions.prot+=/shield_of_the_righteous,if=(!talent.seraphim.enabled|action.shield_of_the_righteous.charges>1.99)&!(debuff.eye_of_tyr.up&buff.aegis_of_light.up&buff.ardent_defender.up&buff.guardian_of_ancient_kings.up&buff.divine_shield.up&buff.potion.up)',
        },
        {
            action = 'shield_of_the_righteous',
            condition = '(talent.bastion_of_light.enabled&talent.seraphim.enabled&buff.seraphim.up&cooldown.bastion_of_light.up)&!(debuff.eye_of_tyr.up&buff.aegis_of_light.up&buff.ardent_defender.up&buff.guardian_of_ancient_kings.up&buff.divine_shield.up&buff.potion.up)',
            condition_converted = '(((((bastion_of_light.talent_enabled) and (((seraphim.talent_enabled) and ((((seraphim.spell_remains_as_number > 0)) and ((bastion_of_light.cooldown_remains_as_number > 0))))))))) and ((not (((((eye_of_tyr.spell_remains_as_number > 0)) and ((((aegis_of_light.spell_remains_as_number > 0)) and ((((ardent_defender.spell_remains_as_number > 0)) and ((((guardian_of_ancient_kings.spell_remains_as_number > 0)) and ((((divine_shield.spell_remains_as_number > 0)) and ((potion.spell_remains_as_number > 0))))))))))))))))',
            condition_keywords = {
                'aegis_of_light.spell_remains',
                'ardent_defender.spell_remains',
                'bastion_of_light.cooldown_remains',
                'bastion_of_light.talent_enabled',
                'divine_shield.spell_remains',
                'eye_of_tyr.spell_remains',
                'guardian_of_ancient_kings.spell_remains',
                'potion.spell_remains',
                'seraphim.spell_remains',
                'seraphim.talent_enabled',
            },
            simc_line = 'actions.prot+=/shield_of_the_righteous,if=(talent.bastion_of_light.enabled&talent.seraphim.enabled&buff.seraphim.up&cooldown.bastion_of_light.up)&!(debuff.eye_of_tyr.up&buff.aegis_of_light.up&buff.ardent_defender.up&buff.guardian_of_ancient_kings.up&buff.divine_shield.up&buff.potion.up)',
        },
        {
            action = 'bastion_of_light',
            condition = 'talent.bastion_of_light.enabled&action.shield_of_the_righteous.charges<1',
            condition_converted = '((bastion_of_light.talent_enabled) and (((shield_of_the_righteous.spell_charges_as_number) < (1))))',
            condition_keywords = {
                'bastion_of_light.talent_enabled',
                'shield_of_the_righteous.spell_charges',
            },
            simc_line = 'actions.prot+=/bastion_of_light,if=talent.bastion_of_light.enabled&action.shield_of_the_righteous.charges<1',
        },
        {
            action = 'light_of_the_protector',
            condition = '(health.pct<40)',
            condition_converted = '(((health.percent_as_number) < (40)))',
            condition_keywords = {
                'health.percent',
            },
            simc_line = 'actions.prot+=/light_of_the_protector,if=(health.pct<40)',
        },
        {
            action = 'hand_of_the_protector',
            condition = '(health.pct<40)',
            condition_converted = '(((health.percent_as_number) < (40)))',
            condition_keywords = {
                'health.percent',
            },
            simc_line = 'actions.prot+=/hand_of_the_protector,if=(health.pct<40)',
        },
        {
            action = 'light_of_the_protector',
            condition = '(incoming_damage_10000ms<health.max*1.25)&health.pct<55&talent.righteous_protector.enabled',
            condition_converted = '(((((incoming_damage_over_10000_as_number) < ((health.max_as_number * 1.25))))) and (((((health.percent_as_number) < (55))) and (righteous_protector.talent_enabled))))',
            condition_keywords = {
                'health.max',
                'health.percent',
                'incoming_damage_over_10000',
                'righteous_protector.talent_enabled',
            },
            simc_line = 'actions.prot+=/light_of_the_protector,if=(incoming_damage_10000ms<health.max*1.25)&health.pct<55&talent.righteous_protector.enabled',
        },
        {
            action = 'light_of_the_protector',
            condition = '(incoming_damage_13000ms<health.max*1.6)&health.pct<55',
            condition_converted = '(((((incoming_damage_over_13000_as_number) < ((health.max_as_number * 1.6))))) and (((health.percent_as_number) < (55))))',
            condition_keywords = {
                'health.max',
                'health.percent',
                'incoming_damage_over_13000',
            },
            simc_line = 'actions.prot+=/light_of_the_protector,if=(incoming_damage_13000ms<health.max*1.6)&health.pct<55',
        },
        {
            action = 'hand_of_the_protector',
            condition = '(incoming_damage_6000ms<health.max*0.7)&health.pct<65&talent.righteous_protector.enabled',
            condition_converted = '(((((incoming_damage_over_6000_as_number) < ((health.max_as_number * 0.7))))) and (((((health.percent_as_number) < (65))) and (righteous_protector.talent_enabled))))',
            condition_keywords = {
                'health.max',
                'health.percent',
                'incoming_damage_over_6000',
                'righteous_protector.talent_enabled',
            },
            simc_line = 'actions.prot+=/hand_of_the_protector,if=(incoming_damage_6000ms<health.max*0.7)&health.pct<65&talent.righteous_protector.enabled',
        },
        {
            action = 'hand_of_the_protector',
            condition = '(incoming_damage_9000ms<health.max*1.2)&health.pct<55',
            condition_converted = '(((((incoming_damage_over_9000_as_number) < ((health.max_as_number * 1.2))))) and (((health.percent_as_number) < (55))))',
            condition_keywords = {
                'health.max',
                'health.percent',
                'incoming_damage_over_9000',
            },
            simc_line = 'actions.prot+=/hand_of_the_protector,if=(incoming_damage_9000ms<health.max*1.2)&health.pct<55',
        },
        {
            action = 'divine_steed',
            condition = 'talent.knight_templar.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
            condition_converted = '((knight_templar.talent_enabled) and (((((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.4)))) and ((not (((((eye_of_tyr.spell_remains_as_number > 0)) or ((((aegis_of_light.spell_remains_as_number > 0)) or ((((ardent_defender.spell_remains_as_number > 0)) or ((((guardian_of_ancient_kings.spell_remains_as_number > 0)) or ((((divine_shield.spell_remains_as_number > 0)) or ((potion.spell_remains_as_number > 0))))))))))))))))))',
            condition_keywords = {
                'aegis_of_light.spell_remains',
                'ardent_defender.spell_remains',
                'divine_shield.spell_remains',
                'eye_of_tyr.spell_remains',
                'guardian_of_ancient_kings.spell_remains',
                'health.max',
                'incoming_damage_over_2500',
                'knight_templar.talent_enabled',
                'potion.spell_remains',
            },
            simc_line = 'actions.prot+=/divine_steed,if=talent.knight_templar.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
        },
        {
            action = 'eye_of_tyr',
            condition = 'incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
            condition_converted = '((((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.4)))) and ((not (((((eye_of_tyr.spell_remains_as_number > 0)) or ((((aegis_of_light.spell_remains_as_number > 0)) or ((((ardent_defender.spell_remains_as_number > 0)) or ((((guardian_of_ancient_kings.spell_remains_as_number > 0)) or ((((divine_shield.spell_remains_as_number > 0)) or ((potion.spell_remains_as_number > 0))))))))))))))))',
            condition_keywords = {
                'aegis_of_light.spell_remains',
                'ardent_defender.spell_remains',
                'divine_shield.spell_remains',
                'eye_of_tyr.spell_remains',
                'guardian_of_ancient_kings.spell_remains',
                'health.max',
                'incoming_damage_over_2500',
                'potion.spell_remains',
            },
            simc_line = 'actions.prot+=/eye_of_tyr,if=incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
        },
        {
            action = 'aegis_of_light',
            condition = 'incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
            condition_converted = '((((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.4)))) and ((not (((((eye_of_tyr.spell_remains_as_number > 0)) or ((((aegis_of_light.spell_remains_as_number > 0)) or ((((ardent_defender.spell_remains_as_number > 0)) or ((((guardian_of_ancient_kings.spell_remains_as_number > 0)) or ((((divine_shield.spell_remains_as_number > 0)) or ((potion.spell_remains_as_number > 0))))))))))))))))',
            condition_keywords = {
                'aegis_of_light.spell_remains',
                'ardent_defender.spell_remains',
                'divine_shield.spell_remains',
                'eye_of_tyr.spell_remains',
                'guardian_of_ancient_kings.spell_remains',
                'health.max',
                'incoming_damage_over_2500',
                'potion.spell_remains',
            },
            simc_line = 'actions.prot+=/aegis_of_light,if=incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
        },
        {
            action = 'guardian_of_ancient_kings',
            condition = 'incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
            condition_converted = '((((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.4)))) and ((not (((((eye_of_tyr.spell_remains_as_number > 0)) or ((((aegis_of_light.spell_remains_as_number > 0)) or ((((ardent_defender.spell_remains_as_number > 0)) or ((((guardian_of_ancient_kings.spell_remains_as_number > 0)) or ((((divine_shield.spell_remains_as_number > 0)) or ((potion.spell_remains_as_number > 0))))))))))))))))',
            condition_keywords = {
                'aegis_of_light.spell_remains',
                'ardent_defender.spell_remains',
                'divine_shield.spell_remains',
                'eye_of_tyr.spell_remains',
                'guardian_of_ancient_kings.spell_remains',
                'health.max',
                'incoming_damage_over_2500',
                'potion.spell_remains',
            },
            simc_line = 'actions.prot+=/guardian_of_ancient_kings,if=incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
        },
        {
            action = 'divine_shield',
            condition = 'talent.final_stand.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
            condition_converted = '((final_stand.talent_enabled) and (((((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.4)))) and ((not (((((eye_of_tyr.spell_remains_as_number > 0)) or ((((aegis_of_light.spell_remains_as_number > 0)) or ((((ardent_defender.spell_remains_as_number > 0)) or ((((guardian_of_ancient_kings.spell_remains_as_number > 0)) or ((((divine_shield.spell_remains_as_number > 0)) or ((potion.spell_remains_as_number > 0))))))))))))))))))',
            condition_keywords = {
                'aegis_of_light.spell_remains',
                'ardent_defender.spell_remains',
                'divine_shield.spell_remains',
                'eye_of_tyr.spell_remains',
                'final_stand.talent_enabled',
                'guardian_of_ancient_kings.spell_remains',
                'health.max',
                'incoming_damage_over_2500',
                'potion.spell_remains',
            },
            simc_line = 'actions.prot+=/divine_shield,if=talent.final_stand.enabled&incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
        },
        {
            action = 'ardent_defender',
            condition = 'incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
            condition_converted = '((((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.4)))) and ((not (((((eye_of_tyr.spell_remains_as_number > 0)) or ((((aegis_of_light.spell_remains_as_number > 0)) or ((((ardent_defender.spell_remains_as_number > 0)) or ((((guardian_of_ancient_kings.spell_remains_as_number > 0)) or ((((divine_shield.spell_remains_as_number > 0)) or ((potion.spell_remains_as_number > 0))))))))))))))))',
            condition_keywords = {
                'aegis_of_light.spell_remains',
                'ardent_defender.spell_remains',
                'divine_shield.spell_remains',
                'eye_of_tyr.spell_remains',
                'guardian_of_ancient_kings.spell_remains',
                'health.max',
                'incoming_damage_over_2500',
                'potion.spell_remains',
            },
            simc_line = 'actions.prot+=/ardent_defender,if=incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
        },
        {
            action = 'lay_on_hands',
            condition = 'health.pct<15',
            condition_converted = '((health.percent_as_number) < (15))',
            condition_keywords = {
                'health.percent',
            },
            simc_line = 'actions.prot+=/lay_on_hands,if=health.pct<15',
        },
        {
            action = 'potion',
            name = 'unbending_potion',
            simc_line = 'actions.prot+=/potion,name=unbending_potion',
        },
        {
            action = 'potion',
            condition = 'incoming_damage_2500ms>health.max*0.4&&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)|target.time_to_die<=25',
            condition_converted = '((((((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.4)))) and ((not (((((eye_of_tyr.spell_remains_as_number > 0)) or ((((aegis_of_light.spell_remains_as_number > 0)) or ((((ardent_defender.spell_remains_as_number > 0)) or ((((guardian_of_ancient_kings.spell_remains_as_number > 0)) or ((((divine_shield.spell_remains_as_number > 0)) or ((potion.spell_remains_as_number > 0))))))))))))))))) or (((target.time_to_die_as_number) <= (25))))',
            condition_keywords = {
                'aegis_of_light.spell_remains',
                'ardent_defender.spell_remains',
                'divine_shield.spell_remains',
                'eye_of_tyr.spell_remains',
                'guardian_of_ancient_kings.spell_remains',
                'health.max',
                'incoming_damage_over_2500',
                'potion.spell_remains',
                'target.time_to_die',
            },
            name = 'draenic_strength',
            simc_line = 'actions.prot+=/potion,name=draenic_strength,if=incoming_damage_2500ms>health.max*0.4&&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)|target.time_to_die<=25',
        },
        {
            action = 'stoneform',
            condition = 'incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
            condition_converted = '((((incoming_damage_over_2500_as_number) > ((health.max_as_number * 0.4)))) and ((not (((((eye_of_tyr.spell_remains_as_number > 0)) or ((((aegis_of_light.spell_remains_as_number > 0)) or ((((ardent_defender.spell_remains_as_number > 0)) or ((((guardian_of_ancient_kings.spell_remains_as_number > 0)) or ((((divine_shield.spell_remains_as_number > 0)) or ((potion.spell_remains_as_number > 0))))))))))))))))',
            condition_keywords = {
                'aegis_of_light.spell_remains',
                'ardent_defender.spell_remains',
                'divine_shield.spell_remains',
                'eye_of_tyr.spell_remains',
                'guardian_of_ancient_kings.spell_remains',
                'health.max',
                'incoming_damage_over_2500',
                'potion.spell_remains',
            },
            simc_line = 'actions.prot+=/stoneform,if=incoming_damage_2500ms>health.max*0.4&!(debuff.eye_of_tyr.up|buff.aegis_of_light.up|buff.ardent_defender.up|buff.guardian_of_ancient_kings.up|buff.divine_shield.up|buff.potion.up)',
        },
        {
            action = 'avenging_wrath',
            condition = '!talent.seraphim.enabled',
            condition_converted = '(not seraphim.talent_enabled)',
            condition_keywords = {
                'seraphim.talent_enabled',
            },
            simc_line = 'actions.prot+=/avenging_wrath,if=!talent.seraphim.enabled',
        },
        {
            action = 'avenging_wrath',
            condition = 'talent.seraphim.enabled&buff.seraphim.up',
            condition_converted = '((seraphim.talent_enabled) and ((seraphim.spell_remains_as_number > 0)))',
            condition_keywords = {
                'seraphim.spell_remains',
                'seraphim.talent_enabled',
            },
            simc_line = 'actions.prot+=/avenging_wrath,if=talent.seraphim.enabled&buff.seraphim.up',
        },
        {
            action = 'avengers_shield',
            condition = 'talent.crusaders_judgment.enabled&buff.grand_crusader.up',
            condition_converted = '((crusaders_judgment.talent_enabled) and ((grand_crusader.spell_remains_as_number > 0)))',
            condition_keywords = {
                'crusaders_judgment.talent_enabled',
                'grand_crusader.spell_remains',
            },
            simc_line = 'actions.prot+=/avengers_shield,if=talent.crusaders_judgment.enabled&buff.grand_crusader.up',
        },
    },
}


internal.apls["legion-dev::paladin::retribution"] = [[
actions.precombat=flask,type=flask_of_the_countless_armies
actions.precombat+=/food,type=azshari_salad
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/greater_blessing_of_might
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=old_war
actions=auto_attack
actions+=/rebuke
actions+=/potion,name=old_war,if=(buff.bloodlust.react|buff.avenging_wrath.up|buff.crusade.up|target.time_to_die<=40)
actions+=/holy_wrath
actions+=/avenging_wrath
actions+=/shield_of_vengeance
actions+=/crusade,if=holy_power>=5
actions+=/wake_of_ashes,if=holy_power>=0&time<2
actions+=/execution_sentence,if=spell_targets.divine_storm<=3&(cooldown.judgment.remains<gcd*4.5|debuff.judgment.remains>gcd*4.67)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent,if=holy_power<5
actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2
actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=5&buff.divine_purpose.react
actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=5&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
actions+=/justicars_vengeance,if=debuff.judgment.up&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2&!equipped.whisper_of_the_nathrezim
actions+=/justicars_vengeance,if=debuff.judgment.up&holy_power>=5&buff.divine_purpose.react&!equipped.whisper_of_the_nathrezim
actions+=/templars_verdict,if=debuff.judgment.up&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2
actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=5&buff.divine_purpose.react
actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=5&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
actions+=/divine_storm,if=debuff.judgment.up&holy_power>=3&spell_targets.divine_storm>=2&(cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
actions+=/justicars_vengeance,if=debuff.judgment.up&holy_power>=3&buff.divine_purpose.up&cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled&!equipped.whisper_of_the_nathrezim
actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
actions+=/wake_of_ashes,if=holy_power=0|holy_power=1&(cooldown.blade_of_justice.remains>gcd|cooldown.divine_hammer.remains>gcd)|holy_power=2&(cooldown.zeal.charges_fractional<=0.65|cooldown.crusader_strike.charges_fractional<=0.65)
actions+=/zeal,if=charges=2&holy_power<=4
actions+=/crusader_strike,if=charges=2&holy_power<=4
actions+=/blade_of_justice,if=holy_power<=2|(holy_power<=3&(cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34))
actions+=/divine_hammer,if=holy_power<=2|(holy_power<=3&(cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34))
actions+=/judgment,if=holy_power>=3|((cooldown.zeal.charges_fractional<=1.67|cooldown.crusader_strike.charges_fractional<=1.67)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd))|(talent.greater_judgment.enabled&target.health.pct>50)
actions+=/consecration
actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.divine_purpose.react
actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.the_fires_of_justice.react&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&(holy_power>=4|((cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd)))&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
actions+=/justicars_vengeance,if=debuff.judgment.up&buff.divine_purpose.react&!equipped.whisper_of_the_nathrezim
actions+=/templars_verdict,if=debuff.judgment.up&buff.divine_purpose.react
actions+=/templars_verdict,if=debuff.judgment.up&buff.the_fires_of_justice.react&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)
actions+=/templars_verdict,if=debuff.judgment.up&(holy_power>=4|((cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd)))&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)
actions+=/zeal,if=holy_power<=4
actions+=/crusader_strike,if=holy_power<=4
actions+=/divine_storm,if=debuff.judgment.up&holy_power>=3&spell_targets.divine_storm>=2&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*5)
actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*5)
]]

-- keywords: legion-dev::paladin::retribution
---- avenging_wrath.spell_remains
---- blade_of_justice.cooldown_remains
---- bloodlust.spell_remains
---- crusade.cooldown_remains
---- crusade.spell_remains
---- crusade.talent_enabled
---- crusader_strike.cooldown_charges_fractional
---- crusader_strike.spell_charges
---- divine_hammer.cooldown_remains
---- divine_purpose.spell_remains
---- equipped.whisper_of_the_nathrezim
---- gcd
---- greater_judgment.talent_enabled
---- health.target_percent
---- holy_power
---- judgment.cooldown_remains
---- judgment.spell_remains
---- spell_targets
---- target.time_to_die
---- the_fires_of_justice.spell_remains
---- time
---- wake_of_ashes.artifact_enabled
---- wake_of_ashes.cooldown_remains
---- whisper_of_the_nathrezim.spell_remains
---- zeal.cooldown_charges_fractional
---- zeal.spell_charges

internal.actions['legion-dev::paladin::retribution'] = {
    default = {
        {
            action = 'potion',
            condition = '(buff.bloodlust.react|buff.avenging_wrath.up|buff.crusade.up|target.time_to_die<=40)',
            condition_converted = '((((bloodlust.spell_remains_as_number > 0)) or ((((avenging_wrath.spell_remains_as_number > 0)) or ((((crusade.spell_remains_as_number > 0)) or (((target.time_to_die_as_number) <= (40)))))))))',
            condition_keywords = {
                'avenging_wrath.spell_remains',
                'bloodlust.spell_remains',
                'crusade.spell_remains',
                'target.time_to_die',
            },
            name = 'old_war',
            simc_line = 'actions+=/potion,name=old_war,if=(buff.bloodlust.react|buff.avenging_wrath.up|buff.crusade.up|target.time_to_die<=40)',
        },
        {
            action = 'crusade',
            condition = 'holy_power>=5',
            condition_converted = '((holy_power_as_number) >= (5))',
            condition_keywords = {
                'holy_power',
            },
            simc_line = 'actions+=/crusade,if=holy_power>=5',
        },
        {
            action = 'wake_of_ashes',
            condition = 'holy_power>=0&time<2',
            condition_converted = '((((holy_power_as_number) >= (0))) and (((time_as_number) < (2))))',
            condition_keywords = {
                'holy_power',
                'time',
            },
            simc_line = 'actions+=/wake_of_ashes,if=holy_power>=0&time<2',
        },
        {
            action = 'execution_sentence',
            condition = 'spell_targets.divine_storm<=3&(cooldown.judgment.remains<gcd*4.5|debuff.judgment.remains>gcd*4.67)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)',
            condition_converted = '((((spell_targets_as_number) <= (3))) and ((((((((judgment.cooldown_remains_as_number) < ((gcd_as_number * 4.5)))) or (((judgment.spell_remains_as_number) > ((gcd_as_number * 4.67))))))) and (((((not crusade.talent_enabled)) or (((crusade.cooldown_remains_as_number) > ((gcd_as_number * 2))))))))))',
            condition_keywords = {
                'crusade.cooldown_remains',
                'crusade.talent_enabled',
                'gcd',
                'judgment.cooldown_remains',
                'judgment.spell_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/execution_sentence,if=spell_targets.divine_storm<=3&(cooldown.judgment.remains<gcd*4.5|debuff.judgment.remains>gcd*4.67)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*2)',
        },
        {
            action = 'arcane_torrent',
            condition = 'holy_power<5',
            condition_converted = '((holy_power_as_number) < (5))',
            condition_keywords = {
                'holy_power',
            },
            simc_line = 'actions+=/arcane_torrent,if=holy_power<5',
        },
        {
            action = 'divine_storm',
            condition = 'debuff.judgment.up&spell_targets.divine_storm>=2&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((spell_targets_as_number) >= (2))) and ((((divine_purpose.spell_remains_as_number > 0)) and (((divine_purpose.spell_remains_as_number) < ((gcd_as_number * 2)))))))))',
            condition_keywords = {
                'divine_purpose.spell_remains',
                'gcd',
                'judgment.spell_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2',
        },
        {
            action = 'divine_storm',
            condition = 'debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=5&buff.divine_purpose.react',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((spell_targets_as_number) >= (2))) and (((((holy_power_as_number) >= (5))) and ((divine_purpose.spell_remains_as_number > 0)))))))',
            condition_keywords = {
                'divine_purpose.spell_remains',
                'holy_power',
                'judgment.spell_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=5&buff.divine_purpose.react',
        },
        {
            action = 'divine_storm',
            condition = 'debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=5&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((spell_targets_as_number) >= (2))) and (((((holy_power_as_number) >= (5))) and (((((not crusade.talent_enabled)) or (((crusade.cooldown_remains_as_number) > ((gcd_as_number * 3))))))))))))',
            condition_keywords = {
                'crusade.cooldown_remains',
                'crusade.talent_enabled',
                'gcd',
                'holy_power',
                'judgment.spell_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&holy_power>=5&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)',
        },
        {
            action = 'justicars_vengeance',
            condition = 'debuff.judgment.up&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2&!equipped.whisper_of_the_nathrezim',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and ((((divine_purpose.spell_remains_as_number > 0)) and (((((divine_purpose.spell_remains_as_number) < ((gcd_as_number * 2)))) and ((not (equipped.whisper_of_the_nathrezim))))))))',
            condition_keywords = {
                'divine_purpose.spell_remains',
                'equipped.whisper_of_the_nathrezim',
                'gcd',
                'judgment.spell_remains',
            },
            simc_line = 'actions+=/justicars_vengeance,if=debuff.judgment.up&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2&!equipped.whisper_of_the_nathrezim',
        },
        {
            action = 'justicars_vengeance',
            condition = 'debuff.judgment.up&holy_power>=5&buff.divine_purpose.react&!equipped.whisper_of_the_nathrezim',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((holy_power_as_number) >= (5))) and ((((divine_purpose.spell_remains_as_number > 0)) and ((not (equipped.whisper_of_the_nathrezim))))))))',
            condition_keywords = {
                'divine_purpose.spell_remains',
                'equipped.whisper_of_the_nathrezim',
                'holy_power',
                'judgment.spell_remains',
            },
            simc_line = 'actions+=/justicars_vengeance,if=debuff.judgment.up&holy_power>=5&buff.divine_purpose.react&!equipped.whisper_of_the_nathrezim',
        },
        {
            action = 'templars_verdict',
            condition = 'debuff.judgment.up&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and ((((divine_purpose.spell_remains_as_number > 0)) and (((divine_purpose.spell_remains_as_number) < ((gcd_as_number * 2)))))))',
            condition_keywords = {
                'divine_purpose.spell_remains',
                'gcd',
                'judgment.spell_remains',
            },
            simc_line = 'actions+=/templars_verdict,if=debuff.judgment.up&buff.divine_purpose.up&buff.divine_purpose.remains<gcd*2',
        },
        {
            action = 'templars_verdict',
            condition = 'debuff.judgment.up&holy_power>=5&buff.divine_purpose.react',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((holy_power_as_number) >= (5))) and ((divine_purpose.spell_remains_as_number > 0)))))',
            condition_keywords = {
                'divine_purpose.spell_remains',
                'holy_power',
                'judgment.spell_remains',
            },
            simc_line = 'actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=5&buff.divine_purpose.react',
        },
        {
            action = 'templars_verdict',
            condition = 'debuff.judgment.up&holy_power>=5&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((holy_power_as_number) >= (5))) and (((((not crusade.talent_enabled)) or (((crusade.cooldown_remains_as_number) > ((gcd_as_number * 3))))))))))',
            condition_keywords = {
                'crusade.cooldown_remains',
                'crusade.talent_enabled',
                'gcd',
                'holy_power',
                'judgment.spell_remains',
            },
            simc_line = 'actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=5&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)',
        },
        {
            action = 'divine_storm',
            condition = 'debuff.judgment.up&holy_power>=3&spell_targets.divine_storm>=2&(cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((holy_power_as_number) >= (3))) and (((((spell_targets_as_number) >= (2))) and ((((((((((wake_of_ashes.cooldown_remains_as_number) < ((gcd_as_number * 2)))) and (wake_of_ashes.artifact_enabled))) or ((((whisper_of_the_nathrezim.spell_remains_as_number > 0)) and (((whisper_of_the_nathrezim.spell_remains_as_number) < (gcd_as_number)))))))) and (((((not crusade.talent_enabled)) or (((crusade.cooldown_remains_as_number) > ((gcd_as_number * 4))))))))))))))',
            condition_keywords = {
                'crusade.cooldown_remains',
                'crusade.talent_enabled',
                'gcd',
                'holy_power',
                'judgment.spell_remains',
                'spell_targets',
                'wake_of_ashes.artifact_enabled',
                'wake_of_ashes.cooldown_remains',
                'whisper_of_the_nathrezim.spell_remains',
            },
            simc_line = 'actions+=/divine_storm,if=debuff.judgment.up&holy_power>=3&spell_targets.divine_storm>=2&(cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)',
        },
        {
            action = 'justicars_vengeance',
            condition = 'debuff.judgment.up&holy_power>=3&buff.divine_purpose.up&cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled&!equipped.whisper_of_the_nathrezim',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((holy_power_as_number) >= (3))) and ((((divine_purpose.spell_remains_as_number > 0)) and (((((wake_of_ashes.cooldown_remains_as_number) < ((gcd_as_number * 2)))) and (((wake_of_ashes.artifact_enabled) and ((not (equipped.whisper_of_the_nathrezim))))))))))))',
            condition_keywords = {
                'divine_purpose.spell_remains',
                'equipped.whisper_of_the_nathrezim',
                'gcd',
                'holy_power',
                'judgment.spell_remains',
                'wake_of_ashes.artifact_enabled',
                'wake_of_ashes.cooldown_remains',
            },
            simc_line = 'actions+=/justicars_vengeance,if=debuff.judgment.up&holy_power>=3&buff.divine_purpose.up&cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled&!equipped.whisper_of_the_nathrezim',
        },
        {
            action = 'templars_verdict',
            condition = 'debuff.judgment.up&holy_power>=3&(cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((holy_power_as_number) >= (3))) and ((((((((((wake_of_ashes.cooldown_remains_as_number) < ((gcd_as_number * 2)))) and (wake_of_ashes.artifact_enabled))) or ((((whisper_of_the_nathrezim.spell_remains_as_number > 0)) and (((whisper_of_the_nathrezim.spell_remains_as_number) < (gcd_as_number)))))))) and (((((not crusade.talent_enabled)) or (((crusade.cooldown_remains_as_number) > ((gcd_as_number * 4))))))))))))',
            condition_keywords = {
                'crusade.cooldown_remains',
                'crusade.talent_enabled',
                'gcd',
                'holy_power',
                'judgment.spell_remains',
                'wake_of_ashes.artifact_enabled',
                'wake_of_ashes.cooldown_remains',
                'whisper_of_the_nathrezim.spell_remains',
            },
            simc_line = 'actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(cooldown.wake_of_ashes.remains<gcd*2&artifact.wake_of_ashes.enabled|buff.whisper_of_the_nathrezim.up&buff.whisper_of_the_nathrezim.remains<gcd)&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)',
        },
        {
            action = 'wake_of_ashes',
            condition = 'holy_power=0|holy_power=1&(cooldown.blade_of_justice.remains>gcd|cooldown.divine_hammer.remains>gcd)|holy_power=2&(cooldown.zeal.charges_fractional<=0.65|cooldown.crusader_strike.charges_fractional<=0.65)',
            condition_converted = '((((holy_power) == (0))) or (((((((holy_power) == (1))) and ((((((blade_of_justice.cooldown_remains_as_number) > (gcd_as_number))) or (((divine_hammer.cooldown_remains_as_number) > (gcd_as_number)))))))) or (((((holy_power) == (2))) and ((((((zeal.cooldown_charges_fractional_as_number) <= (0.65))) or (((crusader_strike.cooldown_charges_fractional_as_number) <= (0.65)))))))))))',
            condition_keywords = {
                'blade_of_justice.cooldown_remains',
                'crusader_strike.cooldown_charges_fractional',
                'divine_hammer.cooldown_remains',
                'gcd',
                'holy_power',
                'zeal.cooldown_charges_fractional',
            },
            simc_line = 'actions+=/wake_of_ashes,if=holy_power=0|holy_power=1&(cooldown.blade_of_justice.remains>gcd|cooldown.divine_hammer.remains>gcd)|holy_power=2&(cooldown.zeal.charges_fractional<=0.65|cooldown.crusader_strike.charges_fractional<=0.65)',
        },
        {
            action = 'zeal',
            condition = 'charges=2&holy_power<=4',
            condition_converted = '((((zeal.spell_charges) == (2))) and (((holy_power_as_number) <= (4))))',
            condition_keywords = {
                'holy_power',
                'zeal.spell_charges',
            },
            simc_line = 'actions+=/zeal,if=charges=2&holy_power<=4',
        },
        {
            action = 'crusader_strike',
            condition = 'charges=2&holy_power<=4',
            condition_converted = '((((crusader_strike.spell_charges) == (2))) and (((holy_power_as_number) <= (4))))',
            condition_keywords = {
                'crusader_strike.spell_charges',
                'holy_power',
            },
            simc_line = 'actions+=/crusader_strike,if=charges=2&holy_power<=4',
        },
        {
            action = 'blade_of_justice',
            condition = 'holy_power<=2|(holy_power<=3&(cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34))',
            condition_converted = '((((holy_power_as_number) <= (2))) or ((((((holy_power_as_number) <= (3))) and ((((((zeal.cooldown_charges_fractional_as_number) <= (1.34))) or (((crusader_strike.cooldown_charges_fractional_as_number) <= (1.34))))))))))',
            condition_keywords = {
                'crusader_strike.cooldown_charges_fractional',
                'holy_power',
                'zeal.cooldown_charges_fractional',
            },
            simc_line = 'actions+=/blade_of_justice,if=holy_power<=2|(holy_power<=3&(cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34))',
        },
        {
            action = 'divine_hammer',
            condition = 'holy_power<=2|(holy_power<=3&(cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34))',
            condition_converted = '((((holy_power_as_number) <= (2))) or ((((((holy_power_as_number) <= (3))) and ((((((zeal.cooldown_charges_fractional_as_number) <= (1.34))) or (((crusader_strike.cooldown_charges_fractional_as_number) <= (1.34))))))))))',
            condition_keywords = {
                'crusader_strike.cooldown_charges_fractional',
                'holy_power',
                'zeal.cooldown_charges_fractional',
            },
            simc_line = 'actions+=/divine_hammer,if=holy_power<=2|(holy_power<=3&(cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34))',
        },
        {
            action = 'judgment',
            condition = 'holy_power>=3|((cooldown.zeal.charges_fractional<=1.67|cooldown.crusader_strike.charges_fractional<=1.67)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd))|(talent.greater_judgment.enabled&target.health.pct>50)',
            condition_converted = '((((holy_power_as_number) >= (3))) or (((((((((((zeal.cooldown_charges_fractional_as_number) <= (1.67))) or (((crusader_strike.cooldown_charges_fractional_as_number) <= (1.67)))))) and ((((((divine_hammer.cooldown_remains_as_number) > (gcd_as_number))) or (((blade_of_justice.cooldown_remains_as_number) > (gcd_as_number))))))))) or ((((greater_judgment.talent_enabled) and (((health.target_percent_as_number) > (50)))))))))',
            condition_keywords = {
                'blade_of_justice.cooldown_remains',
                'crusader_strike.cooldown_charges_fractional',
                'divine_hammer.cooldown_remains',
                'gcd',
                'greater_judgment.talent_enabled',
                'health.target_percent',
                'holy_power',
                'zeal.cooldown_charges_fractional',
            },
            simc_line = 'actions+=/judgment,if=holy_power>=3|((cooldown.zeal.charges_fractional<=1.67|cooldown.crusader_strike.charges_fractional<=1.67)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd))|(talent.greater_judgment.enabled&target.health.pct>50)',
        },
        {
            action = 'divine_storm',
            condition = 'debuff.judgment.up&spell_targets.divine_storm>=2&buff.divine_purpose.react',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((spell_targets_as_number) >= (2))) and ((divine_purpose.spell_remains_as_number > 0)))))',
            condition_keywords = {
                'divine_purpose.spell_remains',
                'judgment.spell_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.divine_purpose.react',
        },
        {
            action = 'divine_storm',
            condition = 'debuff.judgment.up&spell_targets.divine_storm>=2&buff.the_fires_of_justice.react&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((spell_targets_as_number) >= (2))) and ((((the_fires_of_justice.spell_remains_as_number > 0)) and (((((not crusade.talent_enabled)) or (((crusade.cooldown_remains_as_number) > ((gcd_as_number * 3))))))))))))',
            condition_keywords = {
                'crusade.cooldown_remains',
                'crusade.talent_enabled',
                'gcd',
                'judgment.spell_remains',
                'spell_targets',
                'the_fires_of_justice.spell_remains',
            },
            simc_line = 'actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&buff.the_fires_of_justice.react&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)',
        },
        {
            action = 'divine_storm',
            condition = 'debuff.judgment.up&spell_targets.divine_storm>=2&(holy_power>=4|((cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd)))&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((spell_targets_as_number) >= (2))) and ((((((((holy_power_as_number) >= (4))) or (((((((((zeal.cooldown_charges_fractional_as_number) <= (1.34))) or (((crusader_strike.cooldown_charges_fractional_as_number) <= (1.34)))))) and ((((((divine_hammer.cooldown_remains_as_number) > (gcd_as_number))) or (((blade_of_justice.cooldown_remains_as_number) > (gcd_as_number)))))))))))) and (((((not crusade.talent_enabled)) or (((crusade.cooldown_remains_as_number) > ((gcd_as_number * 4))))))))))))',
            condition_keywords = {
                'blade_of_justice.cooldown_remains',
                'crusade.cooldown_remains',
                'crusade.talent_enabled',
                'crusader_strike.cooldown_charges_fractional',
                'divine_hammer.cooldown_remains',
                'gcd',
                'holy_power',
                'judgment.spell_remains',
                'spell_targets',
                'zeal.cooldown_charges_fractional',
            },
            simc_line = 'actions+=/divine_storm,if=debuff.judgment.up&spell_targets.divine_storm>=2&(holy_power>=4|((cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd)))&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)',
        },
        {
            action = 'justicars_vengeance',
            condition = 'debuff.judgment.up&buff.divine_purpose.react&!equipped.whisper_of_the_nathrezim',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and ((((divine_purpose.spell_remains_as_number > 0)) and ((not (equipped.whisper_of_the_nathrezim))))))',
            condition_keywords = {
                'divine_purpose.spell_remains',
                'equipped.whisper_of_the_nathrezim',
                'judgment.spell_remains',
            },
            simc_line = 'actions+=/justicars_vengeance,if=debuff.judgment.up&buff.divine_purpose.react&!equipped.whisper_of_the_nathrezim',
        },
        {
            action = 'templars_verdict',
            condition = 'debuff.judgment.up&buff.divine_purpose.react',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and ((divine_purpose.spell_remains_as_number > 0)))',
            condition_keywords = {
                'divine_purpose.spell_remains',
                'judgment.spell_remains',
            },
            simc_line = 'actions+=/templars_verdict,if=debuff.judgment.up&buff.divine_purpose.react',
        },
        {
            action = 'templars_verdict',
            condition = 'debuff.judgment.up&buff.the_fires_of_justice.react&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and ((((the_fires_of_justice.spell_remains_as_number > 0)) and (((((not crusade.talent_enabled)) or (((crusade.cooldown_remains_as_number) > ((gcd_as_number * 3))))))))))',
            condition_keywords = {
                'crusade.cooldown_remains',
                'crusade.talent_enabled',
                'gcd',
                'judgment.spell_remains',
                'the_fires_of_justice.spell_remains',
            },
            simc_line = 'actions+=/templars_verdict,if=debuff.judgment.up&buff.the_fires_of_justice.react&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*3)',
        },
        {
            action = 'templars_verdict',
            condition = 'debuff.judgment.up&(holy_power>=4|((cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd)))&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and ((((((((holy_power_as_number) >= (4))) or (((((((((zeal.cooldown_charges_fractional_as_number) <= (1.34))) or (((crusader_strike.cooldown_charges_fractional_as_number) <= (1.34)))))) and ((((((divine_hammer.cooldown_remains_as_number) > (gcd_as_number))) or (((blade_of_justice.cooldown_remains_as_number) > (gcd_as_number)))))))))))) and (((((not crusade.talent_enabled)) or (((crusade.cooldown_remains_as_number) > ((gcd_as_number * 4))))))))))',
            condition_keywords = {
                'blade_of_justice.cooldown_remains',
                'crusade.cooldown_remains',
                'crusade.talent_enabled',
                'crusader_strike.cooldown_charges_fractional',
                'divine_hammer.cooldown_remains',
                'gcd',
                'holy_power',
                'judgment.spell_remains',
                'zeal.cooldown_charges_fractional',
            },
            simc_line = 'actions+=/templars_verdict,if=debuff.judgment.up&(holy_power>=4|((cooldown.zeal.charges_fractional<=1.34|cooldown.crusader_strike.charges_fractional<=1.34)&(cooldown.divine_hammer.remains>gcd|cooldown.blade_of_justice.remains>gcd)))&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*4)',
        },
        {
            action = 'zeal',
            condition = 'holy_power<=4',
            condition_converted = '((holy_power_as_number) <= (4))',
            condition_keywords = {
                'holy_power',
            },
            simc_line = 'actions+=/zeal,if=holy_power<=4',
        },
        {
            action = 'crusader_strike',
            condition = 'holy_power<=4',
            condition_converted = '((holy_power_as_number) <= (4))',
            condition_keywords = {
                'holy_power',
            },
            simc_line = 'actions+=/crusader_strike,if=holy_power<=4',
        },
        {
            action = 'divine_storm',
            condition = 'debuff.judgment.up&holy_power>=3&spell_targets.divine_storm>=2&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*5)',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((holy_power_as_number) >= (3))) and (((((spell_targets_as_number) >= (2))) and (((((not crusade.talent_enabled)) or (((crusade.cooldown_remains_as_number) > ((gcd_as_number * 5))))))))))))',
            condition_keywords = {
                'crusade.cooldown_remains',
                'crusade.talent_enabled',
                'gcd',
                'holy_power',
                'judgment.spell_remains',
                'spell_targets',
            },
            simc_line = 'actions+=/divine_storm,if=debuff.judgment.up&holy_power>=3&spell_targets.divine_storm>=2&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*5)',
        },
        {
            action = 'templars_verdict',
            condition = 'debuff.judgment.up&holy_power>=3&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*5)',
            condition_converted = '(((judgment.spell_remains_as_number > 0)) and (((((holy_power_as_number) >= (3))) and (((((not crusade.talent_enabled)) or (((crusade.cooldown_remains_as_number) > ((gcd_as_number * 5))))))))))',
            condition_keywords = {
                'crusade.cooldown_remains',
                'crusade.talent_enabled',
                'gcd',
                'holy_power',
                'judgment.spell_remains',
            },
            simc_line = 'actions+=/templars_verdict,if=debuff.judgment.up&holy_power>=3&(!talent.crusade.enabled|cooldown.crusade.remains>gcd*5)',
        },
    },
    precombat = {
        {
            action = 'flask',
            simc_line = 'actions.precombat=flask,type=flask_of_the_countless_armies',
            type = 'flask_of_the_countless_armies',
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
            name = 'old_war',
            simc_line = 'actions.precombat+=/potion,name=old_war',
        },
    },
}


