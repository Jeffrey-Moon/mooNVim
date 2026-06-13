#!/bin/bash
echo "🚀 Starting Neovim Deployment Suite for macOS..."

# System Dependencies Lifecycle
if ! command -v brew &> /dev/null; then
    echo "🍺 Homebrew not found. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew is already installed."
fi

echo "📦 Installing core binaries and language runtimes..."
brew install neovim git curl make gcc ripgrep fd node npm python3 tree-sitter

# Automated Symbolic Linking Lifecycle
echo "🔗 Structuring runtime symbolic links..."
TARGET_CONFIG="$HOME/.config/nvim"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Safely eliminate any existing dead shortcuts or folders
rm -rf "$TARGET_CONFIG"

# Establish the complete master repo folder symlink
ln -s "$REPO_DIR" "$TARGET_CONFIG"

echo "✨ System linked!"
