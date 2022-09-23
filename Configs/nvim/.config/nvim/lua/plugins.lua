-- Starts plugin manager and loads extensions --
require('packer').startup(function()
	-- so packer can manage itself
	use 'wbthomason/packer.nvim'
	-- Appearance plugins
	use 'vim-airline/vim-airline'
	use 'sheerun/vim-polyglot' -- nicer syntax highlighting
	use {
		'dracula/vim',
		as = 'dracula'
	}
	-- CTRL + P like menu
	use 'junegunn/fzf'
	-- Nerdtree
	use 'scrooloose/nerdtree'
	use 'xuyuanp/nerdtree-git-plugin'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'
	-- Get Git Info
	use 'airblade/vim-gitgutter'
	-- Markdown tables easier
	use 'dhruvasagar/vim-table-mode'
  -- Zig syntax highlighting and file detection
  use 'ziglang/zig.vim'
	-- Autocompletion
	use {
		'neoclide/coc.nvim',
		branch = 'release'
	}
end)
