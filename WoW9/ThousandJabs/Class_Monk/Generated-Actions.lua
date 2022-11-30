if GetBuildInfo and (select(4, GetBuildInfo()) < 90000 or select(4, GetBuildInfo()) >= 100000) then
	return
end

if select(3, UnitClass("player")) ~= 10 then
	return
end

local TJ = LibStub("AceAddon-3.0"):GetAddon("ThousandJabs")

TJ:RegisterActionProfileList(
	"custom::monk::brewmaster",
	"Thousand Jabs Custom Monk Profile: Brewmaster",
	10,
	1,
	[[
actions=auto_attack
actions+=/spear_hand_strike
actions+=/variable,name=heal_threshold,value=health.pct<80
actions+=/purifying_brew,if=stagger.heavy
actions+=/celestial_brew
actions+=/chi_wave,if=talent.chi_wave.enabled&variable.heal_threshold
actions+=/call_action_list,name=ooc,if=!in_combat
actions+=/call_action_list,name=oh_shit,if=incoming_damage_5s>=health.max*0.65|health.pct<50
actions+=/call_action_list,name=normal
actions.ooc+=/purifying_brew,if=stagger.any
actions.ooc+=/expel_harm,if=variable.heal_threshold
actions.ooc+=/vivify,if=variable.heal_threshold
actions.oh_shit=fortifying_brew
actions.oh_shit+=/purifying_brew,if=stagger.heavy|stagger.moderate
actions.oh_shit+=/healing_elixir
actions.oh_shit+=/expel_harm
actions.oh_shit+=/dampen_harm
actions.normal=touch_of_death
actions.normal+=/invoke_niuzao_the_black_ox,if=time>5&target.time_to_die>25
actions.normal+=/weapons_of_order
actions.normal+=/keg_smash
actions.normal+=/blackout_kick,if=spell_targets<=2
actions.normal+=/breath_of_fire,if=dot.breath_of_fire_dot.refreshable
actions.normal+=/blackout_kick,if=spell_targets>2
actions.normal+=/rushing_jade_wind
actions.normal+=/chi_burst
actions.normal+=/chi_wave
actions.normal+=/expel_harm,if=health.pct<80
actions.normal+=/healing_elixir,if=health.pct<80
actions.normal+=/tiger_palm,if=energy>65&spell_targets<=2
actions.normal+=/spinning_crane_kick,if=energy>65&spell_targets>2
]]
)

TJ:RegisterActionProfileList(
	"simc::monk::brewmaster",
	"Simulationcraft Monk Profile: Brewmaster",
	10,
	1,
	[[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/chi_burst
actions.precombat+=/chi_wave
actions=auto_attack
actions+=/spear_hand_strike,if=target.debuff.casting.react
actions+=/gift_of_the_ox,if=health<health.max*0.65
actions+=/dampen_harm,if=incoming_damage_1500ms&buff.fortifying_brew.down
actions+=/fortifying_brew,if=incoming_damage_1500ms&(buff.dampen_harm.down|buff.diffuse_magic.down)
actions+=/potion
actions+=/blood_fury
actions+=/berserking
actions+=/lights_judgment
actions+=/fireblood
actions+=/ancestral_call
actions+=/bag_of_tricks
actions+=/invoke_niuzao_the_black_ox,if=target.time_to_die>25
actions+=/touch_of_death,if=target.health.pct<=15
actions+=/weapons_of_order
actions+=/fallen_order
actions+=/bonedust_brew
actions+=/purifying_brew
actions+=/black_ox_brew,if=cooldown.purifying_brew.charges_fractional<0.5
actions+=/black_ox_brew,if=(energy+(energy.regen*cooldown.keg_smash.remains))<40&buff.blackout_combo.down&cooldown.keg_smash.up
actions+=/keg_smash,if=spell_targets>=2
actions+=/faeline_stomp,if=spell_targets>=2
actions+=/keg_smash,if=buff.weapons_of_order.up
actions+=/celestial_brew,if=buff.blackout_combo.down&incoming_damage_1999ms>(health.max*0.1+stagger.last_tick_damage_4)&buff.elusive_brawler.stack<2
actions+=/tiger_palm,if=talent.rushing_jade_wind.enabled&buff.blackout_combo.up&buff.rushing_jade_wind.up
actions+=/breath_of_fire,if=buff.charred_passions.down&runeforge.charred_passions.equipped
actions+=/blackout_kick
actions+=/keg_smash
actions+=/faeline_stomp
actions+=/expel_harm,if=buff.gift_of_the_ox.stack>=3
actions+=/touch_of_death
actions+=/rushing_jade_wind,if=buff.rushing_jade_wind.down
actions+=/spinning_crane_kick,if=buff.charred_passions.up
actions+=/breath_of_fire,if=buff.blackout_combo.down&(buff.bloodlust.down|(buff.bloodlust.up&dot.breath_of_fire_dot.refreshable))
actions+=/chi_burst
actions+=/chi_wave
actions+=/spinning_crane_kick,if=active_enemies>=3&cooldown.keg_smash.remains>gcd&(energy+(energy.regen*(cooldown.keg_smash.remains+execute_time)))>=65&(!talent.spitfire.enabled|!runeforge.charred_passions.equipped)
actions+=/tiger_palm,if=!talent.blackout_combo&cooldown.keg_smash.remains>gcd&(energy+(energy.regen*(cooldown.keg_smash.remains+gcd)))>=65
actions+=/arcane_torrent,if=energy<31
actions+=/rushing_jade_wind
]]
)

TJ:RegisterActionProfileList(
	"simc::monk::windwalker",
	"Simulationcraft Monk Profile: Windwalker",
	10,
	3,
	[[
actions.precombat=flask
actions.precombat+=/food
actions.precombat+=/augmentation
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/variable,name=xuen_on_use_trinket,op=set,value=0
actions.precombat+=/chi_burst
actions.precombat+=/chi_wave,if=!talent.energizing_elixir.enabled
actions=auto_attack
actions+=/spear_hand_strike,if=target.debuff.casting.react
actions+=/variable,name=hold_xuen,op=set,value=cooldown.invoke_xuen_the_white_tiger.remains>fight_remains|fight_remains<120&fight_remains>cooldown.serenity.remains&cooldown.serenity.remains>10
actions+=/potion,if=(buff.serenity.up|buff.storm_earth_and_fire.up)&pet.xuen_the_white_tiger.active|fight_remains<=60
actions+=/call_action_list,name=serenity,if=buff.serenity.up
actions+=/call_action_list,name=weapons_of_order,if=buff.weapons_of_order.up
actions+=/call_action_list,name=opener,if=time<4&chi<5&!pet.xuen_the_white_tiger.active
actions+=/fist_of_the_white_tiger,target_if=min:debuff.mark_of_the_crane.remains,if=chi.max-chi>=3&(energy.time_to_max<1|energy.time_to_max<4&cooldown.fists_of_fury.remains<1.5|cooldown.weapons_of_order.remains<2)
actions+=/expel_harm,if=chi.max-chi>=1&(energy.time_to_max<1|cooldown.serenity.remains<2|energy.time_to_max<4&cooldown.fists_of_fury.remains<1.5|cooldown.weapons_of_order.remains<2)
actions+=/tiger_palm,target_if=min:debuff.mark_of_the_crane.remains,if=combo_strike&chi.max-chi>=2&(energy.time_to_max<1|cooldown.serenity.remains<2|energy.time_to_max<4&cooldown.fists_of_fury.remains<1.5|cooldown.weapons_of_order.remains<2)
actions+=/call_action_list,name=cd_sef,if=!talent.serenity
actions+=/call_action_list,name=cd_serenity,if=talent.serenity
actions+=/call_action_list,name=st,if=active_enemies<3
actions+=/call_action_list,name=aoe,if=active_enemies>=3
actions.aoe=whirling_dragon_punch
actions.aoe+=/energizing_elixir,if=chi.max-chi>=2&energy.time_to_max>2|chi.max-chi>=4
actions.aoe+=/spinning_crane_kick,if=combo_strike&(buff.dance_of_chiji.up|debuff.bonedust_brew.up)
actions.aoe+=/fists_of_fury,if=energy.time_to_max>execute_time|chi.max-chi<=1
actions.aoe+=/rising_sun_kick,target_if=min:debuff.mark_of_the_crane.remains,if=(talent.whirling_dragon_punch&cooldown.rising_sun_kick.duration>cooldown.whirling_dragon_punch.remains+4)&(cooldown.fists_of_fury.remains>3|chi>=5)
actions.aoe+=/rushing_jade_wind,if=buff.rushing_jade_wind.down
actions.aoe+=/spinning_crane_kick,if=combo_strike&((cooldown.bonedust_brew.remains>2&(chi>3|cooldown.fists_of_fury.remains>6)&(chi>=5|cooldown.fists_of_fury.remains>2))|energy.time_to_max<=3)
actions.aoe+=/expel_harm,if=chi.max-chi>=1
actions.aoe+=/fist_of_the_white_tiger,target_if=min:debuff.mark_of_the_crane.remains,if=chi.max-chi>=3
actions.aoe+=/chi_burst,if=chi.max-chi>=2
actions.aoe+=/crackling_jade_lightning,if=buff.the_emperors_capacitor.stack>19&energy.time_to_max>execute_time-1&cooldown.fists_of_fury.remains>execute_time
actions.aoe+=/tiger_palm,target_if=min:debuff.mark_of_the_crane.remains+(debuff.recently_rushing_tiger_palm.up*20),if=chi.max-chi>=2&(!talent.hit_combo|combo_strike)
actions.aoe+=/chi_wave,if=combo_strike
actions.aoe+=/flying_serpent_kick,if=buff.bok_proc.down,interrupt=1
actions.aoe+=/blackout_kick,target_if=min:debuff.mark_of_the_crane.remains,if=combo_strike&(buff.bok_proc.up|talent.hit_combo&prev_gcd.1.tiger_palm&chi=2&cooldown.fists_of_fury.remains<3|chi.max-chi<=1&prev_gcd.1.spinning_crane_kick&energy.time_to_max<3)
actions.cd_sef=invoke_xuen_the_white_tiger,if=!variable.hold_xuen|fight_remains<25
actions.cd_sef+=/arcane_torrent,if=chi.max-chi>=1
actions.cd_sef+=/touch_of_death,if=fight_remains>(180-runeforge.fatal_touch*120)|buff.storm_earth_and_fire.down&pet.xuen_the_white_tiger.active|fight_remains<10
actions.cd_sef+=/weapons_of_order,if=(raid_event.adds.in>45|raid_event.adds.up)&cooldown.rising_sun_kick.remains<execute_time
actions.cd_sef+=/faeline_stomp,if=combo_strike&(raid_event.adds.in>10|raid_event.adds.up)
actions.cd_sef+=/fallen_order,if=raid_event.adds.in>30|raid_event.adds.up
actions.cd_sef+=/bonedust_brew,if=raid_event.adds.in>50|raid_event.adds.up,line_cd=60
actions.cd_sef+=/storm_earth_and_fire_fixate,if=conduit.coordinated_offensive.enabled
actions.cd_sef+=/storm_earth_and_fire,if=cooldown.storm_earth_and_fire.charges=2|fight_remains<20|(raid_event.adds.remains>15|!covenant.kyrian&((raid_event.adds.in>cooldown.storm_earth_and_fire.full_recharge_time|!raid_event.adds.exists)&(cooldown.invoke_xuen_the_white_tiger.remains>cooldown.storm_earth_and_fire.full_recharge_time|variable.hold_xuen))&cooldown.fists_of_fury.remains<=9&chi>=2&cooldown.whirling_dragon_punch.remains<=12)
actions.cd_sef+=/storm_earth_and_fire,if=covenant.kyrian&(buff.weapons_of_order.up|(fight_remains<cooldown.weapons_of_order.remains|cooldown.weapons_of_order.remains>cooldown.storm_earth_and_fire.full_recharge_time)&cooldown.fists_of_fury.remains<=9&chi>=2&cooldown.whirling_dragon_punch.remains<=12)
actions.cd_sef+=/touch_of_karma,if=fight_remains>159|pet.xuen_the_white_tiger.active|variable.hold_xuen
actions.cd_sef+=/blood_fury,if=cooldown.invoke_xuen_the_white_tiger.remains>30|variable.hold_xuen|fight_remains<20
actions.cd_sef+=/berserking,if=cooldown.invoke_xuen_the_white_tiger.remains>30|variable.hold_xuen|fight_remains<15
actions.cd_sef+=/lights_judgment
actions.cd_sef+=/fireblood,if=cooldown.invoke_xuen_the_white_tiger.remains>30|variable.hold_xuen|fight_remains<10
actions.cd_sef+=/ancestral_call,if=cooldown.invoke_xuen_the_white_tiger.remains>30|variable.hold_xuen|fight_remains<20
actions.cd_sef+=/bag_of_tricks,if=buff.storm_earth_and_fire.down
actions.cd_serenity=variable,name=serenity_burst,op=set,value=cooldown.serenity.remains<1|pet.xuen_the_white_tiger.active&cooldown.serenity.remains>30|fight_remains<20
actions.cd_serenity+=/invoke_xuen_the_white_tiger,if=!variable.hold_xuen|fight_remains<25
actions.cd_serenity+=/blood_fury,if=variable.serenity_burst
actions.cd_serenity+=/berserking,if=variable.serenity_burst
actions.cd_serenity+=/arcane_torrent,if=chi.max-chi>=1
actions.cd_serenity+=/lights_judgment
actions.cd_serenity+=/fireblood,if=variable.serenity_burst
actions.cd_serenity+=/ancestral_call,if=variable.serenity_burst
actions.cd_serenity+=/bag_of_tricks,if=variable.serenity_burst
actions.cd_serenity+=/touch_of_death,if=fight_remains>(180-runeforge.fatal_touch*120)|pet.xuen_the_white_tiger.active|fight_remains<10
actions.cd_serenity+=/touch_of_karma,if=fight_remains>90|pet.xuen_the_white_tiger.active|fight_remains<10
actions.cd_serenity+=/weapons_of_order,if=cooldown.rising_sun_kick.remains<execute_time
actions.cd_serenity+=/faeline_stomp
actions.cd_serenity+=/fallen_order
actions.cd_serenity+=/bonedust_brew
actions.cd_serenity+=/serenity,if=cooldown.rising_sun_kick.remains<2|fight_remains<15
actions.cd_serenity+=/bag_of_tricks
actions.opener=fist_of_the_white_tiger,target_if=min:debuff.mark_of_the_crane.remains,if=chi.max-chi>=3
actions.opener+=/expel_harm,if=talent.chi_burst.enabled&chi.max-chi>=3
actions.opener+=/tiger_palm,target_if=min:debuff.mark_of_the_crane.remains+(debuff.recently_rushing_tiger_palm.up*20),if=combo_strike&chi.max-chi>=2
actions.opener+=/chi_wave,if=chi.max-chi=2
actions.opener+=/expel_harm
actions.opener+=/tiger_palm,target_if=min:debuff.mark_of_the_crane.remains+(debuff.recently_rushing_tiger_palm.up*20),if=chi.max-chi>=2
actions.serenity=fists_of_fury,if=buff.serenity.remains<1
actions.serenity+=/spinning_crane_kick,if=combo_strike&(active_enemies>=3|active_enemies>1&!cooldown.rising_sun_kick.up)
actions.serenity+=/rising_sun_kick,target_if=min:debuff.mark_of_the_crane.remains,if=combo_strike
actions.serenity+=/fists_of_fury,if=active_enemies>=3
actions.serenity+=/spinning_crane_kick,if=combo_strike&buff.dance_of_chiji.up
actions.serenity+=/blackout_kick,target_if=min:debuff.mark_of_the_crane.remains,if=combo_strike&buff.weapons_of_order_ww.up&cooldown.rising_sun_kick.remains>2
actions.serenity+=/fists_of_fury,interrupt_if=!cooldown.rising_sun_kick.up
actions.serenity+=/spinning_crane_kick,if=combo_strike&debuff.bonedust_brew.up
actions.serenity+=/fist_of_the_white_tiger,target_if=min:debuff.mark_of_the_crane.remains,if=chi<3
actions.serenity+=/blackout_kick,target_if=min:debuff.mark_of_the_crane.remains,if=combo_strike|!talent.hit_combo
actions.serenity+=/spinning_crane_kick
actions.st=whirling_dragon_punch,if=raid_event.adds.in>cooldown.whirling_dragon_punch.duration*0.8|raid_event.adds.up
actions.st+=/energizing_elixir,if=chi.max-chi>=2&energy.time_to_max>3|chi.max-chi>=4&(energy.time_to_max>2|!prev_gcd.1.tiger_palm)
actions.st+=/spinning_crane_kick,if=combo_strike&buff.dance_of_chiji.up&(raid_event.adds.in>buff.dance_of_chiji.remains-2|raid_event.adds.up)
actions.st+=/rising_sun_kick,target_if=min:debuff.mark_of_the_crane.remains,if=cooldown.serenity.remains>1|!talent.serenity
actions.st+=/fists_of_fury,if=(raid_event.adds.in>cooldown.fists_of_fury.duration*0.8|raid_event.adds.up)&(energy.time_to_max>execute_time-1|chi.max-chi<=1|buff.storm_earth_and_fire.remains<execute_time+1)|fight_remains<execute_time+1
actions.st+=/crackling_jade_lightning,if=buff.the_emperors_capacitor.stack>19&energy.time_to_max>execute_time-1&cooldown.rising_sun_kick.remains>execute_time|buff.the_emperors_capacitor.stack>14&(cooldown.serenity.remains<5&talent.serenity|cooldown.weapons_of_order.remains<5&covenant.kyrian|fight_remains<5)
actions.st+=/rushing_jade_wind,if=buff.rushing_jade_wind.down&active_enemies>1
actions.st+=/fist_of_the_white_tiger,target_if=min:debuff.mark_of_the_crane.remains,if=chi<3
actions.st+=/expel_harm,if=chi.max-chi>=1
actions.st+=/chi_burst,if=chi.max-chi>=1&active_enemies=1&raid_event.adds.in>20|chi.max-chi>=2&active_enemies>=2
actions.st+=/chi_wave
actions.st+=/tiger_palm,target_if=min:debuff.mark_of_the_crane.remains+(debuff.recently_rushing_tiger_palm.up*20),if=combo_strike&chi.max-chi>=2&buff.storm_earth_and_fire.down
actions.st+=/spinning_crane_kick,if=buff.chi_energy.stack>30-5*active_enemies&buff.storm_earth_and_fire.down&(cooldown.rising_sun_kick.remains>2&cooldown.fists_of_fury.remains>2|cooldown.rising_sun_kick.remains<3&cooldown.fists_of_fury.remains>3&chi>3|cooldown.rising_sun_kick.remains>3&cooldown.fists_of_fury.remains<3&chi>4|chi.max-chi<=1&energy.time_to_max<2)|buff.chi_energy.stack>10&fight_remains<7
actions.st+=/blackout_kick,target_if=min:debuff.mark_of_the_crane.remains,if=combo_strike&(talent.serenity&cooldown.serenity.remains<3|cooldown.rising_sun_kick.remains>1&cooldown.fists_of_fury.remains>1|cooldown.rising_sun_kick.remains<3&cooldown.fists_of_fury.remains>3&chi>2|cooldown.rising_sun_kick.remains>3&cooldown.fists_of_fury.remains<3&chi>3|chi>5|buff.bok_proc.up)
actions.st+=/tiger_palm,target_if=min:debuff.mark_of_the_crane.remains+(debuff.recently_rushing_tiger_palm.up*20),if=combo_strike&chi.max-chi>=2
actions.st+=/flying_serpent_kick,interrupt=1
actions.st+=/blackout_kick,target_if=min:debuff.mark_of_the_crane.remains,if=combo_strike&cooldown.fists_of_fury.remains<3&chi=2&prev_gcd.1.tiger_palm&energy.time_to_50<1
actions.st+=/blackout_kick,target_if=min:debuff.mark_of_the_crane.remains,if=combo_strike&energy.time_to_max<2&(chi.max-chi<=1|prev_gcd.1.tiger_palm)
actions.weapons_of_order=call_action_list,name=cd_sef,if=!talent.serenity
actions.weapons_of_order+=/call_action_list,name=cd_serenity,if=talent.serenity
actions.weapons_of_order+=/energizing_elixir,if=chi.max-chi>=2&energy.time_to_max>3
actions.weapons_of_order+=/rising_sun_kick,target_if=min:debuff.mark_of_the_crane.remains
actions.weapons_of_order+=/spinning_crane_kick,if=combo_strike&buff.dance_of_chiji.up
actions.weapons_of_order+=/fists_of_fury,if=active_enemies>=2&buff.weapons_of_order_ww.remains<1
actions.weapons_of_order+=/whirling_dragon_punch,if=active_enemies>=2
actions.weapons_of_order+=/spinning_crane_kick,if=combo_strike&active_enemies>=3&buff.weapons_of_order_ww.up
actions.weapons_of_order+=/blackout_kick,target_if=min:debuff.mark_of_the_crane.remains,if=combo_strike&active_enemies<=2
actions.weapons_of_order+=/whirling_dragon_punch
actions.weapons_of_order+=/fists_of_fury,interrupt=1,if=buff.storm_earth_and_fire.up&raid_event.adds.in>cooldown.fists_of_fury.duration*0.6
actions.weapons_of_order+=/spinning_crane_kick,if=buff.chi_energy.stack>30-5*active_enemies
actions.weapons_of_order+=/fist_of_the_white_tiger,target_if=min:debuff.mark_of_the_crane.remains,if=chi<3
actions.weapons_of_order+=/expel_harm,if=chi.max-chi>=1
actions.weapons_of_order+=/chi_burst,if=chi.max-chi>=(1+active_enemies>1)
actions.weapons_of_order+=/tiger_palm,target_if=min:debuff.mark_of_the_crane.remains+(debuff.recently_rushing_tiger_palm.up*20),if=(!talent.hit_combo|combo_strike)&chi.max-chi>=2
actions.weapons_of_order+=/chi_wave
actions.weapons_of_order+=/blackout_kick,target_if=min:debuff.mark_of_the_crane.remains,if=chi>=3|buff.weapons_of_order_ww.up
actions.weapons_of_order+=/flying_serpent_kick,interrupt=1
]]
)