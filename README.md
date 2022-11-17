# Raph's Dotfiles

## Screenshots

![screenshot1](screenshot1.png)

## Details

- **WM**: [Qtile](http://www.qtile.org/)
- **Terminal**: kitty
- **Application launcher**: Rofi
- **Wallpaper setter**: Feh
- **Wallpapers**: [here](./wallpapers/Pictures/Wallpapers/)
- **Text Editors**: NeoVim & VSCode
- **Keybindings daemon**: sxhkd

## Keybindings

| Action                               | Shortcut                       |
| ------------------------------------ | ------------------------------ |
| **General Keybindings**              |                                |
| Close window                         | super + w                      |
| Kill window                          | super control + x              |
| Logout                               | super + control + 0            |
| Lock screen\*                        | super + control + 9            |
| Restart window manager               | super + control + r            |
| **Moving around**                    |                                |
| Move between windows                 | super + {h, j, k, l}           |
| Change window size                   | super + {y, u, i, o}           |
| Move windows around                  | super + control + {h, j, k, l} |
| **Programs**                         |                                |
| Terminal                             | super + return                 |
| GUI file Manager                     | super + F1                     |
| Firefox                              | super + F2                     |
| Visual Studio Code                   | super + F3                     |
| System Monitor                       | super + F4                     |
| Mail client                          | super + F5                     |
| Note-taking app(vim plugin)          | super + F6                     |
| Calendar app                         | super + c                      |
| Music player                         | super + m                      |
| Application Launcher                 | super + space                  |
| Terminal file manager                | super + v                      |
| **Volume and CMUS external control** |                                |
| Volume up                            | super + up                     |
| Volume down                          | super + down                   |
| Next song                            | super + period                 |
| Previous song                        | super + comma                  |
| Forward song                         | super + control + period       |
| Backward song                        | super + control + comma        |
| Pause                                | super + p                      |
| **Layouts**                          |                                |
| Toggle monocle layout                | super + tab                    |
| Toggle floating window               | super + control + space        |
| Fullscreen                           | super + f                      |

## Installation

To install these dotfiles you either will have to use [Tuckr](https://github.com/RaphGL/Tuckr)(recommended) or GNU Stow.

Tuckr:

```sh
$ tuckr add \*
```

Stow:

1. Change directory to dotfiles/Configs
2. Run:

```sh
$ stow -t $HOME *
```

After deploying the dotfiles, you will probably want to install the programs necessary to use my setup.  
Note: I've created package lists for Arch and Fedora. You can find them at `Dotfiles/.lists`.

Just run your package manager like this:

```sh
$ sudo <PKG_MANAGER> $(cat ~/Dotfiles/.lists/<YOUR_DISTROS_LIST>)
```

If you want to use my neovim, tmux or zsh setups you can run the setup scripts at the `Hooks` directory.

If you're using Tuckr you can just run the names of the programs you want like this:

```sh
$ tuckr set nvim tmux zsh
```

## Optional Steps

After installing the packages you will probably want to tweak the system to your liking.
The following aliases redirect you to different config files related to my dotfiles:

- `kb` for keyboard shortcuts
- `qtilec` for the qtile config
- `astartc` for the startup programs
- `nvimc` for the neovim config

## License

[WTFPL](http://www.wtfpl.net/) © RaphGL
