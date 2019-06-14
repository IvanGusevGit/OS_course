#!/bin/bash

file=7.out

echo $$ > $file

num=1
mode="wait"

add()
{
	mode="add"
}

multiply()
{
	mode="multiply"
}

stop()
{
	mode="stop"
}

trap 'add' USR1
trap 'multiply' USR2
trap 'stop' SIGTERM

echo $num

while true
do
    case $mode in
        "add")
            num=$(($num + 2))
            echo $num
            mode="wait"
            ;;
        "multiply")
            num=$(($num * 2))
            echo $num
            mode="wait"
            ;;
        "stop")
            echo "Stopped by SIGTERM signal"
            rm $file
            exit 0
            ;;
    esac
    
    sleep 1
done
