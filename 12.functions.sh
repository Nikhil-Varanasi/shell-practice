#! /bin/bash
USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "please run the script with root proivilages"
        exit 1
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 was not sucessfull..look in to it.."
        exit 1
    else
        echo "$2 was successfull"
    fi
}

dnf list installed git
if [ $? -ne 0 ]
then
    echo "git is not yet installled,lets install it!"
    dnf install git -y
    VALIDATE $? "installinng git"  
else
    echo "git is alredy installed no need to reinstall"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql was not installed ,lets install it"
    dnf install mysql -y
    VALIDATE $? "installinng mysql"
else
    echo "mysql was alredy installed.. nothing to do.." 
fi
