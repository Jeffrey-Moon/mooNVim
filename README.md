# MooNVim Environment

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
```

---

2. Connect Your Workspace Link
Ensure any existing configuration directories are safely cleared, then drop a symbolic link path mapping into the exact runtime endpoint directory Neovim targets on initialization:

Mac & Linux Systems:
```
Bash
rm -rf ~/.config/nvim
git clone [https://github.com/Jeffrey-Moon/mooNVim.git](https://github.com/Jeffrey-Moon/mooNVim.git) ~/.config/nvim
```
Windows Systems (PowerShell):
```
PowerShell
Remove-Item -Recurse -Force $HOME\AppData\Local\nvim
New-Item -ItemType Junction -Path $HOME\AppData\Local\nvim -Value $HOME\mooNVim
```
3. Initialize Runtime Engine
Launch the editor:
```
Bash
nvim
```
The plugin manager will automatically activate, download all 23 registered plugins, compile language parsers locally via standard runtime binaries, and instantiate your environment layout automatically.

---

## 🎹 Comprehensive Production Keybindings

The designated **Leader Key** is mapped globally to `Spacebar`.

### Workspace Navigation & Search Matrix
* `<Leader>ff` : Fuzzy find project files dynamically inside active directories.
* `<Leader>fg` : Execute global text searches across workspace files via `ripgrep`.
* `<Leader>fb` : View and jump between files stored inside memory buffers.
* `<Leader>fh` : Search recently modified file interaction histories.
* `<Leader>e`  : Toggle the visual `neo-tree` directory sidebar (supports relative line jumps).

### Window Segment Control (Splits Layout)
* `<Leader>sv` : Cut active buffer window area vertically.
* `<Leader>sh` : Cut active buffer window area horizontally.
* `<Leader>sx` : Safely sever/close the currently focused split window tile.
* `Ctrl + h`    : Transition focus to the left window split segment.
* `Ctrl + j`    : Transition focus down to the lower window split segment.
* `Ctrl + k`    : Transition focus up to the higher window split segment.
* `Ctrl + l`    : Transition focus right to the right window split segment.

### IDE Code Intellisense Operations
* `gd`          : Jump cursor directly to the structural code definition entry point.
* `K`           : Spawn structural variable/method reference hover documentation tooltips.
* `<Leader>rn` : Multi-file variable name refactoring (Smart Rename).
* `<Leader>ca` : Open inline diagnostic quick-fix code actions menu.
* `gcc`         : Toggle comments contextually for the current code layer line.

### Multi-Terminal Multiplexing Layouts
* `Ctrl + \`    : Instantly toggle a terminal panel shell directly inside the environment frame.

---

## 🧼 Code Automation Standards
* **Format-On-Save:** Configured via `conform.nvim`. Files automatically adapt to uniform language spacing constraints (`black` for Python, `clang-format` for C++) the precise millisecond changes write to disk via `:w`.
* **Clipboard Union:** System clipboard actions are natively synchronized—using native `p` and `P` pasting actions automatically enforces current 4-space layout formatting.

---

## 🚀 Everyday Production Workflow Guide

To get the maximum velocity out of this configuration, you should completely abandon your mouse. Here is the blueprint for navigating, editing, and refactoring a codebase fluidly using integrated plugins and native Vim mechanics.

### 1. The Core Navigation Loop & Sidebar Workspace
When starting a development session, always change to your project's root folder in your terminal and initialize the workspace editor:
```bash
cd ~/workspace/my-project-repo
nvim .
```

* **Toggle Workspace Sidebar:** Press `<Leader>e` (`Space + e`) to open or close your relative-numbered file tree panel.
* **Inline Folder Navigation:** Move your cursor to a directory folder line and press `Enter`. The directory expands or collapses **inline** without shifting your workspace root.
* **Dive Into Folder (`set_root`):** Highlight a folder and press `Ctrl + Enter` to force the entire sidebar window to change its absolute path focus into that specific directory.
* **Escape Back Up (`cd ..`):** Press `-` (Minus key) anywhere inside the sidebar panel to instantly shift your root directory framework backward into the parent folders.
* **Dynamic Sidebar Jumps:** Use your relative line numbers. If a file is 12 rows down in your sidebar layout, type `12j` followed by `Enter` to snap right to it.
* **Fuzzy Finder Matrix:** Skip manual browsing entirely. Press `<Leader>ff` to fuzzy search files by name, or press `<Leader>fg` to run a live global text match across all files via `ripgrep`.

### 2. Window Segment Control (Splits & Buffers)
Instead of relying on clunky horizontal browser tabs, this configuration utilizes memory **Buffers** and visible layout **Splits**.

* **Cutting Windows:** Inside a file, type `<Leader>sv` to split your active layout window vertically, or `<Leader>sh` to split it horizontally. 
* **Seamless Screen Switching:** Hold `Ctrl` and use standard home-row direction keys (`h`, `j`, `k`, `l`) to jump your cursor focus instantaneously between your active splits.
* **Terminating Active Frames:** Type `<Leader>sx` to safely sever and close the currently focused window split segment.
* **Reviewing Background Memory:** Tap `<Leader>fb` to call up a responsive, interactive menu displaying every single file held open in background buffer memory.

### 3. Native Vim Navigation Acceleration
Stop smashing the arrow keys. Use structural hops to zip through text files instantly:

* `H` / `M` / `L` : Jump cursor directly to the **H**igh (top), **M**iddle, or **L**ow (bottom) lines currently visible on your display viewport.
* `gg` / `G`     : Warp instantly to the absolute first line (`gg`) or absolute last line (`G`) of the entire document buffer.
* `w` / `b`       : Skip cursor **w**orward (`w`) or **b**ackward (`b`) word-by-word.
* `e` / `ge`      : Jump straight to the **e**nd of the next word (`e`) or the end of the previous word (`ge`).
* `0` / `$`       : Snap cursor to the absolute start (`0`) or absolute end (`$`) of the active line.
* `f<char>`       : **F**ind character. Inline teleportation tool. Type `f` followed by any character (e.g., `f,`) to snap your cursor directly to the next instance of that character on the current row.

### 4. High-Fidelity Text Manipulation & Clipboard Sync
Because your global clipboard register is unified with your operating system setup (`unnamedplus`), moving and copying blocks maps directly to your system clipboard hooks.

* **Character Visual Selection:** Place your cursor at a block boundary, press `v` (lowercase) to drop into character Visual Mode, and slide through text strings to highlight.
* **Structural Row Selection:** Press `V` (Capital V / `Shift + v`) to enter Visual Line Mode, which instantly highlights whole structural lines as you move `j` and `k`.
* **Copy (Yank):** Once text is highlighted in any Visual Mode, press `y`. The snippet is immediately written to your internal registers and your native system clipboard (`Cmd + V` accessible outside the terminal).
* **Instant Line Copy:** Type `yy` while in Normal mode to copy the current line instantly without highlighting it.
* **Structural Layout Alignment on Paste:** When pasting outside text blocks using `p` or `P`, type `]=` right after to force Neovim's engine to automatically format and conform the incoming text to your local file's 4-space layout.
* **Mouse Bypass Copying:** Hold down the **`Option`** (or `Alt`) key on your Mac keyboard while dragging your trackpad mouse cursor over text to copy raw screen data, ignoring the terminal buffer.

### 5. Multi-Layer Indentation Engineering
Indentation layers follow a uniform 4-space configuration standard and can be manipulated rapidly across edit states:

* **In Insert Mode (As you type):** Press `Tab` to indent the active line forward, or `Shift + Tab` to pull the active line backward (un-indent). Natively, you can also use `Ctrl + t` (forward) and `Ctrl + d` (backward).
* **In Normal Mode:** Type `>>` to push the active row right, or `<<` to pull it left.
* **In Visual Highlight Mode:** Press `Tab` or `>` to indent a highlighted block right, and `Shift + Tab` or `<` to pull it left. *Note: Custom mapping automatically retains your visual highlighting selection boundaries, allowing you to cycle indentation continuously without dropping out of Visual mode.*

### 6. Harnessing Core IDE Intellisense
As you edit source code parameters, your asynchronous language server protocol (LSP) and completion engines provide integrated diagnostic feedback:

* **Contextual Completions:** An autocomplete card drops into view dynamically as you type. Use `Ctrl + j` / `Ctrl + k` to cycle recommendations, and hit `Enter` to confirm and insert.
* **Jump to Source Declarations:** Place your cursor over any variable, class blueprint, or method reference and type `gd` (Go to Definition). Neovim will instantly open the target file and snap right to the initialization row. Type `Ctrl + o` to jump right back to where you started.
* **Documentation Hover Tooltips:** Place your cursor on an active function signature and press `K` (capital K) to render a floating dashboard displaying parameter definitions, documentation blocks, and return type maps.
* **Global Name Refactoring:** Place your cursor over an active variable name and press `<Leader>rn`. Type a replacement naming convention and hit `Enter` to execute a global multi-file variable refactor instantly.
* **Smart Comment Toggling:** Type `gcc` to toggle a line comment on or off. Highlight a massive block layout inside Visual Mode and type `gc` to comment out entire multi-line logic frameworks contextually.
* **Internal Terminal Access:** Type `Ctrl + \` from anywhere in your workflow to snap open an integrated terminal shell panel right at the bottom of your workspace frame. Type `Ctrl + \` again to toggle it closed.
