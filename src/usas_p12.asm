; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 12 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS metabloques_ruina_3_cola: RLE (L_5578): los metabloques de la ruina 3,
;   16 fichas cada uno (sigue del banco 11); lo leen p00:5533 (560 bytes)
;   0xa000..0xa230  (560 bytes)
DATA_metabloques_ruina_3_cola:
	defb 068h,069h,020h,02eh,06dh,06eh,020h,071h,064h,065h,020h,070h,063h,003h,020h,0c0h	; a000  hi .mn qde pc. .
	defb 045h,046h,001h,002h,049h,04ah,003h,004h,04dh,04eh,001h,002h,04fh,040h,003h,004h	; a010  EF..IJ..MN..O@..
	defb 001h,002h,043h,044h,003h,004h,047h,048h,001h,002h,04bh,04ch,003h,004h,022h,023h	; a020  ..CD..GH..KL.."#
	defb 001h,002h,001h,002h,003h,004h,003h,004h,024h,025h,001h,002h,04fh,040h,003h,004h	; a030  ........$%..O@..
	defb 001h,002h,001h,002h,003h,004h,003h,004h,001h,002h,024h,025h,003h,004h,022h,023h	; a040  ..........$%.."#
	defb 004h,025h,0ffh,049h,04ah,047h,048h,04dh,04eh,04bh,04ch,04fh,040h,022h,023h,025h	; a050  .%.IJGHMNKLO@"#%
	defb 032h,001h,002h,049h,04ah,003h,004h,04dh,04eh,001h,002h,04fh,040h,003h,004h,001h	; a060  2..IJ..MN..O@...
	defb 002h,024h,025h,003h,004h,047h,048h,001h,002h,04bh,04ch,003h,004h,022h,023h,045h	; a070  .$%..GH..KL.."#E
	defb 046h,043h,044h,049h,04ah,047h,048h,04dh,04eh,001h,002h,04fh,040h,003h,004h,045h	; a080  FCDIJGHMN..O@..E
	defb 046h,043h,044h,049h,04ah,047h,048h,001h,002h,04bh,04ch,003h,004h,022h,023h,001h	; a090  FCDIJGH..KL.."#.
	defb 002h,043h,044h,003h,004h,047h,048h,025h,025h,023h,04ch,04fh,040h,022h,023h,045h	; a0a0  .CD..GH%%#LO@"#E
	defb 046h,001h,002h,049h,04ah,003h,004h,04dh,04eh,025h,025h,04fh,040h,04fh,040h,001h	; a0b0  F..IJ..MN%%O@O@.
	defb 002h,010h,011h,003h,004h,012h,013h,001h,002h,012h,013h,003h,004h,012h,013h,045h	; a0c0  ...............E
	defb 046h,043h,0d1h,044h,049h,04ah,047h,048h,04dh,04eh,04bh,073h,04fh,040h,022h,083h	; a0d0  FC.DIJGHMNKsO@".
	defb 045h,046h,043h,045h,05ch,05bh,054h,029h,05bh,05ah,08ch,05bh,08bh,082h,080h,08bh	; a0e0  EFCE\[T)[Z.[....
	defb 045h,046h,043h,045h,054h,05bh,054h,029h,083h,08bh,08ch,05bh,082h,081h,080h,08bh	; a0f0  EFCET[T)...[....
	defb 045h,046h,043h,044h,054h,046h,047h,048h,05ah,05ch,04bh,04ch,08ch,05bh,077h,023h	; a100  EFCDTFGHZ\KL.[w#
	defb 045h,046h,09eh,089h,049h,04ah,09fh,080h,04dh,04eh,072h,086h,04fh,040h,022h,06ah	; a110  EF..IJ..MNr.O@"j
	defb 081h,080h,080h,081h,004h,080h,088h,085h,090h,091h,084h,04fh,046h,043h,023h,003h	; a120  ...........OFC#.
	defb 080h,081h,081h,004h,080h,081h,085h,003h,080h,08ch,04fh,08ah,090h,091h,080h,08bh	; a130  ..........O.....
	defb 08ch,044h,080h,081h,080h,098h,003h,080h,0ffh,099h,091h,085h,088h,076h,001h,002h	; a140  .D...........v..
	defb 012h,013h,003h,004h,012h,013h,001h,002h,012h,013h,003h,004h,012h,013h,045h,046h	; a150  ..............EF
	defb 012h,013h,049h,04ah,012h,013h,04dh,04eh,001h,002h,04fh,040h,003h,004h,001h,002h	; a160  ..IJ..MN..O@....
	defb 010h,011h,003h,004h,012h,013h,025h,025h,012h,013h,04fh,040h,012h,013h,045h,046h	; a170  ......%%..O@..EF
	defb 043h,044h,049h,04ah,047h,048h,001h,002h,010h,011h,003h,004h,012h,013h,045h,046h	; a180  CDIJGH........EF
	defb 012h,013h,049h,04ah,012h,013h,04dh,04eh,012h,013h,04fh,040h,012h,013h,025h,025h	; a190  ..IJ..MN..O@..%%
	defb 012h,013h,049h,04ah,012h,013h,04dh,04eh,012h,013h,04fh,040h,012h,013h,001h,002h	; a1a0  ..IJ..MN..O@....
	defb 012h,013h,003h,004h,012h,013h,001h,002h,001h,002h,003h,004h,003h,004h,045h,046h	; a1b0  ..............EF
	defb 012h,013h,049h,04ah,012h,013h,001h,002h,0c2h,001h,002h,003h,004h,003h,004h,001h	; a1c0  ..IJ............
	defb 002h,043h,044h,003h,004h,047h,048h,001h,002h,010h,011h,003h,004h,012h,013h,045h	; a1d0  .CD..GH........E
	defb 046h,043h,044h,049h,04ah,047h,048h,047h,06ch,02bh,02ch,06bh,02bh,020h,020h,045h	; a1e0  FCDIJGHGl+,k+  E
	defb 046h,043h,044h,049h,04ah,047h,048h,02ch,02dh,04bh,04ch,020h,020h,02dh,023h,075h	; a1f0  FCDIJGH,-KL  -#u
	defb 020h,020h,067h,075h,020h,020h,02fh,074h,020h,030h,021h,003h,020h,0a1h,06fh,001h	; a200    gu  /t 0!. .o.
	defb 002h,001h,002h,003h,004h,003h,004h,001h,002h,001h,002h,003h,004h,003h,004h,045h	; a210  ...............E
	defb 046h,043h,044h,049h,04ah,047h,048h,04dh,04eh,010h,011h,04fh,040h,012h,013h,000h	; a220  FCDIJGHMN..O@...

; ----------------------------------------------------------------------
; DATOS metabloques_ruina_4: RLE (L_5578): los metabloques de la ruina 4, 16
;   fichas cada uno; lo leen p00:5533 (1396 bytes)
;   0xa230..0xa7a4  (1396 bytes)
DATA_metabloques_ruina_4:
	defb 0ffh,020h,021h,021h,022h,023h,024h,025h,026h,023h,025h,024h,026h,027h,028h,028h	; a230  . !!"#$%&#%$&'((
	defb 029h,049h,04ah,049h,04ah,023h,024h,025h,026h,023h,025h,024h,026h,027h,028h,028h	; a240  )IJIJ#$%&#%$&'((
	defb 029h,020h,021h,049h,04ah,023h,024h,025h,026h,023h,025h,024h,026h,027h,028h,028h	; a250  ) !IJ#$%&#%$&'((
	defb 029h,049h,04ah,021h,022h,023h,024h,025h,026h,023h,025h,024h,026h,027h,028h,028h	; a260  )IJ!"#$%&#%$&'((
	defb 029h,04bh,08ch,08eh,04dh,04ch,08dh,08fh,04eh,04bh,08ch,08eh,04dh,04ch,08dh,08fh	; a270  )K..ML..NK..ML..
	defb 04eh,043h,030h,031h,088h,04ch,08dh,08fh,04eh,04bh,08ch,08eh,04dh,04ch,08dh,08fh	; a280  NC01.L..NK..ML..
	defb 04eh,049h,04ah,043h,030h,023h,024h,04ch,08dh,023h,025h,04bh,08ch,027h,028h,04ch	; a290  NIJC0#$L.#%K.'(L
	defb 08dh,031h,088h,049h,04ah,08fh,04eh,02bh,026h,08eh,04dh,02bh,026h,08fh,04eh,02ch	; a2a0  .1.IJ.N+&.M+&.N,
	defb 0ffh,029h,020h,021h,043h,030h,023h,024h,04ch,08dh,023h,025h,04bh,08ch,027h,028h	; a2b0  .) !C0#$L.#%K.'(
	defb 04ch,08dh,031h,088h,02ah,022h,08fh,04eh,02bh,026h,08eh,04dh,02bh,026h,08fh,04eh	; a2c0  L.1.*".N+&.M+&.N
	defb 02ch,029h,020h,021h,04bh,08ch,023h,024h,04ch,08dh,023h,025h,04bh,08ch,027h,028h	; a2d0  ,) !K.#$L.#%K.'(
	defb 04ch,08dh,08eh,04dh,02ah,022h,08fh,04eh,02bh,026h,08eh,04dh,02bh,026h,08fh,04eh	; a2e0  L..M*".N+&.M+&.N
	defb 02ch,029h,060h,032h,033h,061h,023h,02fh,0aah,02eh,023h,0a9h,04fh,02dh,027h,02fh	; a2f0  ,)`23a#/..#.O-'/
	defb 0aah,02eh,044h,045h,08ah,089h,023h,02fh,0aah,02eh,023h,0a9h,04fh,02dh,027h,02fh	; a300  ..DE..#/..#.O-'/
	defb 0aah,02eh,020h,0a9h,04fh,02dh,023h,02fh,0aah,02eh,023h,0a9h,04fh,02dh,027h,02fh	; a310  .. .O-#/..#.O-'/
	defb 0aah,02eh,04bh,08ch,08eh,04dh,04ch,08dh,08fh,04eh,001h,002h,001h,002h,008h,009h	; a320  ..K..ML..N......
	defb 0ffh,008h,009h,020h,021h,04bh,08ch,023h,09ch,062h,08dh,023h,063h,09dh,099h,027h	; a330  ... !K.#.b.#c..'
	defb 09eh,09fh,09ah,08eh,04dh,02ah,022h,08fh,04eh,02bh,026h,0abh,064h,02bh,026h,0ach	; a340  ....M*".N+&.d+&.
	defb 065h,066h,029h,020h,090h,046h,09bh,023h,091h,068h,069h,023h,0a0h,06dh,0a1h,027h	; a350  ef) .F.#.hi#.m.'
	defb 0a4h,06fh,070h,0adh,08bh,067h,022h,06ah,06bh,06ch,026h,0a2h,06eh,0a3h,026h,0a5h	; a360  .op..g"jkl&.n.&.
	defb 071h,072h,029h,020h,073h,074h,075h,023h,077h,0a7h,0a8h,001h,002h,001h,002h,008h	; a370  qr) stu#w.......
	defb 009h,008h,009h,0a6h,092h,076h,022h,078h,079h,02bh,026h,001h,002h,001h,002h,008h	; a380  .....v"xy+&.....
	defb 009h,008h,009h,020h,073h,074h,075h,023h,077h,0a7h,0a8h,023h,025h,04bh,08ch,027h	; a390  ... stu#w..#%K.'
	defb 028h,04ch,08dh,0a6h,092h,076h,022h,078h,079h,02bh,026h,08eh,04dh,02bh,026h,08fh	; a3a0  (L...v"xy+&.M+&.
	defb 092h,04eh,02ch,029h,035h,039h,000h,000h,036h,097h,000h,000h,037h,03ah,03eh,000h	; a3b0  .N,)59..6...7:>.
	defb 038h,03bh,03fh,003h,000h,09dh,07eh,07ah,000h,000h,098h,07bh,000h,083h,07fh,07ch	; a3c0  8.?...~z...{...|
	defb 000h,084h,080h,07dh,037h,03ch,000h,000h,038h,03dh,040h,000h,037h,03ch,041h,000h	; a3d0  ...}7<..8=@.7<A.
	defb 038h,03dh,042h,003h,000h,0fah,081h,07ch,000h,085h,082h,07dh,000h,086h,081h,07ch	; a3e0  8=B....|...}...|
	defb 000h,087h,082h,07dh,037h,03ch,041h,000h,038h,03dh,042h,000h,037h,03ch,041h,000h	; a3f0  ...}7<A.8=B.7<A.
	defb 038h,03dh,042h,000h,000h,086h,081h,07ch,000h,087h,082h,07dh,000h,086h,081h,07ch	; a400  8=B....|...}...|
	defb 000h,087h,082h,07dh,037h,03ch,041h,000h,038h,03dh,042h,000h,001h,002h,001h,002h	; a410  ...}7<A.8=B.....
	defb 008h,009h,008h,009h,000h,086h,081h,07ch,000h,087h,082h,07dh,001h,002h,001h,002h	; a420  .......|...}....
	defb 008h,009h,008h,009h,020h,0a9h,04fh,02dh,05dh,034h,05eh,05fh,001h,002h,001h,002h	; a430  .... .O-]4^_....
	defb 008h,009h,008h,009h,050h,051h,052h,053h,054h,055h,056h,057h,058h,059h,05ah,026h	; a440  ....PQRSTUVWXYZ&
	defb 027h,05bh,05ch,029h,020h,021h,021h,022h,023h,024h,025h,026h,047h,048h,047h,048h	; a450  '[\) !!"#$%&GHGH
	defb 004h,0aeh,0b0h,000h,093h,095h,000h,000h,094h,096h,000h,000h,094h,096h,000h,000h	; a460  ................
	defb 094h,096h,000h,000h,094h,096h,000h,000h,094h,096h,000h,000h,094h,096h,000h,000h	; a470  ................
	defb 094h,096h,000h,020h,021h,021h,022h,023h,024h,025h,026h,001h,002h,001h,002h,008h	; a480  ... !!"#$%&.....
	defb 009h,008h,009h,008h,000h,0ffh,001h,002h,001h,002h,008h,009h,008h,009h,001h,002h	; a490  ................
	defb 001h,002h,008h,009h,008h,009h,049h,04ah,049h,04ah,027h,028h,028h,029h,001h,002h	; a4a0  ......IJIJ'(()..
	defb 003h,004h,008h,009h,00bh,00ah,049h,04ah,049h,04ah,027h,028h,028h,029h,003h,004h	; a4b0  ......IJIJ'(()..
	defb 001h,002h,00bh,00ah,008h,009h,049h,04ah,049h,04ah,027h,028h,028h,029h,003h,004h	; a4c0  ......IJIJ'(()..
	defb 021h,022h,00bh,00ah,025h,026h,003h,004h,024h,026h,00bh,00ah,028h,029h,020h,021h	; a4d0  !"..%&..$&..() !
	defb 003h,004h,023h,024h,00bh,00ah,023h,025h,003h,004h,027h,028h,00bh,00ah,003h,004h	; a4e0  ..#$..#%..'(....
	defb 049h,04ah,00bh,00ah,025h,026h,003h,004h,024h,026h,00bh,00ah,028h,029h,049h,04ah	; a4f0  IJ..%&..$&..()IJ
	defb 003h,004h,023h,024h,00bh,00ah,023h,025h,003h,004h,027h,028h,00bh,00ah,003h,004h	; a500  ..#$..#%..'(....
	defb 021h,022h,00bh,00ah,025h,0ffh,026h,003h,004h,001h,002h,00bh,00ah,008h,009h,020h	; a510  !"..%.&........
	defb 021h,003h,004h,023h,024h,00bh,00ah,001h,002h,003h,004h,008h,009h,00bh,00ah,003h	; a520  !..#$...........
	defb 004h,001h,002h,00bh,00ah,008h,009h,003h,004h,049h,04ah,00bh,00ah,028h,023h,001h	; a530  .........IJ..(#.
	defb 002h,007h,004h,008h,009h,006h,00ah,049h,04ah,003h,004h,027h,028h,00bh,00ah,001h	; a540  .......IJ..'(...
	defb 002h,021h,022h,00bh,00ah,025h,026h,003h,004h,024h,026h,00bh,00ah,028h,029h,020h	; a550  .!"..%&..$&..()
	defb 021h,001h,002h,023h,024h,00bh,00ah,023h,025h,003h,004h,027h,028h,00bh,00ah,020h	; a560  !..#$..#%..'(..
	defb 021h,021h,022h,023h,024h,025h,026h,001h,002h,001h,002h,00bh,007h,008h,009h,020h	; a570  !!"#$%&........
	defb 021h,021h,022h,023h,024h,025h,026h,001h,002h,001h,002h,008h,009h,006h,00ah,020h	; a580  !!"#$%&........
	defb 021h,021h,022h,023h,024h,0ffh,025h,026h,001h,002h,024h,026h,008h,009h,028h,029h	; a590  !!"#$.%&..$&..()
	defb 020h,021h,021h,022h,023h,024h,025h,026h,023h,025h,001h,002h,027h,028h,008h,009h	; a5a0   !!"#$%&#%..'(..
	defb 001h,002h,021h,022h,008h,009h,025h,026h,049h,04ah,024h,026h,027h,028h,028h,029h	; a5b0  ..!"..%&IJ$&'(()
	defb 020h,021h,001h,002h,023h,024h,008h,009h,023h,025h,049h,04ah,027h,028h,028h,029h	; a5c0   !..#$..#%IJ'(()
	defb 003h,004h,021h,022h,00bh,00ah,025h,026h,003h,004h,010h,011h,00bh,00ah,012h,013h	; a5d0  ..!"..%&........
	defb 001h,002h,010h,011h,005h,00ah,012h,013h,003h,004h,012h,013h,00bh,00ah,012h,013h	; a5e0  ................
	defb 003h,004h,012h,013h,00bh,00ah,012h,013h,003h,004h,012h,013h,00bh,00ah,012h,013h	; a5f0  ................
	defb 003h,004h,010h,011h,00bh,00ah,012h,013h,003h,004h,012h,013h,00bh,00ah,012h,013h	; a600  ................
	defb 001h,002h,010h,011h,008h,0ffh,009h,012h,013h,049h,04ah,012h,013h,027h,028h,012h	; a610  .........IJ..'(.
	defb 013h,020h,021h,012h,013h,023h,024h,012h,013h,023h,025h,001h,002h,027h,028h,008h	; a620  . !..#$..#%..'(.
	defb 009h,020h,021h,021h,022h,023h,024h,025h,026h,023h,025h,010h,011h,027h,028h,012h	; a630  . !!"#$%&#%..'(.
	defb 013h,020h,021h,012h,013h,023h,024h,012h,013h,023h,025h,012h,013h,027h,028h,012h	; a640  . !..#$..#%..'(.
	defb 013h,049h,04ah,012h,013h,023h,024h,012h,013h,023h,025h,012h,013h,027h,028h,012h	; a650  .IJ..#$..#%..'(.
	defb 013h,005h,006h,012h,013h,008h,009h,012h,013h,049h,04ah,012h,013h,027h,028h,012h	; a660  .........IJ..'(.
	defb 013h,020h,021h,021h,022h,023h,024h,025h,026h,001h,002h,010h,011h,008h,009h,012h	; a670  . !!"#$%&.......
	defb 013h,020h,021h,012h,013h,023h,024h,012h,013h,001h,002h,001h,002h,008h,009h,008h	; a680  . !..#$.........
	defb 009h,003h,004h,012h,013h,09ch,00bh,00ah,012h,013h,003h,004h,001h,002h,00bh,00ah	; a690  ................
	defb 008h,009h,020h,0a9h,04fh,02dh,023h,02fh,0aah,02eh,023h,0a9h,04fh,02dh,05dh,034h	; a6a0  .. .O-#/..#.O-]4
	defb 05eh,05fh,010h,000h,0ffh,020h,021h,021h,022h,023h,024h,025h,026h,001h,002h,024h	; a6b0  ^_... !!"#$%&..$
	defb 026h,00bh,00ah,028h,029h,020h,021h,021h,022h,023h,024h,025h,026h,023h,025h,001h	; a6c0  &..() !!"#$%&#%.
	defb 002h,027h,028h,00bh,00ah,003h,004h,021h,022h,00bh,00ah,025h,026h,049h,04ah,024h	; a6d0  .'(....!"..%&IJ$
	defb 026h,027h,028h,028h,029h,020h,021h,003h,004h,023h,024h,00bh,00ah,023h,025h,049h	; a6e0  &'(() !..#$..#%I
	defb 04ah,027h,028h,028h,029h,020h,021h,021h,022h,023h,024h,025h,026h,001h,002h,010h	; a6f0  J'(() !!"#$%&...
	defb 011h,00bh,00ah,012h,013h,001h,002h,001h,002h,008h,009h,008h,009h,001h,002h,001h	; a700  ................
	defb 002h,008h,009h,008h,009h,020h,021h,001h,002h,027h,029h,008h,009h,001h,002h,001h	; a710  ..... !..').....
	defb 002h,008h,009h,008h,009h,020h,021h,001h,002h,023h,024h,008h,009h,023h,025h,001h	; a720  ..... !..#$..#%.
	defb 002h,027h,028h,008h,0bdh,009h,001h,002h,02ah,022h,008h,009h,02bh,026h,001h,002h	; a730  .'(.....*"..+&..
	defb 001h,002h,008h,009h,008h,009h,001h,002h,02ah,022h,008h,009h,02bh,026h,001h,002h	; a740  ........*"..+&..
	defb 02bh,026h,008h,009h,02ch,029h,001h,002h,001h,002h,00bh,007h,008h,009h,003h,004h	; a750  +&..,)..........
	defb 049h,04ah,00bh,00ah,028h,029h,049h,04ah,049h,04ah,023h,024h,025h,026h,047h,048h	; a760  IJ..()IJIJ#$%&GH
	defb 047h,048h,004h,0aeh,08ch,020h,021h,049h,04ah,023h,024h,025h,026h,047h,048h,047h	; a770  GH... !IJ#$%&GHG
	defb 048h,004h,0aeh,08ch,049h,04ah,021h,022h,023h,024h,025h,026h,047h,048h,047h,048h	; a780  H...IJ!"#$%&GHGH
	defb 004h,0aeh,090h,020h,021h,012h,013h,023h,024h,012h,013h,001h,002h,012h,013h,008h	; a790  ... !..#$.......
	defb 009h,012h,013h,000h	; a7a0

; ----------------------------------------------------------------------
; DATOS fichas_p5167_colores: tabla de colores de la lista fichas_p5167
;   (L_529C indexa con c >> 4); lo leen p00:5167 (2 bytes)
;   0xa7a4..0xa7a6  (2 bytes)
DATA_fichas_p5167_colores:
	defb 0a6h,0a7h	; a7a4

; ----------------------------------------------------------------------
; DATOS fichas_p5167_col0: 2 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 5 bloques: (fichas_p5167_col0 A7A6-A7A8)
;   (fichas_p5167_col0 A7A6-A7AA) (fichas_p5167_col0 A7A6-A7AA)
;   (fichas_p5167_col0 A7A6-A7AA); lo leen p00:5167 (4 bytes)
;   0xa7a6..0xa7aa  (4 bytes)
DATA_fichas_p5167_col0:
	defb 00eh,00fh	; a7a6
	defb 00ch,000h	; a7a8

; ----------------------------------------------------------------------
; DATOS fichas_p5167: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5167 (31 bytes)
;   0xa7aa..0xa7c9  (31 bytes)
DATA_fichas_p5167:
	defb 005h,002h,040h,094h,02fh,0c9h	; a7aa
	defb 0a7h,003h,000h,09ch,015h,0c9h	; a7b0
	defb 0a7h,000h,054h,09ch,002h,0b9h	; a7b6
	defb 0aah,001h,05ch,09ch,001h,0b9h	; a7bc
	defb 0aah,002h,060h,09ch,007h,0c9h	; a7c2
	defb 0aah	; a7c8

; ----------------------------------------------------------------------
; DATOS fichas_p5167_f1: 21 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 1 de la lista fichas_p5167; se solapan 2 bloques:
;   (fichas_p5167_f0 A7C9-AAB9); lo leen p00:5167 (752 bytes)
;   0xa7c9..0xaab9  (752 bytes)
DATA_fichas_p5167_f1:
	defb 0fdh,0feh,0ffh,0f8h,0f8h,0fah,0ffh,0f8h,0f8h,0f2h,0ffh,0f8h,0f1h,0e6h,0ffh,0f0h	; a7c9  ................
	defb 0ffh,0ffh,0ffh,0fdh,0fdh,0fah,0fdh,0fah,0fdh,07ah,0fdh,0e8h,06dh,010h,0e9h,050h	; a7d9  .........z..m..P
	defb 0feh,0ffh,0feh,0feh,0fdh,0f8h,0f8h,0edh,0edh,082h,0a3h,050h,0ach,043h,0b0h,00eh	; a7e9  ...........P.C..
	defb 0f0h,0eeh,0ffh,0c0h,0cah,095h,0e0h,0c2h,0efh,0c0h,0f2h,080h,0cfh,0a0h,0d0h,086h	; a7f9  ................
	defb 06bh,000h,0f4h,002h,091h,000h,03ah,011h,0b0h,00bh,0b5h,002h,0cdh,010h,0adh,000h	; a809  k.....:.........
	defb 0e0h,01dh,041h,032h,003h,054h,006h,0e8h,0e4h,011h,098h,003h,008h,042h,001h,0e6h	; a819  ..A2.T.......B..
	defb 0efh,000h,043h,018h,03ch,003h,0a8h,057h,0a8h,057h,0ech,000h,0a8h,057h,0ffh,000h	; a829  ..C.<..W.W...W..
	defb 05eh,001h,08ah,001h,0f2h,000h,056h,020h,054h,020h,0ddh,000h,055h,020h,0f9h,000h	; a839  ^.....V T ..U ..
	defb 001h,0b4h,042h,014h,0e3h,008h,0a6h,008h,0f5h,000h,0dfh,000h,0ffh,000h,07fh,000h	; a849  ..B.............
	defb 0d4h,08bh,0d4h,08bh,0fch,083h,0d0h,08bh,0d0h,08bh,0dfh,080h,0d0h,0abh,0f0h,08bh	; a859  ................
	defb 0a9h,000h,0abh,000h,0fbh,000h,02bh,000h,02fh,000h,0efh,000h,02fh,000h,03fh,000h	; a869  ......+./.../.?.
	defb 0d0h,08bh,0d0h,08bh,0d0h,08bh,0d0h,08bh,0d0h,08bh,0d0h,08bh,0d0h,08bh,0d0h,08bh	; a879  ................
	defb 02fh,000h,02fh,000h,02fh,000h,02fh,000h,02fh,000h,02fh,000h,02fh,000h,02fh,000h	; a889  /./././././././.
	defb 0d0h,08bh,0d0h,08fh,0ffh,0c0h,0c0h,093h,0ffh,080h,0a4h,000h,0ffh,000h,080h,053h	; a899  ...............S
	defb 02fh,000h,02fh,000h,0ffh,000h,02fh,080h,0ffh,000h,027h,000h,0ffh,000h,027h,080h	; a8a9  /./.../...'...'.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0c6h,0ceh,091h,0e3h,0cch,0e0h,093h,0b8h,041h	; a8b9  ...............A
	defb 0ffh,0ffh,0ffh,08ch,0dch,0a3h,0e0h,001h,01fh,0e0h,0d8h,007h,0e3h,018h,088h,066h	; a8c9  ...............f
	defb 0ffh,000h,001h,0f6h,0cfh,000h,080h,075h,0f9h,000h,000h,07fh,000h,07fh,0a1h,000h	; a8d9  .......u........
	defb 0e6h,019h,018h,0e6h,0e1h,018h,007h,060h,08fh,000h,01fh,000h,05fh,000h,0ffh,000h	; a8e9  .......`...._...
	defb 000h,05eh,0ebh,000h,080h,00ch,080h,000h,080h,07bh,0c4h,000h,080h,07dh,080h,000h	; a8f9  .^.......{...}..
	defb 080h,07bh,0c4h,000h,080h,07dh,080h,000h,080h,07bh,0c4h,000h,080h,07dh,080h,000h	; a909  .{...}...{...}..
	defb 0ffh,000h,081h,07eh,042h,000h,0e7h,018h,018h,0c3h,081h,03ch,000h,0c3h,000h,03ch	; a919  ...~B......<...<
	defb 018h,0c3h,03ch,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; a929  ..<.............
	defb 0ffh,0ffh,0ffh,0fch,0fdh,0e2h,0f2h,0c9h,0e2h,091h,0c6h,0a1h,0cah,035h,084h,042h	; a939  .............5.B
	defb 0ffh,0ffh,0efh,010h,032h,008h,091h,008h,0b6h,009h,0d4h,02bh,0e9h,014h,0aeh,011h	; a949  ....2......+....
	defb 0ffh,0ffh,0ffh,03fh,07fh,007h,08fh,063h,003h,0f9h,001h,02ch,081h,052h,081h,02ch	; a959  ...?...c...,.R.,
	defb 082h,041h,082h,060h,082h,040h,084h,073h,084h,022h,0c9h,004h,0d1h,00eh,0f1h,08eh	; a969  .A.`.@.s."......
	defb 0cch,002h,010h,066h,005h,0c8h,022h,005h,0e0h,01ah,021h,08eh,04ch,091h,098h,003h	; a979  ...f.."...!.L...
	defb 080h,007h,0b0h,003h,050h,021h,098h,002h,0f8h,001h,0c8h,011h,068h,091h,098h,002h	; a989  ....P!......h...
	defb 0b9h,004h,092h,004h,0f0h,088h,0e0h,083h,08bh,074h,097h,060h,045h,028h,05fh,020h	; a999  .........t.`E(_
	defb 011h,024h,033h,048h,037h,0c0h,0e7h,010h,0efh,010h,0dfh,020h,05eh,0a0h,0bfh,040h	; a9a9  .$3H7...... ^..@
	defb 0c8h,011h,0b9h,002h,091h,022h,0f3h,005h,023h,041h,0a7h,04bh,067h,083h,0cfh,001h	; a9b9  ....."..#A.Kg...
	defb 0bdh,002h,08eh,041h,005h,040h,000h,075h,081h,02ah,0c7h,018h,0fbh,084h,0f4h,0c0h	; a9c9  ...A.@.u.*......
	defb 038h,0c0h,0ffh,000h,0e3h,018h,07eh,000h,0c5h,030h,07ah,080h,01eh,000h,0ffh,01ch	; a9d9  8.....~..0z.....
	defb 09bh,001h,0b5h,000h,07dh,000h,0c5h,002h,001h,002h,001h,016h,003h,0cdh,087h,039h	; a9e9  ....}..........9
	defb 0ffh,0ffh,0ffh,0feh,0feh,0f9h,0f8h,0f6h,0f1h,0ech,0e1h,0d4h,0e1h,0d8h,0c0h,0b0h	; a9f9  ................
	defb 0ffh,000h,024h,018h,06ah,000h,082h,03ch,039h,042h,045h,030h,0ffh,000h,08bh,030h	; aa09  ..$.j..<9BE0...0
	defb 0ffh,0ffh,0ffh,07fh,07fh,09fh,01fh,06fh,00fh,037h,087h,02bh,087h,01bh,083h,015h	; aa19  .......o.7.+....
	defb 080h,068h,080h,050h,080h,060h,087h,040h,08ah,045h,092h,00dh,093h,008h,092h,00ch	; aa29  .h.P.`.@.E......
	defb 093h,020h,0abh,000h,0c7h,030h,06bh,080h,076h,000h,05ch,080h,074h,088h,034h,080h	; aa39  . ...0k.v.\.t.4.
	defb 081h,00eh,0c1h,006h,0c1h,006h,0f1h,002h,019h,062h,009h,0b0h,089h,002h,04dh,010h	; aa49  .........b....M.
	defb 091h,00ch,0a1h,008h,0a3h,008h,093h,004h,091h,04ch,088h,046h,084h,023h,085h,002h	; aa59  .........L.F.#..
	defb 016h,048h,013h,06ch,099h,024h,048h,023h,04ch,011h,0a4h,048h,093h,024h,0cdh,010h	; aa69  .H.l.$H#L..H.$..
	defb 08dh,030h,00dh,060h,099h,000h,019h,082h,031h,082h,061h,000h,0e1h,002h,071h,000h	; aa79  .0.`....1.a...q.
	defb 09eh,040h,0a7h,000h,0c1h,018h,0c0h,01fh,0c0h,00eh,0a0h,000h,099h,040h,0c7h,020h	; aa89  .@...........@.
	defb 06ah,080h,03bh,044h,02eh,040h,0c0h,007h,060h,081h,03ch,000h,0e3h,000h,080h,000h	; aa99  j..D.@..`.<.....
	defb 03dh,040h,0c7h,010h,0e3h,008h,033h,08ch,003h,0f4h,005h,020h,099h,002h,0e3h,004h	; aaa9  =@....3.... ....

; ----------------------------------------------------------------------
; DATOS fichas_p5167_f3: 1 fichas de 8x8 a 1 bit(s) por punto (8 bytes cada
;   una), entrada 3 de la lista fichas_p5167; se solapan 2 bloques:
;   (fichas_p5167_f2 AAB9-AAC9); lo leen p00:5167 (16 bytes)
;   0xaab9..0xaac9  (16 bytes)
DATA_fichas_p5167_f3:
	defb 07fh,0ffh,07fh,0ffh,07fh,0ffh,07fh,0ffh	; aab9  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; aac1  ........

; ----------------------------------------------------------------------
; DATOS fichas_p5167_f4: 7 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 4 de la lista fichas_p5167; lo leen p00:5167 (112 bytes)
;   0xaac9..0xab39  (112 bytes)
DATA_fichas_p5167_f4:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0feh,0fdh,0fch,0fah,0f9h,0f0h,0f9h,0f0h	; aac9  ................
	defb 0ffh,0ffh,0ffh,0feh,0ffh,0f8h,0fch,061h,069h,002h,0eah,001h,0bfh,000h,0f4h,008h	; aad9  .......ai.......
	defb 0ffh,03fh,03fh,0dfh,05fh,00fh,01fh,0e7h,0cfh,017h,02fh,087h,0ffh,007h,05fh,081h	; aae9  .??._...../..._.
	defb 0fbh,0f0h,0fah,0f1h,0f4h,0f2h,0fdh,0c0h,0cfh,080h,0d9h,084h,0f1h,0cch,0dbh,080h	; aaf9  ................
	defb 024h,0d1h,025h,080h,04eh,000h,0b7h,000h,0dch,001h,086h,078h,003h,034h,08bh,004h	; ab09  $.%.N......x.4..
	defb 09bh,004h,05eh,000h,036h,080h,0ffh,000h,06ch,093h,0b8h,041h,0e4h,000h,072h,080h	; ab19  ..^.6...l..A..r.
	defb 0ffh,03fh,03fh,05fh,01fh,02fh,0bfh,00fh,0efh,017h,047h,08bh,057h,083h,03fh,007h	; ab29  .??_./....G.W.?.

; ----------------------------------------------------------------------
; DATOS mapa_sala5: RLE (L_5578): la pantalla de la sala de la puerta 5
;   (p00:552B); lo leen p00:552B (45 bytes)
;   0xab39..0xab66  (45 bytes)
DATA_mapa_sala5:
	defb 082h,016h,017h,004h,018h,084h,017h,01dh,019h,01ah,004h,026h,084h,01ah,01eh,019h	; ab39  ...........&....
	defb 01bh,004h,026h,084h,01bh,01eh,019h,01ch,004h,026h,08ch,01ch,01eh,019h,01fh,020h	; ab49  ..&......&.....
	defb 027h,028h,020h,01fh,01eh,021h,022h,004h,023h,082h,022h,024h,000h	; ab59  '( ..!".#."$.

; ----------------------------------------------------------------------
; DATOS metabloques_sala5: RLE (L_5578): los metabloques de la sala de la
;   puerta 5; lo leen p00:5548 (613 bytes)
;   0xab66..0xadcb  (613 bytes)
DATA_metabloques_sala5:
	defb 0a8h,001h,002h,001h,002h,003h,004h,003h,004h,001h,002h,001h,003h,003h,004h,003h	; ab66  ................
	defb 000h,001h,002h,001h,002h,003h,004h,003h,004h,000h,000h,034h,035h,000h,000h,032h	; ab76  ...........45..2
	defb 033h,001h,002h,001h,002h,003h,001h,003h,001h,004h,000h,081h,034h,003h,000h,088h	; ab86  3...........4...
	defb 001h,002h,001h,002h,003h,001h,003h,001h,004h,000h,08ch,034h,035h,034h,000h,001h	; ab96  ...........454..
	defb 002h,001h,002h,003h,001h,003h,001h,008h,000h,0ffh,001h,002h,001h,002h,003h,001h	; aba6  ................
	defb 003h,004h,000h,000h,034h,035h,034h,035h,032h,033h,001h,002h,001h,002h,003h,004h	; abb6  ....454523......
	defb 003h,004h,000h,000h,001h,002h,034h,035h,000h,004h,001h,002h,001h,002h,003h,004h	; abc6  ......45........
	defb 003h,004h,001h,002h,001h,002h,003h,004h,003h,004h,001h,003h,000h,000h,002h,000h	; abd6  ................
	defb 034h,035h,000h,000h,030h,031h,034h,035h,032h,033h,034h,035h,030h,031h,032h,033h	; abe6  45..014523450123
	defb 032h,033h,030h,031h,030h,031h,032h,033h,032h,033h,030h,031h,030h,031h,032h,033h	; abf6  2301012323010123
	defb 032h,033h,030h,031h,030h,031h,032h,033h,032h,033h,030h,031h,030h,031h,032h,033h	; ac06  2301012323010123
	defb 032h,033h,004h,003h,004h,003h,002h,001h,002h,001h,001h,002h,001h,002h,003h,004h	; ac16  23..............
	defb 003h,004h,001h,002h,001h,002h,003h,004h,003h,089h,000h,001h,002h,001h,002h,003h	; ac26  ................
	defb 004h,003h,004h,008h,000h,088h,001h,002h,001h,002h,003h,001h,003h,001h,006h,000h	; ac36  ................
	defb 09ah,034h,035h,001h,002h,001h,002h,003h,001h,003h,001h,034h,035h,034h,035h,032h	; ac46  .45........45452
	defb 033h,032h,033h,001h,002h,001h,002h,003h,001h,003h,004h,004h,000h,094h,034h,035h	; ac56  323...........45
	defb 034h,035h,001h,002h,001h,002h,003h,004h,003h,004h,000h,000h,001h,002h,034h,000h	; ac66  45............4.
	defb 000h,004h,004h,000h,0e4h,034h,035h,034h,035h,030h,031h,030h,031h,032h,033h,032h	; ac76  .....45450101232
	defb 033h,030h,035h,030h,031h,032h,033h,032h,033h,030h,031h,030h,031h,032h,033h,032h	; ac86  3050123230101232
	defb 033h,030h,031h,034h,035h,032h,033h,032h,033h,030h,031h,030h,031h,032h,033h,032h	; ac96  3014523230101232
	defb 033h,001h,002h,001h,002h,000h,004h,003h,004h,034h,035h,034h,035h,032h,033h,032h	; aca6  3........4545232
	defb 033h,005h,006h,005h,006h,007h,008h,007h,008h,007h,008h,000h,000h,008h,007h,000h	; acb6  3...............
	defb 000h,005h,006h,005h,006h,007h,008h,007h,008h,000h,040h,050h,000h,000h,040h,050h	; acc6  ..........@P..@P
	defb 000h,005h,006h,005h,006h,007h,008h,007h,008h,008h,000h,0f0h,009h,00bh,000h,000h	; acd6  ................
	defb 00ah,00ch,000h,000h,009h,00bh,000h,000h,00ah,00ch,000h,000h,041h,045h,055h,051h	; ace6  ............AEUQ
	defb 03ah,040h,050h,03ah,03bh,040h,050h,03bh,03ch,042h,052h,03ch,03dh,043h,053h,03dh	; acf6  :@P:.@P.<BR<=CS=
	defb 03ch,044h,054h,03ch,03ah,040h,050h,03ah,03bh,040h,050h,03bh,000h,040h,050h,000h	; ad06  <DT<:@P:.@P..@P.
	defb 000h,042h,052h,000h,000h,043h,053h,000h,000h,044h,054h,000h,005h,006h,005h,006h	; ad16  .BR..CS..DT.....
	defb 007h,008h,007h,008h,000h,000h,007h,008h,000h,000h,008h,007h,000h,000h,012h,010h	; ad26  ................
	defb 000h,000h,013h,011h,000h,000h,012h,010h,000h,000h,013h,011h,046h,040h,050h,056h	; ad36  ............F@PV
	defb 057h,040h,050h,047h,047h,048h,058h,057h,049h,04bh,05bh,059h,008h,000h,004h,03eh	; ad46  W@PGGHXWIK[Y...>
	defb 0d4h,039h,038h,039h,038h,009h,00bh,000h,000h,00ah,00ch,000h,000h,004h,003h,004h	; ad56  .9898...........
	defb 003h,002h,001h,002h,001h,04ah,04ch,05ch,05ah,046h,04dh,05dh,056h,004h,003h,004h	; ad66  .....JL\ZFM]V...
	defb 003h,002h,001h,002h,001h,038h,039h,038h,039h,039h,038h,039h,038h,004h,003h,004h	; ad76  .....89899898...
	defb 003h,002h,001h,002h,001h,000h,000h,012h,010h,000h,000h,013h,011h,004h,003h,004h	; ad86  ................
	defb 003h,002h,001h,002h,001h,034h,035h,000h,000h,032h,033h,034h,035h,030h,031h,030h	; ad96  .....45..2345010
	defb 031h,032h,033h,032h,033h,012h,000h,086h,04eh,03fh,000h,000h,04fh,000h,004h,03eh	; ada6  12323...N?..O..>
	defb 086h,039h,038h,039h,038h,03fh,05eh,003h,000h,083h,05fh,000h,000h,004h,03eh,084h	; adb6  .9898?^..._...>.
	defb 039h,038h,039h,038h,000h	; adc6

; ----------------------------------------------------------------------
; DATOS fichas_p5372_colores: tabla de colores de la lista fichas_p5372
;   (L_529C indexa con c >> 4); lo leen p00:5372 (8 bytes)
;   0xadcb..0xadd3  (8 bytes)
DATA_fichas_p5372_colores:
	defb 0d3h,0adh	; adcb
	defb 0d7h,0adh	; adcd
	defb 0dbh,0adh	; adcf
	defb 0dfh,0adh	; add1

; ----------------------------------------------------------------------
; DATOS fichas_p5372_col0: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; lo leen p00:5372 (4 bytes)
;   0xadd3..0xadd7  (4 bytes)
DATA_fichas_p5372_col0:
	defb 000h,002h,004h,00fh	; add3

; ----------------------------------------------------------------------
; DATOS fichas_p5372_col1: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; lo leen p00:5372 (4 bytes)
;   0xadd7..0xaddb  (4 bytes)
DATA_fichas_p5372_col1:
	defb 000h,006h,00ch,00fh	; add7

; ----------------------------------------------------------------------
; DATOS fichas_p5372_col2: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; lo leen p00:5372 (4 bytes)
;   0xaddb..0xaddf  (4 bytes)
DATA_fichas_p5372_col2:
	defb 000h,00ch,00dh,00fh	; addb

; ----------------------------------------------------------------------
; DATOS fichas_p5372_col3: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 3 bloques: (fichas_p5372_col3 ADDF-ADE3)
;   (fichas_p5372_col3 ADDF-ADE3); lo leen p00:5372 (4 bytes)
;   0xaddf..0xade3  (4 bytes)
DATA_fichas_p5372_col3:
	defb 000h,00dh,00eh,00fh	; addf

; ----------------------------------------------------------------------
; DATOS fichas_p5372: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:5372 (37 bytes)
;   0xade3..0xae08  (37 bytes)
DATA_fichas_p5372:
	defb 006h,012h,050h,0ach,003h,088h	; ade3
	defb 0aeh,022h,05ch,0ach,004h,008h	; ade9
	defb 0aeh,032h,06ch,0ach,004h,048h	; adef
	defb 0aeh,032h,04ch,0ach,001h,018h	; adf5
	defb 0afh,002h,000h,0b0h,006h,0b8h	; adfb
	defb 0aeh,032h,044h,0ach,002h,028h	; ae01
	defb 0afh	; ae07

; ----------------------------------------------------------------------
; DATOS fichas_p5372_f1: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 1 de la lista fichas_p5372; lo leen p00:5372 (64 bytes)
;   0xae08..0xae48  (64 bytes)
DATA_fichas_p5372_f1:
	defb 003h,003h,003h,002h,00fh,00fh,01ch,01bh,03fh,030h,03fh,037h,03ch,03bh,070h,06fh	; ae08  ........?0?7<.po
	defb 0c0h,0c0h,0e0h,060h,0d0h,0f0h,0e8h,0d8h,074h,0ech,0fch,0e4h,03ch,0dch,00eh,0f6h	; ae18  ...`....t...<...
	defb 076h,07dh,06dh,07bh,02dh,03bh,02dh,03bh,03dh,02bh,03fh,030h,00fh,008h,007h,007h	; ae28  v}m{-.-.=+?0....
	defb 0feh,0feh,0deh,0beh,0bch,07ch,0bch,07ch,0bch,07ch,0d8h,038h,0f8h,008h,0f0h,0f0h	; ae38  .....|.|.|.8....

; ----------------------------------------------------------------------
; DATOS fichas_p5372_f2: 4 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 2 de la lista fichas_p5372; lo leen p00:5372 (64 bytes)
;   0xae48..0xae88  (64 bytes)
DATA_fichas_p5372_f2:
	defb 07fh,060h,05fh,060h,05fh,060h,04fh,070h,060h,07fh,05fh,07fh,020h,03fh,01fh,01fh	; ae48  .`_`_`Op`._. ?..
	defb 0feh,006h,0fah,006h,0fah,006h,0f2h,00eh,006h,0feh,0fah,0feh,004h,0fch,0f8h,0f8h	; ae58  ................
	defb 01fh,01fh,02fh,030h,05fh,07fh,060h,07fh,040h,07fh,040h,07fh,040h,07fh,05bh,07fh	; ae68  ../0_.`.@.@.@.[.
	defb 0f8h,0f8h,0f4h,00ch,0fah,0feh,006h,0feh,002h,0feh,002h,0feh,002h,0feh,026h,0feh	; ae78  ..............&.

; ----------------------------------------------------------------------
; DATOS fichas_p5372_f0: 3 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_p5372; lo leen p00:5372 (48 bytes)
;   0xae88..0xaeb8  (48 bytes)
DATA_fichas_p5372_f0:
	defb 01fh,01fh,077h,069h,0a1h,0deh,0adh,0f3h,0e7h,0dbh,0b5h,0ffh,06ah,07fh,01fh,01fh	; ae88  ..wi........j...
	defb 066h,066h,0ffh,099h,0bbh,044h,055h,0aah,088h,077h,011h,0ffh,0cdh,0feh,0f7h,0f7h	; ae98  ff...DU..w......
	defb 0f8h,0f8h,0eeh,096h,08bh,07dh,09bh,0e7h,0a7h,0fdh,09dh,0fbh,026h,0feh,0f8h,0f8h	; aea8  .....}......&...

; ----------------------------------------------------------------------
; DATOS fichas_p5372_f4: 6 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 4 de la lista fichas_p5372; lo leen p00:5372 (96 bytes)
;   0xaeb8..0xaf18  (96 bytes)
DATA_fichas_p5372_f4:
	defb 007h,007h,01fh,018h,03fh,027h,07fh,04fh,0ffh,0dfh,0fdh,09eh,0f8h,09fh,0f2h,09fh	; aeb8  ....?'.O........
	defb 080h,080h,0c0h,040h,0e0h,0a0h,0f0h,0d0h,0f0h,0f0h,070h,0f0h,030h,0f0h,0b0h,0f0h	; aec8  ...@......p.0...
	defb 0f2h,09fh,0f8h,09fh,0fch,08fh,0ffh,0cfh,07fh,073h,0ffh,0c1h,0bfh,0ffh,0e0h,0ffh	; aed8  .........s......
	defb 0b0h,0f0h,070h,0d0h,0f0h,0d0h,0f0h,090h,0f0h,030h,0d0h,070h,0b0h,0f0h,078h,0f8h	; aee8  ..p......0.p..x.
	defb 0bfh,0ffh,060h,07fh,07fh,07fh,07fh,040h,07fh,040h,07fh,040h,07fh,060h,03fh,03fh	; aef8  ..`....@.@.@.`??
	defb 0d8h,0f8h,07ch,0ech,0feh,0c6h,0ffh,003h,0fdh,003h,0fch,003h,0ffh,0c7h,0fch,0fch	; af08  ..|.............

; ----------------------------------------------------------------------
; DATOS fichas_p5372_f3: 1 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 3 de la lista fichas_p5372; lo leen p00:5372 (16 bytes)
;   0xaf18..0xaf28  (16 bytes)
DATA_fichas_p5372_f3:
	defb 0ffh,0ffh,0e7h,099h,0bfh,0c3h,0fdh,0a7h,0b1h,0dfh,0dbh,0bfh,0adh,0ffh,0d7h,0ffh	; af18  ................

; ----------------------------------------------------------------------
; DATOS fichas_p5372_f5: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 5 de la lista fichas_p5372; lo leen p00:5372 (32 bytes)
;   0xaf28..0xaf48  (32 bytes)
DATA_fichas_p5372_f5:
	defb 05bh,074h,05bh,074h,05bh,074h,05bh,074h,05bh,074h,05bh,074h,05bh,074h,05bh,074h	; af28  [t[t[t[t[t[t[t[t
	defb 092h,07eh,092h,07eh,092h,07eh,092h,07eh,092h,07eh,092h,07eh,092h,07eh,092h,07eh	; af38  .~.~.~.~.~.~.~.~

; ----------------------------------------------------------------------
; DATOS texto_p5383: texto (L_4D4A): [X][Y], caracteres, 0xFE otra posicion,
;   0xFF acaba; lo leen p00:5383 (35 bytes)
;   0xaf48..0xaf6b  (35 bytes)
DATA_texto_p5383:
	defb 000h,078h,097h,098h,0feh,000h,080h,09bh,09ch,0feh,000h,088h,09dh,09eh,0feh,000h	; af48  .x..............
	defb 090h,099h,09ah,0feh,010h,078h,0a0h,0a1h,0feh,010h,080h,0a2h,0a3h,0feh,010h,088h	; af58  .....x..........
	defb 0a4h,0a5h,0ffh	; af68

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_colores: tabla de colores de la lista fichas_p53BB
;   (L_529C indexa con c >> 4); lo leen p00:53BB (6 bytes)
;   0xaf6b..0xaf71  (6 bytes)
DATA_fichas_p53BB_colores:
	defb 071h,0afh	; af6b
	defb 079h,0afh	; af6d
	defb 07dh,0afh	; af6f

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_col0: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 4 bloques: (fichas_p53BB_col0 AF71-AF75)
;   (fichas_p53BB_col0 AF71-AF79) (fichas_p53BB_col0 AF71-AF79); lo leen
;   p00:53BB (8 bytes)
;   0xaf71..0xaf79  (8 bytes)
DATA_fichas_p53BB_col0:
	defb 000h,00dh,00eh,00fh	; af71
	defb 00bh,00ah,00ch,000h	; af75

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_col1: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 2 bloques: (fichas_p53BB_col1 AF79-AF7D); lo
;   leen p00:53BB (4 bytes)
;   0xaf79..0xaf7d  (4 bytes)
DATA_fichas_p53BB_col1:
	defb 000h,00bh,00dh,00eh	; af79

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_col2: 4 colores (indice -> color de la paleta) que L_529C
;   copia a 0xDF00; se solapan 2 bloques: (fichas_p53BB_col2 AF7D-AF81); lo
;   leen p00:53BB (4 bytes)
;   0xaf7d..0xaf81  (4 bytes)
DATA_fichas_p53BB_col2:
	defb 00ah,00dh,00eh,00fh	; af7d

; ----------------------------------------------------------------------
; DATOS fichas_p53BB: lista de fichas (L_529C): [n] y n x
;   [c][destino][cuantas][origen]; lo leen p00:53BB (49 bytes)
;   0xaf81..0xafb2  (49 bytes)
DATA_fichas_p53BB:
	defb 008h,002h,000h,0b4h,008h,0b2h	; af81
	defb 0afh,002h,000h,0b8h,008h,032h	; af87
	defb 0b0h,012h,020h,0b4h,002h,0d2h	; af8d
	defb 0b0h,012h,020h,0b8h,002h,0f2h	; af93
	defb 0b0h,004h,028h,0b4h,002h,012h	; af99
	defb 0b1h,004h,028h,0b8h,002h,042h	; af9f
	defb 0b1h,022h,010h,0bch,008h,072h	; afa5
	defb 0b1h,022h,010h,0c0h,008h,0f2h	; afab
	defb 0b1h	; afb1

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_f0: 8 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 0 de la lista fichas_p53BB; lo leen p00:53BB (128 bytes)
;   0xafb2..0xb032  (128 bytes)
DATA_fichas_p53BB_f0:
	defb 000h,000h,000h,000h,000h,000h,003h,000h,00ch,003h,008h,007h,013h,00ch,011h,00eh	; afb2  ................
	defb 000h,000h,000h,000h,000h,000h,0c0h,000h,030h,0c0h,010h,0e0h,0c8h,030h,0c8h,070h	; afc2  ........0....0.p
	defb 000h,000h,000h,000h,003h,000h,00ch,003h,018h,007h,016h,009h,026h,019h,026h,01bh	; afd2  ............&.&.
	defb 000h,000h,000h,000h,0c0h,000h,030h,0c0h,018h,0e0h,068h,090h,064h,098h,064h,0b8h	; afe2  ......0...h.d.d.
	defb 000h,000h,007h,000h,01ch,003h,030h,00fh,026h,019h,06eh,011h,047h,03ch,043h,03eh	; aff2  ......0.&.n.G<C>
	defb 000h,000h,0e0h,000h,038h,0c0h,00ch,0f0h,064h,098h,076h,098h,0e2h,03ch,0c2h,07ch	; b002  ....8...d.v..<.|
	defb 007h,000h,01ch,003h,030h,00fh,061h,01eh,041h,03eh,0c3h,03ch,09eh,061h,088h,07fh	; b012  ....0.a.A>.<.a..
	defb 0e0h,000h,038h,0c0h,00ch,0f0h,086h,0f8h,082h,0fch,043h,0fch,079h,08eh,011h,0feh	; b022  ..8.......C.y...

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_f1: 8 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 1 de la lista fichas_p53BB; lo leen p00:53BB (128 bytes)
;   0xb032..0xb0b2  (128 bytes)
DATA_fichas_p53BB_f1:
	defb 011h,00eh,013h,00ch,009h,007h,00ch,003h,003h,000h,000h,000h,000h,000h,000h,000h	; b032  ................
	defb 0c8h,070h,0c8h,030h,090h,0e0h,030h,0c0h,0c0h,000h,000h,000h,000h,000h,000h,000h	; b042  .p.0..0.........
	defb 027h,019h,023h,01ch,011h,00eh,019h,007h,00ch,003h,003h,000h,000h,000h,000h,000h	; b052  '.#.............
	defb 0e4h,038h,0c4h,078h,0c8h,070h,098h,0e0h,030h,0c0h,0c0h,000h,000h,000h,000h,000h	; b062  .8.x.p..0.......
	defb 043h,03ch,047h,039h,06eh,013h,026h,01bh,030h,00fh,01ch,003h,007h,000h,000h,000h	; b072  C<G9n.&.0.......
	defb 0c2h,07ch,0e2h,03ch,076h,098h,064h,0b8h,00ch,0f0h,038h,0c0h,0e0h,000h,000h,000h	; b082  .|.<v.d...8.....
	defb 086h,07dh,086h,079h,0cdh,033h,04ah,037h,06ch,017h,030h,00fh,01ch,003h,007h,000h	; b092  .}.y.3J7l.0.....
	defb 021h,0feh,0e1h,03eh,073h,09ch,032h,0dch,016h,0f8h,00ch,0f0h,038h,0c0h,0e0h,000h	; b0a2  !..>s.2.....8...

; ----------------------------------------------------------------------
; DATOS resto_B0B2: SIN LECTOR A LA VISTA: ningun inmediato de 16 bits lo
;   apunta con el banco puesto; lo leen nadie (32 bytes)
;   0xb0b2..0xb0d2  (32 bytes)
DATA_resto_B0B2:
	defb 000h,00dh,000h,000h,000h,00dh,000h,000h,000h,0ddh,0d0h,000h,0ddh,0ddh,0ddh,0d0h	; b0b2  ................
	defb 000h,0ddh,0d0h,000h,000h,00dh,000h,000h,000h,00dh,000h,000h,000h,000h,000h,000h	; b0c2  ................

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_f2: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 2 de la lista fichas_p53BB; lo leen p00:53BB (32 bytes)
;   0xb0d2..0xb0f2  (32 bytes)
DATA_fichas_p53BB_f2:
	defb 000h,001h,000h,001h,001h,002h,001h,002h,003h,004h,003h,004h,003h,00ch,007h,008h	; b0d2  ................
	defb 000h,080h,000h,080h,000h,0c0h,000h,0c0h,040h,0a0h,040h,0a0h,000h,0f0h,000h,0f0h	; b0e2  ........@.@.....

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_f3: 2 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 3 de la lista fichas_p53BB; lo leen p00:53BB (32 bytes)
;   0xb0f2..0xb112  (32 bytes)
DATA_fichas_p53BB_f3:
	defb 007h,018h,007h,018h,00eh,031h,01eh,021h,01eh,061h,027h,078h,01fh,01eh,003h,003h	; b0f2  .....1.!.a'x....
	defb 000h,0f8h,040h,0b8h,010h,0fch,058h,0bch,0fch,09eh,0feh,0beh,0f8h,0f8h,0c0h,0c0h	; b102  ..@...X.........

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_f4: 2 fichas de 8x8 a 3 bit(s) por punto (24 bytes cada
;   una), entrada 4 de la lista fichas_p53BB; lo leen p00:53BB (48 bytes)
;   0xb112..0xb142  (48 bytes)
DATA_fichas_p53BB_f4:
	defb 0feh,0f9h,0f8h,0f8h,0e0h,0e7h,0e0h,0c0h,0dfh,0c8h,080h,0b7h,0c1h,080h,0bfh,091h,000h,06fh,0b1h,000h,04fh,0b3h,000h,04fh	; b112  .................o..O..O
	defb 09fh,07fh,01fh,007h,01fh,0e7h,003h,007h,0fbh,0e1h,003h,0fdh,0e9h,01bh,0f5h,0a8h,019h,0f6h,0c8h,039h,0f6h,010h,0f1h,0eeh	; b12a  ...................9....

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_f5: 2 fichas de 8x8 a 3 bit(s) por punto (24 bytes cada
;   una), entrada 5 de la lista fichas_p53BB; lo leen p00:53BB (48 bytes)
;   0xb142..0xb172  (48 bytes)
DATA_fichas_p53BB_f5:
	defb 0a6h,011h,04fh,0adh,013h,04eh,09bh,006h,07dh,0c7h,08dh,0bah,0cch,080h,0b3h,0e0h,0c3h,0dch,0e0h,0f8h,0e7h,0f8h,0ffh,0f8h	; b142  ..O..N..}...............
	defb 0e0h,0e1h,01eh,000h,001h,0feh,080h,081h,07eh,001h,003h,0fdh,001h,013h,0edh,003h,0c7h,03bh,007h,01fh,0e7h,01fh,0ffh,01fh	; b15a  ........~...............

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_f6: 8 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 6 de la lista fichas_p53BB; lo leen p00:53BB (128 bytes)
;   0xb172..0xb1f2  (128 bytes)
DATA_fichas_p53BB_f6:
	defb 07fh,080h,0ffh,07fh,0c1h,040h,0dfh,040h,0dfh,05eh,0cfh,040h,0cfh,049h,0c7h,040h	; b172  .....@.@.^.@.I.@
	defb 0ffh,001h,0fch,0ffh,0deh,04fh,0fah,007h,0feh,07fh,0f6h,00fh,0eeh,09fh,0eeh,01fh	; b182  .....O..........
	defb 07fh,080h,0ffh,07fh,0c3h,040h,0c3h,040h,0ffh,048h,0ffh,079h,0cfh,040h,0ffh,049h	; b192  .....@.@.H.y.@.I
	defb 0ffh,001h,0fch,0ffh,0ceh,04fh,0feh,0dfh,0feh,013h,0f2h,09fh,0feh,00fh,0feh,093h	; b1a2  .....O..........
	defb 07fh,080h,0ffh,07fh,0c1h,040h,0c1h,040h,0ffh,040h,0ffh,07fh,0cfh,040h,0cfh,041h	; b1b2  .....@.@.@...@.A
	defb 0ffh,001h,0fch,0ffh,0ceh,04fh,0ceh,047h,0feh,003h,0f2h,0dfh,0f6h,00fh,0f6h,08fh	; b1c2  .....O.G........
	defb 07fh,080h,0ffh,07fh,0d8h,048h,0dfh,044h,0ffh,040h,0ffh,064h,0ffh,04dh,0ffh,061h	; b1d2  .....H.D.@.d.M.a
	defb 0ffh,001h,0fch,0ffh,00eh,00fh,09eh,097h,0feh,003h,0fah,0b7h,0f6h,0afh,07eh,003h	; b1e2  ..............~.

; ----------------------------------------------------------------------
; DATOS fichas_p53BB_f7: 8 fichas de 8x8 a 2 bit(s) por punto (16 bytes cada
;   una), entrada 7 de la lista fichas_p53BB; lo leen p00:53BB (128 bytes)
;   0xb1f2..0xb272  (128 bytes)
DATA_fichas_p53BB_f7:
	defb 0cfh,043h,0cfh,049h,0ffh,040h,0ffh,073h,0cfh,040h,0ffh,073h,0ffh,07fh,000h,0ffh	; b1f2  .C.I.@.s.@.s....
	defb 0feh,0cfh,0feh,097h,0feh,003h,0f2h,0cfh,0f6h,00fh,0f6h,0cfh,0fch,0ffh,001h,0ffh	; b202  ................
	defb 0ffh,078h,0ffh,042h,0ffh,078h,0cfh,042h,0dfh,044h,0ffh,05eh,0ffh,07fh,000h,0ffh	; b212  .x.B.x.B.D.^....
	defb 0f2h,01fh,0feh,043h,0f2h,01fh,0feh,04fh,0deh,063h,0eah,077h,0f4h,0ffh,001h,0ffh	; b222  ...C...O.c.w....
	defb 0cfh,048h,0cfh,041h,0ffh,043h,0ffh,078h,0dfh,040h,0ffh,073h,0ffh,07fh,000h,0ffh	; b232  .H.A.C.x.@.s....
	defb 0feh,01fh,0feh,067h,0f6h,00fh,0eeh,01fh,0feh,083h,0dah,0e7h,0e4h,0ffh,001h,0ffh	; b242  ...g............
	defb 0dfh,052h,0ffh,049h,0ffh,069h,0ffh,069h,0ffh,049h,0ffh,04ch,0ffh,07fh,000h,0ffh	; b252  .R.I.i.i.I.L....
	defb 0ceh,033h,0f2h,0ffh,0feh,023h,0e6h,0bbh,0fah,0e7h,0feh,003h,0fch,0ffh,001h,0ffh	; b262  .3...#..........

; ----------------------------------------------------------------------
; DATOS fichas_por_fase: 4 palabras: las 4 fichas de 2 bits de cada fase de la
;   ruina (p00:5346: 0xC211 - (ruina * 5 + 1)); lo leen p00:5321 (8 bytes)
;   0xb272..0xb27a  (8 bytes)
DATA_fichas_por_fase:
	defb 07ah,0b2h	; b272
	defb 03ah,0b3h	; b274
	defb 0fah,0b2h	; b276
	defb 0bah,0b2h	; b278

; ----------------------------------------------------------------------
; DATOS fichas_de_fase: 4 x 64 bytes: dos pares de fichas de 2 bits que
;   p00:5332 y p00:5340 cargan en 0xC818 y 0xCC18; lo leen p00:5321 (256
;   bytes)
;   0xb27a..0xb37a  (256 bytes)
DATA_fichas_de_fase:
	defb 0ffh,0ffh,0e1h,0ffh,0deh,0feh,0a0h,0e0h,0bfh,0feh,0b0h,0f0h,09bh,0f9h,099h,0f8h	; b27a  ................
	defb 0ffh,0ffh,087h,0ffh,06bh,06fh,08dh,007h,0fdh,07fh,05dh,00fh,0ddh,09fh,0f9h,01fh	; b28a  ....ko....].....
	defb 097h,0f3h,0bbh,0f9h,081h,0c0h,0b7h,0f3h,0b1h,0f0h,097h,0f3h,0dfh,0ffh,0e0h,0ffh	; b29a  ................
	defb 0d9h,0cfh,0b5h,097h,001h,003h,0ddh,0cfh,0f9h,00fh,0d9h,0cfh,07bh,0ffh,007h,0ffh	; b2aa  ............{...
	defb 0ffh,0ffh,0e3h,0ffh,0c4h,0fch,095h,0fch,0a8h,0e8h,0bbh,0f9h,0b2h,0f0h,09bh,0c9h	; b2ba  ................
	defb 0ffh,0ffh,087h,0ffh,063h,07fh,0d9h,0dfh,015h,017h,0b9h,09fh,03dh,00fh,0b5h,093h	; b2ca  ....c.......=...
	defb 0b9h,0f8h,086h,0c2h,0bah,0f8h,096h,0f2h,0ach,0e4h,09eh,0deh,0fbh,0ffh,0e0h,0ffh	; b2da  ................
	defb 07dh,01fh,061h,043h,0ddh,01fh,0edh,04fh,0f1h,063h,0fdh,077h,0dbh,0ffh,007h,0ffh	; b2ea  }.aC...O.c.w....
	defb 0ffh,0ffh,0e1h,0ffh,0c2h,0feh,0beh,0feh,080h,0c0h,0bfh,0ffh,0b0h,0f0h,093h,0f1h	; b2fa  ................
	defb 0ffh,0ffh,087h,0ffh,04bh,07fh,0f5h,077h,08dh,003h,0ddh,0dfh,00dh,00fh,0e9h,08fh	; b30a  ....K..w........
	defb 089h,0f8h,0b3h,0f1h,08fh,0c3h,0b8h,0f8h,0a7h,0e0h,09fh,0f3h,0deh,0ffh,0e0h,0ffh	; b31a  ................
	defb 019h,01fh,065h,067h,01dh,00fh,0bdh,01fh,0e3h,083h,0fdh,0e7h,03bh,0ffh,007h,0ffh	; b32a  ..eg............
	defb 0ffh,0ffh,0e0h,0ffh,0cah,0efh,0a5h,0e5h,08fh,0c0h,0afh,0e4h,08fh,0cdh,0afh,0e1h	; b33a  ................
	defb 0ffh,0ffh,007h,0ffh,00bh,0ffh,0f5h,0f7h,00bh,003h,0fdh,0b7h,0adh,0afh,0edh,0cfh	; b34a  ................
	defb 0b7h,0f2h,0afh,0cdh,0bbh,0fbh,0abh,0e9h,09fh,0c9h,0beh,0dch,0d3h,0ffh,0e0h,0ffh	; b35a  ................
	defb 0e1h,023h,07dh,07bh,0b5h,037h,0f9h,0b3h,0edh,0ebh,005h,007h,0fbh,0ffh,007h,0ffh	; b36a  .#}{.7..........

; ----------------------------------------------------------------------
; DATOS caracteres_p5143: 44 caracteres de 1 bit (p00:5146, L_4CBF con B =
;   0x2C); se solapan 2 bloques: (por_fase_b4d2 B4D2-B536); lo leen p00:5143,
;   p02:8F70 (444 bytes)
;   0xb37a..0xb536  (444 bytes)
DATA_caracteres_p5143:
	defb 010h,010h,0feh,082h,082h,002h,004h,038h	; b37a  .......8
	defb 000h,060h,012h,0c2h,022h,002h,004h,0f8h	; b382  .`.."...
	defb 000h,000h,020h,01fh,072h,00ch,008h,004h	; b38a  .. .r...
	defb 000h,07eh,002h,004h,008h,018h,024h,0c3h	; b392  .~....$.
	defb 000h,000h,03ch,056h,092h,0a2h,0a2h,044h	; b39a  ..<V...D
	defb 028h,0c4h,040h,0eah,04ah,0eah,0e4h,04bh	; b3a2  (.@.J..K
	defb 008h,07fh,041h,03eh,088h,0beh,009h,07fh	; b3aa  ..A>....
	defb 000h,002h,04fh,042h,042h,047h,04ah,024h	; b3b2  ..OBBGJ$
	defb 000h,000h,000h,000h,000h,000h,020h,010h	; b3ba  ...... .
	defb 03eh,020h,03ch,020h,0ffh,052h,05ch,063h	; b3c2  > < .R\c
	defb 000h,000h,040h,042h,041h,041h,050h,020h	; b3ca  ..@BAAP
	defb 07fh,052h,07fh,05ah,044h,056h,054h,0bfh	; b3d2  .R.ZDVT.
	defb 008h,07fh,049h,07fh,008h,038h,01ch,063h	; b3da  ..I..8.c
	defb 008h,07fh,049h,049h,07fh,008h,008h,008h	; b3e2  ..II....
	defb 001h,000h,00fh,074h,008h,008h,008h,006h	; b3ea  ...t....
	defb 040h,0a0h,000h,000h,000h,000h,020h,010h	; b3f2  @..... .
	defb 000h,006h,00ah,012h,022h,07fh,002h,002h	; b3fa  ...."...
	defb 000h,000h,00eh,071h,001h,001h,002h,01ch	; b402  ...q....
	defb 000h,000h,047h,048h,040h,040h,048h,027h	; b40a  ..GH@@H'
	defb 00ch,022h,022h,041h,0beh,012h,012h,024h	; b412  .""A...$
	defb 079h,035h,055h,055h,0a8h,07fh,036h,06fh	; b41a  y5UU..6o
	defb 000h,040h,020h,020h,021h,021h,022h,01ch	; b422  .@  !!".
	defb 000h,028h,073h,024h,020h,020h,028h,047h	; b42a  .(s$  (G
	defb 000h,000h,000h,000h,000h,010h,028h,010h	; b432  ......(.
	defb 044h,05fh,094h,05fh,059h,0d6h,056h,059h	; b43a  D_._Y.VY
	defb 000h,008h,024h,020h,05eh,061h,001h,03eh	; b442  ..$ ^a.>
	defb 000h,002h,04fh,042h,042h,047h,04ah,024h	; b44a  ..OBBGJ$
	defb 004h,02ah,014h,00fh,078h,010h,010h,00eh	; b452  .*..x...
	defb 000h,010h,07ch,030h,01ch,038h,040h,03ch	; b45a  ..|0.8@<
	defb 014h,0feh,012h,0f4h,038h,054h,0b3h,010h	; b462  ....8T..
	defb 000h,004h,02eh,035h,069h,069h,051h,02ah	; b46a  ...5iiQ*
	defb 000h,000h,00fh,074h,008h,008h,008h,006h	; b472  ...t....
	defb 000h,050h,050h,050h,051h,051h,052h,09ch	; b47a  .PPPQQR.
	defb 000h,03eh,022h,042h,002h,004h,008h,070h	; b482  .>"B...p
	defb 000h,000h,000h,000h,030h,030h,000h,000h	; b48a  ....00..
	defb 000h,0fch,082h,082h,082h,082h,082h,0feh	; b492  ........
	defb 000h,000h,000h,000h,07eh,000h,000h,000h	; b49a  ....~...
	defb 042h,045h,042h,078h,044h,042h,040h,040h	; b4a2  BEBxDB@@
	defb 000h,000h,030h,048h,044h,042h,081h,000h	; b4aa  ..0HDB..
	defb 040h,020h,022h,03ch,020h,040h,040h,03eh	; b4b2  @ "< @@>
	defb 044h,027h,0f5h,02ah,066h,095h,026h,044h	; b4ba  D'.*f.&D
	defb 002h,09fh,008h,008h,088h,008h,089h,05fh	; b4c2  ......._
	defb 000h,0c0h,080h,086h,099h,081h,001h,0c6h	; b4ca  ........
	defb 050h,000h,010h,000h,050h,000h,010h,000h	; b4d2  P...P...
	defb 010h,000h,040h,0f0h,050h,000h,010h,0f0h	; b4da  ..@.P...
	defb 000h,000h,000h,000h,050h,000h,010h,000h	; b4e2  ....P...
	defb 010h,0f0h,010h,000h,010h,000h,070h,000h	; b4ea  ......p.
	defb 050h,000h,010h,0f0h,000h,000h,000h,000h	; b4f2  P.......
	defb 070h,000h,030h,000h,050h,000h,030h,0f0h	; b4fa  p.0.P.0.
	defb 050h,000h,010h,000h,010h,000h,050h,000h	; b502  P.....P.
	defb 000h,000h,000h,000h,020h,000h,060h,000h	; b50a  .... .`.
	defb 050h,000h,010h,0f0h,050h,000h,090h,0f0h	; b512  P...P...
	defb 050h,000h,090h,000h,000h,000h,000h,000h	; b51a  P.......
	defb 050h,000h,010h,000h,050h,000h,010h,000h	; b522  P...P...
	defb 010h,000h,010h,0f0h,010h,000h,010h,0f0h	; b52a  ........
	defb 000h,000h,000h,000h	; b532

; ----------------------------------------------------------------------
; DATOS resto_B536: tablas cortas que apuntan p01:7F31 (0xB591); el tamano de
;   cada una sale del lector siguiente, no de recorrerla; lo leen p01:7F31 (93
;   bytes)
;   0xb536..0xb593  (93 bytes)
DATA_resto_B536:
	defb 018h,03bh,0ceh,018h,04bh,0ceh,018h,05bh,0ceh,018h,06bh,0ceh,018h,07bh,0ceh,0bah	; b536  ....K..[..k..{..
	defb 02bh,02ch,0ffh,018h,03bh,040h,067h,03bh,040h,0bah,02bh,050h,0e5h,02bh,050h,04fh	; b546  +,...@g.@.+P.+PO
	defb 08ch,00fh,0ffh,0c0h,030h,03ch,02bh,03eh,02fh,0feh,02ch,08fh,02dh,039h,033h,038h	; b556  ....0<+>/.,.-938
	defb 0feh,020h,040h,040h,033h,03eh,02bh,036h,033h,03eh,043h,0feh,020h,050h,03dh,03ah	; b566  . @@3>+63>C. P=:
	defb 02fh,02fh,02eh,0feh,020h,060h,034h,03fh,037h,03ah,0feh,020h,070h,03dh,03eh,03ch	; b576  //.. `4?7:. p=><
	defb 02fh,038h,031h,03eh,032h,0feh,08ch,08fh,03ch,02fh,03dh,03eh,0ffh	; b586  /81>2...</=>.

; ----------------------------------------------------------------------
; DATOS por_fase_B591: 25 palabras: la lista de cada fase 1-25 (p01:7F1F,
;   indice 0xC211); lo leen p01:7F1F (50 bytes)
;   0xb593..0xb5c5  (50 bytes)
DATA_por_fase_B591:
	defb 002h,0b6h	; b593
	defb 002h,0b6h	; b595
	defb 002h,0b6h	; b597
	defb 0c5h,0b5h	; b599
	defb 002h,0b6h	; b59b
	defb 002h,0b6h	; b59d
	defb 0c9h,0b5h	; b59f
	defb 002h,0b6h	; b5a1
	defb 002h,0b6h	; b5a3
	defb 002h,0b6h	; b5a5
	defb 0cdh,0b5h	; b5a7
	defb 0d1h,0b5h	; b5a9
	defb 0d5h,0b5h	; b5ab
	defb 0d9h,0b5h	; b5ad
	defb 002h,0b6h	; b5af
	defb 0e0h,0b5h	; b5b1
	defb 0e4h,0b5h	; b5b3
	defb 002h,0b6h	; b5b5
	defb 0ebh,0b5h	; b5b7
	defb 002h,0b6h	; b5b9
	defb 0efh,0b5h	; b5bb
	defb 0f3h,0b5h	; b5bd
	defb 0f7h,0b5h	; b5bf
	defb 0fbh,0b5h	; b5c1
	defb 002h,0b6h	; b5c3

; ----------------------------------------------------------------------
; DATOS lista_B5C5: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (4 bytes)
;   0xb5c5..0xb5c9  (4 bytes)
DATA_lista_B5C5:
	defb 005h,08bh,007h	; b5c5
	defb 0ffh	; b5c8

; ----------------------------------------------------------------------
; DATOS lista_B5C9: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (4 bytes)
;   0xb5c9..0xb5cd  (4 bytes)
DATA_lista_B5C9:
	defb 005h,037h,00dh	; b5c9
	defb 0ffh	; b5cc

; ----------------------------------------------------------------------
; DATOS lista_B5CD: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (4 bytes)
;   0xb5cd..0xb5d1  (4 bytes)
DATA_lista_B5CD:
	defb 005h,074h,003h	; b5cd
	defb 0ffh	; b5d0

; ----------------------------------------------------------------------
; DATOS lista_B5D1: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (4 bytes)
;   0xb5d1..0xb5d5  (4 bytes)
DATA_lista_B5D1:
	defb 007h,06ah,028h	; b5d1
	defb 0ffh	; b5d4

; ----------------------------------------------------------------------
; DATOS lista_B5D5: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (4 bytes)
;   0xb5d5..0xb5d9  (4 bytes)
DATA_lista_B5D5:
	defb 00ah,041h,005h	; b5d5
	defb 0ffh	; b5d8

; ----------------------------------------------------------------------
; DATOS lista_B5D9: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (7 bytes)
;   0xb5d9..0xb5e0  (7 bytes)
DATA_lista_B5D9:
	defb 007h,08dh,00ch	; b5d9
	defb 008h,05dh,008h	; b5dc
	defb 0ffh	; b5df

; ----------------------------------------------------------------------
; DATOS lista_B5E0: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (4 bytes)
;   0xb5e0..0xb5e4  (4 bytes)
DATA_lista_B5E0:
	defb 007h,069h,004h	; b5e0
	defb 0ffh	; b5e3

; ----------------------------------------------------------------------
; DATOS lista_B5E4: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (7 bytes)
;   0xb5e4..0xb5eb  (7 bytes)
DATA_lista_B5E4:
	defb 001h,068h,003h	; b5e4
	defb 003h,068h,006h	; b5e7
	defb 0ffh	; b5ea

; ----------------------------------------------------------------------
; DATOS lista_B5EB: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (4 bytes)
;   0xb5eb..0xb5ef  (4 bytes)
DATA_lista_B5EB:
	defb 008h,073h,00ah	; b5eb
	defb 0ffh	; b5ee

; ----------------------------------------------------------------------
; DATOS lista_B5EF: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (4 bytes)
;   0xb5ef..0xb5f3  (4 bytes)
DATA_lista_B5EF:
	defb 009h,078h,00eh	; b5ef
	defb 0ffh	; b5f2

; ----------------------------------------------------------------------
; DATOS lista_B5F3: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (4 bytes)
;   0xb5f3..0xb5f7  (4 bytes)
DATA_lista_B5F3:
	defb 00ch,032h,00ah	; b5f3
	defb 0ffh	; b5f6

; ----------------------------------------------------------------------
; DATOS lista_B5F7: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (4 bytes)
;   0xb5f7..0xb5fb  (4 bytes)
DATA_lista_B5F7:
	defb 00ch,067h,006h	; b5f7
	defb 0ffh	; b5fa

; ----------------------------------------------------------------------
; DATOS lista_B5FB: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (7 bytes)
;   0xb5fb..0xb602  (7 bytes)
DATA_lista_B5FB:
	defb 002h,05dh,00ah	; b5fb
	defb 004h,032h,04ch	; b5fe
	defb 0ffh	; b601

; ----------------------------------------------------------------------
; DATOS lista_B602: 3 bytes [pantalla][YX][YX] a 0xD180 hasta 0xFF; lo leen
;   p01:7F1F (1 bytes)
;   0xb602..0xb603  (1 bytes)
DATA_lista_B602:
	defb 0ffh	; b602

; ----------------------------------------------------------------------
; DATOS textos_por_ruina: 5 palabras: el texto a maquina de cada ruina
;   (p02:801E); lo leen p02:801E (10 bytes)
;   0xb603..0xb60d  (10 bytes)
DATA_textos_por_ruina:
	defb 00dh,0b6h	; b603
	defb 03bh,0b6h	; b605
	defb 083h,0b6h	; b607
	defb 0c8h,0b6h	; b609
	defb 0feh,0b6h	; b60b

; ----------------------------------------------------------------------
; DATOS maquina_B60D: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (46 bytes)
;   0xb60d..0xb63b  (46 bytes)
DATA_maquina_B60D:
	defb 022h,0a8h,054h,04eh,020h,058h,07bh,06ah,0fdh,05dh,076h,058h,07bh,077h,05bh,047h	; b60d  ".TN X{j.]vX{w[G
	defb 0feh,051h,059h,05dh,04ah,056h,04fh,058h,07bh,05dh,049h,0feh,058h,07bh,072h,04eh	; b61d  .QY]JVOX{]I.X{rN
	defb 07bh,053h,04fh,05eh,0fdh,04ah,050h,04eh,020h,04fh,06ah,06eh,04bh,0ffh	; b62d  {SO^.JPN OjnK.

; ----------------------------------------------------------------------
; DATOS maquina_B63B: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (72 bytes)
;   0xb63b..0xb683  (72 bytes)
DATA_maquina_B63B:
	defb 06ch,077h,058h,07dh,047h,090h,091h,092h,093h,061h,0fdh,0a3h,0a4h,075h,0fdh,05bh	; b63b  lwX}G....a...u.[
	defb 05eh,04ah,072h,058h,057h,07bh,0feh,05bh,07bh,06bh,041h,033h,03eh,07eh,052h,072h	; b64b  ^JrXW{.[{kA3>~Rr
	defb 062h,0fdh,025h,052h,020h,05dh,051h,072h,062h,07bh,0fdh,058h,07bh,06ah,05dh,076h	; b65b  b.%R ]Qrb{.X{j]v
	defb 058h,07bh,073h,048h,0feh,04ch,07dh,077h,047h,020h,049h,05ch,024h,052h,06bh,0fdh	; b66b  X{sH.L}wG I\$Rk.
	defb 049h,071h,061h,04eh,06eh,07dh,047h,0ffh	; b67b  IqaNn}G.

; ----------------------------------------------------------------------
; DATOS maquina_B683: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (69 bytes)
;   0xb683..0xb6c8  (69 bytes)
DATA_maquina_B683:
	defb 050h,076h,07eh,050h,076h,07eh,0fdh,052h,061h,04ah,056h,04fh,062h,04dh,076h,05dh	; b683  Pv~Pv~.RaJVObMv]
	defb 061h,0fdh,05eh,04dh,04ah,04eh,07bh,055h,071h,057h,07bh,0feh,058h,07bh,072h,06bh	; b693  a.^MJN{UqW{.X{rk
	defb 04ah,05dh,04ah,056h,07bh,0fdh,065h,076h,05dh,052h,05ch,04ah,04bh,05dh,06eh,0feh	; b6a3  J]JV{.ev]R\JK]n.
	defb 04ah,06ch,077h,020h,056h,07bh,077h,058h,04ah,0fdh,05ch,07bh,077h,04eh,05eh,020h	; b6b3  Jlw V{wXJ.\{wN^
	defb 04ah,071h,047h,047h,0ffh	; b6c3

; ----------------------------------------------------------------------
; DATOS maquina_B6C8: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (54 bytes)
;   0xb6c8..0xb6fe  (54 bytes)
DATA_maquina_B6C8:
	defb 06bh,07dh,04ah,06ch,058h,07bh,052h,076h,05dh,0fdh,058h,076h,051h,076h,020h,06ch	; b6c8  k}JlX{Rv].XvQv l
	defb 06ah,06eh,04bh,07eh,0feh,049h,05ch,023h,052h,058h,07bh,056h,07bh,0fdh,057h,076h	; b6d8  jnK~.I\#RX{V{.Wv
	defb 05dh,052h,05ch,020h,04ah,04bh,05dh,06eh,0fdh,04ah,050h,057h,07bh,047h,0feh,074h	; b6e8  ]R\ JK]n.JPW{G.t
	defb 04eh,077h,058h,06eh,07eh,0ffh	; b6f8

; ----------------------------------------------------------------------
; DATOS maquina_B6FE: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (62 bytes)
;   0xb6fe..0xb73c  (62 bytes)
DATA_maquina_B6FE:
	defb 052h,052h,04eh,07bh,053h,04ah,052h,07bh,061h,0fdh,04ah,056h,04fh,058h,07bh,047h	; b6fe  RRN{SJR{a.JVOX{G
	defb 0feh,052h,052h,05eh,020h,061h,052h,070h,061h,0fdh,022h,052h,04eh,07bh,049h,071h	; b70e  .RR^ aRpa."RN{Iq
	defb 076h,058h,07bh,05dh,0feh,04ah,077h,058h,04ah,020h,05ch,07bh,076h,05dh,0fdh,04ah	; b71e  vX{].JwXJ \{v].J
	defb 04ah,052h,05ch,04eh,07bh,0fdh,0a6h,052h,071h,061h,04eh,05dh,048h,0ffh	; b72e  JR\N{..RqaN]H.

; ----------------------------------------------------------------------
; DATOS estados_B73C: 4 palabras: el nombre de cada estado del personaje
;   (p02:81B2, hasta 0xFF); lo leen p02:8168 (8 bytes)
;   0xb73c..0xb744  (8 bytes)
DATA_estados_B73C:
	defb 05ch,0b7h	; b73c
	defb 07ch,0b7h	; b73e
	defb 071h,0b7h	; b740
	defb 066h,0b7h	; b742

; ----------------------------------------------------------------------
; DATOS estados_B744: 4 palabras: el nombre de cada estado del personaje
;   (p02:81B2, hasta 0xFF); lo leen p02:8168 (8 bytes)
;   0xb744..0xb74c  (8 bytes)
DATA_estados_B744:
	defb 084h,0b7h	; b744
	defb 0a2h,0b7h	; b746
	defb 098h,0b7h	; b748
	defb 08eh,0b7h	; b74a

; ----------------------------------------------------------------------
; DATOS estados_B74C: 4 palabras: el nombre de cada estado del personaje
;   (p02:81B2, hasta 0xFF); lo leen p02:8168 (8 bytes)
;   0xb74c..0xb754  (8 bytes)
DATA_estados_B74C:
	defb 0aah,0b7h	; b74c
	defb 0c0h,0b7h	; b74e
	defb 0b9h,0b7h	; b750
	defb 0b1h,0b7h	; b752

; ----------------------------------------------------------------------
; DATOS estados_B754: 4 palabras: el nombre de cada estado del personaje
;   (p02:81B2, hasta 0xFF); lo leen p02:8168 (8 bytes)
;   0xb754..0xb75c  (8 bytes)
DATA_estados_B754:
	defb 084h,0b7h	; b754
	defb 0a2h,0b7h	; b756
	defb 0d1h,0b7h	; b758
	defb 0c8h,0b7h	; b75a

; ----------------------------------------------------------------------
; DATOS estado_B75C: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (10 bytes)
;   0xb75c..0xb766  (10 bytes)
DATA_estado_B75C:
	defb 04ah,077h,05bh,050h,071h,056h,07bh,07dh,047h,0ffh	; b75c  Jw[PqV{}G.

; ----------------------------------------------------------------------
; DATOS estado_B766: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (11 bytes)
;   0xb766..0xb771  (11 bytes)
DATA_estado_B766:
	defb 04ah,04fh,078h,049h,04ah,04ah,076h,058h,07bh,073h,0ffh	; b766  JOxIJJvX{s.

; ----------------------------------------------------------------------
; DATOS estado_B771: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (11 bytes)
;   0xb771..0xb77c  (11 bytes)
DATA_estado_B771:
	defb 066h,060h,062h,020h,063h,073h,077h,05bh,050h,072h,0ffh	; b771  f`b csw[Pr.

; ----------------------------------------------------------------------
; DATOS estado_B77C: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (8 bytes)
;   0xb77c..0xb784  (8 bytes)
DATA_estado_B77C:
	defb 067h,04eh,056h,05dh,053h,07dh,04ah,0ffh	; b77c  gNV]S}J.

; ----------------------------------------------------------------------
; DATOS estado_B784: nombre de estado, caracteres hasta 0xFF (p02:81B6); se
;   solapan 2 bloques: (estado_B784 B784-B78E); lo leen p02:8168 (10 bytes)
;   0xb784..0xb78e  (10 bytes)
DATA_estado_B784:
	defb 04ah,077h,05bh,06fh,077h,053h,07dh,04ah,047h,0ffh	; b784  Jw[owS}JG.

; ----------------------------------------------------------------------
; DATOS estado_B78E: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (10 bytes)
;   0xb78e..0xb798  (10 bytes)
DATA_estado_B78E:
	defb 062h,06eh,020h,04ah,04eh,076h,04eh,04ah,047h,0ffh	; b78e  bn JNvNJG.

; ----------------------------------------------------------------------
; DATOS estado_B798: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (10 bytes)
;   0xb798..0xb7a2  (10 bytes)
DATA_estado_B798:
	defb 06bh,04bh,020h,04eh,04ch,070h,05bh,07dh,05dh,0ffh	; b798  kK NLp[}].

; ----------------------------------------------------------------------
; DATOS estado_B7A2: nombre de estado, caracteres hasta 0xFF (p02:81B6); se
;   solapan 2 bloques: (estado_B7A2 B7A2-B7AA); lo leen p02:8168 (8 bytes)
;   0xb7a2..0xb7aa  (8 bytes)
DATA_estado_B7A2:
	defb 04eh,07bh,076h,062h,07bh,072h,06eh,0ffh	; b7a2  N{vb{rn.

; ----------------------------------------------------------------------
; DATOS estado_B7AA: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (7 bytes)
;   0xb7aa..0xb7b1  (7 bytes)
DATA_estado_B7AA:
	defb 074h,050h,047h,074h,050h,047h,0ffh	; b7aa

; ----------------------------------------------------------------------
; DATOS estado_B7B1: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (8 bytes)
;   0xb7b1..0xb7b9  (8 bytes)
DATA_estado_B7B1:
	defb 04ah,077h,05bh,050h,071h,020h,047h,0ffh	; b7b1  Jw[Pq G.

; ----------------------------------------------------------------------
; DATOS estado_B7B9: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (7 bytes)
;   0xb7b9..0xb7c0  (7 bytes)
DATA_estado_B7B9:
	defb 052h,074h,04ah,05dh,049h,07dh,0ffh	; b7b9

; ----------------------------------------------------------------------
; DATOS estado_B7C0: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (8 bytes)
;   0xb7c0..0xb7c8  (8 bytes)
DATA_estado_B7C0:
	defb 067h,04eh,056h,05ch,04ah,05bh,047h,0ffh	; b7c0  gNV\J[G.

; ----------------------------------------------------------------------
; DATOS estado_B7C8: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (9 bytes)
;   0xb7c8..0xb7d1  (9 bytes)
DATA_estado_B7C8:
	defb 062h,06ch,050h,020h,04ah,051h,06eh,047h,0ffh	; b7c8  blP JQnG.

; ----------------------------------------------------------------------
; DATOS estado_B7D1: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (11 bytes)
;   0xb7d1..0xb7dc  (11 bytes)
DATA_estado_B7D1:
	defb 062h,06ch,050h,04eh,04ch,077h,05bh,052h,04ah,06eh,0ffh	; b7d1  blPNLw[RJn.

; ----------------------------------------------------------------------
; DATOS textos_B7DC: 8 palabras: el texto a maquina segun el estado del
;   personaje (+4 si 0xC208 no coincide); lo leen p02:8136 (16 bytes)
;   0xb7dc..0xb7ec  (16 bytes)
DATA_textos_B7DC:
	defb 0fch,0b7h	; b7dc
	defb 005h,0b8h	; b7de
	defb 010h,0b8h	; b7e0
	defb 01ah,0b8h	; b7e2
	defb 03fh,0b8h	; b7e4
	defb 048h,0b8h	; b7e6
	defb 050h,0b8h	; b7e8
	defb 03fh,0b8h	; b7ea

; ----------------------------------------------------------------------
; DATOS textos_B7EC: 8 palabras: el texto a maquina segun el estado del
;   personaje (+4 si 0xC208 no coincide); lo leen p02:813E (16 bytes)
;   0xb7ec..0xb7fc  (16 bytes)
DATA_textos_B7EC:
	defb 0fch,0b7h	; b7ec
	defb 024h,0b8h	; b7ee
	defb 02fh,0b8h	; b7f0
	defb 037h,0b8h	; b7f2
	defb 03fh,0b8h	; b7f4
	defb 048h,0b8h	; b7f6
	defb 050h,0b8h	; b7f8
	defb 03fh,0b8h	; b7fa

; ----------------------------------------------------------------------
; DATOS maquina_B7FC: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (9 bytes)
;   0xb7fc..0xb805  (9 bytes)
DATA_maquina_B7FC:
	defb 05dh,076h,05ch,04eh,05dh,071h,053h,047h,0ffh	; b7fc  ]v\N]qSG.

; ----------------------------------------------------------------------
; DATOS maquina_B805: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (11 bytes)
;   0xb805..0xb810  (11 bytes)
DATA_maquina_B805:
	defb 05dh,053h,051h,060h,07dh,06ch,073h,07dh,058h,07bh,0ffh	; b805  ]SQ`}ls}X{.

; ----------------------------------------------------------------------
; DATOS maquina_B810: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (10 bytes)
;   0xb810..0xb81a  (10 bytes)
DATA_maquina_B810:
	defb 06ah,076h,05ch,07bh,050h,056h,07dh,05dh,049h,0ffh	; b810  jv\{PV}]I.

; ----------------------------------------------------------------------
; DATOS maquina_B81A: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (10 bytes)
;   0xb81a..0xb824  (10 bytes)
DATA_maquina_B81A:
	defb 04eh,058h,04fh,062h,04bh,05ah,056h,07bh,047h,0ffh	; b81a  NXObKZV{G.

; ----------------------------------------------------------------------
; DATOS maquina_B824: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (11 bytes)
;   0xb824..0xb82f  (11 bytes)
DATA_maquina_B824:
	defb 04fh,077h,05ch,058h,055h,051h,071h,04eh,06fh,05dh,0ffh	; b824  Ow\XUQqNo].

; ----------------------------------------------------------------------
; DATOS maquina_B82F: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (8 bytes)
;   0xb82f..0xb837  (8 bytes)
DATA_maquina_B82F:
	defb 053h,063h,07bh,054h,07dh,04ah,047h,0ffh	; b82f  Sc{T}JG.

; ----------------------------------------------------------------------
; DATOS maquina_B837: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (8 bytes)
;   0xb837..0xb83f  (8 bytes)
DATA_maquina_B837:
	defb 058h,06eh,070h,060h,07dh,061h,047h,0ffh	; b837  Xnp`}aG.

; ----------------------------------------------------------------------
; DATOS maquina_B83F: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (9 bytes)
;   0xb83f..0xb848  (9 bytes)
DATA_maquina_B83F:
	defb 04eh,07bh,076h,062h,07bh,071h,057h,07bh,0ffh	; b83f  N{vb{qW{.

; ----------------------------------------------------------------------
; DATOS maquina_B848: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (8 bytes)
;   0xb848..0xb850  (8 bytes)
DATA_maquina_B848:
	defb 04eh,07bh,076h,062h,07bh,073h,04bh,0ffh	; b848  N{vb{sK.

; ----------------------------------------------------------------------
; DATOS maquina_B850: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (8 bytes)
;   0xb850..0xb858  (8 bytes)
DATA_maquina_B850:
	defb 04eh,07bh,076h,062h,07bh,073h,07eh,0ffh	; b850  N{vb{s~.

; ----------------------------------------------------------------------
; DATOS cabecera_p81BD: 6 bytes que p02:81BD copia a 0xC8B0 antes del nombre
;   de estado (BIOS no japonesa); lo leen p02:81BD (6 bytes)
;   0xb858..0xb85e  (6 bytes)
DATA_cabecera_p81BD:
	defb 02ch,043h,02fh,047h,047h,0feh	; b858

; ----------------------------------------------------------------------
; DATOS estados_B85E: 4 palabras: el nombre de cada estado del personaje
;   (p02:81B2, hasta 0xFF); lo leen p02:8168 (8 bytes)
;   0xb85e..0xb866  (8 bytes)
DATA_estados_B85E:
	defb 066h,0b8h	; b85e
	defb 075h,0b8h	; b860
	defb 080h,0b8h	; b862
	defb 097h,0b8h	; b864

; ----------------------------------------------------------------------
; DATOS estado_B866: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (15 bytes)
;   0xb866..0xb875  (15 bytes)
DATA_estado_B866:
	defb 03eh,02bh,035h,02fh,020h,033h,03eh,0fdh,02fh,02bh,03dh,043h,047h,047h,0ffh	; b866  >+5/ 3>./+=CGG.

; ----------------------------------------------------------------------
; DATOS estado_B875: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (11 bytes)
;   0xb875..0xb880  (11 bytes)
DATA_estado_B875:
	defb 031h,039h,039h,02eh,020h,036h,03fh,02dh,035h,047h,0ffh	; b875  199. 6?-5G.

; ----------------------------------------------------------------------
; DATOS estado_B880: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (23 bytes)
;   0xb880..0xb897  (23 bytes)
DATA_estado_B880:
	defb 03eh,02bh,035h,02fh,020h,02dh,02bh,03ch,02fh,0fdh,039h,030h,0fdh,043h,039h,03fh	; b880  >+5/ -+</.90.C9?
	defb 03ch,03dh,02fh,036h,030h,047h,0ffh	; b890

; ----------------------------------------------------------------------
; DATOS estado_B897: nombre de estado, caracteres hasta 0xFF (p02:81B6); lo
;   leen p02:8168 (10 bytes)
;   0xb897..0xb8a1  (10 bytes)
DATA_estado_B897:
	defb 031h,039h,020h,02bh,032h,02fh,02bh,02eh,047h,0ffh	; b897  19 +2/+.G.

; ----------------------------------------------------------------------
; DATOS maquina_B8A1: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (14 bytes)
;   0xb8a1..0xb8af  (14 bytes)
DATA_maquina_B8A1:
	defb 041h,033h,036h,036h,020h,032h,02fh,036h,03ah,0fdh,043h,039h,03fh,0ffh	; b8a1  A366 2/6:.C9?.

; ----------------------------------------------------------------------
; DATOS maquina_B8AF: texto a maquina (p02:8059): caracteres, 0xFD linea, 0xFE
;   pausa, 0xFF acaba; lo leen p02:8059 (12 bytes)
;   0xb8af..0xb8bb  (12 bytes)
DATA_maquina_B8AF:
	defb 02eh,039h,020h,037h,043h,0fdh,02ch,02fh,03dh,03eh,047h,0ffh	; b8af  .9 7C.,/=>G.

; ----------------------------------------------------------------------
; DATOS por_fase_b8bb: 25 palabras: la lista de cada fase (p02:912A:
;   p12:B8BB[0xC211 - 1]; 0 = ninguna); lo leen p02:9126 (50 bytes)
;   0xb8bb..0xb8ed  (50 bytes)
DATA_por_fase_b8bb:
	defb 0edh,0b8h	; b8bb
	defb 02ah,0b9h	; b8bd
	defb 079h,0b9h	; b8bf
	defb 0cbh,0b9h	; b8c1
	defb 000h,000h	; b8c3
	defb 005h,0bah	; b8c5
	defb 045h,0bah	; b8c7
	defb 0a0h,0bah	; b8c9
	defb 0e3h,0bah	; b8cb
	defb 000h,000h	; b8cd
	defb 026h,0bbh	; b8cf
	defb 066h,0bbh	; b8d1
	defb 0a6h,0bbh	; b8d3
	defb 0e9h,0bbh	; b8d5
	defb 000h,000h	; b8d7
	defb 03bh,0bch	; b8d9
	defb 0a5h,0bch	; b8db
	defb 0f4h,0bch	; b8dd
	defb 03dh,0bdh	; b8df
	defb 000h,000h	; b8e1
	defb 09bh,0bdh	; b8e3
	defb 0fch,0bdh	; b8e5
	defb 07bh,0beh	; b8e7
	defb 0ebh,0beh	; b8e9
	defb 000h,000h	; b8eb

; ----------------------------------------------------------------------
; DATOS lista_b8bb_B8ED: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (61 bytes)
;   0xb8ed..0xb92a  (61 bytes)
DATA_lista_b8bb_B8ED:
	defb 001h,021h,003h	; b8ed
	defb 001h,016h,002h	; b8f0
	defb 002h,0c1h,002h	; b8f3
	defb 002h,0e7h,003h	; b8f6
	defb 002h,0dah,003h	; b8f9
	defb 002h,077h,00ah	; b8fc
	defb 003h,041h,002h	; b8ff
	defb 003h,05ah,002h	; b902
	defb 004h,0b0h,002h	; b905
	defb 004h,058h,002h	; b908
	defb 005h,05ah,003h	; b90b
	defb 005h,07ah,003h	; b90e
	defb 005h,0dah,00bh	; b911
	defb 006h,0a0h,00ch	; b914
	defb 006h,01ah,003h	; b917
	defb 006h,036h,008h	; b91a
	defb 007h,0cah,003h	; b91d
	defb 007h,0eah,003h	; b920
	defb 007h,071h,00dh	; b923
	defb 008h,07ah,005h	; b926
	defb 0ffh	; b929

; ----------------------------------------------------------------------
; DATOS lista_b8bb_B92A: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (79 bytes)
;   0xb92a..0xb979  (79 bytes)
DATA_lista_b8bb_B92A:
	defb 001h,0a0h,003h	; b92a
	defb 001h,034h,002h	; b92d
	defb 001h,084h,002h	; b930
	defb 002h,040h,003h	; b933
	defb 002h,014h,002h	; b936
	defb 002h,054h,002h	; b939
	defb 003h,060h,002h	; b93c
	defb 003h,02ah,002h	; b93f
	defb 003h,0d1h,00ah	; b942
	defb 004h,057h,002h	; b945
	defb 004h,077h,002h	; b948
	defb 004h,097h,002h	; b94b
	defb 004h,0b7h,002h	; b94e
	defb 005h,0a0h,003h	; b951
	defb 006h,055h,003h	; b954
	defb 006h,078h,003h	; b957
	defb 007h,0c1h,00dh	; b95a
	defb 007h,0e1h,00dh	; b95d
	defb 007h,0eah,002h	; b960
	defb 008h,041h,003h	; b963
	defb 009h,0e2h,003h	; b966
	defb 009h,074h,002h	; b969
	defb 009h,0a8h,008h	; b96c
	defb 009h,01ah,00bh	; b96f
	defb 00ah,010h,003h	; b972
	defb 00bh,099h,005h	; b975
	defb 0ffh	; b978

; ----------------------------------------------------------------------
; DATOS lista_b8bb_B979: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (82 bytes)
;   0xb979..0xb9cb  (82 bytes)
DATA_lista_b8bb_B979:
	defb 001h,011h,00ah	; b979
	defb 001h,016h,00bh	; b97c
	defb 001h,031h,003h	; b97f
	defb 001h,013h,003h	; b982
	defb 002h,060h,002h	; b985
	defb 002h,0e1h,00dh	; b988
	defb 002h,054h,002h	; b98b
	defb 002h,078h,002h	; b98e
	defb 003h,034h,002h	; b991
	defb 003h,09ah,002h	; b994
	defb 003h,0bah,002h	; b997
	defb 004h,077h,003h	; b99a
	defb 004h,097h,003h	; b99d
	defb 004h,0dah,008h	; b9a0
	defb 005h,01ah,003h	; b9a3
	defb 005h,03ah,002h	; b9a6
	defb 006h,0e3h,002h	; b9a9
	defb 006h,0e6h,002h	; b9ac
	defb 007h,03ah,002h	; b9af
	defb 007h,05ah,002h	; b9b2
	defb 007h,0e4h,00ch	; b9b5
	defb 007h,0e8h,00ch	; b9b8
	defb 008h,021h,008h	; b9bb
	defb 008h,041h,003h	; b9be
	defb 008h,061h,003h	; b9c1
	defb 008h,01ah,003h	; b9c4
	defb 009h,07ah,005h	; b9c7
	defb 0ffh	; b9ca

; ----------------------------------------------------------------------
; DATOS lista_b8bb_B9CB: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (58 bytes)
;   0xb9cb..0xba05  (58 bytes)
DATA_lista_b8bb_B9CB:
	defb 001h,0e0h,002h	; b9cb
	defb 001h,025h,002h	; b9ce
	defb 001h,075h,002h	; b9d1
	defb 002h,0a0h,002h	; b9d4
	defb 002h,0c0h,002h	; b9d7
	defb 002h,01ah,00bh	; b9da
	defb 002h,03ah,003h	; b9dd
	defb 003h,0c0h,003h	; b9e0
	defb 004h,020h,003h	; b9e3
	defb 004h,014h,003h	; b9e6
	defb 004h,016h,002h	; b9e9
	defb 005h,0b4h,009h	; b9ec
	defb 006h,035h,003h	; b9ef
	defb 006h,0d4h,002h	; b9f2
	defb 007h,0e1h,00dh	; b9f5
	defb 007h,014h,00dh	; b9f8
	defb 007h,0cah,003h	; b9fb
	defb 007h,0eah,003h	; b9fe
	defb 008h,01ah,005h	; ba01
	defb 0ffh	; ba04

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BA05: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (64 bytes)
;   0xba05..0xba45  (64 bytes)
DATA_lista_b8bb_BA05:
	defb 001h,060h,002h	; ba05
	defb 001h,034h,00ch	; ba08
	defb 001h,020h,00ah	; ba0b
	defb 002h,090h,002h	; ba0e
	defb 002h,0b4h,002h	; ba11
	defb 003h,0e3h,002h	; ba14
	defb 003h,044h,002h	; ba17
	defb 003h,0bah,003h	; ba1a
	defb 004h,0b6h,002h	; ba1d
	defb 004h,0d6h,002h	; ba20
	defb 005h,0e3h,00dh	; ba23
	defb 005h,0a6h,003h	; ba26
	defb 005h,04ah,003h	; ba29
	defb 005h,01ah,00bh	; ba2c
	defb 006h,0c4h,009h	; ba2f
	defb 007h,0b0h,003h	; ba32
	defb 007h,01ah,00dh	; ba35
	defb 008h,017h,003h	; ba38
	defb 008h,037h,003h	; ba3b
	defb 008h,0dah,008h	; ba3e
	defb 009h,077h,005h	; ba41
	defb 0ffh	; ba44

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BA45: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (91 bytes)
;   0xba45..0xbaa0  (91 bytes)
DATA_lista_b8bb_BA45:
	defb 001h,089h,00bh	; ba45
	defb 001h,0cah,003h	; ba48
	defb 001h,0eah,003h	; ba4b
	defb 002h,014h,002h	; ba4e
	defb 002h,034h,002h	; ba51
	defb 002h,0e0h,00dh	; ba54
	defb 002h,0e2h,00dh	; ba57
	defb 003h,018h,00dh	; ba5a
	defb 003h,014h,00dh	; ba5d
	defb 003h,016h,00dh	; ba60
	defb 005h,095h,003h	; ba63
	defb 005h,0cah,003h	; ba66
	defb 005h,0e5h,00ch	; ba69
	defb 005h,0e7h,00ch	; ba6c
	defb 006h,055h,002h	; ba6f
	defb 006h,0b7h,003h	; ba72
	defb 007h,035h,002h	; ba75
	defb 007h,0b8h,003h	; ba78
	defb 007h,0e8h,003h	; ba7b
	defb 008h,033h,002h	; ba7e
	defb 008h,0d5h,002h	; ba81
	defb 008h,0b0h,008h	; ba84
	defb 009h,0a2h,003h	; ba87
	defb 009h,032h,003h	; ba8a
	defb 009h,062h,00bh	; ba8d
	defb 00ah,0d7h,003h	; ba90
	defb 00ah,0eah,003h	; ba93
	defb 00bh,075h,003h	; ba96
	defb 00bh,010h,00dh	; ba99
	defb 00ch,084h,005h	; ba9c
	defb 0ffh	; ba9f

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BAA0: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (67 bytes)
;   0xbaa0..0xbae3  (67 bytes)
DATA_lista_b8bb_BAA0:
	defb 001h,013h,00ah	; baa0
	defb 001h,030h,002h	; baa3
	defb 002h,018h,00dh	; baa6
	defb 002h,074h,002h	; baa9
	defb 003h,037h,003h	; baac
	defb 003h,077h,003h	; baaf
	defb 004h,094h,003h	; bab2
	defb 005h,014h,00dh	; bab5
	defb 005h,078h,003h	; bab8
	defb 006h,023h,002h	; babb
	defb 006h,081h,003h	; babe
	defb 006h,0d1h,008h	; bac1
	defb 006h,097h,002h	; bac4
	defb 007h,023h,002h	; bac7
	defb 007h,058h,002h	; baca
	defb 007h,098h,002h	; bacd
	defb 008h,017h,00dh	; bad0
	defb 00ah,0c1h,003h	; bad3
	defb 00ah,0e1h,003h	; bad6
	defb 00ah,0c3h,003h	; bad9
	defb 00ah,0e3h,003h	; badc
	defb 00bh,0e3h,005h	; badf
	defb 0ffh	; bae2

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BAE3: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (67 bytes)
;   0xbae3..0xbb26  (67 bytes)
DATA_lista_b8bb_BAE3:
	defb 001h,014h,002h	; bae3
	defb 001h,061h,002h	; bae6
	defb 001h,091h,002h	; bae9
	defb 001h,0e4h,002h	; baec
	defb 002h,0e6h,002h	; baef
	defb 002h,0c9h,002h	; baf2
	defb 002h,0e9h,002h	; baf5
	defb 003h,051h,002h	; baf8
	defb 003h,0b1h,002h	; bafb
	defb 003h,0e7h,00ch	; bafe
	defb 004h,015h,009h	; bb01
	defb 004h,08ah,009h	; bb04
	defb 004h,0c8h,003h	; bb07
	defb 004h,0e8h,003h	; bb0a
	defb 005h,01ah,003h	; bb0d
	defb 006h,090h,003h	; bb10
	defb 006h,0c0h,003h	; bb13
	defb 006h,035h,00ah	; bb16
	defb 007h,0c0h,002h	; bb19
	defb 007h,0e0h,003h	; bb1c
	defb 007h,0eah,003h	; bb1f
	defb 008h,076h,005h	; bb22
	defb 0ffh	; bb25

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BB26: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (64 bytes)
;   0xbb26..0xbb66  (64 bytes)
DATA_lista_b8bb_BB26:
	defb 001h,012h,00bh	; bb26
	defb 001h,0e3h,003h	; bb29
	defb 002h,096h,002h	; bb2c
	defb 002h,0e7h,003h	; bb2f
	defb 003h,0a1h,002h	; bb32
	defb 003h,0c1h,003h	; bb35
	defb 003h,0e8h,009h	; bb38
	defb 003h,0ebh,003h	; bb3b
	defb 004h,010h,002h	; bb3e
	defb 004h,030h,002h	; bb41
	defb 004h,0e3h,00dh	; bb44
	defb 004h,0e9h,008h	; bb47
	defb 005h,014h,002h	; bb4a
	defb 005h,034h,002h	; bb4d
	defb 005h,0e5h,00dh	; bb50
	defb 006h,03ah,00bh	; bb53
	defb 006h,06ah,003h	; bb56
	defb 006h,08ah,003h	; bb59
	defb 006h,070h,008h	; bb5c
	defb 007h,0e8h,003h	; bb5f
	defb 008h,066h,005h	; bb62
	defb 0ffh	; bb65

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BB66: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (64 bytes)
;   0xbb66..0xbba6  (64 bytes)
DATA_lista_b8bb_BB66:
	defb 002h,032h,002h	; bb66
	defb 002h,072h,002h	; bb69
	defb 002h,0c2h,002h	; bb6c
	defb 003h,0eah,003h	; bb6f
	defb 004h,0eah,002h	; bb72
	defb 004h,090h,003h	; bb75
	defb 005h,013h,003h	; bb78
	defb 005h,091h,002h	; bb7b
	defb 005h,0b1h,002h	; bb7e
	defb 006h,064h,003h	; bb81
	defb 006h,0c1h,003h	; bb84
	defb 006h,09ah,002h	; bb87
	defb 007h,018h,003h	; bb8a
	defb 007h,01ah,00bh	; bb8d
	defb 007h,03ah,003h	; bb90
	defb 007h,0e0h,003h	; bb93
	defb 008h,0e0h,00ah	; bb96
	defb 008h,056h,00dh	; bb99
	defb 008h,076h,00dh	; bb9c
	defb 008h,0eah,002h	; bb9f
	defb 009h,069h,005h	; bba2
	defb 0ffh	; bba5

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BBA6: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (67 bytes)
;   0xbba6..0xbbe9  (67 bytes)
DATA_lista_b8bb_BBA6:
	defb 002h,0a1h,00bh	; bba6
	defb 003h,01ah,003h	; bba9
	defb 003h,0d8h,003h	; bbac
	defb 003h,0dah,00ah	; bbaf
	defb 004h,01ah,003h	; bbb2
	defb 005h,022h,002h	; bbb5
	defb 005h,042h,003h	; bbb8
	defb 005h,0d4h,002h	; bbbb
	defb 006h,0b0h,002h	; bbbe
	defb 006h,0b6h,002h	; bbc1
	defb 006h,0e4h,00dh	; bbc4
	defb 006h,0e8h,003h	; bbc7
	defb 007h,01ah,003h	; bbca
	defb 008h,012h,002h	; bbcd
	defb 008h,032h,002h	; bbd0
	defb 008h,097h,00dh	; bbd3
	defb 009h,045h,003h	; bbd6
	defb 009h,065h,003h	; bbd9
	defb 009h,0b2h,00ah	; bbdc
	defb 00ah,010h,002h	; bbdf
	defb 00ah,0e8h,003h	; bbe2
	defb 00bh,08ah,005h	; bbe5
	defb 0ffh	; bbe8

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BBE9: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (82 bytes)
;   0xbbe9..0xbc3b  (82 bytes)
DATA_lista_b8bb_BBE9:
	defb 001h,048h,002h	; bbe9
	defb 001h,068h,002h	; bbec
	defb 001h,0e8h,003h	; bbef
	defb 002h,088h,00dh	; bbf2
	defb 002h,0b8h,00dh	; bbf5
	defb 002h,0d8h,00bh	; bbf8
	defb 004h,08ah,002h	; bbfb
	defb 004h,0c2h,003h	; bbfe
	defb 004h,0e2h,003h	; bc01
	defb 005h,016h,002h	; bc04
	defb 005h,076h,002h	; bc07
	defb 005h,0c7h,002h	; bc0a
	defb 006h,0cah,002h	; bc0d
	defb 006h,0eah,003h	; bc10
	defb 007h,094h,003h	; bc13
	defb 007h,0e5h,003h	; bc16
	defb 009h,041h,003h	; bc19
	defb 009h,073h,003h	; bc1c
	defb 009h,0a1h,003h	; bc1f
	defb 009h,0d2h,003h	; bc22
	defb 00ah,039h,002h	; bc25
	defb 00ah,059h,002h	; bc28
	defb 00bh,0a7h,003h	; bc2b
	defb 00bh,0a9h,009h	; bc2e
	defb 00ch,0bah,00dh	; bc31
	defb 00ch,0eah,00dh	; bc34
	defb 00dh,08ah,005h	; bc37
	defb 0ffh	; bc3a

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BC3B: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (106 bytes)
;   0xbc3b..0xbca5  (106 bytes)
DATA_lista_b8bb_BC3B:
	defb 001h,084h,003h	; bc3b
	defb 001h,062h,008h	; bc3e
	defb 002h,015h,003h	; bc41
	defb 002h,094h,003h	; bc44
	defb 003h,029h,003h	; bc47
	defb 003h,080h,00ah	; bc4a
	defb 003h,097h,002h	; bc4d
	defb 004h,011h,00bh	; bc50
	defb 004h,074h,003h	; bc53
	defb 004h,0e4h,003h	; bc56
	defb 005h,020h,003h	; bc59
	defb 005h,0e2h,003h	; bc5c
	defb 005h,06ah,002h	; bc5f
	defb 005h,07ah,002h	; bc62
	defb 006h,015h,003h	; bc65
	defb 006h,0d2h,009h	; bc68
	defb 007h,027h,002h	; bc6b
	defb 007h,037h,002h	; bc6e
	defb 007h,047h,002h	; bc71
	defb 007h,057h,002h	; bc74
	defb 008h,081h,003h	; bc77
	defb 008h,0d4h,002h	; bc7a
	defb 008h,0d6h,002h	; bc7d
	defb 009h,045h,003h	; bc80
	defb 009h,055h,003h	; bc83
	defb 009h,0d4h,002h	; bc86
	defb 009h,022h,008h	; bc89
	defb 00ah,0d1h,003h	; bc8c
	defb 00ah,0c5h,003h	; bc8f
	defb 00bh,0e2h,003h	; bc92
	defb 00bh,0b8h,003h	; bc95
	defb 00bh,029h,008h	; bc98
	defb 00ch,0c0h,003h	; bc9b
	defb 00ch,038h,00dh	; bc9e
	defb 00dh,057h,005h	; bca1
	defb 0ffh	; bca4

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BCA5: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (79 bytes)
;   0xbca5..0xbcf4  (79 bytes)
DATA_lista_b8bb_BCA5:
	defb 001h,082h,003h	; bca5
	defb 001h,092h,003h	; bca8
	defb 001h,0b6h,002h	; bcab
	defb 001h,0b8h,002h	; bcae
	defb 002h,035h,003h	; bcb1
	defb 002h,045h,003h	; bcb4
	defb 003h,01ah,00bh	; bcb7
	defb 003h,07ah,003h	; bcba
	defb 003h,095h,00dh	; bcbd
	defb 004h,061h,002h	; bcc0
	defb 004h,071h,002h	; bcc3
	defb 004h,019h,003h	; bcc6
	defb 004h,0e7h,003h	; bcc9
	defb 005h,01ah,00ah	; bccc
	defb 005h,072h,003h	; bccf
	defb 005h,082h,003h	; bcd2
	defb 005h,0e9h,003h	; bcd5
	defb 006h,040h,003h	; bcd8
	defb 006h,013h,003h	; bcdb
	defb 006h,0e4h,00bh	; bcde
	defb 006h,0a7h,008h	; bce1
	defb 007h,024h,003h	; bce4
	defb 007h,029h,002h	; bce7
	defb 008h,024h,004h	; bcea
	defb 008h,090h,002h	; bced
	defb 009h,026h,005h	; bcf0
	defb 0ffh	; bcf3

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BCF4: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (73 bytes)
;   0xbcf4..0xbd3d  (73 bytes)
DATA_lista_b8bb_BCF4:
	defb 001h,076h,002h	; bcf4
	defb 001h,024h,002h	; bcf7
	defb 002h,023h,00ch	; bcfa
	defb 002h,027h,00ch	; bcfd
	defb 002h,02bh,00ch	; bd00
	defb 002h,0a5h,00ah	; bd03
	defb 003h,057h,002h	; bd06
	defb 003h,077h,002h	; bd09
	defb 003h,097h,002h	; bd0c
	defb 004h,045h,00ch	; bd0f
	defb 005h,010h,003h	; bd12
	defb 005h,063h,002h	; bd15
	defb 005h,083h,002h	; bd18
	defb 006h,014h,003h	; bd1b
	defb 006h,088h,00dh	; bd1e
	defb 007h,090h,003h	; bd21
	defb 007h,047h,00ah	; bd24
	defb 007h,09ah,008h	; bd27
	defb 008h,055h,002h	; bd2a
	defb 009h,021h,002h	; bd2d
	defb 009h,023h,002h	; bd30
	defb 009h,061h,00bh	; bd33
	defb 00ah,050h,004h	; bd36
	defb 00bh,078h,005h	; bd39
	defb 0ffh	; bd3c

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BD3D: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (94 bytes)
;   0xbd3d..0xbd9b  (94 bytes)
DATA_lista_b8bb_BD3D:
	defb 001h,028h,003h	; bd3d
	defb 001h,0a4h,002h	; bd40
	defb 002h,0dah,008h	; bd43
	defb 002h,028h,002h	; bd46
	defb 002h,048h,002h	; bd49
	defb 002h,068h,002h	; bd4c
	defb 003h,022h,009h	; bd4f
	defb 003h,048h,003h	; bd52
	defb 003h,068h,003h	; bd55
	defb 004h,0d8h,00bh	; bd58
	defb 004h,071h,002h	; bd5b
	defb 004h,091h,002h	; bd5e
	defb 005h,0c1h,003h	; bd61
	defb 005h,0c5h,003h	; bd64
	defb 006h,045h,00dh	; bd67
	defb 006h,085h,00dh	; bd6a
	defb 006h,0c5h,00dh	; bd6d
	defb 007h,074h,00ah	; bd70
	defb 007h,087h,002h	; bd73
	defb 007h,0a7h,002h	; bd76
	defb 008h,041h,003h	; bd79
	defb 008h,061h,002h	; bd7c
	defb 008h,0d5h,009h	; bd7f
	defb 009h,065h,004h	; bd82
	defb 009h,0aah,009h	; bd85
	defb 009h,0b1h,002h	; bd88
	defb 009h,0c1h,002h	; bd8b
	defb 00ah,088h,003h	; bd8e
	defb 00ah,0c5h,002h	; bd91
	defb 00ah,0c7h,002h	; bd94
	defb 00bh,079h,005h	; bd97
	defb 0ffh	; bd9a

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BD9B: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (97 bytes)
;   0xbd9b..0xbdfc  (97 bytes)
DATA_lista_b8bb_BD9B:
	defb 001h,021h,003h	; bd9b
	defb 001h,031h,003h	; bd9e
	defb 001h,051h,003h	; bda1
	defb 001h,014h,00ah	; bda4
	defb 002h,068h,003h	; bda7
	defb 002h,088h,002h	; bdaa
	defb 002h,043h,002h	; bdad
	defb 002h,073h,002h	; bdb0
	defb 003h,078h,003h	; bdb3
	defb 003h,0e8h,002h	; bdb6
	defb 003h,083h,002h	; bdb9
	defb 003h,0b3h,002h	; bdbc
	defb 004h,023h,002h	; bdbf
	defb 004h,053h,002h	; bdc2
	defb 004h,0c1h,003h	; bdc5
	defb 004h,0d8h,004h	; bdc8
	defb 005h,062h,002h	; bdcb
	defb 005h,07ah,002h	; bdce
	defb 005h,067h,00bh	; bdd1
	defb 006h,01ah,00bh	; bdd4
	defb 007h,080h,00dh	; bdd7
	defb 007h,058h,002h	; bdda
	defb 008h,024h,00dh	; bddd
	defb 008h,0a8h,002h	; bde0
	defb 008h,0e0h,008h	; bde3
	defb 009h,042h,003h	; bde6
	defb 009h,04ah,008h	; bde9
	defb 009h,0b8h,003h	; bdec
	defb 009h,0aah,002h	; bdef
	defb 00ah,0c4h,004h	; bdf2
	defb 00ah,070h,002h	; bdf5
	defb 00bh,077h,005h	; bdf8
	defb 0ffh	; bdfb

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BDFC: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (127 bytes)
;   0xbdfc..0xbe7b  (127 bytes)
DATA_lista_b8bb_BDFC:
	defb 001h,0b0h,002h	; bdfc
	defb 001h,0c0h,002h	; bdff
	defb 001h,0d0h,002h	; be02
	defb 002h,0d6h,002h	; be05
	defb 002h,0e6h,003h	; be08
	defb 003h,041h,003h	; be0b
	defb 003h,061h,003h	; be0e
	defb 003h,081h,003h	; be11
	defb 003h,056h,008h	; be14
	defb 004h,016h,00bh	; be17
	defb 004h,0c4h,004h	; be1a
	defb 005h,027h,00bh	; be1d
	defb 005h,087h,002h	; be20
	defb 005h,0a7h,002h	; be23
	defb 005h,0e7h,002h	; be26
	defb 006h,041h,002h	; be29
	defb 006h,043h,002h	; be2c
	defb 007h,031h,003h	; be2f
	defb 007h,033h,009h	; be32
	defb 007h,057h,002h	; be35
	defb 007h,067h,002h	; be38
	defb 008h,020h,003h	; be3b
	defb 008h,076h,002h	; be3e
	defb 008h,0e0h,00ah	; be41
	defb 008h,08bh,009h	; be44
	defb 009h,090h,003h	; be47
	defb 009h,0e4h,003h	; be4a
	defb 009h,0b8h,003h	; be4d
	defb 00ah,090h,003h	; be50
	defb 00ah,0e6h,003h	; be53
	defb 00ah,08ah,003h	; be56
	defb 00bh,058h,003h	; be59
	defb 00bh,078h,003h	; be5c
	defb 00bh,094h,003h	; be5f
	defb 00ch,041h,003h	; be62
	defb 00ch,061h,003h	; be65
	defb 00ch,081h,003h	; be68
	defb 00ch,0dah,00bh	; be6b
	defb 00dh,088h,002h	; be6e
	defb 00dh,0c7h,00dh	; be71
	defb 00dh,0d7h,00dh	; be74
	defb 00eh,04ah,005h	; be77
	defb 0ffh	; be7a

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BE7B: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (112 bytes)
;   0xbe7b..0xbeeb  (112 bytes)
DATA_lista_b8bb_BE7B:
	defb 001h,0e0h,003h	; be7b
	defb 001h,0e4h,003h	; be7e
	defb 001h,0e8h,003h	; be81
	defb 002h,078h,003h	; be84
	defb 003h,073h,003h	; be87
	defb 003h,0d2h,00ah	; be8a
	defb 003h,0c6h,003h	; be8d
	defb 004h,056h,003h	; be90
	defb 004h,0c4h,00bh	; be93
	defb 004h,0eah,003h	; be96
	defb 005h,078h,002h	; be99
	defb 005h,0b8h,002h	; be9c
	defb 005h,0e6h,003h	; be9f
	defb 006h,072h,00dh	; bea2
	defb 006h,06ah,002h	; bea5
	defb 006h,0cah,002h	; bea8
	defb 007h,010h,003h	; beab
	defb 007h,0d4h,00bh	; beae
	defb 008h,060h,003h	; beb1
	defb 008h,056h,002h	; beb4
	defb 008h,066h,002h	; beb7
	defb 008h,0eah,009h	; beba
	defb 009h,066h,003h	; bebd
	defb 009h,086h,00bh	; bec0
	defb 009h,0a6h,003h	; bec3
	defb 00ah,0e5h,003h	; bec6
	defb 00ah,0e6h,003h	; bec9
	defb 00ah,0e7h,003h	; becc
	defb 00ah,0e8h,003h	; becf
	defb 00bh,044h,002h	; bed2
	defb 00bh,054h,002h	; bed5
	defb 00bh,048h,002h	; bed8
	defb 00bh,058h,002h	; bedb
	defb 00ch,080h,002h	; bede
	defb 00ch,090h,002h	; bee1
	defb 00ch,04ah,002h	; bee4
	defb 00dh,07ah,005h	; bee7
	defb 0ffh	; beea

; ----------------------------------------------------------------------
; DATOS lista_b8bb_BEEB: registros de 3 bytes [pantalla][YX][..] hasta 0xFF
;   (p02:9135); lo leen p02:9126 (112 bytes)
;   0xbeeb..0xbf5b  (112 bytes)
DATA_lista_b8bb_BEEB:
	defb 001h,010h,003h	; beeb
	defb 001h,093h,00ah	; beee
	defb 001h,0e0h,003h	; bef1
	defb 002h,016h,00dh	; bef4
	defb 002h,036h,00dh	; bef7
	defb 002h,0e2h,008h	; befa
	defb 002h,0e5h,003h	; befd
	defb 003h,070h,004h	; bf00
	defb 003h,0d6h,003h	; bf03
	defb 003h,0e6h,003h	; bf06
	defb 004h,061h,002h	; bf09
	defb 004h,091h,002h	; bf0c
	defb 004h,0d2h,009h	; bf0f
	defb 004h,0eah,00bh	; bf12
	defb 005h,020h,004h	; bf15
	defb 005h,04ah,002h	; bf18
	defb 005h,06ah,002h	; bf1b
	defb 006h,028h,002h	; bf1e
	defb 006h,02ah,002h	; bf21
	defb 007h,0e0h,00dh	; bf24
	defb 007h,0b4h,003h	; bf27
	defb 007h,077h,003h	; bf2a
	defb 008h,032h,003h	; bf2d
	defb 008h,036h,003h	; bf30
	defb 008h,0c7h,00ah	; bf33
	defb 009h,013h,003h	; bf36
	defb 009h,046h,00bh	; bf39
	defb 009h,0b8h,002h	; bf3c
	defb 009h,0e6h,00dh	; bf3f
	defb 00ah,01ah,009h	; bf42
	defb 00ah,0b6h,003h	; bf45
	defb 00ah,0c6h,003h	; bf48
	defb 00bh,051h,003h	; bf4b
	defb 00bh,042h,008h	; bf4e
	defb 00bh,06ah,003h	; bf51
	defb 00bh,08ah,003h	; bf54
	defb 00ch,076h,005h	; bf57
	defb 0ffh	; bf5a

; ----------------------------------------------------------------------
; DATOS por_fase_BF59: 25 palabras: la lista de cada fase 1-25 (p01:79A9,
;   indice 0xC211); lo leen p01:79A9 (50 bytes)
;   0xbf5b..0xbf8d  (50 bytes)
DATA_por_fase_BF59:
	defb 08dh,0bfh	; bf5b
	defb 091h,0bfh	; bf5d
	defb 0eeh,0bfh	; bf5f
	defb 0eeh,0bfh	; bf61
	defb 0eeh,0bfh	; bf63
	defb 0eeh,0bfh	; bf65
	defb 0eeh,0bfh	; bf67
	defb 0eeh,0bfh	; bf69
	defb 0a1h,0bfh	; bf6b
	defb 0eeh,0bfh	; bf6d
	defb 0eeh,0bfh	; bf6f
	defb 0eeh,0bfh	; bf71
	defb 0a8h,0bfh	; bf73
	defb 0eeh,0bfh	; bf75
	defb 0eeh,0bfh	; bf77
	defb 0eeh,0bfh	; bf79
	defb 0beh,0bfh	; bf7b
	defb 0c5h,0bfh	; bf7d
	defb 0eeh,0bfh	; bf7f
	defb 0eeh,0bfh	; bf81
	defb 0d2h,0bfh	; bf83
	defb 0eeh,0bfh	; bf85
	defb 0d9h,0bfh	; bf87
	defb 0eeh,0bfh	; bf89
	defb 0eeh,0bfh	; bf8b

; ----------------------------------------------------------------------
; DATOS lista_BF8D: 3 bytes [pantalla][Y][X] a 0xCB00 hasta 0xFF; lo leen
;   p01:79A9 (4 bytes)
;   0xbf8d..0xbf91  (4 bytes)
DATA_lista_BF8D:
	defb 002h,0c4h,058h	; bf8d
	defb 0ffh	; bf90

; ----------------------------------------------------------------------
; DATOS lista_BF91: 3 bytes [pantalla][Y][X] a 0xCB00 hasta 0xFF; lo leen
;   p01:79A9 (16 bytes)
;   0xbf91..0xbfa1  (16 bytes)
DATA_lista_BF91:
	defb 003h,044h,028h	; bf91
	defb 005h,044h,068h	; bf94
	defb 006h,054h,078h	; bf97
	defb 009h,044h,028h	; bf9a
	defb 009h,044h,0a8h	; bf9d
	defb 0ffh	; bfa0

; ----------------------------------------------------------------------
; DATOS lista_BFA1: 3 bytes [pantalla][Y][X] a 0xCB00 hasta 0xFF; lo leen
;   p01:79A9 (7 bytes)
;   0xbfa1..0xbfa8  (7 bytes)
DATA_lista_BFA1:
	defb 005h,054h,0b8h	; bfa1
	defb 006h,0c4h,078h	; bfa4
	defb 0ffh	; bfa7

; ----------------------------------------------------------------------
; DATOS lista_BFA8: 3 bytes [pantalla][Y][X] a 0xCB00 hasta 0xFF; lo leen
;   p01:79A9 (22 bytes)
;   0xbfa8..0xbfbe  (22 bytes)
DATA_lista_BFA8:
	defb 005h,044h,0c8h	; bfa8
	defb 005h,084h,038h	; bfab
	defb 005h,084h,0b8h	; bfae
	defb 005h,0c4h,0b8h	; bfb1
	defb 006h,044h,098h	; bfb4
	defb 006h,084h,038h	; bfb7
	defb 006h,0c4h,078h	; bfba
	defb 0ffh	; bfbd

; ----------------------------------------------------------------------
; DATOS lista_BFBE: 3 bytes [pantalla][Y][X] a 0xCB00 hasta 0xFF; lo leen
;   p01:79A9 (7 bytes)
;   0xbfbe..0xbfc5  (7 bytes)
DATA_lista_BFBE:
	defb 007h,034h,0d8h	; bfbe
	defb 008h,044h,098h	; bfc1
	defb 0ffh	; bfc4

; ----------------------------------------------------------------------
; DATOS lista_BFC5: 3 bytes [pantalla][Y][X] a 0xCB00 hasta 0xFF; lo leen
;   p01:79A9 (13 bytes)
;   0xbfc5..0xbfd2  (13 bytes)
DATA_lista_BFC5:
	defb 001h,0c4h,058h	; bfc5
	defb 002h,044h,058h	; bfc8
	defb 003h,0c4h,028h	; bfcb
	defb 004h,064h,098h	; bfce
	defb 0ffh	; bfd1

; ----------------------------------------------------------------------
; DATOS lista_BFD2: 3 bytes [pantalla][Y][X] a 0xCB00 hasta 0xFF; lo leen
;   p01:79A9 (7 bytes)
;   0xbfd2..0xbfd9  (7 bytes)
DATA_lista_BFD2:
	defb 006h,044h,0b8h	; bfd2
	defb 007h,044h,028h	; bfd5
	defb 0ffh	; bfd8

; ----------------------------------------------------------------------
; DATOS lista_BFD9: 3 bytes [pantalla][Y][X] a 0xCB00 hasta 0xFF; se solapan 3
;   bloques: (lista_BFEE BFEE-BFEF) (relleno_ff BFEE-C000); lo leen p01:79A9,
;   nadie (39 bytes)
;   0xbfd9..0xc000  (39 bytes)
DATA_lista_BFD9:
	defb 001h,0c4h,078h	; bfd9
	defb 001h,044h,078h	; bfdc
	defb 002h,084h,0a8h	; bfdf
	defb 003h,044h,028h	; bfe2
	defb 006h,064h,038h	; bfe5
	defb 007h,0c4h,098h	; bfe8
	defb 008h,084h,0c8h	; bfeb
	defb 0ffh,0ffh,0ffh	; bfee
	defb 0ffh,0ffh,0ffh	; bff1
	defb 0ffh,0ffh,0ffh	; bff4
	defb 0ffh,0ffh,0ffh	; bff7
	defb 0ffh,0ffh,0ffh	; bffa
	defb 0ffh,0ffh,0ffh	; bffd
