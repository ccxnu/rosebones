local c = require("rosebones.colors")
local config = require("rosebones.config")

local bg_base = c.muted
if config.options.transparent then
	bg_base = c.none
end

return {
  normal = {
    a = { bg = c.rose, fg = c.bg, gui = "bold" },
    b = { bg = c.overlay, fg = c.rose },
    c = { bg = bg_base, fg = c.fg },
  },

  insert = {
    a = { bg = c.foam, fg = c.border, gui = "bold" },
    b = { bg = c.overlay, fg = c.foam },
    c = { bg = bg_base, fg = c.fg },
  },

  visual = {
    a = { bg = c.iris, fg = c.border, gui = "bold" },
    b = { bg = c.overlay, fg = c.iris },
    c = { bg = bg_base, fg = c.fg },
  },

  replace = {
    a = { bg = c.pine, fg = c.border, gui = "bold" },
    b = { bg = c.overlay, fg = c.pine },
    c = { bg = bg_base, fg = c.fg },
  },

  command = {
    a = { bg = c.love, fg = c.border, gui = "bold" },
    b = { bg = c.overlay, fg = c.love },
    c = { bg = bg_base, fg = c.fg },
  },

  inactive = {
		a = { bg = bg_base, fg = c.comment, gui = "bold" },
		b = { bg = bg_base, fg = c.comment },
		c = { bg = bg_base, fg = c.comment },
  },
}

