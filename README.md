![schulsystem](https://github.com/codekoch/schulsystem/blob/main/Logo_website.jpg)
## Schulsystem - kostenlos, frei, vielseitig und zuverlässig ...
(wie ein "Schulsystem" sein sollte 😉)

Über die Zielsetzung der Digitalisierung sind sich wahrscheinlich viele Lehrkräfte einig. Kommende Generationen müssen schon in der Schule Kompetenzen erlangen, mit denen sie sich in der zunehmend digitalen Welt zurecht finden können. 

Aber muss man zwangläufig für dieses Ziel die Angebote großer Firmen nutzen, deren zukünftige Kosten ungewiss sind? Ist es sinnvoll, bereits Kinder in eine Abhängigkeit zu führen, von der sie sich später als Erwachsene nur schwer lösen können? Sollte eine Schule neben ihrem pädagogischen Auftrag auch Werbeträger für kommerzielle Produkte sein? 

Sicherlich nicht, wenn es gute Alternativen gibt...

Das <b>Schulsystem</b> bietet ein einfaches, wartungsfreies und trotzdem vielseitges Betriebssystem speziell für den Mehrbenutzerbetrieb an Schulen, das ohne das Sammeln von Nutzerdaten und kommerzielle Interessen auskommt. 

Das <b>Schulsystem</b> besteht aus Shellskripten, die ein Linuxsystem für die Benutzung in der Schule optimieren. Das resultierende System ist selbstheilend und benötigt keinerlei Logindaten. Es löscht beim Neustart alle vom Nutzer getätigten Veränderungen und verhält sich damit auf Dauer wie ein frisch installiertes System. Trotzdem hat der Nutzer die Möglichkeit, seine gesamten Sitzungsdaten auf einem externen Medium zu speichern und wieder herzustellen. Somit ist das Accountmanagement gewissermaßen in der Verwantwortung jedes einzelnen Nutzers.

Neben den genannten Features ist das <b>Schulsystem</b> in der Lage seinen Bildschirm auf beliebige andere Geräte mit einer Browseranwendung wie z.B. Chrome, Safari oder Firefox zu spiegeln, die sich im selben Netzwerk befinden (siehe Hinweise zur Bedienung).  

Änderungswünsche, Verbessungen und Hilfe sind jederzeit willkommen:
https://github.com/codekoch/schulsystem/issues

## Zu Beginn
- Installiere das Linuxsystem Xubuntu Version 20.4 (Quelle: <a href=https://xubuntu.org/>Xubuntu 20.4 LTS 64bit</a>).
- (optional) Verändere das System nach deinen Wünschen.
## Installation des Schulsystems
- Öffne ein Eingabefenster (Terminal).
- Installiere git.
> sudo apt-get install git
- Klone dieses Repository.
> git clone https://github.com/codekoch/schulsystem
- Starte die Installation per Shellskript als root. 
> cd schulsystem

> sudo ./install.sh
- Entscheide, ob du das zusätzliche Software Pack installieren möchtest (siehe https://github.com/codekoch/schulsystem/blob/main/software.sh).
- Starte den Rechner neu mit dem Autologin in den Useraccount user0. 
> sudo shutdown -r now
- Passe alles deinen Wünschen an.
- Öffne ein Terminal, logge dich als Benutzer mit root Rechten ein, speichere die momentanen Einstellungen des user0 Accounts und starte den Rechner neu.
> su {user with admin rights}

> sudo /etc/init.d/resethomedir.sh save

> sudo shutdown -r now
- Viel Spaß mit deinem <b>Schulsystem</b>!

## Hinweise zu Bedienung
### Bildschirmspiegelung / Remote Desktop Verbindung zwischen zwei Schulsystemen und anderen Systemen
![VNC](https://github.com/codekoch/schulsystem/blob/main/VNC.png)
- <b>Aktivierung</b> mit <b>X11VNC Server</b> (Wähle <b>Accept Connections</b> und klicke auf <b>OK</b>) 
- <b>Verbindung</b> mit <b>X11VNC Connect</b> (Gebe die <b>IP Adresse des anderen Schulsystems</b> ein)
- Logge dich mit <b>leerem Benutzernamen</b> und <b>leerem Passwort</b> ein (Veränderungen können in /etc/guacamole/user-mapping.xml vorgenommen werden)
- Verbinde dich mit jedem anderem System im selben Netzwerk über die Browseradresse http://\<IP-des-Schulsystems\>:8080

### Speicherung und Wiederherstellung des Benutzerkontos samt aller Einstellungen / Save and load session 
- Abspeichern und Laden der aktuellen Nutzersitzung:

  ![saveloadsession](https://github.com/codekoch/schulsystem/blob/main/saveLoadSession.png)
  
  Das erste Abspeichern dauert einige Zeit, aber danach sollte es dank rsync ziemlich schnell gehen
  (Benutze ein externes Speichermedium im FAT32 Format and vergiss nicht es auszuwerfen, bevor du es entfernst. USB 3.0 Support ist empfohlen.)

### Veränderungen permanent speichern, Selbstheilung aktivieren und deaktivieren
- Logge dich als user mit root-Rechten ein (z.B. per Terminal während einer Sitzung von user0) und gebe folgende Kommandos ein 
    
    - > sudo /etc/init.d/resethomedir.sh save

        um Veränderungen permanent abzuspeichern 

    - > sudo /etc/init.d/resethomedir.sh deactivate

        um die Selbstheilung für den Useraccount user0 zu deaktivieren

    - > sudo /etc/init.d/resethomedir.sh activate

        um die Selbstheilung für den Useraccount user0 zu aktivieren
        
### Passwort für user0
- Der Selbstheilende Account hat den Benutzernamen <b>user0</b> und das Passwort <b>user0</b> 

 
