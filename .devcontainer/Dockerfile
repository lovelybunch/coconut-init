# Simple single-stage Dockerfile for coconuts devcontainer
FROM node:20-alpine

# Install runtime dependencies and build tools for native modules
RUN apk add --no-cache \
    git \
    bash \
    curl \
    sudo \
    shadow \
    github-cli \
    python3 \
    py3-pip \
    make \
    g++ \
    gcc \
    libc-dev \
    linux-headers \
    xdg-utils

# Add sudo access for the existing node user
RUN echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Create necessary directories
RUN mkdir -p /workspaces/project && \
    chown -R node:node /workspaces/project

# Install coconuts and additional CLI tools globally from npm
RUN npm install -g coconuts \
    @google/gemini-cli \
    @anthropic-ai/claude-code \
    @openai/codex

# Switch to non-root user (node user exists in node:20-alpine)
USER node

# Set up environment variables
ENV NODE_ENV=development \
    SHELL=/bin/bash

# Set working directory
WORKDIR /workspaces/project

# Add a health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node --version && nut -V || exit 1

# Default command
CMD ["/bin/bash"]
