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

- `J` — Join lines (cursor centered)
- `<C-d>` — Half-page down (centered)
- `<C-u>` — Half-page up (centered)
- Arrow keys — Resize splits (`← → ↑ ↓`)
- `qq` — Quit without saving

### Visual Mode

- `<` — Indent left & reselect
- `>` — Indent right & reselect

---

# 🪟 Window Management — `<leader>w`

- `wh` — Horizontal split
- `wv` — Vertical split
- `wd` — Close window
- `w=` — Equalize splits

---

# 📁 Neo-tree Explorer — `<leader>e`

- `e` — File explorer (left)
- `ef` — Floating explorer
- `eb` — Buffers tree
- `eg` — Git status tree

---

# 🔍 FZF-Lua Search — `<leader>f`

- `ff` — Find files
- `fg` — Live grep
- `fb` — Buffers list
- `fh` — Help tags
- `fs` — Document symbols
- `fS` — Workspace symbols
- `fx` — Document diagnostics
- `fX` — Workspace diagnostics

---

# 🗂 Buffers — `<leader>b`

- `bb` — Buffer list
- `bp` — Previous buffer
- `bn` — Next buffer
- `bd` — Delete buffer

---

# 🛠 Git — `<leader>g`

### Hunk Actions

- `gs` — Stage hunk
- `gr` — Reset hunk
- `gp` — Preview hunk
- `gb` — Blame popup
- `gB` — Toggle inline blame

### Hunk Navigation

- `]h` — Next hunk
- `[h` — Previous hunk

### Diffview

- `gd` — Open Diffview
- `gD` — Close Diffview
- `gh` — File history

### Merge Conflicts — `<leader>gc`

- `gco` — Choose ours
- `gct` — Choose theirs
- `gcb` — Choose both
- `gcn` — Next conflict
- `gcp` — Previous conflict

### Lazygit

- `gg` — Open Lazygit
- `gf` — Lazygit (current file)
- `gl` — Lazygit log

---

# 🧠 Code Tools — `<leader>c`

- `ca` — Code action
- `cr` — Rename symbol
- `cf` — Format buffer
- `coi` — Organize imports + format
- `ll` — Lint buffer

---

# 🩺 Native Diagnostics — `<leader>d`

- `do` — Diagnostics float
- `dp` — Previous diagnostic
- `dn` — Next diagnostic

---

# 🚨 Trouble Diagnostics UI — `<leader>x`

- `xx` — Workspace diagnostics
- `xX` — Buffer diagnostics
- `xQ` — Quickfix list
- `xL` — Location list
- `xl` — LSP definitions & references
- `xs` — LSP symbols

---

# 🧩 Mini.nvim

### Comments

- `<C-/>` — Toggle comment
- `gc` — Comment operator

### Surround

- `sa` — Add surround
- `sd` — Delete surround
- `sf` — Find surround
- `sF` — Find backward
- `sh` — Highlight surround
- `sr` — Replace surround

### Move

- `<C-j>` — Move line down
- `<C-k>` — Move line up
- `<C-h>` — Move left
- `<C-l>` — Move right

---

# 🔎 LSP Navigation — `<leader>l`

- `K` — Hover docs
- `ld` — Definition
- `lD` — Definition (vsplit)
- `lt` — Type definition
- `li` — Implementation
- `lr` — References
- `la` — Code action
- `ln` — Rename

### Diagnostics

- `do` — Float diagnostics
- `dp` — Previous diagnostic
- `dn` — Next diagnostic

---

# 🔍 FZF-LSP — `<leader>lF`

- `lFd` — LSP Finder
- `lFr` — References
- `lFt` — Type definitions
- `lFi` — Implementations
- `lFs` — Document symbols
- `lFw` — Workspace symbols

---

# ❔ Help

- `<leader>?` — Which-key popup

---

# 🔧 Misc

- `gx` — Open URL
