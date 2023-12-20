#!/bin/sh

# Function to display the prompt
prompt_user() {
  echo "Press Enter to continue..."; read -r; clear
}

# Function to execute a task
execute_task() {
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
  execute_task "Installing Tela Icon Theme..." tela-icons.sh
}

# Function to install Orchis GTK Theme
install_orchis_gtk() {
  execute_task "Installing Orchis GTK Theme..." orchis-gtk.sh
}

# Function to install Orchis GTK Theme
install_vimix_cursors() {
  execute_task "Installing Vimix Cursor Theme..." vimix-cursors.sh
}

# Function to install NVM
install_nvm() {
  execute_task "Installing NVM..." nvm.sh
}

# Function to install Oh My Zsh
install_ohmyzsh() {
  echo "Installing Oh My Zsh..."
  (source ohmyzsh.sh)
  prompt_user
}

# Function to install TPM
install_tpm() {
  execute_task "Installing TPM..." tpm.sh
}

# Function to install nvChad
install_nvchad() {
  execute_task "Installing nvChad..." nvchad.sh
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
  prompt_user
}
