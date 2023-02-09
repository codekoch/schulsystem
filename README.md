![schulsystem](https://github.com/codekoch/schulsystem/blob/main/Logo_website.jpg)
## Schulsystem - kostenlos, frei, vielseitig und zuverlässig ...
(wie ein "Schulsystem" sein sollte 😉)

Über die Zielsetzung der Digitalisierung sind sich wahrscheinlich viele Lehrkräfte einig. Kommende Generationen müssen schon in der Schule Kompetenzen erlangen, mit denen sie sich in der zunehmend digitalen Welt zurecht finden können. 

Aber muss man zwangläufig für dieses Ziel die Angebote großer Firmen nutzen, deren zukünftige Kosten ungewiss sind? Ist es sinnvoll, bereits Kinder in eine Abhängigkeit zu führen, von der sie sich später als Erwachsene nur schwer lösen können? Sollte eine Schule neben ihrem pädagogischen Auftrag auch Werbeträger für kommerzielle Produkte sein? 

Sicherlich nicht, wenn es Alternativen gibt...

Bei der Wahl des Betriebssystems für Schulgeräte gibt es diese auf jeden Fall: 

Das <b>Schulsystem</b> bietet ein einfaches, wartungsfreies und trotzdem vielseitges Betriebssystem speziell für den Mehrbenutzerbetrieb an Schulen, das ohne das Sammeln von Nutzerdaten und kommerzielle Interessen auskommt. 

Das <b>Schulsystem</b> besteht aus Shellskripten, die ein Linuxsystem für die Benutzung in der Schule optimieren. Das resultierende System ist selbstheilend und benötigt keinerlei Logindaten. Es löscht beim Neustart alle vom Nutzer getätigten Veränderungen und verhält sich damit auf Dauer wie ein frisch installiertes System. Trotzdem hat der Nutzer die Möglichkeit, seine gesamten Sitzungsdaten auf einem externen Medium zu speichern und wieder herzustellen. Somit ist das Accountmanagement gewissermaßen in der Verwantwortung jedes einzelnen Nutzers.

Neben den genannten Features ist das <b>Schulsystem</b> in der Lage, seinen Bildschirm auf beliebige andere Geräte mit einer Browseranwendung wie z.B. Chrome, Safari oder Firefox zu spiegeln, die sich im selben Netzwerk befinden (siehe Hinweise zur Bedienung).  

Änderungswünsche, Verbessungen und Hilfe sind jederzeit willkommen:
https://github.com/codekoch/schulsystem/issues

## Zu Beginn
- Installiere das Linuxsystem Xubuntu Version 22.04 (Quelle: <a href=https://xubuntu.org/>Xubuntu 22.04 LTS 64bit</a>).
  - Wie du einen bootfähigen USB-Stick mit einem installationsfähigen Linuxsystem von einer heruntergeladenen iso-Datei erstellst, erfährst du im Internet ;-)   
    oder unter https://www.thomas-krenn.com/de/wiki/Ubuntu_von_einem_USB_Stick_installieren 
  - Prinzipiell ist es auch kein Problem, das Linuxsystem und damit das Schulsystem auf einem externen Datenträger oder neben einem bereits vorhandenen 
    Betriebsystem zu installieren
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
- Starte den Rechner neu mit und warte auf das Autologin in das neue Nutzerkonto user0. 
> sudo shutdown -r now
- Verändere die Kontoeinstellungen nach deinen Wünschen (Hintegrundbild, evtl. Einstellungen in Programmen etc.).
- Öffne ein Terminal, logge dich als Benutzer mit root Rechten ein, speichere die momentanen Einstellungen des Kontos von user0 und starte den Rechner neu.
> su {user with admin rights}

> sudo /etc/init.d/resethomedir.sh save

> sudo shutdown -r now
- Viel Spaß mit deinem <b>Schulsystem</b>!

![schulsystem2](https://github.com/codekoch/schulsystem/blob/main/schulsystem.png)

## Alternative Installation des Schulsystems
- Lade unter https://schulsystem.org/images/schulsystem.iso ein fertiges Image (ca. 6.4 GB) herunter, das die oben erwähnte Installation bereits enthält.
- Erstelle ein Startmedium mit der heruntergeladenen iso-Datei  (z.B. mit https://www.ventoy.net/en/index.html).
- Die iso-Datei enhält sowohl eine Live- als auch eine Installtionsversion des Schulsystems.
- Der Datenträger für das Startmedium sollte mindestens 8GB Speicherplatz haben und mindestens USB 3.1 fähig sein.

## Hinweise zu Bedienung
### Grundlegende Hinweise
Grundlegende Hinweise zur Bedienung des Systems (Programaufruf, Bildschirmeinstellungen, Sound etc.) in der pdf-Datei unter https://github.com/codekoch/schulsystem/blob/main/Schulsystem_Basics.pdf zu finden.

### Bildschirmspiegelung / Remote Desktop Verbindung zwischen zwei Schulsystemen und anderen Systemen
![VNC](https://github.com/codekoch/schulsystem/blob/main/BildschirmTeilenEmpfangen.png)
- <b>Aktivierung</b> mit <b>Bildschirm teilen</b> (Wähle <b>Accept Connections</b> und klicke auf <b>OK</b>). 
- <b>Verbindung</b> mit <b>Bildschirm empfangen</b> (Gebe die <b>IP Adresse des anderen Schulsystems</b> ein).
- Logge dich mit <b>leerem Benutzernamen</b> und <b>leerem Passwort</b> ein (Veränderungen können in /etc/guacamole/user-mapping.xml vorgenommen werden).
- Verbinde dich mit jedem anderem System im selben Netzwerk über die Browseradresse http://\<IP-des-Schulsystems\>:8080.

### Speicherung und Wiederherstellung des Benutzerkontos samt aller Einstellungen / Save and load session 
- Abspeichern und Laden der aktuellen Nutzersitzung:

  ![saveloadsession](https://github.com/codekoch/schulsystem/blob/main/saveLoadSession.png)
  
  Das erste Abspeichern dauert einige Zeit, aber danach sollte es dank rsync ziemlich schnell gehen.
 
ACHTUNG: 
Benutze als externes Speichermedium am besten ein USB-Stick, der mindestens USB 3.1 unterstütz und im FAT32 Format formatiert wurde.
Der Name des Sticks sollte keine Sonderzeichen, Leerzeichen oder Umlaute enthalten.
Vergiss nicht den Stick auszuwerfen, bevor du ihn entfernst.

### SCHULSYSTEM-TO-GO
![SCHULSYSTEMTOGO](https://github.com/codekoch/schulsystem/blob/main/SCHULSYSTEMTOGO.png)
- Das Projekt <b>systemback</b> und der Fork <b>https://github.com/BluewhaleRobot/systemback</b> sind im Schulsystem integriert, so dass jederzeit ein Startmedium z.B. ein USB-Stick mit dem Abbild des laufenden Schulsystems erstellt werden kann. Dieses können Schüler und Schülerinnen z.B. mit nach Hause nehmen, um dort dieselben Arbeitsbedingungen wie in der Schule zu haben.
- Für die Erstellung ist allerdings ein user mit root-Rechten (Administratorrechten) und ein Medium mit ausreichend viel Speicherplatz (>= 8GB) nötig.
- Vor der Installation sollte das externe Medium nur eine einzige Partition mit FAT32 Formatiertung enthalten. Dies kann z.B. mit GParted errreicht werden.   
- Weitere Informationen sind unter https://wiki.ubuntuusers.de/Archiv/Systemback/ zu finden.

### Veränderungen permanent speichern, Selbstheilung aktivieren und deaktivieren
- Logge dich als user mit root-Rechten ein (z.B. per Terminal während einer Sitzung von user0) und gebe folgende Kommandos ein. 
    
    - > sudo /etc/init.d/resethomedir.sh save

        um Veränderungen permanent abzuspeichern 

    - > sudo /etc/init.d/resethomedir.sh deactivate

        um die Selbstheilung für den Useraccount user0 zu deaktivieren

    - > sudo /etc/init.d/resethomedir.sh activate

        um die Selbstheilung für den Useraccount user0 zu aktivieren
        
### Passwort für user0
- Der Selbstheilende Account hat den Benutzernamen <b>user0</b> und das Passwort <b>user0</b>. 

### Dateien zwischen mehrern System verteilen
Snapdrop ist eine gute kostenlose Alternative zu AirDrop und vor allem Betriebssystem unabhängig
https://snapdrop.net/

### Individuelle Veränderungen am System per Skript einspielen (siehe Datei <a href=https://github.com/codekoch/schulsystem/blob/main/individualFix.sh>individualFix.sh</a>)
- Logge dich als user mit root-Rechten ein (z.B. per Terminal während einer Sitzung von user0)
- Wechsle in das Verzeichnis, das das Github Repository des Schulsystems enthält und gebe den Befehl "git pull" ein
- 
oder 
- erzeuge ein neues Verzeichnis mit dem Github Repository des Schulsystems (git clone https://github.com/codekoch/schulsystem) und wechsle in das neue Verzeichnis (cd schulsystem)
- Installiere die Veränderung mit
> sudo ./individualFix.sh

