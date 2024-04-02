#! /bin/bash
set -e

su - vscode <<EOF
set -e

PATH=${PATH}
source "${NVM_DIR}/nvm.sh"
nvm use 18

mkdir -p "${PNPM_HOME}"
PNPM_HOME=${PNPM_HOME}
pnpm setup
pnpm install -g czg
EOF