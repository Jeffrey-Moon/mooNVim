# MooNeovim Environment

NeoVim just for Jeffrey Moon.

---

## Architectural Infrastructure

This configuration transforms Neovim into a modern development platform via four distinct core layers:

| Layer Component | Technology Stack | Functional Scope |
| :--- | :--- | :--- |
| **Plugin Architecture** | `lazy.nvim` | Background pipeline loading & lazy execution boundaries. |
| **Syntax Compilations** | `nvim-treesitter` | High-fidelity abstract syntax trees for fast, accurate coloring. |
| **Core Intelligence** | `mason.nvim` & Native LSP | Type parsing, hover signatures, automatic code diagnostics. |
| **Search Matrix** | `telescope.nvim` & `ripgrep` | Global literal text matching and real-time directory fuzzy finding. |

---

## Rapid Quickstart Setup

### 1. Execute System Dependencies Installer
Clone this repository to your computer, enter the configuration directory, and run the installation script specific to your current platform layout:

```bash
# macOS Execution:
./scripts/install_mac.sh

# Debian/Ubuntu Execution:
./scripts/install_debian.sh

# Windows Execution (PowerShell Admin):
.\scripts\install_windows.ps1
