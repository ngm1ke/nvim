# Minimal Neovim setup

Modular Neovim configuration for JavaScript, TypeScript/NestJS, HTML, CSS, and Java. Includes Tree-sitter syntax highlighting and the [Kanagawa](https://github.com/rebelot/kanagawa.nvim) dark colorscheme (Wave variant). Requires Neovim 0.11+, Git, a C compiler, and the Tree-sitter CLI (`brew install tree-sitter-cli` on macOS). `ripgrep` is recommended for project search; Java support also needs a Java 21 runtime for current Eclipse JDT Language Server releases.

## Install

Back up an existing `~/.config/nvim` first. Then copy this folder into place:

```sh
mkdir -p ~/.config
cp -R nvim ~/.config/nvim
nvim
```

On first launch, lazy.nvim installs the plugins and Tree-sitter installs parsers for the configured languages. Restart Neovim after the initial parser installation. Mason installs the configured TypeScript, HTML, CSS, and Java language servers. Open a Java project from its Maven or Gradle root. Install `ripgrep` with your system package manager for Telescope and project-wide search.

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
        ├── lsp.lua
        └── syntax.lua
```

## Keyboard shortcuts

The leader key is **Space**. Which-key shows available shortcuts after you press Space, including the `Space f` file search choices.

### Configured Normal-mode mappings

| Keys | Action |
| --- | --- |
| `Esc` | Clear search highlights |
| `Space w` | Save file |
| `Space q` | Quit Neovim |
| `Space x` / `Space bd` | Close current buffer |
| `Space e` | Toggle Neo-tree |
| `Space g` | Open LazyGit |
| `Space ff` | Find files with Telescope |
| `Space fg` | Search project text with Telescope |
| `Space fb` | Find open buffers |
| `Space fr` | Search and replace across the project |
| `Space bn` / `Space bp` | Next / previous buffer |
| `Space da` | Show all available diagnostics |
| `Space db` | Show diagnostics for current buffer |
| `Space dd` | Show diagnostic under cursor |
| `Space de` | Show errors |
| `Space dq` / `Space dl` | Show quickfix / location list |
| `[d` / `]d` | Previous / next diagnostic |
| `Space r` | Rename symbol with LSP |
| `gd` | Go to definition |
| `K` | Show symbol documentation |
| `Space ca` | Open code action menu: format buffer or choose an LSP code action |
| `F5` | Start or continue debugging |
| `F9` | Toggle breakpoint |
| `F10` / `F11` / `Shift-F11` | Step over / into / out while debugging |
| `Space du` | Toggle debugger panel |

### Configured Visual-mode mappings

| Keys | Action |
| --- | --- |
| `Tab` | Indent selection and keep it selected |
| `Shift-Tab` | Unindent selection and keep it selected |

### Configured Insert-mode completion mappings

| Keys | Action |
| --- | --- |
| `Ctrl-Space` | Open completion suggestions |
| `Tab` | Select next suggestion, or expand/jump to next snippet field; otherwise insert a tab |
| `Shift-Tab` | Select previous suggestion or jump to previous snippet field |
| `Enter` | Accept selected suggestion |
| `Ctrl-e` | Close completion menu |

Auto-pairs inserts matching closing brackets and quotes as you type; it does not add a separate shortcut.

### Neovim built-in shortcuts

These are common defaults and are not custom mappings. Neovim has many more built-in commands; `:help index` lists the full reference.

| Keys | Action |
| --- | --- |
| `h` / `j` / `k` / `l` | Move left / down / up / right |
| `w` / `b` / `e` | Move by word: next / previous / end |
| `0` / `^` / `$` | Line start / first nonblank / line end |
| `gg` / `G` | File start / file end |
| `Ctrl-d` / `Ctrl-u` | Scroll down / up half a screen |
| `%` | Jump between matching brackets |
| `i` / `a` / `I` / `A` | Insert before / after cursor / line start / line end |
| `o` / `O` | Open a line below / above |
| `x` / `dd` / `dw` | Delete character / line / word |
| `yy` / `yw` / `p` / `P` | Copy line / word / paste after / before |
| `u` / `Ctrl-r` | Undo / redo |
| `.` | Repeat last change |
| `/text` / `?text` | Search forward / backward |
| `n` / `N` / `*` / `#` | Next / previous match / search word forward / backward |
| `v` / `V` / `Ctrl-v` | Character / line / block Visual selection |
| `>` / `<` | Indent / unindent Visual selection |
| `Ctrl-w v` / `Ctrl-w s` | Split window vertically / horizontally |
| `Ctrl-w h/j/k/l` | Move to left / lower / upper / right window |
| `:w`, `:q`, `:wq`, `:q!` | Save / quit / save and quit / quit without saving |
| `:s/old/new/g` / `:%s/old/new/g` | Replace in line / throughout current file |

### Plugin-local shortcuts

Inside Neo-tree, press `?` to see all file-browser actions. Insertion of brackets/quotes is automatic. The diagnostics and debugging commands are listed above. Use `:Mason` to inspect language servers, `:checkhealth vim.lsp` to inspect LSP status, and `:help index` for all built-in Neovim commands.

Java LSP uses `nvim-jdtls` and starts when a Maven/Gradle project root is detected.
