#!/bin/bash

date=$(date +"%F_%R")

report_file=~/report
test_directory=~/test

test_file=${test_directory}/$date

host=www.net_nikogo.ru

mkdir $test_directory && echo "catalog test was created successfully" > $report_file && touch $test_file

ping -c 1 $host || echo "Unable to make a connection to host: $host" >> ~/report
