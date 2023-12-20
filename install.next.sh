#!/bin/zsh

HOME_DIR=$PWD/.home

# Source the functions file
source functions.sh

# Define an associative array to store tasks
tasks=(
  "1:install_ohmyzsh:Install OhMyZSH - A delightful, open source, community"
  "2:install_fnm:Install FNM - 🚀 Fast and simple Node.js version manager, built in Rust
"
  "3:install_node_modules:Install common global node modules like: nodemon, pm2..."
  "4:install_tpm:Install tpm - Tmux Plugin Manager"
  "5:install_nvchad:Install NvChad - Blazing fast Neovim config providing solid defaults and a beautiful UI"
  "6:install_fonts:Install selected set of fonts, includes(Fira Code Nerd Font,)"
  "7:install_tela_icons:Install selected set of Tela Icons(Manjaro Circle)"
  "8:install_orchis_gtk:Install selected set of GTK Themes(Orchis Gtk Theme)"
  "9:install_vimix_cursors:Install selected set of Cursor Themes(Vimix Cursor Themes)"
  "10:copy_files $HOME_DIR:Install Config - Copy config files to home directory"
  "11:configure $HOME_DIR:Configure- Perform configuration tasks like(fc-cache,...)"
  "0:install_dothome:Install `dothome` - Perform all of the above tasks"
)

# Function to print all tasks
print_tasks() {
  echo "Available tasks:"
  for task in "${tasks[@]}"; do
    IFS=':' read -r name execution description <<< "$task"
    echo "\t◽ $name\t$description"
  done
}

# Function to execute the selected task
execute_task() {
  local selected_task=$1
  for task in "${tasks[@]}"; do
    IFS=':' read -r name execution description <<< "$task"
    if [ "$name" = "$selected_task" ]; then
      echo "Executing: $execution"
      eval "$execution"
      return
    fi
  done
  echo "Task not found: $selected_task"
}

while true; do
  # Print tasks
  print_tasks

  # Ask user to pick a task
  echo -n "Enter the name of the task you want to execute (type 0 to execute all tasks or 'q' to quit/exit): "
  read selected_task

  # Check if the user wants to exit
  if [ "$selected_task" = "q" ]; then
    echo "Exiting..."
    break
  fi

  # Execute the selected task
  execute_task "$selected_task"
done
