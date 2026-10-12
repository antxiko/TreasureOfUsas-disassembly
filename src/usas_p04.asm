; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 04 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS resto_6000: tablas cortas que apuntan p00:546B (0x6000), p00:5493
;   (0x6000), p00:56EA (0x6000), p04:60D3 (0x6000), p04:61F5 (0x600B),
;   p04:6444 (0x6014), p05:9F2D (0x601C), p04:6358 (0x601D); el tamano de cada
;   una sale del lector siguiente, no de recorrerla; lo leen p00:546B,
;   p00:5493, p00:56EA, p04:60D3, p04:61F5, p04:6444, p05:9F2D, p04:6358 (133
;   bytes)
;   0x6000..0x6085  (133 bytes)
DATA_resto_6000:
	defb 048h,040h,020h,00fh,048h,050h,024h,00fh,040h,040h,028h,048h,070h,000h,00fh,048h	; 6000  H@ .HP$.@@(Hp..H
	defb 074h,008h,00fh,0e0h,05ch,040h,000h,00fh,05ch,044h,008h,00fh,0e0h,06ch,080h,02ch	; 6010  t...\@..\D...l.,
	defb 04fh,070h,0c0h,00fh,04fh,070h,0c4h,00fh,04fh,080h,0d0h,00fh,04fh,080h,0d4h,000h	; 6020  Op..Op..O...O...
	defb 008h,010h,004h,00ch,014h,001h,002h,003h,004h,004h,003h,002h,001h,002h,003h,004h	; 6030  ................
	defb 004h,003h,002h,001h,000h,001h,002h,003h,004h,004h,003h,002h,001h,000h,001h,002h	; 6040  ................
	defb 003h,004h,004h,003h,002h,070h,071h,072h,000h,077h,078h,079h,07ah,000h,000h,000h	; 6050  .....pqr.wxyz...
	defb 000h,000h,073h,074h,000h,07bh,078h,079h,07ah,000h,000h,000h,000h,000h,000h,000h	; 6060  ..st.{xyz.......
	defb 000h,000h,07ch,07dh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,07eh,07fh	; 6070  ..|}..........~.
	defb 000h,000h,000h,000h,000h	; 6080

; ======================================================================
; CODIGO 0x6085..0x60ad  (40 bytes)
; ======================================================================


guion_de_la_escena:		; las escenas: con la tecla 0x10 se salta (salvo la ruina 5 o la escena 4); despacha por la ruina (tabla p04:60AD)
	ld a,(0c21dh)		;6085   ; lee la ruina (0-4)
	cp 005h		;6088
	jr z,L_60A4		;608a
	ld a,(0c220h)		;608c   ; lee la escena (0-11)
	cp 004h		;608f
	jr z,L_60A4		;6091
	call 04feeh		;6093   ; lee_mandos: fuera de partida (0xC002 bit 6 a cero) salta a p01:6017; si no lee mandos y teclado a 0xC006/0xC007
	ld a,(0c007h)		;6096   ; lee las teclas que hay
	and 010h		;6099
	jr z,L_60A4		;609b
	ld a,000h		;609d
	call 05451h		;609f   ; sonido_y_456: el sonido A y los bancos 4-5-6
	scf			;60a2
	ret			;60a3
L_60A4:
	call 05690h		;60a4   ; atributos_a_vram: 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
	ld a,(0c21dh)		;60a7   ; lee la ruina (0-4)
	call 0408dh		;60aa   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_60AD: tabla de 6 palabras del despachador (call 0x408D en
;   0x60AA); lo leen L_408D (12 bytes)
;   0x60ad..0x60b9  (12 bytes)
DATA_saltos_60AD:
	defb 0b9h,060h	; 60ad
	defb 0fbh,062h	; 60af
	defb 011h,065h	; 60b1
	defb 019h,066h	; 60b3
	defb 0f6h,068h	; 60b5
	defb 078h,06ah	; 60b7

; ======================================================================
; CODIGO 0x60b9..0x6291  (472 bytes)
; ======================================================================


L_60B9:
	ld hl,0c21fh		;60b9   ; apunta a el paso de la escena
	ld b,(hl)			;60bc
	inc l			;60bd
	inc l			;60be
	djnz L_60C9		;60bf
	ld a,005h		;60c1
	call texto_a_maquina		;60c3   ; texto_a_maquina: p04:73D2 en (0x30, 0x7C), borrando antes con la BIOS japonesa
	jp L_6698		;60c6
L_60C9:
	djnz L_60E7		;60c9
	call letra_a_maquina		;60cb   ; letra_a_maquina: cada 0xC8A5 cuadros, el siguiente caracter del texto
	ld a,(0c8a6h)		;60ce   ; lee el texto a maquina ha acabado
	or a			;60d1
	ret z			;60d2
	ld hl,06000h		;60d3
	ld bc,0000ch		;60d6
	ld de,0de00h		;60d9   ; apunta a los atributos de los sprites en RAM
	ldir		;60dc
	ld bc,0500dh		;60de
	call llena_dc00		;60e1   ; llena_dc00: B bytes de 0xDC00 con C
	jp L_6698		;60e4
L_60E7:
	djnz L_60FC		;60e7
	ld hl,0de01h		;60e9   ; apunta a la X del sprite 0 en RAM
	ld b,001h		;60ec
	call avanza_sprites		;60ee   ; avanza_sprites: cada B cuadros, + 1 a 3 sprites de HL (de 4 en 4)
	ld a,(0de01h)		;60f1   ; lee la X del sprite 0 en RAM
	cp 068h		;60f4
	jp c,L_6232		;60f6
	jp L_66EF		;60f9
L_60FC:
	djnz L_6111		;60fc
	dec (hl)			;60fe
	jp nz,L_6232		;60ff
	ld hl,0c220h		;6102   ; apunta a la escena (0-11)
	inc (hl)			;6105
	call pinta_escena		;6106   ; pinta_escena: fichas, paleta, mapa, sprites y dibujo de la escena 0xC220
	call sprites_6020		;6109   ; sprites_6020: 16 bytes de p04:6020 a 0xDE14 y dos colores de sprite
	ld a,030h		;610c
	jp L_622B		;610e
L_6111:
	djnz L_6134		;6111
	dec (hl)			;6113
	jp nz,L_6232		;6114
	ld a,(0002bh)		;6117
	and 00fh		;611a
	jr nz,L_612C		;611c
	ld a,002h		;611e
	ld de,0482ah		;6120
	call empieza_texto_a_maquina		;6123   ; empieza_texto_a_maquina: el texto A de p04:743F (japones) o p04:745D en DE
	call borra_recuadro_4626		;6126   ; borra_recuadro_4626: borra 0x4C x 0x1C en (0x46, 0x26) y p06:A494
	jp L_6698		;6129
L_612C:
	ld a,002h		;612c
L_612E:
	call texto_a_maquina		;612e   ; texto_a_maquina: p04:73D2 en (0x30, 0x7C), borrando antes con la BIOS japonesa
	jp L_6698		;6131
L_6134:
	djnz L_6147		;6134
L_6136:
	ld hl,0c221h		;6136   ; apunta a la cuenta de la escena
	ld (hl),080h		;6139
L_613B:
	call letra_a_maquina		;613b   ; letra_a_maquina: cada 0xC8A5 cuadros, el siguiente caracter del texto
	ld a,(0c8a6h)		;613e   ; lee el texto a maquina ha acabado
	or a			;6141
	jp nz,L_6698		;6142
	or a			;6145
	ret			;6146
L_6147:
	djnz L_615B		;6147
	dec (hl)			;6149
	jp nz,L_6232		;614a
	call dibujo_de_escena		;614d   ; dibujo_de_escena: el dibujo de la escena en su posicion (p04:7239/7251)
	call borra_de_70		;6150   ; borra_de_70: borra 0xFF x 0x48 desde (0, 0x70)
	ld a,006h		;6153
	call texto_a_maquina		;6155   ; texto_a_maquina: p04:73D2 en (0x30, 0x7C), borrando antes con la BIOS japonesa
	jp L_6698		;6158
L_615B:
	djnz L_6164		;615b
L_615D:
	ld hl,0c221h		;615d   ; apunta a la cuenta de la escena
	ld (hl),000h		;6160
	jr L_613B		;6162
L_6164:
	djnz L_6173		;6164
	dec (hl)			;6166
	jp nz,L_6232		;6167
	call 09665h		;616a   ; lista_9241: la lista de fichas p05:9241 (colores p05:9231)
	call pantalla_73b4		;616d   ; pantalla_73b4: paleta, mapa p05:93C6, el dibujo y el texto p04:73BD
	jp L_6698		;6170
L_6173:
	djnz L_61A0		;6173
	call 0966eh		;6175   ; parpadeo_de_ruina: 0xAC cuadros: cada 16, la ficha 0x1A/0x1B en la posicion de la ruina (p05:96AB); al acabar, 0xC899 = 1
	ld hl,0c899h		;6178   ; apunta a el parpadeo de la ruina acabado
	ld a,(hl)			;617b
	or a			;617c
	ret z			;617d
	ld (hl),000h		;617e
	call pinta_escena		;6180   ; pinta_escena: fichas, paleta, mapa, sprites y dibujo de la escena 0xC220
	call sprites_6020		;6183   ; sprites_6020: 16 bytes de p04:6020 a 0xDE14 y dos colores de sprite
	ld a,(0002bh)		;6186
	and 00fh		;6189
	jr nz,L_619B		;618b
	ld a,003h		;618d
	ld de,0682ah		;618f
	call empieza_texto_a_maquina		;6192   ; empieza_texto_a_maquina: el texto A de p04:743F (japones) o p04:745D en DE
	call borra_recuadro_6626		;6195   ; borra_recuadro_6626: borra 0x54 x 0x1C en (0x66, 0x26) y p06:A494
	jp L_6698		;6198
L_619B:
	ld a,003h		;619b
	jp L_612E		;619d
L_61A0:
	djnz L_61A5		;61a0
	jp L_6136		;61a2
L_61A5:
	djnz L_61CB		;61a5
	dec (hl)			;61a7
	jp nz,L_6232		;61a8
	call borra_de_70		;61ab   ; borra_de_70: borra 0xFF x 0x48 desde (0, 0x70)
	ld a,(0002bh)		;61ae
	and 00fh		;61b1
	jr nz,L_61C6		;61b3
	ld a,004h		;61b5
	ld de,04838h		;61b7
	call empieza_texto_a_maquina		;61ba   ; empieza_texto_a_maquina: el texto A de p04:743F (japones) o p04:745D en DE
	call dibujo_de_escena		;61bd   ; dibujo_de_escena: el dibujo de la escena en su posicion (p04:7239/7251)
	call borra_recuadro_4636		;61c0   ; borra_recuadro_4636: borra 0x44 x 0x0C en (0x46, 0x36) y p06:A494
	jp L_6698		;61c3
L_61C6:
	ld a,004h		;61c6
	jp L_612E		;61c8
L_61CB:
	djnz L_61D0		;61cb
	jp L_6136		;61cd
L_61D0:
	djnz L_61E4		;61d0
	dec (hl)			;61d2
	jp nz,L_6232		;61d3
	call dibujo_de_escena		;61d6   ; dibujo_de_escena: el dibujo de la escena en su posicion (p04:7239/7251)
	call borra_de_70		;61d9   ; borra_de_70: borra 0xFF x 0x48 desde (0, 0x70)
	ld a,007h		;61dc
	call texto_a_maquina		;61de   ; texto_a_maquina: p04:73D2 en (0x30, 0x7C), borrando antes con la BIOS japonesa
	jp L_6698		;61e1
L_61E4:
	djnz L_61E9		;61e4
	jp L_615D		;61e6
L_61E9:
	djnz L_620F		;61e9
	dec (hl)			;61eb
	jp nz,L_6232		;61ec
	call escena_de_la_ruina		;61ef   ; escena_de_la_ruina: la escena de la ruina (p04:71EA) y p04:71D5
	ld de,0de08h		;61f2   ; apunta a la Y del sprite 2 en RAM
	ld hl,0600bh		;61f5
	ld bc,0000ch		;61f8
	ldir		;61fb
	ld hl,0de00h		;61fd   ; apunta a los atributos de los sprites en RAM
	ld b,002h		;6200
	ld a,047h		;6202
	call pon_en_sprites		;6204   ; pon_en_sprites: A en B sprites de HL (de 4 en 4)
	ld a,008h		;6207
	call texto_a_maquina		;6209   ; texto_a_maquina: p04:73D2 en (0x30, 0x7C), borrando antes con la BIOS japonesa
	jp L_6698		;620c
L_620F:
	djnz L_6221		;620f
	ld a,(0de09h)		;6211   ; lee la X del sprite 2 en RAM
	cp 0b0h		;6214
	jr nc,L_621B		;6216
	call anima_de08		;6218   ; anima_de08: parpadeo de 0xDE0A y avance de 0xDE09
L_621B:
	ld hl,0c221h		;621b   ; apunta a la cuenta de la escena
	jp L_615D		;621e
L_6221:
	djnz L_6229		;6221
	dec (hl)			;6223
	jp nz,L_6232		;6224
	scf			;6227
	ret			;6228
L_6229:
	ld a,03ch		;6229
L_622B:
	ld hl,0c221h		;622b   ; apunta a la cuenta de la escena
	ld (hl),a			;622e
	dec l			;622f
	dec l			;6230
	inc (hl)			;6231
L_6232:
	or a			;6232
	ret			;6233
borra_recuadro_4626:		; borra 0x4C x 0x1C en (0x46, 0x26) y p06:A494
	ld hl,04626h		;6234
	ld bc,04c1ch		;6237
	jp borra_y_marco		;623a   ; borra_y_marco: borra el rectangulo y p06:A494
borra_recuadro_6626:		; borra 0x54 x 0x1C en (0x66, 0x26) y p06:A494
	ld hl,06626h		;623d
	ld bc,0541ch		;6240
	jp borra_y_marco		;6243   ; borra_y_marco: borra el rectangulo y p06:A494
borra_recuadro_4636:		; borra 0x44 x 0x0C en (0x46, 0x36) y p06:A494
	ld hl,04636h		;6246
	ld bc,0440ch		;6249
	jp borra_y_marco		;624c   ; borra_y_marco: borra el rectangulo y p06:A494
parpadeo_de_2:		; p04:6251 con B = 2
	ld b,002h		;624f
parpadeo_de_sprites:		; cada 16 cuadros, el bit 2 de B sprites de HL (de 4 en 4) con C
	ld a,(0c003h)		;6251   ; lee la cuenta de cuadros
	and 00fh		;6254
	ret nz			;6256
L_6257:
	ld a,004h		;6257   ; el bit 2 del byte de color de cada sprite cambia (xor), y OR con C
	xor (hl)			;6259
	or c			;625a
	ld (hl),a			;625b
	inc hl			;625c   ; 4 bytes por sprite
	inc hl			;625d
	inc hl			;625e
	inc hl			;625f
	djnz L_6257		;6260
	ret			;6262
anima_de00:		; parpadeo de 0xDE02 y avance de 0xDE01
	ld hl,0de02h		;6263   ; apunta a el patron del sprite 0 en RAM
	ld c,000h		;6266
	call parpadeo_de_2		;6268   ; parpadeo_de_2: p04:6251 con B = 2
	ld hl,0de01h		;626b   ; apunta a la X del sprite 0 en RAM
	ld b,007h		;626e
	jr avanza_sprites		;6270
anima_de08:		; parpadeo de 0xDE0A y avance de 0xDE09
	ld hl,0de0ah		;6272   ; apunta a el patron del sprite 2 en RAM
	ld c,000h		;6275
	call parpadeo_de_2		;6277   ; parpadeo_de_2: p04:6251 con B = 2
	ld hl,0de09h		;627a   ; apunta a la X del sprite 2 en RAM
	ld b,007h		;627d
avanza_sprites:		; cada B cuadros, + 1 a 3 sprites de HL (de 4 en 4)
	ld a,(0c003h)		;627f   ; lee la cuenta de cuadros
	and b			;6282
	ret nz			;6283
	ld b,003h		;6284
suma_sprites:		; + 1 a B sprites de HL (de 4 en 4)
	inc (hl)			;6286   ; + 1 a la Y de B sprites
	inc hl			;6287
	inc hl			;6288
	inc hl			;6289
	inc hl			;628a
	djnz suma_sprites		;628b
	ret			;628d
resta_sprite:		; (HL) - 1 y p04:6292
	dec (hl)			;628e
	jr $+3		;628f

; ----------------------------------------------------------------------
; DATOS resto_6291: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (1 bytes)
;   0x6291..0x6292  (1 bytes)
DATA_resto_6291:
	defb 034h	; 6291

; ======================================================================
; CODIGO 0x6292..0x64e7  (597 bytes)
; ======================================================================


sprite_en_rango:		; el sprite de HL entre 0x5C y 0x9C
	ld a,(hl)			;6292   ; la Y del sprite: por debajo de 0x5C nada; a 0x9C, p04:62BD
	cp 05ch		;6293
	ret c			;6295
	cp 09ch		;6296
	jr z,L_62BD		;6298
	ret nc			;629a
altura_de_la_ola:		; la altura de p04:6035 segun (HL) y 0xC8E1
	push hl			;629b
	ld a,(hl)			;629c
	sub 060h		;629d
	rra			;629f
	rra			;62a0
	rra			;62a1
	and 00fh		;62a2
	ld c,a			;62a4
	ld a,(0c8e1h)		;62a5
	add a,a			;62a8
	add a,a			;62a9
	add a,a			;62aa
	ld hl,06035h		;62ab
	call 04083h		;62ae   ; hl_mas_a: HL = HL + A
	ld a,c			;62b1
	call 04083h		;62b2   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;62b5
	add a,05ch		;62b6
	pop hl			;62b8
L_62B9:
	dec hl			;62b9
	ld (hl),a			;62ba
	inc hl			;62bb
	ret			;62bc
L_62BD:
	ld a,05ch		;62bd
	jr L_62B9		;62bf
baja_de05:		; cada 16 cuadros, 0xDE05 - 1
	ld a,(0c003h)		;62c1   ; lee la cuenta de cuadros
	and 00fh		;62c4
	ret nz			;62c6
	ld hl,0de05h		;62c7   ; apunta a la X del sprite 1 en RAM
	call resta_sprite		;62ca   ; resta_sprite: (HL) - 1 y p04:6292
	ld b,007h		;62cd
	ret			;62cf
sprites_de05:		; p04:62E0 con 0xDE05 y B = 2
	ld b,002h		;62d0
	ld hl,0de05h		;62d2   ; apunta a la X del sprite 1 en RAM
	jr L_62E0		;62d5
sprites_b2:		; p04:62DD con B = 2
	ld b,002h		;62d7
	jr L_62DD		;62d9
sprites_de01:		; 2 sprites desde 0xDE01 en rango (p04:6292)
	ld b,002h		;62db
L_62DD:
	ld hl,0de01h		;62dd   ; apunta a la X del sprite 0 en RAM
L_62E0:
	push bc			;62e0
	push hl			;62e1
L_62E2:
	push bc			;62e2
	call sprite_en_rango		;62e3   ; sprite_en_rango: el sprite de HL entre 0x5C y 0x9C
	inc hl			;62e6
	inc hl			;62e7
	inc hl			;62e8
	inc hl			;62e9
	pop bc			;62ea
	djnz L_62E2		;62eb
	pop hl			;62ed
	pop bc			;62ee
	ld a,(0c003h)		;62ef   ; lee la cuenta de cuadros
	and 007h		;62f2
	ret nz			;62f4
	call suma_sprites		;62f5   ; suma_sprites: + 1 a B sprites de HL (de 4 en 4)
	ld b,007h		;62f8
	ret			;62fa
L_62FB:
	call cuenta_c8e1		;62fb   ; cuenta_c8e1: cada 16 cuadros, 0xC8E1 + 0xC8E2
	ld hl,0c21fh		;62fe   ; apunta a el paso de la escena
	ld b,(hl)			;6301
	djnz L_631A		;6302
	call sprites_de01		;6304   ; sprites_de01: 2 sprites desde 0xDE01 en rango (p04:6292)
	ld hl,0de02h		;6307   ; apunta a el patron del sprite 0 en RAM
	ld c,000h		;630a
	call parpadeo_de_2		;630c   ; parpadeo_de_2: p04:6251 con B = 2
	ld a,(0de01h)		;630f   ; lee la X del sprite 0 en RAM
	cp 054h		;6312
	jp c,L_6232		;6314
	jp L_6698		;6317
L_631A:
	djnz L_6336		;631a
	call sprites_de05		;631c   ; sprites_de05: p04:62E0 con 0xDE05 y B = 2
	ld hl,0de06h		;631f   ; apunta a el patron del sprite 1 en RAM
	ld bc,00200h		;6322
	call parpadeo_de_sprites		;6325   ; parpadeo_de_sprites: cada 16 cuadros, el bit 2 de B sprites de HL (de 4 en 4) con C
	call parpadeo_de02_64		;6328   ; parpadeo_de02_64: cada 64 cuadros, 0xDE02 xor 0xC0
	ld a,(0de05h)		;632b   ; lee la X del sprite 1 en RAM
	cp 078h		;632e
	jp c,L_6232		;6330
	jp L_6698		;6333
L_6336:
	djnz L_636E		;6336
	call sprites_de01		;6338   ; sprites_de01: 2 sprites desde 0xDE01 en rango (p04:6292)
	ld hl,0de02h		;633b   ; apunta a el patron del sprite 0 en RAM
	ld c,000h		;633e
	call parpadeo_de_2		;6340   ; parpadeo_de_2: p04:6251 con B = 2
	ld a,(0de01h)		;6343   ; lee la X del sprite 0 en RAM
	cp 078h		;6346
	jp c,L_6232		;6348
	ld a,030h		;634b
	ld (0de02h),a		;634d   ; guarda el patron del sprite 0 en RAM
	ld a,06ch		;6350
	ld (0de00h),a		;6352   ; guarda los atributos de los sprites en RAM
	ld de,0de0ch		;6355   ; apunta a la Y del sprite 3 en RAM
	ld hl,0601dh		;6358
	ld bc,00003h		;635b
	ldir		;635e
	ld hl,0dc30h		;6360
	ld bc,01004h		;6363
	call llena_hl		;6366   ; llena_hl: B bytes de HL con C
	ld a,080h		;6369
	jp L_622B		;636b
L_636E:
	djnz L_6392		;636e
	call sprites_de05		;6370   ; sprites_de05: p04:62E0 con 0xDE05 y B = 2
	ld hl,0de06h		;6373   ; apunta a el patron del sprite 1 en RAM
	ld bc,00200h		;6376
	call parpadeo_de_sprites		;6379   ; parpadeo_de_sprites: cada 16 cuadros, el bit 2 de B sprites de HL (de 4 en 4) con C
	call sube_de0c		;637c   ; sube_de0c: 0xDE0C + 2 hasta 0x8B; despues los colores de 0xDC30
	call sprite_de01_ola		;637f   ; sprite_de01_ola: 0xDE00 segun p04:629B y el parpadeo de 0xDE02
	ld a,(0de05h)		;6382   ; lee la X del sprite 1 en RAM
	cp 0a0h		;6385
	jp c,L_6232		;6387
	ld a,0d0h		;638a
	ld (0de0ah),a		;638c   ; guarda el patron del sprite 2 en RAM
	jp L_6698		;638f
L_6392:
	djnz L_63B4		;6392
	call baja_de05		;6394   ; baja_de05: cada 16 cuadros, 0xDE05 - 1
	ld hl,0de06h		;6397   ; apunta a el patron del sprite 1 en RAM
	ld bc,001c0h		;639a
	call parpadeo_de_sprites		;639d   ; parpadeo_de_sprites: cada 16 cuadros, el bit 2 de B sprites de HL (de 4 en 4) con C
	call sprite_de01_ola		;63a0   ; sprite_de01_ola: 0xDE00 segun p04:629B y el parpadeo de 0xDE02
	ld hl,0de05h		;63a3   ; apunta a la X del sprite 1 en RAM
	ld a,(hl)			;63a6
	cp 080h		;63a7
	jp nc,L_6232		;63a9
	inc hl			;63ac
	ld (hl),038h		;63ad
	ld a,028h		;63af
	jp L_622B		;63b1
L_63B4:
	djnz L_63D5		;63b4
	ld hl,0de05h		;63b6   ; apunta a la X del sprite 1 en RAM
	call altura_de_la_ola		;63b9   ; altura_de_la_ola: la altura de p04:6035 segun (HL) y 0xC8E1
	ld hl,0c221h		;63bc   ; apunta a la cuenta de la escena
	dec (hl)			;63bf
	jp nz,L_6232		;63c0
	xor a			;63c3
	ld (0de02h),a		;63c4   ; guarda el patron del sprite 0 en RAM
	ld hl,0de01h		;63c7   ; apunta a la X del sprite 0 en RAM
	call altura_de_la_ola		;63ca   ; altura_de_la_ola: la altura de p04:6035 segun (HL) y 0xC8E1
	ld a,008h		;63cd
	ld (0de06h),a		;63cf   ; guarda el patron del sprite 1 en RAM
	jp L_6698		;63d2
L_63D5:
	djnz L_63F3		;63d5
	call sprites_b2		;63d7   ; sprites_b2: p04:62DD con B = 2
	ld hl,0de02h		;63da   ; apunta a el patron del sprite 0 en RAM
	ld bc,00200h		;63dd
	call parpadeo_de_sprites		;63e0   ; parpadeo_de_sprites: cada 16 cuadros, el bit 2 de B sprites de HL (de 4 en 4) con C
	ld a,(0de05h)		;63e3   ; lee la X del sprite 1 en RAM
	cp 09eh		;63e6
	jp c,L_6232		;63e8
	ld a,010h		;63eb
	ld (0de0ah),a		;63ed   ; guarda el patron del sprite 2 en RAM
	jp L_6698		;63f0
L_63F3:
	djnz L_640A		;63f3
	call sprites_de01		;63f5   ; sprites_de01: 2 sprites desde 0xDE01 en rango (p04:6292)
	ld hl,0de02h		;63f8   ; apunta a el patron del sprite 0 en RAM
	ld c,000h		;63fb
	call parpadeo_de_2		;63fd   ; parpadeo_de_2: p04:6251 con B = 2
	ld a,(0de01h)		;6400   ; lee la X del sprite 0 en RAM
	cp 0a8h		;6403
	jp c,L_6232		;6405
	scf			;6408
	ret			;6409
L_640A:
	ld hl,0c8e0h		;640a
	ld bc,00005h		;640d
	call 05f08h		;6410   ; borra: pone a cero BC + 1 bytes desde HL
	ld hl,0c068h		;6413
	ld bc,04020h		;6416
	ld a,077h		;6419
	ld d,001h		;641b
	call 04ba2h		;641d   ; rellena_rectangulo: HMMV (0xC0): rectangulo B x C en (H, L) de la pagina D con el color A
	ld a,001h		;6420
	ld (0c8e0h),a		;6422
	ld (0c8e2h),a		;6425
	ld hl,0c068h		;6428
	ld de,06035h		;642b
	call dos_lineas_horizontales		;642e   ; dos_lineas_horizontales: dos lineas horizontales (p00:4B98) desde L + (DE)
	ld l,070h		;6431
	call dos_lineas_horizontales		;6433   ; dos_lineas_horizontales: dos lineas horizontales (p00:4B98) desde L + (DE)
	ld l,078h		;6436
	call dos_lineas_horizontales		;6438   ; dos_lineas_horizontales: dos lineas horizontales (p00:4B98) desde L + (DE)
	ld l,080h		;643b
	call dos_lineas_horizontales		;643d   ; dos_lineas_horizontales: dos lineas horizontales (p00:4B98) desde L + (DE)
	xor a			;6440
	ld (0c8e0h),a		;6441
	ld hl,06014h		;6444
	ld bc,00008h		;6447
	call copia_a_de00		;644a   ; copia_a_de00: BC bytes de HL a 0xDE00 (los atributos de sprites)
	ld hl,0dc00h		;644d   ; apunta a los colores de los sprites en RAM (16 por sprite)
	ld bc,0200dh		;6450
	call llena_hl		;6453   ; llena_hl: B bytes de HL con C
	ld bc,01000h		;6456
	call llena_hl		;6459   ; llena_hl: B bytes de HL con C
	xor a			;645c
	jp L_622B		;645d
llena_dc00:		; B bytes de 0xDC00 con C
	ld hl,0dc00h		;6460   ; apunta a los colores de los sprites en RAM (16 por sprite)
llena_hl:		; B bytes de HL con C
	ld (hl),c			;6463
	inc hl			;6464
	djnz llena_hl		;6465
	ret			;6467
copia_a_de00:		; BC bytes de HL a 0xDE00 (los atributos de sprites)
	ld de,0de00h		;6468   ; apunta a los atributos de los sprites en RAM
	ldir		;646b
	ret			;646d
copia_rectangulo_guardando:		; p00:4BDE sin tocar los registros
	push hl			;646e
	push de			;646f
	push bc			;6470
	push af			;6471
	call 04bdeh		;6472   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop af			;6475
	pop bc			;6476
	pop de			;6477
	pop hl			;6478
	ret			;6479
dos_lineas_horizontales:		; dos lineas horizontales (p00:4B98) desde L + (DE)
	push hl			;647a
	ld a,l			;647b
	exx			;647c
	ld l,a			;647d
	ld b,008h		;647e
L_6480:
	exx			;6480
	ld l,a			;6481
	ld a,(de)			;6482
	inc de			;6483
	add a,l			;6484
	ld l,a			;6485
	ld bc,00802h		;6486
	call 04b98h		;6489   ; linea_horizontal_guardando_todo: p00:4AD4 sin tocar HL, DE ni BC
	inc l			;648c
	ld c,004h		;648d
	call 04b98h		;648f   ; linea_horizontal_guardando_todo: p00:4AD4 sin tocar HL, DE ni BC
	ld a,h			;6492
	add a,008h		;6493
	ld h,a			;6495
	exx			;6496
	ld a,l			;6497
	djnz L_6480		;6498
	exx			;649a
	pop hl			;649b
	ret			;649c
cuenta_c8e1:		; cada 16 cuadros, 0xC8E1 + 0xC8E2
	ld a,(0c003h)		;649d   ; cada 16 cuadros, 0xC8E1 + 0xC8E2
	and 00fh		;64a0
	ret nz			;64a2
	ld hl,0c8e2h		;64a3
	ld a,(hl)			;64a6
	dec hl			;64a7
	add a,(hl)			;64a8
	ld (hl),a			;64a9
	inc hl			;64aa
	or a			;64ab   ; a cero: B = 1
	jr nz,L_64B2		;64ac
	ld b,001h		;64ae
	jr L_64B8		;64b0
L_64B2:
	cp 003h		;64b2
	ld b,0ffh		;64b4
	jr nz,L_64B9		;64b6
L_64B8:
	ld (hl),b			;64b8
L_64B9:
	ld b,a			;64b9
	inc b			;64ba
	xor a			;64bb
	ld c,008h		;64bc
L_64BE:
	add a,c			;64be
	djnz L_64BE		;64bf
	add a,060h		;64c1
	ld l,a			;64c3
	ld h,0c0h		;64c4
	ld de,0606ch		;64c6
	ld bc,04008h		;64c9
	jp 04841h		;64cc   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
sube_de0c:		; 0xDE0C + 2 hasta 0x8B; despues los colores de 0xDC30
	ld de,0c8e3h		;64cf
	ld a,(de)			;64d2
	or a			;64d3
	ret nz			;64d4
	ld hl,0de0ch		;64d5   ; apunta a la Y del sprite 3 en RAM
	inc (hl)			;64d8
	inc (hl)			;64d9
	ld a,(hl)			;64da
	cp 08bh		;64db
	ret c			;64dd
	ld hl,0dc30h		;64de
	ld bc,01000h		;64e1
	jp llena_hl		;64e4   ; llena_hl: B bytes de HL con C

; ----------------------------------------------------------------------
; DATOS resto_64E7: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (4 bytes)
;   0x64e7..0x64eb  (4 bytes)
DATA_resto_64E7:
	defb 0ebh,036h,001h,0c9h	; 64e7

; ======================================================================
; CODIGO 0x64eb..0x675e  (627 bytes)
; ======================================================================


parpadeo_de02_64:		; cada 64 cuadros, 0xDE02 xor 0xC0
	ld a,(0c003h)		;64eb   ; lee la cuenta de cuadros
	and 03fh		;64ee
	ret nz			;64f0
	ld hl,0de02h		;64f1   ; apunta a el patron del sprite 0 en RAM
	ld a,0c0h		;64f4
	xor (hl)			;64f6
	ld (hl),a			;64f7
	ret			;64f8
sprite_de01_ola:		; 0xDE00 segun p04:629B y el parpadeo de 0xDE02
	ld hl,0de01h		;64f9   ; apunta a la X del sprite 0 en RAM
	call altura_de_la_ola		;64fc   ; altura_de_la_ola: la altura de p04:6035 segun (HL) y 0xC8E1
	dec hl			;64ff
	add a,00eh		;6500
	ld (hl),a			;6502
	ld a,(0c003h)		;6503   ; lee la cuenta de cuadros
	and 007h		;6506
	ret nz			;6508
	ld a,004h		;6509
	ld hl,0de02h		;650b   ; apunta a el patron del sprite 0 en RAM
	xor (hl)			;650e
	ld (hl),a			;650f
	ret			;6510
L_6511:
	ld hl,0c21fh		;6511   ; apunta a el paso de la escena
	ld b,(hl)			;6514
	inc l			;6515
	inc l			;6516
	djnz L_654F		;6517
	dec (hl)			;6519
	jp nz,L_6232		;651a
	ld (hl),030h		;651d
	ld a,(0c8e5h)		;651f
	neg		;6522
	add a,004h		;6524
	ld hl,0b444h		;6526
	call 0543ah		;6529   ; palabra_a: HL = la palabra A de la tabla HL
	call 04a9dh		;652c   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
	ld hl,0c8e5h		;652f
	dec (hl)			;6532
	jp nz,L_6232		;6533
	ld bc,0200dh		;6536
	call llena_dc00		;6539   ; llena_dc00: B bytes de 0xDC00 con C
	ld bc,01000h		;653c
	call llena_hl		;653f   ; llena_hl: B bytes de HL con C
	ld hl,0c8e4h		;6542
	ld (hl),003h		;6545
	inc hl			;6547
	ld (hl),000h		;6548
	ld a,040h		;654a
	jp L_622B		;654c
L_654F:
	djnz L_658D		;654f   ; paso 2 de la escena: la animacion y la cuenta de 0xC221
	call anima_de00		;6551   ; anima_de00: parpadeo de 0xDE02 y avance de 0xDE01
	ld hl,0c221h		;6554   ; apunta a la cuenta de la escena
	dec (hl)			;6557
	jp nz,L_6232		;6558
	ld (hl),040h		;655b   ; cada 0x40 cuadros, un sprite mas (patron 0x74, Y 0x70) con la X de 0xC8E5
	ld hl,0c8e4h		;655d
	ex de,hl			;6560
	ld a,(de)			;6561
	ld c,a			;6562
	inc de			;6563
	neg		;6564
	add a,003h		;6566
	add a,a			;6568
	add a,a			;6569
	ld hl,0de00h		;656a   ; apunta a los atributos de los sprites en RAM
	call 04083h		;656d   ; hl_mas_a: HL = HL + A
	ld (hl),074h		;6570
	inc hl			;6572
	ld (hl),070h		;6573
	inc hl			;6575
	ld a,(de)			;6576
	ld (hl),a			;6577
	add a,008h		;6578   ; la X siguiente, 8 mas a la derecha
	ld (de),a			;657a
	ld hl,0c8e4h		;657b   ; al acabar los 0xC8E4, la cuenta siguiente y el paso 0x40
	dec (hl)			;657e
	ret nz			;657f
	ld hl,0c8e4h		;6580
	ld (hl),060h		;6583
	inc hl			;6585
	ld (hl),004h		;6586
	ld a,040h		;6588
	jp L_622B		;658a
L_658D:
	djnz L_65B2		;658d   ; paso 3: cada 0x40 cuadros copia 24 x 32 de (0x74, 0x70) a la fila 0xE0
	dec (hl)			;658f
	jp nz,L_6232		;6590
	ld (hl),040h		;6593
	ld bc,02018h		;6595
	ld hl,0c8e4h		;6598
	ld a,(hl)			;659b
	add a,c			;659c
	ld e,a			;659d
	ld (hl),a			;659e
	ld d,0e0h		;659f
	ex de,hl			;65a1
	ld de,07074h		;65a2
	call 04841h		;65a5   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	ld hl,0c8e5h		;65a8   ; 0xC8E5 veces; luego p04:6698
	dec (hl)			;65ab
	jp nz,L_6232		;65ac
	jp L_6698		;65af
L_65B2:
	djnz L_65C1		;65b2
	call anima_de00		;65b4   ; anima_de00: parpadeo de 0xDE02 y avance de 0xDE01
	ld a,(0de09h)		;65b7   ; lee la X del sprite 2 en RAM
	cp 0a4h		;65ba
	jp c,L_6232		;65bc
	scf			;65bf
	ret			;65c0
L_65C1:
	ld hl,07074h		;65c1   ; 5 copias de 24 x 32 de (0x70, 0x74) a (0xE0, 0x60), de 0x18 en 0x18
	push hl			;65c4
	ld bc,02018h		;65c5
	push bc			;65c8
	ld de,0e060h		;65c9
	push de			;65cc
	exx			;65cd
	ld b,005h		;65ce
L_65D0:
	exx			;65d0
	ld a,004h		;65d1
	call copia_rectangulo_guardando		;65d3   ; copia_rectangulo_guardando: p00:4BDE sin tocar los registros
	ld a,018h		;65d6
	add a,e			;65d8
	ld e,a			;65d9
	exx			;65da
	djnz L_65D0		;65db
	pop de			;65dd
	push de			;65de
	ld hl,06055h		;65df   ; 4 bloques de fichas de p04:6055 (p00:4D6C)
	ld b,004h		;65e2
L_65E4:
	push bc			;65e4   ; cada bloque de fichas (p00:4D6C)
	call 04d6ch		;65e5   ; bloque_4x3: 4 x 3 fichas de HL con TIMP desde (D, E); cada fila desde D = 0xE0
	pop bc			;65e8
	djnz L_65E4		;65e9
	pop hl			;65eb
	pop bc			;65ec
	pop de			;65ed
	call 04841h		;65ee   ; la copia a la pagina 0
	ld hl,0c8e5h		;65f1   ; 0xC8E5 = 4 y el siguiente paso con 0x30 cuadros
	ld (hl),004h		;65f4
	ld a,030h		;65f6
	jp L_622B		;65f8
sprites_6020:		; 16 bytes de p04:6020 a 0xDE14 y dos colores de sprite
	ld hl,06020h		;65fb
	ld de,0de14h		;65fe   ; apunta a la Y del sprite 5 en RAM
	ld bc,00010h		;6601
	ldir		;6604
	ld hl,0dc50h		;6606
	ld b,001h		;6609
	ld de,00749h		;660b
	call colores_de_sprite		;660e   ; colores_de_sprite: B veces: 16 bytes con D y 16 con E
	ld b,001h		;6611
	ld de,00c4bh		;6613
	jp colores_de_sprite		;6616   ; colores_de_sprite: B veces: 16 bytes con D y 16 con E
L_6619:
	ld hl,0c21fh		;6619   ; 0xC21F: el paso; la cuenta en 0xC221
	ld b,(hl)			;661c
	inc l			;661d
	inc l			;661e
	djnz L_6628		;661f
	dec (hl)			;6621
	jp nz,L_6746		;6622
	jp L_6891		;6625
L_6628:
	djnz L_6630		;6628
	call cursor_parpadea		;662a   ; cursor_parpadea: cada 8 cuadros, sin texto en marcha, el cursor 0x1F / 0x20
	jp L_6136		;662d
L_6630:
	djnz L_6645		;6630
	dec (hl)			;6632
	jp nz,L_6746		;6633
	call borra_pantalla_escena		;6636   ; borra_pantalla_escena: borra 0xFF x 0x60 desde (0, 0)
	jp L_68A5		;6639
borra_pantalla_escena:		; borra 0xFF x 0x60 desde (0, 0)
	ld hl,00000h		;663c
	ld bc,0ff60h		;663f
	jp 05e2fh		;6642   ; borra_rectangulo: HMMV con 0xFF en la pagina 0
L_6645:
	djnz L_664D		;6645
	call cursor_parpadea		;6647   ; cursor_parpadea: cada 8 cuadros, sin texto en marcha, el cursor 0x1F / 0x20
	jp L_615D		;664a
L_664D:
	djnz L_6660		;664d
	dec (hl)			;664f
	jp z,L_6698		;6650
	ld a,(hl)			;6653
	cp 090h		;6654
	call z,mapa_y_vuelve		;6656   ; mapa_y_vuelve: p04:7296 y vuelve atras
	cp 0a0h		;6659
	call z,copia_6850_a_d20d		;665b   ; copia_6850_a_d20d: 10 bytes de p04:6850 a 0xD20D y p04:71FE
	or a			;665e
	ret			;665f
L_6660:
	djnz L_666B		;6660
	call borra_pantalla_escena		;6662   ; borra_pantalla_escena: borra 0xFF x 0x60 desde (0, 0)
	call texto_68d6		;6665   ; texto_68d6: el texto p04:68D6 y p00:4785
	jp L_66EF		;6668
L_666B:
	djnz L_6682		;666b
	dec (hl)			;666d
	jp nz,L_6746		;666e
	ld de,00200h		;6671
	call 055b9h		;6674   ; suma_monedas: las monedas (0xC259, BCD) + E (y D al byte alto)
	call texto_68d6		;6677   ; texto_68d6: el texto p04:68D6 y p00:4785
	ld a,002h		;667a
	call 05451h		;667c   ; sonido_y_456: el sonido A y los bancos 4-5-6
	jp L_66EF		;667f
L_6682:
	djnz L_669E		;6682
	dec (hl)			;6684
	jp nz,L_6746		;6685
	ld hl,0c220h		;6688   ; apunta a la escena (0-11)
	inc (hl)			;668b
	call pinta_escena		;668c   ; pinta_escena: fichas, paleta, mapa, sprites y dibujo de la escena 0xC220
	call sprites_68e5		;668f   ; sprites_68e5: 12 bytes de p04:68E5 a 0xDE00 y los de p04:68F2/68EE
	call patron_78		;6692   ; patron_78: 16 sprites de 0xDE3E con el patron 0x78
	call colores_de_escena		;6695   ; colores_de_escena: los colores de sprite de 0xDC00 por tramos
L_6698:
	ld hl,0c21fh		;6698   ; apunta a el paso de la escena
	inc (hl)			;669b
	or a			;669c
	ret			;669d
L_669E:
	djnz L_66AA		;669e
	call anima_7_0f		;66a0   ; anima_7_0f: p04:67C8 con B = 7 y D = 0x0F
	cp 040h		;66a3
	jp nc,L_6698		;66a5
	or a			;66a8
	ret			;66a9
L_66AA:
	djnz L_66D6		;66aa   ; el paso con p04:67C4: segun la Y del sprite (0x50, 0x4A, 0x46, 0x41), otra cosa
	call anima_7_0f		;66ac   ; anima_7_0f: p04:67C8 con B = 7 y D = 0x0F
	ld hl,068ddh		;66af
	cp 050h		;66b2
	jr z,L_6698		;66b4
	cp 04ah		;66b6
	jr z,L_66D2		;66b8
	cp 046h		;66ba
	jr z,L_66CE		;66bc
	cp 041h		;66be
	jr z,L_66C4		;66c0
	or a			;66c2
	ret			;66c3
L_66C4:
	ld a,002h		;66c4
L_66C6:
	call 04083h		;66c6   ; hl_mas_a: HL = HL + A
L_66C9:
	ld a,001h		;66c9
	jp L_6B7A		;66cb
L_66CE:
	ld a,004h		;66ce
	jr L_66C6		;66d0
L_66D2:
	ld a,006h		;66d2
	jr L_66C6		;66d4
L_66D6:
	djnz L_66F7		;66d6
	call busca_4a		;66d8   ; busca_4a: busca el sprite 0x4A en 0xDE3C (de 16 en 16)
	ld b,003h		;66db
	ld d,007h		;66dd
	call anima_de01_d		;66df   ; anima_de01_d: avanza 0xDE01 y el parpadeo de 0xDE02 cada D cuadros
	cp 064h		;66e2
	jp z,patron_7c		;66e4   ; patron_7c: 16 sprites con el patron 0x7C
	cp 073h		;66e7
	jp c,L_6746		;66e9
	call patron_80		;66ec   ; patron_80: 16 sprites con el patron 0x80
L_66EF:
	ld a,080h		;66ef
	ld (0c221h),a		;66f1   ; guarda la cuenta de la escena
	jp L_6698		;66f4
L_66F7:
	djnz L_6707		;66f7
	dec (hl)			;66f9
	jp z,L_66EF		;66fa
	ld hl,0de02h		;66fd   ; apunta a el patron del sprite 0 en RAM
	ld (hl),0c0h		;6700
	call busca_4a		;6702   ; busca_4a: busca el sprite 0x4A en 0xDE3C (de 16 en 16)
	or a			;6705
	ret			;6706
L_6707:
	djnz L_671D		;6707
	dec (hl)			;6709
	ld a,(hl)			;670a
	jp z,L_66EF		;670b
	cp 040h		;670e
	call z,patron_78		;6710   ; patron_78: 16 sprites de 0xDE3E con el patron 0x78
	cp 07fh		;6713
	call z,patron_7c		;6715   ; patron_7c: 16 sprites con el patron 0x7C
	call busca_4a		;6718   ; busca_4a: busca el sprite 0x4A en 0xDE3C (de 16 en 16)
	or a			;671b
	ret			;671c
L_671D:
	djnz L_6729		;671d
	dec (hl)			;671f
	dec (hl)			;6720
	jp z,L_66EF		;6721
	call baja_sprites_de3c		;6724   ; baja_sprites_de3c: 16 sprites de 0xDE3C hacia abajo hasta 0x74
	or a			;6727
	ret			;6728
L_6729:
	djnz L_6748		;6729   ; la cuenta: a cero, p04:6698; en 0x28, 0x50 y 0x7F cambia el dibujo
	dec (hl)			;672b
	jp z,L_6698		;672c
	ld a,(hl)			;672f
	ld hl,068ddh		;6730
	cp 028h		;6733
	jp z,L_66C9		;6735
	cp 050h		;6738
	jp z,L_66C4		;673a
	cp 07fh		;673d
	jp z,L_66CE		;673f
	xor a			;6742   ; si no, 0xDE02 a cero
	ld (0de02h),a		;6743   ; guarda el patron del sprite 0 en RAM
L_6746:
	or a			;6746
	ret			;6747
L_6748:
	djnz L_6753		;6748
	call anima_7_0f		;674a   ; anima_7_0f: p04:67C8 con B = 7 y D = 0x0F
	cp 0b6h		;674d
	jr c,L_6746		;674f
	scf			;6751
	ret			;6752
L_6753:
	ld (hl),078h		;6753
	ld hl,0675eh		;6755
	call 04d4ah		;6758   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	jp L_6698		;675b

; ----------------------------------------------------------------------
; DATOS resto_675E: tablas cortas que apuntan p04:6755 (0x675E); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p04:6755 (6
;   bytes)
;   0x675e..0x6764  (6 bytes)
DATA_resto_675E:
	defb 074h,0a0h,02ch,046h,046h,0ffh	; 675e

; ======================================================================
; CODIGO 0x6764..0x6850  (236 bytes)
; ======================================================================


sprites_68e5:		; 12 bytes de p04:68E5 a 0xDE00 y los de p04:68F2/68EE
	ld hl,068e5h		;6764
	ld bc,0000ch		;6767
	call copia_a_de00		;676a   ; copia_a_de00: BC bytes de HL a 0xDE00 (los atributos de sprites)
	ld hl,0de0ch		;676d   ; apunta a la Y del sprite 3 en RAM
	ld de,068f2h		;6770
	ld c,004h		;6773
L_6775:
	ld b,004h		;6775
	ld a,(de)			;6777
	call pon_en_sprites		;6778   ; pon_en_sprites: A en B sprites de HL (de 4 en 4)
	inc de			;677b
	dec c			;677c
	jr nz,L_6775		;677d
	ld hl,0de0dh		;677f   ; apunta a la X del sprite 3 en RAM
	ld de,068eeh		;6782
	ld c,004h		;6785
L_6787:
	ld b,007h		;6787
	push hl			;6789
L_678A:
	ld a,(de)			;678a
	ld (hl),a			;678b
	ld a,010h		;678c
	call 04083h		;678e   ; hl_mas_a: HL = HL + A
	djnz L_678A		;6791
	pop hl			;6793
	ld a,004h		;6794
	call 04083h		;6796   ; hl_mas_a: HL = HL + A
	inc de			;6799
	dec c			;679a
	jr nz,L_6787		;679b
colores_de_escena:		; los colores de sprite de 0xDC00 por tramos
	ld bc,0300dh		;679d
	call llena_dc00		;67a0   ; llena_dc00: B bytes de 0xDC00 con C
	ld bc,0400fh		;67a3
	call llena_hl		;67a6   ; llena_hl: B bytes de HL con C
	ld bc,08000h		;67a9
	call llena_hl		;67ac   ; llena_hl: B bytes de HL con C
	ld bc,0800dh		;67af
	call llena_hl		;67b2   ; llena_hl: B bytes de HL con C
	ld b,080h		;67b5
	call llena_hl		;67b7   ; llena_hl: B bytes de HL con C
	ld b,004h		;67ba
	ld hl,0de0eh		;67bc   ; apunta a el patron del sprite 3 en RAM
	ld a,0fch		;67bf
	jp pon_en_sprites		;67c1   ; pon_en_sprites: A en B sprites de HL (de 4 en 4)
anima_7_0f:		; p04:67C8 con B = 7 y D = 0x0F
	ld b,007h		;67c4
	ld d,00fh		;67c6
anima_de01_d:		; avanza 0xDE01 y el parpadeo de 0xDE02 cada D cuadros
	ld hl,0de01h		;67c8   ; apunta a la X del sprite 0 en RAM
	call avanza_sprites		;67cb   ; avanza_sprites: cada B cuadros, + 1 a 3 sprites de HL (de 4 en 4)
	ld hl,0de02h		;67ce   ; apunta a el patron del sprite 0 en RAM
	ld c,000h		;67d1
	call parpadeo_cada_d		;67d3   ; parpadeo_cada_d: cada D cuadros, p04:6257 con B = 2
	ld a,(0de01h)		;67d6   ; lee la X del sprite 0 en RAM
	ret			;67d9
parpadeo_cada_d:		; cada D cuadros, p04:6257 con B = 2
	ld b,002h		;67da
	ld a,(0c003h)		;67dc   ; lee la cuenta de cuadros
	and d			;67df
	ret nz			;67e0
	jp L_6257		;67e1
busca_4a:		; busca el sprite 0x4A en 0xDE3C (de 16 en 16)
	ld b,003h		;67e4
	ld hl,0de3ch		;67e6   ; apunta a la Y del sprite 15 en RAM
L_67E9:
	ld a,(hl)			;67e9
	cp 04ah		;67ea
	jr z,L_67FF		;67ec
	ld a,010h		;67ee
	call 04083h		;67f0   ; hl_mas_a: HL = HL + A
	djnz L_67E9		;67f3
	ld a,(hl)			;67f5
	cp 04ah		;67f6
	jr nz,baja_sprites_de3c		;67f8
	ld hl,0de3ch		;67fa   ; apunta a la Y del sprite 15 en RAM
	jr L_6804		;67fd
L_67FF:
	ld a,010h		;67ff
	call 04083h		;6801   ; hl_mas_a: HL = HL + A
L_6804:
	ld b,004h		;6804
	ld a,03ah		;6806
	call pon_en_sprites		;6808   ; pon_en_sprites: A en B sprites de HL (de 4 en 4)
baja_sprites_de3c:		; 16 sprites de 0xDE3C hacia abajo hasta 0x74
	ld hl,0de3ch		;680b   ; apunta a la Y del sprite 15 en RAM
	ld b,010h		;680e
L_6810:
	ld a,(hl)			;6810   ; baja los sprites de 1 en 1 hasta 0x74; los escondidos (0xE0) no
	cp 0e0h		;6811
	jr z,L_681C		;6813
	cp 074h		;6815
	jr nc,L_6823		;6817
	add a,001h		;6819
	ld (hl),a			;681b
L_681C:
	inc hl			;681c   ; 4 bytes por sprite
	inc hl			;681d
	inc hl			;681e
	inc hl			;681f
	djnz L_6810		;6820
	ret			;6822
L_6823:
	ld (hl),0e0h		;6823
	jr L_681C		;6825
patron_78:		; 16 sprites de 0xDE3E con el patron 0x78
	ld a,078h		;6827
L_6829:
	ld hl,0de3eh		;6829   ; apunta a el patron del sprite 15 en RAM
	ld b,010h		;682c
	jr pon_en_sprites		;682e
patron_7c:		; 16 sprites con el patron 0x7C
	ld a,07ch		;6830
	jr L_6829		;6832
patron_80:		; 16 sprites con el patron 0x80
	ld a,080h		;6834
	jr L_6829		;6836
pon_en_sprites:		; A en B sprites de HL (de 4 en 4)
	ld (hl),a			;6838   ; A en B sprites (de 4 en 4)
	inc hl			;6839
	inc hl			;683a
	inc hl			;683b
	inc hl			;683c
	djnz pon_en_sprites		;683d
	ret			;683f
copia_6850_a_d20d:		; 10 bytes de p04:6850 a 0xD20D y p04:71FE
	ld hl,06850h		;6840
	ld de,0d20dh		;6843
	ld bc,0000ah		;6846
	ldir		;6849
L_684B:
	call dibujo_de_escena		;684b   ; dibujo_de_escena: el dibujo de la escena en su posicion (p04:7239/7251)
	or a			;684e
	ret			;684f

; ----------------------------------------------------------------------
; DATOS resto_6850: tablas cortas que apuntan p04:6840 (0x6850), p00:4765
;   (0x6858); el tamano de cada una sale del lector siguiente, no de
;   recorrerla; lo leen p04:6840, p00:4765 (10 bytes)
;   0x6850..0x685a  (10 bytes)
DATA_resto_6850:
	defb 029h,02ah,02bh,01ah,01bh,004h,02ch,02dh,033h,02eh	; 6850  )*+...,-3.

; ======================================================================
; CODIGO 0x685a..0x68d6  (124 bytes)
; ======================================================================


mapa_y_vuelve:		; p04:7296 y vuelve atras
	call mapa_de_escena		;685a   ; mapa_de_escena: el RLE de la escena (p04:72AE) a 0xD200
	jr $-18		;685d
cursor_parpadea:		; cada 8 cuadros, sin texto en marcha, el cursor 0x1F / 0x20
	ld a,(0c8a6h)		;685f   ; lee el texto a maquina ha acabado
	or a			;6862
	ret nz			;6863
	ld a,(0c003h)		;6864   ; lee la cuenta de cuadros
	and 007h		;6867
	ret nz			;6869
	ld a,(0c8f0h)		;686a
	cp 01fh		;686d
	jr z,L_6889		;686f
	ld hl,0201fh		;6871
	ld (0c8f0h),hl		;6874
L_6877:
	ld de,07888h		;6877
	ld a,(0c8f0h)		;687a
	call 04db4h		;687d   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	ld de,08088h		;6880
	ld a,(0c8f1h)		;6883
	jp 04db4h		;6886   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
L_6889:
	ld hl,02827h		;6889
	ld (0c8f0h),hl		;688c
	jr L_6877		;688f
L_6891:
	xor a			;6891
L_6892:
	ld de,03c28h		;6892
	call empieza_texto_a_maquina		;6895   ; empieza_texto_a_maquina: el texto A de p04:743F (japones) o p04:745D en DE
	ld a,(0002bh)		;6898
	and 00fh		;689b
	jr nz,L_68A2		;689d
	call borra_recuadro_2c20		;689f   ; borra_recuadro_2c20: borra 0xA8 x 0x30 en (0x2C, 0x20)
L_68A2:
	jp L_6698		;68a2
L_68A5:
	ld a,001h		;68a5
	jr L_6892		;68a7
borra_recuadro_2c20:		; borra 0xA8 x 0x30 en (0x2C, 0x20)
	ld hl,02c20h		;68a9
	ld bc,0a830h		;68ac
borra_y_marco:		; borra el rectangulo y p06:A494
	push hl			;68af
	push bc			;68b0
	call 05e2fh		;68b1   ; borra_rectangulo: HMMV con 0xFF en la pagina 0
	pop de			;68b4
	pop hl			;68b5
	jp 0a494h		;68b6   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
borra_recuadro_2773:		; borra 0xB2 x 0x32 en (0x27, 0x73) (BIOS japonesa)
	ld hl,02773h		;68b9
	ld bc,0b232h		;68bc
	jr borra_y_marco		;68bf
borra_de_70:		; borra 0xFF x 0x48 desde (0, 0x70)
	ld hl,00070h		;68c1
	ld bc,0ff48h		;68c4
	jp 05e2fh		;68c7   ; borra_rectangulo: HMMV con 0xFF en la pagina 0
texto_68d6:		; el texto p04:68D6 y p00:4785
	ld hl,068d6h		;68ca
	call 04d4ah		;68cd   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	ld bc,0883bh		;68d0
	jp 04785h		;68d3   ; cifras_dobles_en: las cifras dobles de 0xC25A y 0xC259 en BC (p00:47FE)

; ----------------------------------------------------------------------
; DATOS resto_68D6: tablas cortas que apuntan p04:68CA (0x68D6), p04:66AF
;   (0x68DD), p04:6730 (0x68DD), p04:6764 (0x68E5), p04:6782 (0x68EE),
;   p04:6770 (0x68F2); el tamano de cada una sale del lector siguiente, no de
;   recorrerla; lo leen p04:68CA, p04:66AF, p04:6730, p04:6764, p04:6782,
;   p04:6770 (32 bytes)
;   0x68d6..0x68f6  (32 bytes)
DATA_resto_68D6:
	defb 058h,040h,02dh,039h,033h,038h,0ffh,047h,005h,036h,004h,025h,003h,014h,002h,064h	; 68d6  X@-938.G.6.%...d
	defb 034h,000h,00fh,064h,03bh,008h,00fh,0e0h,038h,048h,0a8h,0b8h,03ah,074h,074h,03ah	; 68e6  4..d....8H..:tt:

; ======================================================================
; CODIGO 0x68f6..0x6a3e  (328 bytes)
; ======================================================================


L_68F6:
	call cuenta_c8e4		;68f6   ; cuenta_c8e4: cada 8 cuadros, 0xC8E4 de 0 a 2 y el patron de 0xDE12
	ld a,(0c21fh)		;68f9   ; lee el paso de la escena
	ld b,a			;68fc
	djnz L_693B		;68fd
	ld hl,0de01h		;68ff   ; apunta a la X del sprite 0 en RAM
	ld bc,004ffh		;6902
	call mueve_sprites		;6905   ; mueve_sprites: cada 8 cuadros, + C a B sprites de HL
	ld a,(0de01h)		;6908   ; lee la X del sprite 0 en RAM
	cp 098h		;690b
	push af			;690d
	call c,parpadeo_de02_8		;690e   ; parpadeo_de02_8: cada 8 cuadros, 0xDE02 xor 0xC0 y el patron 0x5C
	pop af			;6911
	cp 078h		;6912
	jp nc,L_69E1		;6914
	ld hl,06a51h		;6917
	ld bc,00010h		;691a
	call copia_a_de00		;691d   ; copia_a_de00: BC bytes de HL a 0xDE00 (los atributos de sprites)
	xor a			;6920
	ld (0c8e5h),a		;6921
	jp L_6698		;6924
parpadeo_de02_8:		; cada 8 cuadros, 0xDE02 xor 0xC0 y el patron 0x5C
	ld a,(0c003h)		;6927   ; lee la cuenta de cuadros
	and 007h		;692a
	ret nz			;692c
	ld hl,0de02h		;692d   ; apunta a el patron del sprite 0 en RAM
	ld a,0c0h		;6930
	xor (hl)			;6932
	ld b,001h		;6933
	call pon_en_sprites		;6935   ; pon_en_sprites: A en B sprites de HL (de 4 en 4)
	ld (hl),05ch		;6938
	ret			;693a
L_693B:
	djnz L_699A		;693b
	ld a,(0c003h)		;693d   ; lee la cuenta de cuadros
	and 00fh		;6940
	jp nz,L_69E1		;6942
	ld a,(0de08h)		;6945   ; lee la Y del sprite 2 en RAM
	push af			;6948
	cp 06ah		;6949
	call c,mueve_de08		;694b   ; mueve_de08: p04:69E9 con 0xDE08, 2 sprites, paso 6
	pop af			;694e
	cp 06ah		;694f
	call nc,sprites_de0a		;6951   ; sprites_de0a: 2 sprites de 0xDE0A desde 0x3C de 4 en 4 y 0xDE0C = 0x6A
	ld hl,0de01h		;6954   ; apunta a la X del sprite 0 en RAM
	ld bc,004fdh		;6957
	call mueve_sprites		;695a   ; mueve_sprites: cada 8 cuadros, + C a B sprites de HL
	ld hl,0de05h		;695d   ; apunta a la X del sprite 1 en RAM
	ld bc,00102h		;6960
	call mueve_sprites		;6963   ; mueve_sprites: cada 8 cuadros, + C a B sprites de HL
	ld hl,0de02h		;6966   ; apunta a el patron del sprite 0 en RAM
	ld c,060h		;6969
	ld d,00fh		;696b
	call parpadeo_cada_d		;696d   ; parpadeo_cada_d: cada D cuadros, p04:6257 con B = 2
	call paso_c8e5		;6970   ; paso_c8e5: el paso 0xC8E5 (hasta 12) con los desplazamientos de p04:6A60
	ld hl,0de04h		;6973   ; apunta a la Y del sprite 1 en RAM
	ld a,(hl)			;6976
	cp 067h		;6977
	jp c,L_69E1		;6979
	ld (hl),0e0h		;697c
	or a			;697e
	ret			;697f
sprites_de0a:		; 2 sprites de 0xDE0A desde 0x3C de 4 en 4 y 0xDE0C = 0x6A
	ld hl,0de0ah		;6980   ; apunta a el patron del sprite 2 en RAM
	ld a,03ch		;6983
	ld bc,00204h		;6985
	call sprites_en_fila		;6988   ; sprites_en_fila: B sprites de HL con A, A + C...
	ld hl,0de0ch		;698b   ; apunta a la Y del sprite 3 en RAM
	ld (hl),06ah		;698e
	ret			;6990
mueve_de08:		; p04:69E9 con 0xDE08, 2 sprites, paso 6
	ld hl,0de08h		;6991   ; apunta a la Y del sprite 2 en RAM
	ld bc,00206h		;6994
	jp L_69E9		;6997
L_699A:
	djnz L_69CF		;699a
	ld hl,0de01h		;699c   ; apunta a la X del sprite 0 en RAM
	ld bc,004ffh		;699f
	call mueve_sprites		;69a2   ; mueve_sprites: cada 8 cuadros, + C a B sprites de HL
	ld hl,0de01h		;69a5   ; apunta a la X del sprite 0 en RAM
	ld a,(hl)			;69a8
	cp 040h		;69a9
	call c,pon_c0		;69ab   ; pon_c0: (HL + 1) = 0xC0
	cp 042h		;69ae
	push af			;69b0
	call c,colores_dc18		;69b1   ; colores_dc18: 8 colores de 0xDC18 y los patrones 0x71 y 0x5C
	pop af			;69b4
	cp 030h		;69b5
	ret			;69b7
pon_c0:		; (HL + 1) = 0xC0
	inc hl			;69b8
	ld (hl),0c0h		;69b9
	ret			;69bb
colores_dc18:		; 8 colores de 0xDC18 y los patrones 0x71 y 0x5C
	ld hl,0dc18h		;69bc
	ld bc,00007h		;69bf
	call 05f08h		;69c2   ; borra: pone a cero BC + 1 bytes desde HL
	ld hl,0de04h		;69c5   ; apunta a la Y del sprite 1 en RAM
	ld (hl),071h		;69c8
	inc hl			;69ca
	inc hl			;69cb
	ld (hl),05ch		;69cc
	ret			;69ce
L_69CF:
	ld hl,06a3eh		;69cf
	ld bc,00014h		;69d2
	call copia_a_de00		;69d5   ; copia_a_de00: BC bytes de HL a 0xDE00 (los atributos de sprites)
	ld bc,0500dh		;69d8
	call llena_dc00		;69db   ; llena_dc00: B bytes de 0xDC00 con C
	jp L_6698		;69de
L_69E1:
	or a			;69e1
	ret			;69e2
mueve_sprites:		; cada 8 cuadros, + C a B sprites de HL
	ld a,(0c003h)		;69e3   ; lee la cuenta de cuadros
	and 007h		;69e6
	ret nz			;69e8
L_69E9:
	ld a,c			;69e9   ; + C a B sprites (de 4 en 4)
	add a,(hl)			;69ea
	ld (hl),a			;69eb
	inc hl			;69ec
	inc hl			;69ed
	inc hl			;69ee
	inc hl			;69ef
	djnz L_69E9		;69f0
	ret			;69f2
cuenta_c8e4:		; cada 8 cuadros, 0xC8E4 de 0 a 2 y el patron de 0xDE12
	ld a,(0c003h)		;69f3   ; lee la cuenta de cuadros
	and 007h		;69f6
	ret nz			;69f8
	ld hl,0c8e4h		;69f9
	inc (hl)			;69fc
	ld a,(hl)			;69fd
	cp 003h		;69fe
	jr c,L_6A04		;6a00
	xor a			;6a02
	ld (hl),a			;6a03
L_6A04:
	rla			;6a04
	rla			;6a05
	add a,084h		;6a06
	ld (0de12h),a		;6a08   ; guarda el patron del sprite 4 en RAM
	ret			;6a0b
sprites_en_fila:		; B sprites de HL con A, A + C...
	ld (hl),a			;6a0c   ; B sprites con A, A + C, A + 2C...
	add a,c			;6a0d
	inc hl			;6a0e
	inc hl			;6a0f
	inc hl			;6a10
	inc hl			;6a11
	djnz sprites_en_fila		;6a12
	ret			;6a14
paso_c8e5:		; el paso 0xC8E5 (hasta 12) con los desplazamientos de p04:6A60
	ld hl,0c8e5h		;6a15
	ld a,(hl)			;6a18
	cp 00ch		;6a19
	jp z,L_6A36		;6a1b
	inc (hl)			;6a1e
	ld hl,06a60h		;6a1f
	call 0543ah		;6a22   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;6a25
	ld hl,0de00h		;6a26   ; apunta a los atributos de los sprites en RAM
	ld c,e			;6a29
	call suma_a_sprite		;6a2a   ; suma_a_sprite: (HL) + C y HL + 4
	ld c,d			;6a2d
suma_a_sprite:		; (HL) + C y HL + 4
	ld a,c			;6a2e   ; + C a un sprite y HL al siguiente
	add a,(hl)			;6a2f
	ld (hl),a			;6a30
	inc hl			;6a31
	inc hl			;6a32
	inc hl			;6a33
	inc hl			;6a34
	ret			;6a35
L_6A36:
	ld hl,0de02h		;6a36   ; apunta a el patron del sprite 0 en RAM
	ld (hl),054h		;6a39
	jp L_6698		;6a3b

; ----------------------------------------------------------------------
; DATOS resto_6A3E: tablas cortas que apuntan p04:69CF (0x6A3E), p04:6917
;   (0x6A51), p04:6A1F (0x6A60); el tamano de cada una sale del lector
;   siguiente, no de recorrerla; lo leen p04:69CF, p04:6917, p04:6A1F (58
;   bytes)
;   0x6a3e..0x6a78  (58 bytes)
DATA_resto_6A3E:
	defb 04dh,0bah,0c0h,000h,04dh,0c0h,0c8h,000h,050h,0bch,03ch,000h,050h,0cch,040h,000h	; 6a3e  M...M...P.<.P.@.
	defb 06ch,070h,08ch,04dh,076h,068h,000h,04dh,07ch,060h,000h,058h,078h,044h,000h,050h	; 6a4e  lp.Mvh.M|`.XxD.P
	defb 088h,048h,0feh,0fah,0ffh,0fbh,0ffh,0fch,000h,000h,000h,005h,001h,006h,001h,009h	; 6a5e  .H..............
	defb 004h,013h,005h,015h,005h,000h,005h,000h,008h,000h	; 6a6e  ..........

; ======================================================================
; CODIGO 0x6a78..0x6aa6  (46 bytes)
; ======================================================================


L_6A78:
	ld hl,0c21fh		;6a78   ; apunta a el paso de la escena
	ld b,(hl)			;6a7b
	inc l			;6a7c
	inc l			;6a7d
	djnz $+44		;6a7e
	dec (hl)			;6a80
	jr z,L_6A9C		;6a81
	call colores_142		;6a83   ; colores_142: p04:7029 con B = 4 y DE = 0x0142
	ld hl,07088h		;6a86
	ld bc,00020h		;6a89
	call copia_a_de00		;6a8c   ; copia_a_de00: BC bytes de HL a 0xDE00 (los atributos de sprites)
	ld hl,06aa6h		;6a8f
	ld de,0c8ech		;6a92
	ld bc,00004h		;6a95
	ldir		;6a98
	or a			;6a9a
	ret			;6a9b
L_6A9C:
	ld a,009h		;6a9c
	call texto_a_maquina		;6a9e   ; texto_a_maquina: p04:73D2 en (0x30, 0x7C), borrando antes con la BIOS japonesa
	ld a,0f1h		;6aa1
	jp L_622B		;6aa3

; ----------------------------------------------------------------------
; DATOS resto_6AA6: tablas cortas que apuntan p04:6A8F (0x6AA6); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p04:6A8F (4
;   bytes)
;   0x6aa6..0x6aaa  (4 bytes)
DATA_resto_6AA6:
	defb 003h,015h,009h,00fh	; 6aa6

; ======================================================================
; CODIGO 0x6aaa..0x6b1f  (117 bytes)
; ======================================================================


L_6AAA:
	djnz L_6AC7		;6aaa
	dec (hl)			;6aac
	jp z,L_6698		;6aad
	call texto_si_toca		;6ab0   ; texto_si_toca: p04:73FD si el texto a maquina sigue (0xC8A6 a cero)
	ld a,(0c003h)		;6ab3   ; lee la cuenta de cuadros
	and 001h		;6ab6
	jr z,L_6ABD		;6ab8
	call cuatro_cuentas		;6aba   ; cuatro_cuentas: las cuentas de 0xC8EC (hasta 0x18) y los sprites de p04:6FF4
L_6ABD:
	or a			;6abd
	ret			;6abe
texto_si_toca:		; p04:73FD si el texto a maquina sigue (0xC8A6 a cero)
	ld a,(0c8a6h)		;6abf   ; lee el texto a maquina ha acabado
	or a			;6ac2
	jp z,letra_a_maquina		;6ac3   ; letra_a_maquina: cada 0xC8A5 cuadros, el siguiente caracter del texto
	ret			;6ac6
L_6AC7:
	djnz L_6AFD		;6ac7
	call texto_si_toca		;6ac9   ; texto_si_toca: p04:73FD si el texto a maquina sigue (0xC8A6 a cero)
	ld a,(0c003h)		;6acc   ; lee la cuenta de cuadros
	and 001h		;6acf
	jp nz,L_6ABD		;6ad1
	ld a,(0de00h)		;6ad4   ; lee los atributos de los sprites en RAM
	cp 038h		;6ad7
	jr nc,L_6AF4		;6ad9
	ld hl,0de00h		;6adb   ; apunta a los atributos de los sprites en RAM
	ld de,07080h		;6ade
	call cuatro_pares		;6ae1   ; cuatro_pares: 4 pares de sprites (p04:6FB6) desde (DE) + C
	ld hl,0de01h		;6ae4   ; apunta a la X del sprite 0 en RAM
cuatro_pares:		; 4 pares de sprites (p04:6FB6) desde (DE) + C
	ld b,004h		;6ae7
L_6AE9:
	ld a,(de)			;6ae9
	ld c,(hl)			;6aea
	add a,c			;6aeb
	call dos_sprites		;6aec   ; dos_sprites: A en 2 sprites de HL
	inc de			;6aef
	djnz L_6AE9		;6af0
	or a			;6af2
	ret			;6af3
L_6AF4:
	xor a			;6af4
	ld (0c8eah),a		;6af5
L_6AF8:
	ld a,0a0h		;6af8
	jp L_622B		;6afa
L_6AFD:
	djnz $+50		;6afd
	call texto_si_toca		;6aff   ; texto_si_toca: p04:73FD si el texto a maquina sigue (0xC8A6 a cero)
	ld a,(0c003h)		;6b02   ; lee la cuenta de cuadros
	and 003h		;6b05
	ret nz			;6b07
	ld hl,0c8eah		;6b08
	ld a,(hl)			;6b0b
	cp 010h		;6b0c
	jp z,L_703D		;6b0e
	inc (hl)			;6b11
	inc (hl)			;6b12
	ld c,004h		;6b13
L_6B15:
	push bc			;6b15
	call color_de_6b1f		;6b16   ; color_de_6b1f: el color C de la paleta con p04:6B1F[A]
	pop bc			;6b19
	dec c			;6b1a
	jr nz,L_6B15		;6b1b
	or a			;6b1d
	ret			;6b1e

; ----------------------------------------------------------------------
; DATOS resto_6B1F: tablas cortas que apuntan p04:6B73 (0x6B1F); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p04:6B73 (16
;   bytes)
;   0x6b1f..0x6b2f  (16 bytes)
DATA_resto_6B1F:
	defb 000h,000h,011h,001h,022h,002h,033h,003h,044h,004h,055h,005h,066h,006h,077h,007h	; 6b1f  ....".3.D.U.f.w.

; ======================================================================
; CODIGO 0x6b2f..0x6b51  (34 bytes)
; ======================================================================


L_6B2F:
	djnz $+44		;6b2f
	push hl			;6b31
	call texto_si_toca		;6b32   ; texto_si_toca: p04:73FD si el texto a maquina sigue (0xC8A6 a cero)
	pop hl			;6b35
	dec (hl)			;6b36
	jp nz,L_6ABD		;6b37
	ld hl,070a7h		;6b3a
	ld bc,00018h		;6b3d
	call copia_a_de00		;6b40   ; copia_a_de00: BC bytes de HL a 0xDE00 (los atributos de sprites)
	ld hl,06b51h		;6b43
	call 04a9dh		;6b46   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
	ld a,00eh		;6b49
	ld (0c8eah),a		;6b4b
	jp L_6698		;6b4e

; ----------------------------------------------------------------------
; DATOS resto_6B51: tablas cortas que apuntan p04:6B43 (0x6B51); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p04:6B43 (10
;   bytes)
;   0x6b51..0x6b5b  (10 bytes)
DATA_resto_6B51:
	defb 001h,067h,006h,002h,027h,002h,003h,005h,000h,0ffh	; 6b51  .g..'.....

; ======================================================================
; CODIGO 0x6b5b..0x6bab  (80 bytes)
; ======================================================================


L_6B5B:
	djnz L_6B87		;6b5b
	call texto_si_toca		;6b5d   ; texto_si_toca: p04:73FD si el texto a maquina sigue (0xC8A6 a cero)
	ld c,004h		;6b60
baja_c8ea:		; cada 4 cuadros, 0xC8EA - 2 hasta 0xFE
	ld a,(0c003h)		;6b62   ; lee la cuenta de cuadros
	and 003h		;6b65
	ret nz			;6b67
	ld hl,0c8eah		;6b68
	ld a,(hl)			;6b6b
	cp 0feh		;6b6c
	jp z,L_6B82		;6b6e
	dec (hl)			;6b71
	dec (hl)			;6b72
color_de_6b1f:		; el color C de la paleta con p04:6B1F[A]
	ld hl,06b1fh		;6b73
	call 04083h		;6b76   ; hl_mas_a: HL = HL + A
	ld a,c			;6b79
L_6B7A:
	ld d,(hl)			;6b7a
	inc hl			;6b7b
	ld e,(hl)			;6b7c
	call 04a73h		;6b7d   ; pon_color: el color A de la paleta = D (0RRR0BBB) y E (00000GGG), copia en 0xF680
	or a			;6b80
	ret			;6b81
L_6B82:
	xor a			;6b82
	ld (hl),a			;6b83
	jp L_6DE1		;6b84
L_6B87:
	djnz $+66		;6b87
	call texto_si_toca		;6b89   ; texto_si_toca: p04:73FD si el texto a maquina sigue (0xC8A6 a cero)
	ld a,(0c003h)		;6b8c   ; lee la cuenta de cuadros
	and 00fh		;6b8f
	ret nz			;6b91
	ld hl,0c8eah		;6b92
	ld a,(hl)			;6b95
	cp 01eh		;6b96
	jp z,L_6698		;6b98
	ld c,a			;6b9b
	add a,00ah		;6b9c
	ld (hl),a			;6b9e
	ld a,c			;6b9f
	ld hl,06babh		;6ba0
	call 04083h		;6ba3   ; hl_mas_a: HL = HL + A
	call 04a9dh		;6ba6   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
	or a			;6ba9
	ret			;6baa

; ----------------------------------------------------------------------
; DATOS resto_6BAB: tablas cortas que apuntan p04:6BA0 (0x6BAB); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p04:6BA0 (30
;   bytes)
;   0x6bab..0x6bc9  (30 bytes)
DATA_resto_6BAB:
	defb 001h,067h,006h,002h,036h,002h,003h,014h,000h,0ffh,001h,076h,006h,002h,052h,004h	; 6bab  .g..6......v..R.
	defb 003h,030h,002h,0ffh,001h,076h,006h,002h,072h,002h,003h,050h,000h,0ffh	; 6bbb  .0...v..r..P..

; ======================================================================
; CODIGO 0x6bc9..0x6ce7  (286 bytes)
; ======================================================================


L_6BC9:
	djnz L_6BD7		;6bc9
	call texto_si_toca		;6bcb   ; texto_si_toca: p04:73FD si el texto a maquina sigue (0xC8A6 a cero)
	ld a,(0c8a6h)		;6bce   ; lee el texto a maquina ha acabado
	or a			;6bd1
	jp nz,L_66EF		;6bd2
	or a			;6bd5
	ret			;6bd6
L_6BD7:
	djnz L_6BDC		;6bd7
	jp L_6E4F		;6bd9
L_6BDC:
	djnz L_6C04		;6bdc
	ld hl,0c220h		;6bde   ; apunta a la escena (0-11)
	inc (hl)			;6be1
	call pinta_escena		;6be2   ; pinta_escena: fichas, paleta, mapa, sprites y dibujo de la escena 0xC220
	ld hl,070beh		;6be5
	ld bc,00014h		;6be8
	call copia_a_de00		;6beb   ; copia_a_de00: BC bytes de HL a 0xDE00 (los atributos de sprites)
	ld b,001h		;6bee
	ld de,00e49h		;6bf0
	call colores_dc00		;6bf3   ; colores_dc00: p04:702C desde 0xDC00
	ld bc,0400dh		;6bf6
	call llena_hl		;6bf9   ; llena_hl: B bytes de HL con C
	ld a,00ah		;6bfc
	call texto_a_maquina		;6bfe   ; texto_a_maquina: p04:73D2 en (0x30, 0x7C), borrando antes con la BIOS japonesa
	jp L_6698		;6c01
L_6C04:
	djnz L_6C28		;6c04
	ld a,(0de09h)		;6c06   ; lee la X del sprite 2 en RAM
	cp 060h		;6c09
	jr nc,L_6C1A		;6c0b
	ld hl,0de09h		;6c0d   ; apunta a la X del sprite 2 en RAM
	ld b,001h		;6c10
	call avanza_sprites		;6c12   ; avanza_sprites: cada B cuadros, + 1 a 3 sprites de HL (de 4 en 4)
	call letra_a_maquina		;6c15   ; letra_a_maquina: cada 0xC8A5 cuadros, el siguiente caracter del texto
	or a			;6c18
	ret			;6c19
L_6C1A:
	ld de,0de10h		;6c1a   ; apunta a la Y del sprite 4 en RAM
	ld hl,070d1h		;6c1d
	ld bc,00008h		;6c20
	ldir		;6c23
	jp L_6698		;6c25
L_6C28:
	djnz L_6C54		;6c28
	call texto_si_toca		;6c2a   ; texto_si_toca: p04:73FD si el texto a maquina sigue (0xC8A6 a cero)
	ld a,(0de11h)		;6c2d   ; lee la X del sprite 4 en RAM
	cp 094h		;6c30
	jp nc,L_6C47		;6c32
	ld hl,0de11h		;6c35   ; apunta a la X del sprite 4 en RAM
	ld b,007h		;6c38
	call avanza_sprites		;6c3a   ; avanza_sprites: cada B cuadros, + 1 a 3 sprites de HL (de 4 en 4)
	ld hl,0de12h		;6c3d   ; apunta a el patron del sprite 4 en RAM
	ld c,000h		;6c40
	call parpadeo_de_2		;6c42   ; parpadeo_de_2: p04:6251 con B = 2
	or a			;6c45
	ret			;6c46
L_6C47:
	ld a,(0c8a6h)		;6c47   ; lee el texto a maquina ha acabado
	and 001h		;6c4a
	jp z,L_6ABD		;6c4c
L_6C4F:
	ld a,0c0h		;6c4f
	jp L_622B		;6c51
L_6C54:
	djnz L_6C59		;6c54
	jp L_6E4F		;6c56
L_6C59:
	djnz L_6C65		;6c59
	ld hl,0c220h		;6c5b   ; apunta a la escena (0-11)
	inc (hl)			;6c5e
	call pinta_escena		;6c5f   ; pinta_escena: fichas, paleta, mapa, sprites y dibujo de la escena 0xC220
	jp L_6698		;6c62
L_6C65:
	djnz L_6C9D		;6c65
	ld hl,0de00h		;6c67   ; apunta a los atributos de los sprites en RAM
	ld b,008h		;6c6a
	ld a,05fh		;6c6c
	call pon_en_sprites		;6c6e   ; pon_en_sprites: A en B sprites de HL (de 4 en 4)
	ld bc,08000h		;6c71
	call llena_dc00		;6c74   ; llena_dc00: B bytes de 0xDC00 con C
	ld hl,0dc80h		;6c77
	ld b,001h		;6c7a
	ld de,00748h		;6c7c
	call colores_de_sprite		;6c7f   ; colores_de_sprite: B veces: 16 bytes con D y 16 con E
	ld b,001h		;6c82
	ld de,00c4bh		;6c84
	call colores_de_sprite		;6c87   ; colores_de_sprite: B veces: 16 bytes con D y 16 con E
	ld hl,070d8h		;6c8a
	ld de,0de20h		;6c8d   ; apunta a la Y del sprite 8 en RAM
	ld bc,00010h		;6c90
	ldir		;6c93
	ld a,00bh		;6c95
	call texto_a_maquina		;6c97   ; texto_a_maquina: p04:73D2 en (0x30, 0x7C), borrando antes con la BIOS japonesa
	jp L_6698		;6c9a
L_6C9D:
	djnz L_6CC6		;6c9d
	call letra_a_maquina		;6c9f   ; letra_a_maquina: cada 0xC8A5 cuadros, el siguiente caracter del texto
	ld a,(0c003h)		;6ca2   ; lee la cuenta de cuadros
	and 00fh		;6ca5
	jp nz,L_6ABD		;6ca7
	ld hl,0de20h		;6caa   ; apunta a la Y del sprite 8 en RAM
	ld a,(hl)			;6cad
	cp 050h		;6cae
	jp c,L_6CBC		;6cb0
	ld b,004h		;6cb3
L_6CB5:
	dec (hl)			;6cb5   ; - 1 a B sprites (de 4 en 4)
	inc hl			;6cb6
	inc hl			;6cb7
	inc hl			;6cb8
	inc hl			;6cb9
	djnz L_6CB5		;6cba
L_6CBC:
	ld a,(0c8a6h)		;6cbc   ; lee el texto a maquina ha acabado
	or a			;6cbf
	jp z,L_6ABD		;6cc0
	jp L_6C4F		;6cc3
L_6CC6:
	djnz L_6CCB		;6cc6
	jp L_6E4F		;6cc8
L_6CCB:
	djnz $+31		;6ccb
	ld hl,0c220h		;6ccd   ; apunta a la escena (0-11)
	inc (hl)			;6cd0
	call pinta_escena		;6cd1   ; pinta_escena: fichas, paleta, mapa, sprites y dibujo de la escena 0xC220
	ld hl,06ce7h		;6cd4
	ld de,0c8e6h		;6cd7
	ld bc,00003h		;6cda
	ldir		;6cdd
	ld a,00ch		;6cdf
	call texto_a_maquina		;6ce1   ; texto_a_maquina: p04:73D2 en (0x30, 0x7C), borrando antes con la BIOS japonesa
	jp L_6698		;6ce4

; ----------------------------------------------------------------------
; DATOS resto_6CE7: tablas cortas que apuntan p04:6CD4 (0x6CE7); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p04:6CD4 (3
;   bytes)
;   0x6ce7..0x6cea  (3 bytes)
DATA_resto_6CE7:
	defb 062h,042h,04fh	; 6ce7

; ======================================================================
; CODIGO 0x6cea..0x6e8d  (419 bytes)
; ======================================================================


L_6CEA:
	djnz L_6CF4		;6cea
	ld hl,0c221h		;6cec   ; apunta a la cuenta de la escena
	ld (hl),0c0h		;6cef
	jp L_613B		;6cf1
L_6CF4:
	djnz L_6D00		;6cf4
	dec (hl)			;6cf6
	jp nz,L_6ABD		;6cf7
	call borra_de_70		;6cfa   ; borra_de_70: borra 0xFF x 0x48 desde (0, 0x70)
	jp L_6698		;6cfd
L_6D00:
	djnz L_6D3A		;6d00
	ld a,(0c003h)		;6d02   ; lee la cuenta de cuadros
	and 003h		;6d05
	jp nz,L_6ABD		;6d07
	ld a,(0c8e8h)		;6d0a
	cp 061h		;6d0d
	jp z,L_6D3C		;6d0f
	ld c,00fh		;6d12
	call rectangulo_c8e6		;6d14   ; rectangulo_c8e6: el rectangulo de 0xC8E6-0xC8E8
	call encoge_c8e6		;6d17   ; encoge_c8e6: 0xC8E6 - 2 y 0xC8E7/0xC8E8 + 1
	ld c,00dh		;6d1a
	call rectangulo_c8e6		;6d1c   ; rectangulo_c8e6: el rectangulo de 0xC8E6-0xC8E8
	or a			;6d1f
	ret			;6d20
rectangulo_c8e6:		; el rectangulo de 0xC8E6-0xC8E8
	ld hl,0c8e6h		;6d21
	ld d,(hl)			;6d24
	inc hl			;6d25
	ld e,(hl)			;6d26
	inc hl			;6d27
	ld h,(hl)			;6d28
	ld l,01fh		;6d29
	jp 04b74h		;6d2b   ; rectangulo: los cuatro lados de un rectangulo (p00:4B8E y p00:4B98)
encoge_c8e6:		; 0xC8E6 - 2 y 0xC8E7/0xC8E8 + 1
	ld hl,0c8e6h		;6d2e
	dec (hl)			;6d31
	ld b,002h		;6d32
L_6D34:
	dec (hl)			;6d34
	inc hl			;6d35
	djnz L_6D34		;6d36
	inc (hl)			;6d38
	ret			;6d39
L_6D3A:
	djnz L_6D94		;6d3a
L_6D3C:
	ld hl,0de00h		;6d3c   ; apunta a los atributos de los sprites en RAM
	ld de,070e7h		;6d3f
	call doce_sprites		;6d42   ; doce_sprites: 12 bytes de DE en 12 sprites de HL
	ld hl,0de01h		;6d45   ; apunta a la X del sprite 0 en RAM
	call doce_sprites		;6d48   ; doce_sprites: 12 bytes de DE en 12 sprites de HL
	ld hl,0de02h		;6d4b   ; apunta a el patron del sprite 0 en RAM
	ld a,0fch		;6d4e
	ld b,00ch		;6d50
	call pon_en_sprites		;6d52   ; pon_en_sprites: A en B sprites de HL (de 4 en 4)
	ld hl,070ffh		;6d55
	ld de,0de30h		;6d58   ; apunta a la Y del sprite 12 en RAM
	ld bc,00038h		;6d5b
	ldir		;6d5e
	ld bc,0c00fh		;6d60   ; apunta a las teclas especiales que hay
	call llena_dc00		;6d63   ; llena_dc00: B bytes de 0xDC00 con C
	ld b,003h		;6d66
	ld hl,0dc00h		;6d68   ; apunta a los colores de los sprites en RAM (16 por sprite)
L_6D6B:
	ld (hl),00dh		;6d6b
	ld a,040h		;6d6d
	call 04083h		;6d6f   ; hl_mas_a: HL = HL + A
	djnz L_6D6B		;6d72
	ld b,004h		;6d74
	ld de,00748h		;6d76
	call colores_de_sprite		;6d79   ; colores_de_sprite: B veces: 16 bytes con D y 16 con E
	ld b,003h		;6d7c
	ld de,00142h		;6d7e
	call colores_de_sprite		;6d81   ; colores_de_sprite: B veces: 16 bytes con D y 16 con E
	jp L_6698		;6d84
doce_sprites:		; 12 bytes de DE en 12 sprites de HL
	ld c,00ch		;6d87
L_6D89:
	ld a,(de)			;6d89
	ld b,001h		;6d8a
	call pon_en_sprites		;6d8c   ; pon_en_sprites: A en B sprites de HL (de 4 en 4)
	inc de			;6d8f
	dec c			;6d90
	ret z			;6d91
	jr L_6D89		;6d92
L_6D94:
	djnz L_6DBA		;6d94
	ld a,(0c003h)		;6d96   ; lee la cuenta de cuadros
	and 001h		;6d99
	jp z,L_6ABD		;6d9b
	ld hl,0de30h		;6d9e   ; apunta a la Y del sprite 12 en RAM
	ld de,0ff07h		;6da1
	call pares_de_sprites		;6da4   ; pares_de_sprites: E pares de sprites de (HL) + D
	ld a,(0de30h)		;6da7   ; lee la Y del sprite 12 en RAM
	cp 024h		;6daa
	jp z,L_6698		;6dac
	or a			;6daf
	ret			;6db0
pares_de_sprites:		; E pares de sprites de (HL) + D
	ld b,e			;6db1
L_6DB2:
	ld a,(hl)			;6db2
	add a,d			;6db3
	call dos_sprites		;6db4   ; dos_sprites: A en 2 sprites de HL
	djnz L_6DB2		;6db7
	ret			;6db9
L_6DBA:
	djnz L_6DD8		;6dba
	ld a,(0c003h)		;6dbc   ; lee la cuenta de cuadros
	and 001h		;6dbf
	jp z,L_6ABD		;6dc1
	ld hl,0de30h		;6dc4   ; apunta a la Y del sprite 12 en RAM
	ld de,00104h		;6dc7
	call pares_de_sprites		;6dca   ; pares_de_sprites: E pares de sprites de (HL) + D
	ld a,(0de30h)		;6dcd   ; lee la Y del sprite 12 en RAM
	cp 04fh		;6dd0
	jp nz,L_6ABD		;6dd2
	jp L_6C4F		;6dd5
L_6DD8:
	djnz L_6DE5		;6dd8
	dec (hl)			;6dda
	jp nz,L_6ABD		;6ddb
	call borra_de_70		;6dde   ; borra_de_70: borra 0xFF x 0x48 desde (0, 0x70)
L_6DE1:
	xor a			;6de1
	jp L_622B		;6de2
L_6DE5:
	djnz L_6E1B		;6de5   ; el paso: la cuenta de (HL); por debajo de 0x60, de 0x60 a 0x9F y el resto
	dec (hl)			;6de7
	jr z,L_6E0C		;6de8
	ld a,(hl)			;6dea
	cp 060h		;6deb
	jr c,L_6E04		;6ded
	cp 0a0h		;6def
	jr c,L_6E08		;6df1
	ld c,003h		;6df3
L_6DF5:
	ld a,r		;6df5
	and c			;6df7
	ld hl,07136h		;6df8
	call 04083h		;6dfb   ; hl_mas_a: HL = HL + A
	ld d,(hl)			;6dfe
	call 055aah		;6dff   ; ajuste_de_pantalla: R#18 (ajuste de la imagen) = D
	or a			;6e02
	ret			;6e03
L_6E04:
	ld c,00fh		;6e04
	jr L_6DF5		;6e06
L_6E08:
	ld c,007h		;6e08
	jr L_6DF5		;6e0a
L_6E0C:
	ld d,000h		;6e0c
	call 055aah		;6e0e   ; ajuste_de_pantalla: R#18 (ajuste de la imagen) = D
	ld hl,0c8f6h		;6e11
	ld (hl),008h		;6e14
	ld a,050h		;6e16
	jp L_622B		;6e18
L_6E1B:
	djnz L_6E20		;6e1b
	jp L_6E4F		;6e1d
L_6E20:
	djnz L_6E4D		;6e20   ; cada 8 cuadros, una barra mas de p06:B51B (0xC8F6 cuantas)
	ld a,(0c003h)		;6e22   ; lee la cuenta de cuadros
	and 007h		;6e25
	jp nz,L_6ABD		;6e27
	ld hl,0c8f6h		;6e2a
	ld a,(hl)			;6e2d
	or a			;6e2e
	jp z,L_66EF		;6e2f
	ld b,a			;6e32
	dec (hl)			;6e33
	dec b			;6e34
	ld hl,0b51bh		;6e35
L_6E38:
	push bc			;6e38   ; cada barra (p04:7043), 3 bytes por barra, hasta que 0xC8F2 este puesto
	push hl			;6e39
	call barra_de_puntos		;6e3a   ; barra_de_puntos: la barra de (HL) con el limite B
	pop hl			;6e3d
	pop bc			;6e3e
	inc hl			;6e3f
	inc hl			;6e40
	inc hl			;6e41
	ld a,(0c8f2h)		;6e42
	or a			;6e45
	jr z,L_6E38		;6e46
	xor a			;6e48
	ld (0c8f2h),a		;6e49
	ret			;6e4c
L_6E4D:
	djnz L_6E55		;6e4d
L_6E4F:
	dec (hl)			;6e4f
	jp z,L_6698		;6e50
	or a			;6e53
	ret			;6e54
L_6E55:
	djnz L_6E61		;6e55
	ld hl,0c220h		;6e57   ; apunta a la escena (0-11)
	inc (hl)			;6e5a
	call pinta_escena		;6e5b   ; pinta_escena: fichas, paleta, mapa, sprites y dibujo de la escena 0xC220
	jp L_6698		;6e5e
L_6E61:
	djnz L_6E6E		;6e61   ; el paso: (HL) - 2; a cero, p04:6AF8
	dec (hl)			;6e63
	dec (hl)			;6e64
	jp z,L_6AF8		;6e65
	xor a			;6e68
	ld (0c8e8h),a		;6e69
	or a			;6e6c
	ret			;6e6d
L_6E6E:
	djnz $+35		;6e6e
	dec (hl)			;6e70
	jp z,L_66EF		;6e71
	ld a,(0c003h)		;6e74   ; lee la cuenta de cuadros
	and 001h		;6e77
	ret z			;6e79
	ld a,(0c8e8h)		;6e7a
	xor 002h		;6e7d
	ld (0c8e8h),a		;6e7f
	ld hl,06e8dh		;6e82
	call 04083h		;6e85   ; hl_mas_a: HL = HL + A
	ld a,005h		;6e88
	jp L_6B7A		;6e8a

; ----------------------------------------------------------------------
; DATOS resto_6E8D: tablas cortas que apuntan p04:6E82 (0x6E8D); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p04:6E82 (4
;   bytes)
;   0x6e8d..0x6e91  (4 bytes)
DATA_resto_6E8D:
	defb 077h,007h,000h,000h	; 6e8d

; ======================================================================
; CODIGO 0x6e91..0x6ed5  (68 bytes)
; ======================================================================


L_6E91:
	djnz L_6EAE		;6e91
	dec (hl)			;6e93
	jp nz,L_6ABD		;6e94
	ld bc,0100dh		;6e97
	call llena_dc00		;6e9a   ; llena_dc00: B bytes de 0xDC00 con C
	ld a,018h		;6e9d
	ld (0c8e8h),a		;6e9f
	xor a			;6ea2
	ld (0c8e6h),a		;6ea3
	ld a,0a0h		;6ea6
	ld (0de02h),a		;6ea8   ; guarda el patron del sprite 0 en RAM
	jp L_6698		;6eab
L_6EAE:
	djnz $+49		;6eae
	ld hl,0c8e8h		;6eb0
	dec (hl)			;6eb3
	jr z,L_6EBE		;6eb4
	ld hl,08848h		;6eb6
	ld (0de00h),hl		;6eb9   ; guarda los atributos de los sprites en RAM y el byte siguiente (16 bits)
	or a			;6ebc
	ret			;6ebd
L_6EBE:
	ld (hl),010h		;6ebe
	ld hl,0c8e6h		;6ec0
	ld a,(hl)			;6ec3
	inc (hl)			;6ec4
	ld hl,06ed5h		;6ec5
	call 04083h		;6ec8   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;6ecb
	inc a			;6ecc
	jp z,L_6AF8		;6ecd
	ld (0de02h),a		;6ed0   ; guarda el patron del sprite 0 en RAM
	or a			;6ed3
	ret			;6ed4

; ----------------------------------------------------------------------
; DATOS resto_6ED5: tablas cortas que apuntan p04:6EC5 (0x6ED5); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p04:6EC5 (10
;   bytes)
;   0x6ed5..0x6edf  (10 bytes)
DATA_resto_6ED5:
	defb 0a0h,0a4h,0a8h,0ach,0b0h,0b4h,0ach,0b0h,0b4h,0ffh	; 6ed5  ..........

; ======================================================================
; CODIGO 0x6edf..0x6ff4  (277 bytes)
; ======================================================================


L_6EDF:
	djnz L_6F01		;6edf   ; el paso: al acabar la cuenta, esconde los sprites y apaga y borra la pantalla
	dec (hl)			;6ee1
	jp nz,L_6ABD		;6ee2
	call 04a44h		;6ee5   ; esconde_sprites: Y = 0xE0 en las dos tablas de atributos (0x7600 y 0xF600)
	call 04a07h		;6ee8   ; apaga_y_borra_212: pantalla apagada y las 0xD4 (212) lineas de la pagina 0 a cero (p00:4A0A)
	ld a,(0002bh)		;6eeb   ; con la BIOS no japonesa, una espera de 0x100 y 0xC21F + 8
	and 00fh		;6eee
	jp z,L_66EF		;6ef0
	ld hl,00100h		;6ef3
	ld (0c8f7h),hl		;6ef6
	ld hl,0c21fh		;6ef9   ; apunta a el paso de la escena
	ld a,(hl)			;6efc
	add a,008h		;6efd
	ld (hl),a			;6eff
	ret			;6f00
L_6F01:
	djnz L_6F1B		;6f01
	dec (hl)			;6f03
	jp nz,L_6ABD		;6f04
	ld hl,0371bh		;6f07
	ld bc,0928ah		;6f0a
	call borra_y_marco		;6f0d   ; borra_y_marco: borra el rectangulo y p06:A494
	ld a,00dh		;6f10
	ld de,04024h		;6f12
	call empieza_texto_a_maquina		;6f15   ; empieza_texto_a_maquina: el texto A de p04:743F (japones) o p04:745D en DE
	jp L_6698		;6f18
L_6F1B:
	djnz L_6F20		;6f1b
L_6F1D:
	jp L_615D		;6f1d
L_6F20:
	djnz L_6F25		;6f20
	jp L_6E4F		;6f22
L_6F25:
	djnz L_6F3B		;6f25
	ld hl,0371bh		;6f27
	ld bc,0928ah		;6f2a
	call borra_y_marco		;6f2d   ; borra_y_marco: borra el rectangulo y p06:A494
	ld a,00eh		;6f30
	ld de,04024h		;6f32
	call empieza_texto_a_maquina		;6f35   ; empieza_texto_a_maquina: el texto A de p04:743F (japones) o p04:745D en DE
	jp L_6698		;6f38
L_6F3B:
	djnz L_6F3F		;6f3b
	jr L_6F1D		;6f3d
L_6F3F:
	djnz L_6F4B		;6f3f
	dec (hl)			;6f41
	jp nz,L_6ABD		;6f42
	call 04a07h		;6f45   ; apaga_y_borra_212: pantalla apagada y las 0xD4 (212) lineas de la pagina 0 a cero (p00:4A0A)
	jp L_6C4F		;6f48
L_6F4B:
	djnz L_6F69		;6f4b
	dec (hl)			;6f4d
	jp nz,L_6ABD		;6f4e
	ld hl,03003h		;6f51
	ld bc,09fbah		;6f54
	call borra_y_marco		;6f57   ; borra_y_marco: borra el rectangulo y p06:A494
	ld hl,07146h		;6f5a
	call 04d4ah		;6f5d   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	ld hl,00200h		;6f60
	ld (0c8f7h),hl		;6f63
	jp L_6698		;6f66
L_6F69:
	djnz L_6F7D		;6f69   ; la espera de 0xC8F7 (16 bits) y p04:6DE1
	ld hl,0c8f7h		;6f6b
	dec (hl)			;6f6e
	jp nz,L_6ABD		;6f6f
	inc hl			;6f72
	dec (hl)			;6f73
	jp nz,L_6ABD		;6f74
	call 04a07h		;6f77   ; apaga_y_borra_212: pantalla apagada y las 0xD4 (212) lineas de la pagina 0 a cero (p00:4A0A)
	jp L_6DE1		;6f7a
L_6F7D:
	djnz L_6F92		;6f7d
	ld hl,071c8h		;6f7f
	call 04d4ah		;6f82   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	ld a,0ffh		;6f85
	call 05451h		;6f87   ; sonido_y_456: el sonido A y los bancos 4-5-6
	ld a,00eh		;6f8a
	ld (0c8eah),a		;6f8c
	jp L_6DE1		;6f8f
L_6F92:
	djnz L_6F9B		;6f92
	dec (hl)			;6f94
	jp nz,L_6ABD		;6f95
	jp L_6DE1		;6f98
L_6F9B:
	djnz L_6FA8		;6f9b
	dec (hl)			;6f9d
	jp z,L_6698		;6f9e
	ld c,00dh		;6fa1
	call baja_c8ea		;6fa3   ; baja_c8ea: cada 4 cuadros, 0xC8EA - 2 hasta 0xFE
	or a			;6fa6
	ret			;6fa7
L_6FA8:
	djnz L_6FB0		;6fa8
	dec (hl)			;6faa
	jp nz,L_6ABD		;6fab
	scf			;6fae
	ret			;6faf
L_6FB0:
	ld (hl),0e0h		;6fb0
	dec l			;6fb2
	dec l			;6fb3
	inc (hl)			;6fb4
	ret			;6fb5
dos_sprites:		; A en 2 sprites de HL
	push bc			;6fb6
	ld b,002h		;6fb7
	call pon_en_sprites		;6fb9   ; pon_en_sprites: A en B sprites de HL (de 4 en 4)
	pop bc			;6fbc
	ret			;6fbd
cuatro_cuentas:		; las cuentas de 0xC8EC (hasta 0x18) y los sprites de p04:6FF4
	ld b,004h		;6fbe
L_6FC0:
	ld a,b			;6fc0
	dec a			;6fc1
	ld hl,0c8ech		;6fc2
	call 04083h		;6fc5   ; hl_mas_a: HL = HL + A
	inc (hl)			;6fc8
	ld a,(hl)			;6fc9
	cp 018h		;6fca
	call nc,cero_en_hl		;6fcc   ; cero_en_hl: (HL) = 0
	ld hl,06ff4h		;6fcf
	call 0543ah		;6fd2   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;6fd5
	ld a,b			;6fd6
	dec a			;6fd7
	add a,a			;6fd8
	add a,a			;6fd9
	add a,a			;6fda
	ld hl,0de00h		;6fdb   ; apunta a los atributos de los sprites en RAM
	call 04083h		;6fde   ; hl_mas_a: HL = HL + A
	push hl			;6fe1
	ld a,(hl)			;6fe2
	add a,e			;6fe3
	call dos_sprites		;6fe4   ; dos_sprites: A en 2 sprites de HL
	pop hl			;6fe7
	inc hl			;6fe8
	ld a,(hl)			;6fe9
	add a,d			;6fea
	call dos_sprites		;6feb   ; dos_sprites: A en 2 sprites de HL
	djnz L_6FC0		;6fee
	ret			;6ff0
cero_en_hl:		; (HL) = 0
	xor a			;6ff1
	ld (hl),a			;6ff2
	ret			;6ff3

; ----------------------------------------------------------------------
; DATOS resto_6FF4: tablas cortas que apuntan p04:6FCF (0x6FF4), p05:946B
;   (0x7000); el tamano de cada una sale del lector siguiente, no de
;   recorrerla; lo leen p04:6FCF, p05:946B (48 bytes)
;   0x6ff4..0x7024  (48 bytes)
DATA_resto_6FF4:
	defb 001h,0f8h,003h,0f8h,005h,0f9h,007h,0fbh,008h,0fdh,008h,0ffh,008h,001h,008h,003h	; 6ff4  ................
	defb 007h,005h,005h,007h,003h,008h,001h,008h,0ffh,008h,0fdh,008h,0fbh,007h,0f9h,005h	; 7004  ................
	defb 0f8h,003h,0f8h,001h,0f8h,0ffh,0f8h,0fdh,0f9h,0fbh,0fbh,0f9h,0fdh,0f8h,0ffh,0f8h	; 7014  ................

; ======================================================================
; CODIGO 0x7024..0x7080  (92 bytes)
; ======================================================================


colores_142:		; p04:7029 con B = 4 y DE = 0x0142
	ld b,004h		;7024
	ld de,00142h		;7026
colores_dc00:		; p04:702C desde 0xDC00
	ld hl,0dc00h		;7029   ; apunta a los colores de los sprites en RAM (16 por sprite)
colores_de_sprite:		; B veces: 16 bytes con D y 16 con E
	push bc			;702c
	ld b,010h		;702d
L_702F:
	ld (hl),d			;702f
	inc hl			;7030
	djnz L_702F		;7031
	ld b,010h		;7033
L_7035:
	ld (hl),e			;7035   ; 16 bytes con E
	inc hl			;7036
	djnz L_7035		;7037
	pop bc			;7039
	djnz colores_de_sprite		;703a
	ret			;703c
L_703D:
	call 04a44h		;703d   ; esconde_sprites: Y = 0xE0 en las dos tablas de atributos (0x7600 y 0xF600)
	jp L_66EF		;7040
barra_de_puntos:		; la barra de (HL) con el limite B
	ld c,(hl)			;7043   ; [C][..][..]: 0xFF acaba (p04:707B)
	ld a,c			;7044
	cp 0ffh		;7045
	jp z,L_707B		;7047
	inc hl			;704a
	ld a,(hl)			;704b   ; el nibble alto del segundo byte contra B * 16: el menor a 0xC8F3
	and 0f0h		;704c
	ld d,a			;704e
	ld a,b			;704f
	rlca			;7050
	rlca			;7051
	rlca			;7052
	rlca			;7053
	cp d			;7054
	jr c,L_7058		;7055
	ld a,d			;7057
L_7058:
	ld (0c8f3h),a		;7058   ; el nibble bajo contra B: el menor a 0xC8F4
	ld a,(hl)			;705b
	and 00fh		;705c
	cp b			;705e
	jr c,L_7062		;705f
	ld a,b			;7061
L_7062:
	ld (0c8f4h),a		;7062   ; el tercer byte contra B: el menor
	inc hl			;7065
	ld a,(hl)			;7066
	cp b			;7067
	jr c,L_706B		;7068
	ld a,b			;706a
L_706B:
	ld (0c8f5h),a		;706b
	ld hl,0c8f3h		;706e
	ld a,(hl)			;7071
	inc hl			;7072
	or (hl)			;7073
	ld d,a			;7074
	inc hl			;7075
	ld e,(hl)			;7076
	ld a,c			;7077
	jp 04a73h		;7078   ; pon_color: el color A de la paleta = D (0RRR0BBB) y E (00000GGG), copia en 0xF680
L_707B:
	ld hl,0c8f2h		;707b
	inc (hl)			;707e
	ret			;707f

; ----------------------------------------------------------------------
; DATOS resto_7080: tablas cortas que apuntan p04:6ADE (0x7080); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p04:6ADE (8
;   bytes)
;   0x7080..0x7088  (8 bytes)
DATA_resto_7080:
	defb 002h,002h,0feh,0feh,002h,0feh,002h,0feh	; 7080  ........

; ----------------------------------------------------------------------
; DATOS copia_7088: 32 bytes que p04:6A86 copia (ldir, o uno a uno en
;   p04:6D87) a 0xDE00-0xDE30; el ultimo es tambien el primero de la tabla
;   siguiente; se solapan 6 bloques: (copia_70A7 70A7-70BF) (copia_70BE
;   70BE-70D2) (copia_70D1 70D1-70D9) (copia_70D8 70D8-70E8) (copia_70E7
;   70E7-70F3); lo leen p04:6A86, p04:6B3A, p04:6BE5, p04:6C1D, p04:6C8A,
;   p04:6D3F (107 bytes)
;   0x7088..0x70f3  (107 bytes)
DATA_copia_7088:
	defb 024h,064h,030h,000h,024h,064h,034h,000h	; 7088  $d0.$d4.
	defb 024h,08ch,030h,000h,024h,08ch,034h,000h	; 7090  $.0.$.4.
	defb 04ch,064h,030h,000h,04ch,064h,034h,000h	; 7098  Ld0.Ld4.
	defb 04ch,08ch,030h,000h,04ch,08ch,034h,034h	; 70a0  L.0.L.44
	defb 070h,040h,000h,034h,070h,044h,000h,034h	; 70a8  p@.4pD.4
	defb 080h,048h,000h,034h,080h,04ch,000h,044h	; 70b0  .H.4.L.D
	defb 078h,050h,000h,044h,078h,054h,047h,098h	; 70b8  xP.DxTG.
	defb 078h,000h,047h,098h,07ch,000h,047h,040h	; 70c0  x.G.|.G@
	defb 020h,000h,047h,050h,024h,000h,03fh,040h	; 70c8   .GP$.?@
	defb 028h,047h,070h,000h,00fh,047h,074h,008h	; 70d0  (Gp..Gt.
	defb 05fh,070h,0c0h,000h,05fh,070h,0c4h,000h	; 70d8  _p.._p..
	defb 05fh,080h,0d0h,000h,05fh,080h,0d4h,04dh	; 70e0  _..._..M
	defb 05dh,06dh,07dh,04dh,05dh,06dh,07dh,04dh	; 70e8  ]m}M]m}M
	defb 05dh,06dh,07dh	; 70f0

; ----------------------------------------------------------------------
; DATOS resto_70F3: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (12 bytes)
;   0x70f3..0x70ff  (12 bytes)
DATA_resto_70F3:
	defb 06eh,06eh,06eh,06eh,07eh,07eh,07eh,07eh,08eh,08eh,08eh,08eh	; 70f3  nnnn~~~~....

; ----------------------------------------------------------------------
; DATOS copia_70FF: 56 bytes que p04:6D55 copia (ldir, o uno a uno en
;   p04:6D87) a 0xDE00-0xDE30; el ultimo es tambien el primero de la tabla
;   siguiente; se solapan 2 bloques: (tabla_p6DF8 7136-7146); lo leen
;   p04:6D55, p04:6DF8 (71 bytes)
;   0x70ff..0x7146  (71 bytes)
DATA_copia_70FF:
	defb 050h,07dh,070h,000h,050h,07dh,074h,000h	; 70ff  P}p.P}t.
	defb 05fh,074h,068h,000h,05fh,074h,06ch,000h	; 7107  _th._tl.
	defb 060h,084h,060h,000h,060h,084h,064h,000h	; 710f  `.`.`.d.
	defb 070h,088h,058h,000h,070h,088h,05ch,000h	; 7117  p.X.p.\.
	defb 04dh,070h,040h,000h,04dh,070h,044h,000h	; 711f  Mp@.MpD.
	defb 04dh,080h,048h,000h,04dh,080h,04ch,000h	; 7127  M.H.M.L.
	defb 05dh,078h,050h,000h,05dh,078h,054h,010h	; 712f  ]xP.]xT.
	defb 0f0h,001h,00fh,020h,0e0h,002h,00eh,040h	; 7137  ... ...@
	defb 0c0h,004h,00ch,070h,080h,007h,008h	; 713f

; ----------------------------------------------------------------------
; DATOS texto_p6F5A: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p04:6F5A (130 bytes)
;   0x7146..0x71c8  (130 bytes)
DATA_texto_p6F5A:
	defb 06ch,008h,03dh,03eh,02bh,030h,030h,0feh,074h,020h,03dh,032h,03fh,0feh,058h,030h	; 7146  l.=>+00.t =2?.X0
	defb 033h,03dh,02bh,039h,020h,020h,035h,033h,0feh,058h,040h,03eh,039h,037h,039h,020h	; 7156  3=+9  53.X@>979
	defb 020h,03eh,02fh,038h,0feh,050h,050h,043h,039h,03dh,032h,033h,020h,020h,02dh,032h	; 7166   >/8.PPC9=23  -2
	defb 033h,02bh,035h,033h,0feh,058h,060h,03dh,02bh,03eh,039h,020h,020h,035h,02bh,044h	; 7176  3+53.X`=+>9  5+D
	defb 03fh,039h,0feh,058h,070h,035h,02bh,044h,03fh,020h,020h,043h,02bh,037h,02bh,035h	; 7186  ?9.Xp5+D?  C+7+5
	defb 039h,0feh,058h,080h,035h,03fh,03ch,039h,020h,020h,037h,039h,03eh,039h,0feh,058h	; 7196  9.X.5?<9  79>9.X
	defb 090h,037h,02bh,03dh,02bh,020h,020h,03eh,039h,043h,039h,0feh,048h,0a0h,035h,03fh	; 71a6  .7+=+  >9C9.H.5?
	defb 037h,02bh,044h,039h,020h,020h,033h,035h,03fh,0feh,06ch,0b0h,037h,03ch,07ch,037h	; 71b6  7+D9  35?.l.7<|7
	defb 039h,0ffh	; 71c6

; ----------------------------------------------------------------------
; DATOS texto_p6F7F: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p04:6F7F (10 bytes)
;   0x71c8..0x71d2  (10 bytes)
DATA_texto_p6F7F:
	defb 064h,058h,03eh,032h,02fh,020h,02fh,038h,02eh,0ffh	; 71c8  dX>2/ /8..

; ======================================================================
; CODIGO 0x71d2..0x71f8  (38 bytes)
; ======================================================================


escena_de_la_ruina:		; la escena de la ruina (p04:71EA) y p04:71D5
	call escena_por_ruina		;71d2   ; escena_por_ruina: 0xC220 = p04:71F8[ruina]
pinta_escena:		; fichas, paleta, mapa, sprites y dibujo de la escena 0xC220
	call 04a2ch		;71d5   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call fichas_de_escena		;71d8   ; fichas_de_escena: la lista de fichas de la escena segun 0xC220
	call paleta_de_escena		;71db   ; paleta_de_escena: la paleta p06:B3DE[0xC220]
	call mapa_de_escena		;71de   ; mapa_de_escena: el RLE de la escena (p04:72AE) a 0xD200
	call sprites_de_escena		;71e1   ; sprites_de_escena: los patrones de sprite de la escena (p05:8855, 88CE, 8AE8)
	call dibujo_de_escena		;71e4   ; dibujo_de_escena: el dibujo de la escena en su posicion (p04:7239/7251)
	jp 04a12h		;71e7   ; pantalla_encendida: R#1 con el bit 6 (pantalla) y sprites encendidos
escena_por_ruina:		; 0xC220 = p04:71F8[ruina]
	ld a,(0c21dh)		;71ea   ; lee la ruina (0-4)
	ld hl,071f8h		;71ed
	call 04083h		;71f0   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;71f3
	ld (0c220h),a		;71f4   ; guarda la escena (0-11)
	ret			;71f7

; ----------------------------------------------------------------------
; DATOS escena_siguiente: 6 bytes: la escena (0xC220) que pone p04:71ED segun
;   A; lo leen p04:71ED (6 bytes)
;   0x71f8..0x71fe  (6 bytes)
DATA_escena_siguiente:
	defb 000h,002h,003h,004h,006h,007h	; 71f8

; ======================================================================
; CODIGO 0x71fe..0x7239  (59 bytes)
; ======================================================================


dibujo_de_escena:		; el dibujo de la escena en su posicion (p04:7239/7251)
	ld a,(0c220h)		;71fe   ; lee la escena (0-11)
	ld hl,07239h		;7201
	cp 007h		;7204
	jp z,L_7269		;7206
	push af			;7209
	call 0543ah		;720a   ; palabra_a: HL = la palabra A de la tabla HL
	pop af			;720d
	ld d,l			;720e
	ld e,h			;720f
	ld hl,07251h		;7210
	call 0543ah		;7213   ; palabra_a: HL = la palabra A de la tabla HL
	push hl			;7216
	push de			;7217
	call pinta_bloque_d200		;7218   ; pinta_bloque_d200: filas y columnas de 0xD200 con H/L (p04:7275)
	pop hl			;721b
	pop de			;721c
	dec h			;721d
	dec l			;721e
	ld a,d			;721f
	add a,a			;7220
	add a,a			;7221
	add a,a			;7222
	add a,002h		;7223
	ld d,a			;7225
	ld a,e			;7226
	add a,a			;7227
	add a,a			;7228
	add a,a			;7229
	add a,002h		;722a
	ld e,a			;722c
	call 0a494h		;722d   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	ld a,(0c220h)		;7230   ; lee la escena (0-11)
	cp 008h		;7233
	jp z,L_72DF		;7235
	ret			;7238

; ----------------------------------------------------------------------
; DATOS escenas_posicion: 12 palabras: (X, Y) del dibujo de cada escena
;   (p04:7201, la 7 no); lo leen p04:7201 (24 bytes)
;   0x7239..0x7251  (24 bytes)
DATA_escenas_posicion:
	defb 040h,020h	; 7239
	defb 040h,020h	; 723b
	defb 040h,04ch	; 723d
	defb 040h,04ch	; 723f
	defb 068h,068h	; 7241
	defb 038h,04ch	; 7243
	defb 030h,04ch	; 7245
	defb 000h,000h	; 7247
	defb 040h,020h	; 7249
	defb 050h,020h	; 724b
	defb 050h,020h	; 724d
	defb 050h,020h	; 724f

; ----------------------------------------------------------------------
; DATOS escenas_tamano: 12 palabras: filas y columnas del dibujo de cada
;   escena para p04:7272; lo leen p04:7210 (24 bytes)
;   0x7251..0x7269  (24 bytes)
DATA_escenas_tamano:
	defb 008h,010h	; 7251
	defb 008h,010h	; 7253
	defb 008h,010h	; 7255
	defb 008h,010h	; 7257
	defb 006h,006h	; 7259
	defb 006h,012h	; 725b
	defb 006h,014h	; 725d
	defb 000h,000h	; 725f
	defb 008h,010h	; 7261
	defb 008h,00ch	; 7263
	defb 008h,00ch	; 7265
	defb 008h,00ch	; 7267

; ======================================================================
; CODIGO 0x7269..0x72ae  (69 bytes)
; ======================================================================


L_7269:
	ld hl,04f1fh		;7269
	ld de,06242h		;726c
	jp 0a494h		;726f   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
pinta_bloque_d200:		; filas y columnas de 0xD200 con H/L (p04:7275)
	ld (0de80h),hl		;7272   ; guarda variable de trabajo del banco 0 y el byte siguiente (16 bits)
pinta_bloque:		; 0xDE80 filas de 0xDE81 fichas de 0xD200 en (D, E) con TIMP
	ld hl,0d200h		;7275   ; apunta a el mapa de 32 x 24 fichas de la pantalla
	ld a,(0de80h)		;7278   ; lee variable de trabajo del banco 0
	ld b,a			;727b
L_727C:
	push de			;727c
	push bc			;727d
	ld a,(0de81h)		;727e
	ld b,a			;7281
L_7282:
	ld a,(hl)			;7282   ; una fila de fichas con TIMP
	call ficha_timp		;7283   ; ficha_timp: la ficha A en (D, E) con TIMP (LMMM 0x48)
	inc hl			;7286
	ld a,d			;7287
	add a,008h		;7288
	ld d,a			;728a
	djnz L_7282		;728b
	pop bc			;728d
	pop de			;728e
	ld a,e			;728f   ; la siguiente fila
	add a,008h		;7290
	ld e,a			;7292
	djnz L_727C		;7293
	ret			;7295
mapa_de_escena:		; el RLE de la escena (p04:72AE) a 0xD200
	ld a,(0c220h)		;7296   ; lee la escena (0-11)
	cp 007h		;7299
	jr z,$+43		;729b
	cp 004h		;729d
	jr z,$+52		;729f
	ld hl,072aeh		;72a1
	call 0543ah		;72a4   ; palabra_a: HL = la palabra A de la tabla HL
rle_a_d200:		; RLE de HL a 0xD200
	ex de,hl			;72a7
	ld hl,0d200h		;72a8   ; apunta a el mapa de 32 x 24 fichas de la pantalla
	jp 05578h		;72ab   ; rle: RLE de DE a HL: 0 acaba, n < 0x80 repite el siguiente, si no copia n & 0x7F

; ----------------------------------------------------------------------
; DATOS escenas_mapa: 12 palabras: el mapa RLE de fichas de cada escena 0-11 a
;   0xD200 (p04:72A1: p04:72AE[0xC220]); la 4 y la 7 no lo leen (p04:729B,
;   p04:729F); lo leen p04:7296 (24 bytes)
;   0x72ae..0x72c6  (24 bytes)
DATA_escenas_mapa:
	defb 0e4h,08dh	; 72ae
	defb 054h,08eh	; 72b0
	defb 0d5h,08eh	; 72b2
	defb 03ah,08fh	; 72b4
	defb 0a9h,08fh	; 72b6
	defb 0cdh,08fh	; 72b8
	defb 023h,090h	; 72ba
	defb 0c6h,072h	; 72bc
	defb 08eh,090h	; 72be
	defb 01ch,091h	; 72c0
	defb 073h,091h	; 72c2
	defb 0d0h,091h	; 72c4

; ======================================================================
; CODIGO 0x72c6..0x733b  (117 bytes)
; ======================================================================


L_72C6:
	ld hl,05020h		;72c6
	ld bc,06040h		;72c9
	ld a,044h		;72cc
	ld d,000h		;72ce
	jp 04ba2h		;72d0   ; rellena_rectangulo: HMMV (0xC0): rectangulo B x C en (H, L) de la pagina D con el color A
L_72D3:
	ld hl,08fa9h		;72d3
	ld de,0d200h		;72d6   ; apunta a el mapa de 32 x 24 fichas de la pantalla
	ld bc,00024h		;72d9
	ldir		;72dc
	ret			;72de
L_72DF:
	ld hl,090f8h		;72df
	call rle_a_d200		;72e2   ; rle_a_d200: RLE de HL a 0xD200
	ld de,09820h		;72e5
	ld hl,00507h		;72e8
	jp pinta_bloque_d200		;72eb   ; pinta_bloque_d200: filas y columnas de 0xD200 con H/L (p04:7275)
ficha_timp:		; la ficha A en (D, E) con TIMP (LMMM 0x48)
	push bc			;72ee
	push hl			;72ef
	push de			;72f0
	call 04e2bh		;72f1   ; origen_de_ficha: HL = (X, Y) de la ficha A en la pagina 1: (A & 31) * 8, (A >> 5) * 8
	ld bc,00808h		;72f4
	ld a,048h		;72f7
	call 04c73h		;72f9   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop de			;72fc
	pop hl			;72fd
	pop bc			;72fe
	ret			;72ff
fichas_de_escena:		; la lista de fichas de la escena segun 0xC220
	ld a,(0c220h)		;7300   ; lee la escena (0-11)
	cp 002h		;7303
	jp c,051adh		;7305   ; graficos_de_escena: listas de fichas p07:61C1 y p04:799C
	cp 004h		;7308
	jr z,L_7332		;730a
	cp 007h		;730c
	jp z,051adh		;730e   ; graficos_de_escena: listas de fichas p07:61C1 y p04:799C
	cp 008h		;7311
	jr nc,L_731E		;7313
	ld de,07aedh		;7315
	ld hl,07b3dh		;7318
	jp 0529ch		;731b   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
L_731E:
	sub 008h		;731e
	push af			;7320
	ld hl,0733bh		;7321
	call 0543ah		;7324   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;7327
	pop af			;7328
	ld hl,07343h		;7329
	call 0543ah		;732c   ; palabra_a: HL = la palabra A de la tabla HL
	jp 0529ch		;732f   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
L_7332:
	ld de,080b2h		;7332
	ld hl,080bch		;7335
	jp 0529ch		;7338   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]

; ----------------------------------------------------------------------
; DATOS escenas_listas: 4 + 4 palabras: la tabla de colores y la lista de
;   fichas de las escenas 8-11 (p04:731E); lo leen p04:731E (16 bytes)
;   0x733b..0x734b  (16 bytes)
DATA_escenas_listas:
	defb 06fh,083h	; 733b
	defb 088h,083h	; 733d
	defb 0adh,083h	; 733f
	defb 0c6h,083h	; 7341
	defb 07bh,083h	; 7343
	defb 094h,083h	; 7345
	defb 0b3h,083h	; 7347
	defb 0d8h,083h	; 7349

; ======================================================================
; CODIGO 0x734b..0x73bd  (114 bytes)
; ======================================================================


sprites_de_escena:		; los patrones de sprite de la escena (p05:8855, 88CE, 8AE8)
	ld de,08855h		;734b
	ld hl,0f800h		;734e
	call 0492ch		;7351   ; rle_a_vram: RLE de DE a la VRAM HL: 0 acaba, n < 0x80 repite, 0x80 otra direccion, si no copia n & 0x7F
	ld de,088ceh		;7354
	ld hl,0f900h		;7357
	call 0492ch		;735a   ; rle_a_vram: RLE de DE a la VRAM HL: 0 acaba, n < 0x80 repite, 0x80 otra direccion, si no copia n & 0x7F
	ld de,08855h		;735d
	ld hl,0fe00h		;7360
	call 04955h		;7363   ; sprite_volteado: RLE de DE (p00:49CE), lo voltea (p00:496C) y lo copia a la VRAM HL
	ld hl,0ffe0h		;7366
	ld a,0ffh		;7369
	ld bc,00020h		;736b
	call 048c3h		;736e   ; llena_vram: llena BC bytes de la VRAM HL con A
	ld a,(0c220h)		;7371   ; lee la escena (0-11)
	cp 002h		;7374
	jr c,L_737B		;7376
	cp 007h		;7378
	ret c			;737a
L_737B:
	ld hl,0f980h		;737b
	ld de,08ae8h		;737e
	jp 0492ch		;7381   ; rle_a_vram: RLE de DE a la VRAM HL: 0 acaba, n < 0x80 repite, 0x80 otra direccion, si no copia n & 0x7F
paleta_de_escena:		; la paleta p06:B3DE[0xC220]
	ld a,(0c220h)		;7384   ; lee la escena (0-11)
	ld hl,0b3deh		;7387
	call 0543ah		;738a   ; palabra_a: HL = la palabra A de la tabla HL
	jp 04a9dh		;738d   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
pantalla_73b4:		; paleta, mapa p05:93C6, el dibujo y el texto p04:73BD
	call 04a2ch		;7390   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call paleta_b3d4		;7393   ; paleta_b3d4: la paleta p06:B3D4
	call mapa_93c6		;7396   ; mapa_93c6: el RLE p05:93C6 a 0xD200
	ld de,05c48h		;7399
	ld hl,00a0ah		;739c
	ld (0de80h),hl		;739f   ; guarda variable de trabajo del banco 0 y el byte siguiente (16 bits)
	call pinta_bloque		;73a2   ; pinta_bloque: 0xDE80 filas de 0xDE81 fichas de 0xD200 en (D, E) con TIMP
	ld hl,073bdh		;73a5
	call 04d4ah		;73a8   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	jp 04a12h		;73ab   ; pantalla_encendida: R#1 con el bit 6 (pantalla) y sprites encendidos
paleta_b3d4:		; la paleta p06:B3D4
	ld hl,0b3d4h		;73ae
	jp 04a9dh		;73b1   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
mapa_93c6:		; el RLE p05:93C6 a 0xD200
	ld de,093c6h		;73b4
	ld hl,0d200h		;73b7   ; apunta a el mapa de 32 x 24 fichas de la pantalla
	jp 05578h		;73ba   ; rle: RLE de DE a HL: 0 acaba, n < 0x80 repite el siguiente, si no copia n & 0x7F

; ----------------------------------------------------------------------
; DATOS texto_p73A5: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p04:73A5 (8 bytes)
;   0x73bd..0x73c5  (8 bytes)
DATA_texto_p73A5:
	defb 070h,018h,037h,020h,02bh,020h,03ah,0ffh	; 73bd  p.7 + :.

; ======================================================================
; CODIGO 0x73c5..0x743f  (122 bytes)
; ======================================================================


texto_a_maquina:		; p04:73D2 en (0x30, 0x7C), borrando antes con la BIOS japonesa
	push af			;73c5
	ld a,(0002bh)		;73c6
	and 00fh		;73c9
	call z,borra_recuadro_2773		;73cb   ; borra_recuadro_2773: borra 0xB2 x 0x32 en (0x27, 0x73) (BIOS japonesa)
	pop af			;73ce
	ld de,0307ch		;73cf
empieza_texto_a_maquina:		; el texto A de p04:743F (japones) o p04:745D en DE
	push af			;73d2   ; 0x002B: el juego de caracteres de la BIOS (0 = japones)
	ld hl,0743fh		;73d3
	ld a,(0002bh)		;73d6
	and 00fh		;73d9
	jr z,L_73E4		;73db
	ld a,d			;73dd   ; con otra BIOS, el texto de p04:745D y 16 puntos mas a la izquierda
	sub 010h		;73de
	ld d,a			;73e0
	ld hl,0745dh		;73e1
L_73E4:
	pop af			;73e4
	call 0543ah		;73e5   ; palabra_a: HL = la palabra A de la tabla HL
	ld (0c8a1h),hl		;73e8   ; guarda el puntero del texto a maquina y el byte siguiente (16 bits)
	ld (0c8a7h),de		;73eb   ; guarda el principio de la linea del texto a maquina y el byte siguiente (16 bits)
	ld (0c8a3h),de		;73ef   ; guarda la posicion del texto a maquina y el byte siguiente (16 bits)
	xor a			;73f3
	ld (0c8a6h),a		;73f4   ; guarda el texto a maquina ha acabado
	ld a,008h		;73f7
	ld (0c8a5h),a		;73f9   ; guarda la espera hasta la siguiente letra
	ret			;73fc
letra_a_maquina:		; cada 0xC8A5 cuadros, el siguiente caracter del texto
	ld hl,0c8a5h		;73fd   ; apunta a la espera hasta la siguiente letra
	dec (hl)			;7400
	ret nz			;7401
	ld hl,(0c8a1h)		;7402   ; lee el puntero del texto a maquina y el byte siguiente (16 bits)
	ld a,(hl)			;7405
	inc hl			;7406
	ld (0c8a1h),hl		;7407   ; guarda el puntero del texto a maquina y el byte siguiente (16 bits)
	ld b,a			;740a
	inc a			;740b
	inc a			;740c
	jr z,L_7430		;740d
	ld a,b			;740f
	ld de,(0c8a3h)		;7410   ; lee la posicion del texto a maquina y el byte siguiente (16 bits)
	call 04d86h		;7414   ; caracter_de_la_fuente: el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
	call 04e39h		;7417   ; avanza_caracter: D + 8 (+ 4 si el caracter es 0x7B), y E + 8 al pasar de linea
	ld (0c8a3h),de		;741a   ; guarda la posicion del texto a maquina y el byte siguiente (16 bits)
	ld hl,(0c8a1h)		;741e   ; lee el puntero del texto a maquina y el byte siguiente (16 bits)
	ld a,(hl)			;7421
	inc a			;7422
	jr z,L_742B		;7423
L_7425:
	ld a,008h		;7425
	ld (0c8a5h),a		;7427   ; guarda la espera hasta la siguiente letra
	ret			;742a
L_742B:
	inc a			;742b
	ld (0c8a6h),a		;742c   ; guarda el texto a maquina ha acabado
	ret			;742f
L_7430:
	ld a,(0c8a8h)		;7430
	ld h,a			;7433
	ld a,(0c8a3h)		;7434   ; lee la posicion del texto a maquina
	add a,00ch		;7437
	ld l,a			;7439
	ld (0c8a3h),hl		;743a   ; guarda la posicion del texto a maquina y el byte siguiente (16 bits)
	jr L_7425		;743d

; ----------------------------------------------------------------------
; DATOS textos_743F: 15 palabras: los 15 textos a maquina con la BIOS japonesa
;   (p04:73D2); lo leen p04:73D2 (30 bytes)
;   0x743f..0x745d  (30 bytes)
DATA_textos_743F:
	defb 07bh,074h	; 743f
	defb 0a0h,074h	; 7441
	defb 0cbh,074h	; 7443
	defb 0dch,074h	; 7445
	defb 0ech,074h	; 7447
	defb 0f5h,074h	; 7449
	defb 02bh,075h	; 744b
	defb 056h,075h	; 744d
	defb 072h,075h	; 744f
	defb 09ah,075h	; 7451
	defb 0b7h,075h	; 7453
	defb 0dbh,075h	; 7455
	defb 007h,076h	; 7457
	defb 01eh,076h	; 7459
	defb 087h,076h	; 745b

; ----------------------------------------------------------------------
; DATOS textos_745D: 15 palabras: los 15 textos a maquina con otra BIOS
;   (0x002B) (p04:73D2); lo leen p04:73D2 (30 bytes)
;   0x745d..0x747b  (30 bytes)
DATA_textos_745D:
	defb 0f3h,076h	; 745d
	defb 02eh,077h	; 745f
	defb 043h,077h	; 7461
	defb 069h,077h	; 7463
	defb 08ah,077h	; 7465
	defb 09dh,077h	; 7467
	defb 0fbh,077h	; 7469
	defb 025h,078h	; 746b
	defb 04ah,078h	; 746d
	defb 08fh,078h	; 746f
	defb 0e3h,078h	; 7471
	defb 029h,079h	; 7473
	defb 05dh,079h	; 7475
	defb 01eh,076h	; 7477
	defb 087h,076h	; 7479

; ----------------------------------------------------------------------
; DATOS maquina_747B: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (37 bytes)
;   0x747b..0x74a0  (37 bytes)
DATA_maquina_747B:
	defb 020h,0a0h,051h,05bh,050h,058h,07bh,053h,077h,05bh,020h,049h,070h,04eh,07bh,05ch	; 747b   .Q[PX{Sw[ IpN{\
	defb 04bh,047h,0feh,020h,04dh,0bah,05eh,020h,04dh,04eh,060h,075h,053h,054h,049h,051h	; 748b  KG. M.^ MN`uSTIQ
	defb 07bh,067h,055h,047h,0ffh	; 749b

; ----------------------------------------------------------------------
; DATOS maquina_74A0: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (43 bytes)
;   0x74a0..0x74cb  (43 bytes)
DATA_maquina_74A0:
	defb 020h,090h,091h,092h,093h,053h,067h,061h,09eh,054h,076h,05bh,07bh,076h,05dh,06fh	; 74a0   ....Sga.Tv[{v]o
	defb 0feh,06bh,04bh,055h,050h,07bh,05bh,07bh,055h,07ch,0feh,020h,04eh,07bh,076h,062h	; 74b0  .kKUP{[{U|. N{vb
	defb 07bh,077h,05bh,050h,058h,07bh,053h,04ah,060h,047h,0ffh	; 74c0  {w[PX{SJ`G.

; ----------------------------------------------------------------------
; DATOS maquina_74CB: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (17 bytes)
;   0x74cb..0x74dc  (17 bytes)
DATA_maquina_74CB:
	defb 052h,052h,04eh,07bh,053h,04ah,054h,07ah,061h,0feh,04ah,056h,04fh,058h,07bh,047h	; 74cb  RRN{SJTza.JVOX{G
	defb 0ffh	; 74db

; ----------------------------------------------------------------------
; DATOS maquina_74DC: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (16 bytes)
;   0x74dc..0x74ec  (16 bytes)
DATA_maquina_74DC:
	defb 052h,052h,05eh,0a3h,0a4h,04eh,07bh,0feh,049h,071h,076h,058h,07bh,05dh,07ch,0ffh	; 74dc  RR^..N{.IqvX{]|.

; ----------------------------------------------------------------------
; DATOS maquina_74EC: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (9 bytes)
;   0x74ec..0x74f5  (9 bytes)
DATA_maquina_74EC:
	defb 053h,049h,020h,04ah,050h,057h,07bh,047h,0ffh	; 74ec  SI JPW{G.

; ----------------------------------------------------------------------
; DATOS maquina_74F5: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (54 bytes)
;   0x74f5..0x752b  (54 bytes)
DATA_maquina_74F5:
	defb 020h,041h,033h,03eh,05ch,09eh,02dh,036h,02fh,03dh,061h,023h,0a8h,062h,0feh,02bh	; 74f5   A3>\.-6/=a#.b.+
	defb 03eh,036h,02fh,043h,020h,0a0h,04fh,07ah,04bh,054h,07bh,079h,04eh,07bh,054h,06fh	; 7505  >6/C .OzKT{yN{To
	defb 065h,07bh,0a5h,054h,058h,0feh,0b1h,022h,061h,020h,04ah,056h,04fh,065h,05ch,020h	; 7515  e{.TX.."a JVOe\
	defb 069h,04eh,077h,058h,07ch,0ffh	; 7525

; ----------------------------------------------------------------------
; DATOS maquina_752B: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (43 bytes)
;   0x752b..0x7556  (43 bytes)
DATA_maquina_752B:
	defb 020h,057h,052h,062h,09eh,0a1h,0a2h,054h,05bh,020h,050h,055h,07bh,072h,053h,077h	; 752b   WRb...T[ PU{rSw
	defb 058h,0feh,099h,07bh,09ah,09bh,061h,09ch,098h,09dh,07bh,07dh,098h,0feh,094h,09dh	; 753b  X..{..a...{}....
	defb 07bh,07dh,04ah,056h,04fh,05bh,07bh,049h,071h,07ch,0ffh	; 754b  {}JVO[{Iq|.

; ----------------------------------------------------------------------
; DATOS maquina_7556: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (28 bytes)
;   0x7556..0x7572  (28 bytes)
DATA_maquina_7556:
	defb 020h,090h,091h,092h,093h,061h,0a3h,0a4h,062h,09eh,057h,061h,054h,076h,05bh,07bh	; 7556   ....a..b.WaTv[{
	defb 076h,05eh,0feh,049h,071h,062h,055h,07bh,058h,07bh,047h,0ffh	; 7566  v^.IqbU{X{G.

; ----------------------------------------------------------------------
; DATOS maquina_7572: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (40 bytes)
;   0x7572..0x759a  (40 bytes)
DATA_maquina_7572:
	defb 020h,025h,05ah,061h,0a3h,0a4h,075h,09eh,053h,04eh,07bh,054h,058h,07bh,056h,062h	; 7572   %Za..u.SN{TX{Vb
	defb 07bh,04fh,077h,05ch,0feh,06eh,04ah,052h,05ch,04eh,07bh,0a6h,052h,071h,047h,020h	; 7582  {Ow\.nJR\N{.RqG
	defb 04eh,07bh,076h,062h,07bh,072h,047h,0ffh	; 7592  N{vb{rG.

; ----------------------------------------------------------------------
; DATOS maquina_759A: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (29 bytes)
;   0x759a..0x75b7  (29 bytes)
DATA_maquina_759A:
	defb 020h,025h,05ah,061h,0a3h,0a4h,062h,09eh,058h,04eh,07bh,04ah,05eh,0a7h,04fh,049h	; 759a   %Za..b.XN{J^.OI
	defb 04bh,06eh,04bh,05eh,0feh,022h,05ah,05eh,05dh,077h,058h,07ch,0ffh	; 75aa  KnK^."Z^]wX|.

; ----------------------------------------------------------------------
; DATOS maquina_75B7: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (36 bytes)
;   0x75b7..0x75db  (36 bytes)
DATA_maquina_75B7:
	defb 020h,041h,033h,03eh,05ch,020h,02dh,036h,02fh,03dh,062h,09eh,074h,050h,074h,050h	; 75b7   A3>\ -6/=b.tPtP
	defb 054h,05dh,04eh,07bh,06fh,0feh,090h,091h,092h,093h,054h,076h,05bh,07bh,076h,05eh	; 75c7  T]N{o.....Tv[{v^
	defb 0a9h,070h,07eh,0ffh	; 75d7

; ----------------------------------------------------------------------
; DATOS maquina_75DB: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (44 bytes)
;   0x75db..0x7607  (44 bytes)
DATA_maquina_75DB:
	defb 020h,054h,076h,05bh,07bh,076h,0b2h,0b3h,05eh,09eh,04dh,053h,06ah,06fh,072h,05bh	; 75db   Tv[{v..^.MSjor[
	defb 04ah,071h,0feh,049h,04eh,05ah,04fh,061h,0bbh,09fh,020h,090h,091h,092h,093h,061h	; 75eb  Jq.INZOa.. ....a
	defb 057h,07bh,04bh,075h,0feh,067h,04ch,05eh,054h,058h,07ch,0ffh	; 75fb  W{Ku.gL^TX|.

; ----------------------------------------------------------------------
; DATOS maquina_7607: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (23 bytes)
;   0x7607..0x761e  (23 bytes)
DATA_maquina_7607:
	defb 020h,07dh,041h,033h,03eh,07dh,0feh,020h,020h,020h,07bh,06eh,054h,09eh,062h,06ah	; 7607   }A3>}.   {nT.bj
	defb 05bh,068h,071h,04eh,047h,07bh,0ffh	; 7617

; ----------------------------------------------------------------------
; DATOS maquina_761E: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (105 bytes)
;   0x761e..0x7687  (105 bytes)
DATA_maquina_761E:
	defb 020h,057h,061h,052h,07bh,09eh,0feh,020h,02bh,03eh,036h,02fh,043h,020h,0a0h,04fh	; 761e   WaR{.. +>6/C .O
	defb 07ah,04bh,054h,07bh,079h,04eh,07bh,0feh,049h,06fh,058h,05eh,0abh,0ach,053h,072h	; 762e  zKT{yN{.IoX^..Sr
	defb 058h,020h,090h,091h,092h,093h,05eh,0feh,05ah,04ah,05bh,061h,020h,054h,070h,07ah	; 763e  X ....^.ZJ[a Tpz
	defb 04bh,075h,020h,054h,06fh,065h,07bh,058h,0feh,05ch,052h,073h,09eh,090h,091h,092h	; 764e  Ku Toe{X.\Rs....
	defb 093h,057h,07bh,04bh,062h,0feh,0adh,0aeh,0afh,0b0h,04eh,07bh,0aah,0abh,054h,058h	; 765e  .W{Kb.....N{..TX
	defb 0feh,04eh,050h,062h,07bh,050h,058h,07bh,076h,061h,0feh,04fh,062h,07bh,050h,057h	; 766e  .NPb{PX{va.Ob{PW
	defb 04bh,059h,05bh,07bh,049h,077h,058h,07ch,0ffh	; 767e  KY[{IwX|.

; ----------------------------------------------------------------------
; DATOS maquina_7687: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (108 bytes)
;   0x7687..0x76f3  (108 bytes)
DATA_maquina_7687:
	defb 020h,057h,061h,03dh,041h,033h,03eh,02dh,032h,020h,05ch,05dh,071h,061h,04eh,07bh	; 7687   Wa=A3>-2 \]qaN{
	defb 0feh,0a3h,0a4h,05bh,07bh,049h,070h,09eh,052h,072h,075h,0b4h,0b5h,053h,056h,05dh	; 7697  ...[{Ip.Rru..SV]
	defb 04ah,0feh,058h,06ah,05eh,020h,0a3h,0a4h,075h,025h,05ah,05eh,0b6h,051h,0feh,04eh	; 76a7  J.Xj^ ..u%Z^.Q.N
	defb 050h,059h,05eh,0b6h,0b7h,054h,09eh,0b8h,0b9h,054h,05bh,04dh,04ah,058h,05ch,0feh	; 76b7  PY^..T...T[MJX\.
	defb 04ah,04bh,052h,05ch,05bh,07bh,049h,071h,07ch,0feh,020h,020h,020h,020h,020h,020h	; 76c7  JKR\[{Iq|.
	defb 020h,020h,020h,020h,020h,020h,020h,020h,020h,020h,0feh,020h,057h,020h,076h,020h	; 76d7            . W v
	defb 05dh,020h,020h,049h,020h,066h,020h,05dh,020h,047h,048h,0ffh	; 76e7  ]  I f ] GH.

; ----------------------------------------------------------------------
; DATOS maquina_76F3: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (59 bytes)
;   0x76f3..0x772e  (59 bytes)
DATA_maquina_76F3:
	defb 03eh,032h,02bh,038h,035h,020h,043h,039h,03fh,020h,030h,039h,03ch,020h,03dh,02bh	; 76f3  >2+85 C9? 09< =+
	defb 040h,033h,038h,031h,020h,03fh,03dh,0feh,041h,033h,036h,036h,020h,031h,033h,040h	; 7703  @381 ?=.A366 13@
	defb 02fh,020h,043h,039h,03fh,020h,023h,021h,021h,0feh,02dh,039h,033h,038h,03dh,020h	; 7713  / C9? #!!.-938=
	defb 02bh,03dh,020h,03ch,02fh,041h,02bh,03ch,02eh,03dh,0ffh	; 7723  += </A+<.=.

; ----------------------------------------------------------------------
; DATOS maquina_772E: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (21 bytes)
;   0x772e..0x7743  (21 bytes)
DATA_maquina_772E:
	defb 0feh,03ah,036h,02fh,02bh,03dh,02fh,020h,02eh,039h,020h,043h,039h,03fh,03ch,020h	; 772e  .:6/+=/ .9 C9?<
	defb 02ch,02fh,03dh,03eh,0ffh	; 773e

; ----------------------------------------------------------------------
; DATOS maquina_7743: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (38 bytes)
;   0x7743..0x7769  (38 bytes)
DATA_maquina_7743:
	defb 020h,07dh,041h,033h,03eh,07dh,0feh,07bh,03eh,032h,02fh,020h,030h,033h,03ch,03dh	; 7743   }A3>}.{>2/ 03<=
	defb 03eh,020h,03ch,03fh,033h,038h,03dh,020h,041h,02fh,020h,03dh,02fh,02fh,0feh,020h	; 7753  > <?38= A/ =//.
	defb 032h,02fh,03ch,02fh,07bh,0ffh	; 7763

; ----------------------------------------------------------------------
; DATOS maquina_7769: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (33 bytes)
;   0x7769..0x778a  (33 bytes)
DATA_maquina_7769:
	defb 020h,07dh,02dh,036h,02fh,03dh,07dh,0feh,07bh,03eh,032h,02fh,020h,034h,02fh,041h	; 7769   }-6/=}.{>2/ 4/A
	defb 02fh,036h,020h,037h,03fh,03dh,03eh,020h,02ch,02fh,020h,032h,02fh,03ch,02fh,07bh	; 7779  /6 7?=> ,/ 2/</{
	defb 0ffh	; 7789

; ----------------------------------------------------------------------
; DATOS maquina_778A: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (19 bytes)
;   0x778a..0x779d  (19 bytes)
DATA_maquina_778A:
	defb 020h,07dh,041h,033h,03eh,07dh,0feh,07bh,036h,02fh,03eh,095h,03dh,020h,031h,039h	; 778a   }A3>}.{6/>.= 19
	defb 047h,07bh,0ffh	; 779a

; ----------------------------------------------------------------------
; DATOS maquina_779D: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (94 bytes)
;   0x779d..0x77fb  (94 bytes)
DATA_maquina_779D:
	defb 02bh,020h,03ah,02bh,03ch,03eh,043h,020h,039h,030h,020h,041h,033h,03eh,020h,02bh	; 779d  + :+<>C 90 A3> +
	defb 038h,02eh,020h,02dh,036h,02fh,03dh,0feh,032h,02bh,03dh,020h,03dh,03eh,02bh,03ch	; 77ad  8. -6/=.2+= =>+<
	defb 03eh,02fh,02eh,020h,03eh,032h,02fh,020h,034h,039h,03fh,03ch,038h,02fh,043h,0feh	; 77bd  >/. >2/ 49?<8/C.
	defb 030h,039h,03ch,020h,03eh,032h,02fh,020h,030h,033h,03ch,03dh,03eh,020h,03ch,03fh	; 77cd  09< >2/ 03<=> <?
	defb 033h,038h,03dh,0feh,02eh,033h,03dh,02dh,039h,040h,02fh,03ch,02fh,02eh,020h,02ch	; 77dd  38=..3=-9@/</. ,
	defb 043h,020h,03ah,03ch,039h,030h,09eh,02bh,03eh,036h,02fh,043h,09eh,0ffh	; 77ed  C :<90.+>6/C..

; ----------------------------------------------------------------------
; DATOS maquina_77FB: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (42 bytes)
;   0x77fb..0x7825  (42 bytes)
DATA_maquina_77FB:
	defb 033h,03eh,020h,041h,02bh,03dh,020h,02bh,020h,041h,02fh,02bh,03eh,032h,02fh,03ch	; 77fb  3> A+= + A/+>2/<
	defb 02fh,02eh,020h,03ch,03fh,033h,038h,03dh,0feh,033h,038h,020h,03ch,02bh,038h,031h	; 780b  /. <?38=.38 <+81
	defb 039h,039h,038h,096h,02ch,03fh,03ch,037h,02bh,0ffh	; 781b  998.,?<7+.

; ----------------------------------------------------------------------
; DATOS maquina_7825: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (37 bytes)
;   0x7825..0x784a  (37 bytes)
DATA_maquina_7825:
	defb 020h,03eh,032h,02fh,020h,03eh,03ch,02fh,02bh,03dh,03fh,03ch,02fh,020h,039h,030h	; 7825   >2/ ></+=?</ 90
	defb 020h,03fh,03dh,02bh,03dh,0feh,020h,037h,03fh,03dh,03eh,020h,02ch,02fh,020h,03eh	; 7835   ?=+=. 7?=> ,/ >
	defb 032h,02fh,03ch,02fh,0ffh	; 7845

; ----------------------------------------------------------------------
; DATOS maquina_784A: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (69 bytes)
;   0x784a..0x788f  (69 bytes)
DATA_maquina_784A:
	defb 020h,033h,030h,020h,03eh,032h,02fh,043h,020h,030h,033h,038h,02eh,020h,025h,020h	; 784a   30 >2/C 038. %
	defb 03ah,02dh,03dh,020h,039h,030h,0feh,020h,03ah,03ch,02fh,02dh,033h,039h,03fh,03dh	; 785a  :-= 90. :</-39?=
	defb 020h,03dh,03eh,039h,038h,02fh,096h,020h,03dh,039h,037h,02fh,0feh,020h,031h,039h	; 786a   =>98/. =97/. 19
	defb 039h,02eh,020h,03eh,032h,033h,038h,031h,020h,041h,033h,036h,036h,020h,032h,02bh	; 787a  9. >2381 A366 2+
	defb 03ah,03ah,02fh,038h,0ffh	; 788a

; ----------------------------------------------------------------------
; DATOS maquina_788F: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (84 bytes)
;   0x788f..0x78e3  (84 bytes)
DATA_maquina_788F:
	defb 020h,020h,025h,020h,03ah,02dh,03dh,020h,039h,030h,020h,03ah,03ch,02fh,02dh,033h	; 788f    % :-= 90 :</-3
	defb 039h,03fh,03dh,020h,03dh,03eh,039h,038h,02fh,0feh,020h,020h,03ah,03fh,036h,036h	; 789f  9?= =>98/.  :?66
	defb 02fh,02eh,020h,02fh,02bh,02dh,032h,020h,039h,03eh,032h,02fh,03ch,020h,02ch,043h	; 78af  /. /+-2 9>2/< ,C
	defb 0feh,020h,020h,033h,03eh,03dh,020h,037h,02bh,031h,033h,02dh,020h,03ah,039h,041h	; 78bf  .  3>= 7+13- :9A
	defb 02fh,03ch,020h,02bh,038h,02eh,0feh,020h,020h,02ch,02fh,02dh,02bh,037h,02fh,020h	; 78cf  /< +8..  ,/-+7/
	defb 039h,038h,02fh,0ffh	; 78df

; ----------------------------------------------------------------------
; DATOS maquina_78E3: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (70 bytes)
;   0x78e3..0x7929  (70 bytes)
DATA_maquina_78E3:
	defb 020h,020h,041h,033h,03eh,020h,02bh,038h,02eh,020h,02dh,036h,02fh,03dh,020h,041h	; 78e3    A3> +8. -6/= A
	defb 02fh,03ch,02fh,0feh,020h,020h,02fh,042h,02dh,033h,03eh,02fh,02eh,020h,02bh,038h	; 78f3  /</.  /B-3>/. +8
	defb 02eh,020h,02fh,038h,03eh,02fh,03ch,02fh,02eh,0feh,020h,020h,033h,038h,03eh,039h	; 7903  . /8>/</..  38>9
	defb 020h,03eh,032h,02fh,020h,03dh,032h,03ch,033h,038h,02fh,020h,039h,030h,0feh,020h	; 7913   >2/ =2<38/ 90.
	defb 020h,03fh,03dh,02bh,03dh,0ffh	; 7923

; ----------------------------------------------------------------------
; DATOS maquina_7929: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (52 bytes)
;   0x7929..0x795d  (52 bytes)
DATA_maquina_7929:
	defb 02bh,038h,02eh,020h,03eh,032h,02fh,043h,020h,03dh,03eh,039h,039h,02eh,020h,033h	; 7929  +8. >2/C =>99. 3
	defb 038h,020h,030h,03ch,039h,038h,03eh,0feh,039h,030h,020h,03eh,032h,02fh,020h,03dh	; 7939  8 0<98>.90 >2/ =
	defb 03eh,02bh,03eh,03fh,02fh,020h,039h,030h,020h,03fh,03dh,02bh,03dh,0feh,03eh,032h	; 7949  >+>?/ 90 ?=+=.>2
	defb 02fh,03ch,02fh,0ffh	; 7959

; ----------------------------------------------------------------------
; DATOS maquina_795D: texto a maquina (p04:73FD): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p04:73D2 (45 bytes)
;   0x795d..0x798a  (45 bytes)
DATA_maquina_795D:
	defb 020h,07dh,041h,033h,03eh,07dh,0feh,07bh,036h,02fh,03eh,095h,03dh,020h,03ah,03fh	; 795d   }A3>}.{6/>.= :?
	defb 03eh,020h,03eh,032h,033h,03dh,020h,03dh,03eh,039h,038h,02fh,0feh,020h,033h,038h	; 796d  > >23= =>98/. 38
	defb 020h,03eh,032h,02fh,020h,03dh,03eh,02bh,03eh,03fh,02fh,07bh,0ffh	; 797d   >2/ =>+>?/{.

; ----------------------------------------------------------------------
; DATOS fichas_p51BC_colores: tabla de colores de la lista fichas_p51BC
;   (L_529C indexa con c >> 4); lo leen p00:51BC (6 bytes)
;   0x798a..0x7990  (6 bytes)
DATA_fichas_p51BC_colores:
	defb 090h,079h	; 798a
	defb 094h,079h	; 798c
	defb 098h,079h	; 798e

; ----------------------------------------------------------------------
; DATOS fichas_p51BC_col0: 2 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 4 bloques: (fichas_p51BC_col0 7990-7992)
;   (fichas_p51BC_col0 7990-7994) (fichas_p51BC_col0 7990-7994); lo leen
;   p00:51BC (4 bytes)
;   0x7990..0x7994  (4 bytes)
DATA_fichas_p51BC_col0:
	defb 008h,00fh	; 7990
	defb 007h,006h	; 7992

; ----------------------------------------------------------------------
; DATOS fichas_p51BC_col1: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 2 bloques: (fichas_p51BC_col1 7994-7998); lo
;   leen p00:51BC (4 bytes)
;   0x7994..0x7998  (4 bytes)
DATA_fichas_p51BC_col1:
	defb 001h,007h,008h,00fh	; 7994

; ----------------------------------------------------------------------
; DATOS fichas_p51BC_col2: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 2 bloques: (fichas_p51BC_col2 7998-799C); lo
;   leen p00:51BC (4 bytes)
;   0x7998..0x799c  (4 bytes)
DATA_fichas_p51BC_col2:
	defb 005h,00dh,00eh,00fh	; 7998

; ----------------------------------------------------------------------
; DATOS fichas_p51BC: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:51BC (49 bytes)
;   0x799c..0x79cd  (49 bytes)
DATA_fichas_p51BC:
	defb 008h,012h,040h,090h,002h,0cdh	; 799c
	defb 079h,013h,04ch,090h,002h,0cdh	; 79a2
	defb 079h,002h,000h,094h,008h,0edh	; 79a8
	defb 079h,003h,028h,094h,001h,0edh	; 79ae
	defb 079h,000h,040h,094h,002h,06dh	; 79b4
	defb 07ah,001h,04ch,094h,001h,06dh	; 79ba
	defb 07ah,022h,000h,098h,007h,07dh	; 79c0
	defb 07ah,023h,020h,098h,007h,07dh	; 79c6
	defb 07ah	; 79cc

; ----------------------------------------------------------------------
; DATOS fichas_p51BC_f0: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_p51BC; se solapan 2 bloques:
;   (fichas_p51BC_f1 79CD-79ED); lo leen p00:51BC (32 bytes)
;   0x79cd..0x79ed  (32 bytes)
DATA_fichas_p51BC_f0:
	defb 040h,000h,040h,000h,060h,080h,000h,0e0h,0e2h,080h,0d2h,0f0h,0e0h,0deh,0e8h,0ffh	; 79cd  @.@.`...........
	defb 000h,000h,000h,000h,040h,000h,000h,040h,0e0h,000h,000h,0e4h,0a0h,054h,000h,0feh	; 79dd  ....@..@.....T..

; ----------------------------------------------------------------------
; DATOS fichas_p51BC_f3: 1 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 3 de la lista fichas_p51BC; se solapan 2 bloques:
;   (fichas_p51BC_f2 79ED-7A6D); lo leen p00:51BC (128 bytes)
;   0x79ed..0x7a6d  (128 bytes)
DATA_fichas_p51BC_f3:
	defb 0fdh,000h,023h,054h,023h,050h,023h,000h,0ffh,000h,088h,064h,089h,040h,089h,000h	; 79ed  ..#T#P#....d.@..
	defb 0feh,000h,0f2h,00ch,0cbh,030h,0a7h,000h,03fh,080h,0efh,010h,0ffh,000h,0ffh,000h	; 79fd  .....0..?.......
	defb 0f3h,078h,002h,021h,0ffh,000h,07bh,073h,02ch,026h,0c8h,044h,06ch,000h,07eh,000h	; 7a0d  .x.!..{s,&.Dl.~.
	defb 0dbh,000h,03ah,07eh,0c5h,0ffh,002h,0f3h,0c0h,0cfh,024h,066h,008h,020h,043h,000h	; 7a1d  ..:~......$f. C.
	defb 0ffh,000h,0d1h,008h,0ffh,000h,0c9h,03ah,020h,070h,007h,0e0h,08ch,090h,00ch,045h	; 7a2d  .......: p.....E
	defb 061h,0eeh,000h,001h,09fh,000h,062h,081h,07fh,060h,002h,008h,00fh,030h,0f5h,000h	; 7a3d  a.....b..`...0..
	defb 0e0h,001h,0f8h,001h,0fdh,000h,0fdh,000h,0f8h,001h,0fch,000h,0d0h,001h,0feh,000h	; 7a4d  ................
	defb 055h,000h,079h,002h,0abh,000h,0feh,003h,050h,0a6h,01ah,080h,054h,001h,039h,000h	; 7a5d  U.y.....P...T.9.

; ----------------------------------------------------------------------
; DATOS fichas_p51BC_f5: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 5 de la lista fichas_p51BC; se solapan 2 bloques:
;   (fichas_p51BC_f4 7A6D-7A7D); lo leen p00:51BC (16 bytes)
;   0x7a6d..0x7a7d  (16 bytes)
DATA_fichas_p51BC_f5:
	defb 045h,02dh,035h,02bh,0bbh,0afh,0efh,0bfh	; 7a6d  E-5+....
	defb 0abh,09fh,0d5h,03fh,00dh,057h,02fh,09fh	; 7a75  ...?.W/.

; ----------------------------------------------------------------------
; DATOS fichas_p51BC_f6: 7 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 6 de la lista fichas_p51BC; se solapan 2 bloques:
;   (fichas_p51BC_f7 7A7D-7AED); lo leen p00:51BC (112 bytes)
;   0x7a7d..0x7aed  (112 bytes)
DATA_fichas_p51BC_f6:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f0h,0ffh,0e0h,0f0h,0e7h,0f7h	; 7a7d  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,00bh,0f4h,000h,000h,0f8h,0fbh	; 7a8d  ................
	defb 0e7h,0f7h,0e7h,0f7h,0cfh,0efh,0cfh,0efh,0cfh,0efh,0cfh,0efh,09fh,0dfh,09fh,0dfh	; 7a9d  ................
	defb 0fbh,01fh,0fbh,08ch,0f8h,0cbh,0fch,06ch,0ffh,0b7h,0ffh,0dbh,0ffh,0fdh,0ffh,0ffh	; 7aad  .......l........
	defb 0ffh,0ffh,081h,0ffh,000h,081h,07ch,0c5h,07ch,0f1h,080h,0feh,0fch,0fdh,0fch,0ffh	; 7abd  ......|.|.......
	defb 09fh,0dfh,0bfh,0ffh,080h,0bah,01fh,05fh,03fh,0bfh,03fh,0bfh,03fh,03fh,000h,0bfh	; 7acd  ......._?.?.??..
	defb 0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh	; 7add  ................

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_colores: tabla de colores de la lista
;   fichas_escenas_2_6 (L_529C indexa con c >> 4); lo leen p04:7315 (28 bytes)
;   0x7aed..0x7b09  (28 bytes)
DATA_fichas_escenas_2_6_colores:
	defb 009h,07bh	; 7aed
	defb 00dh,07bh	; 7aef
	defb 011h,07bh	; 7af1
	defb 015h,07bh	; 7af3
	defb 019h,07bh	; 7af5
	defb 01dh,07bh	; 7af7
	defb 021h,07bh	; 7af9
	defb 025h,07bh	; 7afb
	defb 027h,07bh	; 7afd
	defb 02bh,07bh	; 7aff
	defb 02dh,07bh	; 7b01
	defb 02fh,07bh	; 7b03
	defb 031h,07bh	; 7b05
	defb 035h,07bh	; 7b07

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col0: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 3 bloques: (fichas_escenas_2_6_col0
;   7B09-7B0D) (fichas_escenas_2_6_col0 7B09-7B0D); lo leen p04:7315 (4 bytes)
;   0x7b09..0x7b0d  (4 bytes)
DATA_fichas_escenas_2_6_col0:
	defb 001h,002h	; 7b09
	defb 003h,004h	; 7b0b

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col1: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 4 bloques: (fichas_escenas_2_6_col1
;   7B0D-7B0F) (fichas_escenas_2_6_col1 7B0D-7B11) (fichas_escenas_2_6_col1
;   7B0D-7B11); lo leen p04:7315 (4 bytes)
;   0x7b0d..0x7b11  (4 bytes)
DATA_fichas_escenas_2_6_col1:
	defb 007h,00fh	; 7b0d
	defb 003h,004h	; 7b0f

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col2: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 3 bloques: (fichas_escenas_2_6_col2
;   7B11-7B15) (fichas_escenas_2_6_col2 7B11-7B15); lo leen p04:7315 (4 bytes)
;   0x7b11..0x7b15  (4 bytes)
DATA_fichas_escenas_2_6_col2:
	defb 004h,007h	; 7b11
	defb 002h,003h	; 7b13

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col3: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 4 bloques: (fichas_escenas_2_6_col3
;   7B15-7B17) (fichas_escenas_2_6_col3 7B15-7B19) (fichas_escenas_2_6_col3
;   7B15-7B19); lo leen p04:7315 (4 bytes)
;   0x7b15..0x7b19  (4 bytes)
DATA_fichas_escenas_2_6_col3:
	defb 005h,008h	; 7b15
	defb 007h,00fh	; 7b17

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col4: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p04:7315 (4 bytes)
;   0x7b19..0x7b1d  (4 bytes)
DATA_fichas_escenas_2_6_col4:
	defb 005h,008h,001h,00fh	; 7b19

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col5: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 2 bloques: (fichas_escenas_2_6_col5
;   7B1D-7B21); lo leen p04:7315 (4 bytes)
;   0x7b1d..0x7b21  (4 bytes)
DATA_fichas_escenas_2_6_col5:
	defb 002h,003h	; 7b1d
	defb 004h,000h	; 7b1f

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col6: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p04:7315 (4 bytes)
;   0x7b21..0x7b25  (4 bytes)
DATA_fichas_escenas_2_6_col6:
	defb 000h,003h,004h,00fh	; 7b21

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col7: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p04:7315 (2 bytes)
;   0x7b25..0x7b27  (2 bytes)
DATA_fichas_escenas_2_6_col7:
	defb 001h,009h	; 7b25

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col8: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p04:7315 (4 bytes)
;   0x7b27..0x7b2b  (4 bytes)
DATA_fichas_escenas_2_6_col8:
	defb 002h,003h,004h,00fh	; 7b27

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col9: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p04:7315 (2 bytes)
;   0x7b2b..0x7b2d  (2 bytes)
DATA_fichas_escenas_2_6_col9:
	defb 002h,00bh	; 7b2b

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col10: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p04:7315 (2 bytes)
;   0x7b2d..0x7b2f  (2 bytes)
DATA_fichas_escenas_2_6_col10:
	defb 000h,00bh	; 7b2d

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col11: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p04:7315 (2 bytes)
;   0x7b2f..0x7b31  (2 bytes)
DATA_fichas_escenas_2_6_col11:
	defb 000h,00ah	; 7b2f

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col12: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 4 bloques: (fichas_escenas_2_6_col12
;   7B31-7B33) (fichas_escenas_2_6_col12 7B31-7B35) (fichas_escenas_2_6_col12
;   7B31-7B35); lo leen p04:7315 (4 bytes)
;   0x7b31..0x7b35  (4 bytes)
DATA_fichas_escenas_2_6_col12:
	defb 00fh,008h	; 7b31
	defb 001h,005h	; 7b33

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_col13: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 3 bloques: (fichas_escenas_2_6_col13
;   7B35-7B39) (fichas_escenas_2_6_col13 7B35-7B3D); lo leen p04:7315 (8
;   bytes)
;   0x7b35..0x7b3d  (8 bytes)
DATA_fichas_escenas_2_6_col13:
	defb 001h,00bh	; 7b35
	defb 00fh,005h	; 7b37
	defb 008h,007h	; 7b39
	defb 003h,004h	; 7b3b

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p04:7315 (181 bytes)
;   0x7b3d..0x7bf2  (181 bytes)
DATA_fichas_escenas_2_6:
	defb 01eh,002h,004h,080h,004h,0f2h	; 7b3d
	defb 07bh,003h,014h,080h,002h,0f2h	; 7b43
	defb 07bh,000h,020h,080h,001h,032h	; 7b49
	defb 07ch,012h,040h,080h,010h,03ah	; 7b4f
	defb 07ch,013h,000h,084h,008h,03ah	; 7b55
	defb 07ch,022h,040h,084h,003h,03ah	; 7b5b
	defb 07dh,023h,060h,084h,003h,03ah	; 7b61
	defb 07dh,020h,000h,088h,005h,06ah	; 7b67
	defb 07dh,010h,040h,088h,003h,092h	; 7b6d
	defb 07dh,011h,060h,088h,002h,092h	; 7b73
	defb 07dh,032h,000h,08ch,008h,0aah	; 7b79
	defb 07dh,033h,028h,08ch,001h,0aah	; 7b7f
	defb 07dh,042h,030h,08ch,003h,0bah	; 7b85
	defb 07dh,052h,040h,08ch,005h,02ah	; 7b8b
	defb 07eh,062h,05ch,08ch,009h,07ah	; 7b91
	defb 07eh,070h,000h,090h,002h,00ah	; 7b97
	defb 07fh,082h,020h,090h,001h,01ah	; 7b9d
	defb 07fh,050h,028h,090h,003h,02ah	; 7ba3
	defb 07fh,090h,040h,090h,004h,042h	; 7ba9
	defb 07fh,0a0h,060h,090h,002h,062h	; 7baf
	defb 07fh,0b0h,068h,090h,002h,062h	; 7bb5
	defb 07fh,0c2h,000h,094h,005h,072h	; 7bbb
	defb 07fh,0c3h,020h,094h,005h,072h	; 7bc1
	defb 07fh,0c0h,040h,094h,002h,0c2h	; 7bc7
	defb 07fh,0c1h,04ch,094h,002h,0c2h	; 7bcd
	defb 07fh,030h,060h,094h,002h,0d2h	; 7bd3
	defb 07fh,031h,06ch,094h,002h,0d2h	; 7bd9
	defb 07fh,0d2h,000h,098h,002h,0e2h	; 7bdf
	defb 07fh,0d0h,010h,098h,001h,002h	; 7be5
	defb 080h,0d4h,020h,098h,007h,00ah	; 7beb
	defb 080h	; 7bf1

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f1: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 1 de la lista fichas_escenas_2_6; se solapan 2 bloques:
;   (fichas_escenas_2_6_f0 7BF2-7C32); lo leen p04:7315 (64 bytes)
;   0x7bf2..0x7c32  (64 bytes)
DATA_fichas_escenas_2_6_f1:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,003h,004h,01fh,020h,078h,007h	; 7bf2  ............. x.
	defb 000h,000h,001h,000h,003h,004h,005h,01ah,07ch,083h,0e2h,01dh,009h,0f7h,023h,0dfh	; 7c02  ........|.....#.
	defb 000h,000h,0fch,003h,093h,06ch,00ch,0f3h,042h,0bdh,0e3h,0ffh,0efh,0ffh,077h,0ffh	; 7c12  .....l..B.....w.
	defb 001h,0feh,070h,0ffh,006h,0ffh,080h,0ffh,070h,0ffh,00fh,0ffh,0e9h,0ffh,077h,0ffh	; 7c22  ..p.....p.....w.

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f2: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 2 de la lista fichas_escenas_2_6; lo leen p04:7315 (8
;   bytes)
;   0x7c32..0x7c3a  (8 bytes)
DATA_fichas_escenas_2_6_f2:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 7c32  ........

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f4: 8 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 4 de la lista fichas_escenas_2_6; se solapan 2 bloques:
;   (fichas_escenas_2_6_f3 7C3A-7D3A); lo leen p04:7315 (256 bytes)
;   0x7c3a..0x7d3a  (256 bytes)
DATA_fichas_escenas_2_6_f4:
	defb 0c1h,0ffh,070h,0ffh,0b8h,0ffh,088h,0ffh,0eeh,0ffh,0f3h,0ffh,07fh,07fh,09fh,09fh	; 7c3a  ..p.............
	defb 000h,000h,021h,021h,063h,063h,076h,0f6h,0bah,0feh,044h,0fch,09dh,0fdh,00eh,0feh	; 7c4a  ..!!ccv...D.....
	defb 010h,010h,026h,026h,0fbh,0fbh,0ffh,0ffh,093h,0ffh,006h,0ffh,008h,0ffh,000h,0ffh	; 7c5a  ..&&............
	defb 071h,0ffh,038h,0ffh,09ch,0ffh,0d9h,0fbh,0f4h,0fdh,0ech,0ech,041h,041h,000h,000h	; 7c6a  q.8.........AA..
	defb 00dh,010h,05fh,050h,0bdh,0a0h,0bfh,080h,07dh,040h,077h,040h,0ffh,080h,0dfh,080h	; 7c7a  .._P....}@w@....
	defb 009h,008h,015h,016h,003h,004h,02bh,02ch,042h,048h,046h,048h,00dh,008h,09bh,090h	; 7c8a  ......+,BHFH....
	defb 03bh,0fbh,07bh,0fbh,0b6h,0f6h,0e4h,0e4h,00ch,00ch,030h,030h,040h,040h,000h,000h	; 7c9a  ..{.......00@@..
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0feh,001h,0fch,002h,0f1h,018h,0c7h,060h	; 7caa  ...............`
	defb 050h,040h,0c9h,021h,0feh,01bh,0f2h,013h,0e9h,009h,0e5h,00dh,0f0h,019h,0fbh,00fh	; 7cba  P@.!............
	defb 025h,024h,013h,010h,0a7h,0a0h,097h,090h,0d7h,0d0h,087h,080h,097h,090h,097h,090h	; 7cca  %$..............
	defb 0f6h,00eh,0f6h,01eh,0ebh,01fh,0fdh,01dh,0ebh,01bh,0e5h,01dh,0c1h,039h,0c7h,013h	; 7cda  .............9..
	defb 0c7h,0c0h,0a7h,0a0h,0a3h,0a0h,097h,090h,0c7h,0c0h,0a3h,0a0h,0c3h,0c0h,0c3h,0c0h	; 7cea  ................
	defb 0cbh,03fh,0dbh,03fh,093h,05fh,025h,0adh,063h,07bh,0c9h,09dh,091h,031h,006h,040h	; 7cfa  .?.?._%.c{...1.@
	defb 0abh,0a0h,0c5h,0e0h,061h,0e1h,0e5h,0f1h,032h,0b8h,091h,098h,0a9h,08eh,0b0h,0c1h	; 7d0a  ....a...2.......
	defb 0fbh,001h,0fch,001h,0eah,003h,0f2h,003h,0f9h,003h,0f9h,005h,0f2h,006h,0e7h,00bh	; 7d1a  ................
	defb 0f1h,007h,0e2h,00eh,0d2h,01ah,0e5h,03dh,08ch,00ch,0feh,03eh,04ah,06ah,004h,00ch	; 7d2a  .......=...>Jj..

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f5: 3 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 5 de la lista fichas_escenas_2_6; se solapan 2 bloques:
;   (fichas_escenas_2_6_f6 7D3A-7D6A); lo leen p04:7315 (48 bytes)
;   0x7d3a..0x7d6a  (48 bytes)
DATA_fichas_escenas_2_6_f5:
	defb 03fh,0c0h,05fh,0c0h,09fh,0a0h,00fh,090h,0a7h,088h,0b3h,084h,039h,002h,0ach,0fdh	; 7d3a  ?._.........9...
	defb 0c2h,0ffh,03ch,0ffh,06bh,0ffh,05eh,05eh,02bh,02bh,014h,014h,063h,063h,099h,081h	; 7d4a  ..<.k.^^++..cc..
	defb 001h,007h,03fh,0f9h,0a3h,0b6h,0c9h,0cbh,0b2h,0b3h,046h,047h,01ch,006h,0b9h,008h	; 7d5a  ..?.......FG....

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f7: 5 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 7 de la lista fichas_escenas_2_6; lo leen p04:7315 (40
;   bytes)
;   0x7d6a..0x7d92  (40 bytes)
DATA_fichas_escenas_2_6_f7:
	defb 000h,000h,000h,000h,000h,080h,000h,020h	; 7d6a  .......
	defb 062h,0b0h,01ch,08fh,047h,0f1h,0fch,07fh	; 7d72  b...G...
	defb 0b0h,0e8h,0dch,0fbh,0feh,0ffh,0ffh,0ffh	; 7d7a  ........
	defb 000h,0c0h,070h,028h,019h,026h,04dh,0c3h	; 7d82  ..p(.&M.
	defb 07fh,0bfh,01fh,02fh,0dfh,077h,0edh,0fbh	; 7d8a  .../.w..

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f9: 2 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 9 de la lista fichas_escenas_2_6; se solapan 2 bloques:
;   (fichas_escenas_2_6_f8 7D92-7DAA); lo leen p04:7315 (24 bytes)
;   0x7d92..0x7daa  (24 bytes)
DATA_fichas_escenas_2_6_f9:
	defb 002h,048h,080h,04ah,094h,061h,09bh,0eeh	; 7d92  .H.J.a..
	defb 0abh,0f6h,0afh,0fdh,0efh,0bbh,0ffh,0feh	; 7d9a  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 7da2  ........

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f11: 1 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 11 de la lista fichas_escenas_2_6; se solapan 3
;   bloques: (fichas_escenas_2_6_f10 7DAA-7E2A) (fichas_escenas_2_6_f12
;   7DBA-7DEA); lo leen p04:7315 (128 bytes)
;   0x7daa..0x7e2a  (128 bytes)
DATA_fichas_escenas_2_6_f11:
	defb 0ffh,009h,0ffh,027h,0ffh,0dfh,0f7h,0ffh,0b9h,0ffh,0cch,0ffh,0e9h,0ffh,0f0h,0ffh	; 7daa  ...'............
	defb 000h,0ffh,010h,0ebh,054h,080h,0e2h,000h,095h,015h,029h,000h,0d5h,001h,0beh,002h	; 7dba  ....T.....).....
	defb 000h,0ffh,002h,0fch,007h,0f2h,05fh,020h,0bdh,028h,0fch,0d4h,07fh,038h,0dfh,052h	; 7dca  ......_ .(...8.R
	defb 020h,01fh,08ch,002h,052h,001h,0c0h,080h,069h,000h,0b5h,000h,062h,000h,0d1h,000h	; 7dda   ...R...i...b...
	defb 0fbh,010h,0ffh,080h,0ffh,009h,0ffh,026h,0ffh,05fh,0ffh,0ffh,0ffh,0dfh,0ffh,0ffh	; 7dea  .......&._......
	defb 0f3h,000h,07fh,028h,0dfh,041h,0ffh,0eeh,0ffh,0f5h,0ffh,0ffh,0ffh,0fdh,0ffh,0ffh	; 7dfa  ...(.A..........
	defb 065h,000h,0fbh,000h,0dfh,002h,0ffh,048h,0ffh,085h,0ffh,06eh,0ffh,0dfh,0ffh,0f7h	; 7e0a  e......H...n....
	defb 000h,0ffh,000h,0fch,001h,0e0h,01bh,0c8h,00dh,0c0h,012h,080h,065h,040h,05eh,08ah	; 7e1a  ............e@^.

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f13: 5 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 13 de la lista fichas_escenas_2_6; lo leen p04:7315 (80
;   bytes)
;   0x7e2a..0x7e7a  (80 bytes)
DATA_fichas_escenas_2_6_f13:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0feh,0feh,0feh,0ffh,0fch,0fdh,0fdh,0feh	; 7e2a  ................
	defb 08fh,09fh,003h,041h,088h,060h,0c5h,070h,042h,0f0h,049h,0fah,044h,0f9h,0d6h,0ech	; 7e3a  ...A.`.pB.I.D...
	defb 0ffh,0ffh,0fbh,0fbh,03bh,003h,0c5h,001h,07dh,001h,01bh,001h,046h,080h,03eh,0c1h	; 7e4a  ........}...F.>.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0efh,0efh,0c7h,0d7h,089h,0b9h,082h,0b8h,055h,0ech	; 7e5a  ..............U.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fbh,0f3h,047h,001h,01eh,0e1h	; 7e6a  ............G...

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f14: 9 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 14 de la lista fichas_escenas_2_6; lo leen p04:7315
;   (144 bytes)
;   0x7e7a..0x7f0a  (144 bytes)
DATA_fichas_escenas_2_6_f14:
	defb 001h,006h,003h,00ch,003h,00dh,007h,019h,00fh,013h,00fh,033h,05fh,027h,02fh,07fh	; 7e7a  ...........3_'/.
	defb 0c3h,0fch,0d3h,0eeh,0f3h,0eeh,0f9h,0e7h,0e9h,0f7h,0e8h,0f7h,0f8h,0f7h,0f5h,0ffh	; 7e8a  ................
	defb 04dh,0b2h,0b3h,04ch,09fh,060h,0ceh,031h,061h,09eh,0b0h,0cfh,0fch,0a3h,035h,0dfh	; 7e9a  M..L.`.1a.....5.
	defb 080h,000h,080h,040h,000h,0c0h,040h,0a0h,0c0h,030h,000h,0f8h,060h,09ch,066h,0feh	; 7eaa  ...@..@..0..`.f.
	defb 000h,001h,001h,000h,000h,001h,002h,001h,005h,003h,005h,003h,00bh,007h,007h,01fh	; 7eba  ................
	defb 01ch,000h,03fh,008h,077h,00eh,07bh,027h,069h,037h,0e9h,037h,0f8h,037h,0f5h,01fh	; 7eca  ..?.w.{'i7.7.7..
	defb 000h,000h,0f0h,008h,03ch,0c0h,0cah,034h,026h,0d8h,082h,0fch,0c4h,0bbh,075h,0ffh	; 7eda  ....<..4&.....u.
	defb 000h,000h,000h,000h,017h,008h,039h,006h,038h,017h,03ch,017h,019h,02fh,003h,01fh	; 7eea  ......9.8.<../..
	defb 000h,000h,000h,000h,078h,080h,0dch,020h,0b4h,048h,000h,0fch,0c4h,038h,070h,0f8h	; 7efa  ....x.. .H...8p.

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f15: 2 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 15 de la lista fichas_escenas_2_6; lo leen p04:7315 (16
;   bytes)
;   0x7f0a..0x7f1a  (16 bytes)
DATA_fichas_escenas_2_6_f15:
	defb 000h,008h,000h,000h,000h,020h,000h,002h	; 7f0a  ..... ..
	defb 000h,000h,001h,000h,010h,000h,000h,000h	; 7f12  ........

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f16: 1 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 16 de la lista fichas_escenas_2_6; lo leen p04:7315 (16
;   bytes)
;   0x7f1a..0x7f2a  (16 bytes)
DATA_fichas_escenas_2_6_f16:
	defb 038h,046h,024h,083h,0d5h,083h,09bh,0e5h,062h,0bfh,0bdh,0fah,0c3h,07dh,0f5h,03eh	; 7f1a  8F$.....b....}.>

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f17: 3 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 17 de la lista fichas_escenas_2_6; lo leen p04:7315 (24
;   bytes)
;   0x7f2a..0x7f42  (24 bytes)
DATA_fichas_escenas_2_6_f17:
	defb 0ffh,07fh,01ch,000h,000h,000h,000h,000h	; 7f2a  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 7f32  ........
	defb 000h,080h,0c0h,0e0h,0e0h,0e0h,0c0h,080h	; 7f3a  ........

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f18: 4 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 18 de la lista fichas_escenas_2_6; lo leen p04:7315 (32
;   bytes)
;   0x7f42..0x7f62  (32 bytes)
DATA_fichas_escenas_2_6_f18:
	defb 000h,000h,066h,066h,000h,000h,000h,000h	; 7f42  ..ff....
	defb 000h,000h,066h,04eh,080h,070h,000h,038h	; 7f4a  ..fN.p.8
	defb 040h,078h,0ffh,0fch,070h,040h,000h,000h	; 7f52  @x..p@..
	defb 000h,01ch,000h,01ch,07fh,03eh,01ch,008h	; 7f5a  .....>..

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f19: 2 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 19 de la lista fichas_escenas_2_6; se solapan 2
;   bloques: (fichas_escenas_2_6_f20 7F62-7F72); lo leen p04:7315 (16 bytes)
;   0x7f62..0x7f72  (16 bytes)
DATA_fichas_escenas_2_6_f19:
	defb 018h,018h,03ch,024h,024h,07eh,066h,0e7h	; 7f62  ..<$$~f.
	defb 0fch,066h,064h,07eh,063h,063h,0feh,000h	; 7f6a  .fd~cc..

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f21: 5 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 21 de la lista fichas_escenas_2_6; se solapan 2
;   bloques: (fichas_escenas_2_6_f22 7F72-7FC2); lo leen p04:7315 (80 bytes)
;   0x7f72..0x7fc2  (80 bytes)
DATA_fichas_escenas_2_6_f21:
	defb 01fh,0e8h,03fh,0c2h,057h,0b9h,03fh,0d4h,07fh,0b8h,01fh,0e2h,037h,0cdh,03fh,0c0h	; 7f72  ..?.W.?.....7.?.
	defb 077h,092h,02dh,0f1h,037h,0c2h,038h,0d0h,054h,0a4h,02ah,0d4h,005h,0f8h,00ah,0f4h	; 7f82  w.-.7.8.T.*.....
	defb 0ffh,0d4h,0feh,0f2h,0ffh,0ach,0fah,040h,0e9h,0c8h,0ech,020h,0a3h,080h,050h,000h	; 7f92  .......@... ..P.
	defb 009h,040h,002h,0b0h,008h,040h,060h,008h,000h,001h,000h,000h,050h,000h,0a8h,000h	; 7fa2  .@...@`.....P...
	defb 0f6h,0d0h,0edh,0e8h,0f6h,070h,0fch,0b0h,0fah,020h,0b4h,010h,0c4h,000h,05ah,000h	; 7fb2  .....p... ....Z.

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f23: 2 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 23 de la lista fichas_escenas_2_6; se solapan 2
;   bloques: (fichas_escenas_2_6_f24 7FC2-7FD2); lo leen p04:7315 (16 bytes)
;   0x7fc2..0x7fd2  (16 bytes)
DATA_fichas_escenas_2_6_f23:
	defb 0aah,044h,0b8h,010h,00ah,044h,000h,000h	; 7fc2  .D...D..
	defb 049h,00ch,030h,003h,008h,004h,020h,000h	; 7fca  I.0... .

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f25: 2 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 25 de la lista fichas_escenas_2_6; se solapan 2
;   bloques: (fichas_escenas_2_6_f26 7FD2-7FE2); lo leen p04:7315 (16 bytes)
;   0x7fd2..0x7fe2  (16 bytes)
DATA_fichas_escenas_2_6_f25:
	defb 0ffh,0fbh,0beh,0ffh,0deh,0f5h,0ffh,076h	; 7fd2  .......v
	defb 0e2h,09bh,0b6h,049h,0a5h,010h,062h,0dch	; 7fda  ...I..b.

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f27: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 27 de la lista fichas_escenas_2_6 (sigue en el banco 5,
;   en 0x8000); lo leen p04:7315 (30 bytes)
;   0x7fe2..0x8000  (30 bytes)
DATA_fichas_escenas_2_6_f27:
	defb 024h,080h,052h,000h,0b4h,001h,06ah,001h,058h,003h,0d4h,003h,0a0h,007h,0a8h,007h	; 7fe2  $.R...j.X.......
	defb 050h,007h,050h,00fh,0d0h,00fh,0b0h,00fh,0e0h,01fh,0a0h,01fh,0c0h,01fh	; 7ff2  P.P...........
