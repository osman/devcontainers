FROM mcr.microsoft.com/devcontainers/universal:linux

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

RUN apt-get update \
    && apt-get -y install --no-install-recommends build-essential curl git \
    && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    && brew install fzf netcat z autojump bat fd eza git-delta chroma jq yq \
    && brew install zsh antidote zsh-completions zsh-autosuggestions zsh-syntax-highlighting \
    && brew install neovim pnpm


COPY --chown=codespace:codespace /rootfs /

USER codespace
WORKDIR /home/codespace

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV HOMEBREW_NO_AUTO_UPDATE=1
ENV ZDOTDIR=/home/codespace/.config/zsh
ENV PNPM_HOME=/home/codespace/.config/pnpm
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/codespace/.nvm/versions/node/current/bin:${PNPM_HOME}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

RUN zsh -c '. "$(brew --prefix)/share/antidote/antidote.zsh" && antidote bundle <"${ZDOTDIR}/plugins.txt" >"${ZDOTDIR}/plugins.zsh"' \
    && rm "${ZDOTDIR}/plugins.txt" \
    && nvim --headless "+Lazy! sync" +qa \
    && chmod 700 .ssh \
    && chmod 644 .ssh/config \
    && source "${NVM_DIR}/nvm.sh" \
    && nvm use 20 \
    && pnpm install -g czg