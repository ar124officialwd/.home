#!/bin/bash

# Check if git is available
if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed. Please install git and run the script again."
    exit 1
fi

# Clone the Tela Icon Theme repository
git clone https://github.com/vinceliuice/Tela-icon-theme.git

# Navigate into the cloned directory
cd Tela-icon-theme || exit

# Run the install.sh script with the specified option for Manjaro
./install.sh -n manjaro

# Clean up (remove the cloned directory)
cd ..
rm -rf Tela-icon-theme

