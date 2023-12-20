#!/bin/zsh

HOME_DIR=$PWD/.home

# Source the functions file
source functions.sh

# Main script execution
install_fonts
install_tela_icons
install_orchis_gtk
install_vimix_cursors
install_nvm
install_ohmyzsh
install_tpm
install_nvchad
copy_files "$HOME_DIR"
configure "$HOME_DIR"

echo "Script has finished successfully."

