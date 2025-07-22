FROM --platform=$BUILDPLATFORM golang:1.22-bookworm

# Set versions
ENV HUGO_VERSION=0.148.1
ENV SASS_VERSION=1.69.5

# Install base deps
RUN apt-get update && \
    apt-get install -y curl git unzip ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install Hugo Extended
ARG TARGETARCH
RUN set -eux; \
    case "${TARGETARCH}" in \
        amd64)  HUGO_ARCH="Linux-64bit";  SASS_ARCH="linux-x64" ;; \
        arm64)  HUGO_ARCH="Linux-ARM64";  SASS_ARCH="linux-arm64" ;; \
        *)      echo "Unsupported architecture: ${TARGETARCH}" && exit 1 ;; \
    esac && \
    # Hugo
    curl -L -o /tmp/hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_${HUGO_ARCH}.tar.gz && \
    mkdir -p /tmp/hugo && \
    tar -xzf /tmp/hugo.tar.gz -C /tmp/hugo && \
    mv /tmp/hugo/hugo /usr/local/bin/hugo && \
    chmod +x /usr/local/bin/hugo

# Dart Sass
ARG TARGETARCH
RUN set -eux; \
    case "${TARGETARCH}" in \
        amd64)  SASS_ARCH="linux-x64" ;; \
        arm64)  SASS_ARCH="linux-arm64" ;; \
        *)      echo "Unsupported arch ${TARGETARCH}" && exit 1 ;; \
    esac; \
    mkdir -p /opt/dart-sass; \
    curl -L -o /tmp/dart-sass.tar.gz https://github.com/sass/dart-sass/releases/download/${SASS_VERSION}/dart-sass-${SASS_VERSION}-${SASS_ARCH}.tar.gz && \
    tar -xzf /tmp/dart-sass.tar.gz --strip-components=1 -C /opt/dart-sass; \
    ln -sf /opt/dart-sass/sass /usr/local/bin/sass; \
    chmod +x /usr/local/bin/sass

# Confirm everything is working
RUN hugo version && go version && sass --version

WORKDIR /src
