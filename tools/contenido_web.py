#!/usr/bin/env python3
"""EL CONTENIDO de la web de este cartucho: lo unico que es de este juego.

md2html.py y make_web.py son la maquinaria y no llevan dentro el nombre de
ningun juego: lo leen de aqui. Asi no se puede colar el texto de otro
cartucho al copiar la maquinaria.

Todas las cifras de aqui estan medidas sobre este cartucho, con las
herramientas de tools/: CODIGO y DATOS los imprime tools/presupuesto.py
(make sanity) y RUTINAS, INSTRUCCIONES y COMENTARIOS son la suma de los
bancos con codigo en tools/densidad.py (make densidad). tests/test_web.py
las vuelve a medir.
"""

NOMBRE = "The Treasure of Usas"
CATALOGO = "RC-753"
ANIO = 1987
REPOSITORIO = "https://github.com/antxiko/TreasureOfUsas-disassembly"

CODIGO = 41458
DATOS = 89614
RUTINAS = 2536
INSTRUCCIONES = 20434
COMENTARIOS = 8185

# Los bancos con codigo, para volver a medir la densidad (tests/test_web.py)
BANCOS_CON_CODIGO = ("00", "01", "02", "03", "04", "05", "06", "09", "13", "15")


def densidad(idioma):
    """El porcentaje comentado, con la coma o el punto de cada idioma."""
    d = "%.1f" % (100.0 * COMENTARIOS / INSTRUCCIONES)
    return d.replace(".", ",") if idioma == "es" else d


# El pie legal de cada pagina. Este cartucho no lleva la marca oculta de la
# casa (tools/marca_konami.py: "sin marca").
PIE_LEGAL = {
    "es": "<em>The Treasure of Usas</em> lo public&oacute; Konami para MSX2 en "
          "1987; su n&uacute;mero de cat&aacute;logo es RC-753 y son 128 KB. "
          "Todos los derechos sobre el juego siguen siendo de sus titulares. "
          "Este trabajo es de preservaci&oacute;n, estudio y "
          "documentaci&oacute;n, y la imagen del cartucho no se distribuye.",
    "en": "<em>The Treasure of Usas</em> was published by Konami for the MSX2 "
          "in 1987; its catalogue number is RC-753 and it is 128 KB. All rights "
          "in the game remain with their holders. This is preservation, study "
          "and documentation work, and the cartridge image is not distributed.",
}

# La cabecera de la portada
PORTADA = {
    "es": dict(
        titulo="The Treasure of Usas - desensamblado comentado",
        claim="Las cinco ruinas desde sus tablas: 20 fases con sus antesalas y "
              "salas de la estatua, 63 tipos de actor, 12 escenas, Wit y Cles "
              "con sus cuatro estados de &aacute;nimo y los textos en "
              "japon&eacute;s e ingl&eacute;s. Todo dibujado desde la ROM.",
        ficha=["Konami - <b>(c) Konami 1987</b>",
               "Cartucho <b>RC-753</b>, MegaROM de 128 KB (Konami4, sin SCC)",
               "<b>MSX2</b>", "Volcado japon&eacute;s <b>4ff2aad8...</b>"],
        aviso="<b>Aqu&iacute; no hay ninguna captura.</b> Todas las "
              "im&aacute;genes est&aacute;n <b>dibujadas desde los bytes de la "
              "ROM</b> con las tablas del cartucho: las fases, Wit y Cles, los "
              "enemigos y los jefes, las caras, las escenas y el t&iacute;tulo. "
              "<b>El cotejo contra la VRAM de openMSX est&aacute; "
              "pendiente.</b> El listado se reensambla <b>byte a byte</b> con "
              "<code>make</code>.",
    ),
    "en": dict(
        titulo="The Treasure of Usas - a commented disassembly",
        claim="The five ruins from their tables: 20 stages with their "
              "antechambers and statue rooms, 63 actor types, 12 scenes, Wit "
              "and Cles with their four moods, and the texts in Japanese and "
              "English. All drawn from the ROM.",
        ficha=["Konami - <b>(c) Konami 1987</b>",
               "An <b>RC-753</b> cartridge, a 128 KB MegaROM (Konami4, no SCC)",
               "<b>MSX2</b>", "Japanese dump <b>4ff2aad8...</b>"],
        aviso="<b>Not one capture here.</b> Every picture is <b>drawn from the "
              "bytes of the ROM</b> with the cartridge's own tables: the "
              "stages, Wit and Cles, the enemies and the bosses, the faces, the "
              "scenes and the title. <b>The check against the openMSX VRAM is "
              "still to be done.</b> The listing reassembles <b>byte for "
              "byte</b> with <code>make</code>.",
    ),
}

HALLAZGOS = {
    "es": [
        ("El &aacute;nimo cambia el juego",
         "<p>Cada protagonista tiene cuatro estados: feliz, tranquilo, triste y "
         "enfadado (<code>p06:A644</code>). Wit feliz da un segundo salto en el "
         "aire, una vez por salto (<code>p01:64F1</code>); Cles feliz sigue "
         "andando sobre el vac&iacute;o 32 cuadros mientras no suelte la "
         "direcci&oacute;n (<code>p01:62C7</code>).</p>"
         "<p>Le&iacute;do en el c&oacute;digo.</p>"),
        ("Un disparo y un golpe por estado",
         "<p>El disparo de Wit es el tipo 4 menos el estado: ondas, barra, bola "
         "o rayo (<code>p01:6B0D</code>); el golpe de Cles, el estado m&aacute;s "
         "6 (<code>p09:B7C9</code>). Cles enfadado pega fuerte y rompe la caja "
         "grande (<code>p01:7398</code>, <code>p01:7431</code>). Feliz no "
         "empuja bloques; los otros tres estados, cada uno a su velocidad "
         "(<code>p01:7BD0</code>).</p><p>Le&iacute;do en el c&oacute;digo.</p>"),
        ("Los objetos 喜楽哀怒",
         "<p>Cada uno pone su estado de &aacute;nimo "
         "(<code>p01:75EE</code>), y cada ruina fija el de salida "
         "(<code>p00:4575</code>).</p><p>Le&iacute;do en el c&oacute;digo.</p>"),
        ("La pausa es una tienda",
         "<p>En INFORMATION se compran SPD y JMP con monedas "
         "(<code>p06:A0EA</code>). Los precios dependen del personaje: Wit 70 "
         "y 60, Cles 50 y 80 (<code>p06:BF6C</code>).</p>"
         "<p>Le&iacute;do en el c&oacute;digo.</p>"),
        ("Otros cartuchos de Konami",
         "<p>El juego busca en las dem&aacute;s ranuras cuatro n&uacute;meros "
         "de cat&aacute;logo (<code>p06:B751</code>). Con el RC-749 (The Maze of Galious) se empieza "
         "con 100 monedas (<code>p00:45F7</code>); con el RC-750 (Metal Gear), "
         "el da&ntilde;o a la mitad (<code>p01:72FF</code>); con el RC-751 (Nemesis 2), F5 "
         "CONTINUE tras GAME OVER (<code>p00:4427</code>); con el RC-752 (F1 "
         "Spirit), lo de estar feliz, siempre (<code>p01:64F1</code>, "
         "<code>p01:62C7</code>).</p><p>Le&iacute;do en el c&oacute;digo.</p>"),
        ("Dos idiomas en un cartucho",
         "<p>Un MSX japon&eacute;s da los textos en japon&eacute;s; cualquier "
         "otro, en ingl&eacute;s (<code>0x002B</code>, "
         "<code>p05:9849</code>). La fuente lleva hiragana y 28 kanji "
         "(<code>p14:9289</code>).</p><p>Le&iacute;do en el c&oacute;digo.</p>"),
        ("Las claves son los nombres de las ruinas",
         "<p>Al llegar a las ruinas 1-4, un mapa hace parpadear la ruina y "
         "escribe a m&aacute;quina su clave: JUBA RUINS, HARAPPA RUINS, "
         "GANDHARA RUINS o MOHENJO DARO (<code>p06:A2BB</code>). En el "
         "t&iacute;tulo, CTRL o el bot&oacute;n B piden la clave (KEYWORD, "
         "<code>p00:4643</code>), y con ella se empieza en esa ruina "
         "(<code>p00:45CB</code>).</p><p>Le&iacute;do en el c&oacute;digo.</p>"),
    ],
    "en": [
        ("Mood changes the game",
         "<p>Each hero has four states: happy, calm, sad and angry "
         "(<code>p06:A644</code>). A happy Wit jumps a second time in the air, "
         "once per jump (<code>p01:64F1</code>); a happy Cles keeps walking on "
         "thin air for 32 frames as long as the direction is held "
         "(<code>p01:62C7</code>).</p><p>Read in the code.</p>"),
        ("One shot and one blow per state",
         "<p>Wit's shot is type 4 minus the state: waves, bar, ball or beam "
         "(<code>p01:6B0D</code>); Cles's blow is the state plus 6 "
         "(<code>p09:B7C9</code>). An angry Cles hits hard and breaks the big "
         "crate (<code>p01:7398</code>, <code>p01:7431</code>). Happy, nobody "
         "pushes blocks; the other three states push them, each at its own "
         "speed (<code>p01:7BD0</code>).</p><p>Read in the code.</p>"),
        ("The 喜楽哀怒 items",
         "<p>Each one sets its mood (<code>p01:75EE</code>), and each ruin sets "
         "the starting one (<code>p00:4575</code>).</p><p>Read in the "
         "code.</p>"),
        ("The pause is a shop",
         "<p>In INFORMATION you buy SPD and JMP with coins "
         "(<code>p06:A0EA</code>). The prices depend on the character: Wit 70 "
         "and 60, Cles 50 and 80 (<code>p06:BF6C</code>).</p>"
         "<p>Read in the code.</p>"),
        ("Other Konami cartridges",
         "<p>The game looks in the other slots for four catalogue numbers "
         "(<code>p06:B751</code>). With RC-749 (The Maze of Galious) you start with 100 coins "
         "(<code>p00:45F7</code>); with RC-750 (Metal Gear), half the damage "
         "(<code>p01:72FF</code>); with RC-751 (Nemesis 2), F5 CONTINUE after GAME OVER "
         "(<code>p00:4427</code>); with RC-752 (F1 Spirit), the happy powers, "
         "always (<code>p01:64F1</code>, <code>p01:62C7</code>).</p>"
         "<p>Read in the code.</p>"),
        ("Two languages in one cartridge",
         "<p>A Japanese MSX gets the texts in Japanese; any other, in English "
         "(<code>0x002B</code>, <code>p05:9849</code>). The font holds hiragana "
         "and 28 kanji (<code>p14:9289</code>).</p><p>Read in the code.</p>"),
        ("The passwords are the names of the ruins",
         "<p>On reaching ruins 1-4, a map makes the ruin blink and types out "
         "its password: JUBA RUINS, HARAPPA RUINS, GANDHARA RUINS or MOHENJO "
         "DARO (<code>p06:A2BB</code>). On the title screen, CTRL or button B "
         "asks for it (KEYWORD, <code>p00:4643</code>), and with it you start "
         "at that ruin (<code>p00:45CB</code>).</p><p>Read in the code.</p>"),
    ],
}

# (imagen, pie en castellano, pie en ingles). El logotipo de la cabecera es
# LOGOTIPO: el titulo que pinta el cartucho, no un montaje.
LOGOTIPO = "titulo.png"
GALERIA = [
    ("titulo.png",
     "La pantalla de t&iacute;tulo, montada desde la ROM: el mapa de 14 x 15 "
     "fichas de <code>p05:9988</code> (<code>p05:96EA</code>). Sin cotejar "
     "a&uacute;n contra la VRAM.",
     "The title screen, built from the ROM: the 14 x 15 tile map at "
     "<code>p05:9988</code> (<code>p05:96EA</code>). Not yet checked against "
     "the VRAM."),
    ("fase_01_habitada.png",
     "La primera fase de la primera ruina, pantalla a pantalla (mapa "
     "<code>p10:5FFE</code>), con lo que hay en cada una al entrar: enemigos "
     "y sus nidos (<code>p09:B12B</code>), trampas (<code>p15:A4F9</code>), "
     "objetos (<code>p12:B8BB</code>) y el jefe (<code>p09:BED3</code>).",
     "The first stage of the first ruin, screen by screen (map "
     "<code>p10:5FFE</code>), with what each holds on entry: enemies and "
     "their nests (<code>p09:B12B</code>), traps (<code>p15:A4F9</code>), "
     "items (<code>p12:B8BB</code>) and the boss (<code>p09:BED3</code>)."),
    ("exterior.png",
     "El mapa de fuera (<code>p05:93C6</code>) con la ruina marcada y su "
     "clave, para las ruinas 1-4.",
     "The outside map (<code>p05:93C6</code>) with the ruin marked and its "
     "password, for ruins 1-4."),
    ("personajes_animados.gif",
     "Wit y Cles andando, compuestos pieza a pieza (<code>p00:5BC6</code>) "
     "desde sus tablas de fotogramas (<code>p14:97AE</code>, "
     "<code>p14:9BCE</code>), al ritmo de <code>p01:69E6</code>.",
     "Wit and Cles walking, built piece by piece (<code>p00:5BC6</code>) from "
     "their frame tables (<code>p14:97AE</code>, <code>p14:9BCE</code>), at "
     "the pace of <code>p01:69E6</code>."),
    ("retratos.png",
     "Las caras de INFORMATION, una por estado de &aacute;nimo "
     "(<code>p06:A644</code>, <code>p06:A64C</code>).",
     "The INFORMATION faces, one per mood (<code>p06:A644</code>, "
     "<code>p06:A64C</code>)."),
    ("enemigos.gif",
     "Los enemigos de las listas de cada pantalla (<code>p09:B12B</code>), "
     "con sus fotogramas (<code>p15:B744</code>) y sus colores.",
     "The enemies from each screen's list (<code>p09:B12B</code>), with their "
     "frames (<code>p15:B744</code>) and colours."),
    ("jefes_de_fase.gif",
     "Los cuatro jefes de fase, los tipos 30 a 33.",
     "The four stage bosses, types 30 to 33."),
    ("objetos.png",
     "Los objetos que se cogen (<code>p03:A81D</code>) y el globo que sale "
     "al cambiar de &aacute;nimo (<code>p15:A426</code>).",
     "The items you pick up (<code>p03:A81D</code>) and the balloon shown "
     "when the mood changes (<code>p15:A426</code>)."),
    ("escena_08.png",
     "Una de las escenas del final, con las fichas que deja la anterior "
     "(<code>p04:71D5</code>).",
     "One of the ending scenes, with the tiles left by the previous one "
     "(<code>p04:71D5</code>)."),
]
