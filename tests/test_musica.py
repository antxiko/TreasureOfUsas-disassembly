"""La musica: el motor del banco 13 ejecutado por tools/musica.py.

Las cifras de aqui estan cotejadas contra openMSX (tools/omsx_psg.tcl y
tools/coteja_psg.py): la 0x89 entera, 1454 cuadros, deja el PSG igual que el
emulador en todos los cuadros, y la 0x84 con la altura 0x80, 6614.
"""
import os
import re
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(RAIZ, "tools"))
ROM = os.path.join(RAIZ, "usas.rom")


class Musica(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        import musica
        cls.m = musica
        cls.rom = open(ROM, "rb").read()

    def test_la_antesala_dura_lo_cotejado(self):
        cuadros, vuelta = self.m.ejecuta(self.rom, 0x89)
        self.assertEqual((len(cuadros), vuelta), (1454, 686))

    def test_todas_las_piezas_arrancan(self):
        piezas = list(self.m.piezas(self.rom))
        self.assertEqual(len(piezas), 32)
        for numero, altura, _ in piezas:
            cuadros, _ = self.m.ejecuta(self.rom, numero, maximo=120,
                                        altura=altura)
            self.assertTrue(any(cuadros), "0x%02X no escribe" % numero)

    def test_la_altura_mueve_la_nota(self):
        # el primer periodo del canal 1 de la 0x80: la altura 0x20 sube dos
        # semitonos, la 0x40 baja uno y la 0x80 dos (p13:625D)
        def primero(altura):
            for escr in self.m.ejecuta(self.rom, 0x80, maximo=60,
                                       altura=altura)[0]:
                d = dict(escr)
                if d.get(0) not in (None, 0, 0xFF):
                    return d[0]
        self.assertEqual([primero(a) for a in (None, 0x00, 0x20, 0x40, 0x80)],
                         [169, 169, 151, 179, 190])

    def test_la_87_es_la_88_y_la_8f_calla(self):
        t = self.rom[13 * 0x2000 + 0x072C:13 * 0x2000 + 0x072C + 96]
        self.assertEqual(t[7 * 6:8 * 6], t[8 * 6:9 * 6])
        self.assertEqual(self.rom[13 * 0x2000 + 0x0FC2], 0xFF)

    def test_cada_audio_de_la_web_existe(self):
        for base, carpeta in (("docs", "docs"), ("docs/es", "docs")):
            for f in os.listdir(os.path.join(RAIZ, base)):
                if not f.endswith(".md"):
                    continue
                txt = open(os.path.join(RAIZ, base, f), encoding="utf-8").read()
                for src in re.findall(r'<audio [^>]*src="([^"]+)"', txt):
                    ruta = os.path.normpath(os.path.join(RAIZ, base, src))
                    self.assertTrue(os.path.exists(ruta), "%s: %s" % (f, src))


if __name__ == "__main__":
    unittest.main()
