# The Treasure of Usas - a commented disassembly

*(También [en castellano](README.es.md).)*

The commented disassembly of **The Treasure of Usas** (Konami, 1987,
RC-753) for the MSX2: a 128 KB MegaROM with the Konami mapper without SCC,
sixteen banks of 8 KB.

- **100 %** of the binary explained: 41,458 bytes of code and 89,614 of
  named data, not one byte unassigned.
- **40.1 %** of the listing commented, 2,536 routines and labels, none below
  10 % comments.
- The listing reassembles into the original ROM **byte for byte**.
- The 20 stages with what each screen holds, the antechambers, the outside
  map, Wit and Cles with their four moods, the enemies, the bosses, the
  faces, the scenes and the title screen are **drawn from the ROM**, not
  captured.

The website: <https://antxiko.github.io/TreasureOfUsas-disassembly/>
(in Spanish: <https://antxiko.github.io/TreasureOfUsas-disassembly/es/>).

## Reproducing it

The cartridge image is not distributed. Put yours in the root as `usas.rom`
(sha256 `11e0b842...`) and run `make`. The details are in
[GETTING-STARTED](docs/GETTING-STARTED.md).

## Legal

The game belongs to Konami and its rights holders. The licence in `LICENSE`
covers only the tools, comments, analysis and documentation here. See
[LEGAL-NOTICE.md](LEGAL-NOTICE.md).
