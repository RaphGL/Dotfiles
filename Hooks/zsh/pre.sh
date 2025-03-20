#!/bin/env python

import os
from pathlib import Path

plugins_dir = Path("~/.zsh-plugins").expanduser()

plugins = {
    "zsh-syntax-highlighting": "https://github.com/zsh-users/zsh-syntax-highlighting.git"
}

if not plugins_dir.exists():
    print(f"creating plugins dir: {plugins_dir}")
    plugins_dir.mkdir()

for plugin, git_url in plugins.items():
    plugin_dir = plugins_dir.joinpath(plugin)
    if plugin_dir.exists():
        print(f"`{plugin}` has already been installed")
        continue

    os.system(f"git clone {git_url} {plugin_dir}")
    os.system("chsh -s $(which zsh)")
