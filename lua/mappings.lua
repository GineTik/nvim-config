require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("v", "jk", "<ESC>")
map("n", "ss", "<cmd>w<CR>")
map("i", "ss", "<ESC><cmd>w<CR>")

-- Override NvChad default: change <leader>e to toggle instead of focus
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- LSP commands on <leader>l...
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "LSP code action" })
map("n", "<leader>lI", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and (
        action.title:match("Add import")
      )
    end,
    apply = true
 })
end, { desc = "LSP auto import" })
map("n", "<leader>lA", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and (
        action.title:match("Add all missing imports")
      )
    end,
    apply = true
 })
end, { desc = "LSP auto import" })
map("n", "<leader>lo", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.kind and action.kind:match("source.organizeImports")
    end,
    apply = true
  })
end, { desc = "LSP organize imports" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP rename symbol" })
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP format buffer" })
map("n", "<leader>li", vim.lsp.buf.implementation, { desc = "LSP go to implementation" })
map("n", "<leader>lh", vim.lsp.buf.hover, { desc = "LSP hover documentation" })
map("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "LSP signature help" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "LSP show diagnostics" })
map("n", "<leader>ln", vim.diagnostic.goto_next, { desc = "LSP next diagnostic" })
map("n", "<leader>lp", vim.diagnostic.goto_prev, { desc = "LSP prev diagnostic" })
map("n", "<leader>lR", vim.lsp.buf.references, { desc = "LSP show references" })
map("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "LSP type definition" })
map("n", "<leader>lw", vim.lsp.buf.workspace_symbol, { desc = "LSP workspace symbols" })
map("n", "<leader>ll", vim.lsp.buf.document_symbol, { desc = "LSP document symbols" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
