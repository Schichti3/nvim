vim.pack.add({
	{ src = 'https://github.com/stevearc/oil.nvim' },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/folke/snacks.nvim' },
	{ src = 'https://github.com/folke/which-key.nvim' },
	{
		src = 'https://github.com/echasnovski/mini.nvim',
		load = function()
			require('mini.ai').setup()({ n_lines = 500 })
			require('mini.jump2d').setup({ view = { dim = true } })
			local hipatterns = require('mini.hipatterns')
			hipatterns.setup({
				highlighters = {
					hex_color = hipatterns.gen_highlighter.hex_color()
				}
			})
		end
	},
})

require('oil').setup()
