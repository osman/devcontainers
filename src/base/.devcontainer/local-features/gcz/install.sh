#! /bin/bash
set -e

su - vscode <<EOF
set -e

PATH=${PATH}
source "${NVM_DIR}/nvm.sh"
nvm  install 18
nvm use 18
pnpm install -g czg
EOF