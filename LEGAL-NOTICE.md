# Legal notice and attribution

*(También disponible [en castellano](AVISO-LEGAL.md).)*

## Who owns what

**The game is not ours.** *The Treasure of Usas* was published by **Konami**
for the MSX2 in 1987; its catalogue number is **RC-753** and it is 128 KB.
All rights in the game remain with their holders.

**What is ours** are the tools in this repository, the comments in the
listing, the analysis and the documentation. Those are published under the
licence in `LICENSE`.

## What is in this repository

The files `src/usas_pNN.asm` are the commented disassembly of the sixteen
banks of the cartridge. They are published for the **preservation, study and
documentation** of a title that is part of the history of MSX software.

The cartridge image (`.rom`) is **not** distributed here. Anyone wanting to
rebuild the listing has to supply their own, and the `Makefile` checks its
sha256 before doing anything.

The pictures in `docs/imagenes/` are neither illustrations brought in from
elsewhere nor captures: they are drawn by reading the cartridge's own tables,
at the addresses the listing gives. They are part of the proof that the
reading of the binary is right: if it were wrong, noise would come out.

## What it rests on

Everything stated here comes from reading this binary, and each claim carries
its evidence next to it: the instruction that reads a datum or the table that
ends where it has to end. What is not settled is said not to be.

## If you are one of the authors

If you worked on *The Treasure of Usas* or hold rights over the game, and you
would rather this material were not published, **say so and it comes down, no
argument**. The intent of this work is the opposite of harming you: it is to
put on record how it was made.
