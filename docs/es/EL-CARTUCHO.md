# El cartucho

## La máquina

MSX2: el VDP es un V9938 y el juego trabaja en SCREEN 5 (`p00:4FAA`). La
página 0 de la VRAM es la pantalla y la página 1 guarda las fichas y la
fuente. Casi todo se pinta con los comandos del VDP: HMMV (`p00:4BA2`), HMMM
(`p00:4BDE`), HMMC (`p00:4C22`) y LMMM con TIMP (`p00:4C73`).

## El mapper

MegaROM de 128 KB con el mapper Konami sin SCC: 16 bancos de 8 KB, y ninguna
escritura a 0x5000, 0x7000, 0x9000 ni 0xB000. El banco 0 está fijo en 0x4000
y los demás se ponen por tríos en 0x6000, 0x8000 y 0xA000: 1-2-3, 4-5-6,
7-8-9, 10-11-12 y 13-14-15 (`p00:5464`-`548D`). En 0xA000 se pone también
uno solo, el 6, el 9, el 12 o el 15 (`p00:54A5`-`54B4`). La copia queda en
0xF0F1-0xF0F3.

## La interrupción

`p00:403D` cuelga de H.TIMI (`p00:40CC`). Cada cuadro pone los bancos
13-14-15 y mueve el sonido (`p13:6000`); después, si el cuadro anterior ya
acabó (0xC005), llama al del juego (`p00:40E0`).

## El sonido

El PSG, con cuatro canales desde 0xC01C. Hay 16 músicas de tres canales
(0x80-0x8F, `p13:672C`), cinco sonidos de tres canales (0x40-0x44,
`p13:670E`) y los efectos 1-0x25 y 0x70-0x7F (`p13:66C4`).

## Los sprites

Los atributos se preparan en 0xDE00 y van a la VRAM 0x7600; cada cuadro se
empieza por otro sprite (`p00:564C`), para que con muchos en una línea no
desaparezca siempre el mismo.

## La RAM

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
