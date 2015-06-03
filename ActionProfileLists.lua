local _, private = ...
private.apls = {}

private.apls["Death_Knight_Blood_T17M.simc"] = [[
deathknight="Death_Knight_Blood_T17M"
level=100
race=tauren
role=tank
position=front
talents=2012102
spec=blood

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_stamina_flask
actions.precombat+=/food,type=whiptail_fillet
actions.precombat+=/blood_presence
actions.precombat+=/horn_of_winter
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_armor
actions.precombat+=/bone_shield
actions.precombat+=/army_of_the_dead

# Executed every time the actor is available.

actions=auto_attack
actions+=/potion,name=draenic_armor,if=buff.potion.down&buff.blood_shield.down&!unholy&!frost
# if=time>10
actions+=/blood_fury
# if=time>10
actions+=/berserking
# if=time>10
actions+=/arcane_torrent
actions+=/antimagic_shell
actions+=/conversion,if=!buff.conversion.up&runic_power>50&health.pct<90
actions+=/lichborne,if=health.pct<90
actions+=/death_strike,if=incoming_damage_5s>=health.max*0.65
actions+=/army_of_the_dead,if=buff.bone_shield.down&buff.dancing_rune_weapon.down&buff.icebound_fortitude.down&buff.vampiric_blood.down
actions+=/bone_shield,if=buff.army_of_the_dead.down&buff.bone_shield.down&buff.dancing_rune_weapon.down&buff.icebound_fortitude.down&buff.vampiric_blood.down
actions+=/vampiric_blood,if=health.pct<50
actions+=/icebound_fortitude,if=health.pct<30&buff.army_of_the_dead.down&buff.dancing_rune_weapon.down&buff.bone_shield.down&buff.vampiric_blood.down
actions+=/rune_tap,if=health.pct<50&buff.army_of_the_dead.down&buff.dancing_rune_weapon.down&buff.bone_shield.down&buff.vampiric_blood.down&buff.icebound_fortitude.down
actions+=/dancing_rune_weapon,if=health.pct<80&buff.army_of_the_dead.down&buff.icebound_fortitude.down&buff.bone_shield.down&buff.vampiric_blood.down
actions+=/death_pact,if=health.pct<50
actions+=/outbreak,if=(!talent.necrotic_plague.enabled&disease.min_remains<8)|!disease.ticking
actions+=/death_coil,if=runic_power>90
actions+=/plague_strike,if=(!talent.necrotic_plague.enabled&!dot.blood_plague.ticking)|(talent.necrotic_plague.enabled&!dot.necrotic_plague.ticking)
actions+=/icy_touch,if=(!talent.necrotic_plague.enabled&!dot.frost_fever.ticking)|(talent.necrotic_plague.enabled&!dot.necrotic_plague.ticking)
actions+=/defile
actions+=/plague_leech,if=((!blood&!unholy)|(!blood&!frost)|(!unholy&!frost))&cooldown.outbreak.remains<=gcd
actions+=/call_action_list,name=bt,if=talent.blood_tap.enabled
actions+=/call_action_list,name=re,if=talent.runic_empowerment.enabled
actions+=/call_action_list,name=rc,if=talent.runic_corruption.enabled
actions+=/call_action_list,name=nrt,if=!talent.blood_tap.enabled&!talent.runic_empowerment.enabled&!talent.runic_corruption.enabled
actions+=/defile,if=buff.crimson_scourge.react
actions+=/death_and_decay,if=buff.crimson_scourge.react
actions+=/blood_boil,if=buff.crimson_scourge.react
actions+=/death_coil
actions+=/empower_rune_weapon,if=!blood&!unholy&!frost

actions.bt=death_strike,if=unholy=2|frost=2
actions.bt+=/blood_tap,if=buff.blood_charge.stack>=5&!blood
actions.bt+=/death_strike,if=buff.blood_charge.stack>=10&unholy&frost
actions.bt+=/blood_tap,if=buff.blood_charge.stack>=10&!unholy&!frost
actions.bt+=/blood_tap,if=buff.blood_charge.stack>=5&(!unholy|!frost)
actions.bt+=/blood_tap,if=buff.blood_charge.stack>=5&blood.death&!unholy&!frost
actions.bt+=/death_coil,if=runic_power>70
actions.bt+=/soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35&(blood=2|(blood&!blood.death))
actions.bt+=/blood_boil,if=blood=2|(blood&!blood.death)

actions.re=death_strike,if=unholy&frost
actions.re+=/death_coil,if=runic_power>70
actions.re+=/soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35&blood=2
actions.re+=/blood_boil,if=blood=2

actions.rc=death_strike,if=unholy=2|frost=2
actions.rc+=/death_coil,if=runic_power>70
actions.rc+=/soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35&blood>=1
actions.rc+=/blood_boil,if=blood=2

actions.nrt=death_strike,if=unholy=2|frost=2
actions.nrt+=/death_coil,if=runic_power>70
actions.nrt+=/soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35&blood>=1
actions.nrt+=/blood_boil,if=blood>=1

head=ogreskull_boneplate_greathelm,id=115539,bonus_id=567
neck=gluttons_kerchief,id=113882,bonus_id=567,enchant=gift_of_multistrike
shoulders=unstable_slag_shoulderplates,id=113884,bonus_id=567
back=gronnstitched_greatcloak,id=113873,bonus_id=567,enchant=gift_of_multistrike
chest=ogreskull_boneplate_breastplate,id=115537,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=ogreskull_boneplate_gauntlets,id=115538,bonus_id=567
waist=ironcrushers_collar,id=113950,bonus_id=567
legs=ogreskull_boneplate_greaves,id=115535,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_multistrike
finger2=seal_of_unquenchable_flame,id=113922,bonus_id=567,enchant=gift_of_multistrike
trinket1=pillar_of_the_earth,id=113650,bonus_id=567
trinket2=petrified_flesheating_spore,id=113663,bonus_id=567
main_hand=kagrazs_burning_blade,id=113913,bonus_id=567,enchant=rune_of_the_stoneskin_gargoyle

# Gear Summary
# gear_ilvl=699.00
# gear_strength=3175
# gear_stamina=6100
# gear_crit_rating=375
# gear_haste_rating=753
# gear_mastery_rating=557
# gear_armor=2287
# gear_bonus_armor=699
# gear_multistrike_rating=1703
# gear_versatility_rating=698
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Death_Knight_Blood_T17M_BoS.simc"] = [[
deathknight="Death_Knight_Blood_T17M_BoS"
level=100
race=orc
role=tank
position=front
talents=2111113
glyphs=icy_runes/vampiric_blood/regenerative_magic
spec=blood

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_strength_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/blood_presence
actions.precombat+=/horn_of_winter
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_armor
actions.precombat+=/bone_shield
actions.precombat+=/army_of_the_dead

# Executed every time the actor is available.

actions=auto_attack
actions+=/blood_fury,if=target.time_to_die>120|buff.draenic_armor_potion.remains<=buff.blood_fury.duration
actions+=/berserking,if=buff.dancing_rune_weapon.up
actions+=/dancing_rune_weapon,if=target.time_to_die>90|buff.draenic_armor_potion.remains<=buff.dancing_rune_weapon.duration
actions+=/potion,name=draenic_armor,if=target.time_to_die<(buff.draenic_armor_potion.duration+13)
actions+=/blood_fury,if=buff.blast_furnace.up
actions+=/dancing_rune_weapon,if=target.time_to_die<90&buff.blast_furnace.up
actions+=/potion,name=draenic_armor,if=buff.blast_furnace.up&dot.soul_reaper.ticking&target.time_to_die<120
actions+=/use_item,name=vial_of_convulsive_shadows,if=target.time_to_die>120|buff.draenic_armor_potion.remains<21
actions+=/bone_shield,if=buff.army_of_the_dead.down&buff.bone_shield.down&buff.dancing_rune_weapon.down&buff.icebound_fortitude.down&buff.rune_tap.down
actions+=/lichborne,if=health.pct<30
actions+=/vampiric_blood,if=health.pct<40
actions+=/icebound_fortitude,if=health.pct<30&buff.army_of_the_dead.down&buff.dancing_rune_weapon.down&buff.bone_shield.down&buff.rune_tap.down
actions+=/death_pact,if=health.pct<30
actions+=/run_action_list,name=last,if=target.time_to_die<8|target.time_to_die<13&cooldown.empower_rune_weapon.remains<4
actions+=/run_action_list,name=bos,if=dot.breath_of_sindragosa.ticking
actions+=/run_action_list,name=nbos,if=!dot.breath_of_sindragosa.ticking&cooldown.breath_of_sindragosa.remains<4
actions+=/run_action_list,name=cdbos,if=!dot.breath_of_sindragosa.ticking&cooldown.breath_of_sindragosa.remains>=4

actions.bos=blood_tap,if=buff.blood_charge.stack>=11
actions.bos+=/soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<35&runic_power>5
actions.bos+=/blood_tap,if=buff.blood_charge.stack>=9&runic_power>80&(blood.frac>1.8|frost.frac>1.8|unholy.frac>1.8)
actions.bos+=/death_coil,if=runic_power>80&(blood.frac>1.8|frost.frac>1.8|unholy.frac>1.8)
actions.bos+=/blood_tap,if=buff.blood_charge.stack>=9&runic_power>85&(buff.convulsive_shadows.remains>5|buff.convulsive_shadows.remains>2&buff.bloodlust.up)
actions.bos+=/death_coil,if=runic_power>85&(buff.convulsive_shadows.remains>5|buff.convulsive_shadows.remains>2&buff.bloodlust.up)
actions.bos+=/outbreak,if=(!dot.blood_plague.ticking|!dot.frost_fever.ticking)&runic_power>21
actions.bos+=/chains_of_ice,if=!dot.frost_fever.ticking&glyph.icy_runes.enabled&runic_power<90
actions.bos+=/plague_strike,if=!dot.blood_plague.ticking&runic_power>5
actions.bos+=/icy_touch,if=!dot.frost_fever.ticking&runic_power>5
actions.bos+=/death_strike,if=runic_power<16
actions.bos+=/blood_tap,if=runic_power<16
actions.bos+=/blood_boil,if=runic_power<16&runic_power>5&buff.crimson_scourge.down&(blood>=1&blood.death=0|blood=2&blood.death<2)
actions.bos+=/arcane_torrent,if=runic_power<16
actions.bos+=/chains_of_ice,if=runic_power<16&glyph.icy_runes.enabled
actions.bos+=/blood_boil,if=runic_power<16&buff.crimson_scourge.down&(blood>=1&blood.death=0|blood=2&blood.death<2)
actions.bos+=/icy_touch,if=runic_power<16
actions.bos+=/plague_strike,if=runic_power<16
actions.bos+=/rune_tap,if=runic_power<16&blood>=1&blood.death=0&frost=0&unholy=0&buff.crimson_scourge.up
actions.bos+=/empower_rune_weapon,if=runic_power<16&blood=0&frost=0&unholy=0
actions.bos+=/death_strike,if=(blood.frac>1.8&blood.death>=1|frost.frac>1.8|unholy.frac>1.8|buff.blood_charge.stack>=11)
actions.bos+=/blood_tap,if=(blood.frac>1.8&blood.death>=1|frost.frac>1.8|unholy.frac>1.8)
actions.bos+=/blood_boil,if=(blood>=1&blood.death=0&target.health.pct-3*(target.health.pct%target.time_to_die)>35|blood=2&blood.death<2)&buff.crimson_scourge.down
actions.bos+=/antimagic_shell,if=runic_power<65
actions.bos+=/plague_leech,if=runic_power<65
actions.bos+=/outbreak,if=!dot.blood_plague.ticking
actions.bos+=/outbreak,if=pet.dancing_rune_weapon.active&!pet.dancing_rune_weapon.dot.blood_plague.ticking
actions.bos+=/death_and_decay,if=buff.crimson_scourge.up
actions.bos+=/blood_boil,if=buff.crimson_scourge.up

actions.cdbos=soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35
actions.cdbos+=/blood_tap,if=buff.blood_charge.stack>=10
actions.cdbos+=/death_coil,if=runic_power>65
actions.cdbos+=/plague_strike,if=!dot.blood_plague.ticking&unholy=2
actions.cdbos+=/icy_touch,if=!dot.frost_fever.ticking&frost=2
actions.cdbos+=/death_strike,if=unholy=2|frost=2|blood=2&blood.death>=1
actions.cdbos+=/blood_boil,if=blood=2&blood.death<2
actions.cdbos+=/outbreak,if=!dot.blood_plague.ticking
actions.cdbos+=/plague_strike,if=!dot.blood_plague.ticking
actions.cdbos+=/icy_touch,if=!dot.frost_fever.ticking
actions.cdbos+=/outbreak,if=pet.dancing_rune_weapon.active&!pet.dancing_rune_weapon.dot.blood_plague.ticking
actions.cdbos+=/blood_boil,if=((dot.frost_fever.remains<4&dot.frost_fever.ticking)|(dot.blood_plague.remains<4&dot.blood_plague.ticking))
actions.cdbos+=/death_and_decay,if=buff.crimson_scourge.up
actions.cdbos+=/blood_boil,if=buff.crimson_scourge.up
actions.cdbos+=/death_coil,if=runic_power>45
actions.cdbos+=/blood_tap
actions.cdbos+=/death_strike
actions.cdbos+=/blood_boil,if=blood>=1&blood.death=0
actions.cdbos+=/death_coil

actions.last=antimagic_shell,if=runic_power<90
actions.last+=/blood_tap
actions.last+=/soul_reaper,if=target.time_to_die>7
actions.last+=/death_coil,if=runic_power>80
actions.last+=/death_strike
actions.last+=/blood_boil,if=blood=2|target.time_to_die<=7
actions.last+=/death_coil,if=runic_power>75|target.time_to_die<4|!dot.breath_of_sindragosa.ticking
actions.last+=/plague_strike,if=target.time_to_die<2|cooldown.empower_rune_weapon.remains<2
actions.last+=/icy_touch,if=target.time_to_die<2|cooldown.empower_rune_weapon.remains<2
actions.last+=/empower_rune_weapon,if=!blood&!unholy&!frost&runic_power<76|target.time_to_die<5
actions.last+=/plague_leech

actions.nbos=breath_of_sindragosa,if=runic_power>=80
actions.nbos+=/soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35
actions.nbos+=/chains_of_ice,if=!dot.frost_fever.ticking&glyph.icy_runes.enabled
actions.nbos+=/icy_touch,if=!dot.frost_fever.ticking
actions.nbos+=/plague_strike,if=!dot.blood_plague.ticking
actions.nbos+=/death_strike,if=(blood.frac>1.8&blood.death>=1|frost.frac>1.8|unholy.frac>1.8)&runic_power<80
actions.nbos+=/death_and_decay,if=buff.crimson_scourge.up
actions.nbos+=/blood_boil,if=buff.crimson_scourge.up|(blood=2&runic_power<80&blood.death<2)

head=ogreskull_boneplate_greathelm,id=115539,bonus_id=567
neck=gluttons_kerchief,id=113882,bonus_id=567,enchant=gift_of_multistrike
shoulders=overdriven_spaulders,id=113990,bonus_id=567
back=gronnstitched_greatcloak,id=113873,bonus_id=567,enchant=gift_of_multistrike
chest=ogreskull_boneplate_breastplate,id=115537,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=ogreskull_boneplate_gauntlets,id=115538,bonus_id=567
waist=ironcrushers_collar,id=113950,bonus_id=567
legs=ogreskull_boneplate_greaves,id=115535,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=seal_of_unquenchable_flame,id=113922,bonus_id=567,enchant=gift_of_multistrike
finger2=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_multistrike
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=vial_of_convulsive_shadows,id=113969,bonus_id=567
main_hand=kagrazs_burning_blade,id=113913,bonus_id=567,enchant=rune_of_the_fallen_crusader

# Gear Summary
# gear_ilvl=701.00
# gear_strength=3618
# gear_stamina=4763
# gear_crit_rating=521
# gear_haste_rating=574
# gear_mastery_rating=720
# gear_armor=2287
# gear_bonus_armor=875
# gear_multistrike_rating=1985
# gear_versatility_rating=267
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Death_Knight_Frost_1h_T17M.simc"] = [[
deathknight="Death_Knight_Frost_1h_T17M"
level=100
race=orc
role=attack
position=back
talents=2001002
spec=frost

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_strength_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/horn_of_winter
actions.precombat+=/frost_presence
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/army_of_the_dead
actions.precombat+=/potion,name=draenic_strength
actions.precombat+=/pillar_of_frost

# Executed every time the actor is available.

actions=auto_attack
actions+=/deaths_advance,if=movement.remains>2
actions+=/antimagic_shell,damage=100000,if=((dot.breath_of_sindragosa.ticking&runic_power<25)|cooldown.breath_of_sindragosa.remains>40)|!talent.breath_of_sindragosa.enabled
actions+=/pillar_of_frost
actions+=/potion,name=draenic_strength,if=target.time_to_die<=30|(target.time_to_die<=60&buff.pillar_of_frost.up)
actions+=/empower_rune_weapon,if=target.time_to_die<=60&buff.potion.up
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/use_item,slot=trinket2
actions+=/run_action_list,name=aoe,if=active_enemies>=3
actions+=/run_action_list,name=single_target,if=active_enemies<3

actions.aoe=unholy_blight
actions.aoe+=/blood_boil,if=dot.blood_plague.ticking&(!talent.unholy_blight.enabled|cooldown.unholy_blight.remains<49),line_cd=28
actions.aoe+=/defile
actions.aoe+=/breath_of_sindragosa,if=runic_power>75
actions.aoe+=/run_action_list,name=bos_aoe,if=dot.breath_of_sindragosa.ticking
actions.aoe+=/howling_blast
actions.aoe+=/blood_tap,if=buff.blood_charge.stack>10
actions.aoe+=/frost_strike,if=runic_power>88
actions.aoe+=/death_and_decay,if=unholy=1
actions.aoe+=/plague_strike,if=unholy=2
actions.aoe+=/blood_tap
actions.aoe+=/frost_strike,if=!talent.breath_of_sindragosa.enabled|cooldown.breath_of_sindragosa.remains>=10
actions.aoe+=/plague_leech
actions.aoe+=/plague_strike,if=unholy=1
actions.aoe+=/empower_rune_weapon

actions.single_target=blood_tap,if=buff.blood_charge.stack>10&(runic_power>76|(runic_power>=20&buff.killing_machine.react))
actions.single_target+=/soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35
actions.single_target+=/blood_tap,if=(target.health.pct-3*(target.health.pct%target.time_to_die)<=35&cooldown.soul_reaper.remains=0)
actions.single_target+=/breath_of_sindragosa,if=runic_power>75
actions.single_target+=/run_action_list,name=bos_st,if=dot.breath_of_sindragosa.ticking
actions.single_target+=/defile
actions.single_target+=/blood_tap,if=talent.defile.enabled&cooldown.defile.remains=0
actions.single_target+=/howling_blast,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains<7&runic_power<88
actions.single_target+=/obliterate,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains<3&runic_power<76
actions.single_target+=/frost_strike,if=buff.killing_machine.react|runic_power>88
actions.single_target+=/frost_strike,if=cooldown.antimagic_shell.remains<1&runic_power>=50&!buff.antimagic_shell.up
actions.single_target+=/howling_blast,if=death>1|frost>1
actions.single_target+=/unholy_blight,if=!disease.ticking
actions.single_target+=/howling_blast,if=!talent.necrotic_plague.enabled&!dot.frost_fever.ticking
actions.single_target+=/howling_blast,if=talent.necrotic_plague.enabled&!dot.necrotic_plague.ticking
actions.single_target+=/plague_strike,if=!talent.necrotic_plague.enabled&!dot.blood_plague.ticking&unholy>0
actions.single_target+=/howling_blast,if=buff.rime.react
actions.single_target+=/frost_strike,if=set_bonus.tier17_2pc=1&(runic_power>=50&(cooldown.pillar_of_frost.remains<5))
actions.single_target+=/frost_strike,if=runic_power>76
actions.single_target+=/obliterate,if=unholy>0&!buff.killing_machine.react
actions.single_target+=/howling_blast,if=!(target.health.pct-3*(target.health.pct%target.time_to_die)<=35&cooldown.soul_reaper.remains<3)|death+frost>=2
actions.single_target+=/blood_tap
actions.single_target+=/plague_leech
actions.single_target+=/empower_rune_weapon

actions.bos_aoe=howling_blast
actions.bos_aoe+=/blood_tap,if=buff.blood_charge.stack>10
actions.bos_aoe+=/death_and_decay,if=unholy=1
actions.bos_aoe+=/plague_strike,if=unholy=2
actions.bos_aoe+=/blood_tap
actions.bos_aoe+=/plague_leech
actions.bos_aoe+=/plague_strike,if=unholy=1
actions.bos_aoe+=/empower_rune_weapon

actions.bos_st=obliterate,if=buff.killing_machine.react
actions.bos_st+=/blood_tap,if=buff.killing_machine.react&buff.blood_charge.stack>=5
actions.bos_st+=/plague_leech,if=buff.killing_machine.react
actions.bos_st+=/howling_blast,if=runic_power<88
actions.bos_st+=/obliterate,if=unholy>0&runic_power<76
actions.bos_st+=/blood_tap,if=buff.blood_charge.stack>=5
actions.bos_st+=/plague_leech
actions.bos_st+=/empower_rune_weapon

head=ogreskull_boneplate_greathelm,id=115539,bonus_id=567
neck=thogars_serrated_chain,id=113959,bonus_id=567,enchant=gift_of_mastery
shoulders=overdriven_spaulders,id=113990,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_mastery
chest=ogreskull_boneplate_breastplate,id=115537,bonus_id=567
wrists=bracers_of_martial_perfection,id=113871,bonus_id=567
hands=ogreskull_boneplate_gauntlets,id=115538,bonus_id=567
waist=ironcrushers_collar,id=113950,bonus_id=567
legs=ogreskull_boneplate_greaves,id=115535,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_mastery
finger2=phosphorescent_seal,id=113866,bonus_id=567,enchant=gift_of_mastery
trinket1=horn_of_screaming_spirits,id=119193,bonus_id=567
trinket2=vial_of_convulsive_shadows,id=113969,bonus_id=567
main_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=rune_of_the_fallen_crusader
off_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=rune_of_razorice

# Gear Summary
# gear_ilvl=700.94
# gear_strength=3945
# gear_stamina=4694
# gear_crit_rating=629
# gear_haste_rating=646
# gear_mastery_rating=1394
# gear_armor=2287
# gear_multistrike_rating=1456
# gear_versatility_rating=267
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Death_Knight_Frost_2h_T17M.simc"] = [[
deathknight="Death_Knight_Frost_2h_T17M"
level=100
race=orc
role=attack
position=back
talents=2001002
spec=frost

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_strength_flask
actions.precombat+=/food,type=buttered_sturgeon
actions.precombat+=/horn_of_winter
actions.precombat+=/frost_presence
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/army_of_the_dead
actions.precombat+=/potion,name=draenic_strength
actions.precombat+=/pillar_of_frost

# Executed every time the actor is available.

actions=auto_attack
actions+=/deaths_advance,if=movement.remains>2
actions+=/antimagic_shell,damage=100000,if=((dot.breath_of_sindragosa.ticking&runic_power<25)|cooldown.breath_of_sindragosa.remains>40)|!talent.breath_of_sindragosa.enabled
actions+=/pillar_of_frost
actions+=/potion,name=draenic_strength,if=target.time_to_die<=30|(target.time_to_die<=60&buff.pillar_of_frost.up)
actions+=/empower_rune_weapon,if=target.time_to_die<=60&buff.potion.up
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/use_item,slot=trinket2
actions+=/run_action_list,name=aoe,if=active_enemies>=4
actions+=/run_action_list,name=single_target,if=active_enemies<4

actions.aoe=unholy_blight
actions.aoe+=/blood_boil,if=dot.blood_plague.ticking&(!talent.unholy_blight.enabled|cooldown.unholy_blight.remains<49),line_cd=28
actions.aoe+=/defile
actions.aoe+=/breath_of_sindragosa,if=runic_power>75
actions.aoe+=/run_action_list,name=bos_aoe,if=dot.breath_of_sindragosa.ticking
actions.aoe+=/howling_blast
actions.aoe+=/blood_tap,if=buff.blood_charge.stack>10
actions.aoe+=/frost_strike,if=runic_power>88
actions.aoe+=/death_and_decay,if=unholy=1
actions.aoe+=/plague_strike,if=unholy=2
actions.aoe+=/blood_tap
actions.aoe+=/frost_strike,if=!talent.breath_of_sindragosa.enabled|cooldown.breath_of_sindragosa.remains>=10
actions.aoe+=/plague_leech
actions.aoe+=/plague_strike,if=unholy=1
actions.aoe+=/empower_rune_weapon

actions.single_target=plague_leech,if=disease.min_remains<1
actions.single_target+=/soul_reaper,if=target.health.pct-3*(target.health.pct%target.time_to_die)<=35
actions.single_target+=/blood_tap,if=(target.health.pct-3*(target.health.pct%target.time_to_die)<=35&cooldown.soul_reaper.remains=0)
actions.single_target+=/defile
actions.single_target+=/blood_tap,if=talent.defile.enabled&cooldown.defile.remains=0
actions.single_target+=/howling_blast,if=buff.rime.react&disease.min_remains>5&buff.killing_machine.react
actions.single_target+=/obliterate,if=buff.killing_machine.react
actions.single_target+=/blood_tap,if=buff.killing_machine.react
actions.single_target+=/howling_blast,if=!talent.necrotic_plague.enabled&!dot.frost_fever.ticking&buff.rime.react
actions.single_target+=/outbreak,if=!disease.max_ticking
actions.single_target+=/unholy_blight,if=!disease.min_ticking
actions.single_target+=/breath_of_sindragosa,if=runic_power>75
actions.single_target+=/run_action_list,name=bos_st,if=dot.breath_of_sindragosa.ticking
actions.single_target+=/obliterate,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains<7&runic_power<76
actions.single_target+=/howling_blast,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains<3&runic_power<88
actions.single_target+=/howling_blast,if=!talent.necrotic_plague.enabled&!dot.frost_fever.ticking
actions.single_target+=/howling_blast,if=talent.necrotic_plague.enabled&!dot.necrotic_plague.ticking
actions.single_target+=/plague_strike,if=!talent.necrotic_plague.enabled&!dot.blood_plague.ticking
actions.single_target+=/blood_tap,if=buff.blood_charge.stack>10&runic_power>76
actions.single_target+=/frost_strike,if=runic_power>76
actions.single_target+=/howling_blast,if=buff.rime.react&disease.min_remains>5&(blood.frac>=1.8|unholy.frac>=1.8|frost.frac>=1.8)
actions.single_target+=/obliterate,if=blood.frac>=1.8|unholy.frac>=1.8|frost.frac>=1.8
actions.single_target+=/plague_leech,if=disease.min_remains<3&((blood.frac<=0.95&unholy.frac<=0.95)|(frost.frac<=0.95&unholy.frac<=0.95)|(frost.frac<=0.95&blood.frac<=0.95))
actions.single_target+=/frost_strike,if=talent.runic_empowerment.enabled&(frost=0|unholy=0|blood=0)&(!buff.killing_machine.react|!obliterate.ready_in<=1)
actions.single_target+=/frost_strike,if=talent.blood_tap.enabled&buff.blood_charge.stack<=10&(!buff.killing_machine.react|!obliterate.ready_in<=1)
actions.single_target+=/howling_blast,if=buff.rime.react&disease.min_remains>5
actions.single_target+=/obliterate,if=blood.frac>=1.5|unholy.frac>=1.6|frost.frac>=1.6|buff.bloodlust.up|cooldown.plague_leech.remains<=4
actions.single_target+=/blood_tap,if=(buff.blood_charge.stack>10&runic_power>=20)|(blood.frac>=1.4|unholy.frac>=1.6|frost.frac>=1.6)
actions.single_target+=/frost_strike,if=!buff.killing_machine.react
actions.single_target+=/plague_leech,if=(blood.frac<=0.95&unholy.frac<=0.95)|(frost.frac<=0.95&unholy.frac<=0.95)|(frost.frac<=0.95&blood.frac<=0.95)
actions.single_target+=/empower_rune_weapon

actions.bos_aoe=howling_blast
actions.bos_aoe+=/blood_tap,if=buff.blood_charge.stack>10
actions.bos_aoe+=/death_and_decay,if=unholy=1
actions.bos_aoe+=/plague_strike,if=unholy=2
actions.bos_aoe+=/blood_tap
actions.bos_aoe+=/plague_leech
actions.bos_aoe+=/plague_strike,if=unholy=1
actions.bos_aoe+=/empower_rune_weapon

actions.bos_st=obliterate,if=buff.killing_machine.react
actions.bos_st+=/blood_tap,if=buff.killing_machine.react&buff.blood_charge.stack>=5
actions.bos_st+=/plague_leech,if=buff.killing_machine.react
actions.bos_st+=/blood_tap,if=buff.blood_charge.stack>=5
actions.bos_st+=/plague_leech
actions.bos_st+=/obliterate,if=runic_power<76
actions.bos_st+=/howling_blast,if=((death=1&frost=0&unholy=0)|death=0&frost=1&unholy=0)&runic_power<88

head=ogreskull_boneplate_greathelm,id=115539,bonus_id=567
neck=vertebrae_protector,id=113900,bonus_id=567,enchant=gift_of_haste
shoulders=ogreskull_boneplate_pauldrons,id=115536,bonus_id=567
back=charbreath_firecloak,id=113916,bonus_id=567,enchant=gift_of_haste
chest=ogreskull_boneplate_breastplate,id=115537,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=ogreskull_boneplate_gauntlets,id=115538,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=firestorm_legplates,id=113921,bonus_id=567
feet=iron_bellow_sabatons,id=113961,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_haste
finger2=phosphorescent_seal,id=113866,bonus_id=567,enchant=gift_of_haste
trinket1=forgemasters_insignia,id=113983,bonus_id=567
trinket2=vial_of_convulsive_shadows,id=113969,bonus_id=567
main_hand=thogars_control_rod,id=113953,bonus_id=567,enchant=rune_of_the_fallen_crusader

# Gear Summary
# gear_ilvl=701.00
# gear_strength=4062
# gear_stamina=4763
# gear_crit_rating=681
# gear_haste_rating=2008
# gear_mastery_rating=707
# gear_armor=2287
# gear_multistrike_rating=769
# gear_versatility_rating=238
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Death_Knight_Unholy_T17M.simc"] = [[
deathknight="Death_Knight_Unholy_T17M"
level=100
race=blood_elf
role=attack
position=back
talents=2001003
talent_override=unholy_blight,if=raid_event.adds.count>=1|enemies>1
talent_override=necrotic_plague,if=raid_event.adds.count>=1|enemies>1
spec=unholy

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_strength_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/horn_of_winter
actions.precombat+=/unholy_presence
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/army_of_the_dead
actions.precombat+=/potion,name=draenic_strength
actions.precombat+=/raise_dead

# Executed every time the actor is available.

actions=auto_attack
actions+=/deaths_advance,if=movement.remains>2
actions+=/antimagic_shell,damage=100000,if=((dot.breath_of_sindragosa.ticking&runic_power<25)|cooldown.breath_of_sindragosa.remains>40)|!talent.breath_of_sindragosa.enabled
actions+=/blood_fury,if=!talent.breath_of_sindragosa.enabled
actions+=/berserking,if=!talent.breath_of_sindragosa.enabled
actions+=/arcane_torrent,if=!talent.breath_of_sindragosa.enabled
actions+=/use_item,slot=trinket2,if=!talent.breath_of_sindragosa.enabled
actions+=/potion,name=draenic_strength,if=(buff.convulsive_shadows.up&target.health.pct<45)&!talent.breath_of_sindragosa.enabled
actions+=/potion,name=draenic_strength,if=(buff.dark_transformation.up&target.time_to_die<=60)&!talent.breath_of_sindragosa.enabled
actions+=/run_action_list,name=unholy

actions.unholy=plague_leech,if=((cooldown.outbreak.remains<1)|disease.min_remains<1)&((blood<1&frost<1)|(blood<1&unholy<1)|(frost<1&unholy<1))
actions.unholy+=/soul_reaper,if=(target.health.pct-3*(target.health.pct%target.time_to_die))<=45
actions.unholy+=/blood_tap,if=((target.health.pct-3*(target.health.pct%target.time_to_die))<=45)&cooldown.soul_reaper.remains=0
actions.unholy+=/summon_gargoyle
actions.unholy+=/breath_of_sindragosa,if=runic_power>75
actions.unholy+=/run_action_list,name=bos,if=dot.breath_of_sindragosa.ticking
actions.unholy+=/unholy_blight,if=!disease.min_ticking
actions.unholy+=/outbreak,cycle_targets=1,if=(active_enemies>=1&!talent.necrotic_plague.enabled)&(!(dot.blood_plague.ticking|dot.frost_fever.ticking))
actions.unholy+=/plague_strike,if=(!talent.necrotic_plague.enabled&!(dot.blood_plague.ticking|dot.frost_fever.ticking))|(talent.necrotic_plague.enabled&!dot.necrotic_plague.ticking)
actions.unholy+=/blood_boil,cycle_targets=1,if=(active_enemies>1&!talent.necrotic_plague.enabled)&(!(dot.blood_plague.ticking|dot.frost_fever.ticking))
actions.unholy+=/death_and_decay,if=active_enemies>1&unholy>1
actions.unholy+=/defile,if=unholy=2
actions.unholy+=/blood_tap,if=talent.defile.enabled&cooldown.defile.remains=0
actions.unholy+=/scourge_strike,if=unholy=2
actions.unholy+=/festering_strike,if=talent.necrotic_plague.enabled&talent.unholy_blight.enabled&dot.necrotic_plague.remains<cooldown.unholy_blight.remains%2
actions.unholy+=/dark_transformation
actions.unholy+=/festering_strike,if=blood=2&frost=2&(((Frost-death)>0)|((Blood-death)>0))
actions.unholy+=/festering_strike,if=(blood=2|frost=2)&(((Frost-death)>0)&((Blood-death)>0))
actions.unholy+=/blood_boil,cycle_targets=1,if=(talent.necrotic_plague.enabled&!dot.necrotic_plague.ticking)&active_enemies>1
actions.unholy+=/defile,if=blood=2|frost=2
actions.unholy+=/death_and_decay,if=active_enemies>1
actions.unholy+=/defile
actions.unholy+=/blood_boil,if=talent.breath_of_sindragosa.enabled&((active_enemies>=4&(blood=2|(frost=2&death=2)))&(cooldown.breath_of_sindragosa.remains>6|runic_power<75))
actions.unholy+=/blood_boil,if=!talent.breath_of_sindragosa.enabled&(active_enemies>=4&(blood=2|(frost=2&death=2)))
actions.unholy+=/blood_tap,if=buff.blood_charge.stack>10
actions.unholy+=/outbreak,if=talent.necrotic_plague.enabled&debuff.necrotic_plague.stack<=14
actions.unholy+=/death_coil,if=(buff.sudden_doom.react|runic_power>80)&(buff.blood_charge.stack<=10)
actions.unholy+=/blood_boil,if=(active_enemies>=4&(cooldown.breath_of_sindragosa.remains>6|runic_power<75))|(!talent.breath_of_sindragosa.enabled&active_enemies>=4)
actions.unholy+=/scourge_strike,if=(cooldown.breath_of_sindragosa.remains>6|runic_power<75|unholy=2)|!talent.breath_of_sindragosa.enabled
actions.unholy+=/festering_strike,if=(cooldown.breath_of_sindragosa.remains>6|runic_power<75)|!talent.breath_of_sindragosa.enabled
actions.unholy+=/death_coil,if=(cooldown.breath_of_sindragosa.remains>20)|!talent.breath_of_sindragosa.enabled
actions.unholy+=/plague_leech
actions.unholy+=/empower_rune_weapon,if=!talent.breath_of_sindragosa.enabled

actions.bos=blood_fury,if=dot.breath_of_sindragosa.ticking
actions.bos+=/berserking,if=dot.breath_of_sindragosa.ticking
actions.bos+=/use_item,slot=trinket2,if=dot.breath_of_sindragosa.ticking
actions.bos+=/potion,name=draenic_strength,if=dot.breath_of_sindragosa.ticking
actions.bos+=/unholy_blight,if=!disease.ticking
actions.bos+=/plague_strike,if=!disease.ticking
actions.bos+=/blood_boil,cycle_targets=1,if=(active_enemies>=2&!(dot.blood_plague.ticking|dot.frost_fever.ticking))|active_enemies>=4&(runic_power<88&runic_power>30)
actions.bos+=/death_and_decay,if=active_enemies>=2&(runic_power<88&runic_power>30)
actions.bos+=/festering_strike,if=(blood=2&frost=2&(((Frost-death)>0)|((Blood-death)>0)))&runic_power<80
actions.bos+=/festering_strike,if=((blood=2|frost=2)&(((Frost-death)>0)&((Blood-death)>0)))&runic_power<80
actions.bos+=/arcane_torrent,if=runic_power<70
actions.bos+=/scourge_strike,if=active_enemies<=3&(runic_power<88&runic_power>30)
actions.bos+=/blood_boil,if=active_enemies>=4&(runic_power<88&runic_power>30)
actions.bos+=/festering_strike,if=runic_power<77
actions.bos+=/scourge_strike,if=(active_enemies>=4&(runic_power<88&runic_power>30))|active_enemies<=3
actions.bos+=/dark_transformation
actions.bos+=/blood_tap,if=buff.blood_charge.stack>=5
actions.bos+=/plague_leech
actions.bos+=/empower_rune_weapon,if=runic_power<60
actions.bos+=/death_coil,if=buff.sudden_doom.react

head=ogreskull_boneplate_greathelm,id=115539,bonus_id=567
neck=thogars_serrated_chain,id=113959,bonus_id=567,enchant=gift_of_multistrike
shoulders=overdriven_spaulders,id=113990,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_multistrike
chest=ogreskull_boneplate_breastplate,id=115537,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=ogreskull_boneplate_gauntlets,id=115538,bonus_id=567
waist=ironcrushers_collar,id=113950,bonus_id=567
legs=ogreskull_boneplate_greaves,id=115535,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant_id=5327
finger2=phosphorescent_seal,id=113866,bonus_id=567,enchant_id=5327
trinket1=forgemasters_insignia,id=113983,bonus_id=567
trinket2=vial_of_convulsive_shadows,id=113969,bonus_id=567
main_hand=kagrazs_burning_blade,id=113913,bonus_id=567,enchant=rune_of_the_fallen_crusader

# Gear Summary
# gear_ilvl=701.00
# gear_strength=4062
# gear_stamina=4763
# gear_crit_rating=629
# gear_haste_rating=594
# gear_mastery_rating=964
# gear_armor=2287
# gear_multistrike_rating=2099
# gear_versatility_rating=153
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Druid_Balance_T17M.simc"] = [[
druid="Druid_Balance_T17M"
level=100
race=troll
role=spell
position=back
talents=0101001
spec=balance

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/mark_of_the_wild,if=!aura.str_agi_int.up
actions.precombat+=/moonkin_form
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/incarnation
actions.precombat+=/starfire

# Executed every time the actor is available.

actions=potion,name=draenic_intellect,if=buff.celestial_alignment.up
actions+=/blood_fury,if=buff.celestial_alignment.up
actions+=/berserking,if=buff.celestial_alignment.up
actions+=/arcane_torrent,if=buff.celestial_alignment.up
actions+=/force_of_nature,if=trinket.stat.intellect.up|charges=3|target.time_to_die<21
actions+=/call_action_list,name=single_target,if=active_enemies=1
actions+=/call_action_list,name=aoe,if=active_enemies>1

actions.single_target=starsurge,if=buff.lunar_empowerment.down&eclipse_energy>20
actions.single_target+=/starsurge,if=buff.solar_empowerment.down&eclipse_energy<-40
actions.single_target+=/starsurge,if=(charges=2&recharge_time<6)|charges=3
actions.single_target+=/celestial_alignment,if=eclipse_energy>40
actions.single_target+=/incarnation,if=eclipse_energy>0
actions.single_target+=/sunfire,if=remains<7|(buff.solar_peak.up&!talent.balance_of_power.enabled)
actions.single_target+=/stellar_flare,if=remains<7
actions.single_target+=/moonfire,if=!talent.balance_of_power.enabled&(buff.lunar_peak.up&remains<eclipse_change+20|remains<4|(buff.celestial_alignment.up&buff.celestial_alignment.remains<=2&remains<eclipse_change+20))
actions.single_target+=/moonfire,if=talent.balance_of_power.enabled&(remains<4|(buff.celestial_alignment.up&buff.celestial_alignment.remains<=2&remains<eclipse_change+20))
actions.single_target+=/wrath,if=(eclipse_energy<=0&eclipse_change>cast_time)|(eclipse_energy>0&cast_time>eclipse_change)
actions.single_target+=/starfire,if=(eclipse_energy>=0&eclipse_change>cast_time)|(eclipse_energy<0&cast_time>eclipse_change)
actions.single_target+=/wrath

actions.aoe=celestial_alignment,if=lunar_max<8|target.time_to_die<20
actions.aoe+=/incarnation,if=buff.celestial_alignment.up
actions.aoe+=/sunfire,cycle_targets=1,if=remains<8
actions.aoe+=/starfall,if=!buff.starfall.up&active_enemies>2
actions.aoe+=/starsurge,if=(charges=2&recharge_time<6)|charges=3
actions.aoe+=/moonfire,cycle_targets=1,if=remains<12
actions.aoe+=/stellar_flare,cycle_targets=1,if=remains<7
actions.aoe+=/starsurge,if=buff.lunar_empowerment.down&eclipse_energy>20&active_enemies=2
actions.aoe+=/starsurge,if=buff.solar_empowerment.down&eclipse_energy<-40&active_enemies=2
actions.aoe+=/wrath,if=(eclipse_energy<=0&eclipse_change>cast_time)|(eclipse_energy>0&cast_time>eclipse_change)
actions.aoe+=/starfire,if=(eclipse_energy>=0&eclipse_change>cast_time)|(eclipse_energy<0&cast_time>eclipse_change)
actions.aoe+=/wrath

head=living_wood_headpiece,id=115542,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant=gift_of_critical_strike
shoulders=living_wood_spaulders,id=115544,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant=gift_of_critical_strike
chest=living_wood_raiment,id=115540,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=cannonball_loaders_grips,id=113949,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=living_wood_legguards,id=115543,bonus_id=567
feet=ironflecked_sandals,id=119340,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_critical_strike
finger2=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant=gift_of_critical_strike
trinket1=goren_soul_repository,id=119194,bonus_id=567
trinket2=darmacs_unstable_talisman,id=113948,bonus_id=567
main_hand=blackhand_doomstaff,id=113988,bonus_id=567,enchant=mark_of_the_thunderlord

# Gear Summary
# gear_ilvl=701.00
# gear_stamina=4763
# gear_intellect=3923
# gear_spell_power=1837
# gear_crit_rating=1303
# gear_haste_rating=912
# gear_mastery_rating=1506
# gear_armor=1177
# gear_multistrike_rating=609
# gear_versatility_rating=108
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Druid_Feral_T17M.simc"] = [[
druid="Druid_Feral_T17M"
level=100
race=night_elf
role=attack
position=back
talents=3002002
glyphs=savage_roar
spec=feral

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=pickled_eel
actions.precombat+=/mark_of_the_wild,if=!aura.str_agi_int.up
actions.precombat+=/healing_touch,if=talent.bloodtalons.enabled
actions.precombat+=/cat_form
actions.precombat+=/prowl
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_agility

# Executed every time the actor is available.

actions=cat_form
actions+=/wild_charge
actions+=/displacer_beast,if=movement.distance>10
actions+=/dash,if=movement.distance&buff.displacer_beast.down&buff.wild_charge_movement.down
actions+=/rake,if=buff.prowl.up|buff.shadowmeld.up
actions+=/auto_attack
actions+=/skull_bash
actions+=/force_of_nature,if=charges=3|trinket.proc.all.react|target.time_to_die<20
actions+=/berserk,if=((!t18_class_trinket&buff.tigers_fury.up)|(t18_class_trinket&energy.time_to_max<2))&(buff.incarnation.up|!talent.incarnation_king_of_the_jungle.enabled)
actions+=/use_item,slot=trinket1,if=(prev.tigers_fury&(target.time_to_die>trinket.stat.any.cooldown|target.time_to_die<45))|prev.berserk|(buff.incarnation.up&time<10)
actions+=/potion,name=draenic_agility,if=(buff.berserk.remains>10&(target.time_to_die<180|(trinket.proc.all.react&target.health.pct<25)))|target.time_to_die<=40
actions+=/blood_fury,sync=tigers_fury
actions+=/berserking,sync=tigers_fury
actions+=/arcane_torrent,sync=tigers_fury
actions+=/tigers_fury,if=(!t18_class_trinket|cooldown.berserk.remains)&((!buff.omen_of_clarity.react&energy.max-energy>=60)|energy.max-energy>=80)
actions+=/incarnation,if=!t18_class_trinket&cooldown.berserk.remains<10&energy.time_to_max>1
actions+=/incarnation,if=t18_class_trinket&cooldown.berserk.remains<1&energy.time_to_max<3
actions+=/shadowmeld,if=dot.rake.remains<4.5&energy>=35&dot.rake.pmultiplier<2&(buff.bloodtalons.up|!talent.bloodtalons.enabled)&(!talent.incarnation.enabled|cooldown.incarnation.remains>15)&!buff.incarnation.up
# Keep Rip from falling off during execute range.
actions+=/ferocious_bite,cycle_targets=1,if=dot.rip.ticking&dot.rip.remains<3&target.health.pct<25
actions+=/healing_touch,if=talent.bloodtalons.enabled&buff.predatory_swiftness.up&(combo_points>=4|buff.predatory_swiftness.remains<1.5)
actions+=/savage_roar,if=buff.savage_roar.down
actions+=/pool_resource,for_next=1
actions+=/thrash_cat,cycle_targets=1,if=remains<4.5&(active_enemies>=2&set_bonus.tier17_2pc|active_enemies>=4)
actions+=/call_action_list,name=finisher,if=combo_points=5
actions+=/savage_roar,if=buff.savage_roar.remains<gcd
actions+=/pool_resource,if=t18_class_trinket&!buff.omen_of_clarity.react&cooldown.berserk.remains*energy.regen+energy<energy.max
actions+=/call_action_list,name=maintain,if=combo_points<5
actions+=/pool_resource,for_next=1
actions+=/thrash_cat,cycle_targets=1,if=remains<4.5&active_enemies>=2
actions+=/call_action_list,name=generator,if=combo_points<5

actions.finisher=rip,cycle_targets=1,if=remains<2&target.time_to_die-remains>18&(target.health.pct>25|!dot.rip.ticking)
actions.finisher+=/ferocious_bite,cycle_targets=1,max_energy=1,if=target.health.pct<25&dot.rip.ticking
actions.finisher+=/rip,cycle_targets=1,if=remains<7.2&persistent_multiplier>dot.rip.pmultiplier&target.time_to_die-remains>18
actions.finisher+=/rip,cycle_targets=1,if=remains<7.2&persistent_multiplier=dot.rip.pmultiplier&(energy.time_to_max<=1|!talent.bloodtalons.enabled)&target.time_to_die-remains>18
actions.finisher+=/savage_roar,if=((set_bonus.tier18_4pc&energy>50)|(set_bonus.tier18_2pc&buff.omen_of_clarity.react)|energy.time_to_max<=1|buff.berserk.up|cooldown.tigers_fury.remains<3)&buff.savage_roar.remains<12.6
actions.finisher+=/ferocious_bite,max_energy=1,if=(set_bonus.tier18_4pc&energy>50)|(set_bonus.tier18_2pc&buff.omen_of_clarity.react)|energy.time_to_max<=1|buff.berserk.up|cooldown.tigers_fury.remains<3

actions.maintain=rake,cycle_targets=1,if=remains<3&((target.time_to_die-remains>3&active_enemies<3)|target.time_to_die-remains>6)
actions.maintain+=/rake,cycle_targets=1,if=remains<4.5&(persistent_multiplier>=dot.rake.pmultiplier|(talent.bloodtalons.enabled&(buff.bloodtalons.up|!buff.predatory_swiftness.up)))&((target.time_to_die-remains>3&active_enemies<3)|target.time_to_die-remains>6)
actions.maintain+=/moonfire_cat,cycle_targets=1,if=remains<4.2&active_enemies<=5&target.time_to_die-remains>tick_time*5
actions.maintain+=/rake,cycle_targets=1,if=persistent_multiplier>dot.rake.pmultiplier&active_enemies=1&((target.time_to_die-remains>3&active_enemies<3)|target.time_to_die-remains>6)

actions.generator=swipe,if=active_enemies>=4|(active_enemies>=3&buff.incarnation.down)
actions.generator+=/shred,if=active_enemies<3|(active_enemies=3&buff.incarnation.up)

head=acidic_jaws,id=113880,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant=gift_of_critical_strike
shoulders=living_wood_spaulders,id=115544,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_critical_strike
chest=living_wood_raiment,id=115540,bonus_id=567
wrists=bracers_of_shattered_limbs,id=119333,bonus_id=567
hands=living_wood_grips,id=115541,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=living_wood_legguards,id=115543,bonus_id=567
feet=furnace_tenders_treads,id=113895,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_critical_strike
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_critical_strike
trinket1=beating_heart_of_the_mountain,id=113931,bonus_id=567
trinket2=humming_blackiron_trigger,id=113985,bonus_id=567
main_hand=talrak_bloody_skull_of_the_thunderlords,id=113939,bonus_id=567,enchant=mark_of_the_thunderlord

# Gear Summary
# gear_ilvl=701.00
# gear_agility=4011
# gear_stamina=4763
# gear_crit_rating=1865
# gear_haste_rating=355
# gear_mastery_rating=563
# gear_armor=1177
# gear_multistrike_rating=1201
# gear_versatility_rating=476
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Druid_Feral_T17M_AoE.simc"] = [[
druid="Druid_Feral_T17M_AoE"
level=100
race=night_elf
role=attack
position=back
talents=3002002
glyphs=savage_roar
spec=feral

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=pickled_eel
actions.precombat+=/mark_of_the_wild,if=!aura.str_agi_int.up
actions.precombat+=/healing_touch,if=talent.bloodtalons.enabled
actions.precombat+=/cat_form
actions.precombat+=/prowl
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_agility

# Executed every time the actor is available.

actions=cat_form
actions+=/wild_charge
actions+=/displacer_beast,if=movement.distance>10
actions+=/dash,if=movement.distance&buff.displacer_beast.down&buff.wild_charge_movement.down
actions+=/rake,if=buff.prowl.up|buff.shadowmeld.up
actions+=/auto_attack
actions+=/skull_bash
actions+=/force_of_nature,if=charges=3|trinket.proc.all.react|target.time_to_die<20
actions+=/berserk,if=((!t18_class_trinket&buff.tigers_fury.up)|(t18_class_trinket&energy.time_to_max<2))&(buff.incarnation.up|!talent.incarnation_king_of_the_jungle.enabled)
actions+=/use_item,slot=trinket2,if=(prev.tigers_fury&(target.time_to_die>trinket.stat.any.cooldown|target.time_to_die<45))|prev.berserk|(buff.incarnation.up&time<10)
actions+=/potion,name=draenic_agility,if=(buff.berserk.remains>10&(target.time_to_die<180|(trinket.proc.all.react&target.health.pct<25)))|target.time_to_die<=40
actions+=/blood_fury,sync=tigers_fury
actions+=/berserking,sync=tigers_fury
actions+=/arcane_torrent,sync=tigers_fury
actions+=/tigers_fury,if=(!t18_class_trinket|cooldown.berserk.remains)&((!buff.omen_of_clarity.react&energy.max-energy>=60)|energy.max-energy>=80)
actions+=/incarnation,if=!t18_class_trinket&cooldown.berserk.remains<10&energy.time_to_max>1
actions+=/incarnation,if=t18_class_trinket&cooldown.berserk.remains<1&energy.time_to_max<3
actions+=/shadowmeld,if=dot.rake.remains<4.5&energy>=35&dot.rake.pmultiplier<2&(buff.bloodtalons.up|!talent.bloodtalons.enabled)&(!talent.incarnation.enabled|cooldown.incarnation.remains>15)&!buff.incarnation.up
# Keep Rip from falling off during execute range.
actions+=/ferocious_bite,cycle_targets=1,if=dot.rip.ticking&dot.rip.remains<3&target.health.pct<25
actions+=/healing_touch,if=talent.bloodtalons.enabled&buff.predatory_swiftness.up&(combo_points>=4|buff.predatory_swiftness.remains<1.5)
actions+=/savage_roar,if=buff.savage_roar.down
actions+=/pool_resource,for_next=1
actions+=/thrash_cat,cycle_targets=1,if=remains<4.5&(active_enemies>=2&set_bonus.tier17_2pc|active_enemies>=4)
actions+=/call_action_list,name=finisher,if=combo_points=5
actions+=/savage_roar,if=buff.savage_roar.remains<gcd
actions+=/pool_resource,if=t18_class_trinket&!buff.omen_of_clarity.react&cooldown.berserk.remains*energy.regen+energy<energy.max
actions+=/call_action_list,name=maintain,if=combo_points<5
actions+=/pool_resource,for_next=1
actions+=/thrash_cat,cycle_targets=1,if=remains<4.5&active_enemies>=2
actions+=/call_action_list,name=generator,if=combo_points<5

actions.finisher=rip,cycle_targets=1,if=remains<2&target.time_to_die-remains>18&(target.health.pct>25|!dot.rip.ticking)
actions.finisher+=/ferocious_bite,cycle_targets=1,max_energy=1,if=target.health.pct<25&dot.rip.ticking
actions.finisher+=/rip,cycle_targets=1,if=remains<7.2&persistent_multiplier>dot.rip.pmultiplier&target.time_to_die-remains>18
actions.finisher+=/rip,cycle_targets=1,if=remains<7.2&persistent_multiplier=dot.rip.pmultiplier&(energy.time_to_max<=1|!talent.bloodtalons.enabled)&target.time_to_die-remains>18
actions.finisher+=/savage_roar,if=((set_bonus.tier18_4pc&energy>50)|(set_bonus.tier18_2pc&buff.omen_of_clarity.react)|energy.time_to_max<=1|buff.berserk.up|cooldown.tigers_fury.remains<3)&buff.savage_roar.remains<12.6
actions.finisher+=/ferocious_bite,max_energy=1,if=(set_bonus.tier18_4pc&energy>50)|(set_bonus.tier18_2pc&buff.omen_of_clarity.react)|energy.time_to_max<=1|buff.berserk.up|cooldown.tigers_fury.remains<3

actions.maintain=rake,cycle_targets=1,if=remains<3&((target.time_to_die-remains>3&active_enemies<3)|target.time_to_die-remains>6)
actions.maintain+=/rake,cycle_targets=1,if=remains<4.5&(persistent_multiplier>=dot.rake.pmultiplier|(talent.bloodtalons.enabled&(buff.bloodtalons.up|!buff.predatory_swiftness.up)))&((target.time_to_die-remains>3&active_enemies<3)|target.time_to_die-remains>6)
actions.maintain+=/moonfire_cat,cycle_targets=1,if=remains<4.2&active_enemies<=5&target.time_to_die-remains>tick_time*5
actions.maintain+=/rake,cycle_targets=1,if=persistent_multiplier>dot.rake.pmultiplier&active_enemies=1&((target.time_to_die-remains>3&active_enemies<3)|target.time_to_die-remains>6)

actions.generator=swipe,if=active_enemies>=4|(active_enemies>=3&buff.incarnation.down)
actions.generator+=/shred,if=active_enemies<3|(active_enemies=3&buff.incarnation.up)

head=sorkas_nightshade_cowl,id=113978,bonus_id=567
neck=engineers_grounded_gorget,id=113892,bonus_id=567,enchant=gift_of_mastery
shoulders=living_wood_spaulders,id=115544,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_mastery
chest=living_wood_raiment,id=115540,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=living_wood_grips,id=115541,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=living_wood_legguards,id=115543,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_mastery
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_mastery
trinket1=humming_blackiron_trigger,id=113985,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
main_hand=headlopper_skullscythe,id=119448,bonus_id=567,enchant_id=mark_of_bleeding_hollow

# Gear Summary
# gear_ilvl=701.00
# gear_agility=4011
# gear_stamina=4763
# gear_crit_rating=963
# gear_haste_rating=355
# gear_mastery_rating=1625
# gear_armor=1177
# gear_multistrike_rating=1379
# gear_versatility_rating=128
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Druid_Guardian_T17M.simc"] = [[
druid="Druid_Guardian_T17M"
level=100
race=night_elf
role=tank
position=front
talents=0301022
spec=guardian

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/mark_of_the_wild,if=!aura.str_agi_int.up
actions.precombat+=/bear_form
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/cenarion_ward

# Executed every time the actor is available.

actions=auto_attack
actions+=/skull_bash
actions+=/savage_defense,if=buff.barkskin.down
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/use_item,slot=trinket2
actions+=/barkskin,if=buff.bristling_fur.down
actions+=/bristling_fur,if=buff.barkskin.down&buff.savage_defense.down
actions+=/maul,if=buff.tooth_and_claw.react&incoming_damage_1s
actions+=/berserk,if=buff.pulverize.remains>10
actions+=/frenzied_regeneration,if=rage>=80
actions+=/cenarion_ward
actions+=/renewal,if=health.pct<30
actions+=/heart_of_the_wild
actions+=/rejuvenation,if=buff.heart_of_the_wild.up&remains<=3.6
actions+=/natures_vigil
actions+=/healing_touch,if=buff.dream_of_cenarius.react&health.pct<30
actions+=/pulverize,if=buff.pulverize.remains<=3.6
actions+=/lacerate,if=talent.pulverize.enabled&buff.pulverize.remains<=(3-dot.lacerate.stack)*gcd&buff.berserk.down
actions+=/incarnation
actions+=/lacerate,if=!ticking
actions+=/thrash_bear,if=!ticking
actions+=/mangle
actions+=/thrash_bear,if=remains<=4.8
actions+=/lacerate

head=sorkas_nightshade_cowl,id=113978,bonus_id=567
neck=choker_of_bestial_force,id=113952,bonus_id=567,enchant=gift_of_mastery
shoulders=living_wood_spaulders,id=115544,bonus_id=567
back=gronnstitched_greatcloak,id=113873,bonus_id=567,enchant=gift_of_mastery
chest=unrendable_wolfhide_robes,id=113951,bonus_id=567
wrists=squires_electroplated_bracers,id=113962,bonus_id=567
hands=cannonball_loaders_grips,id=113949,bonus_id=567
waist=girdle_of_unconquered_glory,id=113907,bonus_id=567
legs=living_wood_legguards,id=115543,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_mastery
finger2=stonefist_band,id=113938,bonus_id=567,enchant=gift_of_mastery
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
main_hand=earthwarped_bladestaff,id=113640,bonus_id=567,enchant=mark_of_the_frostwolf

# Gear Summary
# gear_ilvl=700.00
# gear_agility=3133
# gear_stamina=4700
# gear_haste_rating=669
# gear_mastery_rating=2117
# gear_armor=1177
# gear_bonus_armor=1020
# gear_multistrike_rating=1128
# gear_versatility_rating=517
# set_bonus=tier17_2pc=1
]]

private.apls["generate_Death_Knight_T17M.simc"] = [[
﻿# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# talent_format=numbers

deathknight="Death_Knight_Unholy_T17M"
level=100
race=blood_elf
spec=unholy
role=attack
position=back
talents=2001003
glyphs=
head=ogreskull_boneplate_greathelm,id=115539,bonus_id=567
neck=thogars_serrated_chain,id=113959,bonus_id=567,enchant=gift_of_multistrike
shoulders=overdriven_spaulders,id=113990,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_multistrike
chest=ogreskull_boneplate_breastplate,id=115537,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=ogreskull_boneplate_gauntlets,id=115538,bonus_id=567
waist=ironcrushers_collar,id=113950,bonus_id=567
legs=ogreskull_boneplate_greaves,id=115535,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant_id=5327
finger2=phosphorescent_seal,id=113866,bonus_id=567,enchant_id=5327
trinket1=forgemasters_insignia,id=113983,bonus_id=567
trinket2=vial_of_convulsive_shadows,id=113969,bonus_id=567
main_hand=kagrazs_burning_blade,id=113913,bonus_id=567,enchant=rune_of_the_fallen_crusader

save=Death_Knight_Unholy_T17M.simc

deathknight="Death_Knight_Frost_2h_T17M"
level=100
race=orc
spec=frost
role=attack
position=back
talents=2001002
glyphs=
head=ogreskull_boneplate_greathelm,id=115539,bonus_id=567
neck=vertebrae_protector,id=113900,bonus_id=567,enchant=gift_of_haste
shoulders=ogreskull_boneplate_pauldrons,id=115536,bonus_id=567
back=charbreath_firecloak,id=113916,bonus_id=567,enchant=gift_of_haste
chest=ogreskull_boneplate_breastplate,id=115537,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=ogreskull_boneplate_gauntlets,id=115538,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=firestorm_legplates,id=113921,bonus_id=567
feet=iron_bellow_sabatons,id=113961,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_haste
finger2=phosphorescent_seal,id=113866,bonus_id=567,enchant=gift_of_haste
trinket1=forgemasters_insignia,id=113983,bonus_id=567
trinket2=vial_of_convulsive_shadows,id=113969,bonus_id=567
main_hand=thogars_control_rod,id=113953,bonus_id=567,enchant=rune_of_the_fallen_crusader
save=Death_Knight_Frost_2h_T17M.simc

deathknight="Death_Knight_Frost_1h_T17M"
level=100
race=orc
spec=frost
role=attack
position=back
talents=2001002
glyphs=
head=ogreskull_boneplate_greathelm,id=115539,bonus_id=567
neck=thogars_serrated_chain,id=113959,bonus_id=567,enchant=gift_of_mastery
shoulders=overdriven_spaulders,id=113990,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_mastery
chest=ogreskull_boneplate_breastplate,id=115537,bonus_id=567
wrists=bracers_of_martial_perfection,id=113871,bonus_id=567
hands=ogreskull_boneplate_gauntlets,id=115538,bonus_id=567
waist=ironcrushers_collar,id=113950,bonus_id=567
legs=ogreskull_boneplate_greaves,id=115535,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_mastery
finger2=phosphorescent_seal,id=113866,bonus_id=567,enchant=gift_of_mastery
trinket1=horn_of_screaming_spirits,id=119193,bonus_id=567
trinket2=vial_of_convulsive_shadows,id=113969,bonus_id=567
main_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=rune_of_the_fallen_crusader
off_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=rune_of_razorice
save=Death_Knight_Frost_1h_T17M.simc

deathknight="Death_Knight_Blood_T17M"
level=100
race=tauren
role=tank
talents=2012102
spec=blood
head=ogreskull_boneplate_greathelm,id=115539,bonus_id=567
neck=gluttons_kerchief,id=113882,bonus_id=567,enchant=gift_of_multistrike
shoulders=unstable_slag_shoulderplates,id=113884,bonus_id=567
back=gronn-stitched_greatcloak,id=113873,bonus_id=567,enchant=gift_of_multistrike
chest=ogreskull_boneplate_breastplate,id=115537,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=ogreskull_boneplate_gauntlets,id=115538,bonus_id=567
waist=ironcrushers_collar,id=113950,bonus_id=567
legs=ogreskull_boneplate_greaves,id=115535,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_multistrike
finger2=seal_of_unquenchable_flame,id=113922,bonus_id=567,enchant=gift_of_multistrike
trinket1=pillar_of_the_earth,id=113650,bonus_id=567
trinket2=petrified_flesh-eating_spore,id=113663,bonus_id=567
main_hand=kagrazs_burning_blade,id=113913,bonus_id=567,enchant=rune_of_the_stoneskin_gargoyle
save=Death_Knight_Blood_T17M.simc

deathknight="Death_Knight_Blood_T17M_BoS"
level=100
race=orc
role=tank
position=front
talents=http://us.battle.net/wow/en/tool/talent-calculator#da!1000002
glyphs=icy_runes/vampiric_blood/regenerative_magic
spec=blood
head=ogreskull_boneplate_greathelm,id=115539,bonus_id=567
neck=gluttons_kerchief,id=113882,bonus_id=567,enchant=gift_of_multistrike
shoulders=overdriven_spaulders,id=113990,bonus_id=567
back=gronnstitched_greatcloak,id=113873,bonus_id=567,enchant=gift_of_multistrike
chest=ogreskull_boneplate_breastplate,id=115537,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=ogreskull_boneplate_gauntlets,id=115538,bonus_id=567
waist=ironcrushers_collar,id=113950,bonus_id=567
legs=ogreskull_boneplate_greaves,id=115535,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=seal_of_unquenchable_flame,id=113922,bonus_id=567,enchant=gift_of_multistrike
finger2=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_multistrike
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=vial_of_convulsive_shadows,id=113969,bonus_id=567
main_hand=kagrazs_burning_blade,id=113913,bonus_id=567,enchant=rune_of_the_fallen_crusader
save=Death_Knight_Blood_T17M_BoS.simc
]]

private.apls["generate_Druid_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# talent_format=numbers
# Guardian Druid T17M
druid="Druid_Guardian_T17M"
level=100
race=night_elf
spec=guardian
role=tank
position=front
talents=0301022
head=sorkas_nightshade_cowl,id=113978,bonus_id=567
neck=choker_of_bestial_force,id=113952,enchant=gift_of_mastery,bonus_id=567
shoulders=living_wood_spaulders,id=115544,bonus_id=567
back=gronnstitched_greatcloak,id=113873,enchant=gift_of_mastery,bonus_id=567
chest=unrendable_wolfhide_robes,id=113951,bonus_id=567
wrists=squires_electroplated_bracers,id=113962,bonus_id=567
hands=cannonball_loaders_grips,id=113949,bonus_id=567
waist=girdle_of_unconquered_glory,id=113907,bonus_id=567
legs=living_wood_legguards,id=115543,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_mastery
finger2=stonefist_band,id=113938,enchant=gift_of_mastery,bonus_id=567
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
main_hand=earthwarped_bladestaff,id=113640,enchant=mark_of_the_frostwolf,bonus_id=567
save=Druid_Guardian_T17M.simc

# Feral Druid T17M
druid="Druid_Feral_T17M"
level=100
race=night_elf
spec=feral
role=attack
position=back
talents=3002002
glyphs=savage_roar
head=acidic_jaws,id=113880,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant=gift_of_critical_strike
shoulder=living_wood_spaulders,id=115544,bonus_id=567
chest=living_wood_raiment,id=115540,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=living_wood_legguards,id=115543,bonus_id=567
feet=furnace_tenders_treads,id=113895,bonus_id=567
wrist=bracers_of_shattered_limbs,id=119333,bonus_id=567
hands=living_wood_grips,id=115541,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_critical_strike
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_critical_strike
trinket1=beating_heart_of_the_mountain,id=113931,bonus_id=567
trinket2=humming_blackiron_trigger,id=113985,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_critical_strike
main_hand=talrak_bloody_skull_of_the_thunderlords,id=113939,bonus_id=567,enchant=mark_of_the_thunderlord
save=Druid_Feral_T17M.simc

# Feral Druid T17M, AoE optimized
druid="Druid_Feral_T17M_AoE"
level=100
race=night_elf
spec=feral
role=attack
position=back
talents=3002002
glyphs=savage_roar
head=sorkas_nightshade_cowl,id=113978,bonus_id=567
neck=engineers_grounded_gorget,id=113892,bonus_id=567,enchant=gift_of_mastery
shoulder=living_wood_spaulders,id=115544,bonus_id=567
chest=living_wood_raiment,id=115540,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=living_wood_legguards,id=115543,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
wrist=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=living_wood_grips,id=115541,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_mastery
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_mastery
trinket1=humming_blackiron_trigger,id=113985,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_mastery
main_hand=headlopper_skullscythe,id=119448,bonus_id=567,enchant_id=mark_of_bleeding_hollow
save=Druid_Feral_T17M_AoE.simc

# Balance Druid T17M
druid="Druid_Balance_T17M"
level=100
race=troll
spec=balance
talents=0101001
head=living_wood_headpiece,id=115542,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant=gift_of_critical_strike
shoulders=living_wood_spaulders,bonus_id=567,id=115544
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant=gift_of_critical_strike
chest=living_wood_raiment,id=115540,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=cannonball_loaders_grips,id=113949,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=living_wood_legguards,id=115543,bonus_id=567
feet=ironflecked_sandals,id=119340,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_critical_strike
finger2=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant=gift_of_critical_strike
trinket1=goren_soul_repository,id=119194,bonus_id=567
trinket2=darmacs_unstable_talisman,id=113948,bonus_id=567
main_hand=blackhand_doomstaff,id=113988,bonus_id=567,enchant=mark_of_the_thunderlord
save=Druid_Balance_T17M.simc
]]

private.apls["generate_Hunter_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# talent_format=numbers
# BM
hunter=Hunter_BM_T17M
level=100
race=orc
spec=beast_mastery
position=ranged_back
role=attack
talents=0002333
head=rylakstalkers_headguard,id=115545,bonus_id=567
neck=engineers_grounded_gorget,id=113892,bonus_id=567,enchant_id=5319
shoulder=rylakstalkers_spaulders,id=115547,bonus_id=567
chest=chestguard_of_the_siegemaker,id=113982,bonus_id=567
waist=grenadiers_belt,id=113955,bonus_id=567
legs=rylakstalkers_legguards,id=115546,bonus_id=567
feet=railwalkers_ratcheted_boots,id=113954,bonus_id=567
wrist=bloodwhirl_bracers,id=113968,bonus_id=567
hands=rylakstalkers_gloves,id=115549,bonus_id=567
finger1=unexploded_explosive_shard,id=113877,bonus_id=567,enchant_id=5326
finger2=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant_id=5326
trinket1=beating_heart_of_the_mountain,id=113931,bonus_id=567
trinket2=meaty_dragonspine_trophy,id=118114,bonus_id=567
back=cloak_of_delving_secrets,id=113929,bonus_id=567,enchant_id=5312
main_hand=garans_brutal_spearlauncher,id=113966,bonus_id=567,enchant_id=5383
save=Hunter_BM_T17M.simc

# MM
hunter=Hunter_MM_T17M
level=100
race=blood_elf
spec=marksmanship
position=ranged_back
role=attack
talents=0003313
head=rylakstalkers_headguard,id=115545,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant_id=5317
shoulders=rylakstalkers_spaulders,id=115547,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant_id=5310
chest=chestguard_of_the_siegemaker,id=113982,bonus_id=567
wrists=bracers_of_the_wolfs_cunning,id=113943,bonus_id=567
hands=rylakstalkers_gloves,id=115549,bonus_id=567
waist=grenadiers_belt,id=113955,bonus_id=567
legs=rylakstalkers_legguards,id=115546,bonus_id=567
feet=slagstomper_treads,id=113888,bonus_id=567
finger1=unexploded_explosive_shard,id=113877,bonus_id=567,enchant_id=5324
finger2=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant_id=5324
trinket1=beating_heart_of_the_mountain,id=113931,bonus_id=567
trinket2=humming_blackiron_trigger,id=113985,bonus_id=567
main_hand=mouth_of_the_fury,id=113885,bonus_id=567,enchant_id=5276
save=Hunter_MM_T17M.simc

# SV
hunter=Hunter_SV_T17M
level=100
race=blood_elf
spec=survival
position=ranged_back
role=attack
talents=0003323
head=rylakstalkers_headguard,id=115545,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant_id=5320
shoulders=rylakstalkers_spaulders,id=115547,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant_id=5313
chest=rylakstalkers_tunic,id=115548,bonus_id=567
wrists=bloodwhirl_bracers,id=113968,bonus_id=567
hands=rylakstalkers_gloves,id=115549,bonus_id=567
waist=grenadiers_belt,id=113955,bonus_id=567
legs=legguards_of_the_stampede,id=113944,bonus_id=567
feet=treads_of_the_veteran_smith,id=119339,bonus_id=567
finger1=unexploded_explosive_shard,id=113877,bonus_id=567,enchant_id=5327
finger2=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant_id=5327
trinket1=humming_blackiron_trigger,id=113985,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
main_hand=garans_brutal_spearlauncher,id=113966,bonus_id=567,enchant_id=5275
save=Hunter_SV_T17M.simc]]

private.apls["generate_Mage_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# talent_format=numbers

mage=Mage_Arcane_T17M
level=100
race=gnome
spec=arcane
talents=3003322
glyphs=cone_of_cold
head=arcanoshatter_hood,id=115553,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant=gift_of_mastery
shoulders=arcanoshatter_mantle,id=115551,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant=gift_of_mastery
chest=arcanoshatter_robes,id=115550,bonus_id=567
wrist=bracers_of_darkened_skies,id=119332,bonus_id=567
hands=toothbreaker_grips,id=113876,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=arcanoshatter_leggings,id=115554,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant=gift_of_mastery
finger2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_mastery
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
main_hand=infernoflame_staff,id=113869,bonus_id=567,enchant=mark_of_bleeding_hollow
save=Mage_Arcane_T17M.simc

mage=Mage_Fire_T17M
level=100
race=troll
spec=fire
talents=3003322
glyphs=inferno_blast/combustion/dragons_breath
head=arcanoshatter_hood,id=115553,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant=gift_of_critical_strike
shoulders=arcanoshatter_mantle,id=115551,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant=gift_of_critical_strike
chest=arcanoshatter_robes,id=115550,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=arcanoshatter_gloves,id=115552,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=turret_mechanics_legwraps,id=113970,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant=gift_of_critical_strike
finger2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_critical_strike
trinket1=goren_soul_repository,id=119194,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
main_hand=blackhand_doomstaff,id=113988,bonus_id=567,enchant=mark_of_the_thunderlord
save=Mage_Fire_T17M.simc

mage=Mage_Frost_T17M
level=100
race=dwarf
spec=frost
talents=3003122
glyphs=icy_veins/splitting_ice/cone_of_cold
head=flareeyed_hood,id=113868,bonus_id=567
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_multistrike
shoulder=arcanoshatter_mantle,id=115551,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_multistrike
chest=arcanoshatter_robes,id=115550,bonus_id=567
wrists=bracers_of_spattered_steel,id=113887,bonus_id=567
hands=arcanoshatter_gloves,id=115552,bonus_id=567
waist=deckhands_rope_belt,id=113967,bonus_id=567
legs=arcanoshatter_leggings,id=115554,bonus_id=567
feet=inferno_breath_sandals,id=113942,bonus_id=567
ring1=epicenter_loop,id=113947,bonus_id=567,enchant=gift_of_multistrike
ring2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_multistrike
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
main_hand=fang_of_the_earth,id=113934,bonus_id=567,enchant=mark_of_the_frostwolf
off_hand=enginestokers_lantern,id=113960,bonus_id=567
save=Mage_Frost_T17M.simc
]]

private.apls["generate_Monk_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# talent_format=numbers

# Windwalker 1h Serenity
monk="Monk_Windwalker_1h_T17M"
level=100
race=blood_elf
role=dps
position=back
talents=0230023
spec=windwalker
glyphs=touch_of_death,blackout_kick

head=helm_of_the_somber_gaze,id=115556,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant=gift_of_multistrike
shoulders=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_multistrike
chest=vest_of_forceful_fury,id=113870,bonus_id=567
wrists=bracers_of_shattered_limbs,id=119333,bonus_id=567
hands=handwraps_of_the_somber_gaze,id=115555,bonus_id=567
waist=girdle_of_unconquered_glory,id=113907,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=furnace_tenders_treads,id=113895,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_multistrike
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_multistrike
trinket1=beating_heart_of_the_mountain,id=113931,bonus_id=567
trinket2=humming_blackiron_trigger,id=113985,bonus_id=567
main_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_the_frostwolf
off_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_the_thunderlord
save=Monk_Windwalker_1h_T17M.simc

# Windwalker 2h Serenity
monk="Monk_Windwalker_2h_T17M"
level=100
race=blood_elf
role=dps
position=back
talents=0230023
spec=windwalker
glyphs=touch_of_death,blackout_kick

head=helm_of_the_somber_gaze,id=115556,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant=gift_of_multistrike
shoulders=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_multistrike
chest=vest_of_the_somber_gaze,id=115558,bonus_id=567
wrists=bracers_of_shattered_limbs,id=119333,bonus_id=567
hands=cannonball_loaders_grips,id=113949,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=furnace_tenders_treads,id=113895,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_multistrike
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_multistrike
trinket1=humming_blackiron_trigger,id=113985,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
main_hand=talrak_bloody_skull_of_the_thunderlords,id=113939,bonus_id=567,enchant=mark_of_warsong
save=Monk_Windwalker_2h_T17M.simc

# Brewmaster 1h Chi Explosion
monk="Monk_Brewmaster_1h_CE_T17M"
level=100
race=night_elf
spec=brewmaster
role=tank
position=front
talents=0130122
glyphs=fortifying_brew,expel_harm,fortuitous_spheres

head=helm_of_the_somber_gaze,id=115556,bonus_id=567
neck=gluttons_kerchief,id=113882,bonus_id=567,enchant=gift_of_mastery
shoulder=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_mastery
chest=unrendable_wolfhide_robes,id=113951,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
wrist=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=handwraps_of_the_somber_gaze,id=115555,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_mastery
finger2=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_mastery
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
main_hand=phemos_double_slasher,id=113667,bonus_id=567,enchant=mark_of_bleeding_hollow
off_hand=phemos_double_slasher,id=113667,bonus_id=567,enchant=mark_of_bleeding_hollow
save=Monk_Brewmaster_1h_CE_T17M.simc

# Brewmaster 1h Serenity
monk="Monk_Brewmaster_1h_Serenity_T17M"
level=100
race=night_elf
spec=brewmaster
role=tank
position=front
talents=0130123
glyphs=fortifying_brew,expel_harm,fortuitous_spheres

head=sorkas_nightshade_cowl,id=113978,bonus_id=567
neck=choker_of_bestial_force,id=113952,bonus_id=567,enchant=gift_of_mastery
shoulder=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_mastery
chest=vest_of_the_somber_gaze,id=115558,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
wrist=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=handwraps_of_the_somber_gaze,id=115555,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_mastery
finger2=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_mastery
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
main_hand=sorkas_chainfist,id=113965,bonus_id=567,enchant=mark_of_blackrock
off_hand=sorkas_chainfist,id=113965,bonus_id=567,enchant=mark_of_bleeding_hollow
save=Monk_Brewmaster_1h_Serenity_T17M.simc

# Brewmaster 2h Chi Explosion
monk="Monk_Brewmaster_2h_CE_T17M"
level=100
race=night_elf
spec=brewmaster
role=tank
position=front
talents=0130122
glyphs=fortifying_brew,expel_harm,fortuitous_spheres

head=helm_of_the_somber_gaze,id=115556,bonus_id=567
neck=gluttons_kerchief,id=113882,bonus_id=567,enchant=gift_of_multistrike
shoulder=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_multistrike
chest=unrendable_wolfhide_robes,id=113951,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
wrist=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=handwraps_of_the_somber_gaze,id=115555,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_multistrike
finger2=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_multistrike
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
main_hand=headlopper_skullscythe,id=119448,bonus_id=567,enchant=mark_of_bleeding_hollow
save=Monk_Brewmaster_2h_CE_T17M.simc

# Brewmaster 2h Serenity
monk="Monk_Brewmaster_2h_Serenity_T17M"
level=100
race=night_elf
spec=brewmaster
role=tank
position=front
talents=0130123
glyphs=fortifying_brew,expel_harm,fortuitous_spheres

head=helm_of_the_somber_gaze,id=115556,bonus_id=567
neck=choker_of_bestial_force,id=113952,bonus_id=567,enchant=gift_of_mastery
shoulders=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_mastery
chest=unrendable_wolfhide_robes,id=113951,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=handwraps_of_the_somber_gaze,id=115555,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_mastery
finger2=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_mastery
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
main_hand=headlopper_skullscythe,id=119448,bonus_id=567,enchant=mark_of_bleeding_hollow
save=Monk_Brewmaster_2h_Serenity_T17M.simc]]

private.apls["generate_Paladin_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# talent_format=numbers
paladin="Paladin_Retribution_T17M"
level=100
race=draenei
role=attack
position=back
talents=2112231
glyphs=winged_vengeance/templars_verdict/righteous_retreat/fire_from_the_heavens/judgment/mass_exorcism
spec=retribution

head=helmet_of_guiding_light,id=115568,bonus_id=567
neck=thogars_serrated_chain,id=113959,bonus_id=567,enchant=gift_of_mastery
shoulder=pauldrons_of_guiding_light,id=115565,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_mastery
chest=battleplate_of_guiding_light,id=115566,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=gauntlets_of_dramatic_blows,id=113906,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=legplates_of_guiding_light,id=115569,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=seal_of_the_savage_howl,id=113940,bonus_id=567,enchant=gift_of_mastery
finger2=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_mastery
trinket1=vial_of_convulsive_shadows,id=113969,bonus_id=567
trinket2=horn_of_screaming_spirits,id=119193,bonus_id=567
main_hand=thogars_control_rod,id=113953,bonus_id=567,enchant=mark_of_bleeding_hollow
save=Paladin_Retribution_T17M.simc

paladin="Paladin_Protection_T17M"
talents=3032322
level=100
race=blood_elf
spec=protection
role=tank
position=front
glyphs=focused_shield/divine_protection/final_wrath

head=helmet_of_guiding_light,id=115568,bonus_id=567
neck=choker_of_bestial_force,id=113952,bonus_id=567,enchant=gift_of_haste
shoulder=pauldrons_of_guiding_light,id=115565,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_haste
chest=battleplate_of_guiding_light,id=115566,bonus_id=567
wrist=bracers_of_martial_perfection,id=113871,bonus_id=567
hands=gauntlets_of_dramatic_blows,id=113906,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=legplates_of_guiding_light,id=115569,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_haste
finger2=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_haste
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=evergaze_arcane_eidolon,id=113861,bonus_id=567
main_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=mark_of_blackrock
off_hand=kromogs_protecting_palm,id=113926,bonus_id=567
save=Paladin_Protection_T17M.simc

# talent_format=numbers
# paladin="Paladin_Holy_T17M"
# level=100
# race=blood_elf
# role=heal
# position=back
# talents=2132232
# glyphs=divinity/protector_of_the_innocent/
# spec=holy

# head=helmet_of_guiding_light,id=115568,bonus_id=567
# neck=feldspars_control_choker,id=113890,bonus_id=567,enchant=gift_of_critical_strike
# shoulders=pauldrons_of_guiding_light,id=115565,bonus_id=567
# back=flame_infusion_drape,id=113945,bonus_id=567,enchant=gift_of_critical_strike
# chest=battleplate_of_guiding_light,id=115566,bonus_id=567
# wrists=bracers_of_mirrored_flame,id=113844,bonus_id=567
# hands=gauntlets_of_guiding_light,id=115567,bonus_id=567
# waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
# legs=legplates_of_fractured_crystal,id=113648,bonus_id=567
# feet=iron_bellow_sabatons,id=113961,bonus_id=567
# finger1=spellbound_runic_band_of_infinite_preservation,id=118309,enchant=gift_of_critical_strike
# finger2=firemenders_smoldering_signet,id=113957,bonus_id=567,enchant=gift_of_critical_strike
# trinket1=autorepairing_autoclave,id=113986,bonus_id=567
# trinket2=ironspike_chew_toy,id=119192,bonus_id=567
# main_hand=fang_of_the_earth,id=113934,bonus_id=567,enchant=mark_of_shadowmoon
# off_hand=heart_of_the_clefthoof,id=113946,bonus_id=567
# save=Paladin_Holy_T17M.simc


]]

private.apls["generate_Priest_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# talent_format=numbers

# Shadow
priest="Priest_Shadow_T17M_COP"
talents=1133131
level=100
race=troll
spec=shadow
role=spell
position=back
glyphs=mind_flay/fade/sha
head=slagbombers_hood,id=113981,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant=gift_of_mastery
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant=gift_of_mastery
chest=soul_priests_raiment,id=115560,bonus_id=567
wrists=bracers_of_darkened_skies,id=119332,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=soul_priests_leggings,id=115564,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant=gift_of_mastery
finger2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_mastery
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=infernoflame_staff,id=113869,bonus_id=567,enchant=mark_of_bleeding_hollow
off_hand=
save=Priest_Shadow_T17M_COP.simc

copy="Priest_Shadow_T17M_VE"
talents=1123232
race=troll
head=soul_priests_hood,id=115563,bonus_id=567
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_haste
shoulder=soul_priests_shoulderguards,id=115561,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_haste
chest=eyecatching_gilded_robe,id=113898,bonus_id=567
wrist=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=deckhands_rope_belt,id=113967,bonus_id=567
legs=soul_priests_leggings,id=115564,bonus_id=567
feet=inferno_breath_sandals,id=113942,bonus_id=567
finger1=epicenter_loop,id=113947,bonus_id=567,enchant=gift_of_haste
finger2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_haste
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=franzoks_headsmasher,id=113904,bonus_id=567,enchant=mark_of_warsong
off_hand=enginestokers_lantern,id=113960,bonus_id=567
save=Priest_Shadow_T17M_VE.simc

copy="Priest_Shadow_T17M_AS"
talents=1133133
race=worgen
head=soul_priests_hood,id=115563,bonus_id=567
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_critical_strike
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_critical_strike
chest=soul_priests_raiment,id=115560,bonus_id=567
wrists=bracers_of_spattered_steel,id=113887,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=deckhands_rope_belt,id=113967,bonus_id=567
legs=turret_mechanics_legwraps,id=113970,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_critical_strike
finger2=epicenter_loop,id=113947,bonus_id=567,enchant=gift_of_critical_strike
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=blackhand_doomstaff,id=113988,bonus_id=567,enchant=mark_of_the_thunderlord
off_hand=
save=Priest_Shadow_T17M_AS.simc

# Holy Heal
priest="Priest_Holy_T17M_Heal"
talents=3223332
level=100
race=draenei
spec=holy
role=heal
position=back
glyphs=prayer_of_mending/circle_of_healing/deep_wells
head=soul_priests_hood,id=115563,bonus_id=567
neck=talisman_of_the_fomor,id=113932,bonus_id=567,enchant=gift_of_multistrike
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=flame_infusion_drape,id=113945,bonus_id=567,enchant=gift_of_multistrike
chest=soul_priests_raiment,id=115560,bonus_id=567
wrists=bracers_of_enkindled_power,bonus_id=567,id=113956
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=soul_priests_leggings,id=115564,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=sixeyed_band,id=113901,bonus_id=567,enchant=gift_of_multistrike
finger2=spellbound_runic_band_of_infinite_preservation,id=118309,enchant=gift_of_multistrike
trinket1=autorepairing_autoclave,id=113986,bonus_id=567
trinket2=ironspike_chew_toy,id=119192,bonus_id=567
main_hand=infernoflame_staff,id=113869,bonus_id=567,enchant=mark_of_shadowmoon
off_hand=
save=Priest_Holy_T17M_Heal.simc

# Holy DMG
priest="Priest_Holy_T17M_DMG"
talents=3223232
level=100
race=draenei
spec=holy
role=spell
position=back
glyphs=smite/holy_fire/inquisitor
head=soul_priests_hood,id=115563,bonus_id=567
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_multistrike
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_multistrike
chest=eyecatching_gilded_robe,id=113898,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=deckhands_rope_belt,id=113967,bonus_id=567
legs=leggings_of_the_molten_torrent,id=113914,bonus_id=567
feet=inferno_breath_sandals,id=113942,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_multistrike
finger2=signet_of_crystalline_barrage,id=113651,bonus_id=567,enchant=gift_of_multistrike
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=franzoks_headsmasher,id=113904,bonus_id=567,enchant=mark_of_the_frostwolf
off_hand=enginestokers_lantern,id=113960,bonus_id=567
save=Priest_Holy_T17M_Dmg.simc

# Discipline Heal
priest="Priest_Discipline_T17M_Heal"
talents=3223232
level=100
race=draenei
spec=discipline
role=heal
position=back
glyphs=prayer_of_mending/circle_of_healing/deep_wells
head=soul_priests_hood,id=115563,bonus_id=567
neck=feldspars_control_choker,id=113890,bonus_id=567,enchant=gift_of_critical_strike
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=barrage_dodger_cloak,id=113878,bonus_id=567,enchant=gift_of_critical_strike
chest=soul_priests_raiment,id=115560,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=soul_priests_leggings,id=115564,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=spellbound_runic_band_of_infinite_preservation,id=118309,enchant=gift_of_critical_strike
finger2=firemenders_smoldering_signet,id=113957,bonus_id=567,enchant=gift_of_critical_strike
trinket1=autorepairing_autoclave,id=113986,bonus_id=567
trinket2=ironspike_chew_toy,id=119192,bonus_id=567
main_hand=blackhand_doomstaff,id=113988,bonus_id=567,enchant=mark_of_shadowmoon
off_hand=
save=Priest_Discipline_T17M_Heal.simc

# Discipline Dmg
priest="Priest_Discipline_T17M_Dmg"
talents=3223232
level=100
race=draenei
spec=discipline
role=spell
position=back
glyphs=smite/holy_fire/inquisitor
head=soul_priests_hood,id=115563
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_critical_strike
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_critical_strike
chest=eyecatching_gilded_robe,id=113898,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=deckhands_rope_belt,id=113967,bonus_id=567
legs=leggings_of_the_molten_torrent,id=113914,bonus_id=567
feet=inferno_breath_sandals,id=113942,bonus_id=567
finger1=epicenter_loop,id=113947,bonus_id=567,enchant=gift_of_critical_strike
finger2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_critical_strike
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=franzoks_headsmasher,id=113904,bonus_id=567,enchant=mark_of_thunderlord
off_hand=enginestokers_lantern,id=113960,bonus_id=567
save=Priest_Discipline_T17M_Dmg.simc
]]

private.apls["generate_Rogue_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# talent_format=numbers

# Assassination
rogue="Rogue_Assassination_T17M"
level=100
race=blood_elf
role=attack
position=back
talents=3000032
glyphs=vendetta/energy/disappearance
spec=assassination
head=poisoners_helmet,id=115572,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant=gift_of_mastery
shoulders=poisoners_spaulders,id=115574,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_mastery
chest=poisoners_tunic,id=115570,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=cannonball_loaders_grips,id=113949,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=poisoners_legguards,id=115573,bonus_id=567
feet=furnace_tenders_treads,id=113895,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_mastery
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_mastery
trinket1=humming_blackiron_trigger,id=113985,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
main_hand=oregorgers_acidetched_gutripper,id=113874,bonus_id=567,enchant=mark_of_the_thunderlord
off_hand=oregorgers_acidetched_gutripper,id=113874,bonus_id=567,enchant=mark_of_the_thunderlord
save=Rogue_Assassination_T17M.simc

# Combat
rogue="Rogue_Combat_T17M"
level=100
race=blood_elf
role=attack
position=back
talents=3000031
spec=combat
glyphs=energy/disappearance
head=sorkas_nightshade_cowl,id=113978,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant=gift_of_haste
shoulders=poisoners_spaulders,id=115574,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_haste
chest=poisoners_tunic,id=115570,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=poisoners_gloves,id=115571,bonus_id=567
waist=girdle_of_unconquered_glory,id=113907,bonus_id=567
legs=poisoners_legguards,id=115573,bonus_id=567
feet=furnace_tenders_treads,id=113895,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_haste
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_haste
trinket1=meaty_dragonspine_trophy,id=118114,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
main_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_warsong
off_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_warsong
save=Rogue_Combat_T17M.simc

# Subtlety
rogue="Rogue_Subtlety_T17M"
level=100
race=night_elf
role=attack
position=back
spec=subtlety
talents=2000022
glyphs=energy/hemorrhaging_veins/vanish
head=poisoners_helmet,id=115572,bonus_id=567
neck=engineers_grounded_gorget,id=113892,bonus_id=567,enchant=gift_of_multistrike
shoulders=poisoners_spaulders,id=115574,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_multistrike
chest=poisoners_tunic,id=115570,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=poisoners_gloves,id=115571,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=shattering_smash_leggings,id=113989,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_multistrike
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_multistrike
trinket1=humming_blackiron_trigger,id=113985,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
main_hand=oregorgers_acidetched_gutripper,id=113874,bonus_id=567,enchant=mark_of_the_frostwolf
off_hand=oregorgers_acidetched_gutripper,id=113874,bonus_id=567,enchant=mark_of_the_frostwolf
save=Rogue_Subtlety_T17M.simc
]]

private.apls["generate_Shaman_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# talent_format=numbers
# Elemental

shaman="Shaman_Elemental_T17M"
level=100
race=dwarf
spec=elemental
role=spell
position=back
professions=blacksmithing=600/engineering=600
talents=0003011
glyphs=chain_lightning
head=windspeakers_faceguard,id=115579,bonus_id=567
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_multistrike
shoulders=windspeakers_mantle,id=115576,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_multistrike
chest=windspeakers_tunic,id=115577,bonus_id=567
wrists=bloodwhirl_bracers,id=113968,bonus_id=567
hands=windspeakers_handwraps,id=115578,bonus_id=567
waist=grenadiers_belt,id=113955,bonus_id=567
legs=legguards_of_the_stampede,id=113944,bonus_id=567
feet=railwalkers_ratcheted_boots,id=113954,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_multistrike
finger2=epicenter_loop,id=113947,bonus_id=567,enchant=gift_of_multistrike
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
main_hand=Franzoks_headsmasher,id=113904,bonus_id=567,enchant=mark_of_the_frostwolf
off_hand=enginestokers_lantern,id=113960,bonus_id=567
save=Shaman_Elemental_T17M.simc


# Enhancement
shaman="Shaman_Enhancement_T17M"
level=100
race=draenei
spec=enhancement
role=attack
position=back
professions=engineering=600/enchanting=600
talents=0003012
glyphs=chain_lightning/frost_shock
head=blastproof_cowl,id=113891,bonus_id=567
neck=engineers_grounded_gorget,id=113892,bonus_id=567,enchant=gift_of_haste
shoulders=windspeakers_mantle,id=115576,bonus_id=567
back=cloak_of_delving_secrets,id=113929,bonus_id=567,enchant=gift_of_haste
chest=windspeakers_tunic,id=115577,bonus_id=567
wrists=bracers_of_callous_disregard,id=119334,bonus_id=567
hands=windspeakers_handwraps,id=115578,bonus_id=567
waist=earthgrasp_girdle,id=113930,bonus_id=567
legs=windspeakers_legwraps,id=115575,bonus_id=567
feet=slagstomper_treads,id=113888,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_haste
finger2=cinderwolf_signet,id=113917,bonus_id=567,enchant=gift_of_haste
trinket1=beating_heart_of_the_mountain,id=113931,bonus_id=567
trinket2=meaty_dragonspine_trophy,id=118114,bonus_id=567
main_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_warsong
off_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_bleeding_hollow
save=Shaman_Enhancement_T17M.simc
]]

private.apls["generate_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# talent_format=numbers

# Death Knight
generate_Death_Knight_T17M.simc

# Druid
generate_Druid_T17M.simc

# Hunter
generate_Hunter_T17M.simc

# Mage
generate_Mage_T17M.simc

# Monk
generate_Monk_T17M.simc

# Paladin
generate_Paladin_T17M.simc

# Priest
generate_Priest_T17M.simc

# Rogue
generate_Rogue_T17M.simc

# Shaman
generate_Shaman_T17M.simc

# Warlock
generate_Warlock_T17M.simc

# Warrior
generate_Warrior_T17M.simc
]]

private.apls["generate_Warlock_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# talent_format=numbers

warlock=Warlock_Affliction_T17M
level=100
race=gnome
spec=affliction
talents=0000111
talent_override=grimoire_of_service,if=talent.demonic_servitude.enabled
talent_override=soulburn_haunt,if=enemies=2
talent_override=cataclysm,if=enemies>2
head=shadow_councils_hood,id=115586,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant_id=5318
shoulder=earthripple_shoulderpads,id=113928,bonus_id=567
chest=shadow_councils_robes,id=115588,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=shadow_councils_leggings,id=115587,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
wrist=bracers_of_darkened_skies,id=119332,bonus_id=567
hands=shadow_councils_gloves,id=115585,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant_id=5325
finger2=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant_id=5325
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant_id=5311
main_hand=infernoflame_staff,id=113869,bonus_id=567,enchant_id=5337
save=Warlock_Affliction_T17M.simc

warlock=Warlock_Demonology_T17M
level=100
race=troll
spec=demonology
talents=0000213
head=shadow_councils_hood,id=115586,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant_id=5319
shoulder=shadow_councils_mantle,id=115589,bonus_id=567
chest=shadow_councils_robes,id=115588,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=shadow_councils_leggings,id=115587,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
wrist=bracers_of_darkened_skies,id=119332,bonus_id=567
hands=toothbreaker_grips,id=113876,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant_id=5326
finger2=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant_id=5326
trinket1=goren_soul_repository,id=119194,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant_id=5312
main_hand=infernoflame_staff,id=113869,bonus_id=567,enchant_id=5384
save=Warlock_Demonology_T17M.simc

warlock=Warlock_Destruction_T17M
level=100
race=dwarf
role=spell
spec=destruction
talents=0000311
talent_override=charred_remains,if=enemies>=4
talent_override=cataclysm,if=enemies>1&enemies<4
talent_override=grimoire_of_sacrifice,if=enemies>1&enemies<4|(enemies=1&talent.charred_remains.enabled)
talent_override=grimoire_of_supremacy,if=(enemies>=4&!talent.demonic_servitude.enabled)|(enemies=1&talent.cataclysm.enabled)
talent_override=grimoire_of_service,if=talent.demonic_servitude.enabled
head=shadow_councils_hood,id=115586,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant_id=5319
shoulders=shadow_councils_mantle,id=115589,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant_id=5312
chest=shadow_councils_robes,id=115588,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=shadow_councils_gloves,id=115585,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=turret_mechanics_legwraps,id=113970,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant_id=5326
finger2=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant_id=5326
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=blackhand_doomstaff,id=113988,bonus_id=567,enchant_id=5384
save=Warlock_Destruction_T17M.simc
]]

private.apls["generate_Warrior_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

# Warrior Fury 1h T17M
warrior="Warrior_Fury_1h_T17M"
level=100
race=tauren
role=attack
spec=fury
talents=1321321
glyphs=unending_rage/raging_wind/heroic_leap
head=blackhands_faceguard,id=115584,bonus_id=567
neck=vertebrae_protector,id=113900,bonus_id=567,enchant=gift_of_critical_strike
shoulder=blackhands_shoulderguards,id=115581,bonus_id=567
chest=blackhands_chestguard,id=115582,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=blackhands_legguards,id=115580,bonus_id=567
feet=doomslag_greatboots,id=119341,bonus_id=567
wrist=bracers_of_visceral_force,id=119331,bonus_id=567
hands=gauntlets_of_dramatic_blows,id=113906,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_critical_strike
finger2=seal_of_the_savage_howl,id=113940,bonus_id=567,enchant=gift_of_critical_strike
trinket1=vial_of_convulsive_shadows,id=113969,bonus_id=567
trinket2=horn_of_screaming_spirits,id=119193,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_critical_strike
main_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=mark_of_the_thunderlord
off_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=mark_of_the_thunderlord
save=Warrior_Fury_1h_T17M.simc

# Warrior Fury 2h T17M
warrior="Warrior_Fury_2h_T17M"
level=100
race=tauren
role=attack
spec=fury
talents=1321321
glyphs=unending_rage/raging_wind/heroic_leap
head=blackhands_faceguard,id=115584,bonus_id=567
neck=vertebrae_protector,id=113900,bonus_id=567,enchant=gift_of_critical_strike
shoulder=blackhands_shoulderguards,id=115581,bonus_id=567
chest=blackhands_chestguard,id=115582,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=blackhands_legguards,id=115580,bonus_id=567
feet=doomslag_greatboots,id=119341,bonus_id=567
wrist=bracers_of_visceral_force,id=119331,bonus_id=567
hands=gauntlets_of_dramatic_blows,id=113906,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_critical_strike
finger2=seal_of_the_savage_howl,id=113940,bonus_id=567,enchant=gift_of_critical_strike
trinket1=vial_of_convulsive_shadows,id=113969,bonus_id=567
trinket2=horn_of_screaming_spirits,id=119193,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_critical_strike
main_hand=the_black_hand,id=113979,bonus_id=567,enchant=mark_of_the_thunderlord
off_hand=the_black_hand,id=113979,bonus_id=567,enchant=mark_of_the_thunderlord
save=Warrior_Fury_2h_T17M.simc

# Warrior Arms T17M
warrior="Warrior_Arms_T17M"
level=100
race=tauren
spec=Arms
role=attack
position=back
talents=1321322
glyphs=unending_rage/heroic_leap/sweeping_strikes
head=blackhands_faceguard,id=115584,bonus_id=567
neck=vertebrae_protector,id=113900,bonus_id=567,enchant=gift_of_critical_strike
shoulder=overdriven_spaulders,id=113990,bonus_id=567
chest=blackhands_chestguard,id=115582,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=blackhands_legguards,id=115580,bonus_id=567
feet=doomslag_greatboots,id=119341,bonus_id=567
wrist=fleshmelter_bracers,id=113896,bonus_id=567
hands=blackhands_handguards,id=115583,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_critical_strike
finger2=seal_of_the_savage_howl,id=113940,bonus_id=567,enchant=gift_of_critical_strike
trinket1=vial_of_convulsive_shadows,id=113969,bonus_id=567
trinket2=horn_of_screaming_spirits,id=119193,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_critical_strike
main_hand=crescent_of_living_magma,id=113886,bonus_id=567,enchant=mark_of_the_thunderlord
save=Warrior_Arms_T17M.simc

# Warrior Protection T17M
warrior="Warrior_Protection_T17M"
level=100
race=tauren
role=tank
position=front
talents=1113323
glyphs=unending_rage/heroic_leap/cleave
spec=prot
head=hardened_greathelm,id=113910,bonus_id=567
neck=choker_of_bestial_force,id=113952,bonus_id=567,enchant=gift_of_mastery
shoulders=blackhands_shoulderguards,id=115581,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_mastery
chest=blackhands_chestguard,id=115582,bonus_id=567
wrists=bracers_of_martial_perfection,id=113871,bonus_id=567
hands=blackhands_handguards,id=115583,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=blackhands_legguards,id=115580,bonus_id=567
feet=doomslag_greatboots,id=119341,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_mastery
finger2=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_mastery
trinket1=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
trinket2=blast_furnace_door,id=113893,bonus_id=567
main_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=mark_of_blackrock
off_hand=kromogs_protecting_palm,id=113926,bonus_id=567
save=Warrior_Protection_T17M.simc

# Warrior Gladiator T17M
warrior="Warrior_Gladiator_T17M"
level=100
race=tauren
role=attack
position=back
talents=1133323
glyphs=unending_rage/heroic_leap/cleave
spec=prot
head=,id=115584,bonus_id=567
neck=,id=113882,bonus_id=567,enchant_id=5317
shoulder=,id=115581,bonus_id=567
back=,id=113873,bonus_id=567,enchant_id=5310
chest=,id=115582,bonus_id=567
wrist=,id=119331,bonus_id=567
hands=,id=115583,bonus_id=567
waist=,id=113976,bonus_id=567
legs=,id=115580,bonus_id=567
feet=,id=113961,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_critical_strike
finger2=,id=113963,bonus_id=567,enchant_id=5324
trinket1=,id=113969,bonus_id=567
trinket2=,id=113893,bonus_id=567
main_hand=,id=113862,bonus_id=567,enchant_id=5330
off_hand=,id=113926,bonus_id=567
save=Warrior_Gladiator_T17M.simc
]]

private.apls["Hunter_BM_T17M.simc"] = [[
hunter="Hunter_BM_T17M"
level=100
race=orc
role=attack
position=ranged_back
talents=0002333
talent_override=steady_focus,if=raid_event.adds.count>=1|enemies>1
spec=beast_mastery

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/summon_pet
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/exotic_munitions,ammo_type=poisoned,if=active_enemies<3
actions.precombat+=/exotic_munitions,ammo_type=incendiary,if=active_enemies>=3
actions.precombat+=/potion,name=draenic_agility
actions.precombat+=/glaive_toss
actions.precombat+=/focusing_shot

# Executed every time the actor is available.

actions=auto_shot
actions+=/use_item,name=beating_heart_of_the_mountain
actions+=/arcane_torrent,if=focus.deficit>=30
actions+=/blood_fury
actions+=/berserking
actions+=/potion,name=draenic_agility,if=!talent.stampede.enabled&buff.bestial_wrath.up&target.health.pct<=20|target.time_to_die<=20
actions+=/potion,name=draenic_agility,if=talent.stampede.enabled&cooldown.stampede.remains<1&(buff.bloodlust.up|buff.focus_fire.up)|target.time_to_die<=25
actions+=/stampede,if=buff.bloodlust.up|buff.focus_fire.up|target.time_to_die<=25
actions+=/dire_beast
actions+=/focus_fire,if=buff.focus_fire.down&((cooldown.bestial_wrath.remains<1&buff.bestial_wrath.down)|(talent.stampede.enabled&buff.stampede.remains)|pet.cat.buff.frenzy.remains<1)
actions+=/bestial_wrath,if=focus>30&!buff.bestial_wrath.up
actions+=/multishot,if=active_enemies>1&pet.cat.buff.beast_cleave.remains<0.5
actions+=/focus_fire,five_stacks=1,if=buff.focus_fire.down
actions+=/focus_fire,five_stacks=1,if=buff.focus_fire.stack<5&pet.cat.buff.frenzy.stack=5
actions+=/barrage,if=active_enemies>1
actions+=/explosive_trap,if=active_enemies>5
actions+=/multishot,if=active_enemies>5
actions+=/kill_command
actions+=/a_murder_of_crows
actions+=/kill_shot,if=focus.time_to_max>gcd
actions+=/focusing_shot,if=focus<50
# Cast a second shot for steady focus if that won't cap us.
actions+=/cobra_shot,if=buff.pre_steady_focus.up&buff.steady_focus.remains<7&(14+cast_regen)<focus.deficit
actions+=/explosive_trap,if=active_enemies>1
# Prepare for steady focus refresh if it is running out.
actions+=/cobra_shot,if=talent.steady_focus.enabled&buff.steady_focus.remains<4&focus<50
actions+=/glaive_toss
actions+=/barrage
actions+=/powershot,if=focus.time_to_max>cast_time
actions+=/cobra_shot,if=active_enemies>5
actions+=/arcane_shot,if=(buff.thrill_of_the_hunt.react&focus>35)|buff.bestial_wrath.up
actions+=/arcane_shot,if=focus>=75
actions+=/cobra_shot

head=rylakstalkers_headguard,id=115545,bonus_id=567
neck=engineers_grounded_gorget,id=113892,bonus_id=567,enchant_id=5319
shoulders=rylakstalkers_spaulders,id=115547,bonus_id=567
back=cloak_of_delving_secrets,id=113929,bonus_id=567,enchant_id=5312
chest=chestguard_of_the_siegemaker,id=113982,bonus_id=567
wrists=bloodwhirl_bracers,id=113968,bonus_id=567
hands=rylakstalkers_gloves,id=115549,bonus_id=567
waist=grenadiers_belt,id=113955,bonus_id=567
legs=rylakstalkers_legguards,id=115546,bonus_id=567
feet=railwalkers_ratcheted_boots,id=113954,bonus_id=567
finger1=unexploded_explosive_shard,id=113877,bonus_id=567,enchant_id=5326
finger2=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant_id=5326
trinket1=beating_heart_of_the_mountain,id=113931,bonus_id=567
trinket2=meaty_dragonspine_trophy,id=118114,bonus_id=567
main_hand=garans_brutal_spearlauncher,id=113966,bonus_id=567,enchant_id=5383

# Gear Summary
# gear_ilvl=701.00
# gear_agility=3941
# gear_stamina=4763
# gear_crit_rating=829
# gear_haste_rating=334
# gear_mastery_rating=1748
# gear_armor=1496
# gear_multistrike_rating=1408
# gear_versatility_rating=128
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
summon_pet=cat
]]

private.apls["Hunter_MM_T17M.simc"] = [[
hunter="Hunter_MM_T17M"
level=100
race=blood_elf
role=attack
position=ranged_back
talents=0003313
spec=marksmanship

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/summon_pet
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/exotic_munitions,ammo_type=poisoned,if=active_enemies<3
actions.precombat+=/exotic_munitions,ammo_type=incendiary,if=active_enemies>=3
actions.precombat+=/potion,name=draenic_agility
actions.precombat+=/glaive_toss
actions.precombat+=/focusing_shot

# Executed every time the actor is available.

actions=auto_shot
actions+=/use_item,name=beating_heart_of_the_mountain
actions+=/arcane_torrent,if=focus.deficit>=30
actions+=/blood_fury
actions+=/berserking
actions+=/potion,name=draenic_agility,if=((buff.rapid_fire.up|buff.bloodlust.up)&(cooldown.stampede.remains<1))|target.time_to_die<=25
actions+=/chimaera_shot
actions+=/kill_shot
actions+=/rapid_fire
actions+=/stampede,if=buff.rapid_fire.up|buff.bloodlust.up|target.time_to_die<=25
actions+=/call_action_list,name=careful_aim,if=buff.careful_aim.up
actions+=/explosive_trap,if=active_enemies>1
actions+=/a_murder_of_crows
actions+=/dire_beast,if=cast_regen+action.aimed_shot.cast_regen<focus.deficit
actions+=/glaive_toss
actions+=/powershot,if=cast_regen<focus.deficit
actions+=/barrage
# Pool max focus for rapid fire so we can spam AimedShot with Careful Aim buff
actions+=/steady_shot,if=focus.deficit*cast_time%(14+cast_regen)>cooldown.rapid_fire.remains
actions+=/focusing_shot,if=focus.deficit*cast_time%(50+cast_regen)>cooldown.rapid_fire.remains&focus<100
# Cast a second shot for steady focus if that won't cap us.
actions+=/steady_shot,if=buff.pre_steady_focus.up&(14+cast_regen+action.aimed_shot.cast_regen)<=focus.deficit
actions+=/multishot,if=active_enemies>6
actions+=/aimed_shot,if=talent.focusing_shot.enabled
actions+=/aimed_shot,if=focus+cast_regen>=85
actions+=/aimed_shot,if=buff.thrill_of_the_hunt.react&focus+cast_regen>=65
# Allow FS to over-cap by 10 if we have nothing else to do
actions+=/focusing_shot,if=50+cast_regen-10<focus.deficit
actions+=/steady_shot

actions.careful_aim=glaive_toss,if=active_enemies>2
actions.careful_aim+=/powershot,if=active_enemies>1&cast_regen<focus.deficit
actions.careful_aim+=/barrage,if=active_enemies>1
actions.careful_aim+=/aimed_shot
actions.careful_aim+=/focusing_shot,if=50+cast_regen<focus.deficit
actions.careful_aim+=/steady_shot

head=rylakstalkers_headguard,id=115545,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant_id=5317
shoulders=rylakstalkers_spaulders,id=115547,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant_id=5310
chest=chestguard_of_the_siegemaker,id=113982,bonus_id=567
wrists=bracers_of_the_wolfs_cunning,id=113943,bonus_id=567
hands=rylakstalkers_gloves,id=115549,bonus_id=567
waist=grenadiers_belt,id=113955,bonus_id=567
legs=rylakstalkers_legguards,id=115546,bonus_id=567
feet=slagstomper_treads,id=113888,bonus_id=567
finger1=unexploded_explosive_shard,id=113877,bonus_id=567,enchant_id=5324
finger2=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant_id=5324
trinket1=beating_heart_of_the_mountain,id=113931,bonus_id=567
trinket2=humming_blackiron_trigger,id=113985,bonus_id=567
main_hand=mouth_of_the_fury,id=113885,bonus_id=567,enchant_id=5276

# Gear Summary
# gear_ilvl=701.00
# gear_agility=4011
# gear_stamina=4763
# gear_crit_rating=1829
# gear_haste_rating=588
# gear_mastery_rating=741
# gear_armor=1496
# gear_multistrike_rating=1058
# gear_versatility_rating=248
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
summon_pet=cat
]]

private.apls["Hunter_SV_T17M.simc"] = [[
hunter="Hunter_SV_T17M"
level=100
race=blood_elf
role=attack
position=ranged_back
talents=0003323
spec=survival

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/summon_pet
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/exotic_munitions,ammo_type=poisoned,if=active_enemies<3
actions.precombat+=/exotic_munitions,ammo_type=incendiary,if=active_enemies>=3
actions.precombat+=/potion,name=draenic_agility
actions.precombat+=/glaive_toss
actions.precombat+=/explosive_shot
actions.precombat+=/focusing_shot

# Executed every time the actor is available.

actions=auto_shot
actions+=/arcane_torrent,if=focus.deficit>=30
actions+=/blood_fury
actions+=/berserking
actions+=/use_item,name=beating_heart_of_the_mountain
actions+=/potion,name=draenic_agility,if=(((cooldown.stampede.remains<1)&(cooldown.a_murder_of_crows.remains<1))&(trinket.stat.any.up|buff.archmages_greater_incandescence_agi.up))|target.time_to_die<=25
actions+=/call_action_list,name=aoe,if=active_enemies>1
actions+=/a_murder_of_crows
actions+=/stampede,if=buff.potion.up|(cooldown.potion.remains&(buff.archmages_greater_incandescence_agi.up|trinket.stat.any.up))|target.time_to_die<=45
actions+=/black_arrow,cycle_targets=1,if=remains<gcd*1.5
actions+=/arcane_shot,if=(trinket.proc.any.react&trinket.proc.any.remains<4)|dot.serpent_sting.remains<=3
actions+=/explosive_shot
actions+=/cobra_shot,if=buff.pre_steady_focus.up
actions+=/dire_beast
actions+=/arcane_shot,if=(buff.thrill_of_the_hunt.react&focus>35)|target.time_to_die<4.5
actions+=/glaive_toss
actions+=/powershot
actions+=/barrage
actions+=/explosive_trap,if=!trinket.proc.any.react&!trinket.stacking_proc.any.react
actions+=/arcane_shot,if=talent.steady_focus.enabled&!talent.focusing_shot.enabled&focus.deficit<action.cobra_shot.cast_regen*2+28
actions+=/cobra_shot,if=talent.steady_focus.enabled&buff.steady_focus.remains<5
actions+=/focusing_shot,if=talent.steady_focus.enabled&buff.steady_focus.remains<=cast_time&focus.deficit>cast_regen
actions+=/arcane_shot,if=focus>=70|talent.focusing_shot.enabled|(talent.steady_focus.enabled&focus>=50)
actions+=/focusing_shot
actions+=/cobra_shot

actions.aoe=stampede,if=buff.potion.up|(cooldown.potion.remains&(buff.archmages_greater_incandescence_agi.up|trinket.stat.any.up|buff.archmages_incandescence_agi.up))
actions.aoe+=/explosive_shot,if=buff.lock_and_load.react&(!talent.barrage.enabled|cooldown.barrage.remains>0)
actions.aoe+=/barrage
actions.aoe+=/black_arrow,if=!ticking
actions.aoe+=/explosive_shot,if=active_enemies<5
actions.aoe+=/explosive_trap,if=dot.explosive_trap.remains<=5
actions.aoe+=/a_murder_of_crows
actions.aoe+=/dire_beast
actions.aoe+=/multishot,if=buff.thrill_of_the_hunt.react&focus>50&cast_regen<=focus.deficit|dot.serpent_sting.remains<=5|target.time_to_die<4.5
actions.aoe+=/glaive_toss
actions.aoe+=/powershot
actions.aoe+=/cobra_shot,if=buff.pre_steady_focus.up&buff.steady_focus.remains<5&focus+14+cast_regen<80
actions.aoe+=/multishot,if=focus>=70|talent.focusing_shot.enabled
actions.aoe+=/focusing_shot
actions.aoe+=/cobra_shot

head=rylakstalkers_headguard,id=115545,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant_id=5320
shoulders=rylakstalkers_spaulders,id=115547,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant_id=5313
chest=rylakstalkers_tunic,id=115548,bonus_id=567
wrists=bloodwhirl_bracers,id=113968,bonus_id=567
hands=rylakstalkers_gloves,id=115549,bonus_id=567
waist=grenadiers_belt,id=113955,bonus_id=567
legs=legguards_of_the_stampede,id=113944,bonus_id=567
feet=treads_of_the_veteran_smith,id=119339,bonus_id=567
finger1=unexploded_explosive_shard,id=113877,bonus_id=567,enchant_id=5327
finger2=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant_id=5327
trinket1=humming_blackiron_trigger,id=113985,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
main_hand=garans_brutal_spearlauncher,id=113966,bonus_id=567,enchant_id=5275

# Gear Summary
# gear_ilvl=701.00
# gear_agility=4011
# gear_stamina=4763
# gear_crit_rating=849
# gear_haste_rating=422
# gear_mastery_rating=907
# gear_armor=1496
# gear_multistrike_rating=1973
# gear_versatility_rating=293
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
summon_pet=cat
]]

private.apls["Hunter_T17M.simc"] = [[

# Hunter Tier17 Regular

optimal_raid=1
Hunter_MM_T17M.simc
Hunter_SV_T17M.simc
Hunter_BM_T17M.simc
]]

private.apls["Mage_Arcane_T17M.simc"] = [[
mage="Mage_Arcane_T17M"
level=100
race=gnome
role=spell
position=back
talents=3003322
glyphs=cone_of_cold
spec=arcane

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/arcane_brilliance
actions.precombat+=/snapshot_stats
actions.precombat+=/rune_of_power
actions.precombat+=/mirror_image
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/arcane_blast

# Executed every time the actor is available.

actions=counterspell,if=target.debuff.casting.react
actions+=/stop_burn_phase,if=prev_gcd.evocation&burn_phase_duration>gcd.max
actions+=/cold_snap,if=health.pct<30
actions+=/time_warp,if=target.health.pct<25|time>5
actions+=/call_action_list,name=movement,if=raid_event.movement.exists
actions+=/rune_of_power,if=buff.rune_of_power.remains<2*spell_haste
actions+=/mirror_image
actions+=/cold_snap,if=buff.presence_of_mind.down&cooldown.presence_of_mind.remains>75
actions+=/call_action_list,name=aoe,if=active_enemies>=5
actions+=/call_action_list,name=init_burn,if=!burn_phase
actions+=/call_action_list,name=burn,if=burn_phase
actions+=/call_action_list,name=conserve

actions.movement=blink,if=movement.distance>10
actions.movement+=/blazing_speed,if=movement.remains>0
actions.movement+=/ice_floes,if=buff.ice_floes.down&(raid_event.movement.distance>0|raid_event.movement.in<2*spell_haste)

# Regular burn with evocation
actions.init_burn=start_burn_phase,if=buff.arcane_charge.stack>=4&(cooldown.prismatic_crystal.up|!talent.prismatic_crystal.enabled)&(cooldown.arcane_power.up|(glyph.arcane_power.enabled&cooldown.arcane_power.remains>60))&(cooldown.evocation.remains-2*buff.arcane_missiles.stack*spell_haste-gcd.max*talent.prismatic_crystal.enabled)*0.75*(1-0.1*(cooldown.arcane_power.remains<5))*(1-0.1*(talent.nether_tempest.enabled|talent.supernova.enabled))*(10%action.arcane_blast.execute_time)<mana.pct-20-2.5*active_enemies*(9-active_enemies)+(cooldown.evocation.remains*1.8%spell_haste)
# End of fight burn
actions.init_burn+=/start_burn_phase,if=target.time_to_die*0.75*(1-0.1*(talent.nether_tempest.enabled|talent.supernova.enabled))*(10%action.arcane_blast.execute_time)*1.1<mana.pct-10+(target.time_to_die*1.8%spell_haste)

# Conditions for initiating Prismatic Crystal
actions.init_crystal=call_action_list,name=conserve,if=buff.arcane_charge.stack<4
actions.init_crystal+=/prismatic_crystal

# Actions while Prismatic Crystal is active
actions.crystal_sequence=call_action_list,name=cooldowns
actions.crystal_sequence+=/nether_tempest,if=buff.arcane_charge.stack=4&!ticking&pet.prismatic_crystal.remains>8
actions.crystal_sequence+=/supernova,if=mana.pct<96
actions.crystal_sequence+=/presence_of_mind,if=cooldown.cold_snap.up|pet.prismatic_crystal.remains<2*spell_haste
actions.crystal_sequence+=/arcane_blast,if=buff.arcane_charge.stack=4&mana.pct>93&pet.prismatic_crystal.remains>cast_time
actions.crystal_sequence+=/arcane_missiles,if=pet.prismatic_crystal.remains>2*spell_haste+travel_time
actions.crystal_sequence+=/supernova,if=pet.prismatic_crystal.remains<2*spell_haste
actions.crystal_sequence+=/choose_target,if=pet.prismatic_crystal.remains<action.arcane_blast.cast_time&buff.presence_of_mind.down
actions.crystal_sequence+=/arcane_blast

# Consolidated damage cooldown abilities
actions.cooldowns=arcane_power
actions.cooldowns+=/blood_fury
actions.cooldowns+=/berserking
actions.cooldowns+=/arcane_torrent
actions.cooldowns+=/potion,name=draenic_intellect,if=buff.arcane_power.up&(!talent.prismatic_crystal.enabled|pet.prismatic_crystal.active)

# AoE sequence
actions.aoe=call_action_list,name=cooldowns
actions.aoe+=/nether_tempest,cycle_targets=1,if=buff.arcane_charge.stack=4&(active_dot.nether_tempest=0|(ticking&remains<3.6))
actions.aoe+=/supernova
actions.aoe+=/arcane_orb,if=buff.arcane_charge.stack<4
# APL hack for evocation interrupt
actions.aoe+=/arcane_explosion,if=prev_gcd.evocation
actions.aoe+=/evocation,interrupt_if=mana.pct>96,if=mana.pct<85-2.5*buff.arcane_charge.stack
actions.aoe+=/arcane_missiles,if=set_bonus.tier17_4pc&active_enemies<10&buff.arcane_charge.stack=4&buff.arcane_instability.react
actions.aoe+=/nether_tempest,cycle_targets=1,if=talent.arcane_orb.enabled&buff.arcane_charge.stack=4&ticking&remains<cooldown.arcane_orb.remains
actions.aoe+=/arcane_barrage,if=buff.arcane_charge.stack=4
actions.aoe+=/cone_of_cold,if=glyph.cone_of_cold.enabled
actions.aoe+=/arcane_explosion

# High mana usage, "Burn" sequence
actions.burn=call_action_list,name=init_crystal,if=talent.prismatic_crystal.enabled&cooldown.prismatic_crystal.up
actions.burn+=/call_action_list,name=crystal_sequence,if=talent.prismatic_crystal.enabled&pet.prismatic_crystal.active
actions.burn+=/call_action_list,name=cooldowns
actions.burn+=/arcane_missiles,if=buff.arcane_missiles.react=3
actions.burn+=/arcane_missiles,if=set_bonus.tier17_4pc&buff.arcane_instability.react&buff.arcane_instability.remains<action.arcane_blast.execute_time
actions.burn+=/supernova,if=target.time_to_die<8|charges=2
actions.burn+=/nether_tempest,cycle_targets=1,if=target!=pet.prismatic_crystal&buff.arcane_charge.stack=4&(active_dot.nether_tempest=0|(ticking&remains<3.6))
actions.burn+=/arcane_orb,if=buff.arcane_charge.stack<4
actions.burn+=/arcane_barrage,if=talent.arcane_orb.enabled&active_enemies>=3&buff.arcane_charge.stack=4&(cooldown.arcane_orb.remains<gcd.max|prev_gcd.arcane_orb)
actions.burn+=/presence_of_mind,if=(mana.pct>96&(!talent.prismatic_crystal.enabled|!cooldown.prismatic_crystal.up))|set_bonus.tier18_2pc
actions.burn+=/arcane_blast,if=buff.arcane_charge.stack=4&mana.pct>93
actions.burn+=/arcane_missiles,if=buff.arcane_charge.stack=4&(mana.pct>70|!cooldown.evocation.up|target.time_to_die<15)
actions.burn+=/supernova,if=mana.pct>70&mana.pct<96
actions.burn+=/evocation,interrupt_if=mana.pct>100-10%spell_haste,if=target.time_to_die>10&mana.pct<30+2.5*active_enemies*(9-active_enemies)-(40*(t18_class_trinket&buff.arcane_power.up))
actions.burn+=/presence_of_mind,if=!talent.prismatic_crystal.enabled|!cooldown.prismatic_crystal.up
actions.burn+=/arcane_blast
actions.burn+=/evocation

# Low mana usage, "Conserve" sequence
actions.conserve=call_action_list,name=cooldowns,if=target.time_to_die<15
actions.conserve+=/arcane_missiles,if=buff.arcane_missiles.react=3|(talent.overpowered.enabled&buff.arcane_power.up&buff.arcane_power.remains<action.arcane_blast.execute_time)
actions.conserve+=/arcane_missiles,if=set_bonus.tier17_4pc&buff.arcane_instability.react&buff.arcane_instability.remains<action.arcane_blast.execute_time
actions.conserve+=/nether_tempest,cycle_targets=1,if=target!=pet.prismatic_crystal&buff.arcane_charge.stack=4&(active_dot.nether_tempest=0|(ticking&remains<3.6))
actions.conserve+=/supernova,if=target.time_to_die<8|(charges=2&(buff.arcane_power.up|!cooldown.arcane_power.up)&(!talent.prismatic_crystal.enabled|cooldown.prismatic_crystal.remains>8))
actions.conserve+=/arcane_orb,if=buff.arcane_charge.stack<2
actions.conserve+=/presence_of_mind,if=(mana.pct>96&(!talent.prismatic_crystal.enabled|!cooldown.prismatic_crystal.up))|set_bonus.tier18_2pc
actions.conserve+=/arcane_blast,if=buff.arcane_charge.stack=4&mana.pct>93
actions.conserve+=/arcane_barrage,if=talent.arcane_orb.enabled&active_enemies>=3&buff.arcane_charge.stack=4&(cooldown.arcane_orb.remains<gcd.max|prev_gcd.arcane_orb)
actions.conserve+=/arcane_missiles,if=buff.arcane_charge.stack=4&(!talent.overpowered.enabled|cooldown.arcane_power.remains>10*spell_haste)
actions.conserve+=/supernova,if=mana.pct<96&(buff.arcane_missiles.stack<2|buff.arcane_charge.stack=4)&(buff.arcane_power.up|(charges=1&cooldown.arcane_power.remains>recharge_time))&(!talent.prismatic_crystal.enabled|current_target=pet.prismatic_crystal|(charges=1&cooldown.prismatic_crystal.remains>recharge_time+8))
actions.conserve+=/nether_tempest,cycle_targets=1,if=target!=pet.prismatic_crystal&buff.arcane_charge.stack=4&(active_dot.nether_tempest=0|(ticking&remains<(10-3*talent.arcane_orb.enabled)*spell_haste))
actions.conserve+=/arcane_barrage,if=buff.arcane_charge.stack=4
actions.conserve+=/presence_of_mind,if=buff.arcane_charge.stack<2&mana.pct>93
actions.conserve+=/arcane_blast
actions.conserve+=/arcane_barrage

head=arcanoshatter_hood,id=115553,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant=gift_of_mastery
shoulders=arcanoshatter_mantle,id=115551,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant=gift_of_mastery
chest=arcanoshatter_robes,id=115550,bonus_id=567
wrists=bracers_of_darkened_skies,id=119332,bonus_id=567
hands=toothbreaker_grips,id=113876,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=arcanoshatter_leggings,id=115554,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant=gift_of_mastery
finger2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_mastery
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
main_hand=infernoflame_staff,id=113869,bonus_id=567,enchant=mark_of_bleeding_hollow

# Gear Summary
# gear_ilvl=701.00
# gear_stamina=4763
# gear_intellect=3993
# gear_spell_power=1837
# gear_crit_rating=565
# gear_haste_rating=1014
# gear_mastery_rating=2180
# gear_armor=900
# gear_multistrike_rating=582
# gear_versatility_rating=108
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Mage_Fire_T17M.simc"] = [[
mage="Mage_Fire_T17M"
level=100
race=troll
role=spell
position=back
talents=3003322
glyphs=inferno_blast/combustion/dragons_breath
spec=fire

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=pickled_eel
actions.precombat+=/arcane_brilliance
actions.precombat+=/snapshot_stats
actions.precombat+=/rune_of_power
actions.precombat+=/mirror_image
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/pyroblast

# Executed every time the actor is available.

actions=stop_pyro_chain,if=prev_off_gcd.combustion
actions+=/counterspell,if=target.debuff.casting.react
actions+=/time_warp,if=target.health.pct<25|time>5
actions+=/call_action_list,name=movement,if=raid_event.movement.exists
actions+=/rune_of_power,if=buff.rune_of_power.remains<cast_time
actions+=/call_action_list,name=t17_2pc_combust,if=ptr=0&set_bonus.tier17_2pc&pyro_chain&(active_enemies>1|(talent.prismatic_crystal.enabled&cooldown.prismatic_crystal.remains>15))
actions+=/call_action_list,name=combust_sequence,if=pyro_chain
actions+=/call_action_list,name=crystal_sequence,if=talent.prismatic_crystal.enabled&pet.prismatic_crystal.active
actions+=/call_action_list,name=init_combust,if=!pyro_chain
# Utilize level 90 active talents while avoiding pyro munching
actions+=/rune_of_power,if=buff.rune_of_power.remains<action.fireball.execute_time+gcd.max&!(buff.heating_up.up&action.fireball.in_flight)
actions+=/mirror_image,if=!(buff.heating_up.up&action.fireball.in_flight)
actions+=/call_action_list,name=aoe,if=active_enemies>10
actions+=/call_action_list,name=single_target

actions.movement=blink,if=movement.distance>10
actions.movement+=/blazing_speed,if=movement.remains>0
actions.movement+=/ice_floes,if=buff.ice_floes.down&(raid_event.movement.distance>0|raid_event.movement.in<action.fireball.cast_time)

# Action list while Prismatic Crystal is up
actions.crystal_sequence=choose_target,name=prismatic_crystal
# Spread Combustion from PC
actions.crystal_sequence+=/inferno_blast,if=dot.combustion.ticking&active_dot.combustion<active_enemies+1
# Spread Combustion on multitarget fights
actions.crystal_sequence+=/inferno_blast,cycle_targets=1,if=dot.combustion.ticking&active_dot.combustion<active_enemies
actions.crystal_sequence+=/blast_wave
# Use pyros before PC's expiration
actions.crystal_sequence+=/pyroblast,if=execute_time=gcd.max&pet.prismatic_crystal.remains<gcd.max+travel_time&pet.prismatic_crystal.remains>travel_time
actions.crystal_sequence+=/call_action_list,name=single_target

# Combustion sequence initialization
# This sequence lists the requirements for preparing a Combustion combo with each talent choice
# Meteor Combustion
actions.init_combust=start_pyro_chain,if=talent.meteor.enabled&cooldown.meteor.up&((cooldown.combustion.remains<gcd.max*3&buff.pyroblast.up&(buff.heating_up.up^action.fireball.in_flight))|(buff.pyromaniac.up&(cooldown.combustion.remains<ceil(buff.pyromaniac.remains%gcd.max)*gcd.max)))
# Prismatic Crystal Combustion without 2T17
actions.init_combust+=/start_pyro_chain,if=talent.prismatic_crystal.enabled&(ptr=1|!set_bonus.tier17_2pc)&cooldown.prismatic_crystal.up&((cooldown.combustion.remains<gcd.max*2&buff.pyroblast.up&(buff.heating_up.up^action.fireball.in_flight))|(buff.pyromaniac.up&(cooldown.combustion.remains<ceil(buff.pyromaniac.remains%gcd.max)*gcd.max)))
# Prismatic Crystal Combustion with 2T17
actions.init_combust+=/start_pyro_chain,if=talent.prismatic_crystal.enabled&ptr=0&set_bonus.tier17_2pc&cooldown.prismatic_crystal.up&cooldown.combustion.remains<gcd.max*2&buff.pyroblast.up&(buff.heating_up.up^action.fireball.in_flight)
# Unglyphed Combustions between Prismatic Crystals
actions.init_combust+=/start_pyro_chain,if=talent.prismatic_crystal.enabled&!glyph.combustion.enabled&cooldown.prismatic_crystal.remains>20&((cooldown.combustion.remains<gcd.max*2&buff.pyroblast.up&buff.heating_up.up&action.fireball.in_flight)|(buff.pyromaniac.up&(cooldown.combustion.remains<ceil(buff.pyromaniac.remains%gcd.max)*gcd.max)))
# Kindling or Level 90 Combustion
actions.init_combust+=/start_pyro_chain,if=!talent.prismatic_crystal.enabled&!talent.meteor.enabled&((cooldown.combustion.remains<gcd.max*4&buff.pyroblast.up&buff.heating_up.up&action.fireball.in_flight)|(buff.pyromaniac.up&cooldown.combustion.remains<ceil(buff.pyromaniac.remains%gcd.max)*(gcd.max+talent.kindling.enabled)))

# 2T17 two-target Combustion sequence
actions.t17_2pc_combust=prismatic_crystal
actions.t17_2pc_combust+=/blood_fury
actions.t17_2pc_combust+=/berserking
actions.t17_2pc_combust+=/arcane_torrent
actions.t17_2pc_combust+=/potion,name=draenic_intellect
# Second pre-combust IB
actions.t17_2pc_combust+=/inferno_blast,if=prev_gcd.inferno_blast&pyro_chain_duration>gcd.max*3
# First pre-combust IB
actions.t17_2pc_combust+=/inferno_blast,if=charges_fractional>=2-(gcd.max%8)&((buff.pyroblast.down&buff.pyromaniac.down)|(current_target=pet.prismatic_crystal&pet.prismatic_crystal.remains*2<gcd.max*5))
# Search for enemy with highest ignite for Combustion
actions.t17_2pc_combust+=/choose_target,target_if=max:dot.ignite.tick_dmg,if=prev_gcd.inferno_blast
# Failsafe: Pyroblast after double IB if ignite ticks are low
actions.t17_2pc_combust+=/pyroblast,if=prev_gcd.inferno_blast&execute_time=gcd.max&dot.ignite.tick_dmg*(6-ceil(dot.ignite.remains-travel_time))*100<hit_damage*(100+crit_pct_current)*mastery_value
# Combustion; Will only trigger post double IB
actions.t17_2pc_combust+=/combustion,if=prev_gcd.inferno_blast&pyro_chain_duration>gcd.max
actions.t17_2pc_combust+=/combustion,if=prev_gcd.pyroblast&action.inferno_blast.charges=0&pyro_chain_duration>gcd.max
actions.t17_2pc_combust+=/meteor,if=active_enemies<=2&prev_gcd.pyroblast
actions.t17_2pc_combust+=/pyroblast,if=buff.pyroblast.up&buff.heating_up.up&action.fireball.in_flight
# Initial Fireball
actions.t17_2pc_combust+=/fireball,if=!dot.ignite.ticking&!in_flight
actions.t17_2pc_combust+=/pyroblast,if=set_bonus.tier17_4pc&buff.pyromaniac.up
# Conditional second Fireball
actions.t17_2pc_combust+=/fireball,if=buff.pyroblast.up&buff.heating_up.down&dot.ignite.tick_dmg*100*(execute_time+travel_time)<hit_damage*(100+crit_pct_current)*mastery_value&(!current_target=pet.prismatic_crystal|pet.prismatic_crystal.remains>6)
# Pyroblast trigger due to Prismatic Crystal's limited duration
actions.t17_2pc_combust+=/pyroblast,if=current_target=pet.prismatic_crystal&pet.prismatic_crystal.remains<gcd.max*4&execute_time=gcd.max
# Final Pyroblast spam before double IB
actions.t17_2pc_combust+=/pyroblast,if=buff.pyroblast.up&action.inferno_blast.charges_fractional>=2-(gcd.max%4)&(current_target!=pet.prismatic_crystal|pet.prismatic_crystal.remains<8)&prev_gcd.pyroblast
# Failsafe: use IB before combusting anyway if double non-crit happens early
actions.t17_2pc_combust+=/inferno_blast,if=buff.pyroblast.down&buff.heating_up.down&prev_gcd.pyroblast
actions.t17_2pc_combust+=/fireball

# Combustion Sequence
actions.combust_sequence=prismatic_crystal
actions.combust_sequence+=/blood_fury
actions.combust_sequence+=/berserking
actions.combust_sequence+=/arcane_torrent
actions.combust_sequence+=/potion,name=draenic_intellect
actions.combust_sequence+=/meteor,if=active_enemies<=2
actions.combust_sequence+=/pyroblast,if=set_bonus.tier17_4pc&buff.pyromaniac.up
actions.combust_sequence+=/inferno_blast,if=set_bonus.tier16_4pc_caster&(buff.pyroblast.up^buff.heating_up.up)
actions.combust_sequence+=/fireball,if=!dot.ignite.ticking&!in_flight
actions.combust_sequence+=/pyroblast,if=buff.pyroblast.up&dot.ignite.tick_dmg*(6-ceil(dot.ignite.remains-travel_time))<crit_damage*mastery_value
# Meteor Combustions can run out of Pyro procs before impact. Use IB to delay Combustion
actions.combust_sequence+=/inferno_blast,if=talent.meteor.enabled&cooldown.meteor.duration-cooldown.meteor.remains<gcd.max*3
actions.combust_sequence+=/inferno_blast,if=dot.ignite.tick_dmg*(6-dot.ignite.ticks_remain)<crit_damage*mastery_value
actions.combust_sequence+=/combustion

# Active talents usage
actions.active_talents=meteor,if=active_enemies>=3|(glyph.combustion.enabled&(!talent.incanters_flow.enabled|buff.incanters_flow.stack+incanters_flow_dir>=4)&cooldown.meteor.duration-cooldown.combustion.remains<10)
actions.active_talents+=/call_action_list,name=living_bomb,if=talent.living_bomb.enabled&(active_enemies>1|raid_event.adds.in<10)
actions.active_talents+=/blast_wave,if=(!talent.incanters_flow.enabled|buff.incanters_flow.stack>=4)&(target.time_to_die<10|!talent.prismatic_crystal.enabled|(charges>=1&cooldown.prismatic_crystal.remains>recharge_time))

# Living Bomb application
actions.living_bomb=inferno_blast,cycle_targets=1,if=dot.living_bomb.ticking&active_dot.living_bomb<active_enemies
actions.living_bomb+=/living_bomb,cycle_targets=1,if=target!=pet.prismatic_crystal&(active_dot.living_bomb=0|(ticking&active_dot.living_bomb=1))&(((!talent.incanters_flow.enabled|incanters_flow_dir<0|buff.incanters_flow.stack=5)&remains<3.6)|((incanters_flow_dir>0|buff.incanters_flow.stack=1)&remains<gcd.max))&target.time_to_die>remains+12

# AoE sequence
actions.aoe=inferno_blast,cycle_targets=1,if=(dot.combustion.ticking&active_dot.combustion<active_enemies)|(dot.pyroblast.ticking&active_dot.pyroblast<active_enemies)
actions.aoe+=/call_action_list,name=active_talents
actions.aoe+=/pyroblast,if=buff.pyroblast.react|buff.pyromaniac.react
actions.aoe+=/pyroblast,if=active_dot.pyroblast=0&!in_flight
actions.aoe+=/cold_snap,if=glyph.dragons_breath.enabled&!cooldown.dragons_breath.up
actions.aoe+=/dragons_breath,if=glyph.dragons_breath.enabled
actions.aoe+=/flamestrike,if=mana.pct>10&remains<2.4

# Single target sequence
actions.single_target=inferno_blast,if=(dot.combustion.ticking&active_dot.combustion<active_enemies)|(dot.living_bomb.ticking&active_dot.living_bomb<active_enemies)
# Use Pyro procs before they run out
actions.single_target+=/pyroblast,if=buff.pyroblast.up&buff.pyroblast.remains<action.fireball.execute_time
actions.single_target+=/pyroblast,if=set_bonus.tier16_2pc_caster&buff.pyroblast.up&buff.potent_flames.up&buff.potent_flames.remains<gcd.max
actions.single_target+=/pyroblast,if=set_bonus.tier17_4pc&buff.pyromaniac.react
# Pyro camp during regular sequence; Do not use Pyro procs without HU and first using fireball
actions.single_target+=/pyroblast,if=buff.pyroblast.up&buff.heating_up.up&action.fireball.in_flight
# Aggressively use Pyro with 2T17 and IB available
actions.single_target+=/pyroblast,if=ptr=0&set_bonus.tier17_2pc&buff.pyroblast.up&cooldown.combustion.remains>8&action.inferno_blast.charges_fractional>1-(gcd.max%8)
# Heating Up conversion to Pyroblast
actions.single_target+=/inferno_blast,if=(cooldown.combustion.remains%8+charges_fractional>=2|ptr=0|!set_bonus.tier17_2pc|!(active_enemies>1|talent.prismatic_crystal.enabled))&buff.pyroblast.down&buff.heating_up.up
actions.single_target+=/call_action_list,name=active_talents
# Adding Heating Up to Pyroblast
actions.single_target+=/inferno_blast,if=(cooldown.combustion.remains%8+charges_fractional>=2|ptr=0|!set_bonus.tier17_2pc|!(active_enemies>1|talent.prismatic_crystal.enabled))&buff.pyroblast.up&buff.heating_up.down&!action.fireball.in_flight
# Aggressively use IB with 2T17
actions.single_target+=/inferno_blast,if=ptr=0&set_bonus.tier17_2pc&(cooldown.combustion.remains%8+charges_fractional>2|!set_bonus.tier17_2pc|!(active_enemies>1|talent.prismatic_crystal.enabled))&charges_fractional>2-(gcd.max%8)
actions.single_target+=/fireball
actions.single_target+=/scorch,moving=1

head=arcanoshatter_hood,id=115553,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant=gift_of_critical_strike
shoulders=arcanoshatter_mantle,id=115551,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant=gift_of_critical_strike
chest=arcanoshatter_robes,id=115550,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=arcanoshatter_gloves,id=115552,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=turret_mechanics_legwraps,id=113970,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant=gift_of_critical_strike
finger2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_critical_strike
trinket1=goren_soul_repository,id=119194,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
main_hand=blackhand_doomstaff,id=113988,bonus_id=567,enchant=mark_of_the_thunderlord

# Gear Summary
# gear_ilvl=701.00
# gear_stamina=4763
# gear_intellect=3993
# gear_spell_power=1837
# gear_crit_rating=1391
# gear_haste_rating=944
# gear_mastery_rating=1759
# gear_armor=900
# gear_multistrike_rating=229
# gear_versatility_rating=108
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Mage_Frost_T17M.simc"] = [[
mage="Mage_Frost_T17M"
level=100
race=dwarf
role=spell
position=back
talents=3003122
glyphs=icy_veins/splitting_ice/cone_of_cold
spec=frost

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/arcane_brilliance
actions.precombat+=/water_elemental
actions.precombat+=/snapshot_stats
actions.precombat+=/rune_of_power
actions.precombat+=/mirror_image
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/frostbolt,if=!talent.frost_bomb.enabled
actions.precombat+=/frost_bomb

# Executed every time the actor is available.

actions=counterspell,if=target.debuff.casting.react
actions+=/time_warp,if=target.health.pct<25|time>5
actions+=/call_action_list,name=movement,if=raid_event.movement.exists
actions+=/call_action_list,name=water_jet,if=prev_off_gcd.water_jet|debuff.water_jet.remains>0
actions+=/mirror_image
actions+=/rune_of_power,if=buff.rune_of_power.remains<cast_time
actions+=/rune_of_power,if=(cooldown.icy_veins.remains<gcd.max&buff.rune_of_power.remains<20)|(cooldown.prismatic_crystal.remains<gcd.max&buff.rune_of_power.remains<10)
actions+=/call_action_list,name=cooldowns,if=target.time_to_die<24
# Water jet on pull for non IN+PC talent combos
actions+=/water_jet,if=time<1&active_enemies<4&!(talent.ice_nova.enabled&talent.prismatic_crystal.enabled)
actions+=/call_action_list,name=crystal_sequence,if=talent.prismatic_crystal.enabled&(cooldown.prismatic_crystal.remains<=gcd.max|pet.prismatic_crystal.active)
actions+=/call_action_list,name=aoe,if=active_enemies>=4
actions+=/call_action_list,name=single_target

actions.movement=blink,if=movement.distance>10
actions.movement+=/blazing_speed,if=movement.remains>0
actions.movement+=/ice_floes,if=buff.ice_floes.down&(raid_event.movement.distance>0|raid_event.movement.in<action.frostbolt.cast_time)

# Actions while Prismatic Crystal is active
actions.crystal_sequence=frost_bomb,if=active_enemies=1&current_target!=pet.prismatic_crystal&remains<10
actions.crystal_sequence+=/prismatic_crystal
actions.crystal_sequence+=/frozen_orb
actions.crystal_sequence+=/call_action_list,name=cooldowns
actions.crystal_sequence+=/frost_bomb,if=talent.prismatic_crystal.enabled&current_target=pet.prismatic_crystal&active_enemies>1&!ticking
actions.crystal_sequence+=/ice_lance,if=buff.fingers_of_frost.react=2|(buff.fingers_of_frost.react&active_dot.frozen_orb>=1)
actions.crystal_sequence+=/ice_nova,if=charges=2|pet.prismatic_crystal.remains<gcd.max
actions.crystal_sequence+=/ice_lance,if=buff.fingers_of_frost.react
actions.crystal_sequence+=/frostfire_bolt,if=buff.brain_freeze.react
actions.crystal_sequence+=/ice_nova
actions.crystal_sequence+=/blizzard,interrupt_if=cooldown.frozen_orb.up|(talent.frost_bomb.enabled&buff.fingers_of_frost.react=2),if=active_enemies>=5
actions.crystal_sequence+=/choose_target,if=pet.prismatic_crystal.remains<action.frostbolt.cast_time+action.frostbolt.travel_time
actions.crystal_sequence+=/frostbolt

# Consolidated damage cooldown abilities
actions.cooldowns=icy_veins
actions.cooldowns+=/blood_fury
actions.cooldowns+=/berserking
actions.cooldowns+=/arcane_torrent
actions.cooldowns+=/potion,name=draenic_intellect,if=buff.bloodlust.up|buff.icy_veins.up

# Water Jet initialization
actions.init_water_jet=frost_bomb,if=remains<3.6
actions.init_water_jet+=/ice_lance,if=buff.fingers_of_frost.react&pet.water_elemental.cooldown.water_jet.up
actions.init_water_jet+=/water_jet,if=prev_gcd.frostbolt|action.frostbolt.travel_time<spell_haste
actions.init_water_jet+=/frostbolt

# Water Jet sequence
actions.water_jet=frostbolt,if=prev_off_gcd.water_jet
actions.water_jet+=/ice_lance,if=buff.fingers_of_frost.react=2&action.frostbolt.in_flight
actions.water_jet+=/frostbolt,if=debuff.water_jet.remains>cast_time+travel_time
actions.water_jet+=/ice_lance,if=prev_gcd.frostbolt

# AoE sequence
actions.aoe=call_action_list,name=cooldowns
actions.aoe+=/frost_bomb,if=remains<action.ice_lance.travel_time&(cooldown.frozen_orb.remains<gcd.max|buff.fingers_of_frost.react=2)
actions.aoe+=/frozen_orb
actions.aoe+=/ice_lance,if=talent.frost_bomb.enabled&buff.fingers_of_frost.react&debuff.frost_bomb.up
actions.aoe+=/comet_storm
actions.aoe+=/ice_nova
actions.aoe+=/blizzard,interrupt_if=cooldown.frozen_orb.up|(talent.frost_bomb.enabled&buff.fingers_of_frost.react=2)

# Single target sequence
actions.single_target=call_action_list,name=cooldowns,if=!talent.prismatic_crystal.enabled|cooldown.prismatic_crystal.remains>15
# Safeguards against losing FoF and BF to buff expiry
actions.single_target+=/ice_lance,if=buff.fingers_of_frost.react&buff.fingers_of_frost.remains<action.frostbolt.execute_time
actions.single_target+=/frostfire_bolt,if=buff.brain_freeze.react&buff.brain_freeze.remains<action.frostbolt.execute_time
# Frozen Orb usage without Prismatic Crystal
actions.single_target+=/frost_bomb,if=!talent.prismatic_crystal.enabled&cooldown.frozen_orb.remains<gcd.max&debuff.frost_bomb.remains<10
actions.single_target+=/frozen_orb,if=!talent.prismatic_crystal.enabled&buff.fingers_of_frost.stack<2&cooldown.icy_veins.remains>45
# Single target routine; Rough summary: IN2 > FoF2 > CmS > IN > BF > FoF
actions.single_target+=/frost_bomb,if=remains<action.ice_lance.travel_time&(buff.fingers_of_frost.react=2|(buff.fingers_of_frost.react&(talent.thermal_void.enabled|buff.fingers_of_frost.remains<gcd.max*2)))
actions.single_target+=/ice_nova,if=target.time_to_die<10|(charges=2&(!talent.prismatic_crystal.enabled|!cooldown.prismatic_crystal.up))
actions.single_target+=/frostbolt,if=t18_class_trinket&buff.fingers_of_frost.react=2&!in_flight
actions.single_target+=/ice_lance,if=buff.fingers_of_frost.react=2|(buff.fingers_of_frost.react&dot.frozen_orb.ticking)
actions.single_target+=/comet_storm
actions.single_target+=/ice_nova,if=(!talent.prismatic_crystal.enabled|(charges=1&cooldown.prismatic_crystal.remains>recharge_time&(buff.incanters_flow.stack>3|!talent.ice_nova.enabled)))&(buff.icy_veins.up|(charges=1&cooldown.icy_veins.remains>recharge_time))
actions.single_target+=/frostfire_bolt,if=buff.brain_freeze.react
actions.single_target+=/frostbolt,if=t18_class_trinket&buff.fingers_of_frost.react&!in_flight
actions.single_target+=/ice_lance,if=talent.frost_bomb.enabled&buff.fingers_of_frost.react&debuff.frost_bomb.remains>travel_time&(!talent.thermal_void.enabled|cooldown.icy_veins.remains>8)
# Camp procs and spam Frostbolt while 4T17 buff is up
actions.single_target+=/frostbolt,if=set_bonus.tier17_2pc&buff.ice_shard.up&!(talent.thermal_void.enabled&buff.icy_veins.up&buff.icy_veins.remains<10)
actions.single_target+=/call_action_list,name=init_water_jet,if=pet.water_elemental.cooldown.water_jet.remains<=gcd.max*(buff.fingers_of_frost.react+talent.frost_bomb.enabled)&!dot.frozen_orb.ticking
actions.single_target+=/ice_lance,if=!talent.frost_bomb.enabled&buff.fingers_of_frost.react&(!talent.thermal_void.enabled|cooldown.icy_veins.remains>8)
actions.single_target+=/frostbolt
actions.single_target+=/ice_lance,moving=1

head=flareeyed_hood,id=113868,bonus_id=567
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_multistrike
shoulders=arcanoshatter_mantle,id=115551,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_multistrike
chest=arcanoshatter_robes,id=115550,bonus_id=567
wrists=bracers_of_spattered_steel,id=113887,bonus_id=567
hands=arcanoshatter_gloves,id=115552,bonus_id=567
waist=deckhands_rope_belt,id=113967,bonus_id=567
legs=arcanoshatter_leggings,id=115554,bonus_id=567
feet=inferno_breath_sandals,id=113942,bonus_id=567
finger1=epicenter_loop,id=113947,bonus_id=567,enchant=gift_of_multistrike
finger2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_multistrike
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
main_hand=fang_of_the_earth,id=113934,bonus_id=567,enchant=mark_of_the_frostwolf
off_hand=enginestokers_lantern,id=113960,bonus_id=567

# Gear Summary
# gear_ilvl=700.94
# gear_stamina=4759
# gear_intellect=3989
# gear_spell_power=1834
# gear_crit_rating=1191
# gear_haste_rating=728
# gear_mastery_rating=505
# gear_armor=900
# gear_multistrike_rating=1435
# gear_versatility_rating=546
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Monk_Brewmaster_1h_CE_T17M.simc"] = [[
monk="Monk_Brewmaster_1h_CE_T17M"
level=100
race=night_elf
role=tank
position=front
talents=0130122
glyphs=fortifying_brew,expel_harm,fortuitous_spheres
spec=brewmaster

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/stance,choose=sturdy_ox
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_armor
actions.precombat+=/dampen_harm

# Executed every time the actor is available.

actions=auto_attack
actions+=/blood_fury,if=energy<=40
actions+=/berserking,if=energy<=40
actions+=/arcane_torrent,if=chi.max-chi>=1&energy<=40
actions+=/chi_sphere,if=talent.power_strikes.enabled&buff.chi_sphere.react&chi<4
actions+=/chi_brew,if=talent.chi_brew.enabled&chi.max-chi>=2&buff.elusive_brew_stacks.stack<=10&((charges=1&recharge_time<5)|charges=2|(target.time_to_die<15&(cooldown.touch_of_death.remains>target.time_to_die|glyph.touch_of_death.enabled)))
actions+=/chi_brew,if=(chi<1&stagger.heavy)|(chi<2&buff.shuffle.down)
actions+=/gift_of_the_ox,if=buff.gift_of_the_ox.react&incoming_damage_1500ms
actions+=/diffuse_magic,if=incoming_damage_1500ms&buff.fortifying_brew.down
actions+=/dampen_harm,if=incoming_damage_1500ms&buff.fortifying_brew.down&buff.elusive_brew_activated.down
actions+=/fortifying_brew,if=incoming_damage_1500ms&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down
actions+=/use_item,name=tablet_of_turnbuckle_teamwork,if=incoming_damage_1500ms&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.fortifying_brew.down&buff.elusive_brew_activated.down
actions+=/elusive_brew,if=buff.elusive_brew_stacks.react>=9&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down
actions+=/invoke_xuen,if=talent.invoke_xuen.enabled&target.time_to_die>15&buff.shuffle.remains>=3&buff.serenity.down
actions+=/serenity,if=talent.serenity.enabled&cooldown.keg_smash.remains>6
actions+=/potion,name=draenic_armor,if=(buff.fortifying_brew.down&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down)
actions+=/touch_of_death,if=target.health.percent<10&cooldown.touch_of_death.remains=0&((!glyph.touch_of_death.enabled&chi>=3&target.time_to_die<8)|(glyph.touch_of_death.enabled&target.time_to_die<5))
actions+=/call_action_list,name=st,if=active_enemies<3
actions+=/call_action_list,name=aoe,if=active_enemies>=3

actions.st=purifying_brew,if=stagger.heavy
actions.st+=/blackout_kick,if=buff.shuffle.down
actions.st+=/purifying_brew,if=buff.serenity.up
actions.st+=/chi_explosion,if=chi>=3
actions.st+=/purifying_brew,if=stagger.moderate&buff.shuffle.remains>=6
actions.st+=/guard,if=(charges=1&recharge_time<5)|charges=2|target.time_to_die<15
actions.st+=/guard,if=incoming_damage_10s>=health.max*0.5
actions.st+=/chi_brew,if=target.health.percent<10&cooldown.touch_of_death.remains=0&chi.max-chi>=2&(buff.shuffle.remains>=6|target.time_to_die<buff.shuffle.remains)&!glyph.touch_of_death.enabled
actions.st+=/keg_smash,if=chi.max-chi>=2&!buff.serenity.remains
actions.st+=/blackout_kick,if=buff.shuffle.remains<=3&cooldown.keg_smash.remains>=gcd
actions.st+=/blackout_kick,if=buff.serenity.up
actions.st+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/zen_sphere,cycle_targets=1,if=!dot.zen_sphere.ticking&energy.time_to_max>2&buff.serenity.down
actions.st+=/blackout_kick,if=chi.max-chi<2
actions.st+=/expel_harm,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.st+=/jab,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&cooldown.expel_harm.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.st+=/tiger_palm

actions.aoe=purifying_brew,if=stagger.heavy
actions.aoe+=/blackout_kick,if=buff.shuffle.down
actions.aoe+=/purifying_brew,if=buff.serenity.up
actions.aoe+=/chi_explosion,if=chi>=4
actions.aoe+=/purifying_brew,if=stagger.moderate&buff.shuffle.remains>=6
actions.aoe+=/guard,if=(charges=1&recharge_time<5)|charges=2|target.time_to_die<15
actions.aoe+=/guard,if=incoming_damage_10s>=health.max*0.5
actions.aoe+=/chi_brew,if=target.health.percent<10&cooldown.touch_of_death.remains=0&chi<=3&chi>=1&(buff.shuffle.remains>=6|target.time_to_die<buff.shuffle.remains)&!glyph.touch_of_death.enabled
actions.aoe+=/keg_smash,if=chi.max-chi>=2&!buff.serenity.remains
actions.aoe+=/blackout_kick,if=buff.shuffle.remains<=3&cooldown.keg_smash.remains>=gcd
actions.aoe+=/blackout_kick,if=buff.serenity.up
actions.aoe+=/rushing_jade_wind,if=chi.max-chi>=1&buff.serenity.down
actions.aoe+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.aoe+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.aoe+=/zen_sphere,cycle_targets=1,if=!dot.zen_sphere.ticking&energy.time_to_max>2&buff.serenity.down
actions.aoe+=/blackout_kick,if=chi.max-chi<2
actions.aoe+=/expel_harm,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.aoe+=/jab,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&cooldown.expel_harm.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.aoe+=/tiger_palm

head=helm_of_the_somber_gaze,id=115556,bonus_id=567
neck=gluttons_kerchief,id=113882,bonus_id=567,enchant=gift_of_mastery
shoulders=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_mastery
chest=unrendable_wolfhide_robes,id=113951,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=handwraps_of_the_somber_gaze,id=115555,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_mastery
finger2=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_mastery
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
main_hand=phemos_double_slasher,id=113667,bonus_id=567,enchant=mark_of_bleeding_hollow
off_hand=phemos_double_slasher,id=113667,bonus_id=567,enchant=mark_of_bleeding_hollow

# Gear Summary
# gear_ilvl=699.06
# gear_agility=3092
# gear_stamina=4640
# gear_crit_rating=551
# gear_haste_rating=214
# gear_mastery_rating=2040
# gear_armor=1177
# gear_bonus_armor=976
# gear_multistrike_rating=1518
# gear_versatility_rating=125
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Monk_Brewmaster_1h_Serenity_T17M.simc"] = [[
monk="Monk_Brewmaster_1h_Serenity_T17M"
level=100
race=night_elf
role=tank
position=front
talents=0130123
glyphs=fortifying_brew,expel_harm,fortuitous_spheres
spec=brewmaster

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/stance,choose=sturdy_ox
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_armor
actions.precombat+=/dampen_harm

# Executed every time the actor is available.

actions=auto_attack
actions+=/blood_fury,if=energy<=40
actions+=/berserking,if=energy<=40
actions+=/arcane_torrent,if=chi.max-chi>=1&energy<=40
actions+=/chi_sphere,if=talent.power_strikes.enabled&buff.chi_sphere.react&chi<4
actions+=/chi_brew,if=talent.chi_brew.enabled&chi.max-chi>=2&buff.elusive_brew_stacks.stack<=10&((charges=1&recharge_time<5)|charges=2|(target.time_to_die<15&(cooldown.touch_of_death.remains>target.time_to_die|glyph.touch_of_death.enabled)))
actions+=/chi_brew,if=(chi<1&stagger.heavy)|(chi<2&buff.shuffle.down)
actions+=/gift_of_the_ox,if=buff.gift_of_the_ox.react&incoming_damage_1500ms
actions+=/diffuse_magic,if=incoming_damage_1500ms&buff.fortifying_brew.down
actions+=/dampen_harm,if=incoming_damage_1500ms&buff.fortifying_brew.down&buff.elusive_brew_activated.down
actions+=/fortifying_brew,if=incoming_damage_1500ms&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down
actions+=/use_item,name=tablet_of_turnbuckle_teamwork,if=incoming_damage_1500ms&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.fortifying_brew.down&buff.elusive_brew_activated.down
actions+=/elusive_brew,if=buff.elusive_brew_stacks.react>=9&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down
actions+=/invoke_xuen,if=talent.invoke_xuen.enabled&target.time_to_die>15&buff.shuffle.remains>=3&buff.serenity.down
actions+=/serenity,if=talent.serenity.enabled&cooldown.keg_smash.remains>6
actions+=/potion,name=draenic_armor,if=(buff.fortifying_brew.down&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down)
actions+=/touch_of_death,if=target.health.percent<10&cooldown.touch_of_death.remains=0&((!glyph.touch_of_death.enabled&chi>=3&target.time_to_die<8)|(glyph.touch_of_death.enabled&target.time_to_die<5))
actions+=/call_action_list,name=st,if=active_enemies<3
actions+=/call_action_list,name=aoe,if=active_enemies>=3

actions.st=purifying_brew,if=stagger.heavy
actions.st+=/blackout_kick,if=buff.shuffle.down
actions.st+=/purifying_brew,if=buff.serenity.up
actions.st+=/chi_explosion,if=chi>=3
actions.st+=/purifying_brew,if=stagger.moderate&buff.shuffle.remains>=6
actions.st+=/guard,if=(charges=1&recharge_time<5)|charges=2|target.time_to_die<15
actions.st+=/guard,if=incoming_damage_10s>=health.max*0.5
actions.st+=/chi_brew,if=target.health.percent<10&cooldown.touch_of_death.remains=0&chi.max-chi>=2&(buff.shuffle.remains>=6|target.time_to_die<buff.shuffle.remains)&!glyph.touch_of_death.enabled
actions.st+=/keg_smash,if=chi.max-chi>=2&!buff.serenity.remains
actions.st+=/blackout_kick,if=buff.shuffle.remains<=3&cooldown.keg_smash.remains>=gcd
actions.st+=/blackout_kick,if=buff.serenity.up
actions.st+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/zen_sphere,cycle_targets=1,if=!dot.zen_sphere.ticking&energy.time_to_max>2&buff.serenity.down
actions.st+=/blackout_kick,if=chi.max-chi<2
actions.st+=/expel_harm,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.st+=/jab,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&cooldown.expel_harm.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.st+=/tiger_palm

actions.aoe=purifying_brew,if=stagger.heavy
actions.aoe+=/blackout_kick,if=buff.shuffle.down
actions.aoe+=/purifying_brew,if=buff.serenity.up
actions.aoe+=/chi_explosion,if=chi>=4
actions.aoe+=/purifying_brew,if=stagger.moderate&buff.shuffle.remains>=6
actions.aoe+=/guard,if=(charges=1&recharge_time<5)|charges=2|target.time_to_die<15
actions.aoe+=/guard,if=incoming_damage_10s>=health.max*0.5
actions.aoe+=/chi_brew,if=target.health.percent<10&cooldown.touch_of_death.remains=0&chi<=3&chi>=1&(buff.shuffle.remains>=6|target.time_to_die<buff.shuffle.remains)&!glyph.touch_of_death.enabled
actions.aoe+=/keg_smash,if=chi.max-chi>=2&!buff.serenity.remains
actions.aoe+=/blackout_kick,if=buff.shuffle.remains<=3&cooldown.keg_smash.remains>=gcd
actions.aoe+=/blackout_kick,if=buff.serenity.up
actions.aoe+=/rushing_jade_wind,if=chi.max-chi>=1&buff.serenity.down
actions.aoe+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.aoe+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.aoe+=/zen_sphere,cycle_targets=1,if=!dot.zen_sphere.ticking&energy.time_to_max>2&buff.serenity.down
actions.aoe+=/blackout_kick,if=chi.max-chi<2
actions.aoe+=/expel_harm,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.aoe+=/jab,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&cooldown.expel_harm.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.aoe+=/tiger_palm

head=sorkas_nightshade_cowl,id=113978,bonus_id=567
neck=choker_of_bestial_force,id=113952,bonus_id=567,enchant=gift_of_mastery
shoulders=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_mastery
chest=vest_of_the_somber_gaze,id=115558,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=handwraps_of_the_somber_gaze,id=115555,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_mastery
finger2=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_mastery
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
main_hand=sorkas_chainfist,id=113965,bonus_id=567,enchant=mark_of_blackrock
off_hand=sorkas_chainfist,id=113965,bonus_id=567,enchant=mark_of_bleeding_hollow

# Gear Summary
# gear_ilvl=700.94
# gear_agility=3128
# gear_stamina=4694
# gear_crit_rating=739
# gear_haste_rating=381
# gear_mastery_rating=2192
# gear_armor=1177
# gear_bonus_armor=987
# gear_multistrike_rating=1022
# gear_versatility_rating=125
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Monk_Brewmaster_2h_CE_T17M.simc"] = [[
monk="Monk_Brewmaster_2h_CE_T17M"
level=100
race=night_elf
role=tank
position=front
talents=0130122
glyphs=fortifying_brew,expel_harm,fortuitous_spheres
spec=brewmaster

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/stance,choose=sturdy_ox
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_armor
actions.precombat+=/dampen_harm

# Executed every time the actor is available.

actions=auto_attack
actions+=/blood_fury,if=energy<=40
actions+=/berserking,if=energy<=40
actions+=/arcane_torrent,if=chi.max-chi>=1&energy<=40
actions+=/chi_sphere,if=talent.power_strikes.enabled&buff.chi_sphere.react&chi<4
actions+=/chi_brew,if=talent.chi_brew.enabled&chi.max-chi>=2&buff.elusive_brew_stacks.stack<=10&((charges=1&recharge_time<5)|charges=2|(target.time_to_die<15&(cooldown.touch_of_death.remains>target.time_to_die|glyph.touch_of_death.enabled)))
actions+=/chi_brew,if=(chi<1&stagger.heavy)|(chi<2&buff.shuffle.down)
actions+=/gift_of_the_ox,if=buff.gift_of_the_ox.react&incoming_damage_1500ms
actions+=/diffuse_magic,if=incoming_damage_1500ms&buff.fortifying_brew.down
actions+=/dampen_harm,if=incoming_damage_1500ms&buff.fortifying_brew.down&buff.elusive_brew_activated.down
actions+=/fortifying_brew,if=incoming_damage_1500ms&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down
actions+=/use_item,name=tablet_of_turnbuckle_teamwork,if=incoming_damage_1500ms&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.fortifying_brew.down&buff.elusive_brew_activated.down
actions+=/elusive_brew,if=buff.elusive_brew_stacks.react>=9&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down
actions+=/invoke_xuen,if=talent.invoke_xuen.enabled&target.time_to_die>15&buff.shuffle.remains>=3&buff.serenity.down
actions+=/serenity,if=talent.serenity.enabled&cooldown.keg_smash.remains>6
actions+=/potion,name=draenic_armor,if=(buff.fortifying_brew.down&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down)
actions+=/touch_of_death,if=target.health.percent<10&cooldown.touch_of_death.remains=0&((!glyph.touch_of_death.enabled&chi>=3&target.time_to_die<8)|(glyph.touch_of_death.enabled&target.time_to_die<5))
actions+=/call_action_list,name=st,if=active_enemies<3
actions+=/call_action_list,name=aoe,if=active_enemies>=3

actions.st=purifying_brew,if=stagger.heavy
actions.st+=/blackout_kick,if=buff.shuffle.down
actions.st+=/purifying_brew,if=buff.serenity.up
actions.st+=/chi_explosion,if=chi>=3
actions.st+=/purifying_brew,if=stagger.moderate&buff.shuffle.remains>=6
actions.st+=/guard,if=(charges=1&recharge_time<5)|charges=2|target.time_to_die<15
actions.st+=/guard,if=incoming_damage_10s>=health.max*0.5
actions.st+=/chi_brew,if=target.health.percent<10&cooldown.touch_of_death.remains=0&chi.max-chi>=2&(buff.shuffle.remains>=6|target.time_to_die<buff.shuffle.remains)&!glyph.touch_of_death.enabled
actions.st+=/keg_smash,if=chi.max-chi>=2&!buff.serenity.remains
actions.st+=/blackout_kick,if=buff.shuffle.remains<=3&cooldown.keg_smash.remains>=gcd
actions.st+=/blackout_kick,if=buff.serenity.up
actions.st+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/zen_sphere,cycle_targets=1,if=!dot.zen_sphere.ticking&energy.time_to_max>2&buff.serenity.down
actions.st+=/blackout_kick,if=chi.max-chi<2
actions.st+=/expel_harm,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.st+=/jab,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&cooldown.expel_harm.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.st+=/tiger_palm

actions.aoe=purifying_brew,if=stagger.heavy
actions.aoe+=/blackout_kick,if=buff.shuffle.down
actions.aoe+=/purifying_brew,if=buff.serenity.up
actions.aoe+=/chi_explosion,if=chi>=4
actions.aoe+=/purifying_brew,if=stagger.moderate&buff.shuffle.remains>=6
actions.aoe+=/guard,if=(charges=1&recharge_time<5)|charges=2|target.time_to_die<15
actions.aoe+=/guard,if=incoming_damage_10s>=health.max*0.5
actions.aoe+=/chi_brew,if=target.health.percent<10&cooldown.touch_of_death.remains=0&chi<=3&chi>=1&(buff.shuffle.remains>=6|target.time_to_die<buff.shuffle.remains)&!glyph.touch_of_death.enabled
actions.aoe+=/keg_smash,if=chi.max-chi>=2&!buff.serenity.remains
actions.aoe+=/blackout_kick,if=buff.shuffle.remains<=3&cooldown.keg_smash.remains>=gcd
actions.aoe+=/blackout_kick,if=buff.serenity.up
actions.aoe+=/rushing_jade_wind,if=chi.max-chi>=1&buff.serenity.down
actions.aoe+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.aoe+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.aoe+=/zen_sphere,cycle_targets=1,if=!dot.zen_sphere.ticking&energy.time_to_max>2&buff.serenity.down
actions.aoe+=/blackout_kick,if=chi.max-chi<2
actions.aoe+=/expel_harm,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.aoe+=/jab,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&cooldown.expel_harm.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.aoe+=/tiger_palm

head=helm_of_the_somber_gaze,id=115556,bonus_id=567
neck=gluttons_kerchief,id=113882,bonus_id=567,enchant=gift_of_multistrike
shoulders=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_multistrike
chest=unrendable_wolfhide_robes,id=113951,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=handwraps_of_the_somber_gaze,id=115555,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_multistrike
finger2=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_multistrike
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
main_hand=headlopper_skullscythe,id=119448,bonus_id=567,enchant=mark_of_bleeding_hollow

# Gear Summary
# gear_ilvl=701.00
# gear_agility=3175
# gear_stamina=4763
# gear_crit_rating=744
# gear_haste_rating=214
# gear_mastery_rating=1835
# gear_armor=1177
# gear_bonus_armor=976
# gear_multistrike_rating=1631
# gear_versatility_rating=125
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Monk_Brewmaster_2h_Serenity_T17M.simc"] = [[
monk="Monk_Brewmaster_2h_Serenity_T17M"
level=100
race=night_elf
role=tank
position=front
talents=0130123
glyphs=fortifying_brew,expel_harm,fortuitous_spheres
spec=brewmaster

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/stance,choose=sturdy_ox
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_armor
actions.precombat+=/dampen_harm

# Executed every time the actor is available.

actions=auto_attack
actions+=/blood_fury,if=energy<=40
actions+=/berserking,if=energy<=40
actions+=/arcane_torrent,if=chi.max-chi>=1&energy<=40
actions+=/chi_sphere,if=talent.power_strikes.enabled&buff.chi_sphere.react&chi<4
actions+=/chi_brew,if=talent.chi_brew.enabled&chi.max-chi>=2&buff.elusive_brew_stacks.stack<=10&((charges=1&recharge_time<5)|charges=2|(target.time_to_die<15&(cooldown.touch_of_death.remains>target.time_to_die|glyph.touch_of_death.enabled)))
actions+=/chi_brew,if=(chi<1&stagger.heavy)|(chi<2&buff.shuffle.down)
actions+=/gift_of_the_ox,if=buff.gift_of_the_ox.react&incoming_damage_1500ms
actions+=/diffuse_magic,if=incoming_damage_1500ms&buff.fortifying_brew.down
actions+=/dampen_harm,if=incoming_damage_1500ms&buff.fortifying_brew.down&buff.elusive_brew_activated.down
actions+=/fortifying_brew,if=incoming_damage_1500ms&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down
actions+=/use_item,name=tablet_of_turnbuckle_teamwork,if=incoming_damage_1500ms&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.fortifying_brew.down&buff.elusive_brew_activated.down
actions+=/elusive_brew,if=buff.elusive_brew_stacks.react>=9&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down
actions+=/invoke_xuen,if=talent.invoke_xuen.enabled&target.time_to_die>15&buff.shuffle.remains>=3&buff.serenity.down
actions+=/serenity,if=talent.serenity.enabled&cooldown.keg_smash.remains>6
actions+=/potion,name=draenic_armor,if=(buff.fortifying_brew.down&(buff.dampen_harm.down|buff.diffuse_magic.down)&buff.elusive_brew_activated.down)
actions+=/touch_of_death,if=target.health.percent<10&cooldown.touch_of_death.remains=0&((!glyph.touch_of_death.enabled&chi>=3&target.time_to_die<8)|(glyph.touch_of_death.enabled&target.time_to_die<5))
actions+=/call_action_list,name=st,if=active_enemies<3
actions+=/call_action_list,name=aoe,if=active_enemies>=3

actions.st=purifying_brew,if=stagger.heavy
actions.st+=/blackout_kick,if=buff.shuffle.down
actions.st+=/purifying_brew,if=buff.serenity.up
actions.st+=/chi_explosion,if=chi>=3
actions.st+=/purifying_brew,if=stagger.moderate&buff.shuffle.remains>=6
actions.st+=/guard,if=(charges=1&recharge_time<5)|charges=2|target.time_to_die<15
actions.st+=/guard,if=incoming_damage_10s>=health.max*0.5
actions.st+=/chi_brew,if=target.health.percent<10&cooldown.touch_of_death.remains=0&chi.max-chi>=2&(buff.shuffle.remains>=6|target.time_to_die<buff.shuffle.remains)&!glyph.touch_of_death.enabled
actions.st+=/keg_smash,if=chi.max-chi>=2&!buff.serenity.remains
actions.st+=/blackout_kick,if=buff.shuffle.remains<=3&cooldown.keg_smash.remains>=gcd
actions.st+=/blackout_kick,if=buff.serenity.up
actions.st+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/zen_sphere,cycle_targets=1,if=!dot.zen_sphere.ticking&energy.time_to_max>2&buff.serenity.down
actions.st+=/blackout_kick,if=chi.max-chi<2
actions.st+=/expel_harm,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.st+=/jab,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&cooldown.expel_harm.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.st+=/tiger_palm

actions.aoe=purifying_brew,if=stagger.heavy
actions.aoe+=/blackout_kick,if=buff.shuffle.down
actions.aoe+=/purifying_brew,if=buff.serenity.up
actions.aoe+=/chi_explosion,if=chi>=4
actions.aoe+=/purifying_brew,if=stagger.moderate&buff.shuffle.remains>=6
actions.aoe+=/guard,if=(charges=1&recharge_time<5)|charges=2|target.time_to_die<15
actions.aoe+=/guard,if=incoming_damage_10s>=health.max*0.5
actions.aoe+=/chi_brew,if=target.health.percent<10&cooldown.touch_of_death.remains=0&chi<=3&chi>=1&(buff.shuffle.remains>=6|target.time_to_die<buff.shuffle.remains)&!glyph.touch_of_death.enabled
actions.aoe+=/keg_smash,if=chi.max-chi>=2&!buff.serenity.remains
actions.aoe+=/blackout_kick,if=buff.shuffle.remains<=3&cooldown.keg_smash.remains>=gcd
actions.aoe+=/blackout_kick,if=buff.serenity.up
actions.aoe+=/rushing_jade_wind,if=chi.max-chi>=1&buff.serenity.down
actions.aoe+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.aoe+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.aoe+=/zen_sphere,cycle_targets=1,if=!dot.zen_sphere.ticking&energy.time_to_max>2&buff.serenity.down
actions.aoe+=/blackout_kick,if=chi.max-chi<2
actions.aoe+=/expel_harm,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.aoe+=/jab,if=chi.max-chi>=1&cooldown.keg_smash.remains>=gcd&cooldown.expel_harm.remains>=gcd&(energy+(energy.regen*(cooldown.keg_smash.remains)))>=80
actions.aoe+=/tiger_palm

head=helm_of_the_somber_gaze,id=115556,bonus_id=567
neck=choker_of_bestial_force,id=113952,bonus_id=567,enchant=gift_of_mastery
shoulders=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_mastery
chest=unrendable_wolfhide_robes,id=113951,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=handwraps_of_the_somber_gaze,id=115555,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_mastery
finger2=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_mastery
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
main_hand=headlopper_skullscythe,id=119448,bonus_id=567,enchant=mark_of_bleeding_hollow

# Gear Summary
# gear_ilvl=701.00
# gear_agility=3175
# gear_stamina=4763
# gear_crit_rating=744
# gear_haste_rating=214
# gear_mastery_rating=2201
# gear_armor=1177
# gear_bonus_armor=987
# gear_multistrike_rating=1245
# gear_versatility_rating=125
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Monk_Windwalker_1h_T17M.simc"] = [[
monk="Monk_Windwalker_1h_T17M"
level=100
race=blood_elf
role=hybrid
position=back
talents=0230023
glyphs=touch_of_death,blackout_kick
spec=windwalker

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/stance,choose=fierce_tiger
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_agility

# Executed every time the actor is available.

actions=auto_attack
actions+=/invoke_xuen
actions+=/storm_earth_and_fire,target=2,if=debuff.storm_earth_and_fire_target.down
actions+=/storm_earth_and_fire,target=3,if=debuff.storm_earth_and_fire_target.down
actions+=/call_action_list,name=opener,if=talent.serenity.enabled&talent.chi_brew.enabled&cooldown.fists_of_fury.up&time<20
actions+=/chi_sphere,if=talent.power_strikes.enabled&buff.chi_sphere.react&chi<chi.max
actions+=/potion,name=draenic_agility,if=buff.serenity.up|(!talent.serenity.enabled&(trinket.proc.agility.react|trinket.proc.multistrike.react))|buff.bloodlust.react|target.time_to_die<=60
actions+=/use_item,name=beating_heart_of_the_mountain,if=buff.tigereye_brew_use.up|target.time_to_die<18
actions+=/blood_fury,if=buff.tigereye_brew_use.up|target.time_to_die<18
actions+=/berserking,if=buff.tigereye_brew_use.up|target.time_to_die<18
actions+=/arcane_torrent,if=chi.max-chi>=1&(buff.tigereye_brew_use.up|target.time_to_die<18)
actions+=/chi_brew,if=chi.max-chi>=2&((charges=1&recharge_time<=10)|charges=2|target.time_to_die<charges*10)&buff.tigereye_brew.stack<=16
actions+=/tiger_palm,if=!talent.chi_explosion.enabled&buff.tiger_power.remains<6.6
actions+=/tiger_palm,if=talent.chi_explosion.enabled&(cooldown.fists_of_fury.remains<5|cooldown.fists_of_fury.up)&buff.tiger_power.remains<5
actions+=/tigereye_brew,if=buff.tigereye_brew_use.down&buff.tigereye_brew.stack=20
actions+=/tigereye_brew,if=buff.tigereye_brew_use.down&buff.tigereye_brew.stack>=9&buff.serenity.up
actions+=/tigereye_brew,if=buff.tigereye_brew_use.down&buff.tigereye_brew.stack>=9&cooldown.fists_of_fury.up&chi>=3&debuff.rising_sun_kick.up&buff.tiger_power.up
actions+=/tigereye_brew,if=talent.hurricane_strike.enabled&buff.tigereye_brew_use.down&buff.tigereye_brew.stack>=9&cooldown.hurricane_strike.up&chi>=3&debuff.rising_sun_kick.up&buff.tiger_power.up
actions+=/tigereye_brew,if=buff.tigereye_brew_use.down&chi>=2&(buff.tigereye_brew.stack>=16|target.time_to_die<40)&debuff.rising_sun_kick.up&buff.tiger_power.up
actions+=/rising_sun_kick,if=(debuff.rising_sun_kick.down|debuff.rising_sun_kick.remains<3)
actions+=/serenity,if=chi>=2&buff.tiger_power.up&debuff.rising_sun_kick.up
actions+=/fists_of_fury,if=buff.tiger_power.remains>cast_time&debuff.rising_sun_kick.remains>cast_time&energy.time_to_max>cast_time&!buff.serenity.up
actions+=/fortifying_brew,if=target.health.percent<10&cooldown.touch_of_death.remains=0&(glyph.touch_of_death.enabled|chi>=3)
actions+=/touch_of_death,if=target.health.percent<10&(glyph.touch_of_death.enabled|chi>=3)
actions+=/hurricane_strike,if=energy.time_to_max>cast_time&buff.tiger_power.remains>cast_time&debuff.rising_sun_kick.remains>cast_time&buff.energizing_brew.down
actions+=/energizing_brew,if=cooldown.fists_of_fury.remains>6&(!talent.serenity.enabled|(!buff.serenity.remains&cooldown.serenity.remains>4))&energy+energy.regen<50
actions+=/call_action_list,name=st,if=active_enemies<3&(level<100|!talent.chi_explosion.enabled)
actions+=/call_action_list,name=st_chix,if=active_enemies=1&talent.chi_explosion.enabled
actions+=/call_action_list,name=cleave_chix,if=(active_enemies=2|active_enemies=3&!talent.rushing_jade_wind.enabled)&talent.chi_explosion.enabled
actions+=/call_action_list,name=aoe_norjw,if=active_enemies>=3&!talent.rushing_jade_wind.enabled&!talent.chi_explosion.enabled
actions+=/call_action_list,name=aoe_norjw_chix,if=active_enemies>=4&!talent.rushing_jade_wind.enabled&talent.chi_explosion.enabled
actions+=/call_action_list,name=aoe_rjw,if=active_enemies>=3&talent.rushing_jade_wind.enabled

actions.opener=tigereye_brew,if=buff.tigereye_brew_use.down&buff.tigereye_brew.stack>=9
actions.opener+=/blood_fury,if=buff.tigereye_brew_use.up
actions.opener+=/berserking,if=buff.tigereye_brew_use.up
actions.opener+=/arcane_torrent,if=buff.tigereye_brew_use.up&chi.max-chi>=1
actions.opener+=/fists_of_fury,if=buff.tiger_power.remains>cast_time&debuff.rising_sun_kick.remains>cast_time&buff.serenity.up&buff.serenity.remains<1.5
actions.opener+=/tiger_palm,if=buff.tiger_power.remains<2
actions.opener+=/use_item,name=beating_heart_of_the_mountain
actions.opener+=/rising_sun_kick
actions.opener+=/blackout_kick,if=chi.max-chi<=1&cooldown.chi_brew.up|buff.serenity.up
actions.opener+=/chi_brew,if=chi.max-chi>=2
actions.opener+=/serenity,if=chi.max-chi<=2
actions.opener+=/jab,if=chi.max-chi>=2&!buff.serenity.up

actions.st=rising_sun_kick
actions.st+=/blackout_kick,if=buff.combo_breaker_bok.react|buff.serenity.up
actions.st+=/tiger_palm,if=buff.combo_breaker_tp.react&buff.combo_breaker_tp.remains<=2
actions.st+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking&buff.serenity.down
actions.st+=/chi_torpedo,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/blackout_kick,if=chi.max-chi<2
actions.st+=/expel_harm,if=chi.max-chi>=2&health.percent<95
actions.st+=/jab,if=chi.max-chi>=2

actions.st_chix=chi_explosion,if=chi>=2&buff.combo_breaker_ce.react&cooldown.fists_of_fury.remains>2
actions.st_chix+=/tiger_palm,if=buff.combo_breaker_tp.react&buff.combo_breaker_tp.remains<=2
actions.st_chix+=/rising_sun_kick
actions.st_chix+=/chi_wave,if=energy.time_to_max>2
actions.st_chix+=/chi_burst,if=energy.time_to_max>2
actions.st_chix+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking
actions.st_chix+=/tiger_palm,if=chi=4&!buff.combo_breaker_tp.react
actions.st_chix+=/chi_explosion,if=chi>=3&cooldown.fists_of_fury.remains>4
actions.st_chix+=/chi_torpedo,if=energy.time_to_max>2
actions.st_chix+=/expel_harm,if=chi.max-chi>=2&health.percent<95
actions.st_chix+=/jab,if=chi.max-chi>=2

actions.cleave_chix=chi_explosion,if=chi>=4&cooldown.fists_of_fury.remains>4
actions.cleave_chix+=/tiger_palm,if=buff.combo_breaker_tp.react&buff.combo_breaker_tp.remains<=2
actions.cleave_chix+=/chi_wave,if=energy.time_to_max>2
actions.cleave_chix+=/chi_burst,if=energy.time_to_max>2
actions.cleave_chix+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking
actions.cleave_chix+=/chi_torpedo,if=energy.time_to_max>2
actions.cleave_chix+=/expel_harm,if=chi.max-chi>=2&health.percent<95
actions.cleave_chix+=/jab,if=chi.max-chi>=2

actions.aoe_norjw=chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.aoe_norjw+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.aoe_norjw+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking&buff.serenity.down
actions.aoe_norjw+=/blackout_kick,if=buff.combo_breaker_bok.react|buff.serenity.up
actions.aoe_norjw+=/tiger_palm,if=buff.combo_breaker_tp.react&buff.combo_breaker_tp.remains<=2
actions.aoe_norjw+=/blackout_kick,if=chi.max-chi<2&cooldown.fists_of_fury.remains>3
actions.aoe_norjw+=/chi_torpedo,if=energy.time_to_max>2
actions.aoe_norjw+=/spinning_crane_kick

actions.aoe_norjw_chix=chi_explosion,if=chi>=4&cooldown.fists_of_fury.remains>4
actions.aoe_norjw_chix+=/rising_sun_kick,if=chi=chi.max
actions.aoe_norjw_chix+=/chi_wave,if=energy.time_to_max>2
actions.aoe_norjw_chix+=/chi_burst,if=energy.time_to_max>2
actions.aoe_norjw_chix+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking
actions.aoe_norjw_chix+=/chi_torpedo,if=energy.time_to_max>2
actions.aoe_norjw_chix+=/spinning_crane_kick

actions.aoe_rjw=chi_explosion,if=chi>=4&cooldown.fists_of_fury.remains>4
actions.aoe_rjw+=/rushing_jade_wind
actions.aoe_rjw+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.aoe_rjw+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.aoe_rjw+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking&buff.serenity.down
actions.aoe_rjw+=/blackout_kick,if=buff.combo_breaker_bok.react|buff.serenity.up
actions.aoe_rjw+=/tiger_palm,if=buff.combo_breaker_tp.react&buff.combo_breaker_tp.remains<=2
actions.aoe_rjw+=/blackout_kick,if=chi.max-chi<2&cooldown.fists_of_fury.remains>3
actions.aoe_rjw+=/chi_torpedo,if=energy.time_to_max>2
actions.aoe_rjw+=/expel_harm,if=chi.max-chi>=2&health.percent<95
actions.aoe_rjw+=/jab,if=chi.max-chi>=2

head=helm_of_the_somber_gaze,id=115556,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant=gift_of_multistrike
shoulders=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_multistrike
chest=vest_of_forceful_fury,id=113870,bonus_id=567
wrists=bracers_of_shattered_limbs,id=119333,bonus_id=567
hands=handwraps_of_the_somber_gaze,id=115555,bonus_id=567
waist=girdle_of_unconquered_glory,id=113907,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=furnace_tenders_treads,id=113895,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_multistrike
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_multistrike
trinket1=beating_heart_of_the_mountain,id=113931,bonus_id=567
trinket2=humming_blackiron_trigger,id=113985,bonus_id=567
main_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_the_frostwolf
off_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_the_thunderlord

# Gear Summary
# gear_ilvl=700.94
# gear_agility=3964
# gear_stamina=4694
# gear_crit_rating=1352
# gear_haste_rating=557
# gear_mastery_rating=322
# gear_armor=1177
# gear_multistrike_rating=1905
# gear_versatility_rating=262
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Monk_Windwalker_2h_T17M.simc"] = [[
monk="Monk_Windwalker_2h_T17M"
level=100
race=blood_elf
role=hybrid
position=back
talents=0230023
glyphs=touch_of_death,blackout_kick
spec=windwalker

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/stance,choose=fierce_tiger
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_agility

# Executed every time the actor is available.

actions=auto_attack
actions+=/invoke_xuen
actions+=/storm_earth_and_fire,target=2,if=debuff.storm_earth_and_fire_target.down
actions+=/storm_earth_and_fire,target=3,if=debuff.storm_earth_and_fire_target.down
actions+=/call_action_list,name=opener,if=talent.serenity.enabled&talent.chi_brew.enabled&cooldown.fists_of_fury.up&time<20
actions+=/chi_sphere,if=talent.power_strikes.enabled&buff.chi_sphere.react&chi<chi.max
actions+=/potion,name=draenic_agility,if=buff.serenity.up|(!talent.serenity.enabled&(trinket.proc.agility.react|trinket.proc.multistrike.react))|buff.bloodlust.react|target.time_to_die<=60
actions+=/use_item,name=beating_heart_of_the_mountain,if=buff.tigereye_brew_use.up|target.time_to_die<18
actions+=/blood_fury,if=buff.tigereye_brew_use.up|target.time_to_die<18
actions+=/berserking,if=buff.tigereye_brew_use.up|target.time_to_die<18
actions+=/arcane_torrent,if=chi.max-chi>=1&(buff.tigereye_brew_use.up|target.time_to_die<18)
actions+=/chi_brew,if=chi.max-chi>=2&((charges=1&recharge_time<=10)|charges=2|target.time_to_die<charges*10)&buff.tigereye_brew.stack<=16
actions+=/tiger_palm,if=!talent.chi_explosion.enabled&buff.tiger_power.remains<6.6
actions+=/tiger_palm,if=talent.chi_explosion.enabled&(cooldown.fists_of_fury.remains<5|cooldown.fists_of_fury.up)&buff.tiger_power.remains<5
actions+=/tigereye_brew,if=buff.tigereye_brew_use.down&buff.tigereye_brew.stack=20
actions+=/tigereye_brew,if=buff.tigereye_brew_use.down&buff.tigereye_brew.stack>=9&buff.serenity.up
actions+=/tigereye_brew,if=buff.tigereye_brew_use.down&buff.tigereye_brew.stack>=9&cooldown.fists_of_fury.up&chi>=3&debuff.rising_sun_kick.up&buff.tiger_power.up
actions+=/tigereye_brew,if=talent.hurricane_strike.enabled&buff.tigereye_brew_use.down&buff.tigereye_brew.stack>=9&cooldown.hurricane_strike.up&chi>=3&debuff.rising_sun_kick.up&buff.tiger_power.up
actions+=/tigereye_brew,if=buff.tigereye_brew_use.down&chi>=2&(buff.tigereye_brew.stack>=16|target.time_to_die<40)&debuff.rising_sun_kick.up&buff.tiger_power.up
actions+=/rising_sun_kick,if=(debuff.rising_sun_kick.down|debuff.rising_sun_kick.remains<3)
actions+=/serenity,if=chi>=2&buff.tiger_power.up&debuff.rising_sun_kick.up
actions+=/fists_of_fury,if=buff.tiger_power.remains>cast_time&debuff.rising_sun_kick.remains>cast_time&energy.time_to_max>cast_time&!buff.serenity.up
actions+=/fortifying_brew,if=target.health.percent<10&cooldown.touch_of_death.remains=0&(glyph.touch_of_death.enabled|chi>=3)
actions+=/touch_of_death,if=target.health.percent<10&(glyph.touch_of_death.enabled|chi>=3)
actions+=/hurricane_strike,if=energy.time_to_max>cast_time&buff.tiger_power.remains>cast_time&debuff.rising_sun_kick.remains>cast_time&buff.energizing_brew.down
actions+=/energizing_brew,if=cooldown.fists_of_fury.remains>6&(!talent.serenity.enabled|(!buff.serenity.remains&cooldown.serenity.remains>4))&energy+energy.regen<50
actions+=/call_action_list,name=st,if=active_enemies<3&(level<100|!talent.chi_explosion.enabled)
actions+=/call_action_list,name=st_chix,if=active_enemies=1&talent.chi_explosion.enabled
actions+=/call_action_list,name=cleave_chix,if=(active_enemies=2|active_enemies=3&!talent.rushing_jade_wind.enabled)&talent.chi_explosion.enabled
actions+=/call_action_list,name=aoe_norjw,if=active_enemies>=3&!talent.rushing_jade_wind.enabled&!talent.chi_explosion.enabled
actions+=/call_action_list,name=aoe_norjw_chix,if=active_enemies>=4&!talent.rushing_jade_wind.enabled&talent.chi_explosion.enabled
actions+=/call_action_list,name=aoe_rjw,if=active_enemies>=3&talent.rushing_jade_wind.enabled

actions.opener=tigereye_brew,if=buff.tigereye_brew_use.down&buff.tigereye_brew.stack>=9
actions.opener+=/blood_fury,if=buff.tigereye_brew_use.up
actions.opener+=/berserking,if=buff.tigereye_brew_use.up
actions.opener+=/arcane_torrent,if=buff.tigereye_brew_use.up&chi.max-chi>=1
actions.opener+=/fists_of_fury,if=buff.tiger_power.remains>cast_time&debuff.rising_sun_kick.remains>cast_time&buff.serenity.up&buff.serenity.remains<1.5
actions.opener+=/tiger_palm,if=buff.tiger_power.remains<2
actions.opener+=/use_item,name=beating_heart_of_the_mountain
actions.opener+=/rising_sun_kick
actions.opener+=/blackout_kick,if=chi.max-chi<=1&cooldown.chi_brew.up|buff.serenity.up
actions.opener+=/chi_brew,if=chi.max-chi>=2
actions.opener+=/serenity,if=chi.max-chi<=2
actions.opener+=/jab,if=chi.max-chi>=2&!buff.serenity.up

actions.st=rising_sun_kick
actions.st+=/blackout_kick,if=buff.combo_breaker_bok.react|buff.serenity.up
actions.st+=/tiger_palm,if=buff.combo_breaker_tp.react&buff.combo_breaker_tp.remains<=2
actions.st+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking&buff.serenity.down
actions.st+=/chi_torpedo,if=energy.time_to_max>2&buff.serenity.down
actions.st+=/blackout_kick,if=chi.max-chi<2
actions.st+=/expel_harm,if=chi.max-chi>=2&health.percent<95
actions.st+=/jab,if=chi.max-chi>=2

actions.st_chix=chi_explosion,if=chi>=2&buff.combo_breaker_ce.react&cooldown.fists_of_fury.remains>2
actions.st_chix+=/tiger_palm,if=buff.combo_breaker_tp.react&buff.combo_breaker_tp.remains<=2
actions.st_chix+=/rising_sun_kick
actions.st_chix+=/chi_wave,if=energy.time_to_max>2
actions.st_chix+=/chi_burst,if=energy.time_to_max>2
actions.st_chix+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking
actions.st_chix+=/tiger_palm,if=chi=4&!buff.combo_breaker_tp.react
actions.st_chix+=/chi_explosion,if=chi>=3&cooldown.fists_of_fury.remains>4
actions.st_chix+=/chi_torpedo,if=energy.time_to_max>2
actions.st_chix+=/expel_harm,if=chi.max-chi>=2&health.percent<95
actions.st_chix+=/jab,if=chi.max-chi>=2

actions.cleave_chix=chi_explosion,if=chi>=4&cooldown.fists_of_fury.remains>4
actions.cleave_chix+=/tiger_palm,if=buff.combo_breaker_tp.react&buff.combo_breaker_tp.remains<=2
actions.cleave_chix+=/chi_wave,if=energy.time_to_max>2
actions.cleave_chix+=/chi_burst,if=energy.time_to_max>2
actions.cleave_chix+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking
actions.cleave_chix+=/chi_torpedo,if=energy.time_to_max>2
actions.cleave_chix+=/expel_harm,if=chi.max-chi>=2&health.percent<95
actions.cleave_chix+=/jab,if=chi.max-chi>=2

actions.aoe_norjw=chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.aoe_norjw+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.aoe_norjw+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking&buff.serenity.down
actions.aoe_norjw+=/blackout_kick,if=buff.combo_breaker_bok.react|buff.serenity.up
actions.aoe_norjw+=/tiger_palm,if=buff.combo_breaker_tp.react&buff.combo_breaker_tp.remains<=2
actions.aoe_norjw+=/blackout_kick,if=chi.max-chi<2&cooldown.fists_of_fury.remains>3
actions.aoe_norjw+=/chi_torpedo,if=energy.time_to_max>2
actions.aoe_norjw+=/spinning_crane_kick

actions.aoe_norjw_chix=chi_explosion,if=chi>=4&cooldown.fists_of_fury.remains>4
actions.aoe_norjw_chix+=/rising_sun_kick,if=chi=chi.max
actions.aoe_norjw_chix+=/chi_wave,if=energy.time_to_max>2
actions.aoe_norjw_chix+=/chi_burst,if=energy.time_to_max>2
actions.aoe_norjw_chix+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking
actions.aoe_norjw_chix+=/chi_torpedo,if=energy.time_to_max>2
actions.aoe_norjw_chix+=/spinning_crane_kick

actions.aoe_rjw=chi_explosion,if=chi>=4&cooldown.fists_of_fury.remains>4
actions.aoe_rjw+=/rushing_jade_wind
actions.aoe_rjw+=/chi_wave,if=energy.time_to_max>2&buff.serenity.down
actions.aoe_rjw+=/chi_burst,if=energy.time_to_max>2&buff.serenity.down
actions.aoe_rjw+=/zen_sphere,cycle_targets=1,if=energy.time_to_max>2&!dot.zen_sphere.ticking&buff.serenity.down
actions.aoe_rjw+=/blackout_kick,if=buff.combo_breaker_bok.react|buff.serenity.up
actions.aoe_rjw+=/tiger_palm,if=buff.combo_breaker_tp.react&buff.combo_breaker_tp.remains<=2
actions.aoe_rjw+=/blackout_kick,if=chi.max-chi<2&cooldown.fists_of_fury.remains>3
actions.aoe_rjw+=/chi_torpedo,if=energy.time_to_max>2
actions.aoe_rjw+=/expel_harm,if=chi.max-chi>=2&health.percent<95
actions.aoe_rjw+=/jab,if=chi.max-chi>=2

head=helm_of_the_somber_gaze,id=115556,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant=gift_of_multistrike
shoulders=mantle_of_the_somber_gaze,id=115559,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_multistrike
chest=vest_of_the_somber_gaze,id=115558,bonus_id=567
wrists=bracers_of_shattered_limbs,id=119333,bonus_id=567
hands=cannonball_loaders_grips,id=113949,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=legwraps_of_the_somber_gaze,id=115557,bonus_id=567
feet=furnace_tenders_treads,id=113895,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_multistrike
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_multistrike
trinket1=humming_blackiron_trigger,id=113985,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
main_hand=talrak_bloody_skull_of_the_thunderlords,id=113939,bonus_id=567,enchant=mark_of_warsong

# Gear Summary
# gear_ilvl=701.00
# gear_agility=4011
# gear_stamina=4763
# gear_crit_rating=1564
# gear_haste_rating=443
# gear_mastery_rating=306
# gear_armor=1177
# gear_multistrike_rating=1876
# gear_versatility_rating=262
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Paladin_Protection_T17M.simc"] = [[
paladin="Paladin_Protection_T17M"
level=100
race=blood_elf
role=tank
position=front
talents=3032322
glyphs=focused_shield/divine_protection/final_wrath
spec=protection

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_stamina_flask
actions.precombat+=/flask,type=greater_draenic_strength_flask,if=role.attack|using_apl.max_dps
actions.precombat+=/food,type=whiptail_fillet
actions.precombat+=/food,type=pickled_eel,if=role.attack|using_apl.max_dps
actions.precombat+=/blessing_of_kings,if=(!aura.str_agi_int.up)&(aura.mastery.up)
actions.precombat+=/blessing_of_might,if=!aura.mastery.up
actions.precombat+=/seal_of_insight
actions.precombat+=/seal_of_righteousness,if=role.attack|using_apl.max_dps
actions.precombat+=/sacred_shield
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_armor

# Executed every time the actor is available.

actions=auto_attack
actions+=/speed_of_light,if=movement.remains>1
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
# Off-GCD spells.
actions+=/holy_avenger
actions+=/potion,name=draenic_armor,if=buff.shield_of_the_righteous.down&buff.seraphim.down&buff.divine_protection.down&buff.guardian_of_ancient_kings.down&buff.ardent_defender.down
actions+=/seraphim
actions+=/divine_protection,if=time<5|!talent.seraphim.enabled|(buff.seraphim.down&cooldown.seraphim.remains>5&cooldown.seraphim.remains<9)
actions+=/guardian_of_ancient_kings,if=time<5|(buff.holy_avenger.down&buff.shield_of_the_righteous.down&buff.divine_protection.down)
actions+=/ardent_defender,if=time<5|(buff.holy_avenger.down&buff.shield_of_the_righteous.down&buff.divine_protection.down&buff.guardian_of_ancient_kings.down)
actions+=/eternal_flame,if=buff.eternal_flame.remains<2&buff.bastion_of_glory.react>2&(holy_power>=3|buff.divine_purpose.react|buff.bastion_of_power.react)
actions+=/eternal_flame,if=buff.bastion_of_power.react&buff.bastion_of_glory.react>=5
actions+=/shield_of_the_righteous,if=buff.divine_purpose.react
actions+=/shield_of_the_righteous,if=(holy_power>=5|incoming_damage_1500ms>=health.max*0.3)&(!talent.seraphim.enabled|cooldown.seraphim.remains>5)
actions+=/shield_of_the_righteous,if=buff.holy_avenger.remains>time_to_hpg&(!talent.seraphim.enabled|cooldown.seraphim.remains>time_to_hpg)
# GCD-bound spells
actions+=/seal_of_insight,if=talent.empowered_seals.enabled&!seal.insight&buff.uthers_insight.remains<cooldown.judgment.remains
actions+=/seal_of_righteousness,if=talent.empowered_seals.enabled&!seal.righteousness&buff.uthers_insight.remains>cooldown.judgment.remains&buff.liadrins_righteousness.down
actions+=/avengers_shield,if=buff.grand_crusader.react&active_enemies>1&!glyph.focused_shield.enabled
actions+=/hammer_of_the_righteous,if=active_enemies>=3
actions+=/crusader_strike
actions+=/wait,sec=cooldown.crusader_strike.remains,if=cooldown.crusader_strike.remains>0&cooldown.crusader_strike.remains<=0.35
actions+=/judgment,cycle_targets=1,if=glyph.double_jeopardy.enabled&last_judgment_target!=target
actions+=/judgment
actions+=/wait,sec=cooldown.judgment.remains,if=cooldown.judgment.remains>0&cooldown.judgment.remains<=0.35
actions+=/avengers_shield,if=active_enemies>1&!glyph.focused_shield.enabled
actions+=/holy_wrath,if=talent.sanctified_wrath.enabled
actions+=/avengers_shield,if=buff.grand_crusader.react
actions+=/sacred_shield,if=target.dot.sacred_shield.remains<2
actions+=/holy_wrath,if=glyph.final_wrath.enabled&target.health.pct<=20
actions+=/avengers_shield
actions+=/lights_hammer,if=!talent.seraphim.enabled|buff.seraphim.remains>10|cooldown.seraphim.remains<6
actions+=/holy_prism,if=!talent.seraphim.enabled|buff.seraphim.up|cooldown.seraphim.remains>5|time<5
actions+=/consecration,if=target.debuff.flying.down&active_enemies>=3
actions+=/execution_sentence,if=!talent.seraphim.enabled|buff.seraphim.up|time<12
actions+=/hammer_of_wrath
actions+=/sacred_shield,if=target.dot.sacred_shield.remains<8
actions+=/consecration,if=target.debuff.flying.down
actions+=/holy_wrath
actions+=/seal_of_insight,if=talent.empowered_seals.enabled&!seal.insight&buff.uthers_insight.remains<=buff.liadrins_righteousness.remains
actions+=/seal_of_righteousness,if=talent.empowered_seals.enabled&!seal.righteousness&buff.liadrins_righteousness.remains<=buff.uthers_insight.remains
actions+=/sacred_shield
actions+=/flash_of_light,if=talent.selfless_healer.enabled&buff.selfless_healer.stack>=3

# This is a high-DPS (but low-survivability) configuration.
# Invoke by adding "actions+=/run_action_list,name=max_dps" to the beginning of the default APL.

actions.max_dps=auto_attack
actions.max_dps+=/speed_of_light,if=movement.remains>1
actions.max_dps+=/blood_fury
actions.max_dps+=/berserking
actions.max_dps+=/arcane_torrent
# Off-GCD spells.
actions.max_dps+=/holy_avenger
actions.max_dps+=/potion,name=draenic_armor,if=buff.holy_avenger.up|(!talent.holy_avenger.enabled&(buff.seraphim.up|(!talent.seraphim.enabled&buff.bloodlust.react)))|target.time_to_die<=20
actions.max_dps+=/seraphim
actions.max_dps+=/shield_of_the_righteous,if=buff.divine_purpose.react
actions.max_dps+=/shield_of_the_righteous,if=(holy_power>=5|talent.holy_avenger.enabled)&(!talent.seraphim.enabled|cooldown.seraphim.remains>5)
actions.max_dps+=/shield_of_the_righteous,if=buff.holy_avenger.remains>time_to_hpg&(!talent.seraphim.enabled|cooldown.seraphim.remains>time_to_hpg)
# GCD-bound spells
actions.max_dps+=/avengers_shield,if=buff.grand_crusader.react&active_enemies>1&!glyph.focused_shield.enabled
actions.max_dps+=/holy_wrath,if=talent.sanctified_wrath.enabled&(buff.seraphim.react|(glyph.final_wrath.enabled&target.health.pct<=20))
actions.max_dps+=/hammer_of_the_righteous,if=active_enemies>=3
actions.max_dps+=/judgment,if=talent.empowered_seals.enabled&buff.liadrins_righteousness.down
actions.max_dps+=/crusader_strike
actions.max_dps+=/wait,sec=cooldown.crusader_strike.remains,if=cooldown.crusader_strike.remains>0&cooldown.crusader_strike.remains<=0.35
actions.max_dps+=/judgment,cycle_targets=1,if=glyph.double_jeopardy.enabled&last_judgment_target!=target
actions.max_dps+=/judgment
actions.max_dps+=/wait,sec=cooldown.judgment.remains,if=cooldown.judgment.remains>0&cooldown.judgment.remains<=0.35
actions.max_dps+=/avengers_shield,if=active_enemies>1&!glyph.focused_shield.enabled
actions.max_dps+=/holy_wrath,if=talent.sanctified_wrath.enabled
actions.max_dps+=/avengers_shield,if=buff.grand_crusader.react
actions.max_dps+=/execution_sentence,if=active_enemies<3
actions.max_dps+=/holy_wrath,if=glyph.final_wrath.enabled&target.health.pct<=20
actions.max_dps+=/avengers_shield
actions.max_dps+=/seal_of_righteousness,if=talent.empowered_seals.enabled&!seal.righteousness
actions.max_dps+=/lights_hammer
actions.max_dps+=/holy_prism
actions.max_dps+=/consecration,if=target.debuff.flying.down&active_enemies>=3
actions.max_dps+=/execution_sentence
actions.max_dps+=/hammer_of_wrath
actions.max_dps+=/consecration,if=target.debuff.flying.down
actions.max_dps+=/holy_wrath
actions.max_dps+=/sacred_shield
actions.max_dps+=/flash_of_light,if=talent.selfless_healer.enabled&buff.selfless_healer.stack>=3

# This is a high-survivability (but low-DPS) configuration.
# Invoke by adding "actions+=/run_action_list,name=max_survival" to the beginning of the default APL.

actions.max_survival=auto_attack
actions.max_survival+=/speed_of_light,if=movement.remains>1
actions.max_survival+=/blood_fury
actions.max_survival+=/berserking
actions.max_survival+=/arcane_torrent
# Off-GCD spells.
actions.max_survival+=/holy_avenger
actions.max_survival+=/potion,name=draenic_armor,if=buff.shield_of_the_righteous.down&buff.seraphim.down&buff.divine_protection.down&buff.guardian_of_ancient_kings.down&buff.ardent_defender.down
actions.max_survival+=/divine_protection,if=time<5|!talent.seraphim.enabled|(buff.seraphim.down&cooldown.seraphim.remains>5&cooldown.seraphim.remains<9)
actions.max_survival+=/seraphim,if=buff.divine_protection.down&cooldown.divine_protection.remains>0
actions.max_survival+=/guardian_of_ancient_kings,if=buff.holy_avenger.down&buff.shield_of_the_righteous.down&buff.divine_protection.down
actions.max_survival+=/ardent_defender,if=buff.holy_avenger.down&buff.shield_of_the_righteous.down&buff.divine_protection.down&buff.guardian_of_ancient_kings.down
actions.max_survival+=/eternal_flame,if=buff.eternal_flame.remains<2&buff.bastion_of_glory.react>2&(holy_power>=3|buff.divine_purpose.react|buff.bastion_of_power.react)
actions.max_survival+=/eternal_flame,if=buff.bastion_of_power.react&buff.bastion_of_glory.react>=5
actions.max_survival+=/shield_of_the_righteous,if=buff.divine_purpose.react
actions.max_survival+=/shield_of_the_righteous,if=(holy_power>=5|incoming_damage_1500ms>=health.max*0.3)&(!talent.seraphim.enabled|cooldown.seraphim.remains>5)
actions.max_survival+=/shield_of_the_righteous,if=buff.holy_avenger.remains>time_to_hpg&(!talent.seraphim.enabled|cooldown.seraphim.remains>time_to_hpg)
# GCD-bound spells
actions.max_survival+=/hammer_of_the_righteous,if=active_enemies>=3
actions.max_survival+=/crusader_strike
actions.max_survival+=/wait,sec=cooldown.crusader_strike.remains,if=cooldown.crusader_strike.remains>0&cooldown.crusader_strike.remains<=0.35
actions.max_survival+=/judgment,cycle_targets=1,if=glyph.double_jeopardy.enabled&last_judgment_target!=target
actions.max_survival+=/judgment
actions.max_survival+=/wait,sec=cooldown.judgment.remains,if=cooldown.judgment.remains>0&cooldown.judgment.remains<=0.35
actions.max_survival+=/avengers_shield,if=buff.grand_crusader.react&active_enemies>1
actions.max_survival+=/holy_wrath,if=talent.sanctified_wrath.enabled
actions.max_survival+=/avengers_shield,if=buff.grand_crusader.react
actions.max_survival+=/sacred_shield,if=target.dot.sacred_shield.remains<2
actions.max_survival+=/avengers_shield
actions.max_survival+=/lights_hammer
actions.max_survival+=/holy_prism
actions.max_survival+=/consecration,if=target.debuff.flying.down&active_enemies>=3
actions.max_survival+=/execution_sentence
actions.max_survival+=/flash_of_light,if=talent.selfless_healer.enabled&buff.selfless_healer.stack>=3
actions.max_survival+=/hammer_of_wrath
actions.max_survival+=/sacred_shield,if=target.dot.sacred_shield.remains<8
actions.max_survival+=/holy_wrath,if=glyph.final_wrath.enabled&target.health.pct<=20
actions.max_survival+=/consecration,if=target.debuff.flying.down&!ticking
actions.max_survival+=/holy_wrath
actions.max_survival+=/sacred_shield

head=helmet_of_guiding_light,id=115568,bonus_id=567
neck=choker_of_bestial_force,id=113952,bonus_id=567,enchant=gift_of_haste
shoulders=pauldrons_of_guiding_light,id=115565,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_haste
chest=battleplate_of_guiding_light,id=115566,bonus_id=567
wrists=bracers_of_martial_perfection,id=113871,bonus_id=567
hands=gauntlets_of_dramatic_blows,id=113906,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=legplates_of_guiding_light,id=115569,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_haste
finger2=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_haste
trinket1=blast_furnace_door,id=113893,bonus_id=567
trinket2=evergaze_arcane_eidolon,id=113861,bonus_id=567
main_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=mark_of_blackrock
off_hand=kromogs_protecting_palm,id=113926,bonus_id=567

# Gear Summary
# gear_ilvl=700.00
# gear_strength=3171
# gear_stamina=4759
# gear_crit_rating=844
# gear_haste_rating=852
# gear_mastery_rating=1910
# gear_armor=3082
# gear_bonus_armor=987
# gear_multistrike_rating=341
# gear_versatility_rating=361
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Paladin_Retribution_T17M.simc"] = [[
paladin="Paladin_Retribution_T17M"
level=100
race=draenei
role=attack
position=back
talents=2112231
glyphs=winged_vengeance/templars_verdict/righteous_retreat/fire_from_the_heavens/judgment/mass_exorcism
spec=retribution

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_strength_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/blessing_of_kings,if=!aura.str_agi_int.up
actions.precombat+=/blessing_of_might,if=!aura.mastery.up
actions.precombat+=/seal_of_truth,if=active_enemies<2
actions.precombat+=/seal_of_righteousness,if=active_enemies>=2
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_strength

# Executed every time the actor is available.

actions=rebuke
actions+=/potion,name=draenic_strength,if=(buff.bloodlust.react|buff.avenging_wrath.up|target.time_to_die<=40)
actions+=/auto_attack
actions+=/speed_of_light,if=movement.distance>5
actions+=/judgment,if=talent.empowered_seals.enabled&time<2
actions+=/execution_sentence
actions+=/lights_hammer
actions+=/use_item,name=vial_of_convulsive_shadows,if=buff.avenging_wrath.up
actions+=/holy_avenger,sync=seraphim,if=talent.seraphim.enabled
actions+=/holy_avenger,if=holy_power<=2&!talent.seraphim.enabled
actions+=/avenging_wrath,sync=seraphim,if=talent.seraphim.enabled
actions+=/avenging_wrath,if=!talent.seraphim.enabled&set_bonus.tier18_4pc=0
actions+=/avenging_wrath,if=!talent.seraphim.enabled&time<20&set_bonus.tier18_4pc=1
actions+=/avenging_wrath,if=prev.execution_sentence&set_bonus.tier18_4pc=1&talent.execution_sentence.enabled&!talent.seraphim.enabled
actions+=/avenging_wrath,if=prev.lights_hammer&set_bonus.tier18_4pc=1&talent.lights_hammer.enabled&!talent.seraphim.enabled
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/seraphim
actions+=/wait,sec=cooldown.seraphim.remains,if=talent.seraphim.enabled&cooldown.seraphim.remains>0&cooldown.seraphim.remains<gcd.max&holy_power>=5
actions+=/call_action_list,name=cleave,if=active_enemies>=3
actions+=/call_action_list,name=single

actions.single=divine_storm,if=buff.divine_crusader.react&(holy_power=5|buff.holy_avenger.up&holy_power>=3)&buff.final_verdict.up
actions.single+=/divine_storm,if=buff.divine_crusader.react&(holy_power=5|buff.holy_avenger.up&holy_power>=3)&active_enemies=2&!talent.final_verdict.enabled
actions.single+=/divine_storm,if=(holy_power=5|buff.holy_avenger.up&holy_power>=3)&active_enemies=2&buff.final_verdict.up
actions.single+=/divine_storm,if=buff.divine_crusader.react&(holy_power=5|buff.holy_avenger.up&holy_power>=3)&(talent.seraphim.enabled&cooldown.seraphim.remains<gcd*4)
actions.single+=/templars_verdict,if=(holy_power=5|buff.holy_avenger.up&holy_power>=3)&(buff.avenging_wrath.down|target.health.pct>35)&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*4)
actions.single+=/templars_verdict,if=buff.divine_purpose.react&buff.divine_purpose.remains<3
actions.single+=/divine_storm,if=buff.divine_crusader.react&buff.divine_crusader.remains<3&!talent.final_verdict.enabled
actions.single+=/divine_storm,if=buff.divine_crusader.react&buff.divine_crusader.remains<3&buff.final_verdict.up
actions.single+=/final_verdict,if=holy_power=5|buff.holy_avenger.up&holy_power>=3
actions.single+=/final_verdict,if=buff.divine_purpose.react&buff.divine_purpose.remains<3
actions.single+=/hammer_of_wrath
actions.single+=/crusader_strike,if=t18_class_trinket=1&buff.focus_of_vengeance.remains<gcd.max*2
actions.single+=/judgment,if=talent.empowered_seals.enabled&seal.truth&buff.maraads_truth.remains<cooldown.judgment.duration
actions.single+=/judgment,if=talent.empowered_seals.enabled&seal.righteousness&buff.liadrins_righteousness.remains<cooldown.judgment.duration
actions.single+=/judgment,if=talent.empowered_seals.enabled&seal.righteousness&cooldown.avenging_wrath.remains<cooldown.judgment.duration
actions.single+=/exorcism,if=buff.blazing_contempt.up&holy_power<=2&buff.holy_avenger.down
actions.single+=/seal_of_truth,if=talent.empowered_seals.enabled&buff.maraads_truth.down
actions.single+=/seal_of_truth,if=talent.empowered_seals.enabled&cooldown.avenging_wrath.remains<cooldown.judgment.duration&buff.liadrins_righteousness.remains>cooldown.judgment.duration
actions.single+=/seal_of_righteousness,if=talent.empowered_seals.enabled&buff.maraads_truth.remains>cooldown.judgment.duration&buff.liadrins_righteousness.down&!buff.avenging_wrath.up&!buff.bloodlust.up
actions.single+=/divine_storm,if=buff.divine_crusader.react&buff.final_verdict.up&(buff.avenging_wrath.up|target.health.pct<35)
actions.single+=/divine_storm,if=active_enemies=2&buff.final_verdict.up&(buff.avenging_wrath.up|target.health.pct<35)
actions.single+=/final_verdict,if=buff.avenging_wrath.up|target.health.pct<35
actions.single+=/divine_storm,if=buff.divine_crusader.react&active_enemies=2&(buff.avenging_wrath.up|target.health.pct<35)&!talent.final_verdict.enabled
actions.single+=/templars_verdict,if=holy_power=5&(buff.avenging_wrath.up|target.health.pct<35)&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*3)
actions.single+=/templars_verdict,if=holy_power=4&(buff.avenging_wrath.up|target.health.pct<35)&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*4)
actions.single+=/templars_verdict,if=holy_power=3&(buff.avenging_wrath.up|target.health.pct<35)&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*5)
actions.single+=/crusader_strike,if=holy_power<5&talent.seraphim.enabled
actions.single+=/crusader_strike,if=holy_power<=3|(holy_power=4&target.health.pct>=35&buff.avenging_wrath.down)
actions.single+=/divine_storm,if=buff.divine_crusader.react&(buff.avenging_wrath.up|target.health.pct<35)&!talent.final_verdict.enabled
actions.single+=/judgment,cycle_targets=1,if=last_judgment_target!=target&glyph.double_jeopardy.enabled&holy_power<5
actions.single+=/exorcism,if=glyph.mass_exorcism.enabled&active_enemies>=2&holy_power<5&!glyph.double_jeopardy.enabled&!set_bonus.tier17_4pc=1
actions.single+=/judgment,if=holy_power<5&talent.seraphim.enabled
actions.single+=/judgment,if=holy_power<=3|(holy_power=4&cooldown.crusader_strike.remains>=gcd*2&target.health.pct>35&buff.avenging_wrath.down)
actions.single+=/divine_storm,if=buff.divine_crusader.react&buff.final_verdict.up
actions.single+=/divine_storm,if=active_enemies=2&holy_power>=4&buff.final_verdict.up
actions.single+=/final_verdict,if=buff.divine_purpose.react
actions.single+=/final_verdict,if=holy_power>=4
actions.single+=/divine_storm,if=buff.divine_crusader.react&active_enemies=2&holy_power>=4&!talent.final_verdict.enabled
actions.single+=/templars_verdict,if=buff.divine_purpose.react
actions.single+=/divine_storm,if=buff.divine_crusader.react&!talent.final_verdict.enabled
actions.single+=/templars_verdict,if=holy_power>=4&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*5)
actions.single+=/seal_of_truth,if=talent.empowered_seals.enabled&buff.maraads_truth.remains<cooldown.judgment.duration
actions.single+=/seal_of_righteousness,if=talent.empowered_seals.enabled&buff.liadrins_righteousness.remains<cooldown.judgment.duration&!buff.bloodlust.up
actions.single+=/exorcism,if=holy_power<5&talent.seraphim.enabled
actions.single+=/exorcism,if=holy_power<=3|(holy_power=4&(cooldown.judgment.remains>=gcd*2&cooldown.crusader_strike.remains>=gcd*2&target.health.pct>35&buff.avenging_wrath.down))
actions.single+=/divine_storm,if=active_enemies=2&holy_power>=3&buff.final_verdict.up
actions.single+=/final_verdict,if=holy_power>=3
actions.single+=/templars_verdict,if=holy_power>=3&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*6)
actions.single+=/holy_prism

actions.cleave=final_verdict,if=buff.final_verdict.down&holy_power=5
actions.cleave+=/divine_storm,if=buff.divine_crusader.react&holy_power=5&buff.final_verdict.up
actions.cleave+=/divine_storm,if=holy_power=5&buff.final_verdict.up
actions.cleave+=/divine_storm,if=buff.divine_crusader.react&holy_power=5&!talent.final_verdict.enabled
actions.cleave+=/divine_storm,if=holy_power=5&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*4)&!talent.final_verdict.enabled
actions.cleave+=/hammer_of_wrath
actions.cleave+=/hammer_of_the_righteous,if=t18_class_trinket=1&buff.focus_of_vengeance.remains<gcd.max*2
actions.cleave+=/judgment,if=talent.empowered_seals.enabled&seal.righteousness&buff.liadrins_righteousness.remains<cooldown.judgment.duration
actions.cleave+=/exorcism,if=buff.blazing_contempt.up&holy_power<=2&buff.holy_avenger.down
actions.cleave+=/divine_storm,if=buff.divine_crusader.react&buff.final_verdict.up&(buff.avenging_wrath.up|target.health.pct<35)
actions.cleave+=/divine_storm,if=buff.final_verdict.up&(buff.avenging_wrath.up|target.health.pct<35)
actions.cleave+=/final_verdict,if=buff.final_verdict.down&(buff.avenging_wrath.up|target.health.pct<35)
actions.cleave+=/divine_storm,if=buff.divine_crusader.react&(buff.avenging_wrath.up|target.health.pct<35)&!talent.final_verdict.enabled
actions.cleave+=/divine_storm,if=holy_power=5&(buff.avenging_wrath.up|target.health.pct<35)&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*3)&!talent.final_verdict.enabled
actions.cleave+=/divine_storm,if=holy_power=4&(buff.avenging_wrath.up|target.health.pct<35)&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*4)&!talent.final_verdict.enabled
actions.cleave+=/divine_storm,if=holy_power=3&(buff.avenging_wrath.up|target.health.pct<35)&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*5)&!talent.final_verdict.enabled
actions.cleave+=/hammer_of_the_righteous,if=active_enemies>=4&holy_power<5&talent.seraphim.enabled
actions.cleave+=/hammer_of_the_righteous,if=active_enemies>=4&(holy_power<=3|(holy_power=4&target.health.pct>=35&buff.avenging_wrath.down))
actions.cleave+=/crusader_strike,if=holy_power<5&talent.seraphim.enabled
actions.cleave+=/crusader_strike,if=holy_power<=3|(holy_power=4&target.health.pct>=35&buff.avenging_wrath.down)
actions.cleave+=/exorcism,if=glyph.mass_exorcism.enabled&holy_power<5&!set_bonus.tier17_4pc=1
actions.cleave+=/judgment,cycle_targets=1,if=glyph.double_jeopardy.enabled&holy_power<5
actions.cleave+=/judgment,if=holy_power<5&talent.seraphim.enabled
actions.cleave+=/judgment,if=holy_power<=3|(holy_power=4&cooldown.crusader_strike.remains>=gcd*2&target.health.pct>35&buff.avenging_wrath.down)
actions.cleave+=/divine_storm,if=buff.divine_crusader.react&buff.final_verdict.up
actions.cleave+=/divine_storm,if=buff.divine_purpose.react&buff.final_verdict.up
actions.cleave+=/divine_storm,if=holy_power>=4&buff.final_verdict.up
actions.cleave+=/final_verdict,if=buff.divine_purpose.react&buff.final_verdict.down
actions.cleave+=/final_verdict,if=holy_power>=4&buff.final_verdict.down
actions.cleave+=/divine_storm,if=buff.divine_crusader.react&!talent.final_verdict.enabled
actions.cleave+=/divine_storm,if=holy_power>=4&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*5)&!talent.final_verdict.enabled
actions.cleave+=/exorcism,if=holy_power<5&talent.seraphim.enabled
actions.cleave+=/exorcism,if=holy_power<=3|(holy_power=4&(cooldown.judgment.remains>=gcd*2&cooldown.crusader_strike.remains>=gcd*2&target.health.pct>35&buff.avenging_wrath.down))
actions.cleave+=/divine_storm,if=holy_power>=3&(!talent.seraphim.enabled|cooldown.seraphim.remains>gcd*6)&!talent.final_verdict.enabled
actions.cleave+=/divine_storm,if=holy_power>=3&buff.final_verdict.up
actions.cleave+=/final_verdict,if=holy_power>=3&buff.final_verdict.down
actions.cleave+=/holy_prism,target=self

head=helmet_of_guiding_light,id=115568,bonus_id=567
neck=thogars_serrated_chain,id=113959,bonus_id=567,enchant=gift_of_mastery
shoulders=pauldrons_of_guiding_light,id=115565,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_mastery
chest=battleplate_of_guiding_light,id=115566,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=gauntlets_of_dramatic_blows,id=113906,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=legplates_of_guiding_light,id=115569,bonus_id=567
feet=sabatons_of_fractal_earth,id=113936,bonus_id=567
finger1=seal_of_the_savage_howl,id=113940,bonus_id=567,enchant=gift_of_mastery
finger2=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_mastery
trinket1=vial_of_convulsive_shadows,id=113969,bonus_id=567
trinket2=horn_of_screaming_spirits,id=119193,bonus_id=567
main_hand=thogars_control_rod,id=113953,bonus_id=567,enchant=mark_of_bleeding_hollow

# Gear Summary
# gear_ilvl=701.00
# gear_strength=3992
# gear_stamina=4763
# gear_crit_rating=1098
# gear_haste_rating=849
# gear_mastery_rating=1769
# gear_armor=2287
# gear_multistrike_rating=712
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Priest_Discipline_T17M_Dmg.simc"] = [[
priest="Priest_Discipline_T17M_Dmg"
level=100
race=draenei
role=spell
position=back
talents=3223232
glyphs=smite/holy_fire/inquisitor
spec=discipline

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/power_word_fortitude,if=!aura.stamina.up
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/smite

# Executed every time the actor is available.

actions=potion,name=draenic_intellect,if=buff.bloodlust.react|target.time_to_die<=40
actions+=/mindbender,if=talent.mindbender.enabled
actions+=/shadowfiend,if=!talent.mindbender.enabled
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/power_infusion,if=talent.power_infusion.enabled
actions+=/shadow_word_pain,if=!ticking
actions+=/penance
actions+=/power_word_solace,if=talent.power_word_solace.enabled
actions+=/holy_fire,if=!talent.power_word_solace.enabled
actions+=/smite,if=glyph.smite.enabled&(dot.power_word_solace.remains+dot.holy_fire.remains)>cast_time
actions+=/shadow_word_pain,if=remains<(duration*0.3)
actions+=/smite
actions+=/shadow_word_pain

head=soul_priests_hood,id=115563
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_critical_strike
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_critical_strike
chest=eyecatching_gilded_robe,id=113898,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=deckhands_rope_belt,id=113967,bonus_id=567
legs=leggings_of_the_molten_torrent,id=113914,bonus_id=567
feet=inferno_breath_sandals,id=113942,bonus_id=567
finger1=epicenter_loop,id=113947,bonus_id=567,enchant=gift_of_critical_strike
finger2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_critical_strike
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=franzoks_headsmasher,id=113904,bonus_id=567,enchant=mark_of_thunderlord
off_hand=enginestokers_lantern,id=113960,bonus_id=567

# Gear Summary
# gear_ilvl=699.06
# gear_stamina=4642
# gear_intellect=3840
# gear_spell_power=1834
# gear_crit_rating=1466
# gear_haste_rating=1067
# gear_mastery_rating=156
# gear_armor=878
# gear_multistrike_rating=1043
# gear_versatility_rating=561
# set_bonus=tier17_2pc=1
]]

private.apls["Priest_Discipline_T17M_Heal.simc"] = [[
priest="Priest_Discipline_T17M_Heal"
level=100
race=draenei
role=heal
position=back
talents=3223232
glyphs=prayer_of_mending/circle_of_healing/deep_wells
spec=discipline

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=pickled_eel
actions.precombat+=/power_word_fortitude,if=!aura.stamina.up
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/prayer_of_mending

# Executed every time the actor is available.

actions=mana_potion,if=mana.pct<=75
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/power_infusion,if=talent.power_infusion.enabled
actions+=/power_word_solace,if=talent.power_word_solace.enabled
actions+=/mindbender,if=talent.mindbender.enabled&mana.pct<80
actions+=/shadowfiend,if=!talent.mindbender.enabled
actions+=/power_word_shield
actions+=/penance_heal,if=buff.borrowed_time.up
actions+=/penance_heal
actions+=/flash_heal,if=buff.surge_of_light.react
actions+=/prayer_of_mending
actions+=/clarity_of_will
actions+=/heal,if=buff.power_infusion.up|mana.pct>20
actions+=/heal

head=soul_priests_hood,id=115563,bonus_id=567
neck=feldspars_control_choker,id=113890,bonus_id=567,enchant=gift_of_critical_strike
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=barrage_dodger_cloak,id=113878,bonus_id=567,enchant=gift_of_critical_strike
chest=soul_priests_raiment,id=115560,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=soul_priests_leggings,id=115564,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=spellbound_runic_band_of_infinite_preservation,id=118309,enchant=gift_of_critical_strike
finger2=firemenders_smoldering_signet,id=113957,bonus_id=567,enchant=gift_of_critical_strike
trinket1=autorepairing_autoclave,id=113986,bonus_id=567
trinket2=ironspike_chew_toy,id=119192,bonus_id=567
main_hand=blackhand_doomstaff,id=113988,bonus_id=567,enchant=mark_of_shadowmoon

# Gear Summary
# gear_ilvl=701.00
# gear_stamina=4763
# gear_intellect=3439
# gear_spirit=1269
# gear_spell_power=1837
# gear_crit_rating=1744
# gear_haste_rating=943
# gear_mastery_rating=913
# gear_armor=900
# gear_multistrike_rating=344
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Priest_Holy_T17M_Dmg.simc"] = [[
priest="Priest_Holy_T17M_DMG"
level=100
race=draenei
role=spell
position=back
talents=3223232
glyphs=smite/holy_fire/inquisitor
spec=holy

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/power_word_fortitude,if=!aura.stamina.up
actions.precombat+=/chakra_chastise
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/smite

# Executed every time the actor is available.

actions=potion,name=draenic_intellect,if=buff.bloodlust.react|target.time_to_die<=40
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/power_infusion,if=talent.power_infusion.enabled
actions+=/shadowfiend,if=!talent.mindbender.enabled
actions+=/mindbender,if=talent.mindbender.enabled
actions+=/shadow_word_pain,cycle_targets=1,max_cycle_targets=5,if=miss_react&!ticking
actions+=/power_word_solace
actions+=/mind_sear,if=active_enemies>=4
actions+=/holy_fire
actions+=/smite
actions+=/holy_word,moving=1
actions+=/shadow_word_pain,moving=1

head=soul_priests_hood,id=115563,bonus_id=567
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_multistrike
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_multistrike
chest=eyecatching_gilded_robe,id=113898,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=deckhands_rope_belt,id=113967,bonus_id=567
legs=leggings_of_the_molten_torrent,id=113914,bonus_id=567
feet=inferno_breath_sandals,id=113942,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_multistrike
finger2=signet_of_crystalline_barrage,id=113651,bonus_id=567,enchant=gift_of_multistrike
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=franzoks_headsmasher,id=113904,bonus_id=567,enchant=mark_of_the_frostwolf
off_hand=enginestokers_lantern,id=113960,bonus_id=567

# Gear Summary
# gear_ilvl=700.00
# gear_stamina=4723
# gear_intellect=3896
# gear_spell_power=1834
# gear_crit_rating=1139
# gear_haste_rating=1217
# gear_mastery_rating=156
# gear_armor=900
# gear_multistrike_rating=1422
# gear_versatility_rating=434
# set_bonus=tier17_2pc=1
]]

private.apls["Priest_Holy_T17M_Heal.simc"] = [[
priest="Priest_Holy_T17M_Heal"
level=100
race=draenei
role=heal
position=back
talents=3223332
glyphs=prayer_of_mending/circle_of_healing/deep_wells
spec=holy

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/power_word_fortitude,if=!aura.stamina.up
actions.precombat+=/chakra_serenity
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/prayer_of_mending

# Executed every time the actor is available.

actions=mana_potion,if=mana.pct<=75
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/power_infusion,if=talent.power_infusion.enabled
actions+=/lightwell
actions+=/power_word_solace,if=talent.power_word_solace.enabled
actions+=/mindbender,if=talent.mindbender.enabled&mana.pct<80
actions+=/shadowfiend,if=!talent.mindbender.enabled
actions+=/prayer_of_mending,if=buff.divine_insight.up
actions+=/flash_heal,if=buff.surge_of_light.up
actions+=/circle_of_healing
actions+=/holy_word
actions+=/halo,if=talent.halo.enabled
actions+=/cascade,if=talent.cascade.enabled
actions+=/divine_star,if=talent.divine_star.enabled
actions+=/renew,if=!ticking
actions+=/heal,if=buff.serendipity.react>=2&mana.pct>40
actions+=/prayer_of_mending
actions+=/heal

head=soul_priests_hood,id=115563,bonus_id=567
neck=talisman_of_the_fomor,id=113932,bonus_id=567,enchant=gift_of_multistrike
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=flame_infusion_drape,id=113945,bonus_id=567,enchant=gift_of_multistrike
chest=soul_priests_raiment,id=115560,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=soul_priests_leggings,id=115564,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=sixeyed_band,id=113901,bonus_id=567,enchant=gift_of_multistrike
finger2=spellbound_runic_band_of_infinite_preservation,id=118309,enchant=gift_of_multistrike
trinket1=autorepairing_autoclave,id=113986,bonus_id=567
trinket2=ironspike_chew_toy,id=119192,bonus_id=567
main_hand=infernoflame_staff,id=113869,bonus_id=567,enchant=mark_of_shadowmoon

# Gear Summary
# gear_ilvl=701.00
# gear_stamina=4763
# gear_intellect=3439
# gear_spirit=1309
# gear_spell_power=1837
# gear_crit_rating=847
# gear_haste_rating=1244
# gear_mastery_rating=973
# gear_armor=900
# gear_multistrike_rating=851
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Priest_Shadow_T17M_AS.simc"] = [[
priest="Priest_Shadow_T17M_AS"
level=100
race=worgen
role=spell
position=back
talents=1133133
glyphs=mind_flay/fade/sha
spec=shadow

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=pickled_eel
actions.precombat+=/power_word_fortitude,if=!aura.stamina.up
actions.precombat+=/shadowform,if=!buff.shadowform.up
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/vampiric_touch

# Executed every time the actor is available.

actions=shadowform,if=!buff.shadowform.up
actions+=/potion,name=draenic_intellect,if=buff.bloodlust.react|target.time_to_die<=40
actions+=/power_infusion,if=talent.power_infusion.enabled
actions+=/silence,if=target.debuff.casting.react
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/call_action_list,name=pvp_dispersion,if=set_bonus.pvp_2pc
actions+=/call_action_list,name=decision

actions.decision=call_action_list,name=main,if=(!talent.clarity_of_power.enabled&!talent.void_entropy.enabled)|(talent.clarity_of_power.enabled&buff.bloodlust.up&buff.power_infusion.up)
actions.decision+=/call_action_list,name=vent,if=talent.void_entropy.enabled&!talent.clarity_of_power.enabled&!talent.auspicious_spirits.enabled
actions.decision+=/call_action_list,name=cop,if=talent.clarity_of_power.enabled&!talent.insanity.enabled
actions.decision+=/call_action_list,name=cop_dotweave,if=talent.clarity_of_power.enabled&talent.insanity.enabled&target.health.pct>20&active_enemies<=6
actions.decision+=/call_action_list,name=cop_insanity,if=talent.clarity_of_power.enabled&talent.insanity.enabled

actions.pvp_dispersion=call_action_list,name=decision,if=cooldown.dispersion.remains>0
actions.pvp_dispersion+=/dispersion,interrupt=1
actions.pvp_dispersion+=/call_action_list,name=decision

actions.main=mindbender,if=talent.mindbender.enabled
actions.main+=/shadowfiend,if=!talent.mindbender.enabled
actions.main+=/shadow_word_death,if=natural_shadow_word_death_range&shadow_orb<=4,cycle_targets=1
actions.main+=/mind_blast,if=glyph.mind_harvest.enabled&shadow_orb<=2&active_enemies<=5&cooldown_react
actions.main+=/devouring_plague,if=shadow_orb=5&!target.dot.devouring_plague_dot.ticking&(talent.surge_of_darkness.enabled|set_bonus.tier17_4pc),cycle_targets=1
actions.main+=/devouring_plague,if=shadow_orb=5
actions.main+=/devouring_plague,if=shadow_orb>=3&talent.auspicious_spirits.enabled&shadowy_apparitions_in_flight>=3
actions.main+=/devouring_plague,if=shadow_orb>=4&talent.auspicious_spirits.enabled&shadowy_apparitions_in_flight>=2
actions.main+=/devouring_plague,if=shadow_orb>=3&buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.main+=/devouring_plague,if=shadow_orb>=4&talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd))&!target.dot.devouring_plague_tick.ticking&talent.surge_of_darkness.enabled,cycle_targets=1
actions.main+=/devouring_plague,if=shadow_orb>=4&talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(target.health.pct<20&cooldown.shadow_word_death.remains<gcd))
actions.main+=/devouring_plague,if=shadow_orb>=3&!talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd))&!target.dot.devouring_plague_tick.ticking&talent.surge_of_darkness.enabled,cycle_targets=1
actions.main+=/devouring_plague,if=shadow_orb>=3&!talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(target.health.pct<20&cooldown.shadow_word_death.remains<gcd))
actions.main+=/devouring_plague,if=shadow_orb>=3&talent.auspicious_spirits.enabled&set_bonus.tier18_4pc&talent.mindbender.enabled&buff.premonition.up
actions.main+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0,cycle_targets=1
actions.main+=/mind_blast,if=talent.auspicious_spirits.enabled&active_enemies<=4&cooldown_react
actions.main+=/shadow_word_pain,if=talent.auspicious_spirits.enabled&remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react,cycle_targets=1,max_cycle_targets=7
actions.main+=/mind_blast,if=cooldown_react
actions.main+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.main+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.main+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.main+=/searing_insanity,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.main+=/insanity,if=buff.insanity.remains<0.5*gcd&active_enemies<=2,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/insanity,chain=1,if=active_enemies<=2,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/halo,if=talent.halo.enabled&target.distance<=30&active_enemies>2
actions.main+=/cascade,if=talent.cascade.enabled&active_enemies>2&target.distance<=40
actions.main+=/divine_star,if=talent.divine_star.enabled&active_enemies>4&target.distance<=24
actions.main+=/shadow_word_pain,if=!talent.auspicious_spirits.enabled&remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react&active_enemies<=5,cycle_targets=1,max_cycle_targets=5
actions.main+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react&active_enemies<=5,cycle_targets=1,max_cycle_targets=5
actions.main+=/devouring_plague,if=!talent.void_entropy.enabled&shadow_orb>=3&ticks_remain<=1
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.main+=/mind_spike,if=active_enemies<=5&buff.surge_of_darkness.react=3
actions.main+=/halo,if=talent.halo.enabled&target.distance<=30&target.distance>=17
actions.main+=/cascade,if=talent.cascade.enabled&(active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11
actions.main+=/divine_star,if=talent.divine_star.enabled&(active_enemies>1&target.distance<=24)
actions.main+=/wait,sec=cooldown.shadow_word_death.remains,if=natural_shadow_word_death_range&cooldown.shadow_word_death.remains<0.5&active_enemies<=1,cycle_targets=1
actions.main+=/wait,sec=cooldown.mind_blast.remains,if=cooldown.mind_blast.remains<0.5&cooldown.mind_blast.remains&active_enemies<=1
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&!set_bonus.tier18_4pc
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains<23
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains>38&buff.surge_of_darkness.remains<(1.1*gcd*buff.surge_of_darkness.react)
actions.main+=/divine_star,if=talent.divine_star.enabled&target.distance<=28&active_enemies>1
actions.main+=/mind_sear,chain=1,if=active_enemies>=4,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/shadow_word_pain,if=talent.auspicious_spirits.enabled&remains<(18*0.9)&target.time_to_die>(18*0.75)&active_enemies>=3&miss_react,cycle_targets=1,max_cycle_targets=7
actions.main+=/shadow_word_pain,if=shadow_orb>=2&ticks_remain<=3&target.time_to_die>(18*0.75)&talent.insanity.enabled
actions.main+=/vampiric_touch,if=shadow_orb>=2&ticks_remain<=3.5&target.time_to_die>(15*0.75+cast_time)&talent.insanity.enabled
actions.main+=/mind_flay,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.main+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.main+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.main+=/divine_star,moving=1,if=talent.divine_star.enabled&target.distance<=28
actions.main+=/cascade,moving=1,if=talent.cascade.enabled&target.distance<=40
actions.main+=/shadow_word_pain,moving=1,cycle_targets=1

actions.vent=mindbender,if=set_bonus.tier18_2pc&talent.mindbender.enabled
actions.vent+=/shadowfiend,if=set_bonus.tier18_2pc&!talent.mindbender.enabled
actions.vent+=/void_entropy,if=shadow_orb=3&!ticking&target.time_to_die>60&active_enemies=1
actions.vent+=/void_entropy,if=!dot.void_entropy.ticking&shadow_orb=5&active_enemies>=1&target.time_to_die>60,cycle_targets=1,max_cycle_targets=6
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.ticking&dot.void_entropy.remains<=gcd*2&cooldown_react&active_enemies=1
actions.vent+=/devouring_plague,if=dot.void_entropy.ticking&dot.void_entropy.remains<=gcd*2&cooldown_react&active_enemies>1,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<5&active_enemies>1,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<10&active_enemies>2,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<15&active_enemies>3,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<20&active_enemies>4,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&(dot.void_entropy.remains|target.time_to_die<=60)&(cooldown.mind_blast.remains<=gcd*2|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<=gcd*2))&active_enemies=1
actions.vent+=/devouring_plague,if=shadow_orb=5&(dot.void_entropy.remains|target.time_to_die<=60)&(cooldown.mind_blast.remains<=gcd*2|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<=gcd*2))&active_enemies>1,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb>=3&dot.void_entropy.ticking&active_enemies=1&buff.mental_instinct.remains<(gcd*1.4)&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.vent+=/devouring_plague,if=shadow_orb>=3&target.time_to_die<=gcd*4&active_enemies=1
actions.vent+=/mindbender,if=!set_bonus.tier18_2pc&talent.mindbender.enabled&cooldown.mind_blast.remains>=gcd
actions.vent+=/shadowfiend,if=!set_bonus.tier18_2pc&!talent.mindbender.enabled&cooldown.mind_blast.remains>=gcd
actions.vent+=/halo,if=talent.halo.enabled&target.distance<=30&active_enemies>=4
actions.vent+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0&shadow_orb<=2,cycle_targets=1
actions.vent+=/devouring_plague,if=glyph.mind_harvest.enabled&mind_harvest=0&shadow_orb>=3,cycle_targets=1
actions.vent+=/mind_blast,if=active_enemies<=10&cooldown_react&shadow_orb<=4
actions.vent+=/shadow_word_death,if=natural_shadow_word_death_range&cooldown_react&shadow_orb<=4,cycle_targets=1
actions.vent+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.vent+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.vent+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/searing_insanity,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/shadow_word_pain,if=shadow_orb=4&remains<(18*0.50)&set_bonus.tier17_2pc&cooldown.mind_blast.remains<1.2*gcd&cooldown.mind_blast.remains>0.2*gcd
actions.vent+=/insanity,if=buff.insanity.remains<0.5*gcd&active_enemies<=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/insanity,chain=1,if=active_enemies<=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.vent+=/mind_spike,if=active_enemies<=5&buff.surge_of_darkness.react=3
actions.vent+=/shadow_word_pain,if=remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react,cycle_targets=1,max_cycle_targets=5
actions.vent+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react,cycle_targets=1,max_cycle_targets=5
actions.vent+=/halo,if=talent.halo.enabled&target.distance<=30&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/cascade,if=talent.cascade.enabled&target.distance<=40&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/divine_star,if=talent.divine_star.enabled&active_enemies>4&target.distance<=24&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&!set_bonus.tier18_4pc
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains<23
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains>38&buff.surge_of_darkness.remains<(1.1*gcd*buff.surge_of_darkness.react)
actions.vent+=/mind_spike,if=active_enemies<=5&buff.surge_of_darkness.react&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/mind_sear,chain=1,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/mind_flay,if=cooldown.mind_blast.remains>0.5*gcd,interrupt=1,chain=1
actions.vent+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.vent+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.vent+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.vent+=/divine_star,moving=1,if=talent.divine_star.enabled&target.distance<=28
actions.vent+=/cascade,moving=1,if=talent.cascade.enabled&target.distance<=40
actions.vent+=/shadow_word_pain,moving=1,cycle_targets=1

actions.cop_dotweave=devouring_plague,if=target.dot.vampiric_touch.ticking&target.dot.shadow_word_pain.ticking&shadow_orb=5&cooldown_react
actions.cop_dotweave+=/devouring_plague,if=buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.cop_dotweave+=/devouring_plague,if=(target.dot.vampiric_touch.ticking&target.dot.shadow_word_pain.ticking&!buff.insanity.remains&cooldown.mind_blast.remains>0.4*gcd)
actions.cop_dotweave+=/shadow_word_death,if=natural_shadow_word_death_range&!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_dotweave+=/shadow_word_death,if=natural_shadow_word_death_range,cycle_targets=1
actions.cop_dotweave+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0&shadow_orb<=2,cycle_targets=1
actions.cop_dotweave+=/mind_blast,if=shadow_orb<=4&cooldown_react
actions.cop_dotweave+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_dotweave+=/searing_insanity,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_dotweave+=/shadowfiend,if=!talent.mindbender.enabled&!buff.insanity.remains
actions.cop_dotweave+=/mindbender,if=talent.mindbender.enabled&!buff.insanity.remains
actions.cop_dotweave+=/shadow_word_pain,if=shadow_orb=4&set_bonus.tier17_2pc&!target.dot.shadow_word_pain.ticking&!target.dot.devouring_plague.ticking&cooldown.mind_blast.remains<gcd&cooldown.mind_blast.remains>0
actions.cop_dotweave+=/shadow_word_pain,if=shadow_orb=5&!target.dot.devouring_plague.ticking&!target.dot.shadow_word_pain.ticking
actions.cop_dotweave+=/vampiric_touch,if=shadow_orb=5&!target.dot.devouring_plague.ticking&!target.dot.vampiric_touch.ticking
actions.cop_dotweave+=/insanity,if=buff.insanity.remains,chain=1,interrupt_if=cooldown.mind_blast.remains<=0.1
actions.cop_dotweave+=/shadow_word_pain,if=shadow_orb>=2&target.dot.shadow_word_pain.remains>=6&cooldown.mind_blast.remains>0.5*gcd&target.dot.vampiric_touch.remains&buff.bloodlust.up&!set_bonus.tier17_2pc
actions.cop_dotweave+=/vampiric_touch,if=shadow_orb>=2&target.dot.vampiric_touch.remains>=5&cooldown.mind_blast.remains>0.5*gcd&buff.bloodlust.up&!set_bonus.tier17_2pc
actions.cop_dotweave+=/halo,if=cooldown.mind_blast.remains>0.5*gcd&talent.halo.enabled&target.distance<=30&target.distance>=17
actions.cop_dotweave+=/cascade,if=cooldown.mind_blast.remains>0.5*gcd&talent.cascade.enabled&((active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11)
actions.cop_dotweave+=/divine_star,if=talent.divine_star.enabled&cooldown.mind_blast.remains>0.5*gcd&active_enemies>3&target.distance<=24
actions.cop_dotweave+=/shadow_word_pain,if=primary_target=0&!ticking,cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/vampiric_touch,if=primary_target=0&!ticking,cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/divine_star,if=talent.divine_star.enabled&cooldown.mind_blast.remains>0.5*gcd&active_enemies=3&target.distance<=24
actions.cop_dotweave+=/shadow_word_pain,if=primary_target=0&(!ticking|remains<=18*0.3)&target.time_to_die>(18*0.75),cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/vampiric_touch,if=primary_target=0&(!ticking|remains<=15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time),cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_dotweave+=/mind_sear,if=active_enemies>=8,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_dotweave+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_dotweave+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.stack<10
actions.cop_dotweave+=/mind_spike
actions.cop_dotweave+=/shadow_word_death,moving=1,if=!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_dotweave+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.cop_dotweave+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.cop_dotweave+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.cop_dotweave+=/divine_star,if=talent.divine_star.enabled&target.distance<=28,moving=1
actions.cop_dotweave+=/cascade,if=talent.cascade.enabled&target.distance<=40,moving=1
actions.cop_dotweave+=/devouring_plague,moving=1
actions.cop_dotweave+=/shadow_word_pain,if=primary_target=0,moving=1,cycle_targets=1

actions.cop_insanity=devouring_plague,if=shadow_orb=5|(active_enemies>=5&!buff.insanity.remains)
actions.cop_insanity+=/devouring_plague,if=buff.mental_instinct.remains<(gcd*1.7)&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.cop_insanity+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0,cycle_targets=1
actions.cop_insanity+=/mind_blast,if=active_enemies<=5&cooldown_react
actions.cop_insanity+=/shadow_word_death,if=natural_shadow_word_death_range&!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_insanity+=/shadow_word_death,if=natural_shadow_word_death_range,cycle_targets=1
actions.cop_insanity+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_insanity+=/devouring_plague,if=shadow_orb>=3&!set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<gcd|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd)),cycle_targets=1
actions.cop_insanity+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=2|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd)),cycle_targets=1
actions.cop_insanity+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_insanity+=/searing_insanity,if=active_enemies>=5,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_insanity+=/mindbender,if=talent.mindbender.enabled
actions.cop_insanity+=/shadowfiend,if=!talent.mindbender.enabled
actions.cop_insanity+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_insanity+=/shadow_word_pain,if=remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop_insanity+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop_insanity+=/insanity,if=buff.insanity.remains<0.5*gcd&active_enemies<=2,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|(cooldown.shadow_word_death.remains<=0.1&target.health.pct<20))
actions.cop_insanity+=/insanity,if=active_enemies<=2,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|(cooldown.shadow_word_death.remains<=0.1&target.health.pct<20))
actions.cop_insanity+=/halo,if=talent.halo.enabled&target.distance<=30&target.distance>=17
actions.cop_insanity+=/cascade,if=talent.cascade.enabled&((active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11)
actions.cop_insanity+=/divine_star,if=talent.divine_star.enabled&active_enemies>2&target.distance<=24
actions.cop_insanity+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_insanity+=/mind_sear,if=active_enemies>=8,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_insanity+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.stack<10
actions.cop_insanity+=/mind_spike
actions.cop_insanity+=/shadow_word_death,moving=1,if=!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_insanity+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.cop_insanity+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.cop_insanity+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.cop_insanity+=/divine_star,if=talent.divine_star.enabled&target.distance<=28,moving=1
actions.cop_insanity+=/cascade,if=talent.cascade.enabled&target.distance<=40,moving=1
actions.cop_insanity+=/devouring_plague,moving=1
actions.cop_insanity+=/shadow_word_pain,if=primary_target=0,moving=1,cycle_targets=1

actions.cop=devouring_plague,if=shadow_orb=5&primary_target=0&!target.dot.devouring_plague_dot.ticking&target.time_to_die>=(gcd*4*7%6),cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb=5&primary_target=0&target.time_to_die>=(gcd*4*7%6)&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20)),cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb=5&!set_bonus.tier17_2pc&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))
actions.cop+=/devouring_plague,if=shadow_orb=5&set_bonus.tier17_2pc&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))
actions.cop+=/devouring_plague,if=primary_target=0&buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains&active_enemies>1,cycle_targets=1
actions.cop+=/devouring_plague,if=buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains&active_enemies>1
actions.cop+=/devouring_plague,if=shadow_orb>=3&!set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6),cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&!set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6)&active_enemies>1,cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&active_enemies>1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&talent.mindbender.enabled&!target.dot.devouring_plague_dot.ticking&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6)&active_enemies=1,cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&talent.mindbender.enabled&!target.dot.devouring_plague_dot.ticking&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&active_enemies=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&talent.surge_of_darkness.enabled&buff.mental_instinct.remains<(gcd*1.4)&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6)&active_enemies=1,cycle_targets=1
actions.cop+=/mind_blast,if=mind_harvest=0,cycle_targets=1
actions.cop+=/mind_blast,if=cooldown_react
actions.cop+=/shadow_word_death,if=natural_shadow_word_death_range&!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop+=/shadow_word_death,if=natural_shadow_word_death_range,cycle_targets=1
actions.cop+=/mindbender,if=talent.mindbender.enabled
actions.cop+=/shadowfiend,if=!talent.mindbender.enabled
actions.cop+=/halo,if=talent.halo.enabled&target.distance<=30&target.distance>=17
actions.cop+=/cascade,if=talent.cascade.enabled&(active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11
actions.cop+=/divine_star,if=talent.divine_star.enabled&active_enemies>3&target.distance<=24
actions.cop+=/shadow_word_pain,if=remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react&!ticking&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop+=/divine_star,if=talent.divine_star.enabled&active_enemies=3&target.distance<=24
actions.cop+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd
actions.cop+=/mind_spike,if=active_enemies<=4&buff.surge_of_darkness.react
actions.cop+=/mind_sear,if=active_enemies>=8,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop+=/mind_spike,if=target.dot.devouring_plague_tick.remains&target.dot.devouring_plague_tick.remains<cast_time
actions.cop+=/mind_flay,if=target.dot.devouring_plague_tick.ticks_remain>1&active_enemies>1,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.stack<10
actions.cop+=/mind_spike
actions.cop+=/shadow_word_death,moving=1,if=!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.cop+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.cop+=/halo,moving=1,if=talent.halo.enabled&target.distance<=30
actions.cop+=/divine_star,if=talent.divine_star.enabled&target.distance<=28,moving=1
actions.cop+=/cascade,if=talent.cascade.enabled&target.distance<=40,moving=1
actions.cop+=/devouring_plague,moving=1

head=soul_priests_hood,id=115563,bonus_id=567
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_critical_strike
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_critical_strike
chest=soul_priests_raiment,id=115560,bonus_id=567
wrists=bracers_of_spattered_steel,id=113887,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=deckhands_rope_belt,id=113967,bonus_id=567
legs=turret_mechanics_legwraps,id=113970,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_critical_strike
finger2=epicenter_loop,id=113947,bonus_id=567,enchant=gift_of_critical_strike
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=blackhand_doomstaff,id=113988,bonus_id=567,enchant=mark_of_the_thunderlord

# Gear Summary
# gear_ilvl=701.00
# gear_stamina=4763
# gear_intellect=3923
# gear_spell_power=1837
# gear_crit_rating=1868
# gear_haste_rating=568
# gear_mastery_rating=888
# gear_armor=900
# gear_multistrike_rating=742
# gear_versatility_rating=338
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Priest_Shadow_T17M_COP.simc"] = [[
priest="Priest_Shadow_T17M_COP"
level=100
race=troll
role=spell
position=back
talents=1133131
glyphs=mind_flay/fade/sha
spec=shadow

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/power_word_fortitude,if=!aura.stamina.up
actions.precombat+=/shadowform,if=!buff.shadowform.up
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/mind_spike

# Executed every time the actor is available.

actions=shadowform,if=!buff.shadowform.up
actions+=/potion,name=draenic_intellect,if=buff.bloodlust.react|target.time_to_die<=40
actions+=/power_infusion,if=talent.power_infusion.enabled
actions+=/silence,if=target.debuff.casting.react
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/call_action_list,name=pvp_dispersion,if=set_bonus.pvp_2pc
actions+=/call_action_list,name=decision

actions.decision=call_action_list,name=main,if=(!talent.clarity_of_power.enabled&!talent.void_entropy.enabled)|(talent.clarity_of_power.enabled&buff.bloodlust.up&buff.power_infusion.up)
actions.decision+=/call_action_list,name=vent,if=talent.void_entropy.enabled&!talent.clarity_of_power.enabled&!talent.auspicious_spirits.enabled
actions.decision+=/call_action_list,name=cop,if=talent.clarity_of_power.enabled&!talent.insanity.enabled
actions.decision+=/call_action_list,name=cop_dotweave,if=talent.clarity_of_power.enabled&talent.insanity.enabled&target.health.pct>20&active_enemies<=6
actions.decision+=/call_action_list,name=cop_insanity,if=talent.clarity_of_power.enabled&talent.insanity.enabled

actions.pvp_dispersion=call_action_list,name=decision,if=cooldown.dispersion.remains>0
actions.pvp_dispersion+=/dispersion,interrupt=1
actions.pvp_dispersion+=/call_action_list,name=decision

actions.main=mindbender,if=talent.mindbender.enabled
actions.main+=/shadowfiend,if=!talent.mindbender.enabled
actions.main+=/shadow_word_death,if=natural_shadow_word_death_range&shadow_orb<=4,cycle_targets=1
actions.main+=/mind_blast,if=glyph.mind_harvest.enabled&shadow_orb<=2&active_enemies<=5&cooldown_react
actions.main+=/devouring_plague,if=shadow_orb=5&!target.dot.devouring_plague_dot.ticking&(talent.surge_of_darkness.enabled|set_bonus.tier17_4pc),cycle_targets=1
actions.main+=/devouring_plague,if=shadow_orb=5
actions.main+=/devouring_plague,if=shadow_orb>=3&talent.auspicious_spirits.enabled&shadowy_apparitions_in_flight>=3
actions.main+=/devouring_plague,if=shadow_orb>=4&talent.auspicious_spirits.enabled&shadowy_apparitions_in_flight>=2
actions.main+=/devouring_plague,if=shadow_orb>=3&buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.main+=/devouring_plague,if=shadow_orb>=4&talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd))&!target.dot.devouring_plague_tick.ticking&talent.surge_of_darkness.enabled,cycle_targets=1
actions.main+=/devouring_plague,if=shadow_orb>=4&talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(target.health.pct<20&cooldown.shadow_word_death.remains<gcd))
actions.main+=/devouring_plague,if=shadow_orb>=3&!talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd))&!target.dot.devouring_plague_tick.ticking&talent.surge_of_darkness.enabled,cycle_targets=1
actions.main+=/devouring_plague,if=shadow_orb>=3&!talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(target.health.pct<20&cooldown.shadow_word_death.remains<gcd))
actions.main+=/devouring_plague,if=shadow_orb>=3&talent.auspicious_spirits.enabled&set_bonus.tier18_4pc&talent.mindbender.enabled&buff.premonition.up
actions.main+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0,cycle_targets=1
actions.main+=/mind_blast,if=talent.auspicious_spirits.enabled&active_enemies<=4&cooldown_react
actions.main+=/shadow_word_pain,if=talent.auspicious_spirits.enabled&remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react,cycle_targets=1,max_cycle_targets=7
actions.main+=/mind_blast,if=cooldown_react
actions.main+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.main+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.main+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.main+=/searing_insanity,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.main+=/insanity,if=buff.insanity.remains<0.5*gcd&active_enemies<=2,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/insanity,chain=1,if=active_enemies<=2,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/halo,if=talent.halo.enabled&target.distance<=30&active_enemies>2
actions.main+=/cascade,if=talent.cascade.enabled&active_enemies>2&target.distance<=40
actions.main+=/divine_star,if=talent.divine_star.enabled&active_enemies>4&target.distance<=24
actions.main+=/shadow_word_pain,if=!talent.auspicious_spirits.enabled&remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react&active_enemies<=5,cycle_targets=1,max_cycle_targets=5
actions.main+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react&active_enemies<=5,cycle_targets=1,max_cycle_targets=5
actions.main+=/devouring_plague,if=!talent.void_entropy.enabled&shadow_orb>=3&ticks_remain<=1
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.main+=/mind_spike,if=active_enemies<=5&buff.surge_of_darkness.react=3
actions.main+=/halo,if=talent.halo.enabled&target.distance<=30&target.distance>=17
actions.main+=/cascade,if=talent.cascade.enabled&(active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11
actions.main+=/divine_star,if=talent.divine_star.enabled&(active_enemies>1&target.distance<=24)
actions.main+=/wait,sec=cooldown.shadow_word_death.remains,if=natural_shadow_word_death_range&cooldown.shadow_word_death.remains<0.5&active_enemies<=1,cycle_targets=1
actions.main+=/wait,sec=cooldown.mind_blast.remains,if=cooldown.mind_blast.remains<0.5&cooldown.mind_blast.remains&active_enemies<=1
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&!set_bonus.tier18_4pc
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains<23
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains>38&buff.surge_of_darkness.remains<(1.1*gcd*buff.surge_of_darkness.react)
actions.main+=/divine_star,if=talent.divine_star.enabled&target.distance<=28&active_enemies>1
actions.main+=/mind_sear,chain=1,if=active_enemies>=4,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/shadow_word_pain,if=talent.auspicious_spirits.enabled&remains<(18*0.9)&target.time_to_die>(18*0.75)&active_enemies>=3&miss_react,cycle_targets=1,max_cycle_targets=7
actions.main+=/shadow_word_pain,if=shadow_orb>=2&ticks_remain<=3&target.time_to_die>(18*0.75)&talent.insanity.enabled
actions.main+=/vampiric_touch,if=shadow_orb>=2&ticks_remain<=3.5&target.time_to_die>(15*0.75+cast_time)&talent.insanity.enabled
actions.main+=/mind_flay,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.main+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.main+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.main+=/divine_star,moving=1,if=talent.divine_star.enabled&target.distance<=28
actions.main+=/cascade,moving=1,if=talent.cascade.enabled&target.distance<=40
actions.main+=/shadow_word_pain,moving=1,cycle_targets=1

actions.vent=mindbender,if=set_bonus.tier18_2pc&talent.mindbender.enabled
actions.vent+=/shadowfiend,if=set_bonus.tier18_2pc&!talent.mindbender.enabled
actions.vent+=/void_entropy,if=shadow_orb=3&!ticking&target.time_to_die>60&active_enemies=1
actions.vent+=/void_entropy,if=!dot.void_entropy.ticking&shadow_orb=5&active_enemies>=1&target.time_to_die>60,cycle_targets=1,max_cycle_targets=6
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.ticking&dot.void_entropy.remains<=gcd*2&cooldown_react&active_enemies=1
actions.vent+=/devouring_plague,if=dot.void_entropy.ticking&dot.void_entropy.remains<=gcd*2&cooldown_react&active_enemies>1,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<5&active_enemies>1,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<10&active_enemies>2,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<15&active_enemies>3,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<20&active_enemies>4,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&(dot.void_entropy.remains|target.time_to_die<=60)&(cooldown.mind_blast.remains<=gcd*2|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<=gcd*2))&active_enemies=1
actions.vent+=/devouring_plague,if=shadow_orb=5&(dot.void_entropy.remains|target.time_to_die<=60)&(cooldown.mind_blast.remains<=gcd*2|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<=gcd*2))&active_enemies>1,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb>=3&dot.void_entropy.ticking&active_enemies=1&buff.mental_instinct.remains<(gcd*1.4)&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.vent+=/devouring_plague,if=shadow_orb>=3&target.time_to_die<=gcd*4&active_enemies=1
actions.vent+=/mindbender,if=!set_bonus.tier18_2pc&talent.mindbender.enabled&cooldown.mind_blast.remains>=gcd
actions.vent+=/shadowfiend,if=!set_bonus.tier18_2pc&!talent.mindbender.enabled&cooldown.mind_blast.remains>=gcd
actions.vent+=/halo,if=talent.halo.enabled&target.distance<=30&active_enemies>=4
actions.vent+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0&shadow_orb<=2,cycle_targets=1
actions.vent+=/devouring_plague,if=glyph.mind_harvest.enabled&mind_harvest=0&shadow_orb>=3,cycle_targets=1
actions.vent+=/mind_blast,if=active_enemies<=10&cooldown_react&shadow_orb<=4
actions.vent+=/shadow_word_death,if=natural_shadow_word_death_range&cooldown_react&shadow_orb<=4,cycle_targets=1
actions.vent+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.vent+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.vent+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/searing_insanity,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/shadow_word_pain,if=shadow_orb=4&remains<(18*0.50)&set_bonus.tier17_2pc&cooldown.mind_blast.remains<1.2*gcd&cooldown.mind_blast.remains>0.2*gcd
actions.vent+=/insanity,if=buff.insanity.remains<0.5*gcd&active_enemies<=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/insanity,chain=1,if=active_enemies<=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.vent+=/mind_spike,if=active_enemies<=5&buff.surge_of_darkness.react=3
actions.vent+=/shadow_word_pain,if=remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react,cycle_targets=1,max_cycle_targets=5
actions.vent+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react,cycle_targets=1,max_cycle_targets=5
actions.vent+=/halo,if=talent.halo.enabled&target.distance<=30&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/cascade,if=talent.cascade.enabled&target.distance<=40&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/divine_star,if=talent.divine_star.enabled&active_enemies>4&target.distance<=24&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&!set_bonus.tier18_4pc
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains<23
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains>38&buff.surge_of_darkness.remains<(1.1*gcd*buff.surge_of_darkness.react)
actions.vent+=/mind_spike,if=active_enemies<=5&buff.surge_of_darkness.react&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/mind_sear,chain=1,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/mind_flay,if=cooldown.mind_blast.remains>0.5*gcd,interrupt=1,chain=1
actions.vent+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.vent+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.vent+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.vent+=/divine_star,moving=1,if=talent.divine_star.enabled&target.distance<=28
actions.vent+=/cascade,moving=1,if=talent.cascade.enabled&target.distance<=40
actions.vent+=/shadow_word_pain,moving=1,cycle_targets=1

actions.cop_dotweave=devouring_plague,if=target.dot.vampiric_touch.ticking&target.dot.shadow_word_pain.ticking&shadow_orb=5&cooldown_react
actions.cop_dotweave+=/devouring_plague,if=buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.cop_dotweave+=/devouring_plague,if=(target.dot.vampiric_touch.ticking&target.dot.shadow_word_pain.ticking&!buff.insanity.remains&cooldown.mind_blast.remains>0.4*gcd)
actions.cop_dotweave+=/shadow_word_death,if=natural_shadow_word_death_range&!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_dotweave+=/shadow_word_death,if=natural_shadow_word_death_range,cycle_targets=1
actions.cop_dotweave+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0&shadow_orb<=2,cycle_targets=1
actions.cop_dotweave+=/mind_blast,if=shadow_orb<=4&cooldown_react
actions.cop_dotweave+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_dotweave+=/searing_insanity,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_dotweave+=/shadowfiend,if=!talent.mindbender.enabled&!buff.insanity.remains
actions.cop_dotweave+=/mindbender,if=talent.mindbender.enabled&!buff.insanity.remains
actions.cop_dotweave+=/shadow_word_pain,if=shadow_orb=4&set_bonus.tier17_2pc&!target.dot.shadow_word_pain.ticking&!target.dot.devouring_plague.ticking&cooldown.mind_blast.remains<gcd&cooldown.mind_blast.remains>0
actions.cop_dotweave+=/shadow_word_pain,if=shadow_orb=5&!target.dot.devouring_plague.ticking&!target.dot.shadow_word_pain.ticking
actions.cop_dotweave+=/vampiric_touch,if=shadow_orb=5&!target.dot.devouring_plague.ticking&!target.dot.vampiric_touch.ticking
actions.cop_dotweave+=/insanity,if=buff.insanity.remains,chain=1,interrupt_if=cooldown.mind_blast.remains<=0.1
actions.cop_dotweave+=/shadow_word_pain,if=shadow_orb>=2&target.dot.shadow_word_pain.remains>=6&cooldown.mind_blast.remains>0.5*gcd&target.dot.vampiric_touch.remains&buff.bloodlust.up&!set_bonus.tier17_2pc
actions.cop_dotweave+=/vampiric_touch,if=shadow_orb>=2&target.dot.vampiric_touch.remains>=5&cooldown.mind_blast.remains>0.5*gcd&buff.bloodlust.up&!set_bonus.tier17_2pc
actions.cop_dotweave+=/halo,if=cooldown.mind_blast.remains>0.5*gcd&talent.halo.enabled&target.distance<=30&target.distance>=17
actions.cop_dotweave+=/cascade,if=cooldown.mind_blast.remains>0.5*gcd&talent.cascade.enabled&((active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11)
actions.cop_dotweave+=/divine_star,if=talent.divine_star.enabled&cooldown.mind_blast.remains>0.5*gcd&active_enemies>3&target.distance<=24
actions.cop_dotweave+=/shadow_word_pain,if=primary_target=0&!ticking,cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/vampiric_touch,if=primary_target=0&!ticking,cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/divine_star,if=talent.divine_star.enabled&cooldown.mind_blast.remains>0.5*gcd&active_enemies=3&target.distance<=24
actions.cop_dotweave+=/shadow_word_pain,if=primary_target=0&(!ticking|remains<=18*0.3)&target.time_to_die>(18*0.75),cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/vampiric_touch,if=primary_target=0&(!ticking|remains<=15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time),cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_dotweave+=/mind_sear,if=active_enemies>=8,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_dotweave+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_dotweave+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.stack<10
actions.cop_dotweave+=/mind_spike
actions.cop_dotweave+=/shadow_word_death,moving=1,if=!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_dotweave+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.cop_dotweave+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.cop_dotweave+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.cop_dotweave+=/divine_star,if=talent.divine_star.enabled&target.distance<=28,moving=1
actions.cop_dotweave+=/cascade,if=talent.cascade.enabled&target.distance<=40,moving=1
actions.cop_dotweave+=/devouring_plague,moving=1
actions.cop_dotweave+=/shadow_word_pain,if=primary_target=0,moving=1,cycle_targets=1

actions.cop_insanity=devouring_plague,if=shadow_orb=5|(active_enemies>=5&!buff.insanity.remains)
actions.cop_insanity+=/devouring_plague,if=buff.mental_instinct.remains<(gcd*1.7)&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.cop_insanity+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0,cycle_targets=1
actions.cop_insanity+=/mind_blast,if=active_enemies<=5&cooldown_react
actions.cop_insanity+=/shadow_word_death,if=natural_shadow_word_death_range&!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_insanity+=/shadow_word_death,if=natural_shadow_word_death_range,cycle_targets=1
actions.cop_insanity+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_insanity+=/devouring_plague,if=shadow_orb>=3&!set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<gcd|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd)),cycle_targets=1
actions.cop_insanity+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=2|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd)),cycle_targets=1
actions.cop_insanity+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_insanity+=/searing_insanity,if=active_enemies>=5,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_insanity+=/mindbender,if=talent.mindbender.enabled
actions.cop_insanity+=/shadowfiend,if=!talent.mindbender.enabled
actions.cop_insanity+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_insanity+=/shadow_word_pain,if=remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop_insanity+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop_insanity+=/insanity,if=buff.insanity.remains<0.5*gcd&active_enemies<=2,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|(cooldown.shadow_word_death.remains<=0.1&target.health.pct<20))
actions.cop_insanity+=/insanity,if=active_enemies<=2,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|(cooldown.shadow_word_death.remains<=0.1&target.health.pct<20))
actions.cop_insanity+=/halo,if=talent.halo.enabled&target.distance<=30&target.distance>=17
actions.cop_insanity+=/cascade,if=talent.cascade.enabled&((active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11)
actions.cop_insanity+=/divine_star,if=talent.divine_star.enabled&active_enemies>2&target.distance<=24
actions.cop_insanity+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_insanity+=/mind_sear,if=active_enemies>=8,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_insanity+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.stack<10
actions.cop_insanity+=/mind_spike
actions.cop_insanity+=/shadow_word_death,moving=1,if=!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_insanity+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.cop_insanity+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.cop_insanity+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.cop_insanity+=/divine_star,if=talent.divine_star.enabled&target.distance<=28,moving=1
actions.cop_insanity+=/cascade,if=talent.cascade.enabled&target.distance<=40,moving=1
actions.cop_insanity+=/devouring_plague,moving=1
actions.cop_insanity+=/shadow_word_pain,if=primary_target=0,moving=1,cycle_targets=1

actions.cop=devouring_plague,if=shadow_orb=5&primary_target=0&!target.dot.devouring_plague_dot.ticking&target.time_to_die>=(gcd*4*7%6),cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb=5&primary_target=0&target.time_to_die>=(gcd*4*7%6)&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20)),cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb=5&!set_bonus.tier17_2pc&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))
actions.cop+=/devouring_plague,if=shadow_orb=5&set_bonus.tier17_2pc&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))
actions.cop+=/devouring_plague,if=primary_target=0&buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains&active_enemies>1,cycle_targets=1
actions.cop+=/devouring_plague,if=buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains&active_enemies>1
actions.cop+=/devouring_plague,if=shadow_orb>=3&!set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6),cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&!set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6)&active_enemies>1,cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&active_enemies>1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&talent.mindbender.enabled&!target.dot.devouring_plague_dot.ticking&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6)&active_enemies=1,cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&talent.mindbender.enabled&!target.dot.devouring_plague_dot.ticking&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&active_enemies=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&talent.surge_of_darkness.enabled&buff.mental_instinct.remains<(gcd*1.4)&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6)&active_enemies=1,cycle_targets=1
actions.cop+=/mind_blast,if=mind_harvest=0,cycle_targets=1
actions.cop+=/mind_blast,if=cooldown_react
actions.cop+=/shadow_word_death,if=natural_shadow_word_death_range&!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop+=/shadow_word_death,if=natural_shadow_word_death_range,cycle_targets=1
actions.cop+=/mindbender,if=talent.mindbender.enabled
actions.cop+=/shadowfiend,if=!talent.mindbender.enabled
actions.cop+=/halo,if=talent.halo.enabled&target.distance<=30&target.distance>=17
actions.cop+=/cascade,if=talent.cascade.enabled&(active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11
actions.cop+=/divine_star,if=talent.divine_star.enabled&active_enemies>3&target.distance<=24
actions.cop+=/shadow_word_pain,if=remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react&!ticking&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop+=/divine_star,if=talent.divine_star.enabled&active_enemies=3&target.distance<=24
actions.cop+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd
actions.cop+=/mind_spike,if=active_enemies<=4&buff.surge_of_darkness.react
actions.cop+=/mind_sear,if=active_enemies>=8,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop+=/mind_spike,if=target.dot.devouring_plague_tick.remains&target.dot.devouring_plague_tick.remains<cast_time
actions.cop+=/mind_flay,if=target.dot.devouring_plague_tick.ticks_remain>1&active_enemies>1,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.stack<10
actions.cop+=/mind_spike
actions.cop+=/shadow_word_death,moving=1,if=!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.cop+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.cop+=/halo,moving=1,if=talent.halo.enabled&target.distance<=30
actions.cop+=/divine_star,if=talent.divine_star.enabled&target.distance<=28,moving=1
actions.cop+=/cascade,if=talent.cascade.enabled&target.distance<=40,moving=1
actions.cop+=/devouring_plague,moving=1

head=slagbombers_hood,id=113981,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant=gift_of_mastery
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant=gift_of_mastery
chest=soul_priests_raiment,id=115560,bonus_id=567
wrists=bracers_of_darkened_skies,id=119332,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=soul_priests_leggings,id=115564,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant=gift_of_mastery
finger2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_mastery
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=infernoflame_staff,id=113869,bonus_id=567,enchant=mark_of_bleeding_hollow

# Gear Summary
# gear_ilvl=701.00
# gear_stamina=4763
# gear_intellect=3923
# gear_spell_power=1837
# gear_crit_rating=518
# gear_haste_rating=1307
# gear_mastery_rating=2038
# gear_armor=900
# gear_multistrike_rating=468
# gear_versatility_rating=108
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Priest_Shadow_T17M_VE.simc"] = [[
priest="Priest_Shadow_T17M_VE"
level=100
race=troll
role=spell
position=back
talents=1123232
glyphs=mind_flay/fade/sha
spec=shadow

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=buttered_sturgeon
actions.precombat+=/power_word_fortitude,if=!aura.stamina.up
actions.precombat+=/shadowform,if=!buff.shadowform.up
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/vampiric_touch

# Executed every time the actor is available.

actions=shadowform,if=!buff.shadowform.up
actions+=/potion,name=draenic_intellect,if=buff.bloodlust.react|target.time_to_die<=40
actions+=/power_infusion,if=talent.power_infusion.enabled
actions+=/silence,if=target.debuff.casting.react
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent
actions+=/call_action_list,name=pvp_dispersion,if=set_bonus.pvp_2pc
actions+=/call_action_list,name=decision

actions.decision=call_action_list,name=main,if=(!talent.clarity_of_power.enabled&!talent.void_entropy.enabled)|(talent.clarity_of_power.enabled&buff.bloodlust.up&buff.power_infusion.up)
actions.decision+=/call_action_list,name=vent,if=talent.void_entropy.enabled&!talent.clarity_of_power.enabled&!talent.auspicious_spirits.enabled
actions.decision+=/call_action_list,name=cop,if=talent.clarity_of_power.enabled&!talent.insanity.enabled
actions.decision+=/call_action_list,name=cop_dotweave,if=talent.clarity_of_power.enabled&talent.insanity.enabled&target.health.pct>20&active_enemies<=6
actions.decision+=/call_action_list,name=cop_insanity,if=talent.clarity_of_power.enabled&talent.insanity.enabled

actions.pvp_dispersion=call_action_list,name=decision,if=cooldown.dispersion.remains>0
actions.pvp_dispersion+=/dispersion,interrupt=1
actions.pvp_dispersion+=/call_action_list,name=decision

actions.main=mindbender,if=talent.mindbender.enabled
actions.main+=/shadowfiend,if=!talent.mindbender.enabled
actions.main+=/shadow_word_death,if=natural_shadow_word_death_range&shadow_orb<=4,cycle_targets=1
actions.main+=/mind_blast,if=glyph.mind_harvest.enabled&shadow_orb<=2&active_enemies<=5&cooldown_react
actions.main+=/devouring_plague,if=shadow_orb=5&!target.dot.devouring_plague_dot.ticking&(talent.surge_of_darkness.enabled|set_bonus.tier17_4pc),cycle_targets=1
actions.main+=/devouring_plague,if=shadow_orb=5
actions.main+=/devouring_plague,if=shadow_orb>=3&talent.auspicious_spirits.enabled&shadowy_apparitions_in_flight>=3
actions.main+=/devouring_plague,if=shadow_orb>=4&talent.auspicious_spirits.enabled&shadowy_apparitions_in_flight>=2
actions.main+=/devouring_plague,if=shadow_orb>=3&buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.main+=/devouring_plague,if=shadow_orb>=4&talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd))&!target.dot.devouring_plague_tick.ticking&talent.surge_of_darkness.enabled,cycle_targets=1
actions.main+=/devouring_plague,if=shadow_orb>=4&talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(target.health.pct<20&cooldown.shadow_word_death.remains<gcd))
actions.main+=/devouring_plague,if=shadow_orb>=3&!talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd))&!target.dot.devouring_plague_tick.ticking&talent.surge_of_darkness.enabled,cycle_targets=1
actions.main+=/devouring_plague,if=shadow_orb>=3&!talent.auspicious_spirits.enabled&((cooldown.mind_blast.remains<gcd&!set_bonus.tier17_2pc&(!set_bonus.tier18_4pc&!talent.mindbender.enabled))|(target.health.pct<20&cooldown.shadow_word_death.remains<gcd))
actions.main+=/devouring_plague,if=shadow_orb>=3&talent.auspicious_spirits.enabled&set_bonus.tier18_4pc&talent.mindbender.enabled&buff.premonition.up
actions.main+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0,cycle_targets=1
actions.main+=/mind_blast,if=talent.auspicious_spirits.enabled&active_enemies<=4&cooldown_react
actions.main+=/shadow_word_pain,if=talent.auspicious_spirits.enabled&remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react,cycle_targets=1,max_cycle_targets=7
actions.main+=/mind_blast,if=cooldown_react
actions.main+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.main+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.main+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.main+=/searing_insanity,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.main+=/insanity,if=buff.insanity.remains<0.5*gcd&active_enemies<=2,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/insanity,chain=1,if=active_enemies<=2,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/halo,if=talent.halo.enabled&target.distance<=30&active_enemies>2
actions.main+=/cascade,if=talent.cascade.enabled&active_enemies>2&target.distance<=40
actions.main+=/divine_star,if=talent.divine_star.enabled&active_enemies>4&target.distance<=24
actions.main+=/shadow_word_pain,if=!talent.auspicious_spirits.enabled&remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react&active_enemies<=5,cycle_targets=1,max_cycle_targets=5
actions.main+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react&active_enemies<=5,cycle_targets=1,max_cycle_targets=5
actions.main+=/devouring_plague,if=!talent.void_entropy.enabled&shadow_orb>=3&ticks_remain<=1
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.main+=/mind_spike,if=active_enemies<=5&buff.surge_of_darkness.react=3
actions.main+=/halo,if=talent.halo.enabled&target.distance<=30&target.distance>=17
actions.main+=/cascade,if=talent.cascade.enabled&(active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11
actions.main+=/divine_star,if=talent.divine_star.enabled&(active_enemies>1&target.distance<=24)
actions.main+=/wait,sec=cooldown.shadow_word_death.remains,if=natural_shadow_word_death_range&cooldown.shadow_word_death.remains<0.5&active_enemies<=1,cycle_targets=1
actions.main+=/wait,sec=cooldown.mind_blast.remains,if=cooldown.mind_blast.remains<0.5&cooldown.mind_blast.remains&active_enemies<=1
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&!set_bonus.tier18_4pc
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains<23
actions.main+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains>38&buff.surge_of_darkness.remains<(1.1*gcd*buff.surge_of_darkness.react)
actions.main+=/divine_star,if=talent.divine_star.enabled&target.distance<=28&active_enemies>1
actions.main+=/mind_sear,chain=1,if=active_enemies>=4,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/shadow_word_pain,if=talent.auspicious_spirits.enabled&remains<(18*0.9)&target.time_to_die>(18*0.75)&active_enemies>=3&miss_react,cycle_targets=1,max_cycle_targets=7
actions.main+=/shadow_word_pain,if=shadow_orb>=2&ticks_remain<=3&target.time_to_die>(18*0.75)&talent.insanity.enabled
actions.main+=/vampiric_touch,if=shadow_orb>=2&ticks_remain<=3.5&target.time_to_die>(15*0.75+cast_time)&talent.insanity.enabled
actions.main+=/mind_flay,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1|shadow_orb=5)
actions.main+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.main+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.main+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.main+=/divine_star,moving=1,if=talent.divine_star.enabled&target.distance<=28
actions.main+=/cascade,moving=1,if=talent.cascade.enabled&target.distance<=40
actions.main+=/shadow_word_pain,moving=1,cycle_targets=1

actions.vent=mindbender,if=set_bonus.tier18_2pc&talent.mindbender.enabled
actions.vent+=/shadowfiend,if=set_bonus.tier18_2pc&!talent.mindbender.enabled
actions.vent+=/void_entropy,if=shadow_orb=3&!ticking&target.time_to_die>60&active_enemies=1
actions.vent+=/void_entropy,if=!dot.void_entropy.ticking&shadow_orb=5&active_enemies>=1&target.time_to_die>60,cycle_targets=1,max_cycle_targets=6
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.ticking&dot.void_entropy.remains<=gcd*2&cooldown_react&active_enemies=1
actions.vent+=/devouring_plague,if=dot.void_entropy.ticking&dot.void_entropy.remains<=gcd*2&cooldown_react&active_enemies>1,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<5&active_enemies>1,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<10&active_enemies>2,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<15&active_enemies>3,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&dot.void_entropy.remains<20&active_enemies>4,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb=5&(dot.void_entropy.remains|target.time_to_die<=60)&(cooldown.mind_blast.remains<=gcd*2|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<=gcd*2))&active_enemies=1
actions.vent+=/devouring_plague,if=shadow_orb=5&(dot.void_entropy.remains|target.time_to_die<=60)&(cooldown.mind_blast.remains<=gcd*2|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<=gcd*2))&active_enemies>1,cycle_targets=1
actions.vent+=/devouring_plague,if=shadow_orb>=3&dot.void_entropy.ticking&active_enemies=1&buff.mental_instinct.remains<(gcd*1.4)&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.vent+=/devouring_plague,if=shadow_orb>=3&target.time_to_die<=gcd*4&active_enemies=1
actions.vent+=/mindbender,if=!set_bonus.tier18_2pc&talent.mindbender.enabled&cooldown.mind_blast.remains>=gcd
actions.vent+=/shadowfiend,if=!set_bonus.tier18_2pc&!talent.mindbender.enabled&cooldown.mind_blast.remains>=gcd
actions.vent+=/halo,if=talent.halo.enabled&target.distance<=30&active_enemies>=4
actions.vent+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0&shadow_orb<=2,cycle_targets=1
actions.vent+=/devouring_plague,if=glyph.mind_harvest.enabled&mind_harvest=0&shadow_orb>=3,cycle_targets=1
actions.vent+=/mind_blast,if=active_enemies<=10&cooldown_react&shadow_orb<=4
actions.vent+=/shadow_word_death,if=natural_shadow_word_death_range&cooldown_react&shadow_orb<=4,cycle_targets=1
actions.vent+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.vent+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.vent+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/searing_insanity,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/shadow_word_pain,if=shadow_orb=4&remains<(18*0.50)&set_bonus.tier17_2pc&cooldown.mind_blast.remains<1.2*gcd&cooldown.mind_blast.remains>0.2*gcd
actions.vent+=/insanity,if=buff.insanity.remains<0.5*gcd&active_enemies<=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/insanity,chain=1,if=active_enemies<=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.vent+=/mind_spike,if=active_enemies<=5&buff.surge_of_darkness.react=3
actions.vent+=/shadow_word_pain,if=remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react,cycle_targets=1,max_cycle_targets=5
actions.vent+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react,cycle_targets=1,max_cycle_targets=5
actions.vent+=/halo,if=talent.halo.enabled&target.distance<=30&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/cascade,if=talent.cascade.enabled&target.distance<=40&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/divine_star,if=talent.divine_star.enabled&active_enemies>4&target.distance<=24&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&!set_bonus.tier18_4pc
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&buff.premonition.up
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains<23
actions.vent+=/mind_spike,if=buff.surge_of_darkness.react&active_enemies<=5&set_bonus.tier18_4pc&cooldown.shadowfiend.remains>38&buff.surge_of_darkness.remains<(1.1*gcd*buff.surge_of_darkness.react)
actions.vent+=/mind_spike,if=active_enemies<=5&buff.surge_of_darkness.react&cooldown.mind_blast.remains>0.5*gcd
actions.vent+=/mind_sear,chain=1,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.vent+=/mind_flay,if=cooldown.mind_blast.remains>0.5*gcd,interrupt=1,chain=1
actions.vent+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.vent+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.vent+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.vent+=/divine_star,moving=1,if=talent.divine_star.enabled&target.distance<=28
actions.vent+=/cascade,moving=1,if=talent.cascade.enabled&target.distance<=40
actions.vent+=/shadow_word_pain,moving=1,cycle_targets=1

actions.cop_dotweave=devouring_plague,if=target.dot.vampiric_touch.ticking&target.dot.shadow_word_pain.ticking&shadow_orb=5&cooldown_react
actions.cop_dotweave+=/devouring_plague,if=buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.cop_dotweave+=/devouring_plague,if=(target.dot.vampiric_touch.ticking&target.dot.shadow_word_pain.ticking&!buff.insanity.remains&cooldown.mind_blast.remains>0.4*gcd)
actions.cop_dotweave+=/shadow_word_death,if=natural_shadow_word_death_range&!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_dotweave+=/shadow_word_death,if=natural_shadow_word_death_range,cycle_targets=1
actions.cop_dotweave+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0&shadow_orb<=2,cycle_targets=1
actions.cop_dotweave+=/mind_blast,if=shadow_orb<=4&cooldown_react
actions.cop_dotweave+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_dotweave+=/searing_insanity,if=active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_dotweave+=/shadowfiend,if=!talent.mindbender.enabled&!buff.insanity.remains
actions.cop_dotweave+=/mindbender,if=talent.mindbender.enabled&!buff.insanity.remains
actions.cop_dotweave+=/shadow_word_pain,if=shadow_orb=4&set_bonus.tier17_2pc&!target.dot.shadow_word_pain.ticking&!target.dot.devouring_plague.ticking&cooldown.mind_blast.remains<gcd&cooldown.mind_blast.remains>0
actions.cop_dotweave+=/shadow_word_pain,if=shadow_orb=5&!target.dot.devouring_plague.ticking&!target.dot.shadow_word_pain.ticking
actions.cop_dotweave+=/vampiric_touch,if=shadow_orb=5&!target.dot.devouring_plague.ticking&!target.dot.vampiric_touch.ticking
actions.cop_dotweave+=/insanity,if=buff.insanity.remains,chain=1,interrupt_if=cooldown.mind_blast.remains<=0.1
actions.cop_dotweave+=/shadow_word_pain,if=shadow_orb>=2&target.dot.shadow_word_pain.remains>=6&cooldown.mind_blast.remains>0.5*gcd&target.dot.vampiric_touch.remains&buff.bloodlust.up&!set_bonus.tier17_2pc
actions.cop_dotweave+=/vampiric_touch,if=shadow_orb>=2&target.dot.vampiric_touch.remains>=5&cooldown.mind_blast.remains>0.5*gcd&buff.bloodlust.up&!set_bonus.tier17_2pc
actions.cop_dotweave+=/halo,if=cooldown.mind_blast.remains>0.5*gcd&talent.halo.enabled&target.distance<=30&target.distance>=17
actions.cop_dotweave+=/cascade,if=cooldown.mind_blast.remains>0.5*gcd&talent.cascade.enabled&((active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11)
actions.cop_dotweave+=/divine_star,if=talent.divine_star.enabled&cooldown.mind_blast.remains>0.5*gcd&active_enemies>3&target.distance<=24
actions.cop_dotweave+=/shadow_word_pain,if=primary_target=0&!ticking,cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/vampiric_touch,if=primary_target=0&!ticking,cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/divine_star,if=talent.divine_star.enabled&cooldown.mind_blast.remains>0.5*gcd&active_enemies=3&target.distance<=24
actions.cop_dotweave+=/shadow_word_pain,if=primary_target=0&(!ticking|remains<=18*0.3)&target.time_to_die>(18*0.75),cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/vampiric_touch,if=primary_target=0&(!ticking|remains<=15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time),cycle_targets=1,max_cycle_targets=5
actions.cop_dotweave+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_dotweave+=/mind_sear,if=active_enemies>=8,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_dotweave+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_dotweave+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.stack<10
actions.cop_dotweave+=/mind_spike
actions.cop_dotweave+=/shadow_word_death,moving=1,if=!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_dotweave+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.cop_dotweave+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.cop_dotweave+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.cop_dotweave+=/divine_star,if=talent.divine_star.enabled&target.distance<=28,moving=1
actions.cop_dotweave+=/cascade,if=talent.cascade.enabled&target.distance<=40,moving=1
actions.cop_dotweave+=/devouring_plague,moving=1
actions.cop_dotweave+=/shadow_word_pain,if=primary_target=0,moving=1,cycle_targets=1

actions.cop_insanity=devouring_plague,if=shadow_orb=5|(active_enemies>=5&!buff.insanity.remains)
actions.cop_insanity+=/devouring_plague,if=buff.mental_instinct.remains<(gcd*1.7)&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains
actions.cop_insanity+=/mind_blast,if=glyph.mind_harvest.enabled&mind_harvest=0,cycle_targets=1
actions.cop_insanity+=/mind_blast,if=active_enemies<=5&cooldown_react
actions.cop_insanity+=/shadow_word_death,if=natural_shadow_word_death_range&!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_insanity+=/shadow_word_death,if=natural_shadow_word_death_range,cycle_targets=1
actions.cop_insanity+=/insanity,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_insanity+=/devouring_plague,if=shadow_orb>=3&!set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<gcd|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd)),cycle_targets=1
actions.cop_insanity+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=2|(natural_shadow_word_death_range&cooldown.shadow_word_death.remains<gcd)),cycle_targets=1
actions.cop_insanity+=/searing_insanity,if=buff.insanity.remains<0.5*gcd&active_enemies>=3&cooldown.mind_blast.remains>0.5*gcd,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_insanity+=/searing_insanity,if=active_enemies>=5,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_insanity+=/mindbender,if=talent.mindbender.enabled
actions.cop_insanity+=/shadowfiend,if=!talent.mindbender.enabled
actions.cop_insanity+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_insanity+=/shadow_word_pain,if=remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop_insanity+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop_insanity+=/insanity,if=buff.insanity.remains<0.5*gcd&active_enemies<=2,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|(cooldown.shadow_word_death.remains<=0.1&target.health.pct<20))
actions.cop_insanity+=/insanity,if=active_enemies<=2,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|(cooldown.shadow_word_death.remains<=0.1&target.health.pct<20))
actions.cop_insanity+=/halo,if=talent.halo.enabled&target.distance<=30&target.distance>=17
actions.cop_insanity+=/cascade,if=talent.cascade.enabled&((active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11)
actions.cop_insanity+=/divine_star,if=talent.divine_star.enabled&active_enemies>2&target.distance<=24
actions.cop_insanity+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd,interrupt_if=target.debuff.mental_fatigue.remains>gcd
actions.cop_insanity+=/mind_sear,if=active_enemies>=8,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop_insanity+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.stack<10
actions.cop_insanity+=/mind_spike
actions.cop_insanity+=/shadow_word_death,moving=1,if=!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop_insanity+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.cop_insanity+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.cop_insanity+=/halo,if=talent.halo.enabled&target.distance<=30,moving=1
actions.cop_insanity+=/divine_star,if=talent.divine_star.enabled&target.distance<=28,moving=1
actions.cop_insanity+=/cascade,if=talent.cascade.enabled&target.distance<=40,moving=1
actions.cop_insanity+=/devouring_plague,moving=1
actions.cop_insanity+=/shadow_word_pain,if=primary_target=0,moving=1,cycle_targets=1

actions.cop=devouring_plague,if=shadow_orb=5&primary_target=0&!target.dot.devouring_plague_dot.ticking&target.time_to_die>=(gcd*4*7%6),cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb=5&primary_target=0&target.time_to_die>=(gcd*4*7%6)&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20)),cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb=5&!set_bonus.tier17_2pc&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))
actions.cop+=/devouring_plague,if=shadow_orb=5&set_bonus.tier17_2pc&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))
actions.cop+=/devouring_plague,if=primary_target=0&buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains&active_enemies>1,cycle_targets=1
actions.cop+=/devouring_plague,if=buff.mental_instinct.remains<gcd&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains&active_enemies>1
actions.cop+=/devouring_plague,if=shadow_orb>=3&!set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6),cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&!set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6)&active_enemies>1,cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&!set_bonus.tier17_4pc&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&active_enemies>1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&talent.mindbender.enabled&!target.dot.devouring_plague_dot.ticking&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6)&active_enemies=1,cycle_targets=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&talent.mindbender.enabled&!target.dot.devouring_plague_dot.ticking&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&active_enemies=1
actions.cop+=/devouring_plague,if=shadow_orb>=3&set_bonus.tier17_2pc&talent.surge_of_darkness.enabled&buff.mental_instinct.remains<(gcd*1.4)&buff.mental_instinct.remains>(gcd*0.7)&buff.mental_instinct.remains&(cooldown.mind_blast.remains<=gcd*2|(cooldown.shadow_word_death.remains<=gcd&target.health.pct<20))&primary_target=0&target.time_to_die>=(gcd*4*7%6)&active_enemies=1,cycle_targets=1
actions.cop+=/mind_blast,if=mind_harvest=0,cycle_targets=1
actions.cop+=/mind_blast,if=cooldown_react
actions.cop+=/shadow_word_death,if=natural_shadow_word_death_range&!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop+=/shadow_word_death,if=natural_shadow_word_death_range,cycle_targets=1
actions.cop+=/mindbender,if=talent.mindbender.enabled
actions.cop+=/shadowfiend,if=!talent.mindbender.enabled
actions.cop+=/halo,if=talent.halo.enabled&target.distance<=30&target.distance>=17
actions.cop+=/cascade,if=talent.cascade.enabled&(active_enemies>1|target.distance>=28)&target.distance<=40&target.distance>=11
actions.cop+=/divine_star,if=talent.divine_star.enabled&active_enemies>3&target.distance<=24
actions.cop+=/shadow_word_pain,if=remains<(18*0.3)&target.time_to_die>(18*0.75)&miss_react&!ticking&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop+=/vampiric_touch,if=remains<(15*0.3+cast_time)&target.time_to_die>(15*0.75+cast_time)&miss_react&active_enemies<=5&primary_target=0,cycle_targets=1,max_cycle_targets=5
actions.cop+=/divine_star,if=talent.divine_star.enabled&active_enemies=3&target.distance<=24
actions.cop+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.remains<gcd
actions.cop+=/mind_spike,if=active_enemies<=4&buff.surge_of_darkness.react
actions.cop+=/mind_sear,if=active_enemies>=8,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop+=/mind_spike,if=target.dot.devouring_plague_tick.remains&target.dot.devouring_plague_tick.remains<cast_time
actions.cop+=/mind_flay,if=target.dot.devouring_plague_tick.ticks_remain>1&active_enemies>1,chain=1,interrupt_if=(cooldown.mind_blast.remains<=0.1|cooldown.shadow_word_death.remains<=0.1)
actions.cop+=/mind_flay,if=t18_class_trinket&target.debuff.mental_fatigue.stack<10
actions.cop+=/mind_spike
actions.cop+=/shadow_word_death,moving=1,if=!target.dot.shadow_word_pain.ticking&!target.dot.vampiric_touch.ticking,cycle_targets=1
actions.cop+=/shadow_word_death,moving=1,if=movement.remains>=1*gcd
actions.cop+=/power_word_shield,moving=1,if=talent.body_and_soul.enabled&movement.distance>=25
actions.cop+=/halo,moving=1,if=talent.halo.enabled&target.distance<=30
actions.cop+=/divine_star,if=talent.divine_star.enabled&target.distance<=28,moving=1
actions.cop+=/cascade,if=talent.cascade.enabled&target.distance<=40,moving=1
actions.cop+=/devouring_plague,moving=1

head=soul_priests_hood,id=115563,bonus_id=567
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_haste
shoulders=soul_priests_shoulderguards,id=115561,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_haste
chest=eyecatching_gilded_robe,id=113898,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=soul_priests_gloves,id=115562,bonus_id=567
waist=deckhands_rope_belt,id=113967,bonus_id=567
legs=soul_priests_leggings,id=115564,bonus_id=567
feet=inferno_breath_sandals,id=113942,bonus_id=567
finger1=epicenter_loop,id=113947,bonus_id=567,enchant=gift_of_haste
finger2=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_haste
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=franzoks_headsmasher,id=113904,bonus_id=567,enchant=mark_of_warsong
off_hand=enginestokers_lantern,id=113960,bonus_id=567

# Gear Summary
# gear_ilvl=700.94
# gear_stamina=4759
# gear_intellect=3919
# gear_spell_power=1834
# gear_crit_rating=1049
# gear_haste_rating=1602
# gear_mastery_rating=370
# gear_armor=900
# gear_multistrike_rating=1043
# gear_versatility_rating=338
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Priest_T17M.simc"] = [[

optimal_raid=1

Priest_Shadow_T17M_COP.simc
Priest_Shadow_T17M_VE.simc
Priest_Shadow_T17M_AS.simc]]

private.apls["Raid_DPS_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

optimal_raid=1
# Raid Tier17M

Death_Knight_Frost_1h_T17M.simc
Death_Knight_Frost_2h_T17M.simc
Death_Knight_Unholy_T17M.simc

Druid_Feral_T17M.simc
Druid_Balance_T17M.simc

Hunter_BM_T17M.simc
Hunter_MM_T17M.simc
Hunter_SV_T17M.simc

Mage_Arcane_T17M.simc
Mage_Fire_T17M.simc
Mage_Frost_T17M.simc

Monk_Windwalker_1h_T17M.simc
Monk_Windwalker_2h_T17M.simc

Paladin_Retribution_T17M.simc

Priest_Shadow_T17M_COP.simc
Priest_Shadow_T17M_VE.simc
Priest_Shadow_T17M_AS.simc

Rogue_Assassination_T17M.simc
Rogue_Combat_T17M.simc
Rogue_Subtlety_T17M.simc

Shaman_Elemental_T17M.simc
Shaman_Enhancement_T17M.simc

Warlock_Affliction_T17M.simc
Warlock_Destruction_T17M.simc
Warlock_Demonology_T17M.simc

Warrior_Arms_T17M.simc
Warrior_Fury_1h_T17M.simc
Warrior_Fury_2h_T17M.simc
Warrior_Gladiator_T17M.simc
]]

private.apls["Raid_T17M.simc"] = [[
# TxM
# Tier x Mythic
# * Ilvl Cap: 700
# * No Random Gems (ie. Bonus RNG Gem Slots)
# * No Tertiary Stats
# * No Ranked Gear (ie. Thunderforged/Warforged)
# * No Legendaries
# * If Bonus Bosses are accessible in this raid tier, use it. (ie. Sinestra/Ra'den)
# * EXCEPTION: 715 Legendary Ring can be used. (accessibility)

optimal_raid=1
tmi_boss=TMI_Standard_Boss_T17M
# Raid Tier17M

Death_Knight_Frost_1h_T17M.simc
Death_Knight_Frost_2h_T17M.simc
Death_Knight_Unholy_T17M.simc
Death_Knight_Blood_T17M.simc
Death_Knight_Blood_T17M_BoS.simc

Druid_Feral_T17M.simc
Druid_Balance_T17M.simc
Druid_Guardian_T17M.simc

Hunter_BM_T17M.simc
Hunter_MM_T17M.simc
Hunter_SV_T17M.simc

Mage_Arcane_T17M.simc
Mage_Fire_T17M.simc
Mage_Frost_T17M.simc

Monk_Brewmaster_1h_Serenity_T17M.simc
Monk_Brewmaster_2h_Serenity_T17M.simc
Monk_Windwalker_1h_T17M.simc
Monk_Windwalker_2h_T17M.simc

Paladin_Protection_T17M.simc
Paladin_Retribution_T17M.simc

#Priest_Discipline_T17M_Heal.simc
#Priest_Discipline_T17M_Dmg.simc
#Priest_Holy_T17M_Heal.simc
#Priest_Holy_T17M_Dmg.simc
Priest_Shadow_T17M_COP.simc
Priest_Shadow_T17M_VE.simc
Priest_Shadow_T17M_AS.simc

Rogue_Assassination_T17M.simc
Rogue_Combat_T17M.simc
Rogue_Subtlety_T17M.simc

Shaman_Elemental_T17M.simc
Shaman_Enhancement_T17M.simc

Warlock_Affliction_T17M.simc
Warlock_Destruction_T17M.simc
Warlock_Demonology_T17M.simc

Warrior_Arms_T17M.simc
Warrior_Fury_1h_T17M.simc
Warrior_Fury_2h_T17M.simc
Warrior_Protection_T17M.simc
Warrior_Gladiator_T17M.simc
]]

private.apls["Raid_T17M_AOE.simc"] = [[
optimal_raid=1
override.bloodlust=0
enemy=fluffy_pillow
# Raid Tier17N

Death_Knight_Frost_1h_T17M.simc
Death_Knight_Frost_2h_T17M.simc
Death_Knight_Unholy_T17M.simc
Death_Knight_Blood_T17M.simc
Death_Knight_Blood_T17M_BoS.simc


Druid_Feral_T17M.simc
Druid_Balance_T17M.simc
talents=0002002
Druid_Guardian_T17M.simc

Hunter_BM_T17M.simc
talents=0003233
Hunter_MM_T17M.simc
talents=0003231
Hunter_SV_T17M.simc
talents=0003231

Mage_Arcane_T17M.simc
talents=1000123
Mage_Fire_T17M.simc
talents=1000121
Mage_Frost_T17M.simc
talents=1000121

Monk_Brewmaster_1h_CE_T17M.simc
talents=0230122
Monk_Brewmaster_2h_CE_T17M.simc
talents=0230122
Monk_Windwalker_1h_T17M.simc
talents=0320012
Monk_Windwalker_2h_T17M.simc
talents=0320012

Paladin_Protection_T17M.simc
Paladin_Retribution_T17M.simc
talents=2000323
#Paladin_Holy_T17M.simc

#Priest_Discipline_T17M_Heal.simc
#Priest_Holy_T17M_Heal.simc
#Priest_Holy_T17M_Dmg.simc
#Priest_Discipline_T17M_Dmg.simc
Priest_Shadow_T17M_COP.simc
talents=0030131
Priest_Shadow_T17M_VE.simc
talents=0030132
Priest_Shadow_T17M_AS.simc
talents=0030133

Rogue_Assassination_T17M.simc
Rogue_Combat_T17M.simc
Rogue_Subtlety_T17M.simc
talent_override=anticipation

Shaman_Elemental_T17M.simc
talents=0003013
Shaman_Enhancement_T17M.simc
talents=0003013

Warlock_Affliction_T17M.simc
Warlock_Destruction_T17M.simc
talent_override=cataclysm
Warlock_Demonology_T17M.simc

Warrior_Arms_T17M.simc
talent_override=taste_for_blood
talent_override=bladestorm
talent_override=ravager
Warrior_Fury_1h_T17M.simc
talent_override=bladestorm
talent_override=ravager
Warrior_Fury_2h_T17M.simc
talent_override=bladestorm
talent_override=ravager
Warrior_Protection_T17M.simc
Warrior_Gladiator_T17M.simc
talent_override=bladestorm
]]

private.apls["Raid_T17M_Waves.simc"] = [[
optimal_raid=1
override.bloodlust=0
enemy=fluffy_pillow
# Raid Tier17N

Death_Knight_Frost_1h_T17M.simc
Death_Knight_Frost_2h_T17M.simc
Death_Knight_Unholy_T17M.simc
Death_Knight_Blood_T17M.simc
Death_Knight_Blood_T17M_BoS.simc

Druid_Feral_T17M.simc
Druid_Balance_T17M.simc
talents=0002002
Druid_Guardian_T17M.simc

Hunter_BM_T17M.simc
talents=0003233
Hunter_MM_T17M.simc
talents=0003231
Hunter_SV_T17M.simc
talents=0003231

Mage_Arcane_T17M.simc
talents=1000123
Mage_Fire_T17M.simc
talents=1000121
Mage_Frost_T17M.simc
talents=1000121

Monk_Brewmaster_1h_CE_T17M.simc
talents=0230122
Monk_Brewmaster_2h_CE_T17M.simc
talents=0230122
Monk_Windwalker_1h_T17M.simc
talents=0320012
Monk_Windwalker_2h_T17M.simc
talents=0320012

Paladin_Protection_T17M.simc
Paladin_Retribution_T17M.simc
talents=2000323
#Paladin_Holy_T17M.simc

#Priest_Discipline_T17M_Heal.simc
#Priest_Holy_T17M_Heal.simc
#Priest_Holy_T17M_Dmg.simc
#Priest_Discipline_T17M_Dmg.simc
Priest_Shadow_T17M_COP.simc
talents=0030131
Priest_Shadow_T17M_VE.simc
talents=0030132
Priest_Shadow_T17M_AS.simc
talents=0030133

Rogue_Assassination_T17M.simc
Rogue_Combat_T17M.simc
Rogue_Subtlety_T17M.simc
talent_override=anticipation

Shaman_Elemental_T17M.simc
talents=0003013
Shaman_Enhancement_T17M.simc
talents=0003013

Warlock_Affliction_T17M.simc
Warlock_Destruction_T17M.simc
talent_override=cataclysm
Warlock_Demonology_T17M.simc

Warrior_Arms_T17M.simc
talent_override=taste_for_blood
talent_override=bladestorm
talent_override=anger_management
Warrior_Fury_1h_T17M.simc
talent_override=bladestorm
talent_override=anger_management
Warrior_Fury_2h_T17M.simc
talent_override=bladestorm
talent_override=anger_management
Warrior_Protection_T17M.simc
Warrior_Gladiator_T17M.simc
talent_override=bladestorm
]]

private.apls["Rogue_Assassination_T17M.simc"] = [[
rogue="Rogue_Assassination_T17M"
level=100
race=blood_elf
role=attack
position=back
talents=3000032
glyphs=vendetta/energy/disappearance
spec=assassination

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/apply_poison,lethal=deadly
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_agility
actions.precombat+=/stealth
actions.precombat+=/marked_for_death
actions.precombat+=/slice_and_dice,if=talent.marked_for_death.enabled

# Executed every time the actor is available.

actions=potion,name=draenic_agility,if=buff.bloodlust.react|target.time_to_die<40|debuff.vendetta.up
actions+=/kick
actions+=/preparation,if=!buff.vanish.up&cooldown.vanish.remains>60
actions+=/use_item,slot=trinket2,if=active_enemies>1|(debuff.vendetta.up&active_enemies=1)
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent,if=energy<60
actions+=/vanish,if=time>10&!buff.stealth.up
actions+=/rupture,if=combo_points=5&ticks_remain<3
actions+=/rupture,cycle_targets=1,if=active_enemies>1&!ticking&combo_points=5
actions+=/mutilate,if=buff.stealth.up
actions+=/slice_and_dice,if=buff.slice_and_dice.remains<5
actions+=/marked_for_death,if=combo_points=0
actions+=/crimson_tempest,if=combo_points>4&active_enemies>=4&remains<8
actions+=/fan_of_knives,if=(combo_points<5|(talent.anticipation.enabled&anticipation_charges<4))&active_enemies>=4
actions+=/rupture,if=(remains<2|(combo_points=5&remains<=(duration*0.3)))&active_enemies=1
actions+=/shadow_reflection,if=combo_points>4
actions+=/vendetta,if=buff.shadow_reflection.up|!talent.shadow_reflection.enabled
actions+=/death_from_above,if=combo_points>4
actions+=/envenom,cycle_targets=1,if=(combo_points>4&(cooldown.death_from_above.remains>2|!talent.death_from_above.enabled))&active_enemies<4&!dot.deadly_poison_dot.ticking
actions+=/envenom,if=(combo_points>4&(cooldown.death_from_above.remains>2|!talent.death_from_above.enabled))&active_enemies<4&(buff.envenom.remains<=1.8|energy>55)
actions+=/fan_of_knives,cycle_targets=1,if=active_enemies>2&!dot.deadly_poison_dot.ticking&debuff.vendetta.down
actions+=/dispatch,cycle_targets=1,if=(combo_points<5|(talent.anticipation.enabled&anticipation_charges<4))&active_enemies=2&!dot.deadly_poison_dot.ticking&debuff.vendetta.down
actions+=/dispatch,if=(combo_points<5|(talent.anticipation.enabled&anticipation_charges<4))&active_enemies<4
actions+=/mutilate,cycle_targets=1,if=target.health.pct>35&(combo_points<4|(talent.anticipation.enabled&anticipation_charges<3))&active_enemies=2&!dot.deadly_poison_dot.ticking&debuff.vendetta.down
actions+=/mutilate,if=target.health.pct>35&(combo_points<4|(talent.anticipation.enabled&anticipation_charges<3))&active_enemies<5
actions+=/mutilate,cycle_targets=1,if=active_enemies=2&!dot.deadly_poison_dot.ticking&debuff.vendetta.down
actions+=/mutilate,if=active_enemies<5

head=poisoners_helmet,id=115572,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant=gift_of_mastery
shoulders=poisoners_spaulders,id=115574,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_mastery
chest=poisoners_tunic,id=115570,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=cannonball_loaders_grips,id=113949,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=poisoners_legguards,id=115573,bonus_id=567
feet=furnace_tenders_treads,id=113895,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_mastery
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_mastery
trinket1=humming_blackiron_trigger,id=113985,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
main_hand=oregorgers_acidetched_gutripper,id=113874,bonus_id=567,enchant=mark_of_the_thunderlord
off_hand=oregorgers_acidetched_gutripper,id=113874,bonus_id=567,enchant=mark_of_the_thunderlord

# Gear Summary
# gear_ilvl=700.94
# gear_agility=3964
# gear_stamina=4694
# gear_crit_rating=1404
# gear_haste_rating=428
# gear_mastery_rating=1126
# gear_armor=1177
# gear_multistrike_rating=1328
# gear_versatility_rating=128
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Rogue_Combat_T17M.simc"] = [[
rogue="Rogue_Combat_T17M"
level=100
race=blood_elf
role=attack
position=back
talents=3000031
glyphs=energy/disappearance
spec=combat

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=buttered_sturgeon
actions.precombat+=/apply_poison,lethal=deadly
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_agility
actions.precombat+=/stealth
actions.precombat+=/marked_for_death
actions.precombat+=/slice_and_dice,if=talent.marked_for_death.enabled

# Executed every time the actor is available.

actions=potion,name=draenic_agility,if=buff.bloodlust.react|target.time_to_die<40|(buff.adrenaline_rush.up&(trinket.proc.any.react|trinket.stacking_proc.any.react|buff.archmages_greater_incandescence_agi.react))
actions+=/kick
actions+=/preparation,if=!buff.vanish.up&cooldown.vanish.remains>30
actions+=/use_item,slot=trinket2
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent,if=energy<60
actions+=/blade_flurry,if=(active_enemies>=2&!buff.blade_flurry.up)|(active_enemies<2&buff.blade_flurry.up)
actions+=/shadow_reflection,if=(cooldown.killing_spree.remains<10&combo_points>3)|buff.adrenaline_rush.up
actions+=/ambush
actions+=/vanish,if=time>10&(combo_points<3|(talent.anticipation.enabled&anticipation_charges<3)|(combo_points<4|(talent.anticipation.enabled&anticipation_charges<4)))&((talent.shadow_focus.enabled&buff.adrenaline_rush.down&energy<90&energy>=15)|(talent.subterfuge.enabled&energy>=90)|(!talent.shadow_focus.enabled&!talent.subterfuge.enabled&energy>=60))
actions+=/slice_and_dice,if=buff.slice_and_dice.remains<2|((target.time_to_die>45&combo_points=5&buff.slice_and_dice.remains<12)&buff.deep_insight.down)
actions+=/call_action_list,name=adrenaline_rush,if=cooldown.killing_spree.remains>10
actions+=/call_action_list,name=killing_spree,if=(energy<40|(buff.bloodlust.up&time<10)|buff.bloodlust.remains>20)&buff.adrenaline_rush.down&(!talent.shadow_reflection.enabled|cooldown.shadow_reflection.remains>30|buff.shadow_reflection.remains>3)
actions+=/marked_for_death,if=combo_points<=1&dot.revealing_strike.ticking&(!talent.shadow_reflection.enabled|buff.shadow_reflection.up|cooldown.shadow_reflection.remains>30)
actions+=/call_action_list,name=generator,if=combo_points<5|!dot.revealing_strike.ticking|(talent.anticipation.enabled&anticipation_charges<3&buff.deep_insight.down)
actions+=/call_action_list,name=finisher,if=combo_points=5&dot.revealing_strike.ticking&(buff.deep_insight.up|!talent.anticipation.enabled|(talent.anticipation.enabled&anticipation_charges>=3))

actions.adrenaline_rush=adrenaline_rush,if=target.time_to_die>=44
actions.adrenaline_rush+=/adrenaline_rush,if=target.time_to_die<44&(buff.archmages_greater_incandescence_agi.react|trinket.proc.any.react|trinket.stacking_proc.any.react)
actions.adrenaline_rush+=/adrenaline_rush,if=target.time_to_die<=buff.adrenaline_rush.duration*1.5

actions.killing_spree=killing_spree,if=target.time_to_die>=44
actions.killing_spree+=/killing_spree,if=target.time_to_die<44&buff.archmages_greater_incandescence_agi.react&buff.archmages_greater_incandescence_agi.remains>=buff.killing_spree.duration
actions.killing_spree+=/killing_spree,if=target.time_to_die<44&trinket.proc.any.react&trinket.proc.any.remains>=buff.killing_spree.duration
actions.killing_spree+=/killing_spree,if=target.time_to_die<44&trinket.stacking_proc.any.react&trinket.stacking_proc.any.remains>=buff.killing_spree.duration
actions.killing_spree+=/killing_spree,if=target.time_to_die<=buff.killing_spree.duration*1.5

# Combo point generators

actions.generator=revealing_strike,if=(combo_points=4&dot.revealing_strike.remains<7.2&(target.time_to_die>dot.revealing_strike.remains+7.2)|(target.time_to_die<dot.revealing_strike.remains+7.2&ticks_remain<2))|!ticking
actions.generator+=/sinister_strike,if=dot.revealing_strike.ticking

# Combo point finishers

actions.finisher=death_from_above
actions.finisher+=/eviscerate,if=(!talent.death_from_above.enabled|cooldown.death_from_above.remains)

head=sorkas_nightshade_cowl,id=113978,bonus_id=567
neck=darklight_necklace,id=113865,bonus_id=567,enchant=gift_of_haste
shoulders=poisoners_spaulders,id=115574,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_haste
chest=poisoners_tunic,id=115570,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=poisoners_gloves,id=115571,bonus_id=567
waist=girdle_of_unconquered_glory,id=113907,bonus_id=567
legs=poisoners_legguards,id=115573,bonus_id=567
feet=furnace_tenders_treads,id=113895,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_haste
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_haste
trinket1=meaty_dragonspine_trophy,id=118114,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
main_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_warsong
off_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_warsong

# Gear Summary
# gear_ilvl=700.94
# gear_agility=3894
# gear_stamina=4694
# gear_crit_rating=871
# gear_haste_rating=1187
# gear_mastery_rating=675
# gear_armor=1177
# gear_multistrike_rating=1534
# gear_versatility_rating=128
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Rogue_Subtlety_T17M.simc"] = [[
rogue="Rogue_Subtlety_T17M"
level=100
race=night_elf
role=attack
position=back
talents=2000022
glyphs=energy/hemorrhaging_veins/vanish
spec=subtlety

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/apply_poison,lethal=deadly
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_agility
actions.precombat+=/stealth
actions.precombat+=/marked_for_death
actions.precombat+=/premeditation,if=!talent.marked_for_death.enabled
actions.precombat+=/slice_and_dice
actions.precombat+=/premeditation
# Proxy Honor Among Thieves action. Generates Combo Points at a mean rate of 2.2 seconds. Comment out to disable (and use the real Honor Among Thieves).
actions.precombat+=/honor_among_thieves,cooldown=2.2,cooldown_stddev=0.1

# Executed every time the actor is available.

actions=potion,name=draenic_agility,if=buff.bloodlust.react|target.time_to_die<40|(buff.shadow_reflection.up|(!talent.shadow_reflection.enabled&buff.shadow_dance.up))&(trinket.stat.agi.react|trinket.stat.multistrike.react|buff.archmages_greater_incandescence_agi.react)|((buff.shadow_reflection.up|(!talent.shadow_reflection.enabled&buff.shadow_dance.up))&target.time_to_die<136)
actions+=/kick
actions+=/use_item,slot=trinket2,if=buff.shadow_dance.up
actions+=/shadow_reflection,if=buff.shadow_dance.up
actions+=/blood_fury,if=buff.shadow_dance.up
actions+=/berserking,if=buff.shadow_dance.up
actions+=/arcane_torrent,if=energy<60&buff.shadow_dance.up
actions+=/premeditation,if=combo_points<4
actions+=/pool_resource,for_next=1
actions+=/garrote,if=time<1
actions+=/wait,sec=buff.subterfuge.remains-0.1,if=buff.subterfuge.remains>0.5&buff.subterfuge.remains<1.6&time>6
actions+=/pool_resource,for_next=1,extra_amount=50
actions+=/shadow_dance,if=energy>=50&buff.stealth.down&buff.vanish.down&debuff.find_weakness.down|(buff.bloodlust.up&(dot.hemorrhage.ticking|dot.garrote.ticking|dot.rupture.ticking))
actions+=/pool_resource,for_next=1,extra_amount=50
actions+=/shadowmeld,if=talent.shadow_focus.enabled&energy>=45&energy<=75&combo_points<4-talent.anticipation.enabled&buff.stealth.down&buff.shadow_dance.down&buff.master_of_subtlety.down&debuff.find_weakness.down
actions+=/pool_resource,for_next=1,extra_amount=50
actions+=/vanish,if=talent.shadow_focus.enabled&energy>=45&energy<=75&combo_points<4-talent.anticipation.enabled&buff.shadow_dance.down&buff.master_of_subtlety.down&debuff.find_weakness.down
actions+=/pool_resource,for_next=1,extra_amount=90
actions+=/shadowmeld,if=talent.subterfuge.enabled&energy>=90&combo_points<4-talent.anticipation.enabled&buff.stealth.down&buff.shadow_dance.down&buff.master_of_subtlety.down&debuff.find_weakness.down
actions+=/pool_resource,for_next=1,extra_amount=90
actions+=/vanish,if=talent.subterfuge.enabled&energy>=90&combo_points<4-talent.anticipation.enabled&buff.shadow_dance.down&buff.master_of_subtlety.down&debuff.find_weakness.down
actions+=/marked_for_death,if=combo_points=0
actions+=/run_action_list,name=finisher,if=combo_points=5&(buff.vanish.down|!talent.shadow_focus.enabled)
actions+=/run_action_list,name=generator,if=combo_points<4|(combo_points=4&cooldown.honor_among_thieves.remains>1&energy>95-25*talent.anticipation.enabled-energy.regen)|(talent.anticipation.enabled&anticipation_charges<3&debuff.find_weakness.down)
actions+=/run_action_list,name=pool

# Combo point generators

actions.generator=run_action_list,name=pool,if=buff.master_of_subtlety.down&buff.shadow_dance.down&debuff.find_weakness.down&(energy+set_bonus.tier17_2pc*50+cooldown.shadow_dance.remains*energy.regen<=energy.max|energy+15+cooldown.vanish.remains*energy.regen<=energy.max)
actions.generator+=/pool_resource,for_next=1
actions.generator+=/ambush
# If simulating AoE, it is recommended to use Anticipation as the level 90 talent.
actions.generator+=/fan_of_knives,if=active_enemies>1
actions.generator+=/backstab,if=debuff.find_weakness.up|buff.archmages_greater_incandescence_agi.up|trinket.stat.any.up
actions.generator+=/hemorrhage,if=(remains<duration*0.3&target.time_to_die>=remains+duration+8&debuff.find_weakness.down)|!ticking|position_front
actions.generator+=/shuriken_toss,if=energy<65&energy.regen<16
actions.generator+=/backstab
actions.generator+=/run_action_list,name=pool

# Combo point finishers

actions.finisher=rupture,cycle_targets=1,if=(!ticking|remains<duration*0.3|(buff.shadow_reflection.remains>8&dot.rupture.remains<12))&target.time_to_die>=8
actions.finisher+=/slice_and_dice,if=((buff.slice_and_dice.remains<10.8&debuff.find_weakness.down)|buff.slice_and_dice.remains<6)&buff.slice_and_dice.remains<target.time_to_die
actions.finisher+=/death_from_above
actions.finisher+=/crimson_tempest,if=(active_enemies>=2&debuff.find_weakness.down)|active_enemies>=3&(cooldown.death_from_above.remains>0|!talent.death_from_above.enabled)
actions.finisher+=/eviscerate,if=(energy.time_to_max<=cooldown.death_from_above.remains+action.death_from_above.execute_time)|!talent.death_from_above.enabled
actions.finisher+=/run_action_list,name=pool

# Resource pooling

actions.pool=preparation,if=!buff.vanish.up&cooldown.vanish.remains>60

head=poisoners_helmet,id=115572,bonus_id=567
neck=engineers_grounded_gorget,id=113892,bonus_id=567,enchant=gift_of_multistrike
shoulders=poisoners_spaulders,id=115574,bonus_id=567
back=drape_of_the_dark_hunt,id=113971,bonus_id=567,enchant=gift_of_multistrike
chest=poisoners_tunic,id=115570,bonus_id=567
wrists=bracers_of_shattered_stalactites,id=113935,bonus_id=567
hands=poisoners_gloves,id=115571,bonus_id=567
waist=conductors_multipocket_girdle,id=113964,bonus_id=567
legs=shattering_smash_leggings,id=113989,bonus_id=567
feet=treads_of_the_dark_hunt,id=113974,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_multistrike
finger2=unexploded_explosive_shard,id=113877,bonus_id=567,enchant=gift_of_multistrike
trinket1=humming_blackiron_trigger,id=113985,bonus_id=567
trinket2=beating_heart_of_the_mountain,id=113931,bonus_id=567
main_hand=oregorgers_acidetched_gutripper,id=113874,bonus_id=567,enchant=mark_of_the_frostwolf
off_hand=oregorgers_acidetched_gutripper,id=113874,bonus_id=567,enchant=mark_of_the_frostwolf

# Gear Summary
# gear_ilvl=700.94
# gear_agility=3964
# gear_stamina=4694
# gear_crit_rating=913
# gear_haste_rating=355
# gear_mastery_rating=1114
# gear_armor=1177
# gear_multistrike_rating=1867
# gear_versatility_rating=128
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Shaman_Elemental_T17M.simc"] = [[
shaman="Shaman_Elemental_T17M"
level=100
race=dwarf
role=spell
position=back
professions=blacksmithing=600/engineering=600
talents=0003011
glyphs=chain_lightning
spec=elemental

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=salty_squid_roll
actions.precombat+=/lightning_shield,if=!buff.lightning_shield.up
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_intellect

# Executed every time the actor is available.

actions=wind_shear
# Bloodlust casting behavior mirrors the simulator settings for proxy bloodlust. See options 'bloodlust_percent', and 'bloodlust_time'.
actions+=/bloodlust,if=target.health.pct<25|time>0.500
# In-combat potion is preferentially linked to Ascendance, unless combat will end shortly
actions+=/potion,name=draenic_intellect,if=buff.ascendance.up|target.time_to_die<=30
actions+=/berserking,if=!buff.bloodlust.up&!buff.elemental_mastery.up&(set_bonus.tier15_4pc_caster=1|(buff.ascendance.cooldown_remains=0&(dot.flame_shock.remains>buff.ascendance.duration|level<87)))
actions+=/blood_fury,if=buff.bloodlust.up|buff.ascendance.up|((cooldown.ascendance.remains>10|level<87)&cooldown.fire_elemental_totem.remains>10)
actions+=/arcane_torrent
actions+=/elemental_mastery,if=action.lava_burst.cast_time>=1.2
actions+=/ancestral_swiftness,if=!buff.ascendance.up
actions+=/storm_elemental_totem
actions+=/fire_elemental_totem,if=!active
actions+=/ascendance,if=active_enemies>1|(dot.flame_shock.remains>buff.ascendance.duration&(target.time_to_die<20|buff.bloodlust.up|time>=60)&cooldown.lava_burst.remains>0)
actions+=/liquid_magma,if=pet.searing_totem.remains>=15|pet.fire_elemental_totem.remains>=15
# If one or two enemies, priority follows the 'single' action list.
actions+=/call_action_list,name=single,if=active_enemies<3
# On multiple enemies, the priority follows the 'aoe' action list.
actions+=/call_action_list,name=aoe,if=active_enemies>2

# Single target action priority list

actions.single=unleash_flame,moving=1
actions.single+=/spiritwalkers_grace,moving=1,if=buff.ascendance.up
actions.single+=/earth_shock,if=buff.lightning_shield.react=buff.lightning_shield.max_stack
actions.single+=/lava_burst,if=dot.flame_shock.remains>cast_time&(buff.ascendance.up|cooldown_react)
actions.single+=/earth_shock,if=(set_bonus.tier17_4pc&buff.lightning_shield.react>=12&!buff.lava_surge.up)|(!set_bonus.tier17_4pc&buff.lightning_shield.react>15)
actions.single+=/flame_shock,if=dot.flame_shock.remains<=9
actions.single+=/elemental_blast
# After the initial Ascendance, use Flame Shock pre-emptively just before Ascendance to guarantee Flame Shock staying up for the full duration of the Ascendance buff
actions.single+=/flame_shock,if=time>60&remains<=buff.ascendance.duration&cooldown.ascendance.remains+buff.ascendance.duration<duration
# Keep Searing Totem up, unless Fire Elemental Totem is coming off cooldown in the next 20 seconds
actions.single+=/searing_totem,if=(!talent.liquid_magma.enabled&(!totem.fire.active|(pet.searing_totem.remains<=10&!pet.fire_elemental_totem.active&talent.unleashed_fury.enabled)))|(talent.liquid_magma.enabled&pet.searing_totem.remains<=20&!pet.fire_elemental_totem.active&!buff.liquid_magma.up)
actions.single+=/unleash_flame,if=talent.unleashed_fury.enabled&!buff.ascendance.up
actions.single+=/spiritwalkers_grace,moving=1,if=((talent.elemental_blast.enabled&cooldown.elemental_blast.remains=0)|(cooldown.lava_burst.remains=0&!buff.lava_surge.react))
actions.single+=/lightning_bolt

# Multi target action priority list

actions.aoe=earthquake,cycle_targets=1,if=!ticking&(buff.enhanced_chain_lightning.up|level<=90)&active_enemies>=2
actions.aoe+=/lava_beam
actions.aoe+=/earth_shock,if=buff.lightning_shield.react=buff.lightning_shield.max_stack
actions.aoe+=/thunderstorm,if=active_enemies>=10
actions.aoe+=/searing_totem,if=(!talent.liquid_magma.enabled&!totem.fire.active)|(talent.liquid_magma.enabled&pet.searing_totem.remains<=20&!pet.fire_elemental_totem.active&!buff.liquid_magma.up)
actions.aoe+=/chain_lightning,if=active_enemies>=2
actions.aoe+=/lightning_bolt

head=windspeakers_faceguard,id=115579,bonus_id=567
neck=choker_of_bloody_flame,id=120077,bonus_id=567,enchant=gift_of_multistrike
shoulders=windspeakers_mantle,id=115576,bonus_id=567
back=runescribed_gronncloak,id=120078,bonus_id=567,enchant=gift_of_multistrike
chest=windspeakers_tunic,id=115577,bonus_id=567
wrists=bloodwhirl_bracers,id=113968,bonus_id=567
hands=windspeakers_handwraps,id=115578,bonus_id=567
waist=grenadiers_belt,id=113955,bonus_id=567
legs=legguards_of_the_stampede,id=113944,bonus_id=567
feet=railwalkers_ratcheted_boots,id=113954,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant=gift_of_multistrike
finger2=epicenter_loop,id=113947,bonus_id=567,enchant=gift_of_multistrike
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
main_hand=franzoks_headsmasher,id=113904,bonus_id=567,enchant=mark_of_the_frostwolf
off_hand=enginestokers_lantern,id=113960,bonus_id=567

# Gear Summary
# gear_ilvl=700.94
# gear_stamina=4759
# gear_intellect=3989
# gear_spell_power=1834
# gear_crit_rating=463
# gear_haste_rating=791
# gear_mastery_rating=1021
# gear_armor=1496
# gear_multistrike_rating=1823
# gear_versatility_rating=338
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Shaman_Enhancement_T17M.simc"] = [[
shaman="Shaman_Enhancement_T17M"
level=100
race=draenei
role=attack
position=back
professions=engineering=600/enchanting=600
talents=0003012
glyphs=chain_lightning/frost_shock
spec=enhancement

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_agility_flask
actions.precombat+=/food,type=buttered_sturgeon
actions.precombat+=/lightning_shield,if=!buff.lightning_shield.up
# Snapshot raid buffed stats before combat begins and pre-potting is done.
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_agility

# Executed every time the actor is available.

actions=wind_shear
# Bloodlust casting behavior mirrors the simulator settings for proxy bloodlust. See options 'bloodlust_percent', and 'bloodlust_time'.
actions+=/bloodlust,if=target.health.pct<25|time>0.500
actions+=/auto_attack
actions+=/use_item,name=beating_heart_of_the_mountain
# In-combat potion is preferentially linked to the Fire or Storm Elemental, depending on talents, unless combat will end shortly
actions+=/potion,name=draenic_agility,if=(talent.storm_elemental_totem.enabled&(pet.storm_elemental_totem.remains>=25|(cooldown.storm_elemental_totem.remains>target.time_to_die&pet.fire_elemental_totem.remains>=25)))|(!talent.storm_elemental_totem.enabled&pet.fire_elemental_totem.remains>=25)|target.time_to_die<=30
actions+=/blood_fury
actions+=/arcane_torrent
actions+=/berserking
actions+=/elemental_mastery
actions+=/storm_elemental_totem
actions+=/fire_elemental_totem
actions+=/feral_spirit
actions+=/liquid_magma,if=pet.searing_totem.remains>10|pet.magma_totem.remains>10|pet.fire_elemental_totem.remains>10
actions+=/ancestral_swiftness
actions+=/ascendance
# If only one enemy, priority follows the 'single' action list.
actions+=/call_action_list,name=single,if=active_enemies=1
# On multiple enemies, the priority follows the 'aoe' action list.
actions+=/call_action_list,name=aoe,if=active_enemies>1

# Single target action priority list

actions.single=searing_totem,if=!totem.fire.active
actions.single+=/unleash_elements,if=(talent.unleashed_fury.enabled|set_bonus.tier16_2pc_melee=1)
actions.single+=/elemental_blast,if=buff.maelstrom_weapon.react=5
actions.single+=/windstrike,if=!talent.echo_of_the_elements.enabled|(talent.echo_of_the_elements.enabled&(charges=2|(action.windstrike.charges_fractional>1.75)|(charges=1&buff.ascendance.remains<1.5)))
actions.single+=/lightning_bolt,if=buff.maelstrom_weapon.react=5
actions.single+=/stormstrike,if=!talent.echo_of_the_elements.enabled|(talent.echo_of_the_elements.enabled&(charges=2|(action.stormstrike.charges_fractional>1.75)|target.time_to_die<6))
actions.single+=/lava_lash,if=!talent.echo_of_the_elements.enabled|(talent.echo_of_the_elements.enabled&(charges=2|(action.lava_lash.charges_fractional>1.8)|target.time_to_die<8))
actions.single+=/flame_shock,if=(talent.elemental_fusion.enabled&buff.elemental_fusion.stack=2&buff.unleash_flame.up&dot.flame_shock.remains<16)|(!talent.elemental_fusion.enabled&buff.unleash_flame.up&dot.flame_shock.remains<=9)|!ticking
actions.single+=/unleash_elements
actions.single+=/windstrike,if=talent.echo_of_the_elements.enabled
actions.single+=/elemental_blast,if=buff.maelstrom_weapon.react>=3|buff.ancestral_swiftness.up
actions.single+=/lightning_bolt,if=(buff.maelstrom_weapon.react>=3&!buff.ascendance.up)|buff.ancestral_swiftness.up
actions.single+=/lava_lash,if=talent.echo_of_the_elements.enabled
actions.single+=/frost_shock,if=(talent.elemental_fusion.enabled&dot.flame_shock.remains>=16)|!talent.elemental_fusion.enabled
actions.single+=/elemental_blast,if=buff.maelstrom_weapon.react>=1
actions.single+=/lightning_bolt,if=talent.echo_of_the_elements.enabled&((buff.maelstrom_weapon.react>=2&!buff.ascendance.up)|buff.ancestral_swiftness.up)
actions.single+=/stormstrike,if=talent.echo_of_the_elements.enabled
actions.single+=/lightning_bolt,if=(buff.maelstrom_weapon.react>=1&!buff.ascendance.up)|buff.ancestral_swiftness.up
actions.single+=/searing_totem,if=pet.searing_totem.remains<=20&!pet.fire_elemental_totem.active&!buff.liquid_magma.up

# Multi target action priority list

actions.aoe=unleash_elements,if=active_enemies>=4&dot.flame_shock.ticking&(cooldown.shock.remains>cooldown.fire_nova.remains|cooldown.fire_nova.remains=0)
actions.aoe+=/fire_nova,if=active_dot.flame_shock>=3
actions.aoe+=/wait,sec=cooldown.fire_nova.remains,if=!talent.echo_of_the_elements.enabled&active_dot.flame_shock>=4&cooldown.fire_nova.remains<=action.fire_nova.gcd%2
actions.aoe+=/magma_totem,if=!totem.fire.active
actions.aoe+=/lava_lash,if=dot.flame_shock.ticking&active_dot.flame_shock<active_enemies
actions.aoe+=/elemental_blast,if=!buff.unleash_flame.up&(buff.maelstrom_weapon.react>=4|buff.ancestral_swiftness.up)
actions.aoe+=/chain_lightning,if=buff.maelstrom_weapon.react=5&((glyph.chain_lightning.enabled&active_enemies>=3)|(!glyph.chain_lightning.enabled&active_enemies>=2))
actions.aoe+=/unleash_elements,if=active_enemies<4
actions.aoe+=/flame_shock,if=dot.flame_shock.remains<=9|!ticking
actions.aoe+=/windstrike,target=1,if=!debuff.stormstrike.up
actions.aoe+=/windstrike,target=2,if=!debuff.stormstrike.up
actions.aoe+=/windstrike,target=3,if=!debuff.stormstrike.up
actions.aoe+=/windstrike
actions.aoe+=/elemental_blast,if=!buff.unleash_flame.up&buff.maelstrom_weapon.react>=3
actions.aoe+=/chain_lightning,if=(buff.maelstrom_weapon.react>=3|buff.ancestral_swiftness.up)&((glyph.chain_lightning.enabled&active_enemies>=4)|(!glyph.chain_lightning.enabled&active_enemies>=3))
actions.aoe+=/magma_totem,if=pet.magma_totem.remains<=20&!pet.fire_elemental_totem.active&!buff.liquid_magma.up
actions.aoe+=/lightning_bolt,if=buff.maelstrom_weapon.react=5&glyph.chain_lightning.enabled&active_enemies<3
actions.aoe+=/stormstrike,target=1,if=!debuff.stormstrike.up
actions.aoe+=/stormstrike,target=2,if=!debuff.stormstrike.up
actions.aoe+=/stormstrike,target=3,if=!debuff.stormstrike.up
actions.aoe+=/stormstrike
actions.aoe+=/lava_lash
actions.aoe+=/fire_nova,if=active_dot.flame_shock>=2
actions.aoe+=/elemental_blast,if=!buff.unleash_flame.up&buff.maelstrom_weapon.react>=1
actions.aoe+=/chain_lightning,if=(buff.maelstrom_weapon.react>=1|buff.ancestral_swiftness.up)&((glyph.chain_lightning.enabled&active_enemies>=3)|(!glyph.chain_lightning.enabled&active_enemies>=2))
actions.aoe+=/lightning_bolt,if=(buff.maelstrom_weapon.react>=1|buff.ancestral_swiftness.up)&glyph.chain_lightning.enabled&active_enemies<3
actions.aoe+=/fire_nova,if=active_dot.flame_shock>=1

head=blastproof_cowl,id=113891,bonus_id=567
neck=engineers_grounded_gorget,id=113892,bonus_id=567,enchant=gift_of_haste
shoulders=windspeakers_mantle,id=115576,bonus_id=567
back=cloak_of_delving_secrets,id=113929,bonus_id=567,enchant=gift_of_haste
chest=windspeakers_tunic,id=115577,bonus_id=567
wrists=bracers_of_callous_disregard,id=119334,bonus_id=567
hands=windspeakers_handwraps,id=115578,bonus_id=567
waist=earthgrasp_girdle,id=113930,bonus_id=567
legs=windspeakers_legwraps,id=115575,bonus_id=567
feet=slagstomper_treads,id=113888,bonus_id=567
finger1=spellbound_runic_band_of_unrelenting_slaughter,id=118307,enchant=gift_of_haste
finger2=cinderwolf_signet,id=113917,bonus_id=567,enchant=gift_of_haste
trinket1=beating_heart_of_the_mountain,id=113931,bonus_id=567
trinket2=meaty_dragonspine_trophy,id=118114,bonus_id=567
main_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_warsong
off_hand=hansgars_forgehammer,id=113897,bonus_id=567,enchant=mark_of_bleeding_hollow

# Gear Summary
# gear_ilvl=700.94
# gear_agility=3894
# gear_stamina=4694
# gear_crit_rating=662
# gear_haste_rating=1609
# gear_mastery_rating=713
# gear_armor=1496
# gear_multistrike_rating=976
# gear_versatility_rating=387
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Two_Target_Cleave_T17M.simc"] = [[
optimal_raid=1
tmi_boss=TMI_Standard_Boss_T17M
max_time=300
vary_combat_length=0.2
raid_events+=/adds,first=30,count=1,duration=35,cooldown=50
disable_set_bonuses=1
# Raid Tier17N
Death_Knight_Frost_1h_T17M.simc
Death_Knight_Frost_2h_T17M.simc
Death_Knight_Unholy_T17M.simc
Death_Knight_Blood_T17M.simc

Druid_Feral_T17M.simc
Druid_Balance_T17M.simc
Druid_Guardian_T17M.simc

Hunter_BM_T17M.simc
Hunter_MM_T17M.simc
Hunter_SV_T17M.simc

Mage_Arcane_T17M.simc
Mage_Fire_T17M.simc
Mage_Frost_T17M.simc
talents=1000121

Monk_Brewmaster_1h_Serenity_T17M.simc
Monk_Brewmaster_2h_Serenity_T17M.simc
Monk_Windwalker_1h_T17M.simc
Monk_Windwalker_2h_T17M.simc

Paladin_Protection_T17M.simc
Paladin_Retribution_T17M.simc
talents=2000323
#Paladin_Holy_T17M.simc

#Priest_Discipline_T17M_Heal.simc
#Priest_Holy_T17M_Heal.simc
#Priest_Holy_T17M_Dmg.simc
Priest_Shadow_T17M_COP.simc
Priest_Shadow_T17M_VE.simc
Priest_Shadow_T17M_AS.simc

Rogue_Assassination_T17M.simc
Rogue_Combat_T17M.simc
Rogue_Subtlety_T17M.simc

Shaman_Elemental_T17M.simc
Shaman_Enhancement_T17M.simc

Warlock_Affliction_T17M.simc
Warlock_Destruction_T17M.simc
Warlock_Demonology_T17M.simc

Warrior_Arms_T17M.simc
talent_override=taste_for_blood
talent_override=bladestorm
Warrior_Fury_1h_T17M.simc
talent_override=bladestorm
Warrior_Fury_2h_T17M.simc
talent_override=bladestorm
Warrior_Protection_T17M.simc
talent_override=bladestorm
Warrior_Gladiator_T17M.simc
talent_override=bladestorm
]]

private.apls["Warlock_Affliction_T17M.simc"] = [[
warlock="Warlock_Affliction_T17M"
level=100
race=gnome
role=spell
position=back
talents=0000111
talent_override=grimoire_of_service,if=talent.demonic_servitude.enabled
talent_override=soulburn_haunt,if=enemies=2
talent_override=cataclysm,if=enemies>2
spec=affliction

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/dark_intent,if=!aura.spell_power_multiplier.up
actions.precombat+=/summon_pet,if=!talent.demonic_servitude.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.grimoire_of_sacrifice.down)
actions.precombat+=/summon_doomguard,if=talent.demonic_servitude.enabled&active_enemies<9
actions.precombat+=/summon_infernal,if=talent.demonic_servitude.enabled&active_enemies>=9
actions.precombat+=/snapshot_stats
actions.precombat+=/grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled&!talent.demonic_servitude.enabled
actions.precombat+=/potion,name=draenic_intellect

# Executed every time the actor is available.

actions=potion,name=draenic_intellect,if=target.time_to_die<=25|buff.dark_soul.remains>10|(glyph.dark_soul.enabled&buff.dark_soul.remains)
actions+=/berserking
actions+=/blood_fury
actions+=/arcane_torrent
actions+=/mannoroths_fury
actions+=/dark_soul,if=!talent.archimondes_darkness.enabled|(talent.archimondes_darkness.enabled&(charges=2|target.time_to_die<40|((trinket.proc.any.react|trinket.stacking_proc.any.react)&(!talent.grimoire_of_service.enabled|!talent.demonic_servitude.enabled|pet.service_doomguard.active|recharge_time<=cooldown.service_pet.remains))))
actions+=/service_pet,if=talent.grimoire_of_service.enabled&(target.time_to_die>120|target.time_to_die<=25|(buff.dark_soul.remains&target.health.pct<20))
actions+=/summon_doomguard,if=!talent.demonic_servitude.enabled&active_enemies<9
actions+=/summon_infernal,if=!talent.demonic_servitude.enabled&active_enemies>=9
actions+=/kiljaedens_cunning,if=(talent.cataclysm.enabled&!cooldown.cataclysm.remains)
actions+=/kiljaedens_cunning,moving=1,if=!talent.cataclysm.enabled
actions+=/cataclysm
actions+=/soulburn,cycle_targets=1,if=!talent.soulburn_haunt.enabled&active_enemies>2&dot.corruption.remains<=dot.corruption.duration*0.3
actions+=/seed_of_corruption,cycle_targets=1,if=!talent.soulburn_haunt.enabled&active_enemies>2&!dot.seed_of_corruption.remains&buff.soulburn.remains
actions+=/haunt,if=shard_react&!talent.soulburn_haunt.enabled&!in_flight_to_target&(dot.haunt.remains<duration*0.3+cast_time+travel_time|soul_shard=4)&(trinket.proc.any.react|trinket.stacking_proc.any.react>6|buff.dark_soul.up|soul_shard>2|soul_shard*14<=target.time_to_die)&(buff.dark_soul.down|set_bonus.tier18_4pc=0)
actions+=/soulburn,if=shard_react&talent.soulburn_haunt.enabled&buff.soulburn.down&(buff.haunting_spirits.remains<=buff.haunting_spirits.duration*0.3)
actions+=/haunt,if=shard_react&talent.soulburn_haunt.enabled&!in_flight_to_target&((buff.soulburn.up&((buff.haunting_spirits.remains<=buff.haunting_spirits.duration*0.3&dot.haunt.remains<=dot.haunt.duration*0.3)|buff.haunting_spirits.down)))
actions+=/haunt,if=shard_react&talent.soulburn_haunt.enabled&!in_flight_to_target&buff.haunting_spirits.remains>=buff.haunting_spirits.duration*0.5&(dot.haunt.remains<duration*0.3+cast_time+travel_time|soul_shard=4)&(trinket.proc.any.react|trinket.stacking_proc.any.react>6|buff.dark_soul.up|soul_shard>2|soul_shard*14<=target.time_to_die)&(buff.dark_soul.down|set_bonus.tier18_4pc=0)
actions+=/haunt,if=shard_react&!in_flight_to_target&buff.dark_soul.remains>cast_time+travel_time&!dot.haunt.ticking&set_bonus.tier18_4pc=1
actions+=/agony,cycle_targets=1,if=target.time_to_die>16&remains<=(duration*0.3)&((talent.cataclysm.enabled&remains<=(cooldown.cataclysm.remains+action.cataclysm.cast_time))|!talent.cataclysm.enabled)
actions+=/unstable_affliction,cycle_targets=1,if=target.time_to_die>10&remains<=(duration*0.3)
actions+=/seed_of_corruption,cycle_targets=1,if=!talent.soulburn_haunt.enabled&active_enemies>3&!dot.seed_of_corruption.ticking
actions+=/corruption,cycle_targets=1,if=target.time_to_die>12&remains<=(duration*0.3)
actions+=/seed_of_corruption,cycle_targets=1,if=active_enemies>3&!dot.seed_of_corruption.ticking
actions+=/life_tap,if=mana.pct<40&buff.dark_soul.down
actions+=/drain_soul,interrupt=1,chain=1
actions+=/agony,cycle_targets=1,moving=1,if=mana.pct>50
actions+=/life_tap

head=shadow_councils_hood,id=115586,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant_id=5318
shoulders=earthripple_shoulderpads,id=113928,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant_id=5311
chest=shadow_councils_robes,id=115588,bonus_id=567
wrists=bracers_of_darkened_skies,id=119332,bonus_id=567
hands=shadow_councils_gloves,id=115585,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=shadow_councils_leggings,id=115587,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant_id=5325
finger2=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant_id=5325
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
main_hand=infernoflame_staff,id=113869,bonus_id=567,enchant_id=5337

# Gear Summary
# gear_ilvl=701.00
# gear_stamina=4763
# gear_intellect=3993
# gear_spell_power=1837
# gear_crit_rating=680
# gear_haste_rating=1695
# gear_mastery_rating=1630
# gear_armor=900
# gear_multistrike_rating=338
# gear_versatility_rating=108
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
default_pet=felhunter
]]

private.apls["Warlock_Demonology_T17M.simc"] = [[
warlock="Warlock_Demonology_T17M"
level=100
race=troll
role=spell
position=back
talents=0000213
spec=demonology

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/dark_intent,if=!aura.spell_power_multiplier.up
actions.precombat+=/summon_pet,if=!talent.demonic_servitude.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.grimoire_of_sacrifice.down)
actions.precombat+=/summon_doomguard,if=talent.demonic_servitude.enabled&active_enemies<9
actions.precombat+=/summon_infernal,if=talent.demonic_servitude.enabled&active_enemies>=9
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/soul_fire

# Executed every time the actor is available.

actions=potion,name=draenic_intellect,if=buff.bloodlust.remains>30|(((buff.dark_soul.up&(trinket.proc.any.react|trinket.stacking_proc.any.react>6)&!buff.demonbolt.remains)|target.health.pct<20)&(!talent.grimoire_of_service.enabled|!talent.demonic_servitude.enabled|pet.service_doomguard.active))
actions+=/berserking
actions+=/blood_fury
actions+=/arcane_torrent
actions+=/mannoroths_fury
actions+=/dark_soul,if=talent.demonbolt.enabled&((charges=2&((!glyph.imp_swarm.enabled&(dot.corruption.ticking|trinket.proc.haste.remains<=10))|cooldown.imp_swarm.remains))|target.time_to_die<buff.demonbolt.remains|(!buff.demonbolt.remains&demonic_fury>=790))
actions+=/dark_soul,if=!talent.demonbolt.enabled&((charges=2&(time>6|(debuff.shadowflame.stack=1&action.hand_of_guldan.in_flight)))|!talent.archimondes_darkness.enabled|(target.time_to_die<=20&!glyph.dark_soul.enabled)|target.time_to_die<=10|(target.time_to_die<=60&demonic_fury>400)|((trinket.proc.any.react|trinket.stacking_proc.any.react)&(demonic_fury>600|(glyph.dark_soul.enabled&demonic_fury>450))))
actions+=/imp_swarm,if=!talent.demonbolt.enabled&(buff.dark_soul.up|(cooldown.dark_soul.remains>(120%(1%spell_haste)))|time_to_die<32)&time>3
actions+=/felguard:felstorm
actions+=/wrathguard:wrathstorm
actions+=/wrathguard:mortal_cleave,if=pet.wrathguard.cooldown.wrathstorm.remains>5
actions+=/hand_of_guldan,if=!in_flight&dot.shadowflame.remains<travel_time+action.shadow_bolt.cast_time&(((set_bonus.tier17_4pc=0&((charges=1&recharge_time<4)|charges=2))|(charges=3|(charges=2&recharge_time<13.8-travel_time*2))&((cooldown.cataclysm.remains>dot.shadowflame.duration)|!talent.cataclysm.enabled))|dot.shadowflame.remains>travel_time)
actions+=/hand_of_guldan,if=!in_flight&dot.shadowflame.remains<travel_time+action.shadow_bolt.cast_time&talent.demonbolt.enabled&((set_bonus.tier17_4pc=0&((charges=1&recharge_time<4)|charges=2))|(charges=3|(charges=2&recharge_time<13.8-travel_time*2))|dot.shadowflame.remains>travel_time)
actions+=/hand_of_guldan,if=!in_flight&dot.shadowflame.remains<3.7&time<5&buff.demonbolt.remains<gcd*2&(charges>=2|set_bonus.tier17_4pc=0)&action.dark_soul.charges>=1
actions+=/service_pet,if=talent.grimoire_of_service.enabled&(target.time_to_die>120|target.time_to_die<=25|(buff.dark_soul.remains&target.health.pct<20))
actions+=/summon_doomguard,if=!talent.demonic_servitude.enabled&active_enemies<9
actions+=/summon_infernal,if=!talent.demonic_servitude.enabled&active_enemies>=9
actions+=/call_action_list,name=db,if=talent.demonbolt.enabled
actions+=/kiljaedens_cunning,if=!cooldown.cataclysm.remains&buff.metamorphosis.up
actions+=/cataclysm,if=buff.metamorphosis.up
actions+=/immolation_aura,if=demonic_fury>450&active_enemies>=3&buff.immolation_aura.down
actions+=/doom,if=buff.metamorphosis.up&target.time_to_die>=30*spell_haste&remains<=(duration*0.3)&(remains<cooldown.cataclysm.remains|!talent.cataclysm.enabled)&trinket.stacking_proc.multistrike.react<10
actions+=/corruption,cycle_targets=1,if=target.time_to_die>=6&remains<=(0.3*duration)&buff.metamorphosis.down
actions+=/cancel_metamorphosis,if=buff.metamorphosis.up&((demonic_fury<650&!glyph.dark_soul.enabled)|demonic_fury<450)&buff.dark_soul.down&(trinket.stacking_proc.multistrike.down&trinket.proc.any.down|demonic_fury<(800-cooldown.dark_soul.remains*(10%spell_haste)))&target.time_to_die>20
actions+=/cancel_metamorphosis,if=buff.metamorphosis.up&action.hand_of_guldan.charges>0&dot.shadowflame.remains<action.hand_of_guldan.travel_time+action.shadow_bolt.cast_time&((demonic_fury<100&buff.dark_soul.remains>10)|time<15)&!glyph.dark_soul.enabled
actions+=/cancel_metamorphosis,if=buff.metamorphosis.up&action.hand_of_guldan.charges=3&(!buff.dark_soul.remains>gcd|action.metamorphosis.cooldown<gcd)
actions+=/chaos_wave,if=buff.metamorphosis.up&(buff.dark_soul.up&active_enemies>=2|(charges=3|set_bonus.tier17_4pc=0&charges=2))
actions+=/soul_fire,if=buff.metamorphosis.up&buff.molten_core.react&(buff.dark_soul.remains>execute_time|target.health.pct<=25)&(((buff.molten_core.stack*execute_time>=trinket.stacking_proc.multistrike.remains-1|demonic_fury<=ceil((trinket.stacking_proc.multistrike.remains-buff.molten_core.stack*execute_time)*40)+80*buff.molten_core.stack)|target.health.pct<=25)&trinket.stacking_proc.multistrike.remains>=execute_time|trinket.stacking_proc.multistrike.down|!trinket.has_stacking_proc.multistrike)
actions+=/soul_fire,if=buff.metamorphosis.up&buff.molten_core.react&(buff.demon_rush.remains<=4|buff.demon_rush.stack<5)&set_bonus.tier18_2pc=1
actions+=/touch_of_chaos,cycle_targets=1,if=buff.metamorphosis.up&dot.corruption.remains<17.4&demonic_fury>750
actions+=/touch_of_chaos,if=buff.metamorphosis.up
actions+=/metamorphosis,if=buff.dark_soul.remains>gcd&(time>6|debuff.shadowflame.stack=2)&(demonic_fury>300|!glyph.dark_soul.enabled)&(demonic_fury>=80&buff.molten_core.stack>=1|demonic_fury>=40)
actions+=/metamorphosis,if=(trinket.stacking_proc.multistrike.react|trinket.proc.any.react)&((demonic_fury>450&action.dark_soul.recharge_time>=10&glyph.dark_soul.enabled)|(demonic_fury>650&cooldown.dark_soul.remains>=10))
actions+=/metamorphosis,if=!cooldown.cataclysm.remains&talent.cataclysm.enabled
actions+=/metamorphosis,if=!dot.doom.ticking&target.time_to_die>=30%(1%spell_haste)&demonic_fury>300
actions+=/metamorphosis,if=(demonic_fury>750&(action.hand_of_guldan.charges=0|(!dot.shadowflame.ticking&!action.hand_of_guldan.in_flight_to_target)))|floor(demonic_fury%80)*action.soul_fire.execute_time>=target.time_to_die
actions+=/metamorphosis,if=demonic_fury>=950
actions+=/cancel_metamorphosis
actions+=/imp_swarm
actions+=/hellfire,interrupt=1,if=active_enemies>=5
actions+=/soul_fire,if=buff.molten_core.react&(buff.demon_rush.remains<=4|buff.demon_rush.stack<5)&set_bonus.tier18_2pc=1
actions+=/soul_fire,if=buff.molten_core.react&(buff.molten_core.stack>=7|target.health.pct<=25|(buff.dark_soul.remains&cooldown.metamorphosis.remains>buff.dark_soul.remains)|trinket.proc.any.remains>execute_time|trinket.stacking_proc.multistrike.remains>execute_time)&(buff.dark_soul.remains<action.shadow_bolt.cast_time|buff.dark_soul.remains>execute_time)
actions+=/soul_fire,if=buff.molten_core.react&target.time_to_die<(time+target.time_to_die)*0.25+cooldown.dark_soul.remains
actions+=/life_tap,if=mana.pct<40&buff.dark_soul.down
actions+=/hellfire,interrupt=1,if=active_enemies>=4
actions+=/shadow_bolt
actions+=/hellfire,moving=1,interrupt=1
actions+=/life_tap

actions.db=immolation_aura,if=demonic_fury>450&active_enemies>=5&buff.immolation_aura.down
actions.db+=/doom,cycle_targets=1,if=buff.metamorphosis.up&active_enemies>=6&target.time_to_die>=30*spell_haste&remains<=(duration*0.3)&(buff.dark_soul.down|!glyph.dark_soul.enabled)
actions.db+=/kiljaedens_cunning,moving=1,if=buff.demonbolt.stack=0|(buff.demonbolt.stack<4&buff.demonbolt.remains>=(40*spell_haste-execute_time))
actions.db+=/soul_fire,if=buff.metamorphosis.up&buff.molten_core.react&buff.demon_rush.remains<=4&set_bonus.tier18_2pc=1
actions.db+=/demonbolt,if=buff.demonbolt.stack=0|(buff.demonbolt.stack<4&buff.demonbolt.remains>=(40*spell_haste-execute_time))
actions.db+=/doom,cycle_targets=1,if=buff.metamorphosis.up&target.time_to_die>=30*spell_haste&remains<=(duration*0.3)&(buff.dark_soul.down|!glyph.dark_soul.enabled)
actions.db+=/corruption,cycle_targets=1,if=target.time_to_die>=6&remains<=(0.3*duration)&buff.metamorphosis.down
actions.db+=/cancel_metamorphosis,if=buff.metamorphosis.up&buff.demonbolt.stack>3&demonic_fury<=600&target.time_to_die>buff.demonbolt.remains&buff.dark_soul.down
actions.db+=/chaos_wave,if=buff.metamorphosis.up&buff.dark_soul.up&active_enemies>=2&demonic_fury>450
actions.db+=/soul_fire,if=buff.metamorphosis.up&buff.molten_core.react&(((buff.dark_soul.remains>execute_time)&demonic_fury>=175)|(target.time_to_die<buff.demonbolt.remains))
actions.db+=/soul_fire,if=buff.metamorphosis.up&buff.molten_core.react&target.health.pct<=25&(((demonic_fury-80)%800)>(buff.demonbolt.remains%(40*spell_haste)))&demonic_fury>=750
actions.db+=/touch_of_chaos,cycle_targets=1,if=buff.metamorphosis.up&dot.corruption.remains<17.4&demonic_fury>750
actions.db+=/touch_of_chaos,if=buff.metamorphosis.up&(target.time_to_die<buff.demonbolt.remains|(demonic_fury>=750&buff.demonbolt.remains)|buff.dark_soul.up)
actions.db+=/touch_of_chaos,if=buff.metamorphosis.up&(((demonic_fury-40)%800)>(buff.demonbolt.remains%(40*spell_haste)))&demonic_fury>=750
actions.db+=/metamorphosis,if=buff.dark_soul.remains>gcd&(demonic_fury>=470|buff.dark_soul.remains<=action.demonbolt.execute_time*3)&(buff.demonbolt.down|target.time_to_die<buff.demonbolt.remains|(buff.dark_soul.remains>execute_time&demonic_fury>=175))
actions.db+=/metamorphosis,if=buff.demonbolt.down&demonic_fury>=480&(action.dark_soul.charges=0|!talent.archimondes_darkness.enabled&cooldown.dark_soul.remains)
actions.db+=/metamorphosis,if=(demonic_fury%80)*2*spell_haste>=target.time_to_die&target.time_to_die<buff.demonbolt.remains
actions.db+=/metamorphosis,if=target.time_to_die>=30*spell_haste&!dot.doom.ticking&buff.dark_soul.down&time>10
actions.db+=/metamorphosis,if=demonic_fury>750&buff.demonbolt.remains>=action.metamorphosis.cooldown
actions.db+=/metamorphosis,if=(((demonic_fury-120)%800)>(buff.demonbolt.remains%(40*spell_haste)))&buff.demonbolt.remains>=10&dot.doom.remains<=dot.doom.duration*0.3
actions.db+=/cancel_metamorphosis
actions.db+=/imp_swarm
actions.db+=/hellfire,interrupt=1,if=active_enemies>=5
actions.db+=/soul_fire,if=buff.molten_core.react&(buff.demon_rush.remains<=4|buff.demon_rush.stack<5)&set_bonus.tier18_2pc=1
actions.db+=/soul_fire,if=buff.molten_core.react&(buff.dark_soul.remains<action.shadow_bolt.cast_time|buff.dark_soul.remains>cast_time)
actions.db+=/life_tap,if=mana.pct<40&buff.dark_soul.down
actions.db+=/hellfire,interrupt=1,if=active_enemies>=4
actions.db+=/shadow_bolt
actions.db+=/hellfire,moving=1,interrupt=1
actions.db+=/life_tap

head=shadow_councils_hood,id=115586,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant_id=5319
shoulders=shadow_councils_mantle,id=115589,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant_id=5312
chest=shadow_councils_robes,id=115588,bonus_id=567
wrists=bracers_of_darkened_skies,id=119332,bonus_id=567
hands=toothbreaker_grips,id=113876,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=shadow_councils_leggings,id=115587,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant_id=5326
finger2=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant_id=5326
trinket1=goren_soul_repository,id=119194,bonus_id=567
trinket2=blackiron_micro_crucible,id=113984,bonus_id=567
main_hand=infernoflame_staff,id=113869,bonus_id=567,enchant_id=5384

# Gear Summary
# gear_ilvl=701.00
# gear_stamina=4763
# gear_intellect=3993
# gear_spell_power=1837
# gear_crit_rating=523
# gear_haste_rating=1255
# gear_mastery_rating=2075
# gear_armor=900
# gear_multistrike_rating=479
# gear_versatility_rating=108
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
default_pet=felguard
]]

private.apls["Warlock_Destruction_T17M.simc"] = [[
warlock="Warlock_Destruction_T17M"
level=100
race=dwarf
role=spell
position=back
talents=0000311
talent_override=charred_remains,if=enemies>=4
talent_override=cataclysm,if=enemies>1&enemies<4
talent_override=grimoire_of_sacrifice,if=enemies>1&enemies<4|(enemies=1&talent.charred_remains.enabled)
talent_override=grimoire_of_supremacy,if=(enemies>=4&!talent.demonic_servitude.enabled)|(enemies=1&talent.cataclysm.enabled)
talent_override=grimoire_of_service,if=talent.demonic_servitude.enabled
spec=destruction

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_intellect_flask
actions.precombat+=/food,type=pickled_eel
actions.precombat+=/dark_intent,if=!aura.spell_power_multiplier.up
actions.precombat+=/summon_pet,if=!talent.demonic_servitude.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.grimoire_of_sacrifice.down)
actions.precombat+=/summon_doomguard,if=talent.demonic_servitude.enabled&active_enemies<9
actions.precombat+=/summon_infernal,if=talent.demonic_servitude.enabled&active_enemies>=9
actions.precombat+=/snapshot_stats
actions.precombat+=/grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled&!talent.demonic_servitude.enabled
actions.precombat+=/potion,name=draenic_intellect
actions.precombat+=/incinerate

# Executed every time the actor is available.

actions=potion,name=draenic_intellect,if=target.time_to_die<=25|buff.dark_soul.remains>10|(glyph.dark_soul.enabled&buff.dark_soul.remains)
actions+=/berserking
actions+=/blood_fury
actions+=/arcane_torrent
actions+=/mannoroths_fury
actions+=/dark_soul,if=!talent.archimondes_darkness.enabled|(talent.archimondes_darkness.enabled&(charges=2|target.time_to_die<40|((trinket.proc.any.react|trinket.stacking_proc.any.react)&(!talent.grimoire_of_service.enabled|!talent.demonic_servitude.enabled|pet.service_doomguard.active|recharge_time<=cooldown.service_pet.remains))))
actions+=/service_pet,if=talent.grimoire_of_service.enabled&(target.time_to_die>120|target.time_to_die<=25|(buff.dark_soul.remains&target.health.pct<20))
actions+=/summon_doomguard,if=!talent.demonic_servitude.enabled&active_enemies<9
actions+=/summon_infernal,if=!talent.demonic_servitude.enabled&active_enemies>=9
actions+=/run_action_list,name=single_target,if=active_enemies<6&(!talent.charred_remains.enabled|active_enemies<4)
actions+=/run_action_list,name=aoe,if=active_enemies>=6|(talent.charred_remains.enabled&active_enemies>=4)

actions.single_target=havoc,target=2
actions.single_target+=/shadowburn,if=talent.charred_remains.enabled&target.time_to_die<10
actions.single_target+=/kiljaedens_cunning,if=(talent.cataclysm.enabled&!cooldown.cataclysm.remains)
actions.single_target+=/kiljaedens_cunning,moving=1,if=!talent.cataclysm.enabled
actions.single_target+=/cataclysm,if=active_enemies>1
actions.single_target+=/fire_and_brimstone,if=buff.fire_and_brimstone.down&dot.immolate.remains<=action.immolate.cast_time&(cooldown.cataclysm.remains>action.immolate.cast_time|!talent.cataclysm.enabled)&active_enemies>4
actions.single_target+=/immolate,cycle_targets=1,if=remains<=cast_time&(cooldown.cataclysm.remains>cast_time|!talent.cataclysm.enabled)
actions.single_target+=/cancel_buff,name=fire_and_brimstone,if=buff.fire_and_brimstone.up&dot.immolate.remains>(dot.immolate.duration*0.3)
actions.single_target+=/shadowburn,if=buff.havoc.remains
actions.single_target+=/chaos_bolt,if=buff.havoc.remains>cast_time&buff.havoc.stack>=3
actions.single_target+=/conflagrate,if=charges=2
actions.single_target+=/cataclysm
actions.single_target+=/rain_of_fire,if=remains<=tick_time&(active_enemies>4|(buff.mannoroths_fury.up&active_enemies>2))
actions.single_target+=/chaos_bolt,if=talent.charred_remains.enabled&active_enemies>1&target.health.pct>20
actions.single_target+=/chaos_bolt,if=talent.charred_remains.enabled&buff.backdraft.stack<3&burning_ember>=2.5
actions.single_target+=/chaos_bolt,if=buff.backdraft.stack<3&(burning_ember>=3.5|buff.dark_soul.up|target.time_to_die<20)
actions.single_target+=/chaos_bolt,if=buff.backdraft.stack<3&set_bonus.tier17_2pc=1&burning_ember>=2.5
actions.single_target+=/chaos_bolt,if=buff.backdraft.stack<3&buff.archmages_greater_incandescence_int.react&buff.archmages_greater_incandescence_int.remains>cast_time
actions.single_target+=/chaos_bolt,if=buff.backdraft.stack<3&trinket.proc.intellect.react&trinket.proc.intellect.remains>cast_time
actions.single_target+=/chaos_bolt,if=buff.backdraft.stack<3&trinket.proc.crit.react&trinket.proc.crit.remains>cast_time
actions.single_target+=/chaos_bolt,if=buff.backdraft.stack<3&trinket.stacking_proc.multistrike.react>=8&trinket.stacking_proc.multistrike.remains>=cast_time
actions.single_target+=/chaos_bolt,if=buff.backdraft.stack<3&trinket.proc.multistrike.react&trinket.proc.multistrike.remains>cast_time
actions.single_target+=/chaos_bolt,if=buff.backdraft.stack<3&trinket.proc.versatility.react&trinket.proc.versatility.remains>cast_time
actions.single_target+=/chaos_bolt,if=buff.backdraft.stack<3&trinket.proc.mastery.react&trinket.proc.mastery.remains>cast_time
actions.single_target+=/fire_and_brimstone,if=buff.fire_and_brimstone.down&dot.immolate.remains<=(dot.immolate.duration*0.3)&active_enemies>4
actions.single_target+=/immolate,cycle_targets=1,if=remains<=(duration*0.3)
actions.single_target+=/conflagrate,if=buff.backdraft.stack=0
actions.single_target+=/incinerate

actions.aoe=rain_of_fire,if=!talent.charred_remains.enabled&remains<=tick_time
actions.aoe+=/havoc,target=2,if=(!talent.charred_remains.enabled|buff.fire_and_brimstone.down)
actions.aoe+=/shadowburn,if=!talent.charred_remains.enabled&buff.havoc.remains
actions.aoe+=/chaos_bolt,if=!talent.charred_remains.enabled&buff.havoc.remains>cast_time&buff.havoc.stack>=3
actions.aoe+=/kiljaedens_cunning,if=(talent.cataclysm.enabled&!cooldown.cataclysm.remains)
actions.aoe+=/kiljaedens_cunning,moving=1,if=!talent.cataclysm.enabled
actions.aoe+=/cataclysm
actions.aoe+=/fire_and_brimstone,if=buff.fire_and_brimstone.down
actions.aoe+=/immolate,if=buff.fire_and_brimstone.up&!dot.immolate.ticking
actions.aoe+=/conflagrate,if=buff.fire_and_brimstone.up&charges=2
actions.aoe+=/immolate,if=buff.fire_and_brimstone.up&dot.immolate.remains<=(dot.immolate.duration*0.3)
actions.aoe+=/chaos_bolt,if=talent.charred_remains.enabled&buff.fire_and_brimstone.up
actions.aoe+=/incinerate

head=shadow_councils_hood,id=115586,bonus_id=567
neck=gruuls_lip_ring,id=113872,bonus_id=567,enchant_id=5319
shoulders=shadow_councils_mantle,id=115589,bonus_id=567
back=runefrenzy_greatcloak,id=113937,bonus_id=567,enchant_id=5312
chest=shadow_councils_robes,id=115588,bonus_id=567
wrists=bracers_of_enkindled_power,id=113956,bonus_id=567
hands=shadow_councils_gloves,id=115585,bonus_id=567
waist=seeking_ember_girdle,id=113941,bonus_id=567
legs=turret_mechanics_legwraps,id=113970,bonus_id=567
feet=cavedwellers_climbers,id=113864,bonus_id=567
finger1=spellbound_runic_band_of_the_allseeing_eye,id=118306,enchant_id=5326
finger2=ukuroggs_corrupted_seal,id=113975,bonus_id=567,enchant_id=5326
trinket1=darmacs_unstable_talisman,id=113948,bonus_id=567
trinket2=goren_soul_repository,id=119194,bonus_id=567
main_hand=blackhand_doomstaff,id=113988,bonus_id=567,enchant_id=5384

# Gear Summary
# gear_ilvl=701.00
# gear_stamina=4763
# gear_intellect=3923
# gear_spell_power=1837
# gear_crit_rating=1251
# gear_haste_rating=991
# gear_mastery_rating=1929
# gear_armor=900
# gear_multistrike_rating=141
# gear_versatility_rating=108
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
default_pet=felhunter
]]

private.apls["Warlock_T17M.simc"] = [[
Warlock_Affliction_T17M.simc
Warlock_Destruction_T17M.simc
Warlock_Demonology_T17M.simc]]

private.apls["Warrior_Arms_T17M.simc"] = [[
warrior="Warrior_Arms_T17M"
level=100
race=tauren
role=attack
position=back
talents=1321322
talent_override=bladestorm,if=raid_event.adds.count>=1|enemies>1
talent_override=dragon_roar,if=raid_event.adds.count>=1|enemies>1
talent_override=taste_for_blood,if=raid_event.adds.count>=1|enemies>1
talent_override=ravager,if=raid_event.adds.cooldown>=60&raid_event.adds.exists
glyphs=unending_rage/heroic_leap/sweeping_strikes
spec=arms

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_strength_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/stance,choose=battle
# Snapshot raid buffed stats before combat begins and pre-potting is done.
# Generic on-use trinket line if needed when swapping trinkets out.
# actions+=/use_item,slot=trinket1,if=active_enemies=1&(buff.bloodbath.up|(!talent.bloodbath.enabled&debuff.colossus_smash.up))|(active_enemies>=2&(prev_gcd.ravager|(!talent.ravager.enabled&!cooldown.bladestorm.remains&dot.rend.ticking)))
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_strength

# Executed every time the actor is available.

actions=charge,if=debuff.charge.down
actions+=/auto_attack
# This is mostly to prevent cooldowns from being accidentally used during movement.
actions+=/run_action_list,name=movement,if=movement.distance>5
actions+=/use_item,name=vial_of_convulsive_shadows,if=(buff.bloodbath.up|(!talent.bloodbath.enabled&debuff.colossus_smash.up))
actions+=/potion,name=draenic_strength,if=(target.health.pct<20&buff.recklessness.up)|target.time_to_die<25
# This incredibly long line (Due to differing talent choices) says 'Use recklessness on cooldown with colossus smash, unless the boss will die before the ability is usable again, and then use it with execute.'
actions+=/recklessness,if=(((target.time_to_die>190|target.health.pct<20)&(buff.bloodbath.up|!talent.bloodbath.enabled))|target.time_to_die<=12|talent.anger_management.enabled)&((desired_targets=1&!raid_event.adds.exists)|!talent.bladestorm.enabled)
actions+=/bloodbath,if=(dot.rend.ticking&cooldown.colossus_smash.remains<5&((talent.ravager.enabled&prev_gcd.ravager)|!talent.ravager.enabled))|target.time_to_die<20
actions+=/avatar,if=buff.recklessness.up|target.time_to_die<25
actions+=/blood_fury,if=buff.bloodbath.up|(!talent.bloodbath.enabled&debuff.colossus_smash.up)|buff.recklessness.up
actions+=/berserking,if=buff.bloodbath.up|(!talent.bloodbath.enabled&debuff.colossus_smash.up)|buff.recklessness.up
actions+=/arcane_torrent,if=rage<rage.max-40
actions+=/heroic_leap,if=(raid_event.movement.distance>25&raid_event.movement.in>45)|!raid_event.movement.exists
actions+=/call_action_list,name=single,if=active_enemies=1
actions+=/call_action_list,name=aoe,if=active_enemies>1

actions.movement=heroic_leap
actions.movement+=/charge,cycle_targets=1,if=debuff.charge.down
# If possible, charge a target that will give us rage. Otherwise, just charge to get back in range.
actions.movement+=/charge
# May as well throw storm bolt if we can.
actions.movement+=/storm_bolt
actions.movement+=/heroic_throw

actions.single=rend,if=target.time_to_die>4&dot.rend.remains<5.4&(target.health.pct>20|!debuff.colossus_smash.up)
actions.single+=/ravager,if=cooldown.colossus_smash.remains<4&(!raid_event.adds.exists|raid_event.adds.in>55)
actions.single+=/colossus_smash
actions.single+=/mortal_strike,if=target.health.pct>20
actions.single+=/bladestorm,if=(((debuff.colossus_smash.up|cooldown.colossus_smash.remains>3)&target.health.pct>20)|(target.health.pct<20&rage<30&cooldown.colossus_smash.remains>4))&(!raid_event.adds.exists|raid_event.adds.in>55|(talent.anger_management.enabled&raid_event.adds.in>40))
actions.single+=/storm_bolt,if=target.health.pct>20|(target.health.pct<20&!debuff.colossus_smash.up)
actions.single+=/siegebreaker
actions.single+=/dragon_roar,if=!debuff.colossus_smash.up&(!raid_event.adds.exists|raid_event.adds.in>55|(talent.anger_management.enabled&raid_event.adds.in>40))
actions.single+=/execute,if=buff.sudden_death.react
actions.single+=/execute,if=!buff.sudden_death.react&(rage>72&cooldown.colossus_smash.remains>gcd)|debuff.colossus_smash.up|target.time_to_die<5
actions.single+=/impending_victory,if=rage<40&target.health.pct>20&cooldown.colossus_smash.remains>1
actions.single+=/slam,if=(rage>20|cooldown.colossus_smash.remains>gcd)&target.health.pct>20&cooldown.colossus_smash.remains>1
actions.single+=/thunder_clap,if=!talent.slam.enabled&target.health.pct>20&(rage>=40|debuff.colossus_smash.up)&glyph.resonating_power.enabled&cooldown.colossus_smash.remains>gcd
actions.single+=/whirlwind,if=!talent.slam.enabled&target.health.pct>20&(rage>=40|debuff.colossus_smash.up)&cooldown.colossus_smash.remains>gcd
actions.single+=/shockwave

actions.aoe=sweeping_strikes
actions.aoe+=/rend,if=ticks_remain<2&target.time_to_die>4&(target.health.pct>20|!debuff.colossus_smash.up)
actions.aoe+=/rend,cycle_targets=1,max_cycle_targets=2,if=ticks_remain<2&target.time_to_die>8&!buff.colossus_smash_up.up&talent.taste_for_blood.enabled
actions.aoe+=/rend,cycle_targets=1,if=ticks_remain<2&target.time_to_die-remains>18&!buff.colossus_smash_up.up&active_enemies<=8
actions.aoe+=/ravager,if=buff.bloodbath.up|cooldown.colossus_smash.remains<4
actions.aoe+=/bladestorm,if=((debuff.colossus_smash.up|cooldown.colossus_smash.remains>3)&target.health.pct>20)|(target.health.pct<20&rage<30&cooldown.colossus_smash.remains>4)
actions.aoe+=/colossus_smash,if=dot.rend.ticking
actions.aoe+=/execute,cycle_targets=1,if=!buff.sudden_death.react&active_enemies<=8&((rage>72&cooldown.colossus_smash.remains>gcd)|rage>80|target.time_to_die<5|debuff.colossus_smash.up)
actions.aoe+=/heroic_charge,cycle_targets=1,if=target.health.pct<20&rage<70&swing.mh.remains>2&debuff.charge.down
# Heroic Charge is an event that makes the warrior heroic leap out of melee range for an instant
#If heroic leap is not available, the warrior will simply run out of melee to charge range, and then charge back in.
#This can delay autoattacks, but typically the rage gained from charging (Especially with bull rush glyphed) is more than
#The amount lost from delayed autoattacks. Charge only grants rage from charging a different target than the last time.
#Which means this is only worth doing on AoE, and only when you cycle your charge target.
actions.aoe+=/mortal_strike,if=target.health.pct>20&active_enemies<=5
actions.aoe+=/dragon_roar,if=!debuff.colossus_smash.up
actions.aoe+=/thunder_clap,if=(target.health.pct>20|active_enemies>=9)&glyph.resonating_power.enabled
actions.aoe+=/rend,cycle_targets=1,if=ticks_remain<2&target.time_to_die>8&!buff.colossus_smash_up.up&active_enemies>=9&rage<50&!talent.taste_for_blood.enabled
actions.aoe+=/whirlwind,if=target.health.pct>20|active_enemies>=9
actions.aoe+=/siegebreaker
actions.aoe+=/storm_bolt,if=cooldown.colossus_smash.remains>4|debuff.colossus_smash.up
actions.aoe+=/shockwave
actions.aoe+=/execute,if=buff.sudden_death.react

head=blackhands_faceguard,id=115584,bonus_id=567
neck=vertebrae_protector,id=113900,bonus_id=567,enchant=gift_of_critical_strike
shoulders=overdriven_spaulders,id=113990,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_critical_strike
chest=blackhands_chestguard,id=115582,bonus_id=567
wrists=fleshmelter_bracers,id=113896,bonus_id=567
hands=blackhands_handguards,id=115583,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=blackhands_legguards,id=115580,bonus_id=567
feet=doomslag_greatboots,id=119341,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_critical_strike
finger2=seal_of_the_savage_howl,id=113940,bonus_id=567,enchant=gift_of_critical_strike
trinket1=vial_of_convulsive_shadows,id=113969,bonus_id=567
trinket2=horn_of_screaming_spirits,id=119193,bonus_id=567
main_hand=crescent_of_living_magma,id=113886,bonus_id=567,enchant=mark_of_the_thunderlord

# Gear Summary
# gear_ilvl=701.00
# gear_strength=3992
# gear_stamina=4763
# gear_crit_rating=1794
# gear_haste_rating=476
# gear_mastery_rating=1231
# gear_armor=2287
# gear_multistrike_rating=931
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Warrior_Fury_1h_T17M.simc"] = [[
warrior="Warrior_Fury_1h_T17M"
level=100
race=tauren
role=attack
position=back
talents=1321321
talent_override=bladestorm,if=raid_event.adds.count>=1|enemies>1
talent_override=dragon_roar,if=raid_event.adds.count>=1|enemies>1
talent_override=ravager,if=raid_event.adds.cooldown>=60&raid_event.adds.exists
glyphs=unending_rage/raging_wind/heroic_leap
spec=fury

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_strength_flask
actions.precombat+=/food,type=pickled_eel
actions.precombat+=/stance,choose=battle
# Snapshot raid buffed stats before combat begins and pre-potting is done.
# Generic on-use trinket line if needed when swapping trinkets out.
#actions+=/use_item,slot=trinket1,if=active_enemies=1&(buff.bloodbath.up|(!talent.bloodbath.enabled&(buff.avatar.up|!talent.avatar.enabled)))|(active_enemies>=2&buff.ravager.up)
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_strength

# Executed every time the actor is available.

actions=charge,if=debuff.charge.down
actions+=/auto_attack
# This is mostly to prevent cooldowns from being accidentally used during movement.
actions+=/run_action_list,name=movement,if=movement.distance>5
actions+=/berserker_rage,if=buff.enrage.down|(prev_gcd.bloodthirst&buff.raging_blow.stack<2)
actions+=/heroic_leap,if=(raid_event.movement.distance>25&raid_event.movement.in>45)|!raid_event.movement.exists
actions+=/use_item,name=vial_of_convulsive_shadows,if=(active_enemies>1|!raid_event.adds.exists)&((talent.bladestorm.enabled&cooldown.bladestorm.remains=0)|buff.recklessness.up|target.time_to_die<25|!talent.anger_management.enabled)
actions+=/potion,name=draenic_strength,if=(target.health.pct<20&buff.recklessness.up)|target.time_to_die<=25
# Skip cooldown usage if we can line them up with bladestorm on a large set of adds, or if movement is coming soon.
actions+=/run_action_list,name=single_target,if=(raid_event.adds.cooldown<60&raid_event.adds.count>2&active_enemies=1)|raid_event.movement.cooldown<5
# This incredibly long line (Due to differing talent choices) says 'Use recklessness on cooldown, unless the boss will die before the ability is usable again, and then use it with execute.'
actions+=/recklessness,if=(((target.time_to_die>190|target.health.pct<20)&(buff.bloodbath.up|!talent.bloodbath.enabled))|target.time_to_die<=12|talent.anger_management.enabled)&((talent.bladestorm.enabled&(!raid_event.adds.exists|enemies=1))|!talent.bladestorm.enabled)
actions+=/avatar,if=buff.recklessness.up|cooldown.recklessness.remains>60|target.time_to_die<30
actions+=/blood_fury,if=buff.bloodbath.up|!talent.bloodbath.enabled|buff.recklessness.up
actions+=/berserking,if=buff.bloodbath.up|!talent.bloodbath.enabled|buff.recklessness.up
actions+=/arcane_torrent,if=rage<rage.max-40
actions+=/call_action_list,name=single_target,if=active_enemies=1
actions+=/call_action_list,name=two_targets,if=active_enemies=2
actions+=/call_action_list,name=three_targets,if=active_enemies=3
actions+=/call_action_list,name=aoe,if=active_enemies>3

actions.movement=heroic_leap
actions.movement+=/charge,cycle_targets=1,if=debuff.charge.down
# If possible, charge a target that will give rage. Otherwise, just charge to get back in range.
actions.movement+=/charge
# May as well throw storm bolt if we can.
actions.movement+=/storm_bolt
actions.movement+=/heroic_throw

actions.single_target=bloodbath
actions.single_target+=/recklessness,if=target.health.pct<20&raid_event.adds.exists
actions.single_target+=/wild_strike,if=(rage>rage.max-20)&target.health.pct>20
actions.single_target+=/bloodthirst,if=(!talent.unquenchable_thirst.enabled&(rage<rage.max-40))|buff.enrage.down|buff.raging_blow.stack<2
actions.single_target+=/ravager,if=buff.bloodbath.up|(!talent.bloodbath.enabled&(!raid_event.adds.exists|raid_event.adds.in>60|target.time_to_die<40))
actions.single_target+=/siegebreaker
actions.single_target+=/execute,if=buff.sudden_death.react
actions.single_target+=/storm_bolt
actions.single_target+=/wild_strike,if=buff.bloodsurge.up
actions.single_target+=/execute,if=buff.enrage.up|target.time_to_die<12
actions.single_target+=/dragon_roar,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.single_target+=/raging_blow
actions.single_target+=/wait,sec=cooldown.bloodthirst.remains,if=cooldown.bloodthirst.remains<0.5&rage<50
actions.single_target+=/wild_strike,if=buff.enrage.up&target.health.pct>20
actions.single_target+=/bladestorm,if=!raid_event.adds.exists
actions.single_target+=/shockwave,if=!talent.unquenchable_thirst.enabled
actions.single_target+=/impending_victory,if=!talent.unquenchable_thirst.enabled&target.health.pct>20
actions.single_target+=/bloodthirst

actions.two_targets=bloodbath
actions.two_targets+=/ravager,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.two_targets+=/dragon_roar,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.two_targets+=/call_action_list,name=bladestorm
actions.two_targets+=/bloodthirst,if=buff.enrage.down|rage<40|buff.raging_blow.down
actions.two_targets+=/siegebreaker
actions.two_targets+=/execute,cycle_targets=1
actions.two_targets+=/raging_blow,if=buff.meat_cleaver.up|target.health.pct<20
actions.two_targets+=/whirlwind,if=!buff.meat_cleaver.up&target.health.pct>20
actions.two_targets+=/wild_strike,if=buff.bloodsurge.up
actions.two_targets+=/bloodthirst
actions.two_targets+=/whirlwind

actions.three_targets=bloodbath
actions.three_targets+=/ravager,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.three_targets+=/call_action_list,name=bladestorm
actions.three_targets+=/bloodthirst,if=buff.enrage.down|rage<50|buff.raging_blow.down
actions.three_targets+=/raging_blow,if=buff.meat_cleaver.stack>=2
actions.three_targets+=/siegebreaker
actions.three_targets+=/execute,cycle_targets=1
actions.three_targets+=/dragon_roar,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.three_targets+=/whirlwind,if=target.health.pct>20
actions.three_targets+=/bloodthirst
actions.three_targets+=/wild_strike,if=buff.bloodsurge.up
actions.three_targets+=/raging_blow

actions.aoe=bloodbath
actions.aoe+=/ravager,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.aoe+=/raging_blow,if=buff.meat_cleaver.stack>=3&buff.enrage.up
actions.aoe+=/bloodthirst,if=buff.enrage.down|rage<50|buff.raging_blow.down
actions.aoe+=/raging_blow,if=buff.meat_cleaver.stack>=3
actions.aoe+=/call_action_list,name=bladestorm
actions.aoe+=/whirlwind
actions.aoe+=/siegebreaker
actions.aoe+=/execute,if=buff.sudden_death.react
actions.aoe+=/dragon_roar,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.aoe+=/bloodthirst
actions.aoe+=/wild_strike,if=buff.bloodsurge.up

# oh god why
actions.bladestorm=recklessness,sync=bladestorm,if=buff.enrage.remains>6&((talent.anger_management.enabled&raid_event.adds.in>45)|(!talent.anger_management.enabled&raid_event.adds.in>60)|!raid_event.adds.exists|active_enemies>desired_targets)
actions.bladestorm+=/bladestorm,if=buff.enrage.remains>6&((talent.anger_management.enabled&raid_event.adds.in>45)|(!talent.anger_management.enabled&raid_event.adds.in>60)|!raid_event.adds.exists|active_enemies>desired_targets)

head=blackhands_faceguard,id=115584,bonus_id=567
neck=vertebrae_protector,id=113900,bonus_id=567,enchant=gift_of_critical_strike
shoulders=blackhands_shoulderguards,id=115581,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_critical_strike
chest=blackhands_chestguard,id=115582,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=gauntlets_of_dramatic_blows,id=113906,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=blackhands_legguards,id=115580,bonus_id=567
feet=doomslag_greatboots,id=119341,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_critical_strike
finger2=seal_of_the_savage_howl,id=113940,bonus_id=567,enchant=gift_of_critical_strike
trinket1=vial_of_convulsive_shadows,id=113969,bonus_id=567
trinket2=horn_of_screaming_spirits,id=119193,bonus_id=567
main_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=mark_of_the_thunderlord
off_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=mark_of_the_thunderlord

# Gear Summary
# gear_ilvl=700.94
# gear_strength=3945
# gear_stamina=4694
# gear_crit_rating=1714
# gear_haste_rating=917
# gear_mastery_rating=1282
# gear_armor=2287
# gear_multistrike_rating=478
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Warrior_Fury_2h_T17M.simc"] = [[
warrior="Warrior_Fury_2h_T17M"
level=100
race=tauren
role=attack
position=back
talents=1321321
talent_override=bladestorm,if=raid_event.adds.count>=1|enemies>1
talent_override=dragon_roar,if=raid_event.adds.count>=1|enemies>1
talent_override=ravager,if=raid_event.adds.cooldown>=60&raid_event.adds.exists
glyphs=unending_rage/raging_wind/heroic_leap
spec=fury

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_strength_flask
actions.precombat+=/food,type=pickled_eel
actions.precombat+=/stance,choose=battle
# Snapshot raid buffed stats before combat begins and pre-potting is done.
# Generic on-use trinket line if needed when swapping trinkets out.
#actions+=/use_item,slot=trinket1,if=active_enemies=1&(buff.bloodbath.up|(!talent.bloodbath.enabled&(buff.avatar.up|!talent.avatar.enabled)))|(active_enemies>=2&buff.ravager.up)
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_strength

# Executed every time the actor is available.

actions=charge,if=debuff.charge.down
actions+=/auto_attack
# This is mostly to prevent cooldowns from being accidentally used during movement.
actions+=/run_action_list,name=movement,if=movement.distance>5
actions+=/berserker_rage,if=buff.enrage.down|(prev_gcd.bloodthirst&buff.raging_blow.stack<2)
actions+=/heroic_leap,if=(raid_event.movement.distance>25&raid_event.movement.in>45)|!raid_event.movement.exists
actions+=/use_item,name=vial_of_convulsive_shadows,if=(active_enemies>1|!raid_event.adds.exists)&((talent.bladestorm.enabled&cooldown.bladestorm.remains=0)|buff.recklessness.up|target.time_to_die<25|!talent.anger_management.enabled)
actions+=/potion,name=draenic_strength,if=(target.health.pct<20&buff.recklessness.up)|target.time_to_die<=25
# Skip cooldown usage if we can line them up with bladestorm on a large set of adds, or if movement is coming soon.
actions+=/run_action_list,name=single_target,if=(raid_event.adds.cooldown<60&raid_event.adds.count>2&active_enemies=1)|raid_event.movement.cooldown<5
# This incredibly long line (Due to differing talent choices) says 'Use recklessness on cooldown, unless the boss will die before the ability is usable again, and then use it with execute.'
actions+=/recklessness,if=(((target.time_to_die>190|target.health.pct<20)&(buff.bloodbath.up|!talent.bloodbath.enabled))|target.time_to_die<=12|talent.anger_management.enabled)&((talent.bladestorm.enabled&(!raid_event.adds.exists|enemies=1))|!talent.bladestorm.enabled)
actions+=/avatar,if=buff.recklessness.up|cooldown.recklessness.remains>60|target.time_to_die<30
actions+=/blood_fury,if=buff.bloodbath.up|!talent.bloodbath.enabled|buff.recklessness.up
actions+=/berserking,if=buff.bloodbath.up|!talent.bloodbath.enabled|buff.recklessness.up
actions+=/arcane_torrent,if=rage<rage.max-40
actions+=/call_action_list,name=single_target,if=active_enemies=1
actions+=/call_action_list,name=two_targets,if=active_enemies=2
actions+=/call_action_list,name=three_targets,if=active_enemies=3
actions+=/call_action_list,name=aoe,if=active_enemies>3

actions.movement=heroic_leap
actions.movement+=/charge,cycle_targets=1,if=debuff.charge.down
# If possible, charge a target that will give rage. Otherwise, just charge to get back in range.
actions.movement+=/charge
# May as well throw storm bolt if we can.
actions.movement+=/storm_bolt
actions.movement+=/heroic_throw

actions.single_target=bloodbath
actions.single_target+=/recklessness,if=target.health.pct<20&raid_event.adds.exists
actions.single_target+=/wild_strike,if=(rage>rage.max-20)&target.health.pct>20
actions.single_target+=/bloodthirst,if=(!talent.unquenchable_thirst.enabled&(rage<rage.max-40))|buff.enrage.down|buff.raging_blow.stack<2
actions.single_target+=/ravager,if=buff.bloodbath.up|(!talent.bloodbath.enabled&(!raid_event.adds.exists|raid_event.adds.in>60|target.time_to_die<40))
actions.single_target+=/siegebreaker
actions.single_target+=/execute,if=buff.sudden_death.react
actions.single_target+=/storm_bolt
actions.single_target+=/wild_strike,if=buff.bloodsurge.up
actions.single_target+=/execute,if=buff.enrage.up|target.time_to_die<12
actions.single_target+=/dragon_roar,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.single_target+=/raging_blow
actions.single_target+=/wait,sec=cooldown.bloodthirst.remains,if=cooldown.bloodthirst.remains<0.5&rage<50
actions.single_target+=/wild_strike,if=buff.enrage.up&target.health.pct>20
actions.single_target+=/bladestorm,if=!raid_event.adds.exists
actions.single_target+=/shockwave,if=!talent.unquenchable_thirst.enabled
actions.single_target+=/impending_victory,if=!talent.unquenchable_thirst.enabled&target.health.pct>20
actions.single_target+=/bloodthirst

actions.two_targets=bloodbath
actions.two_targets+=/ravager,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.two_targets+=/dragon_roar,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.two_targets+=/call_action_list,name=bladestorm
actions.two_targets+=/bloodthirst,if=buff.enrage.down|rage<40|buff.raging_blow.down
actions.two_targets+=/siegebreaker
actions.two_targets+=/execute,cycle_targets=1
actions.two_targets+=/raging_blow,if=buff.meat_cleaver.up|target.health.pct<20
actions.two_targets+=/whirlwind,if=!buff.meat_cleaver.up&target.health.pct>20
actions.two_targets+=/wild_strike,if=buff.bloodsurge.up
actions.two_targets+=/bloodthirst
actions.two_targets+=/whirlwind

actions.three_targets=bloodbath
actions.three_targets+=/ravager,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.three_targets+=/call_action_list,name=bladestorm
actions.three_targets+=/bloodthirst,if=buff.enrage.down|rage<50|buff.raging_blow.down
actions.three_targets+=/raging_blow,if=buff.meat_cleaver.stack>=2
actions.three_targets+=/siegebreaker
actions.three_targets+=/execute,cycle_targets=1
actions.three_targets+=/dragon_roar,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.three_targets+=/whirlwind,if=target.health.pct>20
actions.three_targets+=/bloodthirst
actions.three_targets+=/wild_strike,if=buff.bloodsurge.up
actions.three_targets+=/raging_blow

actions.aoe=bloodbath
actions.aoe+=/ravager,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.aoe+=/raging_blow,if=buff.meat_cleaver.stack>=3&buff.enrage.up
actions.aoe+=/bloodthirst,if=buff.enrage.down|rage<50|buff.raging_blow.down
actions.aoe+=/raging_blow,if=buff.meat_cleaver.stack>=3
actions.aoe+=/call_action_list,name=bladestorm
actions.aoe+=/whirlwind
actions.aoe+=/siegebreaker
actions.aoe+=/execute,if=buff.sudden_death.react
actions.aoe+=/dragon_roar,if=buff.bloodbath.up|!talent.bloodbath.enabled
actions.aoe+=/bloodthirst
actions.aoe+=/wild_strike,if=buff.bloodsurge.up

# oh god why
actions.bladestorm=recklessness,sync=bladestorm,if=buff.enrage.remains>6&((talent.anger_management.enabled&raid_event.adds.in>45)|(!talent.anger_management.enabled&raid_event.adds.in>60)|!raid_event.adds.exists|active_enemies>desired_targets)
actions.bladestorm+=/bladestorm,if=buff.enrage.remains>6&((talent.anger_management.enabled&raid_event.adds.in>45)|(!talent.anger_management.enabled&raid_event.adds.in>60)|!raid_event.adds.exists|active_enemies>desired_targets)

head=blackhands_faceguard,id=115584,bonus_id=567
neck=vertebrae_protector,id=113900,bonus_id=567,enchant=gift_of_critical_strike
shoulders=blackhands_shoulderguards,id=115581,bonus_id=567
back=cloak_of_sanguine_terror,id=113972,bonus_id=567,enchant=gift_of_critical_strike
chest=blackhands_chestguard,id=115582,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=gauntlets_of_dramatic_blows,id=113906,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=blackhands_legguards,id=115580,bonus_id=567
feet=doomslag_greatboots,id=119341,bonus_id=567
finger1=spellbound_runic_band_of_elemental_power,id=118305,enchant=gift_of_critical_strike
finger2=seal_of_the_savage_howl,id=113940,bonus_id=567,enchant=gift_of_critical_strike
trinket1=vial_of_convulsive_shadows,id=113969,bonus_id=567
trinket2=horn_of_screaming_spirits,id=119193,bonus_id=567
main_hand=the_black_hand,id=113979,bonus_id=567,enchant=mark_of_the_thunderlord
off_hand=the_black_hand,id=113979,bonus_id=567,enchant=mark_of_the_thunderlord

# Gear Summary
# gear_ilvl=700.94
# gear_strength=4313
# gear_stamina=5244
# gear_crit_rating=2148
# gear_haste_rating=751
# gear_mastery_rating=1504
# gear_armor=2287
# gear_multistrike_rating=478
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Warrior_Gladiator_T17M.simc"] = [[
warrior="Warrior_Gladiator_T17M"
level=100
race=tauren
role=attack
position=back
talents=1133323
talent_override=bladestorm,if=raid_event.adds.count>=1|enemies>1
talent_override=dragon_roar,if=raid_event.adds.count>=1|enemies>1
glyphs=unending_rage/heroic_leap/cleave
spec=protection

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_strength_flask
actions.precombat+=/food,type=pickled_eel
actions.precombat+=/stance,choose=gladiator
# Snapshot raid buffed stats before combat begins and pre-potting is done.
# Generic on-use trinket line if needed when swapping trinkets out.
#actions+=/use_item,slot=trinket1,if=buff.bloodbath.up|buff.avatar.up|buff.shield_charge.up|target.time_to_die<10
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=draenic_armor

# Executed every time the actor is available.

actions=charge
actions+=/auto_attack
# This is mostly to prevent cooldowns from being accidentally used during movement.
actions+=/run_action_list,name=movement,if=movement.distance>5
actions+=/avatar
actions+=/bloodbath
actions+=/use_item,name=vial_of_convulsive_shadows,if=buff.bloodbath.up|buff.avatar.up|buff.shield_charge.up|target.time_to_die<15
actions+=/blood_fury,if=buff.bloodbath.up|buff.avatar.up|buff.shield_charge.up|target.time_to_die<10
actions+=/berserking,if=buff.bloodbath.up|buff.avatar.up|buff.shield_charge.up|target.time_to_die<10
actions+=/arcane_torrent,if=rage<rage.max-40
actions+=/potion,name=draenic_armor,if=buff.bloodbath.up|buff.avatar.up|buff.shield_charge.up
actions+=/shield_charge,if=(!buff.shield_charge.up&!cooldown.shield_slam.remains)|charges=2
actions+=/berserker_rage,if=buff.enrage.down
actions+=/heroic_leap,if=(raid_event.movement.distance>25&raid_event.movement.in>45)|!raid_event.movement.exists
actions+=/heroic_strike,if=buff.unyielding_strikes.up&rage>=92-buff.unyielding_strikes.stack*12&target.health.pct>20
actions+=/heroic_strike,if=buff.shield_charge.up&target.health.pct>20
actions+=/heroic_strike,if=buff.shield_charge.up&target.health.pct<20&buff.unyielding_strikes.stack>3
actions+=/heroic_strike,if=buff.ultimatum.up|(rage>=rage.max-20)
actions+=/heroic_strike,if=target.time_to_die<10|buff.unyielding_strikes.stack>4
actions+=/call_action_list,name=single,if=active_enemies=1
actions+=/call_action_list,name=aoe,if=active_enemies>=2

actions.movement=heroic_leap
actions.movement+=/shield_charge
# May as well throw storm bolt if we can.
actions.movement+=/storm_bolt
actions.movement+=/heroic_throw

actions.single=devastate,if=buff.unyielding_strikes.stack>0&buff.unyielding_strikes.stack<6&buff.unyielding_strikes.remains<1.5
actions.single+=/shield_slam
actions.single+=/revenge
actions.single+=/execute,if=buff.sudden_death.react
actions.single+=/storm_bolt
actions.single+=/dragon_roar,if=buff.unyielding_strikes.stack=5
actions.single+=/execute,if=rage>=50
actions.single+=/devastate

actions.aoe=revenge
actions.aoe+=/shield_slam
actions.aoe+=/dragon_roar,if=(buff.bloodbath.up|cooldown.bloodbath.remains>10)|!talent.bloodbath.enabled
actions.aoe+=/storm_bolt,if=(buff.bloodbath.up|cooldown.bloodbath.remains>7)|!talent.bloodbath.enabled
actions.aoe+=/thunder_clap,cycle_targets=1,if=dot.deep_wounds.remains<3&active_enemies>4
actions.aoe+=/bladestorm,if=buff.shield_charge.down
actions.aoe+=/execute,if=buff.sudden_death.react
actions.aoe+=/thunder_clap,if=active_enemies>6
actions.aoe+=/devastate,cycle_targets=1,if=dot.deep_wounds.remains<5&cooldown.shield_slam.remains>execute_time*0.4
actions.aoe+=/devastate,if=cooldown.shield_slam.remains>execute_time*0.4

head=blackhands_faceguard,id=115584,bonus_id=567
neck=gluttons_kerchief,id=113882,bonus_id=567,enchant_id=5317
shoulders=blackhands_shoulderguards,id=115581,bonus_id=567
back=gronnstitched_greatcloak,id=113873,bonus_id=567,enchant_id=5310
chest=blackhands_chestguard,id=115582,bonus_id=567
wrists=bracers_of_visceral_force,id=119331,bonus_id=567
hands=blackhands_handguards,id=115583,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=blackhands_legguards,id=115580,bonus_id=567
feet=iron_bellow_sabatons,id=113961,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_critical_strike
finger2=siege_bombers_band,id=113963,bonus_id=567,enchant_id=5324
trinket1=vial_of_convulsive_shadows,id=113969,bonus_id=567
trinket2=blast_furnace_door,id=113893,bonus_id=567
main_hand=taners_terrible_spine,id=113862,bonus_id=567,enchant_id=5330
off_hand=kromogs_protecting_palm,id=113926,bonus_id=567

# Gear Summary
# gear_ilvl=700.94
# gear_strength=3614
# gear_stamina=4759
# gear_crit_rating=1362
# gear_haste_rating=815
# gear_mastery_rating=717
# gear_armor=3082
# gear_bonus_armor=989
# gear_multistrike_rating=697
# gear_versatility_rating=361
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Warrior_Protection_T17M.simc"] = [[
warrior="Warrior_Protection_T17M"
level=100
race=tauren
role=tank
position=front
talents=1113323
glyphs=unending_rage/heroic_leap/cleave
spec=protection

# This default action priority list is automatically created based on your character.
# It is a attempt to provide you with a action list that is both simple and practicable,
# while resulting in a meaningful and good simulation. It may not result in the absolutely highest possible dps.
# Feel free to edit, adapt and improve it to your own needs.
# SimulationCraft is always looking for updates and improvements to the default action lists.

# Executed before combat begins. Accepts non-harmful actions only.

actions.precombat=flask,type=greater_draenic_stamina_flask
actions.precombat+=/food,type=sleeper_sushi
actions.precombat+=/stance,choose=defensive
# Snapshot raid buffed stats before combat begins and pre-potting is done.
# Generic on-use trinket line if needed when swapping trinkets out.
#actions+=/use_item,slot=trinket1,if=buff.bloodbath.up|buff.avatar.up|target.time_to_die<10
actions.precombat+=/snapshot_stats
actions.precombat+=/shield_wall
actions.precombat+=/potion,name=draenic_armor

# Executed every time the actor is available.

actions=charge
actions+=/auto_attack
actions+=/use_item,name=tablet_of_turnbuckle_teamwork,if=active_enemies=1&(buff.bloodbath.up|!talent.bloodbath.enabled)|(active_enemies>=2&buff.ravager_protection.up)
actions+=/blood_fury,if=buff.bloodbath.up|buff.avatar.up
actions+=/berserking,if=buff.bloodbath.up|buff.avatar.up
actions+=/arcane_torrent,if=buff.bloodbath.up|buff.avatar.up
actions+=/berserker_rage,if=buff.enrage.down
actions+=/call_action_list,name=prot

actions.prot=shield_block,if=!(debuff.demoralizing_shout.up|buff.ravager_protection.up|buff.shield_wall.up|buff.last_stand.up|buff.enraged_regeneration.up|buff.shield_block.up)
actions.prot+=/shield_barrier,if=buff.shield_barrier.down&((buff.shield_block.down&action.shield_block.charges_fractional<0.75)|rage>=85)
actions.prot+=/demoralizing_shout,if=incoming_damage_2500ms>health.max*0.1&!(debuff.demoralizing_shout.up|buff.ravager_protection.up|buff.shield_wall.up|buff.last_stand.up|buff.enraged_regeneration.up|buff.shield_block.up|buff.potion.up)
actions.prot+=/enraged_regeneration,if=incoming_damage_2500ms>health.max*0.1&!(debuff.demoralizing_shout.up|buff.ravager_protection.up|buff.shield_wall.up|buff.last_stand.up|buff.enraged_regeneration.up|buff.shield_block.up|buff.potion.up)
actions.prot+=/shield_wall,if=incoming_damage_2500ms>health.max*0.1&!(debuff.demoralizing_shout.up|buff.ravager_protection.up|buff.shield_wall.up|buff.last_stand.up|buff.enraged_regeneration.up|buff.shield_block.up|buff.potion.up)
actions.prot+=/last_stand,if=incoming_damage_2500ms>health.max*0.1&!(debuff.demoralizing_shout.up|buff.ravager_protection.up|buff.shield_wall.up|buff.last_stand.up|buff.enraged_regeneration.up|buff.shield_block.up|buff.potion.up)
actions.prot+=/potion,name=draenic_armor,if=incoming_damage_2500ms>health.max*0.1&!(debuff.demoralizing_shout.up|buff.ravager_protection.up|buff.shield_wall.up|buff.last_stand.up|buff.enraged_regeneration.up|buff.shield_block.up|buff.potion.up)|target.time_to_die<=25
actions.prot+=/stoneform,if=incoming_damage_2500ms>health.max*0.1&!(debuff.demoralizing_shout.up|buff.ravager_protection.up|buff.shield_wall.up|buff.last_stand.up|buff.enraged_regeneration.up|buff.shield_block.up|buff.potion.up)
actions.prot+=/call_action_list,name=prot_aoe,if=active_enemies>3
actions.prot+=/heroic_strike,if=buff.ultimatum.up|(talent.unyielding_strikes.enabled&buff.unyielding_strikes.stack>=6)
actions.prot+=/bloodbath,if=talent.bloodbath.enabled&((cooldown.dragon_roar.remains=0&talent.dragon_roar.enabled)|(cooldown.storm_bolt.remains=0&talent.storm_bolt.enabled)|talent.shockwave.enabled)
actions.prot+=/avatar,if=talent.avatar.enabled&((cooldown.ravager.remains=0&talent.ravager.enabled)|(cooldown.dragon_roar.remains=0&talent.dragon_roar.enabled)|(talent.storm_bolt.enabled&cooldown.storm_bolt.remains=0)|(!(talent.dragon_roar.enabled|talent.ravager.enabled|talent.storm_bolt.enabled)))
actions.prot+=/shield_slam
actions.prot+=/revenge
actions.prot+=/ravager
actions.prot+=/storm_bolt
actions.prot+=/dragon_roar
actions.prot+=/impending_victory,if=talent.impending_victory.enabled&cooldown.shield_slam.remains<=execute_time
actions.prot+=/victory_rush,if=!talent.impending_victory.enabled&cooldown.shield_slam.remains<=execute_time
actions.prot+=/execute,if=buff.sudden_death.react
actions.prot+=/devastate

actions.prot_aoe=bloodbath
actions.prot_aoe+=/avatar
actions.prot_aoe+=/thunder_clap,if=!dot.deep_wounds.ticking
actions.prot_aoe+=/heroic_strike,if=buff.ultimatum.up|rage>110|(talent.unyielding_strikes.enabled&buff.unyielding_strikes.stack>=6)
actions.prot_aoe+=/heroic_leap,if=(raid_event.movement.distance>25&raid_event.movement.in>45)|!raid_event.movement.exists
actions.prot_aoe+=/shield_slam,if=buff.shield_block.up
actions.prot_aoe+=/ravager,if=(buff.avatar.up|cooldown.avatar.remains>10)|!talent.avatar.enabled
actions.prot_aoe+=/dragon_roar,if=(buff.bloodbath.up|cooldown.bloodbath.remains>10)|!talent.bloodbath.enabled
actions.prot_aoe+=/shockwave
actions.prot_aoe+=/revenge
actions.prot_aoe+=/thunder_clap
actions.prot_aoe+=/bladestorm
actions.prot_aoe+=/shield_slam
actions.prot_aoe+=/storm_bolt
actions.prot_aoe+=/shield_slam
actions.prot_aoe+=/execute,if=buff.sudden_death.react
actions.prot_aoe+=/devastate

head=hardened_greathelm,id=113910,bonus_id=567
neck=choker_of_bestial_force,id=113952,bonus_id=567,enchant=gift_of_mastery
shoulders=blackhands_shoulderguards,id=115581,bonus_id=567
back=ravenous_greatcloak,id=113883,bonus_id=567,enchant=gift_of_mastery
chest=blackhands_chestguard,id=115582,bonus_id=567
wrists=bracers_of_martial_perfection,id=113871,bonus_id=567
hands=blackhands_handguards,id=115583,bonus_id=567
waist=uktars_belt_of_chiming_rings,id=113976,bonus_id=567
legs=blackhands_legguards,id=115580,bonus_id=567
feet=doomslag_greatboots,id=119341,bonus_id=567
finger1=spellbound_runic_band_of_elemental_invincibility,id=118308,enchant=gift_of_mastery
finger2=razoredge_blade_ring,id=113908,bonus_id=567,enchant=gift_of_mastery
trinket1=tablet_of_turnbuckle_teamwork,id=113905,bonus_id=567
trinket2=blast_furnace_door,id=113893,bonus_id=567
main_hand=kromogs_brutal_fist,id=113927,bonus_id=567,enchant=mark_of_blackrock
off_hand=kromogs_protecting_palm,id=113926,bonus_id=567

# Gear Summary
# gear_ilvl=700.94
# gear_strength=3171
# gear_stamina=4759
# gear_crit_rating=726
# gear_haste_rating=603
# gear_mastery_rating=2474
# gear_armor=3082
# gear_bonus_armor=987
# gear_multistrike_rating=141
# gear_versatility_rating=581
# set_bonus=tier17_2pc=1
# set_bonus=tier17_4pc=1
]]

private.apls["Warrior_T17M.simc"] = [[
Warrior_Fury_1h_T17M.simc
Warrior_Fury_2h_T17M.simc
Warrior_Protection_T17M.simc
Warrior_Gladiator_T17M.simc
Warrior_Arms_T17M.simc]]
