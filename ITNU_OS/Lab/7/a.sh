clear
file="new.txt"
count=0
echo "Enter lines of text. Type 'end' to finish."

while true
do
    read -p ">" input
    if [ -z "$input" ]; then
        echo "Empty input. Please try again."
        continue
    fi
    if [ "$input" = "end" ]; then
        break
    fi
    echo -n "$input" >> "$file"
    count="$((count + 1))"
done

echo "Number of lines: $count"
cat "$file"