return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio", -- required by dap-ui
      "theHamsta/nvim-dap-virtual-text",
      "leoluz/nvim-dap-go",
    },
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Debug: start/continue" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: step over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: step into" },
      { "<F12>", function() require("dap").step_out() end, desc = "Debug: step out" },
      { "<leader>bb", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      {
        "<leader>bB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Conditional breakpoint",
      },
      {
        "<leader>bl",
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end,
        desc = "Log point",
      },
      { "<leader>bc", function() require("dap").run_to_cursor() end, desc = "Run to cursor" },
      { "<leader>br", function() require("dap").restart() end, desc = "Restart debug session" },
      {
        "<leader>bx",
        function()
          require("dap").terminate()
          require("dapui").close()
        end,
        desc = "Terminate debug session",
      },
      { "<leader>bu", function() require("dapui").toggle() end, desc = "Toggle debug UI" },
      { "<leader>be", function() require("dapui").eval(nil, { enter = true }) end, mode = { "n", "v" }, desc = "Evaluate expression" },
      { "<leader>bo", function() require("dap").repl.toggle() end, desc = "Toggle debug REPL" },
      { "<leader>bC", function() require("dap").clear_breakpoints() end, desc = "Clear all breakpoints" },
      -- Go specific
      { "<leader>bt", function() require("dap-go").debug_test() end, ft = "go", desc = "Debug nearest Go test" },
      { "<leader>bT", function() require("dap-go").debug_last_test() end, ft = "go", desc = "Debug last Go test" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.30 },
              { id = "breakpoints", size = 0.20 },
              { id = "stacks", size = 0.30 },
              { id = "watches", size = 0.20 },
            },
            size = 45,
            position = "left",
          },
          {
            elements = {
              { id = "repl", size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 12,
            position = "bottom",
          },
        },
      })

      require("nvim-dap-virtual-text").setup({
        commented = true,
      })

      require("dap-go").setup({
        delve = {
          -- use the delve installed by mason
          path = vim.fn.stdpath("data") .. "/mason/bin/dlv",
          -- on macOS the initialization can be slow on first run
          initialize_timeout_sec = 30,
        },
      })

      -- extra Go configuration: attach to a running process
      table.insert(dap.configurations.go, {
        type = "go",
        name = "Attach to process",
        mode = "local",
        request = "attach",
        processId = require("dap.utils").pick_process,
      })

      -- open/close the UI automatically with the session
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- signs
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DiagnosticInfo", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticOk", linehl = "Visual", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DiagnosticHint", numhl = "" })
    end,
  },
}
