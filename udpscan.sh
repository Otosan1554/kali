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

sudo nmap -n -Pn -sU -v --max-scan-delay 0.1 --max-retries 2 --version-intensity 0 -oA /home/kali/Lab/$IP/UDP_Portscan $IP
a=""
for x in $(grep "/udp" /home/kali/Lab/$IP/UDP_Portscan.nmap | cut -d "/" -f 1); do
	a=$a","$x
done
b=${a:1}
c="-p "$b

sudo nmap -n -Pn -sUV -v $c -A --max-scan-delay 0.1 --max-retries 2 --version-intensity 0 -oA /home/kali/Lab/$IP/UDP_sV_Portscan $IP
