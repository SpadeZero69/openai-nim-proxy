# Baki Hanma (MUGEN): MUGEN 1.1 controls, boss version

Modified files for tokage's Baki Hanma character (WinMUGEN, last updated
2014/7/6). The controls follow the MUGEN 1.1 six-button layout, and the
character is set up as a hard boss.

| Button | Role         | Button | Role        |
|--------|--------------|--------|-------------|
| x      | Light Punch  | a      | Light Kick  |
| y      | Medium Punch | b      | Medium Kick |
| z      | Heavy Punch  | c      | Heavy Kick  |
| s      | Taunt        |        |             |

Standing z is the Elbow Strike and standing c the Back Kick; z and c also work
as the strong buttons for specials (z like y, c like b). The Flying Heel Drop
takes any kick, so QCF + b gives the Heel Drop instead of the Middle Kick. The
full list, written for PC keyboard players, is in
`Baki - Move List (MUGEN 1.1).txt`.

## Easy controls

No move needs two buttons pressed together, and every super is one tap of
Forward or Back plus one button (the same button its full motion used):

| Input            | Super                                   |
|------------------|-----------------------------------------|
| Forward + x      | Goutaijutsu (1 bar)                     |
| Forward + y      | Triceratops Fist (2 bars)               |
| Forward + c      | Cockroach Tackle (1 bar)                |
| Forward + a      | Endorphin Release (1 bar, once a round) |
| Back + x         | Trigger Counter (2 bars)                |
| Back + y         | Breathless Rush (3 bars)                |
| Back + b or c    | Tiger King (1 bar)                      |

- The direction has to be pressed at most 12 ticks (1/5 second) before the
  button, or together with it (commands `tapfwd` / `tapback`). Holding the
  direction longer (walking) and then pressing a button gives the normal
  attack, and without enough meter the normal attack comes out too.
- The easy supers are checked after the specials, and not within 20 ticks of
  a Down press (15 ticks of a Forward press for Tiger King, because of the
  overhead), so Down, Forward + button stays a special move.
- They cancel out of the same attacks as the full-motion supers, which still
  work.
- Not while running (states 100, 101), so Forward, Forward, x is still the
  running punch.
- Throws: Forward + z and Back + z next to the opponent. The x + y throws
  are gone.
- Air recovery: any attack button (x + y still works).

The inputs were checked frame by frame on 40 test cases (a MUGEN command
matcher plus the state -1 entries), under both possible rules for keys
pressed on the same tick. Compared with v5, the only results that changed are
the easy supers and the x + y throw.

## Boss features

- **Automatic meter:** 10 power every 3 frames, one bar every 5 seconds.
- **Slow healing:** 1 life every 20 frames (3 per second) while not being hit.
- **Hyper armor** on the heavy normals: absorbs one hit (Baki takes the damage
  and keeps attacking). It reuses the armor state the original author built
  for palette 12. Throws beat it.
- **Invincible startup** on Mach Punch and Himokiri, and on the Whip Strike
  charge cancel. Most supers were already invincible.
- **Awakening** at 35% life (once per round): meter locked at full, the faster
  animations the author made for palettes 11/12, and hyper armor on everything
  he does. Attack states reuse the armor state 1008; when not attacking, the
  new state 1009 takes the hit without knockback. Comes with a flash, a sound
  and an after-image trail.
- **Boss AI** (CPU only), in front of the original AI:
  - aggression rises as his life drops: guard 95% at full life down to 40%
    when awakened, and at low life he swings armored punches through attacks
    instead of blocking;
  - 8 combo routes, one picked at random per attack. Every link is checked
    against the frame data (startup vs. hitstun, reach vs. pushback). The
    routes end in supers when there's meter, otherwise in specials, so every
    move of the character gets used;
  - counters when he can't block (cancels his own whiffed attack into an
    invincible move, escapes throws with the Heel Drop), invincible reversals,
    anti-airs, air counters, guard cancels;
  - more movement (runs, walks, jumps in, backs off, closes in on knockdowns),
    specials in neutral, overheads against crouching guards, throws;
  - the CPU takes 20% less damage.
- Input windows: specials 20 ticks (was 10), full-motion supers 30 ticks
  (was 20/25).

All boss settings are at the top of `baki-2.cns`: who gets the boss powers
(always / CPU only / nobody), boss AI on/off, meter speed, healing speed, CPU
toughness and the awakening threshold. Only WinMUGEN-era triggers are used,
because Baki runs in MUGEN 1.1's pre-1.0 compatible mode.

## Files

- `baki.cmd.cns`: command file. Keeps every original command definition
  (including the Japanese names and unused ones such as `up`, which a custom
  `common1.cns` may need), plus the z/c variants and the easy-super inputs.
- `baki-2.cns`: boss settings, automatic meter, healing, CPU toughness,
  awakening.
- `bakiAI.cns`: boss AI block added before the original AI.
- `baki-N.cns`: hyper armor on the heavy normals, faster animations while
  awakened, armor state 1009.
- `baki-S.cns`: invincible startup on Mach Punch, Himokiri, Whip cancel.
- `Baki - Move List (MUGEN 1.1).txt`: move list for PC keyboard players.

The state files only gain added blocks; no original line is changed. They are
Shift-JIS encoded; keep that encoding if you edit them.

## Install

Copy these files into your existing `chars/baki/` folder and overwrite.

Baki has no `common1.cns` of its own; it uses MUGEN's standard
`data/common1.cns`. If `chars/baki/` contains a `common1.cns` (left over from
another character, for example), delete it. Baki is a WinMUGEN character
("pre-1.0 compatible mode"), so a common file that uses MUGEN 1.0+ triggers
such as `AILevel` stops it from loading with "Trigger not valid for
mugenversion of character".

## Changes

- v6: easy controls. Every super on a tap of Forward or Back plus one button,
  throws on Forward/Back + z only (no x + y), air recovery with any attack
  button. The boss files are the same as v5.
- v5: rebuilt boss AI (life-based aggression, 8 frame-checked combo routes
  using every move, counters when he can't block, more movement and
  specials), slow healing, meter one bar per 5 seconds, awakening at 35% life.
- v4: boss version (boss AI, automatic meter, hyper armor, invincible
  startups, CPU toughness), special-move windows 10 -> 20 ticks, move list
  rewritten for PC keyboard players.
- v3: super moves accept a longer input window, 30 ticks (half a second)
  instead of 20 (25 for the D, F, D, B motions).
- v2: the first version dropped command names the character doesn't use
  (`up`, `fwd`, ...). A `common1.cns` that refers to them then failed with
  `Undefined command label`. All original command names are back, and
  `baki-S.cns` is the original file again. The command file also accepts the
  first version's `baki-S.cns`.
