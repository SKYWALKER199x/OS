#!/bin/bash

# Check if the user provided the filename and number of lines as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <filename> <num_lines>"
    exit 1
fi

filename=$1

if [ ! -f $1 ]; then
    echo "File '$filename' not found."
    exit 1
fi

# Open the file for reading
exec < $1

# Read and print the specified number of lines
count=0
while read -r line && [ $count -lt $2 ]; do
    echo $line
    count=$(expr $count + 1)
done