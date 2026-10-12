; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 01 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS ld_partido_cola: los dos ultimos bytes (14 C2, 0xC214) de `ld
;   (0xC214),a`, que empieza en p00:5FFF
;   0x6000..0x6002  (2 bytes)
DATA_ld_partido_cola:
	defb 014h,0c2h	; 6000

; ======================================================================
; CODIGO 0x6002..0x6226  (548 bytes)
; ======================================================================


L_6002:
	ld a,000h		;6002
	jp 056e3h		;6004
L_6007:
	call 054afh		;6007
	call 0b8cch		;600a
	call 05464h		;600d
	xor a			;6010
	ld (0c215h),a		;6011
	jp 05e74h		;6014
L_6017:
	ld hl,0c00ah		;6017
	dec (hl)			;601a
	jr nz,L_602D		;601b
	ld hl,0c009h		;601d
	inc (hl)			;6020
	inc hl			;6021
	call L_603C		;6022
	cp 0ffh		;6025
	jr z,$-41		;6027
	ld hl,0c00ah		;6029
	ld (hl),c			;602c
L_602D:
	call L_603C		;602d
	jp 05002h		;6030
L_6033:
	call 05049h		;6033
	ld hl,0c00fh		;6036
	jp 05005h		;6039
L_603C:
	dec hl			;603c
	ld c,(hl)			;603d
	call 054afh		;603e
	ld a,(0c21dh)		;6041
	ld hl,0bcd6h		;6044
	call 0543ah		;6047
	ld a,c			;604a
	add a,a			;604b
	call 04083h		;604c
	ld a,(hl)			;604f
	inc hl			;6050
	ld c,(hl)			;6051
	push bc			;6052
	push af			;6053
	call 05464h		;6054
	pop af			;6057
	pop bc			;6058
	ret			;6059
L_605A:
	call 0563fh		;605a
	ld a,(0c003h)		;605d
	rra			;6060
	jr c,L_6092		;6061
	ld hl,0c00dh		;6063
	inc (hl)			;6066
	call 04feeh		;6067
	call L_60AD		;606a
	ret c			;606d
	call L_6825		;606e
	call L_620C		;6071
	call 0b68fh		;6074
	call L_7D34		;6077
	call 08b4fh		;607a
	call L_6944		;607d
	call L_6AEB		;6080
	call 08cf6h		;6083
	call 08fabh		;6086
	call 08293h		;6089
	call L_7E12		;608c
	jp L_60CF		;608f
L_6092:
	call L_60E5		;6092
	call L_7663		;6095
	call L_7948		;6098
	call L_7EFD		;609b
	call 082c5h		;609e
	call 08aa0h		;60a1
	call L_71A1		;60a4
	call L_7286		;60a7
	jp 0564ch		;60aa
L_60AD:
	ld a,(0c002h)		;60ad
	and 040h		;60b0
	ret z			;60b2
	ld a,(0c24bh)		;60b3
	cp 004h		;60b6
	ret z			;60b8
	ld a,(0c21ch)		;60b9
	and a			;60bc
	ret nz			;60bd
	ld a,(0c00eh)		;60be
	rra			;60c1
	ret nc			;60c2
	ld a,001h		;60c3
	ld (0c008h),a		;60c5
	ld a,0fdh		;60c8
	call 056e3h		;60ca
	scf			;60cd
	ret			;60ce
L_60CF:
	ld a,(0c20ah)		;60cf
	and a			;60d2
	ret z			;60d3
	ld a,(0c21ch)		;60d4
	and a			;60d7
	ret z			;60d8
	ld a,(0c246h)		;60d9
	cp 0f0h		;60dc
	ret c			;60de
	ld a,001h		;60df
	ld (0c217h),a		;60e1
	ret			;60e4
L_60E5:
	ld hl,0ccb7h		;60e5
	ld a,(hl)			;60e8
	and a			;60e9
	ret z			;60ea
	dec (hl)			;60eb
	ret			;60ec
L_60ED:
	call 04a1fh		;60ed
	call L_611D		;60f0
L_60F3:
	call 04a1fh		;60f3
	call 050c1h		;60f6
	call 05155h		;60f9
	call 0540dh		;60fc
	call 05554h		;60ff
	call 05566h		;6102
	call 046a0h		;6105
	ld a,(0cc14h)		;6108
	call 05b68h		;610b
	call 054b4h		;610e
	call 0b8a5h		;6111
	call 0ba3bh		;6114
	call 0b913h		;6117
	jp 05464h		;611a
L_611D:
	ld a,(0c2b0h)		;611d
	ld (0c240h),a		;6120
	ret			;6123
L_6124:
	ld a,(0cc14h)		;6124
	call 05b68h		;6127
	call 054b4h		;612a
	call 0bd29h		;612d
	call 0baaah		;6130
	call 0b8fbh		;6133
	call 05690h		;6136
	call 0b7f5h		;6139
	push af			;613c
	call 05464h		;613d
	pop af			;6140
	ret			;6141
L_6142:
	call 054b4h		;6142
	call 0baaah		;6145
	jp 05464h		;6148
L_614B:
	call 054b4h		;614b
	call 0b8a5h		;614e
	jp 05464h		;6151
L_6154:
	ld hl,(0e320h)		;6154
	dec l			;6157
	dec l			;6158
	ld (hl),001h		;6159
	ret			;615b
L_615C:
	call 054b4h		;615c
	call 0bd67h		;615f
	call 05464h		;6162
	ld a,(0cc14h)		;6165
	call 05b68h		;6168
	call L_6142		;616b
	call 05690h		;616e
	ld hl,0cc13h		;6171
	inc (hl)			;6174
	inc (hl)			;6175
	inc (hl)			;6176
	ld a,(hl)			;6177
	cp 0f8h		;6178
	ret			;617a
L_617B:
	call L_6142		;617b
	call 05690h		;617e
	ld a,024h		;6181
	call 056e3h		;6183
	ld a,0ffh		;6186
	call 056e3h		;6188
	call 054b4h		;618b
	call 0ba68h		;618e
	jp 05464h		;6191
L_6194:
	ld bc,01020h		;6194
L_6197:
	push bc			;6197
	push hl			;6198
	ld b,c			;6199
	ld c,0ffh		;619a
	ld d,000h		;619c
	call 04b0ch		;619e
	pop hl			;61a1
	inc h			;61a2
	ld b,080h		;61a3
L_61A5:
	push bc			;61a5
	ld b,000h		;61a6
L_61A8:
	djnz L_61A8		;61a8
	pop bc			;61aa
	djnz L_61A5		;61ab
	pop bc			;61ad
	djnz L_6197		;61ae
	ret			;61b0
L_61B1:
	ld a,(0c21dh)		;61b1
	ld b,a			;61b4
	add a,a			;61b5
	add a,a			;61b6
	add a,b			;61b7
	ld d,a			;61b8
	call L_61C2		;61b9
	ld a,b			;61bc
	add a,d			;61bd
	ld (0c211h),a		;61be
	ret			;61c1
L_61C2:
	ld a,(0cc10h)		;61c2
	ld c,a			;61c5
	add a,a			;61c6
	dec c			;61c7
	dec c			;61c8
	ld b,a			;61c9
	jr z,L_61D4		;61ca
	ld a,(0cc13h)		;61cc
	cp 090h		;61cf
	jr c,L_61D4		;61d1
	inc b			;61d3
L_61D4:
	inc b			;61d4
	ret			;61d5
L_61D6:
	ld c,00fh		;61d6
	jr L_61E3		;61d8
L_61DA:
	ld a,(0c24bh)		;61da
	cp 005h		;61dd
	jr z,L_61D6		;61df
	ld c,00ch		;61e1
L_61E3:
	ld hl,0c275h		;61e3
	ld a,(0c007h)		;61e6
	and c			;61e9
	ld b,a			;61ea
	jr z,L_61F8		;61eb
	ld a,(0c006h)		;61ed
	and c			;61f0
	jr nz,L_61F8		;61f1
	ld a,b			;61f3
	and (hl)			;61f4
	jr nz,L_61F8		;61f5
	ld a,b			;61f7
L_61F8:
	ld (hl),a			;61f8
	ret			;61f9
L_61FA:
	ld a,(0c24bh)		;61fa
	cp 004h		;61fd
	ret z			;61ff
	ld a,(ix+005h)		;6200
	or a			;6203
	ret nz			;6204
	xor a			;6205
	ld (0c271h),a		;6206
	jp L_6309		;6209
L_620C:
	call L_6234		;620c
	call L_61FA		;620f
	ld a,(0c271h)		;6212
	or a			;6215
	ret nz			;6216
	call L_61DA		;6217
	call L_6242		;621a
	call L_67CA		;621d
	ld a,(0c24bh)		;6220
	call 0408dh		;6223

; ----------------------------------------------------------------------
; DATOS saltos_6226: tabla de 7 palabras del despachador (call 0x408D en
;   0x6223); lo leen L_408D (14 bytes)
;   0x6226..0x6234  (14 bytes)
DATA_saltos_6226:
	defb 088h,062h	; 6226
	defb 0c5h,064h	; 6228
	defb 029h,066h	; 622a
	defb 063h,066h	; 622c
	defb 0aeh,066h	; 622e
	defb 0fdh,066h	; 6230
	defb 0bfh,067h	; 6232

; ======================================================================
; CODIGO 0x6234..0x6485  (593 bytes)
; ======================================================================


L_6234:
	ld ix,0c2b0h		;6234
	ld a,(0c240h)		;6238
	or a			;623b
	ret z			;623c
	ld ix,0c2d0h		;623d
	ret			;6241
L_6242:
	ld a,(0ccb4h)		;6242
	ld d,a			;6245
	ld a,(0ccb5h)		;6246
	ld e,a			;6249
	or d			;624a
	ret z			;624b
	xor a			;624c
	ld (0ccb4h),a		;624d
	ld (0ccb5h),a		;6250
	inc a			;6253
	ld (0c264h),a		;6254
	ld (0c268h),a		;6257
	ld b,a			;625a
	ld a,d			;625b
	or a			;625c
	jp nz,L_6365		;625d
	ld a,e			;6260
	inc b			;6261
	or a			;6262
	jp nz,L_6365		;6263
	xor a			;6266
	ld (0c264h),a		;6267
	ld (0c268h),a		;626a
	ret			;626d
L_626E:
	ld a,(0c244h)		;626e
	cp 0d0h		;6271
	ccf			;6273
	ret nc			;6274
	ld a,(0c219h)		;6275
	cp 0ffh		;6278
	ccf			;627a
	ret nc			;627b
	ld (ix+005h),000h		;627c
	call L_6309		;6280
	call L_661D		;6283
	scf			;6286
	ret			;6287
L_6288:
	xor a			;6288
	ld (0c255h),a		;6289
	ld a,(0c006h)		;628c
	and 021h		;628f
	jp nz,L_637D		;6291
	ld a,(0c007h)		;6294
	and 002h		;6297
	jp nz,L_6399		;6299
	ld hl,00100h		;629c
	ld (0c247h),hl		;629f
	call L_6614		;62a2
	call L_705A		;62a5
	call L_6620		;62a8
	jr nc,L_62C7		;62ab
	xor a			;62ad
	ld (0c266h),a		;62ae
L_62B1:
	ld a,(0c275h)		;62b1
	and 004h		;62b4
	jp nz,L_6415		;62b6
	ld a,(0c275h)		;62b9
	and 008h		;62bc
	jp nz,L_6411		;62be
	ld a,001h		;62c1
	ld (0c255h),a		;62c3
	ret			;62c6
L_62C7:
	ld a,(0c240h)		;62c7
	cp 001h		;62ca
	jr nz,L_6342		;62cc
	ld a,(0c205h)		;62ce
	and 008h		;62d1
	jr nz,L_62DB		;62d3
	ld a,(ix+006h)		;62d5
	or a			;62d8
	jr nz,L_6342		;62d9
L_62DB:
	ld a,(0c275h)		;62db
	and 00ch		;62de
	jr z,L_6342		;62e0
	ld hl,0c266h		;62e2
	ld a,(hl)			;62e5
	or a			;62e6
	jr z,L_62FC		;62e7
	cp 001h		;62e9
	jr z,L_6342		;62eb
	dec (hl)			;62ed
	ld a,(0c267h)		;62ee
	ld b,a			;62f1
	ld a,(0c275h)		;62f2
	and 00ch		;62f5
	cp b			;62f7
	jr nz,L_6342		;62f8
	jr L_62B1		;62fa
L_62FC:
	ld a,020h		;62fc
	ld (hl),a			;62fe
	ld a,(0c275h)		;62ff
	and 00ch		;6302
	ld (0c267h),a		;6304
	jr L_62B1		;6307
L_6309:
	ld a,08dh		;6309
	call 056e3h		;630b
	xor a			;630e
	ld (0c256h),a		;630f
	ld (0c24fh),a		;6312
	ld a,004h		;6315
	ld (0c24bh),a		;6317
	ld a,080h		;631a
	ld (0c260h),a		;631c
	call 05a56h		;631f
	ld a,(0c246h)		;6322
	sub 008h		;6325
	ld h,a			;6327
	ld a,(0c240h)		;6328
	or a			;632b
	ld b,027h		;632c
	jr z,L_6332		;632e
	ld b,021h		;6330
L_6332:
	ld a,(0c244h)		;6332
	sub b			;6335
	ld l,a			;6336
	ld de,02098h		;6337
	ld bc,01018h		;633a
	ld a,010h		;633d
	jp 04c73h		;633f
L_6342:
	xor a			;6342
	ld (0c266h),a		;6343
	ld (0c265h),a		;6346
	ld a,003h		;6349
	ld (0c24bh),a		;634b
	jp L_6614		;634e
L_6351:
	xor a			;6351
	ld (0c268h),a		;6352
	inc a			;6355
	ld (0c264h),a		;6356
	ld a,(0c24bh)		;6359
	cp 005h		;635c
	jr z,L_636A		;635e
	ld a,(0c250h)		;6360
	inc a			;6363
	ld b,a			;6364
L_6365:
	call L_660C		;6365
	jr L_638D		;6368
L_636A:
	call L_705A		;636a
	jr nc,L_6342		;636d
	ld hl,(0c243h)		;636f
	ld de,00010h		;6372
	or a			;6375
	sbc hl,de		;6376
	ld (0c243h),hl		;6378
	jr L_6342		;637b
L_637D:
	ld a,(0c006h)		;637d
	and 020h		;6380
	jr nz,L_638A		;6382
	call L_70A0		;6384
	jp c,L_63E0		;6387
L_638A:
	call L_65E9		;638a
L_638D:
	xor a			;638d
	ld (0c24eh),a		;638e
	inc a			;6391
	ld (0c251h),a		;6392
	ld (0c24bh),a		;6395
	ret			;6398
L_6399:
	call L_70AC		;6399
	jr nc,L_63B0		;639c
	ld hl,(0c245h)		;639e
	push hl			;63a1
	dec h			;63a2
	dec h			;63a3
	ld (0c245h),hl		;63a4
	call L_70AC		;63a7
	pop hl			;63aa
	ld (0c245h),hl		;63ab
	jr c,L_63E0		;63ae
L_63B0:
	ld a,002h		;63b0
	ld (0c24bh),a		;63b2
	ret			;63b5
L_63B6:
	xor a			;63b6
	ld (0c265h),a		;63b7
	ld (0c264h),a		;63ba
	ld (0c268h),a		;63bd
	ld a,(0ccb0h)		;63c0
	or a			;63c3
	jr nz,L_63D2		;63c4
	ld a,(0c244h)		;63c6
	add a,004h		;63c9
	and 0f8h		;63cb
	add a,003h		;63cd
	ld (0c244h),a		;63cf
L_63D2:
	call L_661D		;63d2
	call L_69AC		;63d5
	xor a			;63d8
	ld (0c266h),a		;63d9
	ld (0c24bh),a		;63dc
	ret			;63df
L_63E0:
	ld a,(0c246h)		;63e0
	and 00fh		;63e3
	cp 008h		;63e5
	ld a,(0c246h)		;63e7
	jr nc,L_63F2		;63ea
	and 0f0h		;63ec
	add a,008h		;63ee
	jr L_63F6		;63f0
L_63F2:
	add a,008h		;63f2
	and 0f0h		;63f4
L_63F6:
	ld (0c246h),a		;63f6
	call L_70AC		;63f9
	jr c,L_640B		;63fc
	call L_70A0		;63fe
	jr c,L_640B		;6401
	ld a,(0c246h)		;6403
	sub 008h		;6406
	ld (0c246h),a		;6408
L_640B:
	ld a,005h		;640b
	ld (0c24bh),a		;640d
	ret			;6410
L_6411:
	ld a,001h		;6411
	jr L_6416		;6413
L_6415:
	xor a			;6415
L_6416:
	ld hl,0c252h		;6416
	inc (hl)			;6419
	call L_645D		;641a
	push de			;641d
	call L_646D		;641e
	pop de			;6421
	call L_644A		;6422
	ret c			;6425
	call L_64AD		;6426
	or a			;6429
	ret			;642a
L_642B:
	ld d,007h		;642b
	call L_644C		;642d
	ret c			;6430
	ld a,(0ccb2h)		;6431
	ld b,a			;6434
	ld a,(0ccb1h)		;6435
	or b			;6438
	scf			;6439
	ret nz			;643a
	ld hl,(0c245h)		;643b
	push hl			;643e
	call L_64AD		;643f
	call L_705A		;6442
	pop hl			;6445
	ld (0c245h),hl		;6446
	ret			;6449
L_644A:
	ld d,006h		;644a
L_644C:
	ld e,0f8h		;644c
	ld a,(0c24ah)		;644e
	cp 080h		;6451
	jr c,L_645A		;6453
	ld a,d			;6455
	neg		;6456
	dec a			;6458
	ld d,a			;6459
L_645A:
	jp L_70D2		;645a
L_645D:
	ld b,a			;645d
	ld a,(0c250h)		;645e
	xor b			;6461
	ld a,b			;6462
	ld (0c250h),a		;6463
	ret z			;6466
	push de			;6467
	call L_69AC		;6468
	pop de			;646b
	ret			;646c
L_646D:
	ld hl,06485h		;646d
	ld a,(ix+001h)		;6470
	call 0543ah		;6473
	ex de,hl			;6476
	ld a,(0c250h)		;6477
	or a			;647a
	call z,08b39h		;647b
	ld (0c249h),de		;647e
	jp L_6620		;6482

; ----------------------------------------------------------------------
; DATOS tabla_p646D: 10 bytes que lee p01:646D (ld hl,0x6485)
;   0x6485..0x648f  (10 bytes)
DATA_tabla_p646D:
	defb 080h,001h,000h,002h,080h,002h,000h,003h,080h,003h	; 6485  ..........

; ======================================================================
; CODIGO 0x648f..0x64a0  (17 bytes)
; ======================================================================


L_648F:
	ld hl,064a0h		;648f
	ld a,(ix+001h)		;6492
	call 0543ah		;6495
	ex de,hl			;6498
	ld (0c247h),de		;6499
	jp L_6614		;649d

; ----------------------------------------------------------------------
; DATOS tabla_p648F: 10 bytes que lee p01:648F (ld hl,0x64A0)
;   0x64a0..0x64aa  (10 bytes)
DATA_tabla_p648F:
	defb 080h,001h,000h,002h,080h,002h,000h,003h,080h,003h	; 64a0  ..........

; ======================================================================
; CODIGO 0x64aa..0x6861  (951 bytes)
; ======================================================================


L_64AA:
	call L_64B9		;64aa
L_64AD:
	ld de,(0c245h)		;64ad
	ld hl,(0c249h)		;64b1
	add hl,de			;64b4
	ld (0c245h),hl		;64b5
	ret			;64b8
L_64B9:
	ld de,(0c243h)		;64b9
	ld hl,(0c247h)		;64bd
	add hl,de			;64c0
	ld (0c243h),hl		;64c1
	ret			;64c4
L_64C5:
	call L_64F1		;64c5
	jp c,L_637D		;64c8
	call L_626E		;64cb
	ret c			;64ce
	call L_6576		;64cf
	call L_651E		;64d2
	call L_7090		;64d5
	call c,L_6620		;64d8
	call L_642B		;64db
	call c,L_6611		;64de
	call L_705A		;64e1
	jp c,L_66A6		;64e4
	ld a,(0ccb3h)		;64e7
	or a			;64ea
	call nz,L_6519		;64eb
	jp L_64AA		;64ee
L_64F1:
	ld a,(0c264h)		;64f1
	or a			;64f4
	ret nz			;64f5
	ld a,(0c006h)		;64f6
	and 021h		;64f9
	ret z			;64fb
	ld a,(0c240h)		;64fc
	or a			;64ff
	ret nz			;6500
	ld a,(0c205h)		;6501
	and 008h		;6504
	jr nz,L_650D		;6506
	ld a,(ix+006h)		;6508
	or a			;650b
	ret nz			;650c
L_650D:
	ld a,(0c265h)		;650d
	or a			;6510
	ret nz			;6511
	ld a,001h		;6512
	ld (0c265h),a		;6514
	scf			;6517
	ret			;6518
L_6519:
	xor a			;6519
	ld (0c251h),a		;651a
	ret			;651d
L_651E:
	ld a,(0c264h)		;651e
	or a			;6521
	jr nz,L_652C		;6522
	ld a,(0c007h)		;6524
	and 021h		;6527
	call z,L_6519		;6529
L_652C:
	ld a,(0c254h)		;652c
	cp 001h		;652f
	jr z,L_6562		;6531
	jr nc,L_655A		;6533
	ld a,(0c275h)		;6535
	and 004h		;6538
	ld de,0ff80h		;653a
	jr nz,L_6549		;653d
	ld a,(0c275h)		;653f
	and 008h		;6542
	ld d,000h		;6544
	jr nz,L_6549		;6546
	ret			;6548
L_6549:
	ld hl,(0c249h)		;6549
	add hl,de			;654c
	ld (0c249h),hl		;654d
	add hl,hl			;6550
	ld a,001h		;6551
	jr nc,L_6556		;6553
	xor a			;6555
L_6556:
	ld (0c250h),a		;6556
	ret			;6559
L_655A:
	ld a,(0c275h)		;655a
	and 008h		;655d
	ret z			;655f
	jr L_6568		;6560
L_6562:
	ld a,(0c275h)		;6562
	and 004h		;6565
	ret z			;6567
L_6568:
	ld hl,(0c249h)		;6568
	ld de,00080h		;656b
	or a			;656e
	sbc hl,de		;656f
	ret c			;6571
	ld (0c249h),hl		;6572
	ret			;6575
L_6576:
	ld a,(0c265h)		;6576
	or a			;6579
	jr z,L_6580		;657a
	ld a,002h		;657c
	jr z,L_658B		;657e
L_6580:
	ld a,(0c264h)		;6580
	or a			;6583
	ld a,002h		;6584
	jr nz,L_658B		;6586
	ld a,(ix+002h)		;6588
L_658B:
	push af			;658b
	call 054a5h		;658c
	pop af			;658f
	ld hl,0be16h		;6590
	call 0543ah		;6593
	ld a,(0c24eh)		;6596
	ld b,a			;6599
	ld a,(hl)			;659a
	inc hl			;659b
	cp b			;659c
	call z,L_6519		;659d
	ld a,b			;65a0
	cp 0ffh		;65a1
	push af			;65a3
	call 05464h		;65a4
	pop af			;65a7
	jp z,L_6342		;65a8
	push af			;65ab
	call 054a5h		;65ac
	pop af			;65af
	call 04083h		;65b0
	call L_6614		;65b3
	ld a,(0c254h)		;65b6
	cp 001h		;65b9
	jr c,L_65C8		;65bb
	ld d,0feh		;65bd
	ld e,000h		;65bf
	call z,08b39h		;65c1
	ld (0c249h),de		;65c4
L_65C8:
	ld b,(hl)			;65c8
	call 05464h		;65c9
	ld a,(0c251h)		;65cc
	or a			;65cf
	ld d,b			;65d0
	ld e,000h		;65d1
	call z,08b39h		;65d3
	ld (0c247h),de		;65d6
	ld a,(0c251h)		;65da
	ld hl,0c24eh		;65dd
	inc (hl)			;65e0
	or a			;65e1
	ret nz			;65e2
	dec (hl)			;65e3
	dec (hl)			;65e4
	ret			;65e5
L_65E6:
	neg		;65e6
	ret			;65e8
L_65E9:
	ld a,(0c007h)		;65e9
	ld c,a			;65ec
	and 00ch		;65ed
	xor 00ch		;65ef
	ld b,000h		;65f1
	jr z,L_660C		;65f3
	ld a,c			;65f5
	inc b			;65f6
	and 008h		;65f7
	ld d,001h		;65f9
	jr nz,L_6608		;65fb
	ld a,c			;65fd
	inc b			;65fe
	dec d			;65ff
	and 004h		;6600
	jr nz,L_6608		;6602
	ld b,000h		;6604
	jr L_660C		;6606
L_6608:
	ld a,d			;6608
	ld (0c250h),a		;6609
L_660C:
	ld a,b			;660c
	ld (0c254h),a		;660d
	ret			;6610
L_6611:
	call L_65E9		;6611
L_6614:
	push hl			;6614
	ld hl,00000h		;6615
	ld (0c249h),hl		;6618
	pop hl			;661b
	ret			;661c
L_661D:
	call L_6614		;661d
L_6620:
	push hl			;6620
	ld hl,00000h		;6621
	ld (0c247h),hl		;6624
	pop hl			;6627
	ret			;6628
L_6629:
	ld hl,00100h		;6629
	ld (0c247h),hl		;662c
	call L_705A		;662f
	jp nc,L_6342		;6632
	call L_6620		;6635
	ld a,(0c26ch)		;6638
	or a			;663b
	jr nz,L_6659		;663c
	ld a,(0c007h)		;663e
	and 002h		;6641
	jp z,L_63D2		;6643
L_6646:
	ld a,(0c275h)		;6646
	and 004h		;6649
	ld a,000h		;664b
	jr nz,L_665F		;664d
	ld a,(0c275h)		;664f
	and 008h		;6652
	ld a,001h		;6654
	jr nz,L_665F		;6656
	ret			;6658
L_6659:
	ld hl,0c26ch		;6659
	dec (hl)			;665c
	jr L_6646		;665d
L_665F:
	ld (0c250h),a		;665f
	ret			;6662
L_6663:
	call L_626E		;6663
	ret c			;6666
	call L_6614		;6667
	ld hl,00600h		;666a
	ld (0c247h),hl		;666d
	ld a,(0c275h)		;6670
	and 008h		;6673
	jr nz,L_668B		;6675
	ld a,(0c275h)		;6677
	and 004h		;667a
	jr nz,L_6686		;667c
	call L_705A		;667e
	jp c,L_66A6		;6681
	jr L_66A3		;6684
L_6686:
	xor a			;6686
	ld b,0ffh		;6687
	jr L_668E		;6689
L_668B:
	ld a,001h		;668b
	ld b,a			;668d
L_668E:
	ld (0c250h),a		;668e
	ld a,b			;6691
	ld (0c24ah),a		;6692
	call L_705A		;6695
	jp c,L_66A6		;6698
	call L_642B		;669b
	jr nc,L_66A3		;669e
	call L_6614		;66a0
L_66A3:
	jp L_64AA		;66a3
L_66A6:
	ld a,003h		;66a6
	call 056e3h		;66a8
	jp L_63B6		;66ab
L_66AE:
	ld hl,0c260h		;66ae
	ld a,(hl)			;66b1
	or a			;66b2
	ret z			;66b3
	dec (hl)			;66b4
	ret nz			;66b5
	ld (ix+000h),001h		;66b6
	ld a,(0c2b0h)		;66ba
	ld b,a			;66bd
	ld a,(0c2d0h)		;66be
	and b			;66c1
	jr nz,L_66DF		;66c2
	ld a,(0c211h)		;66c4
	ld (0c270h),a		;66c7
	call 08e2eh		;66ca
	call L_66EA		;66cd
	ld de,08020h		;66d0
	ld c,030h		;66d3
	push ix		;66d5
	call 08613h		;66d7
	pop ix		;66da
	jp 08231h		;66dc
L_66DF:
	xor a			;66df
	ld (0c214h),a		;66e0
	ld (0c258h),a		;66e3
	ld (0c270h),a		;66e6
	ret			;66e9
L_66EA:
	ld b,009h		;66ea
	ld ix,0cd00h		;66ec
L_66F0:
	push bc			;66f0
	call L_76DA		;66f1
	ld de,00080h		;66f4
	add ix,de		;66f7
	pop bc			;66f9
	djnz L_66F0		;66fa
	ret			;66fc
L_66FD:
	xor a			;66fd
	ld (0c254h),a		;66fe
	ld a,(0c275h)		;6701
	ld c,a			;6704
	and 002h		;6705
	jr nz,L_672A		;6707
	ld a,c			;6709
	and 001h		;670a
	jr nz,L_675E		;670c
	ld a,c			;670e
	and 004h		;670f
	jr nz,L_6719		;6711
	ld a,c			;6713
	and 008h		;6714
	jr nz,L_671D		;6716
	ret			;6718
L_6719:
	ld a,001h		;6719
	jr L_671F		;671b
L_671D:
	ld a,002h		;671d
L_671F:
	ld (0c254h),a		;671f
	ret			;6722
L_6723:
	call L_70AC		;6723
	ret c			;6726
	jp L_63B6		;6727
L_672A:
	call L_648F		;672a
	call L_70AC		;672d
	jr nc,L_6744		;6730
	ld hl,(0c245h)		;6732
	push hl			;6735
	dec h			;6736
	dec h			;6737
	ld (0c245h),hl		;6738
	call L_70AC		;673b
	pop hl			;673e
	ld (0c245h),hl		;673f
	jr c,L_6756		;6742
L_6744:
	ld a,(0c244h)		;6744
	sub 002h		;6747
	ld e,a			;6749
	call L_70BA		;674a
	jp nc,L_63B6		;674d
	call L_705A		;6750
	jp c,L_63B6		;6753
L_6756:
	call L_64B9		;6756
	ld hl,0c252h		;6759
	inc (hl)			;675c
	ret			;675d
L_675E:
	call L_648F		;675e
	ld de,(0c247h)		;6761
	call 08b39h		;6765
	ld (0c247h),de		;6768
	ld a,(0c244h)		;676c
	cp 0c8h		;676f
	jr nc,L_67B7		;6771
	cp 030h		;6773
	jr c,L_679A		;6775
	ld de,(0c247h)		;6777
	push de			;677b
	ld de,0e000h		;677c
	ld (0c247h),de		;677f
	call L_705A		;6783
	jr nc,L_6792		;6786
	ld de,0e800h		;6788
	ld (0c247h),de		;678b
	call L_705A		;678f
L_6792:
	pop de			;6792
	ld (0c247h),de		;6793
	jp c,L_6620		;6797
L_679A:
	call L_70A0		;679a
	jr c,L_67B7		;679d
	call L_6723		;679f
	ld a,(0c244h)		;67a2
	add a,004h		;67a5
	call L_70BA		;67a7
	jr c,L_67B7		;67aa
	call L_705A		;67ac
	jr c,L_67B7		;67af
	call L_64B9		;67b1
	jp L_63B6		;67b4
L_67B7:
	call L_64B9		;67b7
	ld hl,0c252h		;67ba
	inc (hl)			;67bd
	ret			;67be
L_67BF:
	xor a			;67bf
	ld (0c255h),a		;67c0
	call L_6411		;67c3
	call c,L_64AD		;67c6
	ret			;67c9
L_67CA:
	ld a,(0c258h)		;67ca
	or a			;67cd
	jr nz,L_67D6		;67ce
	ld a,(0c24bh)		;67d0
	cp 004h		;67d3
	ret z			;67d5
L_67D6:
	ld a,(0c256h)		;67d6
	or a			;67d9
	jr z,L_67F2		;67da
	ld hl,0c24fh		;67dc
	dec (hl)			;67df
	jr nz,L_67E8		;67e0
	xor a			;67e2
	ld (0c256h),a		;67e3
	jr L_67F2		;67e6
L_67E8:
	ld de,00d4ah		;67e8
	ld a,(0c00dh)		;67eb
	and 001h		;67ee
	jr z,L_6808		;67f0
L_67F2:
	ld a,(0c240h)		;67f2
	or a			;67f5
	ld de,00649h		;67f6
	jr z,L_6808		;67f9
	ld a,(0c20ah)		;67fb
	ld b,a			;67fe
	ld a,(0c316h)		;67ff
	or b			;6802
	jr z,L_6808		;6803
	ld de,0064bh		;6805
L_6808:
	ld a,d			;6808
	ld (0c24ch),a		;6809
	ld a,e			;680c
	ld (0c24dh),a		;680d
	ret			;6810
L_6811:
	ld a,006h		;6811
	ld (0c24bh),a		;6813
	call L_67F2		;6816
	xor a			;6819
	ld (0c256h),a		;681a
	ld (0c24fh),a		;681d
	ret			;6820
L_6821:
	ld a,001h		;6821
	jr L_6838		;6823
L_6825:
	call L_6234		;6825
	ld a,(0c24bh)		;6828
	cp 004h		;682b
	jr z,L_6821		;682d
	ld a,(0c26fh)		;682f
	or a			;6832
	jr nz,L_6851		;6833
L_6835:
	ld a,(0c253h)		;6835
L_6838:
	add a,0d0h		;6838
	ld h,000h		;683a
	ld l,a			;683c
	ld d,h			;683d
	ld e,0f0h		;683e
	ld b,h			;6840
	ld c,001h		;6841
	ld a,005h		;6843
	jp 04bdeh		;6845
L_6848:
	xor a			;6848
	ld (0c26fh),a		;6849
	ld a,(0c253h)		;684c
	jr L_6838		;684f
L_6851:
	ld a,(0c320h)		;6851
	or a			;6854
	jr z,L_6848		;6855
	ld a,(ix+006h)		;6857
	or a			;685a
	jr z,L_6835		;685b
	dec a			;685d
	call 0408dh		;685e

; ----------------------------------------------------------------------
; DATOS saltos_6861: tabla de 3 palabras del despachador (call 0x408D en
;   0x685E); lo leen L_408D (6 bytes)
;   0x6861..0x6867  (6 bytes)
DATA_saltos_6861:
	defb 07ah,068h	; 6861
	defb 07ah,068h	; 6863
	defb 0c8h,068h	; 6865

; ======================================================================
; CODIGO 0x6867..0x688b  (36 bytes)
; ======================================================================


L_6867:
	ld a,(0c00dh)		;6867
	and 002h		;686a
	add a,0d8h		;686c
	ld l,a			;686e
	ld a,(ix+009h)		;686f
	or a			;6872
	jr z,L_6876		;6873
	inc l			;6875
L_6876:
	ld h,000h		;6876
	jr $+35		;6878
L_687A:
	ld hl,0688bh		;687a
	call L_68A7		;687d
	call L_6897		;6880
	ld hl,06891h		;6883
	call L_68A7		;6886
	jr $+18		;6889

; ----------------------------------------------------------------------
; DATOS tabla_p687A: 12 bytes: 0x688B lo lee p01:687A y 0x6891 p01:6883
;   0x688b..0x6897  (12 bytes)
DATA_tabla_p687A:
	defb 0d8h,0d8h,0dah,0d8h,0d8h,0dch,0deh,0deh,0e0h,0deh,0deh,0e2h	; 688b  ............

; ======================================================================
; CODIGO 0x6897..0x692b  (148 bytes)
; ======================================================================


L_6897:
	ld e,0f0h		;6897
	jr L_689D		;6899
L_689B:
	ld e,0f1h		;689b
L_689D:
	ld d,000h		;689d
	ld bc,00001h		;689f
	ld a,004h		;68a2
	jp 04bdeh		;68a4
L_68A7:
	ld a,(0c26ch)		;68a7
	or a			;68aa
	ld a,000h		;68ab
	jr nz,L_68B2		;68ad
	ld a,(0c24bh)		;68af
L_68B2:
	call 04083h		;68b2
	ld a,(0c24bh)		;68b5
	cp 005h		;68b8
	ld a,(0c250h)		;68ba
	jr nz,L_68C3		;68bd
	ld a,(0c254h)		;68bf
	dec a			;68c2
L_68C3:
	add a,(hl)			;68c3
	ld l,a			;68c4
	ld h,000h		;68c5
	ret			;68c7
L_68C8:
	ld a,(0c00dh)		;68c8
	and 006h		;68cb
	ld b,a			;68cd
	ld a,(0c250h)		;68ce
	add a,b			;68d1
	add a,0d8h		;68d2
	ld l,a			;68d4
	ld h,000h		;68d5
	jr L_6897		;68d7
L_68D9:
	exx			;68d9
	ld a,(0c24bh)		;68da
	cp 004h		;68dd
	ld hl,0692bh		;68df
	jr nz,L_68EE		;68e2
	ld a,(0c26bh)		;68e4
	cp 002h		;68e7
	jr nz,L_68EE		;68e9
	ld hl,0692fh		;68eb
L_68EE:
	exx			;68ee
	ld b,002h		;68ef
	ld c,000h		;68f1
	ld de,0de00h		;68f3
L_68F6:
	ld hl,0c244h		;68f6
	ld a,(hl)			;68f9
	inc hl			;68fa
	inc hl			;68fb
	exx			;68fc
	add a,(hl)			;68fd
	inc hl			;68fe
	exx			;68ff
	ld (de),a			;6900
	inc de			;6901
	ex af,af'			;6902
	ld a,(hl)			;6903
	exx			;6904
	add a,(hl)			;6905
	inc hl			;6906
	exx			;6907
	ld (de),a			;6908
	ex de,hl			;6909
	inc hl			;690a
	ld (hl),c			;690b
	ex af,af'			;690c
	inc hl			;690d
	inc hl			;690e
	ld (hl),a			;690f
	ex af,af'			;6910
	inc hl			;6911
	ld (hl),a			;6912
	inc hl			;6913
	ld a,c			;6914
	add a,004h		;6915
	ld (hl),a			;6917
	add a,004h		;6918
	ld c,a			;691a
	inc hl			;691b
	inc hl			;691c
	ex de,hl			;691d
	djnz L_68F6		;691e
	ld hl,0dc00h		;6920
	call L_6933		;6923
	ld hl,0dc20h		;6926
	jr $+10		;6929

; ----------------------------------------------------------------------
; DATOS tabla_p68DF: 8 bytes: 0x692B lo lee p01:68DF y 0x692F p01:68EB
;   0x692b..0x6933  (8 bytes)
DATA_tabla_p68DF:
	defb 0e0h,0f8h,0f0h,0f8h,0e8h,0f8h,0f0h,0f8h	; 692b  ........

; ======================================================================
; CODIGO 0x6933..0x699e  (107 bytes)
; ======================================================================


L_6933:
	ld de,0c24ch		;6933
	ld c,002h		;6936
L_6938:
	ld a,(de)			;6938
	inc de			;6939
	ld b,010h		;693a
L_693C:
	ld (hl),a			;693c
	inc hl			;693d
	djnz L_693C		;693e
	dec c			;6940
	jr nz,L_6938		;6941
	ret			;6943
L_6944:
	call L_6234		;6944
	ld a,(0c00dh)		;6947
	and 03fh		;694a
	call z,0b259h		;694c
	call 0b2fch		;694f
	call L_6995		;6952
	ld a,(0c262h)		;6955
	or a			;6958
	call nz,L_6AEA		;6959
	call L_68D9		;695c
	ld a,(0c24bh)		;695f
	cp 004h		;6962
	ret nz			;6964
	ld a,(0c26bh)		;6965
	or a			;6968
	ret z			;6969
	dec a			;696a
	jr nz,L_6976		;696b
	ld a,0e0h		;696d
	ld (0de00h),a		;696f
	ld (0de04h),a		;6972
	ret			;6975
L_6976:
	ld a,(0c400h)		;6976
	cp 030h		;6979
	jr nz,L_6986		;697b
	ld a,(0c401h)		;697d
	or a			;6980
	jr z,L_6986		;6981
	xor a			;6983
	jr L_6988		;6984
L_6986:
	ld a,00dh		;6986
L_6988:
	ld hl,0dc00h		;6988
	ld de,0dc01h		;698b
	ld bc,0001fh		;698e
	ld (hl),a			;6991
	ldir		;6992
	ret			;6994
L_6995:
	call L_6234		;6995
	ld a,(0c24bh)		;6998
	call 0408dh		;699b

; ----------------------------------------------------------------------
; DATOS saltos_699E: tabla de 7 palabras del despachador (call 0x408D en
;   0x699B); lo leen L_408D (14 bytes)
;   0x699e..0x69ac  (14 bytes)
DATA_saltos_699E:
	defb 0b0h,069h	; 699e
	defb 0ebh,069h	; 69a0
	defb 0ebh,069h	; 69a2
	defb 0f5h,069h	; 69a4
	defb 003h,06ah	; 69a6
	defb 0abh,06ah	; 69a8
	defb 0b0h,069h	; 69aa

; ======================================================================
; CODIGO 0x69ac..0x69e6  (58 bytes)
; ======================================================================


L_69AC:
	ld a,000h		;69ac
	jr L_69DD		;69ae
L_69B0:
	ld a,(0c255h)		;69b0
	or a			;69b3
	ld a,000h		;69b4
	jr nz,L_69DD		;69b6
	ld a,(0c266h)		;69b8
	or a			;69bb
	jr nz,L_69CC		;69bc
	ld hl,069e6h		;69be
	ld a,(ix+001h)		;69c1
	call 04083h		;69c4
	ld a,(0c252h)		;69c7
	cp (hl)			;69ca
	ret c			;69cb
L_69CC:
	xor a			;69cc
	ld (0c252h),a		;69cd
	ld a,(0c253h)		;69d0
	add a,002h		;69d3
	cp 008h		;69d5
	jr c,L_69DB		;69d7
	ld a,000h		;69d9
L_69DB:
	and 006h		;69db
L_69DD:
	ld b,a			;69dd
	ld a,(0c250h)		;69de
	add a,b			;69e1
	ld (0c253h),a		;69e2
	ret			;69e5

; ----------------------------------------------------------------------
; DATOS tabla_p69BE: 5 bytes que leen p01:69BE y p01:6AB1 (ld hl,0x69E6)
;   0x69e6..0x69eb  (5 bytes)
DATA_tabla_p69BE:
	defb 004h,003h,002h,002h,003h	; 69e6

; ======================================================================
; CODIGO 0x69eb..0x6b83  (408 bytes)
; ======================================================================


L_69EB:
	ld b,008h		;69eb
	ld a,(0c250h)		;69ed
	add a,b			;69f0
	ld (0c253h),a		;69f1
	ret			;69f4
L_69F5:
	ld a,(0c253h)		;69f5
	and 0feh		;69f8
	ld b,a			;69fa
	ld a,(0c250h)		;69fb
	add a,b			;69fe
	ld (0c253h),a		;69ff
	ret			;6a02
L_6A03:
	ld a,006h		;6a03
	ld (0c24ch),a		;6a05
	ld a,049h		;6a08
	ld (0c24dh),a		;6a0a
	ld a,(0c260h)		;6a0d
	cp 060h		;6a10
	ld c,00fh		;6a12
	jr nc,L_6A21		;6a14
	cp 020h		;6a16
	ld c,003h		;6a18
	jr nc,L_6A21		;6a1a
	cp 01fh		;6a1c
	jr z,L_6A65		;6a1e
	ret			;6a20
L_6A21:
	ld a,(0c260h)		;6a21
	and c			;6a24
	ret nz			;6a25
	inc c			;6a26
	ld a,(0c260h)		;6a27
	and c			;6a2a
	ld hl,00098h		;6a2b
	jr nz,L_6A33		;6a2e
	ld hl,01098h		;6a30
L_6A33:
	ld a,(0c246h)		;6a33
	sub 008h		;6a36
	ld d,a			;6a38
	ld a,(0c240h)		;6a39
	or a			;6a3c
	ld b,027h		;6a3d
	jr z,L_6A43		;6a3f
	ld b,021h		;6a41
L_6A43:
	ld a,(0c244h)		;6a43
	sub b			;6a46
	ld e,a			;6a47
	push hl			;6a48
	push de			;6a49
	ld hl,02098h		;6a4a
	ld bc,01018h		;6a4d
	ld a,040h		;6a50
	call 04c73h		;6a52
	pop de			;6a55
	pop hl			;6a56
	ld bc,01018h		;6a57
	ld a,048h		;6a5a
	call 04c73h		;6a5c
	ld a,001h		;6a5f
	ld (0c26bh),a		;6a61
	ret			;6a64
L_6A65:
	ld a,002h		;6a65
	ld (0c26bh),a		;6a67
	ld a,(0c246h)		;6a6a
	sub 008h		;6a6d
	ld d,a			;6a6f
	ld a,(0c240h)		;6a70
	or a			;6a73
	ld b,027h		;6a74
	jr z,L_6A7A		;6a76
	ld b,021h		;6a78
L_6A7A:
	ld a,(0c244h)		;6a7a
	sub b			;6a7d
	ld e,a			;6a7e
	ld hl,02098h		;6a7f
	ld bc,01018h		;6a82
	ld a,040h		;6a85
	call 04c73h		;6a87
	call 054b4h		;6a8a
	ld de,0b21bh		;6a8d
	ld hl,0e880h		;6a90
	call 0492ch		;6a93
	ld de,0b21bh		;6a96
	ld hl,0e8a0h		;6a99
	call 0492ch		;6a9c
	ld de,0b238h		;6a9f
	ld hl,0e8c0h		;6aa2
	call 0492ch		;6aa5
	jp 05464h		;6aa8
L_6AAB:
	ld a,(0c254h)		;6aab
	or a			;6aae
	jr nz,L_6AD2		;6aaf
	ld hl,069e6h		;6ab1
	ld a,(ix+001h)		;6ab4
	call 04083h		;6ab7
	ld a,(0c252h)		;6aba
	cp (hl)			;6abd
	jr c,L_6ADA		;6abe
	xor a			;6ac0
	ld (0c252h),a		;6ac1
	ld a,(0c253h)		;6ac4
	inc a			;6ac7
	cp 00ch		;6ac8
	jr c,L_6ACE		;6aca
	ld a,00ah		;6acc
L_6ACE:
	ld (0c253h),a		;6ace
	ret			;6ad1
L_6AD2:
	dec a			;6ad2
	ld b,00ch		;6ad3
	add a,b			;6ad5
	ld (0c253h),a		;6ad6
	ret			;6ad9
L_6ADA:
	ld a,(0c253h)		;6ada
	sub 00ah		;6add
	jr c,L_6AE4		;6adf
	cp 002h		;6ae1
	ret c			;6ae3
L_6AE4:
	ld a,00ah		;6ae4
	ld (0c253h),a		;6ae6
	ret			;6ae9
L_6AEA:
	ret			;6aea
L_6AEB:
	call L_7032		;6aeb
	call L_6DAD		;6aee
	call L_6F71		;6af1
	call L_6234		;6af4
	ld a,(0c24bh)		;6af7
	cp 004h		;6afa
	ret z			;6afc
	ld a,(0c21ch)		;6afd
	or a			;6b00
	ret nz			;6b01
	ld a,(0c006h)		;6b02
	and 010h		;6b05
	ret z			;6b07
	ld a,(0c257h)		;6b08
	or a			;6b0b
	ret nz			;6b0c
	ld a,(0c240h)		;6b0d
	or a			;6b10
	jr nz,L_6B1C		;6b11
	ld a,003h		;6b13
	sub (ix+006h)		;6b15
	inc a			;6b18
	jp L_6B21		;6b19
L_6B1C:
	ld a,(ix+006h)		;6b1c
	add a,006h		;6b1f
L_6B21:
	ld b,a			;6b21
	push bc			;6b22
	call L_6B74		;6b23
	pop bc			;6b26
	ret c			;6b27
	ld a,b			;6b28
	cp 003h		;6b29
	jr z,L_6B3A		;6b2b
	cp 004h		;6b2d
	jr z,L_6B4E		;6b2f
	ld hl,0c320h		;6b31
	ld a,(hl)			;6b34
	or a			;6b35
	ret nz			;6b36
	jp L_6B8C		;6b37
L_6B3A:
	ld b,003h		;6b3a
	ld c,004h		;6b3c
	ld hl,0c320h		;6b3e
	ld de,00020h		;6b41
L_6B44:
	ld a,(hl)			;6b44
	or a			;6b45
	jp z,L_6B8C		;6b46
	add hl,de			;6b49
	dec c			;6b4a
	jr nz,L_6B44		;6b4b
	ret			;6b4d
L_6B4E:
	ld b,003h		;6b4e
	ld hl,0c320h		;6b50
	ld de,00020h		;6b53
L_6B56:
	ld a,(hl)			;6b56
	or a			;6b57
	ret nz			;6b58
	add hl,de			;6b59
	djnz L_6B56		;6b5a
	ld hl,0c320h		;6b5c
	ld b,004h		;6b5f
	call L_6B8C		;6b61
	ld hl,0c340h		;6b64
	ld b,005h		;6b67
	call L_6B8C		;6b69
	ld hl,0c360h		;6b6c
	ld b,005h		;6b6f
	jp L_6B8C		;6b71
L_6B74:
	ld a,(0c24bh)		;6b74
	sub 005h		;6b77
	or a			;6b79
	ret nz			;6b7a
	ld a,(0c254h)		;6b7b
	or a			;6b7e
	scf			;6b7f
	ret z			;6b80
	or a			;6b81
	ret			;6b82

; ----------------------------------------------------------------------
; DATOS tabla_p6B93: 9 bytes que lee p01:6B93 (ld hl,0x6B83)
;   0x6b83..0x6b8c  (9 bytes)
DATA_tabla_p6B93:
	defb 00ah,00bh,00bh,00bh,00bh,00ch,00dh,00dh,00eh	; 6b83  .........

; ======================================================================
; CODIGO 0x6b8c..0x6be6  (90 bytes)
; ======================================================================


L_6B8C:
	call L_6BF8		;6b8c
	push hl			;6b8f
	push bc			;6b90
	ld a,b			;6b91
	dec a			;6b92
	ld hl,06b83h		;6b93
	call 04083h		;6b96
	ld a,(hl)			;6b99
	call 056e3h		;6b9a
	pop bc			;6b9d
	pop hl			;6b9e
	ld (hl),b			;6b9f
	push hl			;6ba0
	pop ix		;6ba1
	ld d,h			;6ba3
	ld e,l			;6ba4
	inc de			;6ba5
	ld b,01fh		;6ba6
	xor a			;6ba8
L_6BA9:
	ld (de),a			;6ba9
	inc de			;6baa
	djnz L_6BA9		;6bab
	inc hl			;6bad
	ld de,(0c243h)		;6bae
	call L_6C12		;6bb2
	ld (hl),e			;6bb5
	inc hl			;6bb6
	ld (hl),d			;6bb7
	inc hl			;6bb8
	ld de,(0c245h)		;6bb9
	ld (hl),e			;6bbd
	inc hl			;6bbe
	ld (hl),d			;6bbf
	inc hl			;6bc0
	inc hl			;6bc1
	inc hl			;6bc2
	inc hl			;6bc3
	inc hl			;6bc4
	ld a,(0c24bh)		;6bc5
	cp 005h		;6bc8
	ld a,(0c250h)		;6bca
	jr nz,L_6BD3		;6bcd
	ld a,(0c254h)		;6bcf
	dec a			;6bd2
L_6BD3:
	ld (hl),a			;6bd3
	ld (ix+010h),001h		;6bd4
	ld (ix+00ah),000h		;6bd8
	call L_6C45		;6bdc
	ld a,(ix+000h)		;6bdf
	dec a			;6be2
	call 0408dh		;6be3

; ----------------------------------------------------------------------
; DATOS saltos_6BE6: tabla de 9 palabras del despachador (call 0x408D en
;   0x6BE3); lo leen L_408D (18 bytes)
;   0x6be6..0x6bf8  (18 bytes)
DATA_saltos_6BE6:
	defb 085h,06ch	; 6be6
	defb 060h,06ch	; 6be8
	defb 07ch,06ch	; 6bea
	defb 06bh,06ch	; 6bec
	defb 0adh,06ch	; 6bee
	defb 0e6h,06ch	; 6bf0
	defb 016h,06dh	; 6bf2
	defb 01ch,06dh	; 6bf4
	defb 05fh,06dh	; 6bf6

; ======================================================================
; CODIGO 0x6bf8..0x6d59  (353 bytes)
; ======================================================================


L_6BF8:
	ld a,(0c24bh)		;6bf8
	or a			;6bfb
	ret nz			;6bfc
	ld a,b			;6bfd
	cp 009h		;6bfe
	ret z			;6c00
	ld a,004h		;6c01
	cp 007h		;6c03
	jr z,L_6C09		;6c05
	ld a,008h		;6c07
L_6C09:
	ld (0c26ch),a		;6c09
	ld a,002h		;6c0c
	ld (0c24bh),a		;6c0e
	ret			;6c11
L_6C12:
	ld a,(0c240h)		;6c12
	or a			;6c15
	ret nz			;6c16
	ld a,(ix+000h)		;6c17
	cp 001h		;6c1a
	jr nz,L_6C22		;6c1c
	ld a,d			;6c1e
	add a,004h		;6c1f
	ld d,a			;6c21
L_6C22:
	ld a,(0c26ch)		;6c22
	or a			;6c25
	jr nz,L_6C40		;6c26
	ld a,(0c253h)		;6c28
	cp 008h		;6c2b
	jr z,L_6C40		;6c2d
	cp 009h		;6c2f
	jr z,L_6C40		;6c31
	sub 014h		;6c33
	jr c,L_6C3B		;6c35
	cp 004h		;6c37
	jr c,L_6C40		;6c39
L_6C3B:
	ld a,d			;6c3b
	sub 00ah		;6c3c
	ld d,a			;6c3e
	ret			;6c3f
L_6C40:
	ld a,d			;6c40
	sub 004h		;6c41
	ld d,a			;6c43
	ret			;6c44
L_6C45:
	ld a,(ix+000h)		;6c45
	cp 001h		;6c48
	ld b,0feh		;6c4a
	jr nz,L_6C50		;6c4c
	ld b,0f8h		;6c4e
L_6C50:
	ld a,(ix+009h)		;6c50
	or a			;6c53
	ld a,b			;6c54
	jr z,L_6C59		;6c55
	neg		;6c57
L_6C59:
	add a,(ix+004h)		;6c59
	ld (ix+004h),a		;6c5c
	ret			;6c5f
L_6C60:
	call L_6D75		;6c60
	call L_6D84		;6c63
	ld (ix+00ch),004h		;6c66
	ret			;6c6a
L_6C6B:
	call L_6C7C		;6c6b
	ld a,(ix+009h)		;6c6e
	or a			;6c71
	ld a,011h		;6c72
	jr z,L_6C78		;6c74
	ld a,013h		;6c76
L_6C78:
	ld (ix+00ah),a		;6c78
	ret			;6c7b
L_6C7C:
	call L_6D75		;6c7c
	call L_6D84		;6c7f
	jp L_6D95		;6c82
L_6C85:
	call L_6D75		;6c85
	ld a,(ix+00dh)		;6c88
	sub 008h		;6c8b
	srl a		;6c8d
	ld (ix+00eh),a		;6c8f
	ld (ix+00ah),001h		;6c92
	ld a,(ix+009h)		;6c96
	or a			;6c99
	jr z,L_6CA0		;6c9a
	ld (ix+00ah),005h		;6c9c
L_6CA0:
	ld a,004h		;6ca0
	ld (ix+00ch),a		;6ca2
	ld (ix+011h),a		;6ca5
	ld (ix+00dh),0ffh		;6ca8
	ret			;6cac
L_6CAD:
	call L_6D75		;6cad
	call L_6D95		;6cb0
	ld a,(ix+009h)		;6cb3
	or a			;6cb6
	ld b,011h		;6cb7
	jr z,L_6CBD		;6cb9
	ld b,013h		;6cbb
L_6CBD:
	ld a,(ix+00ch)		;6cbd
	cp 005h		;6cc0
	jr z,L_6CC5		;6cc2
	inc b			;6cc4
L_6CC5:
	ld (ix+00ah),b		;6cc5
	push ix		;6cc8
	pop hl			;6cca
	or a			;6ccb
	ld de,0c320h		;6ccc
	sbc hl,de		;6ccf
	add hl,hl			;6cd1
	add hl,hl			;6cd2
	add hl,hl			;6cd3
	ld a,h			;6cd4
	cp 001h		;6cd5
	ld b,000h		;6cd7
	jr z,L_6CDD		;6cd9
	ld b,0f8h		;6cdb
L_6CDD:
	ld (ix+006h),b		;6cdd
	ld (ix+005h),a		;6ce0
	jp L_6D84		;6ce3
L_6CE6:
	call L_6867		;6ce6
	ld a,(0c244h)		;6ce9
	ld (ix+002h),a		;6cec
	ld a,001h		;6cef
	ld (0c26fh),a		;6cf1
	call L_6D75		;6cf4
	ld a,(ix+00dh)		;6cf7
	add a,a			;6cfa
	ld (ix+00dh),a		;6cfb
	ld de,00400h		;6cfe
	call L_6D87		;6d01
	ld (ix+00ch),004h		;6d04
	ld a,(ix+009h)		;6d08
	or a			;6d0b
	ld a,00fh		;6d0c
	jr nz,L_6D12		;6d0e
	ld a,010h		;6d10
L_6D12:
	ld (ix+00ah),a		;6d12
	ret			;6d15
L_6D16:
	ld (ix+00dh),004h		;6d16
	jr L_6D20		;6d1a
L_6D1C:
	ld (ix+00dh),008h		;6d1c
L_6D20:
	ld a,001h		;6d20
	ld (0c26fh),a		;6d22
	ld (ix+00ch),004h		;6d25
L_6D29:
	ld a,(0c26ch)		;6d29
	or a			;6d2c
	ld a,000h		;6d2d
	jr nz,L_6D34		;6d2f
	ld a,(0c24bh)		;6d31
L_6D34:
	ld hl,06d59h		;6d34
	call 04083h		;6d37
	ld a,(hl)			;6d3a
	ld (ix+00ah),a		;6d3b
	ld a,(0c24bh)		;6d3e
	cp 005h		;6d41
	jr nz,L_6D4B		;6d43
	ld a,(0c254h)		;6d45
	dec a			;6d48
	jr L_6D4E		;6d49
L_6D4B:
	ld a,(0c250h)		;6d4b
L_6D4E:
	or a			;6d4e
	ret nz			;6d4f
	ld a,(ix+00ah)		;6d50
	add a,003h		;6d53
	ld (ix+00ah),a		;6d55
	ret			;6d58

; ----------------------------------------------------------------------
; DATOS tabla_p6D34: 6 bytes que lee p01:6D34 (ld hl,0x6D59)
;   0x6d59..0x6d5f  (6 bytes)
DATA_tabla_p6D34:
	defb 009h,009h,00ah,009h,009h,00bh	; 6d59

; ======================================================================
; CODIGO 0x6d5f..0x6e3b  (220 bytes)
; ======================================================================


L_6D5F:
	ld a,(0c244h)		;6d5f
	ld (ix+002h),a		;6d62
	ld a,(0c246h)		;6d65
	ld (ix+004h),a		;6d68
	ld a,001h		;6d6b
	ld (0c26fh),a		;6d6d
	ld (ix+00dh),018h		;6d70
	ret			;6d74
L_6D75:
	ld (ix+00dh),008h		;6d75
	ret			;6d79
L_6D7A:
	ld a,(ix+009h)		;6d7a
	xor 001h		;6d7d
	add a,b			;6d7f
	ld (ix+00ah),a		;6d80
	ret			;6d83
L_6D84:
	ld de,00800h		;6d84
L_6D87:
	ld a,(ix+009h)		;6d87
	or a			;6d8a
	call z,08b39h		;6d8b
	ld (ix+007h),e		;6d8e
	ld (ix+008h),d		;6d91
	ret			;6d94
L_6D95:
	push ix		;6d95
	pop hl			;6d97
	or a			;6d98
	ld de,0c320h		;6d99
	sbc hl,de		;6d9c
	or a			;6d9e
	ld a,l			;6d9f
	rra			;6da0
	rra			;6da1
	rra			;6da2
	rra			;6da3
	rra			;6da4
	and 007h		;6da5
	add a,004h		;6da7
	ld (ix+00ch),a		;6da9
	ret			;6dac
L_6DAD:
	ld ix,0c320h		;6dad
	ld b,004h		;6db1
L_6DB3:
	push bc			;6db3
	call L_6E32		;6db4
	call L_6DC6		;6db7
	call L_6DF2		;6dba
	pop bc			;6dbd
	ld de,00020h		;6dbe
	add ix,de		;6dc1
	djnz L_6DB3		;6dc3
	ret			;6dc5
L_6DC6:
	ld a,(ix+000h)		;6dc6
	or a			;6dc9
	ret z			;6dca
	ld e,(ix+007h)		;6dcb
	ld d,(ix+008h)		;6dce
	ld l,(ix+003h)		;6dd1
	ld h,(ix+004h)		;6dd4
	add hl,de			;6dd7
	ld (ix+003h),l		;6dd8
	ld (ix+004h),h		;6ddb
	ld e,(ix+005h)		;6dde
	ld d,(ix+006h)		;6de1
	ld l,(ix+001h)		;6de4
	ld h,(ix+002h)		;6de7
	add hl,de			;6dea
	ld (ix+001h),l		;6deb
	ld (ix+002h),h		;6dee
	ret			;6df1
L_6DF2:
	ld a,(ix+000h)		;6df2
	or a			;6df5
	ret z			;6df6
	ld a,(ix+004h)		;6df7
	cp 0f5h		;6dfa
	jr nc,L_6E17		;6dfc
	cp 00ah		;6dfe
	jr c,L_6E17		;6e00
	ld a,(ix+002h)		;6e02
	cp 0d8h		;6e05
	jr nc,L_6E17		;6e07
	cp 014h		;6e09
	jr c,L_6E17		;6e0b
	ld a,(ix+00dh)		;6e0d
	cp 0ffh		;6e10
	ret z			;6e12
	dec (ix+00dh)		;6e13
	ret nz			;6e16
L_6E17:
	ld b,008h		;6e17
	ld de,0de00h		;6e19
	ld a,(ix+00ch)		;6e1c
	add a,a			;6e1f
	add a,a			;6e20
	call 04088h		;6e21
	ld a,0e0h		;6e24
L_6E26:
	ld (de),a			;6e26
	inc de			;6e27
	djnz L_6E26		;6e28
	xor a			;6e2a
	ld (ix+000h),a		;6e2b
	ld (0c26fh),a		;6e2e
	ret			;6e31
L_6E32:
	ld a,(ix+000h)		;6e32
	or a			;6e35
	ret z			;6e36
	dec a			;6e37
	call 0408dh		;6e38

; ----------------------------------------------------------------------
; DATOS saltos_6E3B: tabla de 9 palabras del despachador (call 0x408D en
;   0x6E38); lo leen L_408D (18 bytes)
;   0x6e3b..0x6e4d  (18 bytes)
DATA_saltos_6E3B:
	defb 052h,06eh	; 6e3b
	defb 051h,06eh	; 6e3d
	defb 051h,06eh	; 6e3f
	defb 0c9h,06eh	; 6e41
	defb 070h,06fh	; 6e43
	defb 029h,06fh	; 6e45
	defb 034h,06fh	; 6e47
	defb 034h,06fh	; 6e49
	defb 051h,06fh	; 6e4b

; ======================================================================
; CODIGO 0x6e4d..0x6e6a  (29 bytes)
; ======================================================================


L_6E4D:
	ld (ix+010h),001h		;6e4d
L_6E51:
	ret			;6e51
L_6E52:
	ld a,(0c00dh)		;6e52
	and 003h		;6e55
	call z,L_6E4D		;6e57
	ld a,(0c244h)		;6e5a
	ld d,a			;6e5d
	call L_6C12		;6e5e
	ld (ix+002h),d		;6e61
	ld a,(ix+00fh)		;6e64
	call 0408dh		;6e67

; ----------------------------------------------------------------------
; DATOS saltos_6E6A: tabla de 5 palabras del despachador (call 0x408D en
;   0x6E67); lo leen L_408D (10 bytes)
;   0x6e6a..0x6e74  (10 bytes)
DATA_saltos_6E6A:
	defb 074h,06eh	; 6e6a
	defb 07ah,06eh	; 6e6c
	defb 09ah,06eh	; 6e6e
	defb 0a3h,06eh	; 6e70
	defb 0b4h,06eh	; 6e72

; ======================================================================
; CODIGO 0x6e74..0x6ecf  (91 bytes)
; ======================================================================


L_6E74:
	dec (ix+011h)		;6e74
	ret nz			;6e77
	jr L_6E96		;6e78
L_6E7A:
	call L_6EB7		;6e7a
	inc (ix+00ah)		;6e7d
	ld a,(ix+00ah)		;6e80
	dec a			;6e83
	and 003h		;6e84
	cp 003h		;6e86
	ret nz			;6e88
	inc (ix+00fh)		;6e89
	ld a,(ix+00eh)		;6e8c
	or a			;6e8f
	jr z,L_6E96		;6e90
	ld (ix+011h),a		;6e92
	ret			;6e95
L_6E96:
	inc (ix+00fh)		;6e96
	ret			;6e99
L_6E9A:
	call L_6EB7		;6e9a
	dec (ix+011h)		;6e9d
	ret nz			;6ea0
	jr L_6E96		;6ea1
L_6EA3:
	dec (ix+00ah)		;6ea3
	call L_6EB7		;6ea6
	ld a,(ix+00ah)		;6ea9
	dec a			;6eac
	and 003h		;6ead
	ret nz			;6eaf
	inc (ix+00fh)		;6eb0
	ret			;6eb3
L_6EB4:
	jp L_6E17		;6eb4
L_6EB7:
	ld b,010h		;6eb7
	ld a,(ix+009h)		;6eb9
	or a			;6ebc
	jr nz,L_6EC1		;6ebd
	ld b,0f0h		;6ebf
L_6EC1:
	ld a,(ix+004h)		;6ec1
	add a,b			;6ec4
	ld (ix+004h),a		;6ec5
	ret			;6ec8
L_6EC9:
	ld a,(ix+00fh)		;6ec9
	call 0408dh		;6ecc

; ----------------------------------------------------------------------
; DATOS saltos_6ECF: tabla de 2 palabras del despachador (call 0x408D en
;   0x6ECC); lo leen L_408D (4 bytes)
;   0x6ecf..0x6ed3  (4 bytes)
DATA_saltos_6ECF:
	defb 0f1h,06eh	; 6ecf
	defb 0d3h,06eh	; 6ed1

; ======================================================================
; CODIGO 0x6ed3..0x7234  (865 bytes)
; ======================================================================


L_6ED3:
	ld d,(ix+004h)		;6ed3
	ld a,(ix+002h)		;6ed6
	add a,004h		;6ed9
	ld e,a			;6edb
	call L_704C		;6edc
	ret nc			;6edf
	ld de,01000h		;6ee0
	call L_6D87		;6ee3
	xor a			;6ee6
	ld (ix+00fh),a		;6ee7
	ld (ix+005h),a		;6eea
	ld (ix+006h),a		;6eed
	ret			;6ef0
L_6EF1:
	ld d,(ix+004h)		;6ef1
	ld e,(ix+002h)		;6ef4
	ld a,(ix+009h)		;6ef7
	ld hl,0f8f8h		;6efa
	or a			;6efd
	jr z,L_6F03		;6efe
	ld hl,008f8h		;6f00
L_6F03:
	add hl,de			;6f03
	ld d,h			;6f04
	ld e,l			;6f05
	call L_704C		;6f06
	jp c,L_6E17		;6f09
	ld d,(ix+004h)		;6f0c
	ld e,(ix+002h)		;6f0f
	call L_704C		;6f12
	ret c			;6f15
	ld (ix+00fh),001h		;6f16
	xor a			;6f1a
	ld (ix+005h),a		;6f1b
	ld (ix+006h),004h		;6f1e
	ld (ix+007h),a		;6f22
	ld (ix+008h),a		;6f25
	ret			;6f28
L_6F29:
	ld a,(0c00dh)		;6f29
	and 003h		;6f2c
	call z,L_6E4D		;6f2e
	jp L_6867		;6f31
L_6F34:
	ld a,(0c24bh)		;6f34
	cp 005h		;6f37
	jr nz,L_6F42		;6f39
	ld a,(0c254h)		;6f3b
	or a			;6f3e
	jp z,L_6E17		;6f3f
L_6F42:
	ld a,(0c244h)		;6f42
	ld (ix+002h),a		;6f45
	ld a,(0c246h)		;6f48
	ld (ix+004h),a		;6f4b
	jp L_6D29		;6f4e
L_6F51:
	ld a,(0c00dh)		;6f51
	and 003h		;6f54
	call z,L_6E4D		;6f56
	ld a,(0c244h)		;6f59
	ld (ix+002h),a		;6f5c
	ld a,(0c246h)		;6f5f
	ld (ix+004h),a		;6f62
	ld a,(0c00dh)		;6f65
	and 007h		;6f68
	ret nz			;6f6a
	ld a,00eh		;6f6b
	jp 056e3h		;6f6d
L_6F70:
	ret			;6f70
L_6F71:
	ld b,004h		;6f71
	ld hl,0de10h		;6f73
	ld a,0e0h		;6f76
	ld de,00004h		;6f78
L_6F7B:
	ld (hl),a			;6f7b
	add hl,de			;6f7c
	djnz L_6F7B		;6f7d
	ld a,(0c320h)		;6f7f
	cp 009h		;6f82
	ret z			;6f84
	ld ix,0c320h		;6f85
	ld b,004h		;6f89
L_6F8B:
	push bc			;6f8b
	call 054afh		;6f8c
	call L_6F9F		;6f8f
	call 05464h		;6f92
	ld de,00020h		;6f95
	add ix,de		;6f98
	pop bc			;6f9a
	djnz L_6F8B		;6f9b
	jr L_6FF7		;6f9d
L_6F9F:
	ld a,(ix+000h)		;6f9f
	or a			;6fa2
	ret z			;6fa3
	ld hl,0b7c9h		;6fa4
	ld a,(ix+00ah)		;6fa7
	call 0543ah		;6faa
	ld b,(hl)			;6fad
	inc hl			;6fae
	ld a,(ix+00ch)		;6faf
	ld de,0de00h		;6fb2
	add a,a			;6fb5
	add a,a			;6fb6
	call 04088h		;6fb7
	push bc			;6fba
	ld a,b			;6fbb
	add a,a			;6fbc
	add a,a			;6fbd
	ld c,a			;6fbe
	ld b,000h		;6fbf
	push de			;6fc1
	ldir		;6fc2
	pop de			;6fc4
	pop bc			;6fc5
L_6FC6:
	ld c,002h		;6fc6
	push ix		;6fc8
	pop hl			;6fca
	inc hl			;6fcb
	inc hl			;6fcc
L_6FCD:
	call L_6FDB		;6fcd
	inc hl			;6fd0
	inc hl			;6fd1
	inc de			;6fd2
	dec c			;6fd3
	jr nz,L_6FCD		;6fd4
	inc de			;6fd6
	inc de			;6fd7
	djnz L_6FC6		;6fd8
	ret			;6fda
L_6FDB:
	ld a,(de)			;6fdb
	cp 080h		;6fdc
	jr nc,L_6FE9		;6fde
	add a,(hl)			;6fe0
	call c,L_6FE6		;6fe1
	ld (de),a			;6fe4
	ret			;6fe5
L_6FE6:
	ld a,0ffh		;6fe6
	ret			;6fe8
L_6FE9:
	neg		;6fe9
	push bc			;6feb
	ld b,a			;6fec
	ld a,(hl)			;6fed
	sub b			;6fee
	pop bc			;6fef
	call c,L_6FF5		;6ff0
	ld (de),a			;6ff3
	ret			;6ff4
L_6FF5:
	xor a			;6ff5
	ret			;6ff6
L_6FF7:
	ld a,(0c240h)		;6ff7
	or a			;6ffa
	jr z,L_701A		;6ffb
	ld a,(0c316h)		;6ffd
	ld b,a			;7000
	ld a,(0c20ah)		;7001
	or b			;7004
	jr z,L_701A		;7005
	ld b,004h		;7007
	ld hl,0de13h		;7009
L_700C:
	ld a,(hl)			;700c
	cp 049h		;700d
	jr nz,L_7013		;700f
	ld (hl),04bh		;7011
L_7013:
	ld a,004h		;7013
	call 04083h		;7015
	djnz L_700C		;7018
L_701A:
	ld hl,0de13h		;701a
	ld de,0dc40h		;701d
	ld c,004h		;7020
L_7022:
	ld a,(hl)			;7022
	ld b,010h		;7023
L_7025:
	ld (de),a			;7025
	inc de			;7026
	djnz L_7025		;7027
	ld a,004h		;7029
	call 04083h		;702b
	dec c			;702e
	jr nz,L_7022		;702f
	ret			;7031
L_7032:
	ld a,(0c257h)		;7032
	or a			;7035
	ret z			;7036
	ld de,00020h		;7037
	ld hl,0c320h		;703a
	ld b,004h		;703d
L_703F:
	ld a,(hl)			;703f
	or a			;7040
	ret nz			;7041
	add hl,de			;7042
	djnz L_703F		;7043
	xor a			;7045
	ld (0c257h),a		;7046
	jp 05a97h		;7049
L_704C:
	ld a,(0c222h)		;704c
	ld b,a			;704f
	ld a,e			;7050
	add a,004h		;7051
	ld e,a			;7053
	call L_7176		;7054
	dec a			;7057
	cp b			;7058
	ret			;7059
L_705A:
	ld a,(0c24bh)		;705a
	cp 001h		;705d
	jr nz,L_7067		;705f
	ld a,(0c251h)		;7061
	or a			;7064
	jr nz,L_706D		;7065
L_7067:
	ld a,(0ccb0h)		;7067
	or a			;706a
	scf			;706b
	ret nz			;706c
L_706D:
	ld a,(0c246h)		;706d
	call L_7087		;7070
	ld d,a			;7073
	ld a,h			;7074
	cp 0d0h		;7075
	ret nc			;7077
	ld e,h			;7078
	ld c,005h		;7079
	jp L_7132		;707b
L_707E:
	ld de,(0c245h)		;707e
	ld hl,(0c249h)		;7082
	add hl,de			;7085
	ret			;7086
L_7087:
	ld de,(0c243h)		;7087
	ld hl,(0c247h)		;708b
	add hl,de			;708e
	ret			;708f
L_7090:
	ld a,(0c246h)		;7090
	call L_7087		;7093
	ld d,a			;7096
	ld a,h			;7097
	add a,0eeh		;7098
	ld e,a			;709a
	ld c,004h		;709b
	jp L_7132		;709d
L_70A0:
	call L_70C8		;70a0
	ccf			;70a3
	ret nc			;70a4
	ld a,(0c244h)		;70a5
	sub 004h		;70a8
	jr L_70BA		;70aa
L_70AC:
	call L_70C8		;70ac
	ccf			;70af
	ret nc			;70b0
	ld a,(0c244h)		;70b1
	add a,00dh		;70b4
	cp 0d4h		;70b6
	jr nc,L_70C6		;70b8
L_70BA:
	ld e,a			;70ba
	ld a,(0c246h)		;70bb
	ld d,a			;70be
L_70BF:
	call L_7176		;70bf
	dec a			;70c2
	jp L_7141		;70c3
L_70C6:
	scf			;70c6
	ret			;70c7
L_70C8:
	ld a,(0c246h)		;70c8
	add a,003h		;70cb
	and 00fh		;70cd
	cp 006h		;70cf
	ret			;70d1
L_70D2:
	ld a,d			;70d2
	cp 080h		;70d3
	jr c,L_70DF		;70d5
	ld a,(0ccb2h)		;70d7
	or a			;70da
	scf			;70db
	ret nz			;70dc
	jr L_70E5		;70dd
L_70DF:
	ld a,(0ccb1h)		;70df
	or a			;70e2
	scf			;70e3
	ret nz			;70e4
L_70E5:
	push de			;70e5
	ld e,000h		;70e6
	ld hl,(0c245h)		;70e8
	add hl,de			;70eb
	ld de,(0c249h)		;70ec
	add hl,de			;70f0
	pop de			;70f1
	ld d,h			;70f2
	push de			;70f3
	ld d,e			;70f4
	ld e,000h		;70f5
	ld hl,(0c243h)		;70f7
	add hl,de			;70fa
	ld de,(0c247h)		;70fb
	add hl,de			;70ff
	pop de			;7100
	ld e,h			;7101
	ld a,d			;7102
	cp 008h		;7103
	jr nc,L_7110		;7105
	ld a,(0c21ah)		;7107
	cp 0ffh		;710a
	scf			;710c
	ret z			;710d
	jr L_711B		;710e
L_7110:
	cp 0f8h		;7110
	jr c,L_711B		;7112
	ld a,(0c21bh)		;7114
	cp 0ffh		;7117
	scf			;7119
	ret z			;711a
L_711B:
	ld c,008h		;711b
	push de			;711d
	call L_7167		;711e
	pop de			;7121
	ret c			;7122
	push de			;7123
	call L_704C		;7124
	pop de			;7127
	ret c			;7128
	ld c,005h		;7129
	push de			;712b
	call L_7167		;712c
	pop de			;712f
	ret c			;7130
	ret			;7131
L_7132:
	push de			;7132
	ld a,c			;7133
	add a,d			;7134
	ld d,a			;7135
	call L_704C		;7136
	pop de			;7139
	ret c			;713a
	ld a,d			;713b
	sub c			;713c
	ld d,a			;713d
	jp L_704C		;713e
L_7141:
	inc a			;7141
	ld b,a			;7142
	ld e,a			;7143
	ld a,(0c223h)		;7144
	ld d,a			;7147
	ld a,b			;7148
	sub d			;7149
	ccf			;714a
	ret nc			;714b
	ld b,a			;714c
	ld a,(0c224h)		;714d
	ld d,a			;7150
	ld a,b			;7151
	cp d			;7152
	ret c			;7153
	ld a,(0c21dh)		;7154
	cp 006h		;7157
	scf			;7159
	ccf			;715a
	ret nz			;715b
	ld a,e			;715c
	cp 026h		;715d
	scf			;715f
	ret z			;7160
	cp 02dh		;7161
	scf			;7163
	ret z			;7164
	or a			;7165
	ret			;7166
L_7167:
	push de			;7167
	ld a,c			;7168
	add a,e			;7169
	ld e,a			;716a
	call L_704C		;716b
	pop de			;716e
	ret c			;716f
	ld a,e			;7170
	sub c			;7171
	ld e,a			;7172
	jp L_704C		;7173
L_7176:
	ld a,e			;7176
	cp 0d4h		;7177
	jr nc,L_719F		;7179
	cp 018h		;717b
	jr c,L_7196		;717d
	rrca			;717f
	rrca			;7180
	rrca			;7181
	and 01fh		;7182
	ld h,a			;7184
	ld a,d			;7185
	srl h		;7186
	rra			;7188
	srl h		;7189
	rra			;718b
	srl h		;718c
	rra			;718e
	ld l,a			;718f
	ld de,0d1a0h		;7190
	add hl,de			;7193
	ld a,(hl)			;7194
	ret			;7195
L_7196:
	ld a,(0c268h)		;7196
	or a			;7199
	jr nz,L_719F		;719a
	ld a,001h		;719c
	ret			;719e
L_719F:
	xor a			;719f
	ret			;71a0
L_71A1:
	ld c,004h		;71a1
	ld iy,0c320h		;71a3
L_71A7:
	ld b,008h		;71a7
	ld ix,0c400h		;71a9
L_71AD:
	ld a,(ix+000h)		;71ad
	or a			;71b0
	jr z,L_71DC		;71b1
	ld a,(ix+013h)		;71b3
	and 002h		;71b6
	jr z,L_71DC		;71b8
	ld a,(iy+000h)		;71ba
	or a			;71bd
	jr z,L_71E3		;71be
	ld a,(iy+010h)		;71c0
	or a			;71c3
	jr z,L_71E3		;71c4
	push bc			;71c6
	call L_7444		;71c7
	exx			;71ca
	push de			;71cb
	exx			;71cc
	push de			;71cd
	call L_74A9		;71ce
	pop de			;71d1
	exx			;71d2
	pop de			;71d3
	exx			;71d4
	call L_74CB		;71d5
	call c,L_71F2		;71d8
	pop bc			;71db
L_71DC:
	ld de,00080h		;71dc
	add ix,de		;71df
	djnz L_71AD		;71e1
L_71E3:
	ld de,00020h		;71e3
	add iy,de		;71e6
	dec c			;71e8
	jr nz,L_71A7		;71e9
	ret			;71eb
L_71EC:
	ld (iy+010h),000h		;71ec
	jr L_720B		;71f0
L_71F2:
	ld a,(iy+000h)		;71f2
	ld (0de80h),a		;71f5
	cp 001h		;71f8
	jr z,L_71EC		;71fa
	cp 006h		;71fc
	jr nc,L_71EC		;71fe
	push ix		;7200
	push iy		;7202
	pop ix		;7204
	call L_6E17		;7206
	pop ix		;7209
L_720B:
	ld a,(ix+000h)		;720b
	cp 00eh		;720e
	jr z,$+45		;7210
	cp 008h		;7212
	jr z,$+59		;7214
	cp 00fh		;7216
	jr z,$+81		;7218
L_721A:
	ld a,(0de80h)		;721a
	dec a			;721d
	ld hl,07234h		;721e
	call 04083h		;7221
	ld b,(hl)			;7224
	ld a,(ix+012h)		;7225
	sub b			;7228
	jr nc,L_722C		;7229
	xor a			;722b
L_722C:
	ld (ix+012h),a		;722c
	ld a,017h		;722f
	jp 056e3h		;7231

; ----------------------------------------------------------------------
; DATOS tabla_p721E: 9 bytes que lee p01:721E (ld hl,0x7234)
;   0x7234..0x723d  (9 bytes)
DATA_tabla_p721E:
	defb 001h,001h,001h,001h,001h,001h,004h,004h,001h	; 7234  .........

; ======================================================================
; CODIGO 0x723d..0x7429  (492 bytes)
; ======================================================================


L_723D:
	ld a,(ix+001h)		;723d
	or a			;7240
	jr nz,$-39		;7241
	ld (ix+013h),000h		;7243
	inc (ix+001h)		;7247
	ld a,018h		;724a
	jp 056e3h		;724c
L_724F:
	ld a,(ix+001h)		;724f
	cp 002h		;7252
	jr nc,$-58		;7254
	cp 001h		;7256
	call z,L_721A		;7258
	ld a,(ix+012h)		;725b
	or a			;725e
	ret nz			;725f
	ld (ix+001h),002h		;7260
	ld (ix+012h),001h		;7264
	ret			;7268
L_7269:
	ld a,01ch		;7269
	call 056e3h		;726b
	ld (ix+001h),003h		;726e
	ld (ix+010h),07fh		;7272
	call 08b89h		;7276
	ld h,004h		;7279
	call 08b80h		;727b
	xor a			;727e
	ld (ix+013h),a		;727f
	ld (ix+00bh),a		;7282
	ret			;7285
L_7286:
	ld a,(0c24bh)		;7286
	cp 004h		;7289
	ret z			;728b
	cp 006h		;728c
	ret z			;728e
	ld b,008h		;728f
	ld ix,0c400h		;7291
L_7295:
	ld a,(ix+000h)		;7295
	or a			;7298
	jr z,L_72C0		;7299
	ld a,(ix+013h)		;729b
	and 001h		;729e
	jr z,L_72C0		;72a0
	push bc			;72a2
	call L_73FD		;72a3
	ld a,(ix+000h)		;72a6
	cp 037h		;72a9
	jp z,L_73BE		;72ab
	exx			;72ae
	push de			;72af
	exx			;72b0
	push de			;72b1
	call L_74A9		;72b2
	pop de			;72b5
	exx			;72b6
	pop de			;72b7
	exx			;72b8
	call L_74CB		;72b9
L_72BC:
	call c,L_72C8		;72bc
	pop bc			;72bf
L_72C0:
	ld de,00080h		;72c0
	add ix,de		;72c3
	djnz L_7295		;72c5
	ret			;72c7
L_72C8:
	ld a,(ix+000h)		;72c8
	cp 029h		;72cb
	jp z,L_7539		;72cd
	cp 02ah		;72d0
	jp z,L_7539		;72d2
	cp 00eh		;72d5
	call z,L_73AC		;72d7
	call L_732B		;72da
	ret c			;72dd
	call L_7398		;72de
	ret c			;72e1
	ld a,(0c256h)		;72e2
	or a			;72e5
	ret nz			;72e6
	ld hl,0c2b0h		;72e7
	ld a,(0c240h)		;72ea
	add a,a			;72ed
	add a,a			;72ee
	add a,a			;72ef
	add a,a			;72f0
	add a,a			;72f1
	add a,005h		;72f2
	ld e,a			;72f4
	ld d,000h		;72f5
	add hl,de			;72f7
	ld a,(hl)			;72f8
	ld b,a			;72f9
	ld c,004h		;72fa
	ld a,(0c205h)		;72fc
	and 002h		;72ff
	jr z,L_7305		;7301
	srl c		;7303
L_7305:
	ld a,b			;7305
	sub c			;7306
	jr nc,L_730B		;7307
	ld a,000h		;7309
L_730B:
	ld (hl),a			;730b
	call L_6351		;730c
L_730F:
	call 047ebh		;730f
	cp 00dh		;7312
	ld a,01dh		;7314
	jr nc,L_731A		;7316
	ld a,023h		;7318
L_731A:
	call 056e3h		;731a
	call 04752h		;731d
	ld a,020h		;7320
	ld (0c24fh),a		;7322
	ld a,001h		;7325
	ld (0c256h),a		;7327
	ret			;732a
L_732B:
	ld a,(ix+000h)		;732b
	cp 007h		;732e
	jr z,L_7338		;7330
	cp 00dh		;7332
	jr z,L_7338		;7334
	or a			;7336
	ret			;7337
L_7338:
	ld a,(0c24bh)		;7338
	cp 003h		;733b
	jr z,L_734A		;733d
	cp 001h		;733f
	jr z,L_7345		;7341
	or a			;7343
	ret			;7344
L_7345:
	ld a,(0c251h)		;7345
	or a			;7348
	ret nz			;7349
L_734A:
	ld a,(ix+000h)		;734a
	cp 007h		;734d
	jr z,L_7357		;734f
	cp 00dh		;7351
	jr z,L_736C		;7353
L_7355:
	or a			;7355
	ret			;7356
L_7357:
	ld a,(ix+001h)		;7357
	cp 002h		;735a
	jr c,L_7355		;735c
	cp 004h		;735e
	jr nc,L_7355		;7360
	ld (ix+001h),004h		;7362
	ld (ix+010h),062h		;7366
	jr L_7383		;736a
L_736C:
	ld a,(ix+001h)		;736c
	cp 001h		;736f
	jr z,L_737B		;7371
	cp 002h		;7373
	jr z,L_737B		;7375
	cp 004h		;7377
	jr nz,L_7355		;7379
L_737B:
	ld (ix+001h),006h		;737b
	ld (ix+010h),063h		;737f
L_7383:
	call 08b89h		;7383
	call 08b7eh		;7386
	ld a,009h		;7389
	call 056e3h		;738b
	ld (ix+011h),020h		;738e
	ld (ix+013h),000h		;7392
	scf			;7396
	ret			;7397
L_7398:
	ld a,(0c26fh)		;7398
	or a			;739b
	ret z			;739c
	ld a,(0c2d6h)		;739d
	cp 003h		;73a0
	ccf			;73a2
	ret nc			;73a3
	ld a,(ix+000h)		;73a4
	cp 037h		;73a7
	ret nc			;73a9
	scf			;73aa
	ret			;73ab
L_73AC:
	ld a,(ix+001h)		;73ac
	or a			;73af
	ret nz			;73b0
	ld a,018h		;73b1
	call 056e3h		;73b3
	ld (ix+013h),000h		;73b6
	inc (ix+001h)		;73ba
	ret			;73bd
L_73BE:
	ld b,(ix+020h)		;73be
	push ix		;73c1
	pop hl			;73c3
	ld a,022h		;73c4
	call 04083h		;73c6
L_73C9:
	push bc			;73c9
	exx			;73ca
	push de			;73cb
	exx			;73cc
	push de			;73cd
	push hl			;73ce
	call L_73E7		;73cf
	pop hl			;73d2
	push af			;73d3
	ld de,00005h		;73d4
	add hl,de			;73d7
	pop af			;73d8
	pop de			;73d9
	exx			;73da
	pop de			;73db
	exx			;73dc
	pop bc			;73dd
	jp c,L_72BC		;73de
	djnz L_73C9		;73e1
	or a			;73e3
	jp L_72BC		;73e4
L_73E7:
	push de			;73e7
	ex de,hl			;73e8
	inc de			;73e9
	ld a,(de)			;73ea
	add a,00ch		;73eb
	dec de			;73ed
	ld h,a			;73ee
	ld l,004h		;73ef
	ld a,(de)			;73f1
	add a,008h		;73f2
	pop de			;73f4
	exx			;73f5
	ld h,a			;73f6
	ld l,004h		;73f7
	exx			;73f9
	jp L_74CB		;73fa
L_73FD:
	call L_7431		;73fd
	jr c,L_7419		;7400
	ld hl,0742dh		;7402
	ld a,(0c253h)		;7405
	sub 008h		;7408
	jr z,L_7412		;740a
	dec a			;740c
	jr z,L_7412		;740d
	ld hl,07429h		;740f
L_7412:
	ld a,(0c240h)		;7412
	add a,a			;7415
	call 04083h		;7416
L_7419:
	ld a,(0c246h)		;7419
	ld d,a			;741c
	ld e,(hl)			;741d
	inc hl			;741e
	push hl			;741f
	exx			;7420
	pop hl			;7421
	ld a,(0c244h)		;7422
	ld d,a			;7425
	ld e,(hl)			;7426
	exx			;7427
	ret			;7428

; ----------------------------------------------------------------------
; DATOS tabla_p740F: 8 bytes: 0x7429 lo lee p01:740F y 0x742D p01:7402
;   0x7429..0x7431  (8 bytes)
DATA_tabla_p740F:
	defb 006h,00fh,006h,00eh,008h,00ch,008h,00ah	; 7429  ........

; ======================================================================
; CODIGO 0x7431..0x7442  (17 bytes)
; ======================================================================


L_7431:
	ld a,(0c26fh)		;7431
	or a			;7434
	ret z			;7435
	ld a,(0c2d6h)		;7436
	cp 003h		;7439
	ccf			;743b
	ret nc			;743c
	ld hl,07442h		;743d
	scf			;7440
	ret			;7441

; ----------------------------------------------------------------------
; DATOS tabla_p743D: 2 bytes que lee p01:743D (ld hl,0x7442)
;   0x7442..0x7444  (2 bytes)
DATA_tabla_p743D:
	defb 008h,008h	; 7442

; ======================================================================
; CODIGO 0x7444..0x758c  (328 bytes)
; ======================================================================


L_7444:
	call 054a5h		;7444
	call L_744D		;7447
	jp 05464h		;744a
L_744D:
	ld a,(iy+000h)		;744d
	cp 007h		;7450
	jr z,L_7484		;7452
	cp 008h		;7454
	jr z,L_7484		;7456
	ld hl,0beadh		;7458
	dec a			;745b
	add a,a			;745c
	call 04083h		;745d
	ld a,(iy+004h)		;7460
	ld d,a			;7463
	ld e,(hl)			;7464
	inc hl			;7465
	push hl			;7466
	ld a,(iy+002h)		;7467
	exx			;746a
	pop hl			;746b
	ld d,a			;746c
	ld e,(hl)			;746d
	exx			;746e
	ld a,(iy+000h)		;746f
	cp 001h		;7472
	jr z,L_7477		;7474
	ret			;7476
L_7477:
	ld a,(iy+00ah)		;7477
	dec a			;747a
	and 003h		;747b
	add a,a			;747d
	add a,a			;747e
	add a,a			;747f
	add a,008h		;7480
	ld e,a			;7482
	ret			;7483
L_7484:
	ld a,(0c250h)		;7484
	or a			;7487
	ld a,00ah		;7488
	jr nz,L_748E		;748a
	ld a,0f6h		;748c
L_748E:
	add a,(iy+004h)		;748e
	ld d,a			;7491
	ld e,004h		;7492
	exx			;7494
	ld a,(iy+00ah)		;7495
	sub 009h		;7498
	ld hl,0bea7h		;749a
	call 04083h		;749d
	ld a,(hl)			;74a0
	add a,(iy+002h)		;74a1
	ld d,a			;74a4
	ld e,004h		;74a5
	exx			;74a7
	ret			;74a8
L_74A9:
	call 054b4h		;74a9
	ld a,(ix+000h)		;74ac
	dec a			;74af
	add a,a			;74b0
	ld hl,0b6d3h		;74b1
	call 04083h		;74b4
	ld a,(ix+005h)		;74b7
	ld d,a			;74ba
	ld e,(hl)			;74bb
	inc hl			;74bc
	push hl			;74bd
	ld a,(ix+003h)		;74be
	exx			;74c1
	pop hl			;74c2
	ld d,a			;74c3
	ld e,(hl)			;74c4
	ex de,hl			;74c5
	exx			;74c6
	ex de,hl			;74c7
	jp 05464h		;74c8
L_74CB:
	ld a,e			;74cb
	add a,l			;74cc
	ld b,a			;74cd
	add a,a			;74ce
	ld c,a			;74cf
	ld a,d			;74d0
	sub h			;74d1
	add a,b			;74d2
	cp c			;74d3
	ret nc			;74d4
	exx			;74d5
	ld a,d			;74d6
	sub e			;74d7
	ld d,a			;74d8
	ld a,h			;74d9
	sub l			;74da
	ld h,a			;74db
	ld a,e			;74dc
	add a,l			;74dd
	ld b,a			;74de
	add a,a			;74df
	ld c,a			;74e0
	ld a,d			;74e1
	sub h			;74e2
	add a,b			;74e3
	cp c			;74e4
	exx			;74e5
	ret			;74e6
L_74E7:
	ld a,(0c20ah)		;74e7
	or a			;74ea
	jr nz,L_74FC		;74eb
	ld a,011h		;74ed
	ld (0c222h),a		;74ef
	inc a			;74f2
	ld (0c223h),a		;74f3
	ld a,002h		;74f6
	ld (0c224h),a		;74f8
	ret			;74fb
L_74FC:
	xor a			;74fc
	ld (0c223h),a		;74fd
	ld (0c224h),a		;7500
	ld a,013h		;7503
	ld (0c222h),a		;7505
	ret			;7508
L_7509:
	ld a,(ix+000h)		;7509
	cp 029h		;750c
	ret z			;750e
	ld a,(ix+015h)		;750f
	cp 005h		;7512
	ret nc			;7514
	ld hl,0e000h		;7515
	ld b,0a0h		;7518
L_751A:
	ld a,(hl)			;751a
	or a			;751b
	jr z,L_7525		;751c
	inc hl			;751e
	inc hl			;751f
	inc hl			;7520
	inc hl			;7521
	djnz L_751A		;7522
	ret			;7524
L_7525:
	ld a,(ix+005h)		;7525
	ld (hl),a			;7528
	inc hl			;7529
	ld a,(ix+003h)		;752a
	ld (hl),a			;752d
	inc hl			;752e
	ld a,(0c212h)		;752f
	ld (hl),a			;7532
	inc hl			;7533
	ld a,(0c211h)		;7534
	ld (hl),a			;7537
	ret			;7538
L_7539:
	call L_7509		;7539
	ld a,(ix+015h)		;753c
	dec a			;753f
	push iy		;7540
	push ix		;7542
	pop iy		;7544
	push ix		;7546
	call L_7583		;7548
	pop ix		;754b
	pop iy		;754d
	ld a,(ix+000h)		;754f
	cp 029h		;7552
	jp z,083d6h		;7554
	jp L_755A		;7557
L_755A:
	ld a,(ix+005h)		;755a
	sub 008h		;755d
	ld d,a			;755f
	ld a,(ix+003h)		;7560
	sub 010h		;7563
	ld e,a			;7565
	ld a,(ix+01fh)		;7566
	ld hl,0a802h		;7569
	call 0543ah		;756c
	ld bc,01010h		;756f
	call 04841h		;7572
	ld a,(ix+01fh)		;7575
	ld hl,0cc60h		;7578
	call 04083h		;757b
	xor a			;757e
	ld (hl),a			;757f
	jp 083d6h		;7580
L_7583:
	push af			;7583
	call L_6234		;7584
	pop af			;7587
	ld b,a			;7588
	call 0408dh		;7589

; ----------------------------------------------------------------------
; DATOS saltos_758C: tabla de 13 palabras del despachador (call 0x408D en
;   0x7589); lo leen L_408D (26 bytes)
;   0x758c..0x75a6  (26 bytes)
DATA_saltos_758C:
	defb 0a6h,075h	; 758c
	defb 0abh,075h	; 758e
	defb 0b0h,075h	; 7590
	defb 0b5h,075h	; 7592
	defb 0c3h,075h	; 7594
	defb 0cfh,075h	; 7596
	defb 0dch,075h	; 7598
	defb 0eeh,075h	; 759a
	defb 0f1h,075h	; 759c
	defb 0f5h,075h	; 759e
	defb 0f9h,075h	; 75a0
	defb 0abh,075h	; 75a2
	defb 0b0h,075h	; 75a4

; ======================================================================
; CODIGO 0x75a6..0x765b  (181 bytes)
; ======================================================================


L_75A6:
	ld de,00001h		;75a6
	jr L_75B8		;75a9
L_75AB:
	ld de,00005h		;75ab
	jr L_75B8		;75ae
L_75B0:
	ld de,00010h		;75b0
	jr L_75B8		;75b3
L_75B5:
	ld de,00100h		;75b5
L_75B8:
	call 055b9h		;75b8
	call 04782h		;75bb
	ld a,021h		;75be
	jp 056e3h		;75c0
L_75C3:
	ld hl,0c310h		;75c3
	inc (hl)			;75c6
	call 090bah		;75c7
	ld a,040h		;75ca
	jp 056e3h		;75cc
L_75CF:
	ld hl,0687ch		;75cf
	ld de,0787ch		;75d2
	ld bc,01008h		;75d5
	xor a			;75d8
	call 04bdeh		;75d9
L_75DC:
	ld hl,0c310h		;75dc
	inc (hl)			;75df
	xor a			;75e0
	ld (0c314h),a		;75e1
	ld a,040h		;75e4
	call 056e3h		;75e6
	ld a,0ffh		;75e9
	jp 056e3h		;75eb
L_75EE:
	xor a			;75ee
	jr L_75FB		;75ef
L_75F1:
	ld a,001h		;75f1
	jr L_75FB		;75f3
L_75F5:
	ld a,002h		;75f5
	jr L_75FB		;75f7
L_75F9:
	ld a,003h		;75f9
L_75FB:
	push ix		;75fb
	push af			;75fd
	call L_6234		;75fe
	pop af			;7601
	ld (ix+006h),a		;7602
	call 05b12h		;7605
	pop ix		;7608
	call 0485ah		;760a
	ld a,001h		;760d
	ld (0c257h),a		;760f
	call L_761D		;7612
	ld a,022h		;7615
	call 056e3h		;7617
	jp 054c1h		;761a
L_761D:
	call 05ab8h		;761d
	ld a,010h		;7620
	ld (0c272h),a		;7622
L_7625:
	ld a,(0c244h)		;7625
	sub 030h		;7628
	ld l,a			;762a
	ld a,(0c246h)		;762b
	sub 008h		;762e
	ld h,a			;7630
	ld (0de20h),hl		;7631
	ld (0de24h),hl		;7634
	ld a,028h		;7637
	ld (0de22h),a		;7639
	ld a,02ch		;763c
	ld (0de26h),a		;763e
	call 08c16h		;7641
	add a,a			;7644
	ld hl,0765bh		;7645
	call 04083h		;7648
	ld a,(hl)			;764b
	ld de,0dc80h		;764c
	call L_7654		;764f
	inc hl			;7652
	ld a,(hl)			;7653
L_7654:
	ld b,010h		;7654
L_7656:
	ld (de),a			;7656
	inc de			;7657
	djnz L_7656		;7658
	ret			;765a

; ----------------------------------------------------------------------
; DATOS tabla_p7645: 8 bytes que lee p01:7645 (ld hl,0x765B)
;   0x765b..0x7663  (8 bytes)
DATA_tabla_p7645:
	defb 00ah,00dh,00ah,00dh,00bh,00dh,00bh,00dh	; 765b  ........

; ======================================================================
; CODIGO 0x7663..0x76ae  (75 bytes)
; ======================================================================


L_7663:
	ld ix,0cd00h		;7663
	ld b,009h		;7667
L_7669:
	push bc			;7669
	call L_76A2		;766a
	ld a,(ix+000h)		;766d
	and a			;7670
	jr z,L_7682		;7671
	call 08367h		;7673
	call 08393h		;7676
	call L_76FC		;7679
	call L_78BD		;767c
	call L_76C8		;767f
L_7682:
	ld de,00080h		;7682
	add ix,de		;7685
	pop bc			;7687
	djnz L_7669		;7688
	ld ix,0cd00h		;768a
	ld b,009h		;768e
L_7690:
	push bc			;7690
	push ix		;7691
	pop hl			;7693
	ld a,(hl)			;7694
	and a			;7695
	call nz,08ab8h		;7696
	pop bc			;7699
	ld de,00080h		;769a
	add ix,de		;769d
	djnz L_7690		;769f
	ret			;76a1
L_76A2:
	ld a,(ix+000h)		;76a2
	and a			;76a5
	ret z			;76a6
	ld b,(ix+001h)		;76a7
	dec a			;76aa
	call 0408dh		;76ab

; ----------------------------------------------------------------------
; DATOS saltos_76AE: tabla de 13 palabras del despachador (call 0x408D en
;   0x76AB); lo leen L_408D (26 bytes)
;   0x76ae..0x76c8  (26 bytes)
DATA_saltos_76AE:
	defb 0abh,0bah	; 76ae
	defb 03ah,0bbh	; 76b0
	defb 019h,0bch	; 76b2
	defb 0b6h,0bch	; 76b4
	defb 084h,0bch	; 76b6
	defb 028h,0bdh	; 76b8
	defb 04eh,0bdh	; 76ba
	defb 0ffh,0bdh	; 76bc
	defb 09dh,0bdh	; 76be
	defb 060h,0beh	; 76c0
	defb 0ddh,0beh	; 76c2
	defb 0a0h,0bfh	; 76c4
	defb 06fh,07eh	; 76c6

; ======================================================================
; CODIGO 0x76c8..0x77a0  (216 bytes)
; ======================================================================


L_76C8:
	ld a,(ix+000h)		;76c8
	cp 006h		;76cb
	jr z,L_76D2		;76cd
	cp 00ch		;76cf
	ret nz			;76d1
L_76D2:
	ld a,(ix+003h)		;76d2
	sub 0d7h		;76d5
	cp 020h		;76d7
	ret nc			;76d9
L_76DA:
	push ix		;76da
	pop de			;76dc
	ld a,(ix+020h)		;76dd
	and a			;76e0
	jp z,083d6h		;76e1
	ld b,a			;76e4
	ld a,e			;76e5
	add a,021h		;76e6
	ld e,a			;76e8
L_76E9:
	ld hl,0cc80h		;76e9
	ld a,(de)			;76ec
	call 04083h		;76ed
	ld (hl),000h		;76f0
	inc e			;76f2
	inc e			;76f3
	inc e			;76f4
	inc e			;76f5
	inc e			;76f6
	djnz L_76E9		;76f7
	jp 083d6h		;76f9
L_76FC:
	call 054a5h		;76fc
	push ix		;76ff
	pop de			;7701
	ld a,e			;7702
	or 024h		;7703
	ld e,a			;7705
	ld a,(ix+000h)		;7706
	ld hl,0b57eh		;7709
	call 0543ah		;770c
	ld a,(ix+010h)		;770f
	call 0543ah		;7712
	ld b,(hl)			;7715
	ld a,b			;7716
	and a			;7717
	jp z,05464h		;7718
	ld (ix+020h),a		;771b
L_771E:
	inc hl			;771e
	ld a,(hl)			;771f
	ld (de),a			;7720
	inc hl			;7721
	inc e			;7722
	ld a,(hl)			;7723
	ld (de),a			;7724
	inc e			;7725
	inc e			;7726
	inc e			;7727
	inc e			;7728
	djnz L_771E		;7729
	jp 05464h		;772b
L_772E:
	ld a,(0c20ah)		;772e
	and a			;7731
	ret nz			;7732
	call 054a5h		;7733
	ld ix,0d100h		;7736
	ld a,(ix+000h)		;773a
	cp 00dh		;773d
	jr nz,L_774B		;773f
	push af			;7741
	ld a,00dh		;7742
	call 05396h		;7744
	pop af			;7747
	call L_787B		;7748
L_774B:
	ld a,(0c211h)		;774b
	ld hl,0a4f9h		;774e
	call 0543ah		;7751
	ld a,(0c212h)		;7754
	dec a			;7757
	call 0543ah		;7758
	ex de,hl			;775b
	ld a,(de)			;775c
	and a			;775d
	jp z,05464h		;775e
	ld b,a			;7761
	ld ix,0cd00h		;7762
L_7766:
	inc de			;7766
	push bc			;7767
	call L_7776		;7768
	ld bc,00080h		;776b
	add ix,bc		;776e
	pop bc			;7770
	djnz L_7766		;7771
	jp 05464h		;7773
L_7776:
	push bc			;7776
	push de			;7777
	push hl			;7778
	call 0538ch		;7779
	pop hl			;777c
	pop de			;777d
	pop bc			;777e
	ld a,(de)			;777f
	ld c,a			;7780
	ld (ix+000h),a		;7781
	cp 002h		;7784
	jr z,L_7792		;7786
	inc de			;7788
	ld a,(de)			;7789
	ld (ix+003h),a		;778a
	inc de			;778d
	ld a,(de)			;778e
	ld (ix+005h),a		;778f
L_7792:
	push af			;7792
	push bc			;7793
	push de			;7794
	call L_7871		;7795
	pop de			;7798
	pop bc			;7799
	pop af			;779a
	ld a,c			;779b
	dec a			;779c
	call 0408dh		;779d

; ----------------------------------------------------------------------
; DATOS saltos_77A0: tabla de 12 palabras del despachador (call 0x408D en
;   0x779D); lo leen L_408D (24 bytes)
;   0x77a0..0x77b8  (24 bytes)
DATA_saltos_77A0:
	defb 0beh,077h	; 77a0
	defb 0bdh,077h	; 77a2
	defb 0b8h,077h	; 77a4
	defb 0c4h,077h	; 77a6
	defb 0c4h,077h	; 77a8
	defb 0bdh,077h	; 77aa
	defb 0beh,077h	; 77ac
	defb 0e3h,077h	; 77ae
	defb 02fh,078h	; 77b0
	defb 0bdh,077h	; 77b2
	defb 0cdh,077h	; 77b4
	defb 0bdh,077h	; 77b6

; ======================================================================
; CODIGO 0x77b8..0x7dad  (1525 bytes)
; ======================================================================


L_77B8:
	inc de			;77b8
	ld a,(de)			;77b9
	ld (ix+017h),a		;77ba
L_77BD:
	ret			;77bd
L_77BE:
	inc de			;77be
	ld a,(de)			;77bf
	ld (ix+011h),a		;77c0
	ret			;77c3
L_77C4:
	call L_77B8		;77c4
L_77C7:
	inc de			;77c7
	ld a,(de)			;77c8
	ld (ix+015h),a		;77c9
	ret			;77cc
L_77CD:
	call L_77B8		;77cd
	inc de			;77d0
	ld a,(de)			;77d1
	ld (ix+014h),a		;77d2
	call L_77C7		;77d5
	inc de			;77d8
	ld a,(de)			;77d9
	ld (ix+018h),a		;77da
	inc de			;77dd
	ld a,(de)			;77de
	ld (ix+019h),a		;77df
	ret			;77e2
L_77E3:
	exx			;77e3
	call L_780D		;77e4
	ld h,(ix+005h)		;77e7
	ld a,(ix+003h)		;77ea
	sub 008h		;77ed
	ld l,a			;77ef
	ld bc,01018h		;77f0
	ld a,004h		;77f3
	call 04bdeh		;77f5
	exx			;77f8
L_77F9:
	exx			;77f9
	ld hl,00078h		;77fa
	ld d,(ix+005h)		;77fd
	ld e,(ix+003h)		;7800
	ld bc,01010h		;7803
	ld a,048h		;7806
	call 04c73h		;7808
	exx			;780b
	ret			;780c
L_780D:
	push ix		;780d
	pop hl			;780f
	or a			;7810
	ld de,0cd00h		;7811
	sbc hl,de		;7814
	rl l		;7816
	rl h		;7818
	ld a,h			;781a
	cp 005h		;781b
	ld d,0e0h		;781d
	jr c,L_7825		;781f
	ld d,0f0h		;7821
	sub 005h		;7823
L_7825:
	add a,a			;7825
	add a,a			;7826
	add a,a			;7827
	ld b,a			;7828
	add a,a			;7829
	add a,b			;782a
	add a,058h		;782b
	ld e,a			;782d
	ret			;782e
L_782F:
	call L_77B8		;782f
L_7832:
	exx			;7832
	ld d,(ix+005h)		;7833
	ld e,(ix+003h)		;7836
	ld h,000h		;7839
	ld a,e			;783b
	sub 014h		;783c
	ld l,a			;783e
	add hl,hl			;783f
	add hl,hl			;7840
	ld a,d			;7841
	srl a		;7842
	srl a		;7844
	srl a		;7846
	call 04083h		;7848
	ld bc,0d200h		;784b
	add hl,bc			;784e
	ld b,008h		;784f
L_7851:
	ld (hl),001h		;7851
	inc hl			;7853
	djnz L_7851		;7854
	ld b,008h		;7856
	ld hl,0a858h		;7858
L_785B:
	push hl			;785b
	push de			;785c
	push bc			;785d
	ld bc,00808h		;785e
	ld a,040h		;7861
	call 04c73h		;7863
	pop bc			;7866
	pop de			;7867
	pop hl			;7868
	ld a,d			;7869
	add a,008h		;786a
	ld d,a			;786c
	djnz L_785B		;786d
	exx			;786f
	ret			;7870
L_7871:
	ld a,c			;7871
	cp 00ah		;7872
	ret z			;7874
	cp 009h		;7875
	ret z			;7877
	cp 008h		;7878
	ret z			;787a
L_787B:
	ld hl,0b57eh		;787b
	call 0543ah		;787e
	ld a,(ix+010h)		;7881
	call 0543ah		;7884
	ld a,(hl)			;7887
	and a			;7888
	ret z			;7889
	push ix		;788a
	pop de			;788c
	set 5,e		;788d
	inc e			;788f
	inc hl			;7890
	ld b,a			;7891
L_7892:
	push hl			;7892
	push bc			;7893
	call L_78A8		;7894
	pop bc			;7897
	pop hl			;7898
	ret nc			;7899
	push bc			;789a
	ld (de),a			;789b
	inc e			;789c
	inc e			;789d
	inc e			;789e
	ldi		;789f
	ldi		;78a1
	pop bc			;78a3
	djnz L_7892		;78a4
	scf			;78a6
	ret			;78a7
L_78A8:
	ld hl,0cc80h		;78a8
	ld bc,01600h		;78ab
L_78AE:
	ld a,(hl)			;78ae
	and a			;78af
	jr z,L_78B8		;78b0
	inc l			;78b2
	inc c			;78b3
	djnz L_78AE		;78b4
	or a			;78b6
	ret			;78b7
L_78B8:
	ld (hl),001h		;78b8
	ld a,c			;78ba
	scf			;78bb
	ret			;78bc
L_78BD:
	call 054a5h		;78bd
	push ix		;78c0
	pop hl			;78c2
	ld a,(hl)			;78c3
	call L_78E5		;78c4
	set 5,l		;78c7
	ld a,(hl)			;78c9
	and a			;78ca
	jr z,L_78E2		;78cb
	ld b,a			;78cd
	inc l			;78ce
L_78CF:
	inc l			;78cf
	ld a,(de)			;78d0
	add a,(ix+003h)		;78d1
	ld (hl),a			;78d4
	inc l			;78d5
	inc de			;78d6
	ld a,(de)			;78d7
	add a,(ix+005h)		;78d8
	ld (hl),a			;78db
	inc de			;78dc
	inc l			;78dd
	inc l			;78de
	inc l			;78df
	djnz L_78CF		;78e0
L_78E2:
	jp 05464h		;78e2
L_78E5:
	cp 007h		;78e5
	ld de,0b6eeh		;78e7
	ret z			;78ea
	ld de,0b6e6h		;78eb
	cp 004h		;78ee
	ret z			;78f0
	ld de,0b6d2h		;78f1
	cp 002h		;78f4
	ret z			;78f6
	ld de,0b6e2h		;78f7
	cp 008h		;78fa
	ret z			;78fc
	ld de,0b6eah		;78fd
	ret			;7900
L_7901:
	ld hl,01a24h		;7901
	ld bc,03870h		;7904
	ld a,l			;7907
	add a,b			;7908
	ld d,a			;7909
	exx			;790a
	ld b,00dh		;790b
	exx			;790d
L_790E:
	ld e,c			;790e
L_790F:
	xor a			;790f
	call 048dch		;7910
	ld a,l			;7913
	add a,00dh		;7914
	ld l,a			;7916
	and 07fh		;7917
	cp d			;7919
	jr c,L_790F		;791a
	ld a,080h		;791c
	sub b			;791e
	call 04083h		;791f
	dec e			;7922
	jr nz,L_790F		;7923
	exx			;7925
	dec b			;7926
	exx			;7927
	ret z			;7928
	push de			;7929
	push hl			;792a
	ld l,c			;792b
	ld h,000h		;792c
	add hl,hl			;792e
	add hl,hl			;792f
	add hl,hl			;7930
	add hl,hl			;7931
	add hl,hl			;7932
	add hl,hl			;7933
	add hl,hl			;7934
	ex de,hl			;7935
	pop hl			;7936
	sbc hl,de		;7937
	pop de			;7939
	push bc			;793a
	ld b,000h		;793b
L_793D:
	push bc			;793d
	ld b,000h		;793e
L_7940:
	djnz L_7940		;7940
	pop bc			;7942
	djnz L_793D		;7943
	pop bc			;7945
	jr L_790E		;7946
L_7948:
	ld hl,0cb00h		;7948
	ld b,008h		;794b
L_794D:
	push hl			;794d
	pop ix		;794e
	push hl			;7950
	push bc			;7951
	ld a,(hl)			;7952
	and a			;7953
	jr z,L_796A		;7954
	inc l			;7956
	ld a,(0c212h)		;7957
	cp (hl)			;795a
	jr nz,L_796A		;795b
	push hl			;795d
	call L_7B02		;795e
	pop hl			;7961
	push hl			;7962
	call L_7974		;7963
	pop hl			;7966
	call L_79A0		;7967
L_796A:
	pop bc			;796a
	pop hl			;796b
	ld a,020h		;796c
	call 04083h		;796e
	djnz L_794D		;7971
	ret			;7973
L_7974:
	ld a,(0c212h)		;7974
	cp (hl)			;7977
	ld c,000h		;7978
	jr z,L_797D		;797a
	inc c			;797c
L_797D:
	ld d,h			;797d
	ld a,l			;797e
	add a,010h		;797f
	ld e,a			;7981
	inc l			;7982
	inc l			;7983
	ld b,002h		;7984
L_7986:
	ld a,c			;7986
	and a			;7987
	ld a,0e0h		;7988
	jr nz,L_798F		;798a
	ld a,(hl)			;798c
	sub 010h		;798d
L_798F:
	ld (de),a			;798f
	inc l			;7990
	inc l			;7991
	inc e			;7992
	ld a,(hl)			;7993
	sub 008h		;7994
	ld (de),a			;7996
	dec l			;7997
	dec l			;7998
	inc e			;7999
	inc e			;799a
	inc e			;799b
	inc e			;799c
	djnz L_7986		;799d
	ret			;799f
L_79A0:
	ld a,l			;79a0
	add a,00fh		;79a1
	ld l,a			;79a3
	ld b,002h		;79a4
	jp 08abfh		;79a6
L_79A9:
	ld hl,0cb00h		;79a9
	ld bc,000ffh		;79ac
	call 05f08h		;79af
	call 054aah		;79b2
	ld a,(0c211h)		;79b5
	ld hl,0bf59h		;79b8
	call 0543ah		;79bb
	ex de,hl			;79be
	ld hl,0cb00h		;79bf
L_79C2:
	ld a,(de)			;79c2
	inc a			;79c3
	jp z,05464h		;79c4
	push hl			;79c7
	ld (hl),001h		;79c8
	inc l			;79ca
	ld a,(de)			;79cb
	ld (hl),a			;79cc
	inc de			;79cd
	inc l			;79ce
	ld (hl),000h		;79cf
	inc l			;79d1
	ld a,(de)			;79d2
	ld (hl),a			;79d3
	inc de			;79d4
	inc l			;79d5
	inc l			;79d6
	ld a,(de)			;79d7
	ld (hl),a			;79d8
	inc de			;79d9
	pop hl			;79da
	ld a,020h		;79db
	call 04083h		;79dd
	jr L_79C2		;79e0
L_79E2:
	ld hl,0cb00h		;79e2
	ld b,008h		;79e5
L_79E7:
	push hl			;79e7
	push bc			;79e8
	ld a,(hl)			;79e9
	and a			;79ea
	jr z,L_7A40		;79eb
	inc l			;79ed
	ld a,(0c212h)		;79ee
	cp (hl)			;79f1
	jr nz,L_7A40		;79f2
	inc l			;79f4
	inc l			;79f5
	ld a,(hl)			;79f6
	inc a			;79f7
	jr z,L_7A40		;79f8
	dec l			;79fa
	push hl			;79fb
	inc l			;79fc
	inc l			;79fd
	inc l			;79fe
	ld a,(hl)			;79ff
	cp 020h		;7a00
	jr nc,L_7A08		;7a02
	ld (hl),020h		;7a04
	jr L_7A0E		;7a06
L_7A08:
	cp 0e0h		;7a08
	jr c,L_7A0E		;7a0a
	ld (hl),0e0h		;7a0c
L_7A0E:
	pop hl			;7a0e
	push hl			;7a0f
	call L_7AD7		;7a10
	pop hl			;7a13
	ld a,(hl)			;7a14
	and a			;7a15
	jr z,L_7A3C		;7a16
	cp 006h		;7a18
	jr z,L_7A21		;7a1a
	call L_7AF4		;7a1c
	jr L_7A40		;7a1f
L_7A21:
	ld (hl),000h		;7a21
	inc l			;7a23
L_7A24:
	push hl			;7a24
	ld e,(hl)			;7a25
	inc l			;7a26
	inc l			;7a27
	ld d,(hl)			;7a28
	call L_704C		;7a29
	pop hl			;7a2c
	jr c,L_7A3D		;7a2d
	inc (hl)			;7a2f
	ld a,(hl)			;7a30
	cp 0e0h		;7a31
	jr c,L_7A24		;7a33
	dec l			;7a35
	dec l			;7a36
	dec l			;7a37
	ld (hl),000h		;7a38
	jr L_7A40		;7a3a
L_7A3C:
	inc l			;7a3c
L_7A3D:
	call L_7C5D		;7a3d
L_7A40:
	pop bc			;7a40
	pop hl			;7a41
	ld a,020h		;7a42
	call 04083h		;7a44
	djnz L_79E7		;7a47
	ld hl,0cb00h		;7a49
	ld b,008h		;7a4c
L_7A4E:
	push hl			;7a4e
	push bc			;7a4f
	ld a,(hl)			;7a50
	and a			;7a51
	jr z,L_7A74		;7a52
	inc l			;7a54
	ld a,(0c212h)		;7a55
	cp (hl)			;7a58
	jr nz,L_7A74		;7a59
	inc l			;7a5b
	inc l			;7a5c
	ld a,(hl)			;7a5d
	inc a			;7a5e
	jr nz,L_7A74		;7a5f
	ld (hl),024h		;7a61
L_7A63:
	push hl			;7a63
	ld e,(hl)			;7a64
	inc l			;7a65
	inc l			;7a66
	ld d,(hl)			;7a67
	call L_704C		;7a68
	pop hl			;7a6b
	jr c,L_7A71		;7a6c
	inc (hl)			;7a6e
	jr L_7A63		;7a6f
L_7A71:
	call L_7C5D		;7a71
L_7A74:
	pop bc			;7a74
	pop hl			;7a75
	ld a,020h		;7a76
	call 04083h		;7a78
	djnz L_7A4E		;7a7b
	ld hl,0cb00h		;7a7d
	ld de,0cb03h		;7a80
	ld b,008h		;7a83
L_7A85:
	push hl			;7a85
	push bc			;7a86
	ld a,(hl)			;7a87
	and a			;7a88
	jr z,L_7ACD		;7a89
	inc l			;7a8b
	ld a,(0c212h)		;7a8c
	cp (hl)			;7a8f
	jr nz,L_7ACD		;7a90
	push hl			;7a92
	push de			;7a93
	call L_78A8		;7a94
	pop de			;7a97
	pop hl			;7a98
	ld a,l			;7a99
	add a,00fh		;7a9a
	ld l,a			;7a9c
	ld (hl),c			;7a9d
	inc l			;7a9e
	ld a,(de)			;7a9f
	sub 010h		;7aa0
	ld (hl),a			;7aa2
	inc l			;7aa3
	inc e			;7aa4
	inc e			;7aa5
	ld a,(de)			;7aa6
	sub 008h		;7aa7
	ld (hl),a			;7aa9
	inc l			;7aaa
	ld (hl),0f8h		;7aab
	inc l			;7aad
	ld (hl),00dh		;7aae
	inc l			;7ab0
	push hl			;7ab1
	push de			;7ab2
	call L_78A8		;7ab3
	pop de			;7ab6
	pop hl			;7ab7
	ld (hl),c			;7ab8
	dec e			;7ab9
	dec e			;7aba
	inc l			;7abb
	ld a,(de)			;7abc
	sub 010h		;7abd
	ld (hl),a			;7abf
	inc l			;7ac0
	inc e			;7ac1
	inc e			;7ac2
	ld a,(de)			;7ac3
	sub 008h		;7ac4
	ld (hl),a			;7ac6
	inc l			;7ac7
	ld (hl),0fch		;7ac8
	inc l			;7aca
	ld (hl),04eh		;7acb
L_7ACD:
	pop bc			;7acd
	pop hl			;7ace
	ld a,020h		;7acf
	call 04083h		;7ad1
	djnz L_7A85		;7ad4
	ret			;7ad6
L_7AD7:
	ld a,(hl)			;7ad7
	cp 006h		;7ad8
	ret z			;7ada
	inc l			;7adb
	ld a,(hl)			;7adc
	sub 008h		;7add
	ld e,a			;7adf
	inc l			;7ae0
	inc l			;7ae1
	ld d,(hl)			;7ae2
	push hl			;7ae3
	call L_704C		;7ae4
	pop hl			;7ae7
	ret nc			;7ae8
	ld a,(hl)			;7ae9
	rla			;7aea
	ld a,0f0h		;7aeb
	jr c,L_7AF1		;7aed
	ld a,010h		;7aef
L_7AF1:
	add a,(hl)			;7af1
	ld (hl),a			;7af2
	ret			;7af3
L_7AF4:
	ld (hl),000h		;7af4
	inc l			;7af6
	inc l			;7af7
	inc l			;7af8
	inc l			;7af9
	ld a,(hl)			;7afa
	dec l			;7afb
	ld (hl),a			;7afc
	dec l			;7afd
	ld a,(hl)			;7afe
	dec l			;7aff
	ld (hl),a			;7b00
	ret			;7b01
L_7B02:
	inc l			;7b02
	ld c,l			;7b03
	ld b,(hl)			;7b04
	djnz L_7B21		;7b05
	push hl			;7b07
	push bc			;7b08
	call L_7BEB		;7b09
	pop bc			;7b0c
	pop hl			;7b0d
	jr nc,L_7B36		;7b0e
	dec (ix+007h)		;7b10
	ret nz			;7b13
	inc (hl)			;7b14
	inc l			;7b15
	ld a,(hl)			;7b16
	inc l			;7b17
	ld (hl),a			;7b18
	inc l			;7b19
	ld a,(hl)			;7b1a
	inc l			;7b1b
	ld (hl),a			;7b1c
	inc l			;7b1d
	ld (hl),008h		;7b1e
	ret			;7b20
L_7B21:
	djnz L_7B3A		;7b21
	ld a,(ix+008h)		;7b23
	and a			;7b26
	jr z,L_7B36		;7b27
	dec a			;7b29
	ld a,003h		;7b2a
	jr z,L_7B30		;7b2c
	ld a,004h		;7b2e
L_7B30:
	ld (hl),a			;7b30
	ld a,007h		;7b31
	jp 056e3h		;7b33
L_7B36:
	ld l,c			;7b36
	ld (hl),000h		;7b37
	ret			;7b39
L_7B3A:
	djnz L_7B5F		;7b3a
	inc l			;7b3c
	inc l			;7b3d
	inc l			;7b3e
	dec (hl)			;7b3f
	inc l			;7b40
	inc l			;7b41
	dec (hl)			;7b42
	ret nz			;7b43
	dec l			;7b44
	dec l			;7b45
	ld a,(hl)			;7b46
	cp 009h		;7b47
	jr nc,L_7B5B		;7b49
	ld (hl),0e8h		;7b4b
	ld l,c			;7b4d
	push hl			;7b4e
	call L_7C7E		;7b4f
	pop hl			;7b52
	ld (hl),000h		;7b53
	dec l			;7b55
	ld a,(0c21ah)		;7b56
	ld (hl),a			;7b59
	ret			;7b5a
L_7B5B:
	ld l,c			;7b5b
	ld (hl),005h		;7b5c
	ret			;7b5e
L_7B5F:
	djnz L_7B80		;7b5f
	inc l			;7b61
	inc l			;7b62
	inc l			;7b63
	inc (hl)			;7b64
	inc l			;7b65
	inc l			;7b66
	dec (hl)			;7b67
	ret nz			;7b68
	dec l			;7b69
	dec l			;7b6a
	ld a,(hl)			;7b6b
	cp 0f8h		;7b6c
	jr c,L_7B5B		;7b6e
	ld (hl),018h		;7b70
	ld l,c			;7b72
	push hl			;7b73
	call L_7C7E		;7b74
	pop hl			;7b77
	ld (hl),000h		;7b78
	dec l			;7b7a
	ld a,(0c21bh)		;7b7b
	ld (hl),a			;7b7e
	ret			;7b7f
L_7B80:
	djnz L_7B8B		;7b80
	call L_7C9E		;7b82
	jr c,L_7BB3		;7b85
	inc (hl)			;7b87
	jp L_7C7E		;7b88
L_7B8B:
	djnz L_7BBE		;7b8b
	inc l			;7b8d
	ld a,(hl)			;7b8e
	add a,008h		;7b8f
	ld (hl),a			;7b91
	cp 0d8h		;7b92
	jr c,L_7BAE		;7b94
	ld a,(0c219h)		;7b96
	inc a			;7b99
	jp nz,L_7BA3		;7b9a
	ld l,c			;7b9d
	dec l			;7b9e
	dec l			;7b9f
	ld (hl),000h		;7ba0
	ret			;7ba2
L_7BA3:
	dec a			;7ba3
	ld l,c			;7ba4
	dec l			;7ba5
	ld (hl),a			;7ba6
	inc l			;7ba7
	inc l			;7ba8
	ld (hl),0ffh		;7ba9
	jp L_7B36		;7bab
L_7BAE:
	dec l			;7bae
	call L_7C9E		;7baf
	ret nc			;7bb2
L_7BB3:
	ld (hl),000h		;7bb3
	push hl			;7bb5
	call L_7C7E		;7bb6
	pop hl			;7bb9
	inc l			;7bba
	jp L_7C5D		;7bbb
L_7BBE:
	call L_7C9E		;7bbe
	jr c,L_7BC8		;7bc1
	ld (hl),006h		;7bc3
	call L_7C7F		;7bc5
L_7BC8:
	push hl			;7bc8
	push bc			;7bc9
	call L_7BEB		;7bca
	pop bc			;7bcd
	pop hl			;7bce
	ret nc			;7bcf
	ld b,006h		;7bd0
	push hl			;7bd2
	call 047edh		;7bd3
	pop hl			;7bd6
	and a			;7bd7
	ret z			;7bd8
	dec a			;7bd9
	ld b,01eh		;7bda
	jr z,L_7BE5		;7bdc
	dec a			;7bde
	ld b,002h		;7bdf
	jr z,L_7BE5		;7be1
	ld b,00fh		;7be3
L_7BE5:
	ld l,c			;7be5
	inc (hl)			;7be6
	ld (ix+007h),b		;7be7
	ret			;7bea
L_7BEB:
	ld (ix+008h),000h		;7beb
	inc l			;7bef
	ld e,(hl)			;7bf0
	ld a,(0c244h)		;7bf1
	add a,002h		;7bf4
	sub (hl)			;7bf6
	cp 004h		;7bf7
	ret nc			;7bf9
	ld a,(0c250h)		;7bfa
	ld c,a			;7bfd
	inc l			;7bfe
	inc l			;7bff
	ld d,(hl)			;7c00
	ld a,(0c246h)		;7c01
	ld b,a			;7c04
	sub d			;7c05
	ld a,c			;7c06
	jr c,L_7C0D		;7c07
	and a			;7c09
	ret nz			;7c0a
	jr L_7C0F		;7c0b
L_7C0D:
	and a			;7c0d
	ret z			;7c0e
L_7C0F:
	ld a,b			;7c0f
	sub (hl)			;7c10
	add a,013h		;7c11
	cp 026h		;7c13
	ret nc			;7c15
	ld a,(0c007h)		;7c16
	and 00ch		;7c19
	ret z			;7c1b
	ld a,b			;7c1c
	cp (hl)			;7c1d
	ld a,001h		;7c1e
	jr nc,L_7C23		;7c20
	inc a			;7c22
L_7C23:
	inc l			;7c23
	inc l			;7c24
	inc l			;7c25
	ld (hl),a			;7c26
	ld a,e			;7c27
	sub 008h		;7c28
	ld e,a			;7c2a
	ld a,(hl)			;7c2b
	dec a			;7c2c
	jr z,L_7C35		;7c2d
	ld a,d			;7c2f
	add a,00ah		;7c30
	ld d,a			;7c32
	jr L_7C39		;7c33
L_7C35:
	ld a,d			;7c35
	sub 00ah		;7c36
	ld d,a			;7c38
L_7C39:
	ret c			;7c39
	call L_704C		;7c3a
	ccf			;7c3d
	ret			;7c3e
L_7C3F:
	ld de,00041h		;7c3f
L_7C42:
	ld a,c			;7c42
	sub 014h		;7c43
	ld l,a			;7c45
	ld h,000h		;7c46
	add hl,hl			;7c48
	add hl,hl			;7c49
	or a			;7c4a
	sbc hl,de		;7c4b
	ld a,b			;7c4d
	srl a		;7c4e
	srl a		;7c50
	srl a		;7c52
	call 04083h		;7c54
	ld de,0d200h		;7c57
	add hl,de			;7c5a
	ex de,hl			;7c5b
	ret			;7c5c
L_7C5D:
	push hl			;7c5d
	ld c,(hl)			;7c5e
	inc l			;7c5f
	inc l			;7c60
	ld b,(hl)			;7c61
	call L_7C3F		;7c62
	pop bc			;7c65
	ld a,c			;7c66
	add a,017h		;7c67
	ld c,a			;7c69
	ex de,hl			;7c6a
	call L_7C73		;7c6b
	inc c			;7c6e
	ld de,0001fh		;7c6f
	add hl,de			;7c72
L_7C73:
	ld a,(hl)			;7c73
	ld (bc),a			;7c74
	ld (hl),001h		;7c75
	inc l			;7c77
	inc c			;7c78
	ld a,(hl)			;7c79
	ld (bc),a			;7c7a
	ld (hl),001h		;7c7b
	ret			;7c7d
L_7C7E:
	inc l			;7c7e
L_7C7F:
	inc l			;7c7f
	ld c,(hl)			;7c80
	inc l			;7c81
	inc l			;7c82
	ld b,(hl)			;7c83
	call L_7C3F		;7c84
	push ix		;7c87
	pop bc			;7c89
	ld a,c			;7c8a
	add a,01ah		;7c8b
	ld c,a			;7c8d
	ex de,hl			;7c8e
	call L_7C97		;7c8f
	inc c			;7c92
	ld de,0001fh		;7c93
	add hl,de			;7c96
L_7C97:
	ld a,(bc)			;7c97
	ld (hl),a			;7c98
	inc l			;7c99
	inc c			;7c9a
	ld a,(bc)			;7c9b
	ld (hl),a			;7c9c
	ret			;7c9d
L_7C9E:
	push hl			;7c9e
	inc l			;7c9f
	ld e,(hl)			;7ca0
	inc l			;7ca1
	inc l			;7ca2
	ld a,(hl)			;7ca3
	sub 004h		;7ca4
	ld d,a			;7ca6
	pop hl			;7ca7
	call L_7CB0		;7ca8
	ret c			;7cab
	ld a,d			;7cac
	add a,008h		;7cad
	ld d,a			;7caf
L_7CB0:
	push bc			;7cb0
	push de			;7cb1
	push hl			;7cb2
	call L_704C		;7cb3
	pop hl			;7cb6
	pop de			;7cb7
	pop bc			;7cb8
	ret			;7cb9
L_7CBA:
	call 054afh		;7cba
	ld de,0d510h		;7cbd
	ld hl,0bf35h		;7cc0
	ld a,(0c211h)		;7cc3
	add a,a			;7cc6
	call 04083h		;7cc7
	ld a,(hl)			;7cca
	and a			;7ccb
	jp z,05464h		;7ccc
	ld a,001h		;7ccf
	ld (de),a			;7cd1
	inc e			;7cd2
	ld a,(hl)			;7cd3
	ld (de),a			;7cd4
	inc hl			;7cd5
	inc e			;7cd6
	ld a,(hl)			;7cd7
	and 0f0h		;7cd8
	add a,014h		;7cda
	ld (de),a			;7cdc
	inc e			;7cdd
	ld a,(hl)			;7cde
	and 00fh		;7cdf
	rlca			;7ce1
	rlca			;7ce2
	rlca			;7ce3
	rlca			;7ce4
	ld (de),a			;7ce5
	inc e			;7ce6
	ld a,001h		;7ce7
	ld (de),a			;7ce9
	jp 05464h		;7cea
L_7CED:
	ld hl,0d510h		;7ced
	ld a,(hl)			;7cf0
	dec a			;7cf1
	ret nz			;7cf2
	inc l			;7cf3
	ld a,(0c212h)		;7cf4
	cp (hl)			;7cf7
	ret nz			;7cf8
	inc l			;7cf9
	push hl			;7cfa
	ld a,(hl)			;7cfb
	inc l			;7cfc
	ld h,(hl)			;7cfd
	ld l,a			;7cfe
	ld de,0b060h		;7cff
	ld bc,01030h		;7d02
	ld a,004h		;7d05
	call 04bdeh		;7d07
	pop hl			;7d0a
	push hl			;7d0b
	ld e,(hl)			;7d0c
	inc l			;7d0d
	ld d,(hl)			;7d0e
	ld hl,03088h		;7d0f
	ld bc,01030h		;7d12
	call 04841h		;7d15
	pop hl			;7d18
	ld c,001h		;7d19
L_7D1B:
	push bc			;7d1b
	ld c,(hl)			;7d1c
	inc l			;7d1d
	ld b,(hl)			;7d1e
	ld de,00000h		;7d1f
	call L_7C42		;7d22
	pop bc			;7d25
	ex de,hl			;7d26
	ld b,006h		;7d27
L_7D29:
	ld (hl),c			;7d29
	inc l			;7d2a
	ld (hl),c			;7d2b
	ld a,01fh		;7d2c
	call 04083h		;7d2e
	djnz L_7D29		;7d31
	ret			;7d33
L_7D34:
	ld hl,0d510h		;7d34
	ld a,(hl)			;7d37
	and a			;7d38
	ret z			;7d39
	dec a			;7d3a
	jr z,L_7D3F		;7d3b
	jr L_7D8C		;7d3d
L_7D3F:
	push hl			;7d3f
	ld b,006h		;7d40
	call 047edh		;7d42
	ld c,a			;7d45
	ld a,(0cc10h)		;7d46
	add a,a			;7d49
	ld b,a			;7d4a
	ld a,(0cc13h)		;7d4b
	rla			;7d4e
	jr nc,L_7D52		;7d4f
	inc b			;7d51
L_7D52:
	ld a,b			;7d52
	ld hl,07dadh		;7d53
	call 04083h		;7d56
	ld a,(hl)			;7d59
	cp c			;7d5a
	pop hl			;7d5b
	ret nz			;7d5c
	inc l			;7d5d
	ld a,(0c212h)		;7d5e
	cp (hl)			;7d61
	ret nz			;7d62
	ld a,(0c24bh)		;7d63
	and a			;7d66
	ret nz			;7d67
	inc l			;7d68
	ld a,(0c244h)		;7d69
	sub (hl)			;7d6c
	cp 030h		;7d6d
	ret nc			;7d6f
	inc l			;7d70
	ld a,(0c246h)		;7d71
	ld c,a			;7d74
	ld a,(hl)			;7d75
	rla			;7d76
	jr c,L_7D82		;7d77
	ld a,(hl)			;7d79
	add a,010h		;7d7a
	sub c			;7d7c
	cp 0e8h		;7d7d
	ret c			;7d7f
	jr L_7D87		;7d80
L_7D82:
	ld a,(hl)			;7d82
	sub c			;7d83
	cp 018h		;7d84
	ret nc			;7d86
L_7D87:
	ld hl,0d510h		;7d87
	inc (hl)			;7d8a
	ret			;7d8b
L_7D8C:
	inc l			;7d8c
	inc l			;7d8d
	ld e,(hl)			;7d8e
	inc l			;7d8f
	ld d,(hl)			;7d90
	inc l			;7d91
	push hl			;7d92
	ld c,(hl)			;7d93
	ld hl,0b060h		;7d94
	ld b,010h		;7d97
	call 04841h		;7d99
	pop hl			;7d9c
	inc (hl)			;7d9d
	ld a,(hl)			;7d9e
	cp 030h		;7d9f
	ret c			;7da1
	ld hl,0d510h		;7da2
	ld c,000h		;7da5
	ld (hl),c			;7da7
	inc l			;7da8
	inc l			;7da9
	jp L_7D1B		;7daa

; ----------------------------------------------------------------------
; DATOS tabla_p7D53: 4 bytes que lee p01:7D53 (ld hl,0x7DAD)
;   0x7dad..0x7db1  (4 bytes)
DATA_tabla_p7D53:
	defb 000h,003h,002h,001h	; 7dad

; ======================================================================
; CODIGO 0x7db1..0x8000  (591 bytes)
; ======================================================================


L_7DB1:
	ld a,(0c20ah)		;7db1
	and a			;7db4
	ret nz			;7db5
	ld a,(0c212h)		;7db6
	dec a			;7db9
	ret nz			;7dba
	call L_7DF0		;7dbb
	push hl			;7dbe
	ld de,0b060h		;7dbf
	ld bc,00830h		;7dc2
	ld a,004h		;7dc5
	call 04bdeh		;7dc7
	pop de			;7dca
	push de			;7dcb
	ld b,006h		;7dcc
L_7DCE:
	ld a,093h		;7dce
	call 04d86h		;7dd0
	ld a,e			;7dd3
	add a,008h		;7dd4
	ld e,a			;7dd6
	djnz L_7DCE		;7dd7
	pop bc			;7dd9
	ld h,001h		;7dda
	push hl			;7ddc
	ld de,00000h		;7ddd
	call L_7C42		;7de0
	pop hl			;7de3
	ld b,006h		;7de4
L_7DE6:
	ld a,h			;7de6
	ld (de),a			;7de7
	ld a,020h		;7de8
	call 04088h		;7dea
	djnz L_7DE6		;7ded
	ret			;7def
L_7DF0:
	call 054afh		;7df0
	ld hl,0bf1dh		;7df3
	ld a,(0c211h)		;7df6
	call 04083h		;7df9
	ld a,(hl)			;7dfc
	ld c,a			;7dfd
	and 0f0h		;7dfe
	add a,004h		;7e00
	sub 030h		;7e02
	ld l,a			;7e04
	ld a,c			;7e05
	and 00fh		;7e06
	dec a			;7e08
	ld h,000h		;7e09
	jr z,L_7E0F		;7e0b
	ld h,0f8h		;7e0d
L_7E0F:
	jp 05464h		;7e0f
L_7E12:
	ld a,(0c20ah)		;7e12
	and a			;7e15
	ret nz			;7e16
	ld a,(0c212h)		;7e17
	dec a			;7e1a
	ret nz			;7e1b
	ld a,(0c24bh)		;7e1c
	and a			;7e1f
	ret nz			;7e20
	call L_7DF0		;7e21
	ld a,(0c244h)		;7e24
	sub l			;7e27
	cp 030h		;7e28
	ret nc			;7e2a
	ld a,(0c007h)		;7e2b
	ld b,a			;7e2e
	ld a,h			;7e2f
	and a			;7e30
	ld a,(0c246h)		;7e31
	jr nz,L_7E41		;7e34
	cp 014h		;7e36
	ret nc			;7e38
	ld a,b			;7e39
	and 004h		;7e3a
	ret z			;7e3c
	ld a,003h		;7e3d
	jr L_7E4A		;7e3f
L_7E41:
	cp 0ech		;7e41
	ret c			;7e43
	ld a,b			;7e44
	and 008h		;7e45
	ret z			;7e47
	ld a,004h		;7e48
L_7E4A:
	ld (0c215h),a		;7e4a
	ld bc,03001h		;7e4d
	ex de,hl			;7e50
	ld hl,0b060h		;7e51
L_7E54:
	push bc			;7e54
	ld b,008h		;7e55
	push hl			;7e57
	push de			;7e58
	push bc			;7e59
	call 04841h		;7e5a
	pop bc			;7e5d
	pop de			;7e5e
	pop hl			;7e5f
	ld b,040h		;7e60
L_7E62:
	push bc			;7e62
	ld b,000h		;7e63
L_7E65:
	djnz L_7E65		;7e65
	pop bc			;7e67
	djnz L_7E62		;7e68
	pop bc			;7e6a
	inc c			;7e6b
	djnz L_7E54		;7e6c
	ret			;7e6e
L_7E6F:
	ld a,(ix+01bh)		;7e6f
	and a			;7e72
	jr z,L_7E97		;7e73
	ld a,(ix+016h)		;7e75
	and a			;7e78
	ret z			;7e79
	inc (ix+003h)		;7e7a
	dec (ix+016h)		;7e7d
	push ix		;7e80
	pop hl			;7e82
	rr l		;7e83
	ret c			;7e85
	ld h,0c0h		;7e86
	ld a,060h		;7e88
	add a,(ix+016h)		;7e8a
	ld l,a			;7e8d
	ld a,(ix+018h)		;7e8e
	add a,(ix+016h)		;7e91
	ld e,a			;7e94
	jr L_7EC7		;7e95
L_7E97:
	ld a,(ix+016h)		;7e97
	cp 030h		;7e9a
	ret nc			;7e9c
	inc (ix+011h)		;7e9d
	ld a,(ix+011h)		;7ea0
	cp 03ch		;7ea3
	ret c			;7ea5
	ld (ix+011h),000h		;7ea6
	dec (ix+003h)		;7eaa
	inc (ix+016h)		;7ead
	push ix		;7eb0
	pop hl			;7eb2
	rr l		;7eb3
	ret c			;7eb5
	ld h,040h		;7eb6
	ld a,088h		;7eb8
	add a,(ix+016h)		;7eba
	ld l,a			;7ebd
	dec l			;7ebe
	ld a,(ix+018h)		;7ebf
	add a,(ix+016h)		;7ec2
	ld e,a			;7ec5
	dec e			;7ec6
L_7EC7:
	ld d,(ix+019h)		;7ec7
	ld bc,01001h		;7eca
	call 04841h		;7ecd
L_7ED0:
	ld c,(ix+018h)		;7ed0
	ld b,(ix+019h)		;7ed3
	ld de,00000h		;7ed6
	call L_7C42		;7ed9
	ld a,(ix+016h)		;7edc
	and 0f8h		;7edf
	rrca			;7ee1
	rrca			;7ee2
	rrca			;7ee3
	ld c,a			;7ee4
	ld b,006h		;7ee5
L_7EE7:
	ld a,b			;7ee7
	sub 006h		;7ee8
	neg		;7eea
	cp c			;7eec
	ld a,001h		;7eed
	jr c,L_7EF2		;7eef
	xor a			;7ef1
L_7EF2:
	ld (de),a			;7ef2
	inc e			;7ef3
	ld (de),a			;7ef4
	ld a,01fh		;7ef5
	call 04088h		;7ef7
	djnz L_7EE7		;7efa
	ret			;7efc
L_7EFD:
	ld hl,0d180h		;7efd
	ld ix,0d181h		;7f00
	ld b,002h		;7f04
L_7F06:
	push hl			;7f06
	push bc			;7f07
	ld a,(0c212h)		;7f08
	cp (hl)			;7f0b
	jr z,L_7F15		;7f0c
	inc l			;7f0e
	ld a,(hl)			;7f0f
	cp 00dh		;7f10
	call z,L_7E6F		;7f12
L_7F15:
	pop bc			;7f15
	pop hl			;7f16
	ld a,040h		;7f17
	call 04083h		;7f19
	djnz L_7F06		;7f1c
	ret			;7f1e
L_7F1F:
	ld hl,0d180h		;7f1f
	ld bc,0007fh		;7f22
	call 05f08h		;7f25
	call 054aah		;7f28
	ld de,0d180h		;7f2b
	ld a,(0c211h)		;7f2e
	ld hl,0b591h		;7f31
	call 0543ah		;7f34
L_7F37:
	ld a,(hl)			;7f37
	inc a			;7f38
	jp z,05464h		;7f39
	push de			;7f3c
	ld a,(hl)			;7f3d
	ld (de),a			;7f3e
	inc e			;7f3f
	ld a,00dh		;7f40
	ld (de),a			;7f42
	inc e			;7f43
	inc e			;7f44
	inc e			;7f45
	inc hl			;7f46
	ld a,(hl)			;7f47
	and 0f0h		;7f48
	add a,014h		;7f4a
	ld (de),a			;7f4c
	inc e			;7f4d
	inc e			;7f4e
	ld a,(hl)			;7f4f
	and 00fh		;7f50
	rlca			;7f52
	rlca			;7f53
	rlca			;7f54
	rlca			;7f55
	add a,008h		;7f56
	ld (de),a			;7f58
	ld a,e			;7f59
	add a,011h		;7f5a
	ld e,a			;7f5c
	ld a,030h		;7f5d
	ld (de),a			;7f5f
	inc e			;7f60
	inc e			;7f61
	inc hl			;7f62
	ld a,(hl)			;7f63
	and 0f0h		;7f64
	add a,014h		;7f66
	ld (de),a			;7f68
	inc e			;7f69
	ld a,(hl)			;7f6a
	and 00fh		;7f6b
	rlca			;7f6d
	rlca			;7f6e
	rlca			;7f6f
	rlca			;7f70
	ld (de),a			;7f71
	inc hl			;7f72
	pop de			;7f73
	ld a,040h		;7f74
	call 04088h		;7f76
	jr L_7F37		;7f79
L_7F7B:
	ld hl,0d180h		;7f7b
	ld bc,00200h		;7f7e
L_7F81:
	ld a,(0c212h)		;7f81
	cp (hl)			;7f84
	jr z,L_7F90		;7f85
	inc c			;7f87
	ld a,040h		;7f88
	call 04083h		;7f8a
	djnz L_7F81		;7f8d
	ret			;7f8f
L_7F90:
	ld a,c			;7f90
	ld (0ccc0h),a		;7f91
	inc hl			;7f94
	ld de,0d100h		;7f95
	ld bc,0001fh		;7f98
	ldir		;7f9b
	ld de,0c060h		;7f9d
	ld a,(0d118h)		;7fa0
	ld l,a			;7fa3
	ld a,(0d119h)		;7fa4
	ld h,a			;7fa7
	ld bc,01030h		;7fa8
	ld a,004h		;7fab
	push hl			;7fad
	push bc			;7fae
	call 04bdeh		;7faf
	pop bc			;7fb2
	pop de			;7fb3
L_7FB4:
	ld hl,04088h		;7fb4
	ld a,(0d116h)		;7fb7
	and a			;7fba
	ret z			;7fbb
	ld c,a			;7fbc
	call 04841h		;7fbd
	ld ix,0d100h		;7fc0
	jp L_7ED0		;7fc4
L_7FC7:
	ld hl,0d100h		;7fc7
	ld a,(hl)			;7fca
	cp 00dh		;7fcb
	ret nz			;7fcd
	ld a,(0ccc0h)		;7fce
	and a			;7fd1
	ld de,0d181h		;7fd2
	jr z,L_7FDA		;7fd5
	ld de,0d1c1h		;7fd7
L_7FDA:
	ld bc,0001fh		;7fda
	ldir		;7fdd
	ret			;7fdf
L_7FE0:
	ld a,(0d100h)		;7fe0
	cp 00dh		;7fe3
	ret nz			;7fe5
	ld a,(0d118h)		;7fe6
	ld e,a			;7fe9
	ld a,(0d119h)		;7fea
	ld d,a			;7fed
	ld b,010h		;7fee
	jr L_7FB4		;7ff0
L_7FF2:
	ld a,(0002bh)		;7ff2
	and 00fh		;7ff5
	ret nz			;7ff7
	ld a,(0c8abh)		;7ff8
	and a			;7ffb
	ret nz			;7ffc
	ld a,(0c8a0h)		;7ffd
