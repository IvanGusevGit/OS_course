#!/bin/bash

directory="${1}/*"

file=$(file $directory | grep ' script' | cut -d : -f 1 | xargs -n 1 head -n 1 | sort | uniq -c | sort -n -r | head -n 1 | cut -d '!' -f 2)

echo "${file} => $(stat -c '%U' $file)"
