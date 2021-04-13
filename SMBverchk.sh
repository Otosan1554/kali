#!/bin/sh
#Description:
# Requires root or enough permissions to use tcpdump
# Will listen for the first 7 packets of a null login
# and grab the SMB Version
#Notes:
# Will sometimes not capture or will print multiple
# lines. May need to run a second time for success.

if [ -z $1 ]; then echo "Usage: ./smbver.sh RHOST" && exit; else rhost=$1; fi
ifconfig
read -p "interface? >" int

#tcpdump -s0 -n -i $int src $rhost -A -c 7 2>/dev/null | grep -i "samba\|s.a.m" | tr -d '.' | grep -oP 'UnixSamba.*[0-9a-z]' | tr -d '\n' & echo -n "$rhost: " &
tcpdump -s0 -n -i $int src $rhost -A -c 7 2>/dev/null | grep -i "samba\|s.a.m" &
echo "exit" | smbclient -L $rhost 1>/dev/null 2>/dev/null
sleep 0.5 && echo ""



# SMB nmap Scripting Engine Vulnerability scan
nmap -p 139,445 $rhost -vv --script=smb-vuln-cve2009-3103.nse,smb-vuln-ms06-025.nse,smb-vuln-ms07-029.nse,smb-vuln-ms08-067.nse,smb-vuln-ms10-054.nse,smb-vuln-ms10-061.nse,smb-vuln-ms17-010.nse
