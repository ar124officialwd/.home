#!/bin/zsh

ensure_dependencies curl unzip

export FNM_DIR=$HOME/.fnm
export PATH="$FNM_DIR:$PATH"

node_fnm() {
  curl -s -o- https://fnm.vercel.app/install | zsh -s -- --install-dir $FNM_DIR --skip-shell
}

node_reload_env() {
  export FNM_DIR=$HOME/.fnm
  export PATH="$FNM_DIR:$PATH"
  eval "$(fnm env --use-on-cd)"
}

node_latest_lts() {
  node_reload_env
  redirect_output fnm install --lts
}

node_modules() {
  node_reload_env

  npm_install_if_not_installed() {
    local packages=("$@")
    
    install_module() {
      npm list -g --depth=0 | grep -q "$package" || npm install -g "$package"
    }

    for package in "${packages[@]}"; do
      # Install the package only if not already installed
      print_feedback_str 3 "Installing Node Module: $package"
      redirect_output install_module
    done
  }

  npm_install_if_not_installed pnpm \
    yarn yo @babel/core @babel/cli typescript \
    nodemon pm2 serve \
    @angular/cli @ionic/cli react-scripts \
    sequelize-cli
}


# Check if curl is installed

print_feedback_str 2 "Installing FNM to ${FNM_DIR}"
node_fnm

print_feedback_str 2 'Installing NodeJS, latest LTS Version...'
node_latest_lts

print_feedback_str 2 'Installing Common Global Modules...'
node_modules

