# Broly (DBS): MUGEN 1.1 conversion

Modified files for Broly (DBS) by Blue (sprites by Blue and Kimex), with
coldskin1's "infinite scaling" edit, converted to a MUGEN 1.1 character.

The character was already close to MUGEN 1.1. It uses 1.1 features: Explod
`remappal` colors the grayscale effect sprites per palette (348 Explods),
plus Explod `angle` and GameWidth/GameHeight. Every controller and every
trigger is valid in MUGEN 1.1. The conversion fixes what was left.

## Scaling with no limit

The infinite-scaling edit keeps a level in `var(52)`, never capped.
`IntPersistIndex = 52` keeps it between rounds. `fvar(19)` is the
multiplier taken from it: the level, or 8 x the level while transformed
(helper 6990 exists).

The level now goes up by 1 every second of fighting (the edit had +1 every
600 ticks of `GameTime`, 10 seconds): 1 at the start, 61 at one minute,
121 at two minutes. Statedef -2 adds up the fighting time in `var(56)`:
the GameTime that passed since the last tick (`var(53)` holds GameTime + 1
of the last tick), only while `RoundState = 2`. Pauses count, because the
ticks Broly spends paused are added when he runs again; intros and round
ends don't. Each tick the clock adds `var(56) / 60 + 1` minus the levels
it already gave (`var(54)`), so the extra levels from state 1200 stay.

- Damage: `AttackMulSet` = `fvar(19)` (Statedef -2, and in the helper
  states that make attacks).
- Durability: `DefenceMulSet` = `2 * fvar(19)` (damage taken divided by
  it; it was `fvar(19)`, so durability now grows twice as fast).
- Hyper armor: while the armor helper 60001 holds, Broly is NotHitBy and
  the invisible helper, which copies his animation and so his hurt boxes,
  takes the hits through a HitOverride. Each hit adds 1 to `var(13)` and
  passes `damage / (2 * fvar(19))` to Broly as a LifeAdd, which his
  DefenceMulSet divides again. The armor breaks when `var(13)` passes
  `2 * fvar(19)` (it was `fvar(19)`), so it holds 2 more hits per level;
  `var(13)` goes back to 0 after the hit that breaks it.
- Regeneration (added): Statedef -2 adds `4 * var(52) * LifeMax / 60000`
  life per tick to an accumulator (`fvar(38)`) during `RoundState = 2`
  and heals the whole part, so he heals level x 0.4% of his max life per
  second (24.4% at one minute). The 4 is the tuning value (it was 2).
  MUGEN 1.1 has no controller that raises the maximum life during a
  match, so his life bar keeps its size.

## One-minute mode

From one minute of fighting on (`var(56) >= 3600`), `var(55)` is 1 for the
rest of the match, and the attacks of Broly and his helpers reach the
whole screen and can't be avoided. States read it as
`cond(IsHelper, (root,var(55)), var(55))`.

- Every HitDef (37) has a copy right after it. The original gets
  `triggerall = !(one-minute mode)` and the copy `triggerall = (one-minute
  mode)`, as the first trigger, so exactly one of them runs and side
  effects in the other triggers happen once. The copy differs in three
  lines:
  - `attr` has no state type (`attr = , NA`). NotHitBy, HitOverride and
    ReversalDef only match attacks whose state type (S, C, A) they list,
    so they never match it: invincibility frames, parries and counters
    don't stop it.
  - no `guardflag`, so it can't be blocked.
  - `hitflag = MAFD`: it hits standing, crouching, airborne, falling and
    lying opponents.
- The animation file has a copy of each of the 32 actions with attack
  boxes, numbered action + 20000, with the same sprites, timing and hurt
  boxes, and one attack box of -10000,-10000 to 10000,10000. At the end of
  each of the 36 attack states, a ChangeAnim swaps to the copy
  (`value = Anim + 20000`, `elem = AnimElemNo(0)`). Being the last
  controller, it runs on the tick the state set the animation, so the
  element and its timing don't change and `AnimElem` triggers don't fire
  twice.
- The 17 `Anim = N` checks on those actions (states 220, 625, 1350, 1700,
  3000) compare `Anim % 20000`, so they accept the copy.
- AI: in the attack entries of the command file, the 28 "close enough"
  checks (`p2bodydist X/Y <` or `<=`) also pass in one-minute mode, so the
  AI attacks from any distance.

Not bypassed: an opponent whose current frame has no hurt box (Clsn2) can't
be hit by any HitDef, an opponent under HitBy only takes the attacks it
lists, and the juggle limit (Statedef `juggle`) still applies.

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
    `value = 1.75`. It is an integer, so that always added 1. That
    controller is now the match clock (see "Scaling with no limit").
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
  - 32 full-screen copies of the attack actions, numbered + 20000, for
    the one-minute mode (added at the end of the file).
- Special moves: input window 15 -> 20 ticks (1/3 second). The ultimate
  stays at 30.
- `Broly (DBS) - Move List (MUGEN 1.1).txt`: move list for PC keyboard
  players (buttons, chains, specials, costs, the scaling table).
- Regeneration, damage-scaling fixes, the faster level, the doubled
  durability and armor, and the one-minute mode (see above).

Unchanged: the button layout (it already uses all seven MUGEN buttons),
sprites, sounds, palettes and the AI apart from the 15800 fix and the
one-minute distance checks. Two DefenceMulSet parameters only IKEMEN reads
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
