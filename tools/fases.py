#!/usr/bin/env python3
"""Las fases de The Treasure of Usas, montadas desde la ROM como las monta el juego.

Variables (las pone p00:5F6E): 0xC21D es la ruina (0-4) y 0xC211 la fase,
contada desde 1 (ruina * 5 + 1 es la primera de cada ruina); 0xC212 es la
pantalla dentro de la fase, desde 1.

La entrada a una fase es p00:5E36. Lo que dibuja, en su orden:

  p00:51C5  trio 13-14-15, lista p15:BB95 con los colores de p15:BB71
  p00:517C  trio 7-8-9: dos fichas de 2 bits de p08:89F9 a 0x8040 y 0x8048
            con los colores [4,5,15,3] (p00:518E) y la lista de la ruina:
            p07:6000 + 4 * ruina = [tabla de colores][lista] (p00:5286)
  p00:53C7  la paleta: p06:B335 y luego p06:B2DB[ruina] (L_4A9D)
  p00:5372  trio 10-11-12, lista p12:ADE3 con los colores de p12:ADCB
  p00:53BB  trio 10-11-12, lista p12:AF81 con los colores de p12:AF6B
  p00:53AF  trio 4-5-6, lista p06:AF78 con los colores de p06:AF6C
  p00:5A38  trio 7-8-9, lista p09:BB32[0xC240] con los colores de p09:BB15
  p00:5533  metabloques: RLE de p10:6032[ruina] a 0xE400 (16 bytes cada uno)
  p00:5516  mapa: RLE de p10:5FFE[fase] a 0xEC00 (48 bytes por pantalla)

Una pantalla (p15:BEBF) son 6 filas de 8 metabloques; cada metabloque, 4 x 4
numeros de ficha, que van a un mapa de 32 x 24 fichas en 0xD200. p00:5A1A
lo pinta con L_4DB4: la ficha t sale de la pagina 1 en X = (t & 31) * 8,
Y = (t >> 5) * 8 (L_4E2B) y va a la pagina 0 a partir de la linea 20.

Con 0xC20A distinto de cero (lo pone p00:5F18 si 0xCC10 vale 2) se cargan
otras cosas (p00:51D4, p00:552B, p00:5548): aqui no se dibujan todavia.
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import (leer, palabra, tabla, rle, T456, T789, T101112,   # noqa: E402
                 T131415)
from vram import VRAM                                            # noqa: E402

N_RUINAS = 5
N_FASES = 25
ALTO_PANTALLA = 6 * 32
ANCHO_PANTALLA = 8 * 32


def vram_de_ruina(ruina, c240=0):
    v = VRAM()
    v.lista(T131415, 0xBB95, 0xBB71)                     # p00:51C5
    for d in (0x8040, 0x8048):                          # p00:518E
        v.fichas_2bits(T789, 0x89F9, d, 2, [4, 5, 15, 3])
    colores = palabra(T789, 0x6000 + 4 * ruina)         # p00:5286
    lista = palabra(T789, 0x6000 + 4 * ruina + 2)
    v.lista(T789, lista, colores)
    v.paleta(T456, 0xB335)                              # p00:53DE
    v.paleta(T456, tabla(T456, 0xB2DB, ruina))          # p00:53D3
    v.lista(T101112, 0xADE3, 0xADCB)                    # p00:5372
    v.lista(T101112, 0xAF81, 0xAF6B)                    # p00:53BB
    v.lista(T456, 0xAF78, 0xAF6C)                       # p00:53AF
    v.lista(T789, tabla(T789, 0xBB32, c240), 0xBB15)     # p00:5A38
    return v


def vram_de_sala5(ruina, c240=0):
    """La entrada a la fase con 0xC20A puesto (la puerta de la pantalla 2
    de la antesala, p00:5F18): p00:517C salta a p00:51D4 en vez de cargar la
    lista de la ruina, y p00:53C7 pone p06:B35C[ruina] en vez de B2DB."""
    v = VRAM()
    v.lista(T131415, 0xBB95, 0xBB71)                     # p00:51C5
    v.lista(T789, 0x8A35, 0x8A19)                        # p00:51D4
    v.paleta(T456, 0xB335)                              # p00:53DE
    v.paleta(T456, tabla(T456, 0xB35C, ruina))          # p00:53F2
    v.lista(T101112, 0xADE3, 0xADCB)                    # p00:5372
    v.lista(T101112, 0xAF81, 0xAF6B)                    # p00:53BB
    v.lista(T456, 0xAF78, 0xAF6C)                       # p00:53AF
    v.lista(T789, tabla(T789, 0xBB32, c240), 0xBB15)     # p00:5A38
    return v


def vram_de_antesala(ruina):
    """p01:60ED: la antesala de la ruina (0xCC10 es su pantalla, 0-2)."""
    v = VRAM()
    v.lista(T789, tabla(T789, 0x60B0, ruina), 0x6064)    # p00:5155
    v.lista(T101112, 0xA7AA, 0xA7A4)
    v.paleta(T456, 0xB271)                              # p00:540D
    v.paleta(T456, tabla(T456, 0xB281, ruina))
    return v


def metabloques_sala5():
    """p00:5548: los metabloques de la sala de la puerta 5 (p12:AB66)."""
    datos, _ = rle(T101112, 0xAB66)
    return [datos[i:i + 16] for i in range(0, len(datos), 16)]


def mapa_sala5():
    """p00:552B: una pantalla (p12:AB39)."""
    datos, _ = rle(T101112, 0xAB39)
    return [datos[i:i + 48] for i in range(0, len(datos), 48)]


def metabloques_antesala(ruina):
    """p00:5566: RLE de p11:88CB[ruina] a 0xE400."""
    datos, _ = rle(T101112, tabla(T101112, 0x88CB, ruina))
    return [datos[i:i + 16] for i in range(0, len(datos), 16)]


def mapa_antesala(ruina):
    """p00:5554: RLE de p10:603C[ruina] a 0xEC00: tres pantallas en fila
    (p06:B8FB pasa de una a otra con 0xCC10 +-1 por los bordes)."""
    datos, _ = rle(T101112, tabla(T101112, 0x603C, ruina))
    return [datos[i:i + 48] for i in range(0, len(datos), 48)]


def metabloques(ruina):
    """p00:5533: los metabloques de la ruina (16 fichas cada uno)."""
    datos, _ = rle(T101112, tabla(T101112, 0x6032, ruina))
    return [datos[i:i + 16] for i in range(0, len(datos), 16)]


def mapa(fase):
    """p00:5516: el mapa de la fase (fase desde 1): pantallas de 8 x 6."""
    datos, _ = rle(T101112, tabla(T101112, 0x5FFE, fase))
    return [datos[i:i + 48] for i in range(0, len(datos), 48)]


def fichas_de_pantalla(pantalla, metas):
    """p15:BEBF: 32 x 24 numeros de ficha."""
    out = [[0] * 32 for _ in range(24)]
    for fy in range(6):
        for fx in range(8):
            m = metas[pantalla[fy * 8 + fx]]
            for j in range(4):
                for i in range(4):
                    out[fy * 4 + j][fx * 4 + i] = m[j * 4 + i]
    return out


LADOS = ("arriba", "abajo", "izquierda", "derecha")
PASO = {0: (0, -1), 1: (0, 1), 2: (-1, 0), 3: (1, 0)}


def vecinas(fase):
    """p09:B8E9: 2 bytes por pantalla en p09:B921[fase], cuatro nibbles.

    El orden sale de p06:B66A, que pone 0xC215 al salir por un borde: Y <
    0x20 -> 1, Y >= 0xD4 -> 2, X < 0x0E -> 3, X >= 0xF2 -> 4; p09:B8CC lee
    el nibble 0xC215 (el alto del primer byte es el 1). 0xF (0xFF en RAM)
    es que no hay salida; 0 pone 0xC226 (se sale de la fase).
    Devuelve, por pantalla (desde 1), [arriba, abajo, izquierda, derecha]
    con None donde no hay salida.
    """
    t = tabla(T789, 0xB921, fase)
    out = []
    for p in range(len(mapa(fase))):
        b0, b1 = leer(T789, t + 2 * p), leer(T789, t + 2 * p + 1)
        ns = [b0 >> 4, b0 & 15, b1 >> 4, b1 & 15]
        out.append([None if n == 15 else n for n in ns])
    return out


def disposicion(fase):
    """Coloca las pantallas en una rejilla siguiendo las vecinas desde la 1.

    Devuelve ({pantalla: (x, y)}, problemas): un problema es una salida que
    no vuelve (A sale por la derecha a B y B no sale por la izquierda a A)
    o dos pantallas en la misma casilla.
    """
    v = vecinas(fase)
    pos = {1: (0, 0)}
    cola = [1]
    problemas = []
    while cola:
        p = cola.pop(0)
        for lado, n in enumerate(v[p - 1]):
            if not n:
                continue
            dx, dy = PASO[lado]
            q = (pos[p][0] + dx, pos[p][1] + dy)
            vuelta = v[n - 1][lado ^ 1]
            if vuelta != p:
                problemas.append("%d -%s-> %d no vuelve (%s)" % (p, LADOS[lado], n, vuelta))
            if n in pos:
                if pos[n] != q:
                    problemas.append("%d en %s y en %s" % (n, pos[n], q))
                continue
            pos[n] = q
            cola.append(n)
    ocupadas = {}
    for n, q in pos.items():
        if q in ocupadas:
            problemas.append("%d y %d en la misma casilla %s" % (ocupadas[q], n, q))
        ocupadas[q] = n
    sueltas = [n for n in range(1, len(v) + 1) if n not in pos]
    if sueltas:
        problemas.append("sin colocar: %s" % sueltas)
    return pos, problemas


def pixeles_de_ficha(v, t):
    sx, sy = (t & 31) * 8, (t >> 5) * 8
    return [[v.punto(1, sx + i, sy + j) for i in range(8)] for j in range(8)]


def imagen_de_fase(fase, hueco=4):
    """Las pantallas de la fase colocadas por sus vecinas (disposicion)."""
    from PIL import Image
    ruina = (fase - 1) // 5
    v = vram_de_ruina(ruina)
    metas = metabloques(ruina)
    pantallas = mapa(fase)
    pos, _ = disposicion(fase)
    x0 = min(x for x, _ in pos.values())
    y0 = min(y for _, y in pos.values())
    w = max(x for x, _ in pos.values()) - x0 + 1
    h = max(y for _, y in pos.values()) - y0 + 1
    img = Image.new("RGB", (w * (ANCHO_PANTALLA + hueco) - hueco,
                            h * (ALTO_PANTALLA + hueco) - hueco), (24, 24, 24))
    cache = {}
    for n, (px, py) in pos.items():
        ox = (px - x0) * (ANCHO_PANTALLA + hueco)
        oy = (py - y0) * (ALTO_PANTALLA + hueco)
        fichas = fichas_de_pantalla(pantallas[n - 1], metas)
        for fy in range(24):
            for fx in range(32):
                t = fichas[fy][fx]
                if t not in cache:
                    cache[t] = [[v.rgb(c) for c in fila] for fila in pixeles_de_ficha(v, t)]
                for j in range(8):
                    for i in range(8):
                        img.putpixel((ox + fx * 8 + i, oy + fy * 8 + j), cache[t][j][i])
    return img


def imagen_de_pantallas(v, metas, pantallas, hueco=4):
    """Pantallas en fila (antesala, sala 5)."""
    from PIL import Image
    img = Image.new("RGB", (len(pantallas) * (ANCHO_PANTALLA + hueco) - hueco,
                            ALTO_PANTALLA), (24, 24, 24))
    for k, p in enumerate(pantallas):
        fichas = fichas_de_pantalla(p, metas)
        for fy in range(24):
            for fx in range(32):
                pix = pixeles_de_ficha(v, fichas[fy][fx])
                for j in range(8):
                    for i in range(8):
                        img.putpixel((k * (ANCHO_PANTALLA + hueco) + fx * 8 + i,
                                      fy * 8 + j), v.rgb(pix[j][i]))
    return img


def pinta_pantalla(v, pantalla, metas):
    """p15:BEBF + p00:5A1A: la pantalla en la pagina 0, desde la linea 20."""
    fichas = fichas_de_pantalla(pantalla, metas)
    for fy in range(24):
        for fx in range(32):
            v.ficha(fichas[fy][fx], fx * 8, 20 + fy * 8, 0)


def bloque_de_fichas(v, trio, a, filas, columnas, dx, dy):
    """p06:BA24 con 0xC20B = 1: fichas de la pagina 1 a la pagina 1."""
    for j in range(filas):
        for i in range(columnas):
            v.ficha(leer(trio, a + j * columnas + i), dx + i * 8, dy + j * 8, 1)


def puertas_de_antesala(ruina):
    """p06:B870: hasta cinco puertas de p06:BE3D[ruina * 6], hasta 0xFF; cada
    byte: bit 0 = puerta grande, el resto = X. Dos por pantalla (0xCC10 * 2)."""
    out = []
    a = 0xBE3D + 6 * ruina
    while leer(T456, a) != 0xFF:
        c = leer(T456, a)
        out.append((c & 1, c & 0xFE))
        a += 1
    return out


def pinta_puertas(v, pantalla, puertas):
    """p06:B9D8 compone los marcos en la pagina 1 y p06:B95F los pega
    (L_4C73, TIMP) en la pagina 0; con la puerta cerrada (estado 0) se
    pega ademas la hoja de p06:BD99 o BDCF (p06:B97B)."""
    if pantalla != 2:
        bloque_de_fichas(v, T456, 0xBD80, 5, 5, 0x10, 0x68)
        bloque_de_fichas(v, T456, 0xBD99, 4, 3, 0x40, 0x68)
    else:
        bloque_de_fichas(v, T456, 0xBDA5, 7, 6, 0x10, 0x68)
        bloque_de_fichas(v, T456, 0xBDCF, 4, 3, 0x40, 0x68)
    bloque_de_fichas(v, T456, 0xBDDB, 2, 4, 0x40, 0x88)
    for k in (2 * pantalla, 2 * pantalla + 1):
        if k >= len(puertas) or (pantalla == 2 and k > 2 * pantalla):
            continue
        grande, x = puertas[k]
        if grande:
            v.timp(0x10, 0x68, 1, x, 0x8B, 0, 0x30, 0x38)
            v.timp(0x40, 0x68, 1, x + 0x0C, 0xA3, 0, 0x18, 0x20)
        else:
            v.timp(0x10, 0x68, 1, x, 0x9B, 0, 0x28, 0x28)
            v.timp(0x40, 0x68, 1, x + 0x08, 0xA3, 0, 0x18, 0x20)


def imagen_de_antesala(ruina, hueco=4):
    from PIL import Image
    metas = metabloques_antesala(ruina)
    pantallas = mapa_antesala(ruina)
    puertas = puertas_de_antesala(ruina)
    img = Image.new("RGB", (len(pantallas) * (ANCHO_PANTALLA + hueco) - hueco,
                            ALTO_PANTALLA), (24, 24, 24))
    for k, p in enumerate(pantallas):
        v = vram_de_antesala(ruina)
        pinta_pantalla(v, p, metas)
        pinta_puertas(v, k, puertas)
        for y in range(ALTO_PANTALLA):
            for x in range(ANCHO_PANTALLA):
                img.putpixel((k * (ANCHO_PANTALLA + hueco) + x, y),
                             v.rgb(v.punto(0, x, 20 + y)))
    return img


def imagen_de_pagina1(ruina):
    from PIL import Image
    v = vram_de_ruina(ruina)
    img = Image.new("RGB", (256, 256))
    for y in range(256):
        for x in range(256):
            img.putpixel((x, y), v.rgb(v.punto(1, x, y)))
    return img


def main(argv):
    if len(argv) >= 4 and argv[1] == "fase":
        imagen_de_fase(int(argv[2])).save(argv[3])
    elif len(argv) >= 4 and argv[1] == "antesala":
        r = int(argv[2])
        imagen_de_antesala(r).save(argv[3])
    elif len(argv) >= 4 and argv[1] == "sala5":
        r = int(argv[2])
        imagen_de_pantallas(vram_de_sala5(r), metabloques_sala5(),
                            mapa_sala5()).save(argv[3])
    elif len(argv) >= 4 and argv[1] == "pagina1":
        imagen_de_pagina1(int(argv[2])).save(argv[3])
    elif len(argv) >= 2 and argv[1] == "resumen":
        for f in range(1, N_FASES + 1):
            pos, prob = disposicion(f)
            xs = [x for x, _ in pos.values()]
            ys = [y for _, y in pos.values()]
            print("fase %2d  ruina %d  %2d pantallas  %dx%d  %s" % (
                f, (f - 1) // 5, len(mapa(f)), max(xs) - min(xs) + 1,
                max(ys) - min(ys) + 1, "; ".join(prob) or "ok"))
    else:
        sys.exit("uso: fases.py fase <n> <png> | pagina1 <ruina> <png> | resumen")


if __name__ == "__main__":
    main(sys.argv)
