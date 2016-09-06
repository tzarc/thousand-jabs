local _, internal = ...
internal.apls = internal.apls or {}

internal.apls["legion-dev::Tier19P::Monk_Windwalker_T19P"] = [[
actions.precombat=flask,type=flask_of_the_seventh_demon
actions.precombat+=/food,type=nightborne_delicacy_platter
actions.precombat+=/augmentation,type=defiled
actions.precombat+=/snapshot_stats
actions.precombat+=/potion,name=deadly_grace
actions=auto_attack
actions+=/invoke_xuen
actions+=/potion,name=deadly_grace,if=buff.serenity.up|buff.storm_earth_and_fire.up|(!talent.serenity.enabled&trinket.proc.agility.react)|buff.bloodlust.react|target.time_to_die<=60
actions+=/touch_of_death,if=!artifact.gale_burst.enabled
actions+=/touch_of_death,if=artifact.gale_burst.enabled&cooldown.strike_of_the_windlord.remains<8&cooldown.fists_of_fury.remains<=3&cooldown.rising_sun_kick.remains<8
actions+=/blood_fury
actions+=/berserking
actions+=/arcane_torrent,if=chi.max-chi>=1
actions+=/storm_earth_and_fire,if=artifact.strike_of_the_windlord.enabled&cooldown.strike_of_the_windlord.remains<14&cooldown.fists_of_fury.remains<=9&cooldown.rising_sun_kick.remains<=5
actions+=/storm_earth_and_fire,if=!artifact.strike_of_the_windlord.enabled&cooldown.fists_of_fury.remains<=9&cooldown.rising_sun_kick.remains<=5
actions+=/serenity,if=artifact.strike_of_the_windlord.enabled&cooldown.strike_of_the_windlord.remains<7&cooldown.fists_of_fury.remains<=3&cooldown.rising_sun_kick.remains<8
actions+=/serenity,if=!artifact.strike_of_the_windlord.enabled&cooldown.fists_of_fury.remains<=3&cooldown.rising_sun_kick.remains<8
actions+=/energizing_elixir,if=energy<energy.max&chi<=1&buff.serenity.down
actions+=/rushing_jade_wind,if=buff.serenity.up&!prev_gcd.rushing_jade_wind
actions+=/strike_of_the_windlord
actions+=/whirling_dragon_punch
actions+=/fists_of_fury
actions+=/call_action_list,name=st,if=active_enemies<3
actions+=/call_action_list,name=aoe,if=active_enemies>=3
actions.opener=blood_fury
actions.opener+=/berserking
actions.opener+=/arcane_torrent,if=chi.max-chi>=1
actions.opener+=/fists_of_fury,if=buff.serenity.up&buff.serenity.remains<1.5
actions.opener+=/rising_sun_kick
actions.opener+=/blackout_kick,if=chi.max-chi<=1&cooldown.chi_brew.up|buff.serenity.up
actions.opener+=/serenity,if=chi.max-chi<=2
actions.opener+=/tiger_palm,if=chi.max-chi>=2&!buff.serenity.up
actions.st=rising_sun_kick
actions.st+=/rushing_jade_wind,if=chi>1&!prev_gcd.rushing_jade_wind
actions.st+=/chi_wave,if=energy.time_to_max>2|buff.serenity.down
actions.st+=/chi_burst,if=energy.time_to_max>2|buff.serenity.down
actions.st+=/blackout_kick,if=(chi>1|buff.bok_proc.up)&buff.serenity.down&!prev_gcd.blackout_kick
actions.st+=/tiger_palm,if=(buff.serenity.down&chi<=2)&!prev_gcd.tiger_palm
actions.aoe=spinning_crane_kick,if=!prev_gcd.spinning_crane_kick
actions.aoe+=/rising_sun_kick,cycle_targets=1
actions.aoe+=/rushing_jade_wind,if=chi>1&!prev_gcd.rushing_jade_wind
actions.aoe+=/chi_wave,if=energy.time_to_max>2|buff.serenity.down
actions.aoe+=/chi_burst,if=energy.time_to_max>2|buff.serenity.down
actions.aoe+=/blackout_kick,if=(chi>1|buff.bok_proc.up)&!prev_gcd.blackout_kick,cycle_targets=1
actions.aoe+=/tiger_palm,if=(buff.serenity.down&chi.max-chi>1)&!prev_gcd.tiger_palm,cycle_targets=1
]]

