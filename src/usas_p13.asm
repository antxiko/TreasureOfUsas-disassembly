; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 13 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ======================================================================
; CODIGO 0x6000..0x60cc  (204 bytes)
; ======================================================================


L_6000:
	ld a,(0c10fh)		;6000
	ld e,a			;6003
	ld a,007h		;6004
	call 00093h		;6006   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,(0c110h)		;6009
	bit 0,a		;600c
	jp nz,L_6096		;600e
	bit 1,a		;6011
	jp nz,L_60B1		;6013
	ld a,(0c11bh)		;6016
	dec a			;6019
	jp m,L_604B		;601a
	jr nz,L_6048		;601d
	ld a,(0c11ch)		;601f
	dec a			;6022
	ld (0c11ch),a		;6023
	cp 0f0h		;6026
	jr nz,L_603C		;6028
	ld hl,L_6074		;602a
	ld (0c010h),hl		;602d
	ld (0c012h),hl		;6030
	ld (0c014h),hl		;6033
	xor a			;6036
	ld (0c11dh),a		;6037
	jr L_6048		;603a
L_603C:
	ld a,(0c12ah)		;603c
	or a			;603f
	jr nz,L_6046		;6040
	ld a,03ah		;6042
	jr L_6048		;6044
L_6046:
	ld a,010h		;6046
L_6048:
	ld (0c11bh),a		;6048
L_604B:
	xor a			;604b
	ld b,a			;604c
	ld hl,(0c010h)		;604d
	call L_606C		;6050
	ld a,001h		;6053
	ld b,a			;6055
	ld hl,(0c012h)		;6056
	call L_606C		;6059
	ld a,002h		;605c
	ld b,a			;605e
	ld hl,(0c014h)		;605f
	call L_606C		;6062
	ld a,002h		;6065
	ld b,003h		;6067
	ld hl,(0c016h)		;6069
L_606C:
	ld (0c10ch),a		;606c
	ld a,b			;606f
	ld (0c10dh),a		;6070
	jp (hl)			;6073
L_6074:
	ld a,(0c10dh)		;6074
	cp 003h		;6077
	jr nz,L_6082		;6079
	xor a			;607b
	ld (0c10eh),a		;607c
	ld a,(0c10dh)		;607f
L_6082:
	rlca			;6082
	ld hl,0c010h		;6083
	add a,l			;6086
	ld l,a			;6087
	jr nc,L_608B		;6088
	inc h			;608a
L_608B:
	ld de,L_6095		;608b
	ld (hl),e			;608e
	inc hl			;608f
	ld (hl),d			;6090
	ld e,000h		;6091
	jr $+65		;6093
L_6095:
	ret			;6095
L_6096:
	xor a			;6096
	ld b,004h		;6097
	ld hl,(0c018h)		;6099
	call L_606C		;609c
	ld a,001h		;609f
	ld b,005h		;60a1
	ld hl,(0c01ah)		;60a3
	call L_606C		;60a6
	ld a,(0c110h)		;60a9
	bit 1,a		;60ac
	jr nz,L_60B1		;60ae
	ret			;60b0
L_60B1:
	xor a			;60b1
	ld b,004h		;60b2
	ld hl,(0c127h)		;60b4
	jr L_606C		;60b7
L_60B9:
	ld a,(0c10ch)		;60b9
	rlca			;60bc
	call 00093h		;60bd   ; BIOS WRTPSG - Writes data to PSG-register
	inc a			;60c0
	ld e,d			;60c1
	jp 00093h		;60c2   ; BIOS WRTPSG - Writes data to PSG-register
L_60C5:
	ld a,(0c10ch)		;60c5
	rlca			;60c8
	jp 00093h		;60c9   ; BIOS WRTPSG - Writes data to PSG-register

; ----------------------------------------------------------------------
; DATOS resto_60CC: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (8 bytes)
;   0x60cc..0x60d4  (8 bytes)
DATA_resto_60CC:
	defb 03ah,00ch,0c1h,007h,03ch,0c3h,093h,000h	; 60cc  :...<...

; ======================================================================
; CODIGO 0x60d4..0x610e  (58 bytes)
; ======================================================================


L_60D4:
	ld a,(0c10ch)		;60d4
	add a,008h		;60d7
	jp 00093h		;60d9   ; BIOS WRTPSG - Writes data to PSG-register
L_60DC:
	push hl			;60dc
	ld hl,06120h		;60dd
	jp L_60F5		;60e0
L_60E3:
	push hl			;60e3
	ld hl,0611ah		;60e4
	jp L_60F5		;60e7
L_60EA:
	push hl			;60ea
	ld hl,06114h		;60eb
	jp L_60F5		;60ee
L_60F1:
	push hl			;60f1
	ld hl,0610eh		;60f2
L_60F5:
	ld a,(0c10ch)		;60f5
	rlca			;60f8
	add a,l			;60f9
	ld l,a			;60fa
	jr nc,L_60FE		;60fb
	inc h			;60fd
L_60FE:
	ld a,(0c10fh)		;60fe
	and (hl)			;6101
	inc hl			;6102
	or (hl)			;6103
	ld (0c10fh),a		;6104
	pop hl			;6107
	ld e,a			;6108
	ld a,007h		;6109
	jp 00093h		;610b   ; BIOS WRTPSG - Writes data to PSG-register

; ----------------------------------------------------------------------
; DATOS mascaras_de_canal: 4 tablas de 6 bytes (p13:60DC/60E3/60EA/60F1 +
;   0xC10C * 2): la mascara del mezclador de cada canal; lo leen p13:60F5 (24
;   bytes)
;   0x610e..0x6126  (24 bytes)
DATA_mascaras_de_canal:
	defb 0feh,008h,0fdh,010h,0fbh,020h	; 610e
	defb 0f7h,001h,0efh,002h,0dfh,004h	; 6114
	defb 0f6h,000h,0edh,000h,0dbh,000h	; 611a
	defb 0ffh,009h,0ffh,012h,0ffh,024h	; 6120

; ======================================================================
; CODIGO 0x6126..0x6325  (511 bytes)
; ======================================================================


L_6126:
	ld ix,0c0bch		;6126
	jp L_6146		;612a
L_612D:
	ld ix,0c0e4h		;612d
	jp L_6146		;6131
L_6134:
	ld ix,0c01ch		;6134
	jp L_6146		;6138
L_613B:
	ld ix,0c044h		;613b
	jp L_6146		;613f
L_6142:
	ld ix,0c06ch		;6142
L_6146:
	ld a,(0c10dh)		;6146
	cp 002h		;6149
	jp nz,L_6158		;614b
	ld a,(0c10eh)		;614e
	or a			;6151
	jr z,L_6158		;6152
	set 5,(ix+002h)		;6154
L_6158:
	dec (ix+009h)		;6158
	jp z,L_61FD		;615b
	bit 0,(ix+002h)		;615e
	jp z,L_61E6		;6162
	bit 2,(ix+014h)		;6165
	call nz,L_6188		;6169
	ld a,(ix+009h)		;616c
	cp (ix+00bh)		;616f
	jr nc,L_6178		;6172
	cp (ix+006h)		;6174
	ret nc			;6177
L_6178:
	ld e,(ix+00ah)		;6178
	dec e			;617b
	ret m			;617c
	ld (ix+00ah),e		;617d
	bit 5,(ix+002h)		;6180
	ret nz			;6184
	jp L_60D4		;6185
L_6188:
	bit 0,(ix+014h)		;6188
	jr nz,L_619C		;618c
	ld a,(ix+015h)		;618e
	inc a			;6191
	cp 00ah		;6192
	jr c,L_61DA		;6194
	inc (ix+014h)		;6196
	xor a			;6199
	jr L_61DA		;619a
L_619C:
	ld a,(ix+019h)		;619c
	and 0f0h		;619f
	rrca			;61a1
	rrca			;61a2
	rrca			;61a3
	rrca			;61a4
	ld e,a			;61a5
	ld a,(ix+015h)		;61a6
	inc a			;61a9
	cp e			;61aa
	jr c,L_61DA		;61ab
	ld e,(ix+017h)		;61ad
	ld d,(ix+018h)		;61b0
	ld a,(ix+019h)		;61b3
	and 00fh		;61b6
	ld b,a			;61b8
	ld a,(ix+016h)		;61b9
	cpl			;61bc
	ld (ix+016h),a		;61bd
	and a			;61c0
	ld a,e			;61c1
	jr nz,L_61CB		;61c2
	add a,b			;61c4
	ld e,a			;61c5
	jr nc,L_61D0		;61c6
	inc d			;61c8
	jr L_61D0		;61c9
L_61CB:
	sub b			;61cb
	ld e,a			;61cc
	jr nc,L_61D0		;61cd
	dec d			;61cf
L_61D0:
	ld (ix+017h),e		;61d0
	ld (ix+018h),d		;61d3
	call L_61DE		;61d6
	xor a			;61d9
L_61DA:
	ld (ix+015h),a		;61da
	ret			;61dd
L_61DE:
	bit 5,(ix+002h)		;61de
	ret nz			;61e2
	jp L_60B9		;61e3
L_61E6:
	bit 5,(ix+002h)		;61e6
	ret nz			;61ea
	bit 7,(ix+002h)		;61eb
	ret nz			;61ef
	call L_64F4		;61f0
	ret nc			;61f3
	set 7,(ix+002h)		;61f4
	ld e,000h		;61f8
	jp L_60D4		;61fa
L_61FD:
	ld l,(ix+000h)		;61fd
	ld h,(ix+001h)		;6200
L_6203:
	ld a,(hl)			;6203
	inc hl			;6204
	ld c,a			;6205
	cp 0d0h		;6206
	jp nc,L_636B		;6208
	ld (ix+000h),l		;620b
	ld (ix+001h),h		;620e
	cp 0c0h		;6211
	jp nc,L_6345		;6213
	and 00fh		;6216
	inc a			;6218
	ld b,a			;6219
	ld e,(ix+003h)		;621a
	xor a			;621d
	ld (ix+015h),a		;621e
	ld (ix+016h),a		;6221
	res 0,(ix+014h)		;6224
L_6228:
	add a,e			;6228
	djnz L_6228		;6229
	ld (ix+009h),a		;622b
	ld a,(0c10dh)		;622e
	cp 002h		;6231
	jr nz,L_623F		;6233
	ld a,(0c10eh)		;6235
	or a			;6238
	jr nz,L_623F		;6239
	res 5,(ix+002h)		;623b
L_623F:
	bit 0,(ix+002h)		;623f
	jp z,L_62CC		;6243
	ld a,(ix+009h)		;6246
	sub (ix+005h)		;6249
	ld (ix+00bh),a		;624c
	bit 5,(ix+002h)		;624f
	ret nz			;6253
	ld a,(0c121h)		;6254
	or a			;6257
	jr z,L_6281		;6258
	ld a,(0c122h)		;625a
	bit 7,a		;625d
	jr nz,L_627C		;625f
	bit 6,a		;6261
	jr nz,L_6277		;6263
	bit 5,a		;6265
	jr nz,L_6272		;6267
	bit 4,a		;6269
	jr z,L_6281		;626b
	ld hl,0632bh		;626d
	jr L_6284		;6270
L_6272:
	ld hl,0632dh		;6272
	jr L_6284		;6275
L_6277:
	ld hl,06327h		;6277
	jr L_6284		;627a
L_627C:
	ld hl,06325h		;627c
	jr L_6284		;627f
L_6281:
	ld hl,06329h		;6281
L_6284:
	ld a,c			;6284
	and 0f0h		;6285
	rrca			;6287
	rrca			;6288
	rrca			;6289
	add a,l			;628a
	ld l,a			;628b
	jr nc,L_628F		;628c
	inc h			;628e
L_628F:
	ld e,(hl)			;628f
	inc hl			;6290
	ld d,(hl)			;6291
	ld b,(ix+007h)		;6292
L_6295:
	srl d		;6295
	rr e		;6297
	djnz L_6295		;6299
	ld (ix+017h),e		;629b
	ld (ix+018h),d		;629e
	bit 6,(ix+002h)		;62a1
	jr z,L_62AF		;62a5
	ld a,(ix+01ah)		;62a7
	add a,e			;62aa
	ld e,a			;62ab
	jr nc,L_62AF		;62ac
	inc d			;62ae
L_62AF:
	ld (ix+017h),e		;62af
	ld (ix+018h),d		;62b2
	call L_60B9		;62b5
	ld a,(0c11ch)		;62b8
	add a,(ix+004h)		;62bb
	jp p,L_62C2		;62be
	xor a			;62c1
L_62C2:
	ld (ix+00ah),a		;62c2
	ld e,a			;62c5
	call L_60D4		;62c6
	jp L_60F1		;62c9
L_62CC:
	ld a,(ix+008h)		;62cc
	rlca			;62cf
	ld e,a			;62d0
	ld d,000h		;62d1
	ld hl,08d4fh		;62d3
	add hl,de			;62d6
	ld e,(hl)			;62d7
	inc hl			;62d8
	ld d,(hl)			;62d9
	ex de,hl			;62da
	ld a,(ix+008h)		;62db
	cp 002h		;62de
	jr c,L_6308		;62e0
	ld a,(0c122h)		;62e2
	bit 7,a		;62e5
	jr nz,L_6304		;62e7
	bit 6,a		;62e9
	jr nz,L_62FF		;62eb
	bit 5,a		;62ed
	jr nz,L_62FA		;62ef
	bit 4,a		;62f1
	jr z,L_6308		;62f3
	ld de,00002h		;62f5
	jr L_6307		;62f8
L_62FA:
	ld de,00004h		;62fa
	jr L_6307		;62fd
L_62FF:
	ld de,0fffeh		;62ff
	jr L_6307		;6302
L_6304:
	ld de,0fffch		;6304
L_6307:
	add hl,de			;6307
L_6308:
	ld a,c			;6308
	and 0f0h		;6309
	rrca			;630b
	rrca			;630c
	rrca			;630d
	ld e,a			;630e
	ld d,000h		;630f
	add hl,de			;6311
	ld a,(hl)			;6312
	ld (ix+00ch),a		;6313
	inc hl			;6316
	ld a,(hl)			;6317
	ld (ix+00dh),a		;6318
	res 7,(ix+002h)		;631b
	ld a,001h		;631f
	ld (ix+00eh),a		;6321
	ret			;6324

; ----------------------------------------------------------------------
; DATOS periodos: 16 palabras: el periodo de cada nota (p13:6284 + (nota >>
;   3)), con 5 puntos de entrada segun 0xC122 (p13:625D); lo leen p13:6284 (32
;   bytes)
;   0x6325..0x6345  (32 bytes)
DATA_periodos:
	defb 000h,01eh	; 6325
	defb 050h,01ch	; 6327
	defb 0b8h,01ah	; 6329
	defb 038h,019h	; 632b
	defb 0d0h,017h	; 632d
	defb 078h,016h	; 632f
	defb 034h,015h	; 6331
	defb 004h,014h	; 6333
	defb 0e4h,012h	; 6335
	defb 0d4h,011h	; 6337
	defb 0d4h,010h	; 6339
	defb 0e4h,00fh	; 633b
	defb 000h,00fh	; 633d
	defb 028h,00eh	; 633f
	defb 05ch,00dh	; 6341
	defb 09ch,00ch	; 6343

; ======================================================================
; CODIGO 0x6345..0x66c4  (895 bytes)
; ======================================================================


L_6345:
	and 00fh		;6345
	inc a			;6347
	ld b,a			;6348
	ld e,(ix+003h)		;6349
	xor a			;634c
L_634D:
	add a,e			;634d
	djnz L_634D		;634e
	ld (ix+009h),a		;6350
	res 0,(ix+014h)		;6353
	xor a			;6357
	ld (ix+015h),a		;6358
	ld (ix+016h),a		;635b
	bit 5,(ix+002h)		;635e
	ret nz			;6362
	ld e,000h		;6363
	ld (ix+00ah),e		;6365
	jp L_60D4		;6368
L_636B:
	and 0f0h		;636b
	cp 0f0h		;636d
	jr z,L_637A		;636f
	cp 0d0h		;6371
	jr z,L_63E4		;6373
	cp 0e0h		;6375
	jp z,L_6412		;6377
L_637A:
	ld a,c			;637a
	and 00fh		;637b
	cp 00fh		;637d
	jp z,L_64BC		;637f
	cp 00dh		;6382
	jr c,L_63BD		;6384
	jr z,L_639E		;6386
	ld a,(ix+010h)		;6388
	dec a			;638b
	jr z,L_6399		;638c
	jp p,L_6393		;638e
	ld a,(hl)			;6391
	dec a			;6392
L_6393:
	inc hl			;6393
	ld (ix+010h),a		;6394
	jr L_63AD		;6397
L_6399:
	ld (ix+010h),a		;6399
	jr L_63B7		;639c
L_639E:
	ld a,(ix+01fh)		;639e
	dec a			;63a1
	jr z,L_63B4		;63a2
	jp p,L_63A9		;63a4
	ld a,(hl)			;63a7
	dec a			;63a8
L_63A9:
	inc hl			;63a9
	ld (ix+01fh),a		;63aa
L_63AD:
	ld a,(hl)			;63ad
	inc hl			;63ae
	ld h,(hl)			;63af
	ld l,a			;63b0
	jp L_6203		;63b1
L_63B4:
	ld (ix+01fh),a		;63b4
L_63B7:
	inc hl			;63b7
	inc hl			;63b8
	inc hl			;63b9
	jp L_6203		;63ba
L_63BD:
	ld c,a			;63bd
	ld a,(0c124h)		;63be
	or a			;63c1
	jr z,L_63C8		;63c2
	ld a,000h		;63c4
	jr L_63CC		;63c6
L_63C8:
	ld a,c			;63c8
	inc a			;63c9
	inc a			;63ca
	inc a			;63cb
L_63CC:
	ld (ix+004h),a		;63cc
	ld a,(hl)			;63cf
	rrca			;63d0
	rrca			;63d1
	rrca			;63d2
	rrca			;63d3
	and 00fh		;63d4
	ld (ix+005h),a		;63d6
	ld a,(hl)			;63d9
	inc hl			;63da
	and 00fh		;63db
	inc a			;63dd
	ld (ix+006h),a		;63de
	jp L_6203		;63e1
L_63E4:
	ld a,c			;63e4
	and 00fh		;63e5
	jr z,L_63EF		;63e7
	ld (ix+003h),a		;63e9
	jp L_6203		;63ec
L_63EF:
	ld a,(ix+01fh)		;63ef
	dec a			;63f2
	jr z,L_6409		;63f3
	jp p,L_63FA		;63f5
	ld a,(hl)			;63f8
	dec a			;63f9
L_63FA:
	ld (ix+01fh),a		;63fa
	inc hl			;63fd
	ld a,(hl)			;63fe
	ld e,a			;63ff
	ld a,l			;6400
	sub e			;6401
	ld l,a			;6402
	jr nc,L_6406		;6403
	dec h			;6405
L_6406:
	jp L_6203		;6406
L_6409:
	inc hl			;6409
	inc hl			;640a
	ld (ix+01fh),000h		;640b
	jp L_6203		;640f
L_6412:
	ld a,c			;6412
	and 00fh		;6413
	cp 006h		;6415
	jr c,L_6443		;6417
	jr z,L_644D		;6419
	cp 008h		;641b
	jr z,L_6456		;641d
	cp 009h		;641f
	jr z,L_6470		;6421
	cp 00ah		;6423
	jr z,L_6480		;6425
	cp 00ch		;6427
	jr z,L_6487		;6429
	cp 00dh		;642b
	jr z,L_6497		;642d
	cp 00eh		;642f
	jr z,L_64A5		;6431
	cp 00fh		;6433
	jr z,L_64AE		;6435
	set 6,(ix+002h)		;6437
	ld a,(hl)			;643b
	inc hl			;643c
	ld (ix+01ah),a		;643d
	jp L_6203		;6440
L_6443:
	neg		;6443
	add a,006h		;6445
	ld (ix+007h),a		;6447
	jp L_6203		;644a
L_644D:
	ld l,(ix+01bh)		;644d
	ld h,(ix+01ch)		;6450
	jp L_6203		;6453
L_6456:
	ld a,(hl)			;6456
	bit 7,a		;6457
	jr nz,L_6468		;6459
	res 0,(ix+002h)		;645b
	inc hl			;645f
	and 07fh		;6460
	ld (ix+008h),a		;6462
	jp L_6203		;6465
L_6468:
	set 0,(ix+002h)		;6468
	inc hl			;646c
	jp L_6203		;646d
L_6470:
	ld a,(hl)			;6470
	or a			;6471
	jr z,L_6478		;6472
	ld a,001h		;6474
	jr L_6478		;6476
L_6478:
	xor a			;6478
	inc hl			;6479
	ld (0c11eh),a		;647a
	jp L_6203		;647d
L_6480:
	ld a,(hl)			;6480
	inc hl			;6481
	ld h,(hl)			;6482
	ld l,a			;6483
	jp L_6203		;6484
L_6487:
	res 4,(ix+002h)		;6487
	set 2,(ix+014h)		;648b
	ld a,(hl)			;648f
	inc hl			;6490
	ld (ix+019h),a		;6491
	jp L_6203		;6494
L_6497:
	ld e,(hl)			;6497
	inc hl			;6498
	ld d,(hl)			;6499
	inc hl			;649a
	ld (ix+012h),l		;649b
	ld (ix+013h),h		;649e
	ex de,hl			;64a1
	jp L_6203		;64a2
L_64A5:
	ld l,(ix+012h)		;64a5
	ld h,(ix+013h)		;64a8
	jp L_6203		;64ab
L_64AE:
	ld e,(hl)			;64ae
	inc hl			;64af
	ld d,(hl)			;64b0
	inc hl			;64b1
	ld (ix+01bh),l		;64b2
	ld (ix+01ch),h		;64b5
	ex de,hl			;64b8
	jp L_6203		;64b9
L_64BC:
	ld a,(0c10dh)		;64bc
	inc a			;64bf
	ld b,a			;64c0
	ld a,07fh		;64c1
L_64C3:
	rlca			;64c3
	djnz L_64C3		;64c4
	ld b,a			;64c6
	ld a,(0c11dh)		;64c7
	and b			;64ca
	ld (0c11dh),a		;64cb
	jp L_6074		;64ce
L_64D1:
	ld ix,0c0bch		;64d1
	jr L_64ED		;64d5
L_64D7:
	ld ix,0c01ch		;64d7
	jr L_64ED		;64db
L_64DD:
	ld ix,0c044h		;64dd
	jr L_64ED		;64e1
L_64E3:
	ld ix,0c06ch		;64e3
	jr L_64ED		;64e7
L_64E9:
	ld ix,0c094h		;64e9
L_64ED:
	call L_64F4		;64ed
	ret nc			;64f0
	jp L_6074		;64f1
L_64F4:
	dec (ix+00eh)		;64f4
	jp nz,L_66C0		;64f7
	ld a,(ix+00fh)		;64fa
	ld (ix+00eh),a		;64fd
	ld l,(ix+00ch)		;6500
	ld h,(ix+00dh)		;6503
L_6506:
	ld a,(hl)			;6506
	ld c,a			;6507
	cp 0ffh		;6508
	jp z,L_66C2		;650a
	bit 1,(ix+002h)		;650d
	jr nz,L_6558		;6511
	inc hl			;6513
	cp 0feh		;6514
	jp z,L_65CE		;6516
	cp 0fdh		;6519
	jp z,L_65E4		;651b
	cp 028h		;651e
	jp z,L_6633		;6520
	cp 027h		;6523
	jp z,L_6624		;6525
	cp 026h		;6528
	jp z,L_6618		;652a
	cp 025h		;652d
	jp z,L_6611		;652f
	cp 024h		;6532
	jp z,L_6603		;6534
	cp 02ch		;6537
	jp z,L_6656		;6539
	and 0f0h		;653c
	cp 020h		;653e
	jp z,L_665F		;6540
	cp 010h		;6543
	jr nz,L_656E		;6545
	ld a,c			;6547
	and 00fh		;6548
	rlca			;654a
	ld e,a			;654b
	ld a,006h		;654c
	call 00093h		;654e   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,(hl)			;6551
	inc hl			;6552
	ld c,a			;6553
	and 0f0h		;6554
	jr L_656E		;6556
L_6558:
	ld a,c			;6558
	ld e,a			;6559
	inc hl			;655a
	ld (ix+00ch),l		;655b
	ld (ix+00dh),h		;655e
	ld a,(hl)			;6561
	cp 027h		;6562
	jp nz,L_60C5		;6564
	res 1,(ix+002h)		;6567
	jp L_60C5		;656b
L_656E:
	rrca			;656e
	rrca			;656f
	rrca			;6570
	rrca			;6571
	sub (ix+01eh)		;6572
	jr nc,L_6578		;6575
	xor a			;6577
L_6578:
	ld (0c126h),a		;6578
	ld a,c			;657b
	and 00fh		;657c
	ld d,a			;657e
	ld e,(hl)			;657f
	inc hl			;6580
	ld (ix+00ch),l		;6581
	ld (ix+00dh),h		;6584
	call L_60B9		;6587
	bit 0,(ix+002h)		;658a
	jr nz,L_659B		;658e
	ld a,(0c124h)		;6590
	or a			;6593
	jr z,L_659B		;6594
L_6596:
	ld e,000h		;6596
L_6598:
	jp L_60D4		;6598
L_659B:
	bit 4,(ix+00ah)		;659b
	ld a,(0c126h)		;659f
	ld e,a			;65a2
	jr nz,L_65B8		;65a3
	ld a,(0c10dh)		;65a5
	cp 003h		;65a8
	jr nc,L_6598		;65aa
	ld a,(0c11ch)		;65ac
	ld d,a			;65af
	ld a,e			;65b0
	sub d			;65b1
	jr c,L_6596		;65b2
	ld e,a			;65b4
	jp L_60D4		;65b5
L_65B8:
	ld a,(0c11bh)		;65b8
	or a			;65bb
	jr nz,L_65C9		;65bc
	bit 4,(ix+002h)		;65be
	jr nz,L_65C9		;65c2
	ld a,00dh		;65c4
	jp 00093h		;65c6   ; BIOS WRTPSG - Writes data to PSG-register
L_65C9:
	ld e,010h		;65c9
	jp L_60D4		;65cb
L_65CE:
	ld a,(ix+011h)		;65ce
	dec a			;65d1
	jr z,L_65DF		;65d2
	jp p,L_65D9		;65d4
	ld a,(hl)			;65d7
	dec a			;65d8
L_65D9:
	inc hl			;65d9
	ld (ix+011h),a		;65da
	jr L_65F3		;65dd
L_65DF:
	ld (ix+011h),a		;65df
	jr L_65FD		;65e2
L_65E4:
	ld a,(ix+01dh)		;65e4
	dec a			;65e7
	jr z,L_65FA		;65e8
	jp p,L_65EF		;65ea
	ld a,(hl)			;65ed
	dec a			;65ee
L_65EF:
	inc hl			;65ef
	ld (ix+01dh),a		;65f0
L_65F3:
	ld a,(hl)			;65f3
	inc hl			;65f4
	ld h,(hl)			;65f5
	ld l,a			;65f6
	jp L_6506		;65f7
L_65FA:
	ld (ix+01dh),a		;65fa
L_65FD:
	inc hl			;65fd
	inc hl			;65fe
	inc hl			;65ff
	jp L_6506		;6600
L_6603:
	ld e,(hl)			;6603
	inc hl			;6604
	ld d,(hl)			;6605
	inc hl			;6606
	ld (ix+020h),l		;6607
	ld (ix+021h),h		;660a
	ex de,hl			;660d
	jp L_6506		;660e
L_6611:
	set 1,(ix+002h)		;6611
	jp L_6506		;6615
L_6618:
	set 3,(ix+002h)		;6618
	ld a,(hl)			;661c
	ld (ix+01eh),a		;661d
	inc hl			;6620
	jp L_6506		;6621
L_6624:
	ld a,(ix+002h)		;6624
	and 0f5h		;6627
	ld (ix+002h),a		;6629
	xor a			;662c
	ld (ix+01eh),a		;662d
	jp L_6506		;6630
L_6633:
	ld a,(ix+01dh)		;6633
	dec a			;6636
	jr z,L_664D		;6637
	jp p,L_663E		;6639
	ld a,(hl)			;663c
	dec a			;663d
L_663E:
	ld (ix+01dh),a		;663e
	inc hl			;6641
	ld a,(hl)			;6642
	ld e,a			;6643
	ld a,l			;6644
	sub e			;6645
	ld l,a			;6646
	jr nc,L_664A		;6647
	dec h			;6649
L_664A:
	jp L_6506		;664a
L_664D:
	inc hl			;664d
	inc hl			;664e
	ld (ix+01dh),000h		;664f
	jp L_6506		;6653
L_6656:
	ld l,(ix+020h)		;6656
	ld h,(ix+021h)		;6659
	jp L_6506		;665c
L_665F:
	bit 0,c		;665f
	jr nz,L_6671		;6661
	bit 1,c		;6663
	jr nz,L_666C		;6665
	call L_60DC		;6667
	jr L_667D		;666a
L_666C:
	call L_60F1		;666c
	jr L_667D		;666f
L_6671:
	bit 1,c		;6671
	jr nz,L_667A		;6673
	call L_60EA		;6675
	jr L_667D		;6678
L_667A:
	call L_60E3		;667a
L_667D:
	ld a,c			;667d
	rlca			;667e
	and 010h		;667f
	ld (ix+00ah),a		;6681
	ld e,a			;6684
	call L_60D4		;6685
	ld a,(hl)			;6688
	inc hl			;6689
	ld (ix+00eh),a		;668a
	ld (ix+00fh),a		;668d
	ld a,c			;6690
	cp 020h		;6691
	jr z,L_66BA		;6693
	cp 028h		;6695
	jp c,L_6506		;6697
	bit 2,c		;669a
	jr z,L_66A5		;669c
	set 4,(ix+002h)		;669e
	jp L_6506		;66a2
L_66A5:
	res 4,(ix+002h)		;66a5
	ld e,(hl)			;66a9
	inc hl			;66aa
	ld a,00ch		;66ab
	call 00093h		;66ad   ; BIOS WRTPSG - Writes data to PSG-register
	ld e,(hl)			;66b0
	inc hl			;66b1
	ld a,00bh		;66b2
	call 00093h		;66b4   ; BIOS WRTPSG - Writes data to PSG-register
	jp L_6506		;66b7
L_66BA:
	ld (ix+00ch),l		;66ba
	ld (ix+00dh),h		;66bd
L_66C0:
	or a			;66c0
	ret			;66c1
L_66C2:
	scf			;66c2
	ret			;66c3

; ----------------------------------------------------------------------
; DATOS efectos: 37 palabras: el efecto 1-0x25 (p00:586D: p13:66C2[A]) y el
;   0x70-0x7F (p00:5894: p13:66C4[A & 15]); lo leen p00:56E3 (74 bytes)
;   0x66c4..0x670e  (74 bytes)
DATA_efectos:
	defb 04ch,069h	; 66c4
	defb 062h,06bh	; 66c6
	defb 059h,069h	; 66c8
	defb 0dbh,067h	; 66ca
	defb 0e0h,068h	; 66cc
	defb 078h,068h	; 66ce
	defb 002h,068h	; 66d0
	defb 02ch,06eh	; 66d2
	defb 0d9h,06bh	; 66d4
	defb 090h,069h	; 66d6
	defb 067h,069h	; 66d8
	defb 03dh,068h	; 66da
	defb 01dh,068h	; 66dc
	defb 02eh,068h	; 66de
	defb 023h,069h	; 66e0
	defb 08eh,067h	; 66e2
	defb 04ch,06ah	; 66e4
	defb 066h,06ah	; 66e6
	defb 07fh,06ah	; 66e8
	defb 0f8h,069h	; 66ea
	defb 08fh,06ah	; 66ec
	defb 0bdh,067h	; 66ee
	defb 007h,06bh	; 66f0
	defb 0fbh,068h	; 66f2
	defb 036h,06bh	; 66f4
	defb 091h,068h	; 66f6
	defb 0a2h,068h	; 66f8
	defb 0d7h,069h	; 66fa
	defb 0b6h,069h	; 66fc
	defb 019h,06ah	; 66fe
	defb 0bbh,06ah	; 6700
	defb 0b3h,068h	; 6702
	defb 0b8h,06bh	; 6704
	defb 07bh,06bh	; 6706
	defb 021h,06bh	; 6708
	defb 0efh,06dh	; 670a
	defb 059h,06eh	; 670c

; ----------------------------------------------------------------------
; DATOS sonidos_40: 5 x 3 palabras: los tres canales de los sonidos 0x40-0x44
;   (p00:580B: p13:670E[(A & 0x3F) * 6]); lo leen p00:57E6 (30 bytes)
;   0x670e..0x672c  (30 bytes)
DATA_sonidos_40:
	defb 0f0h,06ch,061h,06dh,090h,06dh	; 670e
	defb 0f2h,06eh,02eh,06fh,06ah,06fh	; 6714
	defb 0e8h,06bh,040h,06ch,074h,06ch	; 671a
	defb 02ch,06eh,058h,06eh,058h,06eh	; 6720
	defb 0e8h,06bh,040h,06ch,073h,06ch	; 6726

; ----------------------------------------------------------------------
; DATOS musicas: 16 x 3 palabras: los tres canales de las musicas 0x80-0x8F
;   (p00:5775: p13:672C[(A & 0x7F) * 6]); lo leen p00:56E3 (96 bytes)
;   0x672c..0x678c  (96 bytes)
DATA_musicas:
	defb 031h,070h,028h,071h,026h,072h	; 672c
	defb 017h,073h,007h,075h,0feh,073h	; 6732
	defb 0b9h,076h,0feh,077h,0abh,078h	; 6738
	defb 0b4h,079h,054h,07ah,017h,07bh	; 673e
	defb 0b1h,07ch,0aeh,07dh,016h,07fh	; 6744
	defb 017h,073h,090h,076h,0feh,073h	; 674a
	defb 0f0h,081h,0fch,081h,04dh,082h	; 6750
	defb 035h,080h,0bah,080h,02dh,081h	; 6756
	defb 035h,080h,0bah,080h,02dh,081h	; 675c
	defb 0cah,08ah,068h,08bh,0f4h,08bh	; 6762
	defb 0cfh,088h,00fh,089h,0d9h,089h	; 6768
	defb 0ebh,086h,064h,087h,0cdh,087h	; 676e
	defb 01ah,083h,0cfh,084h,04ah,086h	; 6774
	defb 06fh,08ch,081h,08ch,098h,08ch	; 677a
	defb 0c4h,08ch,0eeh,08ch,027h,08dh	; 6780
	defb 0c2h,06fh,0c2h,06fh,0c2h,06fh	; 6786

; ----------------------------------------------------------------------
; DATOS resto_678C: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (2 bytes)
;   0x678c..0x678e  (2 bytes)
DATA_resto_678C:
	defb 0c2h,06fh	; 678c

; ----------------------------------------------------------------------
; DATOS envolvente_678E: envolvente o efecto (p13:6506), recorrido desde
;   p13:66C4, 670E y p14:8D65; lo leen p13:6506 (1692 bytes)
;   0x678e..0x6e2a  (1692 bytes)
DATA_envolvente_678E:
	defb 022h,002h,060h,0e0h,070h,0f0h,081h,000h,091h,010h,0a1h,020h,0b1h,030h,0c1h,040h	; 678e  ".`.p...... .0.@
	defb 0c1h,050h,0d1h,060h,0d1h,070h,0d1h,080h,0d1h,090h,0d1h,0a0h,0d1h,0b0h,0d1h,0c0h	; 679e  .P.`.p..........
	defb 022h,003h,0a1h,070h,0a1h,080h,091h,090h,091h,0a0h,081h,0b0h,071h,0c0h,0ffh,022h	; 67ae  "..p........q.."
	defb 002h,0e4h,030h,0c2h,0a0h,0e3h,060h,0d4h,010h,0c6h,000h,023h,002h,018h,0c0h,015h	; 67be  ..0...`....#....
	defb 0c0h,02ah,0b0h,01ah,0b0h,022h,0b0h,014h,0a0h,020h,0a0h,022h,0ffh,023h,001h,01fh	; 67ce  .*..."... .".#..
	defb 0a0h,080h,080h,020h,0d2h,001h,0d2h,000h,0c4h,000h,000h,000h,01ah,0c5h,000h,0c6h	; 67de  ... ............
	defb 000h,0c7h,000h,0d8h,000h,000h,000h,018h,0c9h,000h,0cah,000h,000h,000h,016h,0bbh	; 67ee  ................
	defb 000h,0bch,000h,0ffh,022h,001h,0e3h,000h,0e3h,040h,0e4h,000h,0e3h,000h,0d3h,040h	; 67fe  ...."....@.....@
	defb 0d4h,000h,022h,002h,0d3h,010h,0c3h,030h,0b3h,050h,0b3h,070h,0a3h,080h,0ffh,022h	; 680e  .."....0.P.p..."
	defb 001h,0d1h,000h,0e1h,010h,000h,000h,0d0h,090h,0e0h,078h,0d0h,090h,0c0h,09ah,0ffh	; 681e  ..........x.....
	defb 022h,001h,0c0h,0aah,0e0h,0c0h,000h,000h,0d1h,000h,0e2h,000h,0c1h,000h,0ffh,022h	; 682e  ".............."
	defb 001h,0e1h,000h,0e1h,010h,000h,000h,0e0h,090h,0e0h,078h,0e0h,090h,0e0h,09ah,0d0h	; 683e  ..........x.....
	defb 0f0h,0d1h,000h,000h,000h,0d0h,080h,0d0h,068h,0d0h,080h,0d0h,08ah,0b0h,0e0h,0b0h	; 684e  ........h.......
	defb 0f0h,000h,000h,0b0h,070h,0b0h,058h,0b0h,070h,0b0h,07ah,090h,0d0h,090h,0e0h,000h	; 685e  ....p.X.p.z.....
	defb 000h,090h,060h,090h,048h,090h,060h,090h,06ah,0ffh,022h,001h,0a0h,060h,0b0h,06ah	; 686e  ..`.H.`.j."..`.j
	defb 022h,002h,0c0h,065h,0b0h,060h,0b0h,050h,0b0h,053h,0b0h,054h,0b0h,055h,0a0h,056h	; 687e  "..e.`.P.S.T.U.V
	defb 0a0h,05ah,0ffh,022h,001h,0d0h,058h,020h,005h,022h,001h,0a0h,057h,080h,056h,022h	; 688e  .Z."..X ."..W.V"
	defb 003h,060h,058h,0ffh,022h,001h,0d0h,05dh,020h,005h,022h,001h,0a0h,05bh,080h,05ah	; 689e  .`X."..] ."..[.Z
	defb 022h,003h,060h,05ch,0ffh,022h,001h,0f2h,0a0h,0f4h,000h,0f5h,000h,020h,001h,022h	; 68ae  ".`\."....... ."
	defb 002h,0f5h,000h,024h,0d3h,068h,026h,003h,024h,0d3h,068h,026h,005h,024h,0d3h,068h	; 68be  ...$.h&.$.h&.$.h
	defb 094h,000h,094h,0e0h,0ffh,0f4h,0e0h,0f4h,0c0h,0f4h,0a0h,0f4h,070h,0f4h,040h,0f4h	; 68ce  ............p.@.
	defb 010h,02ch,022h,001h,0e3h,000h,0d3h,020h,0d3h,080h,0c2h,0e8h,0c2h,0d0h,0b2h,0b8h	; 68de  .,".... ........
	defb 0b2h,0a0h,0a2h,088h,0a2h,060h,092h,048h,092h,030h,082h,024h,0ffh,023h,001h,01fh	; 68ee  .....`.H.0.$.#..
	defb 0e0h,080h,021h,001h,01ah,0d0h,000h,000h,000h,018h,0e0h,000h,017h,0d0h,000h,016h	; 68fe  ..!.............
	defb 0c0h,000h,015h,0b0h,000h,014h,0a0h,000h,013h,090h,000h,012h,080h,000h,011h,070h	; 690e  ...............p
	defb 000h,010h,060h,000h,0ffh,022h,001h,0c0h,0d0h,025h,090h,0b0h,000h,000h,000h,000h	; 691e  ..`.."...%......
	defb 0b0h,070h,090h,000h,000h,000h,000h,0b5h,075h,095h,000h,000h,000h,000h,0bah,07ah	; 692e  .p......u......z
	defb 09ah,000h,000h,000h,000h,0c0h,080h,0a0h,027h,0b0h,085h,0a0h,08bh,0ffh,022h,001h	; 693e  ........'.....".
	defb 0e0h,053h,0b0h,050h,022h,002h,060h,050h,040h,04fh,0ffh,023h,001h,01fh,0d3h,000h	; 694e  .S.P".`P@O.#....
	defb 0a0h,000h,000h,018h,090h,000h,070h,000h,0ffh,023h,001h,018h,0e1h,000h,022h,001h	; 695e  ......p..#....".
	defb 0d1h,030h,0d1h,04ah,0d1h,080h,023h,001h,01fh,0d1h,000h,022h,001h,0c1h,02ah,0c1h	; 696e  .0.J..#...."..*.
	defb 03ah,0b1h,060h,0b1h,0a0h,0b2h,000h,0a2h,050h,092h,0b0h,083h,030h,073h,0c0h,064h	; 697e  :.`.....P...0s.d
	defb 030h,0ffh,023h,001h,01fh,093h,000h,01dh,0a2h,000h,01eh,0a3h,099h,01ch,0d1h,079h	; 698e  0.#............y
	defb 01fh,0c3h,099h,0c1h,079h,023h,002h,01eh,0d2h,099h,0e2h,079h,0b1h,079h,0a2h,000h	; 699e  ....y#.....y.y..
	defb 01fh,081h,0c0h,072h,060h,063h,000h,0ffh,024h,0c4h,069h,026h,003h,024h,0c4h,069h	; 69ae  ...r`c..$.i&.$.i
	defb 026h,006h,024h,0c4h,069h,0ffh,022h,001h,0c2h,0a0h,0d1h,080h,0e2h,020h,0c0h,070h	; 69be  &.$.i."...... .p
	defb 0b1h,010h,0b0h,077h,0a1h,028h,020h,002h,02ch,022h,001h,0e1h,053h,0e1h,0b6h,0d2h	; 69ce  ...w.( .,"..S...
	defb 0b5h,0d2h,0f0h,0d4h,0a0h,0e0h,0adh,0e0h,0cah,0d4h,0f0h,0d3h,004h,0d2h,0afh,0c1h	; 69de  ................
	defb 099h,0b0h,0a6h,0a0h,0a0h,092h,000h,080h,095h,0ffh,022h,002h,0d0h,010h,0d0h,011h	; 69ee  ..........".....
	defb 0d0h,012h,000h,000h,0a0h,010h,0a0h,011h,0a0h,012h,000h,000h,080h,010h,080h,011h	; 69fe  ................
	defb 080h,012h,000h,000h,060h,010h,060h,011h,060h,012h,0ffh,022h,001h,0f0h,000h,0f1h	; 6a0e  ....`.`.`.."....
	defb 0e0h,0e0h,000h,0e0h,020h,0e0h,060h,0e0h,0c0h,0e1h,040h,0e1h,0e0h,0d0h,000h,0d1h	; 6a1e  .... .`...@.....
	defb 0e0h,0c0h,000h,0c0h,020h,0c0h,060h,0c0h,0c0h,0c1h,040h,0c1h,0e0h,0b2h,000h,0b2h	; 6a2e  .... .`...@.....
	defb 0e0h,0a2h,000h,0a2h,020h,0a2h,060h,0a2h,0c0h,0a2h,040h,0a2h,0e0h,0ffh,023h,002h	; 6a3e  .... .`...@...#.
	defb 01fh,0d1h,000h,013h,0b1h,01ah,01fh,0a1h,000h,018h,0b1h,010h,0c1h,000h,016h,0b1h	; 6a4e  ................
	defb 025h,01fh,0a1h,000h,018h,091h,02ah,0ffh,022h,002h,090h,040h,0a0h,041h,0b0h,042h	; 6a5e  %.....*."..@.A.B
	defb 0c0h,043h,0c0h,044h,0c0h,045h,0c0h,046h,0c0h,047h,0b0h,048h,0a0h,049h,090h,04ah	; 6a6e  .C.D.E.F.G.H.I.J
	defb 0ffh,029h,007h,002h,000h,018h,070h,000h,022h,001h,0a0h,060h,0d0h,0a0h,0e0h,0c0h	; 6a7e  .)....p."..`....
	defb 0ffh,022h,001h,0d0h,040h,0d0h,090h,0d0h,0f0h,0d1h,071h,0d2h,00dh,000h,000h,024h	; 6a8e  ."..@.....q....$
	defb 0b0h,06ah,026h,002h,024h,0b0h,06ah,026h,004h,024h,0b0h,06ah,026h,006h,024h,0b0h	; 6a9e  .j&.$.j&.$.j&.$.
	defb 06ah,0ffh,0e1h,0f5h,0e1h,040h,0e1h,030h,0feh,004h,0b0h,06ah,02ch,024h,0f2h,06ah	; 6aae  j....@.0...j,$.j
	defb 024h,0e5h,06ah,026h,001h,024h,0e5h,06ah,026h,002h,024h,0e5h,06ah,026h,003h,024h	; 6abe  $.j&.$.j&.$.j&.$
	defb 0e5h,06ah,026h,004h,024h,0e5h,06ah,026h,005h,024h,0e5h,06ah,026h,006h,024h,0e5h	; 6ace  .j&.$.j&.$.j&.$.
	defb 06ah,026h,007h,024h,0e5h,06ah,0ffh,0f3h,0e9h,0f5h,0ceh,0f7h,034h,0f3h,0b6h,0f5h	; 6ade  j&.$.j......4...
	defb 09eh,0f7h,0e9h,02ch,022h,001h,0f2h,026h,0f2h,09fh,0f3h,01dh,0e2h,059h,0e2h,0bdh	; 6aee  ...,"..&.....Y..
	defb 0e3h,03dh,0f2h,0b6h,0f3h,09eh,0f4h,0e9h,02ch,022h,001h,024h,012h,06bh,026h,004h	; 6afe  .=......,".$.k&.
	defb 024h,012h,06bh,0ffh,0d0h,062h,0c0h,040h,0b0h,030h,0a0h,042h,0a0h,05ch,020h,002h	; 6b0e  $.k..b.@.0.B.\ .
	defb 022h,001h,02ch,022h,001h,0c0h,050h,0c0h,04ah,0a0h,045h,0a0h,040h,090h,042h,090h	; 6b1e  ".,"..P.J.E.@.B.
	defb 044h,020h,002h,0feh,005h,021h,06bh,0ffh,022h,001h,0c0h,090h,0c0h,070h,0c0h,090h	; 6b2e  D ...!k."....p..
	defb 000h,000h,000h,000h,0c0h,090h,025h,070h,090h,070h,08eh,070h,08eh,070h,08ch,027h	; 6b3e  ......%p.p.p.p.'
	defb 0d0h,070h,025h,08ah,070h,088h,070h,086h,070h,084h,027h,0e0h,070h,025h,082h,070h	; 6b4e  .p%.p.p.p.'.p%.p
	defb 081h,070h,080h,0ffh,022h,002h,0b0h,02ah,0c0h,02bh,0b0h,02ah,022h,003h,0b0h,02bh	; 6b5e  .p.."..*.+.*"..+
	defb 0a0h,02ah,0a0h,02bh,090h,02ah,080h,02bh,070h,02ah,060h,02ah,0ffh,022h,003h,0d0h	; 6b6e  .*.+.*.+p*`*."..
	defb 080h,0f0h,040h,0e0h,018h,0d0h,02ah,0c0h,03ah,0b0h,070h,0d0h,040h,0c0h,018h,0b0h	; 6b7e  ..@...*.:.p.@...
	defb 02ah,0a0h,03ah,0b0h,055h,0b0h,040h,0a0h,018h,090h,02ah,080h,03ah,090h,055h,090h	; 6b8e  *.:.U.@...*.:.U.
	defb 040h,080h,018h,070h,02ah,060h,03ah,070h,055h,070h,040h,060h,018h,050h,02ah,040h	; 6b9e  @..p*`:pUp@`.P*@
	defb 03ah,050h,055h,050h,040h,030h,018h,030h,02ah,0ffh,020h,003h,022h,001h,0c0h,050h	; 6bae  :PUP@0.0*. ."..P
	defb 0b0h,06eh,0c0h,071h,020h,002h,022h,001h,0b0h,052h,0a0h,070h,0b0h,073h,0a0h,052h	; 6bbe  .n.q ."..R.p.s.R
	defb 090h,070h,080h,073h,060h,052h,040h,070h,030h,073h,0ffh,022h,001h,0e3h,005h,0a0h	; 6bce  .p.s`R@p0s."....
	defb 040h,0b0h,03ah,0c0h,040h,0d0h,044h,0c0h,04ah,0ffh,020h,002h,022h,001h,024h,01dh	; 6bde  @.:.@.D.J. .".$.
	defb 06ch,026h,002h,024h,01dh,06ch,026h,003h,024h,01dh,06ch,026h,004h,024h,01dh,06ch	; 6bee  l&.$.l&.$.l&.$.l
	defb 026h,005h,024h,01dh,06ch,026h,006h,024h,01dh,06ch,026h,007h,024h,01dh,06ch,026h	; 6bfe  &.$.l&.$.l&.$.l&
	defb 008h,024h,01dh,06ch,026h,009h,024h,01dh,06ch,026h,00ah,024h,01dh,06ch,0ffh,0f0h	; 6c0e  .$.l&.$.l&.$.l..
	defb 030h,0f0h,050h,0f0h,080h,0e0h,0c0h,0e1h,010h,0e1h,070h,0d1h,0e0h,0d2h,060h,0f0h	; 6c1e  0.P.......p...`.
	defb 020h,0f0h,040h,0e0h,070h,0e0h,0b0h,0d1h,000h,0d1h,060h,0d1h,0d0h,0d2h,050h,000h	; 6c2e   .@.p.....`...P.
	defb 000h,02ch,023h,001h,016h,024h,01dh,06ch,026h,002h,024h,01dh,06ch,026h,003h,024h	; 6c3e  .,#..$.l&.$.l&.$
	defb 01dh,06ch,026h,004h,024h,01dh,06ch,026h,005h,024h,01dh,06ch,026h,006h,024h,01dh	; 6c4e  .l&.$.l&.$.l&.$.
	defb 06ch,026h,007h,024h,01dh,06ch,026h,008h,024h,01dh,06ch,026h,009h,024h,01dh,06ch	; 6c5e  l&.$.l&.$.l&.$.l
	defb 026h,00ah,024h,01dh,06ch,0ffh,023h,003h,016h,0f0h,010h,0f0h,020h,000h,000h,0feh	; 6c6e  &.$.l.#..... ...
	defb 002h,077h,06ch,0e0h,010h,0e0h,020h,000h,000h,0feh,002h,081h,06ch,0d0h,010h,0d0h	; 6c7e  .wl... .....l...
	defb 020h,000h,000h,0feh,002h,08bh,06ch,0c0h,010h,0c0h,020h,000h,000h,0feh,002h,095h	; 6c8e   .....l... .....
	defb 06ch,0b0h,010h,0b0h,020h,000h,000h,0feh,002h,09fh,06ch,0a0h,010h,0a0h,020h,000h	; 6c9e  l... .....l... .
	defb 000h,0feh,002h,0a9h,06ch,090h,010h,090h,020h,000h,000h,0feh,002h,0b3h,06ch,080h	; 6cae  ....l... .....l.
	defb 010h,080h,020h,000h,000h,0feh,002h,0bdh,06ch,070h,010h,070h,020h,000h,000h,0feh	; 6cbe  .. .....lp.p ...
	defb 002h,0c7h,06ch,060h,010h,060h,020h,000h,000h,0feh,002h,0d1h,06ch,050h,010h,050h	; 6cce  ..l`.` .....lP.P
	defb 020h,000h,000h,0feh,002h,0dbh,06ch,040h,010h,040h,020h,000h,000h,0feh,002h,0e5h	; 6cde   .....l@.@ .....
	defb 06ch,0ffh,020h,002h,022h,004h,0e0h,040h,0f0h,030h,0f0h,020h,020h,005h,022h,004h	; 6cee  l. ."..@.0.  .".
	defb 0d0h,020h,0b0h,040h,0c0h,030h,0c0h,020h,020h,005h,022h,004h,0a0h,020h,0a0h,040h	; 6cfe  . .@.0.  .".. .@
	defb 0b0h,030h,0b0h,020h,020h,005h,022h,004h,090h,020h,090h,040h,0a0h,030h,0a0h,020h	; 6d0e  .0.  .".. .@.0.
	defb 020h,005h,022h,004h,080h,020h,080h,040h,090h,030h,090h,020h,020h,005h,022h,004h	; 6d1e   .".. .@.0.  .".
	defb 070h,020h,070h,040h,080h,030h,080h,020h,020h,005h,022h,004h,060h,020h,060h,040h	; 6d2e  p p@.0.  .".` `@
	defb 070h,030h,070h,020h,020h,005h,022h,004h,050h,020h,050h,040h,060h,030h,060h,020h	; 6d3e  p0p  .".P P@`0`
	defb 020h,005h,022h,004h,040h,020h,040h,040h,050h,030h,050h,020h,020h,005h,022h,004h	; 6d4e   .".@ @@P0P  .".
	defb 030h,020h,0ffh,022h,004h,0b0h,060h,0c0h,050h,0c0h,040h,0c0h,030h,0b0h,022h,020h	; 6d5e  0 ."..`.P.@.0."
	defb 005h,022h,004h,0a0h,022h,000h,000h,090h,022h,000h,000h,080h,022h,000h,000h,070h	; 6d6e  .".."..."..."..p
	defb 022h,000h,000h,060h,022h,000h,000h,050h,022h,000h,000h,040h,022h,000h,000h,030h	; 6d7e  "..`"..P"..@"..0
	defb 022h,0ffh,020h,004h,022h,004h,0c0h,041h,0d0h,031h,0d0h,021h,020h,005h,022h,004h	; 6d8e  ". ."..A.1.! .".
	defb 0b0h,021h,090h,041h,0a0h,031h,0a0h,021h,020h,005h,022h,004h,080h,021h,080h,041h	; 6d9e  .!.A.1.! ."..!.A
	defb 090h,031h,090h,021h,020h,005h,022h,004h,070h,021h,070h,041h,080h,031h,080h,021h	; 6dae  .1.! .".p!pA.1.!
	defb 020h,005h,022h,004h,060h,021h,060h,041h,070h,031h,070h,021h,020h,005h,022h,004h	; 6dbe   .".`!`Ap1p! .".
	defb 050h,021h,050h,041h,060h,031h,060h,021h,020h,005h,022h,004h,040h,021h,040h,041h	; 6dce  P!PA`1`! .".@!@A
	defb 050h,031h,050h,021h,020h,005h,022h,004h,030h,021h,030h,041h,040h,031h,040h,021h	; 6dde  P1P! .".0!0A@1@!
	defb 0ffh,022h,001h,0f4h,000h,0a4h,0a0h,000h,000h,000h,000h,000h,000h,024h,01dh,06eh	; 6dee  ."...........$.n
	defb 026h,001h,024h,01dh,06eh,026h,002h,024h,01dh,06eh,026h,003h,024h,01dh,06eh,026h	; 6dfe  &.$.n&.$.n&.$.n&
	defb 004h,024h,01dh,06eh,026h,005h,024h,01dh,06eh,026h,006h,024h,01dh,06eh,0ffh,0e4h	; 6e0e  .$.n&.$.n&.$.n..
	defb 000h,0e0h,000h,0e4h,0a0h,0e0h,000h,0feh,004h,01dh,06eh,02ch	; 6e1e  ..........n,

; ----------------------------------------------------------------------
; DATOS resto_6E2A: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (2 bytes)
;   0x6e2a..0x6e2c  (2 bytes)
DATA_resto_6E2A:
	defb 0ffh,0ffh	; 6e2a

; ----------------------------------------------------------------------
; DATOS envolvente_6E2C: envolvente o efecto (p13:6506), recorrido desde
;   p13:66C4, 670E y p14:8D65; lo leen p13:6506 (378 bytes)
;   0x6e2c..0x6fa6  (378 bytes)
DATA_envolvente_6E2C:
	defb 023h,001h,018h,093h,080h,0a3h,000h,0b2h,0a0h,0b2h,050h,0b2h,000h,070h,000h,021h	; 6e2c  #.........P..p.!
	defb 001h,01ah,0c0h,01bh,0b0h,021h,002h,01ch,0b0h,000h,0a0h,000h,01dh,0a0h,000h,090h	; 6e3c  .....!..........
	defb 000h,01eh,090h,000h,080h,000h,01fh,080h,000h,070h,000h,0ffh,0ffh,022h,001h,0a0h	; 6e4c  .........p..."..
	defb 010h,0b0h,011h,0c0h,010h,020h,003h,022h,002h,0e0h,016h,0e0h,017h,020h,003h,022h	; 6e5c  ..... ."..... ."
	defb 002h,0f0h,019h,0f0h,01ah,020h,003h,022h,002h,0f0h,01bh,0f0h,01ch,0e0h,010h,0e0h	; 6e6c  ..... ."........
	defb 011h,0e0h,010h,020h,003h,022h,002h,0e0h,016h,0e0h,017h,020h,003h,022h,002h,0e0h	; 6e7c  ... ."..... ."..
	defb 019h,0e0h,01ah,020h,003h,022h,002h,0e0h,01bh,0e0h,01ch,0d0h,010h,0d0h,011h,0d0h	; 6e8c  ... ."..........
	defb 010h,020h,003h,022h,002h,0d0h,016h,0d0h,017h,020h,003h,022h,002h,0d0h,019h,0d0h	; 6e9c  . ."..... ."....
	defb 01ah,020h,003h,022h,002h,0d0h,01bh,0d0h,01ch,0d0h,010h,0c0h,011h,0c0h,010h,020h	; 6eac  . ."...........
	defb 003h,022h,002h,0c0h,016h,0c0h,017h,020h,003h,022h,002h,0c0h,019h,0c0h,01ah,020h	; 6ebc  ."..... .".....
	defb 003h,022h,002h,0c0h,01bh,0c0h,01ch,0b0h,010h,0b0h,011h,0b0h,010h,020h,003h,022h	; 6ecc  ."........... ."
	defb 002h,0b0h,016h,0b0h,017h,020h,003h,022h,002h,0b0h,019h,0b0h,01ah,020h,003h,022h	; 6edc  ..... ."..... ."
	defb 002h,0b0h,01bh,0b0h,01ch,0ffh,023h,004h,024h,025h,06fh,026h,001h,024h,025h,06fh	; 6eec  ......#.$%o&.$%o
	defb 026h,002h,024h,025h,06fh,026h,003h,024h,025h,06fh,026h,004h,024h,025h,06fh,026h	; 6efc  &.$%o&.$%o&.$%o&
	defb 005h,024h,025h,06fh,026h,006h,024h,025h,06fh,026h,007h,024h,025h,06fh,026h,008h	; 6f0c  .$%o&.$%o&.$%o&.
	defb 024h,025h,06fh,026h,009h,024h,025h,06fh,0ffh,0f0h,024h,0f0h,01fh,0e0h,01fh,0d0h	; 6f1c  $%o&.$%o..$.....
	defb 01fh,02ch,022h,004h,024h,061h,06fh,026h,001h,024h,061h,06fh,026h,002h,024h,061h	; 6f2c  .,".$ao&.$ao&.$a
	defb 06fh,026h,003h,024h,061h,06fh,026h,004h,024h,061h,06fh,026h,005h,024h,061h,06fh	; 6f3c  o&.$ao&.$ao&.$ao
	defb 026h,006h,024h,061h,06fh,026h,007h,024h,061h,06fh,026h,008h,024h,061h,06fh,026h	; 6f4c  &.$ao&.$ao&.$ao&
	defb 009h,024h,061h,06fh,0ffh,0f0h,025h,0f0h,020h,0e0h,020h,0d0h,020h,02ch,022h,004h	; 6f5c  .$ao..%. . . ,".
	defb 024h,09dh,06fh,026h,001h,024h,09dh,06fh,026h,002h,024h,09dh,06fh,026h,003h,024h	; 6f6c  $.o&.$.o&.$.o&.$
	defb 09dh,06fh,026h,004h,024h,09dh,06fh,026h,005h,024h,09dh,06fh,026h,006h,024h,09dh	; 6f7c  .o&.$.o&.$.o&.$.
	defb 06fh,026h,007h,024h,09dh,06fh,026h,008h,024h,09dh,06fh,026h,009h,024h,09dh,06fh	; 6f8c  o&.$.o&.$.o&.$.o
	defb 0ffh,0f0h,026h,0f0h,021h,0e0h,021h,0d0h,021h,02ch	; 6f9c  ..&.!.!.!,

; ----------------------------------------------------------------------
; DATOS pista_6FA6: pista de musica (p13:6203), recorrida desde p13:672C; lo
;   leen p13:6203 (27 bytes)
;   0x6fa6..0x6fc1  (27 bytes)
DATA_pista_6FA6:
	defb 0d1h,0fbh,083h,0e1h,004h,074h,044h,074h,0fbh,023h,0e0h,009h,0ffh,0d1h,0f9h,021h	; 6fa6  .....tDt.#.....!
	defb 0e7h,001h,0e0h,004h,074h,044h,074h,0f8h,031h,009h,0ffh	; 6fb6  ....tDt.1..

; ----------------------------------------------------------------------
; DATOS resto_6FC1: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (1 bytes)
;   0x6fc1..0x6fc2  (1 bytes)
DATA_resto_6FC1:
	defb 0ffh	; 6fc1

; ----------------------------------------------------------------------
; DATOS pista_6FC2: pista de musica (p13:6203), recorrida desde p13:672C; lo
;   leen p13:6203 (1071 bytes)
;   0x6fc2..0x73f1  (1071 bytes)
DATA_pista_6FC2:
	defb 0ffh,0f9h,011h,0e1h,0c3h,041h,001h,021h,071h,0f6h,010h,071h,0f9h,011h,071h,074h	; 6fc2  .....A.!q..q..qt
	defb 0f6h,010h,070h,0f9h,011h,050h,040h,027h,0f6h,010h,021h,0f9h,011h,0c1h,0e2h,091h	; 6fd2  ..p..P@'..!.....
	defb 0e1h,041h,023h,0eeh,0f9h,011h,0ech,041h,0e0h,001h,0e1h,0b1h,091h,0b1h,0f6h,010h	; 6fe2  .A#....A........
	defb 0b1h,0f9h,011h,0e0h,003h,041h,0f7h,010h,041h,0f9h,011h,021h,029h,0f6h,010h,021h	; 6ff2  .....A..A..!)..!
	defb 0f9h,011h,0e0h,001h,0e1h,0b1h,0e0h,001h,023h,001h,0eeh,0e8h,001h,011h,020h,020h	; 7002  ........#.....
	defb 0e8h,080h,0e6h,090h,0f6h,010h,091h,0f9h,011h,091h,091h,0e6h,0f9h,011h,0ech,041h	; 7012  ...............A
	defb 0e1h,0c3h,091h,0f6h,010h,091h,0f9h,011h,075h,0f6h,010h,071h,0f9h,011h,0e6h,0d5h	; 7022  ........u..q....
	defb 0ech,041h,0edh,0c3h,06fh,001h,0e2h,0b1h,0e1h,000h,0e2h,0b0h,097h,0f6h,010h,091h	; 7032  .A..o...........
	defb 0efh,00dh,070h,0edh,0c3h,06fh,071h,099h,0f6h,010h,091h,0f3h,000h,091h,0efh,00dh	; 7042  ..p..oq.........
	defb 070h,0edh,0e6h,06fh,0e1h,0b1h,042h,0f6h,010h,040h,0f9h,021h,0e2h,041h,071h,091h	; 7052  p..o..B..@.!.Aq.
	defb 0b1h,091h,071h,041h,0edh,0e6h,06fh,021h,0ech,032h,045h,0f6h,010h,041h,0e8h,001h	; 7062  ..qA..o!.2E..A..
	defb 010h,010h,0e8h,080h,0f9h,011h,041h,0f6h,010h,041h,0f9h,011h,071h,0f6h,010h,071h	; 7072  ......A..A..q..q
	defb 0efh,01eh,070h,041h,021h,002h,0e2h,0efh,015h,070h,0e1h,001h,021h,0f6h,010h,021h	; 7082  ..pA!....p..!..!
	defb 0f9h,011h,021h,0f6h,010h,021h,0d1h,0f8h,000h,004h,0f9h,010h,02eh,0f8h,000h,009h	; 7092  ..!..!..........
	defb 0d5h,0f9h,011h,0ech,043h,049h,0f6h,010h,041h,0f9h,013h,0ech,041h,041h,041h,071h	; 70a2  ....CI..A...AAAq
	defb 0efh,01eh,070h,0e0h,041h,021h,002h,0e1h,0efh,015h,070h,0e0h,041h,021h,0f6h,010h	; 70b2  ..p.A!....p.A!..
	defb 021h,0f9h,011h,001h,0f6h,010h,001h,0f9h,011h,0e1h,0b2h,072h,091h,0f6h,010h,091h	; 70c2  !..........r....
	defb 0fah,031h,0e3h,091h,091h,091h,091h,0c5h,0eah,031h,070h,0fah,030h,0e4h,091h,090h	; 70d2  .1.......1p.0...
	defb 090h,0e3h,001h,0e4h,091h,0e3h,021h,0e4h,091h,0e3h,041h,0e4h,071h,0f6h,000h,071h	; 70e2  ......!...A.q..q
	defb 0fah,030h,070h,070h,0b1h,071h,0e3h,001h,0e4h,071h,0e3h,021h,0e4h,071h,0e4h,051h	; 70f2  .0pp.q...q.!.q.Q
	defb 050h,050h,091h,051h,0b1h,051h,0e3h,001h,0e4h,041h,0eeh,0fah,030h,0e4h,091h,090h	; 7102  PP.Q.Q...A..0...
	defb 090h,091h,091h,091h,041h,091h,071h,0f6h,010h,071h,0fah,030h,071h,0f6h,010h,071h	; 7112  ....A.q..q.0q..q
	defb 0fah,030h,071h,023h,073h,0eeh,0d5h,0fah,022h,0e3h,001h,0e4h,071h,091h,0e3h,001h	; 7122  .0q#s..."...q...
	defb 0f7h,000h,001h,0fah,022h,0e4h,071h,091h,0a1h,0f6h,010h,0a1h,0fah,022h,0a1h,093h	; 7132  ....".q......"..
	defb 071h,053h,071h,091h,091h,091h,091h,071h,071h,071h,071h,051h,051h,051h,051h,051h	; 7142  qSq....qqqqQQQQQ
	defb 050h,050h,071h,070h,070h,0fdh,002h,028h,071h,0edh,0ddh,070h,0f6h,010h,041h,0fah	; 7152  PPqpp..(q..p..A.
	defb 030h,040h,040h,071h,091h,0b1h,091h,071h,041h,0edh,0ddh,070h,041h,041h,081h,041h	; 7162  0@@q...qA..pAA.A
	defb 0fah,030h,051h,0e8h,001h,020h,020h,0e8h,080h,0fah,030h,071h,0e8h,001h,020h,020h	; 7172  .0Q..  ...0q..
	defb 0e8h,080h,0edh,00dh,071h,051h,050h,050h,051h,051h,072h,070h,0f6h,010h,071h,0fah	; 7182  ....qQPPQQrp..q.
	defb 030h,091h,0f6h,010h,091h,0fah,030h,091h,0f6h,010h,091h,0fah,030h,091h,041h,040h	; 7192  0.....0.....0.A@
	defb 040h,041h,070h,070h,0edh,00dh,071h,0fbh,031h,051h,051h,051h,050h,050h,072h,070h	; 71a2  @App..q.1QQQPPrp
	defb 0f6h,010h,071h,0fbh,041h,093h,091h,091h,091h,091h,0e8h,001h,001h,011h,020h,020h	; 71b2  ..q.A.........
	defb 0e8h,080h,0eah,028h,071h,0d5h,0f6h,000h,0ech,041h,0e2h,000h,0f7h,000h,000h,0f8h	; 71c2  ...(q....A......
	defb 000h,003h,0f6h,000h,070h,0f7h,000h,070h,0f8h,000h,076h,0f6h,010h,070h,0f6h,000h	; 71d2  ....p..p..v..p..
	defb 0e3h,0a0h,0f7h,000h,0a0h,0f8h,000h,0a3h,0f6h,000h,0e2h,050h,0f7h,000h,050h,0f8h	; 71e2  ...........P..P.
	defb 000h,056h,0f6h,010h,050h,0f9h,011h,0c3h,0e2h,041h,0e1h,001h,0e2h,073h,0eeh,0f9h	; 71f2  .V..P....A...s..
	defb 011h,0ech,041h,0e1h,091h,071h,041h,071h,0f6h,010h,071h,0f9h,011h,093h,0e0h,001h	; 7202  ..A..qAq..q.....
	defb 0f7h,010h,001h,0f9h,011h,0e1h,0b1h,0b9h,0f6h,010h,0b1h,0f9h,011h,0e1h,091h,071h	; 7212  ...............q
	defb 091h,0b3h,091h,0eeh,0e7h,001h,0edh,0c7h,071h,071h,071h,050h,050h,0e3h,091h,0f6h	; 7222  ........qqqPP...
	defb 010h,091h,0f9h,011h,091h,092h,0f5h,010h,090h,0f9h,011h,0b2h,0f5h,010h,0b0h,0edh	; 7232  ................
	defb 0c7h,071h,0e1h,001h,009h,0f6h,010h,001h,0f3h,000h,001h,0f7h,031h,0e3h,071h,070h	; 7242  .q..........1.qp
	defb 070h,0edh,001h,072h,071h,0e2h,0b2h,0f6h,010h,0b0h,0f9h,021h,0e3h,0b1h,0e2h,021h	; 7252  p..rq......!...!
	defb 041h,061h,041h,021h,0e3h,0b1h,0edh,001h,072h,0b1h,0b1h,0f8h,002h,0e3h,040h,080h	; 7262  AaA!....r.....@.
	defb 080h,0e2h,040h,0f9h,012h,0e3h,080h,0b0h,0e2h,040h,080h,0f9h,002h,0e3h,0b0h,0e2h	; 7272  ..@......@......
	defb 040h,080h,0b0h,0f9h,003h,040h,080h,0b0h,0e1h,040h,0c3h,0f9h,011h,0e1h,001h,0f6h	; 7282  @....@...@......
	defb 010h,001h,0f9h,011h,0e2h,0b5h,0f6h,010h,0b1h,0f9h,011h,0e1h,001h,0e2h,0b1h,092h	; 7292  ................
	defb 040h,0f6h,010h,041h,0f9h,011h,041h,041h,091h,0f8h,002h,0e3h,060h,090h,0e2h,020h	; 72a2  @..A..AA....`..
	defb 0e3h,090h,090h,0e2h,020h,060h,020h,020h,060h,090h,060h,060h,090h,0e1h,020h,0e2h	; 72b2  .... `  `.``.. .
	defb 090h,0e3h,080h,0b0h,0e2h,040h,0e3h,0b0h,080h,0e2h,040h,080h,040h,040h,080h,0b0h	; 72c2  .....@....@.@@..
	defb 080h,080h,0b0h,0e1h,040h,0e2h,0b0h,0f9h,011h,0e1h,0c3h,001h,0f6h,010h,001h,0f9h	; 72d2  ....@...........
	defb 011h,0e2h,0b5h,0f6h,010h,0b1h,0f9h,011h,0e0h,001h,0e1h,0b1h,092h,040h,0f6h,010h	; 72e2  .............@..
	defb 041h,0f9h,011h,0e1h,041h,041h,091h,0e1h,0b1h,0f6h,010h,0b1h,0f9h,011h,091h,0f6h	; 72f2  A...AA..........
	defb 010h,091h,0f9h,011h,072h,042h,041h,0f6h,010h,041h,0fah,031h,0e3h,041h,041h,041h	; 7302  ....rBA..A.1.AAA
	defb 041h,0c5h,0eah,026h,072h,0d5h,0f8h,000h,0e1h,041h,031h,0e2h,0b1h,0fdh,004h,01ah	; 7312  A..&r....A1.....
	defb 073h,0e1h,041h,031h,0e2h,0b3h,0e1h,021h,011h,0e2h,091h,0fdh,004h,028h,073h,0e1h	; 7322  s.A1...!.....(s.
	defb 021h,011h,0e2h,093h,0feh,002h,017h,073h,0fah,030h,0e8h,001h,040h,040h,0e8h,080h	; 7332  !......s.0..@@..
	defb 0e2h,0b1h,0b3h,0e1h,011h,013h,021h,023h,041h,049h,0e8h,001h,050h,050h,0fdh,002h	; 7342  ......!#AI..PP..
	defb 040h,073h,0e8h,080h,0e2h,0b1h,0b3h,0e1h,011h,013h,021h,023h,041h,04bh,0f5h,000h	; 7352  @s........!#AK..
	defb 041h,0f4h,000h,041h,0f3h,000h,041h,0c1h,0fah,030h,0e1h,041h,091h,081h,091h,0f3h	; 7362  A..A..A..0.A....
	defb 000h,091h,0e8h,001h,001h,010h,000h,001h,010h,000h,021h,010h,000h,001h,010h,000h	; 7372  ..........!.....
	defb 021h,010h,000h,001h,010h,000h,021h,020h,020h,0e8h,080h,0f9h,011h,0ech,041h,0e1h	; 7382  !.....!  .....A.
	defb 091h,0edh,0c1h,074h,0e2h,0b1h,0e1h,081h,041h,0feh,002h,08dh,073h,0ech,041h,0fah	; 7392  ...t....A...s.A.
	defb 021h,0e1h,065h,015h,093h,085h,015h,0b3h,095h,085h,091h,0e0h,011h,063h,0f3h,000h	; 73a2  !.e..........c..
	defb 061h,0fah,021h,0e1h,067h,020h,040h,063h,081h,097h,0f3h,000h,091h,0fah,021h,083h	; 73b2  a.!.g @c......!.
	defb 091h,0b7h,0f3h,000h,0b1h,0fah,021h,093h,0b1h,0e0h,007h,0f3h,000h,001h,0fah,021h	; 73c2  ......!........!
	defb 0e1h,0b5h,095h,073h,091h,0f3h,000h,093h,0e8h,001h,011h,001h,011h,021h,011h,001h	; 73d2  ...s.........!..
	defb 011h,021h,011h,001h,021h,021h,020h,020h,0e8h,080h,0ech,000h,0eah,017h,073h	; 73e2  .!..!!  ......s

; ----------------------------------------------------------------------
; DATOS resto_73F1: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (13 bytes)
;   0x73f1..0x73fe  (13 bytes)
DATA_resto_73F1:
	defb 0fbh,040h,0e2h,0b1h,0b3h,0e1h,011h,013h,021h,023h,041h,049h,0eeh	; 73f1  .@......!#AI.

; ----------------------------------------------------------------------
; DATOS pista_73FE: pista de musica (p13:6203), recorrida desde p13:672C
;   (sigue en el banco 14, en 0x8000); lo leen p13:6203 (3074 bytes)
;   0x73fe..0x8000  (3074 bytes)
DATA_pista_73FE:
	defb 0e7h,002h,0d5h,0f6h,001h,0e1h,043h,031h,0e2h,0b1h,0e1h,041h,031h,0e2h,0b1h,0fdh	; 73fe  ......C1...A1...
	defb 003h,008h,074h,0e1h,041h,031h,0e2h,0b3h,0e1h,021h,011h,0e2h,091h,0fdh,005h,016h	; 740e  ..t.A1...!......
	defb 074h,0feh,002h,0feh,073h,0e7h,001h,0fah,031h,0e4h,0edh,0b4h,074h,089h,0e7h,004h	; 741e  t...s...1...t...
	defb 0e3h,0edh,0b4h,074h,089h,0e7h,001h,0e2h,0edh,0b4h,074h,08bh,0f5h,000h,081h,0f4h	; 742e  ...t......t.....
	defb 000h,081h,0f3h,000h,081h,0e8h,001h,000h,000h,0e8h,080h,0fah,030h,0e2h,0b1h,0e1h	; 743e  ............0...
	defb 041h,041h,011h,0f3h,000h,011h,0cbh,0cfh,0e7h,002h,0ech,041h,0edh,0bdh,074h,0e2h	; 744e  AA.........A..t.
	defb 0b1h,0e1h,081h,0edh,0bdh,074h,0e2h,0e8h,001h,011h,020h,020h,0e8h,080h,0e7h,001h	; 745e  .....t....  ....
	defb 0ech,041h,0fah,021h,0e1h,015h,0e2h,095h,0e1h,063h,055h,0e2h,0b5h,0e1h,053h,045h	; 746e  .A.!.....cU...SE
	defb 045h,041h,091h,033h,0f3h,000h,031h,0fah,021h,0e1h,037h,0f7h,000h,021h,0fah,021h	; 747e  EA.3..1.!.7..!.!
	defb 023h,041h,067h,0f3h,000h,061h,0fah,021h,043h,061h,087h,0f3h,000h,081h,0fah,021h	; 748e  #Ag..a.!Ca.....!
	defb 053h,071h,097h,0f3h,000h,091h,0fah,021h,075h,025h,023h,041h,0f3h,000h,043h,0c9h	; 749e  Sq.....!u%#A..C.
	defb 0cfh,0ech,000h,0eah,0feh,073h,0c1h,021h,023h,041h,043h,061h,063h,081h,0eeh,0f6h	; 74ae  .....s.!#ACac...
	defb 000h,0e1h,093h,041h,011h,081h,041h,011h,091h,041h,0b3h,041h,0e0h,011h,0e1h,041h	; 74be  ...A..A..A.A...A
	defb 0e1h,0b1h,091h,0b1h,081h,041h,011h,061h,041h,011h,081h,041h,091h,041h,011h,081h	; 74ce  .....A.aA..A.A..
	defb 041h,011h,091h,0b1h,0e1h,061h,041h,0e2h,091h,0e1h,061h,041h,0e2h,091h,0e1h,061h	; 74de  A....aA...aA...a
	defb 041h,0fdh,002h,0e2h,074h,0e1h,081h,041h,0e2h,0b1h,0fdh,002h,0f3h,074h,0e1h,091h	; 74ee  A...t..A.....t..
	defb 041h,0b1h,041h,0e2h,0b1h,0e1h,091h,041h,0eeh,0d5h,0f7h,000h,0e3h,041h,0f8h,000h	; 74fe  A.A....A.....A..
	defb 041h,0f9h,000h,049h,0f8h,000h,041h,0f7h,000h,043h,0f9h,000h,0e4h,0b5h,083h,041h	; 750e  A..I..A..C.....A
	defb 0f7h,000h,091h,0f8h,000h,091h,0f9h,000h,09bh,0f7h,000h,091h,0f9h,000h,091h,0e3h	; 751e  ................
	defb 011h,041h,093h,081h,0f7h,000h,081h,0fdh,002h,007h,075h,0d5h,0fah,030h,0e4h,0b0h	; 752e  .A........u..0..
	defb 0b0h,0e3h,061h,0b1h,0e4h,0b1h,0e3h,011h,041h,0e2h,011h,0e3h,021h,061h,0e2h,021h	; 753e  ..a.....A...!a.!
	defb 0e3h,041h,0b1h,0e2h,041h,0e3h,041h,0f6h,011h,0e2h,041h,0e3h,041h,0fdh,003h,039h	; 754e  .A..A.A...A.A..9
	defb 075h,0e7h,000h,0f8h,021h,043h,0e8h,001h,050h,050h,060h,060h,070h,070h,080h,080h	; 755e  u...!C..PP``pp..
	defb 011h,020h,020h,0e8h,080h,0fah,031h,0e3h,091h,0e4h,091h,091h,0fdh,002h,075h,075h	; 756e  .  ...1.......uu
	defb 0e3h,091h,0e4h,091h,0feh,002h,075h,075h,0fah,030h,0e3h,091h,0e4h,090h,090h,091h	; 757e  ......uu.0......
	defb 0e3h,093h,0e4h,091h,0e3h,091h,0e4h,091h,0fdh,002h,086h,075h,0e3h,061h,0e4h,060h	; 758e  ...........u.a.`
	defb 060h,061h,0e3h,063h,0e4h,061h,0e3h,061h,0e4h,061h,0fdh,002h,09ah,075h,0e3h,021h	; 759e  `a.c.a.a.a...u.!
	defb 0e4h,020h,020h,021h,0e3h,023h,0e4h,021h,0e3h,021h,0e4h,021h,0fdh,002h,0ach,075h	; 75ae  .  !.#.!.!.!...u
	defb 0edh,0aeh,076h,040h,040h,0e3h,041h,0e4h,041h,0edh,0aeh,076h,041h,0e3h,041h,0e4h	; 75be  ..v@@.A.A..vA.A.
	defb 040h,040h,0fah,023h,0e3h,091h,0e4h,090h,090h,091h,0e3h,090h,090h,0e4h,091h,090h	; 75ce  @@.#............
	defb 090h,0e3h,091h,0e4h,090h,090h,0fdh,002h,0d0h,075h,0e3h,061h,0e4h,060h,060h,061h	; 75de  .........u.a.``a
	defb 0e3h,060h,060h,0e4h,061h,060h,060h,0e3h,061h,0e4h,060h,060h,0fdh,002h,0e8h,075h	; 75ee  .``.a``.a.``...u
	defb 0e3h,021h,0e4h,020h,020h,021h,0e3h,020h,020h,0e4h,021h,020h,020h,0e3h,021h,0e4h	; 75fe  .!.  !.  .!  .!.
	defb 020h,020h,0fdh,002h,0feh,075h,0e3h,041h,0e4h,040h,040h,041h,0e3h,040h,040h,0e4h	; 760e    ...u.A.@@A.@@.
	defb 041h,040h,040h,0e3h,041h,0e4h,040h,040h,0fdh,002h,014h,076h,0e4h,061h,060h,090h	; 761e  A@@.A.@@...v.a`.
	defb 091h,0e3h,011h,0e4h,061h,061h,091h,0e3h,011h,0e4h,051h,050h,080h,081h,0e3h,011h	; 762e  ....aa....QP....
	defb 0e4h,051h,051h,081h,0e3h,011h,0e4h,041h,040h,080h,081h,0b1h,041h,041h,081h,0b1h	; 763e  .QQ....A@...AA..
	defb 031h,030h,060h,061h,0b1h,031h,031h,061h,0b1h,021h,020h,020h,021h,021h,021h,021h	; 764e  10`a.11a.!  !!!!
	defb 021h,021h,041h,040h,040h,041h,041h,041h,041h,041h,041h,051h,050h,050h,051h,051h	; 765e  !!A@@AAAAAAQPPQQ
	defb 051h,051h,051h,051h,071h,070h,070h,071h,071h,071h,071h,071h,071h,0fah,031h,0e3h	; 766e  QQQQqppqqqqqq.1.
	defb 091h,0e4h,091h,091h,0e3h,091h,0e4h,091h,090h,090h,0e3h,091h,0e4h,091h,0fdh,002h	; 767e  ................
	defb 07bh,076h,0d5h,0fah,022h,0e3h,041h,041h,040h,040h,041h,0fdh,00dh,098h,076h,0e4h	; 768e  {v..".AA@@A...v.
	defb 091h,091h,090h,090h,091h,0fdh,00dh,0a2h,076h,0feh,002h,090h,076h,0eah,039h,075h	; 769e  ........v...v.9u
	defb 0e3h,041h,0e4h,040h,040h,041h,0e3h,041h,0e4h,041h,0eeh,0d6h,0f9h,013h,0ech,043h	; 76ae  .A.@@A.A.A.....C
	defb 0e2h,0edh,0a2h,077h,037h,0ech,000h,0fah,023h,041h,0f7h,013h,041h,0f9h,013h,021h	; 76be  ...w7...#A..A..!
	defb 0ech,043h,0e2h,0bfh,0ech,000h,0f9h,033h,0e1h,001h,0f9h,013h,0e2h,0bfh,0f9h,024h	; 76ce  .C.....3.......$
	defb 0edh,0ach,077h,0f7h,000h,0edh,0b7h,077h,0fah,023h,041h,0f7h,013h,041h,0fah,023h	; 76de  ..w....w.#A..A.#
	defb 001h,0f7h,013h,001h,0e8h,009h,0b0h,0edh,095h,077h,0e8h,080h,0f8h,012h,0e3h,0b0h	; 76ee  .........w......
	defb 0e2h,0edh,095h,077h,0e1h,0f9h,034h,0edh,09dh,077h,0f7h,034h,0edh,09dh,077h,0f5h	; 76fe  ...w..4..w.4..w.
	defb 034h,0edh,09dh,077h,0f3h,034h,0edh,09dh,077h,0f9h,013h,0ech,052h,0e1h,001h,021h	; 770e  4..w.4..w...R..!
	defb 031h,07fh,0f8h,001h,030h,020h,0f9h,013h,001h,021h,031h,071h,06dh,041h,03fh,0fah	; 771e  1...0 ...!1qmA?.
	defb 033h,0edh,0dbh,077h,0f9h,013h,0e2h,0edh,0c0h,077h,041h,0f9h,011h,0e3h,0edh,0c9h	; 772e  3..w.....wA.....
	defb 077h,040h,0f9h,013h,0e1h,0edh,0ebh,077h,090h,0b1h,0e1h,031h,041h,081h,091h,081h	; 773e  w@.....w...1A...
	defb 041h,031h,025h,040h,050h,067h,045h,090h,080h,023h,043h,0f9h,013h,0ech,053h,0e2h	; 774e  A1%@PgE..#C...S.
	defb 045h,031h,083h,0b1h,0e1h,027h,0e2h,0b1h,081h,0b1h,051h,021h,0e1h,041h,0e2h,0b1h	; 775e  E1...'....Q!.A..
	defb 0f7h,011h,0b1h,0f8h,013h,0e2h,041h,0e3h,0b1h,0f6h,011h,0b1h,0f7h,013h,0e1h,041h	; 776e  ......A........A
	defb 0e2h,0b1h,0f5h,011h,0b1h,0f8h,033h,0e2h,041h,051h,021h,041h,001h,021h,0e3h,0b1h	; 777e  ......3.AQ!A.!..
	defb 0feh,002h,059h,077h,0eah,0b9h,076h,020h,040h,080h,090h,080h,040h,020h,0eeh,020h	; 778e  ..Yw..v @...@ .
	defb 040h,080h,090h,0eeh,091h,0e1h,011h,021h,041h,081h,091h,041h,021h,0eeh,091h,0b1h	; 779e  @......!A..A!...
	defb 0e1h,031h,041h,071h,040h,030h,001h,041h,0eeh,0d3h,030h,040h,0fdh,008h,0b8h,077h	; 77ae  .1Aq@0.A..0@...w
	defb 0d6h,0eeh,0b1h,0e1h,031h,041h,061h,0a1h,0b1h,061h,0eeh,0b0h,0e2h,030h,040h,060h	; 77be  ....1Aa..a...0@`
	defb 0a0h,0b0h,060h,040h,0b0h,0e1h,030h,040h,060h,0a0h,0b0h,060h,0eeh,001h,021h,061h	; 77ce  ..`@..0@`..`..!a
	defb 071h,0a1h,070h,060h,031h,073h,061h,021h,033h,061h,071h,061h,0eeh,070h,070h,060h	; 77de  q.p`1sa!3aqa.pp`
	defb 020h,0e2h,070h,070h,060h,020h,0e3h,060h,070h,090h,0e2h,010h,020h,060h,070h,0eeh	; 77ee   .pp` .`p... `p.
	defb 0d6h,0fah,032h,0e4h,0edh,09bh,078h,091h,0a1h,0edh,09bh,078h,091h,080h,050h,041h	; 77fe  ..2...x....x..PA
	defb 080h,090h,0b1h,090h,080h,041h,040h,040h,0b1h,051h,041h,040h,040h,041h,040h,040h	; 780e  .....A@@.QA@@A@@
	defb 041h,041h,041h,081h,0feh,002h,002h,078h,0e3h,0edh,0a3h,078h,001h,0e8h,001h,0a1h	; 781e  AAA....x...x....
	defb 091h,0e8h,080h,000h,000h,0edh,0a3h,078h,0e4h,0b1h,0e3h,030h,040h,061h,040h,030h	; 782e  .......x...0@a@0
	defb 0fdh,003h,036h,078h,0e4h,0b1h,0e3h,030h,040h,0e8h,001h,0a1h,0a1h,0e8h,080h,0feh	; 783e  ..6x...0@.......
	defb 002h,027h,078h,021h,0fdh,008h,051h,078h,041h,041h,030h,041h,040h,0fdh,002h,056h	; 784e  .'x!..QxAA0A@..V
	defb 078h,021h,020h,020h,020h,020h,020h,020h,021h,021h,021h,020h,030h,041h,041h,030h	; 785e  x!      !!! 0AA0
	defb 041h,040h,041h,041h,040h,0e4h,0b0h,080h,040h,0fbh,033h,0e4h,030h,041h,040h,0e8h	; 786e  A@AA@...@.3.0A@.
	defb 001h,0a1h,0e8h,080h,041h,0fdh,006h,07ah,078h,030h,040h,0f8h,023h,0e3h,041h,051h	; 787e  ....A..zx0@.#.AQ
	defb 021h,041h,001h,021h,0e4h,0b1h,0feh,002h,077h,078h,0eah,0feh,077h,091h,090h,090h	; 788e  !A.!....wx..w...
	defb 0fdh,003h,09bh,078h,0eeh,001h,000h,000h,0fdh,003h,0a3h,078h,0eeh,0d6h,0f6h,003h	; 789e  ...x.......x....
	defb 0e7h,002h,0ech,043h,0e2h,090h,0edh,0a2h,077h,036h,0ech,000h,0f9h,023h,011h,0f6h	; 78ae  ...C....w6...#..
	defb 013h,011h,0f7h,003h,020h,021h,0e2h,0b0h,0f8h,023h,0e3h,0b0h,0e2h,030h,040h,060h	; 78be  .... !...#...0@`
	defb 0a0h,0b0h,0a0h,060h,0e3h,0b5h,0e8h,001h,0a1h,0e8h,080h,0f7h,013h,0e2h,08bh,0e8h	; 78ce  ...`............
	defb 001h,0a1h,0a1h,0e8h,080h,0f8h,034h,0edh,0ach,077h,0f6h,000h,0edh,0b7h,077h,0f9h	; 78de  ......4..w....w.
	defb 023h,001h,0f6h,013h,001h,0f9h,023h,0e2h,091h,0f6h,013h,091h,0e8h,00ah,0b0h,0edh	; 78ee  #.....#.........
	defb 095h,077h,0e8h,080h,0f6h,002h,0e3h,0b0h,0b0h,0e2h,020h,040h,080h,090h,080h,040h	; 78fe  .w........ @...@
	defb 0f8h,034h,0e1h,0edh,09dh,077h,0f6h,034h,0edh,09dh,077h,0f4h,034h,0edh,09dh,077h	; 790e  .4...w.4..w.4..w
	defb 0e8h,001h,0a0h,000h,0a0h,0b0h,0e8h,080h,0f8h,013h,0ech,052h,0e2h,001h,021h,031h	; 791e  ...........R..!1
	defb 0afh,0f8h,001h,070h,050h,0f8h,013h,031h,051h,071h,0a1h,0bdh,071h,06fh,0e8h,00ah	; 792e  ...pP..1Qq..qo..
	defb 0edh,0dbh,077h,0f7h,003h,0e8h,080h,0e2h,0b0h,0edh,0c0h,077h,040h,0f6h,000h,0e3h	; 793e  ..w........w@...
	defb 0b0h,0edh,0c9h,077h,0f7h,003h,0e1h,070h,0edh,0ebh,077h,0e7h,000h,0f8h,013h,081h	; 794e  ...w...p..w.....
	defb 0b1h,0b1h,0e1h,041h,041h,041h,0e2h,0b1h,0a1h,025h,040h,050h,067h,085h,0b0h,0b0h	; 795e  ...AAA...%@Pg...
	defb 083h,083h,0e7h,002h,0f7h,003h,0ech,053h,0e2h,042h,045h,041h,083h,0b1h,0e1h,027h	; 796e  .......S.BEA...'
	defb 0e2h,0b1h,081h,0b1h,050h,0e8h,00ah,041h,0b1h,0e8h,001h,021h,0e8h,080h,0e7h,002h	; 797e  ....P..A...!....
	defb 0f8h,013h,0e2h,041h,0e3h,0b1h,0f6h,011h,0b1h,0f7h,013h,0e1h,041h,0e2h,0b1h,0f5h	; 798e  ...A........A...
	defb 011h,0b1h,0e8h,001h,020h,020h,0a1h,0a1h,0b0h,0b0h,0a1h,0a1h,0b1h,0e8h,080h,0feh	; 799e  ....  ..........
	defb 002h,072h,079h,0eah,0abh,078h,0d6h,0fah,031h,0e4h,041h,0e3h,041h,040h,040h,041h	; 79ae  .ry..x..1.A.A@@A
	defb 0edh,026h,07ah,0e3h,051h,0edh,012h,07ah,0e3h,051h,0d0h,005h,007h,0efh,04bh,07ah	; 79be  .&z.Q..z.Q....Kz
	defb 0efh,019h,07ah,0e3h,041h,0edh,02dh,07ah,051h,0edh,041h,07ah,0edh,038h,07ah,0edh	; 79ce  ..z.A.-zQ.Az.8z.
	defb 041h,07ah,0d0h,004h,005h,0edh,038h,07ah,0edh,041h,07ah,0feh,002h,0d7h,079h,0edh	; 79de  Az....8z.Az...y.
	defb 021h,07ah,0e3h,041h,0edh,012h,07ah,0e3h,041h,0d0h,002h,007h,0e4h,041h,0e3h,041h	; 79ee  !z.A..z.A....A.A
	defb 0e4h,051h,0e3h,051h,0e4h,021h,0e3h,021h,0e4h,0b0h,090h,080h,050h,0feh,002h,0edh	; 79fe  .Q.Q.!.!....P...
	defb 079h,0eah,0b4h,079h,0efh,04bh,07ah,0efh,019h,07ah,0eeh,0e4h,041h,0e3h,041h,0e4h	; 7a0e  y..y.Kz..z..A.A.
	defb 040h,040h,0e6h,0efh,019h,07ah,0e3h,041h,0e4h,041h,0e3h,041h,0e4h,041h,0eeh,0efh	; 7a1e  @@...z.A.A.A.A..
	defb 04bh,07ah,0e4h,041h,0e3h,041h,0e4h,020h,040h,0eeh,0e4h,091h,0e3h,091h,0e4h,091h	; 7a2e  Kz.A.A. @.......
	defb 0e3h,091h,0eeh,0e4h,091h,0e3h,091h,0e4h,090h,090h,0e3h,091h,0eeh,0e4h,041h,0e3h	; 7a3e  ..............A.
	defb 041h,0e4h,041h,0e3h,041h,0e6h,0d6h,0c3h,0edh,0c7h,07ah,0e1h,040h,020h,0e2h,0b0h	; 7a4e  A.A.A.....z.@ ..
	defb 090h,0e1h,020h,0e2h,0b0h,090h,080h,0f7h,001h,0ech,03fh,043h,0edh,0c7h,07ah,0e3h	; 7a5e  .. .......?C..z.
	defb 050h,080h,090h,0b0h,0e2h,020h,040h,050h,080h,0edh,0f8h,07ah,047h,0f6h,000h,047h	; 7a6e  P.... @P...zG..G
	defb 0edh,0f8h,07ah,0edh,0b7h,07ah,080h,0b0h,0e1h,040h,0f8h,000h,0e1h,050h,0efh,0c3h	; 7a7e  ..z..z...@...P..
	defb 07bh,050h,043h,0fah,021h,0e2h,0b1h,0f6h,010h,0b1h,0fah,021h,091h,0f6h,010h,091h	; 7a8e  {PC.!......!....
	defb 0fah,021h,081h,0f6h,010h,081h,0f8h,002h,043h,0f8h,000h,0e1h,050h,0edh,0cfh,07bh	; 7a9e  .!......C...P..{
	defb 090h,080h,050h,0d0h,002h,02bh,0eah,054h,07ah,090h,080h,050h,040h,0b0h,090h,080h	; 7aae  ..P..+.Tz..P@...
	defb 050h,0e1h,020h,0e2h,0b0h,090h,080h,040h,0eeh,0fah,031h,0ech,052h,0e1h,041h,0f6h	; 7abe  P. ....@..1.R.A.
	defb 010h,043h,0fah,031h,021h,0f5h,000h,023h,0fah,031h,0e2h,0b5h,0f8h,002h,043h,051h	; 7ace  .C.1!..#.1....CQ
	defb 081h,091h,0f6h,010h,091h,0c1h,0fah,031h,0e1h,041h,0f5h,000h,043h,0fah,031h,021h	; 7ade  .......1.A..C.1!
	defb 0f5h,000h,023h,0fah,031h,0e2h,0b7h,0f8h,001h,0eeh,0f8h,001h,0e2h,095h,0f6h,000h	; 7aee  ..#.1...........
	defb 093h,0f8h,001h,041h,091h,041h,085h,0f6h,000h,083h,0f8h,001h,041h,081h,041h,055h	; 7afe  ...A.A......A.AU
	defb 0f7h,000h,053h,0f8h,001h,041h,051h,081h,0eeh,0d6h,0e7h,002h,0ech,052h,0edh,084h	; 7b0e  ..S..AQ......R..
	defb 07bh,0f6h,001h,0e1h,041h,020h,0e2h,0b0h,090h,0e1h,020h,0e2h,0b0h,090h,0edh,084h	; 7b1e  {...A .... .....
	defb 07bh,0e8h,001h,001h,001h,000h,000h,011h,0e8h,080h,0f6h,001h,0ech,053h,0e2h,098h	; 7b2e  {............S..
	defb 0edh,0a8h,07bh,047h,0f4h,000h,047h,0f6h,001h,095h,0edh,0a8h,07bh,0f7h,001h,0edh	; 7b3e  ..{G..G.....{...
	defb 0b7h,07ah,0e8h,001h,0a1h,0a1h,0e8h,080h,0f6h,001h,0efh,0c3h,07bh,050h,040h,0f9h	; 7b4e  .z..........{P@.
	defb 011h,0e2h,081h,0f6h,010h,081h,0f9h,011h,051h,0f6h,010h,051h,0f9h,011h,041h,0f6h	; 7b5e  ........Q..Q..A.
	defb 010h,041h,0e8h,001h,001h,011h,0e8h,080h,0f6h,001h,0e1h,0c2h,050h,0edh,0cfh,07bh	; 7b6e  .A..........P..{
	defb 0d0h,002h,030h,0eah,017h,07bh,0efh,096h,07bh,0fah,031h,085h,0f6h,000h,045h,051h	; 7b7e  ..0..{..{.1...EQ
	defb 081h,0efh,096h,07bh,0fah,031h,087h,0eeh,0fah,031h,0e5h,041h,0e4h,041h,0e2h,0b1h	; 7b8e  ...{.1...1.A.A..
	defb 0f5h,000h,0b3h,0fah,031h,091h,0f5h,000h,093h,0e6h,0f4h,000h,093h,0f6h,001h,041h	; 7b9e  ....1..........A
	defb 091h,041h,085h,0f4h,000h,083h,0f6h,001h,041h,081h,041h,055h,0f4h,000h,053h,0f6h	; 7bae  .A......A.AU..S.
	defb 001h,041h,051h,081h,0eeh,0e1h,040h,050h,080h,090h,080h,050h,040h,020h,040h,020h	; 7bbe  .AQ...@P...P@ @
	defb 0e6h,0efh,0c3h,07bh,0e2h,090h,0b3h,050h,040h,050h,080h,090h,080h,090h,0b0h,0e1h	; 7bce  ...{...P@P......
	defb 020h,0e2h,0b0h,0e1h,020h,040h,0e2h,0b0h,0eeh,0d6h,0fah,031h,0ech,051h,0e1h,040h	; 7bde   ... @.....1.Q.@
	defb 0f6h,010h,040h,0fah,031h,0e2h,0b0h,0f6h,010h,0b0h,0fah,031h,0e1h,060h,0f6h,010h	; 7bee  ..@.1......1.`..
	defb 060h,0fah,031h,070h,091h,091h,070h,061h,071h,063h,021h,0e2h,0b1h,0f6h,010h,0b1h	; 7bfe  `.1p..paqc!.....
	defb 0fah,031h,0b1h,0e1h,021h,0d3h,0f9h,020h,050h,062h,0d6h,0eeh,0fah,021h,0ech,043h	; 7c0e  .1..!.. Pb...!.C
	defb 0e2h,023h,071h,061h,0f7h,000h,061h,0fah,021h,075h,043h,071h,061h,0f7h,000h,061h	; 7c1e  .#qa..a.!uCqa..a
	defb 0fah,021h,075h,093h,073h,0eeh,0efh,096h,07ch,0e1h,045h,0f6h,010h,041h,0f7h,000h	; 7c2e  .!u.s...|.E..A..
	defb 0e2h,060h,0f8h,000h,060h,0f9h,000h,061h,0f7h,000h,090h,0f8h,000h,090h,0f8h,000h	; 7c3e  .`..`..a........
	defb 091h,0e8h,001h,000h,000h,0e8h,080h,0fah,022h,0e2h,071h,0b1h,0e1h,071h,091h,071h	; 7c4e  ........".q..q.q
	defb 090h,0f6h,010h,090h,0fah,022h,0e0h,020h,0ech,042h,0e1h,0b5h,0f6h,010h,0b0h,0ech	; 7c5e  .....". .B......
	defb 043h,0f8h,002h,0e2h,0b2h,0f6h,010h,0b0h,0f9h,011h,0b1h,093h,0efh,096h,07ch,0e1h	; 7c6e  C.............|.
	defb 047h,0fah,023h,041h,041h,041h,041h,0eeh,0fah,022h,0ech,051h,0e1h,041h,021h,027h	; 7c7e  G.#AAAA..".Q.A!'
	defb 0f6h,010h,021h,0fah,022h,021h,023h,0eeh,0fah,022h,0ech,051h,0e8h,001h,000h,000h	; 7c8e  ..!."!#..".Q....
	defb 0e8h,080h,0fah,022h,0e2h,071h,0b1h,0e1h,071h,061h,0f6h,010h,060h,0fah,022h,022h	; 7c9e  ...".q..qa..`.""
	defb 0e2h,0b1h,0e6h,0edh,0e7h,07bh,0fah,031h,0e1h,041h,0e2h,0b1h,0e1h,061h,070h,091h	; 7cae  .....{.1.A...ap.
	defb 091h,070h,091h,0e0h,021h,0e1h,0b3h,0f6h,010h,0b1h,0f6h,000h,0ech,043h,0e2h,094h	; 7cbe  .p..!........C..
	defb 0e1h,023h,0e2h,0b0h,0edh,0e7h,07bh,0f8h,002h,0e1h,042h,062h,071h,062h,072h,091h	; 7cce  .#....{...Bbqbr.
	defb 065h,0ech,043h,075h,0f6h,010h,071h,0f3h,000h,071h,0edh,01ah,07ch,061h,045h,045h	; 7cde  e.Cu..q..q..|aEE
	defb 060h,040h,035h,0f6h,010h,031h,0edh,01ah,07ch,091h,0f6h,010h,091h,0fah,021h,0e1h	; 7cee  `@5..1..|.....!.
	defb 021h,0ech,044h,0e2h,0b7h,0f7h,010h,0b1h,0f4h,000h,0b1h,0e8h,001h,021h,011h,020h	; 7cfe  !.D..........!.
	defb 020h,0edh,034h,07ch,0edh,086h,07ch,003h,023h,043h,0e2h,0b5h,0e1h,000h,0e2h,0b0h	; 7d0e   .4|..|.#C......
	defb 093h,0f6h,010h,091h,0e8h,001h,020h,020h,0e8h,080h,0edh,034h,07ch,0edh,086h,07ch	; 7d1e  ......  ...4|..|
	defb 0e2h,0b3h,0e1h,061h,0f6h,010h,061h,0fah,022h,092h,0f6h,010h,090h,0fah,022h,041h	; 7d2e  ...a..a."....."A
	defb 0f6h,010h,040h,0fah,022h,063h,0f6h,010h,060h,0fah,022h,071h,0f6h,010h,070h,0fah	; 7d3e  ..@."c..`."q..p.
	defb 022h,092h,0e0h,021h,04dh,0f6h,010h,041h,0cfh,0eah,0b1h,07ch,0e4h,041h,040h,040h	; 7d4e  "..!M..A...|.A@@
	defb 0fah,031h,0e3h,020h,040h,0e4h,0b0h,0b0h,0fbh,041h,021h,020h,020h,0fah,031h,0e3h	; 7d5e  .1. @....A!  .1.
	defb 020h,040h,0e4h,0b0h,0b0h,0fbh,041h,001h,000h,000h,0fah,031h,0e3h,020h,040h,0e4h	; 7d6e   @....A....1. @.
	defb 0b0h,0b0h,0fbh,041h,001h,000h,000h,001h,021h,0fdh,003h,05ah,07dh,0eeh,0e4h,041h	; 7d7e  ...A....!..Z}..A
	defb 040h,040h,0e3h,020h,040h,0e4h,0b0h,0b0h,0e6h,0e4h,071h,070h,070h,0fdh,008h,097h	; 7d8e  @@. @.....qpp...
	defb 07dh,061h,060h,060h,0fdh,004h,09fh,07dh,0b1h,0b0h,0b0h,0fdh,003h,0a6h,07dh,0eeh	; 7d9e  }a``...}......}.
	defb 0d6h,0fah,031h,0efh,08ch,07dh,021h,020h,020h,0e3h,020h,040h,0e4h,0b0h,0b0h,001h	; 7dae  ..1..}!  . @....
	defb 000h,000h,0e3h,020h,040h,0e4h,0b0h,0b0h,0e5h,0b1h,0b0h,0b0h,0e3h,001h,021h,0feh	; 7dbe  ... @.........!.
	defb 003h,0aeh,07dh,0e4h,001h,000h,000h,001h,000h,000h,021h,020h,020h,021h,020h,020h	; 7dce  ..}.......!  !
	defb 0efh,08ch,07dh,0fdh,002h,0deh,07dh,0fbh,041h,0edh,097h,07dh,091h,090h,090h,0edh	; 7dde  ..}...}.A..}....
	defb 097h,07dh,090h,0b0h,060h,090h,0edh,05ah,07dh,0fah,031h,0e4h,071h,070h,070h,0fdh	; 7dee  .}..`..Z}.1.qpp.
	defb 004h,0f7h,07dh,0fbh,041h,001h,000h,000h,0fdh,004h,001h,07eh,021h,020h,020h,0fdh	; 7dfe  ..}.A......~!  .
	defb 003h,00ah,07eh,020h,090h,0e3h,000h,0e4h,0b0h,0edh,05ah,07dh,0fbh,041h,0e4h,071h	; 7e0e  ..~ ......Z}.A.q
	defb 070h,070h,0fdh,004h,01ah,07eh,001h,000h,000h,001h,000h,000h,021h,020h,020h,021h	; 7e1e  pp...~......!  !
	defb 0e8h,001h,010h,010h,0e8h,080h,0fah,030h,0e3h,042h,022h,0e8h,001h,010h,010h,0e8h	; 7e2e  .......0.B".....
	defb 080h,0e4h,0b2h,092h,071h,0fah,031h,0e4h,041h,040h,040h,0e3h,020h,040h,0e4h,090h	; 7e3e  ....q.1.A@@. @..
	defb 0b0h,041h,040h,040h,090h,0b0h,0e3h,020h,040h,0fdh,002h,045h,07eh,0eah,0aeh,07dh	; 7e4e  .A@@... @..E~..}
	defb 0e7h,001h,0d6h,0fah,031h,0ech,051h,0e2h,0b0h,0f6h,010h,0b0h,0fah,031h,070h,0f6h	; 7e5e  ....1.Q......1p.
	defb 010h,070h,0fah,031h,0e1h,020h,0f6h,010h,020h,0fah,031h,040h,021h,021h,020h,021h	; 7e6e  .p.1. .. .1@!! !
	defb 021h,003h,0e2h,071h,071h,0f6h,010h,071h,0fah,031h,071h,0b1h,0d3h,0f7h,020h,020h	; 7e7e  !..qq..q.1q...
	defb 022h,0d6h,0eeh,0efh,0ffh,07eh,0e1h,005h,0f6h,010h,001h,0f7h,000h,0e2h,020h,0f8h	; 7e8e  "....~........ .
	defb 000h,020h,0f9h,000h,021h,0f7h,000h,060h,0f8h,000h,060h,0f9h,000h,061h,0fah,022h	; 7e9e  . ..!..`..`..a."
	defb 0e2h,0c1h,041h,071h,0e1h,041h,061h,041h,060h,0f6h,010h,060h,0fah,022h,090h,076h	; 7eae  ..Aq.AaA`..`.".v
	defb 0f8h,002h,0ech,043h,0e2h,042h,0f6h,010h,040h,0f9h,011h,041h,023h,0efh,0ffh,07eh	; 7ebe  ...C.B..@..A#..~
	defb 0e1h,007h,0fah,023h,001h,001h,001h,001h,0f8h,004h,0e3h,020h,070h,0b0h,0e2h,020h	; 7ece  ...#....... p..
	defb 0e3h,070h,0b0h,0e2h,020h,070h,0f9h,004h,0e3h,0b0h,0e2h,020h,070h,0b0h,020h,070h	; 7ede  .p.. p..... p. p
	defb 0b0h,070h,0f8h,004h,0e3h,040h,070h,0e2h,000h,040h,0e3h,070h,0e2h,000h,040h,070h	; 7eee  .p...@p..@.p..@p
	defb 0eeh,0e7h,001h,0d6h,0fah,022h,0ech,051h,0e2h,0c1h,041h,071h,0e1h,041h,021h,0f6h	; 7efe  .....".Q..Aq.A!.
	defb 010h,020h,0fah,022h,0e2h,0b2h,071h,0e6h,0edh,05eh,07eh,0fah,031h,0e2h,0b1h,071h	; 7f0e  . ."..q..^~.1..q
	defb 0e1h,021h,040h,021h,021h,020h,021h,091h,073h,0f6h,010h,071h,0f8h,003h,0ech,043h	; 7f1e  .!@!! !.s..q...C
	defb 0e2h,093h,0e1h,023h,0e2h,0b1h,0edh,05eh,07eh,0f8h,002h,0ech,043h,0e3h,042h,062h	; 7f2e  ...#...^~...C.Bb
	defb 071h,062h,072h,091h,0ech,051h,0e3h,065h,0ech,043h,045h,0f6h,010h,041h,0e8h,001h	; 7f3e  qbr..Q.e.CE..A..
	defb 020h,020h,0e8h,080h,0e7h,002h,0d3h,0f8h,004h,0e3h,021h,071h,0b1h,0e2h,021h,0e3h	; 7f4e    ........!q..!.
	defb 071h,0b1h,0e2h,021h,071h,0f9h,004h,0e3h,0b1h,0e2h,021h,071h,0b1h,021h,071h,0b1h	; 7f5e  q..!q.....!q.!q.
	defb 071h,0f8h,004h,0e3h,041h,091h,0e2h,011h,041h,0e3h,091h,0e2h,011h,041h,091h,0f9h	; 7f6e  q...A...A....A..
	defb 004h,011h,041h,091h,0e1h,011h,0e2h,041h,091h,0e1h,011h,0e2h,091h,0f8h,004h,0e3h	; 7f7e  ..A....A........
	defb 061h,091h,0e2h,011h,061h,0e3h,091h,0e2h,011h,061h,091h,0f9h,004h,011h,061h,091h	; 7f8e  a...a....a....a.
	defb 0e1h,011h,0e2h,091h,061h,011h,0e3h,091h,0f8h,004h,0e4h,0b1h,0e3h,041h,061h,041h	; 7f9e  ....a........AaA
	defb 0f9h,004h,061h,0b1h,061h,0b1h,0e2h,041h,0e3h,0b1h,0e2h,041h,061h,041h,061h,0b1h	; 7fae  ..a.a..A...AaAa.
	defb 0e7h,000h,061h,0feh,002h,052h,07fh,0edh,091h,07eh,0f9h,004h,000h,040h,070h,0e1h	; 7fbe  ..a..R...~...@p.
	defb 000h,0e2h,040h,070h,0e1h,000h,0e2h,070h,0f8h,004h,0e3h,060h,090h,0e2h,020h,060h	; 7fce  ..@p...p...`.. `
	defb 0e3h,090h,0e2h,020h,060h,090h,0f9h,004h,020h,060h,090h,0e1h,020h,0e2h,060h,090h	; 7fde  ... `... `.. .`.
	defb 0e1h,020h,0e2h,090h,0edh,091h,07eh,0f9h,004h,0e3h,090h,0e2h,020h,060h,090h,0fah	; 7fee  . ....~..... `..
	defb 004h,020h	; 7ffe
