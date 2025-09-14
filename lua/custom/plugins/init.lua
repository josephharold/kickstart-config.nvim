-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)

-- See the kickstart.nvim README for more information
local M = {
  -- language plugins
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  -- others
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      -- import default setups
      require('bufferline').setup {
        options = {
          separator_style = 'slant',
        },
      }

      -- import configs
      local buffer_modes = { 'n', 'v' }
      vim.keymap.set(buffer_modes, '<leader>bd', '<cmd>bd<CR>', { desc = '[buffer] close all' })
      vim.keymap.set(buffer_modes, '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = '[buffer] close others' })
      vim.keymap.set(buffer_modes, '<leader>br', '<cmd>BufferLineCloseRight<CR>', { desc = '[buffer] close right' })
      vim.keymap.set(buffer_modes, '<leader>bl', '<cmd>BufferLineCloseLeft<CR>', { desc = '[buffer] close left' })
      vim.keymap.set(buffer_modes, 'H', '<cmd>BufferLineCyclePrev<CR>', { desc = '[buffer] move prev' })
      vim.keymap.set(buffer_modes, 'L', '<cmd>BufferLineCycleNext<CR>', { desc = '[buffer] move next' })
    end,
  },
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = false,
    opts = {},
    config = function()
      require('refactoring').setup()
      local rf_modes = { 'n', 'v', 'x' }

      -- map <leader>cr to change variable name
      vim.keymap.set(rf_modes, '<leader>cr', function()
        -- always start with an empty string instead of current word
        local new_variable_name = vim.fn.input('New name: ', '')
        if new_variable_name ~= '' then
          vim.lsp.buf.rename(new_variable_name)
        end
      end, { noremap = true, silent = true, desc = '[code] rename' })

      vim.keymap.set(rf_modes, '<leader>cc', function()
        require('refactoring').select_refactor()
      end, { desc = '[code] refactor' })
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      direction = 'horizontal',
      size = 10,
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)

      local term_modes = { 'n', 'i', 'v', 't' }
      local keymap_conf = { noremap = true, silent = true }
      -- map in normal, insert, and visual mode
      vim.keymap.set(term_modes, '<C-1>', '<Cmd>ToggleTerm 1<CR>', keymap_conf)
      vim.keymap.set(term_modes, '<C-2>', '<Cmd>ToggleTerm 2<CR>', keymap_conf)
      vim.keymap.set(term_modes, '<C-3>', '<Cmd>ToggleTerm 3<CR>', keymap_conf)
      vim.keymap.set(term_modes, '<C-/>', '<Cmd>ToggleTermToggleAll<CR>', keymap_conf)
    end,
  },

  {
    'windwp/nvim-autopairs',
    lazy = false,
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    'github/copilot.vim',
  },
  -- import flash.nvim
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      autojump = true,
    },
	  -- stylua: ignore
	  keys = {
	    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	  },
  },
  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    config = function()
      local dropbar_api = require 'dropbar.api'
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}

return M
