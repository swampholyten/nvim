vim.g.mapleader = " "

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.scrolloff = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.pack.add({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/echasnovski/mini.surround" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/saghen/blink.cmp",                version = "1.*" },
})

require("gruvbox").setup()
vim.cmd.colorscheme("gruvbox")

require("mason").setup()
require("mini.surround").setup()
require("fzf-lua").setup({ "hide", "max-perf" })
require("oil").setup({ keymaps = { ["<C-h>"] = false, ["<C-l>"] = false } })
require("blink.cmp").setup({
	keymap = { ["<CR>"] = { "accept", "fallback" } },
	signature = { enabled = true },
})

vim.lsp.enable({ "lua_ls", "rust_analyzer", "vtsls", "clangd", "tinymist" })

local map = vim.keymap.set
local fzf = require("fzf-lua")

map("n", "<leader>wo", ":wincmd c<CR>")
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>p", '"+p')

map("n", "<leader>e", ":Oil<CR>")
map("n", "<leader>g", ":LazyGit<CR>")

map("n", "gd", vim.lsp.buf.definition)
map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "<leader>k", vim.diagnostic.open_float)
map("n", "<leader>q", vim.diagnostic.setloclist)
map("n", "<leader>Q", vim.diagnostic.setqflist)

map("n", "<leader>f", fzf.global)
map("n", "<leader>r", fzf.oldfiles)
map("n", "<leader><leader>", fzf.git_files)
map("n", "<leader>/", fzf.live_grep)
