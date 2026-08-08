
vim.opt.termguicolors = true
vim.g.mapleader = ' '
vim.env.PATH = "/home/your~username/bin:" .. vim.env.PATH --ripgrep path
vim.g.copilot_no_tab_map = 1
vim.keymap.set("n", "<leader>t", function()
  vim.diagnostic.open_float()
end)

vim.diagnostic.config({
  virtual_text = false,
  -- {
  --   prefix = '●',
  --   source = true,
  -- },
  float = {
    source = "always",
    border = "rounded",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
})

vim.filetype.add({
	extension = {
		tpp = cpp,
	},
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
  desc = "Toggle file tree"
})

vim.keymap.set("n", "<leader>m", "K", {
  desc = "Open man page"
})

vim.keymap.set("n", "K", "<nop>")
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {
  desc = "LSP Hover"
})

vim.cmd.colorscheme("betterSimple")
require("config.lazy")
require("settings.general")

