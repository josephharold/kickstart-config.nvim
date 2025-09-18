return {
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   lazy = false,
  -- },

  -- Lazy
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
    config = function()
      require 'onedarkpro'
      vim.cmd.colorscheme 'onedark'
    end,
  },
}
