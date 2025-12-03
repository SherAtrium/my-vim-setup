# 📄 Keymaps Overview

This document provides a complete overview of keybindings used in **SherAtrium’s Neovim**.  
Keymaps follow a consistent structure:

- `Space` is `<leader>`
- Categories: (`l` for LSP, `f` for FZF, `x` for diagnostics, etc.)
- Clear, conflict-free design
- Across all modes where applicable

## 📚 Table of Contents

1. [General Editing](#-general-editing)
2. [Window & Buffer Management](#-window--buffer-management)
3. [Neo-tree File Explorer](#-neo-tree-file-explorer)
4. [FZF-Lua](#-fzf-lua)
5. [Trouble Diagnostics](#-trouble-diagnostics)
6. [Formatting & Linting](#-formatting--linting)
7. [Native LSP Keymaps (`<leader>l…`)](#-native-lsp-keymaps-leaderl)
8. [FZF-LSP (`<leader>lF…`)](#-fzf-lsp-integration-leaderlf)
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
| `<leader>xx` | Workspace diagnostics        |
| `<leader>xX` | Buffer diagnostics           |
| `<leader>xQ` | Quickfix list                |
| `<leader>xL` | Location list                |
| `<leader>cl` | LSP definitions & references |
| `<leader>cs` | LSP symbols                  |

> **Note:**  
> You previously had `<leader>d` for diagnostics float.  
> Now your updated config uses:  
> **`<leader>ldo`** (under LSP Diagnostics)

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

### Source Actions (`on_attach()`)

| Key           | Action                        |
| ------------- | ----------------------------- |
| `<leader>loi` | Organize imports & autoformat |

## 🔎 FZF-LSP Integration (`<leader>lF…`)

| Key           | Action                   |
| ------------- | ------------------------ |
| `<leader>lFd` | LSP Finder (defs + refs) |
| `<leader>lFr` | LSP References           |
| `<leader>lFt` | Type definitions         |
| `<leader>lFi` | Implementations          |
| `<leader>lFs` | Document symbols         |
| `<leader>lFw` | Workspace symbols        |

## 🧩 Mini.nvim Keymaps

### Commenting (mini.comment)

| Key          | Action                    |
| ------------ | ------------------------- |
| `<C-/>`      | Toggle line/block comment |
| `gc`         | Comment operator          |
| `gc{motion}` | Comment textobject        |

### Surround (mini.surround)

| Key  | Action           |
| ---- | ---------------- |
| `sa` | Add surround     |
| `sd` | Delete surround  |
| `sr` | Replace surround |
| `sf` | Find surround    |
| `sF` | Find left        |
| `sh` | Highlight        |

### Move Lines (mini.move)

| Key     | Action         |
| ------- | -------------- |
| `<A-j>` | Move line down |
| `<A-k>` | Move line up   |

### Diff Hunks (mini.diff)

| Key  | Action          |
| ---- | --------------- |
| `gh` | Apply hunk      |
| `gH` | Reset hunk      |
| `gh` | Hunk textobject |
| `[h` | Previous hunk   |
| `]h` | Next hunk       |
| `[H` | First hunk      |
| `]H` | Last hunk       |

> Replaces old:  
> `<leader>dp`, `<leader>dr`, `<leader>da`  
> These are **no longer used**.

## 🔧 Misc Utilities

| Key         | Action                |
| ----------- | --------------------- |
| `<leader>?` | Show which-key help   |
| `gx`        | Open URL under cursor |
