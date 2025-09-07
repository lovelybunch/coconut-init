#!/bin/bash

# Script to set up Coconut devcontainer in another project
# Usage: curl -fsSL https://raw.githubusercontent.com/lovelybunch/coconut-init/main/.devcontainer/setup-in-project.sh | bash

set -e

echo "🥥 Setting up Coconut DevContainer in your project"
echo "=============================================="

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "⚠️  Warning: Not in a git repository. It's recommended to initialize git first."
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Check if .devcontainer already exists
if [ -d ".devcontainer" ]; then
    echo "⚠️  .devcontainer directory already exists!"
    read -p "Overwrite existing .devcontainer? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi
    rm -rf .devcontainer
fi

echo "📦 Creating .devcontainer directory..."
mkdir -p .devcontainer

echo "📥 Downloading Coconut devcontainer configuration..."

# Download the essential files from the coconut-init repository
BASE_URL="https://raw.githubusercontent.com/lovelybunch/coconut-init/main/.devcontainer"

# Download files
curl -fsSL "$BASE_URL/devcontainer.json" -o .devcontainer/devcontainer.json
curl -fsSL "$BASE_URL/Dockerfile" -o .devcontainer/Dockerfile

# Create a project-specific README
cat > .devcontainer/README.md << 'EOF'
# Coconut DevContainer for This Project

This project uses the Coconut devcontainer for development. Coconut is pre-installed from npm.

## Quick Start

1. **Build the container** (one-time setup):
   ```bash
   cd .devcontainer
   docker build -t coconut-devcontainer:latest .
   ```

2. **Open in VS Code**:
   - Press `F1` and select "Dev Containers: Reopen in Container"
   - Or click the green button in the bottom-left corner

3. **Use Coconut**:
   ```bash
   # Initialize Coconut in this project
   nut init
   
   # Run Coconut commands
   nut --help
   ```
EOF

echo ""
echo "✅ Coconut Devcontainer files installed successfully!"
echo ""
echo "📋 Next steps:"
echo ""
echo "1. Build the container image:"
echo "   cd .devcontainer"
echo "   docker build -t coconut-devcontainer:latest ."
echo ""
echo "2. Open in VS Code and reopen in container"
echo ""
echo "3. Once in the container, initialize a Coconut:"
echo "   nut init"
echo ""
echo "📚 See Coconut.dev documentation for more details"
