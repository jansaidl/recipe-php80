#!/bin/bash

# Check if argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <folder>"
    exit 1
fi

# Store the argument
folder="$1"
dir="/root/install.d"

# Check if the target directory exists
target_dir="$dir/$folder"
if [ ! -d "$target_dir" ]; then
    echo "Error: Directory '$target_dir' does not exist."
    exit 2
fi

# Find all .sh files in the directory and sort them alphabetically
files=$(find "$target_dir" -name "*.sh" -type f,l | sort)

# Check if any files were found
if [ -z "$files" ]; then
    echo "Warning: No .sh files found in '$target_dir'."
    exit 0
fi

# Execute the found files in alphabetical order
echo "Executing scripts from '$target_dir' in alphabetical order:"
for script in $files; do
    echo "Running: $script"
    # Set execution permission if not already set
    if [ ! -x "$script" ]; then
        chmod +x "$script"
    fi
    # Execute the script
    "$script"
    # Check return value
    result=$?
    if [ $result -ne 0 ]; then
        echo "Error: Script '$script' exited with error code $result."
        exit $result
    fi
done

echo "Completed."