return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = { signature = { auto_open = { enabled = false } } },
            presets = {
                command_palette = { views = { cmdline_popup = { position = { row = "90%", col = "50%" } } } },
            },
        },
        dependencies = { "MunifTanjim/nui.nvim" },
    },
    {
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        }
    },
    {
        {
            'akinsho/toggleterm.nvim',
            version = "*",
            opts = {
                open_mapping = "<C-/>",
                direction = "float"
            }
        }
    }
}
