#!/bin/bash

user="ivan"
output_file="output1.txt"

ps a -u $user o pid,command | sed -r "s/\s*([0-9]+)\s(.+)$/\1:\2/" > $output_file

