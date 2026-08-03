-- ATAC - Postman-like API client TUI in a floating terminal
local atac

return {
  "akinsho/toggleterm.nvim",
  keys = {
    {
      "<leader>la",
      function()
        atac = atac
          or require("toggleterm.terminal").Terminal:new({
            cmd = "atac",
            direction = "float",
            hidden = true,
            float_opts = { border = "curved" },
          })
        atac:toggle()
      end,
      desc = "Open ATAC (API client) floating window",
    },
  },
}
