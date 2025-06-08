#!/bin/bash

echo "🚀 Running install.sh from .dotfiles..."

# Run the full Flutter + Android + Firebase setup
bash "$HOME/.dotfiles/flutter_android_setup.sh"

# ──────────── GitHub CLI Login Prompt ────────────
if ! command -v gh &> /dev/null; then
    echo "⬇️ Installing GitHub CLI..."
    sudo apt-get update
    sudo apt-get install -y gh
fi

echo "🔐 Logging into GitHub CLI (for git commits/pushes)..."
gh auth login
