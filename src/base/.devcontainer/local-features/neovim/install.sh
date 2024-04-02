#! /bin/bash
set -e

su - vscode <<EOF
PATH=${PATH} nvim --headless "+Lazy! sync" +qa"
EOF