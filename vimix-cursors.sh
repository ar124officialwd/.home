#!/bin/bash

NAME="Vimix-cursors"

# Check if git is available
if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed. Please install git and run the script again."
    exit 1
fi

# Clone the Tela Icon Theme repository
git clone https://github.com/vinceliuice/$NAME

# Navigate into the cloned directory
cd $NAME || exit

# Run the install.sh script with the specified option for Manjaro
./install.sh
mkdir -p $HOME/.icons 2&> /dev/null
cp -rfp $HOME/.local/share/icons/Vimix* $HOME/.icons/

# Clean up (remove the cloned directory)
rm -rf $HOME/.local/share/icons/Vimix*
cd ..
rm -rf $NAME

