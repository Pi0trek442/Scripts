# How to Set a Web Page to Fullscreen

Tested on a Pi4
With Firefox's kiosk mode!

Beforehand, after running `raspi-config`, you need to modify the settings in the menu:

- Advanced Options > Wayland > Wayfire and apply.

This will cause the RPi to reboot and create the file `.config/wayfire.ini`.

You need to modify this file by adding the custom script.

After a reboot, everything should be set.

Additional Information: Chromium may cause errors.
