local util = require("rosebones.util")
local hslutil = require("rosebones.hsl")
local hsl = hslutil.hslToHex

local M = {}

---@class Palette
M.default = {
	none = "NONE",
	bg = hsl(274, 64, 2),
	fg = hsl(0, 18, 88),
	sky = hsl(243, 30, 80),
	text = hsl(347, 22, 75),
	gold = hsl(45, 98, 50),
	cream = hsl(2, 66, 75),
	pine = hsl(198, 49, 38),
	green = hsl(181, 17, 45),
	purple = hsl(240, 20, 61),
	red = hsl(343, 76, 68),
	blue = hsl(217, 40, 56),
	brown = hsl(30, 31, 68),
	dark = hsl(229, 20, 41),
	muted = hsl(9, 30, 6),
	overlay = hsl(60, 1, 80),
	comment = hsl(250, 11, 45),
	bg_highlight = hsl(249, 15, 28),
}

---@return ColorScheme
function M.setup(opts)
	opts = opts or {}
	local config = require("rosebones.config")

	local style = config.options.style
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
	colors.link = colors.purple

	colors.error = colors.red
	colors.hint = colors.sky
	colors.info = colors.green
	colors.warning = colors.gold
	colors.todo = colors.rose
	colors.note = colors.pine

	colors.git = {
		add = colors.green,
		change = colors.blue,
		delete = colors.overlay,
		dirty = colors.sky,
		text = colors.fg,
		ignore = colors.comment,
		merge = colors.rose,
		rename = colors.pine,
		stage = colors.pine,
		untracked = colors.fg,
	}

	colors.h1 = colors.rose
	colors.h2 = colors.green
	colors.h3 = colors.purple
	colors.h4 = colors.blue
	colors.h5 = colors.sky
	colors.h6 = colors.brown

	colors.delta = {
		add = util.darken(colors.green, 0.45),
		delete = util.darken(colors.red, 0.45),
	}

	config.options.on_colors(colors)

	return colors
end

return M
