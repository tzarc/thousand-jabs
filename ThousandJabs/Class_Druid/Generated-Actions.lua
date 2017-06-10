if select(3, UnitClass('player')) ~= 11 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')

TJ:RegisterActionProfileList('simc::druid::balance', 'Simulationcraft Druid Profile: Balance', 11, 1, [[
actions.precombat=flask,type=flask_of_the_whispered_pact
actions.precombat+=/food,type=lavish_suramar_feast
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/moonkin_form
actions.precombat+=/blessing_of_elune
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=deadly_grace
actions.precombat+=/new_moon
actions=potion,name=deadly_grace,if=buff.celestial_alignment.up|buff.incarnation.up
actions+=/blessing_of_elune,if=active_enemies<=2&talent.blessing_of_the_ancients.enabled&buff.blessing_of_elune.down
actions+=/blessing_of_elune,if=active_enemies>=3&talent.blessing_of_the_ancients.enabled&buff.blessing_of_anshe.down
actions+=/blood_fury,if=buff.celestial_alignment.up|buff.incarnation.up
actions+=/berserking,if=buff.celestial_alignment.up|buff.incarnation.up
actions+=/arcane_torrent,if=buff.celestial_alignment.up|buff.incarnation.up
actions+=/call_action_list,name=fury_of_elune,if=talent.fury_of_elune.enabled&cooldown.fury_of_elue.remains<target.time_to_die
actions+=/call_action_list,name=ed,if=equipped.the_emerald_dreamcatcher&active_enemies<=1
actions+=/new_moon,if=((charges=2&recharge_time<5)|charges=3)&astral_power.deficit>14
actions+=/half_moon,if=((charges=2&recharge_time<5)|charges=3|(target.time_to_die<15&charges=2))&astral_power.deficit>24
actions+=/full_moon,if=((charges=2&recharge_time<5)|charges=3|target.time_to_die<15)&astral_power.deficit>44
actions+=/stellar_flare,cycle_targets=1,max_cycle_targets=4,if=active_enemies<4&remains<7.2
actions+=/moonfire,cycle_targets=1,if=((talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled))&astral_power.deficit>7
actions+=/sunfire,if=((talent.natures_balance.enabled&remains<3)|(remains<5.4&!talent.natures_balance.enabled))&astral_power.deficit>7
actions+=/astral_communion,if=astral_power.deficit>=71
actions+=/incarnation,if=astral_power>=40
actions+=/celestial_alignment,if=astral_power>=40
actions+=/starfall,if=buff.oneths_overconfidence.up
actions+=/solar_wrath,if=buff.solar_empowerment.stack=3
actions+=/lunar_strike,if=buff.lunar_empowerment.stack=3
actions+=/starsurge,if=buff.oneths_intuition.up
actions+=/call_action_list,name=AoE,if=(active_enemies>=2&talent.stellar_drift.enabled)|active_enemies>=3
actions+=/call_action_list,name=single_target
actions.AoE=starfall,if=debuff.stellar_empowerment.remains<gcd.max*2|astral_power.deficit<22.5|(buff.celestial_alignment.remains>8|buff.incarnation.remains>8)|target.time_to_die<8
actions.AoE+=/new_moon,if=astral_power.deficit>14
actions.AoE+=/half_moon,if=astral_power.deficit>24
actions.AoE+=/full_moon,if=astral_power.deficit>44
actions.AoE+=/warrior_of_elune
actions.AoE+=/lunar_strike,if=buff.warrior_of_elune.up
actions.AoE+=/solar_wrath,if=buff.solar_empowerment.up
actions.AoE+=/lunar_strike,if=buff.lunar_empowerment.up
actions.AoE+=/lunar_strike,if=active_enemies>=4|spell_haste<0.45
actions.AoE+=/solar_wrath
actions.ed=astral_communion,if=astral_power.deficit>=75&buff.the_emerald_dreamcatcher.up
actions.ed+=/incarnation,if=astral_power>=60|buff.bloodlust.up
actions.ed+=/celestial_alignment,if=astral_power>=60&!buff.the_emerald_dreamcatcher.up
actions.ed+=/starsurge,if=(gcd.max*astral_power%26)>target.time_to_die
actions.ed+=/stellar_flare,cycle_targets=1,max_cycle_targets=4,if=active_enemies<4&remains<7.2
actions.ed+=/moonfire,if=((talent.natures_balance.enabled&remains<3)|(remains<6.6&!talent.natures_balance.enabled))&(buff.the_emerald_dreamcatcher.remains>gcd.max|!buff.the_emerald_dreamcatcher.up)
actions.ed+=/sunfire,if=((talent.natures_balance.enabled&remains<3)|(remains<5.4&!talent.natures_balance.enabled))&(buff.the_emerald_dreamcatcher.remains>gcd.max|!buff.the_emerald_dreamcatcher.up)
actions.ed+=/starfall,if=buff.oneths_overconfidence.up&buff.the_emerald_dreamcatcher.remains>execute_time
actions.ed+=/new_moon,if=astral_power.deficit>=10&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=16
actions.ed+=/half_moon,if=astral_power.deficit>=20&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=6
actions.ed+=/full_moon,if=astral_power.deficit>=40&buff.the_emerald_dreamcatcher.remains>execute_time
actions.ed+=/lunar_strike,if=(buff.lunar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&(!(buff.celestial_alignment.up|buff.incarnation.up)&astral_power.deficit>=15|(buff.celestial_alignment.up|buff.incarnation.up)&astral_power.deficit>=22.5))&spell_haste<0.4
actions.ed+=/solar_wrath,if=buff.solar_empowerment.stack>1&buff.the_emerald_dreamcatcher.remains>2*execute_time&astral_power>=6&(dot.moonfire.remains>5|(dot.sunfire.remains<5.4&dot.moonfire.remains>6.6))&(!(buff.celestial_alignment.up|buff.incarnation.up)&astral_power.deficit>=10|(buff.celestial_alignment.up|buff.incarnation.up)&astral_power.deficit>=15)
actions.ed+=/lunar_strike,if=buff.lunar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=11&(!(buff.celestial_alignment.up|buff.incarnation.up)&astral_power.deficit>=15|(buff.celestial_alignment.up|buff.incarnation.up)&astral_power.deficit>=22.5)
actions.ed+=/solar_wrath,if=buff.solar_empowerment.up&buff.the_emerald_dreamcatcher.remains>execute_time&astral_power>=16&(!(buff.celestial_alignment.up|buff.incarnation.up)&astral_power.deficit>=10|(buff.celestial_alignment.up|buff.incarnation.up)&astral_power.deficit>=15)
actions.ed+=/starsurge,if=(buff.the_emerald_dreamcatcher.up&buff.the_emerald_dreamcatcher.remains<gcd.max)|astral_power>85|((buff.celestial_alignment.up|buff.incarnation.up)&astral_power>30)
actions.ed+=/starfall,if=buff.oneths_overconfidence.up
actions.ed+=/new_moon,if=astral_power.deficit>=10
actions.ed+=/half_moon,if=astral_power.deficit>=20
actions.ed+=/full_moon,if=astral_power.deficit>=40
actions.ed+=/solar_wrath,if=buff.solar_empowerment.up
actions.ed+=/lunar_strike,if=buff.lunar_empowerment.up
actions.ed+=/solar_wrath
actions.fury_of_elune=incarnation,if=astral_power>=95&cooldown.fury_of_elune.remains<=gcd
actions.fury_of_elune+=/fury_of_elune,if=astral_power>=95
actions.fury_of_elune+=/new_moon,if=((charges=2&recharge_time<5)|charges=3)&&(buff.fury_of_elune_up.up|(cooldown.fury_of_elune.remains>gcd*3&astral_power<=90))
actions.fury_of_elune+=/half_moon,if=((charges=2&recharge_time<5)|charges=3)&&(buff.fury_of_elune_up.up|(cooldown.fury_of_elune.remains>gcd*3&astral_power<=80))
actions.fury_of_elune+=/full_moon,if=((charges=2&recharge_time<5)|charges=3)&&(buff.fury_of_elune_up.up|(cooldown.fury_of_elune.remains>gcd*3&astral_power<=60))
actions.fury_of_elune+=/astral_communion,if=buff.fury_of_elune_up.up&astral_power<=25
actions.fury_of_elune+=/warrior_of_elune,if=buff.fury_of_elune_up.up|(cooldown.fury_of_elune.remains>=35&buff.lunar_empowerment.up)
actions.fury_of_elune+=/lunar_strike,if=buff.warrior_of_elune.up&(astral_power<=90|(astral_power<=85&buff.incarnation.up))
actions.fury_of_elune+=/new_moon,if=astral_power<=90&buff.fury_of_elune_up.up
actions.fury_of_elune+=/half_moon,if=astral_power<=80&buff.fury_of_elune_up.up&astral_power>cast_time*12
actions.fury_of_elune+=/full_moon,if=astral_power<=60&buff.fury_of_elune_up.up&astral_power>cast_time*12
actions.fury_of_elune+=/moonfire,if=buff.fury_of_elune_up.down&remains<=6.6
actions.fury_of_elune+=/sunfire,if=buff.fury_of_elune_up.down&remains<5.4
actions.fury_of_elune+=/stellar_flare,if=remains<7.2&active_enemies=1
actions.fury_of_elune+=/starfall,if=(active_enemies>=2&talent.stellar_flare.enabled|active_enemies>=3)&buff.fury_of_elune_up.down&cooldown.fury_of_elune.remains>10
actions.fury_of_elune+=/starsurge,if=active_enemies<=2&buff.fury_of_elune_up.down&cooldown.fury_of_elune.remains>7
actions.fury_of_elune+=/starsurge,if=buff.fury_of_elune_up.down&((astral_power>=92&cooldown.fury_of_elune.remains>gcd*3)|(cooldown.warrior_of_elune.remains<=5&cooldown.fury_of_elune.remains>=35&buff.lunar_empowerment.stack<2))
actions.fury_of_elune+=/solar_wrath,if=buff.solar_empowerment.up
actions.fury_of_elune+=/lunar_strike,if=buff.lunar_empowerment.stack=3|(buff.lunar_empowerment.remains<5&buff.lunar_empowerment.up)|active_enemies>=2
actions.fury_of_elune+=/solar_wrath
actions.single_target=starsurge,if=astral_power.deficit<44|(buff.celestial_alignment.up|buff.incarnation.up|buff.astral_acceleration.up)|(gcd.max*(astral_power%40))>target.time_to_die
actions.single_target+=/new_moon,if=astral_power.deficit>14&!(buff.celestial_alignment.up|buff.incarnation.up)
actions.single_target+=/half_moon,if=astral_power.deficit>24&!(buff.celestial_alignment.up|buff.incarnation.up)
actions.single_target+=/full_moon,if=astral_power.deficit>44
actions.single_target+=/warrior_of_elune
actions.single_target+=/lunar_strike,if=buff.warrior_of_elune.up
actions.single_target+=/solar_wrath,if=buff.solar_empowerment.up
actions.single_target+=/lunar_strike,if=buff.lunar_empowerment.up
actions.single_target+=/solar_wrath
]])

TJ:RegisterActionProfileList('simc::druid::feral', 'Simulationcraft Druid Profile: Feral', 11, 2, [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=lavish_suramar_feast
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/regrowth,if=talent.bloodtalons.enabled
actions.precombat+=/variable,name=rake_refresh,op=set,value=7
actions.precombat+=/variable,name=rake_refresh,op=set,value=3,if=equipped.ailuro_pouncers|talent.soul_of_the_forest.enabled
actions.precombat+=/variable,name=pooling,op=set,value=3
actions.precombat+=/variable,name=pooling,op=set,value=10,if=equipped.chatoyant_signet
actions.precombat+=/variable,name=pooling,op=set,value=3,if=equipped.the_wildshapers_clutch&!equipped.chatoyant_signet
actions.precombat+=/cat_form
actions.precombat+=/prowl
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=old_war
actions=dash,if=!buff.cat_form.up
actions+=/cat_form
actions+=/call_action_list,name=opener,if=!dot.rip.ticking&time<15&talent.savage_roar.enabled&talent.jagged_wounds.enabled&talent.bloodtalons.enabled&desired_targets<=1
actions+=/wild_charge
actions+=/displacer_beast,if=movement.distance>10
actions+=/dash,if=movement.distance&buff.displacer_beast.down&buff.wild_charge_movement.down
actions+=/rake,if=buff.prowl.up
actions+=/auto_attack
actions+=/skull_bash
actions+=/berserk,if=buff.tigers_fury.up
actions+=/incarnation,if=cooldown.tigers_fury.remains<gcd
actions+=/potion,name=old_war,if=((buff.berserk.remains>10|buff.incarnation.remains>20)&(target.time_to_die<180|(trinket.proc.all.react&target.health.pct<25)))|target.time_to_die<=40
actions+=/tigers_fury,if=(!buff.clearcasting.react&energy.deficit>=60)|energy.deficit>=80|(t18_class_trinket&buff.berserk.up&buff.tigers_fury.down)
actions+=/incarnation,if=energy.time_to_max>1&energy>=35
actions+=/ferocious_bite,cycle_targets=1,if=dot.rip.ticking&dot.rip.remains<3&target.time_to_die>3&(target.health.pct<25|talent.sabertooth.enabled)
actions+=/regrowth,if=talent.bloodtalons.enabled&buff.predatory_swiftness.up&buff.bloodtalons.down&(combo_points>=5|buff.predatory_swiftness.remains<1.5|(talent.bloodtalons.enabled&combo_points=2&cooldown.ashamanes_frenzy.remains<gcd)|(talent.elunes_guidance.enabled&((cooldown.elunes_guidance.remains<gcd&combo_points=0)|(buff.elunes_guidance.up&combo_points>=4))))
actions+=/call_action_list,name=sbt_opener,if=talent.sabertooth.enabled&time<20
actions+=/regrowth,if=equipped.ailuro_pouncers&talent.bloodtalons.enabled&(buff.predatory_swiftness.stack>2|(buff.predatory_swiftness.stack>1&dot.rake.remains<3))&buff.bloodtalons.down
actions+=/call_action_list,name=finisher
actions+=/call_action_list,name=generator
actions+=/wait,sec=1,if=energy.time_to_max>3
actions.finisher=pool_resource,for_next=1
actions.finisher+=/savage_roar,if=!buff.savage_roar.up&(combo_points=5|(talent.brutal_slash.enabled&spell_targets.brutal_slash>desired_targets&action.brutal_slash.charges>0))
actions.finisher+=/pool_resource,for_next=1
actions.finisher+=/thrash_cat,cycle_targets=1,if=remains<=duration*0.3&spell_targets.thrash_cat>=5
actions.finisher+=/pool_resource,for_next=1
actions.finisher+=/swipe_cat,if=spell_targets.swipe_cat>=8
actions.finisher+=/rip,cycle_targets=1,if=(!ticking|(remains<8&target.health.pct>25&!talent.sabertooth.enabled)|persistent_multiplier>dot.rip.pmultiplier)&target.time_to_die-remains>tick_time*4&combo_points=5&(energy.time_to_max<variable.pooling|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(buff.clearcasting.react&energy>65)|talent.soul_of_the_forest.enabled|!dot.rip.ticking|(dot.rake.remains<1.5&spell_targets.swipe_cat<6))
actions.finisher+=/savage_roar,if=((buff.savage_roar.remains<=10.5&talent.jagged_wounds.enabled)|(buff.savage_roar.remains<=7.2))&combo_points=5&(energy.time_to_max<variable.pooling|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(buff.clearcasting.react&energy>65)|talent.soul_of_the_forest.enabled|!dot.rip.ticking|(dot.rake.remains<1.5&spell_targets.swipe_cat<6))
actions.finisher+=/swipe_cat,if=combo_points=5&(spell_targets.swipe_cat>=6|(spell_targets.swipe_cat>=3&!talent.bloodtalons.enabled))&combo_points=5&(energy.time_to_max<variable.pooling|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3|set_bonus.tier18_4pc|(talent.moment_of_clarity.enabled&buff.clearcasting.react))
actions.finisher+=/maim,,if=combo_points=5&buff.fiery_red_maimers.up&(energy.time_to_max<variable.pooling|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3)
actions.finisher+=/ferocious_bite,max_energy=1,cycle_targets=1,if=combo_points=5&(energy.time_to_max<variable.pooling|buff.berserk.up|buff.incarnation.up|buff.elunes_guidance.up|cooldown.tigers_fury.remains<3)
actions.generator=brutal_slash,if=spell_targets.brutal_slash>desired_targets&combo_points<5
actions.generator+=/ashamanes_frenzy,if=combo_points<=2&buff.elunes_guidance.down&(buff.bloodtalons.up|!talent.bloodtalons.enabled)&(buff.savage_roar.up|!talent.savage_roar.enabled)
actions.generator+=/pool_resource,if=talent.elunes_guidance.enabled&combo_points=0&energy<action.ferocious_bite.cost+25-energy.regen*cooldown.elunes_guidance.remains
actions.generator+=/elunes_guidance,if=talent.elunes_guidance.enabled&combo_points=0&energy>=action.ferocious_bite.cost+25
actions.generator+=/pool_resource,for_next=1
actions.generator+=/thrash_cat,if=talent.brutal_slash.enabled&spell_targets.thrash_cat>=9
actions.generator+=/pool_resource,for_next=1
actions.generator+=/swipe_cat,if=spell_targets.swipe_cat>=6
actions.generator+=/pool_resource,for_next=1
actions.generator+=/rake,cycle_targets=1,if=combo_points<5&(!ticking|(!talent.bloodtalons.enabled&remains<duration*0.3)|(talent.bloodtalons.enabled&buff.bloodtalons.up&(remains<=variable.rake_refresh)&persistent_multiplier>dot.rake.pmultiplier*0.80))&target.time_to_die-remains>tick_time
actions.generator+=/moonfire_cat,cycle_targets=1,if=combo_points<5&remains<=4.2&target.time_to_die-remains>tick_time*2
actions.generator+=/pool_resource,for_next=1
actions.generator+=/thrash_cat,cycle_targets=1,if=set_bonus.tier19_4pc&remains<=duration*0.3&combo_points<5&(spell_targets.swipe_cat>=2|((equipped.luffa_wrappings|buff.clearcasting.up)&(equipped.ailuro_pouncers|buff.bloodtalons.down)))
actions.generator+=/thrash_cat,cycle_targets=1,if=!set_bonus.tier19_4pc&remains<=duration*0.3&(spell_targets.swipe_cat>=2|(buff.clearcasting.up&equipped.luffa_wrappings&(equipped.ailuro_pouncers|buff.bloodtalons.down)))
actions.generator+=/brutal_slash,if=combo_points<5&((raid_event.adds.exists&raid_event.adds.in>(1+max_charges-charges_fractional)*15)|(!raid_event.adds.exists&(charges_fractional>2.66&time>10)))
actions.generator+=/swipe_cat,if=combo_points<5&spell_targets.swipe_cat>=3
actions.generator+=/shred,if=combo_points<5&(spell_targets.swipe_cat<3|talent.brutal_slash.enabled)
actions.opener=rake,if=buff.prowl.up
actions.opener+=/savage_roar,if=buff.savage_roar.down
actions.opener+=/berserk,if=buff.savage_roar.up&!equipped.draught_of_souls
actions.opener+=/tigers_fury,if=buff.berserk.up&!equipped.draught_of_souls
actions.opener+=/frenzy,if=buff.bloodtalons.up&!equipped.draught_of_souls
actions.opener+=/regrowth,if=combo_points=5&buff.bloodtalons.down&buff.predatory_swiftness.up&!equipped.draught_of_souls
actions.opener+=/rip,if=combo_points=5&buff.bloodtalons.up&!equipped.draught_of_souls
actions.opener+=/shred,if=combo_points<5&buff.savage_roar.up&!equipped.draught_of_souls
actions.sbt_opener=regrowth,if=talent.bloodtalons.enabled&combo_points=5&!buff.bloodtalons.up&!dot.rip.ticking
actions.sbt_opener+=/tigers_fury,if=!dot.rip.ticking&combo_points=5
]])

TJ:RegisterActionProfileList('simc::druid::guardian', 'Simulationcraft Druid Profile: Guardian', 11, 3, [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=lavish_suramar_feast
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/bear_form
actions.precombat+=/snapshot_stats
actions=auto_attack
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/incarnation
actions+=/rage_of_the_sleeper
actions+=/lunar_beam
actions+=/frenzied_regeneration,if=incoming_damage_5s%health.max>=0.5|health<=health.max*0.4
actions+=/bristling_fur,if=buff.ironfur.stack=1|buff.ironfur.down
actions+=/ironfur,if=(buff.ironfur.up=0)|(buff.gory_fur.up=1)|(rage>=80)
actions+=/moonfire,if=buff.incarnation.up=1&dot.moonfire.remains<=4.8
actions+=/thrash_bear,if=buff.incarnation.up=1&dot.thrash.remains<=4.5
actions+=/mangle
actions+=/thrash_bear
actions+=/pulverize,if=buff.pulverize.up=0|buff.pulverize.remains<=6
actions+=/moonfire,if=buff.galactic_guardian.up=1&(!ticking|dot.moonfire.remains<=4.8)
actions+=/moonfire,if=buff.galactic_guardian.up=1
actions+=/moonfire,if=dot.moonfire.remains<=4.8
actions+=/swipe_bear
]])

