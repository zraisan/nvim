return {
	"akinsho/bufferline.nvim",
	lazy = false,
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			always_show_bufferline = true,
			diagnostics = "nvim_lsp",
		},
	},
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
		{ "<leader>x", "<cmd>bd<cr>", desc = "Close buffer" },
	},
}
