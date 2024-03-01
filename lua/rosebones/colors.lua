local util = require("rosebones.util")
local hslutil = require("rosebones.hsl")
local hsl = hslutil.hslToHex

local M = {}

---@class Palette
M.default = {
  none = "NONE",
  bg = hsl(249, 22, 12),
  fg = hsl(0, 18, 86),
  text = hsl(245, 53, 92),
  love = hsl(347, 22, 63),
  gold = hsl(35, 98, 81),
  rose = hsl(2, 66, 75),
  pine = hsl(198, 49, 38),
  foam = hsl(188, 64, 68),
  iris = hsl(267, 57, 78),
  amor = hsl(343, 76, 68),
  dark = hsl(229, 20, 41),
  comment =	hsl(250, 11, 45),
  bg_highlight = hsl(264, 17, 50),

  git = {
    add = "#449dab",
    change = "#6183bb",
    delete = "#914c54"
  },
  gitSigns = {
    add = "#266d6a",
    change = "#536c9e",
    delete = "#b2555b",
  },
}

M.day = {
  none = "NONE",
  bg = hsl(32, 57, 95),
  fg = hsl(2, 28, 35),
  text = hsl(248, 19, 40),
  love = hsl(343, 35, 55),
  gold = hsl(35, 81, 56),
  rose = hsl(3, 53, 67),
  pine = hsl(197, 53, 34),
  foam = hsl(189, 30, 45),
  iris = hsl(268, 21, 57),
  amor = hsl(344, 76, 60),
  dark = hsl(229, 20, 41),
  comment =	hsl(250, 11, 45),
  bg_highlight = hsl(264, 17, 50),
  git = {
    add = "#449dab",
    change = "#6183bb",
    delete = "#914c54"
  },
  gitSigns = {
    add = "#266d6a",
    change = "#536c9e",
    delete = "#b2555b",
  },
}


---@return ColorScheme
function M.setup(opts)
  opts = opts or {}
  local config = require("rosebones.config")

  local style = config.is_day() and config.options.light_style or config.options.style
  local palette = M[style] or {}
  if type(palette) == "function" then
    palette = palette()
  end

  -- Color Palette
  ---@class ColorScheme: Palette
  local colors = vim.tbl_deep_extend("force", vim.deepcopy(M.default), palette)

  util.bg = colors.bg
  util.day_brightness = config.options.day_brightness

  colors.diff = {
    add = util.darken(colors.foam, 0.15),
    delete = util.darken(colors.amor, 0.15),
    change = util.darken(colors.text, 0.15),
    text = colors.text,
  }

  colors.git.ignore = colors.dark
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = util.darken(colors.foam, 0.8)
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg
  colors.bg_statusline = colors.bg

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.options.styles.sidebars == "transparent" and colors.none
    or colors.bg

  colors.bg_float = config.options.styles.floats == "transparent" and colors.none
    or colors.bg

  colors.bg_visual = util.darken(colors.pine, 0.4)
  colors.bg_search = colors.pine
  colors.fg_sidebar = colors.fg
  -- colors.fg_float = config.options.styles.floats == "dark" and colors.fg_dark or colors.fg
  colors.fg_float = colors.fg

  colors.error = colors.amor
  colors.todo = colors.blue
  colors.warning = colors.gold
  colors.info = colors.foam
  colors.hint = colors.iris

  colors.delta = {
    add = util.darken(colors.foam, 0.45),
    delete = util.darken(colors.amor, 0.45),
  }

  config.options.on_colors(colors)
  if opts.transform and config.is_day() then
    util.invert_colors(colors)
  end

  return colors
end

return M
