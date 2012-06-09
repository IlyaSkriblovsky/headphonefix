switcher: switcher.c
	gcc -Wall -Werror $< -o $@

install: switcher
	mkdir -p $(INSTALL_ROOT)/opt/headphonefix/
	install -pm  755 switch.sh $(INSTALL_ROOT)/opt/headphonefix/
	install -pm 4755 switcher  $(INSTALL_ROOT)/opt/headphonefix/
	chmod +s $(INSTALL_ROOT)/opt/headphonefix/switcher

	mkdir -p $(INSTALL_ROOT)/usr/share/applications/
	install -pm 644 headphonefix.desktop $(INSTALL_ROOT)/usr/share/applications/

	mkdir -p $(INSTALL_ROOT)/usr/share/icons/hicolor/64x64/apps
	install -pm 644 headphonefix.png $(INSTALL_ROOT)/usr/share/icons/hicolor/64x64/apps

clean:
	rm -f switcher

projclean: clean
	rm -rf debian/headphonefix/
	rm -rf debian/headphonefix.debhelper.log
	rm -rf debian/headphonefix.substvars
	rm -rf debian/files
