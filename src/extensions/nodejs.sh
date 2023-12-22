#!/bin/zsh

export FNM_DIR=$HOME/.fnm
export PATH="$FNM_DIR:$PATH"
alias ro=redirect_output

reload_env() {
  ro eval "`fnm env`"
}

fnm() {
  ro curl -s -o- https://fnm.vercel.app/install | zsh -s -- --install-dir $FNM_DIR --skip-shell
}

latest_lts() {
  reload_env
  ro fnm install --lts
}

node_modules() {
  reload_env

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

  npm_install_if_not_installed \
    typescript \
    nodemon pm2 serve \
    @angular/cli @ionic/cli react-scripts \
    sequelize-cli
}


# Check if curl is installed

if hash curl 2>/dev/null; then
  print_feedback_str 2 "Installing FNM to ${FNM_DIR}"
  fnm

  print_feedback_str 2 'Installing NodeJS, latest LTS Version...'
  latest_lts

  print_feedback_str 2 'Installing Common Global Modules...'
  node_modules
else
  echo 'Error: `curl` is not installed. Please install curl and run the script again.'
  exit 1
fi

