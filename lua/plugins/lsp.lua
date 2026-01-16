return {
  "mason-org/mason.nvim",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim", "Snacks" } },
          },
        },
      },
      gopls = {},
      pyright = {},
    },
  },
  keys = {
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gr", function() Snacks.picker.lsp_references() end, desc = "Goto References" },
    { "K", vim.lsp.buf.hover, desc = "Hover" },
    { "<leader>r", vim.lsp.buf.rename, desc = "Rename" },
    { "<leader>a", vim.lsp.buf.code_action, desc = "Code Action" },
  },
  config = function(_, opts)
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "lua-language-server",
        "gopls",
        "pyright",
        "stylua",
        "ruff",
        "prettierd",
      },
    })

    for server, config in pairs(opts.servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}
