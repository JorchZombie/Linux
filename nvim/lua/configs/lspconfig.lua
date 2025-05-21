require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local pyright_opts = require("custom.configs.pyright")
--local M = {}

local servers = { "html", "cssls", "pyright", "jdtls" }
--vim.lsp.enable(servers)
for _, lsp in ipairs(servers) do
  if lsp == "pyright" then
    lspconfig.pyright.setup(pyright_opts)
  else
  lspconfig[lsp].setup({})
  end-- termina if / else
end

--M.configs = {
--  jdtls = require("custom.configs.jdtls"),
--}
-- read :h vim.lsp.config for changing options of lsp servers 
