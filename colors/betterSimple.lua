vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "simpleBlack"


local colors = {
  bg = "#0d0d0d",
  bg2 = "#161616",

  fg = "#d6d6d6",
  gray = "#666666",

  keyword = "#c586c0",
  function_name = "#61afef",
  string = "#98c379",
  number = "#d19a66",
  type = "#e5c07b",

  red = "#e06c75",
  cyan = "#56b6c2",
}


local highlights = {

  Normal = {
    fg = colors.fg,
    bg = colors.bg,
  },

  NormalFloat = {
    fg = colors.fg,
    bg = colors.bg2,
  },


  Comment = {
    fg = colors.gray,
    italic = true,
  },


  String = {
    fg = colors.string,
  },


  Character = {
    fg = colors.string,
  },


  Number = {
    fg = colors.number,
  },


  Boolean = {
    fg = colors.number,
  },


  Function = {
    fg = colors.function_name,
  },


  Identifier = {
    fg = colors.fg,
  },


  Keyword = {
    fg = colors.keyword,
  },


  Conditional = {
    fg = colors.keyword,
  },


  Repeat = {
    fg = colors.keyword,
  },


  Type = {
    fg = colors.type,
  },


  Structure = {
    fg = colors.type,
  },


  LineNr = {
    fg = "#444444",
  },


  CursorLineNr = {
    fg = colors.fg,
    bold = true,
  },


  CursorLine = {
    bg = "#151515",
  },


  StatusLine = {
    fg = colors.fg,
    bg = colors.bg2,
  },


  StatusLineNC = {
    fg = colors.gray,
    bg = colors.bg,
  },


  Search = {
    fg = colors.bg,
    bg = colors.type,
  },


  Visual = {
    bg = "#252525",
  },


  Pmenu = {
    fg = colors.fg,
    bg = colors.bg2,
  },


  PmenuSel = {
    fg = colors.bg,
    bg = colors.function_name,
  },


  DiagnosticError = {
    fg = colors.red,
  },


  DiagnosticWarn = {
    fg = colors.type,
  },
}


local treesitter = {

  ["@keyword"] = {
    fg = colors.keyword,
  },

  ["@keyword.conditional"] = {
    fg = colors.keyword,
  },

  ["@keyword.repeat"] = {
    fg = colors.keyword,
  },

  ["@keyword.function"] = {
    fg = colors.keyword,
  },

  ["@function"] = {
    fg = colors.function_name,
  },

  ["@function.call"] = {
    fg = colors.function_name,
  },

  ["@string"] = {
    fg = colors.string,
  },

  ["@number"] = {
    fg = colors.number,
  },

  ["@boolean"] = {
    fg = colors.number,
  },

  ["@type"] = {
    fg = colors.type,
  },

  ["@comment"] = {
    fg = colors.gray,
    italic = true,
  },

  ["@variable"] = {
    fg = colors.fg,
  },
}


for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end


for group, opts in pairs(treesitter) do
  vim.api.nvim_set_hl(0, group, opts)
end


vim.opt.pumblend = 5
