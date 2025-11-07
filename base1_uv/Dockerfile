FROM m.daocloud.io/nvcr.io/nvidia/isaac-sim:4.2.0

COPY --from=m.daocloud.io/ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
ENTRYPOINT []
WORKDIR /workspace

COPY ./uv.toml /etc/uv/uv.toml
RUN uv init -p 3.10 \
    && uv sync \
    && uv add pip
