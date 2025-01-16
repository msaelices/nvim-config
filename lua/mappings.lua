require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Open the telescope file browser
map("n", "<C-p>", "<cmd>Telescope find_files<CR>")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")

-- Move to the above and below errors detected by LSP
map("n", "<M-k>", "<cmd>cnext<CR>zz")
map("n", "<M-j>", "<cmd>cprev<CR>zz")

-- Move to the above and below windows
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Insert python breakpoint()
map("n", "<leader>b", "obreakpoint()<esc>")

-- Navigate left and right between buffers

map("n", "<leader>h", "<cmd>bp<CR>")
map("n", "<leader>l", "<cmd>bn<CR>")

-- Navigate between LSP diagnosis issues

map("n", "<leader>ln", vim.diagnostic.goto_next)
map("n", "<leader>lp", vim.diagnostic.goto_prev)

-- Open the aereal code outline window
-- map("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- Copy to clipboard
map("v", "<leader>y", '"+y', { noremap = true, silent = true })
map("n", "<leader>Y", '"+yg_', { noremap = true, silent = true })
map("n", "<leader>y", '"+y', { noremap = true, silent = true })
map("n", "<leader>yy", '"+yy', { noremap = true, silent = true })

-- Paste from clipboard
map("n", "<leader>p", '"+p', { noremap = true, silent = true })
map("n", "<leader>P", '"+P', { noremap = true, silent = true })
map("v", "<leader>p", '"+p', { noremap = true, silent = true })
map("v", "<leader>P", '"+P', { noremap = true, silent = true })

-- Ensure that after indenting (> or >) in visual mode, the selection remains active
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
