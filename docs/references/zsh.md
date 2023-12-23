### References / ZSH

- [Variables](#variables)
- [Aliases](#aliases)
- [Plugins](#plugins)

##### Variables
| Variable | Value |
| -------- | ----- |
| `ZSH_THEME` | `robbyrussell` |
| `LANG` | `en_US.UTF-8` |
| `EDITOR` | `nvim` |
| `TPM_DIR` | `$HOME/.tmux/plugin/tpm` |
| `NVCHAD_DIR` | `$HOME/.config/nvim"` |
| `FNM_DIR` | `$HOME/.fnm` |
| `PATH` | `$FNM_DIR:$PATH` |

##### Aliases
| Alias | Command | Info |
| ----- | ------- | ---- |
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

##### Generic Aliases
Following aliases are generic, distribution dependent. If distribution is not recognized by script successfully, these alias might not be defined at all.

- `Your Package Manager`: `apt-get` or `apt` if Ubuntu / Debian, `dnf` if Fedora / CentOS / RHEL, `zypper` if openSUSE or `pacman` if Arch detected.

| Alias | Command | Info |
| ----- | ------- | ---- |
| `p_` | `Your Package Manager` | Zypper with `sudo`
| `p_i` | `p_ ...` | Install a package
| `p_r` | `p_ ...` | Uninstall package
| `p_u` | `p_ ...` | Upgrade a package
| `p_s` | `p_ ...` | Search a package
| `p_rr` | `p_ ...` | Refresh Package Repositories

##### Plugins
| Plugin | Info |
| ------ | ---- |
| vi-mode | Use vim like keybinding for Zsh prompt.

----
