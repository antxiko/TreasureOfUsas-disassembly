#!/usr/bin/env python3
"""Los retratos de Wit y Cles, uno por estado de animo, como los pinta el cartucho.

p06:A4BD (retratos): el retrato es de 6 x 6 fichas de la pagina 1 (p06:A4F5);
las de Wit (el personaje 0) salen de p06:A644[0xC2B6] y las de Cles (el 1) de
p06:A64C[0xC2D6], en (0x18, 0x2C) y (0xB8, 0x2C). Que el 0 es Wit lo dice la
propia pantalla INFORMATION: su texto (p06:A173) pone WIT encima del retrato
de la izquierda y CLES encima del de la derecha.

Las fichas son las de la lista p06:A7F8 (p06:A45C, colores p06:A7E4) con la
paleta p06:B335 y despues p06:B351 (p05:9EEC).

LA BOCA (p02:81DB y p02:81E7): mientras sale el texto a maquina, cada 8 cuadros
(0xC003 & 7) se alterna 0xC8AC y se pinta un bloque de 2 x 2 fichas de
p06:A774 (Wit) o p06:A794 (Cles): el bloque (0xC8AC * 4 + estado). Va en
(0x28, 0x44) y (0xC8, 0x44): (16, 24) dentro de cada retrato.

Uso: retratos.py hoja <png> | habla <gif>
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import leer, palabra, T456   # noqa: E402
from vram import VRAM                 # noqa: E402
import titulo                         # noqa: E402

TABLAS = (0xA644, 0xA64C)    # las fichas del retrato por estado
BOCAS = (0xA774, 0xA794)     # los bloques de la boca
ESCALA = 3


def vram_de_informacion():
    v = VRAM()
    titulo.fuente(v)                      # p00:50C1, que ya esta cargada
    v.lista(T456, 0xA7F8, 0xA7E4)         # p06:A45C
    v.paleta(T456, 0xB335)                # p00:53DE
    v.paleta(T456, 0xB351)                # p06:A465
    return v


def pinta_fichas(img, v, fichas, ancho, x0, y0):
    for k, t in enumerate(fichas):
        fx, fy = x0 + (k % ancho) * 8, y0 + (k // ancho) * 8
        for y in range(8):
            for x in range(8):
                img.putpixel((fx + x, fy + y), v.rgb(v.punto(1, (t & 31) * 8 + x, (t >> 5) * 8 + y)))


def retrato(personaje, estado):
    a = palabra(T456, TABLAS[personaje] + 2 * estado)
    return [leer(T456, a + k) for k in range(36)]


def boca(personaje, estado, cuadro):
    a = BOCAS[personaje] + (cuadro * 4 + estado) * 4
    return [leer(T456, a + k) for k in range(4)]


def lienzo(v, cuadro=None):
    """Los ocho retratos: Wit arriba, Cles abajo, estados 0-3 de izquierda a derecha."""
    from PIL import Image
    hueco = 6
    img = Image.new("RGB", (4 * 48 + 5 * hueco, 2 * 48 + 3 * hueco), v.rgb(0))
    for p in range(2):
        for e in range(4):
            x0, y0 = hueco + e * (48 + hueco), hueco + p * (48 + hueco)
            pinta_fichas(img, v, retrato(p, e), 6, x0, y0)
            if cuadro is not None:
                pinta_fichas(img, v, boca(p, e, cuadro), 2, x0 + 16, y0 + 24)
    return img.resize((img.width * ESCALA, img.height * ESCALA), Image.NEAREST)


def main(argv):
    v = vram_de_informacion()
    if len(argv) >= 3 and argv[1] == "hoja":
        lienzo(v).save(argv[2])
    elif len(argv) >= 3 and argv[1] == "habla":
        # 8 cuadros por boca a 60 Hz (el cartucho es japones): 133 ms
        cuadros = [lienzo(v, 0), lienzo(v, 1)]
        cuadros[0].save(argv[2], save_all=True, append_images=cuadros[1:],
                        duration=133, loop=0)
    else:
        sys.exit("uso: retratos.py hoja <png> | habla <gif>")


if __name__ == "__main__":
    main(sys.argv)
