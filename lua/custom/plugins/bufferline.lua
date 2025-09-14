return {
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

    -- a smart close function that does not focus on neo-tree
    local function smart_close()
      local current_buf = vim.api.nvim_get_current_buf()
      local bufs = vim.fn.getbufinfo { buflisted = 1 }

      if #bufs <= 1 then
        vim.cmd 'bd'
        return
      end

      vim.cmd('bd ' .. current_buf)

      local new_current_buf = vim.api.nvim_get_current_buf()
      if vim.bo[new_current_buf].filetype == 'neo-tree' then
        -- Keep going to the next buffer until it's not a neo-tree buffer
        -- or we've cycled through all of them.
        local initial_bnext_buf = new_current_buf
        vim.cmd 'bnext'
        local after_bnext_buf = vim.api.nvim_get_current_buf()
        while vim.bo[after_bnext_buf].filetype == 'neo-tree' and after_bnext_buf ~= initial_bnext_buf do
          vim.cmd 'bnext'
          after_bnext_buf = vim.api.nvim_get_current_buf()
        end
      end
    end

    -- import configs
    local buffer_modes = { 'n', 'v' }
    vim.keymap.set(buffer_modes, '<leader>bd', smart_close, { desc = '[buffer] close' })
    vim.keymap.set(buffer_modes, '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = '[buffer] close others' })
    vim.keymap.set(buffer_modes, '<leader>br', '<cmd>BufferLineCloseRight<CR>', { desc = '[buffer] close right' })
    vim.keymap.set(buffer_modes, '<leader>bl', '<cmd>BufferLineCloseLeft<CR>', { desc = '[buffer] close left' })
    vim.keymap.set(buffer_modes, 'H', '<cmd>BufferLineCyclePrev<CR>', { desc = '[buffer] move prev' })
    vim.keymap.set(buffer_modes, 'L', '<cmd>BufferLineCycleNext<CR>', { desc = '[buffer] move next' })
  end,
}
