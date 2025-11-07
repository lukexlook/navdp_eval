FROM navdp:base3_lab_install
ARG https_proxy

RUN export https_proxy=$https_proxy                             \
    && git clone https://github.com/InternRobotics/NavDP.git

COPY sources.list /etc/apt/sources.list
RUN apt-get update                                  \
    && apt-get install -y --no-install-recommends   \
    build-essential                                 \
    && rm -rf /var/lib/apt/lists/*

RUN . .venv/bin/activate                \
    && cd NavDP                         \
    && pip install -r requirements.txt
