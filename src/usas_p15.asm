; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 15 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS pieza_9FDF_cola: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630 (sigue del banco 14); lo leen p00:5BC6 (8 bytes)
;   0xa000..0xa008  (8 bytes)
DATA_pieza_9FDF_cola:
	defb 007h,0ffh,0f2h,0e6h,08ch,098h,070h,000h	; a000  ......p.

; ----------------------------------------------------------------------
; DATOS pieza_A008: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (17 bytes)
;   0xa008..0xa019  (17 bytes)
DATA_pieza_A008:
	defb 004h,000h,000h,000h,030h,001h,003h,003h,007h,000h,000h,000h,030h,001h,002h,002h	; a008  ....0.......0...
	defb 004h	; a018

; ----------------------------------------------------------------------
; DATOS pieza_A019: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0xa019..0xa05a  (65 bytes)
DATA_pieza_A019:
	defb 010h,078h,05fh,07ah,071h,034h,00dh,002h,002h,002h,002h,001h,001h,000h,001h,002h	; a019  .x_zq4..........
	defb 001h,017h,0e2h,0bch,0c2h,082h,00dh,018h,010h,020h,070h,010h,078h,08ch,08ch,018h	; a029  ......... p.x...
	defb 0e0h,048h,06fh,04fh,05fh,03fh,00fh,003h,003h,003h,003h,001h,001h,000h,001h,003h	; a039  .HoO_?..........
	defb 001h,01dh,0ffh,0ffh,0ffh,0ffh,0fdh,0f8h,0f0h,0e0h,0f0h,0f0h,0e8h,0f4h,0f4h,0f8h	; a049  ................
	defb 0e0h	; a059

; ----------------------------------------------------------------------
; DATOS pieza_A05A: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (61 bytes)
;   0xa05a..0xa097  (61 bytes)
DATA_pieza_A05A:
	defb 00fh,000h,003h,01eh,03bh,060h,060h,080h,0c0h,0c0h,0c0h,0c0h,0e0h,060h,031h,00fh	; a05a  .....``......`1.
	defb 0e0h,0f8h,086h,043h,0c2h,082h,094h,089h,049h,0ddh,0ffh,0fdh,07dh,0fah,02ch,000h	; a06a  ...C....I...}.,.
	defb 003h,01fh,027h,05fh,05fh,0ffh,0bfh,0bfh,0bfh,0bfh,0dfh,05fh,03fh,00fh,0e0h,018h	; a07a  ..'__......_?...
	defb 0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,07fh,067h,0a7h,0efh,0deh,02ch	; a08a  ........g...,

; ----------------------------------------------------------------------
; DATOS pieza_A097: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0xa097..0xa0d8  (65 bytes)
DATA_pieza_A097:
	defb 010h,011h,03ch,022h,041h,042h,0c0h,0d8h,0efh,050h,070h,020h,030h,030h,01ch,00dh	; a097  ..<"AB...Pp 00..
	defb 003h,0f8h,024h,07ah,0feh,07ch,03eh,0fch,074h,006h,002h,002h,002h,004h,01ch,0f8h	; a0a7  ..$z.|>.t.......
	defb 0f0h,01fh,03fh,03fh,07fh,07fh,0bfh,0bfh,0bfh,07fh,07fh,03fh,02fh,02fh,013h,00eh	; a0b7  ..??.......?//..
	defb 003h,0f8h,0fch,0feh,0ceh,0c4h,0fah,0ech,09ch,0feh,0feh,0feh,0feh,0fch,0e4h,018h	; a0c7  ................
	defb 0f0h	; a0d7

; ----------------------------------------------------------------------
; DATOS pieza_A0D8: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (61 bytes)
;   0xa0d8..0xa115  (61 bytes)
DATA_pieza_A0D8:
	defb 00fh,034h,05fh,0beh,0bfh,0ffh,0bbh,092h,091h,029h,041h,043h,0c2h,061h,01fh,007h	; a0d8  .4_......)AC.a..
	defb 0f0h,08ch,006h,007h,003h,003h,003h,003h,001h,006h,006h,0dch,078h,0c0h,000h,034h	; a0e8  ............x..4
	defb 07bh,0f7h,0e5h,0e6h,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,07fh,018h,007h,0f0h,0fch	; a0f8  {...............
	defb 0fah,0fbh,0fdh,0fdh,0fdh,0fdh,0ffh,0fah,0fah,0e4h,0f8h,0c0h,000h	; a108  .............

; ----------------------------------------------------------------------
; DATOS pieza_A115: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0xa115..0xa156  (65 bytes)
DATA_pieza_A115:
	defb 010h,00fh,01fh,038h,020h,040h,040h,040h,060h,02eh,03fh,07ch,03eh,07fh,05eh,024h	; a115  ...8 @@@`.?|>.^$
	defb 01fh,0c0h,0b0h,038h,00ch,00ch,004h,00eh,00ah,0f7h,01bh,003h,042h,082h,044h,03ch	; a125  ...8........B.D<
	defb 088h,00fh,018h,027h,03fh,07fh,07fh,07fh,07fh,039h,037h,05fh,023h,073h,07fh,03fh	; a135  ...'?....97_#s.?
	defb 01fh,0c0h,070h,0c8h,0f4h,0f4h,0fch,0feh,0feh,0fdh,0fdh,0fdh,0feh,0feh,0fch,0fch	; a145  ..p.............
	defb 0f8h	; a155

; ----------------------------------------------------------------------
; DATOS fotograma_A156: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0xa156..0xa15f  (9 bytes)
DATA_fotograma_A156:
	defb 000h,000h,017h,0a2h	; a156
	defb 010h,000h,058h,0a2h	; a15a
	defb 0ffh	; a15e

; ----------------------------------------------------------------------
; DATOS fotograma_A15F: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0xa15f..0xa168  (9 bytes)
DATA_fotograma_A15F:
	defb 000h,000h,099h,0a2h	; a15f
	defb 010h,000h,0dah,0a2h	; a163
	defb 0ffh	; a167

; ----------------------------------------------------------------------
; DATOS fotograma_A168: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0xa168..0xa171  (9 bytes)
DATA_fotograma_A168:
	defb 00eh,000h,0bch,0a1h	; a168
	defb 010h,000h,07bh,0a1h	; a16c
	defb 0ffh	; a170

; ----------------------------------------------------------------------
; DATOS fotograma_A171: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (5 bytes)
;   0xa171..0xa176  (5 bytes)
DATA_fotograma_A171:
	defb 006h,000h,0c5h,0a1h	; a171
	defb 0ffh	; a175

; ----------------------------------------------------------------------
; DATOS fotograma_A176: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (5 bytes)
;   0xa176..0xa17b  (5 bytes)
DATA_fotograma_A176:
	defb 004h,000h,0eeh,0a1h	; a176
	defb 0ffh	; a17a

; ----------------------------------------------------------------------
; DATOS pieza_A17B: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0xa17b..0xa1bc  (65 bytes)
DATA_pieza_A17B:
	defb 010h,000h,000h,000h,000h,000h,000h,000h,001h,002h,082h,044h,062h,03eh,071h,0e1h	; a17b  ...........Db>q.
	defb 07eh,07ah,052h,024h,024h,038h,040h,080h,000h,000h,000h,000h,000h,000h,000h,000h	; a18b  ~zR$$8@.........
	defb 000h,000h,000h,000h,000h,000h,000h,001h,003h,046h,0feh,07ch,05eh,03eh,06fh,09fh	; a19b  .........F.|^>o.
	defb 07eh,066h,03eh,07ch,07ch,0f8h,0c0h,080h,000h,000h,000h,000h,000h,000h,000h,000h	; a1ab  ~f>||...........
	defb 000h	; a1bb

; ----------------------------------------------------------------------
; DATOS pieza_A1BC: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (9 bytes)
;   0xa1bc..0xa1c5  (9 bytes)
DATA_pieza_A1BC:
	defb 002h,000h,000h,00ch,01eh,000h,000h,00ch,012h	; a1bc  .........

; ----------------------------------------------------------------------
; DATOS pieza_A1C5: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (41 bytes)
;   0xa1c5..0xa1ee  (41 bytes)
DATA_pieza_A1C5:
	defb 00ah,000h,000h,000h,000h,001h,003h,084h,07ah,086h,07ch,040h,060h,030h,0b8h,00ch	; a1c5  ........z.|@`0..
	defb 032h,0eeh,05ch,078h,038h,000h,000h,000h,001h,003h,047h,0fch,07eh,0feh,07ch,040h	; a1d5  2.\x8.....G.~.|@
	defb 0a0h,0f0h,0c8h,0fch,0feh,0deh,07ch,058h,038h	; a1e5  ......|X8

; ----------------------------------------------------------------------
; DATOS pieza_A1EE: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (41 bytes)
;   0xa1ee..0xa217  (41 bytes)
DATA_pieza_A1EE:
	defb 00ah,080h,0c0h,040h,0e0h,0b0h,030h,060h,0e0h,0c0h,080h,000h,000h,000h,000h,000h	; a1ee  ...@..0`........
	defb 000h,000h,000h,000h,000h,080h,040h,0c0h,0e0h,050h,0f0h,0e0h,0e0h,0c0h,080h,000h	; a1fe  ......@..P......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h	; a20e  .........

; ----------------------------------------------------------------------
; DATOS pieza_A217: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0xa217..0xa258  (65 bytes)
DATA_pieza_A217:
	defb 010h,000h,000h,000h,000h,000h,000h,000h,003h,00ch,010h,020h,020h,020h,040h,043h	; a217  ...........   @C
	defb 044h,000h,000h,000h,000h,000h,000h,000h,0c0h,020h,010h,010h,028h,054h,0a8h,034h	; a227  D........ ..(T.4
	defb 082h,022h,022h,017h,00ch,013h,02eh,029h,021h,019h,007h,000h,000h,000h,000h,001h	; a237  .""....)!.......
	defb 000h,0cah,013h,005h,00dh,0f2h,062h,085h,08ah,074h,004h,088h,084h,07ch,0c2h,002h	; a247  ......b..t...|..
	defb 0fch	; a257

; ----------------------------------------------------------------------
; DATOS pieza_A258: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0xa258..0xa299  (65 bytes)
DATA_pieza_A258:
	defb 010h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,018h	; a258  ................
	defb 024h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a268  $...............
	defb 000h,0c4h,024h,048h,048h,070h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a278  ..$HHp..........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a288  ................
	defb 000h	; a298

; ----------------------------------------------------------------------
; DATOS pieza_A299: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0xa299..0xa2da  (65 bytes)
DATA_pieza_A299:
	defb 010h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,00ch,010h,020h,020h	; a299  ..............
	defb 020h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,020h,010h,010h,028h	; a2a9   ........... ..(
	defb 054h,040h,043h,044h,022h,020h,017h,00ch,013h,02eh,029h,021h,019h,007h,000h,001h	; a2b9  T@CD" ....)!....
	defb 000h,0a8h,034h,082h,0cah,013h,005h,00dh,0f2h,062h,085h,08ah,076h,009h,0f4h,00ch	; a2c9  ..4......b..v...
	defb 0f8h	; a2d9

; ----------------------------------------------------------------------
; DATOS pieza_A2DA: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0xa2da..0xa31b  (65 bytes)
DATA_pieza_A2DA:
	defb 010h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a2da  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a2ea  ................
	defb 000h,000h,000h,000h,000h,000h,000h,080h,040h,060h,010h,018h,064h,09ch,0b8h,0b0h	; a2fa  ........@`..d...
	defb 070h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a30a  p...............
	defb 000h	; a31a

; ----------------------------------------------------------------------
; DATOS sprites_a31b: 4 x [patron volteado][origen lo][hi][patron normal]
;   (p00:5612); lo leen p00:5AA8 (16 bytes)
;   0xa31b..0xa32b  (16 bytes)
DATA_sprites_a31b:
	defb 010h,02bh,0a3h,018h	; a31b
	defb 010h,062h,0a3h,010h	; a31f
	defb 010h,079h,0a3h,010h	; a323
	defb 018h,08ah,0a3h,010h	; a327

; ----------------------------------------------------------------------
; DATOS sprites_a31b_0: patrones de sprite en RLE (p00:49CE), el registro 0 de
;   sprites_a31b; lo leen p00:5AA8 (55 bytes)
;   0xa32b..0xa362  (55 bytes)
DATA_sprites_a31b_0:
	defb 002h,000h,08bh,001h,000h,006h,01bh,05fh,0ffh,03fh,007h,000h,001h,006h,005h,000h	; a32b  ......._.?......
	defb 083h,07ch,01fh,08fh,005h,0ffh,084h,07dh,0f6h,006h,01ch,004h,000h,082h,07fh,03dh	; a33b  .|.....}.......=
	defb 005h,0ffh,085h,07fh,0ffh,00eh,078h,001h,003h,000h,083h,0e0h,07ch,08eh,007h,0ffh	; a34b  ......x.....|...
	defb 085h,01eh,0f8h,080h,000h,000h,000h	; a35b

; ----------------------------------------------------------------------
; DATOS sprites_a31b_1: patrones de sprite en RLE (p00:49CE), el registro 1 de
;   sprites_a31b; lo leen p00:5AA8 (23 bytes)
;   0xa362..0xa379  (23 bytes)
DATA_sprites_a31b_1:
	defb 004h,000h,082h,001h,003h,003h,007h,082h,003h,001h,009h,000h,087h,0c0h,0e0h,0d0h	; a362  ................
	defb 0d0h,090h,020h,0c0h,005h,000h,000h	; a372

; ----------------------------------------------------------------------
; DATOS sprites_a31b_2: patrones de sprite en RLE (p00:49CE), el registro 2 de
;   sprites_a31b; lo leen p00:5AA8 (17 bytes)
;   0xa379..0xa38a  (17 bytes)
DATA_sprites_a31b_2:
	defb 006h,000h,084h,01fh,03fh,034h,01fh,00ch,000h,084h,0f8h,0fch,01ch,0f8h,006h,000h	; a379  ....?4..........
	defb 000h	; a389

; ----------------------------------------------------------------------
; DATOS sprites_a31b_3: patrones de sprite en RLE (p00:49CE), el registro 3 de
;   sprites_a31b; lo leen p00:5AA8 (55 bytes)
;   0xa38a..0xa3c1  (55 bytes)
DATA_sprites_a31b_3:
	defb 086h,000h,00ch,018h,033h,026h,064h,004h,06ch,085h,064h,026h,033h,018h,00ch,005h	; a38a  ....3&d.l.d&3...
	defb 000h,088h,030h,060h,040h,0c0h,0c0h,040h,060h,030h,005h,000h,087h,007h,01eh,038h	; a39a  ..0`@..@`0.....8
	defb 033h,067h,06eh,04ch,003h,049h,081h,041h,005h,000h,089h,0f0h,000h,000h,0e0h,000h	; a3aa  3gnL.I.A........
	defb 000h,0f0h,0c0h,080h,006h,000h,000h	; a3ba

; ----------------------------------------------------------------------
; DATOS sprites_a3c1: 4 x [patron volteado][origen lo][hi][patron normal]
;   (p00:5612); lo leen p00:5ABD (16 bytes)
;   0xa3c1..0xa3d1  (16 bytes)
DATA_sprites_a3c1:
	defb 028h,010h,0a4h,028h	; a3c1
	defb 028h,010h,0a4h,028h	; a3c5
	defb 02ch,0fdh,0a3h,028h	; a3c9
	defb 028h,0d1h,0a3h,028h	; a3cd

; ----------------------------------------------------------------------
; DATOS sprites_a3c1_3: patrones de sprite en RLE (p00:49CE), el registro 3 de
;   sprites_a3c1; lo leen p00:5ABD (44 bytes)
;   0xa3d1..0xa3fd  (44 bytes)
DATA_sprites_a3c1_3:
	defb 00ah,000h,086h,002h,007h,007h,01bh,018h,004h,00ah,000h,086h,0a0h,0f0h,0f0h,06ch	; a3d1  ...............l
	defb 08ch,010h,006h,000h,088h,005h,00fh,00fh,007h,023h,070h,070h,008h,007h,000h,08bh	; a3e1  .........#pp....
	defb 080h,0d0h,0f8h,0f8h,0f0h,062h,087h,087h,008h,000h,000h,000h	; a3f1  .....b......

; ----------------------------------------------------------------------
; DATOS sprites_a3c1_2: patrones de sprite en RLE (p00:49CE), el registro 2 de
;   sprites_a3c1; lo leen p00:5ABD (19 bytes)
;   0xa3fd..0xa410  (19 bytes)
DATA_sprites_a3c1_2:
	defb 00bh,000h,084h,001h,000h,000h,001h,009h,000h,082h,010h,040h,003h,000h,083h,080h	; a3fd  ...........@....
	defb 000h,000h,000h	; a40d

; ----------------------------------------------------------------------
; DATOS sprites_a3c1_0: patrones de sprite en RLE (p00:49CE), el registro 0 de
;   sprites_a3c1; se solapan 2 bloques: (sprites_a3c1_1 A410-A426); lo leen
;   p00:5ABD (22 bytes)
;   0xa410..0xa426  (22 bytes)
DATA_sprites_a3c1_0:
	defb 018h,000h,087h,03eh,022h,03eh,022h,022h,0eeh,0cch,019h,000h,082h,020h,030h,003h	; a410  ...>">""..... 0.
	defb 028h,083h,0e0h,0c0h,000h,000h	; a420

; ----------------------------------------------------------------------
; DATOS sprites_a426: 4 x [patron volteado][origen lo][hi][patron normal]
;   (p00:5612); lo leen p00:5AB8 (16 bytes)
;   0xa426..0xa436  (16 bytes)
DATA_sprites_a426:
	defb 028h,0cah,0a4h,028h	; a426
	defb 028h,036h,0a4h,028h	; a42a
	defb 028h,09ah,0a4h,028h	; a42e
	defb 028h,068h,0a4h,028h	; a432

; ----------------------------------------------------------------------
; DATOS sprites_a426_1: patrones de sprite en RLE (p00:49CE), el registro 1 de
;   sprites_a426; lo leen p00:5AB8 (50 bytes)
;   0xa436..0xa468  (50 bytes)
DATA_sprites_a426_1:
	defb 006h,000h,081h,00dh,003h,01fh,083h,00eh,007h,002h,009h,000h,081h,080h,003h,040h	; a436  ...............@
	defb 081h,080h,008h,000h,084h,01fh,03fh,07fh,072h,003h,060h,085h,071h,078h,07dh,03fh	; a446  ......?.r.`.qx}?
	defb 01fh,004h,000h,084h,0c0h,0e0h,0f0h,070h,003h,0b0h,086h,078h,0f8h,0fch,0e4h,0c2h	; a456  .......p...x....
	defb 000h,000h	; a466

; ----------------------------------------------------------------------
; DATOS sprites_a426_3: patrones de sprite en RLE (p00:49CE), el registro 3 de
;   sprites_a426; lo leen p00:5AB8 (50 bytes)
;   0xa468..0xa49a  (50 bytes)
DATA_sprites_a426_3:
	defb 006h,000h,087h,011h,039h,03ch,039h,013h,009h,004h,009h,000h,081h,080h,003h,0c0h	; a468  ....9<9.........
	defb 081h,080h,008h,000h,08ch,01fh,03fh,07fh,06eh,046h,043h,046h,06ch,076h,07bh,03fh	; a478  ......?.nFCFlv{?
	defb 01fh,004h,000h,084h,0c0h,0e0h,0f0h,070h,003h,030h,086h,078h,0f8h,0fch,0e4h,0c2h	; a488  .......p.0.x....
	defb 000h,000h	; a498

; ----------------------------------------------------------------------
; DATOS sprites_a426_2: patrones de sprite en RLE (p00:49CE), el registro 2 de
;   sprites_a426; lo leen p00:5AB8 (48 bytes)
;   0xa49a..0xa4ca  (48 bytes)
DATA_sprites_a426_2:
	defb 004h,000h,002h,002h,002h,007h,085h,00fh,00eh,00eh,00ch,007h,00bh,000h,004h,080h	; a49a  ................
	defb 007h,000h,08ch,01fh,03dh,07dh,078h,078h,070h,071h,071h,073h,078h,03fh,01fh,004h	; a4aa  ....=}xxpqqsx?..
	defb 000h,082h,0c0h,0e0h,003h,0f0h,002h,070h,002h,078h,084h,0fch,0e4h,0c2h,000h,000h	; a4ba  .......p.x......

; ----------------------------------------------------------------------
; DATOS sprites_a426_0: patrones de sprite en RLE (p00:49CE), el registro 0 de
;   sprites_a426; lo leen p00:5AB8 (49 bytes)
;   0xa4ca..0xa4fb  (49 bytes)
DATA_sprites_a426_0:
	defb 005h,000h,088h,002h,003h,003h,002h,002h,00eh,01eh,00ch,00ah,000h,002h,080h,002h	; a4ca  ................
	defb 040h,008h,000h,08ch,01fh,03fh,07dh,07ch,07ch,07dh,07dh,071h,061h,073h,03fh,01fh	; a4da  @....?}||}}qas?.
	defb 004h,000h,08dh,0c0h,0e0h,0f0h,0f0h,070h,070h,0b0h,0b8h,0f8h,0fch,0e4h,0c2h,000h	; a4ea  .......pp.......
	defb 000h	; a4fa

; ----------------------------------------------------------------------
; DATOS enemigos_por_fase: 25 palabras: la tabla de pantallas de cada fase
;   1-25 (p15:A4F9[0xC211]; 0 en las 5, 10, 15, 20 y 25; la entrada 0 no se
;   lee y sus dos bytes son la cola de p15:A4CA); lo leen p01:774B (50 bytes)
;   0xa4fb..0xa52d  (50 bytes)
DATA_enemigos_por_fase:
	defb 02dh,0a5h	; a4fb
	defb 03dh,0a5h	; a4fd
	defb 053h,0a5h	; a4ff
	defb 065h,0a5h	; a501
	defb 000h,000h	; a503
	defb 075h,0a5h	; a505
	defb 087h,0a5h	; a507
	defb 09fh,0a5h	; a509
	defb 0b5h,0a5h	; a50b
	defb 000h,000h	; a50d
	defb 0c5h,0a5h	; a50f
	defb 0d5h,0a5h	; a511
	defb 0e7h,0a5h	; a513
	defb 0fdh,0a5h	; a515
	defb 000h,000h	; a517
	defb 017h,0a6h	; a519
	defb 031h,0a6h	; a51b
	defb 043h,0a6h	; a51d
	defb 059h,0a6h	; a51f
	defb 000h,000h	; a521
	defb 06fh,0a6h	; a523
	defb 085h,0a6h	; a525
	defb 0a1h,0a6h	; a527
	defb 0bbh,0a6h	; a529
	defb 000h,000h	; a52b

; ----------------------------------------------------------------------
; DATOS enemigos_fase_01: 8 palabras: la lista de enemigos de cada pantalla de
;   la fase 1; lo leen p01:774B (16 bytes)
;   0xa52d..0xa53d  (16 bytes)
DATA_enemigos_fase_01:
	defb 0d3h,0a6h	; a52d
	defb 0d9h,0a6h	; a52f
	defb 0dfh,0a6h	; a531
	defb 0dbh,0adh	; a533
	defb 0e5h,0a6h	; a535
	defb 0f0h,0a6h	; a537
	defb 0fch,0a6h	; a539
	defb 0dbh,0adh	; a53b

; ----------------------------------------------------------------------
; DATOS enemigos_fase_02: 11 palabras: la lista de enemigos de cada pantalla
;   de la fase 2; lo leen p01:774B (22 bytes)
;   0xa53d..0xa553  (22 bytes)
DATA_enemigos_fase_02:
	defb 0dbh,0adh	; a53d
	defb 0dbh,0adh	; a53f
	defb 007h,0a7h	; a541
	defb 0dbh,0adh	; a543
	defb 0dbh,0adh	; a545
	defb 0dbh,0adh	; a547
	defb 012h,0a7h	; a549
	defb 01dh,0a7h	; a54b
	defb 0dbh,0adh	; a54d
	defb 0dbh,0adh	; a54f
	defb 0dbh,0adh	; a551

; ----------------------------------------------------------------------
; DATOS enemigos_fase_03: 9 palabras: la lista de enemigos de cada pantalla de
;   la fase 3; lo leen p01:774B (18 bytes)
;   0xa553..0xa565  (18 bytes)
DATA_enemigos_fase_03:
	defb 023h,0a7h	; a553
	defb 0dbh,0adh	; a555
	defb 029h,0a7h	; a557
	defb 0dbh,0adh	; a559
	defb 0dbh,0adh	; a55b
	defb 0dbh,0adh	; a55d
	defb 02fh,0a7h	; a55f
	defb 03eh,0a7h	; a561
	defb 0dbh,0adh	; a563

; ----------------------------------------------------------------------
; DATOS enemigos_fase_04: 8 palabras: la lista de enemigos de cada pantalla de
;   la fase 4; lo leen p01:774B (16 bytes)
;   0xa565..0xa575  (16 bytes)
DATA_enemigos_fase_04:
	defb 04eh,0a7h	; a565
	defb 054h,0a7h	; a567
	defb 0dbh,0adh	; a569
	defb 0dbh,0adh	; a56b
	defb 05ah,0a7h	; a56d
	defb 06ah,0a7h	; a56f
	defb 070h,0a7h	; a571
	defb 0dbh,0adh	; a573

; ----------------------------------------------------------------------
; DATOS enemigos_fase_06: 9 palabras: la lista de enemigos de cada pantalla de
;   la fase 6; lo leen p01:774B (18 bytes)
;   0xa575..0xa587  (18 bytes)
DATA_enemigos_fase_06:
	defb 077h,0a7h	; a575
	defb 083h,0a7h	; a577
	defb 08ch,0a7h	; a579
	defb 09ch,0a7h	; a57b
	defb 0dbh,0adh	; a57d
	defb 0abh,0a7h	; a57f
	defb 0c4h,0a7h	; a581
	defb 0cah,0a7h	; a583
	defb 0dbh,0adh	; a585

; ----------------------------------------------------------------------
; DATOS enemigos_fase_07: 12 palabras: la lista de enemigos de cada pantalla
;   de la fase 7; lo leen p01:774B (24 bytes)
;   0xa587..0xa59f  (24 bytes)
DATA_enemigos_fase_07:
	defb 0dbh,0a7h	; a587
	defb 0f0h,0a7h	; a589
	defb 0dbh,0adh	; a58b
	defb 0fch,0a7h	; a58d
	defb 010h,0a8h	; a58f
	defb 01bh,0a8h	; a591
	defb 021h,0a8h	; a593
	defb 031h,0a8h	; a595
	defb 037h,0a8h	; a597
	defb 044h,0a8h	; a599
	defb 050h,0a8h	; a59b
	defb 0dbh,0adh	; a59d

; ----------------------------------------------------------------------
; DATOS enemigos_fase_08: 11 palabras: la lista de enemigos de cada pantalla
;   de la fase 8; lo leen p01:774B (22 bytes)
;   0xa59f..0xa5b5  (22 bytes)
DATA_enemigos_fase_08:
	defb 06ah,0a8h	; a59f
	defb 07ah,0a8h	; a5a1
	defb 084h,0a8h	; a5a3
	defb 094h,0a8h	; a5a5
	defb 09eh,0a8h	; a5a7
	defb 0dbh,0adh	; a5a9
	defb 0abh,0a8h	; a5ab
	defb 0b8h,0a8h	; a5ad
	defb 0c5h,0a8h	; a5af
	defb 0d9h,0a8h	; a5b1
	defb 0dbh,0adh	; a5b3

; ----------------------------------------------------------------------
; DATOS enemigos_fase_09: 8 palabras: la lista de enemigos de cada pantalla de
;   la fase 9; lo leen p01:774B (16 bytes)
;   0xa5b5..0xa5c5  (16 bytes)
DATA_enemigos_fase_09:
	defb 0e0h,0a8h	; a5b5
	defb 0dbh,0adh	; a5b7
	defb 0dbh,0adh	; a5b9
	defb 0ebh,0a8h	; a5bb
	defb 0efh,0a8h	; a5bd
	defb 0f8h,0a8h	; a5bf
	defb 0ffh,0a8h	; a5c1
	defb 0dbh,0adh	; a5c3

; ----------------------------------------------------------------------
; DATOS enemigos_fase_11: 8 palabras: la lista de enemigos de cada pantalla de
;   la fase 11; lo leen p01:774B (16 bytes)
;   0xa5c5..0xa5d5  (16 bytes)
DATA_enemigos_fase_11:
	defb 0dbh,0adh	; a5c5
	defb 00bh,0a9h	; a5c7
	defb 01ch,0a9h	; a5c9
	defb 0dbh,0adh	; a5cb
	defb 028h,0a9h	; a5cd
	defb 0dbh,0adh	; a5cf
	defb 038h,0a9h	; a5d1
	defb 0dbh,0adh	; a5d3

; ----------------------------------------------------------------------
; DATOS enemigos_fase_12: 9 palabras: la lista de enemigos de cada pantalla de
;   la fase 12; lo leen p01:774B (18 bytes)
;   0xa5d5..0xa5e7  (18 bytes)
DATA_enemigos_fase_12:
	defb 042h,0a9h	; a5d5
	defb 053h,0a9h	; a5d7
	defb 06ch,0a9h	; a5d9
	defb 087h,0a9h	; a5db
	defb 09ch,0a9h	; a5dd
	defb 0adh,0a9h	; a5df
	defb 0c0h,0a9h	; a5e1
	defb 0d3h,0a9h	; a5e3
	defb 0dbh,0adh	; a5e5

; ----------------------------------------------------------------------
; DATOS enemigos_fase_13: 11 palabras: la lista de enemigos de cada pantalla
;   de la fase 13; lo leen p01:774B (22 bytes)
;   0xa5e7..0xa5fd  (22 bytes)
DATA_enemigos_fase_13:
	defb 0dbh,0adh	; a5e7
	defb 0dbh,0adh	; a5e9
	defb 0dbh,0adh	; a5eb
	defb 0dbh,0adh	; a5ed
	defb 0dbh,0adh	; a5ef
	defb 0e2h,0a9h	; a5f1
	defb 0e8h,0a9h	; a5f3
	defb 0dbh,0adh	; a5f5
	defb 0dbh,0adh	; a5f7
	defb 0f2h,0a9h	; a5f9
	defb 0dbh,0adh	; a5fb

; ----------------------------------------------------------------------
; DATOS enemigos_fase_14: 13 palabras: la lista de enemigos de cada pantalla
;   de la fase 14; lo leen p01:774B (26 bytes)
;   0xa5fd..0xa617  (26 bytes)
DATA_enemigos_fase_14:
	defb 0fdh,0a9h	; a5fd
	defb 003h,0aah	; a5ff
	defb 00eh,0aah	; a601
	defb 019h,0aah	; a603
	defb 032h,0aah	; a605
	defb 03bh,0aah	; a607
	defb 058h,0aah	; a609
	defb 063h,0aah	; a60b
	defb 06ah,0aah	; a60d
	defb 077h,0aah	; a60f
	defb 0dbh,0adh	; a611
	defb 07bh,0aah	; a613
	defb 0dbh,0adh	; a615

; ----------------------------------------------------------------------
; DATOS enemigos_fase_16: 13 palabras: la lista de enemigos de cada pantalla
;   de la fase 16; lo leen p01:774B (26 bytes)
;   0xa617..0xa631  (26 bytes)
DATA_enemigos_fase_16:
	defb 08eh,0aah	; a617
	defb 092h,0aah	; a619
	defb 096h,0aah	; a61b
	defb 0dbh,0adh	; a61d
	defb 09bh,0aah	; a61f
	defb 0bch,0aah	; a621
	defb 0d6h,0aah	; a623
	defb 0eeh,0aah	; a625
	defb 0dbh,0adh	; a627
	defb 000h,0abh	; a629
	defb 007h,0abh	; a62b
	defb 00bh,0abh	; a62d
	defb 0dbh,0adh	; a62f

; ----------------------------------------------------------------------
; DATOS enemigos_fase_17: 9 palabras: la lista de enemigos de cada pantalla de
;   la fase 17; lo leen p01:774B (18 bytes)
;   0xa631..0xa643  (18 bytes)
DATA_enemigos_fase_17:
	defb 0dbh,0adh	; a631
	defb 011h,0abh	; a633
	defb 015h,0abh	; a635
	defb 020h,0abh	; a637
	defb 046h,0abh	; a639
	defb 0dbh,0adh	; a63b
	defb 0dbh,0adh	; a63d
	defb 058h,0abh	; a63f
	defb 0dbh,0adh	; a641

; ----------------------------------------------------------------------
; DATOS enemigos_fase_18: 11 palabras: la lista de enemigos de cada pantalla
;   de la fase 18; lo leen p01:774B (22 bytes)
;   0xa643..0xa659  (22 bytes)
DATA_enemigos_fase_18:
	defb 05eh,0abh	; a643
	defb 064h,0abh	; a645
	defb 0dbh,0adh	; a647
	defb 06bh,0abh	; a649
	defb 076h,0abh	; a64b
	defb 086h,0abh	; a64d
	defb 09bh,0abh	; a64f
	defb 0a5h,0abh	; a651
	defb 0b8h,0abh	; a653
	defb 0c5h,0abh	; a655
	defb 0dbh,0adh	; a657

; ----------------------------------------------------------------------
; DATOS enemigos_fase_19: 11 palabras: la lista de enemigos de cada pantalla
;   de la fase 19; lo leen p01:774B (22 bytes)
;   0xa659..0xa66f  (22 bytes)
DATA_enemigos_fase_19:
	defb 0dbh,0adh	; a659
	defb 0dbh,0adh	; a65b
	defb 0d3h,0abh	; a65d
	defb 0d9h,0abh	; a65f
	defb 0e5h,0abh	; a661
	defb 0dbh,0adh	; a663
	defb 0dbh,0adh	; a665
	defb 0ffh,0abh	; a667
	defb 008h,0ach	; a669
	defb 00eh,0ach	; a66b
	defb 0dbh,0adh	; a66d

; ----------------------------------------------------------------------
; DATOS enemigos_fase_21: 11 palabras: la lista de enemigos de cada pantalla
;   de la fase 21; lo leen p01:774B (22 bytes)
;   0xa66f..0xa685  (22 bytes)
DATA_enemigos_fase_21:
	defb 0dbh,0adh	; a66f
	defb 01bh,0ach	; a671
	defb 022h,0ach	; a673
	defb 02eh,0ach	; a675
	defb 03eh,0ach	; a677
	defb 042h,0ach	; a679
	defb 049h,0ach	; a67b
	defb 05fh,0ach	; a67d
	defb 068h,0ach	; a67f
	defb 076h,0ach	; a681
	defb 0dbh,0adh	; a683

; ----------------------------------------------------------------------
; DATOS enemigos_fase_22: 14 palabras: la lista de enemigos de cada pantalla
;   de la fase 22; lo leen p01:774B (28 bytes)
;   0xa685..0xa6a1  (28 bytes)
DATA_enemigos_fase_22:
	defb 08bh,0ach	; a685
	defb 0a0h,0ach	; a687
	defb 0dbh,0adh	; a689
	defb 0dbh,0adh	; a68b
	defb 0a6h,0ach	; a68d
	defb 0aah,0ach	; a68f
	defb 0b7h,0ach	; a691
	defb 0bbh,0ach	; a693
	defb 0dbh,0adh	; a695
	defb 0bfh,0ach	; a697
	defb 0cfh,0ach	; a699
	defb 0d6h,0ach	; a69b
	defb 0e2h,0ach	; a69d
	defb 0dbh,0adh	; a69f

; ----------------------------------------------------------------------
; DATOS enemigos_fase_23: 13 palabras: la lista de enemigos de cada pantalla
;   de la fase 23; lo leen p01:774B (26 bytes)
;   0xa6a1..0xa6bb  (26 bytes)
DATA_enemigos_fase_23:
	defb 0f3h,0ach	; a6a1
	defb 0dbh,0adh	; a6a3
	defb 0fah,0ach	; a6a5
	defb 0dbh,0adh	; a6a7
	defb 0dbh,0adh	; a6a9
	defb 010h,0adh	; a6ab
	defb 01ch,0adh	; a6ad
	defb 022h,0adh	; a6af
	defb 0dbh,0adh	; a6b1
	defb 0dbh,0adh	; a6b3
	defb 0dbh,0adh	; a6b5
	defb 028h,0adh	; a6b7
	defb 0dbh,0adh	; a6b9

; ----------------------------------------------------------------------
; DATOS enemigos_fase_24: 12 palabras: la lista de enemigos de cada pantalla
;   de la fase 24; lo leen p01:774B (24 bytes)
;   0xa6bb..0xa6d3  (24 bytes)
DATA_enemigos_fase_24:
	defb 032h,0adh	; a6bb
	defb 050h,0adh	; a6bd
	defb 068h,0adh	; a6bf
	defb 080h,0adh	; a6c1
	defb 0dbh,0adh	; a6c3
	defb 090h,0adh	; a6c5
	defb 09eh,0adh	; a6c7
	defb 0a5h,0adh	; a6c9
	defb 0dbh,0adh	; a6cb
	defb 0afh,0adh	; a6cd
	defb 0beh,0adh	; a6cf
	defb 0dbh,0adh	; a6d1

; ----------------------------------------------------------------------
; DATOS enemigos_A6D3: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa6d3..0xa6d9  (6 bytes)
DATA_enemigos_A6D3:
	defb 001h,004h,083h,050h,000h,038h	; a6d3

; ----------------------------------------------------------------------
; DATOS enemigos_A6D9: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa6d9..0xa6df  (6 bytes)
DATA_enemigos_A6D9:
	defb 001h,005h,053h,0a8h,001h,040h	; a6d9

; ----------------------------------------------------------------------
; DATOS enemigos_A6DF: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa6df..0xa6e5  (6 bytes)
DATA_enemigos_A6DF:
	defb 001h,004h,083h,060h,000h,028h	; a6df

; ----------------------------------------------------------------------
; DATOS enemigos_A6E5: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xa6e5..0xa6f0  (11 bytes)
DATA_enemigos_A6E5:
	defb 002h,005h,053h,068h,000h,028h,005h,053h,0c8h,001h,028h	; a6e5  ..Sh.(.S..(

; ----------------------------------------------------------------------
; DATOS enemigos_A6F0: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (12 bytes)
;   0xa6f0..0xa6fc  (12 bytes)
DATA_enemigos_A6F0:
	defb 003h,00ch,063h,070h,00ch,063h,0d0h,005h,063h,0b8h,001h,030h	; a6f0  ..cp.c..c..0

; ----------------------------------------------------------------------
; DATOS enemigos_A6FC: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xa6fc..0xa707  (11 bytes)
DATA_enemigos_A6FC:
	defb 002h,005h,063h,070h,001h,038h,005h,063h,090h,000h,038h	; a6fc  ..cp.8.c..8

; ----------------------------------------------------------------------
; DATOS enemigos_A707: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xa707..0xa712  (11 bytes)
DATA_enemigos_A707:
	defb 002h,005h,073h,0d8h,001h,020h,005h,08bh,088h,000h,020h	; a707  ..s.. ....

; ----------------------------------------------------------------------
; DATOS enemigos_A712: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xa712..0xa71d  (11 bytes)
DATA_enemigos_A712:
	defb 002h,005h,053h,050h,000h,028h,005h,053h,0b8h,001h,030h	; a712  ..SP.(.S..0

; ----------------------------------------------------------------------
; DATOS enemigos_A71D: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa71d..0xa723  (6 bytes)
DATA_enemigos_A71D:
	defb 001h,004h,0c3h,068h,000h,070h	; a71d

; ----------------------------------------------------------------------
; DATOS enemigos_A723: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa723..0xa729  (6 bytes)
DATA_enemigos_A723:
	defb 001h,005h,053h,068h,000h,050h	; a723

; ----------------------------------------------------------------------
; DATOS enemigos_A729: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa729..0xa72f  (6 bytes)
DATA_enemigos_A729:
	defb 001h,005h,043h,088h,001h,040h	; a729

; ----------------------------------------------------------------------
; DATOS enemigos_A72F: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (15 bytes)
;   0xa72f..0xa73e  (15 bytes)
DATA_enemigos_A72F:
	defb 004h,004h,0c3h,098h,000h,048h,006h,083h,038h,006h,083h,058h,006h,083h,078h	; a72f  .....H..8..X..x

; ----------------------------------------------------------------------
; DATOS enemigos_A73E: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (16 bytes)
;   0xa73e..0xa74e  (16 bytes)
DATA_enemigos_A73E:
	defb 003h,005h,093h,048h,001h,020h,005h,093h,058h,000h,028h,005h,093h,0d0h,001h,040h	; a73e  ...H. ..X.(....@

; ----------------------------------------------------------------------
; DATOS enemigos_A74E: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa74e..0xa754  (6 bytes)
DATA_enemigos_A74E:
	defb 001h,004h,0c3h,0e8h,000h,070h	; a74e

; ----------------------------------------------------------------------
; DATOS enemigos_A754: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa754..0xa75a  (6 bytes)
DATA_enemigos_A754:
	defb 001h,005h,043h,028h,000h,030h	; a754

; ----------------------------------------------------------------------
; DATOS enemigos_A75A: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (16 bytes)
;   0xa75a..0xa76a  (16 bytes)
DATA_enemigos_A75A:
	defb 003h,005h,043h,028h,000h,020h,005h,093h,028h,000h,030h,005h,093h,098h,001h,030h	; a75a  ..C(. ..(.0....0

; ----------------------------------------------------------------------
; DATOS enemigos_A76A: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa76a..0xa770  (6 bytes)
DATA_enemigos_A76A:
	defb 001h,004h,0c3h,058h,000h,038h	; a76a

; ----------------------------------------------------------------------
; DATOS enemigos_A770: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (7 bytes)
;   0xa770..0xa777  (7 bytes)
DATA_enemigos_A770:
	defb 002h,00ch,053h,0a8h,00ch,053h,0c8h	; a770

; ----------------------------------------------------------------------
; DATOS enemigos_A777: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (12 bytes)
;   0xa777..0xa783  (12 bytes)
DATA_enemigos_A777:
	defb 003h,007h,088h,0d0h,020h,009h,034h,0c0h,001h,00ah,044h,040h	; a777  .... .4...D@

; ----------------------------------------------------------------------
; DATOS enemigos_A783: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (9 bytes)
;   0xa783..0xa78c  (9 bytes)
DATA_enemigos_A783:
	defb 002h,007h,088h,030h,014h,009h,034h,020h,000h	; a783  ...0..4 .

; ----------------------------------------------------------------------
; DATOS enemigos_A78C: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (16 bytes)
;   0xa78c..0xa79c  (16 bytes)
DATA_enemigos_A78C:
	defb 003h,004h,0c3h,060h,000h,040h,004h,093h,080h,000h,018h,004h,07bh,0a0h,001h,018h	; a78c  ...`.@......{...

; ----------------------------------------------------------------------
; DATOS enemigos_A79C: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (15 bytes)
;   0xa79c..0xa7ab  (15 bytes)
DATA_enemigos_A79C:
	defb 003h,009h,044h,040h,001h,005h,0c3h,028h,000h,038h,005h,0c3h,0a8h,001h,038h	; a79c  ..D@...(.8....8

; ----------------------------------------------------------------------
; DATOS enemigos_A7AB: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (25 bytes)
;   0xa7ab..0xa7c4  (25 bytes)
DATA_enemigos_A7AB:
	defb 003h,00bh,083h,050h,081h,050h,010h,083h,050h,00bh,0b3h,080h,082h,018h,020h,0b3h	; a7ab  ...P.P..P..... .
	defb 070h,00bh,093h,0b0h,001h,050h,010h,083h,0a0h	; a7bb  p....P...

; ----------------------------------------------------------------------
; DATOS enemigos_A7C4: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa7c4..0xa7ca  (6 bytes)
DATA_enemigos_A7C4:
	defb 001h,004h,0b3h,0b0h,000h,060h	; a7c4

; ----------------------------------------------------------------------
; DATOS enemigos_A7CA: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (17 bytes)
;   0xa7ca..0xa7db  (17 bytes)
DATA_enemigos_A7CA:
	defb 002h,00bh,053h,070h,082h,020h,020h,053h,050h,00bh,053h,090h,003h,020h,020h,053h	; a7ca  ..Sp.  SP.S..  S
	defb 090h	; a7da

; ----------------------------------------------------------------------
; DATOS enemigos_A7DB: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (21 bytes)
;   0xa7db..0xa7f0  (21 bytes)
DATA_enemigos_A7DB:
	defb 004h,005h,053h,078h,001h,030h,005h,053h,088h,000h,030h,005h,093h,048h,000h,040h	; a7db  ..Sx.0.S..0..H.@
	defb 005h,093h,0d8h,001h,040h	; a7eb

; ----------------------------------------------------------------------
; DATOS enemigos_A7F0: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (12 bytes)
;   0xa7f0..0xa7fc  (12 bytes)
DATA_enemigos_A7F0:
	defb 003h,00ch,063h,098h,00ch,063h,0b8h,005h,053h,060h,000h,020h	; a7f0  ..c..c..S`.

; ----------------------------------------------------------------------
; DATOS enemigos_A7FC: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (20 bytes)
;   0xa7fc..0xa810  (20 bytes)
DATA_enemigos_A7FC:
	defb 005h,00ah,044h,020h,00ah,084h,020h,00ah,0c4h,020h,005h,053h,078h,000h,030h,005h	; a7fc  ..D .. .. .Sx.0.
	defb 093h,0a8h,001h,030h	; a80c

; ----------------------------------------------------------------------
; DATOS enemigos_A810: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xa810..0xa81b  (11 bytes)
DATA_enemigos_A810:
	defb 002h,004h,0c3h,068h,000h,028h,005h,053h,090h,000h,028h	; a810  ...h.(.S..(

; ----------------------------------------------------------------------
; DATOS enemigos_A81B: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa81b..0xa821  (6 bytes)
DATA_enemigos_A81B:
	defb 001h,005h,043h,0d8h,001h,080h	; a81b

; ----------------------------------------------------------------------
; DATOS enemigos_A821: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (16 bytes)
;   0xa821..0xa831  (16 bytes)
DATA_enemigos_A821:
	defb 003h,005h,043h,058h,001h,030h,005h,043h,068h,000h,030h,005h,043h,0d8h,001h,030h	; a821  ..CX.0.Ch.0.C..0

; ----------------------------------------------------------------------
; DATOS enemigos_A831: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa831..0xa837  (6 bytes)
DATA_enemigos_A831:
	defb 001h,004h,0b3h,0c0h,000h,060h	; a831

; ----------------------------------------------------------------------
; DATOS enemigos_A837: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (13 bytes)
;   0xa837..0xa844  (13 bytes)
DATA_enemigos_A837:
	defb 004h,00ah,044h,020h,00ah,044h,040h,00ah,044h,080h,00ah,044h,0a0h	; a837  ..D .D@.D..D.

; ----------------------------------------------------------------------
; DATOS enemigos_A844: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (12 bytes)
;   0xa844..0xa850  (12 bytes)
DATA_enemigos_A844:
	defb 003h,00ch,093h,088h,00ch,093h,0a8h,004h,0c3h,060h,000h,038h	; a844  .........`.8

; ----------------------------------------------------------------------
; DATOS enemigos_A850: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (26 bytes)
;   0xa850..0xa86a  (26 bytes)
DATA_enemigos_A850:
	defb 005h,005h,043h,038h,000h,048h,004h,093h,028h,000h,048h,004h,08bh,048h,001h,038h	; a850  ..C8.H..(.H..H.8
	defb 004h,07bh,0a0h,001h,048h,004h,0a3h,0c0h,000h,038h	; a860  .{..H....8

; ----------------------------------------------------------------------
; DATOS enemigos_A86A: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (16 bytes)
;   0xa86a..0xa87a  (16 bytes)
DATA_enemigos_A86A:
	defb 003h,004h,083h,048h,000h,030h,005h,043h,090h,001h,038h,005h,053h,0c8h,001h,028h	; a86a  ...H.0.C..8.S..(

; ----------------------------------------------------------------------
; DATOS enemigos_A87A: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (10 bytes)
;   0xa87a..0xa884  (10 bytes)
DATA_enemigos_A87A:
	defb 003h,008h,033h,030h,008h,063h,050h,008h,093h,030h	; a87a  ..30.cP..0

; ----------------------------------------------------------------------
; DATOS enemigos_A884: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (16 bytes)
;   0xa884..0xa894  (16 bytes)
DATA_enemigos_A884:
	defb 003h,005h,043h,038h,000h,020h,005h,053h,088h,001h,020h,005h,043h,098h,000h,030h	; a884  ..C8. .S.. .C..0

; ----------------------------------------------------------------------
; DATOS enemigos_A894: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (10 bytes)
;   0xa894..0xa89e  (10 bytes)
DATA_enemigos_A894:
	defb 003h,008h,033h,0b0h,008h,063h,0d0h,008h,093h,0b0h	; a894  ..3..c....

; ----------------------------------------------------------------------
; DATOS enemigos_A89E: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (13 bytes)
;   0xa89e..0xa8ab  (13 bytes)
DATA_enemigos_A89E:
	defb 004h,008h,033h,030h,008h,063h,050h,008h,093h,030h,008h,0c3h,050h	; a89e  ..30.cP..0..P

; ----------------------------------------------------------------------
; DATOS enemigos_A8AB: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (13 bytes)
;   0xa8ab..0xa8b8  (13 bytes)
DATA_enemigos_A8AB:
	defb 004h,008h,033h,0b0h,008h,063h,0d0h,008h,093h,0b0h,008h,0c3h,0d0h	; a8ab  ..3..c.......

; ----------------------------------------------------------------------
; DATOS enemigos_A8B8: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (13 bytes)
;   0xa8b8..0xa8c5  (13 bytes)
DATA_enemigos_A8B8:
	defb 004h,008h,093h,030h,008h,0c3h,050h,008h,0a3h,080h,008h,0a3h,0b0h	; a8b8  ...0..P......

; ----------------------------------------------------------------------
; DATOS enemigos_A8C5: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (20 bytes)
;   0xa8c5..0xa8d9  (20 bytes)
DATA_enemigos_A8C5:
	defb 005h,008h,0a3h,030h,008h,0a3h,060h,008h,0a3h,090h,005h,043h,048h,000h,030h,005h	; a8c5  ...0..`....CH.0.
	defb 043h,0b8h,001h,030h	; a8d5

; ----------------------------------------------------------------------
; DATOS enemigos_A8D9: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (7 bytes)
;   0xa8d9..0xa8e0  (7 bytes)
DATA_enemigos_A8D9:
	defb 002h,008h,093h,0b0h,008h,0c3h,0d0h	; a8d9

; ----------------------------------------------------------------------
; DATOS enemigos_A8E0: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xa8e0..0xa8eb  (11 bytes)
DATA_enemigos_A8E0:
	defb 002h,004h,093h,058h,000h,038h,004h,05bh,0a8h,001h,038h	; a8e0  ...X.8.[..8

; ----------------------------------------------------------------------
; DATOS enemigos_A8EB: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (4 bytes)
;   0xa8eb..0xa8ef  (4 bytes)
DATA_enemigos_A8EB:
	defb 001h,00ah,054h,020h	; a8eb

; ----------------------------------------------------------------------
; DATOS enemigos_A8EF: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (9 bytes)
;   0xa8ef..0xa8f8  (9 bytes)
DATA_enemigos_A8EF:
	defb 002h,001h,023h,068h,018h,001h,023h,0c8h,020h	; a8ef  ..#h..#.

; ----------------------------------------------------------------------
; DATOS enemigos_A8F8: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (7 bytes)
;   0xa8f8..0xa8ff  (7 bytes)
DATA_enemigos_A8F8:
	defb 002h,00ah,054h,040h,00ah,054h,0a0h	; a8f8

; ----------------------------------------------------------------------
; DATOS enemigos_A8FF: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (12 bytes)
;   0xa8ff..0xa90b  (12 bytes)
DATA_enemigos_A8FF:
	defb 003h,001h,023h,038h,008h,001h,023h,078h,024h,00ah,054h,020h	; a8ff  ..#8..#x$.T

; ----------------------------------------------------------------------
; DATOS enemigos_A90B: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (17 bytes)
;   0xa90b..0xa91c  (17 bytes)
DATA_enemigos_A90B:
	defb 004h,005h,083h,028h,000h,050h,005h,04bh,088h,001h,050h,005h,093h,0b8h,001h,020h	; a90b  ...(.P.K..P....
	defb 002h	; a91b

; ----------------------------------------------------------------------
; DATOS enemigos_A91C: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (12 bytes)
;   0xa91c..0xa928  (12 bytes)
DATA_enemigos_A91C:
	defb 003h,005h,053h,040h,000h,038h,005h,093h,078h,001h,030h,002h	; a91c  ..S@.8..x.0.

; ----------------------------------------------------------------------
; DATOS enemigos_A928: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (16 bytes)
;   0xa928..0xa938  (16 bytes)
DATA_enemigos_A928:
	defb 003h,004h,083h,0c0h,000h,038h,005h,053h,050h,000h,028h,005h,053h,0b0h,001h,028h	; a928  .....8.SP.(.S..(

; ----------------------------------------------------------------------
; DATOS enemigos_A938: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (10 bytes)
;   0xa938..0xa942  (10 bytes)
DATA_enemigos_A938:
	defb 003h,00ah,0a4h,040h,00ah,0a4h,060h,00ah,064h,080h	; a938  ...@..`.d.

; ----------------------------------------------------------------------
; DATOS enemigos_A942: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (17 bytes)
;   0xa942..0xa953  (17 bytes)
DATA_enemigos_A942:
	defb 004h,001h,023h,098h,008h,001h,023h,0d8h,014h,001h,083h,088h,00ch,001h,083h,0c8h	; a942  ..#...#.........
	defb 018h	; a952

; ----------------------------------------------------------------------
; DATOS enemigos_A953: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (25 bytes)
;   0xa953..0xa96c  (25 bytes)
DATA_enemigos_A953:
	defb 006h,009h,064h,040h,001h,009h,064h,080h,001h,001h,023h,058h,014h,001h,023h,0a8h	; a953  ..d@..d...#X..#.
	defb 008h,001h,083h,038h,01ch,001h,083h,0c8h,00ch	; a963  ...8.....

; ----------------------------------------------------------------------
; DATOS enemigos_A96C: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (27 bytes)
;   0xa96c..0xa987  (27 bytes)
DATA_enemigos_A96C:
	defb 006h,005h,0a3h,078h,000h,030h,005h,083h,0e8h,001h,030h,005h,05bh,038h,001h,018h	; a96c  ...x.0....0.[8..
	defb 005h,04bh,048h,000h,020h,00ah,064h,030h,00ah,064h,050h	; a97c  .KH. .d0.dP

; ----------------------------------------------------------------------
; DATOS enemigos_A987: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (21 bytes)
;   0xa987..0xa99c  (21 bytes)
DATA_enemigos_A987:
	defb 004h,004h,093h,038h,000h,048h,004h,07bh,058h,001h,048h,004h,04bh,0a8h,001h,040h	; a987  ...8.H.{X.H.K..@
	defb 004h,0d3h,0c8h,000h,048h	; a997

; ----------------------------------------------------------------------
; DATOS enemigos_A99C: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (17 bytes)
;   0xa99c..0xa9ad  (17 bytes)
DATA_enemigos_A99C:
	defb 002h,00bh,073h,068h,001h,080h,030h,043h,038h,00bh,08bh,0c8h,001h,050h,030h,063h	; a99c  ..sh..0C8....P0c
	defb 098h	; a9ac

; ----------------------------------------------------------------------
; DATOS enemigos_A9AD: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (19 bytes)
;   0xa9ad..0xa9c0  (19 bytes)
DATA_enemigos_A9AD:
	defb 003h,004h,0c3h,0a0h,000h,038h,004h,05bh,0c0h,001h,028h,00bh,053h,048h,001h,080h	; a9ad  .....8.[..(.SH..
	defb 030h,053h,018h	; a9bd

; ----------------------------------------------------------------------
; DATOS enemigos_A9C0: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (19 bytes)
;   0xa9c0..0xa9d3  (19 bytes)
DATA_enemigos_A9C0:
	defb 004h,005h,053h,0c8h,001h,030h,004h,0d3h,0e0h,000h,068h,003h,053h,030h,001h,003h	; a9c0  ..S..0....h.S0..
	defb 093h,058h,002h	; a9d0

; ----------------------------------------------------------------------
; DATOS enemigos_A9D3: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (15 bytes)
;   0xa9d3..0xa9e2  (15 bytes)
DATA_enemigos_A9D3:
	defb 004h,001h,023h,058h,014h,001h,023h,0a8h,00ch,00ah,084h,050h,00ah,084h,070h	; a9d3  ..#X..#....P..p

; ----------------------------------------------------------------------
; DATOS enemigos_A9E2: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa9e2..0xa9e8  (6 bytes)
DATA_enemigos_A9E2:
	defb 001h,004h,09bh,068h,000h,050h	; a9e2

; ----------------------------------------------------------------------
; DATOS enemigos_A9E8: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (10 bytes)
;   0xa9e8..0xa9f2  (10 bytes)
DATA_enemigos_A9E8:
	defb 003h,00ah,044h,040h,00ah,044h,0a0h,00ah,0c4h,010h	; a9e8  ..D@.D....

; ----------------------------------------------------------------------
; DATOS enemigos_A9F2: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xa9f2..0xa9fd  (11 bytes)
DATA_enemigos_A9F2:
	defb 002h,005h,043h,088h,000h,030h,004h,0c3h,038h,000h,078h	; a9f2  ..C..0..8.x

; ----------------------------------------------------------------------
; DATOS enemigos_A9FD: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xa9fd..0xaa03  (6 bytes)
DATA_enemigos_A9FD:
	defb 001h,005h,0b3h,090h,000h,040h	; a9fd

; ----------------------------------------------------------------------
; DATOS enemigos_AA03: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xaa03..0xaa0e  (11 bytes)
DATA_enemigos_AA03:
	defb 002h,005h,0b3h,048h,001h,020h,005h,0b3h,058h,000h,020h	; aa03  ...H. ..X.

; ----------------------------------------------------------------------
; DATOS enemigos_AA0E: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xaa0e..0xaa19  (11 bytes)
DATA_enemigos_AA0E:
	defb 002h,005h,0b3h,088h,000h,018h,005h,0b3h,0d8h,001h,020h	; aa0e  ..........

; ----------------------------------------------------------------------
; DATOS enemigos_AA19: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (25 bytes)
;   0xaa19..0xaa32  (25 bytes)
DATA_enemigos_AA19:
	defb 006h,005h,09bh,058h,001h,030h,005h,07bh,068h,000h,030h,005h,063h,0e8h,001h,040h	; aa19  ...X.0.{h.0.c..@
	defb 00ah,0c4h,070h,00ah,0c4h,090h,00ah,0c4h,0b0h	; aa29  ..p......

; ----------------------------------------------------------------------
; DATOS enemigos_AA32: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (9 bytes)
;   0xaa32..0xaa3b  (9 bytes)
DATA_enemigos_AA32:
	defb 002h,001h,023h,0d8h,006h,001h,023h,0e8h,00ah	; aa32  ..#...#..

; ----------------------------------------------------------------------
; DATOS enemigos_AA3B: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (29 bytes)
;   0xaa3b..0xaa58  (29 bytes)
DATA_enemigos_AA3B:
	defb 005h,005h,063h,018h,000h,040h,005h,083h,080h,001h,018h,005h,093h,028h,000h,030h	; aa3b  ..c..@.......(.0
	defb 005h,0b3h,098h,001h,030h,00bh,073h,0d8h,082h,020h,028h,073h,0b0h	; aa4b  ....0.s.. (s.

; ----------------------------------------------------------------------
; DATOS enemigos_AA58: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xaa58..0xaa63  (11 bytes)
DATA_enemigos_AA58:
	defb 002h,004h,0bbh,040h,000h,050h,004h,0c3h,0b8h,000h,048h	; aa58  ...@.P....H

; ----------------------------------------------------------------------
; DATOS enemigos_AA63: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (7 bytes)
;   0xaa63..0xaa6a  (7 bytes)
DATA_enemigos_AA63:
	defb 002h,00ah,0c4h,020h,00ah,0c4h,040h	; aa63

; ----------------------------------------------------------------------
; DATOS enemigos_AA6A: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (13 bytes)
;   0xaa6a..0xaa77  (13 bytes)
DATA_enemigos_AA6A:
	defb 003h,001h,023h,038h,00ch,001h,023h,080h,008h,001h,023h,0c8h,014h	; aa6a  ..#8..#...#..

; ----------------------------------------------------------------------
; DATOS enemigos_AA77: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (4 bytes)
;   0xaa77..0xaa7b  (4 bytes)
DATA_enemigos_AA77:
	defb 001h,00ah,064h,050h	; aa77

; ----------------------------------------------------------------------
; DATOS enemigos_AA7B: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (19 bytes)
;   0xaa7b..0xaa8e  (19 bytes)
DATA_enemigos_AA7B:
	defb 006h,00ah,084h,030h,00ah,084h,070h,00ah,084h,0b0h,00ah,0c4h,050h,00ah,0c4h,090h	; aa7b  ...0..p.....P...
	defb 00ah,0c4h,0c0h	; aa8b

; ----------------------------------------------------------------------
; DATOS enemigos_AA8E: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (4 bytes)
;   0xaa8e..0xaa92  (4 bytes)
DATA_enemigos_AA8E:
	defb 001h,00ah,044h,020h	; aa8e

; ----------------------------------------------------------------------
; DATOS enemigos_AA92: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (4 bytes)
;   0xaa92..0xaa96  (4 bytes)
DATA_enemigos_AA92:
	defb 001h,00ah,044h,040h	; aa92

; ----------------------------------------------------------------------
; DATOS enemigos_AA96: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (5 bytes)
;   0xaa96..0xaa9b  (5 bytes)
DATA_enemigos_AA96:
	defb 001h,009h,054h,060h,001h	; aa96

; ----------------------------------------------------------------------
; DATOS enemigos_AA9B: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (33 bytes)
;   0xaa9b..0xaabc  (33 bytes)
DATA_enemigos_AA9B:
	defb 004h,00bh,04bh,058h,001h,068h,040h,04bh,018h,00bh,0b3h,018h,000h,068h,040h,04bh	; aa9b  ..KX.h@K.....h@K
	defb 018h,00bh,04bh,088h,081h,068h,040h,04bh,088h,00bh,0b3h,0c8h,080h,068h,040h,04bh	; aaab  ..K..h@K.....h@K
	defb 088h	; aabb

; ----------------------------------------------------------------------
; DATOS enemigos_AABC: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (26 bytes)
;   0xaabc..0xaad6  (26 bytes)
DATA_enemigos_AABC:
	defb 005h,005h,073h,098h,000h,028h,005h,083h,088h,001h,038h,005h,0b3h,050h,000h,020h	; aabc  ..s..(....8..P.
	defb 005h,0c3h,0d0h,001h,020h,005h,043h,0b8h,001h,050h	; aacc  .... .C..P

; ----------------------------------------------------------------------
; DATOS enemigos_AAD6: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (24 bytes)
;   0xaad6..0xaaee  (24 bytes)
DATA_enemigos_AAD6:
	defb 005h,005h,053h,088h,001h,020h,005h,053h,0a8h,000h,020h,004h,0c3h,0d8h,000h,028h	; aad6  ..S.. .S.. ....(
	defb 003h,0c3h,060h,003h,003h,0c3h,088h,004h	; aae6  ..`.....

; ----------------------------------------------------------------------
; DATOS enemigos_AAEE: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (18 bytes)
;   0xaaee..0xab00  (18 bytes)
DATA_enemigos_AAEE:
	defb 003h,00bh,093h,058h,083h,050h,020h,043h,038h,00bh,063h,088h,003h,020h,060h,063h	; aaee  ...X.P C8.c.. `c
	defb 068h,002h	; aafe

; ----------------------------------------------------------------------
; DATOS enemigos_AB00: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (7 bytes)
;   0xab00..0xab07  (7 bytes)
DATA_enemigos_AB00:
	defb 002h,00ah,044h,0c0h,00ah,0c4h,0c0h	; ab00

; ----------------------------------------------------------------------
; DATOS enemigos_AB07: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (4 bytes)
;   0xab07..0xab0b  (4 bytes)
DATA_enemigos_AB07:
	defb 001h,00ah,0c4h,0a0h	; ab07

; ----------------------------------------------------------------------
; DATOS enemigos_AB0B: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xab0b..0xab11  (6 bytes)
DATA_enemigos_AB0B:
	defb 001h,004h,083h,0c8h,000h,030h	; ab0b

; ----------------------------------------------------------------------
; DATOS enemigos_AB11: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (4 bytes)
;   0xab11..0xab15  (4 bytes)
DATA_enemigos_AB11:
	defb 001h,00ah,044h,0c0h	; ab11

; ----------------------------------------------------------------------
; DATOS enemigos_AB15: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xab15..0xab20  (11 bytes)
DATA_enemigos_AB15:
	defb 003h,009h,0c4h,060h,001h,00ah,044h,020h,00ah,044h,080h	; ab15  ...`..D .D.

; ----------------------------------------------------------------------
; DATOS enemigos_AB20: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (38 bytes)
;   0xab20..0xab46  (38 bytes)
DATA_enemigos_AB20:
	defb 005h,005h,0c3h,028h,000h,090h,00bh,053h,060h,001h,040h,028h,053h,038h,00bh,093h	; ab20  ...(...S`.@(S8..
	defb 038h,000h,040h,028h,053h,038h,00bh,053h,080h,081h,040h,028h,053h,080h,00bh,093h	; ab30  8.@(S8.S..@(S...
	defb 0a8h,080h,040h,028h,053h,080h	; ab40

; ----------------------------------------------------------------------
; DATOS enemigos_AB46: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (18 bytes)
;   0xab46..0xab58  (18 bytes)
DATA_enemigos_AB46:
	defb 005h,005h,0c3h,048h,000h,090h,006h,05bh,030h,006h,063h,050h,006h,063h,0b0h,006h	; ab46  ...H...[0.cP.c..
	defb 05bh,0d0h	; ab56

; ----------------------------------------------------------------------
; DATOS enemigos_AB58: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xab58..0xab5e  (6 bytes)
DATA_enemigos_AB58:
	defb 001h,004h,06bh,048h,001h,030h	; ab58

; ----------------------------------------------------------------------
; DATOS enemigos_AB5E: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xab5e..0xab64  (6 bytes)
DATA_enemigos_AB5E:
	defb 001h,004h,07bh,048h,001h,040h	; ab5e

; ----------------------------------------------------------------------
; DATOS enemigos_AB64: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (7 bytes)
;   0xab64..0xab6b  (7 bytes)
DATA_enemigos_AB64:
	defb 002h,00ch,0b3h,098h,00ch,0b3h,0b8h	; ab64

; ----------------------------------------------------------------------
; DATOS enemigos_AB6B: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (11 bytes)
;   0xab6b..0xab76  (11 bytes)
DATA_enemigos_AB6B:
	defb 002h,005h,04bh,048h,000h,030h,004h,0c3h,028h,000h,058h	; ab6b  ..KH.0..(.X

; ----------------------------------------------------------------------
; DATOS enemigos_AB76: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (16 bytes)
;   0xab76..0xab86  (16 bytes)
DATA_enemigos_AB76:
	defb 003h,004h,083h,030h,000h,028h,005h,083h,048h,000h,010h,005h,0c3h,028h,000h,030h	; ab76  ...0.(..H....(.0

; ----------------------------------------------------------------------
; DATOS enemigos_AB86: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (21 bytes)
;   0xab86..0xab9b  (21 bytes)
DATA_enemigos_AB86:
	defb 004h,004h,0c3h,0d8h,000h,078h,004h,04bh,030h,001h,078h,005h,0c3h,048h,000h,030h	; ab86  .....x.K0.x..H.0
	defb 005h,0c3h,088h,000h,030h	; ab96

; ----------------------------------------------------------------------
; DATOS enemigos_AB9B: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (10 bytes)
;   0xab9b..0xaba5  (10 bytes)
DATA_enemigos_AB9B:
	defb 003h,006h,053h,0d0h,006h,05bh,0b8h,006h,063h,0a0h	; ab9b  ..S..[..c.

; ----------------------------------------------------------------------
; DATOS enemigos_ABA5: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (19 bytes)
;   0xaba5..0xabb8  (19 bytes)
DATA_enemigos_ABA5:
	defb 003h,00bh,0a3h,088h,003h,028h,060h,0a3h,078h,005h,053h,068h,000h,030h,005h,073h	; aba5  .....(`.x.Sh.0.s
	defb 0d8h,001h,030h	; abb5

; ----------------------------------------------------------------------
; DATOS enemigos_ABB8: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (13 bytes)
;   0xabb8..0xabc5  (13 bytes)
DATA_enemigos_ABB8:
	defb 003h,004h,0c3h,048h,000h,078h,00ah,044h,0c0h,003h,093h,0d0h,002h	; abb8  ...H.x.D.....

; ----------------------------------------------------------------------
; DATOS enemigos_ABC5: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (14 bytes)
;   0xabc5..0xabd3  (14 bytes)
DATA_enemigos_ABC5:
	defb 002h,005h,093h,038h,000h,020h,00bh,043h,0c8h,003h,040h,020h,043h,0c8h	; abc5  ...8. .C..@ C.

; ----------------------------------------------------------------------
; DATOS enemigos_ABD3: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xabd3..0xabd9  (6 bytes)
DATA_enemigos_ABD3:
	defb 001h,005h,0c3h,038h,000h,070h	; abd3

; ----------------------------------------------------------------------
; DATOS enemigos_ABD9: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (12 bytes)
;   0xabd9..0xabe5  (12 bytes)
DATA_enemigos_ABD9:
	defb 003h,005h,073h,030h,000h,020h,00ah,064h,080h,00ah,0c4h,020h	; abd9  ..s0. .d...

; ----------------------------------------------------------------------
; DATOS enemigos_ABE5: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (26 bytes)
;   0xabe5..0xabff  (26 bytes)
DATA_enemigos_ABE5:
	defb 005h,00bh,093h,068h,003h,030h,048h,093h,068h,00bh,0c3h,0b0h,002h,030h,048h,093h	; abe5  ...h.0H.h....0H.
	defb 068h,008h,05bh,050h,008h,05bh,080h,008h,05bh,0b0h	; abf5  h.[P.[..[.

; ----------------------------------------------------------------------
; DATOS enemigos_ABFF: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (9 bytes)
;   0xabff..0xac08  (9 bytes)
DATA_enemigos_ABFF:
	defb 002h,00ah,044h,0c0h,005h,06bh,070h,000h,020h	; abff  ..D..kp.

; ----------------------------------------------------------------------
; DATOS enemigos_AC08: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xac08..0xac0e  (6 bytes)
DATA_enemigos_AC08:
	defb 001h,005h,0c3h,038h,000h,050h	; ac08

; ----------------------------------------------------------------------
; DATOS enemigos_AC0E: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (13 bytes)
;   0xac0e..0xac1b  (13 bytes)
DATA_enemigos_AC0E:
	defb 004h,005h,05bh,0c8h,001h,060h,00ah,064h,080h,00ah,0c4h,0b0h,002h	; ac0e  ..[..`.d.....

; ----------------------------------------------------------------------
; DATOS enemigos_AC1B: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (7 bytes)
;   0xac1b..0xac22  (7 bytes)
DATA_enemigos_AC1B:
	defb 002h,00ch,0b3h,038h,00ch,0b3h,0c8h	; ac1b

; ----------------------------------------------------------------------
; DATOS enemigos_AC22: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (12 bytes)
;   0xac22..0xac2e  (12 bytes)
DATA_enemigos_AC22:
	defb 003h,00ch,0b3h,040h,00ch,0b3h,0c0h,005h,093h,038h,000h,090h	; ac22  ...@.....8..

; ----------------------------------------------------------------------
; DATOS enemigos_AC2E: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (16 bytes)
;   0xac2e..0xac3e  (16 bytes)
DATA_enemigos_AC2E:
	defb 003h,005h,0b3h,050h,001h,028h,005h,0b3h,060h,000h,028h,005h,0b3h,0b8h,001h,020h	; ac2e  ...P.(..`.(....

; ----------------------------------------------------------------------
; DATOS enemigos_AC3E: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (4 bytes)
;   0xac3e..0xac42  (4 bytes)
DATA_enemigos_AC3E:
	defb 001h,00ah,044h,060h	; ac3e

; ----------------------------------------------------------------------
; DATOS enemigos_AC42: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (7 bytes)
;   0xac42..0xac49  (7 bytes)
DATA_enemigos_AC42:
	defb 002h,00ah,044h,020h,00ah,0c4h,070h	; ac42

; ----------------------------------------------------------------------
; DATOS enemigos_AC49: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (22 bytes)
;   0xac49..0xac5f  (22 bytes)
DATA_enemigos_AC49:
	defb 003h,005h,0c3h,068h,000h,030h,00bh,053h,070h,003h,040h,038h,053h,050h,00bh,043h	; ac49  ...h.0.Sp.@8SP.C
	defb 0a8h,082h,070h,040h,043h,098h	; ac59

; ----------------------------------------------------------------------
; DATOS enemigos_AC5F: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (9 bytes)
;   0xac5f..0xac68  (9 bytes)
DATA_enemigos_AC5F:
	defb 002h,005h,043h,050h,001h,020h,00ah,034h,0a0h	; ac5f  ..CP. .4.

; ----------------------------------------------------------------------
; DATOS enemigos_AC68: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (14 bytes)
;   0xac68..0xac76  (14 bytes)
DATA_enemigos_AC68:
	defb 003h,005h,073h,078h,001h,040h,005h,063h,098h,000h,050h,00ah,0c4h,020h	; ac68  ..sx.@.c..P..

; ----------------------------------------------------------------------
; DATOS enemigos_AC76: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (21 bytes)
;   0xac76..0xac8b  (21 bytes)
DATA_enemigos_AC76:
	defb 006h,00ch,06bh,030h,00ch,06bh,050h,004h,07bh,0a8h,000h,030h,00ah,0c4h,080h,00ah	; ac76  ..k0.kP.{..0....
	defb 0c4h,0a0h,00ah,0c4h,0c0h	; ac86

; ----------------------------------------------------------------------
; DATOS enemigos_AC8B: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (21 bytes)
;   0xac8b..0xaca0  (21 bytes)
DATA_enemigos_AC8B:
	defb 004h,004h,0c3h,038h,000h,078h,004h,0c3h,068h,000h,038h,004h,05bh,098h,001h,040h	; ac8b  ...8.x..h.8.[..@
	defb 004h,07bh,0c8h,000h,030h	; ac9b

; ----------------------------------------------------------------------
; DATOS enemigos_ACA0: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xaca0..0xaca6  (6 bytes)
DATA_enemigos_ACA0:
	defb 001h,005h,053h,040h,000h,058h	; aca0

; ----------------------------------------------------------------------
; DATOS enemigos_ACA6: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (4 bytes)
;   0xaca6..0xacaa  (4 bytes)
DATA_enemigos_ACA6:
	defb 001h,00ah,044h,080h	; aca6

; ----------------------------------------------------------------------
; DATOS enemigos_ACAA: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (13 bytes)
;   0xacaa..0xacb7  (13 bytes)
DATA_enemigos_ACAA:
	defb 004h,00ah,074h,080h,00ah,074h,0a0h,00ah,074h,0c0h,00ah,0c4h,080h	; acaa  ..t..t..t....

; ----------------------------------------------------------------------
; DATOS enemigos_ACB7: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (4 bytes)
;   0xacb7..0xacbb  (4 bytes)
DATA_enemigos_ACB7:
	defb 001h,00ah,044h,0c0h	; acb7

; ----------------------------------------------------------------------
; DATOS enemigos_ACBB: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (4 bytes)
;   0xacbb..0xacbf  (4 bytes)
DATA_enemigos_ACBB:
	defb 001h,00ah,084h,080h	; acbb

; ----------------------------------------------------------------------
; DATOS enemigos_ACBF: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (16 bytes)
;   0xacbf..0xaccf  (16 bytes)
DATA_enemigos_ACBF:
	defb 005h,00ah,044h,020h,00ah,044h,0a0h,00ah,044h,0c0h,00ah,084h,020h,00ah,0c4h,020h	; acbf  ..D .D..D... ..

; ----------------------------------------------------------------------
; DATOS enemigos_ACCF: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (7 bytes)
;   0xaccf..0xacd6  (7 bytes)
DATA_enemigos_ACCF:
	defb 002h,00ah,044h,020h,00ah,044h,040h	; accf

; ----------------------------------------------------------------------
; DATOS enemigos_ACD6: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (12 bytes)
;   0xacd6..0xace2  (12 bytes)
DATA_enemigos_ACD6:
	defb 002h,00bh,093h,088h,083h,040h,050h,053h,048h,00ah,044h,0c0h	; acd6  .....@PSH.D.

; ----------------------------------------------------------------------
; DATOS enemigos_ACE2: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (17 bytes)
;   0xace2..0xacf3  (17 bytes)
DATA_enemigos_ACE2:
	defb 004h,00ch,073h,088h,00ch,073h,0a8h,005h,073h,048h,000h,020h,005h,0c3h,048h,000h	; ace2  ..s..s..sH. ..H.
	defb 070h	; acf2

; ----------------------------------------------------------------------
; DATOS enemigos_ACF3: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (7 bytes)
;   0xacf3..0xacfa  (7 bytes)
DATA_enemigos_ACF3:
	defb 002h,00ah,084h,040h,00ah,084h,0a0h	; acf3

; ----------------------------------------------------------------------
; DATOS enemigos_ACFA: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (22 bytes)
;   0xacfa..0xad10  (22 bytes)
DATA_enemigos_ACFA:
	defb 005h,00ch,063h,058h,00ch,073h,0a8h,004h,05bh,048h,001h,060h,005h,0bbh,0c8h,001h	; acfa  ..cX.s..[H.`....
	defb 070h,005h,063h,068h,000h,030h	; ad0a

; ----------------------------------------------------------------------
; DATOS enemigos_AD10: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (12 bytes)
;   0xad10..0xad1c  (12 bytes)
DATA_enemigos_AD10:
	defb 003h,005h,083h,060h,000h,040h,00ah,064h,040h,00ah,064h,0c0h	; ad10  ...`.@.d@.d.

; ----------------------------------------------------------------------
; DATOS enemigos_AD1C: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xad1c..0xad22  (6 bytes)
DATA_enemigos_AD1C:
	defb 001h,005h,083h,0a8h,000h,030h	; ad1c

; ----------------------------------------------------------------------
; DATOS enemigos_AD22: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (6 bytes)
;   0xad22..0xad28  (6 bytes)
DATA_enemigos_AD22:
	defb 001h,005h,053h,050h,000h,020h	; ad22

; ----------------------------------------------------------------------
; DATOS enemigos_AD28: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (10 bytes)
;   0xad28..0xad32  (10 bytes)
DATA_enemigos_AD28:
	defb 002h,004h,083h,0b0h,000h,038h,003h,093h,040h,004h	; ad28  .....8..@.

; ----------------------------------------------------------------------
; DATOS enemigos_AD32: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (30 bytes)
;   0xad32..0xad50  (30 bytes)
DATA_enemigos_AD32:
	defb 004h,00bh,07bh,038h,001h,050h,018h,04bh,020h,00bh,093h,08bh,013h,028h,048h,073h	; ad32  ..{8.P.K ....(Hs
	defb 050h,00bh,0bbh,0d0h,012h,038h,030h,083h,0b8h,005h,043h,058h,000h,050h	; ad42  P....80...CX.P

; ----------------------------------------------------------------------
; DATOS enemigos_AD50: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (24 bytes)
;   0xad50..0xad68  (24 bytes)
DATA_enemigos_AD50:
	defb 005h,004h,093h,0c0h,000h,028h,005h,0cbh,0b0h,001h,048h,005h,0abh,058h,001h,030h	; ad50  .....(....H..X.0
	defb 005h,093h,0a0h,001h,038h,00ah,044h,060h	; ad60  ....8.D`

; ----------------------------------------------------------------------
; DATOS enemigos_AD68: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (24 bytes)
;   0xad68..0xad80  (24 bytes)
DATA_enemigos_AD68:
	defb 004h,00bh,043h,048h,003h,020h,018h,043h,048h,004h,0c3h,028h,000h,078h,004h,07bh	; ad68  ..CH. .CH..(.x.{
	defb 098h,000h,030h,005h,083h,088h,001h,018h	; ad78  ..0.....

; ----------------------------------------------------------------------
; DATOS enemigos_AD80: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (16 bytes)
;   0xad80..0xad90  (16 bytes)
DATA_enemigos_AD80:
	defb 003h,005h,093h,060h,000h,020h,005h,093h,0b0h,001h,020h,005h,0c3h,048h,000h,070h	; ad80  ...`. .... ..H.p

; ----------------------------------------------------------------------
; DATOS enemigos_AD90: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (14 bytes)
;   0xad90..0xad9e  (14 bytes)
DATA_enemigos_AD90:
	defb 003h,005h,083h,028h,000h,038h,005h,083h,0d0h,001h,050h,00ah,044h,060h	; ad90  ...(.8....P.D`

; ----------------------------------------------------------------------
; DATOS enemigos_AD9E: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (7 bytes)
;   0xad9e..0xada5  (7 bytes)
DATA_enemigos_AD9E:
	defb 002h,00ah,074h,040h,00ah,074h,060h	; ad9e

; ----------------------------------------------------------------------
; DATOS enemigos_ADA5: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (10 bytes)
;   0xada5..0xadaf  (10 bytes)
DATA_enemigos_ADA5:
	defb 003h,00ah,054h,0b0h,00ah,054h,0d0h,00ah,0c4h,010h	; ada5  ..T..T....

; ----------------------------------------------------------------------
; DATOS enemigos_ADAF: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (15 bytes)
;   0xadaf..0xadbe  (15 bytes)
DATA_enemigos_ADAF:
	defb 004h,00ch,063h,058h,00ch,063h,068h,005h,06bh,088h,000h,020h,00ah,044h,020h	; adaf  ..cX.ch.k.. .D

; ----------------------------------------------------------------------
; DATOS enemigos_ADBE: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (29 bytes)
;   0xadbe..0xaddb  (29 bytes)
DATA_enemigos_ADBE:
	defb 006h,004h,07bh,0a8h,000h,020h,004h,0c3h,038h,000h,030h,005h,083h,048h,000h,050h	; adbe  ..{.. ..8.0..H.P
	defb 005h,053h,078h,000h,010h,003h,093h,018h,001h,003h,0a3h,018h,002h	; adce  .Sx..........

; ----------------------------------------------------------------------
; DATOS enemigos_ADDB: [n] y n x [tipo][Y][X] y lo que lea cada tipo
;   (p01:77A0); lo leen p01:774B (1 bytes)
;   0xaddb..0xaddc  (1 bytes)
DATA_enemigos_ADDB:
	defb 000h	; addb

; ----------------------------------------------------------------------
; DATOS sprites_de_enemigo: 13 palabras: los patrones de sprite de cada tipo
;   de enemigo 1-13 (p15:ADDA[tipo]; 0 en los 8, 9 y 10, que p00:538C se
;   salta); lo leen p00:5396 (26 bytes)
;   0xaddc..0xadf6  (26 bytes)
DATA_sprites_de_enemigo:
	defb 0a8h,0b3h	; addc
	defb 0f6h,0adh	; adde
	defb 064h,0b3h	; ade0
	defb 0deh,0b1h	; ade2
	defb 0ddh,0b2h	; ade4
	defb 055h,0b2h	; ade6
	defb 021h,0b3h	; ade8
	defb 000h,000h	; adea
	defb 000h,000h	; adec
	defb 000h,000h	; adee
	defb 0ddh,0b2h	; adf0
	defb 099h,0b2h	; adf2
	defb 046h,0b5h	; adf4

; ----------------------------------------------------------------------
; DATOS sprites_tipo_2: [direccion de VRAM] y RLE (p00:4926) con los patrones
;   del enemigo de tipo 2; lo leen p00:5396 (1000 bytes)
;   0xadf6..0xb1de  (1000 bytes)
DATA_sprites_tipo_2:
	defb 080h,0fah,003h,000h,09dh,003h,007h,00ah,015h,035h,03eh,037h,04fh,052h,077h,0bbh	; adf6  .........5>7ORw.
	defb 0bbh,05fh,00fh,030h,06ch,09fh,06bh,0fdh,0bdh,0f2h,0aah,0e5h,0d4h,079h,023h,0d5h	; ae06  ._.0l.k......y#.
	defb 02fh,068h,003h,000h,0adh,003h,005h,00fh,01eh,02eh,03dh,03fh,07ah,06fh,06ah,0f7h	; ae16  /h........=?zoj.
	defb 0dfh,07fh,00fh,03fh,07fh,0e1h,094h,002h,042h,00dh,055h,01ah,0efh,0beh,0fch,0eah	; ae26  ...?....B.U.....
	defb 0f0h,0f7h,0f0h,0bch,06fh,093h,0c9h,047h,08ah,084h,055h,00ch,0a6h,074h,0efh,018h	; ae36  ....o..G..U..t..
	defb 046h,023h,003h,000h,09dh,0c0h,0a0h,0d0h,060h,038h,054h,06ah,01ah,016h,011h,075h	; ae46  F#......`8Tj...u
	defb 02dh,063h,0f0h,04ch,093h,0ech,037h,0bfh,07dh,07bh,0fah,0ffh,05dh,08fh,01fh,0efh	; ae56  -c.L..7.}{..]...
	defb 0b9h,0fch,003h,000h,0b2h,0c0h,0e0h,030h,090h,0d8h,0fch,0b6h,0f6h,0fah,0ffh,0fbh	; ae66  .......0........
	defb 0fbh,0ffh,05dh,0dfh,08ch,0ach,0c7h,057h,06dh,07bh,05fh,027h,03bh,009h,006h,001h	; ae76  ..]....Wm{_'....
	defb 000h,000h,0e5h,090h,084h,0e5h,0e7h,0fch,0feh,01fh,047h,082h,0e7h,0fdh,0efh,0c3h	; ae86  ..........G.....
	defb 038h,007h,06fh,0afh,0ffh,0dfh,0ffh,003h,07fh,08eh,076h,03bh,03fh,00fh,007h,001h	; ae96  8.o.......v.?...
	defb 000h,000h,0fah,0efh,0fbh,0dbh,0ffh,07fh,003h,0ffh,082h,07fh,0dfh,003h,0ffh,0a4h	; aea6  ................
	defb 03fh,007h,040h,00ch,085h,0c1h,03ah,011h,035h,06bh,0cfh,0feh,0e9h,043h,09eh,0f2h	; aeb6  ?.@...:.5k...C..
	defb 06fh,080h,0f7h,0fdh,0fdh,059h,0dah,032h,0e4h,0e8h,0c8h,0f0h,0b0h,020h,040h,080h	; aec6  o....Y.2..... @.
	defb 000h,000h,0ffh,0f7h,005h,0ffh,082h,0feh,0f7h,005h,0ffh,090h,0efh,080h,0ffh,0ffh	; aed6  ................
	defb 0fbh,0ffh,0f6h,0feh,07ch,0d8h,0f8h,0f0h,0f0h,0e0h,0c0h,080h,003h,000h,0a6h,001h	; aee6  ....|...........
	defb 006h,005h,00dh,017h,017h,02eh,03ch,03dh,058h,048h,058h,09dh,0b7h,0bdh,01eh,0f3h	; aef6  ......<=XHX.....
	defb 0c0h,0e3h,0dfh,07fh,0b2h,0f3h,07fh,079h,079h,0e0h,0e0h,0fdh,0d0h,099h,000h,001h	; af06  .......yy.......
	defb 007h,007h,00eh,019h,01fh,003h,03fh,003h,07fh,003h,0ffh,085h,01eh,0fdh,0ffh,0bch	; af16  ......?.........
	defb 0efh,003h,0ffh,0d5h,0dfh,0ffh,0f7h,0ffh,0ffh,0f2h,0ffh,0feh,060h,09ch,073h,0fbh	; af26  ............`.s.
	defb 0e5h,097h,0ffh,0f6h,027h,0aeh,0dbh,00ch,0c8h,066h,051h,07ah,000h,000h,080h,0c0h	; af36  ....'....fQz....
	defb 020h,0d0h,038h,0d8h,0e8h,0b4h,0f6h,0eah,07dh,06dh,099h,0f9h,060h,0fch,0bfh,0e7h	; af46   .8.....}m..`...
	defb 0dfh,0ebh,0feh,0ebh,0fch,0f5h,0fch,0fbh,03fh,09dh,0aeh,085h,000h,000h,080h,040h	; af56  ........?......@
	defb 0e0h,0f0h,0e8h,038h,018h,04ch,00eh,016h,087h,097h,067h,00fh,0b7h,06fh,066h,032h	; af66  ...8.L....g..of2
	defb 057h,053h,07bh,04dh,027h,013h,00eh,006h,001h,003h,000h,095h,00ch,089h,0d0h,070h	; af76  WS{M'..........p
	defb 092h,046h,090h,0ech,0d7h,0dfh,0e7h,03fh,09eh,043h,031h,00fh,0ffh,07fh,07fh,03fh	; af86  .F.....?.C1....?
	defb 07eh,003h,07fh,085h,03fh,01fh,00fh,007h,001h,003h,000h,004h,0ffh,0a9h,0fdh,0ffh	; af96  ~...?...........
	defb 0ffh,07fh,0bfh,0ffh,07fh,0ffh,0efh,07fh,03fh,00fh,01ch,019h,09ch,029h,032h,05fh	; afa6  ........?....)2_
	defb 0d4h,090h,000h,0a3h,0e2h,03dh,046h,069h,08eh,0f0h,0dbh,035h,007h,00bh,056h,0e6h	; afb6  .....=Fi...5..V.
	defb 06ch,03ch,038h,068h,0d0h,0a0h,080h,003h,000h,09dh,0e3h,0e7h,0e3h,0d7h,0ffh,0beh	; afc6  l<8h............
	defb 03bh,07fh,0ffh,0fdh,0ffh,0ffh,0f9h,097h,0feh,0f0h,02dh,0cbh,0f9h,0f5h,0eah,03ah	; afd6  ..........-....:
	defb 0b4h,0f4h,0d8h,098h,030h,0e0h,080h,005h,000h,0aah,001h,002h,004h,00dh,00fh,013h	; afe6  ....0...........
	defb 017h,027h,04ch,05bh,09ah,09fh,0bfh,0efh,001h,0f6h,04fh,079h,0c2h,097h,07fh,0f3h	; aff6  .'L[......Oy....
	defb 0d6h,0ach,088h,05ch,083h,0a1h,030h,002h,000h,000h,001h,003h,007h,00fh,00fh,01fh	; b006  ...\..0.........
	defb 01bh,03eh,07fh,06fh,004h,0ffh,082h,001h,0f7h,005h,0ffh,082h,0efh,07fh,005h,0ffh	; b016  .>.o............
	defb 0a4h,0efh,0ffh,0e0h,01ch,0c3h,0f7h,0bfh,0e3h,040h,0e2h,0f8h,07fh,03fh,0e7h,0a7h	; b026  .........@...?..
	defb 021h,001h,0a7h,000h,000h,080h,060h,090h,0fch,0e4h,07ah,0deh,0beh,0eah,0f3h,031h	; b036  !.....`...z....1
	defb 031h,0fbh,0bah,0e0h,0fch,008h,0ffh,0a3h,0feh,0ffh,0dbh,0dfh,0ffh,05fh,000h,000h	; b046  1............_..
	defb 080h,0e0h,0f0h,0dch,0dch,0eeh,0feh,0f6h,0feh,0efh,0ffh,0ffh,0f5h,0f6h,0c6h,0b4h	; b056  ................
	defb 0aeh,088h,068h,058h,056h,02ah,01ch,006h,00bh,005h,003h,003h,000h,09dh,0c4h,060h	; b066  ..hXV*.........`
	defb 018h,0f7h,02fh,065h,030h,02ah,021h,071h,0e2h,093h,0c9h,0f6h,03dh,00fh,0ffh,0dfh	; b076  ../e0*!q....=...
	defb 0dfh,0ffh,05fh,06fh,06dh,03fh,01bh,009h,00ch,007h,003h,003h,000h,0adh,03fh,09fh	; b086  .._om?........?.
	defb 0f7h,0f8h,0f0h,0bah,0ffh,0dfh,0deh,09eh,0fdh,0ech,037h,0c9h,032h,00fh,016h,0f4h	; b096  ..........7.2...
	defb 0a3h,0c4h,09eh,02bh,0a7h,045h,0cfh,0bdh,0bfh,0d6h,0f9h,036h,00ch,0f0h,0fah,0ddh	; b0a6  ...+.E.....6....
	defb 0ddh,0eeh,04ah,0f2h,0ech,07ch,0ach,0a8h,050h,0e0h,0c0h,003h,000h,09dh,0efh,00fh	; b0b6  ..J..|..P.......
	defb 05fh,03fh,07dh,0f7h,058h,0bah,030h,042h,040h,029h,087h,0feh,0fch,0f0h,0feh,0fbh	; b0c6  _?}.X.0B@)......
	defb 0efh,056h,0f6h,05eh,0fch,0bch,074h,078h,0f0h,0a0h,0c0h,006h,000h,09dh,001h,005h	; b0d6  .V.^..tx........
	defb 00bh,016h,01ch,03ch,036h,067h,06ah,0d0h,0e0h,0ach,0dbh,00fh,071h,096h,062h,0bch	; b0e6  ...<6gj.....q.b.
	defb 047h,0c5h,000h,009h,02bh,0fah,04ch,094h,039h,098h,038h,003h,000h,0adh,001h,007h	; b0f6  G...+.L.9.8.....
	defb 00ch,019h,01bh,02fh,02dh,05ch,057h,0afh,09fh,0d3h,0b4h,00fh,07fh,0e9h,09fh,0ffh	; b106  .../-\W.........
	defb 0ffh,0bfh,0ffh,0feh,0dch,07dh,0ffh,0ebh,0c7h,0e7h,0c7h,0f0h,08ch,0c2h,079h,0fch	; b116  .....}........y.
	defb 0e7h,0fbh,0ebh,037h,009h,062h,049h,00eh,00bh,091h,030h,003h,000h,099h,080h,060h	; b126  ...7.bI...0....`
	defb 070h,0c8h,0e4h,0b2h,0deh,0cah,0eah,04ch,066h,0f6h,0edh,0f0h,0fch,0feh,0f7h,0ffh	; b136  p......Lf.......
	defb 0feh,0ffh,0fdh,0feh,0ffh,0ffh,0bfh,004h,0ffh,003h,000h,085h,080h,0e0h,0f0h,0f8h	; b146  ................
	defb 0fch,003h,0feh,0edh,07eh,0fch,0feh,0feh,0ffh,09fh,099h,0b6h,0beh,057h,06fh,02dh	; b156  ....~........Wo-
	defb 017h,01bh,01ch,00bh,004h,003h,001h,000h,000h,05eh,08ah,066h,013h,030h,0dbh,075h	; b166  .........^.f.0.u
	defb 0e4h,06fh,0ffh,0e9h,0a7h,0dfh,0ceh,039h,006h,0f0h,0e6h,0e9h,0e1h,068h,070h,032h	; b176  .o.....9.....hp2
	defb 018h,01ch,017h,00fh,007h,002h,001h,000h,000h,0a1h,075h,0b9h,0fch,0dfh,03fh,0afh	; b186  ..........u...?.
	defb 03fh,0d7h,07fh,0d7h,0fbh,0e7h,0fdh,03fh,006h,099h,00bh,0bfh,007h,007h,09eh,09eh	; b196  ?......?........
	defb 0feh,0cfh,04dh,0feh,0fbh,0c7h,003h,0cfh,078h,0bdh,0edh,0b9h,01ah,012h,01ah,0bch	; b1a6  ..M.....x.......
	defb 03ch,074h,0e8h,0e8h,0b0h,0a0h,060h,080h,000h,07fh,0ffh,04fh,0ffh,0ffh,0efh,0ffh	; b1b6  <t....`....O....
	defb 0fbh,003h,0ffh,085h,0f7h,03dh,0ffh,0bfh,078h,003h,0ffh,003h,0feh,003h,0fch,087h	; b1c6  .....=..x.......
	defb 0f8h,098h,070h,0e0h,0e0h,080h,000h,000h	; b1d6  ..p.....

; ----------------------------------------------------------------------
; DATOS sprites_tipo_4: [direccion de VRAM] y RLE (p00:4926) con los patrones
;   del enemigo de tipo 4; lo leen p00:5396 (119 bytes)
;   0xb1de..0xb255  (119 bytes)
DATA_sprites_tipo_4:
	defb 000h,0ffh,006h,000h,08ah,00ch,017h,03bh,072h,0a5h,0d9h,090h,0ffh,07fh,0ffh,006h	; b1de  ........r.......
	defb 000h,08ah,01ch,0ffh,0ebh,0e0h,0d5h,0a6h,008h,0eah,0f2h,0eah,006h,000h,08ah,00ch	; b1ee  ................
	defb 01fh,03eh,04dh,0dfh,0feh,0efh,0bbh,07fh,0d5h,006h,000h,0cah,01ch,0f3h,01dh,0ffh	; b1fe  .>M.............
	defb 0bfh,0feh,0f4h,076h,0feh,0b6h,08ah,05fh,01ch,021h,054h,06bh,046h,070h,06fh,035h	; b20e  ...v..._.!TkFpo5
	defb 03ah,033h,062h,0b5h,0a6h,07bh,044h,084h,00eh,0b7h,0c2h,0a2h,009h,060h,0a4h,02dh	; b21e  :3b..{D......`.-
	defb 099h,019h,03ah,0a5h,029h,0deh,0ffh,05fh,01fh,03fh,07fh,05ch,079h,05fh,05eh,02eh	; b22e  ..:.).._.?.\y_^.
	defb 027h,02eh,07fh,0ceh,0ddh,07bh,0fch,0fch,0f6h,0cdh,03fh,05fh,0f7h,0beh,07eh,0fbh	; b23e  '....{....?_..~.
	defb 077h,0f7h,0fch,07bh,0f7h,0deh,000h	; b24e

; ----------------------------------------------------------------------
; DATOS sprites_tipo_6: [direccion de VRAM] y RLE (p00:4926) con los patrones
;   del enemigo de tipo 6; lo leen p00:5396 (68 bytes)
;   0xb255..0xb299  (68 bytes)
DATA_sprites_tipo_6:
	defb 0c0h,0feh,0c0h,00fh,07eh,0edh,0bfh,0f5h,07eh,0dfh,0b3h,0e3h,0a2h,053h,053h,028h	; b255  ....~...~....SS(
	defb 018h,000h,000h,038h,0feh,0c9h,0f5h,0dbh,0beh,0fah,0cdh,0c5h,085h,04ah,044h,0a0h	; b265  ...8.........JD.
	defb 060h,000h,000h,00fh,069h,0deh,0f3h,0cfh,05fh,0beh,0f2h,0a2h,0e3h,073h,073h,038h	; b275  `...i..._....ss8
	defb 018h,000h,000h,038h,0c6h,0bfh,0ffh,03fh,07eh,0feh,0cfh,0c7h,087h,0ceh,0c4h,0e0h	; b285  ...8...?~.......
	defb 060h,000h,000h,000h	; b295

; ----------------------------------------------------------------------
; DATOS sprites_tipo_12: [direccion de VRAM] y RLE (p00:4926) con los patrones
;   del enemigo de tipo 12; lo leen p00:5396 (68 bytes)
;   0xb299..0xb2dd  (68 bytes)
DATA_sprites_tipo_12:
	defb 0c0h,0feh,0a3h,00fh,03dh,060h,044h,05fh,07fh,03ah,038h,02ah,038h,02ah,03ah,03eh	; b299  ....=`D_.:8*8*:>
	defb 03bh,01eh,007h,0f0h,0fch,0eeh,072h,0fah,0aeh,04ch,0b4h,04ch,06ch,06ch,07ch,06ch	; b2a9  ......r..L.Lll|l
	defb 0bch,078h,0e0h,00fh,032h,05fh,003h,07fh,002h,03fh,091h,03dh,02fh,03dh,02dh,02fh	; b2b9  .x..2_...?.=/=-/
	defb 03fh,01dh,007h,0f0h,04ch,032h,0deh,0feh,0feh,0bch,0dch,0b4h,003h,094h,084h,0f4h	; b2c9  ?...L2..........
	defb 0fch,0b8h,0e0h,000h	; b2d9

; ----------------------------------------------------------------------
; DATOS sprites_tipo_5: [direccion de VRAM] y RLE (p00:4926) con los patrones
;   del enemigo de tipo 5; se solapan 2 bloques: (sprites_tipo_11 B2DD-B321);
;   lo leen p00:5396 (68 bytes)
;   0xb2dd..0xb321  (68 bytes)
DATA_sprites_tipo_5:
	defb 080h,0ffh,0c0h,03fh,0fdh,0f3h,083h,0ddh,0e7h,0e2h,0eah,0e4h,0e1h,0e0h,081h,092h	; b2dd  ...?............
	defb 050h,039h,004h,0fch,0ffh,07fh,0fbh,0c3h,03bh,0ddh,0edh,0cfh,0ffh,0fdh,0b9h,05bh	; b2ed  P9.............[
	defb 0bah,0fch,0e0h,03fh,0d2h,0adh,0fdh,0beh,0f9h,0bdh,0bfh,0fbh,0beh,0bfh,0feh,0ffh	; b2fd  ...?............
	defb 07fh,03eh,007h,0fch,00bh,085h,085h,03dh,0c7h,023h,07bh,037h,005h,087h,047h,0edh	; b30d  .>.....=.#{7..G.
	defb 04eh,01ch,020h,000h	; b31d

; ----------------------------------------------------------------------
; DATOS sprites_tipo_7: [direccion de VRAM] y RLE (p00:4926) con los patrones
;   del enemigo de tipo 7; lo leen p00:5396 (67 bytes)
;   0xb321..0xb364  (67 bytes)
DATA_sprites_tipo_7:
	defb 0c0h,0fdh,08ch,02fh,032h,018h,015h,03dh,02fh,03fh,03fh,017h,02fh,00bh,014h,004h	; b321  .../2..=/??./...
	defb 000h,08dh,064h,028h,0a8h,0dch,0d4h,0fch,0e8h,0fch,0f8h,068h,0f0h,0a0h,010h,003h	; b331  ..d(.......h....
	defb 000h,0a0h,010h,00dh,027h,02ah,002h,050h,000h,040h,068h,050h,034h,02bh,09fh,01fh	; b341  ....'*.P.@hP4+..
	defb 025h,000h,098h,0d4h,054h,020h,02ah,000h,014h,002h,004h,096h,00ch,05ch,0e8h,0f9h	; b351  %...T *......\..
	defb 0a0h,000h,000h	; b361

; ----------------------------------------------------------------------
; DATOS sprites_tipo_3: [direccion de VRAM] y RLE (p00:4926) con los patrones
;   del enemigo de tipo 3; lo leen p00:5396 (68 bytes)
;   0xb364..0xb3a8  (68 bytes)
DATA_sprites_tipo_3:
	defb 080h,0feh,002h,000h,0beh,001h,003h,00ch,00eh,016h,031h,079h,031h,016h,00eh,00ch	; b364  ..........1y1...
	defb 003h,001h,000h,000h,080h,0c0h,0e0h,098h,038h,034h,0c6h,0cfh,0c6h,034h,038h,098h	; b374  ........84...48.
	defb 0e0h,0c0h,080h,000h,000h,001h,003h,00fh,00bh,01fh,03fh,04fh,03fh,01fh,00bh,00fh	; b384  ..........?O?...
	defb 003h,001h,000h,000h,080h,040h,060h,0f8h,0e8h,0fch,0feh,079h,0feh,0fch,0e8h,0f8h	; b394  .....@`....y....
	defb 060h,040h,080h,000h	; b3a4

; ----------------------------------------------------------------------
; DATOS sprites_tipo_1: [direccion de VRAM] y RLE (p00:4926) con los patrones
;   del enemigo de tipo 1; lo leen p00:5396 (105 bytes)
;   0xb3a8..0xb411  (105 bytes)
DATA_sprites_tipo_1:
	defb 040h,0feh,084h,0ffh,01fh,007h,003h,00ch,000h,084h,0ffh,0f8h,0e0h,0c0h,00ch,000h	; b3a8  @...............
	defb 088h,01fh,00fh,007h,005h,007h,002h,002h,001h,008h,000h,082h,0f8h,0f0h,003h,0e0h	; b3b8  ................
	defb 002h,0c0h,081h,080h,00bh,000h,084h,002h,000h,001h,001h,01ch,000h,08ah,001h,003h	; b3c8  ................
	defb 003h,005h,005h,007h,004h,000h,002h,001h,006h,000h,083h,080h,0c0h,0c0h,004h,0e0h	; b3d8  ................
	defb 083h,0c0h,040h,080h,009h,000h,002h,002h,084h,000h,003h,003h,001h,00fh,000h,081h	; b3e8  ..@.............
	defb 080h,00ch,000h,088h,020h,004h,040h,00ah,08fh,027h,09fh,017h,007h,000h,089h,010h	; b3f8  .... .@..'......
	defb 000h,008h,020h,081h,0c8h,0f2h,0f0h,0e8h,000h	; b408  .. ......

; ----------------------------------------------------------------------
; DATOS patrones_b411: 128 bytes (4 sprites de 16x16) que p00:5421 copia a la
;   VRAM 0xFE00 si C no es cero; lo leen p00:5421 (128 bytes)
;   0xb411..0xb491  (128 bytes)
DATA_patrones_b411:
	defb 02fh,032h,018h,035h,03dh,02fh,03dh,037h,017h,02ch,00bh,004h,000h,028h,010h,000h	; b411  /2.5=/=7.,...(..
	defb 064h,02ch,0ach,0dch,0d4h,0fch,0ech,0fch,0ach,0e8h,0d0h,0a4h,018h,020h,008h,000h	; b421  d,........... ..
	defb 010h,00dh,027h,00ah,002h,050h,002h,048h,0a8h,053h,0b4h,07bh,07fh,057h,0efh,0ffh	; b431  ..'..P.H.S.{.W..
	defb 098h,0d0h,050h,020h,028h,000h,012h,000h,052h,014h,02ch,05ah,0e4h,0deh,0f7h,0ffh	; b441  ..P (...R.,Z....
	defb 02fh,032h,038h,01dh,035h,01fh,02fh,02bh,037h,032h,038h,018h,01dh,015h,02fh,026h	; b451  /28.5./+728.../&
	defb 064h,02ch,0ach,0dch,0d8h,0fch,074h,0f4h,04ch,01ch,0dch,0f8h,0d8h,0f4h,0e4h,0a4h	; b461  d,....t.L.......
	defb 010h,00dh,007h,022h,00ah,020h,010h,014h,008h,00dh,007h,027h,022h,02ah,010h,019h	; b471  ...". .....'"*..
	defb 098h,0d0h,050h,020h,024h,000h,088h,008h,0b0h,0e0h,020h,004h,024h,008h,018h,058h	; b481  ..P $..... .$..X

; ----------------------------------------------------------------------
; DATOS patrones_b491: 128 bytes (4 sprites de 16x16) que p00:5421 copia a la
;   VRAM 0xFE00 si C es cero; lo leen p00:5421 (128 bytes)
;   0xb491..0xb511  (128 bytes)
DATA_patrones_b491:
	defb 01dh,015h,02fh,026h,02fh,012h,038h,01dh,035h,01fh,025h,029h,010h,009h,020h,000h	; b491  ../&/.8.5.%).. .
	defb 0d8h,0f4h,0e4h,0a4h,06ch,02ch,0ach,0dch,0d8h,0fch,074h,0f4h,040h,010h,048h,000h	; b4a1  ....l,....t.@.H.
	defb 022h,02ah,010h,059h,010h,02dh,047h,022h,00ah,0a0h,01ah,016h,0afh,076h,05fh,0ffh	; b4b1  "*.Y.-G".....v_.
	defb 024h,008h,018h,058h,090h,0d1h,050h,021h,024h,002h,089h,00ah,0bch,0edh,0b6h,0ffh	; b4c1  $..X..P!$.......
	defb 01dh,015h,02fh,026h,02fh,032h,038h,01dh,035h,01fh,02fh,02bh,037h,032h,038h,018h	; b4d1  ../&/28.5./+728.
	defb 0d8h,0f4h,0e4h,0a4h,064h,02ch,0ach,0dch,0d8h,0fch,074h,0f4h,04ch,01ch,0dch,0f8h	; b4e1  ....d,....t.L...
	defb 022h,02ah,010h,019h,010h,00dh,007h,022h,00ah,020h,010h,014h,008h,00dh,007h,027h	; b4f1  "*.....". .....'
	defb 024h,008h,018h,058h,098h,0d0h,050h,020h,024h,000h,088h,008h,0b0h,0e0h,020h,004h	; b501  $..X..P $..... .

; ----------------------------------------------------------------------
; DATOS patrones_b511: RLE (p00:492C) de patrones de sprite a la VRAM 0xFFC0;
;   lo leen p00:53A0 (53 bytes)
;   0xb511..0xb546  (53 bytes)
DATA_patrones_b511:
	defb 086h,03fh,04fh,0b8h,0f0h,0e0h,0e0h,004h,0c0h,003h,080h,099h,0c0h,071h,03fh,0f8h	; b511  .?O..........q?.
	defb 04eh,036h,019h,005h,003h,005h,003h,005h,003h,005h,00bh,005h,02bh,056h,0fch,03fh	; b521  N6..........+V.?
	defb 070h,0c7h,08fh,09fh,09fh,004h,0bfh,004h,0ffh,085h,07fh,03fh,0f8h,0feh,0fah,00bh	; b531  p..........?....
	defb 0ffh,082h,0feh,0fch,000h	; b541

; ----------------------------------------------------------------------
; DATOS sprites_tipo_13: [direccion de VRAM] y RLE (p00:4926) con los patrones
;   del enemigo de tipo 13; lo leen p00:5396 (58 bytes)
;   0xb546..0xb580  (58 bytes)
DATA_sprites_tipo_13:
	defb 0c0h,0feh,083h,03fh,06dh,07bh,005h,05bh,08ah,07fh,03fh,02bh,03fh,02bh,01fh,015h	; b546  ...?m{.[..?+?+..
	defb 00fh,0fch,0eah,006h,012h,08bh,05ah,0fch,034h,0fch,034h,0f8h,068h,0f0h,03fh,052h	; b556  ......Z.4.4.h.?R
	defb 054h,005h,074h,08ah,050h,03fh,034h,03fh,034h,01fh,01ah,00fh,0fch,016h,006h,0feh	; b566  T.t.P?4?4.......
	defb 088h,0b6h,0fch,0ech,0fch,0ech,0f8h,0d8h,0f0h,000h	; b576  ..........

; ----------------------------------------------------------------------
; DATOS piezas_por_tipo: 13 palabras: la ventana de p15:B59A de cada tipo de
;   enemigo 1-13 (p15:B57E[tipo], p01:7709); lo leen p01:770F (26 bytes)
;   0xb580..0xb59a  (26 bytes)
DATA_piezas_por_tipo:
	defb 09ah,0b5h	; b580
	defb 0a2h,0b5h	; b582
	defb 0aah,0b5h	; b584
	defb 0b0h,0b5h	; b586
	defb 0b2h,0b5h	; b588
	defb 0b6h,0b5h	; b58a
	defb 0b8h,0b5h	; b58c
	defb 0c8h,0b5h	; b58e
	defb 0c8h,0b5h	; b590
	defb 0c8h,0b5h	; b592
	defb 0b2h,0b5h	; b594
	defb 0b4h,0b5h	; b596
	defb 0b4h,0b5h	; b598

; ----------------------------------------------------------------------
; DATOS piezas: 24 palabras: punteros a listas de piezas; cada tipo lee el de
;   (ix+0x10) desde su ventana (p01:7712); lo leen p01:770F (48 bytes)
;   0xb59a..0xb5ca  (48 bytes)
DATA_piezas:
	defb 0cah,0b5h	; b59a
	defb 0cfh,0b5h	; b59c
	defb 0d4h,0b5h	; b59e
	defb 0d9h,0b5h	; b5a0
	defb 0deh,0b5h	; b5a2
	defb 0efh,0b5h	; b5a4
	defb 000h,0b6h	; b5a6
	defb 011h,0b6h	; b5a8
	defb 022h,0b6h	; b5aa
	defb 027h,0b6h	; b5ac
	defb 02ch,0b6h	; b5ae
	defb 036h,0b6h	; b5b0
	defb 03fh,0b6h	; b5b2
	defb 044h,0b6h	; b5b4
	defb 044h,0b6h	; b5b6
	defb 049h,0b6h	; b5b8
	defb 05ah,0b6h	; b5ba
	defb 06bh,0b6h	; b5bc
	defb 07ch,0b6h	; b5be
	defb 08dh,0b6h	; b5c0
	defb 09eh,0b6h	; b5c2
	defb 0afh,0b6h	; b5c4
	defb 0c0h,0b6h	; b5c6
	defb 0d1h,0b6h	; b5c8

; ----------------------------------------------------------------------
; DATOS piezas_B5CA: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (5 bytes)
;   0xb5ca..0xb5cf  (5 bytes)
DATA_piezas_B5CA:
	defb 002h,0c8h,00bh,000h,000h	; b5ca

; ----------------------------------------------------------------------
; DATOS piezas_B5CF: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (5 bytes)
;   0xb5cf..0xb5d4  (5 bytes)
DATA_piezas_B5CF:
	defb 002h,0cch,00bh,0d0h,00dh	; b5cf

; ----------------------------------------------------------------------
; DATOS piezas_B5D4: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (5 bytes)
;   0xb5d4..0xb5d9  (5 bytes)
DATA_piezas_B5D4:
	defb 002h,0d4h,00bh,0d8h,00dh	; b5d4

; ----------------------------------------------------------------------
; DATOS piezas_B5D9: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (5 bytes)
;   0xb5d9..0xb5de  (5 bytes)
DATA_piezas_B5D9:
	defb 002h,0dch,00bh,000h,000h	; b5d9

; ----------------------------------------------------------------------
; DATOS piezas_B5DE: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb5de..0xb5ef  (17 bytes)
DATA_piezas_B5DE:
	defb 008h,050h,00dh,054h,04eh,058h,00dh,05ch,04eh,060h,00dh,064h,04eh,068h,00dh,06ch	; b5de  .P.TNX.\N`.dNh.l
	defb 04eh	; b5ee

; ----------------------------------------------------------------------
; DATOS piezas_B5EF: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb5ef..0xb600  (17 bytes)
DATA_piezas_B5EF:
	defb 008h,070h,00dh,074h,04eh,078h,00dh,07ch,04eh,080h,00dh,084h,04eh,088h,00dh,08ch	; b5ef  .p.tNx.|N...N...
	defb 04eh	; b5ff

; ----------------------------------------------------------------------
; DATOS piezas_B600: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb600..0xb611  (17 bytes)
DATA_piezas_B600:
	defb 008h,090h,00dh,094h,04eh,098h,00dh,09ch,04eh,0a0h,00dh,0a4h,04eh,0a8h,00dh,0ach	; b600  ....N...N...N...
	defb 04eh	; b610

; ----------------------------------------------------------------------
; DATOS piezas_B611: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb611..0xb622  (17 bytes)
DATA_piezas_B611:
	defb 008h,0b0h,00dh,0b4h,04eh,0b8h,00dh,0bch,04eh,0c0h,00dh,0c4h,04eh,0c8h,00dh,0cch	; b611  ....N...N...N...
	defb 04eh	; b621

; ----------------------------------------------------------------------
; DATOS piezas_B622: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (5 bytes)
;   0xb622..0xb627  (5 bytes)
DATA_piezas_B622:
	defb 002h,0d0h,007h,0d4h,04eh	; b622

; ----------------------------------------------------------------------
; DATOS piezas_B627: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (5 bytes)
;   0xb627..0xb62c  (5 bytes)
DATA_piezas_B627:
	defb 002h,030h,00dh,034h,00eh	; b627

; ----------------------------------------------------------------------
; DATOS piezas_B62C: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (5 bytes)
;   0xb62c..0xb631  (5 bytes)
DATA_piezas_B62C:
	defb 002h,038h,00dh,03ch,00eh	; b62c

; ----------------------------------------------------------------------
; DATOS resto_B631: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (5 bytes)
;   0xb631..0xb636  (5 bytes)
DATA_resto_B631:
	defb 002h,040h,00dh,044h,00eh	; b631

; ----------------------------------------------------------------------
; DATOS piezas_B636: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (9 bytes)
;   0xb636..0xb63f  (9 bytes)
DATA_piezas_B636:
	defb 004h,0e0h,00dh,0e4h,04eh,0e8h,00dh,0ech,04eh	; b636  ....N...N

; ----------------------------------------------------------------------
; DATOS piezas_B63F: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (5 bytes)
;   0xb63f..0xb644  (5 bytes)
DATA_piezas_B63F:
	defb 002h,0f0h,00dh,0f4h,04eh	; b63f

; ----------------------------------------------------------------------
; DATOS piezas_B644: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (5 bytes)
;   0xb644..0xb649  (5 bytes)
DATA_piezas_B644:
	defb 002h,0d8h,00dh,0dch,04eh	; b644

; ----------------------------------------------------------------------
; DATOS piezas_B649: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb649..0xb65a  (17 bytes)
DATA_piezas_B649:
	defb 008h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b649  ................
	defb 000h	; b659

; ----------------------------------------------------------------------
; DATOS piezas_B65A: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb65a..0xb66b  (17 bytes)
DATA_piezas_B65A:
	defb 008h,0b8h,00bh,0bch,00dh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b65a  ................
	defb 000h	; b66a

; ----------------------------------------------------------------------
; DATOS piezas_B66B: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb66b..0xb67c  (17 bytes)
DATA_piezas_B66B:
	defb 008h,0c8h,00bh,0cch,00dh,0b8h,00bh,0bch,00dh,000h,000h,000h,000h,000h,000h,000h	; b66b  ................
	defb 000h	; b67b

; ----------------------------------------------------------------------
; DATOS piezas_B67C: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb67c..0xb68d  (17 bytes)
DATA_piezas_B67C:
	defb 008h,0c8h,00bh,0cch,00dh,0c8h,00bh,0cch,00dh,0b8h,00bh,0bch,00dh,000h,000h,000h	; b67c  ................
	defb 000h	; b68c

; ----------------------------------------------------------------------
; DATOS piezas_B68D: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb68d..0xb69e  (17 bytes)
DATA_piezas_B68D:
	defb 008h,0c8h,00bh,0cch,00dh,0c8h,00bh,0cch,00dh,0c8h,00bh,0cch,00dh,0c0h,00bh,0c4h	; b68d  ................
	defb 00dh	; b69d

; ----------------------------------------------------------------------
; DATOS piezas_B69E: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb69e..0xb6af  (17 bytes)
DATA_piezas_B69E:
	defb 008h,000h,000h,000h,000h,0c8h,00bh,0cch,00dh,0c8h,00bh,0cch,00dh,0c0h,00bh,0c4h	; b69e  ................
	defb 00dh	; b6ae

; ----------------------------------------------------------------------
; DATOS piezas_B6AF: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb6af..0xb6c0  (17 bytes)
DATA_piezas_B6AF:
	defb 008h,000h,000h,000h,000h,000h,000h,000h,000h,0c8h,00bh,0cch,00dh,0c0h,00bh,0c4h	; b6af  ................
	defb 00dh	; b6bf

; ----------------------------------------------------------------------
; DATOS piezas_B6C0: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (17 bytes)
;   0xb6c0..0xb6d1  (17 bytes)
DATA_piezas_B6C0:
	defb 008h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,00bh,0c4h	; b6c0  ................
	defb 00dh	; b6d0

; ----------------------------------------------------------------------
; DATOS piezas_B6D1: [n] y n x 2 bytes a la ficha del enemigo (p01:771E,
;   p01:789F); lo leen p01:770F (1 bytes)
;   0xb6d1..0xb6d2  (1 bytes)
DATA_piezas_B6D1:
	defb 000h	; b6d1

; ----------------------------------------------------------------------
; DATOS desplazamientos_B6D2: pares [dy][dx] que p01:78CF suma a la posicion
;   del enemigo de tipo 2 (p01:78E5); lo leen p01:78E5 (16 bytes)
;   0xb6d2..0xb6e2  (16 bytes)
DATA_desplazamientos_B6D2:
	defb 0e0h,0f0h	; b6d2
	defb 0e0h,0f0h	; b6d4
	defb 0e0h,000h	; b6d6
	defb 0e0h,000h	; b6d8
	defb 0f0h,0f0h	; b6da
	defb 0f0h,0f0h	; b6dc
	defb 0f0h,000h	; b6de
	defb 0f0h,000h	; b6e0

; ----------------------------------------------------------------------
; DATOS desplazamientos_B6E2: pares [dy][dx] que p01:78CF suma a la posicion
;   del enemigo de tipo 8 (p01:78E5); lo leen p01:78E5 (4 bytes)
;   0xb6e2..0xb6e6  (4 bytes)
DATA_desplazamientos_B6E2:
	defb 0feh,0ffh	; b6e2
	defb 0feh,0ffh	; b6e4

; ----------------------------------------------------------------------
; DATOS desplazamientos_B6E6: pares [dy][dx] que p01:78CF suma a la posicion
;   del enemigo de tipo 4 (p01:78E5); lo leen p01:78E5 (4 bytes)
;   0xb6e6..0xb6ea  (4 bytes)
DATA_desplazamientos_B6E6:
	defb 0e0h,0f8h	; b6e6
	defb 0e0h,0f8h	; b6e8

; ----------------------------------------------------------------------
; DATOS desplazamientos_B6EA: pares [dy][dx] que p01:78CF suma a la posicion
;   del enemigo de tipo los demas (p01:78E5); lo leen p01:78E5 (4 bytes)
;   0xb6ea..0xb6ee  (4 bytes)
DATA_desplazamientos_B6EA:
	defb 0f0h,0f8h	; b6ea
	defb 0f0h,0f8h	; b6ec

; ----------------------------------------------------------------------
; DATOS desplazamientos_B6EE: pares [dy][dx] que p01:78CF suma a la posicion
;   del enemigo de tipo 7 (p01:78E5); lo leen p01:78E5 (16 bytes)
;   0xb6ee..0xb6fe  (16 bytes)
DATA_desplazamientos_B6EE:
	defb 000h,0f8h	; b6ee
	defb 000h,0f8h	; b6f0
	defb 010h,0f8h	; b6f2
	defb 010h,0f8h	; b6f4
	defb 020h,0f8h	; b6f6
	defb 020h,0f8h	; b6f8
	defb 030h,0f8h	; b6fa
	defb 030h,0f8h	; b6fc

; ----------------------------------------------------------------------
; DATOS plantillas: 5 palabras: las plantillas de desplazamientos 0x80-0x84 de
;   los fotogramas (p02:8A7E); lo leen p02:8A42 (10 bytes)
;   0xb6fe..0xb708  (10 bytes)
DATA_plantillas:
	defb 008h,0b7h	; b6fe
	defb 00ch,0b7h	; b700
	defb 01ch,0b7h	; b702
	defb 02ch,0b7h	; b704
	defb 034h,0b7h	; b706

; ----------------------------------------------------------------------
; DATOS plantillas_dydx: pares [dy][dx] de las plantillas 0x80-0x84
;   (p02:8A85); lo leen p02:8A42 (60 bytes)
;   0xb708..0xb744  (60 bytes)
DATA_plantillas_dydx:
	defb 0f1h,0f8h	; b708
	defb 0f1h,0f8h	; b70a
	defb 0f1h,0f0h	; b70c
	defb 0f1h,0f0h	; b70e
	defb 0f1h,000h	; b710
	defb 0f1h,000h	; b712
	defb 0f1h,0f0h	; b714
	defb 0f1h,0f0h	; b716
	defb 0f1h,000h	; b718
	defb 0f1h,000h	; b71a
	defb 0e1h,0f8h	; b71c
	defb 0e1h,0f8h	; b71e
	defb 0f1h,0f8h	; b720
	defb 0f1h,0f8h	; b722
	defb 0e1h,0f8h	; b724
	defb 0e1h,0f8h	; b726
	defb 0f1h,0f8h	; b728
	defb 0f1h,0f8h	; b72a
	defb 0f1h,0f8h	; b72c
	defb 0f1h,0f8h	; b72e
	defb 0f1h,0f8h	; b730
	defb 0f1h,0f8h	; b732
	defb 0e1h,0f0h	; b734
	defb 0e1h,0f0h	; b736
	defb 0e1h,000h	; b738
	defb 0e1h,000h	; b73a
	defb 0f1h,0f0h	; b73c
	defb 0f1h,0f0h	; b73e
	defb 0f1h,000h	; b740
	defb 0f1h,000h	; b742

; ----------------------------------------------------------------------
; DATOS fotogramas: 156 palabras: el fotograma (ix+0x10) de cada pieza de
;   sprite (p02:8A49); lo leen p02:8A42 (312 bytes)
;   0xb744..0xb87c  (312 bytes)
DATA_fotogramas:
	defb 07ch,0b8h	; b744
	defb 07fh,0b8h	; b746
	defb 082h,0b8h	; b748
	defb 085h,0b8h	; b74a
	defb 088h,0b8h	; b74c
	defb 08bh,0b8h	; b74e
	defb 08eh,0b8h	; b750
	defb 08eh,0b8h	; b752
	defb 08eh,0b8h	; b754
	defb 09ah,0b8h	; b756
	defb 0a6h,0b8h	; b758
	defb 0b2h,0b8h	; b75a
	defb 0beh,0b8h	; b75c
	defb 0cah,0b8h	; b75e
	defb 0d6h,0b8h	; b760
	defb 0dbh,0b8h	; b762
	defb 0e0h,0b8h	; b764
	defb 0e3h,0b8h	; b766
	defb 0e6h,0b8h	; b768
	defb 0e9h,0b8h	; b76a
	defb 0ech,0b8h	; b76c
	defb 0efh,0b8h	; b76e
	defb 0f2h,0b8h	; b770
	defb 0f5h,0b8h	; b772
	defb 0f8h,0b8h	; b774
	defb 0fbh,0b8h	; b776
	defb 0feh,0b8h	; b778
	defb 001h,0b9h	; b77a
	defb 001h,0b9h	; b77c
	defb 001h,0b9h	; b77e
	defb 006h,0b9h	; b780
	defb 00bh,0b9h	; b782
	defb 010h,0b9h	; b784
	defb 015h,0b9h	; b786
	defb 01ah,0b9h	; b788
	defb 01fh,0b9h	; b78a
	defb 024h,0b9h	; b78c
	defb 024h,0b9h	; b78e
	defb 027h,0b9h	; b790
	defb 02ah,0b9h	; b792
	defb 02dh,0b9h	; b794
	defb 030h,0b9h	; b796
	defb 033h,0b9h	; b798
	defb 036h,0b9h	; b79a
	defb 039h,0b9h	; b79c
	defb 03ch,0b9h	; b79e
	defb 03fh,0b9h	; b7a0
	defb 042h,0b9h	; b7a2
	defb 045h,0b9h	; b7a4
	defb 048h,0b9h	; b7a6
	defb 04bh,0b9h	; b7a8
	defb 04eh,0b9h	; b7aa
	defb 051h,0b9h	; b7ac
	defb 054h,0b9h	; b7ae
	defb 057h,0b9h	; b7b0
	defb 05ah,0b9h	; b7b2
	defb 05fh,0b9h	; b7b4
	defb 064h,0b9h	; b7b6
	defb 06dh,0b9h	; b7b8
	defb 076h,0b9h	; b7ba
	defb 07fh,0b9h	; b7bc
	defb 088h,0b9h	; b7be
	defb 08bh,0b9h	; b7c0
	defb 08eh,0b9h	; b7c2
	defb 091h,0b9h	; b7c4
	defb 094h,0b9h	; b7c6
	defb 097h,0b9h	; b7c8
	defb 09ah,0b9h	; b7ca
	defb 09dh,0b9h	; b7cc
	defb 0a0h,0b9h	; b7ce
	defb 0a9h,0b9h	; b7d0
	defb 0b2h,0b9h	; b7d2
	defb 0bbh,0b9h	; b7d4
	defb 0c4h,0b9h	; b7d6
	defb 0cdh,0b9h	; b7d8
	defb 0d6h,0b9h	; b7da
	defb 0dfh,0b9h	; b7dc
	defb 0e8h,0b9h	; b7de
	defb 0f1h,0b9h	; b7e0
	defb 003h,0bah	; b7e2
	defb 015h,0bah	; b7e4
	defb 027h,0bah	; b7e6
	defb 02ch,0bah	; b7e8
	defb 031h,0bah	; b7ea
	defb 036h,0bah	; b7ec
	defb 03bh,0bah	; b7ee
	defb 041h,0bah	; b7f0
	defb 047h,0bah	; b7f2
	defb 04dh,0bah	; b7f4
	defb 053h,0bah	; b7f6
	defb 059h,0bah	; b7f8
	defb 05ch,0bah	; b7fa
	defb 05fh,0bah	; b7fc
	defb 064h,0bah	; b7fe
	defb 069h,0bah	; b800
	defb 06eh,0bah	; b802
	defb 073h,0bah	; b804
	defb 0a3h,0bah	; b806
	defb 076h,0bah	; b808
	defb 079h,0bah	; b80a
	defb 07ch,0bah	; b80c
	defb 07fh,0bah	; b80e
	defb 082h,0bah	; b810
	defb 085h,0bah	; b812
	defb 0a6h,0bah	; b814
	defb 0a9h,0bah	; b816
	defb 0ach,0bah	; b818
	defb 0afh,0bah	; b81a
	defb 08bh,0bah	; b81c
	defb 08eh,0bah	; b81e
	defb 091h,0bah	; b820
	defb 094h,0bah	; b822
	defb 097h,0bah	; b824
	defb 09ah,0bah	; b826
	defb 09dh,0bah	; b828
	defb 0a0h,0bah	; b82a
	defb 0ach,0bah	; b82c
	defb 0b2h,0bah	; b82e
	defb 0b5h,0bah	; b830
	defb 0b8h,0bah	; b832
	defb 088h,0bah	; b834
	defb 0bbh,0bah	; b836
	defb 0beh,0bah	; b838
	defb 0c1h,0bah	; b83a
	defb 0c4h,0bah	; b83c
	defb 0c7h,0bah	; b83e
	defb 0cah,0bah	; b840
	defb 0cdh,0bah	; b842
	defb 0d0h,0bah	; b844
	defb 0d9h,0bah	; b846
	defb 0deh,0bah	; b848
	defb 0afh,0bah	; b84a
	defb 0deh,0bah	; b84c
	defb 0afh,0bah	; b84e
	defb 0ach,0bah	; b850
	defb 0b2h,0bah	; b852
	defb 0e1h,0bah	; b854
	defb 0e4h,0bah	; b856
	defb 0e9h,0bah	; b858
	defb 0eeh,0bah	; b85a
	defb 0f3h,0bah	; b85c
	defb 0f8h,0bah	; b85e
	defb 004h,0bbh	; b860
	defb 010h,0bbh	; b862
	defb 015h,0bbh	; b864
	defb 01ah,0bbh	; b866
	defb 01dh,0bbh	; b868
	defb 020h,0bbh	; b86a
	defb 023h,0bbh	; b86c
	defb 026h,0bbh	; b86e
	defb 029h,0bbh	; b870
	defb 032h,0bbh	; b872
	defb 03bh,0bbh	; b874
	defb 044h,0bbh	; b876
	defb 04dh,0bbh	; b878
	defb 05fh,0bbh	; b87a

; ----------------------------------------------------------------------
; DATOS fotogramas_datos: los 156 fotogramas: n x [dy][dx][patron], o
;   [0x80-0x84] y n patrones con la plantilla de p15:B6FE; n es (ix+0x20), lo
;   que dejo la lista de piezas (p02:8A55); lo leen p02:8A42 (757 bytes)
;   0xb87c..0xbb71  (757 bytes)
DATA_fotogramas_datos:
	defb 080h,078h,07ch,080h,080h,084h,080h,090h,094h,080h,098h,09ch,080h,088h,08ch,080h	; b87c  .x|.............
	defb 0a0h,0a4h,0e2h,0f8h,050h,0e2h,0f8h,054h,0f2h,0f9h,058h,0f2h,0f9h,05ch,0e1h,0f8h	; b88c  ....P..T..X..\..
	defb 050h,0e1h,0f8h,054h,0f1h,0f9h,060h,0f1h,0f9h,064h,0e2h,0f8h,050h,0e2h,0f8h,054h	; b89c  P..T..`..d..P..T
	defb 0f2h,0f9h,068h,0f2h,0f9h,06ch,0e2h,0f8h,070h,0e2h,0f8h,074h,0f2h,0f7h,078h,0f2h	; b8ac  ..h..l..p..t..x.
	defb 0f7h,07ch,0e1h,0f8h,070h,0e1h,0f8h,074h,0f1h,0f7h,080h,0f1h,0f7h,084h,0e2h,0f8h	; b8bc  .|..p..t........
	defb 070h,0e2h,0f8h,074h,0f2h,0f7h,088h,0f2h,0f7h,08ch,083h,090h,094h,090h,094h,083h	; b8cc  p..t............
	defb 098h,09ch,098h,09ch,080h,058h,05ch,080h,060h,064h,080h,068h,06ch,080h,070h,074h	; b8dc  .....X\.`d.hl.pt
	defb 080h,080h,084h,080h,088h,08ch,080h,078h,07ch,080h,090h,094h,080h,0b0h,0b4h,080h	; b8ec  .......x|.......
	defb 0c0h,0c4h,080h,0b8h,0bch,082h,098h,09ch,0a0h,0a4h,082h,0a8h,0ach,0b0h,0b4h,082h	; b8fc  ................
	defb 0b8h,0bch,0c0h,0c4h,082h,0c8h,0cch,0d0h,0d4h,081h,040h,044h,048h,04ch,082h,0a0h	; b90c  ..........@DHL..
	defb 0a4h,0a8h,0ach,082h,0b0h,0b4h,0b8h,0bch,080h,0b0h,0b4h,080h,0b8h,0bch,080h,0c0h	; b91c  ................
	defb 0c4h,080h,0c8h,0cch,080h,0d0h,0d4h,080h,0d8h,0dch,080h,090h,094h,080h,0a0h,0a4h	; b92c  ................
	defb 080h,098h,09ch,080h,0a8h,0ach,080h,050h,054h,080h,070h,074h,080h,060h,064h,080h	; b93c  .......PT.pt.`d.
	defb 080h,084h,080h,068h,06ch,080h,078h,07ch,080h,058h,05ch,080h,088h,08ch,081h,050h	; b94c  ...hl.x|.X\....P
	defb 054h,058h,05ch,081h,060h,064h,068h,06ch,082h,050h,054h,058h,05ch,050h,054h,058h	; b95c  TX\.`dhl.PTX\PTX
	defb 05ch,081h,060h,064h,078h,07ch,060h,064h,078h,07ch,081h,068h,06ch,080h,084h,068h	; b96c  \.`dx|`dx|.hl..h
	defb 06ch,080h,084h,081h,070h,074h,088h,08ch,070h,074h,088h,08ch,080h,090h,094h,080h	; b97c  l...pt..pt......
	defb 098h,09ch,080h,0a0h,0a4h,080h,0a8h,0ach,080h,0b8h,0bch,080h,0c0h,0c4h,080h,028h	; b98c  ...............(
	defb 028h,080h,02ch,02ch,084h,050h,054h,070h,074h,058h,05ch,078h,07ch,084h,060h,064h	; b99c  (.,,.PTptX\x|.`d
	defb 080h,084h,068h,06ch,088h,08ch,084h,050h,054h,070h,074h,058h,05ch,078h,07ch,084h	; b9ac  ..hl...PTptX\x|.
	defb 060h,064h,080h,084h,068h,06ch,088h,08ch,084h,080h,084h,088h,08ch,090h,094h,098h	; b9bc  `d..hl..........
	defb 09ch,084h,058h,05ch,050h,054h,068h,06ch,060h,064h,084h,0b0h,0b4h,0b8h,0bch,0c0h	; b9cc  ..X\PThl`d......
	defb 0c4h,0c8h,0cch,084h,0a0h,0a4h,0a8h,0ach,0c0h,0c4h,0c8h,0cch,084h,078h,07ch,070h	; b9dc  .............x|p
	defb 074h,0c0h,0c4h,0c8h,0cch,0e1h,0f0h,050h,0e1h,0f0h,054h,0e1h,000h,068h,0e1h,000h	; b9ec  t......P..T..h..
	defb 06ch,0f1h,0f8h,060h,0f1h,0f8h,064h,0e1h,0f0h,058h,0e1h,0f0h,05ch,0e1h,000h,070h	; b9fc  l..`..d..X..\..p
	defb 0e1h,000h,074h,0f1h,0f8h,060h,0f1h,0f8h,064h,0e1h,0f0h,058h,0e1h,0f0h,05ch,0e1h	; ba0c  ..t..`..d..X..\.
	defb 000h,070h,0e1h,000h,074h,0f1h,0f8h,078h,0f1h,0f8h,07ch,082h,050h,054h,058h,05ch	; ba1c  .p..t..x..|.PTX\
	defb 082h,060h,064h,068h,06ch,082h,070h,074h,078h,07ch,082h,080h,084h,088h,08ch,000h	; ba2c  .`dhl.ptx|......
	defb 0e8h,070h,000h,008h,078h,000h,0e8h,074h,000h,008h,074h,000h,0f0h,074h,000h,000h	; ba3c  .p..x..t..t..t..
	defb 074h,000h,0f0h,078h,000h,000h,070h,000h,0f8h,07ch,000h,0f8h,07ch,080h,080h,084h	; ba4c  t..x..p..|..|...
	defb 080h,0c0h,0c4h,082h,050h,054h,058h,05ch,082h,060h,064h,068h,06ch,082h,070h,074h	; ba5c  ....PTX\.`dhl.pt
	defb 078h,07ch,082h,080h,084h,088h,08ch,080h,028h,02ch,080h,050h,054h,080h,0a8h,0ach	; ba6c  x|......(,.PT...
	defb 080h,0f8h,0fch,080h,030h,034h,080h,038h,03ch,080h,040h,044h,080h,020h,024h,080h	; ba7c  ....04.8<.@D. $.
	defb 070h,074h,080h,078h,07ch,080h,080h,084h,080h,088h,08ch,080h,090h,094h,080h,098h	; ba8c  pt.x|...........
	defb 09ch,080h,0a0h,0a4h,080h,0a8h,0ach,080h,0b0h,0b4h,080h,070h,074h,080h,078h,07ch	; ba9c  ...........pt.x|
	defb 080h,080h,084h,080h,078h,07ch,080h,088h,08ch,080h,090h,094h,080h,098h,09ch,080h	; baac  ....x|..........
	defb 0a0h,0a4h,080h,0a8h,0ach,080h,0b8h,0bch,080h,0c0h,0c4h,080h,0b0h,0b4h,080h,0c8h	; babc  ................
	defb 0cch,083h,0d0h,0d4h,084h,048h,04ch,048h,04ch,048h,04ch,048h,04ch,083h,058h,058h	; bacc  .....HLHLHLHL.XX
	defb 058h,058h,080h,070h,074h,080h,048h,04ch,082h,050h,054h,058h,05ch,082h,060h,064h	; badc  XX.pt.HL.PTX\.`d
	defb 068h,06ch,082h,090h,094h,098h,09ch,082h,0a0h,0a4h,0a8h,0ach,0e9h,0fah,070h,0e9h	; baec  hl............p.
	defb 0fah,074h,0f9h,0f8h,078h,0f9h,0f8h,07ch,0e9h,0f6h,0b0h,0e9h,0f6h,0b4h,0f9h,0f8h	; bafc  .t..x..|........
	defb 0b8h,0f9h,0f8h,0bch,083h,088h,08ch,088h,08ch,083h,0c8h,0cch,0c8h,0cch,080h,0d8h	; bb0c  ................
	defb 0dch,080h,0e0h,0e4h,080h,0e8h,0ech,080h,0f0h,0f4h,080h,0f8h,0fch,084h,050h,054h	; bb1c  ..............PT
	defb 058h,05ch,070h,074h,0a0h,0a4h,084h,060h,064h,068h,06ch,078h,07ch,0a8h,0ach,084h	; bb2c  X\pt...`dhlx|...
	defb 080h,084h,0b0h,0b4h,088h,08ch,0b8h,0bch,084h,090h,094h,0c0h,0c4h,098h,09ch,0c8h	; bb3c  ................
	defb 0cch,0f1h,0e8h,0d8h,0f1h,008h,0d0h,0d9h,0e0h,0e0h,0d9h,0e0h,0e4h,0d9h,0f0h,0e8h	; bb4c  ................
	defb 0d9h,0f0h,0ech,0e9h,0f0h,0dch,0e9h,000h,0d4h,0a1h,0e0h,0e0h,0a1h,0e0h,0e4h,0a1h	; bb5c  ................
	defb 0f8h,0e8h,0a1h,0f8h,0ech	; bb6c

; ----------------------------------------------------------------------
; DATOS fichas_comunes_colores: tabla de colores de la lista fichas_comunes
;   (L_529C indexa con c >> 4); lo leen p00:51C5 (12 bytes)
;   0xbb71..0xbb7d  (12 bytes)
DATA_fichas_comunes_colores:
	defb 07dh,0bbh	; bb71
	defb 081h,0bbh	; bb73
	defb 085h,0bbh	; bb75
	defb 089h,0bbh	; bb77
	defb 08dh,0bbh	; bb79
	defb 091h,0bbh	; bb7b

; ----------------------------------------------------------------------
; DATOS fichas_comunes_col0: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 2 bloques: (fichas_comunes_col0
;   BB7D-BB81); lo leen p00:51C5 (4 bytes)
;   0xbb7d..0xbb81  (4 bytes)
DATA_fichas_comunes_col0:
	defb 000h,008h,00dh,00eh	; bb7d

; ----------------------------------------------------------------------
; DATOS fichas_comunes_col1: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 2 bloques: (fichas_comunes_col1
;   BB81-BB85); lo leen p00:51C5 (4 bytes)
;   0xbb81..0xbb85  (4 bytes)
DATA_fichas_comunes_col1:
	defb 000h,008h,007h,00eh	; bb81

; ----------------------------------------------------------------------
; DATOS fichas_comunes_col2: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:51C5 (4 bytes)
;   0xbb85..0xbb89  (4 bytes)
DATA_fichas_comunes_col2:
	defb 000h,004h,005h,00fh	; bb85

; ----------------------------------------------------------------------
; DATOS fichas_comunes_col3: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:51C5 (4 bytes)
;   0xbb89..0xbb8d  (4 bytes)
DATA_fichas_comunes_col3:
	defb 000h,00dh,00eh,00fh	; bb89

; ----------------------------------------------------------------------
; DATOS fichas_comunes_col4: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:51C5 (4 bytes)
;   0xbb8d..0xbb91  (4 bytes)
DATA_fichas_comunes_col4:
	defb 006h,009h,00fh,000h	; bb8d

; ----------------------------------------------------------------------
; DATOS fichas_comunes_col5: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:51C5 (4 bytes)
;   0xbb91..0xbb95  (4 bytes)
DATA_fichas_comunes_col5:
	defb 006h,00bh,00fh,000h	; bb91

; ----------------------------------------------------------------------
; DATOS fichas_comunes: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:51C5 (49 bytes)
;   0xbb95..0xbbc6  (49 bytes)
DATA_fichas_comunes:
	defb 008h,002h,030h,098h,002h,0c6h	; bb95
	defb 0bbh,012h,038h,098h,003h,0e6h	; bb9b
	defb 0bbh,003h,044h,098h,002h,0c6h	; bba1
	defb 0bbh,013h,04ch,098h,003h,0e6h	; bba7
	defb 0bbh,022h,058h,098h,004h,016h	; bbad
	defb 0bch,032h,030h,080h,004h,056h	; bbb3
	defb 0bch,042h,018h,0b0h,008h,096h	; bbb9
	defb 0bch,052h,038h,0b0h,008h,016h	; bbbf
	defb 0bdh	; bbc5

; ----------------------------------------------------------------------
; DATOS fichas_comunes_f0: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_comunes; se solapan 2 bloques:
;   (fichas_comunes_f2 BBC6-BBE6); lo leen p00:51C5 (32 bytes)
;   0xbbc6..0xbbe6  (32 bytes)
DATA_fichas_comunes_f0:
	defb 0e0h,01fh,0e0h,01fh,0e0h,01fh,0e0h,01fh,0e0h,01fh,0e0h,01fh,0e0h,01fh,0e0h,01fh	; bbc6  ................
	defb 0e0h,01fh,0e4h,01bh,0f4h,08bh,0ffh,000h,0ffh,042h,0ffh,080h,0ffh,0a2h,0ffh,068h	; bbd6  .........B.....h

; ----------------------------------------------------------------------
; DATOS fichas_comunes_f1: 3 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 1 de la lista fichas_comunes; se solapan 2 bloques:
;   (fichas_comunes_f3 BBE6-BC16); lo leen p00:51C5 (48 bytes)
;   0xbbe6..0xbc16  (48 bytes)
DATA_fichas_comunes_f1:
	defb 003h,00fh,003h,00fh,003h,00fh,003h,00fh,003h,00fh,003h,00fh,003h,00fh,003h,00fh	; bbe6  ................
	defb 001h,00fh,003h,00fh,001h,00dh,000h,00eh,001h,00dh,000h,00ah,001h,001h,000h,008h	; bbf6  ................
	defb 0ffh,0ebh,06fh,0fah,0afh,07fh,05bh,0ffh,00dh,0afh,000h,027h,000h,04ah,000h,022h	; bc06  ..o...[....'.J."

; ----------------------------------------------------------------------
; DATOS fichas_comunes_f4: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 4 de la lista fichas_comunes; lo leen p00:51C5 (64 bytes)
;   0xbc16..0xbc56  (64 bytes)
DATA_fichas_comunes_f4:
	defb 0fbh,0ffh,0ffh,0aeh,0ceh,075h,06eh,0ddh,066h,0ffh,06fh,0ffh,0ffh,0fdh,0bfh,0f7h	; bc16  .....un.f.o.....
	defb 0ffh,0ffh,0ffh,0dbh,0dbh,0aeh,08eh,0fbh,0aah,0ffh,0ffh,0deh,0fah,0ffh,0b7h,0ffh	; bc26  ................
	defb 0eeh,0bfh,077h,0fdh,0a7h,0ffh,05ah,0ffh,06fh,0ffh,0d5h,0ffh,06eh,0ffh,0ffh,0ffh	; bc36  ..w...Z.o...n...
	defb 0dah,0f7h,0fbh,0ffh,0d7h,0ffh,0bah,0ffh,0d7h,0ffh,0beh,0ffh,0fbh,0ffh,0ffh,0ffh	; bc46  ................

; ----------------------------------------------------------------------
; DATOS fichas_comunes_f5: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 5 de la lista fichas_comunes; lo leen p00:51C5 (64 bytes)
;   0xbc56..0xbc96  (64 bytes)
DATA_fichas_comunes_f5:
	defb 07fh,07fh,0b5h,0ceh,0ffh,084h,0c7h,0bch,0a5h,0deh,07fh,07fh,0bfh,0c0h,0e8h,097h	; bc56  ................
	defb 07eh,07eh,0fdh,003h,0d7h,029h,001h,0ffh,085h,07bh,0feh,0feh,0adh,073h,07bh,0a5h	; bc66  ~~...)...{...s{.
	defb 0e0h,09fh,0f0h,08fh,07fh,07fh,0bdh,0c3h,0ebh,095h,0c1h,0bfh,0a3h,0ddh,07fh,07fh	; bc76  ................
	defb 031h,0efh,029h,0f7h,0feh,0feh,07dh,083h,0a7h,059h,001h,0ffh,083h,07dh,0feh,0feh	; bc86  1.)...}..Y...}..

; ----------------------------------------------------------------------
; DATOS fichas_comunes_f6: 8 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 6 de la lista fichas_comunes; lo leen p00:51C5 (128 bytes)
;   0xbc96..0xbd16  (128 bytes)
DATA_fichas_comunes_f6:
	defb 0ffh,0ffh,0ffh,0ffh,0cch,0ffh,083h,0cch,03fh,080h,050h,083h,080h,0fch,0d0h,0e1h	; bc96  ........?.P.....
	defb 0f1h,0fbh,0f1h,0fbh,071h,0fbh,0b1h,07bh,0d1h,03bh,0e1h,01bh,061h,09bh,0e1h,01bh	; bca6  ....q..{....a...
	defb 0c0h,0e1h,0e0h,0f4h,0d0h,0e2h,080h,0c0h,0c0h,0e0h,0d0h,0ech,0e0h,0f3h,0f3h,0fch	; bcb6  ................
	defb 0a1h,05bh,001h,0bbh,001h,0bbh,051h,03bh,095h,07bh,015h,0bbh,005h,07bh,001h,0d7h	; bcc6  .[....Q..{...{..
	defb 0f8h,0ffh,0f0h,0f8h,0f8h,0ffh,0f0h,0f8h,0f8h,0ffh,0f0h,0f8h,0f8h,0ffh,0fdh,0feh	; bcd6  ................
	defb 001h,0ffh,002h,001h,001h,0ffh,002h,001h,001h,0ffh,002h,001h,001h,0ffh,0fdh,003h	; bce6  ................
	defb 0fdh,0feh,0feh,0ffh,0feh,0ffh,0ffh,0ffh,0feh,0ffh,0fch,0feh,0fdh,0feh,0feh,0ffh	; bcf6  ................
	defb 03dh,0c3h,0bbh,047h,0bbh,047h,045h,0bbh,0deh,021h,0bdh,043h,03bh,087h,007h,0ffh	; bd06  =..G.GE..!.C....

; ----------------------------------------------------------------------
; DATOS fichas_comunes_f7: 8 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 7 de la lista fichas_comunes; lo leen p00:51C5 (128 bytes)
;   0xbd16..0xbd96  (128 bytes)
DATA_fichas_comunes_f7:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f8h,0ffh,0e0h,0f8h,0c7h,0e0h,08eh,0c0h	; bd16  ................
	defb 0c7h,0efh,0c7h,0efh,0c7h,0efh,0c7h,0efh,047h,0efh,007h,06fh,0c7h,01fh,0e7h,01fh	; bd26  ........G..o....
	defb 09ch,0c2h,0a0h,0ddh,0c0h,0e0h,0c0h,0eah,0e0h,0f9h,0c0h,0e0h,0c0h,0f8h,0c0h,0e0h	; bd36  ................
	defb 0f7h,00fh,07bh,007h,03bh,087h,03bh,087h,01bh,067h,00bh,057h,007h,01fh,017h,02fh	; bd46  ..{......g.W.../
	defb 0e0h,0f5h,0f0h,0ffh,0f8h,0ffh,0f0h,0f8h,0f0h,0ffh,0e0h,0f0h,0f0h,0ffh,0e0h,0f0h	; bd56  ................
	defb 0afh,05fh,08fh,07fh,007h,0ffh,00bh,007h,007h,0ffh,00bh,007h,007h,0ffh,00bh,007h	; bd66  ._..............
	defb 0f0h,0ffh,0f5h,0fah,0fah,0fdh,0fah,0fdh,0fdh,0feh,0fdh,0feh,0feh,0ffh,0ffh,0ffh	; bd76  ................
	defb 007h,0ffh,0efh,01fh,0efh,01fh,0efh,01fh,057h,0afh,037h,0cfh,0b7h,04fh,00fh,0ffh	; bd86  ........W.7..O..

; ----------------------------------------------------------------------
; DATOS resto_BD96: tablas cortas que apuntan p02:8559 (0xBD96), p02:8502
;   (0xBDD6), p01:6590 (0xBE16), p00:4746 (0xBE3D), p00:5500 (0xBE70),
;   p00:5505 (0xBE75), p00:54EC (0xBE7A), p02:8F21 (0xBE8E); el tamano de cada
;   una sale del lector siguiente, no de recorrerla; lo leen p02:8559,
;   p02:8502, p01:6590, p00:4746, p00:5500, p00:5505, p00:54EC, p02:8F21 (297
;   bytes)
;   0xbd96..0xbebf  (297 bytes)
DATA_resto_BD96:
	defb 020h,008h,004h,003h,002h,002h,001h,001h,038h,020h,015h,00fh,00ch,009h,008h,007h	; bd96   .......8 ......
	defb 03bh,02bh,020h,019h,014h,010h,00eh,00ch,03dh,031h,027h,020h,01ah,016h,013h,011h	; bda6  .+ .....=1' ....
	defb 03dh,034h,02ch,025h,020h,01ch,018h,015h,03eh,036h,02fh,029h,024h,020h,01ch,019h	; bdb6  =4,% ...>6/)$ ..
	defb 03eh,038h,032h,02ch,028h,023h,020h,01dh,03eh,039h,034h,02fh,02ah,026h,023h,020h	; bdc6  >82,(# .>94/*&#
	defb 000h,006h,00ch,012h,019h,01fh,026h,02ch,032h,038h,03eh,044h,04ah,050h,056h,05ch	; bdd6  ......&,28>DJPV\
	defb 062h,068h,06dh,073h,079h,07eh,084h,089h,08eh,093h,099h,09eh,0a2h,0a7h,0ach,0b1h	; bde6  bhmsy~..........
	defb 0b5h,0b9h,0beh,0c2h,0c6h,0cah,0ceh,0d1h,0d5h,0d8h,0dch,0dfh,0e2h,0e5h,0e7h,0eah	; bdf6  ................
	defb 0edh,0efh,0f1h,0f3h,0f5h,0f7h,0f8h,0fah,0fbh,0fch,0fdh,0feh,0feh,0ffh,0ffh,0ffh	; be06  ................
	defb 01ch,0beh,025h,0beh,030h,0beh,007h,0fah,0fah,0fah,0fah,0fah,0fdh,0ffh,000h,009h	; be16  ..%.0...........
	defb 0fah,0fah,0fah,0fah,0fah,0fah,0fdh,0feh,0ffh,000h,00bh,0fah,0fah,0fah,0fah,0fah	; be26  ................
	defb 0fbh,0fbh,0fdh,0feh,0ffh,000h,000h,047h,0beh,04eh,0beh,059h,0beh,061h,0beh,069h	; be36  .......G.N.Y.a.i
	defb 0beh,0c8h,006h,03ah,02fh,031h,03fh,0ffh,0b8h,006h,02eh,03fh,038h,032h,03fh,02bh	; be46  ...:/1?....?82?+
	defb 038h,031h,0ffh,0c4h,006h,02bh,036h,02dh,032h,033h,0ffh,0c4h,006h,032h,03fh,038h	; be56  81...+6-23...2?8
	defb 044h,02bh,0ffh,0c8h,006h,02bh,031h,03ch,02bh,0ffh,080h,081h,082h,083h,084h,080h	; be66  D+...+1<+.......
	defb 085h,082h,083h,084h,020h,000h,080h,040h,020h,000h,040h,080h,020h,000h,080h,040h	; be76  .... ..@ .@. ..@
	defb 020h,000h,040h,080h,020h,000h,040h,080h,008h,00bh,009h,008h,0ffh,009h,00ch,00bh	; be86   .@. .@.........
	defb 008h,0ffh,008h,009h,00bh,00dh,0ffh,00dh,009h,00bh,00bh,0ffh,00bh,00eh,00dh,00ch	; be96  ................
	defb 0ffh,0f8h,000h,0f8h,0f8h,000h,0f8h,004h,008h,004h,004h,008h,004h,008h,008h,008h	; bea6  ................
	defb 008h,010h,010h,000h,000h,000h,000h,008h,008h	; beb6  .........

; ======================================================================
; CODIGO 0xbebf..0xbf16  (87 bytes)
; ======================================================================


fichas_de_la_pantalla:		; las 32 x 24 fichas de la pantalla a 0xD200, 6 filas de metabloques de 8
	ld de,0d200h		;bebf   ; apunta a el mapa de 32 x 24 fichas de la pantalla
	ld a,006h		;bec2   ; 6 filas de metabloques
L_BEC4:
	ex af,af'			;bec4   ; guarda las filas que quedan
	ld b,008h		;bec5   ; de 8
L_BEC7:
	ld a,(hl)			;bec7   ; el metabloque: sus 16 fichas en 0xE400 + n * 16
	push de			;bec8   ; DE: el sitio en el mapa
	exx			;bec9
	ld bc,0e400h		;beca   ; apunta a los metabloques (16 fichas cada uno)
	ld h,000h		;becd   ; HL = n * 16...
	ld l,a			;becf
	add hl,hl			;bed0
	add hl,hl			;bed1
	add hl,hl			;bed2
	add hl,hl			;bed3
	add hl,bc			;bed4   ; ...+ 0xE400
	ld bc,01cffh		;bed5   ; B = 0x1C: de una fila de 4 a la siguiente del mapa (32 - 4)
	pop de			;bed8
	ldi		;bed9   ; fila 0
	ldi		;bedb
	ldi		;bedd
	ldi		;bedf
	ld a,b			;bee1   ; la fila siguiente del mapa: + 0x1C
	add a,e			;bee2
	ld e,a			;bee3
	ldi		;bee4   ; fila 1
	ldi		;bee6
	ldi		;bee8
	ldi		;beea
	ld a,b			;beec
	add a,e			;beed
	ld e,a			;beee
	ldi		;beef   ; fila 2
	ldi		;bef1
	ldi		;bef3
	ldi		;bef5
	ld a,b			;bef7
	add a,e			;bef8
	ld e,a			;bef9
	ldi		;befa   ; fila 3
	ldi		;befc
	ldi		;befe
	ldi		;bf00
	exx			;bf02
	inc hl			;bf03   ; el siguiente metabloque, 4 casillas a la derecha
	inc e			;bf04   ; 4 a la derecha en el mapa
	inc e			;bf05
	inc e			;bf06
	inc de			;bf07
	djnz L_BEC7		;bf08   ; el metabloque siguiente
	ex de,hl			;bf0a   ; DE: el principio de la fila...
	ld bc,00060h		;bf0b   ; la siguiente fila de metabloques: 0x60 mas (3 filas de 32)
	add hl,bc			;bf0e
	ex de,hl			;bf0f   ; ...0x80 mas alla en total (4 filas de 32)
	ex af,af'			;bf10   ; 6 filas
	dec a			;bf11
	jp nz,L_BEC4		;bf12
	ret			;bf15   ; 6 x 8 metabloques: 32 x 24 fichas

; ----------------------------------------------------------------------
; DATOS relleno_ff: 234 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (234 bytes)
;   0xbf16..0xc000  (234 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf16  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf26  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf36  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf46  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf56  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf66  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf76  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf86  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf96  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfa6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff6  ..........
