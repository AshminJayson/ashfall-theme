# Ashfall

A neutral ash-grey dark theme. Soft off-white text on a near-neutral grey background
(`#202125`), with warm coral keys and green values so YAML and config files scan easily.
Designed to be shared
between a terminal (Ghostty) and Neovim from a **single source of truth**.

![bg #202125 · fg #EAEBEE](https://img.shields.io/badge/bg-%23202125-202125)
![fg #EAEBEE](https://img.shields.io/badge/fg-%23EAEBEE-EAEBEE)

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
  "terminal.background": "#202125",
  "terminal.foreground": "#EAEBEE",
  "terminalCursor.foreground": "#8FB6E8",
  "terminal.selectionBackground": "#33508A",
  "terminal.ansiBlack": "#414347",
  "terminal.ansiRed": "#FF6B6B",
  "terminal.ansiGreen": "#8CE0A0",
  "terminal.ansiYellow": "#FFD479",
  "terminal.ansiBlue": "#6FA8FF",
  "terminal.ansiMagenta": "#C792EA",
  "terminal.ansiCyan": "#56C9D6",
  "terminal.ansiWhite": "#DEE0E3",
  "terminal.ansiBrightBlack": "#8B8E94",
  "terminal.ansiBrightRed": "#FF8B8B",
  "terminal.ansiBrightGreen": "#A6E8B4",
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
| black   | `#414347` | `#8B8E94` |
| red     | `#FF6B6B` | `#FF8B8B` |
| green   | `#8CE0A0` | `#A6E8B4` |
| yellow  | `#FFD479` | `#FFE3A3` |
| blue    | `#6FA8FF` | `#9CC4FF` |
| magenta | `#C792EA` | `#DDB0F6` |
| cyan    | `#56C9D6` | `#8BE9F0` |
| white   | `#DEE0E3` | `#FFFFFF` |

Background `#202125` · Foreground `#EAEBEE` · Cursor `#8FB6E8` · Selection `#33508A`
