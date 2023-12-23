## Terminal
Terminal recipe installs and configures following components.
- Patched Nerd Fonts
- Alacritty Config
- Oh My Zsh
- Tpm (Tmux Package Manager)
- nvChad (Config for `nvim` - Neovim)

### Requirements
- <span class="nf em"></span> Optional
- <span class="nf em"></span> Required 

| Dependecy | Optional / Required | Info |
| --------- | --------- | ---- |
| `curl` | <span class="nf em"></span> | ...
| `tar` | <span class="nf em"></span> | ...
| `xz` | <span class="nf em"></span>  | ...
| `git` | <span class="nf em"></span>  | ...
| `zsh` | <span class="nf em"></span> | ...
| `tmux` | <span class="nf em"></span> | ...
| `nvim` &lt;Neovim&gt; | <span class="nf em"></span> | ...

### Patched Nerd Fonts
It will install some patched Nerd Fonts to user fonts directory `~/.fonts`. See exuasted list of fonts installed [here](./references/fonts.md). These fonts are used by terminal, as per current config. 

### Alaritty Config
It will install included `alacritty.yml` to user home (`~/.alacritty.yml`). Following are high level settings for Alacritty.

| Setting | Value | Info |
| ------- | ----- | ---- |
| Theme | Alaritty Nord | See <a href="https://github.com/nordtheme/alacritty" target="_blank">Alacritty Nord</a>.
| Font | Fira Code Nerd Font | See <a href="https://www.nerdfonts.com/" target="_blank">Nerd Fonts</a>.
| `TERM` | `xterm-256color` | Sets the `env.TERM` to `xterm-256color`.

### Oh My Zsh + .zshrc
It will install Oh My Zsh, a framework for ZSH. It also copies included `.zshrc` to user home (`~/.zshrc`). See following tables for variables, aliases and plugins.
- [Variables](./references/zsh.md#variables)
- [Aliases](./references/zsh.md#aliases)
- [Plugins](./references/zsh.md#plugins)

### TPM - Tmux Plugin Manager + .tmux.conf
It install TPM to user home directory at `~/.tmux/plugins/tpm`. It also copies included `.tmux.conf` to user home directory as `~/.tmux.conf`. TPM is enabled and configured in ~/.tmux.conf. See following tables for more info.

- [Tmux Plugins](./references/tmux.md#plugins)
- [Tmux Enabled Features](./references/tmux.md#enabled-features)
- [Tmux Keybindings](./references/tmux.md#keybindings)

### nvChad
It will install <a href="https://nvchad.com/" target="_blank">nvChad</a> - a <i>Blazing fast Neovim config providing solid defaults and a beautiful UI</i>. It will automatically install default configured plugins and enable settings on your next start to nvim. It should install it to `~/.local/config/nvim'.

> You should run `nvim` right after installing `terminal` feature and let it config automatically.

Nothing is touched on newly installed nvChad so it is nothing else except a try to install nvChad. Yet I've documented some <i>key</i> default keybindings [here](./references/nvchad.md#keybindings).

----
