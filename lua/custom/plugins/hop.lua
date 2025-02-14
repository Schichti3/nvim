local hop = require 'hop'
vim.keymap.set('n', 'gh', function()
  hop.hint_words()
end, { desc = 'Hop to any word' })

