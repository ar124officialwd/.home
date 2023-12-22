#!/bin/sh

#-------------------- UTILS --------------------#
# Set VERBOSE to true for verbose output
export VERBOSE=false
if [[ "$VERBOSE" == true ]]; then
  exec 3>&1  # Save file descriptor 3 for stdout
else
  exec 3>/dev/null  # Redirect file descriptor 3 to /dev/null
fi

# Function to conditionally redirect output based on the VERBOSE variable
redirect_output() {
  if [[ "$VERBOSE" == true ]]; then
    "$@"  # Run the command without redirecting output
  else
    eval "$@" >&3  # Redirect output to file descriptor 3
  fi
}

# Function to check if given dependencies are installed
ensure_dependencies() {
  local dependencies=("$@")

  for dep in "${dependencies[@]}"; do
    # Check if the command is available in the PATH
    if ! command -v $dep >/dev/null 2>&1; then
      # Print an error message if the dependency is not installed
      echo "Error: Dependency '$dep' is not installed."
      echo "Please install it before proceeding."
      exit 1
    fi
  done
}

print_feedback_str() {
  local character=""
  local repeats=$1
  local message=$2
  local prefix=""

  local x=$((repeats - 1))
  local y=$((x * 2))

  if ((y <= 0)); then
    y=1
  fi

  for ((j = 1; j <= y; j++)); do
    prefix="${prefix}${character}"
  done

  echo "${prefix} ${message}"
}

# Function to execute a task
run_task() {
  source $PWD/src/extensions/$1.sh
}

#-------------------- TASKS ---------------------#
# Install Oh My ZSH
task_terminal() {
  print_feedback_str 1 'Installing Terminal Utils and Configurations...'
  run_task terminal
}

# Install UI Themes and Configure Gnome Shell
task_gnome() {
  print_feedback_str 1 "Installing UI Themes and Configuring Gnome Shell..."
  run_task gnome
}

# Install FNM, Lastest NodeJS LTS and Node Modules
task_nodejs() {
  print_feedback_str 1 'Installing FNM, Latest LTS Nodejs and Common NodeJS Modules...'
  run_task nodejs
}

