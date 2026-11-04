# Ashfall

A deep-navy dark theme. Soft off-white text on a navy background
(`#1A1F2B`), with coral keys, lime values and orange numbers so YAML and config files scan easily.
Designed to be shared
between a terminal (Ghostty) and Neovim from a **single source of truth**.

![bg #1A1F2B · fg #E6EAF2](https://img.shields.io/badge/bg-%23202125-1A1F2B)
![fg #E6EAF2](https://img.shields.io/badge/fg-%23EAEBEE-E6EAF2)

## Ghostty

Copy the theme file into Ghostty's themes directory and reference it by name:

```sh
mkdir -p ~/.config/ghostty/themes
cp themes/ashfall ~/.config/ghostty/themes/ashfall
```

Then in `~/.config/ghostty/config`:

```
theme = ashfall
```

Reload Ghostty (`Cmd+Shift+,`) or restart it.

## Neovim

Two ways to use it — pick one.

### A. Truecolor colorscheme (recommended)

Install this repo as a plugin and load the colorscheme. You get the full palette in
truecolor, so Treesitter/LSP highlighting stays rich.

`lazy.nvim`:

```lua
{ 'AshminJayson/ashfall-theme', lazy = false, priority = 1000,
  config = function() vim.cmd.colorscheme 'ashfall' end }
```

`vim.pack` (Neovim 0.12+):

```lua
vim.pack.add { 'https://github.com/AshminJayson/ashfall-theme' }
vim.cmd.colorscheme 'ashfall'
```

For a transparent background (inherit the terminal's), set this before loading:

```lua
vim.g.ashfall_transparent = true
```

### B. Palette sync, no plugin

Since the theme is also defined by the terminal's 16-color palette, you can let Neovim
render straight from Ghostty instead of loading a colorscheme:

```lua
vim.opt.termguicolors = false
```

Neovim then inherits Ashfall's colors directly from Ghostty — one source of truth.
Tradeoff: 16-color syntax instead of truecolor (Treesitter detail flattens).

## VS Code

The `vscode/` directory is a complete color-theme extension (`package.json` +
`themes/ashfall-color-theme.json`) covering the editor UI, syntax tokens, and the
integrated terminal — the same palette as Ghostty and Neovim.

### A. Full color theme

Install it locally without publishing by symlinking it into your extensions directory, then
restart VS Code and pick **Ashfall** from `Ctrl/Cmd+K Ctrl/Cmd+T`:

```sh
ln -s "$PWD/vscode" ~/.vscode/extensions/ashfall-theme
```

To package or publish to the Marketplace instead:

```sh
cd vscode
npx @vscode/vsce package      # -> ashfall-theme-1.0.1.vsix
code --install-extension ashfall-theme-1.0.1.vsix
```

### B. Integrated terminal only

If you only want the 16-color palette in VS Code's terminal (no editor theming), drop this into
your `settings.json` — no extension needed:

```jsonc
"workbench.colorCustomizations": {
  "terminal.background": "#1A1F2B",
  "terminal.foreground": "#E6EAF2",
  "terminalCursor.foreground": "#8FB6E8",
  "terminal.selectionBackground": "#33508A",
  "terminal.ansiBlack": "#39414F",
  "terminal.ansiRed": "#FF7A7A",
  "terminal.ansiGreen": "#A6E36E",
  "terminal.ansiYellow": "#FFD479",
  "terminal.ansiBlue": "#7AB0FF",
  "terminal.ansiMagenta": "#D29BF5",
  "terminal.ansiCyan": "#56C9D6",
  "terminal.ansiWhite": "#D8DEE9",
  "terminal.ansiBrightBlack": "#7F8AA0",
  "terminal.ansiBrightRed": "#FF8B8B",
  "terminal.ansiBrightGreen": "#C0EE95",
  "terminal.ansiBrightYellow": "#FFE3A3",
  "terminal.ansiBrightBlue": "#9CC4FF",
  "terminal.ansiBrightMagenta": "#DDB0F6",
  "terminal.ansiBrightCyan": "#8BE9F0",
  "terminal.ansiBrightWhite": "#FFFFFF"
}
```

## Palette

| Role | Normal | Bright |
|------|--------|--------|
| black   | `#39414F` | `#7F8AA0` |
| red     | `#FF7A7A` | `#FF8B8B` |
| green   | `#A6E36E` | `#C0EE95` |
| yellow  | `#FFD479` | `#FFE3A3` |
| blue    | `#7AB0FF` | `#9CC4FF` |
| magenta | `#D29BF5` | `#DDB0F6` |
| cyan    | `#56C9D6` | `#8BE9F0` |
| white   | `#D8DEE9` | `#FFFFFF` |

Background `#1A1F2B` · Foreground `#E6EAF2` · Cursor `#8FB6E8` · Selection `#33508A`
