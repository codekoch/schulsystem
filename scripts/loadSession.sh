#!/bin/bash
su user0 -c 'zenity --info --width 300 --text "Bitte beende alle laufenden Anwendungen...\nund schließe ein externes Medium im FAT32 Format an" --title "ACHTUNG!"' 
path=`su user0 -c 'zenity --file-selection --directory --title="Wähle das Verzeichnis mit dem Backup des Nutzerkontos" --filename=/media/user0/'` 
if [[ $path =~ /media/user0/*/ ]];then
 cd /
 wget https://raw.githubusercontent.com/codekoch/schooldevice/master/scripts/rsync-homedir-local.txt -O rsync-homedir-local.txt
 chmod 777 rsync-homedir-local.txt
 rsync -a  --exclude-from=rsync-homedir-local.txt --progress $path/ /home/user0/ --delete | su user0 -c 'zenity --title "Session" --text "wird wiederhergestellt von '$path'.\nJe nach Datenvolumen und Transfergeschwindigkeit kann dies etwas dauern.\nBitte warte auf den Ok Knopf..." --progress --pulsate --auto-kill'
else
 su user0 -c 'zenity --info --width 300 --text "Du hast kein Verzeichnis auf dem externen Medium ausgewählt" --title "ERROR!"'
fi
