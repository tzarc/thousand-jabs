if GetBuildInfo and select(4,GetBuildInfo()) < 80000 then return end

if select(3, UnitClass('player')) ~= 3 then return end

local TJ = LibStub('AceAddon-3.0'):GetAddon('ThousandJabs8')

TJ:RegisterActionProfileList('simc::hunter::beast_mastery', 'Simulationcraft Hunter Profile: Beast Mastery', 3, 1, [[
actions.precombat=flask
actions.precombat+=/augmentation
actions.precombat+=/food
actions.precombat+=/summon_pet
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/aspect_of_the_wild
actions=auto_shot
actions+=/counter_shot,if=equipped.sephuzs_secret&target.debuff.casting.react&cooldown.buff_sephuzs_secret.up&!buff.sephuzs_secret.up
actions+=/use_items
actions+=/berserking,if=cooldown.bestial_wrath.remains>30
actions+=/blood_fury,if=cooldown.bestial_wrath.remains>30
actions+=/ancestral_call,if=cooldown.bestial_wrath.remains>30
actions+=/fireblood,if=cooldown.bestial_wrath.remains>30
actions+=/lights_judgment
actions+=/potion,if=buff.bestial_wrath.up&buff.aspect_of_the_wild.up
actions+=/barbed_shot,if=pet.cat.buff.frenzy.up&pet.cat.buff.frenzy.remains<=gcd.max
actions+=/a_murder_of_crows
actions+=/spitting_cobra
actions+=/stampede,if=buff.bestial_wrath.up|cooldown.bestial_wrath.remains<gcd|target.time_to_die<15
actions+=/aspect_of_the_wild
actions+=/bestial_wrath,if=!buff.bestial_wrath.up
actions+=/multishot,if=spell_targets>2&(pet.cat.buff.beast_cleave.remains<gcd.max|pet.cat.buff.beast_cleave.down)
actions+=/chimaera_shot
actions+=/kill_command
actions+=/dire_beast
actions+=/barbed_shot,if=pet.cat.buff.frenzy.down&charges_fractional>1.4|full_recharge_time<gcd.max|target.time_to_die<9
actions+=/barrage
actions+=/multishot,if=spell_targets>1&(pet.cat.buff.beast_cleave.remains<gcd.max|pet.cat.buff.beast_cleave.down)
actions+=/cobra_shot,if=(active_enemies<2|cooldown.kill_command.remains>focus.time_to_max)&(buff.bestial_wrath.up&active_enemies>1|cooldown.kill_command.remains>1+gcd&cooldown.bestial_wrath.remains>focus.time_to_max|focus-cost+focus.regen*(cooldown.kill_command.remains-1)>action.kill_command.cost)
]])

TJ:RegisterActionProfileList('simc::hunter::marksmanship', 'Simulationcraft Hunter Profile: Marksmanship', 3, 2, [[
actions.precombat=flask
actions.precombat+=/augmentation
actions.precombat+=/food
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/hunters_mark
actions.precombat+=/double_tap,precast_time=5
actions.precombat+=/aimed_shot,if=active_enemies<3
actions.precombat+=/explosive_shot,if=active_enemies>2
actions=auto_shot
actions+=/counter_shot,if=equipped.sephuzs_secret&target.debuff.casting.react&cooldown.buff_sephuzs_secret.up&!buff.sephuzs_secret.up
actions+=/use_items
actions+=/hunters_mark,if=debuff.hunters_mark.down
actions+=/double_tap,if=cooldown.rapid_fire.remains<gcd
actions+=/berserking,if=cooldown.trueshot.remains>30
actions+=/blood_fury,if=cooldown.trueshot.remains>30
actions+=/ancestral_call,if=cooldown.trueshot.remains>30
actions+=/fireblood,if=cooldown.trueshot.remains>30
actions+=/lights_judgment
actions+=/potion,if=(buff.trueshot.react&buff.bloodlust.react)|((consumable.prolonged_power&target.time_to_die<62)|target.time_to_die<31)
actions+=/trueshot,if=cooldown.aimed_shot.charges<1
actions+=/barrage,if=active_enemies>1
actions+=/explosive_shot,if=active_enemies>1
actions+=/multishot,if=active_enemies>2&buff.precise_shots.up&cooldown.aimed_shot.full_recharge_time<gcd*buff.precise_shots.stack+action.aimed_shot.cast_time
actions+=/arcane_shot,if=active_enemies<3&buff.precise_shots.up&cooldown.aimed_shot.full_recharge_time<gcd*buff.precise_shots.stack+action.aimed_shot.cast_time
actions+=/aimed_shot,if=buff.precise_shots.down&buff.double_tap.down&(active_enemies>2&buff.trick_shots.up|active_enemies<3&full_recharge_time<cast_time+gcd)
actions+=/rapid_fire,if=active_enemies<3|buff.trick_shots.up
actions+=/explosive_shot
actions+=/barrage
actions+=/piercing_shot
actions+=/a_murder_of_crows
actions+=/multishot,if=active_enemies>2&buff.trick_shots.down
actions+=/aimed_shot,if=buff.precise_shots.down&(focus>70|buff.steady_focus.down)
actions+=/multishot,if=active_enemies>2&(focus>90|buff.precise_shots.up&(focus>70|buff.steady_focus.down&focus>45))
actions+=/arcane_shot,if=active_enemies<3&(focus>70|buff.steady_focus.down&(focus>60|buff.precise_shots.up))
actions+=/serpent_sting,if=refreshable
actions+=/steady_shot
]])

TJ:RegisterActionProfileList('simc::hunter::survival', 'Simulationcraft Hunter Profile: Survival', 3, 3, [[
actions.precombat=flask
actions.precombat+=/augmentation
actions.precombat+=/food
actions.precombat+=/summon_pet
actions.precombat+=/snapshot_stats
actions.precombat+=/potion
actions.precombat+=/steel_trap
actions.precombat+=/harpoon
actions=auto_attack
actions+=/muzzle,if=equipped.sephuzs_secret&target.debuff.casting.react&cooldown.buff_sephuzs_secret.up&!buff.sephuzs_secret.up
actions+=/use_items
actions+=/berserking,if=cooldown.coordinated_assault.remains>30
actions+=/blood_fury,if=cooldown.coordinated_assault.remains>30
actions+=/ancestral_call,if=cooldown.coordinated_assault.remains>30
actions+=/fireblood,if=cooldown.coordinated_assault.remains>30
actions+=/lights_judgment
actions+=/potion,if=buff.coordinated_assault.up&(buff.berserking.up|buff.blood_fury.up|!race.troll&!race.orc)
actions+=/variable,name=can_gcd,value=!talent.mongoose_bite.enabled|buff.mongoose_fury.down|(buff.mongoose_fury.remains-(((buff.mongoose_fury.remains*focus.regen+focus)%action.mongoose_bite.cost)*gcd.max)>gcd.max)
actions+=/steel_trap
actions+=/a_murder_of_crows
actions+=/coordinated_assault
actions+=/chakrams,if=active_enemies>1
actions+=/kill_command,target_if=min:bloodseeker.remains,if=focus+cast_regen<focus.max&buff.tip_of_the_spear.stack<3&active_enemies<2
actions+=/wildfire_bomb,if=(focus+cast_regen<focus.max|active_enemies>1)&(dot.wildfire_bomb.refreshable&buff.mongoose_fury.down|full_recharge_time<gcd)
actions+=/kill_command,target_if=min:bloodseeker.remains,if=focus+cast_regen<focus.max&buff.tip_of_the_spear.stack<3
actions+=/butchery,if=(!talent.wildfire_infusion.enabled|full_recharge_time<gcd)&active_enemies>3|(dot.shrapnel_bomb.ticking&dot.internal_bleeding.stack<3)
actions+=/serpent_sting,if=(active_enemies<2&refreshable&(buff.mongoose_fury.down|(variable.can_gcd&!talent.vipers_venom.enabled)))|buff.vipers_venom.up
actions+=/carve,if=active_enemies>2&(active_enemies<6&active_enemies+gcd<cooldown.wildfire_bomb.remains|5+gcd<cooldown.wildfire_bomb.remains)
actions+=/harpoon,if=talent.terms_of_engagement.enabled
actions+=/flanking_strike
actions+=/chakrams
actions+=/serpent_sting,target_if=min:remains,if=refreshable&buff.mongoose_fury.down|buff.vipers_venom.up
actions+=/mongoose_bite,target_if=min:dot.internal_bleeding.stack,if=buff.mongoose_fury.up|focus>60
actions+=/butchery
actions+=/raptor_strike,target_if=min:dot.internal_bleeding.stack
]])

