vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- Move to the above and below errors detected by LSP
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Move to the above and below windows
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Insert python breakpoint()
vim.keymap.set("n", "<leader>d", "obreakpoint()<esc>")

-- Navigate up, down, left, and right between splits.
vim.keymap.set("n", "<leader>h", "<c-w>h")
vim.keymap.set("n", "<leader>j", "<c-w>j")
vim.keymap.set("n", "<leader>k", "<c-w>k")
vim.keymap.set("n", "<leader>l", "<c-w>l")

-- Navigate left and right between buffers

vim.keymap.set("n", "<leader><Left>", "<cmd>bp<CR>")
vim.keymap.set("n", "<leader><Right>", "<cmd>bn<CR>")


-- Navigate between LSP diagnosis issues

vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev)

-- Open the aereal code outline window
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- Copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>Y', '"+yg_', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>y', '"+y', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>yy', '"+yy', {noremap = true, silent = true})

-- Paste from clipboard
vim.keymap.set('n', '<leader>p', '"+p', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>P', '"+P', {noremap = true, silent = true})
vim.keymap.set('v', '<leader>p', '"+p', {noremap = true, silent = true})
vim.keymap.set('v', '<leader>P', '"+P', {noremap = true, silent = true})

-- Open the telescope file browser
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>")
