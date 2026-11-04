-- Ashfall — a truecolor Neovim colorscheme matching the Ghostty theme.
-- Load with `:colorscheme ashfall`. For a transparent background (inherit
-- the terminal's), set `vim.g.ashfall_transparent = true` before loading.

vim.cmd 'highlight clear'
if vim.fn.exists 'syntax_on' == 1 then
  vim.cmd 'syntax reset'
end
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.g.colors_name = 'ashfall'

-- Palette (mirrors the Ghostty theme's base colors + ANSI 0-15).
local c = {
  bg = '#202125',
  fg = '#EAEBEE',
  black = '#414347',
  red = '#FF6B6B',
  green = '#8CE0A0',
  yellow = '#FFD479',
  blue = '#6FA8FF',
  magenta = '#C792EA',
  cyan = '#56C9D6',
  white = '#DEE0E3',
  br_black = '#8B8E94',
  br_red = '#FF8B8B',
  br_green = '#A6E8B4',
  br_yellow = '#FFE3A3',
  br_blue = '#9CC4FF',
  br_magenta = '#DDB0F6',
  br_cyan = '#8BE9F0',
  br_white = '#FFFFFF',
  -- Derived UI tones
  bg_float = '#1A1C1F',
  bg_alt = '#2B2D32',
  cursorline = '#2A2C30',
  gutter = '#54575E',
  comment = '#92959C',
  border = '#32353A',
  sel = '#33508A',
  visual = '#2C3A57',
  cursor = '#8FB6E8',
}

local transparent = vim.g.ashfall_transparent == true
local bg = transparent and 'NONE' or c.bg
local bg_gutter = transparent and 'NONE' or c.bg

local hl = {
  -- Editor UI
  Normal = { fg = c.fg, bg = bg },
  NormalNC = { fg = c.fg, bg = bg },
  NormalFloat = { fg = c.fg, bg = transparent and 'NONE' or c.bg_float },
  FloatBorder = { fg = c.border, bg = transparent and 'NONE' or c.bg_float },
  FloatTitle = { fg = c.blue, bold = true },
  ColorColumn = { bg = c.bg_alt },
  Cursor = { fg = c.bg, bg = c.cursor },
  CursorLine = { bg = transparent and 'NONE' or c.cursorline },
  CursorColumn = { bg = c.cursorline },
  CursorLineNr = { fg = c.br_blue, bold = true },
  LineNr = { fg = c.gutter, bg = bg_gutter },
  SignColumn = { bg = bg_gutter },
  FoldColumn = { fg = c.gutter, bg = bg_gutter },
  Folded = { fg = c.br_blue, bg = c.bg_alt },
  Visual = { bg = c.visual },
  VisualNOS = { bg = c.visual },
  Search = { fg = c.bg, bg = c.yellow },
  IncSearch = { fg = c.bg, bg = c.br_yellow },
  CurSearch = { fg = c.bg, bg = c.br_yellow },
  MatchParen = { fg = c.br_cyan, bold = true, underline = true },
  NonText = { fg = c.black },
  Whitespace = { fg = c.black },
  SpecialKey = { fg = c.black },
  EndOfBuffer = { fg = bg == 'NONE' and c.bg or bg },
  Directory = { fg = c.blue },
  Title = { fg = c.blue, bold = true },
  WinSeparator = { fg = c.border },
  VertSplit = { fg = c.border },

  -- Statusline / tabs / menus
  StatusLine = { fg = c.fg, bg = c.bg_alt },
  StatusLineNC = { fg = c.comment, bg = c.bg_float },
  TabLine = { fg = c.comment, bg = c.bg_float },
  TabLineSel = { fg = c.fg, bg = c.bg_alt },
  TabLineFill = { bg = c.bg_float },
  Pmenu = { fg = c.fg, bg = c.bg_float },
  PmenuSel = { fg = c.bg, bg = c.br_blue },
  PmenuSbar = { bg = c.bg_alt },
  PmenuThumb = { bg = c.gutter },
  WildMenu = { fg = c.bg, bg = c.br_blue },

  -- Messages
  ErrorMsg = { fg = c.red },
  WarningMsg = { fg = c.yellow },
  MoreMsg = { fg = c.green },
  ModeMsg = { fg = c.comment },
  Question = { fg = c.green },

  -- Syntax (legacy groups)
  Comment = { fg = c.comment, italic = true },
  Constant = { fg = c.yellow },
  String = { fg = c.green },
  Character = { fg = c.green },
  Number = { fg = c.yellow },
  Float = { fg = c.yellow },
  Boolean = { fg = c.br_yellow },
  Identifier = { fg = c.fg },
  Function = { fg = c.blue },
  Statement = { fg = c.magenta },
  Conditional = { fg = c.magenta },
  Repeat = { fg = c.magenta },
  Label = { fg = c.magenta },
  Operator = { fg = c.white },
  Keyword = { fg = c.magenta },
  Exception = { fg = c.magenta },
  PreProc = { fg = c.br_magenta },
  Include = { fg = c.br_magenta },
  Define = { fg = c.br_magenta },
  Macro = { fg = c.br_magenta },
  Type = { fg = c.cyan },
  StorageClass = { fg = c.cyan },
  Structure = { fg = c.cyan },
  Typedef = { fg = c.cyan },
  Special = { fg = c.br_blue },
  SpecialChar = { fg = c.br_blue },
  Delimiter = { fg = c.white },
  Tag = { fg = c.red },
  Underlined = { fg = c.blue, underline = true },
  Error = { fg = c.br_white, bg = c.red },
  Todo = { fg = c.bg, bg = c.yellow, bold = true },

  -- Diff
  DiffAdd = { fg = c.green, bg = '#1E2A24' },
  DiffChange = { fg = c.yellow, bg = '#262617' },
  DiffDelete = { fg = c.red, bg = '#2A1C1F' },
  DiffText = { fg = c.br_yellow, bg = '#3A3A20' },

  -- Diagnostics
  DiagnosticError = { fg = c.red },
  DiagnosticWarn = { fg = c.yellow },
  DiagnosticInfo = { fg = c.blue },
  DiagnosticHint = { fg = c.cyan },
  DiagnosticOk = { fg = c.green },
  DiagnosticUnderlineError = { undercurl = true, sp = c.red },
  DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
  DiagnosticUnderlineInfo = { undercurl = true, sp = c.blue },
  DiagnosticUnderlineHint = { undercurl = true, sp = c.cyan },

  -- Git signs
  GitSignsAdd = { fg = c.green },
  GitSignsChange = { fg = c.yellow },
  GitSignsDelete = { fg = c.red },

  -- Telescope
  TelescopeBorder = { fg = c.border, bg = transparent and 'NONE' or c.bg_float },
  TelescopeNormal = { fg = c.fg, bg = transparent and 'NONE' or c.bg_float },
  TelescopeSelection = { fg = c.fg, bg = c.bg_alt },
  TelescopeMatching = { fg = c.br_yellow, bold = true },
  TelescopePromptPrefix = { fg = c.blue },
}

-- Treesitter
local ts = {
  ['@variable'] = { fg = c.fg },
  ['@variable.builtin'] = { fg = c.red },
  ['@variable.parameter'] = { fg = c.fg },
  ['@variable.member'] = { fg = c.br_blue },
  ['@constant'] = { fg = c.yellow },
  ['@constant.builtin'] = { fg = c.yellow },
  ['@constant.macro'] = { fg = c.br_magenta },
  ['@module'] = { fg = c.cyan },
  ['@string'] = { fg = c.green },
  ['@string.escape'] = { fg = c.br_cyan },
  ['@string.special'] = { fg = c.br_blue },
  ['@character'] = { fg = c.green },
  ['@number'] = { fg = c.yellow },
  ['@boolean'] = { fg = c.br_yellow },
  ['@float'] = { fg = c.yellow },
  ['@function'] = { fg = c.blue },
  ['@function.builtin'] = { fg = c.br_blue },
  ['@function.call'] = { fg = c.blue },
  ['@function.macro'] = { fg = c.br_magenta },
  ['@constructor'] = { fg = c.cyan },
  ['@method'] = { fg = c.blue },
  ['@method.call'] = { fg = c.blue },
  ['@field'] = { fg = c.br_blue },
  ['@property'] = { fg = c.br_blue },
  ['@property.yaml'] = { fg = c.red },
  ['@parameter'] = { fg = c.fg },
  ['@keyword'] = { fg = c.magenta },
  ['@keyword.function'] = { fg = c.magenta },
  ['@keyword.return'] = { fg = c.magenta },
  ['@keyword.operator'] = { fg = c.magenta },
  ['@conditional'] = { fg = c.magenta },
  ['@repeat'] = { fg = c.magenta },
  ['@exception'] = { fg = c.magenta },
  ['@operator'] = { fg = c.white },
  ['@type'] = { fg = c.cyan },
  ['@type.builtin'] = { fg = c.br_cyan },
  ['@type.definition'] = { fg = c.cyan },
  ['@attribute'] = { fg = c.br_magenta },
  ['@comment'] = { fg = c.comment, italic = true },
  ['@punctuation.delimiter'] = { fg = c.white },
  ['@punctuation.bracket'] = { fg = c.white },
  ['@punctuation.special'] = { fg = c.br_blue },
  ['@tag'] = { fg = c.red },
  ['@tag.attribute'] = { fg = c.yellow },
  ['@tag.delimiter'] = { fg = c.white },
  ['@markup.heading'] = { fg = c.blue, bold = true },
  ['@markup.link'] = { fg = c.cyan, underline = true },
  ['@markup.raw'] = { fg = c.green },
  ['@markup.list'] = { fg = c.magenta },
  ['@diff.plus'] = { fg = c.green },
  ['@diff.minus'] = { fg = c.red },
}

local function apply(tbl)
  for group, opts in pairs(tbl) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

apply(hl)
apply(ts)
