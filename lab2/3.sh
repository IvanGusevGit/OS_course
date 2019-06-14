#!/bin/bash

directory_path="/etc/"
output_file="emails.lst"

email_regex="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b"


grep -IPhors $email_regex $directory_path | sort | uniq -u > $output_file
