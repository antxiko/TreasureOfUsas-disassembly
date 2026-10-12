#!/usr/bin/env python3
"""Los actores de 0xC400 (enemigos y jefes, 63 tipos) compuestos como el cartucho.

DONDE SALEN: p09:B12B[fase - 1]: registros [pantalla][tipo][a][b] hasta 0xFF
(p02:8249 y p02:825F).

LOS PATRONES: juego_de_sprites(tipo) (p00:55F0): el registro p08:9338[tipo - 1]
([patron volteado][origen][patron tal cual], p00:5612) y, si no es cero, el
que lo acompana, p08:9410[tipo - 1]. El origen es un RLE (p00:49CE); el
volteado se voltea sprite a sprite (p00:496C). El patron p esta en 0xF800 +
p * 8 (p00:5633).

LAS PIEZAS: cuantas, p06:B62A[tipo] (p02:8641); su color, la lista
p06:B5A8[p06:B569[tipo - 1]], un byte por pieza (p02:8769). El fotograma
(ix+0x10) es p15:B744[f] (p02:8A42): n x [dy][dx][patron], o un primer byte
0x80-0x84 que elige la plantilla de desplazamientos p15:B6FE[b - 0x80] y
detras un patron por pieza. Cada pieza es un sprite de 16 x 16 en (Y + dy,
X + dx) con su color en las 16 lineas (p02:8AD4); el bit 6 del color es el
CC: OR con el sprite anterior.

LA PALETA: la de la fase (tools/fases.py) y encima la del tipo,
p09:B781[p09:B74A[tipo - 1] - 1] si no es cero (p02:827F).

LA ANIMACION de cada tipo la escribe su manejador (p02:82E9[tipo - 1]) en
(ix+0x10); va en ANIMACION, leida en el codigo, con su sitio.

Uso: actores.py anima <gif>
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import leer, palabra, T456, T789, T131415   # noqa: E402
import fases                                         # noqa: E402

JUEGOS, ACOMPANA = 0x9338, 0x9410    # p08
PIEZAS = 0xB62A                      # p06
INDICE_COLORES, COLORES = 0xB569, 0xB5A8   # p06
FOTOGRAMAS, PLANTILLAS = 0xB744, 0xB6FE    # p15
PALETA_TIPO, PALETAS = 0xB74A, 0xB781      # p09
POR_FASE = 0xB12B                          # p09

# tipo: (fotogramas en orden, cuadros del juego por fotograma, de donde sale)
ANIMACION = {
    1: ((8, 9, 10, 9), 8,
        "p02:92DF: 8 + ((0xC00D & 0x18) >> 3), con el 3 hecho 1"),
    2: ((0x1A,), 1, "p02:9790 y p02:97F8: 0x1A, o 0x19 segun (ix+0x17)"),
    4: ((0x31, 0x32), 2, "p02:9390: p02:9365[(ix+0x1F) * 3], + 1 si 0xC00D & 2"),
    5: ((0x37, 0x38), 16, "p02:95BE: 0x37, o 0x38 si 0xC00D & 0x10"),
    6: ((0x3E,), 1, "p02:96E9: 0x3E o 0x40 segun su sentido"),
    7: ((0x12, 0x13), 8, "p02:9DBC: alterna_fotograma con 0x12, cada 8 cuadros"),
    8: ((0x89, 0x8A), 8, "p02:9F53: 0x89/0x8A con el personaje a la derecha "
                          "(0x8B/0x8C si no), cada 8 cuadros"),
    9: ((0x41, 0x42), 8, "p02:99B3: alterna_fotograma con 0x41"),
    10: ((0x22,), 1, "p02:93FD: 0x22 o 0x23 segun el lado del personaje"),
    11: ((0x1D,), 1, "p02:952B: 0x1D, o 0x1F con el personaje a la derecha"),
    12: ((0x51,), 1, "p02:9FCB: 0x51 o 0x53 segun su sentido"),
    13: ((0, 1), 8, "p02:9BAB: alterna_fotograma con 0"),
    14: ((0x27, 0x28), 8, "p02:9B06: alterna_fotograma con 0x27"),
    15: ((0x79, 0x7A), 4, "p03:A0A5: alterna_79_7b, cada 4 cuadros"),
    # los jefes del final de las fases: los mismos cuatro en las cinco ruinas,
    # uno por fase, de p09:BED3 [X][Y][tipo] (los crea p03:A9C0 en la sala de
    # p15:BE8E[fase]); vida_por_ruina, p03:AB36, les suma ruina * 16
    30: ((0x45, 0x46), 8, "p03:ABF5: fotograma_45_46, 0x45 o 0x46 segun 0xC00D & 8"),
    31: ((0x47, 0x48), 8, "p03:AE4F: 0x47 o 0x48 segun 0xC00D & 8"),
    32: ((0x49,), 1, "p03:AED8: 0x49 (0x4B al saltar, p03:AFB9)"),
    33: ((0x4F,), 1, "p03:B08E: 0x4F, o 0x50 con el personaje a la derecha"),
}
ENEMIGOS = (1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
JEFES = (30, 31, 32, 33)


def rle49ce(trio, a):
    out = bytearray()
    while True:
        n = leer(trio, a)
        a += 1
        if n == 0:
            return bytes(out)
        if n < 0x80:
            out += bytes([leer(trio, a)]) * n
            a += 1
        else:
            out += bytes(leer(trio, a + i) for i in range(n & 0x7F))
            a += n & 0x7F


def voltea(d):
    out = bytearray()
    for k in range(len(d) // 32):
        s = d[k * 32:(k + 1) * 32]
        inv = bytes(int("{:08b}".format(b)[::-1], 2) for b in s)
        out += inv[16:] + inv[:16]
    return bytes(out)


def patrones(tipo):
    """{direccion: byte} tras p00:55F0 con A = tipo."""
    pat = {}
    for j in (leer(T789, ACOMPANA + tipo - 1), tipo):
        if not j:
            continue
        a = JUEGOS + 4 * (j - 1)
        vol, nor = leer(T789, a), leer(T789, a + 3)
        datos = rle49ce(T789, palabra(T789, a + 1))
        for i, b in enumerate(voltea(datos)):
            pat[0xF800 + vol * 8 + i] = b
        if nor:
            for i, b in enumerate(datos):
                pat[0xF800 + nor * 8 + i] = b
    return pat


def colores(tipo):
    lista = palabra(T456, COLORES + 2 * leer(T456, INDICE_COLORES + tipo - 1))
    return [leer(T456, lista + k) for k in range(leer(T456, PIEZAS + tipo))]


def con_signo(b):
    return b - 256 if b >= 0x80 else b


def piezas(tipo, f):
    n = leer(T456, PIEZAS + tipo)
    a = palabra(T131415, FOTOGRAMAS + 2 * f)
    b0 = leer(T131415, a)
    out = []
    if 0x80 <= b0 < 0x85:
        off = palabra(T131415, PLANTILLAS + 2 * (b0 - 0x80))
        for k in range(n):
            out.append((con_signo(leer(T131415, off + 2 * k)),
                        con_signo(leer(T131415, off + 2 * k + 1)),
                        leer(T131415, a + 1 + k)))
    else:
        for k in range(n):
            out.append((con_signo(leer(T131415, a + 3 * k)),
                        con_signo(leer(T131415, a + 3 * k + 1)),
                        leer(T131415, a + 3 * k + 2)))
    return out


def ruina_de(tipo):
    for fase in range(1, 26):
        a = palabra(T789, POR_FASE + 2 * (fase - 1))
        if not 0xA000 <= a < 0xC000:
            continue
        while leer(T789, a) != 0xFF:
            if leer(T789, a + 1) == tipo:
                return (fase - 1) // 5
            a += 4
    return 0


def paleta(tipo):
    v = fases.vram_de_ruina(ruina_de(tipo))
    k = leer(T789, PALETA_TIPO + tipo - 1)
    if k:
        v.paleta(T789, palabra(T789, PALETAS + 2 * (k - 1)))
    return {c: v.rgb(c) for c in range(16)}


def pinta(img, tipo, f, cx, cy, pat, cols, pal):
    mezcla = {}
    ps = piezas(tipo, f)
    # en orden de sprite: el de menor numero tapa a los demas, y el que lleva el
    # bit CC hace OR con lo que ya pusieron los de menor numero
    for k in range(len(ps)):
        dy, dx, p = ps[k]
        color = cols[k]
        base = 0xF800 + p * 8
        for y in range(16):
            for x in range(16):
                b = pat.get(base + (16 if x >= 8 else 0) + y, 0)
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


def anima(ruta, tipos=None, escala=3):
    """Un GIF con los tipos de ANIMACION; un cuadro del GIF = 2 del juego."""
    from math import lcm
    from PIL import Image
    # el tipo 3 no tiene piezas de sprite (p06:B62A[3] = 0)
    tipos = tipos or ENEMIGOS
    datos = {t: (patrones(t), colores(t), paleta(t)) for t in tipos}
    ciclo = 1
    for t in tipos:
        fr, n, _ = ANIMACION[t]
        ciclo = lcm(ciclo, len(fr) * n)
    celda, por_fila = 64, 5
    filas = (len(tipos) + por_fila - 1) // por_fila
    imgs = []
    for g in range(0, ciclo, 2):
        img = Image.new("RGB", (por_fila * celda, filas * celda), (24, 24, 24))
        for i, t in enumerate(tipos):
            fr, n, _ = ANIMACION[t]
            pat, cols, pal = datos[t]
            pinta(img, t, fr[(g // n) % len(fr)], (i % por_fila) * celda + celda // 2,
                  (i // por_fila + 1) * celda - 8, pat, cols, pal)
        imgs.append(img.resize((img.width * escala, img.height * escala), Image.NEAREST))
    imgs[0].save(ruta, save_all=True, append_images=imgs[1:],
                 duration=round(2 * 1000 / 60), loop=0)


if __name__ == "__main__":
    if len(sys.argv) >= 3 and sys.argv[1] == "anima":
        anima(sys.argv[2])
    elif len(sys.argv) >= 3 and sys.argv[1] == "jefes":
        anima(sys.argv[2], JEFES)
    else:
        sys.exit("uso: actores.py anima <gif> | jefes <gif>")
