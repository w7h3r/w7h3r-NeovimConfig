return {
	{"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	highlight = true,
	ensure_installed= { "c", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
	},
}
