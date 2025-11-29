vim.g.mapleader = " "
vim.keymap.set("n", "<leader>mv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mnu", ":set rnu!<CR>")

vim.keymap.set("i", "<Up>", "<C-o>:echom \"--> k <-- \"<CR>")
vim.keymap.set("i", "<Down>", "<C-o>:echom \"--> j <-- \"<CR>")
vim.keymap.set("i", "<Right>", "<C-o>:echom \"--> l <-- \"<CR>")
vim.keymap.set("i", "<Left>", "<C-o>:echom \"--> h <-- \"<CR>")
vim.keymap.set("n", "<Up>", ":echom \"--> k <-- \"<CR>")
vim.keymap.set("n", "<Down>", ":echom \"--> j <-- \"<CR>")
vim.keymap.set("n", "<Right>", ":echom \"--> l <-- \"<CR>")
vim.keymap.set("n", "<Left>", ":echom \"--> h <-- \"<CR>")
