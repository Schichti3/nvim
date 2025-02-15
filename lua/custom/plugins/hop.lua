return {
  'smoka7/hop.nvim',
  version = '*',
  config = {
    vim.keymap.set('n', 'gh', function()
      require('hop').hint_words()
    end, { desc = '[H]op to any word' }),
  },
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
}
