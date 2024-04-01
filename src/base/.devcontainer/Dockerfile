ARG VARIANT="bookworm"
ARG NPM_GLOBAL=/usr/local-share/npm-global

FROM buildpack-deps:${VARIANT}-curl


RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    man less bat exa tree fd-find ripgrep sd bc parallel jq tar gzip zip unzip 7zip xz-utils \
    libreadline8 golang-chroma tzdata locales ca-certificates ssh sshpass age git \
    htop curl wget strace stunnel dnsutils inetutils-ping inetutils-telnet tcpdump \
    zsh neovim shellcheck, shfmt zoxide dos2unix \
    ca-certificates-java libc-bin \
    mv "$(readlink -en $(which fdfind))" /usr/local/bin/fd; \
    mv "$(readlink -en $(which batcat))" /usr/local/bin/bat

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8

COPY --chown=vscode:vscode /rootfs /