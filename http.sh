#!/usr/bin/bash
IP=$1

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。"
  exit 1
fi

grep tcp /home/kali/Lab/$IP/TCP_sV.nmap | grep open

rm tempshell.sh
touch tempshell.sh
echo "#!/usr/bin/bash" > tempshell.sh

read -p "port= " port
read -p "Protocol= " proto

while [ "$proto" != "" -a "port" != "" ]
do
   if [ "$proto" = "HTTP" -o "$proto" = "http" ]; then
      script1="#nmap -vv --reason -Pn -sV -p $port "
      script2="--script='(http* or ssl*) and not (brute or broadcast or dos or external or http-slowloris* or fuzzer)' -oN /home/kali/Lab/"
      script3="$IP/tcp_"$port
      script4="_http_nmap.txt "
      script=$script1$script2$script3$script4$IP
      echo $script
      echo $script >> tempshell.sh

      script1="sslscan --show-certificate --no-colour "$IP":"$port" 2>&1 | sudo tee "
      script2='"/home/kali/Lab/'
      script3="/tcp_"
      script4='_sslscan.txt"'
      script=$script1$script2$IP$script3$port$script4
      echo $script
      echo $script >>tempshell.sh
      
      script1="curl -sSik http://$IP:$port/robots.txt -m 10 2>&1 | sudo tee "
      script2='"/home/kali/Lab/'
      script3="/tcp_"
      script4='_http_robots.txt"'
      script=$script1$script2$IP$script3$port$script4
      echo $script
      echo $script >>tempshell.sh

      script1="whatweb --color=never --no-errors -a 3 -v http://"$IP":"$port" 2>&1 | sudo tee "
      script2='"/home/kali/Lab/'
      script3="/tcp_"
      script4='_http_whatweb.txt"'
      script=$script1$script2$IP$script3$port$script4
      echo $script
      echo $script >>tempshell.sh

      script1="nikto -ask=no -h http://"$IP":"$port" 2>&1 | sudo tee "
      script2='"/home/kali/Lab/'
      script3="/tcp_"
      script4='_http_nikto.txt"'
      script=$script1$script2$IP$script3$port$script4
      echo $script
      echo $script >>tempshell.sh

      script1="gobuster dir -u http://"
      script2="/ -w /usr/share/seclists/Discovery/Web-Content/common.txt -z -k -x "
      script3='"txt,html,php,asp,aspx,jsp" -o "/home/kali/Lab/'
      script4="/tcp_"
      script5='_http_gobuster.txt"'
      script=$script1$IP":"$port$script2$script3$IP$script4$port$script5
      echo $script
      echo $script >>tempshell.sh
   fi
   read -p "port= " port
   read -p "Protocol= " proto
done
sudo chmod 777 tempshell.sh
./tempshell.sh            


