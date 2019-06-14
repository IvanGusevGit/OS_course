#!/bin/bash

output_file="output6.txt"
input_file="output5.txt"

previous_ppid=0
previous_sleepavg=0
counter=0

return_value=""

while read line
do
	if [[ -n $line ]]
		then
			current_ppid=$(echo $line | grep -Ehsio "Parent_ProcessID=[0-9]+" | grep -o "[0-9]\+")
			current_sleepavg=$(echo $line | grep -Ehsio "Average_Sleeping_Time=[0-9.]+" | grep -o "[0-9.]\+")

			if [[ $previous_ppid == $current_ppid ]]
			then 
				previous_sleepavg=$(echo "$previous_sleepavg+$current_sleepavg" | bc -l)
				counter=$(echo "$counter+1" | bc -l)
			else
				previous_sleepavg=$(echo "$previous_sleepavg/$counter" | bc -l)
	
				if [[ -n $return_value ]]
				then
					return_value=$return_value"Average_Sleeping_Children_of_ParentID="$previous_ppid" is "$previous_sleepavg$'\n'
				fi

				previous_sleepavg=$current_sleepavg
				previous_ppid=$current_ppid
				counter=1
			fi

			return_value=$return_value$line$'\n'
	fi

done < $input_file

previous_sleepavg=$(echo "$previous_sleepavg/$counter" | bc -l)

if [[ -n $return_value ]]
then
	return_value=$return_value"Average_Sleeping_Children_of_ParentID="$previous_ppid" is "$previous_sleepavg$'\n'
fi

echo "$return_value" > $output_file
