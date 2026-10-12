#!/usr/bin/env python3
"""El dibujo grande de la sala de la puerta 5, como lo monta p00:51D4.

El RLE de p06:B105 (p00:5578) da 14 x 14 numeros de ficha en 0xE800. Encima
van los remiendos 0..ruina de p06:B18A (p00:5248): cada remiendo es una lista
de [destino lo][hi] (0 acaba) [ancho][alto] y ancho x alto fichas, filas de
14 en 14, y una ficha 0 deja la que habia. Luego cada ficha se pinta en la
pagina 1 desde (0x60, 0x90) (p00:5201, con 0xC20B = 1), con las fichas de la
sala 5 cargadas EN ESE MOMENTO: p15:BB95 (p00:51C5) y p08:8A35 (p00:51D4);
las listas que vienen despues (p00:5372, 53BB, 53AF, 5A38) aun no estan. La
paleta, la de la sala 5: p06:B335 y p06:B35C[ruina] (p00:53F2). En la sala,
los pasos 5 y 6 la copian a (0x34, 0x48) de la pagina 0 (p02:8CCA).

Uso: estatua.py <png>
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import leer, palabra, rle, tabla, T456, T789, T131415   # noqa: E402
from vram import VRAM                                            # noqa: E402

LADO = 14
ESCALA = 2


def fichas(ruina):
    dibujo = bytearray(rle(T456, 0xB105)[0][:LADO * LADO])
    for k in range(ruina + 1):
        a = palabra(T456, 0xB18A + 2 * k)
        while True:
            lo = leer(T456, a)
            if lo == 0:
                break
            destino = (lo | (leer(T456, a + 1) << 8)) - 0xE800
            ancho, alto = leer(T456, a + 2), leer(T456, a + 3)
            a += 4
            for y in range(alto):
                for x in range(ancho):
                    t = leer(T456, a)
                    a += 1
                    if t:
                        dibujo[destino + y * LADO + x] = t
    return dibujo


def main(argv):
    from PIL import Image
    if len(argv) < 2:
        sys.exit("uso: estatua.py <png>")
    img = Image.new("RGB", (5 * (LADO * 8 + 8) + 8, LADO * 8 + 16), (24, 24, 24))
    for r in range(5):
        v = VRAM()
        v.lista(T131415, 0xBB95, 0xBB71)
        v.lista(T789, 0x8A35, 0x8A19)
        v.paleta(T456, 0xB335)
        v.paleta(T456, tabla(T456, 0xB35C, r))
        for k, t in enumerate(fichas(r)):
            x0 = 8 + r * (LADO * 8 + 8) + (k % LADO) * 8
            y0 = 8 + (k // LADO) * 8
            for y in range(8):
                for x in range(8):
                    img.putpixel((x0 + x, y0 + y), v.rgb(v.punto(1, (t & 31) * 8 + x, (t >> 5) * 8 + y)))
    img.resize((img.width * ESCALA, img.height * ESCALA), Image.NEAREST).save(argv[1])


if __name__ == "__main__":
    main(sys.argv)
