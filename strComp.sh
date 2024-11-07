#!/bin/bash

string1="<input 1 here>"
string2="<input 2 here>"

# Initialize variable for the length of comparison
length=${#string1}
[ ${#string2} -gt $length ] && length=${#string2}  # Ensure we check the longest string

# Find the first point of difference
for (( i=0; i<length; i++ )); do
    if [ "${string1:i:1}" != "${string2:i:1}" ]; then
        # Extract and print the differing substrings from this point onward
        echo "Difference in string1: '${string1:i}'"
        echo "Difference in string2: '${string2:i}'"
        exit 0
    fi
done

# If loop completes without finding a difference
echo "The strings are the same."
