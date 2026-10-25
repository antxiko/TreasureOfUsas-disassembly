# El código

## Las cifras

- **100 %** del binario explicado: 41.458 bytes de código trazado y 89.614
  de datos con nombre, que suman los 131.072 del cartucho.
- 20.434 instrucciones en los bancos 0, 1, 2, 3, 4, 5, 6, 9, 13 y 15, con
  **8.185 comentarios: el 40,1 %**.
- 2.536 rutinas y etiquetas; ninguna por debajo del 10 % de comentarios, y
  ningún `call` a una rutina sin nombre.

## Cómo se ordena

El juego del cuadro (`p00:40E0`) despacha por el **estado del juego**
(0xC000, 14 estados, tabla `p00:40F4`): el arranque, la espera, la demo,
PLAY START, las escenas, la partida, al morir, GAME OVER, el cambio de
pantalla, el compañero capturado, el fin de la ruina, INFORMATION (0x0B y
0x0D) y la clave (0x0C).

## Las fichas

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

## Los actores

Hay 63 tipos en 0xC400 (manejadores `p02:82E9`), puestos pantalla a
pantalla por `p09:B12B`. Sus dibujos se montan con piezas (`p15:B744`) y
paleta propia (`p09:B781`). Las trampas de 0xCD00 son otra lista, de 13
tipos (`p15:A4F9`), con los patrones en RLE (`p00:4926`).

## Los textos

La fuente empieza con 0x2B = «A» y lleva hiragana (0x49-0x76) y 28 kanji
(0xA0-0xBB, `p14:9289`). Hay tres formatos: rótulo, a máquina (FD salta de
línea, FE da la palabra al otro) y plano.

## Los nombres

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
