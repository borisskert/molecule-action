FROM alpine:3.20

LABEL MAINTAINER="borisskert <boris.skert@gmail.com>"

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN apk add --no-cache --update \
    bash \
    git \
    docker \
    python3 \
    py3-pip \
    py3-virtualenv \
    build-base \
    libffi-dev \
    openssl-dev \
    python3-dev \
    cargo \
    && python3 -m venv $VIRTUAL_ENV \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir \
        ansible-core==2.18.1 \
        ansible==11.1.0 \
        ansible-compat \
        molecule==24.12.0 \
        ansible-lint==24.10.0 \
        yamllint==1.35.1 \
        molecule-plugins==23.5.3 \
        docker \
    && apk del build-base libffi-dev openssl-dev python3-dev cargo

ENV DOCKER_WORKDIR=/github/workspace
RUN mkdir -p $DOCKER_WORKDIR
WORKDIR $DOCKER_WORKDIR

COPY /docker/root /

ENTRYPOINT ["/entrypoint.sh"]
