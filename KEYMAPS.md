# 📄 Keymaps Overview

This document provides a complete overview of keybindings used in **SherAtrium’s Neovim**.
The layout follows a clean, minimal, and scalable prefix architecture designed for speed,
clarity, and zero conflicts.

---

# 🔑 Prefix Architecture

| Prefix  | Category                          |
| ------- | --------------------------------- |
| **`f`** | Search / Navigation (fzf-lua)     |
| **`e`** | Explorer (neo-tree)               |
| **`b`** | Buffers (BufferLine)              |
| **`g`** | Git (gitsigns, diffview, lazygit) |
| **`d`** | Diagnostics (native + Trouble UI) |
| **`l`** | LSP navigation                    |
| **`a`** | LSP actions (code actions)        |
| **`r`** | Refactor (rename symbol)          |
| **`t`** | Tabs                              |
| **`w`** | Windows / splits / layout         |
| **`u`** | UI toggles                        |
| **`s`** | Session / system                  |
| **`h`** | Help                              |

`Space` is `<leader>`.

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
| `<Esc>`   | Clear search highlight            |
| `qq`      | Quit without saving               |

## 🤖 AI — Copilot

| Key             | Mode            | Action                    |
| --------------- | --------------- | ------------------------- |
| `<leader><Tab>` | Insert / Visual | Accept Copilot suggestion |

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
| `<leader>fb` | Buffers               |
| `<leader>fh` | Help tags             |
| `<leader>fs` | Document symbols      |
| `<leader>fS` | Workspace symbols     |
| `<leader>fx` | Document diagnostics  |
| `<leader>fX` | Workspace diagnostics |

### 📂 Opening files from FZF

While the FZF window is open:

| Key     | Action                       |
| ------- | ---------------------------- |
| `<CR>`  | Open in current window       |
| `<C-v>` | Open in **vertical split**   |
| `<C-x>` | Open in **horizontal split** |
| `<C-t>` | Open in new tab              |

---

# 🗂 Buffers — BufferLine (`<leader>b…`)

| Key          | Action              |
| ------------ | ------------------- |
| `<leader>bb` | Buffers list        |
| `<leader>bn` | Next buffer         |
| `<leader>bp` | Previous buffer     |
| `<leader>bP` | Pin / Unpin buffer  |
| `<leader>bh` | Move buffer left    |
| `<leader>bl` | Move buffer right   |
| `<leader>bc` | Close other buffers |

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

| Key           | Action        |
| ------------- | ------------- |
| `<leader>gco` | Choose ours   |
| `<leader>gct` | Choose theirs |
| `<leader>gcb` | Choose both   |
| `<leader>gcn` | Next conflict |
| `<leader>gcp` | Prev conflict |

## 🐙 Lazygit

| Key          | Action                 |
| ------------ | ---------------------- |
| `<leader>gg` | Open Lazygit           |
| `<leader>gf` | Lazygit (current file) |
| `<leader>gl` | Lazygit log view       |

---

# 🩺 Diagnostics (`<leader>d…`)

## Native Diagnostics

| Key          | Action                 |
| ------------ | ---------------------- |
| `<leader>do` | Open diagnostics float |
| `<leader>dp` | Previous diagnostic    |
| `<leader>dn` | Next diagnostic        |

## Diagnostics UI — Trouble

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<leader>dd` | Workspace diagnostics        |
| `<leader>dD` | Buffer diagnostics           |
| `<leader>dq` | Quickfix list                |
| `<leader>dl` | Location list                |
| `<leader>ds` | Symbols                      |
| `<leader>dr` | LSP references / definitions |

---

# 🧠 LSP Navigation (`<leader>l…`)

| Key          | Action              |
| ------------ | ------------------- |
| `K`          | Hover documentation |
| `<leader>ld` | Go to definition    |
| `<leader>lD` | Definition (vsplit) |
| `<leader>lt` | Type definition     |
| `<leader>li` | Implementation      |
| `<leader>lr` | References          |

---

# ⚙️ LSP Actions & Refactor

| Key         | Action        |
| ----------- | ------------- |
| `<leader>a` | Code action   |
| `<leader>r` | Rename symbol |

---

# 🔍 FZF–LSP Integration (`<leader>lF…`)

| Key           | Action            |
| ------------- | ----------------- |
| `<leader>lFd` | LSP Finder        |
| `<leader>lFr` | LSP References    |
| `<leader>lFt` | Type definitions  |
| `<leader>lFi` | Implementations   |
| `<leader>lFs` | Document symbols  |
| `<leader>lFw` | Workspace symbols |

---

# 🧩 mini.nvim Keymaps

## Comments — mini.comment

| Key         | Action         |
| ----------- | -------------- |
| `<leader>/` | Toggle comment |
| `gc`        | Comment object |

## Surround — mini.surround

| Key  | Action          |
| ---- | --------------- |
| `sa` | Add surround    |
| `sd` | Delete surround |
| `sf` | Find surround   |
| `sF` | Find surround ← |
| `sh` | Highlight       |
| `sr` | Replace         |

## Move — mini.move

| Key     | Action     |
| ------- | ---------- |
| `<C-j>` | Move down  |
| `<C-k>` | Move up    |
| `<C-h>` | Move left  |
| `<C-l>` | Move right |

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
