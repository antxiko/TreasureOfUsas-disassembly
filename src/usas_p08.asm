; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 08 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_f8_cola: 10 fichas de 8x8 a 3 bit(s) por punto (24
;   bytes cada una), entrada 8 de la lista fichas_ruina_3 (sigue del banco 7);
;   se solapan 2 bloques: (fichas_ruina_3_f9 8096-80C6); lo leen p00:5286 (198
;   bytes)
;   0x8000..0x80c6  (198 bytes)
DATA_fichas_ruina_3_f8_cola:
	defb 04fh,001h,0b0h,043h,000h,0bch,0ffh,051h,000h,0ffh,04fh,000h,0ffh,095h,002h,0ffh,09dh,002h,0ffh,02ch,003h,0ffh,054h,00bh	; 8000  O..C...Q..O........,..T.
	defb 0feh,059h,006h,0feh,029h,016h,0ffh,04ah,000h,0ffh,0a2h,040h,0ffh,079h,080h,0ffh,075h,080h,0ffh,0b4h,040h,0ffh,02ah,0d0h	; 8018  .Y..)..J...@.y..u...@.*.
	defb 0bfh,05ah,0a0h,0bfh,04ch,0b0h,08bh,003h,077h,0ceh,007h,036h,0b9h,001h,047h,0aah,002h,057h,0eah,002h,017h,0e8h,000h,017h	; 8030  .Z..L...w..6..G..W......
	defb 0a8h,000h,057h,0ach,000h,053h,0c2h,0c0h,0fdh,090h,0e0h,08fh,080h,080h,0ffh,040h,040h,0ffh,060h,040h,0dfh,011h,000h,0eeh	; 8048  ..W..S.........@@.`@....
	defb 051h,000h,0aeh,001h,000h,0feh,0feh,035h,00ah,0fch,053h,00ch,0fch,023h,00ch,0feh,01dh,002h,09fh,01fh,07fh,075h,005h,08fh	; 8060  Q......5..S..#.......u..
	defb 09eh,00fh,06eh,0e6h,006h,01fh,05fh,0ach,050h,03fh,0ceh,030h,03fh,0d4h,020h,07fh,0b9h,0c0h,04ah,0f8h,04dh,0ach,0a0h,0f3h	; 8078  ..n..._.P?.0?. ...J.M...
	defb 098h,0f0h,097h,067h,060h,0f8h,0e1h,000h,01eh,0feh,0e0h,001h,078h,070h,007h,03ah,070h,005h,03ch,020h,003h,03ch,060h,003h	; 8090  ...g`.......xp.:p.< .<`.
	defb 078h,040h,007h,0beh,0f0h,001h,03fh,06ch,000h,07eh,040h,001h,079h,060h,006h,030h,060h,00fh,034h,060h,00bh,038h,060h,007h	; 80a8  x@....?l.~@.y`.0`.4`.8`.
	defb 072h,0e0h,00dh,0f4h,0c0h,00bh	; 80c0

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_colores: tabla de colores de la lista fichas_ruina_4
;   (L_529C indexa con c >> 4); lo leen p00:5286 (14 bytes)
;   0x80c6..0x80d4  (14 bytes)
DATA_fichas_ruina_4_colores:
	defb 0d4h,080h	; 80c6
	defb 0dch,080h	; 80c8
	defb 0e0h,080h	; 80ca
	defb 0e4h,080h	; 80cc
	defb 0e8h,080h	; 80ce
	defb 0ech,080h	; 80d0
	defb 0f0h,080h	; 80d2

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_col0: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 8 bloques: (fichas_ruina_4_col0
;   80D4-80D6) (fichas_ruina_4_col0 80D4-80D8) (fichas_ruina_4_col0 80D4-80D8)
;   (fichas_ruina_4_col0 80D4-80D8) (fichas_ruina_4_col0 80D4-80DC)
;   (fichas_ruina_4_col0 80D4-80DC) (fichas_ruina_4_col0 80D4-80DC); lo leen
;   p00:5286 (8 bytes)
;   0x80d4..0x80dc  (8 bytes)
DATA_fichas_ruina_4_col0:
	defb 003h,00fh	; 80d4
	defb 001h,002h	; 80d6
	defb 004h,005h	; 80d8
	defb 00dh,00eh	; 80da

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_col1: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 2 bloques: (fichas_ruina_4_col1
;   80DC-80E0); lo leen p00:5286 (4 bytes)
;   0x80dc..0x80e0  (4 bytes)
DATA_fichas_ruina_4_col1:
	defb 004h,005h,00fh,001h	; 80dc

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_col2: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5286 (4 bytes)
;   0x80e0..0x80e4  (4 bytes)
DATA_fichas_ruina_4_col2:
	defb 001h,002h,003h,00eh	; 80e0

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_col3: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5286 (4 bytes)
;   0x80e4..0x80e8  (4 bytes)
DATA_fichas_ruina_4_col3:
	defb 001h,002h,00dh,00eh	; 80e4

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_col4: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5286 (4 bytes)
;   0x80e8..0x80ec  (4 bytes)
DATA_fichas_ruina_4_col4:
	defb 003h,00fh,002h,00eh	; 80e8

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_col5: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 2 bloques: (fichas_ruina_4_col5
;   80EC-80F0); lo leen p00:5286 (4 bytes)
;   0x80ec..0x80f0  (4 bytes)
DATA_fichas_ruina_4_col5:
	defb 00dh,00eh,00fh,001h	; 80ec

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_col6: 8 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5286 (8 bytes)
;   0x80f0..0x80f8  (8 bytes)
DATA_fichas_ruina_4_col6:
	defb 00dh,001h,002h,003h,00fh,004h,005h,000h	; 80f0  ........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5286 (97 bytes)
;   0x80f8..0x8159  (97 bytes)
DATA_fichas_ruina_4:
	defb 010h,004h,004h,080h,002h,059h	; 80f8
	defb 081h,012h,00ch,080h,007h,089h	; 80fe
	defb 081h,013h,028h,080h,002h,089h	; 8104
	defb 081h,022h,000h,084h,015h,0f9h	; 810a
	defb 081h,002h,054h,084h,040h,049h	; 8110
	defb 083h,002h,054h,08ch,005h,049h	; 8116
	defb 087h,003h,068h,08ch,012h,049h	; 811c
	defb 083h,032h,030h,090h,004h,099h	; 8122
	defb 087h,042h,040h,090h,003h,0d9h	; 8128
	defb 087h,052h,04ch,090h,002h,009h	; 812e
	defb 088h,053h,054h,090h,002h,009h	; 8134
	defb 088h,000h,05ch,090h,001h,029h	; 813a
	defb 088h,001h,060h,090h,001h,029h	; 8140
	defb 088h,004h,064h,090h,012h,031h	; 8146
	defb 088h,005h,02ch,094h,003h,031h	; 814c
	defb 088h,064h,038h,094h,001h,0e1h	; 8152
	defb 089h	; 8158

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_f0: 2 fichas de 8x8 a 3 bit(s) por punto (24 bytes cada
;   una), entrada 0 de la lista fichas_ruina_4; lo leen p00:5286 (48 bytes)
;   0x8159..0x8189  (48 bytes)
DATA_fichas_ruina_4_f0:
	defb 0d2h,0deh,0ffh,089h,010h,07eh,047h,020h,0fch,0a6h,000h,0f9h,0a4h,000h,0fbh,04ch,000h,0f3h,0bdh,000h,0e7h,0bfh,000h,0e7h	; 8159  .....~G .......L........
	defb 0d7h,01eh,0beh,0e7h,060h,079h,0efh,000h,074h,0dfh,000h,0fch,08fh,000h,0f1h,09fh,000h,0e3h,03fh,000h,0ceh,033h,000h,0deh	; 8171  ....`y..t.........?..3..

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_f2: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 2 de la lista fichas_ruina_4; se solapan 2 bloques:
;   (fichas_ruina_4_f1 8189-81F9); lo leen p00:5286 (112 bytes)
;   0x8189..0x81f9  (112 bytes)
DATA_fichas_ruina_4_f2:
	defb 058h,083h,058h,081h,026h,0c0h,005h,0e0h,045h,0a0h,042h,0b0h,065h,098h,065h,098h	; 8189  X.X.&...E.B.e.e.
	defb 046h,009h,0cch,033h,00eh,011h,01ch,083h,09ah,061h,03ah,085h,032h,089h,072h,089h	; 8199  F..3.....a:.2.r.
	defb 080h,044h,001h,0c6h,067h,088h,0deh,001h,081h,00eh,083h,01ch,00fh,030h,012h,021h	; 81a9  .D..g........0.!
	defb 047h,008h,0cdh,032h,00ch,011h,01ch,083h,09ah,060h,038h,084h,031h,088h,071h,088h	; 81b9  G..2.....`8.1.q.
	defb 01ah,0c0h,018h,081h,064h,003h,0a0h,006h,0a0h,004h,040h,00ch,0a5h,018h,0a7h,018h	; 81c9  ....d.....@.....
	defb 07ch,000h,0f9h,000h,007h,0f0h,087h,078h,060h,09fh,078h,087h,03ch,0c3h,000h,0ffh	; 81d9  |......x`.x.<...
	defb 0e0h,01fh,0e9h,016h,08bh,074h,01bh,0e4h,012h,0edh,00ch,0f3h,00ah,0f5h,000h,0ffh	; 81e9  .....t..........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_f3: 21 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 3 de la lista fichas_ruina_4; lo leen p00:5286 (336
;   bytes)
;   0x81f9..0x8349  (336 bytes)
DATA_fichas_ruina_4_f3:
	defb 0ffh,0ffh,0bah,08ah,0fch,094h,0f8h,0b8h,0f9h,0a1h,0f5h,0b4h,0a7h,0a5h,0eeh,0ech	; 81f9  ................
	defb 0ffh,0ffh,023h,020h,077h,071h,07eh,072h,0beh,09ah,07ch,044h,079h,029h,0b2h,032h	; 8209  ..# wq~r..|Dy).2
	defb 0ffh,0feh,0ddh,084h,0cfh,002h,02fh,022h,0cfh,044h,05fh,042h,0bfh,08eh,07fh,01ch	; 8219  ....../".D_B....
	defb 085h,080h,0afh,0a0h,0cfh,0c8h,0dfh,0dfh,0cfh,0cbh,0f6h,0c6h,0bdh,081h,0f9h,0b1h	; 8229  ................
	defb 0e5h,025h,0e7h,066h,09bh,098h,05fh,059h,05fh,05bh,0bfh,0b3h,05ah,042h,058h,040h	; 8239  .%.f.._Y_[..ZBX@
	defb 0b8h,0b0h,032h,000h,0f3h,0e2h,0e3h,060h,065h,005h,0c7h,043h,0ceh,046h,08eh,006h	; 8249  ..2....`e..C.F..
	defb 07fh,038h,0ffh,038h,09bh,010h,023h,020h,07fh,070h,07dh,060h,0f1h,0c0h,0edh,0cch	; 8259  .8.8..# .p}`....
	defb 0e7h,0a0h,0e6h,0a0h,0bch,0a0h,0f0h,080h,088h,088h,0b0h,080h,0fch,080h,0ffh,000h	; 8269  ................
	defb 01dh,004h,03dh,018h,07bh,018h,0feh,030h,0f4h,060h,04fh,040h,09dh,000h,0ffh,000h	; 8279  ..=.{..0.`O@....
	defb 07bh,060h,057h,040h,0f5h,0c0h,065h,000h,00dh,000h,033h,000h,0f5h,000h,0ffh,000h	; 8289  {`W@..e...3.....
	defb 003h,083h,046h,0b2h,000h,0e8h,004h,0c0h,005h,0d9h,009h,0c0h,05bh,081h,012h,080h	; 8299  ..F.........[...
	defb 07dh,080h,057h,088h,037h,080h,023h,083h,037h,083h,00ah,0b2h,045h,0b9h,005h,0c9h	; 82a9  }.W.7.#.7...E...
	defb 00bh,0c0h,01eh,0c0h,044h,098h,008h,0f0h,074h,080h,04ch,0b0h,006h,0f8h,007h,0f8h	; 82b9  ....D...t.L.....
	defb 07dh,080h,057h,088h,037h,080h,023h,080h,037h,082h,00bh,0b2h,045h,0b8h,005h,0c8h	; 82c9  }.W.7.#.7...E...
	defb 00bh,0c0h,01fh,0c0h,045h,098h,009h,0f0h,075h,080h,04dh,0b0h,00fh,0f0h,037h,0c8h	; 82d9  ....E...u.M...7.
	defb 027h,083h,04bh,0a3h,01eh,0eah,011h,091h,00fh,0cbh,057h,0a7h,06dh,091h,03dh,0f5h	; 82e9  '.K.......W.m.=.
	defb 000h,0ffh,0f8h,0f8h,0ffh,0ffh,03eh,03eh,0ffh,000h,0dfh,0dfh,0e1h,000h,000h,0ffh	; 82f9  ......>>........
	defb 000h,0ffh,000h,000h,0f8h,0f8h,000h,000h,0ffh,000h,080h,080h,0ffh,000h,000h,0ffh	; 8309  ................
	defb 000h,0ffh,0ffh,0ffh,000h,000h,0ffh,000h,01dh,01dh,000h,0ffh,01ah,0e2h,018h,0e0h	; 8319  ................
	defb 000h,0ffh,0f8h,0f8h,003h,000h,0f0h,00fh,007h,000h,000h,0ffh,082h,07dh,0a0h,05fh	; 8329  .............}._
	defb 068h,080h,074h,080h,000h,0ffh,03ah,03ah,0ffh,000h,000h,000h,07fh,07fh,000h,0ffh	; 8339  h.t...::........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_f6: 18 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 6 de la lista fichas_ruina_4; se solapan 2 bloques:
;   (fichas_ruina_4_f4 8349-8749); lo leen p00:5286 (1024 bytes)
;   0x8349..0x8749  (1024 bytes)
DATA_fichas_ruina_4_f6:
	defb 0ffh,000h,033h,03fh,058h,07dh,073h,07fh,000h,000h,0ffh,000h,007h,03fh,04ch,07fh	; 8349  ..3?X}s......?L.
	defb 000h,000h,0ffh,000h,023h,03fh,04eh,07eh,000h,000h,0ffh,000h,0b4h,034h,0c2h,072h	; 8359  ....#?N~.....4.r
	defb 0c0h,070h,0c8h,07ch,0c8h,07ah,0c0h,078h,0dah,07eh,0ddh,07dh,0d2h,07ah,0e4h,07ch	; 8369  .p.|.z.x.~.}.z.|
	defb 0c4h,07ch,0e0h,079h,0c2h,07eh,0cch,07ch,0cch,07ch,0d0h,07ch,0d1h,079h,0c2h,072h	; 8379  .|.y.~.|.|.|.y.r
	defb 0ffh,000h,04fh,0c0h,0cfh,0c0h,08fh,080h,01fh,000h,0ffh,000h,05fh,0c0h,01fh,080h	; 8389  ..O........._...
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0cfh,00fh,0cah,00fh,0e0h,000h,0ffh,000h	; 8399  ................
	defb 0c8h,00fh,0c5h,00fh,0e0h,000h,0ffh,000h,0c8h,00fh,0c3h,00fh,0e0h,000h,0ffh,000h	; 83a9  ................
	defb 0feh,01eh,0f8h,01ch,0e8h,01ah,0e0h,018h,0fah,01eh,0fdh,01dh,0f2h,01ah,0f4h,01ch	; 83b9  ................
	defb 0e4h,01ch,0e9h,019h,0feh,01eh,0fch,01ch,0fch,01ch,0f8h,01ch,0f1h,019h,0f2h,012h	; 83c9  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,04fh,0c0h,08fh,080h,01fh,000h,0ffh,000h	; 83d9  ........O.......
	defb 0dfh,0c0h,09fh,080h,03fh,000h,0ffh,000h,0bfh,080h,03fh,000h,07fh,000h,0ffh,000h	; 83e9  ....?.....?.....
	defb 0cah,00ah,0c6h,006h,0ffh,000h,0cdh,00ch,0e9h,008h,0ffh,000h,0e7h,004h,0ffh,000h	; 83f9  ................
	defb 0e3h,000h,0e3h,000h,0ebh,008h,0e3h,000h,0ebh,008h,0e7h,004h,0ebh,008h,0e3h,000h	; 8409  ................
	defb 0f3h,010h,0ebh,008h,0fbh,018h,0fbh,018h,0f3h,010h,0f3h,010h,0ebh,008h,0e3h,000h	; 8419  ................
	defb 0e0h,000h,0e0h,07fh,0c0h,07fh,0ffh,07fh,0c3h,003h,0f0h,03fh,0ffh,03fh,0e0h,000h	; 8429  ...........?.?..
	defb 0ffh,000h,0bfh,000h,06bh,048h,05dh,05ch,0e1h,0e9h,083h,0cfh,07ch,0ffh,048h,0ffh	; 8439  ....kH]\....|.H.
	defb 0ffh,000h,0ffh,000h,0f0h,000h,01fh,01fh,0ffh,000h,0c1h,041h,085h,005h,089h,04fh	; 8449  ...........A...O
	defb 0afh,000h,01fh,000h,02fh,000h,067h,040h,005h,000h,0d2h,0d0h,0aah,0e0h,029h,0e0h	; 8459  ..../.g@......).
	defb 048h,0ffh,07ch,0ffh,083h,0cfh,041h,049h,008h,008h,024h,000h,04dh,000h,0ffh,000h	; 8469  H.|...AI..$.M...
	defb 088h,0ffh,009h,04fh,02fh,06fh,0a6h,0a6h,041h,040h,008h,000h,01dh,000h,0ffh,000h	; 8479  ...O/o..A@......
	defb 0ffh,000h,0bch,000h,068h,048h,05ch,05ch,0e1h,0e9h,083h,0cfh,07ch,0ffh,048h,0ffh	; 8489  ....hH\\....|.H.
	defb 0ffh,000h,038h,000h,062h,062h,044h,044h,0b7h,0b7h,02fh,06fh,009h,04fh,088h,0ffh	; 8499  ..8.bbDD../o.O..
	defb 0f2h,03fh,0c7h,00fh,0d1h,017h,0f6h,03fh,0e6h,027h,0fbh,03fh,0e8h,02dh,0e0h,02dh	; 84a9  .?.....?.'.?.-.-
	defb 0cbh,00bh,0e0h,021h,0c7h,00fh,0d2h,01fh,0c0h,00bh,0c8h,00fh,0c2h,003h,0f6h,037h	; 84b9  ...!...........7
	defb 00fh,09ch,007h,0a4h,033h,030h,0d3h,0f0h,037h,074h,0e3h,0e0h,043h,0c0h,08bh,098h	; 84c9  ....30..7t..C...
	defb 083h,0b0h,083h,0f0h,0e3h,0e0h,0c3h,0e0h,083h,0e0h,0c3h,0c0h,083h,080h,007h,01ch	; 84d9  ................
	defb 001h,0c2h,023h,0f2h,021h,0e8h,001h,0e0h,06bh,0fah,075h,0f6h,04bh,0eah,091h,0f2h	; 84e9  ..#.!...k.u.K...
	defb 000h,0ffh,032h,0ffh,06fh,0fbh,045h,0f9h,05bh,0f3h,04bh,0f3h,017h,0e7h,017h,0e7h	; 84f9  ..2.o.E.[.K.....
	defb 000h,0ffh,003h,0ffh,006h,0ffh,00ch,0ffh,0a4h,0ffh,0b8h,0ffh,0d1h,0feh,0c1h,0feh	; 8509  ................
	defb 000h,0ffh,005h,0f9h,008h,0f3h,00dh,0ffh,075h,09eh,098h,01fh,03eh,03fh,04fh,07fh	; 8519  ........u...>?O.
	defb 001h,0ffh,0fdh,0ffh,039h,0bfh,009h,0cfh,043h,07fh,0adh,03fh,0a1h,03fh,063h,07fh	; 8529  ....9...C..?.?c.
	defb 017h,0e7h,013h,0e3h,00bh,0f3h,005h,0f9h,005h,0f9h,035h,0f9h,03bh,0f3h,04bh,0f3h	; 8539  ..........5...K.
	defb 0c1h,0feh,0c1h,0feh,087h,0f9h,019h,0e1h,027h,0c7h,023h,0cfh,04dh,097h,049h,0f2h	; 8549  ........'.#.M.I.
	defb 025h,079h,0bah,0dch,094h,0e6h,0d6h,0e7h,0eah,0f3h,0cbh,0f3h,0d7h,0e7h,0efh,0efh	; 8559  %y..............
	defb 0e7h,0ffh,0e7h,0ffh,08bh,0ffh,003h,0ffh,00fh,0ffh,01dh,0ffh,031h,0ffh,021h,0ffh	; 8569  ............1.!.
	defb 01bh,0e3h,017h,0e7h,017h,0e7h,009h,0f1h,006h,0f8h,031h,0ffh,03ch,0ffh,048h,0ffh	; 8579  ..........1.<.H.
	defb 037h,0c6h,0ceh,08fh,09eh,09fh,0fdh,0ffh,0fah,0ffh,0e7h,0ffh,013h,0e3h,08ch,0f0h	; 8589  7...............
	defb 07eh,07fh,0beh,03fh,09dh,01fh,04ah,08fh,004h,0ffh,00ch,0ffh,0c8h,0ffh,0f0h,0ffh	; 8599  ~..?..J.........
	defb 01bh,0fch,025h,0ffh,063h,0ffh,0ceh,0ffh,0b7h,0c8h,048h,088h,09dh,0bfh,0ffh,0ffh	; 85a9  ..%.c.....H.....
	defb 078h,07fh,0b8h,03fh,0d8h,09fh,0b8h,03fh,074h,07fh,0c0h,0ffh,003h,0ffh,0ffh,0ffh	; 85b9  x..?...?t.......
	defb 046h,0feh,01eh,0feh,071h,0fch,005h,0fch,039h,0f8h,054h,0f3h,0d4h,0f3h,0f4h,0f0h	; 85c9  F...q...9.T.....
	defb 09bh,0e4h,00fh,0f8h,000h,000h,005h,0ffh,0ffh,0e8h,00fh,0ffh,005h,0ffh,000h,000h	; 85d9  ................
	defb 051h,07fh,035h,03fh,0a5h,03fh,0adh,03fh,0c3h,00fh,0e5h,0cfh,0e7h,0cfh,027h,007h	; 85e9  Q.5?.?.?......'.
	defb 017h,0f0h,014h,0f3h,034h,0f3h,07bh,0f8h,04dh,0fch,05dh,0fch,047h,0feh,006h,0feh	; 85f9  ....4.{.M.].G...
	defb 0efh,00fh,02dh,0cfh,0e9h,0cfh,0ddh,01fh,0cdh,01fh,0abh,03fh,0ddh,07fh,0b1h,07fh	; 8609  ..-........?....
	defb 0cbh,005h,0f2h,029h,0fbh,019h,0f6h,073h,084h,0e3h,048h,0c7h,092h,083h,036h,017h	; 8619  ...)...s..H...6.
	defb 008h,0f6h,01ah,0eeh,01ch,0eeh,030h,0dch,034h,0dch,034h,0dch,070h,0dch,0b4h,0dch	; 8629  ......0.4.4.p...
	defb 00fh,09ch,007h,0a4h,033h,030h,0d3h,070h,077h,094h,023h,040h,05bh,060h,087h,0d8h	; 8639  ....30.pw.#@[`..
	defb 003h,0cch,069h,0eah,040h,0c1h,0c6h,001h,0afh,020h,05fh,040h,03fh,040h,07fh,000h	; 8649  ..i.@.... _@?@..
	defb 07dh,07fh,057h,077h,0b7h,07fh,060h,0bfh,034h,0dfh,0a8h,04fh,0d4h,027h,0f4h,007h	; 8659  }.Ww..`.4..O.'..
	defb 0fdh,007h,0ffh,007h,05fh,007h,08ch,003h,01ch,01bh,0bch,0bbh,0dch,0dbh,0c4h,0c3h	; 8669  ...._...........
	defb 093h,0f0h,061h,070h,023h,020h,0a2h,0b0h,012h,038h,09ah,0bch,092h,099h,0deh,0dch	; 8679  ..ap# ...8......
	defb 07fh,000h,047h,000h,04ah,040h,0c3h,0c0h,07dh,0fch,06fh,0ffh,035h,0ffh,018h,0bfh	; 8689  ..G.J@..}.o.5...
	defb 0fch,000h,0e9h,000h,0a4h,000h,00ah,002h,02dh,021h,07ah,070h,0f1h,0e1h,0d4h,0c0h	; 8699  ........-!zp....
	defb 05dh,05dh,0ech,0fch,059h,079h,0abh,0fbh,0bbh,0fbh,0d8h,0f8h,0e5h,0e5h,05dh,0ddh	; 86a9  ]]..Yy........].
	defb 097h,093h,03eh,03bh,0bch,0b3h,0b8h,0b7h,014h,00fh,03ch,02fh,0a6h,087h,0c7h,007h	; 86b9  ..>.......</....
	defb 0cah,0d8h,051h,05ch,0b5h,0bch,0afh,0beh,04fh,04eh,072h,0f2h,0e9h,06dh,0deh,03eh	; 86c9  ..Q\....ONr..m.>
	defb 0ddh,0dch,09bh,098h,06ah,068h,0c4h,0c0h,0b4h,0b0h,0b5h,0b1h,069h,061h,08dh,085h	; 86d9  ....jh......ia..
	defb 0fch,00ch,0efh,023h,0c7h,00dh,0d3h,01eh,0c0h,00bh,0c8h,00fh,0c2h,003h,0f6h,037h	; 86e9  ...#...........7
	defb 05ah,003h,076h,007h,0e6h,0c6h,0d7h,066h,0cah,070h,064h,098h,01eh,0e8h,01ah,0ech	; 86f9  Z.v....f.pd.....
	defb 0d9h,0c9h,018h,000h,026h,000h,0a2h,000h,043h,020h,043h,000h,0e3h,0c0h,067h,0dch	; 8709  ....&...C C...g.
	defb 0c3h,0f1h,0ebh,0f9h,0efh,0fbh,07ch,07bh,064h,063h,024h,023h,02ch,027h,004h,007h	; 8719  ......|{dc$#,'..
	defb 07ch,09ch,07fh,0bfh,07fh,0bfh,0e7h,0bfh,0a5h,03fh,0a0h,03fh,0b0h,03fh,0b0h,03fh	; 8729  |........?.?.?.?
	defb 0f2h,03fh,0c7h,00fh,051h,017h,076h,03fh,0b6h,087h,0dbh,0c7h,0c7h,0c0h,063h,0e3h	; 8739  .?..Q.v?......c.

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_f5: 5 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 5 de la lista fichas_ruina_4; lo leen p00:5286 (80 bytes)
;   0x8749..0x8799  (80 bytes)
DATA_fichas_ruina_4_f5:
	defb 01bh,0eeh,019h,0eeh,095h,0e6h,01ch,0eeh,014h,0e6h,06fh,08fh,098h,01eh,032h,03eh	; 8749  ..........o...2>
	defb 03dh,02fh,037h,017h,0f7h,0bfh,0a0h,07fh,034h,07fh,008h,04fh,044h,047h,004h,037h	; 8759  =/7.....4..ODG.7
	defb 050h,09fh,058h,09fh,06ch,08fh,0e7h,0c7h,091h,0e1h,00ch,0f0h,09fh,0f8h,0ffh,0feh	; 8769  P.X.l...........
	defb 08fh,03fh,098h,018h,0f1h,001h,043h,007h,027h,0feh,03eh,0f1h,079h,007h,0c0h,03eh	; 8779  .?....C.'.>.y..>
	defb 033h,020h,073h,040h,0e3h,080h,0c3h,020h,083h,0e0h,0c3h,0c0h,083h,080h,007h,01ch	; 8789  3 s@... ........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_f7: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 7 de la lista fichas_ruina_4; lo leen p00:5286 (64 bytes)
;   0x8799..0x87d9  (64 bytes)
DATA_fichas_ruina_4_f7:
	defb 04bh,04fh,01ch,01ch,099h,019h,052h,053h,088h,08ah,043h,047h,06eh,02fh,0bch,03eh	; 8799  KO....RS..CGn/.>
	defb 0f0h,038h,065h,067h,085h,08fh,079h,07dh,050h,078h,094h,096h,065h,065h,067h,067h	; 87a9  .8eg..y}Px..eegg
	defb 0f0h,0e0h,0c1h,0c0h,017h,011h,03eh,032h,05eh,058h,0dch,0c0h,03fh,027h,07fh,04eh	; 87b9  ......>2^X..?'.N
	defb 0f1h,0b0h,0d3h,0c0h,0bfh,0a0h,07fh,067h,07eh,00eh,076h,032h,06dh,064h,049h,048h	; 87c9  .......g~.v2mdIH

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_f8: 3 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 8 de la lista fichas_ruina_4; lo leen p00:5286 (48 bytes)
;   0x87d9..0x8809  (48 bytes)
DATA_fichas_ruina_4_f8:
	defb 0f9h,0a0h,0f4h,0a0h,0f0h,069h,0e0h,062h,0c0h,069h,0c0h,06dh,0c0h,04dh,0c0h,076h	; 87d9  .....i.b.i.m.M.v
	defb 0c0h,07ah,0e0h,078h,0e0h,073h,060h,0abh,070h,0bbh,0f0h,0dah,078h,0ddh,018h,0eeh	; 87e9  .z.x.s`.p...x...
	defb 0f3h,09ch,0d3h,004h,013h,040h,053h,0e0h,0cbh,0e4h,09bh,0c0h,02bh,0c0h,05bh,080h	; 87f9  .....@S.....+.[.

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_f9: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 9 de la lista fichas_ruina_4; se solapan 2 bloques:
;   (fichas_ruina_4_f10 8809-8829); lo leen p00:5286 (32 bytes)
;   0x8809..0x8829  (32 bytes)
DATA_fichas_ruina_4_f9:
	defb 000h,0ffh,001h,0feh,00dh,0f2h,00dh,0f2h,008h,0f2h,020h,0d2h,000h,0d2h,000h,0ffh	; 8809  .......... .....
	defb 000h,0ffh,06dh,092h,040h,092h,000h,0ffh,000h,0ffh,06dh,092h,040h,092h,040h,092h	; 8819  ..m.@.....m.@.@.

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_f11: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 11 de la lista fichas_ruina_4; se solapan 2 bloques:
;   (fichas_ruina_4_f12 8829-8831); lo leen p00:5286 (8 bytes)
;   0x8829..0x8831  (8 bytes)
DATA_fichas_ruina_4_f11:
	defb 03fh,0ffh,03fh,03fh,07fh,0ffh,0ffh,0ffh	; 8829  ?.??....

; ----------------------------------------------------------------------
; DATOS fichas_ruina_4_f14: 3 fichas de 8x8 a 3 bit(s) por punto (24 bytes
;   cada una), entrada 14 de la lista fichas_ruina_4; se solapan 2 bloques:
;   (fichas_ruina_4_f13 8831-89E1); lo leen p00:5286 (432 bytes)
;   0x8831..0x89e1  (432 bytes)
DATA_fichas_ruina_4_f14:
	defb 007h,0ffh,007h,083h,0ffh,003h,0e8h,0ffh,088h,0e5h,01fh,000h,06ch,0ffh,0feh,01ah,0ffh,07fh,084h,01fh,017h,013h,067h,047h	; 8831  ............l.........gG
	defb 098h,067h,001h,04dh,08dh,001h,033h,0ffh,003h,0ffh,0fch,0fch,0ffh,060h,060h,0dfh,01ch,010h,020h,038h,038h,088h,098h,018h	; 8849  .g.M..3......``... 88...
	defb 0e3h,04bh,048h,0f3h,023h,020h,0fdh,02dh,020h,0ffh,017h,010h,07ah,016h,014h,07dh,009h,008h,0bbh,00fh,00bh,01fh,007h,006h	; 8861  .KH.# .- ...z..}........
	defb 01dh,0ffh,004h,03dh,0ffh,018h,07bh,0ffh,018h,0feh,0ffh,030h,0f5h,0feh,060h,04fh,0fdh,040h,09fh,0fbh,000h,0fdh,0f7h,000h	; 8879  ...=..{....0..`O.@......
	defb 072h,03fh,000h,0c7h,00fh,000h,0d1h,017h,000h,0f6h,03fh,000h,0e7h,024h,000h,0feh,006h,002h,0efh,01fh,017h,08dh,07fh,066h	; 8891  r?........?..$.........f
	defb 0ffh,0eeh,020h,0feh,0edh,061h,09dh,0f3h,093h,05bh,0f7h,057h,057h,0eeh,04eh,0beh,0ech,0ach,07fh,0d8h,058h,05ah,0b0h,030h	; 88a9  .. ..a...[.WW.N.....XZ.0
	defb 00ah,0ffh,0ceh,0e3h,0ffh,0e7h,04fh,0bfh,0bbh,0f9h,008h,008h,0f8h,004h,000h,0feh,004h,000h,0fch,002h,000h,07eh,000h,000h	; 88c1  ......O..............~..
	defb 0feh,0eeh,0e8h,02eh,0f6h,024h,07dh,0f5h,074h,07fh,0fbh,072h,0bfh,0fdh,099h,07dh,0feh,044h,079h,0ffh,029h,0b2h,0ffh,032h	; 88d9  .....$}.t..r...}.Dy.)..2
	defb 060h,060h,000h,023h,00fh,002h,0f4h,03fh,007h,082h,03fh,002h,008h,04fh,000h,0bch,03ch,000h,0d8h,019h,000h,042h,003h,000h	; 88f1  ``.#...?..?..O..<....B..
	defb 018h,001h,000h,0dbh,0c3h,000h,036h,0e2h,0c0h,071h,0c1h,000h,04bh,003h,000h,0e9h,0e1h,080h,094h,0f0h,0f0h,034h,0f0h,0e0h	; 8909  ......6..q..K........4..
	defb 093h,08fh,003h,016h,00fh,002h,018h,017h,000h,0ech,0e3h,000h,0e5h,0e3h,041h,0e5h,0e3h,060h,0f3h,0f1h,021h,0f2h,0f1h,020h	; 8921  ..............A..`..!..
	defb 0e5h,0ffh,025h,0e7h,0ffh,066h,09bh,0ffh,098h,05fh,0ffh,059h,05fh,0ffh,05bh,0bfh,0f8h,0b0h,058h,0e0h,040h,060h,0c0h,040h	; 8939  ..%..f..._.Y_.[...X.@`.@
	defb 0beh,0e0h,080h,00fh,09eh,000h,013h,07eh,01ch,006h,07eh,01ch,0ffh,0fch,030h,0b5h,0f9h,000h,0c4h,0c7h,000h,058h,01fh,001h	; 8951  .......~..~...0......X..
	defb 0b8h,03fh,00fh,062h,07fh,006h,088h,03fh,000h,084h,00ch,000h,05ah,003h,000h,077h,007h,001h,05bh,01fh,003h,0a7h,03fh,006h	; 8969  .?.b...?....Z..w..[...?.
	defb 0ffh,0ffh,0c0h,0e3h,0ffh,0e0h,078h,0ffh,078h,0efh,0ffh,00fh,0f7h,0ffh,000h,00bh,00bh,000h,0a0h,000h,000h,0ffh,000h,000h	; 8981  ......x.x...............
	defb 0cch,0fch,008h,01dh,0fch,018h,079h,0f8h,070h,0f2h,0f0h,0c0h,0c4h,0c0h,000h,00bh,003h,000h,01ch,004h,000h,0e7h,018h,000h	; 8999  ......y.p...............
	defb 01ch,05fh,00ch,06ah,06fh,00ah,018h,05fh,010h,010h,03fh,011h,030h,03fh,020h,065h,07fh,007h,067h,07fh,007h,01bh,05fh,00bh	; 89b1  ._.jo.._..?.0? e..g..._.
	defb 013h,0f2h,000h,0e5h,0e4h,064h,0e9h,0f8h,0e0h,0f1h,0f0h,0c0h,031h,0f2h,000h,0c1h,0f2h,080h,045h,0e6h,000h,04bh,0cah,040h	; 89c9  .....d......1.....E..K.@

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f22: 1 fichas de 8x8 a 3 bit(s) por punto (24 bytes
;   cada una), entrada 22 de la lista fichas_ruina_0; se solapan 4 bloques:
;   (fichas_ruina_2_f9 89E1-89F9) (fichas_ruina_3_f10 89E1-89F9)
;   (fichas_ruina_4_f15 89E1-89F9); lo leen p00:5286 (24 bytes)
;   0x89e1..0x89f9  (24 bytes)
DATA_fichas_ruina_0_f22:
	defb 011h,000h,0eeh,000h,000h,0eeh,000h,044h,0aah,055h,066h,088h,077h,044h,088h,011h,088h,044h,0eah,099h,004h,064h,09dh,002h	; 89e1  .......D.Uf.wD...D...d..

; ----------------------------------------------------------------------
; DATOS fichas_p518E: 2 fichas de 2 bits (p00:51A5, L_4EA2); lo leen p00:51A5
;   (32 bytes)
;   0x89f9..0x8a19  (32 bytes)
DATA_fichas_p518E:
	defb 050h,08fh,048h,090h,053h,08ch,050h,08fh,050h,08fh,048h,090h,053h,08ch,050h,08fh	; 89f9  P.H.S.P.P.H.S.P.
	defb 00ah,0f1h,002h,009h,0fah,001h,00ah,0f1h,00ah,0f1h,002h,009h,0fah,001h,00ah,0f1h	; 8a09  ................

; ----------------------------------------------------------------------
; DATOS fichas_sala5_colores: tabla de colores de la lista fichas_sala5
;   (L_529C indexa con c >> 4); lo leen p00:51D4 (8 bytes)
;   0x8a19..0x8a21  (8 bytes)
DATA_fichas_sala5_colores:
	defb 021h,08ah	; 8a19
	defb 029h,08ah	; 8a1b
	defb 02dh,08ah	; 8a1d
	defb 031h,08ah	; 8a1f

; ----------------------------------------------------------------------
; DATOS fichas_sala5_col0: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 5 bloques: (fichas_sala5_col0 8A21-8A29)
;   (fichas_sala5_col0 8A21-8A29) (fichas_sala5_col0 8A21-8A29)
;   (fichas_sala5_col0 8A21-8A29); lo leen p00:51D4 (8 bytes)
;   0x8a21..0x8a29  (8 bytes)
DATA_fichas_sala5_col0:
	defb 000h,001h,004h,005h	; 8a21
	defb 003h,00ah,00dh,00eh	; 8a25

; ----------------------------------------------------------------------
; DATOS fichas_sala5_col1: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; lo leen p00:51D4 (4 bytes)
;   0x8a29..0x8a2d  (4 bytes)
DATA_fichas_sala5_col1:
	defb 000h,001h,002h,003h	; 8a29

; ----------------------------------------------------------------------
; DATOS fichas_sala5_col2: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 4 bloques: (fichas_sala5_col2 8A2D-8A31)
;   (fichas_sala5_col2 8A2D-8A31) (fichas_sala5_col2 8A2D-8A31); lo leen
;   p00:51D4 (4 bytes)
;   0x8a2d..0x8a31  (4 bytes)
DATA_fichas_sala5_col2:
	defb 000h,007h,008h,00dh	; 8a2d

; ----------------------------------------------------------------------
; DATOS fichas_sala5_col3: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; lo leen p00:51D4 (4 bytes)
;   0x8a31..0x8a35  (4 bytes)
DATA_fichas_sala5_col3:
	defb 00ch,00dh,00eh,00fh	; 8a31

; ----------------------------------------------------------------------
; DATOS fichas_sala5: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:51D4 (67 bytes)
;   0x8a35..0x8a78  (67 bytes)
DATA_fichas_sala5:
	defb 00bh,002h,004h,080h,004h,078h	; 8a35
	defb 08ah,004h,014h,080h,008h,0b8h	; 8a3b
	defb 08ah,005h,040h,080h,004h,018h	; 8a41
	defb 08bh,032h,050h,080h,004h,078h	; 8a47
	defb 08bh,012h,040h,084h,006h,0b8h	; 8a4d
	defb 08bh,004h,060h,084h,018h,018h	; 8a53
	defb 08ch,005h,040h,088h,010h,0d8h	; 8a59
	defb 08ch,022h,000h,08ch,040h,058h	; 8a5f
	defb 08eh,022h,000h,094h,00eh,058h	; 8a65
	defb 092h,023h,040h,094h,040h,058h	; 8a6b
	defb 08eh,023h,040h,09ch,00eh,058h	; 8a71
	defb 092h	; 8a77

; ----------------------------------------------------------------------
; DATOS fichas_sala5_f0: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_sala5; lo leen p00:51D4 (64 bytes)
;   0x8a78..0x8ab8  (64 bytes)
DATA_fichas_sala5_f0:
	defb 09eh,0ffh,003h,0ffh,001h,0ffh,023h,0ffh,09fh,0ffh,0fah,0ffh,0ffh,07ch,000h,000h	; 8a78  ......#......|..
	defb 0fdh,0f8h,0cch,07dh,0fdh,0f5h,0fdh,059h,0fdh,020h,0fdh,000h,0f9h,000h,000h,000h	; 8a88  ...}...Y. ......
	defb 0cch,0b0h,0fah,0ech,0feh,0f4h,06eh,0e0h,0fch,0c8h,0f8h,0d8h,0e0h,000h,046h,000h	; 8a98  ......n.......F.
	defb 0f3h,07fh,0e2h,0bfh,010h,0ffh,00bh,0f7h,0e7h,0f9h,0efh,0feh,07fh,078h,036h,000h	; 8aa8  .............x6.

; ----------------------------------------------------------------------
; DATOS fichas_sala5_f1: 8 fichas de 8x8 a 3 bit(s) por punto (24 bytes cada
;   una), entrada 1 de la lista fichas_sala5; se solapan 2 bloques:
;   (fichas_sala5_f2 8B18-8B78); lo leen p00:51D4 (192 bytes)
;   0x8ab8..0x8b78  (192 bytes)
DATA_fichas_sala5_f1:
	defb 0dbh,09bh,000h,0a0h,013h,000h,048h,031h,008h,00ch,070h,03ch,018h,0e3h,079h,010h,087h,0f5h,000h,08bh,040h,000h,09dh,040h	; 8ab8  ......H1..p<..y.....@..@
	defb 0dbh,0d9h,000h,005h,0c8h,000h,012h,08ch,010h,030h,00eh,03ch,018h,0c7h,09eh,008h,0e1h,0afh,000h,0d1h,002h,000h,0b9h,002h	; 8ad0  .........0.<............
	defb 000h,09ch,000h,059h,059h,020h,05ch,05ch,021h,049h,049h,000h,0ach,0ach,000h,0a9h,000h,002h,0dbh,000h,000h,000h,000h,000h	; 8ae8  ...YY \\!II.............
	defb 000h,039h,000h,09ah,09ah,004h,03ah,03ah,084h,092h,092h,000h,035h,035h,000h,095h,000h,040h,0dbh,000h,000h,000h,000h,000h	; 8b00  .9....::....55...@......
	defb 0c0h,08fh,004h,0a0h,018h,00fh,040h,038h,01ch,08ch,0f1h,01ch,0b8h,083h,038h,010h,005h,014h,080h,0ceh,000h,080h,0efh,00ch	; 8b18  ......@8......8.........
	defb 080h,0efh,00ch,080h,0ceh,000h,010h,005h,014h,0b8h,083h,038h,08ch,0f1h,01ch,040h,038h,01ch,0a0h,018h,00fh,0c0h,08fh,004h	; 8b30  ...........8...@8.......
	defb 00eh,088h,000h,072h,070h,000h,00ch,008h,060h,062h,0e0h,000h,07eh,0f8h,000h,028h,0a8h,000h,002h,000h,004h,056h,050h,020h	; 8b48  ...rp...`b..~..(.....VP
	defb 056h,050h,020h,002h,000h,004h,028h,0a8h,000h,07eh,0f8h,000h,062h,0e0h,000h,00ch,008h,060h,072h,070h,000h,00eh,088h,000h	; 8b60  VP ...(..~..b....`rp....

; ----------------------------------------------------------------------
; DATOS fichas_sala5_f3: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 3 de la lista fichas_sala5; lo leen p00:51D4 (64 bytes)
;   0x8b78..0x8bb8  (64 bytes)
DATA_fichas_sala5_f3:
	defb 0f5h,0fah,0c8h,0f8h,0a3h,0e4h,08dh,0d7h,057h,0deh,04bh,0c9h,053h,0f7h,077h,0dah	; 8b78  ........W.K.S.w.
	defb 0afh,05fh,013h,01fh,0c5h,027h,0b1h,0ebh,0eah,07bh,0d2h,093h,0cah,0efh,0eeh,05bh	; 8b88  ._...'...{.....[
	defb 052h,0ffh,06fh,0edh,057h,0ceh,056h,0d5h,0a5h,0e3h,0abh,0eeh,0c5h,0f5h,0f5h,0fah	; 8b98  R.o.W.V.........
	defb 04ah,0ffh,0f6h,0b7h,0eah,073h,06ah,0abh,0a5h,0c7h,0d5h,077h,0a3h,0afh,0afh,05fh	; 8ba8  J....sj....w..._

; ----------------------------------------------------------------------
; DATOS fichas_sala5_f4: 6 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 4 de la lista fichas_sala5; lo leen p00:51D4 (96 bytes)
;   0x8bb8..0x8c18  (96 bytes)
DATA_fichas_sala5_f4:
	defb 000h,000h,0ffh,000h,000h,000h,0ffh,000h,0dah,025h,008h,0f7h,000h,013h,0c9h,026h	; 8bb8  .........%.....&
	defb 000h,000h,0fch,000h,000h,002h,0f8h,002h,0d8h,022h,088h,072h,088h,002h,000h,03ah	; 8bc8  .........".r...:
	defb 0d1h,022h,0d1h,026h,0d1h,026h,0f1h,006h,0c1h,02ah,00ah,0d4h,00ch,013h,0e6h,009h	; 8bd8  .".&.&...*......
	defb 030h,04ah,030h,04ah,030h,04ah,030h,04ah,030h,04ah,030h,04ah,030h,04ah,080h,03ah	; 8be8  0J0J0J0J0J0J0J.:
	defb 000h,000h,000h,000h,000h,000h,0b4h,000h,0feh,000h,0ffh,000h,013h,000h,0efh,000h	; 8bf8  ................
	defb 000h,000h,000h,000h,000h,000h,0c0h,000h,0e8h,000h,0f8h,000h,08ah,000h,03ah,000h	; 8c08  ..............:.

; ----------------------------------------------------------------------
; DATOS fichas_sala5_f5: 24 fichas de 8x8 a 3 bit(s) por punto (24 bytes cada
;   una), entrada 5 de la lista fichas_sala5; se solapan 2 bloques:
;   (fichas_sala5_f6 8CD8-8E58); lo leen p00:51D4 (576 bytes)
;   0x8c18..0x8e58  (576 bytes)
DATA_fichas_sala5_f5:
	defb 000h,09ch,000h,059h,059h,020h,05ch,05ch,021h,049h,049h,000h,0ach,0ach,000h,0a9h,000h,002h,0dbh,000h,000h,000h,000h,000h	; 8c18  ...YY \\!II.............
	defb 000h,039h,000h,09ah,09ah,004h,03ah,03ah,084h,092h,092h,000h,035h,035h,000h,095h,000h,040h,0dbh,000h,000h,000h,000h,000h	; 8c30  .9....::....55...@......
	defb 000h,018h,010h,004h,024h,000h,004h,024h,000h,008h,018h,000h,000h,000h,000h,008h,018h,000h,000h,000h,000h,008h,018h,000h	; 8c48  ....$..$................
	defb 000h,000h,000h,008h,018h,010h,00ch,03ch,000h,000h,000h,000h,008h,018h,000h,000h,000h,000h,008h,018h,000h,02ch,018h,000h	; 8c60  .......<.............,..
	defb 04eh,03ch,010h,04eh,03ch,000h,081h,081h,000h,0cfh,0ffh,000h,042h,042h,000h,00ch,03ch,000h,000h,000h,000h,02ch,03ch,000h	; 8c78  N<.N<.......BB..<....,<.
	defb 0cbh,05ah,000h,024h,024h,000h,0ffh,0bbh,000h,06eh,0bbh,091h,06eh,0bbh,000h,06eh,0bbh,000h,0bbh,0bbh,000h,091h,091h,000h	; 8c90  .Z.$$....n..n..n........
	defb 000h,0ffh,000h,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,000h,000h,000h,0ffh,0ffh,000h,000h,000h,000h	; 8ca8  ........................
	defb 000h,000h,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,000h,0ffh,000h,000h,000h,000h,000h	; 8cc0  ........................
	defb 07fh,000h,000h,0ach,0f7h,000h,0ach,0f7h,051h,0ach,0f7h,000h,07fh,07fh,000h,03fh,000h,000h,000h,000h,000h,07ch,03fh,001h	; 8cd8  ........Q......?.....|?.
	defb 03ah,001h,000h,00eh,073h,020h,077h,0fbh,000h,0dfh,0d9h,000h,05dh,0deh,000h,02eh,06fh,000h,023h,023h,000h,011h,010h,000h	; 8cf0  :...s w.....]...o.##....
	defb 0e7h,020h,018h,0ech,027h,011h,0e7h,028h,010h,0ech,037h,001h,0ebh,036h,000h,0eah,035h,001h,0ebh,034h,001h,0ebh,036h,000h	; 8d08  . ..'..(..7..6..5..4..6.
	defb 0eah,035h,001h,0ebh,034h,001h,0ebh,036h,000h,0eah,035h,001h,0ebh,034h,001h,0ebh,036h,000h,0eah,035h,001h,0ebh,034h,001h	; 8d20  .5..4..6..5..4..6..5..4.
	defb 0ebh,036h,000h,0ech,037h,001h,0e7h,028h,010h,0ech,027h,011h,0e7h,020h,018h,078h,03bh,005h,000h,000h,000h,07fh,07fh,000h	; 8d38  .6..7..(..'.. .x........
	defb 076h,0c3h,000h,036h,0e7h,000h,036h,0e7h,081h,036h,0e7h,000h,09ah,0f3h,000h,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h	; 8d50  v..6..6..6..............
	defb 000h,000h,000h,037h,033h,000h,06eh,067h,000h,028h,064h,046h,068h,020h,046h,068h,020h,046h,06ch,061h,000h,037h,033h,000h	; 8d68  ...73.ng.(dFh Fh Fla.73.
	defb 000h,000h,000h,014h,01eh,00ah,05eh,07fh,020h,0ffh,0ffh,000h,0ffh,0e1h,000h,0e7h,0c0h,000h,0e3h,0c0h,000h,071h,060h,000h	; 8d80  ......^. ............q`.
	defb 003h,001h,000h,07fh,01bh,000h,03eh,09bh,081h,01eh,0cbh,000h,08eh,0ebh,000h,0cfh,0e3h,000h,0c3h,071h,000h,0c6h,073h,000h	; 8d98  ......>............q..s.
	defb 001h,000h,000h,003h,000h,000h,007h,000h,000h,00fh,001h,000h,00fh,001h,000h,01fh,003h,000h,03fh,007h,000h,03fh,007h,000h	; 8db0  ..................?..?..
	defb 07fh,00fh,000h,07eh,00fh,000h,07eh,00fh,000h,07eh,00fh,000h,07eh,00fh,000h,03fh,007h,000h,03fh,007h,000h,00fh,003h,000h	; 8dc8  ...~..~..~..~..?..?.....
	defb 0c6h,073h,000h,0c6h,073h,000h,0c6h,0f3h,000h,0c6h,0f3h,000h,086h,0e3h,000h,08eh,0e3h,000h,08eh,0e7h,000h,00ch,0c7h,001h	; 8de0  .s..s...................
	defb 01ch,0c7h,041h,01ch,08fh,001h,018h,08fh,083h,018h,08fh,083h,018h,08fh,001h,01ch,0c7h,041h,00ch,0c7h,000h,086h,0e3h,000h	; 8df8  ..A..............A......
	defb 000h,000h,000h,014h,0c7h,041h,028h,08eh,000h,028h,08dh,001h,029h,08ch,001h,029h,08ch,001h,028h,08eh,000h,014h,0c7h,000h	; 8e10  .....A(..(..)..)..(.....
	defb 000h,000h,07fh,07fh,07fh,07fh,000h,000h,000h,005h,03fh,010h,000h,000h,000h,00fh,03fh,010h,01fh,078h,000h,01ch,070h,040h	; 8e28  ..........?.....?..x..p@
	defb 018h,070h,040h,018h,070h,000h,018h,030h,000h,00ch,018h,000h,006h,00ch,000h,006h,00ch,000h,006h,00ch,000h,02ch,038h,000h	; 8e40  .p@.p..0.............,8.

; ----------------------------------------------------------------------
; DATOS fichas_sala5_f7: 64 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 7 de la lista fichas_sala5; se solapan 2 bloques:
;   (fichas_sala5_f9 8E58-9258); lo leen p00:51D4 (1024 bytes)
;   0x8e58..0x9258  (1024 bytes)
DATA_fichas_sala5_f7:
	defb 000h,000h,004h,004h,018h,010h,030h,020h,010h,020h,020h,040h,060h,040h,060h,040h	; 8e58  ......0 .  @`@`@
	defb 000h,000h,000h,000h,038h,07ch,035h,078h,01ch,060h,070h,000h,007h,006h,02eh,01fh	; 8e68  ....8|5x.`p.....
	defb 000h,000h,000h,000h,000h,000h,054h,0efh,000h,000h,0aah,077h,000h,000h,0adh,01bh	; 8e78  ......T....w....
	defb 000h,000h,000h,000h,011h,000h,0a9h,011h,010h,039h,0a8h,011h,034h,00ch,065h,02dh	; 8e88  .........9..4.e-
	defb 020h,040h,020h,040h,060h,040h,060h,040h,060h,040h,020h,040h,060h,040h,020h,040h	; 8e98   @ @`@`@`@ @`@ @
	defb 02dh,01eh,033h,00ch,01eh,000h,001h,000h,001h,000h,000h,000h,000h,000h,000h,000h	; 8ea8  -.3.............
	defb 080h,000h,070h,060h,0e7h,0f0h,057h,0e6h,0a7h,04eh,0e1h,00eh,00eh,000h,000h,000h	; 8eb8  ..p`..W..N......
	defb 024h,06dh,024h,06ch,024h,06dh,025h,06dh,025h,06dh,024h,06dh,064h,02dh,025h,00ch	; 8ec8  $m$l$m%m%m$md-%.
	defb 080h,000h,0c0h,000h,088h,050h,0a4h,048h,046h,028h,058h,027h,03fh,000h,001h,000h	; 8ed8  .....P.HF(X'?...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,07ch,000h,03eh,0f8h,08eh,07ch,0e6h,01ch	; 8ee8  ........|.>..|..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,068h,030h,016h,00eh,00dh,003h,006h,001h	; 8ef8  ........h0......
	defb 0c4h,04ch,04ch,032h,036h,001h,003h,000h,000h,000h,019h,007h,0b4h,08fh,04eh,0c1h	; 8f08  .LL26.........N.
	defb 00ch,000h,044h,0e1h,071h,080h,0c8h,000h,005h,003h,0e0h,080h,04dh,083h,099h,007h	; 8f18  ..D.q.......M...
	defb 072h,00ch,074h,008h,040h,000h,000h,000h,026h,018h,066h,018h,066h,018h,066h,018h	; 8f28  r.t.@...&.f.f.f.
	defb 003h,000h,001h,000h,000h,000h,000h,000h,001h,000h,001h,000h,001h,000h,001h,000h	; 8f38  ................
	defb 063h,080h,0c9h,008h,024h,00ch,068h,006h,0e6h,002h,0f4h,002h,0d4h,062h,070h,0e2h	; 8f48  c...$.h......bp.
	defb 0a6h,001h,069h,010h,046h,038h,0dbh,03dh,08ah,07dh,0dch,03eh,0a1h,002h,0c4h,019h	; 8f58  ..i.F8.=.}.>....
	defb 063h,01ch,063h,01ch,06bh,01ch,06bh,01ch,06bh,01ch,069h,01eh,029h,05eh,029h,05eh	; 8f68  c.c.k.k.k.i.)^)^
	defb 000h,000h,000h,000h,001h,000h,002h,001h,001h,002h,082h,001h,082h,000h,081h,002h	; 8f78  ................
	defb 000h,000h,090h,070h,000h,088h,070h,000h,038h,0f0h,000h,008h,0f2h,000h,032h,0f8h	; 8f88  ...p..p.8.....2.
	defb 001h,000h,058h,038h,024h,01ch,018h,006h,008h,006h,008h,006h,008h,006h,002h,00ch	; 8f98  ..X8$...........
	defb 0bah,0e0h,09ah,061h,099h,071h,09dh,078h,088h,07ch,04ah,03ch,066h,018h,024h,018h	; 8fa8  ...a.q.x.|J<f.$.
	defb 0a6h,040h,07ah,025h,055h,039h,025h,019h,032h,00ch,0b5h,00ah,0b1h,008h,092h,009h	; 8fb8  .@z%U9%.2.......
	defb 07dh,04eh,07dh,04eh,03ch,04fh,056h,02fh,07fh,027h,02bh,017h,03ch,000h,000h,000h	; 8fc8  }N}N<OV/.'+.<...
	defb 082h,001h,0c2h,000h,0e1h,002h,0e2h,001h,040h,083h,012h,001h,039h,000h,0feh,000h	; 8fd8  ........@...9...
	defb 00ah,000h,0f3h,000h,033h,0f8h,003h,088h,06bh,000h,063h,000h,097h,000h,09eh,070h	; 8fe8  ....3...k.c....p
	defb 002h,00ch,003h,00ch,00bh,006h,009h,006h,005h,003h,004h,003h,003h,000h,039h,000h	; 8ff8  ..............9.
	defb 02dh,010h,03bh,000h,037h,001h,086h,003h,0ceh,003h,0edh,0c6h,035h,0e6h,0cbh,038h	; 9008  -...7.......5..8
	defb 0d9h,004h,08dh,0c3h,012h,0c1h,058h,080h,0deh,000h,0b7h,008h,0bfh,000h,01bh,024h	; 9018  ......X........$
	defb 003h,000h,00fh,000h,00fh,000h,005h,002h,005h,003h,002h,001h,000h,000h,000h,000h	; 9028  ................
	defb 08eh,070h,063h,0fch,0b1h,07eh,0c5h,03eh,0f1h,00eh,0ffh,080h,0a7h,078h,000h,000h	; 9038  .pc..~.>.....x..
	defb 0deh,038h,04eh,038h,05ch,030h,038h,000h,082h,000h,046h,000h,07ch,002h,048h,03eh	; 9048  .8N8\08...F.|.H>
	defb 07ch,000h,064h,018h,0fah,01ch,0deh,03ch,0deh,03ch,0ceh,03ch,0efh,018h,067h,018h	; 9058  |.d....<.<.<..g.
	defb 075h,00ch,018h,006h,0adh,042h,0a6h,061h,0b2h,061h,0dbh,030h,069h,01ch,038h,006h	; 9068  u....B.a.a.0i.8.
	defb 024h,01bh,043h,01ch,010h,04fh,02ch,043h,073h,020h,01ch,030h,02fh,01ch,053h,00fh	; 9078  $.C..O,Cs .0/.S.
	defb 04dh,03eh,06dh,01eh,06ch,01fh,066h,01fh,066h,01fh,076h,00fh,072h,00fh,031h,00eh	; 9088  M>m.l.f.f.v.r.1.
	defb 07fh,002h,03ah,006h,03eh,006h,036h,00ch,024h,01ch,024h,018h,038h,000h,036h,000h	; 9098  ..:.>.6.$.$.8.6.
	defb 00dh,002h,056h,021h,0a6h,061h,0a4h,062h,0d2h,030h,06ch,018h,039h,006h,00eh,001h	; 90a8  ..V!.a.b.0l.9...
	defb 06ch,003h,073h,020h,05ch,030h,05fh,03ch,067h,01fh,031h,00fh,01ch,003h,08fh,000h	; 90b8  l.s \0_<g.1.....
	defb 03bh,004h,01fh,000h,02eh,000h,060h,020h,060h,060h,060h,060h,030h,060h,050h,020h	; 90c8  ......` ````0`P
	defb 00fh,000h,039h,006h,073h,00eh,073h,00eh,0e7h,01eh,0e7h,01eh,0fdh,006h,01fh,000h	; 90d8  ..9.s.s.........
	defb 033h,000h,071h,010h,058h,038h,066h,01fh,03fh,000h,040h,000h,067h,000h,058h,020h	; 90e8  3.q.X8f.?.@.g.X
	defb 040h,080h,005h,003h,054h,038h,0f1h,080h,083h,000h,029h,01bh,095h,00ch,0e8h,004h	; 90f8  @...T8....).....
	defb 000h,000h,000h,000h,000h,000h,000h,003h,003h,007h,000h,000h,000h,000h,002h,001h	; 9108  ................
	defb 000h,000h,000h,000h,035h,0fah,0ffh,080h,00bh,000h,002h,001h,0c6h,031h,037h,0c1h	; 9118  ....5........17.
	defb 060h,030h,0e9h,030h,08bh,070h,0e3h,078h,0f5h,078h,0b5h,078h,0c5h,038h,06dh,090h	; 9128  `0.0.p.x.x.x.8m.
	defb 006h,000h,0e2h,000h,0b8h,040h,00ch,0f0h,034h,0f8h,074h,0f8h,06ch,0f0h,098h,0e0h	; 9138  .....@..4.t.l...
	defb 06fh,018h,037h,00eh,01dh,003h,04fh,000h,023h,000h,0a0h,010h,056h,00ch,06dh,003h	; 9148  o.7...O.#...V.m.
	defb 006h,002h,0fbh,001h,0f9h,0f8h,004h,0fch,0fdh,000h,0e2h,001h,039h,007h,0efh,0ffh	; 9158  ............9...
	defb 003h,007h,000h,000h,000h,000h,001h,000h,007h,003h,000h,000h,000h,000h,000h,000h	; 9168  ................
	defb 095h,003h,005h,003h,065h,013h,094h,0e3h,0ceh,001h,007h,018h,078h,0e0h,000h,000h	; 9178  ....e.......x...
	defb 0b9h,0c0h,0dbh,0e0h,0f7h,0e0h,0d0h,0e0h,020h,0c0h,083h,000h,00ch,003h,000h,000h	; 9188  ........ .......
	defb 078h,080h,0f1h,000h,080h,001h,018h,000h,065h,01eh,0cch,003h,0d0h,0e1h,0d4h,038h	; 9198  x.......e......8
	defb 021h,010h,0b6h,00ch,04eh,081h,013h,060h,004h,018h,0e1h,086h,039h,0e0h,0dfh,038h	; 91a8  !...N..`....9..8
	defb 0e1h,007h,03bh,00fh,0d9h,0e3h,0f6h,001h,081h,000h,03ch,018h,0a7h,014h,0b3h,00ah	; 91b8  ..........<.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,003h,000h,006h,001h,004h,003h	; 91c8  ................
	defb 001h,000h,000h,000h,01dh,000h,0feh,000h,0fah,004h,081h,07eh,000h,0ffh,0feh,0ffh	; 91d8  ...........~....
	defb 08eh,07ch,005h,003h,081h,000h,058h,080h,01ch,040h,007h,068h,003h,06ch,049h,06eh	; 91e8  .|....X..@.h.lIn
	defb 015h,00eh,0c5h,083h,010h,0e3h,049h,030h,022h,01ch,011h,00eh,088h,007h,0c2h,001h	; 91f8  ......I0".......
	defb 02fh,01eh,09bh,007h,0a4h,0c3h,033h,0e0h,05ch,030h,02fh,01ch,093h,00fh,04ch,083h	; 9208  /.....3.\0/...L.
	defb 0d6h,00ch,0dch,089h,05ch,089h,046h,094h,0d3h,00ah,0d3h,00ah,0d3h,08ah,046h,094h	; 9218  ....\.F.......F.
	defb 001h,007h,004h,003h,006h,001h,003h,000h,001h,000h,000h,000h,000h,000h,000h,000h	; 9228  ................
	defb 0ffh,0ffh,09ah,0ffh,000h,0ffh,08ah,075h,0ffh,000h,0feh,000h,018h,000h,000h,000h	; 9238  .......u........
	defb 06dh,06fh,022h,06dh,00dh,062h,02fh,040h,06fh,000h,04eh,000h,090h,000h,000h,000h	; 9248  mo"m.b/@o.N.....

; ----------------------------------------------------------------------
; DATOS fichas_sala5_f8: 14 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 8 de la lista fichas_sala5; se solapan 2 bloques:
;   (fichas_sala5_f10 9258-9338); lo leen p00:51D4 (224 bytes)
;   0x9258..0x9338  (224 bytes)
DATA_fichas_sala5_f8:
	defb 060h,081h,0a8h,040h,06ch,080h,0edh,000h,0dbh,000h,036h,000h,000h,000h,000h,000h	; 9258  `..@l.....6.....
	defb 073h,0c0h,0b8h,060h,05fh,038h,02fh,01fh,01ah,007h,006h,001h,001h,000h,000h,000h	; 9268  s..`_8/.........
	defb 0dch,009h,09ch,009h,0a6h,014h,0b3h,00ah,023h,01ah,066h,014h,04ch,029h,000h,000h	; 9278  ........#.f.L)..
	defb 00bh,014h,000h,000h,005h,006h,010h,019h,00ah,018h,053h,018h,00ah,059h,053h,058h	; 9288  ..........S..YSX
	defb 000h,000h,000h,000h,001h,000h,002h,001h,001h,002h,002h,001h,002h,000h,001h,002h	; 9298  ................
	defb 002h,001h,002h,000h,001h,002h,002h,001h,000h,003h,002h,001h,001h,000h,000h,000h	; 92a8  ................
	defb 000h,000h,000h,000h,020h,000h,060h,020h,060h,060h,060h,060h,030h,060h,050h,020h	; 92b8  .... .` ````0`P
	defb 006h,000h,072h,000h,078h,000h,03eh,000h,01fh,000h,000h,000h,000h,000h,000h,000h	; 92c8  ..r.x.>.........
	defb 000h,000h,001h,000h,000h,001h,018h,000h,065h,01eh,0cch,003h,0d0h,0e1h,0d4h,038h	; 92d8  ........e......8
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,000h,00ch,003h,000h,000h	; 92e8  ................
	defb 0a6h,001h,079h,000h,046h,038h,083h,005h,0f2h,039h,0bdh,004h,0c4h,002h,0a2h,039h	; 92f8  ..y.F8...9.....9
	defb 0b0h,004h,042h,001h,055h,039h,024h,019h,022h,000h,091h,008h,0a8h,000h,080h,000h	; 9308  ..B.U9$.".......
	defb 0a8h,000h,080h,0d0h,002h,0cch,042h,081h,0d0h,000h,0b4h,008h,0bfh,000h,01bh,024h	; 9318  ......B........$
	defb 0abh,074h,000h,000h,0c5h,066h,090h,099h,04ah,018h,053h,098h,0cah,099h,053h,098h	; 9328  .t...f..J.S...S.

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites: 54 x [patron volteado][origen lo][hi][patron
;   normal] (p00:5612); lo leen p00:5609 (216 bytes)
;   0x9338..0x9410  (216 bytes)
DATA_juegos_de_sprites:
	defb 050h,030h,0a0h,070h	; 9338
	defb 0b8h,073h,095h,0b0h	; 933c
	defb 090h,033h,099h,0a0h	; 9340
	defb 050h,048h,094h,070h	; 9344
	defb 050h,0cdh,09ch,050h	; 9348
	defb 068h,000h,09eh,050h	; 934c
	defb 068h,0deh,096h,050h	; 9350
	defb 050h,023h,09bh,090h	; 9354
	defb 0b8h,0b8h,09ah,0b8h	; 9358
	defb 0a0h,0b2h,09fh,0b0h	; 935c
	defb 098h,033h,0a1h,0b8h	; 9360
	defb 050h,06bh,0a2h,070h	; 9364
	defb 078h,0f9h,095h,090h	; 9368
	defb 0c0h,033h,098h,0b0h	; 936c
	defb 0a0h,0b4h,099h,0b8h	; 9370
	defb 000h,000h,000h,000h	; 9374
	defb 000h,000h,000h,000h	; 9378
	defb 000h,000h,000h,000h	; 937c
	defb 000h,000h,000h,000h	; 9380
	defb 0b8h,073h,095h,0b0h	; 9384
	defb 090h,033h,099h,0a0h	; 9388
	defb 070h,0b0h,09dh,070h	; 938c
	defb 090h,035h,09fh,0a0h	; 9390
	defb 000h,000h,000h,000h	; 9394
	defb 0d8h,018h,0ach,0d8h	; 9398
	defb 000h,000h,000h,000h	; 939c
	defb 000h,000h,000h,000h	; 93a0
	defb 000h,000h,000h,000h	; 93a4
	defb 000h,000h,000h,000h	; 93a8
	defb 070h,02fh,0a4h,050h	; 93ac
	defb 070h,02eh,0a5h,050h	; 93b0
	defb 050h,024h,0a6h,080h	; 93b4
	defb 068h,05eh,0a8h,050h	; 93b8
	defb 000h,000h,000h,000h	; 93bc
	defb 0d0h,087h,0adh,0d8h	; 93c0
	defb 048h,04ch,095h,048h	; 93c4
	defb 048h,04ch,095h,048h	; 93c8
	defb 000h,0f6h,095h,000h	; 93cc
	defb 0f8h,054h,0adh,0f8h	; 93d0
	defb 030h,06bh,0a3h,030h	; 93d4
	defb 020h,0fdh,0a3h,020h	; 93d8
	defb 000h,0f6h,095h,000h	; 93dc
	defb 048h,034h,0a2h,048h	; 93e0
	defb 048h,018h,0a9h,048h	; 93e4
	defb 048h,05ah,0a9h,048h	; 93e8
	defb 048h,087h,0a9h,048h	; 93ec
	defb 048h,0b8h,0a9h,048h	; 93f0
	defb 080h,0fah,0a9h,050h	; 93f4
	defb 070h,0fdh,0adh,090h	; 93f8
	defb 080h,0a4h,0aeh,08ch	; 93fc
	defb 070h,06fh,0afh,070h	; 9400
	defb 070h,070h,0b0h,080h	; 9404
	defb 070h,0f2h,0b0h,080h	; 9408
	defb 070h,005h,0afh,070h	; 940c

; ----------------------------------------------------------------------
; DATOS juego_acompanante: 54 bytes: el juego de sprites que p00:55F0 carga
;   ademas del A (p08:9410[A - 1]; 0 = ninguno); lo leen p00:55F0 (54 bytes)
;   0x9410..0x9446  (54 bytes)
DATA_juego_acompanante:
	defb 000h,000h,025h,024h,016h,017h,000h,000h,000h,000h,02bh,000h,000h,000h,000h,024h	; 9410  ..%$......+....$
	defb 000h,024h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,02ch,02dh,02eh	; 9420  .$...........,-.
	defb 02fh,01ah,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,036h	; 9430  /..............6
	defb 000h,036h,000h,000h,000h,000h	; 9440

; ----------------------------------------------------------------------
; DATOS resto_9446: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (2 bytes)
;   0x9446..0x9448  (2 bytes)
DATA_resto_9446:
	defb 000h,000h	; 9446

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_3: patrones de sprite en RLE (p00:49CE), el registro
;   3 de juegos_de_sprites; lo leen p00:5609 (260 bytes)
;   0x9448..0x954c  (260 bytes)
DATA_juegos_de_sprites_3:
	defb 0ffh,003h,007h,00eh,00ch,008h,038h,070h,048h,038h,048h,071h,038h,00eh,006h,003h	; 9448  ......8pH8Hq8...
	defb 001h,0c0h,0e0h,0b0h,03ch,01ah,0d6h,0cch,018h,0d8h,0d8h,088h,00ch,076h,07ah,0cch	; 9458  ....<........vz.
	defb 080h,003h,004h,00bh,00bh,00fh,037h,04fh,077h,037h,077h,04eh,037h,009h,007h,002h	; 9468  ......7Ow7wN7...
	defb 001h,0c0h,020h,0d0h,0dch,0e6h,02ah,034h,0e8h,028h,028h,078h,0f4h,08ah,0f6h,04ch	; 9478  .. ...*4.((x...L
	defb 080h,000h,030h,058h,06fh,033h,030h,073h,0c7h,0c4h,070h,030h,01bh,00dh,00dh,006h	; 9488  ..0Xo30s..p0....
	defb 000h,000h,030h,068h,0d8h,0bch,00eh,063h,067h,003h,007h,00eh,0bch,060h,060h,0c0h	; 9498  ..0h...cg....``.
	defb 000h,000h,030h,068h,057h,02ch,02fh,06ch,0b8h,0bbh,06fh,02fh,014h,00bh,00bh,006h	; 94a8  ..0hW,/l..o/....
	defb 000h,000h,030h,058h,0a8h,04ch,0f2h,09dh,09dh,0fdh,0fdh,0f2h,05ch,0a0h,0a0h,0c0h	; 94b8  ..0X.L......\...
	defb 0ffh,000h,001h,033h,05eh,06eh,030h,011h,01bh,01bh,018h,033h,06bh,058h,03ch,00dh	; 94c8  ...3^n0....3kX<.
	defb 007h,003h,080h,0c0h,060h,070h,01ch,08eh,012h,01ch,012h,00eh,01ch,010h,030h,070h	; 94d8  ....`p........0p
	defb 0e0h,0c0h,001h,032h,06fh,051h,02fh,01eh,014h,014h,017h,02ch,054h,067h,03bh,00bh	; 94e8  ...2oQ/....,Tg..
	defb 004h,003h,080h,040h,0e0h,090h,0ech,072h,0eeh,0ech,0eeh,0f2h,0ech,0f0h,0d0h,0d0h	; 94f8  ...@...r........
	defb 020h,0c0h,000h,003h,006h,006h,03dh,070h,0e0h,0c0h,0e6h,0c6h,070h,03dh,01bh,016h	; 9508   .....=p....p=..
	defb 00ch,000h,000h,060h,0b0h,0b0h,0d8h,00ch,00eh,023h,0e3h,0ceh,00ch,0cch,0f6h,01ah	; 9518  ...`.....#......
	defb 00ch,000h,000h,003h,005h,005h,03ah,04fh,0bfh,0bfh,0b9h,0b9h,04fh,032h,015h,01ah	; 9528  ......:O....O2..
	defb 00ch,000h,000h,060h,0d0h,0d0h,028h,0f4h,0f6h,0ddh,01dh,036h,0f4h,034h,0eah,016h	; 9538  ...`..(....6.4..
	defb 082h,00ch,000h,000h	; 9548

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_35: patrones de sprite en RLE (p00:49CE), el
;   registro 35 de juegos_de_sprites; se solapan 2 bloques:
;   (juegos_de_sprites_36 954C-9573); lo leen p00:5609 (39 bytes)
;   0x954c..0x9573  (39 bytes)
DATA_juegos_de_sprites_35:
	defb 005h,000h,086h,001h,002h,004h,005h,002h,001h,00ah,000h,086h,080h,040h,0a0h,0a0h	; 954c  .............@..
	defb 040h,080h,00ah,000h,086h,001h,003h,007h,006h,003h,001h,00ah,000h,086h,080h,0c0h	; 955c  @...............
	defb 060h,060h,0c0h,080h,005h,000h,000h	; 956c

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_1: patrones de sprite en RLE (p00:49CE), el registro
;   1 de juegos_de_sprites; se solapan 2 bloques: (juegos_de_sprites_19
;   9573-95F6); lo leen p00:5609 (131 bytes)
;   0x9573..0x95f6  (131 bytes)
DATA_juegos_de_sprites_1:
	defb 0ffh,041h,0e3h,0e7h,0fch,05fh,06eh,0ffh,057h,03eh,035h,05fh,0fdh,0f6h,054h,00ah	; 9573  .A..._n.W>5_..T.
	defb 006h,082h,0c7h,065h,03dh,07ah,036h,07dh,0e2h,07ch,0b4h,0fah,0bdh,06fh,02ah,050h	; 9583  ...e=z6}.|...o*P
	defb 060h,041h,0a2h,0a4h,0bbh,068h,079h,0bch,06bh,03dh,02eh,07ah,0b7h,0beh,05ch,00eh	; 9593  `A...hy.k=.z..\.
	defb 006h,082h,045h,0a7h,0dfh,096h,0deh,0bfh,0deh,0bch,06ch,05eh,0efh,07dh,03ah,070h	; 95a3  ..E.......l^.}:p
	defb 060h,018h,034h,01bh,03dh,04fh,0bfh,0d5h,00eh,00eh,0d5h,0bfh,04dh,03fh,01bh,03ch	; 95b3  `.4.=O......M?.<
	defb 018h,04eh,0b3h,06eh,058h,078h,0fch,0d6h,083h,0d7h,0f6h,0fch,078h,0d8h,06eh,0ffh	; 95c3  .N.nXx......x.n.
	defb 04eh,018h,02ch,01fh,03fh,075h,0fbh,0deh,009h,009h,0deh,0fbh,077h,03dh,01fh,024h	; 95d3  N.,.?u......w=.$
	defb 018h,04eh,0fdh,0feh,0e8h,0f8h,044h,0aah,0fdh,0a9h,08ah,044h,0f8h,068h,0feh,0b1h	; 95e3  .N....D....D.h..
	defb 081h,04eh,000h	; 95f3

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_37: patrones de sprite en RLE (p00:49CE), el
;   registro 37 de juegos_de_sprites; se solapan 2 bloques:
;   (juegos_de_sprites_41 95F6-95F9); lo leen p00:5609 (3 bytes)
;   0x95f6..0x95f9  (3 bytes)
DATA_juegos_de_sprites_37:
	defb 020h,000h,000h	; 95f6

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_12: patrones de sprite en RLE (p00:49CE), el
;   registro 12 de juegos_de_sprites; lo leen p00:5609 (229 bytes)
;   0x95f9..0x96de  (229 bytes)
DATA_juegos_de_sprites_12:
	defb 0c5h,000h,003h,007h,00fh,01fh,03fh,07fh,07fh,06fh,04fh,037h,00fh,01ch,01bh,00ch	; 95f9  ......?..oO7....
	defb 003h,0f8h,0fch,088h,0c8h,0e4h,0eeh,0efh,0f9h,0fah,0eah,0ech,0f2h,0e9h,0f9h,076h	; 9609  ...............v
	defb 0b8h,000h,003h,004h,008h,014h,036h,050h,050h,058h,078h,038h,009h,013h,017h,00fh	; 9619  ......6PPXx8....
	defb 003h,0f8h,004h,078h,038h,07ch,0deh,011h,007h,006h,016h,0fch,01eh,0dfh,0efh,0eeh	; 9629  ...x8|..........
	defb 0b8h,000h,000h,003h,007h,00fh,003h,01fh,0b8h,03fh,07fh,06fh,07fh,03dh,03ah,01dh	; 9639  .........?.o.=:.
	defb 006h,000h,0f8h,0fch,088h,0c8h,0e4h,0e4h,0c4h,0fch,0dah,0b2h,0a2h,0bah,045h,089h	; 9649  ..............E.
	defb 076h,000h,000h,003h,004h,008h,014h,016h,010h,030h,048h,058h,05ch,026h,03fh,01fh	; 9659  v........0HX\&?.
	defb 006h,000h,0f8h,004h,078h,038h,07ch,0dch,03ch,01ch,026h,04eh,05eh,05eh,0bfh,0ffh	; 9669  ....x8|.<.&N^^..
	defb 076h,003h,000h,083h,003h,007h,00fh,004h,01fh,002h,03fh,094h,037h,01eh,03dh,01eh	; 9679  v.........?.7.=.
	defb 000h,000h,0f8h,0fch,088h,0c8h,0c4h,0e4h,0c4h,0c2h,0f2h,0eah,0e2h,0f3h,0edh,0f2h	; 9689  ................
	defb 003h,000h,09dh,003h,004h,008h,010h,014h,016h,010h,028h,025h,02dh,01fh,023h,01eh	; 9699  ..........(%-.#.
	defb 000h,000h,0f8h,004h,078h,038h,03ch,07ch,0fch,03eh,0feh,01eh,01eh,0ffh,01fh,0f2h	; 96a9  ....x8<|.>......
	defb 00ah,000h,086h,001h,00eh,037h,04fh,0bfh,07fh,00ah,000h,086h,0f0h,0f8h,0ech,0f2h	; 96b9  .....7O.........
	defb 0c1h,0feh,00ah,000h,086h,001h,00fh,038h,076h,0c0h,067h,00ah,000h,086h,0f0h,008h	; 96c9  .......8v.g.....
	defb 01ch,0eeh,03fh,086h,000h	; 96d9

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_6: patrones de sprite en RLE (p00:49CE), el registro
;   6 de juegos_de_sprites; lo leen p00:5609 (341 bytes)
;   0x96de..0x9833  (341 bytes)
DATA_juegos_de_sprites_6:
	defb 009h,000h,087h,003h,03fh,07fh,05fh,03dh,07fh,06fh,009h,000h,087h,0e0h,0feh,0ffh	; 96de  ....?._=.o......
	defb 0cdh,046h,0c7h,0fbh,009h,000h,087h,003h,03fh,04fh,068h,033h,050h,05fh,009h,000h	; 96ee  .F......?Oh3P_..
	defb 087h,0e0h,07eh,0f9h,0bbh,0feh,03dh,0fdh,0a2h,003h,007h,00fh,00fh,00eh,03dh,07bh	; 96fe  ..~...=.......={
	defb 06bh,03dh,00bh,037h,07fh,05dh,02ah,015h,008h,0e0h,0f0h,0f8h,0f8h,0b8h,0feh,0ffh	; 970e  k=.7.]*.........
	defb 0fbh,0feh,0e8h,0d6h,0efh,0cdh,022h,0d4h,008h,003h,007h,003h,00fh,09bh,03eh,04ch	; 971e  ......".......>L
	defb 05dh,036h,00fh,034h,048h,062h,037h,01dh,008h,0e0h,0f0h,078h,0f8h,0f8h,01eh,009h	; 972e  ]6.4Hb7....x....
	defb 04dh,016h,0f8h,036h,099h,033h,0feh,0dch,008h,006h,000h,08ah,038h,07ch,04dh,02fh	; 973e  M..6.3......8|M/
	defb 02fh,036h,07bh,049h,034h,00fh,006h,000h,08ah,00eh,09fh,0d9h,0fah,0f2h,036h,0cfh	; 974e  /6{I4.........6.
	defb 089h,016h,0f8h,006h,000h,08ah,038h,044h,075h,037h,033h,03bh,04ch,07eh,03fh,00fh	; 975e  ......8Du73.L~?.
	defb 006h,000h,08ch,00eh,091h,057h,0f6h,0eeh,0eeh,039h,07fh,0feh,0f8h,007h,00fh,005h	; 976e  .....W...9......
	defb 01fh,0bch,00fh,037h,07fh,05fh,03fh,00bh,006h,005h,003h,0e0h,0f0h,0f8h,078h,0b8h	; 977e  ...7._?.......x.
	defb 0b8h,098h,038h,0fch,08eh,0bah,09ch,0d0h,060h,040h,080h,006h,00fh,01fh,01ah,010h	; 978e  ..8.....`@......
	defb 015h,010h,008h,03fh,048h,072h,031h,00eh,007h,007h,003h,0e0h,0f0h,0f8h,0f8h,078h	; 979e  ...?Hr1........x
	defb 068h,068h,0f8h,0c4h,072h,07eh,0fch,070h,0e0h,0c0h,080h,001h,007h,00fh,004h,01fh	; 97ae  hh..r~.p........
	defb 0c5h,03fh,07fh,057h,02fh,01fh,03fh,07ch,03bh,01ch,000h,0e0h,0f0h,0f8h,078h,0b8h	; 97be  .?.W/.?|......x.
	defb 0b8h,09ch,03eh,0cah,0bch,0a0h,038h,074h,0f4h,028h,001h,006h,00fh,01fh,01ah,010h	; 97ce  ..>...8t.(......
	defb 015h,030h,048h,07fh,028h,012h,038h,047h,03fh,01ch,000h,0e0h,0f0h,0f8h,0f8h,078h	; 97de  .0H.(.8G?......x
	defb 068h,06ch,0f2h,0feh,07ch,060h,0f8h,0fch,0fch,038h,000h,00ch,01bh,037h,07fh,0ffh	; 97ee  hl..|`...8...7..
	defb 0cfh,07fh,01fh,00fh,006h,003h,006h,000h,09ah,0e0h,0f0h,0f8h,0f8h,0fch,0fch,078h	; 97fe  ...............x
	defb 074h,0b4h,052h,0bah,0fah,07ch,018h,000h,00ch,017h,02fh,07fh,097h,0b9h,071h,014h	; 980e  t.R..|..../...q.
	defb 00ah,005h,003h,006h,000h,08eh,0e0h,0f0h,0f8h,0b8h,0fch,0fch,0f8h,0fch,0fch,07eh	; 981e  ...............~
	defb 0d6h,096h,064h,018h,000h	; 982e

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_13: patrones de sprite en RLE (p00:49CE), el
;   registro 13 de juegos_de_sprites; lo leen p00:5609 (256 bytes)
;   0x9833..0x9933  (256 bytes)
DATA_juegos_de_sprites_13:
	defb 0ffh,007h,01bh,024h,05eh,073h,086h,0cch,0dch,0ceh,0bbh,0afh,058h,050h,02bh,018h	; 9833  ...$^s......XP+.
	defb 007h,0e0h,098h,064h,07ah,0cah,06dh,035h,0f5h,025h,0cdh,085h,0aah,07ah,064h,018h	; 9843  ...dz.m5.%...zd.
	defb 0e0h,007h,01ch,03bh,061h,04ch,0f9h,0b3h,0a3h,0b1h,0c4h,0d0h,067h,06fh,034h,01fh	; 9853  ....aL......go4.
	defb 007h,0e0h,078h,09ch,086h,036h,093h,0cbh,00bh,0dbh,033h,07bh,056h,086h,09ch,0f8h	; 9863  ..x..6....3{V...
	defb 0e0h,038h,067h,0f8h,097h,0bfh,043h,0dch,07fh,07fh,07eh,03ch,09dh,08fh,0e1h,068h	; 9873  .8g...C...~<...h
	defb 03ch,01ch,0aeh,057h,0b9h,0afh,0beh,053h,0a7h,0bfh,0d5h,02eh,0a6h,0ach,0d9h,063h	; 9883  <..W...S.......c
	defb 0ceh,038h,057h,0afh,0d8h,0bch,07fh,0a3h,040h,042h,049h,023h,0d2h,0eeh,091h,054h	; 9893  .8W.....@BI#...T
	defb 03ch,01ch,0b2h,0f9h,06fh,07fh,0f2h,0ffh,07dh,079h,0ffh,0f2h,07ah,074h,0dbh,0adh	; 98a3  <...o...}y..zt..
	defb 081h,0ceh,004h,000h,08ch,001h,00fh,01eh,03fh,07fh,07fh,04eh,0e6h,0eeh,089h,076h	; 98b3  ........?..N...v
	defb 009h,003h,000h,08dh,0c0h,040h,08ch,054h,079h,052h,06fh,0eah,0eeh,0efh,019h,0edh	; 98c3  .....@.TyRo.....
	defb 012h,005h,000h,08bh,00eh,011h,020h,048h,040h,075h,099h,099h,0ffh,07fh,009h,003h	; 98d3  ...... H@u......
	defb 000h,0adh,040h,0c0h,084h,0cch,0e8h,0f1h,0ddh,09eh,09ah,099h,0ffh,0ffh,012h,000h	; 98e3  ..@.............
	defb 000h,001h,002h,003h,01dh,03eh,07fh,07eh,07eh,05eh,0edh,0dah,093h,06ah,014h,000h	; 98f3  .....>.~~^...j..
	defb 000h,080h,080h,030h,05ch,0f4h,078h,0d8h,0fch,0fch,03ch,048h,068h,0ach,05ch,003h	; 9903  ...0\.x...<Hh.\.
	defb 000h,002h,001h,09bh,01fh,021h,040h,051h,041h,069h,093h,0b7h,0ffh,07eh,014h,000h	; 9913  .....!@QAi...~..
	defb 000h,080h,080h,010h,034h,0ach,0e8h,0b8h,0a4h,0a4h,0e4h,0f8h,0f8h,0f4h,05ch,000h	; 9923  ....4.........\.

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_2: patrones de sprite en RLE (p00:49CE), el registro
;   2 de juegos_de_sprites; se solapan 2 bloques: (juegos_de_sprites_20
;   9933-99B4); lo leen p00:5609 (129 bytes)
;   0x9933..0x99b4  (129 bytes)
DATA_juegos_de_sprites_2:
	defb 0b2h,007h,00fh,01eh,01fh,00fh,012h,03dh,07bh,0e7h,0e7h,06fh,03fh,073h,02fh,04ch	; 9933  .......={..o?s/L
	defb 03fh,0fch,0feh,001h,0c1h,081h,001h,0c1h,0dah,0dah,09ah,0b2h,0b4h,0a4h,004h,008h	; 9943  ?...............
	defb 0f0h,007h,008h,011h,01fh,00fh,01fh,026h,04ch,098h,0f8h,070h,038h,04ch,030h,073h	; 9953  .......&L..p8L0s
	defb 03fh,0fch,002h,004h,0ffh,0cah,03fh,03eh,02eh,06eh,05eh,05ch,07ch,0fch,0f8h,0f0h	; 9963  ?.....?>.n^\|...
	defb 003h,037h,07eh,0edh,0ebh,0cbh,05eh,03dh,07ah,0e7h,0efh,07fh,030h,040h,040h,03fh	; 9973  .7~...^=z...0@@?
	defb 0fch,0feh,0c1h,0e1h,0d1h,0d1h,091h,022h,0c7h,0c3h,086h,0c6h,066h,03ch,038h,0f0h	; 9983  ......."....f<8.
	defb 003h,034h,069h,09bh,09eh,0beh,073h,027h,04dh,098h,0f0h,06fh,03fh,07fh,07fh,03fh	; 9993  .4i...s'M..o?..?
	defb 0fch,002h,0ffh,0bfh,03fh,03fh,07fh,0feh,0f9h,03dh,07ah,0bah,0dah,0ech,0e8h,0f0h	; 99a3  ....??...=z.....
	defb 000h	; 99b3

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_14: patrones de sprite en RLE (p00:49CE), el
;   registro 14 de juegos_de_sprites; lo leen p00:5609 (260 bytes)
;   0x99b4..0x9ab8  (260 bytes)
DATA_juegos_de_sprites_14:
	defb 0ffh,000h,001h,003h,00fh,011h,020h,01ch,003h,004h,004h,01ch,026h,01bh,00bh,016h	; 99b4  ...... .....&...
	defb 00ch,0ffh,0fch,09fh,00ch,08eh,09eh,0fch,0feh,0ffh,07fh,07fh,05fh,0f7h,0f5h,06dh	; 99c4  ............_..m
	defb 092h,000h,001h,002h,00eh,01eh,03fh,01fh,002h,007h,007h,01fh,03bh,01eh,00dh,01ah	; 99d4  ......?.........
	defb 00ch,0ffh,003h,063h,0f4h,0f2h,0e2h,01ch,022h,001h,0c1h,0d1h,0f5h,06dh,0ffh,05fh	; 99e4  ...c...."....m._
	defb 0f2h,007h,00fh,01ch,078h,08ch,004h,0e7h,01fh,009h,008h,01ch,026h,01bh,00bh,016h	; 99f4  ....x.......&...
	defb 00ch,0f8h,0e0h,0f8h,060h,070h,0f8h,0fch,0feh,0feh,0beh,0eeh,0eah,0fah,05ch,02ch	; 9a04  ....`p........\,
	defb 012h,007h,008h,013h,077h,0f7h,0ffh,0f8h,010h,00eh,00fh,01fh,03bh,01eh,00dh,01ah	; 9a14  ....w...........
	defb 00ch,0f8h,018h,018h,0a0h,090h,038h,044h,002h,0a2h,0eah,05ah,03eh,09eh,06ch,034h	; 9a24  ......8D...Z>.l4
	defb 0ffh,01eh,007h,00fh,01ch,078h,08ch,004h,0e7h,01fh,009h,008h,01ch,026h,01bh,00bh	; 9a34  .....x.......&..
	defb 016h,00ch,0f8h,0e0h,0f8h,060h,07fh,0f8h,0ffh,0f9h,0feh,0f4h,0f8h,0f0h,09ch,062h	; 9a44  .....`.........b
	defb 01ch,000h,007h,008h,013h,077h,0f7h,0ffh,0f8h,010h,00eh,00fh,01fh,03bh,01eh,00dh	; 9a54  .....w..........
	defb 01ah,00ch,0f8h,018h,018h,0a0h,09fh,067h,08bh,087h,016h,04ch,038h,010h,0ech,07eh	; 9a64  .......g...L8..~
	defb 01ch,000h,008h,015h,01ah,00eh,00fh,01fh,02fh,07fh,05fh,0bfh,05eh,0bdh,04dh,03eh	; 9a74  ......../._.^.M>
	defb 00fh,03fh,080h,058h,0f5h,0bah,029h,0ceh,09ch,0f2h,0cah,097h,057h,0aah,0b3h,07ch	; 9a84  .?.X..).....W..|
	defb 0f0h,0e0h,008h,01dh,017h,00bh,00ah,01dh,032h,040h,062h,0c2h,065h,0fbh,04bh,031h	; 9a94  ........2@b.e.K1
	defb 030h,03fh,080h,0d8h,06dh,0f7h,0ffh,0f6h,06ch,03eh,07eh,07dh,0bdh,0dfh,0dfh,08ch	; 9aa4  0?..m...l>~}....
	defb 082h,010h,0e0h,000h	; 9ab4

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_8: patrones de sprite en RLE (p00:49CE), el registro
;   8 de juegos_de_sprites; lo leen p00:5609 (107 bytes)
;   0x9ab8..0x9b23  (107 bytes)
DATA_juegos_de_sprites_8:
	defb 002h,000h,08bh,01ch,03fh,063h,0cbh,0b5h,045h,007h,00ah,007h,003h,001h,005h,000h	; 9ab8  ....?c..E.......
	defb 08bh,01ch,07eh,0e3h,0e9h,056h,0d1h,0f0h,0a8h,0f0h,0e0h,040h,006h,000h,089h,01ch	; 9ac8  ..~..V.....@....
	defb 03fh,076h,042h,003h,003h,007h,003h,001h,007h,000h,089h,01ch,07eh,0b7h,0a1h,060h	; 9ad8  ?vB.........~..`
	defb 0e0h,0f0h,0e0h,040h,008h,000h,08bh,002h,007h,00dh,01fh,03ah,077h,06fh,067h,07ah	; 9ae8  ...@.......:wogz
	defb 039h,010h,005h,000h,08bh,020h,070h,0d8h,0fch,0aeh,0f7h,0fbh,0f3h,02fh,0ceh,004h	; 9af8  9.... p....../..
	defb 006h,000h,089h,002h,003h,00bh,017h,03bh,035h,03ah,031h,010h,007h,000h,08bh,020h	; 9b08  ........5:1....
	defb 060h,0e8h,0f4h,0eeh,056h,0aeh,0c6h,004h,000h,000h,000h	; 9b18  `...V......

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_7: patrones de sprite en RLE (p00:49CE), el registro
;   7 de juegos_de_sprites; lo leen p00:5609 (426 bytes)
;   0x9b23..0x9ccd  (426 bytes)
DATA_juegos_de_sprites_7:
	defb 008h,000h,088h,001h,007h,00dh,00fh,07fh,08fh,0eeh,0e9h,007h,000h,089h,00ch,0feh	; 9b23  ................
	defb 0e9h,085h,045h,045h,046h,084h,078h,008h,000h,088h,001h,006h,00bh,00ah,07ah,0fah	; 9b33  ..EEF.x.......z.
	defb 09bh,09fh,007h,000h,0adh,00ch,0f2h,01fh,0ffh,0fbh,0ffh,0feh,0fch,0f8h,0cfh,0eah	; 9b43  ................
	defb 0efh,0ebh,0e8h,0efh,0ech,0afh,04bh,031h,001h,000h,001h,003h,007h,003h,0ech,0cah	; 9b53  ......K1........
	defb 0f2h,024h,0fch,0fch,002h,0d2h,0fch,0c8h,078h,0c4h,0c4h,0cch,054h,0f8h,0ffh,09bh	; 9b63  .$......x...T...
	defb 09fh,09ch,003h,09fh,08ch,0ddh,07bh,031h,001h,000h,001h,002h,004h,003h,09ch,0feh	; 9b73  ......{1........
	defb 03eh,003h,0fch,08ah,0feh,07eh,0fch,078h,0f8h,0bch,0bch,07ch,0fch,0f8h,009h,000h	; 9b83  >....~.x...|....
	defb 087h,001h,007h,00dh,00fh,07fh,08fh,0eeh,008h,000h,088h,00ch,0feh,0e9h,085h,045h	; 9b93  ...............E
	defb 045h,046h,084h,009h,000h,087h,001h,006h,00bh,00ah,07ah,0fah,09bh,008h,000h,0adh	; 9ba3  EF........z.....
	defb 00ch,0f2h,01fh,0ffh,0fbh,0ffh,0feh,0fch,0e9h,0cfh,0eah,0efh,0ebh,0e8h,0efh,0ech	; 9bb3  ................
	defb 0afh,04fh,035h,07fh,03fh,014h,00ch,003h,078h,0ech,0cah,0f2h,024h,0fch,0fch,002h	; 9bc3  .O5.?...x...$...
	defb 0dah,0f6h,0f2h,0f5h,0dbh,0fah,0e6h,07ch,09fh,0ffh,09bh,09fh,09ch,003h,09fh,08ch	; 9bd3  .......|........
	defb 0ddh,07fh,037h,04fh,025h,01fh,00fh,003h,0f8h,09ch,0feh,03eh,003h,0fch,089h,0feh	; 9be3  ..7O%......>....
	defb 07eh,0feh,0deh,0efh,0d7h,0eeh,09eh,07ch,003h,000h,092h,003h,00fh,01bh,01eh,01eh	; 9bf3  ~......|........
	defb 01fh,03fh,04fh,0eah,07eh,00fh,037h,073h,000h,000h,018h,0fch,0d2h,003h,08ah,088h	; 9c03  .?O.~.7s........
	defb 00ch,0e8h,078h,054h,054h,0e8h,0fch,0c2h,003h,000h,083h,003h,00ch,017h,003h,015h	; 9c13  ..xTT...........
	defb 09fh,03fh,072h,09dh,07fh,00fh,03eh,04fh,000h,000h,018h,0e4h,03eh,0feh,0f6h,0feh	; 9c23  .?r...>O....>...
	defb 0fch,0f8h,098h,0bch,0fch,0f8h,07ch,0feh,0eeh,07dh,03fh,019h,019h,03ch,074h,03fh	; 9c33  ......|..}?..<t?
	defb 008h,000h,088h,024h,0feh,0f2h,035h,01bh,0fah,0e6h,07ch,008h,000h,088h,099h,053h	; 9c43  ...$..5...|....S
	defb 02fh,017h,01fh,037h,04fh,03fh,008h,000h,088h,0fch,0feh,0deh,02fh,017h,0eeh,09eh	; 9c53  /..7O?....../...
	defb 07ch,00eh,000h,084h,07fh,0beh,080h,07fh,009h,000h,08ah,060h,0b0h,070h,0feh,05dh	; 9c63  |..........`.p.]
	defb 05dh,0feh,070h,0b0h,060h,009h,000h,084h,07fh,0c1h,0ffh,07fh,009h,000h,08ah,060h	; 9c73  ].p.`..........`
	defb 0d0h,050h,0deh,0f3h,0f3h,0deh,050h,0d0h,060h,004h,000h,084h,00fh,017h,01fh,03fh	; 9c83  .P....P.`......?
	defb 004h,07fh,09ch,038h,01fh,007h,008h,007h,008h,006h,030h,0f8h,0fch,0f6h,0b6h,05ah	; 9c93  ...8......0....Z
	defb 02ah,02ch,048h,090h,060h,010h,0e0h,010h,0e0h,000h,000h,00fh,018h,01fh,020h,004h	; 9ca3  *,H.`......... .
	defb 055h,097h,027h,01fh,007h,008h,007h,008h,006h,030h,0c8h,024h,01ah,0cah,0feh,0feh	; 9cb3  U.'......0.$....
	defb 0fch,0f8h,0f0h,060h,010h,0e0h,010h,0e0h,000h,000h	; 9cc3  ...`......

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_4: patrones de sprite en RLE (p00:49CE), el registro
;   4 de juegos_de_sprites; lo leen p00:5609 (227 bytes)
;   0x9ccd..0x9db0  (227 bytes)
DATA_juegos_de_sprites_4:
	defb 082h,06dh,03eh,004h,00bh,084h,00dh,006h,003h,001h,006h,000h,092h,0dfh,06fh,046h	; 9ccd  .m>...........oF
	defb 046h,00fh,019h,0f4h,0efh,0c7h,0a3h,022h,01eh,00eh,004h,003h,000h,05bh,035h,004h	; 9cdd  F......".....[5.
	defb 00eh,084h,00bh,005h,002h,001h,006h,000h,0aah,0dfh,0feh,0fdh,0fdh,0f6h,0efh,01bh	; 9ced  ................
	defb 0f4h,07bh,0bch,03dh,011h,00bh,007h,003h,000h,0dch,0b9h,033h,073h,0cbh,0a9h,0a9h	; 9cfd  .{.=.......3s...
	defb 0e1h,093h,00fh,0c7h,0f9h,079h,003h,03eh,0fch,0f7h,0eeh,0d8h,0d8h,04ch,0ach,0ach	; 9d0d  .....y.>.....L..
	defb 0f8h,0b0h,000h,003h,080h,003h,000h,094h,0bfh,07eh,0fdh,0fdh,07dh,0feh,07eh,0beh	; 9d1d  .........~..}.~.
	defb 07ch,0f9h,03eh,006h,0c6h,0fdh,0c2h,0fch,039h,0f6h,0e8h,0e8h,003h,0f4h,083h,0c8h	; 9d2d  |.>.....9.......
	defb 0b0h,000h,003h,080h,003h,000h,086h,0cch,077h,019h,00eh,007h,001h,00ah,000h,096h	; 9d3d  ........w.......
	defb 077h,08fh,0c0h,0f0h,0ffh,0ffh,04fh,080h,09bh,0bbh,071h,040h,033h,00fh,000h,000h	; 9d4d  w.....O...q@3...
	defb 0bbh,06eh,017h,009h,006h,001h,00ah,000h,0a4h,0f7h,07fh,0bfh,0cfh,030h,0efh,070h	; 9d5d  .n...........0.p
	defb 0ffh,0eeh,0c4h,04eh,07fh,03ch,00fh,000h,000h,0ddh,033h,077h,0e7h,0afh,098h,00eh	; 9d6d  ...N.<....3w....
	defb 007h,003h,0c6h,0dch,078h,0e0h,080h,000h,000h,0beh,0dfh,0b6h,0b6h,003h,06ch,083h	; 9d7d  ....x.........l.
	defb 0cch,0f8h,070h,006h,000h,094h,0deh,0fdh,0bbh,07bh,0f7h,07fh,0f9h,0fch,0ffh,03ah	; 9d8d  ..p......{.....:
	defb 024h,098h,060h,080h,000h,000h,0b2h,0edh,0dah,0dah,003h,0b4h,083h,074h,088h,070h	; 9d9d  $.`..........t.p
	defb 006h,000h,000h	; 9dad

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_21: patrones de sprite en RLE (p00:49CE), el
;   registro 21 de juegos_de_sprites; lo leen p00:5609 (80 bytes)
;   0x9db0..0x9e00  (80 bytes)
DATA_juegos_de_sprites_21:
	defb 005h,000h,086h,001h,003h,007h,006h,007h,007h,00ah,000h,086h,080h,0c0h,0e0h,0e0h	; 9db0  ................
	defb 0c0h,080h,00ah,000h,087h,002h,007h,00eh,00fh,00fh,003h,003h,00ah,000h,086h,080h	; 9dc0  ................
	defb 040h,040h,0e0h,0c0h,080h,00ch,000h,088h,006h,004h,000h,03ch,06eh,003h,01fh,033h	; 9dd0  @@.........<n..3
	defb 009h,000h,087h,030h,040h,098h,0ach,066h,0f8h,0c4h,008h,000h,002h,006h,086h,000h	; 9de0  ...0@..f........
	defb 07ch,07fh,00fh,03fh,03bh,009h,000h,087h,030h,040h,098h,0bch,066h,0fah,0dch,000h	; 9df0  |..?....0@..f...

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_5: patrones de sprite en RLE (p00:49CE), el registro
;   5 de juegos_de_sprites; lo leen p00:5609 (309 bytes)
;   0x9e00..0x9f35  (309 bytes)
DATA_juegos_de_sprites_5:
	defb 0cdh,019h,026h,05ch,05ch,028h,067h,0efh,0dbh,08dh,055h,0bfh,0a7h,09fh,04fh,04fh	; 9e00  ..&\\(g...U...OO
	defb 02fh,098h,064h,03ah,03ah,014h,0e6h,0f7h,0dbh,0b1h,0aah,0fdh,0e5h,0f9h,0f2h,0f2h	; 9e10  /.d::...........
	defb 0f4h,019h,03fh,063h,06bh,037h,058h,0b0h,0bch,0f2h,06ah,0e4h,0f8h,0e0h,070h,070h	; 9e20  ..?ck7X...j...pp
	defb 038h,098h,0fch,0c6h,0d6h,0ech,01ah,00dh,03dh,04fh,056h,027h,01fh,007h,00eh,00eh	; 9e30  8.......=OV'....
	defb 01ch,067h,062h,0c4h,0c8h,0d0h,068h,068h,036h,011h,079h,0e6h,0f8h,040h,003h,000h	; 9e40  .gb...hh6.y..@..
	defb 08dh,0e6h,046h,023h,013h,00bh,016h,016h,06ch,088h,09eh,067h,01fh,002h,003h,000h	; 9e50  ..F#....l..g....
	defb 08dh,05fh,05eh,0bch,0b8h,0b0h,058h,058h,02eh,01fh,077h,09eh,0b8h,040h,003h,000h	; 9e60  ._^...XX..w..@..
	defb 08dh,0fah,07ah,03dh,01dh,00dh,01ah,01ah,074h,0f8h,0eeh,079h,01dh,002h,008h,000h	; 9e70  ..z=....t..y....
	defb 093h,00eh,01dh,039h,032h,032h,026h,02eh,01dh,019h,064h,0ffh,019h,026h,05ch,05ch	; 9e80  ...922&...d..&\\
	defb 069h,087h,03fh,07fh,004h,0ffh,084h,07eh,01fh,0c0h,0bfh,005h,000h,093h,00eh,013h	; 9e90  i.?....~........
	defb 027h,02fh,02fh,03fh,03bh,01bh,01fh,07fh,0aah,019h,03fh,063h,06bh,077h,0feh,0f8h	; 9ea0  '//?......?ckw..
	defb 080h,004h,000h,084h,081h,0e0h,0ffh,0bfh,003h,000h,092h,001h,002h,00eh,01dh,03dh	; 9eb0  ...............=
	defb 035h,035h,025h,02ch,01eh,019h,064h,0ffh,01dh,07eh,08fh,03fh,07fh,005h,0ffh,086h	; 9ec0  55%,..d..~.?....
	defb 0feh,0ffh,07fh,01fh,0c0h,0bfh,003h,000h,092h,001h,003h,00fh,012h,026h,02eh,02eh	; 9ed0  .............&..
	defb 03eh,03fh,01bh,01fh,07fh,0aah,01dh,06bh,0f0h,0c0h,080h,005h,000h,0c6h,001h,000h	; 9ee0  >?.....k........
	defb 080h,0e0h,0ffh,0bfh,001h,006h,00ch,00bh,01ah,024h,024h,014h,000h,004h,005h,029h	; 9ef0  .........$$....)
	defb 029h,02ah,015h,000h,0e0h,000h,0f0h,002h,055h,0b2h,0a0h,040h,004h,021h,020h,0a8h	; 9f00  )*......U..@.! .
	defb 032h,00ch,0a0h,050h,000h,001h,003h,007h,076h,06ch,06ch,03ch,000h,00ch,01fh,01bh	; 9f10  2..P....vll<....
	defb 01bh,019h,00ch,000h,000h,0f0h,0f0h,001h,033h,076h,070h,0c0h,00ch,061h,061h,0e8h	; 9f20  ........3vp..aa.
	defb 0fah,0feh,05ch,020h,000h	; 9f30

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_22: patrones de sprite en RLE (p00:49CE), el
;   registro 22 de juegos_de_sprites; lo leen p00:5609 (125 bytes)
;   0x9f35..0x9fb2  (125 bytes)
DATA_juegos_de_sprites_22:
	defb 003h,000h,08dh,00ch,01fh,03eh,03eh,04ch,080h,07ch,081h,061h,01fh,01eh,03dh,016h	; 9f35  .....>>L.|.a..=.
	defb 005h,000h,08bh,0e0h,078h,01ch,066h,062h,09bh,0b9h,031h,0f9h,0e2h,0fch,003h,000h	; 9f45  ....x.fb..1.....
	defb 08dh,00ch,013h,021h,029h,073h,0ffh,07fh,0ffh,07fh,01eh,01dh,02bh,016h,005h,000h	; 9f55  ...!)s......+...
	defb 098h,0e0h,098h,0e4h,0fah,09eh,07dh,067h,0efh,0f7h,01eh,0fch,00dh,01eh,03eh,03eh	; 9f65  ......}g......>>
	defb 04ch,081h,07dh,019h,027h,01fh,00bh,005h,002h,003h,000h,09dh,0e0h,0f8h,01ch,066h	; 9f75  L.}.'..........f
	defb 062h,08bh,099h,0b1h,071h,062h,07ah,0d9h,0adh,052h,0fch,078h,00dh,013h,021h,029h	; 9f85  b...qbz..R.x..!)
	defb 073h,0ffh,07fh,01fh,03eh,01eh,00eh,007h,002h,003h,000h,090h,0e0h,018h,0e4h,0fah	; 9f95  s...>...........
	defb 09eh,07dh,067h,06fh,0efh,0feh,0f6h,057h,0bbh,07eh,0a4h,078h,000h	; 9fa5  .}go...W.~.x.

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_9: patrones de sprite en RLE (p00:49CE), el registro
;   9 de juegos_de_sprites (sigue en el banco 9, en 0xA000); lo leen p00:5609
;   (78 bytes)
;   0x9fb2..0xa000  (78 bytes)
DATA_juegos_de_sprites_9:
	defb 003h,000h,08dh,003h,00fh,01dh,03ah,050h,076h,02fh,02ch,070h,0c1h,06eh,0f0h,0d1h	; 9fb2  ......:Pv/,p.n..
	defb 003h,000h,08dh,0e0h,0b0h,0d8h,038h,008h,098h,010h,010h,030h,0ech,03eh,0d6h,0b9h	; 9fc2  ......8....0.>..
	defb 003h,000h,08dh,003h,00ch,012h,025h,06fh,04fh,038h,03bh,04fh,0bfh,05eh,090h,0b1h	; 9fd2  ......%oO8.O.^..
	defb 003h,000h,086h,0e0h,050h,028h,0c8h,0f8h,068h,003h,0f0h,091h,0fch,032h,0fah,0ffh	; 9fe2  ....P(..h....2..
	defb 0c7h,06eh,0f7h,0dbh,07dh,01ch,00ah,005h,002h,00fh,07eh,0cdh,070h,003h	; 9ff2  .n..}.....~.p.
