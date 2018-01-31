#!/bin/bash

RESULT="`wget -qO- --timeout=15 --tries=1 https://noc.dotmanaged.eu/api/list/all/ports_only/csv`"

/sbin/iptables -N noc-dotmanaged > /dev/null 2>&1
/sbin/iptables -A INPUT -j noc-dotmanaged > /dev/null 2>&1
/sbin/iptables -F noc-dotmanaged > /dev/null 2>&1

for line in $RESULT
do
    IFS=','
    lineArray=($line)
    ip=${lineArray[0]}
    mode=${lineArray[1]}
    p1=${lineArray[2]}
    p2=""
    if [ ${#lineArray[@]} -eq 3 ]; then
        # ban whole ip
        /sbin/iptables -A noc-dotmanaged -s $ip -j $mode
    else
        # ban port only
        p2=${lineArray[3]}
        /sbin/iptables -A noc-dotmanaged -s $ip -p $p1 --destination-port $p2 -j $mode
    fi
done
