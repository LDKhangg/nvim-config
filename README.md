# nvim-config

My Neovim config.

## Install

```bash
./install.sh
```

This links the repo into `~/.config/nvim`.

## Fresh machine bootstrap

```bash
./install.sh --bootstrap
```

This installs the minimal `init.lua` bootstrap that clones this repo on first launch.

## Update

```bash
git pull
```

## Remove

```bash
rm -rf ~/.config/nvim
```

## Notes

- Barbar buffer shortcuts use `Alt` keys.
- Kitty passes those keys through by default.
- WezTerm binds several `Alt` chords itself, so those mappings will conflict there unless changed.

## Keymap Cheat Sheet

Leader key: `<Space>`

- Buffers
  - `<Tab>` next buffer
  - `<S-Tab>` previous buffer
  - `<leader>bn` next buffer
  - `<leader>bp` previous buffer
  - `<leader>bc` close buffer
- Find
  - `<leader>ff` find files
  - `<leader>fr` recent files
  - `<leader>fg` live grep
  - `<leader>fc` command palette
- Tabs
  - `<leader>to` close current tab
  - `<leader>tn` next tab
  - `<leader>tp` previous tab
  - `<leader>tf` open current buffer in new tab
- Terminal
  - `<leader>ot` toggle terminal
  - `<leader>ov` open vertical terminal
  - `<leader>of` open floating terminal
- Run
  - `<leader>ra` start `air`
  - `<leader>rq` stop `air`
  - `<leader>rt` run Go test panel
- LSP / diagnostics
  - `<leader>ca` code actions
  - `<leader>ln` rename symbol
  - `<leader>xx` line diagnostics
  - `<leader>xb` buffer diagnostics
