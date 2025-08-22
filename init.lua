vim.g.mapleader = " "

vim.opt.timeoutlen = 300
vim.opt.updatetime = 250
vim.opt.shiftwidth = 2
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
vim.opt.winborder = "single"

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",              version = "1.*" },
})

require("mason").setup()
require("fzf-lua").setup()
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

require("vague").setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd("hi statusline guibg=NONE")

vim.lsp.enable({ "rust_analyzer", "lua_ls", "vtsls", "tailwindcss", "html", "clangd", })

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>wo", ":wincmd c<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')

vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "`", "``<Left>")
vim.keymap.set("i", '"', '""<Left>')

vim.keymap.set("n", "<leader>g", ":LazyGit<CR>")
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>q", fzf.diagnostics_document)
vim.keymap.set("n", "<leader>Q", fzf.diagnostics_workspace)
vim.keymap.set("n", "<leader>s", fzf.lsp_document_symbols)
vim.keymap.set("n", "<leader>f", fzf.files)
vim.keymap.set("n", "<leader><leader>", fzf.buffers)
vim.keymap.set("n", "<leader>/", fzf.live_grep)
vim.keymap.set("n", "<leader>r", fzf.oldfiles)
