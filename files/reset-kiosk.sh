#!/bin/bash
# /usr/local/bin/reset-kiosk.sh
# Funktion: Kiosk-System Reset & Save-Management
# Autor: Codekoch

# --- KONFIGURATION ---
USER="user0"
HOME_DIR="/home/$USER"
TEMPLATE_DIR="/home/linuxadmin/TEMPLATE"
ADMIN_USER="linuxadmin"

# --- SICHERHEITSCHECK ---
if [ "$EUID" -ne 0 ]; then
  echo "FEHLER: Bitte als root ausführen (sudo)."
  exit 1
fi

# --- FUNKTION: RESTORE (Beim Booten) ---
do_restore() {
    echo "[RESTORE] Setze User $USER zurück..."
    
    if [ ! -d "$TEMPLATE_DIR" ]; then
        echo "FEHLER: Template nicht gefunden! Überspringe Restore."
        exit 1
    fi

    # 1. Prozesse killen (Sperren lösen)
    pkill -u $USER || true
    sleep 1

    # 2. RSYNC RESTORE
    # --delete: Löscht alles, was der Schüler neu erstellt hat
    rsync -a --delete --force "$TEMPLATE_DIR/" "$HOME_DIR/"

    # 3. Rechte & Fixes
    chown -R $USER:$USER "$HOME_DIR"
    
    # Desktop-Icons ausführbar machen (XFCE Security Policy)
    if [ -d "$HOME_DIR/Desktop" ]; then
        chmod +x "$HOME_DIR"/Desktop/*.desktop 2>/dev/null
    fi

    echo "[RESTORE] Abgeschlossen."
}

# --- FUNKTION: SAVE (Manuell durch Admin) ---
do_save() {
    echo "[SAVE] Speichere aktuellen Zustand von $USER in Template..."
    mkdir -p "$TEMPLATE_DIR"

    # 1. RSYNC SAVE (Datenmüll ausschließen)
    # Excludes verhindern, dass Cache, Verläufe oder ISO-Bau-Reste im Template landen
    rsync -av --delete \
      --exclude '.cache' \
      --exclude '.thumbnails' \
      --exclude '.bash_history' \
      --exclude '.lesshst' \
      --exclude '.viminfo' \
      --exclude '.sudo_as_admin_successful' \
      --exclude '.xsession-errors' \
      --exclude '.local/share/Trash' \
      --exclude '.local/share/zeitgeist' \
      --exclude '.dbus' \
      --exclude 'Downloads/*' \
      --exclude 'eggs/' \
      --exclude 'ISOS/' \
      "$HOME_DIR/" "$TEMPLATE_DIR/"

    # 2. Rechte anpassen
    # Der Ordner gehört dem Admin, der Inhalt user0 (für schnellen Restore)
    chown -R $ADMIN_USER:$ADMIN_USER "$TEMPLATE_DIR"
    chown -R $USER:$USER "$TEMPLATE_DIR"

    echo "[SAVE] Template erfolgreich aktualisiert."
}

# --- STEUERUNG ---
case "$1" in
    restore)
        do_restore
        ;;
    save)
        do_save
        ;;
    *)
        echo "Nutzung: sudo reset-kiosk.sh {restore|save}"
        exit 1
        ;;
esac
