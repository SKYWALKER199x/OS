for((i=1;i<=3;i++))
do
	for((j=1;j<=3;j++))
	do 
		for((k=1;k<=3;k++))
		do
			if [ "$i" != "$j" ] && [ "$i" != "$k" ] && [ "$j" != "$k" ]
			then
				echo "$i $j $k" >> t2.txt
			fi
		done
	done
done
