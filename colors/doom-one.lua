-- ~/.config/nvim/colors/doom_one.lua
-- Doom One (Neovim port) — dark theme inspired by Atom One Dark

-- Clear & register
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.g.colors_name = "doom-one"

-- ---- Options (mirror Doom’s toggles)
local brighter_modeline  = vim.g.doom_one_brighter_modeline  or false
local brighter_comments  = vim.g.doom_one_brighter_comments  or false
local comment_bg         = vim.g.doom_one_comment_bg         or brighter_comments
local padded_statusline  = vim.g.doom_one_padded_statusline  or 0  -- integer pixels, cosmetic

-- ---- Helpers
local function clamp(n) return math.min(255, math.max(0, n)) end
local function hex_to_rgb(h)
  h = h:gsub("#","")
  return tonumber(h:sub(1,2),16), tonumber(h:sub(3,4),16), tonumber(h:sub(5,6),16)
end
local function rgb_to_hex(r,g,b)
  return string.format("#%02x%02x%02x", clamp(r), clamp(g), clamp(b))
end
local function blend(hex1, hex2, alpha) -- 0..1 of hex1 over hex2
  local r1,g1,b1 = hex_to_rgb(hex1)
  local r2,g2,b2 = hex_to_rgb(hex2)
  local r = r1*alpha + r2*(1-alpha)
  local g = g1*alpha + g2*(1-alpha)
  local b = b1*alpha + b2*(1-alpha)
  return rgb_to_hex(r,g,b)
end
local function darken(hex, k, base)  -- k in [0..1]
  base = base or "#000000"
  return blend(base, hex, 1-k)
end
local function lighten(hex, k, base) -- k in [0..1]
  base = base or "#ffffff"
  return blend(base, hex, 1-k)
end
local function hl(g, s) vim.api.nvim_set_hl(0, g, s) end

-- ---- Palette (from doom-one-theme.el)
local p = {
  bg         = "#282c34",
  fg         = "#bbc2cf",
  bg_alt     = "#21242b",
  fg_alt     = "#5B6268",

  base0      = "#1B2229", base1 = "#1c1f24", base2 = "#202328", base3 = "#23272e",
  base4      = "#3f444a", base5 = "#5B6268", base6 = "#73797e", base7 = "#9ca0a4", base8 = "#DFDFDF",

  grey       = "#3f444a",
  red        = "#ff6c6b",
  orange     = "#da8548",
  green      = "#98be65",
  teal       = "#4db5bd",
  yellow     = "#ECBE7B",
  blue       = "#51afef",
  dark_blue  = "#2257A0",
  magenta    = "#c678dd",
  violet     = "#a9a1e1",
  cyan       = "#46D9FF",
  dark_cyan  = "#5699AF",
}

-- Derived tones (selection/region, modeline, etc.)
local selection = p.dark_blue
local comments  = (brighter_comments and p.dark_cyan) or p.base5
local doc_comments = lighten(comments, 0.25, "#ffffff")

local modeline_bg = brighter_modeline and darken(p.blue, 0.45) or darken(p.bg_alt, 0.10)
local modeline_bg_alt = brighter_modeline and darken(p.blue, 0.475) or darken(p.bg_alt, 0.15)
local modeline_fg = p.fg
local modeline_fg_alt = p.base5
local modeline_bg_inactive     = p.bg_alt
local modeline_bg_inactive_alt = darken(p.bg_alt, 0.10)

-- ---- Core editor UI
hl("Normal",       { fg=p.fg,     bg=p.bg })
hl("NormalFloat",  { fg=p.fg,     bg=p.bg_alt })
hl("FloatBorder",  { fg=p.base4,  bg=p.bg_alt })
hl("SignColumn",   { fg=p.base5,  bg=p.bg })
hl("LineNr",       { fg=p.base4,  bg=p.bg })
hl("CursorLineNr", { fg=p.fg,     bg=p.bg, bold=true })
hl("CursorLine",   { bg=p.bg_alt })
hl("Visual",       { bg=selection })
hl("Search",       { fg=p.bg,     bg=p.yellow, bold=true })
hl("IncSearch",    { fg=p.bg,     bg=p.orange, bold=true })
hl("MatchParen",   { fg=p.orange, underline=true, bold=true })

hl("Pmenu",        { fg=p.fg,     bg=p.bg_alt })
hl("PmenuSel",     { fg=p.bg,     bg=p.blue, bold=true })
hl("PmenuSbar",    { bg=p.bg_alt })
hl("PmenuThumb",   { bg=p.base5 })

hl("StatusLine",   { fg=modeline_fg,     bg=modeline_bg })
hl("StatusLineNC", { fg=modeline_fg_alt, bg=modeline_bg_inactive })
hl("WinSeparator", { fg=darken(p.base1, 0.1), bg="NONE" })

-- Line numbers (doom overrides)
hl("lineNr", {}) -- noop, Vim uses "LineNr"
hl("LineNr", { fg=p.base4 })
-- Current line number emphasized already via CursorLineNr

-- ---- Syntax (legacy)
hl("Comment",      { fg=comments, italic=true, bg = (comment_bg and lighten(p.bg, 0.05)) or "NONE" })
hl("Constant",     { fg=p.violet })
hl("String",       { fg=p.green })
hl("Character",    { fg=p.green })
hl("Number",       { fg=p.orange })
hl("Boolean",      { fg=p.cyan })
hl("Identifier",   { fg=p.fg })
hl("Function",     { fg=p.magenta, bold=true })
hl("Statement",    { fg=p.blue })
hl("Conditional",  { fg=p.magenta })
hl("Repeat",       { fg=p.magenta })
hl("Operator",     { fg=p.blue })
hl("Keyword",      { fg=p.blue, italic=true })
hl("PreProc",      { fg=p.orange })
hl("Type",         { fg=p.yellow })
hl("Special",      { fg=p.orange })
hl("Delimiter",    { fg=p.base5 })
hl("Error",        { fg=p.bg, bg=p.red, bold=true })
hl("Todo",         { fg=p.bg, bg=p.yellow, bold=true })

-- ---- Diagnostics (LSP)
hl("DiagnosticError", { fg=p.red })
hl("DiagnosticWarn",  { fg=p.yellow })
hl("DiagnosticInfo",  { fg=p.blue })
hl("DiagnosticHint",  { fg=p.violet })
hl("DiagnosticUnderlineError", { undercurl=true, sp=p.red })
hl("DiagnosticUnderlineWarn",  { undercurl=true, sp=p.yellow })
hl("DiagnosticUnderlineInfo",  { undercurl=true, sp=p.blue })
hl("DiagnosticUnderlineHint",  { undercurl=true, sp=p.violet })

-- ---- Diffs / VCS
hl("DiffAdd",    { bg = blend(p.green, p.bg, 0.15) })
hl("DiffChange", { bg = blend(p.blue,  p.bg, 0.12) })
hl("DiffDelete", { bg = blend(p.red,   p.bg, 0.15) })
hl("DiffText",   { bg = blend(p.blue,  p.bg, 0.20) })

-- GitSigns (if installed)
hl("GitSignsAdd",    { fg=p.green })
hl("GitSignsChange", { fg=p.blue })
hl("GitSignsDelete", { fg=p.red })

-- ---- Treesitter: link to core groups
local links = {
  ["@comment"]            = "Comment",
  ["@string"]             = "String",
  ["@string.escape"]      = "Special",
  ["@character"]          = "Character",
  ["@number"]             = "Number",
  ["@boolean"]            = "Boolean",
  ["@constant"]           = "Constant",
  ["@constant.builtin"]   = "Constant",
  ["@variable"]           = "Identifier",
  ["@variable.builtin"]   = "Identifier",
  ["@function"]           = "Function",
  ["@function.builtin"]   = "Function",
  ["@method"]             = "Function",
  ["@keyword"]            = "Keyword",
  ["@keyword.function"]   = "Keyword",
  ["@operator"]           = "Operator",
  ["@type"]               = "Type",
  ["@field"]              = "Identifier",
  ["@property"]           = "Identifier",
  ["@punctuation"]        = "Delimiter",
}
for k,v in pairs(links) do hl(k, { link=v }) end

-- ---- Statusline padding (purely cosmetic; many statuslines ignore box)
if type(padded_statusline) == "number" and padded_statusline > 0 then
  hl("StatusLine",   { fg=modeline_fg,     bg=modeline_bg,     nocombine=true })
  hl("StatusLineNC", { fg=modeline_fg_alt, bg=modeline_bg_inactive, nocombine=true })
  -- (Neovim doesn't render :box like Emacs; padding requires a statusline plugin)
end

-- ---- Terminal ANSI (optional)
vim.g.terminal_color_0  = "#1e1e1e"
vim.g.terminal_color_1  = p.red
vim.g.terminal_color_2  = p.green
vim.g.terminal_color_3  = p.yellow
vim.g.terminal_color_4  = p.blue
vim.g.terminal_color_5  = p.magenta
vim.g.terminal_color_6  = p.cyan
vim.g.terminal_color_7  = p.fg
vim.g.terminal_color_8  = "#444444"
vim.g.terminal_color_9  = p.red
vim.g.terminal_color_10 = p.green
vim.g.terminal_color_11 = p.yellow
vim.g.terminal_color_12 = p.blue
vim.g.terminal_color_13 = p.magenta
vim.g.terminal_color_14 = p.cyan
vim.g.terminal_color_15 = p.fg
