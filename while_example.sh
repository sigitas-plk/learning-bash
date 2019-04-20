#!/bin/bash

# generate random number 1 - 100
target=$(($RANDOM % 100))

# intial guess value is empty
guess=""


# Run this loop until it's fase (oppodite from while)
until [[ $guess -eq $target ]]; do
    read -p "Guess: " guess
    if [[ $guess -lt $target ]]; then
        echo "Higher!"
        elif [[ $guess -lt $target ]]; then
        echo "Lower!"
    else
        echo "You got it! It's $guess"
    fi
done

exit 0