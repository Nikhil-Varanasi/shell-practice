#! /bin/bash

USERID=$(id -u)               #id -u will id number alone
# echo "user id is : $USERID"    

if [ $USERID -ne 0 ]
then
    echo "please run this scritp with root privelages"
    exit 1
fi
#dnf install git -y

dnf list installed gittt
if [ $? -ne 0 ]
then
    echo "git is not yet installled,lets install it!"
    dnf install git -y
    if [$? -ne 0]
    then
        echo "git installtion was not successfull...check it"
        exit 1
    else
        echo "git installtion was successfull.."
    fi       
else
    echo "git is alredy installed no need to reinstall"
fi