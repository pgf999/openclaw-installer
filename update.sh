#!/bin/bash
set -e

INSTALL_DIR="${INSTALL_DIR:-$HOME/.openclaw}"

echo "🔄 Updating OpenClaw..."

if [ ! -d "$INSTALL_DIR" ]; then
    echo "❌ OpenClaw not found. Please install first."
    exit 1
fi

# Backup config
if [ -f "$INSTALL_DIR/config.env" ]; then
    cp "$INSTALL_DIR/config.env" "$INSTALL_DIR/config.env.backup"
    echo "✓ Config backed up"
fi

# Update core
echo "Updating OpenClaw core..."
# cd "$INSTALL_DIR/core" && git pull

# Update skills
echo "Updating skills..."
for skill in "$INSTALL_DIR/workspace/skills"/*; do
    if [ -d "$skill/.git" ]; then
        echo "Updating $(basename $skill)..."
        cd "$skill" && git pull
    fi
done

echo "✅ Update complete!"
