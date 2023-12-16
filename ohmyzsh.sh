#!/bin/zsh

# Check if curl is installed
if hash curl 2>/dev/null; then
    echo "Using curl to install Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Check if wget is installed
elif hash wget 2>/dev/null; then
    echo "Using wget to install Oh My Zsh..."
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Error: Neither curl nor wget is installed. Please install either curl or wget and run the script again."
    exit 1
fi

