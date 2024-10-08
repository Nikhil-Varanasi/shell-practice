#! /bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if they don't mention 3rd variavle it will tale 14 as default
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

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
    exit 1
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
#echo "Files: $FILES"

# if [ -n "$FILES" ]
# then
#     echo "files are found"
# else
#     echo "No files older that $DAYS"
# fi

if [ ! -z "$FILES" ] #true if FILES is empty, ! nakes it expression false
then
    echo "FILES FOUND"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

    #check if zip file successfull created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Successfull zipped files older that $DAYS"
        #remove the files after zipping
        while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "zipping the files  was failed"
        exit 1
    fi        
else
    echo "No files found older then $DAYS "
fi