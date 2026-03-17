local theme = "aurora"

return {
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		enabled = theme == "github",
		config = function()
			require("github-theme").setup({})
			vim.cmd("colorscheme github_dark")
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "aurora",
		lazy = false,
		priority = 1000,
		enabled = theme == "aurora",
		config = function()
			local aurora = require("core.themes.aurora")
			require("github-theme").setup(aurora.setup)
			vim.cmd("colorscheme github_dark_dimmed")
		end,
	},
	{
		"casedami/neomodern.nvim",
		enabled = theme == "neomodern",
		config = function()
			require("neomodern").setup({
				theme = "roseprime",
				overrides = {
					hlgroups = {
						["Normal"] = { guibg = "#22272e" },
						["@string"] = { guifg = "#7ee787" },
						["String"] = { guifg = "#7ee787" },
					},
				},
			})
			require("neomodern").load()
		end,
	},
}
