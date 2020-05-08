#!/bin/bash
#
# this file patches wiregaurds node.def file for deleting
# the complete wireguard configuration in vyatta without error.
# which is needed for flawless provisioning
#

wireguardnodefile=/opt/vyatta/share/vyatta-cfg/templates/interfaces/wireguard/node.tag/peer/node.tag/allowed-ips/node.def

if [[ ! $(egrep '\|\| true$' ${wireguardnodefile}) ]];
then
    echo "patching wireguard node.def"
    script='BEGIN{$search='"'"'sudo ip route del "$ip" dev "$VAR(../../@)" 2> /dev/null'"'"';$append=" || true";}; s/\Q$search\E/$search$append/;'
 	echo "$script"
    perl -i -pe "$script" ${wireguardnodefile}                                     
fi                                                       
                                                       
                                                        
