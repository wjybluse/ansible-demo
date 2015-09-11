#!/bin/bash

BASEDIR=$(cd "$(dirname "$0")"; pwd)

cd $BASEDIR

cmd=`cat config.ini |xargs sh -x ./upload.sh`

if [ $? -ne 0 ]; then
    echo $cmd
    exit 1
fi
echo $cmd

[vagrant@vagrant-centos65 test]$ cat upload.sh
#!/bin/bash
BASEDIR=$(dirname $0)
HOST=$1
PORT=$2
USER=$3
PASSWORD=$4
LOCAL_PATH=$5
REMOTE_PATH=$6
if [ "X$HOST" = "X" ]; then
   echo "host cannot be empty!"
   exit 1
fi

if [ "X$PORT" = "X" ]; then
   PORT=22
fi


ftp -v -n $HOST << EOF
user $USER $PASSWORD
binary
cd $LOCAL_PATH
lcd $REMOTE_PATH
prompt
mput *
close
bye
EOF

if [ $? -ne 0 ]; then
   echo "back up failed"
   exit 1
fi
