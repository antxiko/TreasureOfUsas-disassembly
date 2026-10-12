; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 03 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ======================================================================
; CODIGO 0xa000..0xa09d  (157 bytes)
; ======================================================================


L_A000:
	ld (ix+011h),020h		;a000   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	ret			;a004
choca_o_cuenta:		; el sonido 0x0A si choca de lado o si (ix+0x11) & 15 es cero
	call 09cc8h		;a005   ; choque_lateral: la casilla de delante del actor segun su sentido (p02:8BB7)
	jp nz,08b03h		;a008   ; sonido_0a: el sonido 0x0A (p02:8B0D)
	ld a,(ix+011h)		;a00b   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	and 00fh		;a00e
	jp z,08b03h		;a010   ; sonido_0a: el sonido 0x0A (p02:8B0D)
	ret			;a013
L_A014:
	ld a,(ix+008h)		;a014   ; lee la velocidad Y del actor (alta)
	cp 080h		;a017
	jr c,L_A024		;a019
	add a,0f0h		;a01b
	ld e,a			;a01d
	call 09d07h		;a01e   ; choque_7: p02:9D09 con D = 7
	call nz,08affh		;a021   ; sonido_08: el sonido 8 (p02:8B0D)
L_A024:
	call frena_caida		;a024   ; frena_caida: si la velocidad Y esta entre 6 y 0x50: 0x600 y sin aceleracion
	call 09cc8h		;a027   ; choque_lateral: la casilla de delante del actor segun su sentido (p02:8BB7)
	call nz,08b03h		;a02a   ; sonido_0a: el sonido 0x0A (p02:8B0D)
	ld de,05254h		;a02d
	call 09b8dh		;a030   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
	ld a,(ix+008h)		;a033   ; lee la velocidad Y del actor (alta)
	cp 080h		;a036
	ret nc			;a038
	ld e,000h		;a039
	call 09d07h		;a03b   ; choque_7: p02:9D09 con D = 7
	jr nz,L_A05D		;a03e
	ld e,(ix+008h)		;a040   ; lee la velocidad Y del actor (alta)
	call 09d07h		;a043   ; choque_7: p02:9D09 con D = 7
	ret z			;a046
	ld (ix+00bh),000h		;a047   ; si el actor acelera (p02:8393) = 0x00
	call alinea_y		;a04b   ; alinea_y: la Y del actor al centro de su fila de 8 (+ 4)
	ld h,001h		;a04e
	call 08b8bh		;a050   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	ld (ix+011h),020h		;a053   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	dec (ix+001h)		;a057   ; baja el paso del actor
	jp 08b7eh		;a05a   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
L_A05D:
	ld h,0fch		;a05d
	jp 08b80h		;a05f   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
L_A062:
	call espera_al_azar		;a062   ; espera_al_azar: (ix+0x11) = el numero del actor * 16 + un numero al azar
	ld a,(ix+005h)		;a065   ; lee la X del actor
	sub 010h		;a068
	ld d,a			;a06a
	ld e,(ix+003h)		;a06b   ; lee la Y del actor
	push de			;a06e
	call 070bfh		;a06f   ; ficha_en_menos_1: A = la ficha de 0xD200 en (D, E) - 1 (p01:7176) y sigue en p01:7141
	pop de			;a072
	jr c,L_A086		;a073
	ld (ix+010h),079h		;a075   ; el fotograma del actor (p02:8A42) = 0x79
	xor a			;a079
	ld (ix+01ch),a		;a07a
	ld a,(ix+005h)		;a07d   ; lee la X del actor
	add a,004h		;a080
	ld (ix+005h),a		;a082   ; guarda la X del actor
	ret			;a085
L_A086:
	ld a,(ix+005h)		;a086   ; lee la X del actor
	sub 004h		;a089
	ld (ix+005h),a		;a08b   ; guarda la X del actor
	ld (ix+01ch),001h		;a08e
	ld (ix+010h),07bh		;a092   ; el fotograma del actor (p02:8A42) = 0x7B
	ret			;a096
L_A097:
	ld a,(ix+001h)		;a097   ; lee el paso del actor
	call 0408dh		;a09a   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_A09D: tabla de 4 palabras del despachador (call 0x408D en
;   0xA09A); lo leen L_408D (8 bytes)
;   0xa09d..0xa0a5  (8 bytes)
DATA_saltos_A09D:
	defb 0a5h,0a0h	; a09d
	defb 053h,0a1h	; a09f
	defb 0adh,0a1h	; a0a1
	defb 0d7h,0a1h	; a0a3

; ======================================================================
; CODIGO 0xa0a5..0xa40c  (871 bytes)
; ======================================================================


L_A0A5:
	call alterna_79_7b		;a0a5   ; alterna_79_7b: cada 4 cuadros, el fotograma alterna con 0x79 o 0x7B segun (ix+0x1C)
	dec (ix+011h)		;a0a8   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;a0ab
	call salto_al_azar		;a0ac   ; salto_al_azar: guarda la X en (ix+0x1F) y escoge al azar hacia donde ir
	ret nc			;a0af
	ld a,(ix+01dh)		;a0b0
	or a			;a0b3
	ld h,004h		;a0b4
	ld de,0ffc0h		;a0b6
	jr z,L_A0C0		;a0b9
	ld h,0fch		;a0bb
	ld de,00040h		;a0bd
L_A0C0:
	ld (ix+00dh),d		;a0c0   ; guarda la aceleracion Y del actor (alta)
	ld (ix+00ch),e		;a0c3   ; guarda la aceleracion Y del actor
	call 08b80h		;a0c6   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	ld a,(ix+01ch)		;a0c9
	or a			;a0cc
	ld h,001h		;a0cd
	jr nz,L_A0D3		;a0cf
	ld h,0ffh		;a0d1
L_A0D3:
	call 08b8bh		;a0d3   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	ld (ix+011h),020h		;a0d6   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	ld (ix+00bh),001h		;a0da   ; si el actor acelera (p02:8393) = 0x01
	inc (ix+001h)		;a0de   ; sube el paso del actor
	ret			;a0e1
espera_al_azar:		; (ix+0x11) = el numero del actor * 16 + un numero al azar
	call 08b4fh		;a0e2   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	ld b,a			;a0e5
	push ix		;a0e6
	pop hl			;a0e8
	ld de,0c400h		;a0e9   ; apunta a los 8 actores (0x80 bytes cada uno)
	or a			;a0ec
	sbc hl,de		;a0ed
	add hl,hl			;a0ef
	ld a,h			;a0f0
	add a,a			;a0f1
	add a,a			;a0f2
	add a,a			;a0f3
	add a,a			;a0f4
	add a,b			;a0f5
	ld (ix+011h),a		;a0f6   ; guarda la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret			;a0f9
alterna_79_7b:		; cada 4 cuadros, el fotograma alterna con 0x79 o 0x7B segun (ix+0x1C)
	ld a,(0c00dh)		;a0fa   ; lee la cuenta de cuadros del juego
	and 003h		;a0fd
	ret nz			;a0ff
	ld a,(ix+01ch)		;a100
	or a			;a103
	ld c,07bh		;a104
	jr nz,L_A10A		;a106
	ld c,079h		;a108
L_A10A:
	ld a,(ix+010h)		;a10a   ; lee el fotograma del actor (p02:8A42)
	sub c			;a10d
	xor 001h		;a10e
	add a,c			;a110
	ld (ix+010h),a		;a111   ; guarda el fotograma del actor (p02:8A42)
	ret			;a114
salto_al_azar:		; guarda la X en (ix+0x1F) y escoge al azar hacia donde ir
	ld a,(ix+005h)		;a115   ; lee la X del actor
	ld (ix+01fh),a		;a118
	ld d,a			;a11b
	ld a,(ix+01ch)		;a11c
	or a			;a11f
	ld a,0f0h		;a120
	jr nz,L_A126		;a122
	ld a,010h		;a124
L_A126:
	add a,d			;a126
	ld d,a			;a127
	call 08b4fh		;a128   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	ld b,a			;a12b
	and 002h		;a12c
	ld a,b			;a12e
	jr z,L_A13D		;a12f
	ld a,(0c244h)		;a131   ; lee la Y del personaje
	cp (ix+003h)		;a134   ; compara con la Y del actor
	ld a,000h		;a137
	jr c,L_A13D		;a139
	ld a,001h		;a13b
L_A13D:
	and 001h		;a13d
	ld e,0e0h		;a13f
	jr z,L_A145		;a141
	ld e,020h		;a143
L_A145:
	ld (ix+01dh),a		;a145
	ld a,(ix+003h)		;a148   ; lee la Y del actor
	add a,e			;a14b
	ld e,a			;a14c
	ld (ix+01eh),a		;a14d
	jp 070bfh		;a150   ; ficha_en_menos_1: A = la ficha de 0xD200 en (D, E) - 1 (p01:7176) y sigue en p01:7141
L_A153:
	ld a,(ix+003h)		;a153   ; lee la Y del actor
	cp 0d4h		;a156
	jr c,L_A15E		;a158
	ld (ix+003h),0d4h		;a15a   ; la Y del actor = 0xD4
L_A15E:
	call fotograma_7a_7c		;a15e   ; fotograma_7a_7c: en cuadros pares, el fotograma de 0x7A7D / 0x7C7E segun (ix+0x1C)
	dec (ix+011h)		;a161   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;a164
	ld (ix+00bh),000h		;a165   ; si el actor acelera (p02:8393) = 0x00
	inc (ix+001h)		;a169   ; sube el paso del actor
	ld (ix+011h),010h		;a16c   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld a,(ix+01ch)		;a170
	or a			;a173
	ld h,0feh		;a174
	jr nz,L_A17A		;a176
	ld h,002h		;a178
L_A17A:
	call 08b8bh		;a17a   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	ld a,(ix+008h)		;a17d   ; lee la velocidad Y del actor (alta)
	cp 080h		;a180
	ld h,002h		;a182
	jr c,L_A188		;a184
	ld h,0feh		;a186
L_A188:
	call 08b80h		;a188   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	ret			;a18b
fotograma_7a_7c:		; en cuadros pares, el fotograma de 0x7A7D / 0x7C7E segun (ix+0x1C)
	ld a,(0c00dh)		;a18c   ; lee la cuenta de cuadros del juego
	and 001h		;a18f
	ret nz			;a191
	ld de,07a7dh		;a192
	ld hl,07c7eh		;a195
	ld a,(ix+01ch)		;a198
	or a			;a19b
	ld a,b			;a19c
	jr z,L_A1A0		;a19d
	ex de,hl			;a19f
L_A1A0:
	ld a,(0c00dh)		;a1a0   ; lee la cuenta de cuadros del juego
	and 004h		;a1a3
	ld a,d			;a1a5
	jr z,L_A1A9		;a1a6
	ld a,e			;a1a8
L_A1A9:
	ld (ix+010h),a		;a1a9   ; guarda el fotograma del actor (p02:8A42)
	ret			;a1ac
L_A1AD:
	call fotograma_7a_7c		;a1ad   ; fotograma_7a_7c: en cuadros pares, el fotograma de 0x7A7D / 0x7C7E segun (ix+0x1C)
	dec (ix+011h)		;a1b0   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;a1b3
	call 08ba9h		;a1b4   ; para_actor: velocidades a cero
	ld a,(ix+01fh)		;a1b7
	ld (ix+005h),a		;a1ba   ; guarda la X del actor
	ld a,(ix+01eh)		;a1bd
	ld (ix+003h),a		;a1c0   ; guarda la Y del actor
	call espera_por_estado		;a1c3   ; espera_por_estado: (ix+0x11) = 0x20, 0x10 u 8 segun el estado del personaje
	ld (ix+001h),000h		;a1c6   ; el paso del actor = 0x00
	ld a,(ix+01ch)		;a1ca
	or a			;a1cd
	ld c,07bh		;a1ce
	jr nz,L_A1D4		;a1d0
	ld c,079h		;a1d2
L_A1D4:
	ld (ix+010h),c		;a1d4   ; guarda el fotograma del actor (p02:8A42)
L_A1D7:
	ret			;a1d7
espera_por_estado:		; (ix+0x11) = 0x20, 0x10 u 8 segun el estado del personaje
	call 08c16h		;a1d8   ; estado_del_que_se_lleva: A = el estado del personaje que se lleva
	ld c,020h		;a1db
	or a			;a1dd
	jr z,L_A1E8		;a1de
	ld c,010h		;a1e0
	cp 003h		;a1e2
	jr z,L_A1E8		;a1e4
	ld c,008h		;a1e6
L_A1E8:
	ld (ix+011h),c		;a1e8   ; guarda la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret			;a1eb
L_A1EC:
	call 08b48h		;a1ec   ; compara_x: compara la X del personaje con la del actor
	ld h,002h		;a1ef
	jr nc,L_A1F5		;a1f1
	ld h,0feh		;a1f3
L_A1F5:
	call 08b8bh		;a1f5   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	ld de,05a5bh		;a1f8
	jp 09b8dh		;a1fb   ; fotograma_por_sentido: (ix+0x10) = D si va a la derecha (velocidad X positiva), si no E
L_A1FE:
	ret			;a1fe
L_A1FF:
	ld (ix+013h),000h		;a1ff   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ld (ix+011h),030h		;a203   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x30
	ret			;a207
L_A208:
	dec (ix+011h)		;a208   ; cada 0x20 cuadros escoge una direccion
	ret nz			;a20b
	ld (ix+011h),020h		;a20c   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	ld a,r		;a210   ; al azar: R (el refresco del Z80) xor la cuenta de cuadros
	ld b,a			;a212
	ld a,(0c00dh)		;a213   ; lee la cuenta de cuadros del juego
	xor b			;a216
	ld c,a			;a217
	and 003h		;a218   ; 0 no se mueve; 1-3, una de tres; con el bit 2, tres mas
	ret z			;a21a
	dec a			;a21b
	ld b,a			;a21c
	ld a,c			;a21d
	and 004h		;a21e
	jr z,L_A225		;a220
	inc b			;a222
	inc b			;a223
	inc b			;a224
L_A225:
	ld a,b			;a225
	ld (0c313h),a		;a226   ; guarda cuenta de trabajo de los actores
	cp 003h		;a229
	ld de,05882h		;a22b
	jr nc,L_A232		;a22e
	ld d,0a8h		;a230
L_A232:
	ld c,039h		;a232
	push ix		;a234
	call 08613h		;a236   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;a239
	ret			;a23b
L_A23C:
	ld (ix+013h),000h		;a23c   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ld (ix+011h),021h		;a240   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x21
	ret			;a244
L_A245:
	dec (ix+011h)		;a245   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;a248
	ld (ix+011h),030h		;a249   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x30
	ld a,(0c246h)		;a24d   ; lee la X del personaje
	cp 080h		;a250
	ld de,06064h		;a252
	jr c,L_A259		;a255
	ld d,0a0h		;a257
L_A259:
	ld c,03eh		;a259
	push ix		;a25b
	call 08613h		;a25d   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;a260
	ret			;a262
L_A263:
	xor a			;a263
	ld (ix+013h),a		;a264   ; guarda las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	ld (ix+011h),040h		;a267   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x40
	ld (ix+01eh),a		;a26b
	ld (0c313h),a		;a26e   ; guarda cuenta de trabajo de los actores
	push ix		;a271
	ld de,0802eh		;a273
	ld c,01ch		;a276
	call 08613h		;a278   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;a27b
	ret			;a27d
L_A27E:
	call velocidad_por_1e		;a27e   ; velocidad_por_1e: 0xC313 = -(0xC0, 0xE0 o 0) y p00:55AA
	dec (ix+011h)		;a281   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;a284
	call vueltas_1f		;a285   ; vueltas_1f: (ix+0x1F) + 1; hasta 6: (ix+0x11) = 0x40 y (ix+0x1E) = 0
	ld a,r		;a288
	ld b,a			;a28a
	ld a,(0c00dh)		;a28b   ; lee la cuenta de cuadros del juego
	xor b			;a28e
	ld b,a			;a28f
	and 01fh		;a290
	sla a		;a292
	sla a		;a294
	sla a		;a296
	ld d,a			;a298
	call cerca_en_x		;a299   ; cerca_en_x: si A + 0x20 < 0x40: D = la X del personaje
	ld a,b			;a29c
	and 040h		;a29d
	ld c,03ch		;a29f
	ld e,030h		;a2a1
	push ix		;a2a3
	call 08613h		;a2a5   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;a2a8
	ret			;a2aa
cerca_en_x:		; si A + 0x20 < 0x40: D = la X del personaje
	add a,020h		;a2ab
	cp 040h		;a2ad
	ret nc			;a2af
	ld a,(0c246h)		;a2b0   ; lee la X del personaje
	ld d,a			;a2b3
	ret			;a2b4
vueltas_1f:		; (ix+0x1F) + 1; hasta 6: (ix+0x11) = 0x40 y (ix+0x1E) = 0
	inc (ix+01fh)		;a2b5   ; (ix+0x1F) cuenta las vueltas: hasta 6, espera de 0x40 cuadros
	ld a,(ix+01fh)		;a2b8
	cp 006h		;a2bb
	jr nc,L_A2C8		;a2bd
	ld (ix+011h),040h		;a2bf   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x40
	ld (ix+01eh),000h		;a2c3
	ret			;a2c7
L_A2C8:
	ld (ix+01eh),001h		;a2c8   ; despues, cada 8 cuadros con (ix+0x1E) = 1, hasta 0x18 vueltas
	ld (ix+011h),008h		;a2cc   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	ld a,(ix+01fh)		;a2d0
	cp 018h		;a2d3
	ret nz			;a2d5
	ld (ix+01fh),000h		;a2d6
	ret			;a2da
velocidad_por_1e:		; 0xC313 = -(0xC0, 0xE0 o 0) y p00:55AA
	ld d,0c0h		;a2db
	ld a,(ix+01eh)		;a2dd
	or a			;a2e0
	jr nz,L_A2E5		;a2e1
	ld d,0e0h		;a2e3
L_A2E5:
	ld a,(ix+011h)		;a2e5   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	and 001h		;a2e8
	jr z,L_A2EE		;a2ea
	ld d,000h		;a2ec
L_A2EE:
	ld a,d			;a2ee
	neg		;a2ef
	ld (0c313h),a		;a2f1   ; guarda cuenta de trabajo de los actores
	jp 055aah		;a2f4   ; ajuste_de_pantalla: R#18 (ajuste de la imagen) = D
L_A2F7:
	ld (ix+013h),000h		;a2f7   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ld (ix+011h),010h		;a2fb   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ret			;a2ff
L_A300:
	dec (ix+011h)		;a300   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;a303
	ld (ix+011h),010h		;a304   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld a,001h		;a308
	ld de,05044h		;a30a
	call crea_tipo_3b		;a30d   ; crea_tipo_3b: 0xC313 = A y crea el actor 0x3B
	xor a			;a310
	ld de,0b044h		;a311
crea_tipo_3b:		; 0xC313 = A y crea el actor 0x3B
	ld (0c313h),a		;a314   ; guarda cuenta de trabajo de los actores
	ld c,03bh		;a317
	push ix		;a319
	call 08613h		;a31b   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;a31e
	ret			;a320
L_A321:
	ld (ix+011h),010h		;a321   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld (ix+013h),000h		;a325   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ret			;a329
L_A32A:
	dec (ix+011h)		;a32a   ; cada 0x30 cuadros, una direccion al azar de 3 a 6 (sin el 5)
	ret nz			;a32d
	ld (ix+011h),030h		;a32e   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x30
	ld d,003h		;a332
	ld a,r		;a334
	ld b,a			;a336
	ld a,(0c00dh)		;a337   ; lee la cuenta de cuadros del juego
	xor b			;a33a
	and 003h		;a33b
	add a,d			;a33d
	cp 005h		;a33e
	jr c,L_A343		;a340
	inc a			;a342
L_A343:
	ld (0c313h),a		;a343   ; guarda cuenta de trabajo de los actores
	ld c,037h		;a346
	cp 005h		;a348
	ld de,08038h		;a34a
	jr c,L_A355		;a34d
	ld d,070h		;a34f
	jr z,L_A355		;a351
	ld d,060h		;a353
L_A355:
	push ix		;a355
	call 08613h		;a357   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;a35a
	ret			;a35c
L_A35D:
	ld a,015h		;a35d
	call 056e3h		;a35f   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld a,(ix+005h)		;a362   ; lee la X del actor
	ld (ix+01eh),a		;a365
	ld a,(ix+003h)		;a368   ; lee la Y del actor
	ld (ix+01dh),a		;a36b
	ld (ix+005h),010h		;a36e   ; la X del actor = 0x10
	ld (ix+003h),010h		;a372   ; la Y del actor = 0x10
	xor a			;a376
	ld (ix+006h),a		;a377   ; guarda si el actor se mueve (p02:8367)
	ld (ix+004h),a		;a37a   ; guarda la X del actor (fraccion)
	ld (ix+002h),a		;a37d   ; guarda la Y del actor (fraccion)
	ld a,(0c313h)		;a380   ; lee cuenta de trabajo de los actores
	ld (ix+01fh),a		;a383
	call plantilla_aebc		;a386   ; plantilla_aebc: la plantilla (ix+0x1F) * 11 de p06:AEBC (p00:5596)
	ld (ix+01ch),050h		;a389
	jp L_A422		;a38d
plantilla_aebc:		; la plantilla (ix+0x1F) * 11 de p06:AEBC (p00:5596)
	ld hl,0aebch		;a390
	ld a,(ix+01fh)		;a393
plantilla_por_once:		; la plantilla de actor (p00:5596) de HL + A * 11
	ld b,a			;a396
	add a,a			;a397
	add a,a			;a398
	ld c,a			;a399
	add a,a			;a39a
	add a,c			;a39b
	sub b			;a39c
	call 04083h		;a39d   ; hl_mas_a: HL = HL + A
	jp 05596h		;a3a0   ; plantilla_de_actor: con 4-5-6: 11 bytes de HL a (ix+7)
L_A3A3:
	dec (ix+01ch)		;a3a3
	jp z,083d6h		;a3a6   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	ld a,(ix+008h)		;a3a9   ; lee la velocidad Y del actor (alta)
	ld b,a			;a3ac
	and 0f0h		;a3ad
	add a,018h		;a3af
	add a,b			;a3b1
	add a,(ix+01dh)		;a3b2
	ld e,a			;a3b5
	ld a,(ix+01eh)		;a3b6
	add a,010h		;a3b9
	ld d,a			;a3bb
	call 0704ch		;a3bc   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ld hl,0a40ch		;a3bf
	ld (ix+01bh),001h		;a3c2
	jr c,L_A3F1		;a3c6
	ld a,(ix+00ah)		;a3c8   ; lee la velocidad X del actor (alta)
	ld b,a			;a3cb
	and 0f0h		;a3cc
	add a,018h		;a3ce
	add a,b			;a3d0
	add a,(ix+01eh)		;a3d1
	ld d,a			;a3d4
	ld a,(ix+01dh)		;a3d5
	add a,010h		;a3d8
	ld e,a			;a3da
	call 0704ch		;a3db   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ld hl,0a417h		;a3de
	ld (ix+01bh),002h		;a3e1
	jr c,L_A3F1		;a3e5
	ld (ix+01bh),000h		;a3e7
	call copia_partes		;a3eb   ; copia_partes: copia 3 partes de la ficha (desde ix+0x2C a ix+0x4A)
	jp colores_parpadean		;a3ee   ; colores_parpadean: dos colores de pieza alternos cada cuadro (0x0B0B / 0x0D0D)
L_A3F1:
	push hl			;a3f1
	ld a,014h		;a3f2
	call 056e3h		;a3f4   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	pop hl			;a3f7
	ld a,(ix+01fh)		;a3f8
	call 04083h		;a3fb   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;a3fe
	ld (ix+01fh),a		;a3ff
	call plantilla_aebc		;a402   ; plantilla_aebc: la plantilla (ix+0x1F) * 11 de p06:AEBC (p00:5596)
	call copia_partes		;a405   ; copia_partes: copia 3 partes de la ficha (desde ix+0x2C a ix+0x4A)
	call colores_parpadean		;a408   ; colores_parpadean: dos colores de pieza alternos cada cuadro (0x0B0B / 0x0D0D)
	ret			;a40b

; ----------------------------------------------------------------------
; DATOS resto_A40C: tablas cortas que apuntan p03:A3BF (0xA40C), p03:A3DE
;   (0xA417); el tamano de cada una sale del lector siguiente, no de
;   recorrerla; lo leen p03:A3BF, p03:A3DE (22 bytes)
;   0xa40c..0xa422  (22 bytes)
DATA_resto_A40C:
	defb 004h,003h,002h,001h,000h,005h,00ah,009h,008h,007h,006h,00ah,009h,008h,007h,006h	; a40c  ................
	defb 005h,004h,003h,002h,001h,000h	; a41c

; ======================================================================
; CODIGO 0xa422..0xa530  (270 bytes)
; ======================================================================


L_A422:
	ld a,(ix+010h)		;a422   ; lee el fotograma del actor (p02:8A42)
	ld (ix+024h),a		;a425
	call posiciones_de_partes		;a428   ; posiciones_de_partes: las posiciones de las partes del actor ((ix+0x1D/0x1E) + 8)
	ld (ix+025h),004h		;a42b
	push ix		;a42f
	pop hl			;a431
	ld a,022h		;a432
	call 04083h		;a434   ; hl_mas_a: HL = HL + A
	push ix		;a437
	pop de			;a439
	ld a,040h		;a43a
	call 04088h		;a43c   ; de_mas_a: DE = DE + A
	jr L_A450		;a43f
posiciones_de_partes:		; las posiciones de las partes del actor ((ix+0x1D/0x1E) + 8)
	push ix		;a441
	pop hl			;a443
	ld a,022h		;a444
	call 04083h		;a446   ; hl_mas_a: HL = HL + A
	ld d,h			;a449
	ld e,l			;a44a
	ld a,005h		;a44b
	call 04088h		;a44d   ; de_mas_a: DE = DE + A
L_A450:
	ld a,(ix+01dh)		;a450   ; las tres partes en la posicion (ix+0x1D/0x1E) + 8
	add a,008h		;a453
	ld (ix+022h),a		;a455
	ld (ix+041h),a		;a458
	ld a,(ix+01eh)		;a45b
	add a,008h		;a45e
	ld (ix+023h),a		;a460
	ld (ix+042h),a		;a463
	ld b,003h		;a466
L_A468:
	push bc			;a468   ; 3 grupos de 4 bytes, saltando uno entre grupo y grupo
	ldi		;a469
	ldi		;a46b
	ldi		;a46d
	ldi		;a46f
	inc de			;a471
	inc hl			;a472
	pop bc			;a473
	djnz L_A468		;a474
	ret			;a476
copia_partes:		; copia 3 partes de la ficha (desde ix+0x2C a ix+0x4A)
	ld b,003h		;a477
	push ix		;a479
	pop hl			;a47b
	ld a,02ch		;a47c
	call 04083h		;a47e   ; hl_mas_a: HL = HL + A
	push ix		;a481
	pop de			;a483
	ld a,04ah		;a484
	call 04088h		;a486   ; de_mas_a: DE = DE + A
	push de			;a489
	push ix		;a48a
	exx			;a48c
	pop de			;a48d
	pop hl			;a48e
	ld a,031h		;a48f
	call 04088h		;a491   ; de_mas_a: DE = DE + A
	exx			;a494
L_A495:
	push bc			;a495   ; cada parte del cuerpo copia la posicion de la anterior: 3 bytes y 8 atras
	exx			;a496
	ldi		;a497
	ldi		;a499
	ldi		;a49b
	ex de,hl			;a49d
	ld bc,00008h		;a49e
	or a			;a4a1
	sbc hl,bc		;a4a2
	ex de,hl			;a4a4
	or a			;a4a5
	sbc hl,bc		;a4a6
	exx			;a4a8
	ldi		;a4a9   ; lo mismo con la segunda tira de partes
	ldi		;a4ab
	ldi		;a4ad
	ex de,hl			;a4af
	ld bc,00008h		;a4b0
	or a			;a4b3
	sbc hl,bc		;a4b4
	ex de,hl			;a4b6
	or a			;a4b7
	sbc hl,bc		;a4b8
	pop bc			;a4ba
	djnz L_A495		;a4bb
	call mueve_1d_1e		;a4bd   ; despues se mueve la cabeza
	ld a,(ix+01dh)		;a4c0   ; su sitio, (ix+0x1D/0x1E) + 8, y su fotograma en la primera parte
	add a,008h		;a4c3
	ld (ix+022h),a		;a4c5
	ld a,(ix+01eh)		;a4c8
	add a,008h		;a4cb
	ld (ix+023h),a		;a4cd
	ld a,(ix+010h)		;a4d0   ; lee el fotograma del actor (p02:8A42)
	ld (ix+024h),a		;a4d3
	ret			;a4d6
mueve_1d_1e:		; si no (ix+0x1B): (ix+0x1E) += velocidad X y (ix+0x1D) += velocidad Y
	ld a,(ix+01bh)		;a4d7
	or a			;a4da
	jr nz,L_A4F0		;a4db
	ld a,(ix+01eh)		;a4dd
	add a,(ix+00ah)		;a4e0   ; le suma la velocidad X del actor (alta)
	ld (ix+01eh),a		;a4e3
	ld a,(ix+01dh)		;a4e6
	add a,(ix+008h)		;a4e9   ; le suma la velocidad Y del actor (alta)
	ld (ix+01dh),a		;a4ec
	ret			;a4ef
L_A4F0:
	ld a,(ix+01bh)		;a4f0   ; (ix+0x1B) 3: direccion 4; 4: direccion 0; 1: p03:A51E
	cp 003h		;a4f3
	ld a,004h		;a4f5
	jr z,L_A51A		;a4f7
	ld a,(ix+01bh)		;a4f9
	cp 004h		;a4fc
	ld a,000h		;a4fe
	jr z,L_A51A		;a500
	ld a,(ix+01bh)		;a502
	dec a			;a505
	jr z,L_A51E		;a506
	ld a,(ix+01fh)		;a508   ; si no, la Y + p03:A530[(ix+0x1F)]
	ld hl,0a530h		;a50b
	call 04083h		;a50e   ; hl_mas_a: HL = HL + A
	ld a,(ix+01dh)		;a511
	add a,(hl)			;a514
	ld (ix+01dh),a		;a515
L_A518:
	ld a,003h		;a518
L_A51A:
	ld (ix+01bh),a		;a51a
	ret			;a51d
L_A51E:
	ld a,(ix+01fh)		;a51e
	ld hl,0a53bh		;a521
	call 04083h		;a524   ; hl_mas_a: HL = HL + A
	ld a,(ix+01eh)		;a527
	add a,(hl)			;a52a
	ld (ix+01eh),a		;a52b
	jr L_A518		;a52e

; ----------------------------------------------------------------------
; DATOS resto_A530: tablas cortas que apuntan p03:A50B (0xA530), p03:A521
;   (0xA53B); el tamano de cada una sale del lector siguiente, no de
;   recorrerla; lo leen p03:A50B, p03:A521 (22 bytes)
;   0xa530..0xa546  (22 bytes)
DATA_resto_A530:
	defb 0f0h,0f0h,000h,010h,010h,000h,010h,010h,000h,0f0h,0f0h,006h,010h,008h,010h,006h	; a530  ................
	defb 000h,0fah,0f0h,0f8h,0f0h,0fah	; a540

; ======================================================================
; CODIGO 0xa546..0xa5b4  (110 bytes)
; ======================================================================


colores_parpadean:		; dos colores de pieza alternos cada cuadro (0x0B0B / 0x0D0D)
	ld b,002h		;a546
	ld de,00b0bh		;a548
	ld hl,00d0dh		;a54b
L_A54E:
	ld a,(0c00dh)		;a54e   ; lee la cuenta de cuadros del juego
	and 001h		;a551
	jr z,L_A556		;a553
	ex de,hl			;a555
L_A556:
	push ix		;a556
	pop hl			;a558
	ld a,025h		;a559
	call 04083h		;a55b   ; hl_mas_a: HL = HL + A
L_A55E:
	ld (hl),d			;a55e
	ld a,005h		;a55f
	call 04083h		;a561   ; hl_mas_a: HL = HL + A
	ld (hl),e			;a564
	ld a,005h		;a565
	call 04083h		;a567   ; hl_mas_a: HL = HL + A
	djnz L_A55E		;a56a
	ret			;a56c
L_A56D:
	ld a,013h		;a56d
	call 056e3h		;a56f   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld a,(0c313h)		;a572   ; lee cuenta de trabajo de los actores
	ld (ix+01fh),a		;a575
	cp 003h		;a578
	ld a,070h		;a57a
	ld bc,0ff00h		;a57c
	ld h,004h		;a57f
	jr c,L_A589		;a581
	ld h,0fch		;a583
	ld a,06ch		;a585
	ld b,001h		;a587
L_A589:
	ld (ix+010h),a		;a589   ; guarda el fotograma del actor (p02:8A42)
	ld (ix+00fh),b		;a58c   ; guarda la aceleracion X del actor (alta)
	ld (ix+00eh),c		;a58f   ; guarda la aceleracion X del actor
	call 08b8bh		;a592   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	ld a,(0c313h)		;a595   ; lee cuenta de trabajo de los actores
	cp 003h		;a598
	jr c,L_A59E		;a59a
	sub 003h		;a59c
L_A59E:
	ld hl,0a5b4h		;a59e
	call 04083h		;a5a1   ; hl_mas_a: HL = HL + A
	ld h,(hl)			;a5a4
	call 08b80h		;a5a5   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	ld (ix+011h),008h		;a5a8   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	xor a			;a5ac
	ld (ix+006h),a		;a5ad   ; guarda si el actor se mueve (p02:8367)
	ld (ix+013h),a		;a5b0   ; guarda las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	ret			;a5b3

; ----------------------------------------------------------------------
; DATOS resto_A5B4: tablas cortas que apuntan p03:A59E (0xA5B4); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:A59E (3
;   bytes)
;   0xa5b4..0xa5b7  (3 bytes)
DATA_resto_A5B4:
	defb 002h,003h,004h	; a5b4

; ======================================================================
; CODIGO 0xa5b7..0xa5bd  (6 bytes)
; ======================================================================


L_A5B7:
	ld a,(ix+001h)		;a5b7   ; lee el paso del actor
	call 0408dh		;a5ba   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_A5BD: tabla de 4 palabras del despachador (call 0x408D en
;   0xA5BA); lo leen L_408D (8 bytes)
;   0xa5bd..0xa5c5  (8 bytes)
DATA_saltos_A5BD:
	defb 0c5h,0a5h	; a5bd
	defb 0d1h,0a5h	; a5bf
	defb 0fdh,0a5h	; a5c1
	defb 018h,0a6h	; a5c3

; ======================================================================
; CODIGO 0xa5c5..0xa5fa  (53 bytes)
; ======================================================================


L_A5C5:
	dec (ix+011h)		;a5c5   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;a5c8
	inc (ix+001h)		;a5c9   ; sube el paso del actor
	ld (ix+006h),001h		;a5cc   ; si el actor se mueve (p02:8367) = 0x01
	ret			;a5d0
L_A5D1:
	ld a,(ix+01fh)		;a5d1
	cp 003h		;a5d4
	jr c,L_A5DA		;a5d6
	sub 003h		;a5d8
L_A5DA:
	ld hl,0a5fah		;a5da
	call 04083h		;a5dd   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;a5e0
	cp (ix+003h)		;a5e1   ; compara con la Y del actor
	ret nc			;a5e4
	ld (ix+008h),002h		;a5e5   ; la velocidad Y del actor (alta) = 0x02
	ld (ix+00bh),001h		;a5e9   ; si el actor acelera (p02:8393) = 0x01
	inc (ix+001h)		;a5ed   ; sube el paso del actor
	ld (ix+011h),008h		;a5f0   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	ld (ix+013h),001h		;a5f4   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x01
	jr $+29		;a5f8

; ----------------------------------------------------------------------
; DATOS resto_A5FA: tablas cortas que apuntan p03:A5DA (0xA5FA); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:A5DA (3
;   bytes)
;   0xa5fa..0xa5fd  (3 bytes)
DATA_resto_A5FA:
	defb 090h,09ch,0a8h	; a5fa

; ======================================================================
; CODIGO 0xa5fd..0xa802  (517 bytes)
; ======================================================================


L_A5FD:
	ld a,(ix+011h)		;a5fd   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	cp 004h		;a600
	call z,fotograma_mas_1		;a602   ; fotograma_mas_1: (ix+0x10) + 1
	dec (ix+011h)		;a605   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;a608
	ld h,000h		;a609
	call 08b80h		;a60b   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	ld (ix+00bh),000h		;a60e   ; si el actor acelera (p02:8393) = 0x00
	inc (ix+001h)		;a612   ; sube el paso del actor
fotograma_mas_1:		; (ix+0x10) + 1
	inc (ix+010h)		;a615   ; sube el fotograma del actor (p02:8A42)
L_A618:
	ret			;a618
L_A619:
	ld hl,0af4bh		;a619
	call 05596h		;a61c   ; plantilla_de_actor: con 4-5-6: 11 bytes de HL a (ix+7)
	ld a,r		;a61f
	ld b,a			;a621
	ld a,(0c00dh)		;a622   ; lee la cuenta de cuadros del juego
	add a,b			;a625
	ld b,a			;a626
	ld a,(0de80h)		;a627   ; lee variable de trabajo del banco 0
	add a,b			;a62a
	ld (0de80h),a		;a62b   ; guarda variable de trabajo del banco 0
	and 003h		;a62e
	rr a		;a630
	ld h,a			;a632
	ld a,000h		;a633
	rr a		;a635
	ld l,a			;a637
	ld a,(0c313h)		;a638   ; lee cuenta de trabajo de los actores
	or a			;a63b
	call nz,08b31h		;a63c   ; niega_hl: HL = -HL
	call 08b8dh		;a63f   ; pon_velocidad_x: (ix+9, 0x0A) = HL
	ld a,(0de80h)		;a642   ; lee variable de trabajo del banco 0
	rra			;a645
	rra			;a646
	and 003h		;a647
	add a,002h		;a649
	ld l,000h		;a64b
	ld h,a			;a64d
	call 08b31h		;a64e   ; niega_hl: HL = -HL
	jp 08b82h		;a651   ; pon_velocidad_y: (ix+7, 8) = HL
L_A654:
	call ciclo_84_87		;a654   ; ciclo_84_87: cada 4 cuadros, el fotograma de 0x84 a 0x87
	ld a,(ix+001h)		;a657   ; lee el paso del actor
	and a			;a65a
	ret nz			;a65b
	call frena_caida		;a65c   ; frena_caida: si la velocidad Y esta entre 6 y 0x50: 0x600 y sin aceleracion
	ld a,(ix+003h)		;a65f   ; lee la Y del actor
	cp 0c4h		;a662
	ret c			;a664
	ld a,016h		;a665
	call 056e3h		;a667   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	inc (ix+001h)		;a66a   ; sube el paso del actor
	call 08ba2h		;a66d   ; alinea_y_para: la Y del actor al centro de su fila (p03:A683), sin aceleracion y quieto
	ld (ix+003h),0c4h		;a670   ; la Y del actor = 0xC4
	ld a,(0c246h)		;a674   ; lee la X del personaje
	cp (ix+005h)		;a677   ; compara con la X del actor
	ld h,0feh		;a67a
	jr c,L_A680		;a67c
	ld h,002h		;a67e
L_A680:
	jp 08b8bh		;a680   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
alinea_y:		; la Y del actor al centro de su fila de 8 (+ 4)
	ld a,(ix+003h)		;a683   ; lee la Y del actor
	add a,004h		;a686
	and 0f8h		;a688
	add a,004h		;a68a
	ld (ix+003h),a		;a68c   ; guarda la Y del actor
	ret			;a68f
frena_caida:		; si la velocidad Y esta entre 6 y 0x50: 0x600 y sin aceleracion
	ld a,(ix+008h)		;a690   ; lee la velocidad Y del actor (alta)
	cp 006h		;a693
	ret c			;a695
	ld a,(ix+008h)		;a696   ; lee la velocidad Y del actor (alta)
	cp 050h		;a699
	ret nc			;a69b
	ld h,006h		;a69c
	call 08b80h		;a69e   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	ld (ix+00bh),000h		;a6a1   ; si el actor acelera (p02:8393) = 0x00
	ret			;a6a5
ciclo_84_87:		; cada 4 cuadros, el fotograma de 0x84 a 0x87
	ld a,(0c00dh)		;a6a6   ; lee la cuenta de cuadros del juego
	and 003h		;a6a9
	ret nz			;a6ab
	inc (ix+010h)		;a6ac   ; sube el fotograma del actor (p02:8A42)
	ld a,(ix+010h)		;a6af   ; lee el fotograma del actor (p02:8A42)
	cp 088h		;a6b2
	ret nz			;a6b4
	ld (ix+010h),084h		;a6b5   ; el fotograma del actor (p02:8A42) = 0x84
	ret			;a6b9
L_A6BA:
	ld a,012h		;a6ba
	call 056e3h		;a6bc   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld hl,0af56h		;a6bf
	call 05596h		;a6c2   ; plantilla_de_actor: con 4-5-6: 11 bytes de HL a (ix+7)
	ld (ix+013h),001h		;a6c5   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x01
	ld (ix+01fh),000h		;a6c9
	ret			;a6cd
L_A6CE:
	call ciclo_74_77		;a6ce   ; ciclo_74_77: cada 8 cuadros, el fotograma de 0x74 a 0x77
	ld a,(0c313h)		;a6d1   ; lee cuenta de trabajo de los actores
	srl a		;a6d4
	srl a		;a6d6
	srl a		;a6d8
	srl a		;a6da
	or a			;a6dc
	jr z,L_A6E9		;a6dd
	ld (ix+01fh),a		;a6df
	add a,(ix+003h)		;a6e2   ; le suma la Y del actor
	ld (ix+003h),a		;a6e5   ; guarda la Y del actor
	ret			;a6e8
L_A6E9:
	ld a,(ix+01fh)		;a6e9
	neg		;a6ec
	add a,(ix+003h)		;a6ee   ; le suma la Y del actor
	ld (ix+003h),a		;a6f1   ; guarda la Y del actor
	ld (ix+01fh),000h		;a6f4
	ret			;a6f8
ciclo_74_77:		; cada 8 cuadros, el fotograma de 0x74 a 0x77
	ld a,(0c00dh)		;a6f9   ; lee la cuenta de cuadros del juego
	and 007h		;a6fc
	ret nz			;a6fe
	inc (ix+010h)		;a6ff   ; sube el fotograma del actor (p02:8A42)
	ld a,(ix+010h)		;a702   ; lee el fotograma del actor (p02:8A42)
	cp 078h		;a705
	ret c			;a707
	ld (ix+010h),074h		;a708   ; el fotograma del actor (p02:8A42) = 0x74
	ret			;a70c
en_objeto_29:		; borra el actor y lo rehace como objeto de tipo 0x29: 2 piezas, colores 0x0D y 0x4E
	call 083d6h		;a70d   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	ld (ix+000h),029h		;a710   ; el tipo del actor = 0x29
	ld (ix+001h),000h		;a714   ; el paso del actor = 0x00
	ld (ix+020h),002h		;a718   ; las piezas del actor (p02:8648) = 0x02
	ld (ix+025h),00dh		;a71c
	ld (ix+02ah),04eh		;a720
	call 084c6h		;a724   ; marca_piezas: marca en 0xCC80 las piezas (ix+0x21) y (ix+0x26)
L_A727:
	ld a,(ix+003h)		;a727   ; lee la Y del actor
	sub 010h		;a72a
	ld (ix+003h),a		;a72c   ; guarda la Y del actor
	call sube_hasta_hueco		;a72f   ; sube_hasta_hueco: sube de 8 en 8 mientras haya casilla (p02:8BB7); por encima de 0x30 se borra
	ld a,(ix+003h)		;a732   ; lee la Y del actor
	sub 010h		;a735
	ld (ix+003h),a		;a737   ; guarda la Y del actor
	xor a			;a73a
	ld (ix+00bh),a		;a73b   ; guarda si el actor acelera (p02:8393)
	inc a			;a73e
	ld (ix+006h),a		;a73f   ; guarda si el actor se mueve (p02:8367)
	ld (ix+015h),a		;a742
	ld (ix+012h),a		;a745   ; guarda la vida del actor (p01:721A)
	ld (ix+013h),a		;a748   ; guarda las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	ld hl,0af61h		;a74b
	jp 05596h		;a74e   ; plantilla_de_actor: con 4-5-6: 11 bytes de HL a (ix+7)
sube_hasta_hueco:		; sube de 8 en 8 mientras haya casilla (p02:8BB7); por encima de 0x30 se borra
	ld a,040h		;a751
	ld e,0fch		;a753
	ld d,000h		;a755
	call 08bb7h		;a757   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	ld a,(ix+016h)		;a75a
	and 004h		;a75d
	ret z			;a75f
	ld a,(ix+003h)		;a760   ; lee la Y del actor
	sub 008h		;a763
	ld (ix+003h),a		;a765   ; guarda la Y del actor
	cp 030h		;a768
	jp c,083d6h		;a76a   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	jr sube_hasta_hueco		;a76d
L_A76F:
	ld a,(ix+001h)		;a76f   ; lee el paso del actor
	and a			;a772
	ret nz			;a773
	call frena_caida		;a774   ; frena_caida: si la velocidad Y esta entre 6 y 0x50: 0x600 y sin aceleracion
	ld e,(ix+008h)		;a777   ; lee la velocidad Y del actor (alta)
	ld d,000h		;a77a
	ld a,040h		;a77c
	call 08bb7h		;a77e   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	ld a,(ix+016h)		;a781
	and 004h		;a784
	ret z			;a786
	call 08ba2h		;a787   ; alinea_y_para: la Y del actor al centro de su fila (p03:A683), sin aceleracion y quieto
	inc (ix+001h)		;a78a   ; sube el paso del actor
	ret			;a78d
L_A78E:
	call hueco_cc60		;a78e   ; hueco_cc60: C = el primer hueco libre de 0xCC60 (4); acarreo si no hay
	jp c,083d6h		;a791   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	xor a			;a794
	ld (ix+006h),a		;a795   ; guarda si el actor se mueve (p02:8367)
	inc a			;a798
	ld (ix+013h),a		;a799   ; guarda las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	ld (ix+018h),0ffh		;a79c
	ld a,(ix+005h)		;a7a0   ; lee la X del actor
	sub 008h		;a7a3
	ld h,a			;a7a5
	ld a,(ix+003h)		;a7a6   ; lee la Y del actor
	sub 010h		;a7a9
	ld l,a			;a7ab
	ex de,hl			;a7ac
	ld a,(ix+01fh)		;a7ad
	ld hl,0a802h		;a7b0
	call 0543ah		;a7b3   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;a7b6
	ld bc,01010h		;a7b7
	ld a,004h		;a7ba
	push hl			;a7bc
	call 04bdeh		;a7bd   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop hl			;a7c0
	ld a,(ix+015h)		;a7c1
	jr $+70		;a7c4
dibuja_objetos_2a:		; el dibujo de los objetos de tipo 0x2A de 0xC400 (p03:A80A)
	ld ix,0c400h		;a7c6   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld b,008h		;a7ca
L_A7CC:
	ld a,(ix+000h)		;a7cc   ; lee el tipo del actor
	cp 02ah		;a7cf
	jr nz,L_A7EE		;a7d1
	ld a,(ix+005h)		;a7d3   ; lee la X del actor
	sub 008h		;a7d6
	ld h,a			;a7d8
	ld a,(ix+003h)		;a7d9   ; lee la Y del actor
	sub 010h		;a7dc
	ld l,a			;a7de
	ld a,(ix+015h)		;a7df
	push bc			;a7e2
	push af			;a7e3
	call dibujo_a81d		;a7e4   ; dibujo_a81d: copia 16 x 16 de la posicion p03:A81D[A - 1] con TIMP
	pop af			;a7e7
	cp 006h		;a7e8
	call z,copia_7c78		;a7ea   ; copia_7c78: copia 16 x 8 de (0x78, 0x10) a (0x7C, 0x78)
	pop bc			;a7ed
L_A7EE:
	ld de,00080h		;a7ee
	add ix,de		;a7f1
	djnz L_A7CC		;a7f3
	ret			;a7f5
copia_7c78:		; copia 16 x 8 de (0x78, 0x10) a (0x7C, 0x78)
	ld de,0787ch		;a7f6
	ld hl,01078h		;a7f9
	ld bc,01008h		;a7fc
	jp 04841h		;a7ff   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0

; ----------------------------------------------------------------------
; DATOS resto_A802: tablas cortas que apuntan p01:7569 (0xA802), p03:A7B0
;   (0xA802); el tamano de cada una sale del lector siguiente, no de
;   recorrerla; lo leen p01:7569, p03:A7B0 (8 bytes)
;   0xa802..0xa80a  (8 bytes)
DATA_resto_A802:
	defb 068h,080h,078h,080h,088h,080h,098h,080h	; a802  h.x.....

; ======================================================================
; CODIGO 0xa80a..0xa81d  (19 bytes)
; ======================================================================


dibujo_a81d:		; copia 16 x 16 de la posicion p03:A81D[A - 1] con TIMP
	push hl			;a80a
	dec a			;a80b
	ld hl,0a81dh		;a80c
	call 0543ah		;a80f   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;a812
	pop hl			;a813
	ex de,hl			;a814
	ld bc,01010h		;a815
	ld a,048h		;a818
	jp 04c73h		;a81a   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)

; ----------------------------------------------------------------------
; DATOS resto_A81D: tablas cortas que apuntan p03:A80C (0xA81D); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:A80C (26
;   bytes)
;   0xa81d..0xa837  (26 bytes)
DATA_resto_A81D:
	defb 068h,000h,068h,010h,068h,020h,068h,030h,068h,050h,080h,010h,068h,040h,078h,020h	; a81d  h.h.h h0hP..h@x
	defb 078h,030h,078h,040h,078h,050h,068h,010h,068h,020h	; a82d  x0x@xPh.h

; ======================================================================
; CODIGO 0xa837..0xa869  (50 bytes)
; ======================================================================


hueco_cc60:		; C = el primer hueco libre de 0xCC60 (4); acarreo si no hay
	ld hl,0cc60h		;a837
	ld b,004h		;a83a
	ld c,000h		;a83c
L_A83E:
	ld a,(hl)			;a83e   ; el primer hueco libre (0) de los 4 de 0xCC60; C su numero
	or a			;a83f
	jr z,L_A848		;a840
	inc c			;a842
	inc hl			;a843
	djnz L_A83E		;a844
	scf			;a846   ; ninguno: acarreo
	ret			;a847
L_A848:
	ld a,001h		;a848
	ld (hl),a			;a84a
	ld (ix+01fh),c		;a84b
	or a			;a84e
	ret			;a84f
L_A850:
	ret			;a850
L_A851:
	ld a,011h		;a851
	call 056e3h		;a853   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld (ix+013h),001h		;a856   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x01
	ld (ix+010h),082h		;a85a   ; el fotograma del actor (p02:8A42) = 0x82
	ld (ix+011h),008h		;a85e   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	ret			;a862
L_A863:
	ld a,(ix+001h)		;a863   ; lee el paso del actor
	call 0408dh		;a866   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_A869: tabla de 4 palabras del despachador (call 0x408D en
;   0xA866); lo leen L_408D (8 bytes)
;   0xa869..0xa871  (8 bytes)
DATA_saltos_A869:
	defb 071h,0a8h	; a869
	defb 091h,0a8h	; a86b
	defb 0b8h,0a8h	; a86d
	defb 0dbh,0a8h	; a86f

; ======================================================================
; CODIGO 0xa871..0xa8e9  (120 bytes)
; ======================================================================


L_A871:
	dec (ix+011h)		;a871   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;a874
	inc (ix+001h)		;a875   ; sube el paso del actor
	ld hl,(0c243h)		;a878   ; lee la Y del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	push hl			;a87b
	ld hl,0c000h		;a87c   ; apunta a el estado del juego
	ld (0c243h),hl		;a87f   ; guarda la Y del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	call 084deh		;a882   ; apunta_al_personaje_80: p02:84E0 con A = 0x80
	call 08b82h		;a885   ; pon_velocidad_y: (ix+7, 8) = HL
	ex de,hl			;a888
	call 08b8dh		;a889   ; pon_velocidad_x: (ix+9, 0x0A) = HL
	pop hl			;a88c
	ld (0c243h),hl		;a88d   ; guarda la Y del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	ret			;a890
L_A891:
	ld a,(ix+005h)		;a891   ; lee la X del actor
	add a,010h		;a894
	cp 020h		;a896
	ret c			;a898
	ld a,(ix+003h)		;a899   ; lee la Y del actor
	cp 0c4h		;a89c
	ret c			;a89e
	ld (ix+003h),0c4h		;a89f   ; la Y del actor = 0xC4
	ld a,011h		;a8a3
	call 056e3h		;a8a5   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	inc (ix+010h)		;a8a8   ; sube el fotograma del actor (p02:8A42)
	inc (ix+001h)		;a8ab   ; sube el paso del actor
	ld (ix+011h),004h		;a8ae   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x04
	call 08b89h		;a8b2   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	jp 08b7eh		;a8b5   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
L_A8B8:
	dec (ix+011h)		;a8b8   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;a8bb
	inc (ix+001h)		;a8bc   ; sube el paso del actor
	ld (ix+011h),011h		;a8bf   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x11
	ld (ix+01dh),0f8h		;a8c3
	ld (ix+00dh),001h		;a8c7   ; la aceleracion Y del actor (alta) = 0x01
	ld a,(0c246h)		;a8cb   ; lee la X del personaje
	cp (ix+005h)		;a8ce   ; compara con la X del actor
	ld a,001h		;a8d1
	jr nc,L_A8D7		;a8d3
	ld a,0ffh		;a8d5
L_A8D7:
	ld (ix+00fh),a		;a8d7   ; guarda la aceleracion X del actor (alta)
	ret			;a8da
L_A8DB:
	call crea_3f		;a8db   ; crea_3f: crea el actor 0x3F en su posicion con IX = 0xCC3A
	ld a,(ix+000h)		;a8de   ; lee el tipo del actor
	or a			;a8e1
	ret z			;a8e2
	inc (ix+019h)		;a8e3
	jp L_A939		;a8e6

; ----------------------------------------------------------------------
; DATOS resto_A8E9: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (4 bytes)
;   0xa8e9..0xa8ed  (4 bytes)
DATA_resto_A8E9:
	defb 004h,007h,00bh,00eh	; a8e9

; ======================================================================
; CODIGO 0xa8ed..0xaa3c  (335 bytes)
; ======================================================================


L_A8ED:
	ld a,(ix+07fh)		;a8ed   ; (ix+0x7E) + 1; si (ix+0x7F) es cero, - 1 en total
	inc (ix+07eh)		;a8f0
	or a			;a8f3
	ret nz			;a8f4
	dec (ix+07eh)		;a8f5
	dec (ix+07eh)		;a8f8
	ret			;a8fb
crea_3f:		; crea el actor 0x3F en su posicion con IX = 0xCC3A
	ld a,(ix+019h)		;a8fc
	and 001h		;a8ff
	ret nz			;a901
	push ix		;a902
	pop hl			;a904
	or a			;a905
	ld de,0c400h		;a906   ; apunta a los 8 actores (0x80 bytes cada uno)
	sbc hl,de		;a909
	ld d,(ix+005h)		;a90b   ; lee la X del actor
	ld e,(ix+003h)		;a90e   ; lee la Y del actor
	push ix		;a911
	ld ix,0cc3ah		;a913
	ld (ix+000h),000h		;a917
	ld c,03fh		;a91b
	push bc			;a91d
	push hl			;a91e
	call 08613h		;a91f   ; crea_actor_0: p02:8615 con B = 0
	pop hl			;a922
	pop bc			;a923
	ld a,(ix+000h)		;a924
	or a			;a927
	jr z,L_A930		;a928
	ld (ix+01bh),l		;a92a
	ld (ix+01ah),h		;a92d
L_A930:
	ld a,(ix+000h)		;a930
	pop ix		;a933
	or a			;a935
	jr z,L_A93F		;a936
	ret			;a938
L_A939:
	dec (ix+011h)		;a939   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	jp nz,L_AAD0		;a93c
L_A93F:
	push ix		;a93f
	push ix		;a941
	pop hl			;a943
	ld de,0c400h		;a944   ; apunta a los 8 actores (0x80 bytes cada uno)
	or a			;a947
	sbc hl,de		;a948
	ld ix,0c400h		;a94a   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld b,008h		;a94e
L_A950:
	ld a,(ix+000h)		;a950   ; lee el tipo del actor
	cp 03fh		;a953
	jr nz,L_A96A		;a955
	ld a,(ix+01bh)		;a957
	cp l			;a95a
	jr nz,L_A96A		;a95b
	ld a,(ix+01ah)		;a95d
	cp h			;a960
	jr nz,L_A96A		;a961
	push bc			;a963
	push hl			;a964
	call 083d6h		;a965   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	pop hl			;a968
	pop bc			;a969
L_A96A:
	ld de,00080h		;a96a
	add ix,de		;a96d
	djnz L_A950		;a96f
	pop ix		;a971
	jp 083d6h		;a973   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
L_A976:
	ld (ix+011h),001h		;a976   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x01
	ld (ix+010h),083h		;a97a   ; el fotograma del actor (p02:8A42) = 0x83
	ret			;a97e
L_A97F:
	call borra_si_no_3e		;a97f   ; borra_si_no_3e: borra el actor de (ix+0x1A/0x1B) si no es de tipo 0x3E
	ret c			;a982
	dec (ix+011h)		;a983   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;a986
	jp 083d6h		;a987   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
borra_si_no_3e:		; borra el actor de (ix+0x1A/0x1B) si no es de tipo 0x3E
	ld e,(ix+01bh)		;a98a
	ld d,(ix+01ah)		;a98d
	ld hl,0c400h		;a990   ; apunta a los 8 actores (0x80 bytes cada uno)
	add hl,de			;a993
	ld a,(hl)			;a994
	cp 03eh		;a995
	ret z			;a997
	call 083d6h		;a998   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	scf			;a99b
	ret			;a99c
L_A99D:
	ld (ix+013h),000h		;a99d   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ld (ix+011h),040h		;a9a1   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x40
	ret			;a9a5
L_A9A6:
	call orbita		;a9a6   ; orbita: cada 2 cuadros, la posicion de p03:AA3C[(ix+0x1F) & 0x0E] alrededor
	ld a,(ix+011h)		;a9a9   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	cp 020h		;a9ac
	push ix		;a9ae
	call z,borra_tipo_22		;a9b0   ; borra_tipo_22: borra el primer actor de tipo 0x22
	pop ix		;a9b3
	dec (ix+011h)		;a9b5
	ret nz			;a9b8
	push ix		;a9b9
	call 08e2eh		;a9bb   ; borra_todos_los_actores: p02:83D6 con los 8 actores de 0xC400
	pop ix		;a9be
	ld a,(0c31bh)		;a9c0
	or a			;a9c3
	jr z,L_A9DD		;a9c4
	ld hl,0c319h		;a9c6   ; apunta a los 3 bytes de la fase de p09:BED3
	ld d,(hl)			;a9c9
	inc hl			;a9ca
	ld e,(hl)			;a9cb
	inc hl			;a9cc
	ld c,(hl)			;a9cd
	ld (hl),000h		;a9ce
	push bc			;a9d0
	push ix		;a9d1
	call 08613h		;a9d3   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;a9d6
	pop bc			;a9d8
	ld a,c			;a9d9
	jp 055f0h		;a9da   ; juego_de_sprites: con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)
L_A9DD:
	ld a,041h		;a9dd
	call 056e3h		;a9df   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld hl,0c310h		;a9e2   ; apunta a el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	inc (hl)			;a9e5
	ld a,000h		;a9e6
	ld (0c31dh),a		;a9e8
	inc a			;a9eb
	ld (0c21ch),a		;a9ec   ; guarda no queda ningun 0x19 (la sala 5, acabada)
	ld a,(0c24bh)		;a9ef   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;a9f2
	ret z			;a9f4
	ld a,001h		;a9f5
	ld (0c271h),a		;a9f7
	ret			;a9fa
borra_tipo_22:		; borra el primer actor de tipo 0x22
	ld ix,0c400h		;a9fb   ; apunta a los 8 actores (0x80 bytes cada uno)
	ld b,008h		;a9ff
L_AA01:
	ld a,(ix+000h)		;aa01   ; lee el tipo del actor
	cp 022h		;aa04
	jp z,083d6h		;aa06   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	ld de,00080h		;aa09
	add ix,de		;aa0c
	djnz L_AA01		;aa0e
	ret			;aa10
orbita:		; cada 2 cuadros, la posicion de p03:AA3C[(ix+0x1F) & 0x0E] alrededor
	inc (ix+01fh)		;aa11
	ld a,(ix+01fh)		;aa14
	and 001h		;aa17
	ret nz			;aa19
	ld d,(ix+005h)		;aa1a   ; lee la X del actor
	ld e,(ix+003h)		;aa1d   ; lee la Y del actor
	ld a,(ix+01fh)		;aa20
	and 00eh		;aa23
	ld hl,0aa3ch		;aa25
	call 04083h		;aa28   ; hl_mas_a: HL = HL + A
	ld a,d			;aa2b
	add a,(hl)			;aa2c
	ld d,a			;aa2d
	inc hl			;aa2e
	ld a,e			;aa2f
	add a,(hl)			;aa30
	ld e,a			;aa31
	ld c,028h		;aa32
	push ix		;aa34
	call 08613h		;aa36   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;aa39
	ret			;aa3b

; ----------------------------------------------------------------------
; DATOS resto_AA3C: tablas cortas que apuntan p03:AA25 (0xAA3C); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:AA25 (16
;   bytes)
;   0xaa3c..0xaa4c  (16 bytes)
DATA_resto_AA3C:
	defb 000h,0f8h,0f8h,0f0h,008h,0f0h,0f8h,000h,008h,000h,0f8h,008h,008h,0e8h,000h,0f8h	; aa3c  ................

; ======================================================================
; CODIGO 0xaa4c..0xaa7b  (47 bytes)
; ======================================================================


L_AA4C:
	ld (ix+013h),002h		;aa4c   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x02
	ld a,(0c313h)		;aa50   ; lee cuenta de trabajo de los actores
	add a,091h		;aa53
	ld (ix+010h),a		;aa55   ; guarda el fotograma del actor (p02:8A42)
	ld (ix+01fh),008h		;aa58
	ld hl,0ff80h		;aa5c
	call 08b9bh		;aa5f   ; pon_aceleracion_y: (ix+0x0C, 0x0D) = HL
	ld h,000h		;aa62
	call 08b94h		;aa64   ; pon_aceleracion_x: (ix+0x0E, 0x0F) = HL
	ld a,(0c21dh)		;aa67   ; lee la ruina (0-4)
	ld hl,0aa7bh		;aa6a
	call 0543ah		;aa6d   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,(0c313h)		;aa70   ; lee cuenta de trabajo de los actores
	call 04083h		;aa73   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;aa76
	ld (ix+011h),a		;aa77   ; guarda la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret			;aa7a

; ----------------------------------------------------------------------
; DATOS resto_AA7B: tablas cortas que apuntan p03:AA6A (0xAA7B); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:AA6A (25
;   bytes)
;   0xaa7b..0xaa94  (25 bytes)
DATA_resto_AA7B:
	defb 085h,0aah,086h,0aah,088h,0aah,08bh,0aah,08fh,0aah,001h,001h,022h,001h,017h,02dh	; aa7b  ............"..-
	defb 001h,011h,021h,031h,001h,00eh,01bh,028h,035h	; aa8b  ..!1...(5

; ======================================================================
; CODIGO 0xaa94..0xabed  (345 bytes)
; ======================================================================


L_AA94:
	ld b,(ix+001h)		;aa94   ; lee el paso del actor
	djnz L_AAAD		;aa97
	ld a,(ix+003h)		;aa99   ; lee la Y del actor
	add a,004h		;aa9c
	ld (ix+003h),a		;aa9e   ; guarda la Y del actor
	ld a,(ix+011h)		;aaa1   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	cp 001h		;aaa4
	jr nz,L_AAAF		;aaa6
	inc (ix+001h)		;aaa8   ; sube el paso del actor
	jr L_AAAF		;aaab
L_AAAD:
	djnz L_AAC4		;aaad
L_AAAF:
	dec (ix+011h)		;aaaf   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	jr nz,L_AAD0		;aab2
	ld (ix+011h),021h		;aab4   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x21
	ld h,(ix+00dh)		;aab8   ; lee la aceleracion Y del actor (alta)
	ld l,(ix+00ch)		;aabb   ; lee la aceleracion Y del actor
	call 08b31h		;aabe   ; niega_hl: HL = -HL
	jp 08b9bh		;aac1   ; pon_aceleracion_y: (ix+0x0C, 0x0D) = HL
L_AAC4:
	dec (ix+011h)		;aac4   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;aac7
	inc (ix+001h)		;aac8   ; sube el paso del actor
	ld (ix+011h),011h		;aacb   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x11
	ret			;aacf
L_AAD0:
	ld a,(ix+01dh)		;aad0
	or (ix+01ch)		;aad3
	call z,invierte_aceleracion_x		;aad6   ; invierte_aceleracion_x: (ix+0x0E, 0x0F) = -(ix+0x0E, 0x0F)
	ld h,(ix+00fh)		;aad9   ; lee la aceleracion X del actor (alta)
	ld l,(ix+00eh)		;aadc   ; lee la aceleracion X del actor
	ld d,(ix+01fh)		;aadf
	ld e,(ix+01eh)		;aae2
	add hl,de			;aae5
	ld (ix+01fh),h		;aae6
	ld (ix+01eh),l		;aae9
	ld h,(ix+00dh)		;aaec   ; lee la aceleracion Y del actor (alta)
	ld l,(ix+00ch)		;aaef   ; lee la aceleracion Y del actor
	ld d,(ix+01dh)		;aaf2
	ld e,(ix+01ch)		;aaf5
	add hl,de			;aaf8
	ld (ix+01dh),h		;aaf9
	ld (ix+01ch),l		;aafc
	ld h,(ix+005h)		;aaff   ; lee la X del actor
	ld l,(ix+004h)		;ab02   ; lee la X del actor (fraccion)
	ld d,(ix+01fh)		;ab05
	ld e,(ix+01eh)		;ab08
	add hl,de			;ab0b
	ld (ix+005h),h		;ab0c   ; guarda la X del actor
	ld (ix+004h),l		;ab0f   ; guarda la X del actor (fraccion)
	ld h,(ix+003h)		;ab12   ; lee la Y del actor
	ld l,(ix+002h)		;ab15   ; lee la Y del actor (fraccion)
	ld d,(ix+01dh)		;ab18
	ld e,(ix+01ch)		;ab1b
	add hl,de			;ab1e
	ld (ix+003h),h		;ab1f   ; guarda la Y del actor
	ld (ix+002h),l		;ab22   ; guarda la Y del actor (fraccion)
	ret			;ab25
invierte_aceleracion_x:		; (ix+0x0E, 0x0F) = -(ix+0x0E, 0x0F)
	ld d,(ix+00fh)		;ab26   ; lee la aceleracion X del actor (alta)
	ld e,(ix+00eh)		;ab29   ; lee la aceleracion X del actor
	call 08b39h		;ab2c   ; niega_de: DE = -DE
	ld (ix+00fh),d		;ab2f   ; guarda la aceleracion X del actor (alta)
	ld (ix+00eh),e		;ab32   ; guarda la aceleracion X del actor
	ret			;ab35
L_AB36:
	call vida_por_ruina		;ab36   ; vida_por_ruina: la vida del actor + ruina * 16, y (ix+0x1A) igual
	ld (ix+010h),045h		;ab39   ; el fotograma del actor (p02:8A42) = 0x45
	ld (ix+07eh),001h		;ab3d
	ld a,001h		;ab41
	call velocidad_por_direccion		;ab43   ; velocidad_por_direccion: (ix+0x7F) = A y las velocidades de p03:AC62[A]
	ld a,(ix+003h)		;ab46   ; lee la Y del actor
	add a,004h		;ab49
	ld (ix+003h),a		;ab4b   ; guarda la Y del actor
	ld (ix+01fh),002h		;ab4e
	ld hl,0ff80h		;ab52
	call 08b9bh		;ab55   ; pon_aceleracion_y: (ix+0x0C, 0x0D) = HL
	ld h,000h		;ab58
	call 08b94h		;ab5a   ; pon_aceleracion_x: (ix+0x0E, 0x0F) = HL
	ld (ix+011h),005h		;ab5d   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x05
	ld (ix+078h),040h		;ab61
	ld a,(ix+003h)		;ab65   ; lee la Y del actor
	ld (ix+07ah),a		;ab68
	ld a,(ix+002h)		;ab6b   ; lee la Y del actor (fraccion)
	ld (ix+079h),a		;ab6e
	ld a,(ix+005h)		;ab71   ; lee la X del actor
	ld (ix+07ch),a		;ab74
	ld a,(ix+004h)		;ab77   ; lee la X del actor (fraccion)
	ld (ix+07bh),a		;ab7a
	ret			;ab7d
cambia_posiciones:		; intercambia la posicion (ix+2-5) con la guardada en (ix+0x79-0x7C)
	ld a,(ix+07ah)		;ab7e
	ld b,(ix+003h)		;ab81   ; lee la Y del actor
	ld (ix+003h),a		;ab84   ; guarda la Y del actor
	ld (ix+07ah),b		;ab87
	ld a,(ix+079h)		;ab8a
	ld b,(ix+002h)		;ab8d   ; lee la Y del actor (fraccion)
	ld (ix+002h),a		;ab90   ; guarda la Y del actor (fraccion)
	ld (ix+079h),b		;ab93
	ld a,(ix+07ch)		;ab96
	ld b,(ix+005h)		;ab99   ; lee la X del actor
	ld (ix+005h),a		;ab9c   ; guarda la X del actor
	ld (ix+07ch),b		;ab9f
	ld a,(ix+07bh)		;aba2
	ld b,(ix+004h)		;aba5   ; lee la X del actor (fraccion)
	ld (ix+004h),a		;aba8   ; guarda la X del actor (fraccion)
	ld (ix+07bh),b		;abab
	ret			;abae
L_ABAF:
	call mira_dano		;abaf   ; mira_dano: si la vida bajo, (ix+0x19) = 0x10 (parpadeo)
	call dispara_2c		;abb2   ; dispara_2c: (ix+0x78) - 1; a cero, 0x50 y crea el actor 0x2C
	call cambia_posiciones		;abb5   ; cambia_posiciones: intercambia la posicion (ix+2-5) con la guardada en (ix+0x79-0x7C)
	call jefe_paso		;abb8   ; jefe_paso: p03:ABF5, p03:AC72 y el movimiento de (ix+0x7D)
	call 08367h		;abbb   ; mueve_actor: si (ix+6): Y += velocidad Y y X += velocidad X (16 bits)
	call cambia_posiciones		;abbe   ; cambia_posiciones: intercambia la posicion (ix+2-5) con la guardada en (ix+0x79-0x7C)
	dec (ix+011h)		;abc1   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	jp nz,L_AAD0		;abc4
	ld (ix+011h),009h		;abc7   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x09
	ld h,(ix+00dh)		;abcb   ; lee la aceleracion Y del actor (alta)
	ld l,(ix+00ch)		;abce   ; lee la aceleracion Y del actor
	call 08b31h		;abd1   ; niega_hl: HL = -HL
	jp 08b9bh		;abd4   ; pon_aceleracion_y: (ix+0x0C, 0x0D) = HL
jefe_paso:		; p03:ABF5, p03:AC72 y el movimiento de (ix+0x7D)
	call fotograma_45_46		;abd7   ; fotograma_45_46: el fotograma 0x45 / 0x46 cada 8 cuadros
	call mira_direccion		;abda   ; mira_direccion: la casilla de la direccion siguiente
	ld a,(ix+07dh)		;abdd
	or a			;abe0
	jr z,$+61		;abe1
	call mira_lado		;abe3   ; mira_lado: 7 casillas de p03:ACB9[(ix+0x7F)]
	ld a,(ix+07dh)		;abe6
	or a			;abe9
	jr nz,$+32		;abea
	ret			;abec

; ----------------------------------------------------------------------
; DATOS resto_ABED: tablas cortas que apuntan p03:AC4C (0xABED); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:AC4C (8
;   bytes)
;   0xabed..0xabf5  (8 bytes)
DATA_resto_ABED:
	defb 000h,0ffh,001h,000h,000h,001h,0ffh,000h	; abed  ........

; ======================================================================
; CODIGO 0xabf5..0xac62  (109 bytes)
; ======================================================================


fotograma_45_46:		; el fotograma 0x45 / 0x46 cada 8 cuadros
	ld a,(0c00dh)		;abf5   ; lee la cuenta de cuadros del juego
	and 007h		;abf8
	ret z			;abfa
	ld a,(0c00dh)		;abfb   ; lee la cuenta de cuadros del juego
	and 008h		;abfe
	ld a,045h		;ac00
	jr z,L_AC06		;ac02
	ld a,046h		;ac04
L_AC06:
	ld (ix+010h),a		;ac06   ; guarda el fotograma del actor (p02:8A42)
	ret			;ac09
L_AC0A:
	ld a,(ix+07eh)		;ac0a
	push af			;ac0d
	neg		;ac0e
	ld (ix+07eh),a		;ac10
	call paso_por_direccion		;ac13   ; paso_por_direccion: la posicion + p03:ABED[(ix+0x7F)]
	call direccion_siguiente		;ac16   ; direccion_siguiente: (ix+0x7F) = ((ix+0x7F) + (ix+0x7E)) & 3
	pop af			;ac19
	ld (ix+07eh),a		;ac1a
	ret			;ac1d
L_AC1E:
	call direccion_siguiente		;ac1e   ; direccion_siguiente: (ix+0x7F) = ((ix+0x7F) + (ix+0x7E)) & 3
	call paso_por_direccion		;ac21   ; paso_por_direccion: la posicion + p03:ABED[(ix+0x7F)]
	ret			;ac24
direccion_siguiente:		; (ix+0x7F) = ((ix+0x7F) + (ix+0x7E)) & 3
	ld a,(ix+07fh)		;ac25
	add a,(ix+07eh)		;ac28
	and 003h		;ac2b
velocidad_por_direccion:		; (ix+0x7F) = A y las velocidades de p03:AC62[A]
	ld (ix+07fh),a		;ac2d
	add a,a			;ac30
	add a,a			;ac31
	ld hl,0ac62h		;ac32
	call 04083h		;ac35   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;ac38
	inc hl			;ac39
	ld d,(hl)			;ac3a
	inc hl			;ac3b
	ex de,hl			;ac3c
	call 08b8dh		;ac3d   ; pon_velocidad_x: (ix+9, 0x0A) = HL
	ex de,hl			;ac40
	ld e,(hl)			;ac41
	inc hl			;ac42
	ld d,(hl)			;ac43
	ex de,hl			;ac44
	jp 08b82h		;ac45   ; pon_velocidad_y: (ix+7, 8) = HL
paso_por_direccion:		; la posicion + p03:ABED[(ix+0x7F)]
	ld a,(ix+07fh)		;ac48
	add a,a			;ac4b
	ld hl,0abedh		;ac4c
	call 04083h		;ac4f   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;ac52
	add a,(ix+005h)		;ac53   ; le suma la X del actor
	ld (ix+005h),a		;ac56   ; guarda la X del actor
	inc hl			;ac59
	ld a,(hl)			;ac5a
	add a,(ix+003h)		;ac5b   ; le suma la Y del actor
	ld (ix+003h),a		;ac5e   ; guarda la Y del actor
	ret			;ac61

; ----------------------------------------------------------------------
; DATOS resto_AC62: tablas cortas que apuntan p03:AC32 (0xAC62); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:AC32 (16
;   bytes)
;   0xac62..0xac72  (16 bytes)
DATA_resto_AC62:
	defb 000h,000h,000h,0ffh,000h,001h,000h,000h,000h,000h,000h,001h,000h,0ffh,000h,000h	; ac62  ................

; ======================================================================
; CODIGO 0xac72..0xacb9  (71 bytes)
; ======================================================================


mira_direccion:		; la casilla de la direccion siguiente
	ld a,(ix+07fh)		;ac72
	add a,(ix+07eh)		;ac75
	and 003h		;ac78
	jr L_AC7F		;ac7a
mira_lado:		; 7 casillas de p03:ACB9[(ix+0x7F)]
	ld a,(ix+07fh)		;ac7c
L_AC7F:
	add a,a			;ac7f   ; (ix+0x7F) * 4: el registro de p03:ACB9 ([dx][dy] y el paso)
	add a,a			;ac80
	ld hl,0acb9h		;ac81   ; el registro de la direccion en p03:ACB9
	call 04083h		;ac84   ; hl_mas_a: HL = HL + A
	ld d,(hl)			;ac87
	inc hl			;ac88
	ld e,(hl)			;ac89
	inc hl			;ac8a
	ld a,(hl)			;ac8b
	inc hl			;ac8c
	ld l,(hl)			;ac8d
	ld h,a			;ac8e
	ld b,007h		;ac8f   ; 7 casillas en esa linea
	ld (ix+07dh),000h		;ac91   ; (ix+0x7D) a cero: ninguna casilla todavia
L_AC95:
	push bc			;ac95   ; cada una: hay suelo (p02:8BB7, bit 3 de (ix+0x16))?
	push de			;ac96
	push hl			;ac97
	ld a,080h		;ac98
	call 08bb7h		;ac9a   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	ld a,(ix+016h)		;ac9d
	and 008h		;aca0
	pop hl			;aca2
	pop de			;aca3
	ld a,001h		;aca4
	jr nz,L_ACA9		;aca6
	xor a			;aca8
L_ACA9:
	or (ix+07dh)		;aca9   ; lo junta en (ix+0x7D) y pasa a la siguiente
	ld (ix+07dh),a		;acac
	ld a,d			;acaf   ; el siguiente paso de la linea: + dx y + dy
	add a,h			;acb0
	ld d,a			;acb1
	ld a,e			;acb2
	add a,l			;acb3
	ld e,a			;acb4
	pop bc			;acb5
	djnz L_AC95		;acb6
	ret			;acb8

; ----------------------------------------------------------------------
; DATOS resto_ACB9: tablas cortas que apuntan p03:AC81 (0xACB9); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:AC81 (16
;   bytes)
;   0xacb9..0xacc9  (16 bytes)
DATA_resto_ACB9:
	defb 0f4h,0e3h,004h,000h,00dh,0e4h,000h,004h,00ch,0fdh,0fch,000h,0f3h,0fch,000h,0fch	; acb9  ................

; ======================================================================
; CODIGO 0xacc9..0xb051  (904 bytes)
; ======================================================================


dispara_2c:		; (ix+0x78) - 1; a cero, 0x50 y crea el actor 0x2C
	ld a,(ix+078h)		;acc9
	cp 040h		;accc
	call nc,fotograma_45		;acce   ; fotograma_45: (ix+0x10) = 0x45
	dec (ix+078h)		;acd1
	ret nz			;acd4
	ld (ix+078h),050h		;acd5
	ld c,02ch		;acd9
	call 08c22h		;acdb   ; crea_actor_aqui: crea el actor C en la posicion del actor IX
	ret			;acde
fotograma_45:		; (ix+0x10) = 0x45
	ld (ix+010h),045h		;acdf   ; el fotograma del actor (p02:8A42) = 0x45
	ret			;ace3
L_ACE4:
	ld a,00fh		;ace4
	call 056e3h		;ace6   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld (ix+010h),088h		;ace9   ; el fotograma del actor (p02:8A42) = 0x88
L_ACED:
	ld (ix+011h),008h		;aced   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	ld a,(0c240h)		;acf1   ; lee el personaje que se lleva (0 o 1)
	or a			;acf4
	ld a,020h		;acf5
	jr z,L_ACFB		;acf7
	ld a,010h		;acf9
L_ACFB:
	call 084e0h		;acfb   ; apunta_al_personaje: con 15: la direccion del actor hacia el personaje (p02:84F1)
	call 08b82h		;acfe   ; pon_velocidad_y: (ix+7, 8) = HL
	ex de,hl			;ad01
	call 08b8dh		;ad02   ; pon_velocidad_x: (ix+9, 0x0A) = HL
	ld (ix+00bh),001h		;ad05   ; si el actor acelera (p02:8393) = 0x01
	call 08b94h		;ad09   ; pon_aceleracion_x: (ix+0x0E, 0x0F) = HL
	ex de,hl			;ad0c
	jp 08b9bh		;ad0d   ; pon_aceleracion_y: (ix+0x0C, 0x0D) = HL
L_AD10:
	ld a,(ix+00ah)		;ad10   ; lee la velocidad X del actor (alta)
	cp 080h		;ad13
	jr c,L_AD19		;ad15
	neg		;ad17
L_AD19:
	cp 006h		;ad19
	jr c,L_AD21		;ad1b
	ld (ix+00bh),000h		;ad1d   ; si el actor acelera (p02:8393) = 0x00
L_AD21:
	dec (ix+011h)		;ad21   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;ad24
	jp L_ACED		;ad25
vida_por_ruina:		; la vida del actor + ruina * 16, y (ix+0x1A) igual
	ld a,(0c21dh)		;ad28   ; lee la ruina (0-4)
	add a,a			;ad2b
	add a,a			;ad2c
	add a,a			;ad2d
	add a,a			;ad2e
	add a,(ix+012h)		;ad2f   ; le suma la vida del actor (p01:721A)
	ld (ix+012h),a		;ad32   ; guarda la vida del actor (p01:721A)
	ld (ix+01ah),a		;ad35
	ld (ix+019h),000h		;ad38
	ret			;ad3c
mira_dano:		; si la vida bajo, (ix+0x19) = 0x10 (parpadeo)
	ld a,(ix+019h)		;ad3d
	or a			;ad40
	call nz,parpadeo_de_dano		;ad41   ; parpadeo_de_dano: (ix+0x19) - 1 y los colores de pieza de dano
	ld a,(ix+012h)		;ad44   ; lee la vida del actor (p01:721A)
	cp (ix+01ah)		;ad47
	ret z			;ad4a
	ld (ix+01ah),a		;ad4b
	ld (ix+019h),010h		;ad4e
	ret			;ad52
parpadeo_de_dano:		; (ix+0x19) - 1 y los colores de pieza de dano
	dec (ix+019h)		;ad53
	ld de,00748h		;ad56
	jr z,L_AD5E		;ad59
	ld de,00d4eh		;ad5b
L_AD5E:
	ld hl,00748h		;ad5e
	jp L_A54E		;ad61
L_AD64:
	call vida_por_ruina		;ad64   ; vida_por_ruina: la vida del actor + ruina * 16, y (ix+0x1A) igual
	ld (ix+010h),047h		;ad67   ; el fotograma del actor (p02:8A42) = 0x47
	ld (ix+011h),010h		;ad6b   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld (ix+01fh),040h		;ad6f
	ret			;ad73
L_AD74:
	call mira_dano		;ad74   ; mira_dano: si la vida bajo, (ix+0x19) = 0x10 (parpadeo)
	ld b,(ix+001h)		;ad77   ; lee el paso del actor
	djnz L_ADDD		;ad7a
	ld a,040h		;ad7c
	call crea_27_cada		;ad7e   ; crea_27_cada: (ix+0x1F) - 1; a cero, A y crea el actor 0x27
	call rebota_arriba		;ad81   ; rebota_arriba: si se sale por arriba: rebota con velocidad al azar y sonido 0x0A
	ld a,(ix+008h)		;ad84   ; lee la velocidad Y del actor (alta)
	cp 080h		;ad87
	jr nc,L_AD9C		;ad89
	ld e,(ix+008h)		;ad8b   ; lee la velocidad Y del actor (alta)
	ld d,000h		;ad8e
	ld a,080h		;ad90
	call 08bb7h		;ad92   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	ld a,(ix+016h)		;ad95
	and 008h		;ad98
	jr nz,L_ADB2		;ad9a
L_AD9C:
	ld d,008h		;ad9c
	ld e,(ix+008h)		;ad9e   ; lee la velocidad Y del actor (alta)
	call 09ccch		;ada1   ; choque_por_sentido: la casilla a D (o -D, segun la velocidad X) y E del actor (p02:8BB7)
	jp nz,08b03h		;ada4   ; sonido_0a: el sonido 0x0A (p02:8B0D)
	ld d,008h		;ada7
	ld e,000h		;ada9
	call 09ccch		;adab   ; choque_por_sentido: la casilla a D (o -D, segun la velocidad X) y E del actor (p02:8BB7)
	jp nz,08b03h		;adae   ; sonido_0a: el sonido 0x0A (p02:8B0D)
	ret			;adb1
L_ADB2:
	call alinea_y		;adb2   ; alinea_y: la Y del actor al centro de su fila de 8 (+ 4)
	call 08ba9h		;adb5   ; para_actor: velocidades a cero
	ld a,(ix+005h)		;adb8   ; lee la X del actor
	and 0f0h		;adbb
	add a,008h		;adbd
	ld (ix+005h),a		;adbf   ; guarda la X del actor
	inc (ix+001h)		;adc2   ; sube el paso del actor
	ld (ix+011h),010h		;adc5   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld a,(ix+005h)		;adc9   ; lee la X del actor
	sub 008h		;adcc
	ld h,a			;adce
	ld l,(ix+003h)		;adcf   ; lee la Y del actor
	ld de,08068h		;add2
	ld bc,01010h		;add5
	ld a,004h		;add8
	jp 04bdeh		;adda   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
L_ADDD:
	djnz L_AE24		;addd
	call fotograma_47_48		;addf   ; fotograma_47_48: el fotograma 0x47 / 0x48 cada 8 cuadros
	ld a,(0c240h)		;ade2   ; lee el personaje que se lleva (0 o 1)
	and a			;ade5
	ld b,003h		;ade6
	jr z,L_ADEC		;ade8
	ld b,007h		;adea
L_ADEC:
	ld a,(0c00dh)		;adec   ; lee la cuenta de cuadros del juego
	and b			;adef
	ret nz			;adf0
	call crea_2d		;adf1   ; crea_2d: sonido 4 y crea el actor 0x2D
	dec (ix+011h)		;adf4   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;adf7
	ld a,(ix+005h)		;adf8   ; lee la X del actor
	sub 004h		;adfb
	ld d,a			;adfd
	ld a,(ix+003h)		;adfe   ; lee la Y del actor
	sub 00ch		;ae01
	ld e,a			;ae03
	call 0704ch		;ae04   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ld (hl),0d6h		;ae07
	inc hl			;ae09
	ld (hl),0d7h		;ae0a
	ld de,0001fh		;ae0c
	add hl,de			;ae0f
	ld (hl),0d8h		;ae10
	inc hl			;ae12
	ld (hl),0d9h		;ae13
	ld (ix+010h),047h		;ae15   ; el fotograma del actor (p02:8A42) = 0x47
	ld (ix+011h),010h		;ae19   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld (ix+001h),000h		;ae1d   ; el paso del actor = 0x00
	jp 08ba9h		;ae21   ; para_actor: velocidades a cero
L_AE24:
	dec (ix+011h)		;ae24   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret z			;ae27
	call velocidad_al_azar		;ae28   ; velocidad_al_azar: H = 1 o 2 al azar, negativo al azar
	ld a,h			;ae2b
	cp 080h		;ae2c
	jr nc,L_AE33		;ae2e
	neg		;ae30
	ld h,a			;ae32
L_AE33:
	call 08b80h		;ae33   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	call velocidad_al_azar		;ae36   ; velocidad_al_azar: H = 1 o 2 al azar, negativo al azar
	call 08b8bh		;ae39   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	inc (ix+001h)		;ae3c   ; sube el paso del actor
	ret			;ae3f
velocidad_al_azar:		; H = 1 o 2 al azar, negativo al azar
	call 08b4fh		;ae40   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	ld b,a			;ae43
	and 001h		;ae44
	inc a			;ae46
	ld h,a			;ae47
	ld a,b			;ae48
	and 002h		;ae49
	ret nz			;ae4b
	jp 08b31h		;ae4c   ; niega_hl: HL = -HL
fotograma_47_48:		; el fotograma 0x47 / 0x48 cada 8 cuadros
	ld a,(0c00dh)		;ae4f   ; lee la cuenta de cuadros del juego
	and 008h		;ae52
	ld a,047h		;ae54
	jr z,L_AE5A		;ae56
	ld a,048h		;ae58
L_AE5A:
	ld (ix+010h),a		;ae5a   ; guarda el fotograma del actor (p02:8A42)
	ret			;ae5d
crea_2d:		; sonido 4 y crea el actor 0x2D
	ld a,004h		;ae5e
	call 056e3h		;ae60   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld c,02dh		;ae63
	call 08c22h		;ae65   ; crea_actor_aqui: crea el actor C en la posicion del actor IX
	ld a,008h		;ae68
	sub (ix+011h)		;ae6a   ; le resta la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ld h,0c0h		;ae6d
	jr nc,L_AE75		;ae6f
	add a,008h		;ae71
	ld h,0b0h		;ae73
L_AE75:
	add a,030h		;ae75
	ld l,a			;ae77
	ld a,078h		;ae78
	sub (ix+011h)		;ae7a   ; le resta la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ld e,a			;ae7d
	ld d,080h		;ae7e
	ld bc,01001h		;ae80
	ld a,005h		;ae83
	push hl			;ae85
	call 04bdeh		;ae86   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop hl			;ae89
	ld a,(ix+005h)		;ae8a   ; lee la X del actor
	sub 008h		;ae8d
	ld d,a			;ae8f
	ld e,(ix+003h)		;ae90   ; lee la Y del actor
	ld a,e			;ae93
	sub 010h		;ae94
	add a,(ix+011h)		;ae96   ; le suma la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ld e,a			;ae99
	ld bc,01010h		;ae9a
	ld hl,08068h		;ae9d
	ld a,001h		;aea0
	call 04bdeh		;aea2   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	inc (ix+003h)		;aea5   ; sube la Y del actor
	ret			;aea8
rebota_arriba:		; si se sale por arriba: rebota con velocidad al azar y sonido 0x0A
	ld a,(ix+003h)		;aea9   ; lee la Y del actor
	add a,(ix+008h)		;aeac   ; le suma la velocidad Y del actor (alta)
	add a,02ch		;aeaf
	cp 054h		;aeb1
	ret nc			;aeb3
	call 08affh		;aeb4   ; sonido_08: el sonido 8 (p02:8B0D)
	call velocidad_al_azar		;aeb7   ; velocidad_al_azar: H = 1 o 2 al azar, negativo al azar
	ld a,(ix+00ah)		;aeba   ; lee la velocidad X del actor (alta)
	xor h			;aebd
	and 080h		;aebe
	push af			;aec0
	call 08b8bh		;aec1   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	pop af			;aec4
	ret z			;aec5
	jp 08b03h		;aec6   ; sonido_0a: el sonido 0x0A (p02:8B0D)
crea_27_cada:		; (ix+0x1F) - 1; a cero, A y crea el actor 0x27
	dec (ix+01fh)		;aec9
	ret nz			;aecc
	ld (ix+01fh),a		;aecd
	ld c,027h		;aed0
	jp 08c22h		;aed2   ; crea_actor_aqui: crea el actor C en la posicion del actor IX
L_AED5:
	call vida_por_ruina		;aed5   ; vida_por_ruina: la vida del actor + ruina * 16, y (ix+0x1A) igual
L_AED8:
	ld (ix+010h),049h		;aed8   ; el fotograma del actor (p02:8A42) = 0x49
	ld (ix+001h),000h		;aedc   ; el paso del actor = 0x00
	ld (ix+01bh),008h		;aee0
	ld h,0fdh		;aee4
	jp 08b80h		;aee6   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
L_AEE9:
	call mira_dano		;aee9   ; mira_dano: si la vida bajo, (ix+0x19) = 0x10 (parpadeo)
	ld b,(ix+001h)		;aeec   ; lee el paso del actor
	djnz L_AF12		;aeef
	ld de,007fbh		;aef1
	call 09ce7h		;aef4   ; choque_debajo: la casilla de debajo del actor (p02:9D09) y p03:A683
	ret z			;aef7
	ld a,020h		;aef8
	call 056e3h		;aefa   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	dec (ix+003h)		;aefd   ; baja la Y del actor
	dec (ix+003h)		;af00   ; baja la Y del actor
	ld hl,0fe00h		;af03
	call 08b82h		;af06   ; pon_velocidad_y: (ix+7, 8) = HL
	ld hl,00020h		;af09
	call 08b9bh		;af0c   ; pon_aceleracion_y: (ix+0x0C, 0x0D) = HL
	jp L_AFC2		;af0f
L_AF12:
	djnz L_AF38		;af12
	ld de,007fbh		;af14
	call 09ce7h		;af17   ; choque_debajo: la casilla de debajo del actor (p02:9D09) y p03:A683
	ret z			;af1a
	ld a,020h		;af1b
	call 056e3h		;af1d   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	dec (ix+003h)		;af20   ; baja la Y del actor
	dec (ix+003h)		;af23   ; baja la Y del actor
	ld (ix+011h),080h		;af26   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x80
	ld (ix+01eh),008h		;af2a
	xor a			;af2e
	ld (ix+006h),a		;af2f   ; guarda si el actor se mueve (p02:8367)
	ld (ix+00bh),a		;af32   ; guarda si el actor acelera (p02:8393)
	jp L_AFC2		;af35
L_AF38:
	djnz L_AF68		;af38
	dec (ix+011h)		;af3a   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	jp z,L_AED8		;af3d
	ld b,04ch		;af40
	ld c,004h		;af42
	call 08b70h		;af44   ; alterna_b: (ix+0x18) + 1; con (ix+0x18) & C, B + 1
	dec (ix+01eh)		;af47
	ret nz			;af4a
	ld a,006h		;af4b
	call 056e3h		;af4d   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld (ix+01eh),008h		;af50
	ld d,(ix+005h)		;af54   ; lee la X del actor
	ld e,(ix+003h)		;af57   ; lee la Y del actor
	ld a,e			;af5a
	sub 00ch		;af5b
	ld e,a			;af5d
	push ix		;af5e
	ld c,02eh		;af60
	call 08613h		;af62   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;af65
	ret			;af67
L_AF68:
	ld d,00ch		;af68
	call 09ccah		;af6a   ; choque_fc: p02:9CCC con E = 0xFC
	call nz,08b03h		;af6d   ; sonido_0a: el sonido 0x0A (p02:8B0D)
	ld a,(ix+003h)		;af70   ; lee la Y del actor
	cp 034h		;af73
	jr c,L_AFA9		;af75
	ld b,049h		;af77
	ld c,004h		;af79
	call 08b70h		;af7b   ; alterna_b: (ix+0x18) + 1; con (ix+0x18) & C, B + 1
	ld (ix+006h),000h		;af7e   ; si el actor se mueve (p02:8367) = 0x00
	bit 1,(ix+018h)		;af82
	jr nz,L_AF8C		;af86
	ld (ix+006h),001h		;af88   ; si el actor se mueve (p02:8367) = 0x01
L_AF8C:
	dec (ix+01bh)		;af8c
	ret nz			;af8f
	ld (ix+01bh),008h		;af90
	call 08b4fh		;af94   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	bit 2,a		;af97
	jp z,08b89h		;af99   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	call 08b48h		;af9c   ; compara_x: compara la X del personaje con la del actor
	ld (ix+00ah),001h		;af9f   ; la velocidad X del actor (alta) = 0x01
	ret nc			;afa3
	ld (ix+00ah),0ffh		;afa4   ; la velocidad X del actor (alta) = 0xFF
	ret			;afa8
L_AFA9:
	call 08affh		;afa9   ; sonido_08: el sonido 8 (p02:8B0D)
	ld (ix+00bh),001h		;afac   ; si el actor acelera (p02:8393) = 0x01
	ld hl,00040h		;afb0
	call 08b9bh		;afb3   ; pon_aceleracion_y: (ix+0x0C, 0x0D) = HL
	call 08b89h		;afb6   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	ld (ix+010h),04bh		;afb9   ; el fotograma del actor (p02:8A42) = 0x4B
	ld a,010h		;afbd
	call 056e3h		;afbf   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_AFC2:
	inc (ix+001h)		;afc2   ; sube el paso del actor
	ret			;afc5
L_AFC6:
	ld (ix+010h),088h		;afc6   ; el fotograma del actor (p02:8A42) = 0x88
	ld (ix+00bh),001h		;afca   ; si el actor acelera (p02:8393) = 0x01
	call 08b27h		;afce   ; distancia_x: A = |X del personaje - X del actor|
	cp 040h		;afd1
	ld d,003h		;afd3
	jr c,L_AFD9		;afd5
	ld d,007h		;afd7
L_AFD9:
	call 08b1dh		;afd9   ; la distancia (p02:8B1D): menos de 0x10, -4; menos de 0x50, -7; si no, -0x0B
	cp 010h		;afdc
	ld e,0fch		;afde
	jr c,L_AFEA		;afe0
	cp 050h		;afe2
	ld e,0f9h		;afe4
	jr c,L_AFEA		;afe6
	ld e,0f5h		;afe8
L_AFEA:
	jp L_B005		;afea
L_AFED:
	ld a,(ix+000h)		;afed   ; lee el tipo del actor
	cp 02dh		;aff0
	ret z			;aff2
	ld a,(ix+008h)		;aff3   ; lee la velocidad Y del actor (alta)
	bit 7,a		;aff6
	ret nz			;aff8
	ld a,080h		;aff9
	ld de,000feh		;affb
	call 08bb7h		;affe   ; mira_alrededor: las casillas alrededor del actor segun las direcciones de A (p01:704C)
	jp nz,083d6h		;b001   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	ret			;b004
L_B005:
	call 08b4fh		;b005   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	and d			;b008
	or 001h		;b009
	ld h,a			;b00b
	call 08b8bh		;b00c   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	ld h,e			;b00f
	ld l,000h		;b010
	call 08b82h		;b012   ; pon_velocidad_y: (ix+7, 8) = HL
	call 08b4fh		;b015   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	bit 1,a		;b018
	jr z,L_B01F		;b01a
	call 08b03h		;b01c   ; sonido_0a: el sonido 0x0A (p02:8B0D)
L_B01F:
	ld hl,00080h		;b01f
	jp 08b9bh		;b022   ; pon_aceleracion_y: (ix+0x0C, 0x0D) = HL
L_B025:
	call vida_por_ruina		;b025   ; vida_por_ruina: la vida del actor + ruina * 16, y (ix+0x1A) igual
	ld a,(ix+003h)		;b028   ; lee la Y del actor
	add a,020h		;b02b
	ld (ix+003h),a		;b02d   ; guarda la Y del actor
	ld (ix+01fh),040h		;b030
	ld (ix+010h),04eh		;b034   ; el fotograma del actor (p02:8A42) = 0x4E
colores_a_cero:		; (ix+0x19) = 0 y colores de pieza 0
	ld (ix+019h),000h		;b038
	ld de,00000h		;b03c
tres_colores:		; 3 colores de pieza DE (p03:A54E)
	ld h,d			;b03f
	ld l,e			;b040
	ld b,003h		;b041
	jp L_A54E		;b043
L_B046:
	call mira_dano		;b046   ; mira_dano: si la vida bajo, (ix+0x19) = 0x10 (parpadeo)
	ld a,(ix+001h)		;b049   ; lee el paso del actor
	and 07fh		;b04c
	call 0408dh		;b04e   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_B051: tabla de 5 palabras del despachador (call 0x408D en
;   0xB04E); lo leen L_408D (10 bytes)
;   0xb051..0xb05b  (10 bytes)
DATA_saltos_B051:
	defb 05bh,0b0h	; b051
	defb 06bh,0b0h	; b053
	defb 0c0h,0b0h	; b055
	defb 0d6h,0b0h	; b057
	defb 03eh,0b1h	; b059

; ======================================================================
; CODIGO 0xb05b..0xb16a  (271 bytes)
; ======================================================================


L_B05B:
	inc (ix+001h)		;b05b   ; sube el paso del actor
	ld (ix+013h),000h		;b05e   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ld (ix+011h),020h		;b062   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	ld c,02fh		;b066
	jp 08c22h		;b068   ; crea_actor_aqui: crea el actor C en la posicion del actor IX
L_B06B:
	ld (ix+001h),081h		;b06b   ; el paso del actor = 0x81
	call colores_dca0		;b06f   ; colores_dca0: colores 7 y 0x48 en 0xDCA0/0xDCC0 + 0x20 - (ix+0x11)
	dec (ix+003h)		;b072   ; baja la Y del actor
	dec (ix+011h)		;b075   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;b078
	ld de,00748h		;b079
	call tres_colores		;b07c   ; tres_colores: 3 colores de pieza DE (p03:A54E)
	ld (ix+011h),020h		;b07f   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	ld (ix+001h),002h		;b083   ; el paso del actor = 0x02
	ld (ix+013h),003h		;b087   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x03
	call 08b48h		;b08b   ; compara_x: compara la X del personaje con la del actor
	ld (ix+010h),04fh		;b08e   ; el fotograma del actor (p02:8A42) = 0x4F
	ret c			;b092
	ld (ix+010h),050h		;b093   ; el fotograma del actor (p02:8A42) = 0x50
	ret			;b097
colores_dca0:		; colores 7 y 0x48 en 0xDCA0/0xDCC0 + 0x20 - (ix+0x11)
	ld a,020h		;b098
	sub (ix+011h)		;b09a   ; le resta la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	cp 010h		;b09d
	jr nc,L_B0B9		;b09f
	push af			;b0a1
	ld hl,0dca0h		;b0a2
	call dos_colores_de_sprite		;b0a5   ; dos_colores_de_sprite: (HL + A) = 7 y (HL + A + 0x10) = 0x48
	pop af			;b0a8
	ld hl,0dcc0h		;b0a9
dos_colores_de_sprite:		; (HL + A) = 7 y (HL + A + 0x10) = 0x48
	call 04083h		;b0ac   ; hl_mas_a: HL = HL + A
	ld (hl),007h		;b0af
	ld a,010h		;b0b1
	call 04083h		;b0b3   ; hl_mas_a: HL = HL + A
	ld (hl),048h		;b0b6
	ret			;b0b8
L_B0B9:
	sub 010h		;b0b9
	ld hl,0dce0h		;b0bb
	jr dos_colores_de_sprite		;b0be
L_B0C0:
	ld a,040h		;b0c0
	call crea_27_cada		;b0c2   ; crea_27_cada: (ix+0x1F) - 1; a cero, A y crea el actor 0x27
	dec (ix+011h)		;b0c5   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;b0c8
	ld (ix+013h),000h		;b0c9   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ld (ix+001h),003h		;b0cd   ; el paso del actor = 0x03
	ld (ix+011h),020h		;b0d1   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	ret			;b0d5
L_B0D6:
	call colores_a_cero		;b0d6   ; colores_a_cero: (ix+0x19) = 0 y colores de pieza 0
	dec (ix+011h)		;b0d9   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;b0dc
	ld (ix+001h),084h		;b0dd   ; el paso del actor = 0x84
	ld (ix+011h),040h		;b0e1   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x40
	call 08b4fh		;b0e5   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	and 0f8h		;b0e8
	cp 020h		;b0ea
	jr nc,L_B0F0		;b0ec
	ld a,020h		;b0ee
L_B0F0:
	cp 0e0h		;b0f0
	jr c,L_B0F6		;b0f2
	ld a,0e0h		;b0f4
L_B0F6:
	ld d,a			;b0f6
	call columna_al_azar		;b0f7   ; columna_al_azar: una X al azar entre 0x48 y 0xA8 y 8 actores en ella
	ret nc			;b0fa
	ld a,e			;b0fb
	sub 004h		;b0fc
	ld (ix+005h),d		;b0fe   ; guarda la X del actor
	ld (ix+003h),a		;b101   ; guarda la Y del actor
	ret			;b104
columna_al_azar:		; una X al azar entre 0x48 y 0xA8 y 8 actores en ella
	call 08b4fh		;b105   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	and 0f0h		;b108
	add a,008h		;b10a
	cp 048h		;b10c
	jr nc,L_B112		;b10e
	ld a,048h		;b110
L_B112:
	cp 0a8h		;b112
	jr c,L_B118		;b114
	ld a,048h		;b116
L_B118:
	ld e,a			;b118
	ld b,008h		;b119
L_B11B:
	push bc			;b11b
	push de			;b11c
	ld a,d			;b11d
	add a,004h		;b11e
	ld d,a			;b120
	call 0704ch		;b121   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop de			;b124
	jr nc,L_B130		;b125
	push de			;b127
	ld a,d			;b128
	sub 004h		;b129
	ld d,a			;b12b
	call 0704ch		;b12c   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop de			;b12f
L_B130:
	pop bc			;b130   ; baja de 0x10 en 0x10 hasta 0xC8
	ret c			;b131
	ld a,e			;b132
	cp 0c8h		;b133
	jr nc,L_B13C		;b135
	add a,010h		;b137
	ld e,a			;b139
	djnz L_B11B		;b13a
L_B13C:
	or a			;b13c
	ret			;b13d
L_B13E:
	dec (ix+011h)		;b13e   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;b141
	ld (ix+010h),04eh		;b142   ; el fotograma del actor (p02:8A42) = 0x4E
	ld (ix+001h),000h		;b146   ; el paso del actor = 0x00
	ld a,(ix+003h)		;b14a   ; lee la Y del actor
	add a,020h		;b14d
	ld (ix+003h),a		;b14f   ; guarda la Y del actor
	ret			;b152
L_B153:
	ld a,(ix+003h)		;b153   ; lee la Y del actor
	sub 020h		;b156
	ld (ix+003h),a		;b158   ; guarda la Y del actor
	ld (ix+010h),080h		;b15b   ; el fotograma del actor (p02:8A42) = 0x80
	ld (ix+013h),002h		;b15f   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x02
	ret			;b163
L_B164:
	ld a,(ix+001h)		;b164   ; lee el paso del actor
	call 0408dh		;b167   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_B16A: tabla de 3 palabras del despachador (call 0x408D en
;   0xB167); lo leen L_408D (6 bytes)
;   0xb16a..0xb170  (6 bytes)
DATA_saltos_B16A:
	defb 070h,0b1h	; b16a
	defb 098h,0b1h	; b16c
	defb 034h,0b2h	; b16e

; ======================================================================
; CODIGO 0xb170..0xb249  (217 bytes)
; ======================================================================


L_B170:
	ld a,(0c403h)		;b170
	sub 020h		;b173
	ld (ix+003h),a		;b175   ; guarda la Y del actor
	ld a,(0c401h)		;b178
	cp 002h		;b17b
	ret nz			;b17d
	ld (ix+013h),003h		;b17e   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x03
	ld a,(ix+003h)		;b182   ; lee la Y del actor
	add a,034h		;b185
	ld (ix+01fh),a		;b187
	inc (ix+001h)		;b18a   ; sube el paso del actor
	ld h,004h		;b18d
	call 08b80h		;b18f   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	ld hl,00080h		;b192
	jp 08b9bh		;b195   ; pon_aceleracion_y: (ix+0x0C, 0x0D) = HL
L_B198:
	call frena_caida		;b198   ; frena_caida: si la velocidad Y esta entre 6 y 0x50: 0x600 y sin aceleracion
	ld a,(0c244h)		;b19b   ; lee la Y del personaje
	sub 010h		;b19e
	cp (ix+003h)		;b1a0   ; compara con la Y del actor
	jr c,L_B1AC		;b1a3
	ld a,(ix+01fh)		;b1a5
	cp (ix+003h)		;b1a8   ; compara con la Y del actor
	ret nc			;b1ab
L_B1AC:
	ld a,(ix+008h)		;b1ac   ; lee la velocidad Y del actor (alta)
	sub 004h		;b1af
	ld e,a			;b1b1
	call 09d07h		;b1b2   ; choque_7: p02:9D09 con D = 7
	ret nz			;b1b5
	ld a,(ix+008h)		;b1b6   ; lee la velocidad Y del actor (alta)
	sub 00ch		;b1b9
	ld e,a			;b1bb
	call 09d07h		;b1bc   ; choque_7: p02:9D09 con D = 7
	ret nz			;b1bf
	ld e,(ix+008h)		;b1c0   ; lee la velocidad Y del actor (alta)
	call 09d07h		;b1c3   ; choque_7: p02:9D09 con D = 7
	ret z			;b1c6
	ld a,(0c246h)		;b1c7   ; lee la X del personaje
	sub (ix+005h)		;b1ca   ; le resta la X del actor
	add a,012h		;b1cd
	cp 024h		;b1cf
	ret c			;b1d1
	call alinea_y		;b1d2   ; alinea_y: la Y del actor al centro de su fila de 8 (+ 4)
	ld a,01fh		;b1d5
	call 056e3h		;b1d7   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld (ix+00bh),000h		;b1da   ; si el actor acelera (p02:8393) = 0x00
	call 08b7eh		;b1de   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	inc (ix+001h)		;b1e1   ; sube el paso del actor
	ld (ix+011h),010h		;b1e4   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld (ix+013h),000h		;b1e8   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ld a,(ix+005h)		;b1ec   ; lee la X del actor
	sub 00ch		;b1ef
	ld d,a			;b1f1
	ld a,(ix+003h)		;b1f2   ; lee la Y del actor
	sub 01ch		;b1f5
	ld e,a			;b1f7
	call 0704ch		;b1f8   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	exx			;b1fb
	ld a,(ix+005h)		;b1fc   ; lee la X del actor
	sub 010h		;b1ff
	ld d,a			;b201
	ld a,(ix+003h)		;b202   ; lee la Y del actor
	sub 020h		;b205
	ld e,a			;b207
	exx			;b208
	ld de,0b249h		;b209
	ld c,004h		;b20c
L_B20E:
	ld b,004h		;b20e
	push hl			;b210
L_B211:
	ld a,(de)			;b211   ; C filas de B fichas de (DE) al mapa (HL) y a la pantalla (p00:4DB4)
	inc de			;b212
	ld (hl),a			;b213
	inc hl			;b214
	exx			;b215
	call 04db4h		;b216   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	ld a,d			;b219
	add a,008h		;b21a
	ld d,a			;b21c
	exx			;b21d
	djnz L_B211		;b21e
	pop hl			;b220   ; la siguiente fila: 32 casillas mas alla y 8 lineas mas abajo
	ld a,020h		;b221
	call 04083h		;b223   ; hl_mas_a: HL = HL + A
	exx			;b226
	ld a,e			;b227
	add a,008h		;b228
	ld e,a			;b22a
	ld a,d			;b22b
	sub 020h		;b22c
	ld d,a			;b22e
	exx			;b22f
	dec c			;b230
	jr nz,L_B20E		;b231
	ret			;b233
L_B234:
	ld a,(0c00dh)		;b234   ; lee la cuenta de cuadros del juego
	and 002h		;b237
	ld d,000h		;b239
	jr z,L_B23F		;b23b
	ld d,004h		;b23d
L_B23F:
	call 055aah		;b23f   ; ajuste_de_pantalla: R#18 (ajuste de la imagen) = D
	dec (ix+011h)		;b242   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;b245
	jp 083d6h		;b246   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites

; ----------------------------------------------------------------------
; DATOS resto_B249: tablas cortas que apuntan p03:B209 (0xB249); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:B209 (16
;   bytes)
;   0xb249..0xb259  (16 bytes)
DATA_resto_B249:
	defb 00ch,00dh,00ch,00dh,00eh,00fh,00eh,00fh,00ch,00dh,00ch,00dh,00eh,00fh,00eh,00fh	; b249  ................

; ======================================================================
; CODIGO 0xb259..0xb290  (55 bytes)
; ======================================================================


mira_el_globo:		; sin globo (0xC272) y sin morir: lo que sigue de los objetos de animo
	ld a,(0c272h)		;b259   ; lee la cuenta del globo de animo
	or a			;b25c
	ret nz			;b25d
	ld a,(0c24bh)		;b25e   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;b261
	ret z			;b263
	ld a,(0c26fh)		;b264   ; lee el golpe de Cles en marcha
	or a			;b267
	ret nz			;b268
	ld a,(0c257h)		;b269   ; lee hay disparos en marcha
	or a			;b26c
	ret nz			;b26d
	ld a,(0c271h)		;b26e
	or a			;b271
	ret nz			;b272
	xor a			;b273
	ld (0c2a4h),a		;b274
	ld a,(0c250h)		;b277   ; lee el sentido del personaje
	ld (0c2a6h),a		;b27a
	ld a,(ix+006h)		;b27d   ; lee si el actor se mueve (p02:8367)
	inc a			;b280
	ld (0c2a7h),a		;b281
	ld a,028h		;b284
	ld (0c2a2h),a		;b286
	ld a,(0c2a7h)		;b289
	dec a			;b28c
	call 0408dh		;b28d   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_B290: tabla de 4 palabras del despachador (call 0x408D en
;   0xB28D); lo leen L_408D (8 bytes)
;   0xb290..0xb298  (8 bytes)
DATA_saltos_B290:
	defb 098h,0b2h	; b290
	defb 0a5h,0b2h	; b292
	defb 0a6h,0b2h	; b294
	defb 0c9h,0b2h	; b296

; ======================================================================
; CODIGO 0xb298..0xb319  (129 bytes)
; ======================================================================


L_B298:
	ld de,0f000h		;b298
	ld b,028h		;b29b
	call posicion_c2a0		;b29d   ; posicion_c2a0: 0xC2A0/0xC2A1 = la posicion del personaje con D/E y B
	ld a,010h		;b2a0
	ld (0c2a5h),a		;b2a2
L_B2A5:
	ret			;b2a5
L_B2A6:
	ld a,(0c2a6h)		;b2a6   ; 0xC2A6 cambia: el globo sube o baja
	xor 001h		;b2a9
	ld (0c2a6h),a		;b2ab
	ld de,0f000h		;b2ae   ; 0x28 por encima del personaje
	ld b,028h		;b2b1
	call posicion_c2a0		;b2b3   ; posicion_c2a0: 0xC2A0/0xC2A1 = la posicion del personaje con D/E y B
	ld a,(0c2a6h)		;b2b6   ; el patron 0x28 o 0x2C
	or a			;b2b9
	ld a,028h		;b2ba
	jr z,L_B2C0		;b2bc
	ld a,02ch		;b2be
L_B2C0:
	ld (0c2a2h),a		;b2c0
	ld a,008h		;b2c3
	ld (0c2a5h),a		;b2c5
	ret			;b2c8
L_B2C9:
	ld de,0f8f8h		;b2c9
	ld b,030h		;b2cc
	call posicion_c2a0		;b2ce   ; posicion_c2a0: 0xC2A0/0xC2A1 = la posicion del personaje con D/E y B
	ld a,018h		;b2d1
	ld (0c2a5h),a		;b2d3
	ret			;b2d6
posicion_c2a0:		; 0xC2A0/0xC2A1 = la posicion del personaje con D/E y B
	ld a,(0c2a6h)		;b2d7
	or a			;b2da
	ld a,d			;b2db
	jr z,L_B2DF		;b2dc
	ld a,e			;b2de
L_B2DF:
	ld c,a			;b2df
	ld a,(0c246h)		;b2e0   ; lee la X del personaje
	add a,c			;b2e3
	ld (0c2a1h),a		;b2e4   ; guarda la X del globo
	ld a,(0c244h)		;b2e7   ; lee la Y del personaje
	sub b			;b2ea
	ld (0c2a0h),a		;b2eb   ; guarda la Y del globo
	ld a,(0c240h)		;b2ee   ; lee el personaje que se lleva (0 o 1)
	or a			;b2f1
	ret z			;b2f2
	ld a,(0c2a0h)		;b2f3   ; lee la Y del globo
	add a,003h		;b2f6
	ld (0c2a0h),a		;b2f8   ; guarda la Y del globo
	ret			;b2fb
cuenta_del_globo:		; esconde el sprite 8, cuenta 0xC272 (p03:B30A) y, sin disparos, sigue
	ld a,0e0h		;b2fc
	ld (0de20h),a		;b2fe   ; guarda la Y del sprite 8 en RAM
	call cuenta_c272		;b301   ; cuenta_c272: 0xC272 - 1; a cero, esconde los sprites de 0xDE20/24 y p00:5ABD
	ld a,(0c257h)		;b304   ; lee hay disparos en marcha
	or a			;b307
	jr nz,$+46		;b308
	ld a,(0c26fh)		;b30a   ; lee el golpe de Cles en marcha
	or a			;b30d
	jr nz,$+40		;b30e
	ld a,(0c2a7h)		;b310
	or a			;b313
	ret z			;b314
	dec a			;b315
	call 0408dh		;b316   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_B319: tabla de 4 palabras del despachador (call 0x408D en
;   0xB316); lo leen L_408D (8 bytes)
;   0xb319..0xb321  (8 bytes)
DATA_saltos_B319:
	defb 03bh,0b3h	; b319
	defb 05fh,0b3h	; b31b
	defb 060h,0b3h	; b31d
	defb 079h,0b3h	; b31f

; ======================================================================
; CODIGO 0xb321..0xb34f  (46 bytes)
; ======================================================================


cuenta_c272:		; 0xC272 - 1; a cero, esconde los sprites de 0xDE20/24 y p00:5ABD
	ld hl,0c272h		;b321   ; apunta a la cuenta del globo de animo
	ld a,(hl)			;b324
	or a			;b325
	ret z			;b326
	dec (hl)			;b327
	jp nz,07625h		;b328   ; globo_encima: los sprites 8 y 9 en (Y - 0x30, X - 8) del personaje, patrones 0x28 y 0x2C y sus colores (p01:765B)
	ld a,0e0h		;b32b
	ld (0de20h),a		;b32d   ; guarda la Y del sprite 8 en RAM
	ld (0de24h),a		;b330   ; guarda la Y del sprite 9 en RAM
	jp 05abdh		;b333   ; sprites_a3c1: los patrones de p15:A3C1 segun el estado del personaje
borra_c2a7:		; 0xC2A7 = 0
	xor a			;b336
	ld (0c2a7h),a		;b337
	ret			;b33a
L_B33B:
	ld hl,0c2a5h		;b33b
	dec (hl)			;b33e
	jr z,borra_c2a7		;b33f
	call alterna_c2a2		;b341   ; alterna_c2a2: cada 4 cuadros, 0xC2A2 xor 4
	call avanza_c2a1		;b344   ; avanza_c2a1: 0xC2A1 + 1 si 0xC2A6 y no se pasa
	ld hl,0b34fh		;b347
	call y_c2a0		;b34a   ; y_c2a0: 0xC2A0 + (HL + 0xC2A5)
	jr $+111		;b34d

; ----------------------------------------------------------------------
; DATOS resto_B34F: tablas cortas que apuntan p03:B347 (0xB34F); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:B347 (16
;   bytes)
;   0xb34f..0xb35f  (16 bytes)
DATA_resto_B34F:
	defb 001h,001h,001h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,001h,001h,001h	; b34f  ................

; ======================================================================
; CODIGO 0xb35f..0xb371  (18 bytes)
; ======================================================================


L_B35F:
	ret			;b35f
L_B360:
	ld hl,0c2a5h		;b360
	dec (hl)			;b363
	jr z,$-46		;b364
	call avanza_c2a1		;b366   ; avanza_c2a1: 0xC2A1 + 1 si 0xC2A6 y no se pasa
	ld hl,0b371h		;b369
	call y_c2a0		;b36c   ; y_c2a0: 0xC2A0 + (HL + 0xC2A5)
	jr $+77		;b36f

; ----------------------------------------------------------------------
; DATOS resto_B371: tablas cortas que apuntan p03:B369 (0xB371); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:B369 (8
;   bytes)
;   0xb371..0xb379  (8 bytes)
DATA_resto_B371:
	defb 002h,002h,002h,002h,001h,001h,000h,000h	; b371  ........

; ======================================================================
; CODIGO 0xb379..0xb62b  (690 bytes)
; ======================================================================


L_B379:
	ld hl,0c2a5h		;b379
	dec (hl)			;b37c
	jr z,$-71		;b37d
	ld de,0f8f8h		;b37f
	ld b,030h		;b382
	call posicion_c2a0		;b384   ; posicion_c2a0: 0xC2A0/0xC2A1 = la posicion del personaje con D/E y B
	call alterna_c2a2		;b387   ; alterna_c2a2: cada 4 cuadros, 0xC2A2 xor 4
	jr L_B3BC		;b38a
alterna_c2a2:		; cada 4 cuadros, 0xC2A2 xor 4
	ld a,(0c00dh)		;b38c   ; lee la cuenta de cuadros del juego
	and 003h		;b38f
	ret nz			;b391
	ld a,(0c2a2h)		;b392
	xor 004h		;b395
	ld (0c2a2h),a		;b397
	ret			;b39a
avanza_c2a1:		; 0xC2A1 + 1 si 0xC2A6 y no se pasa
	ld hl,0c2a1h		;b39b   ; apunta a la X del globo
	ld a,(hl)			;b39e
	add a,008h		;b39f
	cp 010h		;b3a1
	ret c			;b3a3
	ld a,(0c2a6h)		;b3a4
	or a			;b3a7
	jr z,L_B3AC		;b3a8
	inc (hl)			;b3aa
	ret			;b3ab
L_B3AC:
	dec (hl)			;b3ac
	ret			;b3ad
y_c2a0:		; 0xC2A0 + (HL + 0xC2A5)
	ld a,(0c2a5h)		;b3ae
	call 04083h		;b3b1   ; hl_mas_a: HL = HL + A
	ld a,(0c2a0h)		;b3b4   ; lee la Y del globo
	add a,(hl)			;b3b7
	ld (0c2a0h),a		;b3b8   ; guarda la Y del globo
	ret			;b3bb
L_B3BC:
	ld de,(0c2a0h)		;b3bc   ; lee la Y del globo y el byte siguiente (16 bits)
	ld (0de20h),de		;b3c0   ; guarda la Y del sprite 8 en RAM y el byte siguiente (16 bits)
	ld a,(0c2a2h)		;b3c4
	ld (0de22h),a		;b3c7   ; guarda el patron del sprite 8 en RAM
	ld hl,0dc80h		;b3ca
	ld de,0dc81h		;b3cd
	ld a,00dh		;b3d0
	ld bc,0000fh		;b3d2
	ld (hl),a			;b3d5
	ldir		;b3d6
	ret			;b3d8
L_B3D9:
	ld (ix+013h),000h		;b3d9   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ld (ix+010h),096h		;b3dd   ; el fotograma del actor (p02:8A42) = 0x96
	ret			;b3e1
L_B3E2:
	ld a,(ix+001h)		;b3e2   ; lee el paso del actor
	and a			;b3e5
	jr nz,L_B433		;b3e6
	ld b,096h		;b3e8
	call sonido_43_y_fotograma		;b3ea   ; sonido_43_y_fotograma: cada 16 cuadros el sonido 0x43; el fotograma B o B + 1 cada 8
	call cerca_en_x_8		;b3ed   ; cerca_en_x_8: acarreo y velocidad X = L si el personaje esta a menos de 8 en X
	jr c,L_B3FF		;b3f0
	call 08b48h		;b3f2   ; compara_x: compara la X del personaje con la del actor
	ld h,002h		;b3f5
	push af			;b3f7
	call 08b8bh		;b3f8   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
	pop af			;b3fb
	call c,08b03h		;b3fc   ; sonido_0a: el sonido 0x0A (p02:8B0D)
L_B3FF:
	call cerca_en_y_8		;b3ff   ; cerca_en_y_8: acarreo y velocidad Y = L si el personaje esta a menos de 8 en Y
	jr c,L_B411		;b402
	call 08b41h		;b404   ; compara_y: compara la Y del personaje con la del actor
	ld h,002h		;b407
	push af			;b409
	call 08b80h		;b40a   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	pop af			;b40d
	call c,08affh		;b40e   ; sonido_08: el sonido 8 (p02:8B0D)
L_B411:
	call cerca_en_y_8		;b411   ; cerca_en_y_8: acarreo y velocidad Y = L si el personaje esta a menos de 8 en Y
	ret nc			;b414
	call cerca_en_x_8		;b415   ; cerca_en_x_8: acarreo y velocidad X = L si el personaje esta a menos de 8 en X
	ret nc			;b418
	inc (ix+001h)		;b419   ; sube el paso del actor
	call 08b89h		;b41c   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	ld h,0feh		;b41f
	call 08b80h		;b421   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
personaje_al_actor:		; el personaje en la posicion del actor (Y + 8)
	ld a,(ix+003h)		;b424   ; lee la Y del actor
	add a,008h		;b427
	ld (0c244h),a		;b429   ; guarda la Y del personaje
	ld a,(ix+005h)		;b42c   ; lee la X del actor
	ld (0c246h),a		;b42f   ; guarda la X del personaje
	ret			;b432
L_B433:
	ld b,098h		;b433
	call sonido_43_y_fotograma		;b435   ; sonido_43_y_fotograma: cada 16 cuadros el sonido 0x43; el fotograma B o B + 1 cada 8
	call personaje_al_actor		;b438   ; personaje_al_actor: el personaje en la posicion del actor (Y + 8)
	ld a,(ix+003h)		;b43b   ; lee la Y del actor
	cp 014h		;b43e
	ret nc			;b440
	xor a			;b441
	ld (0c214h),a		;b442   ; guarda en marcha la fase
	ret			;b445
cerca_en_x_8:		; acarreo y velocidad X = L si el personaje esta a menos de 8 en X
	ld a,(0c246h)		;b446   ; lee la X del personaje
	sub (ix+005h)		;b449   ; le resta la X del actor
	add a,008h		;b44c
	cp 010h		;b44e
	ret nc			;b450
	call 08b89h		;b451   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	scf			;b454
	ret			;b455
cerca_en_y_8:		; acarreo y velocidad Y = L si el personaje esta a menos de 8 en Y
	ld a,(0c244h)		;b456   ; lee la Y del personaje
	sub (ix+003h)		;b459   ; le resta la Y del actor
	add a,008h		;b45c
	cp 010h		;b45e
	ret nc			;b460
	call 08b7eh		;b461   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	scf			;b464
	ret			;b465
sonido_8_cada_16:		; cada 16 cuadros el sonido 8
	ld a,(0c00dh)		;b466   ; lee la cuenta de cuadros del juego
	and 00fh		;b469
	ld a,008h		;b46b
	call z,056e3h		;b46d   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	jr L_B47C		;b470
sonido_43_y_fotograma:		; cada 16 cuadros el sonido 0x43; el fotograma B o B + 1 cada 8
	ld a,(0c00dh)		;b472   ; lee la cuenta de cuadros del juego
	and 00fh		;b475
	ld a,043h		;b477
	call z,056e3h		;b479   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_B47C:
	ld a,(0c00dh)		;b47c   ; lee la cuenta de cuadros del juego
	and 008h		;b47f
	jr z,L_B484		;b481
	inc b			;b483
L_B484:
	ld (ix+010h),b		;b484   ; guarda el fotograma del actor (p02:8A42)
	ret			;b487
L_B488:
	ld (ix+013h),000h		;b488   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ld (ix+010h),096h		;b48c   ; el fotograma del actor (p02:8A42) = 0x96
	ld h,001h		;b490
	jp 08b80h		;b492   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
L_B495:
	ld b,096h		;b495
	call sonido_8_cada_16		;b497   ; sonido_8_cada_16: cada 16 cuadros el sonido 8
	ld a,(ix+001h)		;b49a   ; lee el paso del actor
	and a			;b49d
	ret nz			;b49e
	ld a,(0c31ah)		;b49f
	cp (ix+003h)		;b4a2   ; compara con la Y del actor
	ret nc			;b4a5
	inc (ix+001h)		;b4a6   ; sube el paso del actor
	call 08b7eh		;b4a9   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	ld a,(0c319h)		;b4ac   ; lee los 3 bytes de la fase de p09:BED3
	ld d,a			;b4af
	ld a,(0c31ah)		;b4b0
	ld e,a			;b4b3
	ld a,025h		;b4b4
	call 056e3h		;b4b6   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld c,01dh		;b4b9
	push ix		;b4bb
	call 08613h		;b4bd   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;b4c0
	ret			;b4c2
L_B4C3:
	ld (ix+013h),000h		;b4c3   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ld a,023h		;b4c7
	call 055f0h		;b4c9   ; juego_de_sprites: con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)
	ld (ix+010h),09ah		;b4cc   ; el fotograma del actor (p02:8A42) = 0x9A
	ld (ix+011h),020h		;b4d0   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	call dibujo_b4da		;b4d4   ; dibujo_b4da: copia (ix+0x11) lineas de (0x88, 0x80) junto al actor (LMMM 0x10)
	jp dibujo_b587		;b4d7   ; dibujo_b587: copia (ix+0x11) lineas de (0x50, 0x98 + B) con TIMP
dibujo_b4da:		; copia (ix+0x11) lineas de (0x88, 0x80) junto al actor (LMMM 0x10)
	call posicion_del_dibujo		;b4da   ; posicion_del_dibujo: D, E y B para los dibujos de 0x20 - (ix+0x11) lineas
	ex de,hl			;b4dd
	ld de,08088h		;b4de
	ld c,(ix+011h)		;b4e1   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ld b,010h		;b4e4
	ld a,010h		;b4e6
	jp 04c73h		;b4e8   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
posicion_por_personaje:		; HL = 0x7060 con el personaje 0, 0x3060 con el 1
	ld a,(0c240h)		;b4eb   ; lee el personaje que se lleva (0 o 1)
	or a			;b4ee
	ld hl,07060h		;b4ef
	jr z,L_B4F6		;b4f2
	ld h,030h		;b4f4
L_B4F6:
	ld de,05098h		;b4f6
	ld b,004h		;b4f9
L_B4FB:
	push bc			;b4fb   ; B copias de 16 x 8 de la pagina 1 a la 1 (A = 5)
	push hl			;b4fc
	push de			;b4fd
	ld bc,01008h		;b4fe
	ld a,005h		;b501
	call 04bdeh		;b503   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop de			;b506
	pop hl			;b507
	pop bc			;b508
	ld a,e			;b509   ; la siguiente: 8 lineas mas abajo y 16 a la derecha en el origen
	add a,008h		;b50a
	ld e,a			;b50c
	ld a,h			;b50d
	add a,010h		;b50e
	ld h,a			;b510
	djnz L_B4FB		;b511
	ret			;b513
dibujo_b514:		; copia (ix+0x11) lineas a (0x88, 0x80) (LMMM 0x40)
	call posicion_del_dibujo		;b514   ; posicion_del_dibujo: D, E y B para los dibujos de 0x20 - (ix+0x11) lineas
	ld hl,08088h		;b517
	ld c,(ix+011h)		;b51a   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ld b,010h		;b51d
	ld a,040h		;b51f
	jp 04c73h		;b521   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
L_B524:
	ld a,(ix+001h)		;b524   ; lee el paso del actor
	and a			;b527
	jr nz,L_B56E		;b528
	call fotograma_9a_9b		;b52a   ; fotograma_9a_9b: el fotograma 0x9A / 0x9B cada 32 cuadros
	call dibujo_b587		;b52d   ; dibujo_b587: copia (ix+0x11) lineas de (0x50, 0x98 + B) con TIMP
	ld a,(0c20ah)		;b530   ; lee en la sala de la puerta 5
	or a			;b533
	jr nz,L_B557		;b534
	ld a,(0c310h)		;b536   ; lee el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	cp 001h		;b539
	ret nz			;b53b
L_B53C:
	inc (ix+001h)		;b53c   ; sube el paso del actor
	ld (ix+011h),020h		;b53f   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	xor a			;b543
	ld (ix+025h),a		;b544
	ld (ix+02ah),a		;b547
	ld (ix+02fh),a		;b54a
	ld (ix+034h),a		;b54d
	ld (ix+039h),a		;b550
	ld (ix+03eh),a		;b553
	ret			;b556
L_B557:
	ld a,(0c310h)		;b557   ; lee el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	cp 003h		;b55a
	ret c			;b55c
	jr L_B53C		;b55d
fotograma_9a_9b:		; el fotograma 0x9A / 0x9B cada 32 cuadros
	ld a,(0c00dh)		;b55f   ; lee la cuenta de cuadros del juego
	and 020h		;b562
	ld a,09ah		;b564
	jr z,L_B56A		;b566
	ld a,09bh		;b568
L_B56A:
	ld (ix+010h),a		;b56a   ; guarda el fotograma del actor (p02:8A42)
	ret			;b56d
L_B56E:
	call dibujo_b514		;b56e   ; dibujo_b514: copia (ix+0x11) lineas a (0x88, 0x80) (LMMM 0x40)
	dec (ix+011h)		;b571   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	jr nz,L_B581		;b574
	call 083d6h		;b576   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	ld a,(0c20ah)		;b579   ; lee en la sala de la puerta 5
	or a			;b57c
	ret z			;b57d
	jp 08215h		;b57e   ; juegos_de_la_sala_5: los juegos de sprites 0x28, 0x19 y el de la ruina (p02:822C)
L_B581:
	dec (ix+003h)		;b581   ; baja la Y del actor
	call dibujo_b4da		;b584   ; dibujo_b4da: copia (ix+0x11) lineas de (0x88, 0x80) junto al actor (LMMM 0x10)
dibujo_b587:		; copia (ix+0x11) lineas de (0x50, 0x98 + B) con TIMP
	call posicion_del_dibujo		;b587   ; posicion_del_dibujo: D, E y B para los dibujos de 0x20 - (ix+0x11) lineas
	ld h,050h		;b58a
	ld a,b			;b58c
	add a,098h		;b58d
	ld l,a			;b58f
	ld c,(ix+011h)		;b590   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ld b,010h		;b593
	ld a,048h		;b595
	jp 04c73h		;b597   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
posicion_del_dibujo:		; D, E y B para los dibujos de 0x20 - (ix+0x11) lineas
	ld a,020h		;b59a
	sub (ix+011h)		;b59c   ; le resta la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ld b,a			;b59f
	sub 020h		;b5a0
	add a,(ix+003h)		;b5a2   ; le suma la Y del actor
	ld e,a			;b5a5
	ld a,(ix+005h)		;b5a6   ; lee la X del actor
	sub 008h		;b5a9
	ld d,a			;b5ab
	ret			;b5ac
L_B5AD:
	ld (ix+011h),010h		;b5ad   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld (ix+010h),021h		;b5b1   ; el fotograma del actor (p02:8A42) = 0x21
	ld (ix+013h),000h		;b5b5   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	ret			;b5b9
L_B5BA:
	dec (ix+011h)		;b5ba   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;b5bd
	jp 083d6h		;b5be   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
L_B5C1:
	ld h,004h		;b5c1
	call 08b80h		;b5c3   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	xor a			;b5c6
	ld (ix+013h),a		;b5c7   ; guarda las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	push ix		;b5ca
	call 05b60h		;b5cc   ; fotograma_a_fa80: un fotograma de cada personaje a la VRAM desde 0xFA80 (p00:5B6E)
	pop ix		;b5cf
piezas_por_personaje:		; los patrones de las piezas (0x4B o 0x5C) segun el personaje y el fotograma 0x5E
	ld a,(0c240h)		;b5d1   ; lee el personaje que se lleva (0 o 1)
	or a			;b5d4
	ld a,05ch		;b5d5
	jr nz,L_B5E3		;b5d7
	ld a,04bh		;b5d9
	ld (ix+02ah),a		;b5db
	ld (ix+034h),a		;b5de
	ld a,05eh		;b5e1
L_B5E3:
	ld (ix+010h),a		;b5e3
	ret			;b5e6
L_B5E7:
	ld b,(ix+001h)		;b5e7   ; lee el paso del actor
	djnz L_B602		;b5ea
	dec (ix+011h)		;b5ec   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;b5ef
	call piezas_por_personaje		;b5f0   ; piezas_por_personaje: los patrones de las piezas (0x4B o 0x5C) segun el personaje y el fotograma 0x5E
	inc (ix+010h)		;b5f3   ; sube el fotograma del actor (p02:8A42)
	xor a			;b5f6
	ld (0c271h),a		;b5f7
	inc (ix+001h)		;b5fa   ; sube el paso del actor
	ld h,004h		;b5fd
	jp 08b8bh		;b5ff   ; velocidad_x_h: (ix+9, 0x0A) = H * 256 (L = 0)
L_B602:
	djnz $+45		;b602
	ld a,(0c00dh)		;b604   ; lee la cuenta de cuadros del juego
	rra			;b607
	and 003h		;b608
	ld hl,0b62bh		;b60a
	call 04083h		;b60d   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;b610
	push ix		;b611
	call 05b60h		;b613   ; fotograma_a_fa80: un fotograma de cada personaje a la VRAM desde 0xFA80 (p00:5B6E)
	pop ix		;b616
	ld a,(ix+005h)		;b618
	cp 0f0h		;b61b
	ret c			;b61d
	call 06811h		;b61e   ; accion_6: accion 6, los colores del personaje y sin invencible (0xC256 = 0)
	ld hl,0c310h		;b621   ; apunta a el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	inc (hl)			;b624
	call 083d6h		;b625   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	jp 0545eh		;b628   ; vuelve_un_personaje_456: con 4-5-6: p06:BC36 y vuelve con 1-2-3

; ----------------------------------------------------------------------
; DATOS resto_B62B: tablas cortas que apuntan p03:B60A (0xB62B); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:B60A (4
;   bytes)
;   0xb62b..0xb62f  (4 bytes)
DATA_resto_B62B:
	defb 000h,001h,002h,001h	; b62b

; ======================================================================
; CODIGO 0xb62f..0xb774  (325 bytes)
; ======================================================================


L_B62F:
	ld a,(ix+003h)		;b62f   ; lee la Y del actor
	cp 0c4h		;b632
	ret c			;b634
	call 08b7eh		;b635   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	call 08b48h		;b638   ; compara_x: compara la X del personaje con la del actor
	jr c,L_B640		;b63b
	inc (ix+010h)		;b63d   ; sube el fotograma del actor (p02:8A42)
L_B640:
	inc (ix+001h)		;b640   ; sube el paso del actor
	ld (ix+003h),0c4h		;b643   ; la Y del actor = 0xC4
	ld (ix+011h),010h		;b647   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x10
	ld c,01bh		;b64b
	ld d,(ix+005h)		;b64d   ; lee la X del actor
	ld a,(ix+003h)		;b650   ; lee la Y del actor
	sub 020h		;b653
	ld e,a			;b655
	push ix		;b656
	call 08613h		;b658   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;b65b
	ret			;b65d
L_B65E:
	ld (ix+010h),055h		;b65e   ; el fotograma del actor (p02:8A42) = 0x55
	ret			;b662
L_B663:
	ld b,(ix+001h)		;b663   ; lee el paso del actor
	djnz L_B681		;b666
	ld a,(0c00dh)		;b668   ; lee la cuenta de cuadros del juego
	and 001h		;b66b
	ret nz			;b66d
	ld a,(ix+010h)		;b66e   ; lee el fotograma del actor (p02:8A42)
	cp 059h		;b671
	jr z,L_B679		;b673
	inc (ix+010h)		;b675   ; sube el fotograma del actor (p02:8A42)
	ret			;b678
L_B679:
	ld (ix+010h),055h		;b679   ; el fotograma del actor (p02:8A42) = 0x55
	dec (ix+001h)		;b67d   ; baja el paso del actor
	ret			;b680
L_B681:
	ld (ix+010h),055h		;b681   ; el fotograma del actor (p02:8A42) = 0x55
	ld a,(0c59fh)		;b685
	cp 005h		;b688
	ret nz			;b68a
	inc (ix+001h)		;b68b   ; sube el paso del actor
	ret			;b68e
choques_con_cd00:		; salvo muriendo y fuera de la sala 5: los choques de los 9 actores de 0xCD00 (p03:B6AB) y sus empujones
	ld a,(0c24bh)		;b68f   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;b692
	ret z			;b694
	ld a,(0c20ah)		;b695   ; lee en la sala de la puerta 5
	and a			;b698
	ret nz			;b699
	ld hl,00000h		;b69a
	ld (0ccb4h),hl		;b69d
	ld ix,0cd00h		;b6a0   ; apunta a los 9 actores de la pantalla (0x80 bytes cada uno)
	ld b,009h		;b6a4
L_B6A6:
	ld a,(ix+000h)		;b6a6   ; lee el tipo del actor
	and a			;b6a9
	push bc			;b6aa
	call nz,choques_del_actor		;b6ab   ; choques_del_actor: plataformas (p03:B8C6), golpes (p03:B95A), pisadas (p03:BA0C) y su tipo
	call empuja_al_personaje		;b6ae   ; empuja_al_personaje: si el actor se mueve, mueve al personaje que va encima
	pop bc			;b6b1
	ld de,00080h		;b6b2
	add ix,de		;b6b5
	djnz L_B6A6		;b6b7
	ld ix,0cd00h		;b6b9   ; apunta a los 9 actores de la pantalla (0x80 bytes cada uno)
	ld b,009h		;b6bd
	ld de,0ccb0h		;b6bf
	xor a			;b6c2
	ld (de),a			;b6c3
	inc e			;b6c4
	ld (de),a			;b6c5
	inc e			;b6c6
	ld (de),a			;b6c7
	inc e			;b6c8
	ld (de),a			;b6c9
	dec e			;b6ca
	dec e			;b6cb
	dec e			;b6cc
L_B6CD:
	push bc			;b6cd
	ld a,(ix+000h)		;b6ce   ; lee el tipo del actor
	and a			;b6d1
	jr z,L_B6F2		;b6d2
	ld a,(ix+01bh)		;b6d4
	and a			;b6d7
	ld c,001h		;b6d8
	call nz,pon_c		;b6da   ; pon_c: (DE) = C
	ld a,(ix+01ch)		;b6dd
	and a			;b6e0
	call nz,pon_c_2		;b6e1   ; pon_c_2: (DE + 2) = C
	ld a,(ix+01dh)		;b6e4
	and a			;b6e7
	call nz,pon_c_1		;b6e8   ; pon_c_1: (DE + 1) = C
	ld a,(ix+01eh)		;b6eb
	and a			;b6ee
	call nz,pon_c_3		;b6ef   ; pon_c_3: (DE + 3) = C
L_B6F2:
	ld bc,00080h		;b6f2
	add ix,bc		;b6f5
	pop bc			;b6f7
	djnz L_B6CD		;b6f8
	ret			;b6fa
pon_c:		; (DE) = C
	ld a,c			;b6fb
	ld (de),a			;b6fc
	ret			;b6fd
pon_c_2:		; (DE + 2) = C
	ld a,c			;b6fe   ; el byte 2 de (DE)
	inc e			;b6ff
	inc e			;b700
	ld (de),a			;b701
	dec e			;b702
	dec e			;b703
	ret			;b704
pon_c_1:		; (DE + 1) = C
	ld a,c			;b705
	inc e			;b706
	ld (de),a			;b707
	dec e			;b708
	ret			;b709
pon_c_3:		; (DE + 3) = C
	push de			;b70a   ; el byte 3 de (DE), sin tocar DE
	ld a,c			;b70b
	inc e			;b70c
	inc e			;b70d
	inc e			;b70e
	ld (de),a			;b70f
	pop de			;b710
	ret			;b711
empuja_al_personaje:		; si el actor se mueve, mueve al personaje que va encima
	ld a,(ix+01dh)		;b712
	ld b,(ix+01ch)		;b715
	or b			;b718
	ret z			;b719
	ld a,(ix+000h)		;b71a   ; lee el tipo del actor
	cp 006h		;b71d
	jr z,L_B72F		;b71f
	cp 00ch		;b721
	jr z,L_B72F		;b723
	cp 00dh		;b725
	jr z,L_B72F		;b727
	call tipo_2_o_negativo		;b729   ; tipo_2_o_negativo: segun el tipo, p03:BA7E o p03:BA82
	jp c,L_BA52		;b72c
L_B72F:
	ld a,(ix+01dh)		;b72f
	and a			;b732
	ld a,(ix+00ah)		;b733   ; lee la velocidad X del actor (alta)
	jr z,L_B73C		;b736
	rla			;b738
	ret nc			;b739
	jr L_B73E		;b73a
L_B73C:
	rla			;b73c
	ret c			;b73d
L_B73E:
	ld de,(0c245h)		;b73e   ; lee la X del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	ld h,(ix+00ah)		;b742   ; lee la velocidad X del actor (alta)
	ld l,(ix+009h)		;b745   ; lee la velocidad X del actor
	add hl,de			;b748
	ld (0c245h),hl		;b749   ; guarda la X del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	ld a,c			;b74c
	cp 005h		;b74d
	ret nz			;b74f
	ld a,003h		;b750
	ld (0c24bh),a		;b752   ; guarda la accion del personaje (4 muere, 5 escalera)
	ret			;b755
choques_del_actor:		; plataformas (p03:B8C6), golpes (p03:B95A), pisadas (p03:BA0C) y su tipo
	ld a,(0c244h)		;b756   ; lee la Y del personaje
	ld e,a			;b759
	ld a,(0c246h)		;b75a   ; lee la X del personaje
	ld d,a			;b75d
	push de			;b75e
	call plataformas		;b75f   ; plataformas: los tipos de p03:B9F7 (7 de 3 bytes) sobre los que se puede estar
	pop de			;b762
	push de			;b763
	call golpe_al_personaje		;b764   ; golpe_al_personaje: segun el tipo (1, 3, 7) si toca la caja del personaje
	pop de			;b767
	push de			;b768
	call pisa_actor		;b769   ; pisa_actor: en accion 0 o 2, los tipos 2 y 4 junto al personaje
	pop de			;b76c
	ld a,(ix+000h)		;b76d   ; lee el tipo del actor
	dec a			;b770
	call 0408dh		;b771   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_B774: tabla de 13 palabras del despachador (call 0x408D en
;   0xB771); lo leen L_408D (26 bytes)
;   0xb774..0xb78e  (26 bytes)
DATA_saltos_B774:
	defb 0eeh,0b7h	; b774
	defb 0efh,0b7h	; b776
	defb 0eeh,0b7h	; b778
	defb 098h,0b7h	; b77a
	defb 0f4h,0b7h	; b77c
	defb 03dh,0b8h	; b77e
	defb 0eeh,0b7h	; b780
	defb 086h,0b8h	; b782
	defb 058h,0b8h	; b784
	defb 0a9h,0b8h	; b786
	defb 08eh,0b7h	; b788
	defb 03dh,0b8h	; b78a
	defb 03dh,0b8h	; b78c

; ======================================================================
; CODIGO 0xb78e..0xb9f7  (617 bytes)
; ======================================================================


L_B78E:
	ld a,(ix+001h)		;b78e   ; lee el paso del actor
	rra			;b791
	jr c,L_B7F4		;b792
	ld b,00ch		;b794
	jr L_B79A		;b796
L_B798:
	ld b,014h		;b798
L_B79A:
	ld (ix+01bh),000h		;b79a
	ld a,(ix+008h)		;b79e   ; lee la velocidad Y del actor (alta)
	rla			;b7a1
	ld c,00ch		;b7a2
	jr nc,L_B7A8		;b7a4
	ld c,008h		;b7a6
L_B7A8:
	ld a,(ix+003h)		;b7a8   ; lee la Y del actor
	sub b			;b7ab
	sub e			;b7ac
	cp c			;b7ad
	ret nc			;b7ae
	ld a,(ix+005h)		;b7af   ; lee la X del actor
	add a,00ch		;b7b2
	sub d			;b7b4
	cp 018h		;b7b5
	ret nc			;b7b7
	ld a,(ix+000h)		;b7b8   ; lee el tipo del actor
	cp 004h		;b7bb
	ld b,01ah		;b7bd
	jr z,suelo_del_personaje		;b7bf
	ld b,00fh		;b7c1
suelo_del_personaje:		; las dos casillas bajo el personaje (p01:704C)
	push bc			;b7c3
	ld a,(0c246h)		;b7c4   ; lee la X del personaje
	sub 004h		;b7c7
	ld d,a			;b7c9
	ld a,(0c244h)		;b7ca   ; lee la Y del personaje
	ld e,a			;b7cd
	push de			;b7ce
	call 0704ch		;b7cf   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop de			;b7d2
	pop bc			;b7d3
	jp c,alinea_y_del_personaje		;b7d4   ; alinea_y_del_personaje: la Y del personaje a su fila de 8 (+ 3)
	push bc			;b7d7
	ld a,d			;b7d8
	add a,008h		;b7d9
	ld d,a			;b7db
	call 0704ch		;b7dc   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop bc			;b7df
	jp c,alinea_y_del_personaje		;b7e0   ; alinea_y_del_personaje: la Y del personaje a su fila de 8 (+ 3)
	ld (ix+01bh),001h		;b7e3
	ld a,(ix+003h)		;b7e7   ; lee la Y del actor
	sub b			;b7ea
	ld (0c244h),a		;b7eb   ; guarda la Y del personaje
L_B7EE:
	ret			;b7ee
L_B7EF:
	ld bc,01c28h		;b7ef
	jr L_B7F7		;b7f2
L_B7F4:
	ld bc,00c18h		;b7f4
L_B7F7:
	ld (ix+01bh),000h		;b7f7
	ld a,(ix+003h)		;b7fb   ; lee la Y del actor
	sub b			;b7fe
	sub e			;b7ff
	cp 008h		;b800
	ret nc			;b802
	ld a,c			;b803
	srl a		;b804
	add a,(ix+005h)		;b806   ; le suma la X del actor
	sub d			;b809
	cp c			;b80a
	ret nc			;b80b
	ld a,(ix+000h)		;b80c   ; lee el tipo del actor
	cp 002h		;b80f
	ld bc,01001h		;b811
	jr nz,L_B819		;b814
	ld bc,02002h		;b816
L_B819:
	call suelo_del_personaje		;b819   ; suelo_del_personaje: las dos casillas bajo el personaje (p01:704C)
	push bc			;b81c
	call pared_al_empujar		;b81d   ; pared_al_empujar: las casillas a 6 puntos del personaje al empujarlo
	pop bc			;b820
	ret c			;b821
	ld hl,0c246h		;b822   ; apunta a la X del personaje
	ld a,(ix+00ah)		;b825   ; lee la velocidad X del actor (alta)
	rla			;b828
	jr c,L_B834		;b829
L_B82B:
	ld a,(0ccb2h)		;b82b   ; si no esta cerrada la derecha (0xCCB2): (HL) + C
	and a			;b82e
	ret nz			;b82f
	ld a,(hl)			;b830
	add a,c			;b831
	ld (hl),a			;b832
	ret			;b833
L_B834:
	ld a,(0ccb1h)		;b834   ; si no esta cerrada la izquierda (0xCCB1): (HL) - C
	and a			;b837
	ret nz			;b838
	ld a,(hl)			;b839
	sub c			;b83a
	ld (hl),a			;b83b
	ret			;b83c
L_B83D:
	ld (ix+01bh),000h		;b83d
	ld a,(ix+003h)		;b841   ; lee la Y del actor
	sub 00ch		;b844
	sub e			;b846
	cp 008h		;b847
	ret nc			;b849
	ld a,(ix+005h)		;b84a   ; lee la X del actor
	add a,00ah		;b84d
	sub d			;b84f
	cp 014h		;b850
	ret nc			;b852
	ld b,010h		;b853
	jp suelo_del_personaje		;b855   ; suelo_del_personaje: las dos casillas bajo el personaje (p01:704C)
L_B858:
	ld (ix+01bh),000h		;b858
	ld a,(ix+003h)		;b85c   ; lee la Y del actor
	sub e			;b85f
	jr nc,L_B864		;b860
	neg		;b862
L_B864:
	cp 004h		;b864
	ret nc			;b866
	ld a,d			;b867
	sub (ix+005h)		;b868   ; le resta la X del actor
	add a,006h		;b86b
	cp 04ch		;b86d
	ret nc			;b86f
	call alinea_y_del_personaje		;b870   ; alinea_y_del_personaje: la Y del personaje a su fila de 8 (+ 3)
	ld (ix+01bh),001h		;b873
	ld hl,0c246h		;b877   ; apunta a la X del personaje
	ld c,001h		;b87a
	ld a,(ix+017h)		;b87c
	and a			;b87f
	jp nz,L_B834		;b880
	jp L_B82B		;b883
L_B886:
	ld a,e			;b886
	sub (ix+003h)		;b887   ; le resta la Y del actor
	cp 020h		;b88a
	ret nc			;b88c
	ld a,d			;b88d
	add a,004h		;b88e
	sub (ix+005h)		;b890   ; le resta la X del actor
	cp 018h		;b893
	ret nc			;b895
	ld hl,0ccb4h		;b896
	ld a,(ix+005h)		;b899   ; lee la X del actor
	add a,008h		;b89c
	sub d			;b89e
	jr c,L_B8A2		;b89f
	inc hl			;b8a1
L_B8A2:
	ld (hl),001h		;b8a2
	ld (ix+01fh),001h		;b8a4
	ret			;b8a8
L_B8A9:
	ld a,(ix+003h)		;b8a9   ; lee la Y del actor
	sub e			;b8ac
	cp 004h		;b8ad
	ret nc			;b8af
	ld a,d			;b8b0
	sub (ix+005h)		;b8b1   ; le resta la X del actor
	cp 020h		;b8b4
	ret nc			;b8b6
	ld (ix+012h),001h		;b8b7   ; la vida del actor (p01:721A) = 0x01
	ret			;b8bb
alinea_y_del_personaje:		; la Y del personaje a su fila de 8 (+ 3)
	ld hl,0c244h		;b8bc   ; apunta a la Y del personaje
	ld a,(hl)			;b8bf
	and 0f8h		;b8c0
	or 003h		;b8c2
	ld (hl),a			;b8c4
	ret			;b8c5
plataformas:		; los tipos de p03:B9F7 (7 de 3 bytes) sobre los que se puede estar
	ld c,(ix+000h)		;b8c6   ; lee el tipo del actor
	ld hl,0b9f7h		;b8c9
	ld b,007h		;b8cc
L_B8CE:
	ld a,(hl)			;b8ce
	cp c			;b8cf
	push hl			;b8d0
	push bc			;b8d1
	jr nz,L_B8DD		;b8d2
	inc hl			;b8d4
	push hl			;b8d5
	call encima_de		;b8d6   ; encima_de: acarreo si el personaje esta encima del actor
	pop hl			;b8d9
	call cae_encima		;b8da   ; cae_encima: si cae (accion 1), lo deja encima del actor
L_B8DD:
	pop bc			;b8dd   ; la siguiente de las 7 plataformas, 3 bytes mas alla
	pop hl			;b8de
	inc hl			;b8df
	inc hl			;b8e0
	inc hl			;b8e1
	djnz L_B8CE		;b8e2
	ret			;b8e4
encima_de:		; acarreo si el personaje esta encima del actor
	ld a,(ix+003h)		;b8e5   ; lee la Y del actor
	sub (hl)			;b8e8
	ld b,a			;b8e9
	push bc			;b8ea
	push de			;b8eb
	push hl			;b8ec
	call 073fdh		;b8ed   ; caja_del_personaje: la caja del personaje segun 0xC253 y 0xC240 (p01:7429)
	exx			;b8f0
	ld a,e			;b8f1
	add a,a			;b8f2
	exx			;b8f3
	pop hl			;b8f4
	pop de			;b8f5
	pop bc			;b8f6
	add a,(hl)			;b8f7
	sub 004h		;b8f8
	ld c,a			;b8fa
	ld a,e			;b8fb
	sub 004h		;b8fc
	sub b			;b8fe
	cp c			;b8ff
	jr nc,L_B912		;b900
	inc hl			;b902
	ld a,(hl)			;b903
	add a,008h		;b904
	ld c,a			;b906
	ld a,d			;b907
	sub (ix+005h)		;b908   ; le resta la X del actor
	jr nc,L_B90F		;b90b
	neg		;b90d
L_B90F:
	cp c			;b90f
	jr c,L_B91A		;b910
L_B912:
	xor a			;b912
	ld (ix+01ch),a		;b913
	ld (ix+01dh),a		;b916
	ret			;b919
L_B91A:
	call 08b48h		;b91a   ; compara_x: compara la X del personaje con la del actor
	jr c,L_B924		;b91d
	ld (ix+01ch),001h		;b91f
	ret			;b923
L_B924:
	ld (ix+01dh),001h		;b924
	ret			;b928
cae_encima:		; si cae (accion 1), lo deja encima del actor
	ld a,(0c24bh)		;b929   ; lee la accion del personaje (4 muere, 5 escalera)
	dec a			;b92c
	ret nz			;b92d
	push de			;b92e
	push hl			;b92f
	call 073fdh		;b930   ; caja_del_personaje: la caja del personaje segun 0xC253 y 0xC240 (p01:7429)
	exx			;b933
	ld a,e			;b934
	add a,a			;b935
	exx			;b936
	pop hl			;b937
	pop de			;b938
	ld b,a			;b939
	ld a,e			;b93a
	sub b			;b93b
	sub (ix+003h)		;b93c   ; le resta la Y del actor
	neg		;b93f
	cp 010h		;b941
	ld a,000h		;b943
	jr nc,L_B956		;b945
	inc hl			;b947
	ld a,d			;b948
	sub (ix+005h)		;b949   ; le resta la X del actor
	jr nc,L_B950		;b94c
	neg		;b94e
L_B950:
	cp (hl)			;b950
	ld a,001h		;b951
	jr c,L_B956		;b953
	xor a			;b955
L_B956:
	ld (ix+01eh),a		;b956
	ret			;b959
golpe_al_personaje:		; segun el tipo (1, 3, 7) si toca la caja del personaje
	ld a,(ix+013h)		;b95a   ; lee las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	and a			;b95d
	ret z			;b95e
	ld a,(ix+000h)		;b95f   ; lee el tipo del actor
	cp 003h		;b962
	call z,toca_caja		;b964   ; toca_caja: acarreo si el actor toca la caja del personaje
	ld a,(ix+000h)		;b967   ; lee el tipo del actor
	cp 001h		;b96a
	call z,toca_caja		;b96c   ; toca_caja: acarreo si el actor toca la caja del personaje
	ld a,(ix+000h)		;b96f   ; lee el tipo del actor
	cp 007h		;b972
	ret nz			;b974
	ld a,(ix+010h)		;b975   ; lee el fotograma del actor (p02:8A42)
	and a			;b978
	ret z			;b979
	add a,a			;b97a
	add a,a			;b97b
	add a,a			;b97c
	add a,a			;b97d
	ld c,a			;b97e
	push de			;b97f
	push bc			;b980
	call 073fdh		;b981   ; caja_del_personaje: la caja del personaje segun 0xC253 y 0xC240 (p01:7429)
	exx			;b984
	ld a,e			;b985
	add a,a			;b986
	exx			;b987
	pop bc			;b988
	add a,c			;b989
	ld b,a			;b98a
	pop de			;b98b
	ld a,e			;b98c
	sub (ix+003h)		;b98d   ; le resta la Y del actor
	cp b			;b990
	ret nc			;b991
	ld a,d			;b992
	sub (ix+005h)		;b993   ; le resta la X del actor
	jr nc,L_B99A		;b996
	neg		;b998
L_B99A:
	cp 010h		;b99a
	ret nc			;b99c
	ld hl,0ccb7h		;b99d
	ld a,(hl)			;b9a0
	and a			;b9a1
	ret nz			;b9a2
	ld (hl),00ah		;b9a3
	call 047ebh		;b9a5   ; byte_5_del_personaje: A = el byte 5 de la ficha del personaje que se lleva
	ld b,004h		;b9a8
	jp L_B9EA		;b9aa
toca_caja:		; acarreo si el actor toca la caja del personaje
	push de			;b9ad
	call 073fdh		;b9ae   ; caja_del_personaje: la caja del personaje segun 0xC253 y 0xC240 (p01:7429)
	exx			;b9b1
	ld a,e			;b9b2
	add a,a			;b9b3
	exx			;b9b4
	add a,006h		;b9b5
	ld b,a			;b9b7
	pop de			;b9b8
	ld a,(ix+003h)		;b9b9   ; lee la Y del actor
	sub 006h		;b9bc
	sub e			;b9be
	neg		;b9bf
	cp b			;b9c1
	ret nc			;b9c2
	ld a,(ix+005h)		;b9c3   ; lee la X del actor
	sub d			;b9c6
	jr nc,L_B9CB		;b9c7
	neg		;b9c9
L_B9CB:
	cp 00ch		;b9cb
	ret nc			;b9cd
	ld a,(0c256h)		;b9ce   ; lee invencible
	and a			;b9d1
	ret nz			;b9d2
	ld (ix+012h),001h		;b9d3   ; la vida del actor (p01:721A) = 0x01
	ld (ix+013h),000h		;b9d7   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	call 047ebh		;b9db   ; byte_5_del_personaje: A = el byte 5 de la ficha del personaje que se lleva
	ld a,(0c205h)		;b9de   ; lee los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	rra			;b9e1
	rra			;b9e2
	ld a,008h		;b9e3
	jr nc,L_B9E9		;b9e5
	ld a,004h		;b9e7
L_B9E9:
	ld b,a			;b9e9
L_B9EA:
	ld a,(hl)			;b9ea   ; (HL) - B; a cero o por debajo, p03:BA52
	sub b			;b9eb
	ld (hl),a			;b9ec
	jp c,L_BA52		;b9ed
	and a			;b9f0
	jp nz,0730fh		;b9f1   ; si queda algo, p01:730F
	jp L_BA52		;b9f4

; ----------------------------------------------------------------------
; DATOS resto_B9F7: tablas cortas que apuntan p03:B8C9 (0xB9F7); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:B8C9 (21
;   bytes)
;   0xb9f7..0xba0c  (21 bytes)
DATA_resto_B9F7:
	defb 002h,020h,00fh,004h,018h,007h,005h,010h,007h,006h,010h,007h,00bh,010h,007h,00ch	; b9f7  . ..............
	defb 010h,007h,00dh,010h,007h	; ba07

; ======================================================================
; CODIGO 0xba0c..0xbff1  (1509 bytes)
; ======================================================================


pisa_actor:		; en accion 0 o 2, los tipos 2 y 4 junto al personaje
	ld a,(0c24bh)		;ba0c   ; lee la accion del personaje (4 muere, 5 escalera)
	and a			;ba0f
	jr z,L_BA15		;ba10
	cp 002h		;ba12
	ret nz			;ba14
L_BA15:
	ld a,(ix+000h)		;ba15   ; lee el tipo del actor
	cp 002h		;ba18
	jr z,L_BA5A		;ba1a
	cp 004h		;ba1c
	ret nz			;ba1e
	ld a,(ix+005h)		;ba1f   ; lee la X del actor
	sub d			;ba22
	jr nc,L_BA27		;ba23
	neg		;ba25
L_BA27:
	cp 00ch		;ba27
	ret nc			;ba29
	push de			;ba2a
	call 073fdh		;ba2b   ; caja_del_personaje: la caja del personaje segun 0xC253 y 0xC240 (p01:7429)
	pop de			;ba2e
	exx			;ba2f
	ld a,e			;ba30
	add a,a			;ba31
	exx			;ba32
	ld l,a			;ba33
	ld a,(ix+01bh)		;ba34
	and a			;ba37
	jr nz,L_BA49		;ba38
	ld a,(ix+008h)		;ba3a   ; lee la velocidad Y del actor (alta)
	rla			;ba3d
	ret c			;ba3e
	ld a,e			;ba3f
	sub l			;ba40
	sub (ix+003h)		;ba41   ; le resta la Y del actor
	cp 0f0h		;ba44
	ret c			;ba46
	jr L_BA52		;ba47
L_BA49:
	ld a,e			;ba49
	sub l			;ba4a
	add a,008h		;ba4b
	ld e,a			;ba4d
	call 0704ch		;ba4e   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ret nc			;ba51
L_BA52:
	call 047ebh		;ba52   ; byte_5_del_personaje: A = el byte 5 de la ficha del personaje que se lleva
	ld (hl),000h		;ba55
	jp 04752h		;ba57   ; barra_de_vida: la barra de la vida (byte 5 de la ficha) en (0x2A, 6) (p00:4758)
L_BA5A:
	ld a,(ix+005h)		;ba5a   ; lee la X del actor
	sub d			;ba5d
	jr nc,L_BA62		;ba5e
	neg		;ba60
L_BA62:
	cp 018h		;ba62
	ret nc			;ba64
	push de			;ba65
	call 073fdh		;ba66   ; caja_del_personaje: la caja del personaje segun 0xC253 y 0xC240 (p01:7429)
	pop de			;ba69
	exx			;ba6a
	ld a,e			;ba6b
	add a,a			;ba6c
	exx			;ba6d
	ld l,a			;ba6e
	ld a,e			;ba6f
	sub l			;ba70
	sub (ix+003h)		;ba71   ; le resta la Y del actor
	cp 0fch		;ba74
	ret c			;ba76
	jr L_BA52		;ba77
pared_al_empujar:		; las casillas a 6 puntos del personaje al empujarlo
	ld a,(ix+01bh)		;ba79
	and a			;ba7c
	ret z			;ba7d
L_BA7E:
	ld a,(ix+00ah)		;ba7e   ; lee la velocidad X del actor (alta)
	rla			;ba81
L_BA82:
	ld c,006h		;ba82
	jr nc,L_BA88		;ba84
	ld c,0fah		;ba86
L_BA88:
	ld a,(0c246h)		;ba88   ; lee la X del personaje
	add a,c			;ba8b
	ld d,a			;ba8c
	ld a,(0c244h)		;ba8d   ; lee la Y del personaje
	sub 008h		;ba90
	ld e,a			;ba92
	push de			;ba93
	call 0704ch		;ba94   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop de			;ba97
	ret c			;ba98
	ld a,e			;ba99
	sub 010h		;ba9a
	ld e,a			;ba9c
	jp 0704ch		;ba9d   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
tipo_2_o_negativo:		; segun el tipo, p03:BA7E o p03:BA82
	ld a,(ix+000h)		;baa0   ; lee el tipo del actor
	cp 002h		;baa3
	jr z,L_BA7E		;baa5
	rla			;baa7
	ccf			;baa8
	jr L_BA82		;baa9
L_BAAB:
	djnz L_BAB6		;baab
	dec (ix+016h)		;baad
	ret nz			;bab0
	ld hl,00108h		;bab1
	jr L_BB30		;bab4
L_BAB6:
	djnz L_BAD0		;bab6
	dec (ix+016h)		;bab8
	ret nz			;babb
	call 08b7eh		;babc   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	xor a			;babf
	ld (ix+00dh),a		;bac0   ; guarda la aceleracion Y del actor (alta)
	ld (ix+00ch),040h		;bac3   ; la aceleracion Y del actor = 0x40
	inc a			;bac7
	ld (ix+006h),a		;bac8   ; guarda si el actor se mueve (p02:8367)
	ld (ix+00bh),a		;bacb   ; guarda si el actor acelera (p02:8393)
	jr L_BAEB		;bace
L_BAD0:
	djnz L_BAF2		;bad0
	ld d,(ix+005h)		;bad2   ; lee la X del actor
	ld a,(ix+003h)		;bad5   ; lee la Y del actor
	cp 0d0h		;bad8
	jr nc,L_BAF8		;bada
	add a,004h		;badc
	ld e,a			;bade
	call 0704ch		;badf   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ret nc			;bae2
	ld (ix+016h),008h		;bae3
	ld (ix+006h),000h		;bae7   ; si el actor se mueve (p02:8367) = 0x00
L_BAEB:
	inc (ix+010h)		;baeb   ; sube el fotograma del actor (p02:8A42)
	inc (ix+001h)		;baee   ; sube el paso del actor
	ret			;baf1
L_BAF2:
	djnz L_BB0E		;baf2
	dec (ix+016h)		;baf4
	ret nz			;baf7
L_BAF8:
	xor a			;baf8
	ld (ix+003h),0f0h		;baf9   ; la Y del actor = 0xF0
	ld (ix+006h),a		;bafd   ; guarda si el actor se mueve (p02:8367)
	ld (ix+001h),005h		;bb00   ; el paso del actor = 0x05
	ld (ix+010h),a		;bb04   ; guarda el fotograma del actor (p02:8A42)
	ld a,(ix+011h)		;bb07   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ld (ix+016h),a		;bb0a
	ret			;bb0d
L_BB0E:
	djnz L_BB1F		;bb0e
	dec (ix+016h)		;bb10
	ret nz			;bb13
	ld a,(ix+018h)		;bb14
	ld (ix+003h),a		;bb17   ; guarda la Y del actor
	ld (ix+001h),000h		;bb1a   ; el paso del actor = 0x00
	ret			;bb1e
L_BB1F:
	ld a,(ix+003h)		;bb1f   ; lee la Y del actor
	ld (ix+018h),a		;bb22
	xor a			;bb25
	ld (ix+008h),a		;bb26   ; guarda la velocidad Y del actor (alta)
	inc a			;bb29
	ld (ix+013h),a		;bb2a   ; guarda las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	ld hl,00008h		;bb2d
L_BB30:
	ld (ix+010h),h		;bb30   ; guarda el fotograma del actor (p02:8A42)
	ld (ix+016h),l		;bb33
	inc (ix+001h)		;bb36   ; sube el paso del actor
	ret			;bb39
L_BB3A:
	djnz L_BBB5		;bb3a
	ld a,(0c00dh)		;bb3c   ; lee la cuenta de cuadros del juego
	and 003h		;bb3f
	jr nz,L_BB55		;bb41
	ld a,(ix+00ah)		;bb43   ; lee la velocidad X del actor (alta)
	rla			;bb46
	ld a,001h		;bb47
	jr nc,L_BB4D		;bb49
	ld a,0ffh		;bb4b
L_BB4D:
	add a,(ix+010h)		;bb4d   ; le suma el fotograma del actor (p02:8A42)
	and 003h		;bb50
	ld (ix+010h),a		;bb52   ; guarda el fotograma del actor (p02:8A42)
L_BB55:
	ld a,(ix+005h)		;bb55   ; lee la X del actor
	sub 0f0h		;bb58
	cp 020h		;bb5a
	jp c,L_BC0D		;bb5c
	ld a,(ix+005h)		;bb5f   ; lee la X del actor
	sub 010h		;bb62
	ld d,a			;bb64
	ld e,(ix+003h)		;bb65   ; lee la Y del actor
	push de			;bb68
	call 0704ch		;bb69   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop de			;bb6c
	jr c,L_BB87		;bb6d
	ld a,d			;bb6f
	add a,01fh		;bb70
	ld d,a			;bb72
	call 0704ch		;bb73   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	jr c,L_BB87		;bb76
L_BB78:
	xor a			;bb78
	ld (ix+00ah),a		;bb79   ; guarda la velocidad X del actor (alta)
	ld (ix+016h),a		;bb7c
	ld (ix+008h),002h		;bb7f   ; la velocidad Y del actor (alta) = 0x02
	inc (ix+001h)		;bb83   ; sube el paso del actor
	ret			;bb86
L_BB87:
	ld a,(ix+00ah)		;bb87   ; lee la velocidad X del actor (alta)
	rla			;bb8a
	ld a,010h		;bb8b
	jr nc,L_BB91		;bb8d
	neg		;bb8f
L_BB91:
	add a,(ix+005h)		;bb91   ; le suma la X del actor
	ld d,a			;bb94
	ld a,(ix+003h)		;bb95   ; lee la Y del actor
	sub 018h		;bb98
	ld e,a			;bb9a
	push de			;bb9b
	call 0704ch		;bb9c   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop de			;bb9f
	jr c,L_BBAA		;bba0
	ld a,e			;bba2
	add a,010h		;bba3
	ld e,a			;bba5
	call 0704ch		;bba6   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ret nc			;bba9
L_BBAA:
	call 08b03h		;bbaa   ; sonido_0a: el sonido 0x0A (p02:8B0D)
	inc (ix+016h)		;bbad
L_BBB0:
	ld a,01fh		;bbb0
	jp 056e3h		;bbb2   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_BBB5:
	djnz L_BBE0		;bbb5
	ld a,(ix+005h)		;bbb7   ; lee la X del actor
	cp 0e0h		;bbba
	jr nc,L_BC0D		;bbbc
	ld e,(ix+003h)		;bbbe   ; lee la Y del actor
	ld d,(ix+005h)		;bbc1   ; lee la X del actor
	call 0704ch		;bbc4   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ret nc			;bbc7
	ld (ix+008h),000h		;bbc8   ; la velocidad Y del actor (alta) = 0x00
	ld a,(0c246h)		;bbcc   ; lee la X del personaje
	sub (ix+005h)		;bbcf   ; le resta la X del actor
	ld a,002h		;bbd2
	jr nc,L_BBD8		;bbd4
	ld a,0feh		;bbd6
L_BBD8:
	ld (ix+00ah),a		;bbd8   ; guarda la velocidad X del actor (alta)
	dec (ix+001h)		;bbdb   ; baja el paso del actor
	jr L_BBB0		;bbde
L_BBE0:
	ld a,(0c246h)		;bbe0   ; lee la X del personaje
	cp 080h		;bbe3
	ld hl,02002h		;bbe5
	call c,08b31h		;bbe8   ; niega_hl: HL = -HL
	ld (ix+005h),h		;bbeb   ; guarda la X del actor
	ld (ix+003h),020h		;bbee   ; la Y del actor = 0x20
	ld (ix+00ah),l		;bbf2   ; guarda la velocidad X del actor (alta)
	ld (ix+006h),001h		;bbf5   ; si el actor se mueve (p02:8367) = 0x01
	ld (ix+013h),001h		;bbf9   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x01
	inc (ix+001h)		;bbfd   ; sube el paso del actor
	ld d,(ix+005h)		;bc00   ; lee la X del actor
	ld e,(ix+003h)		;bc03   ; lee la Y del actor
	call 0704ch		;bc06   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ret c			;bc09
	jp L_BB78		;bc0a
L_BC0D:
	push ix		;bc0d
	pop hl			;bc0f
	inc hl			;bc10
	ld b,01fh		;bc11
L_BC13:
	ld (hl),000h		;bc13
	inc l			;bc15
	djnz L_BC13		;bc16
	ret			;bc18
L_BC19:
	djnz L_BC41		;bc19
	ld a,(ix+012h)		;bc1b   ; lee la vida del actor (p01:721A)
	and a			;bc1e
	jr nz,L_BC2F		;bc1f
	dec (ix+011h)		;bc21   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;bc24
	ld (ix+011h),048h		;bc25   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x48
	call 08b03h		;bc29   ; sonido_0a: el sonido 0x0A (p02:8B0D)
	jp 08affh		;bc2c   ; sonido_08: el sonido 8 (p02:8B0D)
L_BC2F:
	ld (ix+011h),01eh		;bc2f   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x1E
	inc (ix+001h)		;bc33   ; sube el paso del actor
	call 08b7eh		;bc36   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	call 08b89h		;bc39   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	ld a,01eh		;bc3c
	jp 056e3h		;bc3e   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_BC41:
	djnz L_BC57		;bc41   ; cada 8 cuadros de (ix+0x11), 1 o 2
	ld a,(ix+011h)		;bc43   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	and 008h		;bc46
	ld a,001h		;bc48
	jr z,L_BC4D		;bc4a
	inc a			;bc4c
L_BC4D:
	ld (ix+010h),a		;bc4d   ; guarda el fotograma del actor (p02:8A42)
	dec (ix+011h)		;bc50   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;bc53
	jp 076dah		;bc54   ; libera_piezas: libera en 0xCC80 las piezas (ix+0x20) del actor
L_BC57:
	inc (ix+001h)		;bc57   ; sube el paso del actor
	inc (ix+006h)		;bc5a   ; sube si el actor se mueve (p02:8367)
	ld (ix+011h),048h		;bc5d   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x48
	ld (ix+013h),001h		;bc61   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x01
	ld a,(ix+017h)		;bc65
	dec a			;bc68
	ld hl,0ff80h		;bc69
	jp z,08b82h		;bc6c   ; pon_velocidad_y: (ix+7, 8) = HL
	dec a			;bc6f
	ld hl,00080h		;bc70
	jp z,08b82h		;bc73   ; pon_velocidad_y: (ix+7, 8) = HL
	dec a			;bc76
	ld hl,0ff80h		;bc77
	jp z,08b8dh		;bc7a   ; pon_velocidad_x: (ix+9, 0x0A) = HL
	dec a			;bc7d
	ld hl,00080h		;bc7e
	jp 08b8dh		;bc81   ; pon_velocidad_x: (ix+9, 0x0A) = HL
L_BC84:
	djnz L_BC9C		;bc84
	dec (ix+011h)		;bc86   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;bc89
	call 08b03h		;bc8a   ; sonido_0a: el sonido 0x0A (p02:8B0D)
	ld a,(ix+017h)		;bc8d
	xor 001h		;bc90
	ld (ix+017h),a		;bc92
espera_de_15:		; (ix+0x11) = (ix+0x15)
	ld a,(ix+015h)		;bc95
	ld (ix+011h),a		;bc98   ; guarda la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret			;bc9b
L_BC9C:
	inc (ix+001h)		;bc9c   ; sube el paso del actor
	inc (ix+006h)		;bc9f   ; sube si el actor se mueve (p02:8367)
	call espera_de_15		;bca2   ; espera_de_15: (ix+0x11) = (ix+0x15)
	ld a,(ix+017h)		;bca5
	ld de,00100h		;bca8
	and a			;bcab
	call nz,08b39h		;bcac   ; niega_de: DE = -DE
	ld (ix+00ah),d		;bcaf   ; guarda la velocidad X del actor (alta)
	ld (ix+009h),e		;bcb2   ; guarda la velocidad X del actor
	ret			;bcb5
L_BCB6:
	djnz L_BCE1		;bcb6
	ld a,(ix+008h)		;bcb8   ; lee la velocidad Y del actor (alta)
	rla			;bcbb
	jr c,L_BCD0		;bcbc
	ld a,(ix+003h)		;bcbe   ; lee la Y del actor
	cp (ix+019h)		;bcc1
	ret c			;bcc4
	ld hl,0ff00h		;bcc5
	call 08b82h		;bcc8   ; pon_velocidad_y: (ix+7, 8) = HL
	ld (ix+00bh),000h		;bccb   ; si el actor acelera (p02:8393) = 0x00
	ret			;bccf
L_BCD0:
	ld a,(ix+003h)		;bcd0   ; lee la Y del actor
	cp (ix+018h)		;bcd3
	ret nc			;bcd6
	ld (ix+00bh),001h		;bcd7   ; si el actor acelera (p02:8393) = 0x01
	ld hl,00100h		;bcdb
	jp 08b82h		;bcde   ; pon_velocidad_y: (ix+7, 8) = HL
L_BCE1:
	inc (ix+001h)		;bce1   ; sube el paso del actor
	inc (ix+006h)		;bce4   ; sube si el actor se mueve (p02:8367)
	ld a,(ix+015h)		;bce7
	ld (ix+011h),a		;bcea   ; guarda la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ld a,(ix+017h)		;bced
	ld hl,00100h		;bcf0
	ld b,001h		;bcf3
	and a			;bcf5
	jr nz,L_BCFC		;bcf6
	dec b			;bcf8
	call 08b31h		;bcf9   ; niega_hl: HL = -HL
L_BCFC:
	call 08b82h		;bcfc   ; pon_velocidad_y: (ix+7, 8) = HL
	ld (ix+00bh),b		;bcff   ; guarda si el actor acelera (p02:8393)
	ld bc,00020h		;bd02
	ld (ix+00dh),b		;bd05   ; guarda la aceleracion Y del actor (alta)
	ld (ix+00ch),c		;bd08   ; guarda la aceleracion Y del actor
	ld a,(ix+017h)		;bd0b
	and a			;bd0e
	ld a,(ix+003h)		;bd0f   ; lee la Y del actor
	jr z,L_BD1E		;bd12
	ld (ix+018h),a		;bd14
	add a,(ix+015h)		;bd17
	ld (ix+019h),a		;bd1a
	ret			;bd1d
L_BD1E:
	ld (ix+019h),a		;bd1e
	sub (ix+015h)		;bd21
	ld (ix+018h),a		;bd24
	ret			;bd27
L_BD28:
	djnz L_BD3B		;bd28
	ld b,010h		;bd2a
	ld a,(ix+01bh)		;bd2c
	and a			;bd2f
	ret z			;bd30
	inc (ix+001h)		;bd31   ; sube el paso del actor
	inc (ix+006h)		;bd34   ; sube si el actor se mueve (p02:8367)
	inc (ix+00bh)		;bd37   ; sube si el actor acelera (p02:8393)
	ret			;bd3a
L_BD3B:
	djnz L_BD3E		;bd3b
	ret			;bd3d
L_BD3E:
	inc (ix+001h)		;bd3e   ; sube el paso del actor
	call 08b7eh		;bd41   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	ld de,00040h		;bd44
	ld (ix+00dh),d		;bd47   ; guarda la aceleracion Y del actor (alta)
	ld (ix+00ch),e		;bd4a   ; guarda la aceleracion Y del actor
	ret			;bd4d
L_BD4E:
	ld a,(0c00dh)		;bd4e   ; lee la cuenta de cuadros del juego
	and 002h		;bd51
	ld c,000h		;bd53
	jr z,L_BD58		;bd55
	inc c			;bd57
L_BD58:
	push bc			;bd58
	call 05421h		;bd59   ; con_13_14_15_segun_c: con 13-14-15: p15:B411 o la otra tabla segun C
	pop bc			;bd5c
	djnz L_BD6C		;bd5d
	dec (ix+016h)		;bd5f
	ret nz			;bd62
	inc (ix+013h)		;bd63   ; sube las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	ld (ix+016h),002h		;bd66
	jr L_BD99		;bd6a
L_BD6C:
	djnz L_BD93		;bd6c
	dec (ix+016h)		;bd6e
	ret nz			;bd71
	inc (ix+010h)		;bd72   ; sube el fotograma del actor (p02:8A42)
	ld a,(ix+010h)		;bd75   ; lee el fotograma del actor (p02:8A42)
	cp 004h		;bd78
	ld c,03ch		;bd7a
	jr z,L_BD84		;bd7c
	cp 008h		;bd7e
	jr nc,L_BD88		;bd80
	ld c,002h		;bd82
L_BD84:
	ld (ix+016h),c		;bd84
	ret			;bd87
L_BD88:
	xor a			;bd88
	ld (ix+001h),a		;bd89   ; guarda el paso del actor
	ld (ix+010h),a		;bd8c   ; guarda el fotograma del actor (p02:8A42)
	ld (ix+013h),a		;bd8f   ; guarda las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	ret			;bd92
L_BD93:
	ld a,(ix+011h)		;bd93   ; lee la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ld (ix+016h),a		;bd96
L_BD99:
	inc (ix+001h)		;bd99   ; sube el paso del actor
	ret			;bd9c
L_BD9D:
	djnz L_BDDF		;bd9d
	ld a,(0c00dh)		;bd9f   ; lee la cuenta de cuadros del juego
	and 007h		;bda2
	ret nz			;bda4
	inc (ix+016h)		;bda5
	inc (ix+016h)		;bda8
L_BDAB:
	ld d,(ix+005h)		;bdab   ; lee la X del actor
	ld e,(ix+003h)		;bdae   ; lee la Y del actor
	push de			;bdb1
	ld a,(ix+016h)		;bdb2
	and 007h		;bdb5
	add a,d			;bdb7
	ld d,a			;bdb8
	ld b,007h		;bdb9
	ld hl,0a858h		;bdbb
L_BDBE:
	push hl			;bdbe
	push de			;bdbf
	push bc			;bdc0
	ld bc,00808h		;bdc1
	call 04841h		;bdc4   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	pop bc			;bdc7
	pop de			;bdc8
	pop hl			;bdc9
	ld a,d			;bdca
	add a,008h		;bdcb
	ld d,a			;bdcd
	djnz L_BDBE		;bdce
	pop de			;bdd0
	ld a,094h		;bdd1
	call 04d86h		;bdd3   ; caracter_de_la_fuente: el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
	ld a,d			;bdd6
	add a,038h		;bdd7
	ld d,a			;bdd9
	ld a,096h		;bdda
	jp 04d86h		;bddc   ; caracter_de_la_fuente: el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
L_BDDF:
	djnz L_BDEC		;bddf
	ld a,(0c00dh)		;bde1   ; lee la cuenta de cuadros del juego
	and 007h		;bde4
	ret nz			;bde6
	dec (ix+016h)		;bde7
	jr L_BDAB		;bdea
L_BDEC:
	ld a,(ix+017h)		;bdec
	and a			;bdef
	ld bc,001ffh		;bdf0
	jr z,L_BDF8		;bdf3
	ld bc,00208h		;bdf5
L_BDF8:
	ld (ix+001h),b		;bdf8   ; guarda el paso del actor
	ld (ix+016h),c		;bdfb
	ret			;bdfe
L_BDFF:
	dec b			;bdff
	jr z,L_BE27		;be00
	ld a,(ix+01fh)		;be02
	and a			;be05
	ret z			;be06
	call copia_hueco_enemigo		;be07   ; copia_hueco_enemigo: copia 16 x 24 del hueco del enemigo (p01:780D) a su posicion
	call dibujo_8800		;be0a   ; dibujo_8800: copia 16 x 16 de (0x88, 0) a la posicion del actor con TIMP
	ld (ix+011h),008h		;be0d   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x08
	inc (ix+001h)		;be11   ; sube el paso del actor
	ld hl,0cca3h		;be14
	ld a,(hl)			;be17
	and a			;be18
	ld a,01ah		;be19
	jr z,L_BE1F		;be1b
	ld a,01bh		;be1d
L_BE1F:
	call 056e3h		;be1f   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld a,(hl)			;be22
	xor 001h		;be23
	ld (hl),a			;be25
	ret			;be26
L_BE27:
	dec (ix+011h)		;be27   ; baja la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret nz			;be2a
	call copia_hueco_enemigo		;be2b   ; copia_hueco_enemigo: copia 16 x 24 del hueco del enemigo (p01:780D) a su posicion
	call 077f9h		;be2e   ; dibujo_del_actor_78: copia 16 x 16 de (0x78, 0) con TIMP a la X e Y del actor
	xor a			;be31
	ld (ix+001h),a		;be32   ; guarda el paso del actor
	ld (ix+01fh),a		;be35
	ret			;be38
copia_hueco_enemigo:		; copia 16 x 24 del hueco del enemigo (p01:780D) a su posicion
	call 0780dh		;be39   ; hueco_del_enemigo: DE = la posicion del dibujo del enemigo segun su numero en 0xCD00
	ex de,hl			;be3c
	ld d,(ix+005h)		;be3d   ; lee la X del actor
	ld a,(ix+003h)		;be40   ; lee la Y del actor
	sub 008h		;be43
	ld e,a			;be45
	ld bc,01018h		;be46
	jp 04841h		;be49   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
dibujo_8800:		; copia 16 x 16 de (0x88, 0) a la posicion del actor con TIMP
	ld hl,00088h		;be4c
	ld d,(ix+005h)		;be4f   ; lee la X del actor
	ld a,(ix+003h)		;be52   ; lee la Y del actor
	sub 008h		;be55
	ld e,a			;be57
	ld bc,01010h		;be58
	ld a,048h		;be5b
	jp 04c73h		;be5d   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
L_BE60:
	ld a,(ix+012h)		;be60   ; lee la vida del actor (p01:721A)
	and a			;be63
	ret z			;be64
	djnz L_BECE		;be65
	ld b,(ix+016h)		;be67
	ld l,(ix+003h)		;be6a   ; lee la Y del actor
	ld a,(ix+005h)		;be6d   ; lee la X del actor
	add a,00fh		;be70
	sub b			;be72
	ld h,a			;be73
	push hl			;be74
	ld bc,0100fh		;be75
	call 04b0ch		;be78   ; linea_vertical: LINE (0x70) vertical (ARG = 1) de B puntos en (H, L), color C
	pop hl			;be7b
	ld a,(ix+016h)		;be7c
	add a,a			;be7f
	inc a			;be80
	add a,h			;be81
	ld h,a			;be82
	ld bc,0100fh		;be83
	call 04b0ch		;be86   ; linea_vertical: LINE (0x70) vertical (ARG = 1) de B puntos en (H, L), color C
	inc (ix+016h)		;be89
	ld a,(ix+016h)		;be8c
	cp 008h		;be8f
	jr z,L_BE9E		;be91
	cp 010h		;be93
	ret c			;be95
	inc (ix+001h)		;be96   ; sube el paso del actor
	ld bc,00400h		;be99
	jr L_BEA1		;be9c
L_BE9E:
	ld bc,00201h		;be9e
L_BEA1:
	ld a,(ix+003h)		;bea1   ; lee la Y del actor
	sub 014h		;bea4
	and 0f8h		;bea6
	ld h,000h		;bea8
	ld l,a			;beaa
	add hl,hl			;beab
	add hl,hl			;beac
	ld a,(ix+005h)		;bead   ; lee la X del actor
	and 0f8h		;beb0
	rrca			;beb2
	rrca			;beb3
	rrca			;beb4
	call 04083h		;beb5   ; hl_mas_a: HL = HL + A
	ld a,l			;beb8
	add a,c			;beb9
	ld l,a			;beba
	ld de,0d200h		;bebb   ; apunta a el mapa de 32 x 24 fichas de la pantalla
	add hl,de			;bebe
	ld d,h			;bebf
	ld e,l			;bec0
	ld a,020h		;bec1
	call 04088h		;bec3   ; de_mas_a: DE = DE + A
	xor a			;bec6
L_BEC7:
	ld (hl),a			;bec7   ; B bytes de A en HL y en DE
	ld (de),a			;bec8
	inc hl			;bec9
	inc de			;beca
	djnz L_BEC7		;becb
	ret			;becd
L_BECE:
	djnz L_BED1		;bece
	ret			;bed0
L_BED1:
	ld (ix+016h),000h		;bed1
	inc (ix+001h)		;bed5   ; sube el paso del actor
	ld a,019h		;bed8
	jp 056e3h		;beda   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_BEDD:
	ld a,(ix+017h)		;bedd
	rla			;bee0
	jr c,L_BF4F		;bee1
	djnz L_BEF1		;bee3
	ld a,(ix+019h)		;bee5
	add a,(ix+015h)		;bee8
	cp (ix+005h)		;beeb   ; compara con la X del actor
	ret nc			;beee
	jr L_BF33		;beef
L_BEF1:
	djnz L_BEFF		;bef1
	ld a,(ix+018h)		;bef3
	add a,(ix+014h)		;bef6
	cp (ix+003h)		;bef9   ; compara con la Y del actor
	ret nc			;befc
	jr L_BF41		;befd
L_BEFF:
	djnz L_BF0A		;beff
	ld a,(ix+019h)		;bf01
	cp (ix+005h)		;bf04   ; compara con la X del actor
	ret c			;bf07
	jr L_BF2C		;bf08
L_BF0A:
	djnz L_BF15		;bf0a
	ld a,(ix+018h)		;bf0c
	cp (ix+003h)		;bf0f   ; compara con la Y del actor
	ret c			;bf12
	jr L_BF26		;bf13
L_BF15:
	ld (ix+006h),001h		;bf15   ; si el actor se mueve (p02:8367) = 0x01
	ld a,(ix+017h)		;bf19
	and 07fh		;bf1c
	jr z,L_BF2C		;bf1e
	dec a			;bf20
	jr z,L_BF33		;bf21
	dec a			;bf23
	jr z,L_BF41		;bf24
L_BF26:
	ld hl,00100h		;bf26
	ld a,h			;bf29
	jr L_BF46		;bf2a
L_BF2C:
	ld hl,0ff00h		;bf2c
	ld a,004h		;bf2f
	jr L_BF38		;bf31
L_BF33:
	ld hl,00100h		;bf33
	ld a,002h		;bf36
L_BF38:
	ld (ix+001h),a		;bf38   ; guarda el paso del actor
	call 08b82h		;bf3b   ; pon_velocidad_y: (ix+7, 8) = HL
	jp 08b89h		;bf3e   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
L_BF41:
	ld hl,0ff00h		;bf41
	ld a,003h		;bf44
L_BF46:
	ld (ix+001h),a		;bf46   ; guarda el paso del actor
	call 08b8dh		;bf49   ; pon_velocidad_x: (ix+9, 0x0A) = HL
	jp 08b7eh		;bf4c   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
L_BF4F:
	djnz L_BF5A		;bf4f
	ld a,(ix+019h)		;bf51
	cp (ix+005h)		;bf54   ; compara con la X del actor
	ret c			;bf57
	jr L_BF33		;bf58
L_BF5A:
	djnz L_BF68		;bf5a
	ld a,(ix+018h)		;bf5c
	add a,(ix+014h)		;bf5f
	cp (ix+003h)		;bf62   ; compara con la Y del actor
	ret nc			;bf65
	jr L_BF92		;bf66
L_BF68:
	djnz L_BF76		;bf68
	ld a,(ix+019h)		;bf6a
	add a,(ix+015h)		;bf6d
	cp (ix+005h)		;bf70   ; compara con la X del actor
	ret nc			;bf73
	jr L_BF2C		;bf74
L_BF76:
	djnz L_BF81		;bf76
	ld a,(ix+018h)		;bf78
	cp (ix+003h)		;bf7b   ; compara con la Y del actor
	ret c			;bf7e
	jr L_BF99		;bf7f
L_BF81:
	ld (ix+006h),001h		;bf81   ; si el actor se mueve (p02:8367) = 0x01
	ld a,(ix+017h)		;bf85
	and 07fh		;bf88
	jr z,L_BF2C		;bf8a
	dec a			;bf8c
	jr z,L_BF33		;bf8d
	dec a			;bf8f
	jr z,L_BF99		;bf90
L_BF92:
	ld hl,00100h		;bf92
	ld a,003h		;bf95
	jr L_BF46		;bf97
L_BF99:
	ld hl,0ff00h		;bf99
	ld a,001h		;bf9c
	jr L_BF46		;bf9e
L_BFA0:
	ld d,(ix+005h)		;bfa0   ; lee la X del actor
	ld e,(ix+003h)		;bfa3   ; lee la Y del actor
	call 0704ch		;bfa6   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	jr nc,L_BFB0		;bfa9
	ld (ix+006h),000h		;bfab   ; si el actor se mueve (p02:8367) = 0x00
	ret			;bfaf
L_BFB0:
	call tabla_por_estado		;bfb0   ; tabla_por_estado: HL = p03:BFF1[byte 6 del personaje]
	call 08b82h		;bfb3   ; pon_velocidad_y: (ix+7, 8) = HL
	ld a,(ix+01bh)		;bfb6
	ld (ix+006h),a		;bfb9   ; guarda si el actor se mueve (p02:8367)
	and a			;bfbc
	ret z			;bfbd
	push ix		;bfbe
	pop hl			;bfc0
	ld a,l			;bfc1
	rla			;bfc2
	ld a,080h		;bfc3
	jr nc,L_BFC8		;bfc5
	xor a			;bfc7
L_BFC8:
	add a,002h		;bfc8
	ld l,a			;bfca
	ld e,(hl)			;bfcb
	inc l			;bfcc
	ld d,(hl)			;bfcd
	ld a,(hl)			;bfce
	cp 044h		;bfcf
	ret c			;bfd1
	push hl			;bfd2
	call tabla_por_estado		;bfd3   ; tabla_por_estado: HL = p03:BFF1[byte 6 del personaje]
	call 08b31h		;bfd6   ; niega_hl: HL = -HL
	add hl,de			;bfd9
	ex de,hl			;bfda
	pop hl			;bfdb
	ld (hl),d			;bfdc
	dec hl			;bfdd
	ld (hl),e			;bfde
	ret			;bfdf
tabla_por_estado:		; HL = p03:BFF1[byte 6 del personaje]
	ld b,006h		;bfe0
	call 047edh		;bfe2   ; byte_del_personaje: A = el byte B de la ficha del personaje que se lleva (0xC2B0 + 0xC240 * 32)
	add a,a			;bfe5
	ld hl,0bff1h		;bfe6
	call 04083h		;bfe9   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;bfec
	inc hl			;bfed
	ld h,(hl)			;bfee
	ld l,a			;bfef
	ret			;bff0

; ----------------------------------------------------------------------
; DATOS resto_BFF1: tablas cortas que apuntan p03:BFE6 (0xBFF1); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p03:BFE6 (15
;   bytes)
;   0xbff1..0xc000  (15 bytes)
DATA_resto_BFF1:
	defb 000h,002h,000h,001h,080h,000h,000h,002h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff1  ...............
