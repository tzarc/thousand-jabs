local _, internal = ...
internal.apls = internal.apls or {}

internal.apls["legion-dev::Tier19P::Warlock_Affliction_T19P"] = [[
actions.precombat=flask,type=whispered_pact
actions.precombat+=/food,type=azshari_salad
actions.precombat+=/summon_pet,if=!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)
actions.precombat+=/summon_doomguard,if=talent.grimoire_of_supremacy.enabled&active_enemies<3
actions.precombat+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&active_enemies>=3
actions.precombat+=/snapshot_stats
actions.precombat+=/grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled
actions.precombat+=/potion,name=deadly_grace
actions.precombat+=/mana_tap,if=talent.mana_tap.enabled&!buff.mana_tap.remains
actions=reap_souls,if=actions=reap_souls,if=!buff.deadwind_harvester.remains&(buff.soul_harvest.remains|buff.tormented_souls.react>=8|target.time_to_die<=buff.tormented_souls.react*5|trinket.proc.any.react)
actions+=/soul_effigy,if=!pet.soul_effigy.active
actions+=/agony,if=remains<=tick_time+gcd
actions+=/agony,target=soul_effigy,if=remains<=tick_time+gcd
actions+=/service_pet,if=dot.corruption.remains&dot.agony.remains
actions+=/summon_doomguard,if=!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening<3
actions+=/summon_infernal,if=!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening>=3
actions+=/berserking
actions+=/blood_fury
actions+=/arcane_torrent
actions+=/soul_harvest
actions+=/potion,name=deadly_grace,if=buff.soul_harvest.remains|trinket.proc.any.react
actions+=/corruption,if=remains<=tick_time+gcd
actions+=/siphon_life,if=remains<=tick_time+gcd
actions+=/corruption,target=soul_effigy,if=remains<=tick_time+gcd
actions+=/siphon_life,target=soul_effigy,if=remains<=tick_time+gcd
actions+=/mana_tap,if=buff.mana_tap.remains<=buff.mana_tap.duration*0.3&(mana.pct<20|buff.mana_tap.remains<=gcd)&target.time_to_die>buff.mana_tap.duration*0.3
actions+=/phantom_singularity
actions+=/unstable_affliction,if=talent.contagion.enabled|(soul_shard>=4|trinket.proc.intellect.react|trinket.stacking_proc.mastery.react|trinket.proc.mastery.react|trinket.proc.crit.react|trinket.proc.versatility.react|buff.soul_harvest.remains|buff.deadwind_harvester.remains|buff.compounding_horror.react=5|target.time_to_die<=20)
actions+=/agony,if=remains<=duration*0.3&target.time_to_die>=remains
actions+=/agony,target=soul_effigy,if=remains<=duration*0.3&target.time_to_die>=remains
actions+=/corruption,if=remains<=duration*0.3&target.time_to_die>=remains
actions+=/haunt
actions+=/siphon_life,if=remains<=duration*0.3&target.time_to_die>=remains
actions+=/corruption,target=soul_effigy,if=remains<=duration*0.3&target.time_to_die>=remains
actions+=/siphon_life,target=soul_effigy,if=remains<=duration*0.3&target.time_to_die>=remains
actions+=/life_tap,if=mana.pct<=10
actions+=/drain_soul,chain=1,interrupt=1
actions+=/drain_life,chain=1,interrupt=1
actions+=/life_tap
]]

internal.apls["legion-dev::Tier19P::Warlock_Destruction_T19P"] = [[
actions.precombat=flask,type=whispered_pact
actions.precombat+=/food,type=azshari_salad
actions.precombat+=/summon_pet,if=!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)
actions.precombat+=/summon_doomguard,if=talent.grimoire_of_supremacy.enabled&active_enemies<3
actions.precombat+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&active_enemies>=3
actions.precombat+=/snapshot_stats
actions.precombat+=/grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled
actions.precombat+=/potion,name=deadly_grace
actions.precombat+=/mana_tap,if=talent.mana_tap.enabled&!buff.mana_tap.remains
actions.precombat+=/incinerate
actions=dimensional_rift,if=charges=3
actions+=/immolate,if=remains<=tick_time
actions+=/immolate,if=talent.roaring_blaze.enabled&remains<=duration&!debuff.roaring_blaze.remains&(action.conflagrate.charges=2|(action.conflagrate.charges>=1&action.conflagrate.recharge_time<cast_time+gcd))
actions+=/berserking
actions+=/blood_fury
actions+=/arcane_torrent
actions+=/potion,name=deadly_grace,if=(buff.soul_harvest.remains|trinket.proc.any.react|target.time_to_die<=30)
actions+=/conflagrate,if=talent.roaring_blaze.enabled&(charges=2|(action.conflagrate.charges>=1&action.conflagrate.recharge_time<gcd))
actions+=/conflagrate,if=talent.roaring_blaze.enabled&prev_gcd.conflagrate
actions+=/conflagrate,if=talent.roaring_blaze.enabled&debuff.roaring_blaze.stack=2
actions+=/conflagrate,if=talent.roaring_blaze.enabled&debuff.roaring_blaze.stack=3&buff.bloodlust.remains
actions+=/conflagrate,if=!talent.roaring_blaze.enabled&buff.conflagration_of_chaos.remains<=action.chaos_bolt.cast_time
actions+=/conflagrate,if=!talent.roaring_blaze.enabled&(charges=1&recharge_time<action.chaos_bolt.cast_time|charges=2)&soul_shard<5
actions+=/service_pet
actions+=/summon_infernal,if=artifact.lord_of_flames.rank>0&!buff.lord_of_flames.remains
actions+=/summon_doomguard,if=!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening<3
actions+=/summon_infernal,if=!talent.grimoire_of_supremacy.enabled&spell_targets.infernal_awakening>=3
actions+=/soul_harvest
actions+=/channel_demonfire,if=dot.immolate.remains>cast_time
actions+=/chaos_bolt,if=soul_shard>3
actions+=/dimensional_rift
actions+=/mana_tap,if=buff.mana_tap.remains<=buff.mana_tap.duration*0.3&(mana.pct<20|buff.mana_tap.remains<=action.chaos_bolt.cast_time)&target.time_to_die>buff.mana_tap.duration*0.3
actions+=/chaos_bolt
actions+=/cataclysm
actions+=/conflagrate,if=!talent.roaring_blaze.enabled
actions+=/immolate,if=!talent.roaring_blaze.enabled&remains<=duration*0.3
actions+=/life_tap,if=talent.mana_tap.enabled&mana.pct<=10
actions+=/incinerate
actions+=/life_tap
]]

internal.apls["legion-dev::legion::Warlock_Destruction_Legion"] = [[
actions.precombat=summon_pet,if=!talent.grimoire_of_supremacy.enabled&(!talent.grimoire_of_sacrifice.enabled|buff.demonic_power.down)
actions.precombat+=/summon_doomguard,if=talent.grimoire_of_supremacy.enabled&active_enemies<3
actions.precombat+=/summon_infernal,if=talent.grimoire_of_supremacy.enabled&active_enemies>=3
actions.precombat+=/snapshot_stats
actions.precombat+=/grimoire_of_sacrifice,if=talent.grimoire_of_sacrifice.enabled
actions.precombat+=/incinerate
actions+=/incinerate
]]

