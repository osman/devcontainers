FROM mcr.microsoft.com/devcontainers/universal:linux

ENV ZDOTDIR=/user/vscode/.zsh
ENV PNPM_HOME=/home/vscode/.pnpm
ENV PATH=/home/vscode/.nvm/versions/node/v${NODE_VERSION}/bin:/home/vscode/.yarn/bin:${PNPM_HOME}:$PATH

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends build-essential curl git \
    && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    && brew install fzf netcat z autojump bat fd eza git-delta chroma jq yq \
    && brew install zsh antidote zsh-completions zsh-autosuggestions zsh-syntax-highlighting \
    && brew install neovim \
    && zsh -c 'source "$(brew --prefix)/share/antidote/antidote.zsh" && antidote bundle <.zsh/plugins.txt >.zsh/plugins.zsh' \
    && rm .zsh/plugins.txt \
    && pnpm install -g czg \
    && chmod 700 /home/vscode/.ssh \
    && chmod 644 /home/vscode/.ssh/config

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8

COPY --chown=vscode:vscode /rootfs /