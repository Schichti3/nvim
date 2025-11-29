vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>e', ':Oil<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

local snacks = require('snacks')
vim.keymap.set('n', '<leader>ff', snacks.picker.files)
vim.keymap.set('n', '<leader>fg', snacks.picker.grep)
vim.keymap.set('n', '<leader>fr', snacks.picker.resume)
vim.keymap.set('n', '<leader>fh', snacks.picker.help)

vim.keymap.set('n', '<leader>fn', snacks.picker.files)

vim.keymap.set('n', '<leader>gg', Snacks.lazygit.open)
vim.keymap.set('n', '<leader>gl', Snacks.lazygit.log)

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')

-- debugging
vim.keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>')
vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<CR>')
vim.keymap.set('n', '<Right>', '<cmd>DapStepInto<CR>')
vim.keymap.set('n', '<Left>', '<cmd>DapStepOut<CR>')
vim.keymap.set('n', '<Down>', '<cmd>DapStepOver<CR>')
vim.keymap.set('n', '<Up>', '<cmd>DapRestartFrame<CR>')

vim.keymap.set('n', '<leader>dt', '<cmd>DapViewToggle<CR>')
vim.keymap.set('n', '<leader>dw', '<cmd>DapViewWatch<CR>')


