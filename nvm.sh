#!/bin/zsh

# Check if curl is installed
if hash curl 2>/dev/null; then
    echo "Using curl to install NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh
# Check if wget is installed
elif hash wget 2>/dev/null; then
    echo "Using wget to install NVM..."
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | zsh
else
    echo "Error: Neither curl nor wget is installed. Please install either curl or wget and run the script again."
    exit 1
fi

