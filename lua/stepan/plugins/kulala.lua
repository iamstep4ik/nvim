-- kulala.nvim - HTTP client for .http files (JetBrains HTTP Client compatible)
return {
  "mistweaverco/kulala.nvim",
  -- load before session save/restore so VimLeavePre and SessionLoadPost hooks are registered
  event = { "SessionLoadPost", "VimLeavePre" },
  ft = { "http", "rest" },
  keys = {
    { "<leader>Rs", desc = "Send request" },
    { "<leader>Ra", desc = "Send all requests" },
    { "<leader>Rb", desc = "Open scratchpad" },
    { "<leader>Rr", desc = "Replay last request" },
  },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = "<leader>R",
    kulala_keymaps = true, -- keymaps inside the response window
    display_mode = "split",
    default_view = "body",
    ui = {
      win_opts = { border = "rounded" },
    },
  },
}
