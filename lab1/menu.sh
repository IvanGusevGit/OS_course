#!/bin/bash

# Modifaiction:: add arguments to push them to program to open

echo "Enter \"1\" to open nano"
echo "Enter \"2\" to open vim"
echo "Enter \"3\" to open links"
echo "Enter \"4\" to exit"
while true;
do
	read number
	case $number in 
		1)
			nano $*
			;;
		2)
			vim $*
			;;
		3)
			links $*
			;;
		4)
			break
			;;
		*)
			echo "Undefined command detected"
			;;
	esac
done

