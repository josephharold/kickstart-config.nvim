vim.keymap.set({ 'n' }, 'gd', function()
  vim.lsp.buf.definition()
end, { desc = '[code] Go to definition' })

-- allow jk to escape the terminal mode
vim.keymap.set('t', 'kj', '<C-\\><C-n>', { desc = 'Escape terminal mode' })
