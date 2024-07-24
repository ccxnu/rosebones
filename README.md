# 🌹 Rosebones 🦴

A dark and light [Neovim](https://github.com/neovim/neovim) theme written in
[Lua](https://www.lua.org) inspired on from the [Rose Pine](https://github.com/rose-pine/neovim)
and [Zenbones](https://github.com/mcchrish/zenbones.nvim) themes.

## Default

<!--- ![image](https://user-images.githubusercontent.com/292349/115295095-3a9e5080-a10e-11eb-9aed-6054488c46ce.png) --->

## Day

<!--- ![image](https://user-images.githubusercontent.com/292349/115295327-7afdce80-a10e-11eb-89b3-2591262bf95a.png) --->

## ✨ Features

- Supports the latest [Neovim](https://github.com/neovim/neovim)
  [0.9.0](https://github.com/neovim/neovim/releases/tag/v0.9.0) features.
- Enhances terminal colors.
- Dark and light themes.
- Supports all major plugins.

## ⚡️ Requirements

- [Neovim](https://github.com/neovim/neovim) >=
  [0.7.2](https://github.com/neovim/neovim/releases/tag/v0.7.2)

## 📦 Installation

Install the theme with your preferred package manager, such as
[folke/lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  'ccxnu/rosebones',
  lazy = false,
  priority = 1000,
  opts = {},
}
```

## 🚀 Usage

### Lua

```lua
vim.cmd.colorscheme('rosebones') -- or
vim.cmd.colorscheme('rosebones-day')
```

### Vim Script

```vim
colorscheme rosebones " or
colorscheme rosebones-day
```

## ⚙️ Configuration

The theme offers two styles: [dark](#default) and [day](#day).

The [day](#day) style is used when `{ style = "day" }` is passed to
`setup(options)` or when `vim.o.background = "light"`.

### Default options

```lua
require("rosebones").setup({
  style = "default", -- The theme comes in two styles: default(dark) & day(light).
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color (Recommended)
  terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
  },

  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
  use_background = true, -- can be light/dark/auto. When auto, background will be set to vim.o.background
})
```

## 🔥 Contributing

Pull requests are welcome.
This theme is still in progress.
Support for major all major plugins will come with time.

##### I hope you enjoy it!
