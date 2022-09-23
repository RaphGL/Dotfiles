require('plugins')
require('keybindings')
require('coc')

-- Unsupported Options on Lua
vim.cmd [[
	syntax enable
	colorscheme dracula
]]

-- Make background transparent
vim.cmd [[
	augroup TransparentColours
	autocmd!
	autocmd ColorScheme * highlight normal ctermbg=NONE guiBG=NONE
	augroup end
]]

--- Autoformat languages
vim.cmd [[
  autocmd BufWritePre *.go Fmt
]]

---- Config variables ----
vim.g.mapleader = ','
vim.opt.background = 'dark'
vim.opt.mouse = 'a'
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.backup = false
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = 'full'
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.fileencoding = 'utf-8'
vim.opt.undofile = true

-- FZF --
vim.env.FZF_DEFAULT_OPTS = "--preview 'bat {} --color=always --style header-filename'"
vim.keymap.set('n', '<C-p>', ':FZF<CR>', {remap=false})

-- VimWiki --
vim.g.vimwiki_list = {
	{
		path = '~/Documents/VimWiki',
		path_html = '~/Documents/VimWiki_html',
	}
}

-- Git Gutter --
vim.g.gitgutter_enabled = 1
vim.g.gitgutter_map_keys = 0

-- NerdTree -- 
vim.keymap.set('i', 'jk', '<ESC>', {noremap=true})
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')
vim.keymap.set('v', '++', '<plug>NERDCommenterToggle')
vim.keymap.set('n', '++', '<plug>NERDCommenterToggle')
vim.g.NERDTreeGitStatusWithFlags = 1
vim.g.NERDTreeIgnore = {'^node_modules$'}
