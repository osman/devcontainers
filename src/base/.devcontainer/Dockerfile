FROM mcr.microsoft.com/devcontainers/base:bookworm

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

RUN apt-get update \
    && apt-get -y install --no-install-recommends build-essential \
    && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
    && brew install fzf netcat z autojump bat fd eza git-delta chroma jq yq neovim

COPY --chown=vscode:vscode /rootfs /

USER vscode
WORKDIR /home/vscode

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8

ENV ZDOTDIR=/home/vscode/.config/zsh
ENV PNPM_HOME=/home/vscode/.config/pnpm
ENV HOMEBREW_NO_AUTO_UPDATE=1

ENV MANPATH="$MANPATH:/home/linuxbrew/.linuxbrew/share/man"
ENV INFOPATH="$INFOPATH:/home/linuxbrew/.linuxbrew/share/info"
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
ENV PATH=$PNPM_HOME:$PATH
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin/:$PATH

RUN chmod 700 .ssh && chmod 644 .ssh/config