#! /bin/bash
set -e

source "${NVM_DIR}/nvm.sh"
nvm install 18
nvm use 18
pnpm install -g czg