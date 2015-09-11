#!/bin/bash

BASEDIR=$(cd "$(dirname "$0")"; pwd)

cd $BASEDIR

cmd=`cat config.ini |xargs sh -x ./upload.sh`

if [ $? -ne 0 ]; then
    echo $cmd
    exit 1
fi
