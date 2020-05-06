# Wireguard Unifi Configuration

Here you find my unifi configuration scripts including wireguard. 

Problem with wireguard is, that when you have the configuration in config.gateway.json you no longer can upgrade the usg. With my setup that's not a problem as nothing will prevent the USG from booting. You can upgrad or even a reset USG and it can be adopted without problems.

The configuration on the uck (unifi cloud key) is just starting a script on the usg (unifi security gateway) in case it's present. This way I can upgrade my USG without fear as there is nothing preventing the usg to run fine even when nothing is installed on the usg.

On a clean UCK i copy the config-gateway.json to the correct place.
On a clean USG I scp the jinx directory to /config/jinx and I'm all set.

You have to do the same and additionally adopt the Wireguard configuration - you need to open the Wireguard port to be accepted by the usg in unifi and add the correct keys and network settings to usg/config/jinx/wireguard/wg.commands

