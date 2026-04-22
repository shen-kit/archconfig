# =================================================================================
# Install flutter and dependencies to run on a device without using Android Studio.
# No emulator support (requires Android Studio).
# 
# Installs flutter into ~/dev/flutter/ and the Android SDK into ~/Android/Sdk/
#
# Java 17 is required, use direnv for this
#
# ===== POST INSTALL =====
# 1. Add flutter bin to path permanently (e.g. .zshrc)
# 2. Add android env vars to path permanently
# 3. Install direnv for java versioning
# =================================================================================

# ===============
# Flutter
# ===============

sudo pacman -S --needed git unzip curl base-devel jdk17-openjdk

mkdir -p ~/dev
cd ~/dev
git clone https://github.com/flutter/flutter.git -b stable

export PATH="$HOME/dev/flutter/bin:$PATH"

# ===============
# Android Studio
# ===============

paru -S android-sdk-cmdline-tools-latest

export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

mkdir -p ~/Android/Sdk
cd ~/Android/Sdk

sdkmanager --sdk_root=$ANDROID_HOME \
  "platform-tools" \
  "platforms;android-36" \
  "build-tools;28.0.3" \
  "cmdline-tools;latest"

flutter config --android-sdk $ANDROID_HOME

flutter doctor --android-licenses
