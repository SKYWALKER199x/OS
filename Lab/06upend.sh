for i in $*
do
	if [ -f $i ]
	then
		cat $i >> file
	else
		echo "are you want to include $i (Y/N)"
		read choice
		case $choice in
			Y)cat $i>>file ;;
			y)cat $i>>file ;;
			n);; 
			N);;
			*)echo "(Y/N)"
		esac
	fi
done 
cat file
exit



#!/bin/bash

# Check if at least one file name is provided as an argument
if [ $# -lt 1 ]; then
    echo "Usage: $0 <file1> [<file2> ...]"
    exit 1
fi

# Destination file for concatenation
destination_file=concatenated_file.txt

# Flag to track if there are non-file inputs
flag=no

# Check if all inputs are files, if not, ask user if they want to concatenate non-file inputs
for file in $@; do
    if [ ! -f $file ]; then
        flag=yes
        break
    fi
done

# If there are non-file inputs, ask the user if they want to concatenate them
if [ $flag = yes ]; then
    echo "Some of the inputs are not files. Do you want to append them? (yes/no)"
    read response
    if [ $response = yes ]; then
        # Concatenate all inputs, including non-file inputs
        for input in $@; do
            if [ -f $input ]; then
                cat $input >> $destination_file
            else
                echo "Appending non-file input: $input"
                echo $input >> $destination_file
            fi
        done
        echo "Files concatenated successfully. Output saved to '$destination_file'."
    else
for input in $@; do
            if [ -f $input ]; then
                cat $input >> $destination_file
fi
done
                echo "Files concatenated successfully. Output saved to '$destination_file"

    fi
else
    # Concatenate only the files
    for file in $@; do
        cat $file >> $destination_file
    done
    echo "Files concatenated successfully. Output saved to '$destination_file'."
fi