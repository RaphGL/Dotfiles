# Raph's Dotfiles  

This config was structured so that [GNU Stow](https://www.gnu.org/software/stow/) could be used to quickly set everything up.  

## Screenshots  

![screenshot1](screenshot1.jpg)  
![screenshot2](screenshot2.jpg)  

## Details  

- **WM**: [Qtile](http://www.qtile.org/) and [BSPWM](https://github.com/baskerville/bspwm)
- **Terminal**: kitty  
- **Application launcher**: Rofi  
- **Wallpaper setter**: Feh  
- **Wallpapers**: [here](./wallpapers/Pictures/Wallpapers/)  
- **Text Editors**: NeoVim & VSCode  
- **Keybindings daemon**: sxhkd  

## Keybindings  

|          Action         | Shortcut                       |
|:-----------------------:|--------------------------------|
| **General Keybindings**                                  |
| Close window            | super + w                      |
| Kill window             | super control + x              |
| Logout                  | super + control + 0            |
| Lock screen*            | super + control + 9            |
| Restart window manager  | super + control + r            |
| **Moving around**                                        |
| Move between windows    | super + {h, j, k, l}           |
| Change window size      | super + {y, u, i, o}           |
| Move windows around     | super + control + {h, j, k, l} |
| **Programs**                                             |
| Terminal                | super + return                 |
| GUI file Manager        | super + F1                     |
| Firefox                 | super + F2                     |
| Visual Studio Code      | super + F3                     |
| System Monitor          | super + F4                     |
| Mail client             | super + F5                     |
| Note-taking app         | super + F6                     |
| Calendar app            | super + c                      |
| Music player            | super + m                      |
| Application Launcher    | super + r                      |
| Terminal file manager   | super + v                      |
| **Volume and CMUS external control**	         		   |
| Volume up		          | super + up                     |
| Volume down		      | super + down                   |
| Next song	          	  | super + period                 |
| Previous song	     	  | super + comma                  |
| Forward song		      | super + control + period       |
| Backward song		      | super + control + comma        |
| Pause 		          | super + p                      |
| **Layouts**                                              |
| Toggle monocle layout   | super + tab                    |
| Toggle floating window  | super + control + space        |
| Fullscreen              | super + f                      |

## Installation  
To set all the dotfiles make sure you have stow installed and then run:  
```sh
$ ./dotfiles/.scripts/stowit -f
```   

After setting everything up you will probably want to install the programs necessary to run dotfiles.  
Note: If you're not running Arch Linux some packages may be named differently or not present in the official repos. You can rename or remove them in the dotfiles/.lists if needed.  

**For a complete install:**  
If you're on arch:  
```sh
$ sudo ./dotfiles/.scripts/pacin.sh # Installs dependencies and programs I use frequently
$ ./dotfiles/.scripts/aurpacs.sh # Installs AUR packages I use
```  

If you're on anything else:
```sh
$ sudo YOUR_PACKAGE_MANAGER INSTALL_COMMAND $(cat ~/dotfiles/.lists/packages.list)
```
The complete install installs code editors, a web browser, an image viewer, a file manager and other programs.  

**For a minimal install:**  
if you're on arch:
```sh
$ sudo pacman -S --needed $($HOME/dotfiles/.scripts/lists/base_packages.list)
```  

If you're on anything else:
```sh
$ sudo YOUR_PACKAGE_MANAGER INSTALL_COMMAND $(cat $HOME/dotfiles/.lists/base_packages.list)
```
The minimal install installs only the bare minimum to get you up and running, you will have to install most programs yourself.  
After installing them you will probably want to setup keybindings for them, to do so you can edit the keybinding daemon's configuration located at `$HOME/.config/sxhkd/sxhkdrc` or simply run:  
```sh
$ kb
```

### Manual installation  
Remove colliding dotfiles between the repo and your home folder and run:  
```sh
$ cd ~/dotfiles && rm *.md *.png LICENSE && stow --adopt *
```  
If you don't remove the dotfiles that collide with the repo's then your dotfiles will be used instead, if they don't exist then mine will be used instead. For more information read GNU Stow's man page.  

Note:  
You will probably want to edit Qtile's config file and install the following if you intend to use my Zsh and Vim configurations:  
- [Oh my Zsh!](https://ohmyz.sh/)  
- [Zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)  
Make sure to clone both *Oh my Zsh!* and *Zsh-syntax-highlighting* to the ~/.zsh-plugins directory or source them yourself  
- [Vim-plug](https://github.com/junegunn/vim-plug) 
If you intend to use my vim setup make sure to install pip's pynvim and npm's neovim packages. For C or python you need to install clang and jedi(pip package) repectively.
