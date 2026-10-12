; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 07 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS graficos_de_ruina: 5 x [tabla de colores][lista de fichas] de cada
;   ruina (p00:5286); lo leen p00:5286 (20 bytes)
;   0x6000..0x6014  (20 bytes)
DATA_graficos_de_ruina:
	defb 072h,069h,098h,069h	; 6000
	defb 0dbh,071h,0f7h,071h	; 6004
	defb 088h,077h,0aeh,077h	; 6008
	defb 09bh,07ah,0bbh,07ah	; 600c
	defb 0c6h,080h,0f8h,080h	; 6010

; ----------------------------------------------------------------------
; DATOS caracteres_p5354: 2 x 5 caracteres de 1 bit (p00:5357 y p00:5363,
;   L_4CCC con B = 5); lo leen p00:5354 (80 bytes)
;   0x6014..0x6064  (80 bytes)
DATA_caracteres_p5354:
	defb 0fch,078h,078h,078h,078h,078h,078h,078h	; 6014  .xxxxxxx
	defb 0e0h,040h,04fh,05ch,058h,05ch,05fh,04fh	; 601c  .@O\X\_O
	defb 000h,000h,023h,0e6h,064h,024h,007h,0c4h	; 6024  ..#.d$..
	defb 000h,000h,0f1h,0fbh,07bh,07bh,0f9h,07ah	; 602c  ....{{.z
	defb 000h,000h,0f4h,09ch,08ch,0e4h,0f8h,07ch	; 6034  .......|
	defb 03ch,01fh,000h,000h,000h,000h,000h,000h	; 603c  <.......
	defb 083h,021h,010h,019h,00fh,000h,003h,003h	; 6044  .!......
	defb 0e4h,0e4h,0eeh,0e0h,0c0h,000h,000h,000h	; 604c  ........
	defb 07ah,07bh,0feh,000h,000h,000h,000h,000h	; 6054  z{......
	defb 01ch,01ch,0f8h,000h,000h,000h,000h,000h	; 605c  ........

; ----------------------------------------------------------------------
; DATOS fichas_p51B3_colores: tabla de colores de la lista fichas_p51B3
;   (L_529C indexa con c >> 4); se solapan 6 bloques:
;   (fichas_antesala_0_colores 6064-606A) (fichas_antesala_2_colores
;   6064-606A) (fichas_antesala_3_colores 6064-606C)
;   (fichas_antesala_1_colores 6064-6070) (fichas_antesala_4_colores
;   6064-607C); lo leen p00:51B3, p00:5155 (24 bytes)
;   0x6064..0x607c  (24 bytes)
DATA_fichas_p51B3_colores:
	defb 07eh,060h	; 6064
	defb 082h,060h	; 6066
	defb 086h,060h	; 6068
	defb 088h,060h	; 606a
	defb 08ch,060h	; 606c
	defb 090h,060h	; 606e
	defb 094h,060h	; 6070
	defb 098h,060h	; 6072
	defb 09ch,060h	; 6074
	defb 0a0h,060h	; 6076
	defb 0a4h,060h	; 6078
	defb 0a8h,060h	; 607a

; ----------------------------------------------------------------------
; DATOS resto_607C: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (2 bytes)
;   0x607c..0x607e  (2 bytes)
DATA_resto_607C:
	defb 0ach,060h	; 607c

; ----------------------------------------------------------------------
; DATOS fichas_p51B3_col0: 2 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 14 bloques: (fichas_antesala_0_col0 607E-6080)
;   (fichas_antesala_2_col0 607E-6080) (fichas_antesala_3_col0 607E-6080)
;   (fichas_p51B3_col0 607E-6082) (fichas_p51B3_col0 607E-6082)
;   (fichas_antesala_0_col0 607E-6082) (fichas_antesala_0_col0 607E-6082)
;   (fichas_antesala_2_col0 607E-6082) (fichas_antesala_2_col0 607E-6082)
;   (fichas_antesala_2_col0 607E-6082) (fichas_antesala_2_col0 607E-6082)
;   (fichas_antesala_3_col0 607E-6082) (fichas_antesala_3_col0 607E-6082); lo
;   leen p00:51B3, p00:5155 (4 bytes)
;   0x607e..0x6082  (4 bytes)
DATA_fichas_p51B3_col0:
	defb 008h,00fh	; 607e
	defb 007h,006h	; 6080

; ----------------------------------------------------------------------
; DATOS fichas_p51B3_col1: 2 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 9 bloques: (fichas_antesala_0_col1 6082-6084)
;   (fichas_antesala_2_col1 6082-6084) (fichas_p51B3_col1 6082-6086)
;   (fichas_p51B3_col1 6082-6086) (fichas_antesala_0_col1 6082-6086)
;   (fichas_antesala_0_col1 6082-6086) (fichas_antesala_2_col1 6082-6086)
;   (fichas_antesala_2_col1 6082-6086); lo leen p00:51B3, p00:5155 (4 bytes)
;   0x6082..0x6086  (4 bytes)
DATA_fichas_p51B3_col1:
	defb 003h,00fh	; 6082
	defb 001h,002h	; 6084

; ----------------------------------------------------------------------
; DATOS fichas_p51B3_col2: 2 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 8 bloques: (fichas_p51B3_col2 6086-6088)
;   (fichas_antesala_0_col2 6086-6088) (fichas_antesala_0_col2 6086-6088)
;   (fichas_antesala_1_col2 6086-6088) (fichas_antesala_2_col2 6086-6088)
;   (fichas_antesala_2_col2 6086-6088) (fichas_antesala_3_col2 6086-6088); lo
;   leen p00:51B3, p00:5155 (2 bytes)
;   0x6086..0x6088  (2 bytes)
DATA_fichas_p51B3_col2:
	defb 001h,00dh	; 6086

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1_col3: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 4 bloques: (fichas_antesala_3_col3
;   6088-608A) (fichas_antesala_1_col3 6088-608C) (fichas_antesala_3_col3
;   6088-608C); lo leen p00:5155 (4 bytes)
;   0x6088..0x608c  (4 bytes)
DATA_fichas_antesala_1_col3:
	defb 002h,003h	; 6088
	defb 001h,006h	; 608a

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1_col4: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 3 bloques: (fichas_antesala_1_col4
;   608C-6090) (fichas_antesala_1_col4 608C-6090); lo leen p00:5155 (4 bytes)
;   0x608c..0x6090  (4 bytes)
DATA_fichas_antesala_1_col4:
	defb 008h,00fh	; 608c
	defb 007h,00dh	; 608e

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1_col5: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 4 bloques: (fichas_antesala_1_col5
;   6090-6094) (fichas_antesala_1_col5 6090-6094) (fichas_antesala_1_col5
;   6090-6094); lo leen p00:5155 (4 bytes)
;   0x6090..0x6094  (4 bytes)
DATA_fichas_antesala_1_col5:
	defb 002h,008h,00fh,007h	; 6090

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_col6: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5155 (2 bytes)
;   0x6094..0x6096  (2 bytes)
DATA_fichas_antesala_4_col6:
	defb 002h,003h	; 6094

; ----------------------------------------------------------------------
; DATOS resto_6096: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (2 bytes)
;   0x6096..0x6098  (2 bytes)
DATA_resto_6096:
	defb 001h,005h	; 6096

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_col7: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 4 bloques: (fichas_antesala_4_col7
;   6098-609C) (fichas_antesala_4_col7 6098-609C) (fichas_antesala_4_col7
;   6098-609C); lo leen p00:5155 (4 bytes)
;   0x6098..0x609c  (4 bytes)
DATA_fichas_antesala_4_col7:
	defb 001h,008h	; 6098
	defb 000h,002h	; 609a

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_col8: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5155 (4 bytes)
;   0x609c..0x60a0  (4 bytes)
DATA_fichas_antesala_4_col8:
	defb 001h,008h,000h,003h	; 609c

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_col9: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5155 (4 bytes)
;   0x60a0..0x60a4  (4 bytes)
DATA_fichas_antesala_4_col9:
	defb 001h,008h,000h,007h	; 60a0

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_col10: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5155 (4 bytes)
;   0x60a4..0x60a8  (4 bytes)
DATA_fichas_antesala_4_col10:
	defb 001h,008h,002h,007h	; 60a4

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_col11: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5155 (4 bytes)
;   0x60a8..0x60ac  (4 bytes)
DATA_fichas_antesala_4_col11:
	defb 001h,008h,003h,007h	; 60a8

; ----------------------------------------------------------------------
; DATOS resto_60AC: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (4 bytes)
;   0x60ac..0x60b0  (4 bytes)
DATA_resto_60AC:
	defb 002h,005h,001h,003h	; 60ac

; ----------------------------------------------------------------------
; DATOS fichas_de_antesala: 5 palabras: la lista de cada antesala (p00:515B);
;   lo leen p00:5155 (10 bytes)
;   0x60b0..0x60ba  (10 bytes)
DATA_fichas_de_antesala:
	defb 0bah,060h	; 60b0
	defb 04dh,061h	; 60b2
	defb 010h,061h	; 60b4
	defb 0ebh,060h	; 60b6
	defb 08ah,061h	; 60b8

; ----------------------------------------------------------------------
; DATOS fichas_antesala_0: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5155 (49 bytes)
;   0x60ba..0x60eb  (49 bytes)
DATA_fichas_antesala_0:
	defb 008h,002h,004h,080h,004h,0f2h	; 60ba
	defb 061h,002h,000h,088h,008h,032h	; 60c0
	defb 062h,000h,020h,088h,002h,0b2h	; 60c6
	defb 062h,012h,040h,088h,00ch,0c2h	; 60cc
	defb 062h,010h,070h,088h,003h,082h	; 60d2
	defb 063h,013h,000h,08ch,00ch,0c2h	; 60d8
	defb 062h,020h,040h,08ch,004h,09ah	; 60de
	defb 063h,021h,050h,08ch,003h,09ah	; 60e4
	defb 063h	; 60ea

; ----------------------------------------------------------------------
; DATOS fichas_antesala_3: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5155 (37 bytes)
;   0x60eb..0x6110  (37 bytes)
DATA_fichas_antesala_3:
	defb 006h,002h,004h,080h,004h,0f2h	; 60eb
	defb 061h,002h,000h,088h,008h,032h	; 60f1
	defb 062h,032h,040h,088h,009h,0bah	; 60f7
	defb 063h,020h,064h,088h,001h,04ah	; 60fd
	defb 064h,030h,000h,08ch,009h,052h	; 6103
	defb 064h,000h,040h,08ch,002h,09ah	; 6109
	defb 064h	; 610f

; ----------------------------------------------------------------------
; DATOS fichas_antesala_2: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5155 (61 bytes)
;   0x6110..0x614d  (61 bytes)
DATA_fichas_antesala_2:
	defb 00ah,002h,004h,080h,004h,0aah	; 6110
	defb 064h,002h,000h,088h,003h,0eah	; 6116
	defb 064h,002h,00ch,088h,002h,01ah	; 611c
	defb 065h,003h,014h,088h,002h,01ah	; 6122
	defb 065h,000h,030h,088h,002h,03ah	; 6128
	defb 065h,012h,040h,088h,00ch,0c2h	; 612e
	defb 062h,010h,070h,088h,003h,082h	; 6134
	defb 063h,013h,000h,08ch,00ch,0c2h	; 613a
	defb 062h,020h,040h,08ch,008h,04ah	; 6140
	defb 065h,021h,000h,090h,007h,04ah	; 6146
	defb 065h	; 614c

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5155 (61 bytes)
;   0x614d..0x618a  (61 bytes)
DATA_fichas_antesala_1:
	defb 00ah,042h,004h,080h,004h,08ah	; 614d
	defb 065h,042h,000h,084h,007h,09ah	; 6153
	defb 065h,052h,040h,084h,004h,00ah	; 6159
	defb 066h,052h,050h,084h,001h,04ah	; 615f
	defb 066h,053h,054h,084h,001h,04ah	; 6165
	defb 066h,052h,058h,084h,002h,05ah	; 616b
	defb 066h,040h,000h,088h,003h,07ah	; 6171
	defb 066h,032h,040h,088h,009h,0bah	; 6177
	defb 063h,020h,064h,088h,001h,04ah	; 617d
	defb 064h,030h,000h,08ch,009h,052h	; 6183
	defb 064h	; 6189

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5155 (55 bytes)
;   0x618a..0x61c1  (55 bytes)
DATA_fichas_antesala_4:
	defb 009h,070h,004h,080h,001h,092h	; 618a
	defb 066h,060h,040h,080h,009h,09ah	; 6190
	defb 066h,092h,000h,084h,016h,0e2h	; 6196
	defb 066h,0b2h,000h,088h,004h,042h	; 619c
	defb 068h,072h,040h,088h,005h,082h	; 61a2
	defb 068h,072h,054h,088h,001h,0d2h	; 61a8
	defb 068h,073h,058h,088h,001h,0d2h	; 61ae
	defb 068h,082h,000h,08ch,003h,0e2h	; 61b4
	defb 068h,0a2h,040h,08ch,006h,012h	; 61ba
	defb 069h	; 61c0

; ----------------------------------------------------------------------
; DATOS fichas_p51B3: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:51B3 (49 bytes)
;   0x61c1..0x61f2  (49 bytes)
DATA_fichas_p51B3:
	defb 008h,002h,004h,080h,004h,0f2h	; 61c1
	defb 061h,002h,000h,088h,008h,032h	; 61c7
	defb 062h,000h,020h,088h,002h,0b2h	; 61cd
	defb 062h,012h,040h,088h,00ch,0c2h	; 61d3
	defb 062h,010h,070h,088h,003h,082h	; 61d9
	defb 063h,013h,000h,08ch,00ch,0c2h	; 61df
	defb 062h,020h,040h,08ch,008h,04ah	; 61e5
	defb 065h,021h,000h,090h,007h,04ah	; 61eb
	defb 065h	; 61f1

; ----------------------------------------------------------------------
; DATOS fichas_p51B3_f0: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_p51B3; se solapan 3 bloques:
;   (fichas_antesala_0_f0 61F2-6232) (fichas_antesala_3_f0 61F2-6232); lo leen
;   p00:51B3, p00:5155 (64 bytes)
;   0x61f2..0x6232  (64 bytes)
DATA_fichas_p51B3_f0:
	defb 06fh,07fh,09dh,0bfh,0efh,0ffh,0f4h,0f7h,018h,0f9h,010h,0feh,044h,07ch,001h,000h	; 61f2  o...........D|..
	defb 0ffh,0c0h,0b6h,0ech,051h,0c0h,095h,0e0h,02eh,0e0h,099h,082h,016h,020h,0e9h,000h	; 6202  ....Q........ ..
	defb 09ah,060h,033h,07dh,002h,0f5h,082h,059h,003h,020h,083h,000h,087h,000h,0ffh,000h	; 6212  .`3}...Y. ......
	defb 062h,077h,0e0h,0feh,043h,0ffh,08ch,0ffh,090h,0dfh,000h,0f4h,040h,048h,001h,000h	; 6222  bw..C.......@H..

; ----------------------------------------------------------------------
; DATOS fichas_p51B3_f1: 8 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 1 de la lista fichas_p51B3; se solapan 3 bloques:
;   (fichas_antesala_0_f1 6232-62B2) (fichas_antesala_3_f1 6232-62B2); lo leen
;   p00:51B3, p00:5155 (128 bytes)
;   0x6232..0x62b2  (128 bytes)
DATA_fichas_p51B3_f1:
	defb 0cbh,000h,0bah,000h,0cch,000h,067h,000h,0a3h,000h,0feh,000h,0a4h,070h,080h,05bh	; 6232  ......g......p.[
	defb 0feh,000h,0abh,000h,0feh,000h,0bfh,000h,0b7h,070h,00bh,0bch,006h,0c9h,0c9h,000h	; 6242  .........p......
	defb 007h,000h,082h,031h,00ah,000h,0a2h,000h,0c3h,000h,0e3h,000h,045h,000h,0ffh,000h	; 6252  ...1........E...
	defb 000h,061h,000h,0fch,000h,0feh,000h,0dch,000h,060h,000h,005h,003h,000h,0ffh,000h	; 6262  .a.......`......
	defb 038h,000h,080h,03fh,080h,01fh,000h,01dh,000h,02eh,000h,03fh,080h,05eh,080h,000h	; 6272  8..?.......?.^..
	defb 083h,000h,001h,0e0h,001h,0b0h,001h,0f0h,001h,070h,003h,080h,003h,000h,007h,000h	; 6282  .........p......
	defb 0ffh,000h,000h,0beh,000h,0f3h,000h,03bh,000h,014h,000h,0c9h,0b9h,000h,0e0h,013h	; 6292  ................
	defb 0e0h,00dh,000h,0dfh,000h,01eh,020h,00eh,000h,000h,020h,000h,0e2h,000h,057h,020h	; 62a2  ...... ... ...W

; ----------------------------------------------------------------------
; DATOS fichas_p51B3_f2: 2 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 2 de la lista fichas_p51B3; se solapan 2 bloques:
;   (fichas_antesala_0_f2 62B2-62C2); lo leen p00:51B3, p00:5155 (16 bytes)
;   0x62b2..0x62c2  (16 bytes)
DATA_fichas_p51B3_f2:
	defb 0a2h,07dh,0ffh,0ffh,07fh,0ffh,0ffh,0ffh	; 62b2  .}......
	defb 007h,091h,0e5h,0f9h,0fdh,0fdh,0f7h,0ffh	; 62ba  ........

; ----------------------------------------------------------------------
; DATOS fichas_p51B3_f3: 12 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 3 de la lista fichas_p51B3; se solapan 6 bloques:
;   (fichas_p51B3_f5 62C2-6382) (fichas_antesala_0_f3 62C2-6382)
;   (fichas_antesala_0_f5 62C2-6382) (fichas_antesala_2_f5 62C2-6382)
;   (fichas_antesala_2_f7 62C2-6382); lo leen p00:51B3, p00:5155 (192 bytes)
;   0x62c2..0x6382  (192 bytes)
DATA_fichas_p51B3_f3:
	defb 0bdh,08ch,01ch,010h,047h,000h,0f3h,000h,0f6h,010h,0ffh,020h,01fh,010h,0bfh,080h	; 62c2  ....G...... ....
	defb 0dfh,000h,0d7h,000h,0fbh,000h,0ffh,000h,0ffh,080h,0c7h,0c0h,03ch,03ch,071h,071h	; 62d2  ............<<qq
	defb 0feh,01eh,0e1h,061h,03dh,029h,0a2h,080h,089h,080h,0c5h,001h,0eeh,002h,03ch,004h	; 62e2  ...a=)........<.
	defb 0efh,004h,0beh,000h,07fh,000h,0ffh,007h,0c1h,000h,0d7h,0d0h,023h,000h,07fh,000h	; 62f2  ............#...
	defb 036h,020h,06fh,040h,0dbh,000h,0ffh,000h,07dh,00ch,0f4h,010h,0c0h,000h,042h,002h	; 6302  6 o@....}.....B.
	defb 098h,098h,03ah,002h,07dh,000h,0dfh,01eh,0b7h,037h,0c2h,042h,048h,040h,0bdh,080h	; 6312  ..:.}....7.BH@..
	defb 078h,020h,0c7h,003h,09ch,014h,04ch,000h,0f7h,020h,0e1h,080h,07bh,048h,02dh,020h	; 6322  x ....L.. ..{H-
	defb 0d6h,000h,006h,000h,03bh,000h,05dh,018h,06dh,064h,04eh,000h,0d4h,080h,01fh,000h	; 6332  ......].mdN.....
	defb 0aeh,004h,043h,001h,039h,039h,051h,050h,047h,004h,082h,000h,0ffh,010h,0ffh,00dh	; 6342  ..C.99QPG.......
	defb 000h,0ffh,000h,0ffh,000h,0feh,001h,0f0h,00eh,0eeh,038h,0f8h,047h,0c0h,09fh,080h	; 6352  ..........8.G...
	defb 01ch,0ffh,062h,0e3h,05dh,04dh,0a2h,082h,089h,080h,0e5h,021h,0eeh,002h,03ch,004h	; 6362  ..b.]M.....!..<.
	defb 000h,0ffh,000h,0ffh,01ch,0fdh,043h,0c3h,03dh,081h,006h,000h,07dh,03ch,071h,071h	; 6372  ......C.=...}<qq

; ----------------------------------------------------------------------
; DATOS fichas_p51B3_f4: 3 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 4 de la lista fichas_p51B3; se solapan 3 bloques:
;   (fichas_antesala_0_f4 6382-639A) (fichas_antesala_2_f6 6382-639A); lo leen
;   p00:51B3, p00:5155 (24 bytes)
;   0x6382..0x639a  (24 bytes)
DATA_fichas_p51B3_f4:
	defb 0a7h,07dh,06bh,0bfh,0e7h,07fh,0ffh,0ffh	; 6382  .}k.....
	defb 0ffh,0ffh,0ffh,0f7h,0ffh,0f7h,0cfh,03fh	; 638a  .......?
	defb 099h,0eeh,0e4h,0f9h,0fbh,0bfh,0f7h,0feh	; 6392  ........

; ----------------------------------------------------------------------
; DATOS fichas_antesala_0_f7: 3 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 7 de la lista fichas_antesala_0; se solapan 2 bloques:
;   (fichas_antesala_0_f6 639A-63BA); lo leen p00:5155 (32 bytes)
;   0x639a..0x63ba  (32 bytes)
DATA_fichas_antesala_0_f7:
	defb 000h,000h,00ah,0c4h,000h,000h,000h,000h	; 639a  ........
	defb 000h,05dh,0efh,090h,001h,048h,032h,004h	; 63a2  .]...H2.
	defb 0b2h,05fh,0fdh,064h,0bdh,0f2h,064h,091h	; 63aa  ._.d..d.
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 63b2  ........

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1_f7: 9 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 7 de la lista fichas_antesala_1; se solapan 2 bloques:
;   (fichas_antesala_3_f2 63BA-644A); lo leen p00:5155 (144 bytes)
;   0x63ba..0x644a  (144 bytes)
DATA_fichas_antesala_1_f7:
	defb 080h,0ffh,0c0h,0ffh,0e0h,07fh,0f0h,05fh,070h,03fh,038h,03fh,0bch,037h,05eh,01bh	; 63ba  ......._p?8?.7^.
	defb 080h,0ffh,0e0h,07fh,0f0h,03fh,0f8h,097h,0fch,073h,0bch,0bbh,07eh,04dh,02fh,025h	; 63ca  .....?...s..~M/%
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,001h,0feh,007h,0fah,03eh,0d8h,0f7h,0c0h	; 63da  ............>...
	defb 001h,0ffh,003h,0fdh,00eh,0f2h,01dh,0cdh,078h,030h,0e7h,040h,0b8h,000h,0c2h,000h	; 63ea  ........x0.@....
	defb 080h,0ffh,0c0h,0bfh,0f0h,04fh,0feh,0b5h,0ffh,06fh,0f7h,073h,03fh,019h,05fh,005h	; 63fa  .....O...o.s?._.
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,080h,07fh,0e0h,0dfh,0fch,07fh,0ffh,0afh	; 640a  ................
	defb 001h,0ffh,007h,0feh,007h,0fch,00eh,0fch,00ch,0f8h,018h,0f0h,072h,0e0h,0e2h,0a0h	; 641a  ............r...
	defb 001h,0ffh,003h,0feh,00eh,0feh,01eh,0f8h,01ch,0f8h,038h,0f0h,065h,0a0h,0c8h,040h	; 642a  ..........8.e..@
	defb 06fh,008h,02fh,00ch,097h,006h,0cfh,003h,0efh,00dh,0a3h,000h,0d3h,002h,0d9h,001h	; 643a  o./.............

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1_f8: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 8 de la lista fichas_antesala_1; se solapan 2 bloques:
;   (fichas_antesala_3_f3 644A-6452); lo leen p00:5155 (8 bytes)
;   0x644a..0x6452  (8 bytes)
DATA_fichas_antesala_1_f8:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 644a  ........

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1_f9: 9 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 9 de la lista fichas_antesala_1; se solapan 2 bloques:
;   (fichas_antesala_3_f4 6452-649A); lo leen p00:5155 (72 bytes)
;   0x6452..0x649a  (72 bytes)
DATA_fichas_antesala_1_f9:
	defb 0e9h,0e4h,0f6h,0e2h,079h,0b8h,0bdh,0deh	; 6452  ....y...
	defb 0ffh,0beh,0efh,0bfh,0fbh,076h,07bh,05dh	; 645a  .....v{]
	defb 035h,03ch,01ah,01ch,00eh,00eh,00fh,00eh	; 6462  5<......
	defb 006h,006h,007h,003h,002h,001h,001h,000h	; 646a  ........
	defb 096h,0a4h,069h,053h,087h,005h,00bh,01bh	; 6472  ..iS....
	defb 015h,001h,00ah,003h,001h,000h,010h,000h	; 647a  ........
	defb 088h,002h,050h,000h,080h,020h,000h,000h	; 6482  ..P.. ..
	defb 0bah,0a0h,0d0h,040h,080h,000h,008h,000h	; 648a  ...@....
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 6492  ........

; ----------------------------------------------------------------------
; DATOS fichas_antesala_3_f5: 2 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 5 de la lista fichas_antesala_3; lo leen p00:5155 (16
;   bytes)
;   0x649a..0x64aa  (16 bytes)
DATA_fichas_antesala_3_f5:
	defb 0a1h,000h,0ach,037h,05dh,07fh,0afh,0ffh	; 649a  ...7]...
	defb 003h,000h,0c1h,0a5h,0f1h,0d1h,0a3h,0ffh	; 64a2  ........

; ----------------------------------------------------------------------
; DATOS fichas_antesala_2_f0: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 0 de la lista fichas_antesala_2; lo leen p00:5155 (64
;   bytes)
;   0x64aa..0x64ea  (64 bytes)
DATA_fichas_antesala_2_f0:
	defb 01dh,07fh,064h,0fdh,001h,06fh,010h,0b5h,04ch,0e2h,016h,041h,021h,00ch,094h,01eh	; 64aa  ..d..o..L..A!...
	defb 067h,0ffh,019h,0ffh,000h,05bh,028h,0beh,010h,04fh,038h,0c3h,042h,098h,036h,03ch	; 64ba  g....[(..O8.B.6<
	defb 08ch,00ch,081h,011h,083h,00fh,081h,03dh,080h,03eh,080h,01fh,080h,000h,0ffh,000h	; 64ca  .......=.>......
	defb 098h,098h,040h,0e5h,0e1h,0f9h,0c1h,0dfh,081h,0bfh,000h,07dh,000h,000h,0ffh,000h	; 64da  ..@........}....

; ----------------------------------------------------------------------
; DATOS fichas_antesala_2_f1: 3 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 1 de la lista fichas_antesala_2; lo leen p00:5155 (48
;   bytes)
;   0x64ea..0x651a  (48 bytes)
DATA_fichas_antesala_2_f1:
	defb 03ch,043h,018h,026h,081h,01ch,0c3h,018h,0c2h,024h,081h,076h,018h,0c3h,03ch,081h	; 64ea  <C.&.....$.v..<.
	defb 03ch,043h,018h,026h,081h,01ch,0c3h,018h,0c2h,024h,099h,040h,024h,000h,05ah,080h	; 64fa  <C.&.....$.@$.Z.
	defb 0ffh,000h,0ffh,000h,000h,0b5h,04ah,000h,000h,06fh,000h,0dah,0ffh,000h,000h,081h	; 650a  ......J..o......

; ----------------------------------------------------------------------
; DATOS fichas_antesala_2_f2: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 2 de la lista fichas_antesala_2; se solapan 2 bloques:
;   (fichas_antesala_2_f3 651A-653A); lo leen p00:5155 (32 bytes)
;   0x651a..0x653a  (32 bytes)
DATA_fichas_antesala_2_f2:
	defb 0ffh,000h,0ffh,000h,05fh,080h,0ffh,000h,08fh,010h,04fh,000h,0ffh,000h,0ffh,000h	; 651a  ...._.....O.....
	defb 0f1h,000h,08bh,020h,085h,010h,043h,018h,042h,024h,081h,076h,018h,0c3h,03ch,081h	; 652a  ... ..C.B$.v..<.

; ----------------------------------------------------------------------
; DATOS fichas_antesala_2_f4: 2 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 4 de la lista fichas_antesala_2; lo leen p00:5155 (16
;   bytes)
;   0x653a..0x654a  (16 bytes)
DATA_fichas_antesala_2_f4:
	defb 001h,0a9h,05fh,0fdh,07bh,0fdh,0ffh,0ffh	; 653a  .._.{...
	defb 010h,09ah,0f5h,0dfh,0b7h,0dfh,0ffh,0ffh	; 6542  ........

; ----------------------------------------------------------------------
; DATOS fichas_p51B3_f7: 7 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 7 de la lista fichas_p51B3; se solapan 4 bloques:
;   (fichas_antesala_2_f9 654A-6582) (fichas_p51B3_f6 654A-658A)
;   (fichas_antesala_2_f8 654A-658A); lo leen p00:51B3, p00:5155 (64 bytes)
;   0x654a..0x658a  (64 bytes)
DATA_fichas_p51B3_f7:
	defb 08eh,047h,04fh,02bh,095h,0c5h,0b3h,0e8h	; 654a  .GO+....
	defb 050h,084h,040h,0c0h,0e8h,0d2h,048h,0b0h	; 6552  P.@...H.
	defb 0f4h,038h,054h,00ch,016h,003h,000h,001h	; 655a  .8T.....
	defb 024h,050h,014h,010h,008h,040h,024h,040h	; 6562  $P...@$@
	defb 074h,018h,027h,000h,0c9h,028h,000h,000h	; 656a  t.'..(..
	defb 080h,044h,0d2h,0e8h,078h,02ah,005h,0a0h	; 6572  .D..x*..
	defb 013h,0c1h,0f9h,07ch,0bfh,0cbh,02dh,084h	; 657a  ...|..-.
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 6582  ........

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1_f0: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 0 de la lista fichas_antesala_1; se solapan 2 bloques:
;   (fichas_antesala_1_f1 659A-660A); lo leen p00:5155 (128 bytes)
;   0x658a..0x660a  (128 bytes)
DATA_fichas_antesala_1_f0:
	defb 079h,07fh,0c4h,07fh,000h,07fh,0e8h,000h,0ffh,0f7h,044h,0f7h,000h,0f7h,000h,000h	; 658a  y.........D.....
	defb 080h,079h,080h,044h,080h,000h,0ffh,000h,008h,0f7h,008h,044h,008h,000h,0ffh,000h	; 659a  .y.D.......D....
	defb 08ch,030h,031h,007h,0c6h,01fh,090h,037h,0a1h,06dh,080h,057h,088h,04dh,020h,097h	; 65aa  .01....7.m.W.M .
	defb 0c0h,038h,0a1h,0c0h,05fh,0e0h,015h,0dah,06ah,0ech,033h,0f4h,013h,0f4h,029h,0feh	; 65ba  .8.._...j.3...).
	defb 040h,002h,040h,0a3h,050h,008h,06ch,002h,0b0h,003h,0fdh,000h,0eah,000h,0ffh,000h	; 65ca  @.@.P.l.........
	defb 000h,06bh,004h,01ch,000h,0d2h,000h,001h,008h,005h,0a1h,00eh,00ah,060h,0ffh,000h	; 65da  .k...........`..
	defb 0ffh,000h,000h,0d8h,0d5h,000h,01ch,0c0h,0f7h,01ch,093h,026h,0c9h,010h,0ffh,000h	; 65ea  ...........&....
	defb 0b8h,041h,0e8h,008h,0c6h,01ch,091h,00ah,0a1h,006h,0b3h,006h,0c2h,008h,0ffh,000h	; 65fa  .A..............

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1_f2: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 2 de la lista fichas_antesala_1; lo leen p00:5155 (64
;   bytes)
;   0x660a..0x664a  (64 bytes)
DATA_fichas_antesala_1_f2:
	defb 007h,000h,02ch,013h,003h,02fh,00fh,07dh,07fh,0b8h,0fch,003h,063h,09fh,00fh,0ffh	; 660a  ..,../.}....c...
	defb 000h,080h,078h,0a0h,0f0h,0cch,0ceh,03bh,03fh,0fch,0feh,0e1h,0f0h,0cfh,0ceh,033h	; 661a  ..x.....?......3
	defb 07fh,0b8h,0fch,003h,063h,09fh,00fh,0ffh,07fh,0b8h,0fch,003h,063h,09fh,00fh,0ffh	; 662a  ....c.......c...
	defb 03fh,0f8h,0feh,0e1h,0f0h,0cfh,0ceh,033h,03fh,0fch,0feh,0e1h,0f0h,0cfh,0ceh,033h	; 663a  ?......3?......3

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1_f3: 1 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 3 de la lista fichas_antesala_1; se solapan 2 bloques:
;   (fichas_antesala_1_f4 664A-665A); lo leen p00:5155 (16 bytes)
;   0x664a..0x665a  (16 bytes)
DATA_fichas_antesala_1_f3:
	defb 000h,0ffh,0ffh,05bh,054h,0abh,0ffh,01bh,054h,0abh,07fh,080h,0ffh,05bh,000h,0ffh	; 664a  ...[T...T....[..

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1_f5: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 5 de la lista fichas_antesala_1; lo leen p00:5155 (32
;   bytes)
;   0x665a..0x667a  (32 bytes)
DATA_fichas_antesala_1_f5:
	defb 013h,000h,00ch,023h,061h,01eh,00fh,070h,07fh,080h,0fch,003h,061h,09eh,00fh,0f0h	; 665a  ...#a..p....a...
	defb 010h,008h,03ah,0c0h,0e0h,01eh,08eh,071h,03fh,0c0h,0fch,003h,0e0h,01fh,08eh,071h	; 666a  ..:....q?......q

; ----------------------------------------------------------------------
; DATOS fichas_antesala_1_f6: 3 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 6 de la lista fichas_antesala_1; lo leen p00:5155 (24
;   bytes)
;   0x667a..0x6692  (24 bytes)
DATA_fichas_antesala_1_f6:
	defb 080h,003h,09eh,0f0h,080h,003h,09eh,0f0h	; 667a  ........
	defb 0c0h,001h,01fh,071h,0c0h,003h,01fh,071h	; 6682  ...q...q
	defb 0ffh,000h,0bfh,000h,0bfh,0b0h,000h,0ffh	; 668a  ........

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_f0: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 0 de la lista fichas_antesala_4; lo leen p00:5155 (8
;   bytes)
;   0x6692..0x669a  (8 bytes)
DATA_fichas_antesala_4_f0:
	defb 0c8h,006h,0e9h,004h,023h,000h,000h,000h	; 6692  ....#...

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_f1: 9 fichas de 8x8 a 1 bit(s) por punto (8 bytes
;   cada una), entrada 1 de la lista fichas_antesala_4; lo leen p00:5155 (72
;   bytes)
;   0x669a..0x66e2  (72 bytes)
DATA_fichas_antesala_4_f1:
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 669a  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 66a2  ........
	defb 010h,010h,010h,010h,010h,010h,010h,010h	; 66aa  ........
	defb 038h,07ch,07ch,0feh,07ch,054h,054h,0feh	; 66b2  8||.|TT.
	defb 0feh,0aah,054h,07ch,07ch,07ch,07ch,07ch	; 66ba  ..T|||||
	defb 07ch,07ch,07ch,07ch,07ch,07ch,07ch,07ch	; 66c2  ||||||||
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,07bh,033h,033h	; 66ca  .....{33
	defb 0fch,0fch,0fch,0fch,0fch,078h,030h,030h	; 66d2  .....x00
	defb 033h,033h,033h,033h,033h,033h,0ffh,0ffh	; 66da  333333..

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_f2: 22 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 2 de la lista fichas_antesala_4; lo leen p00:5155 (352
;   bytes)
;   0x66e2..0x6842  (352 bytes)
DATA_fichas_antesala_4_f2:
	defb 01fh,0c3h,013h,042h,01fh,044h,01fh,042h,01fh,04ch,00ch,040h,01fh,046h,01bh,048h	; 66e2  ...B.D.B.L.@.F.H
	defb 000h,0ffh,0ffh,0e8h,000h,000h,02ah,0aah,015h,0d5h,000h,0ffh,00fh,0c1h,000h,0ffh	; 66f2  ......*.........
	defb 000h,0ffh,0ffh,017h,000h,000h,054h,055h,0a8h,0aah,000h,0feh,0f0h,082h,000h,0feh	; 6702  ......TU........
	defb 0f8h,013h,0f1h,022h,0e8h,0c2h,0d8h,002h,038h,002h,0f8h,062h,0e0h,002h,0f8h,063h	; 6712  ..."....8..b...c
	defb 000h,0ffh,03fh,086h,04eh,08ah,05fh,082h,016h,084h,04dh,080h,005h,080h,000h,080h	; 6722  ..?.N._...M.....
	defb 000h,0ffh,0eeh,00ch,01ah,002h,02ch,004h,058h,008h,0aeh,00ah,00ch,000h,000h,000h	; 6732  ......,.X.......
	defb 000h,0ffh,036h,080h,04ah,080h,052h,080h,076h,094h,05dh,0c0h,035h,080h,000h,080h	; 6742  ..6.J.R.v.].5...
	defb 000h,0ffh,0ech,000h,012h,000h,024h,000h,0d8h,058h,0eeh,0aah,05ch,000h,000h,000h	; 6752  ......$..X..\...
	defb 000h,0ffh,07fh,0b6h,06eh,0cah,07fh,0d2h,076h,094h,05dh,0c0h,035h,080h,000h,080h	; 6762  ....n...v.].5...
	defb 000h,0ffh,0feh,0ech,0bah,012h,07ch,024h,0d8h,058h,0eeh,0aah,05ch,000h,000h,000h	; 6772  ......|$.X..\...
	defb 000h,0ffh,0f0h,0efh,0b8h,013h,07ch,025h,0d8h,059h,0ech,0abh,05ch,000h,000h,000h	; 6782  ......|%.Y..\...
	defb 000h,0ffh,00fh,0f6h,00eh,0eah,03fh,0d2h,036h,0d4h,01dh,0c0h,035h,080h,000h,080h	; 6792  ......?.6...5...
	defb 000h,0ffh,000h,0c9h,000h,0b5h,000h,0adh,014h,089h,040h,0a2h,000h,0cah,000h,0ffh	; 67a2  ..........@.....
	defb 000h,0ffh,000h,013h,000h,0edh,000h,0dbh,058h,027h,0aah,011h,000h,0a3h,000h,0ffh	; 67b2  ........X'......
	defb 0f8h,007h,0f0h,009h,0c0h,035h,0c0h,02dh,014h,029h,0c0h,022h,080h,04ah,000h,0ffh	; 67c2  .....5.-.).".J..
	defb 0ffh,0c9h,0efh,000h,000h,000h,0ffh,00ch,0f3h,0e3h,01eh,012h,0efh,00eh,0f1h,011h	; 67d2  ................
	defb 0eeh,060h,0dfh,0dch,073h,062h,09dh,000h,0ffh,0e5h,0f7h,000h,000h,000h,000h,000h	; 67e2  .`..sb..........
	defb 0ffh,0ffh,0ffh,0deh,0ffh,0ebh,0feh,07ch,0dfh,09ch,0bfh,0abh,077h,015h,0bfh,086h	; 67f2  .......|....w...
	defb 0ffh,0ffh,0ffh,03fh,0ffh,0cbh,0ffh,07ah,0dfh,04dh,056h,044h,0afh,023h,0fbh,0a0h	; 6802  ...?...z.MVD.#..
	defb 037h,023h,0f9h,039h,096h,096h,0ffh,055h,04eh,04ah,027h,005h,021h,001h,018h,000h	; 6812  7#.9...UNJ'.!...
	defb 0e7h,042h,0fbh,0a1h,052h,052h,0fch,038h,08dh,084h,062h,000h,091h,000h,0efh,000h	; 6822  .B..RR.8..b.....
	defb 000h,0ffh,000h,0d6h,000h,0b5h,000h,082h,000h,021h,000h,000h,062h,000h,039h,000h	; 6832  .........!..b.9.

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_f3: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 3 de la lista fichas_antesala_4; lo leen p00:5155 (64
;   bytes)
;   0x6842..0x6882  (64 bytes)
DATA_fichas_antesala_4_f3:
	defb 0f8h,013h,0f0h,023h,0e8h,0c3h,0d8h,003h,038h,003h,0f8h,063h,0e0h,003h,0f8h,063h	; 6842  ...#....8..c...c
	defb 01fh,0c3h,013h,0c2h,01fh,0c4h,01fh,0c2h,01fh,0cch,00ch,0c0h,01fh,0c6h,01bh,0c8h	; 6852  ................
	defb 0f0h,0efh,0e8h,007h,000h,003h,0feh,001h,0feh,001h,0feh,001h,0ffh,000h,0ffh,000h	; 6862  ................
	defb 0f8h,007h,0fch,003h,0fch,003h,0feh,001h,0feh,037h,0f6h,001h,000h,000h,000h,000h	; 6872  .........7......

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_f4: 5 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 4 de la lista fichas_antesala_4; lo leen p00:5155 (80
;   bytes)
;   0x6882..0x68d2  (80 bytes)
DATA_fichas_antesala_4_f4:
	defb 03fh,000h,0c0h,0ffh,0c0h,0c0h,0ffh,0c0h,0f6h,0c0h,0f7h,0d5h,0f7h,0d5h,0f7h,0d5h	; 6882  ?...............
	defb 0fch,000h,003h,0ffh,003h,003h,0ffh,003h,06fh,003h,06fh,02bh,06fh,02bh,06fh,02bh	; 6892  ........o.o+o+o+
	defb 0feh,0feh,0f8h,0ffh,0f1h,0feh,0e0h,0ffh,0e1h,0feh,0c4h,0dah,0c7h,0c8h,0deh,0c0h	; 68a2  ................
	defb 0c7h,0dfh,0d0h,0cfh,0d0h,0c7h,0d0h,0c7h,0d9h,0c2h,0c8h,0c6h,0dbh,0c4h,0dbh,0c0h	; 68b2  ................
	defb 0ffh,0ffh,0ffh,0ffh,03fh,0ffh,01fh,0ffh,007h,07fh,083h,07fh,0c3h,03fh,01bh,027h	; 68c2  ....?........?.'

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_f5: 1 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 5 de la lista fichas_antesala_4; se solapan 2 bloques:
;   (fichas_antesala_4_f6 68D2-68E2); lo leen p00:5155 (16 bytes)
;   0x68d2..0x68e2  (16 bytes)
DATA_fichas_antesala_4_f5:
	defb 000h,0ffh,0ffh,000h,000h,000h,0aah,0aah,0d5h,0d5h,0c0h,0ffh,0cfh,0c0h,0c0h,0ffh	; 68d2  ................

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_f7: 3 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 7 de la lista fichas_antesala_4; lo leen p00:5155 (48
;   bytes)
;   0x68e2..0x6912  (48 bytes)
DATA_fichas_antesala_4_f7:
	defb 01fh,0ffh,007h,017h,003h,0efh,001h,0dbh,059h,027h,0abh,011h,001h,0a3h,000h,0ffh	; 68e2  ........Y'......
	defb 0f8h,0ffh,0f0h,0f9h,0c0h,0f5h,0c0h,0edh,0d4h,0c9h,0c0h,0e2h,080h,0cah,000h,0ffh	; 68f2  ................
	defb 0d8h,0c7h,0d0h,0c9h,0c0h,0f5h,0c0h,0edh,0d4h,0c9h,0c0h,0e2h,080h,0cah,000h,0ffh	; 6902  ................

; ----------------------------------------------------------------------
; DATOS fichas_antesala_4_f8: 6 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 8 de la lista fichas_antesala_4; lo leen p00:5155 (96
;   bytes)
;   0x6912..0x6972  (96 bytes)
DATA_fichas_antesala_4_f8:
	defb 000h,0feh,001h,0f8h,007h,0f1h,00bh,0e2h,00bh,0e2h,014h,0c4h,00bh,0cbh,01eh,0cch	; 6912  ................
	defb 000h,07fh,080h,01fh,0e0h,08fh,070h,067h,0d0h,087h,0f8h,023h,0b8h,023h,048h,043h	; 6922  ......pg...#.#HC
	defb 01fh,0c3h,013h,0c2h,01fh,0c4h,01fh,0c2h,01fh,0cch,00ch,0c0h,01fh,0c6h,01bh,0c8h	; 6932  ................
	defb 0f8h,013h,0f0h,023h,0e8h,0c3h,0d8h,003h,038h,003h,0f8h,063h,0e0h,003h,0f8h,063h	; 6942  ...#....8..c...c
	defb 001h,0feh,001h,0ffh,001h,0ffh,001h,0feh,001h,0ffh,001h,0ffh,001h,0feh,001h,0ffh	; 6952  ................
	defb 000h,07fh,080h,07fh,080h,07fh,000h,07fh,080h,07fh,080h,07fh,000h,07fh,080h,07fh	; 6962  ................

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_colores: tabla de colores de la lista fichas_ruina_0
;   (L_529C indexa con c >> 4); lo leen p00:5286 (10 bytes)
;   0x6972..0x697c  (10 bytes)
DATA_fichas_ruina_0_colores:
	defb 07ch,069h	; 6972
	defb 084h,069h	; 6974
	defb 088h,069h	; 6976
	defb 08ch,069h	; 6978
	defb 090h,069h	; 697a

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_col0: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 10 bloques: (fichas_ruina_0_col0
;   697C-697E) (fichas_ruina_0_col0 697C-697E) (fichas_ruina_0_col0 697C-6980)
;   (fichas_ruina_0_col0 697C-6980) (fichas_ruina_0_col0 697C-6984)
;   (fichas_ruina_0_col0 697C-6984) (fichas_ruina_0_col0 697C-6984)
;   (fichas_ruina_0_col0 697C-6984) (fichas_ruina_0_col0 697C-6984); lo leen
;   p00:5286 (8 bytes)
;   0x697c..0x6984  (8 bytes)
DATA_fichas_ruina_0_col0:
	defb 002h,003h	; 697c
	defb 004h,005h	; 697e
	defb 001h,00bh	; 6980
	defb 00ah,00dh	; 6982

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_col1: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 4 bloques: (fichas_ruina_0_col1
;   6984-6988) (fichas_ruina_0_col1 6984-6988) (fichas_ruina_0_col1
;   6984-6988); lo leen p00:5286 (4 bytes)
;   0x6984..0x6988  (4 bytes)
DATA_fichas_ruina_0_col1:
	defb 001h,005h	; 6984
	defb 002h,004h	; 6986

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_col2: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 5 bloques: (fichas_ruina_0_col2
;   6988-698A) (fichas_ruina_0_col2 6988-698C) (fichas_ruina_0_col2 6988-698C)
;   (fichas_ruina_0_col2 6988-698C); lo leen p00:5286 (4 bytes)
;   0x6988..0x698c  (4 bytes)
DATA_fichas_ruina_0_col2:
	defb 001h,003h	; 6988
	defb 002h,005h	; 698a

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_col3: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 3 bloques: (fichas_ruina_0_col3
;   698C-6990) (fichas_ruina_0_col3 698C-6990); lo leen p00:5286 (4 bytes)
;   0x698c..0x6990  (4 bytes)
DATA_fichas_ruina_0_col3:
	defb 001h,002h,003h,00ah	; 698c

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_col4: 8 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5286 (8 bytes)
;   0x6990..0x6998  (8 bytes)
DATA_fichas_ruina_0_col4:
	defb 00dh,004h,005h,002h,003h,000h,001h,006h	; 6990  ........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5286 (139 bytes)
;   0x6998..0x6a23  (139 bytes)
DATA_fichas_ruina_0:
	defb 017h,004h,004h,080h,004h,023h	; 6998
	defb 06ah,000h,000h,084h,001h,083h	; 699e
	defb 06ah,000h,004h,084h,003h,08bh	; 69a4
	defb 06ah,001h,010h,084h,003h,08bh	; 69aa
	defb 06ah,020h,01ch,084h,001h,0a3h	; 69b0
	defb 06ah,021h,020h,084h,001h,0a3h	; 69b6
	defb 06ah,010h,024h,084h,001h,0abh	; 69bc
	defb 06ah,012h,028h,084h,004h,0b3h	; 69c2
	defb 06ah,012h,038h,084h,006h,0f3h	; 69c8
	defb 06ah,013h,050h,084h,006h,0f3h	; 69ce
	defb 06ah,022h,068h,084h,007h,053h	; 69d4
	defb 06bh,022h,004h,088h,010h,0c3h	; 69da
	defb 06bh,023h,044h,088h,010h,0c3h	; 69e0
	defb 06bh,002h,004h,08ch,002h,0c3h	; 69e6
	defb 06ch,003h,00ch,08ch,002h,0c3h	; 69ec
	defb 06ch,032h,014h,08ch,004h,0e3h	; 69f2
	defb 06ch,032h,024h,08ch,008h,023h	; 69f8
	defb 06dh,033h,044h,08ch,008h,023h	; 69fe
	defb 06dh,004h,064h,08ch,007h,0a3h	; 6a04
	defb 06dh,004h,008h,090h,015h,04bh	; 6a0a
	defb 06eh,004h,05ch,090h,011h,043h	; 6a10
	defb 070h,005h,020h,094h,011h,043h	; 6a16
	defb 070h,044h,064h,094h,001h,0e1h	; 6a1c
	defb 089h	; 6a22

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f0: 4 fichas de 8x8 a 3 bit(s) por punto (24 bytes cada
;   una), entrada 0 de la lista fichas_ruina_0; lo leen p00:5286 (96 bytes)
;   0x6a23..0x6a83  (96 bytes)
DATA_fichas_ruina_0_f0:
	defb 0ffh,000h,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h,0ffh,080h,0ffh,080h,07fh,0bfh,000h,061h,0bfh,021h	; 6a23  .....................a.!
	defb 0ffh,000h,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,000h,000h,000h,0ffh,001h,0ffh,001h,0feh,0ffh,000h,02eh,0ffh,02ch	; 6a3b  .......................,
	defb 05fh,0afh,000h,050h,0a0h,00fh,040h,0bfh,000h,040h,080h,03fh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,000h,000h,0ffh,000h	; 6a53  _..P..@..@.?............
	defb 0feh,0ffh,004h,002h,007h,0f8h,002h,0ffh,000h,000h,001h,0feh,001h,0ffh,001h,0ffh,0ffh,000h,0ffh,000h,000h,000h,0ffh,000h	; 6a6b  ........................

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f1: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 1 de la lista fichas_ruina_0; lo leen p00:5286 (8 bytes)
;   0x6a83..0x6a8b  (8 bytes)
DATA_fichas_ruina_0_f1:
	defb 000h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh	; 6a83  ........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f2: 3 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 2 de la lista fichas_ruina_0; se solapan 2 bloques:
;   (fichas_ruina_0_f3 6A8B-6AA3); lo leen p00:5286 (24 bytes)
;   0x6a8b..0x6aa3  (24 bytes)
DATA_fichas_ruina_0_f2:
	defb 03fh,0fch,05bh,0f7h,0edh,0feh,0b2h,0e9h	; 6a8b  ?.[.....
	defb 0bdh,0bfh,0dbh,0eeh,0b7h,07bh,04eh,017h	; 6a93  .....{N.
	defb 000h,000h,000h,080h,0e0h,0e0h,0f0h,0f0h	; 6a9b  ........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f4: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 4 de la lista fichas_ruina_0; se solapan 2 bloques:
;   (fichas_ruina_0_f5 6AA3-6AAB); lo leen p00:5286 (8 bytes)
;   0x6aa3..0x6aab  (8 bytes)
DATA_fichas_ruina_0_f4:
	defb 0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h,0f8h	; 6aa3  ........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f6: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 6 de la lista fichas_ruina_0; lo leen p00:5286 (8 bytes)
;   0x6aab..0x6ab3  (8 bytes)
DATA_fichas_ruina_0_f6:
	defb 0fah,0fah,0fah,0fah,0fah,0fah,0fah,0fah	; 6aab  ........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f7: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 7 de la lista fichas_ruina_0; lo leen p00:5286 (64 bytes)
;   0x6ab3..0x6af3  (64 bytes)
DATA_fichas_ruina_0_f7:
	defb 000h,0ffh,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh	; 6ab3  ................
	defb 0ffh,0f8h,0f5h,08ah,0d5h,02ah,015h,0c2h,075h,000h,045h,030h,07dh,000h,083h,082h	; 6ac3  .....*..u.E0}...
	defb 0ffh,000h,000h,0ffh,0ffh,000h,0ffh,000h,000h,0ffh,000h,0ffh,000h,000h,000h,0b6h	; 6ad3  ................
	defb 005h,0a0h,005h,0a0h,005h,0a0h,005h,0a0h,005h,0a0h,005h,0a0h,005h,0a0h,005h,0a0h	; 6ae3  ................

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f8: 6 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 8 de la lista fichas_ruina_0; se solapan 2 bloques:
;   (fichas_ruina_0_f9 6AF3-6B53); lo leen p00:5286 (96 bytes)
;   0x6af3..0x6b53  (96 bytes)
DATA_fichas_ruina_0_f8:
	defb 07fh,080h,000h,0efh,00fh,0e0h,00fh,0e0h,000h,0efh,000h,0efh,000h,0e0h,000h,0edh	; 6af3  ................
	defb 07fh,080h,000h,0efh,00fh,0e0h,00fh,0e0h,000h,0efh,000h,0e0h,006h,0e2h,006h,0ebh	; 6b03  ................
	defb 000h,0ffh,000h,000h,080h,000h,080h,0c0h,0bfh,0dfh,03fh,0cfh,000h,0ffh,000h,0ffh	; 6b13  ..........?.....
	defb 0d9h,0afh,0dbh,0eeh,0dbh,0eeh,0eeh,0d5h,0f5h,0eah,0fbh,0f5h,0ffh,0fbh,0ffh,0ffh	; 6b23  ................
	defb 0e6h,01bh,0fbh,0e5h,0fdh,0fah,0feh,0fdh,0ffh,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 6b33  ................
	defb 0bfh,07fh,07fh,0bfh,07fh,0ffh,0ffh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 6b43  ................

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f10: 7 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 10 de la lista fichas_ruina_0; lo leen p00:5286 (112
;   bytes)
;   0x6b53..0x6bc3  (112 bytes)
DATA_fichas_ruina_0_f10:
	defb 001h,016h,001h,016h,001h,016h,001h,016h,001h,016h,001h,016h,001h,016h,001h,016h	; 6b53  ................
	defb 092h,024h,000h,000h,000h,0b6h,092h,024h,000h,000h,000h,0b6h,092h,024h,000h,000h	; 6b63  .$.....$.....$..
	defb 000h,000h,000h,0b6h,092h,024h,000h,000h,000h,0b6h,092h,024h,000h,000h,000h,0b6h	; 6b73  .....$.....$....
	defb 0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h	; 6b83  ................
	defb 005h,0a5h,005h,0a5h,005h,0a5h,005h,0a5h,005h,0a5h,0ffh,000h,0fah,005h,0a0h,058h	; 6b93  ...............X
	defb 0fah,0fah,0fah,0fah,0fah,0fah,0fah,0fah,0fah,0fah,0ffh,000h,005h,0fah,000h,005h	; 6ba3  ................
	defb 001h,016h,001h,016h,001h,016h,001h,016h,001h,016h,0ffh,000h,0ffh,000h,017h,0e8h	; 6bb3  ................

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f11: 16 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 11 de la lista fichas_ruina_0; se solapan 2 bloques:
;   (fichas_ruina_0_f12 6BC3-6CC3); lo leen p00:5286 (256 bytes)
;   0x6bc3..0x6cc3  (256 bytes)
DATA_fichas_ruina_0_f11:
	defb 000h,0efh,000h,0efh,00ch,0e3h,00fh,0e0h,00fh,0e0h,00fh,0e0h,00fh,0e0h,00fh,0e0h	; 6bc3  ................
	defb 000h,0efh,00fh,0e0h,00fh,0e0h,000h,0efh,00fh,0e0h,000h,0efh,000h,0efh,00fh,0e0h	; 6bd3  ................
	defb 00fh,0e0h,00fh,0e0h,00fh,0e0h,00fh,0e0h,00fh,0e0h,00fh,0e0h,00fh,0e0h,00fh,0e0h	; 6be3  ................
	defb 07fh,0ffh,000h,0efh,00fh,0efh,00fh,0efh,000h,0efh,000h,0efh,00fh,0e0h,00fh,0e0h	; 6bf3  ................
	defb 01eh,01fh,0f0h,007h,010h,017h,010h,017h,0f0h,007h,0e0h,017h,000h,007h,000h,0b7h	; 6c03  ................
	defb 0b2h,044h,080h,060h,0a0h,056h,0b2h,044h,080h,060h,0a0h,056h,0b2h,044h,080h,060h	; 6c13  .D.`.V.D.`.V.D.`
	defb 080h,060h,0a0h,056h,0b2h,044h,080h,060h,0a0h,056h,0b2h,044h,080h,060h,0a0h,056h	; 6c23  .`.V.D.`.V.D.`.V
	defb 0f1h,0f0h,00fh,0f0h,0f1h,0f0h,0f1h,0f0h,00fh,0f0h,00fh,0f0h,001h,00eh,00dh,062h	; 6c33  ...............b
	defb 0f8h,007h,0f8h,007h,0f8h,007h,0f8h,000h,0f8h,007h,0f8h,007h,0f8h,000h,0f8h,007h	; 6c43  ................
	defb 03fh,080h,07dh,083h,01bh,0c4h,077h,000h,0edh,000h,0feh,020h,0f2h,040h,0e9h,042h	; 6c53  ?.}...w.... .@.B
	defb 0fdh,040h,0ffh,041h,0fch,025h,0eeh,000h,0b7h,000h,07bh,004h,04dh,0a3h,017h,0e0h	; 6c63  .@.A.%....{.M...
	defb 004h,0e9h,000h,0e0h,000h,0edh,004h,0e9h,000h,0e0h,000h,0edh,004h,0e9h,000h,0e0h	; 6c73  ................
	defb 000h,0e0h,000h,0edh,004h,0e9h,000h,0e0h,000h,0edh,004h,0e9h,000h,0e0h,000h,0edh	; 6c83  ................
	defb 000h,0e7h,0a0h,057h,0b0h,047h,000h,0e7h,0a0h,057h,0b0h,047h,000h,0e7h,0a0h,057h	; 6c93  ...W.G...W.G...W
	defb 0b0h,047h,000h,0e7h,0a0h,057h,0b0h,047h,000h,0e7h,0a0h,057h,0b0h,047h,000h,0e7h	; 6ca3  .G...W.G...W.G..
	defb 0d6h,037h,0e6h,017h,0f6h,00fh,0fah,007h,0fch,003h,0feh,001h,0ffh,000h,0ffh,000h	; 6cb3  .7..............

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f13: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 13 de la lista fichas_ruina_0; se solapan 2 bloques:
;   (fichas_ruina_0_f14 6CC3-6CE3); lo leen p00:5286 (32 bytes)
;   0x6cc3..0x6ce3  (32 bytes)
DATA_fichas_ruina_0_f13:
	defb 0ffh,000h,0feh,000h,0fbh,080h,077h,080h,06dh,080h,05fh,000h,0b3h,000h,0afh,000h	; 6cc3  ......w.m._.....
	defb 03fh,000h,0ffh,000h,05bh,001h,0f6h,001h,0eeh,001h,0feh,000h,0b3h,000h,0e9h,000h	; 6cd3  ?...[...........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f15: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 15 de la lista fichas_ruina_0; lo leen p00:5286 (64
;   bytes)
;   0x6ce3..0x6d23  (64 bytes)
DATA_fichas_ruina_0_f15:
	defb 099h,05ah,099h,05ah,018h,0dbh,000h,000h,0ffh,0ffh,099h,05ah,099h,05ah,018h,0dbh	; 6ce3  .Z.Z.......Z.Z..
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh	; 6cf3  ................
	defb 0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,000h,0ffh,000h,000h,0ffh	; 6d03  ................
	defb 099h,05ah,099h,05ah,099h,05ah,099h,05ah,018h,0dbh,000h,000h,0ffh,0ffh,0ffh,0ffh	; 6d13  .Z.Z.Z.Z........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f16: 8 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 16 de la lista fichas_ruina_0; se solapan 2 bloques:
;   (fichas_ruina_0_f17 6D23-6DA3); lo leen p00:5286 (128 bytes)
;   0x6d23..0x6da3  (128 bytes)
DATA_fichas_ruina_0_f16:
	defb 0e0h,010h,0f7h,00fh,0fbh,007h,0fdh,003h,000h,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh	; 6d23  ................
	defb 01fh,0e0h,00fh,070h,087h,0b8h,0c3h,0dch,0e0h,0efh,000h,000h,0ffh,0ffh,0ffh,0ffh	; 6d33  ...p............
	defb 003h,00ch,071h,0f6h,070h,0f7h,0b8h,07bh,038h,0fbh,000h,000h,0ffh,0ffh,0ffh,0ffh	; 6d43  ..q.p..{8.......
	defb 0ffh,000h,0ffh,000h,000h,0ffh,000h,000h,0ffh,0ffh,07fh,080h,03fh,0c0h,000h,0ffh	; 6d53  ............?...
	defb 0c0h,021h,0eeh,01eh,007h,0ffh,000h,000h,0ffh,0ffh,0feh,001h,0feh,001h,000h,0ffh	; 6d63  .!..............
	defb 03fh,0c0h,01fh,0e0h,000h,07fh,000h,000h,0ffh,0ffh,003h,01ch,0e1h,0eeh,070h,0f7h	; 6d73  ?.............p.
	defb 0f0h,008h,0f7h,00fh,003h,0ffh,000h,000h,0ffh,0ffh,0feh,001h,0feh,001h,000h,0ffh	; 6d83  ................
	defb 00fh,070h,00fh,070h,080h,0bfh,018h,000h,0ffh,0ffh,007h,008h,0e3h,0ech,070h,0f7h	; 6d93  .p.p..........p.

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f18: 7 fichas de 8x8 a 3 bit(s) por punto (24 bytes
;   cada una), entrada 18 de la lista fichas_ruina_0; lo leen p00:5286 (168
;   bytes)
;   0x6da3..0x6e4b  (168 bytes)
DATA_fichas_ruina_0_f18:
	defb 04ah,07eh,089h,04ah,07eh,089h,04ah,07eh,089h,04ah,07eh,089h,04ah,07eh,089h,04ah,07eh,089h,04ah,07eh,089h,04ah,07eh,089h	; 6da3  J~.J~.J~.J~.J~.J~.J~.J~.
	defb 000h,000h,000h,000h,000h,0ffh,0f5h,0ffh,005h,0a2h,0ffh,002h,0a2h,0ffh,002h,049h,049h,000h,0ffh,0ffh,000h,000h,000h,000h	; 6dbb  ...............II.......
	defb 000h,000h,000h,000h,000h,0ffh,04ah,07eh,089h,04ah,07eh,089h,04ah,07eh,089h,04ah,07eh,089h,04ah,07eh,089h,04ah,07eh,089h	; 6dd3  ......J~.J~.J~.J~.J~.J~.
	defb 000h,000h,0ffh,000h,000h,000h,078h,0ffh,000h,0ffh,000h,000h,0cch,0eeh,011h,033h,022h,044h,033h,022h,044h,033h,022h,044h	; 6deb  ......x........3"D3"D3"D
	defb 0ffh,0ffh,000h,000h,000h,0ffh,087h,0ffh,087h,000h,000h,000h,033h,0ffh,022h,044h,066h,088h,044h,066h,088h,044h,066h,088h	; 6e03  ............3."Df.Df.Df.
	defb 0a5h,0dbh,000h,0b5h,0dbh,010h,062h,0a5h,038h,072h,0b5h,028h,091h,076h,008h,081h,052h,024h,0a5h,066h,010h,0d3h,0b5h,008h	; 6e1b  ......b.8r.(.v..R$.f....
	defb 000h,0ffh,000h,03ch,0ffh,000h,070h,0f9h,034h,061h,0f9h,024h,049h,0d9h,024h,041h,0c1h,03ch,003h,0c3h,000h,01eh,0ffh,000h	; 6e33  ...<..p.4a.$I.$A.<......

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f19: 21 fichas de 8x8 a 3 bit(s) por punto (24 bytes
;   cada una), entrada 19 de la lista fichas_ruina_0; lo leen p00:5286 (504
;   bytes)
;   0x6e4b..0x7043  (504 bytes)
DATA_fichas_ruina_0_f19:
	defb 0ffh,000h,000h,0f7h,018h,010h,0e3h,024h,038h,0f3h,034h,028h,0d3h,034h,008h,081h,052h,024h,0a5h,066h,010h,0d3h,034h,008h	; 6e4b  .......$8.4(.4..R$.f..4.
	defb 0ffh,0ffh,000h,000h,000h,0ffh,087h,0ffh,087h,000h,000h,000h,031h,0fdh,020h,04ah,06bh,090h,04ah,06bh,090h,042h,063h,090h	; 6e63  ............1. Jk.Jk.Bc.
	defb 0fch,0fch,000h,003h,003h,0d8h,0a1h,0a7h,080h,011h,077h,000h,010h,077h,000h,030h,077h,010h,030h,077h,010h,030h,077h,010h	; 6e7b  ..........w..w.0w.0w.0w.
	defb 03fh,03fh,000h,080h,080h,0dbh,085h,085h,061h,0c0h,0cch,062h,0c0h,0cch,062h,0c6h,0ceh,062h,0c6h,0ceh,062h,0c6h,0ceh,022h	; 6e93  ??......a..b..b..b..b.."
	defb 0ffh,0ffh,000h,000h,000h,0ffh,087h,0ffh,087h,000h,000h,000h,0b3h,0bfh,022h,004h,086h,048h,004h,086h,048h,0c4h,0c6h,048h	; 6eab  .............."..H..H..H
	defb 072h,003h,008h,032h,003h,008h,012h,003h,008h,018h,00ah,000h,008h,009h,040h,012h,002h,040h,000h,000h,045h,011h,001h,04ah	; 6ec3  r..2..........@..@..E..J
	defb 010h,076h,000h,001h,041h,000h,00ah,03bh,004h,0cah,0fbh,004h,0cfh,0c1h,000h,041h,000h,03eh,03eh,03eh,0c1h,0f5h,0fdh,030h	; 6edb  .v..A..........A.>>>...0
	defb 066h,06eh,042h,002h,082h,000h,0f8h,0fch,0b0h,05bh,0dfh,030h,073h,083h,000h,082h,000h,07ch,074h,077h,084h,089h,0b9h,000h	; 6ef3  fnB......[.0s....|tw....
	defb 0ceh,0c0h,050h,0c8h,0c0h,050h,0c8h,0c0h,050h,058h,050h,044h,000h,090h,006h,048h,040h,016h,000h,080h,026h,0c8h,0c0h,0d6h	; 6f0b  ..P..P..PXPD...H@...&...
	defb 015h,005h,042h,01ch,00dh,042h,01fh,007h,040h,01eh,006h,040h,03ch,005h,040h,06eh,026h,010h,04fh,027h,013h,057h,037h,009h	; 6f23  ..B..B..@..@<.@n&.O'.W7.
	defb 033h,0fch,030h,023h,0fch,021h,033h,0fch,030h,001h,005h,000h,0e0h,0e2h,018h,078h,001h,006h,05ch,071h,002h,080h,081h,0c6h	; 6f3b  3.0#.!3.0......x..\q....
	defb 0c2h,03eh,080h,0c2h,0beh,081h,0c0h,03eh,081h,000h,0a0h,000h,007h,047h,018h,09eh,080h,020h,0bah,08eh,080h,080h,080h,0a1h	; 6f53  .>.....>.....G... ......
	defb 068h,060h,026h,058h,070h,006h,078h,060h,0a6h,07ch,060h,002h,0d6h,0e4h,008h,072h,064h,008h,0f2h,0ech,020h,06ah,06ch,030h	; 6f6b  h`&Xp.x`.|`....rd... jl0
	defb 057h,037h,009h,056h,037h,008h,046h,037h,008h,006h,017h,048h,002h,013h,04ch,002h,013h,04ch,002h,013h,04ch,002h,013h,04ch	; 6f83  W7.V7.F7...H..L..L..L..L
	defb 0f4h,0fdh,0f2h,0c2h,0fbh,0c4h,044h,0f7h,048h,052h,0f3h,04ch,038h,0fch,000h,053h,0dfh,020h,008h,0ebh,004h,017h,0f7h,000h	; 6f9b  ......D.HR.L8..S. ......
	defb 030h,0beh,000h,0d3h,0dfh,080h,023h,0efh,000h,0d8h,0dch,0c3h,030h,030h,00eh,080h,080h,07eh,070h,0f0h,006h,0e4h,0e4h,00ah	; 6fb3  0.....#.....00...~p.....
	defb 04ah,06ch,010h,06ah,06ch,010h,062h,06ch,010h,040h,048h,032h,070h,078h,002h,0d0h,0f8h,002h,098h,0d8h,022h,098h,0d8h,022h	; 6fcb  Jl.jl.bl.@H2px......".."
	defb 013h,01bh,044h,019h,01dh,042h,018h,018h,045h,001h,000h,06ch,003h,000h,070h,000h,000h,07fh,00eh,00fh,070h,000h,000h,000h	; 6fe3  ..D..B..E..l..p.....p...
	defb 008h,0ffh,000h,000h,0f8h,004h,080h,0dfh,020h,041h,061h,09eh,038h,038h,047h,087h,007h,018h,030h,000h,0c0h,02fh,000h,000h	; 6ffb  ........ Aa.88G...0../..
	defb 0cch,0ech,0d2h,018h,018h,024h,070h,0f0h,04dh,0c1h,0c1h,03ah,016h,016h,0e0h,0c9h,0c8h,000h,00ch,000h,003h,0f4h,000h,000h	; 7013  .....$p.M..:............
	defb 0f0h,0f0h,04ah,030h,0b0h,04ah,010h,090h,02ah,080h,000h,036h,0c0h,000h,00eh,000h,000h,0feh,070h,0f0h,00eh,000h,000h,000h	; 702b  ..J0.J..*..6......p.....

; ----------------------------------------------------------------------
; DATOS fichas_ruina_0_f20: 17 fichas de 8x8 a 3 bit(s) por punto (24 bytes
;   cada una), entrada 20 de la lista fichas_ruina_0; se solapan 2 bloques:
;   (fichas_ruina_0_f21 7043-71DB); lo leen p00:5286 (408 bytes)
;   0x7043..0x71db  (408 bytes)
DATA_fichas_ruina_0_f20:
	defb 070h,000h,000h,038h,000h,040h,01ch,000h,060h,01eh,010h,060h,017h,010h,068h,014h,014h,06bh,016h,017h,069h,096h,016h,029h	; 7043  p..8.@..`..`..h..k..i..)
	defb 000h,000h,00fh,000h,000h,000h,01ch,01fh,000h,000h,000h,000h,00eh,00eh,000h,033h,022h,004h,033h,022h,004h,033h,022h,004h	; 705b  ...............3".3".3".
	defb 0f0h,000h,000h,000h,000h,01fh,001h,001h,01ch,000h,001h,01ch,01ch,01dh,0e0h,01ch,01ch,0e0h,0f0h,000h,000h,0e0h,000h,000h	; 7073  ........................
	defb 07fh,07fh,000h,000h,080h,03fh,087h,0c7h,007h,040h,078h,000h,0b8h,0bfh,000h,0c7h,0c7h,000h,038h,0f8h,000h,007h,0ffh,000h	; 708b  .....?...@x.......8.....
	defb 0ffh,0ffh,000h,000h,000h,0ffh,087h,0ffh,087h,000h,000h,000h,033h,0ffh,022h,004h,0e6h,008h,0e4h,0feh,000h,018h,01eh,000h	; 70a3  ............3.".........
	defb 0ffh,0ffh,000h,000h,000h,07fh,07fh,0ffh,007h,080h,0f8h,000h,078h,07eh,001h,086h,087h,000h,079h,0f9h,000h,005h,0fdh,000h	; 70bb  ............x~....y.....
	defb 0feh,0feh,001h,000h,000h,0feh,086h,0ffh,084h,000h,003h,000h,035h,0ffh,020h,002h,026h,000h,005h,0adh,000h,004h,08dh,000h	; 70d3  ............5. .&.......
	defb 0ffh,03fh,000h,0e0h,020h,03fh,0e8h,02fh,028h,0d0h,058h,050h,099h,059h,010h,012h,0b2h,002h,016h,0b7h,004h,022h,06fh,000h	; 70eb  .?.. ?./(.XP.Y......."o.
	defb 0bdh,001h,001h,0fch,000h,000h,0dah,002h,003h,070h,002h,005h,0ech,000h,000h,0deh,000h,001h,071h,001h,003h,0edh,001h,005h	; 7103  .........p........q.....
	defb 064h,06eh,040h,028h,00eh,018h,000h,040h,080h,049h,0fch,000h,03fh,03fh,000h,082h,082h,0c1h,013h,098h,064h,031h,0f0h,00ch	; 711b  dn@(...@.I..??......d1..
	defb 03ch,005h,004h,0fdh,001h,004h,059h,001h,002h,0f4h,000h,002h,0ech,001h,000h,0ffh,001h,000h,0b0h,003h,000h,0e9h,003h,001h	; 7133  <.....Y.................
	defb 0f8h,0f8h,006h,020h,0a0h,04eh,00eh,00eh,090h,040h,042h,03ch,000h,000h,088h,0a0h,0b0h,064h,080h,084h,04ah,098h,0bch,01ah	; 714b  ... .N...@B<.....d..J...
	defb 0bbh,007h,002h,0b5h,00fh,004h,0d3h,00fh,000h,0e0h,000h,00ch,0b5h,001h,000h,079h,001h,003h,04ch,000h,000h,014h,001h,002h	; 7163  ...............y..L.....
	defb 026h,07eh,021h,00ch,07ch,083h,098h,0f8h,006h,018h,038h,044h,090h,090h,06fh,04ah,0cah,035h,03eh,01eh,001h,0dah,0dah,0a5h	; 717b  &~!.|.....8D..oJ.5>.....
	defb 09ch,09ch,043h,038h,038h,086h,0d1h,0f0h,00eh,081h,0c0h,0b4h,008h,008h,0c2h,090h,030h,00eh,0c1h,000h,008h,0f0h,000h,000h	; 7193  ..C88...........0.......
	defb 0f0h,080h,000h,0b8h,080h,040h,0bfh,0a0h,040h,0b0h,0b0h,04fh,0b0h,0b7h,04fh,0b7h,0b4h,048h,037h,036h,048h,0b6h,036h,009h	; 71ab  .....@..@..O..O..H76H.6.
	defb 00fh,000h,000h,001h,000h,0f0h,001h,000h,0f0h,001h,000h,0f0h,00fh,0feh,000h,00fh,0feh,000h,00fh,000h,000h,00fh,000h,000h	; 71c3  ........................

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_colores: tabla de colores de la lista fichas_ruina_1
;   (L_529C indexa con c >> 4); lo leen p00:5286 (8 bytes)
;   0x71db..0x71e3  (8 bytes)
DATA_fichas_ruina_1_colores:
	defb 0e3h,071h	; 71db
	defb 0ebh,071h	; 71dd
	defb 0efh,071h	; 71df
	defb 0f3h,071h	; 71e1

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_col0: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 7 bloques: (fichas_ruina_1_col0
;   71E3-71E7) (fichas_ruina_1_col0 71E3-71E7) (fichas_ruina_1_col0 71E3-71E7)
;   (fichas_ruina_1_col0 71E3-71EB) (fichas_ruina_1_col0 71E3-71EB)
;   (fichas_ruina_1_col0 71E3-71EB); lo leen p00:5286 (8 bytes)
;   0x71e3..0x71eb  (8 bytes)
DATA_fichas_ruina_1_col0:
	defb 003h,00fh	; 71e3
	defb 002h,005h	; 71e5
	defb 004h,001h	; 71e7
	defb 00bh,00dh	; 71e9

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_col1: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 2 bloques: (fichas_ruina_1_col1
;   71EB-71EF); lo leen p00:5286 (4 bytes)
;   0x71eb..0x71ef  (4 bytes)
DATA_fichas_ruina_1_col1:
	defb 002h,003h,004h,005h	; 71eb

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_col2: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5286 (4 bytes)
;   0x71ef..0x71f3  (4 bytes)
DATA_fichas_ruina_1_col2:
	defb 001h,002h,003h,005h	; 71ef

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_col3: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 2 bloques: (fichas_ruina_1_col3
;   71F3-71F7); lo leen p00:5286 (4 bytes)
;   0x71f3..0x71f7  (4 bytes)
DATA_fichas_ruina_1_col3:
	defb 001h,002h,003h,00fh	; 71f3

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5286 (73 bytes)
;   0x71f7..0x7240  (73 bytes)
DATA_fichas_ruina_1:
	defb 00ch,004h,004h,080h,001h,040h	; 71f7
	defb 072h,005h,008h,080h,001h,040h	; 71fd
	defb 072h,002h,00ch,080h,002h,058h	; 7203
	defb 072h,000h,000h,084h,00ah,078h	; 7209
	defb 072h,012h,040h,084h,007h,0c8h	; 720f
	defb 072h,013h,000h,088h,005h,0e8h	; 7215
	defb 072h,002h,040h,088h,022h,038h	; 721b
	defb 073h,003h,048h,08ch,00bh,0a8h	; 7221
	defb 074h,022h,000h,090h,010h,058h	; 7227
	defb 075h,032h,040h,090h,007h,058h	; 722d
	defb 076h,033h,05ch,090h,007h,058h	; 7233
	defb 076h,004h,000h,094h,008h,0c8h	; 7239
	defb 076h	; 723f

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_f0: 1 fichas de 8x8 a 3 bit(s) por punto (24 bytes cada
;   una), entrada 0 de la lista fichas_ruina_1; se solapan 2 bloques:
;   (fichas_ruina_1_f1 7240-7258); lo leen p00:5286 (24 bytes)
;   0x7240..0x7258  (24 bytes)
DATA_fichas_ruina_1_f0:
	defb 0ffh,000h,000h,080h,000h,07fh,000h,000h,07fh,07fh,07fh,000h,07fh,07fh,000h,000h,07fh,000h,000h,03fh,000h,080h,000h,000h	; 7240  ...................?....

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_f2: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 2 de la lista fichas_ruina_1; lo leen p00:5286 (32 bytes)
;   0x7258..0x7278  (32 bytes)
DATA_fichas_ruina_1_f2:
	defb 0ffh,000h,0c9h,000h,084h,000h,0ffh,000h,001h,000h,000h,0fch,0fch,0feh,0ffh,000h	; 7258  ................
	defb 0ffh,000h,067h,000h,041h,000h,0ffh,000h,0c0h,000h,080h,07fh,07fh,0ffh,0ffh,000h	; 7268  ..g.A...........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_f3: 10 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 3 de la lista fichas_ruina_1; lo leen p00:5286 (80 bytes)
;   0x7278..0x72c8  (80 bytes)
DATA_fichas_ruina_1_f3:
	defb 0ffh,041h,0ffh,0fbh,0f5h,0ffh,0f7h,0fdh	; 7278  .A......
	defb 0ffh,0ffh,0feh,0fdh,0fbh,0f7h,0ffh,0ffh	; 7280  ........
	defb 0e7h,09fh,07eh,0fch,0f3h,0cfh,0bfh,07fh	; 7288  ..~.....
	defb 0feh,0feh,0fdh,0fdh,0fbh,0fbh,0fbh,0fbh	; 7290  ........
	defb 0f7h,0ffh,0f7h,0f7h,0f7h,0f7h,0f7h,0f7h	; 7298  ........
	defb 0ffh,0ffh,0feh,0f9h,0f7h,0efh,0efh,0dfh	; 72a0  ........
	defb 0bfh,0bfh,0bfh,0bfh,0bfh,0bfh,0bfh,0bfh	; 72a8  ........
	defb 0fch,0fch,0fch,0fch,0fch,0fdh,0fch,0fch	; 72b0  ........
	defb 0ffh,0ffh,07fh,01fh,08fh,0c7h,0e3h,0f1h	; 72b8  ........
	defb 0ffh,0ffh,07fh,03fh,03fh,0ffh,05fh,01fh	; 72c0  ...??._.

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_f4: 7 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 4 de la lista fichas_ruina_1; se solapan 2 bloques:
;   (fichas_ruina_1_f5 72E8-7338); lo leen p00:5286 (112 bytes)
;   0x72c8..0x7338  (112 bytes)
DATA_fichas_ruina_1_f4:
	defb 0dfh,040h,0adh,060h,08ah,060h,08dh,064h,089h,064h,08ah,066h,088h,066h,098h,006h	; 72c8  .@.`.`.d.d.f.f..
	defb 089h,060h,098h,006h,089h,060h,098h,006h,0dch,002h,0aah,000h,0aah,000h,0bbh,000h	; 72d8  .`...`..........
	defb 0edh,001h,0d8h,001h,0a2h,003h,048h,008h,0c5h,00dh,0a0h,024h,0c1h,001h,008h,009h	; 72e8  ......H....$....
	defb 004h,06ch,082h,006h,000h,036h,080h,0c2h,000h,080h,039h,039h,000h,039h,080h,080h	; 72f8  .l...6....99.9..
	defb 046h,0c6h,008h,0ceh,000h,04ch,081h,001h,082h,003h,070h,073h,008h,039h,084h,09ch	; 7308  F....L....ps.9..
	defb 08fh,006h,09fh,000h,0c4h,004h,06fh,06fh,027h,027h,0edh,075h,03ch,038h,00eh,002h	; 7318  ......oo''.u<8..
	defb 0edh,005h,054h,074h,0a9h,021h,0f8h,080h,0cch,0c0h,01bh,013h,03dh,031h,026h,030h	; 7328  ..Tt.!......=1&0

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_f6: 34 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 6 de la lista fichas_ruina_1; se solapan 2 bloques:
;   (fichas_ruina_1_f7 74A8-7558); lo leen p00:5286 (544 bytes)
;   0x7338..0x7558  (544 bytes)
DATA_fichas_ruina_1_f6:
	defb 00fh,000h,00fh,0d0h,00fh,000h,00fh,010h,01fh,000h,00fh,000h,00fh,000h,00fh,000h	; 7338  ................
	defb 000h,000h,000h,0feh,000h,000h,000h,022h,000h,045h,000h,054h,000h,0d5h,000h,064h	; 7348  .......".E.T...d
	defb 00fh,000h,00fh,010h,00fh,080h,08fh,040h,04fh,020h,02fh,090h,01fh,040h,00fh,020h	; 7358  .......@O /..@.
	defb 0e0h,018h,038h,0c7h,00eh,031h,000h,00ch,0c0h,003h,0f0h,000h,0fch,000h,0feh,000h	; 7368  ..8..1..........
	defb 0cfh,010h,0cfh,000h,0c7h,010h,0c7h,010h,0c7h,010h,0c7h,010h,0c7h,010h,0c7h,010h	; 7378  ................
	defb 00fh,020h,00fh,000h,087h,010h,087h,010h,0c7h,010h,0c7h,010h,0c7h,010h,0c7h,010h	; 7388  . ..............
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,07fh,000h,03fh,000h,0ffh,000h,01fh,0c0h	; 7398  ..........?.....
	defb 0dfh,000h,01fh,020h,007h,048h,00bh,080h,002h,080h,0ffh,000h,000h,060h,000h,092h	; 73a8  ... .H.......`..
	defb 09fh,000h,00fh,000h,00fh,0d0h,00fh,000h,01fh,000h,00fh,000h,00fh,000h,00fh,000h	; 73b8  ................
	defb 00fh,000h,00fh,000h,00fh,0d0h,00fh,000h,01fh,000h,00fh,000h,00fh,000h,00fh,000h	; 73c8  ................
	defb 0ffh,000h,03dh,0c0h,039h,0c0h,038h,0c0h,031h,0c0h,030h,0c0h,030h,0c1h,0b0h,0c3h	; 73d8  ..=.9.8.1.0.0...
	defb 0ffh,000h,031h,0c0h,030h,0c2h,030h,0c2h,030h,0c2h,020h,0c2h,020h,0c6h,0a1h,0cdh	; 73e8  ..1.0.0.0. . ...
	defb 0ffh,000h,023h,0c2h,023h,0c2h,023h,0c6h,023h,0c6h,023h,0c6h,003h,0ceh,086h,0dch	; 73f8  ..#.#.#.#.#.....
	defb 0feh,000h,082h,0e4h,002h,0ech,082h,0ech,082h,0fch,082h,0ech,002h,0cch,0feh,000h	; 7408  ................
	defb 0e0h,000h,000h,000h,020h,020h,020h,0e0h,020h,0e0h,020h,0a0h,020h,0a0h,040h,040h	; 7418  ....   . . . .@@
	defb 080h,080h,080h,081h,080h,083h,080h,083h,080h,083h,000h,087h,000h,087h,000h,007h	; 7428  ................
	defb 001h,001h,001h,0c1h,001h,0e1h,001h,0e1h,001h,0f1h,001h,0f1h,001h,0f1h,000h,0f0h	; 7438  ................
	defb 0ffh,000h,0a9h,000h,040h,01ah,000h,0bah,000h,0b4h,004h,004h,0e8h,0e9h,010h,017h	; 7448  ....@...........
	defb 0bfh,000h,05bh,000h,094h,000h,0abh,000h,075h,000h,0f5h,020h,0ffh,020h,0bfh,060h	; 7458  ..[.....u.. . .`
	defb 0ffh,000h,0c3h,043h,043h,063h,043h,063h,042h,063h,043h,073h,042h,073h,021h,033h	; 7468  ...CCcCcBcCsBs!3
	defb 083h,0f0h,085h,0cch,021h,0bch,043h,07ch,083h,0f0h,085h,0cch,021h,0bch,043h,07ch	; 7478  ....!.C|....!.C|
	defb 0e0h,03eh,081h,03dh,083h,033h,0cch,00fh,0e0h,03eh,081h,03dh,083h,033h,0cch,00fh	; 7488  .>.=.3...>.=.3..
	defb 0ffh,000h,040h,000h,000h,02dh,000h,0c3h,004h,055h,000h,09ah,000h,0c5h,002h,03ah	; 7498  ..@..-...U.....:
	defb 0e4h,0e0h,012h,010h,038h,0b8h,040h,042h,082h,0bah,081h,0bdh,081h,0bdh,001h,07dh	; 74a8  ....8.@B.......}
	defb 039h,066h,0b4h,02eh,09bh,020h,03fh,013h,021h,01fh,010h,007h,010h,0c1h,00ch,060h	; 74b8  9f... ?.!......`
	defb 0feh,000h,0f9h,000h,0f1h,002h,0eah,005h,0d5h,002h,0a9h,002h,050h,004h,0a0h,008h	; 74c8  ............P...
	defb 0fdh,000h,0fah,000h,0f5h,000h,0eah,000h,0d4h,001h,0d4h,001h,0a8h,003h,0a8h,002h	; 74d8  ................
	defb 068h,002h,068h,002h,068h,002h,068h,002h,068h,002h,068h,002h,068h,002h,068h,002h	; 74e8  h.h.h.h.h.h.h.h.
	defb 068h,012h,068h,003h,068h,010h,060h,01fh,07fh,000h,000h,000h,0ffh,000h,0ffh,000h	; 74f8  h.h.h.`.........
	defb 000h,000h,000h,0ffh,000h,000h,000h,0ffh,0ffh,000h,000h,000h,0ffh,000h,000h,000h	; 7508  ................
	defb 001h,0fdh,001h,0ddh,020h,0ach,00ch,0a1h,022h,042h,04ch,03dh,0f0h,07dh,0a3h,074h	; 7518  .... ..."BL=.}.t
	defb 081h,032h,083h,006h,050h,007h,023h,087h,037h,02fh,0d3h,0cfh,026h,01fh,022h,09eh	; 7528  .2..P.#.7/..&.".
	defb 0a0h,0ceh,0b2h,08fh,0a0h,0cfh,020h,007h,011h,0c5h,010h,0e1h,000h,0e0h,004h,000h	; 7538  ...... .........
	defb 03dh,0fch,098h,07eh,067h,098h,0fdh,003h,0efh,018h,06ch,098h,098h,0c8h,064h,0c0h	; 7548  =..~g.....l...d.

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_f8: 16 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 8 de la lista fichas_ruina_1; lo leen p00:5286 (256
;   bytes)
;   0x7558..0x7658  (256 bytes)
DATA_fichas_ruina_1_f8:
	defb 06eh,0f1h,08eh,0f1h,016h,0f9h,0d7h,038h,0d7h,038h,0d7h,038h,0ebh,01ch,0ebh,01ch	; 7558  n......8.8.8....
	defb 0b6h,0cfh,0b1h,0c6h,0afh,0c0h,04fh,0e0h,05fh,0e0h,0a7h,078h,0d8h,03fh,0c7h,01fh	; 7568  ......O._..x.?..
	defb 06dh,003h,00dh,023h,0adh,073h,0aah,077h,05ah,0e7h,045h,0feh,058h,0ffh,042h,0ffh	; 7578  m..#.s.wZ.E.X.B.
	defb 076h,08fh,031h,08fh,028h,09fh,08bh,01ch,06bh,01ch,0d3h,03ch,0d3h,038h,0abh,070h	; 7588  v.1.(...k..<.8.p
	defb 0b5h,00eh,09ah,007h,0e1h,003h,056h,081h,033h,080h,03fh,080h,08fh,0e0h,063h,0d0h	; 7598  ......V.3.?...c.
	defb 038h,007h,07fh,080h,09fh,0e0h,063h,0fch,09ch,07fh,0c3h,03fh,0fch,003h,0ffh,000h	; 75a8  8.....c....?....
	defb 025h,0feh,0dbh,03ch,0e4h,01fh,0c5h,03fh,034h,0ffh,0c5h,0feh,00bh,0fch,0b7h,078h	; 75b8  %..<...?4......x
	defb 0a7h,070h,057h,0e0h,0a0h,0c1h,04dh,083h,0ddh,003h,0fdh,003h,0fah,007h,0f5h,00ah	; 75c8  .pW...M.........
	defb 083h,07ch,0edh,01eh,0edh,01ah,0c3h,00ch,055h,00eh,09ah,005h,0c5h,003h,03ah,087h	; 75d8  .|......U.....:.
	defb 0feh,001h,0fdh,003h,0dah,007h,0bah,005h,0b5h,00eh,005h,0feh,0ebh,0fch,017h,0f8h	; 75e8  ................
	defb 0e3h,090h,09dh,0e0h,0c2h,0bch,039h,0feh,0c6h,03fh,0f9h,007h,0feh,001h,00fh,0f0h	; 75f8  ......9..?......
	defb 0c2h,03ch,035h,078h,0b5h,068h,0c9h,030h,02ch,0f0h,0a3h,0d0h,04fh,0e0h,0aeh,071h	; 7608  .<5x.h.0,...O..q
	defb 0b4h,0ceh,0abh,0dch,0c2h,07ch,0ddh,07eh,0f9h,06ch,0f6h,099h,0aeh,071h,08eh,071h	; 7618  .....|.~.l...q.q
	defb 0a4h,073h,04bh,0e7h,044h,0efh,04bh,0fch,042h,0e9h,09ch,0c1h,0b6h,0c9h,0a9h,0dfh	; 7628  .sK.D.K.B.......
	defb 0f3h,0fch,01dh,0feh,0b9h,07eh,042h,0ffh,0a2h,0c7h,08dh,0c3h,0b5h,0c3h,019h,083h	; 7638  .....~B.........
	defb 0d5h,03bh,095h,03ah,003h,03eh,0bbh,07eh,0dfh,036h,06fh,099h,075h,08eh,071h,08eh	; 7648  ...:.>.~.6o.u.q.

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_f9: 7 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 9 de la lista fichas_ruina_1; se solapan 2 bloques:
;   (fichas_ruina_1_f10 7658-76C8); lo leen p00:5286 (112 bytes)
;   0x7658..0x76c8  (112 bytes)
DATA_fichas_ruina_1_f9:
	defb 0ffh,000h,0f2h,000h,0fdh,000h,0f1h,000h,06bh,000h,01bh,000h,074h,003h,073h,00ch	; 7658  ........k...t.s.
	defb 0f2h,001h,02dh,002h,0dbh,004h,0b6h,009h,0cfh,031h,03eh,0c3h,0fdh,00fh,0f2h,03fh	; 7668  ..-......1>....?
	defb 0cdh,0ffh,033h,0ffh,0cfh,0ffh,03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7678  ..3...?.........
	defb 06ch,09fh,063h,0bfh,0dfh,03fh,0efh,03fh,0dfh,07fh,0bfh,07fh,0bfh,07fh,0ffh,07fh	; 7688  l.c..?.?........
	defb 06fh,010h,09fh,063h,07ch,08fh,0f3h,01fh,0ech,03fh,0d3h,07fh,0efh,07fh,0dfh,07fh	; 7698  o..c|....?......
	defb 00ch,0f0h,00bh,0f0h,017h,0e0h,014h,0e1h,01ah,0e1h,015h,0e2h,015h,0e2h,01bh,0e4h	; 76a8  ................
	defb 01bh,0e4h,033h,0c4h,07bh,084h,073h,08ch,06fh,090h,05fh,0a3h,03ch,0cfh,0b3h,05fh	; 76b8  ..3.{.s.o._.<.._

; ----------------------------------------------------------------------
; DATOS fichas_ruina_1_f11: 8 fichas de 8x8 a 3 bit(s) por punto (24 bytes
;   cada una), entrada 11 de la lista fichas_ruina_1; lo leen p00:5286 (192
;   bytes)
;   0x76c8..0x7788  (192 bytes)
DATA_fichas_ruina_1_f11:
	defb 0dfh,000h,000h,0dfh,000h,000h,0bfh,002h,000h,0bdh,000h,002h,0bdh,000h,002h,0bfh,010h,000h,0bdh,000h,002h,0afh,000h,010h	; 76c8  ........................
	defb 0f9h,000h,000h,0f8h,000h,000h,0fch,040h,000h,0bch,000h,040h,0bch,000h,040h,0fdh,008h,000h,0bch,000h,040h,0f4h,000h,008h	; 76e0  .......@...@..@.....@...
	defb 0fah,007h,000h,0fch,005h,002h,0f0h,001h,006h,0f0h,021h,006h,0d0h,000h,026h,0d0h,041h,026h,010h,001h,066h,090h,007h,060h	; 76f8  ..........!...&.A&..f..`
	defb 090h,001h,006h,098h,003h,060h,080h,001h,006h,098h,007h,060h,0a0h,000h,040h,0f8h,000h,000h,0ffh,000h,000h,0fdh,000h,000h	; 7710  .....`.....`..@.........
	defb 033h,077h,000h,099h,0bbh,000h,000h,011h,0cch,044h,0ddh,000h,000h,0eeh,000h,022h,0eeh,000h,099h,000h,000h,0ffh,000h,000h	; 7728  3w.......D....."........
	defb 0ffh,000h,000h,0c3h,043h,000h,0c3h,063h,000h,080h,031h,042h,0c3h,053h,000h,080h,011h,042h,082h,042h,001h,041h,023h,000h	; 7740  ....C..c..1B.S...B.B.A#.
	defb 03fh,000h,000h,027h,02fh,010h,000h,03fh,000h,027h,02fh,010h,027h,02fh,010h,037h,03fh,000h,037h,03fh,000h,03fh,000h,000h	; 7758  ?..'/..?.'/.'/.7?.7?.?..
	defb 0afh,062h,000h,0bfh,072h,000h,03fh,0b6h,002h,0bfh,0b6h,012h,09fh,0bfh,01ah,05fh,07fh,049h,05bh,07fh,009h,000h,026h,000h	; 7770  .b..r.?........_.I[...&.

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2_colores: tabla de colores de la lista fichas_ruina_2
;   (L_529C indexa con c >> 4); lo leen p00:5286 (10 bytes)
;   0x7788..0x7792  (10 bytes)
DATA_fichas_ruina_2_colores:
	defb 092h,077h	; 7788
	defb 09ah,077h	; 778a
	defb 09eh,077h	; 778c
	defb 0a2h,077h	; 778e
	defb 0a6h,077h	; 7790

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2_col0: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 4 bloques: (fichas_ruina_2_col0
;   7792-7796) (fichas_ruina_2_col0 7792-779A) (fichas_ruina_2_col0
;   7792-779A); lo leen p00:5286 (8 bytes)
;   0x7792..0x779a  (8 bytes)
DATA_fichas_ruina_2_col0:
	defb 004h,005h,00fh,003h	; 7792
	defb 001h,002h,00ch,00dh	; 7796

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2_col1: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5286 (4 bytes)
;   0x779a..0x779e  (4 bytes)
DATA_fichas_ruina_2_col1:
	defb 004h,005h,00ch,00fh	; 779a

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2_col2: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 2 bloques: (fichas_ruina_2_col2
;   779E-77A2); lo leen p00:5286 (4 bytes)
;   0x779e..0x77a2  (4 bytes)
DATA_fichas_ruina_2_col2:
	defb 004h,00ch,00eh,00fh	; 779e

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2_col3: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 2 bloques: (fichas_ruina_2_col3
;   77A2-77A6); lo leen p00:5286 (4 bytes)
;   0x77a2..0x77a6  (4 bytes)
DATA_fichas_ruina_2_col3:
	defb 001h,002h,005h,00fh	; 77a2

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2_col4: 8 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5286 (8 bytes)
;   0x77a6..0x77ae  (8 bytes)
DATA_fichas_ruina_2_col4:
	defb 00dh,004h,003h,005h,00fh,000h,001h,002h	; 77a6  ........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5286 (61 bytes)
;   0x77ae..0x77eb  (61 bytes)
DATA_fichas_ruina_2:
	defb 00ah,012h,004h,080h,002h,0ebh	; 77ae
	defb 077h,002h,020h,088h,006h,00bh	; 77b4
	defb 078h,003h,040h,088h,006h,00bh	; 77ba
	defb 078h,022h,000h,08ch,007h,06bh	; 77c0
	defb 078h,023h,01ch,08ch,003h,0abh	; 77c6
	defb 078h,032h,040h,08ch,004h,0dbh	; 77cc
	defb 078h,033h,000h,090h,004h,0dbh	; 77d2
	defb 078h,004h,040h,090h,010h,01bh	; 77d8
	defb 079h,005h,000h,094h,007h,0f3h	; 77de
	defb 079h,044h,000h,088h,001h,0e1h	; 77e4
	defb 089h	; 77ea

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2_f0: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_ruina_2; lo leen p00:5286 (32 bytes)
;   0x77eb..0x780b  (32 bytes)
DATA_fichas_ruina_2_f0:
	defb 000h,000h,07fh,000h,04bh,000h,056h,000h,069h,000h,07fh,000h,000h,07fh,0ffh,0ffh	; 77eb  ....K.V.i.......
	defb 001h,001h,0ffh,001h,09fh,001h,067h,001h,0d7h,001h,0ffh,001h,001h,0ffh,0ffh,0ffh	; 77fb  ......g.........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2_f1: 6 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 1 de la lista fichas_ruina_2; se solapan 2 bloques:
;   (fichas_ruina_2_f2 780B-786B); lo leen p00:5286 (96 bytes)
;   0x780b..0x786b  (96 bytes)
DATA_fichas_ruina_2_f1:
	defb 000h,0ffh,052h,0adh,0a9h,056h,099h,067h,08eh,071h,04ch,0b3h,01ch,0e7h,00ch,0f3h	; 780b  ..R..V.g.qL.....
	defb 000h,0ffh,022h,0ddh,044h,0bbh,0a9h,056h,091h,06fh,0abh,0deh,045h,0fbh,0bdh,066h	; 781b  ..".D..V.o..E..f
	defb 001h,0ffh,072h,0ffh,0f9h,08fh,099h,067h,08eh,071h,04ch,0b3h,01ch,0e7h,00ch,0f3h	; 782b  ..r....g.qL.....
	defb 00ch,0f3h,01ch,0e7h,04ch,0b3h,08eh,071h,099h,067h,0f9h,08fh,072h,0ffh,001h,0ffh	; 783b  ....L..q.g..r...
	defb 0bdh,066h,0a2h,0dfh,0d5h,07bh,089h,0f6h,095h,0feh,023h,0ddh,044h,0ffh,09fh,0f6h	; 784b  .f...{....#.D...
	defb 09fh,0f6h,044h,0ffh,023h,0ddh,095h,0feh,089h,0f6h,0d5h,07bh,0a2h,0dfh,0bdh,066h	; 785b  ..D.#......{...f

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2_f3: 7 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 3 de la lista fichas_ruina_2; se solapan 2 bloques:
;   (fichas_ruina_2_f4 78AB-78DB); lo leen p00:5286 (112 bytes)
;   0x786b..0x78db  (112 bytes)
DATA_fichas_ruina_2_f3:
	defb 0ffh,03ch,0ffh,024h,0e7h,03ch,0ffh,03ch,0e7h,024h,0e7h,03ch,0e7h,03ch,0ffh,03ch	; 786b  .<.$.<.<.$.<.<.<
	defb 0ffh,000h,0ffh,0ffh,099h,0ffh,0ffh,0ffh,099h,099h,099h,0ffh,0ffh,0ffh,0ffh,000h	; 787b  ................
	defb 0ffh,0ffh,0ffh,000h,000h,000h,0ffh,000h,088h,0eeh,0ffh,0ffh,0eeh,088h,0ffh,0ffh	; 788b  ................
	defb 0ffh,0ffh,0eeh,088h,0ffh,0ffh,088h,0eeh,0ffh,000h,000h,000h,0ffh,000h,0ffh,0ffh	; 789b  ................
	defb 0ffh,0ffh,0ffh,080h,0c0h,080h,0dfh,080h,0d1h,087h,0d7h,08fh,0d5h,08ch,0dfh,08dh	; 78ab  ................
	defb 0d5h,085h,0d7h,08dh,0d7h,08dh,0dfh,08fh,0d5h,085h,0d7h,08dh,0d7h,08dh,0dfh,08fh	; 78bb  ................
	defb 0dfh,08dh,0d5h,08ch,0d7h,08fh,0d1h,087h,0dfh,080h,0c0h,080h,0ffh,080h,0ffh,0ffh	; 78cb  ................

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2_f5: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 5 de la lista fichas_ruina_2; se solapan 2 bloques:
;   (fichas_ruina_2_f6 78DB-791B); lo leen p00:5286 (64 bytes)
;   0x78db..0x791b  (64 bytes)
DATA_fichas_ruina_2_f5:
	defb 07fh,07fh,0b1h,0b1h,06eh,060h,07fh,066h,0ffh,08eh,0ffh,0cdh,0dfh,0c7h,0ffh,0cfh	; 78db  ....n`.f........
	defb 0ffh,0cfh,0dfh,0c7h,0ffh,0cdh,0ffh,08eh,07fh,066h,06eh,060h,0b1h,0b1h,07fh,07fh	; 78eb  .........fn`....
	defb 0ddh,0cdh,0efh,0eah,0efh,0c5h,0b7h,0b7h,0b7h,0b3h,0dbh,0cbh,0ffh,0bdh,0e7h,0c3h	; 78fb  ................
	defb 0e7h,0c3h,0ffh,0bdh,0dbh,0cbh,0b7h,0b3h,0b7h,0b7h,0efh,0c5h,0efh,0eah,0ddh,0cdh	; 790b  ................

; ----------------------------------------------------------------------
; DATOS fichas_ruina_2_f7: 16 fichas de 8x8 a 3 bit(s) por punto (24 bytes
;   cada una), entrada 7 de la lista fichas_ruina_2; se solapan 2 bloques:
;   (fichas_ruina_2_f8 79F3-7A9B); lo leen p00:5286 (384 bytes)
;   0x791b..0x7a9b  (384 bytes)
DATA_fichas_ruina_2_f7:
	defb 000h,0ffh,000h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0bbh,0aah,011h,0eeh,000h,0ffh,0bbh,000h,000h,000h,000h,0ffh,0ffh	; 791b  ........................
	defb 000h,0ffh,0ffh,000h,000h,000h,000h,0ffh,0bbh,0aah,011h,0eeh,000h,0ffh,0bbh,0ffh,0ffh,000h,0ffh,000h,000h,000h,0ffh,000h	; 7933  ........................
	defb 000h,0ffh,000h,000h,0ffh,018h,000h,0ffh,018h,020h,0dfh,03ch,000h,0efh,01ch,07eh,083h,018h,03ch,0c7h,010h,000h,0ffh,000h	; 794b  ......... .<...~..<.....
	defb 000h,0ffh,000h,000h,0f7h,010h,000h,0f7h,010h,020h,0dbh,038h,000h,0efh,01ch,07eh,083h,018h,03ch,0c7h,010h,000h,0ffh,000h	; 7963  ......... .8...~..<.....
	defb 000h,0ffh,0ffh,000h,0f7h,091h,000h,0f7h,091h,020h,0dbh,0b9h,000h,0efh,09dh,07eh,083h,099h,03ch,0c7h,091h,000h,0ffh,0ffh	; 797b  ......... .....~..<.....
	defb 000h,0ffh,000h,02eh,0fdh,0d0h,02eh,0fdh,0d0h,000h,04fh,04ch,02ch,0fbh,0d0h,02ch,0ebh,0c0h,02ch,0ebh,0c0h,02ch,0ebh,0c0h	; 7993  ..........OL,..,..,..,..
	defb 02ch,0ebh,0c0h,02ch,0ebh,0c0h,02ch,0ebh,0c0h,02ch,0ebh,0c0h,02ch,0ebh,0c0h,02ch,0ebh,0c0h,02ch,0ebh,0c0h,02ch,0ebh,0c0h	; 79ab  ,..,..,..,..,..,..,..,..
	defb 000h,0ffh,000h,080h,015h,015h,088h,01dh,01dh,000h,0ffh,03fh,040h,08ah,00ah,044h,08eh,00eh,044h,08eh,00eh,044h,08eh,00eh	; 79c3  ...........?@..D..D..D..
	defb 044h,08eh,00eh,044h,08eh,00eh,044h,08eh,00eh,044h,08eh,00eh,044h,08eh,00eh,044h,08eh,00eh,044h,08eh,00eh,044h,08eh,00eh	; 79db  D..D..D..D..D..D..D..D..
	defb 000h,0ffh,000h,007h,0fch,000h,018h,0f2h,005h,033h,0e4h,00bh,03ah,0e4h,00ah,07ah,0e4h,008h,07bh,0e4h,00ah,06bh,0c6h,018h	; 79f3  .........3..:..z..{..k..
	defb 056h,08ch,030h,066h,099h,023h,068h,097h,021h,06eh,09fh,020h,040h,09fh,027h,020h,0cfh,010h,01fh,0efh,000h,007h,0f8h,000h	; 7a0b  V.0f.#h.!n. @.' ........
	defb 000h,0ffh,000h,07fh,080h,000h,07fh,0bfh,000h,060h,0bfh,007h,064h,0b3h,00ch,068h,0b7h,01bh,060h,0bch,014h,060h,0bdh,015h	; 7a23  .........`..d..h..`..`..
	defb 060h,0bdh,015h,068h,0b5h,01dh,060h,0b5h,01dh,068h,0b5h,01dh,060h,0bdh,015h,068h,0b5h,01dh,060h,0b5h,01dh,068h,0b5h,01dh	; 7a3b  `..h..`..h..`..h..`..h..
	defb 060h,0bdh,015h,060h,0bch,014h,068h,0b7h,01bh,064h,0b3h,00ch,060h,0bfh,007h,07fh,0bfh,000h,07fh,080h,000h,000h,0ffh,000h	; 7a53  `..`..h..d..`...........
	defb 018h,0e7h,007h,020h,0dch,01ch,040h,0b7h,034h,0c3h,02ch,023h,087h,078h,074h,08eh,051h,048h,08ch,053h,049h,08ch,053h,048h	; 7a6b  ... ..@.4.,#.xt.QH.SI.SH
	defb 08ch,053h,049h,088h,057h,04bh,08ch,053h,048h,087h,078h,074h,0c3h,02ch,023h,040h,0b7h,034h,020h,0dch,01ch,018h,0e7h,007h	; 7a83  .SI.WK.SH.xt.,#@.4 .....

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_colores: tabla de colores de la lista fichas_ruina_3
;   (L_529C indexa con c >> 4); lo leen p00:5286 (8 bytes)
;   0x7a9b..0x7aa3  (8 bytes)
DATA_fichas_ruina_3_colores:
	defb 0a3h,07ah	; 7a9b
	defb 0a7h,07ah	; 7a9d
	defb 0abh,07ah	; 7a9f
	defb 0b3h,07ah	; 7aa1

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_col0: 2 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 5 bloques: (fichas_ruina_3_col0
;   7AA3-7AA5) (fichas_ruina_3_col0 7AA3-7AA7) (fichas_ruina_3_col0 7AA3-7AA7)
;   (fichas_ruina_3_col0 7AA3-7AA7); lo leen p00:5286 (4 bytes)
;   0x7aa3..0x7aa7  (4 bytes)
DATA_fichas_ruina_3_col0:
	defb 002h,003h	; 7aa3
	defb 004h,005h	; 7aa5

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_col1: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5286 (4 bytes)
;   0x7aa7..0x7aab  (4 bytes)
DATA_fichas_ruina_3_col1:
	defb 001h,002h,003h,005h	; 7aa7

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_col2: 4 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; se solapan 4 bloques: (fichas_ruina_3_col2
;   7AAB-7AAF) (fichas_ruina_3_col2 7AAB-7AB3) (fichas_ruina_3_col2
;   7AAB-7AB3); lo leen p00:5286 (8 bytes)
;   0x7aab..0x7ab3  (8 bytes)
DATA_fichas_ruina_3_col2:
	defb 001h,002h,004h,005h	; 7aab
	defb 003h,00ah,00dh,00eh	; 7aaf

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_col3: 8 colores (indice -> color de la paleta) que
;   L_529C copia a 0xDF00; lo leen p00:5286 (8 bytes)
;   0x7ab3..0x7abb  (8 bytes)
DATA_fichas_ruina_3_col3:
	defb 00dh,004h,005h,002h,003h,000h,001h,006h	; 7ab3  ........

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5286 (67 bytes)
;   0x7abb..0x7afe  (67 bytes)
DATA_fichas_ruina_3:
	defb 00bh,002h,004h,080h,004h,0feh	; 7abb
	defb 07ah,000h,000h,084h,015h,03eh	; 7ac1
	defb 07bh,001h,054h,084h,004h,0c6h	; 7ac7
	defb 07bh,002h,000h,088h,034h,0e6h	; 7acd
	defb 07bh,003h,050h,08ch,004h,0e6h	; 7ad3
	defb 07eh,022h,000h,090h,008h,026h	; 7ad9
	defb 07fh,023h,020h,090h,002h,086h	; 7adf
	defb 07fh,012h,028h,090h,003h,0a6h	; 7ae5
	defb 07fh,024h,040h,090h,00ah,0d6h	; 7aeb
	defb 07fh,025h,078h,090h,002h,096h	; 7af1
	defb 080h,034h,064h,084h,001h,0e1h	; 7af7
	defb 089h	; 7afd

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_f0: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_ruina_3; lo leen p00:5286 (64 bytes)
;   0x7afe..0x7b3e  (64 bytes)
DATA_fichas_ruina_3_f0:
	defb 0a6h,002h,0e3h,038h,081h,03dh,094h,07eh,00eh,07eh,02dh,07ch,03ah,0fah,01dh,0fdh	; 7afe  ...8.=.~.~-|:...
	defb 0a2h,03ch,004h,0feh,018h,0feh,0b6h,0f6h,05ch,07dh,008h,03bh,0bdh,03bh,01ch,01dh	; 7b0e  .<......\}......
	defb 0ach,0fch,02dh,07ch,059h,079h,03bh,07ah,072h,071h,051h,053h,086h,022h,0eah,020h	; 7b1e  ..-|Yy.zrqQS.".
	defb 08ch,02ch,007h,076h,067h,076h,070h,078h,03eh,03ch,099h,0b9h,07ah,032h,013h,012h	; 7b2e  .,.vgvpx><..z2..

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_f1: 21 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 1 de la lista fichas_ruina_3; se solapan 2 bloques:
;   (fichas_ruina_3_f2 7BC6-7BE6); lo leen p00:5286 (168 bytes)
;   0x7b3e..0x7be6  (168 bytes)
DATA_fichas_ruina_3_f1:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7b3e  ........
	defb 0fdh,099h,0fch,0e6h,07eh,0feh,08eh,084h	; 7b46  ....~...
	defb 05bh,04bh,07ah,052h,052h,096h,00ch,044h	; 7b4e  [KzRR..D
	defb 06dh,0a9h,0b9h,0b9h,0d0h,0c2h,0d0h,0dah	; 7b56  m.......
	defb 0ffh,0f7h,0beh,0fbh,0bfh,0fbh,0b9h,0a9h	; 7b5e  ........
	defb 0ffh,07fh,0efh,0fdh,097h,079h,02ah,02ch	; 7b66  .....y*,
	defb 071h,065h,026h,022h,04bh,04bh,02fh,065h	; 7b6e  qe&"KK/e
	defb 03dh,05dh,0bfh,0bfh,07bh,05ah,0efh,077h	; 7b76  =]..{Z.w
	defb 09dh,0bfh,0bfh,07fh,0dfh,06eh,02eh,0feh	; 7b7e  .....n..
	defb 0ffh,0efh,0dfh,0deh,0bch,0bdh,0f1h,07ah	; 7b86  .......z
	defb 0ffh,0ffh,0ffh,0ffh,067h,0bah,045h,082h	; 7b8e  ....g.E.
	defb 0cfh,00dh,01eh,076h,097h,0bfh,0ffh,0ffh	; 7b96  ...v....
	defb 0fch,0afh,0bdh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7b9e  ........
	defb 0ffh,0feh,0e5h,0d8h,0d4h,0f2h,0ffh,0ffh	; 7ba6  ........
	defb 0cbh,0edh,0bdh,0ffh,0d6h,0feh,0ffh,0fah	; 7bae  ........
	defb 0ffh,0fdh,0fdh,0f7h,0fdh,0e6h,0ffh,0fdh	; 7bb6  ........
	defb 0ffh,0ffh,0feh,0fah,0fah,0fbh,0ffh,0ffh	; 7bbe  ........
	defb 0ffh,0efh,07fh,0dfh,0f7h,0dfh,097h,09dh	; 7bc6  ........
	defb 0fdh,0d7h,0dfh,0ffh,0d7h,05fh,0fdh,077h	; 7bce  ....._.w
	defb 07fh,0dfh,05fh,095h,0fbh,06bh,0ffh,0ffh	; 7bd6  .._..k..
	defb 07fh,0dfh,05fh,095h,0fbh,06bh,0dfh,0c9h	; 7bde  .._..k..

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_f3: 52 fichas de 8x8 a 2 bit(s) por punto (16 bytes
;   cada una), entrada 3 de la lista fichas_ruina_3; se solapan 2 bloques:
;   (fichas_ruina_3_f4 7EE6-7F26); lo leen p00:5286 (832 bytes)
;   0x7be6..0x7f26  (832 bytes)
DATA_fichas_ruina_3_f3:
	defb 064h,024h,064h,004h,031h,010h,031h,010h,071h,000h,05dh,008h,09dh,000h,089h,000h	; 7be6  d$d.1.1.q.].....
	defb 043h,040h,049h,040h,06ah,060h,020h,020h,02ah,020h,022h,020h,080h,080h,08ch,08ch	; 7bf6  C@I@j`  * " ....
	defb 03dh,000h,04dh,000h,0bfh,000h,097h,000h,04bh,000h,00ah,000h,0d1h,0d0h,000h,000h	; 7c06  =.M.....K.......
	defb 0aah,002h,0abh,002h,092h,002h,0b9h,010h,0abh,002h,0fah,010h,06ah,000h,07ah,020h	; 7c16  ............j.z
	defb 0fah,008h,0dah,000h,0cdh,004h,0ddh,010h,09eh,012h,0ceh,04ah,096h,000h,0c7h,044h	; 7c26  ...........J...D
	defb 0b9h,000h,0b6h,010h,0beh,010h,0ebh,000h,0afh,000h,0ebh,000h,0b9h,010h,0a9h,000h	; 7c36  ................
	defb 0ech,000h,068h,000h,0ech,000h,0edh,000h,0b7h,020h,039h,020h,068h,040h,06ch,040h	; 7c46  ..h...... 9 h@l@
	defb 0ddh,010h,0e2h,020h,085h,000h,0d5h,040h,053h,040h,085h,080h,0cah,0c0h,04bh,040h	; 7c56  ... ...@S@....K@
	defb 0cbh,042h,0a9h,0a0h,0cbh,0c2h,0c2h,040h,0e4h,020h,0e4h,020h,0c6h,004h,0cbh,002h	; 7c66  .B.....@. . ....
	defb 0a7h,000h,0f3h,000h,0abh,080h,09bh,080h,02bh,020h,00ah,000h,0afh,0a0h,08eh,080h	; 7c76  ........+ ......
	defb 064h,040h,06ch,040h,028h,020h,0a9h,020h,081h,000h,0bbh,020h,0b5h,020h,0c5h,000h	; 7c86  d@l@( . ... . ..
	defb 053h,040h,017h,000h,046h,040h,08dh,000h,0adh,000h,08fh,000h,09ah,000h,0dah,000h	; 7c96  S@..F@..........
	defb 089h,000h,099h,000h,093h,002h,0c7h,004h,046h,004h,0c4h,000h,04ch,000h,06ch,000h	; 7ca6  ........F...L.l.
	defb 026h,022h,0f5h,070h,0c6h,042h,0c4h,040h,0e6h,022h,0e6h,022h,0c4h,000h,0e6h,020h	; 7cb6  &".p.B.@."."...
	defb 065h,000h,06dh,000h,071h,000h,031h,000h,034h,014h,024h,004h,071h,010h,064h,024h	; 7cc6  e.m.q.1.4.$.q.d$
	defb 04eh,000h,04eh,006h,04eh,002h,07ch,000h,0a6h,002h,097h,000h,0d3h,000h,0a9h,000h	; 7cd6  N.N.N.|.........
	defb 072h,000h,0b9h,001h,0d0h,000h,0d1h,001h,0e3h,003h,0c0h,000h,052h,002h,062h,002h	; 7ce6  r...........R.b.
	defb 0dch,03ch,0cah,03ah,09ah,07ah,088h,068h,0ach,06ch,0ach,06ch,0cch,02ch,0f4h,034h	; 7cf6  .<.:.z.h.l.l.,.4
	defb 0eah,02ah,0b4h,074h,0f4h,074h,0aah,07ah,01ah,0dah,06bh,0ebh,02bh,0ebh,084h,064h	; 7d06  .*.t.t.z..k.+..d
	defb 022h,020h,046h,040h,006h,000h,026h,000h,00dh,000h,02bh,000h,03bh,000h,039h,000h	; 7d16  " F@..&...+...9.
	defb 0b8h,000h,07eh,000h,0dfh,000h,02fh,000h,078h,000h,0c7h,006h,03fh,030h,071h,041h	; 7d26  ..~.../.x...?0qA
	defb 057h,054h,0afh,028h,09fh,018h,04fh,04ch,02fh,02ch,00fh,008h,05fh,058h,017h,014h	; 7d36  WT.(..OL/,.._X..
	defb 0dfh,018h,06fh,008h,08fh,008h,0cfh,00ch,097h,014h,0cbh,00ah,08bh,00ah,08fh,00ch	; 7d46  ..o.............
	defb 0f3h,012h,0fbh,01ah,0f9h,00ah,0fdh,00eh,0bbh,004h,0bbh,004h,09fh,000h,0dfh,000h	; 7d56  ................
	defb 0d7h,087h,0f3h,083h,0e1h,001h,0f9h,041h,0f3h,023h,0f9h,011h,0f9h,011h,0f3h,013h	; 7d66  .......A.#......
	defb 0efh,0f0h,05fh,060h,05fh,060h,0dfh,0e0h,0bfh,0c0h,07fh,080h,07fh,080h,0ffh,000h	; 7d76  .._`_`..........
	defb 0b8h,000h,07eh,000h,0dfh,000h,02fh,000h,078h,000h,0c7h,006h,03fh,03ch,077h,078h	; 7d86  ..~.../.x...?<wx
	defb 072h,000h,0b9h,001h,0d1h,000h,0d3h,001h,0e7h,001h,0c2h,000h,052h,002h,062h,002h	; 7d96  r...........R.b.
	defb 08fh,000h,0efh,0a0h,047h,040h,0b3h,0b0h,078h,060h,0fch,0c0h,0ffh,081h,0ffh,001h	; 7da6  ....G@..x`......
	defb 0cah,0c8h,0d6h,0c4h,0dah,0cah,06dh,06dh,0a2h,0b2h,00dh,02dh,052h,07eh,000h,0ffh	; 7db6  ......mm...-R~..
	defb 057h,017h,0a7h,026h,0afh,02eh,037h,036h,0f7h,056h,0efh,08eh,0efh,0ach,0efh,02ch	; 7dc6  W..&..76.V.....,
	defb 0f4h,00ch,0f9h,005h,0fdh,003h,0fdh,003h,0ffh,001h,0feh,001h,0ffh,000h,0ffh,000h	; 7dd6  ................
	defb 043h,040h,041h,040h,022h,060h,008h,028h,088h,0a8h,0a5h,0a4h,005h,084h,025h,0a4h	; 7de6  C@A@"`.(......%.
	defb 09eh,080h,09bh,090h,0ceh,0c8h,04ah,048h,069h,068h,02dh,028h,02eh,024h,024h,020h	; 7df6  ......JHih-(.$$
	defb 0d7h,087h,0f3h,083h,0e1h,001h,0f9h,041h,0d3h,023h,0f9h,011h,0e9h,011h,0f3h,013h	; 7e06  .......A.#......
	defb 0e1h,081h,083h,003h,0f3h,002h,0e7h,0c6h,0efh,00ch,09fh,018h,07fh,060h,0ffh,000h	; 7e16  .............`..
	defb 081h,081h,085h,005h,07fh,040h,0f3h,080h,05fh,001h,0dbh,09bh,091h,091h,0d1h,0d1h	; 7e26  .....@.._.......
	defb 05fh,000h,0dfh,080h,05fh,000h,0dfh,080h,0ffh,0a0h,0ffh,0a0h,0ffh,080h,0dfh,000h	; 7e36  _..._...........
	defb 0d0h,010h,04ah,008h,0abh,0aah,0ebh,0e8h,034h,076h,042h,0feh,000h,0ffh,000h,0ffh	; 7e46  ..J.....4vB.....
	defb 0ffh,000h,0f7h,001h,0eeh,000h,0edh,001h,0feh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7e56  ................
	defb 09fh,000h,0cbh,0c8h,02bh,022h,055h,050h,093h,010h,0feh,020h,0feh,008h,0e7h,004h	; 7e66  ....+"UP... ....
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,080h,0ffh,040h,07fh,040h	; 7e76  .............@.@
	defb 0a2h,022h,031h,020h,07bh,000h,0f9h,000h,063h,000h,0fbh,000h,0f7h,000h,0ffh,000h	; 7e86  ."1 {...c.......
	defb 053h,040h,017h,000h,046h,040h,08dh,000h,0adh,000h,08fh,000h,09bh,000h,0dfh,000h	; 7e96  S@..F@..........
	defb 0cbh,042h,0a9h,0a0h,0cbh,0c2h,0c3h,040h,0e7h,020h,0f7h,020h,0efh,000h,0ffh,002h	; 7ea6  .B.....@. . ....
	defb 037h,004h,0bbh,008h,0f7h,044h,07fh,058h,0fah,040h,0ceh,088h,083h,002h,081h,001h	; 7eb6  7....D.X.@......
	defb 0bfh,020h,0bfh,020h,07fh,040h,07fh,040h,0ffh,0a0h,0bfh,020h,03fh,000h,0ffh,020h	; 7ec6  . . .@.@... ?..
	defb 0ceh,000h,0cfh,000h,0afh,000h,0cch,000h,0d7h,000h,0efh,000h,0feh,002h,0ffh,000h	; 7ed6  ................
	defb 0fah,000h,0eah,000h,0e6h,002h,0fch,000h,0f6h,000h,0ffh,002h,0ech,000h,0eeh,000h	; 7ee6  ................
	defb 0f8h,000h,0ech,000h,0feh,002h,0eah,002h,0fch,000h,0feh,000h,0e8h,000h,0eeh,000h	; 7ef6  ................
	defb 0c1h,001h,0afh,007h,041h,001h,0c7h,007h,0d2h,002h,038h,008h,060h,000h,0e4h,000h	; 7f06  ....A.....8.`...
	defb 0c5h,005h,0f3h,012h,02fh,00eh,0adh,00eh,09bh,01ch,09ah,01ch,0ech,028h,06dh,029h	; 7f16  ..../........(m)

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_f5: 8 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 5 de la lista fichas_ruina_3; se solapan 2 bloques:
;   (fichas_ruina_3_f6 7F86-7FA6); lo leen p00:5286 (128 bytes)
;   0x7f26..0x7fa6  (128 bytes)
DATA_fichas_ruina_3_f5:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7f26  ................
	defb 01eh,012h,01eh,01ah,00ch,00ah,00ch,00eh,000h,004h,000h,004h,000h,000h,000h,000h	; 7f36  ................
	defb 0e0h,0f0h,0c0h,060h,0c0h,060h,0c0h,0e0h,080h,0c0h,000h,080h,000h,080h,000h,000h	; 7f46  ...`.`..........
	defb 0ffh,084h,0ffh,009h,0ffh,02bh,0feh,05fh,0f8h,03ch,0f0h,038h,0f0h,078h,0f0h,0f8h	; 7f56  .....+._.<.8.x..
	defb 000h,000h,000h,000h,000h,030h,03ch,07ch,07eh,0ceh,0ffh,0bfh,0ffh,0e5h,0ffh,080h	; 7f66  .....0<|~.......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,020h,038h,07ch,07ch,0fch,0cfh,0ffh,0a7h	; 7f76  ........ 8||....
	defb 080h,0c0h,080h,0c0h,0e0h,0e0h,0e0h,070h,0f0h,0fch,0fch,03eh,0ffh,06fh,0ffh,0cah	; 7f86  .......p...>.o..
	defb 003h,00fh,000h,003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7f96  ................

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_f7: 3 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 7 de la lista fichas_ruina_3; lo leen p00:5286 (48 bytes)
;   0x7fa6..0x7fd6  (48 bytes)
DATA_fichas_ruina_3_f7:
	defb 0e0h,060h,0f0h,0b0h,078h,098h,03ch,0fch,09eh,06eh,09fh,06fh,02fh,0d3h,013h,0ech	; 7fa6  .`..x.<..n.o/...
	defb 0afh,0d7h,08fh,0f3h,01fh,061h,047h,079h,02fh,033h,017h,019h,017h,019h,01fh,013h	; 7fb6  .....aGy/3......
	defb 070h,08fh,0b0h,0efh,0f8h,047h,0fch,0b3h,0e7h,060h,0c3h,0c0h,081h,081h,001h,001h	; 7fc6  p....G...`......

; ----------------------------------------------------------------------
; DATOS fichas_ruina_3_f8: 10 fichas de 8x8 a 3 bit(s) por punto (24 bytes
;   cada una), entrada 8 de la lista fichas_ruina_3 (sigue en el banco 8, en
;   0x8000); lo leen p00:5286 (42 bytes)
;   0x7fd6..0x8000  (42 bytes)
DATA_fichas_ruina_3_f8:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,003h,000h,01fh,03eh,000h,06fh,0c8h,010h,0fch,0b8h,003h,0fbh,0f0h,004h	; 7fd6  .............>.o........
	defb 000h,000h,000h,000h,000h,000h,000h,0c0h,000h,0e0h,0f0h,000h,0f9h,01fh,000h,03fh,007h,0c0h	; 7fee  ...............?..
