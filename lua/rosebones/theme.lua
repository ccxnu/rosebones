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
  ---@class Theme
  ---@field highlights Highlights
  local theme = {
    config = options,
    colors = colors.setup(),
  }

  local c = theme.colors

  theme.highlights = {
    Comment = { fg = c.comment, style = options.styles.comments }, -- any comment
    ColorColumn = { bg = c.black }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.love }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.bg_highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.bg_highlight }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.foam }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = c.bg }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.border }, -- the column separating vertically split windows
    WinSeparator = { fg = c.border, bold = true }, -- the column separating vertically split windows
    Folded = { fg = c.foam, bg = c.dark }, -- line used for closed folds
    FoldColumn = { bg = options.transparent and c.none or c.bg, fg = c.comment }, -- 'foldcolumn'
    SignColumn = { bg = options.transparent and c.none or c.bg, fg = c.dark }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.bg_sidebar, fg = c.dark }, -- column where |signs| are displayed
    Substitute = { bg = c.amor, fg = c.black }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.dark }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.love }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.rose, bold = true }, -- The character under the cursor or just before it, if it is a paiamor bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.fg, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.fg }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.foam }, -- |more-prompt|
    NonText = { fg = c.dark }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = options.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = options.transparent and c.none or options.dim_inactive and c.bg_dark or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in sidebar
    NormalFloat = { fg = c.fg_float, bg = c.bg_float }, -- Normal text in floating windows.
    FloatBorder = { fg = c.border_highlight, bg = c.bg_float },
    FloatTitle = { fg = c.border_highlight, bg = c.bg_float },
    Pmenu = { bg = c.bg_popup, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = util.darken(c.dark, 0.8) }, -- Popup menu: selected item.
    PmenuSbar = { bg = util.lighten(c.bg_popup, 0.95) }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.dark }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.foam }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg_visual, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.bg_search, fg = c.fg }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.rose, fg = c.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    CurSearch = { link = "IncSearch" },
    SpecialKey = { fg = c.dark }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.error, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fg_sidebar, bg = c.bg_statusline }, -- status line of current window
    StatusLineNC = { fg = c.dark, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.bg_statusline, fg = c.dark }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.black, bg = c.foam }, -- tab pages line, active tab page label
    Title = { fg = c.foam, bold = true }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bg_visual }, -- Visual mode selection
    VisualNOS = { bg = c.bg_visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.warning }, -- warning messages
    Whitespace = { fg = c.dark }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.bg_visual }, -- current match in 'wildmenu' completion
    WinBar = { link = "StatusLine" }, -- window bar
    WinBarNC = { link = "StatusLineNC" }, -- window bar in inactive windows

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferamor" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.rose }, -- (preferamor) any constant
    String = { fg = c.love }, --   a string constant: "this is a string"
    Character = { fg = c.love }, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    -- Boolean       = { }, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = { fg = c.iris, style = options.styles.variables }, -- (preferamor) any variable name
    Function = { fg = c.foam, style = options.styles.functions }, -- function name (also: methods for classes)

    Statement = { fg = c.iris }, -- (preferamor) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = c.pine }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.pine, style = options.styles.keywords }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = c.pine }, -- (preferamor) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.foam }, -- (preferamor) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = { fg = c.foam }, -- (preferamor) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    Delimiter = { link = "Special" }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    Debug = { fg = c.rose }, --    debugging statements

    Underlined = { underline = true }, -- (preferamor) text that stands out, HTML links
    Bold = { bold = true },
    Italic = { italic = true },

    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferamor) left blank, hidden  |hl-Ignore|

    Error = { fg = c.error }, -- (preferamor) any erroneous construct
    Todo = { bg = c.gold, fg = c.bg }, -- (preferamor) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    qfLineNr = { fg = c.love },
    qfFileName = { fg = c.foam },

    htmlH1 = { fg = c.iris, bold = true },
    htmlH2 = { fg = c.foam, bold = true },

    -- mkdHeading = { fg = c.rose, bold = true },
    -- mkdCode = { bg = c.terminal_black, fg = c.fg },
    mkdCodeDelimiter = { bg = c.terminal_black, fg = c.fg },
    mkdCodeStart = { fg = c.pine, bold = true },
    mkdCodeEnd = { fg = c.pine, bold = true },
    -- mkdLink = { fg = c.foam, underline = true },

    markdownHeadingDelimiter = { fg = c.rose, bold = true },
    markdownCode = { fg = c.pine },
    markdownCodeBlock = { fg = c.pine },
    markdownH1 = { fg = c.iris, bold = true },
    markdownH2 = { fg = c.foam, bold = true },
    markdownLinkText = { fg = c.foam, underline = true },

    ["helpCommand"] = { bg = c.terminal_black, fg = c.foam },

    debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = util.darken(c.info, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug

    dosIniLabel = { link = "@property" },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.dark }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.dark }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.dark }, -- used for highlighting "write" references

    DiagnosticError = { fg = c.error }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticWarn = { fg = c.warning }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticInfo = { fg = c.info }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticHint = { fg = c.hint }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
    DiagnosticUnnecessary = { fg = c.terminal_black }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

    DiagnosticVirtualTextError = { bg = util.darken(c.error, 0.1), fg = c.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = util.darken(c.warning, 0.1), fg = c.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = util.darken(c.info, 0.1), fg = c.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = util.darken(c.hint, 0.1), fg = c.hint }, -- Used for "Hint" diagnostic virtual text

    DiagnosticUnderlineError = { undercurl = true, sp = c.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { undercurl = true, sp = c.hint }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { bg = util.darken(c.bg_visual, 0.4), bold = true },
    LspCodeLens = { fg = c.comment },
    LspInlayHint = { bg = util.darken(c.foam7, 0.1), fg = c.dark },

    LspInfoBorder = { fg = c.border_highlight, bg = c.bg_float },

    ALEErrorSign = { fg = c.error },
    ALEWarningSign = { fg = c.warning },

    DapStoppedLine = { bg = util.darken(c.warning, 0.1) }, -- Used for "Warning" diagnostic virtual text

    -- These groups are for the Neovim tree-sitter highlights.
    ["@annotation"] = { link = "PreProc" },
    ["@attribute"] = { link = "PreProc" },
    ["@boolean"] = { link = "Boolean" },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@comment"] = { link = "Comment" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Special" },
    ["@constant.macro"] = { link = "Define" },
    ["@keyword.debug"] = { link = "Debug" },
    ["@keyword.directive.define"] = { link = "Define" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@number.float"] = { link = "Float" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "Special" },
    ["@function.call"] = { link = "@function" },
    ["@function.macro"] = { link = "Macro" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.coroutine"] = { link = "@keyword" },
    ["@keyword.operator"] = { link = "@operator" },
    ["@keyword.return"] = { link = "@keyword" },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "@function.method" },
    ["@namespace.builtin"] = { link = "@variable.builtin" },
    ["@none"] = {},
    ["@number"] = { link = "Number" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.storage"] = { link = "StorageClass" },
    ["@string"] = { link = "String" },
    ["@markup.link.label"] = { link = "SpecialChar" },
    ["@markup.link.label.symbol"] = { link = "Identifier" },
    ["@tag"] = { link = "Label" },
    ["@tag.attribute"] = { link = "@property" },
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
    ["@type.qualifier"] = { link = "@keyword" },

    --- Misc
    -- TODO:
    -- ["@comment.documentation"] = { },
    ["@operator"] = { fg = c.pine }, -- For any operator: `+`, but also `->` and `*` in C.

    --- Punctuation
    ["@punctuation.delimiter"] = { fg = c.pine }, -- For delimiters ie: `.`
    ["@punctuation.bracket"] = { fg = c.fg }, -- For brackets and parens.
    ["@punctuation.special"] = { fg = c.pine }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@markup.list"] = { fg = c.pine }, -- For special punctutation that does not fall in the catagories before.
    ["@markup.list.markdown"] = { fg = c.rose, bold = true },

    --- Literals
    ["@string.documentation"] = { fg = c.gold },
    ["@string.regexp"] = { fg = c.foam }, -- For regexes.
    ["@string.escape"] = { fg = c.iris }, -- For escape characters within a string.

    --- Functions
    ["@constructor"] = { fg = c.iris }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@variable.parameter"] = { fg = c.gold }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = util.lighten(c.gold, 0.8) }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

    --- Keywords
    ["@keyword"] = { fg = c.iris, style = options.styles.keywords }, -- For keywords that don't fall in previous categories.
    ["@keyword.function"] = { fg = c.iris, style = options.styles.functions }, -- For keywords used to define a fuction.

    ["@label"] = { fg = c.foam }, -- For labels: `label:` in C and `:label:` in Lua.

    --- Types
    ["@type.builtin"] = { fg = util.darken(c.foam, 0.8) },
    ["@variable.member"] = { fg = c.love }, -- For fields.
    ["@property"] = { fg = c.love },

    --- Identifiers
    ["@variable"] = { fg = c.fg, style = options.styles.variables }, -- Any variable name that does not have another highlight.
    ["@variable.builtin"] = { fg = c.amor }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@module.builtin"] = { fg = c.amor }, -- Variable names that are defined by the languages, like `this` or `self`.

    --- Text
    -- ["@markup.raw.markdown"] = { fg = c.foam },
    ["@markup.raw.markdown_inline"] = { bg = c.terminal_black, fg = c.foam },
    ["@markup.link"] = { fg = c.pine },

    ["@markup.list.unchecked"] = { fg = c.foam }, -- For brackets and parens.
    ["@markup.list.checked"] = { fg = c.love }, -- For brackets and parens.

    ["@diff.plus"] = { link = "DiffAdd" },
    ["@diff.minus"] = { link = "DiffDelete" },
    ["@diff.delta"] = { link = "DiffChange" },

    ["@module"] = { link = "Include" },

    -- tsx
    ["@tag.tsx"] = { fg = c.amor },
    ["@constructor.tsx"] = { fg = c.foam },
    ["@tag.delimiter.tsx"] = { fg = util.darken(c.foam, 0.7) },

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

    -- ts-rainbow
    rainbowcol1 = { fg = c.amor },
    rainbowcol2 = { fg = c.gold },
    rainbowcol3 = { fg = c.love },
    rainbowcol4 = { fg = c.pine },
    rainbowcol5 = { fg = c.foam },
    rainbowcol6 = { fg = c.iris },
    rainbowcol7 = { fg = c.rose },

    -- ts-rainbow2 (maintained fork)
    TSRainbowRed = { fg = c.amor },
    TSRainbowOrange = { fg = c.rose },
    TSRainbowYellow = { fg = c.gold },
    TSRainbowGreen = { fg = c.love },
    TSRainbowBlue = { fg = c.foam },
    TSRainbowViolet = { fg = c.iris },
    TSRainbowCyan = { fg = c.pine },

    -- rainbow-delimiters
    RainbowDelimiterRed = { fg = c.amor },
    RainbowDelimiterOrange = { fg = c.rose },
    RainbowDelimiterYellow = { fg = c.gold },
    RainbowDelimiterGreen = { fg = c.love },
    RainbowDelimiterBlue = { fg = c.foam },
    RainbowDelimiterViolet = { fg = c.iris },
    RainbowDelimiterCyan = { fg = c.pine },

    -- LspTrouble
    TroubleText = { fg = c.fg },
    TroubleCount = { fg = c.iris, bg = c.dark },
    TroubleNormal = { fg = c.fg, bg = c.bg_sidebar },

    -- Illuminate
    illuminatedWord = { bg = c.dark },
    illuminatedCurWord = { bg = c.dark },
    IlluminatedWordText = { bg = c.dark },
    IlluminatedWordRead = { bg = c.dark },
    IlluminatedWordWrite = { bg = c.dark },

    -- diff
    diffAdded = { fg = c.git.add },
    diffRemoved = { fg = c.git.delete },
    diffChanged = { fg = c.git.change },
    diffOldFile = { fg = c.gold },
    diffNewFile = { fg = c.rose },
    diffFile = { fg = c.foam },
    diffLine = { fg = c.comment },
    diffIndexLine = { fg = c.iris },

    -- Neogit
    NeogitBranch = { fg = c.iris },
    NeogitRemote = { fg = c.iris },
    NeogitHunkHeader = { bg = c.bg_highlight, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.dark, fg = c.foam },
    NeogitDiffContextHighlight = { bg = util.darken(c.dark, 0.5), fg = c.fg },
    NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = c.diff.delete },
    NeogitDiffAddHighlight = { fg = c.git.add, bg = c.diff.add },

    -- Neotest
    NeotestPassed = { fg = c.love },
    NeotestRunning = { fg = c.gold },
    NeotestFailed = { fg = c.amor },
    NeotestSkipped = { fg = c.foam },
    NeotestTest = { fg = c.fg_sidebar },
    NeotestNamespace = { fg = c.love },
    NeotestFocused = { fg = c.gold },
    NeotestFile = { fg = c.pine },
    NeotestDir = { fg = c.foam },
    NeotestBorder = { fg = c.foam },
    NeotestIndent = { fg = c.fg_sidebar },
    NeotestExpandMarker = { fg = c.fg_sidebar },
    NeotestAdapterName = { fg = c.iris, bold = true },
    NeotestWinSelect = { fg = c.foam },
    NeotestMarked = { fg = c.foam },
    NeotestTarget = { fg = c.foam },
    --[[ NeotestUnknown = {}, ]]

    -- GitGutter
    GitGutterAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|
    GitGutterAddLineNr = { fg = c.gitSigns.add },
    GitGutterChangeLineNr = { fg = c.gitSigns.change },
    GitGutterDeleteLineNr = { fg = c.gitSigns.delete },

    -- GitSigns
    GitSignsAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeBorder = { fg = c.border_highlight, bg = c.bg_float },
    TelescopeNormal = { fg = c.fg, bg = c.bg_float },

    -- NvimTree
    NvimTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NvimTreeWinSeparator = {
      fg = options.styles.sidebars == "transparent" and c.border or c.bg_sidebar,
      bg = c.bg_sidebar,
    },
    NvimTreeNormalNC = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NvimTreeRootFolder = { fg = c.foam, bold = true },
    NvimTreeGitDirty = { fg = c.git.change },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeOpenedFile = { bg = c.bg_highlight },
    NvimTreeSpecialFile = { fg = c.iris, underline = true },
    NvimTreeIndentMarker = { fg = c.dark },
    NvimTreeImageFile = { fg = c.fg_sidebar },
    NvimTreeSymlink = { fg = c.foam },
    NvimTreeFolderIcon = { bg = c.none, fg = c.foam },
    -- NvimTreeFolderName= { fg = c.fg_float },

    NeoTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NeoTreeNormalNC = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NeoTreeDimText = { fg = c.dark },

    -- Fern
    FernBranchText = { fg = c.foam },

    -- glyph palette
    GlyphPalette1 = { fg = c.amor1 },
    GlyphPalette2 = { fg = c.love },
    GlyphPalette3 = { fg = c.gold },
    GlyphPalette4 = { fg = c.foam },
    GlyphPalette6 = { fg = c.love },
    GlyphPalette7 = { fg = c.fg },
    GlyphPalette9 = { fg = c.amor },

    -- Dashboard
    DashboardShortCut = { fg = c.pine },
    DashboardHeader = { fg = c.foam },
    DashboardCenter = { fg = c.iris },
    DashboardFooter = { fg = c.foam },
    DashboardKey = { fg = c.rose },
    DashboardDesc = { fg = c.pine },
    DashboardIcon = { fg = c.pine, bold = true },

    -- Alpha
    AlphaShortcut = { fg = c.rose },
    AlphaHeader = { fg = c.foam },
    AlphaHeaderLabel = { fg = c.rose },
    AlphaFooter = { fg = c.foam },
    AlphaButtons = { fg = c.pine },

    -- WhichKey
    WhichKey = { fg = c.pine },
    WhichKeyGroup = { fg = c.foam },
    WhichKeyDesc = { fg = c.iris },
    WhichKeySeperator = { fg = c.comment },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyFloat = { bg = c.bg_sidebar },
    WhichKeyValue = { fg = c.love },

    -- LspSaga
    DiagnosticWarning = { link = "DiagnosticWarn" },
    DiagnosticInformation = { link = "DiagnosticInfo" },

    LspFloatWinNormal = { bg = c.bg_float },
    LspFloatWinBorder = { fg = c.border_highlight },
    LspSagaBorderTitle = { fg = c.pine },
    LspSagaHoverBorder = { fg = c.foam },
    LspSagaRenameBorder = { fg = c.love },
    LspSagaDefPreviewBorder = { fg = c.love },
    LspSagaCodeActionBorder = { fg = c.foam },
    LspSagaFinderSelection = { fg = c.bg_visual },
    LspSagaCodeActionTitle = { fg = c.foam },
    LspSagaCodeActionContent = { fg = c.iris },
    LspSagaSignatureHelpBorder = { fg = c.amor },
    ReferencesCount = { fg = c.iris },
    DefinitionCount = { fg = c.iris },
    DefinitionIcon = { fg = c.foam },
    ReferencesIcon = { fg = c.foam },
    TargetWord = { fg = c.pine },

    -- NeoVim
    healthError = { fg = c.error },
    healthSuccess = { fg = c.love },
    healthWarning = { fg = c.warning },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = c.git.change },

    -- Barbar
    BufferCurrent = { bg = c.bg, fg = c.fg },
    BufferCurrentERROR = { bg = c.bg, fg = c.error },
    BufferCurrentHINT = { bg = c.bg, fg = c.hint },
    -- BufferCurrentIcon = { bg = c.bg, fg = c.},
    BufferCurrentINFO = { bg = c.bg, fg = c.info },
    BufferCurrentWARN = { bg = c.bg, fg = c.warning },
    BufferCurrentIndex = { bg = c.bg, fg = c.info },
    BufferCurrentMod = { bg = c.bg, fg = c.warning },
    BufferCurrentSign = { bg = c.bg, fg = c.bg },
    BufferCurrentTarget = { bg = c.bg, fg = c.amor },
    BufferAlternate = { bg = c.dark, fg = c.fg },
    BufferAlternateERROR = { bg = c.dark, fg = c.error },
    BufferAlternateHINT = { bg = c.dark, fg = c.hint },
    -- BufferAlternateIcon = { bg = c.dark, fg = c. },
    BufferAlternateIndex = { bg = c.dark, fg = c.info },
    BufferAlternateINFO = { bg = c.dark, fg = c.info },
    BufferAlternateMod = { bg = c.dark, fg = c.warning },
    BufferAlternateSign = { bg = c.dark, fg = c.info },
    BufferAlternateTarget = { bg = c.dark, fg = c.amor },
    BufferAlternateWARN = { bg = c.dark, fg = c.warning },
    BufferVisible = { bg = c.bg_statusline, fg = c.fg },
    BufferVisibleERROR = { bg = c.bg_statusline, fg = c.error },
    BufferVisibleHINT = { bg = c.bg_statusline, fg = c.hint },
    -- BufferVisibleIcon = { bg = c.bg_statusline, fg = c. },
    BufferVisibleINFO = { bg = c.bg_statusline, fg = c.info },
    BufferVisibleWARN = { bg = c.bg_statusline, fg = c.warning },
    BufferVisibleIndex = { bg = c.bg_statusline, fg = c.info },
    BufferVisibleMod = { bg = c.bg_statusline, fg = c.warning },
    BufferVisibleSign = { bg = c.bg_statusline, fg = c.info },
    BufferVisibleTarget = { bg = c.bg_statusline, fg = c.amor },
    BufferInactive = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.love, 0.8) },
    BufferInactiveERROR = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.error, 0.8) },
    BufferInactiveHINT = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.hint, 0.8) },
    -- BufferInactiveIcon = { bg = c.bg_statusline, fg = util.darken(c., 0.1) },
    BufferInactiveINFO = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.info, 0.8) },
    BufferInactiveWARN = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.warning, 0.8) },
    BufferInactiveIndex = { bg = util.darken(c.bg_highlight, 0.4), fg = c.love },
    BufferInactiveMod = { bg = util.darken(c.bg_highlight, 0.4), fg = util.darken(c.warning, 0.8) },
    BufferInactiveSign = { bg = util.darken(c.bg_highlight, 0.4), fg = c.bg },
    BufferInactiveTarget = { bg = util.darken(c.bg_highlight, 0.4), fg = c.amor },
    BufferOffset = { bg = c.bg_statusline, fg = c.love },
    BufferTabpageFill = { bg = util.darken(c.bg_highlight, 0.8), fg = c.love },
    BufferTabpages = { bg = c.bg_statusline, fg = c.none },

    -- Sneak
    Sneak = { fg = c.bg_highlight, bg = c.iris },
    SneakScope = { bg = c.bg_visual },

    -- Hop
    HopNextKey = { fg = c.iris, bold = true },
    HopNextKey1 = { fg = c.foam, bold = true },
    HopNextKey2 = { fg = util.darken(c.foam, 0.6) },
    HopUnmatched = { fg = c.dark },

    TSNodeKey = { fg = c.iris, bold = true },
    TSNodeUnmatched = { fg = c.dark },

    LeapMatch = { bg = c.iris, fg = c.fg, bold = true },
    LeapLabelPrimary = { fg = c.iris, bold = true },
    LeapLabelSecondary = { fg = c.love, bold = true },
    LeapBackdrop = { fg = c.dark },

    FlashBackdrop = { fg = c.dark },
    FlashLabel = { bg = c.iris, bold = true, fg = c.fg },

    LightspeedGreyWash = { fg = c.dark },
    -- LightspeedCursor = { link = "Cursor" },
    LightspeedLabel = { fg = c.iris, bold = true, underline = true },
    LightspeedLabelDistant = { fg = c.love, bold = true, underline = true },
    LightspeedLabelDistantOverlapped = { fg = c.love, underline = true },
    LightspeedLabelOverlapped = { fg = c.iris, underline = true },
    LightspeedMaskedChar = { fg = c.rose },
    LightspeedOneCharMatch = { bg = c.iris, fg = c.fg, bold = true },
    LightspeedPendingOpArea = { bg = c.iris, fg = c.fg },
    LightspeedShortcut = { bg = c.iris, fg = c.fg, bold = true, underline = true },
    -- LightspeedShortcutOverlapped = { link = "LightspeedShortcut" },
    -- LightspeedUniqueChar = { link = "LightspeedUnlabeledMatch" },
    LightspeedUnlabeledMatch = { fg = c.foam, bold = true },

    -- Cmp
    CmpDocumentation = { fg = c.fg, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.border_highlight, bg = c.bg_float },
    CmpGhostText = { fg = c.terminal_black },

    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.dark, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.foam, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.foam, bg = c.none },

    CmpItemMenu = { fg = c.comment, bg = c.none },

    CmpItemKindDefault = { fg = c.fg, bg = c.none },

    CmpItemKindCodeium = { fg = c.text, bg = c.none },
    CmpItemKindCopilot = { fg = c.text, bg = c.none },
    CmpItemKindTabNine = { fg = c.text, bg = c.none },

    -- headlines.nvim
    CodeBlock = { bg = c.bg_dark },

    -- navic
    NavicSeparator = { fg = c.fg, bg = c.none },
    NavicText = { fg = c.fg, bg = c.none },

    AerialNormal = { fg = c.fg, bg = c.none },
    AerialGuide = { fg = c.dark },
    AerialLine = { link = "LspInlayHint" },

    IndentBlanklineChar = { fg = c.dark, nocombine = true },
    IndentBlanklineContextChar = { fg = c.iris, nocombine = true },
    IblIndent = { fg = c.dark, nocombine = true },
    IblScope = { fg = c.iris, nocombine = true },

    -- Scrollbar
    ScrollbarHandle = { fg = c.none, bg = c.bg_highlight },

    ScrollbarSearchHandle = { fg = c.rose, bg = c.bg_highlight },
    ScrollbarSearch = { fg = c.rose, bg = c.none },

    ScrollbarErrorHandle = { fg = c.error, bg = c.bg_highlight },
    ScrollbarError = { fg = c.error, bg = c.none },

    ScrollbarWarnHandle = { fg = c.warning, bg = c.bg_highlight },
    ScrollbarWarn = { fg = c.warning, bg = c.none },

    ScrollbarInfoHandle = { fg = c.info, bg = c.bg_highlight },
    ScrollbarInfo = { fg = c.info, bg = c.none },

    ScrollbarHintHandle = { fg = c.hint, bg = c.bg_highlight },
    ScrollbarHint = { fg = c.hint, bg = c.none },

    ScrollbarMiscHandle = { fg = c.iris, bg = c.bg_highlight },
    ScrollbarMisc = { fg = c.iris, bg = c.none },

    -- Yanky
    YankyPut = { link = "IncSearch" },
    YankyYanked = { link = "IncSearch" },

    -- Lazy
    LazyProgressDone = { bold = true, fg = c.iris },
    LazyProgressTodo = { bold = true, fg = c.dark },

    -- Notify
    NotifyBackground = { fg = c.fg, bg = c.bg },
    --- Border
    NotifyERRORBorder = { fg = util.darken(c.error, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyWARNBorder = { fg = util.darken(c.warning, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyINFOBorder = { fg = util.darken(c.info, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyDEBUGBorder = { fg = util.darken(c.comment, 0.3), bg = options.transparent and c.none or c.bg },
    NotifyTRACEBorder = { fg = util.darken(c.iris, 0.3), bg = options.transparent and c.none or c.bg },
    --- Icons
    NotifyERRORIcon = { fg = c.error },
    NotifyWARNIcon = { fg = c.warning },
    NotifyINFOIcon = { fg = c.info },
    NotifyDEBUGIcon = { fg = c.comment },
    NotifyTRACEIcon = { fg = c.iris },
    --- Title
    NotifyERRORTitle = { fg = c.error },
    NotifyWARNTitle = { fg = c.warning },
    NotifyINFOTitle = { fg = c.info },
    NotifyDEBUGTitle = { fg = c.comment },
    NotifyTRACETitle = { fg = c.iris },
    --- Body
    NotifyERRORBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyWARNBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyINFOBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyDEBUGBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    NotifyTRACEBody = { fg = c.fg, bg = options.transparent and c.none or c.bg },

    -- Mini
    MiniCompletionActiveParameter = { underline = true },

    MiniCursorword = { bg = c.dark },
    MiniCursorwordCurrent = { bg = c.dark },

    MiniIndentscopeSymbol = { fg = c.foam, nocombine = true },
    MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

    MiniJump = { bg = c.iris, fg = "#ffffff" },

    MiniJump2dSpot = { fg = c.iris, bold = true, nocombine = true },

    MiniStarterCurrent = { nocombine = true },
    MiniStarterFooter = { fg = c.gold, italic = true },
    MiniStarterHeader = { fg = c.foam },
    MiniStarterInactive = { fg = c.comment, style = options.styles.comments },
    MiniStarterItem = { fg = c.fg, bg = options.transparent and c.none or c.bg },
    MiniStarterItemBullet = { fg = c.border_highlight },
    MiniStarterItemPrefix = { fg = c.warning },
    MiniStarterSection = { fg = c.foam },
    MiniStarterQuery = { fg = c.info },

    MiniStatuslineDevinfo = { fg = c.fg, bg = c.bg_highlight },
    MiniStatuslineFileinfo = { fg = c.fg, bg = c.bg_highlight },
    MiniStatuslineFilename = { fg = c.fg, bg = c.dark },
    MiniStatuslineInactive = { fg = c.foam, bg = c.bg_statusline },
    MiniStatuslineModeCommand = { fg = c.black, bg = c.gold, bold = true },
    MiniStatuslineModeInsert = { fg = c.black, bg = c.love, bold = true },
    MiniStatuslineModeNormal = { fg = c.black, bg = c.foam, bold = true },
    MiniStatuslineModeOther = { fg = c.black, bg = c.pine, bold = true },
    MiniStatuslineModeReplace = { fg = c.black, bg = c.amor, bold = true },
    MiniStatuslineModeVisual = { fg = c.black, bg = c.iris, bold = true },

    MiniSurround = { bg = c.rose, fg = c.black },

    MiniTablineCurrent = { fg = c.fg, bg = c.dark },
    MiniTablineFill = { bg = c.black },
    MiniTablineHidden = { fg = c.love, bg = c.bg_statusline },
    MiniTablineModifiedCurrent = { fg = c.warning, bg = c.dark },
    MiniTablineModifiedHidden = { bg = c.bg_statusline, fg = util.darken(c.warning, 0.7) },
    MiniTablineModifiedVisible = { fg = c.warning, bg = c.bg_statusline },
    MiniTablineTabpagesection = { bg = c.bg_statusline, fg = c.none },
    MiniTablineVisible = { fg = c.fg, bg = c.bg_statusline },

    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = c.amor, bold = true },
    MiniTestPass = { fg = c.love, bold = true },

    MiniTrailspace = { bg = c.amor },

    -- Noice

    NoiceCompletionItemKindDefault = { fg = c.fg, bg = c.none },

    TreesitterContext = { bg = util.darken(c.dark, 0.8) },
    Hlargs = { fg = c.gold },
    -- TreesitterContext = { bg = util.darken(c.bg_visual, 0.4) },
  }

  -- lsp symbol kind and completion kind highlights
  local kinds = {
    Array = "@punctuation.bracket",
    Boolean = "@boolean",
    Class = "@type",
    Color = "Special",
    Constant = "@constant",
    Constructor = "@constructor",
    Enum = "@lsp.type.enum",
    EnumMember = "@lsp.type.enumMember",
    Event = "Special",
    Field = "@variable.member",
    File = "Normal",
    Folder = "Directory",
    Function = "@function",
    Interface = "@lsp.type.interface",
    Key = "@variable.member",
    Keyword = "@lsp.type.keyword",
    Method = "@function.method",
    Module = "@module",
    Namespace = "@module",
    Null = "@constant.builtin",
    Number = "@number",
    Object = "@constant",
    Operator = "@operator",
    Package = "@module",
    Property = "@property",
    Reference = "@markup.link",
    Snippet = "Conceal",
    String = "@string",
    Struct = "@lsp.type.struct",
    Unit = "@lsp.type.struct",
    Text = "@markup",
    TypeParameter = "@lsp.type.typeParameter",
    Variable = "@variable",
    Value = "@string",
  }

  local kind_groups = { "NavicIcons%s", "Aerial%sIcon", "CmpItemKind%s", "NoiceCompletionItemKind%s" }
  for kind, link in pairs(kinds) do
    local base = "LspKind" .. kind
    theme.highlights[base] = { link = link }
    for _, plugin in pairs(kind_groups) do
      theme.highlights[plugin:format(kind)] = { link = base }
    end
  end

  local markdown_rainbow = { c.foam, c.gold, c.love, c.pine, c.iris, c.amor }

  for i, color in ipairs(markdown_rainbow) do
    theme.highlights["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
    theme.highlights["Headline" .. i] = { bg = util.darken(color, 0.05) }
  end
  theme.highlights["Headline"] = { link = "Headline1" }

  if not vim.diagnostic then
    local severity_map = {
      Error = "Error",
      Warn = "Warning",
      Info = "Information",
      Hint = "Hint",
    }
    local types = { "Default", "VirtualText", "Underline" }
    for _, type in ipairs(types) do
      for snew, sold in pairs(severity_map) do
        theme.highlights["LspDiagnostics" .. type .. sold] = {
          link = "Diagnostic" .. (type == "Default" and "" or type) .. snew,
        }
      end
    end
  end

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

  if config.is_day() then
    util.invert_colors(theme.colors)
    util.invert_highlights(theme.highlights)
  end

  return theme
end

return M
