#!/bin/bash

#debug=true	
debug=false	
outputfile=/dev/stdout
#outputfile=/var/log/dyndns.log
while true
do
      	if ping6 -c 1 www.google.de 2>&1 >|/dev/null
	then
		$debug && echo "ivp6 OK"
	else
		$debug && echo "No IPV6"
		#renew dhcpv6-pd interface eth0
		/opt/vyatta/sbin/dhcpv6-pd-client.pl --ifname=pppoe0 --renew
	fi
	sleep 30
done
