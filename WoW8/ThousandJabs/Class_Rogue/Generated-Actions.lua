if GetBuildInfo and (select(4, GetBuildInfo()) < 80000 or select(4, GetBuildInfo()) >= 90000) then return end

if select(3, UnitClass('player')) ~= 4 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')

TJ:RegisterActionProfileList('simc::rogue::assassination', 'Simulationcraft Rogue Profile: Assassination', 4, 1, [[
actions.precombat=flask
actions.precombat+=/augmentation
actions.precombat+=/food
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/marked_for_death,precombat_seconds=5,if=raid_event.adds.in>15
actions.precombat+=/apply_poison
actions.precombat+=/stealth
actions.precombat+=/use_item,name=azsharas_font_of_power
actions.precombat+=/guardian_of_azeroth,if=talent.exsanguinate.enabled
actions=stealth
actions+=/variable,name=energy_regen_combined,value=energy.regen+poisoned_bleeds*7%(2*spell_haste)
actions+=/variable,name=single_target,value=spell_targets.fan_of_knives<2
actions+=/call_action_list,name=stealthed,if=stealthed.rogue
actions+=/call_action_list,name=cds,if=(!talent.master_assassin.enabled|dot.garrote.ticking)
actions+=/call_action_list,name=dot
actions+=/call_action_list,name=direct
actions+=/arcane_torrent,if=energy.deficit>=15+variable.energy_regen_combined
actions+=/arcane_pulse
actions+=/lights_judgment
actions+=/bag_of_tricks
actions.cds=use_item,name=azsharas_font_of_power,if=!stealthed.all&master_assassin_remains=0&(cooldown.vendetta.remains<?(cooldown.toxic_blade.remains*equipped.ashvanes_razor_coral))<10+10*equipped.ashvanes_razor_coral&!debuff.vendetta.up&!debuff.toxic_blade.up
actions.cds+=/call_action_list,name=essences,if=!stealthed.all&dot.rupture.ticking&master_assassin_remains=0
actions.cds+=/marked_for_death,target_if=min:target.time_to_die,if=raid_event.adds.up&(target.time_to_die<combo_points.deficit*1.5|combo_points.deficit>=cp_max_spend)
actions.cds+=/marked_for_death,if=raid_event.adds.in>30-raid_event.adds.duration&combo_points.deficit>=cp_max_spend
actions.cds+=/variable,name=vendetta_subterfuge_condition,value=!talent.subterfuge.enabled|!azerite.shrouded_suffocation.enabled|dot.garrote.pmultiplier>1&(spell_targets.fan_of_knives<6|!cooldown.vanish.up)
actions.cds+=/variable,name=vendetta_nightstalker_condition,value=!talent.nightstalker.enabled|!talent.exsanguinate.enabled|cooldown.exsanguinate.remains<5-2*talent.deeper_stratagem.enabled
actions.cds+=/variable,name=variable,name=vendetta_font_condition,value=!equipped.azsharas_font_of_power|azerite.shrouded_suffocation.enabled|debuff.razor_coral_debuff.down|trinket.ashvanes_razor_coral.cooldown.remains<10&(cooldown.toxic_blade.remains<1|debuff.toxic_blade.up)
actions.cds+=/vendetta,if=!stealthed.rogue&dot.rupture.ticking&!debuff.vendetta.up&variable.vendetta_subterfuge_condition&variable.vendetta_nightstalker_condition&variable.vendetta_font_condition
actions.cds+=/vanish,if=talent.exsanguinate.enabled&talent.nightstalker.enabled&combo_points>=cp_max_spend&cooldown.exsanguinate.remains<1
actions.cds+=/vanish,if=talent.nightstalker.enabled&!talent.exsanguinate.enabled&combo_points>=cp_max_spend&(debuff.vendetta.up|essence.vision_of_perfection.enabled)
actions.cds+=/variable,name=ss_vanish_condition,value=azerite.shrouded_suffocation.enabled&(non_ss_buffed_targets>=1|spell_targets.fan_of_knives=3)&(ss_buffed_targets_above_pandemic=0|spell_targets.fan_of_knives>=6)
actions.cds+=/pool_resource,for_next=1,extra_amount=45
actions.cds+=/vanish,if=talent.subterfuge.enabled&!stealthed.rogue&cooldown.garrote.up&(variable.ss_vanish_condition|!azerite.shrouded_suffocation.enabled&(dot.garrote.refreshable|debuff.vendetta.up&dot.garrote.pmultiplier<=1))&combo_points.deficit>=((1+2*azerite.shrouded_suffocation.enabled)*spell_targets.fan_of_knives)>?4&raid_event.adds.in>12
actions.cds+=/vanish,if=talent.master_assassin.enabled&!stealthed.all&master_assassin_remains<=0&!dot.rupture.refreshable&dot.garrote.remains>3&(debuff.vendetta.up&(!talent.toxic_blade.enabled|debuff.toxic_blade.up)&(!essence.blood_of_the_enemy.major|debuff.blood_of_the_enemy.up)|essence.vision_of_perfection.enabled)
actions.cds+=/shadowmeld,if=!stealthed.all&azerite.shrouded_suffocation.enabled&dot.garrote.refreshable&dot.garrote.pmultiplier<=1&combo_points.deficit>=1
actions.cds+=/exsanguinate,if=!stealthed.rogue&!dot.garrote.refreshable&dot.rupture.remains>4+4*cp_max_spend
actions.cds+=/toxic_blade,if=dot.rupture.ticking&(!equipped.azsharas_font_of_power|cooldown.vendetta.remains>10)
actions.cds+=/potion,if=buff.bloodlust.react|debuff.vendetta.up
actions.cds+=/blood_fury,if=debuff.vendetta.up
actions.cds+=/berserking,if=debuff.vendetta.up
actions.cds+=/fireblood,if=debuff.vendetta.up
actions.cds+=/ancestral_call,if=debuff.vendetta.up
actions.cds+=/use_item,name=galecallers_boon,if=(debuff.vendetta.up|(!talent.exsanguinate.enabled&cooldown.vendetta.remains>45|talent.exsanguinate.enabled&cooldown.exsanguinate.remains<6))&!exsanguinated.rupture
actions.cds+=/use_item,name=ashvanes_razor_coral,if=debuff.razor_coral_debuff.down|target.time_to_die<20
actions.cds+=/use_item,name=ashvanes_razor_coral,if=(!talent.exsanguinate.enabled|!talent.subterfuge.enabled)&debuff.vendetta.remains>10-4*equipped.azsharas_font_of_power
actions.cds+=/use_item,name=ashvanes_razor_coral,if=(talent.exsanguinate.enabled&talent.subterfuge.enabled)&debuff.vendetta.up&(exsanguinated.garrote|azerite.shrouded_suffocation.enabled&dot.garrote.pmultiplier>1)
actions.cds+=/use_item,effect_name=cyclotronic_blast,if=master_assassin_remains=0&!debuff.vendetta.up&!debuff.toxic_blade.up&buff.memory_of_lucid_dreams.down&energy<80&dot.rupture.remains>4
actions.cds+=/use_item,name=lurkers_insidious_gift,if=debuff.vendetta.up
actions.cds+=/use_item,name=lustrous_golden_plumage,if=debuff.vendetta.up
actions.cds+=/use_item,effect_name=gladiators_medallion,if=debuff.vendetta.up
actions.cds+=/use_item,effect_name=gladiators_badge,if=debuff.vendetta.up
actions.cds+=/use_items
actions.direct=envenom,if=combo_points>=4+talent.deeper_stratagem.enabled&(debuff.vendetta.up|debuff.toxic_blade.up|energy.deficit<=25+variable.energy_regen_combined|!variable.single_target)&(!talent.exsanguinate.enabled|cooldown.exsanguinate.remains>2)
actions.direct+=/variable,name=use_filler,value=combo_points.deficit>1|energy.deficit<=25+variable.energy_regen_combined|!variable.single_target
actions.direct+=/fan_of_knives,if=variable.use_filler&azerite.echoing_blades.enabled&spell_targets.fan_of_knives>=2+(debuff.vendetta.up*(1+(azerite.echoing_blades.rank=1)))
actions.direct+=/fan_of_knives,if=variable.use_filler&(buff.hidden_blades.stack>=19|(!priority_rotation&spell_targets.fan_of_knives>=4+(azerite.double_dose.rank>2)+stealthed.rogue))
actions.direct+=/fan_of_knives,target_if=!dot.deadly_poison_dot.ticking,if=variable.use_filler&spell_targets.fan_of_knives>=3
actions.direct+=/blindside,if=variable.use_filler&(buff.blindside.up|!talent.venom_rush.enabled&!azerite.double_dose.enabled)
actions.direct+=/mutilate,target_if=!dot.deadly_poison_dot.ticking,if=variable.use_filler&spell_targets.fan_of_knives=2
actions.direct+=/mutilate,if=variable.use_filler
actions.dot=variable,name=skip_cycle_garrote,value=priority_rotation&spell_targets.fan_of_knives>3&(dot.garrote.remains<cooldown.garrote.duration|poisoned_bleeds>5)
actions.dot+=/variable,name=skip_cycle_rupture,value=priority_rotation&spell_targets.fan_of_knives>3&(debuff.toxic_blade.up|(poisoned_bleeds>5&!azerite.scent_of_blood.enabled))
actions.dot+=/variable,name=skip_rupture,value=debuff.vendetta.up&(debuff.toxic_blade.up|master_assassin_remains>0)&dot.rupture.remains>2
actions.dot+=/rupture,if=talent.exsanguinate.enabled&((combo_points>=cp_max_spend&cooldown.exsanguinate.remains<1)|(!ticking&(time>10|combo_points>=2)))
actions.dot+=/pool_resource,for_next=1
actions.dot+=/garrote,if=(!talent.subterfuge.enabled|!(cooldown.vanish.up&cooldown.vendetta.remains<=4))&combo_points.deficit>=1+3*(azerite.shrouded_suffocation.enabled&cooldown.vanish.up)&refreshable&(pmultiplier<=1|remains<=tick_time&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&(!exsanguinated|remains<=tick_time*2&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&!ss_buffed&(target.time_to_die-remains)>4&(master_assassin_remains=0|!ticking&azerite.shrouded_suffocation.enabled)
actions.dot+=/pool_resource,for_next=1
actions.dot+=/garrote,cycle_targets=1,if=!variable.skip_cycle_garrote&target!=self.target&(!talent.subterfuge.enabled|!(cooldown.vanish.up&cooldown.vendetta.remains<=4))&combo_points.deficit>=1+3*(azerite.shrouded_suffocation.enabled&cooldown.vanish.up)&refreshable&(pmultiplier<=1|remains<=tick_time&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&(!exsanguinated|remains<=tick_time*2&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&!ss_buffed&(target.time_to_die-remains)>12&(master_assassin_remains=0|!ticking&azerite.shrouded_suffocation.enabled)
actions.dot+=/crimson_tempest,if=spell_targets>=2&remains<2+(spell_targets>=5)&combo_points>=4
actions.dot+=/rupture,if=!variable.skip_rupture&combo_points>=4&refreshable&(pmultiplier<=1|remains<=tick_time&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&(!exsanguinated|remains<=tick_time*2&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&target.time_to_die-remains>4
actions.dot+=/rupture,cycle_targets=1,if=!variable.skip_cycle_rupture&!variable.skip_rupture&target!=self.target&combo_points>=4&refreshable&(pmultiplier<=1|remains<=tick_time&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&(!exsanguinated|remains<=tick_time*2&spell_targets.fan_of_knives>=3+azerite.shrouded_suffocation.enabled)&target.time_to_die-remains>4
actions.essences=concentrated_flame,if=energy.time_to_max>1&!debuff.vendetta.up&(!dot.concentrated_flame_burn.ticking&!action.concentrated_flame.in_flight|full_recharge_time<gcd.max)
actions.essences+=/blood_of_the_enemy,if=debuff.vendetta.up&(exsanguinated.garrote|debuff.toxic_blade.up&combo_points.deficit<=1|debuff.vendetta.remains<=10)|target.time_to_die<=10
actions.essences+=/guardian_of_azeroth,if=cooldown.vendetta.remains<3|debuff.vendetta.up|target.time_to_die<30
actions.essences+=/guardian_of_azeroth,if=floor((target.time_to_die-30)%cooldown)>floor((target.time_to_die-30-cooldown.vendetta.remains)%cooldown)
actions.essences+=/focused_azerite_beam,if=spell_targets.fan_of_knives>=2|raid_event.adds.in>60&energy<70
actions.essences+=/purifying_blast,if=spell_targets.fan_of_knives>=2|raid_event.adds.in>60
actions.essences+=/the_unbound_force,if=buff.reckless_force.up|buff.reckless_force_counter.stack<10
actions.essences+=/ripple_in_space
actions.essences+=/worldvein_resonance
actions.essences+=/memory_of_lucid_dreams,if=energy<50&!cooldown.vendetta.up
actions.essences+=/cycling_variable,name=reaping_delay,op=min,if=essence.breath_of_the_dying.major,value=target.time_to_die
actions.essences+=/reaping_flames,target_if=target.time_to_die<1.5|((target.health.pct>80|target.health.pct<=20)&(active_enemies=1|variable.reaping_delay>29))|(target.time_to_pct_20>30&(active_enemies=1|variable.reaping_delay>44))
actions.stealthed=rupture,if=talent.nightstalker.enabled&combo_points>=4&target.time_to_die-remains>6
actions.stealthed+=/pool_resource,for_next=1
actions.stealthed+=/garrote,if=azerite.shrouded_suffocation.enabled&buff.subterfuge.up&buff.subterfuge.remains<1.3&!ss_buffed
actions.stealthed+=/pool_resource,for_next=1
actions.stealthed+=/garrote,target_if=min:remains,if=talent.subterfuge.enabled&(remains<12|pmultiplier<=1)&target.time_to_die-remains>2
actions.stealthed+=/rupture,if=talent.subterfuge.enabled&azerite.shrouded_suffocation.enabled&!dot.rupture.ticking&variable.single_target
actions.stealthed+=/pool_resource,for_next=1
actions.stealthed+=/garrote,target_if=min:remains,if=talent.subterfuge.enabled&azerite.shrouded_suffocation.enabled&(active_enemies>1|!talent.exsanguinate.enabled)&target.time_to_die>remains&(remains<18|!ss_buffed)
actions.stealthed+=/pool_resource,for_next=1
actions.stealthed+=/garrote,if=talent.subterfuge.enabled&talent.exsanguinate.enabled&active_enemies=1&buff.subterfuge.remains<1.3
]])

TJ:RegisterActionProfileList('simc::rogue::outlaw', 'Simulationcraft Rogue Profile: Outlaw', 4, 2, [[
actions.precombat=flask
actions.precombat+=/augmentation
actions.precombat+=/food
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/marked_for_death,precombat_seconds=5,if=raid_event.adds.in>40
actions.precombat+=/stealth,if=(!equipped.pocketsized_computation_device|!cooldown.cyclotronic_blast.duration|raid_event.invulnerable.exists)
actions.precombat+=/roll_the_bones,precombat_seconds=2
actions.precombat+=/slice_and_dice,precombat_seconds=2
actions.precombat+=/adrenaline_rush,precombat_seconds=1,if=(!equipped.pocketsized_computation_device|!cooldown.cyclotronic_blast.duration|raid_event.invulnerable.exists)
actions.precombat+=/use_item,name=azsharas_font_of_power
actions.precombat+=/use_item,effect_name=cyclotronic_blast,if=!raid_event.invulnerable.exists
actions=stealth
actions+=/variable,name=rtb_reroll,value=rtb_buffs<2&!buff.grand_melee.up&!buff.ruthless_precision.up
actions+=/variable,name=rtb_reroll,op=set,if=azerite.deadshot.enabled,value=rtb_buffs<2&(buff.loaded_dice.up|!buff.broadside.up)
actions+=/variable,name=rtb_reroll,op=set,if=azerite.ace_up_your_sleeve.enabled&azerite.ace_up_your_sleeve.rank>=azerite.deadshot.rank,value=rtb_buffs<2&(buff.loaded_dice.up|buff.ruthless_precision.remains<=cooldown.between_the_eyes.remains)
actions+=/variable,name=rtb_reroll,op=set,if=azerite.snake_eyes.rank>=2,value=rtb_buffs<2
actions+=/variable,name=rtb_reroll,op=reset,if=azerite.snake_eyes.rank>=2&buff.snake_eyes.stack>=2-buff.broadside.up
actions+=/variable,name=rtb_reroll,op=set,if=buff.blade_flurry.up,value=rtb_buffs-buff.skull_and_crossbones.up<2&(buff.loaded_dice.up|!buff.grand_melee.up&!buff.ruthless_precision.up&!buff.broadside.up)
actions+=/variable,name=rtb_reroll,op=set,if=buff.loaded_dice.up,value=(rtb_buffs-buff.buried_treasure.up)<2|buff.roll_the_bones.remains<10.8+(1.8*talent.deeper_stratagem.enabled)
actions+=/variable,name=ambush_condition,value=combo_points.deficit>=2+2*(talent.ghostly_strike.enabled&cooldown.ghostly_strike.remains<1)+buff.broadside.up&energy>60&!buff.skull_and_crossbones.up&!buff.keep_your_wits_about_you.up
actions+=/variable,name=bte_condition,value=buff.ruthless_precision.up|(azerite.deadshot.enabled|azerite.ace_up_your_sleeve.enabled)&buff.roll_the_bones.up
actions+=/variable,name=blade_flurry_sync,value=spell_targets.blade_flurry<2&raid_event.adds.in>20|buff.blade_flurry.up
actions+=/call_action_list,name=stealth,if=stealthed.all
actions+=/call_action_list,name=cds
actions+=/run_action_list,name=finish,if=combo_points>=cp_max_spend-(buff.broadside.up+buff.opportunity.up)*(talent.quick_draw.enabled&(!talent.marked_for_death.enabled|cooldown.marked_for_death.remains>1))*(azerite.ace_up_your_sleeve.rank<2|!cooldown.between_the_eyes.up|!buff.roll_the_bones.up)
actions+=/call_action_list,name=build
actions+=/arcane_torrent,if=energy.deficit>=15+energy.regen
actions+=/arcane_pulse
actions+=/lights_judgment
actions+=/bag_of_tricks
actions.build=pistol_shot,if=(talent.quick_draw.enabled|azerite.keep_your_wits_about_you.rank<2)&buff.opportunity.up&(buff.keep_your_wits_about_you.stack<14|energy<45)
actions.build+=/pistol_shot,if=buff.opportunity.up&buff.deadshot.up
actions.build+=/sinister_strike
actions.cds=call_action_list,name=essences,if=!stealthed.all
actions.cds+=/adrenaline_rush,if=!buff.adrenaline_rush.up&(!equipped.azsharas_font_of_power|cooldown.latent_arcana.remains>20)
actions.cds+=/marked_for_death,target_if=min:target.time_to_die,if=raid_event.adds.up&(target.time_to_die<combo_points.deficit|!stealthed.rogue&combo_points.deficit>=cp_max_spend-1)
actions.cds+=/marked_for_death,if=raid_event.adds.in>30-raid_event.adds.duration&!stealthed.rogue&combo_points.deficit>=cp_max_spend-1
actions.cds+=/blade_flurry,if=spell_targets>=2&!buff.blade_flurry.up&(!raid_event.adds.exists|raid_event.adds.remains>8|raid_event.adds.in>(2-cooldown.blade_flurry.charges_fractional)*25)
actions.cds+=/ghostly_strike,if=combo_points.deficit>=1+buff.broadside.up
actions.cds+=/killing_spree,if=variable.blade_flurry_sync&spell_targets.blade_flurry>1&energy.time_to_max>2
actions.cds+=/blade_rush,if=variable.blade_flurry_sync&energy.time_to_max>2
actions.cds+=/vanish,if=!stealthed.all&variable.ambush_condition
actions.cds+=/shadowmeld,if=!stealthed.all&variable.ambush_condition
actions.cds+=/potion,if=buff.bloodlust.react|buff.adrenaline_rush.up
actions.cds+=/blood_fury
actions.cds+=/berserking
actions.cds+=/fireblood
actions.cds+=/ancestral_call
actions.cds+=/use_item,effect_name=cyclotronic_blast,if=!stealthed.all&buff.adrenaline_rush.down&buff.memory_of_lucid_dreams.down&energy.time_to_max>4&rtb_buffs<5
actions.cds+=/use_item,name=azsharas_font_of_power,if=!buff.adrenaline_rush.up&!buff.blade_flurry.up&cooldown.adrenaline_rush.remains<15
actions.cds+=/use_item,name=ashvanes_razor_coral,if=debuff.razor_coral_debuff.down|debuff.conductive_ink_debuff.up&target.health.pct<32&target.health.pct>=30|!debuff.conductive_ink_debuff.up&(debuff.razor_coral_debuff.stack>=20-10*debuff.blood_of_the_enemy.up|target.time_to_die<60)&buff.adrenaline_rush.remains>18
actions.cds+=/use_items,if=buff.bloodlust.react|target.time_to_die<=20|combo_points.deficit<=2
actions.essences=concentrated_flame,if=energy.time_to_max>1&!buff.blade_flurry.up&(!dot.concentrated_flame_burn.ticking&!action.concentrated_flame.in_flight|full_recharge_time<gcd.max)
actions.essences+=/blood_of_the_enemy,if=variable.blade_flurry_sync&cooldown.between_the_eyes.up&variable.bte_condition&(spell_targets.blade_flurry>=2|raid_event.adds.in>45)
actions.essences+=/guardian_of_azeroth
actions.essences+=/focused_azerite_beam,if=spell_targets.blade_flurry>=2|raid_event.adds.in>60&!buff.adrenaline_rush.up
actions.essences+=/purifying_blast,if=spell_targets.blade_flurry>=2|raid_event.adds.in>60
actions.essences+=/the_unbound_force,if=buff.reckless_force.up|buff.reckless_force_counter.stack<10
actions.essences+=/ripple_in_space
actions.essences+=/worldvein_resonance
actions.essences+=/memory_of_lucid_dreams,if=energy<45
actions.essences+=/cycling_variable,name=reaping_delay,op=min,if=essence.breath_of_the_dying.major,value=target.time_to_die
actions.essences+=/reaping_flames,target_if=target.time_to_die<1.5|((target.health.pct>80|target.health.pct<=20)&(active_enemies=1|variable.reaping_delay>29))|(target.time_to_pct_20>30&(active_enemies=1|variable.reaping_delay>44))
actions.finish=between_the_eyes,if=variable.bte_condition
actions.finish+=/slice_and_dice,if=buff.slice_and_dice.remains<target.time_to_die&buff.slice_and_dice.remains<(1+combo_points)*1.8
actions.finish+=/roll_the_bones,if=buff.roll_the_bones.remains<=3|variable.rtb_reroll
actions.finish+=/between_the_eyes,if=azerite.ace_up_your_sleeve.enabled|azerite.deadshot.enabled
actions.finish+=/dispatch
actions.stealth=cheap_shot,target_if=min:debuff.prey_on_the_weak.remains,if=talent.prey_on_the_weak.enabled&!target.is_boss
actions.stealth+=/ambush
]])

TJ:RegisterActionProfileList('simc::rogue::subtlety', 'Simulationcraft Rogue Profile: Subtlety', 4, 3, [[
actions.precombat=flask
actions.precombat+=/augmentation
actions.precombat+=/food
actions.precombat+=/snapshot_stats
actions.precombat+=/stealth
actions.precombat+=/marked_for_death,precombat_seconds=15
actions.precombat+=/potion
actions.precombat+=/use_item,name=azsharas_font_of_power
actions=stealth
actions+=/call_action_list,name=cds
actions+=/run_action_list,name=stealthed,if=stealthed.all
actions+=/nightblade,if=target.time_to_die>6&remains<gcd.max&combo_points>=4-(time<10)*2
actions+=/variable,name=use_priority_rotation,value=priority_rotation&spell_targets.shuriken_storm>=2
actions+=/call_action_list,name=stealth_cds,if=variable.use_priority_rotation
actions+=/variable,name=stealth_threshold,value=25+talent.vigor.enabled*35+talent.master_of_shadows.enabled*25+talent.shadow_focus.enabled*20+talent.alacrity.enabled*10+15*(spell_targets.shuriken_storm>=3)
actions+=/call_action_list,name=stealth_cds,if=energy.deficit<=variable.stealth_threshold
actions+=/nightblade,if=azerite.nights_vengeance.enabled&!buff.nights_vengeance.up&combo_points.deficit>1&(spell_targets.shuriken_storm<2|variable.use_priority_rotation)&(cooldown.symbols_of_death.remains<=3|(azerite.nights_vengeance.rank>=2&buff.symbols_of_death.remains>3&!stealthed.all&cooldown.shadow_dance.charges_fractional>=0.9))
actions+=/call_action_list,name=finish,if=combo_points.deficit<=1|target.time_to_die<=1&combo_points>=3
actions+=/call_action_list,name=finish,if=spell_targets.shuriken_storm=4&combo_points>=4
actions+=/call_action_list,name=build,if=energy.deficit<=variable.stealth_threshold
actions+=/arcane_torrent,if=energy.deficit>=15+energy.regen
actions+=/arcane_pulse
actions+=/lights_judgment
actions+=/bag_of_tricks
actions.build=shuriken_storm,if=spell_targets>=2+(talent.gloomblade.enabled&azerite.perforate.rank>=2&position_back)
actions.build+=/gloomblade
actions.build+=/backstab
actions.cds=shadow_dance,use_off_gcd=1,if=!buff.shadow_dance.up&buff.shuriken_tornado.up&buff.shuriken_tornado.remains<=3.5
actions.cds+=/symbols_of_death,use_off_gcd=1,if=buff.shuriken_tornado.up&buff.shuriken_tornado.remains<=3.5
actions.cds+=/call_action_list,name=essences,if=!stealthed.all&dot.nightblade.ticking
actions.cds+=/pool_resource,for_next=1,if=!talent.shadow_focus.enabled
actions.cds+=/shuriken_tornado,if=energy>=60&dot.nightblade.ticking&cooldown.symbols_of_death.up&cooldown.shadow_dance.charges>=1
actions.cds+=/symbols_of_death,if=dot.nightblade.ticking&!cooldown.shadow_blades.up&(!talent.shuriken_tornado.enabled|talent.shadow_focus.enabled|cooldown.shuriken_tornado.remains>2)&(!essence.blood_of_the_enemy.major|cooldown.blood_of_the_enemy.remains>2)&(azerite.nights_vengeance.rank<2|buff.nights_vengeance.up)
actions.cds+=/marked_for_death,target_if=min:target.time_to_die,if=raid_event.adds.up&(target.time_to_die<combo_points.deficit|!stealthed.all&combo_points.deficit>=cp_max_spend)
actions.cds+=/marked_for_death,if=raid_event.adds.in>30-raid_event.adds.duration&!stealthed.all&combo_points.deficit>=cp_max_spend
actions.cds+=/shadow_blades,if=!stealthed.all&dot.nightblade.ticking&combo_points.deficit>=2
actions.cds+=/shuriken_tornado,if=talent.shadow_focus.enabled&dot.nightblade.ticking&buff.symbols_of_death.up
actions.cds+=/shadow_dance,if=!buff.shadow_dance.up&target.time_to_die<=5+talent.subterfuge.enabled&!raid_event.adds.up
actions.cds+=/potion,if=buff.bloodlust.react|buff.symbols_of_death.up&(buff.shadow_blades.up|cooldown.shadow_blades.remains<=10)
actions.cds+=/blood_fury,if=buff.symbols_of_death.up
actions.cds+=/berserking,if=buff.symbols_of_death.up
actions.cds+=/fireblood,if=buff.symbols_of_death.up
actions.cds+=/ancestral_call,if=buff.symbols_of_death.up
actions.cds+=/use_item,effect_name=cyclotronic_blast,if=!stealthed.all&dot.nightblade.ticking&!buff.symbols_of_death.up&energy.deficit>=30
actions.cds+=/use_item,name=azsharas_font_of_power,if=!buff.shadow_dance.up&cooldown.symbols_of_death.remains<10
actions.cds+=/use_item,name=ashvanes_razor_coral,if=debuff.razor_coral_debuff.down|debuff.conductive_ink_debuff.up&target.health.pct<32&target.health.pct>=30|!debuff.conductive_ink_debuff.up&(debuff.razor_coral_debuff.stack>=25-10*debuff.blood_of_the_enemy.up|target.time_to_die<40)&buff.symbols_of_death.remains>8
actions.cds+=/use_item,name=mydas_talisman
actions.cds+=/use_items,if=buff.symbols_of_death.up|target.time_to_die<20
actions.essences=concentrated_flame,if=energy.time_to_max>1&!buff.symbols_of_death.up&(!dot.concentrated_flame_burn.ticking&!action.concentrated_flame.in_flight|full_recharge_time<gcd.max)
actions.essences+=/blood_of_the_enemy,if=!cooldown.shadow_blades.up&cooldown.symbols_of_death.up|target.time_to_die<=10
actions.essences+=/guardian_of_azeroth
actions.essences+=/focused_azerite_beam,if=(spell_targets.shuriken_storm>=2|raid_event.adds.in>60)&!cooldown.symbols_of_death.up&!buff.symbols_of_death.up&energy.deficit>=30
actions.essences+=/purifying_blast,if=spell_targets.shuriken_storm>=2|raid_event.adds.in>60
actions.essences+=/the_unbound_force,if=buff.reckless_force.up|buff.reckless_force_counter.stack<10
actions.essences+=/ripple_in_space
actions.essences+=/worldvein_resonance,if=cooldown.symbols_of_death.remains<5|target.time_to_die<18
actions.essences+=/memory_of_lucid_dreams,if=energy<40&buff.symbols_of_death.up
actions.essences+=/cycling_variable,name=reaping_delay,op=min,if=essence.breath_of_the_dying.major,value=target.time_to_die
actions.essences+=/reaping_flames,target_if=target.time_to_die<1.5|((target.health.pct>80|target.health.pct<=20)&(active_enemies=1|variable.reaping_delay>29))|(target.time_to_pct_20>30&(active_enemies=1|variable.reaping_delay>44))
actions.finish=pool_resource,for_next=1
actions.finish+=/eviscerate,if=buff.nights_vengeance.up&(spell_targets.shuriken_storm<2|variable.use_priority_rotation|!talent.secret_technique.enabled|!cooldown.secret_technique.up)
actions.finish+=/nightblade,if=(!talent.dark_shadow.enabled|!buff.shadow_dance.up)&target.time_to_die-remains>6&remains<tick_time*2
actions.finish+=/nightblade,cycle_targets=1,if=!variable.use_priority_rotation&spell_targets.shuriken_storm>=2&(azerite.nights_vengeance.enabled|!azerite.replicating_shadows.enabled|spell_targets.shuriken_storm-active_dot.nightblade>=2)&!buff.shadow_dance.up&target.time_to_die>=(5+(2*combo_points))&refreshable
actions.finish+=/nightblade,if=remains<cooldown.symbols_of_death.remains+10&cooldown.symbols_of_death.remains<=5&target.time_to_die-remains>cooldown.symbols_of_death.remains+5
actions.finish+=/secret_technique
actions.finish+=/eviscerate
actions.stealth_cds=variable,name=shd_threshold,value=cooldown.shadow_dance.charges_fractional>=1.75
actions.stealth_cds+=/vanish,if=!variable.shd_threshold&combo_points.deficit>1&debuff.find_weakness.remains<1&cooldown.symbols_of_death.remains>=3
actions.stealth_cds+=/pool_resource,for_next=1,extra_amount=40
actions.stealth_cds+=/shadowmeld,if=energy>=40&energy.deficit>=10&!variable.shd_threshold&combo_points.deficit>1&debuff.find_weakness.remains<1
actions.stealth_cds+=/variable,name=shd_combo_points,value=combo_points.deficit>=4-(talent.deeper_stratagem.enabled&(azerite.the_first_dance.enabled&!talent.dark_shadow.enabled&!talent.subterfuge.enabled&spell_targets.shuriken_storm<3))
actions.stealth_cds+=/variable,name=shd_combo_points,value=combo_points.deficit<=1+2*azerite.the_first_dance.enabled,if=variable.use_priority_rotation&(talent.nightstalker.enabled|talent.dark_shadow.enabled)
actions.stealth_cds+=/shadow_dance,if=variable.shd_combo_points&(!talent.dark_shadow.enabled|dot.nightblade.remains>=5+talent.subterfuge.enabled)&(variable.shd_threshold|buff.symbols_of_death.remains>=1.2|spell_targets.shuriken_storm>=4&cooldown.symbols_of_death.remains>10)&(azerite.nights_vengeance.rank<2|buff.nights_vengeance.up)
actions.stealth_cds+=/shadow_dance,if=variable.shd_combo_points&target.time_to_die<cooldown.symbols_of_death.remains&!raid_event.adds.up
actions.stealthed=shadowstrike,if=(talent.find_weakness.enabled|spell_targets.shuriken_storm<3)&(buff.stealth.up|buff.vanish.up)
actions.stealthed+=/call_action_list,name=finish,if=buff.shuriken_tornado.up&combo_points.deficit<=2
actions.stealthed+=/call_action_list,name=finish,if=spell_targets.shuriken_storm=4&combo_points>=4
actions.stealthed+=/call_action_list,name=finish,if=combo_points.deficit<=1-(talent.deeper_stratagem.enabled&(buff.vanish.up|azerite.the_first_dance.enabled&!talent.dark_shadow.enabled&!talent.subterfuge.enabled&spell_targets.shuriken_storm<3))
actions.stealthed+=/gloomblade,if=azerite.perforate.rank>=2&spell_targets.shuriken_storm<=2&position_back
actions.stealthed+=/shadowstrike,cycle_targets=1,if=talent.secret_technique.enabled&talent.find_weakness.enabled&debuff.find_weakness.remains<1&spell_targets.shuriken_storm=2&target.time_to_die-remains>6
actions.stealthed+=/shadowstrike,if=!talent.deeper_stratagem.enabled&azerite.blade_in_the_shadows.rank=3&spell_targets.shuriken_storm=3
actions.stealthed+=/shadowstrike,if=variable.use_priority_rotation&(talent.find_weakness.enabled&debuff.find_weakness.remains<1|talent.weaponmaster.enabled&spell_targets.shuriken_storm<=4|azerite.inevitability.enabled&buff.symbols_of_death.up&spell_targets.shuriken_storm<=3+azerite.blade_in_the_shadows.enabled)
actions.stealthed+=/shuriken_storm,if=spell_targets>=3
actions.stealthed+=/shadowstrike
]])

