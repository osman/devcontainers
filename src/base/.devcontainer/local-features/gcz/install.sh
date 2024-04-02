#! /bin/bash
set -e

su - vscode <<EOF
set -e

PATH=${PATH}
source "${NVM_DIR}/nvm.sh"
nvm use 18

PNPM_HOME=${PNPM_HOME}
mkdir -p "${PNPM_HOME}"
pnpm install -g czg
EOF