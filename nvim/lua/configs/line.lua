local ok, line = pcall(require, "feline")

if not ok then
  return
end

local vi_mode_utils = require "feline.providers.vi_mode"

local statusline = {
  active = {},
  inactive = {},
}
local winbar = {
  active = {},
  inactive = {},
}

statusline.active[1] = {
  {
    provider = "vi_mode",
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = vi_mode_utils.get_mode_color(),
        style = "bold",
      }
    end,
    right_sep = " ",
    left_sep = " ",
  },
  {
    provider = "file_info",
    hl = {
      fg = "white",
      style = "bold",
    },
    left_sep = {
      " ",
      { str = " ", hl = { fg = "NONE" } },
    },
    right_sep = {
      { str = " ", hl = { fg = "NONE" } },
      " ",
    },
  },
  {
    provider = "file_size",
    right_sep = {
      " ",
      {
        str = " ",
        hl = {
          fg = "fg",
          bg = "bg",
        },
      },
    },
  },
  {
    provider = "position",
    left_sep = " ",
    right_sep = {
      " ",
      {
        str = " ",
        hl = {
          fg = "fg",
          bg = "bg",
        },
      },
    },
  },
  {
    provider = "diagnostic_errors",
    hl = { fg = "red" },
  },
  {
    provider = "diagnostic_warnings",
    hl = { fg = "yellow" },
  },
  {
    provider = "diagnostic_hints",
    hl = { fg = "cyan" },
  },
  {
    provider = "diagnostic_info",
    hl = { fg = "skyblue" },
  },
}

statusline.active[2] = {
  {
    provider = "git_branch",
    hl = {
      fg = "white",
      bg = "black",
      style = "bold",
    },
    right_sep = {
      str = " ",
      hl = {
        fg = "NONE",
        bg = "black",
      },
    },
  },
  {
    provider = "git_diff_added",
    hl = {
      fg = "green",
      bg = "black",
    },
  },
  {
    provider = "git_diff_changed",
    hl = {
      fg = "orange",
      bg = "black",
    },
  },
  {
    provider = "git_diff_removed",
    hl = {
      fg = "red",
      bg = "black",
    },
    right_sep = {
      str = " ",
      hl = {
        fg = "NONE",
        bg = "black",
      },
    },
  },
  {
    provider = "line_percentage",
    hl = {
      style = "bold",
    },
    left_sep = "  ",
    right_sep = " ",
  },
  {
    provider = "scroll_bar",
    hl = {
      fg = "skyblue",
      style = "bold",
    },
  },
}

statusline.inactive[1] = {
  {
    provider = "file_type",
    hl = {
      fg = "white",
      bg = "oceanblue",
      style = "bold",
    },
    left_sep = {
      str = " ",
      hl = {
        fg = "NONE",
        bg = "oceanblue",
      },
    },
    right_sep = {
      {
        str = " ",
        hl = {
          fg = "NONE",
          bg = "oceanblue",
        },
      },
      " ",
    },
  },
  -- Empty component to fix the highlight till the end of the statusline
  {},
}

winbar.active[1] = {
  {
    provider = "file_info",
    hl = {
      fg = "skyblue",
      bg = "NONE",
      style = "bold",
    },
  },
}

winbar.inactive[1] = {
  {
    provider = "file_info",
    hl = {
      fg = "white",
      bg = "NONE",
      style = "bold",
    },
  },
}

local colors = require "nord.named_colors"
local gTheme = {
  fg = colors.darkest_white,
  bg = colors.black,
  black = colors.black,
  skyblue = colors.off_blue,
  cyan = colors.teal,
  green = colors.green,
  oceanblue = colors.glacier,
  magenta = colors.purple,
  orange = colors.orange,
  red = colors.red,
  violet = colors.blue,
  white = colors.white,
  yellow = colors.yellow,
}
line.setup { theme = gTheme, components = statusline }
line.winbar.setup { components = winbar }
