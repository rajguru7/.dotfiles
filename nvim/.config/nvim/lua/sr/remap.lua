vim.g.mapleader = " "

-- To open file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- For moving lines up and down with indenting (doesn't take away visual K use)
vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("x", "K", [[mode() ==# "V" ? ":m '<-2<CR>gv=gv" : "K"]], { expr = true, noremap = true })

vim.keymap.set("n", "J", "mzJ`z")

-- scrolling options
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- To make scripts executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- To source files
vim.keymap.set("n", "<leader><CR>", "<cmd>so %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<C-f>", "<cmd>!tmux neww tmux-sessionizer.bash<CR>")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

