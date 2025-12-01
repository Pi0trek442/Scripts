On place le script dans `~/scripts/kiosk.sh`

Mise à jour du Rpi 4 - 8GB ici :

```
sudo apt update && sudo apt upgrade -y
```

On va installer Unclutter pour supprimer le curseur et util-linux-extra.
=> En effet, hwclock n'est pas installé de base avec la version Trixie 13.

```
sudo apt install unclutter util-linux-extra -y
```

On va ajouter indiquer à notre Rpi quel module RTC on utilise en l'ajoutant à boot/firmware/config.txt

```
echo "dtoverlay=i2c-rtc,ds3231" | sudo tee -a /boot/firmware/config.txt
```

Un reboot

```
sudo reboot
```

On récupère l'heure, on l'écrit.

```
sudo /sbin/hwclock -r
sudo /sbin/hwclock -w
sudo systemctl enable systemd-timesyncd
```
