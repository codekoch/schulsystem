#!/usr/bin/bash
ipadress=`hostname -I | awk '{print $1}'`
notify-send -u critical "Deine IP-ADRESSE:" "$ipadress" 
notify-send -u critical " " "Wähle Accept Connections\nund drücke auf OK,\num andere Verbindungen zuzulassen" 
