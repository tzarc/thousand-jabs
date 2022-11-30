if GetBuildInfo and (select(4, GetBuildInfo()) < 90000 or select(4, GetBuildInfo()) >= 100000) then
	return
end

if select(3, UnitClass("player")) ~= 12 then
	return
end

local TJ = LibStub("AceAddon-3.0"):GetAddon("ThousandJabs")

TJ:RegisterActionProfileList(
	"simc::demonhunter::havoc",
	"Simulationcraft Demon Hunter Profile: Havoc",
	12,
	1,
	[[
actions.precombat=flask
actions.precombat+=/augmentation
actions.precombat+=/food
actions.precombat+=/snapshot_stats
actions.precombat+=/variable,name=trinket_sync_slot,value=1,if=trinket.1.has_stat.any_dps&(!trinket.2.has_stat.any_dps|trinket.1.cooldown.duration>=trinket.2.cooldown.duration)
actions.precombat+=/variable,name=trinket_sync_slot,value=2,if=trinket.2.has_stat.any_dps&(!trinket.1.has_stat.any_dps|trinket.2.cooldown.duration>trinket.1.cooldown.duration)
actions.precombat+=/variable,name=use_eye_beam_fury_condition,value=talent.blind_fury.enabled&(runeforge.darkglare_medallion|talent.demon_blades.enabled)
actions=auto_attack
actions+=/retarget_auto_attack,line_cd=1,target_if=min:debuff.burning_wound.remains,if=runeforge.burning_wound&talent.demon_blades.enabled
actions+=/variable,name=blade_dance,if=!runeforge.chaos_theory&!runeforge.darkglare_medallion,value=talent.first_blood.enabled|spell_targets.blade_dance1>=(3-talent.trail_of_ruin.enabled)
actions+=/variable,name=blade_dance,if=runeforge.chaos_theory,value=buff.chaos_theory.down|talent.first_blood.enabled&spell_targets.blade_dance1>=(2-talent.trail_of_ruin.enabled)|!talent.cycle_of_hatred.enabled&spell_targets.blade_dance1>=(4-talent.trail_of_ruin.enabled)
actions+=/variable,name=blade_dance,if=runeforge.darkglare_medallion,value=talent.first_blood.enabled|(buff.metamorphosis.up|talent.trail_of_ruin.enabled|debuff.essence_break.up)&spell_targets.blade_dance1>=(3-talent.trail_of_ruin.enabled)|!talent.demonic.enabled&spell_targets.blade_dance1>=4
actions+=/variable,name=blade_dance,op=reset,if=talent.essence_break.enabled&cooldown.essence_break.ready
actions+=/variable,name=pooling_for_meta,value=!talent.demonic.enabled&cooldown.metamorphosis.remains<6&fury.deficit>30
actions+=/variable,name=pooling_for_blade_dance,value=variable.blade_dance&(fury<75-talent.first_blood.enabled*20)
actions+=/variable,name=pooling_for_eye_beam,value=talent.demonic.enabled&!talent.blind_fury.enabled&cooldown.eye_beam.remains<(gcd.max*2)&fury.deficit>20
actions+=/variable,name=waiting_for_momentum,value=talent.momentum.enabled&!buff.momentum.up
actions+=/disrupt
actions+=/call_action_list,name=cooldown,if=gcd.remains=0
actions+=/pick_up_fragment,type=demon,if=demon_soul_fragments>0
actions+=/pick_up_fragment,if=fury.deficit>=35
actions+=/throw_glaive,if=buff.fel_bombardment.stack=5&(buff.immolation_aura.up|!buff.metamorphosis.up)
actions+=/run_action_list,name=demonic,if=talent.demonic.enabled
actions+=/run_action_list,name=normal
actions.cooldown=metamorphosis,if=!talent.demonic.enabled&cooldown.eye_beam.remains>20&(!covenant.venthyr.enabled|!dot.sinful_brand.ticking)|fight_remains<25
actions.cooldown+=/metamorphosis,if=talent.demonic.enabled&(cooldown.eye_beam.remains>20&(!variable.blade_dance|cooldown.blade_dance.remains>gcd.max))&(!covenant.venthyr.enabled|!dot.sinful_brand.ticking)|fight_remains<25
actions.cooldown+=/potion,if=buff.metamorphosis.remains>25|fight_remains<60
actions.cooldown+=/use_items,slots=trinket1,if=variable.trinket_sync_slot=1&(buff.metamorphosis.up|(!talent.demonic.enabled&cooldown.metamorphosis.remains>(fight_remains>?trinket.1.cooldown.duration%2))|fight_remains<=20)|(variable.trinket_sync_slot=2&!trinket.2.cooldown.ready)|!variable.trinket_sync_slot
actions.cooldown+=/use_items,slots=trinket2,if=variable.trinket_sync_slot=2&(buff.metamorphosis.up|(!talent.demonic.enabled&cooldown.metamorphosis.remains>(fight_remains>?trinket.2.cooldown.duration%2))|fight_remains<=20)|(variable.trinket_sync_slot=1&!trinket.1.cooldown.ready)|!variable.trinket_sync_slot
actions.cooldown+=/sinful_brand,if=!dot.sinful_brand.ticking
actions.cooldown+=/the_hunt,if=!talent.demonic.enabled&!variable.waiting_for_momentum&!variable.pooling_for_meta|buff.furious_gaze.up
actions.cooldown+=/elysian_decree,if=(active_enemies>desired_targets|raid_event.adds.in>30)
actions.demonic=fel_rush,if=talent.unbound_chaos.enabled&buff.unbound_chaos.up&(charges=2|(raid_event.movement.in>10&raid_event.adds.in>10))
actions.demonic+=/death_sweep,if=variable.blade_dance
actions.demonic+=/glaive_tempest,if=active_enemies>desired_targets|raid_event.adds.in>10
actions.demonic+=/throw_glaive,if=conduit.serrated_glaive.enabled&cooldown.eye_beam.remains<6&!buff.metamorphosis.up&!debuff.exposed_wound.up
actions.demonic+=/eye_beam,if=active_enemies>desired_targets|raid_event.adds.in>25&(!variable.use_eye_beam_fury_condition|spell_targets>1|fury<70)
actions.demonic+=/blade_dance,if=variable.blade_dance&!cooldown.metamorphosis.ready&(cooldown.eye_beam.remains>5|(raid_event.adds.in>cooldown&raid_event.adds.in<25))
actions.demonic+=/immolation_aura,if=!buff.immolation_aura.up
actions.demonic+=/annihilation,if=!variable.pooling_for_blade_dance
actions.demonic+=/felblade,if=fury.deficit>=40
actions.demonic+=/essence_break
actions.demonic+=/chaos_strike,if=!variable.pooling_for_blade_dance&!variable.pooling_for_eye_beam
actions.demonic+=/fel_rush,if=talent.demon_blades.enabled&!cooldown.eye_beam.ready&(charges=2|(raid_event.movement.in>10&raid_event.adds.in>10))
actions.demonic+=/demons_bite,target_if=min:debuff.burning_wound.remains,if=runeforge.burning_wound&debuff.burning_wound.remains<4
actions.demonic+=/fel_rush,if=!talent.demon_blades.enabled&spell_targets>1&(charges=2|(raid_event.movement.in>10&raid_event.adds.in>10))
actions.demonic+=/demons_bite
actions.demonic+=/throw_glaive,if=buff.out_of_range.up
actions.demonic+=/fel_rush,if=movement.distance>15|buff.out_of_range.up
actions.demonic+=/vengeful_retreat,if=movement.distance>15
actions.demonic+=/throw_glaive,if=talent.demon_blades.enabled
actions.normal=vengeful_retreat,if=talent.momentum.enabled&buff.prepared.down&time>1
actions.normal+=/fel_rush,if=(buff.unbound_chaos.up|variable.waiting_for_momentum&(!talent.unbound_chaos.enabled|!cooldown.immolation_aura.ready))&(charges=2|(raid_event.movement.in>10&raid_event.adds.in>10))
actions.normal+=/fel_barrage,if=active_enemies>desired_targets|raid_event.adds.in>30
actions.normal+=/death_sweep,if=variable.blade_dance
actions.normal+=/immolation_aura,if=!buff.immolation_aura.up
actions.normal+=/glaive_tempest,if=!variable.waiting_for_momentum&(active_enemies>desired_targets|raid_event.adds.in>10)
actions.normal+=/throw_glaive,if=conduit.serrated_glaive.enabled&cooldown.eye_beam.remains<6&!buff.metamorphosis.up&!debuff.exposed_wound.up
actions.normal+=/eye_beam,if=!variable.waiting_for_momentum&(active_enemies>desired_targets|raid_event.adds.in>15&(!variable.use_eye_beam_fury_condition|spell_targets>1|fury<70))
actions.normal+=/blade_dance,if=variable.blade_dance
actions.normal+=/felblade,if=fury.deficit>=40
actions.normal+=/essence_break
actions.normal+=/annihilation,if=(talent.demon_blades.enabled|!variable.waiting_for_momentum|fury.deficit<30|buff.metamorphosis.remains<5)&!variable.pooling_for_blade_dance
actions.normal+=/chaos_strike,if=(talent.demon_blades.enabled|!variable.waiting_for_momentum|fury.deficit<30)&!variable.pooling_for_meta&!variable.pooling_for_blade_dance
actions.normal+=/eye_beam,if=talent.blind_fury.enabled&raid_event.adds.in>cooldown
actions.normal+=/demons_bite,target_if=min:debuff.burning_wound.remains,if=runeforge.burning_wound&debuff.burning_wound.remains<4
actions.normal+=/demons_bite
actions.normal+=/fel_rush,if=!talent.momentum.enabled&raid_event.movement.in>charges*10&talent.demon_blades.enabled
actions.normal+=/felblade,if=movement.distance>15|buff.out_of_range.up
actions.normal+=/fel_rush,if=movement.distance>15|(buff.out_of_range.up&!talent.momentum.enabled)
actions.normal+=/vengeful_retreat,if=movement.distance>15
actions.normal+=/throw_glaive,if=talent.demon_blades.enabled
]]
)

TJ:RegisterActionProfileList(
	"simc::demonhunter::vengeance",
	"Simulationcraft Demon Hunter Profile: Vengeance",
	12,
	2,
	[[
actions.precombat=flask
actions.precombat+=/augmentation
actions.precombat+=/food
actions.precombat+=/snapshot_stats
actions=auto_attack
actions+=/variable,name=brand_build,value=talent.agonizing_flames.enabled&talent.burning_alive.enabled&talent.charred_flesh.enabled
actions+=/disrupt
actions+=/consume_magic
actions+=/throw_glaive,if=buff.fel_bombardment.stack=5&(buff.immolation_aura.up|!buff.metamorphosis.up)
actions+=/call_action_list,name=brand,if=variable.brand_build
actions+=/call_action_list,name=defensives
actions+=/call_action_list,name=cooldowns
actions+=/call_action_list,name=normal
actions.brand=fiery_brand
actions.brand+=/immolation_aura,if=dot.fiery_brand.ticking
actions.cooldowns=potion
actions.cooldowns+=/use_items
actions.cooldowns+=/sinful_brand,if=!dot.sinful_brand.ticking
actions.cooldowns+=/the_hunt
actions.cooldowns+=/elysian_decree
actions.defensives=demon_spikes
actions.defensives+=/metamorphosis,if=!buff.metamorphosis.up&(!covenant.venthyr.enabled|!dot.sinful_brand.ticking)|target.time_to_die<15
actions.defensives+=/fiery_brand
actions.normal=infernal_strike
actions.normal+=/bulk_extraction
actions.normal+=/spirit_bomb,if=((buff.metamorphosis.up&talent.fracture.enabled&soul_fragments>=3)|soul_fragments>=4)
actions.normal+=/fel_devastation
actions.normal+=/soul_cleave,if=((talent.spirit_bomb.enabled&soul_fragments=0)|!talent.spirit_bomb.enabled)&((talent.fracture.enabled&fury>=55)|(!talent.fracture.enabled&fury>=70)|cooldown.fel_devastation.remains>target.time_to_die|(buff.metamorphosis.up&((talent.fracture.enabled&fury>=35)|(!talent.fracture.enabled&fury>=50))))
actions.normal+=/immolation_aura,if=((variable.brand_build&cooldown.fiery_brand.remains>10)|!variable.brand_build)&fury<=90
actions.normal+=/felblade,if=fury<=60
actions.normal+=/fracture,if=((talent.spirit_bomb.enabled&soul_fragments<=3)|(!talent.spirit_bomb.enabled&((buff.metamorphosis.up&fury<=55)|(buff.metamorphosis.down&fury<=70))))
actions.normal+=/sigil_of_flame,if=!(covenant.kyrian.enabled&runeforge.razelikhs_defilement)
actions.normal+=/shear
actions.normal+=/throw_glaive
]]
)