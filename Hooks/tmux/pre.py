#!/bin/env python

import os
from pathlib import Path

plugins_path = Path("~/.tmux/plugins").expanduser()

if not plugins_path.exists(): 
    print(f"creating plugins destination directory: {plugins_path}")
    plugins_path.mkdir()

plugins = {
    "tpm": "https://github.com/tmux-plugins/tpm",
}

for plugin, git_url in plugins.items():
    plugin_dest = plugins_path.joinpath(plugin)

    if plugin_dest.exists():
        print(f"`{plugin}` has already been installed.")
        continue

    print(f"=== Installing plugin: `{plugin}` ===\n")
    os.system(f"git clone {git_url} {plugin_dest}")
