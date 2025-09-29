require("nvchad.configs.lspconfig").defaults()

local servers = { 
  "html", 
  "cssls", 
  "vtsls",           -- TypeScript/JavaScript/TSX/JSX
  "rust_analyzer",   -- Rust
  "tailwindcss",     -- Tailwind CSS
  "prisma"           -- Prisma
}

-- Enable all servers
vim.lsp.enable(servers)

-- TypeScript/React specific configuration
if vim.lsp.config then
  vim.lsp.config("vtsls", {
    settings = {
      typescript = {
        preferences = {
          includePackageJsonAutoImports = "auto",
        },
        suggest = {
          completeFunctionCalls = true,
        },
      },
      javascript = {
        preferences = {
          includePackageJsonAutoImports = "auto",
        },
        suggest = {
          completeFunctionCalls = true,
        },
      },
    },
    filetypes = { 
      "javascript", 
      "javascriptreact", 
      "typescript", 
      "typescriptreact", 
      "tsx", 
      "jsx" 
    },
  })

  -- Rust specific configuration
  vim.lsp.config("rust_analyzer", {
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = "clippy",
        },
        procMacro = {
          enable = true,
        },
      },
    },
  })

  -- Tailwind CSS configuration
  vim.lsp.config("tailwindcss", {
    filetypes = {
      "html",
      "css",
      "scss",
      "javascript",
      "javascriptreact", 
      "typescript",
      "typescriptreact",
      "tsx",
      "jsx",
    },
  })
end

-- read :h vim.lsp.config for changing options of lsp servers 
