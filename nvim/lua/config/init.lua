local opt = vim.opt
local map = vim.keymap.set

-- BASIC SETTINGS
opt.number = true           -- Line numbers
opt.relativenumber = true   -- Relative line numbers
opt.title = true            -- Show file title
opt.expandtab = true        -- Use spaces instead of tabs
opt.tabstop = 4             -- Number of spaces in a tab
opt.shiftwidth = 4          -- Number of spaces in auto-indentation
opt.softtabstop = 4         -- Number of spaces for <Tab> in Insert mode
opt.list = true             -- Set list mode for showing non-printing chars
opt.listchars = {
    tab = "<->",
    space = "·",
    extends = "»",
    precedes = "«",
}

-- KEYBINDINGS
vim.cmd([[set <S-Tab>=\e[Z]]) -- Fix issue with <Shift-Tab> not coming through properly

map("i", "<S-Tab>", "<C-d>")
map("v", "<Tab>", ">gv")
map("v", "<S-Tab>", "<gv")
map("v", "<lt>", "<gv")
map("v", ">", ">gv")
