#!/bin/bash

if [[ $HOME == $PWD ]]
then
	echo $HOME
	exit 0
else
	echo "Working directory is not a HOME directory"
	exit 1
fi
