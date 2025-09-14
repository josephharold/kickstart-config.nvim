return {
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
}
