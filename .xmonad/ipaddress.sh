#!/bin/sh
# This script is to get IP address and print out
# Assumption: only 1 connected interface, either ethernet or wifi
# and not both
#

ip_addr=`ip -oneline -4 -br a | egrep UP | awk '{print $3}' | cut -d "/" -f1`
echo $ip_addr
