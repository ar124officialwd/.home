#!/bin/zsh

# Check if tmux is installed
if ! hash tmux 2>/dev/null; then
    echo "Error: Tmux is not installed. Please install tmux and run the script again."
    exit 1
fi

# Check if git is installed
if ! hash git 2>/dev/null; then
    echo "Error: Git is not installed. Please install git and run the script again."
    exit 1
fi

# Set the default Tmux plugin directory
TPM_DIR="$HOME"

# Clone TPM repository if not already present
if [ ! -d "$TPM_DIR" ]; then
    echo "Cloning TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "TPM (Tmux Plugin Manager) is already installed. Updating..."
    (cd "$TPM_DIR" && git pull origin master)
fi

