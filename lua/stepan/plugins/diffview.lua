return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  keys = {
    { "<leader>od", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
    { "<leader>oD", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
    { "<leader>oh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current file)" },
    { "<leader>oH", "<cmd>DiffviewFileHistory<cr>", desc = "File history (branch)" },
  },
  opts = {},
}
