while true;
do
	echo "MENU"
	echo "0 creat or enter file name"
	echo "1 display"
	echo "2 insert"
	echo "3 delet"
	echo "4 update"
	echo "5 sort "
    echo "6 search"
	echo "7 exit"
	read choice

case $choice in

0)	echo "enter file name"
	read fname
	while [ -z $fname ]
	do
		echo "enter file name"
		read fanme
	done
	if [ -f $fanme ]
	then
		echo "file alredy exists"
		echo "do you wnat to use this file (yes 1/no 0)"
		read choice0		
		if [ $choice0 -eq 1 ]
		then
			touch $fname
		else
			echo ""
		fi
	else
	touch $fname
	fi
	echo "file was created" 
;;
1)	cat $fname
;;
2)	echo "insert"
	echo "enter roll no. "
	read rno
	while [ -z $rno ]
	do
		echo "enter roll no."
			if grep -q $rno $fname; then
                echo "Roll number already exists. Cannot add duplicate entry."
            else
               read rno
            fi
	done
	echo "enter name "
	read name
	while [ -z $name ]
	do
		echo "enter name"
		read name
	done
	echo "branch name "
	read branch
	while [ -z $branch ]
	do
		echo "enter branch"
		read branch
	done
	echo "cpi"
	read cpi
	while [ -z $cpi ]
	do
		echo "enter cpi"
		read cpi
	done
	echo "| $rno | $name | $branch | $cpi |" >> $fname
	echo "data inserted" 
;;
3)	read -p "Enter The Roll No. to delete: " oldnum
	grep -v $oldnum $fname > temp_file
        mv temp_file $fname
        echo "Row(s) containing Roll No. $oldnum deleted successfully."
;;
4)	echo "update"
	echo "0 change all key at onece"
	echo "1 change roll no."
	echo "2 change name"
	echo "3 change branch"			
	echo "4 change cpi"
	echo "5 change roll and name"
	echo "6 change roll and branch"
	echo "7 change roll and cpi"
	echo "8 change name and branch"
	echo "9 change name and cpi"
	echo "10 exit" 
	read choice4
	
	case $choice4 in
	
	0)	echo "update this"	
		echo "rno name brach cpi"
		read rno
		read name
		read branch
		read cpi
		grep -v "| $rno | $name | $branch | $cpi |" $fname > db.txt
		cp db.txt $fname

		echo "update that to this"

		echo "insert"
		echo "enter roll no. "
		read rno
		echo "enter name "
		read name
		echo "branch name "
		read branch
		echo "cpi"
		read cpi
		echo "| $rno | $name | $branch | $cpi |" >> $fname
	;;
	1)	echo "1 change roll no."
		read -p "Enter The Roll Number: " oldnum
                read -p "Enter The New Roll Number: " newnum
                grep -v $oldnum $fname > temp_file
                grep $oldnum $fname | cut -f 2,3,4 | echo "| $newnum | $name | $branch | $cpi |" >> temp_file
                mv temp_file $fname
                echo "Details Updated."
	
	;;
	2)	echo "2 change name"
		read -p "Enter The name: " oldname
                read -p "Enter The New name: " newname
                grep -v $oldname $fname > temp_file
                grep $oldname $fname | cut -f 1,3,4 | echo "| $rno | $newname | $branch | $cpi |" >> temp_file
                mv temp_file $fname
                echo "Details Updated."
	
	;;
	3)	echo "3 change branch"
		read -p "Enter The branch: " oldbra
                read -p "Enter The New branch: " newbra
                grep -v $oldbra $fname > temp_file
                grep $oldbra $fname | cut -f 1,2,4 | echo "| $rno | $name | $newbra | $cpi |" >> temp_file
                mv temp_file $fname
                echo "Details Updated."
	
	;;
	4)	echo "4 change cpi"
		read -p "Enter The cpi: " oldcpi
                read -p "Enter The New cpi: " newcpi
                grep -v $oldcpi $fname > temp_file
                grep $oldcpi $fname | cut -f 1,2,3 | echo "| $rno | $name | $branch | $newcpi |" >> temp_file
                mv temp_file $fname
                echo "Details Updated."
	
	;;
	5)	echo "5 change roll no and name"
		read -p "Enter The Roll Number: " oldnum
                read -p "Enter The New Roll Number: " newnum
                read -p "Enter The New name: " newname
                grep -v $oldnum $fname > temp_file
                grep $oldnum $fname | cut -f 3,4 | echo "| $newnum | $newname | $branch | $cpi |" >> temp_file
                mv temp_file $fname
                echo "Details Updated."
	
	;;
	6)	echo "6 change roll no and branch"
		read -p "Enter The Roll Number: " oldnum
                read -p "Enter The New Roll Number: " newnum
                read -p "Enter The New branch: " newbra
                grep -v $oldnum $fname > temp_file
                grep $oldnum $fname | cut -f 2,4 | echo "| $newnum | $name | $newbra | $cpi |" >> temp_file
                mv temp_file $fname
                echo "Details Updated."
	
	;;
	7)	echo "7 change roll no and cpi"
		read -p "Enter The Roll Number: " oldnum
                read -p "Enter The New Roll Number: " newnum
                read -p "Enter The New cpi: " newcpi
                grep -v $oldnum $fname > temp_file
                grep $oldnum $fname | cut -f 2,3 | echo "| $newnum | $name | $branch | $newcpi |" >> temp_file
                mv temp_file $fname
                echo "Details Updated."
	
	;;
	8)	echo "8 change name and branch"
		read -p "Enter The name: " oldname
                read -p "Enter The New name: " newname
                read -p "Enter The New branch: " newbra
                grep -v $oldname $fname > temp_file
                grep $oldname $fname | cut -f 1,4 | echo "| $rno | $newname | $newbra | $cpi |" >> temp_file
                mv temp_file $fname
                echo "Details Updated."
	
	;;
	9)	echo "9 change name and cpi"
		read -p "Enter The name: " oldname
                read -p "Enter The New name: " newname
                read -p "Enter The New cpi: " newcpi
                grep -v $oldname $fname > temp_file
                grep $oldname $fname | cut -f 1,3 | echo "| $rno | $newname | $branch | $cpi |" >> temp_file
                mv temp_file $fname
                echo "Details Updated."
	
	;;
	10)
	exit
	;;
	*)	echo "invalid choice"
	;;
	esac
	
;;
5)
	echo "Sort the data"
        read -p "enter the column name to be sorted: " cn
        case $cn in
           rno) n=1;;
          name) n=2;;
        branch) n=3;;
          cpi ) n=4;;
            * ) echo "invalid key";;
        esac
        sort -t "|" -k $n $fname
;;
6)
	echo "search"
	read str
	while [ -z $str ]
	do
		echo "enter any key"
		read str
	done
	grep $str $fname
	if [ $? -eq 1 ]
	then
		echo "$str not found"
	else
		echo "this are all the resulte for $str"
	fi
;;
7)
exit
;;
*)
	echo "invalid choice"
;;
esac
done
