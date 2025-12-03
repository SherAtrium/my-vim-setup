# 📄 Keymaps Overview

This document provides a full overview of the keybindings used in my Neovim configuration.  
All keymaps are structured logically, grouped by feature, and follow a consistent hierarchy:

- `Space` as `<leader>`
- Category prefixes (`l` for LSP, `f` for FZF, `x` for diagnostics, etc.)
- Conflict-free minimalistic design
- which-key–friendly descriptions

## 📚 Table of Contents

1. [General Editing](#-general-editing)
2. [Window & Buffer Management](#-window--buffer-management)
3. [Neo-tree File Explorer](#-neo-tree-file-explorer)
4. [FZF-Lua](#-fzf-lua)
5. [Trouble Diagnostics](#-trouble-diagnostics)
6. [Formatting & Linting](#-formatting--linting)
7. [Native LSP Keymaps (`<leader>l…`)](#-native-lsp-keymaps-leaderl)
8. [FZF-LSP (`<leader>lF…`)](#-fzf-lua-lsp-integration-leaderlf)
9. [Mini.nvim Keymaps](#-mininvim-keymaps)
10. [Misc Utilities](#-misc-utilities)

## 🎯 General Editing

| Key       | Action                            |
| --------- | --------------------------------- |
| `J`       | Join lines (keep cursor centered) |
| `<C-d>`   | Half-page down (centered)         |
| `<C-u>`   | Half-page up (centered)           |
| `<Left>`  | Increase window width             |
| `<Right>` | Decrease window width             |
| `<Up>`    | Decrease window height            |
| `<Down>`  | Increase window height            |
| `qq`      | Quit without saving               |

### Visual Mode

| Key | Action                  |
| --- | ----------------------- |
| `<` | Indent left & reselect  |
| `>` | Indent right & reselect |

## 🪟 Window & Buffer Management

| Key          | Action             |
| ------------ | ------------------ |
| `<leader>bb` | List buffers       |
| `<leader>bp` | Previous buffer    |
| `<leader>bn` | Next buffer        |
| `<leader>bd` | Delete buffer      |
| `<leader>sh` | Split horizontally |
| `<leader>sv` | Split vertically   |

## 📁 Neo-tree File Explorer

| Key          | Action              |
| ------------ | ------------------- |
| `<leader>e`  | File explorer       |
| `<leader>fe` | File explorer float |
| `<leader>b`  | Buffers tree        |
| `<leader>g`  | Git status tree     |

## 🔍 FZF-Lua

| Key          | Action                |
| ------------ | --------------------- |
| `<leader>ff` | Find files            |
| `<leader>fg` | Live grep             |
| `<leader>fb` | Buffers               |
| `<leader>fh` | Help tags             |
| `<leader>fs` | Document symbols      |
| `<leader>fS` | Workspace symbols     |
| `<leader>fx` | Document diagnostics  |
| `<leader>fX` | Workspace diagnostics |

## 🚨 Trouble Diagnostics

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<leader>d`  | Diagnostics float            |
| `<leader>xx` | Workspace diagnostics        |
| `<leader>xX` | Buffer diagnostics           |
| `<leader>xQ` | Quickfix list                |
| `<leader>xL` | Location list                |
| `<leader>cl` | LSP definitions & references |
| `<leader>cs` | LSP symbols                  |

## ✨ Formatting & Linting

| Key          | Action        |
| ------------ | ------------- |
| `<leader>cf` | Format buffer |
| `<leader>ll` | Lint buffer   |

## 🧠 Native LSP Keymaps (`<leader>l…`)

### Hover

| Key | Action              |
| --- | ------------------- |
| `K` | Hover documentation |

### Navigation

| Key          | Action                    |
| ------------ | ------------------------- |
| `<leader>ld` | Go to definition          |
| `<leader>lD` | Go to definition (vsplit) |
| `<leader>lt` | Type definition           |
| `<leader>li` | Implementation            |
| `<leader>lr` | References                |

### Actions

| Key          | Action        |
| ------------ | ------------- |
| `<leader>la` | Code action   |
| `<leader>ln` | Rename symbol |

### Diagnostics

| Key           | Action                 |
| ------------- | ---------------------- |
| `<leader>ldo` | Open diagnostics float |
| `<leader>ldp` | Previous diagnostic    |
| `<leader>ldn` | Next diagnostic        |

### Source Actions (Defined in LSP `on_attach()`)

| Key           | Action                    |
| ------------- | ------------------------- |
| `<leader>loi` | Organize imports + format |

## 🔎 FZF-Lua LSP Integration (`<leader>lF…`)

| Key           | Action                   |
| ------------- | ------------------------ |
| `<leader>lFd` | LSP Finder (defs + refs) |
| `<leader>lFr` | LSP References           |
| `<leader>lFt` | Type definitions         |
| `<leader>lFi` | Implementations          |
| `<leader>lFs` | Document symbols         |
| `<leader>lFw` | Workspace symbols        |

## 🧩 Mini.nvim Keymaps

### Commenting

| Key             | Action                                    |
| --------------- | ----------------------------------------- |
| `<C-/>`         | Toggle line/block comment (normal/visual) |
| `gc`            | Comment operator (motion)                 |
| `gc` textobject | Comment textobject                        |

### Surround

| Key          | Action           |
| ------------ | ---------------- |
| `<leader>sa` | Add surround     |
| `<leader>sd` | Delete surround  |
| `<leader>sr` | Replace surround |
| `<leader>sf` | Find surround    |

### Move Lines

| Key     | Action         |
| ------- | -------------- |
| `<A-j>` | Move line down |
| `<A-k>` | Move line up   |

### Diff Hunks

| Key          | Action        |
| ------------ | ------------- |
| `<leader>dp` | Preview hunk  |
| `<leader>dr` | Revert hunk   |
| `<leader>da` | Apply hunk    |
| `]d`         | Next hunk     |
| `[d`         | Previous hunk |

## 🔧 Misc Utilities

| Key         | Action                |
| ----------- | --------------------- |
| `<leader>?` | Show which-key help   |
| `gx`        | Open URL under cursor |
