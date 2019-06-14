#!/bin/bash

output_file="output4.txt"

ps -A -o pid | awk '{ file="/proc/"$1"/statm"; getline f<file; close (file); split(f, a); print $1, ":", a[2]-a[3] }' | sort -r -n -t ":" -k2 > $output_file
