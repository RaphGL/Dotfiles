-- Starts plugin manager and loads extensions --
require('packer').startup(function()
	-- so packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Appearance plugins
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
        require('lualine').setup({
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          },
          tabline = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { require'tabline'.tabline_buffers },
            lualine_x = { require'tabline'.tabline_tabs },
            lualine_y = {},
            lualine_z = {},
          },
      })
    end
  }
  use {
    'kdheepak/tabline.nvim',
    config = function()
      require'tabline'.setup {
        enable = false,
        show_filename_only = true
      }
    end,
    requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
  }
	use 'sheerun/vim-polyglot' -- nicer syntax highlighting
	use {
		'dracula/vim',
		as = 'dracula'
	}

	-- CTRL + P like menu
	use 'junegunn/fzf'

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

  -- File Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
        require("nvim-tree").setup()
    end
  }
end)
