#!/bin/vbash

cd /config/jinx/wireguard
# cd `dirname $0`

echo "wireguard: script started"

if [[ ! -e /usr/bin/wg ]];
then
	echo "wireguard: not installed - installing"
	export DEBIAN_FRONTEND=noninteractive
	
	# https://github.com/WireGuard/wireguard-vyatta-ubnt
	# sudo /usr/bin/dpkg -i wireguard-ugw3-1.0.20200401-1.deb </dev/null
	# sudo /usr/bin/dpkg -i wireguard-ugw3-0.0.20191219-2.deb </dev/null
	sudo /usr/bin/dpkg -i ugw3-v1-v1.0.20200429-v1.0.20200319.deb
	
else
	echo "wireguard: already installed, good"
fi

if [[ -e /usr/bin/wg ]];
then
	echo "wireguard: configuring"

	./wg.commands

else
	echo "wireguard: missing "
fi
echo "wireguard: finished"
	


