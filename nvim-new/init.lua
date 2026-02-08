local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.o.number = true
vim.o.autoindent = true

vim.o.cursorline = true
vim.o.colorcolumn = "80"
vim.o.hlsearch = true
vim.o.scrolloff = 5
vim.o.mouse = "a"

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.termguicolors = true

require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

vim.keymap.set("n", "<C-J>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("n", "<C-K>", ":m .-2<CR>==", { noremap = true })
vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv", { noremap = true })

vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

vim.keymap.set("n", "<Leader>p", '"+p', { noremap = true })
vim.keymap.set("v", "<Leader>y", '"+y', { noremap = true })

vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { noremap = true })

vim.o.langmap = vim.o.langmap
  .. "чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\\|,"

local state_dir = vim.fn.stdpath("state")
vim.o.undodir = state_dir .. "/undo"
vim.o.directory = state_dir .. "/swap"
vim.o.undofile = true
