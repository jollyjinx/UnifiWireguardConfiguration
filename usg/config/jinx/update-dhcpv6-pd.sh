#!/bin/bash

debug=false	
#debug=true	

outputfile=/dev/stdout
#outputfile=/var/log/dyndns.log

currentipv6address() { 
    local interface=$(ip -6 route |awk '/^default/ {print $5}')                                      
    local addrs=$(ip -6 route |perl -ne '@a=split(/\s+/); print $a[0] if @a[2] eq "'${interface}'";')
    echo "$addrs"
}                                


lastaddress='none'

while true
do
      	if ping6 -c 1 www.google.de 2>&1 >|/dev/null
	then
		$debug && echo "ivp6 OK"
   		currentaddress=$(currentipv6address)
   		if [[ $currentaddress != $lastaddress ]];
   		then
	      	        $debug && echo "IPv6 address changed from: $lastaddress to $currentaddress"
   			sudo service radvd restart
   		fi
   		lastaddress=$currentaddress
	else
		$debug && echo "No IPV6"
		#renew dhcpv6-pd interface eth0
		#/opt/vyatta/sbin/dhcpv6-pd-client.pl --ifname=pppoe0 --renew
	fi
	sleep 30
done
