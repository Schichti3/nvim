return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
    messages = { enabled = false },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {
      'rcarriga/nvim-notify',
      background_color = '#000000',
      config = function()
        vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = 'none' })
        require('notify').setup({
          background_colour = '#000000',
          render = 'minimal',
        })
      end,
    },
  },
}
