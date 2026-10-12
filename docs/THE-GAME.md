# The game

*The Treasure of Usas* (Konami, 1987, RC-753) is a platform game for the
MSX2 with two heroes, Wit and Cles. Everything on this page comes from the
cartridge's own tables.

## The story

The prologue on the title screen (`p05:9849`) tells that the treasure of
Usas was split into four over the centuries, and that the two set off along
the Silk Road to find it. According to the opening scene, the first ruin is
Pegu, in Rangoon (Burma), discovered by Professor Atley (`p04:752B`).

## The ruins and the stages

There are five ruins (`0xC21D`), each with four stages and a statue room: 20
stages in all. On the status bar they are called Pegu, Dunhuang, Alchi,
Hunza and Agra (`p15:BE3D`). Each screen is 8 × 6 metablocks of 4 × 4 tiles
(`p15:BEBF`); each stage's map is an RLE stream from `p10:5FFE`, and each
ruin's metablocks another from `p10:6032`. Screens are laid out by their
neighbours (`p09:B921`).

![A stage with what each screen holds](imagenes/fase_01_habitada.png)

Each screen carries what the game places on entry: the enemies created at
once and the nests the rest come out of (`p09:B12B`), the traps
(`p15:A4F9`), the items (`p12:B8BB`) and, in its room, the boss
(`p09:BED3`). Each sprite is drawn with the first frame of its animation.

The twenty stages, at full size:
[1](imagenes/fase_01_habitada.png), [2](imagenes/fase_02_habitada.png),
[3](imagenes/fase_03_habitada.png), [4](imagenes/fase_04_habitada.png),
[6](imagenes/fase_06_habitada.png), [7](imagenes/fase_07_habitada.png),
[8](imagenes/fase_08_habitada.png), [9](imagenes/fase_09_habitada.png),
[11](imagenes/fase_11_habitada.png), [12](imagenes/fase_12_habitada.png),
[13](imagenes/fase_13_habitada.png), [14](imagenes/fase_14_habitada.png),
[16](imagenes/fase_16_habitada.png), [17](imagenes/fase_17_habitada.png),
[18](imagenes/fase_18_habitada.png), [19](imagenes/fase_19_habitada.png),
[21](imagenes/fase_21_habitada.png), [22](imagenes/fase_22_habitada.png),
[23](imagenes/fase_23_habitada.png), [24](imagenes/fase_24_habitada.png).
And with the tiles only: [1](imagenes/fase_01.png), [6](imagenes/fase_06.png),
[11](imagenes/fase_11.png), [16](imagenes/fase_16.png),
[21](imagenes/fase_21.png) (the rest are named `fase_NN.png`).

## The antechamber

Before each stage there is a door that lets only one through: "ONLY ONE
PERSON MAY ENTER?" (`p06:BB2F`). You choose who goes in, and the other says
goodbye with a line that depends on their mood (`p12:B85E`). Without the four
keys, the final door does not open ("YOU HAVE TO GATHER FOUR KEYS"). And if
one has fallen: "I CAPTURED YOUR FRIEND".

![An antechamber](imagenes/antesala_0.png)

## The passwords

On reaching ruins 1-4, a map makes the ruin blink and types out its
password: JUBA RUINS, HARAPPA RUINS, GANDHARA RUINS or MOHENJO DARO
(`p06:A2BB`). On the title screen, CTRL or button B asks for the password
(KEYWORD, `p00:4643`), and with it you start at that ruin (`p00:45CB`).

![The outside map](imagenes/exterior.gif)

## Wit, Cles and their mood

Each has four states (happy, calm, sad and angry), and each state changes
their jump, their shot or blow and the way they push: it is in
[Findings](FINDINGS.md). The faces on the INFORMATION screen change with the
state and move their mouths every 8 frames while they talk (`p06:A774`).

![The faces](imagenes/retratos_hablan.gif)

## Coins and INFORMATION

Coins are kept in BCD (`p00:55B9`) and come from the items of classes 1 to 4
and 12-13. In the pause they are spent on SPD and JMP (`p06:A0EA`).

## Enemies, traps and bosses

- The **enemies** are 63 actor types (`p02:82E9`), placed screen by screen
  by `p09:B12B`.
- The **traps** (drops, rocks, statues, columns) are another list, of 13
  types (`p15:A4F9`).
- The **bosses**: each stage ends with one, the same four in all five ruins
  (types 30 to 33, `p09:BED3`), with 16 more life in each ruin
  (`p03:AD28`). In the statue room there are five tablets (type 25), one per
  ruin (`p02:8DB9`).

![The stage bosses](imagenes/jefes_de_fase.gif)

## The ending

The four stones join, Wit and Cles enter the temple of Usas and put the
stone in the statue (`p04:73D2`). In Japanese the ending goes on: Professor
Atley finds out that the statue was the detonator of an atomic bomb built by
an ancient civilisation, and that the stones had been scattered around the
world so that nobody could use it. It ends with «¡¿そんなあほな!?» (it can't
be!). The English table for the last two scenes points to those same
Japanese texts (`p04:745D`).

![An ending scene](imagenes/escena_08.png)
