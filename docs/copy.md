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

            | Alias | Command |
            | ----- | ------- |
            | `zy` | sudo zypper |
            | `zyi` | zy install |
            | `zyr` | zy remove |
            | `zyrr` | zy refresh |
            | `zys` | zy search |
            | `vim` | nvim |
            | `vi` | nvim |
            | `v` | nvim |
            | `e` | nvim |
            | `d` | docker |
            | `dc` | docker-compose |
            | `dc_b` | dc build |
            | `dc_u` | dc up |
            | `dc_d` | dc down |
            | `dc_k` | dc kill |
            | `dc_r` | dc rm --clean-deps |
            | `dc_clean` | dc_k && echo && dc_r |
            | `di` | docker image |
            | `dis` | docker images |
            | `ll` | ls -la |
            | `cls` | clear |
            | `c` | cls |
            | `zshr` | source ~/.zshrc |
            | `zshe` | edit ~/.zshrc |

        > `zypper` is a package manager for OpenSuse Linux Distribution. `docker` is a container runtime. `docker-compose` is an extension to `docker` for composing docker stacks. 
