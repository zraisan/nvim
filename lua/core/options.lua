local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
-- opt.hlsearch = true    -- DEFAULT
-- opt.incsearch = true   -- DEFAULT

-- Appearance
opt.termguicolors = true
-- opt.background = "dark"  -- theme handles this
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Backspace
-- opt.backspace = "indent,eol,start"  -- DEFAULT

-- File handling
opt.swapfile = false
-- opt.backup = false  -- DEFAULT
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Completion
-- opt.completeopt = "menuone,noselect"  -- DEFAULT in Neovim 0.10+

-- Misc
opt.showmode = false
opt.fillchars = { eob = " " }
opt.iskeyword:append("-")
