-- NeoVim Configuration

vim.cmd('set colorcolumn=80') -- ruler at 80
vim.opt.autowrite = true -- enable autowrite

-- absolute line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoread = true -- enable autoread
vim.opt.expandtab = true -- enable expandtab
vim.opt.shiftwidth = 2 -- set shiftwidth to 2
vim.opt.smartindent = true -- enable smartindent
-- vim.opt.shiftround = true -- enable shiftround

-- plugins
-- Plugins configuration file
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "github/copilot.vim",
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                -- Recommended - see "Configuring" below for more config options
                transparent = true,
                italic_comments = true,
                hide_fillchars = true,
                borderless_telescope = true,
                terminal_colors = true,
            })
            vim.cmd("colorscheme cyberdream") -- set the colorscheme
        end,
    },
}

require("lazy").setup(plugins, opts)
