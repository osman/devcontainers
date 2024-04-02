#! /bin/bash
set -e

su - vscode <<'EOF'
nvim --headless "+Lazy! sync" +qa"
EOF