#!/usr/bin/env python3
"""Los enemigos de pantalla (los 9 actores de 0xCD00, tipos 1-13), como los
compone el cartucho.

DONDE SALEN: p15:A4F9[fase][pantalla - 1] (p01:774B): [n] y n x [tipo][Y][X]
y los bytes que lee el manejador del tipo (p01:779D, EXTRA); el tipo 2 va
sin Y ni X (p01:7784).

LOS PATRONES (p01:7779 -> p00:538C): p15:ADDA[tipo] apunta a [direccion de
VRAM] y un RLE (p00:4926): 0 acaba, n < 0x80 repite el siguiente, 0x80 trae
otra direccion y detras un RLE de sprites que se escribe VOLTEADO
(p00:494F -> p00:4955), si no copia n & 0x7F. Los tipos 8, 9 y 10 no cargan
patrones propios (p00:538C). Los patrones de sprite estan en 0xF800: el
patron p es 0xF800 + p * 8 (p00:5633).

LAS PIEZAS: el fotograma (ix+0x10) es p15:B57E[tipo][(ix+0x10)] (p01:76FC):
[n] y n x [patron][color], que van a la ficha del actor (0x21 + 5k:
[hueco][Y][X][patron][color]). La posicion de cada pieza es la del actor mas
[dy][dx] de la tabla de su tipo (p01:78E5): 7 p15:B6EE, 4 p15:B6E6, 2
p15:B6D2, 8 p15:B6E2 y los demas p15:B6EA. Cada pieza es un sprite de
16 x 16 y su color llena sus 16 lineas (p02:8AD4, si (ix+1) no tiene el bit
7); el bit 6 del color es el CC: OR con el sprite anterior.

Uso: enemigos.py hoja <png>
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import leer, palabra, T131415   # noqa: E402
import fases                             # noqa: E402

T = T131415
POR_FASE = 0xA4F9
PATRONES = 0xADDA
FOTOGRAMAS = 0xB57E
TIPOS = range(1, 14)
SIN_PATRONES = (8, 9, 10)
# los bytes de la lista detras de [tipo][Y][X], segun el manejador de
# p01:779D: 77BE lee 1 (0x11), 77B8 1 (0x17), 77C4 2 (0x17, 0x15), 77CD 5,
# 782F 1 (0x17); 77BD y 77E3 ninguno. El 2 no lleva ni Y ni X.
EXTRA = {1: 1, 2: -2, 3: 1, 4: 2, 5: 2, 6: 0, 7: 1, 8: 0, 9: 1, 10: 0, 11: 5, 12: 0}


def registros(lista):
    """[(tipo, Y, X)] de una lista de p15:A4F9 (el tipo 2 con Y y X None)."""
    out, a = [], lista + 1
    for _ in range(leer(T, lista)):
        tipo = leer(T, a)
        if tipo == 2:
            out.append((2, None, None))
        else:
            out.append((tipo, leer(T, a + 1), leer(T, a + 2)))
        a += 3 + EXTRA[tipo]
    return out
ESCALA = 3


def desplazamientos(tipo):
    return {7: 0xB6EE, 4: 0xB6E6, 2: 0xB6D2, 8: 0xB6E2}.get(tipo, 0xB6EA)


def rle49ce(a):
    """p00:49CE: 0 acaba, n < 0x80 repite el siguiente, si no copia n & 0x7F."""
    out = bytearray()
    while True:
        n = leer(T, a)
        a += 1
        if n == 0:
            return bytes(out), a
        if n < 0x80:
            out += bytes([leer(T, a)]) * n
            a += 1
        else:
            out += bytes(leer(T, a + i) for i in range(n & 0x7F))
            a += n & 0x7F


def voltea(datos):
    """p00:496C: cada sprite de 16 x 16, bits al reves y mitades cambiadas."""
    out = bytearray()
    for k in range(len(datos) // 32):
        s = datos[k * 32:(k + 1) * 32]
        inv = bytes(int("{:08b}".format(b)[::-1], 2) for b in s)
        out += inv[16:] + inv[:16]
    return bytes(out)


def patrones_vram(tipo, vram):
    """p00:4926: escribe en vram (dict direccion -> byte) los patrones del tipo."""
    a = palabra(T, PATRONES + 2 * tipo)
    d = palabra(T, a)
    a += 2
    while True:
        n = leer(T, a)
        a += 1
        if n == 0:
            return
        if n < 0x80:
            for _ in range(n):
                vram[d] = leer(T, a)
                d += 1
            a += 1
        elif n == 0x80:
            d = palabra(T, a)
            datos, _ = rle49ce(a + 2)
            for i, b in enumerate(voltea(datos)):
                vram[d + i] = b
            return
        else:
            for i in range(n & 0x7F):
                vram[d] = leer(T, a + i)
                d += 1
            a += n & 0x7F


def ventanas():
    """Cada tipo lee su fotograma desde p15:B57E[tipo]; cuantos tiene, hasta
    la ventana del siguiente (en orden de direccion)."""
    ini = {t: palabra(T, FOTOGRAMAS + 2 * t) for t in TIPOS}
    orden = sorted(set(ini.values()))
    fin = {}
    for t in TIPOS:
        k = orden.index(ini[t])
        sig = orden[k + 1] if k + 1 < len(orden) else 0xB5CA
        fin[t] = (sig - ini[t]) // 2
    return ini, fin


def fotograma(tipo, f):
    ini, _ = ventanas()
    lista = palabra(T, ini[tipo] + 2 * f)
    n = leer(T, lista)
    off = desplazamientos(tipo)
    piezas = []
    for k in range(n):
        pat, color = leer(T, lista + 1 + 2 * k), leer(T, lista + 2 + 2 * k)
        dy, dx = leer(T, off + 2 * k), leer(T, off + 2 * k + 1)
        piezas.append((con_signo(dy), con_signo(dx), pat, color))
    return piezas


def con_signo(b):
    return b - 256 if b >= 0x80 else b


def ruina_de(tipo):
    """La primera fase (1-25) en la que sale el tipo: su ruina da la paleta."""
    for fase in range(1, 26):
        t = palabra(T, POR_FASE + 2 * fase)
        if not t:
            continue
        for pant in range(48):
            lista = palabra(T, t + 2 * pant)
            if not (0xA000 <= lista < 0xC000):
                break
            if any(r[0] == tipo for r in registros(lista)):
                return (fase - 1) // 5
    return 0


def pinta(img, vram, piezas, cx, cy, pal):
    mezcla = {}
    # en orden de sprite: el de menor numero tapa; el bit CC hace OR (como actores.py)
    for dy, dx, pat, color in piezas:
        base = 0xF800 + pat * 8
        for y in range(16):
            for x in range(16):
                b = vram.get(base + (16 if x >= 8 else 0) + y, 0)
                if b & (0x80 >> (x & 7)):
                    q = (cx + dx + x, cy + dy + y)
                    if 0 <= q[0] < img.width and 0 <= q[1] < img.height:
                        if color & 0x40:
                            c = (color & 0x0F) | mezcla.get(q, 0)
                        elif q in mezcla:
                            continue
                        else:
                            c = color & 0x0F
                        mezcla[q] = c
                        img.putpixel(q, pal[c])


def hoja(ruta):
    from PIL import Image
    ini, cuantos = ventanas()
    ancho = max(cuantos.values())
    celda = 72
    img = Image.new("RGB", (ancho * celda + 8, len(TIPOS) * celda + 8), (24, 24, 24))
    for fila, tipo in enumerate(TIPOS):
        vram = {}
        if tipo not in SIN_PATRONES:
            patrones_vram(tipo, vram)
        v = fases.vram_de_ruina(ruina_de(tipo))
        pal = {c: v.rgb(c) for c in range(16)}
        for f in range(cuantos[tipo]):
            pinta(img, vram, fotograma(tipo, f), 4 + f * celda + 24, 4 + fila * celda + 36, pal)
    img.resize((img.width * ESCALA, img.height * ESCALA), Image.NEAREST).save(ruta)


if __name__ == "__main__":
    if len(sys.argv) >= 3 and sys.argv[1] == "hoja":
        hoja(sys.argv[2])
    else:
        sys.exit("uso: enemigos.py hoja <png>")
