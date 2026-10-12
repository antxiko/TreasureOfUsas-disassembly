#!/usr/bin/env python3
"""Los objetos que se cogen y el globo que sale al cambiar de animo.

LOS OBJETOS son actores de tipo 0x29 o 0x2A con su clase en (ix+0x15). Se
pintan con p03:A80A: 16 x 16 de la pagina 1 con TIMP desde la posicion
p03:A81D[clase - 1] ([X][Y] en H y L, como p00:4C73), en (X - 8, Y - 16). Al
tocarlos (p01:72C8 -> p01:7539) p01:758C despacha la clase - 1:
  1-4   monedas: + 1, 5, 0x10 y 0x100 (BCD; p01:75A6-75B5)
  5     0xC310 + 1 (p01:75C3)
  6     0xC310 + 1 y un remiendo de 16 x 8 (p01:75CF)
  7     0xC310 + 1 y 0xC314 = 0 (p01:75DC)
  8-11  el animo: (ix+6) = 0, 1, 2 o 3 (p01:75EE-75F9)
  12-13 + 5 y + 0x10, como las clases 2 y 3
El dibujo de la clase 6, en (0x10, 0x80), no lo carga ninguna de las listas
que monta tools/fases.py: aqui no sale.

EL GLOBO (p01:761D): con el animo nuevo, p00:5AB8 carga los patrones de
p15:A426[animo] en 0x28 y 0x2C, y dos sprites (8 y 9) van en (Y - 0x30, X - 8)
con los colores de p01:765B[animo] (16 lineas cada uno). 0xC272 = 0x10: a los
16 cuadros, p03:B333 pone en su lugar los patrones de p15:A3C1[animo]
(p00:5ABD), que se quedan.

Uso: objetos.py <png>
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import leer, palabra, rle, T123, T131415   # noqa: E402
import fases                                        # noqa: E402

POSICIONES = 0xA81D    # p03:A81D
CLASES = 13
SIN_DIBUJO = (6,)
COLORES_GLOBO = 0x765B  # p01:765B
GLOBO, ENCIMA = 0xA426, 0xA3C1
ESCALA = 4


def patrones(base, animo):
    """p00:5612: el RLE volteado al primer patron y tal cual al segundo."""
    a = base + 4 * animo
    vol, nor = leer(T131415, a), leer(T131415, a + 3)
    datos, _ = rle(T131415, palabra(T131415, a + 1))
    pat = {}
    for k in range(len(datos) // 32):
        s = datos[k * 32:(k + 1) * 32]
        inv = bytes(int("{:08b}".format(b)[::-1], 2) for b in s)
        pat[vol + 4 * k] = inv[16:] + inv[:16]
    if nor:
        for k in range(len(datos) // 32):
            pat[nor + 4 * k] = datos[k * 32:(k + 1) * 32]
    return pat


def sprite(img, datos, x0, y0, rgb):
    for y in range(16):
        for x in range(16):
            if datos[(16 if x >= 8 else 0) + y] & (0x80 >> (x & 7)):
                img.putpixel((x0 + x, y0 + y), rgb)


def main(argv):
    from PIL import Image
    if len(argv) < 2:
        sys.exit("uso: objetos.py <png>")
    v = fases.vram_de_ruina(0)
    img = Image.new("RGB", (CLASES * 20 + 4, 2 * 24 + 4), (24, 24, 24))
    for clase in range(1, CLASES + 1):
        if clase in SIN_DIBUJO:
            continue
        p = palabra(T123, POSICIONES + 2 * (clase - 1))
        sx, sy = p >> 8, p & 0xFF
        for y in range(16):
            for x in range(16):
                c = v.punto(1, sx + x, sy + y)
                if c:                                   # TIMP: el 0 no pinta
                    img.putpixel((4 + (clase - 1) * 20 + x, 4 + y), v.rgb(c))
    for animo in range(4):
        c8 = leer(T123, COLORES_GLOBO + 2 * animo)
        c9 = leer(T123, COLORES_GLOBO + 2 * animo + 1)
        for k, base in enumerate((GLOBO, ENCIMA)):
            pat = patrones(base, animo)
            x0, y0 = 4 + (2 * animo + k) * 20 + (animo * 12), 28
            # el sprite 8 tapa al 9 (menor numero, mas prioridad)
            if 0x2C in pat:
                sprite(img, pat[0x2C], x0, y0, v.rgb(c9 & 0x0F))
            if 0x28 in pat:
                sprite(img, pat[0x28], x0, y0, v.rgb(c8 & 0x0F))
    img.resize((img.width * ESCALA, img.height * ESCALA), Image.NEAREST).save(argv[1])


if __name__ == "__main__":
    main(sys.argv)
