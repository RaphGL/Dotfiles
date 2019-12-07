call plug#begin()
	Plug 'neomake/neomake'
	Plug 'shougo/deoplete.nvim'
	Plug 'vim-airline/vim-airline'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'jiangmiao/auto-pairs'
	Plug 'scrooloose/nerdtree'
call plug#end()
let g:deoplete#enable_at_startup = 1
let g:neomake_open_list = 2
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)
colorscheme dracula
set background=dark
hi Normal guibg=NONE ctermbg=NONE

" Relative numbers "
:set number relativenumber
:set nu rnu
