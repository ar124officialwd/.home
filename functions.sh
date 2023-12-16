# functions.sh

# Function to display the prompt
prompt_user() {
    echo "Press Enter to continue..."
    read -r
    clear
}

# Function to install Tela Icon Theme
install_fonts() {
  echo "Installing Fonts..."
  source manage-fonts.sh -cd ~/.fonts
  prompt_user
}

# Function to install Tela Icon Theme
install_tela_icons() {
  echo "Installing Tela Icon Theme..."
  source tela-icons.sh
  prompt_user
}

# Function to install Orchis GTK Theme
install_orchis_gtk() {
  echo "Installing Orchis GTK Theme..."
  source orchis-gtk.sh
  prompt_user
}

# Function to install NVM
install_nvm() {
    local HOME_DIR=$1
    echo "Installing NVM..."
    source nvm.sh
    prompt_user
}

# Function to install Oh My Zsh
install_ohmyzsh() {
    local HOME_DIR=$1
    echo "Installing Oh My Zsh..."
    (source ohmyzsh.sh)
    prompt_user
}

# Function to install TPM
install_tpm() {
    local HOME_DIR=$1
    echo "Installing TPM..."
    source tpm.sh
    prompt_user
}

# Function to install nvChad
install_nvchad() {
    local HOME_DIR=$1
    echo "Installing nvChad..."
    source nvchad.sh
    prompt_user
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
    local HOME_DIR=$1
    echo "Building fonts cache..."
    fc-cache -f "$HOME/.fonts"
    prompt_user
}
