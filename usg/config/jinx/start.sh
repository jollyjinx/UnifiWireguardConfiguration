#!/bin/vbash

readonly logFile="/var/log/jinx-start.log"

echo "start.sh started with argument: $1" >> ${logFile}


if [[ -e /config/jinx/wireguard/wireguard.sh ]];
then
	/config/jinx/wireguard/wireguard.sh "$1" >> ${logFile}
fi

if [[ -e /config/jinx/homeautomation/presencedetection.sh ]];
then
	/config/jinx/homeautomation/presencedetection.sh >> ${logFile}
fi

if [[ -e /config/jinx/updatedyndns.sh ]];
then
	/config/jinx/updatedyndns.sh >> ${logFile}
fi
