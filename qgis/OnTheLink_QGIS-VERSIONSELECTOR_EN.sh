#!/bin/bash

tput reset
selection=
until [ "$selection" = "2" ]; do
tput bold && tput setaf 46; echo "
OnTheLink QGIS-VERSIONSELECTOR
"
tput sgr0 && tput setaf 45; echo "
1 - Install update MUFU
2 - Exit to the QGIS-MENU
"
    tput setaf 6; echo -n "Enter selection: "
    read -r selection
    echo ""
case $selection in
    1 ) 
		sudo rm -rf /home/$USER/QgisStartEN.sh
		tput setaf 5; echo "Preparing to install QGIS with update MUFU"
        sudo curl -LO https://raw.githubusercontent.com/onthelink-tk/scripts/master/qgis/MUFU/Startup/QgisStartEN.sh
        sleep 2 ; sudo bash QgisStartEN.sh
        ;;
	2 ) 
		tput reset
		exit
		;;
    * ) 
        tput setaf 202; echo "Please enter choice 1 or 2..."
		sleep 1 ; tput reset
esac
done
