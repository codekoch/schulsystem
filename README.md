![schulsystem](https://github.com/codekoch/schulsystem/blob/main/Logo_website.jpg)
## Schulsystem - kostenlos, frei, vielseitig und zuverlässig ...
(wie ein "Schulsystem" sein sollte 😉)

Was die Digitalisierung im Grundsatz angeht, sind sich wahrscheinlich viele Lehrkräfte einig. Kommende Generationen müssen schon in der Schule Kompetenzen erlangen, mit denen sie sich in der zunehmend digitalen Welt zurecht finden könne. Diese Kompetenzen im Umgang mit der digitalen Welt müssen jedoch nicht an bestimmten Systemen von speziellen Firmen erlernt werden. Es muss vielmehr ein prinzipielles Verständnis über den Nutzen dieser Medien für bestimmte Situationen erlangt werden. Dabei sollte man vor allem auch lernen, dass es neben dem einen evtl. kommerziellen Produkt auch viele Alternativen gibt, die ebenso oder sogar besser geeignet sein können, um eine bestimmte Problemstellungen zu bewältigen. Letztendlich sollten digtiale Kompetenzen unabhängig von wirtschaftlichen Interessen erworben werden können, was bei den bisher gängigen Initiativen wie z.B. "I-Pad-Klassen" oder "für die Schulzeit kostenlose Microsoftprodukte" durchaus in Frage gestellt werden kann, wenn sie unreflektiert und alternativlos durchgeführt werden.

Dieses Projekt bietet ein einfaches, wartungsfreies und trotzdem vielseitges Betriebssystem für die Schule an, das ohne das Sammeln von Nutzerdaten und kommereziellen Interessen auskommt. 

Schulsystem besteht aus Shellscripten, die ein Linuxsystem für die Benutzung in der Schule optimieren. Das resultierende System ist selbstheilend und benötigt keinerlei Logindaten. Es löscht beim Neustart alle vom Nutzer getätigten Veränderungen. Trotzdem hat der Nutzer die Möglichkeit seine gesamten sitzungsdaten auf einem externen Mediuum zu speichern und wieder herzustellen. Somit ist das Accountmanagement gewissermaßen in der Verwantwortung jedes einzelnen Nutzers. 

## Zu Beginn
- Install a new linux system based on a debian distrubution (testet with <a href=https://xubuntu.org/>Xubuntu 20.4 LTS 64bit</a>)
- (optional) make your own changes to the fresh installed system
## Installing
- Open a terminal
- Install git
> sudo apt-get install git
- Clone this repository
> git clone https://github.com/codekoch/schooldevice
- Start the install shellscript as root 
> cd schooldevice

> sudo ./install.sh
- Decide if you want to install the additional software pack (see https://github.com/codekoch/schooldevice/blob/master/software.sh)
- Restart to autologin into the new account user0
> sudo shutdown -r now
- Customize everything according to your needs
- Open a terminal, login as a user with admin rights, save the current account settings of user0 and restart system
> su {user with admin rights}

> sudo /etc/init.d/resethomedir.sh save

> sudo shutdown -r now
- Have fun with your new schooldevice 

## Hints
### Save and load session (to an external device)
- save and load your current user session:

  ![saveloadsession](https://github.com/codekoch/schooldevice/blob/master/saveLoadSession.png)
  
  the first save takes some time, but after that it is very fast thanks to rsync
  
  (Use an external device with FAT32 filesystem and don't forget to eject before disconnecting. USB 3.0 support is recommended.)

### Save changes permanently, activate, deactivate selfhealing
- login in as a user with admin rights (i.e. in a terminal during user0 session) and use 
    
    - > sudo /etc/init.d/resethomedir.sh save

        to save permanent changes 

    - > sudo /etc/init.d/resethomedir.sh dactivate

        to turn off selfhealing of user account user0

    - > sudo /etc/init.d/resethomedir.sh activate

        to turn on selfhealing of user account user0
        
### Screenmirroring / remote desktop connection between schooldevices (and other devices)
![VNC](https://github.com/codekoch/schooldevice/blob/master/VNC.png)
- <b>Activate</b> with <b>X11VNC Server</b> (Select <b>Accept Connections</b> and Click <b>OK</b>) 
- <b>Connect</b> with <b>X11VNC Connect</b> (Type in <b>IP address of other schooldevice</b>)
- Login with <b>empty username</b> and <b>empty password</b> (changes can be done in /etc/guacamole/user-mapping.xml)
- (connect on every device in the same network via browseraddress http://\<ip-of-schooldevice\>:8080)


### Password for user0
- The selfhealing accounts username is user0 with password user0 

 
