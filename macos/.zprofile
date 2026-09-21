export EDITOR="nvim"
export VISUAL="nvim"

# Activate Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by Toolbox App
export PATH="$PATH:/Users/charleshs/Library/Application Support/JetBrains/Toolbox/scripts"

# Added by swiftly
. "/Users/charleshs/.swiftly/env.sh"

# local bin
export PATH="$HOME/.local/bin:$PATH"

# bun
export PATH="$HOME/.bun/bin:$PATH"

# Java for Android Studio
export JAVA_HOME="$HOME/Applications/Android Studio.app/Contents/jbr/Contents/Home"
case :$PATH: in
*":$JAVA_HOME/bin:"*) ;;
*) export PATH="$PATH:$JAVA_HOME/bin" ;;
esac

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
ANDROID_SDK_PATHS="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"
case :$PATH: in
*":$ANDROID_SDK_PATHS:"*) ;;
*) export PATH="$PATH:$ANDROID_SDK_PATHS" ;;
esac

# git-fuzzy
export GIT_FUZZY_BIN="$HOME/dotfiles/git-fuzzy/bin"
case ":$PATH:" in
*":$GIT_FUZZY_BIN:"*) ;;
*) export PATH="$GIT_FUZZY_BIN:$PATH" ;;
esac

# opencode
export PATH="$HOME/.opencode/bin:$PATH"
