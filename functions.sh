#!/bin/sh

# Function to display the prompt
prompt_user() {
  echo "Press Enter to continue..."; read -r; clear
}

# Function to execute a task
run_task() {
  echo $1
  source $2
  prompt_user
}

# Function to install Tela Icon Theme
install_fonts() {
  echo "Installing Fonts..."
  mkdir -p $HOME/.fonts 2&> /dev/null
  source manage-fonts.sh -cd ~/.fonts
  prompt_user
}

# Function to install Tela Icon Theme
install_tela_icons() {
  run_task "Installing Tela Icon Theme..." tela-icons.sh
}

# Function to install Orchis GTK Theme
install_orchis_gtk() {
  run_task "Installing Orchis GTK Theme..." orchis-gtk.sh
}

# Function to install Orchis GTK Theme
install_vimix_cursors() {
  run_task "Installing Vimix Cursor Theme..." vimix-cursors.sh
}

# Function to install NVM
install_nvm() {
  run_task "Installing NVM..." nvm.sh
}

# Function to install NVM
install_fnm() {
  run_task "Installing NVM..." fnm.sh
}

# Function to install NVM
install_node_modules() {
  run_task "Installing Global Node Modules..." node-modules.sh
}

# Function to install Oh My Zsh
install_ohmyzsh() {
  echo "Installing Oh My Zsh..."
  (source ohmyzsh.sh)
  prompt_user
}

# Function to install TPM
install_tpm() {
  run_task "Installing TPM..." tpm.sh
}

# Function to install nvChad
install_nvchad() {
  run_task "Installing nvChad..." nvchad.sh
}

# Function to copy files
copy_files() {
  local HOME_DIR=$1
  echo "Copying files..."
  cp -rf "$HOME_DIR/." "$HOME"
  prompt_user
}

# Function to configure
configure() {
  echo "Building fonts cache..."
  fc-cache -f "$HOME/.fonts"

  echo "Configuring Gnome Shell"
  source gnome-shell.sh

  prompt_user
}


# Do everything
install_dothome() {
  install_ohmyzsh
  install_fnm
  install_node_modules
  install_tpm
  install_nvchad
  install_fonts
  install_tela_icons
  install_orchis_gtk
  install_vimix_cursors
  copy_files "$HOME_DIR"
  configure "$HOME_DIR"
}