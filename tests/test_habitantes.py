#!/usr/bin/env python3
"""Lo que hay en cada pantalla: las listas de trampas, los jefes y los objetos
tal como los leen tools/enemigos.py y tools/habitantes.py."""
import os
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(RAIZ, "tools"))

from rom import leer, palabra, T131415   # noqa: E402
import enemigos                          # noqa: E402
import fases                             # noqa: E402
import habitantes                        # noqa: E402

FASES = [f for f in range(1, 25) if f % 5]


class Habitantes(unittest.TestCase):

    def test_las_listas_de_trampas_encadenan(self):
        """Con los bytes de EXTRA cada lista acaba donde empieza la siguiente."""
        listas = set()
        for f in range(1, 26):
            t = palabra(T131415, enemigos.POR_FASE + 2 * f)
            if not t:
                continue
            for p in range(len(fases.mapa(f))):
                lista = palabra(T131415, t + 2 * p)
                if 0xA000 <= lista < 0xC000:
                    listas.add(lista)
        listas = sorted(listas)

        def fin(lista):
            a = lista + 1
            for _ in range(leer(T131415, lista)):
                a += 3 + enemigos.EXTRA[leer(T131415, a)]
            return a
        mal = [hex(l) for l, sig in zip(listas, listas[1:]) if fin(l) != sig]
        self.assertGreater(len(listas), 100)
        self.assertEqual(mal, [])

    def test_los_mismos_cuatro_jefes_en_cada_ruina(self):
        for f in FASES:
            pantalla, tipo, _, _ = habitantes.jefe(f)
            self.assertEqual(tipo, 0x1E + (f - 1) % 5, "fase %d" % f)
            self.assertTrue(1 <= pantalla <= len(fases.mapa(f)), "fase %d" % f)

    def test_las_salas_5_sin_jefe(self):
        for f in (5, 10, 15, 20, 25):
            self.assertIsNone(habitantes.jefe(f))

    def test_los_objetos_caen_en_pantallas_de_su_fase(self):
        for f in FASES:
            for pantalla, _, clase in habitantes.objetos(f):
                self.assertTrue(1 <= pantalla <= len(fases.mapa(f)), "fase %d" % f)
                self.assertTrue(1 <= clase <= 13, "fase %d" % f)


if __name__ == "__main__":
    unittest.main()
