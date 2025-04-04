# How to install

1. First, make a backup of your current configuration and delete your local `nvim` cache:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
rm -rf ~/.local/share/nvim
```

2. Install the pre-dependencies, like LSPs and node.js (>= 22.0):

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

- [xclip](https://manpages.ubuntu.com/manpages/xenial/man1/xclip.1.html) for allowing to copy-paste from the system clipboard

```bash
sudo apt-get install xclip
```

- [lookatme](https://github.com/d0c-s4vage/lookatme) for markdown preview as slides

```bash
pip install lookatme
```
or:
```bash
sudo apt-get install lookatme
```

- [Vue Language Server](https://github.com/vuejs/vetur/tree/master/server)

```bash
npm install -g vls
```

- [MCP Hub](https://github.com/ravitemer/mcphub.nvim) for multi-LLM integration

```bash
npm install -g mcp-hub
```

3. Install [NvChad](https://nvchad.com/docs/quickstart/install) dependencies, including the [Nerd fonts](https://www.nerdfonts.com/) to have all the unicode icons available.

4. Install this repo over the NvChad configuration

```bash
git clone git@github.com:msaelices/nvim-config.git ~/.config/nvim
```

5. Execute `nvim` and let [Lazy.vim](https://www.lazyvim.org/) and [Mason.nvim](https://github.com/williamboman/mason.nvim) to install all the plugins.

6. Press `Space t t` and install the theme of your preference.


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

- Linting and formatting with [Ruff](https://github.com/astral-sh/ruff) and [Pyright](https://github.com/microsoft/pyright)
- Code formatting with [conform.nvim](https://github.com/stevearc/conform.nvim)
- Quick navigation between starred files with [Harpoon](https://github.com/ThePrimeagen/harpoon)
- AI integrations:
  - GitHub Copilot with [copilot.lua](https://github.com/zbirenbaum/copilot.lua)
  - Claude and other LLMs with [avante.nvim](https://github.com/yetone/avante.nvim)
  - Multi-LLM management with [mcphub.nvim](https://github.com/ravitemer/mcphub.nvim)
- Git management:
  - [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) for LazyGit integration
  - [neogit](https://github.com/NeogitOrg/neogit) for Git operations within Neovim
- Surround text objects with [nvim-surround](https://github.com/kylechui/nvim-surround)
- Markdown tools:
  - Preview with [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
  - Presentation slides with [Telegraph.nvim](https://github.com/waylonwalker/Telegraph.nvim)
- Code structure navigation with [aerial.nvim](https://github.com/stevearc/aerial.nvim)
- Enhanced matching with [vim-matchup](https://github.com/andymass/vim-matchup)
- Debugging with [nvim-dap](https://github.com/mfussenegger/nvim-dap) and [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- Mojo language support

## Tips and tricks

This is a brain dump of the thinks I am learning while trying to master NeoVim and their plugins.

### Copy-paste Tips

- `<Space> p`: Paste without loosing the clipboard you yanked

### Indentation

- `={motion}`: Indent the text specified by motion. For example, `=p` will indent the whole paragraph

### Finding and searching in your repo

- `<Space> fw`: Find/open files based on its content (grep)
- `:vimgrep {pattern} {files}` - Search for a pattern in multiple files and populate the quick fix list. (`:help :vimgrep`)

### Find and replace with regex

- `:%s/old/new/gc`: Replace all ocurrences of `old` with `new` in the whole file, asking for confirmation

We can use `\1`, `\2`, etc. to refer to the matched groups, so between `\(` and `\)`, in the `old` part of the command.

For example, if we have the following line:

`:%s/update_fields=\[\(.*\)]/update_fields=(\1,)`: Replace `update_fields=[...]` with `update_fields=(...,)` in the whole file

### Windows

- `CTRL-w s`: Split the window in two
- `CTRL-w v`: Split the window vertically
- `CTRL-w q`: Quit the current window
- `CTRL-w o`: Quit others windows
- `CTRL-w h`: Move cursor to next window left to the current one
- `CTRL-w l`: Move cursor to next window right the current one
- `CTRL-w j`: Move cursor to next window below the current one
- `CTRL-w k`: Move cursor to next window above the current one

See https://neovim.io/doc/user/windows.html

### Quick navigation

- `CTRL-p`: Open the Telescope file finder
- `<Space> <Left>`: Go to the previous buffer (tab)
- `<Space> <Right>`: Go to the next buffer (tab)
- `Ctrl+o`: Go to the previous location. If used in insert mode, it move to normal mode just for one command and return back to insert.

Harpoon:

- `<Space> 9`: Show the Harpoon panel
- `<Space> 0`: Add the current file to the Harpoon panel
- `<Space> 1`: Move to the previous file in Harpoon
- `<Space> 2`: Move to the next file in Harpoon

### LSP

- `<Space> lf`: Display the diagnostic float window if the cursor is over one issue
- `<Space> ln`: Go to the next diagnostic issue
- `<Space> lp`: Go to the previous diagnostic issue
- `<Space> ca`: Run code actions
- `<Space> ra`: Rename the name over the cursor
- `<Space> gd`: Go to definition
- `<Space> q`: Diagnostic listing


### Motions in the code text objects

Thanks to the `nvim-treesitter/nvim-treesitter-textobjects` plugin, we can empower the motions as nvim is able to understand the code.

- `va=`: Select outer part of an assignment
- `vi=`: Select inner part of an assignment
- `vil`: Select inner part of a loop
- `vaf`: Select outer part of a method/function definition
- `vif`: Select inner part of a method/function definition
- `vac`: Select outer part of a class
- `vic`: Select inner part of a class

Note: change the `v` command with `d`, `c` or `y` to delete, change or yank the text selected by the motion.

- `<leader>na`: swap parameters/argument with next
- `<leader>n:`: swap object property with next
- `<leader>nm`: swap function with next
- `<leader>pa`: swap parameters/argument with prev
- `<leader>p:`: swap object property with prev
- `<leader>pm`: swap function with previous
 
### Increment or decrement numbers

- `Ctrl-a`: Increment the number under the cursor
- `Ctrl-x`: Decrement the number under the cursor
- `V` + `Ctrl-a`: Increment all the numbers in the selection
- `V` + `Ctrl-x`: Decrement all the numbers in the selection
- `V` + `g` + `Ctrl-a`: Increment all the numbers in the selection, keeping the column alignment
- `V` + `g` + `Ctrl-x`: Decrement all the numbers in the selection, keeping the column alignment
- Also works with `Ctrl+V` to select a column

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

### AI Tools

#### Copilot

- `Alt+l`: Accept the suggestion
- `Alt+]`: Next suggestion
- `Alt+[`: Previous suggestion

#### Avante.nvim (Claude integration)

- LLM-powered code completion and suggestions
- Integrated with Claude and other LLMs via mcphub.nvim
- Image pasting support

### Git Commands

- `<leader>lg`: Open LazyGit interface
- `<leader>gs`: Open Neogit status
- `<leader>gc`: Open Neogit commit dialog
- `<leader>gp`: Pull changes with Neogit
- `<leader>gP`: Push changes with Neogit
- `<leader>gb`: Browse branches with Telescope
- `<leader>gl`: Browse commits with Telescope
