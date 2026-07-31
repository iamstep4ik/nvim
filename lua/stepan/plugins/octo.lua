return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Octo",
  keys = {
    { "<leader>op", "<cmd>Octo pr list<cr>", desc = "List PRs" },
    { "<leader>oP", "<cmd>Octo pr search<cr>", desc = "Search PRs" },
    { "<leader>or", "<cmd>Octo review start<cr>", desc = "Start PR review" },
    { "<leader>oR", "<cmd>Octo review submit<cr>", desc = "Submit PR review" },
    { "<leader>oc", "<cmd>Octo pr checkout<cr>", desc = "Checkout PR" },
    { "<leader>oi", "<cmd>Octo issue list<cr>", desc = "List issues" },
  },
  opts = {
    picker = "telescope",
    use_local_fs = false,
    enable_builtin = true,
  },
}
