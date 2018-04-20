#!/bin/bash

set -euo pipefail

IW="wlp2s0"

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "./debiansu.sh ssid secret"
    exit 1
fi

cp -f /etc/network/interfaces /etc/network/interfaces-bk
pp=$(wpa_passphrase $1 $2)
part=${pp/*psk=/}
psk=${part/??\}/}
echo -e "auto $IW\niface lo inet loopback\niface $IW inet dhcp\n\twpa-ssid $1\n\twpa-psk $psk" > /etc/network/interfaces
ifup $IW
sleep 10

apt install xinit x11-xserver-utils i3 i3blocks vim git fonts-noto chromium sudo xcursor-themes
usermod -aG sudo knoone
# visudo