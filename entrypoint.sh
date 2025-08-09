#!/bin/sh -l

output=$(octave --eval "$1" 2>&1)
echo "Octave output:\n$output"

string_to_check="$2"
# Check if the string was found
if echo "$output" | grep -q "$string_to_check"; then
    echo "output matched '$string_to_check'"
    exit 1
fi
echo "output didn't match '$string_to_check'"
