all: builddir/switcher builddir/ui

builddir:
	mkdir -p builddir

builddir/switcher: builddir switcher.c
	gcc -Wall -Werror switcher.c -o $@


builddir/Makefile:
	( cd builddir ; qmake ../ui/ui.pro )

builddir/ui: builddir builddir/Makefile ui/main.cpp ui/ui.pro
	make -C builddir


install: all
	mkdir -p $(INSTALL_ROOT)/opt/headphonefix/
	install -pm  755 switch.sh $(INSTALL_ROOT)/opt/headphonefix/
	install -pm 4755 builddir/switcher  $(INSTALL_ROOT)/opt/headphonefix/
	chmod +s $(INSTALL_ROOT)/opt/headphonefix/switcher

	mkdir -p $(INSTALL_ROOT)/usr/share/applications/
	install -pm 644 headphonefix.desktop $(INSTALL_ROOT)/usr/share/applications/

	mkdir -p $(INSTALL_ROOT)/usr/share/icons/hicolor/64x64/apps
	install -pm 644 headphonefix.png $(INSTALL_ROOT)/usr/share/icons/hicolor/64x64/apps

clean:
	rm -rf builddir

projclean: clean
	rm -rf debian/headphonefix/
	rm -rf debian/headphonefix.debhelper.log
	rm -rf debian/headphonefix.substvars
	rm -rf debian/files


.PHONY: ui
