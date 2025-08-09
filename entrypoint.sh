#!/bin/sh -l

output=$(octave --eval "$1")
echo "Octave output:\n$output"

string_to_check="Error"
# Check if the string was found
if echo "$output" | grep -q "$string_to_check"; then
    exit 1
fi