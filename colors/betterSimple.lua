vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "betterSimple"

local colorPalette = {
  bg = "#1e222a",
  bg2 = "#3b4252",
  bg3 = "#2a303c",

  fg = "#d8dee9",
  fg_dark = "#eceff4",

  comment = "#616e88",
  string = "#a3be8c",
  function_name = "#88c0d0",
  keyword = "#b48ead",
  type = "#ebcb8b",

  line = "#4c566a",

  error = "#af214a",
  warning = "#f1c211",
}

local highlights = {
  Normal = {
    fg = colorPalette.fg,
    bg = colorPalette.bg,
  },

  Comment = {
    fg = colorPalette.comment,
    italic = true,
  },

  String = {
    fg = colorPalette.string,
  },

  Function = {
    fg = colorPalette.function_name,
  },

  Keyword = {
    fg = colorPalette.keyword,
  },

  Type = {
    fg = colorPalette.type,
  },

  LineNr = {
    fg = colorPalette.line,
  },

  CursorLine = {
    bg = colorPalette.bg3,
  },

  StatusLine = {
    fg = colorPalette.fg_dark,
    bg = colorPalette.bg2,
  },

  NormalFloat = {
    fg = colorPalette.fg,
    bg = colorPalette.bg2,
  },

  FloatBorder = {
    fg = colorPalette.function_name,
    bg = "NONE",
  },

  CursorLineNr = {
    fg = colorPalette.type,
    bold = true,
  },

  Number = {
    fg = colorPalette.type,
  },

  Boolean = {
    fg = colorPalette.type,
  },

  Identifier = {
    fg = colorPalette.fg,
  },
}

local treesitter = {
  ["@function"] = {
    fg = colorPalette.function_name,
  },

  ["@keyword"] = {
    fg = colorPalette.keyword,
  },

  ["@string"] = {
    fg = colorPalette.string,
  },

  ["@variable"] = {
    fg = colorPalette.fg,
  },

  ["@type"] = {
    fg = colorPalette.type,
  },

  ["@comment"] = {
    fg = colorPalette.comment,
    italic = true,
  },
}

local diagnostics = {
  DiagnosticError = {
    fg = colorPalette.error,
  },

  DiagnosticWarn = {
    fg = colorPalette.warning,
  },

  DiagnosticInfo = {
    fg = colorPalette.function_name,
  },

  DiagnosticHint = {
    fg = colorPalette.string,
  },

  DiagnosticUnderlineError = {
    underline = true,
    sp = colorPalette.error,
  },

  DiagnosticUnderlineWarn = {
    underline = true,
    sp = colorPalette.warning,
  },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end

for group, opts in pairs(treesitter) do
  vim.api.nvim_set_hl(0, group, opts)
end

for group, opts in pairs(diagnostics) do
  vim.api.nvim_set_hl(0, group, opts)
end

vim.opt.pumblend = 10
