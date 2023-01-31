#!/bin/bash

### via snap 
sudo apt-get install -y default-jdk

sudo apt-get install default-jre 

sudo snap install netbeans --classic

sudo apt-get install -y openjdk-8-jre openjdk-8-jdk openjdk-8-jre-headless openjdk-8-jdk-headless

sudo snap install intellij-idea-community --classic

sudo snap install --classic eclipse 

sudo snap install blender --classic

sudo snap install bluej

sudo snap install arduino


### via apt-get 

sudo apt-get install -y cura

sudo apt-get install -y ballerburg

sudo apt-get install -y qrencode

sudo apt-get install -y geogebra

sudo apt-get install -y gimp

sudo apt-get install -y youtube-dl

sudo apt-get install -y simplescreenrecorder

sudo apt-get install -y ballerburg

sudo apt-get install -y python-pip

sudo apt-get install -y nodejs

sudo apt-get install -y npm

sudo apt-get install -y feh

sudo apt-get install -y gparted

sudo apt-get install -y net-tools

sudo apt-get install -y vlc

sudo apt-get install -y xournal

sudo apt-get install -y stellarium 

sudo apt-get install -y tigervnc-viewer

#### Wine

sudo apt-get install -y wine

sudo apt-get install -y winetricks

#### LuPo Support (https://www.svws.nrw.de/download/lupo/lupo-download)
sudo cp scripts/lupo.sh /usr/bin/
sudo chown root /usr/bin/lupo.sh
sudo chmod 0755 /usr/bin/lupo.sh

#### Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

#### Openboard
wget https://github.com/OpenBoard-org/OpenBoard/releases/download/v1.6.3/openboard_ubuntu_22.04_1.6.3_amd64.deb
sudo apt install -y ./openboard_ubuntu_22.04_1.6.3_amd64.deb

#### Greenfoot
wget http://www.greenfoot.org/download/files/Greenfoot-linux-371.deb
sudo apt install -y ./Greenfoot-linux-371.deb

#### unetbootin
sudo add-apt-repository ppa:gezakovacs/ppa -y
sudo apt-get update
sudo apt-get install -y unetbootin

#### Veyon (deaktiviert)
#sudo add-apt-repository ppa:veyon/stable -y
#sudo apt-get update
#sudo apt-get install -y veyon

### BobDude
sudo apt -y --purge remove libboost-dev libboost-doc libboost1.71-all-dev
sudo apt-get install -y libboost1.67-all-dev libwxgtk3.0-gtk3-dev libusb-1.0-0-dev bison++ flex-old make gcc g++ libcanberra-gtk-module libcanberra-gtk3-module
wget "http://download.savannah.gnu.org/releases/avrdude/avrdude-6.3.tar.gz"
tar -xzf avrdude-6.3.tar.gz
cd avrdude-6.3
./configure
make
sudo make install
sudo ldconfig
cd ..
wget "http://www.bob3.org/downloads/bobdude-1.4.0.tar.bz2"
tar -xjf bobdude-1.4.0.tar.bz2
cd bobdude-1.4.0
./configure --sysconfdir=/etc
make
sudo make install
cd ..
sudo usermod -a -G dialout user1
sudo usermod -a -G dialout user0


### Virtual Box
sudo apt-get install -y virtualbox
sudo apt-get install -y virtualbox-ext-pack
sudo apt-get install -y virtualbox-qt 
sudo apt-get install -y virtualbox-dkms

#### Linux Live Kit (deaktiviert)
#sudo apt-get install -y squashfs-tools
#sudo apt-get install -y genisoimage 
#sudo apt-get install -y zip 
#sudo apt-get install -y aufs-dkms 
#sudo apt-get install -y dkms
#git clone https://github.com/Tomas-M/linux-live
#sudo mkdir /a
#sudo  sed -i 's/VMLINUZ=\/vmlinuz/VMLINUZ=\/boot\/vmlinuz/g' linux-live/config
#sudo  sed -i 's|LIVEKITDATA=/tmp|LIVEKITDATA=/a|g' linux-live/config
#sudo cp -R linux-live /opt/
#sudo chmod -R 755 /opt/linux-live
#sudo echo '#!/bin/bash' > /usr/bin/buildLinuxLive.sh
#sudo echo 'cd /opt/linux-live' >> /usr/bin/buildLinuxLive.sh
#sudo echo './build' >> /usr/bin/buildLinuxLive.sh
#sudo chmod 755 /usr/bin/buildLinuxLive.sh

### Software Verzeichnis für user0 zugänglich machen
cp -R software /tmp/
chmod 777 /tmp/software/
