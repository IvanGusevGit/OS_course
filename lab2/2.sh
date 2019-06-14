#!/bin/bash

file_path="/var/log/Xorg.0.log"
output_file="full.log"

(grep -E "\] \(II\)" $file_path & grep -E "\] \(WW\)" $file_path) | sed -e "s/(II)/(Information)/g" | sed -e "s/(WW)/(Warning)/g"
# cat $output_file
