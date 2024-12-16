return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() <= 1 then
          require("nvim-tree.api").tree.open()
          vim.cmd("wincmd p")
        end
      end
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local tree_wins = vim.api.nvim_list_wins()
        if #tree_wins == 1 and vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), "filetype") == "NvimTree" then
          vim.cmd("quit")
        end
      end
    })
  end,
}

