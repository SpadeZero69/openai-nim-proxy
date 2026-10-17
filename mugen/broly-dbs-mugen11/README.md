# Broly (DBS): MUGEN 1.1 conversion

Modified files for Broly (DBS) by Blue (sprites by Blue and Kimex), with
coldskin1's "infinite scaling" edit, converted to a MUGEN 1.1 character.

The character was already close to MUGEN 1.1. It uses 1.1 features: Explod
`remappal` colors the grayscale effect sprites per palette (348 Explods),
plus Explod `angle` and GameWidth/GameHeight. Every controller and every
trigger is valid in MUGEN 1.1. The conversion fixes what was left.

## Scaling with no limit

The infinite-scaling edit keeps a level in `var(52)`: +1 every 600 ticks
(10 seconds) of `GameTime`, starting at 1, never capped. `IntPersistIndex
= 52` keeps it between rounds. `fvar(19)` is the multiplier taken from it:
the level, or 8 x the level while transformed (helper 6990 exists).

- Damage: `AttackMulSet` = `fvar(19)` (Statedef -2, and in the helper
  states that make attacks).
- Durability: `DefenceMulSet` = `fvar(19)` (damage taken divided by it),
  and the armor helper 60001 absorbs `fvar(19)` hits before he flinches.
- Regeneration (added): Statedef -2 adds `2 * var(52) * LifeMax / 60000`
  life per tick to an accumulator (`fvar(38)`) during `RoundState = 2`
  and heals the whole part, so he heals level x 0.2% of his max life per
  second. The 2 is the tuning value.

Damage scaling fixes (added): the air grab (620) and its follow-up (621)
are Broly's own states but read `parent,fvar(19)`, which doesn't exist for
him, so they now read `fvar(19)`. The meteor rain helper (1275) read its
own `fvar(19)` instead of Broly's (`parent,fvar(19)` now), and the ki burst
helper (2000) had no multiplier (it gets `parent,fvar(19)`).

## Changes

- `Broly (DBS).def`: `mugenversion = 1.0` -> `1.1`.
- Explod positions: MUGEN 1.1 characters default to `postype = none`,
  1.0 characters to `p1`. Three Explods in `common1.cns` (landing dust)
  had no postype; they now say `postype = p1`, so nothing moves. The other
  445 Explods already set one.
- PlaySnd: 225 values written as `S0,19` are now `0,19`. MUGEN's
  documentation only defines the `F` prefix for PlaySnd (`S` is defined for
  HitDef hit/guard sounds and SuperPause, which keep it). Without a prefix
  PlaySnd plays from the character's own .snd, so the sounds are the same.
  No PlaySnd runs in a state the opponent is put into.
- Integer parameters that were given decimal numbers. MUGEN refuses them
  when loading ("Expected int value and read float"); IKEMEN accepts them
  and drops the fraction. All eight come from the infinite-scaling edit:
  - command file: the scaling counter `var(52)` was increased with
    `value = 1.75`. It is an integer, so that always added 1; it now
    says `value = 1`.
  - `value = var(52)*.25` (state 1200) -> `value = var(52)/4`.
  - six damage formulas that multiply by the float `fvar(19)` (states
    1501, 1801, 6631, 6806, 6900 and the armor state 6005) are wrapped
    in `floor()`, which gives the same whole number.
- `guardflag = MAFD` in the dash strike -> `MA` (F and D are hit flags,
  not guard flags).
- AI fix: the AI's "Super Saiyan 2" entry in the command file jumped to
  state 15800, which doesn't exist. It now goes to the transformation
  (state 800) like the other AI transformation entries.
- Helper states 6990 and 7990 (invisible) used animation 64578, which
  doesn't exist. They now use 9999, the character's blank animation.
- Animation file:
  - It started with a damaged copy of action 0 (a stray collision box and
    a header written as `2[Begin Action 0]`). This is commented out; the
    real action 0 follows it.
  - Action 221 had a frame line with a collision box pasted into it, now
    commented out. State 220 leaves that animation before it reaches the
    frame.
- Special moves: input window 15 -> 20 ticks (1/3 second). The ultimate
  stays at 30.
- `Broly (DBS) - Move List (MUGEN 1.1).txt`: move list for PC keyboard
  players (buttons, chains, specials, costs, the scaling table).
- Regeneration and damage-scaling fixes (see above).

Unchanged: the button layout (it already uses all seven MUGEN buttons),
sprites, sounds, palettes and the AI apart from the 15800 fix. Two DefenceMulSet parameters only IKEMEN reads
(`onhit`, `multype`) are left in place; MUGEN ignores them.

## Files

```
Broly (DBS)/
  Broly (DBS).def
  Broly (DBS) - Move List (MUGEN 1.1).txt
  -/Broly (DBS).cmd
  -/Broly (DBS).cns
  -/Broly (DBS).air
  -/common1.cns
```

The sprite, sound, palette and icon files are not in this repository. They
are unchanged, so take them from the original download.

## Install

Copy the `Broly (DBS)` folder over the original one in `chars/` (the
`-` folder holds the character's data), then add a `Broly (DBS)` line
under `[Characters]` in `data/select.def`.
