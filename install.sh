#!/bin/bash
# install.sh
# Wrapper-Skript, um das Schulsystem von Null auf zu installieren.

# Bricht das Skript ab, wenn ein Fehler passiert
set -e

echo "=========================================="
echo "   Schulsystem Installer v2 (Ansible)"
echo "=========================================="

# 1. Prüfen, ob wir root sind (optional, aber gut für apt)
# Wir nutzen sudo vor den Befehlen, falls der User das Skript ohne sudo startet.

echo "[1/3] System-Update und Installation von Ansible/Git..."
sudo apt update
sudo apt install -y ansible git

# 2. Inventory Check
# Falls du vergessen hast, die inventory Datei mitzuliefern, erstellen wir sie temporär.
if [ ! -f "inventory" ]; then
    echo "[2/3] Keine Inventory-Datei gefunden. Erstelle temporäres Inventory für localhost..."
    echo "[computers]" > inventory
    echo "localhost ansible_connection=local" >> inventory
else
    echo "[2/3] Inventory Datei gefunden."
fi

# 3. Ansible Playbook starten
echo "[3/3] Starte Ansible Playbook..."
echo "      (Dauert je nach Internetverbindung 10-20 Minuten)"
echo "------------------------------------------"

# Wir nutzen '-K' (ask-become-pass), damit Ansible nach dem Sudo-Passwort fragt,
# falls es nötig ist. Wenn du das Skript schon mit 'sudo ./install.sh' gestartet hast,
# ist das Passwort meist gecacht oder nicht nötig, aber -K ist sicherer.
ansible-playbook -i inventory playbook.yml -K

echo "=========================================="
echo "   INSTALLATION ABGESCHLOSSEN"
echo "   Bitte Rechner neu starten!"
echo "=========================================="
