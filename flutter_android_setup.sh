#!/bin/bash
set -e

echo "🧰 Installing system dependencies..."
sudo apt-get update
sudo apt-get install -y \
    curl \
    git \
    unzip \
    zip \
    xz-utils \
    libglu1-mesa \
    openjdk-17-jdk \
    wget \
    nodejs \
    npm \
    default-jdk \
    lib32stdc++6 \
    libc6:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    lib32z1 \
    libbz2-1.0:i386 \
    zlib1g:i386

# ──────────── Flutter ────────────
echo "📦 Installing Flutter..."
git clone https://github.com/flutter/flutter.git $HOME/flutter
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> $HOME/.bashrc
export PATH="$PATH:$HOME/flutter/bin"

# ──────────── Android SDK ────────────
echo "📦 Installing Android SDK..."
export ANDROID_HOME=$HOME/android-sdk
mkdir -p "$ANDROID_HOME/cmdline-tools"
cd "$ANDROID_HOME/cmdline-tools"
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdline-tools.zip
unzip -q cmdline-tools.zip
rm cmdline-tools.zip
mv cmdline-tools latest

export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
echo 'export ANDROID_HOME=$HOME/android-sdk' >> $HOME/.bashrc
echo 'export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin"' >> $HOME/.bashrc

yes | sdkmanager --licenses
sdkmanager \
    "platform-tools" \
    "platforms;android-33" \
    "build-tools;33.0.2" \
    "emulator" \
    "system-images;android-33;google_apis;x86_64"

# ──────────── Firebase CLI ────────────
echo "📦 Installing Firebase CLI..."
npm install -g firebase-tools

# ──────────── Validate ────────────
flutter doctor --android-licenses
flutter doctor

echo "✅ Flutter + Android + Firebase environment is ready!"
