#!/usr/bin/bash
ipaddress=$(zenity --width=400 --entry --title "IP-ADRESSE des entfernten Schulsystems:" --text "Format: xxx.xxx.xxx.xxx")
exo-open --launch WebBrowser "http://$ipaddress:8080/guacamole"
