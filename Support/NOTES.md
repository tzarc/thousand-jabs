# Notes

General notes so I don't forget things. Carry on with your day, nothing to see here.

## Tooltips

Older reference can be found [here on wowdev.wiki](https://wowdev.wiki/Spells).

| Variable                | Description                                                                                             |
|-------------------------|---------------------------------------------------------------------------------------------------------|
| `${exprA+exprB}`        | Calculate the internal expression and return the result                                                 |
| `$m3`                   | "Lower Value"? of effect #3 -- multiply scaled_value by multiplier_delta, subtract half from base_value |
| `$M3`                   | "Upper Value"? of effect #3 -- multiply scaled_value by multiplier_delta, add half to base_value        |
| `$12345s3`              | "Scaled Value"? of spell 12345's effect #3                                                              |
| `$?a12345[true][false]` | If aura 12345 is active, return "true" otherwise "false"                                                |
| `$?s12345[true][false]` | If talent? 12345 is active, return "true" otherwise "false"                                             |
| `${$min($12345h,100)}`  | Minimum proc chance between spell 12345 and 100                                                         |

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

#### In-game:

- Tooltip reads "inflicting 220 to 280 Fire damage"

#### Tooltip decomposition:

- `$m1` => 