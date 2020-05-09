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

if [[ -n $(sudo ifconfig pppoe0 2>/dev/null) ]] && [[ "$1" != "runonprovision" ]] && [[ -e /config/jinx/update-dhcpv6-pd.sh ]];
then
    nohup /config/jinx/update-dhcpv6-pd.sh >>${logFile} 2>&1 </dev/null &
fi
    

if [[ -e /config/jinx/wireguard/wireguard.sh ]];
then
    /config/jinx/wireguard/wireguard.sh "$1" >>${logFile} 2>&1 </dev/null
fi

