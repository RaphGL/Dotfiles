#!/bin/env python
import os
import platform

# TODO: convert arch_pkgs and fedora_pkgs into a single dictionary list thingy so I can
# more easily keep the packages used in both distros synced

arch_pkgs = [
    "adobe-source-han-sans-jp-fonts",
    "base-devel",
    "bat",
    "calcurse",
    "clang",
    "cmake",
    "cmus",
    "curl",
    "dash",
    "dunst",
    "firefox",
    # flameshot is not working on wayland for now so it's out for now
    # "flameshot",
    "fzf",
    "gimp",
    "git",
    "go",
    "gscan2pdf",
    "gvfs",
    "gvfs-mtp",
    "htop",
    "ibus",
    "ibus-anthy",
    "kdenlive",
    "kitty",
    "lxappearance",
    "lxqt-policykit",
    "mpv",
    "mtpfs",
    "neovim",
    "npm",
    "openssh",
    "python-pip",
    "qbittorrent",
    "qt5ct",
    "qtile",
    "rofi",
    "sxhkd",
    "telegram-desktop",
    "tldr",
    "tmux",
    "ttf-jetbrains-mono",
    "ttf-ubuntu-font-family",
    "veracrypt",
    "ripgrep",
    "yt-dlp",
    "zsh",
]

fedora_pkgs = [
    "acpid",
    "adobe-source-han-sans-jp-fonts",
    "alsa-utils",
    "anki",
    "bat",
    "calcurse",
    "clang",
    "cmake",
    "cmus",
    "curl",
    "dash",
    "dunst",
    "firefox",
    "flameshot",
    "fzf",
    "gimp",
    "git",
    "go",
    "htop",
    "ibus",
    "ibus-anthy",
    "kdenlive",
    "kitty",
    "libreoffice",
    "lxappearance",
    "lxqt-policykit",
    "mpv",
    "neofetch",
    "neovim",
    "npm",
    "openssh",
    "picom",
    "python-pip",
    "qbittorrent",
    "qt5ct",
    "rofi",
    "sxhkd",
    "tldr",
    "bat",
    "yt-dlp",
    "zsh",
]

distro_name = platform.freedesktop_os_release()["NAME"]

curr_distro_pkgs_install = ""
match distro_name:
    case "Arch Linux":
        curr_distro_pkgs_install = f"sudo pacman -S --needed {" ".join(arch_pkgs)}"
    case "Fedora":
        curr_distro_pkgs_install = f"sudo dnf install {" ".join(fedora_pkgs)}"
    case _:
        print(f"ERROR: there's no packages setup for {distro_name}")
        exit(1)

print(f"=== INSTALLING PACKAGES FOR {distro_name} ===")
os.system(curr_distro_pkgs_install)
