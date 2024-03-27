# How to install

1. First, make a backup of your current configuration and delete your local `nvim` cache:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
rm -rf ~/.local/share/nvim
```

2. Install the pre-dependencies, like LSPs and node.js:

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

3. Install the NvChad repo, into the `~/.config/nvim` directory:

```bash
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
```

4. Install this repo over the NvChad configuration

```bash
git clone git@github.com:msaelices/neovim-python.git ~/.config/nvim/lua/custom
```

5. Execute `nvim` and let [Lazy.vim](https://www.lazyvim.org/) and [Masoni.vim](https://github.com/williamboman/mason.nvim) to install all the plugins.

6. Press `Space + t + h` and install the theme of your preference.


