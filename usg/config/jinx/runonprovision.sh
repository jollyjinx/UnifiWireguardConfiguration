#!/bin/bash

readonly logFile="/var/log/jinx-provision.log"

/bin/date >> ${logFile}
echo "runonprovision.sh started"

if [[ ! -e /config/scripts/post-config.d/start.sh ]];
then
	/bin/ln -s /config/jinx/start.sh /config/scripts/post-config.d/
	/config/scripts/post-config.d/start.sh >> ${logFile}
else
	/config/scripts/post-config.d/start.sh runonprovision >> ${logFile}
fi


source /opt/vyatta/etc/functions/script-template

configure >> ${logFile}
delete system task-scheduler task runonprovision  >> ${logFile}
commit >> ${logFile}
save >> ${logFile}



