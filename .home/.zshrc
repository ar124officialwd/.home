# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode yarn)

source $ZSH/oh-my-zsh.sh

### ALIASES ###################################################################
# Define package manager aliases based on the distribution
# Get the distribution name from /etc/os-release
distribution=""
if [[ -r /etc/os-release ]]; then
    distribution=$(awk -F= '/^ID=/{print $2}' /etc/os-release | tr -d '"')
else
    echo "Error: /etc/os-release not found or not readable."
    exit 1
fi

case "$distribution" in
  "ubuntu" | "debian")
    alias p_="sudo apt-get"
    alias p_i="p_ install"
    alias p_r="p_ remove"
    alias p_u="p_ upgrade"
    alias p_s="sudo apt search"
    alias p_rr="_p update"
    ;;

  "fedora" | "centos" | "rhel")
    alias p_="sudo dnf"
    alias p_i="p_ install"
    alias p_r="p_ remove"
    alias p_u="p_ update"
    alias p_s="p_ search"
    alias p_rr="p_ makecache"
    ;;

  "opensuse" | "opensuse-leap" | "opensuse-tumbleweed")
    alias p_="sudo zypper"
    alias p_i="p_ install"
    alias p_r="p_ remove"
    alias p_u="p_ update"
    alias p_s="p_ search"
    alias p_rr="p_ refresh"
    ;;

  "arch" | "manjaro")
    alias p_="sudo pacman"
    alias p_i="p_ -S"
    alias p_r="p_ -R"
    alias p_u="p_ -Syu"
    alias p_s="p_ -Ss"
    alias p_rr="p_ -Sy"
    ;;

  *)
    # Ignore unsupported distributions without any output
    ;;
esac

alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias e="nvim"

alias d="docker"
alias dc="docker-compose"
alias dc_b="dc build"
alias dc_u="dc up"
alias dc_d="dc down"
alias dc_k="dc kill"
alias dc_r="dc rm --clean-deps"
alias dc_clean="dc_k && echo && dc_r"
alias di="docker image"
alias dis="docker images"

alias g="git"
alias g-c="g clone"
alias g-pl="g pull"
alias g-ps="g push"
alias g-co="g checkout"
alias g-con="g checkout -b"
alias g-m"g merge"

alias ll="ls -la"
alias cls="clear"
alias c="cls"
alias zshr="source ~/.zshrc"
alias zshe="edit ~/.zshrc"

### VARIABLES #################################################################
export LANG=en_US.UTF-8
export EDITOR='nvim'

export RUST=~/.cargo/bin/

export TPM_DIR="$HOME/.tmux/plugin/tpm"
export NVCHAD_DIR="$HOME/.config/nvim"
export FNM_DIR=$HOME/.fnm

export PATH="$FNM_DIR:$RUST:$PATH"
command -v fnm >/dev/null 2>&1 && eval "`fnm env`"

# pnpm
export PNPM_HOME="/home/ar/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
