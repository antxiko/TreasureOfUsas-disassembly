; ==========================================================================
; THE TREASURE OF USAS - Konami (1987) - MSX2 - MegaROM RC-753 de 128 KB (Konami4) - banco 14 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS pista_73FE_cola: pista de musica (p13:6203), recorrida desde p13:672C
;   (sigue del banco 13); lo leen p13:6203 (3407 bytes)
;   0x8000..0x8d4f  (3407 bytes)
DATA_pista_73FE_cola:
	defb 060h,090h,0e1h,020h,0fah,022h,0ech,051h,0e2h,0b1h,0f6h,010h,0b0h,0fah,022h,0e1h	; 8000  `.. .".Q......".
	defb 023h,0f6h,010h,020h,0fah,022h,041h,0f6h,010h,040h,0fah,022h,062h,091h,0bdh,0f6h	; 8010  #.. ."A..@."b...
	defb 010h,0b1h,0e8h,001h,001h,000h,000h,011h,020h,020h,001h,020h,000h,011h,020h,020h	; 8020  ........  . ..
	defb 0e8h,080h,0eah,016h,07fh,0d5h,0f9h,023h,0e5h,091h,0f9h,013h,0e1h,0edh,0eah,081h	; 8030  .......#........
	defb 041h,031h,0edh,0afh,080h,081h,0feh,004h,042h,080h,0b1h,0a1h,071h,0b1h,0e1h,001h	; 8040  A1......B...q...
	defb 0e2h,0b1h,071h,0a1h,0fdh,003h,04ah,080h,0f9h,003h,0e1h,0a0h,070h,040h,070h,040h	; 8050  ..q...J.....p@p@
	defb 020h,0e2h,0a0h,0e1h,020h,0e2h,0a0h,070h,040h,070h,040h,020h,0e3h,0a0h,0e2h,020h	; 8060   ... ..p@p@ ...
	defb 0edh,0afh,080h,081h,0edh,0afh,080h,0d1h,0f8h,002h,051h,061h,071h,081h,091h,0d5h	; 8070  ..........Qaq...
	defb 0f9h,004h,0e2h,0a1h,0a1h,0f5h,002h,0a1h,0f9h,004h,0a1h,0a1h,0c1h,0b7h,0fdh,002h	; 8080  ................
	defb 080h,080h,0d3h,0fah,013h,0e1h,003h,0e2h,0b3h,0a3h,093h,083h,073h,061h,051h,041h	; 8090  ............saQA
	defb 031h,021h,011h,0e1h,001h,0e2h,0b1h,0a1h,091h,081h,071h,0d5h,0eah,042h,080h,0fah	; 80a0  1!........q..B..
	defb 024h,0e2h,091h,081h,051h,0fdh,005h,0afh,080h,0eeh,0dah,0fah,023h,0e4h,097h,0dah	; 80b0  $...Q.......#...
	defb 0efh,00ah,081h,0fdh,002h,0bfh,080h,0fah,013h,0e4h,042h,032h,072h,0a6h,0b7h,040h	; 80c0  ..........B2r..@
	defb 0fah,023h,0e3h,040h,020h,0e4h,0b0h,0a0h,070h,0e8h,001h,0a0h,0a0h,0e8h,080h,0efh	; 80d0  .#.@ ...p.......
	defb 00ah,081h,0d5h,0fbh,014h,0edh,021h,081h,083h,0e8h,001h,0a3h,0e8h,080h,0edh,021h	; 80e0  ......!........!
	defb 081h,087h,0d3h,093h,083h,073h,063h,053h,043h,0e3h,031h,021h,011h,001h,0e4h,0b1h	; 80f0  .....scSC.1!....
	defb 0a1h,091h,081h,071h,061h,051h,041h,0eah,0bfh,080h,0fah,013h,0e4h,022h,042h,052h	; 8100  ...qaQA......"BR
	defb 086h,0b7h,050h,0fah,023h,0e3h,090h,080h,050h,0fah,013h,0e4h,090h,080h,050h,020h	; 8110  ..P.#...P.....P
	defb 0e6h,0e4h,071h,071h,0f6h,000h,071h,0fbh,014h,071h,071h,0c1h,0eeh,0d5h,0e8h,001h	; 8120  ..qq..q..qq.....
	defb 0b1h,0e8h,080h,0f7h,003h,0e7h,002h,0e1h,092h,0edh,0eah,081h,040h,0d5h,0f7h,024h	; 8130  ............@..$
	defb 0e1h,090h,091h,081h,051h,091h,081h,051h,091h,081h,0f8h,023h,0e2h,051h,091h,081h	; 8140  ....Q..Q...#.Q..
	defb 051h,091h,081h,051h,080h,0fdh,004h,03dh,081h,0f8h,014h,0e2h,0b2h,0b1h,0a1h,071h	; 8150  Q..Q...=.......q
	defb 0b1h,0e1h,001h,0e2h,0b1h,071h,0a1h,0b1h,0a1h,071h,0b1h,0e1h,001h,0e2h,0b1h,071h	; 8160  .....q...q.....q
	defb 0a1h,0b1h,0a1h,071h,0b1h,0e1h,001h,0e2h,0b1h,070h,0f8h,003h,0e2h,0a0h,0a0h,070h	; 8170  ...q.....p.....p
	defb 040h,070h,040h,020h,0e3h,0a0h,0e2h,020h,0e3h,0a0h,070h,040h,070h,040h,020h,0e4h	; 8180  @p@ ... ..p@p@ .
	defb 0a0h,0f8h,024h,0e2h,090h,091h,081h,051h,0fdh,005h,095h,081h,081h,091h,081h,051h	; 8190  ..$....Q.......Q
	defb 0fdh,004h,09dh,081h,091h,081h,050h,0d1h,0f8h,002h,051h,061h,071h,081h,091h,0d5h	; 81a0  ......P...Qaq...
	defb 0f7h,004h,0a0h,0a1h,0a1h,0f3h,002h,0a1h,0f7h,004h,0a1h,0a1h,0c1h,0b6h,0e7h,000h	; 81b0  ................
	defb 0f8h,004h,0e1h,011h,011h,0f3h,002h,011h,0f7h,004h,011h,011h,0c1h,027h,0d3h,0f9h	; 81c0  .............'..
	defb 013h,0e1h,033h,023h,013h,003h,0e2h,0b3h,0a3h,091h,081h,071h,061h,051h,041h,0e1h	; 81d0  ..3#.......qaQA.
	defb 031h,021h,011h,001h,0e2h,0b1h,0a1h,0eah,03dh,081h,091h,081h,071h,061h,051h,0eeh	; 81e0  1!......=...qaQ.
	defb 0d7h,0fch,031h,0e4h,015h,045h,03bh,0e5h,0b7h,0eah,0f0h,081h,0d7h,0ech,051h,0edh	; 81f0  ..1..E........Q.
	defb 042h,082h,0f6h,000h,033h,0c1h,0edh,042h,082h,011h,0f6h,000h,011h,0c1h,0fah,011h	; 8200  B...3..B........
	defb 0e3h,0b0h,0e2h,040h,090h,0e1h,020h,070h,0e0h,000h,0f6h,000h,000h,0c0h,0fah,011h	; 8210  ...@.. p........
	defb 0e1h,041h,0f6h,000h,041h,0fah,011h,031h,0f6h,000h,033h,0c1h,0edh,042h,082h,011h	; 8220  .A..A..1..3..B..
	defb 0f6h,000h,011h,0c1h,0fah,011h,0e3h,0b0h,0e2h,040h,090h,0e1h,020h,0e2h,093h,0eah	; 8230  .........@.. ...
	defb 0fch,081h,0fah,011h,0e1h,041h,0f6h,000h,041h,0f9h,011h,031h,0eeh,0d7h,0ech,051h	; 8240  .....A..A..1...Q
	defb 0edh,05ch,082h,070h,0edh,05ch,082h,0e2h,090h,0eah,04dh,082h,0e8h,001h,012h,0e8h	; 8250  .\.p.\....M.....
	defb 080h,0e7h,002h,0f8h,011h,0e1h,041h,0f4h,000h,041h,0f8h,011h,031h,0f4h,000h,033h	; 8260  ......A..A..1..3
	defb 0c1h,0f8h,011h,041h,0f4h,000h,041h,0f8h,011h,031h,011h,0f4h,000h,010h,0e8h,001h	; 8270  ...A..A..1......
	defb 0a2h,0e8h,080h,0e7h,002h,0f8h,011h,0e3h,0b0h,0e2h,040h,090h,0e1h,020h,0eeh,0d7h	; 8280  ..........@.. ..
	defb 0f9h,011h,0ech,043h,0e1h,071h,031h,0e2h,0a1h,0e1h,071h,051h,021h,0e2h,0a1h,0e1h	; 8290  ...C.q1...qQ!...
	defb 021h,001h,0e2h,091h,0e1h,001h,051h,0eeh,0e2h,095h,0b0h,0e1h,000h,022h,002h,021h	; 82a0  !.....Q......".!
	defb 045h,050h,040h,025h,0eeh,0e1h,000h,020h,043h,072h,025h,0f7h,010h,020h,0f9h,003h	; 82b0  EP@%... Cr%.. ..
	defb 000h,0e2h,0b0h,0e1h,003h,042h,0e2h,0b6h,0f7h,010h,0b1h,0eeh,0e2h,094h,0b0h,0e1h	; 82c0  .....B..........
	defb 000h,040h,022h,002h,0e2h,0b1h,0e1h,025h,010h,020h,013h,0e2h,0b3h,0eeh,0efh,0f1h	; 82d0  .@"....%. ......
	defb 082h,004h,0f7h,010h,000h,0f9h,012h,000h,020h,032h,022h,001h,052h,032h,021h,00fh	; 82e0  ........ 2".R2!.
	defb 0eeh,0d7h,0f9h,012h,0ech,042h,0e1h,042h,052h,071h,042h,022h,001h,042h,052h,071h	; 82f0  .....B.BRqB".BRq
	defb 0e6h,0e1h,004h,0f7h,010h,000h,0f9h,012h,000h,020h,032h,022h,001h,052h,022h,051h	; 8300  ......... 2".R"Q
	defb 04dh,000h,020h,032h,022h,001h,052h,022h,051h,0eeh,0d7h,0f9h,000h,0edh,08fh,082h	; 8310  M. 2".R"Q.......
	defb 096h,0f7h,010h,090h,0edh,08fh,082h,092h,0f7h,010h,090h,0f9h,012h,0e2h,091h,0b1h	; 8320  ................
	defb 0fah,032h,0ech,042h,0e1h,003h,043h,021h,0e2h,091h,091h,0b1h,0e1h,003h,023h,0e2h	; 8330  .2.B..C!......#.
	defb 0b5h,090h,0b0h,0e1h,003h,073h,061h,021h,021h,061h,044h,020h,001h,043h,001h,021h	; 8340  .....sa!!aD .C.!
	defb 043h,072h,026h,000h,0e2h,0b0h,0e1h,003h,042h,0e2h,0b8h,0d7h,0fah,032h,0ech,042h	; 8350  Cr&.....B....2.B
	defb 0edh,0a8h,082h,0e1h,000h,020h,043h,072h,025h,0f7h,010h,020h,0fah,032h,000h,0e2h	; 8360  ..... Cr%.. .2..
	defb 0b0h,0e1h,003h,042h,0e2h,0b6h,0f7h,010h,0b1h,0d7h,0fah,032h,0ech,042h,0edh,0cch	; 8370  ...B.......2.B..
	defb 082h,0e1h,013h,0d1h,0f8h,001h,0edh,0eah,085h,0a3h,0b3h,0e1h,003h,0edh,0deh,082h	; 8380  ................
	defb 0efh,0f1h,082h,0edh,001h,083h,07fh,0edh,0deh,082h,0efh,0f1h,082h,0edh,001h,083h	; 8390  ................
	defb 07dh,051h,07dh,051h,07dh,0f6h,010h,071h,0c1h,0d7h,0f9h,023h,0e0h,0b0h,070h,040h	; 83a0  }Q}Q}..q...#..p@
	defb 000h,0f8h,023h,0e0h,0b0h,070h,040h,000h,0f7h,023h,0e0h,0b0h,070h,040h,000h,0f6h	; 83b0  ..#..p@..#..p@..
	defb 023h,0e0h,0b0h,070h,040h,000h,0f3h,013h,000h,0f2h,013h,000h,0d7h,0f9h,002h,0ech	; 83c0  #..p@...........
	defb 053h,0edh,0b5h,082h,0f9h,002h,0edh,0a8h,082h,0edh,0b5h,082h,0f9h,002h,0edh,0cch	; 83d0  S...............
	defb 082h,0e1h,01bh,0f6h,010h,011h,0f9h,002h,0edh,0b5h,082h,0f9h,002h,0edh,0a8h,082h	; 83e0  ................
	defb 0f9h,002h,0eah,0d9h,083h,0efh,001h,084h,0e3h,021h,0e4h,0b1h,0efh,001h,084h,0b1h	; 83f0  .........!......
	defb 0eeh,0e4h,091h,0e3h,041h,091h,041h,0e4h,021h,091h,0e3h,041h,0e4h,091h,051h,091h	; 8400  ....A.A.!..A..Q.
	defb 0e3h,041h,0e4h,091h,041h,081h,0e6h,0e3h,040h,070h,0e2h,000h,040h,0fdh,002h,017h	; 8410  .A..A...@p..@...
	defb 084h,0e3h,070h,0b0h,0e2h,020h,070h,0fdh,002h,021h,084h,0e3h,090h,0e2h,000h,040h	; 8420  ..p.. p..!.....@
	defb 090h,0fdh,002h,02bh,084h,0e3h,0b0h,0e2h,040h,070h,0b0h,0fdh,002h,035h,084h,0e3h	; 8430  ...+....@p...5..
	defb 050h,090h,0e2h,000h,050h,0fdh,002h,03fh,084h,0e3h,060h,090h,0e2h,020h,060h,0fdh	; 8440  P...P..?..`.. `.
	defb 002h,049h,084h,0e3h,070h,0b0h,0e2h,020h,070h,0fdh,002h,053h,084h,0eeh,0e3h,040h	; 8450  .I..p.. p..S...@
	defb 070h,0e2h,000h,040h,0fdh,002h,05eh,084h,0e3h,070h,0b0h,0e2h,020h,070h,0fdh,002h	; 8460  p..@..^..p.. p..
	defb 068h,084h,0e3h,090h,0e2h,000h,040h,090h,0fdh,002h,072h,084h,0e3h,0b0h,0e2h,040h	; 8470  h.....@...r....@
	defb 070h,0b0h,0fdh,002h,07ch,084h,0e3h,050h,090h,0e2h,000h,050h,0fdh,002h,086h,084h	; 8480  p...|..P...P....
	defb 0e3h,070h,0b0h,0e2h,020h,070h,0fdh,002h,090h,084h,0e3h,090h,0e2h,010h,040h,090h	; 8490  .p.. p........@.
	defb 0fdh,002h,09ah,084h,0eeh,0d7h,0f8h,003h,0ech,042h,0e1h,000h,0e2h,070h,0fdh,004h	; 84a0  .........B...p..
	defb 0aah,084h,0e2h,0a0h,070h,0fdh,004h,0b2h,084h,090h,050h,0fdh,004h,0b9h,084h,080h	; 84b0  ....p.....P.....
	defb 030h,0fdh,004h,0bfh,084h,0f9h,012h,0e1h,002h,0e2h,0a2h,081h,0e1h,022h,0eeh,0d7h	; 84c0  0............"..
	defb 0f8h,002h,0ech,042h,0e2h,077h,057h,00fh,077h,057h,00bh,0d4h,0e8h,002h,090h,090h	; 84d0  ...B.wW.wW......
	defb 090h,090h,092h,0d7h,0e8h,080h,0fbh,041h,0edh,0f5h,083h,0e3h,021h,0e7h,001h,0f8h	; 84e0  .......A....!...
	defb 003h,0edh,017h,084h,0b0h,020h,070h,0b0h,020h,070h,0e3h,0b0h,0e2h,020h,0edh,05eh	; 84f0  ..... p. p... .^
	defb 084h,0e2h,010h,040h,090h,0e1h,010h,0e2h,090h,0e1h,010h,040h,090h,0e2h,013h,0d1h	; 8500  ...@.......@....
	defb 0f8h,001h,0e3h,013h,023h,033h,0edh,0eah,085h,0edh,0a5h,084h,002h,0e2h,0a1h,07fh	; 8510  ....#3..........
	defb 0edh,0a5h,084h,0e2h,0a2h,0e1h,021h,00dh,0e2h,080h,0a0h,0e1h,002h,0e2h,0a2h,081h	; 8520  ......!.........
	defb 0e1h,022h,0e2h,0a2h,0e1h,021h,04fh,0edh,0a5h,084h,002h,0e2h,0a1h,07fh,0edh,0a5h	; 8530  ."...!O.........
	defb 084h,0e2h,0a2h,0e1h,021h,00dh,0e2h,080h,0a0h,0e1h,002h,0e2h,0a2h,081h,0e1h,022h	; 8540  ....!.........."
	defb 0e2h,0a2h,0e1h,021h,04dh,021h,04dh,021h,04dh,0f6h,010h,041h,0e7h,001h,0c1h,0d1h	; 8550  ...!M!M!M..A....
	defb 0c6h,0edh,024h,086h,040h,0e7h,001h,0d7h,0f9h,003h,0c1h,0c1h,0edh,017h,084h,0f9h	; 8560  ..$.@...........
	defb 002h,0edh,040h,086h,070h,0edh,05eh,084h,0e3h,090h,0e2h,010h,040h,090h,0feh,006h	; 8570  ..@.p.^.....@...
	defb 078h,085h,0edh,017h,084h,0f9h,002h,0edh,040h,086h,070h,0eah,075h,085h,0fbh,041h	; 8580  x.......@.p.u..A
	defb 0e3h,001h,000h,000h,001h,000h,000h,0e4h,0b1h,0b0h,0b0h,0b1h,0b0h,0b0h,091h,090h	; 8590  ................
	defb 090h,091h,090h,090h,071h,070h,070h,071h,070h,070h,0e4h,051h,050h,050h,051h,050h	; 85a0  ....qppqpp.QPPQP
	defb 050h,0e6h,0efh,08eh,085h,061h,060h,060h,061h,060h,060h,071h,070h,070h,071h,070h	; 85b0  P....a``a``qppqp
	defb 070h,071h,070h,070h,071h,070h,070h,0eeh,0efh,08eh,085h,071h,070h,070h,071h,070h	; 85c0  pqppqpp....qppqp
	defb 070h,091h,090h,090h,0fdh,004h,0d1h,085h,0eeh,0e3h,043h,053h,063h,073h,083h,093h	; 85d0  p.........CScs..
	defb 0a3h,0b3h,0e2h,003h,013h,023h,033h,043h,053h,0e6h,0efh,0d9h,085h,063h,073h,083h	; 85e0  .....#3CS....cs.
	defb 093h,0eeh,0d7h,0fbh,041h,0e3h,000h,000h,001h,001h,000h,001h,001h,000h,000h,000h	; 85f0  ....A...........
	defb 001h,0fdh,002h,0f2h,085h,0efh,009h,086h,0eeh,0e4h,080h,080h,081h,081h,080h,080h	; 8600  ................
	defb 0a0h,0a0h,0a1h,0a1h,0a0h,0a0h,0e3h,000h,000h,001h,001h,000h,001h,000h,001h,000h	; 8610  ................
	defb 000h,000h,000h,0e6h,0d7h,0f7h,013h,0e0h,0b0h,070h,040h,000h,0f6h,013h,0e0h,0b0h	; 8620  .........p@.....
	defb 070h,040h,000h,0f5h,013h,0e0h,0b0h,070h,040h,000h,0f3h,013h,0e0h,0b0h,070h,0eeh	; 8630  p@.....p@.....p.
	defb 0e3h,070h,090h,0b0h,0e2h,000h,020h,040h,050h,0eeh,0d7h,0f8h,002h,0ech,042h,0e2h	; 8640  .p.... @P.....B.
	defb 007h,0e3h,0a7h,05fh,0e2h,007h,0e3h,0a7h,05bh,0f6h,003h,050h,050h,070h,070h,0e7h	; 8650  ..._....[..PPpp.
	defb 002h,0f9h,051h,0c0h,0edh,0f5h,083h,0e3h,020h,0fbh,041h,0e7h,000h,0ech,000h,0edh	; 8660  ..Q..... .A.....
	defb 0b2h,085h,0edh,0c8h,085h,0f8h,003h,0e3h,093h,0d1h,0f8h,001h,0e4h,093h,0a3h,0b3h	; 8670  ................
	defb 0e3h,003h,013h,023h,033h,0efh,0d9h,085h,0edh,0f2h,085h,0edh,0f2h,085h,0efh,009h	; 8680  ...#3...........
	defb 086h,0edh,0f2h,085h,0edh,0f2h,085h,0efh,009h,086h,000h,000h,001h,001h,000h,001h	; 8690  ................
	defb 000h,001h,000h,000h,000h,000h,0f8h,003h,00dh,0f6h,010h,001h,0e7h,001h,0c1h,0d1h	; 86a0  ................
	defb 0c2h,0edh,024h,086h,040h,0d1h,0f3h,003h,003h,0cdh,0e7h,002h,0d7h,0f7h,000h,0ech	; 86b0  ..$.@...........
	defb 053h,0e1h,001h,020h,044h,072h,026h,000h,0e2h,0b0h,0e1h,003h,042h,0e2h,0b8h,095h	; 86c0  S.. Dr&.....B...
	defb 0b0h,0e1h,000h,022h,002h,021h,045h,050h,0edh,040h,086h,0edh,0c8h,085h,091h,090h	; 86d0  ...".!EP.@......
	defb 090h,0feh,004h,0deh,086h,0edh,0b2h,085h,0eah,0dbh,086h,0d5h,0fah,022h,0edh,047h	; 86e0  .............".G
	defb 087h,0e3h,091h,0b1h,041h,0b1h,091h,0b1h,041h,0b1h,091h,0e2h,011h,0e3h,041h,0e2h	; 86f0  ....A...A.....A.
	defb 011h,0e3h,071h,0e2h,021h,0e3h,021h,0e2h,021h,0edh,047h,087h,0e7h,000h,0e3h,071h	; 8700  ..q.!.!.!.G....q
	defb 0e7h,002h,0e2h,021h,0e3h,021h,0e2h,021h,0fdh,002h,00ch,087h,0e3h,021h,0e2h,021h	; 8710  ...!.!.!.....!.!
	defb 0e3h,061h,0e2h,021h,0e3h,091h,0e2h,021h,0e3h,061h,0e2h,021h,0e3h,041h,0e2h,041h	; 8720  .a.!...!.a.!.A.A
	defb 0e3h,081h,0e2h,041h,0e3h,0b1h,0e2h,041h,0e3h,041h,0e2h,041h,0fah,030h,0e3h,043h	; 8730  ...A...A.A.A.0.C
	defb 041h,063h,083h,091h,0eah,0ebh,086h,0e3h,091h,0e2h,041h,0e3h,041h,0e2h,041h,0fdh	; 8740  Ac........A.A.A.
	defb 002h,047h,087h,0e3h,091h,0e2h,021h,0e3h,041h,0e2h,021h,0e3h,091h,0e2h,011h,0e3h	; 8750  .G....!.A.!.....
	defb 041h,0e2h,011h,0eeh,0d5h,0fbh,031h,0e2h,0c1h,093h,0e1h,013h,041h,091h,041h,0fah	; 8760  A.....1.....A.A.
	defb 033h,073h,071h,063h,061h,0e2h,091h,041h,071h,0e1h,021h,021h,021h,021h,0e2h,071h	; 8770  3sqca..Aq.!!!!.q
	defb 0f9h,041h,0e0h,021h,0fah,033h,0e2h,071h,049h,0fah,045h,0e1h,041h,041h,041h,0f4h	; 8780  .A.!.3.qI.E.AAA.
	defb 010h,041h,0fah,031h,0e2h,093h,0e1h,013h,041h,091h,041h,0fah,021h,0b5h,0e0h,015h	; 8790  .A.1....A.A.!...
	defb 0e1h,043h,071h,0fah,025h,0e2h,071h,071h,071h,0f4h,010h,071h,0fah,031h,061h,071h	; 87a0  .Cq.%.qqq..q.1aq
	defb 0f8h,003h,095h,0b5h,0e1h,013h,0e2h,0b5h,0e1h,015h,023h,0f5h,010h,023h,0f9h,040h	; 87b0  ..........#..#.@
	defb 0e0h,021h,0fbh,041h,0e2h,021h,021h,061h,083h,091h,0eah,064h,087h,0d5h,0fah,031h	; 87c0  .!.A.!!a...d...1
	defb 0e7h,002h,0e2h,0c1h,091h,041h,093h,0e1h,011h,041h,011h,0fah,033h,023h,021h,013h	; 87d0  .....A...A..3#!.
	defb 011h,0e2h,041h,011h,0fah,041h,0e1h,071h,0e0h,021h,021h,021h,021h,0e1h,071h,0fah	; 87e0  ..A..A.q.!!!!.q.
	defb 061h,0e0h,021h,0fah,041h,0e2h,071h,0fah,061h,0e1h,041h,041h,041h,041h,041h,0fah	; 87f0  a.!.A.q.a.AAAAA.
	defb 090h,0e7h,001h,0e0h,041h,041h,041h,0e7h,002h,0f4h,010h,041h,0fah,031h,0e2h,091h	; 8800  ....AAA....A.1..
	defb 041h,093h,0e1h,011h,041h,0fah,031h,011h,023h,021h,013h,011h,043h,0fah,031h,0e1h	; 8810  A...A.1.#!..C.1.
	defb 021h,0fah,025h,0e2h,021h,021h,021h,0f4h,010h,021h,0fah,031h,0e1h,061h,071h,0fah	; 8820  !.%.!!!..!.1.aq.
	defb 031h,0e2h,093h,0f8h,031h,091h,0fah,031h,073h,0f8h,031h,071h,0fah,031h,043h,0b3h	; 8830  1...1..1s.1q.1C.
	defb 0f8h,031h,0b1h,0fah,031h,083h,0f8h,021h,081h,0fah,031h,063h,0f5h,010h,063h,0fah	; 8840  .1..1..!..1c..c.
	defb 031h,0e1h,021h,0e2h,021h,021h,061h,083h,091h,0eah,0cdh,087h,0e4h,090h,0e3h,020h	; 8850  1.!.!!a........
	defb 040h,020h,040h,090h,040h,090h,0e2h,020h,0e3h,090h,0e2h,020h,040h,020h,040h,090h	; 8860  @ @.@.. ... @ @.
	defb 0e6h,0efh,05ch,088h,040h,090h,0e1h,020h,0e2h,090h,0e1h,020h,040h,020h,040h,090h	; 8870  ..\.@.. ... @ @.
	defb 0eeh,040h,090h,0e0h,020h,0e1h,090h,0e0h,020h,040h,090h,040h,0e1h,090h,040h,020h	; 8880  .@.. ... @.@..@
	defb 040h,020h,0e2h,090h,0e1h,020h,0e2h,090h,0eeh,0f8h,003h,0e2h,040h,090h,0e2h,040h	; 8890  @ ... ......@..@
	defb 020h,040h,020h,0e3h,090h,040h,0eeh,0e4h,090h,0e3h,020h,040h,0e3h,090h,0e2h,020h	; 88a0   @ ..@.... @...
	defb 040h,0e2h,090h,0e1h,040h,0eeh,0d6h,0fbh,023h,0ech,042h,0e2h,095h,0f7h,010h,091h	; 88b0  @...@...#.B.....
	defb 0fbh,023h,092h,0b2h,0e1h,001h,04dh,0f6h,010h,041h,0fbh,023h,022h,012h,0eeh,0d3h	; 88c0  .#....M..A.#"...
	defb 0f8h,001h,0edh,071h,088h,0f9h,001h,0edh,081h,088h,0f8h,001h,0edh,099h,088h,0f9h	; 88d0  ...q............
	defb 001h,0edh,0a7h,088h,020h,040h,090h,0e0h,020h,040h,020h,040h,090h,0edh,0b6h,088h	; 88e0  .... @.. @ @....
	defb 0e2h,097h,090h,0b0h,0e1h,003h,023h,0e2h,0b3h,073h,0edh,0b6h,088h,097h,0e1h,090h	; 88f0  ......#..s......
	defb 0b0h,0e0h,003h,023h,0e1h,0b3h,073h,09dh,0f6h,010h,091h,0c5h,0eah,0cah,08ah,0e7h	; 8900  ...#..s.........
	defb 002h,0d3h,0f6h,000h,0e4h,0c0h,0edh,071h,088h,0f7h,000h,0edh,081h,088h,0f6h,000h	; 8910  .......q........
	defb 0edh,099h,088h,0f7h,000h,0edh,0a7h,088h,0f7h,000h,020h,040h,090h,0e0h,020h,040h	; 8920  .......... @.. @
	defb 020h,040h,0e7h,000h,0d6h,0fah,000h,0e4h,093h,0f7h,000h,091h,0f4h,000h,091h,0fch	; 8930   @..............
	defb 031h,042h,072h,091h,074h,0f7h,010h,070h,0fch,031h,071h,0e4h,071h,0f8h,010h,070h	; 8940  1Br.t..p.1q.q..p
	defb 0fch,031h,051h,0f8h,010h,050h,0fch,031h,041h,0fah,000h,0e4h,063h,0f7h,000h,061h	; 8950  .1Q..P.1A...c..a
	defb 0fch,031h,061h,092h,0b2h,0e3h,011h,0e4h,053h,0f7h,010h,051h,0fch,031h,051h,071h	; 8960  .1a.....S..Q.1Qq
	defb 071h,0b1h,0b0h,0b0h,0fch,023h,0e4h,091h,091h,0e4h,010h,020h,040h,0e4h,090h,0f6h	; 8970  q....#..... @...
	defb 010h,090h,0fch,023h,090h,0f6h,010h,090h,0fch,023h,090h,0e4h,040h,080h,091h,0e4h	; 8980  ...#.....#..@...
	defb 071h,071h,0e4h,000h,020h,040h,0e4h,070h,0f6h,010h,070h,0fch,023h,070h,0f6h,010h	; 8990  qq.. @.p..p.#p..
	defb 070h,0fch,023h,070h,0e4h,040h,080h,091h,0e4h,061h,061h,0e5h,090h,0b0h,0e4h,060h	; 89a0  p.#p.@...aa....`
	defb 0e4h,060h,0f6h,010h,060h,0fch,023h,060h,0f6h,010h,060h,0fch,023h,070h,0e4h,020h	; 89b0  .`..`.#`..`.#p.
	defb 040h,061h,0e4h,051h,051h,050h,090h,0e3h,001h,0e4h,071h,071h,070h,0b0h,0e3h,021h	; 89c0  @a.QQP....qqp..!
	defb 0e4h,09dh,0f6h,010h,091h,0c5h,0eah,068h,08bh,0e7h,001h,0d3h,0f9h,004h,0e5h,090h	; 89d0  .......h........
	defb 0e4h,020h,040h,020h,040h,090h,040h,090h,0e3h,020h,0efh,05ch,088h,0fah,005h,040h	; 89e0  . @ @.@.. .\...@
	defb 090h,0e1h,020h,0e2h,090h,0e1h,020h,040h,090h,040h,0e2h,090h,040h,020h,040h,020h	; 89f0  .. ... @.@..@ @
	defb 0e3h,090h,0e2h,020h,0e3h,090h,0f9h,004h,0e3h,040h,090h,0e3h,040h,020h,040h,020h	; 8a00  ... .....@..@ @
	defb 0e4h,090h,040h,0fah,005h,0e5h,090h,0e4h,020h,040h,0e4h,090h,0e3h,020h,040h,0e3h	; 8a10  ..@..... @... @.
	defb 090h,0e2h,040h,020h,040h,090h,0e1h,020h,040h,020h,040h,090h,0e7h,002h,0d3h,0f9h	; 8a20  ..@ @.. @ @.....
	defb 020h,0edh,071h,088h,0edh,081h,088h,0edh,099h,088h,0edh,0a7h,088h,0e1h,020h,040h	; 8a30   .q........... @
	defb 090h,0e0h,020h,040h,020h,040h,090h,0edh,071h,088h,0edh,081h,088h,0edh,099h,088h	; 8a40  .. @ @..q.......
	defb 0f9h,010h,0e4h,091h,0b1h,0fah,010h,0e3h,001h,021h,0fbh,010h,041h,051h,071h,091h	; 8a50  .........!..AQq.
	defb 0e7h,001h,0d6h,0fbh,023h,0ech,042h,0e2h,045h,0f6h,010h,041h,0fbh,023h,042h,072h	; 8a60  ....#.B.E..A.#Br
	defb 091h,073h,0f7h,010h,071h,0fbh,023h,071h,0fah,021h,0ech,051h,0e2h,072h,052h,041h	; 8a70  .s..q.#q.!.Q.rRA
	defb 0fbh,023h,0ech,000h,0e3h,095h,091h,092h,0b2h,0e2h,011h,0e2h,093h,093h,073h,073h	; 8a80  .#............ss
	defb 0e2h,04dh,0f6h,010h,041h,0c5h,0eah,0f4h,08bh,0d6h,0fah,021h,0ech,053h,0e2h,092h	; 8a90  .M..A......!.S..
	defb 0f6h,010h,090h,0fah,021h,0e1h,002h,0f6h,010h,000h,0fah,021h,042h,0f6h,010h,040h	; 8aa0  ....!......!B..@
	defb 0fah,021h,092h,0f6h,010h,090h,0eeh,0fah,021h,0ech,045h,072h,0f6h,010h,070h,0f7h	; 8ab0  .!......!.Er..p.
	defb 011h,070h,0f3h,000h,070h,0fah,023h,030h,030h,0eeh,0edh,099h,08ah,0edh,0b7h,08ah	; 8ac0  .p..p.#00.......
	defb 034h,0f6h,010h,030h,0f7h,011h,030h,0f3h,000h,030h,0edh,099h,08ah,0fah,021h,0ech	; 8ad0  4..0..0..0....!.
	defb 045h,0a2h,0f6h,010h,0a0h,0f7h,011h,0a0h,0f3h,000h,0a0h,0fah,023h,050h,050h,054h	; 8ae0  E...........#PPT
	defb 0f6h,010h,050h,0f7h,011h,050h,0f3h,000h,050h,0edh,099h,08ah,0edh,0b7h,08ah,033h	; 8af0  ..P..P..P......3
	defb 0f6h,010h,030h,0f3h,000h,030h,0fah,023h,070h,050h,044h,0f6h,010h,040h,0fah,023h	; 8b00  ..0..0.#pPD..@.#
	defb 050h,030h,044h,0f6h,010h,040h,0fah,023h,050h,030h,0f8h,003h,0ech,046h,043h,023h	; 8b10  P0D..@.#P0...FC#
	defb 0f9h,005h,003h,0e2h,0b3h,0eah,0cah,08ah,0d6h,0fah,021h,0e4h,090h,090h,090h,0f6h	; 8b20  ..........!.....
	defb 010h,090h,0fah,021h,0e3h,001h,0e4h,090h,090h,0f6h,010h,090h,0fah,021h,090h,0f6h	; 8b30  ...!.........!..
	defb 010h,090h,0fah,021h,090h,0e3h,000h,040h,091h,0e4h,0a0h,0a0h,0a0h,0f6h,010h,0a0h	; 8b40  ...!...@........
	defb 0eeh,0fah,021h,0e3h,031h,0e4h,0a0h,0a0h,0f6h,010h,0a0h,0fah,021h,0a0h,0f6h,010h	; 8b50  ..!.1.......!...
	defb 0a0h,0fah,021h,0a0h,0e3h,030h,070h,0eeh,0edh,028h,08bh,0edh,051h,08bh,0a1h,0edh	; 8b60  ..!..0p..(..Q...
	defb 028h,08bh,0fah,021h,0e3h,021h,0e4h,0a0h,0a0h,0f6h,010h,0a0h,0fah,021h,0a0h,0f6h	; 8b70  (..!.!.......!..
	defb 010h,0a0h,0fah,021h,0a0h,0e3h,020h,050h,0a1h,0edh,028h,08bh,0edh,051h,08bh,0e8h	; 8b80  ...!.. P..(..Q..
	defb 001h,050h,050h,0e8h,080h,0fbh,031h,0e4h,0c1h,040h,040h,041h,0e8h,001h,050h,050h	; 8b90  .PP...1..@@A..PP
	defb 0e8h,080h,0fbh,031h,0c1h,040h,040h,041h,0e8h,001h,000h,000h,0e8h,080h,0fah,022h	; 8ba0  ...1.@@A......."
	defb 041h,040h,040h,021h,020h,020h,0fbh,031h,001h,000h,000h,0e5h,0b1h,0b0h,0b0h,0eah	; 8bb0  A@@!  .1........
	defb 068h,08bh,0d6h,0fah,021h,0ech,053h,0e2h,042h,0f6h,010h,040h,0fah,021h,092h,0f6h	; 8bc0  h...!.S.B..@.!..
	defb 010h,090h,0fah,021h,0e1h,002h,0f6h,010h,000h,0fah,021h,042h,0f6h,010h,040h,0eeh	; 8bd0  ...!......!B..@.
	defb 0fah,021h,0ech,045h,032h,0f6h,010h,030h,0f7h,011h,030h,0f3h,000h,030h,0fah,023h	; 8be0  .!.E2..0..0..0.#
	defb 0e2h,0a0h,0a0h,0eeh,0edh,0c2h,08bh,0edh,0e0h,08bh,0a4h,0f6h,010h,0a0h,0f7h,011h	; 8bf0  ................
	defb 0a0h,0f3h,000h,0a0h,0edh,0c2h,08bh,0fah,023h,0ech,055h,052h,0f6h,010h,050h,0f7h	; 8c00  ........#.UR..P.
	defb 011h,050h,0f3h,000h,050h,0fah,023h,0ech,053h,020h,020h,024h,0f6h,010h,020h,0f7h	; 8c10  .P..P.#.S  $.. .
	defb 011h,020h,0f3h,000h,020h,0edh,0c2h,08bh,0edh,0e0h,08bh,0a3h,0f6h,010h,0a0h,0f3h	; 8c20  . .. ...........
	defb 000h,0a0h,0fah,023h,0a0h,0a0h,084h,0f6h,010h,080h,0fah,023h,080h,080h,084h,0f6h	; 8c30  ...#.......#....
	defb 010h,080h,0fah,023h,080h,080h,0f8h,001h,0ech,046h,081h,0e8h,002h,040h,040h,0e8h	; 8c40  ...#.....F...@@.
	defb 080h,0f8h,001h,051h,0e8h,002h,020h,020h,0e8h,080h,0f8h,001h,041h,0e8h,002h,000h	; 8c50  ...Q..  ....A...
	defb 000h,0e8h,080h,0f8h,001h,021h,0e8h,003h,0b0h,0b0h,0e8h,080h,0eah,0f4h,08bh,0edh	; 8c60  .....!..........
	defb 0beh,08ch,080h,090h,0e1h,000h,040h,050h,050h,040h,040h,001h,0e2h,091h,0edh,0b1h	; 8c70  ......@PP@@.....
	defb 08ch,0d6h,0fah,013h,0e4h,051h,050h,050h,0fdh,003h,085h,08ch,051h,0d4h,081h,061h	; 8c80  .....QPP....Q..a
	defb 041h,021h,041h,0fbh,023h,087h,0cfh,0ffh,0e7h,002h,0edh,0beh,08ch,0e7h,000h,050h	; 8c90  A!A.#..........P
	defb 050h,090h,0e1h,000h,000h,000h,000h,000h,0e3h,050h,091h,0a0h,0e7h,002h,0d4h,0e1h	; 8ca0  P........P......
	defb 020h,0d4h,0e1h,021h,001h,0e2h,0a1h,081h,061h,0ech,03ah,027h,0cfh,0ffh,0d6h,0fah	; 8cb0   ..!....a.:'....
	defb 013h,0e2h,051h,0eeh,0d7h,0fah,010h,0ech,053h,0e2h,094h,0b0h,0e1h,000h,090h,073h	; 8cc0  ..Q.....S......s
	defb 023h,045h,000h,040h,0d8h,021h,001h,0e2h,0b1h,0e1h,021h,0d2h,0f8h,000h,0e2h,090h	; 8cd0  #E.@.!....!.....
	defb 0a0h,0b0h,0e1h,000h,0d9h,0fah,010h,0ech,064h,019h,0f7h,040h,010h,0ffh,0d7h,0f9h	; 8ce0  ........d..@....
	defb 002h,0e2h,050h,040h,051h,050h,070h,090h,0e1h,040h,020h,040h,020h,000h,0e2h,0b0h	; 8cf0  ..P@QPp..@ @ ...
	defb 090h,070h,040h,090h,0b0h,0e1h,000h,0e2h,0b0h,090h,070h,040h,070h,0d8h,0b0h,0e1h	; 8d00  .p@.......p@p...
	defb 000h,0e2h,0b0h,090h,070h,040h,020h,070h,0d2h,0f8h,000h,000h,010h,020h,030h,0d9h	; 8d10  ....p@ p..... 0.
	defb 0f9h,010h,049h,0f6h,040h,040h,0ffh,0d7h,0fbh,022h,0e4h,021h,021h,020h,021h,020h	; 8d20  ..I.@@...".!! !
	defb 041h,040h,040h,040h,041h,040h,051h,051h,051h,050h,050h,0d8h,071h,071h,070h,070h	; 8d30  A@@@A@QQQPP.qqpp
	defb 070h,070h,0d9h,0fbh,020h,099h,0d8h,0f9h,000h,090h,0d9h,0f6h,040h,090h,0ffh	; 8d40  pp.. .......@..

; ----------------------------------------------------------------------
; DATOS instrumentos: 11 palabras: la lista de envolventes de cada instrumento
;   (p13:62D3: p14:8D4F[(ix+8)]), ventanas sobre p14:8D65; lo leen p13:62CC
;   (22 bytes)
;   0x8d4f..0x8d65  (22 bytes)
DATA_instrumentos:
	defb 065h,08dh	; 8d4f
	defb 065h,08dh	; 8d51
	defb 095h,08dh	; 8d53
	defb 07dh,08dh	; 8d55
	defb 095h,08dh	; 8d57
	defb 07dh,08dh	; 8d59
	defb 0adh,08dh	; 8d5b
	defb 0adh,08dh	; 8d5d
	defb 0adh,08dh	; 8d5f
	defb 0b1h,08dh	; 8d61
	defb 0c9h,08dh	; 8d63

; ----------------------------------------------------------------------
; DATOS envolventes_por_altura: 64 palabras: la envolvente de cada altura
;   (p13:6308: + (nota >> 3)), compartidas por los instrumentos; lo leen
;   p13:62CC (128 bytes)
;   0x8d65..0x8de5  (128 bytes)
DATA_envolventes_por_altura:
	defb 0e5h,08dh	; 8d65
	defb 0ebh,08dh	; 8d67
	defb 0feh,08dh	; 8d69
	defb 014h,08eh	; 8d6b
	defb 022h,08eh	; 8d6d
	defb 023h,08eh	; 8d6f
	defb 04ch,08eh	; 8d71
	defb 075h,08eh	; 8d73
	defb 09eh,08eh	; 8d75
	defb 0cdh,08eh	; 8d77
	defb 0fch,08eh	; 8d79
	defb 027h,08fh	; 8d7b
	defb 082h,08fh	; 8d7d
	defb 082h,08fh	; 8d7f
	defb 082h,08fh	; 8d81
	defb 082h,08fh	; 8d83
	defb 082h,08fh	; 8d85
	defb 082h,08fh	; 8d87
	defb 082h,08fh	; 8d89
	defb 082h,08fh	; 8d8b
	defb 082h,08fh	; 8d8d
	defb 082h,08fh	; 8d8f
	defb 082h,08fh	; 8d91
	defb 082h,08fh	; 8d93
	defb 036h,08fh	; 8d95
	defb 049h,08fh	; 8d97
	defb 049h,08fh	; 8d99
	defb 05ch,08fh	; 8d9b
	defb 05ch,08fh	; 8d9d
	defb 06fh,08fh	; 8d9f
	defb 06fh,08fh	; 8da1
	defb 06fh,08fh	; 8da3
	defb 06fh,08fh	; 8da5
	defb 06fh,08fh	; 8da7
	defb 082h,08fh	; 8da9
	defb 082h,08fh	; 8dab
	defb 095h,08fh	; 8dad
	defb 0b0h,08fh	; 8daf
	defb 0cbh,08fh	; 8db1
	defb 0e6h,08fh	; 8db3
	defb 001h,090h	; 8db5
	defb 01ch,090h	; 8db7
	defb 037h,090h	; 8db9
	defb 052h,090h	; 8dbb
	defb 06dh,090h	; 8dbd
	defb 088h,090h	; 8dbf
	defb 0a3h,090h	; 8dc1
	defb 0beh,090h	; 8dc3
	defb 0d9h,090h	; 8dc5
	defb 0f4h,090h	; 8dc7
	defb 00fh,091h	; 8dc9
	defb 02ah,091h	; 8dcb
	defb 045h,091h	; 8dcd
	defb 060h,091h	; 8dcf
	defb 07bh,091h	; 8dd1
	defb 096h,091h	; 8dd3
	defb 0b1h,091h	; 8dd5
	defb 0cch,091h	; 8dd7
	defb 0e7h,091h	; 8dd9
	defb 002h,092h	; 8ddb
	defb 01dh,092h	; 8ddd
	defb 038h,092h	; 8ddf
	defb 053h,092h	; 8de1
	defb 06eh,092h	; 8de3

; ----------------------------------------------------------------------
; DATOS envolvente_8DE5: envolvente o efecto (p13:6506), recorrido desde
;   p13:66C4, 670E y p14:8D65; lo leen p13:6506 (1188 bytes)
;   0x8de5..0x9289  (1188 bytes)
DATA_envolvente_8DE5:
	defb 021h,001h,010h,0a0h,000h,0ffh,023h,001h,010h,0bah,000h,021h,003h,010h,090h,000h	; 8de5  !.....#....!....
	defb 080h,000h,070h,000h,060h,000h,050h,000h,0ffh,021h,001h,015h,0b0h,006h,022h,001h	; 8df5  ..p.`.P..!....".
	defb 0b2h,000h,021h,002h,018h,070h,006h,060h,006h,021h,001h,013h,060h,006h,0ffh,023h	; 8e05  ..!..p.`.!..`..#
	defb 001h,013h,0c1h,0a0h,022h,001h,0c2h,000h,092h,070h,073h,030h,0ffh,0ffh,022h,001h	; 8e15  ...."....ps0..".
	defb 0b1h,000h,0a1h,00ah,0a1h,015h,091h,020h,091h,02ah,091h,035h,081h,040h,081h,04ah	; 8e25  ....... .*.5.@.J
	defb 081h,055h,081h,060h,071h,06ah,071h,075h,071h,080h,071h,08ah,071h,095h,071h,0a0h	; 8e35  .U.`qjquq.q.q.q.
	defb 061h,0aah,061h,0b5h,051h,0c0h,0ffh,022h,001h,0b1h,050h,0a1h,05ah,0a1h,065h,091h	; 8e45  a.a.Q.."..P.Z.e.
	defb 070h,091h,07ah,091h,085h,081h,090h,081h,09ah,081h,0a5h,081h,0b0h,071h,0bah,071h	; 8e55  p.z..........q.q
	defb 0c5h,071h,0d0h,071h,0dah,071h,0e5h,071h,0f0h,061h,0fah,062h,025h,052h,030h,0ffh	; 8e65  .q.q.q.q.a.b%R0.
	defb 022h,001h,0b1h,0a0h,0a1h,0aah,0a1h,0b5h,091h,0c0h,091h,0cah,091h,0d5h,081h,0e0h	; 8e75  "...............
	defb 081h,0eah,081h,0f5h,082h,000h,072h,00ah,072h,015h,072h,020h,072h,02ah,072h,035h	; 8e85  ......r.r.r r*r5
	defb 072h,040h,062h,04ah,062h,055h,052h,060h,0ffh,022h,001h,0c2h,000h,0b2h,00ah,0b2h	; 8e95  r@bJbUR`."......
	defb 015h,0a2h,020h,0a2h,02ah,0a2h,035h,092h,040h,092h,04ah,092h,055h,092h,060h,082h	; 8ea5  .. .*.5.@.J.U.`.
	defb 06ah,082h,075h,082h,080h,082h,08ah,082h,095h,072h,0a0h,072h,0aah,072h,0b5h,072h	; 8eb5  j.u......r.r.r.r
	defb 0c0h,062h,0cah,062h,0d5h,052h,0e0h,0ffh,022h,001h,0d3h,000h,0c3h,00ah,0c3h,015h	; 8ec5  .b.b.R..".......
	defb 0b3h,020h,0b3h,02ah,0b3h,035h,0a3h,040h,0a3h,04ah,0a3h,055h,0a3h,060h,093h,06ah	; 8ed5  . .*.5.@.J.U.`.j
	defb 093h,075h,093h,080h,093h,08ah,093h,095h,083h,0a0h,083h,0aah,083h,0b5h,073h,0c0h	; 8ee5  .u............s.
	defb 073h,0cah,063h,0d5h,053h,0e0h,0ffh,022h,001h,0e4h,000h,0d4h,015h,0c4h,030h,0c4h	; 8ef5  s.c.S.."......0.
	defb 045h,0b4h,060h,0b4h,075h,0b4h,090h,0a4h,0b0h,0a4h,0d0h,0a4h,0f0h,0a5h,010h,095h	; 8f05  E.`.u...........
	defb 030h,095h,050h,094h,070h,094h,090h,094h,0b0h,084h,0d0h,084h,0f0h,075h,010h,065h	; 8f15  0.P.p........u.e
	defb 030h,0ffh,02ah,001h,003h,000h,093h,0d0h,02eh,001h,096h,000h,097h,000h,098h,000h	; 8f25  0.*.............
	defb 0ffh,022h,004h,0a0h,036h,090h,036h,080h,036h,070h,036h,060h,036h,050h,036h,040h	; 8f35  ."..6.6.6p6`6P6@
	defb 036h,040h,036h,0ffh,022h,004h,0a0h,02fh,090h,02fh,080h,02fh,070h,02fh,060h,02fh	; 8f45  6@6."../././p/`/
	defb 050h,02fh,040h,02fh,040h,02fh,0ffh,022h,004h,0a0h,02ah,090h,02ah,080h,02ah,070h	; 8f55  P/@/@/."..*.*.*p
	defb 02ah,060h,02ah,050h,02ah,040h,02ah,040h,02ah,0ffh,022h,004h,0a0h,020h,090h,020h	; 8f65  *`*P*@*@*.".. .
	defb 080h,020h,070h,020h,060h,020h,050h,020h,040h,020h,040h,020h,0ffh,022h,004h,0a0h	; 8f75  . p ` P @ @ ."..
	defb 039h,090h,039h,080h,039h,070h,039h,060h,039h,050h,039h,040h,039h,040h,039h,0ffh	; 8f85  9.9.9p9`9P9@9@9.
	defb 022h,001h,0b0h,0e6h,090h,0ebh,022h,004h,080h,0f0h,070h,0f0h,060h,0e7h,050h,0edh	; 8f95  "....."...p.`.P.
	defb 022h,00ah,040h,0f0h,040h,0f0h,030h,0f0h,030h,0f0h,0ffh,022h,001h,0b0h,0d8h,090h	; 8fa5  ".@.@.0.0.."....
	defb 0ddh,022h,004h,080h,0e2h,070h,0e2h,060h,0d9h,050h,0dfh,022h,00ah,040h,0e2h,040h	; 8fb5  ."...p.`.P.".@.@
	defb 0e2h,030h,0e2h,030h,0e2h,0ffh,022h,001h,0b0h,0cch,090h,0d1h,022h,004h,080h,0d6h	; 8fc5  .0.0.."....."...
	defb 070h,0d6h,060h,0cdh,050h,0d3h,022h,00ah,040h,0d6h,040h,0d6h,030h,0d6h,030h,0d6h	; 8fd5  p.`.P.".@.@.0.0.
	defb 0ffh,022h,001h,0a0h,0c0h,080h,0c5h,022h,004h,070h,0cah,060h,0cah,050h,0c2h,040h	; 8fe5  .".....".p.`.P.@
	defb 0c8h,022h,00ah,030h,0cah,030h,0cah,030h,0cah,030h,0cah,0ffh,022h,001h,0a0h,0b4h	; 8ff5  .".0.0.0.0.."...
	defb 080h,0b9h,022h,004h,070h,0beh,060h,0beh,050h,0b5h,040h,0bch,022h,00ah,030h,0beh	; 9005  ..".p.`.P.@.".0.
	defb 030h,0beh,030h,0beh,030h,0beh,0ffh,022h,001h,0a0h,0aah,080h,0afh,022h,004h,070h	; 9015  0.0.0..".....".p
	defb 0b4h,060h,0b4h,050h,0ach,040h,0b1h,022h,00ah,030h,0b4h,030h,0b4h,030h,0b4h,030h	; 9025  .`.P.@.".0.0.0.0
	defb 0b4h,0ffh,022h,001h,0a0h,0a0h,080h,0a5h,022h,004h,070h,0aah,060h,0aah,050h,0a2h	; 9035  ..".....".p.`.P.
	defb 040h,0a8h,022h,00ah,030h,0aah,030h,0aah,030h,0aah,030h,0aah,0ffh,022h,001h,0a0h	; 9045  @.".0.0.0.0.."..
	defb 095h,080h,09ch,022h,004h,070h,0a0h,060h,0a0h,050h,097h,040h,09eh,022h,00ah,030h	; 9055  ...".p.`.P.@.".0
	defb 0a0h,030h,0a0h,030h,0a0h,030h,0a0h,0ffh,022h,001h,0a0h,08ch,080h,093h,022h,004h	; 9065  .0.0.0..".....".
	defb 070h,097h,060h,097h,050h,090h,040h,095h,022h,00ah,030h,097h,030h,097h,030h,097h	; 9075  p.`.P.@.".0.0.0.
	defb 030h,097h,0ffh,022h,001h,0a0h,084h,080h,08bh,022h,004h,070h,08fh,060h,08fh,050h	; 9085  0..".....".p.`.P
	defb 086h,040h,08dh,022h,00ah,030h,08fh,030h,08fh,030h,08fh,030h,08fh,0ffh,022h,001h	; 9095  .@.".0.0.0.0..".
	defb 0a0h,07ch,080h,082h,022h,004h,070h,087h,060h,087h,050h,080h,040h,085h,022h,00ah	; 90a5  .|..".p.`.P.@.".
	defb 030h,087h,030h,087h,030h,087h,030h,087h,0ffh,022h,001h,0a0h,075h,080h,07bh,022h	; 90b5  0.0.0.0.."..u.{"
	defb 004h,070h,07fh,060h,07fh,050h,078h,040h,07dh,022h,00ah,030h,07fh,030h,07fh,030h	; 90c5  .p.`.Px@}".0.0.0
	defb 07fh,030h,07fh,0ffh,022h,001h,0a0h,06eh,080h,074h,022h,004h,070h,078h,060h,078h	; 90d5  .0.."..n.t".px`x
	defb 050h,072h,040h,077h,022h,00ah,030h,078h,030h,078h,030h,078h,030h,078h,0ffh,022h	; 90e5  Pr@w".0x0x0x0x."
	defb 001h,0a0h,067h,090h,06dh,022h,004h,070h,071h,060h,071h,050h,06ah,040h,06fh,022h	; 90f5  ..g.m".pq`qPj@o"
	defb 00ah,030h,071h,030h,071h,030h,071h,030h,071h,0ffh,022h,001h,0a0h,061h,080h,066h	; 9105  .0q0q0q0q."..a.f
	defb 022h,004h,070h,06bh,060h,06bh,050h,066h,040h,069h,022h,00ah,030h,06bh,030h,06bh	; 9115  ".pk`kPf@i".0k0k
	defb 030h,06bh,030h,06bh,0ffh,022h,001h,0a0h,05bh,080h,060h,022h,004h,070h,065h,060h	; 9125  0k0k."..[.`".pe`
	defb 065h,050h,05fh,040h,063h,022h,00ah,030h,065h,030h,065h,030h,065h,030h,065h,0ffh	; 9135  eP_@c".0e0e0e0e.
	defb 022h,001h,0a0h,055h,080h,05ah,022h,004h,070h,05fh,060h,05fh,050h,05ah,040h,05dh	; 9145  "..U.Z".p_`_PZ@]
	defb 022h,00ah,030h,05fh,030h,05fh,030h,05fh,030h,05fh,0ffh,022h,001h,0a0h,050h,080h	; 9155  ".0_0_0_0_."..P.
	defb 055h,022h,004h,070h,05ah,070h,05ah,050h,055h,040h,058h,022h,00ah,030h,05ah,030h	; 9165  U".pZpZPU@X".0Z0
	defb 05ah,030h,05ah,030h,05ah,0ffh,022h,001h,0a0h,04bh,080h,050h,022h,004h,070h,055h	; 9175  Z0Z0Z."..K.P".pU
	defb 060h,055h,050h,052h,040h,054h,022h,00ah,030h,055h,030h,055h,030h,055h,030h,055h	; 9185  `UPR@T".0U0U0U0U
	defb 0ffh,022h,001h,0a0h,046h,080h,04bh,022h,004h,070h,050h,060h,050h,050h,04dh,040h	; 9195  ."..F.K".pP`PPM@
	defb 04fh,022h,00ah,030h,050h,030h,050h,030h,050h,030h,050h,0ffh,022h,001h,0a0h,042h	; 91a5  O".0P0P0P0P."..B
	defb 080h,047h,022h,004h,070h,04ch,060h,04ch,050h,049h,040h,04bh,022h,00ah,030h,04ch	; 91b5  .G".pL`LPI@K".0L
	defb 030h,04ch,030h,04ch,030h,04ch,0ffh,022h,001h,0a0h,03dh,080h,042h,022h,004h,070h	; 91c5  0L0L0L."..=.B".p
	defb 047h,060h,047h,050h,044h,040h,046h,022h,00ah,030h,047h,030h,047h,030h,047h,030h	; 91d5  G`GPD@F".0G0G0G0
	defb 047h,0ffh,022h,001h,0a0h,039h,080h,03eh,022h,004h,070h,043h,060h,043h,050h,040h	; 91e5  G."..9.>".pC`CP@
	defb 040h,042h,022h,00ah,030h,043h,030h,043h,030h,043h,030h,043h,0ffh,022h,001h,0a0h	; 91f5  @B".0C0C0C0C."..
	defb 036h,080h,03bh,022h,004h,070h,040h,060h,040h,050h,03dh,040h,03fh,022h,00ah,030h	; 9205  6..".p@`@P=@?".0
	defb 040h,030h,040h,030h,040h,030h,040h,0ffh,022h,001h,0a0h,032h,080h,037h,022h,004h	; 9215  @0@0@0@."..2.7".
	defb 070h,03ch,060h,03ch,050h,039h,040h,03bh,022h,00ah,030h,03ch,030h,03ch,030h,03ch	; 9225  p<`<P9@.".0<0<0<
	defb 030h,03ch,0ffh,022h,001h,0a0h,02fh,080h,034h,022h,004h,070h,039h,060h,039h,050h	; 9235  0<."../.4".p9`9P
	defb 036h,040h,038h,022h,00ah,030h,039h,030h,039h,030h,039h,030h,039h,0ffh,022h,001h	; 9245  6@8".09090909.".
	defb 0a0h,02ch,080h,031h,022h,004h,070h,036h,060h,036h,050h,034h,040h,035h,022h,00ah	; 9255  .,.1".p6`6P4@5".
	defb 030h,036h,030h,036h,030h,036h,030h,036h,0ffh,022h,001h,0a0h,028h,080h,02dh,022h	; 9265  06060606."..(.-"
	defb 004h,070h,032h,060h,032h,050h,030h,040h,031h,022h,00ah,030h,032h,030h,032h,030h	; 9275  .p2`2P0@1".02020
	defb 032h,030h,032h,0ffh	; 9285

; ----------------------------------------------------------------------
; DATOS fuente: RLE (L_5578): 156 caracteres de 1 bit (8 bytes) que p00:50D4
;   pinta con L_4CBF en (0, 0x40) de la pagina 0; lo leen p00:50C1 (1155
;   bytes)
;   0x9289..0x970c  (1155 bytes)
DATA_fuente:
	defb 009h,000h,08ah,07ch,0c6h,0e6h,0d6h,0ceh,0c6h,07ch,000h,018h,038h,004h,018h,0d4h	; 9289  ...|.....|..8...
	defb 03ch,000h,07ch,0c6h,006h,01ch,070h,0e2h,0feh,000h,07ch,0c6h,006h,03ch,006h,0c6h	; 9299  <.|...p...|..<..
	defb 07ch,000h,00ch,01ch,02ch,04ch,0feh,00ch,01eh,000h,0fch,0c0h,0c0h,0fch,006h,086h	; 92a9  |...,L..........
	defb 07ch,000h,07ch,0c6h,0c0h,0fch,0c6h,0c6h,07ch,000h,0feh,0c6h,006h,00ch,018h,030h	; 92b9  |.|.....|......0
	defb 030h,000h,07ch,0c6h,0c6h,07ch,0c6h,0c6h,07ch,000h,07ch,0c6h,0c6h,07eh,006h,0c6h	; 92c9  0.|..|..|.|..~..
	defb 07ch,000h,018h,02ch,046h,07eh,046h,046h,0efh,000h,0fch,066h,066h,07ch,066h,066h	; 92d9  |..,F~FF...ff|ff
	defb 0fch,000h,07ah,0c6h,003h,0c0h,084h,0c2h,07ch,000h,0fch,005h,066h,0a3h,0fch,000h	; 92e9  ..z.....|...f...
	defb 0feh,062h,068h,078h,068h,062h,0feh,000h,0feh,062h,068h,078h,068h,060h,0f0h,000h	; 92f9  .bhxhb...bhxh`..
	defb 07ah,0c6h,0c0h,0ceh,0c6h,0c6h,07ch,000h,0deh,04ch,04ch,07ch,04ch,04ch,0deh,000h	; 9309  z.....|..LL|LL..
	defb 03ch,005h,018h,083h,03ch,000h,01eh,003h,00ch,002h,08ch,08bh,078h,000h,0f6h,064h	; 9319  <...<.......x..d
	defb 068h,078h,06ch,066h,0f7h,000h,0f0h,004h,060h,094h,062h,0feh,000h,0c7h,06eh,07eh	; 9329  hxlf....`.b...n~
	defb 056h,046h,046h,0efh,000h,0cfh,066h,076h,07eh,05eh,04eh,0e6h,000h,07ch,005h,0c6h	; 9339  VFF...fv~^N..|..
	defb 083h,07ch,000h,0fch,003h,066h,085h,07ch,060h,0f0h,000h,07ch,003h,0c6h,096h,0f6h	; 9349  .|...f.|`..|....
	defb 0cch,076h,000h,0fch,066h,066h,07ch,078h,06ch,0e6h,000h,07ah,0c6h,0c0h,07ch,006h	; 9359  .v..ff|xl..z..|.
	defb 0c6h,0bch,000h,07eh,099h,004h,018h,083h,03ch,000h,0efh,005h,046h,09dh,03ch,000h	; 9369  ...~....<...F.<.
	defb 0efh,046h,046h,02ch,02ch,018h,018h,000h,0ceh,086h,0b6h,0b6h,056h,06ch,06ch,000h	; 9379  .FF,,.......Vll.
	defb 0efh,046h,02ch,018h,034h,062h,0f7h,000h,0efh,046h,02ch,003h,018h,091h,03ch,000h	; 9389  .F,.4b...F,...<.
	defb 0feh,08eh,01ch,038h,070h,0e2h,0feh,000h,038h,044h,09ah,0a2h,09ah,044h,038h,003h	; 9399  ...8p...8D...D8.
	defb 000h,0d8h,03ch,042h,07ch,040h,03eh,000h,008h,01ch,01ch,008h,008h,000h,008h,000h	; 93a9  ..<B|@>.........
	defb 03eh,063h,063h,00eh,008h,000h,008h,000h,010h,078h,020h,03ch,06ah,0b2h,064h,000h	; 93b9  >cc......x <j.d.
	defb 000h,080h,084h,082h,082h,080h,040h,000h,03ch,000h,01ch,062h,002h,002h,01ch,000h	; 93c9  ......@.<..b....
	defb 03ch,000h,01ch,064h,008h,018h,06eh,000h,024h,07ah,020h,03ch,062h,0a2h,06ch,000h	; 93d9  <..d..n.$z <b.l.
	defb 008h,044h,072h,0cah,048h,048h,050h,000h,010h,07ch,008h,07eh,004h,040h,03ch,000h	; 93e9  .Dr.HHP..|.~.@<.
	defb 008h,010h,020h,040h,020h,010h,008h,000h,084h,0beh,004h,084h,093h,048h,000h,078h	; 93f9  .. @ ........H.x
	defb 004h,008h,000h,000h,040h,03ch,000h,010h,07ch,008h,004h,000h,040h,03ch,000h,040h	; 9409  ....@<..|...@<.@
	defb 004h,020h,0ffh,022h,01ch,000h,008h,0feh,018h,028h,018h,008h,030h,000h,048h,048h	; 9419  . .".....(..0.HH
	defb 0feh,048h,048h,040h,03ch,000h,04ch,034h,008h,0feh,010h,020h,01ch,000h,040h,060h	; 9429  .HH@<.L4... ..@`
	defb 0ceh,040h,040h,050h,08eh,000h,010h,07eh,010h,03ch,062h,002h,01ch,000h,000h,01ch	; 9439  .@@P...~.<b.....
	defb 0e2h,002h,002h,004h,018h,000h,000h,0feh,008h,010h,020h,020h,01ch,000h,040h,026h	; 9449  ..........  ..@&
	defb 038h,020h,040h,040h,03eh,000h,044h,0f2h,044h,044h,09ch,026h,018h,000h,040h,04eh	; 9459  8 @@>.D.DD.&..@N
	defb 050h,040h,040h,050h,02eh,000h,050h,05ch,072h,052h,0d6h,0aah,064h,000h,020h,02ch	; 9469  P@@P..P\rR..d. ,
	defb 0f2h,022h,066h,06ah,0a4h,000h,038h,054h,092h,092h,0a2h,0a2h,044h,000h,084h,0beh	; 9479  ."fj..8T....D...
	defb 084h,084h,09ch,0a6h,058h,000h,000h,0e4h,026h,044h,084h,088h,070h,000h,030h,008h	; 9489  ....X...&D..p.0.
	defb 010h,054h,002h,08ah,081h,030h,003h,000h,0ffh,060h,050h,088h,006h,000h,000h,0beh	; 9499  .T...0...`P.....
	defb 084h,0beh,084h,09ch,0a6h,058h,008h,07ch,008h,07ch,008h,038h,04ch,030h,000h,070h	; 94a9  .....X.|.|.8L0.p
	defb 014h,014h,07eh,094h,0a4h,048h,000h,020h,0f4h,022h,060h,0a4h,044h,038h,000h,050h	; 94b9  ..~..H. ."`.D8.P
	defb 05ch,072h,052h,0d2h,0a2h,064h,000h,020h,078h,020h,078h,020h,022h,01ch,000h,010h	; 94c9  \rR..d. x x "...
	defb 04ch,052h,0e2h,024h,010h,008h,000h,020h,0bch,0d2h,092h,092h,094h,020h,000h,008h	; 94d9  LR.$... ..... ..
	defb 00eh,008h,008h,038h,04ch,032h,000h,030h,00ch,040h,05ch,062h,002h,03ch,000h,024h	; 94e9  ...8L2.0.@\b.<.$
	defb 042h,042h,052h,022h,004h,038h,000h,03ch,008h,01ch,062h,012h,02ah,03ch,000h,024h	; 94f9  BBR".8.<..b.*<.$
	defb 02ch,0f4h,024h,064h,064h,0a2h,000h,03ch,008h,01ch,062h,002h,002h,03ch,000h,020h	; 9509  ,.$dd..<..b..<.
	defb 02ch,0f2h,022h,062h,062h,0a4h,000h,010h,08eh,07ch,020h,03ch,048h,040h,03ch,000h	; 9519  ,."bb....| <H@<.
	defb 010h,020h,020h,070h,052h,092h,08ch,004h,000h,084h,01ch,062h,002h,00ch,003h,000h	; 9529  .  pR......b....
	defb 085h,028h,03ch,062h,024h,010h,003h,000h,090h,010h,05ch,06ah,04ch,010h,000h,000h	; 9539  .(<b$.....\jL...
	defb 008h,00ch,008h,018h,02ch,010h,000h,0a0h,0a0h,00ah,000h,083h,020h,050h,020h,004h	; 9549  ....,....... P .
	defb 000h,081h,07eh,007h,000h,081h,066h,004h,000h,002h,010h,085h,038h,0feh,038h,010h	; 9559  ..~...f.....8.8.
	defb 010h,003h,000h,005h,003h,081h,002h,006h,003h,004h,000h,082h,07eh,07fh,003h,003h	; 9569  ............~...
	defb 082h,03fh,07eh,003h,060h,085h,07fh,03fh,000h,07eh,03fh,003h,003h,082h,07fh,07eh	; 9579  .?~.`..?.~?....~
	defb 004h,000h,005h,063h,082h,07eh,03fh,005h,003h,004h,000h,082h,03fh,07fh,003h,060h	; 9589  ...c.~?.....?..`
	defb 082h,03eh,07fh,003h,063h,082h,07fh,03eh,004h,000h,082h,03eh,07fh,003h,063h,081h	; 9599  .>..c..>...>..c.
	defb 022h,004h,063h,083h,07fh,03eh,000h,004h,01ch,084h,07fh,03eh,01ch,008h,020h,000h	; 95a9  ".c..>.....>.. .
	defb 082h,010h,0feh,003h,082h,08bh,002h,004h,038h,000h,0c0h,020h,0c2h,022h,002h,004h	; 95b9  ........8.. ."..
	defb 0f8h,003h,000h,099h,010h,07eh,014h,010h,010h,000h,0fch,004h,008h,010h,030h,048h	; 95c9  .....~........0H
	defb 084h,002h,005h,062h,050h,048h,084h,082h,081h,018h,018h,008h,010h,008h,000h,002h	; 95d9  ...bPH..........
	defb 060h,082h,020h,040h,009h,000h,082h,0c0h,022h,003h,002h,085h,004h,0f8h,040h,040h	; 95e9  `. @....".....@@
	defb 07eh,004h,040h,082h,03eh,000h,003h,050h,002h,052h,09ah,054h,098h,000h,0feh,002h	; 95f9  ~.@.>..P.R.T....
	defb 002h,004h,028h,010h,008h,000h,07ch,000h,0feh,002h,002h,004h,078h,000h,03eh,022h	; 9609  ..(...|.....x.>"
	defb 042h,002h,004h,008h,070h,006h,000h,0ffh,040h,020h,044h,0e4h,03fh,05fh,0f5h,05fh	; 9619  B...p...@ D.?_._
	defb 044h,044h,004h,0e4h,0bfh,0e5h,0a5h,0e5h,0a9h,0f2h,07eh,092h,0bah,0d6h,0fah,092h	; 9629  DD........~.....
	defb 09ah,0a5h,000h,028h,029h,04eh,0c8h,048h,048h,047h,010h,0feh,081h,0bah,010h,038h	; 9639  ...()N.HHG.....8
	defb 014h,0feh,000h,07eh,010h,010h,03eh,062h,0a2h,03eh,010h,054h,054h,07ch,010h,092h	; 9649  ...~..>b.>.TT|..
	defb 092h,0feh,020h,076h,022h,0f6h,024h,0b7h,0e0h,09fh,072h,012h,072h,042h,072h,012h	; 9659  .. v".$...r.rBr.
	defb 012h,062h,000h,00ch,008h,008h,018h,018h,024h,0c3h,000h,030h,010h,010h,018h,018h	; 9669  .b......$..0....
	defb 024h,0c3h,0e7h,0a5h,0e7h,081h,0bdh,0a9h,0bdh,0c9h,034h,01ah,024h,0dbh,028h,07eh	; 9679  $.........4.$.(~
	defb 028h,06eh,07ch,044h,07ch,044h,07ch,028h,028h,0ceh,010h,0feh,010h,010h,07ch,044h	; 9689  (n|D|D|((.....|D
	defb 044h,07ch,024h,025h,05eh,0c4h,044h,002h,042h,09eh,041h,010h,0feh,044h,044h,028h	; 9699  D|$%^.D.B.A..DD(
	defb 010h,028h,0c6h,00eh,0eah,0aeh,0eah,0aeh,0eah,00ah,012h,050h,030h,0ffh,012h,03ch	; 96a9  .(.........P0..<
	defb 050h,090h,010h,010h,0feh,092h,092h,0feh,004h,010h,0c7h,07eh,052h,052h,0ffh,010h	; 96b9  P..........~RR..
	defb 028h,0c7h,004h,05fh,044h,05fh,0dfh,044h,05ch,05bh,000h,03fh,049h,07fh,049h,07fh	; 96c9  (.._D_.D\[.?I.I.
	defb 049h,089h,000h,028h,024h,042h,0bdh,014h,024h,048h,054h,0ffh,054h,0fdh,075h,052h	; 96d9  I..($B..$HT.T.uR
	defb 076h,059h,040h,0e2h,04fh,0e2h,04ah,0e2h,046h,0e2h,000h,030h,047h,045h,075h,045h	; 96e9  vY@.O.J.F..0GEuE
	defb 055h,064h,024h,0f4h,014h,024h,074h,0a4h,024h,023h,010h,010h,0ffh,024h,044h,028h	; 96f9  Ud$..$t.$#...$D(
	defb 010h,028h,000h	; 9709

; ----------------------------------------------------------------------
; DATOS caracter_p50DA: un caracter de 1 bit (p00:50E0, L_4CBF, B = 1); lo
;   leen p00:50C1 (8 bytes)
;   0x970c..0x9714  (8 bytes)
DATA_caracter_p50DA:
	defb 000h,010h,010h,0feh,07ch,038h,07ch,044h	; 970c  ....|8|D

; ----------------------------------------------------------------------
; DATOS ficha_p50E3: una ficha de 8x8 a 4 bits (32 bytes) que L_4CFA copia tal
;   cual a la VRAM 0xAC34; lo leen p00:50C1 (32 bytes)
;   0x9714..0x9734  (32 bytes)
DATA_ficha_p50E3:
	defb 0aah,000h,0bbh,000h	; 9714
	defb 0aah,000h,0bbh,000h	; 9718
	defb 0aah,000h,0bbh,000h	; 971c
	defb 0aah,000h,0bbh,000h	; 9720
	defb 0aah,000h,0bbh,000h	; 9724
	defb 0aah,000h,0bbh,000h	; 9728
	defb 0aah,000h,0bbh,000h	; 972c
	defb 0aah,000h,0bbh,000h	; 9730

; ----------------------------------------------------------------------
; DATOS caracteres_p50ED: RLE (L_5578): 16 caracteres de 1 bit (p00:50F9 y
;   p00:5102, 8 y 8); lo leen p00:50C1 (66 bytes)
;   0x9734..0x9776  (66 bytes)
DATA_caracteres_p50ED:
	defb 0c0h,006h,07fh,006h,03fh,019h,01fh,030h,019h,040h,0e0h,000h,0c0h,080h,080h,0c0h	; 9734  ....?..0.@......
	defb 0a0h,040h,068h,0ffh,06dh,0c9h,078h,037h,0dah,000h,020h,0f0h,020h,040h,0c0h,0f0h	; 9744  .@h.m.x7.. . @..
	defb 050h,006h,006h,0ffh,000h,03fh,039h,01fh,03ah,000h,020h,0f0h,080h,0c0h,0c0h,080h	; 9754  P....?9.:. .....
	defb 060h,00eh,00ch,05fh,019h,03fh,0d9h,01fh,0f6h,000h,080h,0a0h,080h,0c0h,0b0h,080h	; 9764  `.._.?..........
	defb 0f0h,000h	; 9774

; ----------------------------------------------------------------------
; DATOS caracteres_p5105: RLE (L_5578): 16 caracteres de 1 bit (p00:5111 y
;   p00:511A, 8 y 8); lo leen p00:50C1 (56 bytes)
;   0x9776..0x97ae  (56 bytes)
DATA_caracteres_p5105:
	defb 084h,0ffh,030h,03fh,030h,004h,000h,081h,0f0h,003h,0c0h,004h,000h,084h,05bh,059h	; 9776  ..0?0.........[Y
	defb 0d8h,08fh,004h,000h,084h,020h,030h,050h,0e0h,004h,000h,084h,0f3h,01fh,07dh,030h	; 9786  ..... 0P......}0
	defb 004h,000h,084h,0c0h,080h,0f0h,060h,004h,000h,084h,01fh,036h,06eh,086h,004h,000h	; 9796  ......`....6n...
	defb 084h,080h,0c0h,070h,020h,004h,000h,000h	; 97a6  ...p ...

; ----------------------------------------------------------------------
; DATOS fotogramas_97AE: 28 palabras: 4 estados x 7 fotogramas (p00:5B06:
;   (ix+6) * 14) del personaje con 0xC240 = 0; lo leen p00:5B12 (56 bytes)
;   0x97ae..0x97e6  (56 bytes)
DATA_fotogramas_97AE:
	defb 0e6h,097h	; 97ae
	defb 0f3h,097h	; 97b0
	defb 000h,098h	; 97b2
	defb 00dh,098h	; 97b4
	defb 01ah,098h	; 97b6
	defb 023h,098h	; 97b8
	defb 030h,098h	; 97ba
	defb 03dh,098h	; 97bc
	defb 04ah,098h	; 97be
	defb 057h,098h	; 97c0
	defb 064h,098h	; 97c2
	defb 071h,098h	; 97c4
	defb 023h,098h	; 97c6
	defb 07ah,098h	; 97c8
	defb 087h,098h	; 97ca
	defb 094h,098h	; 97cc
	defb 0a1h,098h	; 97ce
	defb 0aeh,098h	; 97d0
	defb 0bbh,098h	; 97d2
	defb 023h,098h	; 97d4
	defb 0c4h,098h	; 97d6
	defb 0d1h,098h	; 97d8
	defb 0deh,098h	; 97da
	defb 0ebh,098h	; 97dc
	defb 0f8h,098h	; 97de
	defb 005h,099h	; 97e0
	defb 023h,098h	; 97e2
	defb 00eh,099h	; 97e4

; ----------------------------------------------------------------------
; DATOS fotograma_97E6: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x97e6..0x97f3  (13 bytes)
DATA_fotograma_97E6:
	defb 001h,000h,01bh,099h	; 97e6
	defb 00eh,000h,0ffh,099h	; 97ea
	defb 010h,000h,008h,09ah	; 97ee
	defb 0ffh	; 97f2

; ----------------------------------------------------------------------
; DATOS fotograma_97F3: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x97f3..0x9800  (13 bytes)
DATA_fotograma_97F3:
	defb 000h,000h,01bh,099h	; 97f3
	defb 00dh,000h,049h,09ah	; 97f7
	defb 010h,000h,056h,09ah	; 97fb
	defb 0ffh	; 97ff

; ----------------------------------------------------------------------
; DATOS fotograma_9800: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9800..0x980d  (13 bytes)
DATA_fotograma_9800:
	defb 001h,000h,01bh,099h	; 9800
	defb 00eh,000h,097h,09ah	; 9804
	defb 010h,000h,0a0h,09ah	; 9808
	defb 0ffh	; 980c

; ----------------------------------------------------------------------
; DATOS fotograma_980D: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x980d..0x981a  (13 bytes)
DATA_fotograma_980D:
	defb 000h,000h,01bh,099h	; 980d
	defb 00dh,000h,049h,09ah	; 9811
	defb 010h,000h,056h,09ah	; 9815
	defb 0ffh	; 9819

; ----------------------------------------------------------------------
; DATOS fotograma_981A: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x981a..0x9823  (9 bytes)
DATA_fotograma_981A:
	defb 005h,000h,01bh,099h	; 981a
	defb 012h,000h,0e1h,09ah	; 981e
	defb 0ffh	; 9822

; ----------------------------------------------------------------------
; DATOS fotograma_9823: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9823..0x9830  (13 bytes)
DATA_fotograma_9823:
	defb 000h,000h,01ah,09bh	; 9823
	defb 010h,000h,05bh,09bh	; 9827
	defb 016h,000h,074h,09bh	; 982b
	defb 0ffh	; 982f

; ----------------------------------------------------------------------
; DATOS fotograma_9830: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9830..0x983d  (13 bytes)
DATA_fotograma_9830:
	defb 000h,000h,01bh,099h	; 9830
	defb 00ah,000h,09dh,09bh	; 9834
	defb 016h,000h,074h,09bh	; 9838
	defb 0ffh	; 983c

; ----------------------------------------------------------------------
; DATOS fotograma_983D: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x983d..0x984a  (13 bytes)
DATA_fotograma_983D:
	defb 001h,000h,0c6h,099h	; 983d
	defb 00eh,000h,0ffh,099h	; 9841
	defb 010h,000h,008h,09ah	; 9845
	defb 0ffh	; 9849

; ----------------------------------------------------------------------
; DATOS fotograma_984A: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x984a..0x9857  (13 bytes)
DATA_fotograma_984A:
	defb 000h,000h,0c6h,099h	; 984a
	defb 00dh,000h,049h,09ah	; 984e
	defb 010h,000h,056h,09ah	; 9852
	defb 0ffh	; 9856

; ----------------------------------------------------------------------
; DATOS fotograma_9857: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9857..0x9864  (13 bytes)
DATA_fotograma_9857:
	defb 001h,000h,0c6h,099h	; 9857
	defb 00eh,000h,097h,09ah	; 985b
	defb 010h,000h,0a0h,09ah	; 985f
	defb 0ffh	; 9863

; ----------------------------------------------------------------------
; DATOS fotograma_9864: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9864..0x9871  (13 bytes)
DATA_fotograma_9864:
	defb 000h,000h,0c6h,099h	; 9864
	defb 00dh,000h,049h,09ah	; 9868
	defb 010h,000h,056h,09ah	; 986c
	defb 0ffh	; 9870

; ----------------------------------------------------------------------
; DATOS fotograma_9871: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9871..0x987a  (9 bytes)
DATA_fotograma_9871:
	defb 005h,000h,0c6h,099h	; 9871
	defb 012h,000h,0e1h,09ah	; 9875
	defb 0ffh	; 9879

; ----------------------------------------------------------------------
; DATOS fotograma_987A: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x987a..0x9887  (13 bytes)
DATA_fotograma_987A:
	defb 000h,000h,0c6h,099h	; 987a
	defb 00ah,000h,09dh,09bh	; 987e
	defb 016h,000h,074h,09bh	; 9882
	defb 0ffh	; 9886

; ----------------------------------------------------------------------
; DATOS fotograma_9887: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9887..0x9894  (13 bytes)
DATA_fotograma_9887:
	defb 001h,000h,08dh,099h	; 9887
	defb 00eh,000h,0ffh,099h	; 988b
	defb 010h,000h,008h,09ah	; 988f
	defb 0ffh	; 9893

; ----------------------------------------------------------------------
; DATOS fotograma_9894: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9894..0x98a1  (13 bytes)
DATA_fotograma_9894:
	defb 000h,000h,08dh,099h	; 9894
	defb 00dh,000h,049h,09ah	; 9898
	defb 010h,000h,056h,09ah	; 989c
	defb 0ffh	; 98a0

; ----------------------------------------------------------------------
; DATOS fotograma_98A1: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x98a1..0x98ae  (13 bytes)
DATA_fotograma_98A1:
	defb 001h,000h,08dh,099h	; 98a1
	defb 00eh,000h,097h,09ah	; 98a5
	defb 010h,000h,0a0h,09ah	; 98a9
	defb 0ffh	; 98ad

; ----------------------------------------------------------------------
; DATOS fotograma_98AE: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x98ae..0x98bb  (13 bytes)
DATA_fotograma_98AE:
	defb 000h,000h,08dh,099h	; 98ae
	defb 00dh,000h,049h,09ah	; 98b2
	defb 010h,000h,056h,09ah	; 98b6
	defb 0ffh	; 98ba

; ----------------------------------------------------------------------
; DATOS fotograma_98BB: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x98bb..0x98c4  (9 bytes)
DATA_fotograma_98BB:
	defb 005h,000h,08dh,099h	; 98bb
	defb 012h,000h,0e1h,09ah	; 98bf
	defb 0ffh	; 98c3

; ----------------------------------------------------------------------
; DATOS fotograma_98C4: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x98c4..0x98d1  (13 bytes)
DATA_fotograma_98C4:
	defb 000h,000h,08dh,099h	; 98c4
	defb 00ah,000h,09dh,09bh	; 98c8
	defb 016h,000h,074h,09bh	; 98cc
	defb 0ffh	; 98d0

; ----------------------------------------------------------------------
; DATOS fotograma_98D1: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x98d1..0x98de  (13 bytes)
DATA_fotograma_98D1:
	defb 001h,000h,054h,099h	; 98d1
	defb 00eh,000h,0ffh,099h	; 98d5
	defb 010h,000h,008h,09ah	; 98d9
	defb 0ffh	; 98dd

; ----------------------------------------------------------------------
; DATOS fotograma_98DE: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x98de..0x98eb  (13 bytes)
DATA_fotograma_98DE:
	defb 000h,000h,054h,099h	; 98de
	defb 00dh,000h,049h,09ah	; 98e2
	defb 010h,000h,056h,09ah	; 98e6
	defb 0ffh	; 98ea

; ----------------------------------------------------------------------
; DATOS fotograma_98EB: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x98eb..0x98f8  (13 bytes)
DATA_fotograma_98EB:
	defb 001h,000h,054h,099h	; 98eb
	defb 00eh,000h,097h,09ah	; 98ef
	defb 010h,000h,0a0h,09ah	; 98f3
	defb 0ffh	; 98f7

; ----------------------------------------------------------------------
; DATOS fotograma_98F8: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x98f8..0x9905  (13 bytes)
DATA_fotograma_98F8:
	defb 000h,000h,054h,099h	; 98f8
	defb 00dh,000h,049h,09ah	; 98fc
	defb 010h,000h,056h,09ah	; 9900
	defb 0ffh	; 9904

; ----------------------------------------------------------------------
; DATOS fotograma_9905: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9905..0x990e  (9 bytes)
DATA_fotograma_9905:
	defb 005h,000h,054h,099h	; 9905
	defb 012h,000h,0e1h,09ah	; 9909
	defb 0ffh	; 990d

; ----------------------------------------------------------------------
; DATOS fotograma_990E: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x990e..0x991b  (13 bytes)
DATA_fotograma_990E:
	defb 000h,000h,054h,099h	; 990e
	defb 00ah,000h,09dh,09bh	; 9912
	defb 016h,000h,074h,09bh	; 9916
	defb 0ffh	; 991a

; ----------------------------------------------------------------------
; DATOS pieza_991B: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (57 bytes)
;   0x991b..0x9954  (57 bytes)
DATA_pieza_991B:
	defb 00eh,003h,004h,008h,011h,013h,011h,015h,01fh,01fh,00bh,00dh,005h,002h,002h,098h	; 991b  ................
	defb 07ch,006h,0eah,0fch,0f8h,0f0h,0f0h,0f8h,0fch,0f8h,0f8h,070h,0e0h,003h,007h,00fh	; 992b  |..........p....
	defb 01fh,01eh,01fh,01fh,01ah,01ah,00ch,00eh,006h,003h,003h,098h,0e4h,0fah,096h,07ch	; 993b  ...............|
	defb 018h,050h,050h,048h,004h,098h,068h,090h,0e0h	; 994b  .PPH..h..

; ----------------------------------------------------------------------
; DATOS pieza_9954: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (57 bytes)
;   0x9954..0x998d  (57 bytes)
DATA_pieza_9954:
	defb 00eh,007h,008h,010h,023h,027h,023h,02bh,03fh,03fh,016h,01bh,00bh,004h,002h,030h	; 9954  ....#'#+??.....0
	defb 0f8h,00ch,0d4h,0f8h,0d0h,0f0h,0a0h,0d0h,038h,0f0h,0d0h,020h,0c0h,007h,00fh,01fh	; 9964  ........8.. ....
	defb 03fh,03ch,03fh,03eh,034h,034h,019h,01ch,00ch,007h,003h,030h,0c8h,0f4h,02ch,0f8h	; 9974  ?<?>44.....0..,.
	defb 030h,0f0h,0e0h,0b0h,0c8h,030h,030h,0e0h,0c0h	; 9984  0....00..

; ----------------------------------------------------------------------
; DATOS pieza_998D: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (57 bytes)
;   0x998d..0x99c6  (57 bytes)
DATA_pieza_998D:
	defb 00eh,000h,001h,002h,004h,004h,004h,005h,007h,007h,002h,003h,001h,002h,004h,0e6h	; 998d  ................
	defb 01fh,001h,07ah,0ffh,07ah,07eh,0fch,0e2h,0ffh,07eh,07ah,05ch,038h,000h,001h,003h	; 999d  ..z.z~...~z\8...
	defb 007h,007h,007h,007h,006h,006h,003h,003h,001h,003h,007h,0e6h,0f9h,0feh,0e5h,09fh	; 99ad  ................
	defb 0c6h,0c2h,094h,0beh,001h,082h,08eh,0e4h,0f8h	; 99bd  .........

; ----------------------------------------------------------------------
; DATOS pieza_99C6: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (57 bytes)
;   0x99c6..0x99ff  (57 bytes)
DATA_pieza_99C6:
	defb 00eh,003h,004h,008h,011h,013h,011h,015h,01fh,01fh,00bh,00dh,005h,002h,002h,098h	; 99c6  ................
	defb 07ch,006h,0eah,0fch,0f8h,0f0h,0f0h,0f8h,0fch,0f8h,0f8h,070h,0e0h,003h,007h,00fh	; 99d6  |..........p....
	defb 01fh,01eh,01fh,01fh,01ah,01ah,00ch,00eh,006h,003h,003h,098h,0e4h,0fah,096h,07ch	; 99e6  ...............|
	defb 018h,050h,050h,048h,004h,018h,068h,090h,0e0h	; 99f6  .PPH..h..

; ----------------------------------------------------------------------
; DATOS pieza_99FF: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (9 bytes)
;   0x99ff..0x9a08  (9 bytes)
DATA_pieza_99FF:
	defb 002h,00ch,01fh,080h,078h,00ch,017h,080h,0f8h	; 99ff  ....x....

; ----------------------------------------------------------------------
; DATOS pieza_9A08: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0x9a08..0x9a49  (65 bytes)
DATA_pieza_9A08:
	defb 010h,02eh,02fh,027h,016h,013h,009h,016h,013h,008h,00eh,03eh,04fh,08dh,06eh,023h	; 9a08  ../'.......>O.n#
	defb 01eh,000h,038h,0d0h,0ech,0e6h,0eeh,0dch,0c0h,0e0h,060h,056h,0bfh,006h,08eh,09ch	; 9a18  ..8.......`V....
	defb 078h,033h,033h,03bh,01fh,01ch,00fh,01fh,01ch,00fh,00fh,03fh,07fh,0f5h,076h,03dh	; 9a28  x33........?..v=
	defb 01eh,0f8h,0f8h,0f0h,03ch,03ah,0f2h,05ch,0c0h,020h,0a0h,0f6h,0d9h,0feh,0feh,0fch	; 9a38  ....<:.\. ......
	defb 078h	; 9a48

; ----------------------------------------------------------------------
; DATOS pieza_9A49: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (13 bytes)
;   0x9a49..0x9a56  (13 bytes)
DATA_pieza_9A49:
	defb 003h,002h,007h,00bh,040h,0bch,080h,002h,005h,00ch,040h,0fch,0fch	; 9a49  ....@.....@..

; ----------------------------------------------------------------------
; DATOS pieza_9A56: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0x9a56..0x9a97  (65 bytes)
DATA_pieza_9A56:
	defb 010h,00bh,009h,005h,005h,004h,00bh,009h,008h,004h,004h,004h,00bh,004h,008h,008h	; 9a56  ................
	defb 007h,09ch,0e0h,0b0h,0f0h,060h,0e0h,0a0h,060h,0c0h,0c0h,0c0h,0e0h,020h,070h,008h	; 9a66  .....`..`.... p.
	defb 0f0h,00ch,00eh,007h,006h,007h,00fh,00eh,00fh,007h,007h,007h,00fh,007h,00fh,00fh	; 9a76  ................
	defb 007h,0fch,0e0h,0d0h,010h,0e0h,0a0h,060h,0a0h,040h,040h,040h,0a0h,0e0h,0d0h,0f8h	; 9a86  .......`.@@@....
	defb 0f0h	; 9a96

; ----------------------------------------------------------------------
; DATOS pieza_9A97: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (9 bytes)
;   0x9a97..0x9aa0  (9 bytes)
DATA_pieza_9A97:
	defb 002h,000h,007h,088h,0f7h,000h,007h,088h,07fh	; 9a97  .........

; ----------------------------------------------------------------------
; DATOS pieza_9AA0: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0x9aa0..0x9ae1  (65 bytes)
DATA_pieza_9AA0:
	defb 010h,01eh,02eh,02eh,03fh,035h,018h,008h,00fh,006h,008h,03ch,047h,067h,036h,033h	; 9aa0  ....?5.....<Gg63
	defb 01eh,0e0h,0f7h,078h,06ch,03ch,098h,0e0h,060h,020h,070h,0fah,0ffh,099h,046h,048h	; 9ab0  ...xl<..` p...FH
	defb 030h,01fh,03fh,03fh,02fh,02fh,01fh,00fh,00fh,007h,00fh,037h,07bh,07dh,03ah,03dh	; 9ac0  0.??//.....7{}:=
	defb 01eh,03fh,03fh,0b8h,0f4h,0c4h,0f8h,060h,0a0h,0e0h,0b0h,0eah,0ddh,0e7h,07eh,078h	; 9ad0  .??....`......~x
	defb 030h	; 9ae0

; ----------------------------------------------------------------------
; DATOS pieza_9AE1: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (57 bytes)
;   0x9ae1..0x9b1a  (57 bytes)
DATA_pieza_9AE1:
	defb 00eh,000h,007h,01eh,02eh,02eh,03fh,035h,018h,038h,044h,027h,017h,010h,00eh,088h	; 9ae1  ......?5.8D'....
	defb 0f7h,0e0h,0f7h,078h,06ch,03ch,09eh,066h,0fch,0cch,08eh,083h,07eh,000h,007h,01fh	; 9af1  ...xl<.f....~...
	defb 03fh,03fh,02fh,02fh,01fh,03fh,07fh,03fh,01fh,01eh,00eh,088h,07fh,03fh,03fh,0b8h	; 9b01  ??//.?.?.....??.
	defb 0f4h,0c4h,0fah,0fah,0f4h,0fch,0f2h,0fdh,07eh	; 9b11  ........~

; ----------------------------------------------------------------------
; DATOS pieza_9B1A: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0x9b1a..0x9b5b  (65 bytes)
DATA_pieza_9B1A:
	defb 010h,003h,004h,008h,018h,018h,00ch,00ch,008h,00ch,006h,03fh,076h,05fh,05fh,0f7h	; 9b1a  ...........?v__.
	defb 087h,0e0h,010h,008h,00ch,00ch,018h,018h,008h,018h,030h,0f0h,0a0h,0e0h,0f8h,0fch	; 9b2a  ..........0.....
	defb 0f6h,003h,007h,00fh,017h,017h,00bh,00bh,00fh,00fh,007h,03dh,04fh,07fh,067h,08fh	; 9b3a  ...........=O.g.
	defb 0ffh,0e0h,0f0h,0f8h,0f4h,0f4h,0e8h,0e8h,0f8h,0f8h,0f0h,0d0h,060h,0e0h,0f8h,0f4h	; 9b4a  ............`...
	defb 0fah	; 9b5a

; ----------------------------------------------------------------------
; DATOS pieza_9B5B: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (25 bytes)
;   0x9b5b..0x9b74  (25 bytes)
DATA_pieza_9B5B:
	defb 006h,07fh,007h,004h,00ch,008h,019h,0f7h,0ebh,036h,010h,018h,0e8h,07fh,007h,007h	; 9b5b  .........6......
	defb 00bh,00fh,017h,0f9h,0edh,0d6h,0f0h,0e8h,0f8h	; 9b6b  .........

; ----------------------------------------------------------------------
; DATOS pieza_9B74: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (41 bytes)
;   0x9b74..0x9b9d  (41 bytes)
DATA_pieza_9B74:
	defb 00ah,017h,00fh,009h,019h,037h,02eh,001h,001h,000h,000h,098h,010h,010h,0f0h,018h	; 9b74  .....7..........
	defb 090h,010h,008h,0f4h,078h,01fh,00bh,007h,017h,02fh,03eh,001h,001h,000h,000h,0e8h	; 9b84  ....x..../>.....
	defb 0f0h,0f0h,0f0h,0e8h,0f0h,0f0h,0f8h,0fch,078h	; 9b94  ........x

; ----------------------------------------------------------------------
; DATOS pieza_9B9D: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (49 bytes)
;   0x9b9d..0x9bce  (49 bytes)
DATA_pieza_9B9D:
	defb 00ch,038h,074h,058h,05fh,057h,027h,01eh,002h,005h,00dh,008h,019h,000h,000h,000h	; 9b9d  .8tX_W'.........
	defb 068h,0d7h,0e0h,0f7h,0f8h,034h,0b8h,048h,008h,038h,04ch,078h,067h,06fh,03fh,01fh	; 9bad  h....4.H.8Lxgo?.
	defb 003h,007h,00bh,00fh,017h,000h,000h,000h,0e8h,0dfh,03fh,03fh,048h,0cch,0f8h,0f8h	; 9bbd  ..........??H...
	defb 0f8h	; 9bcd

; ----------------------------------------------------------------------
; DATOS fotogramas_9BCE: 28 palabras: 4 estados x 7 fotogramas (p00:5B06:
;   (ix+6) * 14) del personaje con 0xC240 = 1; lo leen p00:5B12 (56 bytes)
;   0x9bce..0x9c06  (56 bytes)
DATA_fotogramas_9BCE:
	defb 006h,09ch	; 9bce
	defb 00fh,09ch	; 9bd0
	defb 018h,09ch	; 9bd2
	defb 021h,09ch	; 9bd4
	defb 02ah,09ch	; 9bd6
	defb 033h,09ch	; 9bd8
	defb 040h,09ch	; 9bda
	defb 04dh,09ch	; 9bdc
	defb 056h,09ch	; 9bde
	defb 05fh,09ch	; 9be0
	defb 068h,09ch	; 9be2
	defb 071h,09ch	; 9be4
	defb 033h,09ch	; 9be6
	defb 07ah,09ch	; 9be8
	defb 087h,09ch	; 9bea
	defb 090h,09ch	; 9bec
	defb 099h,09ch	; 9bee
	defb 0a2h,09ch	; 9bf0
	defb 0abh,09ch	; 9bf2
	defb 033h,09ch	; 9bf4
	defb 0b4h,09ch	; 9bf6
	defb 0c1h,09ch	; 9bf8
	defb 0cah,09ch	; 9bfa
	defb 0d3h,09ch	; 9bfc
	defb 0dch,09ch	; 9bfe
	defb 0e5h,09ch	; 9c00
	defb 033h,09ch	; 9c02
	defb 0eeh,09ch	; 9c04

; ----------------------------------------------------------------------
; DATOS fotograma_9C06: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c06..0x9c0f  (9 bytes)
DATA_fotograma_9C06:
	defb 004h,000h,0fbh,09ch	; 9c06
	defb 011h,000h,0dfh,09dh	; 9c0a
	defb 0ffh	; 9c0e

; ----------------------------------------------------------------------
; DATOS fotograma_9C0F: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c0f..0x9c18  (9 bytes)
DATA_fotograma_9C0F:
	defb 003h,000h,0fbh,09ch	; 9c0f
	defb 010h,000h,01ch,09eh	; 9c13
	defb 0ffh	; 9c17

; ----------------------------------------------------------------------
; DATOS fotograma_9C18: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c18..0x9c21  (9 bytes)
DATA_fotograma_9C18:
	defb 004h,000h,0fbh,09ch	; 9c18
	defb 011h,000h,05dh,09eh	; 9c1c
	defb 0ffh	; 9c20

; ----------------------------------------------------------------------
; DATOS fotograma_9C21: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c21..0x9c2a  (9 bytes)
DATA_fotograma_9C21:
	defb 003h,000h,0fbh,09ch	; 9c21
	defb 010h,000h,01ch,09eh	; 9c25
	defb 0ffh	; 9c29

; ----------------------------------------------------------------------
; DATOS fotograma_9C2A: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c2a..0x9c33  (9 bytes)
DATA_fotograma_9C2A:
	defb 008h,000h,0fbh,09ch	; 9c2a
	defb 014h,000h,09ah,09eh	; 9c2e
	defb 0ffh	; 9c32

; ----------------------------------------------------------------------
; DATOS fotograma_9C33: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9c33..0x9c40  (13 bytes)
DATA_fotograma_9C33:
	defb 00eh,000h,0cbh,09eh	; 9c33
	defb 004h,000h,015h,09fh	; 9c37
	defb 010h,000h,0d4h,09eh	; 9c3b
	defb 0ffh	; 9c3f

; ----------------------------------------------------------------------
; DATOS fotograma_9C40: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9c40..0x9c4d  (13 bytes)
DATA_fotograma_9C40:
	defb 00eh,000h,0cbh,09eh	; 9c40
	defb 004h,000h,0fbh,09ch	; 9c44
	defb 010h,000h,0d4h,09eh	; 9c48
	defb 0ffh	; 9c4c

; ----------------------------------------------------------------------
; DATOS fotograma_9C4D: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c4d..0x9c56  (9 bytes)
DATA_fotograma_9C4D:
	defb 004h,000h,0a6h,09dh	; 9c4d
	defb 011h,000h,0dfh,09dh	; 9c51
	defb 0ffh	; 9c55

; ----------------------------------------------------------------------
; DATOS fotograma_9C56: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c56..0x9c5f  (9 bytes)
DATA_fotograma_9C56:
	defb 003h,000h,0a6h,09dh	; 9c56
	defb 010h,000h,01ch,09eh	; 9c5a
	defb 0ffh	; 9c5e

; ----------------------------------------------------------------------
; DATOS fotograma_9C5F: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c5f..0x9c68  (9 bytes)
DATA_fotograma_9C5F:
	defb 004h,000h,0a6h,09dh	; 9c5f
	defb 011h,000h,05dh,09eh	; 9c63
	defb 0ffh	; 9c67

; ----------------------------------------------------------------------
; DATOS fotograma_9C68: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c68..0x9c71  (9 bytes)
DATA_fotograma_9C68:
	defb 003h,000h,0a6h,09dh	; 9c68
	defb 010h,000h,01ch,09eh	; 9c6c
	defb 0ffh	; 9c70

; ----------------------------------------------------------------------
; DATOS fotograma_9C71: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c71..0x9c7a  (9 bytes)
DATA_fotograma_9C71:
	defb 008h,000h,0a6h,09dh	; 9c71
	defb 014h,000h,09ah,09eh	; 9c75
	defb 0ffh	; 9c79

; ----------------------------------------------------------------------
; DATOS fotograma_9C7A: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9c7a..0x9c87  (13 bytes)
DATA_fotograma_9C7A:
	defb 00eh,000h,0cbh,09eh	; 9c7a
	defb 004h,000h,0a6h,09dh	; 9c7e
	defb 010h,000h,0d4h,09eh	; 9c82
	defb 0ffh	; 9c86

; ----------------------------------------------------------------------
; DATOS fotograma_9C87: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c87..0x9c90  (9 bytes)
DATA_fotograma_9C87:
	defb 005h,000h,06dh,09dh	; 9c87
	defb 011h,000h,0dfh,09dh	; 9c8b
	defb 0ffh	; 9c8f

; ----------------------------------------------------------------------
; DATOS fotograma_9C90: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c90..0x9c99  (9 bytes)
DATA_fotograma_9C90:
	defb 004h,000h,06dh,09dh	; 9c90
	defb 010h,000h,01ch,09eh	; 9c94
	defb 0ffh	; 9c98

; ----------------------------------------------------------------------
; DATOS fotograma_9C99: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9c99..0x9ca2  (9 bytes)
DATA_fotograma_9C99:
	defb 005h,000h,06dh,09dh	; 9c99
	defb 011h,000h,05dh,09eh	; 9c9d
	defb 0ffh	; 9ca1

; ----------------------------------------------------------------------
; DATOS fotograma_9CA2: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9ca2..0x9cab  (9 bytes)
DATA_fotograma_9CA2:
	defb 004h,000h,06dh,09dh	; 9ca2
	defb 010h,000h,01ch,09eh	; 9ca6
	defb 0ffh	; 9caa

; ----------------------------------------------------------------------
; DATOS fotograma_9CAB: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9cab..0x9cb4  (9 bytes)
DATA_fotograma_9CAB:
	defb 009h,000h,06dh,09dh	; 9cab
	defb 014h,000h,09ah,09eh	; 9caf
	defb 0ffh	; 9cb3

; ----------------------------------------------------------------------
; DATOS fotograma_9CB4: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9cb4..0x9cc1  (13 bytes)
DATA_fotograma_9CB4:
	defb 00eh,000h,0cbh,09eh	; 9cb4
	defb 004h,000h,06dh,09dh	; 9cb8
	defb 010h,000h,0d4h,09eh	; 9cbc
	defb 0ffh	; 9cc0

; ----------------------------------------------------------------------
; DATOS fotograma_9CC1: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9cc1..0x9cca  (9 bytes)
DATA_fotograma_9CC1:
	defb 004h,000h,034h,09dh	; 9cc1
	defb 011h,000h,0dfh,09dh	; 9cc5
	defb 0ffh	; 9cc9

; ----------------------------------------------------------------------
; DATOS fotograma_9CCA: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9cca..0x9cd3  (9 bytes)
DATA_fotograma_9CCA:
	defb 003h,000h,034h,09dh	; 9cca
	defb 010h,000h,01ch,09eh	; 9cce
	defb 0ffh	; 9cd2

; ----------------------------------------------------------------------
; DATOS fotograma_9CD3: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9cd3..0x9cdc  (9 bytes)
DATA_fotograma_9CD3:
	defb 004h,000h,034h,09dh	; 9cd3
	defb 011h,000h,05dh,09eh	; 9cd7
	defb 0ffh	; 9cdb

; ----------------------------------------------------------------------
; DATOS fotograma_9CDC: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9cdc..0x9ce5  (9 bytes)
DATA_fotograma_9CDC:
	defb 003h,000h,034h,09dh	; 9cdc
	defb 010h,000h,01ch,09eh	; 9ce0
	defb 0ffh	; 9ce4

; ----------------------------------------------------------------------
; DATOS fotograma_9CE5: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9ce5..0x9cee  (9 bytes)
DATA_fotograma_9CE5:
	defb 008h,000h,034h,09dh	; 9ce5
	defb 014h,000h,09ah,09eh	; 9ce9
	defb 0ffh	; 9ced

; ----------------------------------------------------------------------
; DATOS fotograma_9CEE: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9cee..0x9cfb  (13 bytes)
DATA_fotograma_9CEE:
	defb 00eh,000h,0cbh,09eh	; 9cee
	defb 004h,000h,034h,09dh	; 9cf2
	defb 010h,000h,0d4h,09eh	; 9cf6
	defb 0ffh	; 9cfa

; ----------------------------------------------------------------------
; DATOS pieza_9CFB: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (57 bytes)
;   0x9cfb..0x9d34  (57 bytes)
DATA_pieza_9CFB:
	defb 00eh,001h,007h,00ch,018h,010h,021h,023h,023h,027h,02fh,01fh,017h,00ah,002h,0e0h	; 9cfb  ......!##'/.....
	defb 0f8h,01ch,08eh,0c6h,0fch,0f8h,0f8h,0f8h,0fch,0f8h,0f0h,0f0h,0e0h,001h,006h,00bh	; 9d0b  ................
	defb 01fh,01fh,03eh,03dh,03dh,03eh,03ah,018h,01ch,00fh,003h,0e0h,018h,0e4h,072h,07ah	; 9d1b  ..>==>:.......rz
	defb 0b4h,008h,028h,028h,004h,048h,030h,010h,0e0h	; 9d2b  ..((.H0..

; ----------------------------------------------------------------------
; DATOS pieza_9D34: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (57 bytes)
;   0x9d34..0x9d6d  (57 bytes)
DATA_pieza_9D34:
	defb 00eh,003h,00fh,018h,031h,021h,043h,047h,047h,04fh,05fh,03fh,02fh,015h,000h,0c0h	; 9d34  ....1!CGGO_?/...
	defb 0f0h,038h,01ch,08ch,0f8h,0f0h,0f0h,0f0h,0f8h,0f0h,0f8h,0f0h,0e0h,003h,00ch,017h	; 9d44  .8..............
	defb 03eh,03eh,07dh,07ah,07ah,07ch,074h,030h,038h,01eh,003h,0c0h,030h,0c8h,0e4h,0f4h	; 9d54  >>}zz|t08...0...
	defb 068h,090h,070h,050h,008h,010h,008h,010h,0e0h	; 9d64  h.pP.....

; ----------------------------------------------------------------------
; DATOS pieza_9D6D: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (57 bytes)
;   0x9d6d..0x9da6  (57 bytes)
DATA_pieza_9D6D:
	defb 00eh,000h,003h,006h,00ch,008h,010h,011h,011h,013h,017h,00fh,00bh,001h,000h,0f0h	; 9d6d  ................
	defb 0fch,00eh,047h,063h,0feh,0fch,0fch,0fch,0feh,0fch,0fch,078h,070h,000h,003h,005h	; 9d7d  ..Gc.......xp...
	defb 00fh,00fh,01fh,01eh,01eh,01fh,01dh,00ch,00eh,003h,000h,0f0h,00ch,0f2h,0b9h,0bdh	; 9d8d  ................
	defb 05ah,084h,094h,024h,002h,004h,004h,088h,070h	; 9d9d  Z..$....p

; ----------------------------------------------------------------------
; DATOS pieza_9DA6: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (57 bytes)
;   0x9da6..0x9ddf  (57 bytes)
DATA_pieza_9DA6:
	defb 00eh,001h,007h,00ch,018h,010h,021h,023h,023h,027h,02fh,01fh,017h,00ah,002h,0e0h	; 9da6  ......!##'/.....
	defb 0f8h,01ch,08eh,0c6h,0fch,0f8h,0f8h,0f8h,0fch,0f8h,0f0h,0f0h,0e0h,001h,006h,00bh	; 9db6  ................
	defb 01fh,01fh,03eh,03dh,03dh,03eh,03ah,018h,01ch,00fh,003h,0e0h,018h,0e4h,072h,07ah	; 9dc6  ..>==>:.......rz
	defb 0b4h,008h,028h,028h,004h,008h,020h,010h,0e0h	; 9dd6  ..((.. ..

; ----------------------------------------------------------------------
; DATOS pieza_9DDF: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (61 bytes)
;   0x9ddf..0x9e1c  (61 bytes)
DATA_pieza_9DDF:
	defb 00fh,00ch,013h,019h,02dh,05dh,0b9h,0feh,098h,068h,014h,067h,096h,08ch,062h,01ch	; 9ddf  ....-]...h.g..b.
	defb 000h,0e0h,0f0h,07ch,02eh,036h,0fch,060h,0e0h,070h,01ch,0eeh,08eh,09ch,070h,00ch	; 9def  ...|.6.`.p....p.
	defb 01eh,01fh,037h,067h,0dfh,08fh,0ffh,06fh,01fh,07fh,0feh,0fch,07eh,01ch,000h,060h	; 9dff  ..7g...o....~..`
	defb 0d0h,0ach,0f2h,0fah,0fch,0a0h,0e0h,090h,0fch,0f2h,0feh,0fch,070h	; 9e0f  ............p

; ----------------------------------------------------------------------
; DATOS pieza_9E1C: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0x9e1c..0x9e5d  (65 bytes)
DATA_pieza_9E1C:
	defb 010h,004h,00bh,014h,018h,017h,01bh,00ah,017h,017h,00bh,004h,00ah,00ah,015h,014h	; 9e1c  ................
	defb 00fh,000h,040h,0c0h,0e0h,020h,0a0h,0a0h,0c0h,0c0h,0a0h,060h,060h,020h,0d0h,018h	; 9e2c  ..@.. .....`` ..
	defb 0f0h,004h,00fh,01fh,01fh,01fh,01ch,00dh,01ch,01ch,00fh,007h,00fh,00fh,01fh,01fh	; 9e3c  ................
	defb 00fh,000h,0c0h,0c0h,0a0h,0e0h,0e0h,0e0h,040h,040h,0e0h,0a0h,0a0h,0e0h,0f0h,0e8h	; 9e4c  ........@@......
	defb 0f0h	; 9e5c

; ----------------------------------------------------------------------
; DATOS pieza_9E5D: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (61 bytes)
;   0x9e5d..0x9e9a  (61 bytes)
DATA_pieza_9E5D:
	defb 00fh,00eh,011h,021h,071h,068h,0d8h,0deh,068h,00fh,030h,049h,08fh,0ech,076h,01ch	; 9e5d  ...!qh..h.0I..v.
	defb 0e0h,030h,030h,07ch,0beh,06eh,0f2h,06ch,040h,0e0h,0dch,0d6h,0e2h,08ch,070h,00eh	; 9e6d  .00|.n.l@.....p.
	defb 01fh,03fh,05fh,05fh,0bfh,0bfh,06fh,00fh,03fh,07eh,0f7h,0f4h,07ah,01ch,0e0h,0d0h	; 9e7d  .?__..o.?~..z...
	defb 0f0h,0cch,0c2h,0f2h,0feh,0ach,0c0h,060h,0fch,0fah,0feh,0fch,070h	; 9e8d  .......`....p

; ----------------------------------------------------------------------
; DATOS pieza_9E9A: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (49 bytes)
;   0x9e9a..0x9ecb  (49 bytes)
DATA_pieza_9E9A:
	defb 00ch,01eh,039h,07ch,074h,0fdh,0f6h,0b8h,078h,04dh,06eh,062h,03dh,000h,0f0h,0d8h	; 9e9a  ..9|t...xMnb=...
	defb 09ch,02fh,0f7h,02eh,09ch,010h,0f8h,01ch,0f8h,01eh,02fh,047h,04fh,09fh,08fh,0cfh	; 9eaa  ./......../GO...
	defb 07fh,07fh,07fh,07fh,03dh,000h,0f0h,0b8h,0f4h,0f7h,0f9h,0dah,0ech,0f0h,0d8h,0e4h	; 9eba  ....=...........
	defb 0f8h	; 9eca

; ----------------------------------------------------------------------
; DATOS pieza_9ECB: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (9 bytes)
;   0x9ecb..0x9ed4  (9 bytes)
DATA_pieza_9ECB:
	defb 002h,060h,0f0h,000h,000h,060h,090h,000h,000h	; 9ecb  .`...`...

; ----------------------------------------------------------------------
; DATOS pieza_9ED4: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (65 bytes)
;   0x9ed4..0x9f15  (65 bytes)
DATA_pieza_9ED4:
	defb 010h,0bfh,066h,0f3h,0c9h,073h,00ch,010h,010h,013h,009h,008h,017h,010h,020h,04fh	; 9ed4  ..f..s........ O
	defb 03eh,0c0h,070h,0cch,01eh,0d6h,03ch,008h,064h,0c8h,084h,0fah,03ch,080h,080h,000h	; 9ee4  >.p...<.d...<...
	defb 000h,0dfh,07fh,09fh,0bfh,07fh,00fh,01fh,01fh,01fh,00fh,00fh,01fh,01fh,03fh,07fh	; 9ef4  ..............?.
	defb 03eh,0c0h,0f0h,0fch,0f2h,0fah,0fch,0f8h,0fch,0f8h,0fch,0feh,03ch,080h,080h,000h	; 9f04  >...........<...
	defb 000h	; 9f14

; ----------------------------------------------------------------------
; DATOS pieza_9F15: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (53 bytes)
;   0x9f15..0x9f4a  (53 bytes)
DATA_pieza_9F15:
	defb 00dh,007h,018h,027h,028h,050h,040h,020h,060h,060h,060h,013h,00bh,000h,0e0h,010h	; 9f15  ...'(P@ ```.....
	defb 0c8h,028h,014h,004h,008h,00ch,00ch,00ch,098h,0a0h,040h,007h,01fh,038h,037h,06fh	; 9f25  .(........@..87o
	defb 07fh,03fh,05fh,05fh,05fh,01fh,00ch,000h,0e0h,0f0h,038h,0d8h,0ech,0fch,0f8h,0f4h	; 9f35  .?___.....8.....
	defb 0f4h,0f4h,0f8h,060h,040h	; 9f45

; ----------------------------------------------------------------------
; DATOS fotogramas_9f4a: 4 palabras: una lista por estado (p00:5BB3:
;   p14:9F4A[(ix+6)]); lo leen p00:5BAC (8 bytes)
;   0x9f4a..0x9f52  (8 bytes)
DATA_fotogramas_9f4a:
	defb 052h,09fh	; 9f4a
	defb 057h,09fh	; 9f4c
	defb 064h,09fh	; 9f4e
	defb 071h,09fh	; 9f50

; ----------------------------------------------------------------------
; DATOS lista_9f4a_0: [n] y n fotogramas (p00:5BB9); lo leen p00:5BAC (5
;   bytes)
;   0x9f52..0x9f57  (5 bytes)
DATA_lista_9f4a_0:
	defb 002h,056h	; 9f52
	defb 0a1h,05fh	; 9f54
	defb 0a1h	; 9f56

; ----------------------------------------------------------------------
; DATOS lista_9f4a_1: [n] y n fotogramas (p00:5BB9); lo leen p00:5BAC (13
;   bytes)
;   0x9f57..0x9f64  (13 bytes)
DATA_lista_9f4a_1:
	defb 006h,07ah	; 9f57
	defb 09fh,083h	; 9f59
	defb 09fh,08ch	; 9f5b
	defb 09fh,068h	; 9f5d
	defb 0a1h,071h	; 9f5f
	defb 0a1h,076h	; 9f61
	defb 0a1h	; 9f63

; ----------------------------------------------------------------------
; DATOS lista_9f4a_2: [n] y n fotogramas (p00:5BB9); lo leen p00:5BAC (13
;   bytes)
;   0x9f64..0x9f71  (13 bytes)
DATA_lista_9f4a_2:
	defb 006h,07ah	; 9f64
	defb 09fh,083h	; 9f66
	defb 09fh,099h	; 9f68
	defb 09fh,068h	; 9f6a
	defb 0a1h,071h	; 9f6c
	defb 0a1h,076h	; 9f6e
	defb 0a1h	; 9f70

; ----------------------------------------------------------------------
; DATOS lista_9f4a_3: [n] y n fotogramas (p00:5BB9); lo leen p00:5BAC (9
;   bytes)
;   0x9f71..0x9f7a  (9 bytes)
DATA_lista_9f4a_3:
	defb 004h,0a6h	; 9f71
	defb 09fh,0abh	; 9f73
	defb 09fh,0b0h	; 9f75
	defb 09fh,0b5h	; 9f77
	defb 09fh	; 9f79

; ----------------------------------------------------------------------
; DATOS fotograma_9F7A: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9f7a..0x9f83  (9 bytes)
DATA_fotograma_9F7A:
	defb 008h,000h,0bah,09fh	; 9f7a
	defb 011h,000h,0dfh,09fh	; 9f7e
	defb 0ffh	; 9f82

; ----------------------------------------------------------------------
; DATOS fotograma_9F83: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (9 bytes)
;   0x9f83..0x9f8c  (9 bytes)
DATA_fotograma_9F83:
	defb 00bh,000h,0bah,09fh	; 9f83
	defb 014h,000h,0dfh,09fh	; 9f87
	defb 0ffh	; 9f8b

; ----------------------------------------------------------------------
; DATOS fotograma_9F8C: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9f8c..0x9f99  (13 bytes)
DATA_fotograma_9F8C:
	defb 004h,000h,0a6h,09dh	; 9f8c
	defb 00ch,000h,008h,0a0h	; 9f90
	defb 010h,000h,019h,0a0h	; 9f94
	defb 0ffh	; 9f98

; ----------------------------------------------------------------------
; DATOS fotograma_9F99: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (13 bytes)
;   0x9f99..0x9fa6  (13 bytes)
DATA_fotograma_9F99:
	defb 005h,000h,06dh,09dh	; 9f99
	defb 00ch,000h,008h,0a0h	; 9f9d
	defb 010h,000h,019h,0a0h	; 9fa1
	defb 0ffh	; 9fa5

; ----------------------------------------------------------------------
; DATOS fotograma_9FA6: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (5 bytes)
;   0x9fa6..0x9fab  (5 bytes)
DATA_fotograma_9FA6:
	defb 010h,000h,05ah,0a0h	; 9fa6
	defb 0ffh	; 9faa

; ----------------------------------------------------------------------
; DATOS fotograma_9FAB: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (5 bytes)
;   0x9fab..0x9fb0  (5 bytes)
DATA_fotograma_9FAB:
	defb 010h,000h,097h,0a0h	; 9fab
	defb 0ffh	; 9faf

; ----------------------------------------------------------------------
; DATOS fotograma_9FB0: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (5 bytes)
;   0x9fb0..0x9fb5  (5 bytes)
DATA_fotograma_9FB0:
	defb 011h,000h,0d8h,0a0h	; 9fb0
	defb 0ffh	; 9fb4

; ----------------------------------------------------------------------
; DATOS fotograma_9FB5: registros [cuenta | 0x80][posicion][pieza lo][hi]
;   hasta 0xFF (p00:5BD3); lo leen p00:5BC6 (5 bytes)
;   0x9fb5..0x9fba  (5 bytes)
DATA_fotograma_9FB5:
	defb 010h,000h,015h,0a1h	; 9fb5
	defb 0ffh	; 9fb9

; ----------------------------------------------------------------------
; DATOS pieza_9FBA: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630; lo leen p00:5BC6 (37 bytes)
;   0x9fba..0x9fdf  (37 bytes)
DATA_pieza_9FBA:
	defb 009h,003h,00eh,01ch,031h,030h,020h,040h,043h,04fh,0c0h,0e0h,030h,0b0h,068h,07ch	; 9fba  ....10 @CO..0.h|
	defb 0f8h,0fch,0feh,003h,00dh,013h,02eh,02fh,03fh,07fh,07fh,074h,0c0h,020h,0d0h,050h	; 9fca  ......./?..t. .P
	defb 0b8h,0d4h,0a8h,034h,082h	; 9fda

; ----------------------------------------------------------------------
; DATOS pieza_9FDF: [n] y dos bloques de 2 x n bytes (columna izquierda y
;   derecha: p00:5C45 lee (HL) y (HL + n)) que p00:5BFB y p00:5C0E componen en
;   0xD600/0xD630 (sigue en el banco 15, en 0xA000); lo leen p00:5BC6 (33
;   bytes)
;   0x9fdf..0xa000  (33 bytes)
DATA_pieza_9FDF:
	defb 00ah,027h,021h,017h,00dh,013h,03eh,03fh,02fh,019h,006h,0feh,0ffh,0fdh,00dh,0feh	; 9fdf  .'!...>?/.......
	defb 07ah,0f4h,0e8h,070h,000h,03ah,03eh,01fh,00eh,01fh,02fh,029h,031h,01fh,006h,0cah	; 9fef  z..p.:>.../)1...
	defb 013h	; 9fff
