#!/usr/bin/bash

read -p "アンチウィルスを停止しましたか？"

echo "ソースリストの更新"
sudo apt -y update 

echo "Font 入れ替え"
sudo apt-get remove fonts-vlgothic
sudo apt-get install fonts-vlgothic

echo "geditの導入"
apt install gedit

echo "BackdoorFactoryの導入"
apt install backdoor-factory

echo "Metasploitの初期設定"
sudo systemctl start postgresql
echo "PostGreSQLの起動確認"
sudo msfdb init

echo "Searchsploitの更新"
sudo searchsploit -u

echo "ApacheをEnableにする"
sudo systemctl enable apache2

echo "VNC Viewerのインストール"
sudo apt-get install tigervnc-viewer

echo "Crowberのインストール"
sudo apt install crowbar

read -p "いったん確認"

echo "mingw　64の導入"
sudo apt install mingw-w64
sudo apt-get install gcc-multilib 

echo "ポート転送ツールの導入"
sudo apt install rinetd

echo "seclistsの導入"
sudo apt-get install seclists

echo "Powercatの導入"
sudo apt install powercat

echo "Empireの導入"
apt install empire

echo "Shelterのインストール"
sudo apt install shellter

read -p "いったん確認"

echo "sshサーバの自動起動設定"
sudo systemctl start ssh.service
sudo systemctl enable ssh

echo "niktoの導入"
apt install nikto

echo "pipの導入"
apt install python3-pip

echo "Autoreconの導入"
pip install git+https://github.com/Tib3rius/AutoRecon.git

echo "onetwopunchの導入"
rm /home/kali/onetwopunch.sh
cd /home/kali
git clone https://github.com/superkojiman/onetwopunch
cp /home/kali/onetwopunch/onetwopunch.sh /home/kali/onetwopunch.sh
rm -r /home/kali/onetwopunch
sudo chmod 777 /home/kali/onetwopunch.sh

read -p "いったん確認"

echo "windows-privsesc-checkの導入"
rm -r /usr/share/windows-privesc-check
cd /usr/share
git clone https://github.com/pentestmonkey/windows-privesc-check.git

echo "exifの導入"
sudo apt install exif

echo "bruteforce-http-authの導入"
cd /home/kali
git clone https://github.com/erforschr/bruteforce-http-auth.git
cd bruteforce-http-auth
python3 -m pip install -r requirements.txt

echo "parseroの導入"
apt install parsero

echo "Heartbleed exploitの導入"
cd /home/kali
git clone https://github.com/sensepost/heartbleed-poc.git

read -p "いったん確認"

echo "SMBexecの導入"
rm -r /home/kali/smbexec
git clone https://github.com/brav0hax/smbexec.git /home/kali/smbexec
cd smbexec
./install.sh

echo "Veilの導入"
apt install veil

echo "nishangの導入"
apt install nishang

echo "CMSmapの導入"
rm -r /home/kali/CMSmap
cd /home/kali
git clone https://github.com/Dionach/CMSmap

echo "Powersploitの導入"
apt install powersploit

echo "Apache配下にシンボリックリンクを作成"
cd /home/kali
ln -s /usr/share/windows-resources/ windows-resources 
mv windows-resouces /var/www/html/
ln -s /usr/share/windows-resources/ windows-resources 
mv windows-binaries /var/www/html/

echo "Easy-Pの導入"
cd /home/kali
rm -r /home/kali/Easy-P
git clone https://github.com/cheetz/Easy-P.git /home/kali/Easy-P

echo "gobusterの導入"
apt install gobuster

echo "次のブラウザアドオンを導入します"
echo "Web Developerアドオン"
echo "Tamper Data"
echo "Foxy Proxy"
echo "User Agent Switcher"
echo "Wappalyzer"

#echo "Discoverの導入"
#rm -r /home/kali/discover
#git clone https://github.com/leebaird/discover.git /home/kali/discover
#cd /home/kali/discover && ./update.sh

#echo "OpenVASのインストールと起動"
#apt install -y gvm 
#gvm-setup
#gvm-start


