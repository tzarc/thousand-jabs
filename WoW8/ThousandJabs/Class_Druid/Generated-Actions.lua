if GetBuildInfo and (select(4, GetBuildInfo()) < 80000 or select(4, GetBuildInfo()) >= 90000) then return end

if select(3, UnitClass('player')) ~= 11 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')

TJ:RegisterActionProfileList('simc::druid::balance', 'Simulationcraft Druid Profile: Balance', 11, 1, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/variable,name=az_ss,value=azerite.streaking_stars.rank
actions.precombat+=/variable,name=az_ap,value=azerite.arcanic_pulsar.rank
actions.precombat+=/variable,name=sf_targets,value=4
actions.precombat+=/variable,name=sf_targets,op=add,value=1,if=azerite.arcanic_pulsar.enabled
actions.precombat+=/variable,name=sf_targets,op=add,value=1,if=talent.starlord.enabled
actions.precombat+=/variable,name=sf_targets,op=add,value=1,if=azerite.streaking_stars.rank>2&azerite.arcanic_pulsar.enabled
actions.precombat+=/variable,name=sf_targets,op=sub,value=1,if=!talent.twin_moons.enabled
actions.precombat+=/moonkin_form
actions.precombat+=/use_item,name=azsharas_font_of_power
actions.precombat+=/potion,dynamic_prepot=1
actions.precombat+=/solar_wrath
actions.precombat+=/solar_wrath
actions.precombat+=/starsurge
actions=potion,if=buff.celestial_alignment.remains>13|buff.incarnation.remains>16.5
actions+=/berserking,if=buff.ca_inc.up
actions+=/use_item,name=azsharas_font_of_power,if=!buff.ca_inc.up,target_if=dot.moonfire.ticking&dot.sunfire.ticking&(!talent.stellar_flare.enabled|dot.stellar_flare.ticking)
actions+=/guardian_of_azeroth,if=(!talent.starlord.enabled|buff.starlord.up)&!buff.ca_inc.up,target_if=dot.moonfire.ticking&dot.sunfire.ticking&(!talent.stellar_flare.enabled|dot.stellar_flare.ticking)
actions+=/use_item,effect_name=cyclotronic_blast,if=!buff.ca_inc.up,target_if=dot.moonfire.ticking&dot.sunfire.ticking&(!talent.stellar_flare.enabled|dot.stellar_flare.ticking)
actions+=/use_item,name=shiver_venom_relic,if=!buff.ca_inc.up&!buff.bloodlust.up,target_if=dot.shiver_venom.stack>=5
actions+=/blood_of_the_enemy,if=cooldown.ca_inc.remains>30
actions+=/memory_of_lucid_dreams,if=!buff.ca_inc.up&(astral_power<25|cooldown.ca_inc.remains>30),target_if=dot.sunfire.remains>10&dot.moonfire.remains>10&(!talent.stellar_flare.enabled|dot.stellar_flare.remains>10)
actions+=/purifying_blast
actions+=/ripple_in_space
actions+=/concentrated_flame,if=(!buff.ca_inc.up|stack=2)&!action.concentrated_flame_missile.in_flight,target_if=!dot.concentrated_flame_burn.ticking
actions+=/the_unbound_force,if=buff.reckless_force.up|buff.reckless_force_counter.stack<5,target_if=dot.moonfire.ticking&dot.sunfire.ticking&(!talent.stellar_flare.enabled|dot.stellar_flare.ticking)
actions+=/worldvein_resonance,if=!buff.ca_inc.up,target_if=dot.moonfire.ticking&dot.sunfire.ticking&(!talent.stellar_flare.enabled|dot.stellar_flare.ticking)
actions+=/reaping_flames,if=!buff.ca_inc.up
actions+=/focused_azerite_beam,if=(!variable.az_ss|!buff.ca_inc.up),target_if=dot.moonfire.ticking&dot.sunfire.ticking&(!talent.stellar_flare.enabled|dot.stellar_flare.ticking)
actions+=/thorns
actions+=/use_items,slots=trinket1,if=!trinket.1.has_proc.any|buff.ca_inc.up
actions+=/use_items,slots=trinket2,if=!trinket.2.has_proc.any|buff.ca_inc.up
actions+=/use_items
actions+=/warrior_of_elune
actions+=/innervate,if=azerite.lively_spirit.enabled&(cooldown.incarnation.remains<2|cooldown.celestial_alignment.remains<12)
actions+=/force_of_nature,if=(variable.az_ss&!buff.ca_inc.up|!variable.az_ss&(buff.ca_inc.up|cooldown.ca_inc.remains>30))&ap_check
actions+=/incarnation,if=!buff.ca_inc.up&(buff.memory_of_lucid_dreams.up|((cooldown.memory_of_lucid_dreams.remains>20|!essence.memory_of_lucid_dreams.major)&ap_check))&(buff.memory_of_lucid_dreams.up|ap_check),target_if=dot.sunfire.remains>8&dot.moonfire.remains>12&(dot.stellar_flare.remains>6|!talent.stellar_flare.enabled)
actions+=/celestial_alignment,if=!buff.ca_inc.up&(!talent.starlord.enabled|buff.starlord.up)&(buff.memory_of_lucid_dreams.up|((cooldown.memory_of_lucid_dreams.remains>20|!essence.memory_of_lucid_dreams.major)&ap_check))&(!azerite.lively_spirit.enabled|buff.lively_spirit.up),target_if=(dot.sunfire.remains>2&dot.moonfire.ticking&(dot.stellar_flare.ticking|!talent.stellar_flare.enabled))
actions+=/fury_of_elune,if=(buff.ca_inc.up|cooldown.ca_inc.remains>30)&solar_wrath.ap_check
actions+=/cancel_buff,name=starlord,if=buff.starlord.remains<3&!solar_wrath.ap_check
actions+=/starfall,if=(!solar_wrath.ap_check|(buff.starlord.stack<3|buff.starlord.remains>=8)&(target.1.time_to_die+1)*spell_targets>cost%2.5)&spell_targets>=variable.sf_targets
actions+=/starsurge,if=((talent.starlord.enabled&(buff.starlord.stack<3|buff.starlord.remains>=5&buff.arcanic_pulsar.stack<8)|!talent.starlord.enabled&(buff.arcanic_pulsar.stack<8|buff.ca_inc.up))&buff.solar_empowerment.stack<3&buff.lunar_empowerment.stack<3&buff.reckless_force_counter.stack<19|buff.reckless_force.up)&spell_targets.starfall<variable.sf_targets&(!variable.az_ss|!buff.ca_inc.up|!prev.starsurge)|target.1.time_to_die<=execute_time*astral_power%40|!solar_wrath.ap_check
actions+=/sunfire,if=buff.ca_inc.up&buff.ca_inc.remains<gcd.max&variable.az_ss&dot.moonfire.remains>remains
actions+=/moonfire,if=buff.ca_inc.up&buff.ca_inc.remains<gcd.max&variable.az_ss
actions+=/sunfire,target_if=refreshable,if=ap_check&floor(target.time_to_die%(2*spell_haste))*spell_targets>=ceil(floor(2%spell_targets)*1.5)+2*spell_targets&(spell_targets>1+talent.twin_moons.enabled|dot.moonfire.ticking)&(!variable.az_ss|!buff.ca_inc.up|!prev.sunfire)&(buff.ca_inc.remains>remains|!buff.ca_inc.up)
actions+=/moonfire,target_if=refreshable,if=ap_check&floor(target.time_to_die%(2*spell_haste))*spell_targets>=6&(!variable.az_ss|!buff.ca_inc.up|!prev.moonfire)&(buff.ca_inc.remains>remains|!buff.ca_inc.up)
actions+=/stellar_flare,target_if=refreshable,if=ap_check&floor(target.time_to_die%(2*spell_haste))>=5&(!variable.az_ss|!buff.ca_inc.up|!prev.stellar_flare)
actions+=/new_moon,if=ap_check
actions+=/half_moon,if=ap_check
actions+=/full_moon,if=ap_check
actions+=/lunar_strike,if=buff.solar_empowerment.stack<3&(ap_check|buff.lunar_empowerment.stack=3)&((buff.warrior_of_elune.up|buff.lunar_empowerment.up|spell_targets>=2&!buff.solar_empowerment.up)&(!variable.az_ss|!buff.ca_inc.up)|variable.az_ss&buff.ca_inc.up&prev.solar_wrath)
actions+=/solar_wrath,if=variable.az_ss<3|!buff.ca_inc.up|!prev.solar_wrath
actions+=/sunfire
]])

TJ:RegisterActionProfileList('simc::druid::feral', 'Simulationcraft Druid Profile: Feral', 11, 2, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/variable,name=use_thrash,value=0
actions.precombat+=/variable,name=use_thrash,value=2,if=azerite.wild_fleshrending.enabled
actions.precombat+=/regrowth,if=talent.bloodtalons.enabled
actions.precombat+=/use_item,name=azsharas_font_of_power
actions.precombat+=/cat_form
actions.precombat+=/prowl
actions.precombat+=/potion,dynamic_prepot=1
actions.precombat+=/berserk
actions=auto_attack,if=!buff.prowl.up&!buff.shadowmeld.up
actions+=/run_action_list,name=opener,if=variable.opener_done=0
actions+=/cat_form,if=!buff.cat_form.up
actions+=/rake,if=buff.prowl.up|buff.shadowmeld.up
actions+=/call_action_list,name=cooldowns
actions+=/ferocious_bite,target_if=dot.rip.ticking&dot.rip.remains<3&target.time_to_die>10&(talent.sabertooth.enabled)
actions+=/regrowth,if=combo_points=5&buff.predatory_swiftness.up&talent.bloodtalons.enabled&buff.bloodtalons.down
actions+=/run_action_list,name=finishers,if=combo_points>4
actions+=/run_action_list,name=generators
actions.cooldowns=berserk,if=energy>=30&(cooldown.tigers_fury.remains>5|buff.tigers_fury.up)
actions.cooldowns+=/tigers_fury,if=energy.deficit>=60
actions.cooldowns+=/berserking
actions.cooldowns+=/thorns,if=active_enemies>desired_targets|raid_event.adds.in>45
actions.cooldowns+=/the_unbound_force,if=buff.reckless_force.up|buff.tigers_fury.up
actions.cooldowns+=/memory_of_lucid_dreams,if=buff.tigers_fury.up&buff.berserk.down
actions.cooldowns+=/blood_of_the_enemy,if=buff.tigers_fury.up
actions.cooldowns+=/feral_frenzy,if=combo_points=0
actions.cooldowns+=/focused_azerite_beam,if=active_enemies>desired_targets|(raid_event.adds.in>90&energy.deficit>=50)
actions.cooldowns+=/purifying_blast,if=active_enemies>desired_targets|raid_event.adds.in>60
actions.cooldowns+=/heart_essence,if=buff.tigers_fury.up
actions.cooldowns+=/incarnation,if=energy>=30&(cooldown.tigers_fury.remains>15|buff.tigers_fury.up)
actions.cooldowns+=/potion,if=target.time_to_die<65|(time_to_die<180&(buff.berserk.up|buff.incarnation.up))
actions.cooldowns+=/shadowmeld,if=combo_points<5&energy>=action.rake.cost&dot.rake.pmultiplier<2.1&buff.tigers_fury.up&(buff.bloodtalons.up|!talent.bloodtalons.enabled)&(!talent.incarnation.enabled|cooldown.incarnation.remains>18)&!buff.incarnation.up
actions.cooldowns+=/use_item,name=ashvanes_razor_coral,if=debuff.razor_coral_debuff.down|debuff.conductive_ink_debuff.up&target.time_to_pct_30<1.5|!debuff.conductive_ink_debuff.up&(debuff.razor_coral_debuff.stack>=25-10*debuff.blood_of_the_enemy.up|target.time_to_die<40)&buff.tigers_fury.remains>10
actions.cooldowns+=/use_item,effect_name=cyclotronic_blast,if=(energy.deficit>=energy.regen*3)&buff.tigers_fury.down&!azerite.jungle_fury.enabled
actions.cooldowns+=/use_item,effect_name=cyclotronic_blast,if=buff.tigers_fury.up&azerite.jungle_fury.enabled
actions.cooldowns+=/use_item,effect_name=azsharas_font_of_power,if=energy.deficit>=50
actions.cooldowns+=/use_items,if=buff.tigers_fury.up|target.time_to_die<20
actions.finishers=pool_resource,for_next=1
actions.finishers+=/savage_roar,if=buff.savage_roar.down
actions.finishers+=/pool_resource,for_next=1
actions.finishers+=/primal_wrath,target_if=spell_targets.primal_wrath>1&dot.rip.remains<4
actions.finishers+=/pool_resource,for_next=1
actions.finishers+=/primal_wrath,target_if=spell_targets.primal_wrath>=2
actions.finishers+=/pool_resource,for_next=1
actions.finishers+=/rip,target_if=!ticking|(remains<=duration*0.3)&(!talent.sabertooth.enabled)|(remains<=duration*0.8&persistent_multiplier>dot.rip.pmultiplier)&target.time_to_die>8
actions.finishers+=/pool_resource,for_next=1
actions.finishers+=/savage_roar,if=buff.savage_roar.remains<12
actions.finishers+=/pool_resource,for_next=1
actions.finishers+=/maim,if=buff.iron_jaws.up
actions.finishers+=/ferocious_bite,max_energy=1,target_if=max:druid.rip.ticks_gained_on_refresh
actions.generators=regrowth,if=talent.bloodtalons.enabled&buff.predatory_swiftness.up&buff.bloodtalons.down&combo_points=4&dot.rake.remains<4
actions.generators+=/regrowth,if=talent.bloodtalons.enabled&buff.bloodtalons.down&buff.predatory_swiftness.up&talent.lunar_inspiration.enabled&dot.rake.remains<1
actions.generators+=/brutal_slash,if=spell_targets.brutal_slash>desired_targets
actions.generators+=/pool_resource,for_next=1
actions.generators+=/thrash_cat,if=(refreshable)&(spell_targets.thrash_cat>2)
actions.generators+=/pool_resource,for_next=1
actions.generators+=/thrash_cat,if=(talent.scent_of_blood.enabled&buff.scent_of_blood.down)&spell_targets.thrash_cat>3
actions.generators+=/pool_resource,for_next=1
actions.generators+=/swipe_cat,if=buff.scent_of_blood.up|(action.swipe_cat.damage*spell_targets.swipe_cat>(action.rake.damage+(action.rake_bleed.tick_damage*5)))
actions.generators+=/pool_resource,for_next=1
actions.generators+=/rake,target_if=!ticking|(!talent.bloodtalons.enabled&remains<duration*0.3)&target.time_to_die>4
actions.generators+=/pool_resource,for_next=1
actions.generators+=/rake,target_if=talent.bloodtalons.enabled&buff.bloodtalons.up&((remains<=7)&persistent_multiplier>dot.rake.pmultiplier*0.85)&target.time_to_die>4
actions.generators+=/moonfire_cat,if=buff.bloodtalons.up&buff.predatory_swiftness.down&combo_points<5
actions.generators+=/brutal_slash,if=(buff.tigers_fury.up&(raid_event.adds.in>(1+max_charges-charges_fractional)*recharge_time))
actions.generators+=/moonfire_cat,target_if=refreshable
actions.generators+=/pool_resource,for_next=1
actions.generators+=/thrash_cat,if=refreshable&((variable.use_thrash=2&(!buff.incarnation.up|azerite.wild_fleshrending.enabled))|spell_targets.thrash_cat>1)
actions.generators+=/thrash_cat,if=refreshable&variable.use_thrash=1&buff.clearcasting.react&(!buff.incarnation.up|azerite.wild_fleshrending.enabled)
actions.generators+=/pool_resource,for_next=1
actions.generators+=/swipe_cat,if=spell_targets.swipe_cat>1
actions.generators+=/shred,if=dot.rake.remains>(action.shred.cost+action.rake.cost-energy)%energy.regen|buff.clearcasting.react
actions.opener=tigers_fury
actions.opener+=/rake,if=!ticking|buff.prowl.up
actions.opener+=/variable,name=opener_done,value=dot.rip.ticking
actions.opener+=/wait,sec=0.001,if=dot.rip.ticking
actions.opener+=/moonfire_cat,if=!ticking
actions.opener+=/rip,if=!ticking
]])

TJ:RegisterActionProfileList('simc::druid::guardian', 'Simulationcraft Druid Profile: Guardian', 11, 3, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/memory_of_lucid_dreams
actions.precombat+=/bear_form
actions.precombat+=/potion
actions=auto_attack
actions+=/call_action_list,name=cooldowns
actions+=/call_action_list,name=essences
actions+=/call_action_list,name=cleave,if=active_enemies<=2
actions+=/call_action_list,name=multi,if=active_enemies>=3
actions.cleave=maul,if=rage.deficit<=10
actions.cleave+=/ironfur,if=cost<=0
actions.cleave+=/pulverize,target_if=dot.thrash_bear.stack=dot.thrash_bear.max_stacks
actions.cleave+=/moonfire,target_if=!dot.moonfire.ticking
actions.cleave+=/mangle,if=dot.thrash_bear.ticking
actions.cleave+=/moonfire,target_if=buff.galactic_guardian.up&active_enemies=1|dot.moonfire.refreshable
actions.cleave+=/maul
actions.cleave+=/thrash
actions.cleave+=/swipe
actions.cooldowns=potion
actions.cooldowns+=/blood_fury
actions.cooldowns+=/berserking
actions.cooldowns+=/arcane_torrent
actions.cooldowns+=/lights_judgment
actions.cooldowns+=/fireblood
actions.cooldowns+=/ancestral_call
actions.cooldowns+=/bag_of_tricks
actions.cooldowns+=/barkskin,if=buff.bear_form.up
actions.cooldowns+=/lunar_beam,if=buff.bear_form.up
actions.cooldowns+=/bristling_fur,if=buff.bear_form.up
actions.cooldowns+=/incarnation,if=(dot.moonfire.ticking|active_enemies>1)&dot.thrash_bear.ticking
actions.cooldowns+=/use_item,name=ashvanes_razor_coral,if=((equipped.cyclotronic_blast&cooldown.cyclotronic_blast.remains>25&debuff.razor_coral_debuff.down)|debuff.razor_coral_debuff.down|(debuff.razor_coral_debuff.up&debuff.conductive_ink_debuff.up&target.time_to_pct_30<=2)|(debuff.razor_coral_debuff.up&time_to_die<=20))
actions.cooldowns+=/use_item,effect_name=cyclotronic_blast
actions.cooldowns+=/use_items
actions.essences=concentrated_flame,if=essence.the_crucible_of_flame.major&((!dot.concentrated_flame_burn.ticking&!action.concentrated_flame_missile.in_flight)^time_to_die<=7)
actions.essences+=/anima_of_death,if=essence.anima_of_life_and_death.major
actions.essences+=/memory_of_lucid_dreams,if=essence.memory_of_lucid_dreams.major
actions.essences+=/worldvein_resonance,if=essence.worldvein_resonance.major
actions.essences+=/ripple_in_space,if=essence.ripple_in_space.major
actions.multi=maul,if=essence.conflict_and_strife.major&!buff.sharpened_claws.up
actions.multi+=/ironfur,if=(rage>=cost&azerite.layered_mane.enabled)|rage.deficit<10
actions.multi+=/thrash,if=(buff.incarnation.up&active_enemies>=4)|cooldown.thrash_bear.up
actions.multi+=/mangle,if=buff.incarnation.up&active_enemies=3&dot.thrash_bear.ticking
actions.multi+=/moonfire,if=dot.moonfire.refreshable&active_enemies<=4
actions.multi+=/swipe,if=buff.incarnation.down
]])

