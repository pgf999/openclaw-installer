#!/bin/bash

INSTALL_DIR="${INSTALL_DIR:-$HOME/.openclaw}"

echo "🗑️  Uninstalling OpenClaw..."
echo "This will remove: $INSTALL_DIR"
read -p "Are you sure? (y/N) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Backup config
    if [ -f "$INSTALL_DIR/config.env" ]; then
        cp "$INSTALL_DIR/config.env" "$HOME/openclaw-config.env.backup"
        echo "✓ Config backed up to ~/openclaw-config.env.backup"
    fi
    
    # Remove directory
    rm -rf "$INSTALL_DIR"
    echo "✓ Removed $INSTALL_DIR"
    
    # Remove shell integration
    for rc in ~/.bashrc ~/.zshrc; do
        if [ -f "$rc" ]; then
            sed -i.bak '/# OpenClaw/,/source.*openclaw/d' "$rc" 2>/dev/null || true
        fi
    done
    
    echo "✅ Uninstall complete!"
    echo "Please restart your shell or run: source ~/.bashrc"
else
    echo "Cancelled."
fi
