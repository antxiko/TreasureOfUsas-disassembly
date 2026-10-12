#!/usr/bin/env python3
"""Los dos protagonistas, compuestos pieza a pieza como los compone el cartucho.

p00:5B12 (con 13-14-15): la tabla de fotogramas del personaje (p14:97AE con
0xC240 = 0, p14:9BCE con 0xC240 = 1) tiene 7 por estado; el estado es
(ix+6) y la tabla avanza (ix+6) * 14 (p00:5B06).

p00:5BC6 compone cada fotograma en 0xD600 (0x80 bytes = 4 patrones de
16 x 16): registros [p | 0x80][desplazamiento][pieza] hasta 0xFF.
  - p (0-0x3F) dice la fila: 0x00-0x0F la mitad de arriba de la capa 0
    (0xD600), 0x10-0x1F la de abajo (0xD640), 0x20-0x2F arriba de la capa 1
    (0xD620) y 0x30-0x3F abajo (0xD660) (p00:5C2A); al pasar de 16 filas
    sigue en el patron de abajo (p00:5C8C).
  - sin el bit 7, la pieza se mezcla (OR) con lo que hay (0xC26A).
  - la pieza: [n] y dos bloques de n filas (columna izquierda y derecha);
    el primero va a la capa 0 y el segundo a la capa 1 (p00:5BF2-5C0E). Cada
    fila de 16 puntos se desplaza C puntos: a la derecha si C < 0x80, a la
    izquierda (-C) si no (p00:5C69).
Despues p00:5CB4 lo voltea y lo copia otra vez: cada fotograma va a la VRAM
mirando a los dos lados.

Los sprites: arriba y abajo, cada mitad con dos sprites superpuestos (p01:68F6,
desplazamientos de p01:692B); la capa 0 con el color 0xC24C y la 1 con 0xC24D
y el bit CC (OR): 6 y 0x49 (p01:67F2).
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import leer, palabra, T131415   # noqa: E402

TABLAS = {0: 0x97AE, 1: 0x9BCE}
COLOR_0, COLOR_1 = 6, 9


def destino(p):
    """p00:5C2A: el desplazamiento en 0xD600 de la fila p."""
    if p < 0x10:
        return p
    if p < 0x20:
        return 0x30 + p
    if p < 0x30:
        return p
    return 0x30 + p


def compone(foto):
    """p00:5BC6: los 0x80 bytes del fotograma."""
    T = T131415
    buf = bytearray(0x80)
    a = foto
    while True:
        b = leer(T, a)
        if b == 0xFF:
            return buf
        mezcla = not (b & 0x80)
        p = b & 0x7F
        c = leer(T, a + 1)
        pieza = palabra(T, a + 2)
        a += 4
        n = leer(T, pieza)
        for capa, base in ((0, pieza + 1), (1, pieza + 1 + 2 * n)):
            d = destino(p + 0x20 * capa)
            for f in range(n):
                fila = (leer(T, base + f) << 8) | leer(T, base + n + f)
                if c:
                    fila = (fila >> c) if c < 0x80 else (fila << (256 - c)) & 0xFFFF
                for off, byte in ((d, fila >> 8), (d + 0x10, fila & 0xFF)):
                    buf[off] = (buf[off] | byte) if mezcla else byte
                d += 1
                if d & 0x10:            # p00:5C8C: al patron de abajo
                    d += 0x30


def pixeles(buf):
    """32 filas x 16 puntos: 0, 1 (capa 0), 2 (capa 1) o 3 (las dos)."""
    out = []
    for mitad, (p0, p1) in enumerate(((0x00, 0x20), (0x40, 0x60))):
        for f in range(16):
            fila = []
            for x in range(16):
                col = 0 if x < 8 else 0x10
                bit = 0x80 >> (x & 7)
                v = (1 if buf[p0 + col + f] & bit else 0) | (2 if buf[p1 + col + f] & bit else 0)
                fila.append(v)
            out.append(fila)
    return out


# LOS COLORES. Las capas van con los colores 6 y 9 (0x49: el bit CC hace OR),
# y donde se tocan sale el 15 (p01:67F2; Cles en la sala 5, 0x4B). La paleta es
# la de las fases (p00:53DE: p06:B335, el 15 negro) con la de cada personaje
# encima (p00:5A69): p00:5A79 para Wit y p00:5A80 para Cles.
PALETA_PERSONAJE = {0: 0x5A79, 1: 0x5A80}


def colores_de(personaje):
    from rom import T123
    import fases
    v = fases.vram_de_ruina(0)
    v.paleta(T123, PALETA_PERSONAJE[personaje])
    return {1: v.rgb(COLOR_0), 2: v.rgb(COLOR_1), 3: v.rgb(COLOR_0 | COLOR_1)}


def fotogramas(personaje, estado):
    t = TABLAS[personaje]
    return [palabra(T131415, t + estado * 14 + 2 * k) for k in range(7)]


def hoja(ruta, escala=3):
    """2 personajes x 4 estados x 7 fotogramas, con la paleta de las fases de la ruina 0."""
    from PIL import Image
    ancho, alto = 7 * 20 + 4, 2 * 4 * 36 + 8
    img = Image.new("RGB", (ancho, alto), (24, 24, 24))
    for pj in range(2):
        colores = colores_de(pj)
        colores[0] = None
        for est in range(4):
            for k, foto in enumerate(fotogramas(pj, est)):
                px = pixeles(compone(foto))
                ox, oy = 4 + k * 20, 4 + (pj * 4 + est) * 36
                for y in range(32):
                    for x in range(16):
                        c = colores[px[y][x]]
                        if c:
                            img.putpixel((ox + x, oy + y), c)
    img.resize((ancho * escala, alto * escala), Image.NEAREST).save(ruta)


# LA ANIMACION. p00:5B3A guarda los 7 fotogramas del estado en la pagina 1,
# dos lineas de 0x80 bytes cada uno: primero volteado (p00:5B4E) y luego tal
# cual (p00:5B54). p01:6835 copia la linea 0xD0 + 0xC253 a los patrones, asi
# que el cuadro 2k + 1 es el fotograma k y el 2k su espejo (0xC250, el sentido,
# es el bit 0). Lo que pone cada accion (0xC24B, despacho p01:699E):
#   0 y 6 andar (p01:69B0): 0, 2, 4, 6 + sentido; avanza cuando 0xC252 llega a
#         p01:69E6[(ix+1)] (p01:69C7), y 0xC252 sube una vez por cuadro al
#         moverse (p01:6416)
#   1 y 2 en el aire (p01:69EB): 8 + sentido
#   5 escalera (p01:6AAB): sin direccion 10 y 11 alternos al mismo ritmo
#         (p01:6AB1); con 0xC254 = 1 o 2, el 12 o el 13 (p01:6AD2)
# El nivel de velocidad con el que se empieza es el byte 1 de la ficha
# inicial (p06:BF6C): 0 Wit y 2 Cles.
NIVEL_INICIAL = {0: 0, 1: 2}
RITMO = 0x69E6          # p01:69E6, cuadros por paso segun el nivel


def ritmo(personaje):
    from rom import T123
    return leer(T123, RITMO + NIVEL_INICIAL[personaje])


def dibujo(px, volteado):
    return [list(reversed(f)) for f in px] if volteado else px


def anima(ruta, escala=3):
    """Un GIF: Wit arriba y Cles abajo, los estados 0-3 en filas; columnas:
    andar, en el aire, escalera y escalera con direccion. Un cuadro del GIF
    son 2 cuadros del juego (60 Hz)."""
    from PIL import Image
    colores = {pj: colores_de(pj) for pj in range(2)}
    px = {(pj, est): [pixeles(compone(f)) for f in fotogramas(pj, est)]
          for pj in range(2) for est in range(4)}
    # cuadros del juego por cuadro de GIF y cuantos cuadros de GIF: un ciclo
    # de 4 pasos del mas lento
    paso_gif = 2
    lento = max(ritmo(0), ritmo(1))
    n_gif = 4 * lento // paso_gif
    imgs = []
    for g in range(n_gif):
        t = g * paso_gif
        img = Image.new("RGB", (4 * 22 + 6, 8 * 36 + 6), (24, 24, 24))
        for pj in range(2):
            paso = (t // ritmo(pj)) % 4
            for est in range(4):
                f = px[(pj, est)]
                oy = 4 + (pj * 4 + est) * 36
                columnas = (dibujo(f[paso], False), dibujo(f[4], False),
                            dibujo(f[5], paso % 2 == 1), dibujo(f[6], False))
                for c, d in enumerate(columnas):
                    for y in range(32):
                        for x in range(16):
                            if d[y][x]:
                                img.putpixel((4 + c * 22 + x, oy + y), colores[pj][d[y][x]])
        imgs.append(img.resize((img.width * escala, img.height * escala), Image.NEAREST))
    imgs[0].save(ruta, save_all=True, append_images=imgs[1:],
                 duration=round(paso_gif * 1000 / 60), loop=0)


if __name__ == "__main__":
    if len(sys.argv) >= 3 and sys.argv[1] == "hoja":
        hoja(sys.argv[2])
    elif len(sys.argv) >= 3 and sys.argv[1] == "anima":
        anima(sys.argv[2])
    else:
        sys.exit("uso: personajes.py hoja <png> | anima <gif>")
