#!/bin/bash
echo "🚀 Starting Neovim Dependency Installation for macOS..."

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo "🍺 Homebrew not found. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew is already installed."
fi

echo "📦 Installing core binaries and language runtimes..."
brew install neovim git curl make gcc ripgrep fd node npm python3 tree-sitter

echo "✨ System dependencies installed successfully!"
