FROM m.daocloud.io/docker.io/ubuntu:22.04
COPY --from=m.daocloud.io/ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ARG https_proxy
ENTRYPOINT []
WORKDIR /workspace

COPY ./uv.toml /etc/uv/uv.toml
RUN uv init -p 3.10 \
    && uv sync \
    && uv add pip

COPY sources.list /etc/apt/sources.list
RUN apt-get update                                  \
    && apt-get install -y --no-install-recommends   \
    build-essential                                 \
    git                                             \
    && rm -rf /var/lib/apt/lists/*

RUN export https_proxy=$https_proxy                             \
    && git config --global http.sslverify false                 \
    && git clone https://github.com/InternRobotics/NavDP.git

COPY requirements.txt /workspace/NavDP/baselines/navdp/requirements.txt
RUN . .venv/bin/activate                \
    && cd NavDP/baselines/navdp/        \
    && pip install -r requirements.txt

RUN apt-get update                                  \
    && apt-get install -y --no-install-recommends   \
    libgl1                                          \
    libglib2.0-0                                    \
    && rm -rf /var/lib/apt/lists/*
