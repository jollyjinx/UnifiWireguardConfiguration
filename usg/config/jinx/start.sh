#!/bin/bash
#   
# script beeing called with either runonprovision or with nothing on startup

readonly logFile="/var/log/jinx-start.log"

/bin/date >> ${logFile}
echo "start.sh started with argument: $1" >> ${logFile}


if [[ "$1" != "runonprovision" ]] && [[ -e /config/jinx/homeautomation/presencedetection.sh ]];
then
    nohup /config/jinx/homeautomation/presencedetection.sh >>${logFile} 2>&1 </dev/null &
fi


if [[ "$1" != "runonprovision" ]] && [[ -e /config/jinx/updatedyndns.sh ]];
then
    nohup /config/jinx/updatedyndns.sh >>${logFile} 2>&1 </dev/null &
fi


if [[ -e /config/jinx/wireguard/wireguard.sh ]];
then
    /config/jinx/wireguard/wireguard.sh "$1" >>${logFile} 2>&1 </dev/null
fi

