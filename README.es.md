# The Treasure of Usas - desensamblado comentado

*(Also [in English](README.md).)*

El desensamblado comentado de **The Treasure of Usas** (Konami, 1987,
RC-753) para MSX2: un MegaROM de 128 KB con el mapper de Konami sin SCC,
dieciséis bancos de 8 KB.

- **100 %** del binario explicado: 41.458 bytes de código y 89.614 de datos
  con nombre, ni un byte sin asignar.
- **40,1 %** del listado comentado, 2.536 rutinas y etiquetas, ninguna por
  debajo del 10 % de comentarios.
- El listado se reensambla en la ROM original **byte a byte**.
- Las 20 fases con lo que hay en cada pantalla, las antesalas, el mapa de
  fuera, Wit y Cles con sus cuatro estados de ánimo, los enemigos, los jefes,
  las caras, las escenas y el título están **dibujados desde la ROM**, no
  capturados.

La web: <https://antxiko.github.io/TreasureOfUsas-disassembly/es/>
(en inglés: <https://antxiko.github.io/TreasureOfUsas-disassembly/>).

## Reproducirlo

La imagen del cartucho no se distribuye. Pon la tuya en la raíz como
`usas.rom` (sha256 `11e0b842...`) y ejecuta `make`. El detalle, en
[EMPEZAR](docs/es/EMPEZAR.md).

## Legal

El juego es de Konami y de sus titulares. La licencia de `LICENSE` cubre solo
las herramientas, los comentarios, el análisis y la documentación de aquí.
Mira [AVISO-LEGAL.md](AVISO-LEGAL.md).
