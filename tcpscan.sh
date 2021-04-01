#!/usr/bin/bash
IP=$1

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。"
  exit 1
fi

if [ -d /home/kali/Lab/$IP/ ]; then
	echo ""
else
	mkdir /home/kali/Lab/$IP
fi

sudo nmap -n -Pn -sS -p- -v -T 4 -oN /home/kali/Lab/$IP/TCP_Portscan.nmap $IP
a=""
for x in $(grep "/tcp" /home/kali/Lab/$IP/TCP_Portscan.nmap | cut -d "/" -f 1); do
	a=$a","$x
done
b=${a:1}
c="-p "$b

echo $c

nmap -n -Pn -sV -v $c -T 4 -A -oN /home/kali/Lab/$IP/TCP_sV.nmap $IP



