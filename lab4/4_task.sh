#!/bin/bash

file="4_cycle.sh"

./${file}&pid1=$!
./${file}&pid2=$!

echo $pid1 $pid2

renice +10 $pid1

cpulimit -p $pid1 -l 20 

kill $pid1
kill $pid2
