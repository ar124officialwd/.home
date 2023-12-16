#!/bin/zsh

HOME_DIR=$PWD/.home

# Source the functions file
source functions.sh

# Main script execution
install_fonts
install_tela_icons
install_orchis_gtk
install_nvm "$HOME_DIR"
install_ohmyzsh "$HOME_DIR"
install_tpm "$HOME_DIR"
install_nvchad "$HOME_DIR"
copy_files "$HOME_DIR"
configure "$HOME_DIR"

echo "Script has finished successfully."

