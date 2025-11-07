FROM navdp:base2_sim
ARG https_proxy

RUN apt-get update                                  \
    && apt-get install -y --no-install-recommends   \
    git                                             \
    && rm -rf /var/lib/apt/lists/*

RUN export https_proxy=$https_proxy                         \
    && git clone https://github.com/isaac-sim/IsaacLab.git

COPY install.sh install.sh
