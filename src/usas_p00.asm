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


L_403D:
	di			;403d
	ld hl,0c00bh		;403e
	bit 0,(hl)		;4041
	ld (hl),001h		;4043
	jp nz,L_4081		;4045
	di			;4048
	ld a,00dh		;4049
	ld (06000h),a		;404b
	inc a			;404e
	ld (08000h),a		;404f
	inc a			;4052
	ld (0a000h),a		;4053
	call 06000h		;4056
	di			;4059
	ld a,(0f0f1h)		;405a
	ld (06000h),a		;405d
	ld a,(0f0f2h)		;4060
	ld (08000h),a		;4063
	ld a,(0f0f3h)		;4066
	ld (0a000h),a		;4069
	xor a			;406c
	ld (0c00bh),a		;406d
	ld hl,0c005h		;4070
	bit 0,(hl)		;4073
	jp nz,L_4081		;4075
	inc (hl)			;4078
	ei			;4079
	call L_40E0		;407a
	xor a			;407d
	ld (0c005h),a		;407e
L_4081:
	ei			;4081
	ret			;4082
L_4083:
	add a,l			;4083
	ld l,a			;4084
	ret nc			;4085
	inc h			;4086
	ret			;4087
L_4088:
	add a,e			;4088
	ld e,a			;4089
	ret nc			;408a
	inc d			;408b
	ret			;408c
L_408D:
	pop hl			;408d
	add a,a			;408e
	call L_4083		;408f
	ld a,(hl)			;4092
	inc hl			;4093
	ld h,(hl)			;4094
	ld l,a			;4095
	jp (hl)			;4096
L_4097:
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
	ld hl,0c000h		;40bb
	ld de,0c001h		;40be
	ld bc,030efh		;40c1
	ld (hl),000h		;40c4
	ldir		;40c6
	call L_4FAA		;40c8
	di			;40cb
	ld a,0c3h		;40cc
	ld (0fd9fh),a		;40ce
	ld hl,L_403D		;40d1
	ld (0fda0h),hl		;40d4
	xor a			;40d7
	ld (0f3dbh),a		;40d8
	call L_5464		;40db
L_40DE:
	jr L_40DE		;40de
L_40E0:
	ld hl,0c003h		;40e0
	inc (hl)			;40e3
	ld bc,(0c000h)		;40e4
	ld a,c			;40e8
	cp 003h		;40e9
	jr nc,L_40F1		;40eb
	ld hl,0461dh		;40ed
	push hl			;40f0
L_40F1:
	call L_408D		;40f1

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
	call L_547E		;4112
	call 09483h		;4115
	call L_5464		;4118
	ld a,(0c242h)		;411b
	or a			;411e
	ret z			;411f
	call L_50C1		;4120
	xor a			;4123
	jp L_41A9		;4124
L_4127:
	djnz L_4141		;4127
	ld hl,0c004h		;4129
	dec (hl)			;412c
	ret nz			;412d
	call L_5120		;412e
	call L_547E		;4131
	call 09748h		;4134
	call 096eah		;4137
	call L_5464		;413a
	xor a			;413d
	jp L_41A9		;413e
L_4141:
	djnz L_415F		;4141
	call L_547E		;4143
	call 09755h		;4146
	call 09792h		;4149
	ld hl,0ca00h		;414c
	ld a,(hl)			;414f
	and a			;4150
	jp z,L_5464		;4151
	ld (hl),000h		;4154
	call 09837h		;4156
	call L_5464		;4159
	xor a			;415c
	jr L_41A9		;415d
L_415F:
	djnz L_4175		;415f
	call L_547E		;4161
	call 09840h		;4164
	call L_5464		;4167
	ld hl,0ca01h		;416a
	ld a,(hl)			;416d
	and a			;416e
	ret z			;416f
	xor a			;4170
	ld (hl),a			;4171
	jp L_4360		;4172
L_4175:
	call L_4A04		;4175
	call L_547E		;4178
	call 0941ch		;417b
	call L_5464		;417e
	jr L_41AC		;4181
L_4183:
	ld hl,0c004h		;4183
	dec (hl)			;4186
	ret nz			;4187
	jp L_435E		;4188
L_418B:
	djnz L_41A1		;418b
	call L_5FC1		;418d
	ld a,(0c214h)		;4190
	or a			;4193
	ret nz			;4194
L_4195:
	xor a			;4195
L_4196:
	ld (0c000h),a		;4196
	ld a,020h		;4199
	ld (0c004h),a		;419b
	jp L_4367		;419e
L_41A1:
	call L_4A04		;41a1
	call L_5F6E		;41a4
	ld a,020h		;41a7
L_41A9:
	ld (0c004h),a		;41a9
L_41AC:
	ld hl,0c001h		;41ac
	inc (hl)			;41af
	ret			;41b0
L_41B1:
	djnz L_41C4		;41b1
	ld hl,0c004h		;41b3
	dec (hl)			;41b6
	jr z,L_41AC		;41b7
	bit 2,(hl)		;41b9
	ld hl,050a4h		;41bb
	jp z,L_4D4A		;41be
	jp L_4D4E		;41c1
L_41C4:
	djnz L_41DB		;41c4
	call L_4666		;41c6
	call L_5ED0		;41c9
	call L_547E		;41cc
	call 0b751h		;41cf
	call L_5464		;41d2
	call L_45F7		;41d5
	jp L_435E		;41d8
L_41DB:
	ld a,08ah		;41db
	call L_56E3		;41dd
	ld a,050h		;41e0
	jr L_41A9		;41e2
L_41E4:
	exx			;41e4
	call L_4FEE		;41e5
	exx			;41e8
	djnz L_421C		;41e9
	call L_547E		;41eb
	call 06085h		;41ee
	push af			;41f1
	call L_5464		;41f2
	pop af			;41f5
	ret nc			;41f6
	ld hl,0c220h		;41f7
	inc (hl)			;41fa
	call L_4A04		;41fb
	call L_547E		;41fe
	call 09665h		;4201
	call L_5464		;4204
	ld a,(0c21dh)		;4207
	or a			;420a
	jp z,L_41AC		;420b
	call L_547E		;420e
	call 07390h		;4211
	call 0a249h		;4214
	call L_5464		;4217
	jr L_41AC		;421a
L_421C:
	djnz L_4254		;421c
	ld a,(0c21dh)		;421e
	or a			;4221
	jr z,L_423A		;4222
	call L_547E		;4224
	call 0966eh		;4227
	call 0a28ah		;422a
	call L_5464		;422d
	ld a,(0c8a6h)		;4230
	and a			;4233
	ret z			;4234
	ld a,(0c006h)		;4235
	and a			;4238
	ret z			;4239
L_423A:
	call L_547E		;423a
	call 0b870h		;423d
	call 0b865h		;4240
	call L_5464		;4243
L_4246:
	call L_4A2C		;4246
	call 060edh		;4249
	ld a,089h		;424c
	call L_56E3		;424e
	jp L_41AC		;4251
L_4254:
	djnz L_4270		;4254
	ld a,(0c00eh)		;4256
	rra			;4259
	jp c,L_432D		;425a
	call 06124h		;425d
	ret nc			;4260
	call 061b1h		;4261
	call L_547E		;4264
	call 0bb1eh		;4267
	call L_5464		;426a
	jp L_41AC		;426d
L_4270:
	djnz L_42B7		;4270
	call L_547E		;4272
	call 0bb64h		;4275
	call L_5464		;4278
	ld a,(0c22ah)		;427b
	and a			;427e
	ret z			;427f
	dec a			;4280
	jr z,L_4291		;4281
	call L_547E		;4283
	call 0bb78h		;4286
	call L_5464		;4289
	ld hl,0c001h		;428c
	dec (hl)			;428f
	ret			;4290
L_4291:
	ld a,(0cc10h)		;4291
	cp 002h		;4294
	jr nc,L_42A2		;4296
	ld a,(0c2b0h)		;4298
	ld b,a			;429b
	ld a,(0c2d0h)		;429c
	or b			;429f
	jr nz,L_42B0		;42a0
L_42A2:
	call L_547E		;42a2
	call 0bb84h		;42a5
	call L_5464		;42a8
	ld a,078h		;42ab
	jp L_41A9		;42ad
L_42B0:
	ld a,006h		;42b0
	ld (0c001h),a		;42b2
	jr L_4304		;42b5
L_42B7:
	djnz L_42F7		;42b7
	ld a,(0e322h)		;42b9
	and a			;42bc
	jr nz,L_42C9		;42bd
	ld a,(0c2b0h)		;42bf
	ld b,a			;42c2
	ld a,(0c2d0h)		;42c3
	or b			;42c6
	jr nz,L_42B0		;42c7
L_42C9:
	ld a,(0c006h)		;42c9
	and a			;42cc
	jr nz,L_42D4		;42cd
	ld hl,0c004h		;42cf
	dec (hl)			;42d2
	ret nz			;42d3
L_42D4:
	ld a,(0e322h)		;42d4
	and a			;42d7
	jr z,L_42E9		;42d8
	call L_547E		;42da
	call 0bb78h		;42dd
	call L_5464		;42e0
	ld a,003h		;42e3
	ld (0c001h),a		;42e5
	ret			;42e8
L_42E9:
	call L_547E		;42e9
	call 0bb84h		;42ec
	call L_5464		;42ef
	ld a,078h		;42f2
	jp L_41A9		;42f4
L_42F7:
	djnz L_4316		;42f7
	ld a,(0c006h)		;42f9
	and a			;42fc
	jr nz,L_4304		;42fd
	ld hl,0c004h		;42ff
	dec (hl)			;4302
	ret nz			;4303
L_4304:
	call L_5EC8		;4304
	call 0611dh		;4307
	call L_547E		;430a
	call 0a410h		;430d
	call L_5464		;4310
	jp L_41AC		;4313
L_4316:
	djnz L_433E		;4316
	call L_547E		;4318
	call 0a581h		;431b
	call L_5464		;431e
	ld a,(0c23bh)		;4321
	and a			;4324
	ret z			;4325
	xor a			;4326
	ld (0c8a0h),a		;4327
	jp L_41AC		;432a
L_432D:
	call L_547E		;432d
	call 09ed6h		;4330
	call L_5464		;4333
	call L_46A0		;4336
	ld a,00dh		;4339
	jp L_4196		;433b
L_433E:
	djnz L_434B		;433e
	call 08100h		;4340
	ld a,(0c8a6h)		;4343
	and a			;4346
	ret z			;4347
	jp L_41AC		;4348
L_434B:
	djnz L_436C		;434b
	call 0617bh		;434d
	call L_4A2C		;4350
	call L_5E36		;4353
	call L_54C8		;4356
	ld hl,0c214h		;4359
	ld (hl),001h		;435c
L_435E:
	ld a,020h		;435e
L_4360:
	ld (0c004h),a		;4360
	ld hl,0c000h		;4363
	inc (hl)			;4366
L_4367:
	xor a			;4367
	ld (0c001h),a		;4368
	ret			;436b
L_436C:
	call L_4A04		;436c
	call L_50C1		;436f
	call L_53BB		;4372
	call L_53DE		;4375
	call L_547E		;4378
	call 071d2h		;437b
	call L_5464		;437e
	xor a			;4381
	ld (0c21fh),a		;4382
	jp L_41AC		;4385
L_4388:
	call 0605ah		;4388
	ld a,(0c217h)		;438b
	and a			;438e
	ld a,00ah		;438f
	jp nz,L_4196		;4391
	ld a,(0c216h)		;4394
	and a			;4397
	ld a,009h		;4398
	jp nz,L_4196		;439a
	call L_547E		;439d
	call 0b66ah		;43a0
	call L_5464		;43a3
	ld a,(0c215h)		;43a6
	and a			;43a9
	ld a,008h		;43aa
	jp nz,L_4196		;43ac
	ld a,(0c008h)		;43af
	and a			;43b2
	jr nz,L_43BD		;43b3
	ld a,(0c214h)		;43b5
	or a			;43b8
	jp z,L_435E		;43b9
	ret			;43bc
L_43BD:
	call L_5CDC		;43bd
	ld a,00bh		;43c0
	jp L_4196		;43c2
L_43C5:
	djnz L_43E7		;43c5
	call L_547E		;43c7
	call 0bbfbh		;43ca
	push af			;43cd
	call L_5464		;43ce
	pop af			;43d1
	ret nc			;43d2
	ld a,(0cc10h)		;43d3
	add a,a			;43d6
	inc a			;43d7
	ld b,a			;43d8
	ld a,(0cc13h)		;43d9
	rla			;43dc
	jr nc,L_43E0		;43dd
	inc b			;43df
L_43E0:
	ld a,b			;43e0
	ld (0c208h),a		;43e1
	jp L_44B8		;43e4
L_43E7:
	xor a			;43e7
	ld (0c20ah),a		;43e8
	ld (0c208h),a		;43eb
	call L_4412		;43ee
	jr c,L_440A		;43f1
	call L_4A2C		;43f3
	call 060edh		;43f6
	call L_547E		;43f9
	call 0bbd2h		;43fc
	call L_5464		;43ff
	ld a,089h		;4402
	call L_56E3		;4404
	jp L_41AC		;4407
L_440A:
	ld a,08eh		;440a
	call L_56E3		;440c
	jp L_435E		;440f
L_4412:
	ld a,(0c2b0h)		;4412
	ld b,a			;4415
	ld a,(0c2d0h)		;4416
	and b			;4419
	ret z			;441a
	scf			;441b
	ret			;441c
L_441D:
	exx			;441d
	call L_4FEE		;441e
	exx			;4421
	djnz L_445E		;4422
	ld a,(0c205h)		;4424
	and 004h		;4427
	jr z,L_443D		;4429
	ld a,(0c00eh)		;442b
	and 010h		;442e
	jr z,L_443D		;4430
	ld a,001h		;4432
	ld (0c20ch),a		;4434
	ld hl,05095h		;4437
	call L_4D4E		;443a
L_443D:
	ld a,(0c003h)		;443d
	rra			;4440
	ret c			;4441
	ld hl,0c004h		;4442
	dec (hl)			;4445
	ret nz			;4446
	ld a,(0c205h)		;4447
	and 004h		;444a
	jr z,L_4454		;444c
	ld a,(0c20ch)		;444e
	and a			;4451
	jr nz,L_4477		;4452
L_4454:
	ld hl,0c002h		;4454
	ld a,(hl)			;4457
	and 0bfh		;4458
	ld (hl),a			;445a
	jp L_4195		;445b
L_445E:
	call L_4A04		;445e
	ld hl,05088h		;4461
	call L_4D4A		;4464
	ld a,(0c205h)		;4467
	and 004h		;446a
	ld hl,05095h		;446c
	call nz,L_4D4A		;446f
	ld a,0b4h		;4472
	jp L_41A9		;4474
L_4477:
	call L_5ED0		;4477
	xor a			;447a
	ld (0c20ch),a		;447b
	jr L_449A		;447e
L_4480:
	call L_54AF		;4480
	call 0b8cch		;4483
	call L_5464		;4486
	call L_5E7A		;4489
	xor a			;448c
	ld (0c215h),a		;448d
	ld hl,0c226h		;4490
	ld a,(hl)			;4493
	and a			;4494
	jp z,L_459C		;4495
	ld (hl),000h		;4498
L_449A:
	ld hl,00204h		;449a
	ld (0c000h),hl		;449d
	jp L_4246		;44a0
L_44A3:
	exx			;44a3
	call L_4FEE		;44a4
	exx			;44a7
	djnz L_44BF		;44a8
	call L_547E		;44aa
	call 0bc4eh		;44ad
	call L_5464		;44b0
	ld a,(0c31ch)		;44b3
	and a			;44b6
	ret nz			;44b7
L_44B8:
	ld hl,00304h		;44b8
	ld (0c000h),hl		;44bb
	ret			;44be
L_44BF:
	call 06154h		;44bf
	call L_4A2C		;44c2
	call 060f3h		;44c5
	call L_547E		;44c8
	call 0bc0ch		;44cb
	call L_5464		;44ce
	xor a			;44d1
	ld (0c21ch),a		;44d2
	ld (0c216h),a		;44d5
	ld a,089h		;44d8
	call L_56E3		;44da
	jp L_41AC		;44dd
L_44E0:
	exx			;44e0
	call L_4FEE		;44e1
	exx			;44e4
	djnz L_451E		;44e5
	call 0615ch		;44e7
	ret c			;44ea
	xor a			;44eb
	ld (0c217h),a		;44ec
	ld (0c8abh),a		;44ef
	ld (0cc10h),a		;44f2
	ld (0c21ch),a		;44f5
	ld hl,0c21dh		;44f8
	inc (hl)			;44fb
	push hl			;44fc
	call L_4563		;44fd
	pop hl			;4500
	ld a,(hl)			;4501
	push af			;4502
	call L_4A2C		;4503
	pop af			;4506
	cp 005h		;4507
	ld a,004h		;4509
	jp c,L_4196		;450b
	call L_547E		;450e
	xor a			;4511
	ld (0c21fh),a		;4512
	call 071d2h		;4515
	call L_5464		;4518
	jp L_41AC		;451b
L_451E:
	djnz L_4539		;451e
	call L_547E		;4520
	call 06085h		;4523
	push af			;4526
	call L_5464		;4527
	pop af			;452a
	ret nc			;452b
	ld a,(0c21dh)		;452c
	cp 005h		;452f
	ld a,004h		;4531
	jp c,L_4196		;4533
	jp L_4454		;4536
L_4539:
	xor a			;4539
	ld (0c20ah),a		;453a
	call L_5F02		;453d
	call 06154h		;4540
	call L_4A2C		;4543
	call 060f3h		;4546
	ld a,(0c21dh)		;4549
	cp 004h		;454c
	ld a,08bh		;454e
	jr c,L_4554		;4550
	ld a,08ch		;4552
L_4554:
	call L_56E3		;4554
	call L_547E		;4557
	call 0baf2h		;455a
	call L_5464		;455d
	jp L_41AC		;4560
L_4563:
	ld a,(0c21dh)		;4563
	ld hl,04575h		;4566
	call L_543A		;4569
	ld a,l			;456c
	ld (0c2b6h),a		;456d
	ld a,h			;4570
	ld (0c2d6h),a		;4571
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
	call L_4FEE		;457f
	call L_547E		;4582
	call 09ffbh		;4585
	call L_5464		;4588
	ld a,(0c00eh)		;458b
	rra			;458e
	ret nc			;458f
	xor a			;4590
	ld (0c008h),a		;4591
	call L_5CFB		;4594
	ld a,0feh		;4597
	call L_56E3		;4599
L_459C:
	call L_4A12		;459c
	ld a,005h		;459f
	jp L_4196		;45a1
L_45A4:
	dec b			;45a4
	jr z,L_45B3		;45a5
	call L_547E		;45a7
	call 0a2fch		;45aa
	call L_5464		;45ad
	jp L_41AC		;45b0
L_45B3:
	call L_547E		;45b3
	call 0a32ah		;45b6
	call L_5464		;45b9
	ld a,(0e379h)		;45bc
	and a			;45bf
	ret z			;45c0
	ld a,(0e37ah)		;45c1
	and a			;45c4
	jp nz,L_4454		;45c5
	call L_4A1F		;45c8
	ld a,(0e379h)		;45cb
	push af			;45ce
	call L_4666		;45cf
	call L_5ED0		;45d2
	call L_53DE		;45d5
	pop af			;45d8
	ld (0c21dh),a		;45d9
	call L_50C1		;45dc
	call L_4563		;45df
	call L_547E		;45e2
	call 0b751h		;45e5
	call L_5464		;45e8
	call L_45F7		;45eb
	ld hl,00204h		;45ee
	ld (0c000h),hl		;45f1
	jp L_423A		;45f4
L_45F7:
	ld a,(0c205h)		;45f7
	rra			;45fa
	ret nc			;45fb
	ld hl,00100h		;45fc
	ld (0c259h),hl		;45ff
	ret			;4602
L_4603:
	call L_4FEE		;4603
	call L_547E		;4606
	call 09ffbh		;4609
	call L_5464		;460c
	ld a,(0c00eh)		;460f
	rra			;4612
	ret nc			;4613
	call L_4A2C		;4614
	call 060edh		;4617
	jp L_44B8		;461a
L_461D:
	call L_500C		;461d
	ld hl,0c201h		;4620
	call L_5005		;4623
	or a			;4626
	ret z			;4627
	ld hl,0c004h		;4628
	ld (hl),000h		;462b
	ld hl,0c000h		;462d
	ld b,(hl)			;4630
	djnz L_464A		;4631
	and 030h		;4633
	ret z			;4635
	ld c,a			;4636
	ld a,040h		;4637
	ld (0c002h),a		;4639
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
	call L_56E3		;464e
	call L_5120		;4651
	call L_53E6		;4654
	call L_547E		;4657
	call 096eah		;465a
	ld hl,05068h		;465d
	call L_4D4A		;4660
	jp L_5464		;4663
L_4666:
	ld hl,0c202h		;4666
	ld bc,02dfeh		;4669
	ld d,h			;466c
	ld e,l			;466d
	inc e			;466e
	ld (hl),000h		;466f
	ldir		;4671
	xor a			;4673
	ld (0c21dh),a		;4674
	ld (0cc10h),a		;4677
	ld hl,0c212h		;467a
	inc a			;467d
	ld (hl),a			;467e
	dec hl			;467f
	ld (hl),a			;4680
	ret			;4681
L_4682:
	ld hl,05062h		;4682
	call L_4D4A		;4685
	call L_47C5		;4688
	ld hl,00068h		;468b
	ld de,0c403h		;468e
	ld bc,01010h		;4691
	call L_4841		;4694
	call L_4782		;4697
	call L_485A		;469a
	jp L_4752		;469d
L_46A0:
	ld hl,00000h		;46a0
	ld de,00014h		;46a3
	ld c,00ah		;46a6
	call L_4B74		;46a8
	call L_5354		;46ab
	call L_4740		;46ae
	ld hl,05002h		;46b1
	ld de,06010h		;46b4
	call L_473B		;46b7
	ld hl,07002h		;46ba
	ld bc,0100dh		;46bd
	push bc			;46c0
	call L_4B0C		;46c1
	pop bc			;46c4
	ld hl,09002h		;46c5
	call L_4B0C		;46c8
	ld b,005h		;46cb
	ld c,000h		;46cd
	ld d,050h		;46cf
L_46D1:
	ld a,c			;46d1
	ld hl,0e329h		;46d2
	add a,a			;46d5
	add a,a			;46d6
	add a,a			;46d7
	call L_4083		;46d8
	ld a,(hl)			;46db
	and a			;46dc
	ld e,0bbh		;46dd
	jr z,L_46E3		;46df
	ld e,0aah		;46e1
L_46E3:
	inc l			;46e3
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
	call L_4BA2		;46f6
	exx			;46f9
	ld a,c			;46fa
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
	call L_4BDE		;4710
L_4713:
	ld de,0300dh		;4713
	ld hl,06094h		;4716
	ld bc,0a004h		;4719
	call L_4841		;471c
	ld a,(0cc13h)		;471f
	srl a		;4722
	srl a		;4724
	srl a		;4726
	add a,050h		;4728
	ld h,a			;472a
	ld a,(0cc10h)		;472b
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
L_473B:
	ld c,00dh		;473b
	jp L_4B74		;473d
L_4740:
	call L_548D		;4740
	ld a,(0c21dh)		;4743
	ld hl,0be3dh		;4746
	call L_543A		;4749
	call L_4D4A		;474c
	jp L_5464		;474f
L_4752:
	ld de,02a06h		;4752
	call L_47EB		;4755
L_4758:
	srl a		;4758
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
	ld bc,00408h		;476e
	call L_4841		;4771
	pop bc			;4774
	pop de			;4775
	ld a,d			;4776
	add a,004h		;4777
	ld d,a			;4779
	ld a,c			;477a
	and a			;477b
	jr z,L_477F		;477c
	dec c			;477e
L_477F:
	djnz L_4763		;477f
	ret			;4781
L_4782:
	ld bc,0d802h		;4782
L_4785:
	ld hl,0c25ah		;4785
	push bc			;4788
	push hl			;4789
	call L_47FE		;478a
	pop hl			;478d
	pop bc			;478e
	dec hl			;478f
	ld a,b			;4790
	add a,010h		;4791
	ld b,a			;4793
	jp L_47FE		;4794
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
	call L_47B4		;47a9
	ld a,(hl)			;47ac
	call L_47B4		;47ad
	dec hl			;47b0
	djnz L_479E		;47b1
	ret			;47b3
L_47B4:
	and 00fh		;47b4
	jr z,L_47BA		;47b6
	ld c,0ffh		;47b8
L_47BA:
	add a,021h		;47ba
	and c			;47bc
	call L_4D86		;47bd
	ld a,d			;47c0
	add a,008h		;47c1
	ld d,a			;47c3
	ret			;47c4
L_47C5:
	ld hl,00000h		;47c5
	ld de,00014h		;47c8
	ld c,00bh		;47cb
	call L_4B74		;47cd
	ld hl,06f00h		;47d0
	ld bc,0140bh		;47d3
	call L_47E3		;47d6
	inc h			;47d9
	call L_47E3		;47da
	ld h,0bfh		;47dd
	call L_47E3		;47df
	inc h			;47e2
L_47E3:
	push hl			;47e3
	push bc			;47e4
	call L_4B0C		;47e5
	pop bc			;47e8
	pop hl			;47e9
	ret			;47ea
L_47EB:
	ld b,005h		;47eb
L_47ED:
	ld a,(0c240h)		;47ed
	add a,a			;47f0
	add a,a			;47f1
	add a,a			;47f2
	add a,a			;47f3
	add a,a			;47f4
	add a,b			;47f5
	ld hl,0c2b0h		;47f6
	call L_4083		;47f9
	ld a,(hl)			;47fc
	ret			;47fd
L_47FE:
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
	call L_4088		;480c
	ld a,(de)			;480f
	push de			;4810
	push bc			;4811
	call L_4836		;4812
	pop bc			;4815
	pop de			;4816
	call L_4830		;4817
	pop hl			;481a
	pop de			;481b
	pop bc			;481c
	ld a,b			;481d
	add a,008h		;481e
	ld b,a			;4820
	ld a,(hl)			;4821
	and 00fh		;4822
	add a,a			;4824
	call L_4088		;4825
	ld a,(de)			;4828
	push de			;4829
	push bc			;482a
	call L_4836		;482b
	pop bc			;482e
	pop de			;482f
L_4830:
	ld a,c			;4830
	add a,008h		;4831
	ld c,a			;4833
	inc de			;4834
	ld a,(de)			;4835
L_4836:
	ld d,b			;4836
	ld e,c			;4837
	add a,a			;4838
	add a,a			;4839
	add a,a			;483a
	ld h,a			;483b
	ld l,058h		;483c
	ld bc,00808h		;483e
L_4841:
	ld a,001h		;4841
	jp L_4BDE		;4843

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


L_485A:
	ld b,006h		;485a
	call L_47ED		;485c
	ld hl,04891h		;485f
	call L_4083		;4862
	ld c,(hl)			;4865
	ld b,004h		;4866
	ld hl,000c0h		;4868
	ld de,07a04h		;486b
L_486E:
	push hl			;486e
	push de			;486f
	push bc			;4870
	ld a,c			;4871
	sub 004h		;4872
	neg		;4874
	cp b			;4876
	jr nz,L_487D		;4877
	ld a,h			;4879
	add a,040h		;487a
	ld h,a			;487c
L_487D:
	ld bc,00c0ch		;487d
	call L_4841		;4880
	pop bc			;4883
	pop de			;4884
	pop hl			;4885
	ld a,h			;4886
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
	call L_4909		;4895
	call L_48A8		;4898
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
L_48A8:
	ex de,hl			;48a8
	ld a,c			;48a9
	or a			;48aa
	ld a,b			;48ab
	ld b,c			;48ac
	ret z			;48ad
	inc a			;48ae
	ret			;48af
L_48B0:
	ex de,hl			;48b0
	call L_48EA		;48b1
	call L_48A8		;48b4
	ex af,af'			;48b7
	ld a,(00007h)		;48b8
	ld c,a			;48bb
	ex af,af'			;48bc
L_48BD:
	otir		;48bd
	dec a			;48bf
	jr nz,L_48BD		;48c0
	ret			;48c2
L_48C3:
	push de			;48c3
	push af			;48c4
	call L_48EA		;48c5
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
	out (c),a		;48d3
	dec d			;48d5
	jr nz,L_48D3		;48d6
	djnz L_48D3		;48d8
	pop de			;48da
	ret			;48db
L_48DC:
	push bc			;48dc
	push af			;48dd
	call L_48EA		;48de
	ld a,(00007h)		;48e1
	ld c,a			;48e4
	pop af			;48e5
	out (c),a		;48e6
	pop bc			;48e8
	ret			;48e9
L_48EA:
	push bc			;48ea
	ld a,(00007h)		;48eb
	inc a			;48ee
	ld c,a			;48ef
	ld a,h			;48f0
	rlca			;48f1
	rlca			;48f2
	and 003h		;48f3
	di			;48f5
	out (c),a		;48f6
	ld a,08eh		;48f8
	out (c),a		;48fa
	ld a,l			;48fc
	out (c),a		;48fd
	ld a,h			;48ff
	and 03fh		;4900
	or 040h		;4902
	out (c),a		;4904
	pop bc			;4906
	ei			;4907
	ret			;4908
L_4909:
	push bc			;4909
	ld a,(00007h)		;490a
	inc a			;490d
	ld c,a			;490e
	ld a,h			;490f
	rlca			;4910
	rlca			;4911
	and 003h		;4912
	di			;4914
	out (c),a		;4915
	ld a,08eh		;4917
	out (c),a		;4919
	ld a,l			;491b
	out (c),a		;491c
	ld a,h			;491e
	and 03fh		;491f
	out (c),a		;4921
	pop bc			;4923
	ei			;4924
	ret			;4925
L_4926:
	ex de,hl			;4926
	ld e,(hl)			;4927
	inc hl			;4928
	ld d,(hl)			;4929
	inc hl			;492a
	ex de,hl			;492b
L_492C:
	call L_48EA		;492c
	ld a,(00007h)		;492f
	ld c,a			;4932
L_4933:
	ld a,(de)			;4933
	and a			;4934
	ret z			;4935
	inc de			;4936
	ld b,a			;4937
	and 07fh		;4938
	cp b			;493a
	jr z,L_4947		;493b
	and a			;493d
	jr z,L_4926		;493e
	ex de,hl			;4940
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
	ex de,hl			;494f
	ld e,(hl)			;4950
	inc hl			;4951
	ld d,(hl)			;4952
	inc hl			;4953
	ex de,hl			;4954
L_4955:
	ld (0de80h),hl		;4955
	call L_49CE		;4958
	call L_496C		;495b
	exx			;495e
	push de			;495f
	exx			;4960
	pop bc			;4961
	ld hl,0d600h		;4962
	ld de,(0de80h)		;4965
	jp L_48B0		;4969
L_496C:
	exx			;496c
	push de			;496d
	exx			;496e
	pop bc			;496f
	rl c		;4970
	rl b		;4972
	rl c		;4974
	rl b		;4976
	rl c		;4978
	rl b		;497a
	ld hl,0d600h		;497c
	push bc			;497f
	ld c,b			;4980
L_4981:
	ld b,020h		;4981
L_4983:
	ld a,(hl)			;4983
	call L_49B2		;4984
	ld (hl),a			;4987
	inc hl			;4988
	djnz L_4983		;4989
	dec c			;498b
	jr nz,L_4981		;498c
	pop bc			;498e
	ld hl,0d600h		;498f
	ld de,0d610h		;4992
L_4995:
	push bc			;4995
	ld b,010h		;4996
L_4998:
	ld c,(hl)			;4998
	ld a,(de)			;4999
	ld (hl),a			;499a
	ld a,c			;499b
	ld (de),a			;499c
	inc de			;499d
	inc hl			;499e
	djnz L_4998		;499f
	ld a,010h		;49a1
	call L_4088		;49a3
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
L_49B2:
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
	call L_49CE		;49be
	exx			;49c1
	pop hl			;49c2
	push de			;49c3
	pop bc			;49c4
	ld de,0d600h		;49c5
	ex de,hl			;49c8
	call L_48B0		;49c9
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


L_49CE:
	ld hl,0d600h		;49ce
	exx			;49d1
	ld de,00000h		;49d2
	exx			;49d5
L_49D6:
	ld a,(de)			;49d6
	and a			;49d7
	ret z			;49d8
	inc de			;49d9
	ld b,a			;49da
	and 07fh		;49db
	cp b			;49dd
	jr z,L_49EE		;49de
	ex de,hl			;49e0
	ld b,000h		;49e1
	ld c,a			;49e3
	exx			;49e4
	call L_4088		;49e5
	exx			;49e8
	ldir		;49e9
	ex de,hl			;49eb
	jr L_49D6		;49ec
L_49EE:
	ld a,b			;49ee
	exx			;49ef
	call L_4088		;49f0
	exx			;49f3
	ld a,(de)			;49f4
	inc de			;49f5
L_49F6:
	ld (hl),a			;49f6
	inc hl			;49f7
	djnz L_49F6		;49f8
	jr L_49D6		;49fa
L_49FC:
	call L_4A44		;49fc
	ld bc,00000h		;49ff
	jr L_4A0A		;4a02
L_4A04:
	call L_4A44		;4a04
L_4A07:
	ld bc,000d4h		;4a07
L_4A0A:
	push bc			;4a0a
	call L_4A1F		;4a0b
	pop bc			;4a0e
	call L_4A35		;4a0f
L_4A12:
	ld a,(0f3e0h)		;4a12
	or 040h		;4a15
	ld b,a			;4a17
	ld c,001h		;4a18
	call 00047h		;4a1a   ; BIOS WRTVDP - Writes data in the VDP-register
	jr L_4A68		;4a1d
L_4A1F:
	ld a,(0f3e0h)		;4a1f
	and 0bfh		;4a22
	ld b,a			;4a24
	ld c,001h		;4a25
	call 00047h		;4a27   ; BIOS WRTVDP - Writes data in the VDP-register
	jr L_4A5D		;4a2a
L_4A2C:
	call L_4A1F		;4a2c
	call L_4A44		;4a2f
	ld bc,000d4h		;4a32
L_4A35:
	ld hl,00000h		;4a35
	xor a			;4a38
	ld d,a			;4a39
	call L_4BA2		;4a3a
	ld b,000h		;4a3d
	ld c,017h		;4a3f
	jp 00047h		;4a41   ; BIOS WRTVDP - Writes data in the VDP-register
L_4A44:
	call L_5443		;4a44
	ld hl,0f600h		;4a47
	ld a,0e0h		;4a4a
	ld bc,00080h		;4a4c
	call L_48C3		;4a4f
	ld hl,07600h		;4a52
	ld a,0e0h		;4a55
	ld bc,00080h		;4a57
	jp L_48C3		;4a5a
L_4A5D:
	ld a,(0ffe7h)		;4a5d
	or 002h		;4a60
	ld b,a			;4a62
	ld c,008h		;4a63
	jp 00047h		;4a65   ; BIOS WRTVDP - Writes data in the VDP-register
L_4A68:
	ld a,(0ffe7h)		;4a68
	and 0fdh		;4a6b
	ld b,a			;4a6d
	ld c,008h		;4a6e
	jp 00047h		;4a70   ; BIOS WRTVDP - Writes data in the VDP-register
L_4A73:
	push bc			;4a73
	push hl			;4a74
	ld b,a			;4a75
	ld a,(00007h)		;4a76
	inc a			;4a79
	ld c,a			;4a7a
	di			;4a7b
	out (c),b		;4a7c
	ld a,090h		;4a7e
	out (c),a		;4a80
	inc c			;4a82
	out (c),d		;4a83
	push af			;4a85
	pop af			;4a86
	out (c),e		;4a87
	dec c			;4a89
	ld hl,0f680h		;4a8a
	ld a,b			;4a8d
	add a,a			;4a8e
	add a,l			;4a8f
	ld l,a			;4a90
	call L_48EA		;4a91
	dec c			;4a94
	out (c),d		;4a95
	out (c),e		;4a97
	pop hl			;4a99
	pop bc			;4a9a
	ei			;4a9b
	ret			;4a9c
L_4A9D:
	ld a,(hl)			;4a9d
	inc hl			;4a9e
	inc a			;4a9f
	ret z			;4aa0
	dec a			;4aa1
	ld d,(hl)			;4aa2
	inc hl			;4aa3
	ld e,(hl)			;4aa4
	inc hl			;4aa5
	call L_4A73		;4aa6
	jr L_4A9D		;4aa9
L_4AAB:
	ld a,002h		;4aab
	call L_4AB4		;4aad
	rra			;4ab0
	jr c,L_4AAB		;4ab1
	ret			;4ab3
L_4AB4:
	push bc			;4ab4
	push hl			;4ab5
	ld hl,(00006h)		;4ab6
	inc h			;4ab9
	inc l			;4aba
	ld c,h			;4abb
	di			;4abc
	out (c),a		;4abd
	ld a,08fh		;4abf
	out (c),a		;4ac1
	ld c,l			;4ac3
	in a,(c)		;4ac4
	push af			;4ac6
	xor a			;4ac7
	ld c,h			;4ac8
	out (c),a		;4ac9
	ld a,08fh		;4acb
	out (c),a		;4acd
	pop af			;4acf
	pop hl			;4ad0
	pop bc			;4ad1
	ei			;4ad2
	ret			;4ad3
L_4AD4:
	push de			;4ad4
	call L_4AAB		;4ad5
	push bc			;4ad8
	ld a,(00007h)		;4ad9
	inc a			;4adc
	ld c,a			;4add
	ld a,024h		;4ade
	di			;4ae0
	out (c),a		;4ae1
	ld a,091h		;4ae3
	out (c),a		;4ae5
	inc c			;4ae7
	inc c			;4ae8
	out (c),h		;4ae9
	xor a			;4aeb
	out (c),a		;4aec
	out (c),l		;4aee
	pop hl			;4af0
	pop de			;4af1
	ld a,(0c8e0h)		;4af2
	out (c),a		;4af5
	dec h			;4af7
	out (c),h		;4af8
	xor a			;4afa
	out (c),a		;4afb
	xor a			;4afd
	out (c),a		;4afe
	out (c),a		;4b00
	out (c),l		;4b02
	out (c),a		;4b04
	ld a,070h		;4b06
	out (c),a		;4b08
	ei			;4b0a
	ret			;4b0b
L_4B0C:
	call L_4AAB		;4b0c
	push bc			;4b0f
	ld a,(00007h)		;4b10
	inc a			;4b13
	ld c,a			;4b14
	ld a,024h		;4b15
	di			;4b17
	out (c),a		;4b18
	ld a,091h		;4b1a
	out (c),a		;4b1c
	inc c			;4b1e
	inc c			;4b1f
	out (c),h		;4b20
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
	inc a			;4b37
	out (c),a		;4b38
	ld a,070h		;4b3a
	out (c),a		;4b3c
	ei			;4b3e
	ret			;4b3f
L_4B40:
	call L_4AAB		;4b40
	push bc			;4b43
	ld a,(00007h)		;4b44
	inc a			;4b47
	ld c,a			;4b48
	ld a,024h		;4b49
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
	out (c),d		;4b5f
	xor a			;4b61
	out (c),a		;4b62
	out (c),e		;4b64
	xor a			;4b66
	out (c),a		;4b67
	out (c),l		;4b69
	xor a			;4b6b
	out (c),a		;4b6c
	ld a,070h		;4b6e
	out (c),a		;4b70
	ei			;4b72
	ret			;4b73
L_4B74:
	ld b,e			;4b74
	call L_4B8E		;4b75
	ld b,d			;4b78
	call L_4B98		;4b79
	push hl			;4b7c
	ld a,l			;4b7d
	dec a			;4b7e
	add a,e			;4b7f
	ld l,a			;4b80
	ld b,d			;4b81
	call L_4B98		;4b82
	pop hl			;4b85
	ld a,h			;4b86
	dec a			;4b87
	add a,d			;4b88
	ld h,a			;4b89
	ld b,e			;4b8a
	jp L_4B8E		;4b8b
L_4B8E:
	push hl			;4b8e
	push de			;4b8f
	push bc			;4b90
	call L_4B0C		;4b91
	pop bc			;4b94
	pop de			;4b95
	pop hl			;4b96
	ret			;4b97
L_4B98:
	push hl			;4b98
	push de			;4b99
	push bc			;4b9a
	call L_4AD4		;4b9b
	pop bc			;4b9e
	pop de			;4b9f
	pop hl			;4ba0
	ret			;4ba1
L_4BA2:
	ex af,af'			;4ba2
	call L_4AAB		;4ba3
	push bc			;4ba6
	ld a,(00007h)		;4ba7
	inc a			;4baa
	ld c,a			;4bab
	ld a,024h		;4bac
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
	out (c),h		;4bc1
	cp h			;4bc3
	jr nz,L_4BC7		;4bc4
	inc a			;4bc6
L_4BC7:
	out (c),a		;4bc7
	xor a			;4bc9
	out (c),l		;4bca
	cp l			;4bcc
	jr nz,L_4BD0		;4bcd
	inc a			;4bcf
L_4BD0:
	out (c),a		;4bd0
	ex af,af'			;4bd2
	out (c),a		;4bd3
	xor a			;4bd5
	out (c),a		;4bd6
	ld a,0c0h		;4bd8
	out (c),a		;4bda
	ei			;4bdc
	ret			;4bdd
L_4BDE:
	ex af,af'			;4bde
	call L_4AAB		;4bdf
	push bc			;4be2
	ld a,(00007h)		;4be3
	inc a			;4be6
	ld c,a			;4be7
	ld a,020h		;4be8
	di			;4bea
	out (c),a		;4beb
	ld a,091h		;4bed
	out (c),a		;4bef
	inc c			;4bf1
	inc c			;4bf2
	out (c),h		;4bf3
	xor a			;4bf5
	out (c),a		;4bf6
	out (c),l		;4bf8
	ex af,af'			;4bfa
	ld l,a			;4bfb
	and 003h		;4bfc
	out (c),a		;4bfe
	out (c),d		;4c00
	xor a			;4c02
	out (c),a		;4c03
	out (c),e		;4c05
	ld a,l			;4c07
	rra			;4c08
	rra			;4c09
	and 003h		;4c0a
	out (c),a		;4c0c
	pop hl			;4c0e
	out (c),h		;4c0f
	xor a			;4c11
	out (c),a		;4c12
	out (c),l		;4c14
	out (c),a		;4c16
	out (c),a		;4c18
	out (c),a		;4c1a
	ld a,0d0h		;4c1c
	out (c),a		;4c1e
	ei			;4c20
	ret			;4c21
L_4C22:
	ex af,af'			;4c22
	call L_4AAB		;4c23
	push bc			;4c26
	ld a,(00007h)		;4c27
	inc a			;4c2a
	ld c,a			;4c2b
	ld a,024h		;4c2c
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
	pop de			;4c41
	out (c),d		;4c42
	xor a			;4c44
	out (c),a		;4c45
	out (c),e		;4c47
	out (c),a		;4c49
	ld a,(hl)			;4c4b
	inc hl			;4c4c
	out (c),a		;4c4d
	xor a			;4c4f
	out (c),a		;4c50
	ld a,0f0h		;4c52
	out (c),a		;4c54
	dec c			;4c56
	dec c			;4c57
	ld a,0ach		;4c58
	out (c),a		;4c5a
	ld a,091h		;4c5c
	out (c),a		;4c5e
	inc c			;4c60
	inc c			;4c61
L_4C62:
	ld a,002h		;4c62
	call L_4AB4		;4c64
	rra			;4c67
	ret nc			;4c68
	add a,a			;4c69
	add a,a			;4c6a
	jr nc,L_4C62		;4c6b
	ld a,(hl)			;4c6d
	inc hl			;4c6e
	out (c),a		;4c6f
	jr L_4C62		;4c71
L_4C73:
	ex af,af'			;4c73
	call L_4AAB		;4c74
	push bc			;4c77
	ld a,(00007h)		;4c78
	inc a			;4c7b
	ld c,a			;4c7c
	ld a,020h		;4c7d
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
	ex af,af'			;4c8f
	rlca			;4c90
	rlca			;4c91
	ld l,a			;4c92
	and 003h		;4c93
	out (c),a		;4c95
	out (c),d		;4c97
	xor a			;4c99
	out (c),a		;4c9a
	out (c),e		;4c9c
	ld a,l			;4c9e
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
	ld a,e			;4cb4
	rra			;4cb5
	rra			;4cb6
	and 00fh		;4cb7
	or 090h		;4cb9
	out (c),a		;4cbb
	ei			;4cbd
	ret			;4cbe
L_4CBF:
	xor a			;4cbf
	ld (0de80h),a		;4cc0
L_4CC3:
	call L_4CD3		;4cc3
	call L_4E3F		;4cc6
	djnz L_4CC3		;4cc9
	ret			;4ccb
L_4CCC:
	ld a,001h		;4ccc
	ld (0de80h),a		;4cce
	jr L_4CC3		;4cd1
L_4CD3:
	push bc			;4cd3
	push de			;4cd4
	push hl			;4cd5
	push de			;4cd6
	call L_4D24		;4cd7
	pop de			;4cda
	ld b,d			;4cdb
	ld d,e			;4cdc
	ld e,b			;4cdd
	srl d		;4cde
	rr e		;4ce0
	ld a,(0de80h)		;4ce2
	and a			;4ce5
	jr nz,L_4CEC		;4ce6
	ld a,d			;4ce8
	add a,080h		;4ce9
	ld d,a			;4ceb
L_4CEC:
	ld hl,0c1c0h		;4cec
	call L_4CFA		;4cef
	pop hl			;4cf2
	ld bc,00008h		;4cf3
	add hl,bc			;4cf6
	pop de			;4cf7
	pop bc			;4cf8
	ret			;4cf9
L_4CFA:
	push de			;4cfa
	ld b,008h		;4cfb
L_4CFD:
	push bc			;4cfd
	ld bc,00004h		;4cfe
	call L_48B0		;4d01
	ex de,hl			;4d04
	ld bc,00080h		;4d05
	add hl,bc			;4d08
	ex de,hl			;4d09
	pop bc			;4d0a
	djnz L_4CFD		;4d0b
	pop de			;4d0d
	ret			;4d0e
L_4D0F:
	push bc			;4d0f
	call L_4CFA		;4d10
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
	djnz L_4D0F		;4d21
	ret			;4d23
L_4D24:
	ld b,008h		;4d24
	ld de,0c1c0h		;4d26
L_4D29:
	push bc			;4d29
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
	rld		;4d3e
	inc hl			;4d40
	djnz L_4D30		;4d41
	ex de,hl			;4d43
	pop hl			;4d44
	inc hl			;4d45
	pop bc			;4d46
	djnz L_4D29		;4d47
	ret			;4d49
L_4D4A:
	ld c,0ffh		;4d4a
	jr L_4D50		;4d4c
L_4D4E:
	ld c,000h		;4d4e
L_4D50:
	ld d,(hl)			;4d50
	inc hl			;4d51
	ld e,(hl)			;4d52
	inc hl			;4d53
L_4D54:
	ld a,(hl)			;4d54
	inc hl			;4d55
	ld b,a			;4d56
	inc b			;4d57
	ret z			;4d58
	inc b			;4d59
	jr z,L_4D4A		;4d5a
	and c			;4d5c
	call L_4D86		;4d5d
	cp 07bh		;4d60
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
	ld a,(hl)			;4d6f
	inc hl			;4d70
	call L_4E07		;4d71
	ld a,d			;4d74
	add a,008h		;4d75
	ld d,a			;4d77
	djnz L_4D6F		;4d78
	ld b,004h		;4d7a
	ld d,0e0h		;4d7c
	ld a,e			;4d7e
	add a,008h		;4d7f
	ld e,a			;4d81
	dec c			;4d82
	jr nz,L_4D6F		;4d83
	ret			;4d85
L_4D86:
	push af			;4d86
	push bc			;4d87
	push hl			;4d88
	push de			;4d89
	or a			;4d8a
	ld h,a			;4d8b
	jr z,L_4D93		;4d8c
	call L_4E2B		;4d8e
	add a,038h		;4d91
L_4D93:
	ld l,a			;4d93
	ld bc,00808h		;4d94
	ld a,(0c20bh)		;4d97
	and a			;4d9a
	ld a,001h		;4d9b
	jr z,L_4DA1		;4d9d
	ld a,005h		;4d9f
L_4DA1:
	call L_4BDE		;4da1
	pop de			;4da4
	pop hl			;4da5
	pop bc			;4da6
	pop af			;4da7
	ret			;4da8
L_4DA9:
	push af			;4da9
	call L_4D86		;4daa
	call L_4E3F		;4dad
	pop af			;4db0
	djnz L_4DA9		;4db1
	ret			;4db3
L_4DB4:
	push bc			;4db4
	push hl			;4db5
	push de			;4db6
	call L_4E2B		;4db7
	ld bc,00808h		;4dba
	ld a,(0c20bh)		;4dbd
	and a			;4dc0
	ld a,001h		;4dc1
	jr z,L_4DC7		;4dc3
	ld a,005h		;4dc5
L_4DC7:
	call L_4BDE		;4dc7
	pop de			;4dca
	pop hl			;4dcb
	pop bc			;4dcc
	ret			;4dcd
L_4DCE:
	push bc			;4dce
	push hl			;4dcf
	push de			;4dd0
	call L_4E2B		;4dd1
	ld bc,00808h		;4dd4
	ld a,048h		;4dd7
	call L_4C73		;4dd9
	pop de			;4ddc
	pop hl			;4ddd
	pop bc			;4dde
	ret			;4ddf
L_4DE0:
	push bc			;4de0
	push hl			;4de1
	push de			;4de2
	push af			;4de3
	push de			;4de4
	call L_4E2B		;4de5
	ld bc,01008h		;4de8
	ld a,058h		;4deb
	call L_4C73		;4ded
	pop de			;4df0
	ld a,008h		;4df1
	add a,e			;4df3
	ld e,a			;4df4
	pop af			;4df5
	inc a			;4df6
	inc a			;4df7
	call L_4E2B		;4df8
	ld bc,01008h		;4dfb
	ld a,058h		;4dfe
	call L_4C73		;4e00
	pop de			;4e03
	pop hl			;4e04
	pop bc			;4e05
	ret			;4e06
L_4E07:
	push bc			;4e07
	push hl			;4e08
	push de			;4e09
	call L_4E2B		;4e0a
	ld bc,00808h		;4e0d
	ld a,058h		;4e10
	call L_4C73		;4e12
	pop de			;4e15
	pop hl			;4e16
	pop bc			;4e17
	ret			;4e18
L_4E19:
	push bc			;4e19
	push hl			;4e1a
	push de			;4e1b
	call L_4E2B		;4e1c
	ld bc,00808h		;4e1f
	ld a,005h		;4e22
	call L_4BDE		;4e24
	pop de			;4e27
	pop hl			;4e28
	pop bc			;4e29
	ret			;4e2a
L_4E2B:
	ld b,a			;4e2b
	and 01fh		;4e2c
	add a,a			;4e2e
	add a,a			;4e2f
	add a,a			;4e30
	ld h,a			;4e31
	ld a,b			;4e32
	and 0e0h		;4e33
	rrca			;4e35
	rrca			;4e36
	ld l,a			;4e37
	ret			;4e38
L_4E39:
	cp 07bh		;4e39
	ld a,004h		;4e3b
	jr z,L_4E41		;4e3d
L_4E3F:
	ld a,008h		;4e3f
L_4E41:
	add a,d			;4e41
	ld d,a			;4e42
	ret nz			;4e43
	ld a,e			;4e44
	add a,008h		;4e45
	ld e,a			;4e47
	ret			;4e48
L_4E49:
	push bc			;4e49
	push de			;4e4a
	exx			;4e4b
	ld hl,0e800h		;4e4c
	exx			;4e4f
L_4E50:
	push bc			;4e50
	call L_4E75		;4e51
	pop bc			;4e54
	djnz L_4E50		;4e55
	pop de			;4e57
	pop bc			;4e58
	ld hl,0e800h		;4e59
	jp L_4D0F		;4e5c
L_4E5F:
	push bc			;4e5f
	push de			;4e60
	exx			;4e61
	ld hl,0e800h		;4e62
	exx			;4e65
L_4E66:
	push bc			;4e66
	call L_4E75		;4e67
	pop bc			;4e6a
	djnz L_4E66		;4e6b
	pop de			;4e6d
	pop bc			;4e6e
	ld hl,0e800h		;4e6f
	jp L_4F92		;4e72
L_4E75:
	ld b,008h		;4e75
L_4E77:
	ld e,(hl)			;4e77
	inc hl			;4e78
	push bc			;4e79
	call L_4E81		;4e7a
	pop bc			;4e7d
	djnz L_4E77		;4e7e
	ret			;4e80
L_4E81:
	ld b,004h		;4e81
L_4E83:
	xor a			;4e83
	rl e		;4e84
	rla			;4e86
	exx			;4e87
	ld e,a			;4e88
	ld d,0dfh		;4e89
	ld a,(de)			;4e8b
	add a,a			;4e8c
	add a,a			;4e8d
	add a,a			;4e8e
	add a,a			;4e8f
	ld c,a			;4e90
	exx			;4e91
	xor a			;4e92
	rl e		;4e93
	rla			;4e95
	exx			;4e96
	ld e,a			;4e97
	ld d,0dfh		;4e98
	ld a,(de)			;4e9a
	or c			;4e9b
	ld (hl),a			;4e9c
	inc hl			;4e9d
	exx			;4e9e
	djnz L_4E83		;4e9f
	ret			;4ea1
L_4EA2:
	push bc			;4ea2
	push de			;4ea3
	exx			;4ea4
	ld hl,0e800h		;4ea5
	exx			;4ea8
L_4EA9:
	push bc			;4ea9
	call L_4ECE		;4eaa
	pop bc			;4ead
	djnz L_4EA9		;4eae
	pop de			;4eb0
	pop bc			;4eb1
	ld hl,0e800h		;4eb2
	jp L_4D0F		;4eb5
L_4EB8:
	push bc			;4eb8
	push de			;4eb9
	exx			;4eba
	ld hl,0e800h		;4ebb
	exx			;4ebe
L_4EBF:
	push bc			;4ebf
	call L_4ECE		;4ec0
	pop bc			;4ec3
	djnz L_4EBF		;4ec4
	pop de			;4ec6
	pop bc			;4ec7
	ld hl,0e800h		;4ec8
	jp L_4F92		;4ecb
L_4ECE:
	ld b,008h		;4ece
L_4ED0:
	push bc			;4ed0
	call L_4ED8		;4ed1
	pop bc			;4ed4
	djnz L_4ED0		;4ed5
	ret			;4ed7
L_4ED8:
	ld b,004h		;4ed8
	ld e,(hl)			;4eda
	inc hl			;4edb
	ld d,(hl)			;4edc
	inc hl			;4edd
L_4EDE:
	xor a			;4ede
	rl d		;4edf
	rla			;4ee1
	rl e		;4ee2
	rla			;4ee4
	exx			;4ee5
	ld e,a			;4ee6
	ld d,0dfh		;4ee7
	ld a,(de)			;4ee9
	add a,a			;4eea
	add a,a			;4eeb
	add a,a			;4eec
	add a,a			;4eed
	ld c,a			;4eee
	exx			;4eef
	xor a			;4ef0
	rl d		;4ef1
	rla			;4ef3
	rl e		;4ef4
	rla			;4ef6
	exx			;4ef7
	ld e,a			;4ef8
	ld d,0dfh		;4ef9
	ld a,(de)			;4efb
	or c			;4efc
	ld (hl),a			;4efd
	inc hl			;4efe
	exx			;4eff
	djnz L_4EDE		;4f00
	ret			;4f02
L_4F03:
	push bc			;4f03
	push de			;4f04
	exx			;4f05
	ld hl,0e800h		;4f06
	exx			;4f09
L_4F0A:
	push bc			;4f0a
	call L_4F2F		;4f0b
	pop bc			;4f0e
	djnz L_4F0A		;4f0f
	pop de			;4f11
	pop bc			;4f12
	ld hl,0e800h		;4f13
	jp L_4D0F		;4f16
L_4F19:
	push bc			;4f19
	push de			;4f1a
	exx			;4f1b
	ld hl,0e800h		;4f1c
	exx			;4f1f
L_4F20:
	push bc			;4f20
	call L_4F2F		;4f21
	pop bc			;4f24
	djnz L_4F20		;4f25
	pop de			;4f27
	pop bc			;4f28
	ld hl,0e800h		;4f29
	jp L_4F92		;4f2c
L_4F2F:
	ld b,008h		;4f2f
L_4F31:
	push bc			;4f31
	call L_4F39		;4f32
	pop bc			;4f35
	djnz L_4F31		;4f36
	ret			;4f38
L_4F39:
	ld b,004h		;4f39
	ld e,(hl)			;4f3b
	inc hl			;4f3c
	ld d,(hl)			;4f3d
	inc hl			;4f3e
	ld c,(hl)			;4f3f
	inc hl			;4f40
L_4F41:
	xor a			;4f41
	rl c		;4f42
	rla			;4f44
	rl d		;4f45
	rla			;4f47
	rl e		;4f48
	rla			;4f4a
	exx			;4f4b
	ld e,a			;4f4c
	ld d,0dfh		;4f4d
	ld a,(de)			;4f4f
	add a,a			;4f50
	add a,a			;4f51
	add a,a			;4f52
	add a,a			;4f53
	ld c,a			;4f54
	exx			;4f55
	xor a			;4f56
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
	ld (hl),a			;4f66
	inc hl			;4f67
	exx			;4f68
	djnz L_4F41		;4f69
	ret			;4f6b
L_4F6C:
	push de			;4f6c
	ld a,(00007h)		;4f6d
	ld c,a			;4f70
	ld b,008h		;4f71
L_4F73:
	push bc			;4f73
	ex de,hl			;4f74
	call L_48EA		;4f75
	ex de,hl			;4f78
	ld b,004h		;4f79
L_4F7B:
	ld a,(hl)			;4f7b
	dec hl			;4f7c
	rrca			;4f7d
	rrca			;4f7e
	rrca			;4f7f
	rrca			;4f80
	out (c),a		;4f81
	djnz L_4F7B		;4f83
	ld c,008h		;4f85
	add hl,bc			;4f87
	ex de,hl			;4f88
	ld c,080h		;4f89
	add hl,bc			;4f8b
	ex de,hl			;4f8c
	pop bc			;4f8d
	djnz L_4F73		;4f8e
	pop de			;4f90
	ret			;4f91
L_4F92:
	inc hl			;4f92
	inc hl			;4f93
	inc hl			;4f94
L_4F95:
	push bc			;4f95
	call L_4F6C		;4f96
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
L_4FAA:
	call L_569C		;4faa
	call L_4A5D		;4fad
	ld a,005h		;4fb0
	call 0005fh		;4fb2   ; BIOS CHGMOD - Switches to given screen mode
	call L_4A1F		;4fb5
	xor a			;4fb8
	ld h,a			;4fb9
	ld l,a			;4fba
	ld b,a			;4fbb
	ld c,a			;4fbc
	ld d,a			;4fbd
	call L_4BA2		;4fbe
	xor a			;4fc1
	ld h,a			;4fc2
	ld l,a			;4fc3
	ld b,a			;4fc4
	ld c,a			;4fc5
	ld d,001h		;4fc6
	call L_4BA2		;4fc8
	call L_4AAB		;4fcb
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
	call L_4A44		;4fe0
	jp L_4A12		;4fe3

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


L_4FEE:
	ld a,(0c002h)		;4fee
	and 040h		;4ff1
	jp z,06017h		;4ff3
	call L_5049		;4ff6
	ld hl,0c00fh		;4ff9
	call L_5005		;4ffc
	call L_500C		;4fff
L_5002:
	ld hl,0c007h		;5002
L_5005:
	ld c,(hl)			;5005
	ld (hl),a			;5006
	xor c			;5007
	and (hl)			;5008
	dec hl			;5009
	ld (hl),a			;500a
	ret			;500b
L_500C:
	ld e,08fh		;500c
	ld a,00fh		;500e
	call 00093h		;5010   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,00eh		;5013
	di			;5015
	call 00096h		;5016   ; BIOS RDPSG - Reads value from PSG-register
	ei			;5019
	cpl			;501a
	and 03fh		;501b
	push af			;501d
	ld a,006h		;501e
	call 00141h		;5020   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5023
	rlca			;5024
	rlca			;5025
	rlca			;5026
	rlca			;5027
	and 020h		;5028
	ld e,a			;502a
	ld a,008h		;502b
	call 00141h		;502d   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5030
	rrca			;5031
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
	pop bc			;5046
	or b			;5047
	ret			;5048
L_5049:
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


L_50B5:
	push hl			;50b5
	call L_5578		;50b6
	pop hl			;50b9
	ret			;50ba
L_50BB:
	push hl			;50bb
	call L_4CBF		;50bc
	pop hl			;50bf
	ret			;50c0
L_50C1:
	call L_548D		;50c1
	ld de,09289h		;50c4
	ld hl,0e800h		;50c7
	call L_50B5		;50ca
	push hl			;50cd
	ld de,00040h		;50ce
	ld bc,09c0dh		;50d1
	call L_4CBF		;50d4
	ld de,06058h		;50d7
	ld hl,0970ch		;50da
	ld bc,0010ah		;50dd
	call L_4CBF		;50e0
	ld de,0ac34h		;50e3
	ld hl,09714h		;50e6
	call L_4CFA		;50e9
	pop hl			;50ec
	ld de,09734h		;50ed
	call L_50B5		;50f0
	ld de,000c0h		;50f3
	ld bc,0080bh		;50f6
	call L_50BB		;50f9
	ld de,040c0h		;50fc
	ld bc,0080ah		;50ff
	call L_50BB		;5102
	ld de,09776h		;5105
	call L_50B5		;5108
	ld de,000c8h		;510b
	ld bc,0080bh		;510e
	call L_50BB		;5111
	ld de,040c8h		;5114
	ld bc,0080ah		;5117
	call L_4CBF		;511a
	jp L_5464		;511d
L_5120:
	call L_4A04		;5120
	call L_50C1		;5123
	ld a,00fh		;5126
	ld (0f3ebh),a		;5128
	call 00062h		;512b   ; BIOS CHGCLR - Changes the screen colors
	ld bc,00007h		;512e
	call 00047h		;5131   ; BIOS WRTVDP - Writes data in the VDP-register
	call L_547E		;5134
	call 096b5h		;5137
	call L_5464		;513a
	ld a,(0002bh)		;513d
	and 00fh		;5140
	ret nz			;5142
	call L_5488		;5143
	ld hl,0b37ah		;5146
	ld de,08048h		;5149
	ld bc,02c0dh		;514c
	call L_4CBF		;514f
	jp L_5464		;5152
L_5155:
	call L_5483		;5155
	ld hl,060b0h		;5158
	ld a,(0c21dh)		;515b
	call L_543A		;515e
	ld de,06064h		;5161
	call L_529C		;5164
	call L_5488		;5167
	ld hl,0a7aah		;516a
	ld de,0a7a4h		;516d
	call L_529C		;5170
	call L_547E		;5173
	call 0b9d8h		;5176
	jp L_5464		;5179
L_517C:
	call L_5483		;517c
	ld a,(0c20ah)		;517f
	and a			;5182
	jr nz,L_51D4		;5183
	call L_518E		;5185
	ld hl,06000h		;5188
	jp L_5286		;518b
L_518E:
	ld hl,0df00h		;518e
	ld (hl),004h		;5191
	inc l			;5193
	ld (hl),005h		;5194
	inc l			;5196
	ld (hl),00fh		;5197
	inc l			;5199
	ld (hl),003h		;519a
	ld de,08040h		;519c
	call L_51A5		;519f
	ld de,08048h		;51a2
L_51A5:
	ld hl,089f9h		;51a5
	ld b,002h		;51a8
	jp L_4EA2		;51aa
L_51AD:
	call L_5483		;51ad
	ld de,06064h		;51b0
	ld hl,061c1h		;51b3
	call L_529C		;51b6
	call L_547E		;51b9
	ld de,0798ah		;51bc
	ld hl,0799ch		;51bf
	jp L_529C		;51c2
L_51C5:
	call L_548D		;51c5
	ld de,0bb71h		;51c8
	ld hl,0bb95h		;51cb
	call L_5296		;51ce
	jp 0b4ebh		;51d1
L_51D4:
	ld hl,08a35h		;51d4
	ld de,08a19h		;51d7
	call L_529C		;51da
	call L_547E		;51dd
	ld hl,0e800h		;51e0
	ld de,0b105h		;51e3
	call L_5578		;51e6
	ld a,(0c21dh)		;51e9
	inc a			;51ec
	ld b,a			;51ed
	xor a			;51ee
L_51EF:
	push af			;51ef
	push bc			;51f0
	call L_5248		;51f1
	pop bc			;51f4
	pop af			;51f5
	inc a			;51f6
	djnz L_51EF		;51f7
	ld a,001h		;51f9
	ld (0c20bh),a		;51fb
	ld hl,0e800h		;51fe
	ld c,00eh		;5201
	ld de,09060h		;5203
L_5206:
	ld b,00eh		;5206
	push de			;5208
L_5209:
	ld a,(hl)			;5209
	call L_4DB4		;520a
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
	call L_5270		;521c
	call L_5229		;521f
L_5222:
	xor a			;5222
	ld (0c20bh),a		;5223
	jp L_5464		;5226
L_5229:
	ld hl,0aafah		;5229
	ld de,06098h		;522c
	ld b,003h		;522f
L_5231:
	push de			;5231
	ld a,h			;5232
	call L_4DB4		;5233
	ld a,d			;5236
	add a,008h		;5237
	ld d,a			;5239
	inc h			;523a
	ld a,l			;523b
	call L_4DB4		;523c
	inc l			;523f
	pop de			;5240
	ld a,e			;5241
	add a,008h		;5242
	ld e,a			;5244
	djnz L_5231		;5245
	ret			;5247
L_5248:
	ld hl,0b18ah		;5248
	call L_543A		;524b
L_524E:
	ld a,(hl)			;524e
	or a			;524f
	ret z			;5250
	ld e,a			;5251
	inc hl			;5252
	ld d,(hl)			;5253
	inc hl			;5254
	ld b,(hl)			;5255
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
	call L_4088		;5267
	pop bc			;526a
	dec c			;526b
	jr nz,L_5259		;526c
	jr L_524E		;526e
L_5270:
	ld hl,0c094h		;5270
	ld de,08078h		;5273
	ld bc,01010h		;5276
	ld a,005h		;5279
	call L_4BDE		;527b
	ld a,014h		;527e
	ld de,0c094h		;5280
	jp L_4DE0		;5283
L_5286:
	ld a,(0c21dh)		;5286
	add a,a			;5289
	add a,a			;528a
	call L_4083		;528b
	ld e,(hl)			;528e
	inc hl			;528f
	ld d,(hl)			;5290
	inc hl			;5291
	ld a,(hl)			;5292
	inc hl			;5293
	ld h,(hl)			;5294
	ld l,a			;5295
L_5296:
	call L_529C		;5296
	jp L_5464		;5299
L_529C:
	ld b,(hl)			;529c
	inc hl			;529d
L_529E:
	push bc			;529e
	push de			;529f
	ld a,(hl)			;52a0
	ld c,a			;52a1
	ex de,hl			;52a2
	and 0f0h		;52a3
	rrca			;52a5
	rrca			;52a6
	rrca			;52a7
	rrca			;52a8
	call L_543A		;52a9
	push de			;52ac
	push bc			;52ad
	ld a,c			;52ae
	and 006h		;52af
	add a,a			;52b1
	jr nz,L_52B6		;52b2
	ld a,002h		;52b4
L_52B6:
	ld c,a			;52b6
	ld b,000h		;52b7
	ld de,0df00h		;52b9
	ldir		;52bc
	pop bc			;52be
	pop hl			;52bf
	inc hl			;52c0
	ld e,(hl)			;52c1
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
	call L_52D6		;52cc
	pop hl			;52cf
	pop de			;52d0
	inc hl			;52d1
	pop bc			;52d2
	djnz L_529E		;52d3
	ret			;52d5
L_52D6:
	ld a,c			;52d6
	and 00fh		;52d7
	jp z,L_4E49		;52d9
	dec a			;52dc
	jp z,L_4E5F		;52dd
	dec a			;52e0
	jp z,L_4EA2		;52e1
	dec a			;52e4
	jp z,L_4EB8		;52e5
	dec a			;52e8
	jp z,L_4F03		;52e9
	jp L_4F19		;52ec
L_52EF:
	ld a,001h		;52ef
	ld (0c20bh),a		;52f1
	ld de,03088h		;52f4
	ld bc,00693h		;52f7
L_52FA:
	push de			;52fa
	ld a,c			;52fb
	call L_4D86		;52fc
	ld a,d			;52ff
	add a,008h		;5300
	ld d,a			;5302
	ld a,c			;5303
	call L_4D86		;5304
	pop de			;5307
	ld a,e			;5308
	add a,008h		;5309
	ld e,a			;530b
	djnz L_52FA		;530c
	xor a			;530e
	ld (0c20bh),a		;530f
	call L_5488		;5312
	ld hl,0df00h		;5315
	ld (hl),00ah		;5318
	inc l			;531a
	ld (hl),00ch		;531b
	inc l			;531d
	ld (hl),00eh		;531e
	inc l			;5320
	ld (hl),00fh		;5321
	ld hl,0b272h		;5323
	call L_5346		;5326
	call L_543A		;5329
	push hl			;532c
	ld de,0c818h		;532d
	ld b,002h		;5330
	call L_4EA2		;5332
	pop hl			;5335
	ld a,020h		;5336
	call L_4083		;5338
	ld de,0cc18h		;533b
	ld b,002h		;533e
	call L_4EA2		;5340
	jp L_5464		;5343
L_5346:
	ld a,(0c21dh)		;5346
	ld b,a			;5349
	add a,a			;534a
	add a,a			;534b
	add a,b			;534c
	inc a			;534d
	ld b,a			;534e
	ld a,(0c211h)		;534f
	sub b			;5352
	ret			;5353
L_5354:
	call L_5483		;5354
	ld hl,06014h		;5357
	ld de,01402h		;535a
	ld bc,0050ah		;535d
	call L_4CCC		;5360
	ld hl,0603ch		;5363
	ld de,0140ah		;5366
	ld bc,0050ah		;5369
	call L_4CCC		;536c
	jp L_5464		;536f
L_5372:
	call L_5488		;5372
	ld hl,0ade3h		;5375
	ld de,0adcbh		;5378
	call L_529C		;537b
	ld a,001h		;537e
	ld (0c20bh),a		;5380
	ld hl,0af48h		;5383
	call L_4D4A		;5386
	jp L_5222		;5389
L_538C:
	ld a,(de)			;538c
	cp 009h		;538d
	ret z			;538f
	cp 00ah		;5390
	ret z			;5392
	cp 008h		;5393
	ret z			;5395
L_5396:
	ld hl,0addah		;5396
	call L_543A		;5399
	ex de,hl			;539c
	jp L_4926		;539d
L_53A0:
	call L_548D		;53a0
	ld hl,0ffc0h		;53a3
	ld de,0b511h		;53a6
	call L_492C		;53a9
	jp L_5464		;53ac
L_53AF:
	call L_547E		;53af
	ld hl,0af78h		;53b2
	ld de,0af6ch		;53b5
	jp L_5296		;53b8
L_53BB:
	call L_5488		;53bb
	ld hl,0af81h		;53be
	ld de,0af6bh		;53c1
	jp L_5296		;53c4
L_53C7:
	call L_53DE		;53c7
	ld a,(0c20ah)		;53ca
	and a			;53cd
	jr nz,L_53F2		;53ce
	call L_547E		;53d0
	ld a,(0c21dh)		;53d3
	ld hl,0b2dbh		;53d6
	call L_543A		;53d9
	jr L_53EC		;53dc
L_53DE:
	call L_547E		;53de
	ld hl,0b335h		;53e1
	jr L_53EC		;53e4
L_53E6:
	call L_547E		;53e6
	ld hl,0b550h		;53e9
L_53EC:
	call L_4A9D		;53ec
	jp L_5464		;53ef
L_53F2:
	call L_547E		;53f2
	ld a,(0c21dh)		;53f5
	ld hl,0b35ch		;53f8
	call L_543A		;53fb
	jr L_53EC		;53fe
L_5400:
	ld a,(0c20ah)		;5400
	and a			;5403
	ret nz			;5404
	call L_547E		;5405
	ld hl,0b35bh		;5408
	jr L_53EC		;540b
L_540D:
	call L_547E		;540d
	ld hl,0b271h		;5410
	call L_4A9D		;5413
	ld a,(0c21dh)		;5416
	ld hl,0b281h		;5419
	call L_543A		;541c
	jr L_53EC		;541f
L_5421:
	call L_548D		;5421
	ld a,c			;5424
	and a			;5425
	ld hl,0b411h		;5426
	jr nz,L_542E		;5429
	ld hl,0b491h		;542b
L_542E:
	ld de,0fe00h		;542e
	ld bc,00080h		;5431
	call L_48B0		;5434
	jp L_5464		;5437
L_543A:
	add a,a			;543a
	call L_4083		;543b
	ld a,(hl)			;543e
	inc hl			;543f
	ld h,(hl)			;5440
	ld l,a			;5441
	ret			;5442
L_5443:
	ld hl,0de00h		;5443
	ld b,020h		;5446
L_5448:
	ld (hl),0e0h		;5448
	inc l			;544a
	inc l			;544b
	inc l			;544c
	inc l			;544d
	djnz L_5448		;544e
	ret			;5450
L_5451:
	call L_56E3		;5451
	jr L_547E		;5454
L_5456:
	call L_5464		;5456
	call 07ff2h		;5459
	jr L_547E		;545c
L_545E:
	call L_547E		;545e
	call 0bc36h		;5461
L_5464:
	di			;5464
	push hl			;5465
	ld hl,0f0f1h		;5466
	ld a,001h		;5469
	ld (06000h),a		;546b
	ld (hl),a			;546e
	inc a			;546f
	ld (08000h),a		;5470
	inc hl			;5473
	ld (hl),a			;5474
	inc a			;5475
	ld (0a000h),a		;5476
	inc hl			;5479
	ld (hl),a			;547a
	pop hl			;547b
	ei			;547c
	ret			;547d
L_547E:
	di			;547e
	ld a,004h		;547f
	jr L_5490		;5481
L_5483:
	di			;5483
	ld a,007h		;5484
	jr L_5490		;5486
L_5488:
	di			;5488
	ld a,00ah		;5489
	jr L_5490		;548b
L_548D:
	di			;548d
	ld a,00dh		;548e
L_5490:
	ld hl,0f0f1h		;5490
	ld (06000h),a		;5493
	ld (hl),a			;5496
	inc l			;5497
	inc a			;5498
	ld (08000h),a		;5499
	ld (hl),a			;549c
	inc l			;549d
	inc a			;549e
	ld (0a000h),a		;549f
	ld (hl),a			;54a2
	ei			;54a3
	ret			;54a4
L_54A5:
	di			;54a5
	ld a,00fh		;54a6
	jr L_54B9		;54a8
L_54AA:
	di			;54aa
	ld a,00ch		;54ab
	jr L_54B9		;54ad
L_54AF:
	di			;54af
	ld a,009h		;54b0
	jr L_54B9		;54b2
L_54B4:
	di			;54b4
	ld a,006h		;54b5
	jr L_54B9		;54b7
L_54B9:
	ld (0a000h),a		;54b9
	ld (0f0f3h),a		;54bc
	ei			;54bf
	ret			;54c0
L_54C1:
	ld a,001h		;54c1
	ld (0de80h),a		;54c3
	jr L_54D2		;54c6
L_54C8:
	ld a,(0c20ah)		;54c8
	and a			;54cb
	jr nz,L_5512		;54cc
	xor a			;54ce
	ld (0de80h),a		;54cf
L_54D2:
	call L_548D		;54d2
	ld a,(0c002h)		;54d5
	and 040h		;54d8
	jr nz,L_54E1		;54da
	ld a,(0c204h)		;54dc
	and a			;54df
	ret nz			;54e0
L_54E1:
	ld a,001h		;54e1
	ld (0c121h),a		;54e3
	ld b,006h		;54e6
	call L_47ED		;54e8
	ld b,a			;54eb
	ld hl,0be7ah		;54ec
	ld a,(0c21dh)		;54ef
	add a,a			;54f2
	add a,a			;54f3
	add a,b			;54f4
	call L_4083		;54f5
	ld a,(hl)			;54f8
	ld (0c122h),a		;54f9
	ld a,(0de80h)		;54fc
	and a			;54ff
	ld hl,0be70h		;5500
	jr z,L_5508		;5503
	ld hl,0be75h		;5505
L_5508:
	ld a,(0c21dh)		;5508
	call L_4083		;550b
	ld a,(hl)			;550e
L_550F:
	jp L_56E3		;550f
L_5512:
	ld a,086h		;5512
	jr L_550F		;5514
L_5516:
	call L_5488		;5516
	ld a,(0c20ah)		;5519
	and a			;551c
	jr nz,L_552B		;551d
	ld a,(0c211h)		;551f
	ld hl,05ffeh		;5522
	call L_543A		;5525
	ex de,hl			;5528
	jr L_552E		;5529
L_552B:
	ld de,0ab39h		;552b
L_552E:
	ld hl,0ec00h		;552e
	jr L_554E		;5531
L_5533:
	call L_5488		;5533
	ld a,(0c20ah)		;5536
	and a			;5539
	jr nz,L_5548		;553a
	ld a,(0c21dh)		;553c
	ld hl,06032h		;553f
	call L_543A		;5542
	ex de,hl			;5545
	jr L_554B		;5546
L_5548:
	ld de,0ab66h		;5548
L_554B:
	ld hl,0e400h		;554b
L_554E:
	call L_5578		;554e
	jp L_5464		;5551
L_5554:
	call L_5488		;5554
	ld a,(0c21dh)		;5557
	ld hl,0603ch		;555a
	call L_543A		;555d
	ex de,hl			;5560
	ld hl,0ec00h		;5561
	jr L_554E		;5564
L_5566:
	call L_5488		;5566
	ld a,(0c21dh)		;5569
	ld hl,088cbh		;556c
	call L_543A		;556f
	ex de,hl			;5572
	ld hl,0e400h		;5573
	jr L_554E		;5576
L_5578:
	ld a,(de)			;5578
	and a			;5579
	ret z			;557a
	inc de			;557b
	ld b,a			;557c
	and 07fh		;557d
	cp b			;557f
	jr z,L_558E		;5580
	and a			;5582
	jr z,L_5578		;5583
	ex de,hl			;5585
	ld b,000h		;5586
	ld c,a			;5588
	ldir		;5589
	ex de,hl			;558b
	jr L_5578		;558c
L_558E:
	ld a,(de)			;558e
	inc de			;558f
L_5590:
	ld (hl),a			;5590
	inc hl			;5591
	djnz L_5590		;5592
	jr L_5578		;5594
L_5596:
	push hl			;5596
	call L_547E		;5597
	pop hl			;559a
	ld bc,0000bh		;559b
	push ix		;559e
	pop de			;55a0
	ld a,e			;55a1
	add a,007h		;55a2
	ld e,a			;55a4
	ldir		;55a5
	jp L_5464		;55a7
L_55AA:
	di			;55aa
	ld a,(00007h)		;55ab
	ld c,a			;55ae
	inc c			;55af
	ld a,d			;55b0
	out (c),a		;55b1
	ld a,092h		;55b3
	out (c),a		;55b5
	ei			;55b7
	ret			;55b8
L_55B9:
	ld hl,0c259h		;55b9
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
	ld (0c259h),bc		;55c9
	ret			;55cd
L_55CE:
	xor a			;55ce
	jr L_55D3		;55cf
L_55D1:
	ld a,001h		;55d1
L_55D3:
	ld b,(hl)			;55d3
	inc b			;55d4
	ret z			;55d5
	ld d,(hl)			;55d6
	inc hl			;55d7
	ld e,(hl)			;55d8
	inc hl			;55d9
	ld b,(hl)			;55da
	inc hl			;55db
	ld c,00dh		;55dc
	push hl			;55de
	ex de,hl			;55df
	push af			;55e0
	and a			;55e1
	jr nz,L_55E9		;55e2
	call L_4B0C		;55e4
	jr L_55EC		;55e7
L_55E9:
	call L_4AD4		;55e9
L_55EC:
	pop af			;55ec
	pop hl			;55ed
	jr L_55D3		;55ee
L_55F0:
	push af			;55f0
	call L_5483		;55f1
	pop af			;55f4
	push af			;55f5
	dec a			;55f6
	ld hl,09410h		;55f7
	call L_4083		;55fa
	ld a,(hl)			;55fd
	or a			;55fe
	call nz,L_5609		;55ff
	pop af			;5602
	call L_5609		;5603
	jp L_5464		;5606
L_5609:
	dec a			;5609
	add a,a			;560a
	add a,a			;560b
	ld hl,09338h		;560c
	call L_4083		;560f
L_5612:
	ld a,(hl)			;5612
	inc hl			;5613
	push hl			;5614
	call L_5633		;5615
	pop hl			;5618
	push hl			;5619
	ld a,(hl)			;561a
	inc hl			;561b
	ld h,(hl)			;561c
	ld l,a			;561d
	ex de,hl			;561e
	push de			;561f
	call L_4955		;5620
	pop de			;5623
	pop hl			;5624
	inc hl			;5625
	inc hl			;5626
	ld a,(hl)			;5627
	or a			;5628
	ret z			;5629
	push de			;562a
	call L_5633		;562b
	ex de,hl			;562e
	pop de			;562f
	jp L_492C		;5630
L_5633:
	ld l,a			;5633
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
	jp L_4BDE		;5649
L_564C:
	ld hl,0c00ch		;564c
	ld a,(hl)			;564f
	add a,068h		;5650
	and 078h		;5652
	ld (hl),a			;5654
	ld a,(00007h)		;5655
	ld c,a			;5658
	call L_5676		;5659
	ld hl,07600h		;565c
	call L_48EA		;565f
	ld a,(0c00ch)		;5662
	ld d,010h		;5665
	ld h,0deh		;5667
L_5669:
	ld b,008h		;5669
	ld l,a			;566b
	otir		;566c
	add a,048h		;566e
	and 078h		;5670
	dec d			;5672
	jr nz,L_5669		;5673
	ret			;5675
L_5676:
	ld hl,07400h		;5676
	call L_48EA		;5679
	ld a,(0c00ch)		;567c
	ld d,010h		;567f
	add a,a			;5681
L_5682:
	ld h,06eh		;5682
	ld l,a			;5684
	add hl,hl			;5685
	ld b,020h		;5686
	otir		;5688
	add a,090h		;568a
	dec d			;568c
	jr nz,L_5682		;568d
	ret			;568f
L_5690:
	ld hl,0dc00h		;5690
	ld de,0f400h		;5693
	ld bc,00280h		;5696
	jp L_48B0		;5699
L_569C:
	ld a,0bch		;569c
	ld (0c10fh),a		;569e
	xor a			;56a1
	ld (0c121h),a		;56a2
	ld (0c122h),a		;56a5
	ld (0c11bh),a		;56a8
	ld (0c11ch),a		;56ab
	ld (0c129h),a		;56ae
	ld (0c12ah),a		;56b1
	ld (0c11dh),a		;56b4
	ld (0c124h),a		;56b7
L_56BA:
	xor a			;56ba
	ld (0c10eh),a		;56bb
	ld (0c11fh),a		;56be
	ld (0c110h),a		;56c1
	ld (0c11eh),a		;56c4
	ld (0c129h),a		;56c7
	ld (0c121h),a		;56ca
	ld (0c122h),a		;56cd
	ld (0c12ah),a		;56d0
	ld hl,06074h		;56d3
	ld (0c010h),hl		;56d6
	ld (0c012h),hl		;56d9
	ld (0c014h),hl		;56dc
	ld (0c016h),hl		;56df
	ret			;56e2
L_56E3:
	push hl			;56e3
	push de			;56e4
	push bc			;56e5
	push af			;56e6
	di			;56e7
	ld a,00dh		;56e8
	ld (06000h),a		;56ea
	ld (0f0f1h),a		;56ed
	ei			;56f0
	di			;56f1
	ld a,00eh		;56f2
	ld (08000h),a		;56f4
	ld (0f0f2h),a		;56f7
	ei			;56fa
	di			;56fb
	ld a,00fh		;56fc
	ld (0a000h),a		;56fe
	ld (0f0f3h),a		;5701
	ei			;5704
	pop af			;5705
	di			;5706
	or a			;5707
	jp z,L_58B4		;5708
	cp 0fdh		;570b
	jp nc,L_58BA		;570d
	or a			;5710
	jp p,L_583B		;5711
	ld c,a			;5714
	cp 089h		;5715
	jr nz,L_5721		;5717
	ld a,(0c11fh)		;5719
	cp 08ah		;571c
	jp z,L_57B5		;571e
L_5721:
	ld a,c			;5721
	ld (0c11fh),a		;5722
	cp 089h		;5725
	jr nz,L_572D		;5727
	ld a,001h		;5729
	jr L_572E		;572b
L_572D:
	xor a			;572d
L_572E:
	ld (0c12ah),a		;572e
	ld a,(0c11fh)		;5731
	cp 08ch		;5734
	jr c,L_573C		;5736
	ld a,001h		;5738
	jr L_573D		;573a
L_573C:
	xor a			;573c
L_573D:
	ld (0c129h),a		;573d
	ld a,(0c121h)		;5740
	or a			;5743
	jr z,L_574D		;5744
	ld a,(0c11fh)		;5746
	cp 086h		;5749
	jr c,L_5751		;574b
L_574D:
	xor a			;574d
	ld (0c122h),a		;574e
L_5751:
	ld a,(0c11fh)		;5751
	ld de,0c01ch		;5754
	ld hl,057bch		;5757
	ld bc,00028h		;575a
	ldir		;575d
	ld hl,057bch		;575f
	ld bc,00028h		;5762
	ldir		;5765
	ld hl,057bch		;5767
	ld bc,00028h		;576a
	ldir		;576d
	and 07fh		;576f
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
	ld (0c01ch),de		;5781
	ld e,(hl)			;5785
	inc hl			;5786
	ld d,(hl)			;5787
	inc hl			;5788
	ld (0c044h),de		;5789
	ld e,(hl)			;578d
	inc hl			;578e
	ld d,(hl)			;578f
	ld (0c06ch),de		;5790
	ld hl,06134h		;5794
	ld (0c010h),hl		;5797
	ld hl,0613bh		;579a
	ld (0c012h),hl		;579d
	ld hl,06142h		;57a0
	ld (0c014h),hl		;57a3
L_57A6:
	xor a			;57a6
	ld (0c11bh),a		;57a7
	ld (0c11ch),a		;57aa
	ld (0c11eh),a		;57ad
	ld a,007h		;57b0
	ld (0c11dh),a		;57b2
L_57B5:
	call L_5464		;57b5
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


L_57E6:
	ld a,c			;57e6
	ld de,0c01ch		;57e7
	ld hl,057bch		;57ea
	ld bc,00028h		;57ed
	ldir		;57f0
	ld hl,057bch		;57f2
	ld bc,00028h		;57f5
	ldir		;57f8
	ld hl,057bch		;57fa
	ld bc,00028h		;57fd
	ldir		;5800
	and 03fh		;5802
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
	ld (0c028h),de		;5813
	ld e,(hl)			;5817
	inc hl			;5818
	ld d,(hl)			;5819
	inc hl			;581a
	ld (0c050h),de		;581b
	ld e,(hl)			;581f
	inc hl			;5820
	ld d,(hl)			;5821
	ld (0c078h),de		;5822
	ld hl,064d7h		;5826
	ld (0c010h),hl		;5829
	ld hl,064ddh		;582c
	ld (0c012h),hl		;582f
	ld hl,064e3h		;5832
	ld (0c014h),hl		;5835
	jp L_57A6		;5838
L_583B:
	ld c,a			;583b
	cp 070h		;583c
	jp nc,L_5885		;583e
	bit 6,a		;5841
	jr nz,L_57E6		;5843
	ld a,(0c129h)		;5845
	or a			;5848
	jp nz,L_57B5		;5849
	ld a,(0c11eh)		;584c
	or a			;584f
	jp nz,L_57B5		;5850
	ld a,(0c10eh)		;5853
	cp c			;5856
	jp z,L_585D		;5857
	jp nc,L_57B5		;585a
L_585D:
	ld a,c			;585d
	ld (0c10eh),a		;585e
	ld de,0c094h		;5861
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
	ld (0c016h),hl		;587f
	jp L_57B5		;5882
L_5885:
	ld a,c			;5885
	ld de,0c0bch		;5886
	ld hl,057bch		;5889
	ld bc,00028h		;588c
	ldir		;588f
	and 00fh		;5891
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
	ld (0c127h),hl		;58a6
	ld a,(0c110h)		;58a9
	or 002h		;58ac
	ld (0c110h),a		;58ae
	jp L_57B5		;58b1
L_58B4:
	call L_56BA		;58b4
	jp L_57B5		;58b7
L_58BA:
	jp z,L_58D4		;58ba
	cp 0feh		;58bd
	jp z,L_5973		;58bf
	ld a,(0c12ah)		;58c2
	or a			;58c5
	jr nz,L_58CC		;58c6
	ld a,03ah		;58c8
	jr L_58CE		;58ca
L_58CC:
	ld a,010h		;58cc
L_58CE:
	ld (0c11bh),a		;58ce
	jp L_57B5		;58d1
L_58D4:
	ld a,(0c110h)		;58d4
	or 001h		;58d7
	ld (0c110h),a		;58d9
	ld a,(0c122h)		;58dc
	ld (0c123h),a		;58df
	xor a			;58e2
	ld (0c122h),a		;58e3
	ld a,(0c11bh)		;58e6
	ld (0c111h),a		;58e9
	ld a,(0c11ch)		;58ec
	ld (0c112h),a		;58ef
	ld a,(0c10fh)		;58f2
	ld (0c113h),a		;58f5
	ld a,0bfh		;58f8
	ld (0c10fh),a		;58fa
	ld a,(0c11dh)		;58fd
	ld (0c120h),a		;5900
	xor a			;5903
	ld (0c11dh),a		;5904
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
	ld de,0c0bch		;5945
	ld hl,057bch		;5948
	ld bc,00028h		;594b
	ldir		;594e
	ld hl,057bch		;5950
	ld bc,00028h		;5953
	ldir		;5956
	ld hl,06fa6h		;5958
	ld (0c0bch),hl		;595b
	ld hl,06fb3h		;595e
	ld (0c0e4h),hl		;5961
	ld hl,06126h		;5964
	ld (0c018h),hl		;5967
	ld hl,0612dh		;596a
	ld (0c01ah),hl		;596d
	jp L_57B5		;5970
L_5973:
	xor a			;5973
	ld (0c110h),a		;5974
	ld a,(0c121h)		;5977
	or a			;597a
	jr z,L_5983		;597b
	ld a,(0c123h)		;597d
	ld (0c122h),a		;5980
L_5983:
	ld a,(0c111h)		;5983
	ld (0c11bh),a		;5986
	ld a,(0c112h)		;5989
	ld (0c11ch),a		;598c
	ld a,(0c113h)		;598f
	ld (0c10fh),a		;5992
	ld a,(0c120h)		;5995
	ld (0c11dh),a		;5998
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
	jp L_57B5		;59d9
L_59DC:
	ld a,(0c11bh)		;59dc
	or a			;59df
	jr nz,L_59EA		;59e0
	ld a,(0c11dh)		;59e2
	or a			;59e5
	ld a,(0c11fh)		;59e6
	ret			;59e9
L_59EA:
	ld a,(0c11ch)		;59ea
	cp 0f9h		;59ed
	ld a,(0c11fh)		;59ef
	ret			;59f2
L_59F3:
	ld de,0ec00h		;59f3
	ld a,(0c212h)		;59f6
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
	call L_548D		;5a07
	pop hl			;5a0a
	call 0bebfh		;5a0b
	jp L_5464		;5a0e
L_5A11:
	call L_54A5		;5a11
	call 0bebfh		;5a14
	jp L_54B4		;5a17
L_5A1A:
	ld hl,0d200h		;5a1a
	ld de,00014h		;5a1d
	ld b,018h		;5a20
L_5A22:
	push bc			;5a22
	ld b,020h		;5a23
L_5A25:
	ld a,(hl)			;5a25
	call L_4DB4		;5a26
	inc hl			;5a29
	ld a,d			;5a2a
	add a,008h		;5a2b
	ld d,a			;5a2d
	djnz L_5A25		;5a2e
	pop bc			;5a30
	ld a,e			;5a31
	add a,008h		;5a32
	ld e,a			;5a34
	djnz L_5A22		;5a35
	ret			;5a37
L_5A38:
	call L_5483		;5a38
	ld a,(0c240h)		;5a3b
	ld hl,0bb32h		;5a3e
	call L_543A		;5a41
	ld de,0bb15h		;5a44
	call L_529C		;5a47
	call L_5AD5		;5a4a
	call L_5464		;5a4d
	call L_5A97		;5a50
	call L_5B12		;5a53
L_5A56:
	ld a,(0c24bh)		;5a56
	cp 004h		;5a59
	jr z,L_5A69		;5a5b
	ld a,(0c20ah)		;5a5d
	or a			;5a60
	jr nz,$+38		;5a61
	ld a,(0c316h)		;5a63
	or a			;5a66
	jr nz,$+32		;5a67
L_5A69:
	ld a,(0c240h)		;5a69
	ld hl,05a79h		;5a6c
	or a			;5a6f
	jp z,L_4A9D		;5a70
	ld hl,05a80h		;5a73
	jp L_4A9D		;5a76

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
	jp L_4A9D		;5a8a

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


L_5A97:
	call 06234h		;5a97
	ld a,(0c240h)		;5a9a
	or a			;5a9d
	ret nz			;5a9e
	call L_548D		;5a9f
	call L_5AA8		;5aa2
	jp L_5464		;5aa5
L_5AA8:
	ld a,003h		;5aa8
	sub (ix+006h)		;5aaa
	add a,a			;5aad
	add a,a			;5aae
	ld hl,0a31bh		;5aaf
	call L_4083		;5ab2
	jp L_5612		;5ab5
L_5AB8:
	ld hl,0a426h		;5ab8
	jr L_5AC0		;5abb
L_5ABD:
	ld hl,0a3c1h		;5abd
L_5AC0:
	push hl			;5ac0
	call 08c16h		;5ac1
	push af			;5ac4
	call L_548D		;5ac5
	pop af			;5ac8
	pop hl			;5ac9
	add a,a			;5aca
	add a,a			;5acb
	call L_4083		;5acc
	call L_5612		;5acf
	jp L_5464		;5ad2
L_5AD5:
	ld a,001h		;5ad5
	ld (0c20bh),a		;5ad7
	ld a,(0c240h)		;5ada
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
	call L_4DB4		;5af0
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
	ld (0c20bh),a		;5b02
	ret			;5b05
L_5B06:
	ld a,(ix+006h)		;5b06
	add a,a			;5b09
	ld b,a			;5b0a
	add a,a			;5b0b
	add a,a			;5b0c
	add a,a			;5b0d
	sub b			;5b0e
	jp L_4083		;5b0f
L_5B12:
	call 06234h		;5b12
	ld a,(0c240h)		;5b15
	cp 001h		;5b18
	call z,L_5BAC		;5b1a
	call L_548D		;5b1d
	exx			;5b20
	ld a,(0c240h)		;5b21
	ld hl,097aeh		;5b24
	or a			;5b27
	jr z,L_5B2D		;5b28
	ld hl,09bceh		;5b2a
L_5B2D:
	call L_5B06		;5b2d
	ld (0c26dh),hl		;5b30
	ex de,hl			;5b33
	ld hl,0e800h		;5b34
	exx			;5b37
	ld b,007h		;5b38
L_5B3A:
	exx			;5b3a
	ex de,hl			;5b3b
	ld hl,(0c26dh)		;5b3c
	ld a,(hl)			;5b3f
	inc hl			;5b40
	ld b,(hl)			;5b41
	inc hl			;5b42
	ld (0c26dh),hl		;5b43
	ld l,a			;5b46
	ld h,b			;5b47
	ex de,hl			;5b48
	exx			;5b49
	push bc			;5b4a
	call L_5BC6		;5b4b
	call L_5CB4		;5b4e
	call L_5CA0		;5b51
	call L_5CB4		;5b54
	call L_5CA0		;5b57
	pop bc			;5b5a
	djnz L_5B3A		;5b5b
	jp L_5464		;5b5d
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
	ld ix,0c2b0h		;5b70
	call L_548D		;5b74
	exx			;5b77
	ld de,(0c273h)		;5b78
	ld hl,097aeh		;5b7c
	call L_5B98		;5b7f
	pop af			;5b82
	ex af,af'			;5b83
	ld ix,0c2d0h		;5b84
	call L_548D		;5b88
	exx			;5b8b
	ld de,(0c273h)		;5b8c
	ld hl,00100h		;5b90
	add hl,de			;5b93
	ex de,hl			;5b94
	ld hl,09bceh		;5b95
L_5B98:
	push de			;5b98
	call L_5B06		;5b99
	ex af,af'			;5b9c
	add a,a			;5b9d
	call L_4083		;5b9e
	ld (0c26dh),hl		;5ba1
	ex de,hl			;5ba4
	pop hl			;5ba5
	exx			;5ba6
	ld b,001h		;5ba7
	jp L_5B3A		;5ba9
L_5BAC:
	call L_548D		;5bac
	exx			;5baf
	ld a,(ix+006h)		;5bb0
	ld hl,09f4ah		;5bb3
	call L_543A		;5bb6
	ld a,(hl)			;5bb9
	inc hl			;5bba
	ld (0c26dh),hl		;5bbb
	ld hl,06c00h		;5bbe
	exx			;5bc1
	ld b,a			;5bc2
	jp L_5B3A		;5bc3
L_5BC6:
	ld bc,0007fh		;5bc6
	ld hl,0d600h		;5bc9
	ld de,0d601h		;5bcc
	xor a			;5bcf
	ld (hl),a			;5bd0
	ldir		;5bd1
L_5BD3:
	exx			;5bd3
	push de			;5bd4
	exx			;5bd5
	pop hl			;5bd6
	ld a,(hl)			;5bd7
	inc hl			;5bd8
	cp 0ffh		;5bd9
	jr z,L_5C26		;5bdb
	ld b,a			;5bdd
	and 080h		;5bde
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
	call L_5C2A		;5bef
	ld a,(hl)			;5bf2
	inc hl			;5bf3
	ld h,(hl)			;5bf4
	ld l,a			;5bf5
	ld a,(hl)			;5bf6
	ld (0c269h),a		;5bf7
	inc hl			;5bfa
	call L_5C1A		;5bfb
	pop bc			;5bfe
	ld a,b			;5bff
	add a,020h		;5c00
	call L_5C2A		;5c02
	ld a,(0c269h)		;5c05
	call L_4083		;5c08
	ld a,(0c269h)		;5c0b
	call L_5C1A		;5c0e
	exx			;5c11
	ld a,004h		;5c12
	call L_4088		;5c14
	exx			;5c17
	jr L_5BD3		;5c18
L_5C1A:
	ld b,a			;5c1a
L_5C1B:
	push bc			;5c1b
	push hl			;5c1c
	call L_5C45		;5c1d
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
L_5C2A:
	cp 010h		;5c2a
	ld de,0d600h		;5c2c
	jr c,L_5C42		;5c2f
	cp 020h		;5c31
	ld de,0d630h		;5c33
	jr c,L_5C42		;5c36
	cp 030h		;5c38
	ld de,0d600h		;5c3a
	jr c,L_5C42		;5c3d
	ld de,0d630h		;5c3f
L_5C42:
	jp L_4088		;5c42
L_5C45:
	ld a,(hl)			;5c45
	push af			;5c46
	ld a,(0c269h)		;5c47
	call L_4083		;5c4a
	pop af			;5c4d
	ld l,(hl)			;5c4e
	ld h,a			;5c4f
	ld b,c			;5c50
	ld a,b			;5c51
	or a			;5c52
	call nz,L_5C69		;5c53
	ld a,h			;5c56
	call L_5C80		;5c57
	inc de			;5c5a
	push de			;5c5b
	ld a,00fh		;5c5c
	call L_4088		;5c5e
	ld a,l			;5c61
	call L_5C80		;5c62
	pop de			;5c65
	jp L_5C8C		;5c66
L_5C69:
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
L_5C80:
	ld b,a			;5c80
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
	ld de,0d600h		;5c8f
	or a			;5c92
	sbc hl,de		;5c93
	ld a,l			;5c95
	and 010h		;5c96
	pop de			;5c98
	pop hl			;5c99
	ret z			;5c9a
	ld a,030h		;5c9b
	jp L_4088		;5c9d
L_5CA0:
	exx			;5ca0
	push hl			;5ca1
	exx			;5ca2
	pop de			;5ca3
	ld bc,00080h		;5ca4
	ld hl,0d600h		;5ca7
	call L_48B0		;5caa
	exx			;5cad
	ld bc,00080h		;5cae
	add hl,bc			;5cb1
	exx			;5cb2
	ret			;5cb3
L_5CB4:
	ld b,004h		;5cb4
	ld hl,0d600h		;5cb6
	ld de,0d610h		;5cb9
L_5CBC:
	push bc			;5cbc
	ld b,010h		;5cbd
L_5CBF:
	ld a,(de)			;5cbf
	call L_49B2		;5cc0
	ld c,a			;5cc3
	ld a,(hl)			;5cc4
	call L_49B2		;5cc5
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
L_5CDC:
	call L_5D75		;5cdc
	call L_4A2C		;5cdf
	call L_547E		;5ce2
	call 0a465h		;5ce5
	call 09eech		;5ce8
	call L_5464		;5ceb
	ld a,(0c240h)		;5cee
	ld (0c229h),a		;5cf1
	xor a			;5cf4
	ld (0c228h),a		;5cf5
	jp L_4A12		;5cf8
L_5CFB:
	call L_4A2C		;5cfb
	call L_51C5		;5cfe
	call L_517C		;5d01
	call L_53C7		;5d04
	call L_5A56		;5d07
	call L_5533		;5d0a
	call L_5516		;5d0d
	ld a,(0c316h)		;5d10
	and a			;5d13
	call z,L_59F3		;5d14
	call L_5A1A		;5d17
	call L_4682		;5d1a
	call 0a7c6h		;5d1d
	call L_5D3F		;5d20
	call L_5E00		;5d23
	call 07fe0h		;5d26
	call 0883dh		;5d29
	call 090c8h		;5d2c
	call 07db1h		;5d2f
	call 07cedh		;5d32
	ld a,(0c20ah)		;5d35
	and a			;5d38
	call nz,08c70h		;5d39
	jp L_4A12		;5d3c
L_5D3F:
	ld ix,0cd00h		;5d3f
	ld b,009h		;5d43
	ld d,000h		;5d45
L_5D47:
	push bc			;5d47
	ld a,(ix+000h)		;5d48
	cp 00ah		;5d4b
	call z,L_5DC6		;5d4d
	push de			;5d50
	ld a,(ix+000h)		;5d51
	cp 009h		;5d54
	call z,07832h		;5d56
	ld a,(ix+000h)		;5d59
	cp 008h		;5d5c
	call z,L_5D6B		;5d5e
	pop de			;5d61
	ld bc,00080h		;5d62
	add ix,bc		;5d65
	pop bc			;5d67
	djnz L_5D47		;5d68
	ret			;5d6a
L_5D6B:
	ld a,(ix+001h)		;5d6b
	and a			;5d6e
	jp z,077f9h		;5d6f
	jp 0be4ch		;5d72
L_5D75:
	ld ix,0cd00h		;5d75
	ld bc,00900h		;5d79
L_5D7C:
	ld a,(ix+000h)		;5d7c
	cp 00ah		;5d7f
	jr nz,L_5DB2		;5d81
	ld a,c			;5d83
	exx			;5d84
	ld h,(ix+005h)		;5d85
	ld l,(ix+003h)		;5d88
	ld d,090h		;5d8b
	add a,a			;5d8d
	add a,a			;5d8e
	add a,a			;5d8f
	add a,a			;5d90
	add a,068h		;5d91
	ld e,a			;5d93
	ld bc,02010h		;5d94
	ld a,004h		;5d97
	call L_4BDE		;5d99
	call L_5DBA		;5d9c
	ex de,hl			;5d9f
	exx			;5da0
	ld a,c			;5da1
	exx			;5da2
	add a,a			;5da3
	add a,a			;5da4
	ld de,0ca80h		;5da5
	call L_4088		;5da8
	ld bc,00004h		;5dab
	ldir		;5dae
	exx			;5db0
	inc c			;5db1
L_5DB2:
	ld de,00080h		;5db2
	add ix,de		;5db5
	djnz L_5D7C		;5db7
	ret			;5db9
L_5DBA:
	ld c,(ix+003h)		;5dba
	ld b,(ix+005h)		;5dbd
	ld de,00000h		;5dc0
	jp 07c42h		;5dc3
L_5DC6:
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
	call L_4841		;5dda
	call L_5DBA		;5ddd
	exx			;5de0
	ld a,d			;5de1
	exx			;5de2
	add a,a			;5de3
	add a,a			;5de4
	ld hl,0ca80h		;5de5
	call L_4083		;5de8
	ld bc,00004h		;5deb
	push hl			;5dee
	push de			;5def
	push bc			;5df0
	ldir		;5df1
	pop bc			;5df3
	pop de			;5df4
	pop hl			;5df5
	ld a,020h		;5df6
	call L_4088		;5df8
	ldir		;5dfb
	exx			;5dfd
	inc d			;5dfe
	ret			;5dff
L_5E00:
	ld hl,0cb00h		;5e00
	ld b,008h		;5e03
L_5E05:
	push hl			;5e05
	push bc			;5e06
	ld a,(hl)			;5e07
	and a			;5e08
	jr z,L_5E25		;5e09
	inc l			;5e0b
	ld a,(0c212h)		;5e0c
	cp (hl)			;5e0f
	jr nz,L_5E25		;5e10
	inc l			;5e12
	ld a,(hl)			;5e13
	cp 006h		;5e14
	jr z,L_5E25		;5e16
	sub 002h		;5e18
	cp 003h		;5e1a
	push hl			;5e1c
	call c,07af4h		;5e1d
	pop hl			;5e20
	inc l			;5e21
	call 07c5dh		;5e22
L_5E25:
	pop bc			;5e25
	pop hl			;5e26
	ld a,020h		;5e27
	call L_4083		;5e29
	djnz L_5E05		;5e2c
	ret			;5e2e
L_5E2F:
	ld a,0ffh		;5e2f
	ld d,000h		;5e31
	jp L_4BA2		;5e33
L_5E36:
	call L_4A1F		;5e36
	call L_5F18		;5e39
	call L_50C1		;5e3c
	call L_51C5		;5e3f
	call L_517C		;5e42
	call L_53C7		;5e45
	call L_5372		;5e48
	call L_53BB		;5e4b
	call L_53AF		;5e4e
	call L_52EF		;5e51
	call L_5F51		;5e54
	call L_5A38		;5e57
	ld a,001h		;5e5a
	ld (0c212h),a		;5e5c
	call L_5F26		;5e5f
	call L_5ABD		;5e62
	call L_5533		;5e65
	call L_5516		;5e68
	call 079a9h		;5e6b
	call 07cbah		;5e6e
	call 07f1fh		;5e71
L_5E74:
	call L_5E7A		;5e74
	jp L_4A12		;5e77
L_5E7A:
	call 074e7h		;5e7a
	call L_54AF		;5e7d
	call 0b8e9h		;5e80
	call L_5464		;5e83
	call L_4A2C		;5e86
	call L_4A1F		;5e89
	call 07fc7h		;5e8c
	call L_5EE8		;5e8f
	call L_5F10		;5e92
	call 0b336h		;5e95
	call L_59F3		;5e98
	call L_5A1A		;5e9b
	call L_4682		;5e9e
	call 07cedh		;5ea1
	call 07db1h		;5ea4
	call L_53A0		;5ea7
	call 079e2h		;5eaa
	call 07f7bh		;5ead
	call 0772eh		;5eb0
	call L_5400		;5eb3
	call 08236h		;5eb6
	call L_5EF0		;5eb9
	call 087a1h		;5ebc
	call 090f0h		;5ebf
	call 08cd6h		;5ec2
	jp 08f16h		;5ec5
L_5EC8:
	ld hl,0c240h		;5ec8
	ld bc,00018h		;5ecb
	jr L_5F08		;5ece
L_5ED0:
	call L_54B4		;5ed0
	ld hl,0bf6ch		;5ed3
	ld de,0c2b0h		;5ed6
	ld bc,0000eh		;5ed9
	push bc			;5edc
	ldir		;5edd
	pop bc			;5edf
	ld de,0c2d0h		;5ee0
	ldir		;5ee3
	jp L_5464		;5ee5
L_5EE8:
	ld bc,0007fh		;5ee8
	ld hl,0c320h		;5eeb
	jr L_5F08		;5eee
L_5EF0:
	ld bc,003ffh		;5ef0
	ld hl,0c400h		;5ef3
	call L_5F08		;5ef6
	ld l,a			;5ef9
	ld h,a			;5efa
	ld (0cc60h),hl		;5efb
	ld (0cc62h),hl		;5efe
	ret			;5f01
L_5F02:
	ld hl,0e000h		;5f02
	ld bc,0007fh		;5f05
L_5F08:
	ld d,h			;5f08
	ld e,l			;5f09
	inc de			;5f0a
	xor a			;5f0b
	ld (hl),a			;5f0c
	ldir		;5f0d
	ret			;5f0f
L_5F10:
	ld bc,004ffh		;5f10
	ld hl,0cc80h		;5f13
	jr L_5F08		;5f16
L_5F18:
	ld hl,0c20ah		;5f18
	ld (hl),000h		;5f1b
	ld a,(0cc10h)		;5f1d
	cp 002h		;5f20
	ret nz			;5f22
	ld (hl),001h		;5f23
	ret			;5f25
L_5F26:
	call L_54AF		;5f26
	ld a,(0c211h)		;5f29
	ld hl,0bf1dh		;5f2c
	call L_4083		;5f2f
	ld a,(hl)			;5f32
	and 0f0h		;5f33
	add a,003h		;5f35
	ld (0c244h),a		;5f37
	ld a,(hl)			;5f3a
	and 00fh		;5f3b
	dec a			;5f3d
	ld a,001h		;5f3e
	ld b,018h		;5f40
	jr z,L_5F47		;5f42
	xor a			;5f44
	ld b,0e8h		;5f45
L_5F47:
	ld (0c250h),a		;5f47
	ld a,b			;5f4a
	ld (0c246h),a		;5f4b
	jp L_5464		;5f4e
L_5F51:
	ld hl,08858h		;5f51
	ld de,04088h		;5f54
	ld b,006h		;5f57
L_5F59:
	push hl			;5f59
	push de			;5f5a
	push bc			;5f5b
	ld bc,01008h		;5f5c
	ld a,005h		;5f5f
	call L_4BDE		;5f61
	pop bc			;5f64
	pop de			;5f65
	pop hl			;5f66
	ld a,e			;5f67
	add a,008h		;5f68
	ld e,a			;5f6a
	djnz L_5F59		;5f6b
	ret			;5f6d
L_5F6E:
	ld hl,001ffh		;5f6e
	ld (0c009h),hl		;5f71
	ld hl,0c203h		;5f74
	ld a,(hl)			;5f77
	ld (0c21dh),a		;5f78
	ld b,a			;5f7b
	add a,a			;5f7c
	add a,a			;5f7d
	add a,b			;5f7e
	inc a			;5f7f
	ld (0c211h),a		;5f80
	inc (hl)			;5f83
	ld a,(hl)			;5f84
	cp 005h		;5f85
	jr c,L_5F8B		;5f87
	xor a			;5f89
	ld (hl),a			;5f8a
L_5F8B:
	xor a			;5f8b
	ld (0c24bh),a		;5f8c
	ld (0c20ah),a		;5f8f
	ld (0cc10h),a		;5f92
	ld (0c226h),a		;5f95
	ld (0c003h),a		;5f98
	ld (0c00dh),a		;5f9b
	ld (0c3a0h),a		;5f9e
	ld h,a			;5fa1
	ld l,a			;5fa2
	ld (0c259h),hl		;5fa3
	inc a			;5fa6
	ld (0c214h),a		;5fa7
	call L_5EC8		;5faa
	ld a,(0c21dh)		;5fad
	and 001h		;5fb0
	ld (0c240h),a		;5fb2
	call L_5ED0		;5fb5
	call L_4563		;5fb8
	call L_5E36		;5fbb
	jp L_54C8		;5fbe
L_5FC1:
	ld a,(0c215h)		;5fc1
	and a			;5fc4
	jr nz,$+66		;5fc5
	call 06033h		;5fc7
	call 0605ah		;5fca
	call L_54B4		;5fcd
	call 0b66ah		;5fd0
	call L_5464		;5fd3
	ld a,(0c00eh)		;5fd6
	and 010h		;5fd9
	jr z,L_5FF2		;5fdb
	ld hl,0c204h		;5fdd
	ld a,(hl)			;5fe0
	and a			;5fe1
	jr z,L_5FEB		;5fe2
	ld (hl),000h		;5fe4
	call L_54C1		;5fe6
	jr L_5FF2		;5fe9
L_5FEB:
	ld (hl),001h		;5feb
	ld a,000h		;5fed
	call L_56E3		;5fef
L_5FF2:
	ld a,(0c24bh)		;5ff2
	cp 004h		;5ff5
	jr z,L_5FFE		;5ff7
	ld a,(0c226h)		;5ff9
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
