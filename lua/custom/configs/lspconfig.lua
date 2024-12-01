local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.ruff.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  autoformat = true,
  filetypes = {"python"},
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
            "--config", "~/.config/nvim/lua/custom/configs/ruff.toml",
          },
        },
      },
  },
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.vuels.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"vue"},
})

lspconfig.mojo.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"mojo"},  -- The mojo filetype is not recognized as mojo but as conf
})
