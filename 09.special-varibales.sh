#! /bin/bash

echo "All variables passed to  the script are: $@"
echo "Number of varaibles passwd: $#"
echo "script name: $0"
echo "current working directory: $pwd"  #SMALL CASES IS NOT WORKING ,WHY?
echo "current working directory: $PWD"
echo "home directory of current user: $home" #small cases not working 
echo "home directory of current user: $HOME"
echo "pid of script executing now: $$"
sleep 100 &
echo "pid of last background command: $!"
