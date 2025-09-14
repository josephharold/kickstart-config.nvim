local wk = require 'which-key'

vim.keymap.set({ 'n' }, 'cd', function()
  vim.lsp.buf.definition()
end, { desc = '[code] Go to definition' })
