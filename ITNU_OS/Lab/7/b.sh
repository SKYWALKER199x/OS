read -p "Enter a number: " n

# Initialize an empty variable to store the reversed number
r=""

for ((i = ${#n} - 1; i >= 0; i--)); do

    digit=${n:i:1}

    r+=$digit
done

echo "Reversed number: $r"
