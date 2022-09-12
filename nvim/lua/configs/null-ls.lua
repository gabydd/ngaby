local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.eslint_d,
		null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.formatting.erb_lint,
		null_ls.builtins.code_actions.eslint_d,
		null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.diagnostics.erb_lint,
	}
})
