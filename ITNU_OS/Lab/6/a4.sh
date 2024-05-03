clear
echo "Enter File1 name"
read file1
echo "Enter File2 name"
read file2

if awk 'NR==FNR{a[$0];next} !($0 in a)' $file1 $file2
then
    clear
    echo "The files same"
else
    clear
    echo "The files are different"
fi