return {
  "fei6409/log-highlight.nvim",
  ft = "log",
  config = function()
    require("log-highlight").setup({
      extension = { "log" },
      pattern = {
        "/var/log/.*",
        ".*[._]log[._].*",
      },
    })
  end,
}
