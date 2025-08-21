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
vim.opt.winborder = "rounded"

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
	{ src = "https://github.com/echasnovski/mini.ai" },
	{ src = "https://github.com/echasnovski/mini.surround" },
	{ src = "https://github.com/echasnovski/mini.pairs" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/karb94/neoscroll.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp",                version = "1.*" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("mini.ai").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("neoscroll").setup({ duration_multiplier = 0.5 })
require("mason").setup()
require("fzf-lua").setup()
require("fzf-lua").register_ui_select()
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
vim.keymap.set("n", "<leader>ww", ":wincmd w<CR>")
vim.keymap.set("n", "<leader>wh", ":wincmd H<CR>")
vim.keymap.set("n", "<leader>wl", ":wincmd L<CR>")
vim.keymap.set("n", "<leader>wi", ":wincmd I<CR>")
vim.keymap.set("n", "<leader>wk", ":wincmd K<CR>")

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d')

vim.keymap.set({ "n", "v" }, "<leader>g", ":LazyGit<CR>")
vim.keymap.set("n", "<leader>e", ":Oil<CR>")

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", fzf.lsp_document_diagnostics)
vim.keymap.set("n", "<leader>Q", fzf.lsp_workspace_diagnostics)

vim.keymap.set("n", "gi", fzf.lsp_implementations)
vim.keymap.set("n", "gt", fzf.lsp_typedefs)
vim.keymap.set("n", "gd", fzf.lsp_definitions)
vim.keymap.set("n", "gD", fzf.lsp_declarations)
vim.keymap.set("n", "grr", fzf.lsp_references)
vim.keymap.set("n", "gra", fzf.lsp_code_actions)

vim.keymap.set("n", "<leader>f", fzf.files)
vim.keymap.set("n", "<leader>s", fzf.lsp_document_symbols)
vim.keymap.set("n", "<leader><leader>", fzf.buffers)
vim.keymap.set("n", "<leader>/", fzf.live_grep)
vim.keymap.set("n", "<leader>r", fzf.oldfiles)

vim.keymap.set("n", "gK", function()
	local current_config = vim.diagnostic.config()
	local new_virtual_lines_setting = not current_config.virtual_lines
	vim.diagnostic.config({ virtual_lines = new_virtual_lines_setting })
end)
