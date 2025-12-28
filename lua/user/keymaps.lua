-- Shorten function name
local keymap = function(mode, lhs, rhs, desc)
    local opts = { noremap = true, silent = true }
    if desc then opts.desc = desc end
    vim.keymap.set(mode, lhs, rhs, opts)
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<cr>")
keymap("n", "<C-Down>", ":resize +2<cr>")
keymap("n", "<C-Left>", ":vertical resize -2<cr>")
keymap("n", "<C-Right>", ":vertical resize +2<cr>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<cr>")
keymap("n", "<S-h>", ":bprevious<cr>")

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<cr>", "No highlight")

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<cr>")

-- Better paste
keymap("v", "p", '"_dP')

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>")

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>")
keymap("n", "<leader>ft", ":Telescope live_grep<cr>")
keymap("n", "<leader>fp", ":Telescope projects<cr>")
keymap("n", "<leader>fb", ":Telescope buffers<cr>")

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>")
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<cr>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>")
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>")
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>")
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>")
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>")

-- Terminal
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", "Float")
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal")
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical")
