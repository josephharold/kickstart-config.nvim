return {
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
}
