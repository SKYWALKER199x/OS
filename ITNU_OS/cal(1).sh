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

case $ch in
1) echo "ans is:"$(($n1+$n2));;
2) echo "ans is:"$(($n1-$n2));;
3) echo "ans is:"$(($n1*$n2));;
4) echo "ans is:"$(($n1/$n2));;
*) echo "Invalid"
esac
