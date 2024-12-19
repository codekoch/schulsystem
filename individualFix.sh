#!/bin/bash

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


#### individuelle Veränderungen:
fixversion='user0 Lock'
yellow_msg "Installiere die individuellen Veränderungen (Fix $fixversion)..."
sudo echo 'notify-send -t 5000 "+Fix" "'$fixversion'"' >> /usr/bin/setbackground.sh
########
######## ab hier kommt der Code der für die individuellen Veränderungen sorgt
########
sudo chmod 700 /usr/bin/mugshot
sudo cp scripts/resethomedir.sh /etc/init.d/
########
######## Ende des inidivuellen Codes
########
green_msg "Erledigt!"
