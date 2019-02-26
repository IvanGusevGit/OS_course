#!/bin/bash

number_regular='^[+-]?[0-9]+$'

max=$1

for var in "$@"
do
        if ! [[ $var =~ $number_regular ]]
        then
                echo "Arguments are required to be integers"
                exit
        fi

        if [[ $var -gt $max ]] 
	then
                max=$var
        fi
done

echo $max





