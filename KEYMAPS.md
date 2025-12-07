# 📄 Keymaps Overview

This document provides a complete overview of keybindings used in **SherAtrium’s Neovim**.
The layout follows a clean and scalable prefix architecture designed for clarity and zero conflicts.

---

# 🔑 Prefix Architecture

| Prefix  | Category                                |
| ------- | --------------------------------------- |
| **`f`** | Search / FZF                            |
| **`e`** | Explorer / Neo-tree                     |
| **`b`** | Buffers                                 |
| **`g`** | Git                                     |
| **`c`** | Code (LSP actions, formatting, imports) |
| **`d`** | Diagnostics (native)                    |
| **`t`** | Tabs                                    |
| **`w`** | Windows / Splits                        |
| **`u`** | UI Toggles                              |
| **`x`** | Troubleshooting (Trouble UI)            |
| **`s`** | Sessions / System                       |
| **`h`** | Help                                    |

`Space` is `<leader>`.
Keymaps are grouped logically by their domain.

---

# 🎯 General Editing

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

---

# 🪟 Window Management (`<leader>w…`)

| Key          | Action           |
| ------------ | ---------------- |
| `<leader>wh` | Horizontal split |
| `<leader>wv` | Vertical split   |
| `<leader>wd` | Close window     |
| `<leader>w=` | Equalize splits  |

---

# 📁 Neo-tree Explorer (`<leader>e…`)

| Key          | Action                |
| ------------ | --------------------- |
| `<leader>e`  | File explorer (left)  |
| `<leader>ef` | File explorer (float) |
| `<leader>eb` | Buffers tree          |
| `<leader>eg` | Git status tree       |

---

# 🔍 FZF-Lua Search (`<leader>f…`)

| Key          | Action                |
| ------------ | --------------------- |
| `<leader>ff` | Find files            |
| `<leader>fg` | Live grep             |
| `<leader>fb` | FZF buffer list       |
| `<leader>fh` | Help tags             |
| `<leader>fs` | Document symbols      |
| `<leader>fS` | Workspace symbols     |
| `<leader>fx` | Document diagnostics  |
| `<leader>fX` | Workspace diagnostics |

---

# 🗂 Buffers (`<leader>b…`)

| Key          | Action          |
| ------------ | --------------- |
| `<leader>bb` | List buffers    |
| `<leader>bp` | Previous buffer |
| `<leader>bn` | Next buffer     |
| `<leader>bd` | Delete buffer   |

---

# 🛠 Git (`<leader>g…`)

## 🔧 Hunk Actions

| Key          | Action              |
| ------------ | ------------------- |
| `<leader>gs` | Stage hunk          |
| `<leader>gr` | Reset hunk          |
| `<leader>gp` | Preview hunk        |
| `<leader>gb` | Blame (popup)       |
| `<leader>gB` | Toggle inline blame |

## 🔀 Hunk Navigation

| Key  | Action        |
| ---- | ------------- |
| `]h` | Next hunk     |
| `[h` | Previous hunk |

## 📜 Diffview

| Key          | Action            |
| ------------ | ----------------- |
| `<leader>gd` | Open Diffview     |
| `<leader>gD` | Close Diffview    |
| `<leader>gh` | File history view |

## ⚔️ Merge Conflicts (`<leader>gc…`)

| Key           | Action            |
| ------------- | ----------------- |
| `<leader>gco` | Choose ours       |
| `<leader>gct` | Choose theirs     |
| `<leader>gcb` | Choose both       |
| `<leader>gcn` | Next conflict     |
| `<leader>gcp` | Previous conflict |

### 🐙 Lazygit — Git TUI Interface

| Key          | Action                    |
| ------------ | ------------------------- |
| `<leader>gg` | Open Lazygit              |
| `<leader>gf` | Lazygit (current file)    |
| `<leader>gl` | Lazygit log / filter view |

---

# 🧠 Code Tools (`<leader>c…`)

| Key           | Action                    |
| ------------- | ------------------------- |
| `<leader>ca`  | Code action               |
| `<leader>cr`  | Rename symbol             |
| `<leader>cf`  | Format buffer             |
| `<leader>coi` | Organize imports + format |
| `<leader>ll`  | Lint buffer               |

---

# 🩺 Native Diagnostics (`<leader>d…`)

| Key          | Action                 |
| ------------ | ---------------------- |
| `<leader>do` | Open diagnostics float |
| `<leader>dp` | Previous diagnostic    |
| `<leader>dn` | Next diagnostic        |

---

# 🚨 Trouble Diagnostics UI (`<leader>x…`)

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<leader>xx` | Workspace diagnostics        |
| `<leader>xX` | Buffer diagnostics           |
| `<leader>xQ` | Quickfix list                |
| `<leader>xL` | Location list                |
| `<leader>xl` | LSP definitions & references |
| `<leader>xs` | LSP symbols                  |

---

# 🧩 Mini.nvim Keymaps

## Comments (mini.comment)

| Key     | Action                |
| ------- | --------------------- |
| `<C-/>` | Toggle comment        |
| `gc`    | Comment operator mode |

## Surround (mini.surround)

| Key  | Action           |
| ---- | ---------------- |
| `sa` | Add surround     |
| `sd` | Delete surround  |
| `sf` | Find surround    |
| `sF` | Find surround ←  |
| `sh` | Highlight        |
| `sr` | Replace surround |

## Move (mini.move)

| Key     | Action     |
| ------- | ---------- |
| `<C-j>` | Move down  |
| `<C-k>` | Move up    |
| `<C-h>` | Move left  |
| `<C-l>` | Move right |

Other mini.nvim modules have no keybindings.

---

# 🔎 LSP Navigation (`<leader>l…`)

| Key          | Action              |
| ------------ | ------------------- |
| `K`          | Hover documentation |
| `<leader>ld` | Go to definition    |
| `<leader>lD` | Definition (vsplit) |
| `<leader>lt` | Type definition     |
| `<leader>li` | Implementation      |
| `<leader>lr` | References          |
| `<leader>la` | Code action         |
| `<leader>ln` | Rename symbol       |

### LSP Diagnostics

| Key          | Action              |
| ------------ | ------------------- |
| `<leader>do` | Diagnostics float   |
| `<leader>dp` | Previous diagnostic |
| `<leader>dn` | Next diagnostic     |

---

# 🔍 FZF-LSP Integration (`<leader>lF…`)

| Key           | Action               |
| ------------- | -------------------- |
| `<leader>lFd` | LSP Finder           |
| `<leader>lFr` | LSP References       |
| `<leader>lFt` | LSP Type Definitions |
| `<leader>lFi` | LSP Implementations  |
| `<leader>lFs` | Document symbols     |
| `<leader>lFw` | Workspace symbols    |

---

# ❔ Help

| Key         | Action          |
| ----------- | --------------- |
| `<leader>?` | Which-key popup |

---

# 🔧 Misc

| Key  | Action   |
| ---- | -------- |
| `gx` | Open URL |

---

This document is fully synchronized with your **actual keymaps**, your **new prefix design**, your **plugin configs**, and the final structure of your Neovim setup.

---
