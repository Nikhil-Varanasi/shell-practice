#! /bin/bash
number=$1

if [ $number -gt 20 ] #gt, lt, eq, -ne,-ge,-le
then
    echo "Given number : $number is greaterthat 20"
else
    echo " given number : $number is lessthat 20"
fi 