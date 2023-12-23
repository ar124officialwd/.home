#!/bin/zsh

CWD=$PWD
ensure_dependencies dconf git

orchis_gtk() {
  local NAME="Orchis-theme"

  redirect_output git clone -q https://github.com/vinceliuice/$NAME
  cd $NAME || exit
  redirect_output ./install.sh -l -t green -s compact --tweaks compact
  cd $CWD
  redirect_output rm -rf $NAME
}

tela_icons() {
  local NAME="Tela-icon-theme"

  redirect_output git clone -q https://github.com/vinceliuice/${NAME}.git
  cd $NAME || exit
  redirect_output zsh ./install.sh -n manjaro
  cd $CWD
  redirect_output rm -rf $NAME
}

vimix_cursors() {
  local NAME="Vimix-cursors"

  redirect_output git clone -q https://github.com/vinceliuice/$NAME
  cd $NAME || exit
  redirect_output ./install.sh
  redirect_output mkdir -p $HOME/.icons 2&> /dev/null
  redirect_output cp -rfp $HOME/.local/share/icons/Vimix* $HOME/.icons/ # Should be installed to ~/.icons
  redirect_output rm -rf $HOME/.local/share/icons/Vimix*
  cd $CWD
  redirect_output rm -rf $NAME
}

configure_interface() {
  # Function to replace or add an entry in a file
  replace_or_add_entry() {
    file=$1
    entry=$2
    new_line=$3

    if grep -q "^$entry" "$file"; then
      sed -i "s|^$entry.*|$new_line|g" "$file"
    else
      echo "$new_line" >> "$file"
    fi
  }

  CURSOR_THEME=$1
  ICON_THEME=$2
  GTK_THEME=$3

  incremental_backup $HOME/.Xresources
  incremental_backup $HOME/.config/gtk-3.0/settings.ini
  incremental_backup $HOME/.config/gtk-4.0/settings.ini

  # Add Settings section to GTK3+ files
  replace_or_add_entry $HOME/.config/gtk-3.0/settings.ini "[Settings]" "[Settings]"
  replace_or_add_entry $HOME/.config/gtk-4.0/settings.ini "[Settings]" "[Settings]"

  # Set Cursor Theme
  print_feedback_str 3 "Setting Cursor Theme: ${CURSOR_THEME}"
  replace_or_add_entry $HOME/.Xresources "Xcursor.theme:" "Xcursor.theme: $CURSOR_THEME"

  # Set Icon Theme
  print_feedback_str 3 "Setting Icon Theme: ${ICON_THEME}"
  replace_or_add_entry $HOME/.gtkrc-2.0 "gtk-icon-theme-name=" "gtk-icon-theme-name=\"$ICON_THEME\""
  replace_or_add_entry $HOME/.config/gtk-3.0/settings.ini "gtk-icon-theme-name=" "gtk-icon-theme-name=\"$ICON_THEME\""
  replace_or_add_entry $HOME/.config/gtk-4.0/settings.ini "gtk-icon-theme-name=" "gtk-icon-theme-name=\"$ICON_THEME\""

  # Set GTK Theme
  print_feedback_str 3 "Setting GTK Theme: ${GTK_THEME}"
  replace_or_add_entry $HOME/.gtkrc-2.0 "gtk-theme-name=" "gtk-theme-name=\"$GTK_THEME\""
  replace_or_add_entry $HOME/.config/gtk-3.0/settings.ini "gtk-theme-name=" "gtk-theme-name=$GTK_THEME"
  replace_or_add_entry $HOME/.config/gtk-4.0/settings.ini "gtk-theme-name=" "gtk-theme-name=$GTK_THEME"
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

# print_feedback_str 2 "Installing Orchis GTK Theme..."
# orchis_gtk

# print_feedback_str 2 "Installing Tela Icon Theme..."
# tela_icons

# print_feedback_str 2 "Installing Vimix Cursor Theme..."
# vimix_cursors

print_feedback_str 2 "Configuring interface:"
configure_interface "'Vimix-white-cursors'" "'manjaro-dark'" "'Orchis-Green-Dark-Compact'"

ensure_dependencies -o dconf
# Proceed with the task only if dependencies are met
if [ $? -eq 0 ]; then
  print_feedback_str 2 "Configuring workspaces:"
  configure_workspaces 8
fi
