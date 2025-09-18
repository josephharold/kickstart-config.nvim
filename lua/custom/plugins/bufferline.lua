-- a smart close function that does not focus on neo-tree
local function smart_close()
  vim.api.nvim_command 'bp|sp|bn|bd'
end

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

    -- import configs
    local buffer_modes = { 'n', 'v' }

    vim.keymap.set(buffer_modes, '<leader>bd', smart_close, { desc = '[buffer] close' })
    vim.keymap.set(buffer_modes, '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = '[buffer] close others' })
    vim.keymap.set(buffer_modes, '<leader>br', '<cmd>BufferLineCloseRight<CR>', { desc = '[buffer] close right' })
    vim.keymap.set(buffer_modes, '<leader>bl', '<cmd>BufferLineCloseLeft<CR>', { desc = '[buffer] close left' })
    vim.keymap.set(buffer_modes, 'H', '<cmd>BufferLineCyclePrev<CR>', { desc = '[buffer] move prev' })
    vim.keymap.set(buffer_modes, 'L', '<cmd>BufferLineCycleNext<CR>', { desc = '[buffer] move next' })
    vim.keymap.set('n', '<Space>bd', smart_close, { desc = '[buffer] close' })
  end,
}
