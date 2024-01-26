install_python() {
  # Check if the system is using apt (Ubuntu/Debian)
  if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y python3 python3-pip python3-venv

  # Check if the system is using dnf (Fedora)
  elif command -v dnf &> /dev/null; then
    sudo dnf install -y python3 python3-pip python3-venv

  # Check if the system is using zypper (openSUSE)
  elif command -v zypper &> /dev/null; then
    sudo zypper install -y python3 python3-pip python3-venv

  # Check if the system is using pacman (Arch Linux)
  elif command -v pacman &> /dev/null; then
    sudo pacman -S --noconfirm python3 python-pip python-virtualenv

  else
    echo "Unsupported distribution. Please install Python 3 and pip manually."
    exit 1
  fi
}

install_tidy() {
  # Check if the system is using apt (Ubuntu/Debian)
  if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y tidy

  # Check if the system is using dnf (Fedora)
  elif command -v dnf &> /dev/null; then
    sudo dnf install -y tidy

  # Check if the system is using zypper (openSUSE)
  elif command -v zypper &> /dev/null; then
    sudo zypper install -y tidy

  # Check if the system is using pacman (Arch Linux)
  elif command -v pacman &> /dev/null; then
    sudo pacman -S --noconfirm tidy

  else
    echo "Unsupported distribution. Please install \`tidy\` manually."
    exit 1
  fi
}

install_linters() {
print_feedback_str 3 "Installing stylelint, jsonlint, eslint:"
  pnpm install --global stylelint jsonlint eslint

  print_feedback_str 3 "Installing yamllint:"
  pip install --user yamllint

  print_feedback_str 3 "Installing Tidy:"
  install_tidy
}


print_feedback_str 2 "Installing Python (+pip, +venv):"
install_python

print_feedback_str 2 "Installing linters (+pip, +venv):"
install_linters
