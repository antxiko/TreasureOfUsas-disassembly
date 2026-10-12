; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 06 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ======================================================================
; CODIGO 0xa000..0xa173  (371 bytes)
; ======================================================================


L_A000:
	jr c,L_A01E		;a000
	call mando_del_final		;a002   ; mando_del_final: las teclas del final: cambia de personaje (0xC228/0xC229)
	call cursor_del_final		;a005   ; cursor_del_final: los sprites del cursor segun 0xC228
	call compra		;a008   ; compra: con la tecla 0x10: compara el precio con 0xC259 (DCOMPR)
	ld a,(0de80h)		;a00b   ; lee variable de trabajo del banco 0
	and a			;a00e
	jp z,05690h		;a00f   ; atributos_a_vram: 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
	call 09f88h		;a012   ; cifras_c2b9: las cifras de 0xC2B9 de los dos personajes
	call 04797h		;a015
	call 09fbch		;a018   ; marcadores_del_final: los numeros de las fichas de los dos personajes
	jp 05690h		;a01b   ; atributos_a_vram: 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
L_A01E:
	ld b,002h		;a01e
	ld hl,0c2b0h		;a020   ; apunta a la ficha del personaje 0 (14 bytes)
L_A023:
	push hl			;a023
	push bc			;a024
	ld d,h			;a025
	ld e,l			;a026
	ld a,010h		;a027
	call 04083h		;a029   ; hl_mas_a: HL = HL + A
	ld bc,00010h		;a02c
	ldir		;a02f
	pop bc			;a031
	pop hl			;a032
	ld a,020h		;a033
	call 04083h		;a035   ; hl_mas_a: HL = HL + A
	djnz L_A023		;a038
	ld hl,(0c22bh)		;a03a
	ld (0c259h),hl		;a03d   ; guarda las monedas (16 bits) y el byte siguiente (16 bits)
	call 09f88h		;a040   ; cifras_c2b9: las cifras de 0xC2B9 de los dos personajes
	call 04797h		;a043
	jp 09fbch		;a046   ; marcadores_del_final: los numeros de las fichas de los dos personajes
mando_del_final:		; las teclas del final: cambia de personaje (0xC228/0xC229)
	ld hl,0c228h		;a049   ; apunta a la opcion del final
	ld de,0c229h		;a04c   ; apunta a el personaje del final
	ld a,(0c006h)		;a04f   ; lee las teclas nuevas
	rra			;a052
	jr c,L_A086		;a053
	rra			;a055
	jr c,L_A07C		;a056
	rra			;a058
	jr c,L_A05D		;a059
	rra			;a05b
	ret nc			;a05c
L_A05D:
	ld a,(0c2b0h)		;a05d   ; lee la ficha del personaje 0 (14 bytes)
	ld b,a			;a060
	ld a,(0c2d0h)		;a061   ; lee la ficha del personaje 1 (14 bytes)
	or b			;a064
	jr z,L_A070		;a065
	ld a,b			;a067
	and a			;a068
	ld a,001h		;a069
	jr nz,L_A06E		;a06b
	xor a			;a06d
L_A06E:
	ld (de),a			;a06e
	ret			;a06f
L_A070:
	ld a,(de)			;a070
	xor 001h		;a071
	ld (de),a			;a073
	ld a,(0c000h)		;a074   ; lee el estado del juego
	cp 00bh		;a077
	jr nz,L_A08D		;a079
	ret			;a07b
L_A07C:
	inc (hl)			;a07c   ; la opcion siguiente de 0 a 2
	ld a,(hl)			;a07d
	cp 003h		;a07e
	jr c,L_A08D		;a080
	ld (hl),000h		;a082
	jr L_A08D		;a084
L_A086:
	dec (hl)			;a086
	ld a,(hl)			;a087
	rla			;a088
	jr nc,L_A08D		;a089
	ld (hl),002h		;a08b
L_A08D:
	ld a,(0c000h)		;a08d   ; lee el estado del juego
	cp 00bh		;a090
	ld a,001h		;a092
	jr nz,L_A098		;a094
	ld a,070h		;a096
L_A098:
	jp 05451h		;a098
cursor_del_final:		; los sprites del cursor segun 0xC228
	ld a,(0c228h)		;a09b   ; lee la opcion del final
	ld hl,0de00h		;a09e   ; apunta a los atributos de los sprites en RAM
	ld de,0de04h		;a0a1   ; apunta a la Y del sprite 1 en RAM
	ld c,a			;a0a4
	add a,a			;a0a5
	add a,a			;a0a6
	add a,a			;a0a7
	ld b,a			;a0a8
	add a,a			;a0a9
	add a,b			;a0aa
	add a,c			;a0ab
	add a,072h		;a0ac
	ld (hl),a			;a0ae
	ld (de),a			;a0af
	inc l			;a0b0
	inc e			;a0b1
	call estado_11		;a0b2   ; estado_11: en el estado 0x0B, 0xC229 = el personaje que se lleva
	ld a,(0c229h)		;a0b5   ; lee el personaje del final
	and a			;a0b8
	ld a,043h		;a0b9
	jr z,L_A0BF		;a0bb
	ld a,0c3h		;a0bd
L_A0BF:
	ld (hl),a			;a0bf
	add a,010h		;a0c0
	ld (de),a			;a0c2
	inc l			;a0c3
	inc e			;a0c4
	ld (hl),000h		;a0c5
	ex de,hl			;a0c7
	ld (hl),004h		;a0c8
	ld hl,0dc00h		;a0ca   ; apunta a los colores de los sprites en RAM (16 por sprite)
	ld de,0dc01h		;a0cd
	ld bc,0001fh		;a0d0
	ld (hl),00ah		;a0d3
	ldir		;a0d5
	ld a,0d8h		;a0d7
	ld (0de08h),a		;a0d9   ; guarda la Y del sprite 2 en RAM
	ret			;a0dc
estado_11:		; en el estado 0x0B, 0xC229 = el personaje que se lleva
	ld a,(0c000h)		;a0dd   ; lee el estado del juego
	cp 00bh		;a0e0
	ret nz			;a0e2
	ld a,(0c240h)		;a0e3   ; lee el personaje que se lleva (0 o 1)
	ld (0c229h),a		;a0e6   ; guarda el personaje del final
	ret			;a0e9
compra:		; con la tecla 0x10: compara el precio con 0xC259 (DCOMPR)
	xor a			;a0ea
	ld (0de80h),a		;a0eb   ; guarda variable de trabajo del banco 0
	ld a,(0c006h)		;a0ee   ; lee las teclas nuevas
	and 010h		;a0f1
	ret z			;a0f3
	ld a,(0c228h)		;a0f4   ; lee la opcion del final
	add a,a			;a0f7
	add a,008h		;a0f8
	ld b,a			;a0fa
	call byte_de_ficha		;a0fb   ; byte_de_ficha: HL = la ficha del personaje 0xC229 + B
	ld (0de81h),hl		;a0fe
	ld e,(hl)			;a101
	inc l			;a102
	ld d,(hl)			;a103
	ld hl,(0c259h)		;a104   ; lee las monedas (16 bits) y el byte siguiente (16 bits)
	call 00020h		;a107   ; BIOS DCOMPR - Compares HL with DE
	ret c			;a10a
	ld a,(0c228h)		;a10b   ; lee la opcion del final
	ld bc,00104h		;a10e
	dec a			;a111
	jr z,L_A11F		;a112
	inc b			;a114
	ld c,002h		;a115
	dec a			;a117
	jr z,L_A11F		;a118
	inc b			;a11a
	inc b			;a11b
	inc b			;a11c
	ld c,03fh		;a11d
L_A11F:
	call byte_de_ficha		;a11f   ; el byte B de la ficha: si ya llega a C, nada
	ld a,(hl)			;a122
	cp c			;a123
	ret nc			;a124
	inc (hl)			;a125   ; uno mas; el byte 5 (la vida) sube de 4 en 4
	ld a,l			;a126
	and 00fh		;a127
	cp 005h		;a129
	jr nz,L_A132		;a12b
	inc (hl)			;a12d
	inc (hl)			;a12e
	inc (hl)			;a12f
	jr L_A142		;a130
L_A132:
	push de			;a132   ; el precio DE se dobla en BCD (add a,a / daa) y se guarda en 0xDE81
	ld a,e			;a133   ; E * 2 en BCD (daa)
	add a,a			;a134
	daa			;a135
	ld e,a			;a136
	ld a,d			;a137   ; D * 2 con el acarreo, en BCD
	adc a,a			;a138
	daa			;a139
	ld d,a			;a13a
	ld hl,(0de81h)		;a13b   ; el nuevo precio a (0xDE81)
	ld (hl),e			;a13e
	inc l			;a13f
	ld (hl),d			;a140
	pop de			;a141
L_A142:
	ld hl,(0c259h)		;a142   ; lee las monedas (16 bits) y el byte siguiente (16 bits)
	ld a,l			;a145
	sub e			;a146
	daa			;a147
	ld l,a			;a148
	ld a,h			;a149
	sbc a,d			;a14a
	daa			;a14b
	ld h,a			;a14c
	ld (0c259h),hl		;a14d   ; guarda las monedas (16 bits) y el byte siguiente (16 bits)
	ld a,001h		;a150
	ld (0de80h),a		;a152   ; guarda variable de trabajo del banco 0
	ld a,(0c000h)		;a155   ; lee el estado del juego
	cp 00bh		;a158
	ld a,002h		;a15a
	jr nz,L_A160		;a15c
	ld a,071h		;a15e
L_A160:
	jp 05451h		;a160
byte_de_ficha:		; HL = la ficha del personaje 0xC229 + B
	ld a,(0c229h)		;a163   ; lee el personaje del final
	and a			;a166
	ld hl,0c2b0h		;a167   ; apunta a la ficha del personaje 0 (14 bytes)
	jr z,L_A16F		;a16a
	ld hl,0c2d0h		;a16c   ; apunta a la ficha del personaje 1 (14 bytes)
L_A16F:
	ld a,b			;a16f
	jp 04083h		;a170   ; hl_mas_a: HL = HL + A

; ----------------------------------------------------------------------
; DATOS texto_p9EF2: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p05:9EF2 (141 bytes)
;   0xa173..0xa200  (141 bytes)
DATA_texto_p9EF2:
	defb 054h,018h,033h,038h,030h,039h,03ch,037h,02bh,03eh,033h,039h,038h,0feh,018h,0c0h	; a173  T.3809<7+>398...
	defb 02dh,039h,033h,038h,0feh,010h,067h,040h,033h,03eh,0feh,010h,080h,03dh,03ah,02eh	; a183  -938..g@3>...=:.
	defb 0feh,010h,099h,034h,037h,03ah,0feh,090h,067h,040h,033h,03eh,0feh,090h,080h,03dh	; a193  ...47:..g@3>...=
	defb 03ah,02eh,0feh,090h,099h,034h,037h,03ah,0feh,00ch,073h,03ch,02bh,03eh,02fh,0feh	; a1a3  :....47:..s<+>/.
	defb 00ch,08ch,03ch,02bh,03eh,02fh,0feh,00ch,0a5h,03ch,02bh,03eh,02fh,0feh,08ch,073h	; a1b3  ..<+>/...<+>/..s
	defb 03ch,02bh,03eh,02fh,0feh,08ch,08ch,03ch,02bh,03eh,02fh,0feh,08ch,0a5h,03ch,02bh	; a1c3  <+>/...<+>/...<+
	defb 03eh,02fh,0feh,034h,020h,041h,033h,03eh,0feh,0b0h,020h,02dh,036h,02fh,03dh,0feh	; a1d3  >/.4 A3>.. -6/=.
	defb 090h,0b8h,030h,022h,020h,07dh,07dh,07dh,020h,02fh,038h,02eh,0feh,090h,0c4h,030h	; a1e3  ..0" }}} /8....0
	defb 023h,020h,07dh,07dh,07dh,020h,02dh,02bh,038h,02dh,02fh,036h,0ffh	; a1f3  # }}} -+8-/6.

; ----------------------------------------------------------------------
; DATOS lineas_p9F82: lineas [X][Y][largo] hasta 0xFF (p00:55CE verticales con
;   L_4B0C, p00:55D1 horizontales con L_4AD4); lo leen p05:9F82 (31 bytes)
;   0xa200..0xa21f  (31 bytes)
DATA_lineas_p9F82:
	defb 007h,072h,072h	; a200
	defb 007h,07ch,072h	; a203
	defb 007h,08bh,072h	; a206
	defb 007h,095h,072h	; a209
	defb 007h,0a4h,072h	; a20c
	defb 087h,072h,072h	; a20f
	defb 087h,07ch,072h	; a212
	defb 087h,08bh,072h	; a215
	defb 087h,095h,072h	; a218
	defb 087h,0a4h,072h	; a21b
	defb 0ffh	; a21e

; ----------------------------------------------------------------------
; DATOS lineas_p9F7C: lineas [X][Y][largo] hasta 0xFF (p00:55CE verticales con
;   L_4B0C, p00:55D1 horizontales con L_4AD4); lo leen p05:9F7C (7 bytes)
;   0xa21f..0xa226  (7 bytes)
DATA_lineas_p9F7C:
	defb 02fh,063h,04ch	; a21f
	defb 0afh,063h,04ch	; a222
	defb 0ffh	; a225

; ----------------------------------------------------------------------
; DATOS patrones_p9EEC: [direccion de VRAM] y RLE de patrones de sprite
;   (p00:4926); lo leen p05:9EEC (35 bytes)
;   0xa226..0xa249  (35 bytes)
DATA_patrones_p9EEC:
	defb 000h,0f8h,081h,0ffh,007h,080h,081h,0ffh,007h,000h,081h,0ffh,007h,000h,081h,0ffh	; a226  ................
	defb 007h,000h,081h,0ffh,007h,000h,081h,0ffh,007h,000h,081h,0ffh,007h,001h,081h,0ffh	; a236  ................
	defb 007h,000h,000h	; a246

; ======================================================================
; CODIGO 0xa249..0xa270  (39 bytes)
; ======================================================================


L_A249:
	ld hl,0a2b9h		;a249
	ld a,(0c21dh)		;a24c   ; lee la ruina (0-4)
	call 0543ah		;a24f   ; palabra_a: HL = la palabra A de la tabla HL
	ld d,(hl)			;a252
	ld e,0b0h		;a253
	ld (0c8a7h),de		;a255   ; guarda el principio de la linea del texto a maquina y el byte siguiente (16 bits)
	ld (0c8a3h),de		;a259   ; guarda la posicion del texto a maquina y el byte siguiente (16 bits)
	inc hl			;a25d
	ld (0c8a1h),hl		;a25e   ; guarda el puntero del texto a maquina y el byte siguiente (16 bits)
	ld a,03ch		;a261
	ld (0c8a5h),a		;a263   ; guarda la espera hasta la siguiente letra
	xor a			;a266
	ld (0c8a6h),a		;a267   ; guarda el texto a maquina ha acabado
	ld hl,0a270h		;a26a
	jp 04d4ah		;a26d   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba

; ----------------------------------------------------------------------
; DATOS texto_pA26A: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:A26A (10 bytes)
;   0xa270..0xa27a  (10 bytes)
DATA_texto_pA26A:
	defb 040h,0a4h,035h,02fh,043h,041h,039h,03ch,02eh,0ffh	; a270  @.5/CA9<..

; ----------------------------------------------------------------------
; DATOS texto_pA324: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:A324 (16 bytes)
;   0xa27a..0xa28a  (16 bytes)
DATA_texto_pA324:
	defb 048h,0a8h,033h,038h,03ah,03fh,03eh,020h,035h,02fh,043h,041h,039h,03ch,02eh,0ffh	; a27a  H.38:?> 5/CA9<..

; ======================================================================
; CODIGO 0xa28a..0xa2bb  (49 bytes)
; ======================================================================


L_A28A:
	ld a,(0c8a6h)		;a28a   ; lee el texto a maquina ha acabado
	and a			;a28d
	ret nz			;a28e
	ld hl,0c8a5h		;a28f   ; apunta a la espera hasta la siguiente letra
	dec (hl)			;a292
	ret nz			;a293
	ld hl,(0c8a1h)		;a294   ; lee el puntero del texto a maquina y el byte siguiente (16 bits)
	ld a,(hl)			;a297
	inc hl			;a298
	ld (0c8a1h),hl		;a299   ; guarda el puntero del texto a maquina y el byte siguiente (16 bits)
	ld b,a			;a29c
	inc a			;a29d
	jr z,L_A2B5		;a29e
	ld a,b			;a2a0
	ld de,(0c8a3h)		;a2a1   ; lee la posicion del texto a maquina y el byte siguiente (16 bits)
	call 04d86h		;a2a5   ; caracter_de_la_fuente: el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
	call 04e3fh		;a2a8   ; avanza_ocho: D + 8, y E + 8 si D da la vuelta
	ld (0c8a3h),de		;a2ab   ; guarda la posicion del texto a maquina y el byte siguiente (16 bits)
	ld a,008h		;a2af
	ld (0c8a5h),a		;a2b1   ; guarda la espera hasta la siguiente letra
	ret			;a2b4
L_A2B5:
	ld a,001h		;a2b5
	ld (0c8a6h),a		;a2b7   ; guarda el texto a maquina ha acabado
	ret			;a2ba

; ----------------------------------------------------------------------
; DATOS nombres_de_ruina: 4 palabras: el nombre de las ruinas 1-4 (p06:A249:
;   p06:A2B9[0xC21D]; p06:A35D: p06:A2BB[4 - B]); lo leen p06:A249 (8 bytes)
;   0xa2bb..0xa2c3  (8 bytes)
DATA_nombres_de_ruina:
	defb 0c3h,0a2h	; a2bb
	defb 0cfh,0a2h	; a2bd
	defb 0deh,0a2h	; a2bf
	defb 0eeh,0a2h	; a2c1

; ----------------------------------------------------------------------
; DATOS nombre_ruina_1: [X] y el nombre hasta 0xFF; p06:A385 lo compara con
;   0xE360; lo leen p06:A249 (12 bytes)
;   0xa2c3..0xa2cf  (12 bytes)
DATA_nombre_ruina_1:
	defb 058h,034h,03fh,02ch,02bh,020h,03ch,03fh,033h,038h,03dh,0ffh	; a2c3  X4?,+ <?38=.

; ----------------------------------------------------------------------
; DATOS nombre_ruina_2: [X] y el nombre hasta 0xFF; p06:A385 lo compara con
;   0xE360; lo leen p06:A249 (15 bytes)
;   0xa2cf..0xa2de  (15 bytes)
DATA_nombre_ruina_2:
	defb 048h,032h,02bh,03ch,02bh,03ah,03ah,02bh,020h,03ch,03fh,033h,038h,03dh,0ffh	; a2cf  H2+<+::+ <?38=.

; ----------------------------------------------------------------------
; DATOS nombre_ruina_3: [X] y el nombre hasta 0xFF; p06:A385 lo compara con
;   0xE360; lo leen p06:A249 (16 bytes)
;   0xa2de..0xa2ee  (16 bytes)
DATA_nombre_ruina_3:
	defb 048h,031h,02bh,038h,02eh,032h,02bh,03ch,02bh,020h,03ch,03fh,033h,038h,03dh,0ffh	; a2de  H1+8.2+<+ <?38=.

; ----------------------------------------------------------------------
; DATOS nombre_ruina_4: [X] y el nombre hasta 0xFF; p06:A385 lo compara con
;   0xE360; lo leen p06:A249 (14 bytes)
;   0xa2ee..0xa2fc  (14 bytes)
DATA_nombre_ruina_4:
	defb 050h,037h,039h,032h,02fh,038h,034h,039h,020h,02eh,02bh,03ch,039h,0ffh	; a2ee  P792/849 .+<9.

; ======================================================================
; CODIGO 0xa2fc..0xa3c8  (204 bytes)
; ======================================================================


L_A2FC:
	ld hl,0e360h		;a2fc
	ld bc,0001fh		;a2ff
	call 05f08h		;a302   ; borra: pone a cero BC + 1 bytes desde HL
	ld hl,040a0h		;a305
	ld bc,08040h		;a308
	ld a,066h		;a30b
	ld d,000h		;a30d
	call 04ba2h		;a30f   ; rellena_rectangulo: HMMV (0xC0): rectangulo B x C en (H, L) de la pagina D con el color A
	ld hl,03ca0h		;a312
	ld de,08828h		;a315
	ld c,00dh		;a318
	call 04b74h		;a31a   ; rectangulo: los cuatro lados de un rectangulo (p00:4B8E y p00:4B98)
	xor a			;a31d
	ld (0c20eh),a		;a31e
	ld (0c20fh),a		;a321
	ld hl,0a27ah		;a324
	jp 04d4ah		;a327   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
L_A32A:
	call lee_teclado		;a32a   ; lo tecleado (p06:A392): si no hay tecla nueva, nada
	ld a,(0c20fh)		;a32d
	and a			;a330
	ret z			;a331
	ld b,a			;a332
	ld de,0e378h		;a333   ; la tecla al final de lo escrito en 0xE360 (0xE378 cuenta las letras) y 0xFF detras
	ld a,(de)			;a336
	ld hl,0e360h		;a337
	call 04083h		;a33a   ; hl_mas_a: HL = HL + A
	ld a,b			;a33d
	ld (hl),a			;a33e
	inc l			;a33f
	ld (hl),0ffh		;a340
	push de			;a342
	push bc			;a343
	ld hl,0e360h		;a344   ; lo escrito en (0xB8, 0x48)
	ld de,048b8h		;a347
	ld c,0ffh		;a34a
	call 04d54h		;a34c
	pop bc			;a34f
	pop de			;a350
	inc b			;a351   ; con la tecla 0xFF (p06:A35B), se compara; si no, una letra mas hasta 0x0E
	jr z,L_A35B		;a352
	ex de,hl			;a354
	ld a,(hl)			;a355
	cp 00eh		;a356
	ret nc			;a358
	inc (hl)			;a359
	ret			;a35a
L_A35B:
	ld b,004h		;a35b
L_A35D:
	ld hl,0a2bbh		;a35d
	ld a,b			;a360
	sub 004h		;a361
	neg		;a363
	call 0543ah		;a365   ; palabra_a: HL = la palabra A de la tabla HL
	inc hl			;a368
	push bc			;a369
	call compara_con_e360		;a36a   ; compara_con_e360: compara (HL) con 0xE360 hasta 0xFF; Z si son iguales
	pop bc			;a36d
	jr z,L_A37B		;a36e
	djnz L_A35D		;a370
	ld a,001h		;a372
	ld (0e37ah),a		;a374
	ld (0e379h),a		;a377
	ret			;a37a
L_A37B:
	ld a,b			;a37b   ; 4 - B + 1: la ruina cuyo nombre coincide, a 0xE379
	sub 004h		;a37c
	neg		;a37e
	inc a			;a380
	ld (0e379h),a		;a381
	ret			;a384
compara_con_e360:		; compara (HL) con 0xE360 hasta 0xFF; Z si son iguales
	ld de,0e360h		;a385
L_A388:
	ld a,(de)			;a388   ; compara byte a byte hasta el 0xFF
	cp (hl)			;a389
	ret nz			;a38a
	ld a,(hl)			;a38b
	inc a			;a38c
	ret z			;a38d
	inc hl			;a38e
	inc de			;a38f
	jr L_A388		;a390
lee_teclado:		; las 9 filas de la matriz (SNSMAT); la primera tecla pulsada, por p06:A3C8
	ld b,009h		;a392
	ld e,000h		;a394
L_A396:
	ld a,e			;a396   ; cada fila de la matriz (SNSMAT): la primera con alguna tecla
	call 00141h		;a397   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;a39a
	and a			;a39b
	jr nz,L_A3A9		;a39c
	inc e			;a39e
	djnz L_A396		;a39f
	xor a			;a3a1   ; ninguna: 0xC20E y 0xC20F a cero
	ld hl,0c20eh		;a3a2
	ld (hl),a			;a3a5
	inc hl			;a3a6
	ld (hl),a			;a3a7
	ret			;a3a8
L_A3A9:
	ld b,a			;a3a9
	ld hl,0a3c8h		;a3aa
	ld a,e			;a3ad
	add a,a			;a3ae
	add a,a			;a3af
	add a,a			;a3b0
	call 04083h		;a3b1   ; hl_mas_a: HL = HL + A
	ld a,b			;a3b4
L_A3B5:
	rra			;a3b5
	jr c,L_A3BB		;a3b6
	inc hl			;a3b8
	jr L_A3B5		;a3b9
L_A3BB:
	ld a,(hl)			;a3bb   ; la tecla nueva: la de ahora y no la de antes, en 0xC20F
	and a			;a3bc
	ret z			;a3bd
	ld hl,0c20eh		;a3be   ; C = las teclas de antes; (0xC20E) = las de ahora
	ld c,(hl)			;a3c1
	ld (hl),a			;a3c2
	xor c			;a3c3   ; las nuevas a 0xC20F
	and (hl)			;a3c4
	inc hl			;a3c5
	ld (hl),a			;a3c6
	ret			;a3c7

; ----------------------------------------------------------------------
; DATOS teclado: 9 filas x 8 teclas: el caracter de cada tecla de la matriz
;   (p06:A3AA: fila de SNSMAT * 8 + bit); lo leen p06:A3A9 (72 bytes)
;   0xa3c8..0xa410  (72 bytes)
DATA_teclado:
	defb 021h,022h,023h,024h,025h,026h,027h,028h	; a3c8  !"#$%&'(
	defb 029h,02ah,047h,07dh,000h,000h,000h,000h	; a3d0  )*G}....
	defb 000h,000h,000h,000h,000h,000h,02bh,02ch	; a3d8  ......+,
	defb 02dh,02eh,02fh,030h,031h,032h,033h,034h	; a3e0  -./01234
	defb 035h,036h,037h,038h,039h,03ah,03bh,03ch	; a3e8  56789:.<
	defb 03dh,03eh,03fh,040h,041h,042h,043h,044h	; a3f0  =>?@ABCD
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; a3f8  ........
	defb 000h,000h,000h,000h,000h,000h,000h,0ffh	; a400  ........
	defb 020h,000h,000h,000h,000h,000h,000h,000h	; a408   .......

; ======================================================================
; CODIGO 0xa410..0xa60a  (506 bytes)
; ======================================================================


L_A410:
	ld a,(0cc13h)		;a410   ; lee la X en la antesala
	sub 018h		;a413
	ld h,a			;a415
	ld l,093h		;a416
	ld de,06078h		;a418
	ld bc,02008h		;a41b
	ld a,004h		;a41e
	call 04bdeh		;a420   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	ld hl,0101ch		;a423
	ld bc,0e06eh		;a426
	call 05e2fh		;a429   ; borra_rectangulo: HMMV con 0xFF en la pagina 0
	call lista_a7f8		;a42c   ; lista_a7f8: la lista de fichas p06:A7F8
	ld hl,00e1ah		;a42f
	ld de,0e472h		;a432
	call rectangulo_guardando		;a435   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	inc h			;a438
	inc l			;a439
	ld de,0e270h		;a43a
	call rectangulo_guardando		;a43d   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	call recuadros_del_final		;a440   ; recuadros_del_final: los recuadros y lineas de p06:A7B4/A7BB
	ld hl,0a60ah		;a443
	call 04d4ah		;a446   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	xor a			;a449
	ld (0c23bh),a		;a44a
	ld (0c8a0h),a		;a44d   ; guarda el texto a maquina en marcha
	call paleta_b351		;a450   ; paleta_b351: la paleta p06:B351
	call retratos		;a453   ; retratos: los retratos de los dos personajes segun su estado (p06:A644/A64C)
	call numeros_de_las_fichas		;a456   ; numeros_de_las_fichas: los numeros de las fichas de los dos personajes
	jp L_A5CD		;a459
lista_a7f8:		; la lista de fichas p06:A7F8
	ld hl,0a7f8h		;a45c
	ld de,0a7e4h		;a45f
	jp 0529ch		;a462   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
paleta_b351:		; la paleta p06:B351
	ld hl,0b351h		;a465
	jp 04a9dh		;a468   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
recuadros_del_final:		; los recuadros y lineas de p06:A7B4/A7BB
	call recuadros_2		;a46b   ; recuadros_2: dos recuadros de 0x32 x 0x32
	ld hl,01460h		;a46e
	ld de,06825h		;a471
	call rectangulo_guardando		;a474   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	ld h,084h		;a477
	call rectangulo_guardando		;a479   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	ld hl,0a7b4h		;a47c
	call 055ceh		;a47f   ; lineas_verticales: lineas [X][Y][largo] de HL hasta 0xFF (p00:4B0C)
	ld hl,0a7bbh		;a482
	jp 055d1h		;a485   ; lineas_horizontales: lineas [X][Y][largo] de HL hasta 0xFF (p00:4AD4)
recuadros_2:		; dos recuadros de 0x32 x 0x32
	ld hl,0172bh		;a488
	ld de,03232h		;a48b
	call rectangulo_guardando		;a48e   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	ld hl,0b72bh		;a491
rectangulo_guardando:		; p00:4B74 con el color 0x0D sin tocar registros
	push hl			;a494
	push de			;a495
	push bc			;a496
	ld c,00dh		;a497
	call 04b74h		;a499   ; rectangulo: los cuatro lados de un rectangulo (p00:4B8E y p00:4B98)
	pop bc			;a49c
	pop de			;a49d
	pop hl			;a49e
	ret			;a49f
recuadro_parpadea:		; el recuadro del personaje que se lleva, 0x0D o 0x0A cada 16 cuadros
	ld a,(0c240h)		;a4a0   ; lee el personaje que se lleva (0 o 1)
	and a			;a4a3
	ld h,017h		;a4a4
	jr z,L_A4AA		;a4a6
	ld h,0b7h		;a4a8
L_A4AA:
	ld a,(0c003h)		;a4aa   ; lee la cuenta de cuadros
	and 010h		;a4ad
	ld c,00dh		;a4af
	jr z,L_A4B5		;a4b1
	ld c,00ah		;a4b3
L_A4B5:
	ld l,02bh		;a4b5
	ld de,03232h		;a4b7
	jp 04b74h		;a4ba   ; rectangulo: los cuatro lados de un rectangulo (p00:4B8E y p00:4B98)
retratos:		; los retratos de los dos personajes segun su estado (p06:A644/A64C)
	xor a			;a4bd
L_A4BE:
	ld (0de80h),a		;a4be   ; guarda variable de trabajo del banco 0
	ld a,(0c2b6h)		;a4c1   ; lee el estado del personaje 0
	ld hl,0a644h		;a4c4
	call 0543ah		;a4c7   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,(0de80h)		;a4ca   ; lee variable de trabajo del banco 0
	and a			;a4cd
	ld de,0182ch		;a4ce
	jr z,L_A4D5		;a4d1
	ld d,028h		;a4d3
L_A4D5:
	ld a,(0c2b0h)		;a4d5   ; lee la ficha del personaje 0 (14 bytes)
	and a			;a4d8
	call z,retrato		;a4d9   ; retrato: 6 x 6 fichas de HL en (D, E)
	ld a,(0c2d6h)		;a4dc   ; lee el estado del personaje 1
	ld hl,0a64ch		;a4df
	call 0543ah		;a4e2   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,(0de80h)		;a4e5   ; lee variable de trabajo del banco 0
	and a			;a4e8
	ld de,0b82ch		;a4e9
	jr z,L_A4F0		;a4ec
	ld d,0a8h		;a4ee
L_A4F0:
	ld a,(0c2d0h)		;a4f0   ; lee la ficha del personaje 1 (14 bytes)
	and a			;a4f3
	ret nz			;a4f4
retrato:		; 6 x 6 fichas de HL en (D, E)
	ld b,006h		;a4f5
L_A4F7:
	push bc			;a4f7
	push de			;a4f8
	ld b,006h		;a4f9
L_A4FB:
	ld a,(hl)			;a4fb   ; una fila de 6 fichas del retrato
	call 04db4h		;a4fc   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	ld a,d			;a4ff
	add a,008h		;a500
	ld d,a			;a502
	inc hl			;a503
	djnz L_A4FB		;a504
	pop de			;a506
	pop bc			;a507
	ld a,e			;a508   ; la siguiente fila
	add a,008h		;a509
	ld e,a			;a50b
	djnz L_A4F7		;a50c
	ret			;a50e
numeros_de_las_fichas:		; los numeros de las fichas de los dos personajes
	ld hl,0c2b1h		;a50f
	ld de,03c6eh		;a512
	call doce_numeros		;a515   ; doce_numeros: los valores de (HL) en columnas de 12
	ld de,03863h		;a518
	call 04758h		;a51b
	ld hl,0c2d1h		;a51e
	ld de,0ac6eh		;a521
	call doce_numeros		;a524   ; doce_numeros: los valores de (HL) en columnas de 12
	ld de,0a863h		;a527
	jp 04758h		;a52a
doce_numeros:		; los valores de (HL) en columnas de 12
	ld c,00ch		;a52d   ; 12 de separacion entre numeros
	push bc			;a52f
	ld a,(hl)			;a530   ; el primer valor + 1
	inc a			;a531
	push hl			;a532
	push de			;a533
	call numero		;a534   ; numero: un numero (p06:A554)
	pop de			;a537
	pop hl			;a538
	pop bc			;a539
	ld a,e			;a53a
	add a,c			;a53b
	ld e,a			;a53c
	inc l			;a53d   ; el segundo valor + 1
	ld a,(hl)			;a53e
	inc a			;a53f
	push hl			;a540
	call numero		;a541   ; numero: un numero (p06:A554)
	pop hl			;a544
	inc l			;a545   ; 3 bytes mas alla, el siguiente
	inc l			;a546
	inc l			;a547
	ld a,(hl)			;a548
	ret			;a549
numero:		; un numero (p06:A554)
	exx			;a54a
	ld b,00ch		;a54b
	exx			;a54d
	jr L_A554		;a54e
L_A550:
	exx			;a550
	ld b,008h		;a551
	exx			;a553
L_A554:
	ld c,a			;a554   ; los bytes 0 y 1 de la ficha llevan 5 marcas; los demas 3
	ld a,l			;a555
	and 00fh		;a556
	cp 002h		;a558
	ld b,005h		;a55a
	jr c,L_A560		;a55c
	ld b,003h		;a55e
L_A560:
	ld hl,06058h		;a560
L_A563:
	push hl			;a563   ; la marca llena (0x0000) o vacia
	ld a,c			;a564
	and a			;a565
	jr nz,L_A56D		;a566
	ld hl,00000h		;a568
	jr L_A56E		;a56b
L_A56D:
	dec c			;a56d
L_A56E:
	push de			;a56e   ; 8 x 8 de la pagina 1 y la siguiente marca
	push bc			;a56f
	ld bc,00808h		;a570
	call 04841h		;a573   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	pop bc			;a576
	pop de			;a577
	pop hl			;a578
	exx			;a579
	ld a,b			;a57a
	exx			;a57b
	add a,d			;a57c
	ld d,a			;a57d
	djnz L_A563		;a57e
	ret			;a580
L_A581:
	call 05456h		;a581
	call cambia_de_personaje		;a584   ; cambia_de_personaje: con las teclas, 0xC240 cambia si el otro vive
	call recuadro_parpadea		;a587   ; recuadro_parpadea: el recuadro del personaje que se lleva, 0x0D o 0x0A cada 16 cuadros
	ld b,000h		;a58a
	call 047edh		;a58c   ; byte_del_personaje: A = el byte B de la ficha del personaje que se lleva (0xC2B0 + 0xC240 * 32)
	and a			;a58f
	ret nz			;a590
	ld a,(0c006h)		;a591   ; lee las teclas nuevas
	and 010h		;a594
	ret z			;a596
	ld a,001h		;a597
	ld (0c23bh),a		;a599
	ret			;a59c
cambia_de_personaje:		; con las teclas, 0xC240 cambia si el otro vive
	ld hl,0c240h		;a59d   ; apunta a el personaje que se lleva (0 o 1)
	ld a,(0c006h)		;a5a0   ; lee las teclas nuevas
	rra			;a5a3
	rra			;a5a4
	rra			;a5a5
	jr c,L_A5AA		;a5a6
	rra			;a5a8
	ret nc			;a5a9
L_A5AA:
	ld a,(hl)			;a5aa
	xor 001h		;a5ab
	ld (hl),a			;a5ad
	ld a,(0c2b0h)		;a5ae   ; lee la ficha del personaje 0 (14 bytes)
	ld b,a			;a5b1
	ld a,(0c2d0h)		;a5b2   ; lee la ficha del personaje 1 (14 bytes)
	or b			;a5b5
	jr z,L_A5C2		;a5b6
	ld a,b			;a5b8
	and a			;a5b9
	ld a,001h		;a5ba
	jr nz,L_A5BF		;a5bc
	xor a			;a5be
L_A5BF:
	ld (0c240h),a		;a5bf   ; guarda el personaje que se lleva (0 o 1)
L_A5C2:
	call recuadros_2		;a5c2   ; recuadros_2: dos recuadros de 0x32 x 0x32
	ld a,001h		;a5c5
	call 05451h		;a5c7
	jp L_A5CD		;a5ca
L_A5CD:
	ld a,(0cc13h)		;a5cd   ; lee la X en la antesala
	sub 018h		;a5d0
	ld d,a			;a5d2
	ld e,093h		;a5d3
	ld hl,06078h		;a5d5
	ld bc,02008h		;a5d8
	call 04841h		;a5db   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	ld a,(0c240h)		;a5de   ; lee el personaje que se lleva (0 o 1)
	xor 001h		;a5e1
	ld c,a			;a5e3
	ld a,(0c2b0h)		;a5e4   ; lee la ficha del personaje 0 (14 bytes)
	ld b,a			;a5e7
	ld a,(0c2d0h)		;a5e8   ; lee la ficha del personaje 1 (14 bytes)
	or b			;a5eb
	jr z,L_A5F0		;a5ec
	ld c,000h		;a5ee
L_A5F0:
	ld a,c			;a5f0
	add a,a			;a5f1
	add a,a			;a5f2
	add a,a			;a5f3
	add a,a			;a5f4
	ld c,a			;a5f5
	ld a,(0cc13h)		;a5f6   ; lee la X en la antesala
	sub c			;a5f9
	sub 004h		;a5fa
	ld d,a			;a5fc
	ld e,093h		;a5fd
	ld hl,05858h		;a5ff
	ld bc,00808h		;a602
	ld a,048h		;a605
	jp 04c73h		;a607   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)

; ----------------------------------------------------------------------
; DATOS texto_pA443: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:A443 (58 bytes)
;   0xa60a..0xa644  (58 bytes)
DATA_texto_pA443:
	defb 068h,01eh,03dh,02fh,036h,02fh,02dh,03eh,0feh,018h,062h,040h,033h,03eh,0feh,018h	; a60a  h.=/6/->..b@3>..
	defb 06eh,03dh,03ah,02eh,0feh,018h,07ah,034h,037h,03ah,0feh,088h,062h,040h,033h,03eh	; a61a  n=:...z47:..b@3>
	defb 0feh,088h,06eh,03dh,03ah,02eh,0feh,088h,07ah,034h,037h,03ah,0feh,024h,021h,041h	; a62a  ..n=:...z47:.$!A
	defb 033h,03eh,0feh,0c0h,021h,02dh,036h,02fh,03dh,0ffh	; a63a  3>..!-6/=.

; ----------------------------------------------------------------------
; DATOS retratos_A644: 4 palabras: el retrato de 6x6 fichas segun 0xC2B6
;   (0-3); lo leen p06:A4C4 (8 bytes)
;   0xa644..0xa64c  (8 bytes)
DATA_retratos_A644:
	defb 054h,0a6h	; a644
	defb 078h,0a6h	; a646
	defb 09ch,0a6h	; a648
	defb 0c0h,0a6h	; a64a

; ----------------------------------------------------------------------
; DATOS retratos_A64C: 4 palabras: el retrato de 6x6 fichas segun 0xC2D6
;   (0-3); lo leen p06:A4DF (8 bytes)
;   0xa64c..0xa654  (8 bytes)
DATA_retratos_A64C:
	defb 0e4h,0a6h	; a64c
	defb 008h,0a7h	; a64e
	defb 02ch,0a7h	; a650
	defb 050h,0a7h	; a652

; ----------------------------------------------------------------------
; DATOS retrato_A654: 6 x 6 numeros de ficha que p06:A4F5 pinta con L_4DB4; lo
;   leen p06:A4C4 (36 bytes)
;   0xa654..0xa678  (36 bytes)
DATA_retrato_A654:
	defb 000h,070h,060h,053h,052h,000h	; a654
	defb 050h,061h,071h,072h,073h,000h	; a65a
	defb 051h,074h,08ch,08dh,075h,000h	; a660
	defb 000h,076h,08eh,08fh,079h,000h	; a666
	defb 000h,000h,090h,091h,07ch,000h	; a66c
	defb 000h,07dh,07eh,07fh,080h,081h	; a672

; ----------------------------------------------------------------------
; DATOS retrato_A678: 6 x 6 numeros de ficha que p06:A4F5 pinta con L_4DB4; lo
;   leen p06:A4C4 (36 bytes)
;   0xa678..0xa69c  (36 bytes)
DATA_retrato_A678:
	defb 000h,070h,060h,053h,052h,000h	; a678
	defb 050h,061h,071h,072h,073h,000h	; a67e
	defb 051h,074h,0a4h,0a5h,075h,000h	; a684
	defb 000h,076h,077h,078h,079h,000h	; a68a
	defb 000h,000h,07ah,07bh,07ch,000h	; a690
	defb 000h,07dh,07eh,07fh,080h,081h	; a696

; ----------------------------------------------------------------------
; DATOS retrato_A69C: 6 x 6 numeros de ficha que p06:A4F5 pinta con L_4DB4; lo
;   leen p06:A4C4 (36 bytes)
;   0xa69c..0xa6c0  (36 bytes)
DATA_retrato_A69C:
	defb 000h,070h,060h,053h,052h,000h	; a69c
	defb 050h,061h,071h,087h,073h,000h	; a6a2
	defb 051h,082h,0a2h,0a3h,075h,000h	; a6a8
	defb 000h,076h,083h,084h,079h,000h	; a6ae
	defb 000h,000h,085h,086h,07ch,000h	; a6b4
	defb 000h,07dh,07eh,07fh,080h,081h	; a6ba

; ----------------------------------------------------------------------
; DATOS retrato_A6C0: 6 x 6 numeros de ficha que p06:A4F5 pinta con L_4DB4; lo
;   leen p06:A4C4 (36 bytes)
;   0xa6c0..0xa6e4  (36 bytes)
DATA_retrato_A6C0:
	defb 000h,070h,060h,053h,052h,000h	; a6c0
	defb 050h,061h,071h,072h,073h,000h	; a6c6
	defb 051h,082h,0a0h,0a1h,075h,000h	; a6cc
	defb 000h,076h,083h,084h,079h,000h	; a6d2
	defb 000h,000h,085h,086h,07ch,000h	; a6d8
	defb 000h,07dh,07eh,07fh,080h,081h	; a6de

; ----------------------------------------------------------------------
; DATOS retrato_A6E4: 6 x 6 numeros de ficha que p06:A4F5 pinta con L_4DB4; lo
;   leen p06:A4DF (36 bytes)
;   0xa6e4..0xa708  (36 bytes)
DATA_retrato_A6E4:
	defb 000h,003h,004h,018h,017h,000h	; a6e4
	defb 000h,005h,001h,002h,019h,000h	; a6ea
	defb 000h,006h,046h,047h,01ah,000h	; a6f0
	defb 000h,007h,00ch,020h,01bh,000h	; a6f6
	defb 000h,000h,00dh,021h,000h,000h	; a6fc
	defb 030h,031h,048h,049h,033h,032h	; a702

; ----------------------------------------------------------------------
; DATOS retrato_A708: 6 x 6 numeros de ficha que p06:A4F5 pinta con L_4DB4; lo
;   leen p06:A4DF (36 bytes)
;   0xa708..0xa72c  (36 bytes)
DATA_retrato_A708:
	defb 000h,003h,004h,018h,017h,000h	; a708
	defb 000h,005h,001h,002h,019h,000h	; a70e
	defb 000h,006h,040h,041h,01ah,000h	; a714
	defb 000h,007h,008h,01ch,01bh,000h	; a71a
	defb 000h,000h,009h,01dh,000h,000h	; a720
	defb 030h,031h,048h,049h,033h,032h	; a726

; ----------------------------------------------------------------------
; DATOS retrato_A72C: 6 x 6 numeros de ficha que p06:A4F5 pinta con L_4DB4; lo
;   leen p06:A4DF (36 bytes)
;   0xa72c..0xa750  (36 bytes)
DATA_retrato_A72C:
	defb 000h,003h,004h,018h,017h,000h	; a72c
	defb 000h,005h,001h,002h,019h,000h	; a732
	defb 000h,006h,044h,045h,01ah,000h	; a738
	defb 000h,007h,00eh,022h,01bh,000h	; a73e
	defb 000h,000h,00fh,023h,000h,000h	; a744
	defb 030h,031h,048h,049h,033h,032h	; a74a

; ----------------------------------------------------------------------
; DATOS retrato_A750: 6 x 6 numeros de ficha que p06:A4F5 pinta con L_4DB4; lo
;   leen p06:A4DF (36 bytes)
;   0xa750..0xa774  (36 bytes)
DATA_retrato_A750:
	defb 000h,003h,004h,018h,017h,000h	; a750
	defb 000h,005h,001h,002h,019h,000h	; a756
	defb 000h,006h,042h,043h,01ah,000h	; a75c
	defb 000h,007h,00ah,01eh,01bh,000h	; a762
	defb 000h,000h,00bh,01fh,000h,000h	; a768
	defb 030h,031h,048h,049h,033h,032h	; a76e

; ----------------------------------------------------------------------
; DATOS caritas_A774: 2 fases (0xC8AC) x 4 estados (0xC2B6) x 2x2 fichas que
;   p02:81F1 pinta con p06:BA24; lo leen p02:81DB (32 bytes)
;   0xa774..0xa794  (32 bytes)
DATA_caritas_A774:
	defb 08eh,08fh,090h,091h	; a774
	defb 077h,078h,07ah,07bh	; a778
	defb 083h,084h,085h,086h	; a77c
	defb 083h,084h,085h,086h	; a780
	defb 088h,089h,08ah,08bh	; a784
	defb 092h,093h,096h,097h	; a788
	defb 09ah,09bh,09ch,09dh	; a78c
	defb 094h,095h,098h,099h	; a790

; ----------------------------------------------------------------------
; DATOS caritas_A794: 2 fases (0xC8AC) x 4 estados (0xC2D6) x 2x2 fichas que
;   p02:81F1 pinta con p06:BA24; lo leen p02:81E7 (32 bytes)
;   0xa794..0xa7b4  (32 bytes)
DATA_caritas_A794:
	defb 00ch,020h,00dh,021h	; a794
	defb 008h,01ch,009h,01dh	; a798
	defb 00eh,022h,00fh,023h	; a79c
	defb 00ah,01eh,00bh,01fh	; a7a0
	defb 014h,028h,009h,01dh	; a7a4
	defb 010h,024h,011h,025h	; a7a8
	defb 015h,029h,016h,02ah	; a7ac
	defb 012h,026h,013h,027h	; a7b0

; ----------------------------------------------------------------------
; DATOS lineas_A7B4: lineas [X][Y][largo] hasta 0xFF (p00:55CE verticales con
;   L_4B0C, p00:55D1 horizontales con L_4AD4); lo leen p06:A47C (7 bytes)
;   0xa7b4..0xa7bb  (7 bytes)
DATA_lineas_A7B4:
	defb 033h,060h,025h	; a7b4
	defb 0a3h,060h,025h	; a7b7
	defb 0ffh	; a7ba

; ----------------------------------------------------------------------
; DATOS lineas_A7BB: lineas [X][Y][largo] hasta 0xFF (p00:55CE verticales con
;   L_4B0C, p00:55D1 horizontales con L_4AD4); lo leen p06:A482 (13 bytes)
;   0xa7bb..0xa7c8  (13 bytes)
DATA_lineas_A7BB:
	defb 014h,06ch,068h	; a7bb
	defb 014h,078h,068h	; a7be
	defb 084h,06ch,068h	; a7c1
	defb 084h,078h,068h	; a7c4
	defb 0ffh	; a7c7

; ----------------------------------------------------------------------
; DATOS lineas_A7C8: lineas [X][Y][largo] hasta 0xFF (p00:55CE verticales con
;   L_4B0C, p00:55D1 horizontales con L_4AD4); lo leen p02:80E4 (7 bytes)
;   0xa7c8..0xa7cf  (7 bytes)
DATA_lineas_A7C8:
	defb 053h,033h,022h	; a7c8
	defb 0ach,02bh,02ah	; a7cb
	defb 0ffh	; a7ce

; ----------------------------------------------------------------------
; DATOS lineas_A7CF: lineas [X][Y][largo] hasta 0xFF (p00:55CE verticales con
;   L_4B0C, p00:55D1 horizontales con L_4AD4); lo leen p02:80F3 (7 bytes)
;   0xa7cf..0xa7d6  (7 bytes)
DATA_lineas_A7CF:
	defb 04ah,02bh,062h	; a7cf
	defb 053h,054h,05ah	; a7d2
	defb 0ffh	; a7d5

; ----------------------------------------------------------------------
; DATOS lineas_A7D6: lineas [X][Y][largo] hasta 0xFF (p00:55CE verticales con
;   L_4B0C, p00:55D1 horizontales con L_4AD4); lo leen p02:80E9 (7 bytes)
;   0xa7d6..0xa7dd  (7 bytes)
DATA_lineas_A7D6:
	defb 053h,02bh,02ah	; a7d6
	defb 0ach,02bh,022h	; a7d9
	defb 0ffh	; a7dc

; ----------------------------------------------------------------------
; DATOS lineas_A7DD: lineas [X][Y][largo] hasta 0xFF (p00:55CE verticales con
;   L_4B0C, p00:55D1 horizontales con L_4AD4); lo leen p02:80F8 (7 bytes)
;   0xa7dd..0xa7e4  (7 bytes)
DATA_lineas_A7DD:
	defb 053h,02bh,05ah	; a7dd
	defb 053h,054h,062h	; a7e0
	defb 0ffh	; a7e3

; ----------------------------------------------------------------------
; DATOS fichas_pA45C_colores: tabla de colores de la lista fichas_pA45C
;   (L_529C indexa con c >> 4); lo leen p06:A45C (6 bytes)
;   0xa7e4..0xa7ea  (6 bytes)
DATA_fichas_pA45C_colores:
	defb 0eah,0a7h	; a7e4
	defb 0f2h,0a7h	; a7e6
	defb 0f6h,0a7h	; a7e8

; ----------------------------------------------------------------------
; DATOS fichas_pA45C_col0: 2 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 7 bloques: (fichas_pA45C_col0 A7EA-A7EE)
;   (fichas_pA45C_col0 A7EA-A7EE) (fichas_pA45C_col0 A7EA-A7EE)
;   (fichas_pA45C_col0 A7EA-A7F2) (fichas_pA45C_col0 A7EA-A7F2)
;   (fichas_pA45C_col0 A7EA-A7F2); lo leen p06:A45C (8 bytes)
;   0xa7ea..0xa7f2  (8 bytes)
DATA_fichas_pA45C_col0:
	defb 000h,004h	; a7ea
	defb 005h,006h	; a7ec
	defb 00bh,00dh	; a7ee
	defb 00eh,00fh	; a7f0

; ----------------------------------------------------------------------
; DATOS fichas_pA45C_col1: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 2 bloques: (fichas_pA45C_col1 A7F2-A7F6); lo
;   leen p06:A45C (4 bytes)
;   0xa7f2..0xa7f6  (4 bytes)
DATA_fichas_pA45C_col1:
	defb 000h,006h,00bh,00fh	; a7f2

; ----------------------------------------------------------------------
; DATOS fichas_pA45C_col2: 2 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; lo leen p06:A45C (2 bytes)
;   0xa7f6..0xa7f8  (2 bytes)
DATA_fichas_pA45C_col2:
	defb 004h,005h	; a7f6

; ----------------------------------------------------------------------
; DATOS fichas_pA45C: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p06:A45C (61 bytes)
;   0xa7f8..0xa835  (61 bytes)
DATA_fichas_pA45C:
	defb 00ah,002h,004h,080h,016h,035h	; a7f8
	defb 0a8h,003h,05ch,080h,014h,055h	; a7fe
	defb 0a8h,012h,040h,084h,002h,095h	; a804
	defb 0a9h,013h,048h,084h,002h,095h	; a80a
	defb 0a9h,004h,000h,088h,009h,0b5h	; a810
	defb 0a9h,005h,024h,088h,001h,075h	; a816
	defb 0aah,000h,040h,088h,004h,08dh	; a81c
	defb 0aah,020h,000h,08ch,002h,0adh	; a822
	defb 0aah,002h,040h,08ch,02eh,0bdh	; a828
	defb 0aah,004h,000h,094h,006h,09dh	; a82e
	defb 0adh	; a834

; ----------------------------------------------------------------------
; DATOS fichas_pA45C_f0: 22 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_pA45C; se solapan 2 bloques:
;   (fichas_pA45C_f1 A855-A995); lo leen p06:A45C (352 bytes)
;   0xa835..0xa995  (352 bytes)
DATA_fichas_pA45C_f0:
	defb 06ch,0b7h,0d8h,06fh,0d9h,06eh,0d9h,06eh,0d9h,06eh,06ch,0b7h,0feh,04bh,0ffh,0fdh	; a835  l..o.n.n.nl..K..
	defb 0c6h,07dh,086h,0fdh,0c7h,0fdh,085h,0fah,0c5h,0fah,0e8h,077h,077h,088h,01fh,0ffh	; a845  .}.........ww...
	defb 000h,000h,000h,007h,004h,01bh,000h,00fh,000h,01fh,000h,03fh,020h,05fh,060h,01fh	; a855  ...........? _`.
	defb 000h,0ffh,080h,07fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,002h,0ffh,004h,0ffh	; a865  ................
	defb 050h,02fh,042h,03fh,026h,0dbh,003h,07dh,043h,0bdh,005h,0feh,02dh,057h,04bh,0bdh	; a875  P/B?&..}C...-WK.
	defb 013h,0edh,057h,0abh,02fh,057h,05fh,027h,03fh,013h,037h,03bh,02bh,037h,02bh,037h	; a885  ..W./W_'?.7.+7+7
	defb 02bh,037h,023h,03fh,037h,01fh,003h,01fh,005h,00bh,005h,003h,003h,001h,000h,001h	; a895  +7#?7...........
	defb 03eh,0ffh,0ffh,0ffh,0ffh,0ffh,0fbh,0ffh,0fdh,0feh,0feh,0ffh,0efh,0ffh,0eah,0f7h	; a8a5  >...............
	defb 0ffh,0ffh,07dh,0feh,03eh,07fh,05fh,03fh,067h,01fh,038h,047h,05fh,060h,06fh,070h	; a8b5  ..}.>._?g.8G_`op
	defb 03eh,0ffh,0ffh,0ffh,0ffh,0ffh,0fbh,0ffh,0fdh,0feh,0feh,0ffh,0ffh,0ffh,0fch,0ffh	; a8c5  >...............
	defb 0fbh,0f7h,07fh,0ffh,03dh,07eh,05eh,03fh,067h,01fh,038h,047h,05fh,060h,06fh,070h	; a8d5  ....=~^?g.8G_`op
	defb 01eh,0ffh,0ffh,0ffh,0ffh,0ffh,0fbh,0ffh,0fdh,0feh,0cfh,0ffh,0d8h,0efh,0f7h,0efh	; a8e5  ................
	defb 0f7h,0ffh,079h,0ffh,03ch,07fh,05fh,03fh,06eh,01fh,033h,04fh,05ch,063h,06fh,070h	; a8f5  ..y.<._?n.3O\cop
	defb 0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0fbh,0ffh,0fdh,0feh,0feh,0ffh,0ffh,0ffh,0fah,0ffh	; a905  ................
	defb 0efh,0f7h,07fh,0ffh,03dh,07eh,05eh,03fh,067h,01fh,038h,047h,05fh,060h,06fh,070h	; a915  ....=~^?g.8G_`op
	defb 03eh,0ffh,0ffh,0ffh,0ffh,0ffh,0fbh,0ffh,0fdh,0feh,0ffh,0ffh,0e8h,0ffh,0efh,0f7h	; a925  >...............
	defb 0f3h,0ffh,078h,0ffh,03fh,07fh,05dh,03eh,06eh,01fh,033h,04fh,05ch,063h,06fh,070h	; a935  ..x.?.]>n.3O\cop
	defb 03eh,0ffh,0ffh,0ffh,0ffh,0ffh,0fbh,0ffh,0fdh,0feh,0ffh,0ffh,0f8h,0ffh,0fbh,0f7h	; a945  >...............
	defb 0ffh,0f7h,077h,0ffh,038h,07fh,05fh,03fh,06eh,01fh,033h,04fh,05ch,063h,06fh,070h	; a955  ..w.8._?n.3O\cop
	defb 01eh,0ffh,0ffh,0ffh,0ffh,0ffh,0fbh,0ffh,0fdh,0feh,0dfh,0efh,0ebh,0f7h,0fch,0ffh	; a965  ................
	defb 0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0fbh,0ffh,0fdh,0feh,0feh,0ffh,0ffh,0ffh,0f8h,0ffh	; a975  ................
	defb 0ffh,0f7h,078h,0ffh,03fh,07fh,05dh,03eh,06eh,01fh,033h,04fh,05ch,063h,06fh,070h	; a985  ..x.?.]>n.3O\cop

; ----------------------------------------------------------------------
; DATOS fichas_pA45C_f2: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 2 de la lista fichas_pA45C; se solapan 2 bloques:
;   (fichas_pA45C_f3 A995-A9B5); lo leen p06:A45C (32 bytes)
;   0xa995..0xa9b5  (32 bytes)
DATA_fichas_pA45C_f2:
	defb 000h,000h,001h,000h,03fh,000h,060h,00fh,0a0h,04fh,020h,0cfh,010h,0e7h,000h,0f7h	; a995  ....?.`..O .....
	defb 006h,000h,0feh,000h,006h,0f8h,002h,0fch,003h,0fch,001h,0feh,000h,0ffh,000h,0ffh	; a9a5  ................

; ----------------------------------------------------------------------
; DATOS fichas_pA45C_f4: 9 fichas de 8x8 a 3 bit(s) por punto (24 bytes cada
;   una), entrada 4 de la lista fichas_pA45C; se solapan 2 bloques:
;   (fichas_pA45C_f5 AA75-AA8D); lo leen p06:A45C (216 bytes)
;   0xa9b5..0xaa8d  (216 bytes)
DATA_fichas_pA45C_f4:
	defb 0ffh,086h,000h,0ffh,073h,000h,08fh,0fbh,000h,077h,0ffh,000h,0ffh,087h,000h,0ebh,04fh,030h,0cfh,097h,068h,0ffh,0cfh,030h	; a9b5  ....s....w......O0..h..0
	defb 0bfh,061h,000h,0ffh,0ceh,000h,0f1h,0dfh,000h,0eeh,0ffh,000h,0ffh,0e1h,000h,09bh,0f2h,00ch,0b3h,0e5h,01ah,0ffh,0f3h,00ch	; a9cd  .a......................
	defb 0ffh,01eh,000h,0ffh,0cfh,000h,0fdh,0e7h,000h,0f5h,0fbh,000h,0ffh,087h,000h,0ebh,04fh,030h,0cfh,097h,068h,0ffh,0cfh,030h	; a9e5  ................O0..h..0
	defb 0bfh,078h,000h,0ffh,0f3h,000h,0bfh,0e7h,000h,0afh,0dfh,000h,0ffh,0e1h,000h,09bh,0f2h,00ch,0b3h,0e5h,01ah,0ffh,0f3h,00ch	; a9fd  .x......................
	defb 0ffh,0feh,000h,0feh,0fbh,000h,07bh,087h,000h,08fh,07fh,000h,0f7h,0ffh,000h,07bh,087h,000h,0efh,087h,078h,0cfh,0dfh,020h	; aa15  ......{........{....x..
	defb 0bfh,07fh,000h,07fh,0dfh,000h,0deh,0e1h,000h,0f1h,0feh,000h,0efh,0ffh,000h,09eh,0e1h,000h,0bbh,0e1h,01eh,0f3h,0f7h,008h	; aa2d  ........................
	defb 0ffh,086h,000h,0ffh,073h,000h,08fh,0fbh,000h,077h,0ffh,000h,0ffh,087h,000h,0ebh,04fh,030h,0cfh,097h,068h,0ffh,0ffh,000h	; aa45  ....s....w......O0..h...
	defb 0bfh,061h,000h,0ffh,0ceh,000h,0f1h,0dfh,000h,0eeh,0ffh,000h,0ffh,0e1h,000h,09bh,0f2h,00ch,0b3h,0e5h,01ah,0ffh,0ffh,000h	; aa5d  .a......................
	defb 0b3h,0bch,040h,098h,09fh,060h,084h,087h,078h,083h,083h,07ch,0c1h,0c1h,0beh,0c1h,0c1h,07eh,071h,071h,0beh,03fh,03fh,0cfh	; aa75  ..@..`..x..|.....~qq.??.

; ----------------------------------------------------------------------
; DATOS fichas_pA45C_f6: 4 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 6 de la lista fichas_pA45C; lo leen p06:A45C (32 bytes)
;   0xaa8d..0xaaad  (32 bytes)
DATA_fichas_pA45C_f6:
	defb 001h,003h,003h,005h,005h,001h,003h,002h	; aa8d  ........
	defb 002h,001h,001h,000h,000h,000h,000h,000h	; aa95  ........
	defb 000h,000h,080h,0c0h,060h,060h,060h,0f8h	; aa9d  ....```.
	defb 0feh,083h,0fdh,08eh,0f2h,0fch,0ffh,0ffh	; aaa5  ........

; ----------------------------------------------------------------------
; DATOS fichas_pA45C_f7: 2 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 7 de la lista fichas_pA45C; lo leen p06:A45C (16 bytes)
;   0xaaad..0xaabd  (16 bytes)
DATA_fichas_pA45C_f7:
	defb 000h,000h,000h,000h,066h,09ch,030h,060h	; aaad  ....f.0`
	defb 032h,024h,064h,040h,048h,008h,020h,000h	; aab5  2$d@H. .

; ----------------------------------------------------------------------
; DATOS fichas_pA45C_f8: 46 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 8 de la lista fichas_pA45C; lo leen p06:A45C (736 bytes)
;   0xaabd..0xad9d  (736 bytes)
DATA_fichas_pA45C_f8:
	defb 001h,000h,007h,000h,01fh,000h,07fh,000h,0bfh,000h,07fh,000h,0feh,001h,0e5h,01ah	; aabd  ................
	defb 0bfh,040h,07fh,080h,0ffh,000h,0ffh,000h,0bdh,042h,0bdh,042h,03ah,0c5h,063h,09fh	; aacd  .@.......B.B:.c.
	defb 0ffh,000h,0ffh,000h,0fbh,004h,078h,087h,070h,08fh,078h,0dfh,0fdh,0beh,0fch,0c3h	; aadd  ......x.p.x.....
	defb 0f8h,000h,0dch,020h,0ech,010h,0ech,010h,066h,098h,0f6h,008h,0f6h,008h,0feh,000h	; aaed  ... ....f.......
	defb 0feh,001h,07dh,003h,07bh,007h,07fh,002h,02fh,003h,02dh,003h,007h,001h,00fh,005h	; aafd  ..}.{.../.-.....
	defb 0feh,000h,07eh,080h,076h,08ch,03fh,0ceh,07bh,08eh,0f7h,09eh,0f7h,09ah,0f7h,09ah	; ab0d  ..~.v.?.{.......
	defb 00ch,007h,006h,003h,006h,003h,006h,003h,005h,002h,005h,002h,003h,000h,001h,000h	; ab1d  ................
	defb 0fdh,0ffh,0b8h,0ffh,0ffh,0ffh,0ffh,0f7h,0fbh,0f7h,07fh,0f8h,07fh,0ffh,07bh,0f7h	; ab2d  ..............{.
	defb 0e7h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0bfh,07fh,07fh,0ffh,0e7h,0ffh,0d7h,0efh	; ab3d  ................
	defb 0f7h,09ah,0fbh,096h,0d6h,0ech,0ceh,0fch,0fch,0d8h,0d8h,0e0h,0d0h,0e0h,0d0h,0e0h	; ab4d  ................
	defb 0f7h,078h,0bfh,07fh,07fh,03fh,05dh,03eh,02eh,01fh,017h,00fh,00bh,007h,005h,003h	; ab5d  .x...?]>........
	defb 03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0beh,07fh,07dh,0feh,0fbh,0fch,0f7h,0f8h,0deh,0e1h	; ab6d  ?.......}.......
	defb 0b0h,0c0h,0b0h,0c0h,050h,0a0h,0c0h,030h,088h,070h,000h,0f8h,004h,0f8h,002h,0fch	; ab7d  ....P..0.p......
	defb 000h,000h,000h,000h,000h,000h,003h,000h,00ch,003h,014h,00fh,02eh,01fh,05ch,03fh	; ab8d  ..............\?
	defb 003h,000h,001h,000h,001h,000h,0c1h,000h,001h,0e0h,001h,082h,001h,006h,003h,00dh	; ab9d  ................
	defb 0feh,001h,0fch,003h,078h,087h,030h,0cfh,0c0h,07fh,0f0h,07fh,0ffh,07fh,0ffh,0ffh	; abad  ....x.0.........
	defb 000h,0ffh,007h,0ffh,00fh,0ffh,01fh,0ffh,03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; abbd  ........?.......
	defb 000h,080h,0e0h,0e0h,0c1h,0c1h,0c1h,0c1h,081h,081h,081h,083h,080h,083h,000h,003h	; abcd  ................
	defb 0ffh,000h,07dh,003h,07bh,007h,07fh,003h,02fh,003h,02dh,003h,007h,001h,00fh,005h	; abdd  ..}.{.../.-.....
	defb 0fdh,0ffh,0f8h,0ffh,0ffh,0ffh,0ffh,0f7h,0fbh,0f7h,07fh,0f8h,07fh,0ffh,07fh,0ffh	; abed  ................
	defb 0e3h,0ffh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0bfh,07fh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh	; abfd  ................
	defb 0fch,07bh,0b7h,07bh,07fh,03fh,05dh,03eh,02eh,01fh,017h,00fh,00bh,007h,005h,003h	; ac0d  .{.{.?]>........
	defb 02fh,0dfh,0f7h,0efh,0ffh,0ffh,0beh,07fh,07dh,0feh,0fbh,0fch,0f7h,0f8h,0deh,0e1h	; ac1d  /.......}.......
	defb 0ffh,000h,0ffh,000h,0fbh,004h,078h,087h,070h,08fh,028h,0dfh,0ddh,0beh,0bch,0ffh	; ac2d  ......x.p.(.....
	defb 08dh,0ffh,0f8h,0ffh,0ffh,0ffh,0ffh,0f7h,0fbh,0f7h,07fh,0f8h,06fh,0ffh,06fh,0f7h	; ac3d  ............o.o.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0bfh,07fh,073h,0ffh,0fbh,0f7h,0cfh,0ffh	; ac4d  ..........s.....
	defb 0f8h,07fh,0bfh,07fh,07fh,03fh,05dh,03eh,02eh,01fh,017h,00fh,00bh,007h,005h,003h	; ac5d  .....?]>........
	defb 07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0beh,07fh,07dh,0feh,0fbh,0fch,0f7h,0f8h,0deh,0e1h	; ac6d  ........}.......
	defb 01fh,0ffh,0feh,08fh,0dah,077h,0bfh,0ffh,0f7h,0ffh,0b7h,0cfh,0ffh,087h,0ffh,0ffh	; ac7d  .....w..........
	defb 0feh,03dh,0c6h,07fh,03ah,0ffh,07fh,0ffh,0b3h,0cfh,0ffh,087h,0ffh,0ffh,0c3h,0ffh	; ac8d  .=..:...........
	defb 08dh,0ffh,0f8h,0ffh,0ffh,0ffh,0ffh,0f7h,0fbh,0f7h,07fh,0f8h,067h,0ffh,068h,0f7h	; ac9d  ............g.h.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0bfh,07fh,073h,0ffh,08bh,0f7h,0fbh,0f7h	; acad  ..........s.....
	defb 0f7h,07fh,0bbh,07fh,07ch,03fh,05fh,03fh,02dh,01eh,016h,00fh,00bh,007h,005h,003h	; acbd  ....|?_?-.......
	defb 0f7h,0ffh,0cfh,0ffh,03fh,0ffh,0feh,0ffh,0bdh,07eh,07bh,0fch,0f7h,0f8h,0deh,0e1h	; accd  ....?....~{.....
	defb 0fdh,0ffh,0b8h,0ffh,0ffh,0ffh,0ffh,0f7h,0fbh,0f7h,07fh,0f8h,07fh,0ffh,079h,0f7h	; acdd  ..............y.
	defb 0e7h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0bfh,07fh,07fh,0ffh,0f3h,0ffh,09bh,0e7h	; aced  ................
	defb 0fdh,0ffh,0f8h,0ffh,0ffh,0ffh,0ffh,0f7h,0fbh,0f7h,07fh,0f8h,07fh,0ffh,07ch,0fbh	; acfd  ..............|.
	defb 0e3h,0ffh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0bfh,07fh,07fh,0ffh,0ffh,0ffh,01fh,0ffh	; ad0d  ................
	defb 0f6h,07bh,0bbh,07fh,07ch,03fh,05fh,03fh,02dh,01eh,016h,00fh,00bh,007h,005h,003h	; ad1d  .{..|?_?-.......
	defb 077h,0ffh,0cfh,0ffh,01fh,0ffh,0feh,0ffh,0bdh,07eh,03bh,0fch,0f7h,0f8h,0deh,0e1h	; ad2d  w........~......
	defb 0fbh,077h,0bfh,077h,07fh,03bh,058h,03fh,02fh,01fh,016h,00fh,00bh,007h,005h,003h	; ad3d  .w.w..X?/.......
	defb 09fh,0efh,0efh,0f7h,0efh,0f7h,01eh,0efh,0fdh,0feh,0bbh,07ch,077h,0f8h,0deh,0e1h	; ad4d  ...........|w...
	defb 0fdh,0ffh,0f8h,0ffh,0ffh,0ffh,0ffh,0f7h,0fbh,0f7h,07fh,0f8h,07fh,0ffh,078h,0f7h	; ad5d  ..............x.
	defb 0e3h,0ffh,0dfh,0ffh,0ffh,0ffh,0ffh,0ffh,0bfh,07fh,07fh,0ffh,0ffh,0ffh,02fh,0dfh	; ad6d  ............../.
	defb 0f7h,07bh,0bch,07bh,07fh,03fh,05dh,03eh,02eh,01fh,017h,00fh,00bh,007h,005h,003h	; ad7d  .{.{.?]>........
	defb 0f7h,0efh,02fh,0dfh,0ffh,0ffh,0beh,07fh,07dh,0feh,0fbh,0fch,0f7h,0f8h,0deh,0e1h	; ad8d  ../.....}.......

; ----------------------------------------------------------------------
; DATOS fichas_pA45C_f9: 6 fichas de 8x8 a 3 bit(s) por punto (24 bytes cada
;   una), entrada 9 de la lista fichas_pA45C; lo leen p06:A45C (144 bytes)
;   0xad9d..0xae2d  (144 bytes)
DATA_fichas_pA45C_f9:
	defb 0dfh,03fh,000h,075h,09fh,000h,0deh,0e7h,000h,0bfh,0ffh,000h,0f7h,0cfh,000h,0ffh,0b7h,000h,0e7h,087h,028h,0efh,0c7h,038h	; ad9d  .?.u................(..8
	defb 0feh,0cfh,000h,0e6h,09fh,000h,0fah,03fh,000h,077h,0cfh,000h,0fbh,0b7h,000h,0e7h,087h,028h,0efh,0c7h,038h,0ffh,0ffh,000h	; adb5  .......?.w.......(..8...
	defb 0dfh,03fh,000h,035h,0feh,000h,0feh,087h,000h,0cfh,07fh,000h,0b7h,0ffh,000h,0f3h,0cfh,000h,0cbh,087h,020h,0efh,0c7h,038h	; adcd  .?.5................ ..8
	defb 0feh,0ffh,000h,0feh,087h,000h,08eh,07bh,000h,037h,0ffh,000h,0fbh,0cfh,000h,0cbh,087h,020h,0efh,0c7h,038h,0ffh,0ffh,000h	; ade5  .......{.7....... ..8...
	defb 01fh,0ffh,000h,0feh,087h,000h,0dah,067h,000h,0bfh,0ffh,000h,0f7h,0cfh,000h,0ffh,0b7h,000h,0e7h,087h,028h,0efh,0c7h,038h	; adfd  .......g............(..8
	defb 0feh,01dh,000h,0c6h,03fh,000h,03ah,0ffh,000h,077h,0cfh,000h,0fbh,0b7h,000h,0e7h,087h,028h,0efh,0c7h,038h,0ffh,0ffh,000h	; ae15  ....?.:..w.......(..8...

; ----------------------------------------------------------------------
; DATOS plantillas_de_actor: 29 x 11 bytes que p00:5596 copia a (ix+7); tienen
;   lector con inmediato las de AE2D, AE38, AE64, AE6F, AE7A, AE90, AE9B,
;   AF4B, AF56, AF61 (p02:91EE, 94B0, 953A, 95E7, 96C1, 975D, 9784, p03:A619,
;   A6BF, A74B); las otras 19 van con el mismo paso, sin lector a la vista; lo
;   leen p00:5596 (319 bytes)
;   0xae2d..0xaf6c  (319 bytes)
DATA_plantillas_de_actor:
	defb 000h,000h,000h,001h,000h,000h,000h,000h,000h,008h,000h	; ae2d  ...........
	defb 000h,0fch,000h,001h,000h,000h,000h,000h,000h,01dh,010h	; ae38  ...........
	defb 000h,0fch,000h,0ffh,001h,080h,000h,000h,000h,01dh,010h	; ae43  ...........
	defb 000h,004h,000h,001h,000h,000h,000h,000h,000h,01dh,010h	; ae4e  ...........
	defb 000h,004h,000h,0ffh,001h,080h,0ffh,000h,000h,01eh,010h	; ae59  ...........
	defb 000h,000h,000h,000h,000h,040h,000h,000h,000h,037h,000h	; ae64  .....@...7.
	defb 000h,001h,000h,000h,001h,040h,000h,000h,000h,068h,008h	; ae6f  .....@...h.
	defb 000h,0fch,000h,0feh,001h,030h,000h,000h,000h,040h,000h	; ae7a  .....0...@.
	defb 000h,0fch,000h,002h,001h,030h,000h,000h,000h,03eh,000h	; ae85  .....0...>.
	defb 000h,002h,000h,000h,000h,000h,000h,000h,000h,018h,010h	; ae90  ...........
	defb 040h,003h,000h,001h,001h,0c0h,0ffh,000h,000h,019h,01ah	; ae9b  @..........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; aea6  ...........
	defb 000h,000h,000h,000h,000h,000h,0ffh,000h,001h,043h,009h	; aeb1  .........C.
	defb 000h,0f9h,000h,004h,000h,000h,000h,000h,000h,084h,000h	; aebc  ...........
	defb 000h,0fah,000h,006h,000h,000h,000h,000h,000h,080h,000h	; aec7  ...........
	defb 000h,000h,000h,008h,000h,000h,000h,000h,000h,07ch,000h	; aed2  .........|.
	defb 000h,006h,000h,006h,000h,000h,000h,000h,000h,070h,000h	; aedd  .........p.
	defb 000h,007h,000h,004h,000h,000h,000h,000h,000h,074h,000h	; aee8  .........t.
	defb 000h,008h,000h,000h,000h,000h,000h,000h,000h,088h,000h	; aef3  ...........
	defb 000h,007h,000h,0fch,000h,000h,000h,000h,000h,084h,000h	; aefe  ...........
	defb 000h,006h,000h,0fah,000h,000h,000h,000h,000h,080h,000h	; af09  ...........
	defb 000h,000h,000h,0f8h,000h,000h,000h,000h,000h,07ch,000h	; af14  .........|.
	defb 000h,0fah,000h,0fah,000h,000h,000h,000h,000h,070h,000h	; af1f  .........p.
	defb 000h,0f9h,000h,0fch,000h,000h,000h,000h,000h,074h,000h	; af2a  .........t.
	defb 000h,000h,000h,004h,000h,000h,000h,000h,000h,06dh,000h	; af35  .........m.
	defb 000h,000h,000h,0fch,000h,000h,000h,000h,000h,06ch,000h	; af40  .........l.
	defb 000h,000h,000h,000h,001h,040h,000h,000h,000h,084h,000h	; af4b  .....@.....
	defb 000h,000h,000h,000h,001h,040h,000h,000h,000h,074h,000h	; af56  .....@...t.
	defb 000h,006h,000h,000h,000h,040h,000h,000h,000h,078h,000h	; af61  .....@...x.

; ----------------------------------------------------------------------
; DATOS fichas_p53AF_colores: tabla de colores de la lista fichas_p53AF
;   (L_529C indexa con c >> 4); lo leen p00:53AF (2 bytes)
;   0xaf6c..0xaf6e  (2 bytes)
DATA_fichas_p53AF_colores:
	defb 070h,0afh	; af6c

; ----------------------------------------------------------------------
; DATOS colores_pAF78_1: la segunda palabra de la tabla de colores p06:AF6C
;   (apunta a p06:AF74); la lista p06:AF78 solo usa la primera; lo leen
;   p00:53AF (2 bytes)
;   0xaf6e..0xaf70  (2 bytes)
DATA_colores_pAF78_1:
	defb 074h,0afh	; af6e

; ----------------------------------------------------------------------
; DATOS fichas_p53AF_col0: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 2 bloques: (fichas_p53AF_col0 AF70-AF74); lo
;   leen p00:53AF (4 bytes)
;   0xaf70..0xaf74  (4 bytes)
DATA_fichas_p53AF_col0:
	defb 00dh,00eh,00fh,000h	; af70

; ----------------------------------------------------------------------
; DATOS colores_pAF78_1b: 4 colores (0D 0E 0F 00) a los que apunta p06:AF6E;
;   la lista p06:AF78 no los usa; lo leen p00:53AF (4 bytes)
;   0xaf74..0xaf78  (4 bytes)
DATA_colores_pAF78_1b:
	defb 00dh,00eh,00fh,000h	; af74

; ----------------------------------------------------------------------
; DATOS fichas_p53AF: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:53AF (13 bytes)
;   0xaf78..0xaf85  (13 bytes)
DATA_fichas_p53AF:
	defb 002h,002h,010h,09ch,012h,085h	; af78
	defb 0afh,002h,058h,09ch,006h,0a5h	; af7e
	defb 0b0h	; af84

; ----------------------------------------------------------------------
; DATOS fichas_p53AF_f0: 18 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_p53AF; lo leen p00:53AF (288 bytes)
;   0xaf85..0xb0a5  (288 bytes)
DATA_fichas_p53AF_f0:
	defb 0feh,0ffh,0f8h,0ffh,0f0h,0fch,0e8h,0f0h,0c0h,0e0h,0a8h,0c0h,09ch,0c0h,00fh,090h	; af85  ................
	defb 000h,0ffh,083h,000h,004h,000h,047h,000h,002h,000h,08bh,000h,0d7h,000h,0a5h,042h	; af95  ......G........B
	defb 07fh,0ffh,01fh,0ffh,04fh,03fh,037h,00fh,09bh,007h,01dh,003h,0adh,003h,0f6h,009h	; afa5  ....O?7.........
	defb 020h,09fh,000h,0bfh,040h,09fh,010h,0cfh,049h,086h,041h,080h,088h,0c0h,0a3h,0c0h	; afb5   ...@...I.A.....
	defb 05eh,081h,02ch,0c3h,024h,0c3h,0c7h,000h,001h,018h,042h,03ch,001h,07eh,000h,066h	; afc5  ^.,.$.....B<.~.f
	defb 006h,0f9h,002h,0fdh,002h,0f9h,00ch,0f3h,09eh,061h,0c6h,001h,015h,003h,0edh,003h	; afd5  .........a......
	defb 09dh,0e2h,0c0h,0fdh,0c9h,0f4h,0e0h,0feh,0e4h,0fbh,0f2h,0f9h,0f8h,0fdh,0f8h,0fdh	; afe5  ................
	defb 081h,000h,018h,024h,095h,042h,000h,07eh,000h,07eh,000h,0ffh,000h,07eh,000h,07eh	; aff5  ...$.B.~.~...~.~
	defb 031h,04fh,043h,0bfh,053h,02fh,087h,07fh,027h,0dfh,06fh,09fh,05fh,0bfh,05fh,0bfh	; b005  1OC.S/..'.o._._.
	defb 0fah,0fch,0fdh,0feh,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b015  ................
	defb 000h,0a5h,042h,018h,012h,081h,081h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b025  ..B.............
	defb 05fh,03fh,0bfh,07fh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b035  _?..............
	defb 09dh,0e2h,0c0h,0fdh,0c1h,0fch,0e0h,0feh,0e8h,0f7h,0f0h,0ffh,0f4h,0fbh,0f4h,0fbh	; b045  ................
	defb 081h,000h,018h,024h,095h,042h,000h,07eh,000h,07eh,000h,0ffh,000h,0ffh,000h,0ffh	; b055  ...$.B.~.~......
	defb 031h,04fh,043h,0bfh,043h,03fh,087h,07fh,017h,0efh,00fh,0ffh,02fh,0dfh,02fh,0dfh	; b065  1OC.C?.....././.
	defb 0f0h,0fbh,0f2h,0f9h,0f8h,0fdh,0f8h,0fdh,0fah,0fch,0fdh,0feh,0feh,0ffh,0ffh,0ffh	; b075  ................
	defb 000h,0ffh,000h,0ffh,000h,07eh,000h,07eh,000h,0a5h,042h,018h,012h,081h,081h,0ffh	; b085  .....~.~..B.....
	defb 02fh,0dfh,06fh,09fh,05fh,0bfh,05fh,0bfh,05fh,03fh,0bfh,07fh,07fh,0ffh,0ffh,0ffh	; b095  /.o._._._?......

; ----------------------------------------------------------------------
; DATOS fichas_p53AF_f1: 6 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 1 de la lista fichas_p53AF; lo leen p00:53AF (96 bytes)
;   0xb0a5..0xb105  (96 bytes)
DATA_fichas_p53AF_f1:
	defb 0ffh,0ffh,0fch,0ffh,0f8h,0fch,0f9h,0fch,0fah,0fch,0c0h,0fch,0a0h,0c2h,094h,0c1h	; b0a5  ................
	defb 0ffh,0ffh,03fh,0ffh,01fh,03fh,05fh,03fh,0dfh,03fh,0c3h,03fh,081h,043h,019h,083h	; b0b5  ..?..?_?.?.?.C..
	defb 09ch,0c2h,0c1h,0fch,0f8h,0fch,0f9h,0fch,0f9h,0fch,0f9h,0fch,0fah,0fch,0f8h,0ffh	; b0c5  ................
	defb 02dh,043h,043h,03fh,0dfh,03fh,05fh,03fh,0dfh,03fh,09fh,07fh,0dfh,03fh,01fh,0ffh	; b0d5  -CC?.?_?.?...?..
	defb 0f4h,0f8h,0e0h,0ffh,0a2h,0c0h,096h,0e9h,084h,080h,02bh,080h,05fh,080h,054h,0abh	; b0e5  ..........+._.T.
	defb 0afh,01fh,007h,0ffh,0ddh,003h,001h,0ffh,02ch,001h,0deh,001h,0feh,001h,02ah,0d5h	; b0f5  ........,.....*.

; ----------------------------------------------------------------------
; DATOS dibujo_p51E0: RLE (L_5578): 14 x 14 fichas a 0xE800 que p00:5206 pinta
;   en (0x60, 0x90) de la pagina 1; lo leen p00:51E0 (133 bytes)
;   0xb105..0xb18a  (133 bytes)
DATA_dibujo_p51E0:
	defb 006h,000h,082h,063h,0b3h,00ch,000h,082h,067h,0b7h,00ah,000h,086h,06ah,06bh,06ch	; b105  ...c....g....jkl
	defb 0bch,0bbh,0bah,008h,000h,086h,06eh,06fh,070h,0c0h,0bfh,0beh,008h,000h,086h,074h	; b115  ......nop......t
	defb 075h,076h,0c6h,0c5h,0c4h,008h,000h,086h,07ah,07bh,07ch,0cch,0cbh,0cah,008h,000h	; b125  uv......z{|.....
	defb 086h,080h,081h,082h,0d2h,0d1h,0d0h,008h,000h,086h,084h,085h,086h,0d6h,0d5h,0d4h	; b135  ................
	defb 008h,000h,086h,088h,089h,08ah,0dah,0d9h,0d8h,008h,000h,086h,0a7h,08fh,090h,0e0h	; b145  ................
	defb 0dfh,0f7h,007h,000h,088h,0a9h,0a8h,095h,096h,0e6h,0e5h,0f8h,0f9h,004h,000h,09ah	; b155  ................
	defb 097h,098h,099h,09ah,09bh,09ch,0ech,0ebh,0eah,0e9h,0e8h,0e7h,000h,000h,09dh,09eh	; b165  ................
	defb 09fh,0a0h,0a1h,0a2h,0f2h,0f1h,0f0h,0efh,0eeh,0edh,003h,000h,081h,0a3h,008h,0adh	; b175  ................
	defb 083h,0f3h,000h,000h,000h	; b185

; ----------------------------------------------------------------------
; DATOS remiendos: 5 palabras: los remiendos del dibujo de p06:B105 por ruina;
;   p00:51EF aplica del 0 a 0xC21D; lo leen p00:5248 (10 bytes)
;   0xb18a..0xb194  (10 bytes)
DATA_remiendos:
	defb 094h,0b1h	; b18a
	defb 0b5h,0b1h	; b18c
	defb 0d2h,0b1h	; b18e
	defb 0e3h,0b1h	; b190
	defb 00ah,0b2h	; b192

; ----------------------------------------------------------------------
; DATOS remiendo_0: [lo][hi] en 0xE800, [ancho][alto] y las fichas (0 no se
;   copia), hasta un 0 (p00:524E); lo leen p00:5248 (33 bytes)
;   0xb194..0xb1b5  (33 bytes)
DATA_remiendo_0:
	defb 071h,0e8h,004h,003h,000h,000h,0a6h,000h,08bh,08ch,08dh,08eh,091h,092h,093h,094h	; b194  q...............
	defb 079h,0e8h,004h,003h,000h,0f6h,000h,000h,0deh,0ddh,0dch,0dbh,0e4h,0e3h,0e2h,0e1h	; b1a4  y...............
	defb 000h	; b1b4

; ----------------------------------------------------------------------
; DATOS remiendo_1: [lo][hi] en 0xE800, [ancho][alto] y las fichas (0 no se
;   copia), hasta un 0 (p00:524E); lo leen p00:5248 (29 bytes)
;   0xb1b5..0xb1d2  (29 bytes)
DATA_remiendo_1:
	defb 03ah,0e8h,002h,005h,0a4h,073h,0a5h,079h,000h,07fh,000h,083h,000h,087h,042h,0e8h	; b1b5  :....s.y......B.
	defb 002h,005h,0c3h,0f4h,0c9h,0f5h,0cfh,000h,0d3h,000h,0d7h,000h,000h	; b1c5  .............

; ----------------------------------------------------------------------
; DATOS remiendo_2: [lo][hi] en 0xE800, [ancho][alto] y las fichas (0 no se
;   copia), hasta un 0 (p00:524E); lo leen p00:5248 (17 bytes)
;   0xb1d2..0xb1e3  (17 bytes)
DATA_remiendo_2:
	defb 003h,0e8h,001h,004h,060h,064h,064h,064h,00ah,0e8h,001h,004h,0b0h,0b4h,0b4h,0b4h	; b1d2  ....`ddd........
	defb 000h	; b1e2

; ----------------------------------------------------------------------
; DATOS remiendo_3: [lo][hi] en 0xE800, [ancho][alto] y las fichas (0 no se
;   copia), hasta un 0 (p00:524E); lo leen p00:5248 (39 bytes)
;   0xb1e3..0xb20a  (39 bytes)
DATA_remiendo_3:
	defb 01ch,0e8h,003h,005h,068h,069h,000h,000h,06dh,000h,000h,071h,072h,000h,077h,078h	; b1e3  ....hi..m..qr.wx
	defb 000h,07dh,07eh,027h,0e8h,003h,005h,000h,0b9h,0b8h,000h,0bdh,000h,0c2h,0c1h,000h	; b1f3  .}~'............
	defb 0c8h,0c7h,000h,0ceh,0cdh,000h,000h	; b203

; ----------------------------------------------------------------------
; DATOS remiendo_4: [lo][hi] en 0xE800, [ancho][alto] y las fichas (0 no se
;   copia), hasta un 0 (p00:524E); lo leen p00:5248 (17 bytes)
;   0xb20a..0xb21b  (17 bytes)
DATA_remiendo_4:
	defb 004h,0e8h,002h,002h,061h,062h,065h,066h,008h,0e8h,002h,002h,0b2h,0b1h,0b6h,0b5h	; b20a  ....abef........
	defb 000h	; b21a

; ----------------------------------------------------------------------
; DATOS patrones_B21B: RLE de patrones de sprite (p00:492C) a la VRAM
;   0xE880-0xE8C0; lo leen p01:6A8D (29 bytes)
;   0xb21b..0xb238  (29 bytes)
DATA_patrones_B21B:
	defb 08bh,00fh,010h,010h,00ch,003h,004h,005h,002h,001h,002h,001h,005h,000h,08bh,0f0h	; b21b  ................
	defb 008h,030h,000h,0c0h,020h,0c0h,020h,080h,000h,080h,005h,000h,000h	; b22b  .0.. . ......

; ----------------------------------------------------------------------
; DATOS patrones_B238: RLE de patrones de sprite (p00:492C) a la VRAM
;   0xE880-0xE8C0; lo leen p01:6A9F (57 bytes)
;   0xb238..0xb271  (57 bytes)
DATA_patrones_B238:
	defb 005h,000h,08bh,001h,003h,007h,008h,070h,0f0h,0c8h,0c5h,042h,032h,00ch,005h,000h	; b238  .......p...B2...
	defb 08bh,080h,0c0h,0e0h,010h,00eh,04fh,093h,0a3h,042h,04ch,030h,005h,000h,08bh,001h	; b248  ......O..BL0....
	defb 002h,007h,00fh,07fh,09fh,0bfh,0bfh,07eh,03eh,00ch,005h,000h,08bh,080h,040h,0e0h	; b258  .......~>.....@.
	defb 0f0h,0feh,0f9h,0fdh,0fdh,07eh,07ch,030h,000h	; b268  .....~|0.

; ----------------------------------------------------------------------
; DATOS paleta_antesala: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:540D (16 bytes)
;   0xb271..0xb281  (16 bytes)
DATA_paleta_antesala:
	defb 006h,073h,005h	; b271
	defb 009h,073h,003h	; b274
	defb 00bh,024h,003h	; b277
	defb 00ch,063h,006h	; b27a
	defb 00eh,031h,003h	; b27d
	defb 0ffh	; b280

; ----------------------------------------------------------------------
; DATOS paletas_de_antesala: 5 palabras: la paleta de cada antesala
;   (p00:5416); lo leen p00:540D (10 bytes)
;   0xb281..0xb28b  (10 bytes)
DATA_paletas_de_antesala:
	defb 08bh,0b2h	; b281
	defb 09bh,0b2h	; b283
	defb 0abh,0b2h	; b285
	defb 0bbh,0b2h	; b287
	defb 0cbh,0b2h	; b289

; ----------------------------------------------------------------------
; DATOS paleta_antesala_r0: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p00:540D (16 bytes)
;   0xb28b..0xb29b  (16 bytes)
DATA_paleta_antesala_r0:
	defb 001h,035h,004h	; b28b
	defb 002h,033h,005h	; b28e
	defb 003h,011h,003h	; b291
	defb 007h,053h,004h	; b294
	defb 008h,020h,001h	; b297
	defb 0ffh	; b29a

; ----------------------------------------------------------------------
; DATOS paleta_antesala_r1: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p00:540D (16 bytes)
;   0xb29b..0xb2ab  (16 bytes)
DATA_paleta_antesala_r1:
	defb 001h,047h,006h	; b29b
	defb 002h,030h,001h	; b29e
	defb 003h,052h,003h	; b2a1
	defb 007h,007h,005h	; b2a4
	defb 008h,004h,002h	; b2a7
	defb 0ffh	; b2aa

; ----------------------------------------------------------------------
; DATOS paleta_antesala_r2: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p00:540D (16 bytes)
;   0xb2ab..0xb2bb  (16 bytes)
DATA_paleta_antesala_r2:
	defb 001h,047h,005h	; b2ab
	defb 002h,033h,005h	; b2ae
	defb 003h,011h,003h	; b2b1
	defb 007h,053h,003h	; b2b4
	defb 008h,041h,001h	; b2b7
	defb 0ffh	; b2ba

; ----------------------------------------------------------------------
; DATOS paleta_antesala_r3: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p00:540D (16 bytes)
;   0xb2bb..0xb2cb  (16 bytes)
DATA_paleta_antesala_r3:
	defb 001h,037h,005h	; b2bb
	defb 002h,030h,001h	; b2be
	defb 003h,050h,002h	; b2c1
	defb 007h,052h,004h	; b2c4
	defb 008h,031h,002h	; b2c7
	defb 0ffh	; b2ca

; ----------------------------------------------------------------------
; DATOS paleta_antesala_r4: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p00:540D (16 bytes)
;   0xb2cb..0xb2db  (16 bytes)
DATA_paleta_antesala_r4:
	defb 001h,022h,002h	; b2cb
	defb 002h,037h,003h	; b2ce
	defb 003h,024h,002h	; b2d1
	defb 007h,044h,004h	; b2d4
	defb 008h,033h,003h	; b2d7
	defb 0ffh	; b2da

; ----------------------------------------------------------------------
; DATOS paletas_de_fase: 5 palabras: la paleta de las fases de cada ruina
;   (p00:53D3); lo leen p00:53C7 (10 bytes)
;   0xb2db..0xb2e5  (10 bytes)
DATA_paletas_de_fase:
	defb 025h,0b3h	; b2db
	defb 005h,0b3h	; b2dd
	defb 0f5h,0b2h	; b2df
	defb 0e5h,0b2h	; b2e1
	defb 015h,0b3h	; b2e3

; ----------------------------------------------------------------------
; DATOS paleta_fase_r3: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53C7 (16 bytes)
;   0xb2e5..0xb2f5  (16 bytes)
DATA_paleta_fase_r3:
	defb 001h,045h,004h	; b2e5
	defb 002h,030h,001h	; b2e8
	defb 003h,010h,000h	; b2eb
	defb 004h,062h,005h	; b2ee
	defb 005h,051h,002h	; b2f1
	defb 0ffh	; b2f4

; ----------------------------------------------------------------------
; DATOS paleta_fase_r2: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53C7 (16 bytes)
;   0xb2f5..0xb305  (16 bytes)
DATA_paleta_fase_r2:
	defb 001h,003h,004h	; b2f5
	defb 002h,002h,002h	; b2f8
	defb 003h,041h,000h	; b2fb
	defb 004h,053h,004h	; b2fe
	defb 005h,020h,000h	; b301
	defb 0ffh	; b304

; ----------------------------------------------------------------------
; DATOS paleta_fase_r1: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53C7 (16 bytes)
;   0xb305..0xb315  (16 bytes)
DATA_paleta_fase_r1:
	defb 001h,002h,005h	; b305
	defb 002h,005h,002h	; b308
	defb 003h,003h,000h	; b30b
	defb 004h,077h,007h	; b30e
	defb 005h,037h,006h	; b311
	defb 0ffh	; b314

; ----------------------------------------------------------------------
; DATOS paleta_fase_r4: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53C7 (16 bytes)
;   0xb315..0xb325  (16 bytes)
DATA_paleta_fase_r4:
	defb 001h,033h,003h	; b315
	defb 002h,022h,002h	; b318
	defb 003h,011h,001h	; b31b
	defb 004h,042h,003h	; b31e
	defb 005h,020h,001h	; b321
	defb 0ffh	; b324

; ----------------------------------------------------------------------
; DATOS paleta_fase_r0: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53C7 (16 bytes)
;   0xb325..0xb335  (16 bytes)
DATA_paleta_fase_r0:
	defb 001h,040h,002h	; b325
	defb 002h,020h,001h	; b328
	defb 003h,000h,000h	; b32b
	defb 004h,060h,005h	; b32e
	defb 005h,050h,003h	; b331
	defb 0ffh	; b334

; ----------------------------------------------------------------------
; DATOS paleta_base: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53DE (28 bytes)
;   0xb335..0xb351  (28 bytes)
DATA_paleta_base:
	defb 000h,000h,000h	; b335
	defb 006h,070h,003h	; b338
	defb 009h,073h,005h	; b33b
	defb 00bh,007h,003h	; b33e
	defb 00ah,070h,000h	; b341
	defb 00ch,031h,002h	; b344
	defb 00dh,077h,007h	; b347
	defb 00eh,044h,004h	; b34a
	defb 00fh,000h,000h	; b34d
	defb 0ffh	; b350

; ----------------------------------------------------------------------
; DATOS paleta_pA465: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p06:A465 (10 bytes)
;   0xb351..0xb35b  (10 bytes)
DATA_paleta_pA465:
	defb 004h,040h,001h	; b351
	defb 005h,061h,003h	; b354
	defb 006h,073h,005h	; b357
	defb 0ffh	; b35a

; ----------------------------------------------------------------------
; DATOS paleta_vacia: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:5408 (1 bytes)
;   0xb35b..0xb35c  (1 bytes)
DATA_paleta_vacia:
	defb 0ffh	; b35b

; ----------------------------------------------------------------------
; DATOS paletas_de_sala5: 5 palabras: la paleta de la sala 5 de cada ruina
;   (p00:53F5); lo leen p00:53F2 (10 bytes)
;   0xb35c..0xb366  (10 bytes)
DATA_paletas_de_sala5:
	defb 066h,0b3h	; b35c
	defb 07ch,0b3h	; b35e
	defb 092h,0b3h	; b360
	defb 0a8h,0b3h	; b362
	defb 0beh,0b3h	; b364

; ----------------------------------------------------------------------
; DATOS paleta_sala5_r0: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53F2 (22 bytes)
;   0xb366..0xb37c  (22 bytes)
DATA_paleta_sala5_r0:
	defb 001h,010h,000h	; b366
	defb 002h,000h,000h	; b369
	defb 003h,023h,006h	; b36c
	defb 004h,062h,005h	; b36f
	defb 005h,040h,002h	; b372
	defb 007h,033h,003h	; b375
	defb 008h,055h,005h	; b378
	defb 0ffh	; b37b

; ----------------------------------------------------------------------
; DATOS paleta_sala5_r1: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53F2 (22 bytes)
;   0xb37c..0xb392  (22 bytes)
DATA_paleta_sala5_r1:
	defb 001h,002h,000h	; b37c
	defb 002h,001h,000h	; b37f
	defb 003h,044h,003h	; b382
	defb 004h,035h,006h	; b385
	defb 005h,003h,003h	; b388
	defb 007h,033h,003h	; b38b
	defb 008h,055h,005h	; b38e
	defb 0ffh	; b391

; ----------------------------------------------------------------------
; DATOS paleta_sala5_r2: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53F2 (22 bytes)
;   0xb392..0xb3a8  (22 bytes)
DATA_paleta_sala5_r2:
	defb 001h,010h,000h	; b392
	defb 002h,005h,003h	; b395
	defb 003h,024h,005h	; b398
	defb 004h,053h,004h	; b39b
	defb 005h,031h,001h	; b39e
	defb 007h,033h,003h	; b3a1
	defb 008h,055h,005h	; b3a4
	defb 0ffh	; b3a7

; ----------------------------------------------------------------------
; DATOS paleta_sala5_r3: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53F2 (22 bytes)
;   0xb3a8..0xb3be  (22 bytes)
DATA_paleta_sala5_r3:
	defb 001h,020h,001h	; b3a8
	defb 002h,010h,000h	; b3ab
	defb 003h,064h,005h	; b3ae
	defb 004h,052h,004h	; b3b1
	defb 005h,041h,002h	; b3b4
	defb 007h,033h,003h	; b3b7
	defb 008h,055h,005h	; b3ba
	defb 0ffh	; b3bd

; ----------------------------------------------------------------------
; DATOS paleta_sala5_r4: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53F2 (22 bytes)
;   0xb3be..0xb3d4  (22 bytes)
DATA_paleta_sala5_r4:
	defb 001h,011h,001h	; b3be
	defb 002h,000h,000h	; b3c1
	defb 003h,001h,002h	; b3c4
	defb 004h,066h,006h	; b3c7
	defb 005h,033h,003h	; b3ca
	defb 007h,033h,003h	; b3cd
	defb 008h,055h,005h	; b3d0
	defb 0ffh	; b3d3

; ----------------------------------------------------------------------
; DATOS paleta_p73AE: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p04:73AE (10 bytes)
;   0xb3d4..0xb3de  (10 bytes)
DATA_paleta_p73AE:
	defb 001h,020h,001h	; b3d4
	defb 002h,041h,002h	; b3d7
	defb 003h,062h,004h	; b3da
	defb 0ffh	; b3dd

; ----------------------------------------------------------------------
; DATOS escenas_paleta: 12 palabras: la paleta de cada escena (p04:7387:
;   p06:B3DE[0xC220]); lo leen p04:7384 (24 bytes)
;   0xb3de..0xb3f6  (24 bytes)
DATA_escenas_paleta:
	defb 0f6h,0b3h	; b3de
	defb 0f6h,0b3h	; b3e0
	defb 01bh,0b4h	; b3e2
	defb 02bh,0b4h	; b3e4
	defb 097h,0b4h	; b3e6
	defb 0a1h,0b4h	; b3e8
	defb 0bah,0b4h	; b3ea
	defb 0d6h,0b4h	; b3ec
	defb 0e3h,0b4h	; b3ee
	defb 0fch,0b4h	; b3f0
	defb 01bh,0b5h	; b3f2
	defb 03ah,0b5h	; b3f4

; ----------------------------------------------------------------------
; DATOS paleta_escena_B3F6: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p04:7384 (37 bytes)
;   0xb3f6..0xb41b  (37 bytes)
DATA_paleta_escena_B3F6:
	defb 001h,047h,005h	; b3f6
	defb 002h,033h,005h	; b3f9
	defb 003h,011h,003h	; b3fc
	defb 005h,003h,003h	; b3ff
	defb 006h,073h,005h	; b402
	defb 007h,053h,004h	; b405
	defb 008h,031h,002h	; b408
	defb 009h,073h,003h	; b40b
	defb 00ah,070h,000h	; b40e
	defb 00bh,024h,003h	; b411
	defb 00ch,047h,005h	; b414
	defb 00eh,005h,005h	; b417
	defb 0ffh	; b41a

; ----------------------------------------------------------------------
; DATOS paleta_escena_B41B: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p04:7384 (16 bytes)
;   0xb41b..0xb42b  (16 bytes)
DATA_paleta_escena_B41B:
	defb 001h,047h,006h	; b41b
	defb 002h,054h,005h	; b41e
	defb 003h,053h,004h	; b421
	defb 004h,042h,003h	; b424
	defb 007h,031h,002h	; b427
	defb 0ffh	; b42a

; ----------------------------------------------------------------------
; DATOS paleta_escena_B42B: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p04:7384 (25 bytes)
;   0xb42b..0xb444  (25 bytes)
DATA_paleta_escena_B42B:
	defb 001h,003h,001h	; b42b
	defb 002h,042h,003h	; b42e
	defb 003h,020h,000h	; b431
	defb 004h,010h,000h	; b434
	defb 005h,000h,002h	; b437
	defb 007h,000h,000h	; b43a
	defb 008h,000h,000h	; b43d
	defb 009h,077h,007h	; b440
	defb 0ffh	; b443

; ----------------------------------------------------------------------
; DATOS paletas_p6526: 4 palabras: la paleta de p04:6526 (p06:B444[4 - A]); lo
;   leen p04:6526 (8 bytes)
;   0xb444..0xb44c  (8 bytes)
DATA_paletas_p6526:
	defb 04ch,0b4h	; b444
	defb 065h,0b4h	; b446
	defb 07eh,0b4h	; b448
	defb 0a1h,0b4h	; b44a

; ----------------------------------------------------------------------
; DATOS paleta_p6526_0: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p04:6526 (25 bytes)
;   0xb44c..0xb465  (25 bytes)
DATA_paleta_p6526_0:
	defb 001h,014h,002h	; b44c
	defb 002h,042h,003h	; b44f
	defb 003h,020h,001h	; b452
	defb 004h,010h,000h	; b455
	defb 005h,000h,002h	; b458
	defb 007h,000h,000h	; b45b
	defb 008h,000h,000h	; b45e
	defb 009h,067h,007h	; b461
	defb 0ffh	; b464

; ----------------------------------------------------------------------
; DATOS paleta_p6526_1: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p04:6526 (25 bytes)
;   0xb465..0xb47e  (25 bytes)
DATA_paleta_p6526_1:
	defb 001h,025h,003h	; b465
	defb 002h,053h,004h	; b468
	defb 003h,031h,002h	; b46b
	defb 004h,020h,001h	; b46e
	defb 005h,011h,003h	; b471
	defb 007h,010h,001h	; b474
	defb 008h,000h,001h	; b477
	defb 009h,057h,007h	; b47a
	defb 0ffh	; b47d

; ----------------------------------------------------------------------
; DATOS paleta_p6526_2: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p04:6526 (25 bytes)
;   0xb47e..0xb497  (25 bytes)
DATA_paleta_p6526_2:
	defb 001h,036h,004h	; b47e
	defb 002h,053h,004h	; b481
	defb 003h,042h,003h	; b484
	defb 004h,031h,002h	; b487
	defb 005h,022h,004h	; b48a
	defb 007h,021h,001h	; b48d
	defb 008h,011h,002h	; b490
	defb 009h,047h,006h	; b493
	defb 0ffh	; b496

; ----------------------------------------------------------------------
; DATOS paleta_escena_B497: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p04:7384 (10 bytes)
;   0xb497..0xb4a1  (10 bytes)
DATA_paleta_escena_B497:
	defb 007h,073h,005h	; b497
	defb 005h,040h,001h	; b49a
	defb 006h,061h,003h	; b49d
	defb 0ffh	; b4a0

; ----------------------------------------------------------------------
; DATOS paleta_escena_B4A1: paleta: ternas [registro][RB][G] hasta 0xFF; se
;   solapan 2 bloques: (paleta_p6526_3 B4A1-B4BA); lo leen p04:7384, p04:6526
;   (25 bytes)
;   0xb4a1..0xb4ba  (25 bytes)
DATA_paleta_escena_B4A1:
	defb 001h,047h,006h	; b4a1
	defb 002h,054h,005h	; b4a4
	defb 003h,053h,004h	; b4a7
	defb 004h,042h,003h	; b4aa
	defb 005h,033h,005h	; b4ad
	defb 007h,031h,002h	; b4b0
	defb 008h,011h,003h	; b4b3
	defb 009h,047h,006h	; b4b6
	defb 0ffh	; b4b9

; ----------------------------------------------------------------------
; DATOS paleta_escena_B4BA: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p04:7384 (28 bytes)
;   0xb4ba..0xb4d6  (28 bytes)
DATA_paleta_escena_B4BA:
	defb 001h,027h,004h	; b4ba
	defb 002h,054h,005h	; b4bd
	defb 003h,053h,004h	; b4c0
	defb 004h,042h,003h	; b4c3
	defb 005h,033h,005h	; b4c6
	defb 007h,031h,002h	; b4c9
	defb 008h,011h,003h	; b4cc
	defb 009h,047h,006h	; b4cf
	defb 00bh,007h,000h	; b4d2
	defb 0ffh	; b4d5

; ----------------------------------------------------------------------
; DATOS paleta_escena_B4D6: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p04:7384 (13 bytes)
;   0xb4d6..0xb4e3  (13 bytes)
DATA_paleta_escena_B4D6:
	defb 001h,067h,006h	; b4d6
	defb 002h,027h,002h	; b4d9
	defb 003h,005h,000h	; b4dc
	defb 004h,033h,003h	; b4df
	defb 0ffh	; b4e2

; ----------------------------------------------------------------------
; DATOS paleta_escena_B4E3: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p04:7384 (25 bytes)
;   0xb4e3..0xb4fc  (25 bytes)
DATA_paleta_escena_B4E3:
	defb 001h,047h,005h	; b4e3
	defb 002h,033h,005h	; b4e6
	defb 003h,011h,003h	; b4e9
	defb 006h,073h,005h	; b4ec
	defb 007h,053h,004h	; b4ef
	defb 008h,031h,002h	; b4f2
	defb 009h,004h,001h	; b4f5
	defb 00eh,025h,003h	; b4f8
	defb 0ffh	; b4fb

; ----------------------------------------------------------------------
; DATOS paleta_escena_B4FC: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p04:7384 (31 bytes)
;   0xb4fc..0xb51b  (31 bytes)
DATA_paleta_escena_B4FC:
	defb 001h,047h,005h	; b4fc
	defb 002h,004h,001h	; b4ff
	defb 003h,025h,003h	; b502
	defb 004h,073h,007h	; b505
	defb 005h,053h,005h	; b508
	defb 006h,031h,003h	; b50b
	defb 007h,073h,005h	; b50e
	defb 008h,073h,003h	; b511
	defb 00bh,024h,003h	; b514
	defb 00ch,026h,006h	; b517
	defb 0ffh	; b51a

; ----------------------------------------------------------------------
; DATOS paleta_escena_B51B: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p04:7384 (31 bytes)
;   0xb51b..0xb53a  (31 bytes)
DATA_paleta_escena_B51B:
	defb 001h,076h,006h	; b51b
	defb 002h,072h,002h	; b51e
	defb 003h,050h,000h	; b521
	defb 004h,053h,005h	; b524
	defb 005h,031h,003h	; b527
	defb 006h,000h,000h	; b52a
	defb 007h,052h,003h	; b52d
	defb 008h,063h,004h	; b530
	defb 009h,021h,002h	; b533
	defb 00dh,077h,007h	; b536
	defb 0ffh	; b539

; ----------------------------------------------------------------------
; DATOS paleta_escena_B53A: paleta: ternas [registro][RB][G] hasta 0xFF; lo
;   leen p04:7384 (22 bytes)
;   0xb53a..0xb550  (22 bytes)
DATA_paleta_escena_B53A:
	defb 001h,017h,001h	; b53a
	defb 002h,037h,004h	; b53d
	defb 003h,042h,003h	; b540
	defb 004h,053h,004h	; b543
	defb 005h,000h,000h	; b546
	defb 007h,037h,003h	; b549
	defb 00dh,077h,007h	; b54c
	defb 0ffh	; b54f

; ----------------------------------------------------------------------
; DATOS paleta_p53E6: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:53E6 (25 bytes)
;   0xb550..0xb569  (25 bytes)
DATA_paleta_p53E6:
	defb 009h,021h,002h	; b550
	defb 005h,031h,003h	; b553
	defb 004h,053h,005h	; b556
	defb 006h,000h,000h	; b559
	defb 007h,051h,003h	; b55c
	defb 00bh,072h,005h	; b55f
	defb 00ch,020h,000h	; b562
	defb 008h,030h,000h	; b565
	defb 0ffh	; b568

; ----------------------------------------------------------------------
; DATOS piezas2_por_tipo: 63 bytes: el indice en p06:B5A8 de cada tipo de
;   actor (p02:8769); lo leen p02:8769 (63 bytes)
;   0xb569..0xb5a8  (63 bytes)
DATA_piezas2_por_tipo:
	defb 000h,000h,000h,000h,000h,000h,000h,001h,004h,001h,001h,00ah,001h,001h,002h,000h	; b569  ................
	defb 000h,000h,000h,000h,000h,001h,000h,001h,003h,006h,007h,009h,000h,000h,000h,000h	; b579  ................
	defb 000h,001h,005h,000h,000h,000h,001h,001h,001h,001h,001h,000h,000h,000h,001h,001h	; b589  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,000h,001h,001h,008h,008h	; b599  ...............

; ----------------------------------------------------------------------
; DATOS piezas2: 11 palabras: las listas de p02:8787; lo leen p02:8776 (22
;   bytes)
;   0xb5a8..0xb5be  (22 bytes)
DATA_piezas2:
	defb 0beh,0b5h	; b5a8
	defb 0c8h,0b5h	; b5aa
	defb 0d0h,0b5h	; b5ac
	defb 0d2h,0b5h	; b5ae
	defb 0d4h,0b5h	; b5b0
	defb 0d6h,0b5h	; b5b2
	defb 0dch,0b5h	; b5b4
	defb 0e0h,0b5h	; b5b6
	defb 0e4h,0b5h	; b5b8
	defb 0e6h,0b5h	; b5ba
	defb 0e8h,0b5h	; b5bc

; ----------------------------------------------------------------------
; DATOS piezas2_listas: pares que p02:8787 copia a la ficha del actor,
;   (ix+0x20) por tipo; lo leen p02:8787 (45 bytes)
;   0xb5be..0xb5eb  (45 bytes)
DATA_piezas2_listas:
	defb 007h,048h	; b5be
	defb 007h,048h	; b5c0
	defb 007h,048h	; b5c2
	defb 007h,048h	; b5c4
	defb 007h,048h	; b5c6
	defb 00dh,04eh	; b5c8
	defb 00dh,04eh	; b5ca
	defb 00dh,04eh	; b5cc
	defb 00dh,04eh	; b5ce
	defb 00ah,04dh	; b5d0
	defb 00ch,047h	; b5d2
	defb 00bh,04dh	; b5d4
	defb 00dh,00dh	; b5d6
	defb 00dh,04ah	; b5d8
	defb 00dh,04ah	; b5da
	defb 006h,049h	; b5dc
	defb 006h,049h	; b5de
	defb 00dh,04ah	; b5e0
	defb 00dh,04ah	; b5e2
	defb 00dh,00ah	; b5e4
	defb 00dh,00dh	; b5e6
	defb 008h,047h	; b5e8
	defb 008h	; b5ea

; ----------------------------------------------------------------------
; DATOS por_tipo_ix12: 63 bytes: (ix+0x12) de cada tipo de actor (p02:86D4);
;   lo leen p02:86D4 (63 bytes)
;   0xb5eb..0xb62a  (63 bytes)
DATA_por_tipo_ix12:
	defb 047h,001h,001h,001h,001h,003h,003h,004h,002h,001h,001h,006h,006h,004h,006h,004h	; b5eb  G...............
	defb 006h,001h,008h,002h,001h,005h,001h,001h,001h,020h,010h,002h,001h,001h,030h,020h	; b5fb  ......... ....0
	defb 020h,020h,00ah,00ah,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; b60b    ..............
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; b61b  ...............

; ----------------------------------------------------------------------
; DATOS por_tipo_ix20: 63 bytes: (ix+0x20), las piezas de cada tipo de actor
;   (p02:8641); lo leen p02:8641 (63 bytes)
;   0xb62a..0xb669  (63 bytes)
DATA_por_tipo_ix20:
	defb 001h,004h,002h,000h,002h,004h,008h,002h,004h,002h,004h,004h,004h,002h,002h,002h	; b62a  ................
	defb 004h,002h,002h,002h,002h,002h,002h,002h,002h,002h,004h,004h,002h,000h,008h,008h	; b63a  ................
	defb 008h,006h,008h,006h,002h,002h,002h,002h,002h,002h,000h,002h,002h,002h,002h,008h	; b64a  ................
	defb 008h,000h,000h,000h,000h,000h,000h,004h,002h,002h,002h,002h,002h,004h,002h	; b65a  ...............

; ----------------------------------------------------------------------
; DATOS por_tipo_ix20_64: un byte detras de los 63 de p06:B62A; ningun tipo lo
;   lee; lo leen nadie (1 bytes)
;   0xb669..0xb66a  (1 bytes)
DATA_por_tipo_ix20_64:
	defb 002h	; b669

; ======================================================================
; CODIGO 0xb66a..0xb6d3  (105 bytes)
; ======================================================================


L_B66A:
	ld a,(0c24bh)		;b66a   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;b66d
	ret z			;b66f
	ld hl,0c215h		;b670   ; apunta a el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld de,0c246h		;b673   ; apunta a la X del personaje
	ld a,(de)			;b676
	cp 0f2h		;b677
	jr nc,L_B691		;b679
	cp 00eh		;b67b
	jr nc,L_B6AB		;b67d
	ld a,(0ccb1h)		;b67f
	and a			;b682
	jr z,L_B68B		;b683
	ld a,(0c21ah)		;b685   ; lee la vecina de la izquierda
	inc a			;b688
	jr z,L_B6A3		;b689
L_B68B:
	ld (hl),003h		;b68b
	ld a,0f0h		;b68d
	ld (de),a			;b68f
	ret			;b690
L_B691:
	ld a,(0ccb2h)		;b691
	and a			;b694
	jr z,L_B69D		;b695
	ld a,(0c21bh)		;b697   ; lee la vecina de la derecha
	inc a			;b69a
	jr z,L_B6A3		;b69b
L_B69D:
	ld (hl),004h		;b69d
	ld a,010h		;b69f
	ld (de),a			;b6a1
	ret			;b6a2
L_B6A3:
	call 047ebh		;b6a3   ; byte_5_del_personaje: A = el byte 5 de la ficha del personaje que se lleva
	ld (hl),000h		;b6a6
	jp 04752h		;b6a8
L_B6AB:
	ld de,0c244h		;b6ab   ; apunta a la Y del personaje
	ld a,(de)			;b6ae
	cp 020h		;b6af
	jr c,L_B6C1		;b6b1
	cp 0d4h		;b6b3
	ret c			;b6b5
	ld a,(0c219h)		;b6b6   ; lee la vecina de abajo
	inc a			;b6b9
	ret z			;b6ba
	ld (hl),002h		;b6bb
	ld a,024h		;b6bd
	ld (de),a			;b6bf
	ret			;b6c0
L_B6C1:
	ld a,(0c268h)		;b6c1
	or a			;b6c4
	jr nz,L_B6CD		;b6c5
	ld a,(0c24bh)		;b6c7   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 005h		;b6ca
	ret nz			;b6cc
L_B6CD:
	ld (hl),001h		;b6cd
	ld a,0d0h		;b6cf
	ld (de),a			;b6d1
	ret			;b6d2

; ----------------------------------------------------------------------
; DATOS medidas_por_tipo: 63 x 2 bytes por tipo de actor (p01:74B1:
;   p06:B6D3[(ix+0) - 1]); lo leen p01:74A9 (126 bytes)
;   0xb6d3..0xb751  (126 bytes)
DATA_medidas_por_tipo:
	defb 008h,010h	; b6d3
	defb 008h,008h	; b6d5
	defb 008h,008h	; b6d7
	defb 008h,008h	; b6d9
	defb 010h,006h	; b6db
	defb 00ch,008h	; b6dd
	defb 006h,006h	; b6df
	defb 008h,008h	; b6e1
	defb 008h,008h	; b6e3
	defb 008h,010h	; b6e5
	defb 008h,010h	; b6e7
	defb 008h,010h	; b6e9
	defb 006h,006h	; b6eb
	defb 008h,006h	; b6ed
	defb 008h,008h	; b6ef
	defb 008h,010h	; b6f1
	defb 008h,008h	; b6f3
	defb 010h,008h	; b6f5
	defb 008h,008h	; b6f7
	defb 008h,008h	; b6f9
	defb 008h,008h	; b6fb
	defb 008h,004h	; b6fd
	defb 008h,008h	; b6ff
	defb 008h,006h	; b701
	defb 008h,008h	; b703
	defb 008h,008h	; b705
	defb 008h,008h	; b707
	defb 008h,008h	; b709
	defb 008h,008h	; b70b
	defb 00eh,00eh	; b70d
	defb 00eh,00eh	; b70f
	defb 00eh,00eh	; b711
	defb 00ch,010h	; b713
	defb 008h,008h	; b715
	defb 008h,008h	; b717
	defb 004h,004h	; b719
	defb 004h,004h	; b71b
	defb 008h,008h	; b71d
	defb 008h,008h	; b71f
	defb 008h,008h	; b721
	defb 008h,008h	; b723
	defb 008h,008h	; b725
	defb 008h,008h	; b727
	defb 008h,006h	; b729
	defb 006h,006h	; b72b
	defb 006h,006h	; b72d
	defb 010h,010h	; b72f
	defb 008h,008h	; b731
	defb 008h,008h	; b733
	defb 008h,008h	; b735
	defb 008h,008h	; b737
	defb 008h,008h	; b739
	defb 008h,008h	; b73b
	defb 008h,008h	; b73d
	defb 008h,008h	; b73f
	defb 008h,008h	; b741
	defb 006h,005h	; b743
	defb 008h,008h	; b745
	defb 006h,006h	; b747
	defb 008h,008h	; b749
	defb 008h,008h	; b74b
	defb 008h,008h	; b74d
	defb 008h,008h	; b74f

; ======================================================================
; CODIGO 0xb751..0xb7ed  (156 bytes)
; ======================================================================


L_B751:
	xor a			;b751
	ld (0c205h),a		;b752   ; guarda los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	ld bc,00400h		;b755
	ld hl,0fcc1h		;b758
L_B75B:
	push bc			;b75b
	push hl			;b75c
	ld a,(hl)			;b75d
	bit 7,a		;b75e
	jr nz,L_B771		;b760
	call busca_cartucho		;b762   ; busca_cartucho: 07 49, 50, 51 o 52 en 0x4012 de la ranura C: bits 0-3 de 0xC205
L_B765:
	pop hl			;b765
	pop bc			;b766
	ld a,(0c205h)		;b767   ; lee los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	and a			;b76a
	ret nz			;b76b
	inc hl			;b76c
	inc c			;b76d
	djnz L_B75B		;b76e
	ret			;b770
L_B771:
	call busca_en_subranuras		;b771   ; busca_en_subranuras: las 4 subranuras de la ranura C (p06:B78D)
	jr L_B765		;b774
busca_en_subranuras:		; las 4 subranuras de la ranura C (p06:B78D)
	and 080h		;b776
	or c			;b778
	ld c,a			;b779
	ld b,004h		;b77a
L_B77C:
	push bc			;b77c
	call busca_cartucho		;b77d   ; busca_cartucho: 07 49, 50, 51 o 52 en 0x4012 de la ranura C: bits 0-3 de 0xC205
	pop bc			;b780
	ld a,(0c205h)		;b781   ; lee los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	and a			;b784
	ret nz			;b785
	ld a,c			;b786
	add a,004h		;b787
	ld c,a			;b789
	djnz L_B77C		;b78a
	ret			;b78c
busca_cartucho:		; 07 49, 50, 51 o 52 en 0x4012 de la ranura C: bits 0-3 de 0xC205
	ld de,0b7edh		;b78d
	ld hl,04012h		;b790
	ld b,002h		;b793
	call compara_en_ranura		;b795   ; compara_en_ranura: acarreo si los B bytes de la ranura C (RDSLT) son los de DE
	jr nc,L_B7A0		;b798
	ld hl,0c205h		;b79a   ; apunta a los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	set 0,(hl)		;b79d
	ret			;b79f
L_B7A0:
	ld de,0b7efh		;b7a0
	ld hl,04012h		;b7a3
	ld b,002h		;b7a6
	call compara_en_ranura		;b7a8   ; compara_en_ranura: acarreo si los B bytes de la ranura C (RDSLT) son los de DE
	jr nc,L_B7B3		;b7ab
	ld hl,0c205h		;b7ad   ; apunta a los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	set 1,(hl)		;b7b0
	ret			;b7b2
L_B7B3:
	ld de,0b7f1h		;b7b3
	ld hl,04012h		;b7b6
	ld b,002h		;b7b9
	call compara_en_ranura		;b7bb   ; compara_en_ranura: acarreo si los B bytes de la ranura C (RDSLT) son los de DE
	jr nc,L_B7C6		;b7be
	ld hl,0c205h		;b7c0   ; apunta a los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	set 2,(hl)		;b7c3
	ret			;b7c5
L_B7C6:
	ld de,0b7f3h		;b7c6
	ld hl,04012h		;b7c9
	ld b,002h		;b7cc
	call compara_en_ranura		;b7ce   ; compara_en_ranura: acarreo si los B bytes de la ranura C (RDSLT) son los de DE
	ret nc			;b7d1
	ld hl,0c205h		;b7d2   ; apunta a los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	set 3,(hl)		;b7d5
	ret			;b7d7
compara_en_ranura:		; acarreo si los B bytes de la ranura C (RDSLT) son los de DE
	push bc			;b7d8   ; el byte HL de la ranura C (RDSLT)
	push de			;b7d9
	ld a,c			;b7da
	call 0000ch		;b7db   ; BIOS RDSLT - Reads the value of an address in another slot
	pop de			;b7de
	pop bc			;b7df
	ex de,hl			;b7e0
	cp (hl)			;b7e1   ; contra (DE): si no coincide, sin acarreo
	ex de,hl			;b7e2
	jr nz,L_B7EB		;b7e3
	inc hl			;b7e5
	inc de			;b7e6
	djnz compara_en_ranura		;b7e7
	scf			;b7e9
	ret			;b7ea
L_B7EB:
	and a			;b7eb
	ret			;b7ec

; ----------------------------------------------------------------------
; DATOS otros_cartuchos: 4 x 2 bytes: 07 49, 07 50, 07 51 y 07 52, lo que
;   p06:B78D-B7C6 busca en 0x4012 de cada ranura (RDSLT) y apunta en los bits
;   0-3 de 0xC205; lo leen p06:B78D (8 bytes)
;   0xb7ed..0xb7f5  (8 bytes)
DATA_otros_cartuchos:
	defb 007h,049h	; b7ed
	defb 007h,050h	; b7ef
	defb 007h,051h	; b7f1
	defb 007h,052h	; b7f3

; ======================================================================
; CODIGO 0xb7f5..0xb8f3  (254 bytes)
; ======================================================================


L_B7F5:
	ld de,0e322h		;b7f5   ; apunta a las puertas abiertas de la antesala
	xor a			;b7f8
	ld (de),a			;b7f9
	ld a,(0cc10h)		;b7fa   ; lee la pantalla de la antesala (0-2)
	add a,a			;b7fd
	add a,a			;b7fe
	add a,a			;b7ff
	add a,a			;b800
	ld hl,0e328h		;b801   ; apunta a las puertas de la antesala (8 bytes cada una)
	call 04083h		;b804   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;b807
	and a			;b808
	push hl			;b809
	call z,cuenta_e328		;b80a   ; cuenta_e328: cuantas puertas de 0xE328 hay abiertas
	pop hl			;b80d
	ret c			;b80e
	ld a,(0cc10h)		;b80f   ; lee la pantalla de la antesala (0-2)
	cp 002h		;b812
	ret z			;b814
	ld a,008h		;b815
	call 04083h		;b817   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;b81a
	and a			;b81b
	ret nz			;b81c
cuenta_e328:		; cuantas puertas de 0xE328 hay abiertas
	inc l			;b81d
	ld a,(hl)			;b81e
	and a			;b81f
	jr z,L_B837		;b820
	exx			;b822
	ld bc,00400h		;b823
	ld hl,0e328h		;b826   ; apunta a las puertas de la antesala (8 bytes cada una)
L_B829:
	ld a,(hl)			;b829
	and a			;b82a
	jr nz,L_B82E		;b82b
	inc c			;b82d
L_B82E:
	ld a,l			;b82e   ; 8 bytes por puerta; C cuenta las cerradas
	add a,008h		;b82f
	ld l,a			;b831
	djnz L_B829		;b832
	ld a,c			;b834
	exx			;b835
	ld (de),a			;b836
L_B837:
	ld a,(0cc10h)		;b837   ; lee la pantalla de la antesala (0-2)
	cp 002h		;b83a
	ld b,00ch		;b83c
	jr c,L_B842		;b83e
	ld b,010h		;b840
L_B842:
	inc l			;b842
	ld (0e320h),hl		;b843
	ld a,(hl)			;b846
	add a,b			;b847
	ld b,a			;b848
	ld a,(0c2b0h)		;b849   ; lee la ficha del personaje 0 (14 bytes)
	ld c,a			;b84c
	ld a,(0c2d0h)		;b84d   ; lee la ficha del personaje 1 (14 bytes)
	or c			;b850
	ld c,010h		;b851
	jr nz,L_B857		;b853
	ld c,020h		;b855
L_B857:
	ld a,(0cc13h)		;b857   ; lee la X en la antesala
	sub b			;b85a
	cp c			;b85b
	ret nc			;b85c
	ld a,(0c007h)		;b85d   ; lee las teclas que hay
	and 00ch		;b860
	ret nz			;b862
	scf			;b863
	ret			;b864
L_B865:
	ld a,0c3h		;b865
	ld (0cc12h),a		;b867
	ld a,030h		;b86a
	ld (0cc13h),a		;b86c   ; guarda la X en la antesala
	ret			;b86f
L_B870:
	ld hl,0e328h		;b870   ; apunta a las puertas de la antesala (8 bytes cada una)
	ld b,005h		;b873
L_B875:
	ld (hl),0ffh		;b875
	ld a,l			;b877
	add a,008h		;b878
	ld l,a			;b87a
	djnz L_B875		;b87b
	ld de,0e328h		;b87d   ; apunta a las puertas de la antesala (8 bytes cada una)
	ld hl,0be3dh		;b880
	ld a,(0c21dh)		;b883   ; lee la ruina (0-4)
	add a,a			;b886
	ld b,a			;b887
	add a,a			;b888
	add a,b			;b889
	call 04083h		;b88a   ; hl_mas_a: HL = HL + A
L_B88D:
	ld a,(hl)			;b88d   ; [puerta]: 0xFF acaba
	ld c,a			;b88e
	inc a			;b88f
	ret z			;b890
	xor a			;b891   ; al registro: 0 (cerrada), el bit 0 (grande) y la X
	ld (de),a			;b892
	inc e			;b893
	ld a,c			;b894
	and 001h		;b895
	ld (de),a			;b897
	inc e			;b898
	ld a,c			;b899
	and 0feh		;b89a
	ld (de),a			;b89c
	inc hl			;b89d
	ld a,006h		;b89e   ; 8 bytes por registro (6 + los 2 de antes)
	call 04088h		;b8a0   ; de_mas_a: DE = DE + A
	jr L_B88D		;b8a3
colores_de_la_antesala:		; los colores de sprite de los dos personajes (p06:B8F3/B8F7)
	ld de,0cc20h		;b8a5
	ld a,(0c2d0h)		;b8a8   ; lee la ficha del personaje 1 (14 bytes)
	and a			;b8ab
	jr nz,L_B8B6		;b8ac
	ld hl,0b8f7h		;b8ae
	ld bc,00004h		;b8b1
	ldir		;b8b4
L_B8B6:
	ld a,(0c2b0h)		;b8b6   ; lee la ficha del personaje 0 (14 bytes)
	and a			;b8b9
	jp nz,L_B8C5		;b8ba
	ld hl,0b8f3h		;b8bd
	ld bc,00004h		;b8c0
	ldir		;b8c3
L_B8C5:
	ld de,0dc00h		;b8c5   ; apunta a los colores de los sprites en RAM (16 por sprite)
	ld hl,0c2d0h		;b8c8   ; apunta a la ficha del personaje 1 (14 bytes)
	exx			;b8cb
	ld a,(0c2d0h)		;b8cc   ; lee la ficha del personaje 1 (14 bytes)
	and a			;b8cf
	ld hl,0bf64h		;b8d0
	jr z,L_B8D8		;b8d3
	ld hl,0bf68h		;b8d5
L_B8D8:
	exx			;b8d8
	call colores_de_personaje		;b8d9   ; colores_de_personaje: 4 x 16 colores de HL' en DE si el personaje vive
	ld hl,0c2b0h		;b8dc   ; apunta a la ficha del personaje 0 (14 bytes)
colores_de_personaje:		; 4 x 16 colores de HL' en DE si el personaje vive
	ld a,(hl)			;b8df
	and a			;b8e0
	ret nz			;b8e1
	ld b,004h		;b8e2
L_B8E4:
	exx			;b8e4   ; un color del personaje (HL') a 16 bytes de 0xDC00
	ld a,(hl)			;b8e5
	inc hl			;b8e6
	exx			;b8e7
	push bc			;b8e8
	ld b,010h		;b8e9
L_B8EB:
	ld (de),a			;b8eb   ; 16 bytes de A
	inc de			;b8ec
	djnz L_B8EB		;b8ed
	pop bc			;b8ef
	djnz L_B8E4		;b8f0
	ret			;b8f2

; ----------------------------------------------------------------------
; DATOS tablas_pB8A5: 2 x 4 bytes que p06:B8BD y p06:B8AE copian a 0xCC20
;   segun 0xC2B0 y 0xC2D0; lo leen p06:B8A5 (8 bytes)
;   0xb8f3..0xb8fb  (8 bytes)
DATA_tablas_pB8A5:
	defb 000h,004h,008h,00ch	; b8f3
	defb 020h,024h,028h,02ch	; b8f7

; ======================================================================
; CODIGO 0xb8fb..0xbd80  (1157 bytes)
; ======================================================================


L_B8FB:
	ld hl,0cc10h		;b8fb   ; apunta a la pantalla de la antesala (0-2)
	ld de,0cc13h		;b8fe   ; apunta a la X en la antesala
	ld a,(de)			;b901
	cp 008h		;b902
	jr c,L_B90F		;b904
	cp 0f8h		;b906
	ret c			;b908
	inc (hl)			;b909
	ld a,00ah		;b90a
	ld (de),a			;b90c
	jr L_B913		;b90d
L_B90F:
	dec (hl)			;b90f
	ld a,0f6h		;b910
	ld (de),a			;b912
L_B913:
	call 04a1fh		;b913   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	call 04a44h		;b916   ; esconde_sprites: Y = 0xE0 en las dos tablas de atributos (0x7600 y 0xF600)
	ld a,(0cc10h)		;b919   ; lee la pantalla de la antesala (0-2)
	add a,a			;b91c
	add a,a			;b91d
	ld h,000h		;b91e
	ld l,a			;b920
	add hl,hl			;b921
	add hl,hl			;b922
	ld d,h			;b923
	ld e,l			;b924
	add hl,hl			;b925
	add hl,de			;b926
	ld de,0ec00h		;b927   ; apunta a el mapa de la fase (48 bytes por pantalla)
	add hl,de			;b92a
	call 05a11h		;b92b
	call 05a1ah		;b92e   ; pinta_d200: las 32 x 24 fichas de 0xD200 desde la linea 20 (p00:4DB4)
	call compone_puertas		;b931   ; compone_puertas: compone en la pagina 1 los marcos y hojas de las puertas
	call puertas_de_la_pantalla		;b934   ; puertas_de_la_pantalla: las dos puertas de la pantalla 0xCC10 (p06:B97B)
	call puerta_grande		;b937   ; puerta_grande: en la pantalla 2 de la antesala, la puerta grande (p06:B998)
	call 04713h		;b93a
	jp 04a12h		;b93d   ; pantalla_encendida: R#1 con el bit 6 (pantalla) y sprites encendidos
puerta_grande:		; en la pantalla 2 de la antesala, la puerta grande (p06:B998)
	ld a,(0cc10h)		;b940   ; lee la pantalla de la antesala (0-2)
	cp 002h		;b943
	ret nz			;b945
	ld de,0e0a3h		;b946
	push de			;b949
	ex de,hl			;b94a
	ld de,020a0h		;b94b
	ld bc,02020h		;b94e
	ld a,004h		;b951
	call 04bdeh		;b953   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop de			;b956
	ld hl,000a0h		;b957
	ld bc,02020h		;b95a
	jr copia_timp		;b95d
puertas_de_la_pantalla:		; las dos puertas de la pantalla 0xCC10 (p06:B97B)
	ld a,(0cc10h)		;b95f   ; lee la pantalla de la antesala (0-2)
	push af			;b962
	add a,a			;b963
	add a,a			;b964
	add a,a			;b965
	add a,a			;b966
	ld hl,0e328h		;b967   ; apunta a las puertas de la antesala (8 bytes cada una)
	call 04083h		;b96a   ; hl_mas_a: HL = HL + A
	push hl			;b96d
	call puerta		;b96e   ; puerta: el marco y, si esta cerrada, la hoja
	pop hl			;b971
	pop af			;b972
	cp 002h		;b973
	ret z			;b975
	ld a,008h		;b976
	call 04083h		;b978   ; hl_mas_a: HL = HL + A
puerta:		; el marco y, si esta cerrada, la hoja
	call marco_de_puerta		;b97b   ; el marco; si la puerta esta abierta, nada mas
	ld a,(hl)			;b97e
	and a			;b97f
	ret nz			;b980
	ld e,0a3h		;b981   ; la hoja cerrada en (X + 8 o + 0x0C, 0xA3)
	inc l			;b983
	inc l			;b984
	ld d,(hl)			;b985
	dec l			;b986
	ld a,(hl)			;b987
	and a			;b988
	ld c,008h		;b989
	jr z,L_B98F		;b98b
	ld c,00ch		;b98d
L_B98F:
	ld a,d			;b98f
	add a,c			;b990
	ld d,a			;b991
	ld hl,04068h		;b992
	ld bc,01820h		;b995
copia_timp:		; p00:4C73 con TIMP (0x48)
	ld a,048h		;b998
	jp 04c73h		;b99a   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
marco_de_puerta:		; el marco pequeno (0x28 x 0x28) o grande (0x30 x 0x38)
	push hl			;b99d   ; el marco: pequeno (0x28 x 0x28 en Y 0x9B) o grande (0x30 x 0x38 en Y 0x8B)
	ld e,09bh		;b99e   ; la Y del marco pequeno: 0x9B
	inc l			;b9a0
	inc l			;b9a1
	ld d,(hl)			;b9a2   ; D = la X de la puerta; (HL + 1): grande o pequena
	dec l			;b9a3
	ld a,(hl)			;b9a4
	and a			;b9a5
	ld bc,02828h		;b9a6
	jr z,L_B9B0		;b9a9
	ld bc,03038h		;b9ab   ; el grande: 0x30 x 0x38 en Y 0x8B
	ld e,08bh		;b9ae
L_B9B0:
	ld hl,01068h		;b9b0
	call copia_timp		;b9b3   ; copia_timp: p00:4C73 con TIMP (0x48)
	pop hl			;b9b6
	ld a,(hl)			;b9b7
	and a			;b9b8
	ret z			;b9b9
	push hl			;b9ba
	ld a,(0cc10h)		;b9bb   ; lee la pantalla de la antesala (0-2)
	cp 002h		;b9be
	ld c,004h		;b9c0
	jr nz,L_B9C6		;b9c2
	ld c,008h		;b9c4
L_B9C6:
	inc l			;b9c6   ; la puerta abierta: 0x20 x 0x10 de (0x88, 0x40) en (X + C, 0xB3)
	inc l			;b9c7
	ld a,(hl)			;b9c8
	add a,c			;b9c9
	ld d,a			;b9ca
	ld e,0b3h		;b9cb
	ld hl,04088h		;b9cd
	ld bc,02010h		;b9d0
	call copia_timp		;b9d3   ; copia_timp: p00:4C73 con TIMP (0x48)
	pop hl			;b9d6
	ret			;b9d7
compone_puertas:		; compone en la pagina 1 los marcos y hojas de las puertas
	ld a,001h		;b9d8
	ld (0c20bh),a		;b9da   ; guarda las fichas van a la pagina 1
	ld a,(0cc10h)		;b9dd   ; lee la pantalla de la antesala (0-2)
	cp 002h		;b9e0
	jr z,L_B9FB		;b9e2
	ld hl,0bd80h		;b9e4
	ld bc,00505h		;b9e7
	call bloque_en_1068		;b9ea   ; bloque_en_1068: p06:BA24 en (0x10, 0x68)
	ld hl,0bd99h		;b9ed
	ld bc,00403h		;b9f0
	ld de,04068h		;b9f3
	call bloque_de_fichas		;b9f6   ; bloque_de_fichas: B filas de C fichas de HL en (D, E)
	jr L_BA10		;b9f9
L_B9FB:
	ld hl,0bda5h		;b9fb
	ld bc,00706h		;b9fe
	call bloque_en_1068		;ba01   ; bloque_en_1068: p06:BA24 en (0x10, 0x68)
	ld hl,0bdcfh		;ba04
	ld bc,00403h		;ba07
	ld de,04068h		;ba0a
	call bloque_de_fichas		;ba0d   ; bloque_de_fichas: B filas de C fichas de HL en (D, E)
L_BA10:
	ld hl,0bddbh		;ba10
	ld bc,00204h		;ba13
	ld de,04088h		;ba16
	call bloque_de_fichas		;ba19   ; bloque_de_fichas: B filas de C fichas de HL en (D, E)
L_BA1C:
	xor a			;ba1c
	ld (0c20bh),a		;ba1d   ; guarda las fichas van a la pagina 1
	ret			;ba20
bloque_en_1068:		; p06:BA24 en (0x10, 0x68)
	ld de,01068h		;ba21
bloque_de_fichas:		; B filas de C fichas de HL en (D, E)
	push bc			;ba24
	push de			;ba25
	ld b,c			;ba26
L_BA27:
	ld a,(hl)			;ba27   ; una fila de C fichas
	call 04db4h		;ba28   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	inc hl			;ba2b
	ld a,d			;ba2c
	add a,008h		;ba2d
	ld d,a			;ba2f
	djnz L_BA27		;ba30
	pop de			;ba32   ; la siguiente fila
	ld a,e			;ba33
	add a,008h		;ba34
	ld e,a			;ba36
	pop bc			;ba37
	djnz bloque_de_fichas		;ba38
	ret			;ba3a
L_BA3B:
	ld a,001h		;ba3b
	ld (0c20bh),a		;ba3d   ; guarda las fichas van a la pagina 1
	ld a,(0c21dh)		;ba40   ; lee la ruina (0-4)
	ld hl,0bde3h		;ba43
	call 0543ah		;ba46   ; palabra_a: HL = la palabra A de la tabla HL
	ld de,000a0h		;ba49
	ld b,004h		;ba4c
L_BA4E:
	push bc			;ba4e
	ld b,004h		;ba4f
	push de			;ba51
L_BA52:
	ld a,(hl)			;ba52   ; una fila de 4 fichas del dibujo de la ruina
	call 04db4h		;ba53   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	inc hl			;ba56
	ld a,d			;ba57
	add a,008h		;ba58
	ld d,a			;ba5a
	djnz L_BA52		;ba5b
	pop de			;ba5d   ; la siguiente fila
	ld a,e			;ba5e
	add a,008h		;ba5f
	ld e,a			;ba61
	pop bc			;ba62
	djnz L_BA4E		;ba63
	jp L_BA1C		;ba65
L_BA68:
	ld b,018h		;ba68
L_BA6A:
	push bc			;ba6a
	call 05346h		;ba6b   ; fase_de_la_ruina: A = 0xC211 - (ruina * 5 + 1): la fase dentro de la ruina
	add a,a			;ba6e
	add a,a			;ba6f
	add a,a			;ba70
	ld hl,0e328h		;ba71   ; apunta a las puertas de la antesala (8 bytes cada una)
	call 04083h		;ba74   ; hl_mas_a: HL = HL + A
	call marco_de_puerta		;ba77   ; marco_de_puerta: el marco pequeno (0x28 x 0x28) o grande (0x30 x 0x38)
	pop bc			;ba7a
	push bc			;ba7b
	ld e,0a3h		;ba7c
	inc l			;ba7e
	inc l			;ba7f
	ld d,(hl)			;ba80
	dec l			;ba81
	ld a,(hl)			;ba82
	and a			;ba83
	ld c,008h		;ba84
	jr z,L_BA8A		;ba86
	ld c,00ch		;ba88
L_BA8A:
	ld a,b			;ba8a
	sub 018h		;ba8b
	neg		;ba8d
	add a,c			;ba8f
	add a,d			;ba90
	ld d,a			;ba91
	ld hl,04068h		;ba92
	ld bc,01820h		;ba95
	call copia_timp		;ba98   ; copia_timp: p00:4C73 con TIMP (0x48)
	ld b,080h		;ba9b
L_BA9D:
	push bc			;ba9d
	ld b,000h		;ba9e
L_BAA0:
	djnz L_BAA0		;baa0   ; espera
	pop bc			;baa2
	djnz L_BA9D		;baa3
	pop bc			;baa5
	djnz L_BA6A		;baa6
	scf			;baa8
	ret			;baa9
sprites_de_la_antesala:		; los sprites de los personajes en la antesala (p06:BE2D)
	ld hl,0c2b0h		;baaa   ; apunta a la ficha del personaje 0 (14 bytes)
	ld bc,00200h		;baad
L_BAB0:
	ld a,(hl)			;bab0
	and a			;bab1
	jr nz,L_BAB5		;bab2
	inc c			;bab4
L_BAB5:
	ld de,00020h		;bab5   ; C = cuantos personajes viven
	add hl,de			;bab8
	djnz L_BAB0		;bab9
	ld de,0de00h		;babb   ; los sprites de los personajes: 4 por cada uno
	ld hl,0be2dh		;babe
	ld a,c			;bac1
	add a,a			;bac2
	add a,a			;bac3
	ld b,a			;bac4
	exx			;bac5
	ld hl,0cc20h		;bac6
	exx			;bac9
L_BACA:
	ld a,(0cc12h)		;baca   ; la X: 0xCC12 + dx
	add a,(hl)			;bacd
	ld (de),a			;bace
	inc hl			;bacf
	inc e			;bad0
	ld a,(0cc13h)		;bad1   ; la Y: 0xCC13 - dy; si se pasa, escondido (0xE0)
	sub (hl)			;bad4
	jr nc,L_BADC		;bad5
	dec e			;bad7
	ld a,0e0h		;bad8
	ld (de),a			;bada
	inc e			;badb
L_BADC:
	ld (de),a			;badc
	inc hl			;badd
	inc e			;bade
	ld a,(0cc16h)		;badf   ; lee el sentido en la antesala
	and a			;bae2
	ld a,010h		;bae3
	jr z,L_BAE8		;bae5
	xor a			;bae7
L_BAE8:
	exx			;bae8   ; el patron de 0xCC20 mas 0x10 si va a la izquierda (0xCC16)
	add a,(hl)			;bae9
	inc hl			;baea
	exx			;baeb
	ld (de),a			;baec
	inc e			;baed
	inc e			;baee
	djnz L_BACA		;baef
	ret			;baf1
L_BAF2:
	xor a			;baf2
	ld (0cc16h),a		;baf3   ; guarda el sentido en la antesala
	call sprites_de_la_antesala		;baf6   ; sprites_de_la_antesala: los sprites de los personajes en la antesala (p06:BE2D)
	call 05690h		;baf9   ; atributos_a_vram: 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
	ld de,0e0a3h		;bafc
	ld hl,020a0h		;baff
	ld b,h			;bb02
L_BB03:
	push bc			;bb03
	push hl			;bb04
	push de			;bb05
	ld bc,02001h		;bb06
	call 04841h		;bb09   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	pop de			;bb0c
	pop hl			;bb0d
	inc e			;bb0e
	inc l			;bb0f
	ld b,080h		;bb10
L_BB12:
	push bc			;bb12
	ld b,000h		;bb13
L_BB15:
	djnz L_BB15		;bb15   ; espera
	pop bc			;bb17
	djnz L_BB12		;bb18
	pop bc			;bb1a
	djnz L_BB03		;bb1b
	ret			;bb1d
L_BB1E:
	ld hl,03642h		;bb1e
	ld de,06078h		;bb21
	ld bc,0941ch		;bb24
	ld a,004h		;bb27
	call 04bdeh		;bb29   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	call recuadro_del_mensaje		;bb2c   ; recuadro_del_mensaje: borra y enmarca el recuadro de mensajes
	ld a,(0002bh)		;bb2f
	and 00fh		;bb32
	ld hl,0be69h		;bb34
	jr nz,L_BB46		;bb37
	ld a,(0cc10h)		;bb39   ; lee la pantalla de la antesala (0-2)
	cp 002h		;bb3c
	ld hl,0be5bh		;bb3e
	jr c,L_BB46		;bb41
	ld hl,0bedah		;bb43
L_BB46:
	jp 04d4ah		;bb46   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
recuadro_del_mensaje:		; borra y enmarca el recuadro de mensajes
	ld hl,03844h		;bb49
	ld bc,09018h		;bb4c
	call 05e2fh		;bb4f   ; borra_rectangulo: HMMV con 0xFF en la pagina 0
	ld hl,03642h		;bb52
	ld de,0941ch		;bb55
	call 0473bh		;bb58   ; rectangulo_color_d: p00:4B74 con el color 0x0D
	ld hl,03743h		;bb5b
	ld de,0921ah		;bb5e
	jp 0473bh		;bb61   ; rectangulo_color_d: p00:4B74 con el color 0x0D
L_BB64:
	ld hl,0c22ah		;bb64
	ld (hl),000h		;bb67
	ld a,(0c006h)		;bb69   ; lee las teclas nuevas
	and 01ch		;bb6c
	ret z			;bb6e
	and 00ch		;bb6f
	ld b,001h		;bb71
	jr z,L_BB76		;bb73
	inc b			;bb75
L_BB76:
	ld (hl),b			;bb76
	ret			;bb77
copia_6078:		; copia 0x94 x 0x1C de (0x78, 0x60) a (0x42, 0x36)
	ld de,03642h		;bb78
	ld hl,06078h		;bb7b
	ld bc,0941ch		;bb7e
	jp 04841h		;bb81   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
L_BB84:
	call recuadro_del_mensaje		;bb84   ; recuadro_del_mensaje: borra y enmarca el recuadro de mensajes
	ld a,(0cc10h)		;bb87   ; lee la pantalla de la antesala (0-2)
	cp 002h		;bb8a
	jr nc,L_BBB1		;bb8c
L_BB8E:
	ld a,(0002bh)		;bb8e
	and 00fh		;bb91
	ld a,(0c001h)		;bb93   ; lee el paso del estado
	jr nz,L_BBA4		;bb96
	cp 004h		;bb98
	ld hl,0be88h		;bb9a
	jr z,L_BBAE		;bb9d
	ld hl,0beb7h		;bb9f
	jr L_BBAE		;bba2
L_BBA4:
	cp 004h		;bba4
	ld hl,0be97h		;bba6
	jr z,L_BBAE		;bba9
	ld hl,0bec6h		;bbab
L_BBAE:
	jp 04d4ah		;bbae   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
L_BBB1:
	ld a,(0e322h)		;bbb1   ; lee las puertas abiertas de la antesala
	and a			;bbb4
	jr z,L_BB8E		;bbb5
	ld a,(0002bh)		;bbb7
	and 00fh		;bbba
	jr nz,L_BBCD		;bbbc
	ld hl,0beeah		;bbbe
	call 04d4ah		;bbc1   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	ld a,(0e322h)		;bbc4   ; lee las puertas abiertas de la antesala
	ld de,0704ch		;bbc7
	jp 047b4h		;bbca   ; cifra: la cifra A & 15 (0x21 + A) en (D, E), o espacio si es cero y C
L_BBCD:
	ld hl,0befah		;bbcd
	jr L_BBAE		;bbd0
L_BBD2:
	ld hl,03642h		;bbd2
	ld de,06078h		;bbd5
	ld bc,0941ch		;bbd8
	ld a,004h		;bbdb
	call 04bdeh		;bbdd   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	call recuadro_del_mensaje		;bbe0   ; recuadro_del_mensaje: borra y enmarca el recuadro de mensajes
	ld a,(0002bh)		;bbe3
	and 00fh		;bbe6
	ld hl,0bf29h		;bbe8
	jr nz,L_BBF0		;bbeb
	ld hl,0bf1bh		;bbed
L_BBF0:
	call 04d4ah		;bbf0   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	ld a,05ah		;bbf3
	ld (0c209h),a		;bbf5
	jp colores_de_la_antesala		;bbf8   ; colores_de_la_antesala: los colores de sprite de los dos personajes (p06:B8F3/B8F7)
L_BBFB:
	call sprites_de_la_antesala		;bbfb   ; sprites_de_la_antesala: los sprites de los personajes en la antesala (p06:BE2D)
	call 05690h		;bbfe   ; atributos_a_vram: 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
	or a			;bc01
	ld hl,0c209h		;bc02
	dec (hl)			;bc05
	ret nz			;bc06
	call copia_6078		;bc07   ; copia_6078: copia 0x94 x 0x1C de (0x78, 0x60) a (0x42, 0x36)
	scf			;bc0a
	ret			;bc0b
L_BC0C:
	xor a			;bc0c
	ld (0cc16h),a		;bc0d   ; guarda el sentido en la antesala
	ld (0cc17h),a		;bc10
	ld (0cc19h),a		;bc13
	ld a,078h		;bc16
	ld (0cc18h),a		;bc18
	ld a,(0c31ch)		;bc1b
	cp 003h		;bc1e
	jp nz,colores_de_la_antesala		;bc20   ; colores_de_la_antesala: los colores de sprite de los dos personajes (p06:B8F3/B8F7)
	ld a,(0c2d0h)		;bc23   ; lee la ficha del personaje 1 (14 bytes)
	inc a			;bc26
	ld (0cc19h),a		;bc27
	call vuelve_un_personaje		;bc2a   ; vuelve_un_personaje: la ficha inicial (p06:BF6C) del personaje que no vive
	call colores_de_la_antesala		;bc2d   ; colores_de_la_antesala: los colores de sprite de los dos personajes (p06:B8F3/B8F7)
L_BC30:
	ld de,0bf88h		;bc30
	jp 04926h		;bc33   ; rle_a_vram_con_destino: lee la direccion de VRAM de (DE) y sigue en p00:492C
vuelve_un_personaje:		; la ficha inicial (p06:BF6C) del personaje que no vive
	ld a,(0c2b0h)		;bc36   ; lee la ficha del personaje 0 (14 bytes)
	and a			;bc39
	ld hl,0bf6ch		;bc3a
	ld de,0c2b0h		;bc3d   ; apunta a la ficha del personaje 0 (14 bytes)
	jr nz,L_BC48		;bc40
	ld hl,0bf7ah		;bc42
	ld de,0c2d0h		;bc45   ; apunta a la ficha del personaje 1 (14 bytes)
L_BC48:
	ld bc,0000eh		;bc48
	ldir		;bc4b
	ret			;bc4d
L_BC4E:
	ld a,(0c31ch)		;bc4e
	and a			;bc51
	ret z			;bc52
	call 05690h		;bc53   ; atributos_a_vram: 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
	ld a,(0cc17h)		;bc56
	and a			;bc59
	jr nz,L_BCC2		;bc5a
	ld hl,0cc18h		;bc5c
	dec (hl)			;bc5f
	jr z,L_BCAE		;bc60
	call sprites_de_la_antesala		;bc62   ; sprites_de_la_antesala: los sprites de los personajes en la antesala (p06:BE2D)
	ld a,(0c31ch)		;bc65
	dec a			;bc68
	jr z,sprites_be35		;bc69
	dec a			;bc6b
	jr z,L_BC80		;bc6c
	ld b,004h		;bc6e
	ld hl,0de02h		;bc70   ; apunta a el patron del sprite 0 en RAM
L_BC73:
	ld a,(hl)			;bc73
	sub 010h		;bc74
	ld (hl),a			;bc76
	inc l			;bc77
	inc l			;bc78
	inc l			;bc79
	inc l			;bc7a
	djnz L_BC73		;bc7b
	call sprites_be35		;bc7d   ; sprites_be35: los sprites del personaje 1 con p06:BE35
L_BC80:
	ld de,0de00h		;bc80   ; apunta a los atributos de los sprites en RAM
	ld hl,0be2dh		;bc83
L_BC86:
	ld a,(0cc18h)		;bc86
	ld c,a			;bc89
	ld b,004h		;bc8a
L_BC8C:
	ld a,c			;bc8c   ; el sprite: escondido (0xE8) o en 0xC3 + (HL)
	and 004h		;bc8d
	ld a,0e8h		;bc8f
	jr nz,L_BC98		;bc91
	ld a,0c3h		;bc93
	add a,(hl)			;bc95
	inc l			;bc96
	inc l			;bc97
L_BC98:
	ld (de),a			;bc98   ; 4 sprites
	inc e			;bc99
	inc e			;bc9a
	inc e			;bc9b
	inc e			;bc9c
	djnz L_BC8C		;bc9d
	ret			;bc9f
sprites_be35:		; los sprites del personaje 1 con p06:BE35
	ld a,(0c2d0h)		;bca0   ; lee la ficha del personaje 1 (14 bytes)
	and a			;bca3
	jr nz,L_BC80		;bca4
	ld de,0de10h		;bca6   ; apunta a la Y del sprite 4 en RAM
	ld hl,0be35h		;bca9
	jr L_BC86		;bcac
L_BCAE:
	ld a,078h		;bcae
	ld (0cc18h),a		;bcb0
	ld a,(0c31ch)		;bcb3
	cp 003h		;bcb6
	jr nz,L_BCCC		;bcb8
	call cuadro_de_la_tienda		;bcba   ; cuadro_de_la_tienda: los colores (p06:BD0B) y los sprites de 0xDE20
	ld hl,0cc17h		;bcbd
	inc (hl)			;bcc0
	ret			;bcc1
L_BCC2:
	ld hl,0cc18h		;bcc2
	dec (hl)			;bcc5
	ret nz			;bcc6
	ld e,0e8h		;bcc7
	call sprites_de20		;bcc9   ; sprites_de20: los sprites de 0xDE20 junto a 0xCC13
L_BCCC:
	xor a			;bccc
	ld (0c31ch),a		;bccd
	jp sprites_de_la_antesala		;bcd0   ; sprites_de_la_antesala: los sprites de los personajes en la antesala (p06:BE2D)
cuadro_de_la_tienda:		; los colores (p06:BD0B) y los sprites de 0xDE20
	call colores_dc80		;bcd3   ; colores_dc80: 4 x 16 colores 0x0D/0x0A en 0xDC80
	ld e,090h		;bcd6
sprites_de20:		; los sprites de 0xDE20 junto a 0xCC13
	ld a,(0cc19h)		;bcd8
	dec a			;bcdb
	ld b,008h		;bcdc
	jr nz,L_BCE2		;bcde
	ld b,018h		;bce0
L_BCE2:
	ld hl,0de20h		;bce2   ; apunta a la Y del sprite 8 en RAM
	ld a,(0cc13h)		;bce5   ; lee la X en la antesala
	sub b			;bce8
	ld d,a			;bce9
	ld c,040h		;bcea
	call pon_atributo		;bcec   ; pon_atributo: (HL) = E, D, C
	ld c,044h		;bcef
	inc l			;bcf1
	inc l			;bcf2
	call pon_atributo		;bcf3   ; pon_atributo: (HL) = E, D, C
	ld a,d			;bcf6
	add a,010h		;bcf7
	ld d,a			;bcf9
	ld c,048h		;bcfa
	inc l			;bcfc
	inc l			;bcfd
	call pon_atributo		;bcfe   ; pon_atributo: (HL) = E, D, C
	ld c,04ch		;bd01
	inc l			;bd03
	inc l			;bd04
pon_atributo:		; (HL) = E, D, C
	ld (hl),e			;bd05   ; Y, X y patron
	inc l			;bd06
	ld (hl),d			;bd07
	inc l			;bd08
	ld (hl),c			;bd09
	ret			;bd0a
colores_dc80:		; 4 x 16 colores 0x0D/0x0A en 0xDC80
	ld hl,0dc80h		;bd0b
	ld a,00dh		;bd0e
	call llena_16_a		;bd10   ; llena_16_a: 16 bytes de HL con A
	ld a,00ah		;bd13
	call llena_16_a		;bd15   ; llena_16_a: 16 bytes de HL con A
	ld a,00dh		;bd18
	call llena_16_a		;bd1a   ; llena_16_a: 16 bytes de HL con A
	ld a,00ah		;bd1d
llena_16_a:		; 16 bytes de HL con A
	ld d,h			;bd1f   ; 16 bytes con A
	ld e,l			;bd20
	inc de			;bd21
	ld bc,0000fh		;bd22
	ld (hl),a			;bd25
	ldir		;bd26
	ret			;bd28
L_BD29:
	ld hl,0cc13h		;bd29   ; apunta a la X en la antesala
	ld de,0cc16h		;bd2c   ; apunta a el sentido en la antesala
	ld a,(0c007h)		;bd2f   ; lee las teclas que hay
	rra			;bd32
	rra			;bd33
	rra			;bd34
	jr c,L_BD56		;bd35
	rra			;bd37
	jr c,L_BD43		;bd38
	xor a			;bd3a
	ld (0cc15h),a		;bd3b
	inc a			;bd3e
	ld (0cc14h),a		;bd3f   ; guarda el cuadro del personaje en la antesala
	ret			;bd42
L_BD43:
	ld a,(hl)			;bd43
	cp 0d8h		;bd44
	jr c,L_BD4E		;bd46
	ld a,(0cc10h)		;bd48   ; lee la pantalla de la antesala (0-2)
	cp 002h		;bd4b
	ret nc			;bd4d
L_BD4E:
	ld a,(hl)			;bd4e   ; X + 4 y sentido 0
	add a,004h		;bd4f
	ld (hl),a			;bd51
	xor a			;bd52
	ld (de),a			;bd53
	jr L_BD67		;bd54
L_BD56:
	ld a,(hl)			;bd56
	cp 020h		;bd57
	jr nc,L_BD60		;bd59
	ld a,(0cc10h)		;bd5b   ; lee la pantalla de la antesala (0-2)
	and a			;bd5e
	ret z			;bd5f
L_BD60:
	ld a,(hl)			;bd60
	sub 004h		;bd61
	ld (hl),a			;bd63
	ld a,001h		;bd64
	ld (de),a			;bd66
L_BD67:
	ld hl,0cc15h		;bd67   ; 0xCC15 cuenta; el cuadro de andar (0xCC14) sale de sus bits 2 y 3
	inc (hl)			;bd6a
	ld a,(hl)			;bd6b
	rra			;bd6c   ; el bit 2: cuadro 1
	rra			;bd6d
	ld c,001h		;bd6e
	jr nc,L_BD79		;bd70
	rra			;bd72   ; si no, el bit 3: cuadro 0 o 2
	ld c,000h		;bd73
	jr nc,L_BD79		;bd75
	ld c,002h		;bd77
L_BD79:
	ld a,c			;bd79
	ld (0cc14h),a		;bd7a   ; guarda el cuadro del personaje en la antesala
	jp 04713h		;bd7d

; ----------------------------------------------------------------------
; DATOS bloque_BD80: 5 x 5 fichas que p06:B9D8 compone en la pagina 1 (marcos
;   y hojas de las puertas); lo leen p06:B9D8 (25 bytes)
;   0xbd80..0xbd99  (25 bytes)
DATA_bloque_BD80:
	defb 0bfh,0c0h,0c5h,0f0h,0efh	; bd80
	defb 0c1h,0c2h,0c6h,0f2h,0f1h	; bd85
	defb 0c3h,0f5h,0f6h,0f7h,0f3h	; bd8a
	defb 0c4h,0f5h,0f6h,0f7h,0f4h	; bd8f
	defb 0c4h,0f5h,0f6h,0f7h,0f4h	; bd94

; ----------------------------------------------------------------------
; DATOS bloque_BD99: 4 x 3 fichas que p06:B9D8 compone en la pagina 1 (marcos
;   y hojas de las puertas); lo leen p06:B9D8 (12 bytes)
;   0xbd99..0xbda5  (12 bytes)
DATA_bloque_BD99:
	defb 0d3h,0d4h,0d5h	; bd99
	defb 0d6h,0d7h,0d8h	; bd9c
	defb 0d9h,0dah,0dbh	; bd9f
	defb 0dch,0ddh,0deh	; bda2

; ----------------------------------------------------------------------
; DATOS bloque_BDA5: 7 x 6 fichas que p06:B9D8 compone en la pagina 1 (marcos
;   y hojas de las puertas); lo leen p06:B9D8 (42 bytes)
;   0xbda5..0xbdcf  (42 bytes)
DATA_bloque_BDA5:
	defb 0b0h,0b1h,0b2h,0e2h,0e1h,0e0h	; bda5
	defb 0b3h,0b4h,0b5h,0e5h,0e4h,0e3h	; bdab
	defb 0b6h,0b7h,0b8h,0e8h,0e7h,0e6h	; bdb1
	defb 0b9h,0bah,0f6h,0f6h,0eah,0e9h	; bdb7
	defb 0bbh,0bch,0f6h,0f6h,0ech,0ebh	; bdbd
	defb 0bbh,0bch,0f6h,0f6h,0ech,0ebh	; bdc3
	defb 0bdh,0beh,0f6h,0f6h,0eeh,0edh	; bdc9

; ----------------------------------------------------------------------
; DATOS bloque_BDCF: 4 x 3 fichas que p06:B9D8 compone en la pagina 1 (marcos
;   y hojas de las puertas); lo leen p06:B9D8 (12 bytes)
;   0xbdcf..0xbddb  (12 bytes)
DATA_bloque_BDCF:
	defb 0c7h,0c8h,0c9h	; bdcf
	defb 0cah,0cbh,0cch	; bdd2
	defb 0cdh,0ceh,0cfh	; bdd5
	defb 0d0h,0d1h,0d2h	; bdd8

; ----------------------------------------------------------------------
; DATOS bloque_BDDB: 2 x 4 fichas que p06:B9D8 compone en la pagina 1 (marcos
;   y hojas de las puertas); lo leen p06:B9D8 (8 bytes)
;   0xbddb..0xbde3  (8 bytes)
DATA_bloque_BDDB:
	defb 0f8h,0f9h,0fah,000h	; bddb
	defb 0fbh,0fch,0fdh,0feh	; bddf

; ----------------------------------------------------------------------
; DATOS dibujos_por_ruina: 5 palabras: el dibujo de 4x4 fichas de cada ruina
;   (p06:BA43); lo leen p06:BA3B (10 bytes)
;   0xbde3..0xbded  (10 bytes)
DATA_dibujos_por_ruina:
	defb 0edh,0bdh	; bde3
	defb 0fdh,0bdh	; bde5
	defb 00dh,0beh	; bde7
	defb 0edh,0bdh	; bde9
	defb 01dh,0beh	; bdeb

; ----------------------------------------------------------------------
; DATOS dibujos_4x4: 4 dibujos de 4x4 fichas (p06:BA4E); la ruina 3 repite el
;   de la 0; lo leen p06:BA3B (64 bytes)
;   0xbded..0xbe2d  (64 bytes)
DATA_dibujos_4x4:
	defb 000h,000h,001h,002h	; bded
	defb 000h,004h,003h,004h	; bdf1
	defb 001h,002h,001h,002h	; bdf5
	defb 003h,004h,003h,004h	; bdf9
	defb 000h,000h,001h,001h	; bdfd
	defb 000h,001h,001h,001h	; be01
	defb 001h,001h,001h,001h	; be05
	defb 001h,001h,001h,001h	; be09
	defb 001h,002h,001h,002h	; be0d
	defb 003h,004h,003h,004h	; be11
	defb 001h,002h,001h,002h	; be15
	defb 003h,004h,003h,004h	; be19
	defb 000h,000h,031h,032h	; be1d
	defb 000h,032h,031h,032h	; be21
	defb 031h,032h,031h,032h	; be25
	defb 033h,034h,033h,034h	; be29

; ----------------------------------------------------------------------
; DATOS desplazamientos_pBAAA: 8 pares [dx][dy] (p06:BACA, p06:BC86): BE2D y
;   BE35; lo leen p06:BAAA (16 bytes)
;   0xbe2d..0xbe3d  (16 bytes)
DATA_desplazamientos_pBAAA:
	defb 0e0h,008h	; be2d
	defb 0e0h,008h	; be2f
	defb 0f0h,008h	; be31
	defb 0f0h,008h	; be33
	defb 0e0h,018h	; be35
	defb 0e0h,018h	; be37
	defb 0f0h,018h	; be39
	defb 0f0h,018h	; be3b

; ----------------------------------------------------------------------
; DATOS puertas: 5 x 6 bytes: las puertas de la antesala de cada ruina, hasta
;   0xFF (p06:B870); bit 0 grande, el resto X; lo leen p06:B870 (30 bytes)
;   0xbe3d..0xbe5b  (30 bytes)
DATA_puertas:
	defb 050h,090h,058h,0c0h,069h,0ffh	; be3d
	defb 038h,098h,028h,0b0h,069h,0ffh	; be43
	defb 040h,0b0h,030h,0b8h,069h,0ffh	; be49
	defb 038h,098h,050h,0a8h,069h,0ffh	; be4f
	defb 054h,094h,034h,0b4h,071h,0ffh	; be55

; ----------------------------------------------------------------------
; DATOS texto_BE5B: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:BB3E (14 bytes)
;   0xbe5b..0xbe69  (14 bytes)
DATA_texto_BE5B:
	defb 048h,04ch,052h,061h,0b2h,05eh,09eh,0a9h,070h,058h,04ah,04eh,048h,0ffh	; be5b  HLRa.^..pXJNH.

; ----------------------------------------------------------------------
; DATOS texto_BE69: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:BB34 (31 bytes)
;   0xbe69..0xbe88  (31 bytes)
DATA_texto_BE69:
	defb 03ch,047h,041h,039h,03fh,036h,02eh,020h,043h,039h,03fh,020h,031h,039h,020h,033h	; be69  <GA9?6. C9? 19 3
	defb 038h,03eh,039h,0feh,03ch,051h,03eh,032h,02fh,020h,02eh,039h,039h,03ch,0ffh	; be79  8>9.<Q>2/ .99<.

; ----------------------------------------------------------------------
; DATOS texto_BE88: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:BB9A (15 bytes)
;   0xbe88..0xbe97  (15 bytes)
DATA_texto_BE88:
	defb 048h,04ch,022h,0a8h,054h,04eh,09eh,04ah,072h,05bh,06ch,06fh,05fh,047h,0ffh	; be88  HL".TN.Jr[lo_G.

; ----------------------------------------------------------------------
; DATOS texto_BE97: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:BBA6 (32 bytes)
;   0xbe97..0xbeb7  (32 bytes)
DATA_texto_BE97:
	defb 03ch,047h,039h,038h,036h,043h,020h,039h,038h,02fh,020h,03ah,02fh,03ch,03dh,039h	; be97  <G986C 98/ :/<=9
	defb 038h,0feh,03ch,051h,037h,02bh,043h,020h,02fh,038h,03eh,02fh,03ch,020h,048h,0ffh	; bea7  8.<Q7+C /8>/< H.

; ----------------------------------------------------------------------
; DATOS texto_BEB7: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:BB9F (15 bytes)
;   0xbeb7..0xbec6  (15 bytes)
DATA_texto_BEB7:
	defb 048h,04ch,058h,07bh,072h,04eh,09eh,022h,0a8h,04ch,06fh,065h,07bh,047h,0ffh	; beb7  HLX{rN.".Loe{G.

; ----------------------------------------------------------------------
; DATOS texto_BEC6: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:BBAB (20 bytes)
;   0xbec6..0xbeda  (20 bytes)
DATA_texto_BEC6:
	defb 03ch,04ch,02dh,032h,039h,039h,03dh,02fh,020h,039h,038h,02fh,020h,03ah,02fh,03ch	; bec6  <L-299=/ 98/ :/<
	defb 03dh,039h,038h,0ffh	; bed6

; ----------------------------------------------------------------------
; DATOS texto_BEDA: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:BB43 (16 bytes)
;   0xbeda..0xbeea  (16 bytes)
DATA_texto_BEDA:
	defb 048h,04ch,054h,076h,05bh,07bh,076h,05eh,020h,0a9h,070h,058h,04ah,04eh,048h,0ffh	; beda  HLTv[{v^ .pXJNH.

; ----------------------------------------------------------------------
; DATOS texto_BEEA: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:BBBE (16 bytes)
;   0xbeea..0xbefa  (16 bytes)
DATA_texto_BEEA:
	defb 048h,04ch,04eh,04fh,07bh,04eh,07bh,09eh,020h,052h,058h,070h,05dh,04ah,047h,0ffh	; beea  HLNO{N{. RXp]JG.

; ----------------------------------------------------------------------
; DATOS texto_BEFA: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:BBCD (33 bytes)
;   0xbefa..0xbf1b  (33 bytes)
DATA_texto_BEFA:
	defb 03ch,047h,043h,039h,03fh,020h,032h,02bh,040h,02fh,020h,03eh,039h,0feh,03ch,051h	; befa  <GC9? 2+@/ >9.<Q
	defb 031h,02bh,03eh,032h,02fh,03ch,020h,030h,039h,03fh,03ch,020h,035h,02fh,043h,03dh	; bf0a  1+>2/< 09?< 5/C=
	defb 0ffh	; bf1a

; ----------------------------------------------------------------------
; DATOS texto_BF1B: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:BBED (14 bytes)
;   0xbf1b..0xbf29  (14 bytes)
DATA_texto_BF1B:
	defb 048h,04ch,05dh,04eh,067h,062h,09eh,049h,055h,07bh,04eh,077h,058h,0ffh	; bf1b  HL]Ngb.IU{NwX.

; ----------------------------------------------------------------------
; DATOS texto_BF29: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p06:BBE8 (27 bytes)
;   0xbf29..0xbf44  (27 bytes)
DATA_texto_BF29:
	defb 03ch,047h,033h,020h,02dh,02bh,03ah,03eh,03fh,03ch,02fh,02eh,020h,043h,039h,03fh	; bf29  <G3 -+:>?</. C9?
	defb 03ch,0feh,03ch,051h,030h,03ch,033h,02fh,038h,02eh,0ffh	; bf39  <.<Q0<3/8..

; ----------------------------------------------------------------------
; DATOS pares_sin_lector: 16 pares de bytes con forma [X][Y] (20 51, 20 51, 30
;   51...) entre los textos y p06:BF64; SIN LECTOR A LA VISTA; lo leen nadie
;   (32 bytes)
;   0xbf44..0xbf64  (32 bytes)
DATA_pares_sin_lector:
	defb 020h,051h	; bf44
	defb 020h,051h	; bf46
	defb 030h,051h	; bf48
	defb 030h,051h	; bf4a
	defb 020h,07eh	; bf4c
	defb 020h,07eh	; bf4e
	defb 030h,07eh	; bf50
	defb 030h,07eh	; bf52
	defb 020h,0abh	; bf54
	defb 020h,0abh	; bf56
	defb 030h,0abh	; bf58
	defb 030h,0abh	; bf5a
	defb 020h,0d8h	; bf5c
	defb 020h,0d8h	; bf5e
	defb 030h,0d8h	; bf60
	defb 030h,0d8h	; bf62

; ----------------------------------------------------------------------
; DATOS tablas_pB8D0: 2 x 4 bytes (p06:B8D0, p06:B8D5); lo leen p06:B8C5 (8
;   bytes)
;   0xbf64..0xbf6c  (8 bytes)
DATA_tablas_pB8D0:
	defb 006h,04bh,006h,04bh	; bf64
	defb 006h,049h,006h,049h	; bf68

; ----------------------------------------------------------------------
; DATOS personajes_al_empezar: 2 x 14 bytes que p00:5ED0 copia a 0xC2B0 y
;   0xC2D0 (las fichas de los dos personajes); p06:BC36 copia uno de los dos;
;   lo leen p00:5ED0 (28 bytes)
;   0xbf6c..0xbf88  (28 bytes)
DATA_personajes_al_empezar:
	defb 000h,000h,001h,001h,040h,038h,001h,005h,010h,000h,070h,000h,060h,000h	; bf6c  ....@8....p.`.
	defb 000h,002h,000h,000h,040h,038h,001h,005h,010h,000h,050h,000h,080h,000h	; bf7a  ....@8....P...

; ----------------------------------------------------------------------
; DATOS patrones_pBC30: [direccion de VRAM] y RLE de patrones de sprite
;   (p00:4926); lo leen p06:BC30 (91 bytes)
;   0xbf88..0xbfe3  (91 bytes)
DATA_patrones_pBC30:
	defb 000h,0fah,084h,007h,03fh,07fh,042h,003h,0e6h,084h,066h,07fh,03fh,007h,005h,000h	; bf88  ....?.B...f.?...
	defb 003h,0ffh,002h,059h,083h,014h,050h,054h,003h,0ffh,083h,00fh,00eh,030h,005h,000h	; bf98  ...Y..PT.....0..
	defb 081h,03dh,004h,019h,00bh,000h,002h,0a6h,083h,0ebh,0afh,0abh,008h,000h,003h,0ffh	; bfa8  .=..............
	defb 085h,0b5h,095h,084h,0a4h,0b4h,003h,0ffh,081h,080h,004h,000h,08bh,0c0h,0fch,0feh	; bfb8  ................
	defb 0a2h,067h,0e3h,07bh,0a2h,0feh,0fch,0c0h,008h,000h,085h,04ah,06ah,07bh,05bh,04bh	; bfc8  .g.{.......Jj{[K
	defb 00bh,000h,085h,05ch,098h,01ch,084h,05ch,008h,000h,000h	; bfd8  ...\...\...

; ----------------------------------------------------------------------
; DATOS relleno_ff: 29 bytes a 0xFF hasta el final del banco: relleno; lo leen
;   nadie (29 bytes)
;   0xbfe3..0xc000  (29 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff3  .............
