#!/bin/bash

task=./1.sh
file=~/report
at -f $task now + 1 minutes

tail -n 0 -f $file
