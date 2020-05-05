#!/bin/sh

readonly logFile="/var/log/jinx-start.log"

cd /config/jinx/
#nohup /config/jinx/presencedetection.sh	>${logFile} 2>&1 </dev/null &
#nohup /config/jinx/updatedyndns.sh >/dev/null 2>&1 </dev/null &
#nohup /config/jinx/update-dhcpv6-pd.sh	>/dev/null 2>&1 </dev/null &
#nohup /config/jinx/update-ulas.sh >/dev/null 2>&1 </dev/null &
#nohup /config/jinx/updatedyndnsAndDHCPV6.sh >/dev/null 2>&1 </dev/null &
#nohup /config/jinx/arptest.sh >arpout.`date -Is`.out 2>&1 </dev/null &

/sbin/route add -net 192.168.2.0/24 wg0
/bin/ping -c 1 192.168.2.1

