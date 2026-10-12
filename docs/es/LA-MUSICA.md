# La música

Todo lo que suena aquí sale de ejecutar el motor de sonido del cartucho
(banco 13, `p13:6000`) en un Z80 emulado, cuadro a cuadro y a 60 por segundo,
igual que lo llama la interrupción (`p00:4048`). Lo que el motor escribe en el
PSG pasa a sonido con un AY-3-8910 (`tools/musica.py`). Cada MP3 es la pieza
entera hasta donde vuelve a empezar, más 8 segundos de la vuelta apagándose.

## Cotejado con openMSX

Las escrituras al PSG se han comparado cuadro a cuadro con las de openMSX
(C-BIOS MSX2 japonés). En todos los cuadros el PSG queda igual:

- la música de la antesala entera (1.454 cuadros);
- la de la ruina 4 con la altura 0x80, la pieza entera (6.614 cuadros);
- el principio de la de la partida (178 cuadros).

Para oír la de la ruina 4 sin jugar hasta allí, la sonda cambió la petición de
la antesala por esa música (`tools/omsx_psg.tcl`). El timbre no está cotejado:
es el de un AY-3-8910 de manual, no una grabación del emulador.

## La música de cada ruina cambia con el ánimo

Al entrar en una fase, `musica_de_fase` (`p00:54C8`) pide la música de la
ruina (`p15:BE70`). Guarda además en 0xC122 una altura,
`p15:BE7A[ruina × 4 + estado]`, que depende del ánimo del que entra. Con esa
altura el motor mueve la tabla de notas (`p13:625D`) y, del instrumento 2 en
adelante, el instrumento (`p13:62E2`):

| Altura | Las notas | El instrumento |
|---|---|---|
| 0x20 | dos semitonos más altas | dos más allá |
| 0x00 | como están escritas | el suyo |
| 0x40 | un semitono más bajas | uno antes |
| 0x80 | dos semitonos más bajas | dos antes |

Feliz es siempre 0x20 y tranquilo siempre 0x00. Triste y enfadado se reparten
0x80 y 0x40: en Pegu y Alchi, triste 0x80 y enfadado 0x40; en Dunhuang, Hunza
y Agra, al revés.

### Pegu (0x80)

**Feliz**, altura 0x20

<audio controls preload="none" src="../audio/ruina0_estado0.mp3"></audio>

**Tranquilo**, altura 0x00

<audio controls preload="none" src="../audio/ruina0_estado1.mp3"></audio>

**Triste**, altura 0x80

<audio controls preload="none" src="../audio/ruina0_estado2.mp3"></audio>

**Enfadado**, altura 0x40

<audio controls preload="none" src="../audio/ruina0_estado3.mp3"></audio>

### Dunhuang (0x81)

**Feliz**, altura 0x20

<audio controls preload="none" src="../audio/ruina1_estado0.mp3"></audio>

**Tranquilo**, altura 0x00

<audio controls preload="none" src="../audio/ruina1_estado1.mp3"></audio>

**Triste**, altura 0x40

<audio controls preload="none" src="../audio/ruina1_estado2.mp3"></audio>

**Enfadado**, altura 0x80

<audio controls preload="none" src="../audio/ruina1_estado3.mp3"></audio>

### Alchi (0x82)

**Feliz**, altura 0x20

<audio controls preload="none" src="../audio/ruina2_estado0.mp3"></audio>

**Tranquilo**, altura 0x00

<audio controls preload="none" src="../audio/ruina2_estado1.mp3"></audio>

**Triste**, altura 0x80

<audio controls preload="none" src="../audio/ruina2_estado2.mp3"></audio>

**Enfadado**, altura 0x40

<audio controls preload="none" src="../audio/ruina2_estado3.mp3"></audio>

### Hunza (0x83)

**Feliz**, altura 0x20

<audio controls preload="none" src="../audio/ruina3_estado0.mp3"></audio>

**Tranquilo**, altura 0x00

<audio controls preload="none" src="../audio/ruina3_estado1.mp3"></audio>

**Triste**, altura 0x40

<audio controls preload="none" src="../audio/ruina3_estado2.mp3"></audio>

**Enfadado**, altura 0x80

<audio controls preload="none" src="../audio/ruina3_estado3.mp3"></audio>

### Agra (0x84)

**Feliz**, altura 0x20

<audio controls preload="none" src="../audio/ruina4_estado0.mp3"></audio>

**Tranquilo**, altura 0x00

<audio controls preload="none" src="../audio/ruina4_estado1.mp3"></audio>

**Triste**, altura 0x40

<audio controls preload="none" src="../audio/ruina4_estado2.mp3"></audio>

**Enfadado**, altura 0x80

<audio controls preload="none" src="../audio/ruina4_estado3.mp3"></audio>

## F5 cambia una voz en Dunhuang

En la fase, F5 calla la música (`p00:5FEF`) y la vuelve a poner
(`p00:5FE6`). Al volver la toma de otra tabla, `p15:BE75`, que solo cambia en
Dunhuang: suena la 0x85, la misma partitura con otra segunda voz (`p13:7690`
en lugar de `p13:7507`).

**Feliz**, altura 0x20

<audio controls preload="none" src="../audio/ruina1_otra_estado0.mp3"></audio>

**Tranquilo**, altura 0x00

<audio controls preload="none" src="../audio/ruina1_otra_estado1.mp3"></audio>

**Triste**, altura 0x40

<audio controls preload="none" src="../audio/ruina1_otra_estado2.mp3"></audio>

**Enfadado**, altura 0x80

<audio controls preload="none" src="../audio/ruina1_otra_estado3.mp3"></audio>

## Las demás

La antesala: 0x89 (`p00:424C`).

<audio controls preload="none" src="../audio/musica_89.mp3"></audio>

Al empezar la partida: 0x8A (`p00:41DB`).

<audio controls preload="none" src="../audio/musica_8A.mp3"></audio>

La sala de la estatua: 0x86 (`p00:5512`).

<audio controls preload="none" src="../audio/musica_86.mp3"></audio>

Los jefes: 0x87 en la sala de la estatua (`p02:8D75`). La 0x88 suena en la sala del jefe de cada fase (`p02:90A1`) y es la misma pieza: los mismos tres punteros en `p13:672C`.

<audio controls preload="none" src="../audio/musica_87.mp3"></audio>

Al acabar una ruina: 0x8B (`p00:454E`).

<audio controls preload="none" src="../audio/musica_8B.mp3"></audio>

Al acabar la última, Agra: 0x8C (`p00:4552`).

<audio controls preload="none" src="../audio/musica_8C.mp3"></audio>

La muerte: 0x8D (`p01:6309`).

<audio controls preload="none" src="../audio/musica_8D.mp3"></audio>

GAME OVER: 0x8E (`p00:440A`).

<audio controls preload="none" src="../audio/musica_8E.mp3"></audio>

La 0x8F no suena: sus tres voces empiezan con el fin de pista (0xFF).
