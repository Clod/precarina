#!/bin/bash

# Function to extract constant strings from a Dart file
extract_constant_strings() {
    local file="$1"
    local regex="['\"][^'\"]*['\"]"

    while IFS='' read -r line || [[ -n "$line" ]]; do
        while [[ $line =~ $regex ]]; do
            constant_string="${BASH_REMATCH[0]}"
            echo "File: $file"
            echo "String: $constant_string"
            line="${line#*"${BASH_REMATCH[0]}"}"
        done
    done < "$file"
}

# Traverse the directory tree and extract constant strings from Dart files
find . -type f -name "*.dart" | while read -r file; do
    extract_constant_strings "$file"
done