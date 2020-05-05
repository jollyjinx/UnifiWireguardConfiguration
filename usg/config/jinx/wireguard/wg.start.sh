#!/bin/vbash
# 
# script is called during normal boot
#

#
# as long as wireguard can't be deleted when route-allowed-ips true is set
# we need to use this workaround to route between networks.
#

sudo /sbin/route add -net 192.168.2.0/24 wg0 

/bin/ping -c 1 192.168.2.1
