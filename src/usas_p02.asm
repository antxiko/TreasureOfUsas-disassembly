; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 02 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ======================================================================
; CODIGO 0x8000..0x822c  (556 bytes)
; ======================================================================


L_8000:
	and a			;8000   ; con el texto ya en marcha, la letra siguiente (p02:8039)
	jr nz,L_8039		;8001
	ld a,(0c21dh)		;8003   ; lee la ruina (0-4)
	and a			;8006   ; en la ruina 0...
	ld b,001h		;8007   ; ...habla primero el personaje 1 (Cles)
	jr z,L_8011		;8009
	cp 003h		;800b   ; y en la 3 tambien
	jr z,L_8011		;800d
	ld b,000h		;800f   ; en las demas, el 0 (Wit)
L_8011:
	ld a,b			;8011
	ld (0c8a9h),a		;8012   ; guarda el personaje del texto
empieza_texto_de_ruina:		; con 12: el texto a maquina de la ruina (p12:B603)
	call recuadro_del_texto		;8015   ; recuadro_del_texto: borra el recuadro, su marco y sus lineas segun 0xC8A9
	call posicion_del_texto		;8018   ; posicion_del_texto: 0xC8A7 y 0xC8A3 = (0x30, 0x58)
	call 054aah		;801b   ; banco_12_en_a000: pone el banco 12 en 0xA000
	ld hl,0b603h		;801e   ; el texto de la ruina: p12:B603[ruina]
	ld a,(0c21dh)		;8021   ; lee la ruina (0-4)
	call 0543ah		;8024   ; palabra_a: HL = la palabra A de la tabla HL
	ld (0c8a1h),hl		;8027   ; guarda el puntero del texto a maquina y el byte siguiente (16 bits)
	ld a,008h		;802a   ; 8 cuadros entre letra y letra
	ld (0c8a5h),a		;802c   ; guarda la espera hasta la siguiente letra
	xor a			;802f   ; sin acabar
	ld (0c8a6h),a		;8030   ; guarda el texto a maquina ha acabado
	ld hl,0c8a0h		;8033   ; apunta a el texto a maquina en marcha
	inc (hl)			;8036   ; en marcha
	jr L_80A4		;8037
L_8039:
	ld a,(0c8a9h)		;8039   ; lee el personaje del texto
	and a			;803c   ; la cara del que habla: Wit...
	jr nz,L_8044		;803d
	call cara_del_personaje_0		;803f   ; cara_del_personaje_0: la cara del personaje 0 segun su estado (p06:A774)
	jr L_8047		;8042
L_8044:
	call cara_del_personaje_1		;8044   ; cara_del_personaje_1: la cara del personaje 1 segun su estado (p06:A794), cada 8 cuadros
L_8047:
	ld hl,0c8a5h		;8047   ; apunta a la espera hasta la siguiente letra
	dec (hl)			;804a   ; la espera hasta la letra siguiente...
	ret nz			;804b   ; ...sin acabar, nada
	ld a,(0c8aah)		;804c   ; lee el recuadro del texto, por borrar
	and a			;804f   ; con el recuadro por borrar...
	jr z,L_8059		;8050
	call recuadro_del_texto		;8052   ; recuadro_del_texto: borra el recuadro, su marco y sus lineas segun 0xC8A9
	xor a			;8055   ; ...se borra una vez
	ld (0c8aah),a		;8056   ; guarda el recuadro del texto, por borrar
L_8059:
	call 054aah		;8059   ; banco_12_en_a000: pone el banco 12 en 0xA000
	ld hl,(0c8a1h)		;805c   ; lee el puntero del texto a maquina y el byte siguiente (16 bits)
	ld a,(hl)			;805f   ; la letra siguiente
	inc hl			;8060
	ld (0c8a1h),hl		;8061   ; guarda el puntero del texto a maquina y el byte siguiente (16 bits)
	ld b,a			;8064   ; 0xFF: acaba; 0xFE: habla el otro; 0xFD: otra linea
	inc a			;8065
	jr z,L_80B3		;8066
	inc a			;8068
	jr z,L_8090		;8069
	inc a			;806b
	jr z,L_807B		;806c
	ld a,b			;806e   ; una letra de la fuente en la posicion
	ld de,(0c8a3h)		;806f   ; lee la posicion del texto a maquina y el byte siguiente (16 bits)
	call 04d86h		;8073   ; caracter_de_la_fuente: el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
	call 04e39h		;8076   ; avanza_caracter: D + 8 (+ 4 si el caracter es 0x7B), y E + 8 al pasar de linea
	jr L_8085		;8079
L_807B:
	ld de,(0c8a7h)		;807b   ; lee el principio de la linea del texto a maquina y el byte siguiente (16 bits)
	ld a,(0c8a3h)		;807f   ; lee la posicion del texto a maquina
	add a,00ch		;8082   ; la linea siguiente: 12 lineas mas abajo, desde el principio de la linea
	ld e,a			;8084
L_8085:
	ld (0c8a3h),de		;8085   ; guarda la posicion del texto a maquina y el byte siguiente (16 bits)
	ld a,008h		;8089   ; 8 cuadros
	ld (0c8a5h),a		;808b   ; guarda la espera hasta la siguiente letra
	jr L_80A4		;808e
L_8090:
	ld a,01eh		;8090   ; 0xFE: 0x1E cuadros de espera...
	ld (0c8a5h),a		;8092   ; guarda la espera hasta la siguiente letra
	ld hl,0c8a9h		;8095   ; apunta a el personaje del texto
	ld a,(hl)			;8098   ; ...el otro personaje...
	xor 001h		;8099
	ld (hl),a			;809b
	call posicion_del_texto		;809c   ; posicion_del_texto: 0xC8A7 y 0xC8A3 = (0x30, 0x58)
	ld a,001h		;809f   ; ...y su recuadro, por borrar
	ld (0c8aah),a		;80a1   ; guarda el recuadro del texto, por borrar
L_80A4:
	jp 05464h		;80a4   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
posicion_del_texto:		; 0xC8A7 y 0xC8A3 = (0x30, 0x58)
	ld de,05830h		;80a7   ; en (0x30, 0x58)
	ld (0c8a7h),de		;80aa   ; guarda el principio de la linea del texto a maquina y el byte siguiente (16 bits)
	ld (0c8a3h),de		;80ae   ; guarda la posicion del texto a maquina y el byte siguiente (16 bits)
	ret			;80b2
L_80B3:
	xor a			;80b3   ; 0xFF: ya no esta en marcha...
	ld (0c8a0h),a		;80b4   ; guarda el texto a maquina en marcha
	inc a			;80b7   ; ...ha acabado y ya ha salido
	ld (0c8a6h),a		;80b8   ; guarda el texto a maquina ha acabado
	ld (0c8abh),a		;80bb   ; guarda el texto a maquina ya ha salido
	jr L_80A4		;80be
recuadro_del_texto:		; borra el recuadro, su marco y sus lineas segun 0xC8A9
	ld hl,04a28h		;80c0   ; borra 0x6D x 0x30 en (0x28, 0x4A)
	ld bc,06d30h		;80c3
	call 05e2fh		;80c6   ; borra_rectangulo: HMMV con 0xFF en la pagina 0
	call 054b4h		;80c9   ; banco_6_en_a000: pone el banco 6 en 0xA000
	ld a,(0c8a9h)		;80cc   ; lee el personaje del texto
	and a			;80cf   ; la linea que une el recuadro con la cara: de Wit...
	ld hl,04a2bh		;80d0
	jr z,L_80D8		;80d3
	ld hl,0ac4ch		;80d5   ; ...o de Cles
L_80D8:
	ld de,00808h		;80d8   ; 8 de largo en cada eje, color 0x0D
	ld c,00dh		;80db
	call 04b40h		;80dd   ; linea: LINE (0x70) de (H, L) con largo D y E
	ld a,(0c8a9h)		;80e0   ; lee el personaje del texto
	and a			;80e3   ; las lineas verticales del recuadro de Wit (p06:A7C8)...
	ld hl,0a7c8h		;80e4
	jr z,L_80EC		;80e7
	ld hl,0a7d6h		;80e9   ; ...o de Cles (p06:A7D6)
L_80EC:
	call 055ceh		;80ec   ; lineas_verticales: lineas [X][Y][largo] de HL hasta 0xFF (p00:4B0C)
	ld a,(0c8a9h)		;80ef   ; lee el personaje del texto
	and a			;80f2   ; y las horizontales (p06:A7CF / p06:A7DD)
	ld hl,0a7cfh		;80f3
	jr z,L_80FB		;80f6
	ld hl,0a7ddh		;80f8
L_80FB:
	call 055d1h		;80fb   ; lineas_horizontales: lineas [X][Y][largo] de HL hasta 0xFF (p00:4AD4)
	jr L_80A4		;80fe
texto_de_la_antesala:		; el texto a maquina de la antesala: si no esta en marcha, el recuadro, los nombres por animo y el texto de la puerta
	ld a,(0c8a0h)		;8100   ; lee el texto a maquina en marcha
	and a			;8103   ; con el texto en marcha, la letra siguiente
	jp nz,L_8039		;8104
	call recuadro_del_texto		;8107   ; recuadro_del_texto: borra el recuadro, su marco y sus lineas segun 0xC8A9
	call nombres_de_estado		;810a   ; nombres_de_estado: con 12: los nombres de estado de los dos personajes en 0xC8B0
	ld a,(0c240h)		;810d   ; lee el personaje que se lleva (0 o 1)
	ld (0c8a9h),a		;8110   ; guarda el personaje del texto
	call empieza_texto_de_ruina		;8113   ; empieza_texto_de_ruina: con 12: el texto a maquina de la ruina (p12:B603)
	ld hl,0c8b0h		;8116   ; apunta a el texto de los nombres por animo
	ld (0c8a1h),hl		;8119   ; guarda el puntero del texto a maquina y el byte siguiente (16 bits)
	ld a,(0c2b0h)		;811c   ; lee la ficha del personaje 0 (14 bytes)
	ld b,a			;811f   ; si ha caido alguno...
	ld a,(0c2d0h)		;8120   ; lee la ficha del personaje 1 (14 bytes)
	or b			;8123
	ret z			;8124   ; ...solo el texto de la ruina
	call 054aah		;8125   ; banco_12_en_a000: pone el banco 12 en 0xA000
	call 061c2h		;8128   ; puerta_de_la_antesala: B = la puerta (1-5) segun 0xCC10 y la X 0xCC13
	ld a,(0002bh)		;812b
	and 00fh		;812e
	jr nz,L_815A		;8130   ; sin la BIOS japonesa, p02:815A
	ld a,(0c240h)		;8132   ; lee el personaje que se lleva (0 o 1)
	and a			;8135   ; la frase de la puerta de Wit (p12:B7DC)...
	ld hl,0b7dch		;8136
	ld a,(0c2b6h)		;8139   ; lee el estado del personaje 0
	jr z,L_8144		;813c
	ld hl,0b7ech		;813e   ; ...o de Cles (p12:B7EC), segun su animo
	ld a,(0c2d6h)		;8141   ; lee el estado del personaje 1
L_8144:
	push af			;8144   ; 0xC208: si es el mismo, la mitad de la tabla de antes (C = 0); si no, la de despues (C = 4)
	ld a,(0c208h)		;8145   ; la puerta del companero capturado (0xC208)...
	cp b			;8148
	ld c,000h		;8149   ; ...en esta puerta: las 4 primeras frases; si no, las 4 siguientes
	jr z,L_814F		;814b
	ld c,004h		;814d
L_814F:
	pop af			;814f
	add a,c			;8150   ; + el animo
	call 0543ah		;8151   ; palabra_a: HL = la palabra A de la tabla HL
L_8154:
	ld (0c8a1h),hl		;8154   ; guarda el puntero del texto a maquina y el byte siguiente (16 bits)
	jp 05464h		;8157   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_815A:
	ld a,(0c208h)		;815a   ; el texto p12:B8A1 si 0xC208 es B; si no, p12:B8AF
	cp b			;815d   ; en ingles, ante la puerta del capturado...
	ld hl,0b8a1h		;815e   ; ...WILL HELP YOU
	jr z,L_8154		;8161
	ld hl,0b8afh		;8163   ; si no, DO MY BEST!
	jr L_8154		;8166
nombres_de_estado:		; con 12: los nombres de estado de los dos personajes en 0xC8B0
	call 054aah		;8168   ; banco_12_en_a000: pone el banco 12 en 0xA000
	ld de,0c8b0h		;816b   ; apunta a el texto de los nombres por animo
	ld a,(0002bh)		;816e
	and 00fh		;8171
	ld a,(0c240h)		;8173   ; lee el personaje que se lleva (0 o 1)
	jr nz,L_81BD		;8176   ; sin la BIOS japonesa, p02:81BD
	ld de,0c8b0h		;8178   ; apunta a el texto de los nombres por animo
	and a			;817b   ; con Wit: su frase de ir (p12:B73C) y la de Cles al despedirle (p12:B754)
	ld hl,0b73ch		;817c
	ld a,(0c2b6h)		;817f   ; lee el estado del personaje 0
	ld b,a			;8182   ; B = el animo de Wit
	exx			;8183
	ld hl,0b754h		;8184
	ld a,(0c2d6h)		;8187   ; lee el estado del personaje 1
	ld b,a			;818a   ; B' = el animo de Cles
	exx			;818b
	jr z,L_819E		;818c
	ld hl,0b74ch		;818e   ; con Cles: la suya (p12:B74C) y la de Wit (p12:B744)
	ld a,(0c2d6h)		;8191   ; lee el estado del personaje 1
	ld b,a			;8194
	exx			;8195
	ld hl,0b744h		;8196
	ld a,(0c2b6h)		;8199   ; lee el estado del personaje 0
	ld b,a			;819c
	exx			;819d
L_819E:
	call copia_nombre		;819e   ; copia_nombre: copia a DE la cadena A de la tabla HL hasta 0xFF
	ld a,0feh		;81a1   ; 0xFE: habla el otro
	ld (de),a			;81a3
	inc de			;81a4
	push de			;81a5   ; la segunda frase detras
	exx			;81a6
	pop de			;81a7
	call copia_nombre		;81a8   ; copia_nombre: copia a DE la cadena A de la tabla HL hasta 0xFF
	ld a,0ffh		;81ab   ; 0xFF: acaba
	ld (de),a			;81ad
	exx			;81ae
	jp 05464h		;81af   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
copia_nombre:		; copia a DE la cadena A de la tabla HL hasta 0xFF
	ld a,b			;81b2   ; la cadena del animo B
	call 0543ah		;81b3   ; palabra_a: HL = la palabra A de la tabla HL
L_81B6:
	ld a,(hl)			;81b6
	inc a			;81b7   ; hasta la 0xFF
	ret z			;81b8
	ldi		;81b9
	jr L_81B6		;81bb
L_81BD:
	ld hl,0b858h		;81bd   ; en ingles: BYE!! (p12:B858)...
	ld bc,00006h		;81c0
	ldir		;81c3
	and a			;81c5   ; ...y la frase del animo del que se queda (p12:B85E)
	ld a,(0c2b6h)		;81c6   ; lee el estado del personaje 0
	jr nz,L_81CE		;81c9
	ld a,(0c2d6h)		;81cb   ; lee el estado del personaje 1
L_81CE:
	ld b,a			;81ce
	ld hl,0b85eh		;81cf
	call copia_nombre		;81d2   ; copia_nombre: copia a DE la cadena A de la tabla HL hasta 0xFF
	ld a,0ffh		;81d5   ; 0xFF: acaba
	ld (de),a			;81d7
	jp 05464h		;81d8   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
cara_del_personaje_0:		; la cara del personaje 0 segun su estado (p06:A774)
	ld hl,0a774h		;81db   ; la boca de Wit (p06:A774) en (0x28, 0x44)
	ld de,02844h		;81de
	ld a,(0c2b6h)		;81e1   ; lee el estado del personaje 0
	ld b,a			;81e4   ; B = su animo
	jr L_81F1		;81e5
cara_del_personaje_1:		; la cara del personaje 1 segun su estado (p06:A794), cada 8 cuadros
	ld hl,0a794h		;81e7   ; la de Cles (p06:A794) en (0xC8, 0x44)
	ld de,0c844h		;81ea
	ld a,(0c2d6h)		;81ed   ; lee el estado del personaje 1
	ld b,a			;81f0
L_81F1:
	ld a,(0c003h)		;81f1   ; lee la cuenta de cuadros
	and 007h		;81f4   ; cada 8 cuadros
	ret nz			;81f6
	push bc			;81f7
	call 054b4h		;81f8   ; banco_6_en_a000: pone el banco 6 en 0xA000
	ld bc,0c8ach		;81fb   ; 0xC8AC alterna entre 0 y 1: la boca abierta o cerrada
	ld a,(bc)			;81fe
	xor 001h		;81ff
	ld (bc),a			;8201
	add a,a			;8202   ; (0xC8AC * 4 + animo) * 4: el bloque de 2 x 2 fichas
	add a,a			;8203
	ld b,a			;8204
	pop af			;8205
	add a,b			;8206
	add a,a			;8207
	add a,a			;8208
	call 04083h		;8209   ; hl_mas_a: HL = HL + A
	ld bc,00202h		;820c   ; 2 x 2 fichas
	call 0ba24h		;820f   ; bloque_de_fichas: B filas de C fichas de HL en (D, E)
	jp 05464h		;8212   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
juegos_de_la_sala_5:		; los juegos de sprites 0x28, 0x19 y el de la ruina (p02:822C)
	ld a,028h		;8215   ; los juegos 0x28 y 0x19
	call 055f0h		;8217   ; juego_de_sprites: con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)
	ld a,019h		;821a
	call 055f0h		;821c   ; juego_de_sprites: con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)
	ld a,(0c21dh)		;821f   ; lee la ruina (0-4)
	ld hl,0822ch		;8222   ; y el de la ruina (p02:822C)
	call 04083h		;8225   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;8228
	jp 055f0h		;8229   ; juego_de_sprites: con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)

; ----------------------------------------------------------------------
; DATOS resto_822C: tablas cortas que apuntan p02:8222 (0x822C); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p02:8222 (5
;   bytes)
;   0x822c..0x8231  (5 bytes)
DATA_resto_822C:
	defb 031h,032h,033h,034h,035h	; 822c

; ======================================================================
; CODIGO 0x8231..0x827e  (77 bytes)
; ======================================================================


juego_30:		; el juego de sprites 0x30 (p00:55F0)
	ld a,030h		;8231
	jp 055f0h		;8233   ; juego_de_sprites: con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)
juegos_de_la_pantalla_y_vuelve:		; p02:823C y vuelve con 1-2-3
	call juegos_de_la_pantalla		;8236   ; juegos_de_la_pantalla: con 9: los juegos de sprites 0x28 y 0x29 y, por cada actor de la lista de la pantalla (p09:B12B), su paleta y su juego
	jp 05464h		;8239   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
juegos_de_la_pantalla:		; con 9: los juegos de sprites 0x28 y 0x29 y, por cada actor de la lista de la pantalla (p09:B12B), su paleta y su juego
	ld a,(0c20ah)		;823c   ; lee en la sala de la puerta 5
	or a			;823f   ; en la sala 5, sus juegos (p02:8215)
	jr nz,$-43		;8240
	call 054afh		;8242   ; banco_9_en_a000: pone el banco 9 en 0xA000
	xor a			;8245   ; el primer registro
	ld (0cc37h),a		;8246   ; guarda el registro en curso de la lista de la pantalla
	call busca_de_la_pantalla		;8249   ; busca_de_la_pantalla: con 9: el registro de p09:B12B[0xC211 - 1] de la pantalla; acarreo si no hay
	ret c			;824c   ; sin registro, nada
	cp 0ffh		;824d   ; 0xFF: nada
	ret z			;824f
	push hl			;8250
	ld a,028h		;8251   ; los juegos 0x28 y 0x29
	call 055f0h		;8253   ; juego_de_sprites: con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)
	ld a,029h		;8256
	call 055f0h		;8258   ; juego_de_sprites: con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)
	call 054afh		;825b   ; banco_9_en_a000: pone el banco 9 en 0xA000
	pop hl			;825e
L_825F:
	ld a,(0c212h)		;825f   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;8262   ; cada registro de esta pantalla:
	ret nz			;8263
	inc hl			;8264
	ld a,(hl)			;8265   ; su tipo: su paleta...
	push hl			;8266
	call paleta_del_tipo		;8267   ; paleta_del_tipo: con 9: la paleta del tipo A, p09:B781[p09:B74A[A - 1] - 1], si tiene
	pop hl			;826a
	ld a,(hl)			;826b   ; ...y su juego de sprites
	inc hl			;826c
	inc hl			;826d
	inc hl			;826e
	push hl			;826f
	call 055f0h		;8270   ; juego_de_sprites: con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)
	call 054afh		;8273   ; banco_9_en_a000: pone el banco 9 en 0xA000
	pop hl			;8276
	jr L_825F		;8277
L_8279:
	inc hl			;8279   ; el registro siguiente, 4 bytes
	inc hl			;827a
	inc hl			;827b
	jr L_825F		;827c

; ----------------------------------------------------------------------
; DATOS resto_827E: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (1 bytes)
;   0x827e..0x827f  (1 bytes)
DATA_resto_827E:
	defb 0c9h	; 827e

; ======================================================================
; CODIGO 0x827f..0x82e9  (106 bytes)
; ======================================================================


paleta_del_tipo:		; con 9: la paleta del tipo A, p09:B781[p09:B74A[A - 1] - 1], si tiene
	dec a			;827f
	ld hl,0b74ah		;8280   ; p09:B74A[tipo - 1]: cual de las paletas
	call 04083h		;8283   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;8286
	or a			;8287
	ret z			;8288   ; 0: sin paleta propia
	dec a			;8289
	ld hl,0b781h		;828a   ; p09:B781[n - 1]
	call 0543ah		;828d   ; palabra_a: HL = la palabra A de la tabla HL
	jp 04a9dh		;8290   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
cuadro_de_actores:		; las esperas (p02:8598) y los 8 actores de 0xC400: su tipo, movimiento y vida
	call cuadro_de_las_esperas		;8293   ; cuadro_de_las_esperas: si no muere el personaje y hay pocos actores (p02:85B1): las cuentas que sueltan los actores de 0xCC40
	ld ix,0c400h		;8296   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld b,008h		;829a   ; los 8 actores
L_829C:
	ld a,(ix+000h)		;829c   ; lee el tipo del actor
	and a			;829f   ; libre: el siguiente
	jr z,L_82BD		;82a0
	push bc			;82a2
	call despacha_tipo		;82a3   ; despacha_tipo: despacha el tipo del actor - 1 (tabla p02:82E9, 63 tipos)
	ld a,(ix+000h)		;82a6   ; lee el tipo del actor
	and a			;82a9   ; borrado por su manejador: el siguiente
	jr z,L_82B5		;82aa
	call mueve_actor		;82ac   ; mueve_actor: si (ix+6): Y += velocidad Y y X += velocidad X (16 bits)
	call acelera_actor		;82af   ; acelera_actor: si (ix+0x0B): velocidades += aceleraciones
	call actor_fuera		;82b2   ; actor_fuera: salvo el tipo 0x21, se borra si sale por abajo o por los lados
L_82B5:
	ld a,(ix+012h)		;82b5   ; lee la vida del actor (p01:721A)
	and a			;82b8   ; sin vida, segun el tipo
	call z,actor_por_tipo		;82b9   ; actor_por_tipo: segun 0xC316 y el tipo: cuentas y p02:84AC
	pop bc			;82bc
L_82BD:
	ld de,00080h		;82bd
	add ix,de		;82c0
	djnz L_829C		;82c2
	ret			;82c4
fotogramas_de_actores:		; el fotograma de los 8 actores de 0xC400, salvo el tipo 0x37 (p02:8A42)
	ld ix,0c400h		;82c5   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld b,008h		;82c9   ; los 8 actores
L_82CB:
	push bc			;82cb
	ld a,(ix+000h)		;82cc   ; lee el tipo del actor
	and a			;82cf
	jr z,L_82D9		;82d0
	cp 037h		;82d2   ; el tipo 0x37 no tiene fotograma
	jr z,L_82D9		;82d4
	call fotograma_del_actor		;82d6   ; fotograma_del_actor: con 15: el fotograma (ix+0x10) del actor (p02:8A42)
L_82D9:
	ld de,00080h		;82d9
	add ix,de		;82dc
	pop bc			;82de
	djnz L_82CB		;82df
	ret			;82e1
despacha_tipo:		; despacha el tipo del actor - 1 (tabla p02:82E9, 63 tipos)
	ld a,(ix+000h)		;82e2   ; lee el tipo del actor
	dec a			;82e5   ; el tipo - 1
	call 0408dh		;82e6   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_82E9: tabla de 63 palabras del despachador (call 0x408D en
;   0x82E6); lo leen L_408D (126 bytes)
;   0x82e9..0x8367  (126 bytes)
DATA_saltos_82E9:
	defb 030h,092h	; 82e9
	defb 063h,097h	; 82eb
	defb 005h,098h	; 82ed
	defb 016h,093h	; 82ef
	defb 040h,095h	; 82f1
	defb 018h,096h	; 82f3
	defb 082h,09dh	; 82f5
	defb 0cch,09eh	; 82f7
	defb 0b3h,099h	; 82f9
	defb 00eh,094h	; 82fb
	defb 0b6h,094h	; 82fd
	defb 0c2h,09fh	; 82ff
	defb 04fh,09bh	; 8301
	defb 0aeh,09ah	; 8303
	defb 097h,0a0h	; 8305
	defb 000h,000h	; 8307
	defb 000h,000h	; 8309
	defb 000h,000h	; 830b
	defb 000h,000h	; 830d
	defb 063h,097h	; 830f
	defb 0f0h,098h	; 8311
	defb 0edh,095h	; 8313
	defb 00fh,097h	; 8315
	defb 0feh,0a1h	; 8317
	defb 094h,0aah	; 8319
	defb 0e7h,0b5h	; 831b
	defb 0bah,0b5h	; 831d
	defb 063h,0b6h	; 831f
	defb 0a6h,0a9h	; 8321
	defb 0afh,0abh	; 8323
	defb 074h,0adh	; 8325
	defb 0e9h,0aeh	; 8327
	defb 046h,0b0h	; 8329
	defb 095h,0b4h	; 832b
	defb 024h,0b5h	; 832d
	defb 092h,083h	; 832f
	defb 092h,083h	; 8331
	defb 092h,083h	; 8333
	defb 055h,08ch	; 8335
	defb 07ch,084h	; 8337
	defb 06fh,0a7h	; 8339
	defb 050h,0a8h	; 833b
	defb 099h,09ah	; 833d
	defb 010h,0adh	; 833f
	defb 0edh,0afh	; 8341
	defb 0edh,0afh	; 8343
	defb 064h,0b1h	; 8345
	defb 0e2h,0b3h	; 8347
	defb 008h,0a2h	; 8349
	defb 045h,0a2h	; 834b
	defb 07eh,0a2h	; 834d
	defb 000h,0a3h	; 834f
	defb 02ah,0a3h	; 8351
	defb 02ah,0a3h	; 8353
	defb 0a3h,0a3h	; 8355
	defb 000h,000h	; 8357
	defb 0b7h,0a5h	; 8359
	defb 000h,000h	; 835b
	defb 054h,0a6h	; 835d
	defb 0ceh,0a6h	; 835f
	defb 0ceh,0a6h	; 8361
	defb 063h,0a8h	; 8363
	defb 07fh,0a9h	; 8365

; ======================================================================
; CODIGO 0x8367..0x84a7  (320 bytes)
; ======================================================================


mueve_actor:		; si (ix+6): Y += velocidad Y y X += velocidad X (16 bits)
	ld a,(ix+006h)		;8367   ; lee si el actor se mueve (p02:8367)
	and a			;836a
	ret z			;836b   ; quieto: nada
	ld e,(ix+007h)		;836c   ; lee la velocidad Y del actor
	ld d,(ix+008h)		;836f   ; lee la velocidad Y del actor (alta)
	ld l,(ix+002h)		;8372   ; lee la Y del actor (fraccion)
	ld h,(ix+003h)		;8375   ; lee la Y del actor
	add hl,de			;8378   ; Y + velocidad Y (16 bits)
	ld (ix+002h),l		;8379   ; guarda la Y del actor (fraccion)
	ld (ix+003h),h		;837c   ; guarda la Y del actor
	ld e,(ix+009h)		;837f   ; lee la velocidad X del actor
	ld d,(ix+00ah)		;8382   ; lee la velocidad X del actor (alta)
	ld l,(ix+004h)		;8385   ; lee la X del actor (fraccion)
	ld h,(ix+005h)		;8388   ; lee la X del actor
	add hl,de			;838b   ; X + velocidad X
	ld (ix+004h),l		;838c   ; guarda la X del actor (fraccion)
	ld (ix+005h),h		;838f   ; guarda la X del actor
L_8392:
	ret			;8392   ; (los tipos 36-38 vienen aqui: nada)
acelera_actor:		; si (ix+0x0B): velocidades += aceleraciones
	ld a,(ix+00bh)		;8393   ; lee si el actor acelera (p02:8393)
	and a			;8396
	ret z			;8397   ; sin aceleracion: nada
	ld e,(ix+00ch)		;8398   ; lee la aceleracion Y del actor
	ld d,(ix+00dh)		;839b   ; lee la aceleracion Y del actor (alta)
	ld l,(ix+007h)		;839e   ; lee la velocidad Y del actor
	ld h,(ix+008h)		;83a1   ; lee la velocidad Y del actor (alta)
	add hl,de			;83a4   ; velocidad Y + aceleracion Y
	ld (ix+007h),l		;83a5   ; guarda la velocidad Y del actor
	ld (ix+008h),h		;83a8   ; guarda la velocidad Y del actor (alta)
	ld e,(ix+00eh)		;83ab   ; lee la aceleracion X del actor
	ld d,(ix+00fh)		;83ae   ; lee la aceleracion X del actor (alta)
	ld l,(ix+009h)		;83b1   ; lee la velocidad X del actor
	ld h,(ix+00ah)		;83b4   ; lee la velocidad X del actor (alta)
	add hl,de			;83b7   ; velocidad X + aceleracion X
	ld (ix+009h),l		;83b8   ; guarda la velocidad X del actor
	ld (ix+00ah),h		;83bb   ; guarda la velocidad X del actor (alta)
	ret			;83be
actor_fuera:		; salvo el tipo 0x21, se borra si sale por abajo o por los lados
	ld a,(ix+000h)		;83bf   ; lee el tipo del actor
	cp 021h		;83c2   ; el 0x21 puede salir
	ret z			;83c4
	ld a,(ix+003h)		;83c5   ; lee la Y del actor
	cp 0e4h		;83c8   ; por debajo de 0xE4...
	jr nc,borra_actor		;83ca
	ld a,(ix+005h)		;83cc   ; lee la X del actor
	cp 0f5h		;83cf   ; ...o fuera de 0x0A-0xF4 en X: se borra
	jr nc,borra_actor		;83d1
	cp 00ah		;83d3
	ret nc			;83d5
borra_actor:		; tipo 0, libera sus piezas y esconde sus sprites
	xor a			;83d6
	ld (ix+000h),a		;83d7   ; guarda el tipo del actor
	push ix		;83da
	pop hl			;83dc
	set 5,l		;83dd   ; (ix+0x20): cuantas piezas
	ld c,(hl)			;83df
	ld a,c			;83e0
	and a			;83e1
	ret z			;83e2
	inc l			;83e3   ; cada pieza: su hueco...
L_83E4:
	ld de,0de28h		;83e4   ; apunta a la Y del sprite 10 en RAM
	ld a,(hl)			;83e7   ; ...su sprite (0xDE28 + hueco * 4) escondido (Y = 0xE0)...
	add a,a			;83e8
	add a,a			;83e9
	add a,e			;83ea
	ld e,a			;83eb
	ld a,0e0h		;83ec
	ld (de),a			;83ee
	ld de,0cc80h		;83ef   ; apunta a las piezas de sprite ocupadas (22)
	ld a,(hl)			;83f2   ; ...y su hueco libre en 0xCC80
	call 04088h		;83f3   ; de_mas_a: DE = DE + A
	xor a			;83f6
	ld (de),a			;83f7
	ld a,l			;83f8   ; la pieza siguiente, 5 bytes mas alla
	add a,005h		;83f9
	ld l,a			;83fb
	dec c			;83fc
	jr nz,L_83E4		;83fd
	ret			;83ff
actor_por_tipo:		; segun 0xC316 y el tipo: cuentas y p02:84AC
	ld a,(0c316h)		;8400   ; lee en la sala del final de fase
	or a			;8403
	jr z,L_8412		;8404   ; en la sala del final de fase, los tipos 0x1E-0x21 (los jefes)...
	ld a,(ix+000h)		;8406   ; lee el tipo del actor
	cp 01eh		;8409
	jr c,L_8412		;840b
	cp 022h		;840d
	jp c,L_84AC		;840f   ; ...al morir dan lo de p02:84AC
L_8412:
	ld a,(ix+000h)		;8412   ; lee el tipo del actor
	cp 010h		;8415   ; los tipos por debajo de 0x10...
	jr nc,L_8436		;8417
	ld hl,0e30bh		;8419   ; ...cuentan en 0xE30B
	inc (hl)			;841c
	jr L_8436		;841d
hay_tipo_29:		; acarreo si ningun actor de 0xC400 es de tipo 0x29
	ld a,(ix+01eh)		;841f
	cp 010h		;8422   ; solo con (ix+0x1E) por debajo de 0x10
	ret nc			;8424
	ld hl,0c400h		;8425   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld de,00080h		;8428
	ld a,029h		;842b
	ld b,008h		;842d
L_842F:
	cp (hl)			;842f   ; el tipo A en los actores de HL, de 0x80 en 0x80
	ret z			;8430
	add hl,de			;8431
	djnz L_842F		;8432
	scf			;8434   ; ninguno: acarreo
	ret			;8435
L_8436:
	ld a,01ch		;8436   ; al morir: el sonido 0x1C...
	call 056e3h		;8438   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld a,(ix+000h)		;843b   ; lee el tipo del actor
	ld (ix+01eh),a		;843e   ; ...el tipo que era, en (ix+0x1E)...
	call borra_actor		;8441   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	ld (ix+000h),028h		;8444   ; ...y se rehace como tipo 0x28 (la explosion): 2 piezas, colores 0x0E y 0x4D, vida 1
	ld (ix+001h),000h		;8448   ; el paso del actor = 0x00
	ld (ix+020h),002h		;844c   ; las piezas del actor (p02:8648) = 0x02
	ld (ix+025h),00eh		;8450
	ld (ix+02ah),04dh		;8454
	ld (ix+012h),001h		;8458   ; la vida del actor (p01:721A) = 0x01
	call marca_piezas		;845c   ; marca_piezas: marca en 0xCC80 las piezas (ix+0x21) y (ix+0x26)
L_845F:
	ld a,(ix+01eh)		;845f
	or a			;8462
	jr nz,L_8469		;8463   ; sin tipo, 0xFF
	ld (ix+01eh),0ffh		;8465
L_8469:
	xor a			;8469   ; quieto, sin choques, fotograma 0x65 y 2 cuadros
	ld (ix+006h),a		;846a   ; guarda si el actor se mueve (p02:8367)
	ld (ix+00bh),a		;846d   ; guarda si el actor acelera (p02:8393)
	ld (ix+010h),065h		;8470   ; el fotograma del actor (p02:8A42) = 0x65
	ld (ix+011h),002h		;8474   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x02
	ld (ix+013h),a		;8478   ; guarda las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	ret			;847b
L_847C:
	dec (ix+011h)		;847c   ; el tipo 0x28: cada 2 cuadros...
	ret nz			;847f
	ld a,(ix+001h)		;8480   ; lee el paso del actor
	cp 002h		;8483   ; ...los fotogramas 0x65-0x67...
	jr nc,L_8492		;8485
	inc (ix+010h)		;8487   ; sube el fotograma del actor (p02:8A42)
	ld (ix+011h),002h		;848a   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x02
	inc (ix+001h)		;848e   ; sube el paso del actor
	ret			;8491
L_8492:
	ld a,(0e30bh)		;8492   ; ...y al acabar, con 2 o mas muertes (0xE30B)...
	cp 002h		;8495
	jp c,borra_actor		;8497   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	xor a			;849a
	ld (0e30bh),a		;849b   ; ...se cuentan de nuevo y, si no hay ya un objeto 0x29...
	call hay_tipo_29		;849e   ; hay_tipo_29: acarreo si ningun actor de 0xC400 es de tipo 0x29
	jp c,0a70dh		;84a1   ; ...queda un objeto (p03:A70D)
	jp borra_actor		;84a4   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites

; ----------------------------------------------------------------------
; DATOS resto_84A7: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (5 bytes)
;   0x84a7..0x84ac  (5 bytes)
DATA_resto_84A7:
	defb 001h,006h,011h,016h,021h	; 84a7

; ======================================================================
; CODIGO 0x84ac..0x85ef  (323 bytes)
; ======================================================================


L_84AC:
	ld a,044h		;84ac   ; un jefe vencido: el sonido 0x44...
	call 056e3h		;84ae   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld d,(ix+005h)		;84b1   ; lee la X del actor
	ld e,(ix+003h)		;84b4   ; lee la Y del actor
	push ix		;84b7
	push de			;84b9
	call borra_todos_los_actores		;84ba   ; ...fuera todos los actores...
	pop de			;84bd
	ld c,01dh		;84be   ; ...y en su sitio el actor 0x1D
	call crea_actor_0		;84c0   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;84c3
	ret			;84c5
marca_piezas:		; marca en 0xCC80 las piezas (ix+0x21) y (ix+0x26)
	ld a,(ix+020h)		;84c6   ; lee las piezas del actor (p02:8648)
	or a			;84c9   ; sin piezas, nada
	ret z			;84ca
	ld a,(ix+021h)		;84cb
	call marca_pieza		;84ce   ; marca_pieza: 0xCC80 + A = 1
	ld a,(ix+026h)		;84d1
marca_pieza:		; 0xCC80 + A = 1
	ld de,0cc80h		;84d4   ; apunta a las piezas de sprite ocupadas (22)
	call 04088h		;84d7   ; de_mas_a: DE = DE + A
	ld a,001h		;84da
	ld (de),a			;84dc
	ret			;84dd
apunta_al_personaje_80:		; p02:84E0 con A = 0x80
	ld a,080h		;84de
apunta_al_personaje:		; con 15: la direccion del actor hacia el personaje (p02:84F1)
	ld e,(ix+003h)		;84e0   ; lee la Y del actor
	ld d,(ix+005h)		;84e3   ; lee la X del actor
	push af			;84e6
	call 054a5h		;84e7   ; banco_15_en_a000: pone el banco 15 en 0xA000 (p00:54B9)
	pop af			;84ea
	call direccion_hacia		;84eb   ; direccion_hacia: las velocidades hacia el personaje con las tablas de p15:BD96/BDD6
	jp 05464h		;84ee   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
direccion_hacia:		; las velocidades hacia el personaje con las tablas de p15:BD96/BDD6
	ld (0e302h),a		;84f1
	call distancia_al_personaje		;84f4   ; distancia_al_personaje: diferencias de Y y X con el personaje y sus signos (0xE306)
	ld a,(0e304h)		;84f7   ; el angulo (p02:8530)
	ld e,a			;84fa
	ld d,000h		;84fb
	ld a,e			;84fd
	sub 03fh		;84fe   ; 0x3F - angulo
	neg		;8500
	ld hl,0bdd6h		;8502   ; p15:BDD6: el seno y el coseno de cada angulo
	push hl			;8505
	add hl,de			;8506
	ld c,(hl)			;8507   ; C = la parte X (p15:BDD6[angulo])
	pop hl			;8508
	ld e,a			;8509
	add hl,de			;850a
	ld a,(hl)			;850b   ; y la parte Y (p15:BDD6[0x3F - angulo])
	ld (0e308h),a		;850c
	ld e,c			;850f
	call escala_velocidad		;8510   ; escala_velocidad: DE = H * E / 32 (p02:858C)
	ld a,(0e306h)		;8513   ; la velocidad X: A * C / 32, con su signo
	and a			;8516
	call nz,niega_de		;8517   ; niega_de: DE = -DE
	ld (0e303h),de		;851a
	ld a,(0e308h)		;851e   ; la velocidad Y: A * la parte Y / 32, con su signo
	ld e,a			;8521
	call escala_velocidad		;8522   ; escala_velocidad: DE = H * E / 32 (p02:858C)
	ld a,(0e307h)		;8525
	and a			;8528
	call nz,niega_de		;8529   ; niega_de: DE = -DE
	ld hl,(0e303h)		;852c   ; HL = la velocidad X, DE = la Y
	ret			;852f
distancia_al_personaje:		; diferencias de Y y X con el personaje y sus signos (0xE306)
	ld hl,0e306h		;8530
	ld (hl),000h		;8533
	ld a,(0c244h)		;8535   ; la Y del personaje - 0x10 - la del actor...
	sub 010h		;8538
	sub e			;853a
	jr nc,L_8540		;853b
	neg		;853d   ; ...en valor absoluto; el signo en 0xE306
	inc (hl)			;853f
L_8540:
	inc hl			;8540   ; el signo de la diferencia de X en 0xE307
	ld (hl),000h		;8541
	rra			;8543   ; la diferencia de Y / 4 & 0x38: la fila de la tabla (0-7)
	rra			;8544
	and 038h		;8545
	ld e,a			;8547
	ld a,(0c246h)		;8548   ; la diferencia de X con el personaje, en valor absoluto
	sub d			;854b
	jr nc,L_8551		;854c
	neg		;854e
	inc (hl)			;8550
L_8551:
	rra			;8551   ; / 32: la columna (0-7)
	rra			;8552
	rra			;8553
	rra			;8554
	rra			;8555
	and 007h		;8556
	add a,e			;8558   ; + la fila
	ld hl,0bd96h		;8559   ; p15:BD96[fila * 8 + columna]: el angulo hacia el personaje
	call 04083h		;855c   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;855f
	ld (0e304h),a		;8560
	ld c,a			;8563
	ld hl,(0e306h)		;8564   ; los dos signos (0xE306/0xE307) dicen el cuadrante
	ld a,h			;8567
	ld b,000h		;8568
	and a			;856a
	jr z,L_856F		;856b
	ld b,080h		;856d
L_856F:
	cp l			;856f
	ld a,c			;8570
	jr z,L_8575		;8571
	neg		;8573
L_8575:
	add a,b			;8575
	ld (0e305h),a		;8576
	ret			;8579
escala_velocidad:		; DE = H * E / 32 (p02:858C)
	ld a,(0e302h)		;857a   ; A * E (p02:858C) y / 32 en DE
	ld h,a			;857d
	call multiplica		;857e   ; multiplica: HL = H * E (8 x 8 bits)
	xor a			;8581   ; * 8 en A:HL (tres desplazamientos)...
	add hl,hl			;8582
	adc a,a			;8583
	add hl,hl			;8584
	adc a,a			;8585
	add hl,hl			;8586
	adc a,a			;8587
	ld l,h			;8588   ; ...y el byte alto: / 32
	ld h,a			;8589
	ex de,hl			;858a
	ret			;858b
multiplica:		; HL = H * E (8 x 8 bits)
	ld b,008h		;858c
	ld l,000h		;858e
	ld d,l			;8590
L_8591:
	add hl,hl			;8591   ; 8 vueltas, bit a bit
	jr nc,L_8595		;8592
	add hl,de			;8594
L_8595:
	djnz L_8591		;8595
	ret			;8597
cuadro_de_las_esperas:		; si no muere el personaje y hay pocos actores (p02:85B1): las cuentas que sueltan los actores de 0xCC40
	ld a,(0c24bh)		;8598   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;859b
	ret z			;859d   ; muriendo, nada
	call pocos_actores		;859e   ; pocos_actores: acarreo si los actores que cuentan (el tipo 2, el 0x17 y los de clase distinta de 1 por debajo de 0x14) son menos que p02:85EF[ruina]
	ret nc			;85a1   ; con bastantes actores, nada
	call 054afh		;85a2   ; banco_9_en_a000: pone el banco 9 en 0xA000
	call cuenta_cc3b		;85a5   ; cuenta_cc3b: cada 4 cuadros, 0xCC3B - 1; a cero, 0x20 o 0x40 y 0xCC3C cambia
	call cuenta_cc36		;85a8   ; cuenta_cc36: 0xCC3D = 3, 0xCC36 - 1 y el siguiente de 0xCC37 (0-3)
	call cuenta_cc39		;85ab   ; cuenta_cc39: 0xCC3D = 2 y 0xCC39 - 1
	jp 05464h		;85ae   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
pocos_actores:		; acarreo si los actores que cuentan (el tipo 2, el 0x17 y los de clase distinta de 1 por debajo de 0x14) son menos que p02:85EF[ruina]
	ld hl,0c400h		;85b1   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld b,008h		;85b4
	ld c,000h		;85b6
L_85B8:
	ld a,(hl)			;85b8   ; cuenta los actores de tipo 2 (C); el 0x17 o un tipo por debajo de 0x14 bastan
	or a			;85b9
	jr z,L_85DD		;85ba
	cp 017h		;85bc   ; el 0x17 cuenta siempre
	jr z,L_85C9		;85be
	cp 014h		;85c0   ; del 0x14 en adelante no cuentan
	jr nc,L_85DD		;85c2
	cp 002h		;85c4
	jr nz,L_85C9		;85c6   ; el tipo 2 cuenta...
	inc c			;85c8
L_85C9:
	push af			;85c9
	call 054afh		;85ca   ; banco_9_en_a000: pone el banco 9 en 0xA000
	pop af			;85cd
	push hl			;85ce
	call lee_b70d		;85cf   ; ...y los de clase distinta de 1 (p09:B70D)
	pop hl			;85d2
	push af			;85d3
	call 05464h		;85d4   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	pop af			;85d7
	cp 001h		;85d8
	jr z,L_85DD		;85da
	inc c			;85dc
L_85DD:
	ld de,00080h		;85dd
	add hl,de			;85e0
	djnz L_85B8		;85e1
	ld a,(0c21dh)		;85e3   ; menos que p02:85EF[ruina]: acarreo
	ld hl,085efh		;85e6
	call 04083h		;85e9   ; hl_mas_a: HL = HL + A
	ld a,c			;85ec
	cp (hl)			;85ed
	ret			;85ee

; ----------------------------------------------------------------------
; DATOS resto_85EF: tablas cortas que apuntan p02:85E6 (0x85EF); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p02:85E6 (5
;   bytes)
;   0x85ef..0x85f4  (5 bytes)
DATA_resto_85EF:
	defb 002h,002h,003h,004h,005h	; 85ef

; ======================================================================
; CODIGO 0x85f4..0x86eb  (247 bytes)
; ======================================================================


cuenta_cc3b:		; cada 4 cuadros, 0xCC3B - 1; a cero, 0x20 o 0x40 y 0xCC3C cambia
	ld a,(0c00dh)		;85f4   ; cada 4 cuadros
	and 003h		;85f7
	ret nz			;85f9
	ld hl,0cc3bh		;85fa
	dec (hl)			;85fd
	ret nz			;85fe
	ld a,(0cc3ch)		;85ff   ; 0x20 o 0x40 cuadros segun 0xCC3C
	or a			;8602
	ld a,020h		;8603
	jr z,L_8609		;8605
	ld a,040h		;8607
L_8609:
	ld (hl),a			;8609
	ld a,(0cc3ch)		;860a
	xor 001h		;860d
	ld (0cc3ch),a		;860f
	ret			;8612
crea_actor_0:		; p02:8615 con B = 0
	xor a			;8613
	ld b,a			;8614
crea_actor:		; el actor C en (D, E) en el primer hueco de 0xC400
	ld a,b			;8615   ; B: la clase del objeto (0xC3AD, para (ix+0x15))
	ld (0c3adh),a		;8616
	xor a			;8619   ; 0xC3AC: todavia sin piezas
	ld (0c3ach),a		;861a
	ld a,c			;861d   ; C: el tipo
	ld (0de80h),a		;861e   ; guarda variable de trabajo del banco 0
	ld (0de81h),de		;8621   ; (D, E): la posicion
	ld hl,0c400h		;8625   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld b,008h		;8628   ; el primer actor libre de los 8
	xor a			;862a
	ld de,00080h		;862b
L_862E:
	cp (hl)			;862e
	jr z,L_8635		;862f
	add hl,de			;8631
	djnz L_862E		;8632
	ret			;8634   ; ninguno libre: nada
L_8635:
	push hl			;8635
	pop ix		;8636
	ld (0de83h),hl		;8638   ; guarda el actor que se esta creando y el byte siguiente (16 bits)
	call 054b4h		;863b   ; banco_6_en_a000: pone el banco 6 en 0xA000
	ld a,(0de80h)		;863e   ; lee variable de trabajo del banco 0
	ld hl,0b62ah		;8641   ; cuantas piezas tiene el tipo (p06:B62A)
	call 04083h		;8644   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;8647
	ld (ix+020h),a		;8648
	push af			;864b
	call 05464h		;864c   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	pop af			;864f
	ld c,a			;8650
	and a			;8651
	jr z,L_8691		;8652   ; sin piezas, a crear
	ld de,00000h		;8654   ; D cuenta los huecos de 0xCC80; E, las piezas puestas
	ld hl,0cc80h		;8657   ; apunta a las piezas de sprite ocupadas (22)
	ld b,012h		;865a   ; 0x12 huecos de sprite
L_865C:
	ld a,(hl)			;865c   ; uno libre...
	or a			;865d
	jr nz,L_866A		;865e
	ld a,001h		;8660   ; ...se ocupa
	ld (hl),a			;8662
	call pon_pieza		;8663   ; pon_pieza: el byte D en la pieza E del actor 0xDE83
	inc e			;8666   ; la pieza siguiente
	dec c			;8667
	jr z,L_8691		;8668   ; todas puestas: a crear
L_866A:
	inc d			;866a   ; el hueco siguiente
	inc hl			;866b
	djnz L_865C		;866c
	ld hl,(0de83h)		;866e   ; lee el actor que se esta creando y el byte siguiente (16 bits)
	ld a,021h		;8671   ; no caben todas: se devuelven los huecos tomados...
	call 04083h		;8673   ; hl_mas_a: HL = HL + A
	ld a,(ix+020h)		;8676
	sub c			;8679
	ret z			;867a
	ld b,a			;867b
L_867C:
	ld a,(hl)			;867c
	ld de,0cc80h		;867d   ; apunta a las piezas de sprite ocupadas (22)
	call 04088h		;8680   ; de_mas_a: DE = DE + A
	ld a,(de)			;8683
	or a			;8684
	jr z,L_868A		;8685
	ld a,000h		;8687
	ld (de),a			;8689
L_868A:
	ld de,00005h		;868a   ; 5 bytes por pieza
	add hl,de			;868d
	djnz L_867C		;868e
	ret			;8690   ; ...y no se crea
L_8691:
	ld a,001h		;8691   ; ya con piezas
	ld (0c3ach),a		;8693
	ld hl,(0de83h)		;8696   ; lee el actor que se esta creando y el byte siguiente (16 bits)
	push hl			;8699
	xor a			;869a   ; los 0x20 primeros bytes a cero
	ld b,020h		;869b
L_869D:
	ld (hl),a			;869d
	inc hl			;869e
	djnz L_869D		;869f
	pop hl			;86a1
	ld a,(0de80h)		;86a2   ; lee variable de trabajo del banco 0
	ld (hl),a			;86a5   ; el tipo
	inc l			;86a6
	ld de,(0de81h)		;86a7   ; la Y en (ix+3) y la X en (ix+5)
	inc l			;86ab
	inc l			;86ac
	ld (hl),e			;86ad
	inc l			;86ae
	inc l			;86af
	ld (hl),d			;86b0
	inc l			;86b1
	ld a,(0c3adh)		;86b2   ; la clase (B) en (ix+0x15)
	ld (ix+015h),a		;86b5
	xor a			;86b8
	ld (0c3adh),a		;86b9
	ld (ix+006h),001h		;86bc   ; si el actor se mueve (p02:8367) = 0x01
	ld (ix+014h),001h		;86c0   ; (ix+0x14) = 1
	ld (ix+013h),003h		;86c4   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x03
	call 054b4h		;86c8   ; banco_6_en_a000: pone el banco 6 en 0xA000
	ld hl,0b569h		;86cb   ; los colores de las piezas (p06:B569 y p06:B5A8)
	call piezas_al_crear		;86ce   ; piezas_al_crear: con 6: las piezas del tipo (p06:B569 y p06:B5A8)
	ld a,(0de80h)		;86d1   ; lee variable de trabajo del banco 0
	ld de,0b5ebh		;86d4   ; la vida del tipo, p06:B5EB[tipo]
	call 04088h		;86d7   ; de_mas_a: DE = DE + A
	ld a,(de)			;86da
	ld (ix+012h),a		;86db   ; guarda la vida del actor (p01:721A)
	call 05464h		;86de   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld hl,(0de83h)		;86e1   ; lee el actor que se esta creando y el byte siguiente (16 bits)
	ld a,(ix+000h)		;86e4   ; lee el tipo del actor
	dec a			;86e7   ; y lo propio del tipo - 1 (tabla p02:86EB)
	call 0408dh		;86e8   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_86EB: tabla de 63 palabras del despachador (call 0x408D en
;   0x86E8); lo leen L_408D (126 bytes)
;   0x86eb..0x8769  (126 bytes)
DATA_saltos_86EB:
	defb 0dbh,091h	; 86eb
	defb 05dh,097h	; 86ed
	defb 0fch,097h	; 86ef
	defb 005h,093h	; 86f1
	defb 036h,095h	; 86f3
	defb 012h,096h	; 86f5
	defb 079h,09dh	; 86f7
	defb 0b8h,09eh	; 86f9
	defb 0a6h,099h	; 86fb
	defb 0e2h,093h	; 86fd
	defb 0a8h,094h	; 86ff
	defb 0b4h,09fh	; 8701
	defb 046h,09bh	; 8703
	defb 09ah,09ah	; 8705
	defb 062h,0a0h	; 8707
	defb 000h,000h	; 8709
	defb 000h,000h	; 870b
	defb 000h,000h	; 870d
	defb 000h,000h	; 870f
	defb 05dh,097h	; 8711
	defb 0c2h,098h	; 8713
	defb 0e7h,095h	; 8715
	defb 099h,096h	; 8717
	defb 0ech,0a1h	; 8719
	defb 04ch,0aah	; 871b
	defb 0c1h,0b5h	; 871d
	defb 0adh,0b5h	; 871f
	defb 05eh,0b6h	; 8721
	defb 09dh,0a9h	; 8723
	defb 036h,0abh	; 8725
	defb 064h,0adh	; 8727
	defb 0d5h,0aeh	; 8729
	defb 025h,0b0h	; 872b
	defb 088h,0b4h	; 872d
	defb 0c3h,0b4h	; 872f
	defb 041h,08ch	; 8731
	defb 05eh,08ch	; 8733
	defb 041h,08ch	; 8735
	defb 035h,08ch	; 8737
	defb 05fh,084h	; 8739
	defb 027h,0a7h	; 873b
	defb 08eh,0a7h	; 873d
	defb 063h,09ah	; 873f
	defb 0e4h,0ach	; 8741
	defb 0c6h,0afh	; 8743
	defb 0c6h,0afh	; 8745
	defb 053h,0b1h	; 8747
	defb 0d9h,0b3h	; 8749
	defb 0ffh,0a1h	; 874b
	defb 03ch,0a2h	; 874d
	defb 063h,0a2h	; 874f
	defb 0f7h,0a2h	; 8751
	defb 021h,0a3h	; 8753
	defb 000h,000h	; 8755
	defb 05dh,0a3h	; 8757
	defb 000h,000h	; 8759
	defb 06dh,0a5h	; 875b
	defb 000h,000h	; 875d
	defb 019h,0a6h	; 875f
	defb 0bah,0a6h	; 8761
	defb 0bah,0a6h	; 8763
	defb 051h,0a8h	; 8765
	defb 076h,0a9h	; 8767

; ======================================================================
; CODIGO 0x8769..0x8d01  (1432 bytes)
; ======================================================================


piezas_al_crear:		; con 6: las piezas del tipo (p06:B569 y p06:B5A8)
	ld a,(ix+020h)		;8769   ; lee las piezas del actor (p02:8648)
	and a			;876c   ; sin piezas, nada
	ret z			;876d
	ld a,(ix+000h)		;876e   ; lee el tipo del actor
	dec a			;8771
	call 04083h		;8772   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;8775   ; el indice de la lista de colores
	ld hl,0b5a8h		;8776
	call 0543ah		;8779   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;877c
	ld hl,(0de83h)		;877d   ; lee el actor que se esta creando y el byte siguiente (16 bits)
	set 5,l		;8780   ; (ix+0x20): cuantas piezas
	ld b,(hl)			;8782
	ld a,005h		;8783   ; desde (ix+0x25): el color de la pieza 0
	add a,l			;8785
	ld l,a			;8786
L_8787:
	ld a,(de)			;8787   ; un byte de la lista por pieza, de 5 en 5 desde (ix+0x25)
	inc de			;8788
	ld (hl),a			;8789   ; su color
	ld a,l			;878a   ; la pieza siguiente
	add a,005h		;878b
	ld l,a			;878d
	djnz L_8787		;878e
	ret			;8790
pon_pieza:		; el byte D en la pieza E del actor 0xDE83
	push hl			;8791
	ld hl,(0de83h)		;8792   ; lee el actor que se esta creando y el byte siguiente (16 bits)
	ld a,e			;8795   ; E * 5 + 0x21: el hueco de la pieza E
	add a,a			;8796
	add a,a			;8797
	add a,e			;8798
	add a,021h		;8799
	call 04083h		;879b   ; hl_mas_a: HL = HL + A
	ld (hl),d			;879e   ; D en el
	pop hl			;879f
	ret			;87a0
prepara_la_pantalla:		; borra 0xCC40-0xCC4F y prepara los actores de la pantalla (p02:87B6)
	ld hl,0cc40h		;87a1   ; apunta a los 4 registros de actores que esperan (4 bytes cada uno)
	ld bc,0000fh		;87a4   ; 0x10 bytes a cero
	call 05f08h		;87a7   ; borra: pone a cero BC + 1 bytes desde HL
	call 054afh		;87aa   ; banco_9_en_a000: pone el banco 9 en 0xA000
	call prepara_los_actores		;87ad   ; prepara_los_actores: pone a cero las cuentas y recorre la lista de la pantalla (p02:9195): la clase 1 se crea ya, las 2 y 3 esperan en 0xCC40
	call 05464h		;87b0   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	jp recorre_cc40		;87b3   ; recorre_cc40: los 4 registros de 0xCC40
prepara_los_actores:		; pone a cero las cuentas y recorre la lista de la pantalla (p02:9195): la clase 1 se crea ya, las 2 y 3 esperan en 0xCC40
	xor a			;87b6   ; todas las cuentas de las esperas a su valor inicial
	ld (0c312h),a		;87b7
	ld (0cc35h),a		;87ba   ; guarda el registro de 0xCC40 en curso
	ld (0cc37h),a		;87bd   ; guarda el registro en curso de la lista de la pantalla
	ld (0cc3ch),a		;87c0
	inc a			;87c3   ; las cuentas de 0xCC36, 0xCC38 y 0xCC39 a 1
	ld (0cc38h),a		;87c4
	ld (0cc36h),a		;87c7
	ld (0cc39h),a		;87ca
	ld a,040h		;87cd   ; 0xCC3B a 0x40
	ld (0cc3bh),a		;87cf
	call busca_de_la_pantalla		;87d2   ; el registro de la pantalla en p09:B12B; si no hay o es 0xFF, nada
	ret c			;87d5   ; sin lista, nada
	cp 0ffh		;87d6   ; 0xFF: nada
	ret z			;87d8
L_87D9:
	ld a,(0c212h)		;87d9   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;87dc   ; cada registro de esta pantalla:
	ret nz			;87dd
	inc hl			;87de
	ld a,(hl)			;87df   ; el tipo...
	push hl			;87e0
	call lee_b70d		;87e1   ; lee_b70d: A = p09:B70D[A - 1]
	pop hl			;87e4
	or a			;87e5   ; ...clase 0: nada aqui
	jr z,L_880D		;87e6
	cp 001h		;87e8   ; ...clase 2 o 3: a esperar en 0xCC40
	jr nz,L_8812		;87ea
	ld c,(hl)			;87ec   ; clase 1: [tipo][posicion][b]...
	inc hl			;87ed
	ld a,(hl)			;87ee
	inc hl			;87ef
	ld b,(hl)			;87f0
	inc hl			;87f1
	ld e,a			;87f2   ; la posicion: X = el nibble alto + 8...
	and 0f0h		;87f3
	add a,008h		;87f5
	ld d,a			;87f7
	ld a,e			;87f8   ; ...Y = el nibble bajo * 16 + 0x14
	add a,a			;87f9
	add a,a			;87fa
	add a,a			;87fb
	add a,a			;87fc
	add a,014h		;87fd
	ld e,a			;87ff
	call 05464h		;8800   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	push hl			;8803
	call crea_actor		;8804   ; crea_actor: el actor C en (D, E) en el primer hueco de 0xC400
	pop hl			;8807
	call 054afh		;8808   ; banco_9_en_a000: pone el banco 9 en 0xA000
	jr L_87D9		;880b   ; el registro siguiente
L_880D:
	inc hl			;880d   ; clase 0: se salta
	inc hl			;880e
	inc hl			;880f
	jr L_87D9		;8810
L_8812:
	push hl			;8812   ; clase 2 o 3: se anota en 0xCC40
	call anota_cc40		;8813   ; anota_cc40: anota el registro de HL en el primer hueco de 0xCC40
	pop hl			;8816
	inc hl			;8817
	inc hl			;8818
	inc hl			;8819
	jr L_87D9		;881a
anota_cc40:		; anota el registro de HL en el primer hueco de 0xCC40
	push af			;881c   ; el registro libre de 0xCC40 en IX
	call hueco_cc40		;881d   ; hueco_cc40: DE = el primer hueco libre de 0xCC40 (4 de 4 bytes)
	push de			;8820   ; IX = el hueco de 0xCC40
	pop ix		;8821
	ld a,(hl)			;8823   ; [tipo] y dos bytes de HL, luego el tipo y A
	inc hl			;8824
	ldi		;8825   ; los dos bytes del registro...
	ldi		;8827
	ld (de),a			;8829   ; ...el tipo...
	inc de			;882a
	pop af			;882b
	ld (de),a			;882c   ; ...y la clase
	ret			;882d
hueco_cc40:		; DE = el primer hueco libre de 0xCC40 (4 de 4 bytes)
	ld de,0cc40h		;882e   ; apunta a los 4 registros de actores que esperan (4 bytes cada uno)
	ld b,004h		;8831   ; 4 huecos de 4 bytes
L_8833:
	ld a,(de)			;8833   ; el primer registro libre (0) de 0xCC40; 4 de 4 bytes
	or a			;8834
	ret z			;8835   ; libre: este
	inc de			;8836
	inc de			;8837
	inc de			;8838
	inc de			;8839
	djnz L_8833		;883a
	ret			;883c
cuadro_de_cc40:		; los 4 registros de 0xCC40 y el dibujo del de 0xCC35
	call recorre_cc40		;883d   ; recorre_cc40: los 4 registros de 0xCC40
	ld a,(0cc35h)		;8840   ; lee el registro de 0xCC40 en curso
	ld hl,0cc50h		;8843
	call 04083h		;8846   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;8849
	or a			;884a
	ret z			;884b
	ld a,(0cc35h)		;884c   ; lee el registro de 0xCC40 en curso
	ld hl,0cc40h		;884f   ; apunta a los 4 registros de actores que esperan (4 bytes cada uno)
	add a,a			;8852
	add a,a			;8853
	call 04083h		;8854   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;8857
	or a			;8858
	ret z			;8859
	ld a,(hl)			;885a
	sub 008h		;885b
	ld d,a			;885d
	inc hl			;885e
	ld e,(hl)			;885f
	inc hl			;8860
	inc hl			;8861
	ld a,(hl)			;8862
	cp 002h		;8863
	ret nz			;8865
	call dibujo_cc35_doble		;8866   ; dibujo_cc35_doble: p02:89CD y dos piezas mas de (0x80, 0x38) y (0x98, 0x38)
	ret			;8869
recorre_cc40:		; los 4 registros de 0xCC40
	ld hl,0cc40h		;886a   ; apunta a los 4 registros de actores que esperan (4 bytes cada uno)
	ld b,004h		;886d
L_886F:
	push bc			;886f   ; cada uno de los 4 registros de 0xCC40 que no esta libre
	ld a,(hl)			;8870
	or a			;8871
	push hl			;8872
	call nz,registro_cc40		;8873   ; registro_cc40: un registro [Y][X][tipo][..] de 0xCC40
	pop hl			;8876
	ld de,00004h		;8877
	add hl,de			;887a
	pop bc			;887b
	djnz L_886F		;887c
	ret			;887e
registro_cc40:		; un registro [Y][X][tipo][..] de 0xCC40
	ld d,(hl)			;887f   ; [Y][X][tipo][..]: los tipos 2 y 0x14 no se dibujan
	inc hl			;8880
	ld e,(hl)			;8881
	inc hl			;8882
	ld a,(hl)			;8883
	cp 002h		;8884
	ret z			;8886
	cp 014h		;8887
	ret z			;8889
	inc hl			;888a
	ld a,(hl)			;888b   ; el cuarto byte a 2: el dibujo grande (p02:88B6)
	cp 002h		;888c
	jr z,L_88B6		;888e
	ld a,d			;8890   ; el pequeno: 3 trozos de 16 x 8 desde (0x38, 0xB0) con TIMP
	sub 008h		;8891
	ld d,a			;8893
	ld a,e			;8894
	sub 004h		;8895
	ld e,a			;8897
	ld b,003h		;8898
	ld hl,0b038h		;889a
L_889D:
	push bc			;889d
	push hl			;889e
	push de			;889f
	ld bc,01008h		;88a0
	ld a,048h		;88a3
	call 04c73h		;88a5   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop de			;88a8
	pop hl			;88a9
	pop bc			;88aa
	ld a,e			;88ab   ; el siguiente trozo, 8 lineas mas abajo y 16 mas a la derecha en el origen
	add a,008h		;88ac
	ld e,a			;88ae
	ld a,h			;88af
	add a,010h		;88b0
	ld h,a			;88b2
	djnz L_889D		;88b3
	ret			;88b5
L_88B6:
	ld a,d			;88b6   ; el grande: 24 x 16 de (0xB0, 0x90 + (4 - B) * 16) con la operacion 0x10
	sub 00ch		;88b7
	ld d,a			;88b9
	ld a,e			;88ba
	sub 00ch		;88bb
	ld e,a			;88bd
	push de			;88be
	ex de,hl			;88bf
	ld a,l			;88c0
	add a,010h		;88c1
	ld l,a			;88c3
	ld a,004h		;88c4
	sub b			;88c6
	add a,a			;88c7
	add a,a			;88c8
	add a,a			;88c9
	add a,a			;88ca
	add a,090h		;88cb
	ld e,a			;88cd
	ld d,0b0h		;88ce
	ld bc,01810h		;88d0
	ld a,010h		;88d3
	call 04c73h		;88d5   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop de			;88d8
	ld b,004h		;88d9   ; y 4 trozos de 24 x 8 desde (0x38, 0x20) con TIMP
	ld hl,02038h		;88db
L_88DE:
	push bc			;88de   ; cada trozo: 24 x 8 con TIMP
	push hl			;88df
	push de			;88e0
	ld bc,01808h		;88e1
	ld a,048h		;88e4
	call 04c73h		;88e6   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop de			;88e9
	pop hl			;88ea
	pop bc			;88eb
	ld a,e			;88ec   ; el siguiente: 8 lineas mas abajo y 0x18 mas a la derecha en el origen
	add a,008h		;88ed
	ld e,a			;88ef
	ld a,h			;88f0
	add a,018h		;88f1
	ld h,a			;88f3
	djnz L_88DE		;88f4
	ret			;88f6
cuenta_cc39:		; 0xCC3D = 2 y 0xCC39 - 1
	ld a,002h		;88f7   ; 0xCC3D = 2 y la cuenta de 0xCC39
	ld (0cc3dh),a		;88f9
	ld hl,0cc39h		;88fc
	dec (hl)			;88ff
	ret nz			;8900
	jr L_890D		;8901
cuenta_cc36:		; 0xCC3D = 3, 0xCC36 - 1 y el siguiente de 0xCC37 (0-3)
	ld a,003h		;8903
	ld (0cc3dh),a		;8905
	ld hl,0cc36h		;8908
	dec (hl)			;890b
	ret nz			;890c
L_890D:
	call espera_cc3c		;890d   ; espera_cc3c: (HL) = 0x30 o 0x60 segun 0xCC3C
	ld a,(0cc37h)		;8910   ; lee el registro en curso de la lista de la pantalla
	cp 004h		;8913
	jr c,L_891B		;8915
	xor a			;8917
	ld (0cc37h),a		;8918   ; guarda el registro en curso de la lista de la pantalla
L_891B:
	ld (0cc35h),a		;891b   ; guarda el registro de 0xCC40 en curso
	ld hl,0cc37h		;891e   ; apunta a el registro en curso de la lista de la pantalla
	inc (hl)			;8921
	ld hl,0cc40h		;8922   ; apunta a los 4 registros de actores que esperan (4 bytes cada uno)
	add a,a			;8925
	add a,a			;8926
	call 04083h		;8927   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;892a
	or a			;892b
	jr z,L_896C		;892c
	ld d,(hl)			;892e
	ld a,d			;892f
	sub 008h		;8930
	ld d,a			;8932
	inc hl			;8933
	ld e,(hl)			;8934
	inc hl			;8935
	ld c,(hl)			;8936
	inc hl			;8937
	ld a,c			;8938
	cp 014h		;8939
	jp z,L_89B6		;893b
	cp 002h		;893e
	jp z,L_89B6		;8940
	ld a,(0cc3dh)		;8943
	cp (hl)			;8946
	jr nz,L_8965		;8947
	cp 002h		;8949
	jp z,L_89E3		;894b
	ld a,(0c246h)		;894e   ; lee la X del personaje
	sub d			;8951
	sub 008h		;8952
	add a,010h		;8954
	cp 020h		;8956
	ret c			;8958
	call 05464h		;8959   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	call desplaza_8_20		;895c   ; desplaza_8_20: D + 8 y E + 0x14
	call crea_actor_0		;895f   ; crea_actor_0: p02:8615 con B = 0
	jp 054afh		;8962   ; banco_9_en_a000: pone el banco 9 en 0xA000
L_8965:
	ld a,(0cc35h)		;8965   ; lee el registro de 0xCC40 en curso
	ld (0cc37h),a		;8968   ; guarda el registro en curso de la lista de la pantalla
	ret			;896b
L_896C:
	xor a			;896c
	ld (0cc37h),a		;896d   ; guarda el registro en curso de la lista de la pantalla
	ret			;8970
L_8971:
	ld a,080h		;8971
	ld (0cc36h),a		;8973
	ret			;8976
espera_cc3c:		; (HL) = 0x30 o 0x60 segun 0xCC3C
	ld a,(0cc3ch)		;8977
	or a			;897a
	ld a,030h		;897b
	jr z,L_8981		;897d
	ld a,060h		;897f
L_8981:
	ld (hl),a			;8981
	ret			;8982
lado_del_personaje:		; D = L si la X del personaje es < 0x80, si no H
	ld a,(0c246h)		;8983   ; lee la X del personaje
	cp 080h		;8986
	ld d,l			;8988
	ret c			;8989
	ld d,h			;898a
	ret			;898b
L_898C:
	xor a			;898c
	ld (hl),a			;898d
	push de			;898e
	push bc			;898f
	call dibujo_cc35		;8990   ; dibujo_cc35: copia 24 x 16 de la fila 0xCC35 con TIMP (0x40)
	push de			;8993
	ld hl,05038h		;8994
	ld bc,01808h		;8997
	ld a,048h		;899a
	call 04c73h		;899c   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop de			;899f
	ld a,e			;89a0
	add a,008h		;89a1
	ld e,a			;89a3
	ld hl,06838h		;89a4
	ld bc,01808h		;89a7
	ld a,048h		;89aa
	call 04c73h		;89ac   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop bc			;89af
	pop de			;89b0
	call desplaza_8_20		;89b1   ; desplaza_8_20: D + 8 y E + 0x14
	jr L_89C4		;89b4
L_89B6:
	call azar		;89b6   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	and 001h		;89b9
	ret z			;89bb
	ld hl,020e0h		;89bc
	call lado_del_personaje		;89bf   ; lado_del_personaje: D = L si la X del personaje es < 0x80, si no H
	ld e,020h		;89c2
L_89C4:
	call 05464h		;89c4   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	call crea_actor_0		;89c7   ; crea_actor_0: p02:8615 con B = 0
	jp 054afh		;89ca   ; banco_9_en_a000: pone el banco 9 en 0xA000
dibujo_cc35:		; copia 24 x 16 de la fila 0xCC35 con TIMP (0x40)
	call origen_cc35		;89cd   ; origen_cc35: HL = (0xB0, 0x90 + 0xCC35 * 16)
	ld bc,01810h		;89d0
	ld a,d			;89d3
	sub 004h		;89d4
	ld d,a			;89d6
	ld a,e			;89d7
	add a,004h		;89d8
	ld e,a			;89da
	push de			;89db
	ld a,040h		;89dc
	call 04c73h		;89de   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop de			;89e1
	ret			;89e2
L_89E3:
	ld a,(0cc35h)		;89e3   ; lee el registro de 0xCC40 en curso
	ld hl,0cc50h		;89e6
	call 04083h		;89e9   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;89ec
	or a			;89ed
	jr nz,L_898C		;89ee
	ld a,(0c246h)		;89f0   ; lee la X del personaje
	sub d			;89f3
	sub 008h		;89f4
	add a,010h		;89f6
	cp 020h		;89f8
	ret c			;89fa
	ld a,010h		;89fb
	ld (0cc39h),a		;89fd
	ld a,001h		;8a00
	ld (hl),a			;8a02
	ld a,(0cc35h)		;8a03   ; lee el registro de 0xCC40 en curso
	ld (0cc37h),a		;8a06   ; guarda el registro en curso de la lista de la pantalla
dibujo_cc35_doble:		; p02:89CD y dos piezas mas de (0x80, 0x38) y (0x98, 0x38)
	call dibujo_cc35		;8a09   ; dibujo_cc35: copia 24 x 16 de la fila 0xCC35 con TIMP (0x40)
	push de			;8a0c
	ld h,080h		;8a0d
	call copia_24x8		;8a0f   ; copia_24x8: copia 24 x 8 de (H, 0x38) a (D, E) con TIMP
	pop de			;8a12
	ld a,e			;8a13
	add a,008h		;8a14
	ld e,a			;8a16
	ld h,098h		;8a17
copia_24x8:		; copia 24 x 8 de (H, 0x38) a (D, E) con TIMP
	ld l,038h		;8a19
	ld bc,01808h		;8a1b
	ld a,048h		;8a1e
	jp 04c73h		;8a20   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
origen_cc35:		; HL = (0xB0, 0x90 + 0xCC35 * 16)
	ld a,(0cc35h)		;8a23   ; la fila de la pagina 1 del dibujo 0xCC35: 0x90 + 0xCC35 * 16
	add a,a			;8a26
	add a,a			;8a27
	add a,a			;8a28
	add a,a			;8a29
	add a,090h		;8a2a
	ld h,0b0h		;8a2c
	ld l,a			;8a2e
	ret			;8a2f
desplaza_8_20:		; D + 8 y E + 0x14
	ld a,d			;8a30   ; D + 8, E + 0x14: del actor al sitio de su dibujo
	add a,008h		;8a31
	ld d,a			;8a33
	ld a,e			;8a34
	add a,014h		;8a35
	ld e,a			;8a37
	ret			;8a38
fotograma_del_actor:		; con 15: el fotograma (ix+0x10) del actor (p02:8A42)
	call 054a5h		;8a39   ; banco_15_en_a000: pone el banco 15 en 0xA000 (p00:54B9)
	call piezas_del_fotograma		;8a3c   ; piezas_del_fotograma: la posicion y el patron de cada pieza del fotograma (p15:B744)
	jp 05464h		;8a3f   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
piezas_del_fotograma:		; la posicion y el patron de cada pieza del fotograma (p15:B744)
	ld a,(ix+010h)		;8a42   ; el fotograma (ix+0x10): su puntero en p15:B744
	ld l,a			;8a45   ; el fotograma * 2
	ld h,000h		;8a46
	add hl,hl			;8a48
	ld de,0b744h		;8a49
	add hl,de			;8a4c
	ld e,(hl)			;8a4d
	inc hl			;8a4e
	ld d,(hl)			;8a4f
	push ix		;8a50   ; cuantas piezas: (ix+0x20)
	pop hl			;8a52
	set 5,l		;8a53   ; (ix+0x20)
	ld b,(hl)			;8a55
	ld a,b			;8a56
	or a			;8a57
	ret z			;8a58   ; sin piezas, nada
	inc l			;8a59   ; desde la Y de la pieza 0 (ix+0x22)
	inc l			;8a5a
	ld a,(de)			;8a5b   ; el primer byte: 0x80-0x84 es una plantilla de desplazamientos (p02:8A77)
	cp 080h		;8a5c   ; [dy][dx][patron] por pieza:
	jr nc,L_8A77		;8a5e
L_8A60:
	ld a,(de)			;8a60   ; dy...
	inc de			;8a61
	add a,(ix+003h)		;8a62   ; le suma la Y del actor
	ld (hl),a			;8a65   ; ...+ la Y del actor
	inc l			;8a66
	ld a,(de)			;8a67   ; dx...
	add a,(ix+005h)		;8a68   ; le suma la X del actor
	ld (hl),a			;8a6b   ; ...+ la X
	inc de			;8a6c
	inc l			;8a6d
	ld a,(de)			;8a6e   ; el patron
	ld (hl),a			;8a6f
	inc de			;8a70
	inc l			;8a71   ; la pieza siguiente
	inc l			;8a72
	inc l			;8a73
	djnz L_8A60		;8a74
	ret			;8a76
L_8A77:
	cp 085h		;8a77   ; 0x85 en adelante: una pieza mas
	jr nc,L_8A60		;8a79
	sub 080h		;8a7b   ; 0x80-0x84: la plantilla
	exx			;8a7d
	ld hl,0b6feh		;8a7e
	call 0543ah		;8a81   ; palabra_a: HL = la palabra A de la tabla HL
	exx			;8a84
L_8A85:
	exx			;8a85   ; cada pieza: la Y + dy, la X + dx y el patron
	ld a,(hl)			;8a86
	inc hl			;8a87
	add a,(ix+003h)		;8a88   ; le suma la Y del actor
	exx			;8a8b
	ld (hl),a			;8a8c
	inc l			;8a8d
	exx			;8a8e
	ld a,(hl)			;8a8f
	inc hl			;8a90
	add a,(ix+005h)		;8a91   ; le suma la X del actor
	exx			;8a94
	ld (hl),a			;8a95
	inc l			;8a96
	inc de			;8a97   ; el patron de la pieza
	ld a,(de)			;8a98
	ld (hl),a			;8a99
	inc l			;8a9a
	inc l			;8a9b
	inc l			;8a9c
	djnz L_8A85		;8a9d
	ret			;8a9f
sprites_de_actores:		; los atributos de las piezas de los 8 actores de 0xC400 (p02:8AB8)
	ld hl,0c400h		;8aa0   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld b,008h		;8aa3   ; los 8 actores
L_8AA5:
	push hl			;8aa5   ; las piezas de los 8 actores de 0xC400
	pop ix		;8aa6
	push bc			;8aa8
	push hl			;8aa9
	ld a,(hl)			;8aaa
	and a			;8aab   ; con tipo...
	call nz,sprites_de_piezas		;8aac   ; sprites_de_piezas: los atributos de cada pieza del actor en 0xDE28
	pop hl			;8aaf
	pop bc			;8ab0
	ld de,00080h		;8ab1   ; el siguiente
	add hl,de			;8ab4
	djnz L_8AA5		;8ab5
	ret			;8ab7
sprites_de_piezas:		; los atributos de cada pieza del actor en 0xDE28
	set 5,l		;8ab8   ; cuantas piezas tiene el actor: (ix+0x20)
	ld b,(hl)			;8aba   ; cuantas piezas
	ld a,b			;8abb
	and a			;8abc
	ret z			;8abd
	inc l			;8abe   ; el hueco de la pieza
sprites_de_las_piezas:		; cada pieza de HL: Y, X y patron a su hueco de 0xDE28 y su color (p02:8AB8 sin contar)
	push bc			;8abf   ; cada pieza: su hueco en 0xDE28 (4 bytes por sprite)
	ld a,(hl)			;8ac0
	ld b,a			;8ac1
	inc l			;8ac2
	add a,a			;8ac3   ; * 4: su sprite en 0xDE28
	add a,a			;8ac4
	ex af,af'			;8ac5
	ld de,0de28h		;8ac6   ; apunta a la Y del sprite 10 en RAM
	ex af,af'			;8ac9
	add a,e			;8aca
	ld e,a			;8acb
	ld c,0ffh		;8acc
	ldi		;8ace   ; Y, X y patron a los atributos
	ldi		;8ad0   ; Y, X...
	ldi		;8ad2
	ld a,(ix+001h)		;8ad4   ; (ix+1) bit 7: colores propios; si no, de 0x6E50 + patron * 16
	and 080h		;8ad7   ; con el bit 7 de (ix+1), sus colores ya estan
	jr nz,L_8AF0		;8ad9
	ex de,hl			;8adb   ; 0xDCA0 + hueco * 16: sus 16 lineas de color
	ld hl,06e50h		;8adc
	ld a,b			;8adf
	add a,a			;8ae0
	add a,a			;8ae1
	add a,a			;8ae2
	ld c,a			;8ae3
	ld b,000h		;8ae4
	add hl,bc			;8ae6
	add hl,hl			;8ae7
	ex de,hl			;8ae8
	ld a,(hl)			;8ae9   ; el color de la pieza...
	ld b,010h		;8aea
L_8AEC:
	ld (de),a			;8aec   ; ...en las 16 lineas
	inc e			;8aed
	djnz L_8AEC		;8aee
L_8AF0:
	pop bc			;8af0
	inc l			;8af1   ; la pieza siguiente
	djnz sprites_de_las_piezas		;8af2
	ret			;8af4
L_8AF5:
	push ix		;8af5   ; la plantilla: 11 bytes desde (ix+7)
	pop de			;8af7
	ld a,e			;8af8   ; desde (ix+7): velocidades y aceleraciones
	add a,007h		;8af9
	ld e,a			;8afb
	ldir		;8afc
	ret			;8afe
invierte_velocidad_y:		; la velocidad Y del actor, al reves (p02:8B0D con A = 8)
	ld a,008h		;8aff   ; (ix+7, 8): la velocidad Y
	jr L_8B0D		;8b01
invierte_velocidad_x:		; la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	ld a,00ah		;8b03
	jr L_8B0D		;8b05
L_8B07:
	ld a,00dh		;8b07   ; (ix+0x0C, 0x0D): la aceleracion Y
	jr L_8B0D		;8b09
L_8B0B:
	ld a,00fh		;8b0b   ; (ix+0x0E, 0x0F): la aceleracion X
L_8B0D:
	push ix		;8b0d   ; el campo de 16 bits (ix+A - 1, ix+A)...
	pop hl			;8b0f
	call 04083h		;8b10   ; hl_mas_a: HL = HL + A
	ld d,(hl)			;8b13
	dec hl			;8b14
	ld e,(hl)			;8b15
	call niega_de		;8b16   ; ...al reves
	ld (hl),e			;8b19
	inc hl			;8b1a
	ld (hl),d			;8b1b
	ret			;8b1c
distancia_y:		; A = |Y del personaje - Y del actor|
	ld a,(0c244h)		;8b1d   ; lee la Y del personaje
	sub (ix+003h)		;8b20   ; le resta la Y del actor
	ret nc			;8b23   ; positivo: tal cual
	neg		;8b24   ; negativo: en valor absoluto
	ret			;8b26
distancia_x:		; A = |X del personaje - X del actor|
	ld a,(0c246h)		;8b27   ; lee la X del personaje
	sub (ix+005h)		;8b2a   ; le resta la X del actor
	ret nc			;8b2d
	neg		;8b2e
	ret			;8b30
niega_hl:		; HL = -HL
	ld a,h			;8b31   ; complemento a dos de HL
	cpl			;8b32   ; complemento a dos de HL
	ld h,a			;8b33
	ld a,l			;8b34
	cpl			;8b35
	ld l,a			;8b36
	inc hl			;8b37
	ret			;8b38
niega_de:		; DE = -DE
	ld a,d			;8b39   ; complemento a dos de DE
	cpl			;8b3a   ; complemento a dos de DE
	ld d,a			;8b3b
	ld a,e			;8b3c
	cpl			;8b3d
	ld e,a			;8b3e
	inc de			;8b3f
	ret			;8b40
compara_y:		; compara la Y del personaje con la del actor
	ld a,(0c244h)		;8b41   ; lee la Y del personaje
	cp (ix+003h)		;8b44   ; compara con la Y del actor
	ret			;8b47
compara_x:		; compara la X del personaje con la del actor
	ld a,(0c246h)		;8b48   ; lee la X del personaje
	cp (ix+005h)		;8b4b   ; compara con la X del actor
	ret			;8b4e
azar:		; 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	push hl			;8b4f
	ld a,(0c3a0h)		;8b50   ; el numero al azar anterior...
	ld hl,(0c246h)		;8b53   ; lee la X del personaje y el byte siguiente (16 bits)
	call 04083h		;8b56   ; hl_mas_a: HL = HL + A
	ld a,(0c3a0h)		;8b59
	add a,(hl)			;8b5c
	ld hl,0c00dh		;8b5d   ; apunta a la cuenta de cuadros del juego
	add a,(hl)			;8b60
	add a,00bh		;8b61
	ld (0c3a0h),a		;8b63   ; ...el nuevo
	pop hl			;8b66
	ret			;8b67
L_8B68:
	bit 0,(ix+017h)		;8b68   ; con (ix+0x17) bit 0...
	jr z,alterna_b		;8b6c
	inc b			;8b6e   ; ...B + 2
	inc b			;8b6f
alterna_b:		; (ix+0x18) + 1; con (ix+0x18) & C, B + 1
	inc (ix+018h)		;8b70
	ld a,(ix+018h)		;8b73
	and c			;8b76
	jr z,L_8B7A		;8b77
	inc b			;8b79
L_8B7A:
	ld (ix+010h),b		;8b7a   ; guarda el fotograma del actor (p02:8A42)
	ret			;8b7d
velocidad_y_l:		; (ix+7, 8) = L (H = 0)
	ld h,000h		;8b7e   ; HL = H * 256
velocidad_y_h:		; (ix+7, 8) = H * 256 (L = 0)
	ld l,000h		;8b80
pon_velocidad_y:		; (ix+7, 8) = HL
	ld (ix+008h),h		;8b82   ; guarda la velocidad Y del actor (alta)
	ld (ix+007h),l		;8b85   ; guarda la velocidad Y del actor
	ret			;8b88
velocidad_x_l:		; (ix+9, 0x0A) = L (H = 0)
	ld h,000h		;8b89   ; HL = H * 256
velocidad_x_h:		; (ix+9, 0x0A) = H * 256 (L = 0)
	ld l,000h		;8b8b
pon_velocidad_x:		; (ix+9, 0x0A) = HL
	ld (ix+00ah),h		;8b8d   ; guarda la velocidad X del actor (alta)
	ld (ix+009h),l		;8b90   ; guarda la velocidad X del actor
	ret			;8b93
pon_aceleracion_x:		; (ix+0x0E, 0x0F) = HL
	ld (ix+00fh),h		;8b94   ; guarda la aceleracion X del actor (alta)
	ld (ix+00eh),l		;8b97   ; guarda la aceleracion X del actor
	ret			;8b9a
pon_aceleracion_y:		; (ix+0x0C, 0x0D) = HL
	ld (ix+00dh),h		;8b9b   ; guarda la aceleracion Y del actor (alta)
	ld (ix+00ch),l		;8b9e   ; guarda la aceleracion Y del actor
	ret			;8ba1
alinea_y_para:		; la Y del actor al centro de su fila (p03:A683), sin aceleracion y quieto
	call 0a683h		;8ba2   ; alinea_y: la Y del actor al centro de su fila de 8 (+ 4)
	ld (ix+00bh),000h		;8ba5   ; si el actor acelera (p02:8393) = 0x00
para_actor:		; velocidades a cero
	xor a			;8ba9
	ld (ix+00ah),a		;8baa   ; guarda la velocidad X del actor (alta)
	ld (ix+009h),a		;8bad   ; guarda la velocidad X del actor
	ld (ix+008h),a		;8bb0   ; guarda la velocidad Y del actor (alta)
	ld (ix+007h),a		;8bb3   ; guarda la velocidad Y del actor
	ret			;8bb6
mira_alrededor:		; las casillas alrededor del actor segun las direcciones de A (p01:704C)
	ld b,004h		;8bb7   ; 4 direcciones (bits de A, de dos en dos)
L_8BB9:
	ld c,a			;8bb9   ; A trae una direccion por bit: se miran las 4 (B)
	push de			;8bba
	and a			;8bbb
	bit 7,a		;8bbc
	jr z,L_8BDC		;8bbe
	ld a,b			;8bc0   ; las direcciones 1 y 2 a 4 puntos; las demas en DE
	cp 003h		;8bc1
	jr nc,L_8BC7		;8bc3
	ld e,004h		;8bc5
L_8BC7:
	bit 0,b		;8bc7
	jr z,L_8BCD		;8bc9
	ld d,000h		;8bcb
L_8BCD:
	ld a,(ix+003h)		;8bcd   ; lee la Y del actor
	add a,e			;8bd0
	ld e,a			;8bd1
	ld a,(ix+005h)		;8bd2   ; lee la X del actor
	add a,d			;8bd5
	ld d,a			;8bd6
	push bc			;8bd7
	call 0704ch		;8bd8   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop bc			;8bdb
L_8BDC:
	pop de			;8bdc   ; el resultado, un bit por direccion con suelo, en (ix+0x16)
	ld a,c			;8bdd
	rla			;8bde
	djnz L_8BB9		;8bdf
	and 00fh		;8be1   ; los 4 resultados en (ix+0x16)
	ld (ix+016h),a		;8be3
	ret			;8be6
L_8BE7:
	bit 0,(ix+017h)		;8be7
	jr z,L_8BF5		;8beb
	bit 7,(ix+00ah)		;8bed   ; mira el bit 7 de la velocidad X del actor (alta)
	ret nz			;8bf1
	jp invierte_velocidad_x		;8bf2   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
L_8BF5:
	bit 7,(ix+00ah)		;8bf5   ; mira el bit 7 de la velocidad X del actor (alta)
	ret z			;8bf9
	jp invierte_velocidad_x		;8bfa   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
L_8BFD:
	ld a,(ix+00ah)		;8bfd   ; lee la velocidad X del actor (alta)
	and a			;8c00
	ret z			;8c01
	bit 7,(ix+00ah)		;8c02   ; mira el bit 7 de la velocidad X del actor (alta)
	ld a,000h		;8c06
	jr z,L_8C0B		;8c08
	inc a			;8c0a
L_8C0B:
	ld (ix+017h),a		;8c0b
	ret			;8c0e
pon_fotograma:		; (ix+0x10) = H y (ix+0x11) = L
	ld (ix+010h),h		;8c0f   ; guarda el fotograma del actor (p02:8A42)
	ld (ix+011h),l		;8c12   ; guarda la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret			;8c15
estado_del_que_se_lleva:		; A = el estado del personaje que se lleva
	ld a,(0c240h)		;8c16   ; lee el personaje que se lleva (0 o 1)
	or a			;8c19
	ld a,(0c2b6h)		;8c1a   ; lee el estado del personaje 0
	ret z			;8c1d   ; Z: el del personaje 0
	ld a,(0c2d6h)		;8c1e   ; lee el estado del personaje 1
	ret			;8c21
crea_actor_aqui:		; crea el actor C en la posicion del actor IX
	ld d,(ix+005h)		;8c22   ; lee la X del actor
	ld e,(ix+003h)		;8c25   ; lee la Y del actor
	push ix		;8c28
	call crea_actor_0		;8c2a   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;8c2d
	ret			;8c2f
L_8C30:
	ld c,024h		;8c30   ; el actor 0x24 aqui
	jp crea_actor_aqui		;8c32   ; crea_actor_aqui: crea el actor C en la posicion del actor IX
L_8C35:
	ld (ix+013h),001h		;8c35   ; el tipo 36 (paso 0): choca con el personaje, fotograma 0x64...
	ld (ix+010h),064h		;8c39   ; el fotograma del actor (p02:8A42) = 0x64
	ld a,040h		;8c3d   ; ...y va hacia el personaje a 0x40
	jr L_8C47		;8c3f
L_8C41:
	ld (ix+010h),088h		;8c41   ; el tipo 39: fotograma 0x88 y hacia el personaje a 0x50
	ld a,050h		;8c45
L_8C47:
	ld (ix+00bh),000h		;8c47   ; si el actor acelera (p02:8393) = 0x00
	call apunta_al_personaje		;8c4b   ; apunta_al_personaje: con 15: la direccion del actor hacia el personaje (p02:84F1)
	call pon_velocidad_y		;8c4e   ; la velocidad Y...
	ex de,hl			;8c51   ; ...y la X
	jp pon_velocidad_x		;8c52   ; pon_velocidad_x: (ix+9, 0x0A) = HL
L_8C55:
	ret			;8c55
L_8C56:
	ld (0c3afh),a		;8c56   ; la velocidad X alta en 0xC3AF y el actor 0x25 aqui
	ld c,025h		;8c59
	jp crea_actor_aqui		;8c5b   ; crea_actor_aqui: crea el actor C en la posicion del actor IX
L_8C5E:
	ld a,(0c3afh)		;8c5e   ; con la velocidad X de 0xC3AF, sin Y, fotograma 0x88
	ld (ix+00ah),a		;8c61   ; guarda la velocidad X del actor (alta)
	xor a			;8c64
	ld (ix+008h),a		;8c65   ; guarda la velocidad Y del actor (alta)
	ld (ix+00bh),a		;8c68   ; guarda si el actor acelera (p02:8393)
	ld (ix+010h),088h		;8c6b   ; el fotograma del actor (p02:8A42) = 0x88
	ret			;8c6f
copia_84_y_c310:		; copia 0x10 x 0x20 de (0x84, 0) a (0xA4, 0) y sigue segun 0xC310
	ld hl,00084h		;8c70
	ld de,000a4h		;8c73
	ld bc,01020h		;8c76
	xor a			;8c79
	call 04bdeh		;8c7a   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	ld a,(0c310h)		;8c7d   ; lee el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	cp 003h		;8c80   ; del paso 3 en adelante...
	ret c			;8c82
	push af			;8c83
	ld hl,07094h		;8c84   ; ...borra 0x20 x 0x10 en (0x94, 0x70)
	ld bc,02010h		;8c87
	call 05e2fh		;8c8a   ; borra_rectangulo: HMMV con 0xFF en la pagina 0
	pop af			;8c8d
	push af			;8c8e
	sub 005h		;8c8f   ; en los pasos 5 y 6, el dibujo grande de p02:8CCA
	cp 002h		;8c91
	call c,copia_9060		;8c93   ; copia_9060: copia 0x70 x 0x70 de (0x60, 0x90) a (0x34, 0x48)
	pop af			;8c96
	cp 006h		;8c97   ; del 6 en adelante, p02:8CAD
	call nc,copia_8078		;8c99   ; copia_8078: p02:8D8A y dos copias de 16 x 16 de (0x78, 0x80)
	ld a,(0c21ch)		;8c9c   ; lee no queda ningun 0x19 (la sala 5, acabada)
	and a			;8c9f
	ret z			;8ca0   ; con la sala acabada...
	ld hl,0f0a4h		;8ca1   ; ...borra 0x10 x 0x20 en (0xA4, 0xF0) y los actores
	ld bc,01020h		;8ca4
	call 05e2fh		;8ca7   ; borra_rectangulo: HMMV con 0xFF en la pagina 0
	jp borra_d45e_y_actores		;8caa   ; borra_d45e_y_actores: pone a cero 4 registros de 0xD45E y borra los actores
copia_8078:		; p02:8D8A y dos copias de 16 x 16 de (0x78, 0x80)
	call copia_6098		;8cad   ; copia_6098: copia 24 x 16 de (0x98, 0x60) a (0x4C, 0x78)
	ld hl,08078h		;8cb0   ; 16 x 16 de (0x78, 0x80) de la pagina 1...
	ld de,0c094h		;8cb3   ; a (0xC0, 0x94) de la pagina 1 (DE es la posicion, no RAM)
	ld bc,01010h		;8cb6
	ld a,005h		;8cb9
	call 04bdeh		;8cbb   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	ld hl,08078h		;8cbe   ; ...y otra vez a (0x68, 0x78) de la 0
	ld de,07868h		;8cc1
	ld bc,01010h		;8cc4
	jp 04841h		;8cc7   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
copia_9060:		; copia 0x70 x 0x70 de (0x60, 0x90) a (0x34, 0x48)
	ld de,04834h		;8cca
	ld bc,07070h		;8ccd
	ld hl,09060h		;8cd0
	jp 04841h		;8cd3   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
prepara_la_sala_5:		; 0xC314 = 0x10, 0xC312 y 0xC310 a cero, y en la sala 5 lo suyo
	ld a,010h		;8cd6
	ld (0c314h),a		;8cd8   ; guarda la cuenta de la sala del final de fase o de la sala 5
	xor a			;8cdb
	ld (0c312h),a		;8cdc
	ld (0c310h),a		;8cdf   ; guarda el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	ld a,(0c20ah)		;8ce2   ; lee en la sala de la puerta 5
	or a			;8ce5
	ret z			;8ce6
	call 05a87h		;8ce7   ; en la sala 5: la paleta de p00:5A8D...
	call crea_tipo_23		;8cea   ; crea_tipo_23: si vive algun personaje y 0xC270 es la fase: crea el actor 0x23 en (0x34, 0x80)
	ld hl,000a4h		;8ced   ; ...y borra 0x10 x 0x20 en (0xA4, 0)
	ld bc,01020h		;8cf0
	jp 05e2fh		;8cf3   ; borra_rectangulo: HMMV con 0xFF en la pagina 0
cuadro_de_la_sala_5:		; en la sala 5, despacha 0xC310 (tabla p02:8D01)
	ld a,(0c20ah)		;8cf6   ; lee en la sala de la puerta 5
	or a			;8cf9
	ret z			;8cfa
	ld a,(0c310h)		;8cfb   ; lee el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	call 0408dh		;8cfe   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_8D01: tabla de 11 palabras del despachador (call 0x408D en
;   0x8CFE); lo leen L_408D (22 bytes)
;   0x8d01..0x8d17  (22 bytes)
DATA_saltos_8D01:
	defb 032h,08dh	; 8d01
	defb 017h,08dh	; 8d03
	defb 03bh,08dh	; 8d05
	defb 03ch,08dh	; 8d07
	defb 07fh,08dh	; 8d09
	defb 098h,08dh	; 8d0b
	defb 0fbh,08dh	; 8d0d
	defb 045h,08eh	; 8d0f
	defb 059h,08eh	; 8d11
	defb 03bh,08dh	; 8d13
	defb 03bh,08dh	; 8d15

; ======================================================================
; CODIGO 0x8d17..0x8dd6  (191 bytes)
; ======================================================================


L_8D17:
	ld hl,0c314h		;8d17   ; 0xC314 baja: borra una linea mas del recuadro (LMMM)
	dec (hl)			;8d1a
	ld a,010h		;8d1b
	sub (hl)			;8d1d
	ld b,a			;8d1e
	ld c,020h		;8d1f
	ld h,(hl)			;8d21
	ld l,084h		;8d22
	ld de,000a4h		;8d24
	xor a			;8d27
	call 04c73h		;8d28   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	ld a,(0c314h)		;8d2b   ; al llegar a cero, 0xC310 + 1
	or a			;8d2e
	ret nz			;8d2f
	jr suma_c310		;8d30
L_8D32:
	ld a,024h		;8d32   ; el sonido 0x24 y el paso siguiente
	call 056e3h		;8d34   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
suma_c310:		; 0xC310 + 1
	ld hl,0c310h		;8d37   ; apunta a el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	inc (hl)			;8d3a
L_8D3B:
	ret			;8d3b
L_8D3C:
	ld a,(0c314h)		;8d3c   ; 0xC314 sube: copia las lineas del recuadro una a una hacia arriba
	cp 00fh		;8d3f
	ld l,0a2h		;8d41
	jr z,L_8D5E		;8d43
	ld b,a			;8d45
	ld a,00fh		;8d46
	sub b			;8d48
	ld b,a			;8d49
	ld hl,070a2h		;8d4a
L_8D4D:
	push bc			;8d4d   ; cada linea de 32 se copia una linea mas abajo (HMMM de 32 x 1)
	ld d,h			;8d4e
	ld e,l			;8d4f
	inc e			;8d50
	ld bc,02001h		;8d51
	xor a			;8d54
	push hl			;8d55
	call 04bdeh		;8d56   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop hl			;8d59
	dec l			;8d5a   ; la de encima
	pop bc			;8d5b
	djnz L_8D4D		;8d5c
L_8D5E:
	inc l			;8d5e   ; la ultima linea, de (0x50, ...) a (0x70, L)
	ld e,l			;8d5f
	ld d,070h		;8d60
	ld h,050h		;8d62
	ld bc,02001h		;8d64
	xor a			;8d67
	call 04bdeh		;8d68   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	ld hl,0c314h		;8d6b   ; apunta a la cuenta de la sala del final de fase o de la sala 5
	ld a,(hl)			;8d6e
	cp 00fh		;8d6f
	jr z,L_8D75		;8d71
	inc (hl)			;8d73
	ret			;8d74
L_8D75:
	ld a,087h		;8d75
	call 056e3h		;8d77   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	call prepara_c888		;8d7a   ; prepara_c888: 4 bytes de p02:8ED2 a 0xC888 y sus cuentas
	jr suma_c310		;8d7d
L_8D7F:
	call paso_c888		;8d7f   ; paso_c888: cada 4 cuadros, el siguiente paso del dibujo de 0xC888 (p02:8F06)
	ret nc			;8d82
	ld a,040h		;8d83
	ld (0c314h),a		;8d85   ; guarda la cuenta de la sala del final de fase o de la sala 5
	jr suma_c310		;8d88
copia_6098:		; copia 24 x 16 de (0x98, 0x60) a (0x4C, 0x78)
	ld hl,06098h		;8d8a
	ld de,0784ch		;8d8d
	ld bc,01018h		;8d90
	ld a,001h		;8d93
	jp 04bdeh		;8d95   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
L_8D98:
	call color_12_parpadea		;8d98   ; color_12_parpadea: el color 12 de la paleta de p02:8E26 segun la cuenta de cuadros
	ld hl,0c314h		;8d9b   ; apunta a la cuenta de la sala del final de fase o de la sala 5
	dec (hl)			;8d9e
	ret nz			;8d9f
	call copia_8078		;8da0   ; copia_8078: p02:8D8A y dos copias de 16 x 16 de (0x78, 0x80)
	call crea_tipo_19_por_ruina		;8da3   ; crea_tipo_19_por_ruina: crea ruina + 1 actores de tipo 0x19 en (0x78, 0x80), contados en 0xC313
	call suma_c310		;8da6   ; suma_c310: 0xC310 + 1
	ld a,(0c21dh)		;8da9   ; lee la ruina (0-4)
	ld hl,08dd6h		;8dac
	call 04083h		;8daf   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;8db2
	ld de,01010h		;8db3
	jp crea_actor_0		;8db6   ; crea_actor_0: p02:8615 con B = 0
crea_tipo_19_por_ruina:		; crea ruina + 1 actores de tipo 0x19 en (0x78, 0x80), contados en 0xC313
	xor a			;8db9
	ld (0c313h),a		;8dba   ; guarda cuenta de trabajo de los actores
	ld a,(0c21dh)		;8dbd   ; lee la ruina (0-4)
	inc a			;8dc0
	ld b,a			;8dc1
L_8DC2:
	ld c,019h		;8dc2
	ld de,08078h		;8dc4
	push bc			;8dc7
	call crea_actor_0		;8dc8   ; crea_actor_0: p02:8615 con B = 0
	pop bc			;8dcb
	ld a,(0c313h)		;8dcc   ; lee cuenta de trabajo de los actores
	inc a			;8dcf
	ld (0c313h),a		;8dd0   ; guarda cuenta de trabajo de los actores
	djnz L_8DC2		;8dd3
	ret			;8dd5

; ----------------------------------------------------------------------
; DATOS resto_8DD6: tablas cortas que apuntan p02:8DAC (0x8DD6); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p02:8DAC (6
;   bytes)
;   0x8dd6..0x8ddc  (6 bytes)
DATA_resto_8DD6:
	defb 031h,032h,033h,034h,035h,036h	; 8dd6

; ======================================================================
; CODIGO 0x8ddc..0x8e26  (74 bytes)
; ======================================================================


sin_tipo_19:		; si no queda ningun actor de tipo 0x19: 0xC21C = 1 y el sonido 0x42
	ld a,(0c24bh)		;8ddc   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;8ddf
	ret z			;8de1
	ld hl,0c400h		;8de2   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld de,00080h		;8de5
	ld b,008h		;8de8
L_8DEA:
	ld a,019h		;8dea
	cp (hl)			;8dec
	ret z			;8ded
	add hl,de			;8dee
	djnz L_8DEA		;8def
	ld a,001h		;8df1
	ld (0c21ch),a		;8df3   ; guarda no queda ningun 0x19 (la sala 5, acabada)
	ld a,042h		;8df6
	jp 056e3h		;8df8   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_8DFB:
	call sin_tipo_19		;8dfb   ; sin_tipo_19: si no queda ningun actor de tipo 0x19: 0xC21C = 1 y el sonido 0x42
	call color_12_parpadea		;8dfe   ; color_12_parpadea: el color 12 de la paleta de p02:8E26 segun la cuenta de cuadros
	ld a,(0c21ch)		;8e01   ; lee no queda ningun 0x19 (la sala 5, acabada)
	and a			;8e04
	ret z			;8e05
	call borra_todos_los_actores		;8e06   ; borra_todos_los_actores: p02:83D6 con los 8 actores de 0xC400
	call suma_c310		;8e09   ; suma_c310: 0xC310 + 1
	ld a,042h		;8e0c
	jp 056e3h		;8e0e   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
color_12_parpadea:		; el color 12 de la paleta de p02:8E26 segun la cuenta de cuadros
	ld a,(0c00dh)		;8e11   ; lee la cuenta de cuadros del juego
	and 00ch		;8e14
	srl a		;8e16
	ld hl,08e26h		;8e18
	call 04083h		;8e1b   ; hl_mas_a: HL = HL + A
	ld d,(hl)			;8e1e
	inc hl			;8e1f
	ld e,(hl)			;8e20
	ld a,00ch		;8e21
	jp 04a73h		;8e23   ; pon_color: el color A de la paleta = D (0RRR0BBB) y E (00000GGG), copia en 0xF680

; ----------------------------------------------------------------------
; DATOS resto_8E26: tablas cortas que apuntan p02:8E18 (0x8E26); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p02:8E18 (8
;   bytes)
;   0x8e26..0x8e2e  (8 bytes)
DATA_resto_8E26:
	defb 070h,000h,070h,005h,007h,000h,077h,007h	; 8e26  p.p...w.

; ======================================================================
; CODIGO 0x8e2e..0x8ed2  (164 bytes)
; ======================================================================


borra_todos_los_actores:		; p02:83D6 con los 8 actores de 0xC400
	ld ix,0c400h		;8e2e   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld b,008h		;8e32
L_8E34:
	push bc			;8e34
	ld a,(ix+000h)		;8e35   ; lee el tipo del actor
	or a			;8e38
	call nz,borra_actor		;8e39   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	pop bc			;8e3c
	ld de,00080h		;8e3d
	add ix,de		;8e40
	djnz L_8E34		;8e42
	ret			;8e44
L_8E45:
	call 07901h		;8e45   ; borra_a_barras: borra la VRAM a barras: un byte cada 13 desde (0x24, 0x1A), con esperas
	ld a,024h		;8e48
	call 056e3h		;8e4a   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld hl,0f0a4h		;8e4d
	call 06194h		;8e50   ; barrido_de_lineas: 0x10 lineas verticales de 0x20 puntos (p00:4B0C) desde (H, L)
	call borra_d45e_y_actores		;8e53   ; borra_d45e_y_actores: pone a cero 4 registros de 0xD45E y borra los actores
	jp suma_c310		;8e56   ; suma_c310: 0xC310 + 1
L_8E59:
	ld a,(0c24bh)		;8e59   ; lee la accion del personaje (4 muere, 5 escalera)
	or a			;8e5c
	jr z,L_8E64		;8e5d
	cp 002h		;8e5f
	jr z,L_8E64		;8e61
	ret			;8e63
L_8E64:
	ld a,(0c270h)		;8e64
	ld b,a			;8e67
	ld a,(0c211h)		;8e68   ; lee la fase (1-25: ruina * 5 + puerta)
	cp b			;8e6b
	jr z,L_8E77		;8e6c
	call 06811h		;8e6e   ; accion_6: accion 6, los colores del personaje y sin invencible (0xC256 = 0)
	ld hl,0c310h		;8e71   ; apunta a el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	inc (hl)			;8e74
	inc (hl)			;8e75
	ret			;8e76
L_8E77:
	ld a,001h		;8e77
	ld (0c271h),a		;8e79
	call 054b4h		;8e7c   ; banco_6_en_a000: pone el banco 6 en 0xA000
	call 0bc30h		;8e7f   ; rle_bf88: el RLE de p06:BF88 a la VRAM (p00:4926)
	call 05464h		;8e82   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld c,01ah		;8e85
	ld de,08030h		;8e87
	call crea_actor_0		;8e8a   ; crea_actor_0: p02:8615 con B = 0
	jp suma_c310		;8e8d   ; suma_c310: 0xC310 + 1
borra_d45e_y_actores:		; pone a cero 4 registros de 0xD45E y borra los actores
	ld hl,0d45eh		;8e90
	ld b,004h		;8e93
L_8E95:
	xor a			;8e95
	ld (hl),a			;8e96
	inc l			;8e97
	ld (hl),a			;8e98
	ld a,01fh		;8e99
	call 04083h		;8e9b   ; hl_mas_a: HL = HL + A
	djnz L_8E95		;8e9e
	ld ix,0c400h		;8ea0   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld b,008h		;8ea4
L_8EA6:
	ld a,(ix+000h)		;8ea6   ; lee el tipo del actor
	or a			;8ea9
	push bc			;8eaa
	call nz,borra_actor		;8eab   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	pop bc			;8eae
	ld de,00080h		;8eaf
	add ix,de		;8eb2
	djnz L_8EA6		;8eb4
	ret			;8eb6
prepara_c888:		; 4 bytes de p02:8ED2 a 0xC888 y sus cuentas
	ld hl,08ed2h		;8eb7   ; 4 bytes de p02:8ED2: los limites del dibujo que se descubre
	ld de,0c888h		;8eba
	ldi		;8ebd
	ldi		;8ebf
	ldi		;8ec1
	ldi		;8ec3
	ld a,001h		;8ec5   ; 0xC88C = 1 y 0xC88D = 0: la primera linea
	ld (de),a			;8ec7
	inc e			;8ec8
	xor a			;8ec9
	ld (de),a			;8eca
	ld a,(0c88ch)		;8ecb
	ld (0c88eh),a		;8ece
	ret			;8ed1

; ----------------------------------------------------------------------
; DATOS resto_8ED2: tablas cortas que apuntan p02:8EB7 (0x8ED2); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p02:8EB7 (4
;   bytes)
;   0x8ed2..0x8ed6  (4 bytes)
DATA_resto_8ED2:
	defb 0a4h,048h,070h,070h	; 8ed2

; ======================================================================
; CODIGO 0x8ed6..0x8fbf  (233 bytes)
; ======================================================================


paso_c888:		; cada 4 cuadros, el siguiente paso del dibujo de 0xC888 (p02:8F06)
	call parpadeo_r7		;8ed6   ; cada 4 cuadros una linea mas del dibujo de (0x60, 0x90)
	ld hl,0c88dh		;8ed9
	inc (hl)			;8edc
	cp 004h		;8edd
	ret c			;8edf
	ld (hl),000h		;8ee0
	ld hl,09060h		;8ee2
	ld a,(0c889h)		;8ee5
	ld d,a			;8ee8
	ld a,(0c88ch)		;8ee9
	ld b,a			;8eec
	ld a,(0c888h)		;8eed
	sub b			;8ef0
	ld e,a			;8ef1
	ld a,(0c88bh)		;8ef2
	ld b,a			;8ef5
	ld a,(0c88ch)		;8ef6
	ld c,a			;8ef9
	call 04841h		;8efa   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	ld hl,0c88ch		;8efd   ; hasta 0xC88A lineas
	inc (hl)			;8f00
	ld a,(0c88ah)		;8f01
	cp (hl)			;8f04
	ret			;8f05
parpadeo_r7:		; R#7 (color del borde) 15 o 14 segun 0xC88E
	ld hl,0c88eh		;8f06   ; el borde (R#7) parpadea entre 15 y 14
	dec (hl)			;8f09
	ld a,(hl)			;8f0a
	rra			;8f0b
	ld b,00fh		;8f0c
	jr c,L_8F11		;8f0e
	dec b			;8f10
L_8F11:
	ld c,007h		;8f11
	jp 00047h		;8f13   ; BIOS WRTVDP - Writes data in the VDP-register
sala_del_final_de_fase:		; en la pantalla de p15:BE8E[fase]: 0xD500 (p12:B4D2), cuentas a cero, 0xC316 = 1, juegos 0x27 y 0x30, p09:BED3 y el actor 0x23
	xor a			;8f16
	ld (0c316h),a		;8f17   ; guarda en la sala del final de fase
	call 054a5h		;8f1a   ; banco_15_en_a000: pone el banco 15 en 0xA000 (p00:54B9)
	ld a,(0c211h)		;8f1d   ; lee la fase (1-25: ruina * 5 + puerta)
	dec a			;8f20
	ld hl,0be8eh		;8f21
	call 04083h		;8f24   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;8f27
	call 05464h		;8f28   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c212h)		;8f2b   ; lee la pantalla de la fase (desde 1)
	cp b			;8f2e
	jp nz,05a56h		;8f2f   ; paleta_del_personaje: las paletas p00:5A79/5A80 segun 0xC240
	call lee_d500		;8f32   ; lee_d500: con 12: los 4 bytes de la fase de p12:B4D2 a 0xD500
	xor a			;8f35
	ld (0c310h),a		;8f36   ; guarda el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	ld (0c314h),a		;8f39   ; guarda la cuenta de la sala del final de fase o de la sala 5
	ld (0c21ch),a		;8f3c   ; guarda no queda ningun 0x19 (la sala 5, acabada)
	inc a			;8f3f
	ld (0c316h),a		;8f40   ; guarda en la sala del final de fase
	call 05a56h		;8f43   ; paleta_del_personaje: las paletas p00:5A79/5A80 segun 0xC240
	ld a,027h		;8f46
	call 055f0h		;8f48   ; juego_de_sprites: con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)
	ld a,030h		;8f4b
	call 055f0h		;8f4d   ; juego_de_sprites: con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)
	call lee_c319		;8f50   ; lee_c319: con 9: 3 bytes de p09:BED3 + 3 * (0xC211 - 1) a 0xC319
crea_tipo_23:		; si vive algun personaje y 0xC270 es la fase: crea el actor 0x23 en (0x34, 0x80)
	ld a,(0c2b0h)		;8f53   ; lee la ficha del personaje 0 (14 bytes)
	ld b,a			;8f56
	ld a,(0c2d0h)		;8f57   ; lee la ficha del personaje 1 (14 bytes)
	or b			;8f5a
	ret z			;8f5b
	ld a,(0c211h)		;8f5c   ; lee la fase (1-25: ruina * 5 + puerta)
	ld b,a			;8f5f
	ld a,(0c270h)		;8f60
	cp b			;8f63
	ret nz			;8f64
	ld c,023h		;8f65
	ld de,08034h		;8f67
	jp crea_actor_0		;8f6a   ; crea_actor_0: p02:8615 con B = 0
lee_d500:		; con 12: los 4 bytes de la fase de p12:B4D2 a 0xD500
	call 054aah		;8f6d   ; banco_12_en_a000: pone el banco 12 en 0xA000
	ld a,(0c211h)		;8f70   ; lee la fase (1-25: ruina * 5 + puerta)
	dec a			;8f73
	add a,a			;8f74
	add a,a			;8f75
	ld hl,0b4d2h		;8f76
	call 04083h		;8f79   ; hl_mas_a: HL = HL + A
	ld de,0d500h		;8f7c   ; apunta a las dos posiciones de la sala del final de fase
	ld bc,00004h		;8f7f
	ldir		;8f82
	ld hl,0d500h		;8f84   ; apunta a las dos posiciones de la sala del final de fase
	ld b,002h		;8f87
L_8F89:
	ld a,(hl)			;8f89
	add a,004h		;8f8a
	ld (hl),a			;8f8c
	inc hl			;8f8d
	inc hl			;8f8e
	djnz L_8F89		;8f8f
	jp 05464h		;8f91   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_8F94:
	ld a,001h		;8f94
	push af			;8f96
	ld a,004h		;8f97
	add a,e			;8f99
	ld e,a			;8f9a
	call 07176h		;8f9b   ; ficha_en: A = la ficha de 0xD200 en (D = X, E = Y), o fuera de la pantalla
	pop af			;8f9e
	ld b,006h		;8f9f
L_8FA1:
	ld (hl),a			;8fa1   ; dos bytes por fila de 0xD200 (32 por fila)
	inc hl			;8fa2
	ld (hl),a			;8fa3
	ld de,0001fh		;8fa4
	add hl,de			;8fa7
	djnz L_8FA1		;8fa8
	ret			;8faa
cuadro_del_final_de_fase:		; con 0xC316 y sin morir: la cuenta 0xC314 y despacha 0xC310 (tabla p02:8FBF)
	ld a,(0c316h)		;8fab   ; lee en la sala del final de fase
	or a			;8fae
	ret z			;8faf
	ld a,(0c24bh)		;8fb0   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;8fb3
	ret z			;8fb5
	call cuenta_c314		;8fb6   ; cuenta_c314: 0xC314 - 1 (a cero, el sonido 0x88) y el dibujo de 0xD500
	ld a,(0c310h)		;8fb9   ; lee el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	call 0408dh		;8fbc   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_8FBF: tabla de 6 palabras del despachador (call 0x408D en
;   0x8FBC); lo leen L_408D (12 bytes)
;   0x8fbf..0x8fcb  (12 bytes)
DATA_saltos_8FBF:
	defb 0d4h,08fh	; 8fbf
	defb 0cbh,08fh	; 8fc1
	defb 0d5h,08fh	; 8fc3
	defb 0f4h,08fh	; 8fc5
	defb 0fch,08fh	; 8fc7
	defb 067h,090h	; 8fc9

; ======================================================================
; CODIGO 0x8fcb..0x8ff5  (42 bytes)
; ======================================================================


L_8FCB:
	ld a,(0c480h)		;8fcb
	or a			;8fce
	ret nz			;8fcf
	ld hl,0c310h		;8fd0   ; apunta a el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	inc (hl)			;8fd3
L_8FD4:
	ret			;8fd4
L_8FD5:
	ld hl,0c310h		;8fd5   ; apunta a el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	inc (hl)			;8fd8
	call 054afh		;8fd9   ; banco_9_en_a000: pone el banco 9 en 0xA000
	ld a,(0c31bh)		;8fdc
	call paleta_del_tipo		;8fdf   ; paleta_del_tipo: con 9: la paleta del tipo A, p09:B781[p09:B74A[A - 1] - 1], si tiene
	call 05464h		;8fe2   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld c,022h		;8fe5
	ld a,(0c319h)		;8fe7   ; lee los 3 bytes de la fase de p09:BED3
	ld d,a			;8fea
	ld e,020h		;8feb
	push ix		;8fed
	call crea_actor_0		;8fef   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;8ff2
L_8FF4:
	ret			;8ff4

; ----------------------------------------------------------------------
; DATOS resto_8FF5: tablas cortas que apuntan p02:8FFC (0x8FF5); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p02:8FFC (7
;   bytes)
;   0x8ff5..0x8ffc  (7 bytes)
DATA_resto_8FF5:
	defb 007h,033h,003h,008h,055h,005h,0ffh	; 8ff5

; ======================================================================
; CODIGO 0x8ffc..0x903d  (65 bytes)
; ======================================================================


L_8FFC:
	ld hl,08ff5h		;8ffc
	call 04a9dh		;8fff   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
	call dibuja_903d		;9002   ; dibuja_903d: 3 x 4 fichas transparentes de p02:903D junto al personaje
	ld hl,0c31dh		;9005
	inc (hl)			;9008
	ld a,(hl)			;9009
	cp 016h		;900a
	ret nz			;900c
	ld hl,0c310h		;900d   ; apunta a el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	inc (hl)			;9010
	ret			;9011
dibuja_903d:		; 3 x 4 fichas transparentes de p02:903D junto al personaje
	ld a,(0c246h)		;9012   ; 3 filas de 4 fichas de p02:903D encima del personaje (X - 0x10)
	sub 010h		;9015
	ld d,a			;9017
	ld a,(0c31dh)		;9018   ; la fila de 0xC31D: Y = 0xC31D * 8 + 0x14
	add a,a			;901b
	add a,a			;901c
	add a,a			;901d
	add a,014h		;901e
	ld e,a			;9020
	ld hl,0903dh		;9021
	ld c,003h		;9024
L_9026:
	ld b,004h		;9026
	push de			;9028
L_9029:
	ld a,(hl)			;9029   ; cada ficha transparente (p00:4DCE)
	inc hl			;902a
	call 04dceh		;902b   ; ficha_transparente: la ficha A a (D, E) con TIMP (LMMM 0x48)
	ld a,d			;902e
	add a,008h		;902f
	ld d,a			;9031
	djnz L_9029		;9032
	pop de			;9034
	ld a,e			;9035   ; la siguiente fila
	add a,008h		;9036
	ld e,a			;9038
	dec c			;9039
	jr nz,L_9026		;903a
	ret			;903c

; ----------------------------------------------------------------------
; DATOS resto_903D: tablas cortas que apuntan p02:9021 (0x903D); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p02:9021 (12
;   bytes)
;   0x903d..0x9049  (12 bytes)
DATA_resto_903D:
	defb 0ceh,0cch,0d1h,0d3h,0ceh,0cdh,0d2h,0d3h,0cfh,0d0h,0d5h,0d4h	; 903d  ............

; ======================================================================
; CODIGO 0x9049..0x923b  (498 bytes)
; ======================================================================


lee_c319:		; con 9: 3 bytes de p09:BED3 + 3 * (0xC211 - 1) a 0xC319
	ld a,(0c211h)		;9049   ; lee la fase (1-25: ruina * 5 + puerta)
	dec a			;904c
	ld a,a			;904d
	ld b,a			;904e
	add a,a			;904f
	add a,b			;9050
	push af			;9051
	call 054afh		;9052   ; banco_9_en_a000: pone el banco 9 en 0xA000
	pop af			;9055
	ld hl,0bed3h		;9056
	call 04083h		;9059   ; hl_mas_a: HL = HL + A
	ld de,0c319h		;905c   ; apunta a los 3 bytes de la fase de p09:BED3
	ld bc,00003h		;905f
	ldir		;9062
	jp 05464h		;9064   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_9067:
	ld hl,0c244h		;9067   ; apunta a la Y del personaje
	ld a,(hl)			;906a
	sub 002h		;906b
	ld (hl),a			;906d
	ld a,(hl)			;906e
	cp 020h		;906f
	ret nc			;9071
	ld a,(0c270h)		;9072
	ld b,a			;9075
	ld a,(0c211h)		;9076   ; lee la fase (1-25: ruina * 5 + puerta)
	cp b			;9079
	ld a,003h		;907a
	jr z,L_9088		;907c
	ld a,(0c240h)		;907e   ; lee el personaje que se lleva (0 o 1)
	or a			;9081
	ld a,001h		;9082
	jr z,L_9088		;9084
	ld a,002h		;9086
L_9088:
	ld (0c31ch),a		;9088   ; 0xC31C = A, 0xC216 = 1 y 0xC316 y 0xC271 a cero
	ld a,001h		;908b
	ld (0c216h),a		;908d
	xor a			;9090
	ld (0c316h),a		;9091   ; guarda en la sala del final de fase
	ld (0c271h),a		;9094
	ret			;9097
cuenta_c314:		; 0xC314 - 1 (a cero, el sonido 0x88) y el dibujo de 0xD500
	ld a,(0c314h)		;9098   ; lee la cuenta de la sala del final de fase o de la sala 5
	or a			;909b
	ret z			;909c
	ld hl,0c314h		;909d   ; apunta a la cuenta de la sala del final de fase o de la sala 5
	dec (hl)			;90a0
	ld a,088h		;90a1
	call z,056e3h		;90a3   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld a,030h		;90a6
	sub (hl)			;90a8
	ld b,010h		;90a9
	ld c,a			;90ab
	ld a,(hl)			;90ac
	ld hl,(0d500h)		;90ad   ; lee las dos posiciones de la sala del final de fase y el byte siguiente (16 bits)
	add a,l			;90b0
	ld l,a			;90b1
	ld de,(0d502h)		;90b2
	xor a			;90b6
	jp 04c73h		;90b7   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
cuenta_30_d502:		; 0xC314 = 0x30 y p02:8F94 con DE = (0xD502)
	ld a,030h		;90ba
	ld (0c314h),a		;90bc   ; guarda la cuenta de la sala del final de fase o de la sala 5
	ld de,(0d502h)		;90bf
	ld a,001h		;90c3
	jp L_8F94		;90c5
cuadro_c314:		; con 0xC316: la cuenta 0xC314 y, con 0xC310 >= 2, copia 16 x 0x30 de (0xD500) a (0xD502)
	ld a,(0c316h)		;90c8   ; con 0xC316 y sin la cuenta de 0xC314
	or a			;90cb
	ret z			;90cc
	ld a,(0c314h)		;90cd   ; lee la cuenta de la sala del final de fase o de la sala 5
	or a			;90d0
	jr nz,cuenta_c314		;90d1
	ld a,(0c310h)		;90d3   ; 0xC310 >= 2: copia 16 x 0x30 de 0xD500 a 0xD502
	cp 002h		;90d6
	ret c			;90d8
	ld hl,(0d500h)		;90d9   ; lee las dos posiciones de la sala del final de fase y el byte siguiente (16 bits)
	ld de,(0d502h)		;90dc
	ld bc,01030h		;90e0
	xor a			;90e3
	call 04c73h		;90e4   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	ld de,(0d502h)		;90e7
	ld a,001h		;90eb
	jp L_8F94		;90ed
marcas_y_vuelve:		; con 12: las marcas de la pantalla (p12:B8BB) y vuelve con 1-2-3
	call 054aah		;90f0   ; banco_12_en_a000: pone el banco 12 en 0xA000
	call marcas_de_la_pantalla		;90f3   ; marcas_de_la_pantalla: con 12: los registros de p12:B8BB de la pantalla (p02:9148)
	jp 05464h		;90f6   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_90F9:
	ld de,0787ch		;90f9
	ld hl,01078h		;90fc
	ld bc,01008h		;90ff
	call 04841h		;9102   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	ld b,006h		;9105
	jr L_9112		;9107
L_9109:
	ld a,(0c21dh)		;9109   ; lee la ruina (0-4)
	cp 002h		;910c
	jr z,L_90F9		;910e
	ld b,007h		;9110
L_9112:
	ld c,02ah		;9112
	ld de,08094h		;9114
	call 05464h		;9117   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	call crea_actor		;911a   ; crea_actor: el actor C en (D, E) en el primer hueco de 0xC400
	jp 054aah		;911d   ; banco_12_en_a000: pone el banco 12 en 0xA000
marcas_de_la_pantalla:		; con 12: los registros de p12:B8BB de la pantalla (p02:9148)
	ld a,(0c20ah)		;9120   ; lee en la sala de la puerta 5
	or a			;9123
	jr nz,L_9109		;9124
	ld a,(0c211h)		;9126   ; lee la fase (1-25: ruina * 5 + puerta)
	dec a			;9129
	ld hl,0b8bbh		;912a
	call 0543ah		;912d   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,h			;9130
	or l			;9131
	ret z			;9132
	ld b,080h		;9133
L_9135:
	ld a,(0c212h)		;9135   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;9138
	push hl			;9139
	call z,marca		;913a   ; marca: crea el actor 0x2A en la casilla [YX] del registro
	pop hl			;913d
	ld a,(hl)			;913e
	cp 0ffh		;913f
	ret z			;9141
	inc hl			;9142
	inc hl			;9143
	inc hl			;9144
	djnz L_9135		;9145
	ret			;9147
marca:		; crea el actor 0x2A en la casilla [YX] del registro
	ld c,02ah		;9148
	inc hl			;914a
	ld a,(hl)			;914b
	and 0f0h		;914c
	add a,008h		;914e
	ld d,a			;9150
	ld a,(hl)			;9151
	and 00fh		;9152
	add a,a			;9154
	add a,a			;9155
	add a,a			;9156
	add a,a			;9157
	add a,024h		;9158
	ld e,a			;915a
	inc hl			;915b
	ld b,(hl)			;915c
	push bc			;915d
	call ya_marcado		;915e   ; ya_marcado: busca la casilla en 0xE000 con la pantalla y la fase
	pop bc			;9161
	ret c			;9162
	call 05464h		;9163   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	call crea_actor		;9166   ; crea_actor: el actor C en (D, E) en el primer hueco de 0xC400
	jp 054aah		;9169   ; banco_12_en_a000: pone el banco 12 en 0xA000
ya_marcado:		; busca la casilla en 0xE000 con la pantalla y la fase
	ld hl,0e000h		;916c
	ld b,0a0h		;916f
L_9171:
	push hl			;9171
	ld a,(hl)			;9172
	inc hl			;9173
	cp d			;9174
	jr nz,L_9187		;9175
	ld a,(hl)			;9177
	inc hl			;9178
	cp e			;9179
	jr nz,L_9187		;917a
	ld a,(0c212h)		;917c   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;917f
	jr nz,L_9187		;9180
	inc hl			;9182
	ld a,(0c211h)		;9183   ; lee la fase (1-25: ruina * 5 + puerta)
	cp (hl)			;9186
L_9187:
	pop hl			;9187
	jr z,L_9193		;9188
	ld a,004h		;918a
	call 04083h		;918c   ; hl_mas_a: HL = HL + A
	djnz L_9171		;918f
	or a			;9191
	ret			;9192
L_9193:
	scf			;9193
	ret			;9194
busca_de_la_pantalla:		; con 9: el registro de p09:B12B[0xC211 - 1] de la pantalla; acarreo si no hay
	ld hl,0b12bh		;9195
	ld a,(0c211h)		;9198   ; lee la fase (1-25: ruina * 5 + puerta)
	dec a			;919b
	call 0543ah		;919c   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,l			;919f
	or h			;91a0
	scf			;91a1
	ret z			;91a2
	call registro_de_la_pantalla		;91a3   ; registro_de_la_pantalla: avanza de 4 en 4 hasta el de la pantalla 0xC212; acarreo en el 0xFF
	ret c			;91a6
	ld a,(0cc37h)		;91a7   ; lee el registro en curso de la lista de la pantalla
	add a,a			;91aa
	add a,a			;91ab
	call 04083h		;91ac   ; hl_mas_a: HL = HL + A
	ld a,(0c212h)		;91af   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;91b2
	jr nz,L_91CE		;91b3
	push hl			;91b5
	inc hl			;91b6
	ld a,(hl)			;91b7
	call lee_b70d		;91b8   ; lee_b70d: A = p09:B70D[A - 1]
	pop hl			;91bb
	or a			;91bc
	ret			;91bd
registro_de_la_pantalla:		; avanza de 4 en 4 hasta el de la pantalla 0xC212; acarreo en el 0xFF
	ld a,(hl)			;91be   ; [pantalla]..: 0xFF acaba con acarreo
	cp 0ffh		;91bf
	scf			;91c1
	ret z			;91c2
	ld a,(0c212h)		;91c3   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;91c6
	ret z			;91c7
	inc hl			;91c8   ; 4 bytes por registro
	inc hl			;91c9
	inc hl			;91ca
	inc hl			;91cb
	jr registro_de_la_pantalla		;91cc
L_91CE:
	ld a,0ffh		;91ce
	or a			;91d0
	ret			;91d1
lee_b70d:		; A = p09:B70D[A - 1]
	dec a			;91d2
	ld hl,0b70dh		;91d3
	call 04083h		;91d6   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;91d9
	ret			;91da
L_91DB:
	ld (ix+006h),000h		;91db   ; si el actor se mueve (p02:8367) = 0x00
	ld (ix+013h),002h		;91df   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x02
	call pon_2f		;91e3   ; pon_2f: p02:9222 con A = 0x2F y DE = 0
	ld a,(ix+003h)		;91e6   ; lee la Y del actor
	add a,010h		;91e9
	ld (ix+003h),a		;91eb   ; guarda la Y del actor
	ld hl,0ae2dh		;91ee
	call 05596h		;91f1   ; plantilla_de_actor: con 4-5-6: 11 bytes de HL a (ix+7)
	ld (ix+011h),010h		;91f4   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	call compara_x		;91f8   ; compara_x: compara la X del personaje con la del actor
	ld c,000h		;91fb
	jr nc,L_9200		;91fd
	inc c			;91ff
L_9200:
	call estado_1_o_2		;9200   ; estado_1_o_2: D = 0 si el estado del personaje es 1 o 2, si no 1
	ld a,d			;9203
	xor c			;9204
	ret z			;9205
	inc (ix+017h)		;9206
	ld (ix+010h),00bh		;9209   ; el fotograma del actor (p02:8A42) = 0x0B
	jp invierte_velocidad_x		;920d   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
estado_1_o_2:		; D = 0 si el estado del personaje es 1 o 2, si no 1
	call estado_del_que_se_lleva		;9210   ; estado_del_que_se_lleva: A = el estado del personaje que se lleva
	ld d,000h		;9213
	cp 001h		;9215
	ret z			;9217
	cp 002h		;9218
	ret z			;921a
	inc d			;921b
	ret			;921c
pon_2f:		; p02:9222 con A = 0x2F y DE = 0
	ld a,02fh		;921d
	ld de,00000h		;921f
pon_dos_campos:		; (ix+A) = D y (ix+A+5) = E
	push ix		;9222
	pop hl			;9224
	call 04083h		;9225   ; hl_mas_a: HL = HL + A
	ld (hl),d			;9228
	ld a,005h		;9229
	call 04083h		;922b   ; hl_mas_a: HL = HL + A
	ld (hl),e			;922e
	ret			;922f
L_9230:
	call parpadeo_del_actor		;9230   ; parpadeo_del_actor: el cuadro de parpadeo segun (ix+0x17) y la cuenta
	ld a,(ix+001h)		;9233   ; lee el paso del actor
	and 07fh		;9236
	call 0408dh		;9238   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_923B: tabla de 4 palabras del despachador (call 0x408D en
;   0x9238); lo leen L_408D (8 bytes)
;   0x923b..0x9243  (8 bytes)
DATA_saltos_923B:
	defb 043h,092h	; 923b
	defb 047h,092h	; 923d
	defb 0a5h,092h	; 923f
	defb 0c4h,092h	; 9241

; ======================================================================
; CODIGO 0x9243..0x92c0  (125 bytes)
; ======================================================================


L_9243:
	inc (ix+001h)		;9243   ; sube el paso del actor
	ret			;9246
L_9247:
	ld de,00748h		;9247
L_924A:
	ld (ix+001h),081h		;924a   ; el paso del actor = 0x81
	ld a,(0c00dh)		;924e   ; lee la cuenta de cuadros del juego
	and 001h		;9251
	ret nz			;9253
	push de			;9254
	ld a,02bh		;9255
	call colores_de_pieza		;9257   ; colores_de_pieza: HL = 0xDCA0 + (ix+A) * 16: los colores de la pieza A del actor; B = 0x11 - (ix+0x11)
	pop de			;925a
	dec (ix+011h)		;925b   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;925e
	ld (ix+006h),001h		;925f   ; si el actor se mueve (p02:8367) = 0x01
	ld (ix+013h),003h		;9263   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x03
	inc (ix+001h)		;9267   ; sube el paso del actor
	ld a,02fh		;926a
	call pon_dos_campos		;926c   ; pon_dos_campos: (ix+A) = D y (ix+A+5) = E
	ld a,(ix+001h)		;926f   ; lee el paso del actor
	and 07fh		;9272
	ld (ix+001h),a		;9274   ; guarda el paso del actor
	ret			;9277
colores_de_pieza:		; HL = 0xDCA0 + (ix+A) * 16: los colores de la pieza A del actor; B = 0x11 - (ix+0x11)
	push af			;9278   ; 0x11 - (ix+0x11): cuantas lineas quedan
	ld a,011h		;9279
	ld b,(ix+011h)		;927b   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	sub b			;927e
	ld b,a			;927f
	pop af			;9280
	push de			;9281
	push ix		;9282
	pop hl			;9284
	call 04083h		;9285   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;9288   ; el byte (ix+A): la pieza
	ld l,a			;9289
	ld h,000h		;928a
	add hl,hl			;928c   ; * 16 + 0xDCA0: sus colores
	add hl,hl			;928d
	add hl,hl			;928e
	add hl,hl			;928f
	ld de,0dca0h		;9290
	add hl,de			;9293
	pop de			;9294
	dec (ix+003h)		;9295   ; la Y del actor sube una linea
L_9298:
	ld (hl),d			;9298
	push hl			;9299
	ld a,010h		;929a
	call 04083h		;929c   ; hl_mas_a: HL = HL + A
	ld (hl),e			;929f
	pop hl			;92a0
	inc hl			;92a1
	djnz L_9298		;92a2
	ret			;92a4
L_92A5:
	call choque_lateral		;92a5   ; choque_lateral: la casilla de delante del actor segun su sentido (p02:8BB7)
	jr nz,L_92BA		;92a8
	call choque_4		;92aa   ; choque_4: p02:9D09 con E = 4
	ret nz			;92ad
	inc (ix+001h)		;92ae   ; sube el paso del actor
	ld hl,092c0h		;92b1
	ld bc,00004h		;92b4
	jp L_8AF5		;92b7
L_92BA:
	call invierte_velocidad_x		;92ba   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	jp L_8BFD		;92bd

; ----------------------------------------------------------------------
; DATOS resto_92C0: tablas cortas que apuntan p02:92B1 (0x92C0); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p02:92B1 (4
;   bytes)
;   0x92c0..0x92c4  (4 bytes)
DATA_resto_92C0:
	defb 000h,002h,000h,000h	; 92c0

; ======================================================================
; CODIGO 0x92c4..0x9363  (159 bytes)
; ======================================================================


L_92C4:
	ld d,007h		;92c4
	ld e,000h		;92c6
	call choque_debajo		;92c8   ; choque_debajo: la casilla de debajo del actor (p02:9D09) y p03:A683
	ret z			;92cb
	dec (ix+001h)		;92cc   ; baja el paso del actor
	call velocidad_y_l		;92cf   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	ld h,001h		;92d2
	call velocidad_x_h		;92d4   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	bit 0,(ix+017h)		;92d7
	ret z			;92db
	jp invierte_velocidad_x		;92dc   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
parpadeo_del_actor:		; el cuadro de parpadeo segun (ix+0x17) y la cuenta
	ld b,008h		;92df
	ld a,(ix+017h)		;92e1
	or a			;92e4
	jr z,L_92E9		;92e5
	ld b,00bh		;92e7
L_92E9:
	ld a,(0c00dh)		;92e9   ; lee la cuenta de cuadros del juego
	and 007h		;92ec
	ret z			;92ee
	ld a,(0c00dh)		;92ef   ; lee la cuenta de cuadros del juego
	and 018h		;92f2
	srl a		;92f4
	srl a		;92f6
	srl a		;92f8
	cp 003h		;92fa
	jr nz,L_9300		;92fc
	ld a,001h		;92fe
L_9300:
	add a,b			;9300
	ld (ix+010h),a		;9301   ; guarda el fotograma del actor (p02:8A42)
	ret			;9304
L_9305:
	ld (ix+010h),02fh		;9305   ; el fotograma del actor (p02:8A42) = 0x2F
	ld (ix+01fh),004h		;9309
	ld (ix+011h),010h		;930d   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld (ix+01eh),040h		;9311
	ret			;9315
L_9316:
	call cuenta_1e_a0		;9316   ; cuenta_1e_a0: (ix+0x1E) - 1; a cero vuelve a 0xA0 y p02:8C30
	ld a,(ix+001h)		;9319   ; lee el paso del actor
	and a			;931c
	jr nz,$+94		;931d
	dec (ix+011h)		;931f   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9322
	ld (ix+011h),008h		;9323   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	inc (ix+001h)		;9327   ; sube el paso del actor
	call azar		;932a   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	and 004h		;932d
	ld b,001h		;932f
	jr z,L_9335		;9331
	ld b,0ffh		;9333
L_9335:
	ld a,(ix+01fh)		;9335   ; (ix+0x1F) + B: el siguiente sentido; 0xFF pasa a 7 y 8 a 0
	add a,b			;9338
	cp 0ffh		;9339
	ld b,007h		;933b
	jr z,L_9346		;933d
	cp 008h		;933f
	ld b,000h		;9341
	jr z,L_9346		;9343
L_9345:
	ld b,a			;9345
L_9346:
	ld (ix+01fh),b		;9346
	ld a,b			;9349
	add a,a			;934a
	add a,b			;934b
	ld de,09363h		;934c
	call 04088h		;934f   ; de_mas_a: DE = DE + A
	ld a,(de)			;9352
	inc de			;9353
	ld h,a			;9354
	call velocidad_x_h		;9355   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	ld a,(de)			;9358
	inc de			;9359
	ld h,a			;935a
	call velocidad_y_h		;935b   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	ld a,(de)			;935e
	ld (ix+010h),a		;935f   ; guarda el fotograma del actor (p02:8A42)
	ret			;9362

; ----------------------------------------------------------------------
; DATOS resto_9363: tablas cortas que apuntan p02:934C (0x9363), p02:9396
;   (0x9365); el tamano de cada una sale del lector siguiente, no de
;   recorrerla; lo leen p02:934C, p02:9396 (24 bytes)
;   0x9363..0x937b  (24 bytes)
DATA_resto_9363:
	defb 000h,003h,031h,002h,002h,031h,003h,000h,033h,002h,0feh,033h,000h,0fdh,02fh,0feh	; 9363  ..1..1..3..3../.
	defb 0feh,02fh,0fdh,000h,035h,0feh,002h,035h	; 9373  ./..5..5

; ======================================================================
; CODIGO 0x937b..0x93c7  (76 bytes)
; ======================================================================


L_937B:
	call mira_93c7		;937b   ; mira_93c7: p02:8BB7 con las direcciones de p02:93C7[(ix+0x1F)]
	call fotograma_de_9365		;937e   ; fotograma_de_9365: (ix+0x10) = p02:9365[(ix+0x1F) * 3] (+ 1 en cuadros alternos)
	dec (ix+011h)		;9381   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9384
	dec (ix+001h)		;9385   ; baja el paso del actor
	call para_actor		;9388   ; para_actor: velocidades a cero
	ld (ix+011h),008h		;938b   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	ret			;938f
fotograma_de_9365:		; (ix+0x10) = p02:9365[(ix+0x1F) * 3] (+ 1 en cuadros alternos)
	ld a,(ix+01fh)		;9390
	ld b,a			;9393
	add a,a			;9394
	add a,b			;9395
	ld de,09365h		;9396
	call 04088h		;9399   ; de_mas_a: DE = DE + A
	ld a,(de)			;939c
	ld b,a			;939d
	ld a,(0c00dh)		;939e   ; lee la cuenta de cuadros del juego
	and 002h		;93a1
	jr z,L_93A6		;93a3
	inc b			;93a5
L_93A6:
	ld (ix+010h),b		;93a6   ; guarda el fotograma del actor (p02:8A42)
	ret			;93a9
mira_93c7:		; p02:8BB7 con las direcciones de p02:93C7[(ix+0x1F)]
	ld a,(ix+01fh)		;93aa
	ld hl,093c7h		;93ad
	call 0543ah		;93b0   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;93b3
	ld a,080h		;93b4
	call mira_alrededor		;93b6   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	ld a,(ix+016h)		;93b9
	and 008h		;93bc
	ret z			;93be
	ld a,(ix+01fh)		;93bf
	xor 004h		;93c2
	jp L_9345		;93c4

; ----------------------------------------------------------------------
; DATOS resto_93C7: tablas cortas que apuntan p02:93AD (0x93C7); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p02:93AD (16
;   bytes)
;   0x93c7..0x93d7  (16 bytes)
DATA_resto_93C7:
	defb 004h,000h,003h,00bh,000h,00ch,0edh,00bh,0ech,000h,0edh,0f5h,000h,0f4h,003h,0f5h	; 93c7  ................

; ======================================================================
; CODIGO 0x93d7..0x9416  (63 bytes)
; ======================================================================


cuenta_1e_a0:		; (ix+0x1E) - 1; a cero vuelve a 0xA0 y p02:8C30
	dec (ix+01eh)		;93d7
	ret nz			;93da
	ld (ix+01eh),0a0h		;93db
	jp L_8C30		;93df
L_93E2:
	ld (ix+006h),000h		;93e2   ; si el actor se mueve (p02:8367) = 0x00
	ld (ix+013h),002h		;93e6   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x02
	call pon_2f		;93ea   ; pon_2f: p02:9222 con A = 0x2F y DE = 0
	ld a,(ix+003h)		;93ed   ; lee la Y del actor
	add a,010h		;93f0
	ld (ix+003h),a		;93f2   ; guarda la Y del actor
	ld h,0fch		;93f5
	call velocidad_y_h		;93f7   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	call velocidad_x_l		;93fa   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
mira_al_personaje_22:		; (ix+0x10) = 0x22 o 0x23 segun el lado del personaje
	ld (ix+011h),010h		;93fd   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	call compara_x		;9401   ; compara_x: compara la X del personaje con la del actor
	ld a,023h		;9404
	jr c,L_940A		;9406
	ld a,022h		;9408
L_940A:
	ld (ix+010h),a		;940a   ; guarda el fotograma del actor (p02:8A42)
	ret			;940d
L_940E:
	ld a,(ix+001h)		;940e   ; lee el paso del actor
	and 07fh		;9411
	call 0408dh		;9413   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_9416: tabla de 7 palabras del despachador (call 0x408D en
;   0x9413); lo leen L_408D (14 bytes)
;   0x9416..0x9424  (14 bytes)
DATA_saltos_9416:
	defb 043h,092h	; 9416
	defb 024h,094h	; 9418
	defb 02ah,094h	; 941a
	defb 049h,094h	; 941c
	defb 066h,094h	; 941e
	defb 09dh,094h	; 9420
	defb 048h,094h	; 9422

; ======================================================================
; CODIGO 0x9424..0x954c  (296 bytes)
; ======================================================================


L_9424:
	ld de,00d4eh		;9424
	jp L_924A		;9427
L_942A:
	ld a,(ix+003h)		;942a   ; lee la Y del actor
	cp 034h		;942d
	jr c,L_943E		;942f
	call compara_y		;9431   ; compara_y: compara la Y del personaje con la del actor
	ret c			;9434
	ld a,(0c244h)		;9435   ; lee la Y del personaje
	sub 030h		;9438
	cp (ix+003h)		;943a   ; compara con la Y del actor
	ret c			;943d
L_943E:
	call velocidad_y_l		;943e   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	ld (ix+011h),010h		;9441   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	inc (ix+001h)		;9445   ; sube el paso del actor
L_9448:
	ret			;9448
L_9449:
	dec (ix+011h)		;9449   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;944c
	call mira_al_personaje_22		;944d   ; mira_al_personaje_22: (ix+0x10) = 0x22 o 0x23 segun el lado del personaje
	inc (ix+001h)		;9450   ; sube el paso del actor
	ld hl,00020h		;9453
	call compara_x		;9456   ; compara_x: compara la X del personaje con la del actor
	call c,niega_hl		;9459   ; niega_hl: HL = -HL
	call pon_aceleracion_x		;945c   ; pon_aceleracion_x: (ix+0x0E, 0x0F) = HL
	ld (ix+00bh),001h		;945f   ; si el actor acelera (p02:8393) = 0x01
	jp velocidad_x_l		;9463   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
L_9466:
	ld a,(ix+00ah)		;9466   ; lee la velocidad X del actor (alta)
	and 080h		;9469
	ld b,000h		;946b
	jr nz,L_9471		;946d
	ld b,001h		;946f
L_9471:
	call compara_x		;9471   ; compara_x: compara la X del personaje con la del actor
	ld a,000h		;9474
	jr nc,L_947A		;9476
	ld a,001h		;9478
L_947A:
	xor b			;947a
	ret nz			;947b
	ld h,(ix+00ah)		;947c   ; lee la velocidad X del actor (alta)
	ld l,(ix+009h)		;947f   ; lee la velocidad X del actor
	ld a,h			;9482
	and 080h		;9483
	call nz,niega_hl		;9485   ; niega_hl: HL = -HL
	call pon_velocidad_y		;9488   ; pon_velocidad_y: (ix+7, 8) = HL
	call velocidad_x_l		;948b   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	ld h,000h		;948e
	ld l,h			;9490
	call pon_aceleracion_x		;9491   ; pon_aceleracion_x: (ix+0x0E, 0x0F) = HL
	ld l,080h		;9494
	call pon_aceleracion_y		;9496   ; pon_aceleracion_y: (ix+0x0C, 0x0D) = HL
	inc (ix+001h)		;9499   ; sube el paso del actor
	ret			;949c
L_949D:
	ld a,(ix+008h)		;949d   ; lee la velocidad Y del actor (alta)
	cp 006h		;94a0
	ret c			;94a2
	ld h,006h		;94a3
	jp velocidad_y_h		;94a5   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
L_94A8:
	ld (ix+01eh),010h		;94a8
	ld (ix+01dh),001h		;94ac
	ld hl,0ae38h		;94b0
	jp 05596h		;94b3   ; plantilla_de_actor: con 4-5-6: 11 bytes de HL a (ix+7)
L_94B6:
	ld a,(ix+001h)		;94b6   ; lee el paso del actor
	and a			;94b9
	jr nz,L_950D		;94ba
L_94BC:
	dec (ix+01eh)		;94bc
	jr z,L_94E6		;94bf
	ld (ix+006h),001h		;94c1   ; si el actor se mueve (p02:8367) = 0x01
	dec (ix+011h)		;94c5   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;94c8
	ld a,(ix+01dh)		;94c9
	ld hl,0ae38h		;94cc
	call 0a396h		;94cf   ; plantilla_por_once: la plantilla de actor (p00:5596) de HL + A * 11
	ld b,01dh		;94d2
	call mira_al_personaje_b		;94d4   ; mira_al_personaje_b: (ix+0x10) = B, o B + 2 si el personaje esta a la derecha
	ld a,(ix+01dh)		;94d7
	inc a			;94da
	cp 004h		;94db
	ld (ix+01dh),a		;94dd
	ret nz			;94e0
	ld (ix+01dh),000h		;94e1
	ret			;94e5
L_94E6:
	call estado_del_que_se_lleva		;94e6   ; estado_del_que_se_lleva: A = el estado del personaje que se lleva
	ld c,004h		;94e9
	or a			;94eb
	jr z,L_94F6		;94ec
	sla c		;94ee
	cp 002h		;94f0
	jr z,L_94F6		;94f2
	sla c		;94f4
L_94F6:
	ld (ix+01eh),c		;94f6
	inc (ix+001h)		;94f9   ; sube el paso del actor
	ld a,(ix+00bh)		;94fc   ; lee si el actor acelera (p02:8393)
	ld (ix+01ch),a		;94ff
	xor a			;9502
	ld (ix+006h),a		;9503   ; guarda si el actor se mueve (p02:8367)
	ld (ix+00bh),a		;9506   ; guarda si el actor acelera (p02:8393)
	ld b,01eh		;9509
	jr mira_al_personaje_b		;950b
L_950D:
	dec (ix+01eh)		;950d
	ret nz			;9510
	ld b,01dh		;9511
	call mira_al_personaje_b		;9513   ; mira_al_personaje_b: (ix+0x10) = B, o B + 2 si el personaje esta a la derecha
	dec (ix+001h)		;9516   ; baja el paso del actor
	ld (ix+01eh),010h		;9519
	ld c,02bh		;951d
	call crea_actor_aqui		;951f   ; crea_actor_aqui: crea el actor C en la posicion del actor IX
	ld a,(ix+01ch)		;9522
	ld (ix+00bh),a		;9525   ; guarda si el actor acelera (p02:8393)
	jp L_94BC		;9528
mira_al_personaje_b:		; (ix+0x10) = B, o B + 2 si el personaje esta a la derecha
	call compara_x		;952b   ; compara_x: compara la X del personaje con la del actor
	jr nc,L_9532		;952e
	inc b			;9530
	inc b			;9531
L_9532:
	ld (ix+010h),b		;9532   ; guarda el fotograma del actor (p02:8A42)
	ret			;9535
L_9536:
	ld (ix+01fh),040h		;9536
	ld hl,0ae64h		;953a
	jp 05596h		;953d   ; plantilla_de_actor: con 4-5-6: 11 bytes de HL a (ix+7)
L_9540:
	call fotograma_37		;9540   ; fotograma_37: cada 16 cuadros, (ix+0x10) = 0x37 o 0x38
	call dispara_16		;9543   ; dispara_16: cada 0x40 cuadros crea el actor 0x16 debajo
	ld a,(ix+001h)		;9546   ; lee el paso del actor
	call 0408dh		;9549   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_954C: tabla de 4 palabras del despachador (call 0x408D en
;   0x9549); lo leen L_408D (8 bytes)
;   0x954c..0x9554  (8 bytes)
DATA_saltos_954C:
	defb 054h,095h	; 954c
	defb 088h,095h	; 954e
	defb 0afh,095h	; 9550
	defb 0b7h,095h	; 9552

; ======================================================================
; CODIGO 0x9554..0x961e  (202 bytes)
; ======================================================================


L_9554:
	inc (ix+001h)		;9554   ; sube el paso del actor
	ld a,r		;9557
	ld b,a			;9559
	ld a,(0c00dh)		;955a   ; lee la cuenta de cuadros del juego
	xor b			;955d
	ld b,a			;955e
	and 01fh		;955f
	add a,010h		;9561
	ld (ix+011h),a		;9563   ; guarda la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	push bc			;9566
	ld hl,00080h		;9567
	call pon_velocidad_x		;956a   ; pon_velocidad_x: (ix+9, 0x0A) = HL
	call compara_x		;956d   ; compara_x: compara la X del personaje con la del actor
	jr nc,L_9575		;9570
	call invierte_velocidad_x		;9572   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
L_9575:
	call estado_del_que_se_lleva		;9575   ; estado_del_que_se_lleva: A = el estado del personaje que se lleva
	pop bc			;9578
	cp 003h		;9579
	jp z,invierte_velocidad_x		;957b   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	cp 001h		;957e
	ret nz			;9580
	ld a,b			;9581
	and 020h		;9582
	jp z,invierte_velocidad_x		;9584   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	ret			;9587
L_9588:
	ld e,0e4h		;9588
	call choque_7		;958a   ; choque_7: p02:9D09 con D = 7
	jr z,L_95A5		;958d
	call choque_lateral		;958f   ; choque_lateral: la casilla de delante del actor segun su sentido (p02:8BB7)
	jr nz,L_95A5		;9592
	ld a,(ix+005h)		;9594   ; lee la X del actor
	add a,030h		;9597
	cp 060h		;9599
	jr c,L_95A5		;959b
	dec (ix+011h)		;959d   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;95a0
	dec (ix+001h)		;95a1   ; baja el paso del actor
	ret			;95a4
L_95A5:
	inc (ix+001h)		;95a5   ; sube el paso del actor
	ld (ix+011h),010h		;95a8   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	jp invierte_velocidad_x		;95ac   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
L_95AF:
	dec (ix+011h)		;95af   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;95b2
	ld (ix+001h),000h		;95b3   ; el paso del actor = 0x00
L_95B7:
	ret			;95b7
fotograma_37:		; cada 16 cuadros, (ix+0x10) = 0x37 o 0x38
	ld a,(0c00dh)		;95b8   ; lee la cuenta de cuadros del juego
	and 00fh		;95bb
	ret nz			;95bd
	ld c,037h		;95be
	ld a,(0c00dh)		;95c0   ; lee la cuenta de cuadros del juego
	and 010h		;95c3
	jr z,L_95C8		;95c5
	inc c			;95c7
L_95C8:
	ld (ix+010h),c		;95c8   ; guarda el fotograma del actor (p02:8A42)
	ret			;95cb
dispara_16:		; cada 0x40 cuadros crea el actor 0x16 debajo
	dec (ix+01fh)		;95cc
	ret nz			;95cf
	ld (ix+01fh),040h		;95d0
	ld d,(ix+005h)		;95d4   ; lee la X del actor
	ld a,(ix+003h)		;95d7   ; lee la Y del actor
	add a,010h		;95da
	ld e,a			;95dc
	ld c,016h		;95dd
	push ix		;95df
	call crea_actor_0		;95e1   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;95e4
	ret			;95e6
L_95E7:
	ld hl,0ae6fh		;95e7
	jp 05596h		;95ea   ; plantilla_de_actor: con 4-5-6: 11 bytes de HL a (ix+7)
L_95ED:
	ld b,(ix+001h)		;95ed   ; lee el paso del actor
	djnz L_95F9		;95f0
	dec (ix+011h)		;95f2   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;95f5
	jp borra_actor		;95f6   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
L_95F9:
	call cae_hasta_suelo		;95f9   ; cae_hasta_suelo: si hay suelo (p02:9CE7): se para y pasa al siguiente paso
	jp 0a690h		;95fc   ; frena_caida: si la velocidad Y esta entre 6 y 0x50: 0x600 y sin aceleracion
cae_hasta_suelo:		; si hay suelo (p02:9CE7): se para y pasa al siguiente paso
	ld e,000h		;95ff
	ld d,004h		;9601
	call choque_debajo		;9603   ; choque_debajo: la casilla de debajo del actor (p02:9D09) y p03:A683
	ret z			;9606
	ld (ix+006h),000h		;9607   ; si el actor se mueve (p02:8367) = 0x00
	inc (ix+001h)		;960b   ; sube el paso del actor
	inc (ix+010h)		;960e   ; sube el fotograma del actor (p02:8A42)
	ret			;9611
L_9612:
	ld hl,03904h		;9612
	jp pon_fotograma		;9615   ; pon_fotograma: (ix+0x10) = H y (ix+0x11) = L
L_9618:
	ld a,(ix+001h)		;9618   ; lee el paso del actor
	call 0408dh		;961b   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_961E: tabla de 5 palabras del despachador (call 0x408D en
;   0x961B); lo leen L_408D (10 bytes)
;   0x961e..0x9628  (10 bytes)
DATA_saltos_961E:
	defb 028h,096h	; 961e
	defb 034h,096h	; 9620
	defb 045h,096h	; 9622
	defb 045h,096h	; 9624
	defb 054h,096h	; 9626

; ======================================================================
; CODIGO 0x9628..0x980b  (483 bytes)
; ======================================================================


L_9628:
	dec (ix+011h)		;9628   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;962b
	inc (ix+001h)		;962c   ; sube el paso del actor
	ld h,002h		;962f
	jp velocidad_y_h		;9631   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
L_9634:
	call choque_4		;9634   ; choque_4: p02:9D09 con E = 4
	ret z			;9637
	ld (ix+011h),008h		;9638   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	inc (ix+001h)		;963c   ; sube el paso del actor
	inc (ix+010h)		;963f   ; sube el fotograma del actor (p02:8A42)
	jp velocidad_y_l		;9642   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
L_9645:
	dec (ix+011h)		;9645   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9648
	inc (ix+001h)		;9649   ; sube el paso del actor
	ld (ix+011h),008h		;964c   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	inc (ix+010h)		;9650   ; sube el fotograma del actor (p02:8A42)
	ret			;9653
L_9654:
	dec (ix+011h)		;9654   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9657
	ld a,018h		;9658
	call 056e3h		;965a   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	call compara_y		;965d   ; compara_y: compara la Y del personaje con la del actor
	jr c,L_966D		;9660
	ld a,(0c244h)		;9662   ; lee la Y del personaje
	add a,020h		;9665
	sub (ix+003h)		;9667   ; le resta la Y del actor
	cp 040h		;966a
	ret nc			;966c
L_966D:
	call borra_actor		;966d   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	call estado_del_que_se_lleva		;9670   ; estado_del_que_se_lleva: A = el estado del personaje que se lleva
	ld b,001h		;9673
	cp 003h		;9675
	jr z,L_9683		;9677
	inc b			;9679
	or a			;967a
	jr z,L_9683		;967b
	inc b			;967d
	cp 001h		;967e
	jr z,L_9683		;9680
	inc b			;9682
L_9683:
	ld d,(ix+005h)		;9683   ; lee la X del actor
	ld e,(ix+003h)		;9686   ; lee la Y del actor
	ld c,017h		;9689
	push ix		;968b
L_968D:
	push bc			;968d
	push de			;968e
	call crea_actor_0		;968f   ; crea_actor_0: p02:8615 con B = 0
	pop de			;9692
	pop bc			;9693
	djnz L_968D		;9694
	pop ix		;9696
	ret			;9698
L_9699:
	ld (ix+01eh),004h		;9699
	ld (ix+01dh),020h		;969d
	ld (ix+01fh),000h		;96a1
	ld b,008h		;96a5
	ld hl,0c400h		;96a7   ; apunta a los 8 actores (0x80 bytes cada uno)
L_96AA:
	ld a,(hl)			;96aa   ; los actores de tipo 0x17: si estan en su punto, (ix+0x1F) + 1
	cp 017h		;96ab
	push hl			;96ad
	call z,llega_al_punto		;96ae   ; llega_al_punto: (ix+0x1F) + 1 si el actor esta en la Y y X de HL
	pop hl			;96b1
	ld de,00080h		;96b2
	add hl,de			;96b5
	djnz L_96AA		;96b6
	ld a,(ix+01fh)		;96b8   ; (ix+0x1F) - 1, de 0 a 3
	dec a			;96bb
	and 003h		;96bc
	ld (ix+01fh),a		;96be
L_96C1:
	ld hl,0ae7ah		;96c1
	call 05596h		;96c4   ; plantilla_de_actor: con 4-5-6: 11 bytes de HL a (ix+7)
	ld a,(ix+005h)		;96c7   ; lee la X del actor
	inc a			;96ca
	ld (ix+01bh),a		;96cb
	bit 0,(ix+01ch)		;96ce
	jr nz,L_96E3		;96d2
	ld a,(ix+01fh)		;96d4
	and 001h		;96d7
	jr nz,L_96E3		;96d9
	call compara_x		;96db   ; compara_x: compara la X del personaje con la del actor
	call c,invierte_velocidad_x		;96de   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	jr L_96E9		;96e1
L_96E3:
	call compara_x		;96e3   ; compara_x: compara la X del personaje con la del actor
	call nc,invierte_velocidad_x		;96e6   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
L_96E9:
	ld de,03e40h		;96e9
	call fotograma_por_sentido		;96ec   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
	ld a,(ix+01fh)		;96ef
	cp 002h		;96f2
	ret nc			;96f4
	ld (ix+001h),001h		;96f5   ; el paso del actor = 0x01
	ret			;96f9
llega_al_punto:		; (ix+0x1F) + 1 si el actor esta en la Y y X de HL
	ld a,003h		;96fa
	call 04083h		;96fc   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;96ff
	cp (ix+003h)		;9700   ; compara con la Y del actor
	ret nz			;9703
	inc hl			;9704
	inc hl			;9705
	ld a,(hl)			;9706
	cp (ix+005h)		;9707   ; compara con la X del actor
	ret nz			;970a
	inc (ix+01fh)		;970b
	ret			;970e
L_970F:
	ld b,(ix+001h)		;970f   ; lee el paso del actor
	djnz L_9740		;9712
	ld a,(ix+008h)		;9714   ; lee la velocidad Y del actor (alta)
	cp 080h		;9717
	call c,fotograma_3d_3f		;9719   ; fotograma_3d_3f: p02:9B8D con 0x3D / 0x3F
	ld a,010h		;971c
	ld de,00000h		;971e
	call mira_alrededor		;9721   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	ld a,(ix+016h)		;9724
	and 001h		;9727
	ret z			;9729
	dec (ix+01eh)		;972a
	call z,marca_1c		;972d   ; marca_1c: (ix+0x1C) bit 0
L_9730:
	ld a,(ix+01fh)		;9730
	jr L_96C1		;9733
fotograma_3d_3f:		; p02:9B8D con 0x3D / 0x3F
	ld de,03d3fh		;9735
	jp fotograma_por_sentido		;9738   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
marca_1c:		; (ix+0x1C) bit 0
	set 0,(ix+01ch)		;973b
	ret			;973f
L_9740:
	xor a			;9740
	ld (ix+006h),a		;9741   ; guarda si el actor se mueve (p02:8367)
	ld (ix+00bh),a		;9744   ; guarda si el actor acelera (p02:8393)
	call fotograma_3d_3f		;9747   ; fotograma_3d_3f: p02:9B8D con 0x3D / 0x3F
	ld a,(ix+01bh)		;974a
	ld (ix+005h),a		;974d   ; guarda la X del actor
	dec (ix+01dh)		;9750
	ret nz			;9753
	inc (ix+001h)		;9754   ; sube el paso del actor
	ld (ix+006h),001h		;9757   ; si el actor se mueve (p02:8367) = 0x01
	jr L_9730		;975b
L_975D:
	ld hl,0ae90h		;975d
	jp 05596h		;9760   ; plantilla_de_actor: con 4-5-6: 11 bytes de HL a (ix+7)
L_9763:
	ld b,(ix+001h)		;9763   ; lee el paso del actor
	djnz L_979A		;9766
	bit 2,(ix+01ah)		;9768
	ld a,001h		;976c
	jr z,L_9772		;976e
	ld a,0ffh		;9770
L_9772:
	add a,(ix+005h)		;9772   ; le suma la X del actor
	ld (ix+005h),a		;9775   ; guarda la X del actor
	inc (ix+01ah)		;9778
	ld a,(ix+01ah)		;977b
	cp 019h		;977e
	ret c			;9780
	inc (ix+001h)		;9781   ; sube el paso del actor
	ld hl,0ae9bh		;9784
	call 05596h		;9787   ; plantilla_de_actor: con 4-5-6: 11 bytes de HL a (ix+7)
	call compara_x		;978a   ; compara_x: compara la X del personaje con la del actor
	jp nc,L_8BFD		;978d
	ld (ix+010h),01ah		;9790   ; el fotograma del actor (p02:8A42) = 0x1A
	call invierte_velocidad_x		;9794   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	jp L_8BFD		;9797
L_979A:
	djnz L_97B2		;979a
	ld a,(0c00dh)		;979c   ; lee la cuenta de cuadros del juego
	and 007h		;979f
	call z,sube_hacia_el_personaje		;97a1   ; sube_hacia_el_personaje: la Y del actor hacia 0x20 por encima del personaje
	call rebota_en_borde		;97a4   ; rebota_en_borde: cerca de un borde, sonido 0x0A y cambia el sentido (ix+0x17)
	dec (ix+011h)		;97a7   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;97aa
	ld (ix+011h),01ah		;97ab   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x1A
	jp L_8B07		;97af
L_97B2:
	ld a,(0c244h)		;97b2   ; lee la Y del personaje
	sub 020h		;97b5
	cp (ix+003h)		;97b7   ; compara con la Y del actor
	ret nc			;97ba
	inc (ix+001h)		;97bb   ; sube el paso del actor
	ld (ix+01ah),002h		;97be
	jp velocidad_y_l		;97c2   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
sube_hacia_el_personaje:		; la Y del actor hacia 0x20 por encima del personaje
	ld a,(0c244h)		;97c5   ; lee la Y del personaje
	sub 020h		;97c8
	cp (ix+003h)		;97ca   ; compara con la Y del actor
	ld a,001h		;97cd
	jr nc,L_97D3		;97cf
	ld a,0ffh		;97d1
L_97D3:
	add a,(ix+003h)		;97d3   ; le suma la Y del actor
	ld (ix+003h),a		;97d6   ; guarda la Y del actor
	ret			;97d9
rebota_en_borde:		; cerca de un borde, sonido 0x0A y cambia el sentido (ix+0x17)
	ld a,(ix+005h)		;97da   ; lee la X del actor
	add a,(ix+00ah)		;97dd   ; le suma la velocidad X del actor (alta)
	add a,010h		;97e0
	cp 020h		;97e2
	ret nc			;97e4
	call invierte_velocidad_x		;97e5   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	ld a,(ix+017h)		;97e8
	xor 001h		;97eb
	ld (ix+017h),a		;97ed
	and 001h		;97f0
	ld a,01ah		;97f2
	jr nz,L_97F8		;97f4
	ld a,019h		;97f6
L_97F8:
	ld (ix+010h),a		;97f8   ; guarda el fotograma del actor (p02:8A42)
	ret			;97fb
L_97FC:
	ld (ix+011h),010h		;97fc   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld (ix+013h),000h		;9800   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ret			;9804
L_9805:
	ld a,(ix+001h)		;9805   ; lee el paso del actor
	call 0408dh		;9808   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_980B: tabla de 3 palabras del despachador (call 0x408D en
;   0x9808); lo leen L_408D (6 bytes)
;   0x980b..0x9811  (6 bytes)
DATA_saltos_980B:
	defb 011h,098h	; 980b
	defb 05dh,098h	; 980d
	defb 09fh,098h	; 980f

; ======================================================================
; CODIGO 0x9811..0x9a2a  (537 bytes)
; ======================================================================


L_9811:
	dec (ix+011h)		;9811   ; cada 0x10 cuadros, (ix+0x1F) + 1; al llegar a 5, p02:9850
	ret nz			;9814
	ld (ix+011h),010h		;9815   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	inc (ix+01fh)		;9819
	ld a,(ix+01fh)		;981c
	cp 005h		;981f
	jr z,L_9850		;9821
crea_tipo_15:		; crea un actor 0x15 en su posicion con IX = 0xCC3A
	ld d,(ix+005h)		;9823   ; lee la X del actor
	ld e,(ix+003h)		;9826   ; lee la Y del actor
	ld c,015h		;9829
	ld a,(ix+01fh)		;982b
	ld b,a			;982e
	push ix		;982f
	xor a			;9831
	ld (0cc3ah),a		;9832
	ld ix,0cc3ah		;9835
	push bc			;9839
	call crea_actor_0		;983a   ; crea_actor_0: p02:8615 con B = 0
	pop bc			;983d
	ld a,(ix+000h)		;983e
	cp 015h		;9841
	jr nz,L_9848		;9843
	ld (ix+01fh),b		;9845
L_9848:
	pop ix		;9848
	or a			;984a
	ret nz			;984b
	dec (ix+01fh)		;984c
	ret			;984f
L_9850:
	inc (ix+001h)		;9850   ; sube el paso del actor
	ld (ix+011h),040h		;9853   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x40
	ld hl,0ffc0h		;9857
	jp pon_velocidad_x		;985a   ; pon_velocidad_x: (ix+9, 0x0A) = HL
L_985D:
	call choque_lateral		;985d   ; choque_lateral: la casilla de delante del actor segun su sentido (p02:8BB7)
	call nz,invierte_velocidad_x		;9860   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	call choque_4		;9863   ; choque_4: p02:9D09 con E = 4
	jp z,invierte_velocidad_x		;9866   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	ld a,(ix+01fh)		;9869
	cp 008h		;986c
	jr z,L_9877		;986e
	call cuenta_tipo_15		;9870   ; cuenta_tipo_15: A = cuantos actores de tipo 0x15 hay
	cp 004h		;9873
	jr c,L_9897		;9875
L_9877:
	dec (ix+011h)		;9877   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;987a
	ld (ix+011h),040h		;987b   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x40
	jp invierte_velocidad_x		;987f   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
cuenta_tipo_15:		; A = cuantos actores de tipo 0x15 hay
	ld hl,0c400h		;9882   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld de,00080h		;9885
	ld c,000h		;9888
	ld b,008h		;988a
L_988C:
	ld a,(hl)			;988c
	cp 015h		;988d
	jr nz,L_9892		;988f
	inc c			;9891
L_9892:
	add hl,de			;9892
	djnz L_988C		;9893
	ld a,c			;9895
	ret			;9896
L_9897:
	inc (ix+001h)		;9897   ; sube el paso del actor
	ld (ix+006h),000h		;989a   ; si el actor se mueve (p02:8367) = 0x00
	ret			;989e
L_989F:
	ld (ix+006h),001h		;989f   ; si el actor se mueve (p02:8367) = 0x01
	dec (ix+001h)		;98a3   ; baja el paso del actor
	call estado_del_que_se_lleva		;98a6   ; estado_del_que_se_lleva: A = el estado del personaje que se lleva
	ld c,004h		;98a9
	or a			;98ab
	jr z,L_98B6		;98ac
	ld c,008h		;98ae
	cp 003h		;98b0
	jr z,L_98B6		;98b2
	ld c,006h		;98b4
L_98B6:
	ld a,(ix+01fh)		;98b6
	cp c			;98b9
	ret z			;98ba
	call crea_tipo_15		;98bb   ; crea_tipo_15: crea un actor 0x15 en su posicion con IX = 0xCC3A
	inc (ix+01fh)		;98be
	ret			;98c1
L_98C2:
	ld a,(ix+012h)		;98c2   ; lee la vida del actor (p01:721A)
	ld (ix+01dh),a		;98c5
	ld (ix+01eh),080h		;98c8
	ld hl,02b00h		;98cc
	call pon_fotograma		;98cf   ; pon_fotograma: (ix+0x10) = H y (ix+0x11) = L
mira_al_personaje_2b:		; (ix+0x10) = 0x2B o 0x2C (+ 2 mientras (ix+0x1C))
	call compara_x		;98d2   ; compara_x: compara la X del personaje con la del actor
	ld a,02bh		;98d5
	jr nc,L_98DB		;98d7
	ld a,02ch		;98d9
L_98DB:
	ld b,a			;98db   ; mientras (ix+0x1C), el fotograma B + 2
	ld a,(ix+01ch)		;98dc
	or a			;98df
	jr z,L_98E7		;98e0
	dec (ix+01ch)		;98e2
	inc b			;98e5
	inc b			;98e6
L_98E7:
	ld (ix+010h),b		;98e7   ; guarda el fotograma del actor (p02:8A42)
	ret			;98ea
pon_1c_10:		; (ix+0x1C) = 0x10
	ld (ix+01ch),010h		;98eb
	ret			;98ef
L_98F0:
	call mira_al_personaje_2b		;98f0   ; mira_al_personaje_2b: (ix+0x10) = 0x2B o 0x2C (+ 2 mientras (ix+0x1C))
	ld a,(ix+012h)		;98f3   ; lee la vida del actor (p01:721A)
	cp (ix+01dh)		;98f6
	ld (ix+01dh),a		;98f9
	call nz,pon_1c_10		;98fc   ; pon_1c_10: (ix+0x1C) = 0x10
	call cuenta_1e_20		;98ff   ; cuenta_1e_20: (ix+0x1E) - 1; a cero, 0x20 y la direccion hacia el personaje
	call busca_tipo_3		;9902   ; busca_tipo_3: HL = el primer actor de tipo 3
	ld a,(ix+001h)		;9905   ; lee el paso del actor
	and a			;9908
	ret nz			;9909
	ld a,(ix+012h)		;990a   ; lee la vida del actor (p01:721A)
	dec a			;990d
	jr z,L_994F		;990e
	ld a,(iy+005h)		;9910
	ld (ix+005h),a		;9913   ; guarda la X del actor
	ld c,(ix+01fh)		;9916
	push ix		;9919
	call el_15_de_menos		;991b   ; el_15_de_menos: busca entre los tipo 0x15 el de menor (ix+0x1F) por encima de C
	pop ix		;991e
	sub (ix+003h)		;9920
	jr c,L_992E		;9923
	cp 010h		;9925
	jr c,L_992E		;9927
	ret z			;9929
	inc (ix+003h)		;992a
	ret			;992d
L_992E:
	dec (ix+003h)		;992e   ; baja la Y del actor
	ret			;9931
el_15_de_menos:		; busca entre los tipo 0x15 el de menor (ix+0x1F) por encima de C
	ld b,008h		;9932
	ld hl,0c400h		;9934   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld d,0ffh		;9937
L_9939:
	ld a,(hl)			;9939
	cp 015h		;993a
	call z,compara_15		;993c   ; compara_15: D = el (ix+0x1F) del actor HL si esta entre C y D
	ld a,080h		;993f
	call 04083h		;9941   ; hl_mas_a: HL = HL + A
	djnz L_9939		;9944
	ld a,0ffh		;9946
	cp d			;9948
	jr z,L_9960		;9949
	ld a,(ix+003h)		;994b   ; lee la Y del actor
	ret			;994e
L_994F:
	inc (ix+001h)		;994f   ; sube el paso del actor
	call compara_x		;9952   ; compara_x: compara la X del personaje con la del actor
	ld hl,0f800h		;9955
	jr c,L_995D		;9958
	call niega_hl		;995a   ; niega_hl: HL = -HL
L_995D:
	jp pon_velocidad_x		;995d   ; pon_velocidad_x: (ix+9, 0x0A) = HL
L_9960:
	ld a,(iy+003h)		;9960
	add a,010h		;9963
	ret			;9965
compara_15:		; D = el (ix+0x1F) del actor HL si esta entre C y D
	inc hl			;9966   ; solo los que no tienen paso (ix+1 a cero)
	ld a,(hl)			;9967
	dec hl			;9968
	or a			;9969
	ret nz			;996a
	push hl			;996b
	ld a,01fh		;996c   ; su (ix+0x1F): entre C y D se queda con el mas bajo, en IX
	call 04083h		;996e   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;9971
	pop hl			;9972
	cp c			;9973
	ret c			;9974
	ret z			;9975
	cp d			;9976
	ret nc			;9977
	ld d,a			;9978
	push hl			;9979
	pop ix		;997a
	ret			;997c
busca_tipo_3:		; HL = el primer actor de tipo 3
	ld hl,0c400h		;997d   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld de,00080h		;9980
	ld b,008h		;9983
L_9985:
	ld a,(hl)			;9985   ; busca el tipo 3 en los actores de HL
	cp 003h		;9986
	jr z,L_998E		;9988
	add hl,de			;998a
	djnz L_9985		;998b
	ret			;998d
L_998E:
	push hl			;998e
	pop iy		;998f
	ret			;9991
cuenta_1e_20:		; (ix+0x1E) - 1; a cero, 0x20 y la direccion hacia el personaje
	dec (ix+01eh)		;9992
	ret nz			;9995
	ld (ix+01eh),020h		;9996
	call compara_x		;999a   ; compara_x: compara la X del personaje con la del actor
	ld a,002h		;999d
	jr nc,L_99A3		;999f
	neg		;99a1
L_99A3:
	jp L_8C56		;99a3
L_99A6:
	ld (ix+010h),041h		;99a6   ; el fotograma del actor (p02:8A42) = 0x41
	ld (ix+01fh),004h		;99aa
	ld (ix+011h),010h		;99ae   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ret			;99b2
L_99B3:
	ld c,041h		;99b3
	call alterna_fotograma		;99b5   ; alterna_fotograma: cada 8 cuadros, (ix+0x10) alterna con C
	ld a,(ix+001h)		;99b8   ; lee el paso del actor
	and a			;99bb
	jr nz,$+126		;99bc
	call al_azar_9a2a		;99be   ; al_azar_9a2a: una direccion al azar de p02:9A2A
	ld (ix+011h),018h		;99c1   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x18
	inc (ix+001h)		;99c5   ; sube el paso del actor
	ret			;99c8
al_azar_9a2a:		; una direccion al azar de p02:9A2A
	call azar		;99c9   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	and 003h		;99cc
	jr z,L_99ED		;99ce
	call azar		;99d0   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	and 00eh		;99d3
	rr a		;99d5
L_99D7:
	ld (ix+01fh),a		;99d7
	add a,a			;99da
	ld de,09a2ah		;99db
	call 04088h		;99de   ; de_mas_a: DE = DE + A
	ld a,(de)			;99e1
	inc de			;99e2
	ld h,a			;99e3
	call velocidad_x_h		;99e4   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	ld a,(de)			;99e7
	inc de			;99e8
	ld h,a			;99e9
	jp velocidad_y_h		;99ea   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
L_99ED:
	call compara_x		;99ed   ; compara_x: compara la X del personaje con la del actor
	ld b,000h		;99f0
	jr nc,L_99F6		;99f2
	ld b,004h		;99f4
L_99F6:
	ld a,(0c246h)		;99f6   ; lee la X del personaje
	sub (ix+005h)		;99f9   ; le resta la X del actor
	add a,010h		;99fc
	cp 020h		;99fe
	jr c,L_9A27		;9a00
	inc b			;9a02
	ld a,(0c244h)		;9a03   ; lee la Y del personaje
	sub (ix+003h)		;9a06   ; le resta la Y del actor
	add a,010h		;9a09
	cp 020h		;9a0b
	inc b			;9a0d
	jr c,L_9A27		;9a0e
	dec b			;9a10
	call compara_y		;9a11   ; compara_y: compara la Y del personaje con la del actor
	ld c,000h		;9a14
	jr c,L_9A1A		;9a16
	ld c,002h		;9a18
L_9A1A:
	ld a,b			;9a1a   ; con B = 1, el sentido C da la vuelta (xor 2)
	cp 001h		;9a1b
	jr nz,L_9A23		;9a1d
	ld a,c			;9a1f
	xor 002h		;9a20
	ld c,a			;9a22
L_9A23:
	ld a,b			;9a23
	add a,c			;9a24
	jr L_99D7		;9a25
L_9A27:
	ld a,b			;9a27
	jr L_99D7		;9a28

; ----------------------------------------------------------------------
; DATOS resto_9A2A: tablas cortas que apuntan p02:99DB (0x9A2A); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p02:99DB (16
;   bytes)
;   0x9a2a..0x9a3a  (16 bytes)
DATA_resto_9A2A:
	defb 000h,002h,001h,001h,002h,000h,001h,0ffh,000h,0feh,0ffh,0ffh,0feh,000h,0ffh,001h	; 9a2a  ................

; ======================================================================
; CODIGO 0x9a3a..0x9b55  (283 bytes)
; ======================================================================


L_9A3A:
	ld a,(0c00dh)		;9a3a   ; lee la cuenta de cuadros del juego
	and 001h		;9a3d
	ld (ix+006h),a		;9a3f   ; guarda si el actor se mueve (p02:8367)
	call fotograma_41		;9a42   ; fotograma_41: cada 4 cuadros, el fotograma alrededor de 0x41
	dec (ix+011h)		;9a45   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9a48
	dec (ix+001h)		;9a49   ; baja el paso del actor
	ret			;9a4c
fotograma_41:		; cada 4 cuadros, el fotograma alrededor de 0x41
	ld a,(0c00dh)		;9a4d   ; lee la cuenta de cuadros del juego
	and 003h		;9a50
	ret nz			;9a52
	ld a,041h		;9a53
	dec (ix+010h)		;9a55   ; baja el fotograma del actor (p02:8A42)
	cp (ix+010h)		;9a58   ; compara con el fotograma del actor (p02:8A42)
	ret z			;9a5b
	inc (ix+010h)		;9a5c   ; sube el fotograma del actor (p02:8A42)
	inc (ix+010h)		;9a5f   ; sube el fotograma del actor (p02:8A42)
	ret			;9a62
L_9A63:
	ld (ix+010h),088h		;9a63   ; el fotograma del actor (p02:8A42) = 0x88
	ld (ix+00bh),001h		;9a67   ; si el actor acelera (p02:8393) = 0x01
	ld (ix+00ch),020h		;9a6b   ; la aceleracion Y del actor = 0x20
	ld a,(ix+003h)		;9a6f   ; lee la Y del actor
	cp 080h		;9a72
	ld h,0feh		;9a74
	jr c,L_9A7A		;9a76
	ld h,0fch		;9a78
L_9A7A:
	call velocidad_y_h		;9a7a   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	call azar		;9a7d   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	and 003h		;9a80
	inc a			;9a82
	ld l,000h		;9a83
	srl a		;9a85
	rr l		;9a87
	ld h,a			;9a89
	call compara_x		;9a8a   ; compara_x: compara la X del personaje con la del actor
	jr nc,L_9A92		;9a8d
	call niega_hl		;9a8f   ; niega_hl: HL = -HL
L_9A92:
	ld (ix+011h),020h		;9a92   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	jp pon_velocidad_x		;9a96   ; pon_velocidad_x: (ix+9, 0x0A) = HL
L_9A99:
	ret			;9a99
L_9A9A:
	ld (ix+010h),025h		;9a9a   ; el fotograma del actor (p02:8A42) = 0x25
	push ix		;9a9e
	pop hl			;9aa0
	add hl,hl			;9aa1
	ld a,h			;9aa2
	and 007h		;9aa3
	inc a			;9aa5
	ld (ix+011h),a		;9aa6   ; guarda la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ld (ix+001h),004h		;9aa9   ; el paso del actor = 0x04
	ret			;9aad
L_9AAE:
	ld b,(ix+001h)		;9aae   ; lee el paso del actor
	djnz L_9AD2		;9ab1
	ld (ix+010h),026h		;9ab3   ; el fotograma del actor (p02:8A42) = 0x26
	dec (ix+011h)		;9ab7   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9aba
	inc (ix+010h)		;9abb   ; sube el fotograma del actor (p02:8A42)
	inc (ix+001h)		;9abe   ; sube el paso del actor
L_9AC1:
	ld (ix+013h),003h		;9ac1   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x03
	ld (ix+00ch),040h		;9ac5   ; la aceleracion Y del actor = 0x40
	ld (ix+00bh),001h		;9ac9   ; si el actor acelera (p02:8393) = 0x01
	ld h,0ffh		;9acd
	jp velocidad_y_h		;9acf   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
L_9AD2:
	djnz L_9B04		;9ad2
	call 0a690h		;9ad4   ; frena_caida: si la velocidad Y esta entre 6 y 0x50: 0x600 y sin aceleracion
	ld e,000h		;9ad7
	ld d,007h		;9ad9
	call choque_debajo		;9adb   ; choque_debajo: la casilla de debajo del actor (p02:9D09) y p03:A683
	ret z			;9ade
	ld (ix+00bh),000h		;9adf   ; si el actor acelera (p02:8393) = 0x00
	call para_actor		;9ae3   ; para_actor: velocidades a cero
	inc (ix+001h)		;9ae6   ; sube el paso del actor
	call compara_x		;9ae9   ; compara_x: compara la X del personaje con la del actor
	ld h,0ffh		;9aec
	jr c,L_9AF2		;9aee
	ld h,001h		;9af0
L_9AF2:
	call estado_no_3		;9af2   ; estado_no_3: acarreo si el estado del personaje no es 3
	ld a,h			;9af5
	jr c,L_9AFA		;9af6
	neg		;9af8
L_9AFA:
	ld h,a			;9afa
	call velocidad_x_h		;9afb   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
L_9AFE:
	ld de,02927h		;9afe
	jp fotograma_por_sentido		;9b01   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
L_9B04:
	djnz L_9B21		;9b04
	ld c,027h		;9b06
	call alterna_fotograma		;9b08   ; alterna_fotograma: cada 8 cuadros, (ix+0x10) alterna con C
	call choque_lateral		;9b0b   ; choque_lateral: la casilla de delante del actor segun su sentido (p02:8BB7)
	call nz,sonido_y_sigue		;9b0e   ; sonido_y_sigue: el sonido 0x0A y p02:9AFE
	call se_para_si_choca		;9b11   ; se_para_si_choca: si choca (p02:9D05): velocidad X 0, Y 0x400 y paso 0
	ret nc			;9b14
	ld (ix+001h),002h		;9b15   ; el paso del actor = 0x02
	jp L_9AC1		;9b19
sonido_y_sigue:		; el sonido 0x0A y p02:9AFE
	call invierte_velocidad_x		;9b1c   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	jr L_9AFE		;9b1f
L_9B21:
	djnz L_9B34		;9b21
	dec (ix+011h)		;9b23   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9b26
	ld (ix+011h),008h		;9b27   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	ld (ix+001h),000h		;9b2b   ; el paso del actor = 0x00
	ld (ix+008h),0ffh		;9b2f   ; la velocidad Y del actor (alta) = 0xFF
	ret			;9b33
L_9B34:
	dec (ix+011h)		;9b34   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9b37
	call estado_no_3		;9b38   ; estado_no_3: acarreo si el estado del personaje no es 3
	ld a,008h		;9b3b
	jr c,L_9B40		;9b3d
	add a,a			;9b3f
L_9B40:
	ld (ix+011h),a		;9b40   ; guarda la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	jp invierte_velocidad_y		;9b43   ; invierte_velocidad_y: la velocidad Y del actor, al reves (p02:8B0D con A = 8)
L_9B46:
	ld (ix+010h),000h		;9b46   ; el fotograma del actor (p02:8A42) = 0x00
	ld h,004h		;9b4a
	jp velocidad_y_h		;9b4c   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
L_9B4F:
	ld a,(ix+001h)		;9b4f   ; lee el paso del actor
	call 0408dh		;9b52   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_9B55: tabla de 7 palabras del despachador (call 0x408D en
;   0x9B52); lo leen L_408D (14 bytes)
;   0x9b55..0x9b63  (14 bytes)
DATA_saltos_9B55:
	defb 063h,09bh	; 9b55
	defb 0abh,09bh	; 9b57
	defb 030h,09dh	; 9b59
	defb 040h,09dh	; 9b5b
	defb 030h,09dh	; 9b5d
	defb 051h,09dh	; 9b5f
	defb 06ah,09dh	; 9b61

; ======================================================================
; CODIGO 0x9b63..0x9d88  (549 bytes)
; ======================================================================


L_9B63:
	ld e,(ix+008h)		;9b63   ; lee la velocidad Y del actor (alta)
	call choque_7		;9b66   ; choque_7: p02:9D09 con D = 7
	ret z			;9b69
	ld a,005h		;9b6a
	call 056e3h		;9b6c   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	call 0a683h		;9b6f   ; alinea_y: la Y del actor al centro de su fila de 8 (+ 4)
	inc (ix+001h)		;9b72   ; sube el paso del actor
L_9B75:
	call velocidad_y_l		;9b75   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	ld (ix+011h),020h		;9b78   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	call compara_x		;9b7c   ; compara_x: compara la X del personaje con la del actor
	ld hl,0fea0h		;9b7f
	jr c,L_9B87		;9b82
	ld hl,00160h		;9b84
L_9B87:
	call pon_velocidad_x		;9b87   ; pon_velocidad_x: (ix+9, 0x0A) = HL
L_9B8A:
	ld de,00002h		;9b8a
fotograma_por_sentido:		; (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
	ld a,(ix+00ah)		;9b8d   ; lee la velocidad X del actor (alta)
	cp 080h		;9b90
	ld a,d			;9b92
	jr c,L_9B96		;9b93
	ld a,e			;9b95
L_9B96:
	ld (ix+010h),a		;9b96   ; guarda el fotograma del actor (p02:8A42)
	ret			;9b99
alterna_fotograma:		; cada 8 cuadros, (ix+0x10) alterna con C
	ld a,(0c00dh)		;9b9a   ; lee la cuenta de cuadros del juego
	and 007h		;9b9d
	ret nz			;9b9f
	ld a,(ix+010h)		;9ba0   ; lee el fotograma del actor (p02:8A42)
	sub c			;9ba3
	xor 001h		;9ba4
	add a,c			;9ba6
	ld (ix+010h),a		;9ba7   ; guarda el fotograma del actor (p02:8A42)
	ret			;9baa
L_9BAB:
	ld c,000h		;9bab
	call alterna_fotograma		;9bad   ; alterna_fotograma: cada 8 cuadros, (ix+0x10) alterna con C
	call se_para_si_choca		;9bb0   ; se_para_si_choca: si choca (p02:9D05): velocidad X 0, Y 0x400 y paso 0
	ret c			;9bb3
	call choca_de_lado		;9bb4   ; choca_de_lado: (ix+0x1E) = 1 y acarreo si choca de lado (p02:9CC8)
	call estado_no_3		;9bb7   ; estado_no_3: acarreo si el estado del personaje no es 3
	jp nc,L_9C11		;9bba
	ld a,(ix+01eh)		;9bbd
	or a			;9bc0
	jr nz,L_9BD6		;9bc1
	dec (ix+011h)		;9bc3   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9bc6
	ld (ix+011h),010h		;9bc7   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld a,(0c244h)		;9bcb   ; lee la Y del personaje
	sub (ix+003h)		;9bce   ; le resta la Y del actor
	add a,004h		;9bd1
	cp 008h		;9bd3
	ret c			;9bd5
L_9BD6:
	ld a,(0c244h)		;9bd6   ; lee la Y del personaje
	cp (ix+003h)		;9bd9   ; compara con la Y del actor
	jp nc,L_9BF8		;9bdc
	call busca_suelo_arriba		;9bdf   ; busca_suelo_arriba: casillas hacia arriba desde el actor (p01:704C)
	jp nc,L_9C74		;9be2
	ld a,(ix+01eh)		;9be5
	or a			;9be8
	ret z			;9be9
	call busca_suelo_abajo		;9bea   ; busca_suelo_abajo: casillas hacia abajo desde el actor (p01:704C)
	jp nc,L_9C8D		;9bed
	call invierte_velocidad_x		;9bf0   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	ld de,00002h		;9bf3
	jr fotograma_por_sentido		;9bf6
L_9BF8:
	call busca_suelo_abajo		;9bf8   ; busca_suelo_abajo: casillas hacia abajo desde el actor (p01:704C)
	jp nc,L_9C8D		;9bfb
	ld a,(ix+01eh)		;9bfe
	or a			;9c01
	ret z			;9c02
	call busca_suelo_arriba		;9c03   ; busca_suelo_arriba: casillas hacia arriba desde el actor (p01:704C)
	jr nc,L_9C74		;9c06
	call invierte_velocidad_x		;9c08   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	ld de,00002h		;9c0b
	jp fotograma_por_sentido		;9c0e   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
L_9C11:
	ld a,(ix+01eh)		;9c11
	or a			;9c14
	ret z			;9c15
	call invierte_velocidad_x		;9c16   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	jp L_9B8A		;9c19
busca_suelo_arriba:		; casillas hacia arriba desde el actor (p01:704C)
	ld d,(ix+005h)		;9c1c   ; lee la X del actor
	ld a,(ix+003h)		;9c1f   ; lee la Y del actor
	sub 00ch		;9c22
	ld e,a			;9c24
	ld b,0f0h		;9c25
	ld c,001h		;9c27
L_9C29:
	ld a,e			;9c29   ; sube de B en B desde E mientras haya casillas: hasta 0x30
	add a,b			;9c2a
	ld e,a			;9c2b
	cp 0d0h		;9c2c
	jr nc,L_9C72		;9c2e
	cp 030h		;9c30
	jr c,L_9C72		;9c32
	push bc			;9c34
	push de			;9c35
	call 0704ch		;9c36   ; con acarreo de p01:704C, alli
	pop de			;9c39
	pop bc			;9c3a
	jr c,L_9C43		;9c3b
	ld a,c			;9c3d
	or a			;9c3e
	jr nz,L_9C29		;9c3f
	or a			;9c41
	ret			;9c42
L_9C43:
	ld c,000h		;9c43
	jr L_9C29		;9c45
busca_suelo_abajo:		; casillas hacia abajo desde el actor (p01:704C)
	ld d,(ix+005h)		;9c47   ; lee la X del actor
	ld a,(ix+003h)		;9c4a   ; lee la Y del actor
	add a,004h		;9c4d
	ld e,a			;9c4f
	ld b,010h		;9c50
	ld c,001h		;9c52
L_9C54:
	ld a,e			;9c54   ; baja de B en B: hasta 0xD0
	add a,b			;9c55
	ld e,a			;9c56
	cp 0d0h		;9c57
	jr nc,L_9C72		;9c59
	cp 030h		;9c5b
	jr c,L_9C72		;9c5d
	push bc			;9c5f
	push de			;9c60
	call 0704ch		;9c61   ; sin acarreo de p01:704C, alli
	pop de			;9c64
	pop bc			;9c65
	jr nc,L_9C6E		;9c66
	ld a,c			;9c68
	or a			;9c69
	jr nz,L_9C54		;9c6a
	or a			;9c6c
	ret			;9c6d
L_9C6E:
	ld c,000h		;9c6e
	jr L_9C54		;9c70
L_9C72:
	scf			;9c72
	ret			;9c73
L_9C74:
	ld h,0fch		;9c74
	call velocidad_y_h		;9c76   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	call velocidad_x_l		;9c79   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	ld a,e			;9c7c
	ld (ix+01fh),a		;9c7d
	ld (ix+001h),002h		;9c80   ; el paso del actor = 0x02
	ld (ix+006h),000h		;9c84   ; si el actor se mueve (p02:8367) = 0x00
	ld (ix+011h),010h		;9c88   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ret			;9c8c
L_9C8D:
	ld h,004h		;9c8d
	call velocidad_y_h		;9c8f   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	call velocidad_x_l		;9c92   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	ld a,e			;9c95
	sub 004h		;9c96
	ld (ix+01fh),a		;9c98
	ld (ix+001h),004h		;9c9b   ; el paso del actor = 0x04
	ld (ix+006h),000h		;9c9f   ; si el actor se mueve (p02:8367) = 0x00
	ld (ix+011h),010h		;9ca3   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ret			;9ca7
se_para_si_choca:		; si choca (p02:9D05): velocidad X 0, Y 0x400 y paso 0
	call choque_4		;9ca8   ; choque_4: p02:9D09 con E = 4
	ret nz			;9cab
	call velocidad_x_l		;9cac   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	ld h,004h		;9caf
	call velocidad_y_h		;9cb1   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	ld (ix+001h),000h		;9cb4   ; el paso del actor = 0x00
	scf			;9cb8
	ret			;9cb9
choca_de_lado:		; (ix+0x1E) = 1 y acarreo si choca de lado (p02:9CC8)
	ld (ix+01eh),000h		;9cba
	call choque_lateral		;9cbe   ; choque_lateral: la casilla de delante del actor segun su sentido (p02:8BB7)
	ret z			;9cc1
	ld (ix+01eh),001h		;9cc2
	scf			;9cc6
	ret			;9cc7
choque_lateral:		; la casilla de delante del actor segun su sentido (p02:8BB7)
	ld d,007h		;9cc8
choque_fc:		; p02:9CCC con E = 0xFC
	ld e,0fch		;9cca
choque_por_sentido:		; la casilla a D (o -D, segun la velocidad X) y E del actor (p02:8BB7)
	ld a,(ix+00ah)		;9ccc   ; lee la velocidad X del actor (alta)
	cp 080h		;9ccf
	ld a,d			;9cd1
	jr c,L_9CD6		;9cd2
	neg		;9cd4
L_9CD6:
	add a,(ix+00ah)		;9cd6   ; le suma la velocidad X del actor (alta)
	ld d,a			;9cd9
	ld a,080h		;9cda
	push de			;9cdc
	call mira_alrededor		;9cdd   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	pop de			;9ce0
	ld a,(ix+016h)		;9ce1
	and 008h		;9ce4
	ret			;9ce6
choque_debajo:		; la casilla de debajo del actor (p02:9D09) y p03:A683
	ld a,e			;9ce7
	add a,(ix+008h)		;9ce8   ; le suma la velocidad Y del actor (alta)
	ld e,a			;9ceb
	call choque_en		;9cec   ; choque_en: la casilla en (D, E) del actor (p02:9D15)
	ret z			;9cef
	call 0a683h		;9cf0   ; alinea_y: la Y del actor al centro de su fila de 8 (+ 4)
	or 0ffh		;9cf3
	ret			;9cf5
L_9CF6:
	ld a,e			;9cf6
	add a,(ix+008h)		;9cf7   ; le suma la velocidad Y del actor (alta)
	ld e,a			;9cfa
	call choque_al_reves		;9cfb   ; choque_al_reves: como p02:9D09 al reves
	ret z			;9cfe
	call 0a683h		;9cff   ; alinea_y: la Y del actor al centro de su fila de 8 (+ 4)
	or 0ffh		;9d02
	ret			;9d04
choque_4:		; p02:9D09 con E = 4
	ld e,004h		;9d05
choque_7:		; p02:9D09 con D = 7
	ld d,007h		;9d07
choque_en:		; la casilla en (D, E) del actor (p02:9D15)
	call mira_casilla		;9d09   ; mira_casilla: p02:8BB7 con 0x80 en (D, E + 1); Z segun (ix+0x16) bit 3
	ret nz			;9d0c
	jr L_9D23		;9d0d
choque_al_reves:		; como p02:9D09 al reves
	call mira_casilla		;9d0f   ; mira_casilla: p02:8BB7 con 0x80 en (D, E + 1); Z segun (ix+0x16) bit 3
	ret z			;9d12
	jr L_9D23		;9d13
mira_casilla:		; p02:8BB7 con 0x80 en (D, E + 1); Z segun (ix+0x16) bit 3
	ld a,080h		;9d15
	push de			;9d17
	inc e			;9d18
	call mira_alrededor		;9d19   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	pop de			;9d1c
	ld a,(ix+016h)		;9d1d
	and 008h		;9d20
	ret			;9d22
L_9D23:
	ld a,080h		;9d23
	ld d,0f9h		;9d25
	call mira_alrededor		;9d27   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	ld a,(ix+016h)		;9d2a
	and 008h		;9d2d
	ret			;9d2f
L_9D30:
	dec (ix+011h)		;9d30   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9d33
	ld (ix+006h),001h		;9d34   ; si el actor se mueve (p02:8367) = 0x01
	ld (ix+010h),000h		;9d38   ; el fotograma del actor (p02:8A42) = 0x00
	inc (ix+001h)		;9d3c   ; sube el paso del actor
	ret			;9d3f
L_9D40:
	ld a,(ix+01fh)		;9d40
	cp (ix+003h)		;9d43   ; compara con la Y del actor
	ret c			;9d46
	call 0a683h		;9d47   ; alinea_y: la Y del actor al centro de su fila de 8 (+ 4)
	ld (ix+001h),001h		;9d4a   ; el paso del actor = 0x01
	jp L_9B75		;9d4e
L_9D51:
	ld a,(ix+003h)		;9d51   ; lee la Y del actor
	add a,(ix+008h)		;9d54   ; le suma la velocidad Y del actor (alta)
	cp (ix+01fh)		;9d57
	ret c			;9d5a
	ld a,005h		;9d5b
	call 056e3h		;9d5d   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	call 0a683h		;9d60   ; alinea_y: la Y del actor al centro de su fila de 8 (+ 4)
	ld (ix+001h),001h		;9d63   ; el paso del actor = 0x01
	jp L_9B75		;9d67
L_9D6A:
	dec (ix+011h)		;9d6a   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9d6d
	jp borra_actor		;9d6e   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
estado_no_3:		; acarreo si el estado del personaje no es 3
	call estado_del_que_se_lleva		;9d71   ; estado_del_que_se_lleva: A = el estado del personaje que se lleva
	cp 003h		;9d74
	ret z			;9d76
	scf			;9d77
	ret			;9d78
L_9D79:
	ld (ix+010h),010h		;9d79   ; el fotograma del actor (p02:8A42) = 0x10
	ld (ix+008h),006h		;9d7d   ; la velocidad Y del actor (alta) = 0x06
	ret			;9d81
L_9D82:
	ld a,(ix+001h)		;9d82   ; lee el paso del actor
	call 0408dh		;9d85   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_9D88: tabla de 5 palabras del despachador (call 0x408D en
;   0x9D85); lo leen L_408D (10 bytes)
;   0x9d88..0x9d92  (10 bytes)
DATA_saltos_9D88:
	defb 092h,09dh	; 9d88
	defb 0aeh,09dh	; 9d8a
	defb 0bch,09dh	; 9d8c
	defb 06fh,09eh	; 9d8e
	defb 0b1h,09eh	; 9d90

; ======================================================================
; CODIGO 0x9d92..0xa000  (622 bytes)
; ======================================================================


L_9D92:
	ld e,(ix+008h)		;9d92   ; lee la velocidad Y del actor (alta)
	call choque_7		;9d95   ; choque_7: p02:9D09 con D = 7
	ret z			;9d98
	call velocidad_y_l		;9d99   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	call 0a683h		;9d9c   ; alinea_y: la Y del actor al centro de su fila de 8 (+ 4)
	inc (ix+001h)		;9d9f   ; sube el paso del actor
	ld (ix+011h),008h		;9da2   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	inc (ix+010h)		;9da6   ; sube el fotograma del actor (p02:8A42)
	ld a,005h		;9da9
	jp 056e3h		;9dab   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_9DAE:
	dec (ix+011h)		;9dae   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9db1
	inc (ix+001h)		;9db2   ; sube el paso del actor
	ld (ix+011h),008h		;9db5   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	jp hacia_el_personaje_2		;9db9   ; hacia_el_personaje_2: velocidad X +-2 hacia el personaje y su fotograma
L_9DBC:
	ld c,012h		;9dbc
	call alterna_fotograma		;9dbe   ; alterna_fotograma: cada 8 cuadros, (ix+0x10) alterna con C
	call salta_si_puede		;9dc1   ; salta_si_puede: si no choca, el salto del actor
	ret c			;9dc4
	dec (ix+011h)		;9dc5   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9dc8
	ld (ix+011h),008h		;9dc9   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	call azar		;9dcd   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	and 003h		;9dd0
	cp 003h		;9dd2
	jr z,hacia_el_personaje_2		;9dd4
	or a			;9dd6
	jr z,L_9DFD		;9dd7
	cp 001h		;9dd9
	jr z,L_9DE9		;9ddb
	ld hl,0ff00h		;9ddd
	call estado_no_3		;9de0   ; estado_no_3: acarreo si el estado del personaje no es 3
	jr c,L_9DF4		;9de3
	ld l,080h		;9de5
	jr L_9DF4		;9de7
L_9DE9:
	ld hl,00100h		;9de9
	call estado_no_3		;9dec   ; estado_no_3: acarreo si el estado del personaje no es 3
	jr c,L_9DF4		;9def
	ld hl,00080h		;9df1
L_9DF4:
	call pon_velocidad_x		;9df4   ; pon_velocidad_x: (ix+9, 0x0A) = HL
	ld de,01412h		;9df7
	jp fotograma_por_sentido		;9dfa   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
L_9DFD:
	call invierte_velocidad_x		;9dfd   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	ld de,01412h		;9e00
	jp fotograma_por_sentido		;9e03   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
hacia_el_personaje_2:		; velocidad X +-2 hacia el personaje y su fotograma
	call compara_x		;9e06   ; compara_x: compara la X del personaje con la del actor
	ld h,0feh		;9e09
	jr c,L_9E0F		;9e0b
	ld h,002h		;9e0d
L_9E0F:
	call velocidad_x_h		;9e0f   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	ld de,01412h		;9e12
	jp fotograma_por_sentido		;9e15   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
salta_si_puede:		; si no choca, el salto del actor
	call hueco_para_saltar		;9e18   ; hueco_para_saltar: mira las casillas de arriba y delante (p02:8BB7)
	ret c			;9e1b
	call choque_lateral		;9e1c   ; choque_lateral: la casilla de delante del actor segun su sentido (p02:8BB7)
	ret z			;9e1f
	ld (ix+011h),010h		;9e20   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld a,080h		;9e24
	ld e,0ech		;9e26
	call mira_alrededor		;9e28   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	ld a,(ix+016h)		;9e2b
	and 008h		;9e2e
	jp nz,invierte_velocidad_x		;9e30   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
	inc (ix+001h)		;9e33   ; sube el paso del actor
	ld (ix+011h),002h		;9e36   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x02
	ld (ix+006h),000h		;9e3a   ; si el actor se mueve (p02:8367) = 0x00
	scf			;9e3e
	ret			;9e3f
hueco_para_saltar:		; mira las casillas de arriba y delante (p02:8BB7)
	ld d,009h		;9e40
	ld e,004h		;9e42
	ld a,0c0h		;9e44
	push de			;9e46
	call mira_alrededor		;9e47   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	pop de			;9e4a
	ld a,(ix+016h)		;9e4b
	and 00ch		;9e4e
	ret nz			;9e50
	ld a,080h		;9e51
	ld d,0f7h		;9e53
	call mira_alrededor		;9e55   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	ld a,(ix+016h)		;9e58
	and 008h		;9e5b
	ret nz			;9e5d
	call velocidad_x_l		;9e5e   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	ld (ix+010h),010h		;9e61   ; el fotograma del actor (p02:8A42) = 0x10
	ld (ix+008h),003h		;9e65   ; la velocidad Y del actor (alta) = 0x03
	ld (ix+001h),000h		;9e69   ; el paso del actor = 0x00
	scf			;9e6d
	ret			;9e6e
L_9E6F:
	ld a,(0c00dh)		;9e6f   ; lee la cuenta de cuadros del juego
	and 00fh		;9e72
	ret nz			;9e74
	ld a,(ix+00ah)		;9e75   ; lee la velocidad X del actor (alta)
	cp 080h		;9e78
	ld b,008h		;9e7a
	jr c,L_9E80		;9e7c
	ld b,0f8h		;9e7e
L_9E80:
	ld a,(ix+005h)		;9e80   ; lee la X del actor
	add a,b			;9e83
	ld (ix+005h),a		;9e84   ; guarda la X del actor
	ld a,(ix+003h)		;9e87   ; lee la Y del actor
	sub 008h		;9e8a
	ld (ix+003h),a		;9e8c   ; guarda la Y del actor
	ld de,01716h		;9e8f
	call fotograma_por_sentido		;9e92   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
	dec (ix+011h)		;9e95   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9e98
	ld (ix+006h),001h		;9e99   ; si el actor se mueve (p02:8367) = 0x01
	call velocidad_y_l		;9e9d   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	ld (ix+011h),010h		;9ea0   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	call hacia_el_personaje_2		;9ea4   ; hacia_el_personaje_2: velocidad X +-2 hacia el personaje y su fotograma
	ld (ix+001h),002h		;9ea7   ; el paso del actor = 0x02
	ld de,01412h		;9eab
	jp fotograma_por_sentido		;9eae   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
L_9EB1:
	dec (ix+011h)		;9eb1   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9eb4
	jp borra_actor		;9eb5   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
L_9EB8:
	ld h,001h		;9eb8
	call velocidad_x_h		;9eba   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	ld de,0898bh		;9ebd
	call fotograma_por_sentido		;9ec0   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
	ld (ix+011h),020h		;9ec3   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	ld (ix+01fh),030h		;9ec7
	ret			;9ecb
L_9ECC:
	ld b,(ix+001h)		;9ecc   ; lee el paso del actor
	djnz L_9EF3		;9ecf
	dec (ix+01fh)		;9ed1
	ret nz			;9ed4
	ld a,(ix+01eh)		;9ed5
	ld (ix+00ah),a		;9ed8   ; guarda la velocidad X del actor (alta)
	call estado_del_que_se_lleva		;9edb   ; estado_del_que_se_lleva: A = el estado del personaje que se lleva
	ld c,030h		;9ede
	bit 1,a		;9ee0
	jr z,L_9EEC		;9ee2
	ld c,015h		;9ee4
	cp 002h		;9ee6
	jr z,L_9EEC		;9ee8
	ld c,060h		;9eea
L_9EEC:
	ld (ix+01fh),c		;9eec
	dec (ix+001h)		;9eef   ; baja el paso del actor
	ret			;9ef2
L_9EF3:
	djnz L_9F18		;9ef3
	inc (ix+001h)		;9ef5   ; sube el paso del actor
L_9EF8:
	ld h,0fch		;9ef8
	call velocidad_y_h		;9efa   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	ld (ix+010h),08fh		;9efd   ; el fotograma del actor (p02:8A42) = 0x8F
	ld (ix+00ch),040h		;9f01   ; la aceleracion Y del actor = 0x40
	ld (ix+00bh),001h		;9f05   ; si el actor acelera (p02:8393) = 0x01
	ld a,(0c246h)		;9f09   ; lee la X del personaje
	cp (ix+005h)		;9f0c   ; compara con la X del actor
	ld h,002h		;9f0f
	jr nc,L_9F15		;9f11
	ld h,0feh		;9f13
L_9F15:
	jp velocidad_x_h		;9f15   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
L_9F18:
	djnz L_9F37		;9f18
	ld a,(ix+008h)		;9f1a   ; lee la velocidad Y del actor (alta)
	cp 080h		;9f1d
	jr nc,L_9F25		;9f1f
	ld (ix+010h),08fh		;9f21   ; el fotograma del actor (p02:8A42) = 0x8F
L_9F25:
	ld e,(ix+008h)		;9f25   ; lee la velocidad Y del actor (alta)
	ld d,000h		;9f28
	ld a,040h		;9f2a
	call mira_alrededor		;9f2c   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	ld a,(ix+016h)		;9f2f
	and 004h		;9f32
	ret z			;9f34
	jr L_9EF8		;9f35
L_9F37:
	call mira_al_personaje_89		;9f37   ; mira_al_personaje_89: cada 8 cuadros, (ix+0x10) = 0x89-0x8C segun el lado del personaje
	call ataca		;9f3a   ; ataca: (ix+0x1F) - 1; a cero, el fotograma de ataque y se lanza hacia el personaje
	ret z			;9f3d
	call choque_4		;9f3e   ; choque_4: p02:9D09 con E = 4
	jr z,L_9F4C		;9f41
	call choque_lateral		;9f43   ; choque_lateral: la casilla de delante del actor segun su sentido (p02:8BB7)
	jr nz,L_9F4C		;9f46
	dec (ix+011h)		;9f48   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9f4b
L_9F4C:
	ld (ix+011h),020h		;9f4c   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	jp invierte_velocidad_x		;9f50   ; invierte_velocidad_x: la velocidad X del actor, al reves (p02:8B0D con A = 0x0A): rebota
mira_al_personaje_89:		; cada 8 cuadros, (ix+0x10) = 0x89-0x8C segun el lado del personaje
	ld a,(0c00dh)		;9f53   ; lee la cuenta de cuadros del juego
	and 007h		;9f56
	ret nz			;9f58
	ld a,(0c246h)		;9f59   ; lee la X del personaje
	cp (ix+005h)		;9f5c   ; compara con la X del actor
	ld c,089h		;9f5f
	jr nc,L_9F65		;9f61
	ld c,08bh		;9f63
L_9F65:
	ld a,(0c00dh)		;9f65   ; lee la cuenta de cuadros del juego
	and 008h		;9f68
	jr z,L_9F6D		;9f6a
	inc c			;9f6c
L_9F6D:
	ld (ix+010h),c		;9f6d   ; guarda el fotograma del actor (p02:8A42)
	ret			;9f70
ataca:		; (ix+0x1F) - 1; a cero, el fotograma de ataque y se lanza hacia el personaje
	dec (ix+01fh)		;9f71
	ret nz			;9f74
	ld a,(0c246h)		;9f75   ; lee la X del personaje
	cp (ix+005h)		;9f78   ; compara con la X del actor
	ld c,08dh		;9f7b
	jr nc,L_9F81		;9f7d
	ld c,08eh		;9f7f
L_9F81:
	ld (ix+010h),c		;9f81   ; guarda el fotograma del actor (p02:8A42)
	ld a,(ix+00ah)		;9f84   ; lee la velocidad X del actor (alta)
	ld (ix+01eh),a		;9f87
	call velocidad_x_l		;9f8a   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	inc (ix+001h)		;9f8d   ; sube el paso del actor
	ld (ix+01fh),010h		;9f90
	ld a,(0c246h)		;9f94   ; lee la X del personaje
	cp (ix+005h)		;9f97   ; compara con la X del actor
	ld a,002h		;9f9a
	jr nc,L_9FA0		;9f9c
	neg		;9f9e
L_9FA0:
	ld d,(ix+005h)		;9fa0   ; lee la X del actor
	ld a,(ix+003h)		;9fa3   ; lee la Y del actor
	sub 008h		;9fa6
	ld e,a			;9fa8
	ld c,018h		;9fa9
	push ix		;9fab
	call crea_actor_0		;9fad   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;9fb0
	xor a			;9fb2
	ret			;9fb3
L_9FB4:
	ld (ix+010h),051h		;9fb4   ; el fotograma del actor (p02:8A42) = 0x51
	ld (ix+011h),020h		;9fb8   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	ld h,001h		;9fbc
	call velocidad_x_h		;9fbe   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	ret			;9fc1
L_9FC2:
	ld a,(ix+001h)		;9fc2   ; lee el paso del actor
	and a			;9fc5
	jr nz,$+78		;9fc6
	call 0a005h		;9fc8   ; choca_o_cuenta: el sonido 0x0A si choca de lado o si (ix+0x11) & 15 es cero
	ld de,05153h		;9fcb
	call fotograma_por_sentido		;9fce   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
	dec (ix+011h)		;9fd1   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;9fd4
	ld a,(0c244h)		;9fd5   ; lee la Y del personaje
	sub (ix+003h)		;9fd8   ; le resta la Y del actor
	add a,008h		;9fdb
	cp 010h		;9fdd
	jr c,$+33		;9fdf
	ld h,0fch		;9fe1
	call velocidad_y_h		;9fe3   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	ld (ix+00bh),001h		;9fe6   ; si el actor acelera (p02:8393) = 0x01
	ld (ix+00ch),040h		;9fea   ; la aceleracion Y del actor = 0x40
	ld a,(0c246h)		;9fee   ; lee la X del personaje
	cp (ix+005h)		;9ff1   ; compara con la X del actor
	ld h,0feh		;9ff4
	jr c,L_9FFA		;9ff6
	ld h,002h		;9ff8
L_9FFA:
	inc (ix+001h)		;9ffa   ; sube el paso del actor
	jp velocidad_x_h		;9ffd   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
