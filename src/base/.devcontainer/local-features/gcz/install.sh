#! /bin/bash
set -e

su - vscode <<EOF
set -e

PATH=${PATH}

source "${NVM_DIR}/nvm.sh"
nvm use 18

PNPM_HOME=/home/vscode/.config/pnpm
pnpm install -g czg
EOF