#!/usr/bin/with-contenv bash
bashCmd='bash'
if [ "${PH_VERBOSE:-0}" -gt 0 ] ; then 
    set -x ;
    bashCmd='bash -x'
fi

# Early DNS Startup for the gravity list process to use
dnsmasq -7 /etc/dnsmasq.d

$bashCmd /start.sh
$bashCmd gravity.sh

# Done with DNS, let s6 services start up properly configured dns now
killall -9 dnsmasq