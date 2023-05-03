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

sudo apt-get install -y umbrello

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

#### Edge
sudo apt install -y software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"
sudo apt install -y microsoft-edge-dev

#### Openboard
wget https://github.com/OpenBoard-org/OpenBoard/releases/download/v1.6.4/openboard_ubuntu_22.04_1.6.4_amd64.deb
sudo apt install -y ./openboard_ubuntu_22.04_1.6.4_amd64.deb

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


### Virtual Box
sudo apt-get install -y virtualbox
sudo apt-get install -y virtualbox-ext-pack
sudo apt-get install -y virtualbox-qt 
sudo apt-get install -y virtualbox-dkms

#### Iso-Datei von Xubuntu herunterladen
sudo mkdir /isos
sudo chmod 755 /isos
cd /isos
wget http://ftp.uni-kl.de/pub/linux/ubuntu-dvd/xubuntu/releases/22.04/release/xubuntu-22.04.2-desktop-amd64.iso

#### gnome-network-displays
# git clone https://gitlab.gnome.org/GNOME/gnome-network-displays.git
# echo 'SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="11:22:33:44:55:66", ATTR{type}=="1", KERNEL=="wlan*", NAME="wlan0"' | sudo tee  /etc/udev/rules.d/70-persistent-net.rules
# sudo apt-get install -y libgstreamer-plugins-base1.0-dev libgstrtspserver-1.0-dev gstreamer1.0-rtsp
# sudo apt-get install -y libgtk-3-dev libnm-dev libpulse-dev x264
# sudo apt-get install -y libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio
# sudo apt-get install -y libavahi-gobject-dev
# cd gnome-network-displays-master/sudo  
# sudo apt-get install meson gettext appstream-util
# sudo apt-get install libprotobuf-c-dev 
# sudo apt-get install libprotobuf-c1
# sudo apt install libjson-glib-dev
# sudo apt install libsoup-3.0-dev 
# sudo meson install

#### Linux Live Kit (deaktiviert)
#sudo apt-get install -y genisoimage 
#sudo apt-get install -y aufs-dkms 
#git clone https://github.com/Tomas-M/linux-live
#sudo  sed -i 's/VMLINUZ=\/vmlinuz/VMLINUZ=\/boot\/vmlinuz/g' linux-live/config
#sudo  sed -i 's|LIVEKITDATA=/tmp|LIVEKITDATA=/a|g' linux-live/config
#sudo cp -R linux-live /opt/
#sudo chmod -R 755 /opt/linux-live
#echo '#!/bin/bash' | sudo tee /usr/bin/buildLinuxLive.sh
#echo 'cd /opt/linux-live' | sudo tee -a /usr/bin/buildLinuxLive.sh
#echo './build' | sudo tee -a /usr/bin/buildLinuxLive.sh
#sudo chmod 755 /usr/bin/buildLinuxLive.sh

### Software Verzeichnis für user0 zugänglich machen
cp -R software /tmp/
chmod 777 /tmp/software/
