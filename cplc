#!/usr/bin/bash

echo 'Windows?'
read input1

echo '32 bit?'
read input2

if [ -z $input1 ] ; then
  echo "Input yes or no."
  exit 1
fi

if [ -z $input2 ] ; then
  echo "Input yes or no."
  exit 1
fi

if [ $input1 = 'yes' ] || [ $input1 = 'YES' ] || [ $input1 = 'y' ] || [ $input1 = 'Y' ] ; then
  if [ $input2 = 'yes' ] || [ $input2 = 'YES' ] || [ $input2 = 'y' ] || [ $input2 = 'Y' ] ; then
    i686-w64-mingw32-gcc $1 -o $1.exe
  else
    x86_64-w64-mingw32-gcc $1 -o $2.exe
  fi
elif [ $input1 = 'yes' ] || [ $input1 = 'YES' ] || [ $input1 = 'y' ] || [ $input1 = 'Y' ] ; then
  if [ $input2 = 'yes' ] || [ $input2 = 'YES' ] || [ $input2 = 'y' ] || [ $input2 = 'Y' ] ; then
    gcc -m32 $1 -o $1.elf  
  else
    gcc -m32 $1 -o $1.elf  
  fi
fi
