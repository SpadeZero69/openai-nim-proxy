# Baki Hanma (MUGEN): MUGEN 1.1 six-button controls

Converted command files for tokage's Baki Hanma character (WinMUGEN, last
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

- `baki.cmd.cns`: the rewritten command file (English, plain ASCII).
- `baki-S.cns`: the original file with 4 lines changed. The Whip Strike
  charge now uses ASCII command names (`hold_x`, `hold_a`, `hold_yz`,
  `hold_bc`) instead of Shift-JIS ones, so the command file is safe to edit
  in any text editor.
- `Baki - Move List (MUGEN 1.1).txt`: the English move list.

## Install

Copy the three files above into your existing `chars/baki/` folder and
overwrite. The sprites, sounds and other files are unchanged, so they are not
included here.
