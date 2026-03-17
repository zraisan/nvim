return {
	"mason-org/mason-lspconfig.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		"neovim/nvim-lspconfig",
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			opts = {
				ensure_installed = {
					"stylua",
					"ruff",
					"prettierd",
					"eslint_d",
					"ktlint",
				},
			},
		},
	},
	opts = {
		ensure_installed = { "lua_ls", "gopls", "pyright", "ts_ls", "kotlin_language_server", "clangd" },
		automatic_enable = true,
	},
	keys = {
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "Goto References",
		},
		{ "K", vim.lsp.buf.hover, desc = "Hover" },
		{ "<leader>r", vim.lsp.buf.rename, desc = "Rename" },
		{ "<leader>a", vim.lsp.buf.code_action, desc = "Code Action" },
		{ "<leader>e", vim.diagnostic.open_float, desc = "Show Diagnostic" },
		{ "[d", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
		{ "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
	},
	config = function(_, opts)
		require("mason-lspconfig").setup(opts)
	end,
}
