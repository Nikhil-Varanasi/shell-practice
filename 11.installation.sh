#! /bin/bash

USERID=$(id -u)               #id -u will id number alone
echo "user id is : $USERID"    

if [ $USERID -ne 0 ]
then
    echo "please run this scritp with root privelages"
fi
#dnf install git -y
