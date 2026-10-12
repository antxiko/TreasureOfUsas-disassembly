; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 11 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS mapa_fase_21_cola: RLE (L_5578): el mapa de la fase 21, 48 bytes por
;   pantalla (p15:BEBF) (sigue del banco 10); lo leen p00:5516 (438 bytes)
;   0x8000..0x81b6  (438 bytes)
DATA_mapa_fase_21_cola:
	defb 002h,00dh,020h,000h,037h,025h,025h,036h,000h,020h,054h,022h,055h,054h,054h,056h	; 8000  .. .7%%6. T"UTTV
	defb 022h,054h,00ch,021h,000h,021h,021h,000h,021h,00ch,00eh,000h,021h,000h,000h,021h	; 8010  "T.!.!!.!...!..!
	defb 000h,00eh,020h,036h,037h,000h,036h,037h,037h,020h,00dh,003h,002h,000h,003h,002h	; 8020  .. 67.677 ......
	defb 002h,00dh,020h,021h,021h,025h,025h,021h,021h,020h,054h,022h,022h,054h,054h,022h	; 8030  .. !!%%!! T""TT"
	defb 022h,054h,00ch,005h,000h,084h,041h,02bh,00eh,000h,003h,021h,095h,000h,041h,02bh	; 8040  "T....A+...!..A+
	defb 020h,036h,037h,000h,036h,037h,045h,02fh,00dh,003h,002h,000h,003h,002h,001h,02dh	; 8050   67.67E/.......-
	defb 020h,000h,003h,021h,084h,000h,025h,02fh,054h,005h,022h,002h,054h,0b4h,02ah,000h	; 8060   ..!..%/T.".T.*.
	defb 00ch,000h,00ch,000h,00ch,000h,03ah,025h,020h,025h,020h,025h,020h,025h,03ch,001h	; 8070  ......:% % % %<.
	defb 006h,007h,001h,006h,007h,001h,03ch,000h,010h,011h,000h,010h,011h,04ah,03ch,000h	; 8080  ......<......J<.
	defb 012h,013h,000h,012h,013h,02bh,046h,025h,014h,015h,025h,014h,015h,02fh,00ch,021h	; 8090  .....+F%..%../.!
	defb 041h,02ah,003h,021h,0ddh,00ch,020h,025h,045h,02eh,036h,025h,025h,020h,001h,001h	; 80a0  A*.!.. %E.6%% ..
	defb 00dh,001h,003h,00dh,001h,001h,025h,025h,020h,025h,021h,00eh,021h,000h,02ch,001h	; 80b0  ......%% %!.!.,.
	defb 00dh,001h,021h,00eh,021h,000h,02eh,025h,020h,025h,025h,020h,025h,025h,000h,00ch	; 80c0  ..!.!..% %% %%..
	defb 000h,010h,011h,000h,00ch,000h,025h,020h,000h,012h,013h,000h,00eh,027h,001h,00dh	; 80d0  ......% .....'..
	defb 021h,016h,017h,021h,00eh,000h,000h,00eh,021h,010h,011h,021h,00eh,000h,000h,00eh	; 80e0  !..!....!..!....
	defb 000h,012h,013h,000h,00eh,000h,025h,020h,04fh,016h,017h,025h,020h,025h,000h,008h	; 80f0  ......% O..% %..
	defb 009h,000h,003h,021h,084h,02bh,027h,00ah,00bh,004h,027h,085h,031h,000h,00ah,00bh	; 8100  ...!.+'...'.1...
	defb 000h,003h,021h,094h,02bh,000h,010h,011h,04eh,025h,021h,021h,02bh,000h,012h,013h	; 8110  ..!.+...N%!!+...
	defb 04eh,04eh,025h,021h,02bh,025h,014h,015h,003h,04eh,083h,044h,02fh,02ah,007h,000h	; 8120  NN%!+%...N.D/*..
	defb 0aah,02ah,021h,000h,021h,000h,021h,000h,025h,02ah,000h,021h,000h,021h,000h,021h	; 8130  .*!.!.!.%*.!.!.!
	defb 001h,02eh,025h,025h,000h,000h,025h,04dh,000h,02ch,001h,001h,000h,000h,001h,03ch	; 8140  ..%%..%M.,.....<
	defb 000h,02eh,025h,025h,000h,025h,025h,046h,025h,021h,00ch,003h,021h,095h,00ch,021h	; 8150  ..%%.%%F%!..!..!
	defb 021h,025h,00eh,000h,037h,000h,00eh,037h,025h,001h,00eh,000h,002h,000h,00eh,002h	; 8160  !%..7..7%.......
	defb 02dh,00ch,00eh,003h,000h,095h,00eh,00ch,02bh,00eh,00eh,000h,021h,000h,00eh,00eh	; 8170  -.......+...!...
	defb 02bh,020h,020h,044h,025h,025h,020h,020h,02fh,000h,02bh,004h,021h,084h,000h,02bh	; 8180  +  D%%  /.+.!..+
	defb 049h,04ch,003h,027h,08eh,03eh,032h,02bh,02ah,037h,044h,025h,025h,045h,02ah,02bh	; 8190  IL.'.>2+*7D%%E*+
	defb 02ah,002h,042h,003h,001h,084h,003h,02bh,02ah,039h,004h,027h,083h,03eh,031h,02eh	; 81a0  *.B....+*9.'.>1.
	defb 005h,025h,082h,045h,02fh,000h	; 81b0

; ----------------------------------------------------------------------
; DATOS mapa_fase_22: RLE (L_5578): el mapa de la fase 22, 48 bytes por
;   pantalla (p15:BEBF); lo leen p00:5516 (628 bytes)
;   0x81b6..0x842a  (628 bytes)
DATA_mapa_fase_22:
	defb 081h,02ah,007h,000h,082h,02ah,021h,004h,000h,09ah,021h,035h,02ah,021h,000h,021h	; 81b6  .*...*!...!5*!.!
	defb 021h,000h,021h,02dh,02ah,021h,000h,021h,021h,000h,021h,02bh,003h,021h,000h,021h	; 81c6  !.!-*!.!!.!+.!.!
	defb 021h,000h,021h,02bh,007h,025h,081h,02fh,006h,000h,093h,00ch,000h,04dh,000h,000h	; 81d6  !.!+.%./.....M..
	defb 021h,021h,000h,020h,025h,03ch,000h,000h,021h,021h,000h,00dh,001h,03ch,004h,000h	; 81e6  !!. %<..!!...<..
	defb 08ch,025h,020h,025h,03ch,000h,000h,021h,021h,001h,00dh,001h,046h,005h,025h,084h	; 81f6  .% %<..!!...F.%.
	defb 020h,025h,000h,00ch,004h,000h,0d7h,00ch,02bh,025h,020h,025h,04dh,025h,025h,020h	; 8206   %......+% %M%%
	defb 02fh,00dh,001h,00dh,03ch,001h,00dh,001h,00dh,020h,025h,020h,046h,025h,020h,025h	; 8216  /...<.... % F% %
	defb 020h,001h,001h,00dh,001h,001h,00dh,001h,001h,025h,025h,020h,025h,025h,020h,025h	; 8226   ........%% %% %
	defb 025h,02ah,021h,041h,021h,03ch,02ah,000h,021h,02eh,035h,041h,000h,03ch,03ah,025h	; 8236  %*!A!<*.!.5A.<:%
	defb 025h,001h,02dh,041h,021h,03ch,03ch,001h,001h,025h,02fh,041h,000h,03ch,03ch,000h	; 8246  %.-A!<<..%/A.<<.
	defb 000h,001h,001h,041h,021h,03ch,029h,027h,027h,025h,025h,045h,025h,046h,003h,025h	; 8256  ...A!<)''%%E%F.%
	defb 0a0h,041h,03ch,021h,021h,00ch,021h,021h,02bh,045h,046h,025h,025h,020h,044h,025h	; 8266  .A<!!.!!+EF%% D%
	defb 02fh,001h,02dh,001h,001h,00dh,042h,001h,02dh,021h,02bh,021h,021h,047h,041h,021h	; 8276  /.-...B.-!+!!GA!
	defb 02bh,006h,027h,082h,03eh,031h,006h,025h,09ch,045h,02fh,03ch,000h,000h,005h,018h	; 8286  +.'.>1.%.E/<....
	defb 048h,019h,005h,03ch,000h,000h,004h,01ah,048h,01bh,004h,03ch,000h,000h,004h,01ch	; 8296  H..<....H..<....
	defb 023h,01dh,004h,030h,03eh,006h,027h,082h,02ah,041h,006h,000h,082h,02eh,045h,006h	; 82a6  #..0>.'.*A....E.
	defb 025h,002h,00ch,096h,041h,00ch,02ah,000h,00ch,000h,00eh,00eh,041h,00eh,03ah,034h	; 82b6  %...A.*.....A.:4
	defb 020h,035h,047h,047h,041h,047h,03ch,02ch,001h,02dh,004h,027h,094h,03ch,02ah,021h	; 82c6   5GGAG<,.-.'.<*!
	defb 02bh,000h,021h,021h,000h,03ch,02ah,021h,02bh,025h,025h,04dh,025h,03ch,02ah,000h	; 82d6  +.!!.<*!+%%M%<*.
	defb 02bh,003h,000h,002h,00ch,090h,000h,041h,02bh,04dh,034h,025h,020h,020h,025h,045h	; 82e6  +......A+M4%  %E
	defb 02fh,03ch,02ch,001h,00dh,00dh,003h,001h,09bh,03ch,03ah,025h,020h,020h,025h,025h	; 82f6  /<,......<:%  %%
	defb 035h,03ch,03ch,001h,00dh,00dh,001h,001h,02dh,03ch,03ch,000h,00eh,00eh,000h,000h	; 8306  5<<.....-<<.....
	defb 02bh,02ah,000h,000h,003h,021h,002h,000h,081h,03ah,007h,025h,0d4h,03ch,001h,001h	; 8316  +*...!...:.%.<..
	defb 00dh,001h,00dh,001h,001h,046h,025h,025h,020h,025h,020h,025h,025h,02ch,001h,001h	; 8326  .....F%% % %%,..
	defb 00dh,001h,00dh,001h,001h,03ah,025h,025h,020h,025h,020h,025h,025h,000h,00ch,000h	; 8336  .....:%% % %%...
	defb 00ch,00ch,000h,00ch,000h,025h,020h,025h,020h,020h,025h,020h,025h,001h,00dh,001h	; 8346  .....% %  % %...
	defb 02ch,001h,001h,00dh,001h,025h,020h,04dh,03ah,025h,025h,020h,025h,001h,00dh,03ch	; 8356  ,....% M:%% %..<
	defb 03ch,001h,001h,00dh,001h,025h,020h,03ch,046h,025h,025h,020h,025h,000h,021h,00ch	; 8366  <....% <F%% %.!.
	defb 000h,003h,021h,089h,02bh,025h,025h,020h,025h,025h,04dh,04dh,02fh,005h,001h,002h	; 8376  ..!.+%% %%MM/...
	defb 03ch,081h,02dh,005h,025h,002h,03ch,093h,02bh,001h,001h,00dh,001h,001h,042h,03ch	; 8386  <.-.%.<.+.....B<
	defb 02bh,025h,025h,020h,025h,025h,045h,03ch,02bh,02ah,00ch,004h,000h,08ch,00ch,000h	; 8396  +%% %%E<+*......
	defb 02ah,00eh,000h,021h,021h,025h,020h,035h,003h,00eh,003h,000h,095h,001h,00dh,02dh	; 83a6  *..!!% 5.......-
	defb 04dh,020h,000h,021h,021h,000h,00eh,02bh,03ch,00dh,000h,021h,021h,000h,00eh,02bh	; 83b6  M .!!..+<..!!..+
	defb 046h,020h,004h,025h,084h,020h,02fh,000h,00ch,004h,000h,08ch,00ch,000h,04dh,020h	; 83c6  F .%. /.......M
	defb 000h,021h,021h,000h,020h,035h,03ch,00dh,004h,000h,094h,00dh,02dh,03ch,00eh,000h	; 83d6  .!!. 5<.....-<..
	defb 021h,021h,000h,00eh,02bh,03ch,00eh,000h,021h,021h,000h,00eh,02bh,046h,020h,004h	; 83e6  !!..+<..!!..+F .
	defb 022h,094h,020h,02fh,000h,000h,021h,00ch,00ch,021h,000h,02bh,034h,044h,021h,047h	; 83f6  ". /..!..!.+4D!G
	defb 047h,021h,000h,02bh,02ch,042h,003h,039h,095h,037h,000h,02bh,02ah,041h,021h,00ch	; 8406  G!.+,B.9.7.+*A!.
	defb 00ch,021h,039h,031h,02ah,041h,00ch,00eh,00eh,00ch,000h,02bh,02eh,045h,004h,020h	; 8416  .!91*A.....+.E.
	defb 082h,025h,02fh,000h	; 8426

; ----------------------------------------------------------------------
; DATOS mapa_fase_23: RLE (L_5578): el mapa de la fase 23, 48 bytes por
;   pantalla (p15:BEBF); lo leen p00:5516 (615 bytes)
;   0x842a..0x8691  (615 bytes)
DATA_mapa_fase_23:
	defb 0c8h,00ch,021h,021h,00ch,021h,021h,00ch,021h,020h,025h,025h,020h,025h,025h,020h	; 842a  ..!!.!!.! %% %%
	defb 025h,02ch,001h,001h,00dh,001h,001h,00dh,001h,02eh,044h,025h,020h,025h,025h,020h	; 843a  %,........D% %%
	defb 025h,02ch,042h,001h,00dh,001h,001h,00dh,001h,03ah,045h,000h,020h,04fh,025h,020h	; 844a  %,B......:E. O%
	defb 025h,000h,021h,021h,000h,000h,00ch,000h,02bh,025h,025h,037h,025h,025h,020h,044h	; 845a  %.!!....+%%7%% D
	defb 02fh,001h,001h,002h,001h,001h,00dh,042h,02dh,003h,025h,085h,037h,025h,020h,045h	; 846a  /......B-.%.7% E
	defb 02fh,003h,001h,085h,002h,001h,00dh,001h,02dh,003h,025h,0c0h,04eh,037h,020h,044h	; 847a  /.......-.%.N7 D
	defb 02fh,02ah,000h,00ch,000h,008h,009h,000h,02bh,02eh,025h,00eh,000h,00ah,00bh,025h	; 848a  /*......+.%....%
	defb 02fh,02ch,001h,047h,000h,00ah,00bh,001h,02dh,02ah,021h,00ch,021h,010h,011h,021h	; 849a  /,.G....-*!.!..!
	defb 02bh,02ah,021h,00eh,021h,012h,013h,021h,02bh,02eh,025h,020h,037h,014h,015h,044h	; 84aa  +*!.!..!+.% 7..D
	defb 02fh,03ch,000h,00ch,000h,021h,000h,00ch,000h,03ch,000h,047h,003h,025h,085h,020h	; 84ba  /<...!...<.G.%.
	defb 025h,03ch,000h,00ch,003h,001h,096h,00dh,001h,03ch,021h,00eh,037h,025h,000h,00eh	; 84ca  %<.......<!.7%..
	defb 021h,03ch,021h,00eh,050h,04eh,025h,00eh,021h,046h,025h,020h,04fh,003h,04eh,0f8h	; 84da  !<!.PN%.!F% O.N.
	defb 025h,000h,00ch,021h,00ch,021h,00ch,041h,02bh,025h,020h,025h,020h,025h,020h,045h	; 84ea  %..!.!.A+% % % E
	defb 02fh,00dh,001h,00dh,001h,00dh,001h,00dh,02dh,00eh,021h,00eh,000h,00eh,021h,00eh	; 84fa  /.......-.!...!.
	defb 002h,00eh,000h,00eh,000h,00eh,000h,00eh,000h,020h,022h,020h,022h,020h,022h,020h	; 850a  ......... " " "
	defb 04eh,02ah,00ch,000h,008h,009h,000h,00ch,000h,02ah,00eh,021h,00ah,00bh,021h,00eh	; 851a  N*.......*.!..!.
	defb 000h,02eh,020h,025h,00ah,00bh,025h,020h,025h,001h,00dh,001h,010h,011h,001h,00dh	; 852a  .. %..% %.......
	defb 001h,000h,00eh,021h,012h,013h,021h,00eh,000h,04eh,020h,025h,014h,015h,025h,020h	; 853a  ...!..!..N %..%
	defb 025h,000h,005h,000h,021h,021h,000h,041h,000h,000h,004h,000h,000h,025h,025h,045h	; 854a  %...!!.A.....%%E
	defb 025h,025h,00fh,044h,036h,001h,006h,007h,003h,001h,0b6h,042h,003h,025h,010h,011h	; 855a  %%.D6......B.%..
	defb 025h,000h,000h,041h,000h,001h,012h,013h,001h,044h,044h,045h,036h,025h,014h,015h	; 856a  %..A.....DDE6%..
	defb 025h,000h,000h,008h,009h,000h,000h,00ch,02bh,025h,025h,010h,011h,025h,025h,020h	; 857a  %.......+%%..%%
	defb 02fh,001h,001h,012h,013h,001h,001h,00dh,02dh,025h,025h,014h,015h,025h,037h,020h	; 858a  /.......-%%..%7
	defb 02fh,005h,001h,0b3h,002h,00dh,02dh,025h,025h,04eh,036h,025h,025h,020h,02fh,03ch	; 859a  /.....-%%N6%% /<
	defb 041h,008h,009h,000h,00ch,000h,000h,03ch,041h,00ah,00bh,000h,00eh,000h,000h,03ch	; 85aa  A......<A......<
	defb 041h,010h,011h,021h,047h,021h,021h,03ch,041h,012h,013h,000h,00ch,000h,000h,03ch	; 85ba  A..!G!!<A......<
	defb 041h,016h,017h,000h,047h,000h,000h,006h,04eh,084h,04fh,04eh,000h,005h,004h,000h	; 85ca  A...G...N.ON....
	defb 08ch,005h,000h,000h,004h,000h,021h,021h,000h,004h,025h,000h,004h,004h,000h,095h	; 85da  ......!!..%.....
	defb 004h,001h,021h,004h,000h,000h,050h,04eh,00fh,021h,000h,004h,000h,000h,050h,04eh	; 85ea  ..!...PN.!....PN
	defb 04eh,025h,04eh,04eh,051h,005h,04eh,092h,000h,021h,00ch,021h,021h,00ch,021h,02bh	; 85fa  N%NNQ.N..!.!!.!+
	defb 044h,034h,020h,025h,025h,020h,044h,02fh,042h,02ch,004h,001h,084h,042h,02dh,041h	; 860a  D4 %% D/B,...B-A
	defb 03ah,004h,025h,093h,045h,02fh,045h,03ch,00dh,001h,001h,00dh,001h,02dh,04eh,046h	; 861a  :.%.E/E<.....-NF
	defb 020h,025h,025h,020h,044h,02fh,000h,003h,021h,002h,000h,093h,03ch,02bh,034h,036h	; 862a   %% D/..!...<+46
	defb 037h,036h,034h,000h,03ch,02bh,02ch,003h,002h,003h,02ch,000h,03ch,02bh,02ah,003h	; 863a  764.<+,...,.<+*.
	defb 021h,085h,03ah,025h,03ch,02bh,02ah,003h,021h,085h,042h,001h,042h,02bh,02eh,003h	; 864a  !.:%<+*.!.B.B+..
	defb 025h,0b4h,045h,025h,045h,02fh,02ah,00ch,000h,010h,011h,000h,00ch,000h,03ah,047h	; 865a  %.E%E/*.......:G
	defb 021h,012h,013h,021h,047h,035h,03ch,00ch,021h,016h,017h,021h,00ch,02dh,03ch,00eh	; 866a  !..!G5<.!..!.-<.
	defb 000h,010h,011h,000h,00eh,02bh,03ch,00eh,038h,012h,013h,039h,00eh,02bh,04eh,020h	; 867a  .....+<.8..9.+N
	defb 025h,014h,015h,025h,020h,04eh,000h	; 868a

; ----------------------------------------------------------------------
; DATOS mapa_fase_24: RLE (L_5578): el mapa de la fase 24, 48 bytes por
;   pantalla (p15:BEBF); lo leen p00:5516 (570 bytes)
;   0x8691..0x88cb  (570 bytes)
DATA_mapa_fase_24:
	defb 0b1h,02ah,005h,018h,048h,019h,005h,041h,02bh,02ah,004h,01ah,048h,01bh,004h,045h	; 8691  .*..H..A+*..H..E
	defb 02fh,02ah,004h,01ch,023h,01dh,004h,001h,02dh,02ah,004h,01ch,024h,01dh,004h,000h	; 86a1  /*..#...-*..$...
	defb 02bh,003h,004h,01ch,024h,01dh,004h,000h,02bh,025h,00fh,01eh,026h,01fh,00fh,025h	; 86b1  +...$...+%..&..%
	defb 02fh,03ch,005h,021h,083h,000h,02bh,046h,004h,025h,0a8h,036h,000h,02fh,02ch,005h	; 86c1  /<.!..+F.%.6./,.
	defb 018h,048h,019h,005h,000h,02dh,02ah,004h,01ah,048h,01bh,004h,000h,02bh,02ah,004h	; 86d1  .H...-*..H...+*.
	defb 01ch,023h,01dh,004h,000h,02bh,02ah,004h,01ch,024h,01dh,004h,044h,02fh,02ah,018h	; 86e1  .#...+*..$..D/*.
	defb 048h,048h,019h,003h,021h,0d2h,02ah,01ah,048h,048h,01bh,04ah,036h,037h,02ah,01ch	; 86f1  HH..!.*.HH.J67*.
	defb 023h,023h,01dh,02bh,003h,002h,02ah,01ch,024h,024h,01dh,02bh,025h,025h,02ah,01ch	; 8701  ##.+..*.$$.+%%*.
	defb 024h,024h,01dh,02bh,001h,001h,03ah,01eh,026h,026h,01fh,02fh,000h,037h,000h,021h	; 8711  $$.+..:.&&./.7.!
	defb 000h,021h,021h,000h,021h,02bh,036h,037h,000h,036h,037h,000h,025h,02fh,003h,002h	; 8721  .!!.!+67.67.%/..
	defb 000h,003h,002h,000h,001h,001h,025h,025h,000h,021h,021h,000h,025h,04ah,001h,001h	; 8731  ......%%.!!.%J..
	defb 000h,021h,021h,000h,001h,02bh,025h,025h,004h,022h,08dh,025h,02fh,02ah,000h,00ch	; 8741  .!!..+%%.".%/*..
	defb 000h,021h,021h,000h,02bh,02ah,025h,020h,003h,025h,085h,04dh,02bh,003h,001h,00dh	; 8751  .!!.+*% .%.M+...
	defb 003h,001h,0afh,03ch,02bh,04dh,049h,00eh,000h,021h,021h,03ch,02bh,03ch,02ah,00eh	; 8761  ...<+MI..!!<+<*.
	defb 000h,021h,021h,03ch,02bh,03ch,02eh,020h,025h,025h,044h,03ch,02bh,03ch,000h,00ch	; 8771  .!!<+<. %%D<+<..
	defb 000h,00ch,041h,03ch,000h,03ch,000h,020h,025h,020h,045h,046h,025h,03ch,000h,001h	; 8781  ..A<.<. % EF%<..
	defb 006h,007h,003h,001h,08dh,03ch,000h,000h,010h,011h,000h,000h,027h,03ch,000h,000h	; 8791  .....<......'<..
	defb 012h,013h,003h,000h,0a0h,046h,025h,025h,014h,015h,025h,025h,04eh,000h,00ch,000h	; 87a1  .....F%%..%%N...
	defb 00ch,000h,00ch,000h,02bh,044h,020h,025h,020h,025h,020h,04dh,02bh,042h,00dh,001h	; 87b1  ....+D % % M+B..
	defb 00dh,001h,00dh,03ch,02bh,004h,027h,084h,053h,03eh,03ch,02bh,004h,000h,084h,02ah	; 87c1  ...<+.'.S><+...*
	defb 041h,03ch,02bh,004h,04eh,099h,03ah,045h,03ch,02bh,02ah,00ch,00ch,021h,021h,00ch	; 87d1  A<+.N.:E<+*..!!.
	defb 00ch,000h,03ah,020h,020h,025h,049h,047h,047h,000h,03ch,00dh,00dh,001h,030h,003h	; 87e1  ..:  %IGG.<...0.
	defb 027h,08dh,046h,020h,020h,044h,02ah,021h,021h,000h,02ch,00dh,00dh,042h,029h,003h	; 87f1  '.F  D*!!.,..B).
	defb 027h,084h,02eh,020h,020h,045h,004h,025h,002h,000h,002h,00ch,08eh,041h,000h,03ch	; 8801  '..  E.%.....A.<
	defb 02bh,000h,04ah,020h,020h,045h,025h,03ch,02bh,03eh,031h,004h,001h,0ffh,03ch,02bh	; 8811  +.J  E%<+>1...<+
	defb 041h,02bh,025h,025h,044h,025h,03ch,02bh,027h,027h,00dh,00dh,042h,001h,03ch,02bh	; 8821  A+%%D%<+''..B.<+
	defb 025h,025h,020h,020h,045h,044h,03ch,02bh,000h,021h,018h,048h,019h,041h,03ch,02bh	; 8831  %%  ED<+.!.H.A<+
	defb 034h,025h,01ah,048h,01bh,045h,03ch,02bh,02ch,001h,01ch,023h,01dh,001h,042h,02bh	; 8841  4%.H.E<+,..#..B+
	defb 02ah,021h,01ch,024h,01dh,021h,041h,02bh,02ah,021h,01ch,024h,01dh,021h,041h,02bh	; 8851  *!.$.!A+*!.$.!A+
	defb 02eh,025h,01eh,026h,01fh,025h,045h,02fh,021h,021h,018h,048h,048h,019h,021h,021h	; 8861  .%.&.%E/!!.HH.!!
	defb 034h,036h,01ah,048h,048h,01bh,040h,035h,02ch,003h,01ch,023h,023h,01dh,041h,02dh	; 8871  46.HH.@5,..##.A-
	defb 02ah,000h,01ch,024h,024h,01dh,041h,02bh,02ah,000h,01ch,024h,024h,01dh,041h,02bh	; 8881  *..$$.A+*..$$.A+
	defb 02eh,025h,01eh,026h,026h,01fh,045h,02fh,02ah,021h,00ch,01ah,01bh,0abh,00ch,021h	; 8891  .%.&&.E/*!.....!
	defb 000h,02ah,000h,020h,01eh,01fh,020h,044h,035h,02eh,036h,00dh,01ch,01dh,00dh,042h	; 88a1  .*. .. D5.6....B
	defb 02dh,02ch,003h,020h,01eh,01fh,020h,041h,02bh,02eh,036h,00dh,01ch,01dh,00dh,03fh	; 88b1  -,. .. A+.6....?
	defb 02fh,04eh,051h,020h,01eh,01fh,020h,04eh,04eh,000h	; 88c1  /NQ .. NN.

; ----------------------------------------------------------------------
; DATOS metabloques_de_antesala: 5 palabras: los metabloques RLE de cada
;   antesala (p00:5569); lo leen p00:5566 (10 bytes)
;   0x88cb..0x88d5  (10 bytes)
DATA_metabloques_de_antesala:
	defb 0d5h,088h	; 88cb
	defb 064h,08ah	; 88cd
	defb 0d0h,08bh	; 88cf
	defb 029h,08dh	; 88d1
	defb 03dh,08eh	; 88d3

; ----------------------------------------------------------------------
; DATOS metabloques_antesala_0: RLE (L_5578): los metabloques de la antesala
;   de la ruina 0; lo leen p00:5566 (399 bytes)
;   0x88d5..0x8a64  (399 bytes)
DATA_metabloques_antesala_0:
	defb 0ffh,046h,047h,043h,042h,041h,040h,041h,040h,001h,002h,001h,002h,003h,004h,003h	; 88d5  .FGCBA@A@.......
	defb 004h,047h,043h,042h,046h,045h,042h,043h,044h,042h,046h,047h,043h,043h,044h,042h	; 88e5  .GCBFEBCDBFGCCDB
	defb 045h,048h,000h,048h,049h,049h,048h,049h,048h,048h,000h,047h,043h,043h,044h,042h	; 88f5  EH.HIIHIHH.GCCDB
	defb 045h,048h,049h,048h,049h,049h,048h,000h,048h,042h,046h,047h,043h,043h,044h,042h	; 8905  EHIHIIH.HBFGCCDB
	defb 045h,048h,049h,048h,049h,000h,048h,049h,048h,042h,046h,048h,000h,043h,044h,042h	; 8915  EHIHI.HIHBFH.CDB
	defb 045h,048h,000h,048h,049h,049h,048h,049h,048h,048h,000h,048h,000h,049h,048h,049h	; 8925  EH.HIIHIHH.H.IHI
	defb 048h,051h,052h,064h,063h,055h,056h,068h,067h,053h,054h,051h,052h,057h,058h,055h	; 8935  HQRdcUVhgSTQRWXU
	defb 056h,073h,073h,059h,05ah,059h,05ah,057h,058h,053h,054h,051h,052h,057h,058h,055h	; 8945  VssYZYZWXSTQRWXU
	defb 096h,056h,062h,061h,053h,054h,066h,065h,057h,058h,053h,054h,062h,061h,057h,058h	; 8955  .VbaSTfeWXSTbaWX
	defb 066h,065h,076h,075h,074h,073h,074h,005h,073h,0c7h,059h,05ah,059h,05ah,055h,056h	; 8965  fevutst.s.YZYZUV
	defb 055h,056h,057h,058h,05dh,05eh,056h,05eh,000h,000h,05ch,05dh,049h,048h,000h,000h	; 8975  UVWX]^V^..\]IH..
	defb 068h,050h,05eh,063h,05ch,000h,000h,05eh,000h,049h,048h,000h,049h,048h,000h,048h	; 8985  hP^c\..^.IH.IH.H
	defb 052h,051h,053h,054h,066h,065h,057h,058h,05dh,05ch,062h,061h,000h,000h,05eh,050h	; 8995  RQSTfeWX]\ba..^P
	defb 051h,052h,053h,054h,055h,056h,057h,05ch,053h,054h,05dh,000h,05dh,05ch,000h,000h	; 89a5  QRSTUVW\ST].]\..
	defb 069h,003h,073h,08ch,067h,06ah,069h,073h,061h,062h,067h,06bh,065h,066h,067h,068h	; 89b5  i.s.gjisabgkefgh
	defb 008h,073h,0a8h,05ah,06bh,073h,073h,065h,066h,06ah,069h,05ch,050h,056h,055h,000h	; 89c5  .s.Zkssefji\PVU.
	defb 000h,05eh,050h,048h,000h,000h,05dh,049h,048h,000h,000h,052h,053h,05dh,000h,05ch	; 89d5  .^PH..]IH..RS].\
	defb 000h,000h,048h,000h,049h,048h,049h,049h,048h,000h,048h,010h,073h,0a0h,05ah,05bh	; 89e5  ..H.IHIIH.H.s.Z[
	defb 06ah,06bh,055h,056h,068h,067h,052h,051h,054h,053h,057h,058h,055h,056h,047h,043h	; 89f5  jkUVhgRQTSWXUVGC
	defb 048h,049h,045h,042h,043h,044h,042h,046h,047h,043h,043h,044h,042h,045h,008h,073h	; 8a05  HIEBCDBFGCCDBE.s
	defb 092h,05bh,05ah,06bh,06ah,057h,058h,055h,056h,070h,071h,076h,076h,073h,073h,070h	; 8a15  .[ZkjWXUVpqvvssp
	defb 071h,070h,074h,006h,073h,08dh,076h,072h,072h,071h,076h,076h,071h,070h,070h,071h	; 8a25  qpt.s.vrrqvvqppq
	defb 075h,074h,074h,003h,073h,091h,075h,070h,070h,071h,075h,074h,073h,073h,070h,074h	; 8a35  utt.s.uppqutsspt
	defb 070h,073h,070h,071h,072h,075h,076h,003h,072h,084h,070h,071h,071h,072h,004h,073h	; 8a45  pspqruv.r.pqqr.s
	defb 084h,074h,073h,070h,074h,00ah,073h,086h,059h,05ah,059h,05ah,055h,056h,000h	; 8a55  .tspt.s.YZYZUV.

; ----------------------------------------------------------------------
; DATOS metabloques_antesala_1: RLE (L_5578): los metabloques de la antesala
;   de la ruina 1; lo leen p00:5566 (364 bytes)
;   0x8a64..0x8bd0  (364 bytes)
DATA_metabloques_antesala_1:
	defb 003h,059h,08eh,056h,059h,059h,057h,064h,059h,056h,067h,065h,057h,067h,066h,066h	; 8a64  .Y.VYYWdYVgeWgff
	defb 050h,003h,059h,09dh,058h,051h,059h,059h,060h,058h,050h,059h,061h,060h,058h,051h	; 8a74  P.Y.XQYY`XPYa`XQ
	defb 062h,060h,060h,058h,063h,063h,060h,060h,068h,068h,062h,066h,068h,068h,063h,068h	; 8a84  b``Xcc``hhbfhhch
	defb 050h,003h,059h,0a0h,058h,054h,055h,059h,062h,060h,058h,051h,063h,062h,060h,062h	; 8a94  P.Y.XTUYb`XQcb`b
	defb 059h,059h,052h,053h,059h,056h,067h,066h,056h,067h,066h,068h,067h,066h,066h,068h	; 8aa4  YYRSYVgfVgfhgffh
	defb 068h,063h,066h,063h,00ch,068h,003h,059h,092h,057h,059h,059h,052h,067h,059h,056h	; 8ab4  hcfc.h.Y.WYYRgYV
	defb 067h,066h,057h,066h,066h,068h,067h,066h,068h,068h,066h,00bh,068h,088h,067h,066h	; 8ac4  gfWffhgfhhf.h.gf
	defb 066h,065h,066h,068h,068h,066h,018h,068h,008h,020h,008h,001h,088h,020h,021h,022h	; 8ad4  fefhhf.h. ... !"
	defb 020h,025h,023h,024h,026h,008h,001h,004h,020h,084h,026h,020h,026h,025h,008h,001h	; 8ae4   %#$&... .& &%..
	defb 088h,032h,033h,020h,020h,034h,035h,020h,020h,008h,001h,002h,020h,086h,032h,033h	; 8af4  .23  45  ... .23
	defb 026h,020h,034h,035h,008h,001h,088h,021h,022h,032h,033h,023h,024h,034h,035h,008h	; 8b04  & 45...!"23#$45.
	defb 001h,010h,020h,004h,068h,00ch,020h,009h,068h,007h,020h,008h,068h,003h,020h,081h	; 8b14  .. .h. .h. .h. .
	defb 068h,004h,020h,08eh,032h,033h,020h,020h,032h,033h,020h,020h,032h,033h,020h,020h	; 8b24  h. .23  23  23
	defb 032h,033h,004h,020h,0beh,032h,033h,020h,020h,032h,033h,020h,020h,032h,033h,020h	; 8b34  23. .23  23  23
	defb 020h,032h,033h,032h,033h,041h,068h,032h,033h,020h,020h,032h,033h,020h,020h,032h	; 8b44   2323Ah23  23  2
	defb 033h,020h,020h,068h,041h,032h,033h,020h,020h,032h,033h,020h,020h,032h,033h,020h	; 8b54  3  hA23  23  23
	defb 020h,032h,033h,068h,068h,030h,031h,068h,068h,032h,033h,068h,036h,032h,033h,068h	; 8b64   23hh01hh23h623h
	defb 040h,032h,033h,006h,068h,08ah,030h,031h,068h,068h,032h,033h,068h,036h,032h,033h	; 8b74  @23.h.01hh23h623
	defb 00ah,068h,0c6h,036h,037h,068h,068h,040h,041h,068h,068h,040h,041h,068h,068h,040h	; 8b84  .h.67hh@Ahh@Ahh@
	defb 041h,068h,068h,040h,041h,068h,068h,040h,041h,030h,031h,068h,068h,032h,033h,037h	; 8b94  Ahh@Ahh@A01hh237
	defb 068h,032h,033h,041h,068h,032h,033h,041h,068h,068h,040h,032h,033h,068h,040h,032h	; 8ba4  h23Ah23Ahh@23h@2
	defb 033h,068h,040h,032h,033h,068h,040h,032h,033h,068h,068h,030h,031h,068h,068h,032h	; 8bb4  3h@23h@23hh01hh2
	defb 033h,068h,068h,032h,033h,068h,068h,032h,033h,010h,059h,000h	; 8bc4  3hh23hh23.Y.

; ----------------------------------------------------------------------
; DATOS metabloques_antesala_2: RLE (L_5578): los metabloques de la antesala
;   de la ruina 2; lo leen p00:5566 (345 bytes)
;   0x8bd0..0x8d29  (345 bytes)
DATA_metabloques_antesala_2:
	defb 004h,040h,004h,041h,08bh,001h,002h,001h,002h,003h,004h,003h,004h,040h,040h,046h	; 8bd0  .@.A.........@@F
	defb 00dh,040h,004h,04ch,084h,040h,044h,04dh,04dh,003h,040h,081h,044h,004h,040h,004h	; 8be0  .@.L.@DMM.@.D.@.
	defb 04ch,004h,04dh,002h,040h,081h,044h,005h,040h,003h,04ch,083h,046h,04dh,046h,00ah	; 8bf0  L.M.@.D.@.L.FMF.
	defb 040h,002h,04ch,084h,044h,046h,040h,04dh,008h,040h,082h,046h,040h,004h,000h,004h	; 8c00  @.L.DF@M.@.F@...
	defb 04dh,004h,04ch,004h,042h,004h,000h,003h,04dh,081h,000h,004h,04ch,003h,042h,081h	; 8c10  M.L.B...M...L.B.
	defb 043h,008h,000h,004h,04ch,081h,045h,003h,042h,004h,04ch,004h,04dh,004h,04ch,004h	; 8c20  C...L.E.B.L.M.L.
	defb 04dh,008h,000h,002h,04ch,082h,000h,04ch,004h,04dh,0b0h,051h,052h,064h,063h,055h	; 8c30  M...L..L.M.QRdcU
	defb 056h,068h,067h,053h,054h,051h,052h,057h,058h,055h,056h,077h,077h,05bh,05ah,059h	; 8c40  VhgSTQRWXUVww[ZY
	defb 05ah,057h,058h,053h,054h,051h,052h,057h,058h,055h,056h,062h,061h,053h,054h,066h	; 8c50  ZWXSTQRWXUVbaSTf
	defb 065h,057h,058h,053h,054h,062h,061h,057h,058h,066h,065h,00ah,077h,092h,059h,05ah	; 8c60  eWXSTbaWXfe.w.YZ
	defb 059h,05ah,055h,056h,055h,056h,057h,058h,05dh,05eh,056h,05eh,000h,000h,05ch,05dh	; 8c70  YZUVUVWX]^V^..\]
	defb 004h,000h,088h,068h,050h,05eh,053h,05ch,000h,000h,05eh,004h,000h,004h,04dh,0a1h	; 8c80  ...hP^S\..^...M.
	defb 062h,061h,053h,054h,066h,065h,057h,058h,05dh,05ch,062h,061h,000h,000h,05eh,050h	; 8c90  baSTfeWX]\ba..^P
	defb 051h,052h,053h,054h,055h,056h,057h,05ch,053h,054h,05dh,000h,05ch,05eh,000h,000h	; 8ca0  QRSTUVW\ST].\^..
	defb 069h,003h,077h,08ch,067h,06ah,069h,077h,061h,062h,067h,06bh,065h,066h,067h,068h	; 8cb0  i.w.gjiwabgkefgh
	defb 008h,077h,090h,06ah,06bh,077h,077h,065h,066h,06ah,069h,05ch,050h,056h,055h,000h	; 8cc0  .w.jkwwefji\PVU.
	defb 000h,05eh,050h,003h,000h,081h,05dh,004h,000h,085h,052h,053h,05dh,000h,050h,009h	; 8cd0  .^P...]...RS].P.
	defb 000h,002h,04dh,098h,05bh,05ah,06bh,06ah,066h,065h,057h,058h,053h,054h,062h,061h	; 8ce0  ..M.[ZkjfeWXSTba
	defb 057h,058h,066h,065h,086h,086h,080h,086h,077h,082h,085h,085h,003h,077h,081h,082h	; 8cf0  WXfe....w....w..
	defb 004h,077h,089h,076h,070h,076h,076h,075h,075h,072h,077h,072h,007h,077h,088h,070h	; 8d00  .w.vpvvuurwr.w.p
	defb 076h,070h,071h,074h,075h,072h,073h,003h,077h,081h,072h,004h,077h,088h,081h,080h	; 8d10  vpqturs.w.r.w...
	defb 086h,080h,084h,082h,085h,084h,018h,077h,000h	; 8d20  .......w.

; ----------------------------------------------------------------------
; DATOS metabloques_antesala_3: RLE (L_5578): los metabloques de la antesala
;   de la ruina 3; lo leen p00:5566 (276 bytes)
;   0x8d29..0x8e3d  (276 bytes)
DATA_metabloques_antesala_3:
	defb 0e0h,062h,060h,060h,058h,062h,061h,060h,061h,063h,061h,060h,060h,068h,062h,060h	; 8d29  .b``Xba`aca``hb`
	defb 062h,047h,043h,042h,046h,040h,041h,040h,041h,001h,002h,001h,002h,003h,004h,003h	; 8d39  bGCBF@A@A.......
	defb 004h,070h,071h,070h,071h,071h,070h,071h,070h,042h,046h,042h,043h,043h,044h,045h	; 8d49  .pqpqqpqpBFBCCDE
	defb 042h,070h,071h,070h,071h,071h,070h,043h,044h,042h,046h,042h,043h,043h,044h,045h	; 8d59  BpqpqqpCDBFBCCDE
	defb 042h,070h,071h,070h,071h,045h,042h,071h,070h,042h,046h,042h,043h,043h,044h,045h	; 8d69  BpqpqEBqpBFBCCDE
	defb 042h,070h,071h,070h,071h,071h,070h,071h,070h,070h,071h,070h,071h,071h,070h,071h	; 8d79  Bpqpqqpqppqpqqpq
	defb 070h,004h,068h,08ch,071h,070h,071h,070h,070h,071h,070h,071h,071h,070h,071h,070h	; 8d89  p.h.qpqppqpqqpqp
	defb 008h,068h,088h,070h,071h,070h,071h,071h,070h,071h,070h,00ch,068h,084h,071h,070h	; 8d99  .h.pqpqqpqp.h.qp
	defb 071h,070h,010h,068h,013h,059h,08eh,056h,059h,059h,057h,064h,059h,056h,067h,065h	; 8da9  qp.h.Y.VYYWdYVge
	defb 057h,067h,066h,066h,050h,003h,059h,09dh,058h,051h,059h,059h,060h,058h,050h,059h	; 8db9  WgffP.Y.XQYY`XPY
	defb 061h,060h,058h,051h,062h,060h,060h,058h,063h,063h,060h,060h,068h,068h,062h,066h	; 8dc9  a`XQb``Xcc``hhbf
	defb 068h,068h,063h,068h,050h,003h,059h,0a0h,058h,054h,055h,059h,062h,060h,058h,051h	; 8dd9  hhchP.Y.XTUYb`XQ
	defb 063h,062h,060h,062h,059h,059h,052h,053h,059h,056h,067h,066h,056h,067h,066h,068h	; 8de9  cb`bYYRSYVgfVgfh
	defb 067h,066h,066h,068h,068h,063h,066h,063h,00ch,068h,003h,059h,092h,057h,059h,059h	; 8df9  gffhhcfc.h.Y.WYY
	defb 052h,067h,059h,056h,067h,066h,057h,066h,066h,068h,067h,066h,068h,068h,066h,00bh	; 8e09  RgYVgfWffhgfhhf.
	defb 068h,098h,047h,043h,042h,046h,045h,042h,043h,044h,042h,046h,042h,043h,043h,044h	; 8e19  h.GCBFEBCDBFBCCD
	defb 045h,042h,067h,066h,066h,065h,066h,068h,068h,066h,012h,068h,086h,070h,071h,071h	; 8e29  EBgffefhhf.h.pqq
	defb 070h,071h,070h,000h	; 8e39

; ----------------------------------------------------------------------
; DATOS metabloques_antesala_4: RLE (L_5578): los metabloques de la antesala
;   de la ruina 4; lo leen p00:5566 (378 bytes)
;   0x8e3d..0x8fb7  (378 bytes)
DATA_metabloques_antesala_4:
	defb 010h,010h,0ffh,028h,029h,028h,029h,029h,028h,029h,028h,031h,032h,031h,032h,033h	; 8e3d  ...()())()(12123
	defb 034h,033h,034h,028h,029h,028h,029h,029h,028h,029h,028h,028h,029h,028h,029h,029h	; 8e4d  434()())()(()())
	defb 028h,029h,028h,026h,027h,026h,027h,029h,028h,029h,028h,028h,029h,028h,029h,029h	; 8e5d  ()(&'&')()(()())
	defb 028h,029h,028h,020h,023h,024h,029h,020h,023h,025h,028h,020h,023h,024h,029h,020h	; 8e6d  ()( #$) #%( #$)
	defb 023h,025h,028h,02ch,02dh,02bh,029h,02ah,02bh,029h,028h,028h,029h,028h,029h,029h	; 8e7d  #%(,-+)*+)(()())
	defb 028h,029h,028h,020h,023h,060h,011h,020h,023h,02ch,060h,020h,023h,02ah,02ch,020h	; 8e8d  ()( #`. #,` #*,
	defb 023h,025h,02ah,061h,02ch,02dh,02ch,02ch,02dh,02ch,02bh,02dh,02ch,02bh,029h,02ch	; 8e9d  #%*a,-,,-,+-,+),
	defb 02bh,029h,028h,016h,041h,040h,016h,018h,041h,040h,018h,021h,022h,02fh,02fh,020h	; 8ead  +)(.A@..A@.!"//
	defb 023h,030h,099h,030h,020h,023h,016h,016h,020h,023h,018h,018h,020h,023h,02fh,02fh	; 8ebd  #0.0 #.. #.. #//
	defb 020h,023h,030h,030h,041h,040h,016h,016h,041h,040h,018h,018h,004h,02fh,004h,030h	; 8ecd   #00A@..A@.../.0
	defb 090h,055h,056h,010h,012h,072h,073h,012h,013h,072h,073h,013h,014h,072h,073h,014h	; 8edd  .UV..rs..rs..rs.
	defb 014h,004h,010h,0a8h,074h,075h,010h,010h,052h,071h,010h,010h,050h,051h,010h,010h	; 8eed  ....tu..Rq..PQ..
	defb 011h,016h,016h,011h,011h,018h,018h,011h,021h,022h,02fh,042h,020h,023h,030h,030h	; 8efd  ........!"/B #00
	defb 010h,014h,013h,010h,010h,015h,014h,012h,010h,014h,015h,013h,004h,016h,005h,010h	; 8f0d  ................
	defb 081h,012h,003h,010h,081h,013h,003h,010h,0bbh,014h,012h,010h,011h,041h,040h,016h	; 8f1d  .............A@.
	defb 011h,041h,040h,018h,011h,041h,040h,061h,011h,062h,02ch,02dh,010h,074h,075h,010h	; 8f2d  .A@..A@a.b,-.tu.
	defb 010h,070h,071h,012h,012h,050h,051h,013h,013h,055h,056h,014h,016h,016h,012h,010h	; 8f3d  .pq..PQ..UV.....
	defb 018h,018h,013h,012h,021h,022h,014h,013h,020h,023h,015h,014h,011h,016h,016h,011h	; 8f4d  ....!".. #......
	defb 011h,018h,018h,011h,004h,02fh,004h,030h,0d0h,010h,074h,075h,010h,010h,052h,071h	; 8f5d  ...../.0..tu..Rq
	defb 010h,010h,055h,056h,012h,010h,072h,073h,013h,010h,052h,071h,010h,012h,050h,051h	; 8f6d  ..UV..rs..Rq..PQ
	defb 012h,013h,055h,056h,013h,016h,041h,073h,011h,020h,023h,026h,027h,020h,023h,025h	; 8f7d  ..UV..As. #&' #%
	defb 028h,020h,023h,024h,029h,020h,023h,025h,028h,020h,023h,024h,029h,020h,023h,025h	; 8f8d  ( #$) #%( #$) #%
	defb 028h,031h,032h,031h,032h,033h,034h,033h,034h,055h,056h,010h,012h,072h,073h,012h	; 8f9d  (12123434UV..rs.
	defb 013h,072h,073h,013h,014h,072h,073h,014h,014h,000h	; 8fad  .rs..rs...

; ----------------------------------------------------------------------
; DATOS metabloques_ruina_0: RLE (L_5578): los metabloques de la ruina 0, 16
;   fichas cada uno; lo leen p00:5533 (1467 bytes)
;   0x8fb7..0x9572  (1467 bytes)
DATA_metabloques_ruina_0:
	defb 0ffh,04ah,05ah,04ah,05ah,04bh,05bh,04bh,05bh,05ah,04ah,05ah,04ah,05bh,04bh,05bh	; 8fb7  .JZJZK[K[ZJZJ[K[
	defb 04bh,021h,024h,021h,024h,04bh,05bh,04bh,05bh,05ah,04ah,05ah,04ah,05bh,04bh,05bh	; 8fc7  K!$!$K[K[ZJZJ[K[
	defb 04bh,021h,024h,04ah,05ah,04bh,05bh,04bh,05bh,05ah,04ah,05ah,04ah,05bh,04bh,05bh	; 8fd7  K!$JZK[K[ZJZJ[K[
	defb 04bh,04ah,05ah,021h,024h,04bh,05bh,04bh,05bh,05ah,04ah,05ah,04ah,05bh,04bh,05bh	; 8fe7  KJZ!$K[K[ZJZJ[K[
	defb 04bh,001h,002h,001h,002h,003h,004h,003h,004h,024h,021h,024h,021h,05bh,04bh,05bh	; 8ff7  K........$!$![K[
	defb 04bh,04ah,05ah,04ah,05ah,04bh,05bh,04bh,05bh,001h,002h,001h,002h,003h,004h,003h	; 9007  KJZJZK[K[.......
	defb 004h,001h,002h,04ah,05ah,003h,004h,04bh,05bh,001h,002h,05ah,04ah,003h,004h,05bh	; 9017  ...JZ..K[..ZJ..[
	defb 04bh,04ah,05ah,001h,002h,04bh,05bh,003h,004h,05ah,04ah,001h,002h,05bh,04bh,003h	; 9027  KJZ..K[..ZJ..[K.
	defb 0ffh,004h,001h,002h,001h,002h,003h,004h,003h,004h,001h,002h,024h,021h,003h,004h	; 9037  ............$!..
	defb 05bh,04bh,001h,002h,001h,002h,003h,004h,003h,004h,024h,021h,001h,002h,05bh,04bh	; 9047  [K........$!..[K
	defb 003h,004h,001h,002h,04ah,05ah,003h,004h,04bh,05bh,001h,002h,001h,002h,003h,004h	; 9057  ....JZ..K[......
	defb 003h,004h,04ah,05ah,001h,002h,04bh,05bh,003h,004h,001h,002h,001h,002h,003h,004h	; 9067  ..JZ..K[........
	defb 003h,004h,02dh,029h,001h,002h,02dh,029h,003h,004h,02dh,029h,001h,002h,02dh,029h	; 9077  ..-)..-)..-)..-)
	defb 003h,004h,04ah,05ah,012h,013h,04bh,05bh,012h,013h,05ah,04ah,012h,013h,05bh,04bh	; 9087  ..JZ..K[..ZJ..[K
	defb 012h,013h,001h,002h,010h,011h,003h,004h,012h,013h,001h,002h,012h,013h,003h,004h	; 9097  ................
	defb 012h,013h,001h,002h,012h,013h,003h,004h,012h,013h,001h,002h,012h,013h,003h,004h	; 90a7  ................
	defb 0ffh,012h,013h,001h,002h,010h,011h,003h,004h,012h,013h,024h,021h,012h,013h,05bh	; 90b7  ...........$!..[
	defb 04bh,012h,013h,04ah,05ah,04ah,05ah,04bh,05bh,04bh,05bh,001h,002h,010h,011h,003h	; 90c7  K..JZJZK[K[.....
	defb 004h,012h,013h,001h,002h,04ah,05ah,003h,004h,04bh,05bh,001h,002h,010h,011h,003h	; 90d7  .....JZ..K[.....
	defb 004h,012h,013h,001h,002h,012h,013h,003h,004h,012h,013h,001h,002h,001h,002h,003h	; 90e7  ................
	defb 004h,003h,004h,04ah,05ah,012h,013h,04bh,05bh,012h,013h,001h,002h,001h,002h,003h	; 90f7  ...JZ..K[.......
	defb 004h,003h,004h,02dh,03ah,001h,002h,02dh,03ah,003h,004h,001h,002h,001h,002h,003h	; 9107  ...-:..-:.......
	defb 004h,003h,004h,04ah,04bh,001h,002h,04bh,05bh,003h,004h,05ah,04ah,024h,021h,05bh	; 9117  ...JK..K[..ZJ$![
	defb 04bh,05bh,04bh,04ah,05ah,04ah,05ah,04bh,05bh,04bh,05bh,001h,002h,05ah,04ah,003h	; 9127  K[KJZJZK[K[..ZJ.
	defb 0ffh,004h,05bh,04bh,001h,002h,04ah,05ah,003h,004h,04bh,05bh,024h,021h,05ah,04ah	; 9137  ..[K..JZ..K[$!ZJ
	defb 05bh,04bh,05bh,04bh,02dh,03ah,04ah,05ah,02dh,03ah,04bh,05bh,001h,002h,001h,002h	; 9147  [K[K-:JZ-:K[....
	defb 003h,004h,003h,004h,04ah,05ah,04ah,05ah,04bh,05bh,04bh,05bh,05ah,04ah,001h,002h	; 9157  ....JZJZK[K[ZJ..
	defb 05bh,04bh,003h,004h,001h,002h,012h,013h,003h,004h,012h,013h,024h,021h,012h,013h	; 9167  [K..........$!..
	defb 05bh,04bh,012h,013h,021h,063h,07ah,064h,04bh,05bh,07bh,05bh,05ah,04ah,079h,04ah	; 9177  [K..!czdK[{[ZJyJ
	defb 05bh,04bh,079h,04bh,04ah,05ah,02dh,03ah,04bh,05bh,02dh,03ah,001h,002h,001h,002h	; 9187  [KyKJZ-:K[-:....
	defb 003h,004h,003h,004h,001h,002h,001h,002h,003h,004h,003h,004h,024h,062h,07ah,061h	; 9197  ............$bza
	defb 05bh,04bh,07bh,04bh,04ah,05ah,079h,05ah,04bh,05bh,079h,05bh,001h,002h,001h,002h	; 91a7  [K{KJZyZK[y[....
	defb 0ffh,003h,004h,003h,004h,062h,07ah,030h,02ah,04bh,07bh,02eh,02ch,05ah,079h,04dh	; 91b7  .....bz0*K{.,ZyM
	defb 03ch,05bh,079h,04ch,03bh,036h,07ah,030h,02ah,048h,07bh,02eh,02ch,057h,079h,04dh	; 91c7  <[yL.6z0*H{.,WyM
	defb 03ch,056h,079h,04ch,03bh,02ah,036h,07ah,030h,02ch,034h,07bh,058h,03ch,05dh,079h	; 91d7  <VyL.*6z0,4{X<]y
	defb 047h,03bh,05ch,079h,046h,02ah,036h,07ah,064h,02ch,034h,07bh,05bh,03ch,05dh,079h	; 91e7  G.\yF*6zd,4{[<]y
	defb 04ah,03bh,05ch,079h,04bh,04ah,079h,04dh,03ch,04bh,079h,04ch,03bh,05ah,079h,04dh	; 91f7  J.\yKJyM<KyL.ZyM
	defb 03ch,05bh,079h,04ch,03bh,057h,079h,04dh,03ch,056h,079h,04ch,03bh,057h,079h,04dh	; 9207  <[yL.WyM<VyL.WyM
	defb 03ch,056h,079h,04ch,03bh,03ch,05dh,079h,047h,03bh,05ch,079h,046h,03ch,05dh,079h	; 9217  <VyL.<]yG.\yF<]y
	defb 047h,03bh,05ch,079h,046h,03ch,05dh,079h,05ah,03bh,05ch,079h,05bh,03ch,05dh,079h	; 9227  G.\yF<]yZ.\y[<]y
	defb 095h,04ah,03bh,05ch,079h,04bh,04ah,082h,07ch,07ch,04bh,07ch,07ch,07dh,063h,07ah	; 9237  .J.\yKJ.||K||}cz
	defb 030h,02ah,05bh,07bh,02eh,02ch,008h,07dh,088h,036h,07ah,030h,02ah,048h,07bh,02eh	; 9247  0*[{.,.}.6z0*H{.
	defb 02ch,008h,07dh,0ffh,02ah,036h,07ah,030h,02ch,034h,07bh,058h,07ch,07ch,082h,05ah	; 9257  ,.}.*6z0,4{X||.Z
	defb 07dh,07ch,07ch,05bh,02ah,036h,07ah,061h,02ch,034h,07bh,04bh,0a9h,07ah,030h,02ah	; 9267  }||[*6za,4{K.z0*
	defb 0a9h,07bh,02eh,02ch,0a7h,079h,04dh,03ch,048h,079h,04ch,03bh,02ah,036h,07ah,098h	; 9277  .{.,.yM<HyL.*6z.
	defb 02ch,034h,07bh,098h,03ch,05dh,079h,0b8h,03bh,05ch,079h,058h,036h,07ah,030h,02ah	; 9287  ,4{.<]y..\yX6z0*
	defb 048h,07bh,02eh,02ch,057h,079h,041h,023h,056h,079h,043h,027h,02ah,036h,07ah,030h	; 9297  H{.,WyA#VyC'*6z0
	defb 02ch,034h,07bh,058h,026h,051h,079h,047h,028h,053h,079h,046h,03eh,03fh,03fh,040h	; 92a7  ,4{X&QyG(SyF>??@
	defb 02dh,029h,029h,03ah,02dh,029h,029h,03ah,02dh,029h,029h,03ah,02dh,029h,029h,03ah	; 92b7  -)):-)):-)):-)):
	defb 02dh,029h,029h,03ah,02dh,029h,029h,03ah,02dh,029h,029h,03ah,04ah,05ah,02dh,03ah	; 92c7  -)):-)):-)):JZ-:
	defb 04bh,05bh,02dh,0b1h,03ah,05ah,04ah,02dh,03ah,05bh,04bh,02dh,03ah,02dh,03ah,04ah	; 92d7  K[-.:ZJ-:[K-:-:J
	defb 05ah,02dh,03ah,04bh,05bh,02dh,03ah,05ah,04ah,02dh,03ah,05bh,04bh,097h,066h,069h	; 92e7  Z-:K[-:ZJ-:[K.fi
	defb 06ah,050h,0a6h,067h,06dh,024h,050h,03eh,040h,025h,022h,02dh,03ah,066h,06bh,066h	; 92f7  jP.gm$P>@%"-:fkf
	defb 066h,06eh,06fh,070h,067h,004h,03fh,08ch,025h,022h,025h,022h,066h,066h,073h,066h	; 9307  fnopg.?.%"%"ffsf
	defb 067h,076h,075h,078h,004h,03fh,09ch,025h,022h,025h,022h,072h,071h,066h,0a8h,077h	; 9317  gvux.?.%"%"rqf.w
	defb 067h,0b7h,060h,03eh,040h,060h,021h,02dh,03ah,025h,022h,066h,068h,066h,066h,067h	; 9327  g.`>@`!-:%"fhffg
	defb 065h,067h,067h,004h,03fh,0ffh,022h,025h,022h,025h,04ah,079h,04dh,03ch,04bh,079h	; 9337  egg.?."%"%JyM<Ky
	defb 04ch,03bh,001h,002h,001h,002h,003h,004h,003h,004h,057h,079h,04dh,03ch,056h,079h	; 9347  L.........WyM<Vy
	defb 04ch,03bh,001h,002h,001h,002h,003h,004h,003h,004h,03ch,05dh,079h,047h,03bh,05ch	; 9357  L.........<]yG.\
	defb 079h,046h,001h,002h,001h,002h,003h,004h,003h,004h,03ch,05dh,079h,05ah,03bh,05ch	; 9367  yF........<]yZ.\
	defb 079h,05bh,001h,002h,001h,002h,003h,004h,003h,004h,057h,079h,043h,027h,056h,079h	; 9377  y[........WyC'Vy
	defb 043h,027h,001h,002h,001h,002h,003h,004h,003h,004h,028h,053h,079h,047h,028h,053h	; 9387  C'........(SyG(S
	defb 079h,046h,001h,002h,001h,002h,003h,004h,003h,004h,021h,024h,021h,024h,04bh,05bh	; 9397  yF........!$!$K[
	defb 04bh,05bh,001h,002h,001h,002h,003h,004h,003h,004h,04ah,05ah,04ah,05ah,04bh,082h	; 93a7  K[........JZJZK.
	defb 082h,05bh,082h,07dh,07dh,0d1h,082h,07ch,07dh,07dh,07ch,001h,002h,021h,024h,003h	; 93b7  .[.}}..|}}|..!$.
	defb 004h,04bh,05bh,001h,002h,05ah,04ah,003h,004h,05bh,04bh,0a1h,0a2h,08bh,08ch,0a3h	; 93c7  .K[..ZJ..[K.....
	defb 0a4h,08fh,090h,05ah,0a5h,093h,094h,05bh,07ch,07dh,07dh,08dh,08eh,0b3h,0b2h,091h	; 93d7  ...Z...[|}}.....
	defb 092h,0b5h,0b4h,095h,096h,0b6h,04ah,07dh,07dh,07ch,04bh,04ah,05ah,082h,05ah,04bh	; 93e7  ......J}}|KJZ.ZK
	defb 082h,0ach,0abh,05ah,07ch,038h,07fh,05bh,07ch,07dh,07dh,04ah,07ch,0ach,0abh,0aeh	; 93f7  ...Z|8.[|}}J|...
	defb 0adh,038h,02bh,031h,033h,02bh,07fh,004h,07dh,08ch,09ah,09bh,07ch,05ah,02bh,032h	; 9407  .8+13+..}...|Z+2
	defb 09ch,09dh,07fh,02bh,039h,037h,004h,07dh,0ffh,04ah,082h,04ah,05ah,09ah,09bh,082h	; 9417  ...+97.}.J.JZ...
	defb 05bh,07fh,032h,07ch,04ah,07dh,07dh,07ch,04bh,04ah,079h,07ch,07dh,04bh,079h,07ch	; 9427  [.2|J}}|KJy|}Ky|
	defb 07dh,05ah,09eh,083h,084h,09fh,0a0h,087h,088h,07dh,07ch,079h,05ah,07dh,07ch,079h	; 9437  }Z.......}|yZ}|y
	defb 05bh,085h,086h,0afh,04ah,089h,08ah,0b1h,0b0h,04ah,05ah,082h,05ah,04bh,05bh,07ch	; 9447  [...J....JZ.ZK[|
	defb 07dh,05ah,09eh,083h,084h,09fh,0a0h,087h,088h,04ah,082h,04ah,05ah,07dh,07ch,04bh	; 9457  }Z.......J.JZ}|K
	defb 05bh,085h,086h,0afh,04ah,089h,08ah,0b1h,0b0h,02dh,03ah,083h,084h,02dh,03ah,087h	; 9467  [...J....-:..-:.
	defb 088h,02dh,03ah,08bh,08ch,02dh,03ah,08fh,090h,085h,086h,02dh,03ah,089h,08ah,02dh	; 9477  .-:..-:....-:..-
	defb 03ah,08dh,08eh,02dh,03ah,091h,092h,02dh,03ah,02dh,03ah,093h,094h,02dh,03ah,07dh	; 9487  :..-:..-:-:..-:}
	defb 07dh,02dh,03ah,02fh,035h,02dh,03ah,02fh,0bdh,035h,095h,096h,02dh,03ah,07dh,07dh	; 9497  }-:/5-:/.5..-:}}
	defb 02dh,03ah,02fh,035h,02dh,03ah,02fh,035h,02dh,03ah,02dh,03ah,07ch,07dh,02dh,03ah	; 94a7  -:/5-:/5-:-:|}-:
	defb 02fh,035h,02dh,03ah,07ch,07dh,02dh,03ah,02fh,035h,07dh,07dh,02dh,03ah,02fh,035h	; 94b7  /5-:|}-:/5}}-:/5
	defb 02dh,03ah,07dh,07ch,02dh,03ah,02fh,035h,02dh,03ah,04ah,05ah,04ah,05ah,04bh,05bh	; 94c7  -:}|-:/5-:JZJZK[
	defb 04bh,05bh,05ah,04ah,05ah,04ah,004h,0b9h,0ffh,001h,002h,001h,002h,003h,004h,003h	; 94d7  K[ZJZJ..........
	defb 004h,001h,002h,001h,002h,003h,004h,003h,004h,02dh,029h,029h,03ah,02dh,029h,029h	; 94e7  .........-)):-))
	defb 03ah,001h,002h,001h,002h,003h,004h,003h,004h,021h,024h,012h,013h,04bh,05bh,012h	; 94f7  :........!$..K[.
	defb 013h,05ah,04ah,012h,013h,05bh,04bh,012h,013h,02dh,03ah,021h,024h,02dh,03ah,04bh	; 9507  .ZJ..[K..-:!$-:K
	defb 05bh,02dh,03ah,05ah,04ah,02dh,03ah,05bh,04bh,021h,024h,02dh,03ah,04bh,05bh,02dh	; 9517  [-:ZJ-:[K!$-:K[-
	defb 03ah,05ah,04ah,02dh,03ah,05bh,04bh,02dh,03ah,021h,024h,001h,002h,04bh,05bh,003h	; 9527  :ZJ-:[K-:!$..K[.
	defb 004h,05ah,04ah,001h,002h,05bh,04bh,003h,004h,021h,024h,001h,002h,04bh,05bh,003h	; 9537  .ZJ..[K..!$..K[.
	defb 004h,05ah,04ah,024h,021h,05bh,04bh,05bh,04bh,001h,002h,021h,024h,003h,004h,04bh	; 9547  .ZJ$![K[K..!$..K
	defb 05bh,024h,021h,05ah,04ah,05bh,04bh,05bh,091h,04bh,04ah,05ah,012h,013h,04bh,05bh	; 9557  [$!ZJ[K[.KJZ..K[
	defb 012h,013h,05ah,04ah,001h,002h,05bh,04bh,003h,004h,000h	; 9567  ..ZJ..[K...

; ----------------------------------------------------------------------
; DATOS metabloques_ruina_1: RLE (L_5578): los metabloques de la ruina 1, 16
;   fichas cada uno; lo leen p00:5533 (1382 bytes)
;   0x9572..0x9ad8  (1382 bytes)
DATA_metabloques_ruina_1:
	defb 0ffh,080h,081h,082h,083h,084h,085h,086h,087h,088h,089h,08ah,08bh,08ch,08dh,08eh	; 9572  ................
	defb 08fh,080h,081h,082h,083h,084h,085h,086h,087h,001h,002h,001h,002h,003h,004h,003h	; 9582  ................
	defb 004h,001h,002h,001h,002h,003h,004h,003h,004h,066h,061h,066h,061h,08ch,08dh,08eh	; 9592  .........fafa...
	defb 08fh,066h,061h,066h,061h,084h,085h,086h,087h,088h,089h,08ah,08bh,08ch,08dh,08eh	; 95a2  .fafa...........
	defb 08fh,001h,002h,082h,083h,001h,002h,086h,087h,001h,002h,08ah,08bh,001h,002h,08eh	; 95b2  ................
	defb 08fh,080h,081h,001h,002h,084h,085h,001h,002h,088h,089h,001h,002h,08ch,08dh,001h	; 95c2  ................
	defb 002h,001h,002h,066h,061h,001h,002h,086h,087h,001h,002h,08ah,08bh,001h,002h,08eh	; 95d2  ...fa...........
	defb 08fh,066h,061h,001h,002h,084h,085h,001h,002h,088h,089h,001h,002h,08ch,08dh,001h	; 95e2  .fa.............
	defb 0ffh,002h,001h,002h,010h,011h,001h,002h,012h,013h,001h,002h,012h,013h,001h,002h	; 95f2  ................
	defb 012h,013h,001h,002h,082h,083h,003h,004h,086h,087h,064h,066h,08ah,08bh,064h,08dh	; 9602  ..........df..d.
	defb 08eh,08fh,001h,002h,012h,013h,001h,002h,012h,013h,001h,002h,012h,013h,001h,002h	; 9612  ................
	defb 012h,013h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h	; 9622  ................
	defb 001h,002h,001h,002h,001h,002h,003h,004h,003h,004h,001h,002h,001h,002h,003h,004h	; 9632  ................
	defb 003h,004h,080h,081h,012h,013h,084h,085h,012h,013h,088h,089h,012h,013h,08ch,08dh	; 9642  ................
	defb 012h,013h,066h,061h,012h,013h,084h,085h,012h,013h,088h,089h,012h,013h,08ch,08dh	; 9652  ..fa............
	defb 012h,013h,080h,081h,012h,013h,084h,085h,012h,013h,001h,002h,012h,013h,003h,004h	; 9662  ................
	defb 0ffh,012h,013h,080h,081h,082h,083h,084h,085h,086h,087h,001h,002h,010h,011h,003h	; 9672  ................
	defb 004h,012h,013h,001h,002h,082h,083h,001h,002h,086h,087h,001h,002h,010h,011h,001h	; 9682  ................
	defb 002h,012h,013h,080h,081h,012h,013h,084h,085h,012h,013h,001h,002h,001h,002h,003h	; 9692  ................
	defb 004h,003h,004h,064h,081h,012h,013h,064h,085h,012h,013h,064h,089h,001h,002h,064h	; 96a2  ...d...d...d...d
	defb 08dh,003h,004h,001h,002h,001h,002h,003h,004h,003h,004h,001h,002h,066h,061h,001h	; 96b2  .............fa.
	defb 002h,08eh,08fh,001h,002h,001h,002h,003h,004h,003h,004h,066h,061h,001h,002h,08ch	; 96c2  ...........fa...
	defb 08dh,001h,002h,001h,002h,082h,083h,001h,002h,086h,087h,001h,002h,001h,002h,003h	; 96d2  ................
	defb 004h,003h,004h,080h,081h,001h,002h,084h,085h,001h,002h,001h,002h,001h,002h,003h	; 96e2  ................
	defb 0ffh,004h,003h,004h,080h,081h,066h,061h,084h,085h,086h,086h,088h,089h,08ah,08bh	; 96f2  ......fa........
	defb 08ch,08dh,08eh,08fh,066h,061h,082h,083h,084h,085h,086h,087h,088h,089h,08ah,08bh	; 9702  ....fa..........
	defb 08ch,08dh,08eh,08fh,05ch,061h,001h,002h,05dh,085h,001h,002h,064h,089h,001h,002h	; 9712  ....\a..]...d...
	defb 064h,08dh,001h,002h,001h,002h,010h,011h,003h,004h,012h,013h,066h,061h,012h,013h	; 9722  d...........fa..
	defb 08ch,08dh,012h,013h,024h,026h,027h,054h,024h,026h,027h,054h,001h,002h,001h,002h	; 9732  ....$&'T$&'T....
	defb 003h,004h,003h,004h,05ch,061h,012h,013h,05dh,085h,012h,013h,064h,089h,012h,013h	; 9742  ....\a..]...d...
	defb 064h,08dh,012h,013h,05ch,05fh,090h,091h,05dh,095h,094h,092h,064h,096h,000h,000h	; 9752  d...\_..]...d...
	defb 064h,093h,000h,000h,098h,097h,060h,063h,099h,09bh,09ch,0a6h,000h,000h,09dh,065h	; 9762  d.....`c.......e
	defb 002h,000h,0ffh,09ah,065h,064h,000h,06bh,033h,064h,000h,06bh,034h,064h,000h,06bh	; 9772  ....ed.k3d.k4d.k
	defb 034h,064h,000h,06bh,034h,041h,076h,000h,065h,042h,076h,000h,065h,042h,076h,000h	; 9782  4d.k4Av.eBv.eBv.
	defb 065h,042h,076h,000h,065h,064h,000h,06bh,034h,064h,000h,06bh,034h,064h,000h,06bh	; 9792  eBv.ed.k4d.k4d.k
	defb 034h,064h,000h,06ch,06dh,042h,076h,000h,065h,042h,076h,000h,065h,042h,076h,000h	; 97a2  4d.lmBv.eBv.eBv.
	defb 065h,078h,077h,000h,065h,05ch,095h,094h,092h,05dh,096h,000h,000h,064h,093h,000h	; 97b2  exw.e\...]...d..
	defb 0a2h,064h,000h,000h,0a3h,099h,09bh,09ch,063h,057h,000h,09dh,0a6h,030h,058h,09ah	; 97c2  .d......cW...0X.
	defb 065h,031h,059h,000h,065h,064h,000h,000h,020h,064h,000h,021h,022h,064h,000h,023h	; 97d2  e1Y.ed.. d.!"d.#
	defb 025h,064h,000h,024h,0a0h,051h,050h,000h,065h,053h,052h,000h,065h,028h,055h,000h	; 97e2  %d.$.QP.eSR.e(U.
	defb 065h,0a1h,0c4h,054h,000h,065h,064h,000h,024h,026h,064h,000h,024h,026h,064h,000h	; 97f2  e..T.ed.$&d.$&d.
	defb 024h,026h,064h,000h,024h,026h,027h,054h,000h,065h,027h,054h,000h,065h,027h,054h	; 9802  $&d.$&'T.e'T.e'T
	defb 000h,065h,027h,054h,000h,065h,000h,020h,051h,050h,021h,022h,053h,052h,023h,025h	; 9812  .e'T.e. QP!"SR#%
	defb 028h,055h,024h,0a0h,0a1h,054h,024h,026h,027h,054h,024h,026h,027h,054h,024h,026h	; 9822  (U$..T$&'T$&'T$&
	defb 027h,054h,024h,026h,027h,054h,064h,003h,000h,081h,064h,003h,000h,088h,001h,002h	; 9832  'T$&'Td...d.....
	defb 001h,002h,003h,004h,003h,004h,003h,000h,081h,065h,003h,000h,0ffh,065h,001h,002h	; 9842  .........e...e..
	defb 001h,002h,003h,004h,003h,004h,05ch,061h,066h,061h,05dh,085h,086h,087h,064h,089h	; 9852  ......\afa]...d.
	defb 08ah,08bh,064h,08dh,08eh,08fh,066h,061h,066h,063h,084h,085h,086h,0a6h,088h,089h	; 9862  ..d...fafc......
	defb 08ah,065h,08ch,08dh,08eh,065h,064h,081h,082h,083h,064h,085h,086h,087h,064h,089h	; 9872  .e...ed...d...d.
	defb 08ah,08bh,064h,08dh,08eh,08fh,080h,081h,082h,065h,084h,085h,086h,065h,088h,089h	; 9882  ..d......e...e..
	defb 08ah,065h,08ch,08dh,08eh,065h,064h,081h,082h,083h,064h,085h,086h,087h,001h,002h	; 9892  .e...ed...d.....
	defb 001h,002h,003h,004h,003h,004h,080h,081h,082h,065h,084h,085h,086h,065h,001h,002h	; 98a2  .........e...e..
	defb 001h,002h,003h,004h,003h,004h,064h,081h,010h,011h,064h,085h,012h,013h,064h,089h	; 98b2  ......d...d...d.
	defb 012h,013h,064h,08dh,012h,013h,001h,002h,010h,011h,003h,004h,0dbh,012h,013h,064h	; 98c2  ..d............d
	defb 066h,012h,013h,064h,08dh,012h,013h,06eh,035h,043h,079h,06fh,036h,044h,07ah,070h	; 98d2  f..d...n5Cyo6Dzp
	defb 071h,07ch,07bh,067h,068h,073h,072h,080h,081h,001h,002h,084h,085h,003h,004h,088h	; 98e2  q|{ghsr.........
	defb 089h,066h,065h,08ch,08dh,08eh,065h,064h,081h,001h,002h,064h,085h,001h,002h,064h	; 98f2  .fe...ed...d...d
	defb 089h,001h,002h,064h,08dh,001h,002h,001h,002h,082h,065h,001h,002h,086h,065h,001h	; 9902  ...d......e...e.
	defb 002h,08ah,065h,001h,002h,08eh,065h,001h,002h,012h,013h,001h,002h,012h,013h,001h	; 9912  ..e...e.........
	defb 002h,001h,002h,003h,004h,003h,004h,064h,003h,000h,081h,064h,003h,000h,081h,064h	; 9922  .......d...d...d
	defb 003h,000h,081h,064h,003h,000h,0d0h,001h,002h,082h,083h,001h,002h,086h,087h,066h	; 9932  ...d...........f
	defb 061h,08ah,08bh,08ch,08dh,08eh,08fh,001h,002h,001h,002h,003h,004h,003h,004h,064h	; 9942  a..............d
	defb 066h,066h,061h,064h,08dh,08eh,08fh,001h,002h,001h,002h,003h,004h,003h,004h,066h	; 9952  ffad...........f
	defb 061h,066h,065h,08ch,08dh,08eh,065h,064h,000h,000h,069h,064h,000h,06ah,032h,064h	; 9962  afe...ed..id.j2d
	defb 000h,06bh,033h,064h,000h,06bh,033h,074h,000h,000h,065h,040h,075h,000h,065h,041h	; 9972  .k3d.k3t..e@u.eA
	defb 076h,000h,065h,042h,076h,000h,065h,006h,000h,0dah,057h,000h,000h,0a2h,030h,058h	; 9982  v.eBv.e...W...0X
	defb 000h,0a3h,031h,059h,080h,081h,082h,083h,084h,085h,086h,087h,088h,089h,001h,002h	; 9992  ..1Y............
	defb 08ch,08dh,003h,004h,080h,081h,001h,002h,084h,085h,001h,002h,088h,089h,066h,061h	; 99a2  ..............fa
	defb 08ch,08dh,08eh,08fh,064h,081h,06eh,035h,064h,085h,06fh,036h,064h,089h,070h,071h	; 99b2  ....d.n5d.o6d.pq
	defb 064h,08dh,067h,068h,043h,079h,082h,065h,044h,07ah,086h,065h,07ch,07bh,08ah,065h	; 99c2  d.ghCy.eDz.e|{.e
	defb 073h,072h,08eh,065h,064h,081h,012h,013h,064h,085h,012h,013h,064h,089h,012h,013h	; 99d2  sr.ed...d...d...
	defb 064h,08dh,012h,013h,003h,000h,081h,065h,003h,000h,081h,065h,003h,000h,081h,065h	; 99e2  d......e...e...e
	defb 003h,000h,0ffh,065h,064h,066h,061h,066h,064h,085h,086h,087h,064h,089h,08ah,08bh	; 99f2  ...edfafd...d...
	defb 064h,08dh,08eh,08fh,066h,061h,066h,065h,084h,085h,086h,065h,088h,089h,08ah,065h	; 9a02  d...fafe...e...e
	defb 08ch,08dh,08eh,065h,064h,081h,012h,013h,064h,085h,012h,013h,001h,002h,001h,002h	; 9a12  ...ed...d.......
	defb 003h,004h,003h,004h,064h,066h,012h,013h,064h,085h,012h,013h,064h,089h,012h,013h	; 9a22  ....df..d...d...
	defb 064h,08dh,012h,013h,064h,081h,082h,083h,064h,085h,086h,087h,001h,002h,010h,011h	; 9a32  d...d...d.......
	defb 003h,004h,012h,013h,080h,081h,082h,065h,084h,085h,086h,065h,001h,002h,010h,011h	; 9a42  .......e...e....
	defb 003h,004h,012h,013h,064h,081h,082h,083h,064h,085h,086h,087h,064h,089h,001h,002h	; 9a52  ....d...d...d...
	defb 064h,08dh,003h,004h,001h,002h,061h,063h,001h,002h,086h,0a6h,001h,002h,08ah,065h	; 9a62  d.....ac.......e
	defb 001h,002h,0e2h,08eh,065h,001h,002h,082h,065h,001h,002h,086h,065h,001h,002h,001h	; 9a72  ....e...e...e...
	defb 002h,003h,004h,003h,004h,080h,081h,082h,083h,084h,085h,086h,087h,001h,002h,08ah	; 9a82  ................
	defb 08bh,003h,004h,08eh,08fh,001h,002h,082h,065h,001h,002h,086h,065h,001h,002h,010h	; 9a92  ........e...e...
	defb 011h,001h,002h,012h,013h,080h,081h,082h,065h,084h,085h,086h,065h,001h,002h,08ah	; 9aa2  ........e...e...
	defb 065h,003h,004h,08eh,065h,064h,082h,001h,002h,064h,086h,001h,002h,001h,002h,001h	; 9ab2  e...ed...d......
	defb 002h,003h,004h,003h,004h,064h,081h,082h,083h,064h,085h,086h,087h,001h,002h,08ah	; 9ac2  .....d...d......
	defb 08bh,003h,004h,08eh,08fh,000h	; 9ad2

; ----------------------------------------------------------------------
; DATOS metabloques_ruina_2: RLE (L_5578): los metabloques de la ruina 2, 16
;   fichas cada uno; lo leen p00:5533 (953 bytes)
;   0x9ad8..0x9e91  (953 bytes)
DATA_metabloques_ruina_2:
	defb 0ffh,04ah,055h,04dh,052h,04ch,04ah,052h,054h,04dh,04bh,053h,055h,04bh,054h,04ch	; 9ad8  .JUMRLJRTMKSUKTL
	defb 053h,048h,049h,051h,050h,04ch,04ah,052h,054h,04dh,04bh,053h,055h,04bh,054h,04ch	; 9ae8  SHIQPLJRTMKSUKTL
	defb 053h,050h,092h,092h,048h,093h,099h,0a0h,093h,093h,09ah,0a1h,093h,053h,093h,093h	; 9af8  SP..H........S..
	defb 04bh,050h,049h,051h,048h,04ah,093h,093h,052h,04bh,093h,093h,053h,053h,054h,04ch	; 9b08  KPIQHJ..RK..SSTL
	defb 04bh,04ah,055h,051h,050h,04ch,04ah,052h,054h,04dh,04bh,053h,055h,04bh,054h,04ch	; 9b18  KJUQPLJRTMKSUKTL
	defb 053h,048h,049h,04dh,052h,04ch,04ah,052h,054h,04dh,04bh,053h,055h,04bh,054h,04ch	; 9b28  SHIMRLJRTMKSUKTL
	defb 053h,04ah,055h,04dh,052h,04ch,04ah,052h,054h,001h,002h,001h,002h,001h,002h,001h	; 9b38  SJUMRLJRT.......
	defb 002h,001h,002h,001h,002h,001h,002h,001h,002h,048h,049h,051h,050h,04bh,054h,04ch	; 9b48  .........HIQPKTL
	defb 0ffh,053h,001h,002h,04dh,052h,001h,002h,052h,054h,001h,002h,001h,002h,001h,002h	; 9b58  .S..MR..RT......
	defb 001h,002h,04ah,055h,001h,002h,04ch,04ah,001h,002h,001h,002h,001h,002h,001h,002h	; 9b68  ..JU..LJ........
	defb 001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,051h,050h,001h,002h	; 9b78  ............QP..
	defb 04ch,053h,001h,002h,001h,002h,001h,002h,001h,002h,048h,049h,001h,002h,04bh,054h	; 9b88  LS........HI..KT
	defb 001h,002h,001h,002h,04dh,052h,001h,002h,052h,054h,001h,002h,053h,055h,001h,002h	; 9b98  ....MR..RT..SU..
	defb 04ch,053h,001h,002h,051h,050h,001h,002h,052h,054h,001h,002h,053h,055h,001h,002h	; 9ba8  LS..QP..RT..SU..
	defb 04ch,053h,04ah,055h,001h,002h,04ch,04ah,001h,002h,04dh,04bh,001h,002h,04bh,054h	; 9bb8  LSJU..LJ..MK..KT
	defb 001h,002h,048h,049h,001h,002h,04ch,04ah,001h,002h,04dh,04bh,001h,002h,04bh,054h	; 9bc8  ..HI..LJ..MK..KT
	defb 0deh,001h,002h,04ah,055h,04dh,052h,04ch,04ah,052h,054h,04dh,04bh,001h,002h,04bh	; 9bd8  ...JUMRLJRTMK..K
	defb 054h,001h,002h,04ah,055h,04dh,052h,04ch,04ah,052h,054h,001h,002h,053h,055h,001h	; 9be8  T..JUMRLJRT..SU.
	defb 002h,04ch,053h,04ah,055h,001h,002h,04ch,04ah,001h,002h,04dh,04bh,051h,050h,04bh	; 9bf8  .LSJU..LJ..MKQPK
	defb 054h,04ch,053h,001h,002h,04dh,052h,001h,002h,052h,054h,048h,049h,053h,055h,04bh	; 9c08  TLS..MR..RTHISUK
	defb 054h,04ch,053h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h,002h,001h	; 9c18  TLS.............
	defb 002h,001h,002h,04ah,055h,04dh,052h,04ch,04ah,052h,054h,04dh,04bh,053h,055h,004h	; 9c28  ...JUMRLJRTMKSU.
	defb 040h,0ffh,04ah,055h,010h,011h,04ch,04ah,012h,013h,04dh,04bh,012h,013h,04bh,054h	; 9c38  @.JU..LJ..MK..KT
	defb 012h,013h,04ah,055h,012h,013h,04ch,04ah,012h,013h,04dh,04bh,012h,013h,04bh,054h	; 9c48  ..JU..LJ..MK..KT
	defb 012h,013h,048h,049h,012h,013h,04ch,04ah,012h,013h,04dh,04bh,012h,013h,04bh,054h	; 9c58  ..HI..LJ..MK..KT
	defb 012h,013h,04ah,055h,012h,013h,04ch,04ah,012h,013h,001h,002h,001h,002h,001h,002h	; 9c68  ..JU..LJ........
	defb 001h,002h,001h,002h,012h,013h,001h,002h,012h,013h,001h,002h,001h,002h,001h,002h	; 9c78  ................
	defb 001h,002h,001h,002h,010h,011h,001h,002h,012h,013h,001h,002h,012h,013h,001h,002h	; 9c88  ................
	defb 012h,013h,001h,002h,012h,013h,001h,002h,012h,013h,001h,002h,012h,013h,001h,002h	; 9c98  ................
	defb 012h,013h,04ah,055h,04dh,052h,04ch,04ah,052h,054h,001h,002h,010h,011h,001h,002h	; 9ca8  ..JUMRLJRT......
	defb 012h,0f2h,013h,001h,002h,04dh,052h,001h,002h,052h,054h,001h,002h,010h,011h,001h	; 9cb8  .....MR..RT.....
	defb 002h,012h,013h,001h,002h,010h,011h,001h,002h,012h,013h,048h,049h,012h,013h,04bh	; 9cc8  ...........HI..K
	defb 054h,012h,013h,001h,002h,012h,013h,001h,002h,012h,013h,048h,049h,012h,013h,04bh	; 9cd8  T..........HI..K
	defb 054h,012h,013h,04ah,055h,012h,013h,04ch,04ah,012h,013h,04dh,04bh,001h,002h,04bh	; 9ce8  T..JU..LJ..MK..K
	defb 054h,001h,002h,04ah,098h,096h,052h,04ch,098h,096h,054h,04dh,098h,096h,055h,04bh	; 9cf8  T..J..RL..TM..UK
	defb 098h,096h,053h,048h,097h,095h,050h,04ch,097h,095h,054h,04dh,098h,096h,055h,04bh	; 9d08  ..SH..PL..TM..UK
	defb 098h,096h,053h,04ah,097h,095h,052h,04ch,097h,095h,054h,001h,002h,001h,002h,001h	; 9d18  ..SJ..RL..T.....
	defb 002h,001h,002h,09bh,003h,090h,08ch,09ch,080h,072h,082h,09ch,071h,094h,094h,09ch	; 9d28  .........r..q...
	defb 080h,094h,094h,004h,090h,088h,072h,09eh,0a5h,082h,093h,09fh,0a6h,093h,004h,061h	; 9d38  ......r........a
	defb 003h,090h,0adh,0a2h,072h,082h,070h,0a3h,094h,094h,081h,0a3h,094h,094h,070h,0a3h	; 9d48  ....r.p.......p.
	defb 09ch,071h,093h,060h,09ch,09eh,0a5h,060h,09ch,09fh,0a6h,060h,09ch,080h,093h,060h	; 9d58  .q.`...`...`...`
	defb 060h,093h,081h,0a3h,060h,09eh,0a5h,0a3h,060h,09fh,0a6h,0a3h,060h,093h,070h,0a3h	; 9d68  `...`...`...`.p.
	defb 004h,061h,088h,093h,09eh,0a5h,093h,073h,09fh,0a6h,083h,004h,091h,08ch,060h,099h	; 9d78  .a.....s......`.
	defb 0a0h,060h,060h,09ah,0a1h,060h,094h,061h,061h,094h,004h,063h,08dh,065h,060h,093h	; 9d88  .``..`.aa..c.e`.
	defb 093h,065h,060h,093h,093h,065h,094h,061h,061h,066h,003h,063h,002h,093h,08ah,060h	; 9d98  .e`..e.aaf.c...`
	defb 068h,093h,093h,060h,068h,061h,061h,094h,068h,003h,063h,082h,069h,064h,003h,062h	; 9da8  h..`haa.h.c.id.b
	defb 08ch,065h,094h,061h,061h,065h,060h,093h,093h,065h,060h,093h,093h,003h,062h,0d9h	; 9db8  .e.aae`..e`...b.
	defb 067h,061h,061h,094h,068h,093h,093h,060h,068h,093h,093h,060h,068h,065h,060h,099h	; 9dc8  gaa.h..`h..`he`.
	defb 0a0h,065h,060h,09ah,0a1h,065h,060h,099h,0a0h,065h,060h,09ah,0a1h,060h,093h,093h	; 9dd8  .e`..e`..e`..`..
	defb 070h,060h,093h,072h,099h,060h,093h,070h,09ah,060h,093h,093h,071h,080h,093h,093h	; 9de8  p`.r.`.p.`..q...
	defb 060h,0a0h,082h,093h,060h,0a1h,080h,093h,060h,081h,093h,093h,060h,099h,0a0h,060h	; 9df8  `...`...`...`..`
	defb 068h,09ah,0a1h,060h,068h,099h,0a0h,060h,068h,09ah,0a1h,060h,068h,060h,099h,0a0h	; 9e08  h..`h..`h..`h`..
	defb 060h,060h,09ah,0a1h,060h,094h,061h,061h,094h,005h,093h,0abh,070h,099h,0a0h,080h	; 9e18  ``..`.aa....p...
	defb 072h,09ah,0a1h,081h,073h,099h,0a0h,093h,071h,09ah,0a1h,099h,0a0h,080h,093h,09ah	; 9e28  r...s...q.......
	defb 0a1h,082h,070h,099h,0a0h,083h,071h,09ah,0a1h,081h,093h,094h,094h,081h,0a3h,094h	; 9e38  ..p...q.........
	defb 094h,070h,0a3h,073h,083h,081h,0a3h,003h,091h,08eh,0a4h,09ch,071h,094h,094h,09ch	; 9e48  .p.s........q...
	defb 080h,094h,094h,09ch,071h,073h,083h,09dh,003h,091h,004h,062h,08ch,094h,061h,061h	; 9e58  ....qs.....b..aa
	defb 094h,060h,099h,0a0h,060h,060h,09ah,0a1h,060h,004h,093h,09ch,094h,061h,061h,094h	; 9e68  .`..``..`....aa.
	defb 060h,099h,0a0h,060h,060h,09ah,0a1h,060h,04ah,055h,04dh,052h,04ch,04ah,052h,054h	; 9e78  `..``..`JUMRLJRT
	defb 04dh,04bh,010h,011h,04bh,054h,012h,013h,000h	; 9e88  MK..KT...

; ----------------------------------------------------------------------
; DATOS metabloques_ruina_3: RLE (L_5578): los metabloques de la ruina 3, 16
;   fichas cada uno (sigue en el banco 12, en 0xA000); lo leen p00:5533 (367
;   bytes)
;   0x9e91..0xa000  (367 bytes)
DATA_metabloques_ruina_3:
	defb 0ech,045h,046h,043h,044h,049h,04ah,047h,048h,04dh,04eh,04bh,04ch,04fh,040h,022h	; 9e91  .EFCDIJGHMNKLO@"
	defb 023h,052h,053h,028h,056h,051h,026h,027h,055h,001h,002h,001h,002h,003h,004h,003h	; 9ea1  #RS(VQ&'U.......
	defb 004h,052h,053h,028h,056h,051h,026h,027h,055h,052h,053h,028h,056h,051h,026h,027h	; 9eb1  .RS(VQ&'URS(VQ&'
	defb 055h,035h,046h,043h,044h,036h,04ah,047h,048h,035h,04eh,04bh,04ch,036h,040h,022h	; 9ec1  U5FCD6JGH5NKL6@"
	defb 023h,029h,054h,029h,054h,061h,026h,027h,050h,060h,053h,028h,05eh,051h,026h,027h	; 9ed1  #)T)Ta&'P`S(^Q&'
	defb 055h,052h,041h,042h,056h,051h,092h,093h,055h,052h,096h,097h,056h,051h,094h,095h	; 9ee1  URABVQ..UR..VQ..
	defb 055h,045h,046h,043h,044h,049h,04ah,047h,048h,02bh,026h,025h,023h,004h,039h,0f1h	; 9ef1  UEFCDIJGH+&%#.9.
	defb 054h,029h,054h,05bh,05ch,05bh,05ah,058h,020h,058h,059h,057h,024h,057h,024h,025h	; 9f01  T)T[\[ZX XYW$W$%
	defb 05ah,058h,05ch,05bh,059h,057h,020h,058h,024h,025h,024h,057h,04fh,040h,022h,025h	; 9f11  ZX\[YW X$%$WO@"%
	defb 05ah,05ch,05bh,054h,059h,020h,058h,05ch,024h,025h,057h,025h,04fh,040h,029h,023h	; 9f21  Z\[TY X\$%W%O@)#
	defb 020h,058h,05ch,05bh,024h,057h,020h,058h,04dh,025h,024h,057h,04fh,040h,022h,023h	; 9f31   X\[$W XM%$WO@"#
	defb 05ah,058h,059h,020h,059h,057h,024h,025h,024h,025h,04bh,04ch,04fh,040h,022h,023h	; 9f41  ZXY YW$%$%KLO@"#
	defb 045h,046h,043h,044h,049h,092h,093h,048h,04dh,096h,097h,04ch,04fh,094h,095h,023h	; 9f51  EFCDI..HM..LO..#
	defb 001h,002h,043h,044h,003h,004h,047h,048h,001h,002h,001h,002h,003h,004h,003h,004h	; 9f61  ..CD..GH........
	defb 033h,003h,020h,0e4h,044h,034h,034h,02ah,001h,002h,001h,002h,003h,004h,003h,004h	; 9f71  3. .D44*........
	defb 020h,020h,038h,044h,038h,049h,047h,048h,001h,002h,001h,002h,003h,004h,003h,004h	; 9f81    8D8IGH........
	defb 045h,046h,043h,044h,049h,04ah,047h,048h,001h,002h,001h,002h,003h,004h,003h,004h	; 9f91  EFCDIJGH........
	defb 045h,046h,024h,025h,049h,04ah,047h,048h,04dh,04eh,04bh,04ch,04fh,040h,022h,023h	; 9fa1  EF$%IJGHMNKLO@"#
	defb 031h,046h,043h,044h,032h,04ah,047h,048h,001h,002h,001h,002h,003h,004h,003h,004h	; 9fb1  1FCD2JGH........
	defb 045h,046h,001h,002h,049h,04ah,003h,004h,001h,002h,001h,002h,003h,004h,003h,004h	; 9fc1  EF..IJ..........
	defb 001h,002h,001h,002h,003h,004h,003h,004h,004h,025h,099h,04fh,040h,022h,023h,025h	; 9fd1  .........%.O@"#%
	defb 025h,043h,044h,049h,04ah,047h,048h,04dh,04eh,04bh,04ch,04fh,040h,022h,023h,001h	; 9fe1  %CDIJGHMNKLO@"#.
	defb 002h,001h,002h,003h,003h,004h,095h,058h,059h,058h,059h,057h,025h,057h,025h	; 9ff1  .......XYXYW%W%
