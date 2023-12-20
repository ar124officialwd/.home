#!/bin/zsh

configure_workspaces() {
    NUM_WORKSPACES=$1
    echo "\tConfigure workspaces:"

    echo "\t\tEnabling Static Workspaces"
    dconf write /org/gnome/mutter/dynamic-workspaces false

    echo "\t\tSetting number of workspaces to: ${NUM_WORKSPACES}"
    dconf write /org/gnome/desktop/wm/preferences/num-workspaces $NUM_WORKSPACES

    echo "\t\tSetting shortcuts for switching to worksapce (1..8)"
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

    echo "\tConfiguring interface:"

    echo "\t\tCursor Theme: ${CURSOR_THEME}"
    dconf write /org/gnome/desktop/interface/cursor-theme $CURSOR_THEME

    echo "\t\tIcon Theme: ${ICON_THEME}"
    dconf write /org/gnome/desktop/interface/icon-theme $ICON_THEME

    echo "\t\tGTK_THEME Theme: ${GTK_THEME}"
    dconf write /org/gnome/desktop/interface/gtk-theme $GTK_THEME

    # TODO: Enable gnome shell theme
}

if hash dconf 2>/dev/null; then
    NUM_WORKSPACES=8
    configure_workspaces $NUM_WORKSPACES
    configure_interface "'Vimix-cursors'" "'manjaro-dark'" "'Orchis-Green-Dark-Compact'"
else
    echo 'dconf command not found. Make sure `Gnome` and `dconf` is installed!'
    exit 1
fi