#!/usr/bin/env python3
"""Lo que se ha MEDIDO del cartucho, clavado para que no se deshaga solo.

Estas comprobaciones necesitan la ROM, y si no esta **fallan**: no se saltan.
Cada una lee el binario: ninguna compara una constante contra si misma.
"""
import hashlib
import os
import subprocess
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.path.join(RAIZ, "tools")
sys.path.insert(0, TOOLS)

ROM = os.path.join(RAIZ, "usas.rom")
SHA = "11e0b842a8bddbeafd1662cd102678a74415dad0f45b8f914cad11f1b344c809"

FALTA = ("falta usas.rom en la raiz del repo. Son los 131.072 bytes de The "
         "Treasure of Usas (Konami, RC-753, 1987, MSX2), y no se distribuyen "
         "aqui: pon tu copia. El sha256 tiene que ser %s" % SHA)


class Cartucho(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        if not os.path.exists(ROM):
            raise AssertionError(FALTA)
        with open(ROM, "rb") as f:
            cls.rom = f.read()

    def test_es_la_misma_rom(self):
        self.assertEqual(len(self.rom), 131072)
        self.assertEqual(hashlib.sha256(self.rom).hexdigest(), SHA)

    def test_cabecera_ab(self):
        """0x4000 'AB', INIT 0x4097 y los otros tres vectores a cero."""
        self.assertEqual(self.rom[0:2], b"AB")
        self.assertEqual(self.rom[2] | (self.rom[3] << 8), 0x4097)
        self.assertEqual(self.rom[4:10], b"\x00" * 6)

    def test_segunda_cabecera_rc753(self):
        """0x4010: 'CD', 0x07 y 0x53, o sea RC-753."""
        self.assertEqual(self.rom[0x10:0x14], bytes([0x43, 0x44, 0x07, 0x53]))

    def test_busca_los_otros_cartuchos(self):
        """p06:B7ED: los numeros 07 49, 07 50, 07 51 y 07 52 que p06:B78D
        compara con 0x4012 de cada ranura."""
        o = 6 * 0x2000 + (0xB7ED - 0xA000)
        self.assertEqual(self.rom[o:o + 8], bytes([7, 0x49, 7, 0x50, 7, 0x51, 7, 0x52]))

    def test_screen5_por_la_bios(self):
        """p00:4FB0: ld a,5 / call 0x005F (CHGMOD)."""
        self.assertEqual(self.rom[0xFB0:0xFB5], bytes([0x3E, 0x05, 0xCD, 0x5F, 0x00]))

    def test_reparto_de_bancos(self):
        """tools/reconocimiento.py: la regla banco -> org la cumplen todas."""
        r = subprocess.run([sys.executable, os.path.join(TOOLS, "reconocimiento.py"), ROM],
                           capture_output=True, text=True, cwd=TOOLS)
        self.assertIn("OK: la regla banco -> org", r.stdout.strip().splitlines()[-1])


if __name__ == "__main__":
    unittest.main()
