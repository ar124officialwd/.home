### References / Tmux

- [Plugins](#plugins)
- [Enabled Features](#enabled-features)
- [Keybindings](#keybindings)

##### Plugins
| Plugin | Info |
| ------ | ---- |
| tpm | <a href="https://github.com/tmux-plugins/tpm" target="_blank">Tmux Plugin Manager</a> - install and use Tmux Plugins
| Nord Theme <nordtheme/tmux> | <a href="https://github.com/nordtheme/tmux" target="_blank">Tmux Nord Theme</a>.
| Resurrect <tmux-plugins/tmux-resurrect> | <a href="https://github.com/tmux-plugins/tmux-resurrect" target="_blank">Tmux Ressurect</a> - Save and restore tmux sessions.
| Continuum <tmux-plugins/tmux-continuum> | <a href="https://github.com/tmux-plugins/tmux-continuum" target="_blank">Tmux Continuum</a> - Continously save tmux session and restore on tmux server start.
| Online Status <tmux-plugins/tmux-online-status> | <a href="https://github.com/tmux-plugins/tmux-online-status" target="_blank">Tmux Online Status</a> - Show online status in status bar.

##### Enabled Features
| Feature | Info |
| ------- | ---- |
| nordtheme/tmux | Tmux Theme is enabled.
| ----> Prefix Highlight | Highlight Tmux Prefix right in status bar when invoked.
| tmux-resurrect | Save and restore tmux session
| tmux-continuum | Continously save current tmux session
| ---> Save interval | 1 Minute
| ---> Auto Restore | Auto restore saved session on next `tmux server` start.

##### Keybindings
- PIPE means `|` character.

| Key Binding | Task |
| ----------- | ---- |
| `CTRL+b` | default prefix. |
| `<Prefix> -` | Split Window Horizontally |
| `<Prefix> PIPE` | Split Window Vertically |
| `<Prefix> h` | Select Left Pane |
| `<Prefix> l` | Select Right Pane |
| `<Prefix> j` | Select Bottom Pane |
| `<Prefix> k` | Select Upper Pane |
| `<Prefix> w` | Create New Window |
| `<Prefix> t` | Show tmux Clock
| `<Prefix> <Shift>h` | Go to Previous Window |
| `<Prefix> <Shift>l` | Go to Next Window |
| `<Prefix> CTRL+s` | Save current session
| `<Prefix> CTRL+r` | Restore last saved session

----
