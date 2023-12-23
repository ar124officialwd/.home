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
# Function: ensure_dependencies
# Usage: ensure_dependencies [-o] <dependency1> [<dependency2> ...]
#
# Checks if specified dependencies are installed in the system. If a dependency
# is missing, it prints an error message and either exits the script (default behavior)
# or returns 1 (if the -o option is provided).
#
# Options:
#   -o  If provided, return 1 instead of exiting the script on missing dependencies.
#
ensure_dependencies() {
  local dependencies=()
  local exit_on_error=1

  # Parse options
  while getopts "o" opt; do
    case $opt in
      o)
        exit_on_error=0
        ;;
      \?)
        echo "Invalid option: -$OPTARG"
        exit 1
        ;;
    esac
  done

  shift $((OPTIND-1))

  # Remaining arguments are dependencies
  dependencies=("$@")

  for dep in "${dependencies[@]}"; do
    # Check if the command is available in the PATH
    if ! command -v "$dep" >/dev/null 2>&1; then
      e_msg() {
        # Print an error message if the dependency is not installed
        echo "Error: Dependency '$dep' is not installed."
        echo "Please install it before proceeding."
        exit 1
      }

      # If -o option is provided, return 1; otherwise, exit 1
      [ "$exit_on_error" -eq 0 ] && return 1 || e_msg
    fi
  done
}

# Function: incremental_backup
# Usage: incremental_backup <target> [<source>]
#
# Creates a backup of the target file. If the target exists,
# appends ".bak" with a unique number. Optionally, copies a new
# source file to the target location before backup.
incremental_backup() {
  local target=$1
  local backup_number=1
  local backup_suffix=".bak"

  if [ -e "$target" ]; then
    while [ -e "$target$backup_suffix.$backup_number" ]; do
      ((backup_number++))
    done

    [ -n "$2" ] && cp "$2" "$target"
    cp "$target" "$target$backup_suffix.$backup_number"
  fi
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

