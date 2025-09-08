# Coconut DevContainer Template

A complete development environment template for [Coconut](https://coconut.dev) - the agent-centric software development platform where everyone is a first-class citizen in the development lifecycle.

## About Coconut

Coconut is built around three core principles:

- **Universal participation**: Everyone can directly contribute to the project's development and evolution
- **Agent-centric architecture**: AI agents operate at the center of the project within secure, isolated environments  
- **Integrated project context**: All context, knowledge, resources, and change proposals are stored alongside the code and managed under source control

## What's Included

This template provides a ready-to-use development environment with:

- 🐳 **Docker-based devcontainer** with Node.js 20 Alpine
- 🥥 **Coconut CLI** pre-installed globally
- 🛠️ **Development tools**: Git, GitHub CLI, Python, build essentials
- ⚙️ **VS Code configuration** with recommended extensions
- 📦 **Package manager**: pnpm enabled via corepack
- 🔧 **Automated setup script** for easy integration into existing projects

## Quick Start

### Option 1: Use this template directly

1. Click "Use this template" on GitHub
2. Clone your new repository
3. Open in VS Code and reopen in container
4. Start using Coconut: `nut --help`

### Option 2: Add to existing project

Run this one-liner in your project directory:

```bash
curl -fsSL https://raw.githubusercontent.com/lovelybunch/coconut-init/main/.devcontainer/setup-in-project.sh | bash
```

Then:
1. Open your project in VS Code
2. Press `F1` → "Dev Containers: Reopen in Container"
3. Initialize Coconut: `nut init`

## Development Environment

The devcontainer includes:

- **Ports**: 3020 (Coconut Dashboard), 3021 (Dev Server)
- **Extensions**: TypeScript, Prettier, Tailwind CSS, ESLint
- **Tools**: Coconut CLI, Gemini CLI, Claude Code, OpenAI Codex
- **User**: Non-root `node` user with sudo access

## Getting Started with Coconut

Once your devcontainer is running:

```bash
# Initialize Coconut in your project
nut init

# View available commands
nut --help

# Start the Coconut dashboard (if available)
nut dashboard
```

## Project Structure

```
.
├── .devcontainer/
│   ├── devcontainer.json    # VS Code devcontainer configuration
│   ├── Dockerfile          # Container image definition
│   └── setup-in-project.sh # Automated setup script
└── README.md               # This file
```

## Contributing

This template follows Coconut's agent-centric development principles. All contributions, whether from humans or AI agents, are welcome and treated as first-class citizens.

## License

MIT License - see the LICENSE file for details.
