#!/bin/bash
echo "🚀 Starting Neovim Deployment Suite for Debian/Ubuntu..."

# System Dependencies Lifecycle
sudo apt update
echo "📦 Installing core binaries and language runtimes..."
sudo apt install -y neovim git curl build-essential ripgrep fd-find nodejs npm python3

# Automated Symbolic Linking Lifecycle
echo "🔗 Structuring runtime symbolic links..."
TARGET_CONFIG="$HOME/.config/nvim"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Ensure the local system global .config directory frame actually exists
mkdir -p "$HOME/.config"

# Safely eliminate any legacy directory clutter
rm -rf "$TARGET_CONFIG"

# Establish the complete master repo folder symlink
ln -s "$REPO_DIR" "$TARGET_CONFIG"

echo "✨ System linked!"
