#! /bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)"
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R please run the script with root proivilages $N" | tee -a $LOG_FILE
        exit 1
    fi
}        

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 was $R not  sucessfull $N..look in to it.." | tee -a $LOG_FILE
        exit 1
    else
        echo "$2 was $G successfull $N" | tee -a $LOG_FILE
}

USAGE() {
    echo "usage:: sudo sh 16-redirectory.sh package1 package2.."
    exit 1
}

echo "script started executing at :: $(date)" | tee -a $LOG_FILE
CHECK_ROOT
if [ $# -eq 0 ]
then
    USAGE
fi


for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$pacakge  is not yet installled,lets install it!"  | tee -a $LOG_FILE
        dnf install $package -y
        VALIDATE $? "installinng $package"  
    else
        echo "$package is alredy installed no need to reinstall"  | tee -a $LOG_FILE
    fi
done