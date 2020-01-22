# Raph's Dotfiles  

This config was structured so that [GNU Stow](https://www.gnu.org/software/stow/) could be used to quickly set everything up.

## Screenshots  

![screenshot1](screenshot1.png)  
![screenshot2](screenshot2.png)  

## Details  

- **WM**: [Qtile](http://www.qtile.org/)  
- **Terminal**: URxvt  
- **Application launcher**: Rofi  
- **Wallpaper setter**: Nitrogen  
- **Wallpapers**: [here](./background/Pictures)
- **Text Editors**: NeoVim & VSCode  

## Keybindings  

|          Action         | Shortcut                       |
|:-----------------------:|--------------------------------|
| **General Keybindings**                                  |
| Kill window             | super + w                      |
| Kill Qtile              | super + control + 0            |
| Lock screen             | super + control + 9            |
| Restart Qtile           | super + control + r            |
| Switch layout           | super + tab                    |
| **Moving around**                                        |
| Move between windows    | super + [h, j, k, l]           |
| Change window size      | super + [y, u, i, o]           |
| Move windows around     | super + control + [h, j, k, l] |
| **Programs**                                             |
| Program Launcher        | super + r                      |
| Calendar app            | super + c                      |
| Music player            | super + m                      |
| Terminal                | super + return                 |
| File Manager            | super + F1                     |
| Firefox                 | super + F2                     |
| Visual Studio Code      | super + F3                     |
| System Monitor          | super + F4                     |
| **Other layouts**                                        |
| Floating window         | super + control + space        |
| Fullscreen              | super + f                      |

## Installation  

After cloning cloning the repository run:  
```sh
cd ~/dotfiles && sudo sh install_dotfiles.sh #still working on it
```  

### Manual installation  
Remove colliding dotfiles between the repo and your home folder and run:  
```sh
cd ~/dotfiles && rm README.md *.png && stow --adopt *
```  
Note:  
You will probably want to edit Qtile's config file and install the following if you intend to use my Zsh and Vim configurations:  
- [Oh my Zsh!](https://ohmyz.sh/)  
- [Zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)  
- [Vim-plug](https://github.com/junegunn/vim-plug)  
