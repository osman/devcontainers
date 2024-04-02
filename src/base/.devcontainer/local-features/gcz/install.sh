#! /bin/bash
set -e

su - vscode <<EOF
set -e

PATH=${PATH}
PNPM_HOME=${PNPM_HOME}

source "${NVM_DIR}/nvm.sh"
nvm use 18
pnpm install -g czg
EOF