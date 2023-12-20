# Copy
It will copy everything from `.home` directory included in repo to `~` or `$HOME`.

<span style="color: red">This may prove to be **VERY DANGEGROUS** as it will **`OVERWRITE`** your existing files.</span>

# `Copy` feature will:
- Copy everything from `.home` directory in the repo to user home (`~` or `$HOME`) directory.

    - `.tmux.conf` Configuration file for `tmux`
        - Automatic window rename

        - Load Plugins

        | Plugin | Info |
        | ------ | ---- |
        | `tpm` | Tmux Plugin Manager
        | `arcticicestudio/nord-tmux` | Nord Theme for Tmux

        - Key Bindings

        | Key Binding | Task |
        | ----------- | ---- |
        | `CTRL+b` | default prefix. |
        | `<Prefix> h` | Select Left Pane |
        | `<Prefix> l` | Select Right Pane |
        | `<Prefix> j` | Select Bottom Pane |
        | `<Prefix> k` | Select Upper Pane |
        | `<Prefix> w` | Create New Window
        | `<Prefix> <Shift>h` | Go to Previous Window
        | `<Prefix> <Shift>l` | Go to Next Window

    - `.alacritty.yml`: Configuration for `Alacritty Terminal`
        - Set `term` env variable to `xterm-256color`
        - Set font to `FiraCode Nerd Font`
        - Set color theme to: `Nord`

    - `.Xresources`
        - Set font to `FiraCode Nerd Font`
        - Set color theme to: `Nord`

    - `.zshrc`
        - Enable `Oh My Zsh`
            - Enable Oh My Zsh plugins:
                - `vi-mode`: Use vim like motions for prompt
        - Use default theme: `robbyrussell`
        - Add sensible aliases for `zypper`, `vim`, `docker`, `zshrc` and some system commands like `ls`. Alias are listed below, be careful in reading, as one an alias is declared, in its following commands it uses alias instead of original command.

            | Alias | Command | Info
            | ----- | ------- | ----
            | `zy` | `sudo zypper` | Zypper with `sudo`
            | `zyi` | `zy install` | Install package
            | `zyr` | `zy remove` | Uninstall package
            | `zyrr` | `zy refresh` | Refresh Zypper Repositories
            | `zys` | `zy search` | Search a package
            | `vim` | `nvim` | Neovim instead of vim
            | `vi` | `nvim` | Neovim instead of vi
            | `v` | `nvim` | Neovim
            | `e` | `nvim` | Text Editor (Neovim)
            | `d` | `docker` | Docker runtime
            | `dc` | `docker-compose` | Docker-Compose
            | `dc_b` | `dc build` | Docker-Compose build
            | `dc_u` | `dc up` | Docker-Compose Up / Start
            | `dc_d` | `dc down` | Docker-Compose Down / Stop
            | `dc_k` | `dc kill` | Docker-Compose Kill
            | `dc_r` | `dc rm --clean-deps` | Docker Remove container
            | `dc_clean` | `dc_k && echo && dc_r` | Docker-Compose clean / Stop and remove stack
            | `di` | `docker image` | Docker image
            | `dis` | `docker images` | Docker images
            | `ll` | `ls -la` | List all files including dot files
            | `cls` | `clear` | Clear screen / terminal
            | `c` | `cls` | Clear screen / terminal
            | `zshr` | `source ~/.zshrc` | Reload ZSH config
            | `zshe` | `edit ~/.zshrc` | Edit ZSH config

        > `zypper` is a package manager for OpenSuse Linux Distribution. `docker` is a container runtime. `docker-compose` is an extension to `docker` for composing docker stacks. 
