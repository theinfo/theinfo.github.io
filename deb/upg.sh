#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo -ne "[ ? ] Run this script whit sudo!"
	exit 1;
fi

# Add colors options & font text options
export ITALIC='\e[3m'
export B='\e[1m'
export DIM='\e[2m'
export UNDERLINE='\e[4m'
export BLINK='\e[5m'
export RESET_ALL='\e[0m'
export REVERSE='\e[7m' #(invert the foreground and background colors)
export HIDDEN='\e[7m' #(useful for passwords)

export COLOR_NC='\e[0m' # No Color
export COLOR_BLACK='\e[0;30m'
export COLOR_GRAY='\e[1;30m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_LIGHT_GRAY='\e[0;37m'
export COLOR_WHITE='\e[1;37m'

export V='2.4.1'

user_log=$(logname)

apt-get-update(){

	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Now update your system now\n"
	sudo apt-get update >/dev/null 2>&1 && echo -e "Update is [ ${COLOR_GREEN}Done${RESET_ALL} ]"
	sleep 2
	echo -e "\n"

}

apt-get-upgrade(){

	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Now upgrade your system now\n"
	sudo apt-get -y upgrade >/dev/null 2>&1 && echo -e "Upgrade is [ ${COLOR_GREEN}Done${RESET_ALL} ]"
	sleep 2
	echo -e "\n"

}

apt-update(){

	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Apt Now update you systems\n"
	sudo apt update >/dev/null 2>&1 && echo -e "Update is [ ${COLOR_GREEN}Done${RESET_ALL} ]"
	sleep 2
	echo -e "\n"

}

apt-upgrade(){
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Now upgrade your systems\n"
	sudo apt -y upgrade >/dev/null 2>&1 && echo -e "Upgrade is [ ${COLOR_GREEN}Done${RESET_ALL} ]"
	sleep 2
 	echo -e "\n"
}

dist-upgrade(){

	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Now dist-upgrade your systems\n"
	sudo apt-get -y dist-upgrade >/dev/null 2>&1 && echo -e "Dist-upgrade is [ ${COLOR_GREEN}Done${RESET_ALL} ]"
	sleep 2
	echo -e "\n"

}

full-upgrade(){

	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Now full-upgrade your systems\n"
	sudo apt -y full-upgrade >/dev/null 2>&1 && echo -e "Full-upgrade is [ ${COLOR_GREEN}Done${RESET_ALL} ]"
	sleep 2
	echo -e "\n"

}

apt-autoremove(){
	echo -e "[ ${COLOR_LIGHT_GREEN}+${RESET_ALL} ] Now cleaing your system.\n"
	sudo apt -y autoemove >/dev/null 2>&1 && echo -e "Cleaning up your system is [ ${COLOR_GREEN}Done${RESET_ALL} ]"
	sleep 2
	echo -e "\n"
}

thanks(){

	curl http://theinfogitlab.com/deb/serversystems.txt

	echo -e "\n\n Thanks, created by theinfogitlab.com\n\n"
	sudo apt-get --fix-broken install | grep 0
	sleep 5

}

if [[ $1 == "--upg" ]]; then

	/usr/bin/clear

	curl http://theinfogitlab.com/deb/theinfogitlab.txt

	echo -e "Updater Version: ${V} / Welcome ${user_log}. \n\n"
	echo -e "This script run apt-get update && upgrade"
	echo -e "This script run apt update && upgrade"
	echo -e "This script run apt-get dist-upgrade"
	echo -e "This script run apt full-upgrade"
	echo -e "This script run cleaning your systems whit apt autoremove"

	echo -e "\t\n Updater & upgrade your system?\n\n"


	read -p "Run this auto upg script? (Y/n):" YesNo


if [[ $YesNo =~ ^[Yy]$ ]]; then
    echo -e "\t\t\n\n ${BLINK}Running now${RESET_ALL}\n\n"

	sudo apt -a list --upgradable && echo -e "\n"

	apt-get-update;
	apt-get-upgrade;
	apt-update;
	apt-upgrade;
	dist-upgrade;
	full-upgrade;
	apt-autoremove;
	thanks;


elif [[ $YesNo  =~ ^[Nn]$ ]]; then
#    /usr/bin/clear
    echo -e "\n\n Ok, Well done..."
    exit 1;
else
	echo -e "\n\n You must answer Y or N!"
	exit 1;
fi
else
	echo -e "\n\n You must run - .sh --upg"
	exit 1;
fi

