#!/usr/bin/env python3
"""Lo que se afirma del listado: que explica el cartucho entero.

Necesita los trazados de work/ (los hace `make trace`, que a su vez necesita
la ROM); sin ellos falla diciendo que falta, no se salta.
"""
import os
import subprocess
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.path.join(RAIZ, "tools")


class Listado(unittest.TestCase):

    def test_ni_un_byte_sin_explicar(self):
        """tools/presupuesto.py: cada byte es codigo trazado o una D con nombre."""
        if not os.path.exists(os.path.join(RAIZ, "work", "p00.trace.json")):
            raise AssertionError("faltan los trazados de work/: haz `make trace`")
        r = subprocess.run([sys.executable, os.path.join(TOOLS, "presupuesto.py"),
                            os.path.join(RAIZ, "work"), os.path.join(RAIZ, "src")],
                           capture_output=True, text=True, cwd=TOOLS)
        linea = next(l for l in r.stdout.splitlines() if l.strip().startswith("sin explicar"))
        self.assertEqual(int(linea.split()[2]), 0, linea)

    def test_toda_llamada_a_otro_banco_va_a_una_rutina_con_nombre(self):
        """Un `call`/`jp` a 0x6000-0xBFFF de otro banco: su destino, en RUTINAS.

        sin_bautizar.py solo ve las llamadas del propio banco; esto mira las
        que cruzan el mapper con el banco que resuelve tools/anota.py."""
        import re
        sys.path.insert(0, TOOLS)
        import anota
        from anotaciones import BANCOS, RUTINAS
        medido, sin = anota.medidas(), []
        for b in BANCOS:
            filas = anota.listado(b)
            ventanas = anota.ventanas_de(filas, b)
            for k, (a, t) in enumerate(filas):
                m = re.match(r"(?:call|jp)\s+(?:(?:nz|z|nc|c|po|pe|p|m),)?0([0-9a-f]{4})h$", t)
                if not m or int(m.group(1), 16) < 0x6000:
                    continue
                d = int(m.group(1), 16)
                bb = anota.destino_de(b, a, d, k, ventanas, medido)
                if (bb, d) not in RUTINAS:
                    sin.append("p%02d:%04X -> p%s:%04X" % (b, a, "??" if bb is None else "%02d" % bb, d))
        self.assertEqual(sin, [])

    def test_el_makefile_y_paginas_py_dicen_lo_mismo(self):
        sys.path.insert(0, TOOLS)
        from paginas import ORG
        mk = open(os.path.join(RAIZ, "Makefile"), encoding="utf-8").read()
        for p, o in ORG.items():
            self.assertIn("ORG_%02d = %#06x" % (p, o), mk)


if __name__ == "__main__":
    unittest.main()
