# Minimal Neovim setup

Modular Neovim configuration for JavaScript, TypeScript/NestJS, HTML, CSS, and Java. Requires Neovim 0.11+ and Git. `ripgrep` is recommended for project search; Java support also needs a Java 21 runtime for current Eclipse JDT Language Server releases.

## Install

Back up an existing `~/.config/nvim` first. Then copy this folder into place:

```sh
mkdir -p ~/.config
cp -R nvim ~/.config/nvim
nvim
```

On first launch, lazy.nvim installs the plugins. Mason installs the configured TypeScript, HTML, CSS, and Java language servers. Open a Java project from its Maven or Gradle root. Install `ripgrep` with your system package manager for Telescope and project-wide search.

Neo-tree is the default directory explorer: launching `nvim <folder>` opens the tree in place of netrw's directory view.

Debugging uses Mason's JavaScript/Node adapter. Run `:MasonInstall js-debug-adapter` if it is not installed yet. LazyGit integration expects the `lazygit` command to be installed on your system.

## Tree

```text
nvim/
├── init.lua
├── README.md
└── lua/
    ├── config/
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins/
        ├── completion.lua
        ├── debug.lua
        ├── editor.lua
        └── lsp.lua
```

## Keys

Leader is Space.

Which-key displays available bindings in a popup as you press Space and continue typing. For example, after `Space f`, it shows the file search, project search, replacement, and format actions.

| Key | Action |
| --- | --- |
| `Space e` | Toggle folder tree |
| `Space g` | Open LazyGit |
| `Space ff` | Find files |
| `Space fg` | Search project text |
| `Space fr` | Search and replace across project |
| `Space da` | Toggle all diagnostics |
| `Space db` | Toggle diagnostics for current buffer |
| `Space dd` | Show diagnostic under cursor |
| `Space de` | Show errors |
| `Space dq` / `Space dl` | Quickfix / location list |
| `[d` / `]d` | Previous / next diagnostic |
| `Space bn` / `Space bp` | Next / previous buffer |
| `Space bd` | Close buffer |
| `Space r` | Rename symbol using LSP |
| `gd` / `K` | Go to definition / show documentation |
| `Space f` | Format current buffer when the language server supports it |
| `Ctrl-Space` | Open completion suggestions |
| `Tab` / `Shift-Tab` | Choose suggestion / move through snippets |
| `F5` / `F9` | Continue debugging / toggle breakpoint |
| `F10` / `F11` / `Shift-F11` | Step over / into / out |
| `Space du` | Toggle debugger panel |
| `Ctrl-v`, select lines, `I` or `A` | Edit multiple lines at once using Vim's built-in block selection |
| Visual mode: `Tab` / `Shift-Tab` | Indent / unindent selection; selection remains active |
| `:s/old/new/g` | Replace in current line; use `:%s/old/new/g` for the whole file |

Use `:Mason` to inspect or install servers, and `:checkhealth vim.lsp` to inspect language-server status. The Java server uses `nvim-jdtls` and starts when a Maven/Gradle project root is detected.
