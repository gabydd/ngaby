local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
  return
end

treesitter.setup {
  ensure_installed = { "norg", "typescript", "lua", "javascript", "python", "bash", "c", "cpp", "css", "dot", "go", "json", "latex", "markdown", "markdown_inline", "regex", "html", "java", "svelte", "tsx", },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
