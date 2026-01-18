return {
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{"nvim-neo-tree/neo-tree.nvim",
    	branch = "v3.x",
	cmd = "Neotree",
    	dependencies = {
      		"nvim-lua/plenary.nvim",
      		"nvim-tree/nvim-web-devicons", -- для иконок
      		"MunifTanjim/nui.nvim",
    	},
    	config = function()
      	require("neo-tree").setup({
        close_if_last_window = true, 
        popup_border_style = "rounded", 
        enable_git_status = true,      
        enable_diagnostics = true,     
        use_default_mappings = true,
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })
    end,
  },
  {"folke/which-key.nvim"},
  {"neovim/nvim-lspconfig"},
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-nvim-lsp"},  
  {"L3MON4D3/LuaSnip"},
  {"saadparwaiz1/cmp_luasnip"},
  {"nvim-tree/nvim-web-devicons"},
  {"lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
    	indent = { char = "│" },
    	scope = { enabled = false }
    }
  },
  {
  "stevearc/conform.nvim",
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        python = { "isort", "black" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    })
    
  end
  },
  {"williamboman/mason.nvim",
  opts = {
	  ensure_installed = {
		  "pyright",
	  },
  },
  },
  {
	"nvim-lualine/lualine.nvim"
  },
  {
	  "catppuccin/nvim"
  },
  {
  	  "folke/noice.nvim",
          dependencies = { "MunifTanjim/nui.nvim" },
          config = function()
             require("noice").setup()
          end
  },
  {
  	 "nvim-telescope/telescope.nvim",
  	 dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
	 cmd = "Telescope",
  	 config = function()
    	 	require("telescope").setup({
      	 		extensions = {
         			["ui-select"] = { require("telescope.themes").get_dropdown{} }
      			}
    		})
    		require("telescope").load_extension("ui-select")
  	end
},

}

