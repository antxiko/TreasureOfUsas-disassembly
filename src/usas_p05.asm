; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 05 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f27_cola: 2 fichas de 8x8 a 2 bit(s) por punto (16
;   bytes cada una), entrada 27 de la lista fichas_escenas_2_6 (sigue del
;   banco 4); lo leen p04:7315 (2 bytes)
;   0x8000..0x8002  (2 bytes)
DATA_fichas_escenas_2_6_f27_cola:
	defb 040h,03fh	; 8000

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f28: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 28 de la lista fichas_escenas_2_6; lo leen p04:7315 (8
;   bytes)
;   0x8002..0x800a  (8 bytes)
DATA_fichas_escenas_2_6_f28:
	defb 08dh,095h,01bh,00bh,0a1h,044h,0a2h,009h	; 8002  .....D..

; ----------------------------------------------------------------------
; DATOS fichas_escenas_2_6_f29: 7 fichas de 8x8 a 3 bit(s) por punto (24 bytes
;   cada una), entrada 29 de la lista fichas_escenas_2_6; lo leen p04:7315
;   (168 bytes)
;   0x800a..0x80b2  (168 bytes)
DATA_fichas_escenas_2_6_f29:
	defb 0ffh,0ffh,0ffh,0ffh,03fh,0ffh,0feh,08ah,0feh,0f9h,0c0h,0f8h,0d4h,0e0h,0f0h,0a9h,0c0h,0e0h,095h,0c0h,0c0h,092h,000h,080h	; 800a  ....?...................
	defb 0f2h,0edh,0ffh,092h,040h,0c0h,044h,000h,000h,017h,000h,000h,06bh,000h,000h,08dh,002h,001h,037h,008h,007h,0cfh,030h,00fh	; 8022  ....@.D.....k.....7...0.
	defb 0ffh,000h,0ffh,0fch,000h,0ffh,0f8h,00ah,0f4h,0a1h,080h,07ch,040h,068h,094h,002h,0d0h,028h,085h,0b0h,040h,025h,070h,080h	; 803a  ...........|@h...(..@%p.
	defb 009h,000h,0e0h,08bh,0a0h,040h,017h,060h,080h,012h,0c0h,000h,016h,0c0h,000h,00dh,080h,000h,02dh,080h,000h,02fh,080h,000h	; 8052  .....@.`..........-../..
	defb 040h,0ffh,0ffh,040h,000h,000h,0a3h,000h,000h,0ffh,000h,000h,08ch,0ffh,0ffh,003h,0ffh,0ffh,034h,0ffh,0ffh,0abh,0ffh,0ffh	; 806a  @..@..............4.....
	defb 033h,0cch,033h,0fdh,02fh,0ffh,0d4h,0ffh,0ffh,043h,056h,056h,08ah,000h,000h,0e4h,000h,000h,0ffh,000h,000h,05ah,000h,000h	; 8082  3.3./....CVV.........Z..
	defb 04bh,034h,00bh,087h,038h,007h,046h,039h,007h,01eh,061h,01fh,001h,07fh,00fh,034h,04fh,03fh,0bdh,047h,0ffh,0f7h,06dh,0ffh	; 809a  K4..8.F9..a....4O?.G..m.

; ----------------------------------------------------------------------
; DATOS fichas_escena_4_colores: tabla de colores de la lista fichas_escena_4
;   (L_529C indexa con c >> 4); lo leen p04:7332 (2 bytes)
;   0x80b2..0x80b4  (2 bytes)
DATA_fichas_escena_4_colores:
	defb 0b4h,080h	; 80b2

; ----------------------------------------------------------------------
; DATOS fichas_escena_4_col0: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 3 bloques: (fichas_escena_4_col0
;   80B4-80B8) (fichas_escena_4_col0 80B4-80BC); lo leen p04:7332 (8 bytes)
;   0x80b4..0x80bc  (8 bytes)
DATA_fichas_escena_4_col0:
	defb 00fh,005h	; 80b4
	defb 006h,007h	; 80b6
	defb 00dh,001h	; 80b8
	defb 002h,003h	; 80ba

; ----------------------------------------------------------------------
; DATOS fichas_escena_4: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p04:7332 (19 bytes)
;   0x80bc..0x80cf  (19 bytes)
DATA_fichas_escena_4:
	defb 003h,000h,004h,080h,00ah,0cfh	; 80bc
	defb 080h,002h,040h,080h,02fh,01fh	; 80c2
	defb 081h,004h,040h,084h,004h,00fh	; 80c8
	defb 083h	; 80ce

; ----------------------------------------------------------------------
; DATOS fichas_escena_4_f0: 10 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 0 de la lista fichas_escena_4; lo leen p04:7332 (80
;   bytes)
;   0x80cf..0x811f  (80 bytes)
DATA_fichas_escena_4_f0:
	defb 000h,000h,001h,002h,000h,000h,001h,003h	; 80cf  ........
	defb 002h,004h,004h,000h,000h,000h,000h,000h	; 80d7  ........
	defb 001h,001h,001h,001h,001h,001h,000h,000h	; 80df  ........
	defb 000h,000h,000h,001h,001h,003h,003h,003h	; 80e7  ........
	defb 007h,007h,007h,007h,007h,00fh,00fh,00eh	; 80ef  ........
	defb 01eh,01eh,03eh,03eh,02eh,02eh,04eh,057h	; 80f7  ..>>..NW
	defb 0e3h,0fbh,0ffh,0ffh,0ffh,0cfh,067h,033h	; 80ff  ......g3
	defb 000h,000h,000h,000h,000h,0f8h,08ch,0e6h	; 8107  ........
	defb 0f2h,0f8h,0f4h,074h,070h,030h,038h,018h	; 810f  ...tp08.
	defb 0fch,0feh,0feh,0feh,0feh,07eh,0f6h,00eh	; 8117  .....~..

; ----------------------------------------------------------------------
; DATOS fichas_escena_4_f1: 47 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 1 de la lista fichas_escena_4; se solapan 26 bloques:
;   (fichas_escena_4_f2 830F-836F) (fichas_escena_8_colores 836F-8373)
;   (fichas_escena_8_col0 8373-8377) (fichas_escena_8_col1 8377-837B)
;   (fichas_escena_8 837B-8388) (fichas_escena_9_colores 8388-838C)
;   (fichas_escena_9_col0 838C-8390) (fichas_escena_9_col1 8390-8394)
;   (fichas_escena_9_col1 8390-8394) (fichas_escena_9_col1 8390-8394)
;   (fichas_escena_9 8394-83AD) (fichas_escena_10_colores 83AD-83AF)
;   (fichas_escena_10_col0 83AF-83B1) (fichas_escena_10_col0 83AF-83B3)
;   (fichas_escena_10_col0 83AF-83B3) (fichas_escena_10 83B3-83C6)
;   (fichas_escena_11_colores 83C6-83CC) (fichas_escena_11_col0 83CC-83CE)
;   (fichas_escena_11_col0 83CC-83D0) (fichas_escena_11_col1 83D0-83D4)
;   (fichas_escena_11_col1 83D0-83D4) (fichas_escena_11_col2 83D4-83D8)
;   (fichas_escena_11_col2 83D4-83D8) (fichas_escena_11 83D8-83FD)
;   (fichas_escena_8_f0 83FD-843D); lo leen p04:7332, p04:731E (798 bytes)
;   0x811f..0x843d  (798 bytes)
DATA_fichas_escena_4_f1:
	defb 007h,000h,07fh,000h,08fh,000h,03fh,000h,07fh,003h,0ffh,00fh,0ffh,018h,03fh,020h	; 811f  ......?.......?
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0f8h,0ffh,0feh,0ffh,0ffh,0ffh,01fh,0ffh,003h	; 812f  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,007h,000h,0f3h,000h,0c8h,0c0h,0f0h,0f0h,0d8h,0f8h	; 813f  ................
	defb 07fh,040h,07fh,040h,07eh,000h,07ch,000h,068h,000h,0d8h,000h,0d1h,000h,0b1h,000h	; 814f  .@.@~.|.h.......
	defb 0ffh,000h,03fh,000h,07eh,000h,07dh,000h,0fdh,000h,0f9h,004h,0f3h,008h,0f3h,008h	; 815f  ..?.~.}.........
	defb 0eeh,0feh,0f3h,07fh,0f9h,01fh,0fch,00fh,0deh,007h,0b7h,003h,0b7h,001h,027h,010h	; 816f  ..............'.
	defb 019h,000h,088h,080h,0c4h,0c0h,0e0h,0e0h,070h,0f0h,030h,0f8h,010h,0fch,088h,0feh	; 817f  ........p.0.....
	defb 0a1h,000h,0a2h,001h,0a0h,003h,0a3h,004h,0a0h,00fh,0c1h,00fh,0c3h,00eh,0e3h,004h	; 818f  ................
	defb 0e2h,019h,0e6h,019h,076h,089h,0c4h,03bh,066h,099h,033h,0cch,030h,00fh,0d0h,00fh	; 819f  ....v...f.3.0...
	defb 067h,010h,067h,010h,063h,018h,031h,08ch,01ch,0c2h,003h,0fch,07fh,080h,0f1h,03fh	; 81af  g.g.c.1........?
	defb 084h,07eh,084h,03fh,0a0h,01fh,0b0h,00fh,010h,04fh,031h,0ceh,0f8h,007h,0b8h,0c7h	; 81bf  .~.?.....O1.....
	defb 018h,000h,018h,000h,018h,080h,018h,080h,018h,0c0h,018h,0e0h,098h,060h,088h,070h	; 81cf  .............`.p
	defb 058h,0e7h,098h,063h,098h,063h,058h,0a3h,0d8h,0a1h,098h,061h,0c8h,0f1h,0c9h,0f0h	; 81df  X..c.cX....a....
	defb 040h,0b8h,020h,0dch,020h,0d8h,010h,0e8h,01ch,0e0h,00ch,0f0h,004h,0f8h,000h,0f8h	; 81ef  @. . ...........
	defb 08bh,00fh,087h,013h,007h,013h,025h,013h,027h,009h,02eh,007h,069h,000h,049h,000h	; 81ff  ......%.'...i.I.
	defb 0f7h,0efh,0a7h,0ffh,0ffh,09fh,0f8h,0e7h,0dfh,0ffh,0f9h,0e7h,0e7h,0ffh,07fh,0ffh	; 820f  ................
	defb 0ffh,0ffh,0ffh,0ffh,03fh,0ffh,0bfh,07fh,0feh,0ffh,0feh,0ffh,0fbh,0fch,0f7h,0f8h	; 821f  ....?...........
	defb 0d9h,0e0h,0dbh,0f8h,0b7h,0e4h,075h,0c2h,065h,0c2h,0e5h,042h,0c1h,024h,0c5h,018h	; 822f  ......u.e..B.$..
	defb 088h,070h,088h,070h,0c8h,030h,0e8h,010h,0f8h,000h,0f8h,000h,0f8h,000h,0fch,000h	; 823f  .p.p.0..........
	defb 0c2h,000h,0c7h,000h,0ddh,000h,0d5h,000h,0f5h,000h,0f5h,000h,0ebh,000h,06bh,001h	; 824f  ..............k.
	defb 0ffh,07fh,07ch,03fh,0bfh,000h,0ffh,000h,0ffh,040h,0ffh,040h,0ffh,061h,0ffh,0ffh	; 825f  ..|?.....@.@.a..
	defb 0dfh,0e0h,0ffh,000h,0fdh,002h,0f8h,007h,0f0h,01fh,0f0h,07fh,0f0h,0ffh,0e0h,0ffh	; 826f  ................
	defb 0d5h,000h,0d5h,000h,0d5h,000h,0d4h,000h,0aah,000h,0b7h,000h,0dbh,000h,05ch,080h	; 827f  ..............\.
	defb 0f7h,0efh,0a7h,0ffh,0dbh,0a7h,0edh,0deh,0e7h,0f9h,0dfh,0ffh,0f9h,0e7h,067h,0ffh	; 828f  ..............g.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,07fh,0ffh,0feh,0ffh,0feh,0ffh,0fbh,0fch,0f7h,0f8h	; 829f  ................
	defb 0a1h,000h,0a2h,001h,0a0h,003h,0a3h,004h,0a0h,00fh,0c1h,00eh,0c3h,00fh,0e1h,006h	; 82af  ................
	defb 0e2h,019h,0e6h,019h,076h,089h,0c4h,03bh,066h,099h,0d3h,02ch,0feh,0cfh,0ffh,02fh	; 82bf  ....v...f..,.../
	defb 067h,010h,067h,010h,063h,018h,031h,08ch,01ch,0c2h,03fh,0c0h,040h,0bfh,0bfh,040h	; 82cf  g.g.c.1...?.@..@
	defb 0e2h,004h,0e1h,006h,0e1h,007h,0c3h,007h,0c3h,007h,0c3h,007h,0c3h,007h,083h,007h	; 82df  ................
	defb 01fh,00fh,09fh,00fh,09fh,0cfh,0cfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0dfh,0f7h,0cfh	; 82ef  ................
	defb 058h,0e7h,018h,0e3h,098h,063h,058h,0a3h,0d8h,0a1h,098h,061h,0c8h,0f1h,0c9h,0f0h	; 82ff  X....cX....a....
	defb 0e2h,005h,000h,0e0h,006h,001h,0e1h,006h,000h,0c3h,007h,000h,0c3h,007h,000h,0c3h	; 830f  ................
	defb 007h,000h,0c3h,007h,000h,083h,007h,000h,096h,00fh,000h,017h,08fh,020h,05fh,00fh	; 831f  ............. _.
	defb 080h,08fh,03fh,040h,0ffh,09fh,000h,0ffh,0ffh,000h,0ffh,0dfh,000h,0f7h,0cfh,000h	; 832f  ..?@............
	defb 05eh,0e1h,000h,001h,0c0h,000h,0ach,0d0h,000h,0a8h,0e4h,011h,0eah,0e4h,010h,0e4h	; 833f  ^...............
	defb 0c3h,018h,0ffh,0e1h,000h,0ffh,0ffh,000h,070h,0bfh,000h,0c1h,0c0h,000h,0a0h,0d0h	; 834f  ........p.......
	defb 000h,0a8h,0e4h,011h,0eah,0e4h,010h,0f4h,0d3h,008h,0ffh,0e1h,000h,0ffh,0ffh,000h	; 835f  ................
	defb 073h,083h,077h,083h,000h,00eh,009h,00fh,00eh,009h,00dh,00fh,002h,002h,040h,080h	; 836f  s.w...........@.
	defb 004h,0fdh,083h,012h,050h,080h,006h,03dh,084h,08ch,083h,090h,083h,001h,002h,003h	; 837f  ....P..=........
	defb 00fh,004h,005h,006h,00fh,004h,002h,004h,080h,002h,09dh,084h,012h,044h,080h,002h	; 838f  .............D..
	defb 09dh,084h,012h,000h,084h,010h,0bdh,084h,013h,040h,084h,009h,0bdh,084h,0afh,083h	; 839f  .........@......
	defb 006h,004h,005h,009h,003h,002h,004h,080h,01eh,0bdh,085h,003h,004h,084h,01eh,0bdh	; 83af  ................
	defb 085h,000h,000h,088h,001h,09dh,087h,0cch,083h,0d0h,083h,0d4h,083h,005h,007h,00dh	; 83bf  ................
	defb 000h,001h,002h,004h,005h,001h,002h,003h,004h,006h,000h,004h,080h,004h,0a5h,087h	; 83cf  ................
	defb 002h,014h,080h,001h,0c5h,087h,012h,040h,080h,005h,0d5h,087h,022h,000h,084h,003h	; 83df  .......@...."...
	defb 025h,088h,013h,040h,084h,005h,0d5h,087h,023h,000h,088h,003h,025h,088h,010h,000h	; 83ef  %..@....#...%...
	defb 079h,001h,06fh,013h,0e7h,018h,0d8h,027h,0e7h,018h,0b1h,05eh,0ffh,00fh,003h,003h	; 83ff  y.o....'...^....
	defb 007h,004h,01fh,010h,03fh,03fh,07fh,040h,0f8h,007h,0e8h,017h,0ffh,0bfh,0dfh,0a1h	; 840f  ....??.@........
	defb 0f1h,00fh,0ffh,001h,0ffh,0bfh,0f9h,087h,0ffh,0c1h,079h,047h,079h,047h,069h,057h	; 841f  ..........yGyGiW
	defb 069h,057h,069h,077h,069h,077h,069h,077h,069h,077h,069h,077h,069h,077h	; 842f  iWiwiwiwiwiwiw

; ----------------------------------------------------------------------
; DATOS fichas_escena_8_f1: 6 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 1 de la lista fichas_escena_8; lo leen p04:731E (96
;   bytes)
;   0x843d..0x849d  (96 bytes)
DATA_fichas_escena_8_f1:
	defb 0e2h,01dh,095h,095h,0ffh,000h,000h,000h,033h,033h,011h,011h,0adh,000h,0ffh,0ffh	; 843d  ........33......
	defb 062h,01dh,000h,000h,0ffh,000h,0ffh,0ffh,000h,000h,042h,000h,0f7h,000h,0ffh,0ffh	; 844d  b.........B.....
	defb 0e7h,0e7h,042h,042h,048h,040h,019h,018h,0f8h,0d8h,01bh,018h,079h,058h,01bh,000h	; 845d  ..BBH@......yX..
	defb 0c3h,0c3h,0eeh,0e6h,0e4h,0e4h,0f4h,06ch,0e6h,066h,0f4h,06ch,0f7h,06fh,0fch,064h	; 846d  .......l.f.l.o.d
	defb 002h,000h,017h,000h,017h,000h,097h,000h,0e4h,0e0h,017h,000h,0b0h,0b0h,096h,000h	; 847d  ................
	defb 0f4h,06ch,0f4h,06ch,07ch,064h,0f6h,06eh,0feh,0e6h,067h,067h,07eh,066h,0e6h,0e6h	; 848d  .l.l|d.n..gg~f..

; ----------------------------------------------------------------------
; DATOS fichas_escena_9_f0: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 0 de la lista fichas_escena_9; se solapan 2 bloques:
;   (fichas_escena_9_f1 849D-84BD); lo leen p04:731E (32 bytes)
;   0x849d..0x84bd  (32 bytes)
DATA_fichas_escena_9_f0:
	defb 05bh,085h,04bh,085h,05bh,085h,04bh,085h,04bh,085h,05bh,085h,04bh,085h,04bh,085h	; 849d  [.K.[.K.K.[.K.K.
	defb 07ah,085h,085h,000h,0c9h,006h,0c9h,006h,0c9h,006h,0c9h,006h,0c9h,006h,0f9h,006h	; 84ad  z...............

; ----------------------------------------------------------------------
; DATOS fichas_escena_9_f3: 9 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 3 de la lista fichas_escena_9; se solapan 2 bloques:
;   (fichas_escena_9_f2 84BD-85BD); lo leen p04:731E (256 bytes)
;   0x84bd..0x85bd  (256 bytes)
DATA_fichas_escena_9_f3:
	defb 063h,08fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,07fh,07fh,0bfh,08fh,0c9h,0bfh	; 84bd  c...............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0f6h,0ffh,0f5h,0f6h,0f8h,0f5h,0fbh,0fch	; 84cd  ................
	defb 057h,037h,08ah,0f8h,0a6h,09dh,0d6h,0afh,0efh,0ddh,0c9h,0fbh,08dh,0bbh,0d5h,0f0h	; 84dd  W7..............
	defb 0f2h,0ffh,0fbh,0fch,0feh,0fdh,0bdh,0fah,07ah,0dfh,0edh,0ffh,0e6h,031h,05eh,0c3h	; 84ed  ........z....1^.
	defb 0f0h,0dbh,0cfh,0dfh,0fbh,0f7h,0fbh,0fah,0ffh,0fdh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 84fd  ................
	defb 0b4h,08ah,0adh,092h,0ach,0dbh,0fbh,0ceh,054h,0e9h,0d3h,061h,0edh,0f3h,0f2h,0ffh	; 850d  ........T..a....
	defb 0feh,0ffh,0fdh,0ffh,0f1h,0feh,0f0h,0ffh,0e4h,0fbh,0e4h,0f3h,0fah,0e5h,0fah,0e5h	; 851d  ................
	defb 040h,0aeh,0a2h,059h,0c1h,037h,027h,0cfh,08fh,03fh,03fh,0ffh,0ffh,0ffh,0ffh,0ffh	; 852d  @..Y.7'..??.....
	defb 0fbh,0ffh,0ffh,0ffh,0ddh,0ffh,0ffh,0ffh,0efh,0fbh,0ffh,0ffh,0ffh,0c5h,0ffh,0ffh	; 853d  ................
	defb 0f1h,0e4h,0e8h,0f2h,0ech,0f3h,0f8h,0f5h,0fbh,0f4h,0e9h,0f2h,0e4h,0fbh,0f2h,0fdh	; 854d  ................
	defb 087h,07fh,057h,0afh,087h,07fh,00fh,0ffh,00fh,07fh,0efh,01fh,08fh,07fh,01fh,0ffh	; 855d  ..W.............
	defb 0eeh,0fch,0feh,0fdh,0f6h,0fdh,0f4h,0feh,0fbh,0feh,0fbh,0feh,07ah,0ffh,0fbh,0ffh	; 856d  ............z...
	defb 00fh,0ffh,02fh,05fh,00fh,0ffh,01fh,0ffh,05fh,03fh,03fh,0dfh,09dh,07fh,03fh,05fh	; 857d  ../_...._??...?_
	defb 0bfh,0fdh,0ffh,0fdh,05fh,0fdh,0fdh,0ffh,0feh,0bdh,0ffh,0fch,07ah,0fdh,0edh,0f3h	; 858d  ...._.......z...
	defb 05bh,0bfh,05fh,0bfh,09dh,0ffh,0afh,0dfh,0cfh,0ffh,0bfh,0ffh,05fh,0bdh,06fh,09fh	; 859d  [._........._.o.
	defb 0ffh,000h,000h,0ffh,000h,000h,0a5h,0ffh,05ah,0ffh,0ffh,000h,000h,000h,000h,0ffh	; 85ad  ........Z.......

; ----------------------------------------------------------------------
; DATOS fichas_escena_10_f0: 30 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 0 de la lista fichas_escena_10; se solapan 2 bloques:
;   (fichas_escena_10_f1 85BD-879D); lo leen p04:731E (480 bytes)
;   0x85bd..0x879d  (480 bytes)
DATA_fichas_escena_10_f0:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,020h,040h,000h,060h,070h,060h,008h,030h	; 85bd  ........ @.`p`.0
	defb 00eh,00bh,01dh,017h,01ch,014h,001h,001h,00bh,00ch,07fh,078h,0beh,0c9h,0dch,027h	; 85cd  ...........x...'
	defb 057h,077h,024h,024h,087h,080h,0ffh,010h,0feh,009h,05fh,0a8h,02ch,0d3h,08eh,075h	; 85dd  Ww$$......_.,..u
	defb 094h,098h,0c9h,09eh,076h,057h,07bh,073h,030h,03ch,049h,00fh,02eh,04fh,053h,073h	; 85ed  ....vW{s0<I..OSs
	defb 003h,002h,001h,002h,093h,0d5h,021h,026h,044h,047h,01dh,011h,088h,097h,015h,00eh	; 85fd  ......!&DG......
	defb 07fh,0c3h,037h,0e8h,000h,0ffh,0e2h,0fdh,07dh,099h,00dh,071h,091h,011h,0c6h,03eh	; 860d  ..7.....}..q...>
	defb 019h,0e5h,0f3h,0cbh,0efh,00eh,03ch,0b9h,0f2h,0efh,0c8h,0adh,0b5h,037h,0dah,09ah	; 861d  ......<......7..
	defb 09bh,0a9h,03bh,029h,01fh,01fh,006h,026h,022h,05fh,078h,03fh,004h,07bh,059h,027h	; 862d  ...)...&"_x?.{Y'
	defb 0fah,0aah,025h,065h,0cfh,0cfh,03ch,03fh,0f8h,0ffh,03bh,0bch,0d1h,0feh,06bh,07ch	; 863d  ..%e..<?......k|
	defb 06ah,02eh,0bdh,09dh,0b2h,0aah,05bh,0d7h,0afh,068h,0d0h,030h,0efh,01fh,0f2h,00fh	; 864d  j.....[..h.0....
	defb 02ch,02ch,03ch,01ch,012h,002h,010h,018h,001h,00dh,006h,006h,003h,003h,000h,000h	; 865d  ,,<.............
	defb 02ah,05fh,03ch,03fh,028h,02eh,050h,05eh,036h,03eh,02ch,03ch,03dh,03dh,04ch,04dh	; 866d  *_<?(.P^6>,<==LM
	defb 0f1h,0feh,068h,07fh,0f4h,0fch,0d0h,0f7h,063h,07ch,0a7h,0f8h,0dah,0fah,0c4h,0c7h	; 867d  ..h.....c|......
	defb 0fdh,002h,03eh,0c3h,04fh,071h,0b9h,0b6h,038h,0ffh,088h,07fh,090h,0ffh,02ch,0bbh	; 868d  ..>.Oq..8.....,.
	defb 030h,001h,038h,008h,03ch,014h,026h,01eh,02eh,01eh,01ah,00ah,005h,015h,016h,006h	; 869d  0.8.<.&.........
	defb 0e3h,0ech,083h,0f4h,0c4h,0f7h,0e7h,0ffh,0d0h,0ffh,0e5h,0fah,0c7h,0f8h,0e3h,0fch	; 86ad  ................
	defb 01ch,0dfh,099h,05eh,04bh,0ech,061h,07eh,001h,0feh,0d9h,02eh,0e1h,01eh,0e1h,01eh	; 86bd  ...^K.a~........
	defb 000h,000h,000h,000h,080h,000h,060h,0a0h,0f0h,0f0h,0f0h,0f0h,040h,040h,008h,004h	; 86cd  ......`.....@@..
	defb 04ah,05ah,084h,08ch,002h,00ah,004h,00ch,0aah,0a6h,020h,02ch,08ah,0c6h,00bh,0c7h	; 86dd  JZ........ ,....
	defb 0c7h,0f8h,0cfh,0f0h,0a7h,0f8h,0cbh,0f4h,067h,078h,04bh,074h,067h,078h,063h,07ch	; 86ed  ........gxKtgxc|
	defb 0d1h,02eh,0e1h,01eh,0e1h,01eh,0f8h,00bh,0f6h,00eh,0fbh,007h,0fch,003h,0ffh,000h	; 86fd  ................
	defb 08dh,08bh,008h,00fh,024h,0e7h,081h,0f7h,04ah,0ffh,0aeh,0f6h,0e5h,0fbh,075h,07eh	; 870d  ....$...J.....u~
	defb 0d0h,0f8h,094h,0b8h,088h,05ch,026h,0ech,0ach,0dfh,09eh,0efh,053h,077h,098h,0b7h	; 871d  .....\&.....Sw..
	defb 001h,000h,002h,001h,00fh,007h,00ch,00ch,000h,000h,000h,000h,000h,0c0h,0a0h,0e0h	; 872d  ................
	defb 00fh,083h,057h,053h,027h,023h,036h,033h,03bh,039h,06ah,059h,0d1h,0b0h,0a4h,064h	; 873d  ..WS'#63.9jY...d
	defb 021h,03eh,032h,03dh,099h,09eh,0c9h,0ceh,04ch,0cfh,086h,0c7h,082h,043h,003h,083h	; 874d  !>2=....L....C..
	defb 0c9h,026h,0f3h,01bh,0fch,003h,0f3h,00ch,0f8h,007h,0b9h,047h,07eh,081h,05fh,0a0h	; 875d  .&.........G~._.
	defb 0c0h,0c0h,020h,020h,080h,080h,030h,030h,084h,09ch,0bch,0beh,022h,062h,029h,069h	; 876d  ..  ..00...."b)i
	defb 005h,005h,022h,022h,041h,061h,0cbh,08bh,001h,011h,019h,039h,034h,014h,001h,015h	; 877d  ..""Aa.....94...
	defb 09fh,0e0h,0c7h,0f8h,073h,07ch,01ch,01fh,0c7h,0c7h,0f0h,0f0h,0ech,0ech,05bh,0fbh	; 878d  ....s|........[.

; ----------------------------------------------------------------------
; DATOS fichas_escena_10_f2: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 2 de la lista fichas_escena_10; lo leen p04:731E (8
;   bytes)
;   0x879d..0x87a5  (8 bytes)
DATA_fichas_escena_10_f2:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 879d  ........

; ----------------------------------------------------------------------
; DATOS fichas_escena_11_f0: 4 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 0 de la lista fichas_escena_11; lo leen p04:731E (32
;   bytes)
;   0x87a5..0x87c5  (32 bytes)
DATA_fichas_escena_11_f0:
	defb 000h,000h,000h,020h,000h,000h,000h,000h	; 87a5  ... ....
	defb 000h,002h,000h,000h,000h,020h,001h,000h	; 87ad  ..... ..
	defb 008h,000h,011h,080h,000h,044h,001h,020h	; 87b5  .....D.
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 87bd  ........

; ----------------------------------------------------------------------
; DATOS fichas_escena_11_f1: 1 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 1 de la lista fichas_escena_11; lo leen p04:731E (16
;   bytes)
;   0x87c5..0x87d5  (16 bytes)
DATA_fichas_escena_11_f1:
	defb 000h,000h,002h,000h,000h,000h,000h,000h,000h,000h,000h,020h,001h,000h,000h,000h	; 87c5  ........... ....

; ----------------------------------------------------------------------
; DATOS fichas_escena_11_f2: 5 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 2 de la lista fichas_escena_11; se solapan 2 bloques:
;   (fichas_escena_11_f4 87D5-8825); lo leen p04:731E (80 bytes)
;   0x87d5..0x8825  (80 bytes)
DATA_fichas_escena_11_f2:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0ffh,0f8h,0fch,0f1h,0fbh,0c4h,0fch,080h	; 87d5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0ffh,0e0h,0fch,000h	; 87e5  ................
	defb 0ffh,0f8h,0f9h,0e2h,0f6h,088h,0c6h,038h,063h,010h,00ch,0c0h,038h,000h,031h,000h	; 87f5  .......8c...8.1.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0e0h,0fch,001h,0c3h,000h,0a0h,000h	; 8805  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,080h,008h,017h,006h,0f9h,078h,007h,0f4h,003h	; 8815  ............x...

; ----------------------------------------------------------------------
; DATOS fichas_escena_11_f3: 3 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 3 de la lista fichas_escena_11; se solapan 2 bloques:
;   (fichas_escena_11_f5 8825-8855); lo leen p04:731E (48 bytes)
;   0x8825..0x8855  (48 bytes)
DATA_fichas_escena_11_f3:
	defb 0dah,000h,0b8h,000h,001h,000h,084h,000h,013h,000h,06ch,000h,0bfh,025h,0f8h,0cfh	; 8825  ..........l..%..
	defb 003h,000h,017h,000h,01ch,000h,0fdh,015h,06ch,04fh,0f6h,0b8h,0ach,0d0h,089h,060h	; 8835  ........lO.....`
	defb 025h,000h,0c8h,000h,0c0h,020h,084h,0c0h,020h,080h,038h,000h,052h,000h,030h,000h	; 8845  %.... .. .8.R.0.

; ----------------------------------------------------------------------
; DATOS patrones_8855: RLE de patrones de sprite (p00:492C); lo leen p04:734B
;   (121 bytes)
;   0x8855..0x88ce  (121 bytes)
DATA_patrones_8855:
	defb 081h,000h,003h,001h,086h,000h,003h,003h,007h,007h,003h,003h,001h,003h,003h,084h	; 8855  ................
	defb 0c0h,0e0h,0c0h,0c0h,003h,080h,082h,0d0h,0a0h,003h,080h,003h,000h,082h,080h,000h	; 8865  ................
	defb 003h,001h,081h,000h,003h,003h,08ch,001h,003h,003h,001h,003h,002h,006h,007h,0c0h	; 8875  ................
	defb 0e0h,0c0h,0c0h,004h,080h,081h,0e0h,005h,080h,082h,0c0h,0e0h,004h,000h,081h,001h	; 8885  ................
	defb 003h,003h,088h,001h,003h,007h,007h,003h,001h,001h,003h,004h,000h,08ch,080h,0c0h	; 8895  ................
	defb 080h,080h,000h,080h,0a0h,0c0h,080h,080h,000h,080h,004h,000h,081h,001h,003h,003h	; 88a5  ................
	defb 081h,001h,003h,003h,084h,001h,003h,006h,004h,004h,000h,085h,080h,0c0h,080h,080h	; 88b5  ................
	defb 000h,003h,080h,084h,0c0h,080h,080h,0c0h,000h	; 88c5  .........

; ----------------------------------------------------------------------
; DATOS patrones_88CE: RLE de patrones de sprite (p00:492C); lo leen p04:7354
;   (538 bytes)
;   0x88ce..0x8ae8  (538 bytes)
DATA_patrones_88CE:
	defb 005h,000h,002h,018h,004h,01fh,085h,00fh,01fh,007h,007h,003h,003h,000h,002h,060h	; 88ce  ...............`
	defb 083h,070h,039h,0b8h,005h,0ffh,084h,0f7h,0f0h,0e0h,020h,003h,010h,085h,018h,05ch	; 88de  .p9....... ....\
	defb 0bfh,07fh,03fh,004h,0ffh,083h,0dfh,01fh,00fh,006h,000h,08ah,0d0h,0f0h,0f0h,0f8h	; 88ee  ..?.............
	defb 0f8h,0fah,0feh,0deh,0dah,080h,009h,000h,002h,001h,002h,003h,083h,01bh,01ah,01fh	; 88fe  ................
	defb 004h,000h,08eh,070h,0e0h,0e0h,060h,0c0h,0e6h,0efh,0feh,0feh,0f6h,0ffh,0fdh,0f0h	; 890e  ...p..`.........
	defb 0f0h,020h,000h,088h,014h,01eh,01eh,00fh,003h,003h,001h,001h,007h,000h,081h,0c0h	; 891e  . ..............
	defb 006h,080h,003h,0c0h,083h,080h,0c0h,0e0h,004h,000h,08ch,014h,01dh,01eh,00fh,003h	; 892e  ................
	defb 003h,001h,003h,003h,006h,00ch,006h,003h,000h,081h,0c0h,006h,080h,002h,0c0h,083h	; 893e  ................
	defb 068h,038h,010h,00ah,000h,002h,003h,087h,007h,001h,000h,000h,001h,003h,002h,007h	; 894e  h8..............
	defb 000h,002h,080h,087h,0f0h,0f8h,0fch,0bch,0fch,07eh,0dah,00bh,000h,084h,07fh,0ffh	; 895e  .........~......
	defb 0ffh,008h,00ch,000h,003h,0ffh,081h,020h,00ch,000h,084h,0e0h,0f0h,0f0h,040h,018h	; 896e  ....... ......@.
	defb 000h,002h,001h,092h,003h,007h,01fh,01fh,03ch,078h,070h,000h,003h,007h,00fh,03eh	; 897e  ........<xp....>
	defb 03eh,078h,0f0h,0f0h,0c0h,080h,065h,000h,085h,003h,017h,013h,00bh,009h,003h,007h	; 898e  >x....e.........
	defb 08fh,002h,007h,007h,002h,003h,001h,001h,007h,000h,080h,088h,088h,030h,0c0h,080h	; 899e  .............0..
	defb 007h,000h,002h,080h,022h,000h,09eh,003h,001h,007h,009h,008h,007h,003h,003h,001h	; 89ae  ...."...........
	defb 003h,007h,004h,002h,00eh,000h,000h,080h,0c0h,0d0h,0c8h,088h,0f0h,0c0h,0c0h,080h	; 89be  ................
	defb 0c0h,0e0h,020h,040h,070h,003h,000h,08bh,003h,001h,001h,000h,03bh,007h,003h,00dh	; 89ce  .. @p...........
	defb 01ch,018h,00ch,008h,000h,086h,080h,0c0h,0b8h,088h,000h,0e0h,009h,000h,002h,008h	; 89de  ................
	defb 086h,00bh,007h,003h,02dh,03ch,018h,006h,000h,088h,020h,030h,058h,0a0h,0c0h,080h	; 89ee  ....-<.... 0X...
	defb 080h,000h,003h,080h,005h,000h,098h,004h,003h,000h,001h,003h,007h,007h,00eh,00ch	; 89fe  ................
	defb 008h,078h,030h,000h,000h,010h,00ch,01ch,09ch,078h,0e0h,0f0h,010h,010h,018h,00bh	; 8a0e  .x0......x......
	defb 000h,083h,08fh,0ffh,063h,004h,001h,002h,003h,089h,001h,080h,050h,04ch,05ch,06ch	; 8a1e  ....c.......PL\l
	defb 0f8h,0ffh,081h,003h,080h,004h,000h,081h,080h,043h,000h,003h,040h,085h,000h,048h	; 8a2e  .........C..@..H
	defb 008h,000h,008h,006h,000h,090h,002h,000h,002h,000h,040h,040h,000h,048h,000h,008h	; 8a3e  ..........@@.H..
	defb 008h,000h,040h,040h,000h,000h,003h,044h,002h,010h,09bh,044h,040h,004h,014h,000h	; 8a4e  ..@@...D...D@...
	defb 040h,000h,044h,054h,004h,0a0h,024h,085h,081h,081h,020h,004h,021h,020h,0a4h,005h	; 8a5e  @.DT..$... .! ..
	defb 084h,081h,081h,004h,020h,012h,003h,052h,002h,050h,002h,052h,098h,010h,012h,052h	; 8a6e  .... ..R.P.R...R
	defb 012h,042h,052h,042h,052h,028h,020h,0aah,028h,08ah,0aah,0aah,08ah,0aah,08ah,088h	; 8a7e  .BRBR( .(.......
	defb 0aah,0a8h,02ah,022h,0a2h,004h,000h,002h,001h,09ah,002h,000h,002h,002h,001h,007h	; 8a8e  ..*"............
	defb 017h,001h,002h,000h,000h,020h,0a0h,004h,040h,009h,048h,0c9h,092h,092h,0c2h,050h	; 8a9e  ..... ..@.H....P
	defb 0e6h,0fch,0deh,024h,005h,000h,002h,001h,003h,002h,086h,000h,015h,00fh,052h,007h	; 8aae  ...$..........R.
	defb 004h,005h,000h,08bh,040h,008h,048h,090h,092h,080h,052h,026h,0e4h,0d8h,0b0h,009h	; 8abe  ....@.H...R&....
	defb 000h,08eh,002h,004h,0b9h,006h,0adh,016h,02dh,020h,0a4h,024h,081h,001h,008h,009h	; 8ace  ........- .$....
	defb 003h,000h,086h,080h,000h,050h,02ch,030h,060h,000h	; 8ade  .....P,0`.

; ----------------------------------------------------------------------
; DATOS patrones_8AE8: RLE de patrones de sprite (p00:492C); lo leen p04:737E
;   (764 bytes)
;   0x8ae8..0x8de4  (764 bytes)
DATA_patrones_8AE8:
	defb 003h,000h,08dh,001h,003h,002h,003h,005h,006h,008h,00ah,016h,00dh,006h,003h,001h	; 8ae8  ................
	defb 003h,000h,08dh,080h,040h,0c0h,040h,0e0h,0a0h,090h,090h,0b8h,0f0h,0e0h,0c0h,080h	; 8af8  ....@.@.........
	defb 003h,000h,08dh,001h,002h,003h,002h,006h,005h,00fh,00dh,019h,00ah,005h,002h,001h	; 8b08  ................
	defb 003h,000h,081h,080h,003h,0c0h,089h,0a0h,0e0h,0f0h,0f0h,0d8h,0b0h,0e0h,0c0h,080h	; 8b18  ................
	defb 04ah,000h,087h,001h,00fh,01ah,00eh,001h,000h,001h,003h,003h,002h,006h,08ah,009h	; 8b28  J...............
	defb 00ch,01eh,065h,0beh,0e2h,000h,07bh,0e7h,077h,00ah,000h,087h,001h,00eh,015h,00fh	; 8b38  ..e...{.w.......
	defb 001h,000h,001h,003h,002h,002h,005h,08bh,00eh,00bh,019h,07eh,0c3h,01dh,0ffh,0fdh	; 8b48  ...........~....
	defb 09ah,06ch,080h,003h,040h,08ch,0e0h,0a0h,090h,090h,0b8h,0a6h,073h,0cdh,000h,0dch	; 8b58  .l..@.......s...
	defb 063h,02eh,00ah,000h,087h,080h,0f0h,018h,0f0h,080h,000h,080h,003h,0c0h,08ch,0a0h	; 8b68  c...............
	defb 0e0h,0f0h,0f0h,0d8h,0feh,0cdh,0b2h,0ffh,0bfh,0ddh,0f6h,00ah,000h,08eh,080h,070h	; 8b78  ...............p
	defb 0e8h,0f0h,080h,000h,07fh,03fh,01fh,00fh,003h,002h,003h,001h,008h,000h,084h,09eh	; 8b88  .....?..........
	defb 0bch,0f8h,070h,003h,040h,081h,080h,008h,000h,088h,078h,038h,01ch,00ch,002h,003h	; 8b98  ..p.@.....x8....
	defb 002h,001h,008h,000h,084h,0feh,0dch,0b8h,0b0h,003h,0c0h,081h,080h,008h,000h,005h	; 8ba8  ................
	defb 0f0h,081h,0f8h,003h,078h,002h,07ch,088h,03ch,03eh,03fh,01fh,00fh,060h,060h,070h	; 8bb8  ....x.|.<>?..``p
	defb 003h,030h,003h,018h,003h,00ch,084h,004h,006h,086h,0eeh,004h,08fh,082h,0cfh,0c7h	; 8bc8  .0..............
	defb 003h,047h,002h,043h,088h,023h,021h,020h,010h,008h,0a0h,0a0h,0b0h,003h,0d0h,003h	; 8bd8  .G.C.#! ........
	defb 0e8h,003h,0f4h,08fh,0fch,0fah,07ah,012h,00fh,00fh,007h,027h,0f3h,0f9h,0f8h,078h	; 8be8  ......z....'...x
	defb 03ch,03ch,03eh,004h,01eh,081h,00fh,004h,000h,002h,080h,087h,0c0h,0e0h,060h,030h	; 8bf8  <<>...........`0
	defb 030h,018h,018h,003h,00ch,002h,0f1h,089h,0f9h,0d9h,00ch,016h,0c7h,047h,023h,023h	; 8c08  0............G##
	defb 021h,004h,011h,081h,008h,004h,000h,002h,080h,087h,040h,020h,0a0h,0d0h,0d0h,0e8h	; 8c18  !.........@ ....
	defb 0e8h,003h,0f4h,084h,001h,003h,006h,003h,00ch,000h,087h,0eeh,038h,080h,0feh,07fh	; 8c28  ............8...
	defb 003h,001h,009h,000h,084h,001h,002h,005h,003h,00ch,000h,087h,0e9h,0d7h,07fh,081h	; 8c38  ................
	defb 078h,002h,001h,009h,000h,085h,006h,00fh,00dh,006h,006h,004h,003h,002h,001h,002h	; 8c48  x...............
	defb 003h,098h,007h,01eh,0b9h,000h,000h,040h,0e0h,070h,028h,028h,0bch,0aah,0feh,0bdh	; 8c58  .......@.p((....
	defb 09fh,03dh,02fh,02fh,00eh,006h,009h,00bh,005h,005h,004h,002h,002h,001h,002h,002h	; 8c68  .=//............
	defb 09bh,004h,019h,0a6h,000h,000h,040h,0a0h,0d0h,0f8h,0f8h,064h,07eh,02ah,04bh,065h	; 8c78  ......@....d~*Ke
	defb 0c7h,0d1h,0d1h,0f2h,0dfh,0f1h,0ffh,0ffh,0f9h,0ffh,079h,079h,008h,069h,002h,0ffh	; 8c88  ..........yy.i..
	defb 098h,0f7h,0feh,0dfh,0fch,0deh,0e4h,0fdh,0e8h,0e8h,068h,0fbh,0e8h,0ffh,069h,0a1h	; 8c98  ..........h...i.
	defb 00fh,001h,0bfh,087h,0c1h,047h,047h,057h,057h,006h,077h,090h,0e7h,042h,048h,019h	; 8ca8  .....GGWW.w..BH.
	defb 0f8h,01bh,079h,01bh,002h,017h,017h,097h,0e4h,017h,0b0h,096h,07fh,000h,07fh,000h	; 8cb8  ..y.............
	defb 008h,000h,085h,003h,007h,003h,004h,003h,00bh,000h,085h,0c0h,0e0h,0c0h,020h,0c0h	; 8cc8  .............. .
	defb 009h,000h,088h,003h,007h,00fh,00fh,007h,009h,006h,001h,008h,000h,088h,0c0h,0e0h	; 8cd8  ................
	defb 0f0h,0f0h,0e0h,090h,060h,080h,006h,000h,08ah,003h,007h,00fh,00fh,017h,019h,00fh	; 8ce8  ....`...........
	defb 013h,00ch,003h,006h,000h,08ah,0c0h,0e0h,0f0h,0f0h,0e8h,098h,0f0h,0c8h,030h,0c0h	; 8cf8  ..............0.
	defb 004h,000h,08dh,003h,00fh,017h,01fh,00fh,013h,018h,00fh,007h,02ch,022h,018h,007h	; 8d08  ............,"..
	defb 003h,000h,08dh,040h,0f0h,0f8h,0d8h,0f0h,0c8h,098h,0f0h,0e0h,034h,0c4h,018h,0e0h	; 8d18  ...@........4...
	defb 003h,000h,0bfh,003h,00fh,007h,01fh,013h,01ch,00fh,007h,028h,007h,043h,020h,008h	; 8d28  ...........(.C .
	defb 005h,000h,000h,0c0h,0f0h,0f0h,0f8h,0c8h,0b8h,0f0h,0e0h,014h,0e0h,0c2h,000h,008h	; 8d38  ................
	defb 0e0h,000h,000h,003h,007h,00fh,01bh,01ch,00fh,003h,008h,047h,003h,009h,007h,040h	; 8d48  ...........G...@
	defb 010h,002h,000h,0c0h,0e0h,0f0h,0d8h,0b8h,0f0h,0e0h,010h,0e2h,0c0h,090h,0e1h,000h	; 8d58  ................
	defb 004h,050h,041h,000h,093h,003h,007h,00eh,00dh,00ch,00ah,008h,004h,005h,003h,003h	; 8d68  .PA.............
	defb 00fh,01eh,017h,037h,037h,0c0h,0e0h,030h,004h,010h,09ch,020h,0a0h,0c0h,0c0h,030h	; 8d78  ...77..0... ...0
	defb 078h,0f8h,0ech,0e4h,003h,004h,009h,00ah,00bh,00dh,00fh,007h,007h,002h,002h,00ch	; 8d88  x...............
	defb 017h,01fh,02fh,02fh,0c0h,020h,0d0h,004h,0f0h,002h,0e0h,002h,040h,085h,0f0h,0e8h	; 8d98  ..//. ......@...
	defb 0e8h,0f4h,0fch,045h,000h,08bh,003h,005h,00bh,00eh,01ah,014h,00ah,008h,004h,007h	; 8da8  ...E............
	defb 008h,005h,000h,08bh,0c0h,0e0h,0b0h,010h,008h,008h,010h,010h,020h,0e0h,010h,005h	; 8db8  ............ ...
	defb 000h,08bh,003h,006h,00ch,009h,015h,01bh,00dh,00fh,007h,007h,00fh,005h,000h,08bh	; 8dc8  ................
	defb 0c0h,020h,050h,0f0h,0f8h,0f8h,0f0h,0f0h,0e0h,0e0h,0f0h,000h	; 8dd8  . P.........

; ----------------------------------------------------------------------
; DATOS escena_0_mapa: RLE (L_5578): el mapa de fichas de la escena 0; lo leen
;   p04:72A7 (112 bytes)
;   0x8de4..0x8e54  (112 bytes)
DATA_escena_0_mapa:
	defb 002h,075h,0a3h,072h,076h,070h,076h,070h,071h,081h,080h,003h,002h,0b1h,0a6h,05bh	; 8de4  .u.rvpvpq......[
	defb 0a2h,05ah,05bh,069h,077h,074h,075h,072h,073h,084h,082h,0a2h,0a5h,0b1h,0a6h,058h	; 8df4  .Z[iwturs......X
	defb 003h,064h,055h,056h,06ah,069h,004h,077h,0b7h,059h,003h,002h,0b1h,0a6h,052h,0a2h	; 8e04  .dUVji.w.Y....R.
	defb 062h,054h,052h,056h,065h,05ah,06bh,05bh,05ah,050h,0a2h,0a5h,0b1h,0a6h,0a0h,003h	; 8e14  bTRVeZk[ZP......
	defb 050h,05eh,056h,053h,056h,058h,052h,057h,052h,05eh,003h,002h,0b1h,0a6h,0a0h,0a2h	; 8e24  P^VSVXRWR^......
	defb 000h,000h,05ch,000h,05eh,053h,05ch,056h,050h,0a0h,0a2h,0a5h,0b1h,0a1h,0a0h,001h	; 8e34  ..\.^S\VP.......
	defb 006h,000h,08ah,05ch,05eh,0a4h,0a1h,0a4h,0a4h,0a1h,0a4h,0a2h,004h,010h,0a3h,000h	; 8e44  ...\^...........

; ----------------------------------------------------------------------
; DATOS escena_1_mapa: RLE (L_5578): el mapa de fichas de la escena 1; lo leen
;   p04:72A7 (129 bytes)
;   0x8e54..0x8ed5  (129 bytes)
DATA_escena_1_mapa:
	defb 002h,075h,0a4h,0a7h,003h,002h,0b0h,070h,071h,081h,080h,0a7h,003h,002h,0b0h,085h	; 8e54  .u.....pq.......
	defb 085h,05ah,05bh,0a7h,0a2h,0a5h,0b0h,072h,073h,084h,082h,0a7h,0a2h,0a5h,0b0h,06bh	; 8e64  .Z[....rs......k
	defb 06ah,064h,055h,0a7h,003h,002h,0b0h,004h,077h,0b4h,0a7h,003h,002h,0b0h,065h,064h	; 8e74  jdU.....w.....ed
	defb 062h,054h,0a7h,0a2h,0a5h,0b0h,090h,091h,094h,093h,0a7h,0a2h,0a5h,0b0h,064h,052h	; 8e84  bT............dR
	defb 050h,05eh,0a7h,003h,002h,0b0h,0aah,0b0h,0b3h,0a0h,0a7h,003h,002h,0b0h,05eh,060h	; 8e94  P^............^`
	defb 000h,000h,0a7h,0a2h,0a5h,0b0h,0c0h,0c1h,0c9h,0c8h,0a7h,0a2h,0a5h,0b0h,003h,000h	; 8ea4  ................
	defb 09fh,0aah,0a7h,003h,002h,0b0h,0c2h,0c3h,0cbh,0cah,0a7h,003h,002h,0b0h,0a0h,000h	; 8eb4  ................
	defb 0a0h,0a0h,0a7h,0a2h,0a5h,0c4h,0c5h,0c6h,0c6h,0cdh,0cch,0a2h,0a5h,0b0h,0aah,0aah	; 8ec4  ................
	defb 000h	; 8ed4

; ----------------------------------------------------------------------
; DATOS escena_2_mapa: RLE (L_5578): el mapa de fichas de la escena 2; lo leen
;   p04:72A7 (101 bytes)
;   0x8ed5..0x8f3a  (101 bytes)
DATA_escena_2_mapa:
	defb 083h,003h,006h,005h,007h,008h,0aah,001h,002h,003h,006h,005h,008h,040h,010h,004h	; 8ed5  .............@..
	defb 003h,006h,002h,003h,006h,002h,003h,020h,040h,040h,010h,004h,006h,043h,041h,042h	; 8ee5  ....... @@...CAB
	defb 043h,010h,020h,043h,010h,020h,041h,041h,042h,043h,041h,043h,010h,041h,044h,052h	; 8ef5  C. C. AABCAC.ADR
	defb 030h,003h,041h,089h,042h,041h,044h,052h,052h,038h,044h,052h,041h,003h,031h,081h	; 8f05  0.A.BADRR8DRA.1.
	defb 032h,008h,052h,081h,03ah,003h,039h,002h,012h,082h,011h,015h,008h,050h,088h,025h	; 8f15  2.R.:.9......P.%
	defb 021h,022h,022h,023h,023h,016h,014h,008h,051h,084h,024h,026h,013h,013h,003h,050h	; 8f25  !""##...Q.$&...P
	defb 00ah,000h,003h,058h,000h	; 8f35

; ----------------------------------------------------------------------
; DATOS escena_3_mapa: RLE (L_5578): el mapa de fichas de la escena 3; lo leen
;   p04:72A7 (111 bytes)
;   0x8f3a..0x8fa9  (111 bytes)
DATA_escena_3_mapa:
	defb 097h,001h,002h,003h,006h,005h,008h,080h,008h,081h,080h,081h,080h,081h,080h,008h	; 8f3a  ................
	defb 080h,020h,040h,040h,010h,004h,006h,005h,004h,008h,0a5h,081h,080h,008h,008h,001h	; 8f4a  . @@............
	defb 041h,042h,043h,041h,043h,010h,004h,003h,006h,002h,003h,006h,005h,001h,002h,020h	; 8f5a  ABCAC..........
	defb 052h,052h,042h,044h,042h,041h,043h,043h,010h,020h,043h,010h,004h,020h,040h,040h	; 8f6a  RRBDBACC. C.. @@
	defb 007h,052h,081h,042h,003h,041h,0a5h,042h,041h,041h,042h,043h,061h,062h,063h,061h	; 8f7a  .R.B.A.BAABCabca
	defb 062h,063h,061h,062h,063h,061h,062h,063h,061h,062h,063h,061h,064h,065h,066h,064h	; 8f8a  bcabcabcabcadefd
	defb 065h,066h,064h,065h,066h,064h,065h,066h,064h,065h,066h,064h,010h,031h,000h	; 8f9a  efdefdefdefd.1.

; ----------------------------------------------------------------------
; DATOS escena_4_mapa: 36 bytes que p04:72D3 copia tal cual a 0xD200 (la
;   escena 4); lo leen p04:72D3 (36 bytes)
;   0x8fa9..0x8fcd  (36 bytes)
DATA_escena_4_mapa:
	defb 001h,010h,011h,012h,007h,008h,002h,013h,014h,015h,016h,009h	; 8fa9  ............
	defb 003h,017h,018h,019h,01ah,01bh,004h,030h,031h,032h,01ch,01dh	; 8fb5  .......012..
	defb 005h,01eh,01fh,020h,021h,022h,006h,023h,024h,025h,026h,00ah	; 8fc1  ... !".#$%&.

; ----------------------------------------------------------------------
; DATOS escena_5_mapa: RLE (L_5578): el mapa de fichas de la escena 5; lo leen
;   p04:72A7 (86 bytes)
;   0x8fcd..0x9023  (86 bytes)
DATA_escena_5_mapa:
	defb 004h,008h,08ah,0a0h,0aah,0b9h,0b9h,0bbh,0bbh,0b8h,0bch,0a2h,0a8h,008h,008h,08ah	; 8fcd  ................
	defb 0a1h,0a2h,0b0h,0b0h,060h,06ah,0b1h,0b3h,0aah,0a9h,004h,008h,0b6h,06eh,06ch,06dh	; 8fdd  ....`j.......nlm
	defb 06eh,06dh,0a3h,0b4h,000h,018h,019h,000h,0b1h,0abh,06dh,06dh,06eh,06ch,06dh,065h	; 8fed  nm........mmnlme
	defb 066h,0a4h,065h,066h,0b4h,0b4h,000h,01ah,01bh,000h,0b1h,0b1h,0aah,0a4h,065h,066h	; 8ffd  f.ef..........ef
	defb 0a4h,000h,0b0h,0b0h,000h,0b0h,000h,000h,017h,01ch,01dh,027h,000h,000h,0b1h,0b3h	; 900d  ...........'....
	defb 000h,0b3h,0b3h,012h,031h,000h	; 901d

; ----------------------------------------------------------------------
; DATOS escena_6_mapa: RLE (L_5578): el mapa de fichas de la escena 6; lo leen
;   p04:72A7 (107 bytes)
;   0x9023..0x908e  (107 bytes)
DATA_escena_6_mapa:
	defb 0b4h,005h,001h,002h,003h,020h,040h,040h,010h,004h,006h,005h,001h,002h,003h,006h	; 9023  ..... @@........
	defb 002h,020h,040h,040h,010h,004h,020h,020h,041h,041h,042h,043h,041h,043h,010h,004h	; 9033  . @@..  AABCAC..
	defb 020h,020h,043h,010h,020h,043h,042h,043h,041h,042h,041h,041h,044h,052h,052h,042h	; 9043    C. CBCABAADRRB
	defb 044h,042h,041h,0c8h,0c9h,008h,0cch,08dh,062h,063h,061h,062h,063h,061h,062h,063h	; 9053  DBA.....bcabcabc
	defb 061h,0cah,0c0h,01eh,010h,007h,013h,094h,065h,066h,064h,065h,066h,064h,065h,066h	; 9063  a.......efdefdef
	defb 064h,0cbh,0c1h,01fh,067h,063h,061h,062h,063h,061h,062h,063h,009h,0cdh,08bh,0c4h	; 9073  d...gcabcabc....
	defb 0ceh,041h,064h,066h,064h,065h,066h,064h,065h,066h,000h	; 9083  .Adfdefdef.

; ----------------------------------------------------------------------
; DATOS escena_8_mapa: RLE (L_5578): el mapa de fichas de la escena 8; lo leen
;   p04:72A7 (106 bytes)
;   0x908e..0x90f8  (106 bytes)
DATA_escena_8_mapa:
	defb 002h,075h,0a3h,072h,076h,070h,076h,070h,071h,081h,080h,086h,080h,086h,086h,080h	; 908e  .u.rvpvpq.......
	defb 086h,05ah,05bh,069h,077h,074h,075h,072h,073h,084h,082h,085h,084h,077h,082h,085h	; 909e  .Z[iwturs....w..
	defb 085h,064h,055h,056h,06ah,069h,004h,077h,093h,059h,05ah,05ah,069h,077h,000h,000h	; 90ae  .dUVji.w.YZZiw..
	defb 062h,054h,052h,056h,065h,05ah,06bh,05bh,05ah,050h,052h,057h,004h,000h,08ch,050h	; 90be  bTRVeZk[ZPRW...P
	defb 05eh,056h,053h,056h,058h,052h,057h,052h,05eh,056h,056h,004h,000h,002h,0a0h,08ah	; 90ce  ^VSVXRWR^VV.....
	defb 05ch,000h,05eh,053h,052h,056h,050h,05ch,05eh,05ch,004h,000h,088h,002h,041h,0a4h	; 90de  \.^SRVP\^\....A.
	defb 0a0h,000h,05eh,05ch,05eh,008h,000h,010h,0a3h,000h	; 90ee  ..^\^.....

; ----------------------------------------------------------------------
; DATOS escena_8_dibujo: RLE (L_5578): 5 x 7 fichas que p04:72DF pinta en
;   (0x98, 0x20); lo leen p04:72DF (36 bytes)
;   0x90f8..0x911c  (36 bytes)
DATA_escena_8_dibujo:
	defb 002h,000h,085h,010h,014h,014h,000h,011h,003h,015h,08bh,000h,017h,016h,017h,016h	; 90f8  ................
	defb 000h,019h,018h,019h,018h,010h,004h,015h,08ah,012h,016h,017h,016h,017h,013h,018h	; 9108  ................
	defb 019h,018h,019h,000h	; 9118

; ----------------------------------------------------------------------
; DATOS escena_9_mapa: RLE (L_5578): el mapa de fichas de la escena 9; lo leen
;   p04:72A7 (87 bytes)
;   0x911c..0x9173  (87 bytes)
DATA_escena_9_mapa:
	defb 002h,001h,088h,011h,027h,020h,021h,031h,030h,037h,011h,004h,001h,088h,011h,000h	; 911c  ....' !107......
	defb 022h,023h,033h,032h,000h,011h,004h,001h,088h,011h,000h,024h,025h,035h,034h,000h	; 912c  "#32.......$%54.
	defb 011h,004h,001h,088h,011h,028h,000h,026h,036h,000h,038h,011h,004h,001h,088h,011h	; 913c  .....(.&6.8.....
	defb 028h,000h,029h,02ah,000h,038h,011h,004h,001h,088h,011h,028h,028h,02bh,02ch,038h	; 914c  (.)*.8.....((+,8
	defb 038h,011h,004h,001h,088h,012h,028h,028h,02dh,02eh,028h,028h,012h,003h,001h,081h	; 915c  8.....((-.((....
	defb 002h,008h,02fh,082h,002h,001h,000h	; 916c

; ----------------------------------------------------------------------
; DATOS escena_10_mapa: RLE (L_5578): el mapa de fichas de la escena 10; lo
;   leen p04:72A7 (93 bytes)
;   0x9173..0x91d0  (93 bytes)
DATA_escena_10_mapa:
	defb 002h,040h,088h,001h,040h,002h,003h,023h,022h,040h,021h,004h,040h,088h,004h,005h	; 9173  .@..@..#"@!.@...
	defb 006h,007h,027h,026h,025h,024h,004h,040h,088h,004h,008h,009h,00ah,02ah,029h,028h	; 9183  ..'&%$.@.....*)(
	defb 024h,004h,040h,088h,00bh,00ch,00dh,00eh,02eh,02dh,02ch,02bh,005h,040h,086h,00fh	; 9193  $.@......-,+.@..
	defb 010h,011h,031h,030h,02fh,003h,040h,0a4h,012h,001h,040h,013h,014h,015h,035h,034h	; 91a3  ..10/.@...@...54
	defb 033h,040h,021h,032h,016h,017h,018h,019h,01ah,01bh,03bh,03ah,039h,038h,037h,036h	; 91b3  3@!2.......:9876
	defb 016h,02ch,01ch,040h,01dh,01eh,03eh,03dh,040h,03ch,00ch,036h,000h	; 91c3  .,.@..>=@<.6.

; ----------------------------------------------------------------------
; DATOS escena_11_mapa: RLE (L_5578): el mapa de fichas de la escena 11; lo
;   leen p04:72A7 (97 bytes)
;   0x91d0..0x9231  (97 bytes)
DATA_escena_11_mapa:
	defb 002h,001h,082h,002h,003h,003h,004h,087h,001h,004h,002h,003h,003h,001h,003h,003h	; 91d0  ................
	defb 004h,0a5h,001h,004h,001h,001h,002h,002h,005h,004h,001h,001h,005h,001h,004h,002h	; 91e0  ................
	defb 002h,003h,005h,003h,001h,004h,005h,004h,001h,005h,001h,005h,003h,002h,001h,001h	; 91f0  ................
	defb 004h,001h,001h,002h,003h,002h,002h,003h,001h,002h,004h,087h,001h,002h,002h,005h	; 9200  ................
	defb 001h,004h,001h,004h,004h,09ah,001h,002h,003h,004h,001h,004h,004h,011h,013h,014h	; 9210  ................
	defb 034h,033h,031h,004h,004h,002h,004h,010h,012h,020h,021h,022h,042h,041h,040h,032h	; 9220  431...... !"BA@2
	defb 000h	; 9230

; ----------------------------------------------------------------------
; DATOS fichas_p9665_colores: tabla de colores de la lista fichas_p9665
;   (L_529C indexa con c >> 4); lo leen p05:9665 (6 bytes)
;   0x9231..0x9237  (6 bytes)
DATA_fichas_p9665_colores:
	defb 037h,092h	; 9231
	defb 039h,092h	; 9233
	defb 03dh,092h	; 9235

; ----------------------------------------------------------------------
; DATOS fichas_p9665_col0: 2 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; lo leen p05:9665 (2 bytes)
;   0x9237..0x9239  (2 bytes)
DATA_fichas_p9665_col0:
	defb 001h,002h	; 9237

; ----------------------------------------------------------------------
; DATOS fichas_p9665_col1: 2 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 2 bloques: (fichas_p9665_col1 9239-923D); lo
;   leen p05:9665 (4 bytes)
;   0x9239..0x923d  (4 bytes)
DATA_fichas_p9665_col1:
	defb 001h,003h	; 9239
	defb 00ah,00dh	; 923b

; ----------------------------------------------------------------------
; DATOS fichas_p9665_col2: 2 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 3 bloques: (fichas_p9665_col2 923D-9241)
;   (fichas_p9665_col2 923D-9241); lo leen p05:9665 (4 bytes)
;   0x923d..0x9241  (4 bytes)
DATA_fichas_p9665_col2:
	defb 002h,003h	; 923d
	defb 001h,000h	; 923f

; ----------------------------------------------------------------------
; DATOS fichas_p9665: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p05:9665 (37 bytes)
;   0x9241..0x9266  (37 bytes)
DATA_fichas_p9665:
	defb 006h,000h,004h,080h,001h,066h	; 9241
	defb 092h,010h,008h,080h,001h,06eh	; 9247
	defb 092h,020h,00ch,080h,002h,076h	; 924d
	defb 092h,022h,014h,080h,012h,086h	; 9253
	defb 092h,023h,05ch,080h,003h,076h	; 9259
	defb 093h,012h,068h,080h,002h,0a6h	; 925f
	defb 093h	; 9265

; ----------------------------------------------------------------------
; DATOS fichas_p9665_f0: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 0 de la lista fichas_p9665; lo leen p05:9665 (8 bytes)
;   0x9266..0x926e  (8 bytes)
DATA_fichas_p9665_f0:
	defb 0ffh,0fdh,0bah,07fh,0e7h,0d9h,0ffh,0ffh	; 9266  ........

; ----------------------------------------------------------------------
; DATOS fichas_p9665_f1: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 1 de la lista fichas_p9665; lo leen p05:9665 (8 bytes)
;   0x926e..0x9276  (8 bytes)
DATA_fichas_p9665_f1:
	defb 0f7h,0d5h,0e3h,088h,0e3h,0d5h,0f7h,0ffh	; 926e  ........

; ----------------------------------------------------------------------
; DATOS fichas_p9665_f2: 2 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 2 de la lista fichas_p9665; lo leen p05:9665 (16 bytes)
;   0x9276..0x9286  (16 bytes)
DATA_fichas_p9665_f2:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9276  ........
	defb 0ffh,0efh,0d7h,0b5h,0fah,0ffh,0ffh,0ffh	; 927e  ........

; ----------------------------------------------------------------------
; DATOS fichas_p9665_f3: 18 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 3 de la lista fichas_p9665; se solapan 2 bloques:
;   (fichas_p9665_f4 9376-93A6); lo leen p05:9665 (288 bytes)
;   0x9286..0x93a6  (288 bytes)
DATA_fichas_p9665_f3:
	defb 0dfh,020h,08fh,070h,087h,078h,083h,06ch,081h,066h,081h,066h,0c0h,023h,0c0h,033h	; 9286  . .p.x.l.f.f.#.3
	defb 0e0h,011h,0e0h,019h,0f0h,008h,0f0h,008h,0f0h,008h,0f0h,00ch,0f8h,006h,0fch,002h	; 9296  ................
	defb 0f8h,006h,0e0h,01ch,0c0h,030h,080h,060h,000h,0c0h,000h,098h,000h,024h,000h,000h	; 92a6  .....0.`.....$..
	defb 07fh,080h,07fh,080h,07fh,080h,03fh,0c0h,007h,078h,003h,01ch,001h,006h,000h,003h	; 92b6  ......?..x......
	defb 07fh,080h,07fh,080h,03fh,040h,03fh,040h,01fh,020h,01fh,020h,007h,038h,000h,01fh	; 92c6  ....?@?@. . .8..
	defb 0feh,001h,0f8h,006h,0f0h,00ch,0e0h,018h,0c0h,030h,080h,066h,000h,0c9h,000h,080h	; 92d6  .........0.f....
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0e1h,01eh,080h,071h,000h,0c0h,000h,080h	; 92e6  ...........q....
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,01fh,0e0h,003h,07ch,000h,007h	; 92f6  .............|..
	defb 0fch,003h,0f0h,00eh,0e0h,018h,0c0h,030h,0c0h,020h,080h,066h,080h,049h,000h,080h	; 9306  .......0. .f.I..
	defb 0c0h,020h,0c0h,020h,0c0h,020h,0c0h,020h,080h,06ch,080h,052h,000h,0c0h,000h,080h	; 9316  . . . . .l.R....
	defb 0f0h,00ch,0f8h,004h,0f0h,008h,0e0h,010h,0e0h,010h,0c0h,030h,0c0h,020h,0c0h,020h	; 9326  ...........0. .
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,083h,07ch,000h,0e7h,000h,0e1h,080h,078h	; 9336  .........|.....x
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 9346  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9356  ................
	defb 0ffh,000h,0ffh,000h,0c3h,03ch,0c3h,024h,0c3h,024h,0c3h,03ch,0ffh,000h,0ffh,000h	; 9366  .....<.$.$.<....
	defb 0ffh,0ffh,0ffh,0ffh,0c3h,0c3h,0c0h,0dch,0e0h,0efh,0e0h,0efh,0f0h,0f7h,0f0h,0f7h	; 9376  ................
	defb 0f0h,0f7h,0f0h,0f7h,0e0h,0e7h,0e0h,0efh,0c0h,0dch,0c3h,0c3h,0ffh,0ffh,0ffh,0ffh	; 9386  ................
	defb 0f0h,0f7h,0f0h,0f7h,0f0h,0f7h,0f0h,0f7h,0f0h,0f7h,0f0h,0f7h,0f0h,0f7h,0f0h,0f7h	; 9396  ................

; ----------------------------------------------------------------------
; DATOS fichas_p9665_f5: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 5 de la lista fichas_p9665; lo leen p05:9665 (32 bytes)
;   0x93a6..0x93c6  (32 bytes)
DATA_fichas_p9665_f5:
	defb 0ffh,000h,0ffh,000h,0c3h,000h,0dbh,018h,0dbh,018h,0c3h,000h,0ffh,000h,0ffh,000h	; 93a6  ................
	defb 0ffh,000h,0ffh,000h,0c3h,000h,0c3h,018h,0c3h,018h,0c3h,000h,0ffh,000h,0ffh,000h	; 93b6  ................

; ----------------------------------------------------------------------
; DATOS pantalla_p73B4: RLE (L_5578): fichas a 0xD200 (p04:73B4); lo leen
;   p04:73B4 (86 bytes)
;   0x93c6..0x941c  (86 bytes)
DATA_pantalla_p73B4:
	defb 081h,014h,008h,011h,082h,017h,016h,008h,003h,082h,019h,016h,003h,003h,08ch,004h	; 93c6  ................
	defb 003h,003h,002h,003h,019h,016h,003h,004h,004h,003h,013h,003h,003h,090h,019h,016h	; 93d6  ................
	defb 004h,004h,013h,004h,003h,004h,013h,010h,019h,016h,003h,013h,003h,003h,003h,004h	; 93e6  ................
	defb 09bh,00fh,019h,016h,005h,003h,003h,013h,003h,004h,003h,00eh,019h,016h,006h,008h	; 93f6  ................
	defb 003h,003h,00bh,00ch,00dh,001h,019h,016h,007h,001h,009h,00ah,004h,001h,082h,019h	; 9406  ................
	defb 015h,008h,012h,081h,018h,000h	; 9416

; ======================================================================
; CODIGO 0x941c..0x94c3  (167 bytes)
; ======================================================================


L_941C:
	call 04a1fh		;941c   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	ld b,00fh		;941f
	ld c,007h		;9421
	call 00047h		;9423   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,02840h		;9426
	ld bc,0a848h		;9429
	xor a			;942c
	ld d,001h		;942d
	call 04ba2h		;942f   ; rellena_rectangulo: HMMV (0xC0): rectangulo B x C en (H, L) de la pagina D con el color A
	call caracteres_del_titulo		;9432   ; caracteres_del_titulo: los tres RLE de caracteres del titulo (p05:94C3, 950B, 9550) a la VRAM
	ld hl,09614h		;9435
	call 04a9dh		;9438   ; pon_paleta: ternas [color][RB][G] de HL hasta 0xFF
	ld de,04040h		;943b
	ld hl,09624h		;943e
	call rotulo		;9441   ; rotulo: las fichas del rotulo de HL: 0xFE [dx] baja una fila, 0xFF acaba
	call 04a12h		;9444   ; pantalla_encendida: R#1 con el bit 6 (pantalla) y sprites encendidos
	ld hl,0c240h		;9447   ; apunta a el personaje que se lleva (0 o 1)
	ld (hl),03ch		;944a
	inc hl			;944c
	ld (hl),031h		;944d
	inc hl			;944f
	ld (hl),000h		;9450
	ret			;9452
caracteres_del_titulo:		; los tres RLE de caracteres del titulo (p05:94C3, 950B, 9550) a la VRAM
	ld de,094c3h		;9453
	ld hl,0e800h		;9456   ; apunta a bufer de fichas decodificadas
	call 050b5h		;9459   ; rle_guardando_hl: p00:5578 sin tocar HL
	ld de,00800h		;945c
	ld bc,00d01h		;945f
	call 050bbh		;9462   ; caracteres_guardando_hl: p00:4CBF sin tocar HL
	ld de,0950bh		;9465
	call 050b5h		;9468   ; rle_guardando_hl: p00:5578 sin tocar HL
	ld de,07000h		;946b
	ld bc,00d02h		;946e
	call 050bbh		;9471   ; caracteres_guardando_hl: p00:4CBF sin tocar HL
	ld de,09550h		;9474
	call 050b5h		;9477   ; rle_guardando_hl: p00:5578 sin tocar HL
	ld de,0d800h		;947a
	ld bc,01a03h		;947d
	jp 04cbfh		;9480   ; caracteres: B caracteres de 1 bit de HL en (D, E) de la pagina 1 con el color C
L_9483:
	ld hl,0c240h		;9483   ; 0xC240 cuenta cuadros; cada 2, 0xC241 baja
	dec (hl)			;9486
	ld a,(hl)			;9487
	and 001h		;9488
	ret nz			;948a
	inc hl			;948b
	dec (hl)			;948c
	jr nz,L_9495		;948d   ; a cero: 0xC242 = 1, se acaba
	ld a,001h		;948f
	ld (0c242h),a		;9491
	ret			;9494
L_9495:
	ld a,031h		;9495
	sub (hl)			;9497
	ld c,a			;9498
	ld b,0a8h		;9499
	ld hl,02840h		;949b
	ld d,h			;949e
	ld e,l			;949f
	jp 04841h		;94a0   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
rotulo:		; las fichas del rotulo de HL: 0xFE [dx] baja una fila, 0xFF acaba
	push de			;94a3
L_94A4:
	ld a,(hl)			;94a4   ; [ficha]: 0xFF acaba, 0xFE baja una fila
	inc hl			;94a5
	ld c,a			;94a6
	inc a			;94a7
	jr z,L_94C1		;94a8
	inc a			;94aa
	jr nz,L_94B8		;94ab
	pop de			;94ad   ; 0xFE [dx]: la fila siguiente empieza en D + dx y E + 8
	ld a,(hl)			;94ae
	inc hl			;94af
	add a,d			;94b0
	ld d,a			;94b1
	ld a,008h		;94b2
	add a,e			;94b4
	ld e,a			;94b5
	jr rotulo		;94b6
L_94B8:
	ld a,c			;94b8
	call 04e19h		;94b9
	call 04e3fh		;94bc   ; avanza_ocho: D + 8, y E + 8 si D da la vuelta
	jr L_94A4		;94bf
L_94C1:
	pop de			;94c1
	ret			;94c2

; ----------------------------------------------------------------------
; DATOS caracteres_94C3: RLE (L_5578): 13 caracteres de 1 bit que p05:9453
;   pinta con L_4CBF; lo leen p05:9453 (72 bytes)
;   0x94c3..0x950b  (72 bytes)
DATA_caracteres_94C3:
	defb 002h,007h,003h,00fh,002h,01fh,081h,03fh,008h,0ffh,002h,0f8h,003h,0f0h,003h,0e0h	; 94c3  .......?........
	defb 004h,000h,087h,001h,003h,00fh,07fh,03fh,07fh,07fh,00ah,0ffh,082h,0fch,0f0h,003h	; 94d3  .......?........
	defb 0c0h,002h,080h,007h,000h,083h,001h,003h,007h,003h,00fh,081h,03fh,009h,0ffh,087h	; 94e3  ............?...
	defb 0feh,0fch,0f8h,0f8h,0f0h,0f8h,0c0h,006h,000h,003h,01fh,003h,03fh,002h,07fh,083h	; 94f3  ............?...
	defb 0f0h,0e0h,0e0h,003h,0c0h,002h,080h,000h	; 9503  ........

; ----------------------------------------------------------------------
; DATOS caracteres_950B: RLE (L_5578): 13 caracteres de 1 bit que p05:9453
;   pinta con L_4CBF; lo leen p05:9453 (69 bytes)
;   0x950b..0x9550  (69 bytes)
DATA_caracteres_950B:
	defb 005h,000h,002h,001h,083h,003h,07fh,07fh,00bh,0ffh,002h,0feh,083h,0fch,080h,080h	; 950b  ................
	defb 00dh,000h,087h,007h,003h,007h,007h,00fh,01fh,03fh,009h,0ffh,087h,0f8h,0fch,0f8h	; 951b  .........?......
	defb 0f8h,0f0h,0e0h,0c0h,003h,000h,085h,003h,00fh,01fh,03fh,07fh,003h,0ffh,087h,0fch	; 952b  ..........?.....
	defb 0f0h,0e0h,0c0h,080h,080h,000h,003h,001h,003h,003h,002h,007h,009h,0ffh,002h,0feh	; 953b  ................
	defb 003h,0fch,002h,0f8h,000h	; 954b

; ----------------------------------------------------------------------
; DATOS caracteres_9550: RLE (L_5578): 26 caracteres de 1 bit que p05:9453
;   pinta con L_4CBF; lo leen p05:9453 (196 bytes)
;   0x9550..0x9614  (196 bytes)
DATA_caracteres_9550:
	defb 002h,03ch,002h,078h,092h,079h,0f3h,0f7h,0ffh,01fh,03eh,07ch,0f9h,0f3h,0e3h,0c3h	; 9550  .<.x.y....>|....
	defb 087h,01fh,07fh,0f8h,0f0h,0e0h,0e0h,003h,0c0h,084h,0f0h,0f8h,078h,078h,003h,079h	; 9560  ............xx.y
	defb 002h,07fh,083h,0ffh,0f7h,0f7h,003h,0e7h,002h,00fh,003h,01eh,003h,03ch,088h,003h	; 9570  .............<..
	defb 007h,00fh,00eh,01eh,03ch,038h,078h,005h,0e0h,003h,0e1h,002h,07eh,083h,0feh,0f6h	; 9580  ....<8x.....~...
	defb 0f6h,003h,0eeh,002h,00fh,088h,01fh,01dh,03dh,03bh,07bh,073h,0f1h,0f1h,003h,0e3h	; 9590  ........=.{s....
	defb 003h,0c7h,002h,0e0h,003h,0c0h,003h,080h,003h,001h,003h,003h,002h,007h,088h,0efh	; 95a0  ................
	defb 0e7h,0e7h,0c7h,0c7h,0c3h,083h,083h,003h,087h,003h,0c7h,092h,0e3h,0e0h,080h,080h	; 95b0  ................
	defb 081h,081h,083h,0c7h,0ffh,0feh,0fbh,0f3h,0f3h,0f7h,0e7h,0c7h,08fh,00fh,003h,0c7h	; 95c0  ................
	defb 003h,087h,002h,007h,002h,078h,088h,079h,0f1h,0f3h,0f7h,0e7h,0efh,070h,0f0h,003h	; 95d0  .....x.y.....p..
	defb 0ffh,002h,080h,081h,000h,003h,0e3h,003h,0e7h,002h,0efh,002h,0ceh,081h,0cfh,003h	; 95e0  ................
	defb 08fh,002h,00fh,088h,0f7h,0e7h,0c7h,0cfh,08fh,08fh,01eh,01eh,003h,08fh,003h,01eh	; 95f0  ................
	defb 002h,03ch,090h,007h,008h,017h,014h,017h,014h,008h,007h,080h,040h,020h,0a0h,020h	; 9600  .<..........@ .
	defb 0a0h,040h,080h,000h	; 9610

; ----------------------------------------------------------------------
; DATOS paleta_titulo: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p05:9435 (16 bytes)
;   0x9614..0x9624  (16 bytes)
DATA_paleta_titulo:
	defb 000h,000h,000h	; 9614
	defb 001h,070h,003h	; 9617
	defb 002h,060h,001h	; 961a
	defb 003h,044h,004h	; 961d
	defb 00fh,077h,007h	; 9620
	defb 0ffh	; 9623

; ----------------------------------------------------------------------
; DATOS rotulo_titulo: fichas del rotulo (p05:94A3): 0xFE [dx] baja una fila,
;   0xFF acaba; lo leen p05:943E (65 bytes)
;   0x9624..0x9665  (65 bytes)
DATA_rotulo_titulo:
	defb 001h,002h,003h,0feh,0f8h,004h,005h,006h,007h,0feh,0f0h,008h,009h,00ah,00bh,00eh	; 9624  ................
	defb 00fh,010h,011h,01bh,01ch,01dh,01eh,01fh,020h,021h,022h,023h,024h,025h,026h,0feh	; 9634  ........ !"#$%&.
	defb 000h,00ch,002h,00dh,012h,013h,014h,015h,027h,028h,029h,02ah,02bh,02ch,02dh,02eh	; 9644  ........'()*+,-.
	defb 02fh,030h,031h,032h,033h,034h,0feh,010h,016h,019h,017h,0feh,0f8h,018h,019h,01ah	; 9654  /01234..........
	defb 0ffh	; 9664

; ======================================================================
; CODIGO 0x9665..0x96ab  (70 bytes)
; ======================================================================


L_9665:
	ld hl,09241h		;9665
	ld de,09231h		;9668
	jp 0529ch		;966b   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
L_966E:
	ld a,(0c890h)		;966e   ; la primera vez: 0xC89A = 0xAC y 0xC890 = 1
	and a			;9671
	jr nz,L_967E		;9672
	ld a,0ach		;9674
	ld (0c89ah),a		;9676
	ld hl,0c890h		;9679
	inc (hl)			;967c
	ret			;967d
L_967E:
	ld hl,0c89ah		;967e
	dec (hl)			;9681
	jp z,L_96A5		;9682
	ld a,(hl)			;9685
	and 00fh		;9686
	ret nz			;9688
	ld a,(0c21dh)		;9689   ; lee la ruina (0-4)
	ld hl,096abh		;968c
	call 0543ah		;968f   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;9692
	ld hl,0c8e9h		;9693
	ld a,(hl)			;9696
	cp 01bh		;9697
	jr z,L_96A1		;9699
	ld a,01bh		;969b
L_969D:
	ld (hl),a			;969d
	jp 04db4h		;969e   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
L_96A1:
	ld a,01ah		;96a1
	jr L_969D		;96a3
L_96A5:
	ld a,001h		;96a5
	ld (0c899h),a		;96a7
	ret			;96aa

; ----------------------------------------------------------------------
; DATOS coordenadas_por_ruina: 5 palabras: (X, Y) de pantalla por ruina
;   (p05:968C: p05:96AB[0xC21D]); lo leen p05:968C (10 bytes)
;   0x96ab..0x96b5  (10 bytes)
DATA_coordenadas_por_ruina:
	defb 068h,094h	; 96ab
	defb 060h,084h	; 96ad
	defb 068h,074h	; 96af
	defb 070h,06ch	; 96b1
	defb 078h,07ch	; 96b3

; ======================================================================
; CODIGO 0x96b5..0x96cd  (24 bytes)
; ======================================================================


L_96B5:
	ld hl,083b3h		;96b5
	ld de,083adh		;96b8
	call 0529ch		;96bb   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
	ld hl,09a4bh		;96be
	ld de,09a29h		;96c1
	call 0529ch		;96c4   ; lista_de_fichas: lista de fichas de HL con la tabla de colores DE: [n] y n x [c][destino][cuantas][origen]
	ld de,096cdh		;96c7
	jp 04926h		;96ca   ; rle_a_vram_con_destino: lee la direccion de VRAM de (DE) y sigue en p00:492C

; ----------------------------------------------------------------------
; DATOS patrones_p96CA: [direccion de VRAM] y RLE de patrones de sprite
;   (p00:4926); lo leen p05:96CA (29 bytes)
;   0x96cd..0x96ea  (29 bytes)
DATA_patrones_p96CA:
	defb 000h,0f8h,020h,0ffh,005h,000h,087h,001h,001h,007h,07fh,007h,001h,001h,004h,000h	; 96cd  .. .............
	defb 005h,080h,087h,0c0h,0c0h,0f0h,0ffh,0f0h,0c0h,0c0h,004h,080h,000h	; 96dd  .............

; ======================================================================
; CODIGO 0x96ea..0x9736  (76 bytes)
; ======================================================================


L_96EA:
	call 04a1fh		;96ea   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	xor a			;96ed
	ld (0ca07h),a		;96ee
	ld (0ca06h),a		;96f1
	ld de,09988h		;96f4
	ld hl,0e400h		;96f7   ; apunta a los metabloques (16 fichas cada uno)
	call 05578h		;96fa   ; rle: RLE de DE a HL: 0 acaba, n < 0x80 repite el siguiente, si no copia n & 0x7F
	ld hl,0e400h		;96fd   ; apunta a los metabloques (16 fichas cada uno)
	ld de,0481ch		;9700
	ld b,00fh		;9703
L_9705:
	push bc			;9705
	push de			;9706
	ld b,00eh		;9707
L_9709:
	ld a,(hl)			;9709
	call 04db4h		;970a   ; ficha: la ficha A de la pagina 1 (p00:4E2B) a (D, E): pagina 0, o 1 si 0xC20B
	inc hl			;970d
	ld a,d			;970e
	add a,008h		;970f
	ld d,a			;9711
	djnz L_9709		;9712
	pop de			;9714
	pop bc			;9715
	ld a,e			;9716
	add a,008h		;9717
	ld e,a			;9719
	djnz L_9705		;971a
	ld a,00dh		;971c
	ld de,07707h		;971e
	call 04a73h		;9721   ; pon_color: el color A de la paleta = D (0RRR0BBB) y E (00000GGG), copia en 0xF680
	xor a			;9724
	ld (0c003h),a		;9725   ; guarda la cuenta de cuadros
	ld hl,09736h		;9728
	ld a,(0002bh)		;972b
	and 00fh		;972e
	call nz,04d4ah		;9730   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	jp 04a12h		;9733   ; pantalla_encendida: R#1 con el bit 6 (pantalla) y sprites encendidos

; ----------------------------------------------------------------------
; DATOS texto_p9728: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p05:9728 (18 bytes)
;   0x9736..0x9748  (18 bytes)
DATA_texto_p9728:
	defb 044h,014h,03eh,032h,02fh,020h,03eh,03ch,02fh,02bh,03dh,03fh,03ch,02fh,020h,039h	; 9736  D.>2/ ></+=?</ 9
	defb 030h,0ffh	; 9746

; ======================================================================
; CODIGO 0x9748..0x9782  (58 bytes)
; ======================================================================


L_9748:
	ld b,010h		;9748
L_974A:
	ld a,b			;974a
	dec a			;974b
	ld de,00000h		;974c
	call 04a73h		;974f   ; pon_color: el color A de la paleta = D (0RRR0BBB) y E (00000GGG), copia en 0xF680
	djnz L_974A		;9752
	ret			;9754
L_9755:
	ld hl,0ca05h		;9755
	ld a,(hl)			;9758
	push hl			;9759
	rra			;975a
	rra			;975b
	and 007h		;975c
	add a,a			;975e
	ld hl,09782h		;975f
	call 04083h		;9762   ; hl_mas_a: HL = HL + A
	ld de,0de00h		;9765   ; apunta a los atributos de los sprites en RAM
	ldi		;9768
	ldi		;976a
	ld a,004h		;976c
	ld (de),a			;976e
	ld hl,0dc00h		;976f   ; apunta a los colores de los sprites en RAM (16 por sprite)
	ld de,0dc01h		;9772
	ld bc,0000fh		;9775
	ld (hl),00dh		;9778
	ldir		;977a
	call 05690h		;977c   ; atributos_a_vram: 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
	pop hl			;977f
	inc (hl)			;9780
	ret			;9781

; ----------------------------------------------------------------------
; DATOS tabla_p975F: 8 x 2 bytes que p05:9768 copia a 0xDE00 segun ((0xCA05)
;   >> 2) & 7; lo leen p05:975F (16 bytes)
;   0x9782..0x9792  (16 bytes)
DATA_tabla_p975F:
	defb 018h,078h	; 9782
	defb 044h,050h	; 9784
	defb 02ch,098h	; 9786
	defb 01ch,058h	; 9788
	defb 04ch,0a0h	; 978a
	defb 04ch,078h	; 978c
	defb 02ch,040h	; 978e
	defb 01ch,0c0h	; 9790

; ======================================================================
; CODIGO 0x9792..0x98b1  (287 bytes)
; ======================================================================


L_9792:
	ld a,(0c003h)		;9792   ; cada 4 cuadros, un paso del fundido desde negro de la paleta de p06:B550
	and 003h		;9795
	ret nz			;9797
	ld de,0ca06h		;9798
	ld a,(de)			;979b   ; la terna 0xCA06 de la paleta: [color][RB][G]
	ld b,a			;979c
	add a,a			;979d
	add a,b			;979e
	ld hl,0b550h		;979f
	call 04083h		;97a2   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;97a5   ; 0xFF: acabado
	inc a			;97a6
	jr z,L_980C		;97a7
	ld c,(hl)			;97a9
	inc hl			;97aa
	ld a,(hl)			;97ab   ; 7 menos cada componente (rojo, azul, verde) a 0xCA08-0xCA0A
	and 0f0h		;97ac
	rra			;97ae
	rra			;97af
	rra			;97b0
	rra			;97b1
	sub 007h		;97b2
	neg		;97b4
	inc e			;97b6
	inc e			;97b7
	ld (de),a			;97b8
	ld a,(hl)			;97b9
	and 00fh		;97ba
	sub 007h		;97bc
	neg		;97be
	inc e			;97c0
	ld (de),a			;97c1
	inc hl			;97c2
	ld a,(hl)			;97c3
	and 00fh		;97c4
	sub 007h		;97c6
	neg		;97c8
	inc e			;97ca
	ld (de),a			;97cb
	ld a,(0ca08h)		;97cc   ; rojo: el paso (0xCA07) menos ese valor, sin bajar de cero
	ld b,a			;97cf
	ld a,(0ca07h)		;97d0
	sub b			;97d3
	jr nc,L_97D7		;97d4
	xor a			;97d6
L_97D7:
	rla			;97d7   ; el rojo al nibble alto del primer byte (0RRR0BBB)
	rla			;97d8
	rla			;97d9
	rla			;97da
	and 0f0h		;97db
	ld d,a			;97dd
	ld a,(0ca09h)		;97de   ; el azul: el paso menos 0xCA09
	ld b,a			;97e1
	ld a,(0ca07h)		;97e2
	sub b			;97e5
	jr nc,L_97E9		;97e6
	xor a			;97e8
L_97E9:
	and 00fh		;97e9
	or d			;97eb
	ld d,a			;97ec
	ld a,(0ca0ah)		;97ed   ; verde, igual
	ld b,a			;97f0
	ld a,(0ca07h)		;97f1
	sub b			;97f4
	jr nc,L_97F8		;97f5
	xor a			;97f7
L_97F8:
	and 00fh		;97f8
	ld e,a			;97fa
	ld a,c			;97fb   ; el color con esos tres valores
	call 04a73h		;97fc   ; pon_color: el color A de la paleta = D (0RRR0BBB) y E (00000GGG), copia en 0xF680
	ld hl,0ca07h		;97ff   ; 8 pasos por color; luego el siguiente color de la paleta
	inc (hl)			;9802
	ld a,(hl)			;9803
	cp 008h		;9804
	ret c			;9806
	ld (hl),000h		;9807
	dec hl			;9809
	inc (hl)			;980a
	ret			;980b
L_980C:
	ld hl,0de00h		;980c   ; apunta a los atributos de los sprites en RAM
	ld (hl),09ch		;980f
	inc l			;9811
	ld (hl),010h		;9812
	inc l			;9814
	ld (hl),000h		;9815
	inc l			;9817
	inc l			;9818
	ld (hl),09ch		;9819
	inc l			;981b
	ld (hl),0e0h		;981c
	inc l			;981e
	ld (hl),000h		;981f
	ld hl,0dc00h		;9821   ; apunta a los colores de los sprites en RAM (16 por sprite)
	ld de,0dc01h		;9824
	ld bc,0001fh		;9827
	ld (hl),00fh		;982a
	ldir		;982c
	call 05690h		;982e   ; atributos_a_vram: 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
	ld a,001h		;9831
	ld (0ca00h),a		;9833
	ret			;9836
L_9837:
	ld hl,0ca00h		;9837
	ld bc,0002fh		;983a
	jp 05f08h		;983d   ; borra: pone a cero BC + 1 bytes desde HL
L_9840:
	ld hl,0ca10h		;9840
	ld bc,00018h		;9843
	call 05f08h		;9846   ; borra: pone a cero BC + 1 bytes desde HL
	ld a,(0002bh)		;9849
	and 00fh		;984c
	ld hl,0994dh		;984e
	jr z,L_9856		;9851
	ld hl,098b1h		;9853
L_9856:
	ld a,(0ca02h)		;9856
	ld b,a			;9859
	ld de,0ca10h		;985a
	ld a,019h		;985d
	sub b			;985f
	jr nc,L_9868		;9860
	neg		;9862
	call 04083h		;9864   ; hl_mas_a: HL = HL + A
	xor a			;9867
L_9868:
	call 04088h		;9868   ; de_mas_a: DE = DE + A
	ld a,(hl)			;986b
	inc a			;986c
	jr nz,L_9883		;986d
	ld a,001h		;986f
	ld (0ca01h),a		;9871
	ld hl,010a0h		;9874
	ld bc,0e008h		;9877
	call 05e2fh		;987a   ; borra_rectangulo: HMMV con 0xFF en la pagina 0
	ld hl,05068h		;987d
	jp 04d4ah		;9880   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
L_9883:
	ld c,(hl)			;9883   ; copia una linea del texto (hasta B caracteres o 0xFF) a 0xCA10
	inc c			;9884
	jr z,L_988D		;9885
	ld a,(hl)			;9887
	ld (de),a			;9888
	inc hl			;9889
	inc de			;988a
	djnz L_9883		;988b
L_988D:
	ld a,0ffh		;988d   ; la linea en (0xA0, 0x20) menos la cuenta de 0xCA03 (sube)
	ld (0ca2ah),a		;988f
	ld de,020a0h		;9892
	ld a,(0ca03h)		;9895
	ld b,a			;9898
	ld a,d			;9899
	sub b			;989a
	ld d,a			;989b
	ld hl,0ca10h		;989c
	ld c,0ffh		;989f
	call 04d54h		;98a1
	ld hl,0ca03h		;98a4   ; cada 8 pasos, la siguiente linea (0xCA02)
	inc (hl)			;98a7
	ld a,(hl)			;98a8
	cp 008h		;98a9
	ret c			;98ab
	ld (hl),000h		;98ac
	dec hl			;98ae
	inc (hl)			;98af
	ret			;98b0

; ----------------------------------------------------------------------
; DATOS prologo_no_japones: el texto del prologo, caracteres hasta 0xFF;
;   p05:9853 lo elige si la BIOS no es japonesa (0x002B); lo leen p05:9853
;   (156 bytes)
;   0x98b1..0x994d  (156 bytes)
DATA_prologo_no_japones:
	defb 03eh,032h,02fh,020h,03eh,03ch,02fh,02bh,03dh,03fh,03ch,02fh,020h,039h,030h,020h	; 98b1  >2/ ></+=?</ 90
	defb 03fh,03dh,02bh,03dh,020h,032h,02bh,03dh,020h,02ch,02fh,02fh,038h,020h,03dh,03ah	; 98c1  ?=+= 2+= ,//8 =:
	defb 036h,033h,03eh,020h,033h,038h,03eh,039h,020h,025h,020h,03ah,02bh,03ch,03eh,03dh	; 98d1  63> 38>9 % :+<>=
	defb 020h,02eh,03fh,03ch,033h,038h,031h,020h,03eh,032h,02fh,020h,036h,039h,038h,031h	; 98e1   .?<381 >2/ 6981
	defb 020h,03ah,02fh,03ch,033h,039h,02eh,020h,039h,030h,020h,03eh,032h,02fh,020h,032h	; 98f1   :/<39. 90 >2/ 2
	defb 033h,03dh,03eh,039h,03ch,043h,020h,020h,020h,020h,020h,020h,020h,03eh,032h,02fh	; 9901  3=>9<C       >2/
	defb 043h,020h,03dh,03eh,02bh,03ch,03eh,02fh,02eh,020h,02bh,020h,034h,039h,03fh,03ch	; 9911  C =>+<>/. + 49?<
	defb 038h,02fh,043h,020h,03eh,039h,020h,03dh,033h,036h,035h,020h,03ch,039h,02bh,02eh	; 9921  8/C >9 =365 <9+.
	defb 020h,033h,038h,020h,03dh,02fh,02bh,03ch,02dh,032h,020h,039h,030h,020h,03eh,032h	; 9931   38 =/+<-2 90 >2
	defb 02fh,020h,03eh,03ch,02fh,02bh,03dh,03fh,03ch,02fh,020h,0ffh	; 9941  / ></+=?</ .

; ----------------------------------------------------------------------
; DATOS prologo_japones: el texto del prologo en japones, caracteres hasta
;   0xFF (p05:984E, BIOS japonesa); lo leen p05:984E (59 bytes)
;   0x994d..0x9988  (59 bytes)
DATA_prologo_japones:
	defb 050h,051h,052h,053h,054h,055h,056h,057h,058h,059h,05ah,05bh,05ch,054h,05dh,05eh	; 994d  PQRSTUVWXYZ[\T]^
	defb 05fh,060h,061h,062h,063h,064h,065h,066h,067h,020h,020h,020h,020h,020h,020h,068h	; 995d  _`abcdefg      h
	defb 069h,06ah,058h,06bh,054h,055h,056h,06ch,06dh,06eh,06fh,058h,051h,070h,071h,072h	; 996d  ijXkTUVlmnoXQpqr
	defb 073h,074h,075h,076h,077h,078h,079h,07ah,066h,067h,0ffh	; 997d  stuvwxyzfg.

; ----------------------------------------------------------------------
; DATOS fichas_p96F4: RLE (L_5578): a 0xE400 (p05:96F4); lo leen p05:96F4 (161
;   bytes)
;   0x9988..0x9a29  (161 bytes)
DATA_fichas_p96F4:
	defb 005h,000h,084h,041h,042h,045h,044h,008h,000h,088h,001h,000h,002h,003h,023h,022h	; 9988  ...ABED.......#"
	defb 000h,021h,006h,000h,088h,004h,005h,006h,007h,027h,026h,025h,024h,006h,000h,088h	; 9998  .!.......'&%$...
	defb 004h,008h,009h,00ah,02ah,029h,028h,024h,006h,000h,088h,00bh,00ch,00dh,00eh,02eh	; 99a8  ....*)($........
	defb 02dh,02ch,02bh,007h,000h,086h,00fh,010h,011h,031h,030h,02fh,008h,000h,086h,013h	; 99b8  -,+......10/....
	defb 014h,015h,035h,034h,033h,008h,000h,086h,019h,01ah,01bh,03bh,03ah,039h,004h,000h	; 99c8  ..543.......:9..
	defb 088h,07ah,077h,072h,07bh,072h,000h,040h,043h,006h,000h,0b8h,07ch,076h,000h,073h	; 99d8  .zwr{r.@C...|v.s
	defb 07dh,078h,07eh,056h,07fh,080h,081h,082h,083h,084h,052h,053h,000h,05ah,055h,085h	; 99e8  }x~V......RS.ZU.
	defb 079h,057h,074h,086h,087h,088h,089h,075h,058h,053h,000h,05ah,05bh,05ch,08ah,05dh	; 99f8  yWt....uXS.Z[\.]
	defb 000h,05eh,05fh,060h,061h,062h,063h,064h,065h,066h,000h,067h,068h,069h,000h,06ah	; 9a08  .^_`abcdef.ghi.j
	defb 06bh,06ch,06dh,071h,004h,000h,083h,06eh,06fh,070h,00ch,000h,081h,08bh,008h,000h	; 9a18  klmq...nop......
	defb 000h	; 9a28

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_colores: tabla de colores de la lista fichas_p96BE
;   (L_529C indexa con c >> 4); lo leen p05:96BE (10 bytes)
;   0x9a29..0x9a33  (10 bytes)
DATA_fichas_p96BE_colores:
	defb 033h,09ah	; 9a29
	defb 037h,09ah	; 9a2b
	defb 03fh,09ah	; 9a2d
	defb 043h,09ah	; 9a2f
	defb 047h,09ah	; 9a31

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_col0: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 2 bloques: (fichas_p96BE_col0 9A33-9A37); lo
;   leen p05:96BE (4 bytes)
;   0x9a33..0x9a37  (4 bytes)
DATA_fichas_p96BE_col0:
	defb 006h,005h,009h,004h	; 9a33

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_col1: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 2 bloques: (fichas_p96BE_col1 9A37-9A3F); lo
;   leen p05:96BE (8 bytes)
;   0x9a37..0x9a3f  (8 bytes)
DATA_fichas_p96BE_col1:
	defb 000h,007h,008h,00ch	; 9a37
	defb 00bh,004h,005h,006h	; 9a3b

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_col2: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; lo leen p05:96BE (4 bytes)
;   0x9a3f..0x9a43  (4 bytes)
DATA_fichas_p96BE_col2:
	defb 000h,007h,008h,00bh	; 9a3f

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_col3: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; lo leen p05:96BE (4 bytes)
;   0x9a43..0x9a47  (4 bytes)
DATA_fichas_p96BE_col3:
	defb 000h,007h,00ch,00bh	; 9a43

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_col4: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; lo leen p05:96BE (4 bytes)
;   0x9a47..0x9a4b  (4 bytes)
DATA_fichas_p96BE_col4:
	defb 007h,008h,00ch,00bh	; 9a47

; ----------------------------------------------------------------------
; DATOS fichas_p96BE: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p05:96BE (43 bytes)
;   0x9a4b..0x9a76  (43 bytes)
DATA_fichas_p96BE:
	defb 007h,002h,000h,088h,003h,076h	; 9a4b
	defb 09ah,003h,00ch,088h,003h,076h	; 9a51
	defb 09ah,012h,048h,088h,020h,0a6h	; 9a57
	defb 09ah,022h,048h,08ch,004h,0a6h	; 9a5d
	defb 09ch,042h,058h,08ch,002h,0e6h	; 9a63
	defb 09ch,032h,060h,08ch,002h,006h	; 9a69
	defb 09dh,014h,068h,08ch,012h,026h	; 9a6f
	defb 09dh	; 9a75

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_f0: 3 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_p96BE; se solapan 2 bloques:
;   (fichas_p96BE_f1 9A76-9AA6); lo leen p05:96BE (48 bytes)
;   0x9a76..0x9aa6  (48 bytes)
DATA_fichas_p96BE_f0:
	defb 07fh,09fh,03fh,0c7h,00fh,073h,003h,01ch,000h,007h,000h,000h,000h,000h,000h,000h	; 9a76  ..?..s..........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,003h,002h,004h,005h,008h	; 9a86  ................
	defb 000h,000h,000h,000h,000h,005h,01ah,025h,0adh,0d6h,059h,07bh,0d1h,0beh,0b1h,047h	; 9a96  .......%..Y{...G

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_f2: 32 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 2 de la lista fichas_p96BE; lo leen p05:96BE (512 bytes)
;   0x9aa6..0x9ca6  (512 bytes)
DATA_fichas_p96BE_f2:
	defb 00eh,003h,00eh,003h,00eh,003h,00eh,003h,00eh,003h,00eh,003h,00eh,003h,00eh,003h	; 9aa6  ................
	defb 007h,0fch,007h,0fch,007h,0fch,007h,0fch,007h,0fch,007h,0fch,007h,0fch,007h,0fch	; 9ab6  ................
	defb 001h,006h,001h,006h,001h,006h,001h,006h,001h,006h,001h,006h,001h,006h,001h,006h	; 9ac6  ................
	defb 0c7h,07eh,0c3h,07eh,0c3h,07fh,0c1h,07fh,0c0h,07fh,0c0h,07fh,0e0h,03fh,0e0h,03fh	; 9ad6  .~.~.........?.?
	defb 000h,000h,000h,000h,000h,000h,001h,000h,002h,001h,002h,001h,004h,002h,004h,002h	; 9ae6  ................
	defb 004h,002h,004h,002h,004h,002h,004h,002h,004h,002h,005h,002h,006h,003h,004h,002h	; 9af6  ................
	defb 00eh,003h,00eh,003h,00eh,003h,00eh,003h,00eh,003h,006h,003h,007h,001h,007h,001h	; 9b06  ................
	defb 007h,0fch,007h,0fch,007h,0fch,007h,0fch,007h,0fch,007h,0fch,007h,0fch,007h,0fch	; 9b16  ................
	defb 001h,006h,001h,006h,001h,006h,001h,006h,001h,006h,001h,006h,001h,006h,001h,006h	; 9b26  ................
	defb 070h,01fh,078h,01fh,03ch,00fh,01eh,007h,00fh,001h,003h,000h,000h,000h,000h,000h	; 9b36  p.x.<...........
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,080h,0ffh,0e0h,07fh,0f8h,01fh,03eh,007h	; 9b46  ..............>.
	defb 004h,002h,004h,002h,004h,002h,084h,002h,084h,002h,0c4h,002h,0c4h,082h,0c4h,082h	; 9b56  ................
	defb 038h,00fh,038h,00fh,038h,00fh,038h,00fh,038h,00fh,038h,00fh,038h,00fh,038h,00fh	; 9b66  8.8.8.8.8.8.8.8.
	defb 0e0h,080h,0e2h,080h,0e2h,080h,0e2h,080h,0e3h,080h,0e3h,080h,0e3h,081h,0e3h,081h	; 9b76  ................
	defb 07ch,00fh,01fh,003h,007h,000h,001h,000h,000h,000h,000h,000h,080h,000h,080h,000h	; 9b86  |...............
	defb 001h,0ffh,000h,0ffh,0c0h,0ffh,0f0h,03fh,078h,00fh,01ch,007h,00eh,007h,006h,003h	; 9b96  .......?x.......
	defb 0c0h,080h,0e0h,080h,0e0h,0c0h,060h,0c0h,060h,0c0h,060h,0c0h,060h,0c0h,060h,0c0h	; 9ba6  ......`.`.`.`.`.
	defb 003h,001h,003h,000h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9bb6  ................
	defb 007h,0fch,083h,0feh,0e3h,07eh,0fdh,01fh,03fh,003h,007h,000h,000h,000h,000h,000h	; 9bc6  .....~..?.......
	defb 080h,000h,080h,000h,0c0h,000h,0f0h,000h,0ffh,0c0h,0ffh,000h,000h,000h,000h,000h	; 9bd6  ................
	defb 002h,00ch,002h,00ch,004h,018h,018h,060h,062h,080h,082h,000h,001h,000h,001h,000h	; 9be6  .......`b.......
	defb 00fh,001h,003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9bf6  ................
	defb 080h,0ffh,0c0h,07fh,0e0h,03fh,070h,01fh,030h,01fh,038h,00fh,039h,00fh,039h,00fh	; 9c06  .....?p.0.8.9.9.
	defb 0c4h,082h,0c4h,082h,0c4h,082h,0c4h,082h,0c6h,09fh,0dfh,080h,080h,000h,080h,000h	; 9c16  ................
	defb 038h,00fh,038h,00fh,038h,00fh,038h,00fh,03fh,0ffh,0ffh,000h,000h,000h,000h,000h	; 9c26  8.8.8.8.?.......
	defb 0e2h,081h,0e2h,081h,0e2h,081h,0e2h,081h,0e3h,0f8h,0fah,000h,000h,000h,000h,000h	; 9c36  ................
	defb 0c0h,080h,0c0h,080h,060h,0c0h,0f0h,000h,01ch,000h,007h,000h,000h,000h,000h,000h	; 9c46  ....`...........
	defb 006h,003h,006h,003h,00dh,007h,01fh,006h,07eh,008h,0f8h,000h,000h,000h,000h,000h	; 9c56  ........~.......
	defb 080h,000h,0c0h,000h,060h,000h,038h,000h,01eh,008h,00fh,002h,003h,000h,000h,000h	; 9c66  ....`.8.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,003h,000h,0ffh,003h,0ffh,0ffh,0ffh,000h	; 9c76  ................
	defb 03bh,00eh,033h,01eh,076h,01ch,0ech,038h,0f8h,070h,0f0h,0c0h,0c0h,000h,000h,000h	; 9c86  ..3.v..8.p......
	defb 0e0h,080h,0c0h,080h,0c0h,000h,080h,000h,000h,0f1h,000h,05bh,000h,055h,000h,051h	; 9c96  ...........[.U.Q

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_f3: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 3 de la lista fichas_p96BE; lo leen p05:96BE (64 bytes)
;   0x9ca6..0x9ce6  (64 bytes)
DATA_fichas_p96BE_f3:
	defb 0f0h,0c0h,000h,0f0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9ca6  ................
	defb 001h,007h,001h,007h,001h,007h,001h,007h,001h,007h,001h,007h,001h,006h,001h,007h	; 9cb6  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,00eh,000h,0ffh,000h,000h	; 9cc6  ................
	defb 0c0h,000h,0c0h,000h,040h,000h,040h,000h,000h,000h,000h,000h,080h,080h,0c0h,040h	; 9cd6  ....@.@........@

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_f4: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 4 de la lista fichas_p96BE; lo leen p05:96BE (32 bytes)
;   0x9ce6..0x9d06  (32 bytes)
DATA_fichas_p96BE_f4:
	defb 0f9h,005h,0f9h,005h,0f9h,005h,0f9h,005h,0f9h,005h,0f9h,005h,0f8h,004h,0f9h,005h	; 9ce6  ................
	defb 077h,077h,000h,0ffh,0f9h,005h,0f9h,005h,0f9h,005h,0f9h,005h,0f9h,005h,0f9h,005h	; 9cf6  ww..............

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_f5: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 5 de la lista fichas_p96BE; lo leen p05:96BE (32 bytes)
;   0x9d06..0x9d26  (32 bytes)
DATA_fichas_p96BE_f5:
	defb 07fh,03eh,0ffh,000h,061h,080h,080h,000h,080h,000h,000h,000h,000h,000h,000h,000h	; 9d06  .>..a...........
	defb 003h,000h,003h,000h,001h,000h,001h,000h,000h,000h,0c0h,0c0h,060h,0a0h,018h,0e8h	; 9d16  ............`...

; ----------------------------------------------------------------------
; DATOS fichas_p96BE_f6: 18 fichas de 8x8 a 3 bit(s) por punto (24 bytes cada
;   una), entrada 6 de la lista fichas_p96BE; lo leen p05:96BE (432 bytes)
;   0x9d26..0x9ed6  (432 bytes)
DATA_fichas_p96BE_f6:
	defb 0e3h,000h,01ch,00fh,0ffh,000h,00ah,003h,004h,00ah,003h,004h,00ah,003h,004h,00ah,003h,004h,00ah,003h,004h,00ah,003h,004h	; 9d26  ........................
	defb 038h,000h,007h,007h,03fh,000h,000h,006h,001h,000h,006h,001h,000h,006h,001h,000h,006h,001h,000h,006h,001h,000h,006h,001h	; 9d3e  8...?...................
	defb 00ah,003h,004h,00ah,003h,004h,00ah,003h,004h,00ah,003h,004h,00ah,003h,004h,00ah,003h,004h,00eh,003h,000h,00ah,003h,004h	; 9d56  ........................
	defb 000h,000h,000h,000h,000h,003h,00fh,001h,000h,01fh,007h,000h,03bh,00eh,000h,073h,01eh,000h,067h,03ch,000h,0e7h,03ch,000h	; 9d6e  ...............s..g<..<.
	defb 000h,000h,001h,001h,000h,0c2h,0c7h,002h,038h,07dh,01eh,000h,039h,00eh,000h,01dh,006h,000h,00fh,006h,000h,007h,002h,000h	; 9d86  ........8}..9...........
	defb 00ch,000h,003h,02fh,003h,010h,042h,020h,081h,000h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9d9e  .../..B ................
	defb 090h,000h,060h,0fah,0f0h,004h,0ceh,0fch,001h,0a3h,03eh,040h,051h,01fh,020h,071h,01fh,000h,028h,00fh,010h,028h,00fh,010h	; 9db6  ..`.......>@Q. q..(..(..
	defb 000h,000h,000h,000h,000h,000h,001h,000h,000h,003h,000h,080h,083h,001h,040h,087h,081h,040h,0c6h,083h,020h,0c6h,083h,020h	; 9dce  ..............@..@.. ..
	defb 008h,000h,007h,05fh,000h,020h,0f0h,020h,000h,0e0h,0c0h,000h,060h,0c0h,000h,060h,0c0h,000h,070h,0c0h,000h,030h,0e0h,000h	; 9de6  ..._. . ....`..`..p..0..
	defb 040h,000h,080h,0e0h,000h,010h,072h,000h,00dh,01fh,007h,000h,00eh,003h,000h,007h,001h,000h,003h,001h,000h,001h,000h,000h	; 9dfe  @.....r.................
	defb 000h,000h,040h,040h,000h,080h,0c0h,080h,000h,040h,080h,000h,040h,080h,000h,040h,080h,000h,0c0h,080h,000h,0c0h,080h,000h	; 9e16  ..@@.....@..@..@........
	defb 080h,000h,000h,080h,000h,000h,0c0h,000h,020h,0f0h,0c0h,008h,07ch,0f0h,003h,01fh,0feh,000h,003h,0ffh,000h,000h,0ffh,000h	; 9e2e  ........ ...|...........
	defb 028h,00fh,010h,028h,00fh,010h,038h,00fh,000h,028h,00fh,010h,028h,00fh,010h,068h,00fh,090h,038h,0cfh,000h,038h,00fh,000h	; 9e46  (..(..8..(..(..h..8..8..
	defb 0c6h,083h,020h,0c6h,083h,020h,0c6h,083h,020h,0e7h,081h,000h,0c3h,081h,020h,0e3h,080h,000h,0c1h,080h,020h,0e0h,080h,000h	; 9e5e  .. .. .. ..... ..... ...
	defb 038h,0f0h,004h,01eh,0f8h,001h,007h,0feh,000h,001h,0ffh,000h,000h,0ffh,000h,080h,0ffh,000h,0c0h,07fh,000h,0f0h,03fh,000h	; 9e76  8.....................?.
	defb 000h,000h,000h,000h,000h,000h,080h,000h,060h,0e0h,0c0h,018h,07ch,0f0h,002h,01eh,0fch,001h,007h,0feh,000h,003h,0ffh,000h	; 9e8e  ........`...|...........
	defb 038h,0f0h,004h,01ch,0f8h,002h,00eh,0fch,001h,007h,0feh,000h,003h,0ffh,000h,001h,0ffh,000h,001h,0ffh,000h,000h,0ffh,000h	; 9ea6  8.......................
	defb 000h,000h,000h,040h,000h,038h,0f8h,030h,004h,0cch,078h,000h,088h,078h,004h,04ch,038h,000h,038h,010h,000h,050h,020h,000h	; 9ebe  ...@.8.0..x..x.L8.8..P .

; ======================================================================
; CODIGO 0x9ed6..0xa000  (298 bytes)
; ======================================================================


L_9ED6:
	call 04a2ch		;9ed6   ; apaga_y_borra_todo: pantalla apagada, sprites escondidos y la pagina 0 borrada
	call 04a1fh		;9ed9   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	ld a,(0c2b0h)		;9edc   ; lee la ficha del personaje 0 (14 bytes)
	ld (0c229h),a		;9edf   ; guarda el personaje del final
	xor a			;9ee2
	ld (0c228h),a		;9ee3   ; guarda la opcion del final
	call pantalla_del_final_5		;9ee6   ; pantalla_del_final_5: patrones, texto p06:A173, recuadros y lineas del final
	jp 04a12h		;9ee9   ; pantalla_encendida: R#1 con el bit 6 (pantalla) y sprites encendidos
pantalla_del_final_5:		; patrones, texto p06:A173, recuadros y lineas del final
	ld de,0a226h		;9eec
	call 04926h		;9eef   ; rle_a_vram_con_destino: lee la direccion de VRAM de (DE) y sigue en p00:492C
	ld hl,0a173h		;9ef2
	call 04d4ah		;9ef5   ; texto: texto de HL: [X][Y], caracteres, 0xFE otra posicion, 0xFF acaba
	call 0a45ch		;9ef8   ; lista_a7f8: la lista de fichas p06:A7F8
	call 0a465h		;9efb   ; paleta_b351: la paleta p06:B351
	ld hl,0321fh		;9efe
	ld de,01a0ah		;9f01
	call 0a494h		;9f04   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	ld h,0aeh		;9f07
	ld d,023h		;9f09
	call 0a494h		;9f0b   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	ld hl,0272bh		;9f0e
	ld de,03232h		;9f11
	call 0a494h		;9f14   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	ld h,0a7h		;9f17
	call 0a494h		;9f19   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	ld hl,00763h		;9f1c
	ld de,0724ch		;9f1f
	call 0a494h		;9f22   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	ld h,087h		;9f25
	call 0a494h		;9f27   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	ld hl,010b4h		;9f2a
	ld de,0601ch		;9f2d
	call 0a494h		;9f30   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	inc h			;9f33
	inc l			;9f34
	dec d			;9f35
	dec d			;9f36
	dec e			;9f37
	dec e			;9f38
	call 0a494h		;9f39   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	ld hl,016beh		;9f3c
	ld de,0240ch		;9f3f
	call 0a494h		;9f42   ; rectangulo_guardando: p00:4B74 con el color 0x0D sin tocar registros
	call cifras_c2b9		;9f45   ; cifras_c2b9: las cifras de 0xC2B9 de los dos personajes
	call 04797h		;9f48
	call marcadores_del_final		;9f4b   ; marcadores_del_final: los numeros de las fichas de los dos personajes
	call lineas_a200		;9f4e   ; lineas_a200: las lineas horizontales de p06:A200
	call lineas_a21f		;9f51   ; lineas_a21f: las lineas verticales de p06:A21F
	ld a,001h		;9f54
	call 0a4beh		;9f56
	ld b,002h		;9f59
	ld hl,0c2b0h		;9f5b   ; apunta a la ficha del personaje 0 (14 bytes)
L_9F5E:
	push hl			;9f5e
	push bc			;9f5f
	ld d,h			;9f60
	ld e,l			;9f61
	ld a,010h		;9f62
	call 04088h		;9f64   ; de_mas_a: DE = DE + A
	ld bc,00010h		;9f67
	ldir		;9f6a
	pop bc			;9f6c
	pop hl			;9f6d
	ld a,020h		;9f6e
	call 04083h		;9f70   ; hl_mas_a: HL = HL + A
	djnz L_9F5E		;9f73
	ld hl,(0c259h)		;9f75   ; lee las monedas (16 bits) y el byte siguiente (16 bits)
	ld (0c22bh),hl		;9f78
	ret			;9f7b
lineas_a21f:		; las lineas verticales de p06:A21F
	ld hl,0a21fh		;9f7c
	jp 055ceh		;9f7f   ; lineas_verticales: lineas [X][Y][largo] de HL hasta 0xFF (p00:4B0C)
lineas_a200:		; las lineas horizontales de p06:A200
	ld hl,0a200h		;9f82
	jp 055d1h		;9f85   ; lineas_horizontales: lineas [X][Y][largo] de HL hasta 0xFF (p00:4AD4)
cifras_c2b9:		; las cifras de 0xC2B9 de los dos personajes
	ld hl,0c2b9h		;9f88
	ld de,04273h		;9f8b
	ld b,002h		;9f8e
L_9F90:
	push hl			;9f90
	push de			;9f91
	push bc			;9f92
	ld c,019h		;9f93
	call tres_cifras		;9f95   ; tres_cifras: 3 pares de cifras de HL (p00:479C)
	pop bc			;9f98
	pop de			;9f99
	pop hl			;9f9a
	ld a,020h		;9f9b
	call 04083h		;9f9d   ; hl_mas_a: HL = HL + A
	ld a,d			;9fa0
	add a,080h		;9fa1
	ld d,a			;9fa3
	djnz L_9F90		;9fa4
	ret			;9fa6
tres_cifras:		; 3 pares de cifras de HL (p00:479C)
	ld b,003h		;9fa7
L_9FA9:
	push hl			;9fa9   ; dos cifras (p00:479C) y la siguiente columna (E + C)
	push de			;9faa
	push bc			;9fab
	ld b,002h		;9fac
	call 0479ch		;9fae   ; dos cifras de (HL)
	pop bc			;9fb1
	pop de			;9fb2
	pop hl			;9fb3
	inc l			;9fb4   ; el siguiente par de cifras y la siguiente columna (E + C)
	inc l			;9fb5
	ld a,e			;9fb6
	add a,c			;9fb7
	ld e,a			;9fb8
	djnz L_9FA9		;9fb9
	ret			;9fbb
marcadores_del_final:		; los numeros de las fichas de los dos personajes
	ld hl,0c2b5h		;9fbc
	ld a,(hl)			;9fbf
	ld de,03467h		;9fc0
	call 04758h		;9fc3
	ld hl,0c2b1h		;9fc6
	ld de,03480h		;9fc9
	call numero_guardando		;9fcc   ; numero_guardando: p06:A550 con (HL) + 1 sin tocar registros
	inc l			;9fcf
	ld a,e			;9fd0
	add a,019h		;9fd1
	ld e,a			;9fd3
	call numero_guardando		;9fd4   ; numero_guardando: p06:A550 con (HL) + 1 sin tocar registros
	ld hl,0c2d5h		;9fd7
	ld a,(hl)			;9fda
	ld de,0b467h		;9fdb
	call 04758h		;9fde
	ld hl,0c2d1h		;9fe1
	ld de,0b480h		;9fe4
	call numero_guardando		;9fe7   ; numero_guardando: p06:A550 con (HL) + 1 sin tocar registros
	inc l			;9fea
	ld a,e			;9feb
	add a,019h		;9fec
	ld e,a			;9fee
numero_guardando:		; p06:A550 con (HL) + 1 sin tocar registros
	ld a,(hl)			;9fef   ; el numero (HL) + 1 sin tocar los registros (p06:A550)
	inc a			;9ff0
	push hl			;9ff1
	push de			;9ff2
	push bc			;9ff3
	call 0a550h		;9ff4
	pop bc			;9ff7
	pop de			;9ff8
	pop hl			;9ff9
	ret			;9ffa
L_9FFB:
	ld a,(0c00eh)		;9ffb   ; lee las teclas especiales
	rra			;9ffe
	rra			;9fff
