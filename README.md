# How to install

1. First, make a backup of your current configuration and delete your local `nvim` cache:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
rm -rf ~/.local/share/nvim
```

2. Install the pre-dependencies, like LSPs and node.js:

- [universal-ctags](https://github.com/universal-ctags/ctags):

```bash
sudo apt-get install universal-ctags
```
or:
```bash
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

- [nodejs](https://nodejs.org/en/download/):

```bash
curl -sL install-node.vercel.app/lts | bash
```

- [pyright](https://github.com/microsoft/pyright)

```bash
pip install pyright
```

- [ruff](https://docs.astral.sh/ruff/)

```bash
pip install ruff
```

- [LazyGit](https://github.com/jesseduffield/lazygit?#installation)

3. Install [NvChad](https://nvchad.com/docs/quickstart/install) dependencies, including the [Nerd fonts](https://www.nerdfonts.com/) to have all the unicode icons available.

4. Install the NvChad repo, into the `~/.config/nvim` directory:

```bash
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
```

5. Install this repo over the NvChad configuration

```bash
git clone git@github.com:msaelices/neovim-python.git ~/.config/nvim/lua/custom
```

6. Execute `nvim` and let [Lazy.vim](https://www.lazyvim.org/) and [Masoni.vim](https://github.com/williamboman/mason.nvim) to install all the plugins.

7. Press `Space t h` and install the theme of your preference.


## Plugin lists

### From NvChad

- Many beautiful themes, theme toggler by our [base46 plugin](https://github.com/NvChad/base46)
- Inbuilt terminal toggling & management with [Nvterm](https://github.com/NvChad/nvterm)
- Lightweight & performant ui plugin with [NvChad UI](https://github.com/NvChad/ui) It provides statusline modules, tabufline ( tabs + buffer manager) , beautiful cheatsheets, NvChad updater, hide & unhide terminal buffers, theme switcher and much more!
- File navigation with [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- Git diffs and more with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- NeoVim LSP configuration with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) and [mason.nvim](https://github.com/williamboman/mason.nvim)
- Autocompletion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- File searching, previewing image and text files and more with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
- Syntax highlighting with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Autoclosing braces and html tags with [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- Indentlines with [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- Useful snippets with [friendly snippets](https://github.com/rafamadriz/friendly-snippets) + [LuaSnip](https://github.com/L3MON4D3/LuaSnip).
- Popup mappings keysheet [whichkey.nvim](https://github.com/folke/which-key.nvim)
- Multi cursors with [vim-visual-multi](https://github.com/mg979/vim-visual-multi)

### Extra
- [REMOVED] Debugging Python scripts with [nvim-dap-python](https://github.com/mfussenegger/nvim-dap-python)
- Linting and formatting with [Ruff](https://github.com/astral-sh/ruff) and [Pyright](https://github.com/microsoft/pyright)

## Tips and tricks

This is a brain dump of the thinks I am learning while trying to master NeoVim and their plugins.

### Copy-paste Tips

`<Space> p`: Paste without loosing the clipboard you yanked

### Edit

`={motion}`: Indent the text specified by motion. For example, `=p` will indent the whole paragraph

### Finding and searching in your repo

`<Space> ff`: Find/open files based on its path
`<Space> fw`: Find/open files based on its content (grep)

### Find and replace with regex

`:%s/old/new/gc`: Replace all ocurrences of `old` with `new` in the whole file, asking for confirmation

We can use `\1`, `\2`, etc. to refer to the matched groups, so between `\(` and `\)`, in the `old` part of the command.

For example, if we have the following line:

`:%s/update_fields=\[\(.*\)]/update_fields=(\1,)`: Replace `update_fields=[...]` with `update_fields=(...,)` in the whole file

### Windows

`CTRL-w s`: Split the window in two
`CTRL-w v`: Split the window vertically
`CTRL-w q`: Quit the current window
`CTRL-w o`: Quit others windows
`CTRL-w h`: Move cursor to next window left to the current one
`CTRL-w l`: Move cursor to next window right the current one
`CTRL-w j`: Move cursor to next window below the current one
`CTRL-w k`: Move cursor to next window above the current one

See https://neovim.io/doc/user/windows.html

### Quick navigation

`<Space> <Left>`: Go to the previous buffer (tab)
`<Space> <Right>`: Go to the next buffer (tab)
`Ctrl+o`: Go to the previous location. If used in insert mode, it move to normal mode just for one command and return back to insert.

### LSP

`<Space> lf`: Display the diagnostic float window if the cursor is over one issue
`<Space> ln`: Go to the next diagnostic issue
`<Space> lp`: Go to the previous diagnostic issue
`<Space> ca`: Run code actions
`<Space> ra`: Rename the name over the cursor
`<Space> gd`: Go to definition
`<Space> q`: Diagnostic listing

### Code outline navigation

`<Space> a`: Open the aereal code outline window
`{`: Navigate to the previous symbol in the code outline
`}`: Navigate to the next symbol in the code outline

### Multi cursors

Basic usage:

- select words with `Ctrl-N` (like `Ctrl-d` in Sublime Text/VS Code)
- create cursors vertically with `Ctrl-Down` `Ctrl-Up`
- select one character at a time with `Shift-Arrows`
- press `n` `N` to get next/previous occurrence
- press `[` `]` to select next/previous cursor
- press `q` to skip current and get next occurrence
- press `Q` to remove current cursor/selection
- start insert mode with `i`,`a`,`I`,`A`

Two main modes:

- in _cursor mode_ commands work as they would in normal mode
- in _extend mode_ commands work as they would in visual mode
- press `Tab` to switch between «cursor» and «extend» mode

Most vim commands work as expected (motions, `r` to replace characters, `~` to change case, etc).

See https://github.com/mg979/vim-visual-multi
