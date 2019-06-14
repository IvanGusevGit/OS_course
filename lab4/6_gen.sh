#!/bin/bash

file=6.out

while true
do
	read line
	case $line in
		TERM)
			kill -SIGKILL $(cat $file)
			exit 0
			;;
		*)
			continue
			;;
	esac
done

