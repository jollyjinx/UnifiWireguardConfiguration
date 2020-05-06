# Jolly's UniFi and Wireguard Configuration

Here you find my UniFi configuration scripts including Wireguard. 

Problem with Wireguard is, that when you have the configuration in config.gateway.json you no longer can upgrade the USG and when you have setup Wireguard between two sites you can't even provision any more. 

That's why I created my own setup for running Wireguard on UniFi. Nothing will prevent the USG from booting. You can upgrade or even reset a USG and it can be adopted without problems.

The configuration on the UCK (UniFi Cloud Key) is just starting a script on the USG (UniFi Security Gateway) in case it's present. This way I can upgrade my USG without fear as there is nothing preventing the usg to run fine even when nothing - not even the scripts - are present on the USG.

## What you need to do

- adopt the Wireguard configuration *wg.runonprovision.sh* and *wg.start.sh* inside *usg/config/jinx/wireguard/* to your settings.
- copy the *uck/sites/default/config-gateway.json* inside the uck directory to the correct place on your UCK
- change firewall settings for to allow the USG to accept Wireguard traffic.

The last step will get the USG provisioned and Wireguard should run then.

