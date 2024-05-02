echo "Enter a number: "
read number

reverse=""
negative=false
if [ $number -lt 0 ]; then
    number=$(expr $number \* -1)
    negative=true
fi

if [ $number -eq 0 ]; then
    echo "Reverse of the input number: 0"
    exit 0
fi

while [ $number -gt 0 ]
do
    remainder=$(expr $number % 10)
    
    reverse=$reverse$remainder
    
    number=$(expr $number / 10)
done

if [ $negative = "true" ]; then
    reverse=-$reverse
fi

echo "Reverse of the input number: $reverse"