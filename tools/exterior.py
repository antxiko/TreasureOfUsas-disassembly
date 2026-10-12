#!/usr/bin/env python3
"""El mapa de fuera: la pantalla que sale al llegar a las ruinas 1-4.

Estado 4, paso 1 (p00:4201-4214), en la ruina 1-4 tras la escena:
  p05:9665  la lista de fichas p05:9241 con los colores p05:9231
  p04:7390  la paleta p06:B3D4, el RLE p05:93C6 (10 x 10 fichas) pintado
            con TIMP en (0x5C, 0x48) y el texto p04:73BD ("M A P")
  p06:A249  la clave de la ruina, p06:A2B9[ruina]: [X] y letras hasta
            0xFF, a maquina en (X, 0xB0): la primera a los 0x3C cuadros,
            luego una cada 8 (p06:A28A)
Paso 2 (p00:421E): p05:966E, 0xAC cuadros; cada 16, la ficha 0x1B o 0x1A
alternas en (X, Y) de p05:96AB[ruina] (D = X, E = Y, p00:4DB4).

La fuente (p00:50C1) ya esta cargada: el caracter c sale de la pagina 1 en
((c & 31) * 8, (c >> 5) * 8 + 0x38) (p00:4D86).

Uso: exterior.py <png> <gif>
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import leer, palabra, rle, T456    # noqa: E402
from vram import VRAM                       # noqa: E402
import titulo                               # noqa: E402

X0, Y0, LADO = 0x5C, 0x48, 10               # p04:7399
POSICIONES = 0x96AB                         # p05
CLAVES = 0xA2B9                             # p06
ESCALA = 2


def letra(v, c, x, y):
    """p00:4D86: el caracter c de la fuente a (x, y) de la pagina 0 (HMMM)."""
    if c:
        sx, sy = (c & 31) * 8, (c >> 5) * 8 + 0x38
    else:
        sx, sy = 0, 0
    v.hmmm(sx, sy, 1, x, y, 0, 8, 8)


def texto(v, a):
    """p00:4D4A: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba."""
    x, y = leer(T456, a), leer(T456, a + 1)
    a += 2
    while True:
        c = leer(T456, a)
        a += 1
        if c == 0xFF:
            return
        if c == 0xFE:
            x, y = leer(T456, a), leer(T456, a + 1)
            a += 2
            continue
        letra(v, c, x, y)
        x += 8


def mapa():
    v = VRAM()
    titulo.fuente(v)
    v.lista(T456, 0x9241, 0x9231)
    # p06:B3D4 solo pone los colores 1-3; el 13 de las letras sigue siendo el
    # de la paleta base p06:B335 (p00:45D5): ninguna escena 0-9 lo cambia
    v.paleta(T456, 0xB335)
    v.paleta(T456, 0xB3D4)
    m, _ = rle(T456, 0x93C6)
    for f in range(LADO):
        for c in range(LADO):
            t = m[f * LADO + c]
            v.timp((t & 31) * 8, (t >> 5) * 8, 1, X0 + c * 8, Y0 + f * 8, 0, 8, 8)
    texto(v, 0x73BD)
    return v


def clave(ruina):
    """([X], letras) de p06:A2B9[ruina]."""
    a = palabra(T456, CLAVES + 2 * ruina)
    x, letras = leer(T456, a), []
    a += 1
    while leer(T456, a) != 0xFF:
        letras.append(leer(T456, a))
        a += 1
    return x, letras


def posicion(ruina):
    p = palabra(T456, POSICIONES + 2 * ruina)
    return p >> 8, p & 0xFF                 # D = X, E = Y


def imagen(v):
    from PIL import Image
    img = Image.new("RGB", (256, 212))
    for y in range(212):
        for x in range(256):
            img.putpixel((x, y), v.rgb(v.punto(0, x, y)))
    return img.resize((256 * ESCALA, 212 * ESCALA), Image.NEAREST)


def cuadros(ruina):
    """Los cuadros del juego en que cambia algo: (cuadro, imagen)."""
    v = mapa()
    xc, letras = clave(ruina)
    xp, yp = posicion(ruina)
    sucesos = {}
    for k in range(len(letras)):            # 0x3C y luego cada 8
        sucesos.setdefault(0x3C + 8 * k, []).append(("letra", k))
    cuenta = 0xAC                           # p05:9674: el primer cuadro solo la pone
    for n in range(1, 0xAC):
        cuenta -= 1
        if cuenta and cuenta % 16 == 0:
            sucesos.setdefault(n, []).append(("ficha", None))
    out = [(0, imagen(v))]
    ficha = None
    for n in sorted(sucesos):
        for tipo, k in sucesos[n]:
            if tipo == "letra":
                letra(v, letras[k], xc + 8 * k, 0xB0)
            else:
                ficha = 0x1A if ficha == 0x1B else 0x1B
                v.ficha(ficha, xp, yp, 0)
        out.append((n, imagen(v)))
    return out


def main(argv):
    if len(argv) != 3:
        sys.exit(__doc__)
    from PIL import Image
    marcos, tiempos = [], []
    for ruina in range(1, 5):
        cs = cuadros(ruina)
        for i, (n, im) in enumerate(cs):
            fin = cs[i + 1][0] if i + 1 < len(cs) else n + 120
            marcos.append(im)
            tiempos.append(round((fin - n) * 1000 / 60))
    marcos[0].save(argv[2], save_all=True, append_images=marcos[1:],
                   duration=tiempos, loop=0)
    # la hoja: el ultimo cuadro de cada ruina
    ultimos = [cuadros(r)[-1][1] for r in range(1, 5)]
    w, h = ultimos[0].size
    hoja = Image.new("RGB", (2 * w + 8, 2 * h + 8), (255, 255, 255))
    for k, im in enumerate(ultimos):
        hoja.paste(im, ((k % 2) * (w + 8), (k // 2) * (h + 8)))
    hoja.save(argv[1])
    print("exterior:", len(marcos), "cuadros")


if __name__ == "__main__":
    main(sys.argv)
