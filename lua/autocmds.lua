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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- Check if the client supports the completion method
    if client and client:supports_method('textDocument/completion') then
      -- Enable auto-completion and set autotrigger to true
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})
