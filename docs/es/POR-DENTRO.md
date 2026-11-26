# Por dentro

## Empezar

Este repositorio no trae el juego. Trae las herramientas que, a partir de tu
propia imagen del cartucho, vuelven a montar el listado comentado, lo
reensamblan y comprueban que sale la ROM **byte a byte**.

### Lo que hace falta

- La imagen japonesa de *The Treasure of Usas* (RC-753), 131.072 bytes, en
  la raíz con el nombre `usas.rom`. Su sha256:
  `11e0b842a8bddbeafd1662cd102678a74415dad0f45b8f914cad11f1b344c809`.
- `make`, `python3` y el ensamblador `pasmo`.
- Para las imágenes, Python con PIL.

### Lo que se ejecuta

    make comprueba     # el sha256 de la ROM
    make               # traza, genera el listado, reensambla y pasa los tests
    make densidad      # cuántas instrucciones llevan comentario, banco a banco
    make sanity        # el presupuesto: ni un byte sin asignar
    make imagenes      # todas las imágenes, dibujadas desde la ROM
    make musica        # la música, ejecutando el motor (numpy y lameenc)

`make verify` reensambla los dieciséis bancos y los compara con la ROM.

### Dónde está cada cosa

- `src/usas_pNN.asm`: el listado de cada banco (p00 a p15).
- `src/pNN.notes`: los nombres, los comentarios y los bloques de datos de
  cada banco. El listado se genera desde aquí.
- `tools/anota.py` y `tools/anotaciones.py`: los nombres de las rutinas y de
  la RAM, y los comentarios automáticos de las fichas a las que apunta IX.
- `tools/fases.py`, `tools/habitantes.py`, `tools/exterior.py`,
  `tools/titulo.py`, `tools/personajes.py`, `tools/retratos.py`,
  `tools/actores.py`, `tools/objetos.py`, `tools/escenas.py` y
  `tools/estatua.py`: las imágenes, dibujadas desde la ROM.
- `tools/musica.py`: la música, con el motor del banco 13 ejecutado en
  `tools/z80run.py`; `tools/omsx_psg.tcl` y `tools/coteja_psg.py`, su cotejo
  con openMSX.

## El cartucho

### La máquina

MSX2: el VDP es un V9938 y el juego trabaja en SCREEN 5 (`p00:4FAA`). La
página 0 de la VRAM es la pantalla y la página 1 guarda las fichas y la
fuente. Casi todo se pinta con los comandos del VDP: HMMV (`p00:4BA2`), HMMM
(`p00:4BDE`), HMMC (`p00:4C22`) y LMMM con TIMP (`p00:4C73`).

### El mapper

MegaROM de 128 KB con el mapper Konami sin SCC: 16 bancos de 8 KB, y ninguna
escritura a 0x5000, 0x7000, 0x9000 ni 0xB000. El banco 0 está fijo en 0x4000
y los demás se ponen por tríos en 0x6000, 0x8000 y 0xA000: 1-2-3, 4-5-6,
7-8-9, 10-11-12 y 13-14-15 (`p00:5464`-`548D`). En 0xA000 se pone también
uno solo, el 6, el 9, el 12 o el 15 (`p00:54A5`-`54B4`). La copia queda en
0xF0F1-0xF0F3.

### La interrupción

`p00:403D` cuelga de H.TIMI (`p00:40CC`). Cada cuadro pone los bancos
13-14-15 y mueve el sonido (`p13:6000`); después, si el cuadro anterior ya
acabó (0xC005), llama al del juego (`p00:40E0`).

### El sonido

El PSG, con cuatro canales desde 0xC01C. Hay 16 músicas de tres canales
(0x80-0x8F, `p13:672C`), cinco sonidos de tres canales (0x40-0x44,
`p13:670E`) y los efectos 1-0x25 y 0x70-0x7F (`p13:66C4`).

### Los sprites

Los atributos se preparan en 0xDE00 y van a la VRAM 0x7600; cada cuadro se
empieza por otro sprite (`p00:564C`), para que con muchos en una línea no
desaparezca siempre el mismo.

### La RAM

| Dirección | Qué es |
|---|---|
| 0xC000 / 0xC001 | el estado del juego y su paso |
| 0xC006 / 0xC007 | las teclas nuevas y las que hay |
| 0xC211 | la fase (ruina × 5 + puerta) |
| 0xC212 | la pantalla de la fase |
| 0xC218-0xC21B | las cuatro vecinas de la pantalla |
| 0xC21D | la ruina (0-4) |
| 0xC240 | el personaje que se lleva |
| 0xC259 | las monedas (BCD) |
| 0xC2B0 / 0xC2D0 | las fichas de los dos personajes (+6: el ánimo) |
| 0xC320 | los disparos |
| 0xC400 | los 8 actores (fichas de 0x80) |
| 0xCD00 | las 9 trampas |
| 0xD200 | la pantalla montada (32 × 24 fichas) |
| 0xE400 | los metabloques (16 fichas cada uno) |
| 0xEC00 | el mapa de la fase (48 bytes por pantalla) |

## El código

### Las cifras

- **100 %** del binario explicado: 41.458 bytes de código trazado y 89.614
  de datos con nombre, que suman los 131.072 del cartucho.
- 20.434 instrucciones en los bancos 0, 1, 2, 3, 4, 5, 6, 9, 13 y 15, con
  **8.185 comentarios: el 40,1 %**.
- 2.536 rutinas y etiquetas; ninguna por debajo del 10 % de comentarios, y
  ningún `call` a una rutina sin nombre.

### Cómo se ordena

El juego del cuadro (`p00:40E0`) despacha por el **estado del juego**
(0xC000, 14 estados, tabla `p00:40F4`): el arranque, la espera, la demo,
PLAY START, las escenas, la partida, al morir, GAME OVER, el cambio de
pantalla, el compañero capturado, el fin de la ruina, INFORMATION (0x0B y
0x0D) y la clave (0x0C).

### Las fichas

IX apunta a cuatro clases de ficha, y `tools/anotaciones.py` comenta sus
campos allí donde IX es seguro una de ellas:

- **actor** (0xC400 y 0xCD00): el tipo, el paso, la Y, la X, las
  velocidades y aceleraciones, el fotograma, la cuenta, la vida y con qué
  choca;
- **personaje** (0xC2B0 y 0xC2D0): si ha caído, el nivel de velocidad y el
  de salto, la vida y el ánimo;
- **disparo** (0xC320): el tipo, la Y, la X, las velocidades, el sentido y
  su sprite;
- **canal de sonido** (0xC01C...): la pista, el tempo, el volumen, la
  octava, el instrumento y la envolvente.

### Los actores

Hay 63 tipos en 0xC400 (manejadores `p02:82E9`), puestos pantalla a
pantalla por `p09:B12B`. Sus dibujos se montan con piezas (`p15:B744`) y
paleta propia (`p09:B781`). Las trampas de 0xCD00 son otra lista, de 13
tipos (`p15:A4F9`), con los patrones en RLE (`p00:4926`).

### Los textos

La fuente empieza con 0x2B = «A» y lleva hiragana (0x49-0x76) y 28 kanji
(0xA0-0xBB, `p14:9289`). Hay tres formatos: rótulo, a máquina (FD salta de
línea, FE da la palabra al otro) y plano.

### Los nombres

Los nombres y los comentarios automáticos salen de `tools/anotaciones.py`,
cada uno con la rutina donde se lee; `tools/anota.py` los escribe en las
notas.

## Código compartido con otros cartuchos de Konami

Este desensamblado se ha comparado, instrucción por instrucción, con
todos los demás de Konami de la serie. Cuenta un bloque cuando las
mismas instrucciones, al menos seis desde una etiqueta hasta su `ret`
o su salto sin condición, están en los dos cartuchos; las direcciones
no se miran, porque cambian de un cartucho a otro. De los otros 57,
**43** tienen al menos un bloque en común con este; estos son los
que más comparten:

| Cartucho | Bloques | Instrucciones | Por ejemplo (aquí = allí) |
|---|---:|---:|---|
| [Ganbare Goemon! Karakuri Dōchū](https://antxiko.github.io/GanbareGoemon-disassembly/es/) | 62 | 987 | `hmmc` (p00:4C22) |
| [Vampire Killer](https://antxiko.github.io/VampireKiller-disassembly/es/) | 58 | 935 | `hmmc` (p00:4C22) |
| [King Kong 2: Yomigaeru Densetsu](https://antxiko.github.io/KingKong2-disassembly/es/) | 52 | 752 | `copia_con_operacion` (p00:4C73) = `lmmm` |
| [Hinotori](https://antxiko.github.io/Hinotori-disassembly/es/) | 41 | 682 | `copia_con_operacion` (p00:4C73) = `lmmm` |
| [The Pro Yakyuu Gekitotsu Pennant Race](https://antxiko.github.io/PennantRace-disassembly/es/) | 38 | 626 | `hmmc` (p00:4C22) = `rectangulo_desde_ram` |
| [Metal Gear](https://antxiko.github.io/MetalGear-disassembly/es/) | 35 | 572 | `copia_con_operacion` (p00:4C73) = `copia_logica` |
| [Gekitotsu Pennant Race 2](https://antxiko.github.io/PennantRace2-disassembly/es/) | 27 | 387 | `lista_de_fichas` (p00:529C) = `dibujos` |
| [Hai no Majutsushi - Mahjong 2](https://antxiko.github.io/Majutsushi-disassembly/es/) | 26 | 274 | `rle_a_vram_con_destino` (p00:4926) = `vuelca_lista_vram` |
| [Konami’s Game Master 2](https://antxiko.github.io/GameMaster2-disassembly/es/) | 24 | 452 | `hmmc` (p00:4C22) = `vdp_hmmc` |
| [The Maze of Galious](https://antxiko.github.io/MazeOfGalious-disassembly/es/) | 15 | 170 | `busca_otros_cartuchos` (p06:B751) = `mira_las_ranuras` |

La matriz entera, los 58 cartuchos entre sí, está en
[Las rutinas](https://antxiko.github.io/MSX-disassembly-database/es/LAS-RUTINAS.html) de la base de datos de la
serie, con el método y el programa que la mide.
