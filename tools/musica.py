#!/usr/bin/env python3
"""La musica del cartucho, EJECUTANDO su propio motor de sonido.

No se reescribe el motor en Python: se ejecuta el codigo del cartucho en
tools/z80run.py, con los mismos pasos que da el juego:

  1. `sonido_a_cero` (p00:569C) deja el motor parado, como en el arranque;
  2. `sonido` (p00:56E3) con A = el numero de la musica (0x80-0x8F) o del
     sonido, que pone los canales en 0xC010-0xC016;
  3. cada cuadro, lo mismo que la interrupcion (p00:4048-4056): los bancos
     13-14-15 en 0x6000-0xBFFF y `call 0x6000`.

El motor habla con el PSG solo por la BIOS WRTPSG (`call 0x0093`, A = el
registro, E = el dato): aqui esa direccion es una trampa que apunta la
escritura y vuelve. El resultado es la lista de escrituras de cada cuadro,
que se coteja contra el volcado de openMSX (tools/coteja_psg.py) y se pasa a
sonido con un AY-3-8910 (sintetiza()).

El MSX japones va a 60 cuadros por segundo: el motor corre 60 veces por
segundo.

Uso:  musica.py registros 0x80 [cuadros]   las escrituras, cuadro a cuadro
      musica.py mp3 0x80 salida.mp3        la musica a MP3
      musica.py todas docs/audio           las 16 musicas a MP3
"""
import hashlib
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from z80run import Z80, ParadaZ80  # noqa: E402

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ROM = os.path.join(RAIZ, "usas.rom")

SONIDO_A_CERO = 0x569C
SONIDO = 0x56E3
MOTOR = 0x6000
WRTPSG = 0x0093
CANAL_LIBRE = 0x6074          # p00:56D3: un canal sin nada que tocar
ESTADO = (0xC010, 0xC130)     # la RAM del motor: canales, mezclador, volumen

CUADROS_POR_SEGUNDO = 60
RELOJ_PSG = 1789772.5         # el PSG del MSX va a 3,58 MHz / 2
MUESTREO = 44100


class Usas(Z80):
    """El Z80 con el mapper Konami (sin SCC) y la trampa de WRTPSG."""

    def __init__(self, rom):
        super().__init__()
        self.rom = rom
        self.carga(rom[0:0x2000], 0x4000)       # el banco 0, fijo
        self.escrituras = []
        self.bancos = {}

    def pon_banco(self, ventana, banco):
        self.bancos[ventana] = banco
        self.mem[ventana:ventana + 0x2000] = \
            self.rom[banco * 0x2000:(banco + 1) * 0x2000]

    def _escribir(self, d, v):
        d &= 0xFFFF
        if 0x4000 <= d < 0xC000:
            # El mapper: 0x6000, 0x8000 y 0xA000 eligen el banco de su ventana.
            # Escribir en la ROM no cambia nada mas.
            if d >= 0x6000:
                self.pon_banco(d & 0xE000, v & 0x0F)
            return
        self.mem[d] = v & 0xFF

    def corre(self, desde, tope=2_000_000):
        centinela = 0xFFFE
        self.sp = (self.sp - 2) & 0xFFFF
        self._escribir16(self.sp, centinela)
        self.pc = desde
        self.pasos = 0
        while self.pc != centinela:
            if self.pc < 0x4000:
                if self.pc != WRTPSG:
                    raise ParadaZ80("llamada a la BIOS 0x%04X" % self.pc)
                self.escrituras.append((self.a & 0x0F, self.e))
                self.pc = self._pop()
                continue
            self.pasos += 1
            if self.pasos > tope:
                raise ParadaZ80("mas de %d instrucciones" % tope)
            self._una()


def arranca(rom, numero, altura=None):
    """El Z80 con el motor parado y el sonido `numero` pedido.

    Con `altura`, la musica de fase como la pone `musica_de_fase` (p00:54E1):
    0xC121 = 1 y 0xC122 = p15:BE7A[ruina * 4 + estado de animo]. `sonido` la
    respeta solo por debajo de 0x86 (p00:5746).
    """
    z = Usas(rom)
    z.sp = 0xF000
    for v, b in ((0x6000, 1), (0x8000, 2), (0xA000, 3)):
        z.pon_banco(v, b)
    z.corre(SONIDO_A_CERO)
    if altura is not None:
        z.mem[0xC121] = 1
        z.mem[0xC122] = altura
    cuadro(z)       # como en el juego: el motor ya ha corrido con todo parado
    z.a = numero
    z.corre(SONIDO)
    z.escrituras = []
    return z


def cuadro(z):
    """Un cuadro: lo que hace la interrupcion con el sonido (p00:4048-4056)."""
    for v, b in ((0x6000, 13), (0x8000, 14), (0xA000, 15)):
        z.pon_banco(v, b)
    z.escrituras = []
    z.corre(MOTOR)
    return z.escrituras


def ejecuta(rom, numero, maximo=60 * 300, altura=None):
    """Las escrituras de cada cuadro, y donde vuelve a empezar.

    Devuelve (cuadros, vuelta): `vuelta` es el cuadro al que salta la musica
    cuando se repite (la RAM del motor queda igual que en ese cuadro), o None
    si se acaba: los tres canales en p13:6074 y nada mas que tocar.
    """
    z = arranca(rom, numero, altura)
    cuadros, vistos = [], {}
    for n in range(maximo):
        cuadros.append(cuadro(z))
        ram = bytes(z.mem[ESTADO[0]:ESTADO[1]])
        h = hashlib.sha1(ram).digest()
        if h in vistos:
            if vistos[h] == n:          # nada cambia ya: se ha acabado
                return cuadros, None
            return cuadros, vistos[h]
        vistos[h] = n + 1
        canales = [z._leer16(0xC010 + 2 * i) for i in range(3)]
        if all(c == CANAL_LIBRE for c in canales):
            return cuadros, None
    return cuadros, None


# ---------------------------------------------------------------- el AY-3-8910

# Los 16 niveles de volumen del AY (logaritmicos), normalizados.
VOLUMEN = (0.0, 0.0137, 0.0205, 0.0291, 0.0423, 0.0618, 0.0847, 0.1369,
           0.1691, 0.2647, 0.3527, 0.4499, 0.5704, 0.6873, 0.8482, 1.0)


def sintetiza(cuadros):
    """Las escrituras de cada cuadro a muestras de 16 bits (mono, 44,1 kHz)."""
    import numpy as np

    regs = [0] * 16
    regs[7] = 0xFF
    por_cuadro = MUESTREO / CUADROS_POR_SEGUNDO
    fase = [0.0, 0.0, 0.0]
    lfsr, ruido_fase, ruido_bit = 1, 0.0, 0
    env_fase, env_paso = 0.0, 0
    salida = []
    acumulado = 0.0
    for escr in cuadros:
        for r, v in escr:
            regs[r] = v
            if r == 13:
                env_fase, env_paso = 0.0, 0
        acumulado += por_cuadro
        n = int(acumulado)
        acumulado -= n
        t = np.arange(n)
        mezcla = np.zeros(n)
        # el ruido: un LFSR de 17 bits, a RELOJ / (16 * periodo)
        np_ = (regs[6] & 0x1F) or 1
        paso_r = RELOJ_PSG / (16 * np_) / MUESTREO
        pos = ruido_fase + paso_r * t
        cambios = int(pos[-1]) if n else 0
        bits = np.empty(cambios + 1, dtype=bool)
        bits[0] = ruido_bit
        for k in range(1, cambios + 1):
            nuevo = (lfsr ^ (lfsr >> 3)) & 1
            lfsr = (lfsr >> 1) | (nuevo << 16)
            bits[k] = lfsr & 1
        ruido = bits[pos.astype(int)]
        ruido_bit = bits[-1]
        ruido_fase = (ruido_fase + paso_r * n) - cambios
        # la envolvente (registros 11-13)
        ep = (regs[11] | (regs[12] << 8)) or 1
        paso_e = RELOJ_PSG / (256 * ep) / MUESTREO * 16
        epos = env_fase + paso_e * t
        forma = regs[13] & 0x0F
        env = np.empty(n)
        idx = epos.astype(int)
        ciclo = idx // 16
        dentro = idx % 16
        sube = (forma & 4) != 0
        if forma < 8:                      # una vez y se queda a cero
            env = np.where(ciclo == 0, dentro if sube else 15 - dentro, 0)
        else:
            alterna = (forma & 2) != 0
            sostiene = (forma & 1) != 0
            if sostiene:
                fin = (15 if sube else 0) ^ (15 if alterna else 0)
                env = np.where(ciclo == 0, dentro if sube else 15 - dentro, fin)
            else:
                dir_ = (ciclo % 2 == 1) if alterna else np.zeros(n, bool)
                arriba = dir_ ^ sube
                env = np.where(arriba, dentro, 15 - dentro)
        env_fase += paso_e * n
        for c in range(3):
            tp = (regs[2 * c] | ((regs[2 * c + 1] & 0x0F) << 8)) or 1
            f = RELOJ_PSG / (16 * tp)
            tono_off = (regs[7] >> c) & 1
            ruido_off = (regs[7] >> (c + 3)) & 1
            if f >= MUESTREO / 2:
                tono = np.full(n, 0.5)     # por encima de lo que se oye: medio
            else:
                ph = fase[c] + f / MUESTREO * t
                tono = ((ph % 1.0) < 0.5).astype(float)
            fase[c] = (fase[c] + f / MUESTREO * n) % 1.0
            puerta = np.maximum(tono, tono_off) * np.maximum(ruido, ruido_off)
            v = regs[8 + c]
            nivel = (np.array(VOLUMEN)[env.astype(int)] if v & 0x10
                     else VOLUMEN[v & 0x0F])
            mezcla += puerta * nivel
        salida.append(mezcla)
    onda = np.concatenate(salida) if salida else np.zeros(0)
    # sin continua: un paso alto suave
    if len(onda) > 2205:
        onda = onda - np.convolve(onda, np.ones(2205) / 2205, mode="same")
    pico = np.max(np.abs(onda)) or 1.0
    return (onda / pico * 0.9 * 32767).astype(np.int16)


def desarrolla(cuadros, vuelta, fundido=8.0):
    """La musica entera, una vuelta, y `fundido` segundos de la siguiente
    apagandose."""
    if vuelta is None:
        return cuadros, 0
    k = int(fundido * CUADROS_POR_SEGUNDO)
    bucle = cuadros[vuelta:]
    cola = (bucle * (k // len(bucle) + 1))[:k]
    return cuadros + cola, k


def a_mp3(muestras, ruta, fundido_cuadros=0):
    import lameenc
    import numpy as np
    m = muestras.astype(float)
    if fundido_cuadros:
        k = int(fundido_cuadros * MUESTREO / CUADROS_POR_SEGUNDO)
        k = min(k, len(m))
        m[-k:] *= np.linspace(1.0, 0.0, k)
    enc = lameenc.Encoder()
    enc.set_bit_rate(64)
    enc.set_in_sample_rate(MUESTREO)
    enc.set_channels(1)
    enc.set_quality(2)
    datos = enc.encode(m.astype(np.int16).tobytes()) + enc.flush()
    with open(ruta, "wb") as f:
        f.write(datos)


MUSICA_DE_RUINA = 0xBE70     # p15: la musica de cada ruina (p00:5500)
MUSICA_DE_RUINA_OTRA = 0xBE75   # p15: la de musica_de_fase_otra (p00:5505)
ALTURAS = 0xBE7A             # p15: [ruina * 4 + estado] -> 0xC122 (p00:54EC)
SUELTAS = (0x86, 0x87, 0x89, 0x8A, 0x8B, 0x8C, 0x8D, 0x8E)


def p15(rom, d, n):
    return rom[15 * 0x2000 + d - 0xA000:15 * 0x2000 + d - 0xA000 + n]


def piezas(rom):
    """(musica, altura, fichero) de todo lo que se publica.

    Las de fase, una por ruina y estado de animo, con la altura de p15:BE7A;
    la otra musica de la ruina (p15:BE75) solo donde no es la misma; y las
    sueltas. La 0x88 es la 0x87 (los mismos tres punteros en p13:672C) y la
    0x8F, silencio.
    """
    normal = p15(rom, MUSICA_DE_RUINA, 5)
    otra = p15(rom, MUSICA_DE_RUINA_OTRA, 5)
    alturas = p15(rom, ALTURAS, 20)
    for ruina in range(5):
        for estado in range(4):
            a = alturas[ruina * 4 + estado]
            yield normal[ruina], a, "ruina%d_estado%d.mp3" % (ruina, estado)
            if otra[ruina] != normal[ruina]:
                yield otra[ruina], a, "ruina%d_otra_estado%d.mp3" % (ruina,
                                                                   estado)
    for m in SUELTAS:
        yield m, None, "musica_%02X.mp3" % m


def main(argv):
    rom = open(ROM, "rb").read()
    if argv[0] == "registros":
        numero = int(argv[1], 0)
        cuadros, vuelta = ejecuta(rom, numero,
                                  int(argv[2]) if len(argv) > 2 else 60 * 300)
        for i, escr in enumerate(cuadros):
            print("%5d %s" % (i, " ".join("%X=%02X" % rv for rv in escr)))
        print("cuadros: %d, vuelve al %s" % (len(cuadros), vuelta))
    elif argv[0] == "mp3":
        numero = int(argv[1], 0)
        altura = int(argv[3], 0) if len(argv) > 3 else None
        cuadros, vuelta = ejecuta(rom, numero, altura=altura)
        todo, fundido = desarrolla(cuadros, vuelta)
        a_mp3(sintetiza(todo), argv[2], fundido)
        print("0x%02X: %d cuadros (%.1f s), vuelve al %s -> %s" % (
            numero, len(cuadros), len(cuadros) / 60.0, vuelta, argv[2]))
    elif argv[0] == "todas":
        os.makedirs(argv[1], exist_ok=True)
        for numero, altura, nombre in piezas(rom):
            ruta = os.path.join(argv[1], nombre)
            main(["mp3", "0x%02X" % numero, ruta]
                 + ([] if altura is None else ["0x%02X" % altura]))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
