local util = require("rosebones.util")
local colors = require("rosebones.colors")

local M = {}
--
---@class Highlight
---@field fg string|nil
---@field bg string|nil
---@field sp string|nil
---@field style string|nil|Highlight
---@field link string|nil

---@alias Highlights table<string,Highlight>

---@return Theme
function M.setup()
  local config = require("rosebones.config")
  local options = config.options
  local styles = options.styles
  ---@class Theme
  ---@field highlights Highlights
  local theme = {
    config = options,
    colors = colors.setup(),
  }

  local c = theme.colors

  theme.highlights = {
    ColorColumn = { bg = c.black }, -- used for the columns set with 'colorcolumn'
    Conceal = { bg = c.none, bold = true }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		CurSearch = { fg = c.bg, bg = c.gold },
    Cursor = { fg = c.bg, bg = c.gold }, -- character under the cursor
    CursorColumn = { bg = c.bg }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    -- CursorIM = {}, -- like Cursor, but used when in IME mode |CursorIM|
    CursorLine = { bg = c.none }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorLineNr = { fg = c.text }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    DiffAdd = { bg = c.git.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.git.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.git.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.git.text }, -- diff mode: Changed text within a changed line |diff.txt|
		diffAdded = { link = "DiffAdd" },
		diffChanged = { link = "DiffChange" },
		diffRemoved = { link = "DiffDelete" },
    Directory = { bold = true }, -- directory names (and other special names in listings)
    -- EndOfBuffer = {}, -- filler lines (~) after the end of the buffer.
    ErrorMsg = { fg = c.error, bold = true }, -- error messages on the command line
    FloatBorder = { fg = c.border, bg = c.bg },
		FloatTitle = { link = "Directory" },
    FoldColumn = { fg = c.comment }, -- 'foldcolumn'
    Folded = { fg = c.fg, bg = c.black }, -- line used for closed folds
		IncSearch = { link = "CurSearch" }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    LineNr = { fg = c.comment }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    MatchParen = { fg = c.rose, bold = true }, -- The character under the cursor or just before it, if it is a paiamor bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.fg, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MoreMsg = { fg = c.foam }, -- |more-prompt|
    MsgArea = { fg = c.fg }, -- Area for messages and cmdline
    NonText = { fg = c.dark }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = c.bg }, -- normal text
    NormalFloat = { fg = c.fg, bg = c.bg }, -- Normal text in floating windows.
    NormalNC = { fg = c.fg, bg = options.dim_inactive and c.black or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fg, bg = c.bg }, -- normal text in sidebar
		NvimInternalError = { link = "ErrorMsg" },

    Pmenu = { bg = c.black }, -- Popup menu: normal item.
    PmenuSbar = { bg = util.lighten(c.black, 0.95) }, -- Popup menu: scrollbar.
    PmenuSel = { bg = util.darken(c.dark, 0.8) }, -- Popup menu: selected item.
    PmenuThumb = { bg = c.comment }, -- Popup menu: Thumb of the scrollbar.

    Question = { link = "MoreMsg" }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine = {}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.bg_highlight, fg = c.text }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    SignColumn = { fg = c.text, bg = c.none }, -- column where |signs| are displayed
    SpecialKey = { fg = c.foam }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.error, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.error, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fg, bg = c.muted }, -- status line of current window
    StatusLineNC = { fg = util.darken(c.fg, 0.7), bg = c.muted }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTerm = { fg = c.bg, bg = util.lighten(c.iris, 0.8) },
		StatusLineTermNC = { fg = c.bg, bg = util.darken(c.iris, 0.7) },
		Substitute = { link = "IncSearch" }, -- |:substitute| replacement text highlighting
    TabLine = { link = "StatusLine" }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.black, bg = c.foam }, -- tab pages line, active tab page label
    Title = { fg = c.fg, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    VertSplit = { fg = c.border, bg = c.none }, -- the column separating vertically split windows
    Visual = { bg = c.bg_highlight }, -- Visual mode selection
    -- VisualNOS = {}, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.warning, bold = true }, -- warning messages
    -- Whitespace = {}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { link = "IncSearch" },  -- current match in 'wildmenu' completion
    WinBar = { link = "StatusLine" }, -- window bar
    WinBarNC = { link = "StatusLineNC" }, -- window bar in inactive windows
    WinSeparator = { fg = util.darken(c.border, 0.3), bold = true }, -- the column separating vertically split windows

    -- These c are not listed as default vim c,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out c should chain up to their "preferamor" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = c.comment }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { fg = c.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { fg = c.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { fg = c.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { fg = c.hint }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { undercurl = true, sp = c.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { undercurl = true, sp = c.hint }, -- Used to underline "Hint" diagnostics

		Boolean = { fg = c.text }, --  a boolean constant: TRUE, false
		Character = { fg = c.text }, --  a character constant: 'c', '\n'
		Comment = { fg = c.comment, italic = true },
		-- Conditional = { fg = c.pine }, --  if, then, else, endif, switch, etc.
		Constant = { fg = c.text }, -- (preferred) any constant
		Debug = { fg = c.rose }, -- debugging statements
		Define = { fg = c.pine }, --   preprocessor #define
		Delimiter = { fg = c.comment },  --  character that needs attention
		Error = { fg = c.error },
		-- Exception = { fg = c.pine }, --  try, catch, throw
		Float = { fg = c.text }, -- a floating point constant: 2.3e10
		Function = { fg = c.fg }, -- function name (also: methods for classes)
		Identifier = { fg = c.fg }, -- (preferred) any variable name
		Include = { fg = c.pine }, --  preprocessor #include
		Keyword = { fg = c.pine },  --  any other keyword
		Label = { fg = c.foam }, -- case, default, etc.
		LspCodeLens = { fg = c.comment },
		LspCodeLensSeparator = { fg = c.comment },
		LspInlayHint = { fg = c.comment },
		LspReferenceRead = { bg = c.bg_highlight },
		LspReferenceText = { bg = c.bg_highlight },
		LspReferenceWrite = { bg = c.bg_highlight },
		-- Macro = { fg = c.fg }, -- same as Define
		Number = { fg = c.text },
		Operator = { fg = c.pine }, -- "sizeof", "+", "*", etc.
		PreCondit = { fg = c.pine }, --  preprocessor #if, #else, #endif, etc.
		PreProc = { link= "PreCondit" }, -- (preferred) generic Preprocessor
		-- Repeat = { fg = c.pine }, --   for, do, while, etc.
		Special = { fg = c.iris }, -- (preferred) any special symbol
		-- SpecialChar = { link = "Special" }, --  special character in a constant
		-- SpecialComment = { fg = c.iris }, -- special things inside a comment
		Statement = { fg = c.pine, bold = true },-- (preferred) any statement
		StorageClass = { fg = c.iris }, -- static, register, volatile, etc.
		String = { fg = c.text },
		-- Structure = { fg = c.foam }, --  struct, union, enum, etc.
		Tag = { fg = c.pine }, -- you can use CTRL-] on this
		Todo = { fg = c.todo },
		Type = { fg = c.fg }, -- (preferred) int, long, char, etc.
		-- TypeDef = { link = "Type" }, --  A typedef
		Underlined = { fg = c.iris, underline = true },

		htmlArg = { fg = c.iris },
		htmlH1 = { link = "markdownH1" },
		htmlH2 = { link = "markdownH2" },
		htmlH3 = { link = "markdownH3" },
		htmlH4 = { link = "markdownH4" },
		htmlH5 = { link = "markdownH5" },
		htmlItalic = { italic = true },
		htmlBold = { bold = true },
		htmlLink = { link = "markdownUrl" },
		htmlTag = { fg = c.comment },
		htmlTagN = { fg = c.text },
		htmlTagName = { fg = c.pine },

		markdownDelimiter = { fg = c.comment },
		markdownH1 = { fg = c.h1, bold = true },
		markdownH1Delimiter = { link = "markdownH1" },
		markdownH2 = { fg = c.h2, bold = true },
		markdownH2Delimiter = { link = "markdownH2" },
		markdownH3 = { fg = c.h3, bold = true },
		markdownH3Delimiter = { link = "markdownH3" },
		markdownH4 = { fg = c.h4, bold = true },
		markdownH4Delimiter = { link = "markdownH4" },
		markdownH5 = { fg = c.h5, bold = true },
		markdownH5Delimiter = { link = "markdownH5" },
		markdownH6 = { fg = c.h6, bold = true },
		markdownH6Delimiter = { link = "markdownH6" },
		markdownLinkText = { link = "markdownUrl" },
		markdownUrl = { fg = c.sky, underline = true },

		mkdCodeDelimiter = { fg = c.rose },
		mkdCodeEnd = { fg = c.foam },
		mkdCodeStart = { fg = c.foam },

		--- Identifiers
    -- These groups are for the Neovim tree-sitter highlights.
    ["@annotation"] = { link = "PreProc" },
    ["@attribute"] = { fg = c.rose },
    ["@boolean"] = { link = "Boolean" },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@comment"] = { link = "Comment" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Constant" },
    ["@constant.macro"] = { link = "Define" },
    ["@keyword.debug"] = { link = "Debug" },
    ["@keyword.directive.define"] = { link = "Define" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@number.float"] = { link = "Float" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "@function" },
    ["@function.call"] = { link = "@function" },
    ["@function.macro"] = { link = "@function" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.coroutine"] = { link = "@keyword" },
    ["@keyword.operator"] = { link = "@operator" },
    ["@keyword.return"] = { link = "@keyword" },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "@function.method" },
    ["@namespace.builtin"] = { link = "@variable.builtin" },
    ["@none"] = {},
    ["@number"] = { link = "Number" },
    ["@keyword.directive"] = { fg = c.text },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.storage"] = { link = "StorageClass" },
    ["@string"] = { link = "String" },
    ["@markup.link.label"] = { link = "SpecialChar" },
    ["@markup.link.label.symbol"] = { link = "Identifier" },
    ["@tag"] = { link = "Tag" },
    ["@tag.attribute"] = { fg = c.iris },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@markup"] = { link = "@none" },
    ["@markup.environment"] = { link = "Macro" },
    ["@markup.environment.name"] = { link = "Type" },
    ["@markup.raw"] = { link = "String" },
    ["@markup.math"] = { link = "Special" },
    ["@markup.strong"] = { bold = true },
    ["@markup.emphasis"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { link = "Title" },
    ["@comment.note"] = { fg = c.hint },
    ["@comment.error"] = { fg = c.error },
    ["@comment.hint"] = { fg = c.hint },
    ["@comment.info"] = { fg = c.info },
    ["@comment.warning"] = { fg = c.warning },
    ["@comment.todo"] = { fg = c.todo },
    ["@markup.link.url"] = { link = "Underlined" },
    ["@type"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@type.qualifier"] = { fg = c.iris },

    --- Misc
    -- TODO:
    -- ["@comment.documentation"] = { },
    ["@operator"] = { fg = c.pine }, -- For any operator: `+`, but also `->` and `*` in C.

    --- Punctuation
    ["@punctuation.delimiter"] = { fg = c.fg }, -- For delimiters ie: `.`
    ["@punctuation.bracket"] = { fg = c.fg }, -- For brackets and parens.
    ["@punctuation.special"] = { fg = c.iris }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@markup.list"] = { fg = c.pine }, -- For special punctutation that does not fall in the catagories before.
    ["@markup.list.markdown"] = { fg = c.rose, bold = true },

    --- Literals
    ["@string.documentation"] = { fg = c.gold },
    ["@string.regexp"] = { fg = c.foam }, -- For regexes.
    ["@string.escape"] = { fg = c.iris }, -- For escape characters within a string.

    --- Functions
    ["@constructor"] = { fg = c.fg }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@variable.parameter"] = { fg = c.text }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = util.lighten(c.gold, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

    --- Keywords
    ["@keyword"] = { fg = c.pine, style = styles.keywords }, -- For keywords that don't fall in previous categories.
    ["@keyword.function"] = { fg = c.iris, style = styles.functions }, -- For keywords used to define a fuction.

    ["@label"] = { fg = c.foam }, -- For labels: `label:` in C and `:label:` in Lua.

    --- Types
    ["@type.builtin"] = { fg = c.fg },
    ["@variable.member"] = { fg = c.fg }, -- For fields.
    ["@property"] = { fg = c.fg }, -- Variabel on lua?

    --- Identifiers
    ["@variable"] = { fg = c.fg, style = styles.variables }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = { fg = c.text }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@module.builtin"] = { fg = c.text }, -- Variable names that are defined by the languages, like `this` or `self`.

    --- Text
    ["@markup.raw.markdown_inline"] = { bg = c.black, fg = c.foam },
    ["@markup.link"] = { fg = c.pine },

    ["@markup.list.unchecked"] = { fg = c.foam }, -- For brackets and parens.
    ["@markup.list.checked"] = { fg = c.love }, -- For brackets and parens.

    ["@git.plus"] = { link = "DiffAdd" },
    ["@git.minus"] = { link = "DiffDelete" },
    ["@git.delta"] = { link = "DiffChange" },

    ["@module"] = { link = "Include" },

    -- tsx
    ["@tag.tsx"] = { fg = c.pine },
    ["@constructor.tsx"] = { fg = c.rose },
    ["@tag.delimiter.tsx"] = { fg = c.comment },

    -- LSP Semantic Token Groups
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.deriveHelper"] = { link = "@attribute" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
    ["@lsp.type.generic"] = { link = "@variable" },
    ["@lsp.type.interface"] = { fg = util.lighten(c.foam, 0.7) },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.lifetime"] = { link = "@keyword.storage" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.error },
    ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = util.darken(c.foam, 0.8) },
    ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = util.darken(c.foam, 0.8) },
    ["@lsp.typemod.variable.callable"] = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    ["@lsp.typemod.variable.static"] = { link = "@constant" },
    -- NOTE: maybe add these with distinct highlights?
    -- ["@lsp.typemod.variable.globalScope"] (global variables)

    -- NeoVim
    healthError = { fg = c.error },
    healthSuccess = { fg = c.foam },
    healthWarning = { fg = c.warning },

    --- PLUGINS ---

		-- hrsh7th/nvim-cmp
		CmpItemAbbr = { fg = c.fg },
		CmpItemAbbrDeprecated = { fg = c.comment, strikethrough = true },
		CmpItemAbbrMatch = { fg = c.text, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = c.text, bold = true },
		CmpItemKind = { fg = c.comment },
		CmpItemKindClass = { link = "StorageClass" },
		CmpItemKindFunction = { link = "Function" },
		CmpItemKindInterface = { link = "Type" },
		CmpItemKindMethod = { link = "PreProc" },
		CmpItemKindSnippet = { link = "String" },
		CmpItemKindVariable = { link = "Identifier" },

    -- GitSigns
		GitSignsAdd = { fg = util.darken(c.git.add, 0.8), bg = c.none },
		GitSignsChange = { fg = util.darken(c.git.change, 0.8), bg = c.none },
		GitSignsDelete = { fg = util.darken(c.git.delete, 0.8), bg = c.none },
    SignAdd = { fg = c.git.add, bg = c.none }, -- diff mode: Added line |git.txt|
    SignChange = { fg = c.git.change, bg = c.none }, -- diff mode: Changed line |git.txt|
    SignDelete = { fg = c.git.delete, bg = c.none }, -- diff mode: Deleted line |git.txt|

    -- Telescope
    TelescopeBorder = { fg = c.border, bg = c.bg },
    TelescopeNormal = { fg = c.fg, bg = c.bg },
		TelescopeSelection = { fg = c.fg, bg = c.bg_highlight },

    -- ibhagwan/fzf-lua
    FzfLuaBorder = { fg = c.border, bg = c.bg },
    FzfLuaNormal = { fg = c.fg, bg = c.bg },

		-- nvim-neo-tree/neo-tree.nvim
		NeoTreeGitAdded = { fg = c.git.add },
		NeoTreeGitConflict = { fg = c.git.merge },
		NeoTreeGitDeleted = { fg = c.git.delete },
		NeoTreeGitIgnored = { fg = c.git.ignore },
		NeoTreeGitModified = { fg = c.git.dirty },
		NeoTreeGitRenamed = { fg = c.git.rename },
		NeoTreeGitUntracked = { fg = c.git.untracked },
		NeoTreeTitleBar = { link = "StatusLineTerm" },

		-- kyazdani42/nvim-tree.lua
		NvimTreeEmptyFolderName = { fg = c.comment },
		NvimTreeFileDeleted = { fg = c.git.delete },
		NvimTreeFileDirty = { fg = c.git.dirty },
		NvimTreeFileMerge = { fg = c.git.merge },
		NvimTreeFileNew = { fg = c.foam },
		NvimTreeFileRenamed = { fg = c.git.rename },
		NvimTreeFileStaged = { fg = c.git.stage },
		NvimTreeFolderIcon = { fg = c.comment },
		NvimTreeFolderName = { fg = c.fg, bold = true },
		NvimTreeGitDeleted = { fg = c.git.delete },
		NvimTreeGitDirty = { fg = c.git.dirty },
		NvimTreeGitIgnored = { fg = c.git.ignore },
		NvimTreeGitMerge = { fg = c.git.merge },
		NvimTreeGitNew = { fg = c.git.add },
		NvimTreeGitRenamed = { fg = c.git.rename },
		NvimTreeGitStaged = { fg = c.git.stage },
		NvimTreeImageFile = { fg = c.text },
		NvimTreeNormal = { link = "Normal" },
		NvimTreeOpenedFile = { fg = c.text, bg = c.gold },
		NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
		NvimTreeRootFolder = { fg = c.pine, bold = true },
		NvimTreeSpecialFile = { link = "NvimTreeNormal" },
		NvimTreeWindowPicker = { link = "StatusLineTerm" },
    NvimTreeWinSeparator = { fg = util.darken(c.border, 0.3), bg = c.none },

    -- Dashboard
    DashboardShortCut = { fg = c.pine },
    DashboardHeader = { fg = c.pine },
    DashboardCenter = { fg = c.iris },
    DashboardFooter = { fg = c.love },
    DashboardKey = { fg = c.rose },
    DashboardDesc = { fg = c.fg },
    DashboardIcon = { fg = c.iris, bold = true },

    -- Lazy
    LazyProgressDone = { bold = true, fg = c.iris },
    LazyProgressTodo = { bold = true, fg = c.dark },
    TreesitterContext = { bg = c.black },
  }

  ---@type table<string, table>
  theme.defer = {}

  if options.hide_inactive_statusline then
    local inactive = { underline = true, bg = c.none, fg = c.bg, sp = c.border }

    -- StatusLineNC
    theme.highlights.StatusLineNC = inactive

    -- LuaLine
    for _, section in ipairs({ "a", "b", "c" }) do
      theme.defer["lualine_" .. section .. "_inactive"] = inactive
    end

    -- mini.statusline
    theme.highlights.MiniStatuslineInactive = inactive
  end

  options.on_highlights(theme.highlights, theme.colors)

	local transparency_highlights = {
		DiagnosticVirtualTextError = { fg = c.error },
		DiagnosticVirtualTextHint = { fg = c.hint },
		DiagnosticVirtualTextInfo = { fg = c.info },
		DiagnosticVirtualTextWarn = { fg = c.warning },

		FloatBorder = { fg = c.border, bg = c.none },
		Folded = { fg = c.fg, bg = c.none },
		NormalFloat = { bg = c.none },
		Normal = { fg = c.fg, bg = c.none },
		NormalNC = { fg = c.fg, bg = c.none },
		Pmenu = { fg = c.border, bg = c.none },
		PmenuKind = { fg = c.foam, bg = c.none },
		SignColumn = { fg = c.fg, bg = c.none },
		StatusLine = { fg = c.fg, bg = c.none },
		StatusLineNC = { fg = util.darken(c.fg, 0.7), bg = c.none },
		TabLineFill = { bg = c.none },
		TabLineSel = { fg = c.fg, bg = c.none, bold = styles.bold },

		-- ["@markup.raw"] = { bg = "none" },
		["@markup.raw.markdown_inline"] = { fg = c.gold },
		-- ["@markup.raw.block"] = { bg = "none" },

    TelescopeBorder = { fg = c.border, bg = c.none },
		TelescopeNormal = { fg = c.fg, bg = c.none },
		TelescopePromptNormal = { fg = c.fg, bg = c.none },
		TelescopeSelectionCaret = { fg = c.rose },

		WhichKeyFloat = { bg = c.none },

		IblIndent = { fg = c.overlay, bg = c.none },
		IblScope = { fg = c.foam, bg = c.none },
		IblWhitespace = { fg = c.overlay, bg = c.none },

		MiniClueTitle = { bg = c.none, bold = true },

		MiniPickBorderText = { bg = c.none },
		MiniPickPrompt = { bg = c.none, bold = true },
	}

	if options.transparent and options.style == "default" then
		for group, highlight in pairs(transparency_highlights) do
		  theme.highlights[group] = highlight
		end
	end

  return theme
end

return M
