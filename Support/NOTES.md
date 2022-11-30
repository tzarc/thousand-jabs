# Notes

General notes so I don't forget things. Carry on with your day, nothing to see here.

## Tooltips

Older reference can be found [here on wowdev.wiki](https://wowdev.wiki/Spells).

| Variable                | Description                                                                                              |
|-------------------------|----------------------------------------------------------------------------------------------------------|
| `${exprA+exprB}`        | Calculate the internal expression and return the result                                                  |
| `$m3`                   | "Lower Value"? of effect #3 -- multiply scaled_value by multiplier_delta, subtract half from base_value? |
| `$M3`                   | "Upper Value"? of effect #3 -- multiply scaled_value by multiplier_delta, add half to base_value?        |
| `$12345s3`              | "Scaled Value"? of spell 12345's effect #3                                                               |
| `$?a12345[true][false]` | If aura 12345 is active, return "true" otherwise "false"                                                 |
| `$?s12345[true][false]` | If talent? 12345 is active, return "true" otherwise "false"                                              |
| `${$min($12345h,100)}`  | Minimum proc chance between spell 12345 and 100                                                          |

### Demon's Bite

```xml
  <spell id="162243" name="Demon's Bite" replaces_name="Demon's Bite" replaces_id="344859" range="5" gcd="1.5">
    <spec id="Havoc Demon Hunter" name="havoc" />
    <class id="demonhunter" name="Demon Hunter" />
    <attributes>000010000000000010100000000000000000000001000000000000000011000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000</attributes>
    <effects count="3">
      <effect number="1" id="227730" type="3" type_text="Dummy (3)" sub_type="0" base_value="0" scaled_value="0" />
      <effect number="2" id="227731" type="2" type_text="School Damage (2)" school="physical" school_text="physical" sub_type="0" base_value="0" scaled_value="0" multiplier_delta="0.05" ap_coefficient="0.6186" />
      <effect number="3" id="287985" type="30" type_text="Energize Power (30)" sub_type="0" base_value="25" scaled_value="25" multiplier_delta="0.4" misc_value_energize="fury" />
    </effects>
    <description>Quickly attack for $s2 Physical damage.

|cFFFFFFFFGenerates $?a258876[${$m3+$258876s3} to ${$M3+$258876s4}][$m3 to $M3] Fury.|r</description>
  </spell>
```

```
Name             : Demon's Bite (id=162243) [Spell Family (107)]
Replaces         : Demon's Bite (id=344859)
Class            : Havoc Demon Hunter
School           : Physical
Spell Type       : Melee
Range            : 5 yards
GCD              : 1.5 seconds
Requires weapon  : One-handed Axe, Two-handed Axe, One-handed Mace, Two-handed Mace, Polearm, One-handed Sword, Two-handed Sword, War Glaive, Staff, Fist Weapon, Dagger, Spear
Affecting spells : Demon Soul (163073 effects: #1, #2), Momentum (208628 effects: #1, #2), Havoc Demon Hunter (212612 effects: #1, #2, #3), Vengeance Demon Hunter (212613 effect#3), Chaos Blades (247938 effects: #2, #3), Insatiable Hunger (258876 effect#2), Chaotic Transformation (288754 effect#2), Mark of the Ogre (326486 effect#3), Demon Soul (347765 effects: #1, #2), Seething Chaos (394934 effects: #1, #2)
Triggered by     : Demon's Bite (344859)
Family Flags     : 0, 16, 32, 42
Attributes       : ....x... ........ x.x..... ........   ........ .x...... ........ ..xx....
                 : ........ ........ ........ ........   ........ ..x..... ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ .....x.. ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   x....... ........ ........ ........
                 : ........ ........ ........ ........
                 : Is Ability (4), Not Shapeshifted (16), Do Not Sheath (18), Initiates Combat (Enables Auto-Attack) (41), Require All Targets (58), Discount Power On Miss (59), Requires Main-Hand Weapon (106), Not In Spellbook Until Learned (269), Allow Class Ability Procs (416)
Effects          :
#1 (id=227730)   : Dummy (3)
                   Base Value: 0 | Scaled Value: 0 | PvP Coefficient: 1.00000 | Target: Enemy (6)
#2 (id=227731)   : School Damage (2): physical
                   Base Value: 0 | Scaled Value: 0 (coefficient=0, delta coefficient=0.05) | AP Coefficient: 0.61860 | PvP Coefficient: 1.00000 | Target: Enemy (6)
#3 (id=287985)   : Energize Power (30)
                   Base Value: 25 | Scaled Value: 25 (coefficient=0, delta coefficient=0.4) | PvP Coefficient: 1.00000 | Misc Value: fury | Target: Self (1)
Description      : Quickly attack for $s2 Physical damage.

|cFFFFFFFFGenerates $?a258876[${$m3+$258876s3} to ${$M3+$258876s4}][$m3 to $M3] Fury.|r
```

```xml
  <spell id="258876" name="Insatiable Hunger" passive="true">
    <class id="demonhunter" name="Demon Hunter" />
    <attributes>000000111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000</attributes>
    <effects count="4">
      <effect number="1" id="483101" type="6" type_text="Apply Aura (6)" sub_type="4" sub_type_text="Dummy (4)" base_value="10" scaled_value="10" />
      <effect number="2" id="808931" type="6" type_text="Apply Aura (6)" sub_type="108" sub_type_text="Add Percent Modifier (108)" modifier="0" modifier_text="Spell Direct Amount (0)" base_value="50" scaled_value="50" ap_coefficient="0.1" />
      <effect number="3" id="833728" type="3" type_text="Dummy (3)" sub_type="0" base_value="5" scaled_value="5" />
      <effect number="4" id="833729" type="3" type_text="Dummy (3)" sub_type="0" base_value="10" scaled_value="10" />
    </effects>
    <description>Demon's Bite deals $s2% more damage and generates $s3 to $s4 additional Fury.</description>
  </spell>
```

```
Name             : Insatiable Hunger (id=258876) [Spell Family (107), Passive, Hidden]
Talent Entry     : Havoc [tree=spec, row=2, col=2, max_rank=1, req_points=0, select_idx=100]
Class            : Demon Hunter
School           : Physical
Spell Type       : None
Attributes       : ......xx x....... ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ .......x ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........
                 : Passive (6), Do Not Display (Spellbook, Aura Icon, Combat Log) (7), Do Not Log (8), Not In Spellbook (143)
Effects          :
#1 (id=483101)   : Apply Aura (6) | Dummy (4)
                   Base Value: 10 | Scaled Value: 10 | PvP Coefficient: 1.00000 | Target: Self (1)
#2 (id=808931)   : Apply Aura (6) | Add Percent Modifier (108): Spell Direct Amount (0)
                   Base Value: 50 | Scaled Value: 50 | AP Coefficient: 0.10000 | PvP Coefficient: 1.00000 | Target: Self (1)
                   Affected Spells: Demon's Bite (162243), Demon's Bite (344859)
                   Family Flags: 0
#3 (id=833728)   : Dummy (3)
                   Base Value: 5 | Scaled Value: 5 | PvP Coefficient: 1.00000
#4 (id=833729)   : Dummy (3)
                   Base Value: 10 | Scaled Value: 10 | PvP Coefficient: 1.00000
Description      : Demon's Bite deals $s2% more damage and generates $s3 to $s4 additional Fury.
```

#### In-game:

- If `spell:258876` _"Insatiable Hunger"_ is active
    - Tooltip reads "Generates 25 to 40 Fury"
- If `spell:258876` _"Insatiable Hunger"_ is not active
    - Tooltip reads "Generates 20 to 30 Fury"

#### Tooltip decomposition:

- `$?a258876[${$m3+$258876s3} to ${$M3+$258876s4}][$m3 to $M3]`
    - `$m3` => 25 - (25*0.4)/2 => 20
    - `$M3` => 25 + (25*0.4)/2 => 30
    - `$258876s3` => `spell:258876`, effect #3, scaled value => 5
    - `$258876s4` => `spell:258876`, effect #4, scaled value => 10
    - `${$m3+$258876s3}` => `${20+5}` => 25
    - `${$M3+$258876s4}` => `${30+10}` => 40
- If _Insatiable Hunger_ is active:
    - "Generates 25 to 40 Fury."
- If _Insatiable Hunger_ is not active:
    - "Generates 20 to 30 Fury."

### Cobalt Frag Bomb

```xml
  <spell id="67890" name="Cobalt Frag Bomb" range="45" cast_time_else="0.5" velocity="25" duration="3" cooldown="60" stacks_initial="2" stacks_max="2" proc_chance="100">
    <attributes>000000000000010000000000000000000001000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000</attributes>
    <effects count="2">
      <effect number="1" id="62076" type="2" type_text="School Damage (2)" school="fire" school_text="fire" sub_type="0" base_value="0" scaled_value="23.98560906616875" scaled_value_max="32.02281840883125" multiplier_coefficient="10.9375" multiplier_delta="0.287" />
      <effect number="2" id="62077" type="6" type_text="Apply Aura (6)" sub_type="12" sub_type_text="Stun (12)" base_value="3" scaled_value="3" sp_coefficient="1" />
    </effects>
    <description>Detatch and throw a thermal grenade, inflicting ${$m1*10} to ${$M1*10} Fire damage and incapacitating targets for $d in a $a1 yard radius.  Any damage will break the effect.

The thermal grenade has no effect on creatures above level $ctrmax2067.</description>
    <tooltip>Incapacitated.  Any damage will break the effect.</tooltip>
  </spell>
```

```
Name             : Cobalt Frag Bomb (id=67890)
School           : Fire
Spell Type       : Magic
Max Scaling Level: 27
Req. Max Level   : 49
Range            : 45 yards
Cast Time        : 0.5 seconds
Velocity         : 25 yards/sec
Duration         : 3 seconds
Cooldown         : 60 seconds
Category         : 1283
Category Cooldown: 60 seconds
Stacks           : 2 initial, 2 maximum
Proc Chance      : 100%
Proc Flags       : ........ ........ ....x... ........
                 : Any Damage Taken
Attributes       : ........ .....x.. ........ ........   ...x...x ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ ........ x....... ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........   ........ ........ ........ ........
                 : ........ ........ ........ ........
                 : Allow Item Spell In PvP (13), No Redirection (35), No Reflection (39), Not In Arena or Rated Battleground (144)
Effects          :
#1 (id=62076)    : School Damage (2): fire | Scaling Class: -4
                   Base Value: 0 | Scaled Value: 23.98561 - 32.02282 (coefficient=10.9375, delta coefficient=0.287) | PvP Coefficient: 1.00000 | Radius: 3 yards | Target: AOE enemy (instant) (16)
#2 (id=62077)    : Apply Aura (6) | Stun (12)
                   Base Value: 3 | Scaled Value: 3 | SP Coefficient: 1.00000 | PvP Coefficient: 1.00000 | Radius: 3 yards | Mechanic: Incapacitate | Target: AOE enemy (instant) (16)
Description      : Detatch and throw a thermal grenade, inflicting ${$m1*10} to ${$M1*10} Fire damage and incapacitating targets for $d in a $a1 yard radius.  Any damage will break the effect.

The thermal grenade has no effect on creatures above level $ctrmax2067.
Tooltip          : Incapacitated.  Any damage will break the effect.
```

#### In-game:

Per Wowhead:

- Tooltip reads "inflicting 220 to 280 Fire damage" at level 21-27
- Tooltip reads "inflicting 190 to 250 Fire damage" at level 1-20

#### Tooltip decomposition:

- `$m1` => ?
- `$M1` => ?