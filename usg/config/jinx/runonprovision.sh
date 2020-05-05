#!/bin/bash

logger "runonprovision.sh called"

if [[ ! -e  /config/scripts/post-config.d/start.sh ]];
then
	/bin/ln -s /config/jinx/start.sh /config/scripts/post-config.d/
	/config/scripts/post-config.d/start.sh runonprovision |logger -t start.sh
fi

readonly logFile="/var/log/runonprovision.log"

source /opt/vyatta/etc/functions/script-template

configure >> ${logFile}
delete system task-scheduler task runonprovision  >> ${logFile}
commit >> ${logFile}
save >> ${logFile}



