local ok, tree = pcall(require, "neo-tree")

if not ok then
  return
end

tree.setup()
