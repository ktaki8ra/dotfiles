#!/bin/sh

if [ "$(uname)" != "Darwin" ]; then
    echo "Not MacOS."
    exit 1
fi

if [ "$(uname -m)" = "arm64" ]; then
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi

xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [ "$(uname -m)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)" >> /dev/null
fi

brew update
brew bundle --file ./Brewfile
