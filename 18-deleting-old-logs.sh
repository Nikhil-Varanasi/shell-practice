#! /bin/bash

SOURCE_DIR=/home/ec2-user/logs
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR $G exist $N"
else
    echo -e "$SOURCE_DIR $G does not exist $N"
    exit 1
fi

