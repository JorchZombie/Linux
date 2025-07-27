require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local pyright_opts = require("custom.configs.pyright") --python
local jdtls_opts = require("custom.configs.jdtls") -- java
--local M = {}

local servers = { "html", "cssls", "pyright", "jdtls" }
--vim.lsp.enable(servers)
for _, lsp in ipairs(servers) do
  if lsp == "pyright" then
    lspconfig.pyright.setup(pyright_opts) -- parte de if
  elseif lsp == "jdtls" then
    lspconfig.jdtls.setup(jdtls_opts) -- parte de elseif
  else
  lspconfig[lsp].setup({}) -- parte else
  end-- termina if / else
end -- termina for

--M.configs = {
--  jdtls = require("custom.configs.jdtls"),
--}
-- read :h vim.lsp.config for changing options of lsp servers 
