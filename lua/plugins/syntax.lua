return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({})
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    config = function()
      local languages = { "java", "javascript", "typescript", "tsx", "html", "css", "json", "lua", "vim", "vimdoc" }
      require("nvim-treesitter").install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "java", "javascript", "typescript", "typescriptreact", "html", "css", "json", "lua", "vim", "help" },
        callback = function(event)
          -- Use Neovim's native Tree-sitter highlighter when this parser is installed.
          pcall(vim.treesitter.start, event.buf)
        end,
      })
    end,
  },
}
