return {
  "chikko80/error-lens.nvim",
  event = "BufRead",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("error-lens").setup({
      enabled = true,
      auto_adjust = {
        enable = true,
      },
      prefix = 4,
    })
  end,
}
