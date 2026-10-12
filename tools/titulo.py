#!/usr/bin/env python3
"""El rotulo del arranque y la pantalla de titulo, montados como los monta el juego.

ROTULO (estado 0, p05:941F): HMMV a 0 de 0xA8 x 0x48 en (0x28, 0x40) de la
pagina 1; tres juegos de caracteres de 1 bit (p05:9453: RLE p05:94C3 con el
color 1 en (8, 0), p05:950B con el 2 en (0x70, 0) y p05:9550 con el 3 en
(0xD8, 0)) y el rotulo de p05:9624 (p05:94A3): cada byte es una ficha de la
pagina 1 (p00:4E2B) que se copia a (D, E) de la pagina 1, empezando en
(0x40, 0x40); 0xFE [dx] baja una fila. La paleta es p05:9614. p05:9483 lo
descubre despues en la pagina 0 copiando 0xA8 x n desde (0x28, 0x40).

TITULO (estado 1, p00:4127): la fuente (p00:50C1), las listas de fichas de
p05:83B3 y p05:9A4B (p05:96B5) y el mapa de 14 x 15 fichas del RLE p05:9988
en (0x48, 0x1C) (p05:96EA); el color 13 = (0x77, 0x07). La paleta llega
desde negro hasta p06:B550 (p05:9792).
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import leer, rle, T456, T131415, bytes_de   # noqa: E402
from vram import VRAM                                # noqa: E402


def caracteres(v, datos, n, x, y, color, pagina=1):
    """L_4CBF: n caracteres de 1 bit (8 bytes) desde (x, y); al pasar de 256
    puntos sigue en la fila de 8 de abajo (p00:4E3F)."""
    for k in range(n):
        for fila in range(8):
            b = datos[k * 8 + fila]
            for i in range(8):
                v.pon_punto(pagina, x + i, y + fila, color if b & (0x80 >> i) else 0)
        x += 8
        if x >= 256:
            x -= 256
            y += 8
    return x, y


def fuente(v):
    """p00:50C1: la fuente de 156 caracteres (color 0x0D) en (0, 0x40) y lo demas."""
    datos, _ = rle(T131415, 0x9289)
    caracteres(v, datos, 0x9C, 0, 0x40, 0x0D)
    caracteres(v, bytes_de(T131415, 0x970C, 8), 1, 0x60, 0x58, 0x0A)
    for fila in range(8):          # L_4CFA: la ficha de 4 bits de p14:9714 en 0xAC34
        for i in range(4):
            v.m[(0xAC34 + fila * 0x80 + i) & 0xFFFF] = leer(T131415, 0x9714 + fila * 4 + i)
    for a, y in ((0x9734, 0xC0), (0x9776, 0xC8)):
        d, _ = rle(T131415, a)
        caracteres(v, d, 8, 0x00, y, 0x0B)
        caracteres(v, d, 8, 0x40, y, 0x0A)          # p00:50BB conserva HL: los mismos


def vram_del_rotulo():
    v = VRAM()
    for y in range(0x40, 0x40 + 0x48):
        for x in range(0x28, 0x28 + 0xA8):
            v.pon_punto(1, x, y, 0)
    for a, n, x, color in ((0x94C3, 13, 8, 1), (0x950B, 13, 0x70, 2), (0x9550, 26, 0xD8, 3)):
        datos, _ = rle(T456, a)
        caracteres(v, datos, n, x, 0, color)
    v.paleta(T456, 0x9614)
    a = 0x9624
    d, e = 0x40, 0x40
    fila_d = d
    while True:
        c = leer(T456, a)
        a += 1
        if c == 0xFF:
            break
        if c == 0xFE:
            fila_d = (fila_d + leer(T456, a)) & 0xFF
            a += 1
            d = fila_d
            e += 8
            continue
        v.hmmm((c & 31) * 8, (c >> 5) * 8, 1, d, e, 1, 8, 8)
        d = (d + 8) & 0xFF
    return v


def vram_del_titulo():
    v = VRAM()
    fuente(v)
    v.lista(T456, 0x83B3, 0x83AD)
    v.lista(T456, 0x9A4B, 0x9A29)
    mapa, _ = rle(T456, 0x9988)
    for fy in range(15):
        for fx in range(14):
            v.ficha(mapa[fy * 14 + fx], 0x48 + fx * 8, 0x1C + fy * 8, 0)
    v.paleta(T456, 0xB550)
    v.pal[13] = (7, 7, 7)
    return v


def imagen(v, pagina, x0, y0, ancho, alto, escala=2):
    from PIL import Image
    img = Image.new("RGB", (ancho, alto))
    for y in range(alto):
        for x in range(ancho):
            img.putpixel((x, y), v.rgb(v.punto(pagina, x0 + x, y0 + y)))
    return img.resize((ancho * escala, alto * escala), Image.NEAREST)


# LA INTRO ANIMADA.
# El rotulo (p05:9483): 0xC240 = 0x3C y 0xC241 = 0x31 (p05:9447); cada 2
# cuadros 0xC241 baja y se copian a la pagina 0 las 0x31 - 0xC241 primeras
# lineas de 0xA8 puntos desde (0x28, 0x40): de 1 a 0x30.
# El titulo (p05:9792): la paleta empieza a negro (p05:9748) y cada 4 cuadros
# da un paso: el color de la terna 0xCA06 de p06:B550 en el paso 0xCA07 (0-7)
# lleva cada componente a max(0, paso - (7 - valor final)); a los 8 pasos, el
# color siguiente, hasta el 0xFF.
def ternas(trio, a):
    out = []
    while leer(trio, a) != 0xFF:
        r, rb, g = leer(trio, a), leer(trio, a + 1), leer(trio, a + 2)
        out.append((r & 0x0F, ((rb >> 4) & 7, g & 7, rb & 7)))
        a += 3
    return out


def intro(ruta, escala=2):
    from PIL import Image
    cuadros, duraciones = [], []
    v = vram_del_rotulo()
    for lineas in range(1, 0x31):
        img = Image.new("RGB", (256, 212))
        for y in range(lineas):
            for x in range(0xA8):
                img.putpixel((0x28 + x, 0x40 + y), v.rgb(v.punto(1, 0x28 + x, 0x40 + y)))
        cuadros.append(img)
        duraciones.append(2)
    duraciones[-1] = 60                     # el rotulo entero, un segundo
    t = vram_del_titulo()
    final = list(t.pal)
    t.pal = [(0, 0, 0)] * 16
    for color, (r, g, b) in ternas(T456, 0xB550):
        for paso in range(8):
            t.pal[color] = tuple(max(0, paso - (7 - c)) for c in (r, g, b))
            cuadros.append(imagen(t, 0, 0, 0, 256, 212, 1))
            duraciones.append(4)
    t.pal = final
    cuadros.append(imagen(t, 0, 0, 0, 256, 212, 1))
    duraciones.append(120)
    cuadros = [c.resize((256 * escala, 212 * escala), Image.NEAREST) for c in cuadros]
    cuadros[0].save(ruta, save_all=True, append_images=cuadros[1:],
                    duration=[round(d * 1000 / 60) for d in duraciones], loop=0)


def main(argv):
    if len(argv) >= 3 and argv[1] == "rotulo":
        imagen(vram_del_rotulo(), 1, 0x28, 0x40, 0xA8, 0x48).save(argv[2])
    elif len(argv) >= 3 and argv[1] == "intro":
        intro(argv[2])
    elif len(argv) >= 3 and argv[1] == "titulo":
        imagen(vram_del_titulo(), 0, 0, 0, 256, 212).save(argv[2])
    else:
        sys.exit("uso: titulo.py rotulo|titulo <png> | intro <gif>")


if __name__ == "__main__":
    main(sys.argv)
