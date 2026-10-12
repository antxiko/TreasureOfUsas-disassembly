#!/usr/bin/env python3
"""Declara los bloques de datos que el codigo LEE, recorriendolos como el cartucho.

Un rango de datos no se declara porque sobre: se declara porque hay una
instruccion que lo lee. Cada bloque sale de un LECTOR del listado (la
instruccion que carga el puntero y la rutina que recorre el formato), y su
final sale de RECORRER el formato como lo recorre esa rutina, o de la cuenta
que le pasa quien la llama.

Los lectores del banco 0 (formatos en tools/rom.py y tools/vram.py):

  L_529C   lista de fichas: [n] y n x [c][destino 2][cuantas][origen 2]; c >> 4
           indexa la tabla de colores (DE), que apunta a 2, 4 u 8 bytes; las
           fichas son 8, 16 o 24 bytes segun c & 0x0F (1, 2 o 3 bits).
  L_4A9D   paleta: ternas [registro][RB][G] hasta 0xFF.
  L_5578   RLE: n == 0 acaba; n < 0x80 repite el siguiente; n > 0x80 copia
           n & 0x7F; 0x80 no hace nada.
  L_4D4A   texto con posicion: [X][Y] y caracteres; 0xFE trae otra
           posicion; 0xFF acaba. L_4D4E lo mismo.
  L_4CBF   caracteres de 1 bit: B x 8 bytes (L_4CCC lo mismo).
  L_4EA2   fichas de 2 bits sin lista: B x 16 bytes.
  L_543A   la palabra A de una tabla.

Lo que sale se escribe, banco a banco, en una seccion delimitada de
src/pNN.notes que esta herramienta reescribe entera; lo de fuera no lo toca.
Un bloque que pise codigo trazado o una D escrita a mano NO se escribe: se
avisa, porque algo esta mal y hay que mirarlo.

Uso: bloques.py              informa de lo que encontraria
     bloques.py --escribe    y lo escribe en las notas
"""
import json
import os
import sys
from collections import defaultdict

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
from paginas import ORG, TAM_PAGINA, nombre                      # noqa: E402
from rom import (ROM, leer, palabra, banco, T123, T456, T789,    # noqa: E402
                 T101112, T131415)
from vram import FORMATOS                                        # noqa: E402

CAB = "# --- BLOQUES QUE LEE EL CODIGO (seccion que reescribe tools/bloques.py; no editar a mano) ---"
FIN = "# --- fin de los bloques de bloques.py ---"

BLOQUES = []       # dict(p, ini, fin, nombre, texto, lectores, F)
AVISOS = []


def declara(trio, ini, fin, nom, texto, lectores, F=None):
    """Un bloque [ini, fin) de la ventana con el trio puesto; si cruza de
    banco se parte y cada trozo dice de donde viene y a donde sigue."""
    if fin <= ini:
        AVISOS.append("bloque vacio %s en %04X" % (nom, ini))
        return
    if isinstance(lectores, str):
        lectores = [lectores]
    if fin > 0xC000 or ini < 0x4000:
        AVISOS.append("bloque %s %04X-%04X se sale de la ventana: no se declara" % (nom, ini, fin))
        return
    a = ini
    while a < fin:
        b = banco(trio, a)
        tope = ORG[b] + TAM_PAGINA
        z = min(fin, tope)
        t = texto
        if a > ini:
            t += " (sigue del banco %d)" % banco(trio, a - 1)
        if z < fin:
            t += " (sigue en el banco %d, en 0x%04X)" % (banco(trio, z), z)
        BLOQUES.append(dict(p=b, ini=a, fin=z, nombre=nom if a == ini else nom + "_cola",
                            texto=t, lectores=list(lectores), F=F))
        a = z


# ---------------------------------------------------------------- formatos

def fin_paleta(trio, a):
    while leer(trio, a) != 0xFF:
        a += 3
    return a + 1


def fin_rle(trio, a):
    while True:
        n = leer(trio, a)
        a += 1
        if n == 0:
            return a
        if n < 0x80:
            a += 1
        elif n > 0x80:
            a += n & 0x7F


def fin_texto(trio, a):
    """L_4D4A: [X][Y], caracteres, 0xFE [X][Y] ..., 0xFF."""
    a += 2
    while True:
        c = leer(trio, a)
        a += 1
        if c == 0xFF:
            return a
        if c == 0xFE:
            a += 2


def paleta(trio, a, nom, lector):
    declara(trio, a, fin_paleta(trio, a), nom,
            "paleta: ternas [registro][RB][G] hasta 0xFF", lector, F=3)


def rle(trio, a, nom, que, lector):
    declara(trio, a, fin_rle(trio, a), nom, "RLE (L_5578): " + que, lector, F=16)


def texto(trio, a, nom, lector):
    declara(trio, a, fin_texto(trio, a), nom,
            "texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba",
            lector, F=16)


def tabla_de_palabras(trio, a, n, nom, que, lector):
    declara(trio, a, a + 2 * n, nom, "%d palabras: %s" % (n, que), lector, F=2)


def lista_de_fichas(trio, base, colores, nom, lector, vistos_col=None):
    """L_529C: la lista, sus colores y sus fichas."""
    n = leer(trio, base)
    declara(trio, base, base + 1 + 6 * n, nom,
            "lista de fichas (L_529C): [n] y n x [c][destino][cuantas][origen]",
            lector, F=6)
    maxcol = 0
    for k in range(n):
        e = base + 1 + 6 * k
        c = leer(trio, e)
        cuantas = leer(trio, e + 3)
        origen = palabra(trio, e + 4)
        bits = FORMATOS.get(c & 0x0F, 3)
        maxcol = max(maxcol, c >> 4)
        ncol = (c & 6) * 2 or 2
        pc = palabra(trio, colores + 2 * (c >> 4))
        declara(trio, pc, pc + ncol, "%s_col%d" % (nom, c >> 4),
                "%d colores (indice -> color de la paleta) que L_529C copia a 0xDF00" % ncol,
                lector, F=ncol)
        declara(trio, origen, origen + cuantas * 8 * bits, "%s_f%d" % (nom, k),
                "%d fichas de 8x8 a %d bit(s) por punto (%d bytes cada una), entrada %d de la lista %s"
                % (cuantas, bits, 8 * bits, k, nom), lector, F=8 * bits)
    declara(trio, colores, colores + 2 * (maxcol + 1), nom + "_colores",
            "tabla de colores de la lista %s (L_529C indexa con c >> 4)" % nom, lector, F=2)


# ---------------------------------------------------------------- el juego

def fases():
    """Los mapas y metabloques (tools/fases.py)."""
    L = "p00:5516"
    tabla_de_palabras(T101112, 0x6000, 25, "mapas_de_fase",
                      "el mapa RLE de cada fase 1-25 (p00:551F: p10:5FFE[0xC211])", L)
    for f in range(1, 26):
        a = palabra(T101112, 0x5FFE + 2 * f)
        if a not in {palabra(T101112, 0x5FFE + 2 * g) for g in range(1, f)}:
            rle(T101112, a, "mapa_fase_%02d" % f,
                "el mapa de la fase %d, 48 bytes por pantalla (p15:BEBF)" % f, L)
    L = "p00:5533"
    tabla_de_palabras(T101112, 0x6032, 5, "metabloques_de_ruina",
                      "los metabloques RLE de cada ruina (p00:553C)", L)
    for r in range(5):
        rle(T101112, palabra(T101112, 0x6032 + 2 * r), "metabloques_ruina_%d" % r,
            "los metabloques de la ruina %d, 16 fichas cada uno" % r, L)
    L = "p00:5554"
    tabla_de_palabras(T101112, 0x603C, 5, "mapas_de_antesala",
                      "el mapa RLE de la antesala de cada ruina (p00:5557)", L)
    for r in range(5):
        rle(T101112, palabra(T101112, 0x603C + 2 * r), "mapa_antesala_%d" % r,
            "las tres pantallas de la antesala de la ruina %d" % r, L)
    L = "p00:5566"
    tabla_de_palabras(T101112, 0x88CB, 5, "metabloques_de_antesala",
                      "los metabloques RLE de cada antesala (p00:5569)", L)
    for r in range(5):
        rle(T101112, palabra(T101112, 0x88CB + 2 * r), "metabloques_antesala_%d" % r,
            "los metabloques de la antesala de la ruina %d" % r, L)
    rle(T101112, 0xAB39, "mapa_sala5", "la pantalla de la sala de la puerta 5 (p00:552B)", "p00:552B")
    rle(T101112, 0xAB66, "metabloques_sala5", "los metabloques de la sala de la puerta 5", "p00:5548")
    L = "p09:B8E9"
    tabla_de_palabras(T789, 0xB923, 25, "vecinas_de_fase",
                      "las vecinas de cada fase 1-25 (p09:B8ED: p09:B921[0xC211])", L)
    for f in range(1, 26):
        a = palabra(T789, 0xB921 + 2 * f)
        if a in {palabra(T789, 0xB921 + 2 * g) for g in range(1, f)}:
            continue
        n = len(mapas_rle_pantallas(f))
        declara(T789, a, a + 2 * n, "vecinas_fase_%02d" % f,
                "2 bytes por pantalla: arriba/abajo/izquierda/derecha a nibbles "
                "(p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale", L, F=2)


def mapas_rle_pantallas(f):
    from rom import rle as descomprime
    datos, _ = descomprime(T101112, palabra(T101112, 0x5FFE + 2 * f))
    return [datos[i:i + 48] for i in range(0, len(datos), 48)]


def graficos():
    """Las listas de fichas y paletas que cargan las entradas a fase y antesala."""
    lista_de_fichas(T131415, 0xBB95, 0xBB71, "fichas_comunes", "p00:51C5")
    declara(T789, 0x6000, 0x6014, "graficos_de_ruina",
            "5 x [tabla de colores][lista de fichas] de cada ruina (p00:5286)", "p00:5286", F=4)
    for r in range(5):
        lista_de_fichas(T789, palabra(T789, 0x6002 + 4 * r), palabra(T789, 0x6000 + 4 * r),
                        "fichas_ruina_%d" % r, "p00:5286")
    lista_de_fichas(T101112, 0xADE3, 0xADCB, "fichas_p5372", "p00:5372")
    lista_de_fichas(T101112, 0xAF81, 0xAF6B, "fichas_p53BB", "p00:53BB")
    lista_de_fichas(T456, 0xAF78, 0xAF6C, "fichas_p53AF", "p00:53AF")
    tabla_de_palabras(T789, 0xBB32, 2, "fichas_por_c240", "la lista de p00:5A38 segun 0xC240", "p00:5A38")
    for k in range(2):
        lista_de_fichas(T789, palabra(T789, 0xBB32 + 2 * k), 0xBB15, "fichas_c240_%d" % k, "p00:5A38")
    lista_de_fichas(T789, 0x8A35, 0x8A19, "fichas_sala5", "p00:51D4")
    lista_de_fichas(T789, 0x61C1, 0x6064, "fichas_p51B3", "p00:51B3")
    declara(T789, 0x6014, 0x6064, "caracteres_p5354", "2 x 5 caracteres de 1 bit "
            "(p00:5357 y p00:5363, L_4CCC con B = 5)", "p00:5354", F=8)
    tabla_de_palabras(T789, 0x60B0, 5, "fichas_de_antesala", "la lista de cada antesala (p00:515B)", "p00:5155")
    for r in range(5):
        lista_de_fichas(T789, palabra(T789, 0x60B0 + 2 * r), 0x6064, "fichas_antesala_%d" % r, "p00:5155")
    lista_de_fichas(T101112, 0xA7AA, 0xA7A4, "fichas_p5167", "p00:5167")
    declara(T789, 0x89F9, 0x89F9 + 32, "fichas_p518E", "2 fichas de 2 bits (p00:51A5, L_4EA2)", "p00:51A5", F=16)
    paleta(T456, 0xB335, "paleta_base", "p00:53DE")
    tabla_de_palabras(T456, 0xB2DB, 5, "paletas_de_fase", "la paleta de las fases de cada ruina (p00:53D3)", "p00:53C7")
    tabla_de_palabras(T456, 0xB35C, 5, "paletas_de_sala5", "la paleta de la sala 5 de cada ruina (p00:53F5)", "p00:53F2")
    tabla_de_palabras(T456, 0xB281, 5, "paletas_de_antesala", "la paleta de cada antesala (p00:5416)", "p00:540D")
    for r in range(5):
        paleta(T456, palabra(T456, 0xB2DB + 2 * r), "paleta_fase_r%d" % r, "p00:53C7")
        paleta(T456, palabra(T456, 0xB35C + 2 * r), "paleta_sala5_r%d" % r, "p00:53F2")
        paleta(T456, palabra(T456, 0xB281 + 2 * r), "paleta_antesala_r%d" % r, "p00:540D")
    paleta(T456, 0xB271, "paleta_antesala", "p00:540D")


def recorre_pista(trio, inicio, tocados, pendientes):
    """p13:6203: una pista de musica, como la lee el canal (p13:6134).

    < 0xC0 nota [altura|duracion]; C0-CF silencio; D0 [veces][atras]
    bucle relativo; D1-DF tempo; E0-E5 octava; E6 vuelve de EF; E7, E8, E9,
    EB, EC llevan un byte; EA [lo][hi] salta (fin del recorrido); ED [lo][hi]
    llama (vuelve EE); EE vuelve; EF [lo][hi] llama (vuelve E6); F0-FC
    volumen + un byte; FD/FE [veces][lo][hi] bucle; FF acaba.
    Las llamadas se recorren aparte (pendientes)."""
    a = inicio
    while True:
        c = leer(trio, a)
        if c < 0xD0 or 0xD1 <= c <= 0xE5:
            n = 1
        elif c == 0xD0:
            n = 3
        elif c in (0xE6, 0xEE):
            tocados.update(range(a, a + 1))
            return
        elif c in (0xE7, 0xE8, 0xE9, 0xEB, 0xEC):
            n = 2
        elif c == 0xEA:
            tocados.update(range(a, a + 3))
            pendientes.append(palabra(trio, a + 1))
            return
        elif c in (0xED, 0xEF):
            pendientes.append(palabra(trio, a + 1))
            n = 3
        elif c == 0xFF:
            tocados.add(a)
            return
        elif c in (0xFD, 0xFE):
            pendientes.append(palabra(trio, a + 2))
            n = 4
        else:                       # F0-FC
            n = 2
        tocados.update(range(a, a + n))
        a += n


def recorre_envolvente(trio, inicio, tocados, pendientes):
    """p13:6506: una envolvente o un efecto (p13:64F4).

    FF acaba; 25 pasa a modo crudo (un byte por cuadro) hasta que el
    siguiente es 27; FE/FD [veces][lo][hi] bucle; 28 [veces][atras]; 27 un
    byte; 26 [n]; 24 [lo][hi] llama (vuelve 2C); 2C vuelve; 1x prefijo de
    ruido seguido de una nota; 20-2F (los demas) [cuadros] y 29-2B dos bytes
    mas; el resto, nota [volumen|periodo alto][periodo bajo]."""
    a = inicio
    crudo = False
    while True:
        c = leer(trio, a)
        if c == 0xFF:
            tocados.add(a)
            return
        if crudo:
            tocados.add(a)
            a += 1
            if leer(trio, a) == 0x27:
                crudo = False
            continue
        if c in (0xFE, 0xFD):
            pendientes.append(palabra(trio, a + 2))
            n = 4
        elif c == 0x28:
            n = 3
        elif c == 0x27:
            n = 1
        elif c == 0x26:
            n = 2
        elif c == 0x25:
            n = 1
            crudo = True
        elif c == 0x24:
            pendientes.append(palabra(trio, a + 1))
            n = 3
        elif c == 0x2C:
            tocados.add(a)
            return
        elif c & 0xF0 == 0x20:
            n = 4 if c in (0x29, 0x2A, 0x2B) else 2
        elif c & 0xF0 == 0x10:
            n = 3
        else:
            n = 2
        tocados.update(range(a, a + n))
        a += n


def tramos(conjunto):
    """Rangos [ini, fin) seguidos de un conjunto de direcciones."""
    out = []
    for x in sorted(conjunto):
        if out and out[-1][1] == x:
            out[-1][1] = x + 1
        else:
            out.append([x, x + 1])
    return out


def sonido():
    """Las tablas del motor de sonido (p00:56E3) y todo lo que recorren."""
    T = T131415
    L = "p00:56E3"
    declara(T, 0x66C4, 0x670E, "efectos", "37 palabras: el efecto 1-0x25 (p00:586D: "
            "p13:66C2[A]) y el 0x70-0x7F (p00:5894: p13:66C4[A & 15])", L, F=2)
    declara(T, 0x670E, 0x672C, "sonidos_40", "5 x 3 palabras: los tres canales de "
            "los sonidos 0x40-0x44 (p00:580B: p13:670E[(A & 0x3F) * 6])", "p00:57E6", F=6)
    declara(T, 0x672C, 0x678C, "musicas", "16 x 3 palabras: los tres canales de "
            "las musicas 0x80-0x8F (p00:5775: p13:672C[(A & 0x7F) * 6])", L, F=6)
    declara(T, 0x610E, 0x6126, "mascaras_de_canal", "4 tablas de 6 bytes "
            "(p13:60DC/60E3/60EA/60F1 + 0xC10C * 2): la mascara del mezclador de cada canal",
            "p13:60F5", F=6)
    declara(T, 0x6325, 0x6345, "periodos", "16 palabras: el periodo de cada "
            "nota (p13:6284 + (nota >> 3)), con 5 puntos de entrada segun 0xC122 "
            "(p13:625D)", "p13:6284", F=2)
    declara(T, 0x8D4F, 0x8D65, "instrumentos", "11 palabras: la lista de "
            "envolventes de cada instrumento (p13:62D3: p14:8D4F[(ix+8)]), "
            "ventanas sobre p14:8D65", "p13:62CC", F=2)
    declara(T, 0x8D65, 0x8DE5, "envolventes_por_altura", "64 palabras: la "
            "envolvente de cada altura (p13:6308: + (nota >> 3)), compartidas "
            "por los instrumentos", "p13:62CC", F=2)
    pistas, env = set(), set()
    pend = []
    for i in range(16):
        pend += [palabra(T, 0x672C + 6 * i + 2 * k) for k in range(3)]
    pend += [0x6FA6, 0x6FB3]        # p00:5958/595E: el sonido 0xFD (canales p13:6126/612D)
    vistos = set()
    while pend:
        x = pend.pop()
        if x in vistos:
            continue
        vistos.add(x)
        recorre_pista(T, x, pistas, pend)
    pend = [palabra(T, 0x66C4 + 2 * i) for i in range(37)]
    pend += [palabra(T, 0x670E + 2 * i) for i in range(15)]
    pend += [palabra(T, 0x8D65 + 2 * i) for i in range(64)]
    vistos = set()
    while pend:
        x = pend.pop()
        if x in vistos:
            continue
        vistos.add(x)
        recorre_envolvente(T, x, env, pend)
    for ini, fin in tramos(pistas):
        declara(T, ini, fin, "pista_%04X" % ini, "pista de musica (p13:6203), "
                "recorrida desde p13:672C", "p13:6203", F=16)
    for ini, fin in tramos(env - pistas):
        declara(T, ini, fin, "envolvente_%04X" % ini, "envolvente o efecto "
                "(p13:6506), recorrido desde p13:66C4, 670E y p14:8D65", "p13:6506", F=16)


def fuente():
    """p00:50C1: la fuente y los caracteres del marcador (13-14-15)."""
    T = T131415
    L = "p00:50C1"
    rle(T, 0x9289, "fuente", "156 caracteres de 1 bit (8 bytes) que p00:50D4 "
        "pinta con L_4CBF en (0, 0x40) de la pagina 0", L)
    declara(T, 0x970C, 0x9714, "caracter_p50DA", "un caracter de 1 bit (p00:50E0, "
            "L_4CBF, B = 1)", L, F=8)
    declara(T, 0x9714, 0x9734, "ficha_p50E3", "una ficha de 8x8 a 4 bits (32 bytes) "
            "que L_4CFA copia tal cual a la VRAM 0xAC34", L, F=4)
    rle(T, 0x9734, "caracteres_p50ED", "16 caracteres de 1 bit (p00:50F9 y p00:5102, "
        "8 y 8)", L)
    rle(T, 0x9776, "caracteres_p5105", "16 caracteres de 1 bit (p00:5111 y p00:511A, "
        "8 y 8)", L)


def textos():
    """Textos de L_4D4A/L_4D4E con el puntero a la vista."""
    for a, lector in ((0x5062, "p00:4685"), (0x5068, "p05:9880"), (0x5088, "p00:4464"),
                      (0x5095, "p00:443A"), (0x50A4, "p00:41BB")):
        texto(T123, a, "texto_%04X" % a, lector)


# p01:7776: tras [tipo] (y [Y][X] salvo el tipo 2) cada tipo lee lo que
# diga su manejador del despachador p01:77A0 (tipo - 1).
EXTRA_POR_TIPO = {1: 1, 2: 0, 3: 1, 4: 2, 5: 2, 6: 0, 7: 1, 8: 0, 9: 1, 10: 0,
                  11: 5, 12: 0}


def fin_lista_enemigos(trio, a):
    """p01:774B: [n] y n enemigos de [tipo][Y][X][extra]."""
    n = leer(trio, a)
    a += 1
    for _ in range(n):
        t = leer(trio, a)
        a += 1 + (0 if t == 2 else 2) + EXTRA_POR_TIPO[t]
    return a


def enemigos():
    """p01:772E: los enemigos de cada pantalla (p15:A4F9[0xC211][0xC212 - 1])."""
    T = (1, 2, 15)
    L = "p01:774B"
    tabla_de_palabras(T, 0xA4FB, 25, "enemigos_por_fase", "la tabla de pantallas "
                      "de cada fase 1-25 (p15:A4F9[0xC211]; 0 en las 5, 10, 15, 20 y "
                      "25; la entrada 0 no se lee y sus dos bytes son la cola de "
                      "p15:A4CA)", L)
    from fases import mapa
    vistos = set()
    for f in range(1, 26):
        t = palabra(T, 0xA4F9 + 2 * f)
        if not t:
            continue
        n = len(mapa(f))
        tabla_de_palabras(T, t, n, "enemigos_fase_%02d" % f, "la lista de enemigos "
                          "de cada pantalla de la fase %d" % f, L)
        for k in range(n):
            x = palabra(T, t + 2 * k)
            if x in vistos:
                continue
            vistos.add(x)
            declara(T, x, fin_lista_enemigos(T, x), "enemigos_%04X" % x,
                    "[n] y n x [tipo][Y][X] y lo que lea cada tipo (p01:77A0)", L, F=16)


def objetos():
    """p01:79A9 y p01:7F1F: las listas por fase de 3 bytes hasta 0xFF."""
    T = (1, 2, 12)
    for base, lector, que in ((0xBF59, "p01:79A9", "[pantalla][Y][X] a 0xCB00"),
                              (0xB591, "p01:7F1F", "[pantalla][YX][YX] a 0xD180")):
        tabla_de_palabras(T, base + 2, 25, "por_fase_%04X" % base,
                          "la lista de cada fase 1-25 (%s, indice 0xC211)" % lector, lector)
        for x in sorted({palabra(T, base + 2 * f) for f in range(1, 26)}):
            a = x
            while leer(T, a) != 0xFF:
                a += 3
            declara(T, x, a + 1, "lista_%04X" % x, "3 bytes %s hasta 0xFF" % que, lector, F=3)


def fin_rle_sprite(trio, a):
    """p00:49CE: n == 0 acaba; n < 0x80 repite el siguiente; si no, copia n & 0x7F."""
    while True:
        n = leer(trio, a)
        a += 1
        if n == 0:
            return a
        a += 1 if n < 0x80 else n & 0x7F


def registros_de_sprite(trio, base, n, nom, lector):
    """p00:5612: n x [patron volteado][origen][patron normal]; el origen es
    un RLE (p00:49CE) que p00:4955 copia volteado y p00:492C tal cual."""
    declara(trio, base, base + 4 * n, nom, "%d x [patron volteado][origen lo][hi]"
            "[patron normal] (p00:5612)" % n, lector, F=4)
    for k in range(n):
        src = palabra(trio, base + 4 * k + 1)
        if not src:
            continue                # registro a cero: ese juego no existe
        declara(trio, src, fin_rle_sprite(trio, src), "%s_%d" % (nom, k),
                "patrones de sprite en RLE (p00:49CE), el registro %d de %s" % (k, nom),
                lector, F=16)


def fin_rle_vram(trio, a):
    """p00:492C: n == 0 acaba; n < 0x80 repite; 0x80 [lo][hi] otra direccion;
    n > 0x80 copia n & 0x7F."""
    while True:
        n = leer(trio, a)
        a += 1
        if n == 0:
            return a
        if n < 0x80:
            a += 1
        elif n == 0x80:
            a += 2
        else:
            a += n & 0x7F


def sprites():
    T = T131415
    L = "p00:5396"
    tabla_de_palabras(T, 0xADDC, 13, "sprites_de_enemigo", "los patrones de "
                      "sprite de cada tipo de enemigo 1-13 (p15:ADDA[tipo]; 0 en "
                      "los 8, 9 y 10, que p00:538C se salta)", L)
    for t in range(1, 14):
        x = palabra(T, 0xADDA + 2 * t)
        if x:
            declara(T, x, fin_rle_vram(T, x + 2), "sprites_tipo_%d" % t,
                    "[direccion de VRAM] y RLE (p00:4926) con los patrones del "
                    "enemigo de tipo %d" % t, L, F=16)
    T = (1, 2, 15)
    L = "p01:770F"
    tabla_de_palabras(T, 0xB580, 13, "piezas_por_tipo", "la ventana de "
                      "p15:B59A de cada tipo de enemigo 1-13 (p15:B57E[tipo], p01:7709)", L)
    tabla_de_palabras(T, 0xB59A, 24, "piezas", "punteros a listas de piezas; "
                      "cada tipo lee el de (ix+0x10) desde su ventana (p01:7712)", L)
    for x in sorted({palabra(T, 0xB59A + 2 * i) for i in range(24)}):
        declara(T, x, x + 1 + 2 * leer(T, x), "piezas_%04X" % x, "[n] y n x 2 "
                "bytes a la ficha del enemigo (p01:771E, p01:789F)", L, F=16)
    for a, b, tipo in ((0xB6D2, 0xB6E2, "2"), (0xB6E2, 0xB6E6, "8"),
                       (0xB6E6, 0xB6EA, "4"), (0xB6EA, 0xB6EE, "los demas"),
                       (0xB6EE, 0xB6FE, "7")):
        declara(T, a, b, "desplazamientos_%04X" % a, "pares [dy][dx] que p01:78CF "
                "suma a la posicion del enemigo de tipo %s (p01:78E5)" % tipo, "p01:78E5", F=2)
    L = "p02:8A42"
    tabla_de_palabras(T, 0xB6FE, 5, "plantillas", "las plantillas de "
                      "desplazamientos 0x80-0x84 de los fotogramas (p02:8A7E)", L)
    declara(T, 0xB708, 0xB744, "plantillas_dydx", "pares [dy][dx] de las "
            "plantillas 0x80-0x84 (p02:8A85)", L, F=2)
    tabla_de_palabras(T, 0xB744, 156, "fotogramas", "el fotograma (ix+0x10) "
                      "de cada pieza de sprite (p02:8A49)", L)
    declara(T, 0xB87C, 0xBB71, "fotogramas_datos", "los 156 fotogramas: n x "
            "[dy][dx][patron], o [0x80-0x84] y n patrones con la plantilla de "
            "p15:B6FE; n es (ix+0x20), lo que dejo la lista de piezas (p02:8A55)",
            L, F=16)
    T = T131415
    declara(T, 0xB411, 0xB491, "patrones_b411", "128 bytes (4 sprites de 16x16) "
            "que p00:5421 copia a la VRAM 0xFE00 si C no es cero", "p00:5421", F=16)
    declara(T, 0xB491, 0xB511, "patrones_b491", "128 bytes (4 sprites de 16x16) "
            "que p00:5421 copia a la VRAM 0xFE00 si C es cero", "p00:5421", F=16)
    declara(T, 0xB511, fin_rle_vram(T, 0xB511), "patrones_b511", "RLE (p00:492C) "
            "de patrones de sprite a la VRAM 0xFFC0", "p00:53A0", F=16)
    registros_de_sprite(T789, 0x9338, 54, "juegos_de_sprites", "p00:5609")
    declara(T789, 0x9410, 0x9446, "juego_acompanante", "54 bytes: el juego de "
            "sprites que p00:55F0 carga ademas del A (p08:9410[A - 1]; 0 = ninguno)",
            "p00:55F0", F=16)
    registros_de_sprite(T, 0xA31B, 4, "sprites_a31b", "p00:5AA8")
    registros_de_sprite(T, 0xA3C1, 4, "sprites_a3c1", "p00:5ABD")
    registros_de_sprite(T, 0xA426, 4, "sprites_a426", "p00:5AB8")


def escenas():
    """Las escenas de 0xC220 (p04:7296, p04:7300, p04:734B, p04:7384)."""
    T = T456
    declara(T, 0x72AE, 0x72C6, "escenas_mapa", "12 palabras: el mapa RLE de "
            "fichas de cada escena 0-11 a 0xD200 (p04:72A1: p04:72AE[0xC220]); la 4 "
            "y la 7 no lo leen (p04:729B, p04:729F)", "p04:7296", F=2)
    for k in range(12):
        if k in (4, 7):
            continue
        rle(T, palabra(T, 0x72AE + 2 * k), "escena_%d_mapa" % k,
            "el mapa de fichas de la escena %d" % k, "p04:72A7")
    declara(T, 0x8FA9, 0x8FA9 + 0x24, "escena_4_mapa", "36 bytes que p04:72D3 "
            "copia tal cual a 0xD200 (la escena 4)", "p04:72D3", F=12)
    rle(T, 0x90F8, "escena_8_dibujo", "5 x 7 fichas que p04:72DF pinta en "
        "(0x98, 0x20)", "p04:72DF")
    rle(T, 0x93C6, "pantalla_p73B4", "fichas a 0xD200 (p04:73B4)", "p04:73B4")
    declara(T, 0x733B, 0x734B, "escenas_listas", "4 + 4 palabras: la tabla de "
            "colores y la lista de fichas de las escenas 8-11 (p04:731E)", "p04:731E", F=2)
    for k in range(4):
        lista_de_fichas(T, palabra(T, 0x7343 + 2 * k), palabra(T, 0x733B + 2 * k),
                        "fichas_escena_%d" % (8 + k), "p04:731E")
    lista_de_fichas(T, 0x7B3D, 0x7AED, "fichas_escenas_2_6", "p04:7315")
    lista_de_fichas(T, 0x80BC, 0x80B2, "fichas_escena_4", "p04:7332")
    for a, lector in ((0x8855, "p04:734B"), (0x88CE, "p04:7354"), (0x8AE8, "p04:737E")):
        declara(T, a, fin_rle_vram(T, a), "patrones_%04X" % a, "RLE de patrones "
                "de sprite (p00:492C)", lector, F=16)
    tabla_de_palabras(T, 0xB3DE, 12, "escenas_paleta", "la paleta de cada escena "
                      "(p04:7387: p06:B3DE[0xC220])", "p04:7384")
    for x in sorted({palabra(T, 0xB3DE + 2 * k) for k in range(12)}):
        paleta(T, x, "paleta_escena_%04X" % x, "p04:7384")
    paleta(T, 0xB3D4, "paleta_p73AE", "p04:73AE")
    texto(T, 0x73BD, "texto_p73A5", "p04:73A5")


def fin_hasta_ff(trio, a):
    while leer(trio, a) != 0xFF:
        a += 1
    return a + 1


def fin_rotulo(trio, a):
    """p05:94A3: fichas; 0xFE [dx] baja una fila; 0xFF acaba."""
    while True:
        c = leer(trio, a)
        a += 1
        if c == 0xFF:
            return a
        if c == 0xFE:
            a += 1


def titulo():
    """La presentacion (p05:9430, p05:96B5, p05:96EA) y el prologo (p05:9840)."""
    T = T456
    lista_de_fichas(T, 0x9241, 0x9231, "fichas_p9665", "p05:9665")
    for a, n in ((0x94C3, 13), (0x950B, 13), (0x9550, 26)):
        rle(T, a, "caracteres_%04X" % a, "%d caracteres de 1 bit que p05:9453 "
            "pinta con L_4CBF" % n, "p05:9453")
    paleta(T, 0x9614, "paleta_titulo", "p05:9435")
    declara(T, 0x9624, fin_rotulo(T, 0x9624), "rotulo_titulo", "fichas del "
            "rotulo (p05:94A3): 0xFE [dx] baja una fila, 0xFF acaba", "p05:943E", F=16)
    declara(T, 0x96AB, 0x96B5, "coordenadas_por_ruina", "5 palabras: (X, Y) de "
            "pantalla por ruina (p05:968C: p05:96AB[0xC21D])", "p05:968C", F=2)
    declara(T, 0x96CD, fin_rle_vram(T, 0x96CF), "patrones_p96CA", "[direccion "
            "de VRAM] y RLE de patrones de sprite (p00:4926)", "p05:96CA", F=16)
    texto(T, 0x9736, "texto_p9728", "p05:9728")
    declara(T, 0x9782, 0x9792, "tabla_p975F", "8 x 2 bytes que p05:9768 copia a "
            "0xDE00 segun ((0xCA05) >> 2) & 7", "p05:975F", F=2)
    declara(T, 0x98B1, fin_hasta_ff(T, 0x98B1), "prologo_no_japones",
            "el texto del prologo, caracteres hasta 0xFF; p05:9853 lo elige si la "
            "BIOS no es japonesa (0x002B)", "p05:9853", F=16)
    declara(T, 0x994D, fin_hasta_ff(T, 0x994D), "prologo_japones",
            "el texto del prologo en japones, caracteres hasta 0xFF (p05:984E, "
            "BIOS japonesa)", "p05:984E", F=16)
    rle(T, 0x9988, "fichas_p96F4", "a 0xE400 (p05:96F4)", "p05:96F4")
    lista_de_fichas(T, 0x9A4B, 0x9A29, "fichas_p96BE", "p05:96BE")


def fin_lineas(trio, a):
    """p00:55CE: [d][e][b] hasta 0xFF."""
    while leer(trio, a) != 0xFF:
        a += 3
    return a + 1


def lineas(trio, a, nom, lector):
    declara(trio, a, fin_lineas(trio, a), nom, "lineas [X][Y][largo] hasta 0xFF "
            "(p00:55CE verticales con L_4B0C, p00:55D1 horizontales con L_4AD4)",
            lector, F=3)


def banco6():
    """El final y el marcador de los personajes (p05:9EEC, p06:A249-A52D)."""
    T = T456
    declara(T, 0xA226, fin_rle_vram(T, 0xA228), "patrones_p9EEC", "[direccion de "
            "VRAM] y RLE de patrones de sprite (p00:4926)", "p05:9EEC", F=16)
    texto(T, 0xA173, "texto_p9EF2", "p05:9EF2")
    lineas(T, 0xA200, "lineas_p9F82", "p05:9F82")
    lineas(T, 0xA21F, "lineas_p9F7C", "p05:9F7C")
    declara(T, 0xA2BB, 0xA2C3, "nombres_de_ruina", "4 palabras: el nombre de las "
            "ruinas 1-4 (p06:A249: p06:A2B9[0xC21D]; p06:A35D: p06:A2BB[4 - B])",
            "p06:A249", F=2)
    for k in range(4):
        x = palabra(T, 0xA2BB + 2 * k)
        declara(T, x, fin_hasta_ff(T, x + 1), "nombre_ruina_%d" % (k + 1),
                "[X] y el nombre hasta 0xFF; p06:A385 lo compara con 0xE360",
                "p06:A249", F=16)
    declara(T, 0xA3C8, 0xA410, "teclado", "9 filas x 8 teclas: el caracter de "
            "cada tecla de la matriz (p06:A3AA: fila de SNSMAT * 8 + bit)",
            "p06:A3A9", F=8)
    texto(T, 0xA60A, "texto_pA443", "p06:A443")
    for base, var, lector in ((0xA644, "0xC2B6", "p06:A4C4"), (0xA64C, "0xC2D6", "p06:A4DF")):
        tabla_de_palabras(T, base, 4, "retratos_%04X" % base, "el retrato de 6x6 "
                          "fichas segun %s (0-3)" % var, lector)
        for k in range(4):
            x = palabra(T, base + 2 * k)
            declara(T, x, x + 36, "retrato_%04X" % x, "6 x 6 numeros de ficha "
                    "que p06:A4F5 pinta con L_4DB4", lector, F=6)
    for a, lector in ((0xA7B4, "p06:A47C"), (0xA7BB, "p06:A482"), (0xA7C8, "p02:80E4"),
                      (0xA7CF, "p02:80F3"), (0xA7D6, "p02:80E9"), (0xA7DD, "p02:80F8")):
        lineas(T, a, "lineas_%04X" % a, lector)
    lista_de_fichas(T, 0xA7F8, 0xA7E4, "fichas_pA45C", "p06:A45C")
    paleta(T, 0xB351, "paleta_pA465", "p06:A465")
    paleta(T, 0xB550, "paleta_p53E6", "p00:53E6")
    texto(T, 0xA270, "texto_pA26A", "p06:A26A")
    texto(T, 0xA27A, "texto_pA324", "p06:A324")
    for a, var, lector in ((0xA774, "0xC2B6", "p02:81DB"), (0xA794, "0xC2D6", "p02:81E7")):
        declara(T, a, a + 32, "caritas_%04X" % a, "2 fases (0xC8AC) x 4 estados "
                "(%s) x 2x2 fichas que p02:81F1 pinta con p06:BA24" % var, lector, F=4)
    usadas = (0xAE2D, 0xAE38, 0xAE64, 0xAE6F, 0xAE7A, 0xAE90, 0xAE9B, 0xAF4B, 0xAF56, 0xAF61)
    declara(T, 0xAE2D, 0xAF6C, "plantillas_de_actor", "29 x 11 bytes que p00:5596 "
            "copia a (ix+7); tienen lector con inmediato las de %s (p02:91EE, "
            "94B0, 953A, 95E7, 96C1, 975D, 9784, p03:A619, A6BF, A74B); las otras "
            "19 van con el mismo paso, sin lector a la vista"
            % ", ".join("%04X" % u for u in usadas), "p00:5596", F=11)
    rle(T, 0xB105, "dibujo_p51E0", "14 x 14 fichas a 0xE800 que p00:5206 pinta en "
        "(0x60, 0x90) de la pagina 1", "p00:51E0")
    tabla_de_palabras(T, 0xB18A, 5, "remiendos", "los remiendos del dibujo de "
                      "p06:B105 por ruina; p00:51EF aplica del 0 a 0xC21D", "p00:5248")
    for k in range(5):
        x = palabra(T, 0xB18A + 2 * k)
        a = x
        while leer(T, a):
            b, c = leer(T, a + 2), leer(T, a + 3)
            a += 4 + b * c
        declara(T, x, a + 1, "remiendo_%d" % k, "[lo][hi] en 0xE800, [ancho][alto] "
                "y las fichas (0 no se copia), hasta un 0 (p00:524E)", "p00:5248", F=16)
    paleta(T, 0xB35B, "paleta_vacia", "p00:5408")
    tabla_de_palabras(T, 0xB444, 4, "paletas_p6526", "la paleta de p04:6526 "
                      "(p06:B444[4 - A])", "p04:6526")
    for k in range(4):
        paleta(T, palabra(T, 0xB444 + 2 * k), "paleta_p6526_%d" % k, "p04:6526")
    declara(T, 0xB569, 0xB5A8, "piezas2_por_tipo", "63 bytes: el indice en "
            "p06:B5A8 de cada tipo de actor (p02:8769)", "p02:8769", F=16)
    tabla_de_palabras(T, 0xB5A8, 11, "piezas2", "las listas de p02:8787", "p02:8776")
    declara(T, 0xB5BE, 0xB5EB, "piezas2_listas", "pares que p02:8787 copia a la "
            "ficha del actor, (ix+0x20) por tipo", "p02:8787", F=2)
    declara(T, 0xB5EB, 0xB62A, "por_tipo_ix12", "63 bytes: (ix+0x12) de cada tipo "
            "de actor (p02:86D4)", "p02:86D4", F=16)
    declara(T, 0xB62A, 0xB669, "por_tipo_ix20", "63 bytes: (ix+0x20), las piezas "
            "de cada tipo de actor (p02:8641)", "p02:8641", F=16)
    declara(T, 0xB7ED, 0xB7F5, "otros_cartuchos", "4 x 2 bytes: 07 49, 07 50, "
            "07 51 y 07 52, lo que p06:B78D-B7C6 busca en 0x4012 de cada ranura "
            "(RDSLT) y apunta en los bits 0-3 de 0xC205", "p06:B78D", F=2)
    declara(T, 0xB8F3, 0xB8FB, "tablas_pB8A5", "2 x 4 bytes que p06:B8BD y "
            "p06:B8AE copian a 0xCC20 segun 0xC2B0 y 0xC2D0", "p06:B8A5", F=4)
    for a, n, f, c in ((0xBD80, 25, 5, 5), (0xBD99, 12, 3, 4), (0xBDA5, 42, 6, 7),
                       (0xBDCF, 12, 3, 4), (0xBDDB, 8, 4, 2)):
        declara(T, a, a + n, "bloque_%04X" % a, "%d x %d fichas que p06:B9D8 "
                "compone en la pagina 1 (marcos y hojas de las puertas)" % (c, f),
                "p06:B9D8", F=f)
    tabla_de_palabras(T, 0xBDE3, 5, "dibujos_por_ruina", "el dibujo de 4x4 fichas "
                      "de cada ruina (p06:BA43)", "p06:BA3B")
    declara(T, 0xBDED, 0xBE2D, "dibujos_4x4", "4 dibujos de 4x4 fichas "
            "(p06:BA4E); la ruina 3 repite el de la 0", "p06:BA3B", F=4)
    declara(T, 0xBE2D, 0xBE3D, "desplazamientos_pBAAA", "8 pares [dx][dy] "
            "(p06:BACA, p06:BC86): BE2D y BE35", "p06:BAAA", F=2)
    declara(T, 0xBE3D, 0xBE5B, "puertas", "5 x 6 bytes: las puertas de la "
            "antesala de cada ruina, hasta 0xFF (p06:B870); bit 0 grande, el resto X",
            "p06:B870", F=6)
    for a, lector in ((0xBE5B, "p06:BB3E"), (0xBE69, "p06:BB34"), (0xBE88, "p06:BB9A"),
                      (0xBE97, "p06:BBA6"), (0xBEB7, "p06:BB9F"), (0xBEC6, "p06:BBAB"),
                      (0xBEDA, "p06:BB43"), (0xBEEA, "p06:BBBE"), (0xBEFA, "p06:BBCD"),
                      (0xBF1B, "p06:BBED"), (0xBF29, "p06:BBE8")):
        texto(T, a, "texto_%04X" % a, lector)
    declara(T, 0xBF64, 0xBF6C, "tablas_pB8D0", "2 x 4 bytes (p06:B8D0, p06:B8D5)",
            "p06:B8C5", F=4)
    declara(T, 0xBF6C, 0xBF88, "personajes_al_empezar", "2 x 14 bytes que "
            "p00:5ED0 copia a 0xC2B0 y 0xC2D0 (las fichas de los dos personajes); "
            "p06:BC36 copia uno de los dos", "p00:5ED0", F=14)
    declara(T, 0xBF88, fin_rle_vram(T, 0xBF8A), "patrones_pBC30", "[direccion de "
            "VRAM] y RLE de patrones de sprite (p00:4926)", "p06:BC30", F=16)
    for a, lector in ((0xB21B, "p01:6A8D"), (0xB238, "p01:6A9F")):
        declara(T, a, fin_rle_vram(T, a), "patrones_%04X" % a, "RLE de patrones de "
                "sprite (p00:492C) a la VRAM 0xE880-0xE8C0", lector, F=16)
    declara(T, 0xAF6E, 0xAF70, "colores_pAF78_1", "la segunda palabra de la tabla "
            "de colores p06:AF6C (apunta a p06:AF74); la lista p06:AF78 solo usa la "
            "primera", "p00:53AF", F=2)
    declara(T, 0xAF74, 0xAF78, "colores_pAF78_1b", "4 colores (0D 0E 0F 00) a los que "
            "apunta p06:AF6E; la lista p06:AF78 no los usa", "p00:53AF", F=4)
    declara(T, 0xB669, 0xB66A, "por_tipo_ix20_64", "un byte detras de los 63 de "
            "p06:B62A; ningun tipo lo lee", "nadie", F=1)
    declara(T, 0xBF44, 0xBF64, "pares_sin_lector", "16 pares de bytes con forma "
            "[X][Y] (20 51, 20 51, 30 51...) entre los textos y p06:BF64; SIN LECTOR "
            "A LA VISTA", "nadie", F=2)
    declara(T, 0xB6D3, 0xB751, "medidas_por_tipo", "63 x 2 bytes por tipo de "
            "actor (p01:74B1: p06:B6D3[(ix+0) - 1])", "p01:74A9", F=2)


def banco9():
    """Tablas del banco 9 (con 7-8-9 o con 9 solo en 0xA000, p00:54AF)."""
    T = T789
    L = "p02:9195"
    tabla_de_palabras(T, 0xB12B, 25, "por_fase_b12b", "la lista de cada fase "
                      "1-25 (p02:9198: p09:B12B[0xC211 - 1]; 0 = ninguna)", L)
    ws = [palabra(T, 0xB12B + 2 * i) for i in range(25)]
    for x in sorted(set(w for w in ws if w)):
        a = x
        while leer(T, a) != 0xFF:
            a += 4
        declara(T, x, a + 4, "lista_b12b_%04X" % x, "registros de 4 bytes "
                "[pantalla][n][..][..] y uno de cierre FF FF FF FF (p02:91BE para "
                "en el primer 0xFF; los otros tres no se leen); el segundo byte "
                "indexa p09:B70D (p02:91D2)", L, F=4)
    declara(T, 0xB70D, 0xB74A, "tabla_p91D2", "61 bytes que p02:91D3 lee con el "
            "segundo byte de cada registro de p09:B12B (menos 1)", "p02:91D2", F=16)
    declara(T, 0xB74A, 0xB781, "paleta_por_indice", "55 bytes: 0 sin paleta o "
            "1-8, la paleta de p09:B781 (p02:8280)", "p02:827F", F=16)
    tabla_de_palabras(T, 0xB781, 8, "paletas_b781", "las 8 paletas de p02:828A", "p02:827F")
    for k in range(8):
        paleta(T, palabra(T, 0xB781 + 2 * k), "paleta_b781_%d" % (k + 1), "p02:827F")
    tabla_de_palabras(T, 0xB7C9, 21, "registros_b7c9", "el registro de cada "
                      "(ix+0x0A) (p01:6FA4)", "p01:6F9F")
    for k in range(21):
        x = palabra(T, 0xB7C9 + 2 * k)
        declara(T, x, x + 1 + 4 * leer(T, x), "registro_b7c9_%d" % k, "[n] y n x 4 "
                "bytes que p01:6FC2 copia a 0xDE00 + (ix+0x0C) * 4", "p01:6F9F", F=4)
    declara(T, 0xBB25, 0xBB29, "colores_bb25", "4 colores a los que apunta la "
            "tercera palabra de p09:BB15; las listas de p09:BB32 no la usan",
            "p00:5A38", F=4)
    declara(T, 0xBB31, 0xBB32, "byte_bb31", "un byte entre los colores de "
            "p09:BB29 y la tabla p09:BB32; ninguna instruccion lo lee", "nadie", F=1)
    declara(T, 0xBAFD, 0xBB15, "fichas_por_personaje", "2 x 3 x 4 numeros de "
            "ficha (p00:5AD5, segun 0xC240)", "p00:5AD5", F=4)
    tabla_de_palabras(T, 0xBCD6, 5, "por_ruina_bcd6", "la tabla de cada ruina "
                      "(p01:6044)", "p01:603E")
    declara(T, 0xBCE0, 0xBED3, "demo_por_ruina", "las teclas de la demo de cada "
            "ruina (p09:BCD6): pares [teclas][cuadros] que p01:6017 va leyendo; "
            "0xFF acaba la demo", "p01:603E", F=2)
    declara(T, 0xBED3, 0xBF1D, "jefe_de_cada_fase", "[X][Y][tipo] del jefe de "
            "cada fase, 3 bytes por fase (cero en las salas 5): los tipos "
            "0x1E-0x21 en el mismo orden en las cinco ruinas; p02:9056 los copia "
            "a 0xC319 y p03:A9C0 crea el jefe", "p02:9050", F=3)
    declara(T, 0xBF1D, 0xBF37, "por_fase_bf1d", "un byte por fase (p00:5F2C, "
            "p01:7DF3: p09:BF1D[0xC211]): Y en el nibble alto y el lado en el bajo",
            "p00:5F26", F=16)
    declara(T, 0xBF35, 0xBF69, "por_fase_bf35", "2 bytes por fase (p01:7CC0: "
            "p09:BF35[0xC211 * 2]): pantalla y YX a 0xD510", "p01:7CBA", F=2)


def fin_maquina(trio, a):
    """p02:8059: caracteres; 0xFD salto de linea, 0xFE pausa, 0xFF acaba."""
    return fin_hasta_ff(trio, a)


def banco12():
    """Tablas del banco 12 (10-11-12, o 12 solo en 0xA000, p00:54AA)."""
    T = (1, 2, 12)
    texto(T, 0xAF48, "texto_p5383", "p00:5383")
    tabla_de_palabras(T, 0xB272, 4, "fichas_por_fase", "las 4 fichas de 2 bits de "
                      "cada fase de la ruina (p00:5346: 0xC211 - (ruina * 5 + 1))", "p00:5321")
    declara(T, 0xB27A, 0xB37A, "fichas_de_fase", "4 x 64 bytes: dos pares de "
            "fichas de 2 bits que p00:5332 y p00:5340 cargan en 0xC818 y 0xCC18",
            "p00:5321", F=16)
    declara(T, 0xB37A, 0xB37A + 44 * 8, "caracteres_p5143", "44 caracteres de 1 "
            "bit (p00:5146, L_4CBF con B = 0x2C)", "p00:5143", F=8)
    declara(T, 0xB4D2, 0xB4D2 + 100, "por_fase_b4d2", "4 bytes por fase (p02:8F76: "
            "p12:B4D2[(0xC211 - 1) * 4]) que van a 0xD500; los 8 primeros son "
            "tambien el ultimo caracter de p12:B37A", "p02:8F70", F=4)
    L = "p02:8059"
    tabla_de_palabras(T, 0xB603, 5, "textos_por_ruina", "el texto a maquina de "
                      "cada ruina (p02:801E)", "p02:801E")
    for base, n, lector in ((0xB7DC, 8, "p02:8136"), (0xB7EC, 8, "p02:813E")):
        tabla_de_palabras(T, base, n, "textos_%04X" % base, "el texto a maquina "
                          "segun el estado del personaje (+4 si 0xC208 no coincide)", lector)
    ptrs = [palabra(T, 0xB603 + 2 * i) for i in range(5)]
    ptrs += [palabra(T, 0xB7DC + 2 * i) for i in range(8)]
    ptrs += [palabra(T, 0xB7EC + 2 * i) for i in range(8)] + [0xB8A1, 0xB8AF]
    for x in sorted(set(ptrs)):
        declara(T, x, fin_maquina(T, x), "maquina_%04X" % x, "texto a maquina "
                "(p02:8059): caracteres, 0xFD linea, 0xFE pausa, 0xFF acaba", L, F=16)
    for base in (0xB73C, 0xB744, 0xB74C, 0xB754, 0xB85E):
        tabla_de_palabras(T, base, 4, "estados_%04X" % base, "el nombre de cada "
                          "estado del personaje (p02:81B2, hasta 0xFF)", "p02:8168")
        for x in sorted({palabra(T, base + 2 * i) for i in range(4)}):
            declara(T, x, fin_hasta_ff(T, x), "estado_%04X" % x, "nombre de "
                    "estado, caracteres hasta 0xFF (p02:81B6)", "p02:8168", F=16)
    declara(T, 0xB858, 0xB85E, "cabecera_p81BD", "6 bytes que p02:81BD copia a "
            "0xC8B0 antes del nombre de estado (BIOS no japonesa)", "p02:81BD", F=6)
    tabla_de_palabras(T, 0xB8BB, 25, "por_fase_b8bb", "la lista de cada fase "
                      "(p02:912A: p12:B8BB[0xC211 - 1]; 0 = ninguna)", "p02:9126")
    for x in sorted({palabra(T, 0xB8BB + 2 * i) for i in range(25)} - {0}):
        a = x
        while leer(T, a) != 0xFF:
            a += 3
        declara(T, x, a + 1, "lista_b8bb_%04X" % x, "registros de 3 bytes "
                "[pantalla][YX][..] hasta 0xFF (p02:9135)", "p02:9126", F=3)


def banco4():
    """Tablas del banco 4 (4-5-6)."""
    T = T456
    for base, que in ((0x743F, "con la BIOS japonesa"), (0x745D, "con otra BIOS (0x002B)")):
        tabla_de_palabras(T, base, 15, "textos_%04X" % base, "los 15 textos a "
                          "maquina %s (p04:73D2)" % que, "p04:73D2")
    for x in sorted({palabra(T, 0x743F + 2 * i) for i in range(30)}):
        declara(T, x, fin_hasta_ff(T, x), "maquina_%04X" % x, "texto a maquina "
                "(p04:73FD): caracteres, 0xFD linea, 0xFE pausa, 0xFF acaba",
                "p04:73D2", F=16)
    for a, n, lector in ((0x7088, 32, "p04:6A86"), (0x70A7, 24, "p04:6B3A"),
                         (0x70BE, 20, "p04:6BE5"), (0x70D1, 8, "p04:6C1D"),
                         (0x70D8, 16, "p04:6C8A"), (0x70E7, 12, "p04:6D3F"),
                         (0x70FF, 56, "p04:6D55")):
        declara(T, a, a + n, "copia_%04X" % a, "%d bytes que %s copia (ldir, o "
                "uno a uno en p04:6D87) a 0xDE00-0xDE30; el ultimo es tambien el "
                "primero de la tabla siguiente" % (n, lector), lector, F=8)
    declara(T, 0x7136, 0x7146, "tabla_p6DF8", "16 bytes: p04:6DF8 lee el de A "
            "(D para p00:55AA)", "p04:6DF8", F=16)
    lista_de_fichas(T, 0x799C, 0x798A, "fichas_p51BC", "p00:51BC")
    texto(T, 0x7146, "texto_p6F5A", "p04:6F5A")
    texto(T, 0x71C8, "texto_p6F7F", "p04:6F7F")
    declara(T, 0x71F8, 0x71FE, "escena_siguiente", "6 bytes: la escena (0xC220) "
            "que pone p04:71ED segun A", "p04:71ED", F=6)
    declara(T, 0x7239, 0x7251, "escenas_posicion", "12 palabras: (X, Y) del dibujo "
            "de cada escena (p04:7201, la 7 no)", "p04:7201", F=2)
    declara(T, 0x7251, 0x7269, "escenas_tamano", "12 palabras: filas y columnas "
            "del dibujo de cada escena para p04:7272", "p04:7210", F=2)


def lectores_de(p, ini, fin):
    """Instrucciones que apuntan a [ini, fin) del banco p con el banco puesto
    (inmediatos de 16 bits; el reparto sale del trazador de cartucho)."""
    import re
    import glob
    global _CONFIG
    try:
        _CONFIG
    except NameError:
        import bancos
        t, _ = bancos.traza_completa(ROM, os.path.join(RAIZ, "src"))
        _CONFIG = t.config_de
    ranura = None if ORG[p] < 0x6000 else (ORG[p] - 0x6000) // 0x2000
    out = []
    for f in sorted(glob.glob(os.path.join(RAIZ, "src", "usas_p*.asm"))):
        b = int(f[-6:-4])
        for ln in open(f, encoding="utf-8"):
            m = re.match(r"\t(\S.*?)\t+;([0-9a-f]{4})", ln)
            if not m or m.group(1).split()[0] in ("call", "jp", "jr", "djnz"):
                continue
            a = int(m.group(2), 16)
            for mm in re.finditer(r"\b0?([0-9a-f]{4,5})h", m.group(1)):
                v = int(mm.group(1), 16)
                if ini <= v < fin and (b == p or any(
                        s[ranura] == p for s in _CONFIG.get((b, a), ()) if ranura is not None)):
                    out.append((v, "%s:%04X" % (nombre(b), a)))
    return sorted(set(out))


def restos(huecos):
    """Huecos cortos: se declaran con los lectores que los apuntan."""
    for p, ini, fin, trio in huecos:
        ls = lectores_de(p, ini, fin)
        if ls:
            txt = ("tablas cortas que apuntan %s; el tamano de cada una sale del "
                   "lector siguiente, no de recorrerla" %
                   ", ".join("%s (0x%04X)" % (w, v) for v, w in ls[:8]))
        else:
            txt = "SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo apunta con el banco puesto"
        BLOQUES.append(dict(p=p, ini=ini, fin=fin, nombre="resto_%04X" % ini, texto=txt,
                            lectores=[w for _, w in ls][:8] or ["nadie"], F=16))


def personajes():
    """Los sprites compuestos de los dos protagonistas (p00:5B12, p00:5BC6)."""
    T = T131415
    L = "p00:5B12"
    fotos = set()
    for base, quien in ((0x97AE, "0xC240 = 0"), (0x9BCE, "0xC240 = 1")):
        tabla_de_palabras(T, base, 28, "fotogramas_%04X" % base, "4 estados x 7 "
                          "fotogramas (p00:5B06: (ix+6) * 14) del personaje con %s" % quien, L)
        fotos |= {palabra(T, base + 2 * i) for i in range(28)}
    tabla_de_palabras(T, 0x9F4A, 4, "fotogramas_9f4a", "una lista por estado "
                      "(p00:5BB3: p14:9F4A[(ix+6)])", "p00:5BAC")
    for k in range(4):
        x = palabra(T, 0x9F4A + 2 * k)
        n = leer(T, x)
        declara(T, x, x + 1 + 2 * n, "lista_9f4a_%d" % k, "[n] y n fotogramas "
                "(p00:5BB9)", "p00:5BAC", F=2)
        fotos |= {palabra(T, x + 1 + 2 * i) for i in range(n)}
    piezas = set()
    for x in sorted(fotos):
        a = x
        while leer(T, a) != 0xFF:
            piezas.add(palabra(T, a + 2))
            a += 4
        declara(T, x, a + 1, "fotograma_%04X" % x, "registros [cuenta | 0x80]"
                "[posicion][pieza lo][hi] hasta 0xFF (p00:5BD3)", "p00:5BC6", F=4)
    for x in sorted(piezas):
        declara(T, x, x + 1 + 4 * leer(T, x), "pieza_%04X" % x, "[n] y dos "
                "bloques de 2 x n bytes (columna izquierda y derecha: p00:5C45 lee "
                "(HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en 0xD600/0xD630",
                "p00:5BC6", F=16)


# Huecos cortos que no tienen lector con formato recorrido: (banco, ini, fin).
# Medidos con tools/presupuesto.py el 2026-10-12 despues de todo lo anterior;
# restos() los declara citando quien los apunta con el banco puesto.
RESTOS = [
    (2, 0x822C, 0x8231),
    (2, 0x827E, 0x827F),
    (2, 0x84A7, 0x84AC),
    (2, 0x85EF, 0x85F4),
    (2, 0x8DD6, 0x8DDC),
    (2, 0x8E26, 0x8E2E),
    (2, 0x8ED2, 0x8ED6),
    (2, 0x8FF5, 0x8FFC),
    (2, 0x903D, 0x9049),
    (2, 0x92C0, 0x92C4),
    (2, 0x9363, 0x937B),
    (2, 0x93C7, 0x93D7),
    (2, 0x9A2A, 0x9A3A),
    (3, 0xA40C, 0xA422),
    (3, 0xA530, 0xA546),
    (3, 0xA5B4, 0xA5B7),
    (3, 0xA5FA, 0xA5FD),
    (3, 0xA802, 0xA80A),
    (3, 0xA81D, 0xA837),
    (3, 0xA8E9, 0xA8ED),
    (3, 0xAA3C, 0xAA4C),
    (3, 0xAA7B, 0xAA94),
    (3, 0xABED, 0xABF5),
    (3, 0xAC62, 0xAC72),
    (3, 0xACB9, 0xACC9),
    (3, 0xB249, 0xB259),
    (3, 0xB34F, 0xB35F),
    (3, 0xB371, 0xB379),
    (3, 0xB62B, 0xB62F),
    (3, 0xB9F7, 0xBA0C),
    (3, 0xBFF1, 0xC000),
    (4, 0x6000, 0x6085),
    (4, 0x6291, 0x6292),
    (4, 0x64E7, 0x64EB),
    (4, 0x675E, 0x6764),
    (4, 0x6850, 0x685A),
    (4, 0x68D6, 0x68F6),
    (4, 0x6A3E, 0x6A78),
    (4, 0x6AA6, 0x6AAA),
    (4, 0x6B1F, 0x6B2F),
    (4, 0x6B51, 0x6B5B),
    (4, 0x6BAB, 0x6BC9),
    (4, 0x6CE7, 0x6CEA),
    (4, 0x6E8D, 0x6E91),
    (4, 0x6ED5, 0x6EDF),
    (4, 0x6FF4, 0x7024),
    (4, 0x7080, 0x7088),
    (4, 0x70F3, 0x70FF),
    (7, 0x607C, 0x607E),
    (7, 0x6096, 0x6098),
    (7, 0x60AC, 0x60B0),
    (8, 0x9446, 0x9448),
    (12, 0xB0B2, 0xB0D2),
    (12, 0xB536, 0xB593),
    (13, 0x60CC, 0x60D4),
    (13, 0x678C, 0x678E),
    (13, 0x6E2A, 0x6E2C),
    (13, 0x6FC1, 0x6FC2),
    (13, 0x73F1, 0x73FE),
    (15, 0xB631, 0xB636),
    (15, 0xBD96, 0xBEBF),
]


def banco0():
    """Tablas cortas del banco 0 con su lector."""
    T = T123
    paleta(T, 0x5A79, "paleta_c240_0", "p00:5A6C")
    paleta(T, 0x5A80, "paleta_c240_1", "p00:5A73")
    paleta(T, 0x5A8D, "paleta_p5A87", "p00:5A87")
    declara(T, 0x4575, 0x457F, "por_ruina_c2b6", "5 x 2 bytes: p00:4563 los copia a "
            "0xC2B6 y 0xC2D6 segun la ruina (0xC21D)", "p00:4563", F=2)
    declara(T, 0x4846, 0x485A, "cifras", "10 x 2 fichas: las dos mitades de cada "
            "cifra (p00:47FE, un nibble BCD por cifra)", "p00:47FE", F=2)
    declara(T, 0x4891, 0x4895, "tabla_p485F", "4 bytes: p00:485F lee uno segun "
            "el byte 6 de la ficha 0xC2B0 (p00:47ED)", "p00:485F", F=4)
    declara(T, 0x4FE6, 0x4FEE, "registros_vdp", "4 x [registro][valor] que p00:4FD0 "
            "escribe con WRTVDP: R#1 = 0x62, R#5 = 0xEF, R#6 = 0x1F, R#11 = 1",
            "p00:4FD0", F=2)
    declara(T, 0x57BC, 0x57E4, "canal_vacio", "40 bytes a cero (menos 3) que los "
            "`ldir` de p00:5757-5950 copian a cada canal de sonido antes de "
            "arrancarlo", "p00:5757", F=8)


def despachadores():
    """Las tablas pegadas detras de `call 0x408D`, tal como las mide el
    trazador de cartucho entero (src/pNN.nocode, tools/bancos.py)."""
    for p in range(16):
        ruta = os.path.join(RAIZ, "src", nombre(p) + ".nocode")
        if not os.path.exists(ruta):
            continue
        for ln in open(ruta, encoding="utf-8"):
            if not ln.startswith("0x"):
                continue
            q = ln.split(None, 2)
            ini, fin = int(q[0], 0), int(q[1], 0)
            BLOQUES.append(dict(p=p, ini=ini, fin=fin, nombre="saltos_%04X" % ini,
                                texto=q[2].strip(), lectores=["L_408D"], F=2))


def relleno():
    """La cola de 0xFF de cada banco."""
    for p in range(16):
        fin = ORG[p] + TAM_PAGINA
        a = fin
        while a > ORG[p] and ROM[p * TAM_PAGINA + (a - 1 - ORG[p])] == 0xFF:
            a -= 1
        if fin - a >= 16:
            BLOQUES.append(dict(p=p, ini=a, fin=fin, nombre="relleno_ff",
                                texto="%d bytes a 0xFF hasta el final del banco: "
                                "relleno" % (fin - a), lectores=["nadie"], F=16))


# ------------------------------------------------------------- escritura

def codigo_trazado(p):
    m = bytearray(TAM_PAGINA)
    ruta = os.path.join(RAIZ, "work", nombre(p) + ".trace.json")
    if os.path.exists(ruta):
        for k, a, b in json.load(open(ruta))["blocks"]:
            if k == "c":
                for i in range(a - ORG[p], b - ORG[p]):
                    m[i] = 1
    return m


def a_mano(p):
    out = []
    ruta = os.path.join(RAIZ, "src", nombre(p) + ".notes")
    if not os.path.exists(ruta):
        return out
    dentro = False
    for ln in open(ruta, encoding="utf-8"):
        if ln.startswith(CAB):
            dentro = True
        elif ln.startswith(FIN):
            dentro = False
        elif not dentro and ln.startswith("D "):
            q = ln.split(None, 3)
            out.append((int(q[1], 0), int(q[2], 0)))
    return out


def junta(bloques):
    """Funde los que se solapan en uno, diciendo cuantos eran."""
    bloques.sort(key=lambda b: (b["ini"], b["fin"]))
    out = []
    for b in bloques:
        if out and b["ini"] < out[-1]["fin"]:
            u = out[-1]
            u.setdefault("n", 1)
            u["n"] += 1
            u["fin"] = max(u["fin"], b["fin"])
            for l in b["lectores"]:
                if l not in u["lectores"]:
                    u["lectores"].append(l)
            u["solapa"] = u.get("solapa", "") + " (%s %04X-%04X)" % (b["nombre"], b["ini"], b["fin"])
        else:
            out.append(dict(b))
    return out


def main(argv):
    escribe = "--escribe" in argv
    fases()
    graficos()
    sonido()
    fuente()
    textos()
    banco0()
    enemigos()
    sprites()
    escenas()
    titulo()
    banco6()
    banco9()
    banco12()
    banco4()
    personajes()
    restos([(p, a, b, None) for p, a, b in RESTOS])
    objetos()
    despachadores()
    relleno()
    por = defaultdict(list)
    for b in BLOQUES:
        por[b["p"]].append(b)
    total = 0
    for p in range(16):
        cod = codigo_trazado(p)
        mano = a_mano(p)
        lineas = []
        buenos = []
        for b in por.get(p, []):
            pisa = sum(cod[i - ORG[p]] for i in range(b["ini"], b["fin"]))
            if pisa:
                AVISOS.append("%s %04X-%04X %s PISA CODIGO (%d bytes): no se escribe"
                              % (nombre(p), b["ini"], b["fin"], b["nombre"], pisa))
                continue
            if any(b["ini"] < f and i < b["fin"] for i, f in mano):
                AVISOS.append("%s %04X-%04X %s pisa una D a mano: no se escribe"
                              % (nombre(p), b["ini"], b["fin"], b["nombre"]))
                continue
            buenos.append(b)
        for b in junta(buenos):
            txt = b["texto"]
            if b.get("n"):
                txt += "; se solapan %d bloques:%s" % (b["n"], b["solapa"])
            txt += "; lo leen %s (%d bytes)" % (", ".join(b["lectores"][:8]), b["fin"] - b["ini"])
            lineas.append("D 0x%04X 0x%04X %s  %s" % (b["ini"], b["fin"], b["nombre"], txt))
            if b["F"]:
                lineas.append("F 0x%04X %s" % (b["ini"], b["F"]))
            total += b["fin"] - b["ini"]
        if lineas:
            print("%s: %d bloques, %d bytes" % (nombre(p), len([l for l in lineas if l.startswith("D ")]),
                                                sum(int(l.split()[2], 0) - int(l.split()[1], 0)
                                                    for l in lineas if l.startswith("D "))))
        if escribe:
            ruta = os.path.join(RAIZ, "src", nombre(p) + ".notes")
            filas = open(ruta, encoding="utf-8").read().split("\n") if os.path.exists(ruta) else ["# notas del banco %02d" % p, ""]
            if CAB in filas:
                i, f = filas.index(CAB), filas.index(FIN)
                filas[i:f + 1] = [CAB] + lineas + [FIN]
            else:
                while filas and filas[-1] == "":
                    filas.pop()
                filas += ["", CAB] + lineas + [FIN, ""]
            open(ruta, "w", encoding="utf-8", newline="\n").write("\n".join(filas))
    print("total %d bytes" % total)
    for a in AVISOS:
        print("AVISO:", a)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
