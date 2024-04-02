FROM mcr.microsoft.com/devcontainers/base:bookworm

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

RUN apt-get update \
    && apt-get -y install --no-install-recommends build-essential \
    && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    && brew install fzf netcat z autojump bat fd eza git-delta chroma jq yq antidote neovim pnpm

COPY --chown=vscode:vscode /rootfs /

USER vscode
WORKDIR /home/vscode

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV HOMEBREW_NO_AUTO_UPDATE=1
ENV ZDOTDIR=/home/vscode/.config/zsh
ENV PNPM_HOME=/home/vscode/.config/pnpm
ENV PATH=/home/linuxbrew/.linuxbrew/bin:${PNPM_HOME}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

RUN zsh -c 'source "$(brew --prefix)/share/antidote/antidote.zsh" && antidote bundle <"${ZDOTDIR}/plugins.txt" >"${ZDOTDIR}/plugins.zsh"' \
    && rm "${ZDOTDIR}/plugins.txt" \
    && bash -c 'nvim --headless "+Lazy! sync" +qa' \
    && chmod 700 .ssh \
    && chmod 644 .ssh/config \
    && bash -c 'source "${NVM_DIR}/nvm.sh" && nvm use 20 && pnpm install -g czg'