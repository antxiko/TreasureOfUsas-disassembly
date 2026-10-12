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


# LOS GOLPES DE CLES. Con Cles (0xC240 = 1) p00:5B1A anade los fotogramas de
# p14:9F4A[estado] ([n] y n punteros) a la pagina 0 desde la linea 0xD8
# (0x6C00), volteado y tal cual como los otros. El golpe es un disparo que
# nace en la Y y la X de Cles (p01:6BAE; p01:6C12 no la toca con Cles) y cuyos
# sprites salen del registro p09:B7C9[(ix+0x0A)]: [n] y n x [dy][dx][patron]
# [color], con dy y dx con signo (p01:6FCD). Segun el estado:
#   0  tipo 6 (p01:6CE6): los 2 fotogramas van a la linea 0xF1 (patrones
#      0x10-0x1C) alternando cada 2 cuadros (p01:6867) y el registro 0x0F o
#      0x10 los pone como 4 sprites de un color (0x0D): un dibujo de 32 x 32
#      que se aleja (velocidad 0x400)
#   1 y 2  tipos 7 y 8 (p01:687A): el cuerpo de p01:688B[accion] a la linea
#      0xF0 y la otra mitad de p01:6891[accion] a la 0xF1; el registro es
#      p01:6D59[accion] (+3 mirando a la izquierda): 9 de pie, 0x0A en el aire
#      y 0x0B en la escalera
#   3  tipo 9 (p01:68C8): el cuerpo da vueltas por los 4 fotogramas, uno cada
#      2 cuadros (0xC00D & 6)
# Aqui todo mira a la derecha (las lineas impares: el fotograma tal cual).
GOLPES = 0x9F4A
REGISTROS = 0xB7C9         # p09:B7C9
REGISTRO_ACCION = 0x6D59   # p01:6D59
LINEA_CUERPO = 0x688B      # p01:688B
LINEA_GOLPE = 0x6891       # p01:6891


def golpes(estado):
    a = palabra(T131415, GOLPES + 2 * estado)
    return [compone(palabra(T131415, a + 1 + 2 * k)) for k in range(leer(T131415, a))]


def registro(n):
    from rom import T789
    a = palabra(T789, REGISTROS + 2 * n)
    return [tuple(leer(T789, a + 1 + 4 * i + j) for j in range(4)) for i in range(leer(T789, a))]


def con_signo(b):
    return b - 256 if b >= 0x80 else b


def pinta_sprite(img, buf, p, x0, y0, color, mezcla, pal=None):
    """El sprite 16 x 16 de patron p (0x00-0x1C: p * 8 dentro de las dos
    lineas 0xF0 y 0xF1) en (x0, y0). mezcla: OR con lo que haya (bit CC)."""
    for y in range(16):
        for x in range(16):
            b = buf[p * 8 + (16 if x >= 8 else 0) + y]
            if b & (0x80 >> (x & 7)):
                q = (x0 + x, y0 + y)
                if 0 <= q[0] < img.width and 0 <= q[1] < img.height:
                    previo = mezcla.get(q, 0) if color & 0x40 else 0
                    c = (color & 0x0F) | previo
                    mezcla[q] = c
                    img.putpixel(q, (pal or PALETA_CLES)[c])


def cuerpo(img, buf, cx, cy, mezcla, pal=None):
    """p01:68D9: dos parejas de sprites en (Y - 0x20, X - 8) y (Y - 0x10, X - 8)
    con los patrones 0/4 y 8/0x0C, la segunda con el bit CC (0x49)."""
    for dy, p in ((-0x20, 0), (-0x10, 8)):
        pinta_sprite(img, buf, p, cx - 8, cy + dy, COLOR_0, mezcla, pal)
        pinta_sprite(img, buf, p + 4, cx - 8, cy + dy, 0x40 | COLOR_1, mezcla, pal)


def golpe(img, buf, reg, cx, cy, mezcla, pal=None):
    for dy, dx, p, color in registro(reg):
        pinta_sprite(img, buf, p, cx + con_signo(dx), cy + con_signo(dy), color, mezcla, pal)


PALETA_CLES = {}


def ataques(ruta, escala=3):
    from PIL import Image
    from rom import T123
    import fases
    v = fases.vram_de_ruina(0)
    v.paleta(T123, PALETA_PERSONAJE[1])
    PALETA_CLES.update({c: v.rgb(c) for c in range(16)})
    f = {e: golpes(e) for e in range(4)}
    celda = 48
    imgs = []
    for g in range(4):                      # un cuadro de GIF = 2 del juego
        img = Image.new("RGB", (3 * celda, 4 * celda), (24, 24, 24))
        # 0: el dibujo de 32 x 32 (registro 0x0F: mirando a la derecha)
        buf = bytes(0x80) + f[0][g % 2]
        golpe(img, buf, 0x0F, celda // 2, celda - 8, {})
        # 1 y 2: de pie, en el aire y en la escalera
        for e in (1, 2):
            for c, accion in enumerate((0, 2, 5)):
                cuerpo_k = (leer(T123, LINEA_CUERPO + accion) - 0xD8) // 2
                golpe_k = (leer(T123, LINEA_GOLPE + accion) - 0xD8) // 2
                reg = leer(T123, REGISTRO_ACCION + accion)
                buf = f[e][cuerpo_k] + f[e][golpe_k]
                mezcla = {}
                cx, cy = c * celda + celda // 2, e * celda + celda - 8
                golpe(img, buf, reg, cx, cy, mezcla)
                cuerpo(img, buf, cx, cy, mezcla)
        # 3: la vuelta
        cuerpo(img, f[3][g], celda // 2, 3 * celda + celda - 8, {})
        imgs.append(img.resize((img.width * escala, img.height * escala), Image.NEAREST))
    imgs[0].save(ruta, save_all=True, append_images=imgs[1:],
                 duration=round(2 * 1000 / 60), loop=0)


# LOS DISPAROS DE WIT. El tipo es 4 - estado (p01:6B13). Sus patrones los
# carga p00:5AA8 de p15:A31B[3 - estado]: [patron volteado][origen][patron tal
# cual]; el RLE (p00:49CE) va volteado, sprite a sprite (p00:496C), al primero
# y tal cual al segundo (p00:5612). El disparo nace en la X de Wit + 8 (tipo 1)
# o + 2 (p01:6C45) y su Y - 4, o la Y tal cual el tipo 1 (p01:6C12 con 0xC26C);
# mientras, Wit pone el cuadro 8 (en el aire) 8 cuadros (p01:6BF8). Cada cuadro:
#   tipo 1 (p01:6E52) el rayo, por fases (p01:6E6A): 4 cuadros quieto con el
#          registro 5; luego cada cuadro registro + 1 y X + 16 hasta el 8; y
#          registro - 1 y X + 16 hasta el 5 (p01:6EA3); y se borra
#   tipos 2 y 3 (p01:6E51) recto a 8 puntos por cuadro (0x800, p01:6D84),
#          registro 0, y se borran a los 8 cuadros (alcance)
#   tipo 4 (p01:6EC9) sale con dos del tipo 5 (p01:6B4E): ver simula_disparo
# Todo mirando a la derecha. Un cuadro del GIF es un cuadro del juego, a 50 por
# segundo (el GIF no baja de 20 ms).
SPRITES_WIT = 0xA31B


def patrones_de_disparo(estado):
    """Los 32 patrones de 0x10-0x1F (lineas 0xF0-0xF1) tras p00:5AA8."""
    from rom import rle
    a = SPRITES_WIT + 4 * (3 - estado)
    vol, nor = leer(T131415, a), leer(T131415, a + 3)
    datos, _ = rle(T131415, palabra(T131415, a + 1))
    buf = bytearray(0x100)
    volteado = bytearray()
    for k in range(len(datos) // 32):
        s = datos[k * 32:(k + 1) * 32]
        inv = bytes(int("{:08b}".format(b)[::-1], 2) for b in s)
        volteado += inv[16:] + inv[:16]
    buf[vol * 8:vol * 8 + len(volteado)] = volteado
    if nor:
        buf[nor * 8:nor * 8 + len(datos)] = datos
    return bytes(buf)


def simula_disparo(tipo, x, y, cuadros):
    """[[(registro, X, Y), ...] o []] cuadro a cuadro: los disparos en pantalla.

    Los tipos 2-5 nacen con un alcance de 8 cuadros ((ix+0x0D) = 8, p01:6D75)
    y a los 8 se borran (p01:6E0D); el 1 no tiene alcance (0xFF, p01:6CA8).
    El tipo 4 sale con dos del tipo 5 (p01:6B4E): el 4 recto, registro 0x13;
    los dos 5 en los huecos de sprite 5 y 6 (registros 0x13 y 0x14,
    p01:6CBD) con la velocidad Y 0x0001 y 0xF802 (p01:6CD4)."""
    fuera = []
    if tipo == 1:
        x += 8
        reg, fase, espera = 5, 0, 4
        for _ in range(cuadros):
            if fase == 0:
                espera -= 1
                if espera == 0:
                    fase = 1
            elif fase == 1:
                x += 16
                reg += 1
                if (reg - 1) & 3 == 3:
                    fase = 3
            elif fase == 3:
                reg -= 1
                x += 16
                if (reg - 1) & 3 == 0:
                    fase = 4
            elif fase == 4:
                reg = None
            fuera.append([] if reg is None else [(reg, x, y)])
        return fuera
    if tipo == 4:
        tiros = [(0x13, 0), (0x13, 0x0001), (0x14, 0xF802 - 0x10000)]
    else:
        tiros = [(0, 0)]
    x0, y0 = x + 2, (y - 4) * 256
    for t in range(cuadros):
        vivos = []
        for reg, vy in tiros:
            if t < 8:               # 8 cuadros de alcance
                vivos.append((reg, x0 + 8 * (t + 1), (y0 + vy * (t + 1)) // 256))
        fuera.append(vivos)
    return fuera


def dispara(ruta, escala=3, cuadros=36):
    from PIL import Image
    from rom import T123
    import fases
    v = fases.vram_de_ruina(0)
    v.paleta(T123, PALETA_PERSONAJE[0])
    pal = {c: v.rgb(c) for c in range(16)}
    fotos = {e: [compone(f) for f in fotogramas(0, e)] for e in range(4)}
    tiros = {e: simula_disparo(4 - e, 24, 0, cuadros) for e in range(4)}
    alto = 96
    imgs = []
    for t in range(cuadros):
        img = Image.new("RGB", (240, 4 * alto), (24, 24, 24))
        for e in range(4):
            cy = e * alto + alto - 4
            buf = fotos[e][4 if t < 8 else 0] + patrones_de_disparo(e)[0x80:]
            mezcla = {}
            for reg, x, y in tiros[e][t]:
                golpe(img, buf, reg, x, cy + y, mezcla, pal)
            cuerpo(img, buf, 24, cy, mezcla, pal)
        imgs.append(img.resize((img.width * escala, img.height * escala), Image.NEAREST))
    imgs[0].save(ruta, save_all=True, append_images=imgs[1:], duration=20, loop=0)


if __name__ == "__main__":
    if len(sys.argv) >= 3 and sys.argv[1] == "hoja":
        hoja(sys.argv[2])
    elif len(sys.argv) >= 3 and sys.argv[1] == "anima":
        anima(sys.argv[2])
    elif len(sys.argv) >= 3 and sys.argv[1] == "ataques":
        ataques(sys.argv[2])
    elif len(sys.argv) >= 3 and sys.argv[1] == "dispara":
        dispara(sys.argv[2])
    else:
        sys.exit("uso: personajes.py hoja <png> | anima <gif> | ataques <gif> | dispara <gif>")
