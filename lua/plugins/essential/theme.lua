return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.opt.termguicolors = true
      require("kanagawa").setup({
        compile = true,
        undercurl = true,
        commentStyle = { italic = true },
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        transparent = false,
        colors = {
        },
        overrides = function(colors)
          return {
            Normal = { bg = colors.bg },
          }
        end,
      })
      vim.cmd.colorscheme("kanagawa")
    end,
  },
}
