require("config.lazy")
require("settings.general")

vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.env.PATH = "/home/your~username/bin:" .. vim.env.PATH --ripgrep path
vim.g.copilot_no_tab_map = 1

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',  -- veya '>>', '→' gibi bir şey de olabilir
    source = true,
  },
  float = {
    source = "always",
    border = "rounded",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})
