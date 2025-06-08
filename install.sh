#!/bin/bash
git clone https://github.com/Sagar2006/.dotfiles
echo "🛠️ Enabling 32-bit architecture support..."
sudo dpkg --add-architecture i386
sudo apt-get update

echo "🧰 Installing system dependencies..."
sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 libbz2-1.0:i386 zlib1g:i386 ...

echo "🚀 Running install.sh from .dotfiles..."

# Run the Flutter + Android + Firebase environment setup
# bash "$HOME/.dotfiles/flutter_android_setup.sh"
bash "$(dirname "$0")/flutter_android_setup.sh"

# ──────────── GitHub CLI Login ────────────
if ! command -v gh &> /dev/null; then
    echo "⬇️ Installing GitHub CLI..."
    sudo apt-get update
    sudo apt-get install -y gh
fi

echo "🔐 Logging into GitHub CLI (for git commits/pushes)..."
unset GITHUB_TOKEN
gh auth login

# ──────────── Git Identity Setup ────────────
echo "✍️ Configuring Git identity..."
git config --global user.name "Sagar2006"
git config --global user.email "sagarkumar2006@outlook.com"

echo "✅ Git identity set. You’re ready to push code!"

# Safely remove .dotfiles folder
SCRIPT_DIR="$(dirname "$0")"

if [[ "$SCRIPT_DIR" == *".dotfiles" ]]; then
    echo "🧹 Removing .dotfiles directory at $SCRIPT_DIR"
    rm -rf "$SCRIPT_DIR"
else
    echo "⚠️ Not removing directory. Unexpected script path: $SCRIPT_DIR"
fi
