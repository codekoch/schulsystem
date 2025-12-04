![schulsystem](https://github.com/codekoch/schulsystem/blob/main/files/Logo_website.jpg)
# Schulsystem (v2.0) - Open Source Schulbestriebsystem
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![System: Linux](https://img.shields.io/badge/System-Xubuntu_22.04_LTS-blue.svg)](https://xubuntu.org/)
[![Management: Ansible](https://img.shields.io/badge/Management-Ansible-red.svg)](https://www.ansible.com/)

Das Projekt **Schulsystem** verwandelt eine Standard-Linux-Installation (bevorzugt Xubuntu LTS) in eine wartungsarme, robuste und datenschutzfreundliche Lernumgebung für Schulen.

Es wurde entwickelt, um Lehrkräften und Administratoren die Arbeit zu erleichtern, indem es das System nach jedem Neustart automatisch in einen sauberen Ursprungszustand zurücksetzt ("Selbstheilung").

> **Hinweis für Nutzer der alten Version:** Die ursprünglichen Shell-Skripte (`install.sh`, `software.sh`) und die Systemback-Integration sind im Branch `legacy-shell-scripts` archiviert. Die Version 2.0 setzt vollständig auf **Ansible** und moderne Imaging-Tools.

## ✨ Features

* **🔒 Selbstheilung (Kiosk-Modus):** Jeder Neustart setzt das Schüler-Profil (`user0`) auf einen definierten Standard zurück. Viren, verstellte Einstellungen oder gelöschte Icons sind nach einem Reboot Geschichte.
* **🚀 Performance & SSD-Schonung:** Dank intelligenter `rsync`-Technologie wird beim Reset nur die Differenz zurückgesetzt. Das beschleunigt den Bootvorgang massiv und schont die Schreibzyklen der Festplatten.
* **👁️ Veyon Integration:** Vorbereitet für das Klassenraum-Management mit Veyon (Bildschirmübertragung, Sperren, Demos).
* **💾 ISO-Erstellung:** Erstellen Sie jederzeit per Knopfdruck ein bootfähiges Installations-Image (ISO) Ihres fertig eingerichteten Systems (powered by *Penguin's Eggs*).
* **🐧 Datenschutz & Nachhaltigkeit:** Keine Telemetrie, kein Cloud-Zwang. Läuft hervorragend auf älterer Hardware (Upcycling).
* **🛠️ Infrastructure as Code:** Die gesamte Installation wird über ein Ansible-Playbook gesteuert.

## 📋 Voraussetzungen

* Ein PC/Laptop mit einer frischen Installation von **Xubuntu 22.04 LTS** (oder neuer).
* Internetverbindung während der Installation.
* Admin-Rechte (sudo).

## 🚀 Installation

Die Installation erfolgt nun vollautomatisch über Ansible. 

1.  **Git installieren:**
    Öffnen Sie ein Terminal auf dem frischen System und führen Sie aus:
    ```bash
    sudo apt update
    sudo apt install git -y
    ```

2.  **Repository klonen:**
    ```bash
    git clone [https://github.com/codekoch/schulsystem.git](https://github.com/codekoch/schulsystem.git)
    cd schulsystem
    ```

3.  **Installation starten:**
    ```bash
    sudo ./install.sh
    ```
    *Geben Sie bei Aufforderung Ihr `sudo`-Passwort ein.*

Das Skript installiert nun alle Softwarepakete (LibreOffice, Geogebra, Veyon, etc.), legt die Nutzer `linuxadmin` und `user0` an und richtet den Selbstheilungs-Mechanismus ein.

---

## 🛠️ Administration & Nutzung

### 1. Das System anpassen (Der "Save"-Befehl)
Da das System sich bei jedem Neustart zurücksetzt, gehen Änderungen am Desktop von `user0` normalerweise verloren. Um Änderungen (z.B. neues Hintergrundbild, Lesezeichen, Icons) dauerhaft zu speichern:

1.  Loggen Sie sich ganz normal als `user0` ein.
2.  Nehmen Sie alle gewünschten Änderungen vor.
3.  Öffnen Sie ein Terminal und führen Sie aus:
    ```bash
    sudo reset-kiosk.sh save
    ```
4.  Fertig! Dieser Zustand ist nun das neue "Standard-Template".

### 2. Ein ISO-Image erstellen
Möchten Sie den aktuellen Stand auf 30 andere Rechner klonen? Erstellen Sie einfach ein installierbares ISO:

1.  Führen Sie als Admin aus:
    ```bash
    sudo create-iso.sh
    ```
2.  Das fertige ISO finden Sie anschließend im Ordner `/home/eggs/`.
3.  Kopieren Sie das ISO auf einen USB-Stick (empfohlen: [Ventoy](https://www.ventoy.net)) und installieren Sie damit weitere Rechner.

### 3. Fernwartung (Optional)
Das System installiert automatisch einen OpenSSH-Server.
Um Software auf allen Rechnern im Netzwerk nachzuinstallieren, passen Sie einfach die Datei `inventory` an (tragen Sie dort die IP-Adressen der Schul-PCs ein) und lassen Sie das Playbook erneut laufen.

---

## 👤 Benutzerkonten

| Benutzer | Funktion | Passwort (Standard) | Besonderheit |
| :--- | :--- | :--- | :--- |
| **linuxadmin** | Administrator | *(wird bei Install gesetzt)* | Hat sudo-Rechte, Profil bleibt erhalten. |
| **user0** | Schüler / Lehrer | *(schule / auto-login)* | **Wird bei jedem Neustart zurückgesetzt!** |


## 📂 Struktur der Dateien

* `playbook.yml`: Die Hauptsteuerung der Installation (hier Software hinzufügen/entfernen).
* `files/reset-kiosk.sh`: Das Herzstück. Verwaltet den Reset und das Speichern.
* `files/create-iso.sh`: Wrapper für die ISO-Erstellung.
* `files/logo.jpg oder logo.png`: Das Standard-Hintergrundlogo.

## Lizenz

Dieses Projekt steht unter der [MIT Lizenz](LICENSE). Sie können es frei verwenden, verändern und an Ihrer Schule einsetzen.

---
*Entwickelt von [codekoch](https://github.com/codekoch).*
