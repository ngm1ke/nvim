return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "mason-org/mason.nvim", opts = {} },
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "ts_ls", "html", "cssls", "jdtls" },
          automatic_enable = { "ts_ls", "html", "cssls" },
        },
      },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      for _, server in ipairs({ "ts_ls", "html", "cssls", "jdtls" }) do
        vim.lsp.config(server, { capabilities = capabilities })
      end
      vim.diagnostic.config({
        severity_sort = true,
        virtual_text = { spacing = 2, source = "if_many" },
        float = { border = "rounded", source = "if_many" },
      })

    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      -- Mason supplies the jdtls executable. Projects should use Maven or Gradle.
      local root = vim.fs.root(0, { "gradlew", "mvnw", "pom.xml", "build.gradle", "settings.gradle", ".git" })
      if not root then return end
      local project = vim.fn.fnamemodify(root, ":t")
      local workspace = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project
      require("jdtls").start_or_attach({
        cmd = { "jdtls", "-data", workspace },
        root_dir = root,
        init_options = { bundles = {} },
      })
    end,
  },
}
