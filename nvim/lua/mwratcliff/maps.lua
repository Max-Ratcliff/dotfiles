-- ~/nvim/lua/mwratcliff/maps.lua
vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { silent = true }, opts))
end

map("i", "<Esc>", "<Esc>", { noremap = true, silent = true })
-- vim.keymap.unset("n", "<C-a>")
-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")
map("n", "<leader>+", "<C-a>")
map("n", "<leader>-", "<C-x>")
map("n", "<leader>nh", "<CMD>nohl<CR>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")

-- Split Windows
map("n", "<leader>sv", "<CMD>vsplit<CR>")
map("n", "<leader>sh", "<CMD>split<CR>")
map("n", "<leader>sx", "<CMD>close<CR>")
map("n", "<leader>se", "<C-w>=")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Tabs
map("n", "<leader>to", "<CMD>tabnew<CR>")
map("n", "<leader>tx", "<CMD>tabclose<CR>")
map("n", "<leader>tn", "<CMD>tabn<CR>")
map("n", "<leader>tp", "<CMD>tabp<CR>")

-- Telescope
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fs", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>fc", "<CMD>Telescope grep_string<CR>")
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")

-- copilot
map("n", "<leader>ce", "<CMD>Copilot enable<CR>")
map("n", "<leader>cd", "<CMD>Copilot disable<CR>")
map("n", "<leader>cb", "<CMD>Copilot panel<CR>")
map("i", "<C-CR>", 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false })
map("i", "<C-K>", "copilot#Dismiss()", { expr = true, replace_keycodes = false })
map("i", "<C-]>", "<Plug>(copilot-next)", { silent = true })
map("i", "<C-[>", "<Plug>(copilot-previous)", { silent = true })
