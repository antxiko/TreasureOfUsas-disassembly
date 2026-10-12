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
