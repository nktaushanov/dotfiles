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
  {
    "folke/sidekick.nvim",
    opts = {
      nes = { enabled = false },
      cli = {
        win = {
          layout = "right",
          split = {
            width = 80,
          },
        },
      },
    },
    keys = {
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        desc = "Sidekick Select CLI",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = "x",
        desc = "Sidekick Send Selection",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "catppuccin",
      },
    },
  },
  {
    "petertriho/nvim-scrollbar",
    opts = {},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "typescript",
          "tsx",
          "javascript",
          "python",
          "bash",
          "go",
        },
        highlight = { enable = true },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      telescope.load_extension("fzf")
    end,
  },
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "ts_ls", "pyright", "bashls", "eslint" },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      local servers = { "ts_ls", "pyright", "bashls", "gopls", "eslint" }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { noremap = true, silent = true, buffer = event.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<Leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end,
      })

      vim.lsp.enable(servers)

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
        callback = function()
          pcall(vim.cmd, "EslintFixAll")
        end,
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  {
    "sindrets/diffview.nvim",
    opts = {},
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

vim.keymap.set("n", "<Leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gd", ":DiffviewOpen<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>gD", ":DiffviewClose<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fh", ":Telescope help_tags<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fs", ":Telescope lsp_document_symbols<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>fS", ":Telescope lsp_workspace_symbols<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>e", ":Neotree toggle<CR>", { noremap = true })
vim.keymap.set("n", "<F2>", ":Neotree toggle<CR>", { noremap = true })

vim.o.langmap = vim.o.langmap
  .. "чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\\|,"

local state_dir = vim.fn.stdpath("state")
vim.o.undodir = state_dir .. "/undo"
vim.o.directory = state_dir .. "/swap"
vim.o.undofile = true
