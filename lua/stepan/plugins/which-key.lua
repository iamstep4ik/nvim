return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    spec = {
      { "<leader>b", group = "debug" },
      { "<leader>R", group = "rest/kulala" },
      { "<leader>l", group = "tui apps" },
    },
  },
}
