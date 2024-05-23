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
fixversion='Kali auf Virtual Box'
yellow_msg "Installiere die individuellen Veränderungen (Fix $fixversion)..."
sudo echo 'notify-send -t 5000 "+Fix" "'$fixversion'"' >> /usr/bin/setbackground.sh
########
######## ab hier kommt der Code der für die individuellen Veränderungen sorgt
########
sudo apt update
sudo apt install -y --reinstall linux-headers-$(uname -r) virtualbox-dkms dkms
sudo mkdir /vbox
sudo chmod -R 777 /vbox
cd /vbox
wget https://cdimage.kali.org/kali-2024.1/kali-linux-2024.1-virtualbox-amd64.7z
7z x kali-linux-2024.1-virtualbox-amd64.7z
sudo chmod -R 777 *
yellow_msg "Nach einem Neustart muss noch"
yellow_msg "modprobe vboxdrv"
yellow_msg "eingegeben werden!"



########
######## Ende des inidivuellen Codes
########
green_msg "Erledigt!"
