# ✨ SherAtrium's Neovim

A modern, fast, modular Neovim configuration optimized for **Web Development**, **TypeScript**, **JavaScript**, **Go**, **Python**, **Lua**, and multi-language workflows in 2025+.

This repository contains my personal Neovim configuration — clean, structured, stable, and built with a strong focus on **performance**, **clarity**, and **developer experience**.

![alt text](https://github.com/SherAtrium/my-vim-setup/blob/main/assets/Example.jpeg)

---

## 🔑 Keymap Philosophy & Structure

Keybindings in this configuration follow a **clean, mnemonic, hierarchical** design.  
Every keymap is structured to be:

- **Discoverable** (works great with which-key)
- **Category-based** (LSP, FZF, Buffers, Diagnostics, etc.)
- **Leader-driven** for consistency (`<leader>` = `Space`)
- **Conflict-free** and easy to remember

### Keymap Prefix Conventions

| Prefix                     | Meaning / Category                                        |
| -------------------------- | --------------------------------------------------------- |
| `<leader>l…`               | **LSP actions** — definitions, code actions, rename, etc. |
| `<leader>lF…`              | **FZF-powered LSP actions** — finder, symbols, references |
| `<leader>f…`               | **FZF** — files, grep, buffers, diagnostics               |
| `<leader>x…`               | **Diagnostics (Trouble)**                                 |
| `<leader>b…`               | **Buffers**                                               |
| `<leader>s…`               | **Splits**                                                |
| `<leader>c…`               | **Coding utilities** — formatting, linting                |
| `<leader>e` / `<leader>fe` | **Neo-tree** — explorer (sidebar & floating)              |

### Core Principles

- **mnemonics first** (`l` = LSP, `f` = find, `b` = buffers)
- **visual grouping** (consistent prefixes)
- **minimal overrides** (only map what improves workflow)
- **mode-aware** mappings (e.g., `<C-/>` works in normal + visual)

---

## 📘 Full Keymap Reference

A complete, detailed list of **every keybinding** is available here:

👉 **[KEYMAPS.md](KEYMAPS.md)**

(Recommended if you're using or customizing this config.)

---

## 🚀 Features

### 🧠 Intelligent LSP Setup

- Language servers for:  
  **Lua, TypeScript, JavaScript, Docker, Bash, Python, Go, YAML, C/C++, TailwindCSS, JSON, Emmet**
- Inlay hints, hover, rename, code actions, references, formatting
- Per-language configuration under `lua/servers/*.lua`

### ⚡ Auto-completion (nvim-cmp)

- Snippets via LuaSnip
- Icons via lspkind
- Signature help
- Buffer + file path completions
- **AI completion via Codeium/Windsurf**

### 🌲 Treesitter

- Syntax highlighting
- Incremental selection
- Auto parser installation
- Modern indentation

### 🔍 FZF-Lua

Fast fuzzy finder for:

- Files
- Live Grep
- LSP symbols
- References
- Diagnostics

### 📁 Neo-tree

- Modern file explorer
- Window-picker integration
- Git status + buffer tree
- Transparent UI support
- Floating + sidebar modes

### 🧩 mini.nvim Ecosystem

A cleaner alternative to many plugins:

- mini.ai
- mini.comment
- mini.move
- mini.surround
- mini.pairs
- mini.cursorword
- mini.indentscope
- mini.trailspace
- mini.bufremove
- mini.notify
- mini.diff (git hunks)

### 🧹 Formatting & Linting

- **conform.nvim** for formatting
- **nvim-lint** for linting (eslint_d, flake8, shellcheck, markdownlint, yamllint, luacheck, etc.)

### 💡 Quality of Life

- Highlight on yank
- Restore cursor on file open
- Diagnostics virtual text with custom icons
- Transparent UI
- Clean and consistent keymap architecture

---

## 🧰 Automatic Tool Installation (Mason Tool Installer)

This Neovim configuration includes **automatic installation** of all required:

- **Language Servers (LSP)**
- **Formatters**
- **Linters**
- **Debug Adapters (DAP)**

Powered by:

👉 **mason-tool-installer.nvim**

No more manually running `:Mason` or installing tools on each machine —  
just clone your config, open Neovim, and everything installs automatically.

### 📦 Tools Installed Automatically

**LSP Servers**

- bash-language-server
- clangd
- dockerfile-language-server
- emmet-ls
- eslint_d
- gopls
- json-lsp
- lua-language-server
- pyright
- tailwindcss-language-server
- typescript-language-server
- yaml-language-server

**Formatters**

- black
- clang-format
- gofumpt
- prettierd
- shfmt
- stylua

**Linters**

- cpplint
- fixjson
- flake8
- hadolint
- revive
- shellcheck

**Debugging**

- codelldb

### 🛠 How It Works

When you start Neovim, `mason-tool-installer` automatically:

- Installs missing tools
- Ensures consistency across all machines
- Keeps your development environment reproducible

The configuration lives here:

```text
lua/plugins/mason-tool-installer.lua
```
