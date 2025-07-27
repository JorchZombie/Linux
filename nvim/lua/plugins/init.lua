return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {--configuracion toggleterm.nvim
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function ()
      require ("toggleterm").setup({
        --esto solo es para "personalizar la terminal que va a salir"
        direction = "float",
        float_opts = {border = "curved",}, --otras opciones son "single", "double", "shadow"
        start_in_insert = true,
        insert_mappings = true,
      })--termina setup
      vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", {desc = "Toggle Terminal"})
    end,
  },
--{
    --"folke/tokyonight.nvim",
    --lazy = false,
    --priority = 1000,
    --config = function()
      --vim.cmd("colorscheme tokyonight-night")
      --otros temas pueden ser
      --tokyonight-storm
    --end,
  --},

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
