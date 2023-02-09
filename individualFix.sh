#!/bin/bash
fixversion='BobDude3'

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

#### get latest version of current system
yellow_msg "Das aktuelle System wird auf den neuesten Stand gebracht..."
sudo apt-get update
sudo apt-get -y upgrade
#### individuelle Veränderungen
yellow_msg "Installiere die individuellen Veränderungen..."
sudo echo 'notify-send -t 5000 "+Fix" "'$fixversion'"' >> /usr/bin/setbackground.sh
########
######## ab hier kommt der Code der für die individuellen Veränderungen sorgt
########
sudo apt-get install libboost-all-dev libwxgtk3.0-gtk3-dev libusb-1.0-0-dev bison++ flex-old make gcc g++ libcanberra-gtk-module libcanberra-gtk3-module
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
########
######## Ende des inidivuellen Codes
########
green_msg "Erledigt!"
