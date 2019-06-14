#!/bin/bash

file=7.out

while true
do
    read s
    case $s in
        "+")
            kill -USR1 $(cat $file)
            ;;
        "*")
            kill -USR2 $(cat $file)
            ;;
        TERM)
            kill -SIGTERM $(cat $file)
            exit 0
            ;;
        *)
            continue
            ;;
    esac
done
