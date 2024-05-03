clear
ans=0
echo "enter first number"
read n1
echo "enter second number"
read n2

echo "1.SUM"
echo "2.SUB"
echo "3.Multiplication"
echo "4.Division"

echo "Enter Choice"
read ch

if [ $ch -eq 1 ];
then 
	echo "Sum: \c"
	echo $(($n1+$n2))
elif [ $ch -eq 2 ];
then
	echo "Sub: \c"
	echo $(($n1-$n2))
elif [ $ch -eq 3 ];
then
	echo "Multiplication: \c" 
	echo $(($n1*$n2))
elif [ $ch -eq 4 ];
then
	echo "Div: \c"
	echo $(($n1/$n2))
else
      echo "Invalid"
fi
