return {
  "Exafunction/codeium.vim",
  event = "InsertEnter",
  cmd = "Codeium",
  config = function()
    vim.g.codeium_no_map_tab = 1
    vim.g.codeium_disable_bindings = 1

    vim.keymap.set("i", "<Tab>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true, desc = "Codeium accept suggestion" })

    vim.keymap.set("i", "<C-l>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, silent = true, desc = "Codeium next suggestion" })

    vim.keymap.set("i", "<C-h>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, silent = true, desc = "Codeium prev suggestion" })

    vim.keymap.set("i", "<C-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true, desc = "Codeium clear suggestion" })
  end,
}
