#!/usr/bin/env python3
"""La regla banco -> direccion del MegaROM, compartida por todas las herramientas.

The Treasure of Usas (Konami, RC-753, 1987, MSX2) es un cartucho de 128 KB
con el mapper Konami SIN SCC (Konami4): 16 bancos de 8 KB. El banco de
0x4000-0x5FFF es FIJO -no hay registro para el- y los otros tres se eligen
escribiendo el numero de banco en 0x6000 (para 0x6000-0x7FFF), 0x8000 (para
0x8000-0x9FFF) y 0xA000 (para 0xA000-0xBFFF).

Lo que dice la ROM (tools/reconocimiento.py lo vuelve a medir cada vez):
  - NO hay ni una escritura a 0x5000, 0x7000, 0x9000 ni 0xB000, que son los
    registros del mapper con SCC.
  - Los trios se meten con `ld a,N` y el reparto de p00:5490 (`inc a` entre
    registro y registro, con copia en 0xF0F1-0xF0F3): p00:547E pone 4-5-6,
    p00:5483 7-8-9, p00:5488 10-11-12 y p00:548D 13-14-15; p00:5464 pone
    1-2-3 por su cuenta y p00:56E3 13-14-15. De ahi sale la tabla: el banco
    3k+1 va a 0x6000, el 3k+2 a 0x8000 y el 3k+3 a 0xA000.
  - p00:54A5/54AA/54AF/54B4 ponen 15, 12, 9 y 6 solo en 0xA000 (p00:54B9),
    tambien en su ranura.
  - p00:4059 devuelve el trio que habia, leido de la copia en RAM: ninguna
    excepcion.

Uso como programa:
    paginas.py org <n>               imprime el org del banco n
    paginas.py lista                 imprime "n org" para los 16
    paginas.py corta <rom> <dir>     escribe <dir>/pNN.bin con cada banco
"""
import os
import sys

TAM_PAGINA = 0x2000
N_PAGINAS = 16

# banco -> direccion de ejecucion. Medido, no supuesto: ver reconocimiento.py.
ORG = {0: 0x4000}
for _b in range(1, 16):
    ORG[_b] = (0x6000, 0x8000, 0xA000)[(_b - 1) % 3]

# Escrituras al mapper que ponen un banco fuera de su ranura, medidas en
# reconocimiento.py: (banco, pc de la escritura) -> ranura.
EXCEPCIONES = {}

# Todos los bancos los selecciona alguien: aqui no hay ninguno huerfano.
NUNCA_MAPEADOS = ()


def org(p):
    """Direccion en la que se ejecuta el banco p."""
    return ORG[p]


def nombre(p):
    """Nombre del modulo del banco p: p00..p15."""
    return "p%02d" % p


def main(argv):
    if len(argv) < 2:
        sys.exit(__doc__)
    if argv[1] == "org":
        print("%#06x" % org(int(argv[2], 10)))
    elif argv[1] == "lista":
        for p in range(N_PAGINAS):
            print("%d %#06x" % (p, org(p)))
    elif argv[1] == "corta":
        rom, dst = argv[2], argv[3]
        d = open(rom, "rb").read()
        if len(d) != TAM_PAGINA * N_PAGINAS:
            sys.exit("la ROM mide %d bytes y no %d" % (len(d), TAM_PAGINA * N_PAGINAS))
        os.makedirs(dst, exist_ok=True)
        for p in range(N_PAGINAS):
            with open(os.path.join(dst, nombre(p) + ".bin"), "wb") as f:
                f.write(d[p * TAM_PAGINA:(p + 1) * TAM_PAGINA])
        print("16 bancos de %d bytes en %s/" % (TAM_PAGINA, dst))
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main(sys.argv)
