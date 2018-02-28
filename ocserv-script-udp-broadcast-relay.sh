#!/bin/bash

function getDev()
{
    dev="eth0"
    for ((t=0; t < 16; t++))
    do
        ifconfig vpns${t} &> /dev/null && dev="${dev} vpns${t}"
    done
    echo ${dev}
}

if [ -z "$BCPort" ]; then
	BCPort=3801
fi

killall udp-broadcast-relay
udp-broadcast-relay -f 1 $BCPort $(getDev)