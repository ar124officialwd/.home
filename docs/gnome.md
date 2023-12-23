## Gnome
Terminal recipe installs and configures following components.

- Installations
    - Orchis GTK Theme <a class="nf em" href="http://bit.ly/3GQq8Z8"></a>
    - Tela Icon Theme <a class="nf em" href="https://bit.ly/41CPe7d"></a>
    - Vimix Cursor Theme <a class="nf em" href="https://bit.ly/48aG98c"></a>
- Configurations
    - Themes
    - Static Workspaces
    - Custom Shortcuts

### Requirements
- <span class="nf em"></span> Optional
- <span class="nf em"></span> Required 

| Dependecy | Optional / Required | Info |
| --------- | --------- | ---- |
| `dconf` | <span class="nf em"></span>  | Various setting are applied using `dconf`...
| `git` | <span class="nf em"></span>  | Themes are installed from Public Github Repositories...
| `sassc` | <span class="nf em"></span> | Build time Dependecy for Orchis GTK Theme

#### Configurations
| Configuration | Settings Applied |
| ------------- | ---------------- |
| GTK Theme | Orchis Dark Compact |
| Icon Theme | Tela Manjaro Dark |
| Cursor Theme | Vimix Cursors White |
| Dynamic Workspaces | `false` |
| Static Workspaces | True |
| Number of workspaces | `8` |

#### Shortcuts
| Keybinding | Action |
| ---------- | ------ |
| `<Super>1` | Switch to workspace 1
| `<Super>2` | Switch to workspace 2
| `<Super>3` | Switch to workspace 3
| `<Super>4` | Switch to workspace 4
| `<Super>5` | Switch to workspace 5
| `<Super>6` | Switch to workspace 6
| `<Super>7` | Switch to workspace 7
| `<Super>8` | Switch to workspace 8
| `<Super><ENTER>` | Launch Terminal <alacritty>
| `<Super><Shift><ENTER>` | Launch Terminal with Tmux Session<alacritty>

----------
