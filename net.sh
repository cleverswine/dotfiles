#!/bin/bash

set -e

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "usage: ./net.sh ssid passphrase"
    exit 1
fi

# pp=$(wpa_passphrase $1 $2)
# part=${pp/*psk=/}
# psk=${part/??\}/}
# echo -e "\niface $1 inet dhcp\n\twpa-ssid $1\n\twpa-psk $psk" 

IW="wlp2s0"
# iwlist $IW scan | grep ESSID
wpa_passphrase $1 $2 | tee /etc/wpa_supplicant.conf
wpa_supplicant -B -c /etc/wpa_supplicant.conf -i $IW
dhclient $IW