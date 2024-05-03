clear
echo "Enter value of N"
read N
i=1
while [ $i -le $N ]
do
    t=$(($i*2))
    echo $t
    i=$(($i+1))
    echo $t >> t1.txt
done
