#!/bin/bash

# test number of arguments provided
[[ $# -ne 2 ]] && { echo "Need exactly two arguments" >&2; exit 1}

for f in *"$1"; do
    # get the base of the file with given extension
    base=$(basename "$f" "$1")
    # modify given file with the new extension
    mv "$f" "${base}$2"
done

