-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- lsps with default config
local servers = { "html", "cssls", "mojo" }
for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

vim.lsp.config("ruff", {
  filetypes = { "python" },
  init_options = {
    settings = {
      fixAll = true,
      organizeImports = true,
      logLevel = "debug",
      format = {
        args = {
          "--config",
          "~/.config/nvim/lua/configs/ruff.toml",
        },
      },
    },
  },
})
vim.lsp.enable "ruff"

vim.lsp.config("pyright", {
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
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
})
vim.lsp.enable "pyright"

vim.lsp.config("vuels", {
  filetypes = { "vue" },
})
vim.lsp.enable "vuels"

vim.lsp.config("harper_ls", {
  settings = {
    ["harper-ls"] = {
      linters = {
        SentenceCapitalization = false,
        SpellCheck = false,
      },
    },
  },
})
vim.lsp.enable "harper_ls"
