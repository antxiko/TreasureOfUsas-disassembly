# Open questions

What is not settled.

## The check against the emulator

No picture has been checked against the openMSX VRAM yet: they are all
drawn from the ROM, without that proof.

## The bosses of ruins 1-4

Types 30 to 33 only appear in the lists of ruin 0. What creates them in the
other four has not been found.

## The sprites

- Each actor is drawn with the first frame of its animation, not a measured
  entry frame.
- The deaths of Wit and Cles (LMMM, `p01:6A03`) and Cles's extra frames
  (`p14:9F4A`) are not drawn.

## The items

Item class 6 (`p01:758C`) has no known loader.

## The sound

Bank 13 is commented at 27.7 %. What it writes to the PSG is checked against
openMSX; the timbre of the AY used to make the MP3s is not.

## Data with no reader

18 blocks, 132 bytes in all, that no instruction points to.

## Texts not yet extracted

STAFF and THE END, in bank 4.
