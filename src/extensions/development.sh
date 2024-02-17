#!/bin/zsh

ensure_dependencies apt curl unzip

export FNM_DIR=$HOME/.fnm
export PATH="$FNM_DIR:$PATH"

node_latest_lts() {
  node_reload_env
  redirect_output fnm install --lts
}

node_fnm() {
  if [ ! -d $HOME/.fnm ]; then
    curl -s -o- https://fnm.vercel.app/install | zsh -s -- --install-dir $FNM_DIR --skip-shell
  fi
}

node_reload_env() {
  export FNM_DIR=$HOME/.fnm
  export PATH="$FNM_DIR:$PATH"
  eval "$(fnm env --use-on-cd)"
}

apt_update() {
  sudo apt-get update
}

install_python() {
  sudo apt-get install -y python3 python3-pip python3-venv
}

install_apps() {
  print_feedback_str 3 "Installing VSCode:"
  sudo snap install code --classic
  print_feedback_str 3 "Installing Cacher, Postman and Insomnia"
  sudo snpa install cacher postman insomnia
  print_feedback_str 4 "Installing GitKraken"
  sudo snap install gitkraken --classic
}

print_feedback_str 2 "Installing FNM to ${FNM_DIR}"
node_fnm

print_feedback_str 2 'Installing NodeJS, latest LTS Version...'
node_latest_lts

print_feedback_str 2 "Installing Python (+pip, +venv):"
apt_update
install_python

print_feedback_str 2 "Installing common development apps(docker, vscode, ...):"
install_apps
