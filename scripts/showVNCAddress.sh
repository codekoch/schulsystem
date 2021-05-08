#!/usr/bin/bash
ipadress=`hostname -I | awk '{print $1}'`
notify-send -u critical "Deine IP-ADRESSE:" "$ipadress" 
notify-send -u critical "Wähle ACCEPT CONNECTIONS und drücke auf OK, um andere Verbindungen zuzulassen" 
