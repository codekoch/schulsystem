#!/usr/bin/bash
ipaddress=$(zenity --width=400 --entry --title "IP-ADRESSE des entfernten Schulsystems:" --text "Format: xxx.xxx.xxx.xxx")
notify-send -u critical " " "Drücke auf Anmelden\n(Bentuzername und Passwort sind nicht nötig)" 
exo-open --launch WebBrowser "http://$ipaddress:8080/guacamole"
