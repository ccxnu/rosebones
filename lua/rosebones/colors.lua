local util = require("rosebones.util")
local hslutil = require("rosebones.hsl")
local hsl = hslutil.hslToHex

local M = {}

---@class Palette
M.default = {
  none = "NONE",
  bg = hsl(9, 30, 5),
 	fg = hsl(0, 18, 80),
  sky = hsl(243, 30, 80),
  love = hsl(347, 22, 75),
  gold = hsl(45, 98, 50),
  rose = hsl(2, 66, 75),
  pine = hsl(198, 49, 38),
  foam = hsl(188, 50, 50),
  iris = hsl(267, 20, 60),
  amor = hsl(343, 76, 68),
  blue = hsl(217, 40, 56),
  text = hsl(347, 22, 68),
  dark = hsl(229, 20, 41),
	muted = hsl(9, 30, 6),
	overlay = hsl(347, 20, 60),
  comment =	hsl(250, 11, 45),
  bg_highlight = hsl(249, 15, 28),
}

M.day = {
  none = "NONE",
  bg = hsl(15, 25, 85),
  fg = hsl(203, 15, 20),
  sky = hsl(248, 20, 40),
  love = hsl(350, 40, 30),
  gold = hsl(35, 55, 60),
  rose = hsl(3, 50, 50),
  pine = hsl(197, 53, 34),
  foam = hsl(189, 30, 45),
  iris = hsl(268, 25, 35),
  amor = hsl(344, 76, 60),
  blue = hsl(217, 40, 56),
  text = hsl(203, 15, 20),
  dark = hsl(229, 20, 41),
  muted = hsl(15, 22, 85),
  overlay = hsl(15, 25, 70),
 	comment = hsl(16, 7, 55),
  bg_highlight = hsl(225, 69, 87),
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
  -- util.day_brightness = config.options.day_brightness

  colors.black = util.darken(colors.bg, 0.98, "#000000")
  colors.border = colors.overlay
  colors.link = colors.iris

  colors.error = colors.amor
  colors.hint = colors.iris
  colors.info = colors.foam
  colors.todo = colors.rose
  colors.note = colors.pine
  colors.warning = colors.gold

  colors.git = {
    add = util.darken(colors.foam, 0.8),
    change = util.darken(colors.blue, 0.8),
    delete = util.darken(colors.amor, 0.8),
    dirty = util.darken(colors.love, 0.8),
    text = util.darken(colors.fg, 0.8),
    ignore = colors.comment,
    merge = colors.rose,
    rename = colors.pine,
    stage = colors.iris,
    untracked = colors.overlay,
  }

  colors.h1 = colors.amor
  colors.h2 = colors.blue
  colors.h3 = colors.iris
  colors.h4 = colors.rose
  colors.h5 = colors.foam
  colors.h6 = colors.gold

  colors.delta = {
    add = util.darken(colors.foam, 0.45),
    delete = util.darken(colors.amor, 0.45),
  }

  config.options.on_colors(colors)

  return colors
end

return M
