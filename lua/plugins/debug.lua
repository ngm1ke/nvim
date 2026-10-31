return {
  {
    "mfussenegger/nvim-dap",
    version = "0.10.*", -- compatible with Neovim 0.11.5
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mason-org/mason.nvim",
      "mxsdev/nvim-dap-vscode-js",
    },
    config = function()
      local dap, ui = require("dap"), require("dapui")
      ui.setup()
      -- Mason installs Microsoft's JavaScript debug adapter; the vscode-js
      -- bridge registers the pwa-node adapter used by these launch profiles.
      require("dap-vscode-js").setup({
        debugger_cmd = { "js-debug-adapter" },
        adapters = { "pwa-node", "pwa-chrome", "node-terminal" },
      })
      for _, ft in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact" }) do
        dap.configurations[ft] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch current file (Node)",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "node",
            sourceMaps = true,
            skipFiles = { "<node_internals>/**" },
          },
        }
      end
      dap.listeners.after.event_initialized["dapui_config"] = function() ui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() ui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() ui.close() end
    end,
  },
}
