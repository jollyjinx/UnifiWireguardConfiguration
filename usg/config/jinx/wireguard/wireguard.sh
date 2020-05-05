#!/bin/vbash
#
# script is called on startup with argument runonprovision if run after provision
# with no argument during normal boot.
#

echo "wireguard: script started"

cd /config/jinx/wireguard

if [[ ! -e /usr/bin/wg ]];
then
	echo "wireguard: not installed - installing"
	export DEBIAN_FRONTEND=noninteractive
	
	# https://github.com/WireGuard/wireguard-vyatta-ubnt
	sudo /usr/bin/dpkg -i ugw3-v1-v1.0.20200429-v1.0.20200319.deb
	
	# fix incorrect vyatta_sbindir 
	#for filename in /opt/vyatta/share/vyatta-cfg/templates/interfaces/wireguard/node.def \
	#				/opt/vyatta/share/vyatta-cfg/templates/interfaces/wireguard/node.tag/peer/node.def
	#do
	#	perl -i -pe 's#\$\{vyatta_sbindir\}/#/opt/vyatta/sbin/#g' $filename
	#done
else
	echo "wireguard: already installed, good"
fi


if [[ -e /usr/bin/wg ]];
then
	echo "wireguard: configuring"
	
	if [[ "$1" = "runonprovision" ]];
	then
		echo "wireguard: config commands"
		
		./wg.runonprovision.sh
	fi
	echo "wireguard: start commands"
	
	./wg.start.sh
	
	echo "wireguard: finished"
else	
	echo "wireguard: missing /usr/bin/wg"
fi
