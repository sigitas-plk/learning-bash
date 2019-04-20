#!/bin/bash

# crates new bash script, sets permissions and more

# calling script without argument
if [[ ! $1 ]]; then
    echo "Missing argument"
    exit 1
fi
scriptname="$1"
bindir="${HOME}/bin"
filename="${bindir}/${scriptname}"

# file with the given name already exists in bin directory
if [[ -e $filename ]]; then
    echo "File ${filename} already exists"
    exit 1
fi

if type "$scriptname" > /dev/null 2>&1; then
    echo "There is already a command with name ${scriptname}"
    exit 1
fi


# if bin directory doesn't exist
if [[ ! -d $bindir ]]; then
    # if doesnt exist, try and create it
    if mkdir "$bindir"; then
        echo "created ${bindir}"
    else
        echo "Could not create ${bindir}."
        exit 1
    fi
fi

echo '#!/bin/bash' > "$filename"
chmod u+x "$filename"

if [[ $EDITOR ]]; then
    $EDITOR "$filename"
else
    echo "Scriptfile created, not starting editong because \$EDITOR is not set."
fi



