#!/bin/bash

echo "🛠️ Enabling 32-bit architecture support..."
sudo dpkg --add-architecture i386
sudo apt-get update

echo "🧰 Installing system dependencies..."
sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 libbz2-1.0:i386 zlib1g:i386

echo "🚀 Running flutter_android_setup.sh..."

# ──────────── Flutter + Android + Firebase Setup ────────────
bash "$(dirname "$0")/flutter_android_setup.sh"

echo "✅ Setup complete. Flutter & Android environment ready!"
