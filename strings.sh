#!/bin/bash

# Parameter Expansion
# - '${}' this is syntax of parameter expansion
# - ${#var} - string length
# - ${var#pattern} - remove shortest match from begining of string
# - ${var##pattern} - removes longest possible match from begining of string
# - ${var%pattern} - removes shortest match from end of string
# - ${var%%pattern} - removes longest match from end of string

i="/users/sigi/notes.txt"
echo ${i#*/} # users/sigi/notes.txt
echo ${i##*/} # notes.txt
echo ${i%.*} # /users/sigi/notes
echo ${i%/*} # /users/sigi

# Search and replace
# - ${var/pattern/string} - substitute first match with a string
# - ${var//pattern/string} - subsstitute EVERY match with a string
# Anchor pattern
# - ${var/#pattern/string} - matches beginning of the string
# - ${var/%pattern/string} - batches end of the string

i="notes.txt"
echo ${i/txt/jpg} # notes.jpg

# Default values
# - ${var:-value} - will evaluate to 'value' if var is empty or unset
# - ${var-value} - same as above, exept the 'value' is used only if var is unset (allows empty)
# - ${var:=value} - assign a default value if empty or unset
# - ${var=value} - assign a default value if unset

# Conditional Expression Pattersns
# ==, != operators in [[..]] so pattern matching
# [[ $var == pattern ]] returns true when $var matches the pattern
# use of quotes forces string matching e.g. [[ $var == "[0-9]" ]] will match string "[0-9]"
[[ hello == h*o ]] && echo "matching "

# Regular expression matching =~
# =~ uses POSIX extended regular expressions
# - ? matches the token before it 0 or 1 times
# - * matches the token before it for any number of times
# - + matches the token before it for one or more times
# - ^ match begining of string
# - $ match end of the string
# - . match any character
# - ${BASH_REMATCH[N]} get the regex groups