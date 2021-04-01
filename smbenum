#!/usr/bin/bash

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。"
  exit 1
fi

IP=$1

enum4linux -a $IP > /home/kali/Lab/$IP/enum4linux.txt
nbtscan $IP >> /home/kali/Lab/$IP/enum4linux.txt
sudo nbtscan -r $IP >> /home/kali/Lab/$IP/enum4linux.txt
