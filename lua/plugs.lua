return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "cpp", "python", "lua", "vim", "vimdoc", "query" },
				highlight = { enable = true },
			})
		end,
	},
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
        c = { "clang-format" },
        cpp = { "clang-format" },
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
		  "clangd",
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
  	 config = function()
    	 	require("telescope").setup({
      	 		extensions = {
         			["ui-select"] = { require("telescope.themes").get_dropdown{} }
      			}
    		})
    		require("telescope").load_extension("ui-select")
  	end
},
  {
    "mfussenegger/nvim-dap",
    ft = { "c", "cpp" },
    config = function()
      local dap = require("dap")
      dap.listeners.before.attach.dapui_config = function()
        require("dapui").open()
      end
      dap.listeners.before.launch.dapui_config = function()
        require("dapui").open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        require("dapui").close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        require("dapui").close()
      end

      -- Keymaps
      vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
      vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
      vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
      vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
      vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
      vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    ft = { "c", "cpp" },
    config = function()
      require("dapui").setup()
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    ft = { "c", "cpp" },
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    opts = {
      ensure_installed = { "codelldb" },
      handlers = {},
    },
  },

}

