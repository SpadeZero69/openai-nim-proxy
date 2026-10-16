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

Every move keeps its original input. Standing z is the Elbow Strike and
standing c the Back Kick; z and c also work as the strong buttons for specials
and supers (z like y, c like b). The Flying Heel Drop takes any kick, so QCF + b
gives the Heel Drop instead of the Middle Kick. The full list, written for PC
keyboard players, is in `Baki - Move List (MUGEN 1.1).txt`.

## Boss features

- **Automatic meter:** about 1 bar every 8 seconds, for the player and the CPU.
- **Hyper armor** on the heavy normals: absorbs one hit (Baki takes the damage
  and keeps attacking). It reuses the armor state the original author built
  for palette 12. Throws beat it.
- **Invincible startup** on Mach Punch and Himokiri, and on the Whip Strike
  charge cancel. Most supers were already invincible.
- **Boss AI** (CPU only): sits in front of the original AI. Combos always go
  through and end in supers when there's meter. It also reverses with
  invincible moves, blocks with a 95% chance, anti-airs, guard cancels and
  dashes in. The CPU takes 20% less damage.
- Input windows: specials 20 ticks (was 10), supers 30 ticks (was 20/25).

All boss settings are at the top of `baki-2.cns` (on/off switches, meter speed,
CPU toughness). Only MUGEN-1.0-free (WinMUGEN) triggers are used, because
Baki runs in MUGEN 1.1's pre-1.0 compatible mode.

## Files

- `baki.cmd.cns`: command file. Keeps every original command definition
  (including the Japanese names and unused ones such as `up`, which a custom
  `common1.cns` may need), plus the z/c variants.
- `baki-2.cns`: boss settings, automatic meter, CPU toughness.
- `bakiAI.cns`: boss AI block added before the original AI.
- `baki-N.cns`: hyper armor on the heavy normals.
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
