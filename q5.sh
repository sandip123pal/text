#!/bin/bash

# Function to display an error message and exit the program
show_error_and_exit() {
    echo "Error: $1"
    exit 1
}

# Prompt the user to enter the name of a directory
read -p "Enter the name of the directory: " directory_name

# Check if the directory exists
if [ ! -d "$directory_name" ]; then
    show_error_and_exit "Directory '$directory_name' does not exist."
fi

# List all the files in the given directory and sort them alphabetically
files=$(ls "$directory_name" | sort)

# Create a new directory named "sorted" inside the given directory
sorted_directory="$directory_name/sorted"
mkdir -p "$sorted_directory"

# Move each file from the original directory to the "sorted" directory
num_files_moved=0
for file in $files; do
    mv "$directory_name/$file" "$sorted_directory/"
    num_files_moved=$((num_files_moved + 1))
done

# Display a success message with the total number of files moved
echo "Successfully moved $num_files_moved files to '$sorted_directory'."
