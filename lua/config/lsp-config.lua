vim.lsp.enable({
  'lua-lsp',
  'clangd',
})

vim.keymap.set('n', 'gd', function()
  vim.lsp.buf.definition()
end)

vim.keymap.set('n', 'gD', function()
  vim.lsp.buf.declaration()
end)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = {
    current_line = true,
  },
})

vim.g.diagnostics_active = false
vim.diagnostic.enable(false, {})
function toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.enable(false, {})
    print('Diagnostics OFF')
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable(true, {})
    print('Diagnostics ON')
  end
end

vim.keymap.set('n', '<leader>td', function()
  toggle_diagnostics()
end, { desc = 'Toggle LSP diagnostics' })
