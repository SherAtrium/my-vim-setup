# ✨ SherAtrium's Neovim

A modern, fast, and modular Neovim configuration optimized for **Web Development**,  
**TypeScript**, **JavaScript**, **Lua**, and multi-language workflows in **2025+**.

This repository contains my personal Neovim setup — **clean, structured, stable**, and built
with a strong focus on **performance**, **clarity**, and **developer experience**.

![Example](https://github.com/SherAtrium/my-vim-setup/blob/main/assets/Example.jpeg)

---

## 🔑 Keymap Philosophy & Structure

Keybindings in this configuration follow a **clean, mnemonic, and responsibility-driven** design.

Every keymap is structured to be:

- **Discoverable** — works seamlessly with which-key
- **Single-responsibility** — one prefix, one purpose
- **Leader-driven** — consistent `<leader>` usage (`Space`)
- **Minimal** — no duplicate or redundant bindings
- **Native-first** — UI plugins enhance, not replace, core behavior
- **Mode-aware** — predictable behavior across modes

### Keymap Prefix Conventions

| Prefix        | Meaning / Category                                   |
| ------------- | ---------------------------------------------------- |
| `<leader>f…`  | **FZF** — files, grep, buffers, diagnostics          |
| `<leader>e…`  | **Explorer** — Neo-tree (sidebar & floating)         |
| `<leader>b…`  | **Buffers** — BufferLine navigation & management     |
| `<leader>g…`  | **Git** — gitsigns, diffview, lazygit                |
| `<leader>d…`  | **Diagnostics** — native + Trouble UI                |
| `<leader>l…`  | **LSP navigation** — definition, references, symbols |
| `<leader>lF…` | **FZF-powered LSP navigation**                       |
| `<leader>a`   | **LSP actions** — code actions                       |
| `<leader>r`   | **Refactor** — rename symbol                         |
| `<leader>w…`  | **Windows & splits**                                 |
| `<leader>t…`  | **Tabs**                                             |
| `<leader>u…`  | **UI toggles**                                       |
| `<leader>s…`  | **Session / system**                                 |
| `<leader>?`   | **Help** — which-key                                 |

---

## 📘 Full Keymap Reference

A complete, detailed list of **every keybinding** is available here:

👉 **[KEYMAPS.md](KEYMAPS.md)**

(Recommended if you're using or customizing this configuration.)

---

## 🚀 Features

### 🧠 Intelligent LSP Setup

- Language servers for:
  **Lua, TypeScript, JavaScript, Docker, Bash, YAML, TailwindCSS, JSON, Emmet**
- Native hover, rename, code actions, references, diagnostics
- Clean separation between:
  - navigation (`<leader>l…`)
  - actions (`<leader>a`)
  - refactoring (`<leader>r`)
- Per-language configuration under `lua/servers/*.lua`

---

### ⚡ Auto-completion (nvim-cmp)

- Completion powered by **nvim-cmp**
- Snippets via **LuaSnip**
- Icons via **lspkind**
- Signature help
- Buffer + file path completions
- **AI completion via GitHub Copilot** (suggestion-only, no UI noise)

---

### 🌲 Treesitter

- Modern syntax highlighting
- Incremental selection
- Automatic parser installation
- Improved indentation and structure awareness

---

### 🔍 FZF-Lua

High-performance fuzzy finder used across the entire setup:

- File search
- Live grep
- Buffers
- LSP symbols & references
- Diagnostics

Supports opening results in:

- current window
- vertical split
- horizontal split
- new tab

---

### 📁 Neo-tree

- Modern file explorer
- Sidebar & floating modes
- Window-picker integration
- Git status and buffer tree
- Clean, minimal UI
- Leader key leakage disabled inside explorer

---

### 🧩 mini.nvim Ecosystem

A minimal and consistent alternative to many single-purpose plugins:

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

---

### 🧹 Formatting & Linting (Automatic)

Formatting and linting are handled automatically and intentionally **not bound to manual keymaps**.

- Formatting via **conform.nvim**
- Linting via **nvim-lint**
- LSP formatting where supported
- Buffer-local and language-aware behavior

This approach avoids keymap clutter and ensures consistent results without manual intervention.

---

### 🩺 Diagnostics Experience

- Native diagnostics for navigation and floating messages
- **Trouble.nvim** used as a diagnostics UI
- Unified under a single `<leader>d` namespace
- No duplicate diagnostic responsibilities

---

### 💡 Quality of Life

- Highlight on yank
- Restore cursor on file open
- Centered scrolling and navigation
- Clean window management
- Consistent keymap architecture
- Transparent UI support

---

## 🧰 Automatic Tool Installation (Mason Tool Installer)

This configuration includes **automatic installation** of all required tools:

- **Language Servers (LSP)**
- **Formatters**
- **Linters**
- **Debug adapters (DAP)**

Powered by **mason-tool-installer.nvim**.

Clone the repo, open Neovim — everything installs automatically.

### 📦 Tools Installed Automatically

**LSP Servers**

- bash-language-server
- dockerfile-language-server
- emmet-ls
- json-lsp
- lua-language-server
- tailwindcss-language-server
- typescript-language-server
- yaml-language-server

**Formatters**

- prettierd
- shfmt
- stylua
- markdownlint

**Linters**

- shellcheck
- hadolint
- fixjson

---

### 🛠 How It Works

On startup, `mason-tool-installer`:

- Installs missing tools
- Keeps versions consistent
- Ensures reproducible environments across machines

Configuration location:

```text
lua/plugins/mason-tool-installer.lua
```
