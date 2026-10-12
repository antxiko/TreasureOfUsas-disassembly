#!/usr/bin/env python3
"""Las fases, antesalas y bloques de datos tal como los lee tools/fases.py y
tools/bloques.py. Necesitan la ROM: sin ella fallan."""
import os
import subprocess
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.path.join(RAIZ, "tools")
sys.path.insert(0, TOOLS)

import fases     # noqa: E402


class Fases(unittest.TestCase):

    def test_pantallas_por_fase(self):
        """48 bytes por pantalla (8 x 6 metabloques) y estas cuentas."""
        cuentas = [len(fases.mapa(f)) for f in range(1, 26)]
        self.assertEqual(cuentas, [8, 11, 9, 8, 8, 9, 12, 11, 8, 8, 8, 9, 11, 13, 13,
                                   13, 9, 11, 11, 11, 11, 14, 13, 12, 12])

    def test_las_fases_5k_repiten_el_mapa_de_la_anterior(self):
        """p10:6000: la 5, 10, 15, 20 y 25 apuntan al mismo RLE que la 4, 9..."""
        from rom import palabra, T101112
        for f in (5, 10, 15, 20, 25):
            self.assertEqual(palabra(T101112, 0x5FFE + 2 * f),
                             palabra(T101112, 0x5FFE + 2 * (f - 1)))

    def test_vecinas_vuelven(self):
        """Cada salida tiene su vuelta, salvo la 7 -> 11 de la fase 21 (un sentido)."""
        for f in range(1, 26):
            if f % 5 == 0:
                continue
            _, problemas = fases.disposicion(f)
            if f == 21:
                self.assertEqual(problemas, ["7 -arriba-> 11 no vuelve (None)"])
            else:
                self.assertEqual(problemas, [], "fase %d" % f)

    def test_metabloques_alcanzan(self):
        """Ningun mapa usa un metabloque que su ruina no tenga."""
        for f in range(1, 26):
            n = len(fases.metabloques((f - 1) // 5))
            for p in fases.mapa(f):
                self.assertLess(max(p), n, "fase %d" % f)

    def test_antesalas(self):
        """Tres pantallas por antesala y cinco puertas por ruina (p06:BE3D)."""
        for r in range(5):
            self.assertEqual(len(fases.mapa_antesala(r)), 3)
            self.assertEqual(len(fases.puertas_de_antesala(r)), 5)

    def test_sala5_una_pantalla(self):
        self.assertEqual(len(fases.mapa_sala5()), 1)


class Bloques(unittest.TestCase):

    def test_bloques_sin_avisos(self):
        """tools/bloques.py no pisa codigo ni D a mano, ni deja bloques fuera."""
        r = subprocess.run([sys.executable, os.path.join(TOOLS, "bloques.py")],
                           capture_output=True, text=True, cwd=TOOLS)
        self.assertEqual(r.returncode, 0, r.stderr)
        self.assertNotIn("AVISO", r.stdout)

    def test_semillas_justificadas(self):
        """Cada semilla y cada sitio forzado dice de donde sale."""
        for nom in ("semillas.txt", "sitios.txt", "tablas.txt"):
            for ln in open(os.path.join(RAIZ, "src", nom), encoding="utf-8"):
                if ln.strip() and not ln.startswith("#"):
                    self.assertIn("#", ln, "%s: %s" % (nom, ln))


if __name__ == "__main__":
    unittest.main()
