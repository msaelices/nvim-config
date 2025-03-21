return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
        },
        filetypes = {
          yaml = false,
          markdown = true, -- different from the default
          help = false,
          gitcommit = false,
          gitrebase = false,
          ["."] = false,
        },
      }
    end,
  },
  {
    "stevearc/aerial.nvim",
    lazy = false,
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  { "mg979/vim-visual-multi", lazy = false },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>f",
        function()
          require("conform").format { async = true }
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
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
    "waylonwalker/Telegraph.nvim",
    config = function()
      function open_lookatme()
        require("telegraph").telegraph {
          cmd = "lookatme {filepath} --live-reload --style gruvbox-dark",
          -- how='tmux_popup',
        }
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
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  --   search = {
  --     forward = false,
  --     backward = false,
  --   },
  --   -- stylua: ignore
  --   keys = {
  --     { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  --     { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --     { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  --     { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --     { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  --   },
  -- },
  {
    "andymass/vim-matchup",
    config = function()
      require("nvim-treesitter.configs").setup {
        matchup = {
          enable = true, -- mandatory, false will disable the whole extension
          disable = {
            "vue",
          }, -- optional, list of language that will be disabled
        },
      }
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
      {
        "<leader>9",
        mode = { "n" },
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
      },
      {
        "<leader>0",
        mode = { "n" },
        function()
          require("harpoon.mark").add_file()
        end,
      },
      {
        "<leader>1",
        mode = { "n" },
        function()
          require("harpoon.ui").nav_prev()
        end,
      },
      {
        "<leader>2",
        mode = { "n" },
        function()
          require("harpoon.ui").nav_next()
        end,
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
              ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },

              ["ab"] = { query = "@block.outer", desc = "Select outer part of an block" },
              ["ib"] = { query = "@block.inner", desc = "Select inner part of an block" },
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
      }
      local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
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
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
      laststatus = 3,
      provider = "claude", -- Recommend using Claude
      -- provider = "openrouter", -- To use with DeepSeek's R1
      auto_suggestions_provider = "claude", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
      auto_suggestions = true,
      behaviour = {
        enable_claude_text_editor_tool_mode = false, -- It's not working well yet, try again later
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-7-sonnet-20250219",
        temperature = 0,
        max_tokens = 4096,
      },
      windows = {
        ask = {
          -- Set the window to be floating
          floating = false,
          start_insert = true,
        },
        edit = {
          start_insert = true, -- Start insert mode when opening the edit window
        },
      },
      vendors = {
        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = "OPENROUTER_API_KEY",
          model = "deepseek/deepseek-r1",
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  -- {
  --   "msaelices/nvim-howto",
  --   lazy = false,
  -- },
  -- While developing the plugin, I have to use the local path
  {
    dir = "~/src/my-repos/nvim-howto/",
    config = true,
    docs = true,
    lazy = false,
  },
  -- nvim-dap setup
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    keys = {
      { "<leader>d", mode = { "n" }, desc = "Open Debug menu" },
      -- { "n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
      -- { "n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", desc = "Continue" },
      -- { "n", "<leader>dr", "<cmd>lua require('dap').repl.toggle()<CR>", desc = "Toggle REPL" },
      -- { "n", "<leader>ds", "<cmd>lua require('dap').start()<CR>", desc = "Start" },
      -- { "n", "<leader>dt", "<cmd>lua require('dap').step_over()<CR>", desc = "Step over" },
      -- { "n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>", desc = "Step into" },
      -- { "n", "<leader>do", "<cmd>lua require('dap').step_out()<CR>", desc = "Step out" },
      -- { "n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", desc = "Run last" },
    },
    config = function()
      local dap = require "dap"
      require("dapui").setup()

      local dap, dapui = require "dap", require "dapui"

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
      vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
      vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
      vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
      vim.keymap.set("n", "<Leader>di", ":DapStepInto<CR>")

      -- dap.adapters.mojo = function(cb, config)
      --   if config.request == 'attach' then
      --     local port = 12355
      --     local host = '127.0.0.1'
      --     cb({
      --       type = 'server',
      --       port = port,
      --       host = host,
      --       options = {
      --         source_filetype = 'mojo',
      --       },
      --     })
      --   else
      --   end
      -- end

      -- dap.adapters.mojo = {
      --   -- type = 'executable',
      --   -- command = 'mojo',
      --   --
      --   type = "server",
      --   host = '127.0.0.1',
      --   port = 12355,
      -- }
      --
      -- dap.configurations.mojo = {
      --   {
      --
      --       type = 'mojo',
      --       request = 'launch',
      --       name = 'Launch',
      --       program = function()
      --         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      --       end,
      --       cwd = '${workspaceFolder}',
      --       stopOnEntry = false,
      --       args = {},
      --       runInTerminal = true,
      --   },
      -- }

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          -- I installed codelldb through mason.nvim
          command = "$HOME/.local/share/nvim/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }
      --
      dap.configurations.mojo = {
        {
          -- type = 'lldb',
          type = "codelldb",
          request = "launch",
          name = "Launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},

          -- Customize LLDB settings
          runInTerminal = true,
        },
      }
    end,
  },
  { "rcarriga/nvim-dap-ui", lazy = false, dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    opts = {
      vimgrep_arguments = {
        "rg",
        "-L",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      pickers = {
        find_files = {
          hidden = false,
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
    end,
  },
  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      vim.keymap.set("n", "<leader>gs", ":Neogit<CR>")
      vim.keymap.set("n", "<leader>gc", ":Neogit commit<CR>")
      vim.keymap.set("n", "<leader>gp", ":Neogit pull<CR>")
      vim.keymap.set("n", "<leader>gP", ":Neogit push<CR>")
      vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>")
      vim.keymap.set("n", "<leader>gl", ":Telescope git_commits<CR>")
      vim.keymap.set("n", "<leader>gB", ":G blame<CR>")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
      -- use the python highlighter for .mojo files, which are recognized as conf ones
      -- vim.treesitter.language.register('python', 'conf')

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.mojo = {
        install_info = {
          url = "https://github.com/lsh/tree-sitter-mojo", -- local path or git repo
          files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
          -- optional entries:
          branch = "main", -- default branch in case of git repo if different from master
          generate_requires_npm = false, -- if stand-alone parser without npm dependencies
          requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
        },
        filetype = "mojo", -- if filetype does not match the parser name
      }

      -- Set the comment string for Mojo files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "mojo",
        callback = function()
          vim.bo.commentstring = "# %s"
        end,
      })
    end,
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
