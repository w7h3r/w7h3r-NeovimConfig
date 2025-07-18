return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.opt.termguicolors = true
      require("kanagawa").setup({
        -- opsiyonel ayarlar, örnek:
        compile = true,        -- tema önbelleğe alınsın
        undercurl = true,
        commentStyle = { italic = true },
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        transparent = false,   -- transparan arka plan için true yapabilirsin
        colors = {
          -- buraya renk override ekleyebilirsin
        },
        overrides = function(colors)
          return {
            -- highlight override örneği
            Normal = { bg = colors.bg },
            -- diğerleri...
          }
        end,
      })
      vim.cmd.colorscheme("kanagawa")
    end,
  },
}
