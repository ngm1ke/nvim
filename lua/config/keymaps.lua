local map = vim.keymap.set
local opts = { silent = true }

map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })
map("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close buffer" })
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })
map("n", "<leader>g", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Search project text" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find open buffers" })
map("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer" })
map("n", "<leader>fr", "<cmd>GrugFar<CR>", { desc = "Search and replace project text" })
map("n", "<leader>da", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Show all diagnostics" })
map("n", "<leader>db", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Show buffer diagnostics" })
map("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostic under cursor" })
map("n", "<leader>dq", "<cmd>Trouble qflist toggle<CR>", { desc = "Show quickfix list" })
map("n", "<leader>dl", "<cmd>Trouble loclist toggle<CR>", { desc = "Show location list" })
map("n", "<leader>de", "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<CR>", { desc = "Show errors" })
map("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>ca", function()
  vim.ui.select({ "Format buffer", "LSP code actions" }, { prompt = "Code action" }, function(choice)
    if choice == "Format buffer" then
      vim.lsp.buf.format({ async = true })
    elseif choice == "LSP code actions" then
      vim.lsp.buf.code_action()
    end
  end)
end, { desc = "Code actions (format or LSP)" })
map("n", "<F5>", function() require("dap").continue() end, { desc = "Debug: continue" })
map("n", "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "Debug: toggle breakpoint" })
map("n", "<F10>", function() require("dap").step_over() end, { desc = "Debug: step over" })
map("n", "<F11>", function() require("dap").step_into() end, { desc = "Debug: step into" })
map("n", "<S-F11>", function() require("dap").step_out() end, { desc = "Debug: step out" })
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle debugger UI" })

map("v", "<Tab>", ">gv", { desc = "Indent selection" })
map("v", "<S-Tab>", "<gv", { desc = "Unindent selection" })

-- Multi-line editing: Ctrl-v, select rows, then I/A and type. Use :s for
-- substitutions in a line/range and <leader>fr for project-wide replacement.
