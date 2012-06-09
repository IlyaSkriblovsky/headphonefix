TEMPLATE = subdirs

SUBDIRS = switcher ui


switchscript.files = switch.sh
switchscript.path = /opt/headphonefix/
INSTALLS += switchscript

desktop.files = headphonefix.desktop
desktop.path = /usr/share/applications/
INSTALLS += desktop

icon.files = headphonefix.png
icon.path = /usr/share/icons/hicolor/64x64/apps
INSTALLS += icon
