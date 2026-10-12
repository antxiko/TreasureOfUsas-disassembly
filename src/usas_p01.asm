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
	ld a,000h		;6002   ; el sonido 0: para todo
	jp 056e3h		;6004   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_6007:
	call 054afh		;6007   ; banco_9_en_a000: pone el banco 9 en 0xA000
	call 0b8cch		;600a   ; pantalla_vecina: 0xC212 = la vecina del lado 0xC215 (0xC218-0xC21B)
	call 05464h		;600d   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	xor a			;6010   ; ya no se sale
	ld (0c215h),a		;6011   ; guarda el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	jp 05e74h		;6014   ; cambia_de_pantalla_y_enciende: p00:5E7A y la pantalla encendida
teclas_de_la_demo:		; la demo: 0xC00A cuenta los cuadros de la tecla; al acabar, la siguiente de p01:603C (0xFF acaba)
	ld hl,0c00ah		;6017   ; la demo: 0xC00A cuenta los cuadros de la tecla en curso
	dec (hl)			;601a   ; un cuadro menos de la tecla en curso
	jr nz,L_602D		;601b
	ld hl,0c009h		;601d   ; al acabar, la siguiente de la tabla de la ruina (p01:603C)
	inc (hl)			;6020
	inc hl			;6021   ; HL = 0xC00A, detras del paso
	call tecla_de_la_demo		;6022   ; tecla_de_la_demo: con 9: A = las teclas y C = los cuadros del paso C de la demo de la ruina (p09:BCD6)
	cp 0ffh		;6025   ; 0xFF: se acaba la demo
	jr z,$-41		;6027   ; 0xFF: fin de la demo (p01:6000, para el sonido)
	ld hl,0c00ah		;6029   ; cuantos cuadros dura la nueva
	ld (hl),c			;602c
L_602D:
	call tecla_de_la_demo		;602d   ; las teclas del paso en curso...
	jp 05002h		;6030   ; ...como si se pulsaran (0xC007 y las nuevas en 0xC006)
lee_teclas_especiales:		; las teclas de las filas 6 y 7 (p00:5049) a 0xC00F y las nuevas a 0xC00E (p00:5005)
	call 05049h		;6033   ; lee_teclas: A = teclas de las filas 6 y 7 de la matriz
	ld hl,0c00fh		;6036   ; apunta a las teclas especiales que hay
	jp 05005h		;6039   ; teclas_nuevas: (HL) = las teclas de A; (HL - 1) = las que no estaban antes
tecla_de_la_demo:		; con 9: A = las teclas y C = los cuadros del paso C de la demo de la ruina (p09:BCD6)
	dec hl			;603c   ; el paso de la demo (0xC009)
	ld c,(hl)			;603d
	call 054afh		;603e   ; banco_9_en_a000: pone el banco 9 en 0xA000
	ld a,(0c21dh)		;6041   ; lee la ruina (0-4)
	ld hl,0bcd6h		;6044   ; la tabla de la demo de cada ruina
	call 0543ah		;6047   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,c			;604a   ; dos bytes por paso
	add a,a			;604b
	call 04083h		;604c   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;604f   ; [teclas]...
	inc hl			;6050
	ld c,(hl)			;6051   ; ...[cuadros]
	push bc			;6052
	push af			;6053
	call 05464h		;6054   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	pop af			;6057
	pop bc			;6058
	ret			;6059
cuadro_de_partida:		; un cuadro de la partida: p00:563F y, en cuadros pares, 0xC00D + 1, los mandos y la pausa
	call 0563fh		;605a   ; copia_e8: copia 256 x 5 lineas de (0, 0xE8) de la pagina 0 a la 1 (HMMM; B = 0 es 256)
	ld a,(0c003h)		;605d   ; en los cuadros impares (0xC003)...
	rra			;6060
	jr c,L_6092		;6061   ; ...los actores, los objetos y los sprites (p01:6092)
	ld hl,0c00dh		;6063   ; apunta a la cuenta de cuadros del juego
	inc (hl)			;6066
	call 04feeh		;6067   ; lee_mandos: fuera de partida (0xC002 bit 6 a cero) salta a p01:6017; si no lee mandos y teclado a 0xC006/0xC007
	call pausa		;606a   ; pausa: en partida, si se pulsa la tecla de 0xC00E bit 0: 0xC008 = 1 y el sonido 0xFD
	ret c			;606d   ; con la pausa, nada mas
	call dibuja_al_personaje		;606e   ; dibuja_al_personaje: las fichas del personaje en la pagina 1 segun 0xC253 y 0xC26F
	call cuadro_del_personaje		;6071   ; cuadro_del_personaje: mando, movimiento y la accion 0xC24B (despacho)
	call 0b68fh		;6074   ; choques_con_cd00: salvo muriendo y fuera de la sala 5: los choques de los 9 actores de 0xCD00 (p03:B6AB) y sus empujones
	call puerta_de_salida		;6077   ; puerta_de_salida: la puerta de salida de la fase (0xD510)
	call 08b4fh		;607a   ; azar: 0xC3A0 = 0xC3A0 + (0xC246 + 0xC3A0) + 0xC00D + 0x0B: numero al azar
	call cuadro_de_personaje_y_disparos		;607d   ; cuadro_de_personaje_y_disparos: p06:B259, p06:B2FC, la accion y los sprites
	call disparos_y_cambio		;6080   ; disparos_y_cambio: disparos, sus sprites y la tecla 0x10 de cambiar de personaje
	call 08cf6h		;6083   ; cuadro_de_la_sala_5: en la sala 5, despacha 0xC310 (tabla p02:8D01)
	call 08fabh		;6086   ; cuadro_del_final_de_fase: con 0xC316 y sin morir: la cuenta 0xC314 y despacha 0xC310 (tabla p02:8FBF)
	call 08293h		;6089   ; cuadro_de_actores: el jefe (p02:8598) y los 8 actores de 0xC400: su tipo, movimiento y vida
	call sale_por_la_entrada		;608c   ; sale_por_la_entrada: en la pantalla 1, junto a la entrada y pulsando hacia fuera: 0xC215 = 3 o 4
	jp L_60CF		;608f   ; y lo de la sala 5
L_6092:
	call cuenta_ccb7		;6092   ; cuenta_ccb7: 0xCCB7 - 1 si no es cero
	call actores_de_cd00		;6095   ; actores_de_cd00: los 9 actores de 0xCD00: su paso, movimiento, piezas y sprites
	call objetos		;6098   ; objetos: los 8 objetos de 0xCB00 de la pantalla 0xC212
	call bloques_d180		;609b   ; bloques_d180: los 2 bloques de 0xD180 de la pantalla
	call 082c5h		;609e   ; fotogramas_de_actores: el fotograma de los 8 actores de 0xC400, salvo el tipo 0x37 (p02:8A42)
	call 08aa0h		;60a1   ; sprites_de_actores: los atributos de las piezas de los 8 actores de 0xC400 (p02:8AB8)
	call disparos_contra_actores		;60a4   ; disparos_contra_actores: cada disparo de 0xC320 contra los 8 actores de 0xC400 con (ix+0x13) bit 1
	call actores_contra_el_personaje		;60a7   ; actores_contra_el_personaje: los 8 actores con (ix+0x13) bit 0 contra el personaje
	jp 0564ch		;60aa   ; atributos_rotados: los colores de los sprites (p00:5676) y los atributos de 0xDE00 a la VRAM 0x7600 empezando cada cuadro por otro sprite (0xC00C + 0x68): el parpadeo cuando hay muchos
pausa:		; en partida, si se pulsa la tecla de 0xC00E bit 0: 0xC008 = 1 y el sonido 0xFD
	ld a,(0c002h)		;60ad   ; lee las banderas (bit 6: en partida)
	and 040h		;60b0   ; solo en partida
	ret z			;60b2
	ld a,(0c24bh)		;60b3   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;60b6   ; ni muriendo
	ret z			;60b8
	ld a,(0c21ch)		;60b9   ; lee el jefe vencido (no queda ningun 0x19)
	and a			;60bc   ; ni con 0xC21C puesto (no queda ningun 0x19)
	ret nz			;60bd
	ld a,(0c00eh)		;60be   ; lee las teclas especiales
	rra			;60c1   ; la tecla especial 0 (F1)
	ret nc			;60c2
	ld a,001h		;60c3
	ld (0c008h),a		;60c5   ; guarda la pausa
	ld a,0fdh		;60c8   ; el sonido especial 0xFD (para la musica)
	call 056e3h		;60ca   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	scf			;60cd   ; acarreo: en pausa
	ret			;60ce
L_60CF:
	ld a,(0c20ah)		;60cf   ; lee en la sala de la puerta 5
	and a			;60d2
	ret z			;60d3   ; solo en la sala 5...
	ld a,(0c21ch)		;60d4   ; lee el jefe vencido (no queda ningun 0x19)
	and a			;60d7
	ret z			;60d8   ; ...con 0xC21C puesto...
	ld a,(0c246h)		;60d9   ; lee la X del personaje
	cp 0f0h		;60dc   ; ...y saliendo por la derecha (X >= 0xF0)...
	ret c			;60de
	ld a,001h		;60df   ; ...se acaba la ruina (0xC217 = 1)
	ld (0c217h),a		;60e1
	ret			;60e4
cuenta_ccb7:		; 0xCCB7 - 1 si no es cero
	ld hl,0ccb7h		;60e5   ; 0xCCB7 baja hasta cero, un cuadro cada vez
	ld a,(hl)			;60e8
	and a			;60e9
	ret z			;60ea
	dec (hl)			;60eb
	ret			;60ec
entra_en_la_antesala:		; pantalla apagada, el personaje 0 (p01:60E5) y p01:60F3
	call 04a1fh		;60ed   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	call lleva_segun_ficha_0		;60f0   ; lleva_segun_ficha_0: 0xC240 = el byte 0 de la ficha del personaje 0
pinta_la_antesala:		; la fuente, los graficos, la paleta, el mapa y los metabloques de la antesala y el marcador
	call 04a1fh		;60f3   ; pantalla_apagada: R#1 sin el bit 6 y sprites apagados (R#8)
	call 050c1h		;60f6   ; carga_la_fuente: con 13-14-15: la fuente (p14:9289) y los caracteres del marcador
	call 05155h		;60f9   ; graficos_de_antesala: la lista de fichas de la antesala (p07:60B0[ruina]) y la de p12:A7AA
	call 0540dh		;60fc   ; paleta_de_antesala: p06:B271 y la de la ruina (p06:B281)
	call 05554h		;60ff   ; mapa_de_antesala: RLE del mapa de la antesala (p10:603C) a 0xEC00
	call 05566h		;6102   ; metabloques_de_antesala: RLE de los metabloques de la antesala (p11:88CB) a 0xE400
	call 046a0h		;6105   ; marco_del_marcador: los rectangulos y lineas del marcador, sus caracteres y el nombre de la ruina
	ld a,(0cc14h)		;6108   ; lee el cuadro del personaje en la antesala
	call 05b68h		;610b   ; fotograma_a_f800: un fotograma de cada personaje a la VRAM desde 0xF800 (p00:5B6E)
	call 054b4h		;610e   ; banco_6_en_a000: pone el banco 6 en 0xA000
	call 0b8a5h		;6111   ; colores_de_la_antesala: los colores de sprite de los dos personajes (p06:B8F3/B8F7)
	call 0ba3bh		;6114   ; puertas_de_la_ruina: en la pagina 1, los dibujos de p06:BDE3[ruina] desde (0xA0, 0)
	call 0b913h		;6117   ; pinta_pantalla_antesala: pantalla apagada, sprites escondidos y la pantalla 0xCC10 de la antesala
	jp 05464h		;611a   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
lleva_segun_ficha_0:		; 0xC240 = el byte 0 de la ficha del personaje 0
	ld a,(0c2b0h)		;611d   ; lee la ficha del personaje 0 (14 bytes)
	ld (0c240h),a		;6120   ; guarda el personaje que se lleva (0 o 1)
	ret			;6123
cuadro_de_la_antesala:		; el personaje en la antesala: su cuadro, andar, sprites, cambio de pantalla y puertas abiertas
	ld a,(0cc14h)		;6124   ; lee el cuadro del personaje en la antesala
	call 05b68h		;6127   ; fotograma_a_f800: un fotograma de cada personaje a la VRAM desde 0xF800 (p00:5B6E)
	call 054b4h		;612a   ; banco_6_en_a000: pone el banco 6 en 0xA000
	call 0bd29h		;612d   ; anda_en_la_antesala: con las teclas, la X (0xCC13) y el sentido (0xCC16) en la antesala
	call 0baaah		;6130   ; sprites_de_la_antesala: los sprites de los personajes en la antesala (p06:BE2D)
	call 0b8fbh		;6133   ; cambia_pantalla_antesala: con la X de la antesala en un borde, la pantalla siguiente o la anterior (0xCC10)
	call 05690h		;6136   ; atributos_a_vram: 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
	call 0b7f5h		;6139   ; puertas_abiertas: cuenta en 0xE322 las puertas abiertas de la pantalla de la antesala (0xE328 + 0xCC10 * 16)
	push af			;613c   ; el acarreo de p06:B7F5
	call 05464h		;613d   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	pop af			;6140
	ret			;6141
marcador_de_vidas:		; con 6: p06:BAAA
	call 054b4h		;6142   ; banco_6_en_a000: pone el banco 6 en 0xA000
	call 0baaah		;6145   ; sprites_de_la_antesala: los sprites de los personajes en la antesala (p06:BE2D)
	jp 05464h		;6148   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_614B:
	call 054b4h		;614b   ; banco_6_en_a000: pone el banco 6 en 0xA000
	call 0b8a5h		;614e   ; colores_de_la_antesala: los colores de sprite de los dos personajes (p06:B8F3/B8F7)
	jp 05464h		;6151   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
marca_e320:		; un 1 dos bytes antes de la direccion de 0xE320
	ld hl,(0e320h)		;6154
	dec l			;6157   ; dos bytes antes
	dec l			;6158
	ld (hl),001h		;6159
	ret			;615b
anda_en_la_antesala_1:		; con 6: el cuadro de andar de la antesala, los sprites y el marcador de vidas
	call 054b4h		;615c   ; banco_6_en_a000: pone el banco 6 en 0xA000
	call 0bd67h		;615f   ; cuadro_de_andar_antesala: 0xCC15 + 1; el cuadro de andar (0xCC14) de sus bits 2 y 3
	call 05464h		;6162   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0cc14h)		;6165   ; lee el cuadro del personaje en la antesala
	call 05b68h		;6168   ; fotograma_a_f800: un fotograma de cada personaje a la VRAM desde 0xF800 (p00:5B6E)
	call marcador_de_vidas		;616b   ; marcador_de_vidas: con 6: p06:BAAA
	call 05690h		;616e   ; atributos_a_vram: 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
	ld hl,0cc13h		;6171   ; apunta a la X en la antesala
	inc (hl)			;6174   ; la X + 3...
	inc (hl)			;6175
	inc (hl)			;6176
	ld a,(hl)			;6177
	cp 0f8h		;6178   ; ...Z al llegar a 0xF8
	ret			;617a
abre_las_puertas:		; el marcador de vidas, los sonidos 0x24 y 0xFF y p06:BA68
	call marcador_de_vidas		;617b   ; marcador_de_vidas: con 6: p06:BAAA
	call 05690h		;617e   ; atributos_a_vram: 0x280 bytes de 0xDC00 (colores y atributos de sprites) a la VRAM 0xF400
	ld a,024h		;6181
	call 056e3h		;6183   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld a,0ffh		;6186
	call 056e3h		;6188   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	call 054b4h		;618b   ; banco_6_en_a000: pone el banco 6 en 0xA000
	call 0ba68h		;618e   ; abre_puertas: 0x18 veces, la puerta de la fase de la ruina (p00:5346) en 0xE328
	jp 05464h		;6191   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
barrido_de_lineas:		; 0x10 lineas verticales de 0x20 puntos (p00:4B0C) desde (H, L)
	ld bc,01020h		;6194   ; 0x10 lineas de 0x20 puntos
L_6197:
	push bc			;6197
	push hl			;6198
	ld b,c			;6199   ; de 0x20 puntos, color 0xFF, en la pagina 0
	ld c,0ffh		;619a
	ld d,000h		;619c
	call 04b0ch		;619e   ; linea_vertical: LINE (0x70) vertical (ARG = 1) de B puntos en (H, L), color C
	pop hl			;61a1
	inc h			;61a2   ; la siguiente, un punto a la derecha
	ld b,080h		;61a3   ; y una espera de 0x80 x 256 vueltas
L_61A5:
	push bc			;61a5
	ld b,000h		;61a6
L_61A8:
	djnz L_61A8		;61a8   ; tres bucles de espera anidados
	pop bc			;61aa
	djnz L_61A5		;61ab
	pop bc			;61ad
	djnz L_6197		;61ae
	ret			;61b0
calcula_la_fase:		; 0xC211 = ruina * 5 + la puerta de la antesala (p01:61C2)
	ld a,(0c21dh)		;61b1   ; lee la ruina (0-4)
	ld b,a			;61b4   ; ruina * 5
	add a,a			;61b5
	add a,a			;61b6
	add a,b			;61b7
	ld d,a			;61b8
	call puerta_de_la_antesala		;61b9   ; puerta_de_la_antesala: B = la puerta (1-5) segun 0xCC10 y la X 0xCC13
	ld a,b			;61bc
	add a,d			;61bd
	ld (0c211h),a		;61be   ; guarda la fase (1-25: ruina * 5 + puerta)
	ret			;61c1
puerta_de_la_antesala:		; B = la puerta (1-5) segun 0xCC10 y la X 0xCC13
	ld a,(0cc10h)		;61c2   ; lee la pantalla de la antesala (0-2)
	ld c,a			;61c5   ; B = pantalla * 2...
	add a,a			;61c6
	dec c			;61c7   ; en la pantalla 2, solo la puerta 5 (el templo)
	dec c			;61c8
	ld b,a			;61c9
	jr z,L_61D4		;61ca
	ld a,(0cc13h)		;61cc   ; lee la X en la antesala
	cp 090h		;61cf   ; en las otras, la segunda puerta si la X pasa de 0x90
	jr c,L_61D4		;61d1
	inc b			;61d3
L_61D4:
	inc b			;61d4   ; de 1 a 5
	ret			;61d5
L_61D6:
	ld c,00fh		;61d6   ; en la escalera, tambien arriba y abajo (0x0F)
	jr L_61E3		;61d8
mando_horizontal:		; las teclas izquierda/derecha (0x0C) de 0xC007 con las de 0xC275
	ld a,(0c24bh)		;61da   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 005h		;61dd
	jr z,L_61D6		;61df
	ld c,00ch		;61e1   ; si no, solo izquierda y derecha (0x0C)
L_61E3:
	ld hl,0c275h		;61e3   ; apunta a las teclas izquierda/derecha del cuadro anterior
	ld a,(0c007h)		;61e6   ; lee las teclas que hay
	and c			;61e9   ; las que hay...
	ld b,a			;61ea
	jr z,L_61F8		;61eb   ; ...ninguna: se guarda 0
	ld a,(0c006h)		;61ed   ; si alguna es nueva, se guardan las nuevas
	and c			;61f0
	jr nz,L_61F8		;61f1
	ld a,b			;61f3   ; si no, las que siguen desde el cuadro anterior
	and (hl)			;61f4
	jr nz,L_61F8		;61f5
	ld a,b			;61f7   ; y si ninguna sigue, las que hay
L_61F8:
	ld (hl),a			;61f8
	ret			;61f9
mira_suelo_del_actor:		; si (ix+5) es cero y no se muere (0xC24B != 4): p01:6309
	ld a,(0c24bh)		;61fa   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;61fd
	ret z			;61ff
	ld a,(ix+005h)		;6200   ; la vida a cero...
	or a			;6203   ; (si no, nada)
	ret nz			;6204
	xor a			;6205   ; ...0xC271 = 0 y muere
	ld (0c271h),a		;6206
	jp muere		;6209   ; muere: sonido 0x8D, accion 4 (0xC24B), paleta y el dibujo de la muerte
cuadro_del_personaje:		; mando, movimiento y la accion 0xC24B (despacho)
	call ficha_del_personaje		;620c   ; ficha_del_personaje: IX = la ficha del personaje que se lleva (0xC2B0 o 0xC2D0)
	call mira_suelo_del_actor		;620f   ; mira_suelo_del_actor: si (ix+5) es cero y no se muere (0xC24B != 4): p01:6309
	ld a,(0c271h)		;6212   ; con 0xC271 puesto, el personaje no se mueve
	or a			;6215
	ret nz			;6216
	call mando_horizontal		;6217   ; mando_horizontal: las teclas izquierda/derecha (0x0C) de 0xC007 con las de 0xC275
	call empujon		;621a   ; empujon: si 0xCCB4/0xCCB5 traen algo: se aplica y se limpian
	call invencible		;621d   ; invencible: la cuenta de 0xC24F mientras 0xC256 y los colores del personaje
	ld a,(0c24bh)		;6220   ; despacha la accion 0xC24B (tabla p01:6226; 4 muere, 5 escalera)
	call 0408dh		;6223   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

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


ficha_del_personaje:		; IX = la ficha del personaje que se lleva (0xC2B0 o 0xC2D0)
	ld ix,0c2b0h		;6234   ; apunta a la ficha del personaje 0 (14 bytes)
	ld a,(0c240h)		;6238   ; el personaje 0...
	or a			;623b
	ret z			;623c
	ld ix,0c2d0h		;623d   ; ...o el 1
	ret			;6241
empujon:		; si 0xCCB4/0xCCB5 traen algo: se aplica y se limpian
	ld a,(0ccb4h)		;6242   ; 0xCCB4/0xCCB5: el empujon pendiente (D y E)
	ld d,a			;6245
	ld a,(0ccb5h)		;6246
	ld e,a			;6249
	or d			;624a
	ret z			;624b
	xor a			;624c   ; se consume: 0xCCB4/0xCCB5 a cero y 0xC264 = 0xC268 = 1
	ld (0ccb4h),a		;624d
	ld (0ccb5h),a		;6250
	inc a			;6253
	ld (0c264h),a		;6254
	ld (0c268h),a		;6257
	ld b,a			;625a
	ld a,d			;625b   ; D distinto de cero: hacia un lado (p01:6365 con B = 1)
	or a			;625c
	jp nz,L_6365		;625d
	ld a,e			;6260   ; E distinto de cero: hacia el otro (B = 2)
	inc b			;6261
	or a			;6262
	jp nz,L_6365		;6263
	xor a			;6266   ; ninguno: 0xC264 y 0xC268 otra vez a cero
	ld (0c264h),a		;6267
	ld (0c268h),a		;626a
	ret			;626d
cae_por_abajo:		; acarreo si la Y pasa de 0xD0 y hay vecina abajo
	ld a,(0c244h)		;626e   ; lee la Y del personaje
	cp 0d0h		;6271
	ccf			;6273   ; acarreo si pasa de 0xD0
	ret nc			;6274
	ld a,(0c219h)		;6275   ; lee la vecina de abajo
	cp 0ffh		;6278   ; 0xFF: sin vecina abajo
	ccf			;627a   ; acarreo si la hay
	ret nc			;627b
	ld (ix+005h),000h		;627c   ; la vida del personaje (a cero muere, p01:61FA) = 0x00
	call muere		;6280   ; muere: sonido 0x8D, accion 4 (0xC24B), paleta y el dibujo de la muerte
	call para_x_y_y		;6283   ; para_x_y_y: velocidades X e Y a cero
	scf			;6286   ; acarreo: cae a la pantalla de abajo
	ret			;6287
L_6288:
	xor a			;6288   ; la accion 0 (en el suelo)
	ld (0c255h),a		;6289
	ld a,(0c006h)		;628c   ; con la tecla nueva de arriba o de salto (0x21)...
	and 021h		;628f
	jp nz,L_637D		;6291   ; ...salta o sube (p01:637D)
	ld a,(0c007h)		;6294   ; con abajo (0x02)...
	and 002h		;6297
	jp nz,L_6399		;6299   ; ...baja la escalera (p01:6399)
	ld hl,00100h		;629c   ; la velocidad Y de caida, 0x100
	ld (0c247h),hl		;629f   ; guarda la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	call para_x		;62a2   ; para_x: 0xC249 = 0: velocidad X a cero
	call suelo_bajo_el_personaje		;62a5   ; suelo_bajo_el_personaje: si hay suelo bajo el personaje en su siguiente Y
	call para_y		;62a8   ; para_y: 0xC247 = 0: velocidad Y a cero
	jr nc,L_62C7		;62ab   ; sin suelo debajo: p01:62C7
	xor a			;62ad
	ld (0c266h),a		;62ae   ; guarda la cuenta de Cles andando sin suelo (0x20 cuadros)
L_62B1:
	ld a,(0c275h)		;62b1   ; lee las teclas izquierda/derecha del cuadro anterior
	and 004h		;62b4   ; con la izquierda...
	jp nz,L_6415		;62b6   ; ...anda a la izquierda (p01:6415)
	ld a,(0c275h)		;62b9   ; lee las teclas izquierda/derecha del cuadro anterior
	and 008h		;62bc   ; con la derecha...
	jp nz,avanza_horizontal		;62be   ; ...a la derecha
	ld a,001h		;62c1   ; sin teclas: parado (0xC255 = 1)
	ld (0c255h),a		;62c3
	ret			;62c6
L_62C7:
	ld a,(0c240h)		;62c7   ; sin suelo debajo: solo Cles...
	cp 001h		;62ca
	jr nz,L_6342		;62cc
	ld a,(0c205h)		;62ce   ; ...con el cartucho 07 52 en otra ranura...
	and 008h		;62d1
	jr nz,L_62DB		;62d3
	ld a,(ix+006h)		;62d5   ; ...o con el estado 0...
	or a			;62d8
	jr nz,L_6342		;62d9
L_62DB:
	ld a,(0c275h)		;62db   ; ...y una direccion pulsada...
	and 00ch		;62de
	jr z,L_6342		;62e0
	ld hl,0c266h		;62e2   ; ...sigue andando sobre el vacio: 0xC266 cuenta 0x20 cuadros
	ld a,(hl)			;62e5
	or a			;62e6
	jr z,L_62FC		;62e7
	cp 001h		;62e9   ; con la cuenta en 1, se acaba
	jr z,L_6342		;62eb
	dec (hl)			;62ed
	ld a,(0c267h)		;62ee   ; la direccion guardada en 0xC267...
	ld b,a			;62f1
	ld a,(0c275h)		;62f2   ; lee las teclas izquierda/derecha del cuadro anterior
	and 00ch		;62f5
	cp b			;62f7
	jr nz,L_6342		;62f8   ; ...si cambia, cae
	jr L_62B1		;62fa   ; la misma: sigue andando
L_62FC:
	ld a,020h		;62fc   ; al llegar al borde: 0x20 cuadros...
	ld (hl),a			;62fe
	ld a,(0c275h)		;62ff   ; lee las teclas izquierda/derecha del cuadro anterior
	and 00ch		;6302
	ld (0c267h),a		;6304   ; ...y la direccion
	jr L_62B1		;6307
muere:		; sonido 0x8D, accion 4 (0xC24B), paleta y el dibujo de la muerte
	ld a,08dh		;6309   ; el sonido 0x8D (la muerte)
	call 056e3h		;630b   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	xor a			;630e   ; sin invencible
	ld (0c256h),a		;630f   ; guarda invencible
	ld (0c24fh),a		;6312
	ld a,004h		;6315   ; la accion 4: muere
	ld (0c24bh),a		;6317   ; guarda la accion del personaje (4 muere, 5 escalera)
	ld a,080h		;631a   ; 0x80 cuadros para el dibujo de la muerte
	ld (0c260h),a		;631c   ; guarda la cuenta de invencible
	call 05a56h		;631f   ; paleta_del_personaje: las paletas p00:5A79/5A80 segun 0xC240
	ld a,(0c246h)		;6322   ; en X - 8...
	sub 008h		;6325
	ld h,a			;6327
	ld a,(0c240h)		;6328   ; lee el personaje que se lleva (0 o 1)
	or a			;632b
	ld b,027h		;632c   ; ...e Y - 0x27 (personaje 0) o Y - 0x21 (personaje 1)...
	jr z,L_6332		;632e
	ld b,021h		;6330
L_6332:
	ld a,(0c244h)		;6332   ; lee la Y del personaje
	sub b			;6335
	ld l,a			;6336
	ld de,02098h		;6337   ; ...se guarda el fondo de 16 x 0x18 en (0x98, 0x20) de la pagina 1 (LMMM)
	ld bc,01018h		;633a
	ld a,010h		;633d
	jp 04c73h		;633f   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
L_6342:
	xor a			;6342   ; cae: sin cuenta de andar sin suelo...
	ld (0c266h),a		;6343   ; guarda la cuenta de Cles andando sin suelo (0x20 cuadros)
	ld (0c265h),a		;6346   ; ...sin disparo pedido...
	ld a,003h		;6349   ; ...y la accion 3 (sin suelo debajo)
	ld (0c24bh),a		;634b   ; guarda la accion del personaje (4 muere, 5 escalera)
	jp para_x		;634e   ; para_x: 0xC249 = 0: velocidad X a cero
empieza_salto:		; 0xC264 = 1 y el salto segun la accion
	xor a			;6351
	ld (0c268h),a		;6352
	inc a			;6355
	ld (0c264h),a		;6356
	ld a,(0c24bh)		;6359   ; en la escalera...
	cp 005h		;635c
	jr z,L_636A		;635e   ; ...es otra cosa (p01:636A)
	ld a,(0c250h)		;6360   ; el sentido + 1: la direccion del salto (1 o 2)
	inc a			;6363
	ld b,a			;6364
L_6365:
	call pon_c254		;6365   ; pon_c254: 0xC254 = B
	jr L_638D		;6368
L_636A:
	call suelo_bajo_el_personaje		;636a   ; suelo_bajo_el_personaje: si hay suelo bajo el personaje en su siguiente Y
	jr nc,L_6342		;636d   ; sin suelo, parado
	ld hl,(0c243h)		;636f   ; en la escalera: la Y 16 lineas arriba
	ld de,00010h		;6372
	or a			;6375
	sbc hl,de		;6376
	ld (0c243h),hl		;6378   ; guarda la Y del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	jr L_6342		;637b
L_637D:
	ld a,(0c006h)		;637d   ; lee las teclas nuevas
	and 020h		;6380   ; con salto (0x20)...
	jr nz,L_638A		;6382   ; ...salta
	call ficha_arriba		;6384   ; con arriba: si hay escalera encima...
	jp c,L_63E0		;6387   ; ...a la escalera (p01:63E0)
L_638A:
	call lee_direccion		;638a   ; lee_direccion: B = 0, 1 o 2 segun las teclas izquierda/derecha (0xC254)
L_638D:
	xor a			;638d
	ld (0c24eh),a		;638e
	inc a			;6391   ; la accion 1: en el aire
	ld (0c251h),a		;6392
	ld (0c24bh),a		;6395   ; guarda la accion del personaje (4 muere, 5 escalera)
	ret			;6398
L_6399:
	call ficha_abajo		;6399   ; con abajo: si hay escalera debajo...
	jr nc,L_63B0		;639c
	ld hl,(0c245h)		;639e   ; ...o dos puntos a la izquierda...
	push hl			;63a1
	dec h			;63a2
	dec h			;63a3
	ld (0c245h),hl		;63a4   ; guarda la X del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	call ficha_abajo		;63a7   ; ficha_abajo: la ficha 13 puntos por debajo del personaje si esta centrado en la casilla
	pop hl			;63aa
	ld (0c245h),hl		;63ab   ; guarda la X del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	jr c,L_63E0		;63ae   ; ...a la escalera
L_63B0:
	ld a,002h		;63b0   ; si no, la accion 2
	ld (0c24bh),a		;63b2   ; guarda la accion del personaje (4 muere, 5 escalera)
	ret			;63b5
L_63B6:
	xor a			;63b6   ; al suelo: sin disparo pedido ni salto
	ld (0c265h),a		;63b7   ; guarda el doble salto ya usado
	ld (0c264h),a		;63ba
	ld (0c268h),a		;63bd
	ld a,(0ccb0h)		;63c0   ; con 0xCCB0 (sobre una plataforma) no se ajusta la Y
	or a			;63c3
	jr nz,L_63D2		;63c4
	ld a,(0c244h)		;63c6   ; la Y a la fila de 8 + 3
	add a,004h		;63c9
	and 0f8h		;63cb
	add a,003h		;63cd
	ld (0c244h),a		;63cf   ; guarda la Y del personaje
L_63D2:
	call para_x_y_y		;63d2   ; para_x_y_y: velocidades X e Y a cero
	call cuadro_parado		;63d5   ; cuadro_parado: el cuadro de animacion parado o el de p01:69E6[(ix+1)]
	xor a			;63d8   ; la accion 0, en el suelo
	ld (0c266h),a		;63d9   ; guarda la cuenta de Cles andando sin suelo (0x20 cuadros)
	ld (0c24bh),a		;63dc   ; guarda la accion del personaje (4 muere, 5 escalera)
	ret			;63df
L_63E0:
	ld a,(0c246h)		;63e0   ; a la escalera: la X al centro de su casilla de 16
	and 00fh		;63e3
	cp 008h		;63e5   ; en la mitad izquierda...
	ld a,(0c246h)		;63e7   ; lee la X del personaje
	jr nc,L_63F2		;63ea
	and 0f0h		;63ec   ; ...el centro de esta
	add a,008h		;63ee
	jr L_63F6		;63f0
L_63F2:
	add a,008h		;63f2   ; en la derecha, el de la siguiente
	and 0f0h		;63f4
L_63F6:
	ld (0c246h),a		;63f6   ; guarda la X del personaje
	call ficha_abajo		;63f9   ; ficha_abajo: la ficha 13 puntos por debajo del personaje si esta centrado en la casilla
	jr c,L_640B		;63fc   ; escalera debajo...
	call ficha_arriba		;63fe   ; ...o encima
	jr c,L_640B		;6401   ; escalera debajo o encima: a ella
	ld a,(0c246h)		;6403   ; si no, la X vuelve 8 atras
	sub 008h		;6406
	ld (0c246h),a		;6408   ; guarda la X del personaje
L_640B:
	ld a,005h		;640b   ; la accion 5: en la escalera
	ld (0c24bh),a		;640d   ; guarda la accion del personaje (4 muere, 5 escalera)
	ret			;6410
avanza_horizontal:		; mueve en X con la velocidad de p01:6485 y mira las paredes
	ld a,001h		;6411   ; a la derecha (sentido 1)
	jr L_6416		;6413
L_6415:
	xor a			;6415   ; a la izquierda (sentido 0)
L_6416:
	ld hl,0c252h		;6416   ; apunta a la cuenta de cuadros del paso del personaje
	inc (hl)			;6419
	call cambia_sentido		;641a   ; cambia_sentido: 0xC250 = A y, si cambia, p01:69AC
	push de			;641d
	call velocidad_x		;641e   ; velocidad_x: 0xC249 = la velocidad X de p01:6485[(ix+1)], con el signo de 0xC250
	pop de			;6421
	call prueba_pared_6		;6422   ; prueba_pared_6: p01:644C con D = 6
	ret c			;6425   ; con pared, no avanza (acarreo)
	call suma_velocidad_x		;6426   ; suma_velocidad_x: 0xC245 = 0xC245 + 0xC249: la X de 16 bits
	or a			;6429   ; sin acarreo: ha avanzado
	ret			;642a
prueba_pared:		; acarreo si hay pared a D puntos (p01:644C)
	ld d,007h		;642b
	call prueba_pared_d		;642d   ; prueba_pared_d: mira la casilla a D puntos en el sentido de la velocidad (p01:70D2)
	ret c			;6430   ; pared: acarreo
	ld a,(0ccb2h)		;6431   ; sobre una plataforma que se mueve (0xCCB1/0xCCB2)...
	ld b,a			;6434
	ld a,(0ccb1h)		;6435
	or b			;6438
	scf			;6439   ; ...acarreo tambien
	ret nz			;643a
	ld hl,(0c245h)		;643b   ; prueba a avanzar...
	push hl			;643e
	call suma_velocidad_x		;643f   ; suma_velocidad_x: 0xC245 = 0xC245 + 0xC249: la X de 16 bits
	call suelo_bajo_el_personaje		;6442   ; ...mira si queda suelo...
	pop hl			;6445   ; ...y deshace el avance
	ld (0c245h),hl		;6446   ; guarda la X del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	ret			;6449
prueba_pared_6:		; p01:644C con D = 6
	ld d,006h		;644a
prueba_pared_d:		; mira la casilla a D puntos en el sentido de la velocidad (p01:70D2)
	ld e,0f8h		;644c   ; E = -8: la casilla de debajo
	ld a,(0c24ah)		;644e   ; la velocidad X (0xC24A, la parte alta): si va hacia la izquierda, D al otro lado
	cp 080h		;6451
	jr c,L_645A		;6453
	ld a,d			;6455   ; a la izquierda, D = -D - 1
	neg		;6456
	dec a			;6458
	ld d,a			;6459
L_645A:
	jp L_70D2		;645a
cambia_sentido:		; 0xC250 = A y, si cambia, p01:69AC
	ld b,a			;645d
	ld a,(0c250h)		;645e   ; lee el sentido del personaje
	xor b			;6461   ; Z si no cambia
	ld a,b			;6462
	ld (0c250h),a		;6463   ; guarda el sentido del personaje
	ret z			;6466   ; sin cambio, nada
	push de			;6467
	call cuadro_parado		;6468   ; si cambia, el cuadro de parado
	pop de			;646b
	ret			;646c
velocidad_x:		; 0xC249 = la velocidad X de p01:6485[(ix+1)], con el signo de 0xC250
	ld hl,06485h		;646d
	ld a,(ix+001h)		;6470   ; lee el nivel de velocidad del personaje (indice de p01:6485)
	call 0543ah		;6473   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;6476
	ld a,(0c250h)		;6477   ; lee el sentido del personaje
	or a			;647a   ; a la izquierda (0), la velocidad en negativo
	call z,08b39h		;647b   ; niega_de: DE = -DE
	ld (0c249h),de		;647e   ; guarda la velocidad X del personaje (16 bits) y el byte siguiente (16 bits)
	jp para_y		;6482   ; para_y: 0xC247 = 0: velocidad Y a cero

; ----------------------------------------------------------------------
; DATOS tabla_p646D: 10 bytes que lee p01:646D (ld hl,0x6485)
;   0x6485..0x648f  (10 bytes)
DATA_tabla_p646D:
	defb 080h,001h,000h,002h,080h,002h,000h,003h,080h,003h	; 6485  ..........

; ======================================================================
; CODIGO 0x648f..0x64a0  (17 bytes)
; ======================================================================


velocidad_y:		; 0xC247 = la velocidad Y de p01:64A0[(ix+1)]
	ld hl,064a0h		;648f
	ld a,(ix+001h)		;6492   ; lee el nivel de velocidad del personaje (indice de p01:6485)
	call 0543ah		;6495   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;6498
	ld (0c247h),de		;6499   ; guarda la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	jp para_x		;649d   ; para_x: 0xC249 = 0: velocidad X a cero

; ----------------------------------------------------------------------
; DATOS tabla_p648F: 10 bytes que lee p01:648F (ld hl,0x64A0)
;   0x64a0..0x64aa  (10 bytes)
DATA_tabla_p648F:
	defb 080h,001h,000h,002h,080h,002h,000h,003h,080h,003h	; 64a0  ..........

; ======================================================================
; CODIGO 0x64aa..0x6861  (951 bytes)
; ======================================================================


L_64AA:
	call suma_velocidad_y		;64aa   ; suma_velocidad_y: 0xC243 = 0xC243 + 0xC247: la Y de 16 bits
suma_velocidad_x:		; 0xC245 = 0xC245 + 0xC249: la X de 16 bits
	ld de,(0c245h)		;64ad   ; lee la X del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	ld hl,(0c249h)		;64b1   ; lee la velocidad X del personaje (16 bits) y el byte siguiente (16 bits)
	add hl,de			;64b4   ; X + velocidad X
	ld (0c245h),hl		;64b5   ; guarda la X del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	ret			;64b8
suma_velocidad_y:		; 0xC243 = 0xC243 + 0xC247: la Y de 16 bits
	ld de,(0c243h)		;64b9   ; lee la Y del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	ld hl,(0c247h)		;64bd   ; lee la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	add hl,de			;64c0   ; Y + velocidad Y
	ld (0c243h),hl		;64c1   ; guarda la Y del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	ret			;64c4
L_64C5:
	call doble_salto		;64c5   ; accion 1 (en el aire): el doble salto...
	jp c,L_637D		;64c8   ; ...vuelve a empezar el salto (p01:637D)
	call cae_por_abajo		;64cb   ; cae_por_abajo: acarreo si la Y pasa de 0xD0 y hay vecina abajo
	ret c			;64ce   ; acarreo: a la pantalla de abajo
	call salto_de_tabla		;64cf   ; salto_de_tabla: con 15: la tabla de salto p15:BE16[(ix+2)]
	call salto		;64d2   ; salto: el salto: teclas, 0xC254 y la velocidad Y
	call techo_del_personaje		;64d5   ; techo_del_personaje: las fichas encima del personaje (p01:7132)
	call c,para_y		;64d8   ; con techo, se para la subida
	call prueba_pared		;64db   ; prueba_pared: acarreo si hay pared a D puntos (p01:644C)
	call c,direccion_y_para		;64de   ; con pared, se para la X
	call suelo_bajo_el_personaje		;64e1   ; suelo_bajo_el_personaje: si hay suelo bajo el personaje en su siguiente Y
	jp c,L_66A6		;64e4   ; con suelo, aterriza (p01:66A6)
	ld a,(0ccb3h)		;64e7
	or a			;64ea
	call nz,borra_c251		;64eb   ; sobre una plataforma (0xCCB3), sin 0xC251
	jp L_64AA		;64ee   ; y la Y y la X avanzan
doble_salto:		; en el aire, con salto nuevo (0x21): Wit con el estado 0 o con el cartucho 07 52 (0xC205 bit 3) salta otra vez, una sola (0xC265); acarreo
	ld a,(0c264h)		;64f1
	or a			;64f4
	ret nz			;64f5   ; solo si 0xC264 esta a cero
	ld a,(0c006h)		;64f6   ; lee las teclas nuevas
	and 021h		;64f9   ; una pulsacion nueva de salto (0x21)
	ret z			;64fb
	ld a,(0c240h)		;64fc   ; lee el personaje que se lleva (0 o 1)
	or a			;64ff
	ret nz			;6500   ; solo Wit
	ld a,(0c205h)		;6501   ; lee los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
	and 008h		;6504
	jr nz,L_650D		;6506   ; con el cartucho 07 52, siempre
	ld a,(ix+006h)		;6508   ; lee el estado del personaje (0-3)
	or a			;650b
	ret nz			;650c   ; si no, solo con el estado 0
L_650D:
	ld a,(0c265h)		;650d   ; el doble salto ya usado?
	or a			;6510
	ret nz			;6511   ; una sola vez por salto
	ld a,001h		;6512   ; se pide y acarreo
	ld (0c265h),a		;6514   ; guarda el doble salto ya usado
	scf			;6517
	ret			;6518
borra_c251:		; 0xC251 = 0
	xor a			;6519
	ld (0c251h),a		;651a
	ret			;651d
salto:		; el salto: teclas, 0xC254 y la velocidad Y
	ld a,(0c264h)		;651e
	or a			;6521
	jr nz,L_652C		;6522   ; en el salto, sin tecla de salto (0x21)...
	ld a,(0c007h)		;6524   ; lee las teclas que hay
	and 021h		;6527
	call z,borra_c251		;6529   ; ...se corta la subida (0xC251 = 0)
L_652C:
	ld a,(0c254h)		;652c   ; lee la direccion de las teclas (0, 1, 2)
	cp 001h		;652f   ; la direccion del salto: 1 a la derecha...
	jr z,L_6562		;6531
	jr nc,L_655A		;6533   ; ...2 a la izquierda; 0, ninguna:
	ld a,(0c275h)		;6535   ; lee las teclas izquierda/derecha del cuadro anterior
	and 004h		;6538   ; en un salto vertical, con izquierda...
	ld de,0ff80h		;653a   ; ...la velocidad X - 0x80...
	jr nz,L_6549		;653d
	ld a,(0c275h)		;653f   ; lee las teclas izquierda/derecha del cuadro anterior
	and 008h		;6542   ; ...y con derecha + 0 (D = 0, E = 0x80)
	ld d,000h		;6544
	jr nz,L_6549		;6546
	ret			;6548
L_6549:
	ld hl,(0c249h)		;6549   ; la velocidad X + DE
	add hl,de			;654c
	ld (0c249h),hl		;654d   ; guarda la velocidad X del personaje (16 bits) y el byte siguiente (16 bits)
	add hl,hl			;6550   ; su signo: el sentido
	ld a,001h		;6551
	jr nc,L_6556		;6553
	xor a			;6555
L_6556:
	ld (0c250h),a		;6556   ; guarda el sentido del personaje
	ret			;6559
L_655A:
	ld a,(0c275h)		;655a   ; lee las teclas izquierda/derecha del cuadro anterior
	and 008h		;655d   ; en un salto a la izquierda, con la derecha...
	ret z			;655f
	jr L_6568		;6560
L_6562:
	ld a,(0c275h)		;6562   ; lee las teclas izquierda/derecha del cuadro anterior
	and 004h		;6565   ; en uno a la derecha, con la izquierda...
	ret z			;6567
L_6568:
	ld hl,(0c249h)		;6568   ; ...la velocidad X - 0x80, sin pasar de cero
	ld de,00080h		;656b
	or a			;656e
	sbc hl,de		;656f
	ret c			;6571
	ld (0c249h),hl		;6572   ; guarda la velocidad X del personaje (16 bits) y el byte siguiente (16 bits)
	ret			;6575
salto_de_tabla:		; con 15: la tabla de salto p15:BE16[(ix+2)]
	ld a,(0c265h)		;6576   ; lee el doble salto ya usado
	or a			;6579   ; con el doble salto (0xC265 no cero)...
	jr z,L_6580		;657a
	ld a,002h		;657c   ; ...A = 2, pero este `jr z` nunca salta (Z sigue a cero): cae en p01:6580
	jr z,L_658B		;657e
L_6580:
	ld a,(0c264h)		;6580
	or a			;6583   ; con 0xC264...
	ld a,002h		;6584   ; ...tambien la 2
	jr nz,L_658B		;6586
	ld a,(ix+002h)		;6588   ; si no, la de su nivel de salto (ix+2)
L_658B:
	push af			;658b
	call 054a5h		;658c   ; banco_15_en_a000: pone el banco 15 en 0xA000 (p00:54B9)
	pop af			;658f
	ld hl,0be16h		;6590
	call 0543ah		;6593   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,(0c24eh)		;6596   ; el paso del salto (0xC24E)...
	ld b,a			;6599
	ld a,(hl)			;659a   ; ...el primer byte de la tabla: cuando se corta la subida
	inc hl			;659b
	cp b			;659c
	call z,borra_c251		;659d   ; borra_c251: 0xC251 = 0
	ld a,b			;65a0
	cp 0ffh		;65a1   ; 0xFF: el salto acaba
	push af			;65a3
	call 05464h		;65a4   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	pop af			;65a7
	jp z,L_6342		;65a8   ; a la accion 3
	push af			;65ab
	call 054a5h		;65ac   ; banco_15_en_a000: pone el banco 15 en 0xA000 (p00:54B9)
	pop af			;65af
	call 04083h		;65b0   ; el byte del paso
	call para_x		;65b3   ; para_x: 0xC249 = 0: velocidad X a cero
	ld a,(0c254h)		;65b6   ; con direccion, la velocidad X 0x200 a su lado
	cp 001h		;65b9
	jr c,L_65C8		;65bb
	ld d,0feh		;65bd
	ld e,000h		;65bf
	call z,08b39h		;65c1   ; niega_de: DE = -DE
	ld (0c249h),de		;65c4   ; guarda la velocidad X del personaje (16 bits) y el byte siguiente (16 bits)
L_65C8:
	ld b,(hl)			;65c8   ; la velocidad Y del paso...
	call 05464h		;65c9   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld a,(0c251h)		;65cc   ; ...hacia arriba (negativa) mientras 0xC251
	or a			;65cf
	ld d,b			;65d0
	ld e,000h		;65d1
	call z,08b39h		;65d3   ; niega_de: DE = -DE
	ld (0c247h),de		;65d6   ; guarda la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	ld a,(0c251h)		;65da
	ld hl,0c24eh		;65dd   ; el paso siguiente
	inc (hl)			;65e0
	or a			;65e1
	ret nz			;65e2
	dec (hl)			;65e3   ; bajando, el paso va hacia atras
	dec (hl)			;65e4
	ret			;65e5
L_65E6:
	neg		;65e6
	ret			;65e8
lee_direccion:		; B = 0, 1 o 2 segun las teclas izquierda/derecha (0xC254)
	ld a,(0c007h)		;65e9   ; las teclas izquierda/derecha (bits 2 y 3)
	ld c,a			;65ec
	and 00ch		;65ed
	xor 00ch		;65ef   ; ninguna o las dos: B = 0
	ld b,000h		;65f1
	jr z,pon_c254		;65f3
	ld a,c			;65f5
	inc b			;65f6
	and 008h		;65f7   ; derecha: B = 1, D = 1
	ld d,001h		;65f9
	jr nz,L_6608		;65fb
	ld a,c			;65fd
	inc b			;65fe
	dec d			;65ff
	and 004h		;6600   ; izquierda: B = 2, D = 0
	jr nz,L_6608		;6602
	ld b,000h		;6604   ; las dos o ninguna: B = 0
	jr pon_c254		;6606
L_6608:
	ld a,d			;6608
	ld (0c250h),a		;6609   ; guarda el sentido del personaje
pon_c254:		; 0xC254 = B
	ld a,b			;660c
	ld (0c254h),a		;660d   ; guarda la direccion de las teclas (0, 1, 2)
	ret			;6610
direccion_y_para:		; p01:65E9 y velocidad X a cero
	call lee_direccion		;6611   ; lee_direccion: B = 0, 1 o 2 segun las teclas izquierda/derecha (0xC254)
para_x:		; 0xC249 = 0: velocidad X a cero
	push hl			;6614
	ld hl,00000h		;6615
	ld (0c249h),hl		;6618   ; guarda la velocidad X del personaje (16 bits) y el byte siguiente (16 bits)
	pop hl			;661b
	ret			;661c
para_x_y_y:		; velocidades X e Y a cero
	call para_x		;661d   ; para_x: 0xC249 = 0: velocidad X a cero
para_y:		; 0xC247 = 0: velocidad Y a cero
	push hl			;6620
	ld hl,00000h		;6621
	ld (0c247h),hl		;6624   ; guarda la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	pop hl			;6627
	ret			;6628
L_6629:
	ld hl,00100h		;6629   ; la accion 3 (sin suelo): cae a 0x100
	ld (0c247h),hl		;662c   ; guarda la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	call suelo_bajo_el_personaje		;662f   ; suelo_bajo_el_personaje: si hay suelo bajo el personaje en su siguiente Y
	jp nc,L_6342		;6632   ; sin suelo, sigue cayendo
	call para_y		;6635   ; para_y: 0xC247 = 0: velocidad Y a cero
	ld a,(0c26ch)		;6638   ; lee la cuenta de la postura de disparo (4 u 8)
	or a			;663b
	jr nz,L_6659		;663c   ; con la postura de disparo, su cuenta
	ld a,(0c007h)		;663e   ; lee las teclas que hay
	and 002h		;6641
	jp z,L_63D2		;6643   ; sin abajo, al suelo (p01:63D2)
L_6646:
	ld a,(0c275h)		;6646   ; lee las teclas izquierda/derecha del cuadro anterior
	and 004h		;6649   ; con izquierda, el sentido 0
	ld a,000h		;664b
	jr nz,L_665F		;664d
	ld a,(0c275h)		;664f   ; lee las teclas izquierda/derecha del cuadro anterior
	and 008h		;6652   ; con derecha, el 1
	ld a,001h		;6654
	jr nz,L_665F		;6656
	ret			;6658
L_6659:
	ld hl,0c26ch		;6659   ; apunta a la cuenta de la postura de disparo (4 u 8)
	dec (hl)			;665c
	jr L_6646		;665d
L_665F:
	ld (0c250h),a		;665f   ; guarda el sentido del personaje
	ret			;6662
L_6663:
	call cae_por_abajo		;6663   ; la accion 6
	ret c			;6666
	call para_x		;6667   ; para_x: 0xC249 = 0: velocidad X a cero
	ld hl,00600h		;666a   ; cae a 0x600
	ld (0c247h),hl		;666d   ; guarda la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	ld a,(0c275h)		;6670   ; lee las teclas izquierda/derecha del cuadro anterior
	and 008h		;6673   ; con derecha...
	jr nz,L_668B		;6675
	ld a,(0c275h)		;6677   ; lee las teclas izquierda/derecha del cuadro anterior
	and 004h		;667a   ; ...o izquierda, se mueve de lado
	jr nz,L_6686		;667c
	call suelo_bajo_el_personaje		;667e   ; suelo_bajo_el_personaje: si hay suelo bajo el personaje en su siguiente Y
	jp c,L_66A6		;6681   ; sin teclas: con suelo, aterriza
	jr L_66A3		;6684
L_6686:
	xor a			;6686   ; izquierda: sentido 0 y velocidad X -1
	ld b,0ffh		;6687
	jr L_668E		;6689
L_668B:
	ld a,001h		;668b   ; derecha: sentido 1 y velocidad X +1
	ld b,a			;668d
L_668E:
	ld (0c250h),a		;668e   ; guarda el sentido del personaje
	ld a,b			;6691
	ld (0c24ah),a		;6692
	call suelo_bajo_el_personaje		;6695   ; suelo_bajo_el_personaje: si hay suelo bajo el personaje en su siguiente Y
	jp c,L_66A6		;6698   ; con suelo, aterriza
	call prueba_pared		;669b   ; prueba_pared: acarreo si hay pared a D puntos (p01:644C)
	jr nc,L_66A3		;669e
	call para_x		;66a0   ; con pared, sin X
L_66A3:
	jp L_64AA		;66a3
L_66A6:
	ld a,003h		;66a6   ; el sonido 3: aterriza
	call 056e3h		;66a8   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	jp L_63B6		;66ab
L_66AE:
	ld hl,0c260h		;66ae   ; la accion 4 (muere): la cuenta de 0xC260
	ld a,(hl)			;66b1
	or a			;66b2
	ret z			;66b3
	dec (hl)			;66b4
	ret nz			;66b5
	ld (ix+000h),001h		;66b6   ; a cero: el personaje ha caido
	ld a,(0c2b0h)		;66ba   ; lee la ficha del personaje 0 (14 bytes)
	ld b,a			;66bd
	ld a,(0c2d0h)		;66be   ; lee la ficha del personaje 1 (14 bytes)
	and b			;66c1   ; si han caido los dos...
	jr nz,L_66DF		;66c2   ; ...se acaba la fase (p01:66DF)
	ld a,(0c211h)		;66c4   ; si no: 0xC270 = esta fase...
	ld (0c270h),a		;66c7
	call 08e2eh		;66ca   ; ...fuera los actores...
	call recorre_cd00		;66cd   ; recorre_cd00: p01:76DA con los 9 actores de 0xCD00
	ld de,08020h		;66d0   ; ...y el actor 0x30 en (0x20, 0x80)
	ld c,030h		;66d3
	push ix		;66d5
	call 08613h		;66d7   ; crea_actor_0: p02:8615 con B = 0
	pop ix		;66da
	jp 08231h		;66dc   ; juego_30: el juego de sprites 0x30 (p00:55F0)
L_66DF:
	xor a			;66df   ; la fase se para
	ld (0c214h),a		;66e0   ; guarda en marcha la fase
	ld (0c258h),a		;66e3
	ld (0c270h),a		;66e6
	ret			;66e9
recorre_cd00:		; p01:76DA con los 9 actores de 0xCD00
	ld b,009h		;66ea
	ld ix,0cd00h		;66ec   ; apunta a los 9 actores de la pantalla (0x80 bytes cada uno)
L_66F0:
	push bc			;66f0
	call libera_piezas		;66f1   ; libera_piezas: libera en 0xCC80 las piezas (ix+0x20) del actor
	ld de,00080h		;66f4
	add ix,de		;66f7
	pop bc			;66f9
	djnz L_66F0		;66fa
	ret			;66fc
L_66FD:
	xor a			;66fd   ; la accion 5 (escalera): la direccion de las teclas
	ld (0c254h),a		;66fe   ; guarda la direccion de las teclas (0, 1, 2)
	ld a,(0c275h)		;6701   ; lee las teclas izquierda/derecha del cuadro anterior
	ld c,a			;6704
	and 002h		;6705   ; abajo
	jr nz,L_672A		;6707
	ld a,c			;6709
	and 001h		;670a   ; arriba
	jr nz,L_675E		;670c
	ld a,c			;670e
	and 004h		;670f   ; izquierda: 1
	jr nz,L_6719		;6711
	ld a,c			;6713
	and 008h		;6714   ; derecha: 2
	jr nz,L_671D		;6716
	ret			;6718
L_6719:
	ld a,001h		;6719
	jr L_671F		;671b
L_671D:
	ld a,002h		;671d
L_671F:
	ld (0c254h),a		;671f   ; guarda la direccion de las teclas (0, 1, 2)
	ret			;6722
mira_y_cae:		; p01:70AC y, si no hay acarreo, p01:63B6
	call ficha_abajo		;6723   ; ficha_abajo: la ficha 13 puntos por debajo del personaje si esta centrado en la casilla
	ret c			;6726   ; con escalera debajo, sigue en ella
	jp L_63B6		;6727
L_672A:
	call velocidad_y		;672a   ; baja la escalera: la velocidad Y de su nivel
	call ficha_abajo		;672d   ; escalera debajo...
	jr nc,L_6744		;6730
	ld hl,(0c245h)		;6732   ; ...o dos puntos a la izquierda
	push hl			;6735
	dec h			;6736
	dec h			;6737
	ld (0c245h),hl		;6738   ; guarda la X del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	call ficha_abajo		;673b   ; ficha_abajo: la ficha 13 puntos por debajo del personaje si esta centrado en la casilla
	pop hl			;673e
	ld (0c245h),hl		;673f   ; guarda la X del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	jr c,L_6756		;6742
L_6744:
	ld a,(0c244h)		;6744   ; la ficha dos lineas mas arriba
	sub 002h		;6747
	ld e,a			;6749
	call ficha_en_x		;674a   ; ficha_en_x: la ficha en (X del personaje, A) (p01:7176)
	jp nc,L_63B6		;674d   ; sin ella, al suelo
	call suelo_bajo_el_personaje		;6750   ; suelo_bajo_el_personaje: si hay suelo bajo el personaje en su siguiente Y
	jp c,L_63B6		;6753   ; con suelo, al suelo
L_6756:
	call suma_velocidad_y		;6756   ; suma_velocidad_y: 0xC243 = 0xC243 + 0xC247: la Y de 16 bits
	ld hl,0c252h		;6759   ; apunta a la cuenta de cuadros del paso del personaje
	inc (hl)			;675c
	ret			;675d
L_675E:
	call velocidad_y		;675e   ; sube la escalera: la velocidad Y de su nivel, hacia arriba
	ld de,(0c247h)		;6761   ; lee la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	call 08b39h		;6765   ; niega_de: DE = -DE
	ld (0c247h),de		;6768   ; guarda la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	ld a,(0c244h)		;676c   ; lee la Y del personaje
	cp 0c8h		;676f   ; por debajo de 0xC8...
	jr nc,L_67B7		;6771
	cp 030h		;6773   ; ...o por encima de 0x30, sin mirar el suelo
	jr c,L_679A		;6775
	ld de,(0c247h)		;6777   ; lee la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	push de			;677b
	ld de,0e000h		;677c   ; prueba con la velocidad -0x2000...
	ld (0c247h),de		;677f   ; guarda la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	call suelo_bajo_el_personaje		;6783   ; suelo_bajo_el_personaje: si hay suelo bajo el personaje en su siguiente Y
	jr nc,L_6792		;6786
	ld de,0e800h		;6788   ; ...y con -0x1800: si hay suelo, se para
	ld (0c247h),de		;678b   ; guarda la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	call suelo_bajo_el_personaje		;678f   ; suelo_bajo_el_personaje: si hay suelo bajo el personaje en su siguiente Y
L_6792:
	pop de			;6792
	ld (0c247h),de		;6793   ; guarda la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	jp c,para_y		;6797   ; para_y: 0xC247 = 0: velocidad Y a cero
L_679A:
	call ficha_arriba		;679a   ; ficha_arriba: la ficha 4 puntos por encima del personaje si esta centrado en la casilla
	jr c,L_67B7		;679d   ; con escalera encima, sube
	call mira_y_cae		;679f   ; mira_y_cae: p01:70AC y, si no hay acarreo, p01:63B6
	ld a,(0c244h)		;67a2   ; lee la Y del personaje
	add a,004h		;67a5   ; la ficha 4 lineas mas abajo
	call ficha_en_x		;67a7   ; ficha_en_x: la ficha en (X del personaje, A) (p01:7176)
	jr c,L_67B7		;67aa
	call suelo_bajo_el_personaje		;67ac   ; suelo_bajo_el_personaje: si hay suelo bajo el personaje en su siguiente Y
	jr c,L_67B7		;67af
	call suma_velocidad_y		;67b1   ; sin escalera: sube del todo y al suelo
	jp L_63B6		;67b4
L_67B7:
	call suma_velocidad_y		;67b7   ; suma_velocidad_y: 0xC243 = 0xC243 + 0xC247: la Y de 16 bits
	ld hl,0c252h		;67ba   ; apunta a la cuenta de cuadros del paso del personaje
	inc (hl)			;67bd
	ret			;67be
L_67BF:
	xor a			;67bf   ; parado (0xC255 = 0) y avanza
	ld (0c255h),a		;67c0
	call avanza_horizontal		;67c3   ; avanza_horizontal: mueve en X con la velocidad de p01:6485 y mira las paredes
	call c,suma_velocidad_x		;67c6   ; suma_velocidad_x: 0xC245 = 0xC245 + 0xC249: la X de 16 bits
	ret			;67c9
invencible:		; la cuenta de 0xC24F mientras 0xC256 y los colores del personaje
	ld a,(0c258h)		;67ca   ; con 0xC258...
	or a			;67cd
	jr nz,L_67D6		;67ce
	ld a,(0c24bh)		;67d0   ; ...o sin morir
	cp 004h		;67d3
	ret z			;67d5
L_67D6:
	ld a,(0c256h)		;67d6   ; lee invencible
	or a			;67d9
	jr z,colores_del_personaje		;67da   ; sin invencible, los colores normales
	ld hl,0c24fh		;67dc
	dec (hl)			;67df   ; la cuenta de invencible...
	jr nz,L_67E8		;67e0
	xor a			;67e2   ; ...acabada
	ld (0c256h),a		;67e3   ; guarda invencible
	jr colores_del_personaje		;67e6
L_67E8:
	ld de,00d4ah		;67e8   ; invencible: en cuadros alternos, los colores 0x0D y 0x4A
	ld a,(0c00dh)		;67eb   ; lee la cuenta de cuadros del juego
	and 001h		;67ee
	jr z,L_6808		;67f0
colores_del_personaje:		; 0xC24C/0xC24D segun el personaje y la sala
	ld a,(0c240h)		;67f2   ; lee el personaje que se lleva (0 o 1)
	or a			;67f5
	ld de,00649h		;67f6
	jr z,L_6808		;67f9
	ld a,(0c20ah)		;67fb   ; lee en la sala de la puerta 5
	ld b,a			;67fe
	ld a,(0c316h)		;67ff   ; lee en la sala del final de fase
	or b			;6802   ; Cles en la sala 5 o en la del final de fase...
	jr z,L_6808		;6803
	ld de,0064bh		;6805   ; ...con 6 y 0x4B
L_6808:
	ld a,d			;6808   ; la capa 0
	ld (0c24ch),a		;6809   ; guarda el color de la capa 0 del personaje
	ld a,e			;680c   ; la capa 1 (con el bit CC)
	ld (0c24dh),a		;680d   ; guarda el color de la capa 1 del personaje
	ret			;6810
accion_6:		; accion 6, los colores del personaje y sin invencible (0xC256 = 0)
	ld a,006h		;6811   ; la accion 6
	ld (0c24bh),a		;6813   ; guarda la accion del personaje (4 muere, 5 escalera)
	call colores_del_personaje		;6816   ; colores_del_personaje: 0xC24C/0xC24D segun el personaje y la sala
	xor a			;6819
	ld (0c256h),a		;681a   ; guarda invencible
	ld (0c24fh),a		;681d   ; 0xC24F a cero
	ret			;6820
L_6821:
	ld a,001h		;6821   ; muriendo, la linea 0xD1
	jr L_6838		;6823
dibuja_al_personaje:		; las fichas del personaje en la pagina 1 segun 0xC253 y 0xC26F
	call ficha_del_personaje		;6825   ; ficha_del_personaje: IX = la ficha del personaje que se lleva (0xC2B0 o 0xC2D0)
	ld a,(0c24bh)		;6828   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;682b   ; muriendo...
	jr z,L_6821		;682d
	ld a,(0c26fh)		;682f   ; lee el golpe de Cles en marcha
	or a			;6832   ; con golpe de Cles en marcha...
	jr nz,L_6851		;6833   ; ...sus cuadros (p01:6851)
L_6835:
	ld a,(0c253h)		;6835   ; lee el cuadro de animacion del personaje
L_6838:
	add a,0d0h		;6838   ; la linea 0xD0 + el cuadro de la pagina 1...
	ld h,000h		;683a
	ld l,a			;683c
	ld d,h			;683d   ; ...a la linea 0xF0 de la pagina 1: los 4 patrones del personaje
	ld e,0f0h		;683e
	ld b,h			;6840
	ld c,001h		;6841   ; una linea de 256 puntos (B = 0)
	ld a,005h		;6843   ; de la pagina 1 a la 1
	jp 04bdeh		;6845   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
L_6848:
	xor a			;6848   ; sin golpe en marcha
	ld (0c26fh),a		;6849   ; guarda el golpe de Cles en marcha
	ld a,(0c253h)		;684c   ; lee el cuadro de animacion del personaje
	jr L_6838		;684f
L_6851:
	ld a,(0c320h)		;6851   ; lee los 4 disparos (0x20 bytes cada uno)
	or a			;6854   ; si no queda el primer disparo...
	jr z,L_6848		;6855   ; ...se acaba el golpe
	ld a,(ix+006h)		;6857   ; lee el estado del personaje (0-3)
	or a			;685a   ; con el estado 0, el cuerpo de siempre
	jr z,L_6835		;685b
	dec a			;685d   ; estados 1-3: tabla p01:6861
	call 0408dh		;685e   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

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


cuadro_de_animacion:		; L = el cuadro (0xD8 + 2 cada 2 cuadros) segun (ix+9)
	ld a,(0c00dh)		;6867   ; lee la cuenta de cuadros del juego
	and 002h		;686a   ; 0xD8 + 2 en cuadros alternos...
	add a,0d8h		;686c
	ld l,a			;686e
	ld a,(ix+009h)		;686f   ; ...+ 1 si el disparo va a la derecha ((ix+9))
	or a			;6872
	jr z,L_6876		;6873
	inc l			;6875
L_6876:
	ld h,000h		;6876
	jr $+35		;6878   ; y a la linea 0xF1 (p01:689B)
L_687A:
	ld hl,0688bh		;687a   ; el cuerpo de p01:688B segun la accion...
	call cuadro_de_la_accion		;687d   ; cuadro_de_la_accion: HL = el cuadro de la accion 0xC24B y el sentido 0xC250
	call copia_linea_f0		;6880   ; copia_linea_f0: una linea de (H, L) a (D, 0xF0) (p00:4BDE)
	ld hl,06891h		;6883   ; ...y el golpe de p01:6891 a la linea 0xF1
	call cuadro_de_la_accion		;6886   ; cuadro_de_la_accion: HL = el cuadro de la accion 0xC24B y el sentido 0xC250
	jr $+18		;6889

; ----------------------------------------------------------------------
; DATOS tabla_p687A: 12 bytes: 0x688B lo lee p01:687A y 0x6891 p01:6883
;   0x688b..0x6897  (12 bytes)
DATA_tabla_p687A:
	defb 0d8h,0d8h,0dah,0d8h,0d8h,0dch,0deh,0deh,0e0h,0deh,0deh,0e2h	; 688b  ............

; ======================================================================
; CODIGO 0x6897..0x692b  (148 bytes)
; ======================================================================


copia_linea_f0:		; una linea de (H, L) a (D, 0xF0) (p00:4BDE)
	ld e,0f0h		;6897   ; a la linea 0xF0
	jr L_689D		;6899
L_689B:
	ld e,0f1h		;689b   ; a la linea 0xF1
L_689D:
	ld d,000h		;689d   ; de (0, L) de la pagina 0
	ld bc,00001h		;689f   ; una linea de 256
	ld a,004h		;68a2   ; de la pagina 0 a la 1
	jp 04bdeh		;68a4   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
cuadro_de_la_accion:		; HL = el cuadro de la accion 0xC24B y el sentido 0xC250
	ld a,(0c26ch)		;68a7   ; lee la cuenta de la postura de disparo (4 u 8)
	or a			;68aa   ; con la postura de disparo, la accion 0...
	ld a,000h		;68ab
	jr nz,L_68B2		;68ad   ; ...si no, la de 0xC24B
	ld a,(0c24bh)		;68af   ; lee la accion del personaje (4 muere, 5 escalera)
L_68B2:
	call 04083h		;68b2   ; hl_mas_a: HL = HL + A
	ld a,(0c24bh)		;68b5   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 005h		;68b8   ; en la escalera, la direccion de las teclas - 1...
	ld a,(0c250h)		;68ba   ; lee el sentido del personaje
	jr nz,L_68C3		;68bd   ; ...si no, el sentido
	ld a,(0c254h)		;68bf   ; lee la direccion de las teclas (0, 1, 2)
	dec a			;68c2
L_68C3:
	add a,(hl)			;68c3   ; + la entrada de la tabla: la linea
	ld l,a			;68c4
	ld h,000h		;68c5
	ret			;68c7
L_68C8:
	ld a,(0c00dh)		;68c8   ; lee la cuenta de cuadros del juego
	and 006h		;68cb   ; el estado 3: 4 cuadros, uno cada 2 del juego (0xC00D & 6)...
	ld b,a			;68cd
	ld a,(0c250h)		;68ce   ; lee el sentido del personaje
	add a,b			;68d1   ; ...+ el sentido
	add a,0d8h		;68d2   ; desde la linea 0xD8
	ld l,a			;68d4
	ld h,000h		;68d5
	jr copia_linea_f0		;68d7
sprites_del_personaje_a_ram:		; los atributos de los sprites del personaje en 0xDE00
	exx			;68d9
	ld a,(0c24bh)		;68da   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;68dd   ; muriendo...
	ld hl,0692bh		;68df
	jr nz,L_68EE		;68e2
	ld a,(0c26bh)		;68e4   ; lee el paso de la muerte (1 o 2)
	cp 002h		;68e7   ; ...con el paso 2 de la muerte...
	jr nz,L_68EE		;68e9
	ld hl,0692fh		;68eb   ; ...los desplazamientos de p01:692F
L_68EE:
	exx			;68ee
	ld b,002h		;68ef   ; dos parejas de sprites
	ld c,000h		;68f1   ; desde el patron 0
	ld de,0de00h		;68f3   ; apunta a los atributos de los sprites en RAM
L_68F6:
	ld hl,0c244h		;68f6   ; cada sprite del personaje: Y y X del personaje mas el desplazamiento de HL'
	ld a,(hl)			;68f9   ; la Y del personaje...
	inc hl			;68fa
	inc hl			;68fb
	exx			;68fc
	add a,(hl)			;68fd   ; ...+ dy
	inc hl			;68fe
	exx			;68ff
	ld (de),a			;6900   ; la Y del sprite
	inc de			;6901
	ex af,af'			;6902
	ld a,(hl)			;6903   ; la X del personaje...
	exx			;6904
	add a,(hl)			;6905   ; ...+ dx
	inc hl			;6906
	exx			;6907
	ld (de),a			;6908   ; la X del sprite
	ex de,hl			;6909
	inc hl			;690a
	ld (hl),c			;690b   ; el patron (C) y los colores del personaje
	ex af,af'			;690c
	inc hl			;690d
	inc hl			;690e
	ld (hl),a			;690f   ; la Y del segundo sprite, la misma
	ex af,af'			;6910
	inc hl			;6911
	ld (hl),a			;6912   ; su X
	inc hl			;6913
	ld a,c			;6914   ; el siguiente patron, 4 mas
	add a,004h		;6915   ; su patron, 4 mas
	ld (hl),a			;6917
	add a,004h		;6918   ; la pareja siguiente, 8 patrones mas
	ld c,a			;691a
	inc hl			;691b
	inc hl			;691c
	ex de,hl			;691d
	djnz L_68F6		;691e
	ld hl,0dc00h		;6920   ; los colores de los sprites del personaje en 0xDC00 y 0xDC20
	call colores_a_ram		;6923   ; colores_a_ram: 16 + 16 colores de 0xC24C/0xC24D a HL
	ld hl,0dc20h		;6926   ; y los del sprite 2 en 0xDC20
	jr $+10		;6929

; ----------------------------------------------------------------------
; DATOS tabla_p68DF: 8 bytes: 0x692B lo lee p01:68DF y 0x692F p01:68EB
;   0x692b..0x6933  (8 bytes)
DATA_tabla_p68DF:
	defb 0e0h,0f8h,0f0h,0f8h,0e8h,0f8h,0f0h,0f8h	; 692b  ........

; ======================================================================
; CODIGO 0x6933..0x699e  (107 bytes)
; ======================================================================


colores_a_ram:		; 16 + 16 colores de 0xC24C/0xC24D a HL
	ld de,0c24ch		;6933   ; apunta a el color de la capa 0 del personaje
	ld c,002h		;6936   ; dos bloques
L_6938:
	ld a,(de)			;6938   ; el color de la capa...
	inc de			;6939
	ld b,010h		;693a   ; ...en 16 lineas
L_693C:
	ld (hl),a			;693c   ; C bloques de B bytes con A
	inc hl			;693d
	djnz L_693C		;693e
	dec c			;6940
	jr nz,L_6938		;6941
	ret			;6943
cuadro_de_personaje_y_disparos:		; p06:B259, p06:B2FC, la accion y los sprites
	call ficha_del_personaje		;6944   ; ficha_del_personaje: IX = la ficha del personaje que se lleva (0xC2B0 o 0xC2D0)
	ld a,(0c00dh)		;6947   ; lee la cuenta de cuadros del juego
	and 03fh		;694a   ; cada 0x40 cuadros, p06:B259
	call z,0b259h		;694c   ; mira_el_globo: sin globo (0xC272) y sin morir: lo que sigue de los objetos de animo
	call 0b2fch		;694f   ; cuenta_del_globo: esconde el sprite 8, cuenta 0xC272 (p03:B30A) y, sin disparos, sigue
	call despacha_accion		;6952   ; despacha_accion: despacha la accion del personaje (0xC24B)
	ld a,(0c262h)		;6955   ; con 0xC262...
	or a			;6958
	call nz,nada_6aea		;6959   ; nada_6aea: solo ret
	call sprites_del_personaje_a_ram		;695c   ; sprites_del_personaje_a_ram: los atributos de los sprites del personaje en 0xDE00
	ld a,(0c24bh)		;695f   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;6962   ; muriendo...
	ret nz			;6964
	ld a,(0c26bh)		;6965   ; lee el paso de la muerte (1 o 2)
	or a			;6968   ; si la cuenta de 0xC26B...
	ret z			;6969
	dec a			;696a
	jr nz,L_6976		;696b
	ld a,0e0h		;696d   ; ...los sprites escondidos (Y = 0xE0)
	ld (0de00h),a		;696f   ; guarda los atributos de los sprites en RAM
	ld (0de04h),a		;6972   ; guarda la Y del sprite 1 en RAM
	ret			;6975
L_6976:
	ld a,(0c400h)		;6976   ; lee los 8 actores (0x80 bytes cada uno)
	cp 030h		;6979   ; con el actor 0x30 en 0xC400...
	jr nz,L_6986		;697b
	ld a,(0c401h)		;697d   ; ...y su paso...
	or a			;6980
	jr z,L_6986		;6981
	xor a			;6983   ; ...los colores del sprite a 0
	jr L_6988		;6984
L_6986:
	ld a,00dh		;6986   ; si no, 0x0D
L_6988:
	ld hl,0dc00h		;6988   ; apunta a los colores de los sprites en RAM (16 por sprite)
	ld de,0dc01h		;698b
	ld bc,0001fh		;698e
	ld (hl),a			;6991   ; 32 lineas de 0xDC00 con ese color
	ldir		;6992
	ret			;6994
despacha_accion:		; despacha la accion del personaje (0xC24B)
	call ficha_del_personaje		;6995   ; ficha_del_personaje: IX = la ficha del personaje que se lleva (0xC2B0 o 0xC2D0)
	ld a,(0c24bh)		;6998   ; lee la accion del personaje (4 muere, 5 escalera)
	call 0408dh		;699b   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

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


cuadro_parado:		; el cuadro de animacion parado o el de p01:69E6[(ix+1)]
	ld a,000h		;69ac   ; el cuadro 0 + el sentido
	jr L_69DD		;69ae
L_69B0:
	ld a,(0c255h)		;69b0   ; la accion 0: parado (0xC255)...
	or a			;69b3
	ld a,000h		;69b4
	jr nz,L_69DD		;69b6   ; ...con el cuadro 0
	ld a,(0c266h)		;69b8   ; lee la cuenta de Cles andando sin suelo (0x20 cuadros)
	or a			;69bb   ; andando sobre el vacio, el paso siguiente sin esperar
	jr nz,L_69CC		;69bc
	ld hl,069e6h		;69be   ; el ritmo del nivel de velocidad
	ld a,(ix+001h)		;69c1   ; lee el nivel de velocidad del personaje (indice de p01:6485)
	call 04083h		;69c4   ; hl_mas_a: HL = HL + A
	ld a,(0c252h)		;69c7   ; lee la cuenta de cuadros del paso del personaje
	cp (hl)			;69ca   ; cuando la cuenta llega al ritmo...
	ret c			;69cb
L_69CC:
	xor a			;69cc   ; ...se pone a cero y el cuadro siguiente
	ld (0c252h),a		;69cd   ; guarda la cuenta de cuadros del paso del personaje
	ld a,(0c253h)		;69d0   ; lee el cuadro de animacion del personaje
	add a,002h		;69d3   ; dos lineas por cuadro: 0, 2, 4, 6...
	cp 008h		;69d5
	jr c,L_69DB		;69d7
	ld a,000h		;69d9   ; ...y vuelta al 0
L_69DB:
	and 006h		;69db
L_69DD:
	ld b,a			;69dd
	ld a,(0c250h)		;69de   ; lee el sentido del personaje
	add a,b			;69e1   ; + el sentido
	ld (0c253h),a		;69e2   ; guarda el cuadro de animacion del personaje
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
	ld b,008h		;69eb   ; las acciones 1 y 2: el cuadro 8 + el sentido
	ld a,(0c250h)		;69ed   ; lee el sentido del personaje
	add a,b			;69f0
	ld (0c253h),a		;69f1   ; guarda el cuadro de animacion del personaje
	ret			;69f4
L_69F5:
	ld a,(0c253h)		;69f5   ; lee el cuadro de animacion del personaje
	and 0feh		;69f8   ; la accion 3: el cuadro par que hay + el sentido
	ld b,a			;69fa
	ld a,(0c250h)		;69fb   ; lee el sentido del personaje
	add a,b			;69fe
	ld (0c253h),a		;69ff   ; guarda el cuadro de animacion del personaje
	ret			;6a02
L_6A03:
	ld a,006h		;6a03   ; los colores del personaje: 6 y 0x49
	ld (0c24ch),a		;6a05   ; guarda el color de la capa 0 del personaje
	ld a,049h		;6a08   ; los colores de la muerte: 6 y 0x49
	ld (0c24dh),a		;6a0a   ; guarda el color de la capa 1 del personaje
	ld a,(0c260h)		;6a0d   ; 0xC260, la cuenta de invencible: el parpadeo, mas lento al final
	cp 060h		;6a10   ; cuenta >= 0x60: cada 16 cuadros...
	ld c,00fh		;6a12
	jr nc,L_6A21		;6a14
	cp 020h		;6a16   ; >= 0x20: cada 4...
	ld c,003h		;6a18
	jr nc,L_6A21		;6a1a
	cp 01fh		;6a1c   ; 0x1F: el final (p01:6A65)
	jr z,L_6A65		;6a1e
	ret			;6a20
L_6A21:
	ld a,(0c260h)		;6a21   ; cada C + 1 cuadros cambia el dibujo de (0x98, 0x00) o (0x98, 0x10)
	and c			;6a24   ; solo cada C + 1 cuadros
	ret nz			;6a25
	inc c			;6a26
	ld a,(0c260h)		;6a27   ; lee la cuenta de invencible
	and c			;6a2a   ; alternando el dibujo de (0x98, 0) y (0x98, 0x10)
	ld hl,00098h		;6a2b
	jr nz,L_6A33		;6a2e
	ld hl,01098h		;6a30
L_6A33:
	ld a,(0c246h)		;6a33   ; lee la X del personaje
	sub 008h		;6a36   ; en X - 8...
	ld d,a			;6a38
	ld a,(0c240h)		;6a39   ; lee el personaje que se lleva (0 o 1)
	or a			;6a3c
	ld b,027h		;6a3d   ; ...e Y - 0x27 (Wit) o Y - 0x21 (Cles)
	jr z,L_6A43		;6a3f
	ld b,021h		;6a41
L_6A43:
	ld a,(0c244h)		;6a43   ; lee la Y del personaje
	sub b			;6a46
	ld e,a			;6a47
	push hl			;6a48
	push de			;6a49
	ld hl,02098h		;6a4a   ; primero el fondo guardado en (0x98, 0x20)...
	ld bc,01018h		;6a4d
	ld a,040h		;6a50   ; ...tal cual (LMMM 0x40)
	call 04c73h		;6a52   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop de			;6a55
	pop hl			;6a56
	ld bc,01018h		;6a57   ; y encima el dibujo con TIMP (0x48)
	ld a,048h		;6a5a
	call 04c73h		;6a5c   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	ld a,001h		;6a5f   ; el paso 1 de la muerte
	ld (0c26bh),a		;6a61   ; guarda el paso de la muerte (1 o 2)
	ret			;6a64
L_6A65:
	ld a,002h		;6a65   ; el paso 2...
	ld (0c26bh),a		;6a67   ; guarda el paso de la muerte (1 o 2)
	ld a,(0c246h)		;6a6a   ; lee la X del personaje
	sub 008h		;6a6d
	ld d,a			;6a6f
	ld a,(0c240h)		;6a70   ; lee el personaje que se lleva (0 o 1)
	or a			;6a73
	ld b,027h		;6a74
	jr z,L_6A7A		;6a76
	ld b,021h		;6a78
L_6A7A:
	ld a,(0c244h)		;6a7a   ; lee la Y del personaje
	sub b			;6a7d
	ld e,a			;6a7e
	ld hl,02098h		;6a7f   ; ...el fondo otra vez, sin el dibujo
	ld bc,01018h		;6a82
	ld a,040h		;6a85
	call 04c73h		;6a87   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	call 054b4h		;6a8a   ; banco_6_en_a000: pone el banco 6 en 0xA000
	ld de,0b21bh		;6a8d   ; los patrones de la muerte, p06:B21B y p06:B238, a la VRAM 0xE880-0xE8DF
	ld hl,0e880h		;6a90
	call 0492ch		;6a93   ; rle_a_vram: RLE de DE a la VRAM HL: 0 acaba, n < 0x80 repite, 0x80 otra direccion, si no copia n & 0x7F
	ld de,0b21bh		;6a96
	ld hl,0e8a0h		;6a99
	call 0492ch		;6a9c   ; rle_a_vram: RLE de DE a la VRAM HL: 0 acaba, n < 0x80 repite, 0x80 otra direccion, si no copia n & 0x7F
	ld de,0b238h		;6a9f
	ld hl,0e8c0h		;6aa2
	call 0492ch		;6aa5   ; rle_a_vram: RLE de DE a la VRAM HL: 0 acaba, n < 0x80 repite, 0x80 otra direccion, si no copia n & 0x7F
	jp 05464h		;6aa8   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
L_6AAB:
	ld a,(0c254h)		;6aab   ; lee la direccion de las teclas (0, 1, 2)
	or a			;6aae   ; la accion 5 (escalera): con arriba o abajo...
	jr nz,L_6AD2		;6aaf   ; ...el cuadro 12 o 13 (p01:6AD2)
	ld hl,069e6h		;6ab1   ; subiendo, al ritmo del nivel de velocidad
	ld a,(ix+001h)		;6ab4   ; lee el nivel de velocidad del personaje (indice de p01:6485)
	call 04083h		;6ab7   ; hl_mas_a: HL = HL + A
	ld a,(0c252h)		;6aba   ; lee la cuenta de cuadros del paso del personaje
	cp (hl)			;6abd   ; sin llegar al ritmo, p01:6ADA
	jr c,L_6ADA		;6abe
	xor a			;6ac0
	ld (0c252h),a		;6ac1   ; guarda la cuenta de cuadros del paso del personaje
	ld a,(0c253h)		;6ac4   ; lee el cuadro de animacion del personaje
	inc a			;6ac7   ; el cuadro siguiente: 10, 11 y vuelta al 10
	cp 00ch		;6ac8
	jr c,L_6ACE		;6aca
	ld a,00ah		;6acc
L_6ACE:
	ld (0c253h),a		;6ace   ; guarda el cuadro de animacion del personaje
	ret			;6ad1
L_6AD2:
	dec a			;6ad2   ; la direccion - 1 + 12
	ld b,00ch		;6ad3
	add a,b			;6ad5
	ld (0c253h),a		;6ad6   ; guarda el cuadro de animacion del personaje
	ret			;6ad9
L_6ADA:
	ld a,(0c253h)		;6ada   ; lee el cuadro de animacion del personaje
	sub 00ah		;6add   ; si el cuadro no es el 10 o el 11...
	jr c,L_6AE4		;6adf
	cp 002h		;6ae1
	ret c			;6ae3
L_6AE4:
	ld a,00ah		;6ae4   ; ...el 10
	ld (0c253h),a		;6ae6   ; guarda el cuadro de animacion del personaje
	ret			;6ae9
nada_6aea:		; solo ret
	ret			;6aea
disparos_y_cambio:		; disparos, sus sprites y la tecla 0x10 de cambiar de personaje
	call fin_de_disparos		;6aeb   ; fin_de_disparos: si 0xC257 y no queda ningun disparo: 0xC257 = 0 y p00:5A97
	call disparos		;6aee   ; disparos: los 4 disparos de 0xC320 (0x20 bytes cada uno)
	call sprites_de_disparos		;6af1   ; sprites_de_disparos: esconde 4 sprites y, con 9, los de los disparos (p01:6F9F)
	call ficha_del_personaje		;6af4   ; ficha_del_personaje: IX = la ficha del personaje que se lleva (0xC2B0 o 0xC2D0)
	ld a,(0c24bh)		;6af7   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;6afa   ; muriendo, ni disparo ni cambio
	ret z			;6afc
	ld a,(0c21ch)		;6afd   ; lee el jefe vencido (no queda ningun 0x19)
	or a			;6b00   ; con el doble salto pedido, no se dispara
	ret nz			;6b01
	ld a,(0c006h)		;6b02   ; lee las teclas nuevas
	and 010h		;6b05   ; la tecla de disparo (0x10)
	ret z			;6b07
	ld a,(0c257h)		;6b08   ; lee hay disparos en marcha
	or a			;6b0b   ; con disparos en marcha, no
	ret nz			;6b0c
	ld a,(0c240h)		;6b0d   ; lee el personaje que se lleva (0 o 1)
	or a			;6b10   ; Wit: el tipo 4 - estado...
	jr nz,L_6B1C		;6b11
	ld a,003h		;6b13
	sub (ix+006h)		;6b15   ; le resta el estado del personaje (0-3)
	inc a			;6b18
	jp L_6B21		;6b19
L_6B1C:
	ld a,(ix+006h)		;6b1c   ; lee el estado del personaje (0-3)
	add a,006h		;6b1f   ; Cles: el tipo estado + 6
L_6B21:
	ld b,a			;6b21   ; B = el tipo
	push bc			;6b22
	call subiendo_escalera		;6b23   ; subiendo_escalera: Z si la accion es 5 (escalera) y 0xC254; acarreo si 0xC254 es cero
	pop bc			;6b26
	ret c			;6b27   ; en la escalera, sin direccion, no
	ld a,b			;6b28
	cp 003h		;6b29   ; el tipo 3 (Wit tranquilo): hasta 4 a la vez (p01:6B3A)
	jr z,L_6B3A		;6b2b
	cp 004h		;6b2d   ; el tipo 4 (Wit feliz): tres a la vez (p01:6B4E)
	jr z,L_6B4E		;6b2f
	ld hl,0c320h		;6b31   ; apunta a los 4 disparos (0x20 bytes cada uno)
	ld a,(hl)			;6b34   ; los demas, de uno en uno: si el primero esta libre
	or a			;6b35
	ret nz			;6b36
	jp nuevo_disparo		;6b37   ; nuevo_disparo: el sonido de p01:6B83[B - 1] y la ficha del disparo en HL
L_6B3A:
	ld b,003h		;6b3a
	ld c,004h		;6b3c   ; mira los 4 huecos
	ld hl,0c320h		;6b3e   ; apunta a los 4 disparos (0x20 bytes cada uno)
	ld de,00020h		;6b41
L_6B44:
	ld a,(hl)			;6b44   ; el primer hueco libre
	or a			;6b45
	jp z,nuevo_disparo		;6b46   ; nuevo_disparo: el sonido de p01:6B83[B - 1] y la ficha del disparo en HL
	add hl,de			;6b49
	dec c			;6b4a
	jr nz,L_6B44		;6b4b
	ret			;6b4d   ; ninguno libre: nada
L_6B4E:
	ld b,003h		;6b4e   ; el tipo 4 solo si los 3 primeros estan libres
	ld hl,0c320h		;6b50   ; apunta a los 4 disparos (0x20 bytes cada uno)
	ld de,00020h		;6b53
L_6B56:
	ld a,(hl)			;6b56
	or a			;6b57
	ret nz			;6b58
	add hl,de			;6b59
	djnz L_6B56		;6b5a
	ld hl,0c320h		;6b5c   ; apunta a los 4 disparos (0x20 bytes cada uno)
	ld b,004h		;6b5f   ; los tres: el primero con el sonido 4...
	call nuevo_disparo		;6b61   ; nuevo_disparo: el sonido de p01:6B83[B - 1] y la ficha del disparo en HL
	ld hl,0c340h		;6b64   ; ...y los otros dos con el 5
	ld b,005h		;6b67
	call nuevo_disparo		;6b69   ; nuevo_disparo: el sonido de p01:6B83[B - 1] y la ficha del disparo en HL
	ld hl,0c360h		;6b6c
	ld b,005h		;6b6f
	jp nuevo_disparo		;6b71   ; nuevo_disparo: el sonido de p01:6B83[B - 1] y la ficha del disparo en HL
subiendo_escalera:		; Z si la accion es 5 (escalera) y 0xC254; acarreo si 0xC254 es cero
	ld a,(0c24bh)		;6b74   ; lee la accion del personaje (4 muere, 5 escalera)
	sub 005h		;6b77   ; la accion 5 (escalera)...
	or a			;6b79
	ret nz			;6b7a
	ld a,(0c254h)		;6b7b   ; lee la direccion de las teclas (0, 1, 2)
	or a			;6b7e   ; ...sin direccion: acarreo
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


nuevo_disparo:		; el sonido de p01:6B83[B - 1] y la ficha del disparo en HL
	call postura_de_disparo		;6b8c   ; postura_de_disparo: en accion 0: 0xC26C = 4 u 8 y la accion 2
	push hl			;6b8f
	push bc			;6b90
	ld a,b			;6b91   ; el sonido del tipo: p01:6B83[B - 1]
	dec a			;6b92
	ld hl,06b83h		;6b93
	call 04083h		;6b96   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;6b99
	call 056e3h		;6b9a   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	pop bc			;6b9d
	pop hl			;6b9e
	ld (hl),b			;6b9f   ; el tipo en el hueco
	push hl			;6ba0
	pop ix		;6ba1
	ld d,h			;6ba3   ; los otros 0x1F bytes a cero
	ld e,l			;6ba4
	inc de			;6ba5
	ld b,01fh		;6ba6
	xor a			;6ba8
L_6BA9:
	ld (de),a			;6ba9
	inc de			;6baa
	djnz L_6BA9		;6bab
	inc hl			;6bad   ; la Y del disparo...
	ld de,(0c243h)		;6bae   ; lee la Y del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	call ajusta_disparo		;6bb2   ; ajusta_disparo: la Y del disparo segun su tipo y 0xC253
	ld (hl),e			;6bb5
	inc hl			;6bb6
	ld (hl),d			;6bb7
	inc hl			;6bb8
	ld de,(0c245h)		;6bb9   ; la X: la del personaje
	ld (hl),e			;6bbd
	inc hl			;6bbe
	ld (hl),d			;6bbf
	inc hl			;6bc0   ; hasta el sentido (ix+9)
	inc hl			;6bc1
	inc hl			;6bc2
	inc hl			;6bc3
	inc hl			;6bc4
	ld a,(0c24bh)		;6bc5   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 005h		;6bc8   ; en la escalera...
	ld a,(0c250h)		;6bca   ; lee el sentido del personaje
	jr nz,L_6BD3		;6bcd   ; ...la direccion - 1; si no, el sentido
	ld a,(0c254h)		;6bcf   ; lee la direccion de las teclas (0, 1, 2)
	dec a			;6bd2
L_6BD3:
	ld (hl),a			;6bd3   ; el sentido del disparo
	ld (ix+010h),001h		;6bd4   ; el fotograma 1
	ld (ix+00ah),000h		;6bd8   ; el registro de sprite 0
	call x_del_disparo		;6bdc   ; x_del_disparo: (ix+4) + 2 u 8 segun el tipo y el sentido (ix+9)
	ld a,(ix+000h)		;6bdf   ; despacha el tipo - 1 (tabla p01:6BE6)
	dec a			;6be2
	call 0408dh		;6be3   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

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


postura_de_disparo:		; en accion 0: 0xC26C = 4 u 8 y la accion 2
	ld a,(0c24bh)		;6bf8   ; lee la accion del personaje (4 muere, 5 escalera)
	or a			;6bfb   ; solo en el suelo
	ret nz			;6bfc
	ld a,b			;6bfd   ; el tipo 9 (la bola de Cles) no cambia la postura
	cp 009h		;6bfe
	ret z			;6c00
	ld a,004h		;6c01   ; 4 cuadros con el tipo 7, 8 con los demas
	cp 007h		;6c03
	jr z,L_6C09		;6c05
	ld a,008h		;6c07
L_6C09:
	ld (0c26ch),a		;6c09   ; guarda la cuenta de la postura de disparo (4 u 8)
	ld a,002h		;6c0c   ; la accion 2 mientras tanto
	ld (0c24bh),a		;6c0e   ; guarda la accion del personaje (4 muere, 5 escalera)
	ret			;6c11
ajusta_disparo:		; la Y del disparo segun su tipo y 0xC253
	ld a,(0c240h)		;6c12   ; lee el personaje que se lleva (0 o 1)
	or a			;6c15   ; con Cles, nada
	ret nz			;6c16
	ld a,(ix+000h)		;6c17   ; lee el tipo del disparo
	cp 001h		;6c1a   ; el tipo 1 (el rayo), 4 mas abajo
	jr nz,L_6C22		;6c1c
	ld a,d			;6c1e
	add a,004h		;6c1f
	ld d,a			;6c21
L_6C22:
	ld a,(0c26ch)		;6c22   ; la Y del disparo segun el cuadro del personaje (0xC253)
	or a			;6c25   ; con la postura de disparo, - 4
	jr nz,L_6C40		;6c26
	ld a,(0c253h)		;6c28   ; lee el cuadro de animacion del personaje
	cp 008h		;6c2b   ; en los cuadros 8 y 9 no se toca
	jr z,L_6C40		;6c2d   ; en el aire (cuadros 8 y 9)...
	cp 009h		;6c2f
	jr z,L_6C40		;6c31
	sub 014h		;6c33   ; de 0x14 a 0x17, tampoco
	jr c,L_6C3B		;6c35   ; ...o en la escalera (0x14-0x17): - 4
	cp 004h		;6c37
	jr c,L_6C40		;6c39
L_6C3B:
	ld a,d			;6c3b   ; si no, - 0x0A
	sub 00ah		;6c3c
	ld d,a			;6c3e
	ret			;6c3f
L_6C40:
	ld a,d			;6c40   ; la Y - 4
	sub 004h		;6c41
	ld d,a			;6c43
	ret			;6c44
x_del_disparo:		; (ix+4) + 2 u 8 segun el tipo y el sentido (ix+9)
	ld a,(ix+000h)		;6c45   ; lee el tipo del disparo
	cp 001h		;6c48   ; el tipo 1 sale 8 puntos por delante...
	ld b,0feh		;6c4a   ; ...los demas, 2
	jr nz,L_6C50		;6c4c
	ld b,0f8h		;6c4e
L_6C50:
	ld a,(ix+009h)		;6c50   ; lee el sentido del disparo (0: a la izquierda)
	or a			;6c53   ; a la izquierda (0), hacia atras
	ld a,b			;6c54
	jr z,L_6C59		;6c55
	neg		;6c57
L_6C59:
	add a,(ix+004h)		;6c59   ; le suma la X del disparo
	ld (ix+004h),a		;6c5c   ; guarda la X del disparo
	ret			;6c5f
L_6C60:
	call disparo_8		;6c60   ; disparo_8: (ix+0x0D) = 8
	call velocidad_800		;6c63   ; velocidad_800: p01:6D87 con DE = 0x800
	ld (ix+00ch),004h		;6c66   ; el hueco de sprite del disparo = 0x04
	ret			;6c6a
L_6C6B:
	call disparo_recto		;6c6b   ; disparo_recto: p01:6D75, p01:6D84 y p01:6D95
	ld a,(ix+009h)		;6c6e   ; lee el sentido del disparo (0: a la izquierda)
	or a			;6c71   ; el tipo 4: registro 0x11 a la izquierda...
	ld a,011h		;6c72
	jr z,L_6C78		;6c74
	ld a,013h		;6c76   ; ...0x13 a la derecha
L_6C78:
	ld (ix+00ah),a		;6c78   ; guarda el registro de sprite del disparo (p09:B7C9)
	ret			;6c7b
disparo_recto:		; p01:6D75, p01:6D84 y p01:6D95
	call disparo_8		;6c7c   ; disparo_8: (ix+0x0D) = 8
	call velocidad_800		;6c7f   ; velocidad_800: p01:6D87 con DE = 0x800
	jp sprite_del_disparo		;6c82   ; sprite_del_disparo: (ix+0x0C) = 4 + el numero del disparo
L_6C85:
	call disparo_8		;6c85   ; disparo_8: (ix+0x0D) = 8
	ld a,(ix+00dh)		;6c88   ; el tipo 1 (el rayo): (ix+0x0E) = ((ix+0x0D) - 8) / 2, lo que se queda entero
	sub 008h		;6c8b
	srl a		;6c8d
	ld (ix+00eh),a		;6c8f
	ld (ix+00ah),001h		;6c92   ; el registro de sprite del disparo (p09:B7C9) = 0x01
	ld a,(ix+009h)		;6c96   ; lee el sentido del disparo (0: a la izquierda)
	or a			;6c99   ; registro 1 a la izquierda...
	jr z,L_6CA0		;6c9a
	ld (ix+00ah),005h		;6c9c   ; el registro de sprite del disparo (p09:B7C9) = 0x05
L_6CA0:
	ld a,004h		;6ca0   ; ...5 a la derecha; 4 cuadros de espera
	ld (ix+00ch),a		;6ca2   ; guarda el hueco de sprite del disparo
	ld (ix+011h),a		;6ca5
	ld (ix+00dh),0ffh		;6ca8   ; sin alcance ((ix+0x0D) = 0xFF)
	ret			;6cac
L_6CAD:
	call disparo_8		;6cad   ; disparo_8: (ix+0x0D) = 8
	call sprite_del_disparo		;6cb0   ; sprite_del_disparo: (ix+0x0C) = 4 + el numero del disparo
	ld a,(ix+009h)		;6cb3   ; lee el sentido del disparo (0: a la izquierda)
	or a			;6cb6   ; el tipo 5: registros 0x11-0x14
	ld b,011h		;6cb7
	jr z,L_6CBD		;6cb9
	ld b,013h		;6cbb
L_6CBD:
	ld a,(ix+00ch)		;6cbd   ; lee el hueco de sprite del disparo
	cp 005h		;6cc0   ; segun el hueco del sprite
	jr z,L_6CC5		;6cc2
	inc b			;6cc4
L_6CC5:
	ld (ix+00ah),b		;6cc5   ; guarda el registro de sprite del disparo (p09:B7C9)
	push ix		;6cc8   ; el numero del disparo...
	pop hl			;6cca
	or a			;6ccb
	ld de,0c320h		;6ccc   ; apunta a los 4 disparos (0x20 bytes cada uno)
	sbc hl,de		;6ccf
	add hl,hl			;6cd1   ; ...(su desplazamiento en 0xC320 / 0x20)
	add hl,hl			;6cd2
	add hl,hl			;6cd3
	ld a,h			;6cd4
	cp 001h		;6cd5   ; el disparo 1 casi recto (velocidad Y 0x0001); el 2 sube en diagonal (0xF802)
	ld b,000h		;6cd7
	jr z,L_6CDD		;6cd9
	ld b,0f8h		;6cdb
L_6CDD:
	ld (ix+006h),b		;6cdd   ; guarda la velocidad Y del disparo (alta)
	ld (ix+005h),a		;6ce0   ; guarda la velocidad Y del disparo
	jp velocidad_800		;6ce3   ; velocidad_800: p01:6D87 con DE = 0x800
L_6CE6:
	call cuadro_de_animacion		;6ce6   ; cuadro_de_animacion: L = el cuadro (0xD8 + 2 cada 2 cuadros) segun (ix+9)
	ld a,(0c244h)		;6ce9   ; lee la Y del personaje
	ld (ix+002h),a		;6cec   ; guarda la Y del disparo
	ld a,001h		;6cef   ; el golpe de Cles en marcha
	ld (0c26fh),a		;6cf1   ; guarda el golpe de Cles en marcha
	call disparo_8		;6cf4   ; disparo_8: (ix+0x0D) = 8
	ld a,(ix+00dh)		;6cf7   ; el doble de alcance
	add a,a			;6cfa
	ld (ix+00dh),a		;6cfb
	ld de,00400h		;6cfe   ; velocidad X 0x400
	call velocidad_del_disparo		;6d01   ; velocidad_del_disparo: (ix+7, 8) = DE, negada (p02:8B39) si (ix+9) es cero
	ld (ix+00ch),004h		;6d04   ; el hueco de sprite del disparo = 0x04
	ld a,(ix+009h)		;6d08   ; lee el sentido del disparo (0: a la izquierda)
	or a			;6d0b   ; el registro 0x0F mirando a la derecha...
	ld a,00fh		;6d0c
	jr nz,L_6D12		;6d0e
	ld a,010h		;6d10   ; ...o 0x10 a la izquierda
L_6D12:
	ld (ix+00ah),a		;6d12   ; guarda el registro de sprite del disparo (p09:B7C9)
	ret			;6d15
L_6D16:
	ld (ix+00dh),004h		;6d16   ; el tipo 7: alcance 4
	jr L_6D20		;6d1a
L_6D1C:
	ld (ix+00dh),008h		;6d1c   ; el tipo 8: alcance 8
L_6D20:
	ld a,001h		;6d20   ; el golpe de Cles en marcha
	ld (0c26fh),a		;6d22   ; guarda el golpe de Cles en marcha
	ld (ix+00ch),004h		;6d25   ; el hueco de sprite del disparo = 0x04
L_6D29:
	ld a,(0c26ch)		;6d29   ; lee la cuenta de la postura de disparo (4 u 8)
	or a			;6d2c   ; con la postura de disparo, la accion 0
	ld a,000h		;6d2d
	jr nz,L_6D34		;6d2f
	ld a,(0c24bh)		;6d31   ; lee la accion del personaje (4 muere, 5 escalera)
L_6D34:
	ld hl,06d59h		;6d34   ; el registro de p01:6D59 segun la accion
	call 04083h		;6d37   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;6d3a
	ld (ix+00ah),a		;6d3b   ; guarda el registro de sprite del disparo (p09:B7C9)
	ld a,(0c24bh)		;6d3e   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 005h		;6d41   ; en la escalera, la direccion - 1...
	jr nz,L_6D4B		;6d43
	ld a,(0c254h)		;6d45   ; lee la direccion de las teclas (0, 1, 2)
	dec a			;6d48
	jr L_6D4E		;6d49
L_6D4B:
	ld a,(0c250h)		;6d4b   ; lee el sentido del personaje
L_6D4E:
	or a			;6d4e   ; ...mirando a la derecha, tal cual
	ret nz			;6d4f
	ld a,(ix+00ah)		;6d50   ; lee el registro de sprite del disparo (p09:B7C9)
	add a,003h		;6d53   ; a la izquierda, el registro + 3
	ld (ix+00ah),a		;6d55   ; guarda el registro de sprite del disparo (p09:B7C9)
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
	ld a,(0c244h)		;6d5f   ; lee la Y del personaje
	ld (ix+002h),a		;6d62   ; guarda la Y del disparo
	ld a,(0c246h)		;6d65   ; lee la X del personaje
	ld (ix+004h),a		;6d68   ; guarda la X del disparo
	ld a,001h		;6d6b   ; el golpe de Cles en marcha
	ld (0c26fh),a		;6d6d   ; guarda el golpe de Cles en marcha
	ld (ix+00dh),018h		;6d70   ; alcance 0x18
	ret			;6d74
disparo_8:		; (ix+0x0D) = 8
	ld (ix+00dh),008h		;6d75
	ret			;6d79
L_6D7A:
	ld a,(ix+009h)		;6d7a   ; lee el sentido del disparo (0: a la izquierda)
	xor 001h		;6d7d   ; el sentido, al reves...
	add a,b			;6d7f   ; ...+ B: el registro
	ld (ix+00ah),a		;6d80   ; guarda el registro de sprite del disparo (p09:B7C9)
	ret			;6d83
velocidad_800:		; p01:6D87 con DE = 0x800
	ld de,00800h		;6d84   ; velocidad 0x800: 8 puntos por cuadro
velocidad_del_disparo:		; (ix+7, 8) = DE, negada (p02:8B39) si (ix+9) es cero
	ld a,(ix+009h)		;6d87   ; lee el sentido del disparo (0: a la izquierda)
	or a			;6d8a   ; a la izquierda, negativa
	call z,08b39h		;6d8b   ; niega_de: DE = -DE
	ld (ix+007h),e		;6d8e   ; guarda la velocidad X del disparo
	ld (ix+008h),d		;6d91   ; guarda la velocidad X del disparo (alta)
	ret			;6d94
sprite_del_disparo:		; (ix+0x0C) = 4 + el numero del disparo
	push ix		;6d95   ; el numero del disparo: su desplazamiento en 0xC320 / 0x20...
	pop hl			;6d97
	or a			;6d98
	ld de,0c320h		;6d99   ; apunta a los 4 disparos (0x20 bytes cada uno)
	sbc hl,de		;6d9c
	or a			;6d9e
	ld a,l			;6d9f
	rra			;6da0
	rra			;6da1
	rra			;6da2
	rra			;6da3
	rra			;6da4
	and 007h		;6da5
	add a,004h		;6da7   ; ...+ 4: el hueco de sprite
	ld (ix+00ch),a		;6da9   ; guarda el hueco de sprite del disparo
	ret			;6dac
disparos:		; los 4 disparos de 0xC320 (0x20 bytes cada uno)
	ld ix,0c320h		;6dad   ; apunta a los 4 disparos (0x20 bytes cada uno)
	ld b,004h		;6db1   ; los 4 disparos
L_6DB3:
	push bc			;6db3
	call despacha_disparo		;6db4   ; despacha_disparo: despacha el tipo del disparo - 1
	call mueve_disparo		;6db7   ; mueve_disparo: (ix+3, 4) + (ix+7, 8) y (ix+1, 2) + (ix+5, 6)
	call disparo_fuera		;6dba   ; disparo_fuera: si se sale de 0x0A-0xF5 en X o 0x14-0xD8 en Y, se borra
	pop bc			;6dbd
	ld de,00020h		;6dbe
	add ix,de		;6dc1   ; el siguiente, 0x20 bytes mas alla
	djnz L_6DB3		;6dc3
	ret			;6dc5
mueve_disparo:		; (ix+3, 4) + (ix+7, 8) y (ix+1, 2) + (ix+5, 6)
	ld a,(ix+000h)		;6dc6   ; lee el tipo del disparo
	or a			;6dc9
	ret z			;6dca
	ld e,(ix+007h)		;6dcb   ; lee la velocidad X del disparo
	ld d,(ix+008h)		;6dce   ; lee la velocidad X del disparo (alta)
	ld l,(ix+003h)		;6dd1   ; lee la X del disparo (fraccion)
	ld h,(ix+004h)		;6dd4   ; lee la X del disparo
	add hl,de			;6dd7   ; X + velocidad X
	ld (ix+003h),l		;6dd8   ; guarda la X del disparo (fraccion)
	ld (ix+004h),h		;6ddb   ; guarda la X del disparo
	ld e,(ix+005h)		;6dde   ; lee la velocidad Y del disparo
	ld d,(ix+006h)		;6de1   ; lee la velocidad Y del disparo (alta)
	ld l,(ix+001h)		;6de4   ; lee la Y del disparo (fraccion)
	ld h,(ix+002h)		;6de7   ; lee la Y del disparo
	add hl,de			;6dea   ; Y + velocidad Y
	ld (ix+001h),l		;6deb   ; guarda la Y del disparo (fraccion)
	ld (ix+002h),h		;6dee   ; guarda la Y del disparo
	ret			;6df1
disparo_fuera:		; si se sale de 0x0A-0xF5 en X o 0x14-0xD8 en Y, se borra
	ld a,(ix+000h)		;6df2   ; lee el tipo del disparo
	or a			;6df5
	ret z			;6df6
	ld a,(ix+004h)		;6df7   ; lee la X del disparo
	cp 0f5h		;6dfa   ; la X fuera de 0x0A-0xF4...
	jr nc,borra_disparo		;6dfc
	cp 00ah		;6dfe
	jr c,borra_disparo		;6e00
	ld a,(ix+002h)		;6e02   ; lee la Y del disparo
	cp 0d8h		;6e05   ; ...o la Y fuera de 0x14-0xD7: se borra
	jr nc,borra_disparo		;6e07
	cp 014h		;6e09
	jr c,borra_disparo		;6e0b
	ld a,(ix+00dh)		;6e0d   ; el alcance: 0xFF sin limite...
	cp 0ffh		;6e10
	ret z			;6e12
	dec (ix+00dh)		;6e13   ; ...si no, a cero se borra
	ret nz			;6e16
borra_disparo:		; esconde sus 8 sprites (0xDE00) y lo pone a cero
	ld b,008h		;6e17   ; sus 8 sprites...
	ld de,0de00h		;6e19   ; apunta a los atributos de los sprites en RAM
	ld a,(ix+00ch)		;6e1c   ; lee el hueco de sprite del disparo
	add a,a			;6e1f   ; (4 bytes por sprite)
	add a,a			;6e20
	call 04088h		;6e21   ; de_mas_a: DE = DE + A
	ld a,0e0h		;6e24   ; ...con Y = 0xE0: escondidos
L_6E26:
	ld (de),a			;6e26
	inc de			;6e27
	djnz L_6E26		;6e28
	xor a			;6e2a   ; y la ficha a cero
	ld (ix+000h),a		;6e2b   ; guarda el tipo del disparo
	ld (0c26fh),a		;6e2e   ; guarda el golpe de Cles en marcha
	ret			;6e31
despacha_disparo:		; despacha el tipo del disparo - 1
	ld a,(ix+000h)		;6e32   ; lee el tipo del disparo
	or a			;6e35
	ret z			;6e36
	dec a			;6e37   ; el tipo - 1: tabla p01:6E3B
	call 0408dh		;6e38   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

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


disparo_10_1:		; (ix+0x10) = 1
	ld (ix+010h),001h		;6e4d
L_6E51:
	ret			;6e51
L_6E52:
	ld a,(0c00dh)		;6e52   ; lee la cuenta de cuadros del juego
	and 003h		;6e55
	call z,disparo_10_1		;6e57   ; disparo_10_1: (ix+0x10) = 1
	ld a,(0c244h)		;6e5a   ; lee la Y del personaje
	ld d,a			;6e5d
	call ajusta_disparo		;6e5e   ; ajusta_disparo: la Y del disparo segun su tipo y 0xC253
	ld (ix+002h),d		;6e61   ; guarda la Y del disparo
	ld a,(ix+00fh)		;6e64
	call 0408dh		;6e67   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

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
	call disparo_x_16		;6e7a   ; disparo_x_16: (ix+4) + 16 o - 16 segun (ix+9)
	inc (ix+00ah)		;6e7d   ; sube el registro de sprite del disparo (p09:B7C9)
	ld a,(ix+00ah)		;6e80   ; lee el registro de sprite del disparo (p09:B7C9)
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
	call disparo_x_16		;6e9a   ; disparo_x_16: (ix+4) + 16 o - 16 segun (ix+9)
	dec (ix+011h)		;6e9d
	ret nz			;6ea0
	jr L_6E96		;6ea1
L_6EA3:
	dec (ix+00ah)		;6ea3   ; baja el registro de sprite del disparo (p09:B7C9)
	call disparo_x_16		;6ea6   ; disparo_x_16: (ix+4) + 16 o - 16 segun (ix+9)
	ld a,(ix+00ah)		;6ea9   ; lee el registro de sprite del disparo (p09:B7C9)
	dec a			;6eac
	and 003h		;6ead
	ret nz			;6eaf
	inc (ix+00fh)		;6eb0
	ret			;6eb3
L_6EB4:
	jp borra_disparo		;6eb4   ; borra_disparo: esconde sus 8 sprites (0xDE00) y lo pone a cero
disparo_x_16:		; (ix+4) + 16 o - 16 segun (ix+9)
	ld b,010h		;6eb7
	ld a,(ix+009h)		;6eb9   ; lee el sentido del disparo (0: a la izquierda)
	or a			;6ebc
	jr nz,L_6EC1		;6ebd
	ld b,0f0h		;6ebf
L_6EC1:
	ld a,(ix+004h)		;6ec1   ; lee la X del disparo
	add a,b			;6ec4
	ld (ix+004h),a		;6ec5   ; guarda la X del disparo
	ret			;6ec8
L_6EC9:
	ld a,(ix+00fh)		;6ec9
	call 0408dh		;6ecc   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

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
	ld d,(ix+004h)		;6ed3   ; lee la X del disparo
	ld a,(ix+002h)		;6ed6   ; lee la Y del disparo
	add a,004h		;6ed9
	ld e,a			;6edb
	call compara_ficha		;6edc   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ret nc			;6edf
	ld de,01000h		;6ee0
	call velocidad_del_disparo		;6ee3   ; velocidad_del_disparo: (ix+7, 8) = DE, negada (p02:8B39) si (ix+9) es cero
	xor a			;6ee6
	ld (ix+00fh),a		;6ee7
	ld (ix+005h),a		;6eea   ; guarda la velocidad Y del disparo
	ld (ix+006h),a		;6eed   ; guarda la velocidad Y del disparo (alta)
	ret			;6ef0
L_6EF1:
	ld d,(ix+004h)		;6ef1   ; lee la X del disparo
	ld e,(ix+002h)		;6ef4   ; lee la Y del disparo
	ld a,(ix+009h)		;6ef7   ; lee el sentido del disparo (0: a la izquierda)
	ld hl,0f8f8h		;6efa
	or a			;6efd
	jr z,L_6F03		;6efe
	ld hl,008f8h		;6f00
L_6F03:
	add hl,de			;6f03
	ld d,h			;6f04
	ld e,l			;6f05
	call compara_ficha		;6f06   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	jp c,borra_disparo		;6f09   ; borra_disparo: esconde sus 8 sprites (0xDE00) y lo pone a cero
	ld d,(ix+004h)		;6f0c   ; lee la X del disparo
	ld e,(ix+002h)		;6f0f   ; lee la Y del disparo
	call compara_ficha		;6f12   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ret c			;6f15
	ld (ix+00fh),001h		;6f16
	xor a			;6f1a
	ld (ix+005h),a		;6f1b   ; guarda la velocidad Y del disparo
	ld (ix+006h),004h		;6f1e   ; la velocidad Y del disparo (alta) = 0x04
	ld (ix+007h),a		;6f22   ; guarda la velocidad X del disparo
	ld (ix+008h),a		;6f25   ; guarda la velocidad X del disparo (alta)
	ret			;6f28
L_6F29:
	ld a,(0c00dh)		;6f29   ; lee la cuenta de cuadros del juego
	and 003h		;6f2c
	call z,disparo_10_1		;6f2e   ; disparo_10_1: (ix+0x10) = 1
	jp cuadro_de_animacion		;6f31   ; cuadro_de_animacion: L = el cuadro (0xD8 + 2 cada 2 cuadros) segun (ix+9)
L_6F34:
	ld a,(0c24bh)		;6f34   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 005h		;6f37
	jr nz,L_6F42		;6f39
	ld a,(0c254h)		;6f3b   ; lee la direccion de las teclas (0, 1, 2)
	or a			;6f3e
	jp z,borra_disparo		;6f3f   ; borra_disparo: esconde sus 8 sprites (0xDE00) y lo pone a cero
L_6F42:
	ld a,(0c244h)		;6f42   ; lee la Y del personaje
	ld (ix+002h),a		;6f45   ; guarda la Y del disparo
	ld a,(0c246h)		;6f48   ; lee la X del personaje
	ld (ix+004h),a		;6f4b   ; guarda la X del disparo
	jp L_6D29		;6f4e
L_6F51:
	ld a,(0c00dh)		;6f51   ; lee la cuenta de cuadros del juego
	and 003h		;6f54
	call z,disparo_10_1		;6f56   ; disparo_10_1: (ix+0x10) = 1
	ld a,(0c244h)		;6f59   ; lee la Y del personaje
	ld (ix+002h),a		;6f5c   ; guarda la Y del disparo
	ld a,(0c246h)		;6f5f   ; lee la X del personaje
	ld (ix+004h),a		;6f62   ; guarda la X del disparo
	ld a,(0c00dh)		;6f65   ; lee la cuenta de cuadros del juego
	and 007h		;6f68
	ret nz			;6f6a
	ld a,00eh		;6f6b
	jp 056e3h		;6f6d   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_6F70:
	ret			;6f70
sprites_de_disparos:		; esconde 4 sprites y, con 9, los de los disparos (p01:6F9F)
	ld b,004h		;6f71
	ld hl,0de10h		;6f73   ; apunta a la Y del sprite 4 en RAM
	ld a,0e0h		;6f76
	ld de,00004h		;6f78
L_6F7B:
	ld (hl),a			;6f7b
	add hl,de			;6f7c
	djnz L_6F7B		;6f7d
	ld a,(0c320h)		;6f7f   ; lee los 4 disparos (0x20 bytes cada uno)
	cp 009h		;6f82
	ret z			;6f84
	ld ix,0c320h		;6f85   ; apunta a los 4 disparos (0x20 bytes cada uno)
	ld b,004h		;6f89
L_6F8B:
	push bc			;6f8b
	call 054afh		;6f8c   ; banco_9_en_a000: pone el banco 9 en 0xA000
	call sprite_de_disparo		;6f8f   ; sprite_de_disparo: el registro p09:B7C9[(ix+0x0A)] a 0xDE00 + (ix+0x0C) * 4
	call 05464h		;6f92   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld de,00020h		;6f95
	add ix,de		;6f98
	pop bc			;6f9a
	djnz L_6F8B		;6f9b
	jr L_6FF7		;6f9d
sprite_de_disparo:		; el registro p09:B7C9[(ix+0x0A)] a 0xDE00 + (ix+0x0C) * 4
	ld a,(ix+000h)		;6f9f   ; lee el tipo del disparo
	or a			;6fa2
	ret z			;6fa3
	ld hl,0b7c9h		;6fa4
	ld a,(ix+00ah)		;6fa7   ; lee el registro de sprite del disparo (p09:B7C9)
	call 0543ah		;6faa   ; palabra_a: HL = la palabra A de la tabla HL
	ld b,(hl)			;6fad
	inc hl			;6fae
	ld a,(ix+00ch)		;6faf   ; lee el hueco de sprite del disparo
	ld de,0de00h		;6fb2   ; apunta a los atributos de los sprites en RAM
	add a,a			;6fb5
	add a,a			;6fb6
	call 04088h		;6fb7   ; de_mas_a: DE = DE + A
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
	call suma_sin_pasar		;6fcd   ; suma_sin_pasar: (DE) + (HL), o 0xFF si se pasa (y nada si (DE) >= 0x80)
	inc hl			;6fd0
	inc hl			;6fd1
	inc de			;6fd2
	dec c			;6fd3
	jr nz,L_6FCD		;6fd4
	inc de			;6fd6
	inc de			;6fd7
	djnz L_6FC6		;6fd8
	ret			;6fda
suma_sin_pasar:		; (DE) + (HL), o 0xFF si se pasa (y nada si (DE) >= 0x80)
	ld a,(de)			;6fdb
	cp 080h		;6fdc
	jr nc,L_6FE9		;6fde
	add a,(hl)			;6fe0
	call c,ff		;6fe1   ; ff: A = 0xFF
	ld (de),a			;6fe4
	ret			;6fe5
ff:		; A = 0xFF
	ld a,0ffh		;6fe6
	ret			;6fe8
L_6FE9:
	neg		;6fe9
	push bc			;6feb
	ld b,a			;6fec
	ld a,(hl)			;6fed
	sub b			;6fee
	pop bc			;6fef
	call c,cero		;6ff0   ; cero: A = 0
	ld (de),a			;6ff3
	ret			;6ff4
cero:		; A = 0
	xor a			;6ff5
	ret			;6ff6
L_6FF7:
	ld a,(0c240h)		;6ff7   ; lee el personaje que se lleva (0 o 1)
	or a			;6ffa
	jr z,L_701A		;6ffb
	ld a,(0c316h)		;6ffd   ; lee en la sala del final de fase
	ld b,a			;7000
	ld a,(0c20ah)		;7001   ; lee en la sala de la puerta 5
	or b			;7004
	jr z,L_701A		;7005
	ld b,004h		;7007
	ld hl,0de13h		;7009   ; apunta a el color del sprite 4 en RAM
L_700C:
	ld a,(hl)			;700c
	cp 049h		;700d
	jr nz,L_7013		;700f
	ld (hl),04bh		;7011
L_7013:
	ld a,004h		;7013
	call 04083h		;7015   ; hl_mas_a: HL = HL + A
	djnz L_700C		;7018
L_701A:
	ld hl,0de13h		;701a   ; apunta a el color del sprite 4 en RAM
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
	call 04083h		;702b   ; hl_mas_a: HL = HL + A
	dec c			;702e
	jr nz,L_7022		;702f
	ret			;7031
fin_de_disparos:		; si 0xC257 y no queda ningun disparo: 0xC257 = 0 y p00:5A97
	ld a,(0c257h)		;7032   ; lee hay disparos en marcha
	or a			;7035
	ret z			;7036
	ld de,00020h		;7037
	ld hl,0c320h		;703a   ; apunta a los 4 disparos (0x20 bytes cada uno)
	ld b,004h		;703d
L_703F:
	ld a,(hl)			;703f
	or a			;7040
	ret nz			;7041
	add hl,de			;7042
	djnz L_703F		;7043
	xor a			;7045
	ld (0c257h),a		;7046   ; guarda hay disparos en marcha
	jp 05a97h		;7049   ; sprites_del_estado: si se lleva al personaje 0, con 13-14-15 los patrones de p15:A31B
compara_ficha:		; acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ld a,(0c222h)		;704c   ; lee el umbral de fichas de p01:704C
	ld b,a			;704f
	ld a,e			;7050
	add a,004h		;7051
	ld e,a			;7053
	call ficha_en		;7054   ; ficha_en: A = la ficha de 0xD200 en (D = X, E = Y), o fuera de la pantalla
	dec a			;7057
	cp b			;7058
	ret			;7059
suelo_bajo_el_personaje:		; si hay suelo bajo el personaje en su siguiente Y
	ld a,(0c24bh)		;705a   ; lee la accion del personaje (4 muere, 5 escalera)
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
	ld a,(0c246h)		;706d   ; lee la X del personaje
	call siguiente_y		;7070   ; siguiente_y: HL = 0xC243 + 0xC247: la Y del personaje en el siguiente cuadro
	ld d,a			;7073
	ld a,h			;7074
	cp 0d0h		;7075
	ret nc			;7077
	ld e,h			;7078
	ld c,005h		;7079
	jp L_7132		;707b
L_707E:
	ld de,(0c245h)		;707e   ; lee la X del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	ld hl,(0c249h)		;7082   ; lee la velocidad X del personaje (16 bits) y el byte siguiente (16 bits)
	add hl,de			;7085
	ret			;7086
siguiente_y:		; HL = 0xC243 + 0xC247: la Y del personaje en el siguiente cuadro
	ld de,(0c243h)		;7087   ; lee la Y del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	ld hl,(0c247h)		;708b   ; lee la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	add hl,de			;708e
	ret			;708f
techo_del_personaje:		; las fichas encima del personaje (p01:7132)
	ld a,(0c246h)		;7090   ; lee la X del personaje
	call siguiente_y		;7093   ; siguiente_y: HL = 0xC243 + 0xC247: la Y del personaje en el siguiente cuadro
	ld d,a			;7096
	ld a,h			;7097
	add a,0eeh		;7098
	ld e,a			;709a
	ld c,004h		;709b
	jp L_7132		;709d
ficha_arriba:		; la ficha 4 puntos por encima del personaje si esta centrado en la casilla
	call centrado_en_x		;70a0   ; centrado_en_x: acarreo si (X + 3) & 15 < 6: el personaje esta en el centro de su casilla
	ccf			;70a3
	ret nc			;70a4
	ld a,(0c244h)		;70a5   ; lee la Y del personaje
	sub 004h		;70a8
	jr ficha_en_x		;70aa
ficha_abajo:		; la ficha 13 puntos por debajo del personaje si esta centrado en la casilla
	call centrado_en_x		;70ac   ; centrado_en_x: acarreo si (X + 3) & 15 < 6: el personaje esta en el centro de su casilla
	ccf			;70af
	ret nc			;70b0
	ld a,(0c244h)		;70b1   ; lee la Y del personaje
	add a,00dh		;70b4
	cp 0d4h		;70b6
	jr nc,L_70C6		;70b8
ficha_en_x:		; la ficha en (X del personaje, A) (p01:7176)
	ld e,a			;70ba
	ld a,(0c246h)		;70bb   ; lee la X del personaje
	ld d,a			;70be
ficha_en_menos_1:		; A = la ficha de 0xD200 en (D, E) - 1 (p01:7176) y sigue en p01:7141
	call ficha_en		;70bf   ; ficha_en: A = la ficha de 0xD200 en (D = X, E = Y), o fuera de la pantalla
	dec a			;70c2
	jp L_7141		;70c3
L_70C6:
	scf			;70c6
	ret			;70c7
centrado_en_x:		; acarreo si (X + 3) & 15 < 6: el personaje esta en el centro de su casilla
	ld a,(0c246h)		;70c8   ; lee la X del personaje
	add a,003h		;70cb
	and 00fh		;70cd
	cp 006h		;70cf
	ret			;70d1
L_70D2:
	ld a,d			;70d2   ; D < 0x80: mira la casilla de la derecha; si no, la de la izquierda
	cp 080h		;70d3
	jr c,L_70DF		;70d5
	ld a,(0ccb2h)		;70d7   ; 0xCCB2: el lado de la derecha esta cerrado
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
	ld hl,(0c245h)		;70e8   ; lee la X del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	add hl,de			;70eb
	ld de,(0c249h)		;70ec   ; lee la velocidad X del personaje (16 bits) y el byte siguiente (16 bits)
	add hl,de			;70f0
	pop de			;70f1
	ld d,h			;70f2
	push de			;70f3
	ld d,e			;70f4
	ld e,000h		;70f5
	ld hl,(0c243h)		;70f7   ; lee la Y del personaje (16 bits, fraccion) y el byte siguiente (16 bits)
	add hl,de			;70fa
	ld de,(0c247h)		;70fb   ; lee la velocidad Y del personaje (16 bits) y el byte siguiente (16 bits)
	add hl,de			;70ff
	pop de			;7100
	ld e,h			;7101
	ld a,d			;7102
	cp 008h		;7103
	jr nc,L_7110		;7105
	ld a,(0c21ah)		;7107   ; lee la vecina de la izquierda
	cp 0ffh		;710a
	scf			;710c
	ret z			;710d
	jr L_711B		;710e
L_7110:
	cp 0f8h		;7110
	jr c,L_711B		;7112
	ld a,(0c21bh)		;7114   ; lee la vecina de la derecha
	cp 0ffh		;7117
	scf			;7119
	ret z			;711a
L_711B:
	ld c,008h		;711b
	push de			;711d
	call dos_fichas		;711e   ; dos_fichas: p01:704C en E + C y en E - C
	pop de			;7121
	ret c			;7122
	push de			;7123
	call compara_ficha		;7124   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop de			;7127
	ret c			;7128
	ld c,005h		;7129
	push de			;712b
	call dos_fichas		;712c   ; dos_fichas: p01:704C en E + C y en E - C
	pop de			;712f
	ret c			;7130
	ret			;7131
L_7132:
	push de			;7132
	ld a,c			;7133
	add a,d			;7134
	ld d,a			;7135
	call compara_ficha		;7136   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop de			;7139
	ret c			;713a
	ld a,d			;713b
	sub c			;713c
	ld d,a			;713d
	jp compara_ficha		;713e   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
L_7141:
	inc a			;7141   ; A = la ficha: por debajo de 0xC223, no es suelo
	ld b,a			;7142
	ld e,a			;7143
	ld a,(0c223h)		;7144
	ld d,a			;7147
	ld a,b			;7148
	sub d			;7149
	ccf			;714a
	ret nc			;714b
	ld b,a			;714c
	ld a,(0c224h)		;714d   ; por encima de 0xC224, tampoco
	ld d,a			;7150
	ld a,b			;7151
	cp d			;7152
	ret c			;7153
	ld a,(0c21dh)		;7154   ; en la ruina 6 (0xC21D) las fichas 0x26 y 0x2D son especiales
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
dos_fichas:		; p01:704C en E + C y en E - C
	push de			;7167
	ld a,c			;7168
	add a,e			;7169
	ld e,a			;716a
	call compara_ficha		;716b   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop de			;716e
	ret c			;716f
	ld a,e			;7170
	sub c			;7171
	ld e,a			;7172
	jp compara_ficha		;7173   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
ficha_en:		; A = la ficha de 0xD200 en (D = X, E = Y), o fuera de la pantalla
	ld a,e			;7176   ; la Y: por debajo de 0xD4 (p01:719F) o por encima de 0x18 (p01:7196), fuera
	cp 0d4h		;7177
	jr nc,L_719F		;7179
	cp 018h		;717b
	jr c,L_7196		;717d
	rrca			;717f   ; (Y / 8) * 32 + X / 8: la casilla
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
	ld de,0d1a0h		;7190   ; + 0xD1A0: la fila 0 de 0xD200 es la de la Y 0x18
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
disparos_contra_actores:		; cada disparo de 0xC320 contra los 8 actores de 0xC400 con (ix+0x13) bit 1
	ld c,004h		;71a1
	ld iy,0c320h		;71a3   ; apunta a los 4 disparos (0x20 bytes cada uno)
L_71A7:
	ld b,008h		;71a7
	ld ix,0c400h		;71a9   ; apunta a los 8 actores (0x80 bytes cada uno)
L_71AD:
	ld a,(ix+000h)		;71ad   ; lee el tipo del actor
	or a			;71b0
	jr z,L_71DC		;71b1
	ld a,(ix+013h)		;71b3   ; lee las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	and 002h		;71b6
	jr z,L_71DC		;71b8
	ld a,(iy+000h)		;71ba
	or a			;71bd
	jr z,L_71E3		;71be
	ld a,(iy+010h)		;71c0
	or a			;71c3
	jr z,L_71E3		;71c4
	push bc			;71c6
	call caja_del_disparo		;71c7   ; caja_del_disparo: con 15: la caja del disparo IY (p01:744D)
	exx			;71ca
	push de			;71cb
	exx			;71cc
	push de			;71cd
	call caja_del_actor		;71ce   ; caja_del_actor: con 6: la caja del actor IX de p06:B6D3[tipo - 1]
	pop de			;71d1
	exx			;71d2
	pop de			;71d3
	exx			;71d4
	call cajas_se_tocan		;71d5   ; cajas_se_tocan: acarreo si las dos cajas (D, E, H, L y las de HL') se tocan
	call c,disparo_acierta		;71d8   ; disparo_acierta: borra el disparo y quita al actor lo de p01:7234[tipo - 1]
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
disparo_acierta:		; borra el disparo y quita al actor lo de p01:7234[tipo - 1]
	ld a,(iy+000h)		;71f2
	ld (0de80h),a		;71f5   ; guarda variable de trabajo del banco 0
	cp 001h		;71f8
	jr z,L_71EC		;71fa
	cp 006h		;71fc
	jr nc,L_71EC		;71fe
	push ix		;7200
	push iy		;7202
	pop ix		;7204
	call borra_disparo		;7206   ; borra_disparo: esconde sus 8 sprites (0xDE00) y lo pone a cero
	pop ix		;7209
L_720B:
	ld a,(ix+000h)		;720b   ; segun el tipo del actor tocado: 0x0E, 8 y 0x0F tienen lo suyo
	cp 00eh		;720e
	jr z,$+45		;7210
	cp 008h		;7212
	jr z,$+59		;7214
	cp 00fh		;7216
	jr z,$+81		;7218
quita_vida_al_actor:		; (ix+0x12) - p01:7234[0xDE80 - 1]; a cero, sonido 0x17
	ld a,(0de80h)		;721a   ; lee variable de trabajo del banco 0
	dec a			;721d
	ld hl,07234h		;721e
	call 04083h		;7221   ; hl_mas_a: HL = HL + A
	ld b,(hl)			;7224
	ld a,(ix+012h)		;7225
	sub b			;7228
	jr nc,L_722C		;7229
	xor a			;722b
L_722C:
	ld (ix+012h),a		;722c
	ld a,017h		;722f
	jp 056e3h		;7231   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto

; ----------------------------------------------------------------------
; DATOS tabla_p721E: 9 bytes que lee p01:721E (ld hl,0x7234)
;   0x7234..0x723d  (9 bytes)
DATA_tabla_p721E:
	defb 001h,001h,001h,001h,001h,001h,004h,004h,001h	; 7234  .........

; ======================================================================
; CODIGO 0x723d..0x7429  (492 bytes)
; ======================================================================


L_723D:
	ld a,(ix+001h)		;723d   ; lee el paso del actor
	or a			;7240
	jr nz,$-39		;7241
	ld (ix+013h),000h		;7243   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	inc (ix+001h)		;7247   ; sube el paso del actor
	ld a,018h		;724a
	jp 056e3h		;724c   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_724F:
	ld a,(ix+001h)		;724f   ; lee el paso del actor
	cp 002h		;7252
	jr nc,$-58		;7254
	cp 001h		;7256
	call z,quita_vida_al_actor		;7258   ; quita_vida_al_actor: (ix+0x12) - p01:7234[0xDE80 - 1]; a cero, sonido 0x17
	ld a,(ix+012h)		;725b   ; lee la vida del actor (p01:721A)
	or a			;725e
	ret nz			;725f
	ld (ix+001h),002h		;7260   ; el paso del actor = 0x02
	ld (ix+012h),001h		;7264   ; la vida del actor (p01:721A) = 0x01
	ret			;7268
L_7269:
	ld a,01ch		;7269
	call 056e3h		;726b   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld (ix+001h),003h		;726e   ; el paso del actor = 0x03
	ld (ix+010h),07fh		;7272   ; el fotograma del actor (p02:8A42) = 0x7F
	call 08b89h		;7276   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	ld h,004h		;7279
	call 08b80h		;727b   ; velocidad_y_h: (ix+7, 8) = H * 256 (L = 0)
	xor a			;727e
	ld (ix+013h),a		;727f   ; guarda las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	ld (ix+00bh),a		;7282   ; guarda si el actor acelera (p02:8393)
	ret			;7285
actores_contra_el_personaje:		; los 8 actores con (ix+0x13) bit 0 contra el personaje
	ld a,(0c24bh)		;7286   ; lee la accion del personaje (4 muere, 5 escalera)
	cp 004h		;7289
	ret z			;728b
	cp 006h		;728c
	ret z			;728e
	ld b,008h		;728f
	ld ix,0c400h		;7291   ; apunta a los 8 actores (0x80 bytes cada uno)
L_7295:
	ld a,(ix+000h)		;7295   ; lee el tipo del actor
	or a			;7298
	jr z,L_72C0		;7299
	ld a,(ix+013h)		;729b   ; lee las banderas de choque del actor (bit 0 personaje, bit 1 disparos)
	and 001h		;729e
	jr z,L_72C0		;72a0
	push bc			;72a2
	call caja_del_personaje		;72a3   ; caja_del_personaje: la caja del personaje segun 0xC253 y 0xC240 (p01:7429)
	ld a,(ix+000h)		;72a6   ; lee el tipo del actor
	cp 037h		;72a9
	jp z,L_73BE		;72ab
	exx			;72ae
	push de			;72af
	exx			;72b0
	push de			;72b1
	call caja_del_actor		;72b2   ; caja_del_actor: con 6: la caja del actor IX de p06:B6D3[tipo - 1]
	pop de			;72b5
	exx			;72b6
	pop de			;72b7
	exx			;72b8
	call cajas_se_tocan		;72b9   ; cajas_se_tocan: acarreo si las dos cajas (D, E, H, L y las de HL') se tocan
L_72BC:
	call c,toca_al_personaje		;72bc   ; toca_al_personaje: lo que pasa al tocar el actor IX segun su tipo (0x29, 0x2A, 0x0E...)
	pop bc			;72bf
L_72C0:
	ld de,00080h		;72c0
	add ix,de		;72c3
	djnz L_7295		;72c5
	ret			;72c7
toca_al_personaje:		; lo que pasa al tocar el actor IX segun su tipo (0x29, 0x2A, 0x0E...)
	ld a,(ix+000h)		;72c8   ; lee el tipo del actor
	cp 029h		;72cb
	jp z,L_7539		;72cd
	cp 02ah		;72d0
	jp z,L_7539		;72d2
	cp 00eh		;72d5
	call z,toca_tipo_14		;72d7   ; toca_tipo_14: sonido 0x18, (ix+0x13) = 0 y el paso siguiente
	call tipo_7_o_13		;72da   ; tipo_7_o_13: Z y sin acarreo si el tipo es 7 o 13
	ret c			;72dd
	call personaje_1_fuerte		;72de   ; personaje_1_fuerte: acarreo si 0xC26F, el estado del personaje 1 es 3 y el tipo es menor de 0x37
	ret c			;72e1
	ld a,(0c256h)		;72e2   ; lee invencible
	or a			;72e5
	ret nz			;72e6
	ld hl,0c2b0h		;72e7   ; apunta a la ficha del personaje 0 (14 bytes)
	ld a,(0c240h)		;72ea   ; lee el personaje que se lleva (0 o 1)
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
	ld a,(0c205h)		;72fc   ; lee los cartuchos encontrados (bits 0-3: 07 49, 07 50, 07 51, 07 52)
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
	call empieza_salto		;730c   ; empieza_salto: 0xC264 = 1 y el salto segun la accion
sonido_de_vida:		; el sonido 0x1D o 0x23 segun la vida (byte 5 de la ficha) y su barra (p00:4752)
	call 047ebh		;730f   ; byte_5_del_personaje: A = el byte 5 de la ficha del personaje que se lleva
	cp 00dh		;7312
	ld a,01dh		;7314
	jr nc,L_731A		;7316
	ld a,023h		;7318
L_731A:
	call 056e3h		;731a   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	call 04752h		;731d   ; barra_de_vida: la barra de la vida (byte 5 de la ficha) en (0x2A, 6) (p00:4758)
	ld a,020h		;7320
	ld (0c24fh),a		;7322
	ld a,001h		;7325
	ld (0c256h),a		;7327   ; guarda invencible
	ret			;732a
tipo_7_o_13:		; Z y sin acarreo si el tipo es 7 o 13
	ld a,(ix+000h)		;732b   ; lee el tipo del actor
	cp 007h		;732e
	jr z,L_7338		;7330
	cp 00dh		;7332
	jr z,L_7338		;7334
	or a			;7336
	ret			;7337
L_7338:
	ld a,(0c24bh)		;7338   ; lee la accion del personaje (4 muere, 5 escalera)
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
	ld a,(ix+000h)		;734a   ; lee el tipo del actor
	cp 007h		;734d
	jr z,L_7357		;734f
	cp 00dh		;7351
	jr z,L_736C		;7353
L_7355:
	or a			;7355
	ret			;7356
L_7357:
	ld a,(ix+001h)		;7357   ; lee el paso del actor
	cp 002h		;735a
	jr c,L_7355		;735c
	cp 004h		;735e
	jr nc,L_7355		;7360
	ld (ix+001h),004h		;7362   ; el paso del actor = 0x04
	ld (ix+010h),062h		;7366   ; el fotograma del actor (p02:8A42) = 0x62
	jr L_7383		;736a
L_736C:
	ld a,(ix+001h)		;736c   ; lee el paso del actor
	cp 001h		;736f
	jr z,L_737B		;7371
	cp 002h		;7373
	jr z,L_737B		;7375
	cp 004h		;7377
	jr nz,L_7355		;7379
L_737B:
	ld (ix+001h),006h		;737b   ; el paso del actor = 0x06
	ld (ix+010h),063h		;737f   ; el fotograma del actor (p02:8A42) = 0x63
L_7383:
	call 08b89h		;7383   ; velocidad_x_l: (ix+9, 0x0A) = L (H = 0)
	call 08b7eh		;7386   ; velocidad_y_l: (ix+7, 8) = L (H = 0)
	ld a,009h		;7389
	call 056e3h		;738b   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld (ix+011h),020h		;738e   ; la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278) = 0x20
	ld (ix+013h),000h		;7392   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	scf			;7396
	ret			;7397
personaje_1_fuerte:		; acarreo si 0xC26F, el estado del personaje 1 es 3 y el tipo es menor de 0x37
	ld a,(0c26fh)		;7398   ; lee el golpe de Cles en marcha
	or a			;739b
	ret z			;739c
	ld a,(0c2d6h)		;739d   ; lee el estado del personaje 1
	cp 003h		;73a0
	ccf			;73a2
	ret nc			;73a3
	ld a,(ix+000h)		;73a4   ; lee el tipo del actor
	cp 037h		;73a7
	ret nc			;73a9
	scf			;73aa
	ret			;73ab
toca_tipo_14:		; sonido 0x18, (ix+0x13) = 0 y el paso siguiente
	ld a,(ix+001h)		;73ac   ; lee el paso del actor
	or a			;73af
	ret nz			;73b0
	ld a,018h		;73b1
	call 056e3h		;73b3   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld (ix+013h),000h		;73b6   ; las banderas de choque del actor (bit 0 personaje, bit 1 disparos) = 0x00
	inc (ix+001h)		;73ba   ; sube el paso del actor
	ret			;73bd
L_73BE:
	ld b,(ix+020h)		;73be   ; lee las piezas del actor (p02:8648)
	push ix		;73c1
	pop hl			;73c3
	ld a,022h		;73c4
	call 04083h		;73c6   ; hl_mas_a: HL = HL + A
L_73C9:
	push bc			;73c9   ; B cajas de HL (5 bytes cada una) contra la del personaje
	exx			;73ca
	push de			;73cb
	exx			;73cc
	push de			;73cd
	push hl			;73ce
	call caja_de_hl		;73cf   ; caja_de_hl: la caja de la posicion (DE) para p01:74CB
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
	jp c,L_72BC		;73de   ; si se tocan, sale con acarreo
	djnz L_73C9		;73e1
	or a			;73e3
	jp L_72BC		;73e4
caja_de_hl:		; la caja de la posicion (DE) para p01:74CB
	push de			;73e7   ; la caja de (DE): Y + 0x0C con alto 4, X + 8 con ancho 4
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
	jp cajas_se_tocan		;73fa   ; cajas_se_tocan: acarreo si las dos cajas (D, E, H, L y las de HL') se tocan
caja_del_personaje:		; la caja del personaje segun 0xC253 y 0xC240 (p01:7429)
	call caja_grande		;73fd   ; caja_grande: acarreo y HL = p01:7442 si 0xC26F y el estado del personaje 1 es 3
	jr c,L_7419		;7400
	ld hl,0742dh		;7402
	ld a,(0c253h)		;7405   ; lee el cuadro de animacion del personaje
	sub 008h		;7408
	jr z,L_7412		;740a
	dec a			;740c
	jr z,L_7412		;740d
	ld hl,07429h		;740f
L_7412:
	ld a,(0c240h)		;7412   ; lee el personaje que se lleva (0 o 1)
	add a,a			;7415
	call 04083h		;7416   ; hl_mas_a: HL = HL + A
L_7419:
	ld a,(0c246h)		;7419   ; lee la X del personaje
	ld d,a			;741c
	ld e,(hl)			;741d
	inc hl			;741e
	push hl			;741f
	exx			;7420
	pop hl			;7421
	ld a,(0c244h)		;7422   ; lee la Y del personaje
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


caja_grande:		; acarreo y HL = p01:7442 si 0xC26F y el estado del personaje 1 es 3
	ld a,(0c26fh)		;7431   ; lee el golpe de Cles en marcha
	or a			;7434
	ret z			;7435
	ld a,(0c2d6h)		;7436   ; lee el estado del personaje 1
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


caja_del_disparo:		; con 15: la caja del disparo IY (p01:744D)
	call 054a5h		;7444   ; banco_15_en_a000: pone el banco 15 en 0xA000 (p00:54B9)
	call medidas_del_disparo		;7447   ; medidas_del_disparo: las medidas del disparo IY de p15:BEAD[tipo - 1]
	jp 05464h		;744a   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
medidas_del_disparo:		; las medidas del disparo IY de p15:BEAD[tipo - 1]
	ld a,(iy+000h)		;744d   ; los disparos 7 y 8 no tienen medidas de tabla
	cp 007h		;7450
	jr z,L_7484		;7452
	cp 008h		;7454
	jr z,L_7484		;7456
	ld hl,0beadh		;7458   ; 2 bytes por tipo en p15:BEAD: el alto y el ancho de la caja
	dec a			;745b
	add a,a			;745c
	call 04083h		;745d   ; hl_mas_a: HL = HL + A
	ld a,(iy+004h)		;7460   ; X del disparo con su ancho
	ld d,a			;7463
	ld e,(hl)			;7464
	inc hl			;7465
	push hl			;7466
	ld a,(iy+002h)		;7467   ; Y del disparo con su alto
	exx			;746a
	pop hl			;746b
	ld d,a			;746c
	ld e,(hl)			;746d
	exx			;746e
	ld a,(iy+000h)		;746f   ; el tipo 1 cambia el ancho segun (iy+0x0A)
	cp 001h		;7472
	jr z,L_7477		;7474
	ret			;7476
L_7477:
	ld a,(iy+00ah)		;7477   ; ((iy+0x0A) - 1) & 3: 8, 16, 24 o 32 de ancho
	dec a			;747a
	and 003h		;747b
	add a,a			;747d
	add a,a			;747e
	add a,a			;747f
	add a,008h		;7480
	ld e,a			;7482
	ret			;7483
L_7484:
	ld a,(0c250h)		;7484   ; lee el sentido del personaje
	or a			;7487
	ld a,00ah		;7488
	jr nz,L_748E		;748a
	ld a,0f6h		;748c
L_748E:
	add a,(iy+004h)		;748e   ; la caja de los disparos 7 y 8: X + A y la Y de p15:BEA7[(iy+0x0A) - 9]
	ld d,a			;7491
	ld e,004h		;7492
	exx			;7494
	ld a,(iy+00ah)		;7495
	sub 009h		;7498
	ld hl,0bea7h		;749a
	call 04083h		;749d   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;74a0
	add a,(iy+002h)		;74a1
	ld d,a			;74a4
	ld e,004h		;74a5
	exx			;74a7
	ret			;74a8
caja_del_actor:		; con 6: la caja del actor IX de p06:B6D3[tipo - 1]
	call 054b4h		;74a9   ; banco_6_en_a000: pone el banco 6 en 0xA000
	ld a,(ix+000h)		;74ac   ; lee el tipo del actor
	dec a			;74af
	add a,a			;74b0
	ld hl,0b6d3h		;74b1
	call 04083h		;74b4   ; hl_mas_a: HL = HL + A
	ld a,(ix+005h)		;74b7   ; lee la X del actor
	ld d,a			;74ba
	ld e,(hl)			;74bb
	inc hl			;74bc
	push hl			;74bd
	ld a,(ix+003h)		;74be   ; lee la Y del actor
	exx			;74c1
	pop hl			;74c2
	ld d,a			;74c3
	ld e,(hl)			;74c4
	ex de,hl			;74c5
	exx			;74c6
	ex de,hl			;74c7
	jp 05464h		;74c8   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
cajas_se_tocan:		; acarreo si las dos cajas (D, E, H, L y las de HL') se tocan
	ld a,e			;74cb   ; primero en X: |D - H| < E + L
	add a,l			;74cc   ; E + L: la suma de las dos mitades (ancho)
	ld b,a			;74cd
	add a,a			;74ce
	ld c,a			;74cf   ; el doble: el rango de la comparacion
	ld a,d			;74d0   ; D - H + (E + L) < 2 * (E + L): se solapan en X
	sub h			;74d1
	add a,b			;74d2
	cp c			;74d3
	ret nc			;74d4
	exx			;74d5   ; luego en Y, con los registros de HL'
	ld a,d			;74d6   ; y lo mismo en Y con los de HL'
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
umbral_de_fichas:		; fuera de la sala 5, el umbral de fichas de p01:704C (0xC222 = 0x11, 0xC223 = 0x12)
	ld a,(0c20ah)		;74e7   ; lee en la sala de la puerta 5
	or a			;74ea
	jr nz,L_74FC		;74eb
	ld a,011h		;74ed
	ld (0c222h),a		;74ef   ; guarda el umbral de fichas de p01:704C
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
	ld (0c222h),a		;7505   ; guarda el umbral de fichas de p01:704C
	ret			;7508
marca_en_e000:		; un hueco en 0xE000 (de 4 en 4) para el actor IX salvo el tipo 0x29
	ld a,(ix+000h)		;7509   ; lee el tipo del actor
	cp 029h		;750c
	ret z			;750e
	ld a,(ix+015h)		;750f
	cp 005h		;7512
	ret nc			;7514
	ld hl,0e000h		;7515
	ld b,0a0h		;7518
L_751A:
	ld a,(hl)			;751a   ; busca un hueco libre (0) en 0xE000, de 4 en 4
	or a			;751b
	jr z,L_7525		;751c
	inc hl			;751e
	inc hl			;751f
	inc hl			;7520
	inc hl			;7521
	djnz L_751A		;7522
	ret			;7524
L_7525:
	ld a,(ix+005h)		;7525   ; lee la X del actor
	ld (hl),a			;7528
	inc hl			;7529
	ld a,(ix+003h)		;752a   ; lee la Y del actor
	ld (hl),a			;752d
	inc hl			;752e
	ld a,(0c212h)		;752f   ; lee la pantalla de la fase (desde 1)
	ld (hl),a			;7532
	inc hl			;7533
	ld a,(0c211h)		;7534   ; lee la fase (1-25: ruina * 5 + puerta)
	ld (hl),a			;7537
	ret			;7538
L_7539:
	call marca_en_e000		;7539   ; marca_en_e000: un hueco en 0xE000 (de 4 en 4) para el actor IX salvo el tipo 0x29
	ld a,(ix+015h)		;753c
	dec a			;753f
	push iy		;7540
	push ix		;7542
	pop iy		;7544
	push ix		;7546
	call despacha_por_personaje		;7548   ; despacha_por_personaje: despacha A con IX = la ficha del personaje
	pop ix		;754b
	pop iy		;754d
	ld a,(ix+000h)		;754f
	cp 029h		;7552
	jp z,083d6h		;7554   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	jp L_755A		;7557
L_755A:
	ld a,(ix+005h)		;755a   ; lee la X del actor
	sub 008h		;755d
	ld d,a			;755f
	ld a,(ix+003h)		;7560   ; lee la Y del actor
	sub 010h		;7563
	ld e,a			;7565
	ld a,(ix+01fh)		;7566
	ld hl,0a802h		;7569
	call 0543ah		;756c   ; palabra_a: HL = la palabra A de la tabla HL
	ld bc,01010h		;756f
	call 04841h		;7572   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	ld a,(ix+01fh)		;7575
	ld hl,0cc60h		;7578
	call 04083h		;757b   ; hl_mas_a: HL = HL + A
	xor a			;757e
	ld (hl),a			;757f
	jp 083d6h		;7580   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
despacha_por_personaje:		; despacha A con IX = la ficha del personaje
	push af			;7583
	call ficha_del_personaje		;7584   ; ficha_del_personaje: IX = la ficha del personaje que se lleva (0xC2B0 o 0xC2D0)
	pop af			;7587
	ld b,a			;7588
	call 0408dh		;7589   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

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
	call 055b9h		;75b8   ; suma_monedas: las monedas (0xC259, BCD) + E (y D al byte alto)
	call 04782h		;75bb   ; dos_cifras_dobles: las cifras de 0xC25A y 0xC259 en grande (p00:47FE)
	ld a,021h		;75be
	jp 056e3h		;75c0   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_75C3:
	ld hl,0c310h		;75c3   ; apunta a el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	inc (hl)			;75c6
	call 090bah		;75c7   ; cuenta_30_d502: 0xC314 = 0x30 y p02:8F94 con DE = (0xD502)
	ld a,040h		;75ca
	jp 056e3h		;75cc   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_75CF:
	ld hl,0687ch		;75cf
	ld de,0787ch		;75d2
	ld bc,01008h		;75d5
	xor a			;75d8
	call 04bdeh		;75d9   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
L_75DC:
	ld hl,0c310h		;75dc   ; apunta a el paso de la sala del final de fase o de la sala 5 (+ 1 al coger las clases 5-7)
	inc (hl)			;75df
	xor a			;75e0
	ld (0c314h),a		;75e1   ; guarda la cuenta de la sala del final de fase o de la sala 5
	ld a,040h		;75e4
	call 056e3h		;75e6   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	ld a,0ffh		;75e9
	jp 056e3h		;75eb   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
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
	call ficha_del_personaje		;75fe   ; ficha_del_personaje: IX = la ficha del personaje que se lleva (0xC2B0 o 0xC2D0)
	pop af			;7601
	ld (ix+006h),a		;7602
	call 05b12h		;7605   ; sprites_del_personaje: con 13-14-15: los 7 fotogramas del estado del personaje (p14:97AE o p14:9BCE)
	pop ix		;7608
	call 0485ah		;760a   ; barra_del_personaje: la barra de 4 del byte 6 del personaje (p00:4891)
	ld a,001h		;760d
	ld (0c257h),a		;760f   ; guarda hay disparos en marcha
	call sprites_a426_encima		;7612   ; sprites_a426_encima: los patrones de p15:A426 y dos sprites encima del personaje
	ld a,022h		;7615
	call 056e3h		;7617   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
	jp 054c1h		;761a   ; musica_de_fase_otra: como p00:54C8 con 0xDE80 = 1
sprites_a426_encima:		; los patrones de p15:A426 y dos sprites encima del personaje
	call 05ab8h		;761d   ; sprites_a426: los patrones de p15:A426 segun el estado del personaje
	ld a,010h		;7620
	ld (0c272h),a		;7622   ; guarda la cuenta del globo de animo
globo_encima:		; los sprites 8 y 9 en (Y - 0x30, X - 8) del personaje, patrones 0x28 y 0x2C y sus colores (p01:765B)
	ld a,(0c244h)		;7625   ; lee la Y del personaje
	sub 030h		;7628
	ld l,a			;762a
	ld a,(0c246h)		;762b   ; lee la X del personaje
	sub 008h		;762e
	ld h,a			;7630
	ld (0de20h),hl		;7631   ; guarda la Y del sprite 8 en RAM y el byte siguiente (16 bits)
	ld (0de24h),hl		;7634   ; guarda la Y del sprite 9 en RAM y el byte siguiente (16 bits)
	ld a,028h		;7637
	ld (0de22h),a		;7639   ; guarda el patron del sprite 8 en RAM
	ld a,02ch		;763c
	ld (0de26h),a		;763e   ; guarda el patron del sprite 9 en RAM
	call 08c16h		;7641   ; estado_del_que_se_lleva: A = el estado del personaje que se lleva
	add a,a			;7644
	ld hl,0765bh		;7645
	call 04083h		;7648   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;764b
	ld de,0dc80h		;764c
	call llena_16		;764f   ; llena_16: 16 bytes de DE con A
	inc hl			;7652
	ld a,(hl)			;7653
llena_16:		; 16 bytes de DE con A
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


actores_de_cd00:		; los 9 actores de 0xCD00: su paso, movimiento, piezas y sprites
	ld ix,0cd00h		;7663   ; apunta a los 9 actores de la pantalla (0x80 bytes cada uno)
	ld b,009h		;7667
L_7669:
	push bc			;7669
	call despacha_actor_cd00		;766a   ; despacha_actor_cd00: despacha el tipo - 1 del actor con B = su paso
	ld a,(ix+000h)		;766d   ; lee el tipo del actor
	and a			;7670
	jr z,L_7682		;7671
	call 08367h		;7673   ; mueve_actor: si (ix+6): Y += velocidad Y y X += velocidad X (16 bits)
	call 08393h		;7676   ; acelera_actor: si (ix+0x0B): velocidades += aceleraciones
	call piezas_del_actor		;7679   ; piezas_del_actor: con 15: las piezas del actor de p15:B57E[tipo][(ix+0x10)]
	call coloca_piezas		;767c   ; coloca_piezas: con 15: la posicion de cada pieza (desplazamientos de p01:78E5)
	call actor_6_o_12		;767f   ; actor_6_o_12: los tipos 6 y 12 cerca del borde de abajo
L_7682:
	ld de,00080h		;7682
	add ix,de		;7685
	pop bc			;7687
	djnz L_7669		;7688
	ld ix,0cd00h		;768a   ; apunta a los 9 actores de la pantalla (0x80 bytes cada uno)
	ld b,009h		;768e
L_7690:
	push bc			;7690   ; los sprites de las piezas (p02:8AB8) de cada actor de 0xCD00
	push ix		;7691
	pop hl			;7693
	ld a,(hl)			;7694
	and a			;7695
	call nz,08ab8h		;7696   ; sprites_de_piezas: los atributos de cada pieza del actor en 0xDE28
	pop bc			;7699
	ld de,00080h		;769a
	add ix,de		;769d
	djnz L_7690		;769f
	ret			;76a1
despacha_actor_cd00:		; despacha el tipo - 1 del actor con B = su paso
	ld a,(ix+000h)		;76a2   ; lee el tipo del actor
	and a			;76a5
	ret z			;76a6
	ld b,(ix+001h)		;76a7   ; lee el paso del actor
	dec a			;76aa
	call 0408dh		;76ab   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

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


actor_6_o_12:		; los tipos 6 y 12 cerca del borde de abajo
	ld a,(ix+000h)		;76c8   ; lee el tipo del actor
	cp 006h		;76cb
	jr z,L_76D2		;76cd
	cp 00ch		;76cf
	ret nz			;76d1
L_76D2:
	ld a,(ix+003h)		;76d2   ; lee la Y del actor
	sub 0d7h		;76d5
	cp 020h		;76d7
	ret nc			;76d9
libera_piezas:		; libera en 0xCC80 las piezas (ix+0x20) del actor
	push ix		;76da
	pop de			;76dc
	ld a,(ix+020h)		;76dd   ; lee las piezas del actor (p02:8648)
	and a			;76e0
	jp z,083d6h		;76e1   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
	ld b,a			;76e4
	ld a,e			;76e5
	add a,021h		;76e6
	ld e,a			;76e8
L_76E9:
	ld hl,0cc80h		;76e9   ; apunta a las piezas de sprite ocupadas (22)
	ld a,(de)			;76ec
	call 04083h		;76ed   ; hl_mas_a: HL = HL + A
	ld (hl),000h		;76f0
	inc e			;76f2
	inc e			;76f3
	inc e			;76f4
	inc e			;76f5
	inc e			;76f6
	djnz L_76E9		;76f7
	jp 083d6h		;76f9   ; borra_actor: tipo 0, libera sus piezas y esconde sus sprites
piezas_del_actor:		; con 15: las piezas del actor de p15:B57E[tipo][(ix+0x10)]
	call 054a5h		;76fc   ; banco_15_en_a000: pone el banco 15 en 0xA000 (p00:54B9)
	push ix		;76ff
	pop de			;7701
	ld a,e			;7702
	or 024h		;7703
	ld e,a			;7705
	ld a,(ix+000h)		;7706   ; lee el tipo del actor
	ld hl,0b57eh		;7709
	call 0543ah		;770c   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,(ix+010h)		;770f   ; lee el fotograma del actor (p02:8A42)
	call 0543ah		;7712   ; palabra_a: HL = la palabra A de la tabla HL
	ld b,(hl)			;7715
	ld a,b			;7716
	and a			;7717
	jp z,05464h		;7718   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld (ix+020h),a		;771b   ; guarda las piezas del actor (p02:8648)
L_771E:
	inc hl			;771e   ; cada pieza: los dos bytes de la lista a (ix+0x24) + 4n
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
	jp 05464h		;772b   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
crea_enemigos_de_pantalla:		; fuera de la sala 5: el bloque 0x0D y los enemigos de p15:A4F9[fase][pantalla] en 0xCD00
	ld a,(0c20ah)		;772e   ; lee en la sala de la puerta 5
	and a			;7731
	ret nz			;7732
	call 054a5h		;7733   ; banco_15_en_a000: pone el banco 15 en 0xA000 (p00:54B9)
	ld ix,0d100h		;7736   ; apunta a el bloque que se mueve en curso
	ld a,(ix+000h)		;773a
	cp 00dh		;773d
	jr nz,L_774B		;773f
	push af			;7741
	ld a,00dh		;7742
	call 05396h		;7744   ; sprites_del_tipo: los patrones del tipo A de p15:ADDA a la VRAM (p00:4926)
	pop af			;7747
	call reserva_piezas		;7748   ; reserva_piezas: reserva en 0xCC80 las piezas del actor y copia sus dos bytes
L_774B:
	ld a,(0c211h)		;774b   ; lee la fase (1-25: ruina * 5 + puerta)
	ld hl,0a4f9h		;774e
	call 0543ah		;7751   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,(0c212h)		;7754   ; lee la pantalla de la fase (desde 1)
	dec a			;7757
	call 0543ah		;7758   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;775b
	ld a,(de)			;775c
	and a			;775d
	jp z,05464h		;775e   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	ld b,a			;7761
	ld ix,0cd00h		;7762   ; apunta a los 9 actores de la pantalla (0x80 bytes cada uno)
L_7766:
	inc de			;7766
	push bc			;7767
	call crea_enemigo		;7768   ; crea_enemigo: los patrones de su tipo y [tipo][Y][X] de la lista (p15:A4F9)
	ld bc,00080h		;776b
	add ix,bc		;776e
	pop bc			;7770
	djnz L_7766		;7771
	jp 05464h		;7773   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
crea_enemigo:		; los patrones de su tipo y [tipo][Y][X] de la lista (p15:A4F9)
	push bc			;7776
	push de			;7777
	push hl			;7778
	call 0538ch		;7779   ; sprites_del_enemigo: salvo los tipos 8, 9 y 10, los patrones del tipo A (p15:ADDA)
	pop hl			;777c
	pop de			;777d
	pop bc			;777e
	ld a,(de)			;777f
	ld c,a			;7780
	ld (ix+000h),a		;7781   ; guarda el tipo del actor
	cp 002h		;7784
	jr z,L_7792		;7786
	inc de			;7788
	ld a,(de)			;7789
	ld (ix+003h),a		;778a   ; guarda la Y del actor
	inc de			;778d
	ld a,(de)			;778e
	ld (ix+005h),a		;778f   ; guarda la X del actor
L_7792:
	push af			;7792
	push bc			;7793
	push de			;7794
	call piezas_salvo_8_9_10		;7795   ; piezas_salvo_8_9_10: las piezas del enemigo salvo los tipos 8, 9 y 10
	pop de			;7798
	pop bc			;7799
	pop af			;779a
	ld a,c			;779b
	dec a			;779c
	call 0408dh		;779d   ; despacha: salta a la palabra A de la tabla pegada detras del `call`

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


lee_ix17:		; (ix+0x17) = el siguiente byte de la lista
	inc de			;77b8
	ld a,(de)			;77b9
	ld (ix+017h),a		;77ba
L_77BD:
	ret			;77bd
L_77BE:
	inc de			;77be
	ld a,(de)			;77bf
	ld (ix+011h),a		;77c0   ; guarda la cuenta del actor (cuadros o lineas que quedan, segun el tipo; p02:847C, p02:9278)
	ret			;77c3
L_77C4:
	call lee_ix17		;77c4   ; lee_ix17: (ix+0x17) = el siguiente byte de la lista
lee_ix15:		; (ix+0x15) = el siguiente byte de la lista
	inc de			;77c7
	ld a,(de)			;77c8
	ld (ix+015h),a		;77c9
	ret			;77cc
L_77CD:
	call lee_ix17		;77cd   ; lee_ix17: (ix+0x17) = el siguiente byte de la lista
	inc de			;77d0
	ld a,(de)			;77d1
	ld (ix+014h),a		;77d2
	call lee_ix15		;77d5   ; lee_ix15: (ix+0x15) = el siguiente byte de la lista
	inc de			;77d8
	ld a,(de)			;77d9
	ld (ix+018h),a		;77da
	inc de			;77dd
	ld a,(de)			;77de
	ld (ix+019h),a		;77df
	ret			;77e2
L_77E3:
	exx			;77e3
	call hueco_del_enemigo		;77e4   ; hueco_del_enemigo: DE = la posicion del dibujo del enemigo segun su numero en 0xCD00
	ld h,(ix+005h)		;77e7   ; lee la X del actor
	ld a,(ix+003h)		;77ea   ; lee la Y del actor
	sub 008h		;77ed
	ld l,a			;77ef
	ld bc,01018h		;77f0
	ld a,004h		;77f3
	call 04bdeh		;77f5   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	exx			;77f8
dibujo_del_actor_78:		; copia 16 x 16 de (0x78, 0) con TIMP a la X e Y del actor
	exx			;77f9
	ld hl,00078h		;77fa
	ld d,(ix+005h)		;77fd   ; lee la X del actor
	ld e,(ix+003h)		;7800   ; lee la Y del actor
	ld bc,01010h		;7803
	ld a,048h		;7806
	call 04c73h		;7808   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	exx			;780b
	ret			;780c
hueco_del_enemigo:		; DE = la posicion del dibujo del enemigo segun su numero en 0xCD00
	push ix		;780d   ; el numero del actor ((IX - 0xCD00) / 0x80)
	pop hl			;780f
	or a			;7810
	ld de,0cd00h		;7811   ; apunta a los 9 actores de la pantalla (0x80 bytes cada uno)
	sbc hl,de		;7814
	rl l		;7816
	rl h		;7818
	ld a,h			;781a
	cp 005h		;781b   ; los 5 primeros van en la fila 0xE0; los demas, en la 0xF0
	ld d,0e0h		;781d
	jr c,L_7825		;781f
	ld d,0f0h		;7821
	sub 005h		;7823
L_7825:
	add a,a			;7825   ; su columna: numero * 24 + 0x58
	add a,a			;7826
	add a,a			;7827
	ld b,a			;7828
	add a,a			;7829
	add a,b			;782a
	add a,058h		;782b
	ld e,a			;782d
	ret			;782e
L_782F:
	call lee_ix17		;782f   ; lee_ix17: (ix+0x17) = el siguiente byte de la lista
dibujo_del_actor_y14:		; un dibujo en la X del actor y su Y - 0x14
	exx			;7832
	ld d,(ix+005h)		;7833   ; lee la X del actor
	ld e,(ix+003h)		;7836   ; lee la Y del actor
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
	call 04083h		;7848   ; hl_mas_a: HL = HL + A
	ld bc,0d200h		;784b   ; apunta a el mapa de 32 x 24 fichas de la pantalla
	add hl,bc			;784e
	ld b,008h		;784f
L_7851:
	ld (hl),001h		;7851
	inc hl			;7853
	djnz L_7851		;7854
	ld b,008h		;7856
	ld hl,0a858h		;7858
L_785B:
	push hl			;785b   ; 8 copias de 8 x 8 con la operacion 0x40 (de (0xA8, 0x58) a (D, E))
	push de			;785c
	push bc			;785d
	ld bc,00808h		;785e
	ld a,040h		;7861
	call 04c73h		;7863   ; copia_con_operacion: LMMM (0x90 | operacion): B x C de (H, L) a (D, E); A = paginas y operacion (0x48: TIMP)
	pop bc			;7866
	pop de			;7867
	pop hl			;7868
	ld a,d			;7869
	add a,008h		;786a
	ld d,a			;786c
	djnz L_785B		;786d
	exx			;786f
	ret			;7870
piezas_salvo_8_9_10:		; las piezas del enemigo salvo los tipos 8, 9 y 10
	ld a,c			;7871   ; los tipos 8, 9 y 10 no reservan piezas
	cp 00ah		;7872
	ret z			;7874
	cp 009h		;7875
	ret z			;7877
	cp 008h		;7878
	ret z			;787a
reserva_piezas:		; reserva en 0xCC80 las piezas del actor y copia sus dos bytes
	ld hl,0b57eh		;787b
	call 0543ah		;787e   ; palabra_a: HL = la palabra A de la tabla HL
	ld a,(ix+010h)		;7881   ; lee el fotograma del actor (p02:8A42)
	call 0543ah		;7884   ; palabra_a: HL = la palabra A de la tabla HL
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
	push hl			;7892   ; cada pieza: un hueco libre de 0xCC80 (p01:78A8)
	push bc			;7893
	call pieza_libre		;7894   ; pieza_libre: C = la primera pieza libre de 0xCC80 (22), marcada; acarreo si hay
	pop bc			;7897
	pop hl			;7898
	ret nc			;7899
	push bc			;789a
	ld (de),a			;789b   ; su numero en la ficha y sus dos bytes de la lista
	inc e			;789c
	inc e			;789d
	inc e			;789e
	ldi		;789f
	ldi		;78a1
	pop bc			;78a3
	djnz L_7892		;78a4
	scf			;78a6
	ret			;78a7
pieza_libre:		; C = la primera pieza libre de 0xCC80 (22), marcada; acarreo si hay
	ld hl,0cc80h		;78a8   ; apunta a las piezas de sprite ocupadas (22)
	ld bc,01600h		;78ab
L_78AE:
	ld a,(hl)			;78ae   ; el primer cero de 0xCC80; C es su numero
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
coloca_piezas:		; con 15: la posicion de cada pieza (desplazamientos de p01:78E5)
	call 054a5h		;78bd   ; banco_15_en_a000: pone el banco 15 en 0xA000 (p00:54B9)
	push ix		;78c0
	pop hl			;78c2
	ld a,(hl)			;78c3
	call desplazamientos_por_tipo		;78c4   ; desplazamientos_por_tipo: DE = la tabla de desplazamientos del tipo A (p15:B6D2-B6EE)
	set 5,l		;78c7
	ld a,(hl)			;78c9
	and a			;78ca
	jr z,L_78E2		;78cb
	ld b,a			;78cd
	inc l			;78ce
L_78CF:
	inc l			;78cf
	ld a,(de)			;78d0
	add a,(ix+003h)		;78d1   ; le suma la Y del actor
	ld (hl),a			;78d4
	inc l			;78d5
	inc de			;78d6
	ld a,(de)			;78d7
	add a,(ix+005h)		;78d8   ; le suma la X del actor
	ld (hl),a			;78db
	inc de			;78dc
	inc l			;78dd
	inc l			;78de
	inc l			;78df
	djnz L_78CF		;78e0
L_78E2:
	jp 05464h		;78e2   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
desplazamientos_por_tipo:		; DE = la tabla de desplazamientos del tipo A (p15:B6D2-B6EE)
	cp 007h		;78e5   ; la tabla de desplazamientos de las piezas: tipo 7 p15:B6EE, 4 p15:B6E6, 2 p15:B6D2, 8 p15:B6E2 y los demas p15:B6EA
	ld de,0b6eeh		;78e7   ; el tipo 7
	ret z			;78ea
	ld de,0b6e6h		;78eb   ; el tipo 4
	cp 004h		;78ee
	ret z			;78f0
	ld de,0b6d2h		;78f1   ; el tipo 2
	cp 002h		;78f4
	ret z			;78f6
	ld de,0b6e2h		;78f7   ; el tipo 8
	cp 008h		;78fa
	ret z			;78fc
	ld de,0b6eah		;78fd   ; los demas
	ret			;7900
borra_a_barras:		; borra la VRAM a barras: un byte cada 13 desde (0x24, 0x1A), con esperas
	ld hl,01a24h		;7901   ; borra la VRAM a barras: un byte cada 13, con esperas entre pasada y pasada
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
	xor a			;790f   ; un byte a cero cada 13 de la VRAM, de (0x24, 0x1A) en adelante
	call 048dch		;7910   ; escribe_vram: escribe A en la VRAM HL
	ld a,l			;7913
	add a,00dh		;7914
	ld l,a			;7916
	and 07fh		;7917
	cp d			;7919
	jr c,L_790F		;791a
	ld a,080h		;791c
	sub b			;791e
	call 04083h		;791f   ; hl_mas_a: HL = HL + A
	dec e			;7922
	jr nz,L_790F		;7923
	exx			;7925
	dec b			;7926
	exx			;7927
	ret z			;7928
	push de			;7929   ; entre pasada y pasada, una espera
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
objetos:		; los 8 objetos de 0xCB00 de la pantalla 0xC212
	ld hl,0cb00h		;7948   ; apunta a los objetos de la fase (0x20 bytes cada uno)
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
	ld a,(0c212h)		;7957   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;795a
	jr nz,L_796A		;795b
	push hl			;795d
	call paso_del_objeto		;795e   ; paso_del_objeto: el paso del objeto: cogerlo, caer, subir...
	pop hl			;7961
	push hl			;7962
	call sprites_del_objeto		;7963   ; sprites_del_objeto: los dos sprites del objeto, o escondidos si no es de esta pantalla
	pop hl			;7966
	call colores_del_objeto		;7967   ; colores_del_objeto: los colores del objeto (p02:8ABF)
L_796A:
	pop bc			;796a
	pop hl			;796b
	ld a,020h		;796c
	call 04083h		;796e   ; hl_mas_a: HL = HL + A
	djnz L_794D		;7971
	ret			;7973
sprites_del_objeto:		; los dos sprites del objeto, o escondidos si no es de esta pantalla
	ld a,(0c212h)		;7974   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;7977
	ld c,000h		;7978
	jr z,L_797D		;797a
	inc c			;797c
L_797D:
	ld d,h			;797d   ; los dos sprites del objeto en (HL + 0x10)
	ld a,l			;797e
	add a,010h		;797f
	ld e,a			;7981
	inc l			;7982
	inc l			;7983
	ld b,002h		;7984
L_7986:
	ld a,c			;7986   ; si no es de esta pantalla, Y = 0xE0 (escondido)
	and a			;7987
	ld a,0e0h		;7988
	jr nz,L_798F		;798a
	ld a,(hl)			;798c   ; si lo es, su Y - 0x10 y su X - 8
	sub 010h		;798d
L_798F:
	ld (de),a			;798f   ; la Y del sprite
	inc l			;7990
	inc l			;7991
	inc e			;7992
	ld a,(hl)			;7993   ; la X del objeto - 8
	sub 008h		;7994
	ld (de),a			;7996
	dec l			;7997
	dec l			;7998
	inc e			;7999
	inc e			;799a
	inc e			;799b
	inc e			;799c
	djnz L_7986		;799d   ; el segundo sprite, 8 mas a la derecha
	ret			;799f
colores_del_objeto:		; los colores del objeto (p02:8ABF)
	ld a,l			;79a0
	add a,00fh		;79a1
	ld l,a			;79a3
	ld b,002h		;79a4
	jp 08abfh		;79a6   ; sprites_de_las_piezas: cada pieza de HL: Y, X y patron a su hueco de 0xDE28 y su color (p02:8AB8 sin contar)
objetos_de_la_fase:		; borra 0xCB00 y pone los objetos de la fase de p12:BF59[0xC211]
	ld hl,0cb00h		;79a9   ; apunta a los objetos de la fase (0x20 bytes cada uno)
	ld bc,000ffh		;79ac
	call 05f08h		;79af   ; borra: pone a cero BC + 1 bytes desde HL
	call 054aah		;79b2   ; banco_12_en_a000: pone el banco 12 en 0xA000
	ld a,(0c211h)		;79b5   ; lee la fase (1-25: ruina * 5 + puerta)
	ld hl,0bf59h		;79b8
	call 0543ah		;79bb   ; palabra_a: HL = la palabra A de la tabla HL
	ex de,hl			;79be
	ld hl,0cb00h		;79bf   ; apunta a los objetos de la fase (0x20 bytes cada uno)
L_79C2:
	ld a,(de)			;79c2   ; cada registro de la lista hasta 0xFF: [pantalla][Y][X]
	inc a			;79c3
	jp z,05464h		;79c4   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	push hl			;79c7
	ld (hl),001h		;79c8   ; a la ficha: 1, la pantalla, 0, la Y, 0 y la X
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
	ld a,020h		;79db   ; el siguiente objeto, 0x20 bytes mas alla
	call 04083h		;79dd   ; hl_mas_a: HL = HL + A
	jr L_79C2		;79e0
objetos_sin_coger:		; los 8 objetos de 0xCB00 de esta pantalla que no se han cogido
	ld hl,0cb00h		;79e2   ; apunta a los objetos de la fase (0x20 bytes cada uno)
	ld b,008h		;79e5
L_79E7:
	push hl			;79e7   ; los objetos de esta pantalla que no se han cogido (0xFF)
	push bc			;79e8
	ld a,(hl)			;79e9
	and a			;79ea
	jr z,L_7A40		;79eb
	inc l			;79ed
	ld a,(0c212h)		;79ee   ; lee la pantalla de la fase (desde 1)
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
	ld a,(hl)			;79ff   ; la Y no baja de 0x20 ni pasa de 0xE0
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
	call objeto_baja		;7a10   ; objeto_baja: con acarreo de p01:704C debajo, la Y del objeto + 16 o - 16
	pop hl			;7a13
	ld a,(hl)			;7a14
	and a			;7a15
	jr z,L_7A3C		;7a16
	cp 006h		;7a18
	jr z,L_7A21		;7a1a
	call objeto_vuelve		;7a1c   ; objeto_vuelve: el objeto vuelve a su sitio
	jr L_7A40		;7a1f
L_7A21:
	ld (hl),000h		;7a21
	inc l			;7a23
L_7A24:
	push hl			;7a24   ; el objeto baja hasta que encuentra suelo (p01:704C) o se sale (0xE0)
	ld e,(hl)			;7a25
	inc l			;7a26
	inc l			;7a27
	ld d,(hl)			;7a28
	call compara_ficha		;7a29   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
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
	call tapa_casillas		;7a3d   ; tapa_casillas: guarda las 2 x 2 casillas del objeto y las marca con 1
L_7A40:
	pop bc			;7a40
	pop hl			;7a41
	ld a,020h		;7a42
	call 04083h		;7a44   ; hl_mas_a: HL = HL + A
	djnz L_79E7		;7a47
	ld hl,0cb00h		;7a49   ; apunta a los objetos de la fase (0x20 bytes cada uno)
	ld b,008h		;7a4c
L_7A4E:
	push hl			;7a4e   ; los objetos con la Y a 0xFF (sin colocar): desde 0x24 hacia abajo hasta el suelo
	push bc			;7a4f
	ld a,(hl)			;7a50
	and a			;7a51
	jr z,L_7A74		;7a52
	inc l			;7a54
	ld a,(0c212h)		;7a55   ; lee la pantalla de la fase (desde 1)
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
	call compara_ficha		;7a68   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop hl			;7a6b
	jr c,L_7A71		;7a6c
	inc (hl)			;7a6e
	jr L_7A63		;7a6f
L_7A71:
	call tapa_casillas		;7a71   ; tapa_casillas: guarda las 2 x 2 casillas del objeto y las marca con 1
L_7A74:
	pop bc			;7a74
	pop hl			;7a75
	ld a,020h		;7a76
	call 04083h		;7a78   ; hl_mas_a: HL = HL + A
	djnz L_7A4E		;7a7b
	ld hl,0cb00h		;7a7d   ; apunta a los objetos de la fase (0x20 bytes cada uno)
	ld de,0cb03h		;7a80
	ld b,008h		;7a83
L_7A85:
	push hl			;7a85   ; dos piezas de sprite por objeto de esta pantalla: patrones 0xF8 y 0xFC, colores 0x0D y 0x4E
	push bc			;7a86
	ld a,(hl)			;7a87   ; cada objeto vivo de la pantalla
	and a			;7a88
	jr z,L_7ACD		;7a89
	inc l			;7a8b
	ld a,(0c212h)		;7a8c   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;7a8f
	jr nz,L_7ACD		;7a90
	push hl			;7a92
	push de			;7a93
	call pieza_libre		;7a94   ; una pieza libre para el primer sprite del objeto
	pop de			;7a97
	pop hl			;7a98
	ld a,l			;7a99
	add a,00fh		;7a9a
	ld l,a			;7a9c
	ld (hl),c			;7a9d
	inc l			;7a9e
	ld a,(de)			;7a9f   ; su Y - 0x10 y su X - 8; patron 0xF8 y color 0x0D
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
	call pieza_libre		;7ab3   ; otra pieza para el segundo: patron 0xFC y color 0x4E
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
	call 04083h		;7ad1   ; hl_mas_a: HL = HL + A
	djnz L_7A85		;7ad4
	ret			;7ad6
objeto_baja:		; con acarreo de p01:704C debajo, la Y del objeto + 16 o - 16
	ld a,(hl)			;7ad7   ; el tipo 6 no cae
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
	call compara_ficha		;7ae4   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop hl			;7ae7
	ret nc			;7ae8
	ld a,(hl)			;7ae9   ; la Y sube o baja 16 segun su signo
	rla			;7aea
	ld a,0f0h		;7aeb
	jr c,L_7AF1		;7aed
	ld a,010h		;7aef
L_7AF1:
	add a,(hl)			;7af1
	ld (hl),a			;7af2
	ret			;7af3
objeto_vuelve:		; el objeto vuelve a su sitio
	ld (hl),000h		;7af4   ; el objeto vuelve: tipo a cero y la posicion guardada
	inc l			;7af6   ; la posicion de origen (bytes 4 y 5) vuelve a ser la de ahora
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
paso_del_objeto:		; el paso del objeto: cogerlo, caer, subir...
	inc l			;7b02   ; el paso del objeto: 1 esperar a que el personaje lo empuje
	ld c,l			;7b03
	ld b,(hl)			;7b04
	djnz L_7B21		;7b05
	push hl			;7b07
	push bc			;7b08
	call personaje_junto_al_objeto		;7b09   ; personaje_junto_al_objeto: acarreo si el personaje esta a su altura, al lado, mirandolo y con izquierda o derecha (0xC007 & 0x0C)
	pop bc			;7b0c
	pop hl			;7b0d
	jr nc,L_7B36		;7b0e
	dec (ix+007h)		;7b10   ; (ix+7) cuenta los cuadros que se empuja
	ret nz			;7b13
	inc (hl)			;7b14   ; al acabar, el paso siguiente con la posicion de destino
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
	djnz L_7B3A		;7b21   ; paso 2: lo suelta; segun (ix+8), paso 3 o 4 y el sonido 7
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
	jp 056e3h		;7b33   ; sonido: el sonido A: 0 para, 0xFD-0xFF especiales, >= 0x80 musica, 0x40-0x6F, 0x70-0x7F, si no efecto
L_7B36:
	ld l,c			;7b36
	ld (hl),000h		;7b37
	ret			;7b39
L_7B3A:
	djnz L_7B5F		;7b3a   ; paso 3: va hacia la izquierda (X - 1) mientras dura la cuenta
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
	ld a,(hl)			;7b46   ; si llega al borde (X < 9): sale a la pantalla de la izquierda (0xC21A) por el otro lado (X = 0xE8)
	cp 009h		;7b47
	jr nc,L_7B5B		;7b49
	ld (hl),0e8h		;7b4b
	ld l,c			;7b4d
	push hl			;7b4e
	call destapa_casillas_mas		;7b4f   ; destapa_casillas_mas: p01:7C7F con L + 1
	pop hl			;7b52
	ld (hl),000h		;7b53
	dec l			;7b55
	ld a,(0c21ah)		;7b56   ; lee la vecina de la izquierda
	ld (hl),a			;7b59
	ret			;7b5a
L_7B5B:
	ld l,c			;7b5b
	ld (hl),005h		;7b5c
	ret			;7b5e
L_7B5F:
	djnz L_7B80		;7b5f   ; paso 4: lo mismo hacia la derecha
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
	ld a,(hl)			;7b6b   ; si pasa de 0xF8: sale a la pantalla de la derecha (0xC21B) con X = 0x18
	cp 0f8h		;7b6c
	jr c,L_7B5B		;7b6e
	ld (hl),018h		;7b70
	ld l,c			;7b72
	push hl			;7b73
	call destapa_casillas_mas		;7b74   ; destapa_casillas_mas: p01:7C7F con L + 1
	pop hl			;7b77
	ld (hl),000h		;7b78
	dec l			;7b7a
	ld a,(0c21bh)		;7b7b   ; lee la vecina de la derecha
	ld (hl),a			;7b7e
	ret			;7b7f
L_7B80:
	djnz L_7B8B		;7b80
	call fichas_debajo		;7b82   ; fichas_debajo: p01:704C en las dos casillas debajo del objeto (D - 4 y D + 4)
	jr c,L_7BB3		;7b85
	inc (hl)			;7b87
	jp destapa_casillas_mas		;7b88   ; destapa_casillas_mas: p01:7C7F con L + 1
L_7B8B:
	djnz L_7BBE		;7b8b   ; paso 5: cae de 8 en 8
	inc l			;7b8d
	ld a,(hl)			;7b8e
	add a,008h		;7b8f
	ld (hl),a			;7b91
	cp 0d8h		;7b92   ; al llegar abajo (0xD8): a la pantalla de abajo (0xC219), si la hay; si no, se pierde
	jr c,L_7BAE		;7b94
	ld a,(0c219h)		;7b96   ; lee la vecina de abajo
	inc a			;7b99
	jp nz,L_7BA3		;7b9a
	ld l,c			;7b9d
	dec l			;7b9e
	dec l			;7b9f
	ld (hl),000h		;7ba0
	ret			;7ba2
L_7BA3:
	dec a			;7ba3   ; en la pantalla de abajo, sin colocar (0xFF): la buscara p01:7A4E
	ld l,c			;7ba4
	dec l			;7ba5
	ld (hl),a			;7ba6
	inc l			;7ba7
	inc l			;7ba8
	ld (hl),0ffh		;7ba9
	jp L_7B36		;7bab
L_7BAE:
	dec l			;7bae
	call fichas_debajo		;7baf   ; fichas_debajo: p01:704C en las dos casillas debajo del objeto (D - 4 y D + 4)
	ret nc			;7bb2
L_7BB3:
	ld (hl),000h		;7bb3
	push hl			;7bb5
	call destapa_casillas_mas		;7bb6   ; destapa_casillas_mas: p01:7C7F con L + 1
	pop hl			;7bb9
	inc l			;7bba
	jp tapa_casillas		;7bbb   ; tapa_casillas: guarda las 2 x 2 casillas del objeto y las marca con 1
L_7BBE:
	call fichas_debajo		;7bbe   ; fichas_debajo: p01:704C en las dos casillas debajo del objeto (D - 4 y D + 4)
	jr c,L_7BC8		;7bc1
	ld (hl),006h		;7bc3
	call destapa_casillas		;7bc5   ; destapa_casillas: devuelve las 2 x 2 casillas guardadas del objeto
L_7BC8:
	push hl			;7bc8
	push bc			;7bc9
	call personaje_junto_al_objeto		;7bca   ; personaje_junto_al_objeto: acarreo si el personaje esta a su altura, al lado, mirandolo y con izquierda o derecha (0xC007 & 0x0C)
	pop bc			;7bcd
	pop hl			;7bce
	ret nc			;7bcf
	ld b,006h		;7bd0
	push hl			;7bd2
	call 047edh		;7bd3   ; byte_del_personaje: A = el byte B de la ficha del personaje que se lleva (0xC2B0 + 0xC240 * 32)
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
personaje_junto_al_objeto:		; acarreo si el personaje esta a su altura, al lado, mirandolo y con izquierda o derecha (0xC007 & 0x0C)
	ld (ix+008h),000h		;7beb
	inc l			;7bef
	ld e,(hl)			;7bf0
	ld a,(0c244h)		;7bf1   ; lee la Y del personaje
	add a,002h		;7bf4
	sub (hl)			;7bf6
	cp 004h		;7bf7
	ret nc			;7bf9
	ld a,(0c250h)		;7bfa   ; lee el sentido del personaje
	ld c,a			;7bfd
	inc l			;7bfe
	inc l			;7bff
	ld d,(hl)			;7c00
	ld a,(0c246h)		;7c01   ; lee la X del personaje
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
	ld a,b			;7c0f   ; a menos de 0x13 en X del objeto
	sub (hl)			;7c10
	add a,013h		;7c11
	cp 026h		;7c13
	ret nc			;7c15
	ld a,(0c007h)		;7c16   ; y con izquierda o derecha pulsada
	and 00ch		;7c19
	ret z			;7c1b
	ld a,b			;7c1c   ; empuja hacia la derecha (1) o hacia la izquierda (2)
	cp (hl)			;7c1d
	ld a,001h		;7c1e
	jr nc,L_7C23		;7c20
	inc a			;7c22
L_7C23:
	inc l			;7c23   ; el sentido en el byte 3 del objeto
	inc l			;7c24
	inc l			;7c25
	ld (hl),a			;7c26
	ld a,e			;7c27   ; la casilla de delante: X + 0x0A o X - 0x0A
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
	call compara_ficha		;7c3a   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	ccf			;7c3d
	ret			;7c3e
casilla_menos_41:		; p01:7C42 con DE = 0x41
	ld de,00041h		;7c3f
casilla:		; DE = 0xD200 + la casilla de (B = X, C = Y) - DE
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
	call 04083h		;7c54   ; hl_mas_a: HL = HL + A
	ld de,0d200h		;7c57   ; apunta a el mapa de 32 x 24 fichas de la pantalla
	add hl,de			;7c5a
	ex de,hl			;7c5b
	ret			;7c5c
tapa_casillas:		; guarda las 2 x 2 casillas del objeto y las marca con 1
	push hl			;7c5d
	ld c,(hl)			;7c5e
	inc l			;7c5f
	inc l			;7c60
	ld b,(hl)			;7c61
	call casilla_menos_41		;7c62   ; casilla_menos_41: p01:7C42 con DE = 0x41
	pop bc			;7c65
	ld a,c			;7c66
	add a,017h		;7c67
	ld c,a			;7c69
	ex de,hl			;7c6a
	call guarda_dos_casillas		;7c6b   ; guarda_dos_casillas: copia dos casillas a (BC) y las pone a 1
	inc c			;7c6e
	ld de,0001fh		;7c6f
	add hl,de			;7c72
guarda_dos_casillas:		; copia dos casillas a (BC) y las pone a 1
	ld a,(hl)			;7c73   ; la casilla a (BC) y se pone a 1 (ocupada)
	ld (bc),a			;7c74
	ld (hl),001h		;7c75
	inc l			;7c77
	inc c			;7c78
	ld a,(hl)			;7c79
	ld (bc),a			;7c7a
	ld (hl),001h		;7c7b
	ret			;7c7d
destapa_casillas_mas:		; p01:7C7F con L + 1
	inc l			;7c7e
destapa_casillas:		; devuelve las 2 x 2 casillas guardadas del objeto
	inc l			;7c7f
	ld c,(hl)			;7c80
	inc l			;7c81
	inc l			;7c82
	ld b,(hl)			;7c83
	call casilla_menos_41		;7c84   ; casilla_menos_41: p01:7C42 con DE = 0x41
	push ix		;7c87
	pop bc			;7c89
	ld a,c			;7c8a
	add a,01ah		;7c8b
	ld c,a			;7c8d
	ex de,hl			;7c8e
	call devuelve_dos_casillas		;7c8f   ; devuelve_dos_casillas: copia dos casillas de (BC) a (HL)
	inc c			;7c92
	ld de,0001fh		;7c93
	add hl,de			;7c96
devuelve_dos_casillas:		; copia dos casillas de (BC) a (HL)
	ld a,(bc)			;7c97   ; las dos casillas guardadas vuelven al mapa
	ld (hl),a			;7c98
	inc l			;7c99
	inc c			;7c9a
	ld a,(bc)			;7c9b
	ld (hl),a			;7c9c
	ret			;7c9d
fichas_debajo:		; p01:704C en las dos casillas debajo del objeto (D - 4 y D + 4)
	push hl			;7c9e   ; la casilla de la Y y la X - 4 del objeto
	inc l			;7c9f
	ld e,(hl)			;7ca0
	inc l			;7ca1
	inc l			;7ca2
	ld a,(hl)			;7ca3
	sub 004h		;7ca4
	ld d,a			;7ca6
	pop hl			;7ca7
	call compara_ficha_guardando		;7ca8   ; compara_ficha_guardando: p01:704C sin tocar BC, DE ni HL
	ret c			;7cab
	ld a,d			;7cac   ; y la de X + 4
	add a,008h		;7cad
	ld d,a			;7caf
compara_ficha_guardando:		; p01:704C sin tocar BC, DE ni HL
	push bc			;7cb0
	push de			;7cb1
	push hl			;7cb2
	call compara_ficha		;7cb3   ; compara_ficha: acarreo si la ficha de (D, E + 4) (p01:7176) menos 1 es menor que 0xC222
	pop hl			;7cb6
	pop de			;7cb7
	pop bc			;7cb8
	ret			;7cb9
busca_puerta_de_salida:		; con 9: la puerta de salida de la fase (p09:BF35[0xC211]) a 0xD510
	call 054afh		;7cba   ; banco_9_en_a000: pone el banco 9 en 0xA000
	ld de,0d510h		;7cbd   ; apunta a la puerta de salida de la fase
	ld hl,0bf35h		;7cc0
	ld a,(0c211h)		;7cc3   ; lee la fase (1-25: ruina * 5 + puerta)
	add a,a			;7cc6
	call 04083h		;7cc7   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;7cca
	and a			;7ccb
	jp z,05464h		;7ccc   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
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
	jp 05464h		;7cea   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
pinta_puerta_de_salida:		; si la puerta de salida (0xD510) esta en esta pantalla, su dibujo
	ld hl,0d510h		;7ced   ; apunta a la puerta de salida de la fase
	ld a,(hl)			;7cf0
	dec a			;7cf1
	ret nz			;7cf2
	inc l			;7cf3
	ld a,(0c212h)		;7cf4   ; lee la pantalla de la fase (desde 1)
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
	call 04bdeh		;7d07   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop hl			;7d0a
	push hl			;7d0b
	ld e,(hl)			;7d0c
	inc l			;7d0d
	ld d,(hl)			;7d0e
	ld hl,03088h		;7d0f
	ld bc,01030h		;7d12
	call 04841h		;7d15   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	pop hl			;7d18
	ld c,001h		;7d19
L_7D1B:
	push bc			;7d1b
	ld c,(hl)			;7d1c
	inc l			;7d1d
	ld b,(hl)			;7d1e
	ld de,00000h		;7d1f
	call casilla		;7d22   ; casilla: DE = 0xD200 + la casilla de (B = X, C = Y) - DE
	pop bc			;7d25
	ex de,hl			;7d26
	ld b,006h		;7d27
L_7D29:
	ld (hl),c			;7d29
	inc l			;7d2a
	ld (hl),c			;7d2b
	ld a,01fh		;7d2c
	call 04083h		;7d2e   ; hl_mas_a: HL = HL + A
	djnz L_7D29		;7d31
	ret			;7d33
puerta_de_salida:		; la puerta de salida de la fase (0xD510)
	ld hl,0d510h		;7d34   ; apunta a la puerta de salida de la fase
	ld a,(hl)			;7d37
	and a			;7d38
	ret z			;7d39
	dec a			;7d3a
	jr z,L_7D3F		;7d3b
	jr L_7D8C		;7d3d
L_7D3F:
	push hl			;7d3f
	ld b,006h		;7d40
	call 047edh		;7d42   ; byte_del_personaje: A = el byte B de la ficha del personaje que se lleva (0xC2B0 + 0xC240 * 32)
	ld c,a			;7d45
	ld a,(0cc10h)		;7d46   ; lee la pantalla de la antesala (0-2)
	add a,a			;7d49
	ld b,a			;7d4a
	ld a,(0cc13h)		;7d4b   ; lee la X en la antesala
	rla			;7d4e
	jr nc,L_7D52		;7d4f
	inc b			;7d51
L_7D52:
	ld a,b			;7d52
	ld hl,07dadh		;7d53
	call 04083h		;7d56   ; hl_mas_a: HL = HL + A
	ld a,(hl)			;7d59
	cp c			;7d5a
	pop hl			;7d5b
	ret nz			;7d5c
	inc l			;7d5d
	ld a,(0c212h)		;7d5e   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;7d61
	ret nz			;7d62
	ld a,(0c24bh)		;7d63   ; lee la accion del personaje (4 muere, 5 escalera)
	and a			;7d66
	ret nz			;7d67
	inc l			;7d68
	ld a,(0c244h)		;7d69   ; lee la Y del personaje
	sub (hl)			;7d6c
	cp 030h		;7d6d
	ret nc			;7d6f
	inc l			;7d70
	ld a,(0c246h)		;7d71   ; lee la X del personaje
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
	ld hl,0d510h		;7d87   ; apunta a la puerta de salida de la fase
	inc (hl)			;7d8a
	ret			;7d8b
L_7D8C:
	inc l			;7d8c   ; la puerta se abre: copia filas de 16 desde (0x60, 0xB0)
	inc l			;7d8d
	ld e,(hl)			;7d8e
	inc l			;7d8f
	ld d,(hl)			;7d90
	inc l			;7d91
	push hl			;7d92
	ld c,(hl)			;7d93
	ld hl,0b060h		;7d94
	ld b,010h		;7d97
	call 04841h		;7d99   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	pop hl			;7d9c
	inc (hl)			;7d9d   ; hasta 0x30 lineas; luego, a cero y sus casillas libres (p01:7D1B)
	ld a,(hl)			;7d9e
	cp 030h		;7d9f
	ret c			;7da1
	ld hl,0d510h		;7da2   ; apunta a la puerta de salida de la fase
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


entrada_de_la_fase:		; en la primera pantalla y fuera de la sala 5: la posicion de entrada (p01:7DEF)
	ld a,(0c20ah)		;7db1   ; lee en la sala de la puerta 5
	and a			;7db4
	ret nz			;7db5
	ld a,(0c212h)		;7db6   ; lee la pantalla de la fase (desde 1)
	dec a			;7db9
	ret nz			;7dba
	call posicion_de_entrada		;7dbb   ; posicion_de_entrada: con 9: (H, L) = el lado y la Y de entrada de p09:BF1D[0xC211]
	push hl			;7dbe
	ld de,0b060h		;7dbf
	ld bc,00830h		;7dc2
	ld a,004h		;7dc5
	call 04bdeh		;7dc7   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop de			;7dca
	push de			;7dcb
	ld b,006h		;7dcc
L_7DCE:
	ld a,093h		;7dce
	call 04d86h		;7dd0   ; caracter_de_la_fuente: el caracter A de la fuente de la pagina 1 a (D, E) (HMMM)
	ld a,e			;7dd3
	add a,008h		;7dd4
	ld e,a			;7dd6
	djnz L_7DCE		;7dd7
	pop bc			;7dd9
	ld h,001h		;7dda
	push hl			;7ddc
	ld de,00000h		;7ddd
	call casilla		;7de0   ; casilla: DE = 0xD200 + la casilla de (B = X, C = Y) - DE
	pop hl			;7de3
	ld b,006h		;7de4
L_7DE6:
	ld a,h			;7de6
	ld (de),a			;7de7
	ld a,020h		;7de8
	call 04088h		;7dea   ; de_mas_a: DE = DE + A
	djnz L_7DE6		;7ded
	ret			;7def
posicion_de_entrada:		; con 9: (H, L) = el lado y la Y de entrada de p09:BF1D[0xC211]
	call 054afh		;7df0   ; banco_9_en_a000: pone el banco 9 en 0xA000
	ld hl,0bf1dh		;7df3
	ld a,(0c211h)		;7df6   ; lee la fase (1-25: ruina * 5 + puerta)
	call 04083h		;7df9   ; hl_mas_a: HL = HL + A
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
	jp 05464h		;7e0f   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
sale_por_la_entrada:		; en la pantalla 1, junto a la entrada y pulsando hacia fuera: 0xC215 = 3 o 4
	ld a,(0c20ah)		;7e12   ; lee en la sala de la puerta 5
	and a			;7e15
	ret nz			;7e16
	ld a,(0c212h)		;7e17   ; lee la pantalla de la fase (desde 1)
	dec a			;7e1a
	ret nz			;7e1b
	ld a,(0c24bh)		;7e1c   ; lee la accion del personaje (4 muere, 5 escalera)
	and a			;7e1f
	ret nz			;7e20
	call posicion_de_entrada		;7e21   ; posicion_de_entrada: con 9: (H, L) = el lado y la Y de entrada de p09:BF1D[0xC211]
	ld a,(0c244h)		;7e24   ; lee la Y del personaje
	sub l			;7e27
	cp 030h		;7e28
	ret nc			;7e2a
	ld a,(0c007h)		;7e2b   ; lee las teclas que hay
	ld b,a			;7e2e
	ld a,h			;7e2f
	and a			;7e30
	ld a,(0c246h)		;7e31   ; lee la X del personaje
	jr nz,L_7E41		;7e34
	cp 014h		;7e36
	ret nc			;7e38
	ld a,b			;7e39
	and 004h		;7e3a
	ret z			;7e3c
	ld a,003h		;7e3d
	jr L_7E4A		;7e3f
L_7E41:
	cp 0ech		;7e41   ; por la derecha: X >= 0xEC y la tecla derecha (bit 3)
	ret c			;7e43
	ld a,b			;7e44
	and 008h		;7e45
	ret z			;7e47
	ld a,004h		;7e48   ; sale por la derecha (lado 4)
L_7E4A:
	ld (0c215h),a		;7e4a   ; guarda el lado por el que se sale (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld bc,03001h		;7e4d
	ex de,hl			;7e50
	ld hl,0b060h		;7e51
L_7E54:
	push bc			;7e54
	ld b,008h		;7e55
	push hl			;7e57
	push de			;7e58
	push bc			;7e59
	call 04841h		;7e5a   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	pop bc			;7e5d
	pop de			;7e5e
	pop hl			;7e5f
	ld b,040h		;7e60
L_7E62:
	push bc			;7e62
	ld b,000h		;7e63
L_7E65:
	djnz L_7E65		;7e65   ; espera entre linea y linea
	pop bc			;7e67
	djnz L_7E62		;7e68
	pop bc			;7e6a
	inc c			;7e6b
	djnz L_7E54		;7e6c
	ret			;7e6e
bloque_que_baja:		; el bloque de (ix+0x16) que baja o sube con (ix+0x1B)
	ld a,(ix+01bh)		;7e6f   ; (ix+0x1B): el bloque baja; (ix+0x16) cuantas lineas le quedan
	and a			;7e72
	jr z,L_7E97		;7e73
	ld a,(ix+016h)		;7e75
	and a			;7e78
	ret z			;7e79
	inc (ix+003h)		;7e7a   ; baja una linea
	dec (ix+016h)		;7e7d
	push ix		;7e80
	pop hl			;7e82
	rr l		;7e83   ; las fichas impares no se dibujan
	ret c			;7e85
	ld h,0c0h		;7e86   ; copia la linea de la pagina 1 a su sitio
	ld a,060h		;7e88
	add a,(ix+016h)		;7e8a
	ld l,a			;7e8d
	ld a,(ix+018h)		;7e8e
	add a,(ix+016h)		;7e91
	ld e,a			;7e94
	jr L_7EC7		;7e95
L_7E97:
	ld a,(ix+016h)		;7e97   ; si no, sube: una linea cada 0x3C cuadros hasta 0x30
	cp 030h		;7e9a
	ret nc			;7e9c
	inc (ix+011h)		;7e9d   ; sube una linea cada 0x3C cuadros ((ix+0x11) cuenta)
	ld a,(ix+011h)		;7ea0
	cp 03ch		;7ea3
	ret c			;7ea5
	ld (ix+011h),000h		;7ea6
	dec (ix+003h)		;7eaa   ; la Y - 1 y una linea mas ocupada
	inc (ix+016h)		;7ead
	push ix		;7eb0
	pop hl			;7eb2
	rr l		;7eb3
	ret c			;7eb5
	ld h,040h		;7eb6   ; la linea que deja al subir
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
	call 04841h		;7ecd   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
L_7ED0:
	ld c,(ix+018h)		;7ed0   ; la casilla de la esquina del bloque en 0xD200
	ld b,(ix+019h)		;7ed3
	ld de,00000h		;7ed6
	call casilla		;7ed9   ; casilla: DE = 0xD200 + la casilla de (B = X, C = Y) - DE
	ld a,(ix+016h)		;7edc   ; cuantas filas de 8 ocupa ya ((ix+0x16) / 8)
	and 0f8h		;7edf
	rrca			;7ee1
	rrca			;7ee2
	rrca			;7ee3
	ld c,a			;7ee4
	ld b,006h		;7ee5
L_7EE7:
	ld a,b			;7ee7   ; las 6 filas: 1 (solida) las que ocupa, 0 las demas
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
	call 04088h		;7ef7   ; de_mas_a: DE = DE + A
	djnz L_7EE7		;7efa
	ret			;7efc
bloques_d180:		; los 2 bloques de 0xD180 de la pantalla
	ld hl,0d180h		;7efd   ; apunta a los 2 bloques que se mueven (0x40 cada uno)
	ld ix,0d181h		;7f00
	ld b,002h		;7f04
L_7F06:
	push hl			;7f06
	push bc			;7f07
	ld a,(0c212h)		;7f08   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;7f0b
	jr z,L_7F15		;7f0c
	inc l			;7f0e
	ld a,(hl)			;7f0f
	cp 00dh		;7f10
	call z,bloque_que_baja		;7f12   ; bloque_que_baja: el bloque de (ix+0x16) que baja o sube con (ix+0x1B)
L_7F15:
	pop bc			;7f15
	pop hl			;7f16
	ld a,040h		;7f17
	call 04083h		;7f19   ; hl_mas_a: HL = HL + A
	djnz L_7F06		;7f1c
	ret			;7f1e
bloques_de_la_fase:		; borra 0xD180 y pone los 2 bloques que se mueven de la fase (p12:B591[0xC211])
	ld hl,0d180h		;7f1f   ; apunta a los 2 bloques que se mueven (0x40 cada uno)
	ld bc,0007fh		;7f22
	call 05f08h		;7f25   ; borra: pone a cero BC + 1 bytes desde HL
	call 054aah		;7f28   ; banco_12_en_a000: pone el banco 12 en 0xA000
	ld de,0d180h		;7f2b   ; apunta a los 2 bloques que se mueven (0x40 cada uno)
	ld a,(0c211h)		;7f2e   ; lee la fase (1-25: ruina * 5 + puerta)
	ld hl,0b591h		;7f31
	call 0543ah		;7f34   ; palabra_a: HL = la palabra A de la tabla HL
L_7F37:
	ld a,(hl)			;7f37   ; cada registro de la lista hasta 0xFF: [pantalla][YX][YX]
	inc a			;7f38
	jp z,05464h		;7f39   ; bancos_1_2_3: pone los bancos 1-2-3 y su copia en 0xF0F1-0xF0F3
	push de			;7f3c
	ld a,(hl)			;7f3d   ; la pantalla, el tipo 0x0D (bloque que se mueve)
	ld (de),a			;7f3e
	inc e			;7f3f
	ld a,00dh		;7f40
	ld (de),a			;7f42
	inc e			;7f43
	inc e			;7f44
	inc e			;7f45
	inc hl			;7f46
	ld a,(hl)			;7f47   ; la primera posicion: Y = nibble alto + 0x14, X = nibble bajo * 16 + 8
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
	ld a,030h		;7f5d   ; (ix+0x16) = 0x30: cuantas lineas tiene
	ld (de),a			;7f5f
	inc e			;7f60
	inc e			;7f61
	inc hl			;7f62
	ld a,(hl)			;7f63   ; la segunda posicion, igual: a donde va
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
	ld a,040h		;7f74   ; el siguiente bloque, 0x40 bytes mas alla
	call 04088h		;7f76   ; de_mas_a: DE = DE + A
	jr L_7F37		;7f79
bloque_de_pantalla:		; el bloque de 0xD180 de esta pantalla, si lo hay
	ld hl,0d180h		;7f7b   ; apunta a los 2 bloques que se mueven (0x40 cada uno)
	ld bc,00200h		;7f7e
L_7F81:
	ld a,(0c212h)		;7f81   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;7f84
	jr z,L_7F90		;7f85
	inc c			;7f87
	ld a,040h		;7f88
	call 04083h		;7f8a   ; hl_mas_a: HL = HL + A
	djnz L_7F81		;7f8d
	ret			;7f8f
L_7F90:
	ld a,c			;7f90
	ld (0ccc0h),a		;7f91
	inc hl			;7f94
	ld de,0d100h		;7f95   ; apunta a el bloque que se mueve en curso
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
	call 04bdeh		;7faf   ; copia_rectangulo: HMMM (0xD0): B x C de (H, L) a (D, E); A = pagina origen | destino * 4
	pop bc			;7fb2
	pop de			;7fb3
L_7FB4:
	ld hl,04088h		;7fb4
	ld a,(0d116h)		;7fb7
	and a			;7fba
	ret z			;7fbb
	ld c,a			;7fbc
	call 04841h		;7fbd   ; copia_de_pagina_1: p00:4BDE de la pagina 1 a la 0
	ld ix,0d100h		;7fc0   ; apunta a el bloque que se mueve en curso
	jp L_7ED0		;7fc4
bloque_13:		; si el bloque en curso (0xD100) es el 0x0D, segun 0xCCC0
	ld hl,0d100h		;7fc7   ; apunta a el bloque que se mueve en curso
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
posicion_bloque_13:		; si el bloque en curso es el 0x0D, su posicion de 0xD118/0xD119
	ld a,(0d100h)		;7fe0   ; lee el bloque que se mueve en curso
	cp 00dh		;7fe3
	ret nz			;7fe5
	ld a,(0d118h)		;7fe6
	ld e,a			;7fe9
	ld a,(0d119h)		;7fea
	ld d,a			;7fed
	ld b,010h		;7fee
	jr L_7FB4		;7ff0
texto_de_ruina_japones:		; solo con la BIOS japonesa y sin otro texto en marcha (0xC8AB, 0xC8A0)
	ld a,(0002bh)		;7ff2
	and 00fh		;7ff5
	ret nz			;7ff7
	ld a,(0c8abh)		;7ff8   ; lee el texto a maquina ya ha salido
	and a			;7ffb
	ret nz			;7ffc
	ld a,(0c8a0h)		;7ffd   ; lee el texto a maquina en marcha
