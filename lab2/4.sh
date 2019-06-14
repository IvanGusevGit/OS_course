#!/bin/bash

script_pattern="#!"
prefix="#!"
grep -Ehso  $script_pattern  /bin/* | sort | uniq -c | sort -rn | head -1 | awk '{$1=""}1' | cut -d '!' -f 2

