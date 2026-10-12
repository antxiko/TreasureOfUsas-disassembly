#!/usr/bin/env python3
"""Los textos del cartucho, en japones y en ingles, leidos de la ROM.

EL IDIOMA lo decide la BIOS: con 0x002B & 0x0F = 0 (un MSX japones) el juego
escoge los textos japoneses y, si no, los ingleses (p02:812B, p04:73D6,
p05:9849, p06:BB2F...). Algunos solo existen en un idioma: el dialogo de Wit
y Cles al entrar en cada ruina (p12:B603) solo sale en japones (p01:7FF2).

LA FUENTE (p00:50C1, p14:9289) empieza en el codigo 0x20, en (0, 0x40) de la
pagina 1; el caracter c esta en ((c & 31) * 8, (c >> 5) * 8 + 0x38)
(p00:4D86). 0x20 espacio, 0x21-0x2A las cifras, 0x2B-0x44 las letras,
0x49-0x76 los hiragana, 0x77-0x7A los pequenos, 0x7B el dakuten (en ingles
hace de comillas; ocupa 4 puntos, p00:4D60), 0x90-0x9D algunos katakana y
0xA0-0xBB los kanji. Con la BIOS japonesa, p00:513D pone sobre 0x50-0x7B los
44 caracteres de p12:B37A, que solo usa el prologo japones del titulo
(p05:994D): ese texto se lee con su propia tabla.

LOS FORMATOS:
  texto    (p00:4D4A) [X][Y], caracteres; 0xFE [X][Y] otra posicion; 0xFF acaba
  maquina  (p02:805C, p04:73D2) caracteres; 0xFD otra linea; 0xFE habla el otro
           personaje (0xC8A9); 0xFF acaba
  plano    (p05:9883) caracteres hasta 0xFF; el prologo va en lineas de ancho fijo
           rellenas con espacios

Uso: textos.py            el markdown de todos los textos
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from rom import leer, palabra, T123, T456, T101112, T131415   # noqa: E402

HIRAGANA = ("あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほ"
            "まみむめもやゆよらりるれろわをん")
KANJI = "助風化宝石出起引人入開発見古代文明第中央使用分散封印礼女"
KATAKANA = dict(zip((0x90, 0x91, 0x92, 0x93, 0x94, 0x98, 0x99, 0x9A, 0x9B, 0x9C, 0x9D),
                    "ウシャスペンヒルマラク"))
PROLOGO = ("ウシャスの秘宝は、長い歴史中で�4つに分裂した。彼らはそを"
           "求めてルク・ロードへと旅立っ")
DAKUTEN = dict(zip("かきくけこさしすせそたちつてとはひふへほウクシスヒ",
                   "がぎぐげござじずぜぞだぢづでどばびぶべぼヴグジズビ"))
HANDAKUTEN = dict(zip("はひふへほ", "ぱぴぷぺぽ"))


def tabla(idioma, prologo=False):
    t = {0x20: " ", 0x45: "©", 0x47: "!", 0x48: "?", 0x96: ","}
    for i in range(10):
        t[0x21 + i] = str(i)
    for i in range(26):
        t[0x2B + i] = chr(65 + i)
    for i, k in enumerate(HIRAGANA):
        t[0x49 + i] = k
    t.update({0x77: "っ", 0x78: "ゃ", 0x79: "ゅ", 0x7A: "ょ", 0x7C: "。"})
    t.update(KATAKANA)
    for i, k in enumerate(KANJI):
        t[0xA0 + i] = k
    if idioma == "ja":
        t.update({0x7B: "゛", 0x95: "゜", 0x7D: "ー", 0x7E: "〜", 0x9E: "、", 0x46: "�"})
    else:
        t.update({0x7B: '"', 0x95: "'", 0x7D: "-", 0x7E: "~", 0x9E: ".", 0x46: "�"})
    if prologo:
        for i, k in enumerate(PROLOGO):
            t[0x50 + i] = k
    return t


def une(s):
    """El dakuten (0x7B) y el handakuten (0x95) van detras de su kana."""
    out = ""
    for ch in s:
        if ch == "゛" and out and out[-1] in DAKUTEN:
            out = out[:-1] + DAKUTEN[out[-1]]
        elif ch == "゜" and out and out[-1] in HANDAKUTEN:
            out = out[:-1] + HANDAKUTEN[out[-1]]
        else:
            out += ch
    return out


def lee(trio, a, formato, idioma, prologo=False):
    t = tabla(idioma, prologo)
    partes, s = [], ""
    if formato == "texto":
        a += 2
    while True:
        c = leer(trio, a)
        a += 1
        if c == 0xFF:
            break
        if c == 0xFE:
            partes.append(s)
            s = ""
            if formato == "texto":
                a += 2
            else:
                s = "— "
            continue
        if c == 0xFD:
            s += " "
            continue
        s += t.get(c, "�")
    if s:
        partes.append(s)
    return [" ".join(une(p).split()) for p in partes if p.strip()]


def tabla_de_punteros(trio, base, n):
    return [palabra(trio, base + 2 * i) for i in range(n)]


# (titulo, idioma, trio, direcciones, formato, de donde)
GRUPOS = [
    ("Rotulos del banco 0", "en", T123, (0x5062, 0x5068, 0x5088, 0x5095, 0x50A4),
     "texto", "p00:4685, p05:9880, p00:4464, p00:443A, p00:41BB"),
    ("Prologo del titulo", "ja", T456, (0x994D,), "plano-prologo", "p05:9849"),
    ("Prologo del titulo", "en", T456, (0x98B1,), "plano", "p05:9849"),
    ("Las escenas", "ja", T456, None, "maquina", "p04:743F (p04:73D2)"),
    ("Las escenas", "en", T456, None, "maquina", "p04:745D (p04:73D2)"),
    ("Al entrar en cada ruina (Wit y Cles)", "ja", T101112,
     tuple(tabla_de_punteros(T101112, 0xB603, 5)), "maquina", "p12:B603 (p02:801E)"),
    ("Antesala", "ja", T456, (0xBE5B, 0xBEDA, 0xBE88, 0xBEB7, 0xBEEA, 0xBF1B), "texto",
     "p06:BB2F, p06:BB8E, p06:BBB7, p06:BBE3"),
    ("Antesala", "en", T456, (0xBE69, 0xBE97, 0xBEC6, 0xBEFA, 0xBF29), "texto",
     "p06:BB2F, p06:BB8E, p06:BBB7, p06:BBE3"),
    ("Al despedirse en la antesala, por animo 0-3", "ja", T101112,
     tuple(tabla_de_punteros(T101112, b, 4)[e] for b in (0xB73C, 0xB744, 0xB74C, 0xB754)
           for e in range(4)), "maquina", "p12:B73C-B754 (p02:8168: Wit/Cles x el que habla)"),
    ("Al despedirse en la antesala, por animo 0-3", "en", T101112,
     tuple(tabla_de_punteros(T101112, 0xB85E, 4)), "maquina", "p12:B85E (p02:81BD)"),
    ("Ante la puerta", "ja", T101112,
     tuple(tabla_de_punteros(T101112, 0xB7DC, 8) + tabla_de_punteros(T101112, 0xB7EC, 8)),
     "maquina", "p12:B7DC/B7EC (p02:8132)"),
    ("Ante la puerta", "en", T101112, (0xB8A1, 0xB8AF), "maquina", "p02:815A"),
    ("Pantalla INFORMATION", "en", T456, (0xA173,), "texto", "p05:9EF2"),
]


def escenas(base):
    return tabla_de_punteros(T456, base, 15)


def main():
    print("# Los textos de The Treasure of Usas\n")
    for titulo, idioma, trio, dirs, formato, origen in GRUPOS:
        if dirs is None:
            dirs = escenas(0x743F if idioma == "ja" else 0x745D)
        print("## %s (%s) - %s\n" % (titulo, "japones" if idioma == "ja" else "ingles", origen))
        for a in dirs:
            fmt = formato.split("-")[0]
            lineas = lee(trio, a, fmt, idioma, prologo=formato.endswith("prologo"))
            print("- `0x%04X`: %s" % (a, " / ".join(lineas)))
        print()


if __name__ == "__main__":
    main()
