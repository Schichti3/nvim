vim.pack.add({
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/folke/snacks.nvim' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{ src = 'https://github.com/stevearc/quicker.nvim' },
	{
		src = 'https://github.com/echasnovski/mini.nvim',
		load = function()
		end
	},
})

require('oil').setup()
require("quicker").setup()
require('mini.ai').setup({ n_lines = 500 })
require('mini.surround').setup({
	mappings = {
		add = '<leader>sa',      -- Add surrounding in Normal and Visual modes
		delete = '<leader>sd',   -- Delete surrounding
		find = '<leader>sf',     -- Find surrounding (to the right)
		find_left = '<leader>sF', -- Find surrounding (to the left)
		highlight = '<leader>sh', -- Highlight surrounding
		replace = '<leader>sr',  -- Replace surrounding

		suffix_last = 'l', -- Suffix to search with "prev" method
		suffix_next = 'n', -- Suffix to search with "next" method
	},
})
require('mini.jump2d').setup({ view = { dim = true } })
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
	highlighters = {
		hex_color = hipatterns.gen_highlighter.hex_color()
	}
})
