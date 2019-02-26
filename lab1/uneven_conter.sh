#!/bin/bash

counter=0
number_regular='^[+-]?[0-9]+$'

while true;
do
	read number
	if ! [[ $number =~ $number_regular ]]
	then
		echo "$number is not an integer"
	else
		if [[ "$number%2" -eq 1 ]]
		then
			let counter=counter+1
		else
			break
		fi
	fi
done

echo $counter
