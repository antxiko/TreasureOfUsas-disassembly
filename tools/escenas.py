#!/usr/bin/env python3
"""Las 12 escenas (0xC220), montadas como las monta p04:71D5.

  p04:7300  las fichas: escenas 0, 1 y 7 p00:51AD (p07:61C1 con los colores
            p07:6064 y p04:799C con p04:798A); la 4 p05:80BC/80B2; 2, 3, 5 y 6
            p04:7B3D/7AED; 8-11 p04:7343[C220 - 8] con p04:733B[C220 - 8]
  p04:7384  la paleta p06:B3DE[0xC220]
  p04:7296  el mapa: RLE p04:72AE[0xC220] a 0xD200 (la 4 copia 36 bytes de
            p05:8FA9; la 7 no tiene mapa: p04:72C6 pinta un rectangulo)
  p04:71FE  el dibujo: filas y columnas de p04:7251[0xC220] desde 0xD200, en
            la posicion de p04:7239[0xC220], ficha a ficha con TIMP (p04:72EE)
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import palabra, tabla, rle, bytes_de, T456, T789   # noqa: E402
from vram import VRAM                                       # noqa: E402


def vram_de_escena(n):
    v = VRAM()
    if n == 8:
        # La lista de la 8 no carga ninguna de las 39 fichas de su mapa: las
        # deja la 7, que la precede (ruina 5: p04:71F8 da la 7 y luego inc
        # 0xC220), y pinta_escena solo borra la pagina 0.
        v.lista(T789, 0x61C1, 0x6064)
        v.lista(T456, 0x799C, 0x798A)
    if n < 2 or n == 7:
        v.lista(T789, 0x61C1, 0x6064)
        v.lista(T456, 0x799C, 0x798A)
    elif n == 4:
        v.lista(T456, 0x80BC, 0x80B2)
    elif n < 8:
        v.lista(T456, 0x7B3D, 0x7AED)
    else:
        v.lista(T456, palabra(T456, 0x7343 + 2 * (n - 8)), palabra(T456, 0x733B + 2 * (n - 8)))
    v.paleta(T456, tabla(T456, 0xB3DE, n))
    return v


def mapa_de_escena(n):
    if n == 4:
        return bytes_de(T456, 0x8FA9, 0x24)
    if n == 7:
        return None
    datos, _ = rle(T456, tabla(T456, 0x72AE, n))
    return datos


def pinta_escena(n):
    v = vram_de_escena(n)
    m = mapa_de_escena(n)
    if m is None:
        return v, None
    pos = palabra(T456, 0x7239 + 2 * n)
    tam = palabra(T456, 0x7251 + 2 * n)
    x0, y0 = pos & 0xFF, pos >> 8              # p04:720E: D = L, E = H
    filas, columnas = tam & 0xFF, tam >> 8     # p04:7272: 0xDE80 = L, 0xDE81 = H
    for f in range(filas):
        for c in range(columnas):
            t = m[f * columnas + c] if f * columnas + c < len(m) else 0
            sx, sy = (t & 31) * 8, (t >> 5) * 8
            v.timp(sx, sy, 1, x0 + c * 8, y0 + f * 8, 0, 8, 8)
    return v, (x0, y0, columnas * 8, filas * 8)


def imagen(n, escala=2):
    from PIL import Image
    v, caja = pinta_escena(n)
    if caja is None:
        return None
    x0, y0, w, h = caja
    img = Image.new("RGB", (w, h))
    for y in range(h):
        for x in range(w):
            img.putpixel((x, y), v.rgb(v.punto(0, x0 + x, y0 + y)))
    return img.resize((w * escala, h * escala), Image.NEAREST)


if __name__ == "__main__":
    if len(sys.argv) >= 3 and sys.argv[1] == "todas":
        for k in range(12):
            im = imagen(k)
            if im:
                im.save(os.path.join(sys.argv[2], "escena_%02d.png" % k))
                print("escena", k, im.size)
            else:
                print("escena", k, "sin dibujo (p04:72C6)")
    else:
        sys.exit("uso: escenas.py todas <dir>")
