return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = { signature = { auto_open = { enabled = false } } },
			presets = {
				inc_rename = true,
				command_palette = { views = { cmdline_popup = { position = { row = "90%", col = "50%" } } } },
			},
		},
		dependencies = { "MunifTanjim/nui.nvim" },
	},
	{
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
	},
	{
		{
			"akinsho/toggleterm.nvim",
			version = "*",
			opts = {
				open_mapping = "<C-/>",
				direction = "float",
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"nvimdev/hlsearch.nvim",
		event = "BufRead",
		config = function()
			require("hlsearch").setup()
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		config = function()
			require("ccc").setup({
				highlighter = {
					auto_enable = true,
				},
			})
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		opts = {},
	},
	{
		"jannis-baum/vivify.vim",
	},
}
