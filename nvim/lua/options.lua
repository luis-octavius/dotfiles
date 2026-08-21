require "nvchad.options"

-- add yours here!
local mason_path = vim.fn.stdpath("data") .. "/mason/bin"
vim.env.PATH = mason_path .. ":" .. vim.env.PATH
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
