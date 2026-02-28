ARG IMAGE

FROM ${IMAGE}

RUN apt-get update && apt-get install -y \
    ca-certificates curl wget htop direnv gnupg python3-dev\
    nano vim less \
    screen tmux \
    tree unzip zip rsync \
    jq ripgrep fd-find \
    git git-lfs sudo zsh fish \
    openssl ffmpeg build-essential \
    fuse libfuse2 rclone \
    libnss3 libnspr4 libatk-bridge2.0-0 libxkbcommon0 libasound2t64 libatspi2.0-0 libgtk-3-0\
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:0.9 /uv  /usr/local/bin/uv
COPY --from=ghcr.io/astral-sh/uv:0.9 /uvx /usr/local/bin/uvx
RUN chmod +x /usr/local/bin/uv /usr/local/bin/uvx

COPY --from=ghcr.io/prefix-dev/pixi:0.64.0 /usr/local/bin/pixi /usr/local/bin/pixi

ARG AWS_MOUNTPOINT_S3_VERSION=1.22.0
RUN wget https://s3.amazonaws.com/mountpoint-s3-release/${AWS_MOUNTPOINT_S3_VERSION}/x86_64/mount-s3-${AWS_MOUNTPOINT_S3_VERSION}-x86_64.deb -O mount-s3.deb \
    && wget https://s3.amazonaws.com/mountpoint-s3-release/${AWS_MOUNTPOINT_S3_VERSION}/x86_64/mount-s3-${AWS_MOUNTPOINT_S3_VERSION}-x86_64.deb.asc -O mount-s3.deb.asc \
    && wget https://s3.amazonaws.com/mountpoint-s3-release/public_keys/KEYS -O public_key.asc \
    && gpg --import public_key.asc \
    && gpg --fingerprint mountpoint-s3@amazon.com | tr -d ' ' | grep -q "673FE4061506BB469A0EF857BE397A52B086DA5A" \
    && gpg --verify mount-s3.deb.asc mount-s3.deb \
    && apt-get install -y ./mount-s3.deb \
    && rm mount-s3.deb mount-s3.deb.asc public_key.asc

# mise binary install
ARG MISE_VERSION=v2026.1.8
RUN curl -fsSL -L \
    "https://github.com/jdx/mise/releases/download/${MISE_VERSION}/mise-${MISE_VERSION}-linux-x64" \
    -o /usr/local/bin/mise \
  && chmod +x /usr/local/bin/mise
