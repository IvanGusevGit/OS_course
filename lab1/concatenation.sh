#!/bin/bash

result=""

while true
do
	read line
	if [[ "$line" == "q" ]] 
	then
		break
	else
		result="${result}$line"
	fi
done

echo $result
