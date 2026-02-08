# dotfiles

Personal dotfiles for macOS.

## Install

```
make install
```

This will create symlinks into your home directory for the managed configs.

## Neovim

Two Neovim configs are supported:

- `nvim` (legacy)
- `nvim-new` (fresh, Lua-based)

Install symlinks and state dirs:

```
make install-nvim
make install-nvim-new
```

Launch the new config:

```
NVIM_APPNAME=nvim-new nvim
```

The new config uses `lazy.nvim` and will auto-install plugins on first launch.
