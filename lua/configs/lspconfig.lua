-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "mojo" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.ruff.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  autoformat = true,
  filetypes = { "python" },
  init_options = {
    -- https://github.com/astral-sh/ruff-lsp#settings
    -- https://github.com/astral-sh/ruff-lsp/blob/main/ruff_lsp/server.py
    settings = {
      fixAll = true,
      organizeImports = true,
      logLevel = "debug",
      -- extra CLI arguments
      -- https://docs.astral.sh/ruff/configuration/#command-line-interface
      format = {
        args = {
          "--config",
          "~/.config/nvim/lua/configs/ruff.toml",
        },
      },
    },
  },
}

-- We keep using pyright along with Ruff for go to definition and hover
lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "off",
        autoImportCompletions = false,
      },
      linting = {
        enabled = false,
      },
    },
  },
  -- Disable all diagnostics from Pyright as we are using Ruff
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
}

lspconfig.vuels.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "vue" },
}

lspconfig.mojo.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  autoformat = true,
}

lspconfig.harper_ls.setup {
  settings = {
    ["harper-ls"] = {
      linters = {
        SentenceCapitalization = false,
        SpellCheck = false,
      },
    },
  },
}
