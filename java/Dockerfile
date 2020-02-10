FROM gcr.io/cloud-builders/gcloud

RUN apt-get update
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get remove --purge icedtea-* openjdk-* -y

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates fontconfig locales \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_VERSION jdk-11.0.6+10

RUN set -eux; \
    ARCH="$(dpkg --print-architecture)"; \
    case "${ARCH}" in \
       aarch64|arm64) \
         ESUM='04b77f6754aed68528f39750c5cfd6a439190206aff216aa081d62a0e1a794fa'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.6%2B10/OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.6_10.tar.gz'; \
         ;; \
       armhf) \
         ESUM='ab5b76203e54fe7a5221535f6f407efa43153de029a746f60af3cffb7cb5080b'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.6%2B10/OpenJDK11U-jdk_arm_linux_hotspot_11.0.6_10.tar.gz'; \
         ;; \
       ppc64el|ppc64le) \
         ESUM='9247f0271744188489b0dd628cab90e76ca1f22fa3bbcdebd9bfc4f140908df5'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.6%2B10/OpenJDK11U-jdk_ppc64le_linux_hotspot_11.0.6_10.tar.gz'; \
         ;; \
       s390x) \
         ESUM='250fc79db2d6c70e655ff319e2db8ca205858bf82c9f30b040bda0c90cd9f583'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.6%2B10/OpenJDK11U-jdk_s390x_linux_hotspot_11.0.6_10.tar.gz'; \
         ;; \
       amd64|x86_64) \
         ESUM='330d19a2eaa07ed02757d7a785a77bab49f5ee710ea03b4ee2fa220ddd0feffc'; \
         BINARY_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.6%2B10/OpenJDK11U-jdk_x64_linux_hotspot_11.0.6_10.tar.gz'; \
         ;; \
       *) \
         echo "Unsupported arch: ${ARCH}"; \
         exit 1; \
         ;; \
    esac; \
    curl -LfsSo /tmp/openjdk.tar.gz ${BINARY_URL}; \
    echo "${ESUM} */tmp/openjdk.tar.gz" | sha256sum -c -; \
    mkdir -p /opt/java/openjdk; \
    cd /opt/java/openjdk; \
    tar -xf /tmp/openjdk.tar.gz --strip-components=1; \
    rm -rf /tmp/openjdk.tar.gz;

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"

ENTRYPOINT ["/builder/skaffold.bash"]
