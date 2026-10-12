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
	and a			;8000
	jr nz,L_8039		;8001
	ld a,(0c21dh)		;8003
	and a			;8006
	ld b,001h		;8007
	jr z,L_8011		;8009
	cp 003h		;800b
	jr z,L_8011		;800d
	ld b,000h		;800f
L_8011:
	ld a,b			;8011
	ld (0c8a9h),a		;8012
L_8015:
	call L_80C0		;8015
	call L_80A7		;8018
	call 054aah		;801b
	ld hl,0b603h		;801e
	ld a,(0c21dh)		;8021
	call 0543ah		;8024
	ld (0c8a1h),hl		;8027
	ld a,008h		;802a
	ld (0c8a5h),a		;802c
	xor a			;802f
	ld (0c8a6h),a		;8030
	ld hl,0c8a0h		;8033
	inc (hl)			;8036
	jr L_80A4		;8037
L_8039:
	ld a,(0c8a9h)		;8039
	and a			;803c
	jr nz,L_8044		;803d
	call L_81DB		;803f
	jr L_8047		;8042
L_8044:
	call L_81E7		;8044
L_8047:
	ld hl,0c8a5h		;8047
	dec (hl)			;804a
	ret nz			;804b
	ld a,(0c8aah)		;804c
	and a			;804f
	jr z,L_8059		;8050
	call L_80C0		;8052
	xor a			;8055
	ld (0c8aah),a		;8056
L_8059:
	call 054aah		;8059
	ld hl,(0c8a1h)		;805c
	ld a,(hl)			;805f
	inc hl			;8060
	ld (0c8a1h),hl		;8061
	ld b,a			;8064
	inc a			;8065
	jr z,L_80B3		;8066
	inc a			;8068
	jr z,L_8090		;8069
	inc a			;806b
	jr z,L_807B		;806c
	ld a,b			;806e
	ld de,(0c8a3h)		;806f
	call 04d86h		;8073
	call 04e39h		;8076
	jr L_8085		;8079
L_807B:
	ld de,(0c8a7h)		;807b
	ld a,(0c8a3h)		;807f
	add a,00ch		;8082
	ld e,a			;8084
L_8085:
	ld (0c8a3h),de		;8085
	ld a,008h		;8089
	ld (0c8a5h),a		;808b
	jr L_80A4		;808e
L_8090:
	ld a,01eh		;8090
	ld (0c8a5h),a		;8092
	ld hl,0c8a9h		;8095
	ld a,(hl)			;8098
	xor 001h		;8099
	ld (hl),a			;809b
	call L_80A7		;809c
	ld a,001h		;809f
	ld (0c8aah),a		;80a1
L_80A4:
	jp 05464h		;80a4
L_80A7:
	ld de,05830h		;80a7
	ld (0c8a7h),de		;80aa
	ld (0c8a3h),de		;80ae
	ret			;80b2
L_80B3:
	xor a			;80b3
	ld (0c8a0h),a		;80b4
	inc a			;80b7
	ld (0c8a6h),a		;80b8
	ld (0c8abh),a		;80bb
	jr L_80A4		;80be
L_80C0:
	ld hl,04a28h		;80c0
	ld bc,06d30h		;80c3
	call 05e2fh		;80c6
	call 054b4h		;80c9
	ld a,(0c8a9h)		;80cc
	and a			;80cf
	ld hl,04a2bh		;80d0
	jr z,L_80D8		;80d3
	ld hl,0ac4ch		;80d5
L_80D8:
	ld de,00808h		;80d8
	ld c,00dh		;80db
	call 04b40h		;80dd
	ld a,(0c8a9h)		;80e0
	and a			;80e3
	ld hl,0a7c8h		;80e4
	jr z,L_80EC		;80e7
	ld hl,0a7d6h		;80e9
L_80EC:
	call 055ceh		;80ec
	ld a,(0c8a9h)		;80ef
	and a			;80f2
	ld hl,0a7cfh		;80f3
	jr z,L_80FB		;80f6
	ld hl,0a7ddh		;80f8
L_80FB:
	call 055d1h		;80fb
	jr L_80A4		;80fe
L_8100:
	ld a,(0c8a0h)		;8100
	and a			;8103
	jp nz,L_8039		;8104
	call L_80C0		;8107
	call L_8168		;810a
	ld a,(0c240h)		;810d
	ld (0c8a9h),a		;8110
	call L_8015		;8113
	ld hl,0c8b0h		;8116
	ld (0c8a1h),hl		;8119
	ld a,(0c2b0h)		;811c
	ld b,a			;811f
	ld a,(0c2d0h)		;8120
	or b			;8123
	ret z			;8124
	call 054aah		;8125
	call 061c2h		;8128
	ld a,(0002bh)		;812b
	and 00fh		;812e
	jr nz,L_815A		;8130
	ld a,(0c240h)		;8132
	and a			;8135
	ld hl,0b7dch		;8136
	ld a,(0c2b6h)		;8139
	jr z,L_8144		;813c
	ld hl,0b7ech		;813e
	ld a,(0c2d6h)		;8141
L_8144:
	push af			;8144
	ld a,(0c208h)		;8145
	cp b			;8148
	ld c,000h		;8149
	jr z,L_814F		;814b
	ld c,004h		;814d
L_814F:
	pop af			;814f
	add a,c			;8150
	call 0543ah		;8151
L_8154:
	ld (0c8a1h),hl		;8154
	jp 05464h		;8157
L_815A:
	ld a,(0c208h)		;815a
	cp b			;815d
	ld hl,0b8a1h		;815e
	jr z,L_8154		;8161
	ld hl,0b8afh		;8163
	jr L_8154		;8166
L_8168:
	call 054aah		;8168
	ld de,0c8b0h		;816b
	ld a,(0002bh)		;816e
	and 00fh		;8171
	ld a,(0c240h)		;8173
	jr nz,L_81BD		;8176
	ld de,0c8b0h		;8178
	and a			;817b
	ld hl,0b73ch		;817c
	ld a,(0c2b6h)		;817f
	ld b,a			;8182
	exx			;8183
	ld hl,0b754h		;8184
	ld a,(0c2d6h)		;8187
	ld b,a			;818a
	exx			;818b
	jr z,L_819E		;818c
	ld hl,0b74ch		;818e
	ld a,(0c2d6h)		;8191
	ld b,a			;8194
	exx			;8195
	ld hl,0b744h		;8196
	ld a,(0c2b6h)		;8199
	ld b,a			;819c
	exx			;819d
L_819E:
	call L_81B2		;819e
	ld a,0feh		;81a1
	ld (de),a			;81a3
	inc de			;81a4
	push de			;81a5
	exx			;81a6
	pop de			;81a7
	call L_81B2		;81a8
	ld a,0ffh		;81ab
	ld (de),a			;81ad
	exx			;81ae
	jp 05464h		;81af
L_81B2:
	ld a,b			;81b2
	call 0543ah		;81b3
L_81B6:
	ld a,(hl)			;81b6
	inc a			;81b7
	ret z			;81b8
	ldi		;81b9
	jr L_81B6		;81bb
L_81BD:
	ld hl,0b858h		;81bd
	ld bc,00006h		;81c0
	ldir		;81c3
	and a			;81c5
	ld a,(0c2b6h)		;81c6
	jr nz,L_81CE		;81c9
	ld a,(0c2d6h)		;81cb
L_81CE:
	ld b,a			;81ce
	ld hl,0b85eh		;81cf
	call L_81B2		;81d2
	ld a,0ffh		;81d5
	ld (de),a			;81d7
	jp 05464h		;81d8
L_81DB:
	ld hl,0a774h		;81db
	ld de,02844h		;81de
	ld a,(0c2b6h)		;81e1
	ld b,a			;81e4
	jr L_81F1		;81e5
L_81E7:
	ld hl,0a794h		;81e7
	ld de,0c844h		;81ea
	ld a,(0c2d6h)		;81ed
	ld b,a			;81f0
L_81F1:
	ld a,(0c003h)		;81f1
	and 007h		;81f4
	ret nz			;81f6
	push bc			;81f7
	call 054b4h		;81f8
	ld bc,0c8ach		;81fb
	ld a,(bc)			;81fe
	xor 001h		;81ff
	ld (bc),a			;8201
	add a,a			;8202
	add a,a			;8203
	ld b,a			;8204
	pop af			;8205
	add a,b			;8206
	add a,a			;8207
	add a,a			;8208
	call 04083h		;8209
	ld bc,00202h		;820c
	call 0ba24h		;820f
	jp 05464h		;8212
L_8215:
	ld a,028h		;8215
	call 055f0h		;8217
	ld a,019h		;821a
	call 055f0h		;821c
	ld a,(0c21dh)		;821f
	ld hl,0822ch		;8222
	call 04083h		;8225
	ld a,(hl)			;8228
	jp 055f0h		;8229

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


L_8231:
	ld a,030h		;8231
	jp 055f0h		;8233
L_8236:
	call L_823C		;8236
	jp 05464h		;8239
L_823C:
	ld a,(0c20ah)		;823c
	or a			;823f
	jr nz,$-43		;8240
	call 054afh		;8242
	xor a			;8245
	ld (0cc37h),a		;8246
	call L_9195		;8249
	ret c			;824c
	cp 0ffh		;824d
	ret z			;824f
	push hl			;8250
	ld a,028h		;8251
	call 055f0h		;8253
	ld a,029h		;8256
	call 055f0h		;8258
	call 054afh		;825b
	pop hl			;825e
L_825F:
	ld a,(0c212h)		;825f
	cp (hl)			;8262
	ret nz			;8263
	inc hl			;8264
	ld a,(hl)			;8265
	push hl			;8266
	call L_827F		;8267
	pop hl			;826a
	ld a,(hl)			;826b
	inc hl			;826c
	inc hl			;826d
	inc hl			;826e
	push hl			;826f
	call 055f0h		;8270
	call 054afh		;8273
	pop hl			;8276
	jr L_825F		;8277
L_8279:
	inc hl			;8279
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


L_827F:
	dec a			;827f
	ld hl,0b74ah		;8280
	call 04083h		;8283
	ld a,(hl)			;8286
	or a			;8287
	ret z			;8288
	dec a			;8289
	ld hl,0b781h		;828a
	call 0543ah		;828d
	jp 04a9dh		;8290
L_8293:
	call L_8598		;8293
	ld ix,0c400h		;8296
	ld b,008h		;829a
L_829C:
	ld a,(ix+000h)		;829c
	and a			;829f
	jr z,L_82BD		;82a0
	push bc			;82a2
	call L_82E2		;82a3
	ld a,(ix+000h)		;82a6
	and a			;82a9
	jr z,L_82B5		;82aa
	call L_8367		;82ac
	call L_8393		;82af
	call L_83BF		;82b2
L_82B5:
	ld a,(ix+012h)		;82b5
	and a			;82b8
	call z,L_8400		;82b9
	pop bc			;82bc
L_82BD:
	ld de,00080h		;82bd
	add ix,de		;82c0
	djnz L_829C		;82c2
	ret			;82c4
L_82C5:
	ld ix,0c400h		;82c5
	ld b,008h		;82c9
L_82CB:
	push bc			;82cb
	ld a,(ix+000h)		;82cc
	and a			;82cf
	jr z,L_82D9		;82d0
	cp 037h		;82d2
	jr z,L_82D9		;82d4
	call L_8A39		;82d6
L_82D9:
	ld de,00080h		;82d9
	add ix,de		;82dc
	pop bc			;82de
	djnz L_82CB		;82df
	ret			;82e1
L_82E2:
	ld a,(ix+000h)		;82e2
	dec a			;82e5
	call 0408dh		;82e6

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


L_8367:
	ld a,(ix+006h)		;8367
	and a			;836a
	ret z			;836b
	ld e,(ix+007h)		;836c
	ld d,(ix+008h)		;836f
	ld l,(ix+002h)		;8372
	ld h,(ix+003h)		;8375
	add hl,de			;8378
	ld (ix+002h),l		;8379
	ld (ix+003h),h		;837c
	ld e,(ix+009h)		;837f
	ld d,(ix+00ah)		;8382
	ld l,(ix+004h)		;8385
	ld h,(ix+005h)		;8388
	add hl,de			;838b
	ld (ix+004h),l		;838c
	ld (ix+005h),h		;838f
L_8392:
	ret			;8392
L_8393:
	ld a,(ix+00bh)		;8393
	and a			;8396
	ret z			;8397
	ld e,(ix+00ch)		;8398
	ld d,(ix+00dh)		;839b
	ld l,(ix+007h)		;839e
	ld h,(ix+008h)		;83a1
	add hl,de			;83a4
	ld (ix+007h),l		;83a5
	ld (ix+008h),h		;83a8
	ld e,(ix+00eh)		;83ab
	ld d,(ix+00fh)		;83ae
	ld l,(ix+009h)		;83b1
	ld h,(ix+00ah)		;83b4
	add hl,de			;83b7
	ld (ix+009h),l		;83b8
	ld (ix+00ah),h		;83bb
	ret			;83be
L_83BF:
	ld a,(ix+000h)		;83bf
	cp 021h		;83c2
	ret z			;83c4
	ld a,(ix+003h)		;83c5
	cp 0e4h		;83c8
	jr nc,L_83D6		;83ca
	ld a,(ix+005h)		;83cc
	cp 0f5h		;83cf
	jr nc,L_83D6		;83d1
	cp 00ah		;83d3
	ret nc			;83d5
L_83D6:
	xor a			;83d6
	ld (ix+000h),a		;83d7
	push ix		;83da
	pop hl			;83dc
	set 5,l		;83dd
	ld c,(hl)			;83df
	ld a,c			;83e0
	and a			;83e1
	ret z			;83e2
	inc l			;83e3
L_83E4:
	ld de,0de28h		;83e4
	ld a,(hl)			;83e7
	add a,a			;83e8
	add a,a			;83e9
	add a,e			;83ea
	ld e,a			;83eb
	ld a,0e0h		;83ec
	ld (de),a			;83ee
	ld de,0cc80h		;83ef
	ld a,(hl)			;83f2
	call 04088h		;83f3
	xor a			;83f6
	ld (de),a			;83f7
	ld a,l			;83f8
	add a,005h		;83f9
	ld l,a			;83fb
	dec c			;83fc
	jr nz,L_83E4		;83fd
	ret			;83ff
L_8400:
	ld a,(0c316h)		;8400
	or a			;8403
	jr z,L_8412		;8404
	ld a,(ix+000h)		;8406
	cp 01eh		;8409
	jr c,L_8412		;840b
	cp 022h		;840d
	jp c,L_84AC		;840f
L_8412:
	ld a,(ix+000h)		;8412
	cp 010h		;8415
	jr nc,L_8436		;8417
	ld hl,0e30bh		;8419
	inc (hl)			;841c
	jr L_8436		;841d
L_841F:
	ld a,(ix+01eh)		;841f
	cp 010h		;8422
	ret nc			;8424
	ld hl,0c400h		;8425
	ld de,00080h		;8428
	ld a,029h		;842b
	ld b,008h		;842d
L_842F:
	cp (hl)			;842f
	ret z			;8430
	add hl,de			;8431
	djnz L_842F		;8432
	scf			;8434
	ret			;8435
L_8436:
	ld a,01ch		;8436
	call 056e3h		;8438
	ld a,(ix+000h)		;843b
	ld (ix+01eh),a		;843e
	call L_83D6		;8441
	ld (ix+000h),028h		;8444
	ld (ix+001h),000h		;8448
	ld (ix+020h),002h		;844c
	ld (ix+025h),00eh		;8450
	ld (ix+02ah),04dh		;8454
	ld (ix+012h),001h		;8458
	call L_84C6		;845c
L_845F:
	ld a,(ix+01eh)		;845f
	or a			;8462
	jr nz,L_8469		;8463
	ld (ix+01eh),0ffh		;8465
L_8469:
	xor a			;8469
	ld (ix+006h),a		;846a
	ld (ix+00bh),a		;846d
	ld (ix+010h),065h		;8470
	ld (ix+011h),002h		;8474
	ld (ix+013h),a		;8478
	ret			;847b
L_847C:
	dec (ix+011h)		;847c
	ret nz			;847f
	ld a,(ix+001h)		;8480
	cp 002h		;8483
	jr nc,L_8492		;8485
	inc (ix+010h)		;8487
	ld (ix+011h),002h		;848a
	inc (ix+001h)		;848e
	ret			;8491
L_8492:
	ld a,(0e30bh)		;8492
	cp 002h		;8495
	jp c,L_83D6		;8497
	xor a			;849a
	ld (0e30bh),a		;849b
	call L_841F		;849e
	jp c,0a70dh		;84a1
	jp L_83D6		;84a4

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
	ld a,044h		;84ac
	call 056e3h		;84ae
	ld d,(ix+005h)		;84b1
	ld e,(ix+003h)		;84b4
	push ix		;84b7
	push de			;84b9
	call L_8E2E		;84ba
	pop de			;84bd
	ld c,01dh		;84be
	call L_8613		;84c0
	pop ix		;84c3
	ret			;84c5
L_84C6:
	ld a,(ix+020h)		;84c6
	or a			;84c9
	ret z			;84ca
	ld a,(ix+021h)		;84cb
	call L_84D4		;84ce
	ld a,(ix+026h)		;84d1
L_84D4:
	ld de,0cc80h		;84d4
	call 04088h		;84d7
	ld a,001h		;84da
	ld (de),a			;84dc
	ret			;84dd
L_84DE:
	ld a,080h		;84de
L_84E0:
	ld e,(ix+003h)		;84e0
	ld d,(ix+005h)		;84e3
	push af			;84e6
	call 054a5h		;84e7
	pop af			;84ea
	call L_84F1		;84eb
	jp 05464h		;84ee
L_84F1:
	ld (0e302h),a		;84f1
	call L_8530		;84f4
	ld a,(0e304h)		;84f7
	ld e,a			;84fa
	ld d,000h		;84fb
	ld a,e			;84fd
	sub 03fh		;84fe
	neg		;8500
	ld hl,0bdd6h		;8502
	push hl			;8505
	add hl,de			;8506
	ld c,(hl)			;8507
	pop hl			;8508
	ld e,a			;8509
	add hl,de			;850a
	ld a,(hl)			;850b
	ld (0e308h),a		;850c
	ld e,c			;850f
	call L_857A		;8510
	ld a,(0e306h)		;8513
	and a			;8516
	call nz,L_8B39		;8517
	ld (0e303h),de		;851a
	ld a,(0e308h)		;851e
	ld e,a			;8521
	call L_857A		;8522
	ld a,(0e307h)		;8525
	and a			;8528
	call nz,L_8B39		;8529
	ld hl,(0e303h)		;852c
	ret			;852f
L_8530:
	ld hl,0e306h		;8530
	ld (hl),000h		;8533
	ld a,(0c244h)		;8535
	sub 010h		;8538
	sub e			;853a
	jr nc,L_8540		;853b
	neg		;853d
	inc (hl)			;853f
L_8540:
	inc hl			;8540
	ld (hl),000h		;8541
	rra			;8543
	rra			;8544
	and 038h		;8545
	ld e,a			;8547
	ld a,(0c246h)		;8548
	sub d			;854b
	jr nc,L_8551		;854c
	neg		;854e
	inc (hl)			;8550
L_8551:
	rra			;8551
	rra			;8552
	rra			;8553
	rra			;8554
	rra			;8555
	and 007h		;8556
	add a,e			;8558
	ld hl,0bd96h		;8559
	call 04083h		;855c
	ld a,(hl)			;855f
	ld (0e304h),a		;8560
	ld c,a			;8563
	ld hl,(0e306h)		;8564
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
L_857A:
	ld a,(0e302h)		;857a
	ld h,a			;857d
	call L_858C		;857e
	xor a			;8581
	add hl,hl			;8582
	adc a,a			;8583
	add hl,hl			;8584
	adc a,a			;8585
	add hl,hl			;8586
	adc a,a			;8587
	ld l,h			;8588
	ld h,a			;8589
	ex de,hl			;858a
	ret			;858b
L_858C:
	ld b,008h		;858c
	ld l,000h		;858e
	ld d,l			;8590
L_8591:
	add hl,hl			;8591
	jr nc,L_8595		;8592
	add hl,de			;8594
L_8595:
	djnz L_8591		;8595
	ret			;8597
L_8598:
	ld a,(0c24bh)		;8598
	cp 004h		;859b
	ret z			;859d
	call L_85B1		;859e
	ret nc			;85a1
	call 054afh		;85a2
	call L_85F4		;85a5
	call L_8903		;85a8
	call L_88F7		;85ab
	jp 05464h		;85ae
L_85B1:
	ld hl,0c400h		;85b1
	ld b,008h		;85b4
	ld c,000h		;85b6
L_85B8:
	ld a,(hl)			;85b8
	or a			;85b9
	jr z,L_85DD		;85ba
	cp 017h		;85bc
	jr z,L_85C9		;85be
	cp 014h		;85c0
	jr nc,L_85DD		;85c2
	cp 002h		;85c4
	jr nz,L_85C9		;85c6
	inc c			;85c8
L_85C9:
	push af			;85c9
	call 054afh		;85ca
	pop af			;85cd
	push hl			;85ce
	call L_91D2		;85cf
	pop hl			;85d2
	push af			;85d3
	call 05464h		;85d4
	pop af			;85d7
	cp 001h		;85d8
	jr z,L_85DD		;85da
	inc c			;85dc
L_85DD:
	ld de,00080h		;85dd
	add hl,de			;85e0
	djnz L_85B8		;85e1
	ld a,(0c21dh)		;85e3
	ld hl,085efh		;85e6
	call 04083h		;85e9
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


L_85F4:
	ld a,(0c00dh)		;85f4
	and 003h		;85f7
	ret nz			;85f9
	ld hl,0cc3bh		;85fa
	dec (hl)			;85fd
	ret nz			;85fe
	ld a,(0cc3ch)		;85ff
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
L_8613:
	xor a			;8613
	ld b,a			;8614
L_8615:
	ld a,b			;8615
	ld (0c3adh),a		;8616
	xor a			;8619
	ld (0c3ach),a		;861a
	ld a,c			;861d
	ld (0de80h),a		;861e
	ld (0de81h),de		;8621
	ld hl,0c400h		;8625
	ld b,008h		;8628
	xor a			;862a
	ld de,00080h		;862b
L_862E:
	cp (hl)			;862e
	jr z,L_8635		;862f
	add hl,de			;8631
	djnz L_862E		;8632
	ret			;8634
L_8635:
	push hl			;8635
	pop ix		;8636
	ld (0de83h),hl		;8638
	call 054b4h		;863b
	ld a,(0de80h)		;863e
	ld hl,0b62ah		;8641
	call 04083h		;8644
	ld a,(hl)			;8647
	ld (ix+020h),a		;8648
	push af			;864b
	call 05464h		;864c
	pop af			;864f
	ld c,a			;8650
	and a			;8651
	jr z,L_8691		;8652
	ld de,00000h		;8654
	ld hl,0cc80h		;8657
	ld b,012h		;865a
L_865C:
	ld a,(hl)			;865c
	or a			;865d
	jr nz,L_866A		;865e
	ld a,001h		;8660
	ld (hl),a			;8662
	call L_8791		;8663
	inc e			;8666
	dec c			;8667
	jr z,L_8691		;8668
L_866A:
	inc d			;866a
	inc hl			;866b
	djnz L_865C		;866c
	ld hl,(0de83h)		;866e
	ld a,021h		;8671
	call 04083h		;8673
	ld a,(ix+020h)		;8676
	sub c			;8679
	ret z			;867a
	ld b,a			;867b
L_867C:
	ld a,(hl)			;867c
	ld de,0cc80h		;867d
	call 04088h		;8680
	ld a,(de)			;8683
	or a			;8684
	jr z,L_868A		;8685
	ld a,000h		;8687
	ld (de),a			;8689
L_868A:
	ld de,00005h		;868a
	add hl,de			;868d
	djnz L_867C		;868e
	ret			;8690
L_8691:
	ld a,001h		;8691
	ld (0c3ach),a		;8693
	ld hl,(0de83h)		;8696
	push hl			;8699
	xor a			;869a
	ld b,020h		;869b
L_869D:
	ld (hl),a			;869d
	inc hl			;869e
	djnz L_869D		;869f
	pop hl			;86a1
	ld a,(0de80h)		;86a2
	ld (hl),a			;86a5
	inc l			;86a6
	ld de,(0de81h)		;86a7
	inc l			;86ab
	inc l			;86ac
	ld (hl),e			;86ad
	inc l			;86ae
	inc l			;86af
	ld (hl),d			;86b0
	inc l			;86b1
	ld a,(0c3adh)		;86b2
	ld (ix+015h),a		;86b5
	xor a			;86b8
	ld (0c3adh),a		;86b9
	ld (ix+006h),001h		;86bc
	ld (ix+014h),001h		;86c0
	ld (ix+013h),003h		;86c4
	call 054b4h		;86c8
	ld hl,0b569h		;86cb
	call L_8769		;86ce
	ld a,(0de80h)		;86d1
	ld de,0b5ebh		;86d4
	call 04088h		;86d7
	ld a,(de)			;86da
	ld (ix+012h),a		;86db
	call 05464h		;86de
	ld hl,(0de83h)		;86e1
	ld a,(ix+000h)		;86e4
	dec a			;86e7
	call 0408dh		;86e8

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


L_8769:
	ld a,(ix+020h)		;8769
	and a			;876c
	ret z			;876d
	ld a,(ix+000h)		;876e
	dec a			;8771
	call 04083h		;8772
	ld a,(hl)			;8775
	ld hl,0b5a8h		;8776
	call 0543ah		;8779
	ex de,hl			;877c
	ld hl,(0de83h)		;877d
	set 5,l		;8780
	ld b,(hl)			;8782
	ld a,005h		;8783
	add a,l			;8785
	ld l,a			;8786
L_8787:
	ld a,(de)			;8787
	inc de			;8788
	ld (hl),a			;8789
	ld a,l			;878a
	add a,005h		;878b
	ld l,a			;878d
	djnz L_8787		;878e
	ret			;8790
L_8791:
	push hl			;8791
	ld hl,(0de83h)		;8792
	ld a,e			;8795
	add a,a			;8796
	add a,a			;8797
	add a,e			;8798
	add a,021h		;8799
	call 04083h		;879b
	ld (hl),d			;879e
	pop hl			;879f
	ret			;87a0
L_87A1:
	ld hl,0cc40h		;87a1
	ld bc,0000fh		;87a4
	call 05f08h		;87a7
	call 054afh		;87aa
	call L_87B6		;87ad
	call 05464h		;87b0
	jp L_886A		;87b3
L_87B6:
	xor a			;87b6
	ld (0c312h),a		;87b7
	ld (0cc35h),a		;87ba
	ld (0cc37h),a		;87bd
	ld (0cc3ch),a		;87c0
	inc a			;87c3
	ld (0cc38h),a		;87c4
	ld (0cc36h),a		;87c7
	ld (0cc39h),a		;87ca
	ld a,040h		;87cd
	ld (0cc3bh),a		;87cf
	call L_9195		;87d2
	ret c			;87d5
	cp 0ffh		;87d6
	ret z			;87d8
L_87D9:
	ld a,(0c212h)		;87d9
	cp (hl)			;87dc
	ret nz			;87dd
	inc hl			;87de
	ld a,(hl)			;87df
	push hl			;87e0
	call L_91D2		;87e1
	pop hl			;87e4
	or a			;87e5
	jr z,L_880D		;87e6
	cp 001h		;87e8
	jr nz,L_8812		;87ea
	ld c,(hl)			;87ec
	inc hl			;87ed
	ld a,(hl)			;87ee
	inc hl			;87ef
	ld b,(hl)			;87f0
	inc hl			;87f1
	ld e,a			;87f2
	and 0f0h		;87f3
	add a,008h		;87f5
	ld d,a			;87f7
	ld a,e			;87f8
	add a,a			;87f9
	add a,a			;87fa
	add a,a			;87fb
	add a,a			;87fc
	add a,014h		;87fd
	ld e,a			;87ff
	call 05464h		;8800
	push hl			;8803
	call L_8615		;8804
	pop hl			;8807
	call 054afh		;8808
	jr L_87D9		;880b
L_880D:
	inc hl			;880d
	inc hl			;880e
	inc hl			;880f
	jr L_87D9		;8810
L_8812:
	push hl			;8812
	call L_881C		;8813
	pop hl			;8816
	inc hl			;8817
	inc hl			;8818
	inc hl			;8819
	jr L_87D9		;881a
L_881C:
	push af			;881c
	call L_882E		;881d
	push de			;8820
	pop ix		;8821
	ld a,(hl)			;8823
	inc hl			;8824
	ldi		;8825
	ldi		;8827
	ld (de),a			;8829
	inc de			;882a
	pop af			;882b
	ld (de),a			;882c
	ret			;882d
L_882E:
	ld de,0cc40h		;882e
	ld b,004h		;8831
L_8833:
	ld a,(de)			;8833
	or a			;8834
	ret z			;8835
	inc de			;8836
	inc de			;8837
	inc de			;8838
	inc de			;8839
	djnz L_8833		;883a
	ret			;883c
L_883D:
	call L_886A		;883d
	ld a,(0cc35h)		;8840
	ld hl,0cc50h		;8843
	call 04083h		;8846
	ld a,(hl)			;8849
	or a			;884a
	ret z			;884b
	ld a,(0cc35h)		;884c
	ld hl,0cc40h		;884f
	add a,a			;8852
	add a,a			;8853
	call 04083h		;8854
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
	call L_8A09		;8866
	ret			;8869
L_886A:
	ld hl,0cc40h		;886a
	ld b,004h		;886d
L_886F:
	push bc			;886f
	ld a,(hl)			;8870
	or a			;8871
	push hl			;8872
	call nz,L_887F		;8873
	pop hl			;8876
	ld de,00004h		;8877
	add hl,de			;887a
	pop bc			;887b
	djnz L_886F		;887c
	ret			;887e
L_887F:
	ld d,(hl)			;887f
	inc hl			;8880
	ld e,(hl)			;8881
	inc hl			;8882
	ld a,(hl)			;8883
	cp 002h		;8884
	ret z			;8886
	cp 014h		;8887
	ret z			;8889
	inc hl			;888a
	ld a,(hl)			;888b
	cp 002h		;888c
	jr z,L_88B6		;888e
	ld a,d			;8890
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
	call 04c73h		;88a5
	pop de			;88a8
	pop hl			;88a9
	pop bc			;88aa
	ld a,e			;88ab
	add a,008h		;88ac
	ld e,a			;88ae
	ld a,h			;88af
	add a,010h		;88b0
	ld h,a			;88b2
	djnz L_889D		;88b3
	ret			;88b5
L_88B6:
	ld a,d			;88b6
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
	call 04c73h		;88d5
	pop de			;88d8
	ld b,004h		;88d9
	ld hl,02038h		;88db
L_88DE:
	push bc			;88de
	push hl			;88df
	push de			;88e0
	ld bc,01808h		;88e1
	ld a,048h		;88e4
	call 04c73h		;88e6
	pop de			;88e9
	pop hl			;88ea
	pop bc			;88eb
	ld a,e			;88ec
	add a,008h		;88ed
	ld e,a			;88ef
	ld a,h			;88f0
	add a,018h		;88f1
	ld h,a			;88f3
	djnz L_88DE		;88f4
	ret			;88f6
L_88F7:
	ld a,002h		;88f7
	ld (0cc3dh),a		;88f9
	ld hl,0cc39h		;88fc
	dec (hl)			;88ff
	ret nz			;8900
	jr L_890D		;8901
L_8903:
	ld a,003h		;8903
	ld (0cc3dh),a		;8905
	ld hl,0cc36h		;8908
	dec (hl)			;890b
	ret nz			;890c
L_890D:
	call L_8977		;890d
	ld a,(0cc37h)		;8910
	cp 004h		;8913
	jr c,L_891B		;8915
	xor a			;8917
	ld (0cc37h),a		;8918
L_891B:
	ld (0cc35h),a		;891b
	ld hl,0cc37h		;891e
	inc (hl)			;8921
	ld hl,0cc40h		;8922
	add a,a			;8925
	add a,a			;8926
	call 04083h		;8927
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
	ld a,(0c246h)		;894e
	sub d			;8951
	sub 008h		;8952
	add a,010h		;8954
	cp 020h		;8956
	ret c			;8958
	call 05464h		;8959
	call L_8A30		;895c
	call L_8613		;895f
	jp 054afh		;8962
L_8965:
	ld a,(0cc35h)		;8965
	ld (0cc37h),a		;8968
	ret			;896b
L_896C:
	xor a			;896c
	ld (0cc37h),a		;896d
	ret			;8970
L_8971:
	ld a,080h		;8971
	ld (0cc36h),a		;8973
	ret			;8976
L_8977:
	ld a,(0cc3ch)		;8977
	or a			;897a
	ld a,030h		;897b
	jr z,L_8981		;897d
	ld a,060h		;897f
L_8981:
	ld (hl),a			;8981
	ret			;8982
L_8983:
	ld a,(0c246h)		;8983
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
	call L_89CD		;8990
	push de			;8993
	ld hl,05038h		;8994
	ld bc,01808h		;8997
	ld a,048h		;899a
	call 04c73h		;899c
	pop de			;899f
	ld a,e			;89a0
	add a,008h		;89a1
	ld e,a			;89a3
	ld hl,06838h		;89a4
	ld bc,01808h		;89a7
	ld a,048h		;89aa
	call 04c73h		;89ac
	pop bc			;89af
	pop de			;89b0
	call L_8A30		;89b1
	jr L_89C4		;89b4
L_89B6:
	call L_8B4F		;89b6
	and 001h		;89b9
	ret z			;89bb
	ld hl,020e0h		;89bc
	call L_8983		;89bf
	ld e,020h		;89c2
L_89C4:
	call 05464h		;89c4
	call L_8613		;89c7
	jp 054afh		;89ca
L_89CD:
	call L_8A23		;89cd
	ld bc,01810h		;89d0
	ld a,d			;89d3
	sub 004h		;89d4
	ld d,a			;89d6
	ld a,e			;89d7
	add a,004h		;89d8
	ld e,a			;89da
	push de			;89db
	ld a,040h		;89dc
	call 04c73h		;89de
	pop de			;89e1
	ret			;89e2
L_89E3:
	ld a,(0cc35h)		;89e3
	ld hl,0cc50h		;89e6
	call 04083h		;89e9
	ld a,(hl)			;89ec
	or a			;89ed
	jr nz,L_898C		;89ee
	ld a,(0c246h)		;89f0
	sub d			;89f3
	sub 008h		;89f4
	add a,010h		;89f6
	cp 020h		;89f8
	ret c			;89fa
	ld a,010h		;89fb
	ld (0cc39h),a		;89fd
	ld a,001h		;8a00
	ld (hl),a			;8a02
	ld a,(0cc35h)		;8a03
	ld (0cc37h),a		;8a06
L_8A09:
	call L_89CD		;8a09
	push de			;8a0c
	ld h,080h		;8a0d
	call L_8A19		;8a0f
	pop de			;8a12
	ld a,e			;8a13
	add a,008h		;8a14
	ld e,a			;8a16
	ld h,098h		;8a17
L_8A19:
	ld l,038h		;8a19
	ld bc,01808h		;8a1b
	ld a,048h		;8a1e
	jp 04c73h		;8a20
L_8A23:
	ld a,(0cc35h)		;8a23
	add a,a			;8a26
	add a,a			;8a27
	add a,a			;8a28
	add a,a			;8a29
	add a,090h		;8a2a
	ld h,0b0h		;8a2c
	ld l,a			;8a2e
	ret			;8a2f
L_8A30:
	ld a,d			;8a30
	add a,008h		;8a31
	ld d,a			;8a33
	ld a,e			;8a34
	add a,014h		;8a35
	ld e,a			;8a37
	ret			;8a38
L_8A39:
	call 054a5h		;8a39
	call L_8A42		;8a3c
	jp 05464h		;8a3f
L_8A42:
	ld a,(ix+010h)		;8a42
	ld l,a			;8a45
	ld h,000h		;8a46
	add hl,hl			;8a48
	ld de,0b744h		;8a49
	add hl,de			;8a4c
	ld e,(hl)			;8a4d
	inc hl			;8a4e
	ld d,(hl)			;8a4f
	push ix		;8a50
	pop hl			;8a52
	set 5,l		;8a53
	ld b,(hl)			;8a55
	ld a,b			;8a56
	or a			;8a57
	ret z			;8a58
	inc l			;8a59
	inc l			;8a5a
	ld a,(de)			;8a5b
	cp 080h		;8a5c
	jr nc,L_8A77		;8a5e
L_8A60:
	ld a,(de)			;8a60
	inc de			;8a61
	add a,(ix+003h)		;8a62
	ld (hl),a			;8a65
	inc l			;8a66
	ld a,(de)			;8a67
	add a,(ix+005h)		;8a68
	ld (hl),a			;8a6b
	inc de			;8a6c
	inc l			;8a6d
	ld a,(de)			;8a6e
	ld (hl),a			;8a6f
	inc de			;8a70
	inc l			;8a71
	inc l			;8a72
	inc l			;8a73
	djnz L_8A60		;8a74
	ret			;8a76
L_8A77:
	cp 085h		;8a77
	jr nc,L_8A60		;8a79
	sub 080h		;8a7b
	exx			;8a7d
	ld hl,0b6feh		;8a7e
	call 0543ah		;8a81
	exx			;8a84
L_8A85:
	exx			;8a85
	ld a,(hl)			;8a86
	inc hl			;8a87
	add a,(ix+003h)		;8a88
	exx			;8a8b
	ld (hl),a			;8a8c
	inc l			;8a8d
	exx			;8a8e
	ld a,(hl)			;8a8f
	inc hl			;8a90
	add a,(ix+005h)		;8a91
	exx			;8a94
	ld (hl),a			;8a95
	inc l			;8a96
	inc de			;8a97
	ld a,(de)			;8a98
	ld (hl),a			;8a99
	inc l			;8a9a
	inc l			;8a9b
	inc l			;8a9c
	djnz L_8A85		;8a9d
	ret			;8a9f
L_8AA0:
	ld hl,0c400h		;8aa0
	ld b,008h		;8aa3
L_8AA5:
	push hl			;8aa5
	pop ix		;8aa6
	push bc			;8aa8
	push hl			;8aa9
	ld a,(hl)			;8aaa
	and a			;8aab
	call nz,L_8AB8		;8aac
	pop hl			;8aaf
	pop bc			;8ab0
	ld de,00080h		;8ab1
	add hl,de			;8ab4
	djnz L_8AA5		;8ab5
	ret			;8ab7
L_8AB8:
	set 5,l		;8ab8
	ld b,(hl)			;8aba
	ld a,b			;8abb
	and a			;8abc
	ret z			;8abd
	inc l			;8abe
L_8ABF:
	push bc			;8abf
	ld a,(hl)			;8ac0
	ld b,a			;8ac1
	inc l			;8ac2
	add a,a			;8ac3
	add a,a			;8ac4
	ex af,af'			;8ac5
	ld de,0de28h		;8ac6
	ex af,af'			;8ac9
	add a,e			;8aca
	ld e,a			;8acb
	ld c,0ffh		;8acc
	ldi		;8ace
	ldi		;8ad0
	ldi		;8ad2
	ld a,(ix+001h)		;8ad4
	and 080h		;8ad7
	jr nz,L_8AF0		;8ad9
	ex de,hl			;8adb
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
	ld a,(hl)			;8ae9
	ld b,010h		;8aea
L_8AEC:
	ld (de),a			;8aec
	inc e			;8aed
	djnz L_8AEC		;8aee
L_8AF0:
	pop bc			;8af0
	inc l			;8af1
	djnz L_8ABF		;8af2
	ret			;8af4
L_8AF5:
	push ix		;8af5
	pop de			;8af7
	ld a,e			;8af8
	add a,007h		;8af9
	ld e,a			;8afb
	ldir		;8afc
	ret			;8afe
L_8AFF:
	ld a,008h		;8aff
	jr L_8B0D		;8b01
L_8B03:
	ld a,00ah		;8b03
	jr L_8B0D		;8b05
L_8B07:
	ld a,00dh		;8b07
	jr L_8B0D		;8b09
L_8B0B:
	ld a,00fh		;8b0b
L_8B0D:
	push ix		;8b0d
	pop hl			;8b0f
	call 04083h		;8b10
	ld d,(hl)			;8b13
	dec hl			;8b14
	ld e,(hl)			;8b15
	call L_8B39		;8b16
	ld (hl),e			;8b19
	inc hl			;8b1a
	ld (hl),d			;8b1b
	ret			;8b1c
L_8B1D:
	ld a,(0c244h)		;8b1d
	sub (ix+003h)		;8b20
	ret nc			;8b23
	neg		;8b24
	ret			;8b26
L_8B27:
	ld a,(0c246h)		;8b27
	sub (ix+005h)		;8b2a
	ret nc			;8b2d
	neg		;8b2e
	ret			;8b30
L_8B31:
	ld a,h			;8b31
	cpl			;8b32
	ld h,a			;8b33
	ld a,l			;8b34
	cpl			;8b35
	ld l,a			;8b36
	inc hl			;8b37
	ret			;8b38
L_8B39:
	ld a,d			;8b39
	cpl			;8b3a
	ld d,a			;8b3b
	ld a,e			;8b3c
	cpl			;8b3d
	ld e,a			;8b3e
	inc de			;8b3f
	ret			;8b40
L_8B41:
	ld a,(0c244h)		;8b41
	cp (ix+003h)		;8b44
	ret			;8b47
L_8B48:
	ld a,(0c246h)		;8b48
	cp (ix+005h)		;8b4b
	ret			;8b4e
L_8B4F:
	push hl			;8b4f
	ld a,(0c3a0h)		;8b50
	ld hl,(0c246h)		;8b53
	call 04083h		;8b56
	ld a,(0c3a0h)		;8b59
	add a,(hl)			;8b5c
	ld hl,0c00dh		;8b5d
	add a,(hl)			;8b60
	add a,00bh		;8b61
	ld (0c3a0h),a		;8b63
	pop hl			;8b66
	ret			;8b67
L_8B68:
	bit 0,(ix+017h)		;8b68
	jr z,L_8B70		;8b6c
	inc b			;8b6e
	inc b			;8b6f
L_8B70:
	inc (ix+018h)		;8b70
	ld a,(ix+018h)		;8b73
	and c			;8b76
	jr z,L_8B7A		;8b77
	inc b			;8b79
L_8B7A:
	ld (ix+010h),b		;8b7a
	ret			;8b7d
L_8B7E:
	ld h,000h		;8b7e
L_8B80:
	ld l,000h		;8b80
L_8B82:
	ld (ix+008h),h		;8b82
	ld (ix+007h),l		;8b85
	ret			;8b88
L_8B89:
	ld h,000h		;8b89
L_8B8B:
	ld l,000h		;8b8b
L_8B8D:
	ld (ix+00ah),h		;8b8d
	ld (ix+009h),l		;8b90
	ret			;8b93
L_8B94:
	ld (ix+00fh),h		;8b94
	ld (ix+00eh),l		;8b97
	ret			;8b9a
L_8B9B:
	ld (ix+00dh),h		;8b9b
	ld (ix+00ch),l		;8b9e
	ret			;8ba1
L_8BA2:
	call 0a683h		;8ba2
	ld (ix+00bh),000h		;8ba5
L_8BA9:
	xor a			;8ba9
	ld (ix+00ah),a		;8baa
	ld (ix+009h),a		;8bad
	ld (ix+008h),a		;8bb0
	ld (ix+007h),a		;8bb3
	ret			;8bb6
L_8BB7:
	ld b,004h		;8bb7
L_8BB9:
	ld c,a			;8bb9
	push de			;8bba
	and a			;8bbb
	bit 7,a		;8bbc
	jr z,L_8BDC		;8bbe
	ld a,b			;8bc0
	cp 003h		;8bc1
	jr nc,L_8BC7		;8bc3
	ld e,004h		;8bc5
L_8BC7:
	bit 0,b		;8bc7
	jr z,L_8BCD		;8bc9
	ld d,000h		;8bcb
L_8BCD:
	ld a,(ix+003h)		;8bcd
	add a,e			;8bd0
	ld e,a			;8bd1
	ld a,(ix+005h)		;8bd2
	add a,d			;8bd5
	ld d,a			;8bd6
	push bc			;8bd7
	call 0704ch		;8bd8
	pop bc			;8bdb
L_8BDC:
	pop de			;8bdc
	ld a,c			;8bdd
	rla			;8bde
	djnz L_8BB9		;8bdf
	and 00fh		;8be1
	ld (ix+016h),a		;8be3
	ret			;8be6
L_8BE7:
	bit 0,(ix+017h)		;8be7
	jr z,L_8BF5		;8beb
	bit 7,(ix+00ah)		;8bed
	ret nz			;8bf1
	jp L_8B03		;8bf2
L_8BF5:
	bit 7,(ix+00ah)		;8bf5
	ret z			;8bf9
	jp L_8B03		;8bfa
L_8BFD:
	ld a,(ix+00ah)		;8bfd
	and a			;8c00
	ret z			;8c01
	bit 7,(ix+00ah)		;8c02
	ld a,000h		;8c06
	jr z,L_8C0B		;8c08
	inc a			;8c0a
L_8C0B:
	ld (ix+017h),a		;8c0b
	ret			;8c0e
L_8C0F:
	ld (ix+010h),h		;8c0f
	ld (ix+011h),l		;8c12
	ret			;8c15
L_8C16:
	ld a,(0c240h)		;8c16
	or a			;8c19
	ld a,(0c2b6h)		;8c1a
	ret z			;8c1d
	ld a,(0c2d6h)		;8c1e
	ret			;8c21
L_8C22:
	ld d,(ix+005h)		;8c22
	ld e,(ix+003h)		;8c25
	push ix		;8c28
	call L_8613		;8c2a
	pop ix		;8c2d
	ret			;8c2f
L_8C30:
	ld c,024h		;8c30
	jp L_8C22		;8c32
L_8C35:
	ld (ix+013h),001h		;8c35
	ld (ix+010h),064h		;8c39
	ld a,040h		;8c3d
	jr L_8C47		;8c3f
L_8C41:
	ld (ix+010h),088h		;8c41
	ld a,050h		;8c45
L_8C47:
	ld (ix+00bh),000h		;8c47
	call L_84E0		;8c4b
	call L_8B82		;8c4e
	ex de,hl			;8c51
	jp L_8B8D		;8c52
L_8C55:
	ret			;8c55
L_8C56:
	ld (0c3afh),a		;8c56
	ld c,025h		;8c59
	jp L_8C22		;8c5b
L_8C5E:
	ld a,(0c3afh)		;8c5e
	ld (ix+00ah),a		;8c61
	xor a			;8c64
	ld (ix+008h),a		;8c65
	ld (ix+00bh),a		;8c68
	ld (ix+010h),088h		;8c6b
	ret			;8c6f
L_8C70:
	ld hl,00084h		;8c70
	ld de,000a4h		;8c73
	ld bc,01020h		;8c76
	xor a			;8c79
	call 04bdeh		;8c7a
	ld a,(0c310h)		;8c7d
	cp 003h		;8c80
	ret c			;8c82
	push af			;8c83
	ld hl,07094h		;8c84
	ld bc,02010h		;8c87
	call 05e2fh		;8c8a
	pop af			;8c8d
	push af			;8c8e
	sub 005h		;8c8f
	cp 002h		;8c91
	call c,L_8CCA		;8c93
	pop af			;8c96
	cp 006h		;8c97
	call nc,L_8CAD		;8c99
	ld a,(0c21ch)		;8c9c
	and a			;8c9f
	ret z			;8ca0
	ld hl,0f0a4h		;8ca1
	ld bc,01020h		;8ca4
	call 05e2fh		;8ca7
	jp L_8E90		;8caa
L_8CAD:
	call L_8D8A		;8cad
	ld hl,08078h		;8cb0
	ld de,0c094h		;8cb3
	ld bc,01010h		;8cb6
	ld a,005h		;8cb9
	call 04bdeh		;8cbb
	ld hl,08078h		;8cbe
	ld de,07868h		;8cc1
	ld bc,01010h		;8cc4
	jp 04841h		;8cc7
L_8CCA:
	ld de,04834h		;8cca
	ld bc,07070h		;8ccd
	ld hl,09060h		;8cd0
	jp 04841h		;8cd3
L_8CD6:
	ld a,010h		;8cd6
	ld (0c314h),a		;8cd8
	xor a			;8cdb
	ld (0c312h),a		;8cdc
	ld (0c310h),a		;8cdf
	ld a,(0c20ah)		;8ce2
	or a			;8ce5
	ret z			;8ce6
	call 05a87h		;8ce7
	call L_8F53		;8cea
	ld hl,000a4h		;8ced
	ld bc,01020h		;8cf0
	jp 05e2fh		;8cf3
L_8CF6:
	ld a,(0c20ah)		;8cf6
	or a			;8cf9
	ret z			;8cfa
	ld a,(0c310h)		;8cfb
	call 0408dh		;8cfe

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
	ld hl,0c314h		;8d17
	dec (hl)			;8d1a
	ld a,010h		;8d1b
	sub (hl)			;8d1d
	ld b,a			;8d1e
	ld c,020h		;8d1f
	ld h,(hl)			;8d21
	ld l,084h		;8d22
	ld de,000a4h		;8d24
	xor a			;8d27
	call 04c73h		;8d28
	ld a,(0c314h)		;8d2b
	or a			;8d2e
	ret nz			;8d2f
	jr L_8D37		;8d30
L_8D32:
	ld a,024h		;8d32
	call 056e3h		;8d34
L_8D37:
	ld hl,0c310h		;8d37
	inc (hl)			;8d3a
L_8D3B:
	ret			;8d3b
L_8D3C:
	ld a,(0c314h)		;8d3c
	cp 00fh		;8d3f
	ld l,0a2h		;8d41
	jr z,L_8D5E		;8d43
	ld b,a			;8d45
	ld a,00fh		;8d46
	sub b			;8d48
	ld b,a			;8d49
	ld hl,070a2h		;8d4a
L_8D4D:
	push bc			;8d4d
	ld d,h			;8d4e
	ld e,l			;8d4f
	inc e			;8d50
	ld bc,02001h		;8d51
	xor a			;8d54
	push hl			;8d55
	call 04bdeh		;8d56
	pop hl			;8d59
	dec l			;8d5a
	pop bc			;8d5b
	djnz L_8D4D		;8d5c
L_8D5E:
	inc l			;8d5e
	ld e,l			;8d5f
	ld d,070h		;8d60
	ld h,050h		;8d62
	ld bc,02001h		;8d64
	xor a			;8d67
	call 04bdeh		;8d68
	ld hl,0c314h		;8d6b
	ld a,(hl)			;8d6e
	cp 00fh		;8d6f
	jr z,L_8D75		;8d71
	inc (hl)			;8d73
	ret			;8d74
L_8D75:
	ld a,087h		;8d75
	call 056e3h		;8d77
	call L_8EB7		;8d7a
	jr L_8D37		;8d7d
L_8D7F:
	call L_8ED6		;8d7f
	ret nc			;8d82
	ld a,040h		;8d83
	ld (0c314h),a		;8d85
	jr L_8D37		;8d88
L_8D8A:
	ld hl,06098h		;8d8a
	ld de,0784ch		;8d8d
	ld bc,01018h		;8d90
	ld a,001h		;8d93
	jp 04bdeh		;8d95
L_8D98:
	call L_8E11		;8d98
	ld hl,0c314h		;8d9b
	dec (hl)			;8d9e
	ret nz			;8d9f
	call L_8CAD		;8da0
	call L_8DB9		;8da3
	call L_8D37		;8da6
	ld a,(0c21dh)		;8da9
	ld hl,08dd6h		;8dac
	call 04083h		;8daf
	ld c,(hl)			;8db2
	ld de,01010h		;8db3
	jp L_8613		;8db6
L_8DB9:
	xor a			;8db9
	ld (0c313h),a		;8dba
	ld a,(0c21dh)		;8dbd
	inc a			;8dc0
	ld b,a			;8dc1
L_8DC2:
	ld c,019h		;8dc2
	ld de,08078h		;8dc4
	push bc			;8dc7
	call L_8613		;8dc8
	pop bc			;8dcb
	ld a,(0c313h)		;8dcc
	inc a			;8dcf
	ld (0c313h),a		;8dd0
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


L_8DDC:
	ld a,(0c24bh)		;8ddc
	cp 004h		;8ddf
	ret z			;8de1
	ld hl,0c400h		;8de2
	ld de,00080h		;8de5
	ld b,008h		;8de8
L_8DEA:
	ld a,019h		;8dea
	cp (hl)			;8dec
	ret z			;8ded
	add hl,de			;8dee
	djnz L_8DEA		;8def
	ld a,001h		;8df1
	ld (0c21ch),a		;8df3
	ld a,042h		;8df6
	jp 056e3h		;8df8
L_8DFB:
	call L_8DDC		;8dfb
	call L_8E11		;8dfe
	ld a,(0c21ch)		;8e01
	and a			;8e04
	ret z			;8e05
	call L_8E2E		;8e06
	call L_8D37		;8e09
	ld a,042h		;8e0c
	jp 056e3h		;8e0e
L_8E11:
	ld a,(0c00dh)		;8e11
	and 00ch		;8e14
	srl a		;8e16
	ld hl,08e26h		;8e18
	call 04083h		;8e1b
	ld d,(hl)			;8e1e
	inc hl			;8e1f
	ld e,(hl)			;8e20
	ld a,00ch		;8e21
	jp 04a73h		;8e23

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


L_8E2E:
	ld ix,0c400h		;8e2e
	ld b,008h		;8e32
L_8E34:
	push bc			;8e34
	ld a,(ix+000h)		;8e35
	or a			;8e38
	call nz,L_83D6		;8e39
	pop bc			;8e3c
	ld de,00080h		;8e3d
	add ix,de		;8e40
	djnz L_8E34		;8e42
	ret			;8e44
L_8E45:
	call 07901h		;8e45
	ld a,024h		;8e48
	call 056e3h		;8e4a
	ld hl,0f0a4h		;8e4d
	call 06194h		;8e50
	call L_8E90		;8e53
	jp L_8D37		;8e56
L_8E59:
	ld a,(0c24bh)		;8e59
	or a			;8e5c
	jr z,L_8E64		;8e5d
	cp 002h		;8e5f
	jr z,L_8E64		;8e61
	ret			;8e63
L_8E64:
	ld a,(0c270h)		;8e64
	ld b,a			;8e67
	ld a,(0c211h)		;8e68
	cp b			;8e6b
	jr z,L_8E77		;8e6c
	call 06811h		;8e6e
	ld hl,0c310h		;8e71
	inc (hl)			;8e74
	inc (hl)			;8e75
	ret			;8e76
L_8E77:
	ld a,001h		;8e77
	ld (0c271h),a		;8e79
	call 054b4h		;8e7c
	call 0bc30h		;8e7f
	call 05464h		;8e82
	ld c,01ah		;8e85
	ld de,08030h		;8e87
	call L_8613		;8e8a
	jp L_8D37		;8e8d
L_8E90:
	ld hl,0d45eh		;8e90
	ld b,004h		;8e93
L_8E95:
	xor a			;8e95
	ld (hl),a			;8e96
	inc l			;8e97
	ld (hl),a			;8e98
	ld a,01fh		;8e99
	call 04083h		;8e9b
	djnz L_8E95		;8e9e
	ld ix,0c400h		;8ea0
	ld b,008h		;8ea4
L_8EA6:
	ld a,(ix+000h)		;8ea6
	or a			;8ea9
	push bc			;8eaa
	call nz,L_83D6		;8eab
	pop bc			;8eae
	ld de,00080h		;8eaf
	add ix,de		;8eb2
	djnz L_8EA6		;8eb4
	ret			;8eb6
L_8EB7:
	ld hl,08ed2h		;8eb7
	ld de,0c888h		;8eba
	ldi		;8ebd
	ldi		;8ebf
	ldi		;8ec1
	ldi		;8ec3
	ld a,001h		;8ec5
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


L_8ED6:
	call L_8F06		;8ed6
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
	call 04841h		;8efa
	ld hl,0c88ch		;8efd
	inc (hl)			;8f00
	ld a,(0c88ah)		;8f01
	cp (hl)			;8f04
	ret			;8f05
L_8F06:
	ld hl,0c88eh		;8f06
	dec (hl)			;8f09
	ld a,(hl)			;8f0a
	rra			;8f0b
	ld b,00fh		;8f0c
	jr c,L_8F11		;8f0e
	dec b			;8f10
L_8F11:
	ld c,007h		;8f11
	jp 00047h		;8f13   ; BIOS WRTVDP - Writes data in the VDP-register
L_8F16:
	xor a			;8f16
	ld (0c316h),a		;8f17
	call 054a5h		;8f1a
	ld a,(0c211h)		;8f1d
	dec a			;8f20
	ld hl,0be8eh		;8f21
	call 04083h		;8f24
	ld b,(hl)			;8f27
	call 05464h		;8f28
	ld a,(0c212h)		;8f2b
	cp b			;8f2e
	jp nz,05a56h		;8f2f
	call L_8F6D		;8f32
	xor a			;8f35
	ld (0c310h),a		;8f36
	ld (0c314h),a		;8f39
	ld (0c21ch),a		;8f3c
	inc a			;8f3f
	ld (0c316h),a		;8f40
	call 05a56h		;8f43
	ld a,027h		;8f46
	call 055f0h		;8f48
	ld a,030h		;8f4b
	call 055f0h		;8f4d
	call L_9049		;8f50
L_8F53:
	ld a,(0c2b0h)		;8f53
	ld b,a			;8f56
	ld a,(0c2d0h)		;8f57
	or b			;8f5a
	ret z			;8f5b
	ld a,(0c211h)		;8f5c
	ld b,a			;8f5f
	ld a,(0c270h)		;8f60
	cp b			;8f63
	ret nz			;8f64
	ld c,023h		;8f65
	ld de,08034h		;8f67
	jp L_8613		;8f6a
L_8F6D:
	call 054aah		;8f6d
	ld a,(0c211h)		;8f70
	dec a			;8f73
	add a,a			;8f74
	add a,a			;8f75
	ld hl,0b4d2h		;8f76
	call 04083h		;8f79
	ld de,0d500h		;8f7c
	ld bc,00004h		;8f7f
	ldir		;8f82
	ld hl,0d500h		;8f84
	ld b,002h		;8f87
L_8F89:
	ld a,(hl)			;8f89
	add a,004h		;8f8a
	ld (hl),a			;8f8c
	inc hl			;8f8d
	inc hl			;8f8e
	djnz L_8F89		;8f8f
	jp 05464h		;8f91
L_8F94:
	ld a,001h		;8f94
	push af			;8f96
	ld a,004h		;8f97
	add a,e			;8f99
	ld e,a			;8f9a
	call 07176h		;8f9b
	pop af			;8f9e
	ld b,006h		;8f9f
L_8FA1:
	ld (hl),a			;8fa1
	inc hl			;8fa2
	ld (hl),a			;8fa3
	ld de,0001fh		;8fa4
	add hl,de			;8fa7
	djnz L_8FA1		;8fa8
	ret			;8faa
L_8FAB:
	ld a,(0c316h)		;8fab
	or a			;8fae
	ret z			;8faf
	ld a,(0c24bh)		;8fb0
	cp 004h		;8fb3
	ret z			;8fb5
	call L_9098		;8fb6
	ld a,(0c310h)		;8fb9
	call 0408dh		;8fbc

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
	ld hl,0c310h		;8fd0
	inc (hl)			;8fd3
L_8FD4:
	ret			;8fd4
L_8FD5:
	ld hl,0c310h		;8fd5
	inc (hl)			;8fd8
	call 054afh		;8fd9
	ld a,(0c31bh)		;8fdc
	call L_827F		;8fdf
	call 05464h		;8fe2
	ld c,022h		;8fe5
	ld a,(0c319h)		;8fe7
	ld d,a			;8fea
	ld e,020h		;8feb
	push ix		;8fed
	call L_8613		;8fef
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
	call 04a9dh		;8fff
	call L_9012		;9002
	ld hl,0c31dh		;9005
	inc (hl)			;9008
	ld a,(hl)			;9009
	cp 016h		;900a
	ret nz			;900c
	ld hl,0c310h		;900d
	inc (hl)			;9010
	ret			;9011
L_9012:
	ld a,(0c246h)		;9012
	sub 010h		;9015
	ld d,a			;9017
	ld a,(0c31dh)		;9018
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
	ld a,(hl)			;9029
	inc hl			;902a
	call 04dceh		;902b
	ld a,d			;902e
	add a,008h		;902f
	ld d,a			;9031
	djnz L_9029		;9032
	pop de			;9034
	ld a,e			;9035
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


L_9049:
	ld a,(0c211h)		;9049
	dec a			;904c
	ld a,a			;904d
	ld b,a			;904e
	add a,a			;904f
	add a,b			;9050
	push af			;9051
	call 054afh		;9052
	pop af			;9055
	ld hl,0bed3h		;9056
	call 04083h		;9059
	ld de,0c319h		;905c
	ld bc,00003h		;905f
	ldir		;9062
	jp 05464h		;9064
L_9067:
	ld hl,0c244h		;9067
	ld a,(hl)			;906a
	sub 002h		;906b
	ld (hl),a			;906d
	ld a,(hl)			;906e
	cp 020h		;906f
	ret nc			;9071
	ld a,(0c270h)		;9072
	ld b,a			;9075
	ld a,(0c211h)		;9076
	cp b			;9079
	ld a,003h		;907a
	jr z,L_9088		;907c
	ld a,(0c240h)		;907e
	or a			;9081
	ld a,001h		;9082
	jr z,L_9088		;9084
	ld a,002h		;9086
L_9088:
	ld (0c31ch),a		;9088
	ld a,001h		;908b
	ld (0c216h),a		;908d
	xor a			;9090
	ld (0c316h),a		;9091
	ld (0c271h),a		;9094
	ret			;9097
L_9098:
	ld a,(0c314h)		;9098
	or a			;909b
	ret z			;909c
	ld hl,0c314h		;909d
	dec (hl)			;90a0
	ld a,088h		;90a1
	call z,056e3h		;90a3
	ld a,030h		;90a6
	sub (hl)			;90a8
	ld b,010h		;90a9
	ld c,a			;90ab
	ld a,(hl)			;90ac
	ld hl,(0d500h)		;90ad
	add a,l			;90b0
	ld l,a			;90b1
	ld de,(0d502h)		;90b2
	xor a			;90b6
	jp 04c73h		;90b7
L_90BA:
	ld a,030h		;90ba
	ld (0c314h),a		;90bc
	ld de,(0d502h)		;90bf
	ld a,001h		;90c3
	jp L_8F94		;90c5
L_90C8:
	ld a,(0c316h)		;90c8
	or a			;90cb
	ret z			;90cc
	ld a,(0c314h)		;90cd
	or a			;90d0
	jr nz,L_9098		;90d1
	ld a,(0c310h)		;90d3
	cp 002h		;90d6
	ret c			;90d8
	ld hl,(0d500h)		;90d9
	ld de,(0d502h)		;90dc
	ld bc,01030h		;90e0
	xor a			;90e3
	call 04c73h		;90e4
	ld de,(0d502h)		;90e7
	ld a,001h		;90eb
	jp L_8F94		;90ed
L_90F0:
	call 054aah		;90f0
	call L_9120		;90f3
	jp 05464h		;90f6
L_90F9:
	ld de,0787ch		;90f9
	ld hl,01078h		;90fc
	ld bc,01008h		;90ff
	call 04841h		;9102
	ld b,006h		;9105
	jr L_9112		;9107
L_9109:
	ld a,(0c21dh)		;9109
	cp 002h		;910c
	jr z,L_90F9		;910e
	ld b,007h		;9110
L_9112:
	ld c,02ah		;9112
	ld de,08094h		;9114
	call 05464h		;9117
	call L_8615		;911a
	jp 054aah		;911d
L_9120:
	ld a,(0c20ah)		;9120
	or a			;9123
	jr nz,L_9109		;9124
	ld a,(0c211h)		;9126
	dec a			;9129
	ld hl,0b8bbh		;912a
	call 0543ah		;912d
	ld a,h			;9130
	or l			;9131
	ret z			;9132
	ld b,080h		;9133
L_9135:
	ld a,(0c212h)		;9135
	cp (hl)			;9138
	push hl			;9139
	call z,L_9148		;913a
	pop hl			;913d
	ld a,(hl)			;913e
	cp 0ffh		;913f
	ret z			;9141
	inc hl			;9142
	inc hl			;9143
	inc hl			;9144
	djnz L_9135		;9145
	ret			;9147
L_9148:
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
	call L_916C		;915e
	pop bc			;9161
	ret c			;9162
	call 05464h		;9163
	call L_8615		;9166
	jp 054aah		;9169
L_916C:
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
	ld a,(0c212h)		;917c
	cp (hl)			;917f
	jr nz,L_9187		;9180
	inc hl			;9182
	ld a,(0c211h)		;9183
	cp (hl)			;9186
L_9187:
	pop hl			;9187
	jr z,L_9193		;9188
	ld a,004h		;918a
	call 04083h		;918c
	djnz L_9171		;918f
	or a			;9191
	ret			;9192
L_9193:
	scf			;9193
	ret			;9194
L_9195:
	ld hl,0b12bh		;9195
	ld a,(0c211h)		;9198
	dec a			;919b
	call 0543ah		;919c
	ld a,l			;919f
	or h			;91a0
	scf			;91a1
	ret z			;91a2
	call L_91BE		;91a3
	ret c			;91a6
	ld a,(0cc37h)		;91a7
	add a,a			;91aa
	add a,a			;91ab
	call 04083h		;91ac
	ld a,(0c212h)		;91af
	cp (hl)			;91b2
	jr nz,L_91CE		;91b3
	push hl			;91b5
	inc hl			;91b6
	ld a,(hl)			;91b7
	call L_91D2		;91b8
	pop hl			;91bb
	or a			;91bc
	ret			;91bd
L_91BE:
	ld a,(hl)			;91be
	cp 0ffh		;91bf
	scf			;91c1
	ret z			;91c2
	ld a,(0c212h)		;91c3
	cp (hl)			;91c6
	ret z			;91c7
	inc hl			;91c8
	inc hl			;91c9
	inc hl			;91ca
	inc hl			;91cb
	jr L_91BE		;91cc
L_91CE:
	ld a,0ffh		;91ce
	or a			;91d0
	ret			;91d1
L_91D2:
	dec a			;91d2
	ld hl,0b70dh		;91d3
	call 04083h		;91d6
	ld a,(hl)			;91d9
	ret			;91da
L_91DB:
	ld (ix+006h),000h		;91db
	ld (ix+013h),002h		;91df
	call L_921D		;91e3
	ld a,(ix+003h)		;91e6
	add a,010h		;91e9
	ld (ix+003h),a		;91eb
	ld hl,0ae2dh		;91ee
	call 05596h		;91f1
	ld (ix+011h),010h		;91f4
	call L_8B48		;91f8
	ld c,000h		;91fb
	jr nc,L_9200		;91fd
	inc c			;91ff
L_9200:
	call L_9210		;9200
	ld a,d			;9203
	xor c			;9204
	ret z			;9205
	inc (ix+017h)		;9206
	ld (ix+010h),00bh		;9209
	jp L_8B03		;920d
L_9210:
	call L_8C16		;9210
	ld d,000h		;9213
	cp 001h		;9215
	ret z			;9217
	cp 002h		;9218
	ret z			;921a
	inc d			;921b
	ret			;921c
L_921D:
	ld a,02fh		;921d
	ld de,00000h		;921f
L_9222:
	push ix		;9222
	pop hl			;9224
	call 04083h		;9225
	ld (hl),d			;9228
	ld a,005h		;9229
	call 04083h		;922b
	ld (hl),e			;922e
	ret			;922f
L_9230:
	call L_92DF		;9230
	ld a,(ix+001h)		;9233
	and 07fh		;9236
	call 0408dh		;9238

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
	inc (ix+001h)		;9243
	ret			;9246
L_9247:
	ld de,00748h		;9247
L_924A:
	ld (ix+001h),081h		;924a
	ld a,(0c00dh)		;924e
	and 001h		;9251
	ret nz			;9253
	push de			;9254
	ld a,02bh		;9255
	call L_9278		;9257
	pop de			;925a
	dec (ix+011h)		;925b
	ret nz			;925e
	ld (ix+006h),001h		;925f
	ld (ix+013h),003h		;9263
	inc (ix+001h)		;9267
	ld a,02fh		;926a
	call L_9222		;926c
	ld a,(ix+001h)		;926f
	and 07fh		;9272
	ld (ix+001h),a		;9274
	ret			;9277
L_9278:
	push af			;9278
	ld a,011h		;9279
	ld b,(ix+011h)		;927b
	sub b			;927e
	ld b,a			;927f
	pop af			;9280
	push de			;9281
	push ix		;9282
	pop hl			;9284
	call 04083h		;9285
	ld a,(hl)			;9288
	ld l,a			;9289
	ld h,000h		;928a
	add hl,hl			;928c
	add hl,hl			;928d
	add hl,hl			;928e
	add hl,hl			;928f
	ld de,0dca0h		;9290
	add hl,de			;9293
	pop de			;9294
	dec (ix+003h)		;9295
L_9298:
	ld (hl),d			;9298
	push hl			;9299
	ld a,010h		;929a
	call 04083h		;929c
	ld (hl),e			;929f
	pop hl			;92a0
	inc hl			;92a1
	djnz L_9298		;92a2
	ret			;92a4
L_92A5:
	call L_9CC8		;92a5
	jr nz,L_92BA		;92a8
	call L_9D05		;92aa
	ret nz			;92ad
	inc (ix+001h)		;92ae
	ld hl,092c0h		;92b1
	ld bc,00004h		;92b4
	jp L_8AF5		;92b7
L_92BA:
	call L_8B03		;92ba
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
	call L_9CE7		;92c8
	ret z			;92cb
	dec (ix+001h)		;92cc
	call L_8B7E		;92cf
	ld h,001h		;92d2
	call L_8B8B		;92d4
	bit 0,(ix+017h)		;92d7
	ret z			;92db
	jp L_8B03		;92dc
L_92DF:
	ld b,008h		;92df
	ld a,(ix+017h)		;92e1
	or a			;92e4
	jr z,L_92E9		;92e5
	ld b,00bh		;92e7
L_92E9:
	ld a,(0c00dh)		;92e9
	and 007h		;92ec
	ret z			;92ee
	ld a,(0c00dh)		;92ef
	and 018h		;92f2
	srl a		;92f4
	srl a		;92f6
	srl a		;92f8
	cp 003h		;92fa
	jr nz,L_9300		;92fc
	ld a,001h		;92fe
L_9300:
	add a,b			;9300
	ld (ix+010h),a		;9301
	ret			;9304
L_9305:
	ld (ix+010h),02fh		;9305
	ld (ix+01fh),004h		;9309
	ld (ix+011h),010h		;930d
	ld (ix+01eh),040h		;9311
	ret			;9315
L_9316:
	call L_93D7		;9316
	ld a,(ix+001h)		;9319
	and a			;931c
	jr nz,$+94		;931d
	dec (ix+011h)		;931f
	ret nz			;9322
	ld (ix+011h),008h		;9323
	inc (ix+001h)		;9327
	call L_8B4F		;932a
	and 004h		;932d
	ld b,001h		;932f
	jr z,L_9335		;9331
	ld b,0ffh		;9333
L_9335:
	ld a,(ix+01fh)		;9335
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
	call 04088h		;934f
	ld a,(de)			;9352
	inc de			;9353
	ld h,a			;9354
	call L_8B8B		;9355
	ld a,(de)			;9358
	inc de			;9359
	ld h,a			;935a
	call L_8B80		;935b
	ld a,(de)			;935e
	ld (ix+010h),a		;935f
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
	call L_93AA		;937b
	call L_9390		;937e
	dec (ix+011h)		;9381
	ret nz			;9384
	dec (ix+001h)		;9385
	call L_8BA9		;9388
	ld (ix+011h),008h		;938b
	ret			;938f
L_9390:
	ld a,(ix+01fh)		;9390
	ld b,a			;9393
	add a,a			;9394
	add a,b			;9395
	ld de,09365h		;9396
	call 04088h		;9399
	ld a,(de)			;939c
	ld b,a			;939d
	ld a,(0c00dh)		;939e
	and 002h		;93a1
	jr z,L_93A6		;93a3
	inc b			;93a5
L_93A6:
	ld (ix+010h),b		;93a6
	ret			;93a9
L_93AA:
	ld a,(ix+01fh)		;93aa
	ld hl,093c7h		;93ad
	call 0543ah		;93b0
	ex de,hl			;93b3
	ld a,080h		;93b4
	call L_8BB7		;93b6
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


L_93D7:
	dec (ix+01eh)		;93d7
	ret nz			;93da
	ld (ix+01eh),0a0h		;93db
	jp L_8C30		;93df
L_93E2:
	ld (ix+006h),000h		;93e2
	ld (ix+013h),002h		;93e6
	call L_921D		;93ea
	ld a,(ix+003h)		;93ed
	add a,010h		;93f0
	ld (ix+003h),a		;93f2
	ld h,0fch		;93f5
	call L_8B80		;93f7
	call L_8B89		;93fa
L_93FD:
	ld (ix+011h),010h		;93fd
	call L_8B48		;9401
	ld a,023h		;9404
	jr c,L_940A		;9406
	ld a,022h		;9408
L_940A:
	ld (ix+010h),a		;940a
	ret			;940d
L_940E:
	ld a,(ix+001h)		;940e
	and 07fh		;9411
	call 0408dh		;9413

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
	ld a,(ix+003h)		;942a
	cp 034h		;942d
	jr c,L_943E		;942f
	call L_8B41		;9431
	ret c			;9434
	ld a,(0c244h)		;9435
	sub 030h		;9438
	cp (ix+003h)		;943a
	ret c			;943d
L_943E:
	call L_8B7E		;943e
	ld (ix+011h),010h		;9441
	inc (ix+001h)		;9445
L_9448:
	ret			;9448
L_9449:
	dec (ix+011h)		;9449
	ret nz			;944c
	call L_93FD		;944d
	inc (ix+001h)		;9450
	ld hl,00020h		;9453
	call L_8B48		;9456
	call c,L_8B31		;9459
	call L_8B94		;945c
	ld (ix+00bh),001h		;945f
	jp L_8B89		;9463
L_9466:
	ld a,(ix+00ah)		;9466
	and 080h		;9469
	ld b,000h		;946b
	jr nz,L_9471		;946d
	ld b,001h		;946f
L_9471:
	call L_8B48		;9471
	ld a,000h		;9474
	jr nc,L_947A		;9476
	ld a,001h		;9478
L_947A:
	xor b			;947a
	ret nz			;947b
	ld h,(ix+00ah)		;947c
	ld l,(ix+009h)		;947f
	ld a,h			;9482
	and 080h		;9483
	call nz,L_8B31		;9485
	call L_8B82		;9488
	call L_8B89		;948b
	ld h,000h		;948e
	ld l,h			;9490
	call L_8B94		;9491
	ld l,080h		;9494
	call L_8B9B		;9496
	inc (ix+001h)		;9499
	ret			;949c
L_949D:
	ld a,(ix+008h)		;949d
	cp 006h		;94a0
	ret c			;94a2
	ld h,006h		;94a3
	jp L_8B80		;94a5
L_94A8:
	ld (ix+01eh),010h		;94a8
	ld (ix+01dh),001h		;94ac
	ld hl,0ae38h		;94b0
	jp 05596h		;94b3
L_94B6:
	ld a,(ix+001h)		;94b6
	and a			;94b9
	jr nz,L_950D		;94ba
L_94BC:
	dec (ix+01eh)		;94bc
	jr z,L_94E6		;94bf
	ld (ix+006h),001h		;94c1
	dec (ix+011h)		;94c5
	ret nz			;94c8
	ld a,(ix+01dh)		;94c9
	ld hl,0ae38h		;94cc
	call 0a396h		;94cf
	ld b,01dh		;94d2
	call L_952B		;94d4
	ld a,(ix+01dh)		;94d7
	inc a			;94da
	cp 004h		;94db
	ld (ix+01dh),a		;94dd
	ret nz			;94e0
	ld (ix+01dh),000h		;94e1
	ret			;94e5
L_94E6:
	call L_8C16		;94e6
	ld c,004h		;94e9
	or a			;94eb
	jr z,L_94F6		;94ec
	sla c		;94ee
	cp 002h		;94f0
	jr z,L_94F6		;94f2
	sla c		;94f4
L_94F6:
	ld (ix+01eh),c		;94f6
	inc (ix+001h)		;94f9
	ld a,(ix+00bh)		;94fc
	ld (ix+01ch),a		;94ff
	xor a			;9502
	ld (ix+006h),a		;9503
	ld (ix+00bh),a		;9506
	ld b,01eh		;9509
	jr L_952B		;950b
L_950D:
	dec (ix+01eh)		;950d
	ret nz			;9510
	ld b,01dh		;9511
	call L_952B		;9513
	dec (ix+001h)		;9516
	ld (ix+01eh),010h		;9519
	ld c,02bh		;951d
	call L_8C22		;951f
	ld a,(ix+01ch)		;9522
	ld (ix+00bh),a		;9525
	jp L_94BC		;9528
L_952B:
	call L_8B48		;952b
	jr nc,L_9532		;952e
	inc b			;9530
	inc b			;9531
L_9532:
	ld (ix+010h),b		;9532
	ret			;9535
L_9536:
	ld (ix+01fh),040h		;9536
	ld hl,0ae64h		;953a
	jp 05596h		;953d
L_9540:
	call L_95B8		;9540
	call L_95CC		;9543
	ld a,(ix+001h)		;9546
	call 0408dh		;9549

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
	inc (ix+001h)		;9554
	ld a,r		;9557
	ld b,a			;9559
	ld a,(0c00dh)		;955a
	xor b			;955d
	ld b,a			;955e
	and 01fh		;955f
	add a,010h		;9561
	ld (ix+011h),a		;9563
	push bc			;9566
	ld hl,00080h		;9567
	call L_8B8D		;956a
	call L_8B48		;956d
	jr nc,L_9575		;9570
	call L_8B03		;9572
L_9575:
	call L_8C16		;9575
	pop bc			;9578
	cp 003h		;9579
	jp z,L_8B03		;957b
	cp 001h		;957e
	ret nz			;9580
	ld a,b			;9581
	and 020h		;9582
	jp z,L_8B03		;9584
	ret			;9587
L_9588:
	ld e,0e4h		;9588
	call L_9D07		;958a
	jr z,L_95A5		;958d
	call L_9CC8		;958f
	jr nz,L_95A5		;9592
	ld a,(ix+005h)		;9594
	add a,030h		;9597
	cp 060h		;9599
	jr c,L_95A5		;959b
	dec (ix+011h)		;959d
	ret nz			;95a0
	dec (ix+001h)		;95a1
	ret			;95a4
L_95A5:
	inc (ix+001h)		;95a5
	ld (ix+011h),010h		;95a8
	jp L_8B03		;95ac
L_95AF:
	dec (ix+011h)		;95af
	ret nz			;95b2
	ld (ix+001h),000h		;95b3
L_95B7:
	ret			;95b7
L_95B8:
	ld a,(0c00dh)		;95b8
	and 00fh		;95bb
	ret nz			;95bd
	ld c,037h		;95be
	ld a,(0c00dh)		;95c0
	and 010h		;95c3
	jr z,L_95C8		;95c5
	inc c			;95c7
L_95C8:
	ld (ix+010h),c		;95c8
	ret			;95cb
L_95CC:
	dec (ix+01fh)		;95cc
	ret nz			;95cf
	ld (ix+01fh),040h		;95d0
	ld d,(ix+005h)		;95d4
	ld a,(ix+003h)		;95d7
	add a,010h		;95da
	ld e,a			;95dc
	ld c,016h		;95dd
	push ix		;95df
	call L_8613		;95e1
	pop ix		;95e4
	ret			;95e6
L_95E7:
	ld hl,0ae6fh		;95e7
	jp 05596h		;95ea
L_95ED:
	ld b,(ix+001h)		;95ed
	djnz L_95F9		;95f0
	dec (ix+011h)		;95f2
	ret nz			;95f5
	jp L_83D6		;95f6
L_95F9:
	call L_95FF		;95f9
	jp 0a690h		;95fc
L_95FF:
	ld e,000h		;95ff
	ld d,004h		;9601
	call L_9CE7		;9603
	ret z			;9606
	ld (ix+006h),000h		;9607
	inc (ix+001h)		;960b
	inc (ix+010h)		;960e
	ret			;9611
L_9612:
	ld hl,03904h		;9612
	jp L_8C0F		;9615
L_9618:
	ld a,(ix+001h)		;9618
	call 0408dh		;961b

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
	dec (ix+011h)		;9628
	ret nz			;962b
	inc (ix+001h)		;962c
	ld h,002h		;962f
	jp L_8B80		;9631
L_9634:
	call L_9D05		;9634
	ret z			;9637
	ld (ix+011h),008h		;9638
	inc (ix+001h)		;963c
	inc (ix+010h)		;963f
	jp L_8B7E		;9642
L_9645:
	dec (ix+011h)		;9645
	ret nz			;9648
	inc (ix+001h)		;9649
	ld (ix+011h),008h		;964c
	inc (ix+010h)		;9650
	ret			;9653
L_9654:
	dec (ix+011h)		;9654
	ret nz			;9657
	ld a,018h		;9658
	call 056e3h		;965a
	call L_8B41		;965d
	jr c,L_966D		;9660
	ld a,(0c244h)		;9662
	add a,020h		;9665
	sub (ix+003h)		;9667
	cp 040h		;966a
	ret nc			;966c
L_966D:
	call L_83D6		;966d
	call L_8C16		;9670
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
	ld d,(ix+005h)		;9683
	ld e,(ix+003h)		;9686
	ld c,017h		;9689
	push ix		;968b
L_968D:
	push bc			;968d
	push de			;968e
	call L_8613		;968f
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
	ld hl,0c400h		;96a7
L_96AA:
	ld a,(hl)			;96aa
	cp 017h		;96ab
	push hl			;96ad
	call z,L_96FA		;96ae
	pop hl			;96b1
	ld de,00080h		;96b2
	add hl,de			;96b5
	djnz L_96AA		;96b6
	ld a,(ix+01fh)		;96b8
	dec a			;96bb
	and 003h		;96bc
	ld (ix+01fh),a		;96be
L_96C1:
	ld hl,0ae7ah		;96c1
	call 05596h		;96c4
	ld a,(ix+005h)		;96c7
	inc a			;96ca
	ld (ix+01bh),a		;96cb
	bit 0,(ix+01ch)		;96ce
	jr nz,L_96E3		;96d2
	ld a,(ix+01fh)		;96d4
	and 001h		;96d7
	jr nz,L_96E3		;96d9
	call L_8B48		;96db
	call c,L_8B03		;96de
	jr L_96E9		;96e1
L_96E3:
	call L_8B48		;96e3
	call nc,L_8B03		;96e6
L_96E9:
	ld de,03e40h		;96e9
	call L_9B8D		;96ec
	ld a,(ix+01fh)		;96ef
	cp 002h		;96f2
	ret nc			;96f4
	ld (ix+001h),001h		;96f5
	ret			;96f9
L_96FA:
	ld a,003h		;96fa
	call 04083h		;96fc
	ld a,(hl)			;96ff
	cp (ix+003h)		;9700
	ret nz			;9703
	inc hl			;9704
	inc hl			;9705
	ld a,(hl)			;9706
	cp (ix+005h)		;9707
	ret nz			;970a
	inc (ix+01fh)		;970b
	ret			;970e
L_970F:
	ld b,(ix+001h)		;970f
	djnz L_9740		;9712
	ld a,(ix+008h)		;9714
	cp 080h		;9717
	call c,L_9735		;9719
	ld a,010h		;971c
	ld de,00000h		;971e
	call L_8BB7		;9721
	ld a,(ix+016h)		;9724
	and 001h		;9727
	ret z			;9729
	dec (ix+01eh)		;972a
	call z,L_973B		;972d
L_9730:
	ld a,(ix+01fh)		;9730
	jr L_96C1		;9733
L_9735:
	ld de,03d3fh		;9735
	jp L_9B8D		;9738
L_973B:
	set 0,(ix+01ch)		;973b
	ret			;973f
L_9740:
	xor a			;9740
	ld (ix+006h),a		;9741
	ld (ix+00bh),a		;9744
	call L_9735		;9747
	ld a,(ix+01bh)		;974a
	ld (ix+005h),a		;974d
	dec (ix+01dh)		;9750
	ret nz			;9753
	inc (ix+001h)		;9754
	ld (ix+006h),001h		;9757
	jr L_9730		;975b
L_975D:
	ld hl,0ae90h		;975d
	jp 05596h		;9760
L_9763:
	ld b,(ix+001h)		;9763
	djnz L_979A		;9766
	bit 2,(ix+01ah)		;9768
	ld a,001h		;976c
	jr z,L_9772		;976e
	ld a,0ffh		;9770
L_9772:
	add a,(ix+005h)		;9772
	ld (ix+005h),a		;9775
	inc (ix+01ah)		;9778
	ld a,(ix+01ah)		;977b
	cp 019h		;977e
	ret c			;9780
	inc (ix+001h)		;9781
	ld hl,0ae9bh		;9784
	call 05596h		;9787
	call L_8B48		;978a
	jp nc,L_8BFD		;978d
	ld (ix+010h),01ah		;9790
	call L_8B03		;9794
	jp L_8BFD		;9797
L_979A:
	djnz L_97B2		;979a
	ld a,(0c00dh)		;979c
	and 007h		;979f
	call z,L_97C5		;97a1
	call L_97DA		;97a4
	dec (ix+011h)		;97a7
	ret nz			;97aa
	ld (ix+011h),01ah		;97ab
	jp L_8B07		;97af
L_97B2:
	ld a,(0c244h)		;97b2
	sub 020h		;97b5
	cp (ix+003h)		;97b7
	ret nc			;97ba
	inc (ix+001h)		;97bb
	ld (ix+01ah),002h		;97be
	jp L_8B7E		;97c2
L_97C5:
	ld a,(0c244h)		;97c5
	sub 020h		;97c8
	cp (ix+003h)		;97ca
	ld a,001h		;97cd
	jr nc,L_97D3		;97cf
	ld a,0ffh		;97d1
L_97D3:
	add a,(ix+003h)		;97d3
	ld (ix+003h),a		;97d6
	ret			;97d9
L_97DA:
	ld a,(ix+005h)		;97da
	add a,(ix+00ah)		;97dd
	add a,010h		;97e0
	cp 020h		;97e2
	ret nc			;97e4
	call L_8B03		;97e5
	ld a,(ix+017h)		;97e8
	xor 001h		;97eb
	ld (ix+017h),a		;97ed
	and 001h		;97f0
	ld a,01ah		;97f2
	jr nz,L_97F8		;97f4
	ld a,019h		;97f6
L_97F8:
	ld (ix+010h),a		;97f8
	ret			;97fb
L_97FC:
	ld (ix+011h),010h		;97fc
	ld (ix+013h),000h		;9800
	ret			;9804
L_9805:
	ld a,(ix+001h)		;9805
	call 0408dh		;9808

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
	dec (ix+011h)		;9811
	ret nz			;9814
	ld (ix+011h),010h		;9815
	inc (ix+01fh)		;9819
	ld a,(ix+01fh)		;981c
	cp 005h		;981f
	jr z,L_9850		;9821
L_9823:
	ld d,(ix+005h)		;9823
	ld e,(ix+003h)		;9826
	ld c,015h		;9829
	ld a,(ix+01fh)		;982b
	ld b,a			;982e
	push ix		;982f
	xor a			;9831
	ld (0cc3ah),a		;9832
	ld ix,0cc3ah		;9835
	push bc			;9839
	call L_8613		;983a
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
	inc (ix+001h)		;9850
	ld (ix+011h),040h		;9853
	ld hl,0ffc0h		;9857
	jp L_8B8D		;985a
L_985D:
	call L_9CC8		;985d
	call nz,L_8B03		;9860
	call L_9D05		;9863
	jp z,L_8B03		;9866
	ld a,(ix+01fh)		;9869
	cp 008h		;986c
	jr z,L_9877		;986e
	call L_9882		;9870
	cp 004h		;9873
	jr c,L_9897		;9875
L_9877:
	dec (ix+011h)		;9877
	ret nz			;987a
	ld (ix+011h),040h		;987b
	jp L_8B03		;987f
L_9882:
	ld hl,0c400h		;9882
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
	inc (ix+001h)		;9897
	ld (ix+006h),000h		;989a
	ret			;989e
L_989F:
	ld (ix+006h),001h		;989f
	dec (ix+001h)		;98a3
	call L_8C16		;98a6
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
	call L_9823		;98bb
	inc (ix+01fh)		;98be
	ret			;98c1
L_98C2:
	ld a,(ix+012h)		;98c2
	ld (ix+01dh),a		;98c5
	ld (ix+01eh),080h		;98c8
	ld hl,02b00h		;98cc
	call L_8C0F		;98cf
L_98D2:
	call L_8B48		;98d2
	ld a,02bh		;98d5
	jr nc,L_98DB		;98d7
	ld a,02ch		;98d9
L_98DB:
	ld b,a			;98db
	ld a,(ix+01ch)		;98dc
	or a			;98df
	jr z,L_98E7		;98e0
	dec (ix+01ch)		;98e2
	inc b			;98e5
	inc b			;98e6
L_98E7:
	ld (ix+010h),b		;98e7
	ret			;98ea
L_98EB:
	ld (ix+01ch),010h		;98eb
	ret			;98ef
L_98F0:
	call L_98D2		;98f0
	ld a,(ix+012h)		;98f3
	cp (ix+01dh)		;98f6
	ld (ix+01dh),a		;98f9
	call nz,L_98EB		;98fc
	call L_9992		;98ff
	call L_997D		;9902
	ld a,(ix+001h)		;9905
	and a			;9908
	ret nz			;9909
	ld a,(ix+012h)		;990a
	dec a			;990d
	jr z,L_994F		;990e
	ld a,(iy+005h)		;9910
	ld (ix+005h),a		;9913
	ld c,(ix+01fh)		;9916
	push ix		;9919
	call L_9932		;991b
	pop ix		;991e
	sub (ix+003h)		;9920
	jr c,L_992E		;9923
	cp 010h		;9925
	jr c,L_992E		;9927
	ret z			;9929
	inc (ix+003h)		;992a
	ret			;992d
L_992E:
	dec (ix+003h)		;992e
	ret			;9931
L_9932:
	ld b,008h		;9932
	ld hl,0c400h		;9934
	ld d,0ffh		;9937
L_9939:
	ld a,(hl)			;9939
	cp 015h		;993a
	call z,L_9966		;993c
	ld a,080h		;993f
	call 04083h		;9941
	djnz L_9939		;9944
	ld a,0ffh		;9946
	cp d			;9948
	jr z,L_9960		;9949
	ld a,(ix+003h)		;994b
	ret			;994e
L_994F:
	inc (ix+001h)		;994f
	call L_8B48		;9952
	ld hl,0f800h		;9955
	jr c,L_995D		;9958
	call L_8B31		;995a
L_995D:
	jp L_8B8D		;995d
L_9960:
	ld a,(iy+003h)		;9960
	add a,010h		;9963
	ret			;9965
L_9966:
	inc hl			;9966
	ld a,(hl)			;9967
	dec hl			;9968
	or a			;9969
	ret nz			;996a
	push hl			;996b
	ld a,01fh		;996c
	call 04083h		;996e
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
L_997D:
	ld hl,0c400h		;997d
	ld de,00080h		;9980
	ld b,008h		;9983
L_9985:
	ld a,(hl)			;9985
	cp 003h		;9986
	jr z,L_998E		;9988
	add hl,de			;998a
	djnz L_9985		;998b
	ret			;998d
L_998E:
	push hl			;998e
	pop iy		;998f
	ret			;9991
L_9992:
	dec (ix+01eh)		;9992
	ret nz			;9995
	ld (ix+01eh),020h		;9996
	call L_8B48		;999a
	ld a,002h		;999d
	jr nc,L_99A3		;999f
	neg		;99a1
L_99A3:
	jp L_8C56		;99a3
L_99A6:
	ld (ix+010h),041h		;99a6
	ld (ix+01fh),004h		;99aa
	ld (ix+011h),010h		;99ae
	ret			;99b2
L_99B3:
	ld c,041h		;99b3
	call L_9B9A		;99b5
	ld a,(ix+001h)		;99b8
	and a			;99bb
	jr nz,$+126		;99bc
	call L_99C9		;99be
	ld (ix+011h),018h		;99c1
	inc (ix+001h)		;99c5
	ret			;99c8
L_99C9:
	call L_8B4F		;99c9
	and 003h		;99cc
	jr z,L_99ED		;99ce
	call L_8B4F		;99d0
	and 00eh		;99d3
	rr a		;99d5
L_99D7:
	ld (ix+01fh),a		;99d7
	add a,a			;99da
	ld de,09a2ah		;99db
	call 04088h		;99de
	ld a,(de)			;99e1
	inc de			;99e2
	ld h,a			;99e3
	call L_8B8B		;99e4
	ld a,(de)			;99e7
	inc de			;99e8
	ld h,a			;99e9
	jp L_8B80		;99ea
L_99ED:
	call L_8B48		;99ed
	ld b,000h		;99f0
	jr nc,L_99F6		;99f2
	ld b,004h		;99f4
L_99F6:
	ld a,(0c246h)		;99f6
	sub (ix+005h)		;99f9
	add a,010h		;99fc
	cp 020h		;99fe
	jr c,L_9A27		;9a00
	inc b			;9a02
	ld a,(0c244h)		;9a03
	sub (ix+003h)		;9a06
	add a,010h		;9a09
	cp 020h		;9a0b
	inc b			;9a0d
	jr c,L_9A27		;9a0e
	dec b			;9a10
	call L_8B41		;9a11
	ld c,000h		;9a14
	jr c,L_9A1A		;9a16
	ld c,002h		;9a18
L_9A1A:
	ld a,b			;9a1a
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
	ld a,(0c00dh)		;9a3a
	and 001h		;9a3d
	ld (ix+006h),a		;9a3f
	call L_9A4D		;9a42
	dec (ix+011h)		;9a45
	ret nz			;9a48
	dec (ix+001h)		;9a49
	ret			;9a4c
L_9A4D:
	ld a,(0c00dh)		;9a4d
	and 003h		;9a50
	ret nz			;9a52
	ld a,041h		;9a53
	dec (ix+010h)		;9a55
	cp (ix+010h)		;9a58
	ret z			;9a5b
	inc (ix+010h)		;9a5c
	inc (ix+010h)		;9a5f
	ret			;9a62
L_9A63:
	ld (ix+010h),088h		;9a63
	ld (ix+00bh),001h		;9a67
	ld (ix+00ch),020h		;9a6b
	ld a,(ix+003h)		;9a6f
	cp 080h		;9a72
	ld h,0feh		;9a74
	jr c,L_9A7A		;9a76
	ld h,0fch		;9a78
L_9A7A:
	call L_8B80		;9a7a
	call L_8B4F		;9a7d
	and 003h		;9a80
	inc a			;9a82
	ld l,000h		;9a83
	srl a		;9a85
	rr l		;9a87
	ld h,a			;9a89
	call L_8B48		;9a8a
	jr nc,L_9A92		;9a8d
	call L_8B31		;9a8f
L_9A92:
	ld (ix+011h),020h		;9a92
	jp L_8B8D		;9a96
L_9A99:
	ret			;9a99
L_9A9A:
	ld (ix+010h),025h		;9a9a
	push ix		;9a9e
	pop hl			;9aa0
	add hl,hl			;9aa1
	ld a,h			;9aa2
	and 007h		;9aa3
	inc a			;9aa5
	ld (ix+011h),a		;9aa6
	ld (ix+001h),004h		;9aa9
	ret			;9aad
L_9AAE:
	ld b,(ix+001h)		;9aae
	djnz L_9AD2		;9ab1
	ld (ix+010h),026h		;9ab3
	dec (ix+011h)		;9ab7
	ret nz			;9aba
	inc (ix+010h)		;9abb
	inc (ix+001h)		;9abe
L_9AC1:
	ld (ix+013h),003h		;9ac1
	ld (ix+00ch),040h		;9ac5
	ld (ix+00bh),001h		;9ac9
	ld h,0ffh		;9acd
	jp L_8B80		;9acf
L_9AD2:
	djnz L_9B04		;9ad2
	call 0a690h		;9ad4
	ld e,000h		;9ad7
	ld d,007h		;9ad9
	call L_9CE7		;9adb
	ret z			;9ade
	ld (ix+00bh),000h		;9adf
	call L_8BA9		;9ae3
	inc (ix+001h)		;9ae6
	call L_8B48		;9ae9
	ld h,0ffh		;9aec
	jr c,L_9AF2		;9aee
	ld h,001h		;9af0
L_9AF2:
	call L_9D71		;9af2
	ld a,h			;9af5
	jr c,L_9AFA		;9af6
	neg		;9af8
L_9AFA:
	ld h,a			;9afa
	call L_8B8B		;9afb
L_9AFE:
	ld de,02927h		;9afe
	jp L_9B8D		;9b01
L_9B04:
	djnz L_9B21		;9b04
	ld c,027h		;9b06
	call L_9B9A		;9b08
	call L_9CC8		;9b0b
	call nz,L_9B1C		;9b0e
	call L_9CA8		;9b11
	ret nc			;9b14
	ld (ix+001h),002h		;9b15
	jp L_9AC1		;9b19
L_9B1C:
	call L_8B03		;9b1c
	jr L_9AFE		;9b1f
L_9B21:
	djnz L_9B34		;9b21
	dec (ix+011h)		;9b23
	ret nz			;9b26
	ld (ix+011h),008h		;9b27
	ld (ix+001h),000h		;9b2b
	ld (ix+008h),0ffh		;9b2f
	ret			;9b33
L_9B34:
	dec (ix+011h)		;9b34
	ret nz			;9b37
	call L_9D71		;9b38
	ld a,008h		;9b3b
	jr c,L_9B40		;9b3d
	add a,a			;9b3f
L_9B40:
	ld (ix+011h),a		;9b40
	jp L_8AFF		;9b43
L_9B46:
	ld (ix+010h),000h		;9b46
	ld h,004h		;9b4a
	jp L_8B80		;9b4c
L_9B4F:
	ld a,(ix+001h)		;9b4f
	call 0408dh		;9b52

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
	ld e,(ix+008h)		;9b63
	call L_9D07		;9b66
	ret z			;9b69
	ld a,005h		;9b6a
	call 056e3h		;9b6c
	call 0a683h		;9b6f
	inc (ix+001h)		;9b72
L_9B75:
	call L_8B7E		;9b75
	ld (ix+011h),020h		;9b78
	call L_8B48		;9b7c
	ld hl,0fea0h		;9b7f
	jr c,L_9B87		;9b82
	ld hl,00160h		;9b84
L_9B87:
	call L_8B8D		;9b87
L_9B8A:
	ld de,00002h		;9b8a
L_9B8D:
	ld a,(ix+00ah)		;9b8d
	cp 080h		;9b90
	ld a,d			;9b92
	jr c,L_9B96		;9b93
	ld a,e			;9b95
L_9B96:
	ld (ix+010h),a		;9b96
	ret			;9b99
L_9B9A:
	ld a,(0c00dh)		;9b9a
	and 007h		;9b9d
	ret nz			;9b9f
	ld a,(ix+010h)		;9ba0
	sub c			;9ba3
	xor 001h		;9ba4
	add a,c			;9ba6
	ld (ix+010h),a		;9ba7
	ret			;9baa
L_9BAB:
	ld c,000h		;9bab
	call L_9B9A		;9bad
	call L_9CA8		;9bb0
	ret c			;9bb3
	call L_9CBA		;9bb4
	call L_9D71		;9bb7
	jp nc,L_9C11		;9bba
	ld a,(ix+01eh)		;9bbd
	or a			;9bc0
	jr nz,L_9BD6		;9bc1
	dec (ix+011h)		;9bc3
	ret nz			;9bc6
	ld (ix+011h),010h		;9bc7
	ld a,(0c244h)		;9bcb
	sub (ix+003h)		;9bce
	add a,004h		;9bd1
	cp 008h		;9bd3
	ret c			;9bd5
L_9BD6:
	ld a,(0c244h)		;9bd6
	cp (ix+003h)		;9bd9
	jp nc,L_9BF8		;9bdc
	call L_9C1C		;9bdf
	jp nc,L_9C74		;9be2
	ld a,(ix+01eh)		;9be5
	or a			;9be8
	ret z			;9be9
	call L_9C47		;9bea
	jp nc,L_9C8D		;9bed
	call L_8B03		;9bf0
	ld de,00002h		;9bf3
	jr L_9B8D		;9bf6
L_9BF8:
	call L_9C47		;9bf8
	jp nc,L_9C8D		;9bfb
	ld a,(ix+01eh)		;9bfe
	or a			;9c01
	ret z			;9c02
	call L_9C1C		;9c03
	jr nc,L_9C74		;9c06
	call L_8B03		;9c08
	ld de,00002h		;9c0b
	jp L_9B8D		;9c0e
L_9C11:
	ld a,(ix+01eh)		;9c11
	or a			;9c14
	ret z			;9c15
	call L_8B03		;9c16
	jp L_9B8A		;9c19
L_9C1C:
	ld d,(ix+005h)		;9c1c
	ld a,(ix+003h)		;9c1f
	sub 00ch		;9c22
	ld e,a			;9c24
	ld b,0f0h		;9c25
	ld c,001h		;9c27
L_9C29:
	ld a,e			;9c29
	add a,b			;9c2a
	ld e,a			;9c2b
	cp 0d0h		;9c2c
	jr nc,L_9C72		;9c2e
	cp 030h		;9c30
	jr c,L_9C72		;9c32
	push bc			;9c34
	push de			;9c35
	call 0704ch		;9c36
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
L_9C47:
	ld d,(ix+005h)		;9c47
	ld a,(ix+003h)		;9c4a
	add a,004h		;9c4d
	ld e,a			;9c4f
	ld b,010h		;9c50
	ld c,001h		;9c52
L_9C54:
	ld a,e			;9c54
	add a,b			;9c55
	ld e,a			;9c56
	cp 0d0h		;9c57
	jr nc,L_9C72		;9c59
	cp 030h		;9c5b
	jr c,L_9C72		;9c5d
	push bc			;9c5f
	push de			;9c60
	call 0704ch		;9c61
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
	call L_8B80		;9c76
	call L_8B89		;9c79
	ld a,e			;9c7c
	ld (ix+01fh),a		;9c7d
	ld (ix+001h),002h		;9c80
	ld (ix+006h),000h		;9c84
	ld (ix+011h),010h		;9c88
	ret			;9c8c
L_9C8D:
	ld h,004h		;9c8d
	call L_8B80		;9c8f
	call L_8B89		;9c92
	ld a,e			;9c95
	sub 004h		;9c96
	ld (ix+01fh),a		;9c98
	ld (ix+001h),004h		;9c9b
	ld (ix+006h),000h		;9c9f
	ld (ix+011h),010h		;9ca3
	ret			;9ca7
L_9CA8:
	call L_9D05		;9ca8
	ret nz			;9cab
	call L_8B89		;9cac
	ld h,004h		;9caf
	call L_8B80		;9cb1
	ld (ix+001h),000h		;9cb4
	scf			;9cb8
	ret			;9cb9
L_9CBA:
	ld (ix+01eh),000h		;9cba
	call L_9CC8		;9cbe
	ret z			;9cc1
	ld (ix+01eh),001h		;9cc2
	scf			;9cc6
	ret			;9cc7
L_9CC8:
	ld d,007h		;9cc8
L_9CCA:
	ld e,0fch		;9cca
L_9CCC:
	ld a,(ix+00ah)		;9ccc
	cp 080h		;9ccf
	ld a,d			;9cd1
	jr c,L_9CD6		;9cd2
	neg		;9cd4
L_9CD6:
	add a,(ix+00ah)		;9cd6
	ld d,a			;9cd9
	ld a,080h		;9cda
	push de			;9cdc
	call L_8BB7		;9cdd
	pop de			;9ce0
	ld a,(ix+016h)		;9ce1
	and 008h		;9ce4
	ret			;9ce6
L_9CE7:
	ld a,e			;9ce7
	add a,(ix+008h)		;9ce8
	ld e,a			;9ceb
	call L_9D09		;9cec
	ret z			;9cef
	call 0a683h		;9cf0
	or 0ffh		;9cf3
	ret			;9cf5
L_9CF6:
	ld a,e			;9cf6
	add a,(ix+008h)		;9cf7
	ld e,a			;9cfa
	call L_9D0F		;9cfb
	ret z			;9cfe
	call 0a683h		;9cff
	or 0ffh		;9d02
	ret			;9d04
L_9D05:
	ld e,004h		;9d05
L_9D07:
	ld d,007h		;9d07
L_9D09:
	call L_9D15		;9d09
	ret nz			;9d0c
	jr L_9D23		;9d0d
L_9D0F:
	call L_9D15		;9d0f
	ret z			;9d12
	jr L_9D23		;9d13
L_9D15:
	ld a,080h		;9d15
	push de			;9d17
	inc e			;9d18
	call L_8BB7		;9d19
	pop de			;9d1c
	ld a,(ix+016h)		;9d1d
	and 008h		;9d20
	ret			;9d22
L_9D23:
	ld a,080h		;9d23
	ld d,0f9h		;9d25
	call L_8BB7		;9d27
	ld a,(ix+016h)		;9d2a
	and 008h		;9d2d
	ret			;9d2f
L_9D30:
	dec (ix+011h)		;9d30
	ret nz			;9d33
	ld (ix+006h),001h		;9d34
	ld (ix+010h),000h		;9d38
	inc (ix+001h)		;9d3c
	ret			;9d3f
L_9D40:
	ld a,(ix+01fh)		;9d40
	cp (ix+003h)		;9d43
	ret c			;9d46
	call 0a683h		;9d47
	ld (ix+001h),001h		;9d4a
	jp L_9B75		;9d4e
L_9D51:
	ld a,(ix+003h)		;9d51
	add a,(ix+008h)		;9d54
	cp (ix+01fh)		;9d57
	ret c			;9d5a
	ld a,005h		;9d5b
	call 056e3h		;9d5d
	call 0a683h		;9d60
	ld (ix+001h),001h		;9d63
	jp L_9B75		;9d67
L_9D6A:
	dec (ix+011h)		;9d6a
	ret nz			;9d6d
	jp L_83D6		;9d6e
L_9D71:
	call L_8C16		;9d71
	cp 003h		;9d74
	ret z			;9d76
	scf			;9d77
	ret			;9d78
L_9D79:
	ld (ix+010h),010h		;9d79
	ld (ix+008h),006h		;9d7d
	ret			;9d81
L_9D82:
	ld a,(ix+001h)		;9d82
	call 0408dh		;9d85

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
	ld e,(ix+008h)		;9d92
	call L_9D07		;9d95
	ret z			;9d98
	call L_8B7E		;9d99
	call 0a683h		;9d9c
	inc (ix+001h)		;9d9f
	ld (ix+011h),008h		;9da2
	inc (ix+010h)		;9da6
	ld a,005h		;9da9
	jp 056e3h		;9dab
L_9DAE:
	dec (ix+011h)		;9dae
	ret nz			;9db1
	inc (ix+001h)		;9db2
	ld (ix+011h),008h		;9db5
	jp L_9E06		;9db9
L_9DBC:
	ld c,012h		;9dbc
	call L_9B9A		;9dbe
	call L_9E18		;9dc1
	ret c			;9dc4
	dec (ix+011h)		;9dc5
	ret nz			;9dc8
	ld (ix+011h),008h		;9dc9
	call L_8B4F		;9dcd
	and 003h		;9dd0
	cp 003h		;9dd2
	jr z,L_9E06		;9dd4
	or a			;9dd6
	jr z,L_9DFD		;9dd7
	cp 001h		;9dd9
	jr z,L_9DE9		;9ddb
	ld hl,0ff00h		;9ddd
	call L_9D71		;9de0
	jr c,L_9DF4		;9de3
	ld l,080h		;9de5
	jr L_9DF4		;9de7
L_9DE9:
	ld hl,00100h		;9de9
	call L_9D71		;9dec
	jr c,L_9DF4		;9def
	ld hl,00080h		;9df1
L_9DF4:
	call L_8B8D		;9df4
	ld de,01412h		;9df7
	jp L_9B8D		;9dfa
L_9DFD:
	call L_8B03		;9dfd
	ld de,01412h		;9e00
	jp L_9B8D		;9e03
L_9E06:
	call L_8B48		;9e06
	ld h,0feh		;9e09
	jr c,L_9E0F		;9e0b
	ld h,002h		;9e0d
L_9E0F:
	call L_8B8B		;9e0f
	ld de,01412h		;9e12
	jp L_9B8D		;9e15
L_9E18:
	call L_9E40		;9e18
	ret c			;9e1b
	call L_9CC8		;9e1c
	ret z			;9e1f
	ld (ix+011h),010h		;9e20
	ld a,080h		;9e24
	ld e,0ech		;9e26
	call L_8BB7		;9e28
	ld a,(ix+016h)		;9e2b
	and 008h		;9e2e
	jp nz,L_8B03		;9e30
	inc (ix+001h)		;9e33
	ld (ix+011h),002h		;9e36
	ld (ix+006h),000h		;9e3a
	scf			;9e3e
	ret			;9e3f
L_9E40:
	ld d,009h		;9e40
	ld e,004h		;9e42
	ld a,0c0h		;9e44
	push de			;9e46
	call L_8BB7		;9e47
	pop de			;9e4a
	ld a,(ix+016h)		;9e4b
	and 00ch		;9e4e
	ret nz			;9e50
	ld a,080h		;9e51
	ld d,0f7h		;9e53
	call L_8BB7		;9e55
	ld a,(ix+016h)		;9e58
	and 008h		;9e5b
	ret nz			;9e5d
	call L_8B89		;9e5e
	ld (ix+010h),010h		;9e61
	ld (ix+008h),003h		;9e65
	ld (ix+001h),000h		;9e69
	scf			;9e6d
	ret			;9e6e
L_9E6F:
	ld a,(0c00dh)		;9e6f
	and 00fh		;9e72
	ret nz			;9e74
	ld a,(ix+00ah)		;9e75
	cp 080h		;9e78
	ld b,008h		;9e7a
	jr c,L_9E80		;9e7c
	ld b,0f8h		;9e7e
L_9E80:
	ld a,(ix+005h)		;9e80
	add a,b			;9e83
	ld (ix+005h),a		;9e84
	ld a,(ix+003h)		;9e87
	sub 008h		;9e8a
	ld (ix+003h),a		;9e8c
	ld de,01716h		;9e8f
	call L_9B8D		;9e92
	dec (ix+011h)		;9e95
	ret nz			;9e98
	ld (ix+006h),001h		;9e99
	call L_8B7E		;9e9d
	ld (ix+011h),010h		;9ea0
	call L_9E06		;9ea4
	ld (ix+001h),002h		;9ea7
	ld de,01412h		;9eab
	jp L_9B8D		;9eae
L_9EB1:
	dec (ix+011h)		;9eb1
	ret nz			;9eb4
	jp L_83D6		;9eb5
L_9EB8:
	ld h,001h		;9eb8
	call L_8B8B		;9eba
	ld de,0898bh		;9ebd
	call L_9B8D		;9ec0
	ld (ix+011h),020h		;9ec3
	ld (ix+01fh),030h		;9ec7
	ret			;9ecb
L_9ECC:
	ld b,(ix+001h)		;9ecc
	djnz L_9EF3		;9ecf
	dec (ix+01fh)		;9ed1
	ret nz			;9ed4
	ld a,(ix+01eh)		;9ed5
	ld (ix+00ah),a		;9ed8
	call L_8C16		;9edb
	ld c,030h		;9ede
	bit 1,a		;9ee0
	jr z,L_9EEC		;9ee2
	ld c,015h		;9ee4
	cp 002h		;9ee6
	jr z,L_9EEC		;9ee8
	ld c,060h		;9eea
L_9EEC:
	ld (ix+01fh),c		;9eec
	dec (ix+001h)		;9eef
	ret			;9ef2
L_9EF3:
	djnz L_9F18		;9ef3
	inc (ix+001h)		;9ef5
L_9EF8:
	ld h,0fch		;9ef8
	call L_8B80		;9efa
	ld (ix+010h),08fh		;9efd
	ld (ix+00ch),040h		;9f01
	ld (ix+00bh),001h		;9f05
	ld a,(0c246h)		;9f09
	cp (ix+005h)		;9f0c
	ld h,002h		;9f0f
	jr nc,L_9F15		;9f11
	ld h,0feh		;9f13
L_9F15:
	jp L_8B8B		;9f15
L_9F18:
	djnz L_9F37		;9f18
	ld a,(ix+008h)		;9f1a
	cp 080h		;9f1d
	jr nc,L_9F25		;9f1f
	ld (ix+010h),08fh		;9f21
L_9F25:
	ld e,(ix+008h)		;9f25
	ld d,000h		;9f28
	ld a,040h		;9f2a
	call L_8BB7		;9f2c
	ld a,(ix+016h)		;9f2f
	and 004h		;9f32
	ret z			;9f34
	jr L_9EF8		;9f35
L_9F37:
	call L_9F53		;9f37
	call L_9F71		;9f3a
	ret z			;9f3d
	call L_9D05		;9f3e
	jr z,L_9F4C		;9f41
	call L_9CC8		;9f43
	jr nz,L_9F4C		;9f46
	dec (ix+011h)		;9f48
	ret nz			;9f4b
L_9F4C:
	ld (ix+011h),020h		;9f4c
	jp L_8B03		;9f50
L_9F53:
	ld a,(0c00dh)		;9f53
	and 007h		;9f56
	ret nz			;9f58
	ld a,(0c246h)		;9f59
	cp (ix+005h)		;9f5c
	ld c,089h		;9f5f
	jr nc,L_9F65		;9f61
	ld c,08bh		;9f63
L_9F65:
	ld a,(0c00dh)		;9f65
	and 008h		;9f68
	jr z,L_9F6D		;9f6a
	inc c			;9f6c
L_9F6D:
	ld (ix+010h),c		;9f6d
	ret			;9f70
L_9F71:
	dec (ix+01fh)		;9f71
	ret nz			;9f74
	ld a,(0c246h)		;9f75
	cp (ix+005h)		;9f78
	ld c,08dh		;9f7b
	jr nc,L_9F81		;9f7d
	ld c,08eh		;9f7f
L_9F81:
	ld (ix+010h),c		;9f81
	ld a,(ix+00ah)		;9f84
	ld (ix+01eh),a		;9f87
	call L_8B89		;9f8a
	inc (ix+001h)		;9f8d
	ld (ix+01fh),010h		;9f90
	ld a,(0c246h)		;9f94
	cp (ix+005h)		;9f97
	ld a,002h		;9f9a
	jr nc,L_9FA0		;9f9c
	neg		;9f9e
L_9FA0:
	ld d,(ix+005h)		;9fa0
	ld a,(ix+003h)		;9fa3
	sub 008h		;9fa6
	ld e,a			;9fa8
	ld c,018h		;9fa9
	push ix		;9fab
	call L_8613		;9fad
	pop ix		;9fb0
	xor a			;9fb2
	ret			;9fb3
L_9FB4:
	ld (ix+010h),051h		;9fb4
	ld (ix+011h),020h		;9fb8
	ld h,001h		;9fbc
	call L_8B8B		;9fbe
	ret			;9fc1
L_9FC2:
	ld a,(ix+001h)		;9fc2
	and a			;9fc5
	jr nz,$+78		;9fc6
	call 0a005h		;9fc8
	ld de,05153h		;9fcb
	call L_9B8D		;9fce
	dec (ix+011h)		;9fd1
	ret nz			;9fd4
	ld a,(0c244h)		;9fd5
	sub (ix+003h)		;9fd8
	add a,008h		;9fdb
	cp 010h		;9fdd
	jr c,$+33		;9fdf
	ld h,0fch		;9fe1
	call L_8B80		;9fe3
	ld (ix+00bh),001h		;9fe6
	ld (ix+00ch),040h		;9fea
	ld a,(0c246h)		;9fee
	cp (ix+005h)		;9ff1
	ld h,0feh		;9ff4
	jr c,L_9FFA		;9ff6
	ld h,002h		;9ff8
L_9FFA:
	inc (ix+001h)		;9ffa
	jp L_8B8B		;9ffd
