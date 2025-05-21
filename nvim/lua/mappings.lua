require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- ===============> COMANDOS PARA COMPILAR Y EJECUTAR
map("n", "<leader>rp", ":w | !python3 '%'<CR>", {desc = "Run Python File"}) -- PYTHON
map("n", "<leader>rj", ":w | !javac '%:p' && cd '%:p:h' && java '%:t:r'<CR>", {desc = "Run Java File"}) -- JAVA
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
