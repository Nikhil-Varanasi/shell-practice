#! /bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if they don't mention 3rd variavle it will tale 14 as default

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE(){
    echo -e "$R USAGE$N:: sh 19-rename.sh <source> <destination> <days(optional)>"
}

#check if the source and destinon is provided or not
if [ $# -lt 2 ]
then
    USAGE
fi  

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exist...please chech"
fi

if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exist...please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "FILES::$FILES"

if [ ! -z $FILES ]
then
    echo "FILES FOUND"
else
    echo "No files found older then $DAYS"
fi