#!/bin/bash

# Positional parameters, to hold the n-th line argument: $1 $2 ect. # above 9, ${10} braces needed since bash will think its $1 followd by 0
echo $1 # first line argument


echo $0 # Holds name of the script as it was called

echo "$@" # Contains all the positional parameters $1 $2...$N. If you put "$@" it in quoates "$1" "$2" ... "$N" it puts parameters in quotes (preserving spaces)

echo "$*" # It's similar to $@ if without quotes, and if in quotes "$*" it returns "$1 $2 ... $N" it puts ALL the parameters into one string

echo $# # Holds number of arguments passed to script

# Print args
for a in "$@"; do
    echo $a;
done

# shift, removes first argument, $# is lowered by 1. if provided with integer argument, thats amout of arguments removed (e.g. shift 3, will remove 3 first arguments)

# getopts

# Print a range of numbers
# Usage: count [-r] [-b n] [-s n] stop
# -b gives the number to begin with (default: 0)
# -r reverses the count
# -s sets step size (default: 1)

declare reverse=""
declare -i begin=0 # -i, declare variable to be integer
declare -i step=1

while getopts ":b:s:r" opt; do
    case $opt in
        r)
            reverse="yes"
        ;;
        b)
            [[ ${OPTARG} =~ ^[0-9]+$ ]] || { echo "${OPTARG} is not a number" >&2; exit 1; }
            start=$OPTARG
        ;;
        s)
            [[ ${OPTARG} =~ ^[0-9]+$ ]] || { echo "${OPTARG} is not a number" >&2; exit 1; }
            step=$OPTARG
        ;;
        :)
            echo "Option -${OPTARG} is missing argument" >&2
            exit 1
        ;;
        \?)
            echo "Unknown option: -${OPTARG}" >&2
            exit 1
        ;;
    esac
done

shift $(( OPTIND -1 )) # remove all the arguments procesed by getopts

[[ $1 ]] || { echo "missing an argument" >&2; exit 1; }
declare end="$1"

if [[ ! $reverse ]]; then
    for (( i=start; i <= end; i+=step )); do
        echo $i
    done
else
    for (( i=end; i>= start; i-=step )); do
        echo $i
    done
fi
exit 0

# Default getopts error handling is non-silent mode
# - getopts handles errors for you
# - if anything goes wrong, the options variable NAME holds "?", thats hy we have case in line 46

# To process errors by yourself
# - start optin string with a colon (silent mode) e.g. ":b:s:r"
# - if in silent mode optargs met unknown option
#    - puts "?" in option variable NAME
#    - actual option in OPTARG
# - if in silen mode optargs meets missing option argument (e.g. -b without number)
#    - puts ":" in option variable NAME
#    - actual option in OPTARG

# End of options --
# - is denoted by -- , arguments after this will not be interpreted as options
# - makes it safe when working with data that starts with a dash
# If you have external data (file system, or user input) don't forget to use end of options to prevent bugs
