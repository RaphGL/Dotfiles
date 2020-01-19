call plug#begin()
	Plug 'neomake/neomake'
	Plug 'vim-airline/vim-airline'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'jiangmiao/auto-pairs'
  Plug 'sheerun/vim-polyglot'
	"Nerdtree
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	"Conquer of Completion
	Plug 'scrooloose/nerdcommenter'
	Plug 'christoomey/vim-tmux-navigator'
	"Fuzzy finder
  Plug 'airblade/vim-gitgutter'

	if has('nvim')
  	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
  	Plug 'Shougo/deoplete.nvim'
  	Plug 'roxma/nvim-yarp'
  	Plug 'roxma/vim-hug-neovim-rpc'
	endif

	if has('win32') || has('win64')
  	Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
	else
  	Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
	endif

	Plug 'zchee/deoplete-jedi'
	Plug 'zchee/deoplete-clang'
call plug#end()

"Initialize plugins""
let g:deoplete#enable_at_startup = 1
let g:neomake_open_list = 2
colorscheme dracula
set background=dark
hi Normal guibg=NONE ctermbg=NONE

" Relative numbers "
:set number relativenumber
:set nu rnu

inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         


let g:NERDTreeIgnore = ['^node_modules$']
