#!/bin/vbash

#the following lines remove the runonprovision scheduled task
#do not modify below this line until 'end no edit'

logger "runonprovision called"

if [[ ! -e  /config/scripts/post-config.d/start.sh ]];
then
	/bin/ln -s /config/jinx/start.sh /config/scripts/post-config.d/
	/config/scripts/post-config.d/start.sh |logger -t start.sh
fi

readonly logFile="/var/log/runonprovision.log"

/config/jinx/wireguard/wireguard.sh >> ${logFile}

source /opt/vyatta/etc/functions/script-template

configure >> ${logFile}
delete system task-scheduler task runonprovision  >> ${logFile}
set interfaces ethernet eth0 pppoe 0 dhcpv6-pd prefix-only >> ${logFile}
commit >> ${logFile}
save >> ${logFile}



