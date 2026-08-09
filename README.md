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
