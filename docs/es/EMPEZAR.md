# Empezar

Este repositorio no trae el juego. Trae las herramientas que, a partir de tu
propia imagen del cartucho, vuelven a montar el listado comentado, lo
reensamblan y comprueban que sale la ROM **byte a byte**.

## Lo que hace falta

- La imagen japonesa de *The Treasure of Usas* (RC-753), 131.072 bytes, en
  la raíz con el nombre `usas.rom`. Su sha256:
  `11e0b842a8bddbeafd1662cd102678a74415dad0f45b8f914cad11f1b344c809`.
- `make`, `python3` y el ensamblador `pasmo`.
- Para las imágenes, Python con PIL.

## Lo que se ejecuta

    make comprueba     # el sha256 de la ROM
    make               # traza, genera el listado, reensambla y pasa los tests
    make densidad      # cuántas instrucciones llevan comentario, banco a banco
    make sanity        # el presupuesto: ni un byte sin asignar
    make imagenes      # todas las imágenes, dibujadas desde la ROM

`make verify` reensambla los dieciséis bancos y los compara con la ROM.

## Dónde está cada cosa

- `src/usas_pNN.asm`: el listado de cada banco (p00 a p15).
- `src/pNN.notes`: los nombres, los comentarios y los bloques de datos de
  cada banco. El listado se genera desde aquí.
- `tools/anota.py` y `tools/anotaciones.py`: los nombres de las rutinas y de
  la RAM, y los comentarios automáticos de las fichas a las que apunta IX.
- `tools/fases.py`, `tools/habitantes.py`, `tools/exterior.py`,
  `tools/titulo.py`, `tools/personajes.py`, `tools/retratos.py`,
  `tools/actores.py`, `tools/objetos.py`, `tools/escenas.py` y
  `tools/estatua.py`: las imágenes, dibujadas desde la ROM.
