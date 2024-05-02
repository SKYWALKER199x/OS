# Check if the user provided the filename and number of lines as arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <filename> <num_lines>"
    exit 1
fi

# Check if the file exists
if [ ! -f $1 ]; then
    echo "File '$filename' not found."
    exit 1
fi

# Count the total number of lines in the file
total_lines=$(wc -l < $1)

# Calculate the starting line number for tail
start_line=$(expr $total_lines - $2 + 1)

# Open the file for reading
exec < $1

# Read and print lines from the starting line
count=1
while read -r line; do
    if [ $count -ge $start_line ]; then
        echo $line
    fi
    count=$(expr $count + 1)
done