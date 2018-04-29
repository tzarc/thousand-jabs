--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Legion only.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(4, GetBuildInfo()) >= 80000 then
    return
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if select(3, UnitClass('player')) ~= 6 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')

TJ:RegisterActionProfileList('custom::deathknight::blood', 'Thousand Jabs Custom Death Knight Profile: Blood', 6, 1, [[
actions=auto_attack
actions+=/mind_freeze
actions+=/call_action_list,name=st,if=active_enemies=1
actions+=/call_action_list,name=cleave,if=active_enemies=2
actions+=/call_action_list,name=aoe,if=active_enemies>=3
actions.st=blood_boil,if=debuff.blood_plague.down
actions.st+=/death_strike,if=runic_power>95
actions.st+=/death_and_decay,if=buff.crimson_scourge.up
actions.st+=/marrowrend,if=buff.bone_shield.stack<5
actions.st+=/death_strike,if=runic_power>80
actions.st+=/death_strike,if=incoming_damage_3s>health.max*0.25
actions.st+=/blood_boil,if=buff.bone_shield.stack<5
actions.st+=/death_and_decay
actions.st+=/consumption
actions.st+=/heart_strike
actions.cleave=blood_boil,if=debuff.blood_plague.down
actions.cleave+=/death_strike,if=runic_power>95
actions.cleave+=/death_and_decay,if=buff.crimson_scourge.up
actions.cleave+=/marrowrend,if=buff.bone_shield.stack<5
actions.cleave+=/blood_boil,if=buff.bone_shield.stack<5
actions.cleave+=/death_strike,if=runic_power>80
actions.cleave+=/death_strike,if=incoming_damage_3s>health.max*0.25
actions.cleave+=/death_and_decay
actions.cleave+=/consumption
actions.cleave+=/heart_strike
actions.aoe=blood_boil,if=debuff.blood_plague.down
actions.aoe+=/death_strike,if=runic_power>95
actions.aoe+=/death_and_decay,if=buff.crimson_scourge.up
actions.aoe+=/marrowrend,if=buff.bone_shield.stack<1
actions.aoe+=/blood_boil,if=buff.bone_shield.stack<1
actions.aoe+=/death_strike,if=runic_power>80
actions.aoe+=/death_strike,if=incoming_damage_3s>health.max*0.25
actions.aoe+=/death_and_decay
actions.aoe+=/consumption
actions.aoe+=/heart_strike
]])

TJ:RegisterActionProfileList('simc::deathknight::blood', 'Simulationcraft Death Knight Profile: Blood', 6, 1, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions=auto_attack
actions+=/mind_freeze
actions+=/arcane_torrent,if=runic_power.deficit>20
actions+=/blood_fury
actions+=/berserking,if=buff.dancing_rune_weapon.up
actions+=/use_items
actions+=/use_item,name=archimondes_hatred_reborn,if=buff.vampiric_blood.up
actions+=/potion,if=buff.dancing_rune_weapon.up
actions+=/dancing_rune_weapon,if=(!talent.blooddrinker.enabled|!cooldown.blooddrinker.ready)&!cooldown.death_and_decay.ready
actions+=/vampiric_blood,if=!equipped.archimondes_hatred_reborn|cooldown.trinket.ready
actions+=/tombstone,if=buff.bone_shield.stack>=7
actions+=/call_action_list,name=standard
actions.standard=death_strike,if=runic_power.deficit<10
actions.standard+=/death_and_decay,if=talent.rapid_decomposition.enabled&!buff.dancing_rune_weapon.up
actions.standard+=/blooddrinker,if=!buff.dancing_rune_weapon.up
actions.standard+=/marrowrend,if=buff.bone_shield.remains<=gcd*2
actions.standard+=/blood_boil,if=charges_fractional>=1.8&buff.haemostasis.stack<5&(buff.haemostasis.stack<3|!buff.dancing_rune_weapon.up)
actions.standard+=/marrowrend,if=(buff.bone_shield.stack<5&talent.ossuary.enabled)|buff.bone_shield.remains<gcd*3
actions.standard+=/bonestorm,if=runic_power>=100&spell_targets.bonestorm>=3
actions.standard+=/death_strike,if=buff.blood_shield.up|(runic_power.deficit<15&(runic_power.deficit<25|!buff.dancing_rune_weapon.up))
actions.standard+=/consumption
actions.standard+=/heart_strike,if=buff.dancing_rune_weapon.up
actions.standard+=/death_and_decay,if=buff.crimson_scourge.up
actions.standard+=/blood_boil,if=buff.haemostasis.stack<5&(buff.haemostasis.stack<3|!buff.dancing_rune_weapon.up)
actions.standard+=/death_and_decay
actions.standard+=/heart_strike,if=rune.time_to_3<gcd|buff.bone_shield.stack>6
]])

TJ:RegisterActionProfileList('simc::deathknight::frost', 'Simulationcraft Death Knight Profile: Frost', 6, 2, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions=auto_attack
actions+=/mind_freeze
actions+=/call_action_list,name=cooldowns
actions+=/run_action_list,name=bos_pooling,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains<15
actions+=/run_action_list,name=bos_ticking,if=dot.breath_of_sindragosa.ticking
actions+=/run_action_list,name=obliteration,if=buff.obliteration.up
actions+=/call_action_list,name=standard
actions.bos_pooling=remorseless_winter,if=talent.gathering_storm.enabled
actions.bos_pooling+=/howling_blast,if=buff.rime.up&rune.time_to_4<(gcd*2)
actions.bos_pooling+=/obliterate,if=rune.time_to_6<gcd&!talent.gathering_storm.enabled
actions.bos_pooling+=/obliterate,if=rune.time_to_4<gcd&(cooldown.breath_of_sindragosa.remains|runic_power.deficit>=30)
actions.bos_pooling+=/frost_strike,if=runic_power.deficit<5&set_bonus.tier19_4pc&cooldown.breath_of_sindragosa.remains&(!talent.shattering_strikes.enabled|debuff.razorice.stack<5|cooldown.breath_of_sindragosa.remains>6)
actions.bos_pooling+=/remorseless_winter,if=buff.rime.up&equipped.perseverance_of_the_ebon_martyr
actions.bos_pooling+=/howling_blast,if=buff.rime.up&(buff.remorseless_winter.up|cooldown.remorseless_winter.remains>gcd|(!equipped.perseverance_of_the_ebon_martyr&!talent.gathering_storm.enabled))
actions.bos_pooling+=/obliterate,if=!buff.rime.up&!(talent.gathering_storm.enabled&!(cooldown.remorseless_winter.remains>(gcd*2)|rune>4))&rune>3
actions.bos_pooling+=/sindragosas_fury,if=(equipped.consorts_cold_core|buff.pillar_of_frost.up)&buff.unholy_strength.react&debuff.razorice.stack=5
actions.bos_pooling+=/frost_strike,if=runic_power.deficit<30&(!talent.shattering_strikes.enabled|debuff.razorice.stack<5|cooldown.breath_of_sindragosa.remains>rune.time_to_4)
actions.bos_pooling+=/frostscythe,if=buff.killing_machine.react&(!equipped.koltiras_newfound_will|spell_targets.frostscythe>=2)
actions.bos_pooling+=/glacial_advance,if=spell_targets.glacial_advance>=2
actions.bos_pooling+=/remorseless_winter,if=spell_targets.remorseless_winter>=2
actions.bos_pooling+=/frostscythe,if=spell_targets.frostscythe>=3
actions.bos_pooling+=/frost_strike,if=(cooldown.remorseless_winter.remains<(gcd*2)|buff.gathering_storm.stack=10)&cooldown.breath_of_sindragosa.remains>rune.time_to_4&talent.gathering_storm.enabled&(!talent.shattering_strikes.enabled|debuff.razorice.stack<5|cooldown.breath_of_sindragosa.remains>6)
actions.bos_pooling+=/obliterate,if=!buff.rime.up&(!talent.gathering_storm.enabled|cooldown.remorseless_winter.remains>gcd)
actions.bos_pooling+=/frost_strike,if=cooldown.breath_of_sindragosa.remains>rune.time_to_4&(!talent.shattering_strikes.enabled|debuff.razorice.stack<5|cooldown.breath_of_sindragosa.remains>6)
actions.bos_ticking=frost_strike,if=talent.shattering_strikes.enabled&runic_power<40&rune.time_to_2>2&cooldown.empower_rune_weapon.remains&debuff.razorice.stack=5&(cooldown.horn_of_winter.remains|!talent.horn_of_winter.enabled)
actions.bos_ticking+=/remorseless_winter,if=runic_power>=30&((buff.rime.up&equipped.perseverance_of_the_ebon_martyr)|(talent.gathering_storm.enabled&(buff.remorseless_winter.remains<=gcd|!buff.remorseless_winter.remains)))
actions.bos_ticking+=/howling_blast,if=((runic_power>=20&set_bonus.tier19_4pc)|runic_power>=30)&buff.rime.up
actions.bos_ticking+=/frost_strike,if=set_bonus.tier20_2pc&runic_power.deficit<=15&rune<=3&buff.pillar_of_frost.up&!talent.shattering_strikes.enabled
actions.bos_ticking+=/obliterate,if=runic_power<=45|rune.time_to_5<gcd
actions.bos_ticking+=/sindragosas_fury,if=(equipped.consorts_cold_core|buff.pillar_of_frost.up)&buff.unholy_strength.react&debuff.razorice.stack=5
actions.bos_ticking+=/horn_of_winter,if=runic_power.deficit>=30&rune.time_to_3>gcd
actions.bos_ticking+=/frostscythe,if=buff.killing_machine.react&(!equipped.koltiras_newfound_will|talent.gathering_storm.enabled|spell_targets.frostscythe>=2)
actions.bos_ticking+=/glacial_advance,if=spell_targets.glacial_advance>=2
actions.bos_ticking+=/remorseless_winter,if=spell_targets.remorseless_winter>=2
actions.bos_ticking+=/obliterate,if=runic_power.deficit>25|rune>3
actions.bos_ticking+=/empower_rune_weapon,if=runic_power<30&rune.time_to_2>gcd
actions.cold_heart=chains_of_ice,if=buff.cold_heart.stack=20&buff.unholy_strength.react&cooldown.pillar_of_frost.remains>6
actions.cold_heart+=/chains_of_ice,if=buff.cold_heart.stack>=16&(cooldown.obliteration.ready&talent.obliteration.enabled)&buff.pillar_of_frost.up
actions.cold_heart+=/chains_of_ice,if=buff.pillar_of_frost.up&buff.pillar_of_frost.remains<gcd&(buff.cold_heart.stack>=11|(buff.cold_heart.stack>=10&set_bonus.tier20_4pc))
actions.cold_heart+=/chains_of_ice,if=buff.cold_heart.stack>=17&buff.unholy_strength.react&buff.unholy_strength.remains<gcd&cooldown.pillar_of_frost.remains>6
actions.cold_heart+=/chains_of_ice,if=buff.cold_heart.stack>=13&buff.unholy_strength.react&talent.shattering_strikes.enabled
actions.cold_heart+=/chains_of_ice,if=buff.cold_heart.stack>=4&target.time_to_die<=gcd
actions.cooldowns=arcane_torrent,if=runic_power.deficit>=20&!talent.breath_of_sindragosa.enabled
actions.cooldowns+=/arcane_torrent,if=dot.breath_of_sindragosa.ticking&runic_power.deficit>=50&rune<2
actions.cooldowns+=/blood_fury,if=buff.pillar_of_frost.up
actions.cooldowns+=/berserking,if=buff.pillar_of_frost.up
actions.cooldowns+=/use_items
actions.cooldowns+=/use_item,name=ring_of_collapsing_futures,if=(buff.temptation.stack=0&target.time_to_die>60)|target.time_to_die<60
actions.cooldowns+=/use_item,name=horn_of_valor,if=buff.pillar_of_frost.up&(!talent.breath_of_sindragosa.enabled|!cooldown.breath_of_sindragosa.remains)
actions.cooldowns+=/use_item,name=draught_of_souls,if=rune.time_to_5<3&(!dot.breath_of_sindragosa.ticking|runic_power>60)
actions.cooldowns+=/use_item,name=feloiled_infernal_machine,if=!talent.obliteration.enabled|buff.obliteration.up
actions.cooldowns+=/potion,if=buff.pillar_of_frost.up&(dot.breath_of_sindragosa.ticking|buff.obliteration.up|talent.hungering_rune_weapon.enabled)
actions.cooldowns+=/pillar_of_frost,if=talent.obliteration.enabled&(cooldown.obliteration.remains>20|cooldown.obliteration.remains<10|!talent.icecap.enabled)
actions.cooldowns+=/pillar_of_frost,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.ready&runic_power>50
actions.cooldowns+=/pillar_of_frost,if=talent.breath_of_sindragosa.enabled&cooldown.breath_of_sindragosa.remains>40
actions.cooldowns+=/pillar_of_frost,if=talent.hungering_rune_weapon.enabled
actions.cooldowns+=/breath_of_sindragosa,if=buff.pillar_of_frost.up
actions.cooldowns+=/call_action_list,name=cold_heart,if=equipped.cold_heart&((buff.cold_heart.stack>=10&!buff.obliteration.up&debuff.razorice.stack=5)|target.time_to_die<=gcd)
actions.cooldowns+=/obliteration,if=rune>=1&runic_power>=20&(!talent.frozen_pulse.enabled|rune<2|buff.pillar_of_frost.remains<=12)&(!talent.gathering_storm.enabled|!cooldown.remorseless_winter.ready)&(buff.pillar_of_frost.up|!talent.icecap.enabled)
actions.cooldowns+=/hungering_rune_weapon,if=!buff.hungering_rune_weapon.up&rune.time_to_2>gcd&runic_power<40
actions.obliteration=remorseless_winter,if=talent.gathering_storm.enabled
actions.obliteration+=/frostscythe,if=(buff.killing_machine.up&(buff.killing_machine.react|prev_gcd.1.frost_strike|prev_gcd.1.howling_blast))&spell_targets.frostscythe>1
actions.obliteration+=/obliterate,if=(buff.killing_machine.up&(buff.killing_machine.react|prev_gcd.1.frost_strike|prev_gcd.1.howling_blast))|(spell_targets.howling_blast>=3&!buff.rime.up&!talent.frostscythe.enabled)
actions.obliteration+=/howling_blast,if=buff.rime.up&spell_targets.howling_blast>1
actions.obliteration+=/howling_blast,if=!buff.rime.up&spell_targets.howling_blast>2&rune>3&talent.freezing_fog.enabled&talent.gathering_storm.enabled
actions.obliteration+=/frost_strike,if=!buff.rime.up|rune.time_to_1>=gcd|runic_power.deficit<20
actions.obliteration+=/howling_blast,if=buff.rime.up
actions.obliteration+=/obliterate
actions.standard=frost_strike,if=talent.icy_talons.enabled&buff.icy_talons.remains<=gcd
actions.standard+=/frost_strike,if=talent.shattering_strikes.enabled&debuff.razorice.stack=5&buff.gathering_storm.stack<2&!buff.rime.up
actions.standard+=/remorseless_winter,if=(buff.rime.up&equipped.perseverance_of_the_ebon_martyr)|talent.gathering_storm.enabled
actions.standard+=/obliterate,if=(equipped.koltiras_newfound_will&talent.frozen_pulse.enabled&set_bonus.tier19_2pc=1)|rune.time_to_4<gcd&buff.hungering_rune_weapon.up
actions.standard+=/frost_strike,if=(!talent.shattering_strikes.enabled|debuff.razorice.stack<5)&runic_power.deficit<10
actions.standard+=/howling_blast,if=buff.rime.up
actions.standard+=/obliterate,if=(equipped.koltiras_newfound_will&talent.frozen_pulse.enabled&set_bonus.tier19_2pc=1)|rune.time_to_5<gcd
actions.standard+=/sindragosas_fury,if=(equipped.consorts_cold_core|buff.pillar_of_frost.up)&buff.unholy_strength.react&debuff.razorice.stack=5
actions.standard+=/frost_strike,if=runic_power.deficit<10&!buff.hungering_rune_weapon.up
actions.standard+=/frostscythe,if=buff.killing_machine.react&(!equipped.koltiras_newfound_will|spell_targets.frostscythe>=2)
actions.standard+=/obliterate,if=buff.killing_machine.react
actions.standard+=/frost_strike,if=runic_power.deficit<20
actions.standard+=/remorseless_winter,if=spell_targets.remorseless_winter>=2
actions.standard+=/glacial_advance,if=spell_targets.glacial_advance>=2
actions.standard+=/frostscythe,if=spell_targets.frostscythe>=3
actions.standard+=/obliterate,if=!talent.gathering_storm.enabled|cooldown.remorseless_winter.remains>(gcd*2)
actions.standard+=/horn_of_winter,if=!buff.hungering_rune_weapon.up&(rune.time_to_2>gcd|!talent.frozen_pulse.enabled)
actions.standard+=/frost_strike,if=!(runic_power<50&talent.obliteration.enabled&cooldown.obliteration.remains<=gcd)
actions.standard+=/obliterate,if=!talent.gathering_storm.enabled|talent.icy_talons.enabled
actions.standard+=/empower_rune_weapon,if=!talent.breath_of_sindragosa.enabled|target.time_to_die<cooldown.breath_of_sindragosa.remains
]])

TJ:RegisterActionProfileList('simc::deathknight::unholy', 'Simulationcraft Death Knight Profile: Unholy', 6, 3, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/raise_dead
actions.precombat+=/army_of_the_dead
actions.precombat+=/blighted_rune_weapon
actions=auto_attack
actions+=/mind_freeze
actions+=/arcane_torrent,if=runic_power.deficit>20&(pet.valkyr_battlemaiden.active|!talent.dark_arbiter.enabled)
actions+=/blood_fury,if=pet.valkyr_battlemaiden.active|!talent.dark_arbiter.enabled
actions+=/berserking,if=pet.valkyr_battlemaiden.active|!talent.dark_arbiter.enabled
actions+=/use_items
actions+=/use_item,name=feloiled_infernal_machine,if=pet.valkyr_battlemaiden.active|!talent.dark_arbiter.enabled
actions+=/use_item,name=ring_of_collapsing_futures,if=(buff.temptation.stack=0&target.time_to_die>60)|target.time_to_die<60
actions+=/potion,if=buff.unholy_strength.react
actions+=/blighted_rune_weapon,if=debuff.festering_wound.stack<=4
actions+=/sequence,if=equipped.137075&talent.dark_arbiter.enabled&!talent.blighted_rune_weapon.enabled,name=opener:outbreak:chains_of_ice:festering_strike:festering_strike:apocalypse:festering_strike:dark_arbiter:death_coil:dark_transformation
actions+=/sequence,if=!equipped.137075&talent.dark_arbiter.enabled&!talent.blighted_rune_weapon.enabled,name=opener:outbreak:chains_of_ice:festering_strike:festering_strike:apocalypse:dark_transformation:festering_strike:dark_arbiter
actions+=/outbreak,target_if=(dot.virulent_plague.tick_time_remains+tick_time<=dot.virulent_plague.remains)&dot.virulent_plague.remains<=gcd
actions+=/call_action_list,name=cooldowns
actions+=/run_action_list,name=valkyr,if=pet.valkyr_battlemaiden.active&talent.dark_arbiter.enabled
actions+=/call_action_list,name=generic
actions.aoe=death_and_decay,if=spell_targets.death_and_decay>=2
actions.aoe+=/epidemic,if=spell_targets.epidemic>4
actions.aoe+=/scourge_strike,if=spell_targets.scourge_strike>=2&(death_and_decay.ticking|defile.ticking)
actions.aoe+=/clawing_shadows,if=spell_targets.clawing_shadows>=2&(death_and_decay.ticking|defile.ticking)
actions.aoe+=/epidemic,if=spell_targets.epidemic>2
actions.cold_heart=chains_of_ice,if=buff.unholy_strength.remains<gcd&buff.unholy_strength.react&buff.cold_heart.stack>16
actions.cold_heart+=/chains_of_ice,if=buff.master_of_ghouls.remains<gcd&buff.master_of_ghouls.up&buff.cold_heart.stack>17
actions.cold_heart+=/chains_of_ice,if=buff.cold_heart.stack=20&buff.unholy_strength.react
actions.cooldowns=call_action_list,name=cold_heart,if=equipped.cold_heart&buff.cold_heart.stack>10&!debuff.soul_reaper.up
actions.cooldowns+=/army_of_the_dead
actions.cooldowns+=/apocalypse,if=debuff.festering_wound.stack>=6
actions.cooldowns+=/dark_arbiter,if=(!equipped.137075|cooldown.dark_transformation.remains<2)&runic_power.deficit<30
actions.cooldowns+=/summon_gargoyle,if=(!equipped.137075|cooldown.dark_transformation.remains<10)&rune.time_to_4>=gcd
actions.cooldowns+=/soul_reaper,if=(debuff.festering_wound.stack>=6&cooldown.apocalypse.remains<=gcd)|(debuff.festering_wound.stack>=3&rune>=3&cooldown.apocalypse.remains>20)
actions.cooldowns+=/call_action_list,name=dt,if=cooldown.dark_transformation.ready
actions.dt=dark_transformation,if=equipped.137075&talent.dark_arbiter.enabled&(talent.shadow_infusion.enabled|cooldown.dark_arbiter.remains>52)&cooldown.dark_arbiter.remains>30&!equipped.140806
actions.dt+=/dark_transformation,if=equipped.137075&(talent.shadow_infusion.enabled|cooldown.dark_arbiter.remains>(52*1.333))&equipped.140806&cooldown.dark_arbiter.remains>(30*1.333)
actions.dt+=/dark_transformation,if=equipped.137075&target.time_to_die<cooldown.dark_arbiter.remains-8
actions.dt+=/dark_transformation,if=equipped.137075&(talent.shadow_infusion.enabled|cooldown.summon_gargoyle.remains>55)&cooldown.summon_gargoyle.remains>35
actions.dt+=/dark_transformation,if=equipped.137075&target.time_to_die<cooldown.summon_gargoyle.remains-8
actions.dt+=/dark_transformation,if=!equipped.137075&rune.time_to_4>=gcd
actions.generic=scourge_strike,if=debuff.soul_reaper.up&debuff.festering_wound.up
actions.generic+=/clawing_shadows,if=debuff.soul_reaper.up&debuff.festering_wound.up
actions.generic+=/death_coil,if=runic_power.deficit<22&(talent.shadow_infusion.enabled|(!talent.dark_arbiter.enabled|cooldown.dark_arbiter.remains>5))
actions.generic+=/death_coil,if=!buff.necrosis.up&buff.sudden_doom.react&((!talent.dark_arbiter.enabled&rune<=3)|cooldown.dark_arbiter.remains>5)
actions.generic+=/festering_strike,if=debuff.festering_wound.stack<6&cooldown.apocalypse.remains<=6
actions.generic+=/defile
actions.generic+=/call_action_list,name=aoe,if=active_enemies>=2
actions.generic+=/festering_strike,if=(buff.blighted_rune_weapon.stack*2+debuff.festering_wound.stack)<=2|((buff.blighted_rune_weapon.stack*2+debuff.festering_wound.stack)<=4&talent.castigator.enabled)&(cooldown.army_of_the_dead.remains>5|rune.time_to_4<=gcd)
actions.generic+=/death_coil,if=!buff.necrosis.up&talent.necrosis.enabled&rune.time_to_4>=gcd
actions.generic+=/scourge_strike,if=(buff.necrosis.up|buff.unholy_strength.react|rune>=2)&debuff.festering_wound.stack>=1&(debuff.festering_wound.stack>=3|!(talent.castigator.enabled|equipped.132448))&(cooldown.army_of_the_dead.remains>5|rune.time_to_4<=gcd)
actions.generic+=/clawing_shadows,if=(buff.necrosis.up|buff.unholy_strength.react|rune>=2)&debuff.festering_wound.stack>=1&(debuff.festering_wound.stack>=3|!equipped.132448)&(cooldown.army_of_the_dead.remains>5|rune.time_to_4<=gcd)
actions.generic+=/death_coil,if=(talent.dark_arbiter.enabled&cooldown.dark_arbiter.remains>10)|!talent.dark_arbiter.enabled
actions.valkyr=death_coil
actions.valkyr+=/festering_strike,if=debuff.festering_wound.stack<6&cooldown.apocalypse.remains<3
actions.valkyr+=/call_action_list,name=aoe,if=active_enemies>=2
actions.valkyr+=/festering_strike,if=debuff.festering_wound.stack<=4
actions.valkyr+=/scourge_strike,if=debuff.festering_wound.up
actions.valkyr+=/clawing_shadows,if=debuff.festering_wound.up
]])