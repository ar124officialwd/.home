#!/bin/zsh

# Source the functions file
source src/functions.sh

# Define an associative array to store tasks
tasks=(
  "1:terminal:Installing Terminal Utils and Configurations"
  "2:gnome:Install themes and configure Gnome"
  "3:nodejs:Install and configure NodeJS (Lastest LTS) using FNM (Node.js version manager)"
  # "0:install_dothome:Install `dothome` - Perform all of the above tasks"
)

# Function to print all tasks
print_tasks() {
  clear
  echo "> install.next.sh"
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
      clear
      echo "󰡕 Executing task: $execution"
      eval "task_$execution"
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
  echo "󰸞 Task executed successfully! Press ENTER to continue."
  read -r
done
