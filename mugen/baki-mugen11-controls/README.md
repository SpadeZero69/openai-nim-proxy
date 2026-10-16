# Baki Hanma (MUGEN): MUGEN 1.1 six-button controls

Converted command file for tokage's Baki Hanma character (WinMUGEN, last
updated 2014/7/6). Only the inputs changed. Damage, frame data, combo routes
and the AI are the same as the original.

| Button | Role         | Button | Role        |
|--------|--------------|--------|-------------|
| x      | Light Punch  | a      | Light Kick  |
| y      | Medium Punch | b      | Medium Kick |
| z      | Heavy Punch  | c      | Heavy Kick  |
| s      | Taunt        |        |             |

Every move keeps its original input. The z and c buttons were unused before.
They now have their own normals: standing z is the Elbow Strike and standing c
is the Back Kick. They also work as the strong buttons for specials and supers
(z like y, c like b). The Flying Heel Drop now takes any kick, so QCF + b gives
the Heel Drop instead of the Middle Kick. The full list is in
`Baki - Move List (MUGEN 1.1).txt`.

## Files

- `baki.cmd.cns`: the converted command file. It keeps every command
  definition of the original file unchanged, including the Japanese command
  names and the ones the character never uses itself (`up`, `fwd`, `back`,
  `down`, ...), because a custom `common1.cns` can refer to them. The file is
  Shift-JIS encoded; keep that encoding if you edit it.
- `Baki - Move List (MUGEN 1.1).txt`: the English move list.

All other files of the character are unchanged.

## Install

Copy both files into your existing `chars/baki/` folder and overwrite.

Baki has no `common1.cns` of its own; it uses MUGEN's standard
`data/common1.cns`. If `chars/baki/` contains a `common1.cns` (left over from
another character, for example), delete it. Baki is a WinMUGEN character
("pre-1.0 compatible mode"), so a common file that uses MUGEN 1.0+ triggers
such as `AILevel` stops it from loading with "Trigger not valid for
mugenversion of character".

## Changes

- v3: super moves accept a longer input window, 30 ticks (half a second)
  instead of 20 (25 for the D, F, D, B motions).
- v2: the first version dropped command names the character doesn't use
  (`up`, `fwd`, ...). A `common1.cns` that refers to them then failed with
  `Undefined command label`. All original command names are back, and
  `baki-S.cns` is the original file again. The command file also accepts the
  first version's `baki-S.cns`.
