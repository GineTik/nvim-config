require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "vtsls",           -- TypeScript/JavaScript/TSX/JSX
  "rust_analyzer",   -- Rust
  "tailwindcss",     -- Tailwind CSS
  "prisma",          -- Prisma
  "emmet_language_server" -- Emmet
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
    -- Higher priority for TypeScript features
    on_attach = function(client, bufnr)
      -- Ensure TypeScript gets priority for core features
      client.server_capabilities.definitionProvider = true
      client.server_capabilities.hoverProvider = true
      client.server_capabilities.completionProvider = {
        triggerCharacters = { ".", '"', "'", "`", "/", "@", "<", "#" }
      }
    end,
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

  -- Emmet configuration
  vim.lsp.config("emmet_language_server", {
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
    -- Lower priority than TypeScript LSP
    on_attach = function(client, bufnr)
      -- Disable hover for tailwind to let TypeScript handle it
      client.server_capabilities.hoverProvider = false
    end,
    settings = {
      tailwindCSS = {
        -- Only activate when tailwind classes are present
        validate = true,
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning"
        }
      }
    }
  })
end

-- read :h vim.lsp.config for changing options of lsp servers 
