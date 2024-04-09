local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "debugpy",
        "mypy",
        "ruff-lsp",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  { "nvim-neotest/nvim-nio" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
        },
      })
    end,
  },
  {
    "stevearc/aerial.nvim",
    lazy = false,
    opts = {},
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
  },
  { "mg979/vim-visual-multi", lazy = false },
  {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  },
  {
    "stevearc/conform.nvim",
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format" },
      },
    },
  },
  {
   'waylonwalker/Telegraph.nvim',
    config = function()
        function open_lookatme ()
            require 'telegraph'.telegraph({
                cmd='lookatme {filepath} --live-reload --style gruvbox-dark',
                -- how='tmux_popup',
            })
        end
        -- This is not working, I will need to investigate
        -- require('telegraph').setup({
        --     on_attach = function(bufnr)
        --         vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader><leader>s', open_lookatme, { noremap = true })
        --     end
        -- })
        vim.keymap.set("n", "<leader><leader>s", open_lookatme)
    end,
    lazy = false,
  },
  {
    "kdheepak/lazygit.nvim",
    event = "User FilePost",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  { 
    "andymass/vim-matchup",
    config = function()
      require("nvim-treesitter.configs").setup({
        matchup = {
          enable = true, -- mandatory, false will disable the whole extension
          disable = {
            "vue"
          },  -- optional, list of language that will be disabled
        },
      })
    end,
    lazy = false,
  },
  {
     "nvim-lua/plenary.nvim",
  },
  {
      "ThePrimeagen/harpoon",
     lazy = false,
     keys = {
       { "<leader>9", mode = { "n" }, function() require("harpoon.ui").toggle_quick_menu() end },
       { "<leader>0", mode = { "n" }, function() require("harpoon.mark").add_file() end },
       { "<leader>1", mode = { "n" }, function() require("harpoon.ui").nav_prev() end },
       { "<leader>2", mode = { "n" }, function() require("harpoon.ui").nav_next() end },
     }, 
  },
  {
     "iamcco/markdown-preview.nvim",
     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
     ft = { "markdown" },
     build = function()
       vim.fn["mkdp#util#install"]()
     end,
     keys = {
       { "<leader>pm", mode = { "n"}, "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview Toggle" },
     }
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
 
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
  
            keymaps = {
              ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
              ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
  
              ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
              ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
  
              ["af"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
              ["if"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },
  
              ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
              ["<leader>nm"] = "@function.outer", -- swap function with next
            },
            swap_previous = {
              ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
              ["<leader>pm"] = "@function.outer", -- swap function with previous
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = { query = "@function.outer", desc = "Next method/function def start" },
              ["]c"] = { query = "@class.outer", desc = "Next class start" },
              ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
              ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
  
              -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
              -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
              ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]F"] = { query = "@function.outer", desc = "Next method/function def end" },
              ["]C"] = { query = "@class.outer", desc = "Next class end" },
              ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
              ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
            },
            goto_previous_start = {
              ["[f"] = { query = "@function.outer", desc = "Prev method/function def start" },
              ["[c"] = { query = "@class.outer", desc = "Prev class start" },
              ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
              ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
            },
            goto_previous_end = {
              ["[F"] = { query = "@function.outer", desc = "Prev method/function def end" },
              ["[C"] = { query = "@class.outer", desc = "Prev class end" },
              ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
              ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
            },
          },
        },
      })
  
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
 
      -- vim way: ; goes to the direction you were moving.
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
    end,
  },
  {
    "msaelices/nvim-howto",
    lazy = false,
  },
  -- While developing the plugin, I have to use the local path
  -- {
  --   dir = '~/src/my-repos/nvim-howto/',
  --   config = true,
  --   docs = true,
  --   lazy = false,
  -- },
}

return plugins
