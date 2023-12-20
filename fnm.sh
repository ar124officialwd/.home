#!/bin/zsh

export FNM_DIR=$HOME/.fnm
export PATH="$FNM_DIR:$PATH"

install_latest_lts() {
    # Update config
    echo 'export FNM_DIR=$HOME/.fnm' >> ~/.zshrc
    echo 'export PATH="$FNM_DIR:$PATH"' >> ~/.zshrc
    echo 'eval "`fnm env`"' >> ~/.zshrc

    eval "`fnm env`"
    fnm install --lts
    node -v
}

# Check if curl is installed
echo "Trying to install FNM to ${FNM_DIR}"

if hash curl 2>/dev/null; then
    echo "Using curl to install FNM..."
    curl -o- https://fnm.vercel.app/install | zsh -s -- --install-dir $FNM_DIR --skip-shell
    install_latest_lts
# Check if wget is installed
elif hash wget 2>/dev/null; then
    echo "Using wget to install FNM..."
    wget -qO- https://fnm.vercel.app/install | zsh -s -- --install-dir $FNM_DIR --skip-shell
    install_latest_lts
else
    echo "Error: Neither curl nor wget is installed. Please install either curl or wget and run the script again."
    exit 1
fi

