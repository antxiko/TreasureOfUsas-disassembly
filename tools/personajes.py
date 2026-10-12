#!/usr/bin/env python3
"""Los dos protagonistas, compuestos pieza a pieza como los compone el cartucho.

p00:5B12 (con 13-14-15): la tabla de fotogramas del personaje (p14:97AE con
0xC240 = 0, p14:9BCE con 0xC240 = 1) tiene 7 por estado; el estado es
(ix+6) y la tabla avanza (ix+6) * 14 (p00:5B06).

p00:5BC6 compone cada fotograma en 0xD600 (0x80 bytes = 4 patrones de
16 x 16): registros [p | 0x80][desplazamiento][pieza] hasta 0xFF.
  - p (0-0x3F) dice la fila: 0x00-0x0F la mitad de arriba de la capa 0
    (0xD600), 0x10-0x1F la de abajo (0xD640), 0x20-0x2F arriba de la capa 1
    (0xD620) y 0x30-0x3F abajo (0xD660) (p00:5C2A); al pasar de 16 filas
    sigue en el patron de abajo (p00:5C8C).
  - sin el bit 7, la pieza se mezcla (OR) con lo que hay (0xC26A).
  - la pieza: [n] y dos bloques de n filas (columna izquierda y derecha);
    el primero va a la capa 0 y el segundo a la capa 1 (p00:5BF2-5C0E). Cada
    fila de 16 puntos se desplaza C puntos: a la derecha si C < 0x80, a la
    izquierda (-C) si no (p00:5C69).
Despues p00:5CB4 lo voltea y lo copia otra vez: cada fotograma va a la VRAM
mirando a los dos lados.

Los sprites: arriba y abajo, cada mitad con dos sprites superpuestos (p01:68F6,
desplazamientos de p01:692B); la capa 0 con el color 0xC24C y la 1 con 0xC24D
y el bit CC (OR): 6 y 0x49 (p01:67F2).
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import leer, palabra, T131415   # noqa: E402

TABLAS = {0: 0x97AE, 1: 0x9BCE}
COLOR_0, COLOR_1 = 6, 9


def destino(p):
    """p00:5C2A: el desplazamiento en 0xD600 de la fila p."""
    if p < 0x10:
        return p
    if p < 0x20:
        return 0x30 + p
    if p < 0x30:
        return p
    return 0x30 + p


def compone(foto):
    """p00:5BC6: los 0x80 bytes del fotograma."""
    T = T131415
    buf = bytearray(0x80)
    a = foto
    while True:
        b = leer(T, a)
        if b == 0xFF:
            return buf
        mezcla = not (b & 0x80)
        p = b & 0x7F
        c = leer(T, a + 1)
        pieza = palabra(T, a + 2)
        a += 4
        n = leer(T, pieza)
        for capa, base in ((0, pieza + 1), (1, pieza + 1 + 2 * n)):
            d = destino(p + 0x20 * capa)
            for f in range(n):
                fila = (leer(T, base + f) << 8) | leer(T, base + n + f)
                if c:
                    fila = (fila >> c) if c < 0x80 else (fila << (256 - c)) & 0xFFFF
                for off, byte in ((d, fila >> 8), (d + 0x10, fila & 0xFF)):
                    buf[off] = (buf[off] | byte) if mezcla else byte
                d += 1
                if d & 0x10:            # p00:5C8C: al patron de abajo
                    d += 0x30


def pixeles(buf):
    """32 filas x 16 puntos: 0, 1 (capa 0), 2 (capa 1) o 3 (las dos)."""
    out = []
    for mitad, (p0, p1) in enumerate(((0x00, 0x20), (0x40, 0x60))):
        for f in range(16):
            fila = []
            for x in range(16):
                col = 0 if x < 8 else 0x10
                bit = 0x80 >> (x & 7)
                v = (1 if buf[p0 + col + f] & bit else 0) | (2 if buf[p1 + col + f] & bit else 0)
                fila.append(v)
            out.append(fila)
    return out


def fotogramas(personaje, estado):
    t = TABLAS[personaje]
    return [palabra(T131415, t + estado * 14 + 2 * k) for k in range(7)]


def hoja(ruta, escala=3):
    """2 personajes x 4 estados x 7 fotogramas, con la paleta de las fases de la ruina 0."""
    from PIL import Image
    import fases
    v = fases.vram_de_ruina(0)
    colores = {0: None, 1: v.rgb(COLOR_0), 2: v.rgb(COLOR_1), 3: v.rgb(COLOR_0 | COLOR_1)}
    ancho, alto = 7 * 20 + 4, 2 * 4 * 36 + 8
    img = Image.new("RGB", (ancho, alto), (24, 24, 24))
    for pj in range(2):
        for est in range(4):
            for k, foto in enumerate(fotogramas(pj, est)):
                px = pixeles(compone(foto))
                ox, oy = 4 + k * 20, 4 + (pj * 4 + est) * 36
                for y in range(32):
                    for x in range(16):
                        c = colores[px[y][x]]
                        if c:
                            img.putpixel((ox + x, oy + y), c)
    img.resize((ancho * escala, alto * escala), Image.NEAREST).save(ruta)


if __name__ == "__main__":
    if len(sys.argv) >= 3 and sys.argv[1] == "hoja":
        hoja(sys.argv[2])
    else:
        sys.exit("uso: personajes.py hoja <png>")
