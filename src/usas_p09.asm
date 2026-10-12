; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 09 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_9_cola: patrones de sprite en RLE (p00:49CE), el
;   registro 9 de juegos_de_sprites (sigue del banco 8); lo leen p00:5609 (48
;   bytes)
;   0xa000..0xa030  (48 bytes)
DATA_juegos_de_sprites_9_cola:
	defb 000h,08ch,0bah,0fdh,0edh,0f9h,0bfh,06eh,0dah,026h,0fch,070h,0a0h,040h,004h,000h	; a000  .......n.&.p.@..
	defb 08dh,0c4h,06dh,09fh,0b7h,06bh,017h,00fh,007h,003h,00ch,073h,0bdh,070h,003h,000h	; a010  ..m..k.....s.p..
	defb 085h,0f6h,0fbh,01fh,0e7h,0ffh,003h,0feh,084h,0fch,0f0h,0e0h,040h,004h,000h,000h	; a020  ............@...

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_0: patrones de sprite en RLE (p00:49CE), el registro
;   0 de juegos_de_sprites; lo leen p00:5609 (259 bytes)
;   0xa030..0xa133  (259 bytes)
DATA_juegos_de_sprites_0:
	defb 0e8h,010h,009h,00fh,0d7h,030h,047h,06ch,02fh,02dh,06fh,066h,0a1h,0fbh,07eh,079h	; a030  .....0Gl/-of..~y
	defb 03eh,0e0h,000h,0dch,0a0h,034h,01ah,09ah,018h,088h,008h,010h,0e0h,030h,06ch,0aeh	; a040  >....4.......0l.
	defb 059h,010h,009h,00fh,0d8h,02fh,07fh,05bh,03fh,036h,059h,07fh,0dfh,0afh,07fh,057h	; a050  Y..../.[?6Y....W
	defb 03eh,0e0h,000h,0dch,060h,0d4h,0eah,0eah,0e8h,0f8h,0f8h,0f0h,0e0h,0f0h,0fch,0bah	; a060  >...`...........
	defb 077h,000h,031h,06bh,0d6h,0efh,0a5h,043h,006h,00ch,00dh,00dh,005h,03ch,070h,03fh	; a070  w.1k...C.....<p?
	defb 000h,04dh,099h,0fah,0b4h,0cch,0f2h,0e2h,0e4h,0e8h,066h,031h,01dh,09dh,0b2h,01ch	; a080  .M........f1....
	defb 000h,000h,031h,05ah,0bdh,0adh,0e7h,043h,005h,003h,00bh,0ffh,007h,03fh,04fh,03fh	; a090  ..1Z...C.....?O?
	defb 000h,07bh,0f7h,076h,0cch,0fch,0feh,0feh,0fch,0d8h,05eh,02fh,01fh,09bh,0aeh,01ch	; a0a0  .{.v......^/....
	defb 000h,000h,00ch,01bh,035h,037h,02bh,011h,001h,002h,005h,005h,002h,001h,00fh,01fh	; a0b0  ....57+.........
	defb 00fh,04dh,0edh,0fdh,081h,0b2h,07ch,0f2h,042h,084h,098h,0b0h,0d0h,0e8h,0c4h,018h	; a0c0  .M....|.B.......
	defb 0e0h,000h,00ch,017h,02fh,02fh,03bh,011h,001h,003h,007h,007h,003h,001h,00fh,014h	; a0d0  ....//..........
	defb 00fh,07bh,0ffh,093h,07fh,07eh,0fch,0feh,0feh,0fch,078h,070h,0b0h,0d8h,0bch,0f8h	; a0e0  .{...~....xp....
	defb 0e0h,000h,031h,06bh,0d6h,0efh,0a5h,047h,003h,003h,001h,031h,07fh,07ah,03ch,003h	; a0f0  ..1k...G...1.z<.
	defb 000h,04dh,099h,0fah,0b2h,0c6h,0feh,0f2h,084h,038h,03eh,051h,04dh,079h,076h,098h	; a100  .M.......8>QMyv.
	defb 000h,000h,031h,05ah,0bdh,0adh,0e7h,047h,003h,002h,001h,08ah,031h,04eh,075h,03fh	; a110  ..1Z...G....1Nu?
	defb 003h,000h,07bh,0f7h,076h,0ceh,003h,0feh,089h,07ch,0f8h,0feh,0dfh,0cfh,0ffh,0eeh	; a120  ..{.v....|......
	defb 098h,000h,000h	; a130

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_10: patrones de sprite en RLE (p00:49CE), el
;   registro 10 de juegos_de_sprites; lo leen p00:5609 (257 bytes)
;   0xa133..0xa234  (257 bytes)
DATA_juegos_de_sprites_10:
	defb 0bbh,000h,007h,018h,023h,04fh,07ch,070h,060h,06fh,077h,070h,040h,067h,069h,06dh	; a133  ....#O|p`owp@gim
	defb 067h,000h,0c0h,030h,0f8h,0fch,03eh,072h,0cdh,0ddh,0b9h,079h,019h,019h,099h,08ah	; a143  g..0..>r...y....
	defb 00eh,000h,007h,01fh,03ch,073h,04ch,050h,060h,06fh,078h,06fh,07fh,059h,076h,076h	; a153  ....<sLP`oxo.Yvv
	defb 059h,000h,0c0h,0f0h,008h,0fch,032h,04eh,0bfh,0ffh,07fh,09fh,003h,0efh,002h,0feh	; a163  Y.....2N........
	defb 0b7h,066h,0a1h,0eah,075h,07fh,074h,0fch,0ech,0beh,0eeh,076h,063h,061h,007h,00eh	; a173  .f..u.t....vca..
	defb 007h,03dh,0ffh,077h,0feh,04eh,03fh,01dh,01ah,00ah,002h,002h,084h,0c4h,048h,010h	; a183  .=.w.N?.......H.
	defb 0e0h,07fh,0dfh,0bfh,05fh,07fh,07fh,0fbh,09bh,0fdh,09dh,075h,062h,061h,006h,009h	; a193  ...._......uba..
	defb 007h,0f3h,0c9h,0edh,0dah,0feh,0ffh,0ffh,004h,0feh,0beh,07ch,0bch,0f8h,0f0h,0e0h	; a1a3  ...........|....
	defb 007h,018h,023h,04fh,07ch,070h,06fh,077h,070h,040h,067h,069h,06dh,067h,066h,0a1h	; a1b3  ..#O|powp@gimgf.
	defb 0c0h,030h,0f8h,0f8h,00ch,03eh,0f2h,0adh,03dh,019h,019h,099h,089h,089h,00ah,0fah	; a1c3  .0...>..=.......
	defb 007h,01fh,03ch,073h,04ch,050h,06fh,078h,06fh,07fh,059h,076h,076h,059h,07fh,0dfh	; a1d3  ..<sLPoxo.YvvY..
	defb 0c0h,0f0h,008h,0f8h,00ch,032h,0ceh,07fh,0dfh,003h,0efh,002h,0ffh,002h,0feh,0b8h	; a1e3  .....2..........
	defb 0ebh,07fh,07eh,075h,07fh,076h,0eeh,0beh,0efh,076h,066h,063h,061h,007h,00eh,007h	; a1f3  ..~u.v...vfca...
	defb 0d2h,0beh,07eh,0f1h,0c1h,09ah,0feh,0deh,08ah,002h,002h,084h,0c4h,048h,010h,0e0h	; a203  ..~..........H..
	defb 0bfh,07fh,07fh,05fh,07fh,07fh,09dh,0fbh,09fh,075h,065h,062h,061h,006h,009h,007h	; a213  ..._.....ueba...
	defb 0feh,0feh,0f2h,0cfh,0bfh,0feh,07eh,07eh,003h,0feh,085h,07ch,0bch,0f8h,0f0h,0e0h	; a223  ......~~...|....
	defb 000h	; a233

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_42: patrones de sprite en RLE (p00:49CE), el
;   registro 42 de juegos_de_sprites; lo leen p00:5609 (55 bytes)
;   0xa234..0xa26b  (55 bytes)
DATA_juegos_de_sprites_42:
	defb 004h,000h,086h,006h,00fh,019h,025h,01fh,010h,004h,00fh,081h,007h,005h,000h,08bh	; a234  ......%.........
	defb 030h,078h,0cch,0fah,0fch,004h,0f8h,0d8h,0d8h,038h,0f0h,005h,000h,084h,006h,009h	; a244  0x.......8......
	defb 01fh,03ah,006h,01fh,082h,00fh,007h,004h,000h,084h,030h,048h,0fch,006h,003h,0fch	; a254  .:........0H....
	defb 002h,0ech,083h,0dch,0f8h,0f0h,000h	; a264

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_11: patrones de sprite en RLE (p00:49CE), el
;   registro 11 de juegos_de_sprites; lo leen p00:5609 (256 bytes)
;   0xa26b..0xa36b  (256 bytes)
DATA_juegos_de_sprites_11:
	defb 0d6h,007h,01bh,02fh,05eh,07fh,0b3h,0b7h,07fh,03fh,03fh,07fh,03eh,07dh,0dfh,06dh	; a26b  .../^....??.>}.m
	defb 017h,0e0h,0b0h,078h,098h,0c8h,0dch,0bch,0dch,0f8h,0d8h,068h,0f0h,0f0h,0aeh,057h	; a27b  ...x.......h...W
	defb 0ffh,007h,01ch,030h,061h,040h,0cch,0c8h,046h,028h,028h,041h,021h,043h,0bfh,06eh	; a28b  ...0a@..F((A!C.n
	defb 019h,0e0h,070h,098h,068h,038h,034h,064h,024h,008h,068h,0b8h,0b0h,0b0h,07eh,0fbh	; a29b  ..p.h84d$.h...~.
	defb 0f1h,071h,001h,03bh,077h,0efh,0f2h,071h,030h,069h,069h,0c5h,07bh,002h,001h,002h	; a2ab  .q..w..q0ii.{...
	defb 007h,0ech,0f2h,0f2h,072h,0e6h,03fh,003h,0ffh,09ch,0feh,0fch,0fch,0eeh,0e8h,0ech	; a2bb  ....r.?.........
	defb 0f8h,071h,001h,03ah,04ch,0beh,0b3h,051h,030h,059h,059h,0bdh,07bh,002h,001h,003h	; a2cb  .q.:L..Q0YY.{...
	defb 005h,094h,0ceh,0feh,0ceh,01eh,004h,0ffh,0deh,0feh,0fch,0fch,0feh,0f8h,014h,0f8h	; a2db  ................
	defb 000h,007h,01bh,02fh,05eh,07fh,0b3h,0b7h,07fh,03fh,03fh,07fh,03eh,07dh,0dfh,06dh	; a2eb  .../^....??.>}.m
	defb 000h,0e0h,0b0h,078h,098h,0c8h,0dch,0bch,0dch,0f8h,0d8h,068h,0f0h,0f0h,0aeh,057h	; a2fb  ...x.......h...W
	defb 000h,007h,01ch,030h,061h,040h,0cch,0c8h,046h,028h,028h,041h,021h,043h,0bfh,06eh	; a30b  ...0a@..F((A!C.n
	defb 000h,0e0h,070h,098h,068h,038h,034h,064h,024h,008h,068h,0b8h,0b0h,0b0h,07eh,0fbh	; a31b  ..p.h84d$.h...~.
	defb 0bfh,079h,077h,0efh,0feh,077h,034h,06bh,06bh,0c7h,07bh,003h,003h,03ch,05eh,0ffh	; a32b  .yw..w4kk.{..<^.
	defb 0f8h,0ech,0f4h,0f4h,0e6h,0ceh,07fh,003h,0ffh,09ch,0feh,0ffh,07ah,089h,0b1h,046h	; a33b  ............z..F
	defb 0cfh,079h,04fh,0bdh,0b9h,054h,037h,05bh,05bh,0bfh,07bh,002h,002h,03fh,061h,0bfh	; a34b  .yO..T7[[.{..?a.
	defb 088h,09ch,0cch,0ech,09eh,03eh,004h,0ffh,086h,0feh,0ffh,0feh,08fh,0bfh,07eh,000h	; a35b  .....>........~.

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_39: patrones de sprite en RLE (p00:49CE), el
;   registro 39 de juegos_de_sprites; lo leen p00:5609 (146 bytes)
;   0xa36b..0xa3fd  (146 bytes)
DATA_juegos_de_sprites_39:
	defb 006h,000h,085h,001h,003h,00fh,003h,001h,00ch,000h,083h,080h,0e0h,080h,009h,000h	; a36b  ................
	defb 003h,001h,085h,002h,00ch,0b0h,00ch,002h,003h,001h,008h,000h,085h,080h,060h,01ah	; a37b  ..............`.
	defb 060h,080h,005h,000h,0a0h,040h,000h,010h,04ah,024h,008h,019h,0b2h,010h,004h,020h	; a38b  `....@..J$.....
	defb 024h,016h,029h,050h,080h,081h,082h,014h,0c4h,021h,0dch,0eah,021h,001h,00ch,082h	; a39b  $.)P.....!..!...
	defb 010h,00ah,0d8h,022h,011h,003h,000h,088h,001h,002h,000h,004h,001h,00ah,018h,003h	; a3ab  ..."............
	defb 008h,000h,08ah,018h,000h,000h,010h,0c8h,0b0h,020h,010h,0a0h,070h,007h,000h,088h	; a3bb  ......... ..p...
	defb 008h,001h,001h,00ch,010h,000h,001h,008h,008h,000h,086h,0c0h,080h,000h,000h,008h	; a3cb  ................
	defb 080h,008h,000h,09bh,008h,000h,024h,00ch,000h,001h,00eh,00ch,020h,004h,00ch,080h	; a3db  ......$..... ...
	defb 000h,002h,000h,008h,040h,000h,000h,060h,0e9h,0c0h,024h,04ch,0e0h,0c0h,010h,003h	; a3eb  ....@..`..$L....
	defb 000h,000h	; a3fb

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_40: patrones de sprite en RLE (p00:49CE), el
;   registro 40 de juegos_de_sprites; lo leen p00:5609 (50 bytes)
;   0xa3fd..0xa42f  (50 bytes)
DATA_juegos_de_sprites_40:
	defb 003h,000h,08ah,003h,00ch,008h,013h,011h,011h,013h,009h,00ch,003h,006h,000h,083h	; a3fd  ................
	defb 0c0h,030h,010h,004h,0c8h,083h,090h,030h,0c0h,007h,000h,088h,003h,007h,00ch,00eh	; a40d  .0.....0........
	defb 00eh,00ch,007h,003h,008h,000h,088h,0c0h,0e0h,030h,070h,070h,030h,0e0h,0c0h,004h	; a41d  .........0pp0...
	defb 000h,000h	; a42d

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_29: patrones de sprite en RLE (p00:49CE), el
;   registro 29 de juegos_de_sprites; lo leen p00:5609 (255 bytes)
;   0xa42f..0xa52e  (255 bytes)
DATA_juegos_de_sprites_29:
	defb 004h,000h,09ch,001h,01fh,015h,034h,03eh,07dh,07ah,028h,074h,05ch,073h,038h,000h	; a42f  ......4>}z(t\s8.
	defb 000h,05fh,0fdh,0f9h,054h,062h,08eh,06fh,09fh,0cfh,0f7h,03fh,00fh,0c7h,077h,004h	; a43f  ._..Tb.o...?..w.
	defb 000h,0a9h,001h,017h,01fh,02fh,02fh,06eh,027h,077h,05fh,07bh,02dh,057h,000h,000h	; a44f  .....//n'w_{-W..
	defb 055h,0afh,06fh,0ffh,0bdh,0f1h,0d0h,060h,030h,008h,0c0h,0f0h,0f8h,0f8h,058h,05dh	; a45f  U.o....`0.....X]
	defb 033h,03bh,071h,039h,013h,00ch,00ch,000h,000h,003h,001h,003h,000h,09dh,0b9h,0c8h	; a46f  3.q9............
	defb 07eh,0b7h,09bh,0eeh,0fdh,0fbh,0ffh,07eh,0ffh,03fh,02fh,0c4h,038h,00fh,07fh,066h	; a47f  ~......~.?/.8..f
	defb 03ch,02ch,05fh,02eh,01eh,013h,00bh,007h,003h,003h,001h,003h,000h,090h,07eh,03fh	; a48f  <,_...........~?
	defb 08dh,0cch,0e4h,0f1h,0fbh,0ffh,03fh,0bfh,0bfh,0c6h,0f4h,0fbh,03fh,00fh,003h,000h	; a49f  ......?.....?...
	defb 09dh,001h,003h,017h,03dh,02ah,07ah,071h,05ah,028h,024h,054h,06bh,070h,000h,000h	; a4af  ....=*zqZ($Tkp..
	defb 07eh,0eah,0f1h,0b6h,06eh,01fh,05fh,09fh,0cfh,0ffh,03fh,03fh,0cfh,0f7h,003h,000h	; a4bf  ~...n._...??....
	defb 0aah,001h,002h,015h,02fh,03fh,05dh,05eh,06fh,037h,03fh,07bh,07dh,03fh,000h,000h	; a4cf  ..../?]^o7?{}?..
	defb 05ah,0aeh,0bfh,0fdh,0b1h,0e0h,0e0h,060h,030h,000h,0c0h,0c0h,0f0h,0f8h,070h,05dh	; a4df  Z......`0.....p]
	defb 053h,02bh,033h,033h,019h,00eh,005h,000h,000h,003h,001h,003h,000h,09dh,059h,049h	; a4ef  S+33..........YI
	defb 0beh,0e7h,09bh,07fh,026h,03dh,0bbh,0c6h,0c5h,043h,003h,0c5h,038h,00fh,05fh,06eh	; a4ff  ....&=...C..8._n
	defb 06ch,03ch,02ch,01ch,00ah,003h,00ah,007h,003h,003h,001h,003h,000h,090h,0eeh,0feh	; a50f  l<,.............
	defb 07dh,01ch,064h,0e0h,0f9h,0fbh,07fh,03fh,03eh,0fch,0fch,0feh,03fh,00fh,000h	; a51f  }.d....?>...?..

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_30: patrones de sprite en RLE (p00:49CE), el
;   registro 30 de juegos_de_sprites; lo leen p00:5609 (246 bytes)
;   0xa52e..0xa624  (246 bytes)
DATA_juegos_de_sprites_30:
	defb 003h,000h,09dh,009h,01dh,01eh,01dh,00fh,027h,07ah,07eh,05dh,02eh,01ah,011h,010h	; a52e  ........'z~]....
	defb 000h,000h,08fh,0ffh,0f8h,0e3h,047h,01fh,00fh,003h,003h,001h,04ch,08ch,0c6h,0f8h	; a53e  ......G.....L...
	defb 003h,000h,096h,009h,015h,017h,013h,009h,026h,05dh,05dh,067h,03dh,01dh,01eh,01fh	; a54e  ........&]]g=...
	defb 000h,000h,08fh,070h,0c7h,01eh,0beh,0e0h,0fch,003h,0feh,089h,0bbh,0fbh,0bdh,0c7h	; a55e  ...p............
	defb 013h,00ah,00dh,00fh,005h,003h,003h,002h,001h,006h,000h,095h,0fch,0ffh,0fdh,0deh	; a56e  ................
	defb 0e2h,0e0h,030h,0bfh,0bdh,0f7h,0f7h,0ddh,05ah,021h,000h,000h,01fh,00fh,00eh,00ch	; a57e  ..0.....Z!......
	defb 007h,003h,002h,002h,001h,006h,000h,08eh,0fbh,0cch,06eh,03fh,09fh,05fh,0efh,07ah	; a58e  ..........n?._.z
	defb 06fh,02dh,0afh,0b7h,07bh,021h,004h,000h,0cah,009h,01ch,01dh,01ah,00fh,02bh,067h	; a59e  o-..{!........+g
	defb 07ah,05ah,02ch,02dh,01ah,012h,011h,000h,09fh,0e7h,03dh,0e8h,0e3h,003h,007h,01fh	; a5ae  zZ,-......=.....
	defb 00fh,083h,003h,041h,00ch,08ch,0c6h,000h,000h,009h,014h,015h,017h,009h,02dh,046h	; a5be  ...A..........-F
	defb 05dh,06dh,037h,03fh,01dh,01dh,01eh,000h,09fh,078h,0e2h,0d7h,01eh,0feh,0fch,0e0h	; a5ce  ]m7?.....x......
	defb 0fch,07eh,0feh,0beh,0fbh,0fbh,0bdh,009h,00ah,006h,004h,005h,006h,005h,003h,003h	; a5de  .~..............
	defb 002h,001h,001h,004h,000h,09ch,0e0h,0fch,0fbh,0fdh,0fch,05eh,082h,060h,0f9h,0bah	; a5ee  ...........^.`..
	defb 0bdh,0f7h,0feh,0d8h,050h,030h,00fh,00fh,007h,007h,006h,005h,007h,002h,002h,003h	; a5fe  ....P0..........
	defb 001h,001h,004h,000h,090h,0dfh,0e3h,0fch,0ceh,04fh,0bfh,0ffh,0dfh,066h,07fh,06fh	; a60e  .........O...f.o
	defb 02dh,0b6h,0b8h,070h,030h,000h	; a61e

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_31: patrones de sprite en RLE (p00:49CE), el
;   registro 31 de juegos_de_sprites; lo leen p00:5609 (570 bytes)
;   0xa624..0xa85e  (570 bytes)
DATA_juegos_de_sprites_31:
	defb 003h,000h,09dh,001h,003h,007h,00eh,00ch,01ah,019h,013h,008h,008h,006h,003h,001h	; a624  ................
	defb 043h,0f7h,0ffh,0edh,0fdh,070h,0a1h,0a0h,0b6h,0fdh,0f8h,0f3h,020h,023h,0c0h,003h	; a634  C....p...... #..
	defb 003h,000h,0adh,001h,002h,007h,00dh,00bh,017h,017h,01ch,00fh,00fh,007h,003h,001h	; a644  ................
	defb 042h,0b6h,099h,0d2h,062h,0efh,0beh,09fh,08fh,07ah,027h,00ch,0dfh,0dch,0bfh,0fch	; a654  B...b....z'.....
	defb 084h,0deh,0feh,06ch,038h,01ch,00dh,00fh,05eh,07fh,03fh,003h,008h,00ch,016h,00fh	; a664  ...l8...^.?.....
	defb 006h,000h,09ah,080h,0c0h,060h,0a0h,0e0h,0d0h,0b0h,010h,0e0h,0e0h,084h,0dah,032h	; a674  .....`.........2
	defb 094h,0c8h,0ech,0fdh,0f6h,0e7h,0bfh,0c8h,0fch,0f7h,0f3h,0e9h,0f3h,006h,000h,08bh	; a684  ................
	defb 080h,040h,0a0h,0e0h,0e0h,030h,050h,0f0h,0e0h,0e0h,001h,003h,002h,002h,001h,005h	; a694  .@...0P.........
	defb 003h,081h,001h,004h,000h,091h,080h,003h,000h,083h,000h,0e1h,0d0h,0d6h,083h,006h	; a6a4  ................
	defb 086h,0c3h,0f5h,0d3h,046h,038h,001h,003h,003h,002h,001h,081h,003h,003h,002h,082h	; a6b4  ....F8..........
	defb 003h,001h,004h,000h,0a9h,07fh,0fch,0ffh,07ch,0ffh,09eh,02fh,03fh,07fh,0feh,07eh	; a6c4  ........|../?..~
	defb 0bfh,0ffh,0bfh,07eh,038h,006h,08fh,006h,080h,000h,0d3h,01ch,0d2h,011h,0b8h,088h	; a6d4  ...~8...........
	defb 05ch,024h,016h,009h,007h,0f0h,0f0h,030h,060h,060h,0a0h,040h,060h,0c0h,007h,000h	; a6e4  \$.....0``.@`...
	defb 099h,0fbh,070h,0f9h,07fh,0ffh,03fh,0ffh,033h,0f1h,0c8h,0f8h,064h,03ch,01ah,00fh	; a6f4  ..p...?.3...d<..
	defb 007h,010h,010h,0d0h,0a0h,0e0h,0e0h,0c0h,0a0h,0c0h,00eh,000h,099h,001h,002h,005h	; a704  ................
	defb 007h,006h,004h,003h,002h,007h,000h,000h,001h,061h,07bh,05fh,024h,0fdh,0fbh,0fdh	; a714  .........a{_$...
	defb 07bh,0b6h,034h,099h,0cfh,083h,007h,000h,0a9h,001h,003h,006h,004h,005h,007h,003h	; a724  {.4.............
	defb 003h,006h,000h,000h,001h,061h,05bh,06ch,03bh,0f2h,04ch,027h,0efh,0ffh,0ebh,077h	; a734  .....a[l..L'...w
	defb 03ch,07fh,000h,080h,0c0h,0c3h,0e7h,07dh,02ah,0dch,06fh,03fh,07ch,06ch,032h,0ceh	; a744  <......}*.o?|l2.
	defb 0b9h,0e0h,008h,000h,098h,080h,0c0h,0e0h,060h,0a0h,0c0h,0c0h,0e0h,000h,080h,040h	; a754  ........`......@
	defb 043h,0e5h,09bh,0d6h,024h,09fh,0f0h,0cbh,0dfh,0ffh,0f5h,05eh,0ffh,008h,000h,088h	; a764  C...$......^....
	defb 080h,040h,020h,0a0h,060h,0c0h,040h,060h,005h,000h,09bh,030h,07eh,05fh,02fh,012h	; a774  .@ .`.@`...0~_/.
	defb 011h,00dh,005h,003h,002h,007h,001h,003h,0c3h,0f7h,0beh,048h,03bh,0b6h,068h,0d2h	; a784  ...........H..h.
	defb 07ah,0e0h,034h,05fh,0c6h,083h,005h,000h,0abh,030h,04eh,075h,038h,01dh,01eh,00eh	; a794  z.4_.....0Nu8...
	defb 006h,003h,003h,006h,001h,002h,0c2h,0b7h,0d9h,077h,024h,0a9h,0f7h,06fh,0c7h,05fh	; a7a4  .........w$..o._
	defb 0efh,0bbh,03dh,07fh,000h,080h,086h,0deh,0fah,024h,0b8h,0d9h,02fh,097h,0bdh,00ch	; a7b4  ..=......$../...
	defb 058h,0f1h,0c1h,080h,005h,000h,09bh,00ch,07eh,0fah,0d4h,008h,008h,0b0h,020h,0c0h	; a7c4  X.......~..... .
	defb 0c0h,0e0h,000h,080h,086h,0dah,036h,0dch,048h,029h,0deh,0ech,0c6h,0f7h,0efh,0beh	; a7d4  ......6.H)......
	defb 07eh,0ffh,005h,000h,096h,00ch,072h,0aeh,03ch,0f8h,0f8h,070h,0e0h,0c0h,040h,060h	; a7e4  ~.....r.<..p..@`
	defb 005h,005h,00eh,01fh,063h,0f0h,0f8h,058h,042h,023h,01ch,005h,000h,08ah,080h,000h	; a7f4  ....c..XB#......
	defb 080h,000h,000h,041h,001h,018h,076h,08fh,006h,000h,002h,006h,089h,00fh,011h,07ch	; a804  ...A..v........|
	defb 09fh,08fh,067h,07fh,03fh,01ch,005h,000h,08ah,07fh,0ffh,07fh,0ffh,0ffh,0bfh,0feh	; a814  ..g.?...........
	defb 0e7h,0f9h,08fh,008h,000h,088h,001h,000h,000h,080h,082h,00ch,03eh,0f1h,006h,000h	; a824  ............>...
	defb 08bh,0ffh,0ebh,07ah,0fch,0c6h,00fh,01fh,01ah,042h,0c4h,038h,005h,000h,002h,0ffh	; a834  ...z.....B.8....
	defb 081h,0feh,003h,0ffh,084h,07dh,0f3h,0cfh,0f1h,006h,000h,08bh,03dh,037h,0feh,08ch	; a844  .....}......=7..
	defb 03eh,0f9h,0f1h,0e6h,0feh,0fch,038h,005h,000h,000h	; a854  >.....8...

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_32: patrones de sprite en RLE (p00:49CE), el
;   registro 32 de juegos_de_sprites; lo leen p00:5609 (186 bytes)
;   0xa85e..0xa918  (186 bytes)
DATA_juegos_de_sprites_32:
	defb 0c0h,003h,001h,000h,003h,01fh,03eh,07ch,071h,0d2h,0cfh,041h,020h,01ch,003h,000h	; a85e  ......>|q..A ...
	defb 000h,0f8h,033h,097h,0bfh,056h,078h,0f2h,0fah,0ddh,056h,09fh,06dh,0bdh,0b3h,0cdh	; a86e  ..3..Vx...V.m...
	defb 0a1h,002h,001h,000h,003h,01ch,021h,043h,04fh,0afh,0bch,07fh,03fh,01fh,003h,000h	; a87e  ......!CO...?...
	defb 000h,068h,0d3h,0f4h,078h,0f9h,0f7h,0ffh,097h,03ah,0bdh,0fbh,0dbh,0ceh,0cfh,0f3h	; a88e  .h..x....:......
	defb 0ffh,007h,000h,099h,003h,00fh,03ch,061h,0f8h,0fdh,0d7h,06eh,038h,003h,027h,07fh	; a89e  ......<a...n8.'.
	defb 056h,038h,072h,0dah,07dh,0deh,057h,09eh,06fh,07dh,053h,0adh,0d1h,007h,000h,0d9h	; a8ae  V8r.}.W.o}S.....
	defb 003h,00ch,023h,05fh,0bfh,0c7h,0abh,07eh,038h,003h,024h,058h,079h,037h,07fh,0f7h	; a8be  ..#_...~8.$Xy7..
	defb 09ah,03dh,0bfh,0fbh,0dbh,0ceh,0efh,0f3h,0ffh,04eh,061h,033h,03ch,07bh,0fch,0f6h	; a8ce  .=.......Na3<{..
	defb 0f2h,0a3h,051h,039h,019h,008h,019h,062h,0f4h,072h,086h,04ah,034h,0cch,00ch,01eh	; a8de  ..Q9...b.r.J4...
	defb 026h,0e6h,09bh,087h,0c7h,043h,0c7h,0cdh,0a2h,07fh,07eh,03ch,03fh,04fh,087h,08bh	; a8ee  &....C....~<?O..
	defb 08fh,0ffh,06fh,027h,017h,00fh,01fh,07fh,08bh,0feh,07eh,0beh,0fch,0f4h,0f4h,0feh	; a8fe  ..o'......~.....
	defb 0fah,0fah,0f5h,0f9h,0f9h,07dh,0f9h,0f3h,0beh,000h	; a90e  .....}....

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_43: patrones de sprite en RLE (p00:49CE), el
;   registro 43 de juegos_de_sprites; lo leen p00:5609 (66 bytes)
;   0xa918..0xa95a  (66 bytes)
DATA_juegos_de_sprites_43:
	defb 002h,003h,0beh,01bh,03bh,02eh,01fh,036h,076h,03bh,079h,0f5h,074h,014h,00bh,004h	; a918  .......6v.y.t...
	defb 003h,000h,080h,0a0h,0f0h,0d0h,0fch,05eh,06eh,026h,02eh,0a7h,0dfh,0beh,0b8h,030h	; a928  .......^n&.....0
	defb 0c0h,001h,002h,01ah,02eh,03dh,015h,039h,059h,02ch,076h,0aah,06bh,01bh,006h,007h	; a938  .....=.9Y,v.k...
	defb 003h,000h,080h,0a0h,050h,070h,02ch,0aah,09ah,0dah,0d2h,05fh,025h,06ah,048h,0f0h	; a948  ....Pp,...._%jH.
	defb 0c0h,000h	; a958

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_44: patrones de sprite en RLE (p00:49CE), el
;   registro 44 de juegos_de_sprites; lo leen p00:5609 (45 bytes)
;   0xa95a..0xa987  (45 bytes)
DATA_juegos_de_sprites_44:
	defb 008h,000h,088h,007h,00fh,01fh,03fh,03fh,01fh,00fh,007h,008h,000h,088h,0c0h,0e0h	; a95a  ......??........
	defb 0f0h,0f8h,0f8h,0f0h,0e0h,0c0h,008h,000h,088h,007h,008h,010h,028h,02dh,017h,008h	; a96a  ............(-..
	defb 007h,008h,000h,088h,0c0h,020h,050h,028h,078h,0d0h,0a0h,0c0h,000h	; a97a  ..... P(x....

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_45: patrones de sprite en RLE (p00:49CE), el
;   registro 45 de juegos_de_sprites; lo leen p00:5609 (49 bytes)
;   0xa987..0xa9b8  (49 bytes)
DATA_juegos_de_sprites_45:
	defb 007h,000h,089h,003h,007h,00eh,01eh,01bh,01fh,00fh,007h,003h,007h,000h,089h,080h	; a987  ................
	defb 0c0h,060h,070h,0f0h,0f0h,0e0h,0c0h,080h,007h,000h,089h,003h,004h,009h,011h,014h	; a997  .`p.............
	defb 010h,008h,004h,003h,007h,000h,089h,080h,040h,0a0h,090h,010h,010h,020h,040h,080h	; a9a7  ........@.... @.
	defb 000h	; a9b7

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_46: patrones de sprite en RLE (p00:49CE), el
;   registro 46 de juegos_de_sprites; lo leen p00:5609 (66 bytes)
;   0xa9b8..0xa9fa  (66 bytes)
DATA_juegos_de_sprites_46:
	defb 0c0h,07fh,0b5h,0ffh,0c7h,0a5h,07fh,0bfh,0e8h,0e0h,0f0h,07fh,0bdh,0ebh,0c1h,0a3h	; a9b8  ................
	defb 07fh,07eh,0fdh,0d7h,001h,085h,0feh,0adh,07bh,031h,029h,0feh,07dh,0a7h,001h,083h	; a9c8  .~......{1).}...
	defb 0feh,07fh,0ceh,084h,0bch,0deh,07fh,0c0h,097h,09fh,08fh,07fh,0c3h,095h,0bfh,0ddh	; a9d8  ................
	defb 07fh,07eh,003h,029h,0ffh,07bh,0feh,073h,0a5h,0efh,0f7h,0feh,083h,059h,0ffh,07dh	; a9e8  .~.).{.s.....Y.}
	defb 0feh,000h	; a9f8

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_47: patrones de sprite en RLE (p00:49CE), el
;   registro 47 de juegos_de_sprites; lo leen p00:5609 (542 bytes)
;   0xa9fa..0xac18  (542 bytes)
DATA_juegos_de_sprites_47:
	defb 009h,000h,08bh,001h,007h,00fh,01fh,01fh,03fh,03fh,000h,001h,007h,001h,005h,000h	; a9fa  ........??......
	defb 087h,088h,008h,00ch,09dh,0dbh,0bfh,0bfh,008h,000h,08dh,001h,007h,00fh,01fh,03fh	; aa0a  ...............?
	defb 03fh,07fh,07fh,001h,007h,00fh,007h,001h,003h,000h,084h,088h,0dch,09ch,09fh,004h	; aa1a  ?...............
	defb 0ffh,002h,000h,082h,0c0h,060h,004h,010h,088h,020h,051h,050h,0b0h,039h,0dbh,0fdh	; aa2a  .....`... QP.9..
	defb 0fdh,009h,000h,08ch,080h,0e0h,0f0h,0f8h,0f8h,0fch,0fch,000h,0c0h,0e0h,0f0h,078h	; aa3a  ...............x
	defb 003h,038h,084h,071h,0fbh,0f9h,0f9h,004h,0ffh,008h,000h,08eh,080h,0e0h,0f0h,0f8h	; aa4a  .8.q............
	defb 0fch,0fch,0feh,0feh,000h,020h,030h,018h,00ch,00eh,003h,007h,003h,003h,002h,001h	; aa5a  ..... 0.........
	defb 004h,000h,094h,002h,006h,00fh,002h,001h,080h,0c0h,088h,008h,00ch,09dh,0dbh,0bfh	; aa6a  ................
	defb 0bfh,060h,070h,078h,03ch,01eh,01fh,003h,00fh,003h,007h,002h,003h,002h,001h,08ch	; aa7a  .`px<...........
	defb 000h,002h,007h,00fh,01fh,00fh,083h,0c1h,0e8h,0dch,09ch,09fh,004h,0ffh,006h,000h	; aa8a  ................
	defb 090h,0c0h,021h,023h,051h,050h,0b0h,039h,0dbh,0fdh,0fdh,000h,004h,00ch,018h,030h	; aa9a  ..!#QP.9.......0
	defb 070h,003h,0e0h,003h,0c0h,002h,080h,006h,000h,088h,080h,0c0h,0e1h,0f3h,077h,0fbh	; aaaa  p.............w.
	defb 0f9h,0f9h,004h,0ffh,086h,006h,00eh,01eh,03ch,078h,0f8h,003h,0f0h,003h,0e0h,002h	; aaba  ........<x......
	defb 0c0h,002h,080h,08bh,07fh,073h,062h,041h,047h,00bh,00ch,01dh,019h,00ah,004h,005h	; aaca  .....sbAG.......
	defb 000h,09bh,0dfh,0fdh,07bh,0ffh,0dfh,05fh,06fh,09fh,01fh,00eh,00ch,01eh,017h,015h	; aada  ....{.._o.......
	defb 000h,000h,0ffh,0ffh,0f7h,0e3h,0e6h,04ch,00bh,013h,017h,00eh,004h,005h,000h,08fh	; aaea  .......L........
	defb 0ffh,0ebh,0e5h,0c4h,072h,0ech,0f3h,0bch,03fh,01fh,01eh,03eh,03fh,03fh,014h,004h	; aafa  ....r...?..>??..
	defb 000h,088h,001h,007h,00bh,00ch,01dh,019h,00ah,004h,005h,000h,08eh,05fh,07dh,03bh	; ab0a  ............._}.
	defb 0ffh,0dfh,05fh,06fh,09fh,01fh,00eh,00ch,01eh,017h,015h,005h,000h,088h,001h,006h	; ab1a  .._o............
	defb 00ch,00bh,013h,017h,00eh,004h,005h,000h,08fh,0ffh,0ebh,065h,0c4h,072h,0ech,0f3h	; ab2a  ...........e.r..
	defb 0bch,03fh,01fh,01eh,03eh,03fh,03fh,014h,007h,000h,08ah,001h,007h,00fh,01fh,01fh	; ab3a  .?..>??.........
	defb 03fh,03fh,07fh,073h,062h,006h,000h,08ah,088h,008h,00ch,09ch,0dbh,0bfh,0bfh,0dfh	; ab4a  ??.sb...........
	defb 0fdh,07bh,005h,000h,08bh,001h,007h,00fh,01fh,03fh,03fh,07fh,07fh,0ffh,0ffh,0f7h	; ab5a  .{.......??.....
	defb 005h,000h,084h,088h,0dch,09ch,09eh,005h,0ffh,08ah,0ebh,0e5h,041h,047h,00bh,00ch	; ab6a  ............AG..
	defb 01dh,019h,00ah,004h,008h,000h,098h,0ffh,0dfh,05fh,06fh,0bfh,01fh,01fh,03fh,07bh	; ab7a  ........._o...?{
	defb 07ch,02ch,01ch,01eh,07ch,0a8h,054h,0e3h,0e6h,04ch,00bh,013h,017h,00eh,004h,006h	; ab8a  |,..|.T..L......
	defb 000h,092h,001h,000h,0c4h,072h,0ech,0f3h,0bch,01fh,03fh,07fh,0ffh,0ffh,07eh,03eh	; ab9a  .....r....?...~>
	defb 07fh,0feh,0fch,0feh,008h,000h,004h,001h,003h,003h,081h,007h,003h,000h,08dh,020h	; abaa  ...............
	defb 060h,040h,0c0h,0c8h,0c8h,0cch,0dch,09bh,0bfh,0bfh,09fh,0bdh,006h,000h,002h,001h	; abba  `@..............
	defb 004h,003h,004h,007h,002h,000h,088h,020h,070h,0f0h,0e0h,0e8h,0fch,0fch,0feh,005h	; abca  ....... p.......
	defb 0ffh,087h,0ebh,00fh,018h,03bh,03bh,016h,00eh,003h,004h,007h,000h,096h,07bh,0ffh	; abda  ..............{.
	defb 05fh,0dfh,02fh,017h,01fh,03fh,07bh,07ch,02ch,01ch,01eh,07ch,0a8h,054h,008h,017h	; abea  _./..?{|,..|.T..
	defb 027h,027h,01fh,00fh,003h,00eh,081h,004h,004h,000h,092h,001h,000h,0e5h,044h,0e2h	; abfa  ''............D.
	defb 0e8h,037h,01bh,03ch,07fh,0ffh,0ffh,07eh,03eh,07fh,0feh,0fch,0feh,000h	; ac0a  .7.<...~>.....

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_24: patrones de sprite en RLE (p00:49CE), el
;   registro 24 de juegos_de_sprites; lo leen p00:5609 (316 bytes)
;   0xac18..0xad54  (316 bytes)
DATA_juegos_de_sprites_24:
	defb 0a4h,000h,00fh,03ch,021h,066h,07ch,079h,063h,07bh,079h,07ch,07ch,039h,033h,00fh	; ac18  ...<!f|yc{y||93.
	defb 000h,000h,0f0h,03ch,084h,066h,03eh,09eh,0c6h,0deh,09eh,03eh,03eh,09ch,0cch,0f0h	; ac28  ...<.f>....>>...
	defb 000h,00fh,038h,063h,05fh,003h,0dfh,002h,0deh,08bh,0dfh,0cfh,0c7h,047h,06fh,03eh	; ac38  ..8c_........Go>
	defb 00fh,0f0h,00ch,0c2h,0fah,003h,0f9h,002h,079h,09bh,0f9h,0f1h,0e1h,0e2h,0f2h,07ch	; ac48  ........y......|
	defb 0f0h,000h,00fh,03fh,03ch,07ch,079h,078h,072h,077h,07fh,07fh,07eh,038h,03fh,00fh	; ac58  ...?<|yxrw..~8?.
	defb 000h,000h,0f0h,03ch,07ch,003h,0feh,0a2h,07eh,03eh,086h,08eh,01eh,07ch,0fch,0f0h	; ac68  ...<|...~>...|..
	defb 000h,00fh,03ch,060h,043h,0c3h,0c7h,0c7h,0cfh,0cfh,0cdh,0c0h,0c1h,047h,067h,038h	; ac78  ..<`C........Gg8
	defb 00fh,0f0h,00ch,0c2h,0c2h,0c1h,081h,001h,081h,0c1h,003h,0f9h,088h,0f2h,0c2h,00ch	; ac88  ................
	defb 0f0h,000h,00fh,03fh,023h,004h,07bh,003h,073h,08ch,071h,039h,03ch,00fh,000h,000h	; ac98  ...?#.{.s.q9<...
	defb 0f0h,0fch,084h,01eh,01eh,086h,005h,09eh,089h,03ch,07ch,0f0h,000h,00fh,03ch,060h	; aca8  .........<|...<`
	defb 05eh,0deh,003h,0c6h,003h,0ceh,08dh,0cfh,047h,063h,03fh,00fh,0f0h,00ch,002h,07ah	; acb8  ^.......Gc?....z
	defb 0f9h,0f1h,079h,079h,004h,071h,099h,0f2h,0e2h,0cch,0f0h,000h,00fh,03fh,030h,079h	; acc8  ..yy.q.......?0y
	defb 073h,073h,07bh,078h,073h,067h,06fh,03fh,03fh,00fh,000h,000h,0f0h,0fch,004h,0eeh	; acd8  ss{xsgo??.......
	defb 003h,0ceh,09dh,00eh,0ceh,0ceh,0e6h,0fch,0fch,0f0h,000h,00fh,03ch,060h,04fh,0cfh	; ace8  ............<`O.
	defb 0cfh,0ceh,0ceh,0cfh,0cfh,0deh,0dch,058h,060h,03ch,00fh,0f0h,00ch,002h,0fah,0f9h	; acf8  .......X`<......
	defb 003h,039h,002h,0f9h,0aah,079h,039h,03ah,002h,00ch,0f0h,000h,00fh,03ch,039h,073h	; ad08  .9...y9:.....<9s
	defb 079h,079h,061h,079h,079h,07ch,07ch,039h,033h,00fh,000h,000h,0f0h,03ch,09ch,0ceh	; ad18  yyayy||93....<..
	defb 09eh,09eh,086h,09eh,09eh,03eh,03eh,09ch,0cch,0f0h,000h,00fh,03ch,063h,047h,003h	; ad28  .....>>.....<cG.
	defb 0ceh,002h,0deh,08bh,0dfh,0cfh,0c7h,047h,06fh,03eh,00fh,0f0h,00ch,0c2h,0e2h,003h	; ad38  .......Go>......
	defb 071h,002h,079h,087h,0f9h,0f1h,0e1h,0e2h,0f2h,07ch,0f0h,000h	; ad48  q.y......|..

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_38: patrones de sprite en RLE (p00:49CE), el
;   registro 38 de juegos_de_sprites; lo leen p00:5609 (51 bytes)
;   0xad54..0xad87  (51 bytes)
DATA_juegos_de_sprites_38:
	defb 004h,000h,002h,005h,085h,003h,00dh,007h,001h,006h,008h,000h,089h,080h,0b0h,040h	; ad54  ...............@
	defb 0f0h,0d8h,0e0h,050h,0d0h,080h,007h,000h,089h,005h,00ah,00ah,00ch,012h,008h,006h	; ad64  ...P............
	defb 009h,007h,006h,000h,08bh,080h,070h,048h,0b0h,008h,024h,018h,0a8h,028h,050h,080h	; ad74  ......pH..$..(P.
	defb 003h,000h,000h	; ad84

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_34: patrones de sprite en RLE (p00:49CE), el
;   registro 34 de juegos_de_sprites; lo leen p00:5609 (118 bytes)
;   0xad87..0xadfd  (118 bytes)
DATA_juegos_de_sprites_34:
	defb 004h,000h,081h,001h,004h,000h,081h,002h,012h,000h,081h,080h,003h,000h,082h,002h	; ad87  ................
	defb 004h,003h,000h,086h,004h,008h,000h,000h,001h,002h,015h,000h,08bh,001h,00fh,01fh	; ad97  ................
	defb 019h,039h,038h,039h,019h,01fh,00fh,001h,005h,000h,003h,0ffh,085h,042h,04eh,046h	; ada7  .989.........BNF
	defb 04eh,042h,003h,0ffh,081h,001h,007h,000h,002h,006h,083h,007h,006h,006h,00bh,000h	; adb7  NB..............
	defb 085h,0bdh,0b1h,0b9h,0b1h,0bdh,008h,000h,003h,0ffh,085h,070h,072h,070h,073h,013h	; adc7  ...........prps.
	defb 003h,0ffh,090h,0f0h,070h,00ch,000h,000h,080h,0f0h,0f8h,0c8h,0cch,0dch,0fch,098h	; add7  ....p...........
	defb 0f8h,0f0h,080h,008h,000h,085h,08fh,08dh,08fh,08ch,0ech,00bh,000h,002h,030h,083h	; ade7  ..............0.
	defb 020h,000h,060h,008h,000h,000h	; adf7

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_48: patrones de sprite en RLE (p00:49CE), el
;   registro 48 de juegos_de_sprites; lo leen p00:5609 (167 bytes)
;   0xadfd..0xaea4  (167 bytes)
DATA_juegos_de_sprites_48:
	defb 009h,000h,085h,03fh,04ch,041h,02eh,011h,00ch,000h,084h,0c0h,020h,0d0h,0e0h,00bh	; adfd  ...?LA...... ...
	defb 000h,085h,03fh,073h,07eh,03fh,011h,00ch,000h,084h,0c0h,0e0h,030h,0e0h,005h,000h	; ae0d  ..?s~?......0...
	defb 08dh,00eh,011h,021h,018h,010h,014h,018h,013h,016h,017h,00bh,00dh,002h,006h,000h	; ae1d  ...!............
	defb 008h,080h,005h,000h,083h,00eh,01fh,03fh,005h,01fh,085h,01dh,01ch,00eh,00fh,002h	; ae2d  .......?........
	defb 006h,000h,008h,080h,006h,000h,08bh,003h,004h,008h,008h,010h,030h,02ch,05ch,07dh	; ae3d  ............0,\}
	defb 07ah,03ch,004h,000h,089h,0e0h,010h,008h,028h,010h,0a0h,040h,080h,080h,008h,000h	; ae4d  z<......(..@....
	defb 08bh,003h,007h,00fh,00fh,01fh,03fh,03fh,067h,047h,04eh,03ch,004h,000h,089h,0e0h	; ae5d  ......??gGN<....
	defb 0f0h,0f8h,0f8h,0f0h,0e0h,0c0h,080h,080h,007h,000h,087h,007h,078h,0f4h,0fch,098h	; ae6d  ............x...
	defb 061h,01eh,009h,000h,089h,0c0h,038h,004h,002h,041h,081h,0d2h,024h,018h,007h,000h	; ae7d  a.....8..A..$...
	defb 087h,007h,07fh,08fh,0c7h,0ffh,07fh,01eh,009h,000h,089h,0c0h,0f8h,0fch,0feh,0ffh	; ae8d  ................
	defb 0ffh,0feh,03ch,018h,004h,000h,000h	; ae9d

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_49: patrones de sprite en RLE (p00:49CE), el
;   registro 49 de juegos_de_sprites; lo leen p00:5609 (97 bytes)
;   0xaea4..0xaf05  (97 bytes)
DATA_juegos_de_sprites_49:
	defb 002h,000h,099h,001h,002h,000h,000h,002h,005h,005h,019h,003h,00eh,01eh,02fh,02fh	; aea4  ..............//
	defb 00eh,03ch,0cfh,01eh,010h,013h,077h,0c7h,086h,00ch,01eh,01ah,003h,03ah,0bfh,019h	; aeb4  .<....w......:..
	defb 039h,000h,001h,003h,006h,007h,04fh,03fh,03fh,0f7h,06bh,0c7h,0ceh,09eh,0fch,0f9h	; aec4  9.....O??.k.....
	defb 0c1h,078h,08fh,03fh,0fch,0f0h,0e6h,0c1h,09fh,0ffh,0d9h,038h,070h,040h,000h,080h	; aed4  .x.?.......8p@..
	defb 000h,000h,030h,03ch,07eh,0c7h,0c3h,01fh,020h,000h,026h,0ffh,0fch,0f0h,003h,004h	; aee4  ..0<~... .&.....
	defb 000h,000h,080h,040h,03eh,0ffh,0e7h,080h,000h,030h,0ffh,0fbh,0e3h,0c0h,003h,000h	; aef4  ...@>....0......
	defb 000h	; af04

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_53: patrones de sprite en RLE (p00:49CE), el
;   registro 53 de juegos_de_sprites; lo leen p00:5609 (106 bytes)
;   0xaf05..0xaf6f  (106 bytes)
DATA_juegos_de_sprites_53:
	defb 004h,000h,088h,006h,00ch,009h,00bh,001h,006h,007h,001h,008h,000h,088h,060h,070h	; af05  ..............`p
	defb 0a0h,0d8h,098h,010h,060h,060h,004h,000h,09fh,00ah,02fh,018h,017h,049h,043h,0d6h	; af15  ....``..../..IC.
	defb 0d4h,01eh,059h,028h,00eh,063h,070h,016h,000h,062h,09ch,00ch,0e0h,09ah,08bh,05dh	; af25  ..Y(.cp..b.....]
	defb 025h,064h,0ech,09bh,097h,0e2h,018h,038h,009h,000h,086h,001h,000h,010h,008h,00ch	; af35  %d.....8........
	defb 006h,00bh,000h,084h,080h,004h,044h,0d8h,005h,000h,09eh,040h,021h,002h,023h,031h	; af45  ......D....@!.#1
	defb 013h,01ah,03bh,02dh,037h,0b3h,099h,05fh,06dh,000h,082h,006h,004h,000h,010h,088h	; af55  ...-7.._m.......
	defb 0c4h,0c4h,06eh,0fah,0bah,026h,0fdh,0beh,008h,000h	; af65  ..n..&....

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_50: patrones de sprite en RLE (p00:49CE), el
;   registro 50 de juegos_de_sprites; lo leen p00:5609 (257 bytes)
;   0xaf6f..0xb070  (257 bytes)
DATA_juegos_de_sprites_50:
	defb 006h,000h,002h,055h,002h,0aah,01ch,000h,002h,055h,002h,0aah,00ch,000h,002h,055h	; af6f  ...U.....U.....U
	defb 002h,0aah,01ch,000h,002h,055h,002h,0aah,008h,000h,08ah,010h,00ch,006h,003h,001h	; af7f  .....U..........
	defb 03fh,003h,006h,00ch,010h,004h,000h,002h,080h,08ch,084h,098h,0b0h,0e0h,0c0h,0feh	; af8f  ?...............
	defb 0e0h,0b0h,098h,084h,080h,080h,008h,000h,085h,07fh,0e2h,0c1h,0ffh,07fh,00bh,000h	; af9f  ................
	defb 085h,0feh,007h,003h,0ffh,0feh,00bh,000h,085h,07fh,09fh,0bfh,081h,07fh,00bh,000h	; afaf  ................
	defb 085h,0feh,0f9h,0fdh,081h,0feh,006h,000h,08dh,07fh,0e2h,0c1h,0ffh,0ffh,0feh,0fbh	; afbf  ................
	defb 0f7h,07fh,07fh,03fh,03fh,01fh,003h,000h,08dh,0feh,007h,003h,0ffh,0ffh,0f7h,0fbh	; afcf  ...??...........
	defb 0ffh,0feh,0feh,0fch,0fch,0f8h,003h,000h,08dh,07fh,09fh,0bfh,081h,0ffh,087h,0cch	; afdf  ................
	defb 0f8h,040h,060h,020h,030h,01fh,003h,000h,093h,0feh,0f9h,0fdh,081h,0ffh,00fh,007h	; afef  .@` 0...........
	defb 003h,002h,006h,004h,00ch,0f8h,000h,000h,03fh,07eh,07bh,077h,009h,07fh,086h,05fh	; afff  ........?~{w..._
	defb 06fh,03fh,0fch,0f6h,0fah,009h,0feh,088h,0eeh,0deh,07eh,0fch,03fh,047h,04ch,078h	; b00f  o?........~.?GLx
	defb 009h,040h,086h,060h,070h,03fh,0fch,00eh,006h,009h,002h,093h,01eh,032h,0e2h,0fch	; b01f  .@.`p?.......2..
	defb 000h,000h,01fh,03fh,03fh,07fh,07fh,0f7h,0fbh,0feh,0ffh,0ffh,0c1h,0e2h,07fh,003h	; b02f  ...??...........
	defb 000h,08dh,0f8h,0fch,0fch,0feh,0feh,0ffh,0fbh,0f7h,0ffh,0ffh,003h,007h,0feh,003h	; b03f  ................
	defb 000h,08dh,01fh,030h,020h,060h,040h,0f8h,0cch,087h,0ffh,081h,0bfh,09fh,07fh,003h	; b04f  ...0 `@.........
	defb 000h,08eh,0f8h,00ch,004h,006h,002h,003h,007h,00fh,0ffh,081h,0fdh,0f9h,0feh,000h	; b05f  ................
	defb 000h	; b06f

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_51: patrones de sprite en RLE (p00:49CE), el
;   registro 51 de juegos_de_sprites; lo leen p00:5609 (130 bytes)
;   0xb070..0xb0f2  (130 bytes)
DATA_juegos_de_sprites_51:
	defb 098h,007h,018h,021h,05bh,07eh,0bbh,0f1h,0f2h,099h,0a5h,08fh,041h,04ch,021h,01bh	; b070  ...![~......AL!.
	defb 007h,0e0h,038h,0ech,0f6h,0feh,0ffh,0bfh,07fh,003h,0ffh,002h,0feh,0abh,0fch,0f8h	; b080  ..8.............
	defb 0e0h,007h,01fh,03eh,064h,045h,0dch,09eh,08dh,0e6h,0dah,0f0h,07eh,073h,03eh,01ch	; b090  ...>dE......~s>.
	defb 007h,0e0h,0d8h,014h,0eah,036h,09bh,06bh,095h,05bh,033h,0e5h,036h,04ah,02ch,0f8h	; b0a0  .....6.k.[3.6J,.
	defb 0e0h,007h,018h,022h,041h,055h,096h,0c4h,0efh,003h,0ffh,002h,07fh,0b3h,03fh,01fh	; b0b0  ..."AU........?.
	defb 007h,0e0h,0d8h,0f4h,0fah,03ah,011h,0b9h,06dh,07dh,0bdh,0ffh,0fah,0f6h,0fch,0f8h	; b0c0  .....:..m}......
	defb 0e0h,007h,01fh,03dh,07eh,06ah,0e9h,0bbh,090h,0c4h,0d5h,0eeh,04bh,071h,02ch,01bh	; b0d0  ...=~j......Kq,.
	defb 007h,0e0h,038h,00ch,066h,0e6h,0ffh,047h,093h,0abh,04bh,059h,0b6h,06ah,094h,078h	; b0e0  ..8.f..G..KY.j.x
	defb 0e0h,000h	; b0f0

; ----------------------------------------------------------------------
; DATOS juegos_de_sprites_52: patrones de sprite en RLE (p00:49CE), el
;   registro 52 de juegos_de_sprites; lo leen p00:5609 (57 bytes)
;   0xb0f2..0xb12b  (57 bytes)
DATA_juegos_de_sprites_52:
	defb 008h,000h,091h,001h,003h,006h,00ch,018h,030h,060h,0c0h,001h,003h,006h,00ch,018h	; b0f2  ........0`......
	defb 030h,060h,0c0h,080h,00fh,000h,002h,001h,002h,003h,002h,006h,002h,00ch,002h,018h	; b102  0`..............
	defb 002h,030h,002h,060h,002h,0c0h,002h,080h,006h,000h,010h,001h,010h,080h,007h,000h	; b112  .0.`............
	defb 002h,0ffh,00eh,000h,002h,0ffh,007h,000h,000h	; b122  .........

; ----------------------------------------------------------------------
; DATOS por_fase_b12b: 25 palabras: la lista de cada fase 1-25 (p02:9198:
;   p09:B12B[0xC211 - 1]; 0 = ninguna); lo leen p02:9195 (50 bytes)
;   0xb12b..0xb15d  (50 bytes)
DATA_por_fase_b12b:
	defb 05dh,0b1h	; b12b
	defb 0a1h,0b1h	; b12d
	defb 0edh,0b1h	; b12f
	defb 01dh,0b2h	; b131
	defb 000h,000h	; b133
	defb 04dh,0b2h	; b135
	defb 081h,0b2h	; b137
	defb 0adh,0b2h	; b139
	defb 005h,0b3h	; b13b
	defb 000h,000h	; b13d
	defb 059h,0b3h	; b13f
	defb 075h,0b3h	; b141
	defb 091h,0b3h	; b143
	defb 0c5h,0b3h	; b145
	defb 000h,000h	; b147
	defb 01dh,0b4h	; b149
	defb 079h,0b4h	; b14b
	defb 0c1h,0b4h	; b14d
	defb 009h,0b5h	; b14f
	defb 000h,000h	; b151
	defb 05dh,0b5h	; b153
	defb 091h,0b5h	; b155
	defb 011h,0b6h	; b157
	defb 09dh,0b6h	; b159
	defb 000h,000h	; b15b

; ----------------------------------------------------------------------
; DATOS lista_b12b_B15D: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (68
;   bytes)
;   0xb15d..0xb1a1  (68 bytes)
DATA_lista_b12b_B15D:
	defb 001h,001h,068h,070h	; b15d
	defb 002h,001h,088h,0b0h	; b161
	defb 002h,001h,0d8h,050h	; b165
	defb 003h,00eh,0c2h,000h	; b169
	defb 003h,00eh,0a2h,000h	; b16d
	defb 003h,00eh,096h,000h	; b171
	defb 003h,00eh,0b6h,000h	; b175
	defb 003h,001h,098h,0b0h	; b179
	defb 004h,001h,0a8h,060h	; b17d
	defb 004h,001h,0b0h,0b0h	; b181
	defb 005h,001h,0e0h,030h	; b185
	defb 005h,001h,058h,070h	; b189
	defb 005h,001h,098h,0b0h	; b18d
	defb 006h,001h,090h,0b0h	; b191
	defb 007h,001h,060h,0b0h	; b195
	defb 008h,01eh,000h,000h	; b199
	defb 0ffh,0ffh,0ffh,0ffh	; b19d

; ----------------------------------------------------------------------
; DATOS lista_b12b_B1A1: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (76
;   bytes)
;   0xb1a1..0xb1ed  (76 bytes)
DATA_lista_b12b_B1A1:
	defb 001h,00eh,052h,000h	; b1a1
	defb 001h,00eh,092h,000h	; b1a5
	defb 001h,00eh,0a6h,000h	; b1a9
	defb 001h,00eh,066h,000h	; b1ad
	defb 002h,00eh,09ah,000h	; b1b1
	defb 002h,00eh,046h,000h	; b1b5
	defb 002h,00eh,0b6h,000h	; b1b9
	defb 002h,00eh,062h,000h	; b1bd
	defb 002h,001h,088h,030h	; b1c1
	defb 004h,00ah,058h,0b0h	; b1c5
	defb 004h,00ah,078h,040h	; b1c9
	defb 005h,001h,0b0h,0b0h	; b1cd
	defb 006h,001h,088h,070h	; b1d1
	defb 008h,007h,088h,070h	; b1d5
	defb 009h,001h,078h,030h	; b1d9
	defb 009h,001h,078h,0b0h	; b1dd
	defb 00ah,00dh,080h,068h	; b1e1
	defb 00bh,01fh,000h,000h	; b1e5
	defb 0ffh,0ffh,0ffh,0ffh	; b1e9

; ----------------------------------------------------------------------
; DATOS lista_b12b_B1ED: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (48
;   bytes)
;   0xb1ed..0xb21d  (48 bytes)
DATA_lista_b12b_B1ED:
	defb 001h,001h,048h,020h	; b1ed
	defb 002h,00dh,0a0h,028h	; b1f1
	defb 003h,00eh,076h,000h	; b1f5
	defb 003h,00eh,095h,000h	; b1f9
	defb 004h,002h,010h,000h	; b1fd
	defb 005h,001h,078h,020h	; b201
	defb 005h,001h,0d8h,040h	; b205
	defb 006h,00ah,058h,030h	; b209
	defb 007h,001h,060h,020h	; b20d
	defb 008h,001h,0c8h,0b0h	; b211
	defb 009h,020h,000h,000h	; b215
	defb 0ffh,0ffh,0ffh,0ffh	; b219

; ----------------------------------------------------------------------
; DATOS lista_b12b_B21D: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (48
;   bytes)
;   0xb21d..0xb24d  (48 bytes)
DATA_lista_b12b_B21D:
	defb 001h,005h,035h,000h	; b21d
	defb 001h,00eh,082h,000h	; b221
	defb 001h,00eh,0bah,000h	; b225
	defb 002h,00ah,070h,080h	; b229
	defb 003h,001h,0a0h,080h	; b22d
	defb 003h,001h,068h,050h	; b231
	defb 004h,002h,010h,000h	; b235
	defb 005h,001h,050h,0b0h	; b239
	defb 006h,00dh,0a0h,058h	; b23d
	defb 007h,008h,04bh,000h	; b241
	defb 008h,021h,000h,000h	; b245
	defb 0ffh,0ffh,0ffh,0ffh	; b249

; ----------------------------------------------------------------------
; DATOS lista_b12b_B24D: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (52
;   bytes)
;   0xb24d..0xb281  (52 bytes)
DATA_lista_b12b_B24D:
	defb 001h,001h,0b8h,020h	; b24d
	defb 001h,001h,0b8h,050h	; b251
	defb 002h,001h,040h,020h	; b255
	defb 002h,001h,040h,050h	; b259
	defb 003h,002h,010h,000h	; b25d
	defb 004h,001h,098h,030h	; b261
	defb 005h,00ah,068h,0b0h	; b265
	defb 006h,001h,070h,030h	; b269
	defb 007h,00fh,044h,000h	; b26d
	defb 007h,00fh,047h,000h	; b271
	defb 007h,007h,080h,060h	; b275
	defb 008h,006h,078h,080h	; b279
	defb 0ffh,0ffh,0ffh,0ffh	; b27d

; ----------------------------------------------------------------------
; DATOS lista_b12b_B281: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (44
;   bytes)
;   0xb281..0xb2ad  (44 bytes)
DATA_lista_b12b_B281:
	defb 001h,001h,0e0h,030h	; b281
	defb 001h,001h,060h,0b0h	; b285
	defb 003h,00dh,0b8h,028h	; b289
	defb 004h,001h,068h,0b0h	; b28d
	defb 005h,001h,0b8h,0b0h	; b291
	defb 006h,00ch,09ah,000h	; b295
	defb 007h,00ch,09ah,000h	; b299
	defb 008h,009h,098h,060h	; b29d
	defb 009h,003h,08ah,000h	; b2a1
	defb 00ah,001h,038h,030h	; b2a5
	defb 0ffh,0ffh,0ffh,0ffh	; b2a9

; ----------------------------------------------------------------------
; DATOS lista_b12b_B2AD: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (88
;   bytes)
;   0xb2ad..0xb305  (88 bytes)
DATA_lista_b12b_B2AD:
	defb 001h,001h,0a0h,0b0h	; b2ad
	defb 001h,001h,088h,070h	; b2b1
	defb 002h,001h,0a0h,0b0h	; b2b5
	defb 003h,001h,098h,0b0h	; b2b9
	defb 003h,001h,060h,080h	; b2bd
	defb 003h,001h,0c8h,080h	; b2c1
	defb 004h,00eh,05ah,000h	; b2c5
	defb 004h,00eh,042h,000h	; b2c9
	defb 004h,005h,045h,000h	; b2cd
	defb 005h,001h,0d8h,060h	; b2d1
	defb 005h,001h,0c8h,0b0h	; b2d5
	defb 006h,00dh,060h,088h	; b2d9
	defb 006h,00eh,0b5h,000h	; b2dd
	defb 006h,00eh,0aah,000h	; b2e1
	defb 007h,00ah,038h,0b0h	; b2e5
	defb 007h,001h,058h,060h	; b2e9
	defb 007h,00ah,078h,0b0h	; b2ed
	defb 008h,001h,038h,020h	; b2f1
	defb 008h,001h,0c8h,020h	; b2f5
	defb 00ah,00ah,058h,070h	; b2f9
	defb 00ah,001h,058h,0b0h	; b2fd
	defb 0ffh,0ffh,0ffh,0ffh	; b301

; ----------------------------------------------------------------------
; DATOS lista_b12b_B305: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (84
;   bytes)
;   0xb305..0xb359  (84 bytes)
DATA_lista_b12b_B305:
	defb 001h,001h,080h,0b0h	; b305
	defb 002h,00eh,06ah,000h	; b309
	defb 002h,00eh,09ah,000h	; b30d
	defb 002h,00eh,067h,000h	; b311
	defb 002h,00eh,0a7h,000h	; b315
	defb 002h,00eh,044h,000h	; b319
	defb 002h,00eh,064h,000h	; b31d
	defb 002h,00eh,031h,000h	; b321
	defb 002h,00eh,081h,000h	; b325
	defb 003h,001h,060h,080h	; b329
	defb 003h,001h,080h,050h	; b32d
	defb 004h,001h,058h,040h	; b331
	defb 004h,001h,0c8h,040h	; b335
	defb 004h,00eh,086h,000h	; b339
	defb 004h,00eh,0c6h,000h	; b33d
	defb 005h,007h,0a0h,080h	; b341
	defb 005h,007h,040h,028h	; b345
	defb 006h,00bh,0cbh,000h	; b349
	defb 007h,00ch,0bbh,000h	; b34d
	defb 007h,00ch,054h,000h	; b351
	defb 0ffh,0ffh,0ffh,0ffh	; b355

; ----------------------------------------------------------------------
; DATOS lista_b12b_B359: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (28
;   bytes)
;   0xb359..0xb375  (28 bytes)
DATA_lista_b12b_B359:
	defb 001h,008h,085h,000h	; b359
	defb 004h,004h,080h,028h	; b35d
	defb 004h,004h,050h,068h	; b361
	defb 005h,008h,06bh,000h	; b365
	defb 006h,002h,010h,000h	; b369
	defb 007h,001h,070h,050h	; b36d
	defb 0ffh,0ffh,0ffh,0ffh	; b371

; ----------------------------------------------------------------------
; DATOS lista_b12b_B375: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (28
;   bytes)
;   0xb375..0xb391  (28 bytes)
DATA_lista_b12b_B375:
	defb 001h,001h,0b0h,0a0h	; b375
	defb 001h,001h,0b0h,050h	; b379
	defb 002h,009h,080h,098h	; b37d
	defb 004h,002h,010h,000h	; b381
	defb 008h,001h,080h,030h	; b385
	defb 008h,001h,098h,0b0h	; b389
	defb 0ffh,0ffh,0ffh,0ffh	; b38d

; ----------------------------------------------------------------------
; DATOS lista_b12b_B391: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (52
;   bytes)
;   0xb391..0xb3c5  (52 bytes)
DATA_lista_b12b_B391:
	defb 002h,001h,088h,050h	; b391
	defb 003h,00bh,02bh,000h	; b395
	defb 004h,00dh,060h,060h	; b399
	defb 005h,001h,078h,030h	; b39d
	defb 006h,001h,028h,030h	; b3a1
	defb 007h,007h,030h,070h	; b3a5
	defb 008h,00ch,05bh,000h	; b3a9
	defb 008h,00ch,0c3h,000h	; b3ad
	defb 009h,00ch,0dbh,000h	; b3b1
	defb 009h,00ch,06bh,000h	; b3b5
	defb 009h,002h,010h,000h	; b3b9
	defb 00ah,001h,0bch,090h	; b3bd
	defb 0ffh,0ffh,0ffh,0ffh	; b3c1

; ----------------------------------------------------------------------
; DATOS lista_b12b_B3C5: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (88
;   bytes)
;   0xb3c5..0xb41d  (88 bytes)
DATA_lista_b12b_B3C5:
	defb 001h,00eh,063h,000h	; b3c5
	defb 001h,00eh,084h,000h	; b3c9
	defb 001h,00eh,0a3h,000h	; b3cd
	defb 001h,00eh,0c4h,000h	; b3d1
	defb 002h,001h,038h,050h	; b3d5
	defb 003h,00fh,043h,000h	; b3d9
	defb 003h,00fh,046h,000h	; b3dd
	defb 004h,001h,028h,0b0h	; b3e1
	defb 005h,007h,0b0h,040h	; b3e5
	defb 005h,009h,050h,060h	; b3e9
	defb 006h,002h,010h,000h	; b3ed
	defb 008h,001h,018h,0b0h	; b3f1
	defb 008h,001h,028h,030h	; b3f5
	defb 008h,001h,0b8h,030h	; b3f9
	defb 009h,003h,04ah,000h	; b3fd
	defb 00ah,003h,08ah,000h	; b401
	defb 00ah,002h,010h,000h	; b405
	defb 00bh,00fh,023h,000h	; b409
	defb 00bh,00fh,028h,000h	; b40d
	defb 00bh,001h,0e8h,080h	; b411
	defb 00ch,001h,060h,070h	; b415
	defb 0ffh,0ffh,0ffh,0ffh	; b419

; ----------------------------------------------------------------------
; DATOS lista_b12b_B41D: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (92
;   bytes)
;   0xb41d..0xb479  (92 bytes)
DATA_lista_b12b_B41D:
	defb 001h,00fh,0c3h,000h	; b41d
	defb 001h,007h,060h,060h	; b421
	defb 002h,00dh,0c0h,068h	; b425
	defb 002h,00dh,070h,068h	; b429
	defb 002h,00eh,042h,000h	; b42d
	defb 002h,00eh,062h,000h	; b431
	defb 003h,008h,0a8h,000h	; b435
	defb 003h,008h,05bh,000h	; b439
	defb 004h,00ah,070h,0b0h	; b43d
	defb 004h,00ah,040h,070h	; b441
	defb 004h,00ah,088h,030h	; b445
	defb 005h,005h,071h,000h	; b449
	defb 009h,005h,0a1h,000h	; b44d
	defb 009h,005h,061h,000h	; b451
	defb 00ah,003h,0aah,000h	; b455
	defb 00ah,00eh,092h,000h	; b459
	defb 00ah,00eh,053h,000h	; b45d
	defb 00ah,00eh,068h,000h	; b461
	defb 00bh,007h,0b0h,028h	; b465
	defb 00bh,007h,0d8h,088h	; b469
	defb 00ch,008h,04bh,000h	; b46d
	defb 00ch,008h,097h,000h	; b471
	defb 0ffh,0ffh,0ffh,0ffh	; b475

; ----------------------------------------------------------------------
; DATOS lista_b12b_B479: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (72
;   bytes)
;   0xb479..0xb4c1  (72 bytes)
DATA_lista_b12b_B479:
	defb 001h,001h,030h,0a0h	; b479
	defb 001h,001h,030h,070h	; b47d
	defb 002h,00ch,033h,000h	; b481
	defb 002h,00fh,087h,000h	; b485
	defb 003h,001h,0b8h,030h	; b489
	defb 003h,001h,048h,030h	; b48d
	defb 003h,009h,038h,078h	; b491
	defb 004h,002h,010h,000h	; b495
	defb 006h,00eh,082h,000h	; b499
	defb 006h,00eh,0a2h,000h	; b49d
	defb 006h,00eh,045h,000h	; b4a1
	defb 006h,00eh,065h,000h	; b4a5
	defb 006h,004h,050h,098h	; b4a9
	defb 007h,001h,068h,030h	; b4ad
	defb 007h,001h,098h,0b0h	; b4b1
	defb 008h,002h,010h,000h	; b4b5
	defb 008h,00ch,087h,000h	; b4b9
	defb 0ffh,0ffh,0ffh,0ffh	; b4bd

; ----------------------------------------------------------------------
; DATOS lista_b12b_B4C1: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (72
;   bytes)
;   0xb4c1..0xb509  (72 bytes)
DATA_lista_b12b_B4C1:
	defb 001h,001h,0b0h,070h	; b4c1
	defb 001h,001h,070h,050h	; b4c5
	defb 001h,001h,088h,0b0h	; b4c9
	defb 002h,00fh,069h,000h	; b4cd
	defb 002h,00fh,066h,000h	; b4d1
	defb 003h,00fh,0c3h,000h	; b4d5
	defb 003h,00fh,0c6h,000h	; b4d9
	defb 003h,00fh,0c9h,000h	; b4dd
	defb 004h,009h,0a0h,080h	; b4e1
	defb 005h,00fh,0c3h,000h	; b4e5
	defb 005h,00fh,0c7h,000h	; b4e9
	defb 006h,002h,010h,000h	; b4ed
	defb 007h,001h,040h,0b0h	; b4f1
	defb 007h,001h,0c0h,0b0h	; b4f5
	defb 008h,001h,030h,030h	; b4f9
	defb 009h,007h,070h,060h	; b4fd
	defb 00ah,001h,090h,030h	; b501
	defb 0ffh,0ffh,0ffh,0ffh	; b505

; ----------------------------------------------------------------------
; DATOS lista_b12b_B509: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (84
;   bytes)
;   0xb509..0xb55d  (84 bytes)
DATA_lista_b12b_B509:
	defb 001h,004h,090h,028h	; b509
	defb 001h,004h,060h,068h	; b50d
	defb 002h,009h,058h,028h	; b511
	defb 002h,009h,0a0h,060h	; b515
	defb 003h,00eh,0b6h,000h	; b519
	defb 003h,00eh,075h,000h	; b51d
	defb 003h,007h,0a0h,028h	; b521
	defb 004h,001h,018h,0b0h	; b525
	defb 004h,001h,068h,050h	; b529
	defb 004h,001h,0a8h,050h	; b52d
	defb 005h,00dh,070h,038h	; b531
	defb 005h,00dh,0a0h,038h	; b535
	defb 006h,007h,090h,030h	; b539
	defb 006h,00ah,048h,0b0h	; b53d
	defb 006h,00ah,0b8h,0b0h	; b541
	defb 007h,006h,050h,070h	; b545
	defb 008h,001h,048h,0b0h	; b549
	defb 008h,001h,0b8h,0b0h	; b54d
	defb 009h,001h,038h,030h	; b551
	defb 009h,00bh,0d7h,000h	; b555
	defb 0ffh,0ffh,0ffh,0ffh	; b559

; ----------------------------------------------------------------------
; DATOS lista_b12b_B55D: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (52
;   bytes)
;   0xb55d..0xb591  (52 bytes)
DATA_lista_b12b_B55D:
	defb 001h,001h,088h,050h	; b55d
	defb 002h,005h,0a1h,000h	; b561
	defb 003h,002h,010h,000h	; b565
	defb 004h,001h,0c0h,050h	; b569
	defb 005h,00eh,03ah,000h	; b56d
	defb 005h,00eh,0bah,000h	; b571
	defb 005h,006h,090h,068h	; b575
	defb 006h,004h,0d0h,070h	; b579
	defb 007h,002h,010h,000h	; b57d
	defb 008h,007h,070h,050h	; b581
	defb 009h,005h,081h,000h	; b585
	defb 00ah,009h,070h,088h	; b589
	defb 0ffh,0ffh,0ffh,0ffh	; b58d

; ----------------------------------------------------------------------
; DATOS lista_b12b_B591: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (128
;   bytes)
;   0xb591..0xb611  (128 bytes)
DATA_lista_b12b_B591:
	defb 001h,004h,080h,030h	; b591
	defb 002h,004h,0b0h,020h	; b595
	defb 002h,004h,050h,080h	; b599
	defb 003h,00ah,048h,0b0h	; b59d
	defb 003h,00ah,0b8h,070h	; b5a1
	defb 003h,00ah,0c8h,030h	; b5a5
	defb 004h,00fh,063h,000h	; b5a9
	defb 004h,00fh,066h,000h	; b5ad
	defb 004h,001h,028h,030h	; b5b1
	defb 004h,001h,0e8h,080h	; b5b5
	defb 005h,001h,068h,030h	; b5b9
	defb 005h,001h,0a0h,0b0h	; b5bd
	defb 005h,00ah,0d8h,030h	; b5c1
	defb 005h,00ah,058h,080h	; b5c5
	defb 006h,00bh,04ah,000h	; b5c9
	defb 006h,001h,0b0h,060h	; b5cd
	defb 007h,001h,030h,0b0h	; b5d1
	defb 007h,001h,0b8h,030h	; b5d5
	defb 008h,009h,050h,020h	; b5d9
	defb 008h,009h,0d0h,0a0h	; b5dd
	defb 008h,00dh,0b0h,060h	; b5e1
	defb 009h,009h,060h,020h	; b5e5
	defb 009h,009h,0d0h,060h	; b5e9
	defb 009h,009h,090h,0a0h	; b5ed
	defb 00ah,00dh,050h,020h	; b5f1
	defb 00ah,00dh,090h,060h	; b5f5
	defb 00ah,00dh,0b0h,0a0h	; b5f9
	defb 00bh,009h,090h,020h	; b5fd
	defb 00bh,009h,070h,060h	; b601
	defb 00bh,009h,030h,0a0h	; b605
	defb 00ch,002h,010h,000h	; b609
	defb 0ffh,0ffh,0ffh,0ffh	; b60d

; ----------------------------------------------------------------------
; DATOS lista_b12b_B611: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (140
;   bytes)
;   0xb611..0xb69d  (140 bytes)
DATA_lista_b12b_B611:
	defb 001h,00eh,0b2h,000h	; b611
	defb 001h,00eh,096h,000h	; b615
	defb 001h,00eh,06ah,000h	; b619
	defb 002h,00eh,062h,000h	; b61d
	defb 002h,00eh,0a2h,000h	; b621
	defb 002h,00eh,086h,000h	; b625
	defb 002h,00eh,04ah,000h	; b629
	defb 002h,00eh,0bah,000h	; b62d
	defb 004h,001h,088h,030h	; b631
	defb 004h,001h,088h,070h	; b635
	defb 005h,00eh,062h,000h	; b639
	defb 005h,005h,055h,000h	; b63d
	defb 005h,005h,095h,000h	; b641
	defb 006h,001h,048h,0b0h	; b645
	defb 006h,001h,0a8h,0b0h	; b649
	defb 007h,001h,0a8h,030h	; b64d
	defb 007h,001h,038h,050h	; b651
	defb 007h,001h,0c8h,0b0h	; b655
	defb 008h,001h,0a0h,030h	; b659
	defb 008h,001h,038h,070h	; b65d
	defb 008h,001h,098h,0b0h	; b661
	defb 009h,00fh,026h,000h	; b665
	defb 009h,00fh,043h,000h	; b669
	defb 009h,00fh,048h,000h	; b66d
	defb 009h,005h,0b1h,000h	; b671
	defb 00ah,005h,041h,000h	; b675
	defb 00ah,005h,0b1h,000h	; b679
	defb 00bh,009h,090h,060h	; b67d
	defb 00bh,00ch,0c3h,000h	; b681
	defb 00bh,00ch,057h,000h	; b685
	defb 00bh,00ch,08bh,000h	; b689
	defb 00ch,00ah,028h,030h	; b68d
	defb 00ch,00ah,028h,0b0h	; b691
	defb 00ch,00ah,0b8h,0b0h	; b695
	defb 0ffh,0ffh,0ffh,0ffh	; b699

; ----------------------------------------------------------------------
; DATOS lista_b12b_B69D: registros de 4 bytes [pantalla][n][..][..] y uno de
;   cierre FF FF FF FF (p02:91BE para en el primer 0xFF; los otros tres no se
;   leen); el segundo byte indexa p09:B70D (p02:91D2); lo leen p02:9195 (112
;   bytes)
;   0xb69d..0xb70d  (112 bytes)
DATA_lista_b12b_B69D:
	defb 001h,001h,0c8h,030h	; b69d
	defb 001h,001h,088h,0b0h	; b6a1
	defb 003h,002h,010h,000h	; b6a5
	defb 004h,002h,010h,000h	; b6a9
	defb 004h,002h,010h,000h	; b6ad
	defb 005h,00dh,070h,068h	; b6b1
	defb 005h,00dh,0a0h,068h	; b6b5
	defb 005h,00eh,042h,000h	; b6b9
	defb 005h,00eh,072h,000h	; b6bd
	defb 005h,00eh,08ah,000h	; b6c1
	defb 005h,00eh,0aah,000h	; b6c5
	defb 006h,007h,070h,020h	; b6c9
	defb 006h,007h,050h,0a0h	; b6cd
	defb 006h,007h,0b0h,0a0h	; b6d1
	defb 007h,001h,048h,030h	; b6d5
	defb 007h,001h,098h,060h	; b6d9
	defb 007h,001h,048h,0a0h	; b6dd
	defb 008h,00ch,073h,000h	; b6e1
	defb 008h,00ch,067h,000h	; b6e5
	defb 008h,00ch,04bh,000h	; b6e9
	defb 009h,00dh,030h,020h	; b6ed
	defb 009h,00dh,060h,0a0h	; b6f1
	defb 009h,009h,080h,068h	; b6f5
	defb 00ah,00ah,018h,030h	; b6f9
	defb 00ah,00ah,038h,0b0h	; b6fd
	defb 00ah,00ah,088h,0b0h	; b701
	defb 00bh,002h,010h,000h	; b705
	defb 0ffh,0ffh,0ffh,0ffh	; b709

; ----------------------------------------------------------------------
; DATOS tabla_p91D2: 61 bytes que p02:91D3 lee con el segundo byte de cada
;   registro de p09:B12B (menos 1); lo leen p02:91D2 (61 bytes)
;   0xb70d..0xb74a  (61 bytes)
DATA_tabla_p91D2:
	defb 003h,003h,001h,002h,001h,002h,002h,001h,002h,003h,001h,001h,002h,001h,001h,000h	; b70d  ................
	defb 000h,000h,000h,003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b71d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b72d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b73d  .............

; ----------------------------------------------------------------------
; DATOS paleta_por_indice: 55 bytes: 0 sin paleta o 1-8, la paleta de p09:B781
;   (p02:8280); lo leen p02:827F (55 bytes)
;   0xb74a..0xb781  (55 bytes)
DATA_paleta_por_indice:
	defb 001h,002h,002h,003h,001h,001h,004h,000h,000h,000h,000h,002h,000h,000h,000h,000h	; b74a  ................
	defb 000h,000h,000h,002h,000h,000h,000h,000h,000h,000h,000h,000h,000h,005h,006h,007h	; b75a  ................
	defb 008h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b76a  ................
	defb 000h,000h,000h,000h,000h,000h,000h	; b77a

; ----------------------------------------------------------------------
; DATOS paletas_b781: 8 palabras: las 8 paletas de p02:828A; lo leen p02:827F
;   (16 bytes)
;   0xb781..0xb791  (16 bytes)
DATA_paletas_b781:
	defb 091h,0b7h	; b781
	defb 098h,0b7h	; b783
	defb 09fh,0b7h	; b785
	defb 0a6h,0b7h	; b787
	defb 0adh,0b7h	; b789
	defb 0b4h,0b7h	; b78b
	defb 0bbh,0b7h	; b78d
	defb 0c2h,0b7h	; b78f

; ----------------------------------------------------------------------
; DATOS paleta_b781_1: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p02:827F (7 bytes)
;   0xb791..0xb798  (7 bytes)
DATA_paleta_b781_1:
	defb 007h,054h,006h	; b791
	defb 008h,032h,004h	; b794
	defb 0ffh	; b797

; ----------------------------------------------------------------------
; DATOS paleta_b781_2: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p02:827F (7 bytes)
;   0xb798..0xb79f  (7 bytes)
DATA_paleta_b781_2:
	defb 007h,051h,003h	; b798
	defb 008h,060h,005h	; b79b
	defb 0ffh	; b79e

; ----------------------------------------------------------------------
; DATOS paleta_b781_3: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p02:827F (7 bytes)
;   0xb79f..0xb7a6  (7 bytes)
DATA_paleta_b781_3:
	defb 007h,075h,003h	; b79f
	defb 008h,043h,002h	; b7a2
	defb 0ffh	; b7a5

; ----------------------------------------------------------------------
; DATOS paleta_b781_4: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p02:827F (7 bytes)
;   0xb7a6..0xb7ad  (7 bytes)
DATA_paleta_b781_4:
	defb 007h,047h,006h	; b7a6
	defb 008h,014h,004h	; b7a9
	defb 0ffh	; b7ac

; ----------------------------------------------------------------------
; DATOS paleta_b781_5: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p02:827F (7 bytes)
;   0xb7ad..0xb7b4  (7 bytes)
DATA_paleta_b781_5:
	defb 007h,063h,006h	; b7ad
	defb 008h,052h,004h	; b7b0
	defb 0ffh	; b7b3

; ----------------------------------------------------------------------
; DATOS paleta_b781_6: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p02:827F (7 bytes)
;   0xb7b4..0xb7bb  (7 bytes)
DATA_paleta_b781_6:
	defb 007h,073h,003h	; b7b4
	defb 008h,050h,000h	; b7b7
	defb 0ffh	; b7ba

; ----------------------------------------------------------------------
; DATOS paleta_b781_7: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p02:827F (7 bytes)
;   0xb7bb..0xb7c2  (7 bytes)
DATA_paleta_b781_7:
	defb 007h,037h,005h	; b7bb
	defb 008h,025h,002h	; b7be
	defb 0ffh	; b7c1

; ----------------------------------------------------------------------
; DATOS paleta_b781_8: paleta: ternas [registro][RB][G] hasta 0xFF; lo leen
;   p02:827F (7 bytes)
;   0xb7c2..0xb7c9  (7 bytes)
DATA_paleta_b781_8:
	defb 007h,033h,006h	; b7c2
	defb 008h,022h,004h	; b7c5
	defb 0ffh	; b7c8

; ----------------------------------------------------------------------
; DATOS registros_b7c9: 21 palabras: el registro de cada (ix+0x0A) (p01:6FA4);
;   lo leen p01:6F9F (42 bytes)
;   0xb7c9..0xb7f3  (42 bytes)
DATA_registros_b7c9:
	defb 0f3h,0b7h	; b7c9
	defb 0f8h,0b7h	; b7cb
	defb 0fdh,0b7h	; b7cd
	defb 006h,0b8h	; b7cf
	defb 013h,0b8h	; b7d1
	defb 024h,0b8h	; b7d3
	defb 029h,0b8h	; b7d5
	defb 032h,0b8h	; b7d7
	defb 03fh,0b8h	; b7d9
	defb 050h,0b8h	; b7db
	defb 061h,0b8h	; b7dd
	defb 06ah,0b8h	; b7df
	defb 073h,0b8h	; b7e1
	defb 084h,0b8h	; b7e3
	defb 08dh,0b8h	; b7e5
	defb 096h,0b8h	; b7e7
	defb 0a7h,0b8h	; b7e9
	defb 0b8h,0b8h	; b7eb
	defb 0bdh,0b8h	; b7ed
	defb 0c2h,0b8h	; b7ef
	defb 0c7h,0b8h	; b7f1

; ----------------------------------------------------------------------
; DATOS registro_b7c9_0: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (5 bytes)
;   0xb7f3..0xb7f8  (5 bytes)
DATA_registro_b7c9_0:
	defb 001h,0f0h,0f8h,010h	; b7f3
	defb 00dh	; b7f7

; ----------------------------------------------------------------------
; DATOS registro_b7c9_1: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (5 bytes)
;   0xb7f8..0xb7fd  (5 bytes)
DATA_registro_b7c9_1:
	defb 001h,0f0h,0f8h,010h	; b7f8
	defb 00ah	; b7fc

; ----------------------------------------------------------------------
; DATOS registro_b7c9_2: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (9 bytes)
;   0xb7fd..0xb806  (9 bytes)
DATA_registro_b7c9_2:
	defb 002h,0f0h,0f0h,014h	; b7fd
	defb 00ah,0f0h,000h,010h	; b801
	defb 00ah	; b805

; ----------------------------------------------------------------------
; DATOS registro_b7c9_3: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (13 bytes)
;   0xb806..0xb813  (13 bytes)
DATA_registro_b7c9_3:
	defb 003h,0f0h,0e8h,014h	; b806
	defb 00ah,0f0h,0f8h,014h	; b80a
	defb 00ah,0f0h,008h,010h	; b80e
	defb 00ah	; b812

; ----------------------------------------------------------------------
; DATOS registro_b7c9_4: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (17 bytes)
;   0xb813..0xb824  (17 bytes)
DATA_registro_b7c9_4:
	defb 004h,0f0h,0e0h,014h	; b813
	defb 00ah,0f0h,0f0h,014h	; b817
	defb 00ah,0f0h,000h,014h	; b81b
	defb 00ah,0f0h,008h,010h	; b81f
	defb 00ah	; b823

; ----------------------------------------------------------------------
; DATOS registro_b7c9_5: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (5 bytes)
;   0xb824..0xb829  (5 bytes)
DATA_registro_b7c9_5:
	defb 001h,0f0h,0f8h,018h	; b824
	defb 00ah	; b828

; ----------------------------------------------------------------------
; DATOS registro_b7c9_6: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (9 bytes)
;   0xb829..0xb832  (9 bytes)
DATA_registro_b7c9_6:
	defb 002h,0f0h,0f0h,018h	; b829
	defb 00ah,0f0h,000h,01ch	; b82d
	defb 00ah	; b831

; ----------------------------------------------------------------------
; DATOS registro_b7c9_7: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (13 bytes)
;   0xb832..0xb83f  (13 bytes)
DATA_registro_b7c9_7:
	defb 003h,0f0h,0e8h,018h	; b832
	defb 00ah,0f0h,0f8h,01ch	; b836
	defb 00ah,0f0h,008h,01ch	; b83a
	defb 00ah	; b83e

; ----------------------------------------------------------------------
; DATOS registro_b7c9_8: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (17 bytes)
;   0xb83f..0xb850  (17 bytes)
DATA_registro_b7c9_8:
	defb 004h,0f0h,0e0h,018h	; b83f
	defb 00ah,0f0h,0f0h,01ch	; b843
	defb 00ah,0f0h,000h,01ch	; b847
	defb 00ah,0f0h,008h,01ch	; b84b
	defb 00ah	; b84f

; ----------------------------------------------------------------------
; DATOS registro_b7c9_9: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (17 bytes)
;   0xb850..0xb861  (17 bytes)
DATA_registro_b7c9_9:
	defb 004h,0e0h,0ffh,010h	; b850
	defb 006h,0e0h,0ffh,014h	; b854
	defb 049h,0f0h,0ffh,018h	; b858
	defb 006h,0f0h,0ffh,01ch	; b85c
	defb 049h	; b860

; ----------------------------------------------------------------------
; DATOS registro_b7c9_10: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (9 bytes)
;   0xb861..0xb86a  (9 bytes)
DATA_registro_b7c9_10:
	defb 002h,0f0h,0ffh,010h	; b861
	defb 006h,0f0h,0ffh,014h	; b865
	defb 049h	; b869

; ----------------------------------------------------------------------
; DATOS registro_b7c9_11: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (9 bytes)
;   0xb86a..0xb873  (9 bytes)
DATA_registro_b7c9_11:
	defb 002h,0e8h,008h,010h	; b86a
	defb 006h,0e8h,008h,014h	; b86e
	defb 049h	; b872

; ----------------------------------------------------------------------
; DATOS registro_b7c9_12: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (17 bytes)
;   0xb873..0xb884  (17 bytes)
DATA_registro_b7c9_12:
	defb 004h,0e0h,0f1h,010h	; b873
	defb 006h,0e0h,0f1h,014h	; b877
	defb 049h,0f0h,0f1h,018h	; b87b
	defb 006h,0f0h,0f1h,01ch	; b87f
	defb 049h	; b883

; ----------------------------------------------------------------------
; DATOS registro_b7c9_13: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (9 bytes)
;   0xb884..0xb88d  (9 bytes)
DATA_registro_b7c9_13:
	defb 002h,0f0h,0f1h,010h	; b884
	defb 006h,0f0h,0f1h,014h	; b888
	defb 049h	; b88c

; ----------------------------------------------------------------------
; DATOS registro_b7c9_14: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (9 bytes)
;   0xb88d..0xb896  (9 bytes)
DATA_registro_b7c9_14:
	defb 002h,0e8h,0e8h,010h	; b88d
	defb 006h,0e8h,0e8h,014h	; b891
	defb 049h	; b895

; ----------------------------------------------------------------------
; DATOS registro_b7c9_15: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (17 bytes)
;   0xb896..0xb8a7  (17 bytes)
DATA_registro_b7c9_15:
	defb 004h,0e0h,0f0h,010h	; b896
	defb 00dh,0f0h,0f0h,014h	; b89a
	defb 00dh,0e0h,000h,018h	; b89e
	defb 00dh,0f0h,000h,01ch	; b8a2
	defb 00dh	; b8a6

; ----------------------------------------------------------------------
; DATOS registro_b7c9_16: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (17 bytes)
;   0xb8a7..0xb8b8  (17 bytes)
DATA_registro_b7c9_16:
	defb 004h,0e0h,0f0h,018h	; b8a7
	defb 00dh,0f0h,0f0h,01ch	; b8ab
	defb 00dh,0e0h,000h,010h	; b8af
	defb 00dh,0f0h,000h,014h	; b8b3
	defb 00dh	; b8b7

; ----------------------------------------------------------------------
; DATOS registro_b7c9_17: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (5 bytes)
;   0xb8b8..0xb8bd  (5 bytes)
DATA_registro_b7c9_17:
	defb 001h,0f0h,0f8h,010h	; b8b8
	defb 00dh	; b8bc

; ----------------------------------------------------------------------
; DATOS registro_b7c9_18: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (5 bytes)
;   0xb8bd..0xb8c2  (5 bytes)
DATA_registro_b7c9_18:
	defb 001h,0f0h,0f8h,014h	; b8bd
	defb 00dh	; b8c1

; ----------------------------------------------------------------------
; DATOS registro_b7c9_19: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (5 bytes)
;   0xb8c2..0xb8c7  (5 bytes)
DATA_registro_b7c9_19:
	defb 001h,0f0h,0f8h,018h	; b8c2
	defb 00dh	; b8c6

; ----------------------------------------------------------------------
; DATOS registro_b7c9_20: [n] y n x 4 bytes que p01:6FC2 copia a 0xDE00 +
;   (ix+0x0C) * 4; lo leen p01:6F9F (5 bytes)
;   0xb8c7..0xb8cc  (5 bytes)
DATA_registro_b7c9_20:
	defb 001h,0f0h,0f8h,01ch	; b8c7
	defb 00dh	; b8cb

; ======================================================================
; CODIGO 0xb8cc..0xb923  (87 bytes)
; ======================================================================


pantalla_vecina:		; 0xC212 = la vecina del lado 0xC215 (0xC218-0xC21B)
	ld a,(0c215h)		;b8cc   ; lee el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld hl,0c218h		;b8cf   ; apunta a la vecina de arriba
	dec a			;b8d2   ; + lado - 1: la vecina de ese lado
	add a,l			;b8d3
	ld l,a			;b8d4
	jr nc,L_B8D8		;b8d5
	inc h			;b8d7
L_B8D8:
	ld a,(hl)			;b8d8
	cp 0ffh		;b8d9   ; 0xFF: sin vecina, nada
	ret z			;b8db
	and a			;b8dc   ; 0: el lado lleva fuera de la fase
	jr z,L_B8E3		;b8dd
	ld (0c212h),a		;b8df   ; la vecina es la pantalla nueva
	ret			;b8e2
L_B8E3:
	ld a,001h		;b8e3   ; 0xC226 = 1: se sale de la fase
	ld (0c226h),a		;b8e5   ; guarda se sale de la fase
	ret			;b8e8
vecinas_de_la_pantalla:		; las cuatro vecinas de la pantalla de p09:B921[0xC211] a 0xC218-0xC21B
	ld a,(0c211h)		;b8e9   ; lee la fase (1-25: ruina * 5 + puerta)
	add a,a			;b8ec   ; 2 bytes por fase en p09:B921
	ld hl,L_B920+1		;b8ed
	add a,l			;b8f0
	ld l,a			;b8f1
	jr nc,L_B8F5		;b8f2
	inc h			;b8f4
L_B8F5:
	ld e,(hl)			;b8f5   ; la tabla de la fase; 2 bytes por pantalla (0xC212 - 1)
	inc hl			;b8f6
	ld d,(hl)			;b8f7
	ex de,hl			;b8f8   ; HL = la tabla de la fase
	ld a,(0c212h)		;b8f9   ; la pantalla - 1...
	dec a			;b8fc
	add a,a			;b8fd   ; ...* 2 bytes
	add a,l			;b8fe
	ld l,a			;b8ff
	jr nc,L_B903		;b900
	inc h			;b902
L_B903:
	ld de,0c218h		;b903   ; apunta a la vecina de arriba
	ld b,004h		;b906   ; 4 vecinas: arriba, abajo, izquierda y derecha
L_B908:
	ld a,(hl)			;b908   ; los nibbles de cada byte: primero el alto
	bit 0,b		;b909   ; con B par (4 y 2), el nibble alto
	jr nz,L_B911		;b90b
	rrca			;b90d
	rrca			;b90e
	rrca			;b90f
	rrca			;b910
L_B911:
	and 00fh		;b911   ; el nibble
	cp 00fh		;b913   ; 0x0F: sin vecina (0xFF)
	jr nz,L_B919		;b915
	ld a,0ffh		;b917
L_B919:
	ld (de),a			;b919   ; a 0xC218 + lado
	inc de			;b91a
	bit 0,b		;b91b   ; tras el nibble bajo, el byte siguiente
	jr z,L_B920		;b91d
	inc hl			;b91f
L_B920:
	djnz L_B908		;b920
	ret			;b922

; ----------------------------------------------------------------------
; DATOS vecinas_de_fase: 25 palabras: las vecinas de cada fase 1-25 (p09:B8ED:
;   p09:B921[0xC211]); lo leen p09:B8E9 (50 bytes)
;   0xb923..0xb955  (50 bytes)
DATA_vecinas_de_fase:
	defb 057h,0b9h	; b923
	defb 067h,0b9h	; b925
	defb 07dh,0b9h	; b927
	defb 08fh,0b9h	; b929
	defb 055h,0b9h	; b92b
	defb 09fh,0b9h	; b92d
	defb 0b1h,0b9h	; b92f
	defb 0c9h,0b9h	; b931
	defb 0dfh,0b9h	; b933
	defb 055h,0b9h	; b935
	defb 0efh,0b9h	; b937
	defb 0ffh,0b9h	; b939
	defb 011h,0bah	; b93b
	defb 027h,0bah	; b93d
	defb 055h,0b9h	; b93f
	defb 041h,0bah	; b941
	defb 05bh,0bah	; b943
	defb 06dh,0bah	; b945
	defb 083h,0bah	; b947
	defb 055h,0b9h	; b949
	defb 099h,0bah	; b94b
	defb 0afh,0bah	; b94d
	defb 0cbh,0bah	; b94f
	defb 0e5h,0bah	; b951
	defb 055h,0b9h	; b953

; ----------------------------------------------------------------------
; DATOS vecinas_fase_05: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; se
;   solapan 2 bloques: (vecinas_fase_01 B957-B967); lo leen p09:B8E9 (18
;   bytes)
;   0xb955..0xb967  (18 bytes)
DATA_vecinas_fase_05:
	defb 0ffh,0ffh	; b955
	defb 0ffh,002h	; b957
	defb 0ffh,013h	; b959
	defb 0ffh,024h	; b95b
	defb 0ffh,035h	; b95d
	defb 0ffh,046h	; b95f
	defb 0ffh,057h	; b961
	defb 0ffh,068h	; b963
	defb 0ffh,07fh	; b965

; ----------------------------------------------------------------------
; DATOS vecinas_fase_02: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (22 bytes)
;   0xb967..0xb97d  (22 bytes)
DATA_vecinas_fase_02:
	defb 0ffh,002h	; b967
	defb 0ffh,013h	; b969
	defb 0f4h,02fh	; b96b
	defb 03fh,0f5h	; b96d
	defb 0f6h,04fh	; b96f
	defb 05fh,0f7h	; b971
	defb 0f8h,06fh	; b973
	defb 07fh,0f9h	; b975
	defb 0ffh,08ah	; b977
	defb 0ffh,09bh	; b979
	defb 0ffh,0afh	; b97b

; ----------------------------------------------------------------------
; DATOS vecinas_fase_03: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (18 bytes)
;   0xb97d..0xb98f  (18 bytes)
DATA_vecinas_fase_03:
	defb 0ffh,002h	; b97d
	defb 03fh,01fh	; b97f
	defb 0f2h,0f4h	; b981
	defb 0ffh,035h	; b983
	defb 08fh,046h	; b985
	defb 07fh,05fh	; b987
	defb 0f6h,08fh	; b989
	defb 0f5h,097h	; b98b
	defb 0ffh,0f8h	; b98d

; ----------------------------------------------------------------------
; DATOS vecinas_fase_04: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (16 bytes)
;   0xb98f..0xb99f  (16 bytes)
DATA_vecinas_fase_04:
	defb 03fh,00fh	; b98f
	defb 0ffh,03fh	; b991
	defb 071h,042h	; b993
	defb 0ffh,053h	; b995
	defb 0ffh,064h	; b997
	defb 0ffh,0f5h	; b999
	defb 0f3h,08fh	; b99b
	defb 0ffh,0f7h	; b99d

; ----------------------------------------------------------------------
; DATOS vecinas_fase_06: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (18 bytes)
;   0xb99f..0xb9b1  (18 bytes)
DATA_vecinas_fase_06:
	defb 0ffh,002h	; b99f
	defb 0f3h,01fh	; b9a1
	defb 024h,0ffh	; b9a3
	defb 035h,0ffh	; b9a5
	defb 046h,0ffh	; b9a7
	defb 057h,0ffh	; b9a9
	defb 06fh,0f8h	; b9ab
	defb 0ffh,079h	; b9ad
	defb 0ffh,08fh	; b9af

; ----------------------------------------------------------------------
; DATOS vecinas_fase_07: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (24 bytes)
;   0xb9b1..0xb9c9  (24 bytes)
DATA_vecinas_fase_07:
	defb 0ffh,002h	; b9b1
	defb 0f3h,01fh	; b9b3
	defb 026h,0f4h	; b9b5
	defb 0f7h,035h	; b9b7
	defb 0f8h,04fh	; b9b9
	defb 03fh,0f7h	; b9bb
	defb 04fh,068h	; b9bd
	defb 05fh,079h	; b9bf
	defb 0ffh,08ah	; b9c1
	defb 0bfh,09fh	; b9c3
	defb 0fah,0fch	; b9c5
	defb 0ffh,0bfh	; b9c7

; ----------------------------------------------------------------------
; DATOS vecinas_fase_08: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (22 bytes)
;   0xb9c9..0xb9df  (22 bytes)
DATA_vecinas_fase_08:
	defb 02fh,00fh	; b9c9
	defb 051h,0f3h	; b9cb
	defb 06fh,024h	; b9cd
	defb 07fh,03fh	; b9cf
	defb 082h,0f6h	; b9d1
	defb 093h,057h	; b9d3
	defb 0a4h,06fh	; b9d5
	defb 0f5h,0f9h	; b9d7
	defb 0f6h,08ah	; b9d9
	defb 0f7h,09bh	; b9db
	defb 0ffh,0afh	; b9dd

; ----------------------------------------------------------------------
; DATOS vecinas_fase_09: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (16 bytes)
;   0xb9df..0xb9ef  (16 bytes)
DATA_vecinas_fase_09:
	defb 02fh,00fh	; b9df
	defb 031h,0ffh	; b9e1
	defb 042h,0ffh	; b9e3
	defb 0f3h,085h	; b9e5
	defb 0ffh,046h	; b9e7
	defb 0ffh,057h	; b9e9
	defb 0ffh,06fh	; b9eb
	defb 0ffh,0f4h	; b9ed

; ----------------------------------------------------------------------
; DATOS vecinas_fase_11: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (16 bytes)
;   0xb9ef..0xb9ff  (16 bytes)
DATA_vecinas_fase_11:
	defb 02fh,0f0h	; b9ef
	defb 031h,0ffh	; b9f1
	defb 042h,0ffh	; b9f3
	defb 053h,0ffh	; b9f5
	defb 064h,0ffh	; b9f7
	defb 075h,0ffh	; b9f9
	defb 0f6h,0f8h	; b9fb
	defb 0ffh,07fh	; b9fd

; ----------------------------------------------------------------------
; DATOS vecinas_fase_12: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (18 bytes)
;   0xb9ff..0xba11  (18 bytes)
DATA_vecinas_fase_12:
	defb 08fh,002h	; b9ff
	defb 0ffh,013h	; ba01
	defb 04fh,02fh	; ba03
	defb 053h,0ffh	; ba05
	defb 064h,0ffh	; ba07
	defb 075h,0ffh	; ba09
	defb 0f6h,09fh	; ba0b
	defb 0f1h,0ffh	; ba0d
	defb 0ffh,0f7h	; ba0f

; ----------------------------------------------------------------------
; DATOS vecinas_fase_13: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (22 bytes)
;   0xba11..0xba27  (22 bytes)
DATA_vecinas_fase_13:
	defb 053h,002h	; ba11
	defb 064h,01fh	; ba13
	defb 01fh,0f4h	; ba15
	defb 02fh,03fh	; ba17
	defb 0f1h,0f6h	; ba19
	defb 072h,05fh	; ba1b
	defb 086h,0ffh	; ba1d
	defb 0f7h,0f9h	; ba1f
	defb 0afh,08fh	; ba21
	defb 0f9h,0fbh	; ba23
	defb 0ffh,0afh	; ba25

; ----------------------------------------------------------------------
; DATOS vecinas_fase_14: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (26 bytes)
;   0xba27..0xba41  (26 bytes)
DATA_vecinas_fase_14:
	defb 0ffh,002h	; ba27
	defb 03fh,01fh	; ba29
	defb 042h,0ffh	; ba2b
	defb 0f3h,0f5h	; ba2d
	defb 0ffh,046h	; ba2f
	defb 07fh,05fh	; ba31
	defb 086h,0ffh	; ba33
	defb 0f7h,09fh	; ba35
	defb 0ffh,0a8h	; ba37
	defb 0bfh,0f9h	; ba39
	defb 0cah,0ffh	; ba3b
	defb 0fbh,0fdh	; ba3d
	defb 0ffh,0cfh	; ba3f

; ----------------------------------------------------------------------
; DATOS vecinas_fase_16: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (26 bytes)
;   0xba41..0xba5b  (26 bytes)
DATA_vecinas_fase_16:
	defb 05fh,020h	; ba41
	defb 06fh,031h	; ba43
	defb 07fh,042h	; ba45
	defb 08fh,0f3h	; ba47
	defb 091h,06fh	; ba49
	defb 0a2h,075h	; ba4b
	defb 0b3h,086h	; ba4d
	defb 0c4h,0f7h	; ba4f
	defb 0f5h,0adh	; ba51
	defb 0f6h,0b9h	; ba53
	defb 0f7h,0cah	; ba55
	defb 0f8h,0fbh	; ba57
	defb 0ffh,09fh	; ba59

; ----------------------------------------------------------------------
; DATOS vecinas_fase_17: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (18 bytes)
;   0xba5b..0xba6d  (18 bytes)
DATA_vecinas_fase_17:
	defb 0ffh,020h	; ba5b
	defb 0ffh,031h	; ba5d
	defb 0ffh,042h	; ba5f
	defb 0ffh,053h	; ba61
	defb 0ffh,064h	; ba63
	defb 0ffh,075h	; ba65
	defb 0ffh,086h	; ba67
	defb 0ffh,097h	; ba69
	defb 0ffh,0f8h	; ba6b

; ----------------------------------------------------------------------
; DATOS vecinas_fase_18: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (22 bytes)
;   0xba6d..0xba83  (22 bytes)
DATA_vecinas_fase_18:
	defb 0ffh,020h	; ba6d
	defb 0f3h,0f1h	; ba6f
	defb 02fh,04fh	; ba71
	defb 0f5h,0f3h	; ba73
	defb 04fh,06fh	; ba75
	defb 0ffh,075h	; ba77
	defb 08fh,0f6h	; ba79
	defb 0f7h,09fh	; ba7b
	defb 0afh,0f8h	; ba7d
	defb 0f9h,0bfh	; ba7f
	defb 0ffh,0fah	; ba81

; ----------------------------------------------------------------------
; DATOS vecinas_fase_19: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (22 bytes)
;   0xba83..0xba99  (22 bytes)
DATA_vecinas_fase_19:
	defb 0ffh,020h	; ba83
	defb 0ffh,031h	; ba85
	defb 04fh,0f2h	; ba87
	defb 083h,05fh	; ba89
	defb 07fh,0f4h	; ba8b
	defb 0ffh,0f7h	; ba8d
	defb 0f5h,068h	; ba8f
	defb 0f4h,079h	; ba91
	defb 0afh,08fh	; ba93
	defb 0f9h,0fbh	; ba95
	defb 0ffh,0afh	; ba97

; ----------------------------------------------------------------------
; DATOS vecinas_fase_21: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (22 bytes)
;   0xba99..0xbaaf  (22 bytes)
DATA_vecinas_fase_21:
	defb 05fh,002h	; ba99
	defb 06fh,013h	; ba9b
	defb 07fh,024h	; ba9d
	defb 08fh,03fh	; ba9f
	defb 091h,0f6h	; baa1
	defb 0a2h,057h	; baa3
	defb 0b3h,068h	; baa5
	defb 0f4h,07fh	; baa7
	defb 0f5h,0fah	; baa9
	defb 0f6h,09bh	; baab
	defb 0ffh,0afh	; baad

; ----------------------------------------------------------------------
; DATOS vecinas_fase_22: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (28 bytes)
;   0xbaaf..0xbacb  (28 bytes)
DATA_vecinas_fase_22:
	defb 0ffh,002h	; baaf
	defb 0ffh,013h	; bab1
	defb 06fh,024h	; bab3
	defb 07fh,035h	; bab5
	defb 08fh,04fh	; bab7
	defb 093h,0f7h	; bab9
	defb 0a4h,068h	; babb
	defb 0b5h,07ch	; babd
	defb 0f6h,0fah	; babf
	defb 0f7h,09bh	; bac1
	defb 0f8h,0afh	; bac3
	defb 0ffh,08dh	; bac5
	defb 0ffh,0ceh	; bac7
	defb 0ffh,0dfh	; bac9

; ----------------------------------------------------------------------
; DATOS vecinas_fase_23: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (26 bytes)
;   0xbacb..0xbae5  (26 bytes)
DATA_vecinas_fase_23:
	defb 0f4h,002h	; bacb
	defb 0f5h,01fh	; bacd
	defb 0f7h,0ffh	; bacf
	defb 01fh,0f5h	; bad1
	defb 02fh,046h	; bad3
	defb 0ffh,057h	; bad5
	defb 039h,068h	; bad7
	defb 0fah,07fh	; bad9
	defb 07fh,0fah	; badb
	defb 08fh,09bh	; badd
	defb 0fch,0afh	; badf
	defb 0bfh,0dfh	; bae1
	defb 0ffh,0fch	; bae3

; ----------------------------------------------------------------------
; DATOS vecinas_fase_24: 2 bytes por pantalla: arriba/abajo/izquierda/derecha
;   a nibbles (p09:B8E9, lados de p06:B66A); 0xF no hay salida, 0 sale; lo
;   leen p09:B8E9 (24 bytes)
;   0xbae5..0xbafd  (24 bytes)
DATA_vecinas_fase_24:
	defb 02fh,00fh	; bae5
	defb 031h,0ffh	; bae7
	defb 0f2h,0f4h	; bae9
	defb 0ffh,035h	; baeb
	defb 0f6h,04fh	; baed
	defb 058h,0f7h	; baef
	defb 0f9h,06fh	; baf1
	defb 06bh,0f9h	; baf3
	defb 07ah,08fh	; baf5
	defb 09fh,0bfh	; baf7
	defb 08fh,0cah	; baf9
	defb 0ffh,0fbh	; bafb

; ----------------------------------------------------------------------
; DATOS fichas_por_personaje: 2 x 3 x 4 numeros de ficha (p00:5AD5, segun
;   0xC240); lo leen p00:5AD5 (24 bytes)
;   0xbafd..0xbb15  (24 bytes)
DATA_fichas_por_personaje:
	defb 0c0h,0c1h,0c0h,0c1h	; bafd
	defb 0c6h,0c4h,0c8h,0c5h	; bb01
	defb 0c7h,0c2h,0c7h,0c3h	; bb05
	defb 0c0h,0c1h,0c6h,0c7h	; bb09
	defb 0c2h,0c3h,0cah,0cbh	; bb0d
	defb 0c4h,0c5h,0c8h,0c9h	; bb11

; ----------------------------------------------------------------------
; DATOS fichas_c240_1_colores: tabla de colores de la lista fichas_c240_1
;   (L_529C indexa con c >> 4); se solapan 2 bloques: (fichas_c240_0_colores
;   BB15-BB1D); lo leen p00:5A38 (8 bytes)
;   0xbb15..0xbb1d  (8 bytes)
DATA_fichas_c240_1_colores:
	defb 01dh,0bbh	; bb15
	defb 021h,0bbh	; bb17
	defb 025h,0bbh	; bb19
	defb 029h,0bbh	; bb1b

; ----------------------------------------------------------------------
; DATOS fichas_c240_0_col0: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 2 bloques: (fichas_c240_1_col0
;   BB1D-BB21); lo leen p00:5A38 (4 bytes)
;   0xbb1d..0xbb21  (4 bytes)
DATA_fichas_c240_0_col0:
	defb 000h,006h,009h,00fh	; bb1d

; ----------------------------------------------------------------------
; DATOS fichas_c240_0_col1: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 2 bloques: (fichas_c240_1_col1
;   BB21-BB25); lo leen p00:5A38 (4 bytes)
;   0xbb21..0xbb25  (4 bytes)
DATA_fichas_c240_0_col1:
	defb 000h,006h,00dh,00fh	; bb21

; ----------------------------------------------------------------------
; DATOS colores_bb25: 4 colores a los que apunta la tercera palabra de
;   p09:BB15; las listas de p09:BB32 no la usan; lo leen p00:5A38 (4 bytes)
;   0xbb25..0xbb29  (4 bytes)
DATA_colores_bb25:
	defb 006h,009h,00dh,00fh	; bb25

; ----------------------------------------------------------------------
; DATOS fichas_c240_0_col3: 8 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5A38 (8 bytes)
;   0xbb29..0xbb31  (8 bytes)
DATA_fichas_c240_0_col3:
	defb 000h,006h,009h,00dh,00fh,000h,006h,00bh	; bb29  ........

; ----------------------------------------------------------------------
; DATOS byte_bb31: un byte entre los colores de p09:BB29 y la tabla p09:BB32;
;   ninguna instruccion lo lee; lo leen nadie (1 bytes)
;   0xbb31..0xbb32  (1 bytes)
DATA_byte_bb31:
	defb 00fh	; bb31

; ----------------------------------------------------------------------
; DATOS fichas_por_c240: 2 palabras: la lista de p00:5A38 segun 0xC240; lo
;   leen p00:5A38 (4 bytes)
;   0xbb32..0xbb36  (4 bytes)
DATA_fichas_por_c240:
	defb 036h,0bbh	; bb32
	defb 049h,0bbh	; bb34

; ----------------------------------------------------------------------
; DATOS fichas_c240_0: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5A38 (19 bytes)
;   0xbb36..0xbb49  (19 bytes)
DATA_fichas_c240_0:
	defb 003h,002h,000h,098h,002h,056h	; bb36
	defb 0bbh,012h,008h,098h,004h,076h	; bb3c
	defb 0bbh,034h,018h,098h,004h,0b6h	; bb42
	defb 0bbh	; bb48

; ----------------------------------------------------------------------
; DATOS fichas_c240_1: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5A38 (13 bytes)
;   0xbb49..0xbb56  (13 bytes)
DATA_fichas_c240_1:
	defb 002h,002h,000h,098h,00ah,016h	; bb49
	defb 0bch,012h,028h,098h,002h,0b6h	; bb4f
	defb 0bch	; bb55

; ----------------------------------------------------------------------
; DATOS fichas_c240_0_f0: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_c240_0; lo leen p00:5A38 (32 bytes)
;   0xbb56..0xbb76  (32 bytes)
DATA_fichas_c240_0_f0:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,013h,013h,00fh,00ch,02eh,029h	; bb56  ...............)
	defb 000h,000h,000h,000h,000h,000h,010h,010h,0e8h,0e8h,0f8h,018h,01ch,0ech,03ah,0cah	; bb66  ..............:.

; ----------------------------------------------------------------------
; DATOS fichas_c240_0_f1: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 1 de la lista fichas_c240_0; lo leen p00:5A38 (64 bytes)
;   0xbb76..0xbbb6  (64 bytes)
DATA_fichas_c240_0_f1:
	defb 0f8h,088h,0f0h,010h,0e0h,020h,0c0h,048h,0feh,07eh,0ffh,001h,0feh,03eh,0f8h,078h	; bb76  ..... .H.~...>.x
	defb 0f8h,00bh,0f0h,013h,0e0h,024h,0c0h,040h,0feh,07eh,0ffh,001h,0feh,03eh,0f8h,078h	; bb86  .....$.@.~...>.x
	defb 0f0h,010h,0f0h,0f0h,0feh,01eh,0f7h,01dh,0e3h,03eh,0f7h,09dh,07eh,0cah,07ch,0c4h	; bb96  .........>..~.|.
	defb 0f0h,010h,0f0h,0f0h,0feh,01eh,0e7h,03dh,0cbh,07eh,0c3h,07fh,0e6h,03eh,0fch,09ch	; bba6  .......=.~...>..

; ----------------------------------------------------------------------
; DATOS fichas_c240_0_f2: 4 fichas de 8x8 a 3 bit(s) por punto (24 bytes cada
;   una), entrada 2 de la lista fichas_c240_0; lo leen p00:5A38 (96 bytes)
;   0xbbb6..0xbc16  (96 bytes)
DATA_fichas_c240_0_f2:
	defb 00ah,005h,010h,010h,00fh,020h,000h,01eh,021h,001h,038h,046h,004h,070h,08bh,00bh,063h,094h,016h,046h,0a9h,017h,047h,0a8h	; bbb6  ..... ..!.8F.p..c..F..G.
	defb 00bh,063h,094h,00ch,020h,053h,00fh,000h,030h,017h,000h,028h,00fh,000h,010h,003h,000h,00ch,001h,000h,00ah,008h,000h,017h	; bbce  .c.. S..0..(............
	defb 00ah,005h,010h,010h,00fh,020h,000h,01eh,021h,001h,038h,046h,007h,070h,088h,00dh,060h,092h,01ah,042h,0a5h,017h,047h,0a8h	; bbe6  ..... ..!.8F.p..`..B..G.
	defb 00ah,062h,095h,00dh,020h,052h,00fh,000h,030h,017h,000h,028h,00fh,000h,010h,003h,000h,00ch,001h,000h,00ah,008h,000h,017h	; bbfe  .b.. R..0..(............

; ----------------------------------------------------------------------
; DATOS fichas_c240_1_f0: 10 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_c240_1; lo leen p00:5A38 (160 bytes)
;   0xbc16..0xbcb6  (160 bytes)
DATA_fichas_c240_1_f0:
	defb 000h,000h,000h,000h,000h,000h,007h,007h,01ch,01bh,038h,027h,061h,05fh,067h,05ah	; bc16  ..........8'a_gZ
	defb 000h,000h,000h,000h,0f8h,0f8h,03ch,0c4h,006h,0fah,00ah,0f6h,089h,0f7h,0ddh,067h	; bc26  ......<........g
	defb 0c7h,0bch,09fh,0f8h,0bfh,0e0h,0bfh,0e0h,07bh,064h,0fbh,0a5h,0ffh,080h,0ffh,080h	; bc36  ........{d......
	defb 09eh,0fah,0feh,072h,0feh,002h,0feh,002h,0f6h,00ah,0f6h,02ah,0feh,002h,0ffh,001h	; bc46  ...r.......*....
	defb 07fh,06fh,01fh,01ch,013h,01fh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bc56  .o..............
	defb 0ffh,0f9h,0feh,006h,0b8h,078h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bc66  .....x..........
	defb 000h,000h,007h,007h,01ch,01bh,038h,027h,061h,05fh,063h,05eh,0c7h,0bch,09fh,0f8h	; bc76  ......8'a_c^....
	defb 0f8h,0f8h,01ch,0e4h,046h,0bah,032h,0ceh,08fh,0f1h,0c7h,07dh,09eh,0fah,0feh,072h	; bc86  ....F.2....}...r
	defb 000h,000h,007h,007h,00fh,00ch,013h,01fh,000h,000h,000h,000h,000h,000h,000h,000h	; bc96  ................
	defb 000h,000h,0f0h,0f0h,0f8h,008h,0b0h,070h,000h,000h,000h,000h,000h,000h,000h,000h	; bca6  .......p........

; ----------------------------------------------------------------------
; DATOS fichas_c240_1_f1: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 1 de la lista fichas_c240_1; lo leen p00:5A38 (32 bytes)
;   0xbcb6..0xbcd6  (32 bytes)
DATA_fichas_c240_1_f1:
	defb 0ffh,0a0h,0fch,0a3h,07bh,067h,0f9h,0a7h,0fch,083h,0ffh,080h,07fh,06fh,010h,01fh	; bcb6  ....{g.......o..
	defb 0feh,002h,0e6h,01ah,05ah,0beh,04ah,0beh,0e6h,01ah,0ffh,001h,0ffh,0f9h,006h,0feh	; bcc6  ....Z.J.........

; ----------------------------------------------------------------------
; DATOS por_ruina_bcd6: 5 palabras: la tabla de cada ruina (p01:6044); lo leen
;   p01:603E (10 bytes)
;   0xbcd6..0xbce0  (10 bytes)
DATA_por_ruina_bcd6:
	defb 0e0h,0bch	; bcd6
	defb 045h,0bdh	; bcd8
	defb 0aah,0bdh	; bcda
	defb 00dh,0beh	; bcdc
	defb 06ch,0beh	; bcde

; ----------------------------------------------------------------------
; DATOS demo_por_ruina: las teclas de la demo de cada ruina (p09:BCD6): pares
;   [teclas][cuadros] que p01:6017 va leyendo; 0xFF acaba la demo; lo leen
;   p01:603E (499 bytes)
;   0xbce0..0xbed3  (499 bytes)
DATA_demo_por_ruina:
	defb 008h,0c0h	; bce0
	defb 009h,007h	; bce2
	defb 000h,025h	; bce4
	defb 008h,00dh	; bce6
	defb 009h,00bh	; bce8
	defb 008h,012h	; bcea
	defb 000h,004h	; bcec
	defb 001h,005h	; bcee
	defb 000h,00bh	; bcf0
	defb 004h,005h	; bcf2
	defb 005h,00ah	; bcf4
	defb 004h,011h	; bcf6
	defb 008h,019h	; bcf8
	defb 018h,009h	; bcfa
	defb 008h,00bh	; bcfc
	defb 018h,005h	; bcfe
	defb 008h,02eh	; bd00
	defb 018h,008h	; bd02
	defb 008h,051h	; bd04
	defb 000h,016h	; bd06
	defb 004h,019h	; bd08
	defb 00ch,001h	; bd0a
	defb 008h,004h	; bd0c
	defb 000h,016h	; bd0e
	defb 010h,00ch	; bd10
	defb 000h,002h	; bd12
	defb 008h,012h	; bd14
	defb 000h,006h	; bd16
	defb 004h,015h	; bd18
	defb 00ch,001h	; bd1a
	defb 008h,004h	; bd1c
	defb 000h,01eh	; bd1e
	defb 010h,00ah	; bd20
	defb 000h,007h	; bd22
	defb 008h,00fh	; bd24
	defb 009h,007h	; bd26
	defb 008h,00bh	; bd28
	defb 009h,01eh	; bd2a
	defb 008h,001h	; bd2c
	defb 00ch,003h	; bd2e
	defb 004h,011h	; bd30
	defb 005h,00bh	; bd32
	defb 004h,00dh	; bd34
	defb 000h,005h	; bd36
	defb 010h,007h	; bd38
	defb 000h,002h	; bd3a
	defb 004h,03fh	; bd3c
	defb 005h,003h	; bd3e
	defb 001h,02ah	; bd40
	defb 005h,003h	; bd42
	defb 0ffh,008h	; bd44
	defb 043h,000h	; bd46
	defb 02ah,008h	; bd48
	defb 05ch,009h	; bd4a
	defb 002h,001h	; bd4c
	defb 01eh,000h	; bd4e
	defb 004h,001h	; bd50
	defb 00ah,000h	; bd52
	defb 004h,004h	; bd54
	defb 00dh,000h	; bd56
	defb 018h,010h	; bd58
	defb 009h,000h	; bd5a
	defb 004h,004h	; bd5c
	defb 007h,005h	; bd5e
	defb 00ah,004h	; bd60
	defb 007h,005h	; bd62
	defb 00ch,004h	; bd64
	defb 062h,005h	; bd66
	defb 013h,004h	; bd68
	defb 010h,005h	; bd6a
	defb 003h,001h	; bd6c
	defb 01dh,009h	; bd6e
	defb 003h,008h	; bd70
	defb 00eh,009h	; bd72
	defb 010h,008h	; bd74
	defb 009h,009h	; bd76
	defb 009h,008h	; bd78
	defb 007h,018h	; bd7a
	defb 009h,008h	; bd7c
	defb 04bh,018h	; bd7e
	defb 006h,008h	; bd80
	defb 013h,009h	; bd82
	defb 00ch,008h	; bd84
	defb 028h,000h	; bd86
	defb 01fh,004h	; bd88
	defb 045h,014h	; bd8a
	defb 007h,004h	; bd8c
	defb 00fh,006h	; bd8e
	defb 004h,002h	; bd90
	defb 027h,00ah	; bd92
	defb 005h,008h	; bd94
	defb 010h,000h	; bd96
	defb 004h,008h	; bd98
	defb 001h,009h	; bd9a
	defb 00ah,000h	; bd9c
	defb 014h,008h	; bd9e
	defb 003h,000h	; bda0
	defb 020h,008h	; bda2
	defb 001h,009h	; bda4
	defb 00ah,008h	; bda6
	defb 001h,0ffh	; bda8
	defb 004h,08ah	; bdaa
	defb 005h,002h	; bdac
	defb 001h,042h	; bdae
	defb 000h,003h	; bdb0
	defb 008h,002h	; bdb2
	defb 018h,00ah	; bdb4
	defb 008h,011h	; bdb6
	defb 018h,00bh	; bdb8
	defb 008h,022h	; bdba
	defb 018h,004h	; bdbc
	defb 010h,001h	; bdbe
	defb 000h,005h	; bdc0
	defb 010h,004h	; bdc2
	defb 000h,002h	; bdc4
	defb 010h,002h	; bdc6
	defb 000h,003h	; bdc8
	defb 010h,002h	; bdca
	defb 000h,003h	; bdcc
	defb 010h,002h	; bdce
	defb 000h,003h	; bdd0
	defb 010h,002h	; bdd2
	defb 000h,002h	; bdd4
	defb 010h,002h	; bdd6
	defb 000h,003h	; bdd8
	defb 010h,002h	; bdda
	defb 000h,003h	; bddc
	defb 010h,002h	; bdde
	defb 000h,003h	; bde0
	defb 010h,003h	; bde2
	defb 000h,003h	; bde4
	defb 010h,003h	; bde6
	defb 000h,003h	; bde8
	defb 010h,004h	; bdea
	defb 000h,00ch	; bdec
	defb 010h,003h	; bdee
	defb 000h,002h	; bdf0
	defb 010h,003h	; bdf2
	defb 000h,002h	; bdf4
	defb 010h,002h	; bdf6
	defb 000h,003h	; bdf8
	defb 010h,002h	; bdfa
	defb 000h,003h	; bdfc
	defb 010h,002h	; bdfe
	defb 000h,007h	; be00
	defb 004h,01dh	; be02
	defb 005h,00fh	; be04
	defb 000h,008h	; be06
	defb 008h,003h	; be08
	defb 018h,008h	; be0a
	defb 0ffh,004h	; be0c
	defb 0b7h,000h	; be0e
	defb 009h,004h	; be10
	defb 02eh,010h	; be12
	defb 009h,000h	; be14
	defb 009h,004h	; be16
	defb 012h,014h	; be18
	defb 001h,010h	; be1a
	defb 009h,000h	; be1c
	defb 00eh,004h	; be1e
	defb 006h,014h	; be20
	defb 008h,010h	; be22
	defb 001h,000h	; be24
	defb 005h,004h	; be26
	defb 083h,000h	; be28
	defb 001h,008h	; be2a
	defb 014h,000h	; be2c
	defb 002h,004h	; be2e
	defb 02eh,005h	; be30
	defb 001h,001h	; be32
	defb 01ah,009h	; be34
	defb 002h,008h	; be36
	defb 018h,000h	; be38
	defb 005h,008h	; be3a
	defb 003h,000h	; be3c
	defb 00ch,008h	; be3e
	defb 01fh,00ch	; be40
	defb 001h,004h	; be42
	defb 015h,000h	; be44
	defb 005h,001h	; be46
	defb 004h,000h	; be48
	defb 004h,008h	; be4a
	defb 016h,000h	; be4c
	defb 001h,004h	; be4e
	defb 018h,000h	; be50
	defb 005h,004h	; be52
	defb 00ch,00ch	; be54
	defb 001h,008h	; be56
	defb 00dh,009h	; be58
	defb 002h,001h	; be5a
	defb 014h,009h	; be5c
	defb 001h,008h	; be5e
	defb 006h,009h	; be60
	defb 00ah,008h	; be62
	defb 00fh,000h	; be64
	defb 009h,004h	; be66
	defb 020h,005h	; be68
	defb 00dh,0ffh	; be6a
	defb 000h,008h	; be6c
	defb 008h,029h	; be6e
	defb 000h,01eh	; be70
	defb 010h,008h	; be72
	defb 000h,026h	; be74
	defb 010h,008h	; be76
	defb 000h,027h	; be78
	defb 010h,008h	; be7a
	defb 000h,026h	; be7c
	defb 010h,008h	; be7e
	defb 000h,027h	; be80
	defb 010h,009h	; be82
	defb 000h,027h	; be84
	defb 010h,009h	; be86
	defb 000h,028h	; be88
	defb 010h,006h	; be8a
	defb 000h,007h	; be8c
	defb 008h,06bh	; be8e
	defb 000h,013h	; be90
	defb 008h,00ch	; be92
	defb 000h,00ch	; be94
	defb 009h,009h	; be96
	defb 0f6h,009h	; be98
	defb 0f6h,009h	; be9a
	defb 0f6h,009h	; be9c
	defb 0f6h,009h	; be9e
	defb 000h,000h	; bea0
	defb 000h,000h	; bea2
	defb 0ffh,001h	; bea4
	defb 000h,00ah	; bea6
	defb 008h,02bh	; bea8
	defb 000h,012h	; beaa
	defb 010h,008h	; beac
	defb 000h,028h	; beae
	defb 010h,006h	; beb0
	defb 000h,026h	; beb2
	defb 010h,006h	; beb4
	defb 000h,00dh	; beb6
	defb 010h,005h	; beb8
	defb 000h,01fh	; beba
	defb 010h,009h	; bebc
	defb 000h,02ah	; bebe
	defb 010h,005h	; bec0
	defb 000h,029h	; bec2
	defb 010h,007h	; bec4
	defb 000h,027h	; bec6
	defb 010h,007h	; bec8
	defb 000h,006h	; beca
	defb 008h,069h	; becc
	defb 000h,011h	; bece
	defb 008h,006h	; bed0
	defb 0ffh	; bed2

; ----------------------------------------------------------------------
; DATOS jefe_de_cada_fase: [X][Y][tipo] del jefe de cada fase, 3 bytes por
;   fase (cero en las salas 5): los tipos 0x1E-0x21 en el mismo orden en las
;   cinco ruinas; p02:9056 los copia a 0xC319 y p03:A9C0 crea el jefe; lo leen
;   p02:9050 (74 bytes)
;   0xbed3..0xbf1d  (74 bytes)
DATA_jefe_de_cada_fase:
	defb 080h,0c4h,01eh	; bed3
	defb 080h,064h,01fh	; bed6
	defb 078h,0c4h,020h	; bed9
	defb 0b0h,0c4h,021h	; bedc
	defb 000h,000h,000h	; bedf
	defb 0b0h,044h,01eh	; bee2
	defb 038h,0a4h,01fh	; bee5
	defb 090h,0c4h,020h	; bee8
	defb 070h,084h,021h	; beeb
	defb 000h,000h,000h	; beee
	defb 090h,0c4h,01eh	; bef1
	defb 070h,064h,01fh	; bef4
	defb 0a0h,0c4h,020h	; bef7
	defb 080h,0c4h,021h	; befa
	defb 000h,000h,000h	; befd
	defb 080h,0c4h,01eh	; bf00
	defb 070h,074h,01fh	; bf03
	defb 080h,094h,020h	; bf06
	defb 080h,0b4h,021h	; bf09
	defb 000h,000h,000h	; bf0c
	defb 080h,094h,01eh	; bf0f
	defb 080h,094h,01fh	; bf12
	defb 080h,0c4h,020h	; bf15
	defb 080h,084h,021h	; bf18
	defb 000h,000h	; bf1b

; ----------------------------------------------------------------------
; DATOS por_fase_bf1d: un byte por fase (p00:5F2C, p01:7DF3:
;   p09:BF1D[0xC211]): Y en el nibble alto y el lado en el bajo; se solapan 2
;   bloques: (por_fase_bf35 BF35-BF69); lo leen p00:5F26, p01:7CBA (76 bytes)
;   0xbf1d..0xbf69  (76 bytes)
DATA_por_fase_bf1d:
	defb 000h,0c1h,0c1h,0c1h,041h,0c1h,0c1h,041h,0c1h,0c1h,0c1h,0cfh,0c1h,0c1h,061h,0c1h	; bf1d  ....A..A......a.
	defb 0cfh,0cfh,0cfh,0cfh,0c1h,0a1h,0c1h,041h,0c1h,0c1h,007h,00fh,00ah,00fh,008h,030h	; bf2d  .......A.......0
	defb 007h,000h,000h,000h,008h,00fh,00bh,00fh,00ah,06fh,004h,000h,000h,000h,007h,02fh	; bf3d  .........o...../
	defb 007h,020h,00ah,00fh,00ch,04fh,000h,000h,009h,05fh,008h,000h,00ah,080h,00ah,08fh	; bf4d  . ...O..._......
	defb 000h,000h,00ah,00fh,00dh,00fh,00ch,000h,00bh,000h,000h,000h	; bf5d  ............

; ----------------------------------------------------------------------
; DATOS relleno_ff: 151 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (151 bytes)
;   0xbf69..0xc000  (151 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf69  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf79  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf89  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf99  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfa9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff9
