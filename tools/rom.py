#!/usr/bin/env python3
"""Leer la ROM de The Treasure of Usas como la lee el cartucho: con el mapper.

Una direccion de 0x6000-0xBFFF no dice nada sin el trio de bancos puesto
(tools/paginas.py): con 7-8-9 (p00:5483), 0x6000 es el banco 7, 0x8000 el 8
y 0xA000 el 9. 0x4000-0x5FFF es siempre el banco 0.

Los dos lectores del banco 0 que usa casi todo:
  L_543A   HL = palabra A de la tabla HL (add a,a / L_4083 / ld a,(hl) ...).
  L_5578   RLE de DE a HL: n == 0 acaba; n < 0x80 repite el byte siguiente
           n veces; n > 0x80 copia n & 0x7F bytes tal cual; 0x80 no hace
           nada.
"""
import os

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
RUTA_ROM = os.environ.get("USAS_ROM", os.path.join(RAIZ, "usas.rom"))
ROM = open(RUTA_ROM, "rb").read()

# Los trios que ponen las rutinas del banco 0 (tools/paginas.py)
T123 = (1, 2, 3)        # p00:5464
T456 = (4, 5, 6)        # p00:547E
T789 = (7, 8, 9)        # p00:5483
T101112 = (10, 11, 12)  # p00:5488
T131415 = (13, 14, 15)  # p00:548D


def banco(trio, a):
    """El banco que hay en la direccion a con el trio puesto."""
    if 0x4000 <= a < 0x6000:
        return 0
    return trio[(a - 0x6000) >> 13]


def desplazamiento(trio, a):
    """La posicion en el fichero de la ROM del byte a."""
    return banco(trio, a) * 0x2000 + (a & 0x1FFF)


def leer(trio, a):
    return ROM[desplazamiento(trio, a)]


def palabra(trio, a):
    return leer(trio, a) | (leer(trio, a + 1) << 8)


def bytes_de(trio, a, n):
    return bytes(leer(trio, a + i) for i in range(n))


def tabla(trio, base, i):
    """L_543A: la palabra i de la tabla base."""
    return palabra(trio, base + 2 * i)


def rle(trio, a):
    """L_5578: descomprime desde a. Devuelve (bytes, direccion tras el 0)."""
    out = bytearray()
    while True:
        n = leer(trio, a)
        a += 1
        if n == 0:
            return bytes(out), a
        if n < 0x80:
            out += bytes([leer(trio, a)]) * n
            a += 1
        elif n > 0x80:
            out += bytes_de(trio, a, n & 0x7F)
            a += n & 0x7F
