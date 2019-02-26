#!/bin/bash

if [[ $# -ne 2 ]]
then
	echo "Expected 2 argument, actual is $#"
else
	if [[ "$1" == "$2" ]]
	then
		echo "String are equal"
	else
		echo "Strings are not equal"
	fi
fi
