#!/bin/bash

# Prüfen, ob das Skript als root ausgeführt wird
if [ "$EUID" -ne 0 ]; then
  echo "Bitte führe dieses Skript als root aus (z.B. sudo ./install_slax.sh)"
  exit
fi

echo "Aktualisiere Paketquellen und installiere Ansible..."
apt-get update
# bash-completion wird direkt mitinstalliert für die apt-Autovervollständigung
apt-get install -y ansible git bash-completion

echo "Starte das Slax-Playbook..."
# Das Playbook wird lokal ausgeführt
ansible-playbook -i "localhost," -c local playbook_slax.yml

echo "Installation abgeschlossen!"
echo "Bitte starte eine neue Terminal-Sitzung, damit die Autovervollständigung greift."
