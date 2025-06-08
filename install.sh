#!/bin/bash

# echo "📥 Cloning dotfiles repo..."
# git clone https://github.com/Sagar2006/.dotfiles

echo "🛠️ Enabling 32-bit architecture support..."
sudo dpkg --add-architecture i386
sudo apt-get update

echo "🧰 Installing system dependencies..."
sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 libbz2-1.0:i386 zlib1g:i386

echo "🚀 Running install.sh from .dotfiles..."

# ──────────── Flutter + Android + Firebase Setup ────────────
bash "$(dirname "$0")/flutter_android_setup.sh"

# ──────────── GitHub CLI Installation ────────────
if ! command -v gh &> /dev/null; then
    echo "⬇️ Installing GitHub CLI..."
    sudo apt-get update
    sudo apt-get install -y gh
fi

# ──────────── GitHub CLI Login ────────────
if [[ $- == *i* ]]; then
    echo "🔐 Interactive shell detected. Logging into GitHub CLI (via web browser)..."
    unset GITHUB_TOKEN
    gh auth login --hostname github.com --web
else
    echo "⚠️ Non-interactive shell. Skipping GitHub CLI login."
    echo "👉 After install completes, run: gh auth login --web"
fi

# ──────────── Git Identity Setup ────────────
echo "✍️ Configuring Git identity..."
git config --global user.name "Sagar2006"
git config --global user.email "sagarkumar2006@outlook.com"
echo "✅ Git identity set. You’re ready to push code!"

# ──────────── Optional: Cleanup .dotfiles Directory ────────────
# Uncomment the below block if you want to auto-delete the .dotfiles directory

# SCRIPT_DIR="$(dirname "$0")"
# if [[ "$SCRIPT_DIR" == *".dotfiles" ]]; then
#     echo "🧹 Removing .dotfiles directory at $SCRIPT_DIR"
#     rm -rf "$SCRIPT_DIR"
# else
#     echo "⚠️ Not removing directory. Unexpected script path: $SCRIPT_DIR"
# fi
