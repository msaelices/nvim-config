-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
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

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "python" },
}

lspconfig.vuels.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "vue" },
}

lspconfig.mojo.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  filetypes = { "mojo" }, -- The mojo filetype is not recognized as mojo but as conf
  autoformat = true,
}
