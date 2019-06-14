#!/bin/bash

file_path="/etc/passwd"

awk -F ":" '{print $3 " " $1}' /etc/passwd | sort -n
