#!/bin/bash

file=6.out

echo $$ > $file

count=0
mode="work"

handle() 
{ 
mode="stop" 
}

trap 'handle' SIGKILL

while true
do
    case $mode in
        "work")
            count=$(($count + 1))
            echo $count
            ;;
        "stop")
            echo "Stopped by SIGTERM signal"
            rm $file
            exit 0
            ;;
    esac
    sleep 1
done
