local wk = require "which-key"

local leader = {
  f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format File" },
}

local find = {
  name = "+find",
  f = { "<cmd>Telescope find_files<cr>", "Find File" },
  g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
}

wk.register(leader, { prefix = "<leader>" })
wk.register(find, { prefix = "f" })
