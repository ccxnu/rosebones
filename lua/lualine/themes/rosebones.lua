local c = require("rosebones.colors")
local config = require("rosebones.config")

local bg = c.border
if config.options.transcparent then
	bg = "NONE"
end

local rosebones = {}

rosebones.normal = {
  a = { bg = c.rose, fg = c.bg },
  b = { bg = c.overlay, fg = c.rose },
  c = { bg = bg, fg = c.fg },
}

rosebones.insert = {
  a = { bg = c.foam, fg = c.border },
  b = { bg = c.overlay, fg = c.foam },
  c = { bg = bg, fg = c.fg },
}

rosebones.visual = {
  a = { bg = c.iris, fg = c.border },
  b = { bg = c.overlay, fg = c.iris },
  c = { bg = bg, fg = c.fg },
}

rosebones.replace = {
  a = { bg = c.pine, fg = c.border },
  b = { bg = c.overlay, fg = c.pine },
  c = { bg = bg, fg = c.fg },
}

rosebones.command = {
  a = { bg = c.love, fg = c.border },
  b = { bg = c.overlay, fg = c.love },
  c = { bg = bg, fg = c.fg },
},
rosebones.inactive = {
  a = { bg = bg, fg = c.comment },
  b = { bg = bg, fg = c.comment },
  c = { bg = bg, fg = c.comment },
},

rosebones.insert = {
  a = { bg = c.pine, fg = c.black },
  b = { bg = c.border, fg = c.pine },
}

if config.lualine_bold then
  for _, mode in pairs(rosebones) do
    mode.a.gui = "bold"
  end
end

return rosebones
