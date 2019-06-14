#!/bin/bash

output_file="output3.txt"

ps ax -o pid,command | grep " /sbin/" 
