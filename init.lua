vim.g.mapleader = " "

vim.opt.shiftwidth = 2
vim.opt.hlsearch = false
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
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
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/saghen/blink.cmp",              version = "1.*" },
})

require("mason").setup()
require("fzf-lua").setup({ "hide" })

require("blink.cmp").setup({
	keymap = { ["<CR>"] = { "accept", "fallback" } },
	signature = { enabled = true },
})

require("oil").setup({
	keymaps = {
		["<C-h>"] = false,
		["<C-l>"] = false,
	}
})

require("gruvbox").setup()
vim.cmd("colorscheme gruvbox")

vim.lsp.enable({ "rust_analyzer", "lua_ls", "vtsls", "clangd", })

vim.keymap.set("n", "<leader>wo", ":wincmd c<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')

vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>g", ":LazyGit<CR>")

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>Q", vim.diagnostic.setqflist)

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>f", fzf.global)
vim.keymap.set("n", "<leader>/", fzf.live_grep)
