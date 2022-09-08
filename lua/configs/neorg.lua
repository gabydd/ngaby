local ok, neorg = pcall(require, "neorg")

if not ok then
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          school = "~/school/notes",
        }
      }
    },
    ["core.norg.concealer"] = {
      config = {
      }
    },
    ["core.gtd.base"] = {
      config = {
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
  }
}
