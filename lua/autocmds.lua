vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		vim.opt_local.formatoptions:remove({'c', 'r', 'o'})
	end
})
