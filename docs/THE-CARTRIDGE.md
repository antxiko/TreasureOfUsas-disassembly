# The cartridge

## The machine

MSX2: the VDP is a V9938 and the game runs in SCREEN 5 (`p00:4FAA`). VRAM
page 0 is the screen and page 1 holds the tiles and the font. Almost
everything is drawn with VDP commands: HMMV (`p00:4BA2`), HMMM
(`p00:4BDE`), HMMC (`p00:4C22`) and LMMM with TIMP (`p00:4C73`).

## The mapper

A 128 KB MegaROM with the Konami mapper without SCC: 16 banks of 8 KB, and
no writes to 0x5000, 0x7000, 0x9000 or 0xB000. Bank 0 is fixed at 0x4000
and the rest are set in threes at 0x6000, 0x8000 and 0xA000: 1-2-3, 4-5-6,
7-8-9, 10-11-12 and 13-14-15 (`p00:5464`-`548D`). A single bank, 6, 9, 12
or 15, can also be set at 0xA000 (`p00:54A5`-`54B4`). The copy is kept at
0xF0F1-0xF0F3.

## The interrupt

`p00:403D` hangs from H.TIMI (`p00:40CC`). Every frame it sets banks
13-14-15 and runs the sound (`p13:6000`); then, if the previous frame has
finished (0xC005), it calls the game's frame (`p00:40E0`).

## The sound

The PSG, with four channels from 0xC01C. There are 16 three-channel tunes
(0x80-0x8F, `p13:672C`), five three-channel sounds (0x40-0x44,
`p13:670E`) and the effects 1-0x25 and 0x70-0x7F (`p13:66C4`).

## The sprites

The attributes are prepared at 0xDE00 and go to VRAM 0x7600; each frame
starts from a different sprite (`p00:564C`), so that with many on one line
it is not always the same one that disappears.

## RAM

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
