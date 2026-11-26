# Under the hood

## Getting started

This repository does not include the game. It includes the tools that, from
your own image of the cartridge, rebuild the commented listing, reassemble it
and check that the ROM comes out **byte for byte**.

### What you need

- The Japanese image of *The Treasure of Usas* (RC-753), 131,072 bytes, in
  the root as `usas.rom`. Its sha256:
  `11e0b842a8bddbeafd1662cd102678a74415dad0f45b8f914cad11f1b344c809`.
- `make`, `python3` and the `pasmo` assembler.
- For the pictures, Python with PIL.

### What to run

    make comprueba     # the ROM's sha256
    make               # trace, build the listing, reassemble and run the tests
    make densidad      # how many instructions carry a comment, bank by bank
    make sanity        # the budget: not one byte unassigned
    make imagenes      # every picture, drawn from the ROM
    make musica        # the music, running the engine (numpy and lameenc)

`make verify` reassembles the sixteen banks and compares them with the ROM.

### Where things are

- `src/usas_pNN.asm`: the listing of each bank (p00 to p15).
- `src/pNN.notes`: the names, comments and data blocks of each bank. The
  listing is generated from here.
- `tools/anota.py` and `tools/anotaciones.py`: the names of the routines and
  of RAM, and the automatic comments for the records IX points to.
- `tools/fases.py`, `tools/habitantes.py`, `tools/exterior.py`,
  `tools/titulo.py`, `tools/personajes.py`, `tools/retratos.py`,
  `tools/actores.py`, `tools/objetos.py`, `tools/escenas.py` and
  `tools/estatua.py`: the pictures, drawn from the ROM.
- `tools/musica.py`: the music, with the bank 13 engine run on
  `tools/z80run.py`; `tools/omsx_psg.tcl` and `tools/coteja_psg.py`, its
  check against openMSX.

## The cartridge

### The machine

MSX2: the VDP is a V9938 and the game runs in SCREEN 5 (`p00:4FAA`). VRAM
page 0 is the screen and page 1 holds the tiles and the font. Almost
everything is drawn with VDP commands: HMMV (`p00:4BA2`), HMMM
(`p00:4BDE`), HMMC (`p00:4C22`) and LMMM with TIMP (`p00:4C73`).

### The mapper

A 128 KB MegaROM with the Konami mapper without SCC: 16 banks of 8 KB, and
no writes to 0x5000, 0x7000, 0x9000 or 0xB000. Bank 0 is fixed at 0x4000
and the rest are set in threes at 0x6000, 0x8000 and 0xA000: 1-2-3, 4-5-6,
7-8-9, 10-11-12 and 13-14-15 (`p00:5464`-`548D`). A single bank, 6, 9, 12
or 15, can also be set at 0xA000 (`p00:54A5`-`54B4`). The copy is kept at
0xF0F1-0xF0F3.

### The interrupt

`p00:403D` hangs from H.TIMI (`p00:40CC`). Every frame it sets banks
13-14-15 and runs the sound (`p13:6000`); then, if the previous frame has
finished (0xC005), it calls the game's frame (`p00:40E0`).

### The sound

The PSG, with four channels from 0xC01C. There are 16 three-channel tunes
(0x80-0x8F, `p13:672C`), five three-channel sounds (0x40-0x44,
`p13:670E`) and the effects 1-0x25 and 0x70-0x7F (`p13:66C4`).

### The sprites

The attributes are prepared at 0xDE00 and go to VRAM 0x7600; each frame
starts from a different sprite (`p00:564C`), so that with many on one line
it is not always the same one that disappears.

### RAM

| Address | What it is |
|---|---|
| 0xC000 / 0xC001 | the game state and its step |
| 0xC006 / 0xC007 | the new keys and the held keys |
| 0xC211 | the stage (ruin × 5 + door) |
| 0xC212 | the screen within the stage |
| 0xC218-0xC21B | the four neighbours of the screen |
| 0xC21D | the ruin (0-4) |
| 0xC240 | the character being played |
| 0xC259 | the coins (BCD) |
| 0xC2B0 / 0xC2D0 | the records of the two characters (+6: the mood) |
| 0xC320 | the shots |
| 0xC400 | the 8 actors (0x80-byte records) |
| 0xCD00 | the 9 traps |
| 0xD200 | the built screen (32 × 24 tiles) |
| 0xE400 | the metablocks (16 tiles each) |
| 0xEC00 | the stage map (48 bytes per screen) |

## The code

### The figures

- **100 %** of the binary explained: 41,458 bytes of traced code and 89,614
  of named data, adding up to the cartridge's 131,072.
- 20,434 instructions in banks 0, 1, 2, 3, 4, 5, 6, 9, 13 and 15, with
  **8,185 comments: 40.1 %**.
- 2,536 routines and labels; none below 10 % comments, and not one `call` to
  an unnamed routine.

### How it is organised

The game's frame (`p00:40E0`) dispatches on the **game state** (0xC000, 14
states, table `p00:40F4`): start-up, the wait, the demo, PLAY START, the
scenes, play, on dying, GAME OVER, the change of screen, the partner
captured, the end of the ruin, INFORMATION (0x0B and 0x0D) and the password
(0x0C).

### The records

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

### The actors

There are 63 types at 0xC400 (handlers `p02:82E9`), placed screen by screen
by `p09:B12B`. Their pictures are built from pieces (`p15:B744`) with their
own palette (`p09:B781`). The traps at 0xCD00 are another list, of 13 types
(`p15:A4F9`), with RLE patterns (`p00:4926`).

### The texts

The font starts with 0x2B = "A" and holds hiragana (0x49-0x76) and 28 kanji
(0xA0-0xBB, `p14:9289`). There are three formats: caption, typewriter (FD
breaks the line, FE hands the word to the other one) and plain.

### The names

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
