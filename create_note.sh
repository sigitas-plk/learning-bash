#!/bin/bash

# get the date
date=$(date)

# get the topic
topic="$1"

# filename to write to
filename="${HOME}/${topic}notes.txt"

# Ask user for input
read -p "Your note: " note


if [[ $note ]]; then
    # Some script
    echo "$date:  $note" >> "$filename"
    echo "Note '$note' saved to $filename"
else
    echo "No input; note wasn't saved" 1>&2
fi