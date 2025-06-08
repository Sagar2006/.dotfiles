#!/bin/bash

echo "🚀 Running install.sh from .dotfiles..."

# Run the Flutter + Android + Firebase environment setup
bash "$HOME/.dotfiles/flutter_android_setup.sh"

# ──────────── GitHub CLI Login ────────────
if ! command -v gh &> /dev/null; then
    echo "⬇️ Installing GitHub CLI..."
    sudo apt-get update
    sudo apt-get install -y gh
fi

echo "🔐 Logging into GitHub CLI (for git commits/pushes)..."
gh auth login

# ──────────── Git Identity Setup ────────────
echo "✍️ Configuring Git identity..."
git config --global user.name "Sagar2006"
git config --global user.email "sagarkumar2006@outlook.com"

echo "✅ Git identity set. You’re ready to push code!"
