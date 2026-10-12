# omsx_psg.tcl - Lo que el juego escribe de verdad en el PSG, para cotejarlo
# con tools/musica.py (que ejecuta el mismo motor fuera del emulador).
#
# Apunta en $USAS_OUT/psg.txt, en orden:
#   F                 cada interrupcion (p00:403D): un cuadro
#   S nn alt marcha   cada llamada a `sonido` (p00:56E3): A, 0xC122 y 0xC121
#   W r v             cada escritura al PSG (puerto 0xA0 el registro, 0xA1 el dato)
# Pulsa ESPACIO cada 3 s entre los 8 y los $USAS_FIN - 10 s, para pasar del
# titulo a la partida, y sale a los $USAS_FIN s emulados. Velocidad normal.
set OUT $::env(USAS_OUT)
set FIN [expr {[info exists ::env(USAS_FIN)] ? $::env(USAS_FIN) : 120}]
file mkdir $OUT
set ::log {}
set ::reg 0
debug set_watchpoint write_io 0xA0 {} { set ::reg [expr {$::wp_last_value & 0x0F}] }
debug set_watchpoint write_io 0xA1 {} { lappend ::log "W $::reg $::wp_last_value" }
debug set_bp 0x403D {[debug read memory 0x403D] == 0xF3} { lappend ::log "F" }
# Con USAS_CAMBIA="nn alt": la primera vez que el juego pide la 0x89 (la
# antesala) se le cambia por la musica nn con la altura alt, poniendo 0xC121 y
# 0xC122 como musica_de_fase (p00:54E1). Es una intervencion de la sonda, para
# oir una musica de ruina sin jugar hasta ella.
set ::cambia [expr {[info exists ::env(USAS_CAMBIA)] ? $::env(USAS_CAMBIA) : ""}]
debug set_bp 0x56E3 {[debug read memory 0x56E3] == 0xE5} {
    if {$::cambia ne "" && [reg a] == 0x89} {
        reg a [lindex $::cambia 0]
        debug write memory 0xC121 1
        debug write memory 0xC122 [lindex $::cambia 1]
        set ::cambia ""
    }
    lappend ::log "S [reg a] [debug read memory 0xC122] [debug read memory 0xC121]"
}
proc pulsa {} { keymatrixdown 8 0x01; after time 0.15 { keymatrixup 8 0x01 } }
for {set t 8} {$t < [expr {$FIN - 10}]} {incr t 3} { after time $t pulsa }
proc acaba {} {
    set f [open [file join $::OUT psg.txt] w]
    puts $f [join $::log "\n"]
    close $f
    exit
}
after time $FIN acaba
