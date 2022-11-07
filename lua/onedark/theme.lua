local util = require('onedark.util')
local colors = require('onedark.colors')

local M = {}

---@return Theme
function M.setup()
  local config = require('onedark.config')

  ---@class Theme
  local theme = {
    config = config.config,
    colors = colors.setup(config),
  }

  local c = theme.colors

  theme.highlights = { -- luacheck: ignore
    Comment = { fg = c.fg_gutter, style = config.commentStyle }, -- any comment
    ColorColumn = { bg = c.bg_visual }, -- used for the columns set with 'colorcolumn'
    Conceal = { fg = c.fg_gutter }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor = { fg = c.bg, bg = c.fg }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM = { fg = c.bg, bg = c.fg }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn = { bg = c.bg_highlight }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine = { bg = c.bg_highlight }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory = { fg = c.blue }, -- directory names (and other special names in listings)
    DiffAdd = { bg = c.diff.add }, -- diff mode: Added line |diff.txt|
    DiffChange = { bg = c.diff.change }, -- diff mode: Changed line |diff.txt|
    DiffDelete = { bg = c.diff.delete }, -- diff mode: Deleted line |diff.txt|
    DiffText = { bg = c.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer = { fg = config.hideNonText and c.bg or c.fg_dark }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor  = { }, -- cursor in a focused terminal
    -- TermCursorNC= { }, -- cursor in an unfocused terminal
    ErrorMsg = { fg = c.error }, -- error messages on the command line
    VertSplit = { fg = c.black }, -- the column separating vertically split windows
    Folded = { fg = c.blue, bg = c.black }, -- line used for closed folds
    FoldColumn = { bg = c.bg, fg = c.fg_gutter }, -- 'foldcolumn'
    SignColumn = { bg = config.transparent and c.none or c.bg, fg = c.fg_gutter }, -- column where |signs| are displayed
    SignColumnSB = { bg = c.bg_sidebar, fg = c.fg_gutter }, -- column where |signs| are displayed
    Substitute = { bg = c.red, fg = c.black }, -- |:substitute| replacement text highlighting
    LineNr = { fg = c.fg_gutter }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr = { fg = c.dark5 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen = { fg = c.blue, style = 'bold' }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg = { fg = c.fg_dark, style = 'bold' }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea = { fg = c.fg_dark }, -- Area for messages and cmdline
    -- MsgSeparator= { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg = { fg = c.blue }, -- |more-prompt|
    NonText = { fg = c.bg }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal = { fg = c.fg, bg = config.transparent and c.none or c.bg }, -- normal text
    NormalNC = { fg = c.fg, bg = config.transparent and c.none or c.bg }, -- normal text in non-current windows
    NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar }, -- normal text in non-current windows
    NormalFloat = { fg = c.fg, bg = c.bg_float }, -- Normal text in floating windows.
    FloatBorder = { fg = c.border_highlight },
    Pmenu = { bg = c.bg_popup, fg = c.fg }, -- Popup menu: normal item.
    PmenuSel = { bg = util.darken(c.fg_gutter, 0.8) }, -- Popup menu: selected item.
    PmenuSbar = { bg = util.lighten(c.bg_popup, 0.95) }, -- Popup menu: scrollbar.
    PmenuThumb = { bg = c.fg_gutter }, -- Popup menu: Thumb of the scrollbar.
    Question = { fg = c.blue }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine = { bg = c.bg_visual, style = 'bold' }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search = { bg = c.bg_search, fg = c.fg_search }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch = { bg = c.orange, fg = c.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    SpecialKey = { fg = c.fg_gutter }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad = { sp = c.error, style = 'undercurl' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap = { sp = c.warning, style = 'undercurl' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal = { sp = c.info, style = 'undercurl' }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare = { sp = c.hint, style = 'undercurl' }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine = { fg = c.fg_sidebar, bg = c.bg_statusline }, -- status line of current window
    StatusLineNC = { fg = c.fg_gutter, bg = c.bg_statusline }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine = { bg = c.bg_statusline, fg = c.fg_gutter }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.black }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.black, bg = c.blue }, -- tab pages line, active tab page label
    Title = { fg = c.blue, style = 'bold' }, -- titles for output from ":set all", ":autocmd" etc.
    Visual = { bg = c.bg_visual }, -- Visual mode selection
    VisualNOS = { bg = c.bg_visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg = { fg = c.warning }, -- warning messages
    Whitespace = { fg = c.fg_gutter }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu = { bg = c.bg_visual }, -- current match in 'wildmenu' completion
    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant = { fg = c.orange }, -- (preferred) any constant
    String = { fg = c.green }, --   a string constant: "this is a string"
    Character = { fg = c.green }, --  a character constant: 'c', '\n'
    -- Number        = { }, --   a number constant: 234, 0xff
    Boolean = { fg = c.orange }, --  a boolean constant: TRUE, false
    -- Float         = { }, --    a floating point constant: 2.3e10

    Identifier = { fg = c.red, style = config.variableStyle }, -- (preferred) any variable name
    Function = { fg = c.blue, style = config.functionStyle }, -- function name (also: methods for classes)
    Statement = { fg = c.purple }, -- (preferred) any statement
    -- Conditional   = { }, --  if, then, else, endif, switch, etc.
    -- Repeat        = { }, --   for, do, while, etc.
    -- Label         = { }, --    case, default, etc.
    Operator = { fg = c.red }, -- "sizeof", "+", "*", etc.
    Keyword = { fg = c.purple, style = config.keywordStyle }, --  any other keyword
    -- Exception     = { }, --  try, catch, throw

    PreProc = { fg = c.cyan }, -- (preferred) generic Preprocessor
    -- Include       = { }, --  preprocessor #include
    -- Define        = { }, --   preprocessor #define
    -- Macro         = { }, --    same as Define
    -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

    Type = { fg = c.yellow }, -- (preferred) int, long, char, etc.
    -- StorageClass  = { }, -- static, register, volatile, etc.
    -- Structure     = { }, --  struct, union, enum, etc.
    -- Typedef       = { }, --  A typedef

    Special = { fg = c.red }, -- (preferred) any special symbol
    -- SpecialChar   = { }, --  special character in a constant
    -- Tag           = { }, --    you can use CTRL-] on this
    -- Delimiter     = { }, --  character that needs attention
    -- SpecialComment= { }, -- special things inside a comment
    -- Debug         = { }, --    debugging statements

    Underlined = { style = 'underline' }, -- (preferred) text that stands out, HTML links
    Bold = { style = 'bold' },
    Italic = { style = 'italic' },
    -- ("Ignore", below, may be invisible...)
    -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error = { fg = c.error }, -- (preferred) any erroneous construct
    Todo = { bg = c.yellow, fg = c.bg }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    qfLineNr = { fg = c.dark5 },
    qfFileName = { fg = c.blue },
    htmlTag = { fg = c.purple, style = 'bold' },
    -- mkdHeading = { fg = c.orange, style = "bold" },
    -- mkdCode = { bg = c.bg2, fg = c.fg },
    mkdCodeDelimiter = { bg = c.bg2, fg = c.fg },
    mkdCodeStart = { fg = c.yellow, style = 'bold' },
    mkdCodeEnd = { fg = c.yellow, style = 'bold' },
    -- mkdLink = { fg = c.blue, style = "underline" },

    markdownHeadingDelimiter = { fg = c.orange, style = 'bold' },
    markdownCode = { fg = c.yellow },
    markdownCodeBlock = { fg = c.yellow },
    markdownH1 = { fg = c.red, style = 'bold' },
    markdownH2 = { fg = c.blue, style = 'bold' },
    markdownLinkText = { fg = c.blue, style = 'underline' },
    debugPC = { bg = c.bg_sidebar }, -- used for highlighting the current line in terminal-debug
    debugBreakpoint = { bg = util.darken(c.info, 0.1), fg = c.info }, -- used for breakpoint colors in terminal-debug
    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.
    LspReferenceText = { bg = c.fg_gutter }, -- used for highlighting "text" references
    LspReferenceRead = { bg = c.fg_gutter }, -- used for highlighting "read" references
    LspReferenceWrite = { bg = c.fg_gutter }, -- used for highlighting "write" references

    LspDiagnosticsDefaultError = { fg = c.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning = { fg = c.warning }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation = { fg = c.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint = { fg = c.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    LspDiagnosticsVirtualTextError = { bg = c.none, fg = c.diagnostics.error }, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning = { bg = c.none, fg = c.diagnostics.warning }, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation = { bg = c.none, fg = c.diagnostics.info }, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint = { bg = c.none, fg = c.diagnostics.hint }, -- Used for "Hint" diagnostic virtual text

    LspDiagnosticsUnderlineError = { style = 'undercurl', sp = c.diagnostics.error }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning = { style = 'undercurl', sp = c.diagnostics.warning }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation = { style = 'undercurl', sp = c.diagnostics.info }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint = { style = 'undercurl', sp = c.diagnostics.hint }, -- Used to underline "Hint" diagnostics

    -- neovim 0.6.0
    DiagnosticDefaultError = { fg = c.error }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticDefaultWarn = { fg = c.warning }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticDefaultInfo = { fg = c.info }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticDefaultHint = { fg = c.hint }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError = { bg = c.none, fg = c.diagnostics.error }, -- Used for "Error" diagnostic virtual text
    DiagnosticVirtualTextWarn = { bg = c.none, fg = c.diagnostics.warning }, -- Used for "Warning" diagnostic virtual text
    DiagnosticVirtualTextInfo = { bg = c.none, fg = c.diagnostics.info }, -- Used for "Information" diagnostic virtual text
    DiagnosticVirtualTextHint = { bg = c.none, fg = c.diagnostics.hint }, -- Used for "Hint" diagnostic virtual text
    DiagnosticUnderlineError = { style = 'undercurl', sp = c.diagnostics.error }, -- Used to underline "Error" diagnostics
    DiagnosticUnderlineWarn = { style = 'undercurl', sp = c.diagnostics.warning }, -- Used to underline "Warning" diagnostics
    DiagnosticUnderlineInfo = { style = 'undercurl', sp = c.diagnostics.info }, -- Used to underline "Information" diagnostics
    DiagnosticUnderlineHint = { style = 'undercurl', sp = c.diagnostics.hint }, -- Used to underline "Hint" diagnostics

    LspSignatureActiveParameter = { fg = c.orange },

    -- LspDiagnosticsFloatingError         = { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning       = { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation   = { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint          = { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError             = { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning           = { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation       = { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint              = { }, -- Used for "Hint" signs in sign column

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSAttribute         = { };    -- (unstable) TODO: docs
    -- TSBoolean          = { }; -- For booleans.
    -- TSCharacter         = { };    -- For characters.
    -- TSComment           = { };    -- For comment blocks.
    ['@text.note'] = { fg = c.bg, bg = c.info },
    ['@text.warning'] = { fg = c.bg, bg = c.warning },
    ['@text.danger'] = { fg = c.bg, bg = c.error },
    ['@text.constructor'] = { fg = c.yellow },
    -- TSConditional       = { };    -- For keywords related to conditionnals.
    ['@constant'] = { fg = c.yellow }, -- For constants
    ['@constant.builtin'] = { fg = c.orange }, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro        = { };    -- For constants that are defined by macros: `NULL` in C.
    -- TSError             = { };    -- For syntax/parser errors.
    -- TSException         = { };    -- For exception related keywords.
    ['@field'] = { fg = c.cyan }, -- For fields.
    -- TSFloat             = { };    -- For floats.
    -- TSFunction          = { };    -- For function (calls and definitions).
    -- TSFuncBuiltin       = { };    -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro         = { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    ['@include'] = { fg = c.purple }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    ['@keyword'] = { fg = c.purple, style = config.keywordStyle }, -- For keywords that don't fall in previous categories.
    ['@keyword.function'] = { fg = c.purple, style = config.functionStyle }, -- For keywords used to define a fuction.
    ['@label'] = { fg = c.blue }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSMethod            = { };    -- For method calls and definitions.
    ['@namespace'] = { fg = c.red }, -- For identifiers referring to modules and namespaces.
    -- TSNone              = { };    -- TODO: docs
    -- TSNumber            = { };    -- For all numbers
    ['@operator'] = { fg = c.fg }, -- For any operator: `+`, but also `->` and `*` in C.
    ['@parameter'] = { fg = c.red }, -- For parameters of a function.
    -- TSParameterReference= { };    -- For references to parameters of a function.
    ['@property'] = { fg = c.red }, -- Same as `TSField`.
    ['@punctuation.delimiter'] = { fg = c.fg }, -- For delimiters ie: `.`
    ['@punctuation.bracket'] = { fg = c.fg_dark }, -- For brackets and parens.
    ['@punctuation.special'] = { fg = c.fg }, -- For special punctutation that does not fall in the catagories before.
    -- TSRepeat            = { };    -- For keywords related to loops.
    -- TSString            = { };    -- For strings.
    ['@string.regex'] = { fg = c.orange }, -- For regexes.
    ['@string.escape'] = { fg = c.red }, -- For escape characters within a string.
    -- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
    -- TSType              = { };    -- For types.
    -- TSTypeBuiltin       = { };    -- For builtin types.
    ['@tag'] = { fg = c.red }, -- Tags like html tag names.
    ['@tag.delimiter'] = { fg = c.red }, -- Tag delimiter like `<` `>` `/`
    ['@tag.attribute'] = { fg = c.orange, style = config.keywordStyle },

    -- ['@type'] = { style = config.variableStyle, fg = c.purple },
    -- ['@type.definition'] = { style = config.variableStyle, fg = c.blue },

    ['@variable'] = { style = config.variableStyle, fg = c.yellow }, -- Any variable name that does not have another highlight.
    ['@variable.definition'] = { style = config.variableStyle, fg = c.yellow }, -- Any variable name that does not have another highlight.
    ['@variable.builtin'] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.

    ['@constructor'] = { fg = c.red },

    ['@text.reference'] = { fg = c.red }, -- FIXME
    -- TSText              = { };    -- For strings considered text in a markup language.
    -- TSEmphasis          = { };    -- For text to be represented with emphasis.
    -- TSUnderline         = { };    -- For text to be represented with an underline.
    -- TSStrike            = { };    -- For strikethrough text.
    -- TSTitle             = { };    -- Text that is part of a title.
    -- TSLiteral           = { };    -- Literal text.
    -- TSURI               = { };    -- Any URI like a link or email.

    -- Lua
    -- luaTSProperty = { fg = c.red }, -- Same as `TSField`.

    rainbowcol1 = { fg = c.red },
    rainbowcol2 = { fg = c.yellow },
    rainbowcol3 = { fg = c.green },
    rainbowcol4 = { fg = c.orange },
    rainbowcol5 = { fg = c.blue },
    rainbowcol6 = { fg = c.cyan },
    rainbowcol7 = { fg = c.purple },

    -- LspTrouble
    LspTroubleText = { fg = c.fg_dark },
    LspTroubleCount = { fg = c.purple, bg = c.fg_gutter },
    LspTroubleNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },

    -- Illuminate
    illuminatedWord = { bg = c.fg_gutter },
    illuminatedCurWord = { bg = c.fg_gutter },
    IlluminatedWordText = { bg = c.fg_gutter },
    IlluminatedWordRead = { bg = c.fg_gutter },
    IlluminatedWordWrite = { bg = c.fg_gutter },

    -- diff
    diffAdded = { fg = c.git.add },
    diffRemoved = { fg = c.git.delete },
    diffChanged = { fg = c.git.change },
    diffOldFile = { fg = c.yellow },
    diffNewFile = { fg = c.orange },
    diffFile = { fg = c.blue },
    diffLine = { fg = c.fg_gutter },
    diffIndexLine = { fg = c.purple },

    -- Neogit
    NeogitBranch = { fg = c.purple },
    NeogitRemote = { fg = c.purple },
    NeogitHunkHeader = { bg = c.bg_highlight, fg = c.fg },
    NeogitHunkHeaderHighlight = { bg = c.fg_gutter, fg = c.blue },
    NeogitDiffContextHighlight = { bg = util.darken(c.fg_gutter, 0.5), fg = c.fg_dark },
    NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = c.diff.delete },
    NeogitDiffAddHighlight = { fg = c.git.add, bg = c.diff.add },

    -- GitGutter
    GitGutterAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitGutterChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd = { fg = c.gitSigns.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.gitSigns.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.gitSigns.delete }, -- diff mode: Deleted line |diff.txt|
    GitSignsCurrentLineBlame = { fg = c.fg_gutter },

    -- NvimTree
    NvimTreeNormal = { fg = c.fg_light, bg = c.bg_sidebar },
    NvimTreeEndOfBuffer = config.darkSidebar and { fg = c.bg2 } or { fg = c.bg },
    NvimTreeRootFolder = { fg = c.fg_light, style = 'bold' },
    NvimTreeGitDirty = { fg = c.yellow2 },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeSpecialFile = { fg = c.yellow, style = 'underline' },
    NvimTreeIndentMarker = { fg = c.fg_gutter },
    NvimTreeImageFile = { fg = c.fg_sidebar },
    NvimTreeSymlink = { fg = c.purple },
    NvimTreeFolderName = { fg = c.fg_light },
    NvimTreeOpenedFolderName = { fg = c.fg_light, style = 'bold' },

    NeoTreeDirectoryIcon = { fg = c.blue },
    NeoTreeRootName = { fg = c.fg, bold = true },
    NeoTreeFileName = { fg = c.fg },
    NeoTreeFileIcon = { fg = c.fg },
    NeoTreeFileNameOpened = { fg = c.green },
    NeoTreeIndentMarker = { fg = c.blue },
    NeoTreeGitAdded = { fg = c.git.add },
    NeoTreeGitConflict = { fg = c.git.conflict },
    NeoTreeGitModified = { fg = c.git.change },
    NeoTreeGitUntracked = { fg = c.yellow },
    NeoTreeNormal = { fg = c.fg_light, bg = c.bg_sidebar },
    NeoTreeNormalNC = { fg = c.fg_light, bg = c.bg_sidebar },
    NeoTreeSymbolicLinkTarget = { fg = c.cyan },

    LspDiagnosticsError = { fg = c.error },
    LspDiagnosticsWarning = { fg = c.warning },
    LspDiagnosticsInformation = { fg = c.info },
    LspDiagnosticsHint = { fg = c.hint },

    -- Dashboard
    DashboardShortCut = { fg = c.purple },
    DashboardHeader = { fg = c.red },
    DashboardCenter = { fg = c.blue },
    DashboardFooter = { fg = c.yellow, style = 'italic' },

    -- WhichKey
    WhichKey = { fg = c.yellow },
    WhichKeyGroup = { fg = c.blue },
    WhichKeyDesc = { fg = c.red },
    WhichKeySeperator = { fg = c.fg_gutter },
    WhichKeySeparator = { fg = c.fg_gutter },
    WhichKeyFloat = { bg = c.bg_sidebar },
    WhichKeyValue = { fg = c.dark5 },

    -- LspSaga
    DiagnosticError = { fg = c.error },
    DiagnosticWarning = { fg = c.warning },
    DiagnosticInformation = { fg = c.info },
    DiagnosticHint = { fg = c.hint },

    -- NeoVim
    healthError = { fg = c.error },
    healthSuccess = { fg = c.green },
    healthWarning = { fg = c.warning },

    -- BufferLine
    BufferLineIndicatorSelected = { fg = c.git.change },
    BufferLineFill = { bg = c.black },

    -- Barbar
    BufferCurrent = { bg = c.fg_gutter, fg = c.fg },
    BufferCurrentIndex = { bg = c.fg_gutter, fg = c.info },
    BufferCurrentMod = { bg = c.fg_gutter, fg = c.warning },
    BufferCurrentSign = { bg = c.fg_gutter, fg = c.info },
    BufferCurrentTarget = { bg = c.fg_gutter, fg = c.red },
    BufferVisible = { bg = c.bg_statusline, fg = c.fg },
    BufferVisibleIndex = { bg = c.bg_statusline, fg = c.info },
    BufferVisibleMod = { bg = c.bg_statusline, fg = c.warning },
    BufferVisibleSign = { bg = c.bg_statusline, fg = c.info },
    BufferVisibleTarget = { bg = c.bg_statusline, fg = c.red },
    BufferInactive = { bg = c.bg_statusline, fg = c.dark5 },
    BufferInactiveIndex = { bg = c.bg_statusline, fg = c.dark5 },
    BufferInactiveMod = { bg = c.bg_statusline, fg = util.darken(c.warning, 0.7) },
    BufferInactiveSign = { bg = c.bg_statusline, fg = c.border_highlight },
    BufferInactiveTarget = { bg = c.bg_statusline, fg = c.red },
    BufferTabpages = { bg = c.bg_statusline, fg = c.none },
    BufferTabpage = { bg = c.bg_statusline, fg = c.border_highlight },

    -- ALE
    ALEWarningSign = { fg = c.yellow },
    ALEErrorSign = { fg = c.red },

    -- Hop
    HopNextKey = { fg = c.purple, style = 'bold' },
    HopNextKey1 = { fg = c.blue, style = 'bold' },
    HopNextKey2 = { fg = util.darken(c.blue, 0.3) },
    HopUnmatched = { fg = c.dark5 },

    LightspeedGreyWash = { fg = c.dark5 },

    -- NVIM CMP - VSCode like highlights
    CmpDocumentation = { fg = c.fg, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.border_highlight, bg = c.bg_float },

    CmpItemAbbr = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.blue, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.blue, bg = c.none },

    CmpItemMenu = { fg = c.comment, bg = c.none },

    CmpItemKindDefault = { fg = c.fg_dark, bg = c.none },

    CmpItemKindKeyword = { fg = c.cyan, bg = c.none },

    CmpItemKindVariable = { fg = c.purple, bg = c.none },
    CmpItemKindConstant = { fg = c.purple, bg = c.none },
    CmpItemKindReference = { fg = c.purple, bg = c.none },
    CmpItemKindValue = { fg = c.purple, bg = c.none },

    CmpItemKindFunction = { fg = c.blue, bg = c.none },
    CmpItemKindMethod = { fg = c.blue, bg = c.none },
    CmpItemKindConstructor = { fg = c.blue, bg = c.none },

    CmpItemKindClass = { fg = c.orange, bg = c.none },
    CmpItemKindInterface = { fg = c.orange, bg = c.none },
    CmpItemKindStruct = { fg = c.orange, bg = c.none },
    CmpItemKindEvent = { fg = c.orange, bg = c.none },
    CmpItemKindEnum = { fg = c.orange, bg = c.none },
    CmpItemKindUnit = { fg = c.orange, bg = c.none },

    CmpItemKindModule = { fg = c.yellow, bg = c.none },

    CmpItemKindProperty = { fg = c.green, bg = c.none },
    CmpItemKindField = { fg = c.green, bg = c.none },
    CmpItemKindTypeParameter = { fg = c.green, bg = c.none },
    CmpItemKindEnumMember = { fg = c.green, bg = c.none },
    CmpItemKindOperator = { fg = c.green, bg = c.none },
    CmpItemKindSnippet = { fg = c.dark5, bg = c.none },

    -- Notify
    --- Border
    NotifyERRORBorder = {
      fg = util.darken(c.error, 0.3),
      bg = config.transparent and c.none or c.bg,
    },
    NotifyWARNBorder = {
      fg = util.darken(c.warning, 0.3),
      bg = config.transparent and c.none or c.bg,
    },
    NotifyINFOBorder = {
      fg = util.darken(c.info, 0.3),
      bg = config.transparent and c.none or c.bg,
    },
    NotifyDEBUGBorder = {
      fg = util.darken(c.comment, 0.3),
      bg = config.transparent and c.none or c.bg,
    },
    NotifyTRACEBorder = {
      fg = util.darken(c.purple, 0.3),
      bg = config.transparent and c.none or c.bg,
    },
    --- Icons
    NotifyERRORIcon = { fg = c.error },
    NotifyWARNIcon = { fg = c.warning },
    NotifyINFOIcon = { fg = c.info },
    NotifyDEBUGIcon = { fg = c.comment },
    NotifyTRACEIcon = { fg = c.purple },
    --- Title
    NotifyERRORTitle = { fg = c.error },
    NotifyWARNTitle = { fg = c.warning },
    NotifyINFOTitle = { fg = c.info },
    NotifyDEBUGTitle = { fg = c.comment },
    NotifyTRACETitle = { fg = c.purple },
    --- Body
    NotifyERRORBody = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NotifyWARNBody = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NotifyINFOBody = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NotifyDEBUGBody = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    NotifyTRACEBody = { fg = c.fg, bg = config.transparent and c.none or c.bg },

    LspFloatWinNormal = { bg = c.bg_float },
    LspFloatWinBorder = { fg = c.border_highlight },
    LspSagaBorderTitle = { fg = c.cyan },
    LspSagaHoverBorder = { fg = c.blue },
    LspSagaRenameBorder = { fg = c.green },
    LspSagaDefPreviewBorder = { fg = c.green },
    LspSagaCodeActionBorder = { fg = c.blue },
    LspSagaFinderSelection = { fg = c.bg_visual },
    LspSagaCodeActionTitle = { fg = c.blue },
    LspSagaCodeActionContent = { fg = c.purple },
    LspSagaSignatureHelpBorder = { fg = c.red },
    ReferencesCount = { fg = c.purple },
    DefinitionCount = { fg = c.purple },
    DefinitionIcon = { fg = c.blue },
    ReferencesIcon = { fg = c.blue },
    TargetWord = { fg = c.cyan },

    AlphaShortcut = { fg = c.cyan },
    AlphaHeader = { fg = c.blue },
    AlphaHeaderLabel = { fg = c.orange },
    AlphaFooter = { fg = c.yellow, italic = true },
    AlphaButtons = { fg = c.purple },

    -- Scrollbar
    ScrollbarHandle = { fg = c.none, bg = c.bg_highlight },

    ScrollbarSearchHandle = { fg = c.orange, bg = c.bg_highlight },
    ScrollbarSearch = { fg = c.orange, bg = c.none },

    ScrollbarErrorHandle = { fg = c.error, bg = c.bg_highlight },
    ScrollbarError = { fg = c.error, bg = c.none },

    ScrollbarWarnHandle = { fg = c.warning, bg = c.bg_highlight },
    ScrollbarWarn = { fg = c.warning, bg = c.none },

    ScrollbarInfoHandle = { fg = c.info, bg = c.bg_highlight },
    ScrollbarInfo = { fg = c.info, bg = c.none },

    ScrollbarHintHandle = { fg = c.hint, bg = c.bg_highlight },
    ScrollbarHint = { fg = c.hint, bg = c.none },

    ScrollbarMiscHandle = { fg = c.purple, bg = c.bg_highlight },
    ScrollbarMisc = { fg = c.purple, bg = c.none },

    MiniCompletionActiveParameter = { underline = true },

    MiniCursorword = { bg = c.fg_gutter },
    MiniCursorwordCurrent = { bg = c.fg_gutter },

    MiniIndentscopeSymbol = { fg = c.blue },
    MiniIndentscopePrefix = { nocombine = true }, -- Make it invisible

    MiniJump = { bg = c.purple, fg = '#ffffff' },

    MiniJump2dSpot = { fg = c.purple, bold = true, nocombine = true },

    MiniStarterCurrent = { nocombine = true },
    MiniStarterFooter = { fg = c.yellow, italic = true },
    MiniStarterHeader = { fg = c.blue },
    MiniStarterInactive = { fg = c.comment, style = config.commentStyle },
    MiniStarterItem = { fg = c.fg, bg = config.transparent and c.none or c.bg },
    MiniStarterItemBullet = { fg = c.border_highlight },
    MiniStarterItemPrefix = { fg = c.warning },
    MiniStarterSection = { fg = c.blue },
    MiniStarterQuery = { fg = c.info },

    MiniStatuslineDevinfo = { fg = c.fg_dark, bg = c.bg_highlight },
    MiniStatuslineFileinfo = { fg = c.fg_dark, bg = c.bg_highlight },
    MiniStatuslineFilename = { fg = c.fg_dark, bg = c.fg_gutter },
    MiniStatuslineInactive = { fg = c.blue, bg = c.bg_statusline },
    MiniStatuslineModeCommand = { fg = c.black, bg = c.yellow, bold = true },
    MiniStatuslineModeInsert = { fg = c.black, bg = c.green, bold = true },
    MiniStatuslineModeNormal = { fg = c.black, bg = c.blue, bold = true },
    MiniStatuslineModeOther = { fg = c.black, bg = c.cyan, bold = true },
    MiniStatuslineModeReplace = { fg = c.black, bg = c.red, bold = true },
    MiniStatuslineModeVisual = { fg = c.black, bg = c.purple, bold = true },

    MiniSurround = { bg = c.orange, fg = c.black },

    MiniTablineCurrent = { fg = c.fg, bg = c.fg_gutter },
    MiniTablineFill = { bg = c.black },
    MiniTablineHidden = { fg = c.dark5, bg = c.bg_statusline },
    MiniTablineModifiedCurrent = { fg = c.warning, bg = c.fg_gutter },
    MiniTablineModifiedHidden = { bg = c.bg_statusline, fg = util.darken(c.warning, 0.7) },
    MiniTablineModifiedVisible = { fg = c.warning, bg = c.bg_statusline },
    MiniTablineTabpagesection = { bg = c.bg_statusline, fg = c.none },
    MiniTablineVisible = { fg = c.fg, bg = c.bg_statusline },

    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = c.red, bold = true },
    MiniTestPass = { fg = c.green, bold = true },

    MiniTrailspace = { bg = c.red },

    -- Noice

    NoiceCompletionItemKindDefault = { fg = c.fg_dark, bg = c.none },

    NoiceCompletionItemKindKeyword = { fg = c.cyan, bg = c.none },

    NoiceCompletionItemKindVariable = { fg = c.purple, bg = c.none },
    NoiceCompletionItemKindConstant = { fg = c.purple, bg = c.none },
    NoiceCompletionItemKindReference = { fg = c.purple, bg = c.none },
    NoiceCompletionItemKindValue = { fg = c.purple, bg = c.none },

    NoiceCompletionItemKindFunction = { fg = c.blue, bg = c.none },
    NoiceCompletionItemKindMethod = { fg = c.blue, bg = c.none },
    NoiceCompletionItemKindConstructor = { fg = c.blue, bg = c.none },

    NoiceCompletionItemKindClass = { fg = c.orange, bg = c.none },
    NoiceCompletionItemKindInterface = { fg = c.orange, bg = c.none },
    NoiceCompletionItemKindStruct = { fg = c.orange, bg = c.none },
    NoiceCompletionItemKindEvent = { fg = c.orange, bg = c.none },
    NoiceCompletionItemKindEnum = { fg = c.orange, bg = c.none },
    NoiceCompletionItemKindUnit = { fg = c.orange, bg = c.none },

    NoiceCompletionItemKindModule = { fg = c.yellow, bg = c.none },

    NoiceCompletionItemKindProperty = { fg = c.green, bg = c.none },
    NoiceCompletionItemKindField = { fg = c.green, bg = c.none },
    NoiceCompletionItemKindTypeParameter = { fg = c.green, bg = c.none },
    NoiceCompletionItemKindEnumMember = { fg = c.green, bg = c.none },
    NoiceCompletionItemKindOperator = { fg = c.green, bg = c.none },
    NoiceCompletionItemKindSnippet = { fg = c.dark5, bg = c.none },
  }

  if not vim.diagnostic then
    local severity_map = {
      Error = 'Error',
      Warn = 'Warning',
      Info = 'Information',
      Hint = 'Hint',
    }
    local types = { 'Default', 'VirtualText', 'Underline' }
    for _, type in ipairs(types) do
      for snew, sold in pairs(severity_map) do
        theme.highlights['LspDiagnostics' .. type .. sold] = {
          link = 'Diagnostic' .. (type == 'Default' and '' or type) .. snew,
        }
      end
    end
  end

  theme.defer = {}

  if config.hideInactiveStatusline then
    local inactive = { style = 'underline', bg = c.bg, fg = c.bg, sp = c.bg_visual }

    -- StatusLineNC
    theme.highlights.StatusLineNC = inactive

    -- LuaLine
    for _, section in ipairs({ 'a', 'b', 'c' }) do
      theme.defer['lualine_' .. section .. '_inactive'] = inactive
    end

    -- mini.statusline
    theme.highlights.MiniStatuslineInactive = inactive
  end

  if config.customTelescope then
    -- Telescope
    theme.highlights.TelescopeBorder = { fg = c.darker_black, bg = c.black }
    theme.highlights.TelescopePromptBorder = { fg = c.black2, bg = c.black2 }
    theme.highlights.TelescopePromptCounter = { fg = c.fg_dark, bg = c.black2 }
    theme.highlights.TelescopePromptNormal = { fg = c.fg, bg = c.black2 }
    theme.highlights.TelescopePromptPrefix = { fg = c.red, bg = c.black2 }
    theme.highlights.TelescopeNormal = { bg = c.black }
    theme.highlights.TelescopePreviewBorder = { fg = c.border, bg = c.black }
    theme.highlights.TelescopePreviewTitle = { fg = c.black, bg = c.green }
    theme.highlights.TelescopePromptTitle = { fg = c.black, bg = c.red }
    theme.highlights.TelescopeResultsBorder = { fg = c.black, bg = c.black }
    theme.highlights.TelescopeResultsTitle = { fg = c.black, bg = c.blue }
    theme.highlights.TelescopeSelection = { bg = c.darker_black }
  end

  return theme
end

return M
