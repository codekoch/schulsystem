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
fixversion='Greenfoot'
yellow_msg "Installiere die individuellen Veränderungen (Fix $fixversion)..."
sudo echo 'notify-send -t 5000 "+Fix" "'$fixversion'"' >> /usr/bin/setbackground.sh
########
######## ab hier kommt der Code der für die individuellen Veränderungen sorgt
########
wget https://www.greenfoot.org/download/files/Greenfoot-linux-x64-390.deb
sudo apt install -y ./Greenfoot-linux-x64-390.deb


########
######## Ende des inidivuellen Codes
########
green_msg "Erledigt!"
