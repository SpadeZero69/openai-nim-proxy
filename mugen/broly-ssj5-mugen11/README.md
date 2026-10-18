# Broly SSJ5: MUGEN 1.1 conversion

Modified files for Broly SSJ5 ("限界突破ブロリー", Limit-Breaking Broly), by the
author of the kamasetoyobanaide blog and based on gulthor's The Nightmare
SSJ3HD (the .def lists dgx as author). With these files the character loads
in MUGEN 1.1.

It is a WinMUGEN "god-tier" character. Its palettes range from a normal
fighter (1-2) to versions made to beat other god-tier characters (7-12),
which use engine tricks: state escapes, life kept in variables, instant-kill
attacks. Those tricks rely on WinMUGEN's rules, so the character stays a
WinMUGEN-mode character. `mugenversion` stays empty in the .def, and MUGEN 1.1
keeps the old rules for it (Explod positions, HitDef pause times, palettes).
The conversion changes only lines MUGEN 1.1 can refuse to load, keeps what
they did in WinMUGEN, and marks them with `;MUGEN 1.1 conversion`.

## Changes

- TagIn: MUGEN 1.1 dropped the TagIn controller, so loading would stop at it.
  The 13 TagIn controllers in state 104012 of `broly_enemy.cns` (a state the
  opponent is put into) are now `Null`. They changed the state of the
  opponent's partner in team matches, and that trick is off; their triggers
  still run.
- Lines that are not `key = value`. WinMUGEN skipped them; they are now
  comments, which MUGEN 1.1 also skips:
  - two notes inside a controller in `broly_enemy.cns` (`試験体mk5.2`,
    `試験体mk2varA`) and one before `[Statedef 90000]` in `broly_2.cns`
    (`ssj5transformation`);
  - a Projectile damage line with no `damage =` key (`broly_3.cns`, state
    3030, the LSSJ awakening). That projectile did no damage in the original
    and still does none;
  - a controller header without its `[` (`State ];ダメージ値`,
    `broly_helper.cns`, state 1251). WinMUGEN read the controller after it as
    part of the VarSet above (two `type` lines, the first counts). Its
    triggers then need `var(18)&128` to be both set and not set, so it never
    ran. The header and the second `type` line are comments, which keeps that.
- A second `type = L` line in a StateTypeSet (`broly_common.cns`, state 5150)
  is a comment. MUGEN uses the first `type` line.
- `fvar(1):=vel x|1` (`broly_common.cns`, state 45) was a bitwise `|` on a
  float. It is now `||1`, like the four lines after it and the copy of this
  controller in `broly_2.cns`.
- Float expressions in integer parameters: two damage values (states 198 and
  2015) are wrapped in `floor()`, which gives the same whole number.
- `animtype = High` in 7 HitDefs: High is not a MUGEN animtype. MUGEN reads
  the first letter, so it was Hard, and now says `Hard`.
- Six empty `attr =` (five HitOverrides, one Projectile) are now `,NA`. With
  no state type, the attr matches no attack either way; the character uses
  this form in 112 other places.
- `[Statedef 12500]` was defined twice. MUGEN uses the first definition
  (`broly_helper.cns`, loaded before `broly_target.cns`), so the copy in
  `broly_target.cns` never ran. It is commented out.
- One line in `broly_enemy.cns` ended with LF only. It now ends with CR LF
  like the rest of the file.
- `Broly SSJ5 - Move List (MUGEN 1.1).txt` (new): English move list for PC
  keyboard players, with palettes, modes and settings. The commands come from
  `broly_command.cns`, which differs from the Japanese readme in places
  (Power Up is A + X, Energy Barrage EX is Down, Forward, Back, Z).

Checked and left as they are: 32 parameters given twice in a controller
(MUGEN uses the first, as WinMUGEN did), 12 PlaySnd values with an `S`
prefix, integer constants above 2147483647 (for example
`projpriority = 9999999999`), and parameters MUGEN doesn't know, which it
ignores (for example a misspelled `rigger1`).

## Power

`power = 2500` in `broly_data.cns` caps his gauge at 2.5 bars. The six
Down, Down-Forward, Forward supers check for 4,000 to 10,000 power, and the
second awakening (SSJ5) for 10,000. A human player can only use them with
palette 12, which skips most of these checks. In palettes 5-11 the AI can
use them, because its checks also accept an internal power counter that goes
up to 10,000. MUGEN caps power at the maximum in WinMUGEN too, so this is how
the download plays, and it is left as is. The move list says how to raise
the cap.

## Files

```
Broly SSJ5/
  Broly SSJ5 - Move List (MUGEN 1.1).txt
  broly_1.cns
  broly_2.cns
  broly_3.cns
  broly_common.cns
  broly_data.cns
  broly_enemy.cns
  broly_helper.cns
  broly_target.cns
```

Only the changed files are here. The .def, `broly_command.cns`,
`broly_-2,-3.cns`, `broly_4.cns`, the AIR, sprite, sound and palette files
and the Japanese readme files are unchanged; take them from the original
download. The state files are Shift-JIS with CRLF line ends, and
`.gitattributes` keeps them byte for byte.

The readme allows reposting and editing, but the effect sprites in groups
3039-3041 must not be used in other characters.

## Install

Copy the `Broly SSJ5` folder over the original one in `chars/`, then add a
`Broly SSJ5` line under `[Characters]` in `data/select.def`.
