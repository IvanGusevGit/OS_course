#!/bin/bash

out_file=5.out

> $out_file

while true 
do 
	read s
	echo "$s" >> $out_file
	
	if [[ "$s" == "QUIT" ]]
	then 
		exit 0
	fi

	if [[ ! "$s" =~ [0-9]+ && "$s" != "+" && "$s" != "*" ]] 
	then 
		echo "Incorrect message"
		exit 1
	fi
done
