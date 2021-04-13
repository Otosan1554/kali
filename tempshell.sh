#!/usr/bin/bash
nmap -vv --reason -Pn -sV -p 80 --script='(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)' -oN /root/Lab/10.11.1.74/Scan/tcp_80_http_nmap.txt 10.11.1.74
sslscan --show-certificate --no-colour 10.11.1.74:80 2>&1 | sudo tee "/root/Lab/10.11.1.74/Scan/tcp_8080_sslscan.txt"
curl -sSik http://10.11.1.74:80/robots.txt -m 10 2>&1 | sudo tee "/root/Lab/10.11.1.74/Scan/tcp_80_http_robots.txt"
whatweb --color=never --no-errors -a 3 -v http://10.11.1.74:80 2>&1 | sudo tee "/root/Lab/10.11.1.74/Scan/tcp_80_http_whatweb.txt"
nikto -ask=no -h http://10.11.1.74:80 2>&1 | sudo tee "/root/Lab/10.11.1.74/Scan/tcp_80_http_nikto.txt"
ffuf -u http://10.11.1.74:80/FUZZ -t 10 -w /usr/share/seclists/Discovery/Web-Content/common.txt -e ".txt,.html,.php,.asp,.aspx,.jsp" -v -of csv -o "/root/Lab/10.11.1.74/Scan/tcp_80_http_ffuf.txt"
