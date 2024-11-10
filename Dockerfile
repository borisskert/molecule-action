FROM alpine:3.20

ENV PIPX_HOME=/root/.local/pipx
ENV PIPX_BIN_DIR=/root/.local/bin
ENV PATH=/root/.local/bin:$PATH

RUN apk add --no-cache \
    bash \
    python3 \
    py3-pip \
    py3-virtualenv \
    pipx \
    && pipx ensurepath

RUN pipx install --include-deps ansible-core==2.18.0 \
                                ansible==10.6.0 \
                                molecule==24.9.0 \
                                ansible-lint==24.9.2 \
                                yamllint==1.35.1 \
                                molecule-plugins==23.5.3 \
    && pipx inject --include-deps molecule \
                                  ansible-core \
                                  ansible \
                                  molecule \
                                  ansible-lint \
                                  yamllint \
                                  molecule-plugins

COPY /docker/root /

ENTRYPOINT ["/entrypoint.sh"]
