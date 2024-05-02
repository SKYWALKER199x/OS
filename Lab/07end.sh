# Create destination file
touch destination
desti=destination
# Accept text input until "end" is entered 
echo "Enter text (type 'end' to finish):" 
while read line
do
echo "$line" > temp 
grep -q end temp 
if [ $? -eq 0 ]; then
break
fi
echo $line >> $desti
done
# Display content 
echo "Content:"
cat $desti
# Count lines
line_count=$(wc -l < $desti) 
echo "Total lines entered: $line_count"SSS