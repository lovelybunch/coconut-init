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

# Enable corepack for pnpm
RUN corepack enable && \
    corepack prepare pnpm@latest --activate

# Create necessary directories
RUN mkdir -p /workspaces/project && \
    chown -R node:node /workspaces/project

# Install coconuts and additional CLI tools globally from npm
RUN npm install -g coconuts \
    @google/gemini-cli \
    @anthropic-ai/claude-code \
    @openai/codex

# Copy in startup script while still root
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Switch to non-root user (node user exists in node:20-alpine)
USER node

# Set up environment variables
ENV NODE_ENV=development \
    SHELL=/bin/bash \
    HOSTNAME=0.0.0.0 \
    PORT=3020

# Set working directory
WORKDIR /workspaces/project

# Expose common development ports (consider 5173 8080 8000)
EXPOSE 3020 3021 

# Add a health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node --version && nut -V || exit 1

# Default command
CMD ["/bin/bash"]
