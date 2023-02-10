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
fixversion='BobDude 1.4.3'
yellow_msg "Installiere die individuellen Veränderungen (Fix $fixversion)..."
sudo echo 'notify-send -t 5000 "+Fix" "'$fixversion'"' >> /usr/bin/setbackground.sh
########
######## ab hier kommt der Code der für die individuellen Veränderungen sorgt
########
sudo apt-get install -y libboost-all-dev libwxgtk3.0-gtk3-dev libusb-1.0-0-dev bison++ flex-old make gcc g++ libcanberra-gtk-module libcanberra-gtk3-module
wget "http://download.savannah.gnu.org/releases/avrdude/avrdude-6.3.tar.gz"
tar -xzf avrdude-6.3.tar.gz
cd avrdude-6.3
./configure
make
sudo make install
sudo ldconfig
cd ..
wget "http://www.bob3.org/downloads/bobdude-1.4.3.tar.bz2"
tar -xjf bobdude-1.4.3.tar.bz2
cd bobdude-1.4.3
./configure --sysconfdir=/etc
make
sudo make install
cd ..
sudo usermod -a -G dialout user1
sudo usermod -a -G dialout user0
########
######## Ende des inidivuellen Codes
########
green_msg "Erledigt!"
