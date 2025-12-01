#!/bin/bash

# Demander l'URL à l'utilisateur
read -p "Entrez l'URL du site à afficher en plein écran : " SITE_URL

# Vérifier que l'URL n'est pas vide
if [ -z "$SITE_URL" ]; then
    echo "Erreur : Entre une URL !"
    exit 1
fi

# Récupérer le nom de l'utilisateur courant
CURRENT_USER=$(whoami)
USER_HOME=$(eval echo ~$CURRENT_USER)

echo "Configuration pour l'utilisateur : $CURRENT_USER"
echo "URL configurée : $SITE_URL"
echo ""

# Création du script
mkdir -p ~/scripts
cat > ~/scripts/kiosk.sh << EOF
#!/bin/bash
sleep 10
#X11 var
export DISPLAY=:0
export XAUTHORITY=$USER_HOME/.Xauthority
# Disable screensaver
xset s off 2>/dev/null
xset -dpms 2>/dev/null
xset s noblank 2>/dev/null
#Hide mouse cursor
unclutter -idle 0.5 -root &
#Chrome
chromium --noerrdialogs --disable-infobars --kiosk --incognito --disable-session-crashed-bubble --disable-restore-session-state --password-store=basic --disable-features=TranslateUI $SITE_URL
EOF
chmod +x ~/scripts/kiosk.sh

# Configuration de l'autostart
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/kiosk.desktop << EOF
[Desktop Entry]
Type=Application
Name=Kiosk Mode
Exec=$USER_HOME/scripts/kiosk.sh
X-GNOME-Autostart-enabled=true
EOF

echo "Configuration terminée !"
echo "Le script de lancement est dans : $USER_HOME/scripts/kiosk.sh"
echo "Le fichier autostart est dans : $USER_HOME/.config/autostart/kiosk.desktop"
echo ""
echo "Redémarrez votre Raspberry Pi pour activer le mode kiosque."
