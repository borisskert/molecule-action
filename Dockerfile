FROM alpine:3

MAINTAINER borisskert <boris.skert@gmail.com>

ENV CRYPTOGRAPHY_DONT_BUILD_RUST 1

RUN apk add --no-cache --update \
            --virtual \
                .build-deps \
                g++ \
                make \
                python3-dev \
                libffi-dev \
                openssl-dev \
                && \
    apk add --no-cache --update \
                python3 \
                py3-pip \
                docker \
                git \
                bash \
                && \
    pip3 install --upgrade pip && \
    pip3 install \
                molecule==3.3.3 \
                ansible \
                ansible-core==2.11.1 \
                ansible-lint==5.0.11 \
                yamllint==1.26.1 \
                docker \
                molecule-docker \
                && \
    apk del .build-deps \
                g++ \
                make \
                python3-dev \
                libffi-dev \
                openssl-dev \
                ;

ENV DOCKER_WORKDIR /github/workspace

WORKDIR $DOCKER_WORKDIR

COPY /docker/root /

ENTRYPOINT ["/entrypoint.sh"]
