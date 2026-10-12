; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 00 (se ejecuta en 0x4000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x04000


; ----------------------------------------------------------------------
; DATOS cabecera: la cabecera del cartucho: "AB", INIT = 0x4097 (p00:4097),
;   STATEMENT, DEVICE y TEXT a 0 y 6 bytes reservados; la BIOS la lee al
;   encender
;   0x4000..0x4010  (16 bytes)
DATA_cabecera:
	defb 041h,042h,097h,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4000  AB.@............

; ----------------------------------------------------------------------
; DATOS segunda_cabecera: "CD", la palabra 0x5307 (bytes 07 53: el numero
;   RC-753) y nueve bytes mas: BC 00 C0, 04 1D C2, 05 02 C0, que tienen la
;   forma [n][direccion] (0xBC bytes en 0xC000, 4 en 0xC21D, 5 en 0xC002).
;   Este cartucho no los lee: p06:B78D lee los dos bytes de 0x4012 de los
;   OTROS cartuchos (RDSLT) y los compara con 07 49, 07 50, 07 51 y 07 52
;   0x4010..0x401d  (13 bytes)
DATA_segunda_cabecera:
	defb 043h,044h,007h,053h,0bch,000h,0c0h,004h,01dh,0c2h,005h,002h,0c0h	; 4010  CD.S.........

; ----------------------------------------------------------------------
; DATOS relleno_cabecera: 32 bytes a 0xFF hasta p00:403D, la interrupcion
;   0x401d..0x403d  (32 bytes)
DATA_relleno_cabecera:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 401d  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 402d  ................

; ======================================================================
; CODIGO 0x403d..0x40f4  (183 bytes)
; ======================================================================


interrupcion:		; gancho H.TIMI: la musica con 13-14-15 (p13:6000) y, si no esta ya dentro, el cuadro del juego
	di			;403d
	ld hl,0c00bh		;403e   ; apunta a dentro de la interrupcion (bit 0)
	bit 0,(hl)		;4041
	ld (hl),001h		;4043
	jp nz,L_4081		;4045
	di			;4048
	ld a,00dh		;4049
	ld (06000h),a		;404b   ; el mapper: pone en 0x6000 el banco de A
	inc a			;404e
	ld (08000h),a		;404f   ; el mapper: pone en 0x8000 el banco de A
	inc a			;4052
	ld (0a000h),a		;4053   ; el mapper: pone en 0xA000 el banco de A
	call 06000h		;4056   ; motor_de_sonido: un cuadro de sonido: el mezclador y los cuatro canales (0xC010-0xC016)
	di			;4059
	ld a,(0f0f1h)		;405a   ; lee la copia del banco de 0x6000
	ld (06000h),a		;405d   ; el mapper: pone en 0x6000 el banco de A
	ld a,(0f0f2h)		;4060   ; lee la copia del banco de 0x8000
	ld (08000h),a		;4063   ; el mapper: pone en 0x8000 el banco de A
	ld a,(0f0f3h)		;4066   ; lee la copia del banco de 0xA000
	ld (0a000h),a		;4069   ; el mapper: pone en 0xA000 el banco de A
	xor a			;406c
	ld (0c00bh),a		;406d   ; guarda dentro de la interrupcion (bit 0)
	ld hl,0c005h		;4070   ; apunta a dentro del cuadro del juego (bit 0)
	bit 0,(hl)		;4073
	jp nz,L_4081		;4075
	inc (hl)			;4078
	ei			;4079
	call cuadro		;407a   ; cuadro: un cuadro del juego: despacha el estado 0xC000 (tabla p00:40F4)
	xor a			;407d
	ld (0c005h),a		;407e   ; guarda dentro del cuadro del juego (bit 0)
L_4081:
	ei			;4081
	ret			;4082
hl_mas_a:		; HL = HL + A
	add a,l			;4083
	ld l,a			;4084
	ret nc			;4085
	inc h			;4086
	ret			;4087
de_mas_a:		; DE = DE + A
	add a,e			;4088
	ld e,a			;4089
	ret nc			;408a
	inc d			;408b
	ret			;408c
despacha:		; salta a la palabra A de la tabla pegada detras del `call`
	pop hl			;408d
	add a,a			;408e
	call hl_mas_a		;408f   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;4092
	inc hl			;4093
	ld h,(hl)			;4094
	ld l,a			;4095
	jp (hl)			;4096
init:		; INIT del cartucho: SCREEN 5, borra la RAM, engancha H.TIMI y se queda en `jr $`
	di			;4097
	ld sp,0f0f0h		;4098
	call 00138h		;409b   ; BIOS RSLREG - Reads the primary slot register
	rrca			;409e
	rrca			;409f
	and 003h		;40a0
	ld c,a			;40a2
	ld b,000h		;40a3
	ld hl,0fcc1h		;40a5
	add hl,bc			;40a8
	ld a,(hl)			;40a9
	and 080h		;40aa
	or c			;40ac
	ld c,a			;40ad
	inc hl			;40ae
	inc hl			;40af
	inc hl			;40b0
	inc hl			;40b1
	ld a,(hl)			;40b2
	and 00ch		;40b3
	or c			;40b5
	ld h,080h		;40b6
	call 00024h		;40b8   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld hl,0c000h		;40bb   ; apunta a el estado del juego
	ld de,0c001h		;40be   ; apunta a el paso del estado
	ld bc,030efh		;40c1
	ld (hl),000h		;40c4
	ldir		;40c6
	call inicia_video		;40c8   ; inicia_video: SCREEN 5 por CHGMOD, borra las dos paginas y pone R#1, R#5, R#6 y R#11
	di			;40cb
	ld a,0c3h		;40cc
	ld (0fd9fh),a		;40ce
	ld hl,interrupcion		;40d1
	ld (0fda0h),hl		;40d4
	xor a			;40d7
	ld (0f3dbh),a		;40d8
	call bancos_1_2_3		;40db   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_40DE:
	jr L_40DE		;40de
cuadro:		; un cuadro del juego: despacha el estado 0xC000 (tabla p00:40F4)
	ld hl,0c003h		;40e0   ; apunta a la cuenta de cuadros
	inc (hl)			;40e3
	ld bc,(0c000h)		;40e4   ; lee el estado del juego y el byte siguiente (16 bits)
	ld a,c			;40e8
	cp 003h		;40e9
	jr nc,L_40F1		;40eb
	ld hl,0461dh		;40ed
	push hl			;40f0
L_40F1:
	call despacha		;40f1   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

; ----------------------------------------------------------------------
; DATOS saltos_40F4: tabla de 14 palabras del despachador (call 0x408D en
;   0x40F1); lo leen L_408D (28 bytes)
;   0x40f4..0x4110  (28 bytes)
DATA_saltos_40F4:
	defb 010h,041h	; 40f4
	defb 083h,041h	; 40f6
	defb 08bh,041h	; 40f8
	defb 0b1h,041h	; 40fa
	defb 0e4h,041h	; 40fc
	defb 088h,043h	; 40fe
	defb 0c5h,043h	; 4100
	defb 01dh,044h	; 4102
	defb 080h,044h	; 4104
	defb 0a3h,044h	; 4106
	defb 0e0h,044h	; 4108
	defb 07fh,045h	; 410a
	defb 0a4h,045h	; 410c
	defb 003h,046h	; 410e

; ======================================================================
; CODIGO 0x4110..0x4575  (1125 bytes)
; ======================================================================


L_4110:
	djnz L_4127		;4110
	call bancos_4_5_6		;4112   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 09483h		;4115
	call bancos_1_2_3		;4118   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c242h)		;411b
	or a			;411e
	ret z			;411f
	call carga_la_fuente		;4120   ; carga_la_fuente: con 13-14-15: la fuente (p14:9289) y los caracteres del marcador
	xor a			;4123
	jp espera_y_sigue		;4124   ; espera_y_sigue: 0xC004 = A y pasa al siguiente paso (0xC001 + 1)
L_4127:
	djnz L_4141		;4127
	ld hl,0c004h		;4129   ; apunta a la espera del estado, en cuadros
	dec (hl)			;412c
	ret nz			;412d
	call graficos_del_titulo		;412e   ; graficos_del_titulo: la fuente, CHGCLR y las fichas del titulo
	call bancos_4_5_6		;4131   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 09748h		;4134
	call 096eah		;4137
	call bancos_1_2_3		;413a   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	xor a			;413d
	jp espera_y_sigue		;413e   ; espera_y_sigue: 0xC004 = A y pasa al siguiente paso (0xC001 + 1)
L_4141:
	djnz L_415F		;4141
	call bancos_4_5_6		;4143   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 09755h		;4146
	call 09792h		;4149
	ld hl,0ca00h		;414c
	ld a,(hl)			;414f
	and a			;4150
	jp z,bancos_1_2_3		;4151   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld (hl),000h		;4154
	call 09837h		;4156
	call bancos_1_2_3		;4159   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	xor a			;415c
	jr espera_y_sigue		;415d
L_415F:
	djnz L_4175		;415f
	call bancos_4_5_6		;4161   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 09840h		;4164
	call bancos_1_2_3		;4167   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld hl,0ca01h		;416a
	ld a,(hl)			;416d
	and a			;416e
	ret z			;416f
	xor a			;4170
	ld (hl),a			;4171
	jp L_4360		;4172
L_4175:
	call apaga_y_borra		;4175   ; apaga_y_borra: esconde los sprites y borra la pagina 0 con la pantalla apagada
	call bancos_4_5_6		;4178   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0941ch		;417b
	call bancos_1_2_3		;417e   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	jr siguiente_paso		;4181
L_4183:
	ld hl,0c004h		;4183   ; apunta a la espera del estado, en cuadros
	dec (hl)			;4186
	ret nz			;4187
	jp L_435E		;4188
L_418B:
	djnz L_41A1		;418b
	call en_la_fase		;418d   ; en_la_fase: si 0xC215 es cero: p01:6033, p01:605A y p06:B66A con el 6, y la tecla 0x10 de 0xC00E
	ld a,(0c214h)		;4190   ; lee en marcha la fase
	or a			;4193
	ret nz			;4194
estado_0:		; vuelve al estado 0 (0xC000 = 0) con 0x20 cuadros de espera
	xor a			;4195
pon_estado:		; 0xC000 = A y 0x20 cuadros de espera en 0xC004
	ld (0c000h),a		;4196   ; guarda el estado del juego
	ld a,020h		;4199
	ld (0c004h),a		;419b   ; guarda la espera del estado, en cuadros
	jp L_4367		;419e
L_41A1:
	call apaga_y_borra		;41a1   ; apaga_y_borra: esconde los sprites y borra la pagina 0 con la pantalla apagada
	call demo_siguiente		;41a4   ; demo_siguiente: la ruina de la demo (0xC203, 0-4) y su primera fase
	ld a,020h		;41a7
espera_y_sigue:		; 0xC004 = A y pasa al siguiente paso (0xC001 + 1)
	ld (0c004h),a		;41a9   ; guarda la espera del estado, en cuadros
siguiente_paso:		; 0xC001 + 1: el siguiente paso del estado
	ld hl,0c001h		;41ac   ; apunta a el paso del estado
	inc (hl)			;41af
	ret			;41b0
L_41B1:
	djnz L_41C4		;41b1
	ld hl,0c004h		;41b3   ; apunta a la espera del estado, en cuadros
	dec (hl)			;41b6
	jr z,siguiente_paso		;41b7
	bit 2,(hl)		;41b9
	ld hl,050a4h		;41bb
	jp z,texto		;41be   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	jp texto_sin_color		;41c1   ; texto_sin_color: como p00:4D4A con C = 0
L_41C4:
	djnz L_41DB		;41c4
	call borra_partida		;41c6   ; borra_partida: pone a cero 0xC202-0xEFFF, la ruina 0 y la pantalla 1
	call personajes_al_empezar		;41c9   ; personajes_al_empezar: con 6: las dos fichas de personaje de p06:BF6C a 0xC2B0 y 0xC2D0
	call bancos_4_5_6		;41cc   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0b751h		;41cf
	call bancos_1_2_3		;41d2   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	call bonus_de_cartucho		;41d5   ; bonus_de_cartucho: 0xC259 = 0x100 si 0xC205 tiene el bit 0 (cartucho 07 49 en otra ranura, p06:B78D)
	jp L_435E		;41d8
L_41DB:
	ld a,08ah		;41db
	call sonido		;41dd   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld a,050h		;41e0
	jr espera_y_sigue		;41e2
L_41E4:
	exx			;41e4
	call lee_mandos		;41e5   ; lee_mandos: fuera de partida (0xC002 bit 6 a cero) salta a p01:6017; si no lee mandos y teclado a 0xC006/0xC007
	exx			;41e8
	djnz L_421C		;41e9
	call bancos_4_5_6		;41eb   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 06085h		;41ee
	push af			;41f1
	call bancos_1_2_3		;41f2   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	pop af			;41f5
	ret nc			;41f6
	ld hl,0c220h		;41f7   ; apunta a la escena (0-11)
	inc (hl)			;41fa
	call apaga_y_borra		;41fb   ; apaga_y_borra: esconde los sprites y borra la pagina 0 con la pantalla apagada
	call bancos_4_5_6		;41fe   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 09665h		;4201
	call bancos_1_2_3		;4204   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c21dh)		;4207   ; lee la ruina (0-4)
	or a			;420a
	jp z,siguiente_paso		;420b   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
	call bancos_4_5_6		;420e   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 07390h		;4211   ; pantalla_73b4: paleta, mapa p05:93C6, el dibujo y el texto p04:73BD
	call 0a249h		;4214
	call bancos_1_2_3		;4217   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	jr siguiente_paso		;421a
L_421C:
	djnz L_4254		;421c
	ld a,(0c21dh)		;421e   ; lee la ruina (0-4)
	or a			;4221
	jr z,L_423A		;4222
	call bancos_4_5_6		;4224   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0966eh		;4227
	call 0a28ah		;422a
	call bancos_1_2_3		;422d   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c8a6h)		;4230   ; lee el texto a maquina ha acabado
	and a			;4233
	ret z			;4234
	ld a,(0c006h)		;4235   ; lee las teclas nuevas
	and a			;4238
	ret z			;4239
L_423A:
	call bancos_4_5_6		;423a   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0b870h		;423d
	call 0b865h		;4240
	call bancos_1_2_3		;4243   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_4246:
	call apaga_y_borra_todo		;4246   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call 060edh		;4249
	ld a,089h		;424c
	call sonido		;424e   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	jp siguiente_paso		;4251   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
L_4254:
	djnz L_4270		;4254
	ld a,(0c00eh)		;4256   ; lee las teclas especiales
	rra			;4259
	jp c,L_432D		;425a
	call 06124h		;425d
	ret nc			;4260
	call 061b1h		;4261
	call bancos_4_5_6		;4264   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0bb1eh		;4267
	call bancos_1_2_3		;426a   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	jp siguiente_paso		;426d   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
L_4270:
	djnz L_42B7		;4270
	call bancos_4_5_6		;4272   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0bb64h		;4275
	call bancos_1_2_3		;4278   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c22ah)		;427b
	and a			;427e
	ret z			;427f
	dec a			;4280
	jr z,L_4291		;4281
	call bancos_4_5_6		;4283   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0bb78h		;4286   ; copia_6078: copia 0x94 x 0x1C de (0x78, 0x60) a (0x42, 0x36)
	call bancos_1_2_3		;4289   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld hl,0c001h		;428c   ; apunta a el paso del estado
	dec (hl)			;428f
	ret			;4290
L_4291:
	ld a,(0cc10h)		;4291   ; lee la pantalla de la antesala (0-2)
	cp 002h		;4294
	jr nc,L_42A2		;4296
	ld a,(0c2b0h)		;4298   ; lee la ficha del personaje 0 (14 bytes)
	ld b,a			;429b
	ld a,(0c2d0h)		;429c   ; lee la ficha del personaje 1 (14 bytes)
	or b			;429f
	jr nz,L_42B0		;42a0
L_42A2:
	call bancos_4_5_6		;42a2   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0bb84h		;42a5
	call bancos_1_2_3		;42a8   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,078h		;42ab
	jp espera_y_sigue		;42ad   ; espera_y_sigue: 0xC004 = A y pasa al siguiente paso (0xC001 + 1)
L_42B0:
	ld a,006h		;42b0
	ld (0c001h),a		;42b2   ; guarda el paso del estado
	jr L_4304		;42b5
L_42B7:
	djnz L_42F7		;42b7
	ld a,(0e322h)		;42b9   ; lee las puertas abiertas de la antesala
	and a			;42bc
	jr nz,L_42C9		;42bd
	ld a,(0c2b0h)		;42bf   ; lee la ficha del personaje 0 (14 bytes)
	ld b,a			;42c2
	ld a,(0c2d0h)		;42c3   ; lee la ficha del personaje 1 (14 bytes)
	or b			;42c6
	jr nz,L_42B0		;42c7
L_42C9:
	ld a,(0c006h)		;42c9   ; lee las teclas nuevas
	and a			;42cc
	jr nz,L_42D4		;42cd
	ld hl,0c004h		;42cf   ; apunta a la espera del estado, en cuadros
	dec (hl)			;42d2
	ret nz			;42d3
L_42D4:
	ld a,(0e322h)		;42d4   ; lee las puertas abiertas de la antesala
	and a			;42d7
	jr z,L_42E9		;42d8
	call bancos_4_5_6		;42da   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0bb78h		;42dd   ; copia_6078: copia 0x94 x 0x1C de (0x78, 0x60) a (0x42, 0x36)
	call bancos_1_2_3		;42e0   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,003h		;42e3
	ld (0c001h),a		;42e5   ; guarda el paso del estado
	ret			;42e8
L_42E9:
	call bancos_4_5_6		;42e9   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0bb84h		;42ec
	call bancos_1_2_3		;42ef   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,078h		;42f2
	jp espera_y_sigue		;42f4   ; espera_y_sigue: 0xC004 = A y pasa al siguiente paso (0xC001 + 1)
L_42F7:
	djnz L_4316		;42f7
	ld a,(0c006h)		;42f9   ; lee las teclas nuevas
	and a			;42fc
	jr nz,L_4304		;42fd
	ld hl,0c004h		;42ff   ; apunta a la espera del estado, en cuadros
	dec (hl)			;4302
	ret nz			;4303
L_4304:
	call borra_personajes		;4304   ; borra_personajes: pone a cero 0xC240-0xC258
	call 0611dh		;4307
	call bancos_4_5_6		;430a   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0a410h		;430d
	call bancos_1_2_3		;4310   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	jp siguiente_paso		;4313   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
L_4316:
	djnz L_433E		;4316
	call bancos_4_5_6		;4318   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0a581h		;431b
	call bancos_1_2_3		;431e   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c23bh)		;4321
	and a			;4324
	ret z			;4325
	xor a			;4326
	ld (0c8a0h),a		;4327   ; guarda el texto a maquina en marcha
	jp siguiente_paso		;432a   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
L_432D:
	call bancos_4_5_6		;432d   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 09ed6h		;4330
	call bancos_1_2_3		;4333   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	call marco_del_marcador		;4336   ; marco_del_marcador: los rectangulos y lineas del marcador, sus caracteres y el nombre de la ruina
	ld a,00dh		;4339
	jp pon_estado		;433b   ; pon_estado: 0xC000 = A y 0x20 cuadros de espera en 0xC004
L_433E:
	djnz L_434B		;433e
	call 08100h		;4340
	ld a,(0c8a6h)		;4343   ; lee el texto a maquina ha acabado
	and a			;4346
	ret z			;4347
	jp siguiente_paso		;4348   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
L_434B:
	djnz L_436C		;434b
	call 0617bh		;434d
	call apaga_y_borra_todo		;4350   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call entra_en_fase		;4353   ; entra_en_fase: graficos, paleta, sprites, mapa y metabloques de la fase; pantalla 1
	call musica_de_fase		;4356   ; musica_de_fase: la musica de la ruina segun el personaje (p15:BE7A), o la de la sala 5
	ld hl,0c214h		;4359   ; apunta a en marcha la fase
	ld (hl),001h		;435c
L_435E:
	ld a,020h		;435e
L_4360:
	ld (0c004h),a		;4360   ; guarda la espera del estado, en cuadros
	ld hl,0c000h		;4363   ; apunta a el estado del juego
	inc (hl)			;4366
L_4367:
	xor a			;4367
	ld (0c001h),a		;4368   ; guarda el paso del estado
	ret			;436b
L_436C:
	call apaga_y_borra		;436c   ; apaga_y_borra: esconde los sprites y borra la pagina 0 con la pantalla apagada
	call carga_la_fuente		;436f   ; carga_la_fuente: con 13-14-15: la fuente (p14:9289) y los caracteres del marcador
	call lista_af81		;4372   ; lista_af81: con 10-11-12: la lista p12:AF81
	call paleta_base		;4375   ; paleta_base: con 4-5-6: la paleta p06:B335
	call bancos_4_5_6		;4378   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 071d2h		;437b   ; escena_de_la_ruina: la escena de la ruina (p04:71EA) y p04:71D5
	call bancos_1_2_3		;437e   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	xor a			;4381
	ld (0c21fh),a		;4382
	jp siguiente_paso		;4385   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
L_4388:
	call 0605ah		;4388
	ld a,(0c217h)		;438b
	and a			;438e
	ld a,00ah		;438f
	jp nz,pon_estado		;4391   ; pon_estado: 0xC000 = A y 0x20 cuadros de espera en 0xC004
	ld a,(0c216h)		;4394
	and a			;4397
	ld a,009h		;4398
	jp nz,pon_estado		;439a   ; pon_estado: 0xC000 = A y 0x20 cuadros de espera en 0xC004
	call bancos_4_5_6		;439d   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0b66ah		;43a0
	call bancos_1_2_3		;43a3   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c215h)		;43a6   ; lee el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	and a			;43a9
	ld a,008h		;43aa
	jp nz,pon_estado		;43ac   ; pon_estado: 0xC000 = A y 0x20 cuadros de espera en 0xC004
	ld a,(0c008h)		;43af   ; lee la pausa
	and a			;43b2
	jr nz,L_43BD		;43b3
	ld a,(0c214h)		;43b5   ; lee en marcha la fase
	or a			;43b8
	jp z,L_435E		;43b9
	ret			;43bc
L_43BD:
	call pantalla_de_informacion		;43bd
	ld a,00bh		;43c0
	jp pon_estado		;43c2   ; pon_estado: 0xC000 = A y 0x20 cuadros de espera en 0xC004
L_43C5:
	djnz L_43E7		;43c5
	call bancos_4_5_6		;43c7   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0bbfbh		;43ca
	push af			;43cd
	call bancos_1_2_3		;43ce   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	pop af			;43d1
	ret nc			;43d2
	ld a,(0cc10h)		;43d3   ; lee la pantalla de la antesala (0-2)
	add a,a			;43d6
	inc a			;43d7
	ld b,a			;43d8
	ld a,(0cc13h)		;43d9   ; lee la X en la antesala
	rla			;43dc
	jr nc,L_43E0		;43dd
	inc b			;43df
L_43E0:
	ld a,b			;43e0
	ld (0c208h),a		;43e1
	jp L_44B8		;43e4
L_43E7:
	xor a			;43e7
	ld (0c20ah),a		;43e8   ; guarda en la sala de la puerta 5
	ld (0c208h),a		;43eb
	call ninguno_vivo		;43ee   ; ninguno_vivo: acarreo si las fichas de los dos personajes (0xC2B0 y 0xC2D0) son cero
	jr c,L_440A		;43f1
	call apaga_y_borra_todo		;43f3   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call 060edh		;43f6
	call bancos_4_5_6		;43f9   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0bbd2h		;43fc
	call bancos_1_2_3		;43ff   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,089h		;4402
	call sonido		;4404   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	jp siguiente_paso		;4407   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
L_440A:
	ld a,08eh		;440a
	call sonido		;440c   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	jp L_435E		;440f
ninguno_vivo:		; acarreo si las fichas de los dos personajes (0xC2B0 y 0xC2D0) son cero
	ld a,(0c2b0h)		;4412   ; lee la ficha del personaje 0 (14 bytes)
	ld b,a			;4415
	ld a,(0c2d0h)		;4416   ; lee la ficha del personaje 1 (14 bytes)
	and b			;4419
	ret z			;441a
	scf			;441b
	ret			;441c
L_441D:
	exx			;441d
	call lee_mandos		;441e   ; lee_mandos: fuera de partida (0xC002 bit 6 a cero) salta a p01:6017; si no lee mandos y teclado a 0xC006/0xC007
	exx			;4421
	djnz L_445E		;4422
	ld a,(0c205h)		;4424   ; lee los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	and 004h		;4427
	jr z,L_443D		;4429
	ld a,(0c00eh)		;442b   ; lee las teclas especiales
	and 010h		;442e
	jr z,L_443D		;4430
	ld a,001h		;4432
	ld (0c20ch),a		;4434
	ld hl,05095h		;4437
	call texto_sin_color		;443a   ; texto_sin_color: como p00:4D4A con C = 0
L_443D:
	ld a,(0c003h)		;443d   ; lee la cuenta de cuadros
	rra			;4440
	ret c			;4441
	ld hl,0c004h		;4442   ; apunta a la espera del estado, en cuadros
	dec (hl)			;4445
	ret nz			;4446
	ld a,(0c205h)		;4447   ; lee los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	and 004h		;444a
	jr z,L_4454		;444c
	ld a,(0c20ch)		;444e
	and a			;4451
	jr nz,L_4477		;4452
L_4454:
	ld hl,0c002h		;4454   ; apunta a las banderas (bit 6: en partida)
	ld a,(hl)			;4457
	and 0bfh		;4458
	ld (hl),a			;445a
	jp estado_0		;445b   ; estado_0: vuelve al estado 0 (0xC000 = 0) con 0x20 cuadros de espera
L_445E:
	call apaga_y_borra		;445e   ; apaga_y_borra: esconde los sprites y borra la pagina 0 con la pantalla apagada
	ld hl,05088h		;4461
	call texto		;4464   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	ld a,(0c205h)		;4467   ; lee los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	and 004h		;446a
	ld hl,05095h		;446c
	call nz,texto		;446f   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	ld a,0b4h		;4472
	jp espera_y_sigue		;4474   ; espera_y_sigue: 0xC004 = A y pasa al siguiente paso (0xC001 + 1)
L_4477:
	call personajes_al_empezar		;4477   ; personajes_al_empezar: con 6: las dos fichas de personaje de p06:BF6C a 0xC2B0 y 0xC2D0
	xor a			;447a
	ld (0c20ch),a		;447b
	jr L_449A		;447e
L_4480:
	call banco_9_en_a000		;4480   ; banco_9_en_a000: pone el banco 9 en 0xA000
	call 0b8cch		;4483
	call bancos_1_2_3		;4486   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	call cambia_de_pantalla		;4489   ; cambia_de_pantalla: pinta la pantalla nueva: mapa, actores, objetos y sprites
	xor a			;448c
	ld (0c215h),a		;448d   ; guarda el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld hl,0c226h		;4490   ; apunta a se sale de la fase
	ld a,(hl)			;4493
	and a			;4494
	jp z,L_459C		;4495
	ld (hl),000h		;4498
L_449A:
	ld hl,00204h		;449a
	ld (0c000h),hl		;449d   ; guarda el estado del juego y el byte siguiente (16 bits)
	jp L_4246		;44a0
L_44A3:
	exx			;44a3
	call lee_mandos		;44a4   ; lee_mandos: fuera de partida (0xC002 bit 6 a cero) salta a p01:6017; si no lee mandos y teclado a 0xC006/0xC007
	exx			;44a7
	djnz L_44BF		;44a8
	call bancos_4_5_6		;44aa   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0bc4eh		;44ad
	call bancos_1_2_3		;44b0   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c31ch)		;44b3
	and a			;44b6
	ret nz			;44b7
L_44B8:
	ld hl,00304h		;44b8
	ld (0c000h),hl		;44bb   ; guarda el estado del juego y el byte siguiente (16 bits)
	ret			;44be
L_44BF:
	call 06154h		;44bf
	call apaga_y_borra_todo		;44c2   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call 060f3h		;44c5
	call bancos_4_5_6		;44c8   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0bc0ch		;44cb
	call bancos_1_2_3		;44ce   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	xor a			;44d1
	ld (0c21ch),a		;44d2   ; guarda el jefe vencido (no queda ningun 0x19)
	ld (0c216h),a		;44d5
	ld a,089h		;44d8
	call sonido		;44da   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	jp siguiente_paso		;44dd   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
L_44E0:
	exx			;44e0
	call lee_mandos		;44e1   ; lee_mandos: fuera de partida (0xC002 bit 6 a cero) salta a p01:6017; si no lee mandos y teclado a 0xC006/0xC007
	exx			;44e4
	djnz L_451E		;44e5
	call 0615ch		;44e7
	ret c			;44ea
	xor a			;44eb
	ld (0c217h),a		;44ec
	ld (0c8abh),a		;44ef
	ld (0cc10h),a		;44f2   ; guarda la pantalla de la antesala (0-2)
	ld (0c21ch),a		;44f5   ; guarda el jefe vencido (no queda ningun 0x19)
	ld hl,0c21dh		;44f8   ; apunta a la ruina (0-4)
	inc (hl)			;44fb
	push hl			;44fc
	call estados_de_la_ruina		;44fd   ; estados_de_la_ruina: el estado de los dos personajes al entrar en la ruina (p00:4575)
	pop hl			;4500
	ld a,(hl)			;4501
	push af			;4502
	call apaga_y_borra_todo		;4503   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	pop af			;4506
	cp 005h		;4507
	ld a,004h		;4509
	jp c,pon_estado		;450b   ; pon_estado: 0xC000 = A y 0x20 cuadros de espera en 0xC004
	call bancos_4_5_6		;450e   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	xor a			;4511
	ld (0c21fh),a		;4512
	call 071d2h		;4515   ; escena_de_la_ruina: la escena de la ruina (p04:71EA) y p04:71D5
	call bancos_1_2_3		;4518   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	jp siguiente_paso		;451b   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
L_451E:
	djnz L_4539		;451e
	call bancos_4_5_6		;4520   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 06085h		;4523
	push af			;4526
	call bancos_1_2_3		;4527   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	pop af			;452a
	ret nc			;452b
	ld a,(0c21dh)		;452c   ; lee la ruina (0-4)
	cp 005h		;452f
	ld a,004h		;4531
	jp c,pon_estado		;4533   ; pon_estado: 0xC000 = A y 0x20 cuadros de espera en 0xC004
	jp L_4454		;4536
L_4539:
	xor a			;4539
	ld (0c20ah),a		;453a   ; guarda en la sala de la puerta 5
	call borra_e000		;453d   ; borra_e000: pone a cero 0xE000-0xE07F
	call 06154h		;4540
	call apaga_y_borra_todo		;4543   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call 060f3h		;4546
	ld a,(0c21dh)		;4549   ; lee la ruina (0-4)
	cp 004h		;454c
	ld a,08bh		;454e
	jr c,L_4554		;4550
	ld a,08ch		;4552
L_4554:
	call sonido		;4554   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	call bancos_4_5_6		;4557   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0baf2h		;455a
	call bancos_1_2_3		;455d   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	jp siguiente_paso		;4560   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
estados_de_la_ruina:		; el estado de los dos personajes al entrar en la ruina (p00:4575)
	ld a,(0c21dh)		;4563   ; lee la ruina (0-4)
	ld hl,04575h		;4566
	call palabra_a		;4569   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,l			;456c
	ld (0c2b6h),a		;456d   ; guarda el estado del personaje 0
	ld a,h			;4570
	ld (0c2d6h),a		;4571   ; guarda el estado del personaje 1
	ret			;4574

; ----------------------------------------------------------------------
; DATOS por_ruina_c2b6: 5 x 2 bytes: p00:4563 los copia a 0xC2B6 y 0xC2D6
;   segun la ruina (0xC21D); lo leen p00:4563 (10 bytes)
;   0x4575..0x457f  (10 bytes)
DATA_por_ruina_c2b6:
	defb 001h,001h	; 4575
	defb 000h,001h	; 4577
	defb 001h,003h	; 4579
	defb 003h,002h	; 457b
	defb 001h,001h	; 457d

; ======================================================================
; CODIGO 0x457f..0x4846  (711 bytes)
; ======================================================================


L_457F:
	call lee_mandos		;457f   ; lee_mandos: fuera de partida (0xC002 bit 6 a cero) salta a p01:6017; si no lee mandos y teclado a 0xC006/0xC007
	call bancos_4_5_6		;4582   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 09ffbh		;4585
	call bancos_1_2_3		;4588   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c00eh)		;458b   ; lee las teclas especiales
	rra			;458e
	ret nc			;458f
	xor a			;4590
	ld (0c008h),a		;4591   ; guarda la pausa
	call vuelve_a_la_fase		;4594   ; vuelve_a_la_fase: graficos, paleta, mapa y pantalla de la fase y sus actores
	ld a,0feh		;4597
	call sonido		;4599   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_459C:
	call pantalla_encendida		;459c   ; pantalla_encendida: R#1 con el bit 6 (pantalla) y sprites encendidos
	ld a,005h		;459f
	jp pon_estado		;45a1   ; pon_estado: 0xC000 = A y 0x20 cuadros de espera en 0xC004
L_45A4:
	dec b			;45a4
	jr z,L_45B3		;45a5
	call bancos_4_5_6		;45a7   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0a2fch		;45aa
	call bancos_1_2_3		;45ad   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	jp siguiente_paso		;45b0   ; siguiente_paso: 0xC001 + 1: el siguiente paso del estado
L_45B3:
	call bancos_4_5_6		;45b3   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0a32ah		;45b6
	call bancos_1_2_3		;45b9   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0e379h)		;45bc
	and a			;45bf
	ret z			;45c0
	ld a,(0e37ah)		;45c1
	and a			;45c4
	jp nz,L_4454		;45c5
	call pantalla_apagada		;45c8   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	ld a,(0e379h)		;45cb
	push af			;45ce
	call borra_partida		;45cf   ; borra_partida: pone a cero 0xC202-0xEFFF, la ruina 0 y la pantalla 1
	call personajes_al_empezar		;45d2   ; personajes_al_empezar: con 6: las dos fichas de personaje de p06:BF6C a 0xC2B0 y 0xC2D0
	call paleta_base		;45d5   ; paleta_base: con 4-5-6: la paleta p06:B335
	pop af			;45d8
	ld (0c21dh),a		;45d9   ; guarda la ruina (0-4)
	call carga_la_fuente		;45dc   ; carga_la_fuente: con 13-14-15: la fuente (p14:9289) y los caracteres del marcador
	call estados_de_la_ruina		;45df   ; estados_de_la_ruina: el estado de los dos personajes al entrar en la ruina (p00:4575)
	call bancos_4_5_6		;45e2   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0b751h		;45e5
	call bancos_1_2_3		;45e8   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	call bonus_de_cartucho		;45eb   ; bonus_de_cartucho: 0xC259 = 0x100 si 0xC205 tiene el bit 0 (cartucho 07 49 en otra ranura, p06:B78D)
	ld hl,00204h		;45ee
	ld (0c000h),hl		;45f1   ; guarda el estado del juego y el byte siguiente (16 bits)
	jp L_423A		;45f4
bonus_de_cartucho:		; 0xC259 = 0x100 si 0xC205 tiene el bit 0 (cartucho 07 49 en otra ranura, p06:B78D)
	ld a,(0c205h)		;45f7   ; 0xC205 bit 0: hay un cartucho 07 49 en otra ranura (p06:B78D)
	rra			;45fa
	ret nc			;45fb
	ld hl,00100h		;45fc   ; con el, se empieza con 0x100 en 0xC259
	ld (0c259h),hl		;45ff   ; guarda las monedas (16 bits) y el byte siguiente (16 bits)
	ret			;4602
L_4603:
	call lee_mandos		;4603   ; lee_mandos: fuera de partida (0xC002 bit 6 a cero) salta a p01:6017; si no lee mandos y teclado a 0xC006/0xC007
	call bancos_4_5_6		;4606   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 09ffbh		;4609
	call bancos_1_2_3		;460c   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c00eh)		;460f   ; lee las teclas especiales
	rra			;4612
	ret nc			;4613
	call apaga_y_borra_todo		;4614   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call 060edh		;4617
	jp L_44B8		;461a
vuelta_de_estado:		; lo que corre tras los estados 0-2 (p00:40ED la deja en la pila): lee los mandos y empieza la partida
	call lee_joystick_y_teclado		;461d   ; lee_joystick_y_teclado: A = mando del puerto 1 (PSG 14) con las teclas del cursor y espacio
	ld hl,0c201h		;4620
	call teclas_nuevas		;4623   ; teclas_nuevas: (HL) = las teclas de A; (HL - 1) = las que no estaban antes
	or a			;4626
	ret z			;4627
	ld hl,0c004h		;4628   ; apunta a la espera del estado, en cuadros
	ld (hl),000h		;462b
	ld hl,0c000h		;462d   ; apunta a el estado del juego
	ld b,(hl)			;4630
	djnz L_464A		;4631
	and 030h		;4633
	ret z			;4635
	ld c,a			;4636
	ld a,040h		;4637
	ld (0c002h),a		;4639   ; guarda las banderas (bit 6: en partida)
	ld a,c			;463c
	and 010h		;463d
	ld a,003h		;463f
	jr nz,L_4645		;4641
	ld a,00ch		;4643
L_4645:
	ld (hl),a			;4645
	inc hl			;4646
	ld (hl),000h		;4647
	ret			;4649
L_464A:
	ld (hl),001h		;464a
	ld a,000h		;464c
	call sonido		;464e   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	call graficos_del_titulo		;4651   ; graficos_del_titulo: la fuente, CHGCLR y las fichas del titulo
	call paleta_b550		;4654   ; paleta_b550: con 4-5-6: la paleta p06:B550
	call bancos_4_5_6		;4657   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 096eah		;465a
	ld hl,05068h		;465d
	call texto		;4660   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	jp bancos_1_2_3		;4663   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
borra_partida:		; pone a cero 0xC202-0xEFFF, la ruina 0 y la pantalla 1
	ld hl,0c202h		;4666
	ld bc,02dfeh		;4669
	ld d,h			;466c
	ld e,l			;466d
	inc e			;466e
	ld (hl),000h		;466f
	ldir		;4671
	xor a			;4673
	ld (0c21dh),a		;4674   ; guarda la ruina (0-4)
	ld (0cc10h),a		;4677   ; guarda la pantalla de la antesala (0-2)
	ld hl,0c212h		;467a   ; apunta a la pantalla de la fase (desde 1)
	inc a			;467d
	ld (hl),a			;467e
	dec hl			;467f
	ld (hl),a			;4680
	ret			;4681
pinta_marcador:		; el texto de p00:5062, los marcos y las cifras del marcador
	ld hl,05062h		;4682
	call texto		;4685   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	call marco_de_cifras		;4688   ; marco_de_cifras: rectangulo y lineas del recuadro de cifras
	ld hl,00068h		;468b
	ld de,0c403h		;468e
	ld bc,01010h		;4691
	call copia_de_pagina_1		;4694   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	call dos_cifras_dobles		;4697   ; dos_cifras_dobles: las cifras de 0xC25A y 0xC259 en grande (p00:47FE)
	call barra_del_personaje		;469a   ; barra_del_personaje: la barra de 4 del byte 6 del personaje (p00:4891)
	jp L_4752		;469d
marco_del_marcador:		; los rectangulos y lineas del marcador, sus caracteres y el nombre de la ruina
	ld hl,00000h		;46a0
	ld de,00014h		;46a3
	ld c,00ah		;46a6
	call rectangulo		;46a8   ; rectangulo: los cuatro lados de un rectangulo (p00:4B8E y p00:4B98)
	call caracteres_de_p07		;46ab   ; caracteres_de_p07: con 7-8-9: los 2 x 5 caracteres de p07:6014 y p07:603C
	call nombre_de_la_ruina		;46ae   ; nombre_de_la_ruina: con 13-14-15: el texto de p15:BE3D[ruina]
	ld hl,05002h		;46b1
	ld de,06010h		;46b4
	call rectangulo_color_d		;46b7   ; rectangulo_color_d: p00:4B74 con el color 0x0D
	ld hl,07002h		;46ba
	ld bc,0100dh		;46bd
	push bc			;46c0
	call linea_vertical		;46c1   ; linea_vertical: LINE (0x70) vertical (ARG = 1) de B puntos en (H, L), color C
	pop bc			;46c4
	ld hl,09002h		;46c5
	call linea_vertical		;46c8   ; linea_vertical: LINE (0x70) vertical (ARG = 1) de B puntos en (H, L), color C
	ld b,005h		;46cb
	ld c,000h		;46cd
	ld d,050h		;46cf
L_46D1:
	ld a,c			;46d1   ; la puerta C de la antesala: su registro de 8 bytes en 0xE328
	ld hl,0e329h		;46d2
	add a,a			;46d5
	add a,a			;46d6
	add a,a			;46d7
	call hl_mas_a		;46d8   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;46db   ; abierta (no cero) o cerrada: el color del recuadro, 0xBB o 0xAA
	and a			;46dc
	ld e,0bbh		;46dd
	jr z,L_46E3		;46df
	ld e,0aah		;46e1
L_46E3:
	inc l			;46e3   ; la X de la puerta / 8 mas D: donde va su marca en el marcador
	ld a,(hl)			;46e4
	srl a		;46e5
	srl a		;46e7
	srl a		;46e9
	add a,d			;46eb
	push de			;46ec
	exx			;46ed
	pop de			;46ee
	ld h,a			;46ef
	ld l,00ch		;46f0
	ld a,e			;46f2
	ld bc,00605h		;46f3
	call rellena_rectangulo		;46f6   ; la marca: un rectangulo de 6 x 5 (HMMV) con el color de E
	exx			;46f9
	ld a,c			;46fa   ; con el bit 0 de C (la puerta impar) la marca va 0x20 a la derecha
	rra			;46fb
	jr nc,L_4702		;46fc
	ld a,d			;46fe
	add a,020h		;46ff
	ld d,a			;4701
L_4702:
	inc c			;4702
	djnz L_46D1		;4703
	ld hl,0300dh		;4705
	ld de,06094h		;4708
	ld bc,0a004h		;470b
	ld a,004h		;470e
	call copia_rectangulo		;4710   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
L_4713:
	ld de,0300dh		;4713
	ld hl,06094h		;4716
	ld bc,0a004h		;4719
	call copia_de_pagina_1		;471c   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	ld a,(0cc13h)		;471f   ; lee la X en la antesala
	srl a		;4722
	srl a		;4724
	srl a		;4726
	add a,050h		;4728
	ld h,a			;472a
	ld a,(0cc10h)		;472b   ; lee la pantalla de la antesala (0-2)
	add a,a			;472e
	add a,a			;472f
	add a,a			;4730
	add a,a			;4731
	add a,a			;4732
	add a,h			;4733
	ld h,a			;4734
	dec h			;4735
	ld l,00dh		;4736
	ld de,00204h		;4738
rectangulo_color_d:		; p00:4B74 con el color 0x0D
	ld c,00dh		;473b
	jp rectangulo		;473d   ; rectangulo: los cuatro lados de un rectangulo (p00:4B8E y p00:4B98)
nombre_de_la_ruina:		; con 13-14-15: el texto de p15:BE3D[ruina]
	call bancos_13_14_15		;4740   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	ld a,(0c21dh)		;4743   ; lee la ruina (0-4)
	ld hl,0be3dh		;4746
	call palabra_a		;4749   ; palabra_a: HL = la palabra A de la tabla HL
	call texto		;474c   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	jp bancos_1_2_3		;474f   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_4752:
	ld de,02a06h		;4752
	call byte_5_del_personaje		;4755   ; byte_5_del_personaje: A = el byte 5 de la ficha del personaje que se lleva
L_4758:
	srl a		;4758   ; A / 4 y (HL - 1) / 4: la barra en cuartos
	srl a		;475a
	ld c,a			;475c
	dec l			;475d
	ld b,(hl)			;475e
	srl b		;475f
	srl b		;4761
L_4763:
	ld a,c			;4763
	and a			;4764
	ld hl,06858h		;4765
	jr nz,L_476C		;4768
	ld h,06ch		;476a
L_476C:
	push de			;476c
	push bc			;476d
	ld bc,00408h		;476e   ; un trozo de 4 x 8 de la barra, de la pagina 1
	call copia_de_pagina_1		;4771   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	pop bc			;4774
	pop de			;4775
	ld a,d			;4776   ; D + 4: el siguiente trozo
	add a,004h		;4777
	ld d,a			;4779
	ld a,c			;477a   ; C trozos llenos; los demas, vacios
	and a			;477b
	jr z,L_477F		;477c
	dec c			;477e
L_477F:
	djnz L_4763		;477f
	ret			;4781
dos_cifras_dobles:		; las cifras de 0xC25A y 0xC259 en grande (p00:47FE)
	ld bc,0d802h		;4782
L_4785:
	ld hl,0c25ah		;4785
	push bc			;4788
	push hl			;4789
	call cifra_doble		;478a   ; cifra_doble: las dos cifras BCD de (HL) en grande, con las mitades de p00:4846
	pop hl			;478d
	pop bc			;478e
	dec hl			;478f
	ld a,b			;4790
	add a,010h		;4791
	ld b,a			;4793
	jp cifra_doble		;4794   ; cifra_doble: las dos cifras BCD de (HL) en grande, con las mitades de p00:4846
L_4797:
	ld bc,048bch		;4797
	jr L_4785		;479a
L_479C:
	ld c,000h		;479c
L_479E:
	dec b			;479e
	jr nz,L_47A3		;479f
	ld c,0ffh		;47a1
L_47A3:
	inc b			;47a3
	ld a,(hl)			;47a4
	rra			;47a5
	rra			;47a6
	rra			;47a7
	rra			;47a8
	call cifra		;47a9   ; cifra: la cifra A & 15 (0x21 + A) en (D, E), o espacio si es cero y C
	ld a,(hl)			;47ac
	call cifra		;47ad   ; cifra: la cifra A & 15 (0x21 + A) en (D, E), o espacio si es cero y C
	dec hl			;47b0
	djnz L_479E		;47b1
	ret			;47b3
cifra:		; la cifra A & 15 (0x21 + A) en (D, E), o espacio si es cero y C
	and 00fh		;47b4
	jr z,L_47BA		;47b6
	ld c,0ffh		;47b8
L_47BA:
	add a,021h		;47ba
	and c			;47bc
	call caracter_de_la_fuente		;47bd   ; caracter_de_la_fuente: el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
	ld a,d			;47c0
	add a,008h		;47c1
	ld d,a			;47c3
	ret			;47c4
marco_de_cifras:		; rectangulo y lineas del recuadro de cifras
	ld hl,00000h		;47c5   ; el recuadro de las cifras: rectangulo de 256 x 20 en (0, 0) color 11
	ld de,00014h		;47c8
	ld c,00bh		;47cb
	call rectangulo		;47cd   ; rectangulo: los cuatro lados de un rectangulo (p00:4B8E y p00:4B98)
	ld hl,06f00h		;47d0   ; y tres lineas verticales de 0x14 que lo parten
	ld bc,0140bh		;47d3
	call linea_vertical_guardando		;47d6   ; linea_vertical_guardando: p00:4B0C sin tocar HL ni BC
	inc h			;47d9
	call linea_vertical_guardando		;47da   ; linea_vertical_guardando: p00:4B0C sin tocar HL ni BC
	ld h,0bfh		;47dd
	call linea_vertical_guardando		;47df   ; linea_vertical_guardando: p00:4B0C sin tocar HL ni BC
	inc h			;47e2
linea_vertical_guardando:		; p00:4B0C sin tocar HL ni BC
	push hl			;47e3
	push bc			;47e4
	call linea_vertical		;47e5   ; linea_vertical: LINE (0x70) vertical (ARG = 1) de B puntos en (H, L), color C
	pop bc			;47e8
	pop hl			;47e9
	ret			;47ea
byte_5_del_personaje:		; A = el byte 5 de la ficha del personaje que se lleva
	ld b,005h		;47eb
byte_del_personaje:		; A = el byte B de la ficha del personaje que se lleva (0xC2B0 + 0xC240 * 32)
	ld a,(0c240h)		;47ed   ; lee el personaje que se lleva (0 o 1)
	add a,a			;47f0
	add a,a			;47f1
	add a,a			;47f2
	add a,a			;47f3
	add a,a			;47f4
	add a,b			;47f5
	ld hl,0c2b0h		;47f6   ; apunta a la ficha del personaje 0 (14 bytes)
	call hl_mas_a		;47f9   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;47fc
	ret			;47fd
cifra_doble:		; las dos cifras BCD de (HL) en grande, con las mitades de p00:4846
	ld de,04846h		;47fe
	push bc			;4801
	push de			;4802
	push hl			;4803
	ld a,(hl)			;4804
	and 0f0h		;4805
	rrca			;4807
	rrca			;4808
	rrca			;4809
	rrca			;480a
	add a,a			;480b
	call de_mas_a		;480c   ; de_mas_a: DE = DE + A
	ld a,(de)			;480f
	push de			;4810
	push bc			;4811
	call media_cifra		;4812   ; media_cifra: copia la media cifra A (fila 0x58 de la pagina 1) a (B, C)
	pop bc			;4815
	pop de			;4816
	call media_cifra_siguiente		;4817   ; media_cifra_siguiente: C + 8 y la segunda mitad de la cifra
	pop hl			;481a
	pop de			;481b
	pop bc			;481c
	ld a,b			;481d
	add a,008h		;481e
	ld b,a			;4820
	ld a,(hl)			;4821
	and 00fh		;4822
	add a,a			;4824
	call de_mas_a		;4825   ; de_mas_a: DE = DE + A
	ld a,(de)			;4828
	push de			;4829
	push bc			;482a
	call media_cifra		;482b   ; media_cifra: copia la media cifra A (fila 0x58 de la pagina 1) a (B, C)
	pop bc			;482e
	pop de			;482f
media_cifra_siguiente:		; C + 8 y la segunda mitad de la cifra
	ld a,c			;4830
	add a,008h		;4831
	ld c,a			;4833
	inc de			;4834
	ld a,(de)			;4835
media_cifra:		; copia la media cifra A (fila 0x58 de la pagina 1) a (B, C)
	ld d,b			;4836   ; (B, C) es el destino de la media cifra
	ld e,c			;4837
	add a,a			;4838   ; A * 8: la columna de la media cifra en la pagina 1, fila 0x58
	add a,a			;4839
	add a,a			;483a
	ld h,a			;483b
	ld l,058h		;483c
	ld bc,00808h		;483e
copia_de_pagina_1:		; p00:4BDE de la pagina 1 a la 0
	ld a,001h		;4841
	jp copia_rectangulo		;4843   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4

; ----------------------------------------------------------------------
; DATOS cifras: 10 x 2 fichas: las dos mitades de cada cifra (p00:47FE, un
;   nibble BCD por cifra); lo leen p00:47FE (20 bytes)
;   0x4846..0x485a  (20 bytes)
DATA_cifras:
	defb 009h,00ah	; 4846
	defb 000h,001h	; 4848
	defb 002h,003h	; 484a
	defb 002h,004h	; 484c
	defb 005h,006h	; 484e
	defb 007h,004h	; 4850
	defb 007h,008h	; 4852
	defb 002h,001h	; 4854
	defb 009h,008h	; 4856
	defb 009h,004h	; 4858

; ======================================================================
; CODIGO 0x485a..0x4891  (55 bytes)
; ======================================================================


barra_del_personaje:		; la barra de 4 del byte 6 del personaje (p00:4891)
	ld b,006h		;485a
	call byte_del_personaje		;485c   ; byte_del_personaje: A = el byte B de la ficha del personaje que se lleva (0xC2B0 + 0xC240 * 32)
	ld hl,04891h		;485f
	call hl_mas_a		;4862   ; hl_mas_a: HL = HL + A
	ld c,(hl)			;4865
	ld b,004h		;4866
	ld hl,000c0h		;4868
	ld de,07a04h		;486b
L_486E:
	push hl			;486e   ; las 4 marcas de la barra del personaje
	push de			;486f
	push bc			;4870
	ld a,c			;4871   ; 4 - C: a partir de esta la marca va vacia (H + 0x40)
	sub 004h		;4872
	neg		;4874
	cp b			;4876
	jr nz,L_487D		;4877
	ld a,h			;4879
	add a,040h		;487a
	ld h,a			;487c
L_487D:
	ld bc,00c0ch		;487d   ; cada marca, 12 x 12 de la pagina 1
	call copia_de_pagina_1		;4880   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	pop bc			;4883
	pop de			;4884
	pop hl			;4885
	ld a,h			;4886   ; la siguiente: 16 a la derecha en origen y destino
	add a,010h		;4887
	ld h,a			;4889
	ld a,d			;488a
	add a,010h		;488b
	ld d,a			;488d
	djnz L_486E		;488e
	ret			;4890

; ----------------------------------------------------------------------
; DATOS tabla_p485F: 4 bytes: p00:485F lee uno segun el byte 6 de la ficha
;   0xC2B0 (p00:47ED); lo leen p00:485F (4 bytes)
;   0x4891..0x4895  (4 bytes)
DATA_tabla_p485F:
	defb 000h,003h,002h,001h	; 4891

; ======================================================================
; CODIGO 0x4895..0x49cd  (312 bytes)
; ======================================================================


L_4895:
	call direccion_vram_lectura		;4895   ; direccion_vram_lectura: R#14 y la direccion de LECTURA de VRAM de HL
	call cuenta_de_bytes		;4898   ; cuenta_de_bytes: B y A para un otir de BC bytes
	ex af,af'			;489b
	ld a,(00006h)		;489c
	ld c,a			;489f
	ex af,af'			;48a0
L_48A1:
	inir		;48a1
	dec a			;48a3
	jr nz,L_48A1		;48a4
	ex de,hl			;48a6
	ret			;48a7
cuenta_de_bytes:		; B y A para un otir de BC bytes
	ex de,hl			;48a8   ; para p00:48BD: B = C (resto) y A = las vueltas de 256 de otir
	ld a,c			;48a9
	or a			;48aa
	ld a,b			;48ab
	ld b,c			;48ac
	ret z			;48ad
	inc a			;48ae
	ret			;48af
copia_a_vram:		; copia BC bytes de HL a la VRAM DE (otir)
	ex de,hl			;48b0
	call direccion_vram		;48b1   ; direccion_vram: R#14 y la direccion de ESCRITURA de VRAM de HL
	call cuenta_de_bytes		;48b4   ; cuenta_de_bytes: B y A para un otir de BC bytes
	ex af,af'			;48b7
	ld a,(00007h)		;48b8
	ld c,a			;48bb
	ex af,af'			;48bc
L_48BD:
	otir		;48bd
	dec a			;48bf
	jr nz,L_48BD		;48c0
	ret			;48c2
llena_vram:		; llena BC bytes de la VRAM HL con A
	push de			;48c3
	push af			;48c4
	call direccion_vram		;48c5   ; direccion_vram: R#14 y la direccion de ESCRITURA de VRAM de HL
	ld d,c			;48c8
	ld a,c			;48c9
	or a			;48ca
	jr z,L_48CE		;48cb
	inc b			;48cd
L_48CE:
	ld a,(00007h)		;48ce
	ld c,a			;48d1
	pop af			;48d2
L_48D3:
	out (c),a		;48d3   ; out de A a la VRAM: D en el bucle de dentro, B vueltas de 256
	dec d			;48d5
	jr nz,L_48D3		;48d6
	djnz L_48D3		;48d8
	pop de			;48da
	ret			;48db
escribe_vram:		; escribe A en la VRAM HL
	push bc			;48dc
	push af			;48dd
	call direccion_vram		;48de   ; direccion_vram: R#14 y la direccion de ESCRITURA de VRAM de HL
	ld a,(00007h)		;48e1
	ld c,a			;48e4
	pop af			;48e5
	out (c),a		;48e6
	pop bc			;48e8
	ret			;48e9
direccion_vram:		; R#14 y la direccion de ESCRITURA de VRAM de HL
	push bc			;48ea
	ld a,(00007h)		;48eb   ; el puerto 0x99 (el de los registros del VDP, de 0x0007 + 1)
	inc a			;48ee
	ld c,a			;48ef
	ld a,h			;48f0   ; los dos bits altos de la direccion van a R#14
	rlca			;48f1
	rlca			;48f2
	and 003h		;48f3
	di			;48f5
	out (c),a		;48f6
	ld a,08eh		;48f8   ; 0x8E: escribe en R#14
	out (c),a		;48fa
	ld a,l			;48fc   ; los 8 bits bajos de la direccion
	out (c),a		;48fd
	ld a,h			;48ff   ; los 6 bits siguientes con el bit 6: escritura
	and 03fh		;4900
	or 040h		;4902
	out (c),a		;4904
	pop bc			;4906
	ei			;4907
	ret			;4908
direccion_vram_lectura:		; R#14 y la direccion de LECTURA de VRAM de HL
	push bc			;4909
	ld a,(00007h)		;490a
	inc a			;490d
	ld c,a			;490e
	ld a,h			;490f   ; los dos bits altos de la direccion a R#14
	rlca			;4910
	rlca			;4911
	and 003h		;4912
	di			;4914
	out (c),a		;4915
	ld a,08eh		;4917
	out (c),a		;4919
	ld a,l			;491b
	out (c),a		;491c
	ld a,h			;491e   ; los 6 bits siguientes sin el bit 6: lectura
	and 03fh		;491f
	out (c),a		;4921
	pop bc			;4923
	ei			;4924
	ret			;4925
rle_a_vram_con_destino:		; lee la direccion de VRAM de (DE) y sigue en p00:492C
	ex de,hl			;4926   ; DE apunta a [direccion de VRAM lo][hi] y luego al RLE
	ld e,(hl)			;4927
	inc hl			;4928
	ld d,(hl)			;4929
	inc hl			;492a
	ex de,hl			;492b
rle_a_vram:		; RLE de DE a la VRAM HL: 0 acaba, n < 0x80 repite, 0x80 otra direccion, si no copia n & 0x7F
	call direccion_vram		;492c   ; direccion_vram: R#14 y la direccion de ESCRITURA de VRAM de HL
	ld a,(00007h)		;492f
	ld c,a			;4932
L_4933:
	ld a,(de)			;4933   ; n: 0 acaba
	and a			;4934
	ret z			;4935
	inc de			;4936
	ld b,a			;4937
	and 07fh		;4938   ; n & 0x7F == n: repetir (p00:4947)
	cp b			;493a
	jr z,L_4947		;493b
	and a			;493d   ; 0x80: viene otra direccion de VRAM (p00:4926)
	jr z,rle_a_vram_con_destino		;493e
	ex de,hl			;4940   ; si no, n & 0x7F bytes tal cual con otir
	ld b,a			;4941
	otir		;4942
	ex de,hl			;4944
	jr L_4933		;4945
L_4947:
	ld a,(de)			;4947
	inc de			;4948
L_4949:
	out (c),a		;4949
	djnz L_4949		;494b
	jr L_4933		;494d
L_494F:
	ex de,hl			;494f   ; el puntero de (DE) y cae en p00:4955
	ld e,(hl)			;4950
	inc hl			;4951
	ld d,(hl)			;4952
	inc hl			;4953
	ex de,hl			;4954
sprite_volteado:		; RLE de DE (p00:49CE), lo voltea (p00:496C) y lo copia a la VRAM HL
	ld (0de80h),hl		;4955   ; guarda variable de trabajo del banco 0 y el byte siguiente (16 bits)
	call rle_a_d600		;4958   ; rle_a_d600: RLE de DE a 0xD600: 0 acaba, n < 0x80 repite, si no copia n & 0x7F; DE' = bytes
	call voltea_sprites		;495b   ; voltea_sprites: voltea en horizontal los patrones de 0xD600 (bits al reves y mitades cambiadas)
	exx			;495e
	push de			;495f
	exx			;4960
	pop bc			;4961
	ld hl,0d600h		;4962   ; apunta a el bufer de patrones de sprite
	ld de,(0de80h)		;4965   ; lee variable de trabajo del banco 0 y el byte siguiente (16 bits)
	jp copia_a_vram		;4969   ; copia_a_vram: copia BC bytes de HL a la VRAM DE (otir)
voltea_sprites:		; voltea en horizontal los patrones de 0xD600 (bits al reves y mitades cambiadas)
	exx			;496c   ; la cuenta de bytes de p00:49CE (DE') / 32: cuantos sprites
	push de			;496d
	exx			;496e
	pop bc			;496f
	rl c		;4970
	rl b		;4972
	rl c		;4974
	rl b		;4976
	rl c		;4978
	rl b		;497a
	ld hl,0d600h		;497c   ; primero, los bits de cada byte al reves (p00:49B2)
	push bc			;497f
	ld c,b			;4980
L_4981:
	ld b,020h		;4981
L_4983:
	ld a,(hl)			;4983
	call invierte_bits		;4984   ; invierte_bits: A con sus 8 bits al reves
	ld (hl),a			;4987
	inc hl			;4988
	djnz L_4983		;4989
	dec c			;498b
	jr nz,L_4981		;498c
	pop bc			;498e
	ld hl,0d600h		;498f   ; apunta a el bufer de patrones de sprite
	ld de,0d610h		;4992
L_4995:
	push bc			;4995
	ld b,010h		;4996
L_4998:
	ld c,(hl)			;4998   ; luego, las dos mitades (16 y 16 bytes) de cada sprite cambiadas
	ld a,(de)			;4999
	ld (hl),a			;499a
	ld a,c			;499b
	ld (de),a			;499c
	inc de			;499d
	inc hl			;499e
	djnz L_4998		;499f
	ld a,010h		;49a1
	call de_mas_a		;49a3   ; el siguiente sprite: 32 bytes mas alla
	push de			;49a6
	ld de,00010h		;49a7
	add hl,de			;49aa
	pop de			;49ab
	pop bc			;49ac
	djnz L_4995		;49ad
	ret			;49af
L_49B0:
	ld d,h			;49b0
	ld e,l			;49b1
invierte_bits:		; A con sus 8 bits al reves
	push bc			;49b2
	ld c,a			;49b3
	ld b,008h		;49b4
L_49B6:
	rr c		;49b6
	rla			;49b8
	djnz L_49B6		;49b9
	pop bc			;49bb
	ret			;49bc
L_49BD:
	push hl			;49bd
	call rle_a_d600		;49be   ; rle_a_d600: RLE de DE a 0xD600: 0 acaba, n < 0x80 repite, si no copia n & 0x7F; DE' = bytes
	exx			;49c1
	pop hl			;49c2
	push de			;49c3
	pop bc			;49c4
	ld de,0d600h		;49c5   ; apunta a el bufer de patrones de sprite
	ex de,hl			;49c8
	call copia_a_vram		;49c9   ; copia_a_vram: copia BC bytes de HL a la VRAM DE (otir)
	ret			;49cc

; ----------------------------------------------------------------------
; DATOS ret_suelto: un `ret` (0xC9) detras del `ret` de p00:49CC: nada salta
;   aqui
;   0x49cd..0x49ce  (1 bytes)
DATA_ret_suelto:
	defb 0c9h	; 49cd

; ======================================================================
; CODIGO 0x49ce..0x4fe6  (1560 bytes)
; ======================================================================


rle_a_d600:		; RLE de DE a 0xD600: 0 acaba, n < 0x80 repite, si no copia n & 0x7F; DE' = bytes
	ld hl,0d600h		;49ce   ; apunta a el bufer de patrones de sprite
	exx			;49d1
	ld de,00000h		;49d2
	exx			;49d5
L_49D6:
	ld a,(de)			;49d6   ; n: 0 acaba
	and a			;49d7
	ret z			;49d8
	inc de			;49d9
	ld b,a			;49da
	and 07fh		;49db
	cp b			;49dd
	jr z,L_49EE		;49de   ; n < 0x80: repetir el siguiente n veces
	ex de,hl			;49e0   ; si no, copiar n & 0x7F tal cual; DE' cuenta los bytes
	ld b,000h		;49e1
	ld c,a			;49e3
	exx			;49e4
	call de_mas_a		;49e5   ; de_mas_a: DE = DE + A
	exx			;49e8
	ldir		;49e9
	ex de,hl			;49eb
	jr L_49D6		;49ec
L_49EE:
	ld a,b			;49ee
	exx			;49ef
	call de_mas_a		;49f0   ; de_mas_a: DE = DE + A
	exx			;49f3
	ld a,(de)			;49f4
	inc de			;49f5
L_49F6:
	ld (hl),a			;49f6
	inc hl			;49f7
	djnz L_49F6		;49f8
	jr L_49D6		;49fa
L_49FC:
	call esconde_sprites		;49fc   ; esconde_sprites: Y = 0xE0 en las dos tablas de atributos (0x7600 y 0xF600)
	ld bc,00000h		;49ff
	jr L_4A0A		;4a02
apaga_y_borra:		; esconde los sprites y borra la pagina 0 con la pantalla apagada
	call esconde_sprites		;4a04   ; esconde_sprites: Y = 0xE0 en las dos tablas de atributos (0x7600 y 0xF600)
L_4A07:
	ld bc,000d4h		;4a07
L_4A0A:
	push bc			;4a0a
	call pantalla_apagada		;4a0b   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	pop bc			;4a0e
	call borra_pagina		;4a0f   ; borra_pagina: HMMV de 256 x C lineas a 0 y R#23 = 0
pantalla_encendida:		; R#1 con el bit 6 (pantalla) y sprites encendidos
	ld a,(0f3e0h)		;4a12
	or 040h		;4a15
	ld b,a			;4a17
	ld c,001h		;4a18
	call 00047h		;4a1a   ; BIOS WRTVDP - Writes data in the VDP-register
	jr sprites_encendidos		;4a1d
pantalla_apagada:		; R#1 sin el bit 6 y sprites apagados (R#8)
	ld a,(0f3e0h)		;4a1f
	and 0bfh		;4a22
	ld b,a			;4a24
	ld c,001h		;4a25
	call 00047h		;4a27   ; BIOS WRTVDP - Writes data in the VDP-register
	jr sprites_apagados		;4a2a
apaga_y_borra_todo:		; pantalla apagada, sprites escondidos y la pagina 0 borrada
	call pantalla_apagada		;4a2c   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	call esconde_sprites		;4a2f   ; esconde_sprites: Y = 0xE0 en las dos tablas de atributos (0x7600 y 0xF600)
	ld bc,000d4h		;4a32
borra_pagina:		; HMMV de 256 x C lineas a 0 y R#23 = 0
	ld hl,00000h		;4a35
	xor a			;4a38
	ld d,a			;4a39
	call rellena_rectangulo		;4a3a   ; rellena_rectangulo: HMMV (0xC0): rectangulo B x C en (H, L) de la pagina D con el color A
	ld b,000h		;4a3d
	ld c,017h		;4a3f
	jp 00047h		;4a41   ; BIOS WRTVDP - Writes data in the VDP-register
esconde_sprites:		; Y = 0xE0 en las dos tablas de atributos (0x7600 y 0xF600)
	call esconde_sprites_ram		;4a44   ; esconde_sprites_ram: Y = 0xE0 en los 32 atributos de 0xDE00
	ld hl,0f600h		;4a47
	ld a,0e0h		;4a4a
	ld bc,00080h		;4a4c
	call llena_vram		;4a4f   ; llena_vram: llena BC bytes de la VRAM HL con A
	ld hl,07600h		;4a52
	ld a,0e0h		;4a55
	ld bc,00080h		;4a57
	jp llena_vram		;4a5a   ; llena_vram: llena BC bytes de la VRAM HL con A
sprites_apagados:		; R#8 con el bit 1 (sin sprites)
	ld a,(0ffe7h)		;4a5d
	or 002h		;4a60
	ld b,a			;4a62
	ld c,008h		;4a63
	jp 00047h		;4a65   ; BIOS WRTVDP - Writes data in the VDP-register
sprites_encendidos:		; R#8 sin el bit 1
	ld a,(0ffe7h)		;4a68
	and 0fdh		;4a6b
	ld b,a			;4a6d
	ld c,008h		;4a6e
	jp 00047h		;4a70   ; BIOS WRTVDP - Writes data in the VDP-register
pon_color:		; el color A de la paleta = D (0RRR0BBB) y E (00000GGG), copia en 0xF680
	push bc			;4a73
	push hl			;4a74
	ld b,a			;4a75   ; el color en B; el puerto 0x99
	ld a,(00007h)		;4a76
	inc a			;4a79
	ld c,a			;4a7a
	di			;4a7b
	out (c),b		;4a7c
	ld a,090h		;4a7e   ; R#16 = el color: el siguiente par va a ese registro de paleta
	out (c),a		;4a80
	inc c			;4a82   ; por el puerto 0x9A: rojo-azul y verde
	out (c),d		;4a83
	push af			;4a85
	pop af			;4a86
	out (c),e		;4a87
	dec c			;4a89
	ld hl,0f680h		;4a8a   ; la copia en VRAM de la paleta: 0xF680 + color * 2
	ld a,b			;4a8d
	add a,a			;4a8e
	add a,l			;4a8f
	ld l,a			;4a90
	call direccion_vram		;4a91   ; direccion_vram: R#14 y la direccion de ESCRITURA de VRAM de HL
	dec c			;4a94   ; por el puerto 0x98, los mismos dos bytes
	out (c),d		;4a95
	out (c),e		;4a97
	pop hl			;4a99
	pop bc			;4a9a
	ei			;4a9b
	ret			;4a9c
pon_paleta:		; ternas [color][RB][G] de HL hasta 0xFF
	ld a,(hl)			;4a9d   ; [color]: 0xFF acaba
	inc hl			;4a9e
	inc a			;4a9f
	ret z			;4aa0
	dec a			;4aa1
	ld d,(hl)			;4aa2   ; [RB][G]
	inc hl			;4aa3
	ld e,(hl)			;4aa4
	inc hl			;4aa5
	call pon_color		;4aa6   ; pon_color: el color A de la paleta = D (0RRR0BBB) y E (00000GGG), copia en 0xF680
	jr pon_paleta		;4aa9
espera_al_vdp:		; espera a que acabe el comando del VDP (S#2 bit 0)
	ld a,002h		;4aab
	call lee_estado_vdp		;4aad   ; lee_estado_vdp: A = el registro de estado A del VDP
	rra			;4ab0
	jr c,espera_al_vdp		;4ab1
	ret			;4ab3
lee_estado_vdp:		; A = el registro de estado A del VDP
	push bc			;4ab4
	push hl			;4ab5
	ld hl,(00006h)		;4ab6   ; 0x0006/0x0007: los puertos del VDP que da la BIOS
	inc h			;4ab9
	inc l			;4aba
	ld c,h			;4abb
	di			;4abc
	out (c),a		;4abd   ; R#15 = A: el registro de estado a leer
	ld a,08fh		;4abf
	out (c),a		;4ac1
	ld c,l			;4ac3
	in a,(c)		;4ac4   ; lo lee por el puerto 0x99
	push af			;4ac6
	xor a			;4ac7   ; R#15 = 0 otra vez, como lo deja la BIOS
	ld c,h			;4ac8
	out (c),a		;4ac9
	ld a,08fh		;4acb
	out (c),a		;4acd
	pop af			;4acf
	pop hl			;4ad0
	pop bc			;4ad1
	ei			;4ad2
	ret			;4ad3
linea_horizontal:		; LINE (0x70) horizontal (ARG = 0) de B puntos en (H, L) de la pagina 0xC8E0, color C
	push de			;4ad4
	call espera_al_vdp		;4ad5   ; espera_al_vdp: espera a que acabe el comando del VDP (S#2 bit 0)
	push bc			;4ad8
	ld a,(00007h)		;4ad9
	inc a			;4adc
	ld c,a			;4add
	ld a,024h		;4ade   ; R#17 = 36 (0x24) con autoincremento: de R#36 en adelante
	di			;4ae0
	out (c),a		;4ae1
	ld a,091h		;4ae3
	out (c),a		;4ae5
	inc c			;4ae7
	inc c			;4ae8
	out (c),h		;4ae9   ; DX = H, DY = L
	xor a			;4aeb
	out (c),a		;4aec
	out (c),l		;4aee
	pop hl			;4af0
	pop de			;4af1
	ld a,(0c8e0h)		;4af2   ; DY alto: la pagina, de 0xC8E0
	out (c),a		;4af5
	dec h			;4af7   ; NX = B - 1 (el eje mayor), NY = 0, color C y ARG = 0: eje mayor X, horizontal
	out (c),h		;4af8
	xor a			;4afa
	out (c),a		;4afb
	xor a			;4afd
	out (c),a		;4afe
	out (c),a		;4b00
	out (c),l		;4b02
	out (c),a		;4b04
	ld a,070h		;4b06   ; 0x70: LINE
	out (c),a		;4b08
	ei			;4b0a
	ret			;4b0b
linea_vertical:		; LINE (0x70) vertical (ARG = 1) de B puntos en (H, L), color C
	call espera_al_vdp		;4b0c   ; espera_al_vdp: espera a que acabe el comando del VDP (S#2 bit 0)
	push bc			;4b0f
	ld a,(00007h)		;4b10
	inc a			;4b13
	ld c,a			;4b14
	ld a,024h		;4b15   ; R#17 = 36: de R#36 en adelante
	di			;4b17
	out (c),a		;4b18
	ld a,091h		;4b1a
	out (c),a		;4b1c
	inc c			;4b1e
	inc c			;4b1f
	out (c),h		;4b20   ; DX = H, DY = L, NX = B - 1 (eje mayor), NY = 0
	xor a			;4b22
	out (c),a		;4b23
	out (c),l		;4b25
	out (c),a		;4b27
	pop hl			;4b29
	dec h			;4b2a
	out (c),h		;4b2b
	xor a			;4b2d
	out (c),a		;4b2e
	xor a			;4b30
	out (c),a		;4b31
	out (c),a		;4b33
	out (c),l		;4b35
	inc a			;4b37   ; ARG = 1: eje mayor Y, vertical
	out (c),a		;4b38
	ld a,070h		;4b3a   ; 0x70: LINE
	out (c),a		;4b3c
	ei			;4b3e
	ret			;4b3f
linea:		; LINE (0x70) de (H, L) con largo D y E
	call espera_al_vdp		;4b40   ; espera_al_vdp: espera a que acabe el comando del VDP (S#2 bit 0)
	push bc			;4b43
	ld a,(00007h)		;4b44
	inc a			;4b47
	ld c,a			;4b48
	ld a,024h		;4b49   ; R#17 = 36
	di			;4b4b
	out (c),a		;4b4c
	ld a,091h		;4b4e
	out (c),a		;4b50
	inc c			;4b52
	inc c			;4b53
	out (c),h		;4b54
	xor a			;4b56
	out (c),a		;4b57
	out (c),l		;4b59
	out (c),a		;4b5b
	pop hl			;4b5d
	dec h			;4b5e
	out (c),d		;4b5f   ; NX = D, NY = E: los dos ejes de la linea
	xor a			;4b61
	out (c),a		;4b62
	out (c),e		;4b64
	xor a			;4b66
	out (c),a		;4b67
	out (c),l		;4b69
	xor a			;4b6b
	out (c),a		;4b6c
	ld a,070h		;4b6e   ; 0x70: LINE
	out (c),a		;4b70
	ei			;4b72
	ret			;4b73
rectangulo:		; los cuatro lados de un rectangulo (p00:4B8E y p00:4B98)
	ld b,e			;4b74
	call linea_vertical_guardando_todo		;4b75   ; linea_vertical_guardando_todo: p00:4B0C sin tocar HL, DE ni BC
	ld b,d			;4b78
	call linea_horizontal_guardando_todo		;4b79   ; linea_horizontal_guardando_todo: p00:4AD4 sin tocar HL, DE ni BC
	push hl			;4b7c
	ld a,l			;4b7d
	dec a			;4b7e
	add a,e			;4b7f
	ld l,a			;4b80
	ld b,d			;4b81
	call linea_horizontal_guardando_todo		;4b82   ; linea_horizontal_guardando_todo: p00:4AD4 sin tocar HL, DE ni BC
	pop hl			;4b85
	ld a,h			;4b86
	dec a			;4b87
	add a,d			;4b88
	ld h,a			;4b89
	ld b,e			;4b8a
	jp linea_vertical_guardando_todo		;4b8b   ; linea_vertical_guardando_todo: p00:4B0C sin tocar HL, DE ni BC
linea_vertical_guardando_todo:		; p00:4B0C sin tocar HL, DE ni BC
	push hl			;4b8e
	push de			;4b8f
	push bc			;4b90
	call linea_vertical		;4b91   ; linea_vertical: LINE (0x70) vertical (ARG = 1) de B puntos en (H, L), color C
	pop bc			;4b94
	pop de			;4b95
	pop hl			;4b96
	ret			;4b97
linea_horizontal_guardando_todo:		; p00:4AD4 sin tocar HL, DE ni BC
	push hl			;4b98
	push de			;4b99
	push bc			;4b9a
	call linea_horizontal		;4b9b   ; linea_horizontal: LINE (0x70) horizontal (ARG = 0) de B puntos en (H, L) de la pagina 0xC8E0, color C
	pop bc			;4b9e
	pop de			;4b9f
	pop hl			;4ba0
	ret			;4ba1
rellena_rectangulo:		; HMMV (0xC0): rectangulo B x C en (H, L) de la pagina D con el color A
	ex af,af'			;4ba2
	call espera_al_vdp		;4ba3   ; el color en A' y espera a que acabe el comando anterior
	push bc			;4ba6
	ld a,(00007h)		;4ba7
	inc a			;4baa
	ld c,a			;4bab
	ld a,024h		;4bac   ; R#17 = 36: DX y DY de H y L, pagina D
	di			;4bae
	out (c),a		;4baf
	ld a,091h		;4bb1
	out (c),a		;4bb3
	inc c			;4bb5
	inc c			;4bb6
	out (c),h		;4bb7
	xor a			;4bb9
	out (c),a		;4bba
	out (c),l		;4bbc
	out (c),d		;4bbe
	pop hl			;4bc0
	out (c),h		;4bc1   ; NX = H (B): 0 quiere decir 256
	cp h			;4bc3
	jr nz,L_4BC7		;4bc4
	inc a			;4bc6
L_4BC7:
	out (c),a		;4bc7
	xor a			;4bc9
	out (c),l		;4bca   ; NY = L (C), con lo mismo
	cp l			;4bcc
	jr nz,L_4BD0		;4bcd
	inc a			;4bcf
L_4BD0:
	out (c),a		;4bd0
	ex af,af'			;4bd2
	out (c),a		;4bd3   ; el color (A')
	xor a			;4bd5
	out (c),a		;4bd6
	ld a,0c0h		;4bd8   ; 0xC0: HMMV
	out (c),a		;4bda
	ei			;4bdc
	ret			;4bdd
copia_rectangulo:		; HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	ex af,af'			;4bde
	call espera_al_vdp		;4bdf   ; espera_al_vdp: espera a que acabe el comando del VDP (S#2 bit 0)
	push bc			;4be2
	ld a,(00007h)		;4be3
	inc a			;4be6
	ld c,a			;4be7
	ld a,020h		;4be8   ; R#17 = 32 (0x20): de R#32 (SX) en adelante
	di			;4bea
	out (c),a		;4beb
	ld a,091h		;4bed
	out (c),a		;4bef
	inc c			;4bf1
	inc c			;4bf2
	out (c),h		;4bf3   ; SX = H, SY = L
	xor a			;4bf5
	out (c),a		;4bf6
	out (c),l		;4bf8
	ex af,af'			;4bfa
	ld l,a			;4bfb   ; la pagina de origen en los bits 0-1 de A
	and 003h		;4bfc
	out (c),a		;4bfe
	out (c),d		;4c00   ; DX = D, DY = E
	xor a			;4c02
	out (c),a		;4c03
	out (c),e		;4c05
	ld a,l			;4c07   ; la pagina de destino en los bits 2-3 de A
	rra			;4c08
	rra			;4c09
	and 003h		;4c0a
	out (c),a		;4c0c
	pop hl			;4c0e
	out (c),h		;4c0f   ; NX = B, NY = C
	xor a			;4c11
	out (c),a		;4c12
	out (c),l		;4c14
	out (c),a		;4c16
	out (c),a		;4c18
	out (c),a		;4c1a
	ld a,0d0h		;4c1c   ; 0xD0: HMMM
	out (c),a		;4c1e
	ei			;4c20
	ret			;4c21
hmmc:		; HMMC (0xF0): un rectangulo con los bytes de HL
	ex af,af'			;4c22
	call espera_al_vdp		;4c23   ; espera_al_vdp: espera a que acabe el comando del VDP (S#2 bit 0)
	push bc			;4c26
	ld a,(00007h)		;4c27
	inc a			;4c2a
	ld c,a			;4c2b
	ld a,024h		;4c2c   ; R#17 = 36: DX y DY de D y E
	di			;4c2e
	out (c),a		;4c2f
	ld a,091h		;4c31
	out (c),a		;4c33
	inc c			;4c35
	inc c			;4c36
	out (c),d		;4c37
	xor a			;4c39
	out (c),a		;4c3a
	out (c),e		;4c3c
	ex af,af'			;4c3e
	out (c),a		;4c3f
	pop de			;4c41   ; NX y NY de BC (pila)
	out (c),d		;4c42
	xor a			;4c44
	out (c),a		;4c45
	out (c),e		;4c47
	out (c),a		;4c49
	ld a,(hl)			;4c4b   ; el primer byte va en R#44 (CLR) con el comando
	inc hl			;4c4c
	out (c),a		;4c4d
	xor a			;4c4f
	out (c),a		;4c50
	ld a,0f0h		;4c52   ; 0xF0: HMMC
	out (c),a		;4c54
	dec c			;4c56
	dec c			;4c57
	ld a,0ach		;4c58   ; R#17 = 44 sin autoincremento: los demas bytes van a CLR
	out (c),a		;4c5a
	ld a,091h		;4c5c
	out (c),a		;4c5e
	inc c			;4c60
	inc c			;4c61
L_4C62:
	ld a,002h		;4c62   ; S#2: con TR (bit 7) a uno se manda el siguiente; con CE (bit 0) a cero acaba
	call lee_estado_vdp		;4c64   ; lee_estado_vdp: A = el registro de estado A del VDP
	rra			;4c67
	ret nc			;4c68
	add a,a			;4c69
	add a,a			;4c6a
	jr nc,L_4C62		;4c6b
	ld a,(hl)			;4c6d
	inc hl			;4c6e
	out (c),a		;4c6f
	jr L_4C62		;4c71
copia_con_operacion:		; LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	ex af,af'			;4c73
	call espera_al_vdp		;4c74   ; espera_al_vdp: espera a que acabe el comando del VDP (S#2 bit 0)
	push bc			;4c77
	ld a,(00007h)		;4c78
	inc a			;4c7b
	ld c,a			;4c7c
	ld a,020h		;4c7d   ; R#17 = 32: de SX en adelante
	di			;4c7f
	out (c),a		;4c80
	ld a,091h		;4c82
	out (c),a		;4c84
	inc c			;4c86
	inc c			;4c87
	out (c),h		;4c88
	xor a			;4c8a
	out (c),a		;4c8b
	out (c),l		;4c8d
	ex af,af'			;4c8f   ; A = paginas y operacion: rlca rlca deja la pagina de origen en los bits 0-1
	rlca			;4c90
	rlca			;4c91
	ld l,a			;4c92
	and 003h		;4c93
	out (c),a		;4c95
	out (c),d		;4c97
	xor a			;4c99
	out (c),a		;4c9a
	out (c),e		;4c9c
	ld a,l			;4c9e   ; y la de destino en los siguientes
	ld e,a			;4c9f
	rlca			;4ca0
	rlca			;4ca1
	and 003h		;4ca2
	out (c),a		;4ca4
	pop hl			;4ca6
	out (c),h		;4ca7
	xor a			;4ca9
	out (c),a		;4caa
	out (c),l		;4cac
	out (c),a		;4cae
	out (c),a		;4cb0
	out (c),a		;4cb2
	ld a,e			;4cb4   ; la operacion logica en los bits 0-3 de E
	rra			;4cb5
	rra			;4cb6
	and 00fh		;4cb7
	or 090h		;4cb9   ; 0x90 | operacion: LMMM
	out (c),a		;4cbb
	ei			;4cbd
	ret			;4cbe
caracteres:		; B caracteres de 1 bit de HL en (D, E) de la pagina 1 con el color C
	xor a			;4cbf
	ld (0de80h),a		;4cc0   ; guarda variable de trabajo del banco 0
L_4CC3:
	call caracter		;4cc3   ; caracter: un caracter de 1 bit de HL a 4 bits (p00:4D24) y a la VRAM
	call avanza_ocho		;4cc6   ; avanza_ocho: D + 8, y E + 8 si D da la vuelta
	djnz L_4CC3		;4cc9
	ret			;4ccb
caracteres_pagina0:		; como p00:4CBF en la pagina 0
	ld a,001h		;4ccc
	ld (0de80h),a		;4cce   ; guarda variable de trabajo del banco 0
	jr L_4CC3		;4cd1
caracter:		; un caracter de 1 bit de HL a 4 bits (p00:4D24) y a la VRAM
	push bc			;4cd3
	push de			;4cd4
	push hl			;4cd5
	push de			;4cd6
	call caracter_a_4_bits		;4cd7   ; caracter_a_4_bits: 8 bytes de 1 bit de HL a 32 de 4 bits en 0xC1C0 con el color C
	pop de			;4cda
	ld b,d			;4cdb
	ld d,e			;4cdc
	ld e,b			;4cdd
	srl d		;4cde
	rr e		;4ce0
	ld a,(0de80h)		;4ce2   ; lee variable de trabajo del banco 0
	and a			;4ce5
	jr nz,L_4CEC		;4ce6
	ld a,d			;4ce8
	add a,080h		;4ce9
	ld d,a			;4ceb
L_4CEC:
	ld hl,0c1c0h		;4cec
	call ficha_a_vram		;4cef   ; ficha_a_vram: una ficha de 8x8 a 4 bits (32 bytes de HL) en la VRAM DE
	pop hl			;4cf2
	ld bc,00008h		;4cf3
	add hl,bc			;4cf6
	pop de			;4cf7
	pop bc			;4cf8
	ret			;4cf9
ficha_a_vram:		; una ficha de 8x8 a 4 bits (32 bytes de HL) en la VRAM DE
	push de			;4cfa
	ld b,008h		;4cfb
L_4CFD:
	push bc			;4cfd   ; 8 filas de 4 bytes (8 puntos de 4 bits)
	ld bc,00004h		;4cfe
	call copia_a_vram		;4d01   ; copia_a_vram: copia BC bytes de HL a la VRAM DE (otir)
	ex de,hl			;4d04
	ld bc,00080h		;4d05   ; la siguiente fila de la VRAM, 0x80 bytes mas alla
	add hl,bc			;4d08
	ex de,hl			;4d09
	pop bc			;4d0a
	djnz L_4CFD		;4d0b
	pop de			;4d0d
	ret			;4d0e
fichas_a_vram:		; B fichas de 32 bytes de HL seguidas en la VRAM DE (0x400 por fila de fichas)
	push bc			;4d0f
	call ficha_a_vram		;4d10   ; ficha_a_vram: una ficha de 8x8 a 4 bits (32 bytes de HL) en la VRAM DE
	ld a,004h		;4d13
	add a,e			;4d15
	cp 080h		;4d16
	jr nz,L_4D1F		;4d18
	ld a,004h		;4d1a
	add a,d			;4d1c
	ld d,a			;4d1d
	xor a			;4d1e
L_4D1F:
	ld e,a			;4d1f
	pop bc			;4d20
	djnz fichas_a_vram		;4d21
	ret			;4d23
caracter_a_4_bits:		; 8 bytes de 1 bit de HL a 32 de 4 bits en 0xC1C0 con el color C
	ld b,008h		;4d24
	ld de,0c1c0h		;4d26
L_4D29:
	push bc			;4d29   ; cada fila del caracter: un byte de 1 bit
	push hl			;4d2a
	ex de,hl			;4d2b
	ld a,(de)			;4d2c
	ld d,a			;4d2d
	ld b,004h		;4d2e
L_4D30:
	ld a,c			;4d30
	rl d		;4d31
	jr c,L_4D36		;4d33
	xor a			;4d35
L_4D36:
	rld		;4d36
	ld a,c			;4d38
	rl d		;4d39
	jr c,L_4D3E		;4d3b
	xor a			;4d3d
L_4D3E:
	rld		;4d3e   ; rld: los dos puntos de cada byte de 4 bits, uno a uno
	inc hl			;4d40
	djnz L_4D30		;4d41
	ex de,hl			;4d43
	pop hl			;4d44
	inc hl			;4d45
	pop bc			;4d46
	djnz L_4D29		;4d47
	ret			;4d49
texto:		; texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	ld c,0ffh		;4d4a
	jr L_4D50		;4d4c
texto_sin_color:		; como p00:4D4A con C = 0
	ld c,000h		;4d4e
L_4D50:
	ld d,(hl)			;4d50
	inc hl			;4d51
	ld e,(hl)			;4d52
	inc hl			;4d53
L_4D54:
	ld a,(hl)			;4d54   ; el caracter; 0xFF acaba
	inc hl			;4d55
	ld b,a			;4d56
	inc b			;4d57
	ret z			;4d58
	inc b			;4d59   ; 0xFE: otra posicion (vuelve a p00:4D4A)
	jr z,texto		;4d5a
	and c			;4d5c   ; con C a cero (p00:4D4E) el caracter 0
	call caracter_de_la_fuente		;4d5d   ; caracter_de_la_fuente: el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
	cp 07bh		;4d60   ; el 0x7B ocupa 4 puntos; los demas, 8
	ld a,004h		;4d62
	jr z,L_4D68		;4d64
	ld a,008h		;4d66
L_4D68:
	add a,d			;4d68
	ld d,a			;4d69
	jr L_4D54		;4d6a
L_4D6C:
	ld bc,00403h		;4d6c
L_4D6F:
	ld a,(hl)			;4d6f   ; B fichas de HL en una fila, C filas
	inc hl			;4d70
	call caracter_transparente		;4d71   ; caracter_transparente: la ficha de A con TIMP (LMMM 0x58) en (D, E)
	ld a,d			;4d74
	add a,008h		;4d75
	ld d,a			;4d77
	djnz L_4D6F		;4d78
	ld b,004h		;4d7a   ; la siguiente fila de 4 desde D = 0xE0
	ld d,0e0h		;4d7c
	ld a,e			;4d7e
	add a,008h		;4d7f
	ld e,a			;4d81
	dec c			;4d82
	jr nz,L_4D6F		;4d83
	ret			;4d85
caracter_de_la_fuente:		; el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
	push af			;4d86
	push bc			;4d87
	push hl			;4d88
	push de			;4d89
	or a			;4d8a
	ld h,a			;4d8b
	jr z,L_4D93		;4d8c
	call origen_de_ficha		;4d8e   ; origen_de_ficha: HL = (X, Y) de la ficha A en la pagina 1: (A & 31) * 8, (A >> 5) * 8
	add a,038h		;4d91
L_4D93:
	ld l,a			;4d93
	ld bc,00808h		;4d94
	ld a,(0c20bh)		;4d97   ; lee las fichas van a la pagina 1
	and a			;4d9a
	ld a,001h		;4d9b
	jr z,L_4DA1		;4d9d
	ld a,005h		;4d9f
L_4DA1:
	call copia_rectangulo		;4da1   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop de			;4da4
	pop hl			;4da5
	pop bc			;4da6
	pop af			;4da7
	ret			;4da8
L_4DA9:
	push af			;4da9
	call caracter_de_la_fuente		;4daa   ; caracter_de_la_fuente: el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
	call avanza_ocho		;4dad   ; avanza_ocho: D + 8, y E + 8 si D da la vuelta
	pop af			;4db0
	djnz L_4DA9		;4db1
	ret			;4db3
ficha:		; la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	push bc			;4db4
	push hl			;4db5
	push de			;4db6
	call origen_de_ficha		;4db7   ; origen_de_ficha: HL = (X, Y) de la ficha A en la pagina 1: (A & 31) * 8, (A >> 5) * 8
	ld bc,00808h		;4dba
	ld a,(0c20bh)		;4dbd   ; lee las fichas van a la pagina 1
	and a			;4dc0
	ld a,001h		;4dc1
	jr z,L_4DC7		;4dc3
	ld a,005h		;4dc5
L_4DC7:
	call copia_rectangulo		;4dc7   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop de			;4dca
	pop hl			;4dcb
	pop bc			;4dcc
	ret			;4dcd
ficha_transparente:		; la ficha A a (D, E) con TIMP (LMMM 0x48)
	push bc			;4dce
	push hl			;4dcf
	push de			;4dd0
	call origen_de_ficha		;4dd1   ; origen_de_ficha: HL = (X, Y) de la ficha A en la pagina 1: (A & 31) * 8, (A >> 5) * 8
	ld bc,00808h		;4dd4
	ld a,048h		;4dd7
	call copia_con_operacion		;4dd9   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop de			;4ddc
	pop hl			;4ddd
	pop bc			;4dde
	ret			;4ddf
ficha_doble:		; las fichas A y A + 2 una debajo de otra, con TIMP
	push bc			;4de0
	push hl			;4de1
	push de			;4de2
	push af			;4de3
	push de			;4de4
	call origen_de_ficha		;4de5   ; origen_de_ficha: HL = (X, Y) de la ficha A en la pagina 1: (A & 31) * 8, (A >> 5) * 8
	ld bc,01008h		;4de8
	ld a,058h		;4deb
	call copia_con_operacion		;4ded   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop de			;4df0
	ld a,008h		;4df1
	add a,e			;4df3
	ld e,a			;4df4
	pop af			;4df5
	inc a			;4df6
	inc a			;4df7
	call origen_de_ficha		;4df8   ; origen_de_ficha: HL = (X, Y) de la ficha A en la pagina 1: (A & 31) * 8, (A >> 5) * 8
	ld bc,01008h		;4dfb
	ld a,058h		;4dfe
	call copia_con_operacion		;4e00   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop de			;4e03
	pop hl			;4e04
	pop bc			;4e05
	ret			;4e06
caracter_transparente:		; la ficha de A con TIMP (LMMM 0x58) en (D, E)
	push bc			;4e07
	push hl			;4e08
	push de			;4e09
	call origen_de_ficha		;4e0a   ; origen_de_ficha: HL = (X, Y) de la ficha A en la pagina 1: (A & 31) * 8, (A >> 5) * 8
	ld bc,00808h		;4e0d
	ld a,058h		;4e10
	call copia_con_operacion		;4e12   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop de			;4e15
	pop hl			;4e16
	pop bc			;4e17
	ret			;4e18
L_4E19:
	push bc			;4e19
	push hl			;4e1a
	push de			;4e1b
	call origen_de_ficha		;4e1c   ; origen_de_ficha: HL = (X, Y) de la ficha A en la pagina 1: (A & 31) * 8, (A >> 5) * 8
	ld bc,00808h		;4e1f
	ld a,005h		;4e22
	call copia_rectangulo		;4e24   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop de			;4e27
	pop hl			;4e28
	pop bc			;4e29
	ret			;4e2a
origen_de_ficha:		; HL = (X, Y) de la ficha A en la pagina 1: (A & 31) * 8, (A >> 5) * 8
	ld b,a			;4e2b   ; A & 31: la columna
	and 01fh		;4e2c
	add a,a			;4e2e
	add a,a			;4e2f
	add a,a			;4e30
	ld h,a			;4e31   ; * 8: la X en la pagina 1
	ld a,b			;4e32   ; A >> 5: la fila, * 8: la Y
	and 0e0h		;4e33
	rrca			;4e35
	rrca			;4e36
	ld l,a			;4e37
	ret			;4e38
avanza_caracter:		; D + 8 (+ 4 si el caracter es 0x7B), y E + 8 al pasar de linea
	cp 07bh		;4e39
	ld a,004h		;4e3b
	jr z,L_4E41		;4e3d
avanza_ocho:		; D + 8, y E + 8 si D da la vuelta
	ld a,008h		;4e3f
L_4E41:
	add a,d			;4e41   ; D + A; si da la vuelta, la siguiente linea (E + 8)
	ld d,a			;4e42
	ret nz			;4e43
	ld a,e			;4e44
	add a,008h		;4e45
	ld e,a			;4e47
	ret			;4e48
fichas_1_bit:		; B fichas de 1 bit de HL con los colores de 0xDF00 a la VRAM DE
	push bc			;4e49
	push de			;4e4a
	exx			;4e4b
	ld hl,0e800h		;4e4c   ; apunta a bufer de fichas decodificadas
	exx			;4e4f
L_4E50:
	push bc			;4e50
	call ficha_1_bit		;4e51   ; ficha_1_bit: 8 filas de 1 bit de HL a 4 bits en el bufer de HL'
	pop bc			;4e54
	djnz L_4E50		;4e55
	pop de			;4e57
	pop bc			;4e58
	ld hl,0e800h		;4e59   ; apunta a bufer de fichas decodificadas
	jp fichas_a_vram		;4e5c   ; fichas_a_vram: B fichas de 32 bytes de HL seguidas en la VRAM DE (0x400 por fila de fichas)
fichas_1_bit_volteadas:		; como p00:4E49, volteadas
	push bc			;4e5f
	push de			;4e60
	exx			;4e61
	ld hl,0e800h		;4e62   ; apunta a bufer de fichas decodificadas
	exx			;4e65
L_4E66:
	push bc			;4e66
	call ficha_1_bit		;4e67   ; ficha_1_bit: 8 filas de 1 bit de HL a 4 bits en el bufer de HL'
	pop bc			;4e6a
	djnz L_4E66		;4e6b
	pop de			;4e6d
	pop bc			;4e6e
	ld hl,0e800h		;4e6f   ; apunta a bufer de fichas decodificadas
	jp fichas_volteadas_a_vram		;4e72   ; fichas_volteadas_a_vram: B fichas volteadas de 0xE800 a la VRAM DE
ficha_1_bit:		; 8 filas de 1 bit de HL a 4 bits en el bufer de HL'
	ld b,008h		;4e75
L_4E77:
	ld e,(hl)			;4e77
	inc hl			;4e78
	push bc			;4e79
	call fila_1_bit		;4e7a   ; fila_1_bit: una fila de 1 bit (E) a 4 bytes con los colores de 0xDF00
	pop bc			;4e7d
	djnz L_4E77		;4e7e
	ret			;4e80
fila_1_bit:		; una fila de 1 bit (E) a 4 bytes con los colores de 0xDF00
	ld b,004h		;4e81
L_4E83:
	xor a			;4e83   ; un bit de E: el indice del primer punto
	rl e		;4e84
	rla			;4e86
	exx			;4e87
	ld e,a			;4e88
	ld d,0dfh		;4e89
	ld a,(de)			;4e8b   ; su color, de 0xDF00, en el nibble alto
	add a,a			;4e8c
	add a,a			;4e8d
	add a,a			;4e8e
	add a,a			;4e8f
	ld c,a			;4e90
	exx			;4e91
	xor a			;4e92   ; el segundo punto, en el nibble bajo
	rl e		;4e93
	rla			;4e95
	exx			;4e96
	ld e,a			;4e97
	ld d,0dfh		;4e98
	ld a,(de)			;4e9a
	or c			;4e9b
	ld (hl),a			;4e9c   ; el byte de dos puntos al bufer de HL'
	inc hl			;4e9d
	exx			;4e9e
	djnz L_4E83		;4e9f
	ret			;4ea1
fichas_2_bits:		; B fichas de 2 bits (16 bytes) de HL con los colores de 0xDF00 a la VRAM DE
	push bc			;4ea2
	push de			;4ea3
	exx			;4ea4
	ld hl,0e800h		;4ea5   ; apunta a bufer de fichas decodificadas
	exx			;4ea8
L_4EA9:
	push bc			;4ea9
	call ficha_2_bits		;4eaa   ; ficha_2_bits: 8 filas de 2 bits de HL al bufer
	pop bc			;4ead
	djnz L_4EA9		;4eae
	pop de			;4eb0
	pop bc			;4eb1
	ld hl,0e800h		;4eb2   ; apunta a bufer de fichas decodificadas
	jp fichas_a_vram		;4eb5   ; fichas_a_vram: B fichas de 32 bytes de HL seguidas en la VRAM DE (0x400 por fila de fichas)
fichas_2_bits_volteadas:		; como p00:4EA2, volteadas
	push bc			;4eb8
	push de			;4eb9
	exx			;4eba
	ld hl,0e800h		;4ebb   ; apunta a bufer de fichas decodificadas
	exx			;4ebe
L_4EBF:
	push bc			;4ebf
	call ficha_2_bits		;4ec0   ; ficha_2_bits: 8 filas de 2 bits de HL al bufer
	pop bc			;4ec3
	djnz L_4EBF		;4ec4
	pop de			;4ec6
	pop bc			;4ec7
	ld hl,0e800h		;4ec8   ; apunta a bufer de fichas decodificadas
	jp fichas_volteadas_a_vram		;4ecb   ; fichas_volteadas_a_vram: B fichas volteadas de 0xE800 a la VRAM DE
ficha_2_bits:		; 8 filas de 2 bits de HL al bufer
	ld b,008h		;4ece
L_4ED0:
	push bc			;4ed0
	call fila_2_bits		;4ed1   ; fila_2_bits: una fila de 2 bits (dos bytes) a 4 bytes con los colores de 0xDF00
	pop bc			;4ed4
	djnz L_4ED0		;4ed5
	ret			;4ed7
fila_2_bits:		; una fila de 2 bits (dos bytes) a 4 bytes con los colores de 0xDF00
	ld b,004h		;4ed8
	ld e,(hl)			;4eda
	inc hl			;4edb
	ld d,(hl)			;4edc
	inc hl			;4edd
L_4EDE:
	xor a			;4ede   ; el bit de D (plano 1) y el de E (plano 0): el indice de 2 bits
	rl d		;4edf
	rla			;4ee1
	rl e		;4ee2
	rla			;4ee4
	exx			;4ee5
	ld e,a			;4ee6
	ld d,0dfh		;4ee7
	ld a,(de)			;4ee9   ; su color de 0xDF00 en el nibble alto
	add a,a			;4eea
	add a,a			;4eeb
	add a,a			;4eec
	add a,a			;4eed
	ld c,a			;4eee
	exx			;4eef
	xor a			;4ef0   ; el segundo punto con los dos bits siguientes
	rl d		;4ef1
	rla			;4ef3
	rl e		;4ef4
	rla			;4ef6
	exx			;4ef7
	ld e,a			;4ef8
	ld d,0dfh		;4ef9
	ld a,(de)			;4efb
	or c			;4efc
	ld (hl),a			;4efd   ; los dos puntos al bufer
	inc hl			;4efe
	exx			;4eff
	djnz L_4EDE		;4f00
	ret			;4f02
fichas_3_bits:		; B fichas de 3 bits (24 bytes) de HL con los colores de 0xDF00 a la VRAM DE
	push bc			;4f03
	push de			;4f04
	exx			;4f05
	ld hl,0e800h		;4f06   ; apunta a bufer de fichas decodificadas
	exx			;4f09
L_4F0A:
	push bc			;4f0a
	call ficha_3_bits		;4f0b   ; ficha_3_bits: 8 filas de 3 bits de HL al bufer
	pop bc			;4f0e
	djnz L_4F0A		;4f0f
	pop de			;4f11
	pop bc			;4f12
	ld hl,0e800h		;4f13   ; apunta a bufer de fichas decodificadas
	jp fichas_a_vram		;4f16   ; fichas_a_vram: B fichas de 32 bytes de HL seguidas en la VRAM DE (0x400 por fila de fichas)
fichas_3_bits_volteadas:		; como p00:4F03, volteadas
	push bc			;4f19
	push de			;4f1a
	exx			;4f1b
	ld hl,0e800h		;4f1c   ; apunta a bufer de fichas decodificadas
	exx			;4f1f
L_4F20:
	push bc			;4f20
	call ficha_3_bits		;4f21   ; ficha_3_bits: 8 filas de 3 bits de HL al bufer
	pop bc			;4f24
	djnz L_4F20		;4f25
	pop de			;4f27
	pop bc			;4f28
	ld hl,0e800h		;4f29   ; apunta a bufer de fichas decodificadas
	jp fichas_volteadas_a_vram		;4f2c   ; fichas_volteadas_a_vram: B fichas volteadas de 0xE800 a la VRAM DE
ficha_3_bits:		; 8 filas de 3 bits de HL al bufer
	ld b,008h		;4f2f
L_4F31:
	push bc			;4f31
	call fila_3_bits		;4f32   ; fila_3_bits: una fila de 3 bits (tres bytes) a 4 bytes con los colores de 0xDF00
	pop bc			;4f35
	djnz L_4F31		;4f36
	ret			;4f38
fila_3_bits:		; una fila de 3 bits (tres bytes) a 4 bytes con los colores de 0xDF00
	ld b,004h		;4f39   ; una fila de 3 bits: tres bytes, uno por plano
	ld e,(hl)			;4f3b
	inc hl			;4f3c
	ld d,(hl)			;4f3d
	inc hl			;4f3e
	ld c,(hl)			;4f3f
	inc hl			;4f40
L_4F41:
	xor a			;4f41   ; los bits de C, D y E: el indice de 3 bits del primer punto
	rl c		;4f42
	rla			;4f44
	rl d		;4f45
	rla			;4f47
	rl e		;4f48
	rla			;4f4a
	exx			;4f4b
	ld e,a			;4f4c
	ld d,0dfh		;4f4d
	ld a,(de)			;4f4f   ; su color de 0xDF00 en el nibble alto
	add a,a			;4f50
	add a,a			;4f51
	add a,a			;4f52
	add a,a			;4f53
	ld c,a			;4f54
	exx			;4f55
	xor a			;4f56   ; el segundo punto con los tres bits siguientes
	rl c		;4f57
	rla			;4f59
	rl d		;4f5a
	rla			;4f5c
	rl e		;4f5d
	rla			;4f5f
	exx			;4f60
	ld e,a			;4f61
	ld d,0dfh		;4f62
	ld a,(de)			;4f64
	or c			;4f65
	ld (hl),a			;4f66   ; los dos puntos al bufer
	inc hl			;4f67
	exx			;4f68
	djnz L_4F41		;4f69
	ret			;4f6b
ficha_volteada_a_vram:		; una ficha de 32 bytes volteada a la VRAM DE
	push de			;4f6c
	ld a,(00007h)		;4f6d
	ld c,a			;4f70
	ld b,008h		;4f71
L_4F73:
	push bc			;4f73
	ex de,hl			;4f74
	call direccion_vram		;4f75   ; direccion_vram: R#14 y la direccion de ESCRITURA de VRAM de HL
	ex de,hl			;4f78
	ld b,004h		;4f79
L_4F7B:
	ld a,(hl)			;4f7b   ; la fila de derecha a izquierda (dec hl) con los nibbles cambiados (rrca x 4): volteada
	dec hl			;4f7c
	rrca			;4f7d
	rrca			;4f7e
	rrca			;4f7f
	rrca			;4f80
	out (c),a		;4f81
	djnz L_4F7B		;4f83
	ld c,008h		;4f85   ; HL + 8: de 3 a 7, la siguiente fila al reves
	add hl,bc			;4f87
	ex de,hl			;4f88
	ld c,080h		;4f89   ; DE + 0x80: la siguiente linea de la VRAM
	add hl,bc			;4f8b
	ex de,hl			;4f8c
	pop bc			;4f8d
	djnz L_4F73		;4f8e
	pop de			;4f90
	ret			;4f91
fichas_volteadas_a_vram:		; B fichas volteadas de 0xE800 a la VRAM DE
	inc hl			;4f92
	inc hl			;4f93
	inc hl			;4f94
L_4F95:
	push bc			;4f95
	call ficha_volteada_a_vram		;4f96   ; ficha_volteada_a_vram: una ficha de 32 bytes volteada a la VRAM DE
	ld a,004h		;4f99
	add a,e			;4f9b
	cp 080h		;4f9c
	jr nz,L_4FA5		;4f9e
	ld a,004h		;4fa0
	add a,d			;4fa2
	ld d,a			;4fa3
	xor a			;4fa4
L_4FA5:
	ld e,a			;4fa5
	pop bc			;4fa6
	djnz L_4F95		;4fa7
	ret			;4fa9
inicia_video:		; SCREEN 5 por CHGMOD, borra las dos paginas y pone R#1, R#5, R#6 y R#11
	call sonido_a_cero		;4faa   ; sonido_a_cero: deja el motor de sonido parado
	call sprites_apagados		;4fad   ; sprites_apagados: R#8 con el bit 1 (sin sprites)
	ld a,005h		;4fb0
	call 0005fh		;4fb2   ; BIOS CHGMOD - Switches to given screen mode
	call pantalla_apagada		;4fb5   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	xor a			;4fb8
	ld h,a			;4fb9
	ld l,a			;4fba
	ld b,a			;4fbb
	ld c,a			;4fbc
	ld d,a			;4fbd
	call rellena_rectangulo		;4fbe   ; rellena_rectangulo: HMMV (0xC0): rectangulo B x C en (H, L) de la pagina D con el color A
	xor a			;4fc1
	ld h,a			;4fc2
	ld l,a			;4fc3
	ld b,a			;4fc4
	ld c,a			;4fc5
	ld d,001h		;4fc6
	call rellena_rectangulo		;4fc8   ; rellena_rectangulo: HMMV (0xC0): rectangulo B x C en (H, L) de la pagina D con el color A
	call espera_al_vdp		;4fcb   ; espera_al_vdp: espera a que acabe el comando del VDP (S#2 bit 0)
	ld b,004h		;4fce
	ld hl,04fe6h		;4fd0
L_4FD3:
	push bc			;4fd3
	ld c,(hl)			;4fd4
	inc hl			;4fd5
	ld b,(hl)			;4fd6
	inc hl			;4fd7
	push hl			;4fd8
	call 00047h		;4fd9   ; BIOS WRTVDP - Writes data in the VDP-register
	pop hl			;4fdc
	pop bc			;4fdd
	djnz L_4FD3		;4fde
	call esconde_sprites		;4fe0   ; esconde_sprites: Y = 0xE0 en las dos tablas de atributos (0x7600 y 0xF600)
	jp pantalla_encendida		;4fe3   ; pantalla_encendida: R#1 con el bit 6 (pantalla) y sprites encendidos

; ----------------------------------------------------------------------
; DATOS registros_vdp: 4 x [registro][valor] que p00:4FD0 escribe con WRTVDP:
;   R#1 = 0x62, R#5 = 0xEF, R#6 = 0x1F, R#11 = 1; lo leen p00:4FD0 (8 bytes)
;   0x4fe6..0x4fee  (8 bytes)
DATA_registros_vdp:
	defb 001h,062h	; 4fe6
	defb 005h,0efh	; 4fe8
	defb 006h,01fh	; 4fea
	defb 00bh,001h	; 4fec

; ======================================================================
; CODIGO 0x4fee..0x5062  (116 bytes)
; ======================================================================


lee_mandos:		; fuera de partida (0xC002 bit 6 a cero) salta a p01:6017; si no lee mandos y teclado a 0xC006/0xC007
	ld a,(0c002h)		;4fee   ; lee las banderas (bit 6: en partida)
	and 040h		;4ff1
	jp z,06017h		;4ff3
	call lee_teclas		;4ff6   ; lee_teclas: A = teclas de las filas 6 y 7 de la matriz
	ld hl,0c00fh		;4ff9
	call teclas_nuevas		;4ffc   ; teclas_nuevas: (HL) = las teclas de A; (HL - 1) = las que no estaban antes
	call lee_joystick_y_teclado		;4fff   ; lee_joystick_y_teclado: A = mando del puerto 1 (PSG 14) con las teclas del cursor y espacio
L_5002:
	ld hl,0c007h		;5002   ; apunta a las teclas que hay
teclas_nuevas:		; (HL) = las teclas de A; (HL - 1) = las que no estaban antes
	ld c,(hl)			;5005   ; C = las teclas del cuadro anterior; (HL) = las de ahora
	ld (hl),a			;5006
	xor c			;5007   ; las que estan ahora y no antes: las nuevas, en (HL - 1)
	and (hl)			;5008
	dec hl			;5009
	ld (hl),a			;500a
	ret			;500b
lee_joystick_y_teclado:		; A = mando del puerto 1 (PSG 14) con las teclas del cursor y espacio
	ld e,08fh		;500c   ; PSG 15 = 0x8F: el puerto de joystick 1
	ld a,00fh		;500e
	call 00093h		;5010   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,00eh		;5013   ; PSG 14: los bits del mando (a cero, pulsado)
	di			;5015
	call 00096h		;5016   ; BIOS RDPSG - Reads value from PSG-register
	ei			;5019
	cpl			;501a   ; cpl: a uno lo pulsado; 6 bits (arriba, abajo, izquierda, derecha, A, B)
	and 03fh		;501b
	push af			;501d
	ld a,006h		;501e   ; fila 6 de la matriz (SHIFT, CTRL, GRAPH...): su bit 1 pasa al bit 5
	call 00141h		;5020   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5023
	rlca			;5024
	rlca			;5025
	rlca			;5026
	rlca			;5027
	and 020h		;5028
	ld e,a			;502a
	ld a,008h		;502b   ; fila 8: espacio y las flechas
	call 00141h		;502d   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5030
	rrca			;5031   ; fila 8 rotada: quedan arriba (0), abajo (1), izquierda (2), derecha (3) y espacio (4), como los bits del mando
	rrca			;5032
	ld b,a			;5033
	and 004h		;5034
	or e			;5036
	ld c,a			;5037
	ld a,b			;5038
	rrca			;5039
	rrca			;503a
	ld b,a			;503b
	and 018h		;503c
	or c			;503e
	ld c,a			;503f
	ld a,b			;5040
	rrca			;5041
	and 003h		;5042
	or c			;5044
	ld e,a			;5045
	pop bc			;5046   ; todo junto: mando OR teclado
	or b			;5047
	ret			;5048
lee_teclas:		; A = teclas de las filas 6 y 7 de la matriz
	ld a,006h		;5049
	call 00141h		;504b   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;504e
	rlca			;504f
	rlca			;5050
	rlca			;5051
	and 007h		;5052
	ld e,a			;5054
	ld a,007h		;5055
	call 00141h		;5057   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;505a
	rlca			;505b
	rlca			;505c
	rlca			;505d
	and 018h		;505e
	or e			;5060
	ret			;5061

; ----------------------------------------------------------------------
; DATOS texto_5062: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p00:4685 (6 bytes)
;   0x5062..0x5068  (6 bytes)
DATA_texto_5062:
	defb 00ch,006h,040h,033h,03eh,0ffh	; 5062

; ----------------------------------------------------------------------
; DATOS texto_5068: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p05:9880 (32 bytes)
;   0x5068..0x5088  (32 bytes)
DATA_texto_5068:
	defb 050h,0a4h,045h,035h,039h,038h,02bh,037h,033h,020h,022h,02ah,029h,028h,0feh,048h	; 5068  P.E598+73 "*)(.H
	defb 0b4h,03ah,03fh,03dh,032h,020h,03dh,03ah,02bh,02dh,02fh,020h,035h,02fh,043h,0ffh	; 5078  .:?=2 =:+-/ 5/C.

; ----------------------------------------------------------------------
; DATOS texto_5088: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p00:4464 (13 bytes)
;   0x5088..0x5095  (13 bytes)
DATA_texto_5088:
	defb 060h,058h,031h,02bh,037h,02fh,020h,020h,039h,040h,02fh,03ch,0ffh	; 5088  `X1+7/  9@/<.

; ----------------------------------------------------------------------
; DATOS texto_5095: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p00:443A (15 bytes)
;   0x5095..0x50a4  (15 bytes)
DATA_texto_5095:
	defb 058h,068h,030h,026h,020h,020h,02dh,039h,038h,03eh,033h,038h,03fh,02fh,0ffh	; 5095  Xh0&  -98>38?/.

; ----------------------------------------------------------------------
; DATOS texto_50A4: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p00:41BB (17 bytes)
;   0x50a4..0x50b5  (17 bytes)
DATA_texto_50A4:
	defb 048h,0b4h,020h,020h,03ah,036h,02bh,043h,020h,03dh,03eh,02bh,03ch,03eh,020h,020h	; 50a4  H.  :6+C =>+<>
	defb 0ffh	; 50b4

; ======================================================================
; CODIGO 0x50b5..0x57bc  (1799 bytes)
; ======================================================================


rle_guardando_hl:		; p00:5578 sin tocar HL
	push hl			;50b5
	call rle		;50b6   ; rle: RLE de DE a HL: 0 acaba, n < 0x80 repite el siguiente, si no copia n & 0x7F
	pop hl			;50b9
	ret			;50ba
caracteres_guardando_hl:		; p00:4CBF sin tocar HL
	push hl			;50bb
	call caracteres		;50bc   ; caracteres: B caracteres de 1 bit de HL en (D, E) de la pagina 1 con el color C
	pop hl			;50bf
	ret			;50c0
carga_la_fuente:		; con 13-14-15: la fuente (p14:9289) y los caracteres del marcador
	call bancos_13_14_15		;50c1   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	ld de,09289h		;50c4
	ld hl,0e800h		;50c7   ; apunta a bufer de fichas decodificadas
	call rle_guardando_hl		;50ca   ; rle_guardando_hl: p00:5578 sin tocar HL
	push hl			;50cd
	ld de,00040h		;50ce
	ld bc,09c0dh		;50d1
	call caracteres		;50d4   ; caracteres: B caracteres de 1 bit de HL en (D, E) de la pagina 1 con el color C
	ld de,06058h		;50d7
	ld hl,0970ch		;50da
	ld bc,0010ah		;50dd
	call caracteres		;50e0   ; caracteres: B caracteres de 1 bit de HL en (D, E) de la pagina 1 con el color C
	ld de,0ac34h		;50e3
	ld hl,09714h		;50e6
	call ficha_a_vram		;50e9   ; ficha_a_vram: una ficha de 8x8 a 4 bits (32 bytes de HL) en la VRAM DE
	pop hl			;50ec
	ld de,09734h		;50ed
	call rle_guardando_hl		;50f0   ; rle_guardando_hl: p00:5578 sin tocar HL
	ld de,000c0h		;50f3
	ld bc,0080bh		;50f6
	call caracteres_guardando_hl		;50f9   ; caracteres_guardando_hl: p00:4CBF sin tocar HL
	ld de,040c0h		;50fc
	ld bc,0080ah		;50ff
	call caracteres_guardando_hl		;5102   ; caracteres_guardando_hl: p00:4CBF sin tocar HL
	ld de,09776h		;5105
	call rle_guardando_hl		;5108   ; rle_guardando_hl: p00:5578 sin tocar HL
	ld de,000c8h		;510b
	ld bc,0080bh		;510e
	call caracteres_guardando_hl		;5111   ; caracteres_guardando_hl: p00:4CBF sin tocar HL
	ld de,040c8h		;5114
	ld bc,0080ah		;5117
	call caracteres		;511a   ; caracteres: B caracteres de 1 bit de HL en (D, E) de la pagina 1 con el color C
	jp bancos_1_2_3		;511d   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
graficos_del_titulo:		; la fuente, CHGCLR y las fichas del titulo
	call apaga_y_borra		;5120   ; apaga_y_borra: esconde los sprites y borra la pagina 0 con la pantalla apagada
	call carga_la_fuente		;5123   ; carga_la_fuente: con 13-14-15: la fuente (p14:9289) y los caracteres del marcador
	ld a,00fh		;5126
	ld (0f3ebh),a		;5128
	call 00062h		;512b   ; BIOS CHGCLR - Changes the screen colors
	ld bc,00007h		;512e
	call 00047h		;5131   ; BIOS WRTVDP - Writes data in the VDP-register
	call bancos_4_5_6		;5134   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 096b5h		;5137
	call bancos_1_2_3		;513a   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0002bh)		;513d
	and 00fh		;5140
	ret nz			;5142
	call bancos_10_11_12		;5143   ; bancos_10_11_12: pone los bancos 10-11-12 (p00:5490)
	ld hl,0b37ah		;5146
	ld de,08048h		;5149
	ld bc,02c0dh		;514c
	call caracteres		;514f   ; caracteres: B caracteres de 1 bit de HL en (D, E) de la pagina 1 con el color C
	jp bancos_1_2_3		;5152   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
graficos_de_antesala:		; la lista de fichas de la antesala (p07:60B0[ruina]) y la de p12:A7AA
	call bancos_7_8_9		;5155   ; bancos_7_8_9: pone los bancos 7-8-9 (p00:5490)
	ld hl,060b0h		;5158
	ld a,(0c21dh)		;515b   ; lee la ruina (0-4)
	call palabra_a		;515e   ; palabra_a: HL = la palabra A de la tabla HL
	ld de,06064h		;5161
	call lista_de_fichas		;5164   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
	call bancos_10_11_12		;5167   ; bancos_10_11_12: pone los bancos 10-11-12 (p00:5490)
	ld hl,0a7aah		;516a
	ld de,0a7a4h		;516d
	call lista_de_fichas		;5170   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
	call bancos_4_5_6		;5173   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0b9d8h		;5176   ; compone_puertas: compone en la pagina 1 los marcos y hojas de las puertas
	jp bancos_1_2_3		;5179   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
graficos_de_ruina:		; con 7-8-9: la lista de fichas de la ruina (p07:6000), o las de la sala 5 (p00:51D4)
	call bancos_7_8_9		;517c   ; bancos_7_8_9: pone los bancos 7-8-9 (p00:5490)
	ld a,(0c20ah)		;517f   ; lee en la sala de la puerta 5
	and a			;5182
	jr nz,graficos_de_sala5		;5183
	call fichas_de_la_ruina_fijas		;5185   ; fichas_de_la_ruina_fijas: colores 4, 5, 15, 3 y las dos fichas de p08:89F9 en 0x8040 y 0x8048
	ld hl,06000h		;5188
	jp lista_de_la_ruina		;518b   ; lista_de_la_ruina: DE y HL de p07:6000 + 4 * ruina y p00:529C
fichas_de_la_ruina_fijas:		; colores 4, 5, 15, 3 y las dos fichas de p08:89F9 en 0x8040 y 0x8048
	ld hl,0df00h		;518e   ; apunta a los colores de la lista de fichas en curso
	ld (hl),004h		;5191
	inc l			;5193
	ld (hl),005h		;5194
	inc l			;5196
	ld (hl),00fh		;5197
	inc l			;5199
	ld (hl),003h		;519a
	ld de,08040h		;519c
	call dos_fichas_89f9		;519f   ; dos_fichas_89f9: las 2 fichas de 2 bits de p08:89F9 en la VRAM DE
	ld de,08048h		;51a2
dos_fichas_89f9:		; las 2 fichas de 2 bits de p08:89F9 en la VRAM DE
	ld hl,089f9h		;51a5
	ld b,002h		;51a8
	jp fichas_2_bits		;51aa   ; fichas_2_bits: B fichas de 2 bits (16 bytes) de HL con los colores de 0xDF00 a la VRAM DE
graficos_de_escena:		; listas de fichas p07:61C1 y p04:799C
	call bancos_7_8_9		;51ad   ; bancos_7_8_9: pone los bancos 7-8-9 (p00:5490)
	ld de,06064h		;51b0
	ld hl,061c1h		;51b3
	call lista_de_fichas		;51b6   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
	call bancos_4_5_6		;51b9   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	ld de,0798ah		;51bc
	ld hl,0799ch		;51bf
	jp lista_de_fichas		;51c2   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
fichas_comunes:		; con 13-14-15: la lista p15:BB95 y p15:B4EB
	call bancos_13_14_15		;51c5   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	ld de,0bb71h		;51c8
	ld hl,0bb95h		;51cb
	call lista_y_vuelve		;51ce   ; lista_y_vuelve: p00:529C y vuelve con 1-2-3
	jp 0b4ebh		;51d1
graficos_de_sala5:		; la lista p08:8A35 y el dibujo de p06:B105 con sus remiendos
	ld hl,08a35h		;51d4
	ld de,08a19h		;51d7
	call lista_de_fichas		;51da   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
	call bancos_4_5_6		;51dd   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	ld hl,0e800h		;51e0   ; apunta a bufer de fichas decodificadas
	ld de,0b105h		;51e3
	call rle		;51e6   ; rle: RLE de DE a HL: 0 acaba, n < 0x80 repite el siguiente, si no copia n & 0x7F
	ld a,(0c21dh)		;51e9   ; lee la ruina (0-4)
	inc a			;51ec
	ld b,a			;51ed
	xor a			;51ee
L_51EF:
	push af			;51ef
	push bc			;51f0
	call remiendo		;51f1   ; remiendo: los remiendos A del dibujo de 0xE800 (p06:B18A)
	pop bc			;51f4
	pop af			;51f5
	inc a			;51f6
	djnz L_51EF		;51f7
	ld a,001h		;51f9
	ld (0c20bh),a		;51fb   ; guarda las fichas van a la pagina 1
	ld hl,0e800h		;51fe   ; apunta a bufer de fichas decodificadas
	ld c,00eh		;5201
	ld de,09060h		;5203
L_5206:
	ld b,00eh		;5206
	push de			;5208
L_5209:
	ld a,(hl)			;5209
	call ficha		;520a   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	inc hl			;520d
	ld a,d			;520e
	add a,008h		;520f
	ld d,a			;5211
	djnz L_5209		;5212
	pop de			;5214
	ld a,e			;5215
	add a,008h		;5216
	ld e,a			;5218
	dec c			;5219
	jr nz,L_5206		;521a
	call copia_c094		;521c   ; copia_c094: copia 16 x 16 de (0xC0, 0x94) de la pagina 1 y la ficha doble 0x14
	call fichas_de_p_aafa		;521f   ; fichas_de_p_aafa: 3 x 2 fichas con los numeros de 0xAAFA en (0x98, 0x60)
L_5222:
	xor a			;5222
	ld (0c20bh),a		;5223   ; guarda las fichas van a la pagina 1
	jp bancos_1_2_3		;5226   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
fichas_de_p_aafa:		; 3 x 2 fichas con los numeros de 0xAAFA en (0x98, 0x60)
	ld hl,0aafah		;5229
	ld de,06098h		;522c
	ld b,003h		;522f
L_5231:
	push de			;5231
	ld a,h			;5232
	call ficha		;5233   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	ld a,d			;5236
	add a,008h		;5237
	ld d,a			;5239
	inc h			;523a
	ld a,l			;523b
	call ficha		;523c   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	inc l			;523f
	pop de			;5240
	ld a,e			;5241
	add a,008h		;5242
	ld e,a			;5244
	djnz L_5231		;5245
	ret			;5247
remiendo:		; los remiendos A del dibujo de 0xE800 (p06:B18A)
	ld hl,0b18ah		;5248
	call palabra_a		;524b   ; palabra_a: HL = la palabra A de la tabla HL
L_524E:
	ld a,(hl)			;524e   ; [lo][hi] en 0xE800; 0 acaba
	or a			;524f
	ret z			;5250
	ld e,a			;5251
	inc hl			;5252
	ld d,(hl)			;5253
	inc hl			;5254
	ld b,(hl)			;5255   ; [ancho][alto]
	inc hl			;5256
	ld c,(hl)			;5257
	inc hl			;5258
L_5259:
	push bc			;5259
	push de			;525a
L_525B:
	ld a,(hl)			;525b
	or a			;525c
	jr z,L_5260		;525d
	ld (de),a			;525f
L_5260:
	inc hl			;5260
	inc de			;5261
	djnz L_525B		;5262
	pop de			;5264
	ld a,00eh		;5265
	call de_mas_a		;5267   ; de_mas_a: DE = DE + A
	pop bc			;526a
	dec c			;526b
	jr nz,L_5259		;526c
	jr L_524E		;526e
copia_c094:		; copia 16 x 16 de (0xC0, 0x94) de la pagina 1 y la ficha doble 0x14
	ld hl,0c094h		;5270   ; apunta a la ficha del canal de efectos
	ld de,08078h		;5273
	ld bc,01010h		;5276
	ld a,005h		;5279
	call copia_rectangulo		;527b   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	ld a,014h		;527e
	ld de,0c094h		;5280   ; apunta a la ficha del canal de efectos
	jp ficha_doble		;5283   ; ficha_doble: las fichas A y A + 2 una debajo de otra, con TIMP
lista_de_la_ruina:		; DE y HL de p07:6000 + 4 * ruina y p00:529C
	ld a,(0c21dh)		;5286   ; lee la ruina (0-4)
	add a,a			;5289
	add a,a			;528a
	call hl_mas_a		;528b   ; hl_mas_a: HL = HL + A
	ld e,(hl)			;528e
	inc hl			;528f
	ld d,(hl)			;5290
	inc hl			;5291
	ld a,(hl)			;5292
	inc hl			;5293
	ld h,(hl)			;5294
	ld l,a			;5295
lista_y_vuelve:		; p00:529C y vuelve con 1-2-3
	call lista_de_fichas		;5296   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
	jp bancos_1_2_3		;5299   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
lista_de_fichas:		; lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
	ld b,(hl)			;529c
	inc hl			;529d
L_529E:
	push bc			;529e   ; cada ficha de la lista: [c]
	push de			;529f
	ld a,(hl)			;52a0
	ld c,a			;52a1
	ex de,hl			;52a2
	and 0f0h		;52a3   ; c >> 4: el indice en la tabla de colores (DE)
	rrca			;52a5
	rrca			;52a6
	rrca			;52a7
	rrca			;52a8
	call palabra_a		;52a9   ; palabra_a: HL = la palabra A de la tabla HL
	push de			;52ac
	push bc			;52ad
	ld a,c			;52ae   ; c & 6: 0 para 1 bit, 2 para 2 bits, 4 para 3 bits; * 2 colores (o 2)
	and 006h		;52af
	add a,a			;52b1
	jr nz,L_52B6		;52b2
	ld a,002h		;52b4
L_52B6:
	ld c,a			;52b6   ; los colores a 0xDF00
	ld b,000h		;52b7
	ld de,0df00h		;52b9   ; apunta a los colores de la lista de fichas en curso
	ldir		;52bc
	pop bc			;52be
	pop hl			;52bf
	inc hl			;52c0
	ld e,(hl)			;52c1   ; [destino lo][hi], [cuantas] y [origen lo][hi]
	inc hl			;52c2
	ld d,(hl)			;52c3
	inc hl			;52c4
	ld b,(hl)			;52c5
	inc hl			;52c6
	ld a,(hl)			;52c7
	inc hl			;52c8
	push hl			;52c9
	ld h,(hl)			;52ca
	ld l,a			;52cb
	call decodifica_fichas		;52cc   ; el decodificador del formato c & 0x0F
	pop hl			;52cf
	pop de			;52d0
	inc hl			;52d1   ; 6 bytes por ficha de la lista
	pop bc			;52d2
	djnz L_529E		;52d3
	ret			;52d5
decodifica_fichas:		; el decodificador del formato C & 0x0F: 1, 2 o 3 bits, normal o volteado
	ld a,c			;52d6
	and 00fh		;52d7
	jp z,fichas_1_bit		;52d9   ; fichas_1_bit: B fichas de 1 bit de HL con los colores de 0xDF00 a la VRAM DE
	dec a			;52dc
	jp z,fichas_1_bit_volteadas		;52dd   ; fichas_1_bit_volteadas: como p00:4E49, volteadas
	dec a			;52e0
	jp z,fichas_2_bits		;52e1   ; fichas_2_bits: B fichas de 2 bits (16 bytes) de HL con los colores de 0xDF00 a la VRAM DE
	dec a			;52e4
	jp z,fichas_2_bits_volteadas		;52e5   ; fichas_2_bits_volteadas: como p00:4EA2, volteadas
	dec a			;52e8
	jp z,fichas_3_bits		;52e9   ; fichas_3_bits: B fichas de 3 bits (24 bytes) de HL con los colores de 0xDF00 a la VRAM DE
	jp fichas_3_bits_volteadas		;52ec   ; fichas_3_bits_volteadas: como p00:4F03, volteadas
caracteres_93:		; 6 parejas del caracter 0x93 en la pagina 1 desde (0x88, 0x30)
	ld a,001h		;52ef
	ld (0c20bh),a		;52f1   ; guarda las fichas van a la pagina 1
	ld de,03088h		;52f4
	ld bc,00693h		;52f7
L_52FA:
	push de			;52fa
	ld a,c			;52fb
	call caracter_de_la_fuente		;52fc   ; caracter_de_la_fuente: el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
	ld a,d			;52ff
	add a,008h		;5300
	ld d,a			;5302
	ld a,c			;5303
	call caracter_de_la_fuente		;5304   ; caracter_de_la_fuente: el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
	pop de			;5307
	ld a,e			;5308
	add a,008h		;5309
	ld e,a			;530b
	djnz L_52FA		;530c
	xor a			;530e
	ld (0c20bh),a		;530f   ; guarda las fichas van a la pagina 1
	call bancos_10_11_12		;5312   ; bancos_10_11_12: pone los bancos 10-11-12 (p00:5490)
	ld hl,0df00h		;5315   ; apunta a los colores de la lista de fichas en curso
	ld (hl),00ah		;5318
	inc l			;531a
	ld (hl),00ch		;531b
	inc l			;531d
	ld (hl),00eh		;531e
	inc l			;5320
	ld (hl),00fh		;5321
	ld hl,0b272h		;5323
	call fase_de_la_ruina		;5326   ; fase_de_la_ruina: A = 0xC211 - (ruina * 5 + 1): la fase dentro de la ruina
	call palabra_a		;5329   ; palabra_a: HL = la palabra A de la tabla HL
	push hl			;532c
	ld de,0c818h		;532d
	ld b,002h		;5330
	call fichas_2_bits		;5332   ; fichas_2_bits: B fichas de 2 bits (16 bytes) de HL con los colores de 0xDF00 a la VRAM DE
	pop hl			;5335
	ld a,020h		;5336
	call hl_mas_a		;5338   ; hl_mas_a: HL = HL + A
	ld de,0cc18h		;533b
	ld b,002h		;533e
	call fichas_2_bits		;5340   ; fichas_2_bits: B fichas de 2 bits (16 bytes) de HL con los colores de 0xDF00 a la VRAM DE
	jp bancos_1_2_3		;5343   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
fase_de_la_ruina:		; A = 0xC211 - (ruina * 5 + 1): la fase dentro de la ruina
	ld a,(0c21dh)		;5346   ; lee la ruina (0-4)
	ld b,a			;5349
	add a,a			;534a
	add a,a			;534b
	add a,b			;534c
	inc a			;534d
	ld b,a			;534e
	ld a,(0c211h)		;534f   ; lee la fase (1-25: ruina * 5 + puerta)
	sub b			;5352
	ret			;5353
caracteres_de_p07:		; con 7-8-9: los 2 x 5 caracteres de p07:6014 y p07:603C
	call bancos_7_8_9		;5354   ; bancos_7_8_9: pone los bancos 7-8-9 (p00:5490)
	ld hl,06014h		;5357
	ld de,01402h		;535a
	ld bc,0050ah		;535d
	call caracteres_pagina0		;5360   ; caracteres_pagina0: como p00:4CBF en la pagina 0
	ld hl,0603ch		;5363
	ld de,0140ah		;5366
	ld bc,0050ah		;5369
	call caracteres_pagina0		;536c   ; caracteres_pagina0: como p00:4CBF en la pagina 0
	jp bancos_1_2_3		;536f   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
graficos_comunes_de_fase:		; con 10-11-12: la lista p12:ADE3 y el texto p12:AF48
	call bancos_10_11_12		;5372   ; bancos_10_11_12: pone los bancos 10-11-12 (p00:5490)
	ld hl,0ade3h		;5375
	ld de,0adcbh		;5378
	call lista_de_fichas		;537b   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
	ld a,001h		;537e
	ld (0c20bh),a		;5380   ; guarda las fichas van a la pagina 1
	ld hl,0af48h		;5383
	call texto		;5386   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	jp L_5222		;5389
sprites_del_enemigo:		; salvo los tipos 8, 9 y 10, los patrones del tipo A (p15:ADDA)
	ld a,(de)			;538c   ; los tipos 8, 9 y 10 no llevan patrones propios (p15:ADDA)
	cp 009h		;538d
	ret z			;538f
	cp 00ah		;5390
	ret z			;5392
	cp 008h		;5393
	ret z			;5395
sprites_del_tipo:		; los patrones del tipo A de p15:ADDA a la VRAM (p00:4926)
	ld hl,0addah		;5396
	call palabra_a		;5399   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;539c
	jp rle_a_vram_con_destino		;539d   ; rle_a_vram_con_destino: lee la direccion de VRAM de (DE) y sigue en p00:492C
patrones_b511:		; con 13-14-15: el RLE de p15:B511 a la VRAM 0xFFC0
	call bancos_13_14_15		;53a0   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	ld hl,0ffc0h		;53a3
	ld de,0b511h		;53a6
	call rle_a_vram		;53a9   ; rle_a_vram: RLE de DE a la VRAM HL: 0 acaba, n < 0x80 repite, 0x80 otra direccion, si no copia n & 0x7F
	jp bancos_1_2_3		;53ac   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
lista_af78:		; con 4-5-6: la lista p06:AF78
	call bancos_4_5_6		;53af   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	ld hl,0af78h		;53b2
	ld de,0af6ch		;53b5
	jp lista_y_vuelve		;53b8   ; lista_y_vuelve: p00:529C y vuelve con 1-2-3
lista_af81:		; con 10-11-12: la lista p12:AF81
	call bancos_10_11_12		;53bb   ; bancos_10_11_12: pone los bancos 10-11-12 (p00:5490)
	ld hl,0af81h		;53be
	ld de,0af6bh		;53c1
	jp lista_y_vuelve		;53c4   ; lista_y_vuelve: p00:529C y vuelve con 1-2-3
paleta_de_fase:		; p06:B335 y la paleta de la ruina (p06:B2DB), o la de la sala 5 (p06:B35C)
	call paleta_base		;53c7   ; paleta_base: con 4-5-6: la paleta p06:B335
	ld a,(0c20ah)		;53ca   ; lee en la sala de la puerta 5
	and a			;53cd
	jr nz,L_53F2		;53ce
	call bancos_4_5_6		;53d0   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	ld a,(0c21dh)		;53d3   ; lee la ruina (0-4)
	ld hl,0b2dbh		;53d6
	call palabra_a		;53d9   ; palabra_a: HL = la palabra A de la tabla HL
	jr paleta_y_vuelve		;53dc
paleta_base:		; con 4-5-6: la paleta p06:B335
	call bancos_4_5_6		;53de   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	ld hl,0b335h		;53e1
	jr paleta_y_vuelve		;53e4
paleta_b550:		; con 4-5-6: la paleta p06:B550
	call bancos_4_5_6		;53e6   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	ld hl,0b550h		;53e9
paleta_y_vuelve:		; p00:4A9D y vuelve con 1-2-3
	call pon_paleta		;53ec   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
	jp bancos_1_2_3		;53ef   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_53F2:
	call bancos_4_5_6		;53f2   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	ld a,(0c21dh)		;53f5   ; lee la ruina (0-4)
	ld hl,0b35ch		;53f8
	call palabra_a		;53fb   ; palabra_a: HL = la palabra A de la tabla HL
	jr paleta_y_vuelve		;53fe
paleta_vacia:		; fuera de la sala 5: la paleta p06:B35B (vacia)
	ld a,(0c20ah)		;5400   ; lee en la sala de la puerta 5
	and a			;5403
	ret nz			;5404
	call bancos_4_5_6		;5405   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	ld hl,0b35bh		;5408
	jr paleta_y_vuelve		;540b
paleta_de_antesala:		; p06:B271 y la de la ruina (p06:B281)
	call bancos_4_5_6		;540d   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	ld hl,0b271h		;5410
	call pon_paleta		;5413   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
	ld a,(0c21dh)		;5416   ; lee la ruina (0-4)
	ld hl,0b281h		;5419
	call palabra_a		;541c   ; palabra_a: HL = la palabra A de la tabla HL
	jr paleta_y_vuelve		;541f
L_5421:
	call bancos_13_14_15		;5421   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	ld a,c			;5424
	and a			;5425
	ld hl,0b411h		;5426
	jr nz,L_542E		;5429
	ld hl,0b491h		;542b
L_542E:
	ld de,0fe00h		;542e
	ld bc,00080h		;5431
	call copia_a_vram		;5434   ; copia_a_vram: copia BC bytes de HL a la VRAM DE (otir)
	jp bancos_1_2_3		;5437   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
palabra_a:		; HL = la palabra A de la tabla HL
	add a,a			;543a
	call hl_mas_a		;543b   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;543e
	inc hl			;543f
	ld h,(hl)			;5440
	ld l,a			;5441
	ret			;5442
esconde_sprites_ram:		; Y = 0xE0 en los 32 atributos de 0xDE00
	ld hl,0de00h		;5443   ; apunta a los atributos de los sprites en RAM
	ld b,020h		;5446
L_5448:
	ld (hl),0e0h		;5448   ; Y = 0xE0 (fuera de la pantalla) en los 32 sprites
	inc l			;544a
	inc l			;544b
	inc l			;544c
	inc l			;544d
	djnz L_5448		;544e
	ret			;5450
L_5451:
	call sonido		;5451   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	jr bancos_4_5_6		;5454
L_5456:
	call bancos_1_2_3		;5456   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	call 07ff2h		;5459
	jr bancos_4_5_6		;545c
L_545E:
	call bancos_4_5_6		;545e   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0bc36h		;5461   ; vuelve_un_personaje: la ficha inicial (p06:BF6C) del personaje que no vive
bancos_1_2_3:		; pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	di			;5464
	push hl			;5465
	ld hl,0f0f1h		;5466   ; apunta a la copia del banco de 0x6000
	ld a,001h		;5469
	ld (06000h),a		;546b   ; el mapper: pone en 0x6000 el banco de A
	ld (hl),a			;546e
	inc a			;546f
	ld (08000h),a		;5470   ; el mapper: pone en 0x8000 el banco de A
	inc hl			;5473
	ld (hl),a			;5474
	inc a			;5475
	ld (0a000h),a		;5476   ; el mapper: pone en 0xA000 el banco de A
	inc hl			;5479
	ld (hl),a			;547a
	pop hl			;547b
	ei			;547c
	ret			;547d
bancos_4_5_6:		; pone los bancos 4-5-6 (p00:5490)
	di			;547e
	ld a,004h		;547f
	jr L_5490		;5481
bancos_7_8_9:		; pone los bancos 7-8-9 (p00:5490)
	di			;5483
	ld a,007h		;5484
	jr L_5490		;5486
bancos_10_11_12:		; pone los bancos 10-11-12 (p00:5490)
	di			;5488
	ld a,00ah		;5489
	jr L_5490		;548b
bancos_13_14_15:		; pone los bancos 13-14-15 y su copia
	di			;548d
	ld a,00dh		;548e
L_5490:
	ld hl,0f0f1h		;5490   ; apunta a la copia del banco de 0x6000
	ld (06000h),a		;5493   ; el mapper: pone en 0x6000 el banco de A
	ld (hl),a			;5496
	inc l			;5497
	inc a			;5498
	ld (08000h),a		;5499   ; el mapper: pone en 0x8000 el banco de A
	ld (hl),a			;549c
	inc l			;549d
	inc a			;549e
	ld (0a000h),a		;549f   ; el mapper: pone en 0xA000 el banco de A
	ld (hl),a			;54a2
	ei			;54a3
	ret			;54a4
banco_15_en_a000:		; pone el banco 15 en 0xA000 (p00:54B9)
	di			;54a5
	ld a,00fh		;54a6
	jr L_54B9		;54a8
banco_12_en_a000:		; pone el banco 12 en 0xA000
	di			;54aa
	ld a,00ch		;54ab
	jr L_54B9		;54ad
banco_9_en_a000:		; pone el banco 9 en 0xA000
	di			;54af
	ld a,009h		;54b0
	jr L_54B9		;54b2
banco_6_en_a000:		; pone el banco 6 en 0xA000
	di			;54b4
	ld a,006h		;54b5
	jr L_54B9		;54b7
L_54B9:
	ld (0a000h),a		;54b9   ; el mapper: pone en 0xA000 el banco de A
	ld (0f0f3h),a		;54bc   ; guarda la copia del banco de 0xA000
	ei			;54bf
	ret			;54c0
musica_de_fase_otra:		; como p00:54C8 con 0xDE80 = 1
	ld a,001h		;54c1
	ld (0de80h),a		;54c3   ; guarda variable de trabajo del banco 0
	jr L_54D2		;54c6
musica_de_fase:		; la musica de la ruina segun el personaje (p15:BE7A), o la de la sala 5
	ld a,(0c20ah)		;54c8   ; lee en la sala de la puerta 5
	and a			;54cb
	jr nz,L_5512		;54cc
	xor a			;54ce
	ld (0de80h),a		;54cf   ; guarda variable de trabajo del banco 0
L_54D2:
	call bancos_13_14_15		;54d2   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	ld a,(0c002h)		;54d5   ; lee las banderas (bit 6: en partida)
	and 040h		;54d8
	jr nz,L_54E1		;54da
	ld a,(0c204h)		;54dc
	and a			;54df
	ret nz			;54e0
L_54E1:
	ld a,001h		;54e1
	ld (0c121h),a		;54e3   ; guarda la musica de fase en marcha
	ld b,006h		;54e6
	call byte_del_personaje		;54e8   ; byte_del_personaje: A = el byte B de la ficha del personaje que se lleva (0xC2B0 + 0xC240 * 32)
	ld b,a			;54eb
	ld hl,0be7ah		;54ec
	ld a,(0c21dh)		;54ef   ; lee la ruina (0-4)
	add a,a			;54f2
	add a,a			;54f3
	add a,b			;54f4
	call hl_mas_a		;54f5   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;54f8
	ld (0c122h),a		;54f9   ; guarda la altura de la musica de fase (p15:BE7A)
	ld a,(0de80h)		;54fc   ; lee variable de trabajo del banco 0
	and a			;54ff
	ld hl,0be70h		;5500
	jr z,L_5508		;5503
	ld hl,0be75h		;5505
L_5508:
	ld a,(0c21dh)		;5508   ; lee la ruina (0-4)
	call hl_mas_a		;550b   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;550e
L_550F:
	jp sonido		;550f   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_5512:
	ld a,086h		;5512
	jr L_550F		;5514
mapa_de_fase:		; RLE del mapa de la fase (p10:5FFE[0xC211]) o de la sala 5 a 0xEC00
	call bancos_10_11_12		;5516   ; bancos_10_11_12: pone los bancos 10-11-12 (p00:5490)
	ld a,(0c20ah)		;5519   ; lee en la sala de la puerta 5
	and a			;551c
	jr nz,L_552B		;551d
	ld a,(0c211h)		;551f   ; lee la fase (1-25: ruina * 5 + puerta)
	ld hl,05ffeh		;5522
	call palabra_a		;5525   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;5528
	jr L_552E		;5529
L_552B:
	ld de,0ab39h		;552b
L_552E:
	ld hl,0ec00h		;552e   ; apunta a el mapa de la fase (48 bytes por pantalla)
	jr L_554E		;5531
metabloques_de_fase:		; RLE de los metabloques de la ruina (p10:6032) o de la sala 5 a 0xE400
	call bancos_10_11_12		;5533   ; bancos_10_11_12: pone los bancos 10-11-12 (p00:5490)
	ld a,(0c20ah)		;5536   ; lee en la sala de la puerta 5
	and a			;5539
	jr nz,L_5548		;553a
	ld a,(0c21dh)		;553c   ; lee la ruina (0-4)
	ld hl,06032h		;553f
	call palabra_a		;5542   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;5545
	jr L_554B		;5546
L_5548:
	ld de,0ab66h		;5548
L_554B:
	ld hl,0e400h		;554b   ; apunta a los metabloques (16 fichas cada uno)
L_554E:
	call rle		;554e   ; rle: RLE de DE a HL: 0 acaba, n < 0x80 repite el siguiente, si no copia n & 0x7F
	jp bancos_1_2_3		;5551   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
mapa_de_antesala:		; RLE del mapa de la antesala (p10:603C) a 0xEC00
	call bancos_10_11_12		;5554   ; bancos_10_11_12: pone los bancos 10-11-12 (p00:5490)
	ld a,(0c21dh)		;5557   ; lee la ruina (0-4)
	ld hl,0603ch		;555a
	call palabra_a		;555d   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;5560
	ld hl,0ec00h		;5561   ; apunta a el mapa de la fase (48 bytes por pantalla)
	jr L_554E		;5564
metabloques_de_antesala:		; RLE de los metabloques de la antesala (p11:88CB) a 0xE400
	call bancos_10_11_12		;5566   ; bancos_10_11_12: pone los bancos 10-11-12 (p00:5490)
	ld a,(0c21dh)		;5569   ; lee la ruina (0-4)
	ld hl,088cbh		;556c
	call palabra_a		;556f   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;5572
	ld hl,0e400h		;5573   ; apunta a los metabloques (16 fichas cada uno)
	jr L_554E		;5576
rle:		; RLE de DE a HL: 0 acaba, n < 0x80 repite el siguiente, si no copia n & 0x7F
	ld a,(de)			;5578   ; n: 0 acaba
	and a			;5579
	ret z			;557a
	inc de			;557b
	ld b,a			;557c
	and 07fh		;557d   ; n < 0x80: repetir el byte siguiente n veces (p00:558E)
	cp b			;557f
	jr z,L_558E		;5580
	and a			;5582   ; 0x80: nada; si no, copiar n & 0x7F tal cual
	jr z,rle		;5583
	ex de,hl			;5585
	ld b,000h		;5586
	ld c,a			;5588
	ldir		;5589
	ex de,hl			;558b
	jr rle		;558c
L_558E:
	ld a,(de)			;558e
	inc de			;558f
L_5590:
	ld (hl),a			;5590
	inc hl			;5591
	djnz L_5590		;5592
	jr rle		;5594
plantilla_de_actor:		; con 4-5-6: 11 bytes de HL a (ix+7)
	push hl			;5596
	call bancos_4_5_6		;5597   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	pop hl			;559a
	ld bc,0000bh		;559b
	push ix		;559e
	pop de			;55a0
	ld a,e			;55a1
	add a,007h		;55a2
	ld e,a			;55a4
	ldir		;55a5
	jp bancos_1_2_3		;55a7   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
ajuste_de_pantalla:		; R#18 (ajuste de la imagen) = D
	di			;55aa   ; el puerto 0x99
	ld a,(00007h)		;55ab
	ld c,a			;55ae
	inc c			;55af
	ld a,d			;55b0
	out (c),a		;55b1
	ld a,092h		;55b3   ; 0x92: R#18
	out (c),a		;55b5
	ei			;55b7
	ret			;55b8
L_55B9:
	ld hl,0c259h		;55b9   ; apunta a las monedas (16 bits)
	ld a,(hl)			;55bc
	add a,e			;55bd
	daa			;55be
	ld (hl),a			;55bf
	inc hl			;55c0
	ld a,(hl)			;55c1
	adc a,d			;55c2
	daa			;55c3
	ld (hl),a			;55c4
	ret nc			;55c5
	ld bc,09999h		;55c6
	ld (0c259h),bc		;55c9   ; guarda las monedas (16 bits) y el byte siguiente (16 bits)
	ret			;55cd
lineas_verticales:		; lineas [X][Y][largo] de HL hasta 0xFF (p00:4B0C)
	xor a			;55ce
	jr L_55D3		;55cf
lineas_horizontales:		; lineas [X][Y][largo] de HL hasta 0xFF (p00:4AD4)
	ld a,001h		;55d1
L_55D3:
	ld b,(hl)			;55d3   ; [X][Y][largo]: 0xFF acaba
	inc b			;55d4
	ret z			;55d5
	ld d,(hl)			;55d6
	inc hl			;55d7
	ld e,(hl)			;55d8
	inc hl			;55d9
	ld b,(hl)			;55da
	inc hl			;55db
	ld c,00dh		;55dc   ; color 13
	push hl			;55de
	ex de,hl			;55df
	push af			;55e0
	and a			;55e1
	jr nz,L_55E9		;55e2   ; A = 0: vertical (p00:4B0C); si no, horizontal (p00:4AD4)
	call linea_vertical		;55e4   ; linea_vertical: LINE (0x70) vertical (ARG = 1) de B puntos en (H, L), color C
	jr L_55EC		;55e7
L_55E9:
	call linea_horizontal		;55e9   ; linea_horizontal: LINE (0x70) horizontal (ARG = 0) de B puntos en (H, L) de la pagina 0xC8E0, color C
L_55EC:
	pop af			;55ec
	pop hl			;55ed
	jr L_55D3		;55ee
juego_de_sprites:		; con 7-8-9: el juego A de p08:9338 y el que lo acompana (p08:9410)
	push af			;55f0
	call bancos_7_8_9		;55f1   ; bancos_7_8_9: pone los bancos 7-8-9 (p00:5490)
	pop af			;55f4
	push af			;55f5
	dec a			;55f6
	ld hl,09410h		;55f7
	call hl_mas_a		;55fa   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;55fd
	or a			;55fe
	call nz,carga_registro		;55ff   ; carga_registro: el registro A - 1 de p08:9338 (p00:5612)
	pop af			;5602
	call carga_registro		;5603   ; carga_registro: el registro A - 1 de p08:9338 (p00:5612)
	jp bancos_1_2_3		;5606   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
carga_registro:		; el registro A - 1 de p08:9338 (p00:5612)
	dec a			;5609
	add a,a			;560a
	add a,a			;560b
	ld hl,09338h		;560c
	call hl_mas_a		;560f   ; hl_mas_a: HL = HL + A
registro_de_sprite:		; [patron volteado][origen][patron normal] de HL: volteado y normal
	ld a,(hl)			;5612
	inc hl			;5613
	push hl			;5614
	call direccion_de_patron		;5615   ; direccion_de_patron: DE = 0xF800 + A * 8
	pop hl			;5618
	push hl			;5619
	ld a,(hl)			;561a
	inc hl			;561b
	ld h,(hl)			;561c
	ld l,a			;561d
	ex de,hl			;561e
	push de			;561f
	call sprite_volteado		;5620   ; sprite_volteado: RLE de DE (p00:49CE), lo voltea (p00:496C) y lo copia a la VRAM HL
	pop de			;5623
	pop hl			;5624
	inc hl			;5625
	inc hl			;5626
	ld a,(hl)			;5627
	or a			;5628
	ret z			;5629
	push de			;562a
	call direccion_de_patron		;562b   ; direccion_de_patron: DE = 0xF800 + A * 8
	ex de,hl			;562e
	pop de			;562f
	jp rle_a_vram		;5630   ; rle_a_vram: RLE de DE a la VRAM HL: 0 acaba, n < 0x80 repite, 0x80 otra direccion, si no copia n & 0x7F
direccion_de_patron:		; DE = 0xF800 + A * 8
	ld l,a			;5633   ; A * 8: la direccion del patron en la tabla de 0xF800
	ld h,000h		;5634
	add hl,hl			;5636
	add hl,hl			;5637
	add hl,hl			;5638
	ld de,0f800h		;5639
	add hl,de			;563c
	ex de,hl			;563d
	ret			;563e
L_563F:
	ld hl,000e8h		;563f
	ld d,h			;5642
	ld e,l			;5643
	ld bc,00005h		;5644
	ld a,004h		;5647
	jp copia_rectangulo		;5649   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
L_564C:
	ld hl,0c00ch		;564c
	ld a,(hl)			;564f
	add a,068h		;5650
	and 078h		;5652
	ld (hl),a			;5654
	ld a,(00007h)		;5655
	ld c,a			;5658
	call colores_de_sprites		;5659   ; colores_de_sprites: 16 x 32 bytes de colores de sprite desde 0x6E00 a la VRAM 0x7400
	ld hl,07600h		;565c
	call direccion_vram		;565f   ; direccion_vram: R#14 y la direccion de ESCRITURA de VRAM de HL
	ld a,(0c00ch)		;5662
	ld d,010h		;5665
	ld h,0deh		;5667
L_5669:
	ld b,008h		;5669   ; 8 bytes de colores por sprite, con L de 0x48 en 0x48
	ld l,a			;566b
	otir		;566c
	add a,048h		;566e
	and 078h		;5670
	dec d			;5672
	jr nz,L_5669		;5673
	ret			;5675
colores_de_sprites:		; 16 x 32 bytes de colores de sprite desde 0x6E00 a la VRAM 0x7400
	ld hl,07400h		;5676
	call direccion_vram		;5679   ; direccion_vram: R#14 y la direccion de ESCRITURA de VRAM de HL
	ld a,(0c00ch)		;567c
	ld d,010h		;567f
	add a,a			;5681
L_5682:
	ld h,06eh		;5682   ; 32 bytes de 0x6E00 + A * 2 por cada uno de los D sprites
	ld l,a			;5684
	add hl,hl			;5685
	ld b,020h		;5686
	otir		;5688
	add a,090h		;568a
	dec d			;568c
	jr nz,L_5682		;568d
	ret			;568f
atributos_a_vram:		; 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
	ld hl,0dc00h		;5690   ; apunta a los colores de los sprites en RAM (16 por sprite)
	ld de,0f400h		;5693
	ld bc,00280h		;5696
	jp copia_a_vram		;5699   ; copia_a_vram: copia BC bytes de HL a la VRAM DE (otir)
sonido_a_cero:		; deja el motor de sonido parado
	ld a,0bch		;569c
	ld (0c10fh),a		;569e   ; guarda el mezclador del PSG (registro 7)
	xor a			;56a1
	ld (0c121h),a		;56a2   ; guarda la musica de fase en marcha
	ld (0c122h),a		;56a5   ; guarda la altura de la musica de fase (p15:BE7A)
	ld (0c11bh),a		;56a8   ; guarda la cuenta de bajada de volumen
	ld (0c11ch),a		;56ab   ; guarda el volumen general
	ld (0c129h),a		;56ae
	ld (0c12ah),a		;56b1   ; guarda el sonido de 0xC11F es el 0x89
	ld (0c11dh),a		;56b4   ; guarda los canales que suenan
	ld (0c124h),a		;56b7
canales_parados:		; los cuatro canales a p13:6074 (nada que tocar)
	xor a			;56ba
	ld (0c10eh),a		;56bb   ; guarda la prioridad del efecto que suena
	ld (0c11fh),a		;56be   ; guarda la musica que suena
	ld (0c110h),a		;56c1   ; guarda las banderas del sonido especial
	ld (0c11eh),a		;56c4
	ld (0c129h),a		;56c7
	ld (0c121h),a		;56ca   ; guarda la musica de fase en marcha
	ld (0c122h),a		;56cd   ; guarda la altura de la musica de fase (p15:BE7A)
	ld (0c12ah),a		;56d0   ; guarda el sonido de 0xC11F es el 0x89
	ld hl,06074h		;56d3
	ld (0c010h),hl		;56d6   ; guarda el puntero del canal 1 y el byte siguiente (16 bits)
	ld (0c012h),hl		;56d9   ; guarda el puntero del canal 2 y el byte siguiente (16 bits)
	ld (0c014h),hl		;56dc   ; guarda el puntero del canal 3 y el byte siguiente (16 bits)
	ld (0c016h),hl		;56df   ; guarda el puntero del canal 4 y el byte siguiente (16 bits)
	ret			;56e2
sonido:		; el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	push hl			;56e3
	push de			;56e4
	push bc			;56e5
	push af			;56e6
	di			;56e7
	ld a,00dh		;56e8
	ld (06000h),a		;56ea   ; el mapper: pone en 0x6000 el banco de A
	ld (0f0f1h),a		;56ed   ; guarda la copia del banco de 0x6000
	ei			;56f0
	di			;56f1
	ld a,00eh		;56f2
	ld (08000h),a		;56f4   ; el mapper: pone en 0x8000 el banco de A
	ld (0f0f2h),a		;56f7   ; guarda la copia del banco de 0x8000
	ei			;56fa
	di			;56fb
	ld a,00fh		;56fc
	ld (0a000h),a		;56fe   ; el mapper: pone en 0xA000 el banco de A
	ld (0f0f3h),a		;5701   ; guarda la copia del banco de 0xA000
	ei			;5704
	pop af			;5705
	di			;5706
	or a			;5707
	jp z,L_58B4		;5708
	cp 0fdh		;570b
	jp nc,L_58BA		;570d
	or a			;5710
	jp p,efecto		;5711   ; efecto: un efecto (p13:66C2), si no suena otro de mas prioridad
	ld c,a			;5714
	cp 089h		;5715
	jr nz,L_5721		;5717
	ld a,(0c11fh)		;5719   ; lee la musica que suena
	cp 08ah		;571c
	jp z,sonido_sale		;571e   ; sonido_sale: vuelve con 1-2-3 y los registros
L_5721:
	ld a,c			;5721
	ld (0c11fh),a		;5722   ; guarda la musica que suena
	cp 089h		;5725
	jr nz,L_572D		;5727
	ld a,001h		;5729
	jr L_572E		;572b
L_572D:
	xor a			;572d
L_572E:
	ld (0c12ah),a		;572e   ; guarda el sonido de 0xC11F es el 0x89
	ld a,(0c11fh)		;5731   ; lee la musica que suena
	cp 08ch		;5734
	jr c,L_573C		;5736
	ld a,001h		;5738
	jr L_573D		;573a
L_573C:
	xor a			;573c
L_573D:
	ld (0c129h),a		;573d
	ld a,(0c121h)		;5740   ; lee la musica de fase en marcha
	or a			;5743
	jr z,L_574D		;5744
	ld a,(0c11fh)		;5746   ; lee la musica que suena
	cp 086h		;5749
	jr c,L_5751		;574b
L_574D:
	xor a			;574d
	ld (0c122h),a		;574e   ; guarda la altura de la musica de fase (p15:BE7A)
L_5751:
	ld a,(0c11fh)		;5751   ; la musica que se pide (0xC11F) y los tres canales a cero (p00:57BC)
	ld de,0c01ch		;5754   ; apunta a la ficha del canal de musica 1
	ld hl,057bch		;5757
	ld bc,00028h		;575a
	ldir		;575d
	ld hl,057bch		;575f
	ld bc,00028h		;5762
	ldir		;5765
	ld hl,057bch		;5767
	ld bc,00028h		;576a
	ldir		;576d
	and 07fh		;576f   ; (A & 0x7F) * 6: su entrada de p13:672C
	rlca			;5771
	ld e,a			;5772
	rlca			;5773
	add a,e			;5774
	ld hl,0672ch		;5775
	add a,l			;5778
	ld l,a			;5779
	jr nc,L_577D		;577a
	inc h			;577c
L_577D:
	ld e,(hl)			;577d
	inc hl			;577e
	ld d,(hl)			;577f
	inc hl			;5780
	ld (0c01ch),de		;5781   ; guarda la ficha del canal de musica 1 y el byte siguiente (16 bits)
	ld e,(hl)			;5785
	inc hl			;5786
	ld d,(hl)			;5787
	inc hl			;5788
	ld (0c044h),de		;5789   ; guarda la ficha del canal de musica 2 y el byte siguiente (16 bits)
	ld e,(hl)			;578d
	inc hl			;578e
	ld d,(hl)			;578f
	ld (0c06ch),de		;5790   ; guarda la ficha del canal de musica 3 y el byte siguiente (16 bits)
	ld hl,06134h		;5794
	ld (0c010h),hl		;5797   ; guarda el puntero del canal 1 y el byte siguiente (16 bits)
	ld hl,0613bh		;579a
	ld (0c012h),hl		;579d   ; guarda el puntero del canal 2 y el byte siguiente (16 bits)
	ld hl,06142h		;57a0
	ld (0c014h),hl		;57a3   ; guarda el puntero del canal 3 y el byte siguiente (16 bits)
L_57A6:
	xor a			;57a6
	ld (0c11bh),a		;57a7   ; guarda la cuenta de bajada de volumen
	ld (0c11ch),a		;57aa   ; guarda el volumen general
	ld (0c11eh),a		;57ad
	ld a,007h		;57b0
	ld (0c11dh),a		;57b2   ; guarda los canales que suenan
sonido_sale:		; vuelve con 1-2-3 y los registros
	call bancos_1_2_3		;57b5   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	pop bc			;57b8
	pop de			;57b9
	pop hl			;57ba
	ret			;57bb

; ----------------------------------------------------------------------
; DATOS canal_vacio: 40 bytes a cero (menos 3) que los `ldir` de p00:5757-5950
;   copian a cada canal de sonido antes de arrancarlo; lo leen p00:5757 (40
;   bytes)
;   0x57bc..0x57e4  (40 bytes)
DATA_canal_vacio:
	defb 000h,000h,001h,000h,000h,000h,000h,000h	; 57bc  ........
	defb 000h,001h,000h,000h,000h,000h,001h,001h	; 57c4  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 57cc  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 57d4  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 57dc  ........

; ----------------------------------------------------------------------
; DATOS ceros_p57E4: dos bytes a cero detras de la plantilla p00:57BC (40
;   bytes): ninguna instruccion los lee
;   0x57e4..0x57e6  (2 bytes)
DATA_ceros_p57E4:
	defb 000h,000h	; 57e4

; ======================================================================
; CODIGO 0x57e6..0x5a79  (659 bytes)
; ======================================================================


sonido_40:		; arranca los tres canales del sonido 0x40-0x6F (p13:670E)
	ld a,c			;57e6   ; los tres canales a cero
	ld de,0c01ch		;57e7   ; apunta a la ficha del canal de musica 1
	ld hl,057bch		;57ea
	ld bc,00028h		;57ed
	ldir		;57f0
	ld hl,057bch		;57f2
	ld bc,00028h		;57f5
	ldir		;57f8
	ld hl,057bch		;57fa
	ld bc,00028h		;57fd
	ldir		;5800
	and 03fh		;5802   ; (A & 0x3F) * 6: su entrada de p13:670E
	rlca			;5804
	ld e,a			;5805
	rlca			;5806
	add a,e			;5807
	ld e,a			;5808
	ld d,000h		;5809
	ld hl,0670eh		;580b
	add hl,de			;580e
	ld e,(hl)			;580f
	inc hl			;5810
	ld d,(hl)			;5811
	inc hl			;5812
	ld (0c028h),de		;5813   ; los tres punteros de pista de sus canales
	ld e,(hl)			;5817
	inc hl			;5818
	ld d,(hl)			;5819
	inc hl			;581a
	ld (0c050h),de		;581b
	ld e,(hl)			;581f
	inc hl			;5820
	ld d,(hl)			;5821
	ld (0c078h),de		;5822
	ld hl,064d7h		;5826   ; y los manejadores de p13:64D7-64E3 (envolventes)
	ld (0c010h),hl		;5829   ; guarda el puntero del canal 1 y el byte siguiente (16 bits)
	ld hl,064ddh		;582c
	ld (0c012h),hl		;582f   ; guarda el puntero del canal 2 y el byte siguiente (16 bits)
	ld hl,064e3h		;5832
	ld (0c014h),hl		;5835   ; guarda el puntero del canal 3 y el byte siguiente (16 bits)
	jp L_57A6		;5838
efecto:		; un efecto (p13:66C2), si no suena otro de mas prioridad
	ld c,a			;583b
	cp 070h		;583c
	jp nc,sonido_70		;583e   ; sonido_70: arranca el sonido 0x70-0x7F (p13:66C4) en el canal 0xC0BC
	bit 6,a		;5841
	jr nz,sonido_40		;5843
	ld a,(0c129h)		;5845
	or a			;5848
	jp nz,sonido_sale		;5849   ; sonido_sale: vuelve con 1-2-3 y los registros
	ld a,(0c11eh)		;584c
	or a			;584f
	jp nz,sonido_sale		;5850   ; sonido_sale: vuelve con 1-2-3 y los registros
	ld a,(0c10eh)		;5853   ; lee la prioridad del efecto que suena
	cp c			;5856
	jp z,L_585D		;5857
	jp nc,sonido_sale		;585a   ; sonido_sale: vuelve con 1-2-3 y los registros
L_585D:
	ld a,c			;585d
	ld (0c10eh),a		;585e   ; guarda la prioridad del efecto que suena
	ld de,0c094h		;5861   ; apunta a la ficha del canal de efectos
	ld hl,057bch		;5864
	ld bc,00028h		;5867
	ldir		;586a
	rlca			;586c
	ld hl,066c2h		;586d
	add a,l			;5870
	ld l,a			;5871
	jr nc,L_5875		;5872
	inc h			;5874
L_5875:
	ld e,(hl)			;5875
	inc hl			;5876
	ld d,(hl)			;5877
	ld (0c0a0h),de		;5878
	ld hl,064e9h		;587c
	ld (0c016h),hl		;587f   ; guarda el puntero del canal 4 y el byte siguiente (16 bits)
	jp sonido_sale		;5882   ; sonido_sale: vuelve con 1-2-3 y los registros
sonido_70:		; arranca el sonido 0x70-0x7F (p13:66C4) en el canal 0xC0BC
	ld a,c			;5885   ; el canal 0xC0BC a cero
	ld de,0c0bch		;5886   ; apunta a la ficha del canal especial 1
	ld hl,057bch		;5889
	ld bc,00028h		;588c
	ldir		;588f
	and 00fh		;5891   ; (A & 15) * 2: su entrada de p13:66C4
	rlca			;5893
	ld hl,066c4h		;5894
	add a,l			;5897
	ld l,a			;5898
	jr nc,L_589C		;5899
	inc h			;589b
L_589C:
	ld e,(hl)			;589c
	inc hl			;589d
	ld d,(hl)			;589e
	ld (0c0c8h),de		;589f
	ld hl,064d1h		;58a3
	ld (0c127h),hl		;58a6   ; guarda el puntero del canal de los sonidos 0x70-0x7F y el byte siguiente (16 bits)
	ld a,(0c110h)		;58a9   ; lee las banderas del sonido especial
	or 002h		;58ac
	ld (0c110h),a		;58ae   ; guarda las banderas del sonido especial
	jp sonido_sale		;58b1   ; sonido_sale: vuelve con 1-2-3 y los registros
L_58B4:
	call canales_parados		;58b4   ; canales_parados: los cuatro canales a p13:6074 (nada que tocar)
	jp sonido_sale		;58b7   ; sonido_sale: vuelve con 1-2-3 y los registros
L_58BA:
	jp z,L_58D4		;58ba
	cp 0feh		;58bd
	jp z,L_5973		;58bf
	ld a,(0c12ah)		;58c2   ; lee el sonido de 0xC11F es el 0x89
	or a			;58c5
	jr nz,L_58CC		;58c6
	ld a,03ah		;58c8
	jr L_58CE		;58ca
L_58CC:
	ld a,010h		;58cc
L_58CE:
	ld (0c11bh),a		;58ce   ; guarda la cuenta de bajada de volumen
	jp sonido_sale		;58d1   ; sonido_sale: vuelve con 1-2-3 y los registros
L_58D4:
	ld a,(0c110h)		;58d4   ; lee las banderas del sonido especial
	or 001h		;58d7
	ld (0c110h),a		;58d9   ; guarda las banderas del sonido especial
	ld a,(0c122h)		;58dc   ; lee la altura de la musica de fase (p15:BE7A)
	ld (0c123h),a		;58df
	xor a			;58e2
	ld (0c122h),a		;58e3   ; guarda la altura de la musica de fase (p15:BE7A)
	ld a,(0c11bh)		;58e6   ; lee la cuenta de bajada de volumen
	ld (0c111h),a		;58e9
	ld a,(0c11ch)		;58ec   ; lee el volumen general
	ld (0c112h),a		;58ef
	ld a,(0c10fh)		;58f2   ; lee el mezclador del PSG (registro 7)
	ld (0c113h),a		;58f5
	ld a,0bfh		;58f8
	ld (0c10fh),a		;58fa   ; guarda el mezclador del PSG (registro 7)
	ld a,(0c11dh)		;58fd   ; lee los canales que suenan
	ld (0c120h),a		;5900
	xor a			;5903
	ld (0c11dh),a		;5904   ; guarda los canales que suenan
	xor a			;5907
	call 00096h		;5908   ; BIOS RDPSG - Reads value from PSG-register
	ld (0c114h),a		;590b
	ld a,001h		;590e
	call 00096h		;5910   ; BIOS RDPSG - Reads value from PSG-register
	ld (0c115h),a		;5913
	ld a,002h		;5916
	call 00096h		;5918   ; BIOS RDPSG - Reads value from PSG-register
	ld (0c116h),a		;591b
	ld a,003h		;591e
	call 00096h		;5920   ; BIOS RDPSG - Reads value from PSG-register
	ld (0c117h),a		;5923
	ld a,008h		;5926
	call 00096h		;5928   ; BIOS RDPSG - Reads value from PSG-register
	ld (0c118h),a		;592b
	ld a,009h		;592e
	call 00096h		;5930   ; BIOS RDPSG - Reads value from PSG-register
	ld (0c119h),a		;5933
	ld a,00ah		;5936
	call 00096h		;5938   ; BIOS RDPSG - Reads value from PSG-register
	ld (0c11ah),a		;593b
	ld a,00ah		;593e
	ld e,000h		;5940
	call 00093h		;5942   ; BIOS WRTPSG - Writes data to PSG-register
	ld de,0c0bch		;5945   ; apunta a la ficha del canal especial 1
	ld hl,057bch		;5948
	ld bc,00028h		;594b
	ldir		;594e
	ld hl,057bch		;5950
	ld bc,00028h		;5953
	ldir		;5956
	ld hl,06fa6h		;5958
	ld (0c0bch),hl		;595b   ; guarda la ficha del canal especial 1 y el byte siguiente (16 bits)
	ld hl,06fb3h		;595e
	ld (0c0e4h),hl		;5961   ; guarda la ficha del canal especial 2 y el byte siguiente (16 bits)
	ld hl,06126h		;5964
	ld (0c018h),hl		;5967   ; guarda el puntero del canal especial 1 y el byte siguiente (16 bits)
	ld hl,0612dh		;596a
	ld (0c01ah),hl		;596d   ; guarda el puntero del canal especial 2 y el byte siguiente (16 bits)
	jp sonido_sale		;5970   ; sonido_sale: vuelve con 1-2-3 y los registros
L_5973:
	xor a			;5973
	ld (0c110h),a		;5974   ; guarda las banderas del sonido especial
	ld a,(0c121h)		;5977   ; lee la musica de fase en marcha
	or a			;597a
	jr z,L_5983		;597b
	ld a,(0c123h)		;597d
	ld (0c122h),a		;5980   ; guarda la altura de la musica de fase (p15:BE7A)
L_5983:
	ld a,(0c111h)		;5983
	ld (0c11bh),a		;5986   ; guarda la cuenta de bajada de volumen
	ld a,(0c112h)		;5989
	ld (0c11ch),a		;598c   ; guarda el volumen general
	ld a,(0c113h)		;598f
	ld (0c10fh),a		;5992   ; guarda el mezclador del PSG (registro 7)
	ld a,(0c120h)		;5995
	ld (0c11dh),a		;5998   ; guarda los canales que suenan
	ld a,(0c114h)		;599b
	ld e,a			;599e
	xor a			;599f
	call 00093h		;59a0   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,(0c115h)		;59a3
	ld e,a			;59a6
	ld a,001h		;59a7
	call 00093h		;59a9   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,(0c116h)		;59ac
	ld e,a			;59af
	ld a,002h		;59b0
	call 00093h		;59b2   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,(0c117h)		;59b5
	ld e,a			;59b8
	ld a,003h		;59b9
	call 00093h		;59bb   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,(0c118h)		;59be
	ld e,a			;59c1
	ld a,008h		;59c2
	call 00093h		;59c4   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,(0c119h)		;59c7
	ld e,a			;59ca
	ld a,009h		;59cb
	call 00093h		;59cd   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,(0c11ah)		;59d0
	ld e,a			;59d3
	ld a,00ah		;59d4
	call 00093h		;59d6   ; BIOS WRTPSG - Writes data to PSG-register
	jp sonido_sale		;59d9   ; sonido_sale: vuelve con 1-2-3 y los registros
L_59DC:
	ld a,(0c11bh)		;59dc   ; lee la cuenta de bajada de volumen
	or a			;59df
	jr nz,L_59EA		;59e0
	ld a,(0c11dh)		;59e2   ; lee los canales que suenan
	or a			;59e5
	ld a,(0c11fh)		;59e6   ; lee la musica que suena
	ret			;59e9
L_59EA:
	ld a,(0c11ch)		;59ea   ; lee el volumen general
	cp 0f9h		;59ed
	ld a,(0c11fh)		;59ef   ; lee la musica que suena
	ret			;59f2
pinta_pantalla_de_fase:		; la pantalla 0xC212 de 0xEC00 a 0xD200 (p15:BEBF)
	ld de,0ec00h		;59f3   ; apunta a el mapa de la fase (48 bytes por pantalla)
	ld a,(0c212h)		;59f6   ; lee la pantalla de la fase (desde 1)
	dec a			;59f9
	add a,a			;59fa
	add a,a			;59fb
	add a,a			;59fc
	ld h,000h		;59fd
	ld l,a			;59ff
	add hl,hl			;5a00
	ld b,h			;5a01
	ld c,l			;5a02
	add hl,hl			;5a03
	add hl,bc			;5a04
	add hl,de			;5a05
	push hl			;5a06
	call bancos_13_14_15		;5a07   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	pop hl			;5a0a
	call 0bebfh		;5a0b
	jp bancos_1_2_3		;5a0e   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_5A11:
	call banco_15_en_a000		;5a11   ; banco_15_en_a000: pone el banco 15 en 0xA000 (p00:54B9)
	call 0bebfh		;5a14
	jp banco_6_en_a000		;5a17   ; banco_6_en_a000: pone el banco 6 en 0xA000
pinta_d200:		; las 32 x 24 fichas de 0xD200 desde la linea 20 (p00:4DB4)
	ld hl,0d200h		;5a1a   ; apunta a el mapa de 32 x 24 fichas de la pantalla
	ld de,00014h		;5a1d
	ld b,018h		;5a20
L_5A22:
	push bc			;5a22
	ld b,020h		;5a23
L_5A25:
	ld a,(hl)			;5a25   ; una fila de 32 fichas de 0xD200
	call ficha		;5a26   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	inc hl			;5a29
	ld a,d			;5a2a   ; la siguiente columna: D + 8
	add a,008h		;5a2b
	ld d,a			;5a2d
	djnz L_5A25		;5a2e
	pop bc			;5a30
	ld a,e			;5a31   ; la siguiente fila: E + 8
	add a,008h		;5a32
	ld e,a			;5a34
	djnz L_5A22		;5a35
	ret			;5a37
graficos_del_personaje:		; la lista de p09:BB32[0xC240] y su paleta
	call bancos_7_8_9		;5a38   ; bancos_7_8_9: pone los bancos 7-8-9 (p00:5490)
	ld a,(0c240h)		;5a3b   ; lee el personaje que se lleva (0 o 1)
	ld hl,0bb32h		;5a3e
	call palabra_a		;5a41   ; palabra_a: HL = la palabra A de la tabla HL
	ld de,0bb15h		;5a44
	call lista_de_fichas		;5a47   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
	call fichas_del_marcador		;5a4a   ; fichas_del_marcador: las 3 x 4 fichas del personaje (p09:BAFD/BB09)
	call bancos_1_2_3		;5a4d   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	call sprites_del_estado		;5a50   ; sprites_del_estado: si se lleva al personaje 0, con 13-14-15 los patrones de p15:A31B
	call sprites_del_personaje		;5a53   ; sprites_del_personaje: con 13-14-15: los 7 fotogramas del estado del personaje (p14:97AE o p14:9BCE)
paleta_del_personaje:		; las paletas p00:5A79/5A80 segun 0xC240
	ld a,(0c24bh)		;5a56   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;5a59
	jr z,L_5A69		;5a5b
	ld a,(0c20ah)		;5a5d   ; lee en la sala de la puerta 5
	or a			;5a60
	jr nz,$+38		;5a61
	ld a,(0c316h)		;5a63
	or a			;5a66
	jr nz,$+32		;5a67
L_5A69:
	ld a,(0c240h)		;5a69   ; lee el personaje que se lleva (0 o 1)
	ld hl,05a79h		;5a6c
	or a			;5a6f
	jp z,pon_paleta		;5a70   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
	ld hl,05a80h		;5a73
	jp pon_paleta		;5a76   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF

; ----------------------------------------------------------------------
; DATOS paleta_c240_0: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:5A6C (7 bytes)
;   0x5a79..0x5a80  (7 bytes)
DATA_paleta_c240_0:
	defb 006h,073h,005h	; 5a79
	defb 009h,073h,003h	; 5a7c
	defb 0ffh	; 5a7f

; ----------------------------------------------------------------------
; DATOS paleta_c240_1: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:5A73 (7 bytes)
;   0x5a80..0x5a87  (7 bytes)
DATA_paleta_c240_1:
	defb 006h,073h,005h	; 5a80
	defb 009h,024h,003h	; 5a83
	defb 0ffh	; 5a86

; ======================================================================
; CODIGO 0x5a87..0x5a8d  (6 bytes)
; ======================================================================


L_5A87:
	ld hl,05a8dh		;5a87
	jp pon_paleta		;5a8a   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF

; ----------------------------------------------------------------------
; DATOS paleta_p5A87: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p00:5A87 (10 bytes)
;   0x5a8d..0x5a97  (10 bytes)
DATA_paleta_p5A87:
	defb 006h,073h,005h	; 5a8d
	defb 009h,073h,003h	; 5a90
	defb 00bh,024h,003h	; 5a93
	defb 0ffh	; 5a96

; ======================================================================
; CODIGO 0x5a97..0x5fff  (1384 bytes)
; ======================================================================


sprites_del_estado:		; si se lleva al personaje 0, con 13-14-15 los patrones de p15:A31B
	call 06234h		;5a97
	ld a,(0c240h)		;5a9a   ; lee el personaje que se lleva (0 o 1)
	or a			;5a9d
	ret nz			;5a9e
	call bancos_13_14_15		;5a9f   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	call registro_a31b		;5aa2   ; registro_a31b: el registro de p15:A31B segun 3 - (ix+6)
	jp bancos_1_2_3		;5aa5   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
registro_a31b:		; el registro de p15:A31B segun 3 - (ix+6)
	ld a,003h		;5aa8
	sub (ix+006h)		;5aaa
	add a,a			;5aad
	add a,a			;5aae
	ld hl,0a31bh		;5aaf
	call hl_mas_a		;5ab2   ; hl_mas_a: HL = HL + A
	jp registro_de_sprite		;5ab5   ; registro_de_sprite: [patron volteado][origen][patron normal] de HL: volteado y normal
sprites_a426:		; los patrones de p15:A426 segun el estado del personaje
	ld hl,0a426h		;5ab8
	jr L_5AC0		;5abb
sprites_a3c1:		; los patrones de p15:A3C1 segun el estado del personaje
	ld hl,0a3c1h		;5abd
L_5AC0:
	push hl			;5ac0
	call 08c16h		;5ac1
	push af			;5ac4
	call bancos_13_14_15		;5ac5   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	pop af			;5ac8
	pop hl			;5ac9
	add a,a			;5aca
	add a,a			;5acb
	call hl_mas_a		;5acc   ; hl_mas_a: HL = HL + A
	call registro_de_sprite		;5acf   ; registro_de_sprite: [patron volteado][origen][patron normal] de HL: volteado y normal
	jp bancos_1_2_3		;5ad2   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
fichas_del_marcador:		; las 3 x 4 fichas del personaje (p09:BAFD/BB09)
	ld a,001h		;5ad5
	ld (0c20bh),a		;5ad7   ; guarda las fichas van a la pagina 1
	ld a,(0c240h)		;5ada   ; lee el personaje que se lleva (0 o 1)
	ld hl,0bafdh		;5add
	or a			;5ae0
	jr z,L_5AE6		;5ae1
	ld hl,0bb09h		;5ae3
L_5AE6:
	ld de,00098h		;5ae6
	ld c,003h		;5ae9
L_5AEB:
	ld b,004h		;5aeb
	push de			;5aed
L_5AEE:
	ld a,(hl)			;5aee
	inc hl			;5aef
	call ficha		;5af0   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	ld a,d			;5af3
	add a,008h		;5af4
	ld d,a			;5af6
	djnz L_5AEE		;5af7
	pop de			;5af9
	ld a,e			;5afa
	add a,008h		;5afb
	ld e,a			;5afd
	dec c			;5afe
	jr nz,L_5AEB		;5aff
	xor a			;5b01
	ld (0c20bh),a		;5b02   ; guarda las fichas van a la pagina 1
	ret			;5b05
estado_por_14:		; HL + (ix+6) * 14: los 7 fotogramas del estado
	ld a,(ix+006h)		;5b06
	add a,a			;5b09
	ld b,a			;5b0a
	add a,a			;5b0b
	add a,a			;5b0c
	add a,a			;5b0d
	sub b			;5b0e
	jp hl_mas_a		;5b0f   ; hl_mas_a: HL = HL + A
sprites_del_personaje:		; con 13-14-15: los 7 fotogramas del estado del personaje (p14:97AE o p14:9BCE)
	call 06234h		;5b12
	ld a,(0c240h)		;5b15   ; lee el personaje que se lleva (0 o 1)
	cp 001h		;5b18
	call z,fotogramas_9f4a		;5b1a   ; fotogramas_9f4a: con 13-14-15: la lista de fotogramas de p14:9F4A[(ix+6)]
	call bancos_13_14_15		;5b1d   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	exx			;5b20
	ld a,(0c240h)		;5b21   ; lee el personaje que se lleva (0 o 1)
	ld hl,097aeh		;5b24
	or a			;5b27
	jr z,L_5B2D		;5b28
	ld hl,09bceh		;5b2a
L_5B2D:
	call estado_por_14		;5b2d   ; estado_por_14: HL + (ix+6) * 14: los 7 fotogramas del estado
	ld (0c26dh),hl		;5b30   ; guarda el puntero a los fotogramas del personaje y el byte siguiente (16 bits)
	ex de,hl			;5b33
	ld hl,0e800h		;5b34   ; apunta a bufer de fichas decodificadas
	exx			;5b37
	ld b,007h		;5b38
L_5B3A:
	exx			;5b3a
	ex de,hl			;5b3b
	ld hl,(0c26dh)		;5b3c   ; lee el puntero a los fotogramas del personaje y el byte siguiente (16 bits)
	ld a,(hl)			;5b3f
	inc hl			;5b40
	ld b,(hl)			;5b41
	inc hl			;5b42
	ld (0c26dh),hl		;5b43   ; guarda el puntero a los fotogramas del personaje y el byte siguiente (16 bits)
	ld l,a			;5b46
	ld h,b			;5b47
	ex de,hl			;5b48
	exx			;5b49
	push bc			;5b4a
	call compone_fotograma		;5b4b   ; compone_fotograma: las piezas del fotograma de DE' en 0xD600
	call voltea_fotograma		;5b4e   ; voltea_fotograma: voltea los 4 sprites de 0xD600 (bits al reves y mitades cambiadas)
	call fotograma_a_vram		;5b51   ; fotograma_a_vram: los 0x80 bytes de 0xD600 a la VRAM de HL', que avanza 0x80
	call voltea_fotograma		;5b54   ; voltea_fotograma: voltea los 4 sprites de 0xD600 (bits al reves y mitades cambiadas)
	call fotograma_a_vram		;5b57   ; fotograma_a_vram: los 0x80 bytes de 0xD600 a la VRAM de HL', que avanza 0x80
	pop bc			;5b5a
	djnz L_5B3A		;5b5b
	jp bancos_1_2_3		;5b5d   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_5B60:
	ld hl,0fa80h		;5b60
	ld (0c273h),hl		;5b63
	jr L_5B6E		;5b66
L_5B68:
	ld hl,0f800h		;5b68
	ld (0c273h),hl		;5b6b
L_5B6E:
	push af			;5b6e
	ex af,af'			;5b6f
	ld ix,0c2b0h		;5b70   ; apunta a la ficha del personaje 0 (14 bytes)
	call bancos_13_14_15		;5b74   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	exx			;5b77
	ld de,(0c273h)		;5b78
	ld hl,097aeh		;5b7c
	call un_fotograma		;5b7f   ; un_fotograma: un fotograma (A') del estado (p00:5B3A)
	pop af			;5b82
	ex af,af'			;5b83
	ld ix,0c2d0h		;5b84   ; apunta a la ficha del personaje 1 (14 bytes)
	call bancos_13_14_15		;5b88   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	exx			;5b8b
	ld de,(0c273h)		;5b8c
	ld hl,00100h		;5b90
	add hl,de			;5b93
	ex de,hl			;5b94
	ld hl,09bceh		;5b95
un_fotograma:		; un fotograma (A') del estado (p00:5B3A)
	push de			;5b98
	call estado_por_14		;5b99   ; estado_por_14: HL + (ix+6) * 14: los 7 fotogramas del estado
	ex af,af'			;5b9c
	add a,a			;5b9d
	call hl_mas_a		;5b9e   ; hl_mas_a: HL = HL + A
	ld (0c26dh),hl		;5ba1   ; guarda el puntero a los fotogramas del personaje y el byte siguiente (16 bits)
	ex de,hl			;5ba4
	pop hl			;5ba5
	exx			;5ba6
	ld b,001h		;5ba7
	jp L_5B3A		;5ba9
fotogramas_9f4a:		; con 13-14-15: la lista de fotogramas de p14:9F4A[(ix+6)]
	call bancos_13_14_15		;5bac   ; bancos_13_14_15: pone los bancos 13-14-15 y su copia
	exx			;5baf
	ld a,(ix+006h)		;5bb0
	ld hl,09f4ah		;5bb3
	call palabra_a		;5bb6   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,(hl)			;5bb9
	inc hl			;5bba
	ld (0c26dh),hl		;5bbb   ; guarda el puntero a los fotogramas del personaje y el byte siguiente (16 bits)
	ld hl,06c00h		;5bbe
	exx			;5bc1
	ld b,a			;5bc2
	jp L_5B3A		;5bc3
compone_fotograma:		; las piezas del fotograma de DE' en 0xD600
	ld bc,0007fh		;5bc6
	ld hl,0d600h		;5bc9   ; apunta a el bufer de patrones de sprite
	ld de,0d601h		;5bcc
	xor a			;5bcf
	ld (hl),a			;5bd0
	ldir		;5bd1
L_5BD3:
	exx			;5bd3   ; el registro del fotograma: [cuenta | 0x80]; 0xFF acaba
	push de			;5bd4
	exx			;5bd5
	pop hl			;5bd6
	ld a,(hl)			;5bd7
	inc hl			;5bd8
	cp 0ffh		;5bd9
	jr z,L_5C26		;5bdb
	ld b,a			;5bdd
	and 080h		;5bde   ; con el bit 7 la pieza se pone tal cual; sin el, se mezcla (0xC26A = 1)
	ld a,001h		;5be0
	jr z,L_5BE5		;5be2
	xor a			;5be4
L_5BE5:
	ld (0c26ah),a		;5be5
	ld a,b			;5be8
	and 07fh		;5be9
	ld b,a			;5beb
	ld c,(hl)			;5bec
	push bc			;5bed
	inc hl			;5bee
	call destino_de_pieza		;5bef   ; destino_de_pieza: DE = 0xD600 o 0xD630 segun la posicion A, mas A
	ld a,(hl)			;5bf2
	inc hl			;5bf3
	ld h,(hl)			;5bf4
	ld l,a			;5bf5
	ld a,(hl)			;5bf6
	ld (0c269h),a		;5bf7
	inc hl			;5bfa
	call copia_tira		;5bfb   ; copia_tira: B filas de la pieza (p00:5C45)
	pop bc			;5bfe
	ld a,b			;5bff
	add a,020h		;5c00
	call destino_de_pieza		;5c02   ; destino_de_pieza: DE = 0xD600 o 0xD630 segun la posicion A, mas A
	ld a,(0c269h)		;5c05
	call hl_mas_a		;5c08   ; hl_mas_a: HL = HL + A
	ld a,(0c269h)		;5c0b
	call copia_tira		;5c0e   ; copia_tira: B filas de la pieza (p00:5C45)
	exx			;5c11
	ld a,004h		;5c12
	call de_mas_a		;5c14   ; de_mas_a: DE = DE + A
	exx			;5c17
	jr L_5BD3		;5c18
copia_tira:		; B filas de la pieza (p00:5C45)
	ld b,a			;5c1a
L_5C1B:
	push bc			;5c1b
	push hl			;5c1c
	call fila_de_pieza		;5c1d   ; fila_de_pieza: una fila de 16 puntos de la pieza (HL y HL + n) desplazada C
	pop hl			;5c20
	inc hl			;5c21
	pop bc			;5c22
	djnz L_5C1B		;5c23
	ret			;5c25
L_5C26:
	exx			;5c26
	inc de			;5c27
	exx			;5c28
	ret			;5c29
destino_de_pieza:		; DE = 0xD600 o 0xD630 segun la posicion A, mas A
	cp 010h		;5c2a
	ld de,0d600h		;5c2c   ; apunta a el bufer de patrones de sprite
	jr c,L_5C42		;5c2f
	cp 020h		;5c31
	ld de,0d630h		;5c33
	jr c,L_5C42		;5c36
	cp 030h		;5c38
	ld de,0d600h		;5c3a   ; apunta a el bufer de patrones de sprite
	jr c,L_5C42		;5c3d
	ld de,0d630h		;5c3f
L_5C42:
	jp de_mas_a		;5c42   ; de_mas_a: DE = DE + A
fila_de_pieza:		; una fila de 16 puntos de la pieza (HL y HL + n) desplazada C
	ld a,(hl)			;5c45
	push af			;5c46
	ld a,(0c269h)		;5c47
	call hl_mas_a		;5c4a   ; hl_mas_a: HL = HL + A
	pop af			;5c4d
	ld l,(hl)			;5c4e
	ld h,a			;5c4f
	ld b,c			;5c50
	ld a,b			;5c51
	or a			;5c52
	call nz,desplaza_fila		;5c53   ; desplaza_fila: HL desplazado B puntos
	ld a,h			;5c56
	call mezcla_byte		;5c57   ; mezcla_byte: (DE) = A, o OR con lo que hay si 0xC26A
	inc de			;5c5a
	push de			;5c5b
	ld a,00fh		;5c5c
	call de_mas_a		;5c5e   ; de_mas_a: DE = DE + A
	ld a,l			;5c61
	call mezcla_byte		;5c62   ; mezcla_byte: (DE) = A, o OR con lo que hay si 0xC26A
	pop de			;5c65
	jp L_5C8C		;5c66
desplaza_fila:		; HL desplazado B puntos
	cp 080h		;5c69
	jr nc,L_5C75		;5c6b
L_5C6D:
	or a			;5c6d
	srl h		;5c6e
	rr l		;5c70
	djnz L_5C6D		;5c72
	ret			;5c74
L_5C75:
	neg		;5c75
	ld b,a			;5c77
L_5C78:
	or a			;5c78
	sla l		;5c79
	rl h		;5c7b
	djnz L_5C78		;5c7d
	ret			;5c7f
mezcla_byte:		; (DE) = A, o OR con lo que hay si 0xC26A
	ld b,a			;5c80   ; B al bufer; con 0xC26A, OR con lo que haya
	ld a,(0c26ah)		;5c81
	or a			;5c84
	ld a,b			;5c85
	jr z,L_5C8A		;5c86
	ld a,(de)			;5c88
	or b			;5c89
L_5C8A:
	ld (de),a			;5c8a
	ret			;5c8b
L_5C8C:
	push hl			;5c8c
	push de			;5c8d
	ex de,hl			;5c8e
	ld de,0d600h		;5c8f   ; apunta a el bufer de patrones de sprite
	or a			;5c92
	sbc hl,de		;5c93
	ld a,l			;5c95
	and 010h		;5c96
	pop de			;5c98
	pop hl			;5c99
	ret z			;5c9a
	ld a,030h		;5c9b
	jp de_mas_a		;5c9d   ; de_mas_a: DE = DE + A
fotograma_a_vram:		; los 0x80 bytes de 0xD600 a la VRAM de HL', que avanza 0x80
	exx			;5ca0
	push hl			;5ca1
	exx			;5ca2
	pop de			;5ca3
	ld bc,00080h		;5ca4
	ld hl,0d600h		;5ca7   ; apunta a el bufer de patrones de sprite
	call copia_a_vram		;5caa   ; copia_a_vram: copia BC bytes de HL a la VRAM DE (otir)
	exx			;5cad
	ld bc,00080h		;5cae
	add hl,bc			;5cb1
	exx			;5cb2
	ret			;5cb3
voltea_fotograma:		; voltea los 4 sprites de 0xD600 (bits al reves y mitades cambiadas)
	ld b,004h		;5cb4
	ld hl,0d600h		;5cb6   ; apunta a el bufer de patrones de sprite
	ld de,0d610h		;5cb9
L_5CBC:
	push bc			;5cbc
	ld b,010h		;5cbd
L_5CBF:
	ld a,(de)			;5cbf
	call invierte_bits		;5cc0   ; invierte_bits: A con sus 8 bits al reves
	ld c,a			;5cc3
	ld a,(hl)			;5cc4
	call invierte_bits		;5cc5   ; invierte_bits: A con sus 8 bits al reves
	ld (de),a			;5cc8
	ld (hl),c			;5cc9
	inc hl			;5cca
	inc de			;5ccb
	djnz L_5CBF		;5ccc
	ld bc,00010h		;5cce
	add hl,bc			;5cd1
	ex de,hl			;5cd2
	ld bc,00010h		;5cd3
	add hl,bc			;5cd6
	ex de,hl			;5cd7
	pop bc			;5cd8
	djnz L_5CBC		;5cd9
	ret			;5cdb
pantalla_de_informacion:		; con 4-5-6: la pantalla INFORMATION de la pausa, donde se compran mejoras con monedas (p06:A465, p05:9EEC)
	call actores_tipo_10		;5cdc   ; actores_tipo_10: copia el dibujo de los actores de tipo 10 de 0xCD00
	call apaga_y_borra_todo		;5cdf   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call bancos_4_5_6		;5ce2   ; bancos_4_5_6: pone los bancos 4-5-6 (p00:5490)
	call 0a465h		;5ce5   ; paleta_b351: la paleta p06:B351
	call 09eech		;5ce8   ; pinta_informacion: patrones, texto p06:A173 (INFORMATION, COIN, SPD, JMP, F1 END, F2 CANCEL), recuadros y lineas
	call bancos_1_2_3		;5ceb   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c240h)		;5cee   ; lee el personaje que se lleva (0 o 1)
	ld (0c229h),a		;5cf1   ; guarda el personaje elegido en INFORMATION
	xor a			;5cf4
	ld (0c228h),a		;5cf5   ; guarda la mejora elegida en INFORMATION (0-2)
	jp pantalla_encendida		;5cf8   ; pantalla_encendida: R#1 con el bit 6 (pantalla) y sprites encendidos
vuelve_a_la_fase:		; graficos, paleta, mapa y pantalla de la fase y sus actores
	call apaga_y_borra_todo		;5cfb   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call fichas_comunes		;5cfe   ; fichas_comunes: con 13-14-15: la lista p15:BB95 y p15:B4EB
	call graficos_de_ruina		;5d01   ; graficos_de_ruina: con 7-8-9: la lista de fichas de la ruina (p07:6000), o las de la sala 5 (p00:51D4)
	call paleta_de_fase		;5d04   ; paleta_de_fase: p06:B335 y la paleta de la ruina (p06:B2DB), o la de la sala 5 (p06:B35C)
	call paleta_del_personaje		;5d07   ; paleta_del_personaje: las paletas p00:5A79/5A80 segun 0xC240
	call metabloques_de_fase		;5d0a   ; metabloques_de_fase: RLE de los metabloques de la ruina (p10:6032) o de la sala 5 a 0xE400
	call mapa_de_fase		;5d0d   ; mapa_de_fase: RLE del mapa de la fase (p10:5FFE[0xC211]) o de la sala 5 a 0xEC00
	ld a,(0c316h)		;5d10
	and a			;5d13
	call z,pinta_pantalla_de_fase		;5d14   ; pinta_pantalla_de_fase: la pantalla 0xC212 de 0xEC00 a 0xD200 (p15:BEBF)
	call pinta_d200		;5d17   ; pinta_d200: las 32 x 24 fichas de 0xD200 desde la linea 20 (p00:4DB4)
	call pinta_marcador		;5d1a   ; pinta_marcador: el texto de p00:5062, los marcos y las cifras del marcador
	call 0a7c6h		;5d1d
	call actores_al_entrar		;5d20   ; actores_al_entrar: los 9 actores de 0xCD00: tipos 8, 9 y 10
	call objetos_de_pantalla		;5d23   ; objetos_de_pantalla: los objetos de 0xCB00 de la pantalla 0xC212
	call 07fe0h		;5d26
	call 0883dh		;5d29
	call 090c8h		;5d2c
	call 07db1h		;5d2f
	call 07cedh		;5d32
	ld a,(0c20ah)		;5d35   ; lee en la sala de la puerta 5
	and a			;5d38
	call nz,08c70h		;5d39
	jp pantalla_encendida		;5d3c   ; pantalla_encendida: R#1 con el bit 6 (pantalla) y sprites encendidos
actores_al_entrar:		; los 9 actores de 0xCD00: tipos 8, 9 y 10
	ld ix,0cd00h		;5d3f   ; apunta a los 9 actores de la pantalla (0x80 bytes cada uno)
	ld b,009h		;5d43
	ld d,000h		;5d45
L_5D47:
	push bc			;5d47
	ld a,(ix+000h)		;5d48   ; lee el tipo del actor
	cp 00ah		;5d4b
	call z,actor_tipo_10		;5d4d   ; actor_tipo_10: el dibujo del actor de tipo 10 en (X, Y) y su casilla
	push de			;5d50
	ld a,(ix+000h)		;5d51   ; lee el tipo del actor
	cp 009h		;5d54
	call z,07832h		;5d56
	ld a,(ix+000h)		;5d59   ; lee el tipo del actor
	cp 008h		;5d5c
	call z,actor_tipo_8		;5d5e   ; actor_tipo_8: el tipo 8 segun su paso: p01:77F9 o p06:BE4C
	pop de			;5d61
	ld bc,00080h		;5d62
	add ix,bc		;5d65
	pop bc			;5d67
	djnz L_5D47		;5d68
	ret			;5d6a
actor_tipo_8:		; el tipo 8 segun su paso: p01:77F9 o p06:BE4C
	ld a,(ix+001h)		;5d6b
	and a			;5d6e
	jp z,077f9h		;5d6f
	jp 0be4ch		;5d72   ; dibujo_8800: copia 16 x 16 de (0x88, 0) a la posicion del actor con TIMP
actores_tipo_10:		; copia el dibujo de los actores de tipo 10 de 0xCD00
	ld ix,0cd00h		;5d75   ; apunta a los 9 actores de la pantalla (0x80 bytes cada uno)
	ld bc,00900h		;5d79
L_5D7C:
	ld a,(ix+000h)		;5d7c   ; lee el tipo del actor
	cp 00ah		;5d7f
	jr nz,L_5DB2		;5d81
	ld a,c			;5d83
	exx			;5d84
	ld h,(ix+005h)		;5d85   ; lee la X del actor
	ld l,(ix+003h)		;5d88   ; lee la Y del actor
	ld d,090h		;5d8b
	add a,a			;5d8d
	add a,a			;5d8e
	add a,a			;5d8f
	add a,a			;5d90
	add a,068h		;5d91
	ld e,a			;5d93
	ld bc,02010h		;5d94
	ld a,004h		;5d97
	call copia_rectangulo		;5d99   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	call posicion_en_d200		;5d9c   ; posicion_en_d200: DE = 0xD200 + la casilla de la Y y la X del actor (p01:7C42)
	ex de,hl			;5d9f
	exx			;5da0
	ld a,c			;5da1
	exx			;5da2
	add a,a			;5da3
	add a,a			;5da4
	ld de,0ca80h		;5da5
	call de_mas_a		;5da8   ; de_mas_a: DE = DE + A
	ld bc,00004h		;5dab
	ldir		;5dae
	exx			;5db0
	inc c			;5db1
L_5DB2:
	ld de,00080h		;5db2
	add ix,de		;5db5
	djnz L_5D7C		;5db7
	ret			;5db9
posicion_en_d200:		; DE = 0xD200 + la casilla de la Y y la X del actor (p01:7C42)
	ld c,(ix+003h)		;5dba
	ld b,(ix+005h)		;5dbd
	ld de,00000h		;5dc0
	jp 07c42h		;5dc3
actor_tipo_10:		; el dibujo del actor de tipo 10 en (X, Y) y su casilla
	ld a,d			;5dc6
	exx			;5dc7
	ld d,(ix+005h)		;5dc8
	ld e,(ix+003h)		;5dcb
	ld h,090h		;5dce
	add a,a			;5dd0
	add a,a			;5dd1
	add a,a			;5dd2
	add a,a			;5dd3
	add a,068h		;5dd4
	ld l,a			;5dd6
	ld bc,02010h		;5dd7
	call copia_de_pagina_1		;5dda   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	call posicion_en_d200		;5ddd   ; posicion_en_d200: DE = 0xD200 + la casilla de la Y y la X del actor (p01:7C42)
	exx			;5de0
	ld a,d			;5de1
	exx			;5de2
	add a,a			;5de3
	add a,a			;5de4
	ld hl,0ca80h		;5de5
	call hl_mas_a		;5de8   ; hl_mas_a: HL = HL + A
	ld bc,00004h		;5deb
	push hl			;5dee
	push de			;5def
	push bc			;5df0
	ldir		;5df1
	pop bc			;5df3
	pop de			;5df4
	pop hl			;5df5
	ld a,020h		;5df6
	call de_mas_a		;5df8   ; de_mas_a: DE = DE + A
	ldir		;5dfb
	exx			;5dfd
	inc d			;5dfe
	ret			;5dff
objetos_de_pantalla:		; los objetos de 0xCB00 de la pantalla 0xC212
	ld hl,0cb00h		;5e00   ; apunta a los objetos de la fase (0x20 bytes cada uno)
	ld b,008h		;5e03
L_5E05:
	push hl			;5e05
	push bc			;5e06
	ld a,(hl)			;5e07
	and a			;5e08
	jr z,L_5E25		;5e09
	inc l			;5e0b
	ld a,(0c212h)		;5e0c   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;5e0f
	jr nz,L_5E25		;5e10
	inc l			;5e12
	ld a,(hl)			;5e13
	cp 006h		;5e14
	jr z,L_5E25		;5e16
	sub 002h		;5e18
	cp 003h		;5e1a
	push hl			;5e1c
	call c,07af4h		;5e1d   ; objeto_vuelve: el objeto vuelve a su sitio
	pop hl			;5e20
	inc l			;5e21
	call 07c5dh		;5e22   ; tapa_casillas: guarda las 2 x 2 casillas del objeto y las marca con 1
L_5E25:
	pop bc			;5e25
	pop hl			;5e26
	ld a,020h		;5e27
	call hl_mas_a		;5e29   ; hl_mas_a: HL = HL + A
	djnz L_5E05		;5e2c
	ret			;5e2e
borra_rectangulo:		; HMMV con 0xFF en la pagina 0
	ld a,0ffh		;5e2f
	ld d,000h		;5e31
	jp rellena_rectangulo		;5e33   ; rellena_rectangulo: HMMV (0xC0): rectangulo B x C en (H, L) de la pagina D con el color A
entra_en_fase:		; graficos, paleta, sprites, mapa y metabloques de la fase; pantalla 1
	call pantalla_apagada		;5e36   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	call mira_sala5		;5e39   ; mira_sala5: 0xC20A = 1 si 0xCC10 vale 2 (la puerta 5 de la antesala)
	call carga_la_fuente		;5e3c   ; carga_la_fuente: con 13-14-15: la fuente (p14:9289) y los caracteres del marcador
	call fichas_comunes		;5e3f   ; fichas_comunes: con 13-14-15: la lista p15:BB95 y p15:B4EB
	call graficos_de_ruina		;5e42   ; graficos_de_ruina: con 7-8-9: la lista de fichas de la ruina (p07:6000), o las de la sala 5 (p00:51D4)
	call paleta_de_fase		;5e45   ; paleta_de_fase: p06:B335 y la paleta de la ruina (p06:B2DB), o la de la sala 5 (p06:B35C)
	call graficos_comunes_de_fase		;5e48   ; graficos_comunes_de_fase: con 10-11-12: la lista p12:ADE3 y el texto p12:AF48
	call lista_af81		;5e4b   ; lista_af81: con 10-11-12: la lista p12:AF81
	call lista_af78		;5e4e   ; lista_af78: con 4-5-6: la lista p06:AF78
	call caracteres_93		;5e51   ; caracteres_93: 6 parejas del caracter 0x93 en la pagina 1 desde (0x88, 0x30)
	call copia_seis_8858		;5e54   ; copia_seis_8858: 6 copias de 16 x 8 de (0x88, 0x58) de la pagina 1
	call graficos_del_personaje		;5e57   ; graficos_del_personaje: la lista de p09:BB32[0xC240] y su paleta
	ld a,001h		;5e5a
	ld (0c212h),a		;5e5c   ; guarda la pantalla de la fase (desde 1)
	call entrada_a_la_fase		;5e5f   ; entrada_a_la_fase: con 9: la Y y el lado de entrada de p09:BF1D[0xC211]
	call sprites_a3c1		;5e62   ; sprites_a3c1: los patrones de p15:A3C1 segun el estado del personaje
	call metabloques_de_fase		;5e65   ; metabloques_de_fase: RLE de los metabloques de la ruina (p10:6032) o de la sala 5 a 0xE400
	call mapa_de_fase		;5e68   ; mapa_de_fase: RLE del mapa de la fase (p10:5FFE[0xC211]) o de la sala 5 a 0xEC00
	call 079a9h		;5e6b
	call 07cbah		;5e6e
	call 07f1fh		;5e71
L_5E74:
	call cambia_de_pantalla		;5e74   ; cambia_de_pantalla: pinta la pantalla nueva: mapa, actores, objetos y sprites
	jp pantalla_encendida		;5e77   ; pantalla_encendida: R#1 con el bit 6 (pantalla) y sprites encendidos
cambia_de_pantalla:		; pinta la pantalla nueva: mapa, actores, objetos y sprites
	call 074e7h		;5e7a
	call banco_9_en_a000		;5e7d   ; banco_9_en_a000: pone el banco 9 en 0xA000
	call 0b8e9h		;5e80
	call bancos_1_2_3		;5e83   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	call apaga_y_borra_todo		;5e86   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call pantalla_apagada		;5e89   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	call 07fc7h		;5e8c
	call borra_c320		;5e8f   ; borra_c320: pone a cero 0xC320-0xC39F
	call borra_cc80		;5e92   ; borra_cc80: pone a cero 0xCC80-0xD17F
	call 0b336h		;5e95
	call pinta_pantalla_de_fase		;5e98   ; pinta_pantalla_de_fase: la pantalla 0xC212 de 0xEC00 a 0xD200 (p15:BEBF)
	call pinta_d200		;5e9b   ; pinta_d200: las 32 x 24 fichas de 0xD200 desde la linea 20 (p00:4DB4)
	call pinta_marcador		;5e9e   ; pinta_marcador: el texto de p00:5062, los marcos y las cifras del marcador
	call 07cedh		;5ea1
	call 07db1h		;5ea4
	call patrones_b511		;5ea7   ; patrones_b511: con 13-14-15: el RLE de p15:B511 a la VRAM 0xFFC0
	call 079e2h		;5eaa
	call 07f7bh		;5ead
	call 0772eh		;5eb0
	call paleta_vacia		;5eb3   ; paleta_vacia: fuera de la sala 5: la paleta p06:B35B (vacia)
	call 08236h		;5eb6
	call borra_actores		;5eb9   ; borra_actores: pone a cero 0xC400-0xC7FF y 0xCC60-0xCC63
	call 087a1h		;5ebc
	call 090f0h		;5ebf
	call 08cd6h		;5ec2
	jp 08f16h		;5ec5
borra_personajes:		; pone a cero 0xC240-0xC258
	ld hl,0c240h		;5ec8   ; apunta a el personaje que se lleva (0 o 1)
	ld bc,00018h		;5ecb
	jr borra		;5ece
personajes_al_empezar:		; con 6: las dos fichas de personaje de p06:BF6C a 0xC2B0 y 0xC2D0
	call banco_6_en_a000		;5ed0   ; banco_6_en_a000: pone el banco 6 en 0xA000
	ld hl,0bf6ch		;5ed3
	ld de,0c2b0h		;5ed6   ; apunta a la ficha del personaje 0 (14 bytes)
	ld bc,0000eh		;5ed9
	push bc			;5edc
	ldir		;5edd
	pop bc			;5edf
	ld de,0c2d0h		;5ee0   ; apunta a la ficha del personaje 1 (14 bytes)
	ldir		;5ee3
	jp bancos_1_2_3		;5ee5   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
borra_c320:		; pone a cero 0xC320-0xC39F
	ld bc,0007fh		;5ee8
	ld hl,0c320h		;5eeb   ; apunta a los 4 disparos (0x20 bytes cada uno)
	jr borra		;5eee
borra_actores:		; pone a cero 0xC400-0xC7FF y 0xCC60-0xCC63
	ld bc,003ffh		;5ef0
	ld hl,0c400h		;5ef3   ; apunta a los 8 actores (0x80 bytes cada uno)
	call borra		;5ef6   ; borra: pone a cero BC + 1 bytes desde HL
	ld l,a			;5ef9
	ld h,a			;5efa
	ld (0cc60h),hl		;5efb
	ld (0cc62h),hl		;5efe
	ret			;5f01
borra_e000:		; pone a cero 0xE000-0xE07F
	ld hl,0e000h		;5f02
	ld bc,0007fh		;5f05
borra:		; pone a cero BC + 1 bytes desde HL
	ld d,h			;5f08   ; DE = HL + 1 y ldir: copia el cero hacia delante
	ld e,l			;5f09
	inc de			;5f0a
	xor a			;5f0b
	ld (hl),a			;5f0c
	ldir		;5f0d
	ret			;5f0f
borra_cc80:		; pone a cero 0xCC80-0xD17F
	ld bc,004ffh		;5f10
	ld hl,0cc80h		;5f13   ; apunta a las piezas de sprite ocupadas (22)
	jr borra		;5f16
mira_sala5:		; 0xC20A = 1 si 0xCC10 vale 2 (la puerta 5 de la antesala)
	ld hl,0c20ah		;5f18   ; apunta a en la sala de la puerta 5
	ld (hl),000h		;5f1b
	ld a,(0cc10h)		;5f1d   ; lee la pantalla de la antesala (0-2)
	cp 002h		;5f20
	ret nz			;5f22
	ld (hl),001h		;5f23
	ret			;5f25
entrada_a_la_fase:		; con 9: la Y y el lado de entrada de p09:BF1D[0xC211]
	call banco_9_en_a000		;5f26   ; banco_9_en_a000: pone el banco 9 en 0xA000
	ld a,(0c211h)		;5f29   ; lee la fase (1-25: ruina * 5 + puerta)
	ld hl,0bf1dh		;5f2c
	call hl_mas_a		;5f2f   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;5f32
	and 0f0h		;5f33
	add a,003h		;5f35
	ld (0c244h),a		;5f37   ; guarda la Y del personaje
	ld a,(hl)			;5f3a
	and 00fh		;5f3b
	dec a			;5f3d
	ld a,001h		;5f3e
	ld b,018h		;5f40
	jr z,L_5F47		;5f42
	xor a			;5f44
	ld b,0e8h		;5f45
L_5F47:
	ld (0c250h),a		;5f47   ; guarda el sentido del personaje
	ld a,b			;5f4a
	ld (0c246h),a		;5f4b   ; guarda la X del personaje
	jp bancos_1_2_3		;5f4e   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
copia_seis_8858:		; 6 copias de 16 x 8 de (0x88, 0x58) de la pagina 1
	ld hl,08858h		;5f51
	ld de,04088h		;5f54
	ld b,006h		;5f57
L_5F59:
	push hl			;5f59   ; 6 copias de 16 x 8 de la pagina 1 a la 1 (A = 5)
	push de			;5f5a
	push bc			;5f5b
	ld bc,01008h		;5f5c
	ld a,005h		;5f5f
	call copia_rectangulo		;5f61   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop bc			;5f64
	pop de			;5f65
	pop hl			;5f66
	ld a,e			;5f67   ; la siguiente, 8 lineas mas abajo
	add a,008h		;5f68
	ld e,a			;5f6a
	djnz L_5F59		;5f6b
	ret			;5f6d
demo_siguiente:		; la ruina de la demo (0xC203, 0-4) y su primera fase
	ld hl,001ffh		;5f6e
	ld (0c009h),hl		;5f71
	ld hl,0c203h		;5f74   ; apunta a la ruina de la demo (0-4)
	ld a,(hl)			;5f77
	ld (0c21dh),a		;5f78   ; guarda la ruina (0-4)
	ld b,a			;5f7b
	add a,a			;5f7c
	add a,a			;5f7d
	add a,b			;5f7e
	inc a			;5f7f
	ld (0c211h),a		;5f80   ; guarda la fase (1-25: ruina * 5 + puerta)
	inc (hl)			;5f83
	ld a,(hl)			;5f84
	cp 005h		;5f85
	jr c,L_5F8B		;5f87
	xor a			;5f89
	ld (hl),a			;5f8a
L_5F8B:
	xor a			;5f8b
	ld (0c24bh),a		;5f8c   ; guarda la accion del personaje (4 muere, 5 escalera)
	ld (0c20ah),a		;5f8f   ; guarda en la sala de la puerta 5
	ld (0cc10h),a		;5f92   ; guarda la pantalla de la antesala (0-2)
	ld (0c226h),a		;5f95   ; guarda se sale de la fase
	ld (0c003h),a		;5f98   ; guarda la cuenta de cuadros
	ld (0c00dh),a		;5f9b   ; guarda la cuenta de cuadros del juego
	ld (0c3a0h),a		;5f9e
	ld h,a			;5fa1
	ld l,a			;5fa2
	ld (0c259h),hl		;5fa3   ; guarda las monedas (16 bits) y el byte siguiente (16 bits)
	inc a			;5fa6
	ld (0c214h),a		;5fa7   ; guarda en marcha la fase
	call borra_personajes		;5faa   ; borra_personajes: pone a cero 0xC240-0xC258
	ld a,(0c21dh)		;5fad   ; lee la ruina (0-4)
	and 001h		;5fb0
	ld (0c240h),a		;5fb2   ; guarda el personaje que se lleva (0 o 1)
	call personajes_al_empezar		;5fb5   ; personajes_al_empezar: con 6: las dos fichas de personaje de p06:BF6C a 0xC2B0 y 0xC2D0
	call estados_de_la_ruina		;5fb8   ; estados_de_la_ruina: el estado de los dos personajes al entrar en la ruina (p00:4575)
	call entra_en_fase		;5fbb   ; entra_en_fase: graficos, paleta, sprites, mapa y metabloques de la fase; pantalla 1
	jp musica_de_fase		;5fbe   ; musica_de_fase: la musica de la ruina segun el personaje (p15:BE7A), o la de la sala 5
en_la_fase:		; si 0xC215 es cero: p01:6033, p01:605A y p06:B66A con el 6, y la tecla 0x10 de 0xC00E
	ld a,(0c215h)		;5fc1   ; lee el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	and a			;5fc4
	jr nz,$+66		;5fc5
	call 06033h		;5fc7
	call 0605ah		;5fca
	call banco_6_en_a000		;5fcd   ; banco_6_en_a000: pone el banco 6 en 0xA000
	call 0b66ah		;5fd0
	call bancos_1_2_3		;5fd3   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c00eh)		;5fd6   ; lee las teclas especiales
	and 010h		;5fd9
	jr z,L_5FF2		;5fdb
	ld hl,0c204h		;5fdd
	ld a,(hl)			;5fe0
	and a			;5fe1
	jr z,L_5FEB		;5fe2
	ld (hl),000h		;5fe4
	call musica_de_fase_otra		;5fe6   ; musica_de_fase_otra: como p00:54C8 con 0xDE80 = 1
	jr L_5FF2		;5fe9
L_5FEB:
	ld (hl),001h		;5feb
	ld a,000h		;5fed
	call sonido		;5fef   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_5FF2:
	ld a,(0c24bh)		;5ff2   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;5ff5
	jr z,L_5FFE		;5ff7
	ld a,(0c226h)		;5ff9   ; lee se sale de la fase
	or a			;5ffc
	ret z			;5ffd
L_5FFE:
	xor a			;5ffe

; ----------------------------------------------------------------------
; DATOS ld_partido: el primer byte (0x32) de `ld (0xC214),a`: los otros dos
;   (14 C2) son los primeros del banco 1, en 0x6000. Va tras p00:5FF9 (si
;   0xC226 no es cero, xor a: 0xC214 = 0); ningun trazador de un solo banco
;   puede ver la instruccion entera: por eso va como datos
;   0x5fff..0x6000  (1 bytes)
DATA_ld_partido:
	defb 032h	; 5fff
