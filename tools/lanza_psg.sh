#!/bin/sh
# lanza_psg.sh [dir] [segundos] ["nn alt"]: UN openMSX con tools/omsx_psg.tcl (cotejo del
# PSG). Lo medido queda en work/<dir>/psg.txt.
R=$(cd "$(dirname "$0")/.." && pwd)
d=$R/work/${1:-psg}
mkdir -p $d
cd $R
USAS_OUT="$d" USAS_FIN=${2:-120} USAS_CAMBIA="$3" "/c/Program Files/openMSX/openmsx.exe" -machine C-BIOS_MSX2_JP -cart usas.rom -romtype Konami -script tools/omsx_psg.tcl > $d/stdout.txt 2>&1
echo hecho > $d/fin.txt
