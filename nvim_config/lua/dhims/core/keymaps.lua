vim.g.mapleader = " "

local keymap = vim.keymap

--general keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", "nohl<CR>")
keymap.set("n", "x", '"_x')
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")
keymap.set("n", "<leader>s", "<cmd>w!<cr>")    --force write/save
keymap.set("n", "<leader>q", "<cmd>q!<cr>")    --force quit
keymap.set("n", "<C-s>", "<cmd>w<cr>")         --write/save
keymap.set("n", "<C-q>", "<cmd>q<cr>")         --quit

--split windows keymaps
keymap.set("n", "<leader>sv", "<C-w>v")		--split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")		--split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")		--make split windows equal width and height
keymap.set("n", "<leader>sx", ":close<CR>")	--close split windows

--managing Tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")	--open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")  --close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")		--go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")		--go to previous tab

--plugin keymaps

--vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

--nvim-tree
keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")

--telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")