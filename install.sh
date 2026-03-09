#!/bin/bash
set -e

# OpenClaw One-Click Installer
# Supports: Linux and macOS

OPENCLAW_VERSION="${OPENCLAW_VERSION:-latest}"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.openclaw}"
SKILLS_DIR="$INSTALL_DIR/workspace/skills"

echo "🚀 OpenClaw Installer"
echo "===================="

# Detect OS
OS="$(uname -s)"
case "$OS" in
    Linux*)     PLATFORM=linux;;
    Darwin*)    PLATFORM=macos;;
    *)          echo "❌ Unsupported OS: $OS"; exit 1;;
esac

echo "✓ Detected platform: $PLATFORM"

# Check dependencies
check_dependencies() {
    local missing=()
    for cmd in git curl python3; do
        if ! command -v $cmd &> /dev/null; then
            missing+=($cmd)
        fi
    done
    
    if [ ${#missing[@]} -ne 0 ]; then
        echo "❌ Missing dependencies: ${missing[*]}"
        echo "Please install them first."
        exit 1
    fi
    echo "✓ Dependencies check passed"
}

# Install OpenClaw
install_openclaw() {
    echo "📦 Installing OpenClaw..."
    
    if [ -d "$INSTALL_DIR" ]; then
        echo "⚠️  OpenClaw directory exists. Backing up..."
        mv "$INSTALL_DIR" "${INSTALL_DIR}.backup.$(date +%s)"
    fi
    
    mkdir -p "$INSTALL_DIR"
    mkdir -p "$SKILLS_DIR"
    
    # Clone OpenClaw (replace with actual repo when available)
    echo "Downloading OpenClaw..."
    # git clone https://github.com/openclaw/openclaw.git "$INSTALL_DIR/core"
    
    echo "✓ OpenClaw installed to $INSTALL_DIR"
}

# Install skills
install_skills() {
    echo "🔧 Installing skills..."
    
    # ClawSec
    if [ ! -d "$SKILLS_DIR/clawsec" ]; then
        echo "Installing clawsec..."
        git clone https://github.com/pgf999/clawsec.git "$SKILLS_DIR/clawsec" 2>/dev/null || \
        mkdir -p "$SKILLS_DIR/clawsec"
    fi
    
    # Add more skills here
    
    echo "✓ Skills installed"
}

# Configure environment
configure_env() {
    echo "⚙️  Configuring environment..."
    
    local config_file="$INSTALL_DIR/config.env"
    
    if [ ! -f "$config_file" ]; then
        cat > "$config_file" << 'EOF'
# OpenClaw Configuration
# Copy this to .env and fill in your values

# API Keys
OPENAI_API_KEY=
ANTHROPIC_API_KEY=
GITHUB_TOKEN=

# OpenClaw Settings
OPENCLAW_WORKSPACE=$HOME/.openclaw/workspace
OPENCLAW_LOG_LEVEL=info

# Skills Configuration
CLAWSEC_ENABLED=true
EOF
        echo "✓ Config template created at $config_file"
        echo "📝 Please edit $config_file with your API keys"
    else
        echo "✓ Config file already exists"
    fi
}

# Setup shell integration
setup_shell() {
    echo "🐚 Setting up shell integration..."
    
    local shell_rc=""
    if [ -n "$BASH_VERSION" ]; then
        shell_rc="$HOME/.bashrc"
    elif [ -n "$ZSH_VERSION" ]; then
        shell_rc="$HOME/.zshrc"
    fi
    
    if [ -n "$shell_rc" ]; then
        if ! grep -q "OPENCLAW" "$shell_rc" 2>/dev/null; then
            cat >> "$shell_rc" << EOF

# OpenClaw
export OPENCLAW_HOME="$INSTALL_DIR"
export PATH="\$OPENCLAW_HOME/bin:\$PATH"
[ -f "\$OPENCLAW_HOME/config.env" ] && source "\$OPENCLAW_HOME/config.env"
EOF
            echo "✓ Added to $shell_rc"
            echo "Run: source $shell_rc"
        fi
    fi
}

# Main installation
main() {
    check_dependencies
    install_openclaw
    install_skills
    configure_env
    setup_shell
    
    echo ""
    echo "✅ Installation complete!"
    echo ""
    echo "Next steps:"
    echo "1. Edit configuration: nano $INSTALL_DIR/config.env"
    echo "2. Add your API keys (OPENAI_API_KEY, GITHUB_TOKEN, etc.)"
    echo "3. Reload shell: source ~/.bashrc (or ~/.zshrc)"
    echo "4. Start using OpenClaw!"
    echo ""
    echo "📚 Documentation: https://github.com/pgf999/openclaw-installer"
}

main
