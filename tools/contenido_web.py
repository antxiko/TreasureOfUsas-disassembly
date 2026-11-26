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
ESTILO = '\n:root{--tinta:#cfd0d4;--suave:#83868f;--fondo:#000;--panel:#0c0e13;--linea:#23262e;\n  --rojo:#ff897d;--cyan:#65dbef;--verde:#3eb849;--oro:#ded087}\n@media (prefers-color-scheme:light){:root{--tinta:#191a1e;--suave:#5a5d66;--fondo:#e9e7e1;\n  --panel:#f7f6f2;--linea:#d0cdc5;--rojo:#b23f34;--cyan:#1c6b7c;--verde:#2b7734;--oro:#8a7420}}\n:root[data-theme="dark"]{--tinta:#cfd0d4;--suave:#83868f;--fondo:#000;--panel:#0c0e13;\n  --linea:#23262e;--rojo:#ff897d;--cyan:#65dbef;--verde:#3eb849;--oro:#ded087}\n:root[data-theme="light"]{--tinta:#191a1e;--suave:#5a5d66;--fondo:#e9e7e1;--panel:#f7f6f2;\n  --linea:#d0cdc5;--rojo:#b23f34;--cyan:#1c6b7c;--verde:#2b7734;--oro:#8a7420}\n*{box-sizing:border-box}\nbody{margin:0;background:var(--fondo);color:var(--tinta);padding:0 1.25rem 6rem;\n  font:15px/1.7 ui-monospace,"SF Mono",Menlo,Consolas,monospace}\n.w{max-width:1120px;margin:0 auto}\n.n{max-width:68ch}\nh1,h2,h3,h4{font-weight:400;text-wrap:balance}\na{color:var(--cyan)}\nimg{image-rendering:pixelated;max-width:100%;height:auto;display:block}\nheader.top{display:flex;flex-direction:column;align-items:center;gap:1.5rem;\n  padding:4rem 0 2rem;text-align:center}\nheader.top img{width:min(100%,642px)}\n.claim{max-width:60ch;color:var(--suave);font-size:1.05rem}\n.claim b{color:var(--tinta);font-weight:400}\n.ficha{display:flex;flex-wrap:wrap;justify-content:center;gap:0 1.5rem;width:100%;\n  font-size:12px;letter-spacing:.08em;text-transform:uppercase;color:var(--suave);\n  border-top:1px solid var(--linea);border-bottom:1px solid var(--linea);padding:.85rem 0}\n.ficha b{color:var(--rojo);font-weight:400}\nnav{display:flex;flex-wrap:wrap;gap:1.25rem;justify-content:center;padding:1.25rem 0;\n  font-size:12px;letter-spacing:.08em;text-transform:uppercase}\nnav a{color:var(--suave);text-decoration:none;border-bottom:1px solid transparent}\nnav a:hover,nav a:focus{color:var(--tinta);border-bottom-color:var(--rojo)}\nnav.docs{border-top:1px solid var(--linea);border-bottom:1px solid var(--linea);\n  margin-bottom:1rem}\nsection{margin-top:4.5rem;scroll-margin-top:1rem}\nsection>h2{font-size:1rem;letter-spacing:.1em;text-transform:uppercase;\n  border-left:3px solid var(--rojo);padding-left:.9rem;margin:0 0 1.5rem}\n.cifras{display:grid;gap:1px;background:var(--linea);border:1px solid var(--linea);\n  grid-template-columns:repeat(auto-fit,minmax(160px,1fr))}\n.cifra{background:var(--panel);padding:1.1rem}\n.cifra b{display:block;font-size:1.7rem;color:var(--oro);font-weight:400;\n  font-variant-numeric:tabular-nums;line-height:1.2}\n.cifra span{font-size:11px;letter-spacing:.07em;text-transform:uppercase;color:var(--suave)}\n.hall{border-top:1px solid var(--linea);padding-top:1.75rem;margin-top:2.5rem}\n.hall:first-of-type{border-top:0;padding-top:0;margin-top:0}\n.hall h3{margin:0 0 .75rem;font-size:1.15rem;color:var(--rojo)}\n.hall h4{color:var(--oro);margin:1.5rem 0 .5rem;font-size:.95rem}\n.hall p{margin:0 0 1rem}\npre.asm{background:var(--panel);border-left:2px solid var(--verde);margin:1.25rem 0;\n  padding:1rem 1.1rem;overflow-x:auto;font-size:13px;line-height:1.6;color:var(--tinta)}\n.par{display:grid;gap:1.25rem;grid-template-columns:1fr}\n@media(min-width:820px){.par{grid-template-columns:1fr 1fr}}\n.par figure{margin:0}\ntable{border-collapse:collapse;width:100%;margin:1.25rem 0;font-size:13px;display:block;\n  overflow-x:auto}\nth,td{text-align:left;padding:.5rem .75rem;border-bottom:1px solid var(--linea)}\nth{color:var(--suave);font-weight:400;font-size:11px;letter-spacing:.07em;text-transform:uppercase}\ntd.num{font-variant-numeric:tabular-nums;color:var(--oro)}\n.nivel{margin-top:2rem}\n.nivel h3{margin:0 0 .9rem;font-size:.95rem;letter-spacing:.06em;text-transform:uppercase}\n.nivel em{color:var(--cyan);font-style:normal}\n.sep{color:var(--suave);margin:0 .6rem}\n.rejilla{display:grid;gap:.9rem;grid-template-columns:repeat(auto-fill,minmax(250px,1fr))}\n.rejilla figure{margin:0;background:var(--panel);box-shadow:0 0 0 1px var(--linea)}\n.rejilla figcaption{display:flex;justify-content:space-between;padding:.45rem .65rem;\n  font-size:11px;color:var(--suave);border-top:1px solid var(--linea)}\n.dir{font-variant-numeric:tabular-nums;color:var(--verde)}\nfooter{margin-top:5rem;padding-top:1.5rem;border-top:1px solid var(--linea);\n  color:var(--suave);font-size:12px}\n\n/* Aviso de trabajo en curso: tiene que verse antes que las cifras, porque un\n   100% mal leido hace mas dano que no ponerlo. */\n.aviso{background:#3a2a10;border-left:3px solid var(--oro);margin:1.5rem auto;\n  padding:1rem 1.2rem;max-width:900px;border-radius:4px}\n.aviso p{margin:0;color:var(--tinta);font-size:15px;line-height:1.65}\n.galeria{display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));\n  gap:1.5rem;margin:1.5rem 0}\n.galeria figure{margin:0}\n.galeria img{width:100%;height:auto;image-rendering:pixelated;\n  border:1px solid var(--linea);border-radius:3px}\n.galeria figcaption{color:var(--suave);font-size:13px;margin-top:.5rem}\naudio{display:block;width:100%;max-width:640px;margin:.75rem 0 1.5rem}\n'

EDITOR = 'Konami'

# La portada: las cifras y el pie tal como estaban
for _i, _c in {'es': ([('100 %', 'del binario explicado'), ('2.536', 'rutinas con nombre'), ('40,1 %', 'del listado comentado'), ('41.458', 'bytes de código'), ('89.614', 'bytes de datos'), ('0', 'bytes sin identificar')], 'El cartucho en cifras', 'Esto es trabajo de documentación y preservación: el código y los gráficos siguen siendo de sus autores y de Konami, y la imagen del cartucho no se distribuye.'), 'en': ([('100%', 'of the binary explained'), ('2,536', 'named routines'), ('40.1%', 'of the listing commented'), ('41,458', 'bytes of code'), ('89,614', 'bytes of data'), ('0', 'bytes unidentified')], 'The cartridge in numbers', 'This is documentation and preservation work: the code and artwork still belong to their authors and to Konami, and the cartridge image is not distributed.')}.items():
    PORTADA[_i]["cifras"] = _c[0]
    PORTADA[_i]["h_num"] = _c[1]
    PORTADA[_i]["pie_leg"] = _c[2]

PAGINAS = [
    [('THE-GAME.html', 'EL-JUEGO.html', 'The game', 'El juego',
      'what the game is and how it plays',
      'qu&eacute; es el juego y c&oacute;mo se juega'),
     ('THE-PICTURES.html', 'LAS-IMAGENES.html', 'What the cartridge draws', 'Lo que el cartucho dibuja',
      'every picture drawn from the ROM, with its caption',
      'todas las im&aacute;genes dibujadas desde la ROM, con su pie'),
     ('THE-MUSIC.html', 'LA-MUSICA.html', 'The music', 'La m&#250;sica',
      'the tunes, from its own sound engine',
      'las m&uacute;sicas, de su propio motor de sonido')],
    [('CURIOSITIES.html', 'CURIOSIDADES.html', 'Curiosities', 'Curiosidades',
      'what turned up when taking it apart, and what is still open',
      'lo que apareci&oacute; al desmontarlo y lo que queda abierto')],
    [('UNDER-THE-HOOD.html', 'POR-DENTRO.html', 'Under the hood', 'Por dentro',
      'getting started, the cartridge and the code',
      'empezar, el cartucho y el c&oacute;digo')],
]

VIEJAS = {
    'FINDINGS.html': 'CURIOSITIES.html',
    'HALLAZGOS.html': 'CURIOSIDADES.html',
    'GETTING-STARTED.html': 'UNDER-THE-HOOD.html',
    'EMPEZAR.html': 'POR-DENTRO.html',
    'OPEN-QUESTIONS.html': 'CURIOSITIES.html',
    'PREGUNTAS-ABIERTAS.html': 'CURIOSIDADES.html',
    'THE-CARTRIDGE.html': 'UNDER-THE-HOOD.html',
    'EL-CARTUCHO.html': 'POR-DENTRO.html',
    'THE-CODE.html': 'UNDER-THE-HOOD.html',
    'EL-CODIGO.html': 'POR-DENTRO.html',
}
