ARG IMAGE

FROM ${IMAGE}

RUN apt-get update && apt-get install -y \
    curl wget \
    nano vim \
    screen tmux \
    git sudo zsh fish\
    openssl ffmpeg build-essential \
    libnss3 libnspr4 libatk-bridge2.0-0 libxkbcommon0 libasound2 libatspi2.0-0 libgtk-3-0\
    && rm -rf /var/lib/apt/lists/*


COPY --from=ghcr.io/astral-sh/uv:0.9 /uv  /usr/local/bin/uv
COPY --from=ghcr.io/astral-sh/uv:0.9 /uvx /usr/local/bin/uvx
RUN chmod +x /usr/local/bin/uv /usr/local/bin/uvx
