local ok_m, mason = pcall(require, "mason")
local ok_mlsp, masonlsp = pcall(require, "mason-lspconfig")
local ok_lsp, lspconfig = pcall(require, "lspconfig")

if not ok_m or not ok_mlsp or not ok_lsp then
	return
end

require("lua-dev").setup({
})
mason.setup()
masonlsp.setup()
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local langs = {
	["tsserver"] = {},
  ["sumneko_lua"] = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
  ["jsonls"] = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
  ["hls"] = {},
  ["emmet_ls"] = {},
  ["solargraph"] = {},
  ["tailwindcss"] = {},
}
for key, value in pairs(langs) do
	lspconfig[key].setup {
    capabilities = capabilities,
    settings = value,
  }
end
