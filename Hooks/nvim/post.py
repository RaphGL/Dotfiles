#!/bin/env python

import os
from pathlib import Path

packer_path = Path("~/.local/share/nvim/site/pack/packer/start/packer.nvim").expanduser()

if packer_path.exists():
    print(f"`{packer_path}` already exists. Skipping setup")
    exit()

os.system(f"git clone --depth 1 https://github.com/wbthomason/packer.nvim {packer_path}")
os.system("pip install pynvim msgpack-python jedi")
os.system("sudo npm install -g neovim")
