#!/bin/zsh

# Check if the operating system is macOS
if [[ "$(uname)" != "Darwin" ]]; then
    echo "This script is intended to run on macOS only. Exiting."
    exit 1
fi

# Script to install Homebrew and essential programs

# Function to check if Homebrew is installed
function check_homebrew_installed() {
    if ! command -v brew >/dev/null 2>&1; then
        return 1  # Homebrew is not installed
    else
        return 0  # Homebrew is installed
    fi
}

# Function to install Homebrew
function install_homebrew() {
    echo "Installing Homebrew..."
    # Run the official Homebrew installation script
    /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to the PATH
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
    echo "Homebrew installation completed."
}

echo "Checking if Homebrew is installed..."

if ! check_homebrew_installed; then
    echo "Homebrew is not installed."
    read "install_brew?Would you like to install Homebrew? (y/n): "
    if [[ "$install_brew" =~ ^[Yy]$ ]]; then
        install_homebrew
    else
        echo "Homebrew installation skipped. Exiting script."
        exit 1
    fi
else
    echo "Homebrew is already installed."
    brew update
fi

# Tap the Emacs Plus repository
echo "Tapping d12frosted/emacs-plus..."
brew tap d12frosted/emacs-plus

# Define command-line tools to install in cli_tools and GUI application in applications
cli_tools=(
    git
    ripgrep
    enchant
    clojure/tools/clojure
    python@3.13
)

casks=(
    firefox
)

# Install command-line tools
echo "Installing command-line tools..."
for tool in "${cli_tools[@]}"; do
    brew install "$tool"
done

# Install GUI programs via Homebrew Cask
echo "Installing casks..."
for cask in "${casks[@]}"; do
    brew install --cask "$cask"
done

# Install Emacs Plus separately with options
echo "Installing emacs-plus@29 with native compilation support..."
brew install emacs-plus@29 --with-native-comp

# Install Rust via rustup
echo "Checking if Rust is installed..."

if ! command -v rustc >/dev/null 2>&1; then
    echo "Rust is not installed. Installing Rust via rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
    
    echo "Rust installation completed."
else
    echo "Rust is already installed."
    rustup update
fi

# Install Haskell via GHCup
echo "Checking if Haskell is installed..."

if ! command -v ghc >/dev/null 2>&1; then
    echo "Haskell is not installed. Installing Haskell via GHCup..."
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

    echo "Haskell installation completed."
else
    echo "Haskell is already installed."
    ghcup upgrade
fi

echo "All installations are complete!"
