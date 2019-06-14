#!/bin/bash

path="/var/log"
output_file="errors.log"
pattern="ACPI"
file_pattern="^.*[[:alnum:]]\.[[:alpha:]]"

grep -EIhrs "$pattern" "$path" > $output_file

counter="0"

while read line
do
        current_file="$(echo $line | grep -Eo "$file_pattern")"

       	if [ -f "$current_file" ]
	then
		echo $current_file
		counter=$(echo "$counter+1" | bc -l)
	fi

done < $output_file

echo "Found files: $counter"


