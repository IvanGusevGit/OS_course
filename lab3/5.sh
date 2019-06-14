#!/bin/bash

output_file="output5.txt"

result=""

for pid in $(ps -A -o pid)
do
	status_file="/proc/"$pid"/status"
	sched_file="/proc/"$pid"/autogroup"

	sleepavg=$(grep -E -h -s -i "/autogroup-(.+)" $sched_file | grep -o "[0-9.]\+")
	
	if [[ -z $sleepavg ]]
	then 
		sleepavg=0
	fi

	ppid=$(grep -Ehsio "ppid:\s(.+)" $status_file | grep -o "[0-9]\+")

	if [[ -n $ppid ]]
	then 
		result=$result"ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Sleeping_Time="$sleepavg$'\n'
	fi
done

echo "$result" | sort -n -t "=" -k3 > $output_file
