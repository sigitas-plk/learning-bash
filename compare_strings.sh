#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "need exactly two arguments"
    exit 1
fi

# get string length
len=${#1}
len2=${#2}

if [[ $len -gt $len2 ]]; then
    echo "$1 is longer"
else
    if [[ $len -eq $len2 ]]; then
        echo "length is equal"
    else
        echo "$2 is longer"
    fi
fi

exit 0