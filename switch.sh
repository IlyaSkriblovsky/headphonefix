#!/bin/sh
lshal -u /org/freedesktop/Hal/devices/platform_soc_audio_0_sound_card_0_logicaldev_input | grep 'button.state.value = true'
if [ $? = 0 ]; then
    echo 'Speaker activated'
    /opt/headphonefix/switcher speaker
    dbus-send --print-reply --dest=com.meego.core.MNotificationManager /notificationmanager com.meego.core.MNotificationManager.addNotification uint32:0 uint32:0 string:'device' string:'' string:'Speaker activated' string:'' string:'icon-m-toolbar-done' uint32:0
else
    echo 'Headphones activated'
    /opt/headphonefix/switcher headphone
    dbus-send --print-reply --dest=com.meego.core.MNotificationManager /notificationmanager com.meego.core.MNotificationManager.addNotification uint32:0 uint32:0 string:'device' string:'' string:'Headphones activated' string:'' string:'icon-m-toolbar-done' uint32:0
fi
