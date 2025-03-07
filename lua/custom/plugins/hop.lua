return {
  'smoka7/hop.nvim',
  version = '*',
  config = {
    vim.keymap.set('n', '<leader>hw', function()
      require('hop').hint_words()
    end, { desc = '[H]op to any [w]ord' }),
    vim.keymap.set('n', '<leader><leader>', function()
      require('hop').hint_char1()
    end, { desc = '[ ] Hop to any char' }),
  },
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
  },
}
