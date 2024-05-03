create_table() {

  read -p "Enter table name : " table_name
  read -p "Enter number of columns : " num_columns
  
  columns=""
  for (( i=1; i<=$num_columns; i++ )); do
    read -p "Enter name for column $i: " column_name
    columns="$columns,$column_name"
  done
  
  columns="${columns:1}"
  
  touch "$table_name.txt"
  echo "$columns" > "$table_name.txt"
  
  echo "Table $table_name with columns $columns created successfully!"
}


view_table() {
  read -p "Enter table name: " table_name
  if [ -f "$table_name.txt" ]; then
    column -t -s "," "$table_name.txt"
  else
    echo "Table $table_name does not exist!"
  fi
}

insert_data() {
  read -p "Enter table name: " table_name
  if [ -f "$table_name.txt" ]; then
    header=$(head -n 1 "$table_name.txt")
    read -p "Enter data for columns ($header): " data
    echo "$data" >> "$table_name.txt"
    echo "Data inserted successfully!"
  else
    echo "Table $table_name does not exist!"
  fi
}

delete_data() {
  read -p "Enter table name: " table_name
  if [ -f "$table_name.txt" ]; then
    read -p "Enter data to delete or 'table' to delete the entire table: " data
    if [ "$data" = "table" ]; then
      rm "$table_name.txt"
      echo "Table $table_name deleted successfully!"
    else
      sed -i "/$data/d" "$table_name.txt"
      echo "Data deleted successfully!"
    fi
  else
    echo "Table $table_name does not exist!"
  fi
}

search_data() {
  read -p "Enter table name: " table_name
  if [ -f "$table_name.txt" ]; then
    read -p "Enter data to search: " data
    grep "$data" "$table_name.txt"
  else
    echo "Table $table_name does not exist!"
  fi
}

sort_columns() {
  read -p "Enter table name: " table_name
  if [ -f "$table_name.txt" ]; then
    num_columns=$(head -n 1 "$table_name.txt" | tr ',' '\n' | wc -l)
    read -p "Enter column number to sort : " column_number
    if (( $column_number <= $num_columns )); then
      sed '1d' "$table_name.txt" | sort -t"," -k"$column_number" | (echo "$(head -n 1 "$table_name.txt")"; cat) > temp.txt
      mv temp.txt "$table_name.txt"
      echo "Table sorted by column $column_number!"
    else
      echo "Invalid column number! Please enter a valid column number."
    fi
  else
    echo "Table $table_name does not exist!"
  fi
}

update_table() {
  read -p "Enter table name: " table_name
  if [ -f "$table_name.txt" ]; then
    echo "Choose update option:"
    echo "1. Add a new column"
    echo "2. Replace existing data"
    read -p "Enter option (1 or 2): " option
    
    case $option in
      1)
        read -p "Enter new column name: " column_name
        header=$(head -n 1 "$table_name.txt")
        new_header="$header,$column_name"
        sed -i "1s/.*/$new_header/" "$table_name.txt"
        echo "New column '$column_name' added to table $table_name!"
        ;;
      2)
        read -p "Enter data to replace: " old_data
        read -p "Enter new data: " new_data
        sed -i "s/$old_data/$new_data/g" "$table_name.txt"
        echo "Data replaced successfully!"
        ;;
      *)
        echo "Invalid option! Please enter either 1 or 2."
        ;;
    esac
  else
    echo "Table $table_name does not exist!"
  fi
}


while true;
do
  echo "Menu : "
  echo "1. Create table : "
  echo "2. View table : "
  echo "3. Insert data into table : "
  echo "4. Delete data from table : "
  echo "5. Search data in table : "
  echo "6. Sort table by column : "
  echo "7. Update table : "
  echo "0. Exit : "
  read -p "Enter choice : " choice

  case $choice in
    1) create_table ;;
    2) view_table ;;
    3) insert_data ;;
    4) delete_data ;;
    5) search_data ;;
    6) sort_columns ;;
    7) update_table ;;
    0) echo "Exit..."; break ;;
    *) echo "Invalid choice..." ;;
  esac
  
done
