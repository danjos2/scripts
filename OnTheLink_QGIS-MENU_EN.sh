#!/bin/bash

tput clear
selection=
until [ "$selection" = "5" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-MENU | Version: 2.8.7 STABLE
"
tput sgr0 && tput setaf 45; echo -n "
==================================
>>>>>>>>"
tput setaf 191; echo -n "STANDALONE OPTIONS"
tput setaf 45; echo "<<<<<<<<
==================================
"
tput sgr0 && tput setaf 202; echo "
1 - Install/reïnstall/update QGIS
2 - Remove QGIS and restore settings
3 - Exit Script and install the auto remove files script
4 - Exit Script (RUN THIS ONE AFTER THE INSTALLATION)
5 - Exit Script normally (RUN THIS ONE IF YOU DIDN'T INSTALL STUFF)
6 - Install the terminal protection software
"
tput sgr0 && tput setaf 45; echo -n "
==================================
>>>>>>>>>"
tput setaf 191; echo -n "COMBINED OPTIONS"
tput setaf 45; echo "<<<<<<<<<
==================================
"
tput sgr0 && tput setaf 202; echo "
a - Install/reïnstall/update QGIS LATEST + copy script + Exit Script (1+4)
b - Install/reïnstall/update QGIS LATEST + Exit and install the auto remove files script (1+3)
c - Install/reïnstall/update QGIS LATEST + The terminal protection software + Exit and install the auto remove files script (FOR SCHOOLS) (REMOVES ALL FILES FOUND IN THE HOME DIR) (1+5+3)
d - Reïnstall auto remove files script + copy script
e - Reïnstall auto remove files script + copy script + The terminal protection software
f - Reïnstall copy script (this script makes it possible to save your files, should be automatically installed)
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
		tput setaf 5; echo "Preparing the QGIS-VERSIONSELECTOR..."
        sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
        sleep 2 ; bash OnTheLink_QGIS-VERSIONSELECTOR_EN.sh
        ;;
	2 ) 
		tput reset
		tput setaf 1; echo "Removing QGIS..."
		sudo flatpak uninstall --force-remove org.qgis.qgis
		sudo flatpak remote-delete --force org.qgis.qgis-origin
		sudo flatpak remote-delete --force org.qgis.qgis-1-origin
		sudo flatpak remote-delete --force org.qgis.qgis-2-origin
		sudo flatpak remote-delete --force org.qgis.qgis-3-origin
		sudo flatpak remote-delete --force org.qgis.qgis-4-origin
		sudo flatpak remote-delete --force org.qgis.qgis-5-origin
		sudo flatpak remote-delete --force org.qgis.qgis-6-origin
		sudo flatpak remote-delete --force org.qgis.qgis-7-origin
		sudo flatpak remote-delete --force org.qgis.qgis-8-origin
		sudo flatpak remote-delete --force org.qgis.qgis-9-origin
		sudo flatpak remote-delete --force org.qgis.qgis-10-origin
		sudo flatpak remote-delete --force flathub
		sudo flatpak uninstall --force-remove org.kde.Platform
		sudo flatpak uninstall --force-remove org.freedesktop.Platform.html5-codecs
		sudo flatpak uninstall --unused
		sudo apt-get --yes --assume-yes remove --purge flatpak
		sudo apt-get --yes --assume-yes clean
		sudo apt-get --yes --assume-yes autoremove --purge
		sudo apt-get --yes --assume-yes clean
		crontab -r
		sudo rm -rf /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf /etc/init.d/qgisremovefiles.sh
		chattr -i /run/user/1000/doc/by-app/org.qgis.qgis/
		chattr -i /home/$USER/org.qgis.qgis/
		sudo mv "/run/user/1000/doc/*" /tmp
		sudo mv "/run/user/1000/doc" /tmp
		sudo mv "/run/user/1000/flatpak-monitor/*" /tmp
		sudo mv "/run/user/1000/flatpak-monitor" /tmp
		sudo mv "/run/user/1000/app/*" /tmp
		sudo mv "/run/user/1000/app" /tmp
		sudo mv "/home/$USER/org.qgis.qgis/*" /tmp
		sudo mv "/home/$USER/org.qgis.qgis" /tmp
		tput reset
		;;
	3 ) 
		sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	4 ) 
		sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		tput reset
		exit
		;;
    5 ) 
        	sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		tput reset
		exit
		;;
    6 ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/.bashrc > /home/$USER/.bashrc
		tput setaf 2; echo "Terminal protection script has been installed!"
		sleep 2
		tput reset
		;;
	a ) 
		sudo rm -rf QgisStartEN.sh
		tput setaf 5; echo "Preparing your combination..."
		sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Startup/QgisStartEN.sh
		sleep 2 ; sudo bash QgisStartEN.sh
		sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	b ) 
		sudo rm -rf QgisStartEN.sh
		tput setaf 5; echo "Preparing your combination..."
		sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Startup/QgisStartEN.sh
		sleep 2 ; sudo bash QgisStartEN.sh
		sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	c ) 
		sudo rm -rf QgisStartEN.sh
		tput setaf 5; echo "Preparing your combination..."
		sudo curl -LO https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Startup/QgisStartEN.sh
		sleep 2 ; sudo bash QgisStartEN.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/.bashrc > /home/$USER/.bashrc
		tput setaf 2; echo "Terminal protection script has been installed!"
		sleep 2
		sudo rm -rf "qgis/"
		sudo rm -rf "QgisStartNL.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_NL.sh"
		sudo rm -rf "QgisStartEN.sh"
		sudo rm -rf "OnTheLink_QGIS-MENU_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_EN.sh"
		sudo rm -rf "OnTheLink_QGIS-VERSIONSELECTOR_NL.sh"
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	d ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	e ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgisremovefiles.sh
		sudo cp -f qgisremovefiles.sh /etc/init.d/qgisremovefiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgisremovefiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		sudo rm -rf "qgisremovefiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		crontab -l | { cat; echo "@reboot /bin/bash /etc/init.d/qgisremovefiles.sh"; } | crontab - 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/.bashrc > /home/$USER/.bashrc
		tput setaf 2; echo "Terminal protection script has been reïnstalled!"
		sleep 2
		tput reset
		exit
		;;
	f ) 
		sudo curl -LOs https://raw.githubusercontent.com/onthelink-nl/scripts/Testing/qgis/MUFU/Modified/qgiscopyfiles.sh
		sudo cp -f qgiscopyfiles.sh /etc/init.d/qgiscopyfiles.sh
		sudo chmod +x /etc/init.d/qgiscopyfiles.sh
		sudo rm -rf "qgiscopyfiles.sh"
		crontab -r
		crontab -l | { cat; echo "* * * * * /bin/bash /etc/init.d/qgiscopyfiles.sh"; } | crontab - 
		tput reset
		exit
		;;
	* ) 
        tput setaf 202; echo "Please enter standalone choice 1, 2, 3, 4, 5, 6 or combined choice a, b or c..."
		sleep 1 ; tput reset
esac
done
