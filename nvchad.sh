#!/bin/zsh

# Check if git is installed
if ! hash git 2>/dev/null; then
    echo "Error: Git is not installed. Please install git and run the script again."
    exit 1
fi

# Set the default nvChad directory
NVCHAD_DIR="$HOME/.config/nvim"

# Clone nvChad repository if not already present
if [ ! -d "$NVCHAD_DIR" ]; then
    echo "Cloning nvChad..."
    git clone --depth=1 https://github.com/NvChad/NvChad.git "$NVCHAD_DIR"
else
    echo "nvChad is already installed. Updating..."
    (cd "$NVCHAD_DIR" && git pull origin master)
fi

# Run nvChad setup script
echo "Running nvChad setup..."
(nvim)

