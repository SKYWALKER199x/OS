create_file() {
    echo "Enter the file name:"
    read filename
    echo "Enter the content for the file. Press Ctrl+D when done:"
    cat >"$filename"
    echo "File created successfully: $filename"
}

tail_n() {
    echo "Enter the file name:"
    read filename
    echo "Enter the number of lines:"
    read num_lines
    echo "Contents of the last $num_lines lines of $filename:"
    tail -n "$num_lines" "$filename"
}

tail_c() {
    echo "Enter the file name:"
    read filename
    echo "Enter the number of bytes:"
    read num_bytes
    echo "Contents of the last $num_bytes bytes of $filename:"
    tail -c "$num_bytes" "$filename"
}

tail_q() {
    echo "Enter the file names separated by spaces:"
    read -a files
    for file in "${files[@]}"; do
        echo "Contents of the file $file:"
        cat "$file"
    done
}

tail_v() {
    echo "Enter the file name:"
    read filename
    echo "Contents of the file $filename:"
    cat "$filename"
}

tail_z() {
    echo "Enter the file name:"
    read filename
    echo "Enter the number of lines:"
    read num_lines
    echo "Contents of the last $num_lines lines of $filename:"
    tr '\0' '\n' <"$filename" | tail -n "$num_lines"
}

while true; do
    echo "1. Create a new file"
    echo "2. tail -n : Specifies the number of lines to be displayed."
    echo "3. tail -c : Specifies the number of bytes to be displayed."
    echo "4. tail -q : Quiet mode. Doesn’t print file names."
    echo "5. tail -v : Always print file names."
    echo "6. head -z : Lines are terminated by null characters."
    echo "7. Exit"
    read -p "Enter your Choice: " ch
    case $ch in
    1) create_file ;;
    2) tail_n ;;
    3) tail_c ;;
    4) tail_q ;;
    5) tail_v ;;
    6) tail_z ;;
    7)
        echo "Exiting..."
        exit 0
        ;;
    *) echo "Please enter a Valid Choice..." ;;
    esac
done
