#! /bin/bash
set -e

su - vscode <<EOF
PATH=${PATH}
set -e
nvim --headless "+Lazy! sync" +qa"
EOF