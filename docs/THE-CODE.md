# The code

## The figures

- **100 %** of the binary explained: 41,458 bytes of traced code and 89,614
  of named data, adding up to the cartridge's 131,072.
- 20,434 instructions in banks 0, 1, 2, 3, 4, 5, 6, 9, 13 and 15, with
  **8,185 comments: 40.1 %**.
- 2,536 routines and labels; none below 10 % comments, and not one `call` to
  an unnamed routine.

## How it is organised

The game's frame (`p00:40E0`) dispatches on the **game state** (0xC000, 14
states, table `p00:40F4`): start-up, the wait, the demo, PLAY START, the
scenes, play, on dying, GAME OVER, the change of screen, the partner
captured, the end of the ruin, INFORMATION (0x0B and 0x0D) and the password
(0x0C).

## The records

IX points to four kinds of record, and `tools/anotaciones.py` comments their
fields wherever IX is certainly one of them:

- **actor** (0xC400 and 0xCD00): the type, the step, Y, X, the speeds and
  accelerations, the frame, the counter, the life and what it collides with;
- **character** (0xC2B0 and 0xC2D0): whether they have fallen, the speed and
  jump levels, the life and the mood;
- **shot** (0xC320): the type, Y, X, the speeds, the direction and its
  sprite;
- **sound channel** (0xC01C...): the track, the tempo, the volume, the
  octave, the instrument and the envelope.

## The actors

There are 63 types at 0xC400 (handlers `p02:82E9`), placed screen by screen
by `p09:B12B`. Their pictures are built from pieces (`p15:B744`) with their
own palette (`p09:B781`). The traps at 0xCD00 are another list, of 13 types
(`p15:A4F9`), with RLE patterns (`p00:4926`).

## The texts

The font starts with 0x2B = "A" and holds hiragana (0x49-0x76) and 28 kanji
(0xA0-0xBB, `p14:9289`). There are three formats: caption, typewriter (FD
breaks the line, FE hands the word to the other one) and plain.

## The names

The names and the automatic comments come from `tools/anotaciones.py`, each
with the routine where it is read; `tools/anota.py` writes them into the
notes.

## Code shared with other Konami cartridges

This disassembly has been compared, instruction by instruction, with
every other Konami one in the series. A block counts when the same
instructions, at least six of them from a label to its `ret` or its
unconditional jump, are in both cartridges; the addresses are left
aside, because they change from one cartridge to the next. Of the
other 57, **43** have at least one block in common with this one;
these are the ones that share the most:

| Cartridge | Blocks | Instructions | For example (here = there) |
|---|---:|---:|---|
| [Ganbare Goemon! Karakuri Dōchū](https://antxiko.github.io/GanbareGoemon-disassembly/) | 62 | 987 | `hmmc` (p00:4C22) |
| [Vampire Killer](https://antxiko.github.io/VampireKiller-disassembly/) | 58 | 935 | `hmmc` (p00:4C22) |
| [King Kong 2: Yomigaeru Densetsu](https://antxiko.github.io/KingKong2-disassembly/) | 52 | 752 | `copia_con_operacion` (p00:4C73) = `lmmm` |
| [Hinotori](https://antxiko.github.io/Hinotori-disassembly/) | 41 | 682 | `copia_con_operacion` (p00:4C73) = `lmmm` |
| [The Pro Yakyuu Gekitotsu Pennant Race](https://antxiko.github.io/PennantRace-disassembly/) | 38 | 626 | `hmmc` (p00:4C22) = `rectangulo_desde_ram` |
| [Metal Gear](https://antxiko.github.io/MetalGear-disassembly/) | 35 | 572 | `copia_con_operacion` (p00:4C73) = `copia_logica` |
| [Gekitotsu Pennant Race 2](https://antxiko.github.io/PennantRace2-disassembly/) | 27 | 387 | `lista_de_fichas` (p00:529C) = `dibujos` |
| [Hai no Majutsushi - Mahjong 2](https://antxiko.github.io/Majutsushi-disassembly/) | 26 | 274 | `rle_a_vram_con_destino` (p00:4926) = `vuelca_lista_vram` |
| [Konami’s Game Master 2](https://antxiko.github.io/GameMaster2-disassembly/) | 24 | 452 | `hmmc` (p00:4C22) = `vdp_hmmc` |
| [The Maze of Galious](https://antxiko.github.io/MazeOfGalious-disassembly/) | 15 | 170 | `busca_otros_cartuchos` (p06:B751) = `mira_las_ranuras` |

The whole matrix, the 58 cartridges against each other, is on
[The routines](https://antxiko.github.io/MSX-disassembly-database/THE-ROUTINES.html) in the series database, along
with the method and the program that measures it.
