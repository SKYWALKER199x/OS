clear
echo "Enter File1 name"
read file1
echo "Enter File2 name"
read file2

if cmp -s "$file1" "$file2"
then
   echo "The files same"
else
   echo "The files are different"
fi