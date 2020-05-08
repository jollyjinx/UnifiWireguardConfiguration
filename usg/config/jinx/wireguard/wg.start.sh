#!/bin/vbash
# 
# script is called during normal boot
#

#sudo /sbin/route add -net 192.168.2.0/24 wg0 
#sudo /sbin/route add -net 10.98.0.0/16 wg0

/bin/ping -c 1 192.168.2.1
