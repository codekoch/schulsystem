#!/bin/bash
# install.sh
# Wrapper-Skript, um das Schulsystem von Null auf zu installieren.

# Bricht das Skript ab, wenn ein Fehler passiert
set -e

# --- KONFIGURATION FÜR DEN SCHÜLER-USER ---
# Welches Passwort soll user0 bekommen? (Standard: "schule")
KIOSK_CLEAR_PASS="schule"
# ------------------------------------------

echo "=========================================="
echo "   Schulsystem Installer v4 (Secure)"
echo "=========================================="

# 1. System vorbereiten
echo "[1/4] System-Update und Installation von Ansible/Python..."
sudo apt update -q
sudo apt install -y ansible openssl

# 2. Passwort abfragen (NUR ADMIN)
echo ""
echo "[2/4] Benutzer-Konfiguration"
echo "HINWEIS: Der Nutzer 'user0' erhält automatisch das Passwort: '$KIOSK_CLEAR_PASS'"
echo "Bitte geben Sie nun ein SICHERES Passwort für den Administrator 'linuxadmin' ein."
echo ""

while true; do
    read -s -p "Admin-Passwort: " ADMIN_PASS
    echo ""
    read -s -p "Admin-Passwort wiederholen: " ADMIN_PASS_CONFIRM
    echo ""
    
    if [ -z "$ADMIN_PASS" ]; then
        echo "Fehler: Das Passwort darf nicht leer sein."
    elif [ "$ADMIN_PASS" != "$ADMIN_PASS_CONFIRM" ]; then
        echo "Fehler: Die Passwörter stimmen nicht überein."
    else
        break
    fi
done

echo "Generiere Passwort-Hashes..."

# Python-Script zum Erzeugen der Hashes (SHA-512)
# Wir erzeugen zwei verschiedene Hashes (Admin via Eingabe, Kiosk via Variable)
ADMIN_HASH=$(openssl passwd -6 "$ADMIN_PASS")
KIOSK_HASH=$(openssl passwd -6 "$KIOSK_CLEAR_PASS")

# 3. Inventory Check
if [ ! -f "inventory" ]; then
    echo "[3/4] Erstelle temporäres Inventory..."
    echo "[computers]" > inventory
    echo "localhost ansible_connection=local" >> inventory
fi

# 4. Ansible Playbook starten
echo "[4/4] Starte Ansible Playbook..."
echo "      (Dauert je nach Internetverbindung 10-20 Minuten)"
echo "------------------------------------------"

# Wir übergeben BEIDE Hashes an das Playbook
ansible-playbook -i inventory playbook.yml -K \
  -e "admin_password_hash='$ADMIN_HASH'" \
  -e "kiosk_password_hash='$KIOSK_HASH'"

echo "=========================================="
echo "   INSTALLATION ABGESCHLOSSEN"
echo "   Admin: linuxadmin (Ihr Passwort)"
echo "   Kiosk: user0      (Passwort: $KIOSK_CLEAR_PASS)"
echo "   Bitte Rechner neu starten!"
echo "=========================================="
