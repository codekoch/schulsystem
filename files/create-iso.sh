#!/bin/bash
# /usr/local/bin/create-iso.sh
# Erstellt ein ISO vom laufenden System

if [ "$EUID" -ne 0 ]; then
  echo "Bitte als root ausführen (sudo)."
  exit 1
fi

echo "=== SCHULSYSTEM ISO CREATOR ==="
echo "Erstelle bootfähiges Image..."

# Caches leeren, um ISO klein zu halten
apt-get clean

# Eggs konfigurieren (falls erster Lauf)
eggs dad -d 2>/dev/null

# ISO erstellen (fast compression, clone user data)
eggs produce --fast --clone

echo ""
echo "FERTIG. Die ISOs liegen unter /home/eggs/"
