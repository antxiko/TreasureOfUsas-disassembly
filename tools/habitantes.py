#!/usr/bin/env python3
"""Las fases con lo que hay en cada pantalla al entrar, colocado como lo
coloca el cartucho.

LOS ACTORES DE 0xC400: p09:B12B[fase - 1], registros [pantalla][tipo][a][b]
(p02:87B6). La clase del tipo es p09:B70D[tipo - 1]:
  0    no se crea desde aqui (los jefes 0x1E-0x21)
  1    se crea ya (p02:87EC) en X = (a & 0xF0) + 8, Y = (a & 0x0F) * 16 + 0x14
  2, 3 espera en 0xCC40 [a = X][b = Y][tipo][clase] (p02:881C) y deja en la
       pagina 0 su nido (p02:887F; los tipos 2 y 0x14 no lo tienen):
       clase 3, 3 tiras de 16 x 8 de la pagina 1 desde (0xB0, 0x38), una
       debajo de otra, en (X - 8, Y - 4); clase 2, 4 tiras de 24 x 8 desde
       (0x20, 0x38) en (X - 12, Y - 12). Las dos con TIMP.
La paleta de cada tipo de la pantalla se pone encima de la de la fase
(p02:8267): cambia la pantalla entera.

LAS TRAMPAS DE 0xCD00: p15:A4F9[fase][pantalla - 1] (enemigos.registros),
compuestas como en tools/enemigos.py; el 8 es un dibujo de 16 x 16 de la
pagina 1 desde (0, 0x78) en (X, Y) (p01:77F9) y el 9 una fila de 8 fichas
desde (0xA8, 0x58) (p01:7832); el 10 no pinta nada al crearse.

LOS OBJETOS: p12:B8BB[fase - 1], registros [pantalla][YX][clase] hasta 0xFF
(p02:9120): X = (YX & 0xF0) + 8, Y = (YX & 0x0F) * 16 + 0x24 (p02:9148); el
dibujo de 16 x 16 de p03:A81D[clase - 1] en (X - 8, Y - 16) (p03:A80A).

EL JEFE: en la pantalla p15:BE8E[fase], el tipo de p09:BED3 en su [X][Y]
(p02:8F16, p03:A9C0).

La pantalla esta en la pagina 0 desde la linea 20 (tools/fases.py): lo de la
pagina 0 va en y - 20 y los sprites, que el VDP pinta una linea por debajo
de su Y, en Y + 1 - 20. De los sprites se pinta el primer fotograma de
actores.ANIMACION (y el 0 de las trampas): el de entrar no esta medido.

Uso: habitantes.py <fase> <png>
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import leer, palabra, T123, T789, T101112, T131415   # noqa: E402
import fases                                                 # noqa: E402
import actores                                               # noqa: E402
import enemigos                                              # noqa: E402

CLASE = 0xB70D           # p09
OBJETOS = 0xB8BB         # p12
DIBUJO_OBJETO = 0xA81D   # p03
SALA_FINAL = 0xBE8E      # p15
JEFE = 0xBED3            # p09
SIN_NIDO = (2, 0x14)
LINEA0 = 20


def registros_actores(fase):
    a = palabra(T789, actores.POR_FASE + 2 * (fase - 1))
    out = []
    if 0xA000 <= a < 0xC000:
        while leer(T789, a) != 0xFF:
            out.append(tuple(leer(T789, a + k) for k in range(4)))
            a += 4
    return out


def trampas(fase, pantalla):
    t = palabra(T131415, enemigos.POR_FASE + 2 * fase)
    if not t:
        return []
    lista = palabra(T131415, t + 2 * (pantalla - 1))
    if not 0xA000 <= lista < 0xC000:
        return []
    return [r for r in enemigos.registros(lista) if r[0] != 2]


def objetos(fase):
    a = palabra(T101112, OBJETOS + 2 * (fase - 1))
    out = []
    if a:
        for _ in range(0x80):
            if leer(T101112, a) == 0xFF:
                break
            out.append(tuple(leer(T101112, a + k) for k in range(3)))
            a += 3
    return out


def jefe(fase):
    x, y, tipo = (leer(T789, JEFE + 3 * (fase - 1) + k) for k in range(3))
    return (leer(T131415, SALA_FINAL + fase - 1), tipo, x, y) if tipo else None


def copia_timp(img, v, sx, sy, dx, dy, ancho, alto, pal):
    for j in range(alto):
        for i in range(ancho):
            c = v.punto(1, sx + i, sy + j)
            q = (dx + i, dy + j - LINEA0)
            if c and 0 <= q[0] < 256 and 0 <= q[1] < img.height:
                img.putpixel(q, pal[c])


def pantalla(fase, n, v, metas, pantallas, regs, objs):
    from PIL import Image
    pal_v = list(v.pal)
    aqui = [r for r in regs if r[0] == n]
    for _, tipo, _, _ in aqui:                    # p02:8267
        k = leer(T789, actores.PALETA_TIPO + tipo - 1)
        if k:
            v.paleta(T789, palabra(T789, actores.PALETAS + 2 * (k - 1)))
    pal = {c: v.rgb(c) for c in range(16)}
    img = Image.new("RGB", (fases.ANCHO_PANTALLA, fases.ALTO_PANTALLA))
    fichas = fases.fichas_de_pantalla(pantallas[n - 1], metas)
    for fy in range(24):
        for fx in range(32):
            pix = fases.pixeles_de_ficha(v, fichas[fy][fx])
            for j in range(8):
                for i in range(8):
                    img.putpixel((fx * 8 + i, fy * 8 + j), pal[pix[j][i]])
    sprites = []
    for _, tipo, a, b in aqui:
        clase = leer(T789, CLASE + tipo - 1)
        if clase == 1:
            sprites.append((tipo, (a & 0xF0) + 8, (a & 0x0F) * 16 + 0x14))
        elif clase == 3 and tipo not in SIN_NIDO:
            for k in range(3):
                copia_timp(img, v, 0xB0 + 16 * k, 0x38, a - 8, b - 4 + 8 * k, 16, 8, pal)
        elif clase == 2 and tipo not in SIN_NIDO:
            for k in range(4):
                copia_timp(img, v, 0x20 + 24 * k, 0x38, a - 12, b - 12 + 8 * k, 24, 8, pal)
    for p, yx, clase in objs:
        if p != n or clase == 6:                  # la 6 no tiene dibujo cargado
            continue
        o = palabra(T123, DIBUJO_OBJETO + 2 * (clase - 1))
        copia_timp(img, v, o >> 8, o & 0xFF, yx & 0xF0, (yx & 0x0F) * 16 + 0x14, 16, 16, pal)
    for tipo, y, x in trampas(fase, n):
        if tipo == 8:                             # p01:77F9: 16 x 16 de (0, 0x78)
            copia_timp(img, v, 0, 0x78, x, y, 16, 16, pal)
            continue
        if tipo == 9:                             # p01:7832: 8 fichas de (0xA8, 0x58)
            for k in range(8):
                for j in range(8):
                    for i in range(8):
                        q = (x + 8 * k + i, y + j - LINEA0)
                        if 0 <= q[0] < 256 and 0 <= q[1] < img.height:
                            img.putpixel(q, pal[v.punto(1, 0xA8 + i, 0x58 + j)])
            continue
        if tipo == 10:                            # sin patrones ni dibujo al crearse
            continue
        vram = {}
        if tipo not in enemigos.SIN_PATRONES:
            enemigos.patrones_vram(tipo, vram)
        enemigos.pinta(img, vram, enemigos.fotograma(tipo, 0), x, y + 1 - LINEA0, pal)
    j = jefe(fase)
    if j and j[0] == n:
        sprites.append(j[1:])
    for tipo, x, y in sprites:
        if tipo not in actores.ANIMACION:
            continue
        k = leer(T789, actores.PALETA_TIPO + tipo - 1)
        pt = pal
        if k:
            v2 = fases.vram_de_ruina((fase - 1) // 5)
            v2.pal = list(v.pal)
            v2.paleta(T789, palabra(T789, actores.PALETAS + 2 * (k - 1)))
            pt = {c: v2.rgb(c) for c in range(16)}
        actores.pinta(img, tipo, actores.ANIMACION[tipo][0][0], x, y + 1 - LINEA0,
                      actores.patrones(tipo), actores.colores(tipo), pt)
    v.pal = pal_v
    return img


def imagen(fase, hueco=4):
    from PIL import Image
    ruina = (fase - 1) // 5
    v = fases.vram_de_ruina(ruina)
    metas = fases.metabloques(ruina)
    pantallas = fases.mapa(fase)
    pos, _ = fases.disposicion(fase)
    x0 = min(x for x, _ in pos.values())
    y0 = min(y for _, y in pos.values())
    w = max(x for x, _ in pos.values()) - x0 + 1
    h = max(y for _, y in pos.values()) - y0 + 1
    A, H = fases.ANCHO_PANTALLA, fases.ALTO_PANTALLA
    img = Image.new("RGB", (w * (A + hueco) - hueco, h * (H + hueco) - hueco), (24, 24, 24))
    regs, objs = registros_actores(fase), objetos(fase)
    for n, (px, py) in pos.items():
        img.paste(pantalla(fase, n, v, metas, pantallas, regs, objs),
                  ((px - x0) * (A + hueco), (py - y0) * (H + hueco)))
    return img


if __name__ == "__main__":
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    imagen(int(sys.argv[1])).save(sys.argv[2])
