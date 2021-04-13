#!/usr/bin/bash

read -p "IP > " IP
ls /root/Lab/$IP/sandbox

read -p "Exploit_name >" exploit_name

echo 'Windows?'
read input1

echo '32 bit? 32bit:x86/i386/i686/IA-32 64bit:x64/x86_64/x86-64/AMD64/IA-64/Intel 64'
read input2

flg1=0
flg2=0

while [ "flg1" = "0" -o "flg2" = "0" ]
do
   if [ -z $input1 ] ; then
      echo "Input Y or N"
   elif [ $input1 = 'Y' ] || [ $input1 = 'y' ] || [ $input1 = 'N' ]  || [ $input1 = 'n' ] ; then
      $flg1 = "1"
   fi
   if [ -z $input2 ] ; then
      echo "Input Y or N"
   elif [ $input1 = 'Y' ] || [ $input1 = 'y' ] || [ $input1 = 'N' ]  || [ $input1 = 'n' ] ; then
      $flg2 = "1"
   fi
done

if [ $input1 = 'Y' ] || [ $input1 = 'y' ] ; then
  if [ $input2 = 'Y' ] || [ $input1 = 'y' ] ; then
    i686-w64-mingw32-gcc /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.exe
  else
    x86_64-w64-mingw32-gcc /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.exe
  fi
fi

if [ $input1 = 'N' ] || [ $input1 = 'n' ] ; then
  if [ $input2 = 'Y' ] || [ $input1 = 'y' ] ; then
    gcc -m32 /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.elf  
  else
    gcc -m32 /root/Lab/$IP/sandbox/$exploit_name -o /root/Lab/$IP/sandbox/$exploit_name.elf  
  fi
fi

