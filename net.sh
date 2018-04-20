#!/bin/bash

set -euo pipefail

if !(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` &>/dev/null); then
    IW="wlp2s0"

    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "./dotfiles/net.sh ssid secret"
        exit 1
    fi

    cp -f /etc/network/interfaces /etc/network/interfaces-bk
    pp=$(wpa_passphrase $1 $2)
    part=${pp/*psk=/}
    psk=${part/??\}/}
    echo -e "auto lo\niface lo inet loopback\niface $IW inet dhcp\n\twpa-ssid $1\n\twpa-psk $psk" > /etc/network/interfaces
    ifup $IW
    sleep 10
fi

