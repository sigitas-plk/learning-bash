#!/bin/bash

#
name() {
    # run code in braces as a new command
    echo "this would run if called 'name'"
}
# you can give arguments
# user redirection
# position parameters are availbe $1 $2 ect.
# same rules for naming applies as for scripts. Make sure to not override existing commands (e.g. ls)

sum(){
    return $(( $1 + $2 ))
}

sum 4 5
echo $? # return status is held in $?


# if return statement is left out, it returns value of last statement
starts_with_a () {
    [[ $1 == [aA]* ]];
    return $? # return the test status
}
starts_with_a2 () {
    [[ $1 == [aA]* ]]; # will return the status of this statment (since it's last)
}

if starts_with_a2 ax; then
    echo "it does"
else
    echo "it doesn't"
fi

# Bash variables are globally visible,
# But in a function you can make variable local for that function to do that use declare or local
# To exit a function with 'return', without a return statment, function returns status of last statment
# To return any other value then status, you can either set global variable, or send the data to output and use command subsitution '$()'


drawline () {
    declare line=""
    declare char="-"
    
    for (( i=0; i<$1; ++i )); do
        line="${line}${char}"
    done
    
    printf "%s\n" "$line"
}

# no arguments? no output
[[ ! $1 ]] && exit 0

declare -i len="${#1} + 4"

drawline $len
printf "| %s |\n" "$1"
drawline $len



# Function redirection
# - redirection is allowed immediately after function definition
# - will be executed when function is run

name(){
    echo "will output to output stream"
} >&2 # but this will redirect output to error stream


# Common pitfall - a command in a pipeline runs in a subshell
# - e.g. ls | while read -r; do ((++count)); done updated count variable will NOT be available, as it's in a subshell

# Here documnets
# - have command that read its input from the source file
# - << Tag
# - Tag defines end of input e.g.:
# cat <<END
#     Text to use as input
# END <- end the input


exit 0