clear
read -p "enter output file name " file1
read -p "ENTER THE NAME OF SECOND FILE " file2
read -p "ENTER THE NAME OF SECOND FILE " file3
cat $file2 >> $file1
cat $file3 >> $file1