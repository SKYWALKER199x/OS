#!/bin/bash

DATABASE_FILE="mydatabase.txt"

# Function to create a new record
create_record() {
    echo "Enter data for the new record:"
    read -p "Name: " name
    read -p "Age: " age
    read -p "Location: " location


    echo "Record added successfully."
}

# Function to list all records
list_records() {
    echo "Listing all records:"
    cat "$DATABASE_FILE" | while IFS=: read -r name age location; do
        echo "Name: $name, Age: $age, Location: $location"
    done
}

# Main menu
while true; do
    echo "1. Create Record"
    echo "2. List Records"
    echo "3. Quit"
    read -p "Select an option: " choice

    case $choice in
        1)
            create_record
            ;;
        2)
            list_records
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
