#! /bin/bash

#set -ex #setting the automatic exit, if we get error, x for debug
failure(){
    echo "Failed at: $1:$2"
}
trap 'failure "${LINENO}" "$BASH_COMMAND" ' ERR #ERR is the error signal
echo "hello world...succsess"
echooo " hello world .. failure"
echo "hello world after failure.."