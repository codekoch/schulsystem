#!/bin/bash
# prerequisite:
#  * wine (tested with v3.0)
#  * winetricks (newer is always better)

## Get some colors
function red_msg() {
echo -e "\\033[31;1m${@}\033[0m"
}
 
function green_msg() {
echo -e "\\033[32;1m${@}\033[0m"
}
function yellow_msg() {
echo -e "\\033[33;1m${@}\033[0m"
}
 
function blue_msg() {
echo -e "\\033[34;1m${@}\033[0m"
}

if [ -z $1 ]; then
red_msg "USAGE:"
yellow_msg "./lupo.sh lupofile.lpo"
exit
fi

yellow_msg "Installiere WINE Umgebung und starte LuPO_NRW_SV.exe."
yellow_msg "Die bearbeitete Lupodatei (Eine Kopie von $1) liegt nach dem Schliessen des Programms auf dem Desktop!"

export WINEPREFIX=~/lupo
export WINEARCH=win32
if [ ! -d ~/lupo ]; then
  mkdir ~/lupo
  winetricks -q mdac28
  winetricks -q jet40
  mkdir ~/lupo/drive_c/lupo
  cd ~/lupo/drive_c/lupo
  wget -P ~/lupo/drive_c/lupo https://www.svws.nrw.de/system/files/zip_und_exe/2021-03/LuPO_NRW_2_1_6_2_0.zip
  wget -P ~/lupo/drive_c/lupo https://www.svws.nrw.de/system/files/zip_und_exe/2018-11/Beispieldatenbank.zip
  unzip ~/lupo/drive_c/lupo/Beispieldatenbank.zip -d ~/lupo/drive_c/lupo/
  unzip ~/lupo/drive_c/lupo/LuPO_NRW_2_1_6_2_0.zip -d ~/lupo/drive_c/lupo/
  rm ~/lupo/drive_c/lupo/*.zip
fi
chmod 777 ./$1
cp ./$1 ~/Desktop

wine ~/lupo/drive_c/lupo/LuPO_NRW_SV.exe


