ARG VARIANT="bookworm"
ARG NPM_GLOBAL=/usr/local-share/npm-global

FROM buildpack-deps:${VARIANT}-curl

ENV ZDOTDIR=/user/vscode/.zsh

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends build-essential curl git \
    && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    && brew install fzf netcat z autojump bat fd eza git-delta chroma jq yq \
    && brew install zsh antidote zsh-completions zsh-autosuggestions zsh-syntax-highlighting \
    && brew install neovim

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8

COPY --chown=vscode:vscode /rootfs /