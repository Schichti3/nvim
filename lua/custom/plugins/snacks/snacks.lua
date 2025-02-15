--return {
--  'folke/snacks.nvim',
--  priority = 1000,
--  lazy = false,
--  ---@type snacks.Config
--  opts = {
--    input = { enabled = true },
--  },
--}
--
-- lazy.nvim
return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    input = {},
    lazygit = { enabled = true, configure = true },
    dashboard = {},
  },
}
