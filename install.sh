#!/bin/bash
echo "🚀 Installazione dotfiles..."

# Brew
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Installa tutto dal Brewfile
brew bundle --file=Brewfile

# Copia configurazioni
cp zshrc ~/.zshrc
cp gitconfig ~/.gitconfig
mkdir -p ~/.config
cp starship.toml ~/.config/starship.toml

# iTerm2
cp iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

# Zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

echo "✅ Fatto! Riapri il terminale."
