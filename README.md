# dothome
My Personal <i>(but Public)</i> Linux Desktop Configuration Repository

### <span style="color: red">Caution</span>
You should not use this script if you don't know what exactly you want to do. Some parts may behave as **<span style="color: red">DESTRUCTIVE**</span> like it may overwrite your existing files or configs.

### Features / Programs Included
Click "Read More" link against each feature to read more about installed components, files and applied configurations (like shortcuts).

| Feature | Description | See Details
| ------- | ----------- | -----------
| 👉 Terminal | Super-Charge your Linux terminal | [Read More](./docs/terminal.md)
| 👉 Gnome | Configure Gnome to use stylish UI + Sensible settings | [Read More](./docs/gnome.md)
| 👉 NodeJS | Install NodeJS version manager, plus latest LTS NodeJS, plus common global node modules. | [Read More](./docs/nodejs.md)

### Requirements
These scripts need some programs or features to be already installed on host system in order to be installed, configured or run. Some are below:

- `curl` | `curl` needs to be installed to download some components and installers.
- `git` | Some features are fetched and installed from Public Github Repositories, so `git` is a must for those to be installed.
- `zsh` | ZSH is everywhere, it is only targeted shell and also these scripts are written in ZSH.
- `tmux` | Tmux features requires that `tmux` is aready required.
- `nvim` | `Neovim` (>= 0.9.x) should be installed. `nvChad` is added to [Terminal](./docs/terminal.md) feature.
- `Gnome Desktop Environment` | [Gnome](./docs/gnome.md) feature requires that Gnome and `dconf` are already installed.

### Usage
1. Clone the Repo
```zsh
git clone https://github.com/ar124official2019/.home.git
```

2. Open Repo Directory
```zsh
cd .home
```

3. Launch the installer
```zsh
zsh install.next.sh
```

4. Follow the prompt / instructions to install a particular feature, all features or to quit.

----------
----------
----------
