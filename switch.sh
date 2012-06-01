#!/bin/sh
lshal -u /org/freedesktop/Hal/devices/platform_soc_audio_0_sound_card_0_logicaldev_input | grep 'button.state.value = true'
if [ $? = 0 ]; then
    echo 'headphone -> speaker'
    /opt/headphonefix/switcher speaker
#    xxd -r >/dev/input/jack <<EOF
#0000000: bcc6 c74f 4f68 0200 0500 0200 0000 0000
#0000010: bcc6 c74f 6e68 0200 0500 0400 0000 0000
#0000020: bcc6 c74f 6e68 0200 0500 0600 0100 0000
#0000030: bcc6 c74f 6e68 0200 0000 0000 0000 0000
#EOF
    dbus-send --print-reply --dest=com.meego.core.MNotificationManager /notificationmanager com.meego.core.MNotificationManager.addNotification uint32:0 uint32:0 string:'device' string:'' string:'headphone → speaker' string:'' string:'icon-m-toolbar-done' uint32:0
else
    echo 'speaker -> headphone'
    /opt/headphonefix/switcher headphone
#    xxd -r >/dev/input/jack <<EOF
#0000000: 4ec7 c74f 1ea0 0a00 0500 0200 0100 0000
#0000010: 4ec7 c74f e2a4 0a00 0500 0400 0100 0000
#0000020: 4ec7 c74f 01a5 0a00 0500 0600 0000 0000
#0000030: 4ec7 c74f 01a5 0a00 0000 0000 0000 0000
#EOF
    dbus-send --print-reply --dest=com.meego.core.MNotificationManager /notificationmanager com.meego.core.MNotificationManager.addNotification uint32:0 uint32:0 string:'device' string:'' string:'speaker → headphone' string:'' string:'icon-m-toolbar-done' uint32:0
fi
