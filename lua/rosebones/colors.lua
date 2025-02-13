local util = require("rosebones.util")

local M = {}

---@class Palette
M.default = {
	none = "NONE",
	bg = "#060F0B",
	fg = "#E5DADA",
	red = "#893f45",
	pine = "#31748F",
	sky = "#C0CAF5",
	blue = "#81A2BE",
	text = "#CDB1B7",
	green = "#5F8484",
	brown = "#A87569",
	muted = "#130C0A",
	overlay = "#545C7E",
	dark = "#292E42",
	gold = "#C99D5D",
	purple = "#8787AF",
	cream = "#E99795",
	comment = "#5F5B72",
	bg_highlight = "#3F3C52",
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
	colors.todo = colors.cream
	colors.note = colors.pine

	colors.git = {
		add = util.darken(colors.green, 0.70),
		change = colors.blue,
		delete = colors.red,
		dirty = colors.sky,
		text = colors.fg,
		ignore = colors.comment,
		merge = colors.cream,
		rename = colors.pine,
		stage = colors.pine,
		untracked = colors.fg,
	}

	colors.h1 = colors.cream
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
