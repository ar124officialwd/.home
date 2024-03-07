#!/bin/zsh

ensure_dependencies git curl tar

CWD=$PWD
alias pf=print_feedback_str
alias ro=redirect_output

# Install Config Files
config() {
  ro cp -rf $CWD/.home/{.bin,.alacritty*,.tmux*,.zprofile,.zshrc} $HOME/

  # Default Alacritty Theme (Dark)
  ln -sf $HOME/.alacritty-dark.yml $HOME/.alacritty.yml

  # Default Tmux Config (Dark Theme)
  ln -sf $HOME/.tmux-dark.conf $HOME/.tmux.conf
}

# Install Nerd Fonts
fonts() {
  mkdir -p $HOME/.fonts 2&> /dev/null
  local ARCHIVE="${PWD}/.data/fonts.tar.xz"
  local EXTRACT_PATH="$HOME/.fonts"
  ro tar xJf "$ARCHIVE" -C "$EXTRACT_PATH"
  fc-cache -f "$HOME/.fonts"
}

# Install Oh My Zsh
ohmyzsh() {
  incremental_backup $HOME/.zshrc
  ro curl -so ohmyzsh.sh -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
  ro zsh ohmyzsh.sh "" --unattended
  ro rm ohmyzsh.sh
  ro cp -rf $CWD/.home/.zshrc $HOME
}

# Install TPM
tpm() {
  TPM_DIR="$HOME/.tmux/plugin/tpm"

  # Clone TPM repository if not already present
  if [ ! -d "$TPM_DIR" ]; then
    ro git clone -q https://github.com/tmux-plugins/tpm "$TPM_DIR"
  fi
  
  
  # Install Tmux Plugins
  # rm -rf ~/.tmux/plugins/tmux 2>/dev/null || true
  ~/.tmux/plugin/tpm/bin/install_plugins
}

# Install NvChad
nvChad() {
  # Set the default nvChad directory
  NVCHAD_DIR="$HOME/.config/nvim"

  # Clone nvChad repository if not already present
  if [ ! -d "$NVCHAD_DIR" ]; then
    ro git clone --depth=1 https://github.com/NvChad/NvChad.git "$NVCHAD_DIR"
  fi
}

pf 2 "Installing config files"
config

pf 2 "Installing Nerd fonts"
fonts

pf 2 "Installing Oh My Zsh"
ohmyzsh

pf 2 "Installing TPM (Tmux Plugin Manager)"
tpm

pf 2 "Installing nvChad"
nvChad
