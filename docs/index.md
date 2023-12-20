# dothome
My Personal Linux Desktop Configuration Repository

# <span style="color: red">DON'T USE UNLESS YOU KNOW WHAT YOU ARE DOING</span>
<span style="color: red">You should not use this recipe if you don't know what exactly you want to do. Some parts may behave as **VERY DANGEGROUS** like it may overwrite your existing files.</span>

# Personal but Public
Although it is very personalized for me, but one may install and use **if itsuits**.

# Inclusions
Further details about particular feature are very below the following table; More details are added to dedicated README file for each feature. Explore `docs` directory to read more. 

| Feature | Description | See Details
| ------- | ----------- | -----------
| 👉 Oh My ZSH | A framework for ZSH | [Read More](./ohmyzsh.md)
| 👉 FNM | Fast Node version Manager | [Read More](./fnm.md)
| 👉 Node Modules | Common Global NodeJS Modules (nodemon,pm2,...) | [Read More](./node-modules.md)
| 👉 TPM | Tmux Plugin Manager | [Read More](./tpm.md)
| 👉 NvChad | Suitable Neovim Config | [Read More](./nvchad.md)
| 👉 Fonts | Patched Nerd Fonts (Fira Code Mono Nerd) | [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
| 👉 Icon Theme | Tela Icon Theme - manjaro theme | [Tela Icon Theme](https://github.com/vinceliuice/Tela-icon-theme)
| 👉 GTK Theme | Orchis GTK Theme - green theme | [Orchis GTK Theme](https://github.com/vinceliuice/Orchis-theme/)
| 👉 Cursor Theme | Vimix Cursor Theme | [Cursor Theme](https://github.com/vinceliuice/Vimix-cursors)
| 👉 Copy Configs | <span style="color: red">Copy Existing Configuration Files to home</span> | [Read More](./copy.md)
| 👉 Configure | <span style="color: red">Configure common settings</span> | [Read More](./configure.md)

## 👉 Copy Config
It will copy everything from `.home` directory included in repo to `~` or `$HOME`.

<span style="color: red">This may prove to be **VERY DANGEGROUS** as it will **`OVERWRITE`** your existing files.</span>

## 👉 Configure 
It will configure some parts of linux user system and apply some sensible configurations.

<span style="color: red">This may prove to be **VERY CONFUSING** as it will **`OVERWRITE`** your existing configurations.

## Requirements
These scripts need some programs or features to be already installed on host system in order to be installed, configured or run.

- `curl` or `wget` | Either needs to be installed to download some components and installers.
- `git` | Some features are fetched and installed from Public Github Repositories, so `git` is a must for those to be installed.
- `zsh` | ZSH is everywhere, it is only targeted shell and also these scripts are written in ZSH.
- `tmux` | Tmux feature requires that `tmux` is aready required.
- `neovim` | `Neovim` (>= 0.9.x) should be installed if `NvChad` needs to be added / configured.
- `Gnome Desktop Environment` | To configure the interface, only `Gnome Desktop Environment` is targeted. Also `dconf` needs to be installed as well.

## Usage
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

> <span style="color:red">Depcrecated: DO NOT DIRECTLY RUN `install.sh`</span>