#!/usr/bin/bash

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。"
  exit 1
fi

IP=$1

sudo nmap -Pn -n -sV --open -p T:139,445,U:137 --script=smb-vuln*,smb-enum-users,smb-os-discovery --script-args unsafe -oN /home/kali/Lab/$IP/Vulns_SMB1.txt $IP

nmap -Pn -n -sV --open -p 139,445 --script=samba-vuln-cve-2012-1182 -oN /home/kali/Lab/$IP/Vulns_SMB2.txt $IP

nmap -Pn -n -sV --open -p 3389 --script=rdp-vuln-* -oN /home/kali/Lab/$IP/Vulns_RDP.txt $IP

nmap -Pn -n -sV --open -p 25,465,587 --script=smtp-commands,smtp-enum-users,smtp-ntlm-info,smtp-vuln* -oN /home/kali/Lab/$IP/Vulns_SMTP1.txt $IP

nmap -Pn -n -sV --open -p 1433 --script=ms-sql-dac,ms-sql-empty-password,ms-sql-info -oN /home/kali/Lab/$IP/Vulns_MSSQL.txt $IP 

nmap -Pn -n -sV --open -p 3306 --script=mysql-empty-password,mysql-vuln-cve2012-2122 -oN /home/kali/Lab/$IP/Vulns_MYSQL.txt $IP

nmap -Pn -n -sV --open -p 80,443 --script=http-vuln*,http-iis-webdav-vuln,http-shellshock,ssl-heartbleed,http-drupal-enum,http-drupal-enum-users,http-phpmyadmin-dir-traversal -oN /home/kali/Lab/$IP/Vulns_HTTP.txt $IP

nmap -Pn -n -sV --open -sV -p 111 --script=rpcinfo -oN /home/kali/Lab/$IP/Vulns_RPC.txt $IP

nmap -Pn -n -sV --open -p 111 --script=nfs-* -oN /home/kali/Lab/$IP/Vulns_NFS.txt $IP

nmap -Pn -n -sV --open -p 110 --script=pop3-capabilities,pop3-ntlm-info -oN /home/kali/Lab/$IP/Vulns_POP3.txt $IP

nmap -Pn -n -sV --open -p 21 --script=ftp-anon.nse,ftp-libopie,ftp-proftpd-backdoor,ftp-syst,ftp-vsftpd-backdoor,ftp-vuln-cve2010-4221 -oN /home/kali/Lab/$IP/Vulns_FTP.txt $IP

nmap -Pn -n -sV --open -p 143 --script=imap-capabilities,imap-ntlm-info,mysql-enum -oN /home/kali/Lab/$IP/Vulns_IMAP.txt $IP

sudo nmap -Pn -n -sU --open -p 161 --script=snmp-hh3c-logins --script-args creds.snmp=:public -oN /home/kali/Lab/$IP/Vulns_SNMP1.txt $IP 

sudo nmap -Pn -n -sU --open -p 161 --script=snmp-hh3c-logins --script-args creds.snmp=:private -oN /home/kali/Lab/$IP/Vulns_SNMP2.txt $IP

sudo nmap -Pn -n -sU --open -p 161 --script=snmp-info,snmp-interfaces,snmp-netstat,snmp-processes,snmp-sysdescr,snmp-win32-services,snmp-win32-shares,snmp-win32-software,snmp-win32-users -oN /home/kali/Lab/$IP/Vulns_SNMP3.txt $IP 

