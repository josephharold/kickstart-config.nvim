vim.keymap.set({ 'n' }, 'gd', function()
  vim.lsp.buf.definition()
end, { desc = '[code] Go to definition' })
