local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.ruff_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  autoformat = true,
  filetypes = {"python"},
  init_options = {
      -- https://github.com/astral-sh/ruff-lsp#settings
      -- https://github.com/astral-sh/ruff-lsp/blob/main/ruff_lsp/server.py
      settings = {
        fixAll = true,
        organizeImports = false,  -- let isort take care of organizeImports
        -- extra CLI arguments
        -- https://beta.ruff.rs/docs/configuration/#command-line-interface
        -- https://beta.ruff.rs/docs/rules/
        args = {
          "--config", "~/.config/nvim/lua/custom/configs/ruff.toml",
          "--ignore", table.concat({
          "E111", -- indentation-with-invalid-multiple
          "E114", -- indentation-with-invalid-multiple-comment
          "E402", -- module-import-not-at-top-of-file
          "E501", -- line-too-long
          "E702", -- multiple-statements-on-one-line-semicolon
          "E731", -- lambda-assignment
        }, ',') },
      },
  }
})


lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})
