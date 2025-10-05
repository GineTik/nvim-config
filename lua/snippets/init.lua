-- Exclude friendly-snippets for JS/TS to avoid conflicts with custom snippets
vim.g.vscode_snippets_exclude = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

local ls = require("luasnip")

-- Set snippet priority (higher = more priority)
ls.config.set_config({
  store_selection_keys = "<Tab>",
})

-- Load custom snippets with higher priority
ls.add_snippets("typescript", require("snippets.typescript"), { priority = 1000 })
ls.add_snippets("typescriptreact", require("snippets.typescript"), { priority = 1000 })
ls.add_snippets("javascript", require("snippets.typescript"), { priority = 1000 })
ls.add_snippets("javascriptreact", require("snippets.typescript"), { priority = 1000 })
