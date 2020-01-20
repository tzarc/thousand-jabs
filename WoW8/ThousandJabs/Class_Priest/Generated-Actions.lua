if GetBuildInfo and (select(4, GetBuildInfo()) < 80000 or select(4, GetBuildInfo()) >= 90000) then return end

if select(3, UnitClass('player')) ~= 5 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs')

TJ:RegisterActionProfileList('simc::priest::shadow', 'Simulationcraft Priest Profile: Shadow', 5, 3, [[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/variable,name=mind_blast_targets,op=set,value=floor((4.5+azerite.whispers_of_the_damned.rank)%(1+0.27*azerite.searing_dialogue.rank))
actions.precombat+=/variable,name=swp_trait_ranks_check,op=set,value=(1-0.07*azerite.death_throes.rank+0.2*azerite.thought_harvester.rank)*(1-0.09*azerite.thought_harvester.rank*azerite.searing_dialogue.rank)
actions.precombat+=/variable,name=vt_trait_ranks_check,op=set,value=(1-0.04*azerite.thought_harvester.rank-0.05*azerite.spiteful_apparitions.rank)
actions.precombat+=/variable,name=vt_mis_trait_ranks_check,op=set,value=(1-0.07*azerite.death_throes.rank-0.03*azerite.thought_harvester.rank-0.055*azerite.spiteful_apparitions.rank)*(1-0.027*azerite.thought_harvester.rank*azerite.searing_dialogue.rank)
actions.precombat+=/variable,name=vt_mis_sd_check,op=set,value=1-0.014*azerite.searing_dialogue.rank
actions.precombat+=/shadowform,if=!buff.shadowform.up
actions.precombat+=/use_item,name=azsharas_font_of_power
actions.precombat+=/mind_blast,if=spell_targets.mind_sear<2|azerite.thought_harvester.rank=0
actions.precombat+=/vampiric_touch
actions=potion,if=buff.bloodlust.react|target.time_to_die<=80|target.health.pct<35
actions+=/variable,name=dots_up,op=set,value=dot.shadow_word_pain.ticking&dot.vampiric_touch.ticking
actions+=/run_action_list,name=cleave,if=active_enemies>1
actions+=/run_action_list,name=single,if=active_enemies=1
actions.cds=memory_of_lucid_dreams,if=(buff.voidform.stack>20&insanity<=50)|buff.voidform.stack>(26+7*buff.bloodlust.up)|(current_insanity_drain*((gcd.max*2)+action.mind_blast.cast_time))>insanity
actions.cds+=/blood_of_the_enemy
actions.cds+=/guardian_of_azeroth,if=buff.voidform.stack>15
actions.cds+=/focused_azerite_beam,if=spell_targets.mind_sear>=2|raid_event.adds.in>60
actions.cds+=/purifying_blast,if=spell_targets.mind_sear>=2|raid_event.adds.in>60
actions.cds+=/concentrated_flame,line_cd=6,if=time<=10|(buff.chorus_of_insanity.stack>=15&buff.voidform.up)|full_recharge_time<gcd|target.time_to_die<5
actions.cds+=/ripple_in_space
actions.cds+=/reaping_flames
actions.cds+=/worldvein_resonance
actions.cds+=/call_action_list,name=crit_cds,if=(buff.voidform.up&buff.chorus_of_insanity.stack>20)|azerite.chorus_of_insanity.rank=0
actions.cds+=/use_items
actions.cleave=void_eruption
actions.cleave+=/dark_ascension,if=buff.voidform.down
actions.cleave+=/vampiric_touch,if=!ticking&azerite.thought_harvester.rank>=1
actions.cleave+=/mind_sear,if=buff.harvested_thoughts.up
actions.cleave+=/void_bolt
actions.cleave+=/call_action_list,name=cds
actions.cleave+=/shadow_word_death,target_if=target.time_to_die<3|buff.voidform.down
actions.cleave+=/surrender_to_madness,if=buff.voidform.stack>10+(10*buff.bloodlust.up)
actions.cleave+=/dark_void,if=raid_event.adds.in>10&(dot.shadow_word_pain.refreshable|target.time_to_die>30)
actions.cleave+=/mindbender
actions.cleave+=/mind_blast,target_if=spell_targets.mind_sear<variable.mind_blast_targets
actions.cleave+=/shadow_crash,if=(raid_event.adds.in>5&raid_event.adds.duration<2)|raid_event.adds.duration>2
actions.cleave+=/shadow_word_pain,target_if=refreshable&target.time_to_die>((-1.2+3.3*spell_targets.mind_sear)*variable.swp_trait_ranks_check*(1-0.012*azerite.searing_dialogue.rank*spell_targets.mind_sear)),if=!talent.misery.enabled
actions.cleave+=/vampiric_touch,target_if=refreshable,if=target.time_to_die>((1+3.3*spell_targets.mind_sear)*variable.vt_trait_ranks_check*(1+0.10*azerite.searing_dialogue.rank*spell_targets.mind_sear))
actions.cleave+=/vampiric_touch,target_if=dot.shadow_word_pain.refreshable,if=(talent.misery.enabled&target.time_to_die>((1.0+2.0*spell_targets.mind_sear)*variable.vt_mis_trait_ranks_check*(variable.vt_mis_sd_check*spell_targets.mind_sear)))
actions.cleave+=/void_torrent,if=buff.voidform.up
actions.cleave+=/mind_sear,target_if=spell_targets.mind_sear>1,chain=1,interrupt_immediate=1,interrupt_if=ticks>=2
actions.cleave+=/mind_flay,chain=1,interrupt_immediate=1,interrupt_if=ticks>=2&(cooldown.void_bolt.up|cooldown.mind_blast.up)
actions.cleave+=/shadow_word_pain
actions.crit_cds=use_item,name=azsharas_font_of_power
actions.crit_cds+=/use_item,effect_name=cyclotronic_blast
actions.crit_cds+=/the_unbound_force
actions.single=void_eruption
actions.single+=/dark_ascension,if=buff.voidform.down
actions.single+=/void_bolt
actions.single+=/call_action_list,name=cds
actions.single+=/mind_sear,if=buff.harvested_thoughts.up&cooldown.void_bolt.remains>=1.5&azerite.searing_dialogue.rank>=1
actions.single+=/shadow_word_death,if=target.time_to_die<3|cooldown.shadow_word_death.charges=2|(cooldown.shadow_word_death.charges=1&cooldown.shadow_word_death.remains<gcd.max)
actions.single+=/surrender_to_madness,if=buff.voidform.stack>10+(10*buff.bloodlust.up)
actions.single+=/dark_void,if=raid_event.adds.in>10
actions.single+=/mindbender,if=talent.mindbender.enabled|(buff.voidform.stack>18|target.time_to_die<15)
actions.single+=/shadow_word_death,if=!buff.voidform.up|(cooldown.shadow_word_death.charges=2&buff.voidform.stack<15)
actions.single+=/shadow_crash,if=raid_event.adds.in>5&raid_event.adds.duration<20
actions.single+=/mind_blast,if=variable.dots_up&((raid_event.movement.in>cast_time+0.5&raid_event.movement.in<4)|!talent.shadow_word_void.enabled|buff.voidform.down|buff.voidform.stack>14&(insanity<70|charges_fractional>1.33)|buff.voidform.stack<=14&(insanity<60|charges_fractional>1.33))
actions.single+=/void_torrent,if=dot.shadow_word_pain.remains>4&dot.vampiric_touch.remains>4&buff.voidform.up
actions.single+=/shadow_word_pain,if=refreshable&target.time_to_die>4&!talent.misery.enabled&!talent.dark_void.enabled
actions.single+=/vampiric_touch,if=refreshable&target.time_to_die>6|(talent.misery.enabled&dot.shadow_word_pain.refreshable)
actions.single+=/mind_flay,chain=1,interrupt_immediate=1,interrupt_if=ticks>=2&(cooldown.void_bolt.up|cooldown.mind_blast.up)
actions.single+=/shadow_word_pain
]])

