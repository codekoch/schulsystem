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
fixversion='Bobdue'
yellow_msg "Installiere die individuellen Veränderungen (Fix $fixversion)..."
sudo echo 'notify-send -t 5000 "+Fix" "'$fixversion'"' >> /usr/bin/setbackground.sh
########
######## ab hier kommt der Code der für die individuellen Veränderungen sorgt
########
sudo apt-get install libboost-all-dev libwxgtk3.2-dev libusb-1.0-0-dev bison++ flex libfl-dev make gcc g++ libcanberra-gtk-module libcanberra-gtk3-module
wget "https://downloads.bob3.org/bobdude/bobdude-1.5.0.tar.bz2"
tar -xjf bobdude-1.5.0.tar.bz2
cd bobdude-1.5.0
./configure
make
sudo make install
cd ..


########
######## Ende des inidivuellen Codes
########
green_msg "Erledigt!"
