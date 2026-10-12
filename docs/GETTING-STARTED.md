# Getting started

This repository does not include the game. It includes the tools that, from
your own image of the cartridge, rebuild the commented listing, reassemble it
and check that the ROM comes out **byte for byte**.

## What you need

- The Japanese image of *The Treasure of Usas* (RC-753), 131,072 bytes, in
  the root as `usas.rom`. Its sha256:
  `11e0b842a8bddbeafd1662cd102678a74415dad0f45b8f914cad11f1b344c809`.
- `make`, `python3` and the `pasmo` assembler.
- For the pictures, Python with PIL.

## What to run

    make comprueba     # the ROM's sha256
    make               # trace, build the listing, reassemble and run the tests
    make densidad      # how many instructions carry a comment, bank by bank
    make sanity        # the budget: not one byte unassigned
    make imagenes      # every picture, drawn from the ROM

`make verify` reassembles the sixteen banks and compares them with the ROM.

## Where things are

- `src/usas_pNN.asm`: the listing of each bank (p00 to p15).
- `src/pNN.notes`: the names, comments and data blocks of each bank. The
  listing is generated from here.
- `tools/anota.py` and `tools/anotaciones.py`: the names of the routines and
  of RAM, and the automatic comments for the records IX points to.
- `tools/fases.py`, `tools/habitantes.py`, `tools/exterior.py`,
  `tools/titulo.py`, `tools/personajes.py`, `tools/retratos.py`,
  `tools/actores.py`, `tools/objetos.py`, `tools/escenas.py` and
  `tools/estatua.py`: the pictures, drawn from the ROM.
