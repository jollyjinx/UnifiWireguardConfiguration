#!/bin/vbash
source /opt/vyatta/etc/functions/script-template
export vyatta_sbindir=/opt/vyatta/sbin
if [ "$(id -g -n)" != 'vyattacfg' ] ; then
   exec sg vyattacfg -c "/bin/vbash $(readlink -f $0) $@"
fi
    
configure
set interfaces wireguard wg0 description plt-wireguard
set interfaces wireguard wg0 address 10.0.0.1/24
set interfaces wireguard wg0 listen-port 51820
set interfaces wireguard wg0 mtu 1412
set interfaces wireguard wg0 private-key 'MY PRIVATE KEY BASE64 ENCODED='
set interfaces wireguard wg0 route-allowed-ips true

#set interfaces wireguard wg0 firewall in name LAN_IN
#set interfaces wireguard wg0 firewall out name LAN_OUT
#set interfaces wireguard wg0 firewall local name LAN_LOCAL
#set interfaces wireguard wg0 firewall in ipv6-name LANv6_IN
#set interfaces wireguard wg0 firewall out ipv6-name LANv6_OUT
#set interfaces wireguard wg0 firewall local ipv6-name LANv6_LOCAL

set interfaces wireguard wg0 peer MY_OTHER_NETWORK_PUBLIC_KEY= allowed-ips 192.168.2.0/24
set interfaces wireguard wg0 peer MY_OTHER_NETWORK_PUBLIC_KEY = endpoint 'DYNDNSADDRESS.EXAMPLE.COM.:51820'
set interfaces wireguard wg0 peer MY_OTHER_NETWORK_PUBLIC_KEY = persistent-keepalive 60
commit
save
