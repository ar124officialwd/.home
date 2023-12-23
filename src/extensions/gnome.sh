#!/bin/zsh

TMP=/tmp
CWD=$PWD
ensure_dependencies dconf git

orchis_gtk() {
  local NAME="Orchis-theme"

  cd $TMP;
  redirect_output git clone -q https://github.com/vinceliuice/$NAME
  cd $NAME || exit
  redirect_output ./install.sh -l -t green -s compact --tweaks compact
  cd $CWD
}

tela_icons() {
  local NAME="Tela-icon-theme"

  cd $TMP;
  redirect_output git clone -q https://github.com/vinceliuice/${NAME}.git
  cd $NAME || exit
  redirect_output zsh ./install.sh -n manjaro
  cd $CWD
}

vimix_cursors() {
  local NAME="Vimix-cursors"

  cd $TMP;
  redirect_output git clone -q https://github.com/vinceliuice/$NAME
  cd $NAME || exit
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

  print_feedback_str 3 "Setting shortcuts for switching to worksapce (1..8)"
  workspaces=("1" "2" "3" "4" "5" "6" "7" "8")
  for workspace in $workspaces; do
    dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-${worksapce} "['<Super>${workspace}']"
  done
}

configure_interface() {
  CURSOR_THEME=$1
  ICON_THEME=$2
  GTK_THEME=$3
  SHELL_THEME=$4


  print_feedback_str 3 "Setting Cursor Theme: ${CURSOR_THEME}"
  dconf write /org/gnome/desktop/interface/cursor-theme $CURSOR_THEME

  print_feedback_str 3 "Setting Icon Theme: ${ICON_THEME}"
  dconf write /org/gnome/desktop/interface/icon-theme $ICON_THEME

  print_feedback_str 3 "Setting GTK Theme: ${GTK_THEME}"
  dconf write /org/gnome/desktop/interface/gtk-theme $GTK_THEME

  # TODO: Enable gnome shell theme
}

print_feedback_str 2 "Installing Orchis GTK Theme..."
orchis_gtk

print_feedback_str 2 "Installing Tela Icon Theme..."
tela_icons

print_feedback_str 2 "Installing Vimix Cursor Theme..."
vimix_cursors

print_feedback_str 2 "Configuring workspaces:"
configure_workspaces 8

print_feedback_str 2 "Configuring interface:"
configure_interface "'Vimix-white-cursors'" "'manjaro-dark'" "'Orchis-Green-Dark-Compact'"
