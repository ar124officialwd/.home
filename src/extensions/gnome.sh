#!/bin/zsh

CWD=$PWD
ensure_dependencies dconf git

orchis_gtk() {
  local NAME="Orchis-theme"

  if [ ! -d download_$NAME ]; then
    redirect_output git clone -q https://github.com/vinceliuice/$NAME download_$NAME
  fi

  cd download_$NAME || exit
  redirect_output ./install.sh -l -t green -s compact --tweaks compact
  cd $CWD
}

tela_icons() {
  local NAME="Tela-icon-theme"

  if [ ! -d download_$NAME ]; then
    redirect_output git clone -q https://github.com/vinceliuice/${NAME}.git download_$NAME
  fi 

  cd download_$NAME || exit
  redirect_output ./install.sh -n manjaro
  cd $CWD
}

vimix_cursors() {
  local NAME="Vimix-cursors"

  if [ ! -d download_$NAME ]; then
    redirect_output git clone -q https://github.com/vinceliuice/$NAME download_$NAME
  fi

  cd download_$NAME || exit
  redirect_output ./install.sh
  redirect_output mkdir -p $HOME/.icons 2&> /dev/null
  redirect_output cp -rfp $HOME/.local/share/icons/Vimix* $HOME/.icons/ # Should be installed to ~/.icons
  redirect_output rm -rf $HOME/.local/share/icons/Vimix*
  cd $CWD
}

configure_workspaces() {
  NUM_WORKSPACES=$1

  print_feedback_str 3 "Enabling Static Workspaces:"
  dconf write /org/gnome/mutter/dynamic-workspaces false

  print_feedback_str 3 "Setting number of workspaces to: ${NUM_WORKSPACES}"
  dconf write /org/gnome/desktop/wm/preferences/num-workspaces $NUM_WORKSPACES

  print_feedback_str 3 "Setting shortcuts for worksapces (1..8)"
  keys=("1" "2" "3" "4" "5" "6" "7" "8")
  for key in $keys; do
    print_feedback_str 4 "Switch to worksapce ${key}:"
    dconf write /org/gnome/shell/keybindings/switch-to-application-${key} "['']" # Reset
    dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-${key} "['<Super>${key}']"

    print_feedback_str 4 "Move window to worksapce ${key}:"
    dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-${key} "['<Super><Shift>${key}']"
  done
}

configure_app_keybindings() {
  # Terminal: <Super>Return -> alacritty
  print_feedback_str 3 "Terminal: <Super>Return -> alacritty"
  dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Terminal, Alacritty'"
  dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Super>Return'"
  dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'alacritty'"

  # Terminal with Tmux: <Shift><Super>Return -> alacritty -e /bin/tmux
  print_feedback_str 3 "Terminal with Tmux: <Shift><Super>Return -> alacritty -e /bin/tmux"
  dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/name "'Terminal, Alacritty + tmux'"
  dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/binding "'<Shift><Super>Return'"
  dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/command "'alacritty -e /usr/bin/tmux'"

  dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
}

configure_interface() {
  CURSOR_THEME=$1
  ICON_THEME=$2
  GTK_THEME=$3
  COLOR_SCHEME=$4 

  print_feedback_str 3 "Setting Cursor Theme: ${CURSOR_THEME}"
  dconf write /org/gnome/desktop/interface/cursor-theme "'$CURSOR_THEME'"

  print_feedback_str 3 "Setting Icon Theme: ${ICON_THEME}"
  dconf write /org/gnome/desktop/interface/icon-theme "'$ICON_THEME'"
}

# print_feedback_str 2 "Installing Orchis GTK Theme..."
# orchis_gtk

print_feedback_str 2 "Installing Tela Icon Theme..."
tela_icons

print_feedback_str 2 "Installing Vimix Cursor Theme..."
vimix_cursors

print_feedback_str 2 "Configuring workspaces:"
configure_workspaces 8

print_feedback_str 2 "Configuring Application Shortcuts / Keybindings:"
configure_app_keybindings

print_feedback_str 2 "Configuring interface:"
configure_interface "Vimix-white-cursors" "manjaro-dark" "Orchis-Green-Dark-Compact" "prefer-dark"
