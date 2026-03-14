-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- PATH
vim.env.PATH = '/opt/homebrew/opt/node@20/bin:' .. vim.env.PATH

-- Opciones básicas
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.cursorline = true

--Scroll
vim.opt.smoothscroll = true
vim.opt.scrolloff = 5
vim.opt.sidescroll = 8
vim.opt.sidescrolloff = 5
vim.opt.wrap = false

-- Clipboard (macOS)
vim.opt.clipboard = "unnamedplus"

-- Lazy.nvim bootstrap
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

require("lazy").setup({
  -- Tema
  {
    "vague-theme/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({
        transparent = true,
        bold = true,
        italic = true,
        plugins = {
          cmp = {
            march = "bold",
            march_fuzzy = "bold",
          },--temrina cmp
          dashboard = {footer = "italic"},
          lsp = {
            diagnostic_error = "bold",
            diagnostic_hint = "none",
            diagnostic_info = "italic",
            diagnostic_ok = "none",
            diagnostic_warn = "bold",
          },-- termina lsp
          neotest = {
            focused = "bold",
            adapter_name = "bold",
          },
          telescope = { match = "bold", },
        },-- termina plugins
      })
    vim.cmd("colorscheme vague")
    end
  },
-- plugins
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
        },
        scope = {
          enabled = true,
        },
      })
    end,
  },
  -- ANIMACION DE SCROLL SUAVE
  {
  "karb94/neoscroll.nvim",
  config = function()
    require('neoscroll').setup()
  end,
  },

  --bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function ()
      require("bufferline").setup ({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          show_buffer_close_icons = true,
          show_close_icon = false,
        },--termina options
      })-- termina require bufferline
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "html",
          "cssls",
          "ts_ls",
          "jsonls",
          "intelephense",
        },
      })

      local lspconfig = require("lspconfig")
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.jsonls.setup({})
      --lspconfig.intelephense.setup({
       -- cmd = {
         -- vim.fn.stdpath("data") .. "/mason/bin/intelephense",
        --"--stdio"
        --},
      --})
    end,
  },

  -- Autocompletado
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },

  -- Árbol de archivos
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
    end,
  },

  -- Treesitter
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "html",
      "css",
      "javascript",
      "typescript",
      "json",
      "lua",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
 },
})

-- COMANDOS DE TECLADO
-- cambiar entre buffers
vim.keymap.set ("n", "<Tab>", ":BufferLineCycleNext<CR>", {silent = true})
vim.keymap.set ("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {silent = true})

-- cambiar buffer actual
vim.keymap.set ("n", "<leader>db", ":bdelete<CR>", {silent = true})
