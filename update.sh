#!/bin/bash
version='Version 1.0'

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


yellow_msg "Installiere einige Skripts für die vereinfachte Verbindung ..."
### install some shellscripts and changes to connect easier
sudo cp scripts/showVNCAddress.sh /usr/bin/
sudo chmod 755 /usr/bin/showVNCAddress.sh
new='\/usr\/bin\/sh -c "\/usr\/bin\/showVNCAddress.sh;\/usr\/bin\/x11vnc -gui tray=setpass -shared -rfbport 5900 -bg -o %%HOME\/.x11vnc.log.%%VNCDISPLAY"'
sudo sed -i "s/Exec=.*/Exec=$new/g" /usr/share/applications/x11vnc.desktop 
sudo cp scripts/connect2schulsystem.sh /usr/bin/
sudo chmod 755 /usr/bin/connect2schulsystem.sh
sudo cp scripts/x11vncConnect.desktop /usr/share/applications/
sudo chmod 755 /usr/share/applications/x11vncConnect.desktop




#### set new user background
yellow_msg "Richte das Startskript und den Background für das Nutzerkonto user0 ein"
sudo cp Logo_website.png /usr/share/xfce4/backdrops/
sudo chmod 755 /usr/share/xfce4/backdrops/Logo_website.png
sudo echo '#!/bin/bash' > /usr/bin/setbackground.sh
sudo echo 'sleep 4' >> /usr/bin/setbackground.sh
sudo echo 'notify-send -t 10000 "ACHTUNG:" "Alle Daten werden nach einem Neustart oder Logout gelöscht!\nStelle sicher, dass die Daten falls nötig auf einem externen Gerät oder in der Cloud gespeichert werden."' >> /usr/bin/setbackground.sh                                                
sudo echo 'notify-send -t 5000 "Schulsystem" "'$version'"' >> /usr/bin/setbackground.sh
sudo echo 'xfconf-query --channel xfce4-desktop --list | grep last-image | while read path; do ' >> /usr/bin/setbackground.sh
sudo echo '    xfconf-query --channel xfce4-desktop --property $path --set /usr/share/xfce4/backdrops/Logo_website.png' >> /usr/bin/setbackground.sh
sudo echo ' done ' >> /usr/bin/setbackground.sh
sudo echo 'xfconf-query --channel xfce4-desktop --list | grep image-style | while read path; do ' >> /usr/bin/setbackground.sh
sudo echo '    xfconf-query --channel xfce4-desktop --property $path --set 1' >> /usr/bin/setbackground.sh
sudo echo ' done ' >> /usr/bin/setbackground.sh
sudo echo 'xset s off' >> /usr/bin/setbackground.sh
sudo echo 'xset s noblank' >> /usr/bin/setbackground.sh
sudo echo 'xset -dpms' >> /usr/bin/setbackground.sh
sudo chmod 755  /usr/bin/setbackground.sh

#### set save and load session ability
yellow_msg "Richte die eigenständige Nutzerdatenverwaltung ein (save/load session) ...  "
desktop_path=$(xdg-user-dir DESKTOP | grep -Eo '[^/]+/?$')  
sudo cp scripts/saveSession.sh /usr/bin/
sudo cp scripts/loadSession.sh /usr/bin/
sudo chown root /usr/bin/saveSession.sh
sudo chown root /usr/bin/loadSession.sh
sudo chmod 0755 /usr/bin/saveSession.sh
sudo chmod 0755 /usr/bin/loadSession.sh
sudo chgrp sudo /usr/bin/saveSession.sh
sudo chgrp sudo /usr/bin/loadSession.sh
sudo mkdir /home/.saves/user0/$desktop_path/
sudo chown user0 /home/.saves/user0/$desktop_path/
sudo cp scripts/loadSession.desktop /home/.saves/user0/$desktop_path/
sudo cp scripts/saveSession.desktop /home/.saves/user0/$desktop_path/
sudo cp scripts/loadSession.desktop /usr/share/applications/
sudo cp scripts/saveSession.desktop /usr/share/applications/
sudo chmod 755 /usr/share/applications/loadSession.desktop
sudo chmod 755 /usr/share/applications/saveSession.desktop
sudo chmod 755 /home/.saves/user0/$desktop_path/*.desktop
sudo chown user0 /home/.saves/user0/$desktop_path/*.desktop
sudo echo "# User privilege specification" > saveLoadSession
sudo echo "user0 ALL=(ALL:ALL) NOPASSWD:/usr/bin/saveSession.sh" >> saveLoadSession
sudo echo "user0 ALL=(ALL:ALL) NOPASSWD:/usr/bin/loadSession.sh" >> saveLoadSession
sudo cp ./saveLoadSession /etc/sudoers.d/saveLoadSession
sudo chmod 0440 /etc/sudoers.d/saveLoadSession

green_msg "Have fun!!"
