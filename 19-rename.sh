#! /bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if they don't mention 3rd variavle it will tale 14 as default

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGGE(){
    echo -e "$R USAGE$N:: sh 19-rename.sh <source> <destination> <days(optional)>"
}

#check if the source and destinon is provided or not
if [ $# -lt 2 ]
then
    USAGE
fi  