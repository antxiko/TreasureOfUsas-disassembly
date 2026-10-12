#!/usr/bin/env python3
"""Coteja el PSG de openMSX (tools/omsx_psg.tcl) con tools/musica.py.

Por cada musica que el juego pide en la partida grabada (`S nn alt marcha`),
toma las escrituras al PSG cuadro a cuadro desde ese momento hasta la
siguiente peticion y las compara con las que da musica.py ejecutando el mismo
motor desde cero, con la misma altura (0xC122) y la misma bandera de musica de
fase (0xC121).

Solo cuentan los registros 0-13: el 14 y el 15 son los puertos del mando, que
la BIOS toca por su cuenta.

Uso:  coteja_psg.py work/psg/psg.txt
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import musica  # noqa: E402


def lee(ruta):
    """[(peticion, registros, [cuadro, ...])]: cada cuadro, la lista de
    (registro, dato); `registros`, como estaba el PSG al pedirla."""
    tramos, actual, cuadro = [], None, None
    psg = [0] * 14
    for ln in open(ruta):
        p = ln.split()
        if not p:
            continue
        if p[0] == "S":
            actual = ((int(p[1]), int(p[2]), int(p[3])), list(psg), [])
            tramos.append(actual)
            cuadro = None
        elif p[0] == "F":
            if actual is not None:
                cuadro = []
                actual[2].append(cuadro)
        elif p[0] == "W":
            r, v = int(p[1]), int(p[2])
            if r < 14:
                psg[r] = v
                if cuadro is not None:
                    cuadro.append((r, v))
    return tramos


def main(ruta):
    rom = open(musica.ROM, "rb").read()
    malos = 0
    for (a, alt, marcha), inicial, cuadros in lee(ruta):
        if a < 0x80 or a >= 0xFD:
            continue
        altura = alt if marcha else None
        mios, _ = musica.ejecuta(rom, a, maximo=len(cuadros) + 1,
                                 altura=altura)
        n = min(len(cuadros), len(mios))
        # Lo que suena: el estado del PSG al acabar cada cuadro, partiendo del
        # mismo estado del chip. Las escrituras de un cuadro van todas juntas
        # al principio de la interrupcion.
        ellos, nos = list(inicial), list(inicial)
        distinto = None
        for i in range(n):
            for r, v in cuadros[i]:
                ellos[r] = v
            for r, v in mios[i]:
                nos[r] = v
            if ellos != nos and distinto is None:
                distinto = (i, list(ellos), list(nos))
        iguales = sum(1 for i in range(n) if cuadros[i] == mios[i])
        escr = sum(len(c) for c in cuadros[:n])
        if distinto is None:
            print("0x%02X altura 0x%02X: %d cuadros (%d escrituras): el PSG "
                  "IGUAL en todos; escrituras identicas en %d"
                  % (a, alt, n, escr, iguales))
        else:
            malos += 1
            i, e, m = distinto
            print("0x%02X altura 0x%02X: %d cuadros, el PSG DISTINTO en el %d"
                  "\n   openMSX %s\n   musica  %s" % (a, alt, n, i, e, m))
    return 1 if malos else 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
