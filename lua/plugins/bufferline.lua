return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {},
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
		{ "<leader>x", "<cmd>bd<cr>", desc = "Close buffer" },
	},
}
