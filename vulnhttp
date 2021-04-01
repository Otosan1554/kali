#!/usr/bin/bash

if [ $# -ne 2 ]; then
  echo "指定された引数は$#個です。"
  exit 1
fi

IP=$1
p=$2

nmap -Pn -n -sV --open -p $p --script=http-vuln*,http-iis-webdav-vuln,http-shellshock,ssl-heartbleed,http-drupal-enum,http-drupal-enum-users,http-phpmyadmin-dir-traversal -oN /home/kali/Lab/$IP/Vulns_HTTP.txt $IP

