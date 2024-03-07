#!/bin/zsh

## Alacritty --------------------------------------------------------- ##
light_config="$HOME/.alacritty-light.yml"
dark_config="$HOME/.alacritty-dark.yml"
current_config="$HOME/.alacritty.yml"

current_target=$(readlink -f "$current_config")

if [ "$current_target" = "$light_config" ]; then
    new_config="$dark_config"
else
    new_config="$light_config"
fi

ln -sf "$new_config" "$current_config"

## Tmux -------------------------------------------------------------- ##
light_config="$HOME/.tmux-light.conf"
dark_config="$HOME/.tmux-dark.conf"
current_config="$HOME/.tmux.conf"

current_target=$(readlink -f "$current_config")

if [ "$current_target" = "$light_config" ]; then
    new_config="$dark_config"
else
    new_config="$light_config"
fi

ln -sf "$new_config" "$current_config"
tmux source-file "$new_config" \; display-message "Theme switched..."
