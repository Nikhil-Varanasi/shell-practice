#! /bin/bash

# LOGS_FOLDER= "/var/log/shell-script"
# SCRIPT_NAME= "$(echo $0 | cut -d "." -f1)"
# TIMESTAMP= $(date +%Y-%m-%d-%H-%M-%S)
# LOG_FILE= "$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

# echo $LOG_FILE

# /var/log/shell-script/echo 16-redirectories.sh | cut -d "." -f1 

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER