#!/usr/bin/env bash

iwconfig eth2 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

# Cut out relevant fields and modularised by base 10
essid=`nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d ':' -f2`
stngth=`nmcli -t -f active,ssid,signal dev wifi|grep yes|cut -d ':' -f3`
bars=`expr $stngth / 10`

case $bars in
  0)  bar='[----------]' ;;
  1)  bar='[+---------]' ;;
  2)  bar='[++--------]' ;;
  3)  bar='[+++-------]' ;;
  4)  bar='[++++------]' ;;
  5)  bar='[+++++-----]' ;;
  6)  bar='[++++++----]' ;;
  7)  bar='[+++++++---]' ;;
  8)  bar='[++++++++--]' ;;
  9)  bar='[+++++++++-]' ;;
  10) bar='[++++++++++]' ;;
  *)  bar='[UNKNOWN]' ;;
esac

wireless_icon=" "
echo $wireless_icon '' ${essid:0:3}...$bar

exit 0
