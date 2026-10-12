# The music

Everything you hear here comes from running the cartridge's own sound engine
(bank 13, `p13:6000`) on an emulated Z80, frame by frame at 60 per second,
just as the interrupt calls it (`p00:4048`). What the engine writes to the PSG
is turned into sound with an AY-3-8910 (`tools/musica.py`). Each MP3 is the
whole piece up to where it starts again, plus 8 seconds of the repeat fading
out.

## Checked against openMSX

The PSG writes have been compared frame by frame with those of openMSX
(Japanese C-BIOS MSX2). In every frame the PSG ends up the same:

- the whole antechamber tune (1,454 frames);
- the ruin 4 tune at pitch 0x80, the whole piece (6,614 frames);
- the start of the game tune (178 frames).

To hear the ruin 4 tune without playing up to it, the probe swapped the
antechamber request for that tune (`tools/omsx_psg.tcl`). The timbre is not
checked: it is a textbook AY-3-8910, not a recording of the emulator.

## Each ruin's tune changes with the mood

On entering a stage, `musica_de_fase` (`p00:54C8`) asks for the ruin's tune
(`p15:BE70`). It also stores a pitch in 0xC122,
`p15:BE7A[ruin × 4 + state]`, which depends on the mood of whoever goes in.
With it the engine shifts the note table (`p13:625D`) and, from instrument 2
on, the instrument (`p13:62E2`):

| Pitch | The notes | The instrument |
|---|---|---|
| 0x20 | two semitones higher | two further on |
| 0x00 | as written | its own |
| 0x40 | one semitone lower | one before |
| 0x80 | two semitones lower | two before |

Happy is always 0x20 and calm always 0x00. Sad and angry share 0x80 and 0x40:
in Pegu and Alchi, sad is 0x80 and angry 0x40; in Dunhuang, Hunza and Agra,
the other way round.

### Pegu (0x80)

**Happy**, pitch 0x20

<audio controls preload="none" src="audio/ruina0_estado0.mp3"></audio>

**Calm**, pitch 0x00

<audio controls preload="none" src="audio/ruina0_estado1.mp3"></audio>

**Sad**, pitch 0x80

<audio controls preload="none" src="audio/ruina0_estado2.mp3"></audio>

**Angry**, pitch 0x40

<audio controls preload="none" src="audio/ruina0_estado3.mp3"></audio>

### Dunhuang (0x81)

**Happy**, pitch 0x20

<audio controls preload="none" src="audio/ruina1_estado0.mp3"></audio>

**Calm**, pitch 0x00

<audio controls preload="none" src="audio/ruina1_estado1.mp3"></audio>

**Sad**, pitch 0x40

<audio controls preload="none" src="audio/ruina1_estado2.mp3"></audio>

**Angry**, pitch 0x80

<audio controls preload="none" src="audio/ruina1_estado3.mp3"></audio>

### Alchi (0x82)

**Happy**, pitch 0x20

<audio controls preload="none" src="audio/ruina2_estado0.mp3"></audio>

**Calm**, pitch 0x00

<audio controls preload="none" src="audio/ruina2_estado1.mp3"></audio>

**Sad**, pitch 0x80

<audio controls preload="none" src="audio/ruina2_estado2.mp3"></audio>

**Angry**, pitch 0x40

<audio controls preload="none" src="audio/ruina2_estado3.mp3"></audio>

### Hunza (0x83)

**Happy**, pitch 0x20

<audio controls preload="none" src="audio/ruina3_estado0.mp3"></audio>

**Calm**, pitch 0x00

<audio controls preload="none" src="audio/ruina3_estado1.mp3"></audio>

**Sad**, pitch 0x40

<audio controls preload="none" src="audio/ruina3_estado2.mp3"></audio>

**Angry**, pitch 0x80

<audio controls preload="none" src="audio/ruina3_estado3.mp3"></audio>

### Agra (0x84)

**Happy**, pitch 0x20

<audio controls preload="none" src="audio/ruina4_estado0.mp3"></audio>

**Calm**, pitch 0x00

<audio controls preload="none" src="audio/ruina4_estado1.mp3"></audio>

**Sad**, pitch 0x40

<audio controls preload="none" src="audio/ruina4_estado2.mp3"></audio>

**Angry**, pitch 0x80

<audio controls preload="none" src="audio/ruina4_estado3.mp3"></audio>

## F5 changes a voice in Dunhuang

During a stage, F5 silences the music (`p00:5FEF`) and brings it back
(`p00:5FE6`). When it comes back it is taken from another table, `p15:BE75`,
which only differs in Dunhuang: you get 0x85, the same score with a different
second voice (`p13:7690` instead of `p13:7507`).

**Happy**, pitch 0x20

<audio controls preload="none" src="audio/ruina1_otra_estado0.mp3"></audio>

**Calm**, pitch 0x00

<audio controls preload="none" src="audio/ruina1_otra_estado1.mp3"></audio>

**Sad**, pitch 0x40

<audio controls preload="none" src="audio/ruina1_otra_estado2.mp3"></audio>

**Angry**, pitch 0x80

<audio controls preload="none" src="audio/ruina1_otra_estado3.mp3"></audio>

## The rest

The antechamber: 0x89 (`p00:424C`).

<audio controls preload="none" src="audio/musica_89.mp3"></audio>

At the start of a game: 0x8A (`p00:41DB`).

<audio controls preload="none" src="audio/musica_8A.mp3"></audio>

The statue room: 0x86 (`p00:5512`).

<audio controls preload="none" src="audio/musica_86.mp3"></audio>

The bosses: 0x87 in the statue room (`p02:8D75`). 0x88 plays in each stage's boss room (`p02:90A1`) and is the same piece: the same three pointers in `p13:672C`.

<audio controls preload="none" src="audio/musica_87.mp3"></audio>

On finishing a ruin: 0x8B (`p00:454E`).

<audio controls preload="none" src="audio/musica_8B.mp3"></audio>

On finishing the last one, Agra: 0x8C (`p00:4552`).

<audio controls preload="none" src="audio/musica_8C.mp3"></audio>

Death: 0x8D (`p01:6309`).

<audio controls preload="none" src="audio/musica_8D.mp3"></audio>

GAME OVER: 0x8E (`p00:440A`).

<audio controls preload="none" src="audio/musica_8E.mp3"></audio>

0x8F is silent: its three voices begin with the end-of-track code (0xFF).
