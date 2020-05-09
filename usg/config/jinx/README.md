# /config/jinx directory

This directory contains all customisations for the USG

## runonprovsion.sh 

This script will be called whenever the USG will be provisioned.

## start.sh 

This script will be called with no argument at the end of the boot process and on provisioning with argument *runonprovision* 

## update-dhcpv6-pd.sh

This script fixes a cpu problem with the dhcpv6 prefix daemon occuring when you have pppoe running to get to the internet.

